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
                           00001C   196 ADDWX   =     0x1C    ; opcode for ADDW X,#word  
                           0000CC   197 JPIMM   =     0xCC    ; JP addr opcode 
                                    198 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 5.
Hexadecimal [24-Bits]



                                    199         .macro _ledon
                                    200         .if NUCLEO
                                    201         bset PC_ODR,#LED2_BIT
                                    202         .else ;DISCOVERY 
                                    203         .if DISCOVERY
                                    204         bres PD_ODR,#LD1_BIT 
                                    205         .endif
                                    206         .endif
                                    207         .endm
                                    208 
                                    209         .macro _ledoff
                                    210         .if NUCLEO 
                                    211         bres PC_ODR,#LED2_BIT
                                    212         .else ;DISCOVERY 
                                    213         .if DISCOVERY
                                    214         bset PD_ODR,#LD1_BIT 
                                    215         .endif 
                                    216         .endif
                                    217         .endm
                                    218 
                                    219 ;**********************************************************
                                    220         .area DATA (ABS)
      000000                        221         .org RAMBASE 
                                    222 ;**********************************************************
                                    223 
                                    224 ;**********************************************************
                                    225         .area SSEG (ABS) ; STACK
      001700                        226         .org 0x1700
      001700                        227         .ds 256 
                                    228 ; space for DATSTK,TIB and STACK         
                                    229 ;**********************************************************
                                    230 
                                    231 ;**********************************************************
                                    232         .area HOME ; vectors table
                                    233 ;**********************************************************
      008000 82 00 80 96            234 	int main	        ; reset
      008004 82 00 80 80            235 	int NonHandledInterrupt	; trap
      008008 82 00 80 80            236 	int NonHandledInterrupt	; irq0
      00800C 82 00 80 80            237 	int NonHandledInterrupt	; irq1
      008010 82 00 80 80            238 	int NonHandledInterrupt	; irq2
      008014 82 00 80 80            239 	int NonHandledInterrupt	; irq3
      008018 82 00 80 80            240 	int NonHandledInterrupt	; irq4
      00801C 82 00 80 80            241 	int NonHandledInterrupt	; irq5
      008020 82 00 80 80            242 	int NonHandledInterrupt	; irq6
      008024 82 00 80 80            243 	int NonHandledInterrupt	; irq7
      008028 82 00 80 80            244 	int NonHandledInterrupt	; irq8
      00802C 82 00 80 80            245 	int NonHandledInterrupt	; irq9
      008030 82 00 80 80            246 	int NonHandledInterrupt	; irq10
      008034 82 00 80 80            247 	int NonHandledInterrupt	; irq11
      008038 82 00 80 80            248 	int NonHandledInterrupt	; irq12
      00803C 82 00 80 80            249 	int NonHandledInterrupt	; irq13
      008040 82 00 80 80            250 	int NonHandledInterrupt	; irq14
      008044 82 00 80 80            251 	int NonHandledInterrupt	; irq15
      008048 82 00 80 80            252 	int NonHandledInterrupt	; irq16
      00804C 82 00 80 80            253 	int NonHandledInterrupt	; irq17
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 6.
Hexadecimal [24-Bits]



      008050 82 00 80 80            254 	int NonHandledInterrupt	; irq18
      008054 82 00 80 80            255 	int NonHandledInterrupt	; irq19
      008058 82 00 80 80            256 	int NonHandledInterrupt	; irq20
      00805C 82 00 80 80            257 	int NonHandledInterrupt	; irq21
      008060 82 00 80 80            258 	int NonHandledInterrupt	; irq22
      008064 82 00 80 85            259 	int Timer4Handler	; irq23
      008068 82 00 80 80            260 	int NonHandledInterrupt	; irq24
      00806C 82 00 80 80            261 	int NonHandledInterrupt	; irq25
      008070 82 00 80 80            262 	int NonHandledInterrupt	; irq26
      008074 82 00 80 80            263 	int NonHandledInterrupt	; irq27
      008078 82 00 80 80            264 	int NonHandledInterrupt	; irq28
      00807C 82 00 80 80            265 	int NonHandledInterrupt	; irq29
                                    266 
                                    267 ;**********************************************************
                                    268         .area CODE
                                    269 ;**********************************************************
                                    270 
                                    271 ; non handled interrupt reset MCU
      008080                        272 NonHandledInterrupt:
      008080 A6 80            [ 1]  273         ld a, #0x80
      008082 C7 50 D1         [ 1]  274         ld WWDG_CR,a ; WWDG_CR used to reset mcu
                                    275 	;iret
                                    276 
                                    277 ; used for milliseconds counter 
                                    278 ; MS is 16 bits counter 
      008085                        279 Timer4Handler:
      008085 72 5F 53 42      [ 1]  280 	clr TIM4_SR 
      008089 BE 30            [ 2]  281         ldw x,MS 
      00808B 5C               [ 1]  282         incw x 
      00808C BF 30            [ 2]  283         ldw MS,x
      00808E BE 32            [ 2]  284         ldw x,CNTDWN 
      008090 27 03            [ 1]  285         jreq 1$
      008092 5A               [ 2]  286         decw x 
      008093 BF 32            [ 2]  287         ldw CNTDWN,x 
      008095                        288 1$:         
      008095 80               [11]  289         iret 
                                    290 
                                    291 
                                    292 ;; Main entry points and COLD start data
      008096                        293 main:
                                    294 ; clear all RAM
      008096 AE 00 00         [ 2]  295 	ldw X,#RAMBASE
      008099                        296 clear_ram0:
      008099 7F               [ 1]  297 	clr (X)
      00809A 5C               [ 1]  298 	incw X
      00809B A3 17 FF         [ 2]  299 	cpw X,#RAM_END
      00809E 23 F9            [ 2]  300 	jrule clear_ram0
      0080A0 AE 17 FF         [ 2]  301         ldw x,#RPP
      0080A3 94               [ 1]  302         ldw sp,x
                                    303 ; set SEEDX and SEEDY to 1 
      0080A4 3C 39            [ 1]  304         inc SEEDX+1 
      0080A6 3C 3B            [ 1]  305         inc SEEDY+1          
      0080A8 CC 80 C9         [ 2]  306 	jp ORIG
                                    307 
                                    308 ; COLD initialize these variables.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 7.
Hexadecimal [24-Bits]



      0080AB                        309 UZERO:
      0080AB 00 0A                  310         .word      BASEE   ;BASE
      0080AD 00 00                  311         .word      0       ; floating point state 
      0080AF 00 00                  312         .word      0       ;tmp
      0080B1 00 00                  313         .word      0       ;>IN
      0080B3 00 00                  314         .word      0       ;#TIB
      0080B5 17 00                  315         .word      TIBB    ;TIB
      0080B7 94 B0                  316         .word      INTER   ;'EVAL
      0080B9 00 00                  317         .word      0       ;HLD
      0080BB B6 15                  318         .word      LASTN  ;CNTXT pointer
      0080BD 00 80                  319         .word      VAR_BASE   ;variables free space pointer 
      0080BF B6 80                  320         .word      app_space ; FLASH free space pointer 
      0080C1 B6 15                  321         .word      LASTN   ;LAST
      0080C3 00 00                  322         .word      0        ; OFFSET 
      0080C5 00 00                  323         .word      0       ; TFLASH
                                    324 ;       .word      0       ; URLAST   
      0080C7 00 00                  325 UEND:   .word      0
                                    326 
      0080C9                        327 ORIG:   
                                    328 ; initialize SP
      0080C9 AE 17 FF         [ 2]  329         LDW     X,#STACK  ;initialize return stack
      0080CC 94               [ 1]  330         LDW     SP,X
      0080CD BF 2E            [ 2]  331         LDW     RP0,X
      0080CF AE 16 80         [ 2]  332         LDW     X,#DATSTK ;initialize data stack
      0080D2 BF 2C            [ 2]  333         LDW     SP0,X
                           000001   334 .if NUCLEO        
                                    335 ; initialize PC_5 as output to control LED2
                                    336 ; added by Picatout 
      0080D4 72 1A 50 0D      [ 1]  337         bset PC_CR1,#LED2_BIT
      0080D8 72 1A 50 0E      [ 1]  338         bset PC_CR2,#LED2_BIT
      0080DC 72 1A 50 0C      [ 1]  339         bset PC_DDR,#LED2_BIT
                                    340 .endif 
                           000000   341 .if DISCOVERY
                                    342         bset PD_CR1,#LD1_BIT
                                    343         bset PD_CR2,#LD1_BIT
                                    344         bset PD_DDR,#LD1_BIT 
                                    345 .endif
      000060                        346         _ledoff
                           000001     1         .if NUCLEO 
      0080E0 72 1B 50 0A      [ 1]    2         bres PC_ODR,#LED2_BIT
                           000000     3         .else ;DISCOVERY 
                                      4         .if DISCOVERY
                                      5         bset PD_ODR,#LD1_BIT 
                                      6         .endif 
                                      7         .endif
                                    347 ; initialize clock to HSI
                                    348 ; no divisor 16Mhz 
                                    349 ; Added by Picatout 
      0080E4                        350 clock_init:
      0080E4 72 5F 50 C6      [ 1]  351         clr CLK_CKDIVR
      0080E8 72 12 50 C5      [ 1]  352 	bset CLK_SWCR,#CLK_SWCR_SWEN
                           000001   353 .if NUCLEO|DOORBELL
      0080EC A6 E1            [ 1]  354 	ld a,#CLK_SWR_HSI
                           000000   355 .else ; DISCOVERY as 16Mhz crystal
                                    356 	ld a,#CLK_SWR_HSE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 8.
Hexadecimal [24-Bits]



                                    357 .endif 
      0080EE C7 50 C4         [ 1]  358 	ld CLK_SWR,a
      0080F1 C1 50 C3         [ 1]  359 1$:	cp a,CLK_CMSR
      0080F4 26 FB            [ 1]  360 	jrne 1$
                                    361         
                                    362 ; initialize UART, 115200 8N1
      0080F6                        363 uart_init:
                           000001   364 .if NUCLEO 
      0080F6 72 14 50 C7      [ 1]  365 	bset CLK_PCKENR1,#CLK_PCKENR1_UART1
                                    366 	; configure tx pin
      0080FA 72 1A 50 02      [ 1]  367 	bset PA_DDR,#UART1_TX_PIN ; tx pin
      0080FE 72 1A 50 03      [ 1]  368 	bset PA_CR1,#UART1_TX_PIN ; push-pull output
      008102 72 1A 50 04      [ 1]  369 	bset PA_CR2,#UART1_TX_PIN ; fast output
                                    370 	; baud rate 115200 Fmaster=16Mhz  16000000/115200=139=0x8b
                           000000   371 .else ; DISCOVERY use UART2 
                                    372 	bset CLK_PCKENR1,#CLK_PCKENR1_UART2
                                    373 	; configure tx pin
                                    374 	bset PD_DDR,#UART2_TX_PIN ; tx pin
                                    375 	bset PD_CR1,#UART2_TX_PIN ; push-pull output
                                    376 	bset PD_CR2,#UART2_TX_PIN ; fast output
                                    377 .endif
                                    378 ; baud rate 115200 Fmaster=8Mhz  
      008106 35 0B 52 33      [ 1]  379 	mov UART_BRR2,#0x0b ; must be loaded first
      00810A 35 08 52 32      [ 1]  380 	mov UART_BRR1,#0x8
      00810E 35 0C 52 35      [ 1]  381 	mov UART_CR2,#((1<<UART_CR2_TEN)|(1<<UART_CR2_REN));|(1<<UART_CR2_RIEN))
                                    382 ; initialize timer4, used for millisecond interrupt  
      008112 35 07 53 45      [ 1]  383 	mov TIM4_PSCR,#7 ; prescale 128  
      008116 35 7D 53 46      [ 1]  384 	mov TIM4_ARR,#125 ; set for 1msec.
      00811A 35 05 53 40      [ 1]  385 	mov TIM4_CR1,#((1<<TIM4_CR1_CEN)|(1<<TIM4_CR1_URS))
      00811E 72 10 53 41      [ 1]  386 	bset TIM4_IER,#TIM4_IER_UIE 
                                    387 ; set TIM4 interrupt priority to highest
      008122 A6 3F            [ 1]  388         ld a,#~(IPR_MASK<<6)
      008124 C4 7F 75         [ 1]  389         and a,ITC_SPR6
      008127 AA C0            [ 1]  390         or a,#(IPR3<<6)
      008129 C7 7F 75         [ 1]  391         ld ITC_SPR6,a 
      00812C 9A               [ 1]  392         rim
      00812D CC 9C 6E         [ 2]  393         jp  COLD   ;default=MN1
                                    394 
                           000000   395         LINK=0 
                                    396 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;        
                                    397 ;; place MCU in sleep mode with
                                    398 ;; halt opcode 
                                    399 ;; BYE ( -- )
                                    400 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0000B0                        401         _HEADER BYE,3,"BYE"
      008130 00 00                    1         .word LINK 
                           0000B2     2         LINK=.
      008132 03                       3         .byte 3  
      008133 42 59 45                 4         .ascii "BYE"
      008136                          5         BYE:
      008136 8E               [10]  402         halt 
      008137 81               [ 4]  403         ret 
                                    404 
                                    405 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    406 ; Enable interrupts 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 9.
Hexadecimal [24-Bits]



                                    407 ; EI ( -- )
                                    408 ;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0000B8                        409         _HEADER EI,2,"EI"
      008138 81 32                    1         .word LINK 
                           0000BA     2         LINK=.
      00813A 02                       3         .byte 2  
      00813B 45 49                    4         .ascii "EI"
      00813D                          5         EI:
      00813D 9A               [ 1]  410         rim 
      00813E 81               [ 4]  411         ret 
                                    412 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    413 ; Disable interrupts
                                    414 ; DI ( -- )
                                    415 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      0000BF                        416         _HEADER DI,2,"DI"
      00813F 81 3A                    1         .word LINK 
                           0000C1     2         LINK=.
      008141 02                       3         .byte 2  
      008142 44 49                    4         .ascii "DI"
      008144                          5         DI:
      008144 9B               [ 1]  417         sim 
      008145 81               [ 4]  418         ret 
                                    419 
                                    420 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    421 ; set interrupt priority level 
                                    422 ; SET-ISP ( n1 n2 -- )
                                    423 ; n1 level {1..3}
                                    424 ; n2 vector {0..29}
                                    425 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0000C6                        426         _HEADER SETISP,7,"SET-ISP"
      008146 81 41                    1         .word LINK 
                           0000C8     2         LINK=.
      008148 07                       3         .byte 7  
      008149 53 45 54 2D 49 53 50     4         .ascii "SET-ISP"
      008150                          5         SETISP:
      008150 90 93            [ 1]  427         ldw y,x 
      008152 90 FE            [ 2]  428         ldw y,(y)
      008154 A6 04            [ 1]  429         ld a,#4 ; 4 slot per register 
                                    430 ;  quotient select register, remainder select slot in register.        
      008156 90 62            [ 2]  431         div y,a ; register=ITC_SPR1[Y], lshift=2*A 
      008158 A4 03            [ 1]  432         and a,#3 
      00815A 48               [ 1]  433         sll a ; 2*SLOT  lshift 
      00815B 72 A9 7F 70      [ 2]  434         addw y,#ITC_SPR1 
      00815F FF               [ 2]  435         ldw (x),y  ; ( level reg -- )
      008160 90 5F            [ 1]  436         clrw y 
      008162 90 97            [ 1]  437         ld yl,a 
      008164 1D 00 02         [ 2]  438         subw x,#CELLL 
      008167 FF               [ 2]  439         ldw (x),y  ; ( level reg lshift -- )
      008168 90 93            [ 1]  440         ldw y,x 
      00816A 90 EE 02         [ 2]  441         ldw y,(2,y) 
      00816D 90 F6            [ 1]  442         ld a,(y)   ; reg_value
      00816F 1D 00 02         [ 2]  443         subw x,#CELLL 
      008172 FF               [ 2]  444         ldw (x),y ; ( level reg lshift rval -- )
      008173 CD 86 C2         [ 4]  445         call OVER ; ( level reg lshift rval lshift -- )
      008176 CD 84 F0         [ 4]  446         call DOLIT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 10.
Hexadecimal [24-Bits]



      008179 00 03                  447         .word 3
      00817B CD 86 AA         [ 4]  448         call SWAPP  ; ( level reg lshift rval 3 lshift )
      00817E CD 8C 41         [ 4]  449         call LSHIFT ; creat slot mask 
      008181 CD 88 F6         [ 4]  450         call INVER  ; ( level reg lshift rval mask )
      008184 CD 86 F7         [ 4]  451         call ANDD ; ( level reg lshift slot_masked )
      008187 CD 86 63         [ 4]  452         call TOR  ; ( level reg lshift -- R: slot_masked )
      00818A CD 88 5E         [ 4]  453         call ROT  ; ( reg lshift level )
      00818D CD 86 AA         [ 4]  454         call SWAPP ; ( reg level lshift )
      008190 CD 8C 41         [ 4]  455         call LSHIFT  ; ( reg slot_level -- )
      008193 CD 85 B5         [ 4]  456         call RFROM ; ( reg slot_level masked_val )
      008196 CD 87 0B         [ 4]  457         call ORR   ; ( reg updated_rval )
      008199 CD 86 AA         [ 4]  458         call SWAPP 
      00819C CC 85 71         [ 2]  459         jp CSTOR
                                    460 
                                    461 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    462 ; sélectionne l'application 
                                    463 ; qui démarre automatique lors 
                                    464 ; d'un COLD start 
                                    465 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00011F                        466         _HEADER AUTORUN,7,"AUTORUN"
      00819F 81 48                    1         .word LINK 
                           000121     2         LINK=.
      0081A1 07                       3         .byte 7  
      0081A2 41 55 54 4F 52 55 4E     4         .ascii "AUTORUN"
      0081A9                          5         AUTORUN:
      0081A9 CD 92 75         [ 4]  467         call TOKEN 
      0081AC CD 86 9A         [ 4]  468         call DUPP 
      0081AF CD 85 19         [ 4]  469         call QBRAN 
      0081B2 82 8F                  470         .word FORGET2
      0081B4 CD 93 72         [ 4]  471         call NAMEQ
      0081B7 CD 88 4D         [ 4]  472         call QDUP 
      0081BA CD 85 19         [ 4]  473         call QBRAN 
      0081BD 82 8F                  474         .word FORGET2
      00013F                        475         _DROP 
      0081BF 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      0081C2 1D 00 04         [ 2]  476         subw x,#2*CELLL 
      0081C5 90 5F            [ 1]  477         clrw y 
      0081C7 FF               [ 2]  478         ldw (x),y 
      0081C8 90 AE 40 02      [ 2]  479         ldw y,#APP_RUN 
      0081CC EF 02            [ 2]  480         ldw (2,x),y 
      0081CE CC 9F 6A         [ 2]  481         jp EESTORE 
                                    482 
                                    483 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    484 ;; Reset dictionary pointer before 
                                    485 ;; forgotten word. RAM space and 
                                    486 ;; interrupt vector defined after 
                                    487 ;; must be resetted also.
                                    488 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000151                        489         _HEADER FORGET,6,"FORGET"
      0081D1 81 A1                    1         .word LINK 
                           000153     2         LINK=.
      0081D3 06                       3         .byte 6  
      0081D4 46 4F 52 47 45 54        4         .ascii "FORGET"
      0081DA                          5         FORGET:
      0081DA CD 92 75         [ 4]  490         call TOKEN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 11.
Hexadecimal [24-Bits]



      0081DD CD 86 9A         [ 4]  491         call DUPP 
      0081E0 CD 85 19         [ 4]  492         call QBRAN 
      0081E3 82 8F                  493         .word FORGET2
      0081E5 CD 93 72         [ 4]  494         call NAMEQ ; ( a -- ca na | a F )
      0081E8 CD 88 4D         [ 4]  495         call QDUP 
      0081EB CD 85 19         [ 4]  496         call QBRAN 
      0081EE 82 8F                  497         .word FORGET2
                                    498 ; only forget users words 
      0081F0 CD 86 9A         [ 4]  499         call DUPP ; ( ca na na )
      0081F3 CD 84 F0         [ 4]  500         call DOLIT 
      0081F6 B6 80                  501         .word app_space 
      0081F8 CD 86 AA         [ 4]  502         call SWAPP 
      0081FB CD 89 91         [ 4]  503         call  ULESS 
      0081FE CD 85 19         [ 4]  504         call QBRAN 
      008201 82 51                  505         .word FORGET6 
                                    506 ; ( ca na -- )        
                                    507 ;reset ivec with address >= ca
      008203 CD 86 AA         [ 4]  508         call SWAPP ; ( na ca -- ) 
      008206 CD A1 6D         [ 4]  509         call CHKIVEC ; ( na -- ) 
                                    510 ; start at LAST and link back to na 
                                    511 ; if variable found reset VP at that point.
      008209                        512 FORGET1:
      008209 CD 88 0F         [ 4]  513         call LAST 
      00820C CD 85 64         [ 4]  514         call AT 
      00820F CD 86 9A         [ 4]  515         call DUPP  ; ( -- na last last )
      008212 CD 82 A5         [ 4]  516         call FREEVAR ; ( -- na last )
      008215 CD 86 9A         [ 4]  517         call DUPP 
      008218 CD 84 F0         [ 4]  518         call DOLIT 
      00821B 00 02                  519         .word 2 
      00821D CD 89 53         [ 4]  520         call SUBB ; ( na last -- na last lfa ) link address 
      008220 CD 85 64         [ 4]  521         call AT 
      008223 CD 86 9A         [ 4]  522         call DUPP ; ( -- na last a a )
      008226 CD 87 E3         [ 4]  523         call CNTXT 
      008229 CD 85 52         [ 4]  524         call STORE
      00822C CD 88 0F         [ 4]  525         call LAST  
      00822F CD 85 52         [ 4]  526         call STORE ; ( --  na last )
      008232 CD 86 C2         [ 4]  527         call OVER 
      008235 CD 89 7B         [ 4]  528         call EQUAL ; ( na last na -- na T|F ) 
      008238 CD 85 19         [ 4]  529         call QBRAN 
      00823B 82 09                  530         .word FORGET1 
                                    531 ; ( na -- )
      00823D CD 84 F0         [ 4]  532         call DOLIT 
      008240 00 02                  533         .word 2 
      008242 CD 89 53         [ 4]  534         call SUBB 
      008245 CD 87 FF         [ 4]  535         call CPP 
      008248 CD 85 52         [ 4]  536         call STORE  
      00824B CD 9D 9D         [ 4]  537         call UPDATCP 
      00824E CC 9D 74         [ 2]  538         jp UPDATLAST 
      008251                        539 FORGET6: ; tried to forget a RAM or system word 
                                    540 ; ( ca na -- )
      008251 1D 00 02         [ 2]  541         subw x,#CELLL 
      008254 90 BE 2C         [ 2]  542         ldw y,SP0 
      008257 FF               [ 2]  543         ldw (x),y  
      008258 CD 89 91         [ 4]  544         call ULESS
      00825B CD 85 19         [ 4]  545         call QBRAN 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 12.
Hexadecimal [24-Bits]



      00825E 82 81                  546         .word PROTECTED 
      008260 CD 94 7E         [ 4]  547         call ABORQ 
      008263 1D                     548         .byte 29
      008264 20 46 6F 72 20 52 41   549         .ascii " For RAM definition do REBOOT"
             4D 20 64 65 66 69 6E
             69 74 69 6F 6E 20 64
             6F 20 52 45 42 4F 4F
             54
      008281                        550 PROTECTED:
      008281 CD 94 7E         [ 4]  551         call ABORQ
      008284 0A                     552         .byte 10
      008285 20 50 72 6F 74 65 63   553         .ascii " Protected"
             74 65 64
      00828F                        554 FORGET2: ; no name or not found in dictionary 
      00828F CD 94 7E         [ 4]  555         call ABORQ
      008292 05                     556         .byte 5
      008293 20 77 68 61 74         557         .ascii " what"
      008298                        558 FORGET4:
      008298 CC 86 90         [ 2]  559         jp DROP 
                                    560 
                                    561 
                                    562 ;;;;;;;;;;;;;;;;;;;;;
                                    563 ; if na is variable 
                                    564 ; free variable data  
                                    565 ; FREEVAR ( na -- )
                                    566 ;;;;;;;;;;;;;;;;;;;;;;
      00021B                        567         _HEADER FREEVAR,7,"FREEVAR"
      00829B 81 D3                    1         .word LINK 
                           00021D     2         LINK=.
      00829D 07                       3         .byte 7  
      00829E 46 52 45 45 56 41 52     4         .ascii "FREEVAR"
      0082A5                          5         FREEVAR:
      0082A5 CD 86 9A         [ 4]  568         call DUPP ; ( na na -- )
      0082A8 CD 85 82         [ 4]  569         CALL CAT  ; ( na c -- )
      0082AB CD 8C 23         [ 4]  570         call ONEP ;
      0082AE CD 88 BD         [ 4]  571         CALL PLUS ; ( na c+1 -- ca ) 
      0082B1 CD 8C 23         [ 4]  572         call ONEP ; ( ca+ -- ) to get routne address 
      0082B4 CD 86 9A         [ 4]  573         call DUPP ; ( ca+ ca+ -- )
      0082B7 CD 85 64         [ 4]  574         CALL AT   ; ( ca+ fnaddr -- ) ; fnaddr is routine address 
      0082BA CD 84 F0         [ 4]  575         call DOLIT 
      0082BD 87 50                  576         .word DOVAR ; if routine address is DOVAR then variable 
      0082BF CD 89 7B         [ 4]  577         call EQUAL  ; ( ca+ fnaddr DOVAR -- ca+ T|F ) 
      0082C2 CD 85 19         [ 4]  578         call QBRAN 
      0082C5 82 DB                  579         .word FREEVAR4 
      0082C7 CD 84 F0         [ 4]  580         call DOLIT 
      0082CA 00 02                  581         .word 2 
      0082CC CD 88 BD         [ 4]  582         call PLUS  ; ( ca+ 2 -- da ) da is data address 
      0082CF CD 85 64         [ 4]  583         call AT 
      0082D2 CD 87 F1         [ 4]  584         call VPP   
      0082D5 CD 85 52         [ 4]  585         call STORE 
      0082D8 CC 9D B4         [ 2]  586         jp UPDATVP 
      0082DB                        587 FREEVAR4: ; not variable
      00025B                        588         _DROP 
      0082DB 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      0082DE 81               [ 4]  589         RET 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 13.
Hexadecimal [24-Bits]



                                    590 
                                    591 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    592 ;    SEED ( n -- )
                                    593 ; Initialize PRNG seed with n 
                                    594 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00025F                        595         _HEADER SEED,4,"SEED"
      0082DF 82 9D                    1         .word LINK 
                           000261     2         LINK=.
      0082E1 04                       3         .byte 4  
      0082E2 53 45 45 44              4         .ascii "SEED"
      0082E6                          5         SEED:
      0082E6 90 93            [ 1]  596         ldw y,x 
      0082E8 1C 00 02         [ 2]  597         addw x,#CELLL
      0082EB 90 FE            [ 2]  598         ldw y,(y)
      0082ED 90 9E            [ 1]  599         ld a,yh 
      0082EF B7 38            [ 1]  600         ld SEEDX,a 
      0082F1 90 9F            [ 1]  601         ld a,yl 
      0082F3 B7 3A            [ 1]  602         ld SEEDY,a 
      0082F5 81               [ 4]  603         ret 
                                    604 
                                    605 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    606 ;    RANDOM ( u1 -- u2 )
                                    607 ; Pseudo random number betwen 0 and u1-1
                                    608 ;  XOR32 algorithm 
                                    609 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000276                        610         _HEADER RANDOM,6,"RANDOM"
      0082F6 82 E1                    1         .word LINK 
                           000278     2         LINK=.
      0082F8 06                       3         .byte 6  
      0082F9 52 41 4E 44 4F 4D        4         .ascii "RANDOM"
      0082FF                          5         RANDOM:
                                    611 ;local variable 
                           000001   612         SPSAVE=1
                           000002   613         VSIZE=2 
      0082FF 52 02            [ 2]  614         sub sp,#VSIZE
      008301 1F 01            [ 2]  615         ldw (SPSAVE,sp),x  
                                    616 ; XTEMP=(SEEDX<<5)^SEEDX 
      008303 90 93            [ 1]  617         ldw y,x 
      008305 90 FE            [ 2]  618         ldw y,(y)
      008307 90 BF 26         [ 2]  619         ldw YTEMP,y 
      00830A BE 38            [ 2]  620 	ldw x,SEEDX 
      00830C 58               [ 2]  621 	sllw x 
      00830D 58               [ 2]  622 	sllw x 
      00830E 58               [ 2]  623 	sllw x 
      00830F 58               [ 2]  624 	sllw x 
      008310 58               [ 2]  625 	sllw x 
      008311 9E               [ 1]  626 	ld a,xh 
      008312 B8 38            [ 1]  627 	xor a,SEEDX 
      008314 B7 24            [ 1]  628 	ld XTEMP,a 
      008316 9F               [ 1]  629 	ld a,xl 
      008317 B8 39            [ 1]  630 	xor a,SEEDX+1 
      008319 B7 25            [ 1]  631 	ld XTEMP+1,a 
                                    632 ; SEEDX=SEEDY 
      00831B BE 3A            [ 2]  633 	ldw x,SEEDY 
      00831D BF 38            [ 2]  634 	ldw SEEDX,x  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 14.
Hexadecimal [24-Bits]



                                    635 ; SEEDY=SEEDY^(SEEDY>>1)
      00831F 54               [ 2]  636 	srlw x 
      008320 9E               [ 1]  637 	ld a,xh 
      008321 B8 3A            [ 1]  638 	xor a,SEEDY 
      008323 B7 3A            [ 1]  639 	ld SEEDY,a  
      008325 9F               [ 1]  640 	ld a,xl 
      008326 B8 3B            [ 1]  641 	xor a,SEEDY+1 
      008328 B7 3B            [ 1]  642 	ld SEEDY+1,a 
                                    643 ; XTEMP>>3 
      00832A BE 24            [ 2]  644 	ldw x,XTEMP 
      00832C 54               [ 2]  645 	srlw x 
      00832D 54               [ 2]  646 	srlw x 
      00832E 54               [ 2]  647 	srlw x 
                                    648 ; x=XTEMP^x 
      00832F 9E               [ 1]  649 	ld a,xh 
      008330 B8 24            [ 1]  650 	xor a,XTEMP 
      008332 95               [ 1]  651 	ld xh,a 
      008333 9F               [ 1]  652 	ld a,xl 
      008334 B8 25            [ 1]  653 	xor a,XTEMP+1  
      008336 97               [ 1]  654 	ld xl,a 
                                    655 ; SEEDY=x^SEEDY 
      008337 B8 3B            [ 1]  656 	xor a,SEEDY+1
      008339 97               [ 1]  657 	ld xl,a 
      00833A 9E               [ 1]  658 	ld a,xh 
      00833B B8 3A            [ 1]  659 	xor a,SEEDY
      00833D 95               [ 1]  660 	ld xh,a 
      00833E BF 3A            [ 2]  661 	ldw SEEDY,x 
                                    662 ; return SEEDY modulo YTEMP  
      008340 90 BE 26         [ 2]  663 	ldw y,YTEMP  
      008343 65               [ 2]  664 	divw x,y 
      008344 1E 01            [ 2]  665 	ldw x,(SPSAVE,sp)
      008346 FF               [ 2]  666         ldw (x),y 
      008347 5B 02            [ 2]  667         addw sp,#VSIZE 
      008349 81               [ 4]  668 	ret 
                                    669 
                                    670 
                                    671 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    672 ;; get millisecond counter 
                                    673 ;; msec ( -- u )
                                    674 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0002CA                        675         _HEADER MSEC,4,"MSEC"
      00834A 82 F8                    1         .word LINK 
                           0002CC     2         LINK=.
      00834C 04                       3         .byte 4  
      00834D 4D 53 45 43              4         .ascii "MSEC"
      008351                          5         MSEC:
      008351 1D 00 02         [ 2]  676         subw x,#CELLL 
      008354 90 BE 30         [ 2]  677         ldw y,MS 
      008357 FF               [ 2]  678         ldw (x),y 
      008358 81               [ 4]  679         ret 
                                    680 
                                    681 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    682 ; suspend execution for u msec 
                                    683 ;  pause ( u -- )
                                    684 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 15.
Hexadecimal [24-Bits]



      0002D9                        685         _HEADER PAUSE,5,"PAUSE"
      008359 83 4C                    1         .word LINK 
                           0002DB     2         LINK=.
      00835B 05                       3         .byte 5  
      00835C 50 41 55 53 45           4         .ascii "PAUSE"
      008361                          5         PAUSE:
      008361 90 93            [ 1]  686         ldw y,x
      008363 90 FE            [ 2]  687         ldw y,(y)
      008365 72 B9 00 30      [ 2]  688         addw y,MS 
      008369 8F               [10]  689 1$:     wfi  
      00836A 90 B3 30         [ 2]  690         cpw y,MS  
      00836D 26 FA            [ 1]  691         jrne 1$        
      00836F 1C 00 02         [ 2]  692         addw x,#CELLL 
      008372 81               [ 4]  693         ret 
                                    694 
                                    695 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    696 ; initialize count down timer 
                                    697 ;  TIMER ( u -- )  milliseconds
                                    698 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0002F3                        699         _HEADER TIMER,5,"TIMER"
      008373 83 5B                    1         .word LINK 
                           0002F5     2         LINK=.
      008375 05                       3         .byte 5  
      008376 54 49 4D 45 52           4         .ascii "TIMER"
      00837B                          5         TIMER:
      00837B 90 93            [ 1]  700         ldw y,x
      00837D 90 FE            [ 2]  701         ldw y,(y) 
      00837F 90 BF 32         [ 2]  702         ldw CNTDWN,y
      008382 1C 00 02         [ 2]  703         addw x,#CELLL 
      008385 81               [ 4]  704         ret 
                                    705 
                                    706 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    707 ; check for TIMER exiparition 
                                    708 ;  TIMEOUT? ( -- 0|-1 )
                                    709 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000306                        710         _HEADER TIMEOUTQ,8,"TIMEOUT?"
      008386 83 75                    1         .word LINK 
                           000308     2         LINK=.
      008388 08                       3         .byte 8  
      008389 54 49 4D 45 4F 55 54     4         .ascii "TIMEOUT?"
             3F
      008391                          5         TIMEOUTQ:
      008391 4F               [ 1]  711         clr a
      008392 1D 00 02         [ 2]  712         subw x,#CELLL 
      008395 90 BE 32         [ 2]  713         ldw y,CNTDWN 
      008398 26 01            [ 1]  714         jrne 1$ 
      00839A 43               [ 1]  715         cpl a 
      00839B E7 01            [ 1]  716 1$:     ld (1,x),a 
      00839D F7               [ 1]  717         ld (x),a 
      00839E 81               [ 4]  718         ret         
                                    719 
                                    720 ;;;;;;;;;;;;;;;;;;;;;
                                    721 ; reboot MCU 
                                    722 ; REBOOT ( -- )
                                    723 ;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 16.
Hexadecimal [24-Bits]



      00031F                        724         _HEADER reboot,6,"REBOOT"
      00839F 83 88                    1         .word LINK 
                           000321     2         LINK=.
      0083A1 06                       3         .byte 6  
      0083A2 52 45 42 4F 4F 54        4         .ascii "REBOOT"
      0083A8                          5         reboot:
      0083A8 CC 80 80         [ 2]  725         jp NonHandledInterrupt
                                    726 
                                    727 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    728 ; compile to flash memory 
                                    729 ; TO-FLASH ( -- )
                                    730 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      00032B                        731         _HEADER TOFLASH,8,"TO-FLASH"
      0083AB 83 A1                    1         .word LINK 
                           00032D     2         LINK=.
      0083AD 08                       3         .byte 8  
      0083AE 54 4F 2D 46 4C 41 53     4         .ascii "TO-FLASH"
             48
      0083B6                          5         TOFLASH:
      0083B6 CD 88 22         [ 4]  732         call RAMLAST 
      0083B9 CD 85 64         [ 4]  733         call AT 
      0083BC CD 88 4D         [ 4]  734         call QDUP 
      0083BF CD 85 19         [ 4]  735         call QBRAN
      0083C2 83 E5                  736         .word 1$
      0083C4 CD 94 7E         [ 4]  737         call ABORQ 
      0083C7 1D                     738         .byte 29
      0083C8 20 4E 6F 74 20 77 68   739         .ascii " Not while definitions in RAM"   
             69 6C 65 20 64 65 66
             69 6E 69 74 69 6F 6E
             73 20 69 6E 20 52 41
             4D
      0083E5 90 AE FF FF      [ 2]  740 1$:     ldw y,#-1 
      0083E9 90 BF 20         [ 2]  741         ldw UTFLASH,y
      0083EC 81               [ 4]  742         ret 
                                    743 
                                    744 ;;;;;;;;;;;;;;;;;;;;;;
                                    745 ; compile to RAM 
                                    746 ; TO-RAM ( -- )
                                    747 ;;;;;;;;;;;;;;;;;;;;;;
      00036D                        748         _HEADER TORAM,6,"TO-RAM"
      0083ED 83 AD                    1         .word LINK 
                           00036F     2         LINK=.
      0083EF 06                       3         .byte 6  
      0083F0 54 4F 2D 52 41 4D        4         .ascii "TO-RAM"
      0083F6                          5         TORAM:
      0083F6 90 5F            [ 1]  749         clrw y 
      0083F8 90 BF 20         [ 2]  750         ldw UTFLASH,y 
      0083FB 81               [ 4]  751         ret 
                                    752 
                                    753 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    754 ;; BAUD RATE constants table
                                    755 ; values to put in BRR1 & BRR2 
                                    756 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0083FC                        757 baudrate: 
      0083FC A0 1B                  758 	.byte 0xa0,0x1b ; 2400
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 17.
Hexadecimal [24-Bits]



      0083FE D0 05                  759 	.byte 0xd0,0x5  ; 4800 
      008400 68 03                  760 	.byte 0x68,0x3  ; 9600
      008402 34 01                  761 	.byte 0x34,0x1  ; 19200
      008404 11 06                  762 	.byte 0x11,0x6  ; 57600
      008406 08 0B                  763 	.byte 0x8,0xb   ; 115200
                                    764 
                                    765 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    766 ; BAUD RATE CONSTANTS names 
                                    767 ; 2400 baud  ( -- n )
                                    768 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000388                        769         _HEADER B2K4,4,"B2K4"
      008408 83 EF                    1         .word LINK 
                           00038A     2         LINK=.
      00840A 04                       3         .byte 4  
      00840B 42 32 4B 34              4         .ascii "B2K4"
      00840F                          5         B2K4:
      00840F 1D 00 02         [ 2]  770 	subw x,#CELLL 
      008412 90 5F            [ 1]  771         clrw y
      008414 FF               [ 2]  772         ldw (x),y
      008415 81               [ 4]  773 	ret
                                    774 
                                    775 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    776 ; 4800 baud	
                                    777 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000396                        778         _HEADER B4K8,4,"B4K8"
      008416 84 0A                    1         .word LINK 
                           000398     2         LINK=.
      008418 04                       3         .byte 4  
      008419 42 34 4B 38              4         .ascii "B4K8"
      00841D                          5         B4K8:
      00841D 1D 00 02         [ 2]  779         subw x,#CELLL 
      008420 90 AE 00 02      [ 2]  780         ldw y,#2 
      008424 FF               [ 2]  781         ldw (x),y
      008425 81               [ 4]  782         ret 
                                    783 
                                    784 ;;;;;;;;;;;;;;;;;;;;
                                    785 ; 9600 baud
                                    786 ;;;;;;;;;;;;;;;;;;;;
      0003A6                        787         _HEADER B9K6,4,"B9K6"
      008426 84 18                    1         .word LINK 
                           0003A8     2         LINK=.
      008428 04                       3         .byte 4  
      008429 42 39 4B 36              4         .ascii "B9K6"
      00842D                          5         B9K6:
      00842D 1D 00 02         [ 2]  788         subw x,#CELLL 
      008430 90 AE 00 04      [ 2]  789         ldw y,#4 
      008434 FF               [ 2]  790         ldw (x),y 
      008435 81               [ 4]  791         ret 
                                    792 ;;;;;;;;;;;;;;
                                    793 ; 19200 baud
                                    794 ;;;;;;;;;;;;;;
      0003B6                        795         _HEADER B19K2,5,"B19K2"
      008436 84 28                    1         .word LINK 
                           0003B8     2         LINK=.
      008438 05                       3         .byte 5  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 18.
Hexadecimal [24-Bits]



      008439 42 31 39 4B 32           4         .ascii "B19K2"
      00843E                          5         B19K2:
      00843E 1D 00 02         [ 2]  796         subw x,#CELLL
      008441 90 AE 00 06      [ 2]  797         ldw y,#6 
      008445 FF               [ 2]  798         ldw (x),y 
      008446 81               [ 4]  799         ret 
                                    800 ;;;;;;;;;;;;;;
                                    801 ; 57600 baud  
                                    802 ;;;;;;;;;;;;;;
      0003C7                        803         _HEADER B57K6,5,"B57K6"
      008447 84 38                    1         .word LINK 
                           0003C9     2         LINK=.
      008449 05                       3         .byte 5  
      00844A 42 35 37 4B 36           4         .ascii "B57K6"
      00844F                          5         B57K6:
      00844F 1D 00 02         [ 2]  804         subw x,#CELLL 
      008452 90 AE 00 08      [ 2]  805         ldw y,#8 
      008456 FF               [ 2]  806         ldw (x),y 
      008457 81               [ 4]  807         ret 
                                    808 ;;;;;;;;;;;;;;
                                    809 ; 115200 baud 
                                    810 ;;;;;;;;;;;;;;
      0003D8                        811         _HEADER B115K2,6,"B115K2"
      008458 84 49                    1         .word LINK 
                           0003DA     2         LINK=.
      00845A 06                       3         .byte 6  
      00845B 42 31 31 35 4B 32        4         .ascii "B115K2"
      008461                          5         B115K2:
      008461 1D 00 02         [ 2]  812 	subw x,#CELLL 
      008464 90 AE 00 0A      [ 2]  813         ldw y,#10 
      008468 FF               [ 2]  814         ldw (x),y 
      008469 81               [ 4]  815         ret 
                                    816 
                                    817 ;;;;;;;;;;;;;;;;;;;;;;;	
                                    818 ;; set UART2 BAUD rate
                                    819 ;	BAUD ( u -- )
                                    820 ;;;;;;;;;;;;;;;;;;;;;;;
      0003EA                        821         _HEADER BAUD,4,"BAUD"
      00846A 84 5A                    1         .word LINK 
                           0003EC     2         LINK=.
      00846C 04                       3         .byte 4  
      00846D 42 41 55 44              4         .ascii "BAUD"
      008471                          5         BAUD:
      008471 1D 00 02         [ 2]  822 	subw x,#CELLL
      008474 90 AE 83 FC      [ 2]  823         ldw y,#baudrate 
      008478 FF               [ 2]  824         ldw (x),y 
      008479 CD 88 BD         [ 4]  825         call PLUS
      00847C 90 93            [ 1]  826         ldw y,x  
      00847E 90 FE            [ 2]  827         ldw y,(y)
      008480 90 F6            [ 1]  828         ld a,(y)
      008482 88               [ 1]  829         push a 
      008483 90 5C            [ 1]  830         incw y 
      008485 90 F6            [ 1]  831         ld a,(y)
      008487 C7 52 33         [ 1]  832         ld UART_BRR2,a 
      00848A 84               [ 1]  833         pop a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 19.
Hexadecimal [24-Bits]



      00848B C7 52 32         [ 1]  834         ld UART_BRR1,a 
      00848E 1C 00 02         [ 2]  835         addw x,#CELLL 
      008491 81               [ 4]  836         ret 
                                    837 
                                    838 ;; Device dependent I/O
                                    839 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    840 ;       ?RX     ( -- c T | F )
                                    841 ;         Return input byte and true, or false.
                                    842 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000412                        843         _HEADER QKEY,4,"?KEY"
      008492 84 6C                    1         .word LINK 
                           000414     2         LINK=.
      008494 04                       3         .byte 4  
      008495 3F 4B 45 59              4         .ascii "?KEY"
      008499                          5         QKEY:
      008499 90 5F            [ 1]  844         CLRW Y 
      00849B 72 0B 52 30 0B   [ 2]  845         BTJF UART_SR,#UART_SR_RXNE,INCH   ;check status
      0084A0 C6 52 31         [ 1]  846         LD    A,UART_DR   ;get char in A
      0084A3 1D 00 02         [ 2]  847 	SUBW	X,#2
      0084A6 E7 01            [ 1]  848         LD     (1,X),A
      0084A8 7F               [ 1]  849 	CLR	(X)
      0084A9 90 53            [ 2]  850         CPLW     Y
      0084AB                        851 INCH:
      0084AB 1D 00 02         [ 2]  852 		SUBW	X,#2
      0084AE FF               [ 2]  853         LDW     (X),Y
      0084AF 81               [ 4]  854         RET
                                    855 
                                    856 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    857 ;       TX!     ( c -- )
                                    858 ;       Send character c to  output device.
                                    859 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000430                        860         _HEADER EMIT,4,"EMIT"
      0084B0 84 94                    1         .word LINK 
                           000432     2         LINK=.
      0084B2 04                       3         .byte 4  
      0084B3 45 4D 49 54              4         .ascii "EMIT"
      0084B7                          5         EMIT:
      0084B7 E6 01            [ 1]  861         LD     A,(1,X)
      0084B9 1C 00 02         [ 2]  862 	ADDW	X,#2
      0084BC 72 0F 52 30 FB   [ 2]  863 OUTPUT: BTJF UART_SR,#UART_SR_TXE,OUTPUT  ;loop until tx empty 
      0084C1 C7 52 31         [ 1]  864         LD    UART_DR,A   ;send A
      0084C4 81               [ 4]  865         RET
                                    866 
                                    867 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    868 ;       FC-XON  ( -- )
                                    869 ;       send XON character 
                                    870 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000445                        871         _HEADER FC_XON,6,"FC-XON"
      0084C5 84 B2                    1         .word LINK 
                           000447     2         LINK=.
      0084C7 06                       3         .byte 6  
      0084C8 46 43 2D 58 4F 4E        4         .ascii "FC-XON"
      0084CE                          5         FC_XON:
      0084CE 1D 00 02         [ 2]  872         subw x,#CELLL 
      0084D1 7F               [ 1]  873         clr (x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 20.
Hexadecimal [24-Bits]



      0084D2 A6 11            [ 1]  874         ld a,#XON 
      0084D4 E7 01            [ 1]  875         ld (1,x),a 
      0084D6 CD 84 B7         [ 4]  876         call EMIT 
      0084D9 81               [ 4]  877         ret 
                                    878 
                                    879 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    880 ;       FC-XOFF ( -- )
                                    881 ;       Send XOFF character 
                                    882 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00045A                        883         _HEADER FC_XOFF,7,"FC-XOFF"
      0084DA 84 C7                    1         .word LINK 
                           00045C     2         LINK=.
      0084DC 07                       3         .byte 7  
      0084DD 46 43 2D 58 4F 46 46     4         .ascii "FC-XOFF"
      0084E4                          5         FC_XOFF:
      0084E4 1D 00 02         [ 2]  884         subw x,#CELLL 
      0084E7 7F               [ 1]  885         clr (x)
      0084E8 A6 13            [ 1]  886         ld a,#XOFF 
      0084EA E7 01            [ 1]  887         ld (1,x),a 
      0084EC CD 84 B7         [ 4]  888         call EMIT 
      0084EF 81               [ 4]  889         ret
                                    890 
                                    891 ;; The kernel
                                    892 
                                    893 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    894 ;       doLIT   ( -- w )
                                    895 ;       Push an inline literal.
                                    896 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0084F0                        897 DOLIT:
      0084F0 1D 00 02         [ 2]  898 	SUBW X,#2
      0084F3 16 01            [ 2]  899         ldw y,(1,sp)
      0084F5 90 FE            [ 2]  900         ldw y,(y)
      0084F7 FF               [ 2]  901         ldw (x),y
      0084F8 90 85            [ 2]  902         popw y 
      0084FA 90 EC 02         [ 2]  903         jp (2,y)
                                    904 
                                    905 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    906 ;       NEXT    ( -- )
                                    907 ;       Code for  single index loop.
                                    908 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00047D                        909         _HEADER DONXT,COMPO+4,"NEXT"
      0084FD 84 DC                    1         .word LINK 
                           00047F     2         LINK=.
      0084FF 44                       3         .byte COMPO+4  
      008500 4E 45 58 54              4         .ascii "NEXT"
      008504                          5         DONXT:
      008504 16 03            [ 2]  910 	LDW Y,(3,SP)
      008506 90 5A            [ 2]  911 	DECW Y
      008508 2A 07            [ 1]  912 	JRPL NEX1 ; jump if N=0
      00850A 90 85            [ 2]  913 	POPW Y
      00850C 5B 02            [ 2]  914         addw sp,#2
      00850E 90 EC 02         [ 2]  915         JP (2,Y)
      008511                        916 NEX1:
      008511 17 03            [ 2]  917         LDW (3,SP),Y
      008513 90 85            [ 2]  918         POPW Y
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 21.
Hexadecimal [24-Bits]



      008515 90 FE            [ 2]  919 	LDW Y,(Y)
      008517 90 FC            [ 2]  920 	JP (Y)
                                    921 
                                    922 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    923 ;       ?branch ( f -- )
                                    924 ;       Branch if flag is zero.
                                    925 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    926 ;       _HEADER QBRAN,COMPO+7,"?BRANCH"        
      008519                        927 QBRAN:	
      008519 90 93            [ 1]  928         LDW Y,X
      00851B 1C 00 02         [ 2]  929 	ADDW X,#2
      00851E 90 FE            [ 2]  930 	LDW Y,(Y)
      008520 27 13            [ 1]  931         JREQ     BRAN
      008522 90 85            [ 2]  932 	POPW Y
      008524 90 EC 02         [ 2]  933 	JP (2,Y)
                                    934 
                                    935 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    936 ;  TBRANCH ( f -- )
                                    937 ;  branch if f==TRUE 
                                    938 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    939 ;        _HEADER TBRAN,COMPO+7,"TBRANCH"
      008527                        940 TBRAN: 
      008527 90 93            [ 1]  941         LDW Y,X 
      008529 1C 00 02         [ 2]  942         ADDW X,#2 
      00852C 90 FE            [ 2]  943         LDW Y,(Y)
      00852E 26 05            [ 1]  944         JRNE BRAN 
      008530 90 85            [ 2]  945         POPW Y 
      008532 90 EC 02         [ 2]  946         JP (2,Y)
                                    947 
                                    948 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    949 ;       branch  ( -- )
                                    950 ;       Branch to an inline address.
                                    951 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    952 ;       _HEADER BRAN,COMPO+6,"BRANCH"
      008535                        953 BRAN:
      008535 90 85            [ 2]  954         POPW Y
      008537 90 FE            [ 2]  955 	LDW Y,(Y)
      008539 90 FC            [ 2]  956         JP  (Y)
                                    957 
                                    958 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    959 ;       EXECUTE ( ca -- )
                                    960 ;       Execute  word at ca.
                                    961 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0004BB                        962         _HEADER EXECU,7,"EXECUTE"
      00853B 84 FF                    1         .word LINK 
                           0004BD     2         LINK=.
      00853D 07                       3         .byte 7  
      00853E 45 58 45 43 55 54 45     4         .ascii "EXECUTE"
      008545                          5         EXECU:
      008545 90 93            [ 1]  963         LDW Y,X
      008547 1C 00 02         [ 2]  964 	ADDW X,#CELLL 
      00854A 90 FE            [ 2]  965 	LDW  Y,(Y)
      00854C 90 FC            [ 2]  966         JP   (Y)
                                    967 
                           000001   968 OPTIMIZE = 1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 22.
Hexadecimal [24-Bits]



                           000001   969 .if OPTIMIZE 
                                    970 ; remplacement de CALL EXIT par 
                                    971 ; le opcode de RET.
                                    972 ; Voir modification au code de ";"
                           000000   973 .else 
                                    974 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    975 ;       EXIT    ( -- )
                                    976 ;       Terminate a colon definition.
                                    977 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    978 ;       _HEADER EXIT,4,"EXIT"
                                    979 EXIT:
                                    980         POPW Y
                                    981         RET
                                    982 .endif 
                                    983 
                                    984 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    985 ;       !       ( w a -- )
                                    986 ;       Pop  data stack to memory.
                                    987 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0004CE                        988         _HEADER STORE,1,"!"
      00854E 85 3D                    1         .word LINK 
                           0004D0     2         LINK=.
      008550 01                       3         .byte 1  
      008551 21                       4         .ascii "!"
      008552                          5         STORE:
      008552 90 93            [ 1]  989         LDW Y,X
      008554 90 FE            [ 2]  990         LDW Y,(Y)    ;Y=a
      008556 89               [ 2]  991         PUSHW X
      008557 EE 02            [ 2]  992         LDW X,(2,X) ; x=w 
      008559 90 FF            [ 2]  993         LDW (Y),X 
      00855B 85               [ 2]  994         POPW X  
      0004DC                        995         _DDROP 
      00855C 1C 00 04         [ 2]    1    ADDW X,#2*CELLL 
      00855F 81               [ 4]  996         RET     
                                    997 
                                    998 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    999 ;       @       ( a -- w )
                                   1000 ;       Push memory location to stack.
                                   1001 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0004E0                       1002         _HEADER AT,1,"@"
      008560 85 50                    1         .word LINK 
                           0004E2     2         LINK=.
      008562 01                       3         .byte 1  
      008563 40                       4         .ascii "@"
      008564                          5         AT:
      008564 90 93            [ 1] 1003         LDW Y,X     ;Y = a
      008566 90 FE            [ 2] 1004         LDW Y,(Y)   ; address 
      008568 90 FE            [ 2] 1005         LDW Y,(Y)   ; value 
      00856A FF               [ 2] 1006         LDW (X),Y ;w = @Y
      00856B 81               [ 4] 1007         RET     
                                   1008 
                                   1009 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1010 ;       C!      ( c b -- )
                                   1011 ;       Pop  data stack to byte memory.
                                   1012 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 23.
Hexadecimal [24-Bits]



      0004EC                       1013         _HEADER CSTOR,2,"C!"
      00856C 85 62                    1         .word LINK 
                           0004EE     2         LINK=.
      00856E 02                       3         .byte 2  
      00856F 43 21                    4         .ascii "C!"
      008571                          5         CSTOR:
      008571 90 93            [ 1] 1014         LDW Y,X
      008573 90 FE            [ 2] 1015 	LDW Y,(Y)    ;Y=b
      008575 E6 03            [ 1] 1016         LD A,(3,X)    ;D = c
      008577 90 F7            [ 1] 1017         LD  (Y),A     ;store c at b
      008579 1C 00 04         [ 2] 1018 	ADDW X,#4 ; DDROP 
      00857C 81               [ 4] 1019         RET     
                                   1020 
                                   1021 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1022 ;       C@      ( b -- c )
                                   1023 ;       Push byte in memory to  stack.
                                   1024 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0004FD                       1025         _HEADER CAT,2,"C@"
      00857D 85 6E                    1         .word LINK 
                           0004FF     2         LINK=.
      00857F 02                       3         .byte 2  
      008580 43 40                    4         .ascii "C@"
      008582                          5         CAT:
      008582 90 93            [ 1] 1026         LDW Y,X     ;Y=b
      008584 90 FE            [ 2] 1027         LDW Y,(Y)
      008586 90 F6            [ 1] 1028         LD A,(Y)
      008588 E7 01            [ 1] 1029         LD (1,X),A
      00858A 7F               [ 1] 1030         CLR (X)
      00858B 81               [ 4] 1031         RET     
                                   1032 
                                   1033 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1034 ;       RP@     ( -- a )
                                   1035 ;       Push current RP to data stack.
                                   1036 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00050C                       1037         _HEADER RPAT,3,"RP@"
      00858C 85 7F                    1         .word LINK 
                           00050E     2         LINK=.
      00858E 03                       3         .byte 3  
      00858F 52 50 40                 4         .ascii "RP@"
      008592                          5         RPAT:
      008592 90 96            [ 1] 1038         LDW Y,SP    ;save return addr
      008594 1D 00 02         [ 2] 1039         SUBW X,#2
      008597 FF               [ 2] 1040         LDW (X),Y
      008598 81               [ 4] 1041         RET     
                                   1042 
                                   1043 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1044 ;       RP!     ( a -- )
                                   1045 ;       Set  return stack pointer.
                                   1046 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000519                       1047         _HEADER RPSTO,COMPO+3,"RP!"
      008599 85 8E                    1         .word LINK 
                           00051B     2         LINK=.
      00859B 43                       3         .byte COMPO+3  
      00859C 52 50 21                 4         .ascii "RP!"
      00859F                          5         RPSTO:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 24.
Hexadecimal [24-Bits]



      00859F 90 85            [ 2] 1048         POPW Y
      0085A1 90 BF 26         [ 2] 1049         LDW YTEMP,Y
      0085A4 90 93            [ 1] 1050         LDW Y,X
      0085A6 90 FE            [ 2] 1051         LDW Y,(Y)
      0085A8 90 94            [ 1] 1052         LDW SP,Y
      0085AA 1C 00 02         [ 2] 1053         ADDW X,#CELLL ; a was not dropped, Picatout 2020-05-24
      0085AD 92 CC 26         [ 5] 1054         JP [YTEMP]
                                   1055 
                                   1056 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1057 ;       R>      ( -- w )
                                   1058 ;       Pop return stack to data stack.
                                   1059 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000530                       1060         _HEADER RFROM,2,"R>"
      0085B0 85 9B                    1         .word LINK 
                           000532     2         LINK=.
      0085B2 02                       3         .byte 2  
      0085B3 52 3E                    4         .ascii "R>"
      0085B5                          5         RFROM:
      0085B5 1D 00 02         [ 2] 1061         SUBW X,#CELLL 
      0085B8 16 03            [ 2] 1062         LDW Y,(3,SP)
      0085BA FF               [ 2] 1063         LDW (X),Y 
      0085BB 90 85            [ 2] 1064         POPW Y 
      0085BD 5B 02            [ 2] 1065         ADDW SP,#2 
      0085BF 90 FC            [ 2] 1066         JP (Y)
                                   1067 
                                   1068 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1069 ;       R@      ( -- w )
                                   1070 ;       Copy top of return stack to stack.
                                   1071 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000541                       1072         _HEADER RAT,2,"R@"
      0085C1 85 B2                    1         .word LINK 
                           000543     2         LINK=.
      0085C3 02                       3         .byte 2  
      0085C4 52 40                    4         .ascii "R@"
      0085C6                          5         RAT:
      0085C6 16 03            [ 2] 1073         ldw y,(3,sp)
      0085C8 1D 00 02         [ 2] 1074         subw x,#CELLL 
      0085CB FF               [ 2] 1075         ldw (x),y 
      0085CC 81               [ 4] 1076         ret 
                                   1077 
                                   1078 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1079 ;       LOCAL ( n -- )
                                   1080 ;       reserve n slots on return stack
                                   1081 ;       for local variables 
                                   1082 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00054D                       1083         _HEADER LOCAL,5,"LOCAL"
      0085CD 85 C3                    1         .word LINK 
                           00054F     2         LINK=.
      0085CF 05                       3         .byte 5  
      0085D0 4C 4F 43 41 4C           4         .ascii "LOCAL"
      0085D5                          5         LOCAL:
      0085D5 90 85            [ 2] 1084         POPW Y  
      0085D7 90 BF 26         [ 2] 1085         LDW YTEMP,Y ; RETURN ADDRESS 
      0085DA E6 01            [ 1] 1086         LD A,(1,X)
      0085DC 90 97            [ 1] 1087         LD YL,A 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 25.
Hexadecimal [24-Bits]



      0085DE A6 02            [ 1] 1088         LD A,#CELLL 
      0085E0 90 42            [ 4] 1089         MUL Y,A 
      0085E2 90 BF 24         [ 2] 1090         LDw XTEMP,Y
      0085E5 90 96            [ 1] 1091         LDW Y,SP 
      0085E7 72 B2 00 24      [ 2] 1092         SUBW Y,XTEMP
      0085EB 90 94            [ 1] 1093         LDW SP,Y 
      0085ED 1C 00 02         [ 2] 1094         ADDW X,#CELLL 
      0085F0 92 CC 26         [ 5] 1095         JP [YTEMP]
                                   1096 
                                   1097 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1098 ;       NRDROP ( n -- )
                                   1099 ;       drop n elements from rstack
                                   1100 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000573                       1101         _HEADER NRDROP,6,"NRDROP" 
      0085F3 85 CF                    1         .word LINK 
                           000575     2         LINK=.
      0085F5 06                       3         .byte 6  
      0085F6 4E 52 44 52 4F 50        4         .ascii "NRDROP"
      0085FC                          5         NRDROP:
      0085FC 90 85            [ 2] 1102         POPW Y 
      0085FE 90 BF 26         [ 2] 1103         LDW YTEMP,Y ; RETURN ADDRESS 
      008601 E6 01            [ 1] 1104         LD A,(1,X)
      008603 90 97            [ 1] 1105         LD YL,A  
      008605 A6 02            [ 1] 1106         LD A,#CELLL 
      008607 90 42            [ 4] 1107         MUL Y,A 
      008609 90 BF 24         [ 2] 1108         LDW XTEMP,Y 
      00860C 90 96            [ 1] 1109         LDW Y,SP 
      00860E 72 B9 00 24      [ 2] 1110         ADDW Y,XTEMP 
      008612 90 94            [ 1] 1111         LDW SP,Y  
      008614 1C 00 02         [ 2] 1112         ADDW X,#CELLL 
      008617 92 CC 26         [ 5] 1113         JP [YTEMP]
                                   1114 
                                   1115 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1116 ;        ( n -- w)
                                   1117 ;      fetch nth element ofr return stack 
                                   1118 ;      n==0 is same as R@ 
                                   1119 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00059A                       1120         _HEADER NRAT,3,"NR@"
      00861A 85 F5                    1         .word LINK 
                           00059C     2         LINK=.
      00861C 03                       3         .byte 3  
      00861D 4E 52 40                 4         .ascii "NR@"
      008620                          5         NRAT:
      008620 E6 01            [ 1] 1121         LD A,(1,X)
      008622 90 97            [ 1] 1122         LD YL,A 
      008624 A6 02            [ 1] 1123         LD A,#CELLL 
      008626 90 42            [ 4] 1124         MUL Y,A 
      008628 90 BF 26         [ 2] 1125         LDW YTEMP,Y 
      00862B 90 96            [ 1] 1126         LDW Y,SP 
      00862D 72 A9 00 03      [ 2] 1127         ADDW Y,#3 
      008631 72 B9 00 26      [ 2] 1128         ADDW Y,YTEMP 
      008635 90 FE            [ 2] 1129         LDW Y,(Y)
      008637 FF               [ 2] 1130         LDW (X),Y 
      008638 81               [ 4] 1131         RET 
                                   1132 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 26.
Hexadecimal [24-Bits]



                                   1133 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1134 ;       NR! ( w n --  )
                                   1135 ;       store w on nth position of 
                                   1136 ;       return stack 
                                   1137 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0005B9                       1138         _HEADER NRSTO,3,"NR!"
      008639 86 1C                    1         .word LINK 
                           0005BB     2         LINK=.
      00863B 03                       3         .byte 3  
      00863C 4E 52 21                 4         .ascii "NR!"
      00863F                          5         NRSTO:
      00863F 90 96            [ 1] 1139         LDW Y,SP
      008641 72 A9 00 03      [ 2] 1140         ADDW Y,#3 
      008645 90 BF 26         [ 2] 1141         LDW YTEMP,Y 
      008648 E6 01            [ 1] 1142         LD A,(1,X)
      00864A 90 97            [ 1] 1143         LD YL,A 
      00864C A6 02            [ 1] 1144         LD A,#CELLL 
      00864E 90 42            [ 4] 1145         MUL Y,A 
      008650 72 B9 00 26      [ 2] 1146         ADDW Y,YTEMP
      008654 89               [ 2] 1147         PUSHW X 
      008655 EE 02            [ 2] 1148         LDW X,(2,X)
      008657 90 FF            [ 2] 1149         LDW (Y),X
      008659 85               [ 2] 1150         POPW X 
      00865A 1C 00 04         [ 2] 1151         ADDW X,#2*CELLL 
      00865D 81               [ 4] 1152         RET 
                                   1153 
                                   1154 
                                   1155 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1156 ;       >R      ( w -- )
                                   1157 ;       Push data stack to return stack.
                                   1158 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0005DE                       1159         _HEADER TOR,COMPO+2,">R"
      00865E 86 3B                    1         .word LINK 
                           0005E0     2         LINK=.
      008660 42                       3         .byte COMPO+2  
      008661 3E 52                    4         .ascii ">R"
      008663                          5         TOR:
      008663 90 85            [ 2] 1160         POPW Y    ;save return addr
      008665 90 BF 26         [ 2] 1161         LDW YTEMP,Y
      008668 90 93            [ 1] 1162         LDW Y,X
      00866A 90 FE            [ 2] 1163         LDW Y,(Y)  ; W
      00866C 90 89            [ 2] 1164         PUSHW Y    ;W >R 
      00866E 1C 00 02         [ 2] 1165         ADDW X,#2
      008671 92 CC 26         [ 5] 1166         JP [YTEMP]
                                   1167 
                                   1168 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1169 ;       SP@     ( -- a )
                                   1170 ;       Push current stack pointer.
                                   1171 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0005F4                       1172         _HEADER SPAT,3,"SP@"
      008674 86 60                    1         .word LINK 
                           0005F6     2         LINK=.
      008676 03                       3         .byte 3  
      008677 53 50 40                 4         .ascii "SP@"
      00867A                          5         SPAT:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 27.
Hexadecimal [24-Bits]



      00867A 90 93            [ 1] 1173 	LDW Y,X
      00867C 1D 00 02         [ 2] 1174         SUBW X,#2
      00867F FF               [ 2] 1175 	LDW (X),Y
      008680 81               [ 4] 1176         RET     
                                   1177 
                                   1178 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1179 ;       SP!     ( a -- )
                                   1180 ;       Set  data stack pointer.
                                   1181 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000601                       1182         _HEADER SPSTO,3,"SP!"
      008681 86 76                    1         .word LINK 
                           000603     2         LINK=.
      008683 03                       3         .byte 3  
      008684 53 50 21                 4         .ascii "SP!"
      008687                          5         SPSTO:
      008687 FE               [ 2] 1183         LDW     X,(X)     ;X = a
      008688 81               [ 4] 1184         RET     
                                   1185 
                                   1186 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1187 ;       DROP    ( w -- )
                                   1188 ;       Discard top stack item.
                                   1189 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000609                       1190         _HEADER DROP,4,"DROP"
      008689 86 83                    1         .word LINK 
                           00060B     2         LINK=.
      00868B 04                       3         .byte 4  
      00868C 44 52 4F 50              4         .ascii "DROP"
      008690                          5         DROP:
      008690 1C 00 02         [ 2] 1191         ADDW X,#2     
      008693 81               [ 4] 1192         RET     
                                   1193 
                                   1194 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1195 ;       DUP     ( w -- w w )
                                   1196 ;       Duplicate  top stack item.
                                   1197 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000614                       1198         _HEADER DUPP,3,"DUP"
      008694 86 8B                    1         .word LINK 
                           000616     2         LINK=.
      008696 03                       3         .byte 3  
      008697 44 55 50                 4         .ascii "DUP"
      00869A                          5         DUPP:
      00869A 90 93            [ 1] 1199 	LDW Y,X
      00869C 1D 00 02         [ 2] 1200         SUBW X,#2
      00869F 90 FE            [ 2] 1201 	LDW Y,(Y)
      0086A1 FF               [ 2] 1202 	LDW (X),Y
      0086A2 81               [ 4] 1203         RET     
                                   1204 
                                   1205 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1206 ;       SWAP    ( w1 w2 -- w2 w1 )
                                   1207 ;       Exchange top two stack items.
                                   1208 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000623                       1209         _HEADER SWAPP,4,"SWAP"
      0086A3 86 96                    1         .word LINK 
                           000625     2         LINK=.
      0086A5 04                       3         .byte 4  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 28.
Hexadecimal [24-Bits]



      0086A6 53 57 41 50              4         .ascii "SWAP"
      0086AA                          5         SWAPP:
      0086AA 90 93            [ 1] 1210         LDW Y,X
      0086AC 90 FE            [ 2] 1211         LDW Y,(Y)
      0086AE 90 89            [ 2] 1212         PUSHW Y  
      0086B0 90 93            [ 1] 1213         LDW Y,X
      0086B2 90 EE 02         [ 2] 1214         LDW Y,(2,Y)
      0086B5 FF               [ 2] 1215         LDW (X),Y
      0086B6 90 85            [ 2] 1216         POPW Y 
      0086B8 EF 02            [ 2] 1217         LDW (2,X),Y
      0086BA 81               [ 4] 1218         RET     
                                   1219 
                                   1220 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1221 ;       OVER    ( w1 w2 -- w1 w2 w1 )
                                   1222 ;       Copy second stack item to top.
                                   1223 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00063B                       1224         _HEADER OVER,4,"OVER"
      0086BB 86 A5                    1         .word LINK 
                           00063D     2         LINK=.
      0086BD 04                       3         .byte 4  
      0086BE 4F 56 45 52              4         .ascii "OVER"
      0086C2                          5         OVER:
      0086C2 1D 00 02         [ 2] 1225         SUBW X,#2
      0086C5 90 93            [ 1] 1226         LDW Y,X
      0086C7 90 EE 04         [ 2] 1227         LDW Y,(4,Y)
      0086CA FF               [ 2] 1228         LDW (X),Y
      0086CB 81               [ 4] 1229         RET     
                                   1230 
                                   1231 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1232 ;       0<      ( n -- t )
                                   1233 ;       Return true if n is negative.
                                   1234 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00064C                       1235         _HEADER ZLESS,2,"0<"
      0086CC 86 BD                    1         .word LINK 
                           00064E     2         LINK=.
      0086CE 02                       3         .byte 2  
      0086CF 30 3C                    4         .ascii "0<"
      0086D1                          5         ZLESS:
      0086D1 A6 FF            [ 1] 1236         LD A,#0xFF
      0086D3 90 93            [ 1] 1237         LDW Y,X
      0086D5 90 FE            [ 2] 1238         LDW Y,(Y)
      0086D7 2B 01            [ 1] 1239         JRMI     ZL1
      0086D9 4F               [ 1] 1240         CLR A   ;false
      0086DA F7               [ 1] 1241 ZL1:    LD     (X),A
      0086DB E7 01            [ 1] 1242         LD (1,X),A
      0086DD 81               [ 4] 1243 	RET     
                                   1244 
                                   1245 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1246 ;       0= ( n -- f )
                                   1247 ;   n==0?
                                   1248 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00065E                       1249         _HEADER ZEQUAL,2,"0="
      0086DE 86 CE                    1         .word LINK 
                           000660     2         LINK=.
      0086E0 02                       3         .byte 2  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 29.
Hexadecimal [24-Bits]



      0086E1 30 3D                    4         .ascii "0="
      0086E3                          5         ZEQUAL:
      0086E3 A6 FF            [ 1] 1250         LD A,#0XFF 
      0086E5 90 93            [ 1] 1251         LDW Y,X 
      0086E7 90 FE            [ 2] 1252         LDW Y,(Y)
      0086E9 27 02            [ 1] 1253         JREQ ZEQU1 
      0086EB A6 00            [ 1] 1254         LD A,#0 
      0086ED                       1255 ZEQU1:  
      0086ED F7               [ 1] 1256         LD (X),A 
      0086EE E7 01            [ 1] 1257         LD (1,X),A         
      0086F0 81               [ 4] 1258         RET 
                                   1259 
                                   1260 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1261 ;       AND     ( w w -- w )
                                   1262 ;       Bitwise AND.
                                   1263 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000671                       1264         _HEADER ANDD,3,"AND"
      0086F1 86 E0                    1         .word LINK 
                           000673     2         LINK=.
      0086F3 03                       3         .byte 3  
      0086F4 41 4E 44                 4         .ascii "AND"
      0086F7                          5         ANDD:
      0086F7 F6               [ 1] 1265         LD  A,(X)    ;D=w
      0086F8 E4 02            [ 1] 1266         AND A,(2,X)
      0086FA E7 02            [ 1] 1267         LD (2,X),A
      0086FC E6 01            [ 1] 1268         LD A,(1,X)
      0086FE E4 03            [ 1] 1269         AND A,(3,X)
      008700 E7 03            [ 1] 1270         LD (3,X),A
      008702 1C 00 02         [ 2] 1271         ADDW X,#2
      008705 81               [ 4] 1272         RET
                                   1273 
                                   1274 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1275 ;       OR      ( w w -- w )
                                   1276 ;       Bitwise inclusive OR.
                                   1277 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000686                       1278         _HEADER ORR,2,"OR"
      008706 86 F3                    1         .word LINK 
                           000688     2         LINK=.
      008708 02                       3         .byte 2  
      008709 4F 52                    4         .ascii "OR"
      00870B                          5         ORR:
      00870B F6               [ 1] 1279         LD A,(X)    ;D=w
      00870C EA 02            [ 1] 1280         OR A,(2,X)
      00870E E7 02            [ 1] 1281         LD (2,X),A
      008710 E6 01            [ 1] 1282         LD A,(1,X)
      008712 EA 03            [ 1] 1283         OR A,(3,X)
      008714 E7 03            [ 1] 1284         LD (3,X),A
      008716 1C 00 02         [ 2] 1285         ADDW X,#2
      008719 81               [ 4] 1286         RET
                                   1287 
                                   1288 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1289 ;       XOR     ( w w -- w )
                                   1290 ;       Bitwise exclusive OR.
                                   1291 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00069A                       1292         _HEADER XORR,3,"XOR"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 30.
Hexadecimal [24-Bits]



      00871A 87 08                    1         .word LINK 
                           00069C     2         LINK=.
      00871C 03                       3         .byte 3  
      00871D 58 4F 52                 4         .ascii "XOR"
      008720                          5         XORR:
      008720 F6               [ 1] 1293         LD A,(X)    ;D=w
      008721 E8 02            [ 1] 1294         XOR A,(2,X)
      008723 E7 02            [ 1] 1295         LD (2,X),A
      008725 E6 01            [ 1] 1296         LD A,(1,X)
      008727 E8 03            [ 1] 1297         XOR A,(3,X)
      008729 E7 03            [ 1] 1298         LD (3,X),A
      00872B 1C 00 02         [ 2] 1299         ADDW X,#2
      00872E 81               [ 4] 1300         RET
                                   1301 
                                   1302 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1303 ;       UM+     ( u u -- udsum )
                                   1304 ;       Add two unsigned single
                                   1305 ;       and return a double sum.
                                   1306 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0006AF                       1307         _HEADER UPLUS,3,"UM+"
      00872F 87 1C                    1         .word LINK 
                           0006B1     2         LINK=.
      008731 03                       3         .byte 3  
      008732 55 4D 2B                 4         .ascii "UM+"
      008735                          5         UPLUS:
      008735 A6 01            [ 1] 1308         LD A,#1
      008737 90 93            [ 1] 1309         LDW Y,X
      008739 90 EE 02         [ 2] 1310         LDW Y,(2,Y)
      00873C 90 BF 26         [ 2] 1311         LDW YTEMP,Y
      00873F 90 93            [ 1] 1312         LDW Y,X
      008741 90 FE            [ 2] 1313         LDW Y,(Y)
      008743 72 B9 00 26      [ 2] 1314         ADDW Y,YTEMP
      008747 EF 02            [ 2] 1315         LDW (2,X),Y
      008749 25 01            [ 1] 1316         JRC     UPL1
      00874B 4F               [ 1] 1317         CLR A
      00874C E7 01            [ 1] 1318 UPL1:   LD     (1,X),A
      00874E 7F               [ 1] 1319         CLR (X)
      00874F 81               [ 4] 1320         RET
                                   1321 
                                   1322 ;; System and user variables
                                   1323 
                                   1324 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1325 ;       doVAR   ( -- a )
                                   1326 ;       run time code 
                                   1327 ;       for VARIABLE and CREATE.
                                   1328 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1329 ;       HEADER DOVAR,COMPO+5,"DOVAR"
      008750                       1330 DOVAR:
      008750 1D 00 02         [ 2] 1331 	SUBW X,#2
      008753 90 85            [ 2] 1332         POPW Y    ;get return addr (pfa)
      008755 90 FE            [ 2] 1333         LDW Y,(Y) ; indirect address 
      008757 FF               [ 2] 1334         LDW (X),Y    ;push on stack
      008758 81               [ 4] 1335         RET     ;go to RET of EXEC
                                   1336 
                                   1337 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 31.
Hexadecimal [24-Bits]



                                   1338 ;       BASE    ( -- a )
                                   1339 ;       Radix base for numeric I/O.
                                   1340 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0006D9                       1341         _HEADER BASE,4,"BASE"
      008759 87 31                    1         .word LINK 
                           0006DB     2         LINK=.
      00875B 04                       3         .byte 4  
      00875C 42 41 53 45              4         .ascii "BASE"
      008760                          5         BASE:
      008760 90 AE 00 06      [ 2] 1342 	LDW Y,#UBASE 
      008764 1D 00 02         [ 2] 1343 	SUBW X,#2
      008767 FF               [ 2] 1344         LDW (X),Y
      008768 81               [ 4] 1345         RET
                                   1346 
                                   1347 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1348 ;       tmp     ( -- a )
                                   1349 ;       A temporary storage.
                                   1350 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0006E9                       1351         _HEADER TEMP,3,"TMP"
      008769 87 5B                    1         .word LINK 
                           0006EB     2         LINK=.
      00876B 03                       3         .byte 3  
      00876C 54 4D 50                 4         .ascii "TMP"
      00876F                          5         TEMP:
      00876F 90 AE 00 0A      [ 2] 1352 	LDW Y,#UTMP
      008773 1D 00 02         [ 2] 1353 	SUBW X,#2
      008776 FF               [ 2] 1354         LDW (X),Y
      008777 81               [ 4] 1355         RET
                                   1356 
                                   1357 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1358 ;       >IN     ( -- a )
                                   1359 ;        Hold parsing pointer.
                                   1360 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0006F8                       1361         _HEADER INN,3,">IN"
      008778 87 6B                    1         .word LINK 
                           0006FA     2         LINK=.
      00877A 03                       3         .byte 3  
      00877B 3E 49 4E                 4         .ascii ">IN"
      00877E                          5         INN:
      00877E 90 AE 00 0C      [ 2] 1362 	LDW Y,#UINN 
      008782 1D 00 02         [ 2] 1363 	SUBW X,#2
      008785 FF               [ 2] 1364         LDW (X),Y
      008786 81               [ 4] 1365         RET
                                   1366 
                                   1367 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1368 ;       #TIB    ( -- a )
                                   1369 ;       Count in terminal input 
                                   1370 ;       buffer.
                                   1371 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000707                       1372         _HEADER NTIB,4,"#TIB"
      008787 87 7A                    1         .word LINK 
                           000709     2         LINK=.
      008789 04                       3         .byte 4  
      00878A 23 54 49 42              4         .ascii "#TIB"
      00878E                          5         NTIB:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 32.
Hexadecimal [24-Bits]



      00878E 90 AE 00 0E      [ 2] 1373 	LDW Y,#UCTIB 
      008792 1D 00 02         [ 2] 1374 	SUBW X,#2
      008795 FF               [ 2] 1375         LDW (X),Y
      008796 81               [ 4] 1376         RET
                                   1377 
                                   1378 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1379 ;       TBUF ( -- a )
                                   1380 ;       address of 128 bytes 
                                   1381 ;       transaction buffer
                                   1382 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000717                       1383         _HEADER TBUF,4,"TBUF"
      008797 87 89                    1         .word LINK 
                           000719     2         LINK=.
      008799 04                       3         .byte 4  
      00879A 54 42 55 46              4         .ascii "TBUF"
      00879E                          5         TBUF:
      00879E 90 AE 16 80      [ 2] 1384         ldw y,#ROWBUFF
      0087A2 1D 00 02         [ 2] 1385         subw x,#CELLL
      0087A5 FF               [ 2] 1386         ldw (x),y 
      0087A6 81               [ 4] 1387         ret 
                                   1388 
                                   1389 ; systeme variable 
                                   1390 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1391 ; compilation destination 
                                   1392 ; TFLASH ( -- A )
                                   1393 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000727                       1394         _HEADER TFLASH,6,"TFLASH"
      0087A7 87 99                    1         .word LINK 
                           000729     2         LINK=.
      0087A9 06                       3         .byte 6  
      0087AA 54 46 4C 41 53 48        4         .ascii "TFLASH"
      0087B0                          5         TFLASH:
      0087B0 1D 00 02         [ 2] 1395         subw x,#CELLL 
      0087B3 90 AE 00 20      [ 2] 1396         ldw y,#UTFLASH
      0087B7 FF               [ 2] 1397         ldw (x),y 
      0087B8 81               [ 4] 1398         ret 
                                   1399 
                                   1400 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1401 ;       "EVAL   ( -- a )
                                   1402 ;       Execution vector of EVAL.
                                   1403 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000739                       1404         _HEADER TEVAL,5,"'EVAL"
      0087B9 87 A9                    1         .word LINK 
                           00073B     2         LINK=.
      0087BB 05                       3         .byte 5  
      0087BC 27 45 56 41 4C           4         .ascii "'EVAL"
      0087C1                          5         TEVAL:
      0087C1 90 AE 00 12      [ 2] 1405 	LDW Y,#UINTER 
      0087C5 1D 00 02         [ 2] 1406 	SUBW X,#2
      0087C8 FF               [ 2] 1407         LDW (X),Y
      0087C9 81               [ 4] 1408         RET
                                   1409 
                                   1410 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1411 ;       HLD     ( -- a )
                                   1412 ;       Hold a pointer of output
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 33.
Hexadecimal [24-Bits]



                                   1413 ;        string.
                                   1414 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00074A                       1415         _HEADER HLD,3,"HLD"
      0087CA 87 BB                    1         .word LINK 
                           00074C     2         LINK=.
      0087CC 03                       3         .byte 3  
      0087CD 48 4C 44                 4         .ascii "HLD"
      0087D0                          5         HLD:
      0087D0 90 AE 00 14      [ 2] 1416 	LDW Y,#UHLD 
      0087D4 1D 00 02         [ 2] 1417 	SUBW X,#2
      0087D7 FF               [ 2] 1418         LDW (X),Y
      0087D8 81               [ 4] 1419         RET
                                   1420 
                                   1421 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1422 ;       CONTEXT ( -- a )
                                   1423 ;       Start vocabulary search.
                                   1424 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000759                       1425         _HEADER CNTXT,7,"CONTEXT"
      0087D9 87 CC                    1         .word LINK 
                           00075B     2         LINK=.
      0087DB 07                       3         .byte 7  
      0087DC 43 4F 4E 54 45 58 54     4         .ascii "CONTEXT"
      0087E3                          5         CNTXT:
      0087E3 90 AE 00 16      [ 2] 1426 	LDW Y,#UCNTXT
      0087E7 1D 00 02         [ 2] 1427 	SUBW X,#2
      0087EA FF               [ 2] 1428         LDW (X),Y
      0087EB 81               [ 4] 1429         RET
                                   1430 
                                   1431 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1432 ;       VP      ( -- a )
                                   1433 ;       Point to top of variables
                                   1434 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00076C                       1435         _HEADER VPP,2,"VP"
      0087EC 87 DB                    1         .word LINK 
                           00076E     2         LINK=.
      0087EE 02                       3         .byte 2  
      0087EF 56 50                    4         .ascii "VP"
      0087F1                          5         VPP:
      0087F1 90 AE 00 18      [ 2] 1436 	LDW Y,#UVP 
      0087F5 1D 00 02         [ 2] 1437 	SUBW X,#2
      0087F8 FF               [ 2] 1438         LDW (X),Y
      0087F9 81               [ 4] 1439         RET
                                   1440 
                                   1441 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1442 ;       CP    ( -- a )
                                   1443 ;       Pointer to top of FLASH 
                                   1444 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00077A                       1445         _HEADER CPP,2,"CP"
      0087FA 87 EE                    1         .word LINK 
                           00077C     2         LINK=.
      0087FC 02                       3         .byte 2  
      0087FD 43 50                    4         .ascii "CP"
      0087FF                          5         CPP:
      0087FF 90 AE 00 1A      [ 2] 1446         ldw y,#UCP 
      008803 1D 00 02         [ 2] 1447         subw x,#CELLL 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



      008806 FF               [ 2] 1448         ldw (x),y 
      008807 81               [ 4] 1449         ret                
                                   1450 
                                   1451 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1452 ;       LAST    ( -- a )
                                   1453 ;       Point to last name in 
                                   1454 ;       dictionary.
                                   1455 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000788                       1456         _HEADER LAST,4,"LAST"
      008808 87 FC                    1         .word LINK 
                           00078A     2         LINK=.
      00880A 04                       3         .byte 4  
      00880B 4C 41 53 54              4         .ascii "LAST"
      00880F                          5         LAST:
      00880F 90 AE 00 1C      [ 2] 1457 	LDW Y,#ULAST 
      008813 1D 00 02         [ 2] 1458 	SUBW X,#2
      008816 FF               [ 2] 1459         LDW (X),Y
      008817 81               [ 4] 1460         RET
                                   1461 
                                   1462 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1463 ; address of system variable URLAST 
                                   1464 ;       RAMLAST ( -- a )
                                   1465 ; RAM dictionary context 
                                   1466 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000798                       1467         _HEADER RAMLAST,7,"RAMLAST"
      008818 88 0A                    1         .word LINK 
                           00079A     2         LINK=.
      00881A 07                       3         .byte 7  
      00881B 52 41 4D 4C 41 53 54     4         .ascii "RAMLAST"
      008822                          5         RAMLAST:
      008822 90 AE 00 22      [ 2] 1468         ldw y,#URLAST 
      008826 1D 00 02         [ 2] 1469         subw x,#CELLL 
      008829 FF               [ 2] 1470         ldw (x),y 
      00882A 81               [ 4] 1471         ret 
                                   1472 
                                   1473 ;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1474 ;       OFFSET ( -- a )
                                   1475 ;       address of system 
                                   1476 ;       variable OFFSET 
                                   1477 ;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0007AB                       1478         _HEADER OFFSET,6,"OFFSET"
      00882B 88 1A                    1         .word LINK 
                           0007AD     2         LINK=.
      00882D 06                       3         .byte 6  
      00882E 4F 46 46 53 45 54        4         .ascii "OFFSET"
      008834                          5         OFFSET:
      008834 1D 00 02         [ 2] 1479         subw x,#CELLL
      008837 90 AE 00 1E      [ 2] 1480         ldw y,#UOFFSET 
      00883B FF               [ 2] 1481         ldw (x),y 
      00883C 81               [ 4] 1482         ret 
                                   1483 
                                   1484 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1485 ; adjust jump address 
                                   1486 ;  adding OFFSET
                                   1487 ; ADR-ADJ ( a -- a+offset )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



                                   1488 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00883D                       1489 ADRADJ: 
      00883D CD 88 34         [ 4] 1490         call OFFSET 
      008840 CD 85 64         [ 4] 1491         call AT 
      008843 CC 88 BD         [ 2] 1492         jp PLUS 
                                   1493 
                                   1494 
                                   1495 ;; Common functions
                                   1496 
                                   1497 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1498 ;       ?DUP    ( w -- w w | 0 )
                                   1499 ;       Dup tos if its is not zero.
                                   1500 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0007C6                       1501         _HEADER QDUP,4,"?DUP"
      008846 88 2D                    1         .word LINK 
                           0007C8     2         LINK=.
      008848 04                       3         .byte 4  
      008849 3F 44 55 50              4         .ascii "?DUP"
      00884D                          5         QDUP:
      00884D 90 93            [ 1] 1502         LDW Y,X
      00884F 90 FE            [ 2] 1503 	LDW Y,(Y)
      008851 27 04            [ 1] 1504         JREQ     QDUP1
      008853 1D 00 02         [ 2] 1505 	SUBW X,#CELLL 
      008856 FF               [ 2] 1506         LDW (X),Y
      008857 81               [ 4] 1507 QDUP1:  RET
                                   1508 
                                   1509 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1510 ;       ROT     ( w1 w2 w3 -- w2 w3 w1 )
                                   1511 ;       Rot 3rd item to top.
                                   1512 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0007D8                       1513         _HEADER ROT,3,"ROT"
      008858 88 48                    1         .word LINK 
                           0007DA     2         LINK=.
      00885A 03                       3         .byte 3  
      00885B 52 4F 54                 4         .ascii "ROT"
      00885E                          5         ROT:
      00885E 90 93            [ 1] 1514         ldw y,x 
      008860 90 FE            [ 2] 1515         ldw y,(y)
      008862 90 89            [ 2] 1516         pushw y 
      008864 90 93            [ 1] 1517         ldw y,x 
      008866 90 EE 04         [ 2] 1518         ldw y,(4,y)
      008869 FF               [ 2] 1519         ldw (x),y 
      00886A 90 93            [ 1] 1520         ldw y,x 
      00886C 90 EE 02         [ 2] 1521         ldw y,(2,y)
      00886F EF 04            [ 2] 1522         ldw (4,x),y 
      008871 90 85            [ 2] 1523         popw y 
      008873 EF 02            [ 2] 1524         ldw (2,x),y
      008875 81               [ 4] 1525         ret 
                                   1526 
                                   1527 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1528 ;    <ROT ( n1 n2 n3 -- n3 n1 n2 )
                                   1529 ;    rotate left 3 top elements 
                                   1530 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0007F6                       1531     _HEADER NROT,4,"<ROT"
      008876 88 5A                    1         .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 36.
Hexadecimal [24-Bits]



                           0007F8     2         LINK=.
      008878 04                       3         .byte 4  
      008879 3C 52 4F 54              4         .ascii "<ROT"
      00887D                          5         NROT:
      00887D 90 93            [ 1] 1532     LDW Y,X 
      00887F 90 FE            [ 2] 1533     LDW Y,(Y)
      008881 90 89            [ 2] 1534     PUSHW Y ; n3 >R 
      008883 90 93            [ 1] 1535     LDW Y,X 
      008885 90 EE 02         [ 2] 1536     LDW Y,(2,Y) ; Y = n2 
      008888 FF               [ 2] 1537     LDW (X),Y   ; TOS = n2 
      008889 90 93            [ 1] 1538     LDW Y,X    
      00888B 90 EE 04         [ 2] 1539     LDW Y,(4,Y) ; Y = n1 
      00888E EF 02            [ 2] 1540     LDW (2,X),Y ;   = n1 
      008890 90 85            [ 2] 1541     POPW Y  ; R> Y 
      008892 EF 04            [ 2] 1542     LDW (4,X),Y ; = n3 
      008894 81               [ 4] 1543     RET 
                                   1544 
                                   1545 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1546 ;       2DROP   ( w w -- )
                                   1547 ;       Discard two items on stack.
                                   1548 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000815                       1549         _HEADER DDROP,5,"2DROP"
      008895 88 78                    1         .word LINK 
                           000817     2         LINK=.
      008897 05                       3         .byte 5  
      008898 32 44 52 4F 50           4         .ascii "2DROP"
      00889D                          5         DDROP:
      00889D 1C 00 04         [ 2] 1550         ADDW X,#4
      0088A0 81               [ 4] 1551         RET
                                   1552 
                                   1553 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1554 ;       2DUP    ( w1 w2 -- w1 w2 w1 w2 )
                                   1555 ;       Duplicate top two items.
                                   1556 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000821                       1557         _HEADER DDUP,4,"2DUP"
      0088A1 88 97                    1         .word LINK 
                           000823     2         LINK=.
      0088A3 04                       3         .byte 4  
      0088A4 32 44 55 50              4         .ascii "2DUP"
      0088A8                          5         DDUP:
      0088A8 1D 00 04         [ 2] 1558         SUBW X,#4
      0088AB 90 93            [ 1] 1559         LDW Y,X
      0088AD 90 EE 06         [ 2] 1560         LDW Y,(6,Y)
      0088B0 EF 02            [ 2] 1561         LDW (2,X),Y
      0088B2 90 93            [ 1] 1562         LDW Y,X
      0088B4 90 EE 04         [ 2] 1563         LDW Y,(4,Y)
      0088B7 FF               [ 2] 1564         LDW (X),Y
      0088B8 81               [ 4] 1565         RET
                                   1566 
                                   1567 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1568 ;       +       ( w w -- sum )
                                   1569 ;       Add top two items.
                                   1570 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000839                       1571         _HEADER PLUS,1,"+"
      0088B9 88 A3                    1         .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 37.
Hexadecimal [24-Bits]



                           00083B     2         LINK=.
      0088BB 01                       3         .byte 1  
      0088BC 2B                       4         .ascii "+"
      0088BD                          5         PLUS:
      0088BD 90 93            [ 1] 1572         LDW Y,X
      0088BF 90 FE            [ 2] 1573         LDW Y,(Y)
      0088C1 90 BF 26         [ 2] 1574         LDW YTEMP,Y
      0088C4 1C 00 02         [ 2] 1575         ADDW X,#2
      0088C7 90 93            [ 1] 1576         LDW Y,X
      0088C9 90 FE            [ 2] 1577         LDW Y,(Y)
      0088CB 72 B9 00 26      [ 2] 1578         ADDW Y,YTEMP
      0088CF FF               [ 2] 1579         LDW (X),Y
      0088D0 81               [ 4] 1580         RET
                                   1581 
                                   1582 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1583 ;       TRUE ( -- -1 )
                                   1584 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000851                       1585         _HEADER TRUE,4,"TRUE"
      0088D1 88 BB                    1         .word LINK 
                           000853     2         LINK=.
      0088D3 04                       3         .byte 4  
      0088D4 54 52 55 45              4         .ascii "TRUE"
      0088D8                          5         TRUE:
      0088D8 A6 FF            [ 1] 1586         LD A,#255 
      0088DA 1D 00 02         [ 2] 1587         SUBW X,#CELLL
      0088DD F7               [ 1] 1588         LD (X),A 
      0088DE E7 01            [ 1] 1589         LD (1,X),A 
      0088E0 81               [ 4] 1590         RET 
                                   1591 
                                   1592 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1593 ;       FALSE ( -- 0 )
                                   1594 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000861                       1595         _HEADER FALSE,5,"FALSE"
      0088E1 88 D3                    1         .word LINK 
                           000863     2         LINK=.
      0088E3 05                       3         .byte 5  
      0088E4 46 41 4C 53 45           4         .ascii "FALSE"
      0088E9                          5         FALSE:
      0088E9 1D 00 02         [ 2] 1596         SUBW X,#CELLL 
      0088EC 7F               [ 1] 1597         CLR (X) 
      0088ED 6F 01            [ 1] 1598         CLR (1,X)
      0088EF 81               [ 4] 1599         RET 
                                   1600 
                                   1601 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1602 ;       NOT     ( w -- w )
                                   1603 ;       One's complement of tos.
                                   1604 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000870                       1605         _HEADER INVER,3,"NOT"
      0088F0 88 E3                    1         .word LINK 
                           000872     2         LINK=.
      0088F2 03                       3         .byte 3  
      0088F3 4E 4F 54                 4         .ascii "NOT"
      0088F6                          5         INVER:
      0088F6 90 93            [ 1] 1606         LDW Y,X
      0088F8 90 FE            [ 2] 1607         LDW Y,(Y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



      0088FA 90 53            [ 2] 1608         CPLW Y
      0088FC FF               [ 2] 1609         LDW (X),Y
      0088FD 81               [ 4] 1610         RET
                                   1611 
                                   1612 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1613 ;       NEGATE  ( n -- -n )
                                   1614 ;       Two's complement of tos.
                                   1615 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00087E                       1616         _HEADER NEGAT,6,"NEGATE"
      0088FE 88 F2                    1         .word LINK 
                           000880     2         LINK=.
      008900 06                       3         .byte 6  
      008901 4E 45 47 41 54 45        4         .ascii "NEGATE"
      008907                          5         NEGAT:
      008907 90 93            [ 1] 1617         LDW Y,X
      008909 90 FE            [ 2] 1618         LDW Y,(Y)
      00890B 90 50            [ 2] 1619         NEGW Y
      00890D FF               [ 2] 1620         LDW (X),Y
      00890E 81               [ 4] 1621         RET
                                   1622 
                                   1623 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1624 ;       DNEGATE ( d -- -d )
                                   1625 ;       Two's complement of double.
                                   1626 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00088F                       1627         _HEADER DNEGA,7,"DNEGATE"
      00890F 89 00                    1         .word LINK 
                           000891     2         LINK=.
      008911 07                       3         .byte 7  
      008912 44 4E 45 47 41 54 45     4         .ascii "DNEGATE"
      008919                          5         DNEGA:
      008919 90 93            [ 1] 1628         LDW Y,X
      00891B 90 FE            [ 2] 1629 	LDW Y,(Y)
      00891D 90 53            [ 2] 1630         CPLW Y
      00891F 90 89            [ 2] 1631         PUSHW Y      ; Y >R 
      008921 90 93            [ 1] 1632         LDW Y,X
      008923 90 EE 02         [ 2] 1633         LDW Y,(2,Y)
      008926 90 53            [ 2] 1634         CPLW Y
      008928 72 A9 00 01      [ 2] 1635         ADDW Y,#1
      00892C EF 02            [ 2] 1636         LDW (2,X),Y
      00892E 90 85            [ 2] 1637         POPW Y       ; R> Y  
      008930 24 02            [ 1] 1638         JRNC DN1 
      008932 90 5C            [ 1] 1639         INCW Y
      008934 FF               [ 2] 1640 DN1:    LDW (X),Y
      008935 81               [ 4] 1641         RET
                                   1642 
                                   1643 
                                   1644 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1645 ;       S>D ( n -- d )
                                   1646 ; convert single integer to double 
                                   1647 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0008B6                       1648         _HEADER STOD,3,"S>D"
      008936 89 11                    1         .word LINK 
                           0008B8     2         LINK=.
      008938 03                       3         .byte 3  
      008939 53 3E 44                 4         .ascii "S>D"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 39.
Hexadecimal [24-Bits]



      00893C                          5         STOD:
      00893C 1D 00 02         [ 2] 1649         SUBW X,#CELLL 
      00893F 7F               [ 1] 1650         CLR (X) 
      008940 6F 01            [ 1] 1651         CLR (1,X) 
      008942 90 93            [ 1] 1652         LDW Y,X 
      008944 90 EE 02         [ 2] 1653         LDW Y,(2,Y)
      008947 2A 05            [ 1] 1654         JRPL 1$
      008949 90 AE FF FF      [ 2] 1655         LDW Y,#-1 
      00894D FF               [ 2] 1656         LDW (X),Y 
      00894E 81               [ 4] 1657 1$:     RET 
                                   1658 
                                   1659 
                                   1660 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1661 ;       -       ( n1 n2 -- n1-n2 )
                                   1662 ;       Subtraction.
                                   1663 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0008CF                       1664         _HEADER SUBB,1,"-"
      00894F 89 38                    1         .word LINK 
                           0008D1     2         LINK=.
      008951 01                       3         .byte 1  
      008952 2D                       4         .ascii "-"
      008953                          5         SUBB:
      008953 90 93            [ 1] 1665         LDW Y,X
      008955 90 FE            [ 2] 1666         LDW Y,(Y) ; n2 
      008957 90 BF 26         [ 2] 1667         LDW YTEMP,Y 
      00895A 1C 00 02         [ 2] 1668         ADDW X,#CELLL 
      00895D 90 93            [ 1] 1669         LDW Y,X
      00895F 90 FE            [ 2] 1670         LDW Y,(Y) ; n1 
      008961 72 B2 00 26      [ 2] 1671         SUBW Y,YTEMP ; n1-n2 
      008965 FF               [ 2] 1672         LDW (X),Y
      008966 81               [ 4] 1673         RET
                                   1674 
                                   1675 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1676 ;       ABS     ( n -- n )
                                   1677 ;       Return  absolute value of n.
                                   1678 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0008E7                       1679         _HEADER ABSS,3,"ABS"
      008967 89 51                    1         .word LINK 
                           0008E9     2         LINK=.
      008969 03                       3         .byte 3  
      00896A 41 42 53                 4         .ascii "ABS"
      00896D                          5         ABSS:
      00896D 90 93            [ 1] 1680         LDW Y,X
      00896F 90 FE            [ 2] 1681 	LDW Y,(Y)
      008971 2A 03            [ 1] 1682         JRPL     AB1     ;negate:
      008973 90 50            [ 2] 1683         NEGW     Y     ;else negate hi byte
      008975 FF               [ 2] 1684         LDW (X),Y
      008976 81               [ 4] 1685 AB1:    RET
                                   1686 
                                   1687 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1688 ;       =       ( w w -- t )
                                   1689 ;       Return true if top two are equal.
                                   1690 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0008F7                       1691         _HEADER EQUAL,1,"="
      008977 89 69                    1         .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 40.
Hexadecimal [24-Bits]



                           0008F9     2         LINK=.
      008979 01                       3         .byte 1  
      00897A 3D                       4         .ascii "="
      00897B                          5         EQUAL:
      00897B A6 FF            [ 1] 1692         LD A,#0xFF  ;true
      00897D 90 93            [ 1] 1693         LDW Y,X    
      00897F 90 FE            [ 2] 1694         LDW Y,(Y)   ; n2 
      008981 1C 00 02         [ 2] 1695         ADDW X,#CELLL 
      008984 F3               [ 2] 1696         CPW Y,(X)   ; n1==n2
      008985 27 01            [ 1] 1697         JREQ EQ1 
      008987 4F               [ 1] 1698         CLR A 
      008988 F7               [ 1] 1699 EQ1:    LD (X),A
      008989 E7 01            [ 1] 1700         LD (1,X),A
      00898B 81               [ 4] 1701 	RET     
                                   1702 
                                   1703 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1704 ;       U<      ( u1 u2 -- f )
                                   1705 ;       Unsigned compare of top two items.
                                   1706 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00090C                       1707         _HEADER ULESS,2,"U<"
      00898C 89 79                    1         .word LINK 
                           00090E     2         LINK=.
      00898E 02                       3         .byte 2  
      00898F 55 3C                    4         .ascii "U<"
      008991                          5         ULESS:
      008991 A6 FF            [ 1] 1708         LD A,#0xFF  ;true
      008993 90 93            [ 1] 1709         LDW Y,X    
      008995 90 EE 02         [ 2] 1710         LDW Y,(2,Y) ; u1 
      008998 F3               [ 2] 1711         CPW Y,(X)   ; cpw u1  u2 
      008999 25 01            [ 1] 1712         JRULT     ULES1
      00899B 4F               [ 1] 1713         CLR A
      00899C 1C 00 02         [ 2] 1714 ULES1:  ADDW X,#CELLL 
      00899F F7               [ 1] 1715         LD (X),A
      0089A0 E7 01            [ 1] 1716         LD (1,X),A
      0089A2 81               [ 4] 1717 	RET     
                                   1718 
                                   1719 
                                   1720 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1721 ;       <       ( n1 n2 -- t )
                                   1722 ;       Signed compare of top two items.
                                   1723 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000923                       1724         _HEADER LESS,1,"<"
      0089A3 89 8E                    1         .word LINK 
                           000925     2         LINK=.
      0089A5 01                       3         .byte 1  
      0089A6 3C                       4         .ascii "<"
      0089A7                          5         LESS:
      0089A7 A6 FF            [ 1] 1725         LD A,#0xFF  ;true
      0089A9 90 93            [ 1] 1726         LDW Y,X    
      0089AB 90 EE 02         [ 2] 1727         LDW Y,(2,Y)  ; n1 
      0089AE F3               [ 2] 1728         CPW Y,(X)  ; n1 < n2 ? 
      0089AF 2F 01            [ 1] 1729         JRSLT     LT1
      0089B1 4F               [ 1] 1730         CLR A
      0089B2 1C 00 02         [ 2] 1731 LT1:    ADDW X,#CELLL 
      0089B5 F7               [ 1] 1732         LD (X),A
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



      0089B6 E7 01            [ 1] 1733         LD (1,X),A
      0089B8 81               [ 4] 1734 	RET     
                                   1735 
                                   1736 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1737 ;   U> ( u1 u2 -- f )
                                   1738 ;   f = true if u1>u2 
                                   1739 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000939                       1740         _HEADER UGREAT,2,"U>"
      0089B9 89 A5                    1         .word LINK 
                           00093B     2         LINK=.
      0089BB 02                       3         .byte 2  
      0089BC 55 3E                    4         .ascii "U>"
      0089BE                          5         UGREAT:
      0089BE A6 FF            [ 1] 1741         LD A,#255  
      0089C0 90 93            [ 1] 1742         LDW Y,X 
      0089C2 90 EE 02         [ 2] 1743         LDW Y,(2,Y)  ; u1 
      0089C5 F3               [ 2] 1744         CPW Y,(X)  ; u1 > u2 
      0089C6 22 01            [ 1] 1745         JRUGT UGREAT1 
      0089C8 4F               [ 1] 1746         CLR A   
      0089C9                       1747 UGREAT1:
      0089C9 1C 00 02         [ 2] 1748         ADDW X,#CELLL 
      0089CC F7               [ 1] 1749         LD (X),A 
      0089CD E7 01            [ 1] 1750         LD (1,X),A 
      0089CF 81               [ 4] 1751         RET 
                                   1752 
                                   1753 
                                   1754 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1755 ;       >   (n1 n2 -- f )
                                   1756 ;  signed compare n1 n2 
                                   1757 ;  true if n1 > n2 
                                   1758 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000950                       1759         _HEADER GREAT,1,">"
      0089D0 89 BB                    1         .word LINK 
                           000952     2         LINK=.
      0089D2 01                       3         .byte 1  
      0089D3 3E                       4         .ascii ">"
      0089D4                          5         GREAT:
      0089D4 A6 FF            [ 1] 1760         LD A,#0xFF ;
      0089D6 90 93            [ 1] 1761         LDW Y,X 
      0089D8 90 EE 02         [ 2] 1762         LDW Y,(2,Y)  ; n1 
      0089DB F3               [ 2] 1763         CPW Y,(X) ; n1 > n2 ?  
      0089DC 2C 01            [ 1] 1764         JRSGT GREAT1 
      0089DE 4F               [ 1] 1765         CLR  A
      0089DF                       1766 GREAT1:
      0089DF 1C 00 02         [ 2] 1767         ADDW X,#CELLL 
      0089E2 F7               [ 1] 1768         LD (X),A 
      0089E3 E7 01            [ 1] 1769         LD (1,X),A 
      0089E5 81               [ 4] 1770         RET 
                                   1771 
                                   1772 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1773 ;       MAX     ( n n -- n )
                                   1774 ;       Return greater of two top items.
                                   1775 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000966                       1776         _HEADER MAX,3,"MAX"
      0089E6 89 D2                    1         .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal [24-Bits]



                           000968     2         LINK=.
      0089E8 03                       3         .byte 3  
      0089E9 4D 41 58                 4         .ascii "MAX"
      0089EC                          5         MAX:
      0089EC 90 93            [ 1] 1777         LDW Y,X    
      0089EE 90 FE            [ 2] 1778         LDW Y,(Y) ; n2 
      0089F0 E3 02            [ 2] 1779         CPW Y,(2,X)   
      0089F2 2F 02            [ 1] 1780         JRSLT  MAX1
      0089F4 EF 02            [ 2] 1781         LDW (2,X),Y
      0089F6 1C 00 02         [ 2] 1782 MAX1:   ADDW X,#2
      0089F9 81               [ 4] 1783 	RET     
                                   1784 
                                   1785 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1786 ;       MIN     ( n n -- n )
                                   1787 ;       Return smaller of top two items.
                                   1788 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00097A                       1789         _HEADER MIN,3,"MIN"
      0089FA 89 E8                    1         .word LINK 
                           00097C     2         LINK=.
      0089FC 03                       3         .byte 3  
      0089FD 4D 49 4E                 4         .ascii "MIN"
      008A00                          5         MIN:
      008A00 90 93            [ 1] 1790         LDW Y,X    
      008A02 90 FE            [ 2] 1791         LDW Y,(Y)  ; n2 
      008A04 E3 02            [ 2] 1792         CPW Y,(2,X) 
      008A06 2C 02            [ 1] 1793         JRSGT MIN1
      008A08 EF 02            [ 2] 1794         LDW (2,X),Y
      008A0A 1C 00 02         [ 2] 1795 MIN1:	ADDW X,#2
      008A0D 81               [ 4] 1796 	RET     
                                   1797 
                                   1798 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1799 ;       WITHIN  ( u ul uh -- t )
                                   1800 ;       Return true if u is within
                                   1801 ;       range of ul and uh. ( ul <= u < uh )
                                   1802 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00098E                       1803         _HEADER WITHI,6,"WITHIN"
      008A0E 89 FC                    1         .word LINK 
                           000990     2         LINK=.
      008A10 06                       3         .byte 6  
      008A11 57 49 54 48 49 4E        4         .ascii "WITHIN"
      008A17                          5         WITHI:
      008A17 CD 86 C2         [ 4] 1804         CALL     OVER
      008A1A CD 89 53         [ 4] 1805         CALL     SUBB
      008A1D CD 86 63         [ 4] 1806         CALL     TOR
      008A20 CD 89 53         [ 4] 1807         CALL     SUBB
      008A23 CD 85 B5         [ 4] 1808         CALL     RFROM
      008A26 CC 89 91         [ 2] 1809         JP     ULESS
                                   1810 
                                   1811 ;; Divide
                                   1812 
                                   1813 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1814 ;       UM/MOD  ( udl udh un -- ur uq )
                                   1815 ;       Unsigned divide of a double by a
                                   1816 ;       single. Return mod and quotient.
                                   1817 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
Hexadecimal [24-Bits]



                                   1818 ; 2021-02-22
                                   1819 ; changed algorithm for Jeeek one 
                                   1820 ; ref: https://github.com/TG9541/stm8ef/pull/406        
      0009A9                       1821         _HEADER UMMOD,6,"UM/MOD"
      008A29 8A 10                    1         .word LINK 
                           0009AB     2         LINK=.
      008A2B 06                       3         .byte 6  
      008A2C 55 4D 2F 4D 4F 44        4         .ascii "UM/MOD"
      008A32                          5         UMMOD:
      008A32 90 93            [ 1] 1822         LDW     Y,X             ; stack pointer to Y
      008A34 FE               [ 2] 1823         LDW     X,(X)           ; un
      008A35 BF 26            [ 2] 1824         LDW     YTEMP,X         ; save un
      008A37 93               [ 1] 1825         LDW     X,Y
      008A38 5C               [ 1] 1826         INCW    X               ; drop un
      008A39 5C               [ 1] 1827         INCW    X
      008A3A 89               [ 2] 1828         PUSHW   X               ; save stack pointer
      008A3B FE               [ 2] 1829         LDW     X,(X)           ; X=udh
      008A3C 26 0B            [ 1] 1830         JRNE    MMSM0
      008A3E 1E 01            [ 2] 1831         LDW    X,(1,SP)
      008A40 EE 02            [ 2] 1832         LDW    X,(2,X)          ; udl 
      008A42 90 BE 26         [ 2] 1833         LDW     Y,YTEMP         ;divisor 
      008A45 65               [ 2] 1834         DIVW    X,Y             ; udl/un 
      008A46 51               [ 1] 1835         EXGW    X,Y 
      008A47 20 26            [ 2] 1836         JRA     MMSMb 
      008A49                       1837 MMSM0:    
      008A49 90 EE 04         [ 2] 1838         LDW     Y,(4,Y)         ; Y=udl (offset before drop)
      008A4C B3 26            [ 2] 1839         CPW     X,YTEMP
      008A4E 25 09            [ 1] 1840         JRULT   MMSM1           ; X is still on the R-stack
      008A50 85               [ 2] 1841         POPW    X               ; restore stack pointer
      008A51 90 5F            [ 1] 1842         CLRW    Y
      008A53 EF 02            [ 2] 1843         LDW     (2,X),Y         ; remainder 0
      008A55 90 5A            [ 2] 1844         DECW    Y
      008A57 FF               [ 2] 1845         LDW     (X),Y           ; quotient max. 16 bit value
      008A58 81               [ 4] 1846         RET
      008A59                       1847 MMSM1:
      008A59 A6 10            [ 1] 1848         LD      A,#16           ; loop count
      008A5B 90 58            [ 2] 1849         SLLW    Y               ; udl shift udl into udh
      008A5D                       1850 MMSM3:
      008A5D 59               [ 2] 1851         RLCW    X               ; rotate udl bit into uhdh (= remainder)
      008A5E 25 04            [ 1] 1852         JRC     MMSMa           ; if carry out of rotate
      008A60 B3 26            [ 2] 1853         CPW     X,YTEMP         ; compare udh to un
      008A62 25 05            [ 1] 1854         JRULT   MMSM4           ; can't subtract
      008A64                       1855 MMSMa:
      008A64 72 B0 00 26      [ 2] 1856         SUBW    X,YTEMP         ; can subtract
      008A68 98               [ 1] 1857         RCF
      008A69                       1858 MMSM4:
      008A69 8C               [ 1] 1859         CCF                     ; quotient bit
      008A6A 90 59            [ 2] 1860         RLCW    Y               ; rotate into quotient, rotate out udl
      008A6C 4A               [ 1] 1861         DEC     A               ; repeat
      008A6D 26 EE            [ 1] 1862         JRNE    MMSM3           ; if A == 0
      008A6F                       1863 MMSMb:
      008A6F BF 26            [ 2] 1864         LDW     YTEMP,X         ; done, save remainder
      008A71 85               [ 2] 1865         POPW    X               ; restore stack pointer
      008A72 FF               [ 2] 1866         LDW     (X),Y           ; save quotient
      008A73 90 BE 26         [ 2] 1867         LDW     Y,YTEMP         ; remainder onto stack
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



      008A76 EF 02            [ 2] 1868         LDW     (2,X),Y
      008A78 81               [ 4] 1869         RET
                                   1870 
                                   1871 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1872 ;   U/MOD ( u1 u2 -- ur uq )
                                   1873 ;   unsigned divide u1/u2 
                                   1874 ;   return remainder and quotient 
                                   1875 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0009F9                       1876         _HEADER USLMOD,5,"U/MOD"
      008A79 8A 2B                    1         .word LINK 
                           0009FB     2         LINK=.
      008A7B 05                       3         .byte 5  
      008A7C 55 2F 4D 4F 44           4         .ascii "U/MOD"
      008A81                          5         USLMOD:
      008A81 90 93            [ 1] 1877         LDW Y,X 
      008A83 90 FE            [ 2] 1878         LDW Y,(Y)  ; dividend 
      008A85 89               [ 2] 1879         PUSHW X    ; DP >R 
      008A86 EE 02            [ 2] 1880         LDW X,(2,X) ; divisor 
      008A88 65               [ 2] 1881         DIVW X,Y 
      008A89 89               [ 2] 1882         PUSHW X     ; quotient 
      008A8A 1E 03            [ 2] 1883         LDW X,(3,SP) ; DP 
      008A8C EF 02            [ 2] 1884         LDW (2,X),Y ; remainder 
      008A8E 16 01            [ 2] 1885         LDW Y,(1,SP) ; quotient 
      008A90 FF               [ 2] 1886         LDW (X),Y 
      008A91 5B 04            [ 2] 1887         ADDW SP,#2*CELLL ; drop quotient and DP from rstack 
      008A93 81               [ 4] 1888         RET 
                                   1889 
                                   1890 
                                   1891 
                                   1892 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
                                   1893 ;       M/MOD   ( d n -- r q )
                                   1894 ;       Signed floored divide of double by
                                   1895 ;       single. Return mod and quotient.
                                   1896 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000A14                       1897         _HEADER MSMOD,5,"M/MOD"
      008A94 8A 7B                    1         .word LINK 
                           000A16     2         LINK=.
      008A96 05                       3         .byte 5  
      008A97 4D 2F 4D 4F 44           4         .ascii "M/MOD"
      008A9C                          5         MSMOD:
      008A9C CD 86 9A         [ 4] 1898         CALL	DUPP
      008A9F CD 86 D1         [ 4] 1899         CALL	ZLESS
      008AA2 CD 86 9A         [ 4] 1900         CALL	DUPP
      008AA5 CD 86 63         [ 4] 1901         CALL	TOR
      008AA8 CD 85 19         [ 4] 1902         CALL	QBRAN
      008AAB 8A B9                 1903         .word	MMOD1
      008AAD CD 89 07         [ 4] 1904         CALL	NEGAT
      008AB0 CD 86 63         [ 4] 1905         CALL	TOR
      008AB3 CD 89 19         [ 4] 1906         CALL	DNEGA
      008AB6 CD 85 B5         [ 4] 1907         CALL	RFROM
      008AB9 CD 86 63         [ 4] 1908 MMOD1:	CALL	TOR
      008ABC CD 86 9A         [ 4] 1909         CALL	DUPP
      008ABF CD 86 D1         [ 4] 1910         CALL	ZLESS
      008AC2 CD 85 19         [ 4] 1911         CALL	QBRAN
      008AC5 8A CD                 1912         .word	MMOD2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



      008AC7 CD 85 C6         [ 4] 1913         CALL	RAT
      008ACA CD 88 BD         [ 4] 1914         CALL	PLUS
      008ACD CD 85 B5         [ 4] 1915 MMOD2:	CALL	RFROM
      008AD0 CD 8A 32         [ 4] 1916         CALL	UMMOD
      008AD3 CD 85 B5         [ 4] 1917         CALL	RFROM
      008AD6 CD 85 19         [ 4] 1918         CALL	QBRAN
      008AD9 8A E4                 1919         .word	MMOD3
      008ADB CD 86 AA         [ 4] 1920         CALL	SWAPP
      008ADE CD 89 07         [ 4] 1921         CALL	NEGAT
      008AE1 CC 86 AA         [ 2] 1922         JP	SWAPP
      008AE4 81               [ 4] 1923 MMOD3:	RET
                                   1924 
                                   1925 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1926 ;       /MOD    ( n1 n2 -- r q )
                                   1927 ;       Signed divide n1/n2. 
                                   1928 ;       Return mod and quotient.
                                   1929 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000A65                       1930         _HEADER SLMOD,4,"/MOD"
      008AE5 8A 96                    1         .word LINK 
                           000A67     2         LINK=.
      008AE7 04                       3         .byte 4  
      008AE8 2F 4D 4F 44              4         .ascii "/MOD"
      008AEC                          5         SLMOD:
      008AEC F6               [ 1] 1931         LD A,(X)
      008AED 88               [ 1] 1932         PUSH A   ; n2 sign 
      008AEE E6 02            [ 1] 1933         LD A,(2,X)
      008AF0 88               [ 1] 1934         PUSH A    ; n1 sign 
      008AF1 CD 89 6D         [ 4] 1935         CALL ABSS 
      008AF4 CD 86 63         [ 4] 1936         CALL TOR  ; 
      008AF7 CD 89 6D         [ 4] 1937         CALL ABSS 
      008AFA CD 85 C6         [ 4] 1938         CALL RAT   
      008AFD CD 8A 81         [ 4] 1939         CALL USLMOD 
      008B00 7B 03            [ 1] 1940         LD A,(3,SP)
      008B02 1A 04            [ 1] 1941         OR A,(4,SP)
      008B04 2A 30            [ 1] 1942         JRPL SLMOD8 ; both positive nothing to change 
      008B06 7B 03            [ 1] 1943         LD A,(3,SP)
      008B08 18 04            [ 1] 1944         XOR A,(4,SP)
      008B0A 2A 1D            [ 1] 1945         JRPL SLMOD1
                                   1946 ; dividend and divisor are opposite sign          
      008B0C CD 89 07         [ 4] 1947         CALL NEGAT ; negative quotient
      008B0F CD 86 C2         [ 4] 1948         CALL OVER 
      008B12 CD 86 E3         [ 4] 1949         CALL ZEQUAL 
      000A95                       1950         _TBRAN SLMOD8 
      008B15 CD 85 27         [ 4]    1     CALL TBRAN 
      008B18 8B 36                    2     .word SLMOD8 
      008B1A CD 8C 30         [ 4] 1951         CALL ONEM   ; add one to quotient 
      008B1D CD 85 C6         [ 4] 1952         CALL RAT 
      008B20 CD 88 5E         [ 4] 1953         CALL ROT 
      008B23 CD 89 53         [ 4] 1954         CALL SUBB  ; corrected_remainder=divisor-remainder 
      008B26 CD 86 AA         [ 4] 1955         CALL SWAPP
      008B29                       1956 SLMOD1:
      008B29 7B 04            [ 1] 1957         LD A,(4,SP) ; divisor sign 
      008B2B 2A 09            [ 1] 1958         JRPL SLMOD8 
      008B2D CD 86 63         [ 4] 1959         CALL TOR 
      008B30 CD 89 07         [ 4] 1960         CALL NEGAT ; if divisor negative negate remainder 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



      008B33 CD 85 B5         [ 4] 1961         CALL RFROM 
      008B36                       1962 SLMOD8: 
      008B36 5B 04            [ 2] 1963         ADDW SP,#4 
      008B38 81               [ 4] 1964         RET 
                                   1965 
                                   1966 
                                   1967 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1968 ;       MOD     ( n n -- r )
                                   1969 ;       Signed divide. Return mod only.
                                   1970 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000AB9                       1971         _HEADER MODD,3,"MOD"
      008B39 8A E7                    1         .word LINK 
                           000ABB     2         LINK=.
      008B3B 03                       3         .byte 3  
      008B3C 4D 4F 44                 4         .ascii "MOD"
      008B3F                          5         MODD:
      008B3F CD 8A EC         [ 4] 1972 	CALL	SLMOD
      008B42 CC 86 90         [ 2] 1973 	JP	DROP
                                   1974 
                                   1975 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1976 ;       /       ( n n -- q )
                                   1977 ;       Signed divide. Return quotient only.
                                   1978 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000AC5                       1979         _HEADER SLASH,1,"/"
      008B45 8B 3B                    1         .word LINK 
                           000AC7     2         LINK=.
      008B47 01                       3         .byte 1  
      008B48 2F                       4         .ascii "/"
      008B49                          5         SLASH:
      008B49 CD 8A EC         [ 4] 1980         CALL	SLMOD
      008B4C CD 86 AA         [ 4] 1981         CALL	SWAPP
      008B4F CC 86 90         [ 2] 1982         JP	DROP
                                   1983 
                                   1984 ;; Multiply
                                   1985 
                                   1986 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1987 ;       UM*     ( u1 u2 -- ud )
                                   1988 ;       Unsigned multiply. Return 
                                   1989 ;       double product.
                                   1990 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000AD2                       1991         _HEADER UMSTA,3,"UM*"
      008B52 8B 47                    1         .word LINK 
                           000AD4     2         LINK=.
      008B54 03                       3         .byte 3  
      008B55 55 4D 2A                 4         .ascii "UM*"
      008B58                          5         UMSTA:
                                   1992 ; stack have 4 bytes u1=a:b u2=c:d
                                   1993         ;; bytes offset on data stack 
                           000002  1994         da=2 
                           000003  1995         db=3 
                           000000  1996         dc=0 
                           000001  1997         dd=1 
                                   1998         ;;;;;; local variables ;;;;;;;;;
                                   1999         ;; product bytes offset on return stack 
                           000001  2000         UD1=1  ; ud bits 31..24
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



                           000002  2001         UD2=2  ; ud bits 23..16
                           000003  2002         UD3=3  ; ud bits 15..8 
                           000004  2003         UD4=4  ; ud bits 7..0 
                                   2004         ;; local variable for product set to zero   
      008B58 90 5F            [ 1] 2005         clrw y 
      008B5A 90 89            [ 2] 2006         pushw y  ; bits 15..0
      008B5C 90 89            [ 2] 2007         pushw y  ; bits 31..16 
      008B5E E6 03            [ 1] 2008         ld a,(db,x) ; b 
      008B60 90 97            [ 1] 2009         ld yl,a 
      008B62 E6 01            [ 1] 2010         ld a,(dd,x)   ; d
      008B64 90 42            [ 4] 2011         mul y,a    ; b*d  
      008B66 17 03            [ 2] 2012         ldw (UD3,sp),y ; lowest weight product 
      008B68 E6 03            [ 1] 2013         ld a,(db,x)
      008B6A 90 97            [ 1] 2014         ld yl,a 
      008B6C E6 00            [ 1] 2015         ld a,(dc,x)
      008B6E 90 42            [ 4] 2016         mul y,a  ; b*c 
                                   2017         ;;; do the partial sum 
      008B70 72 F9 02         [ 2] 2018         addw y,(UD2,sp)
      008B73 4F               [ 1] 2019         clr a 
      008B74 49               [ 1] 2020         rlc a
      008B75 6B 01            [ 1] 2021         ld (UD1,sp),a 
      008B77 17 02            [ 2] 2022         ldw (UD2,sp),y 
      008B79 E6 02            [ 1] 2023         ld a,(da,x)
      008B7B 90 97            [ 1] 2024         ld yl,a 
      008B7D E6 01            [ 1] 2025         ld a,(dd,x)
      008B7F 90 42            [ 4] 2026         mul y,a   ; a*d 
                                   2027         ;; do partial sum 
      008B81 72 F9 02         [ 2] 2028         addw y,(UD2,sp)
      008B84 4F               [ 1] 2029         clr a 
      008B85 19 01            [ 1] 2030         adc a,(UD1,sp)
      008B87 6B 01            [ 1] 2031         ld (UD1,sp),a  
      008B89 17 02            [ 2] 2032         ldw (UD2,sp),y 
      008B8B E6 02            [ 1] 2033         ld a,(da,x)
      008B8D 90 97            [ 1] 2034         ld yl,a 
      008B8F E6 00            [ 1] 2035         ld a,(dc,x)
      008B91 90 42            [ 4] 2036         mul y,a  ;  a*c highest weight product 
                                   2037         ;;; do partial sum 
      008B93 72 F9 01         [ 2] 2038         addw y,(UD1,sp)
      008B96 FF               [ 2] 2039         ldw (x),y  ; udh 
      008B97 16 03            [ 2] 2040         ldw y,(UD3,sp)
      008B99 EF 02            [ 2] 2041         ldw (2,x),y  ; udl  
      008B9B 5B 04            [ 2] 2042         addw sp,#4 ; drop local variable 
      008B9D 81               [ 4] 2043         ret  
                                   2044 
                                   2045 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2046 ;       *       ( n n -- n )
                                   2047 ;       Signed multiply. Return 
                                   2048 ;       single product.
                                   2049 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000B1E                       2050         _HEADER STAR,1,"*"
      008B9E 8B 54                    1         .word LINK 
                           000B20     2         LINK=.
      008BA0 01                       3         .byte 1  
      008BA1 2A                       4         .ascii "*"
      008BA2                          5         STAR:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



      008BA2 CD 8B 58         [ 4] 2051 	CALL	UMSTA
      008BA5 CC 86 90         [ 2] 2052 	JP	DROP
                                   2053 
                                   2054 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2055 ;       M*      ( n n -- d )
                                   2056 ;       Signed multiply. Return 
                                   2057 ;       double product.
                                   2058 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000B28                       2059         _HEADER MSTAR,2,"M*"
      008BA8 8B A0                    1         .word LINK 
                           000B2A     2         LINK=.
      008BAA 02                       3         .byte 2  
      008BAB 4D 2A                    4         .ascii "M*"
      008BAD                          5         MSTAR:
      008BAD CD 88 A8         [ 4] 2060         CALL	DDUP
      008BB0 CD 87 20         [ 4] 2061         CALL	XORR
      008BB3 CD 86 D1         [ 4] 2062         CALL	ZLESS
      008BB6 CD 86 63         [ 4] 2063         CALL	TOR
      008BB9 CD 89 6D         [ 4] 2064         CALL	ABSS
      008BBC CD 86 AA         [ 4] 2065         CALL	SWAPP
      008BBF CD 89 6D         [ 4] 2066         CALL	ABSS
      008BC2 CD 8B 58         [ 4] 2067         CALL	UMSTA
      008BC5 CD 85 B5         [ 4] 2068         CALL	RFROM
      008BC8 CD 85 19         [ 4] 2069         CALL	QBRAN
      008BCB 8B D0                 2070         .word	MSTA1
      008BCD CC 89 19         [ 2] 2071         JP	DNEGA
      008BD0 81               [ 4] 2072 MSTA1:	RET
                                   2073 
                                   2074 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2075 ;       */MOD   ( n1 n2 n3 -- r q )
                                   2076 ;       Multiply n1 and n2, then divide
                                   2077 ;       by n3. Return mod and quotient.
                                   2078 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000B51                       2079         _HEADER SSMOD,5,"*/MOD"
      008BD1 8B AA                    1         .word LINK 
                           000B53     2         LINK=.
      008BD3 05                       3         .byte 5  
      008BD4 2A 2F 4D 4F 44           4         .ascii "*/MOD"
      008BD9                          5         SSMOD:
      008BD9 CD 86 63         [ 4] 2080         CALL     TOR
      008BDC CD 8B AD         [ 4] 2081         CALL     MSTAR
      008BDF CD 85 B5         [ 4] 2082         CALL     RFROM
      008BE2 CC 8A 9C         [ 2] 2083         JP     MSMOD
                                   2084 
                                   2085 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2086 ;       */      ( n1 n2 n3 -- q )
                                   2087 ;       Multiply n1 by n2, then divide
                                   2088 ;       by n3. Return quotient only.
                                   2089 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000B65                       2090         _HEADER STASL,2,"*/"
      008BE5 8B D3                    1         .word LINK 
                           000B67     2         LINK=.
      008BE7 02                       3         .byte 2  
      008BE8 2A 2F                    4         .ascii "*/"
      008BEA                          5         STASL:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



      008BEA CD 8B D9         [ 4] 2091         CALL	SSMOD
      008BED CD 86 AA         [ 4] 2092         CALL	SWAPP
      008BF0 CC 86 90         [ 2] 2093         JP	DROP
                                   2094 
                                   2095 ;; Miscellaneous
                                   2096 
                                   2097 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2098 ;       2+   ( a -- a )
                                   2099 ;       Add cell size in byte to address.
                                   2100 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000B73                       2101         _HEADER CELLP,2,"2+"
      008BF3 8B E7                    1         .word LINK 
                           000B75     2         LINK=.
      008BF5 02                       3         .byte 2  
      008BF6 32 2B                    4         .ascii "2+"
      008BF8                          5         CELLP:
      008BF8 90 93            [ 1] 2102         LDW Y,X
      008BFA 90 FE            [ 2] 2103 	LDW Y,(Y)
      008BFC 72 A9 00 02      [ 2] 2104         ADDW Y,#CELLL 
      008C00 FF               [ 2] 2105         LDW (X),Y
      008C01 81               [ 4] 2106         RET
                                   2107 
                                   2108 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2109 ;       2-   ( a -- a )
                                   2110 ;       Subtract 2 from address.
                                   2111 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000B82                       2112         _HEADER CELLM,2,"2-"
      008C02 8B F5                    1         .word LINK 
                           000B84     2         LINK=.
      008C04 02                       3         .byte 2  
      008C05 32 2D                    4         .ascii "2-"
      008C07                          5         CELLM:
      008C07 90 93            [ 1] 2113         LDW Y,X
      008C09 90 FE            [ 2] 2114 	LDW Y,(Y)
      008C0B 72 A2 00 02      [ 2] 2115         SUBW Y,#CELLL
      008C0F FF               [ 2] 2116         LDW (X),Y
      008C10 81               [ 4] 2117         RET
                                   2118 
                                   2119 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2120 ;       2*   ( n -- n )
                                   2121 ;       Multiply tos by 2.
                                   2122 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000B91                       2123         _HEADER CELLS,2,"2*"
      008C11 8C 04                    1         .word LINK 
                           000B93     2         LINK=.
      008C13 02                       3         .byte 2  
      008C14 32 2A                    4         .ascii "2*"
      008C16                          5         CELLS:
      008C16 90 93            [ 1] 2124         LDW Y,X
      008C18 90 FE            [ 2] 2125 	LDW Y,(Y)
      008C1A 90 58            [ 2] 2126         SLAW Y
      008C1C FF               [ 2] 2127         LDW (X),Y
      008C1D 81               [ 4] 2128         RET
                                   2129 
                                   2130 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



                                   2131 ;       1+      ( a -- a )
                                   2132 ;       Add cell size in byte 
                                   2133 ;       to address.
                                   2134 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000B9E                       2135         _HEADER ONEP,2,"1+"
      008C1E 8C 13                    1         .word LINK 
                           000BA0     2         LINK=.
      008C20 02                       3         .byte 2  
      008C21 31 2B                    4         .ascii "1+"
      008C23                          5         ONEP:
      008C23 90 93            [ 1] 2136         LDW Y,X
      008C25 90 FE            [ 2] 2137 	LDW Y,(Y)
      008C27 90 5C            [ 1] 2138         INCW Y
      008C29 FF               [ 2] 2139         LDW (X),Y
      008C2A 81               [ 4] 2140         RET
                                   2141 
                                   2142 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2143 ;       1-      ( a -- a )
                                   2144 ;       Subtract 2 from address.
                                   2145 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000BAB                       2146         _HEADER ONEM,2,"1-"
      008C2B 8C 20                    1         .word LINK 
                           000BAD     2         LINK=.
      008C2D 02                       3         .byte 2  
      008C2E 31 2D                    4         .ascii "1-"
      008C30                          5         ONEM:
      008C30 90 93            [ 1] 2147         LDW Y,X
      008C32 90 FE            [ 2] 2148 	LDW Y,(Y)
      008C34 90 5A            [ 2] 2149         DECW Y
      008C36 FF               [ 2] 2150         LDW (X),Y
      008C37 81               [ 4] 2151         RET
                                   2152 
                                   2153 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2154 ;  shift left n times 
                                   2155 ; LSHIFT ( n1 n2 -- n1<<n2 )
                                   2156 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000BB8                       2157         _HEADER LSHIFT,6,"LSHIFT"
      008C38 8C 2D                    1         .word LINK 
                           000BBA     2         LINK=.
      008C3A 06                       3         .byte 6  
      008C3B 4C 53 48 49 46 54        4         .ascii "LSHIFT"
      008C41                          5         LSHIFT:
      008C41 E6 01            [ 1] 2158         ld a,(1,x)
      008C43 1C 00 02         [ 2] 2159         addw x,#CELLL 
      008C46 90 93            [ 1] 2160         ldw y,x 
      008C48 90 FE            [ 2] 2161         ldw y,(y)
      008C4A                       2162 LSHIFT1:
      008C4A 4D               [ 1] 2163         tnz a 
      008C4B 27 05            [ 1] 2164         jreq LSHIFT4 
      008C4D 90 58            [ 2] 2165         sllw y 
      008C4F 4A               [ 1] 2166         dec a 
      008C50 20 F8            [ 2] 2167         jra LSHIFT1 
      008C52                       2168 LSHIFT4:
      008C52 FF               [ 2] 2169         ldw (x),y 
      008C53 81               [ 4] 2170         ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



                                   2171 
                                   2172 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2173 ; shift right n times                 
                                   2174 ; RSHIFT (n1 n2 -- n1>>n2 )
                                   2175 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000BD4                       2176         _HEADER RSHIFT,6,"RSHIFT"
      008C54 8C 3A                    1         .word LINK 
                           000BD6     2         LINK=.
      008C56 06                       3         .byte 6  
      008C57 52 53 48 49 46 54        4         .ascii "RSHIFT"
      008C5D                          5         RSHIFT:
      008C5D E6 01            [ 1] 2177         ld a,(1,x)
      008C5F 1C 00 02         [ 2] 2178         addw x,#CELLL 
      008C62 90 93            [ 1] 2179         ldw y,x 
      008C64 90 FE            [ 2] 2180         ldw y,(y)
      008C66                       2181 RSHIFT1:
      008C66 4D               [ 1] 2182         tnz a 
      008C67 27 05            [ 1] 2183         jreq RSHIFT4 
      008C69 90 54            [ 2] 2184         srlw y 
      008C6B 4A               [ 1] 2185         dec a 
      008C6C 20 F8            [ 2] 2186         jra RSHIFT1 
      008C6E                       2187 RSHIFT4:
      008C6E FF               [ 2] 2188         ldw (x),y 
      008C6F 81               [ 4] 2189         ret 
                                   2190 
                                   2191 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2192 ;       2/      ( n -- n )
                                   2193 ;       divide  tos by 2.
                                   2194 ;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000BF0                       2195         _HEADER TWOSL,2,"2/"
      008C70 8C 56                    1         .word LINK 
                           000BF2     2         LINK=.
      008C72 02                       3         .byte 2  
      008C73 32 2F                    4         .ascii "2/"
      008C75                          5         TWOSL:
      008C75 90 93            [ 1] 2196         LDW Y,X
      008C77 90 FE            [ 2] 2197 	LDW Y,(Y)
      008C79 90 57            [ 2] 2198         SRAW Y
      008C7B FF               [ 2] 2199         LDW (X),Y
      008C7C 81               [ 4] 2200         RET
                                   2201 
                                   2202 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2203 ;       BL      ( -- 32 )
                                   2204 ;       Return 32,  blank character.
                                   2205 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000BFD                       2206         _HEADER BLANK,2,"BL"
      008C7D 8C 72                    1         .word LINK 
                           000BFF     2         LINK=.
      008C7F 02                       3         .byte 2  
      008C80 42 4C                    4         .ascii "BL"
      008C82                          5         BLANK:
      008C82 1D 00 02         [ 2] 2207         SUBW X,#2
      008C85 90 AE 00 20      [ 2] 2208 	LDW Y,#32
      008C89 FF               [ 2] 2209         LDW (X),Y
      008C8A 81               [ 4] 2210         RET
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



                                   2211 
                                   2212 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2213 ;         0     ( -- 0)
                                   2214 ;         Return 0.
                                   2215 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000C0B                       2216         _HEADER ZERO,1,"0"
      008C8B 8C 7F                    1         .word LINK 
                           000C0D     2         LINK=.
      008C8D 01                       3         .byte 1  
      008C8E 30                       4         .ascii "0"
      008C8F                          5         ZERO:
      008C8F 1D 00 02         [ 2] 2217         SUBW X,#2
      008C92 90 5F            [ 1] 2218 	CLRW Y
      008C94 FF               [ 2] 2219         LDW (X),Y
      008C95 81               [ 4] 2220         RET
                                   2221 
                                   2222 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2223 ;         1     ( -- 1)
                                   2224 ;         Return 1.
                                   2225 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000C16                       2226         _HEADER ONE,1,"1"
      008C96 8C 8D                    1         .word LINK 
                           000C18     2         LINK=.
      008C98 01                       3         .byte 1  
      008C99 31                       4         .ascii "1"
      008C9A                          5         ONE:
      008C9A 1D 00 02         [ 2] 2227         SUBW X,#2
      008C9D 90 AE 00 01      [ 2] 2228 	LDW Y,#1
      008CA1 FF               [ 2] 2229         LDW (X),Y
      008CA2 81               [ 4] 2230         RET
                                   2231 
                                   2232 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2233 ;         -1    ( -- -1)
                                   2234 ;   Return -1
                                   2235 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000C23                       2236         _HEADER MONE,2,"-1"
      008CA3 8C 98                    1         .word LINK 
                           000C25     2         LINK=.
      008CA5 02                       3         .byte 2  
      008CA6 2D 31                    4         .ascii "-1"
      008CA8                          5         MONE:
      008CA8 1D 00 02         [ 2] 2237         SUBW X,#2
      008CAB 90 AE FF FF      [ 2] 2238 	LDW Y,#0xFFFF
      008CAF FF               [ 2] 2239         LDW (X),Y
      008CB0 81               [ 4] 2240         RET
                                   2241 
                                   2242 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2243 ;       >CHAR   ( c -- c )
                                   2244 ;       Filter non-printing characters.
                                   2245 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000C31                       2246         _HEADER TCHAR,5,">CHAR"
      008CB1 8C A5                    1         .word LINK 
                           000C33     2         LINK=.
      008CB3 05                       3         .byte 5  
      008CB4 3E 43 48 41 52           4         .ascii ">CHAR"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



      008CB9                          5         TCHAR:
      008CB9 E6 01            [ 1] 2247         ld a,(1,x)
      008CBB A1 20            [ 1] 2248         cp a,#32  
      008CBD 2B 05            [ 1] 2249         jrmi 1$ 
      008CBF A1 7F            [ 1] 2250         cp a,#127 
      008CC1 2A 01            [ 1] 2251         jrpl 1$ 
      008CC3 81               [ 4] 2252         ret 
      008CC4 A6 5F            [ 1] 2253 1$:     ld a,#'_ 
      008CC6 E7 01            [ 1] 2254         ld (1,x),a 
      008CC8 81               [ 4] 2255         ret 
                                   2256 
                                   2257 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2258 ;       DEPTH   ( -- n )
                                   2259 ;       Return  depth of  data stack.
                                   2260 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000C49                       2261         _HEADER DEPTH,5,"DEPTH"
      008CC9 8C B3                    1         .word LINK 
                           000C4B     2         LINK=.
      008CCB 05                       3         .byte 5  
      008CCC 44 45 50 54 48           4         .ascii "DEPTH"
      008CD1                          5         DEPTH:
      008CD1 90 BE 2C         [ 2] 2262         LDW Y,SP0    ;save data stack ptr
      008CD4 BF 24            [ 2] 2263 	LDW XTEMP,X
      008CD6 72 B2 00 24      [ 2] 2264         SUBW Y,XTEMP     ;#bytes = SP0 - X
      008CDA 90 57            [ 2] 2265         SRAW Y    ;Y = #stack items
      008CDC 1D 00 02         [ 2] 2266 	SUBW X,#2
      008CDF FF               [ 2] 2267         LDW (X),Y     ; if neg, underflow
      008CE0 81               [ 4] 2268         RET
                                   2269 
                                   2270 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2271 ;       PICK    ( ... +n -- ... w )
                                   2272 ;       Copy  nth stack item to tos.
                                   2273 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000C61                       2274         _HEADER PICK,4,"PICK"
      008CE1 8C CB                    1         .word LINK 
                           000C63     2         LINK=.
      008CE3 04                       3         .byte 4  
      008CE4 50 49 43 4B              4         .ascii "PICK"
      008CE8                          5         PICK:
      008CE8 90 93            [ 1] 2275         LDW Y,X   ;D = n1
      008CEA 90 FE            [ 2] 2276         LDW Y,(Y)
                                   2277 ; modified for standard compliance          
                                   2278 ; 0 PICK must be equivalent to DUP 
      008CEC 90 5C            [ 1] 2279         INCW Y 
      008CEE 90 58            [ 2] 2280         SLAW Y
      008CF0 BF 24            [ 2] 2281         LDW XTEMP,X
      008CF2 72 B9 00 24      [ 2] 2282         ADDW Y,XTEMP
      008CF6 90 FE            [ 2] 2283         LDW Y,(Y)
      008CF8 FF               [ 2] 2284         LDW (X),Y
      008CF9 81               [ 4] 2285         RET
                                   2286 
                                   2287 ;; Memory access
                                   2288 
                                   2289 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2290 ;       +!      ( n a -- )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



                                   2291 ;       Add n to  contents at 
                                   2292 ;       address a.
                                   2293 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000C7A                       2294         _HEADER PSTOR,2,"+!"
      008CFA 8C E3                    1         .word LINK 
                           000C7C     2         LINK=.
      008CFC 02                       3         .byte 2  
      008CFD 2B 21                    4         .ascii "+!"
      008CFF                          5         PSTOR:
      008CFF 89               [ 2] 2295         PUSHW X   ; R: DP 
      008D00 90 93            [ 1] 2296         LDW Y,X 
      008D02 FE               [ 2] 2297         LDW X,(X) ; a 
      008D03 90 EE 02         [ 2] 2298         LDW Y,(2,Y)  ; n 
      008D06 90 89            [ 2] 2299         PUSHW Y      ; R: DP n 
      008D08 90 93            [ 1] 2300         LDW Y,X 
      008D0A 90 FE            [ 2] 2301         LDW Y,(Y)
      008D0C 72 F9 01         [ 2] 2302         ADDW Y,(1,SP) ; *a + n 
      008D0F FF               [ 2] 2303         LDW (X),Y 
      008D10 1E 03            [ 2] 2304         LDW X,(3,SP) ; DP
      008D12 1C 00 04         [ 2] 2305         ADDW X,#2*CELLL  ; ( n a -- )  
      008D15 5B 04            [ 2] 2306         ADDW SP,#2*CELLL ; R: DP n -- 
      008D17 81               [ 4] 2307         RET 
                                   2308                 
                                   2309 
                                   2310 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2311 ;       2!      ( d a -- )
                                   2312 ;       Store  double integer 
                                   2313 ;       to address a.
                                   2314 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000C98                       2315         _HEADER DSTOR,2,"2!"
      008D18 8C FC                    1         .word LINK 
                           000C9A     2         LINK=.
      008D1A 02                       3         .byte 2  
      008D1B 32 21                    4         .ascii "2!"
      008D1D                          5         DSTOR:
      008D1D 90 93            [ 1] 2316         LDW Y,X 
      008D1F 89               [ 2] 2317         PUSHW X 
      008D20 FE               [ 2] 2318         LDW X,(X) ; a 
      008D21 90 EE 02         [ 2] 2319         LDW Y,(2,Y) ; dhi 
      008D24 FF               [ 2] 2320         LDW (X),Y 
      008D25 16 01            [ 2] 2321         LDW Y,(1,SP)  
      008D27 90 EE 04         [ 2] 2322         LDW Y,(4,Y) ; dlo 
      008D2A EF 02            [ 2] 2323         LDW (2,X),Y  
      008D2C 85               [ 2] 2324         POPW X 
      008D2D 1C 00 06         [ 2] 2325         ADDW X,#3*CELLL 
      008D30 81               [ 4] 2326         RET 
                                   2327 
                                   2328 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2329 ;       2@      ( a -- d )
                                   2330 ;       Fetch double integer 
                                   2331 ;       from address a.
                                   2332 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000CB1                       2333         _HEADER DAT,2,"2@"
      008D31 8D 1A                    1         .word LINK 
                           000CB3     2         LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



      008D33 02                       3         .byte 2  
      008D34 32 40                    4         .ascii "2@"
      008D36                          5         DAT:
      008D36 90 93            [ 1] 2334         ldw y,x 
      008D38 1D 00 02         [ 2] 2335         subw x,#CELLL 
      008D3B 90 FE            [ 2] 2336         ldw y,(y) ;address 
      008D3D 90 89            [ 2] 2337         pushw y  
      008D3F 90 FE            [ 2] 2338         ldw y,(y) ; dhi 
      008D41 FF               [ 2] 2339         ldw (x),y 
      008D42 90 85            [ 2] 2340         popw y 
      008D44 90 EE 02         [ 2] 2341         ldw y,(2,y) ; dlo 
      008D47 EF 02            [ 2] 2342         ldw (2,x),y 
      008D49 81               [ 4] 2343         ret 
                                   2344 
                                   2345 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2346 ;       COUNT   ( b -- b +n )
                                   2347 ;       Return count byte of a string
                                   2348 ;       and add 1 to byte address.
                                   2349 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000CCA                       2350         _HEADER COUNT,5,"COUNT"
      008D4A 8D 33                    1         .word LINK 
                           000CCC     2         LINK=.
      008D4C 05                       3         .byte 5  
      008D4D 43 4F 55 4E 54           4         .ascii "COUNT"
      008D52                          5         COUNT:
      008D52 90 93            [ 1] 2351         ldw y,x 
      008D54 90 FE            [ 2] 2352         ldw y,(y) ; address 
      008D56 90 F6            [ 1] 2353         ld a,(y)  ; count 
      008D58 90 5C            [ 1] 2354         incw y 
      008D5A FF               [ 2] 2355         ldw (x),y 
      008D5B 1D 00 02         [ 2] 2356         subw x,#CELLL 
      008D5E E7 01            [ 1] 2357         ld (1,x),a 
      008D60 7F               [ 1] 2358         clr (x)
      008D61 81               [ 4] 2359         ret 
                                   2360 
                                   2361 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2362 ;       HERE    ( -- a )
                                   2363 ;       Return  top of  variables
                                   2364 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000CE2                       2365         _HEADER HERE,4,"HERE"
      008D62 8D 4C                    1         .word LINK 
                           000CE4     2         LINK=.
      008D64 04                       3         .byte 4  
      008D65 48 45 52 45              4         .ascii "HERE"
      008D69                          5         HERE:
      008D69 90 AE 00 18      [ 2] 2366       	ldw y,#UVP 
      008D6D 90 FE            [ 2] 2367         ldw y,(y)
      008D6F 1D 00 02         [ 2] 2368         subw x,#CELLL 
      008D72 FF               [ 2] 2369         ldw (x),y 
      008D73 81               [ 4] 2370         ret 
                                   2371 
                                   2372 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2373 ;       PAD     ( -- a )
                                   2374 ;       Return address of text buffer
                                   2375 ;       above  code dictionary.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



                                   2376 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000CF4                       2377         _HEADER PAD,3,"PAD"
      008D74 8D 64                    1         .word LINK 
                           000CF6     2         LINK=.
      008D76 03                       3         .byte 3  
      008D77 50 41 44                 4         .ascii "PAD"
      008D7A                          5         PAD:
      008D7A CD 8D 69         [ 4] 2378         CALL     HERE
      000CFD                       2379         _DOLIT   80
      008D7D CD 84 F0         [ 4]    1     CALL DOLIT 
      008D80 00 50                    2     .word 80 
      008D82 CC 88 BD         [ 2] 2380         JP     PLUS
                                   2381 
                                   2382 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2383 ;       TIB     ( -- a )
                                   2384 ;       Return address of 
                                   2385 ;       terminal input buffer.
                                   2386 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000D05                       2387         _HEADER TIB,3,"TIB"
      008D85 8D 76                    1         .word LINK 
                           000D07     2         LINK=.
      008D87 03                       3         .byte 3  
      008D88 54 49 42                 4         .ascii "TIB"
      008D8B                          5         TIB:
      008D8B CD 87 8E         [ 4] 2388         CALL     NTIB
      008D8E CD 8B F8         [ 4] 2389         CALL     CELLP
      008D91 CC 85 64         [ 2] 2390         JP     AT
                                   2391 
                                   2392 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2393 ;       @EXECUTE        ( a -- )
                                   2394 ;       Execute vector stored in 
                                   2395 ;       address a.
                                   2396 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000D14                       2397         _HEADER ATEXE,8,"@EXECUTE"
      008D94 8D 87                    1         .word LINK 
                           000D16     2         LINK=.
      008D96 08                       3         .byte 8  
      008D97 40 45 58 45 43 55 54     4         .ascii "@EXECUTE"
             45
      008D9F                          5         ATEXE:
      008D9F CD 85 64         [ 4] 2398         CALL     AT
      008DA2 CD 88 4D         [ 4] 2399         CALL     QDUP    ;?address or zero
      008DA5 CD 85 19         [ 4] 2400         CALL     QBRAN
      008DA8 8D AD                 2401         .word      EXE1
      008DAA CD 85 45         [ 4] 2402         CALL     EXECU   ;execute if non-zero
      008DAD 81               [ 4] 2403 EXE1:   RET     ;do nothing if zero
                                   2404 
                                   2405 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2406 ;       CMOVE   ( b1 b2 u -- )
                                   2407 ;       Copy u bytes from b1 to b2.
                                   2408 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000D2E                       2409         _HEADER CMOVE,5,"CMOVE"
      008DAE 8D 96                    1         .word LINK 
                           000D30     2         LINK=.
      008DB0 05                       3         .byte 5  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



      008DB1 43 4D 4F 56 45           4         .ascii "CMOVE"
      008DB6                          5         CMOVE:
                                   2410         ;;;;  local variables ;;;;;;;
                           000005  2411         DP = 5
                           000003  2412         YTMP = 3 
                           000001  2413         CNT  = 1 
                                   2414         ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      008DB6 89               [ 2] 2415         PUSHW X  ; R: DP  
      008DB7 52 02            [ 2] 2416         SUB SP,#2 ; R: DP YTMP 
      008DB9 90 93            [ 1] 2417         LDW Y,X 
      008DBB 90 FE            [ 2] 2418         LDW Y,(Y) ; CNT 
      008DBD 90 89            [ 2] 2419         PUSHW Y  ; R: DP YTMP CNT
      008DBF 90 93            [ 1] 2420         LDW Y,X 
      008DC1 90 EE 02         [ 2] 2421         LDW Y,(2,Y) ; b2, dest 
      008DC4 EE 04            [ 2] 2422         LDW X,(4,X) ; b1, src 
      008DC6 17 03            [ 2] 2423         LDW (YTMP,SP),Y 
      008DC8 13 03            [ 2] 2424         CPW X,(YTMP,SP) 
      008DCA 22 1A            [ 1] 2425         JRUGT CMOV2  ; src>dest 
                                   2426 ; src<dest copy from top to bottom
      008DCC 72 FB 01         [ 2] 2427         ADDW X,(CNT,SP)
      008DCF 72 F9 01         [ 2] 2428         ADDW Y,(CNT,SP)
      008DD2                       2429 CMOV1:  
      008DD2 17 03            [ 2] 2430         LDW (YTMP,SP),Y 
      008DD4 16 01            [ 2] 2431         LDW Y,(CNT,SP)
      008DD6 27 22            [ 1] 2432         JREQ CMOV3 
      008DD8 90 5A            [ 2] 2433         DECW Y 
      008DDA 17 01            [ 2] 2434         LDW (CNT,SP),Y 
      008DDC 16 03            [ 2] 2435         LDW Y,(YTMP,SP)
      008DDE 5A               [ 2] 2436         DECW X
      008DDF F6               [ 1] 2437         LD A,(X)
      008DE0 90 5A            [ 2] 2438         DECW Y 
      008DE2 90 F7            [ 1] 2439         LD (Y),A 
      008DE4 20 EC            [ 2] 2440         JRA CMOV1
                                   2441 ; src>dest copy from bottom to top   
      008DE6                       2442 CMOV2: 
      008DE6 17 03            [ 2] 2443         LDW (YTMP,SP),Y 
      008DE8 16 01            [ 2] 2444         LDW Y,(CNT,SP)
      008DEA 27 0E            [ 1] 2445         JREQ CMOV3
      008DEC 90 5A            [ 2] 2446         DECW Y 
      008DEE 17 01            [ 2] 2447         LDW (CNT,SP),Y 
      008DF0 16 03            [ 2] 2448         LDW Y,(YTMP,SP)
      008DF2 F6               [ 1] 2449         LD A,(X)
      008DF3 5C               [ 1] 2450         INCW X 
      008DF4 90 F7            [ 1] 2451         LD (Y),A 
      008DF6 90 5C            [ 1] 2452         INCW Y 
      008DF8 20 EC            [ 2] 2453         JRA CMOV2 
      008DFA                       2454 CMOV3:
      008DFA 1E 05            [ 2] 2455         LDW X,(DP,SP)
      008DFC 1C 00 06         [ 2] 2456         ADDW X,#3*CELLL 
      008DFF 5B 06            [ 2] 2457         ADDW SP,#3*CELLL 
      008E01 81               [ 4] 2458         RET 
                                   2459         
                                   2460 
                                   2461 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2462 ;       FILL    ( b u c -- )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



                                   2463 ;       Fill u bytes of character c
                                   2464 ;       to area beginning at b.
                                   2465 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000D82                       2466         _HEADER FILL,4,"FILL"
      008E02 8D B0                    1         .word LINK 
                           000D84     2         LINK=.
      008E04 04                       3         .byte 4  
      008E05 46 49 4C 4C              4         .ascii "FILL"
      008E09                          5         FILL:
      008E09 E6 01            [ 1] 2467         LD A,(1,X)
      008E0B 90 93            [ 1] 2468         LDW Y,X 
      008E0D 1C 00 06         [ 2] 2469         ADDW X,#3*CELLL 
      008E10 89               [ 2] 2470         PUSHW X ; R: DP 
      008E11 93               [ 1] 2471         LDW X,Y 
      008E12 EE 04            [ 2] 2472         LDW X,(4,X) ; b
      008E14 90 EE 02         [ 2] 2473         LDW Y,(2,Y) ; u
      008E17                       2474 FILL0:
      008E17 27 06            [ 1] 2475         JREQ FILL1
      008E19 F7               [ 1] 2476         LD (X),A 
      008E1A 5C               [ 1] 2477         INCW X 
      008E1B 90 5A            [ 2] 2478         DECW Y 
      008E1D 20 F8            [ 2] 2479         JRA FILL0         
      008E1F 85               [ 2] 2480 FILL1: POPW X 
      008E20 81               [ 4] 2481         RET         
                                   2482         
                                   2483 
                                   2484 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2485 ;       ERASE   ( b u -- )
                                   2486 ;       Erase u bytes beginning at b.
                                   2487 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000DA1                       2488         _HEADER ERASE,5,"ERASE"
      008E21 8E 04                    1         .word LINK 
                           000DA3     2         LINK=.
      008E23 05                       3         .byte 5  
      008E24 45 52 41 53 45           4         .ascii "ERASE"
      008E29                          5         ERASE:
      008E29 90 5F            [ 1] 2489         clrw y 
      008E2B 1D 00 02         [ 2] 2490         subw x,#CELLL 
      008E2E FF               [ 2] 2491         ldw (x),y 
      008E2F CC 8E 09         [ 2] 2492         jp FILL 
                                   2493 
                                   2494 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2495 ;       PACK0   ( b u a -- a )
                                   2496 ;       Build a counted string with
                                   2497 ;       u characters from b. Null fill.
                                   2498 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000DB2                       2499         _HEADER PACKS,5,"PACK0"
      008E32 8E 23                    1         .word LINK 
                           000DB4     2         LINK=.
      008E34 05                       3         .byte 5  
      008E35 50 41 43 4B 30           4         .ascii "PACK0"
      008E3A                          5         PACKS:
      008E3A CD 86 9A         [ 4] 2500         CALL     DUPP
      008E3D CD 86 63         [ 4] 2501         CALL     TOR     ;strings only on cell boundary
      008E40 CD 88 A8         [ 4] 2502         CALL     DDUP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



      008E43 CD 85 71         [ 4] 2503         CALL     CSTOR
      008E46 CD 8C 23         [ 4] 2504         CALL     ONEP ;save count
      008E49 CD 86 AA         [ 4] 2505         CALL     SWAPP
      008E4C CD 8D B6         [ 4] 2506         CALL     CMOVE
      008E4F CD 85 B5         [ 4] 2507         CALL     RFROM
      008E52 81               [ 4] 2508         RET
                                   2509 
                                   2510 ;; Numeric output, single precision
                                   2511 
                                   2512 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2513 ;       DIGIT   ( u -- c )
                                   2514 ;       Convert digit u to a character.
                                   2515 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000DD3                       2516         _HEADER DIGIT,5,"DIGIT"
      008E53 8E 34                    1         .word LINK 
                           000DD5     2         LINK=.
      008E55 05                       3         .byte 5  
      008E56 44 49 47 49 54           4         .ascii "DIGIT"
      008E5B                          5         DIGIT:
      008E5B CD 84 F0         [ 4] 2517         CALL	DOLIT
      008E5E 00 09                 2518         .word	9
      008E60 CD 86 C2         [ 4] 2519         CALL	OVER
      008E63 CD 89 A7         [ 4] 2520         CALL	LESS
      008E66 CD 84 F0         [ 4] 2521         CALL	DOLIT
      008E69 00 07                 2522         .word	7
      008E6B CD 86 F7         [ 4] 2523         CALL	ANDD
      008E6E CD 88 BD         [ 4] 2524         CALL	PLUS
      008E71 CD 84 F0         [ 4] 2525         CALL	DOLIT
      008E74 00 30                 2526         .word	48	;'0'
      008E76 CC 88 BD         [ 2] 2527         JP	PLUS
                                   2528 
                                   2529 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2530 ;       EXTRACT ( n base -- n c )
                                   2531 ;       Extract least significant 
                                   2532 ;       digit from n.
                                   2533 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000DF9                       2534         _HEADER EXTRC,7,"EXTRACT"
      008E79 8E 55                    1         .word LINK 
                           000DFB     2         LINK=.
      008E7B 07                       3         .byte 7  
      008E7C 45 58 54 52 41 43 54     4         .ascii "EXTRACT"
      008E83                          5         EXTRC:
      008E83 CD 8C 8F         [ 4] 2535         CALL     ZERO
      008E86 CD 86 AA         [ 4] 2536         CALL     SWAPP
      008E89 CD 8A 32         [ 4] 2537         CALL     UMMOD
      008E8C CD 86 AA         [ 4] 2538         CALL     SWAPP
      008E8F CC 8E 5B         [ 2] 2539         JP     DIGIT
                                   2540 
                                   2541 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2542 ;       <#      ( -- )
                                   2543 ;       Initiate  numeric 
                                   2544 ;       output process.
                                   2545 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000E12                       2546         _HEADER BDIGS,2,"#<"
      008E92 8E 7B                    1         .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



                           000E14     2         LINK=.
      008E94 02                       3         .byte 2  
      008E95 23 3C                    4         .ascii "#<"
      008E97                          5         BDIGS:
      008E97 CD 8D 7A         [ 4] 2547         CALL     PAD
      008E9A CD 87 D0         [ 4] 2548         CALL     HLD
      008E9D CC 85 52         [ 2] 2549         JP     STORE
                                   2550 
                                   2551 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2552 ;       HOLD    ( c -- )
                                   2553 ;       Insert a character 
                                   2554 ;       into output string.
                                   2555 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000E20                       2556         _HEADER HOLD,4,"HOLD"
      008EA0 8E 94                    1         .word LINK 
                           000E22     2         LINK=.
      008EA2 04                       3         .byte 4  
      008EA3 48 4F 4C 44              4         .ascii "HOLD"
      008EA7                          5         HOLD:
      008EA7 CD 87 D0         [ 4] 2557         CALL     HLD
      008EAA CD 85 64         [ 4] 2558         CALL     AT
      008EAD CD 8C 30         [ 4] 2559         CALL     ONEM
      008EB0 CD 86 9A         [ 4] 2560         CALL     DUPP
      008EB3 CD 87 D0         [ 4] 2561         CALL     HLD
      008EB6 CD 85 52         [ 4] 2562         CALL     STORE
      008EB9 CC 85 71         [ 2] 2563         JP     CSTOR
                                   2564 
                                   2565 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2566 ;       #       ( u -- u )
                                   2567 ;       Extract one digit from u and
                                   2568 ;       append digit to output string.
                                   2569 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000E3C                       2570         _HEADER DIG,1,"#"
      008EBC 8E A2                    1         .word LINK 
                           000E3E     2         LINK=.
      008EBE 01                       3         .byte 1  
      008EBF 23                       4         .ascii "#"
      008EC0                          5         DIG:
      008EC0 CD 87 60         [ 4] 2571         CALL     BASE
      008EC3 CD 85 64         [ 4] 2572         CALL     AT
      008EC6 CD 8E 83         [ 4] 2573         CALL     EXTRC
      008EC9 CC 8E A7         [ 2] 2574         JP     HOLD
                                   2575 
                                   2576 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2577 ;       #S      ( u -- 0 )
                                   2578 ;       Convert u until all digits
                                   2579 ;       are added to output string.
                                   2580 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000E4C                       2581         _HEADER DIGS,2,"#S"
      008ECC 8E BE                    1         .word LINK 
                           000E4E     2         LINK=.
      008ECE 02                       3         .byte 2  
      008ECF 23 53                    4         .ascii "#S"
      008ED1                          5         DIGS:
      008ED1 CD 8E C0         [ 4] 2582 DIGS1:  CALL     DIG
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



      008ED4 CD 86 9A         [ 4] 2583         CALL     DUPP
      008ED7 CD 85 19         [ 4] 2584         CALL     QBRAN
      008EDA 8E DE                 2585         .word      DIGS2
      008EDC 20 F3            [ 2] 2586         JRA     DIGS1
      008EDE 81               [ 4] 2587 DIGS2:  RET
                                   2588 
                                   2589 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2590 ;       SIGN    ( n -- )
                                   2591 ;       Add a minus sign to
                                   2592 ;       numeric output string.
                                   2593 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000E5F                       2594         _HEADER SIGN,4,"SIGN"
      008EDF 8E CE                    1         .word LINK 
                           000E61     2         LINK=.
      008EE1 04                       3         .byte 4  
      008EE2 53 49 47 4E              4         .ascii "SIGN"
      008EE6                          5         SIGN:
      008EE6 CD 86 D1         [ 4] 2595         CALL     ZLESS
      008EE9 CD 85 19         [ 4] 2596         CALL     QBRAN
      008EEC 8E F6                 2597         .word      SIGN1
      008EEE CD 84 F0         [ 4] 2598         CALL     DOLIT
      008EF1 00 2D                 2599         .word      45	;"-"
      008EF3 CC 8E A7         [ 2] 2600         JP     HOLD
      008EF6 81               [ 4] 2601 SIGN1:  RET
                                   2602 
                                   2603 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2604 ;       #>      ( w -- b u )
                                   2605 ;       Prepare output string.
                                   2606 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000E77                       2607         _HEADER EDIGS,2,"#>"
      008EF7 8E E1                    1         .word LINK 
                           000E79     2         LINK=.
      008EF9 02                       3         .byte 2  
      008EFA 23 3E                    4         .ascii "#>"
      008EFC                          5         EDIGS:
      008EFC CD 86 90         [ 4] 2608         CALL     DROP
      008EFF CD 87 D0         [ 4] 2609         CALL     HLD
      008F02 CD 85 64         [ 4] 2610         CALL     AT
      008F05 CD 8D 7A         [ 4] 2611         CALL     PAD
      008F08 CD 86 C2         [ 4] 2612         CALL     OVER
      008F0B CC 89 53         [ 2] 2613         JP     SUBB
                                   2614 
                                   2615 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2616 ;       str     ( w -- b u )
                                   2617 ;       Convert a signed integer
                                   2618 ;       to a numeric string.
                                   2619 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000E8E                       2620         _HEADER STR,3,"STR"
      008F0E 8E F9                    1         .word LINK 
                           000E90     2         LINK=.
      008F10 03                       3         .byte 3  
      008F11 53 54 52                 4         .ascii "STR"
      008F14                          5         STR:
      008F14 CD 86 9A         [ 4] 2621         CALL     DUPP
      008F17 CD 86 63         [ 4] 2622         CALL     TOR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



      008F1A CD 89 6D         [ 4] 2623         CALL     ABSS
      008F1D CD 8E 97         [ 4] 2624         CALL     BDIGS
      008F20 CD 8E D1         [ 4] 2625         CALL     DIGS
      008F23 CD 85 B5         [ 4] 2626         CALL     RFROM
      008F26 CD 8E E6         [ 4] 2627         CALL     SIGN
      008F29 CC 8E FC         [ 2] 2628         JP     EDIGS
                                   2629 
                                   2630 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2631 ;       HEX     ( -- )
                                   2632 ;       Use radix 16 as base for
                                   2633 ;       numeric conversions.
                                   2634 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000EAC                       2635         _HEADER HEX,3,"HEX"
      008F2C 8F 10                    1         .word LINK 
                           000EAE     2         LINK=.
      008F2E 03                       3         .byte 3  
      008F2F 48 45 58                 4         .ascii "HEX"
      008F32                          5         HEX:
      008F32 CD 84 F0         [ 4] 2636         CALL     DOLIT
      008F35 00 10                 2637         .word      16
      008F37 CD 87 60         [ 4] 2638         CALL     BASE
      008F3A CC 85 52         [ 2] 2639         JP     STORE
                                   2640 
                                   2641 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2642 ;       DECIMAL ( -- )
                                   2643 ;       Use radix 10 as base
                                   2644 ;       for numeric conversions.
                                   2645 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000EBD                       2646         _HEADER DECIM,7,"DECIMAL"
      008F3D 8F 2E                    1         .word LINK 
                           000EBF     2         LINK=.
      008F3F 07                       3         .byte 7  
      008F40 44 45 43 49 4D 41 4C     4         .ascii "DECIMAL"
      008F47                          5         DECIM:
      008F47 CD 84 F0         [ 4] 2647         CALL     DOLIT
      008F4A 00 0A                 2648         .word      10
      008F4C CD 87 60         [ 4] 2649         CALL     BASE
      008F4F CC 85 52         [ 2] 2650         JP     STORE
                                   2651 
                                   2652 ;; Numeric input, single precision
                                   2653 
                                   2654 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2655 ;       DIGIT?  ( c base -- u t )
                                   2656 ;       Convert a character to its numeric
                                   2657 ;       value. A flag indicates success.
                                   2658 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000ED2                       2659         _HEADER DIGTQ,6,"DIGIT?"
      008F52 8F 3F                    1         .word LINK 
                           000ED4     2         LINK=.
      008F54 06                       3         .byte 6  
      008F55 44 49 47 49 54 3F        4         .ascii "DIGIT?"
      008F5B                          5         DIGTQ:
      008F5B CD 86 63         [ 4] 2660         CALL     TOR
      008F5E CD 84 F0         [ 4] 2661         CALL     DOLIT
      008F61 00 30                 2662         .word     48	; "0"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



      008F63 CD 89 53         [ 4] 2663         CALL     SUBB
      008F66 CD 84 F0         [ 4] 2664         CALL     DOLIT
      008F69 00 09                 2665         .word      9
      008F6B CD 86 C2         [ 4] 2666         CALL     OVER
      008F6E CD 89 A7         [ 4] 2667         CALL     LESS
      008F71 CD 85 19         [ 4] 2668         CALL     QBRAN
      008F74 8F 8C                 2669         .word      DGTQ1
      008F76 CD 84 F0         [ 4] 2670         CALL     DOLIT
      008F79 00 07                 2671         .word      7
      008F7B CD 89 53         [ 4] 2672         CALL     SUBB
      008F7E CD 86 9A         [ 4] 2673         CALL     DUPP
      008F81 CD 84 F0         [ 4] 2674         CALL     DOLIT
      008F84 00 0A                 2675         .word      10
      008F86 CD 89 A7         [ 4] 2676         CALL     LESS
      008F89 CD 87 0B         [ 4] 2677         CALL     ORR
      008F8C CD 86 9A         [ 4] 2678 DGTQ1:  CALL     DUPP
      008F8F CD 85 B5         [ 4] 2679         CALL     RFROM
      008F92 CC 89 91         [ 2] 2680         JP     ULESS
                                   2681 
                           000001  2682 .if  WANT_DOUBLE
                           000000  2683 .else 
                                   2684 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2685 ;       NUMBER? ( a -- n T | a F )
                                   2686 ;       Convert a number string to
                                   2687 ;       integer. Push a flag on tos.
                                   2688 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2689         _HEADER NUMBQ,7,"NUMBER?"
                                   2690         CALL     BASE
                                   2691         CALL     AT
                                   2692         CALL     TOR
                                   2693         CALL     ZERO
                                   2694         CALL     OVER
                                   2695         CALL     COUNT
                                   2696         CALL     OVER
                                   2697         CALL     CAT
                                   2698         CALL     DOLIT
                                   2699         .word     36	; "0x"
                                   2700         CALL     EQUAL
                                   2701         CALL     QBRAN
                                   2702         .word      NUMQ1
                                   2703         CALL     HEX
                                   2704         CALL     SWAPP
                                   2705         CALL     ONEP
                                   2706         CALL     SWAPP
                                   2707         CALL     ONEM
                                   2708 NUMQ1:  CALL     OVER
                                   2709         CALL     CAT
                                   2710         CALL     DOLIT
                                   2711         .word     45	; "-"
                                   2712         CALL     EQUAL
                                   2713         CALL     TOR
                                   2714         CALL     SWAPP
                                   2715         CALL     RAT
                                   2716         CALL     SUBB
                                   2717         CALL     SWAPP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



                                   2718         CALL     RAT
                                   2719         CALL     PLUS
                                   2720         CALL     QDUP
                                   2721         CALL     QBRAN
                                   2722         .word      NUMQ6
                                   2723         CALL     ONEM
                                   2724         CALL     TOR
                                   2725 NUMQ2:  CALL     DUPP
                                   2726         CALL     TOR
                                   2727         CALL     CAT
                                   2728         CALL     BASE
                                   2729         CALL     AT
                                   2730         CALL     DIGTQ
                                   2731         CALL     QBRAN
                                   2732         .word      NUMQ4
                                   2733         CALL     SWAPP
                                   2734         CALL     BASE
                                   2735         CALL     AT
                                   2736         CALL     STAR
                                   2737         CALL     PLUS
                                   2738         CALL     RFROM
                                   2739         CALL     ONEP
                                   2740         CALL     DONXT
                                   2741         .word      NUMQ2
                                   2742         CALL     RAT
                                   2743         CALL     SWAPP
                                   2744         CALL     DROP
                                   2745         CALL     QBRAN
                                   2746         .word      NUMQ3
                                   2747         CALL     NEGAT
                                   2748 NUMQ3:  CALL     SWAPP
                                   2749         JRA     NUMQ5
                                   2750 NUMQ4:  CALL     RFROM
                                   2751         CALL     RFROM
                                   2752         CALL     DDROP
                                   2753         CALL     DDROP
                                   2754         CALL     ZERO
                                   2755 NUMQ5:  CALL     DUPP
                                   2756 NUMQ6:  CALL     RFROM
                                   2757         CALL     DDROP
                                   2758         CALL     RFROM
                                   2759         CALL     BASE
                                   2760         JP     STORE
                                   2761 .endif ; WANT_DOUBLE  
                                   2762 
                                   2763 ;; Basic I/O
                                   2764 
                                   2765 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2766 ;       KEY     ( -- c )
                                   2767 ;       Wait for and return an
                                   2768 ;       input character.
                                   2769 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000F15                       2770         _HEADER KEY,3,"KEY"
      008F95 8F 54                    1         .word LINK 
                           000F17     2         LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



      008F97 03                       3         .byte 3  
      008F98 4B 45 59                 4         .ascii "KEY"
      008F9B                          5         KEY:
      008F9B 72 0B 52 30 FB   [ 2] 2771         btjf UART_SR,#UART_SR_RXNE,. 
      008FA0 C6 52 31         [ 1] 2772         ld a,UART_DR 
      008FA3 1D 00 02         [ 2] 2773         subw x,#CELLL 
      008FA6 E7 01            [ 1] 2774         ld (1,x),a 
      008FA8 7F               [ 1] 2775         clr (x)
      008FA9 81               [ 4] 2776         ret 
                                   2777 
                                   2778 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2779 ;       NUF?    ( -- t )
                                   2780 ;       Return false if no input,
                                   2781 ;       else pause and if CR return true.
                                   2782 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000F2A                       2783         _HEADER NUFQ,4,"NUF?"
      008FAA 8F 97                    1         .word LINK 
                           000F2C     2         LINK=.
      008FAC 04                       3         .byte 4  
      008FAD 4E 55 46 3F              4         .ascii "NUF?"
      008FB1                          5         NUFQ:
      008FB1 CD 84 99         [ 4] 2784         CALL     QKEY
      008FB4 CD 86 9A         [ 4] 2785         CALL     DUPP
      008FB7 CD 85 19         [ 4] 2786         CALL     QBRAN
      008FBA 8F CA                 2787         .word    NUFQ1
      008FBC CD 88 9D         [ 4] 2788         CALL     DDROP
      008FBF CD 8F 9B         [ 4] 2789         CALL     KEY
      008FC2 CD 84 F0         [ 4] 2790         CALL     DOLIT
      008FC5 00 0D                 2791         .word      CRR
      008FC7 CC 89 7B         [ 2] 2792         JP     EQUAL
      008FCA 81               [ 4] 2793 NUFQ1:  RET
                                   2794 
                                   2795 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2796 ;       SPACE   ( -- )
                                   2797 ;       Send  blank character to
                                   2798 ;       output device.
                                   2799 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000F4B                       2800         _HEADER SPACE,5,"SPACE"
      008FCB 8F AC                    1         .word LINK 
                           000F4D     2         LINK=.
      008FCD 05                       3         .byte 5  
      008FCE 53 50 41 43 45           4         .ascii "SPACE"
      008FD3                          5         SPACE:
      008FD3 CD 8C 82         [ 4] 2801         CALL     BLANK
      008FD6 CC 84 B7         [ 2] 2802         JP     EMIT
                                   2803 
                                   2804 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2805 ;       SPACES  ( +n -- )
                                   2806 ;       Send n spaces to output device.
                                   2807 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000F59                       2808         _HEADER SPACS,6,"SPACES"
      008FD9 8F CD                    1         .word LINK 
                           000F5B     2         LINK=.
      008FDB 06                       3         .byte 6  
      008FDC 53 50 41 43 45 53        4         .ascii "SPACES"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



      008FE2                          5         SPACS:
      008FE2 CD 8C 8F         [ 4] 2809         CALL     ZERO
      008FE5 CD 89 EC         [ 4] 2810         CALL     MAX
      008FE8 CD 86 63         [ 4] 2811         CALL     TOR
      008FEB 20 03            [ 2] 2812         JRA      CHAR2
      008FED CD 8F D3         [ 4] 2813 CHAR1:  CALL     SPACE
      008FF0 CD 85 04         [ 4] 2814 CHAR2:  CALL     DONXT
      008FF3 8F ED                 2815         .word    CHAR1
      008FF5 81               [ 4] 2816         RET
                                   2817 
                                   2818 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2819 ;       TYPE    ( b u -- )
                                   2820 ;       Output u characters from b.
                                   2821 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000F76                       2822         _HEADER TYPES,4,"TYPE"
      008FF6 8F DB                    1         .word LINK 
                           000F78     2         LINK=.
      008FF8 04                       3         .byte 4  
      008FF9 54 59 50 45              4         .ascii "TYPE"
      008FFD                          5         TYPES:
      008FFD CD 86 63         [ 4] 2823         CALL     TOR
      009000 20 06            [ 2] 2824         JRA     TYPE2
      009002 CD 8D 52         [ 4] 2825 TYPE1:  CALL     COUNT 
      009005 CD 84 B7         [ 4] 2826         CALL     EMIT
      000F88                       2827 TYPE2:  _DONXT  TYPE1
      009008 CD 85 04         [ 4]    1     CALL DONXT 
      00900B 90 02                    2     .word TYPE1 
      000F8D                       2828         _DROP
      00900D 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      009010 81               [ 4] 2829         RET 
                                   2830 
                                   2831 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2832 ;       CR      ( -- )
                                   2833 ;       Output a carriage return
                                   2834 ;       and a line feed.
                                   2835 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000F91                       2836         _HEADER CR,2,"CR"
      009011 8F F8                    1         .word LINK 
                           000F93     2         LINK=.
      009013 02                       3         .byte 2  
      009014 43 52                    4         .ascii "CR"
      009016                          5         CR:
      000F96                       2837         _DOLIT  CRR 
      009016 CD 84 F0         [ 4]    1     CALL DOLIT 
      009019 00 0D                    2     .word CRR 
      00901B CD 84 B7         [ 4] 2838         CALL    EMIT
      000F9E                       2839         _DOLIT  LF
      00901E CD 84 F0         [ 4]    1     CALL DOLIT 
      009021 00 0A                    2     .word LF 
      009023 CC 84 B7         [ 2] 2840         JP      EMIT
                                   2841 
                                   2842 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2843 ;       do$     ( -- a )
                                   2844 ;       Return  address of a compiled
                                   2845 ;       string.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



                                   2846 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2847 ;       _HEADER DOSTR,COMPO+3,"DO$"
      009026                       2848 DOSTR:
      009026 CD 85 B5         [ 4] 2849         CALL     RFROM
      009029 CD 85 C6         [ 4] 2850         CALL     RAT
      00902C CD 85 B5         [ 4] 2851         CALL     RFROM
      00902F CD 8D 52         [ 4] 2852         CALL     COUNT
      009032 CD 88 BD         [ 4] 2853         CALL     PLUS
      009035 CD 86 63         [ 4] 2854         CALL     TOR
      009038 CD 86 AA         [ 4] 2855         CALL     SWAPP
      00903B CD 86 63         [ 4] 2856         CALL     TOR
      00903E 81               [ 4] 2857         RET
                                   2858 
                                   2859 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2860 ;       $"|     ( -- a )
                                   2861 ;       Run time routine compiled by $".
                                   2862 ;       Return address of a compiled string.
                                   2863 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2864 ;       _HEADER STRQP,COMPO+3,"$\"|"
      00903F                       2865 STRQP:
      00903F CD 90 26         [ 4] 2866         CALL     DOSTR
      009042 81               [ 4] 2867         RET
                                   2868 
                                   2869 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2870 ;       ."|     ( -- )
                                   2871 ;       Run time routine of ." .
                                   2872 ;       Output a compiled string.
                                   2873 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2874 ;       _HEADER DOTQP,COMPO+3,".\"|"
      009043                       2875 DOTQP:
      009043 CD 90 26         [ 4] 2876         CALL     DOSTR
      009046 CD 8D 52         [ 4] 2877         CALL     COUNT
      009049 CC 8F FD         [ 2] 2878         JP     TYPES
                                   2879 
                                   2880 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2881 ;       .R      ( n +n -- )
                                   2882 ;       Display an integer in a field
                                   2883 ;       of n columns, right justified.
                                   2884 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000FCC                       2885         _HEADER DOTR,2,".R"
      00904C 90 13                    1         .word LINK 
                           000FCE     2         LINK=.
      00904E 02                       3         .byte 2  
      00904F 2E 52                    4         .ascii ".R"
      009051                          5         DOTR:
      009051 CD 86 63         [ 4] 2886         CALL     TOR
      009054 CD 8F 14         [ 4] 2887         CALL     STR
      009057 CD 85 B5         [ 4] 2888         CALL     RFROM
      00905A CD 86 C2         [ 4] 2889         CALL     OVER
      00905D CD 89 53         [ 4] 2890         CALL     SUBB
      009060 CD 8F E2         [ 4] 2891         CALL     SPACS
      009063 CC 8F FD         [ 2] 2892         JP     TYPES
                                   2893 
                                   2894 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2895 ;       U.R     ( u +n -- )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



                                   2896 ;       Display an unsigned integer
                                   2897 ;       in n column, right justified.
                                   2898 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000FE6                       2899         _HEADER UDOTR,3,"U.R"
      009066 90 4E                    1         .word LINK 
                           000FE8     2         LINK=.
      009068 03                       3         .byte 3  
      009069 55 2E 52                 4         .ascii "U.R"
      00906C                          5         UDOTR:
      00906C CD 86 63         [ 4] 2900         CALL     TOR
      00906F CD 8E 97         [ 4] 2901         CALL     BDIGS
      009072 CD 8E D1         [ 4] 2902         CALL     DIGS
      009075 CD 8E FC         [ 4] 2903         CALL     EDIGS
      009078 CD 85 B5         [ 4] 2904         CALL     RFROM
      00907B CD 86 C2         [ 4] 2905         CALL     OVER
      00907E CD 89 53         [ 4] 2906         CALL     SUBB
      009081 CD 8F E2         [ 4] 2907         CALL     SPACS
      009084 CC 8F FD         [ 2] 2908         JP     TYPES
                                   2909 
                                   2910 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2911 ;       U.      ( u -- )
                                   2912 ;       Display an unsigned integer
                                   2913 ;       in free format.
                                   2914 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001007                       2915         _HEADER UDOT,2,"U."
      009087 90 68                    1         .word LINK 
                           001009     2         LINK=.
      009089 02                       3         .byte 2  
      00908A 55 2E                    4         .ascii "U."
      00908C                          5         UDOT:
      00908C CD 8E 97         [ 4] 2916         CALL     BDIGS
      00908F CD 8E D1         [ 4] 2917         CALL     DIGS
      009092 CD 8E FC         [ 4] 2918         CALL     EDIGS
      009095 CD 8F D3         [ 4] 2919         CALL     SPACE
      009098 CC 8F FD         [ 2] 2920         JP     TYPES
                                   2921 
                                   2922 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2923 ;   H. ( n -- )
                                   2924 ;   display n in hexadecimal 
                                   2925 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00101B                       2926         _HEADER HDOT,2,"H."
      00909B 90 89                    1         .word LINK 
                           00101D     2         LINK=.
      00909D 02                       3         .byte 2  
      00909E 48 2E                    4         .ascii "H."
      0090A0                          5         HDOT:
      0090A0 CD 87 60         [ 4] 2927         CALL BASE 
      0090A3 CD 85 64         [ 4] 2928         CALL AT 
      0090A6 CD 86 63         [ 4] 2929         CALL TOR 
      0090A9 CD 8F 32         [ 4] 2930         CALL HEX 
      0090AC CD 90 8C         [ 4] 2931         CALL UDOT 
      0090AF CD 85 B5         [ 4] 2932         CALL RFROM 
      0090B2 CD 87 60         [ 4] 2933         CALL BASE 
      0090B5 CC 85 52         [ 2] 2934         JP STORE 
                                   2935          
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



                                   2936 
                                   2937 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2938 ;       .       ( w -- )
                                   2939 ;       Display an integer in free
                                   2940 ;       format, preceeded by a space.
                                   2941 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001038                       2942         _HEADER DOT,1,"."
      0090B8 90 9D                    1         .word LINK 
                           00103A     2         LINK=.
      0090BA 01                       3         .byte 1  
      0090BB 2E                       4         .ascii "."
      0090BC                          5         DOT:
      0090BC CD 87 60         [ 4] 2943         CALL     BASE
      0090BF CD 85 64         [ 4] 2944         CALL     AT
      0090C2 CD 84 F0         [ 4] 2945         CALL     DOLIT
      0090C5 00 0A                 2946         .word      10
      0090C7 CD 87 20         [ 4] 2947         CALL     XORR    ;?decimal
      0090CA CD 85 19         [ 4] 2948         CALL     QBRAN
      0090CD 90 D1                 2949         .word      DOT1
      0090CF 20 BB            [ 2] 2950         JRA     UDOT
      0090D1 CD 8F 14         [ 4] 2951 DOT1:   CALL     STR
      0090D4 CD 8F D3         [ 4] 2952         CALL     SPACE
      0090D7 CC 8F FD         [ 2] 2953         JP     TYPES
                                   2954 
                                   2955 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2956 ;       ?       ( a -- )
                                   2957 ;       Display contents in memory cell.
                                   2958 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00105A                       2959         _HEADER QUEST,1,"?"
      0090DA 90 BA                    1         .word LINK 
                           00105C     2         LINK=.
      0090DC 01                       3         .byte 1  
      0090DD 3F                       4         .ascii "?"
      0090DE                          5         QUEST:
      0090DE CD 85 64         [ 4] 2960         CALL     AT
      0090E1 20 D9            [ 2] 2961         JRA     DOT
                                   2962 
                                   2963 ;; Parsing
                                   2964 
                                   2965 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2966 ;       parse   ( b u c -- b u delta ; <string> )
                                   2967 ;       Scan string delimited by c.
                                   2968 ;       Return found string and its offset.
                                   2969 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001063                       2970         _HEADER PARS,5,"PARS$"
      0090E3 90 DC                    1         .word LINK 
                           001065     2         LINK=.
      0090E5 05                       3         .byte 5  
      0090E6 50 41 52 53 24           4         .ascii "PARS$"
      0090EB                          5         PARS:
      0090EB CD 87 6F         [ 4] 2971         CALL     TEMP
      0090EE CD 85 52         [ 4] 2972         CALL     STORE
      0090F1 CD 86 C2         [ 4] 2973         CALL     OVER
      0090F4 CD 86 63         [ 4] 2974         CALL     TOR
      0090F7 CD 86 9A         [ 4] 2975         CALL     DUPP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



      0090FA CD 85 19         [ 4] 2976         CALL     QBRAN
      0090FD 91 A3                 2977         .word    PARS8
      0090FF CD 8C 30         [ 4] 2978         CALL     ONEM
      009102 CD 87 6F         [ 4] 2979         CALL     TEMP
      009105 CD 85 64         [ 4] 2980         CALL     AT
      009108 CD 8C 82         [ 4] 2981         CALL     BLANK
      00910B CD 89 7B         [ 4] 2982         CALL     EQUAL
      00910E CD 85 19         [ 4] 2983         CALL     QBRAN
      009111 91 44                 2984         .word      PARS3
      009113 CD 86 63         [ 4] 2985         CALL     TOR
      009116 CD 8C 82         [ 4] 2986 PARS1:  CALL     BLANK
      009119 CD 86 C2         [ 4] 2987         CALL     OVER
      00911C CD 85 82         [ 4] 2988         CALL     CAT     ;skip leading blanks ONLY
      00911F CD 89 53         [ 4] 2989         CALL     SUBB
      009122 CD 86 D1         [ 4] 2990         CALL     ZLESS
      009125 CD 88 F6         [ 4] 2991         CALL     INVER
      009128 CD 85 19         [ 4] 2992         CALL     QBRAN
      00912B 91 41                 2993         .word      PARS2
      00912D CD 8C 23         [ 4] 2994         CALL     ONEP
      009130 CD 85 04         [ 4] 2995         CALL     DONXT
      009133 91 16                 2996         .word      PARS1
      009135 CD 85 B5         [ 4] 2997         CALL     RFROM
      009138 CD 86 90         [ 4] 2998         CALL     DROP
      00913B CD 8C 8F         [ 4] 2999         CALL     ZERO
      00913E CC 86 9A         [ 2] 3000         JP     DUPP
      009141 CD 85 B5         [ 4] 3001 PARS2:  CALL     RFROM
      009144 CD 86 C2         [ 4] 3002 PARS3:  CALL     OVER
      009147 CD 86 AA         [ 4] 3003         CALL     SWAPP
      00914A CD 86 63         [ 4] 3004         CALL     TOR
      00914D CD 87 6F         [ 4] 3005 PARS4:  CALL     TEMP
      009150 CD 85 64         [ 4] 3006         CALL     AT
      009153 CD 86 C2         [ 4] 3007         CALL     OVER
      009156 CD 85 82         [ 4] 3008         CALL     CAT
      009159 CD 89 53         [ 4] 3009         CALL     SUBB    ;scan for delimiter
      00915C CD 87 6F         [ 4] 3010         CALL     TEMP
      00915F CD 85 64         [ 4] 3011         CALL     AT
      009162 CD 8C 82         [ 4] 3012         CALL     BLANK
      009165 CD 89 7B         [ 4] 3013         CALL     EQUAL
      009168 CD 85 19         [ 4] 3014         CALL     QBRAN
      00916B 91 70                 3015         .word      PARS5
      00916D CD 86 D1         [ 4] 3016         CALL     ZLESS
      009170 CD 85 19         [ 4] 3017 PARS5:  CALL     QBRAN
      009173 91 85                 3018         .word      PARS6
      009175 CD 8C 23         [ 4] 3019         CALL     ONEP
      009178 CD 85 04         [ 4] 3020         CALL     DONXT
      00917B 91 4D                 3021         .word      PARS4
      00917D CD 86 9A         [ 4] 3022         CALL     DUPP
      009180 CD 86 63         [ 4] 3023         CALL     TOR
      009183 20 0F            [ 2] 3024         JRA     PARS7
      009185 CD 85 B5         [ 4] 3025 PARS6:  CALL     RFROM
      009188 CD 86 90         [ 4] 3026         CALL     DROP
      00918B CD 86 9A         [ 4] 3027         CALL     DUPP
      00918E CD 8C 23         [ 4] 3028         CALL     ONEP
      009191 CD 86 63         [ 4] 3029         CALL     TOR
      009194 CD 86 C2         [ 4] 3030 PARS7:  CALL     OVER
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



      009197 CD 89 53         [ 4] 3031         CALL     SUBB
      00919A CD 85 B5         [ 4] 3032         CALL     RFROM
      00919D CD 85 B5         [ 4] 3033         CALL     RFROM
      0091A0 CC 89 53         [ 2] 3034         JP     SUBB
      0091A3 CD 86 C2         [ 4] 3035 PARS8:  CALL     OVER
      0091A6 CD 85 B5         [ 4] 3036         CALL     RFROM
      0091A9 CC 89 53         [ 2] 3037         JP     SUBB
                                   3038 
                                   3039 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3040 ;       PARSE   ( c -- b u ; <string> )
                                   3041 ;       Scan input stream and return
                                   3042 ;       counted string delimited by c.
                                   3043 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00112C                       3044         _HEADER PARSE,5,"PARSE"
      0091AC 90 E5                    1         .word LINK 
                           00112E     2         LINK=.
      0091AE 05                       3         .byte 5  
      0091AF 50 41 52 53 45           4         .ascii "PARSE"
      0091B4                          5         PARSE:
      0091B4 CD 86 63         [ 4] 3045         CALL     TOR
      0091B7 CD 8D 8B         [ 4] 3046         CALL     TIB
      0091BA CD 87 7E         [ 4] 3047         CALL     INN
      0091BD CD 85 64         [ 4] 3048         CALL     AT
      0091C0 CD 88 BD         [ 4] 3049         CALL     PLUS    ;current input buffer pointer
      0091C3 CD 87 8E         [ 4] 3050         CALL     NTIB
      0091C6 CD 85 64         [ 4] 3051         CALL     AT
      0091C9 CD 87 7E         [ 4] 3052         CALL     INN
      0091CC CD 85 64         [ 4] 3053         CALL     AT
      0091CF CD 89 53         [ 4] 3054         CALL     SUBB    ;remaining count
      0091D2 CD 85 B5         [ 4] 3055         CALL     RFROM
      0091D5 CD 90 EB         [ 4] 3056         CALL     PARS
      0091D8 CD 87 7E         [ 4] 3057         CALL     INN
      0091DB CC 8C FF         [ 2] 3058         JP     PSTOR
                                   3059 
                                   3060 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3061 ;       .(      ( -- )
                                   3062 ;       Output following string up to next ) .
                                   3063 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00115E                       3064         _HEADER DOTPR,IMEDD+2,".("
      0091DE 91 AE                    1         .word LINK 
                           001160     2         LINK=.
      0091E0 82                       3         .byte IMEDD+2  
      0091E1 2E 28                    4         .ascii ".("
      0091E3                          5         DOTPR:
      0091E3 CD 84 F0         [ 4] 3065         CALL     DOLIT
      0091E6 00 29                 3066         .word     41	; ")"
      0091E8 CD 91 B4         [ 4] 3067         CALL     PARSE
      0091EB CC 8F FD         [ 2] 3068         JP     TYPES
                                   3069 
                                   3070 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3071 ;       (       ( -- )
                                   3072 ;       Ignore following string up to next ).
                                   3073 ;       A comment.
                                   3074 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00116E                       3075         _HEADER PAREN,IMEDD+1,"("
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



      0091EE 91 E0                    1         .word LINK 
                           001170     2         LINK=.
      0091F0 81                       3         .byte IMEDD+1  
      0091F1 28                       4         .ascii "("
      0091F2                          5         PAREN:
      0091F2 CD 84 F0         [ 4] 3076         CALL     DOLIT
      0091F5 00 29                 3077         .word     41	; ")"
      0091F7 CD 91 B4         [ 4] 3078         CALL     PARSE
      0091FA CC 88 9D         [ 2] 3079         JP     DDROP
                                   3080 
                                   3081 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3082 ;       \       ( -- )
                                   3083 ;       Ignore following text till
                                   3084 ;       end of line.
                                   3085 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00117D                       3086         _HEADER BKSLA,IMEDD+1,"\\"
      0091FD 91 F0                    1         .word LINK 
                           00117F     2         LINK=.
      0091FF 81                       3         .byte IMEDD+1  
      009200 5C 5C                    4         .ascii "\\"
      009202                          5         BKSLA:
      009202 90 AE 00 0E      [ 2] 3087         ldw y,#UCTIB ; #TIB  
      009206 90 FE            [ 2] 3088         ldw y,(y)
      009208 90 89            [ 2] 3089         pushw y ; count in TIB 
      00920A 90 AE 00 0C      [ 2] 3090         ldw y,#UINN ; >IN 
      00920E 90 BF 26         [ 2] 3091         ldw YTEMP,y
      009211 90 85            [ 2] 3092         popw y 
      009213 91 CF 26         [ 5] 3093         ldw [YTEMP],y
      009216 81               [ 4] 3094         ret 
                                   3095 
                                   3096 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3097 ;       WORD    ( c -- a ; <string> )
                                   3098 ;       Parse a word from input stream
                                   3099 ;       and copy it to code dictionary.
                                   3100 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001197                       3101         _HEADER WORDD,4,"WORD"
      009217 91 FF                    1         .word LINK 
                           001199     2         LINK=.
      009219 04                       3         .byte 4  
      00921A 57 4F 52 44              4         .ascii "WORD"
      00921E                          5         WORDD:
      00921E CD 91 B4         [ 4] 3102         CALL     PARSE
      009221 CD 8D 69         [ 4] 3103         CALL     HERE
      009224 CD 8B F8         [ 4] 3104         CALL     CELLP
                           000000  3105 .IF CASE_SENSE 
                                   3106         JP      PACKS 
                           000001  3107 .ELSE                 
      009227 CD 8E 3A         [ 4] 3108         CALL     PACKS
                                   3109 ; uppercase TOKEN 
      00922A CD 86 9A         [ 4] 3110         CALL    DUPP 
      00922D CD 8D 52         [ 4] 3111         CALL    COUNT 
      009230 CD 86 63         [ 4] 3112         CALL    TOR 
      009233 CD 85 35         [ 4] 3113         CALL    BRAN 
      009236 92 64                 3114         .word   UPPER2  
      009238                       3115 UPPER:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



      009238 CD 86 9A         [ 4] 3116         CALL    DUPP 
      00923B CD 85 82         [ 4] 3117         CALL    CAT
      00923E CD 86 9A         [ 4] 3118         CALL    DUPP 
      009241 CD 84 F0         [ 4] 3119         CALL   DOLIT
      009244 00 61                 3120         .word   'a' 
      009246 CD 84 F0         [ 4] 3121         CALL    DOLIT
      009249 00 7B                 3122         .word   'z'+1 
      00924B CD 8A 17         [ 4] 3123         CALL   WITHI 
      00924E CD 85 19         [ 4] 3124         CALL   QBRAN
      009251 92 5B                 3125         .word  UPPER1  
      009253 CD 84 F0         [ 4] 3126         CALL    DOLIT 
      009256 00 DF                 3127         .word   0xDF 
      009258 CD 86 F7         [ 4] 3128         CALL    ANDD 
      00925B                       3129 UPPER1:
      00925B CD 86 C2         [ 4] 3130         CALL    OVER 
      00925E CD 85 71         [ 4] 3131         CALL    CSTOR          
      009261 CD 8C 23         [ 4] 3132         CALL    ONEP 
      009264                       3133 UPPER2: 
      009264 CD 85 04         [ 4] 3134         CALL    DONXT
      009267 92 38                 3135         .word   UPPER  
      009269 CD 86 90         [ 4] 3136         CALL    DROP  
      00926C 81               [ 4] 3137         RET 
                                   3138 .ENDIF 
                                   3139 
                                   3140 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3141 ;       TOKEN   ( -- a ; <string> )
                                   3142 ;       Parse a word from input stream
                                   3143 ;       and copy it to name dictionary.
                                   3144 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0011ED                       3145         _HEADER TOKEN,5,"TOKEN"
      00926D 92 19                    1         .word LINK 
                           0011EF     2         LINK=.
      00926F 05                       3         .byte 5  
      009270 54 4F 4B 45 4E           4         .ascii "TOKEN"
      009275                          5         TOKEN:
      009275 CD 8C 82         [ 4] 3146         CALL     BLANK
      009278 CC 92 1E         [ 2] 3147         JP     WORDD
                                   3148 
                                   3149 ;; Dictionary search
                                   3150 
                                   3151 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3152 ;       NAME>   ( na -- ca )
                                   3153 ;       Return a code address given
                                   3154 ;       a name address.
                                   3155 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0011FB                       3156         _HEADER NAMET,5,"NAME>"
      00927B 92 6F                    1         .word LINK 
                           0011FD     2         LINK=.
      00927D 05                       3         .byte 5  
      00927E 4E 41 4D 45 3E           4         .ascii "NAME>"
      009283                          5         NAMET:
      009283 CD 8D 52         [ 4] 3157         CALL     COUNT
      009286 CD 84 F0         [ 4] 3158         CALL     DOLIT
      009289 00 1F                 3159         .word      31
      00928B CD 86 F7         [ 4] 3160         CALL     ANDD
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



      00928E CC 88 BD         [ 2] 3161         JP     PLUS
                                   3162 
                                   3163 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3164 ;       SAME?   ( a a u -- a a f \ -0+ )
                                   3165 ;       Compare u cells in two
                                   3166 ;       strings. Return 0 if identical.
                                   3167 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001211                       3168         _HEADER SAMEQ,5,"SAME?"
      009291 92 7D                    1         .word LINK 
                           001213     2         LINK=.
      009293 05                       3         .byte 5  
      009294 53 41 4D 45 3F           4         .ascii "SAME?"
      009299                          5         SAMEQ:
      009299 CD 8C 30         [ 4] 3169         CALL     ONEM
      00929C CD 86 63         [ 4] 3170         CALL     TOR
      00929F 20 29            [ 2] 3171         JRA     SAME2
      0092A1 CD 86 C2         [ 4] 3172 SAME1:  CALL     OVER
      0092A4 CD 85 C6         [ 4] 3173         CALL     RAT
      0092A7 CD 88 BD         [ 4] 3174         CALL     PLUS
      0092AA CD 85 82         [ 4] 3175         CALL     CAT
      0092AD CD 86 C2         [ 4] 3176         CALL     OVER
      0092B0 CD 85 C6         [ 4] 3177         CALL     RAT
      0092B3 CD 88 BD         [ 4] 3178         CALL     PLUS
      0092B6 CD 85 82         [ 4] 3179         CALL     CAT
      0092B9 CD 89 53         [ 4] 3180         CALL     SUBB
      0092BC CD 88 4D         [ 4] 3181         CALL     QDUP
      0092BF CD 85 19         [ 4] 3182         CALL     QBRAN
      0092C2 92 CA                 3183         .word      SAME2
      0092C4 CD 85 B5         [ 4] 3184         CALL     RFROM
      0092C7 CC 86 90         [ 2] 3185         JP     DROP
      0092CA CD 85 04         [ 4] 3186 SAME2:  CALL     DONXT
      0092CD 92 A1                 3187         .word      SAME1
      0092CF CC 8C 8F         [ 2] 3188         JP     ZERO
                                   3189 
                                   3190 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3191 ;       find    ( a va -- ca na | a F )
                                   3192 ;       Search vocabulary for string.
                                   3193 ;       Return ca and na if succeeded.
                                   3194 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001252                       3195         _HEADER FIND,4,"FIND"
      0092D2 92 93                    1         .word LINK 
                           001254     2         LINK=.
      0092D4 04                       3         .byte 4  
      0092D5 46 49 4E 44              4         .ascii "FIND"
      0092D9                          5         FIND:
      0092D9 CD 86 AA         [ 4] 3196         CALL     SWAPP
      0092DC CD 86 9A         [ 4] 3197         CALL     DUPP
      0092DF CD 85 82         [ 4] 3198         CALL     CAT
      0092E2 CD 87 6F         [ 4] 3199         CALL     TEMP
      0092E5 CD 85 52         [ 4] 3200         CALL     STORE
      0092E8 CD 86 9A         [ 4] 3201         CALL     DUPP
      0092EB CD 85 64         [ 4] 3202         CALL     AT
      0092EE CD 86 63         [ 4] 3203         CALL     TOR
      0092F1 CD 8B F8         [ 4] 3204         CALL     CELLP
      0092F4 CD 86 AA         [ 4] 3205         CALL     SWAPP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



      0092F7 CD 85 64         [ 4] 3206 FIND1:  CALL     AT
      0092FA CD 86 9A         [ 4] 3207         CALL     DUPP
      0092FD CD 85 19         [ 4] 3208         CALL     QBRAN
      009300 93 36                 3209         .word      FIND6
      009302 CD 86 9A         [ 4] 3210         CALL     DUPP
      009305 CD 85 64         [ 4] 3211         CALL     AT
      009308 CD 84 F0         [ 4] 3212         CALL     DOLIT
      00930B 1F 7F                 3213         .word      MASKK
      00930D CD 86 F7         [ 4] 3214         CALL     ANDD
      009310 CD 85 C6         [ 4] 3215         CALL     RAT
      009313 CD 87 20         [ 4] 3216         CALL     XORR
      009316 CD 85 19         [ 4] 3217         CALL     QBRAN
      009319 93 25                 3218         .word      FIND2
      00931B CD 8B F8         [ 4] 3219         CALL     CELLP
      00931E CD 84 F0         [ 4] 3220         CALL     DOLIT
      009321 FF FF                 3221         .word     0xFFFF
      009323 20 0C            [ 2] 3222         JRA     FIND3
      009325 CD 8B F8         [ 4] 3223 FIND2:  CALL     CELLP
      009328 CD 87 6F         [ 4] 3224         CALL     TEMP
      00932B CD 85 64         [ 4] 3225         CALL     AT
      00932E CD 92 99         [ 4] 3226         CALL     SAMEQ
      009331 CD 85 35         [ 4] 3227 FIND3:  CALL     BRAN
      009334 93 45                 3228         .word      FIND4
      009336 CD 85 B5         [ 4] 3229 FIND6:  CALL     RFROM
      009339 CD 86 90         [ 4] 3230         CALL     DROP
      00933C CD 86 AA         [ 4] 3231         CALL     SWAPP
      00933F CD 8C 07         [ 4] 3232         CALL     CELLM
      009342 CC 86 AA         [ 2] 3233         JP     SWAPP
      009345 CD 85 19         [ 4] 3234 FIND4:  CALL     QBRAN
      009348 93 52                 3235         .word      FIND5
      00934A CD 8C 07         [ 4] 3236         CALL     CELLM
      00934D CD 8C 07         [ 4] 3237         CALL     CELLM
      009350 20 A5            [ 2] 3238         JRA     FIND1
      009352 CD 85 B5         [ 4] 3239 FIND5:  CALL     RFROM
      009355 CD 86 90         [ 4] 3240         CALL     DROP
      009358 CD 86 AA         [ 4] 3241         CALL     SWAPP
      00935B CD 86 90         [ 4] 3242         CALL     DROP
      00935E CD 8C 07         [ 4] 3243         CALL     CELLM
      009361 CD 86 9A         [ 4] 3244         CALL     DUPP
      009364 CD 92 83         [ 4] 3245         CALL     NAMET
      009367 CC 86 AA         [ 2] 3246         JP     SWAPP
                                   3247 
                                   3248 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3249 ;       NAME?   ( a -- ca na | a F )
                                   3250 ;       Search vocabularies for a string.
                                   3251 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0012EA                       3252         _HEADER NAMEQ,5,"NAME?"
      00936A 92 D4                    1         .word LINK 
                           0012EC     2         LINK=.
      00936C 05                       3         .byte 5  
      00936D 4E 41 4D 45 3F           4         .ascii "NAME?"
      009372                          5         NAMEQ:
      009372 CD 87 E3         [ 4] 3253         CALL   CNTXT
      009375 CC 92 D9         [ 2] 3254         JP     FIND
                                   3255 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



                                   3256 ;; Terminal response
                                   3257 
                                   3258 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3259 ;       ^H      ( bot eot cur -- bot eot cur )
                                   3260 ;       Backup cursor by one character.
                                   3261 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0012F8                       3262         _HEADER BKSP,2,"^H"
      009378 93 6C                    1         .word LINK 
                           0012FA     2         LINK=.
      00937A 02                       3         .byte 2  
      00937B 5E 48                    4         .ascii "^H"
      00937D                          5         BKSP:
      00937D CD 86 63         [ 4] 3263         CALL     TOR
      009380 CD 86 C2         [ 4] 3264         CALL     OVER
      009383 CD 85 B5         [ 4] 3265         CALL     RFROM
      009386 CD 86 AA         [ 4] 3266         CALL     SWAPP
      009389 CD 86 C2         [ 4] 3267         CALL     OVER
      00938C CD 87 20         [ 4] 3268         CALL     XORR
      00938F CD 85 19         [ 4] 3269         CALL     QBRAN
      009392 93 AD                 3270         .word      BACK1
      009394 CD 84 F0         [ 4] 3271         CALL     DOLIT
      009397 00 08                 3272         .word      BKSPP
      009399 CD 84 B7         [ 4] 3273         CALL     EMIT
      00939C CD 8C 30         [ 4] 3274         CALL     ONEM
      00939F CD 8C 82         [ 4] 3275         CALL     BLANK
      0093A2 CD 84 B7         [ 4] 3276         CALL     EMIT
      0093A5 CD 84 F0         [ 4] 3277         CALL     DOLIT
      0093A8 00 08                 3278         .word      BKSPP
      0093AA CC 84 B7         [ 2] 3279         JP     EMIT
      0093AD 81               [ 4] 3280 BACK1:  RET
                                   3281 
                                   3282 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3283 ;       TAP    ( bot eot cur c -- bot eot cur )
                                   3284 ;       Accept and echo key stroke
                                   3285 ;       and bump cursor.
                                   3286 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00132E                       3287         _HEADER TAP,3,"TAP"
      0093AE 93 7A                    1         .word LINK 
                           001330     2         LINK=.
      0093B0 03                       3         .byte 3  
      0093B1 54 41 50                 4         .ascii "TAP"
      0093B4                          5         TAP:
      0093B4 CD 86 9A         [ 4] 3288         CALL     DUPP
      0093B7 CD 84 B7         [ 4] 3289         CALL     EMIT
      0093BA CD 86 C2         [ 4] 3290         CALL     OVER
      0093BD CD 85 71         [ 4] 3291         CALL     CSTOR
      0093C0 CC 8C 23         [ 2] 3292         JP     ONEP
                                   3293 
                                   3294 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3295 ;       kTAP    ( bot eot cur c -- bot eot cur )
                                   3296 ;       Process a key stroke,
                                   3297 ;       CR,LF or backspace.
                                   3298 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001343                       3299         _HEADER KTAP,4,"KTAP"
      0093C3 93 B0                    1         .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



                           001345     2         LINK=.
      0093C5 04                       3         .byte 4  
      0093C6 4B 54 41 50              4         .ascii "KTAP"
      0093CA                          5         KTAP:
      0093CA CD 86 9A         [ 4] 3300         CALL     DUPP
      0093CD CD 84 F0         [ 4] 3301         CALL     DOLIT
                           000001  3302 .if EOL_CR
      0093D0 00 0D                 3303         .word   CRR
                           000000  3304 .else ; EOL_LF 
                                   3305         .word   LF
                                   3306 .endif 
      0093D2 CD 87 20         [ 4] 3307         CALL     XORR
      0093D5 CD 85 19         [ 4] 3308         CALL     QBRAN
      0093D8 93 F0                 3309         .word      KTAP2
      0093DA CD 84 F0         [ 4] 3310         CALL     DOLIT
      0093DD 00 08                 3311         .word      BKSPP
      0093DF CD 87 20         [ 4] 3312         CALL     XORR
      0093E2 CD 85 19         [ 4] 3313         CALL     QBRAN
      0093E5 93 ED                 3314         .word      KTAP1
      0093E7 CD 8C 82         [ 4] 3315         CALL     BLANK
      0093EA CC 93 B4         [ 2] 3316         JP     TAP
      0093ED CC 93 7D         [ 2] 3317 KTAP1:  JP     BKSP
      0093F0 CD 86 90         [ 4] 3318 KTAP2:  CALL     DROP
      0093F3 CD 86 AA         [ 4] 3319         CALL     SWAPP
      0093F6 CD 86 90         [ 4] 3320         CALL     DROP
      0093F9 CC 86 9A         [ 2] 3321         JP     DUPP
                                   3322 
                                   3323 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3324 ;       accept  ( b u -- b u )
                                   3325 ;       Accept characters to input
                                   3326 ;       buffer. Return with actual count.
                                   3327 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00137C                       3328         _HEADER ACCEP,6,"ACCEPT"
      0093FC 93 C5                    1         .word LINK 
                           00137E     2         LINK=.
      0093FE 06                       3         .byte 6  
      0093FF 41 43 43 45 50 54        4         .ascii "ACCEPT"
      009405                          5         ACCEP:
      009405 CD 86 C2         [ 4] 3329         CALL     OVER
      009408 CD 88 BD         [ 4] 3330         CALL     PLUS
      00940B CD 86 C2         [ 4] 3331         CALL     OVER
      00940E CD 88 A8         [ 4] 3332 ACCP1:  CALL     DDUP
      009411 CD 87 20         [ 4] 3333         CALL     XORR
      009414 CD 85 19         [ 4] 3334         CALL     QBRAN
      009417 94 39                 3335         .word      ACCP4
      009419 CD 8F 9B         [ 4] 3336         CALL     KEY
      00941C CD 86 9A         [ 4] 3337         CALL     DUPP
      00941F CD 8C 82         [ 4] 3338         CALL     BLANK
      009422 CD 84 F0         [ 4] 3339         CALL     DOLIT
      009425 00 7F                 3340         .word      127
      009427 CD 8A 17         [ 4] 3341         CALL     WITHI
      00942A CD 85 19         [ 4] 3342         CALL     QBRAN
      00942D 94 34                 3343         .word      ACCP2
      00942F CD 93 B4         [ 4] 3344         CALL     TAP
      009432 20 03            [ 2] 3345         JRA     ACCP3
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



      009434 CD 93 CA         [ 4] 3346 ACCP2:  CALL     KTAP
      009437 20 D5            [ 2] 3347 ACCP3:  JRA     ACCP1
      009439 CD 86 90         [ 4] 3348 ACCP4:  CALL     DROP
      00943C CD 86 C2         [ 4] 3349         CALL     OVER
      00943F CC 89 53         [ 2] 3350         JP     SUBB
                                   3351 
                                   3352 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3353 ;       QUERY   ( -- )
                                   3354 ;       Accept input stream to
                                   3355 ;       terminal input buffer.
                                   3356 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0013C2                       3357         _HEADER QUERY,5,"QUERY"
      009442 93 FE                    1         .word LINK 
                           0013C4     2         LINK=.
      009444 05                       3         .byte 5  
      009445 51 55 45 52 59           4         .ascii "QUERY"
      00944A                          5         QUERY:
      00944A CD 8D 8B         [ 4] 3358         CALL     TIB
      00944D CD 84 F0         [ 4] 3359         CALL     DOLIT
      009450 00 50                 3360         .word      80
      009452 CD 94 05         [ 4] 3361         CALL     ACCEP
      009455 CD 87 8E         [ 4] 3362         CALL     NTIB
      009458 CD 85 52         [ 4] 3363         CALL     STORE
      00945B CD 86 90         [ 4] 3364         CALL     DROP
      00945E CD 8C 8F         [ 4] 3365         CALL     ZERO
      009461 CD 87 7E         [ 4] 3366         CALL     INN
      009464 CC 85 52         [ 2] 3367         JP     STORE
                                   3368 
                                   3369 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3370 ;       ABORT   ( -- )
                                   3371 ;       Reset data stack and
                                   3372 ;       jump to QUIT.
                                   3373 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0013E7                       3374         _HEADER ABORT,5,"ABORT"
      009467 94 44                    1         .word LINK 
                           0013E9     2         LINK=.
      009469 05                       3         .byte 5  
      00946A 41 42 4F 52 54           4         .ascii "ABORT"
      00946F                          5         ABORT:
      00946F CD 95 63         [ 4] 3375         CALL     PRESE
      009472 CC 95 80         [ 2] 3376         JP     QUIT
                                   3377 
                                   3378 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3379 ;       abort"  ( f -- )
                                   3380 ;       Run time routine of ABORT".
                                   3381 ;       Abort with a message.
                                   3382 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0013F5                       3383         _HEADER ABORQ,COMPO+6,'ABORT"'
      009475 94 69                    1         .word LINK 
                           0013F7     2         LINK=.
      009477 46                       3         .byte COMPO+6  
      009478 41 42 4F 52 54 22        4         .ascii 'ABORT"'
      00947E                          5         ABORQ:
      00947E CD 85 19         [ 4] 3384         CALL     QBRAN
      009481 94 9D                 3385         .word      ABOR2   ;text flag
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



      009483 CD 90 26         [ 4] 3386         CALL     DOSTR
      009486 CD 8F D3         [ 4] 3387 ABOR1:  CALL     SPACE
      009489 CD 8D 52         [ 4] 3388         CALL     COUNT
      00948C CD 8F FD         [ 4] 3389         CALL     TYPES
      00948F CD 84 F0         [ 4] 3390         CALL     DOLIT
      009492 00 3F                 3391         .word     63 ; "?"
      009494 CD 84 B7         [ 4] 3392         CALL     EMIT
      009497 CD 90 16         [ 4] 3393         CALL     CR
      00949A CC 94 6F         [ 2] 3394         JP     ABORT   ;pass error string
      00949D CD 90 26         [ 4] 3395 ABOR2:  CALL     DOSTR
      0094A0 CC 86 90         [ 2] 3396         JP     DROP
                                   3397 
                                   3398 ;; The text interpreter
                                   3399 
                                   3400 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3401 ;       $INTERPRET      ( a -- )
                                   3402 ;       Interpret a word. If failed,
                                   3403 ;       try to convert it to an integer.
                                   3404 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001423                       3405         _HEADER INTER,10,"$INTERPRET"
      0094A3 94 77                    1         .word LINK 
                           001425     2         LINK=.
      0094A5 0A                       3         .byte 10  
      0094A6 24 49 4E 54 45 52 50     4         .ascii "$INTERPRET"
             52 45 54
      0094B0                          5         INTER:
      0094B0 CD 93 72         [ 4] 3406         CALL     NAMEQ
      0094B3 CD 88 4D         [ 4] 3407         CALL     QDUP    ;?defined
      0094B6 CD 85 19         [ 4] 3408         CALL     QBRAN
      0094B9 94 DA                 3409         .word      INTE1
      0094BB CD 85 64         [ 4] 3410         CALL     AT
      0094BE CD 84 F0         [ 4] 3411         CALL     DOLIT
      0094C1 40 00                 3412 	.word       0x4000	; COMPO*256
      0094C3 CD 86 F7         [ 4] 3413         CALL     ANDD    ;?compile only lexicon bits
      0094C6 CD 94 7E         [ 4] 3414         CALL     ABORQ
      0094C9 0D                    3415         .byte      13
      0094CA 20 63 6F 6D 70 69 6C  3416         .ascii     " compile only"
             65 20 6F 6E 6C 79
      0094D7 CC 85 45         [ 2] 3417         JP      EXECU
      0094DA                       3418 INTE1:  
      0094DA CD A6 68         [ 4] 3419         CALL     NUMBQ   ;convert a number
      0094DD CD 85 19         [ 4] 3420         CALL     QBRAN
      0094E0 94 86                 3421         .word    ABOR1
      0094E2 81               [ 4] 3422         RET
                                   3423 
                                   3424 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3425 ;       [       ( -- )
                                   3426 ;       Start  text interpreter.
                                   3427 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001463                       3428         _HEADER LBRAC,IMEDD+1,"["
      0094E3 94 A5                    1         .word LINK 
                           001465     2         LINK=.
      0094E5 81                       3         .byte IMEDD+1  
      0094E6 5B                       4         .ascii "["
      0094E7                          5         LBRAC:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



      0094E7 CD 84 F0         [ 4] 3429         CALL   DOLIT
      0094EA 94 B0                 3430         .word  INTER
      0094EC CD 87 C1         [ 4] 3431         CALL   TEVAL
      0094EF CC 85 52         [ 2] 3432         JP     STORE
                                   3433 
                                   3434 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3435 ;       .OK     ( -- )
                                   3436 ;       Display 'ok' while interpreting.
                                   3437 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001472                       3438         _HEADER DOTOK,3,".OK"
      0094F2 94 E5                    1         .word LINK 
                           001474     2         LINK=.
      0094F4 03                       3         .byte 3  
      0094F5 2E 4F 4B                 4         .ascii ".OK"
      0094F8                          5         DOTOK:
      0094F8 CD 84 F0         [ 4] 3439         CALL     DOLIT
      0094FB 94 B0                 3440         .word      INTER
      0094FD CD 87 C1         [ 4] 3441         CALL     TEVAL
      009500 CD 85 64         [ 4] 3442         CALL     AT
      009503 CD 89 7B         [ 4] 3443         CALL     EQUAL
      009506 CD 85 19         [ 4] 3444         CALL     QBRAN
      009509 95 12                 3445         .word      DOTO1
      00950B CD 90 43         [ 4] 3446         CALL     DOTQP
      00950E 03                    3447         .byte      3
      00950F 20 6F 6B              3448         .ascii     " ok"
      009512 CC 90 16         [ 2] 3449 DOTO1:  JP     CR
                                   3450 
                                   3451 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3452 ;       ?STACK  ( -- )
                                   3453 ;       Abort if stack underflows.
                                   3454 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001495                       3455         _HEADER QSTAC,6,"?STACK"
      009515 94 F4                    1         .word LINK 
                           001497     2         LINK=.
      009517 06                       3         .byte 6  
      009518 3F 53 54 41 43 4B        4         .ascii "?STACK"
      00951E                          5         QSTAC:
      00951E CD 8C D1         [ 4] 3456         CALL     DEPTH
      009521 CD 86 D1         [ 4] 3457         CALL     ZLESS   ;check only for underflow
      009524 CD 94 7E         [ 4] 3458         CALL     ABORQ
      009527 0B                    3459         .byte      11
      009528 20 75 6E 64 65 72 66  3460         .ascii     " underflow "
             6C 6F 77 20
      009533 81               [ 4] 3461         RET
                                   3462 
                                   3463 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3464 ;       EVAL    ( -- )
                                   3465 ;       Interpret  input stream.
                                   3466 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0014B4                       3467         _HEADER EVAL,4,"EVAL"
      009534 95 17                    1         .word LINK 
                           0014B6     2         LINK=.
      009536 04                       3         .byte 4  
      009537 45 56 41 4C              4         .ascii "EVAL"
      00953B                          5         EVAL:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



      00953B CD 92 75         [ 4] 3468 EVAL1:  CALL     TOKEN
      00953E CD 86 9A         [ 4] 3469         CALL     DUPP
      009541 CD 85 82         [ 4] 3470         CALL     CAT     ;?input stream empty
      009544 CD 85 19         [ 4] 3471         CALL     QBRAN
      009547 95 54                 3472         .word    EVAL2
      009549 CD 87 C1         [ 4] 3473         CALL     TEVAL
      00954C CD 8D 9F         [ 4] 3474         CALL     ATEXE
      00954F CD 95 1E         [ 4] 3475         CALL     QSTAC   ;evaluate input, check stack
      009552 20 E7            [ 2] 3476         JRA     EVAL1 
      009554 CD 86 90         [ 4] 3477 EVAL2:  CALL     DROP
      009557 CC 94 F8         [ 2] 3478         JP       DOTOK
                                   3479 
                                   3480 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3481 ;       PRESET  ( -- )
                                   3482 ;       Reset data stack pointer and
                                   3483 ;       terminal input buffer.
                                   3484 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0014DA                       3485         _HEADER PRESE,6,"PRESET"
      00955A 95 36                    1         .word LINK 
                           0014DC     2         LINK=.
      00955C 06                       3         .byte 6  
      00955D 50 52 45 53 45 54        4         .ascii "PRESET"
      009563                          5         PRESE:
      009563 CD 84 F0         [ 4] 3486         CALL     DOLIT
      009566 16 80                 3487         .word      SPP
      009568 CD 86 87         [ 4] 3488         CALL     SPSTO
      00956B CD 84 F0         [ 4] 3489         CALL     DOLIT
      00956E 17 00                 3490         .word      TIBB
      009570 CD 87 8E         [ 4] 3491         CALL     NTIB
      009573 CD 8B F8         [ 4] 3492         CALL     CELLP
      009576 CC 85 52         [ 2] 3493         JP     STORE
                                   3494 
                                   3495 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3496 ;       QUIT    ( -- )
                                   3497 ;       Reset return stack pointer
                                   3498 ;       and start text interpreter.
                                   3499 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0014F9                       3500         _HEADER QUIT,4,"QUIT"
      009579 95 5C                    1         .word LINK 
                           0014FB     2         LINK=.
      00957B 04                       3         .byte 4  
      00957C 51 55 49 54              4         .ascii "QUIT"
      009580                          5         QUIT:
      009580 CD 84 F0         [ 4] 3501         CALL     DOLIT
      009583 17 FF                 3502         .word      RPP
      009585 CD 85 9F         [ 4] 3503         CALL     RPSTO   ;reset return stack pointer
      009588 CD 94 E7         [ 4] 3504 QUIT1:  CALL     LBRAC   ;start interpretation
      00958B CD 94 4A         [ 4] 3505 QUIT2:  CALL     QUERY   ;get input
      00958E CD 95 3B         [ 4] 3506         CALL     EVAL
      009591 20 F8            [ 2] 3507         JRA     QUIT2   ;continue till error
                                   3508 
                                   3509 ;; The compiler
                                   3510 
                                   3511 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3512 ;       '       ( -- ca )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



                                   3513 ;       Search vocabularies for
                                   3514 ;       next word in input stream.
                                   3515 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001513                       3516         _HEADER TICK,1,"'"
      009593 95 7B                    1         .word LINK 
                           001515     2         LINK=.
      009595 01                       3         .byte 1  
      009596 27                       4         .ascii "'"
      009597                          5         TICK:
      009597 CD 92 75         [ 4] 3517         CALL     TOKEN
      00959A CD 93 72         [ 4] 3518         CALL     NAMEQ   ;?defined
      00959D CD 85 19         [ 4] 3519         CALL     QBRAN
      0095A0 94 86                 3520         .word      ABOR1
      0095A2 81               [ 4] 3521         RET     ;yes, push code address
                                   3522 
                                   3523 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3524 ;       ALLOT   ( n -- )
                                   3525 ;       Allocate n bytes to RAM 
                                   3526 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001523                       3527         _HEADER ALLOT,5,"ALLOT"
      0095A3 95 95                    1         .word LINK 
                           001525     2         LINK=.
      0095A5 05                       3         .byte 5  
      0095A6 41 4C 4C 4F 54           4         .ascii "ALLOT"
      0095AB                          5         ALLOT:
      0095AB CD 87 F1         [ 4] 3528         CALL     VPP
                                   3529 ; must update APP_VP each time VP is modidied
      0095AE CD 8C FF         [ 4] 3530         call PSTOR 
      0095B1 CC 9D B4         [ 2] 3531         jp UPDATVP 
                                   3532 
                                   3533 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3534 ;       ,       ( w -- )
                                   3535 ;         Compile an integer into
                                   3536 ;         variable space.
                                   3537 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001534                       3538         _HEADER COMMA,1,^/"\,"/
      0095B4 95 A5                    1         .word LINK 
                           001536     2         LINK=.
      0095B6 01                       3         .byte 1  
      0095B7 5C 2C                    4         .ascii "\,"
      0095B9                          5         COMMA:
      0095B9 CD 8D 69         [ 4] 3539         CALL     HERE
      0095BC CD 86 9A         [ 4] 3540         CALL     DUPP
      0095BF CD 8B F8         [ 4] 3541         CALL     CELLP   ;cell boundary
      0095C2 CD 87 F1         [ 4] 3542         CALL     VPP
      0095C5 CD 85 52         [ 4] 3543         CALL     STORE
      0095C8 CC 85 52         [ 2] 3544         JP     STORE
                                   3545 
                                   3546 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3547 ;       C,      ( c -- )
                                   3548 ;       Compile a byte into
                                   3549 ;       variables space.
                                   3550 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00154B                       3551         _HEADER CCOMMA,2,^/"C,"/
      0095CB 95 B6                    1         .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



                           00154D     2         LINK=.
      0095CD 02                       3         .byte 2  
      0095CE 43 2C                    4         .ascii "C,"
      0095D0                          5         CCOMMA:
      0095D0 CD 8D 69         [ 4] 3552         CALL     HERE
      0095D3 CD 86 9A         [ 4] 3553         CALL     DUPP
      0095D6 CD 8C 23         [ 4] 3554         CALL     ONEP
      0095D9 CD 87 F1         [ 4] 3555         CALL     VPP
      0095DC CD 85 52         [ 4] 3556         CALL     STORE
      0095DF CC 85 71         [ 2] 3557         JP     CSTOR
                                   3558 
                                   3559 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3560 ;       [COMPILE]       ( -- ; <string> )
                                   3561 ;       Compile next immediate
                                   3562 ;       word into code dictionary.
                                   3563 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001562                       3564         _HEADER BCOMP,IMEDD+9,"[COMPILE]"
      0095E2 95 CD                    1         .word LINK 
                           001564     2         LINK=.
      0095E4 89                       3         .byte IMEDD+9  
      0095E5 5B 43 4F 4D 50 49 4C     4         .ascii "[COMPILE]"
             45 5D
      0095EE                          5         BCOMP:
      0095EE CD 95 97         [ 4] 3565         CALL     TICK
      0095F1 CC 98 CF         [ 2] 3566         JP     JSRC
                                   3567 
                                   3568 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3569 ;       COMPILE ( -- )
                                   3570 ;       Compile next jsr in
                                   3571 ;       colon list to code dictionary.
                                   3572 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001574                       3573         _HEADER COMPI,COMPO+7,"COMPILE"
      0095F4 95 E4                    1         .word LINK 
                           001576     2         LINK=.
      0095F6 47                       3         .byte COMPO+7  
      0095F7 43 4F 4D 50 49 4C 45     4         .ascii "COMPILE"
      0095FE                          5         COMPI:
      0095FE CD 85 B5         [ 4] 3574         CALL     RFROM
      009601 CD 86 9A         [ 4] 3575         CALL     DUPP
      009604 CD 85 64         [ 4] 3576         CALL     AT
      009607 CD 98 CF         [ 4] 3577         CALL     JSRC    ;compile subroutine
      00960A CD 8B F8         [ 4] 3578         CALL     CELLP
      00960D 90 93            [ 1] 3579         ldw y,x 
      00960F 90 FE            [ 2] 3580         ldw y,(y)
      009611 1C 00 02         [ 2] 3581         addw x,#CELLL 
      009614 90 FC            [ 2] 3582         jp (y)
                                   3583 
                                   3584 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3585 ;       LITERAL ( w -- )
                                   3586 ;       Compile tos to dictionary
                                   3587 ;       as an integer literal.
                                   3588 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001596                       3589         _HEADER LITER,COMPO+IMEDD+7,"LITERAL"
      009616 95 F6                    1         .word LINK 
                           001598     2         LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



      009618 C7                       3         .byte COMPO+IMEDD+7  
      009619 4C 49 54 45 52 41 4C     4         .ascii "LITERAL"
      009620                          5         LITER:
      009620 CD 95 FE         [ 4] 3590         CALL     COMPI
      009623 84 F0                 3591         .word DOLIT 
      009625 CC 95 B9         [ 2] 3592         JP     COMMA
                                   3593 
                                   3594 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3595 ;       $,"     ( -- )
                                   3596 ;       Compile a literal string
                                   3597 ;       up to next " .
                                   3598 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3599 ;        _HEADER STRCQ,3,^/'$,"'/
      009628                       3600 STRCQ:
      009628 CD 84 F0         [ 4] 3601         CALL     DOLIT
      00962B 00 22                 3602         .word     34	; "
      00962D CD 91 B4         [ 4] 3603         CALL     PARSE
      009630 CD 8D 69         [ 4] 3604         CALL     HERE
      009633 CD 8E 3A         [ 4] 3605         CALL     PACKS   ;string to code dictionary
      009636 CD 8D 52         [ 4] 3606         CALL     COUNT
      009639 CD 88 BD         [ 4] 3607         CALL     PLUS    ;calculate aligned end of string
      00963C CD 87 F1         [ 4] 3608         CALL     VPP
      00963F CC 85 52         [ 2] 3609         JP     STORE
                                   3610 
                                   3611 ;; Structures
                                   3612 
                                   3613 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3614 ;       FOR     ( -- a )
                                   3615 ;       Start a FOR-NEXT loop
                                   3616 ;       structure in a colon definition.
                                   3617 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0015C2                       3618         _HEADER FOR,IMEDD+3,"FOR"
      009642 96 18                    1         .word LINK 
                           0015C4     2         LINK=.
      009644 83                       3         .byte IMEDD+3  
      009645 46 4F 52                 4         .ascii "FOR"
      009648                          5         FOR:
      009648 CD 95 FE         [ 4] 3619         CALL     COMPI
      00964B 86 63                 3620         .word TOR 
      00964D CC 8D 69         [ 2] 3621         JP     HERE
                                   3622 
                                   3623 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3624 ;       NEXT    ( a -- )
                                   3625 ;       Terminate a FOR-NEXT loop.
                                   3626 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0015D0                       3627         _HEADER NEXT,IMEDD+4,"NEXT"
      009650 96 44                    1         .word LINK 
                           0015D2     2         LINK=.
      009652 84                       3         .byte IMEDD+4  
      009653 4E 45 58 54              4         .ascii "NEXT"
      009657                          5         NEXT:
      009657 CD 95 FE         [ 4] 3628         CALL     COMPI
      00965A 85 04                 3629         .word DONXT 
      00965C CD 88 3D         [ 4] 3630         call ADRADJ
      00965F CC 95 B9         [ 2] 3631         JP     COMMA
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



                                   3632 
                                   3633 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3634 ;       I ( -- n )
                                   3635 ;       stack COUNTER
                                   3636 ;       of innermost FOR-NEXT  
                                   3637 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0015E2                       3638         _HEADER IFETCH,1,"I"
      009662 96 52                    1         .word LINK 
                           0015E4     2         LINK=.
      009664 01                       3         .byte 1  
      009665 49                       4         .ascii "I"
      009666                          5         IFETCH:
      009666 1D 00 02         [ 2] 3639         subw x,#CELLL 
      009669 16 03            [ 2] 3640         ldw y,(3,sp)
      00966B FF               [ 2] 3641         ldw (x),y 
      00966C 81               [ 4] 3642         ret 
                                   3643 
                                   3644 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3645 ;       J ( -- n )
                                   3646 ;   stack COUNTER
                                   3647 ;   of outer FOR-NEXT  
                                   3648 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0015ED                       3649         _HEADER JFETCH,1,"J"
      00966D 96 64                    1         .word LINK 
                           0015EF     2         LINK=.
      00966F 01                       3         .byte 1  
      009670 4A                       4         .ascii "J"
      009671                          5         JFETCH:
      009671 1D 00 02         [ 2] 3650         SUBW X,#CELLL 
      009674 16 05            [ 2] 3651         LDW Y,(5,SP)
      009676 FF               [ 2] 3652         LDW (X),Y 
      009677 81               [ 4] 3653         RET 
                                   3654 
                                   3655 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3656 ;       BEGIN   ( -- a )
                                   3657 ;       Start an infinite or
                                   3658 ;       indefinite loop structure.
                                   3659 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0015F8                       3660         _HEADER BEGIN,IMEDD+5,"BEGIN"
      009678 96 6F                    1         .word LINK 
                           0015FA     2         LINK=.
      00967A 85                       3         .byte IMEDD+5  
      00967B 42 45 47 49 4E           4         .ascii "BEGIN"
      009680                          5         BEGIN:
      009680 CC 8D 69         [ 2] 3661         JP     HERE
                                   3662 
                                   3663 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3664 ;       UNTIL   ( a -- )
                                   3665 ;       Terminate a BEGIN-UNTIL
                                   3666 ;       indefinite loop structure.
                                   3667 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001603                       3668         _HEADER UNTIL,IMEDD+5,"UNTIL"
      009683 96 7A                    1         .word LINK 
                           001605     2         LINK=.
      009685 85                       3         .byte IMEDD+5  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



      009686 55 4E 54 49 4C           4         .ascii "UNTIL"
      00968B                          5         UNTIL:
      00968B CD 95 FE         [ 4] 3669         CALL     COMPI
      00968E 85 19                 3670         .word    QBRAN 
      009690 CD 88 3D         [ 4] 3671         call ADRADJ
      009693 CC 95 B9         [ 2] 3672         JP     COMMA
                                   3673 
                                   3674 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3675 ;       AGAIN   ( a -- )
                                   3676 ;       Terminate a BEGIN-AGAIN
                                   3677 ;       infinite loop structure.
                                   3678 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001616                       3679         _HEADER AGAIN,IMEDD+5,"AGAIN"
      009696 96 85                    1         .word LINK 
                           001618     2         LINK=.
      009698 85                       3         .byte IMEDD+5  
      009699 41 47 41 49 4E           4         .ascii "AGAIN"
      00969E                          5         AGAIN:
                           000001  3680 .if OPTIMIZE 
      00161E                       3681         _DOLIT JPIMM 
      00969E CD 84 F0         [ 4]    1     CALL DOLIT 
      0096A1 00 CC                    2     .word JPIMM 
      0096A3 CD 95 D0         [ 4] 3682         CALL  CCOMMA
                           000000  3683 .else 
                                   3684         CALL     COMPI
                                   3685         .word BRAN
                                   3686 .endif 
      0096A6 CD 88 3D         [ 4] 3687         call ADRADJ 
      0096A9 CC 95 B9         [ 2] 3688         JP     COMMA
                                   3689 
                                   3690 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3691 ;       IF      ( -- A )
                                   3692 ;       Begin a conditional branch.
                                   3693 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00162C                       3694         _HEADER IFF,IMEDD+2,"IF"
      0096AC 96 98                    1         .word LINK 
                           00162E     2         LINK=.
      0096AE 82                       3         .byte IMEDD+2  
      0096AF 49 46                    4         .ascii "IF"
      0096B1                          5         IFF:
      0096B1 CD 95 FE         [ 4] 3695         CALL     COMPI
      0096B4 85 19                 3696         .word QBRAN
      0096B6 CD 8D 69         [ 4] 3697         CALL     HERE
      0096B9 CD 8C 8F         [ 4] 3698         CALL     ZERO
      0096BC CC 95 B9         [ 2] 3699         JP     COMMA
                                   3700 
                                   3701 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3702 ;       THEN        ( A -- )
                                   3703 ;       Terminate a conditional 
                                   3704 ;       branch structure.
                                   3705 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00163F                       3706         _HEADER THENN,IMEDD+4,"THEN"
      0096BF 96 AE                    1         .word LINK 
                           001641     2         LINK=.
      0096C1 84                       3         .byte IMEDD+4  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



      0096C2 54 48 45 4E              4         .ascii "THEN"
      0096C6                          5         THENN:
      0096C6 CD 8D 69         [ 4] 3707         CALL     HERE
      0096C9 CD 88 3D         [ 4] 3708         call ADRADJ 
      0096CC CD 86 AA         [ 4] 3709         CALL     SWAPP
      0096CF CC 85 52         [ 2] 3710         JP     STORE
                                   3711 
                                   3712 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3713 ;       ELSE        ( A -- A )
                                   3714 ;       Start the false clause in 
                                   3715 ;       an IF-ELSE-THEN structure.
                                   3716 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001652                       3717         _HEADER ELSEE,IMEDD+4,"ELSE"
      0096D2 96 C1                    1         .word LINK 
                           001654     2         LINK=.
      0096D4 84                       3         .byte IMEDD+4  
      0096D5 45 4C 53 45              4         .ascii "ELSE"
      0096D9                          5         ELSEE:
                           000001  3718 .if OPTIMIZE 
      001659                       3719         _DOLIT JPIMM 
      0096D9 CD 84 F0         [ 4]    1     CALL DOLIT 
      0096DC 00 CC                    2     .word JPIMM 
      0096DE CD 95 D0         [ 4] 3720         CALL CCOMMA 
                           000000  3721 .else 
                                   3722          CALL     COMPI
                                   3723         .word BRAN
                                   3724 .endif 
      0096E1 CD 8D 69         [ 4] 3725         CALL     HERE
      0096E4 CD 8C 8F         [ 4] 3726         CALL     ZERO
      0096E7 CD 95 B9         [ 4] 3727         CALL     COMMA
      0096EA CD 86 AA         [ 4] 3728         CALL     SWAPP
      0096ED CD 8D 69         [ 4] 3729         CALL     HERE
      0096F0 CD 88 3D         [ 4] 3730         call ADRADJ 
      0096F3 CD 86 AA         [ 4] 3731         CALL     SWAPP
      0096F6 CC 85 52         [ 2] 3732         JP     STORE
                                   3733 
                                   3734 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3735 ;       AHEAD       ( -- A )
                                   3736 ;       Compile a forward branch
                                   3737 ;       instruction.
                                   3738 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001679                       3739         _HEADER AHEAD,IMEDD+5,"AHEAD"
      0096F9 96 D4                    1         .word LINK 
                           00167B     2         LINK=.
      0096FB 85                       3         .byte IMEDD+5  
      0096FC 41 48 45 41 44           4         .ascii "AHEAD"
      009701                          5         AHEAD:
                           000001  3740 .if OPTIMIZE 
      001681                       3741         _DOLIT JPIMM 
      009701 CD 84 F0         [ 4]    1     CALL DOLIT 
      009704 00 CC                    2     .word JPIMM 
      009706 CD 95 D0         [ 4] 3742         CALL CCOMMA
                           000000  3743 .else 
                                   3744         CALL     COMPI
                                   3745         .word BRAN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



                                   3746 .endif 
      009709 CD 8D 69         [ 4] 3747         CALL     HERE
      00970C CD 8C 8F         [ 4] 3748         CALL     ZERO
      00970F CC 95 B9         [ 2] 3749         JP     COMMA
                                   3750 
                                   3751 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3752 ;       WHILE       ( a -- A a )
                                   3753 ;       Conditional branch out of a 
                                   3754 ;       BEGIN-WHILE-REPEAT loop.
                                   3755 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001692                       3756         _HEADER WHILE,IMEDD+5,"WHILE"
      009712 96 FB                    1         .word LINK 
                           001694     2         LINK=.
      009714 85                       3         .byte IMEDD+5  
      009715 57 48 49 4C 45           4         .ascii "WHILE"
      00971A                          5         WHILE:
      00971A CD 95 FE         [ 4] 3757         CALL     COMPI
      00971D 85 19                 3758         .word QBRAN
      00971F CD 8D 69         [ 4] 3759         CALL     HERE
      009722 CD 8C 8F         [ 4] 3760         CALL     ZERO
      009725 CD 95 B9         [ 4] 3761         CALL     COMMA
      009728 CC 86 AA         [ 2] 3762         JP     SWAPP
                                   3763 
                                   3764 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3765 ;       REPEAT      ( A a -- )
                                   3766 ;       Terminate a BEGIN-WHILE-REPEAT 
                                   3767 ;       indefinite loop.
                                   3768 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0016AB                       3769         _HEADER REPEA,IMEDD+6,"REPEAT"
      00972B 97 14                    1         .word LINK 
                           0016AD     2         LINK=.
      00972D 86                       3         .byte IMEDD+6  
      00972E 52 45 50 45 41 54        4         .ascii "REPEAT"
      009734                          5         REPEA:
                           000001  3770 .if OPTIMIZE 
      0016B4                       3771         _DOLIT JPIMM 
      009734 CD 84 F0         [ 4]    1     CALL DOLIT 
      009737 00 CC                    2     .word JPIMM 
      009739 CD 95 D0         [ 4] 3772         CALL  CCOMMA
                           000000  3773 .else 
                                   3774         CALL     COMPI
                                   3775         .word BRAN
                                   3776 .endif 
      00973C CD 88 3D         [ 4] 3777         call ADRADJ 
      00973F CD 95 B9         [ 4] 3778         CALL     COMMA
      009742 CD 8D 69         [ 4] 3779         CALL     HERE
      009745 CD 88 3D         [ 4] 3780         call ADRADJ 
      009748 CD 86 AA         [ 4] 3781         CALL     SWAPP
      00974B CC 85 52         [ 2] 3782         JP     STORE
                                   3783 
                                   3784 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3785 ;       AFT         ( a -- a A )
                                   3786 ;       Jump to THEN in a FOR-AFT-THEN-NEXT 
                                   3787 ;       loop the first time through.
                                   3788 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



      0016CE                       3789         _HEADER AFT,IMEDD+3,"AFT"
      00974E 97 2D                    1         .word LINK 
                           0016D0     2         LINK=.
      009750 83                       3         .byte IMEDD+3  
      009751 41 46 54                 4         .ascii "AFT"
      009754                          5         AFT:
      009754 CD 86 90         [ 4] 3790         CALL     DROP
      009757 CD 97 01         [ 4] 3791         CALL     AHEAD
      00975A CD 8D 69         [ 4] 3792         CALL     HERE
      00975D CC 86 AA         [ 2] 3793         JP     SWAPP
                                   3794 
                                   3795 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3796 ;       ABORT"      ( -- ; <string> )
                                   3797 ;       Conditional abort with an error message.
                                   3798 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0016E0                       3799         _HEADER ABRTQ,IMEDD+6,'ABORT"'
      009760 97 50                    1         .word LINK 
                           0016E2     2         LINK=.
      009762 86                       3         .byte IMEDD+6  
      009763 41 42 4F 52 54 22        4         .ascii 'ABORT"'
      009769                          5         ABRTQ:
      009769 CD 95 FE         [ 4] 3800         CALL     COMPI
      00976C 94 7E                 3801         .word ABORQ
      00976E CC 96 28         [ 2] 3802         JP     STRCQ
                                   3803 
                                   3804 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3805 ;       $"     ( -- ; <string> )
                                   3806 ;       Compile an inline string literal.
                                   3807 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0016F1                       3808         _HEADER STRQ,IMEDD+2,'$"'
      009771 97 62                    1         .word LINK 
                           0016F3     2         LINK=.
      009773 82                       3         .byte IMEDD+2  
      009774 24 22                    4         .ascii '$"'
      009776                          5         STRQ:
      009776 CD 95 FE         [ 4] 3809         CALL     COMPI
      009779 90 3F                 3810         .word STRQP 
      00977B CC 96 28         [ 2] 3811         JP     STRCQ
                                   3812 
                                   3813 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3814 ;       ."          ( -- ; <string> )
                                   3815 ;       Compile an inline string literal 
                                   3816 ;       to be typed out at run time.
                                   3817 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0016FE                       3818         _HEADER DOTQ,IMEDD+2,'."'
      00977E 97 73                    1         .word LINK 
                           001700     2         LINK=.
      009780 82                       3         .byte IMEDD+2  
      009781 2E 22                    4         .ascii '."'
      009783                          5         DOTQ:
      009783 CD 95 FE         [ 4] 3819         CALL     COMPI
      009786 90 43                 3820         .word DOTQP 
      009788 CC 96 28         [ 2] 3821         JP     STRCQ
                                   3822 
                                   3823 ;; Name compiler
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



                                   3824 
                                   3825 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3826 ;       ?UNIQUE ( a -- a )
                                   3827 ;       Display a warning message
                                   3828 ;       if word already exists.
                                   3829 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00170B                       3830         _HEADER UNIQU,7,"?UNIQUE"
      00978B 97 80                    1         .word LINK 
                           00170D     2         LINK=.
      00978D 07                       3         .byte 7  
      00978E 3F 55 4E 49 51 55 45     4         .ascii "?UNIQUE"
      009795                          5         UNIQU:
      009795 CD 86 9A         [ 4] 3831         CALL     DUPP
      009798 CD 93 72         [ 4] 3832         CALL     NAMEQ   ;?name exists
      00979B CD 85 19         [ 4] 3833         CALL     QBRAN
      00979E 97 B4                 3834         .word      UNIQ1
      0097A0 CD 90 43         [ 4] 3835         CALL     DOTQP   ;redef are OK
      0097A3 07                    3836         .byte       7
      0097A4 20 72 65 44 65 66 20  3837         .ascii     " reDef "       
      0097AB CD 86 C2         [ 4] 3838         CALL     OVER
      0097AE CD 8D 52         [ 4] 3839         CALL     COUNT
      0097B1 CD 8F FD         [ 4] 3840         CALL     TYPES   ;just in case
      0097B4 CC 86 90         [ 2] 3841 UNIQ1:  JP     DROP
                                   3842 
                                   3843 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3844 ;       $,n     ( na -- )
                                   3845 ;       Build a new dictionary name
                                   3846 ;       using string at na.
                                   3847 ; compile dans l'espace des variables 
                                   3848 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3849 ;        _HEADER SNAME,3,^/"$,n"/
      0097B7                       3850 SNAME: 
      0097B7 CD 86 9A         [ 4] 3851         CALL     DUPP
      0097BA CD 85 82         [ 4] 3852         CALL     CAT     ;?null input
      0097BD CD 85 19         [ 4] 3853         CALL     QBRAN
      0097C0 97 ED                 3854         .word      PNAM1
      0097C2 CD 97 95         [ 4] 3855         CALL     UNIQU   ;?redefinition
      0097C5 CD 86 9A         [ 4] 3856         CALL     DUPP
      0097C8 CD 8D 52         [ 4] 3857         CALL     COUNT
      0097CB CD 88 BD         [ 4] 3858         CALL     PLUS
      0097CE CD 87 F1         [ 4] 3859         CALL     VPP
      0097D1 CD 85 52         [ 4] 3860         CALL     STORE
      0097D4 CD 86 9A         [ 4] 3861         CALL     DUPP
      0097D7 CD 88 0F         [ 4] 3862         CALL     LAST
      0097DA CD 85 52         [ 4] 3863         CALL     STORE   ;save na for vocabulary link
      0097DD CD 8C 07         [ 4] 3864         CALL     CELLM   ;link address
      0097E0 CD 87 E3         [ 4] 3865         CALL     CNTXT
      0097E3 CD 85 64         [ 4] 3866         CALL     AT
      0097E6 CD 86 AA         [ 4] 3867         CALL     SWAPP
      0097E9 CD 85 52         [ 4] 3868         CALL     STORE
      0097EC 81               [ 4] 3869         RET     ;save code pointer
      0097ED CD 90 3F         [ 4] 3870 PNAM1:  CALL     STRQP
      0097F0 05                    3871         .byte      5
      0097F1 20 6E 61 6D 65        3872         .ascii     " name" ;null input
      0097F6 CC 94 86         [ 2] 3873         JP     ABOR1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



                                   3874 
                                   3875 ;; FORTH compiler
                                   3876 
                                   3877 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3878 ;       $COMPILE        ( a -- )
                                   3879 ;       Compile next word to
                                   3880 ;       dictionary as a token or literal.
                                   3881 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001779                       3882         _HEADER SCOMP,8,"$COMPILE"
      0097F9 97 8D                    1         .word LINK 
                           00177B     2         LINK=.
      0097FB 08                       3         .byte 8  
      0097FC 24 43 4F 4D 50 49 4C     4         .ascii "$COMPILE"
             45
      009804                          5         SCOMP:
      009804 CD 93 72         [ 4] 3883         CALL     NAMEQ
      009807 CD 88 4D         [ 4] 3884         CALL     QDUP    ;?defined
      00980A CD 85 19         [ 4] 3885         CALL     QBRAN
      00980D 98 25                 3886         .word      SCOM2
      00980F CD 85 64         [ 4] 3887         CALL     AT
      009812 CD 84 F0         [ 4] 3888         CALL     DOLIT
      009815 80 00                 3889         .word     0x8000	;  IMEDD*256
      009817 CD 86 F7         [ 4] 3890         CALL     ANDD    ;?immediate
      00981A CD 85 19         [ 4] 3891         CALL     QBRAN
      00981D 98 22                 3892         .word      SCOM1
      00981F CC 85 45         [ 2] 3893         JP     EXECU
      009822 CC 98 CF         [ 2] 3894 SCOM1:  JP     JSRC
      009825 CD A6 68         [ 4] 3895 SCOM2:  CALL     NUMBQ   ;try to convert to number
      009828 CD 88 4D         [ 4] 3896         CALL    QDUP  
      00982B CD 85 19         [ 4] 3897         CALL     QBRAN
      00982E 94 86                 3898         .word      ABOR1
      0017B0                       3899         _DOLIT  -1
      009830 CD 84 F0         [ 4]    1     CALL DOLIT 
      009833 FF FF                    2     .word -1 
      009835 CD 89 7B         [ 4] 3900         CALL    EQUAL
      0017B8                       3901         _QBRAN DLITER  
      009838 CD 85 19         [ 4]    1     CALL QBRAN
      00983B AA 47                    2     .word DLITER
      00983D CC 96 20         [ 2] 3902         JP     LITER
                                   3903 
                                   3904 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3905 ;       OVERT   ( -- )
                                   3906 ;       Link a new word into vocabulary.
                                   3907 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0017C0                       3908         _HEADER OVERT,5,"OVERT"
      009840 97 FB                    1         .word LINK 
                           0017C2     2         LINK=.
      009842 05                       3         .byte 5  
      009843 4F 56 45 52 54           4         .ascii "OVERT"
      009848                          5         OVERT:
      009848 CD 88 0F         [ 4] 3909         CALL     LAST
      00984B CD 85 64         [ 4] 3910         CALL     AT
      00984E CD 87 E3         [ 4] 3911         CALL     CNTXT
      009851 CC 85 52         [ 2] 3912         JP     STORE
                                   3913 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



                                   3914 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3915 ;       ;       ( -- )
                                   3916 ;       Terminate a colon definition.
                                   3917 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0017D4                       3918         _HEADER SEMIS,IMEDD+COMPO+1,^/";"/
      009854 98 42                    1         .word LINK 
                           0017D6     2         LINK=.
      009856 C1                       3         .byte IMEDD+COMPO+1  
      009857 3B                       4         .ascii ";"
      009858                          5         SEMIS:
                           000001  3919 .if OPTIMIZE ; more compact and faster
      009858 CD 84 F0         [ 4] 3920         call DOLIT 
      00985B 00 81                 3921         .word 0x81   ; opcode for RET 
      00985D CD 95 D0         [ 4] 3922         call CCOMMA 
                           000000  3923 .else
                                   3924         CALL     COMPI
                                   3925         .word EXIT 
                                   3926 .endif 
      009860 CD 94 E7         [ 4] 3927         CALL     LBRAC
      009863 CD 98 48         [ 4] 3928         call OVERT 
      009866 CD A3 0C         [ 4] 3929         CALL FMOVE
      009869 CD 88 4D         [ 4] 3930         call QDUP 
      00986C CD 85 19         [ 4] 3931         call QBRAN 
      00986F 99 E5                 3932         .word SET_RAMLAST 
      009871 CD A3 A0         [ 4] 3933         CALL UPDATPTR
      009874 81               [ 4] 3934         RET 
                                   3935 
                                   3936 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3937 ;       Terminate an ISR definition 
                                   3938 ;       retourn ca of ISR as double
                                   3939 ;       I; ( -- ud )
                                   3940 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0017F5                       3941        _HEADER ISEMI,2+IMEDD+COMPO,^/"I;"/
      009875 98 56                    1         .word LINK 
                           0017F7     2         LINK=.
      009877 C2                       3         .byte 2+IMEDD+COMPO  
      009878 49 3B                    4         .ascii "I;"
      00987A                          5         ISEMI:
      00987A 1D 00 02         [ 2] 3942         subw x,#CELLL  
      00987D 90 AE 00 80      [ 2] 3943         ldw y,#IRET_CODE 
      009881 FF               [ 2] 3944         ldw (x),y 
      009882 CD 95 D0         [ 4] 3945         call CCOMMA
      009885 CD 94 E7         [ 4] 3946         call LBRAC 
      009888 CD A3 E5         [ 4] 3947         call IFMOVE
      00988B CD 88 4D         [ 4] 3948         call QDUP 
      00988E CD 85 19         [ 4] 3949         CALL QBRAN 
      009891 99 E5                 3950         .word SET_RAMLAST
      009893 CD 87 FF         [ 4] 3951         CALL CPP
      009896 CD 85 64         [ 4] 3952         call AT 
      009899 CD 86 AA         [ 4] 3953         call SWAPP 
      00989C CD 87 FF         [ 4] 3954         CALL CPP 
      00989F CD 85 52         [ 4] 3955         call STORE 
      0098A2 CD 9D 9D         [ 4] 3956         call UPDATCP 
      0098A5 CD 9D 5A         [ 4] 3957         call EEPVP 
      001828                       3958         _DROP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



      0098A8 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      0098AB CD 85 64         [ 4] 3959         call AT 
      0098AE CD 87 F1         [ 4] 3960         call VPP 
      0098B1 CD 85 52         [ 4] 3961         call STORE 
      0098B4 CC 8C 8F         [ 2] 3962         jp ZERO
      0098B7 81               [ 4] 3963         ret           
                                   3964         
                                   3965 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3966 ;       ]       ( -- )
                                   3967 ;       Start compiling words in
                                   3968 ;       input stream.
                                   3969 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001838                       3970         _HEADER RBRAC,1,"]"
      0098B8 98 77                    1         .word LINK 
                           00183A     2         LINK=.
      0098BA 01                       3         .byte 1  
      0098BB 5D                       4         .ascii "]"
      0098BC                          5         RBRAC:
      0098BC CD 84 F0         [ 4] 3971         CALL   DOLIT
      0098BF 98 04                 3972         .word  SCOMP
      0098C1 CD 87 C1         [ 4] 3973         CALL   TEVAL
      0098C4 CC 85 52         [ 2] 3974         JP     STORE
                                   3975 
                                   3976 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3977 ;       CALL,    ( ca -- )
                                   3978 ;       Compile a subroutine call.
                                   3979 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001847                       3980         _HEADER JSRC,5,^/"CALL,"/
      0098C7 98 BA                    1         .word LINK 
                           001849     2         LINK=.
      0098C9 05                       3         .byte 5  
      0098CA 43 41 4C 4C 2C           4         .ascii "CALL,"
      0098CF                          5         JSRC:
                           000001  3981 .if OPTIMIZE 
                                   3982 ;;;;; optimization code ;;;;;;;;;;;;;;;
      0098CF 90 AE 86 90      [ 2] 3983         LDW Y,#DROP 
      0098D3 90 BF 26         [ 2] 3984         LDW YTEMP,Y 
      0098D6 90 93            [ 1] 3985         LDW Y,X 
      0098D8 90 FE            [ 2] 3986         LDW Y,(Y)
      0098DA 90 B3 26         [ 2] 3987         CPW Y,YTEMP 
      0098DD 26 13            [ 1] 3988         JRNE JSRC1         
                                   3989 ; replace CALL DROP BY  ADDW X,#CELLL 
      0098DF 1C 00 02         [ 2] 3990         ADDW X,#CELLL 
      001862                       3991         _DOLIT ADDWX ; opcode 
      0098E2 CD 84 F0         [ 4]    1     CALL DOLIT 
      0098E5 00 1C                    2     .word ADDWX 
      0098E7 CD 95 D0         [ 4] 3992         CALL   CCOMMA 
      00186A                       3993         _DOLIT CELLL 
      0098EA CD 84 F0         [ 4]    1     CALL DOLIT 
      0098ED 00 02                    2     .word CELLL 
      0098EF CC 95 B9         [ 2] 3994         JP      COMMA 
      0098F2                       3995 JSRC1: ; check for DDROP 
      0098F2 90 AE 88 9D      [ 2] 3996         LDW Y,#DDROP 
      0098F6 90 BF 26         [ 2] 3997         LDW YTEMP,Y 
      0098F9 90 93            [ 1] 3998         LDW Y,X 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



      0098FB 90 FE            [ 2] 3999         LDW Y,(Y)
      0098FD 90 B3 26         [ 2] 4000         CPW Y,YTEMP 
      009900 26 13            [ 1] 4001         JRNE JSRC2 
                                   4002 ; replace CALL DDROP BY ADDW X,#2*CELLL 
      009902 1C 00 02         [ 2] 4003         ADDW X,#CELLL 
      001885                       4004         _DOLIT ADDWX 
      009905 CD 84 F0         [ 4]    1     CALL DOLIT 
      009908 00 1C                    2     .word ADDWX 
      00990A CD 95 D0         [ 4] 4005         CALL  CCOMMA 
      00188D                       4006         _DOLIT 2*CELLL 
      00990D CD 84 F0         [ 4]    1     CALL DOLIT 
      009910 00 04                    2     .word 2*CELLL 
      009912 CC 95 B9         [ 2] 4007         JP  COMMA 
      009915                       4008 JSRC2: 
                                   4009 ;;;;;;;; end optimization code ;;;;;;;;;;        
                                   4010 .endif        
      009915 CD 84 F0         [ 4] 4011         CALL     DOLIT
      009918 00 CD                 4012         .word     CALLL     ;CALL
      00991A CD 95 D0         [ 4] 4013         CALL     CCOMMA
      00991D CC 95 B9         [ 2] 4014         JP     COMMA
                                   4015 
                                   4016 ;       INIT-OFS ( -- )
                                   4017 ;       compute offset to adjust jump address 
                                   4018 ;       set variable OFFSET 
      009920 98 C9                 4019         .word LINK 
                           0018A2  4020         LINK=.
      009922 08                    4021         .byte 8 
      009923 49 4E 49 54 2D 4F 46  4022         .ascii "INIT-OFS" 
             53
      00992B                       4023 INITOFS:
      00992B CD 87 B0         [ 4] 4024         call TFLASH 
      00992E CD 85 64         [ 4] 4025         CALL AT 
      009931 CD 86 9A         [ 4] 4026         CALL DUPP 
      009934 CD 85 19         [ 4] 4027         call QBRAN
      009937 99 48                 4028         .word 1$
      0018B9                       4029         _DROP  
      009939 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00993C CD 87 FF         [ 4] 4030         call CPP 
      00993F CD 85 64         [ 4] 4031         call AT 
      009942 CD 8D 69         [ 4] 4032         call HERE
      009945 CD 89 53         [ 4] 4033         call SUBB 
      009948 CD 88 34         [ 4] 4034 1$:     call OFFSET 
      00994B CC 85 52         [ 2] 4035         jp STORE  
                                   4036 
                                   4037 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4038 ;       :       ( -- ; <string> )
                                   4039 ;       Start a new colon definition
                                   4040 ;       using next word as its name.
                                   4041 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0018CE                       4042         _HEADER COLON,1,":"
      00994E 99 22                    1         .word LINK 
                           0018D0     2         LINK=.
      009950 01                       3         .byte 1  
      009951 3A                       4         .ascii ":"
      009952                          5         COLON:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



      009952 CD 99 2B         [ 4] 4043         call INITOFS       
      009955 CD 92 75         [ 4] 4044         CALL   TOKEN
      009958 CD 97 B7         [ 4] 4045         CALL   SNAME
      00995B CC 98 BC         [ 2] 4046         JP     RBRAC
                                   4047 
                                   4048 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4049 ;       I:  ( -- )
                                   4050 ;       Start interrupt service 
                                   4051 ;       routine definition
                                   4052 ;       those definition have 
                                   4053 ;       no name.
                                   4054 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0018DE                       4055         _HEADER ICOLON,2,"I:"
      00995E 99 50                    1         .word LINK 
                           0018E0     2         LINK=.
      009960 02                       3         .byte 2  
      009961 49 3A                    4         .ascii "I:"
      009963                          5         ICOLON:
      009963 CD 99 2B         [ 4] 4056         call INITOFS 
      009966 CC 98 BC         [ 2] 4057         jp RBRAC  
                                   4058 
                                   4059 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4060 ;       IMMEDIATE       ( -- )
                                   4061 ;       Make last compiled word
                                   4062 ;       an immediate word.
                                   4063 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0018E9                       4064         _HEADER IMMED,9,"IMMEDIATE"
      009969 99 60                    1         .word LINK 
                           0018EB     2         LINK=.
      00996B 09                       3         .byte 9  
      00996C 49 4D 4D 45 44 49 41     4         .ascii "IMMEDIATE"
             54 45
      009975                          5         IMMED:
      009975 CD 84 F0         [ 4] 4065         CALL     DOLIT
      009978 80 00                 4066         .word     0x8000	;  IMEDD*256
      00997A CD 88 0F         [ 4] 4067         CALL     LAST
      00997D CD 85 64         [ 4] 4068         CALL     AT
      009980 CD 85 64         [ 4] 4069         CALL     AT
      009983 CD 87 0B         [ 4] 4070         CALL     ORR
      009986 CD 88 0F         [ 4] 4071         CALL     LAST
      009989 CD 85 64         [ 4] 4072         CALL     AT
      00998C CC 85 52         [ 2] 4073         JP     STORE
                                   4074 
                                   4075 ;; Defining words
                                   4076 
                                   4077 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4078 ;       CREATE  ( -- ; <string> )
                                   4079 ;       Compile a new array
                                   4080 ;       without allocating space.
                                   4081 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00190F                       4082         _HEADER CREAT,6,"CREATE"
      00998F 99 6B                    1         .word LINK 
                           001911     2         LINK=.
      009991 06                       3         .byte 6  
      009992 43 52 45 41 54 45        4         .ascii "CREATE"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



      009998                          5         CREAT:
      009998 CD 92 75         [ 4] 4083         CALL     TOKEN
      00999B CD 97 B7         [ 4] 4084         CALL     SNAME
      00999E CD 98 48         [ 4] 4085         CALL     OVERT        
      0099A1 CD 95 FE         [ 4] 4086         CALL     COMPI 
      0099A4 87 50                 4087         .word DOVAR 
      0099A6 81               [ 4] 4088         RET
                                   4089 
                                   4090 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4091 ;       VARIABLE  ( -- ; <string> )
                                   4092 ;       Compile a new variable
                                   4093 ;       initialized to 0.
                                   4094 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001927                       4095         _HEADER VARIA,8,"VARIABLE"
      0099A7 99 91                    1         .word LINK 
                           001929     2         LINK=.
      0099A9 08                       3         .byte 8  
      0099AA 56 41 52 49 41 42 4C     4         .ascii "VARIABLE"
             45
      0099B2                          5         VARIA:
                                   4096 ; indirect variable so that VARIABLE definition can be compiled in FLASH 
      0099B2 CD 8D 69         [ 4] 4097         CALL HERE
      0099B5 CD 86 9A         [ 4] 4098         CALL DUPP 
      0099B8 CD 8B F8         [ 4] 4099         CALL CELLP
      0099BB CD 87 F1         [ 4] 4100         CALL VPP 
      0099BE CD 85 52         [ 4] 4101         CALL STORE
      0099C1 CD 99 98         [ 4] 4102         CALL CREAT
      0099C4 CD 86 9A         [ 4] 4103         CALL DUPP
      0099C7 CD 95 B9         [ 4] 4104         CALL COMMA
      0099CA CD 8C 8F         [ 4] 4105         CALL ZERO
      0099CD CD 86 AA         [ 4] 4106         call SWAPP 
      0099D0 CD 85 52         [ 4] 4107         CALL STORE
      0099D3 CD A3 0C         [ 4] 4108         CALL FMOVE ; move definition to FLASH
      0099D6 CD 88 4D         [ 4] 4109         CALL QDUP 
      0099D9 CD 85 19         [ 4] 4110         CALL QBRAN 
      0099DC 99 E5                 4111         .word SET_RAMLAST   
      0099DE CD 9D B4         [ 4] 4112         call UPDATVP  ; don't update if variable kept in RAM.
      0099E1 CD A3 A0         [ 4] 4113         CALL UPDATPTR
      0099E4 81               [ 4] 4114         RET         
      0099E5                       4115 SET_RAMLAST: 
      0099E5 CD 88 0F         [ 4] 4116         CALL LAST 
      0099E8 CD 85 64         [ 4] 4117         CALL AT 
      0099EB CD 88 22         [ 4] 4118         CALL RAMLAST 
      0099EE CC 85 52         [ 2] 4119         JP STORE  
                                   4120 
                                   4121 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4122 ;       CONSTANT  ( n -- ; <string> )
                                   4123 ;       Compile a new constant 
                                   4124 ;       n CONSTANT name 
                                   4125 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001971                       4126         _HEADER CONSTANT,8,"CONSTANT"
      0099F1 99 A9                    1         .word LINK 
                           001973     2         LINK=.
      0099F3 08                       3         .byte 8  
      0099F4 43 4F 4E 53 54 41 4E     4         .ascii "CONSTANT"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal  54-Bits]



             54
      0099FC                          5         CONSTANT:
      0099FC CD 92 75         [ 4] 4127         CALL TOKEN
      0099FF CD 97 B7         [ 4] 4128         CALL SNAME 
      009A02 CD 98 48         [ 4] 4129         CALL OVERT 
      009A05 CD 95 FE         [ 4] 4130         CALL COMPI 
      009A08 9A 1C                 4131         .word DOCONST
      009A0A CD 95 B9         [ 4] 4132         CALL COMMA 
      009A0D CD A3 0C         [ 4] 4133         CALL FMOVE
      009A10 CD 88 4D         [ 4] 4134         CALL QDUP 
      009A13 CD 85 19         [ 4] 4135         CALL QBRAN 
      009A16 99 E5                 4136         .word SET_RAMLAST  
      009A18 CD A3 A0         [ 4] 4137         CALL UPDATPTR  
      009A1B 81               [ 4] 4138 1$:     RET          
                                   4139 
                                   4140 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4141 ; CONSTANT runtime semantic 
                                   4142 ; doCONST  ( -- n )
                                   4143 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4144 ;       _HEADER DOCONST,7,"DOCONST"
      009A1C                       4145 DOCONST:
      009A1C 1D 00 02         [ 2] 4146         subw x,#CELLL
      009A1F 90 85            [ 2] 4147         popw y 
      009A21 90 FE            [ 2] 4148         ldw y,(y) 
      009A23 FF               [ 2] 4149         ldw (x),y 
      009A24 81               [ 4] 4150         ret 
                                   4151 
                                   4152 ;----------------------------------
                                   4153 ; create double constant 
                                   4154 ; 2CONSTANT ( d -- ; <string> )
                                   4155 ;----------------------------------
      0019A5                       4156         _HEADER DCONST,9,"2CONSTANT"
      009A25 99 F3                    1         .word LINK 
                           0019A7     2         LINK=.
      009A27 09                       3         .byte 9  
      009A28 32 43 4F 4E 53 54 41     4         .ascii "2CONSTANT"
             4E 54
      009A31                          5         DCONST:
      009A31 CD 92 75         [ 4] 4157         CALL TOKEN
      009A34 CD 97 B7         [ 4] 4158         CALL SNAME 
      009A37 CD 98 48         [ 4] 4159         CALL OVERT 
      009A3A CD 95 FE         [ 4] 4160         CALL COMPI 
      009A3D 9A 54                 4161         .word DO_DCONST
      009A3F CD 95 B9         [ 4] 4162         CALL COMMA
      009A42 CD 95 B9         [ 4] 4163         CALL COMMA  
      009A45 CD A3 0C         [ 4] 4164         CALL FMOVE
      009A48 CD 88 4D         [ 4] 4165         CALL QDUP 
      009A4B CD 85 19         [ 4] 4166         CALL QBRAN 
      009A4E 99 E5                 4167         .word SET_RAMLAST  
      009A50 CD A3 A0         [ 4] 4168         CALL UPDATPTR  
      009A53 81               [ 4] 4169 1$:     RET          
                                   4170     
                                   4171 ;----------------------------------
                                   4172 ; runtime for DCONST 
                                   4173 ; stack double constant 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



                                   4174 ; DO-DCONST ( -- d )
                                   4175 ;-----------------------------------
                                   4176 ;       _HEADER DO_DCONST,9,"DO-DCONST"
      009A54                       4177 DO_DCONST:
      009A54 90 85            [ 2] 4178     popw y 
      009A56 90 BF 26         [ 2] 4179     ldw YTEMP,y 
      009A59 1D 00 04         [ 2] 4180     subw x,#2*CELLL 
      009A5C 90 FE            [ 2] 4181     ldw y,(y)
      009A5E FF               [ 2] 4182     ldw (x),y 
      009A5F 90 BE 26         [ 2] 4183     ldw y,YTEMP 
      009A62 90 EE 02         [ 2] 4184     ldw y,(2,y)
      009A65 EF 02            [ 2] 4185     ldw (2,x),y 
      009A67 81               [ 4] 4186     ret 
                                   4187 
                                   4188 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4189 ;;          TOOLS 
                                   4190 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4191 
                                   4192 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4193 ;       _TYPE   ( b u -- )
                                   4194 ;       Display a string. Filter
                                   4195 ;       non-printing characters.
                                   4196 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0019E8                       4197         _HEADER UTYPE,5,"_TYPE"
      009A68 9A 27                    1         .word LINK 
                           0019EA     2         LINK=.
      009A6A 05                       3         .byte 5  
      009A6B 5F 54 59 50 45           4         .ascii "_TYPE"
      009A70                          5         UTYPE:
      009A70 CD 86 63         [ 4] 4198         CALL     TOR     ;start count down loop
      009A73 20 0F            [ 2] 4199         JRA     UTYP2   ;skip first pass
      009A75 CD 86 9A         [ 4] 4200 UTYP1:  CALL     DUPP
      009A78 CD 85 82         [ 4] 4201         CALL     CAT
      009A7B CD 8C B9         [ 4] 4202         CALL     TCHAR
      009A7E CD 84 B7         [ 4] 4203         CALL     EMIT    ;display only printable
      009A81 CD 8C 23         [ 4] 4204         CALL     ONEP    ;increment address
      009A84 CD 85 04         [ 4] 4205 UTYP2:  CALL     DONXT
      009A87 9A 75                 4206         .word      UTYP1   ;loop till done
      009A89 CC 86 90         [ 2] 4207         JP     DROP
                                   4208 
                                   4209 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4210 ;       dm+     ( a u -- a )
                                   4211 ;       Dump u bytes from ,
                                   4212 ;       leaving a+u on  stack.
                                   4213 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001A0C                       4214         _HEADER DUMPP,3,"DM+"
      009A8C 9A 6A                    1         .word LINK 
                           001A0E     2         LINK=.
      009A8E 03                       3         .byte 3  
      009A8F 44 4D 2B                 4         .ascii "DM+"
      009A92                          5         DUMPP:
      009A92 CD 86 C2         [ 4] 4215         CALL     OVER
      009A95 CD 84 F0         [ 4] 4216         CALL     DOLIT
      009A98 00 04                 4217         .word      4
      009A9A CD 90 6C         [ 4] 4218         CALL     UDOTR   ;display address
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



      009A9D CD 8F D3         [ 4] 4219         CALL     SPACE
      009AA0 CD 86 63         [ 4] 4220         CALL     TOR     ;start count down loop
      009AA3 20 11            [ 2] 4221         JRA     PDUM2   ;skip first pass
      009AA5 CD 86 9A         [ 4] 4222 PDUM1:  CALL     DUPP
      009AA8 CD 85 82         [ 4] 4223         CALL     CAT
      009AAB CD 84 F0         [ 4] 4224         CALL     DOLIT
      009AAE 00 03                 4225         .word      3
      009AB0 CD 90 6C         [ 4] 4226         CALL     UDOTR   ;display numeric data
      009AB3 CD 8C 23         [ 4] 4227         CALL     ONEP    ;increment address
      009AB6 CD 85 04         [ 4] 4228 PDUM2:  CALL     DONXT
      009AB9 9A A5                 4229         .word      PDUM1   ;loop till done
      009ABB 81               [ 4] 4230         RET
                                   4231 
                                   4232 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4233 ;       DUMP    ( a u -- )
                                   4234 ;       Dump u bytes from a,
                                   4235 ;       in a formatted manner.
                                   4236 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001A3C                       4237         _HEADER DUMP,4,"DUMP"
      009ABC 9A 8E                    1         .word LINK 
                           001A3E     2         LINK=.
      009ABE 04                       3         .byte 4  
      009ABF 44 55 4D 50              4         .ascii "DUMP"
      009AC3                          5         DUMP:
      009AC3 CD 87 60         [ 4] 4238         CALL     BASE
      009AC6 CD 85 64         [ 4] 4239         CALL     AT
      009AC9 CD 86 63         [ 4] 4240         CALL     TOR
      009ACC CD 8F 32         [ 4] 4241         CALL     HEX     ;save radix, set hex
      009ACF CD 84 F0         [ 4] 4242         CALL     DOLIT
      009AD2 00 10                 4243         .word      16
      009AD4 CD 8B 49         [ 4] 4244         CALL     SLASH   ;change count to lines
      009AD7 CD 86 63         [ 4] 4245         CALL     TOR     ;start count down loop
      009ADA CD 90 16         [ 4] 4246 DUMP1:  CALL     CR
      009ADD CD 84 F0         [ 4] 4247         CALL     DOLIT
      009AE0 00 10                 4248         .word      16
      009AE2 CD 88 A8         [ 4] 4249         CALL     DDUP
      009AE5 CD 9A 92         [ 4] 4250         CALL     DUMPP   ;display numeric
      009AE8 CD 88 5E         [ 4] 4251         CALL     ROT
      009AEB CD 88 5E         [ 4] 4252         CALL     ROT
      009AEE CD 8F D3         [ 4] 4253         CALL     SPACE
      009AF1 CD 8F D3         [ 4] 4254         CALL     SPACE
      009AF4 CD 9A 70         [ 4] 4255         CALL     UTYPE   ;display printable characters
      009AF7 CD 85 04         [ 4] 4256         CALL     DONXT
      009AFA 9A DA                 4257         .word      DUMP1   ;loop till done
      009AFC CD 86 90         [ 4] 4258 DUMP3:  CALL     DROP
      009AFF CD 85 B5         [ 4] 4259         CALL     RFROM
      009B02 CD 87 60         [ 4] 4260         CALL     BASE
      009B05 CC 85 52         [ 2] 4261         JP     STORE   ;restore radix
                                   4262 
                                   4263 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4264 ;       .S      ( ... -- ... )
                                   4265 ;        Display  contents of stack.
                                   4266 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001A88                       4267         _HEADER DOTS,2,".S"
      009B08 9A BE                    1         .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



                           001A8A     2         LINK=.
      009B0A 02                       3         .byte 2  
      009B0B 2E 53                    4         .ascii ".S"
      009B0D                          5         DOTS:
      009B0D CD 90 16         [ 4] 4268         CALL     CR
      009B10 CD 8C D1         [ 4] 4269         CALL     DEPTH   ;stack depth
      009B13 CD 86 63         [ 4] 4270         CALL     TOR     ;start count down loop
      009B16 20 09            [ 2] 4271         JRA     DOTS2   ;skip first pass
      009B18 CD 85 C6         [ 4] 4272 DOTS1:  CALL     RAT
      009B1B CD 8C E8         [ 4] 4273 	CALL     PICK
      009B1E CD 90 BC         [ 4] 4274         CALL     DOT     ;index stack, display contents
      009B21 CD 85 04         [ 4] 4275 DOTS2:  CALL     DONXT
      009B24 9B 18                 4276         .word      DOTS1   ;loop till done
      009B26 CD 90 43         [ 4] 4277         CALL     DOTQP
      009B29 05                    4278         .byte      5
      009B2A 20 3C 73 70 20        4279         .ascii     " <sp "
      009B2F 81               [ 4] 4280         RET
                                   4281 
                                   4282 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4283 ;       >NAME   ( ca -- na | F )
                                   4284 ;       Convert code address
                                   4285 ;       to a name address.
                                   4286 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001AB0                       4287         _HEADER TNAME,5,">NAME"
      009B30 9B 0A                    1         .word LINK 
                           001AB2     2         LINK=.
      009B32 05                       3         .byte 5  
      009B33 3E 4E 41 4D 45           4         .ascii ">NAME"
      009B38                          5         TNAME:
      009B38 CD 87 E3         [ 4] 4288         CALL     CNTXT   ;vocabulary link
      009B3B CD 85 64         [ 4] 4289 TNAM2:  CALL     AT
      009B3E CD 86 9A         [ 4] 4290         CALL     DUPP    ;?last word in a vocabulary
      009B41 CD 85 19         [ 4] 4291         CALL     QBRAN
      009B44 9B 5F                 4292         .word      TNAM4
      009B46 CD 88 A8         [ 4] 4293         CALL     DDUP
      009B49 CD 92 83         [ 4] 4294         CALL     NAMET
      009B4C CD 87 20         [ 4] 4295         CALL     XORR    ;compare
      009B4F CD 85 19         [ 4] 4296         CALL     QBRAN
      009B52 9B 59                 4297         .word      TNAM3
      009B54 CD 8C 07         [ 4] 4298         CALL     CELLM   ;continue with next word
      009B57 20 E2            [ 2] 4299         JRA     TNAM2
      009B59 CD 86 AA         [ 4] 4300 TNAM3:  CALL     SWAPP
      009B5C CC 86 90         [ 2] 4301         JP     DROP
      009B5F CD 88 9D         [ 4] 4302 TNAM4:  CALL     DDROP
      009B62 CC 8C 8F         [ 2] 4303         JP     ZERO
                                   4304 
                                   4305 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4306 ;       .ID     ( na -- )
                                   4307 ;        Display  name at address.
                                   4308 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001AE5                       4309         _HEADER DOTID,3,".ID"
      009B65 9B 32                    1         .word LINK 
                           001AE7     2         LINK=.
      009B67 03                       3         .byte 3  
      009B68 2E 49 44                 4         .ascii ".ID"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



      009B6B                          5         DOTID:
      009B6B CD 88 4D         [ 4] 4310         CALL     QDUP    ;if zero no name
      009B6E CD 85 19         [ 4] 4311         CALL     QBRAN
      009B71 9B 81                 4312         .word      DOTI1
      009B73 CD 8D 52         [ 4] 4313         CALL     COUNT
      009B76 CD 84 F0         [ 4] 4314         CALL     DOLIT
      009B79 00 1F                 4315         .word      0x1F
      009B7B CD 86 F7         [ 4] 4316         CALL     ANDD    ;mask lexicon bits
      009B7E CC 9A 70         [ 2] 4317         JP     UTYPE
      009B81 CD 90 43         [ 4] 4318 DOTI1:  CALL     DOTQP
      009B84 09                    4319         .byte      9
      009B85 20 6E 6F 4E 61 6D 65  4320         .ascii     " noName"
      009B8C 81               [ 4] 4321         RET
                                   4322 
                           000000  4323 WANT_SEE=0
                           000000  4324 .if WANT_SEE 
                                   4325 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4326 ;       SEE     ( -- ; <string> )
                                   4327 ;       A simple decompiler.
                                   4328 ;       Updated for byte machines.
                                   4329 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4330         _HEADER SEE,3,"SEE"
                                   4331         CALL     TICK    ;starting address
                                   4332         CALL     CR
                                   4333         CALL     ONEM
                                   4334 SEE1:   CALL     ONEP
                                   4335         CALL     DUPP
                                   4336         CALL     AT
                                   4337         CALL     DUPP
                                   4338         CALL     QBRAN
                                   4339         .word    SEE2
                                   4340         CALL     TNAME   ;?is it a name
                                   4341 SEE2:   CALL     QDUP    ;name address or zero
                                   4342         CALL     QBRAN
                                   4343         .word    SEE3
                                   4344         CALL     SPACE
                                   4345         CALL     DOTID   ;display name
                                   4346         CALL     ONEP
                                   4347         JRA      SEE4
                                   4348 SEE3:   CALL     DUPP
                                   4349         CALL     CAT
                                   4350         CALL     UDOT    ;display number
                                   4351 SEE4:   CALL     NUFQ    ;user control
                                   4352         CALL     QBRAN
                                   4353         .word    SEE1
                                   4354         JP     DROP
                                   4355 .endif ; WANT_SEE 
                                   4356 
                                   4357 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4358 ;       WORDS   ( -- )
                                   4359 ;       Display names in vocabulary.
                                   4360 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001B0D                       4361         _HEADER WORDS,5,"WORDS"
      009B8D 9B 67                    1         .word LINK 
                           001B0F     2         LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



      009B8F 05                       3         .byte 5  
      009B90 57 4F 52 44 53           4         .ascii "WORDS"
      009B95                          5         WORDS:
      009B95 CD 90 16         [ 4] 4362         CALL     CR
      009B98 CD 87 E3         [ 4] 4363         CALL     CNTXT   ;only in context
      009B9B CD 85 64         [ 4] 4364 WORS1:  CALL     AT
      009B9E CD 88 4D         [ 4] 4365         CALL     QDUP    ;?at end of list
      009BA1 CD 85 19         [ 4] 4366         CALL     QBRAN
      009BA4 9B B7                 4367         .word      WORS2
      009BA6 CD 86 9A         [ 4] 4368         CALL     DUPP
      009BA9 CD 8F D3         [ 4] 4369         CALL     SPACE
      009BAC CD 9B 6B         [ 4] 4370         CALL     DOTID   ;display a name
      009BAF CD 8C 07         [ 4] 4371         CALL     CELLM
      009BB2 CD 85 35         [ 4] 4372         CALL     BRAN
      009BB5 9B 9B                 4373         .word      WORS1
      009BB7 81               [ 4] 4374 WORS2:  RET
                                   4375 
                                   4376         
                                   4377 ;; Hardware reset
                                   4378 
                                   4379 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4380 ;  COPYRIGTH
                                   4381 ; print copyright notice 
                                   4382 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      009BB8                       4383 COPYRIGHT:
      009BB8 CD 90 43         [ 4] 4384     CALL DOTQP 
      009BBB 21                    4385     .byte 33 
      009BBC 4A 61 63 71 75 65 73  4386     .ascii "Jacques Deschenes, Copyright 2021"
             20 44 65 73 63 68 65
             6E 65 73 2C 20 43 6F
             70 79 72 69 67 68 74
             20 32 30 32 31
      009BDD CC 90 16         [ 2] 4387     JP CR 
                                   4388 
                                   4389 
                                   4390 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4391 ;  PRT_LICENCE 
                                   4392 ;  print GPLV2 licence 
                                   4393 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      009BE0                       4394 PRT_LICENCE:
      009BE0 CD 90 43         [ 4] 4395         CALL DOTQP 
      009BE3 0F                    4396         .byte  15 
      009BE4 4C 49 43 45 4E 43 45  4397         .ascii "LICENCE GPLV3\r\n"
             20 47 50 4C 56 33 0D
             0A
      009BF3 81               [ 4] 4398         RET 
                                   4399 
                                   4400 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4401 ;    PRINT_VERSION ( c1 c2 -- )
                                   4402 ;    c2 minor 
                                   4403 ;    c1 major 
                                   4404 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      009BF4                       4405 PRINT_VERSION:
      009BF4 CD 90 43         [ 4] 4406      CALL DOTQP 
      009BF7 09                    4407      .byte 9
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



      009BF8 20 76 65 72 73 69 6F  4408      .ascii " version "
             6E 20
      009C01 CD 8E 97         [ 4] 4409      CALL BDIGS 
      009C04 CD 8E D1         [ 4] 4410      CALL DIGS 
      009C07 CD 8E D1         [ 4] 4411      CALL DIGS 
      001B8A                       4412      _DOLIT '.' 
      009C0A CD 84 F0         [ 4]    1     CALL DOLIT 
      009C0D 00 2E                    2     .word '.' 
      009C0F CD 8E A7         [ 4] 4413      CALL HOLD 
      001B92                       4414      _DROP 
      009C12 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      009C15 CD 8E D1         [ 4] 4415      CALL DIGS 
      009C18 CD 8E FC         [ 4] 4416      CALL EDIGS 
      009C1B CC 8F FD         [ 2] 4417      JP TYPES 
                                   4418       
                                   4419 
                                   4420 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4421 ;       hi      ( -- )
                                   4422 ;       Display sign-on message.
                                   4423 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001B9E                       4424         _HEADER HI,2,"HI"
      009C1E 9B 8F                    1         .word LINK 
                           001BA0     2         LINK=.
      009C20 02                       3         .byte 2  
      009C21 48 49                    4         .ascii "HI"
      009C23                          5         HI:
      009C23 CD 90 16         [ 4] 4425         CALL     CR
      009C26 CD 90 43         [ 4] 4426         CALL     DOTQP   
      009C29 0A                    4427         .byte      10
      009C2A 73 74 6D 38 65 46 6F  4428         .ascii     "stm8eForth"
             72 74 68
      001BB4                       4429 	_DOLIT VER 
      009C34 CD 84 F0         [ 4]    1     CALL DOLIT 
      009C37 00 04                    2     .word VER 
      001BB9                       4430         _DOLIT EXT 
      009C39 CD 84 F0         [ 4]    1     CALL DOLIT 
      009C3C 00 00                    2     .word EXT 
      009C3E CD 9B F4         [ 4] 4431         CALL PRINT_VERSION 
      009C41 CD 90 43         [ 4] 4432         CALL    DOTQP
                           000001  4433 .if NUCLEO          
      009C44 12                    4434         .byte 18
      009C45 20 6F 6E 20 4E 55 43  4435         .ascii  " on NUCLEO-8S208RB"
             4C 45 4F 2D 38 53 32
             30 38 52 42
                                   4436 .endif
                           000000  4437 .if DISCOVERY
                                   4438         .byte 19
                                   4439         .ascii  " on STM8S-DISCOVERY"
                                   4440 .endif
                           000000  4441 .if DOORBELL
                                   4442         .byte 16
                                   4443         .ascii " on stm8s105k6b6"
                                   4444 .endif
      009C57 CC 90 16         [ 2] 4445         JP     CR
                                   4446 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



                           000000  4447 WANT_DEBUG=0
                           000000  4448 .if WANT_DEBUG 
                                   4449 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4450 ;       DEBUG      ( -- )
                                   4451 ;       Display sign-on message.
                                   4452 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4453         _HEADER DEBUG,5,"DEBUG"
                                   4454 	CALL DOLIT
                                   4455 	.word 0x65
                                   4456 	CALL EMIT
                                   4457 	CALL ZERO
                                   4458  	CALL ZLESS 
                                   4459 	CALL DOLIT
                                   4460 	.word 0xFFFE
                                   4461 	CALL ZLESS 
                                   4462 	CALL UPLUS 
                                   4463  	_DROP 
                                   4464 	CALL DOLIT
                                   4465 	.word 3
                                   4466 	CALL UPLUS 
                                   4467 	CALL UPLUS 
                                   4468  	_DROP
                                   4469 	CALL DOLIT
                                   4470 	.word 0x43
                                   4471 	CALL UPLUS 
                                   4472  	_DROP
                                   4473 	CALL EMIT
                                   4474 	CALL DOLIT
                                   4475 	.word 0x4F
                                   4476 	CALL DOLIT
                                   4477 	.word 0x6F
                                   4478  	CALL XORR
                                   4479 	CALL DOLIT
                                   4480 	.word 0xF0
                                   4481  	CALL ANDD
                                   4482 	CALL DOLIT
                                   4483 	.word 0x4F
                                   4484  	CALL ORR
                                   4485 	CALL EMIT
                                   4486 	CALL DOLIT
                                   4487 	.word 8
                                   4488 	CALL DOLIT
                                   4489 	.word 6
                                   4490  	CALL SWAPP
                                   4491 	CALL OVER
                                   4492 	CALL XORR
                                   4493 	CALL DOLIT
                                   4494 	.word 3
                                   4495 	CALL ANDD 
                                   4496 	CALL ANDD
                                   4497 	CALL DOLIT
                                   4498 	.word 0x70
                                   4499 	CALL UPLUS 
                                   4500 	_DROP
                                   4501 	CALL EMIT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



                                   4502 	CALL ZERO
                                   4503 	CALL QBRAN
                                   4504 	.word DEBUG1
                                   4505 	CALL DOLIT
                                   4506 	.word 0x3F
                                   4507 DEBUG1:
                                   4508 	CALL DOLIT
                                   4509 	.word 0xFFFF
                                   4510 	CALL QBRAN
                                   4511 	.word DEBUG2
                                   4512 	CALL DOLIT
                                   4513 	.word 0x74
                                   4514 	CALL BRAN
                                   4515 	.word DEBUG3
                                   4516 DEBUG2:
                                   4517 	CALL DOLIT
                                   4518 	.word 0x21
                                   4519 DEBUG3:
                                   4520 	CALL EMIT
                                   4521 	CALL DOLIT
                                   4522 	.word 0x68
                                   4523 	CALL DOLIT
                                   4524 	.word 0x80
                                   4525 	CALL STORE
                                   4526 	CALL DOLIT
                                   4527 	.word 0x80
                                   4528 	CALL AT
                                   4529 	CALL EMIT
                                   4530 	CALL DOLIT
                                   4531 	.word 0x4D
                                   4532 	CALL TOR
                                   4533 	CALL RAT
                                   4534 	CALL RFROM
                                   4535 	CALL ANDD
                                   4536 	CALL EMIT
                                   4537 	CALL DOLIT
                                   4538 	.word 0x61
                                   4539 	CALL DOLIT
                                   4540 	.word 0xA
                                   4541 	CALL TOR
                                   4542 DEBUG4:
                                   4543 	CALL ONE
                                   4544 	CALL UPLUS 
                                   4545 	_DROP
                                   4546 	CALL DONXT
                                   4547 	.word DEBUG4
                                   4548 	CALL EMIT
                                   4549 	CALL DOLIT
                                   4550 	.word 0x656D
                                   4551 	CALL DOLIT
                                   4552 	.word 0x100
                                   4553 	CALL UMSTA
                                   4554 	CALL SWAPP
                                   4555 	CALL DOLIT
                                   4556 	.word 0x100
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



                                   4557 	CALL UMSTA
                                   4558 	CALL SWAPP 
                                   4559 	_DROP
                                   4560 	CALL EMIT
                                   4561 	CALL EMIT
                                   4562 	CALL DOLIT
                                   4563 	.word 0x2043
                                   4564 	CALL ZERO
                                   4565 	CALL DOLIT
                                   4566 	.word 0x100
                                   4567 	CALL UMMOD
                                   4568 	CALL EMIT
                                   4569 	CALL EMIT
                                   4570 	;JP ORIG
                                   4571 	RET
                                   4572 .endif ; WANT_DEBUG 
                                   4573 
                                   4574 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4575 ;       'BOOT   ( -- a )
                                   4576 ;       The application startup vector.
                                   4577 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001BDA                       4578         _HEADER TBOOT,5,"'BOOT"
      009C5A 9C 20                    1         .word LINK 
                           001BDC     2         LINK=.
      009C5C 05                       3         .byte 5  
      009C5D 27 42 4F 4F 54           4         .ascii "'BOOT"
      009C62                          5         TBOOT:
      009C62 CD 87 50         [ 4] 4579         CALL     DOVAR
      009C65 40 02                 4580         .word    APP_RUN      ;application to boot
                                   4581 
                                   4582 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4583 ;       COLD    ( -- )
                                   4584 ;       The hilevel cold start s=ence.
                                   4585 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001BE7                       4586         _HEADER COLD,4,"COLD"
      009C67 9C 5C                    1         .word LINK 
                           001BE9     2         LINK=.
      009C69 04                       3         .byte 4  
      009C6A 43 4F 4C 44              4         .ascii "COLD"
      009C6E                          5         COLD:
                           000000  4587 .if WANT_DEBUG
                                   4588         CALL DEBUG
                                   4589 .endif ; WANT_DEBUG
      009C6E CD 84 F0         [ 4] 4590 COLD1:  CALL     DOLIT
      009C71 80 AB                 4591         .word      UZERO
      009C73 CD 84 F0         [ 4] 4592 	CALL     DOLIT
      009C76 00 06                 4593         .word      UPP
      009C78 CD 84 F0         [ 4] 4594         CALL     DOLIT
      009C7B 00 1C                 4595 	.word      UEND-UZERO
      009C7D CD 8D B6         [ 4] 4596         CALL     CMOVE   ;initialize user area
                           000001  4597 .if WANT_FLOAT 
      009C80 CD AD 1C         [ 4] 4598         CALL    FINIT 
                                   4599 .endif 
                                   4600 ; if APP_RUN==0 initialize with ca de 'hi'  
      009C83 90 CE 40 02      [ 2] 4601         ldw y,APP_RUN 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



      009C87 26 0B            [ 1] 4602         jrne 0$
      009C89 1D 00 02         [ 2] 4603         subw x,#CELLL 
      009C8C 90 AE 9C 23      [ 2] 4604         ldw y,#HI  
      009C90 FF               [ 2] 4605         ldw (x),y
      009C91 CD 9D 8C         [ 4] 4606         call UPDATRUN 
      009C94                       4607 0$:        
                                   4608 ; update LAST with APP_LAST 
                                   4609 ; if APP_LAST > LAST else do the opposite
      009C94 90 CE 40 00      [ 2] 4610         ldw y,APP_LAST 
      009C98 90 B3 1C         [ 2] 4611         cpw y,ULAST 
      009C9B 22 05            [ 1] 4612         jrugt 1$ 
                                   4613 ; save LAST at APP_LAST  
      009C9D CD 9D 74         [ 4] 4614         call UPDATLAST 
      009CA0 20 06            [ 2] 4615         jra 2$
      009CA2                       4616 1$: ; update LAST with APP_LAST 
      009CA2 90 BF 1C         [ 2] 4617         ldw ULAST,y
      009CA5 90 BF 16         [ 2] 4618         ldw UCNTXT,y
      009CA8                       4619 2$:  
                                   4620 ; update APP_CP if < app_space 
      009CA8 90 CE 40 04      [ 2] 4621         ldw y,APP_CP  
      009CAC 90 B3 1A         [ 2] 4622         cpw y,UCP   
      009CAF 24 06            [ 1] 4623         jruge 3$ 
      009CB1 CD 9D 9D         [ 4] 4624         call UPDATCP
      009CB4 90 BE 1A         [ 2] 4625         ldw y,UCP   
      009CB7                       4626 3$:
      009CB7 90 BF 1A         [ 2] 4627         ldw UCP,y                 
                                   4628 ; update UVP with APP_VP  
                                   4629 ; if APP_VP>UVP else do the opposite 
      009CBA 90 CE 40 06      [ 2] 4630         ldw y,APP_VP 
      009CBE 90 B3 18         [ 2] 4631         cpw y,UVP 
      009CC1 22 05            [ 1] 4632         jrugt 4$
      009CC3 CD 9D B4         [ 4] 4633         call UPDATVP 
      009CC6 20 03            [ 2] 4634         jra 6$
      009CC8                       4635 4$: ; update UVP with APP_VP 
      009CC8 90 BF 18         [ 2] 4636         ldw UVP,y 
      009CCB                       4637 6$:      
      009CCB CD 95 63         [ 4] 4638         CALL     PRESE   ;initialize data stack and TIB
      009CCE CD 9C 62         [ 4] 4639         CALL     TBOOT
      009CD1 CD 8D 9F         [ 4] 4640         CALL     ATEXE   ;application boot
      009CD4 CD 98 48         [ 4] 4641         CALL     OVERT
      009CD7 CC 95 80         [ 2] 4642         JP     QUIT    ;start interpretation
                                   4643 
                                   4644 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]



                                   4645         .include "flash.asm"
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
      009CDA 9C 69                   31     .word LINK 
                           001C5C    32     LINK=.
      009CDC 03                      33     .byte 3 
      009CDD 46 50 21                34     .ascii "FP!"
      009CE0                         35 FPSTOR:
      009CE0 90 93            [ 1]   36     ldw y,x
      009CE2 90 FE            [ 2]   37     ldw y,(y)
      009CE4 90 9F            [ 1]   38     ld a,yl 
      009CE6 B7 34            [ 1]   39     ld FPTR,a 
      009CE8 1C 00 02         [ 2]   40     addw x,#CELLL 
      009CEB 90 93            [ 1]   41     ldw y,x 
      009CED 90 FE            [ 2]   42     ldw y,(y)
      009CEF 90 BF 35         [ 2]   43     ldw PTR16,y
      009CF2 1C 00 02         [ 2]   44     addw x,#CELLL 
      009CF5 81               [ 4]   45     ret 
                                     46 
                                     47 ;-----------------------------------
                                     48 ; return EEPROM base address 
                                     49 ; as a double 
                                     50 ;  EEPROM  ( -- ud )
                                     51 ;-----------------------------------
      009CF6 9C DC                   52     .word LINK 
                           001C78    53 LINK=.
      009CF8 06                      54     .byte 6 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]



      009CF9 45 45 50 52 4F 4D       55     .ascii "EEPROM"
      009CFF                         56 EEPROM: 
      009CFF 90 AE 40 00      [ 2]   57     ldw y,#EEPROM_BASE
      009D03 1D 00 04         [ 2]   58     subw x,#2*CELLL 
      009D06 EF 02            [ 2]   59     ldw (2,x),y 
      009D08 90 5F            [ 1]   60     clrw y 
      009D0A FF               [ 2]   61     ldw (x),y 
      009D0B 81               [ 4]   62     ret
                                     63 
                                     64 ;---------------------------------
                                     65 ; return APP_LAST pointer as double
                                     66 ; EEP-LAST ( -- ud )
                                     67 ;---------------------------------
      009D0C 9C F8                   68 	.word LINK 
                           001C8E    69 	LINK=.
      009D0E 08                      70 	.byte 8 
      009D0F 45 45 50 2D 4C 41 53    71 	.ascii "EEP-LAST"
             54
      009D17                         72 EEPLAST:
      009D17 1D 00 04         [ 2]   73 	subw x,#2*CELLL 
      009D1A 90 AE 40 00      [ 2]   74 	ldw y,#APP_LAST 
      009D1E EF 02            [ 2]   75 	ldw (2,x),y 
      009D20 90 5F            [ 1]   76 	clrw y 
      009D22 FF               [ 2]   77 	ldw (x),y 
      009D23 81               [ 4]   78 	ret 
                                     79 
                                     80 ;----------------------------------
                                     81 ; return APP_RUN pointer as double	
                                     82 ; EEP-RUN ( -- ud )
                                     83 ;-----------------------------------
      009D24 9D 0E                   84 	.word LINK 
                           001CA6    85 	LINK=.
      009D26 07                      86 	.byte 7
      009D27 45 45 50 2D 52 55 4E    87 	.ascii "EEP-RUN"
      009D2E                         88 EEPRUN:
      009D2E 1D 00 04         [ 2]   89 	subw x,#2*CELLL 
      009D31 90 AE 40 02      [ 2]   90 	ldw y,#APP_RUN 
      009D35 EF 02            [ 2]   91 	ldw (2,x),y 
      009D37 90 5F            [ 1]   92 	clrw y 
      009D39 FF               [ 2]   93 	ldw (x),y 
      009D3A 81               [ 4]   94 	ret 
                                     95 
                                     96 ;------------------------------------
                                     97 ; return APP_CP pointer as double 
                                     98 ; EEP-CP ( -- ud )
                                     99 ;------------------------------------
      009D3B 9D 26                  100 	.word LINK
                           001CBD   101 	LINK=.
      009D3D 06                     102 	.byte 6 
      009D3E 45 45 50 2D 43 50      103 	.ascii "EEP-CP"
      009D44                        104 EEPCP:
      009D44 1D 00 04         [ 2]  105 	subw x,#2*CELLL 
      009D47 90 AE 40 04      [ 2]  106 	ldw y,#APP_CP  
      009D4B EF 02            [ 2]  107 	ldw (2,x),y 
      009D4D 90 5F            [ 1]  108 	clrw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]



      009D4F FF               [ 2]  109 	ldw (x),y 
      009D50 81               [ 4]  110 	ret 
                                    111 
                                    112 ;------------------------------------
                                    113 ; return APP_VP pointer as double 
                                    114 ; EEP-VP ( -- ud )
                                    115 ;-------------------------------------
      009D51 9D 3D                  116 	.word LINK
                           001CD3   117 	LINK=.
      009D53 06                     118 	.byte 6
      009D54 45 45 50 2D 56 50      119 	.ascii "EEP-VP"
      009D5A                        120 EEPVP:
      009D5A 1D 00 04         [ 2]  121 	subw x,#2*CELLL 
      009D5D 90 AE 40 06      [ 2]  122 	ldw y,#APP_VP  
      009D61 EF 02            [ 2]  123 	ldw (2,x),y 
      009D63 90 5F            [ 1]  124 	clrw y 
      009D65 FF               [ 2]  125 	ldw (x),y 
      009D66 81               [ 4]  126 	ret 
                                    127 
                                    128 ;----------------------------------
                                    129 ; update APP_LAST with LAST 
                                    130 ; UPDAT-LAST ( -- )
                                    131 ;----------------------------------
      009D67 9D 53                  132 	.word LINK 
                           001CE9   133 	LINK=.
      009D69 0A                     134 	.byte 10
      009D6A 55 50 44 41 54 2D 4C   135 	.ascii "UPDAT-LAST"
             41 53 54
      009D74                        136 UPDATLAST:
      009D74 CD 88 0F         [ 4]  137 	call LAST
      009D77 CD 85 64         [ 4]  138 	call AT  
      009D7A CD 9D 17         [ 4]  139 	call EEPLAST
      009D7D CC 9F 6A         [ 2]  140 	jp EESTORE 
                                    141 
                                    142 ;---------------------------------
                                    143 ; update APP_RUN 
                                    144 ; UPDAT-RUN ( a -- )
                                    145 ;---------------------------------
      009D80 9D 69                  146 	.word LINK
                           001D02   147 	LINK=.
      009D82 09                     148 	.byte 9
      009D83 55 50 44 41 54 2D 52   149 	.ascii "UPDAT-RUN"
             55 4E
      009D8C                        150 UPDATRUN:
      009D8C CD 9D 2E         [ 4]  151 	call EEPRUN
      009D8F CC 9F 6A         [ 2]  152 	jp EESTORE 
                                    153 	
                                    154 ;---------------------------------
                                    155 ; update APP_CP with CP 
                                    156 ; UPDAT-CP ( -- )
                                    157 ;---------------------------------
      009D92 9D 82                  158 	.word LINK 
                           001D14   159 	LINK=.
      009D94 08                     160 	.byte 8 
      009D95 55 50 44 41 54 2D 43   161 	.ascii "UPDAT-CP"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal  50-Bits]



             50
      009D9D                        162 UPDATCP:
      009D9D CD 87 FF         [ 4]  163 	call CPP 
      009DA0 CD 85 64         [ 4]  164 	call AT 
      009DA3 CD 9D 44         [ 4]  165 	call EEPCP 
      009DA6 CC 9F 6A         [ 2]  166 	jp EESTORE 
                                    167 
                                    168 ;----------------------------------
                                    169 ; update APP_VP with VP 
                                    170 ; UPDAT-VP ( -- )
                                    171 ;----------------------------------
      009DA9 9D 94                  172 	.word LINK
                           001D2B   173 	LINK=.
      009DAB 08                     174 	.byte 8 
      009DAC 55 50 44 41 54 2D 56   175 	.ascii "UPDAT-VP" 
             50
      009DB4                        176 UPDATVP:
      009DB4 CD 87 F1         [ 4]  177 	call VPP 
      009DB7 CD 85 64         [ 4]  178 	call AT
      009DBA CD 9D 5A         [ 4]  179 	call EEPVP 
      009DBD CC 9F 6A         [ 2]  180 	jp EESTORE
                                    181 	
                           000001   182 .if NUCLEO
                                    183 ;----------------------------------
                                    184 ; fetch integer at address over 65535
                                    185 ;  F@   ( ud -- n )
                                    186 ;----------------------------------
      009DC0 9D AB                  187     .word LINK 
                           001D42   188 LINK=.
      009DC2 02                     189     .byte 2
      009DC3 46 40                  190     .ascii "F@"
      009DC5                        191 FARAT:
      009DC5 CD 9C E0         [ 4]  192     call FPSTOR
      009DC8 CC 9E 8D         [ 2]  193 	jp EE_READ 
                                    194 
                                    195 
                                    196 ;-------------------------------------
                                    197 ; fetch C at address over 65535 
                                    198 ; FC@ ( ud -- c)
                                    199 ;-------------------------------------
      009DCB 9D C2                  200     .word LINK
                           001D4D   201     LINK=.
      009DCD 03                     202     .byte 3 
      009DCE 46 43 40               203     .ascii "FC@" 
      009DD1                        204 FARCAT:
      009DD1 CD 9C E0         [ 4]  205     call FPSTOR
      009DD4 CC 9E AF         [ 2]  206 	jp EE_CREAD  
                                    207 .endif ; NUCLEO 
                                    208 
                                    209 ;----------------------------------
                                    210 ; UNLOCK EEPROM/OPT for writing/erasing
                                    211 ; wait endlessly for FLASH_IAPSR_DUL bit.
                                    212 ;  UNLKEE   ( -- )
                                    213 ;----------------------------------
      009DD7 9D CD                  214     .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]



                           001D59   215 LINK=.
      009DD9 06                     216     .byte 6 
      009DDA 55 4E 4C 4B 45 45      217     .ascii "UNLKEE"
      009DE0                        218 UNLKEE:
      009DE0 35 00 50 5B      [ 1]  219 	mov FLASH_CR2,#0 
      009DE4 35 FF 50 5C      [ 1]  220 	mov FLASH_NCR2,#0xFF 
      009DE8 35 AE 50 64      [ 1]  221 	mov FLASH_DUKR,#FLASH_DUKR_KEY1
      009DEC 35 56 50 64      [ 1]  222     mov FLASH_DUKR,#FLASH_DUKR_KEY2
      009DF0 72 07 50 5F FB   [ 2]  223 	btjf FLASH_IAPSR,#FLASH_IAPSR_DUL,.
      009DF5 81               [ 4]  224 	ret
                                    225 
                                    226 ;----------------------------------
                                    227 ; UNLOCK FLASH for writing/erasing
                                    228 ; wait endlessly for FLASH_IAPSR_PUL bit.
                                    229 ; UNLKFL  ( -- )
                                    230 ;----------------------------------
      009DF6 9D D9                  231     .word LINK 
                           001D78   232 LINK=. 
      009DF8 06                     233     .byte 6 
      009DF9 55 4E 4C 4B 46 4C      234     .ascii "UNLKFL"    
      009DFF                        235 UNLKFL:
      009DFF 35 00 50 5B      [ 1]  236 	mov FLASH_CR2,#0 
      009E03 35 FF 50 5C      [ 1]  237 	mov FLASH_NCR2,#0xFF 
      009E07 35 56 50 62      [ 1]  238 	mov FLASH_PUKR,#FLASH_PUKR_KEY1
      009E0B 35 AE 50 62      [ 1]  239 	mov FLASH_PUKR,#FLASH_PUKR_KEY2
      009E0F 72 03 50 5F FB   [ 2]  240 	btjf FLASH_IAPSR,#FLASH_IAPSR_PUL,.
      009E14 81               [ 4]  241 	ret
                                    242 
                                    243 ;-----------------------------
                                    244 ; UNLOCK FLASH or EEPROM 
                                    245 ; according to FPTR address 
                                    246 ;  UNLOCK ( -- )
                                    247 ;-----------------------------
      009E15 9D F8                  248 	.word LINK 
                           001D97   249 	LINK=.
      009E17 06                     250 	.byte 6
      009E18 55 4E 4C 4F 43 4B      251 	.ascii "UNLOCK"
      009E1E                        252 UNLOCK:
                                    253 ; put addr[15:0] in Y, for bounds check.
      009E1E 90 BE 35         [ 2]  254 	ldw y,PTR16   ; Y=addr15:0
                                    255 ; check addr[23:16], if <> 0 then it is extened flash memory
      009E21 3D 34            [ 1]  256 	tnz FPTR 
      009E23 26 16            [ 1]  257 	jrne 4$
      009E25 90 A3 80 00      [ 2]  258     cpw y,#FLASH_BASE
      009E29 24 10            [ 1]  259     jruge 4$
      009E2B 90 A3 40 00      [ 2]  260 	cpw y,#EEPROM_BASE  
      009E2F 25 0D            [ 1]  261     jrult 9$
      009E31 90 A3 48 7F      [ 2]  262 	cpw y,#OPTION_END 
      009E35 22 07            [ 1]  263 	jrugt 9$
      009E37 CD 9D E0         [ 4]  264 	call UNLKEE
      009E3A 81               [ 4]  265 	ret 
      009E3B CD 9D FF         [ 4]  266 4$: call UNLKFL
      009E3E 81               [ 4]  267 9$: ret 
                                    268 
                                    269 ;-------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
Hexadecimal [24-Bits]



                                    270 ; LOCK write access to 
                                    271 ; FLASH and EEPROM 
                                    272 ; LOCK ( -- )
                                    273 ;-------------------------
      009E3F 9E 17                  274 	.word LINK 
                           001DC1   275 	LINK=.
      009E41 04                     276 	.byte 4 
      009E42 4C 4F 43 4B            277 	.ascii "LOCK" 
      009E46                        278 LOCK: 
      009E46 72 13 50 5F      [ 1]  279 	bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      009E4A 72 17 50 5F      [ 1]  280 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      009E4E 81               [ 4]  281 	ret 
                                    282 
                                    283 ;-------------------------
                                    284 ; increment FPTR 
                                    285 ; INC-FPTR ( -- )
                                    286 ;-------------------------
      009E4F 9E 41                  287 	.word LINK 
                           001DD1   288 	LINK=. 
      009E51 08                     289 	.byte 8 
      009E52 49 4E 43 2D 46 50 54   290 	.ascii "INC-FPTR" 
             52
      009E5A                        291 INC_FPTR:
      009E5A 3C 36            [ 1]  292 	inc PTR8 
      009E5C 26 0C            [ 1]  293 	jrne 1$
      009E5E 90 89            [ 2]  294 	pushw y 
      009E60 90 BE 34         [ 2]  295 	ldw y,FPTR 
      009E63 90 5C            [ 1]  296 	incw y 
      009E65 90 BF 34         [ 2]  297 	ldw FPTR,y
      009E68 90 85            [ 2]  298 	popw y  
      009E6A 81               [ 4]  299 1$: ret 
                                    300 
                                    301 ;------------------------------
                                    302 ; add u to FPTR 
                                    303 ; PTR+ ( u -- )
                                    304 ;------------------------------
      009E6B 9E 51                  305 	.word LINK 
                           001DED   306 	LINK=.
      009E6D 04                     307 	.byte 4 
      009E6E 50 54 52 2B            308 	.ascii "PTR+"
      009E72                        309 PTRPLUS:
      009E72 90 93            [ 1]  310 	ldw y,x 
      009E74 1C 00 02         [ 2]  311 	addw x,#CELLL 
      009E77 72 B9 00 35      [ 2]  312 	addw y,PTR16 
      009E7B 90 BF 35         [ 2]  313 	ldw PTR16,y  
      009E7E 24 02            [ 1]  314 	jrnc 1$
      009E80 3C 34            [ 1]  315 	inc FPTR 
      009E82 81               [ 4]  316 1$: ret 
                                    317 
                                    318 ;---------------------------------
                                    319 ; read word at address pointed FPTR
                                    320 ; increment FPTR 
                                    321 ; EE-READ ( -- w )
                                    322 ;------------------------------------
      009E83 9E 6D                  323 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
Hexadecimal [24-Bits]



                           001E05   324 	LINK=.
      009E85 07                     325 	.byte 7 
      009E86 45 45 2D 52 45 41 44   326 	.ascii "EE-READ"
      009E8D                        327 EE_READ:
      009E8D 1D 00 02         [ 2]  328 	subw x,#CELLL 
      009E90 92 BC 00 34      [ 5]  329 	ldf a,[FPTR]
      009E94 90 95            [ 1]  330 	ld yh,a 
      009E96 CD 9E 5A         [ 4]  331 	call INC_FPTR 
      009E99 92 BC 00 34      [ 5]  332 	ldf a,[FPTR]
      009E9D CD 9E 5A         [ 4]  333 	call INC_FPTR 
      009EA0 90 97            [ 1]  334 	ld yl,a 
      009EA2 FF               [ 2]  335 	ldw (x),y 
      009EA3 81               [ 4]  336 	ret 
                                    337 
                                    338 ;---------------------------------------
                                    339 ; Read byte at address pointed by FPTR 
                                    340 ; EE-CREAD ( -- c )
                                    341 ;---------------------------------------
      009EA4 9E 85                  342 	.word LINK 
                           001E26   343 	LINK=.
      009EA6 08                     344 	.byte 8
      009EA7 45 45 2D 43 52 45 41   345 	.ascii "EE-CREAD" 
             44
      009EAF                        346 EE_CREAD:
      009EAF 1D 00 02         [ 2]  347 	subw x,#CELLL 
      009EB2 92 BC 00 34      [ 5]  348 	ldf a,[FPTR]	
      009EB6 CD 9E 5A         [ 4]  349 	call INC_FPTR
      009EB9 90 5F            [ 1]  350 	clrw y 
      009EBB 90 97            [ 1]  351 	ld yl,a 
      009EBD FF               [ 2]  352 	ldw (x),y 
      009EBE 81               [ 4]  353 	ret 
                                    354 
                                    355 ;----------------------------
                                    356 ; write a byte at address pointed 
                                    357 ; by FPTR and increment FPTR.
                                    358 ; Expect pointer already initialized 
                                    359 ; and memory unlocked 
                                    360 ; WR-BYTE ( c -- )
                                    361 ;----------------------------
      009EBF 9E A6                  362 	.word LINK 
                           001E41   363 	LINK=. 
      009EC1 07                     364 	.byte 7 
      009EC2 57 52 2D 42 59 54 45   365 	.ascii "WR-BYTE" 
                                    366 
      009EC9                        367 WR_BYTE:
      009EC9 CD 84 E4         [ 4]  368 	call FC_XOFF
      009ECC 90 93            [ 1]  369 	ldw y,x 
      009ECE 90 FE            [ 2]  370 	ldw y,(y)
      009ED0 1C 00 02         [ 2]  371 	addw x,#CELLL 
      009ED3 90 9F            [ 1]  372 	ld a,yl
      009ED5 92 BD 00 34      [ 4]  373 	ldf [FPTR],a
      009ED9 72 05 50 5F FB   [ 2]  374 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009EDE CD 84 CE         [ 4]  375 	call FC_XON
      009EE1 CC 9E 5A         [ 2]  376 	jp INC_FPTR 
                                    377 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]



                                    378 ;---------------------------------------
                                    379 ; write a word at address pointed 
                                    380 ; by FPTR and increment FPTR 
                                    381 ; Expect pointer already initialzed 
                                    382 ; and memory unlocked 
                                    383 ; WR-WORD ( w -- )
                                    384 ;---------------------------------------
      009EE4 9E C1                  385 	.word LINK 
                           001E66   386 	LINK=.
      009EE6 07                     387 	.byte 7 
      009EE7 57 52 2D 57 4F 52 44   388 	.ascii "WR-WORD" 
      009EEE                        389 WR_WORD:
      009EEE CD 84 E4         [ 4]  390 	call FC_XOFF
      009EF1 90 93            [ 1]  391 	ldw y,x
      009EF3 90 FE            [ 2]  392 	ldw y,(y)
      009EF5 1C 00 02         [ 2]  393 	addw x,#CELLL 
      009EF8 90 9E            [ 1]  394 	ld a,yh 
      009EFA 92 BD 00 34      [ 4]  395 	ldf [FPTR],a
      009EFE 72 05 50 5F FB   [ 2]  396 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009F03 CD 9E 5A         [ 4]  397 	call INC_FPTR 
      009F06 90 9F            [ 1]  398 	ld a,yl 
      009F08 92 BD 00 34      [ 4]  399 	ldf [FPTR],a
      009F0C 72 05 50 5F FB   [ 2]  400 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009F11 CD 84 CE         [ 4]  401 	call FC_XON
      009F14 CC 9E 5A         [ 2]  402 	jp INC_FPTR 
                                    403 
                                    404 
                                    405 ;---------------------------------------
                                    406 ; write a byte to FLASH or EEPROM/OPTION  
                                    407 ; EEC!  (c ud -- )
                                    408 ;---------------------------------------
      009F17 9E E6                  409     .word LINK 
                           001E99   410 	LINK=.
      009F19 04                     411     .byte 4 
      009F1A 45 45 43 21            412     .ascii "EEC!"
                                    413 	; local variables 
                           000001   414 	BTW = 1   ; byte to write offset on stack
                           000002   415     OPT = 2 
                           000002   416 	VSIZE = 2
      009F1E                        417 EECSTORE:
      009F1E 52 02            [ 2]  418 	sub sp,#VSIZE
      009F20 CD 9C E0         [ 4]  419     call FPSTOR
      009F23 E6 01            [ 1]  420 	ld a,(1,x)
      009F25 43               [ 1]  421 	cpl a 
      009F26 6B 01            [ 1]  422 	ld (BTW,sp),a ; byte to write 
      009F28 0F 02            [ 1]  423 	clr (OPT,sp)  ; OPTION flag
      009F2A CD 9E 1E         [ 4]  424 	call UNLOCK 
                                    425 	; check if option
      009F2D 3D 34            [ 1]  426 	tnz FPTR 
      009F2F 26 19            [ 1]  427 	jrne 2$
      009F31 90 BE 35         [ 2]  428 	ldw y,PTR16 
      009F34 90 A3 48 00      [ 2]  429 	cpw y,#OPTION_BASE
      009F38 2B 10            [ 1]  430 	jrmi 2$
      009F3A 90 A3 48 80      [ 2]  431 	cpw y,#OPTION_END+1
      009F3E 2A 0A            [ 1]  432 	jrpl 2$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]



      009F40 03 02            [ 1]  433 	cpl (OPT,sp)
                                    434 	; OPTION WRITE require this UNLOCK 
      009F42 72 1E 50 5B      [ 1]  435     bset FLASH_CR2,#FLASH_CR2_OPT
      009F46 72 1F 50 5C      [ 1]  436     bres FLASH_NCR2,#FLASH_CR2_OPT 
      009F4A                        437 2$: 
      009F4A CD 9E C9         [ 4]  438 	call WR_BYTE 	
      009F4D 0D 02            [ 1]  439 	tnz (OPT,sp)
      009F4F 27 0D            [ 1]  440 	jreq 3$ 
      009F51 7B 01            [ 1]  441     ld a,(BTW,sp)
      009F53 90 5F            [ 1]  442     clrw y
      009F55 90 97            [ 1]  443 	ld yl,a 
      009F57 1D 00 02         [ 2]  444 	subw x,#CELLL 
      009F5A FF               [ 2]  445 	ldw (x),y 
      009F5B CD 9E C9         [ 4]  446 	call WR_BYTE
      009F5E                        447 3$: 
      009F5E CD 9E 46         [ 4]  448 	call LOCK 
      009F61 5B 02            [ 2]  449 	addw sp,#VSIZE 
      009F63 81               [ 4]  450     ret
                                    451 
                                    452 ;------------------------------
                                    453 ; write integer in FLASH|EEPROM
                                    454 ; EE! ( n ud -- )
                                    455 ;------------------------------
      009F64 9F 19                  456 	.word LINK 
                           001EE6   457 	LINK=.
      009F66 03                     458 	.byte 3 
      009F67 45 45 21               459 	.ascii "EE!"
      009F6A                        460 EESTORE:
      009F6A CD 9C E0         [ 4]  461 	call FPSTOR 
      009F6D CD 9E 1E         [ 4]  462 	call UNLOCK 
      009F70 90 93            [ 1]  463 	ldw y,x 
      009F72 90 FE            [ 2]  464 	ldw y,(y)
      009F74 90 89            [ 2]  465 	pushw y 
      009F76 90 5E            [ 1]  466 	swapw y 
      009F78 FF               [ 2]  467 	ldw (x),y 
      009F79 CD 9E C9         [ 4]  468 	call WR_BYTE 
      009F7C 90 85            [ 2]  469 	popw y 
      009F7E 1D 00 02         [ 2]  470 	subw x,#CELLL
      009F81 FF               [ 2]  471 	ldw (x),y 
      009F82 CD 9E C9         [ 4]  472 	call WR_BYTE
      009F85 CC 9E 46         [ 2]  473 	jp LOCK 
                                    474 
                                    475 
                                    476 ;----------------------------
                                    477 ; Erase flash memory row 
                                    478 ; stm8s208 as 128 bytes rows
                                    479 ; ROW-ERASE ( ud -- )
                                    480 ;----------------------------
      009F88 9F 66                  481 	.word LINK 
                           001F0A   482 	LINK=. 
      009F8A 09                     483 	.byte 9 
      009F8B 52 4F 57 2D 45 52 41   484 	.ascii "ROW-ERASE" 
             53 45
      009F94                        485 row_erase:
      009F94 CD 84 E4         [ 4]  486 	call FC_XOFF
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]



      009F97 CD 9C E0         [ 4]  487 	call FPSTOR
                                    488 ;code must be execute from RAM 
                                    489 ;copy routine to PAD 
      009F9A 1D 00 02         [ 2]  490 	subw x,#CELLL 
      009F9D 90 AE 9F ED      [ 2]  491 	ldw y,#row_erase_proc
      009FA1 FF               [ 2]  492 	ldw (x),y 
      009FA2 CD 8D 7A         [ 4]  493 	call PAD 
      009FA5 90 AE A0 14      [ 2]  494 	ldw y,#row_erase_proc_end 
      009FA9 72 A2 9F ED      [ 2]  495 	subw y,#row_erase_proc
      009FAD 1D 00 02         [ 2]  496 	subw x,#CELLL 
      009FB0 FF               [ 2]  497 	ldw (x),y 
      009FB1 CD 8D B6         [ 4]  498 	call CMOVE 
      009FB4                        499 block_erase:
      009FB4 90 BE 35         [ 2]  500 	ldw y,FPTR+1
      009FB7 90 A3 B6 80      [ 2]  501 	cpw y,#app_space 
      009FBB 2A 19            [ 1]  502 	jrpl erase_flash 
                                    503 ; erase EEPROM block
      009FBD 90 A3 40 00      [ 2]  504 	cpw y,#EEPROM_BASE 
      009FC1 24 04            [ 1]  505 	jruge 1$
      009FC3 CD 84 CE         [ 4]  506 	call FC_XON
      009FC6 81               [ 4]  507 	ret ; bad address 
      009FC7 90 A3 47 FF      [ 2]  508 1$: cpw y,#EEPROM_END 
      009FCB 23 04            [ 2]  509 	jrule 2$ 
      009FCD CD 84 CE         [ 4]  510 	call FC_XON
      009FD0 81               [ 4]  511 	ret ; bad address 
      009FD1                        512 2$:	
      009FD1 CD 9D E0         [ 4]  513 	call UNLKEE 
      009FD4 20 03            [ 2]  514 	jra proceed_erase
                                    515 ; erase flash block:
      009FD6                        516 erase_flash:
      009FD6 CD 9D FF         [ 4]  517 	call UNLKFL 
      009FD9                        518 proceed_erase:
      009FD9 CD 8D 7A         [ 4]  519 	call PAD 
      009FDC 90 93            [ 1]  520 	ldw y,x
      009FDE 90 FE            [ 2]  521 	ldw y,(y)
      009FE0 1C 00 02         [ 2]  522 	addw x,#CELLL  
      009FE3 90 FD            [ 4]  523 	call (y) 
      009FE5 72 17 50 5F      [ 1]  524 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      009FE9 CD 84 CE         [ 4]  525 	call FC_XON
      009FEC 81               [ 4]  526 	ret 
                                    527 
                                    528 ; this routine is to be copied to PAD 
      009FED                        529 row_erase_proc:
      009FED 35 20 50 5B      [ 1]  530 	mov FLASH_CR2,#(1<<FLASH_CR2_ERASE) 
      009FF1 35 DF 50 5C      [ 1]  531 	mov FLASH_NCR2,#~(1<<FLASH_CR2_ERASE)
      009FF5 4F               [ 1]  532 	clr a 
      009FF6 90 5F            [ 1]  533 	clrw y 
      009FF8 91 A7 00 34      [ 1]  534 	ldf ([FPTR],y),a
      009FFC 90 5C            [ 1]  535     incw y
      009FFE 91 A7 00 34      [ 1]  536 	ldf ([FPTR],y),a
      00A002 90 5C            [ 1]  537     incw y
      00A004 91 A7 00 34      [ 1]  538 	ldf ([FPTR],y),a
      00A008 90 5C            [ 1]  539     incw y
      00A00A 91 A7 00 34      [ 1]  540 	ldf ([FPTR],y),a
      00A00E 72 05 50 5F FB   [ 2]  541 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 118.
Hexadecimal [24-Bits]



      00A013 81               [ 4]  542 	ret
      00A014                        543 row_erase_proc_end:
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
      00A014                        556 copy_buffer:
      00A014 4B 80            [ 1]  557 	push #BLOCK_SIZE  
                                    558 ;enable block programming 
      00A016 72 10 50 5B      [ 1]  559 	bset FLASH_CR2,#FLASH_CR2_PRG 
      00A01A 72 11 50 5C      [ 1]  560 	bres FLASH_NCR2,#FLASH_CR2_PRG
      00A01E 90 5F            [ 1]  561 	clrw y
      00A020 F6               [ 1]  562 1$:	ld a,(x)
      00A021 91 A7 00 34      [ 1]  563 	ldf ([FPTR],y),a
      00A025 5C               [ 1]  564 	incw x 
      00A026 90 5C            [ 1]  565 	incw y 
      00A028 0A 01            [ 1]  566 	dec (BCNT,sp)
      00A02A 26 F4            [ 1]  567 	jrne 1$
                                    568 ; wait EOP bit 
      00A02C 72 05 50 5F FB   [ 2]  569 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. 
      00A031 84               [ 1]  570 	pop a ; remove BCNT from stack 
      00A032 81               [ 4]  571 	ret 
      00A033                        572 copy_buffer_end:
                                    573 
                                    574 ;-------------------------
                                    575 ; move program_row to RAM 
                                    576 ; in TIB 
                                    577 ;------------------------
      00A033                        578 copy_prog_to_ram:
      00A033 1D 00 06         [ 2]  579 	subw x,#6
      00A036 90 AE A0 14      [ 2]  580 	ldw y,#copy_buffer 
      00A03A EF 04            [ 2]  581 	ldw (4,x),y 
      00A03C 90 AE 17 00      [ 2]  582 	ldw y,#TIBBASE
      00A040 EF 02            [ 2]  583 	ldw (2,x),y 
      00A042 90 AE A0 33      [ 2]  584 	ldw y,#copy_buffer_end 
      00A046 72 A2 A0 14      [ 2]  585 	subw y,#copy_buffer  
      00A04A FF               [ 2]  586 	ldw (x),y 
      00A04B CD 8D B6         [ 4]  587 	call CMOVE 
      00A04E 81               [ 4]  588 	ret 
                                    589 
                                    590 
                                    591 ;-----------------------------
                                    592 ; write a row in FLASH/EEPROM 
                                    593 ; WR-ROW ( a ud -- )
                                    594 ; a -> address 128 byte buffer to write 
                                    595 ; ud ->  row address in FLASH|EEPROM 
                                    596 ;-----------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 119.
Hexadecimal [24-Bits]



      00A04F 9F 8A                  597 	.word LINK 
                           001FD1   598 	LINK=.
      00A051 06                     599 	.byte 6 
      00A052 57 52 2D 52 4F 57      600 	.ascii "WR-ROW"
      00A058                        601 write_row:
      00A058 CD 84 E4         [ 4]  602 	call FC_XOFF
      00A05B CD 9C E0         [ 4]  603 	call FPSTOR
                                    604 ; align to FLASH block 
      00A05E A6 80            [ 1]  605 	ld a,#0x80 
      00A060 B4 36            [ 1]  606 	and a,PTR8 
      00A062 B7 36            [ 1]  607 	ld PTR8,a  
      00A064 CD A0 33         [ 4]  608 	call copy_prog_to_ram
      00A067 CD 9E 1E         [ 4]  609 	call UNLOCK
      00A06A 90 93            [ 1]  610 	ldw y,x 
      00A06C 90 FE            [ 2]  611 	ldw y,(y)
      00A06E 1C 00 02         [ 2]  612 	addw x,#CELLL 
      00A071 89               [ 2]  613 	pushw x 
      00A072 93               [ 1]  614 	ldw x,y ; buffer address in x 
      00A073 CD 17 00         [ 4]  615 	call TIBBASE
      00A076 CD 9E 46         [ 4]  616 	call LOCK
      00A079 85               [ 2]  617 	popw x 
      00A07A CD 84 CE         [ 4]  618 	call FC_XON 
      00A07D 81               [ 4]  619 	ret 
                                    620 
                                    621 ;-------------------------------------
                                    622 ; change value of OPTION register 
                                    623 ; SET-OPT (c n -- ) 
                                    624 ; c new value.
                                    625 ; n OPT  number {1..7}
                                    626 ;--------------------------------------
      00A07E A0 51                  627 		.word LINK 
                           002000   628 		LINK=.
      00A080 07                     629 		.byte 7 
      00A081 53 45 54 2D 4F 50 54   630 		.ascii "SET-OPT" 
      00A088                        631 set_option: 
      00A088 90 93            [ 1]  632 		ldw y,x 
      00A08A 90 FE            [ 2]  633 		ldw y,(y)
      00A08C 27 06            [ 1]  634 		jreq 1$
      00A08E 90 A3 00 07      [ 2]  635 		cpw y,#7 
      00A092 23 04            [ 2]  636 		jrule 2$ 
                                    637 ; invalid OPTION number 		
      00A094 1C 00 04         [ 2]  638 1$:		addw x,#2*CELLL
      00A097 81               [ 4]  639 		ret
      00A098 90 58            [ 2]  640 2$:		sllw y 
      00A09A 72 A9 47 FF      [ 2]  641 		addw y,#OPTION_BASE-1
      00A09E FF               [ 2]  642 		ldw (x),y 
      00A09F 1D 00 02         [ 2]  643 		subw x,#CELLL 
      00A0A2 90 5F            [ 1]  644 		clrw y 
      00A0A4 FF               [ 2]  645 		ldw (x),y 
      00A0A5 CD 9F 1E         [ 4]  646 		call EECSTORE
      00A0A8 81               [ 4]  647 		ret 
                                    648 
                                    649 
                                    650 
                                    651 ;--------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 120.
Hexadecimal [24-Bits]



                                    652 ; reset system to its original state 
                                    653 ; before any user modification
                                    654 ; PRISTINE ( -- )
                                    655 ;-------------------------------------
      00A0A9 A0 80                  656 	.word LINK  
                           00202B   657 	LINK=.
      00A0AB 08                     658 	.byte 8 
      00A0AC 50 52 49 53 54 49 4E   659 	.ascii "PRISTINE"
             45
      00A0B4                        660 pristine:
                                    661 ;;; erase EEPROM
      00A0B4 CD 9C FF         [ 4]  662 	call EEPROM 
      00A0B7 CD 88 A8         [ 4]  663 1$:	call DDUP 
      00A0BA CD 9F 94         [ 4]  664 	call row_erase
      00A0BD 90 93            [ 1]  665 	ldw y,x 
      00A0BF 90 EE 02         [ 2]  666 	ldw y,(2,y)
      00A0C2 72 A9 00 80      [ 2]  667 	addw y,#BLOCK_SIZE
      00A0C6 EF 02            [ 2]  668 	ldw (2,x),y
      00A0C8 90 A3 48 00      [ 2]  669 	cpw y,#OPTION_BASE 
      00A0CC 25 E9            [ 1]  670 	jrult 1$
                                    671 ;;; reset OPTION to default values
      00A0CE 90 AE 00 01      [ 2]  672 	ldw y,#1 ; OPT1 
      00A0D2 FF               [ 2]  673 2$:	ldw (x),y   
      00A0D3 90 5F            [ 1]  674 	clrw y 
      00A0D5 EF 02            [ 2]  675 	ldw (2,x),y  ; ( 0 1 -- ) 
      00A0D7 CD 88 A8         [ 4]  676 	call DDUP    ; ( 0 1 0 1 -- )  
      00A0DA CD A0 88         [ 4]  677 	call set_option
      00A0DD 90 93            [ 1]  678 	ldw y,x 
      00A0DF 90 FE            [ 2]  679 	ldw y,(y)
      00A0E1 90 5C            [ 1]  680 	incw y  ; next OPTION 
      00A0E3 90 A3 00 08      [ 2]  681 	cpw y,#8 
      00A0E7 25 E9            [ 1]  682 	jrult 2$
                                    683 ;;; erase first row of app_space 	
      00A0E9 90 AE B6 80      [ 2]  684 	ldw y,#app_space
      00A0ED EF 02            [ 2]  685 	ldw (2,x),y  
      00A0EF 90 5F            [ 1]  686 	clrw y 
      00A0F1 FF               [ 2]  687 	ldw (x),y ; ( app_space 0 -- )
      00A0F2 CD 9F 94         [ 4]  688 	call row_erase 
                                    689 ; reset interrupt vectors 
      00A0F5 1D 00 02         [ 2]  690 	subw x,#CELLL 
      00A0F8 90 5F            [ 1]  691 	clrw y  
      00A0FA FF               [ 2]  692 4$:	ldw (x),y  ; ( n -- ) int# 
      00A0FB CD 86 9A         [ 4]  693 	call DUPP  
      00A0FE CD A1 1B         [ 4]  694 	call reset_vector
      00A101 90 93            [ 1]  695 	ldw y,x 
      00A103 90 FE            [ 2]  696 	ldw y,(y)
      00A105 90 5C            [ 1]  697 	incw y   ; next vector 
      00A107 90 A3 00 19      [ 2]  698 	cpw y,#25 
      00A10B 25 ED            [ 1]  699 	jrult 4$
      00A10D CC 80 80         [ 2]  700 	jp NonHandledInterrupt ; reset MCU
                                    701 
                                    702 ;------------------------------
                                    703 ; reset an interrupt vector 
                                    704 ; to its initial value 
                                    705 ; i.e. NonHandledInterrupt
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 121.
Hexadecimal [24-Bits]



                                    706 ; RST-IVEC ( n -- )
                                    707 ;-----------------------------
      00A110 A0 AB                  708 	.word LINK 
                           002092   709 	LINK=. 
      00A112 08                     710 	.byte 8 
      00A113 52 53 54 2D 49 56 45   711 	.ascii "RST-IVEC"
             43
      00A11B                        712 reset_vector:
      00A11B 90 93            [ 1]  713 	ldw y,x
      00A11D 1C 00 02         [ 2]  714 	addw x,#CELLL 
      00A120 90 FE            [ 2]  715 	ldw y,(y)
      00A122 90 A3 00 17      [ 2]  716 	cpw y,#23 
      00A126 27 3A            [ 1]  717 	jreq 9$
      00A128 90 A3 00 1D      [ 2]  718 	cpw y,#29 ; last vector
      00A12C 22 34            [ 1]  719 	jrugt 9$  
      00A12E 90 58            [ 2]  720 	sllw y 
      00A130 90 58            [ 2]  721 	sllw y 
      00A132 72 A9 80 08      [ 2]  722 	addw y,#0x8008 ; irq0 address 
      00A136 90 BF 26         [ 2]  723 	ldw YTEMP,y
      00A139 1D 00 06         [ 2]  724 	subw x,#3*CELLL 
      00A13C EF 02            [ 2]  725 	ldw (2,x),y 
      00A13E 90 5F            [ 1]  726 	clrw y
      00A140 FF               [ 2]  727 	ldw (x),y 
      00A141 A6 82            [ 1]  728 	ld a,#0x82 
      00A143 90 95            [ 1]  729 	ld yh,a
      00A145 EF 04            [ 2]  730 	ldw (4,x),y
      00A147 CD 9F 6A         [ 4]  731 	call EESTORE
      00A14A 1D 00 06         [ 2]  732 	subw x,#3*CELLL
      00A14D 90 5F            [ 1]  733 	clrw y 
      00A14F FF               [ 2]  734 	ldw (x),y 
      00A150 90 AE 80 80      [ 2]  735 	ldw y,#NonHandledInterrupt
      00A154 EF 04            [ 2]  736 	ldw (4,x),y 
      00A156 90 BE 26         [ 2]  737 	ldw y,YTEMP  
      00A159 72 A9 00 02      [ 2]  738 	addw y,#2
      00A15D EF 02            [ 2]  739 	ldw (2,x),y 
      00A15F CD 9F 6A         [ 4]  740 	call EESTORE
      00A162 81               [ 4]  741 9$:	ret 
                                    742 
                                    743 
                                    744 ;------------------------------
                                    745 ; all interrupt vector with 
                                    746 ; an address >= a are resetted 
                                    747 ; to default
                                    748 ; CHKIVEC ( a -- )
                                    749 ;------------------------------
      00A163 A1 12                  750 	.word LINK 
                           0020E5   751 	LINK=.
      00A165 07                     752 	.byte 7
      00A166 43 48 4B 49 56 45 43   753 	.ascii "CHKIVEC"
                                    754 ;local variables 
                           000001   755 	SSP=1
                           000003   756 	CADR=3
                           000005   757 	OFS=5
                           000006   758 	VSIZE=6  
      00A16D                        759 CHKIVEC:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 122.
Hexadecimal [24-Bits]



      00A16D 52 06            [ 2]  760 	sub sp,#VSIZE ;alloc local variables 
      00A16F 90 93            [ 1]  761 	ldw y,x 
      00A171 90 FE            [ 2]  762 	ldw y,(y)
      00A173 17 03            [ 2]  763 	ldw (CADR,sp),y ; ca 
      00A175 1F 01            [ 2]  764 	ldw (SSP,sp),x 
      00A177 AE 80 0A         [ 2]  765 	ldw x,#0x800a ; irq0 address 
      00A17A BF 35            [ 2]  766 	ldw PTR16,X
      00A17C AE FF FC         [ 2]  767 	ldw x,#-4 
      00A17F 1C 00 04         [ 2]  768 1$:	addw x,#4
      00A182 A3 00 78         [ 2]  769 	cpw x,#30*4 ; irq0-29 
      00A185 27 22            [ 1]  770 	jreq 9$
      00A187 90 93            [ 1]  771 	ldw y,x  
      00A189 91 D6 35         [ 4]  772 	ld a,([PTR16],y)
      00A18C 11 03            [ 1]  773 	cp a,(CADR,sp)
      00A18E 25 EF            [ 1]  774 	jrult 1$
      00A190 90 5C            [ 1]  775 	incw y 
      00A192 91 D6 35         [ 4]  776 	ld a,([PTR16],y)
      00A195 11 04            [ 1]  777 	cp a,(CADR+1,sp) 
      00A197 25 E6            [ 1]  778 	jrult 1$ 
      00A199 1F 05            [ 2]  779 	ldw (OFS,sp),x 
      00A19B 54               [ 2]  780 	srlw x
      00A19C 54               [ 2]  781 	srlw x 
      00A19D 90 93            [ 1]  782 	ldw y,x 
      00A19F 1E 01            [ 2]  783 	ldw x,(SSP,sp)
      00A1A1 FF               [ 2]  784 	ldw (x),y
      00A1A2 CD A1 1B         [ 4]  785 	call reset_vector
      00A1A5 1E 05            [ 2]  786 	ldw x,(OFS,sp) 
      00A1A7 20 D6            [ 2]  787 	jra 1$
      00A1A9 1E 01            [ 2]  788 9$:	ldw x,(SSP,sp) 
      00A1AB 1C 00 02         [ 2]  789 	addw x,#CELLL 
      00A1AE 5B 06            [ 2]  790 	addw sp,#VSIZE ; drop local variables  
      00A1B0 81               [ 4]  791 	ret 
                                    792 
                                    793 ;------------------------------
                                    794 ; set interrupt vector 
                                    795 ; SET-IVEC ( ud n -- )
                                    796 ;  ud Handler address
                                    797 ;  n  vector # 0 .. 29 
                                    798 ;-----------------------------
      00A1B1 A1 65                  799 	.word LINK
                           002133   800 	LINK=.
      00A1B3 08                     801 	.byte 8 
      00A1B4 53 45 54 2D 49 56 45   802 	.ascii "SET-IVEC" 
             43
      00A1BC                        803 set_vector:
      00A1BC 90 93            [ 1]  804     ldw y,x 
      00A1BE 1C 00 02         [ 2]  805 	addw x,#CELLL 
      00A1C1 90 FE            [ 2]  806 	ldw y,(y) ; vector #
      00A1C3 90 A3 00 1D      [ 2]  807 	cpw y,#29 ; last vector
      00A1C7 23 04            [ 2]  808 	jrule 2$
      00A1C9 1C 00 04         [ 2]  809 	addw x,#2*CELLL 
      00A1CC 81               [ 4]  810 	ret
      00A1CD 90 58            [ 2]  811 2$:	sllw y 
      00A1CF 90 58            [ 2]  812 	sllw y 
      00A1D1 72 A9 80 08      [ 2]  813 	addw y,#0X8008 ; IRQ0 vector address 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 123.
Hexadecimal [24-Bits]



      00A1D5 90 BF 26         [ 2]  814 	ldw YTEMP,y ; vector address 
      00A1D8 A6 82            [ 1]  815 	ld a,#0x82 
      00A1DA 90 95            [ 1]  816 	ld yh,a 
      00A1DC E6 01            [ 1]  817 	ld a,(1,x) ; isr address bits 23..16 
      00A1DE 90 97            [ 1]  818 	ld yl,a 
                                    819 ;  write 0x82 + most significant byte of int address	
      00A1E0 1D 00 06         [ 2]  820 	subw x,#3*CELLL 
      00A1E3 EF 04            [ 2]  821 	ldw (4,x),y 
      00A1E5 90 BE 26         [ 2]  822 	ldw y,YTEMP
      00A1E8 EF 02            [ 2]  823 	ldw (2,x),y ; vector address 
      00A1EA 90 5F            [ 1]  824 	clrw y 
      00A1EC FF               [ 2]  825 	ldw (x),y   ; as a double 
      00A1ED CD 9F 6A         [ 4]  826 	call EESTORE 
      00A1F0 90 93            [ 1]  827 	ldw y,x 
      00A1F2 90 EE 02         [ 2]  828 	ldw y,(2,y) ; bits 15..0 int vector 
      00A1F5 1D 00 06         [ 2]  829 	subw x,#3*CELLL 
      00A1F8 EF 04            [ 2]  830 	ldw (4,x),y 
      00A1FA 90 BE 26         [ 2]  831 	ldw y,YTEMP 
      00A1FD 72 A9 00 02      [ 2]  832 	addw y,#2 
      00A201 EF 02            [ 2]  833 	ldw (2,x),y 
      00A203 90 5F            [ 1]  834 	clrw y 
      00A205 FF               [ 2]  835 	ldw (x),y 
      00A206 CD 9F 6A         [ 4]  836 	call EESTORE
      00A209 1C 00 04         [ 2]  837 	addw x,#2*CELLL  
      00A20C 81               [ 4]  838 9$: ret 
                                    839 
                                    840 
                                    841 ;------------------------
                                    842 ; Compile word to flash
                                    843 ; EE, (w -- )
                                    844 ;-----------------------
      00A20D A1 B3                  845 	.word LINK
                           00218F   846 	LINK=.
      00A20F 03                     847 	.byte 3
      00A210 45 45 2C               848 	.ascii "EE,"
      00A213                        849 EE_COMMA:
      00A213 1D 00 04         [ 2]  850 	subw x,#2*CELLL 
      00A216 90 BE 1A         [ 2]  851 	ldw y,UCP
      00A219 90 89            [ 2]  852 	pushw y 
      00A21B EF 02            [ 2]  853 	ldw (2,x),y 
      00A21D 90 5F            [ 1]  854 	clrw y 
      00A21F FF               [ 2]  855 	ldw (x),y
      00A220 CD 9F 6A         [ 4]  856 	call EESTORE
      00A223 90 85            [ 2]  857 	popw y 
      00A225 72 A9 00 02      [ 2]  858 	addw y,#2
      00A229 90 BF 1A         [ 2]  859 	ldw UCP,y
      00A22C 81               [ 4]  860 	ret 
                                    861 
                                    862 
                                    863 ;-------------------------
                                    864 ; Compile byte to flash 
                                    865 ; EEC, ( c -- )	
                                    866 ;-------------------------
      00A22D A2 0F                  867 	.word LINK 
                           0021AF   868 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 124.
Hexadecimal [24-Bits]



      00A22F 04                     869 	.byte 4 
      00A230 45 45 43 2C            870 	.ascii "EEC,"
      00A234                        871 EE_CCOMMA:
      00A234 1D 00 04         [ 2]  872 	subw x,#2*CELLL 
      00A237 90 BE 1A         [ 2]  873 	ldw y,UCP
      00A23A 90 89            [ 2]  874 	pushw y 
      00A23C EF 02            [ 2]  875 	ldw (2,x),y 
      00A23E 90 5F            [ 1]  876 	clrw y 
      00A240 FF               [ 2]  877 	ldw (x),y
      00A241 CD 9F 1E         [ 4]  878 	call EECSTORE
      00A244 90 85            [ 2]  879 	popw y 
      00A246 90 5C            [ 1]  880 	incw y 
      00A248 90 BF 1A         [ 2]  881 	ldw UCP,y
      00A24B 81               [ 4]  882 	ret 
                                    883 
                                    884 
                                    885 ;--------------------------
                                    886 ; copy FLASH block to ROWBUF
                                    887 ; ROW>BUF ( ud -- )
                                    888 ;--------------------------
      00A24C A2 2F                  889 	.word LINK 
                           0021CE   890 	LINK=.
      00A24E 07                     891 	.byte 7 
      00A24F 52 4F 57 3E 42 55 46   892 	.ascii "ROW>BUF"
      00A256                        893 ROW2BUF: 
      00A256 CD 9C E0         [ 4]  894 	call FPSTOR 
      00A259 A6 80            [ 1]  895 	ld a,#BLOCK_SIZE
      00A25B 88               [ 1]  896 	push a 
      00A25C B4 36            [ 1]  897 	and a,PTR8 ; block align 
      00A25E B7 36            [ 1]  898 	ld PTR8,a
      00A260 90 AE 16 80      [ 2]  899 	ldw y,#ROWBUFF 
      00A264 92 BC 00 34      [ 5]  900 1$: ldf a,[FPTR]
      00A268 90 F7            [ 1]  901 	ld (y),a
      00A26A CD 9E 5A         [ 4]  902 	call INC_FPTR
      00A26D 90 5C            [ 1]  903 	incw y 
      00A26F 0A 01            [ 1]  904 	dec (1,sp)
      00A271 26 F1            [ 1]  905 	jrne 1$ 
      00A273 84               [ 1]  906 	pop a 
      00A274 81               [ 4]  907 	ret 
                                    908 
                                    909 
                                    910 ;---------------------------
                                    911 ; copy ROWBUFF to flash 
                                    912 ; BUF>ROW ( ud -- )
                                    913 ; ud is row address as double 
                                    914 ;---------------------------
      00A275 A2 4E                  915 	.word LINK 
                           0021F7   916 	LINK=.
      00A277 07                     917 	.byte 7 
      00A278 42 55 46 3E 52 4F 57   918 	.ascii "BUF>ROW" 
      00A27F                        919 BUF2ROW:
      00A27F CD 87 9E         [ 4]  920 	call TBUF ; ( ud rb -- )
      00A282 CD 88 5E         [ 4]  921 	call ROT 
      00A285 CD 88 5E         [ 4]  922 	call ROT  ; ( rb ud -- )
      00A288 CD A0 58         [ 4]  923 	call write_row 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 125.
Hexadecimal [24-Bits]



      00A28B 81               [ 4]  924 	ret 
                                    925 
                                    926 ;---------------------------------
                                    927 ; how many byte free in that row 
                                    928 ; RFREE ( a -- n )
                                    929 ; a is least byte of target address
                                    930 ;----------------------------------
      00A28C A2 77                  931 	.word LINK 
                           00220E   932 	LINK=.
      00A28E 05                     933 	.byte 5 
      00A28F 52 46 52 45 45         934 	.ascii "RFREE"
      00A294                        935 RFREE:
      00A294 E6 01            [ 1]  936 	ld a,(1,x)
      00A296 A4 7F            [ 1]  937 	and a,#BLOCK_SIZE-1 
      00A298 B7 26            [ 1]  938 	ld YTEMP,a 
      00A29A A6 80            [ 1]  939 	ld a,#BLOCK_SIZE 
      00A29C B0 26            [ 1]  940 	sub a,YTEMP 
      00A29E 90 5F            [ 1]  941 	clrw y 
      00A2A0 90 97            [ 1]  942 	ld yl,a
      00A2A2 FF               [ 2]  943 	ldw (x),y 
      00A2A3 81               [ 4]  944 	ret 
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
      00A2A4 A2 8E                  955 	.word LINK 
                           002226   956 	LINK=. 
      00A2A6 06                     957 	.byte 6
      00A2A7 52 41 4D 3E 45 45      958 	.ascii "RAM>EE"
                                    959 	
      00A2AD                        960 RAM2EE:
                                    961 ; copy ud on top 
      00A2AD 90 93            [ 1]  962 	ldw y,x 
      00A2AF 90 EE 06         [ 2]  963 	ldw y,(6,y) ; LSW of ud  
      00A2B2 90 BF 26         [ 2]  964 	ldw YTEMP,y 
      00A2B5 90 93            [ 1]  965 	ldw y,x 
      00A2B7 90 EE 04         [ 2]  966 	ldw y,(4,y)  ; MSW of ud 
      00A2BA 1D 00 04         [ 2]  967 	subw x,#2*CELLL 
      00A2BD FF               [ 2]  968 	ldw (x),y 
      00A2BE 90 BE 26         [ 2]  969 	ldw y,YTEMP 
      00A2C1 EF 02            [ 2]  970 	ldw (2,x),y 
      00A2C3 CD A2 56         [ 4]  971 	call ROW2BUF 
      00A2C6 90 93            [ 1]  972 	ldw y,x 
      00A2C8 90 EE 06         [ 2]  973 	ldw y,(6,y)
      00A2CB 90 89            [ 2]  974 	pushw y ; udl 
      00A2CD 90 9F            [ 1]  975 	ld a,yl
      00A2CF A4 7F            [ 1]  976 	and a,#BLOCK_SIZE-1 
      00A2D1 90 5F            [ 1]  977 	clrw y 
      00A2D3 90 97            [ 1]  978 	ld yl,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 126.
Hexadecimal [24-Bits]



      00A2D5 72 A9 16 80      [ 2]  979 	addw y,#ROWBUFF 
      00A2D9 1D 00 02         [ 2]  980 	subw x,#CELLL 
      00A2DC FF               [ 2]  981 	ldw (x),y  
      00A2DD CD 86 AA         [ 4]  982 	call SWAPP ;  ( ud a ra u -- )
      00A2E0 CD 85 B5         [ 4]  983 	call RFROM  
      00A2E3 CD A2 94         [ 4]  984 	call RFREE 
      00A2E6 CD 8A 00         [ 4]  985 	call MIN
      00A2E9 CD 86 9A         [ 4]  986 	call DUPP 
      00A2EC CD 86 63         [ 4]  987 	call TOR  
      00A2EF CD 8D B6         [ 4]  988 	call CMOVE
      00A2F2 CD A2 7F         [ 4]  989 	call BUF2ROW 
      00A2F5 CD 85 B5         [ 4]  990 	call RFROM 
      00A2F8 81               [ 4]  991 	ret 
                                    992 
                                    993 
                                    994 ;--------------------------
                                    995 ; expand 16 bit address 
                                    996 ; to 32 bit address 
                                    997 ; FADDR ( a -- ud )
                                    998 ;--------------------------
      00A2F9 A2 A6                  999 	.word LINK 
                           00227B  1000 	LINK=. 
      00A2FB 05                    1001 	.byte 5 
      00A2FC 46 41 44 44 52        1002 	.ascii "FADDR"
      00A301                       1003 FADDR:
      00A301 CC 8C 8F         [ 2] 1004 	jp ZERO 
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
      00A304 A2 FB                 1020 	.word LINK 
                           002286  1021 	LINK=.
      00A306 05                    1022 	.byte 5 
      00A307 46 4D 4F 56 45        1023 	.ascii "FMOVE" 
      00A30C                       1024 FMOVE:
      00A30C CD 87 B0         [ 4] 1025 	call TFLASH 
      00A30F CD 85 64         [ 4] 1026 	CALL AT 
      00A312 CD 85 19         [ 4] 1027 	CALL QBRAN 
      00A315 A3 90                 1028 	.word no_move  
      00A317 CD 87 FF         [ 4] 1029 	call CPP
      00A31A CD 85 64         [ 4] 1030 	call AT  
      00A31D CD 86 9A         [ 4] 1031 	call DUPP ; ( udl udl -- )
      00A320 CD 87 E3         [ 4] 1032 	call CNTXT 
      00A323 CD 85 64         [ 4] 1033 	call AT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 127.
Hexadecimal [24-Bits]



      00A326 CD 84 F0         [ 4] 1034 	call DOLIT 
      00A329 00 02                 1035 	.word 2 
      00A32B CD 89 53         [ 4] 1036 	call SUBB ; ( udl udl a -- )
      00A32E CD 86 AA         [ 4] 1037 	call SWAPP 
      00A331 CD A3 01         [ 4] 1038 	call FADDR 
      00A334 CD 88 5E         [ 4] 1039 	call ROT  ; ( udl ud a -- )
      00A337 CD 86 9A         [ 4] 1040 	call DUPP 
      00A33A CD 86 63         [ 4] 1041 	call TOR    ; R: a 
      00A33D                       1042 FMOVE2: 
      00A33D CD 8D 69         [ 4] 1043 	call HERE 
      00A340 CD 85 C6         [ 4] 1044 	call RAT 
      00A343 CD 89 53         [ 4] 1045 	call SUBB ; (udl ud a wl -- )
      00A346                       1046 next_row:
      00A346 CD 86 9A         [ 4] 1047 	call DUPP 
      00A349 CD 86 63         [ 4] 1048 	call TOR  ; ( udl ud a wl -- ) R: a wl
      00A34C CD A2 AD         [ 4] 1049 	call RAM2EE ; ( udl a u -- udl u2 ) u2 is byte written to FLASH 
      00A34F CD 86 9A         [ 4] 1050 	call DUPP 
      00A352 CD 86 63         [ 4] 1051 	call TOR
      00A355 CD 88 BD         [ 4] 1052 	call PLUS  ; ( udl+ ) 
      00A358 CD 86 9A         [ 4] 1053 	call DUPP 
      00A35B CD 8C 8F         [ 4] 1054 	call ZERO   ; ( udl+ ud -- )
      00A35E CD 85 B5         [ 4] 1055 	call RFROM  ; ( udl+ ud u2  R: a wl ) 
      00A361 CD 85 B5         [ 4] 1056 	call RFROM  ; ( udl+ ud u2 wl R: a ) 
      00A364 CD 86 C2         [ 4] 1057 	call OVER   ; ( udl+ ud u2 wl u2 -- )
      00A367 CD 89 53         [ 4] 1058 	call SUBB  ; ( udl+ ud u2 wl- R: a )
      00A36A CD 86 9A         [ 4] 1059 	call DUPP 
      00A36D CD 85 19         [ 4] 1060 	call QBRAN
      00A370 A3 89                 1061 	.word fmove_done 
      00A372 CD 86 AA         [ 4] 1062 	call SWAPP  ; ( udl+ ud wl- u2 R: a )
      00A375 CD 85 B5         [ 4] 1063 	call RFROM ; ( udl+ ud wl- u2 a -- ) 
      00A378 CD 88 BD         [ 4] 1064 	call PLUS  ; ( udl+2 ud wl- a+ )
      00A37B CD 86 9A         [ 4] 1065 	call DUPP 
      00A37E CD 86 63         [ 4] 1066 	call TOR   ; ( udl+2 ud wl- a+ ) R: a+
      00A381 CD 86 AA         [ 4] 1067 	call SWAPP 
      00A384 CD 85 35         [ 4] 1068 	call BRAN
      00A387 A3 46                 1069 	.word next_row  
      00A389                       1070 fmove_done:	
      00A389 CD 85 B5         [ 4] 1071 	call RFROM  ; ( -- udl+ ud u2 wl- a  )
      00A38C 1C 00 0A         [ 2] 1072 	addw x,#5*CELLL ; (  -- cp+ ) new CP 
      00A38F 81               [ 4] 1073  	ret  
      00A390                       1074 no_move:
      00A390 CD 8C 8F         [ 4] 1075 	call ZERO
      00A393 81               [ 4] 1076 	ret 
                                   1077 
                                   1078 ;------------------------------------------
                                   1079 ; adjust pointers after **FMOVE** operetion.
                                   1080 ; UPDAT-PTR ( cp+ -- )
                                   1081 ; cp+ is new CP position after FMOVE 
                                   1082 ;-------------------------------------------
      00A394 A3 06                 1083 	.word LINK 
                           002316  1084 	LINK=.
      00A396 09                    1085 	.byte 9
      00A397 55 50 44 41 54 2D 50  1086 	.ascii "UPDAT-PTR" 
             54 52
      00A3A0                       1087 UPDATPTR:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 128.
Hexadecimal [24-Bits]



                                   1088 ;reset VP to previous position  
      00A3A0 CD 9D 5A         [ 4] 1089 	call EEPVP 
      002323                       1090 	_DROP 
      00A3A3 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00A3A6 CD 85 64         [ 4] 1091 	call AT
      00A3A9 CD 87 F1         [ 4] 1092 	call VPP 
      00A3AC CD 85 52         [ 4] 1093 	call STORE
                                   1094 ;update CONTEXT and LAST 
      00A3AF CD 9D 44         [ 4] 1095 	call EEPCP 
      002332                       1096 	_DROP
      00A3B2 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00A3B5 CD 85 64         [ 4] 1097 	call AT
      00A3B8 CD 84 F0         [ 4] 1098 	call DOLIT 
      00A3BB 00 02                 1099 	.word 2 
      00A3BD CD 88 BD         [ 4] 1100 	call PLUS 
      00A3C0 CD 86 9A         [ 4] 1101 	call DUPP 
      00A3C3 CD 87 E3         [ 4] 1102 	call CNTXT 
      00A3C6 CD 85 52         [ 4] 1103 	call STORE
      00A3C9 CD 88 0F         [ 4] 1104 	call LAST
      00A3CC CD 85 52         [ 4] 1105 	call STORE 
      00A3CF CD 9D 74         [ 4] 1106 	call UPDATLAST 
                                   1107 ;update CP 
      00A3D2 CD 87 FF         [ 4] 1108 	call CPP 
      00A3D5 CD 85 52         [ 4] 1109 	call STORE
      00A3D8 CD 9D 9D         [ 4] 1110 	call UPDATCP 
      00A3DB 81               [ 4] 1111 	ret 
                                   1112 
                                   1113 ;-----------------------------
                                   1114 ; move interrupt sub-routine
                                   1115 ; in flash memory
                                   1116 ;----------------------------- 
      00A3DC A3 96                 1117 	.word LINK 
                           00235E  1118 	LINK=. 
      00A3DE 06                    1119 	.byte 6
      00A3DF 49 46 4D 4F 56 45     1120 	.ascii "IFMOVE" 
      00A3E5                       1121 IFMOVE:
      00A3E5 CD 87 B0         [ 4] 1122 	call TFLASH 
      00A3E8 CD 85 64         [ 4] 1123 	CALL AT 
      00A3EB CD 85 19         [ 4] 1124 	CALL QBRAN 
      00A3EE A3 90                 1125 	.word no_move 
      00A3F0 CD 87 FF         [ 4] 1126 	call CPP 
      00A3F3 CD 85 64         [ 4] 1127 	call AT 
      00A3F6 CD 86 9A         [ 4] 1128 	call DUPP ; ( udl udl -- )
      00A3F9 CD 9D 5A         [ 4] 1129 	call EEPVP 
      00237C                       1130 	_DROP
      00A3FC 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00A3FF CD 85 64         [ 4] 1131 	call AT  ; ( udl udl a )
      00A402 CD 86 63         [ 4] 1132 	call TOR 
      00A405 CD A3 01         [ 4] 1133 	call FADDR
      00A408 CD 85 C6         [ 4] 1134 	call RAT ; ( udl ud a -- ) R: a 
      00A40B CC A3 3D         [ 2] 1135 	jp FMOVE2 
                                   1136 
                                   1137 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 129.
Hexadecimal [24-Bits]



                           000001  4646 .if WANT_SCALING_CONST 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 130.
Hexadecimal [24-Bits]



                                   4647         .include "const_ratio.asm"
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
      00A40E A3 DE                   34         .word LINK 
                           002390    35         LINK=.
      00A410 02                      36         .byte 2
      00A411 50 49                   37         .ascii "PI" 
      00A413                         38 PII:
      00A413 1D 00 04         [ 2]   39         subw x,#2*CELLL 
      00A416 90 AE 01 63      [ 2]   40         ldw y,#355 
      00A41A EF 02            [ 2]   41         ldw (2,x),y 
      00A41C 90 AE 00 71      [ 2]   42         ldw y,#113 
      00A420 FF               [ 2]   43         ldw (x),y 
      00A421 81               [ 4]   44         ret 
                                     45 
                                     46 ;      SQRT2 ( -- 19601  13860 )
                                     47 ; precision: 1.5e-9 
                                     48 ; usage example to compute Voltage peek to peek from Vrms 
                                     49 ; : VPP SQRT2 */ 2 * ;
                                     50 ;
      00A422 A4 10                   51         .word LINK 
                           0023A4    52         LINK=.
      00A424 05                      53         .byte 5 
      00A425 53 51 52 54 32          54         .ascii "SQRT2" 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 131.
Hexadecimal [24-Bits]



      00A42A                         55 SQRT2:
      00A42A 1D 00 04         [ 2]   56         subw x,#2*CELLL 
      00A42D 90 AE 4C 91      [ 2]   57         ldw y,#19601 
      00A431 EF 02            [ 2]   58         ldw (2,x),y 
      00A433 90 AE 36 24      [ 2]   59         ldw y,#13860 
      00A437 FF               [ 2]   60         ldw (x),y 
      00A438 81               [ 4]   61         ret 
                                     62 
                                     63 ;   SQRT3 ( -- 18817 10864 )
                                     64 ; precision: 1.1e-9
                                     65 ;
      00A439 A4 24                   66         .word LINK 
                           0023BB    67         LINK=.
      00A43B 05                      68         .byte 5
      00A43C 53 51 52 54 33          69         .ascii "SQRT3" 
      00A441                         70 SQRT3: 
      00A441 1D 00 04         [ 2]   71     subw x,#2*CELLL 
      00A444 90 AE 49 81      [ 2]   72     ldw y,#18817 
      00A448 EF 02            [ 2]   73     ldw (2,x),y 
      00A44A 90 AE 2A 70      [ 2]   74     ldw y,#10864 
      00A44E FF               [ 2]   75     ldw (x),y 
      00A44F 81               [ 4]   76     ret 
                                     77 
                                     78 ;   E ( -- 28667 10546 )
                                     79 ; precision: 5.5e-9 
                                     80 ; natural log base 
      00A450 A4 3B                   81         .word LINK 
                           0023D2    82         LINK=.
      00A452 01                      83         .byte 1
      00A453 45                      84         .ascii "E" 
      00A454                         85 ENEPER:
      00A454 1D 00 04         [ 2]   86     subw x,#2*CELLL 
      00A457 90 AE 6F FB      [ 2]   87     ldw y,#28667 
      00A45B EF 02            [ 2]   88     ldw (2,x),y 
      00A45D 90 AE 29 32      [ 2]   89     ldw y,#10546 
      00A461 FF               [ 2]   90     ldw (x),y 
      00A462 81               [ 4]   91     ret 
                                     92 
                                     93 ;   SQRT10 ( -- 22936 7253 )
                                     94 ; precision: 5.7e-9 
      00A463 A4 52                   95         .word LINK 
                           0023E5    96         LINK=.
      00A465 06                      97         .byte 6 
      00A466 53 51 52 54 31 30       98         .ascii "SQRT10" 
      00A46C                         99 SQRT10:
      00A46C 1D 00 04         [ 2]  100     subw x,#2*CELLL
      00A46F 90 AE 59 98      [ 2]  101     ldw y,#22936 
      00A473 EF 02            [ 2]  102     ldw (2,x),y 
      00A475 90 AE 1C 55      [ 2]  103     ldw y,#7253
      00A479 FF               [ 2]  104     ldw (x),y 
      00A47A 81               [ 4]  105     ret 
                                    106 
                                    107 ;   12RT2 ( -- 26797 25293 )
                                    108 ; precision: 1.0e-9 
                                    109 ; used in music to compute well tempered scale
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 132.
Hexadecimal [24-Bits]



      00A47B A4 65                  110         .word LINK 
                           0023FD   111         LINK=. 
      00A47D 05                     112         .byte 5 
      00A47E 31 32 52 54 32         113         .ascii "12RT2"
      00A483                        114 RT12_2:
      00A483 1D 00 04         [ 2]  115     subw x,#2*CELLL 
      00A486 90 AE 68 AD      [ 2]  116     ldw y,#26797
      00A48A EF 02            [ 2]  117     ldw (2,x),y 
      00A48C 90 AE 62 CD      [ 2]  118     ldw y,#25293
      00A490 FF               [ 2]  119     ldw (x),y 
      00A491 81               [ 4]  120     ret 
                                    121 
                                    122 ;   LOG2s ( -- 2040 11103 )
                                    123 ; log(2)/1.6384
                                    124 ; precision: 1.1e-8
      00A492 A4 7D                  125         .word LINK 
                           002414   126         LINK=.
      00A494 05                     127         .byte 5 
      00A495 4C 4F 47 32 53         128         .ascii "LOG2S" 
      00A49A                        129 LOG2S:
      00A49A 1D 00 04         [ 2]  130     subw x,#2*CELLL
      00A49D 90 AE 07 F8      [ 2]  131     ldw y,#2040 
      00A4A1 EF 02            [ 2]  132     ldw (2,x),y 
      00A4A3 90 AE 2B 5F      [ 2]  133     ldw y,#11103 
      00A4A7 FF               [ 2]  134     ldw (x),y 
      00A4A8 81               [ 4]  135     ret 
                                    136 
                                    137 ;   LN2 ( -- 485 11464 )
                                    138 ; ln(2)/16.384 
                                    139 ; precision: 1.0e-7 
      00A4A9 A4 94                  140         .word LINK 
                           00242B   141         LINK=.
      00A4AB 04                     142         .byte 4 
      00A4AC 4C 4E 32 53            143         .ascii "LN2S" 
      00A4B0                        144 LN2S: 
      00A4B0 1D 00 04         [ 2]  145     subw x,#2*CELLL
      00A4B3 90 AE 01 E5      [ 2]  146     ldw y,#485
      00A4B7 EF 02            [ 2]  147     ldw (2,x),y 
      00A4B9 90 AE 2C C8      [ 2]  148     ldw y,#11464 
      00A4BD FF               [ 2]  149     ldw (x),y 
      00A4BE 81               [ 4]  150     ret 
                                    151 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 133.
Hexadecimal [24-Bits]



                                   4648 .endif
                           000001  4649 .if WANT_CONST_TABLE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 134.
Hexadecimal [24-Bits]



                                   4650         .include "ctable.asm"
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
      00A4BF A4 AB                   34     .word LINK 
                           002441    35     LINK=.
      00A4C1 06                      36     .byte 6
      00A4C2 43 41 4C 4C 4F 54       37     .ascii "CALLOT"
      00A4C8                         38 CALLOT:
      00A4C8 CD 87 FF         [ 4]   39     CALL CPP
      00A4CB CD 86 9A         [ 4]   40     CALL DUPP 
      00A4CE CD 85 64         [ 4]   41     CALL AT 
      00A4D1 CD 86 63         [ 4]   42     CALL TOR 
      00A4D4 CD 8C FF         [ 4]   43     CALL PSTOR 
      00A4D7 CD 9D 9D         [ 4]   44     CALL UPDATCP 
      00A4DA CD 85 B5         [ 4]   45     CALL RFROM
      00A4DD CC 8C 8F         [ 2]   46     JP ZERO 
                                     47 
                                     48 ;------------------------------
                                     49 ; create constants bytes table 
                                     50 ; in persistant memory
                                     51 ;  CTABLE ( n+ -- ad ; <string> )
                                     52 ; n+ bytes reserved 
                                     53 ;-----------------------------
      00A4E0 A4 C1                   54     .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 135.
Hexadecimal [24-Bits]



                           002462    55     LINK=.
      00A4E2 06                      56     .byte 6
      00A4E3 43 54 41 42 4C 45       57     .ascii "CTABLE"
      00A4E9                         58 CTABLE:
      00A4E9 CD A4 C8         [ 4]   59     CALL CALLOT     
      00A4EC CC 9A 31         [ 2]   60     JP DCONST 
                                     61      
                                     62 
                                     63 ;--------------------------------
                                     64 ; create constants words table 
                                     65 ; in persistant memory 
                                     66 ; WTABLE ( n+ -- ad ; <string> )
                                     67 ; n+  words reserved  
                                     68 ;--------------------------------
      00A4EF A4 E2                   69     .word LINK 
                           002471    70     LINK=.
      00A4F1 06                      71     .byte 6
      00A4F2 57 54 41 42 4C 45       72     .ascii "WTABLE"
      00A4F8                         73 WTABLE:
      00A4F8 CD 8C 16         [ 4]   74     CALL CELLS  
      00A4FB CD A4 C8         [ 4]   75     CALL CALLOT 
      00A4FE CC 9A 31         [ 2]   76     JP DCONST 
                                     77 
                                     78 ;---------------------------------
                                     79 ; stack an element of CTABLE 
                                     80 ; CTABL@ ( u ad -- c )
                                     81 ; u element order {0..size-1}
                                     82 ; a|ad table address 
                                     83 ;--------------------------------
      00A501 A4 F1                   84     .word LINK 
                           002483    85     LINK=.
      00A503 06                      86     .byte 6
      00A504 43 54 41 42 4C 40       87     .ascii "CTABL@" 
      00A50A                         88 CTAT:
      00A50A CD 9C E0         [ 4]   89     call FPSTOR 
      00A50D CD 9E 72         [ 4]   90     call PTRPLUS 
      00A510 CC 9E AF         [ 2]   91     jp EE_CREAD 
                                     92 
                                     93 ;---------------------------------
                                     94 ; stack an element of WTABLE 
                                     95 ; WTABL@ ( u ud -- w )
                                     96 ; u is element order {0..size-1}
                                     97 ; a|ud table address 
                                     98 ;----------------------------------
      00A513 A5 03                   99     .word LINK 
                           002495   100     LINK=.
      00A515 06                     101     .byte 6
      00A516 57 54 41 42 4C 40      102     .ascii "WTABL@" 
      00A51C                        103 WTAT:
      00A51C CD 9C E0         [ 4]  104     call FPSTOR 
      00A51F CD 8C 16         [ 4]  105     call CELLS 
      00A522 CD 9E 72         [ 4]  106     call PTRPLUS 
      00A525 CD 9E 8D         [ 4]  107     call EE_READ 
      00A528 81               [ 4]  108     ret 
                                    109 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 136.
Hexadecimal [24-Bits]



                                    110 ;--------------------------
                                    111 ; tool to initialize character table 
                                    112 ; CTINIT ( ad -- )
                                    113 ; ad is table address 
                                    114 ;--------------------------
      00A529 A5 15                  115     .word LINK 
                           0024AB   116     LINK=.
      00A52B 06                     117     .byte 6 
      00A52C 43 54 49 4E 49 54      118     .ascii "CTINIT"
      00A532                        119 CTINIT:
      00A532 CD 9C E0         [ 4]  120     CALL FPSTOR
      00A535 CD 9E 1E         [ 4]  121     CALL UNLOCK
      00A538 CD 8C 8F         [ 4]  122     CALL ZERO 
      00A53B CD 8C 23         [ 4]  123 1$: CALL ONEP 
      00A53E CD 86 9A         [ 4]  124     CALL DUPP 
      00A541 CD A5 8E         [ 4]  125     CALL INTQ 
      00A544 CD 85 19         [ 4]  126     CALL QBRAN 
      00A547 A5 51                  127     .word 2$
      00A549 CD 9E C9         [ 4]  128     call WR_BYTE 
      00A54C CD 85 35         [ 4]  129     CALL BRAN 
      00A54F A5 3B                  130     .word 1$ 
      0024D1                        131 2$: _DDROP 
      00A551 1C 00 04         [ 2]    1    ADDW X,#2*CELLL 
      00A554 CD 9E 46         [ 4]  132     CALL LOCK 
      00A557 81               [ 4]  133     ret 
                                    134 
                                    135 ;--------------------------
                                    136 ; tool to initialize word table 
                                    137 ; WTINIT ( ad -- )
                                    138 ; ad is table address 
                                    139 ;--------------------------
      00A558 A5 2B                  140     .word LINK 
                           0024DA   141     LINK=.
      00A55A 06                     142     .byte 6 
      00A55B 57 54 49 4E 49 54      143     .ascii "WTINIT"
      00A561                        144 WTINIT:
      00A561 CD 9C E0         [ 4]  145     CALL FPSTOR
      00A564 CD 9E 1E         [ 4]  146     CALL UNLOCK
      00A567 CD 8C 8F         [ 4]  147     CALL ZERO 
      00A56A CD 8C 23         [ 4]  148 1$: CALL ONEP 
      00A56D CD 86 9A         [ 4]  149     CALL DUPP
      00A570 CD A5 8E         [ 4]  150     CALL INTQ
      00A573 CD 85 19         [ 4]  151     CALL QBRAN 
      00A576 A5 80                  152     .word 2$
      00A578 CD 9E EE         [ 4]  153     call WR_WORD 
      00A57B CD 85 35         [ 4]  154     CALL BRAN 
      00A57E A5 6A                  155     .word 1$ 
      002500                        156 2$: _DDROP 
      00A580 1C 00 04         [ 2]    1    ADDW X,#2*CELLL 
      00A583 CD 9E 46         [ 4]  157     CALL LOCK 
      00A586 81               [ 4]  158     ret 
                                    159 
                                    160 ;------------------------
                                    161 ; Prompted input for integer 
                                    162 ; display n+ in bracket and
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 137.
Hexadecimal [24-Bits]



                                    163 ; '?' 
                                    164 ; [N]? ( n+ -- a )
                                    165 ;------------------------
      00A587 A5 5A                  166     .word LINK 
                           002509   167     LINK=.
      00A589 04                     168     .byte 4
      00A58A 5B 4E 5D 3F            169     .ascii "[N]?" 
      00A58E                        170 INTQ:
      00A58E CD 90 16         [ 4]  171     CALL CR 
      00A591 CD 84 F0         [ 4]  172     call DOLIT 
      00A594 00 5B                  173     .word '[
      00A596 CD 84 B7         [ 4]  174     CALL EMIT 
      00A599 CD 90 BC         [ 4]  175     CALL DOT 
      00A59C CD 90 43         [ 4]  176     CALL  DOTQP
      00A59F 03                     177     .byte 3
      00A5A0 5D 3F 20               178     .ascii "]? " 
      00A5A3 CD 94 4A         [ 4]  179     CALL QUERY 
      00A5A6 CD 92 75         [ 4]  180     call TOKEN 
      00A5A9 CC A6 68         [ 2]  181     jp NUMBQ
                                    182 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 138.
Hexadecimal [24-Bits]



                                   4651 .endif
                           000001  4652 .if WANT_DOUBLE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 139.
Hexadecimal [24-Bits]



                                   4653         .include "double.asm"
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
      00252C                         35     _HEADER DBLVER,7,"DBL-VER"
      00A5AC A5 89                    1         .word LINK 
                           00252E     2         LINK=.
      00A5AE 07                       3         .byte 7  
      00A5AF 44 42 4C 2D 56 45 52     4         .ascii "DBL-VER"
      00A5B6                          5         DBLVER:
      00A5B6 CD 90 16         [ 4]   36     CALL CR 
      00A5B9 CD 90 43         [ 4]   37     CALL DOTQP 
      00A5BC 18                      38     .byte  24 
      00A5BD 64 6F 75 62 6C 65 20    39     .ascii "double integer library, "
             69 6E 74 65 67 65 72
             20 6C 69 62 72 61 72
             79 2C 20
      00A5D5 CD 9B E0         [ 4]   40     CALL PRT_LICENCE
      00A5D8 CD 9B B8         [ 4]   41     CALL COPYRIGHT  
      00255B                         42     _DOLIT DVER_MAJOR 
      00A5DB CD 84 F0         [ 4]    1     CALL DOLIT 
      00A5DE 00 01                    2     .word DVER_MAJOR 
      002560                         43     _DOLIT DVER_MINOR  
      00A5E0 CD 84 F0         [ 4]    1     CALL DOLIT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 140.
Hexadecimal [24-Bits]



      00A5E3 00 00                    2     .word DVER_MINOR 
      00A5E5 CC 9B F4         [ 2]   44     JP PRINT_VERSION  
                                     45 
                                     46 
                                     47 ; check for negative sign 
                                     48 ; ajust pointer and cntr 
      00A5E8                         49 nsign: ; ( addr cntr -- addr cntr f ) 
      00A5E8 1D 00 02         [ 2]   50     SUBW X,#CELLL ; a cntr f 
      00A5EB 90 93            [ 1]   51     LDW Y,X 
      00A5ED 90 EE 04         [ 2]   52     LDW Y,(4,Y) ; addr 
      00A5F0 90 F6            [ 1]   53     LD A,(Y) ; char=*addr  
      00A5F2 A1 2D            [ 1]   54     CP A,#'-' 
      00A5F4 27 03            [ 1]   55     JREQ NEG_SIGN 
      00A5F6 4F               [ 1]   56     CLR A  
      00A5F7 20 18            [ 2]   57     JRA STO_SIGN 
      00A5F9                         58 NEG_SIGN:
                                     59 ; increment addr 
      00A5F9 90 93            [ 1]   60     LDW Y,X 
      00A5FB 90 EE 04         [ 2]   61     LDW Y,(4,Y)
      00A5FE 72 A9 00 01      [ 2]   62     ADDW Y,#1   ;addr+1 
      00A602 EF 04            [ 2]   63     LDW (4,X),Y 
                                     64 ; decrement cntr 
      00A604 90 93            [ 1]   65     LDW Y,X
      00A606 90 EE 02         [ 2]   66     LDW Y,(2,Y)
      00A609 72 A2 00 01      [ 2]   67     SUBW Y,#1   ;cntr-1 
      00A60D EF 02            [ 2]   68     LDW (2,X),Y 
      00A60F A6 FF            [ 1]   69     LD A,#0XFF
      00A611                         70 STO_SIGN:   
      00A611 F7               [ 1]   71     LD (X),A 
      00A612 E7 01            [ 1]   72     LD (1,X),A 
      00A614 81               [ 4]   73     RET 
                                     74 
                                     75 
                                     76 ; get all digits in row 
                                     77 ; stop at first non-digit or end of string 
                                     78 ; ( dlo dhi a cntr -- dlo dhi [ a+ cntr- | a+ 0 ] )
      00A615                         79 parse_digits:
      00A615 CD 86 9A         [ 4]   80     CALL DUPP 
      002598                         81     _QBRAN parse_d5  
      00A618 CD 85 19         [ 4]    1     CALL QBRAN
      00A61B A6 5D                    2     .word parse_d5
      00A61D CD 86 63         [ 4]   82     CALL TOR   ; dlo dhi a R: cntr 
      00A620 CD 8D 52         [ 4]   83     CALL COUNT ; dlo dhi a+ char 
      00A623 CD 87 60         [ 4]   84     CALL BASE 
      00A626 CD 85 64         [ 4]   85     CALL AT 
      00A629 CD 8F 5B         [ 4]   86     CALL DIGTQ 
      0025AC                         87     _QBRAN parse_d4 ; not a digit
      00A62C CD 85 19         [ 4]    1     CALL QBRAN
      00A62F A6 51                    2     .word parse_d4
      00A631 CD A9 A8         [ 4]   88     CALL DTOR  ; dlo dhi R: cntr a+ c  
      00A634 CD 87 60         [ 4]   89     CALL BASE 
      00A637 CD 85 64         [ 4]   90     CALL AT 
      00A63A CD A8 33         [ 4]   91     CALL DSSTAR
      00A63D CD 85 B5         [ 4]   92     CALL RFROM 
      00A640 CD 8C 8F         [ 4]   93     CALL ZERO 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 141.
Hexadecimal [24-Bits]



      00A643 CD AC 5B         [ 4]   94     CALL DPLUS 
      00A646 CD 85 B5         [ 4]   95     CALL RFROM  ; dlo dhi a+ 
      00A649 CD 85 B5         [ 4]   96     CALL RFROM ; dlo dhi a+ cntr 
      00A64C CD 8C 30         [ 4]   97     CALL ONEM 
      00A64F 20 C4            [ 2]   98     JRA parse_digits ; dlo dhi a+ R: 
      00A651                         99 parse_d4:
      00A651 90 93            [ 1]  100     LDW Y,X 
      00A653 90 EE 02         [ 2]  101     LDW Y,(2,Y)
      00A656 90 5A            [ 2]  102     DECW Y  ; dec(a)
      00A658 EF 02            [ 2]  103     LDW (2,X),Y 
      00A65A 90 85            [ 2]  104     POPW Y 
      00A65C FF               [ 2]  105     LDW (X),Y ; dlo dhi a cntr  
      00A65D                        106 parse_d5:
      00A65D 81               [ 4]  107     RET 
                                    108 
                                    109 
                                    110 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    111 ;   NUMBER? (a -- s -1 |d -2 | a F )
                                    112 ;   convert string to integer 
                                    113 ;   double begin with '#' 
                                    114 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0025DE                        115     _HEADER NUMBQ,7,"NUMBER?"
      00A65E A5 AE                    1         .word LINK 
                           0025E0     2         LINK=.
      00A660 07                       3         .byte 7  
      00A661 4E 55 4D 42 45 52 3F     4         .ascii "NUMBER?"
      00A668                          5         NUMBQ:
                                    116 ; save current base value 
      00A668 CD 87 60         [ 4]  117     CALL BASE 
      00A66B CD 85 64         [ 4]  118     CALL AT 
      00A66E CD 86 63         [ 4]  119     CALL TOR  ; R: base 
                                    120 ; initialize integer to 0     
      00A671 1D 00 04         [ 2]  121     SUBW X,#4 ; create space for a double  
      00A674 90 5F            [ 1]  122     CLRW Y 
      00A676 FF               [ 2]  123     LDW (X),Y 
      00A677 EF 02            [ 2]  124     LDW (2,X),Y ; a 0 0 R: base  
      0025F9                        125     _DOLIT 2 
      00A679 CD 84 F0         [ 4]    1     CALL DOLIT 
      00A67C 00 02                    2     .word 2 
      00A67E CD 8C E8         [ 4]  126     CALL PICK  ; a 0 0 a R: base    
      00A681 CD 8D 52         [ 4]  127     CALL COUNT ; a 0 0 a+ n 
                                    128 ; check for '#' double integer 
      00A684 CD 86 C2         [ 4]  129     CALL OVER  ; a 0 0 a+ n a+
      00A687 CD 85 82         [ 4]  130     CALL CAT   ; a 0 0 a+ n c 
      00260A                        131     _DOLIT '#' ; a 0 0 a+ n c '#' 
      00A68A CD 84 F0         [ 4]    1     CALL DOLIT 
      00A68D 00 23                    2     .word '#' 
      00A68F CD 89 7B         [ 4]  132     CALL EQUAL 
      00A692 CD 86 63         [ 4]  133     CALL TOR   ; a 0 0 a+ n R: base d? 
      00A695 CD 85 C6         [ 4]  134     CALL RAT   ; a 0 0 a+ n d? R: base d?
      002618                        135     _QBRAN NUMQ0
      00A698 CD 85 19         [ 4]    1     CALL QBRAN
      00A69B A6 A9                    2     .word NUMQ0
                                    136 ; update a and count
      00A69D CD 86 AA         [ 4]  137     CALL SWAPP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 142.
Hexadecimal [24-Bits]



      00A6A0 CD 8C 23         [ 4]  138     CALL ONEP 
      00A6A3 CD 86 AA         [ 4]  139     CALL SWAPP 
      00A6A6 CD 8C 30         [ 4]  140     CALL ONEM  ; a 0 0 a+ n- R: base d?
                                    141 ; check for '$' hexadecimal  
      00A6A9                        142 NUMQ0: 
      00A6A9 CD 86 C2         [ 4]  143     CALL OVER   
      00A6AC CD 85 82         [ 4]  144     CALL CAT   
      00262F                        145     _DOLIT '$'
      00A6AF CD 84 F0         [ 4]    1     CALL DOLIT 
      00A6B2 00 24                    2     .word '$' 
      00A6B4 CD 89 7B         [ 4]  146     CALL EQUAL ; a 0 0 a+ n- f  
      002637                        147     _QBRAN NUMQ1 
      00A6B7 CD 85 19         [ 4]    1     CALL QBRAN
      00A6BA A6 D3                    2     .word NUMQ1
      00A6BC CD 8F 32         [ 4]  148     CALL HEX   ; switch to hexadecimal base 
                                    149 ; update a and count 
      00A6BF CD 86 AA         [ 4]  150     CALL SWAPP 
      00A6C2 CD 8C 23         [ 4]  151     CALL ONEP 
      00A6C5 CD 86 AA         [ 4]  152     CALL SWAPP
      00A6C8 CD 8C 30         [ 4]  153     CALL ONEM ; a 0 0 a+ n-  R: base d?
      00A6CB CD 88 4D         [ 4]  154     CALL QDUP 
      00264E                        155     _QBRAN NUMQ6 
      00A6CE CD 85 19         [ 4]    1     CALL QBRAN
      00A6D1 A7 28                    2     .word NUMQ6
                                    156 ; check for minus sign 
      00A6D3                        157 NUMQ1: 
      00A6D3 CD A5 E8         [ 4]  158     CALL nsign 
      00A6D6 CD 86 63         [ 4]  159     CALL TOR ; R: base d? sign  
                                    160 ; check for end of string     
      00A6D9 CD 88 4D         [ 4]  161     CALL QDUP    ; a dlo dhi a+ cntr R: base d? sign 
      00265C                        162     _QBRAN NUMQ5 ; yes , not a number 
      00A6DC CD 85 19         [ 4]    1     CALL QBRAN
      00A6DF A7 26                    2     .word NUMQ5
      00A6E1 CD A6 15         [ 4]  163     CALL parse_digits
      00A6E4 CD 88 4D         [ 4]  164     CALL QDUP 
      00A6E7 CD 86 E3         [ 4]  165     CALL ZEQUAL  
      00266A                        166     _QBRAN NUMQ4 ; error not end of string  ( a dlo dhi a+ R: base d? sign )
      00A6EA CD 85 19         [ 4]    1     CALL QBRAN
      00A6ED A7 1B                    2     .word NUMQ4
      00266F                        167     _DROP  ; a dlo dhi 
      00A6EF 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00A6F2 CD 85 B5         [ 4]  168     CALL RFROM  ; a dlo dhi sign 
      002675                        169     _QBRAN NUMQ3
      00A6F5 CD 85 19         [ 4]    1     CALL QBRAN
      00A6F8 A6 FD                    2     .word NUMQ3
      00A6FA CD 89 19         [ 4]  170     CALL DNEGA
      00A6FD                        171 NUMQ3: 
      00A6FD CD 88 5E         [ 4]  172     CALL ROT ; dlo dhi a  R: base d?
      002680                        173     _DROP
      00A700 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      002683                        174     _DOLIT -2  ; double return -2 flag 
      00A703 CD 84 F0         [ 4]    1     CALL DOLIT 
      00A706 FF FE                    2     .word -2 
      00A708 CD 85 B5         [ 4]  175     CALL RFROM ; dlo dhi d? R: base 
      00268B                        176     _TBRAN NUMQ8 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 143.
Hexadecimal [24-Bits]



      00A70B CD 85 27         [ 4]    1     CALL TBRAN 
      00A70E A7 30                    2     .word NUMQ8 
      00A710 CD 86 AA         [ 4]  177     CALL SWAPP 
      002693                        178     _DROP
      00A713 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00A716 CD 8C 23         [ 4]  179     CALL ONEP   ; single return -1 flag   
      00A719 20 15            [ 2]  180     JRA NUMQ8
      00A71B                        181 NUMQ4: ; not end of string error , ( a dlo dhi a+ cntr R: base d? sign )
                           000001   182 .if WANT_FLOAT
      00A71B CD 85 B5         [ 4]  183     CALL RFROM ; sign 
      00A71E CD 85 B5         [ 4]  184     CALL RFROM ; d? 
      00A721 CD B0 2A         [ 4]  185     CALL FLOATQ ; ( a dlo dhi a+ cntr sign d? )
      00A724 20 0A            [ 2]  186     JRA NUMQ8 
                                    187 .endif 
      00A726                        188 NUMQ5: 
      00A726 5B 02            [ 2]  189     ADDW SP,#2
      00A728                        190 NUMQ6:    
      00A728 5B 02            [ 2]  191     ADDW SP,#2 
      00A72A 1C 00 04         [ 2]  192     ADDW X,#4 
      00A72D 90 5F            [ 1]  193     CLRW Y 
      00A72F FF               [ 2]  194     LDW (X),Y 
      00A730                        195 NUMQ8: 
      00A730 CD 85 B5         [ 4]  196     CALL RFROM 
      00A733 CD 87 60         [ 4]  197     CALL BASE 
      00A736 CC 85 52         [ 2]  198     JP STORE 
                                    199      
                                    200 
                                    201 
                                    202 
                                    203 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    204 ;   DABS ( d -- d )
                                    205 ;   absolute value of double
                                    206 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0026B9                        207     _HEADER DABS,4,"DABS"
      00A739 A6 60                    1         .word LINK 
                           0026BB     2         LINK=.
      00A73B 04                       3         .byte 4  
      00A73C 44 41 42 53              4         .ascii "DABS"
      00A740                          5         DABS:
      00A740 F6               [ 1]  208     LD A,(X) 
      00A741 A4 80            [ 1]  209     AND A,#0X80 
      00A743 27 03            [ 1]  210     JREQ DABS1 
      00A745 CC 89 19         [ 2]  211     JP DNEGA 
      00A748                        212 DABS1:
      00A748 81               [ 4]  213     RET 
                                    214 
                                    215 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    216 ;  DSIGN ( d -- d f )
                                    217 ;  sign of double 
                                    218 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0026C9                        219     _HEADER DSIGN,5,"DSIGN"
      00A749 A7 3B                    1         .word LINK 
                           0026CB     2         LINK=.
      00A74B 05                       3         .byte 5  
      00A74C 44 53 49 47 4E           4         .ascii "DSIGN"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 144.
Hexadecimal [24-Bits]



      00A751                          5         DSIGN:
      00A751 A6 00            [ 1]  220     LD A,#0 
      00A753 90 93            [ 1]  221     LDW Y,X 
      00A755 90 FE            [ 2]  222     LDW Y,(Y)
      00A757 2A 02            [ 1]  223     JRPL DSIGN1
      00A759 A6 FF            [ 1]  224     LD A,#0XFF 
      00A75B                        225 DSIGN1:
      00A75B 1D 00 02         [ 2]  226     SUBW X,#2 
      00A75E F7               [ 1]  227     LD (X),A 
      00A75F E7 01            [ 1]  228     LD (1,X),A 
      00A761 81               [ 4]  229     RET 
                                    230 
                                    231 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    232 ;   DS/MOD ( ud us - ur qud )
                                    233 ;   unsigned divide double by single 
                                    234 ;   return double quotient 
                                    235 ;   and single remainder 
                                    236 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0026E2                        237     _HEADER DSLMOD,6,"DS/MOD"
      00A762 A7 4B                    1         .word LINK 
                           0026E4     2         LINK=.
      00A764 06                       3         .byte 6  
      00A765 44 53 2F 4D 4F 44        4         .ascii "DS/MOD"
      00A76B                          5         DSLMOD:
      00A76B 90 93            [ 1]  238         LDW     Y,X             ; stack pointer to Y
      00A76D FE               [ 2]  239         LDW     X,(X)           ; un
      00A76E BF 26            [ 2]  240         LDW     YTEMP,X         ; save un
      00A770 93               [ 1]  241         LDW     X,Y
      00A771 89               [ 2]  242         PUSHW   X               ; save stack pointer
      00A772 90 89            [ 2]  243         PUSHW   Y 
      00A774 EE 02            [ 2]  244         LDW     X,(2,X)           ; X=udh
      00A776 90 BE 26         [ 2]  245         LDW     Y,YTEMP         ; divisor 
      00A779 65               [ 2]  246         DIVW    X,Y 
      00A77A BF 24            [ 2]  247         LDW     XTEMP,X         ; QUOTIENT hi 
      00A77C 93               [ 1]  248         LDW     X,Y             ; remainder in X 
      00A77D 90 85            [ 2]  249         POPW    Y 
      00A77F 90 EE 04         [ 2]  250         LDW     Y,(4,Y)         ; Y=udl (offset before drop)
      00A782 A6 10            [ 1]  251         LD      A,#16           ; loop count
      00A784 90 58            [ 2]  252         SLLW    Y               ; udl shift udl into udh
      00A786                        253 DSLMOD3:
      00A786 59               [ 2]  254         RLCW    X               ; rotate udl bit into uhdh (= remainder)
      00A787 25 04            [ 1]  255         JRC     DSLMODa         ; if carry out of rotate
      00A789 B3 26            [ 2]  256         CPW     X,YTEMP         ; compare udh to un
      00A78B 25 05            [ 1]  257         JRULT   DSLMOD4         ; can't subtract
      00A78D                        258 DSLMODa:
      00A78D 72 B0 00 26      [ 2]  259         SUBW    X,YTEMP         ; can subtract
      00A791 98               [ 1]  260         RCF
      00A792                        261 DSLMOD4:
      00A792 8C               [ 1]  262         CCF                     ; quotient bit
      00A793 90 59            [ 2]  263         RLCW    Y               ; rotate into quotient, rotate out udl
      00A795 4A               [ 1]  264         DEC     A               ; repeat
      00A796 26 EE            [ 1]  265         JRNE    DSLMOD3           ; if A == 0
      00A798                        266 DSLMODb:
      00A798 BF 26            [ 2]  267         LDW     YTEMP,X         ; done, save remainder
      00A79A 85               [ 2]  268         POPW    X               ; restore stack pointer
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 145.
Hexadecimal [24-Bits]



      00A79B EF 02            [ 2]  269         LDW     (2,X),Y           ; save quotient low 
      00A79D 90 BE 24         [ 2]  270         LDW     Y,XTEMP         ; quotient hi 
      00A7A0 FF               [ 2]  271         LDW     (X),Y           ; save quotient hi 
      00A7A1 90 BE 26         [ 2]  272         LDW     Y,YTEMP         ; remainder onto stack
      00A7A4 EF 04            [ 2]  273         LDW     (4,X),Y
      00A7A6 81               [ 4]  274         RET 
                                    275 
                                    276 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    277 ;   D# ( d -- d )
                                    278 ;   extract least digit 
                                    279 ;   from double integer 
                                    280 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002727                        281     _HEADER DDIG,2,"D#"
      00A7A7 A7 64                    1         .word LINK 
                           002729     2         LINK=.
      00A7A9 02                       3         .byte 2  
      00A7AA 44 23                    4         .ascii "D#"
      00A7AC                          5         DDIG:
      00A7AC CD 87 60         [ 4]  282     CALL BASE 
      00A7AF CD 85 64         [ 4]  283     CALL AT 
      00A7B2 CD A7 6B         [ 4]  284     CALL DSLMOD
      00A7B5 CD 88 5E         [ 4]  285     CALL ROT   
      00A7B8 CD 8E 5B         [ 4]  286     CALL DIGIT 
      00A7BB CC 8E A7         [ 2]  287     JP HOLD 
                                    288      
                                    289 
                                    290 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    291 ;    D#S ( d -- s )
                                    292 ;   extract digit from double 
                                    293 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00273E                        294     _HEADER DDIGS,3,"D#S"
      00A7BE A7 A9                    1         .word LINK 
                           002740     2         LINK=.
      00A7C0 03                       3         .byte 3  
      00A7C1 44 23 53                 4         .ascii "D#S"
      00A7C4                          5         DDIGS:
      00A7C4 CD A7 AC         [ 4]  295     CALL    DDIG 
      00A7C7 CD 88 A8         [ 4]  296     CALL    DDUP 
      00A7CA CD A9 2E         [ 4]  297     CALL    DZEQUAL
      00274D                        298     _QBRAN  DDIGS 
      00A7CD CD 85 19         [ 4]    1     CALL QBRAN
      00A7D0 A7 C4                    2     .word DDIGS
      002752                        299     _DROP 
      00A7D2 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00A7D5 81               [ 4]  300     RET
                                    301 
                                    302 
                                    303 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    304 ;   D. ( d -- )
                                    305 ;   display double integer 
                                    306 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002756                        307     _HEADER DDOT,2,"D."
      00A7D6 A7 C0                    1         .word LINK 
                           002758     2         LINK=.
      00A7D8 02                       3         .byte 2  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 146.
Hexadecimal [24-Bits]



      00A7D9 44 2E                    4         .ascii "D."
      00A7DB                          5         DDOT:
      00A7DB CD 8F D3         [ 4]  308     CALL SPACE 
      00A7DE CD A7 51         [ 4]  309     CALL DSIGN 
      00A7E1 CD 86 63         [ 4]  310     CALL TOR
      00A7E4 CD 85 C6         [ 4]  311     CALL RAT 
      002767                        312     _QBRAN DDOT0
      00A7E7 CD 85 19         [ 4]    1     CALL QBRAN
      00A7EA A7 EF                    2     .word DDOT0
      00A7EC CD 89 19         [ 4]  313     CALL DNEGA 
      00A7EF                        314 DDOT0:     
      00A7EF CD 8E 97         [ 4]  315     CALL BDIGS 
      00A7F2 CD A7 C4         [ 4]  316     CALL DDIGS 
      00A7F5 CD 85 B5         [ 4]  317     CALL RFROM 
      002778                        318     _QBRAN DDOT1 
      00A7F8 CD 85 19         [ 4]    1     CALL QBRAN
      00A7FB A8 05                    2     .word DDOT1
      00277D                        319     _DOLIT '-' 
      00A7FD CD 84 F0         [ 4]    1     CALL DOLIT 
      00A800 00 2D                    2     .word '-' 
      00A802 CD 8E A7         [ 4]  320     CALL HOLD 
      00A805                        321 DDOT1: 
      00A805 CD 8E FC         [ 4]  322     CALL EDIGS 
      00A808 CC 8F FD         [ 2]  323     JP TYPES     
                                    324      
                                    325 
                                    326 
                                    327 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    328 ;  UDS* ( ud u -- ud*u )
                                    329 ;  uint32*uint16 
                                    330 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00278B                        331     _HEADER UDSSTAR,4,"UDS*"
      00A80B A7 D8                    1         .word LINK 
                           00278D     2         LINK=.
      00A80D 04                       3         .byte 4  
      00A80E 55 44 53 2A              4         .ascii "UDS*"
      00A812                          5         UDSSTAR:
      00A812 CD 86 63         [ 4]  332     CALL TOR 
      00A815 CD 86 AA         [ 4]  333     CALL SWAPP 
      00A818 CD 85 C6         [ 4]  334     CALL RAT 
      00A81B CD 8B 58         [ 4]  335     CALL UMSTA ; udlo*u 
      00A81E CD 88 5E         [ 4]  336     CALL ROT 
      00A821 CD 85 B5         [ 4]  337     CALL RFROM 
      00A824 CD 8B 58         [ 4]  338     CALL UMSTA ; udhi*u 
      0027A7                        339     _DROP  ; drop overflow 
      00A827 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00A82A CC 88 BD         [ 2]  340     JP PLUS  ; udlo*u+(uhi*u<<16)
                                    341      
                                    342 
                                    343 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    344 ; multiply double by unsigned single 
                                    345 ; return double 
                                    346 ;  ( d u -- d )
                                    347 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0027AD                        348     _HEADER DSSTAR,3,"DS*"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 147.
Hexadecimal [24-Bits]



      00A82D A8 0D                    1         .word LINK 
                           0027AF     2         LINK=.
      00A82F 03                       3         .byte 3  
      00A830 44 53 2A                 4         .ascii "DS*"
      00A833                          5         DSSTAR:
                                    349 ;DSSTAR:
      00A833 CD 86 63         [ 4]  350     CALL TOR
      00A836 CD A7 51         [ 4]  351     CALL DSIGN 
      00A839 CD 88 7D         [ 4]  352     CALL NROT 
      00A83C CD A7 40         [ 4]  353     CALL DABS
      00A83F CD 85 B5         [ 4]  354     CALL RFROM 
      00A842 CD A8 12         [ 4]  355     CALL UDSSTAR  
      00A845 CD 88 5E         [ 4]  356     CALL ROT 
      0027C8                        357     _QBRAN DSSTAR3 
      00A848 CD 85 19         [ 4]    1     CALL QBRAN
      00A84B A8 50                    2     .word DSSTAR3
      00A84D CC 89 19         [ 2]  358     JP DNEGA 
      00A850                        359 DSSTAR3:
      00A850 81               [ 4]  360     RET 
                                    361 
                                    362 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    363 ;  2SWAP ( d1 d2 -- d2 d1 )
                                    364 ;  swap double 
                                    365 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0027D1                        366     _HEADER DSWAP,5,"2SWAP"
      00A851 A8 2F                    1         .word LINK 
                           0027D3     2         LINK=.
      00A853 05                       3         .byte 5  
      00A854 32 53 57 41 50           4         .ascii "2SWAP"
      00A859                          5         DSWAP:
      00A859 90 93            [ 1]  367     LDW Y,X 
      00A85B 90 FE            [ 2]  368     LDW Y,(Y)
      00A85D 90 BF 26         [ 2]  369     LDW YTEMP,Y ; d2 hi 
      00A860 90 93            [ 1]  370     LDW Y,X 
      00A862 90 EE 02         [ 2]  371     LDW Y,(2,Y)
      00A865 90 BF 24         [ 2]  372     LDW XTEMP,Y  ; d2 lo 
      00A868 90 93            [ 1]  373     LDW Y,X 
      00A86A 90 EE 04         [ 2]  374     LDW Y,(4,Y)  ; d1 hi 
      00A86D FF               [ 2]  375     LDW (X),Y 
      00A86E 90 93            [ 1]  376     LDW Y,X
      00A870 90 EE 06         [ 2]  377     LDW Y,(6,Y)  ; d1 lo 
      00A873 EF 02            [ 2]  378     LDW (2,X),Y
      00A875 90 BE 26         [ 2]  379     LDW Y,YTEMP  
      00A878 EF 04            [ 2]  380     LDW (4,X),Y 
      00A87A 90 BE 24         [ 2]  381     LDW Y,XTEMP 
      00A87D EF 06            [ 2]  382     LDW (6,X),Y 
      00A87F 81               [ 4]  383     RET 
                                    384 
                                    385 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    386 ;    DCLZ ( d -- u )
                                    387 ;    double count leading zeros
                                    388 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002800                        389     _HEADER DCLZ,4,"DCLZ"
      00A880 A8 53                    1         .word LINK 
                           002802     2         LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 148.
Hexadecimal [24-Bits]



      00A882 04                       3         .byte 4  
      00A883 44 43 4C 5A              4         .ascii "DCLZ"
      00A887                          5         DCLZ:
      00A887 4F               [ 1]  390     CLR A 
      00A888 90 93            [ 1]  391     LDW Y,X 
      00A88A 90 FE            [ 2]  392     LDW Y,(Y)
      00A88C 2B 18            [ 1]  393     JRMI DCLZ8 ; no leading zero 
      00A88E 27 09            [ 1]  394     JREQ DCLZ4 ; >=16 
      00A890                        395 DCLZ1: ; <16
      00A890 90 58            [ 2]  396     SLLW Y
      00A892 4C               [ 1]  397     INC A 
      00A893 90 5D            [ 2]  398     TNZW Y 
      00A895 2B 0F            [ 1]  399     JRMI DCLZ8
      00A897 20 F7            [ 2]  400     JRA DCLZ1 
      00A899                        401 DCLZ4: ; >=16 
      00A899 A6 10            [ 1]  402     LD A,#16 
      00A89B 90 93            [ 1]  403     LDW Y,X 
      00A89D 90 EE 02         [ 2]  404     LDW Y,(2,Y)
      00A8A0 2B 04            [ 1]  405     JRMI DCLZ8 
      00A8A2 26 EC            [ 1]  406     JRNE DCLZ1 
      00A8A4 AB 10            [ 1]  407     ADD A,#16
      00A8A6                        408 DCLZ8: 
      00A8A6 1C 00 02         [ 2]  409     ADDW X,#2 
      00A8A9 90 5F            [ 1]  410     CLRW Y 
      00A8AB 90 97            [ 1]  411     LD YL,A 
      00A8AD FF               [ 2]  412     LDW (X),Y 
      00A8AE 81               [ 4]  413     RET 
                                    414 
                                    415 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    416 ;   <2ROT ( d1 d2 d3 -- d3 d1 d2 )
                                    417 ;   rotate left doubles 
                                    418 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00282F                        419     _HEADER NDROT,5,"<2ROT"
      00A8AF A8 82                    1         .word LINK 
                           002831     2         LINK=.
      00A8B1 05                       3         .byte 5  
      00A8B2 3C 32 52 4F 54           4         .ascii "<2ROT"
      00A8B7                          5         NDROT:
                                    420 ; save d3 in temp 
      00A8B7 90 93            [ 1]  421     LDW Y,X 
      00A8B9 90 FE            [ 2]  422     LDW Y,(Y)
      00A8BB 90 BF 26         [ 2]  423     LDW YTEMP,Y  ; d3 hi 
      00A8BE 90 93            [ 1]  424     LDW Y,X 
      00A8C0 90 EE 02         [ 2]  425     LDW Y,(2,Y)
      00A8C3 90 BF 24         [ 2]  426     LDW XTEMP,Y  ; d3 lo 
                                    427 ; put d2 in d1 slot 
      00A8C6 90 93            [ 1]  428     LDW Y,X 
      00A8C8 90 EE 04         [ 2]  429     LDW Y,(4,Y) 
      00A8CB FF               [ 2]  430     LDW (X),Y   ; d2 hi 
      00A8CC 90 93            [ 1]  431     LDW Y,X 
      00A8CE 90 EE 06         [ 2]  432     LDW Y,(6,Y)
      00A8D1 EF 02            [ 2]  433     LDW (2,X),Y ; d2 lo
                                    434 ; put d1 in d2 slot 
      00A8D3 90 93            [ 1]  435     LDW Y,X 
      00A8D5 90 EE 08         [ 2]  436     LDW Y,(8,Y) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 149.
Hexadecimal [24-Bits]



      00A8D8 EF 04            [ 2]  437     LDW (4,X),Y ; d1 hi 
      00A8DA 90 93            [ 1]  438     LDW Y,X 
      00A8DC 90 EE 0A         [ 2]  439     LDW Y,(10,Y)
      00A8DF EF 06            [ 2]  440     LDW (6,X),Y  ; d1 lo 
                                    441 ; put d3 in d1 slot 
      00A8E1 90 BE 26         [ 2]  442     LDW Y,YTEMP 
      00A8E4 EF 08            [ 2]  443     LDW (8,X),Y  ; d3 hi 
      00A8E6 90 BE 24         [ 2]  444     LDW Y,XTEMP 
      00A8E9 EF 0A            [ 2]  445     LDW (10,X),Y  ; d3 lo 
      00A8EB 81               [ 4]  446     RET 
                                    447 
                                    448 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    449 ;   2ROT ( d1 d2 d3 -- d2 d3 d1 )
                                    450 ;   rotate right doubles 
                                    451 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00286C                        452     _HEADER DROT,4,"2ROT"
      00A8EC A8 B1                    1         .word LINK 
                           00286E     2         LINK=.
      00A8EE 04                       3         .byte 4  
      00A8EF 32 52 4F 54              4         .ascii "2ROT"
      00A8F3                          5         DROT:
                                    453 ; save d3 in temp 
      00A8F3 90 93            [ 1]  454     LDW Y,X 
      00A8F5 90 FE            [ 2]  455     LDW Y,(Y)
      00A8F7 90 BF 26         [ 2]  456     LDW YTEMP,Y ; d3 hi 
      00A8FA 90 93            [ 1]  457     LDW Y,X 
      00A8FC 90 EE 02         [ 2]  458     LDW Y,(2,Y)
      00A8FF 90 BF 24         [ 2]  459     LDW XTEMP,Y ; d3 lo 
                                    460 ; put d1 in d3 slot 
      00A902 90 93            [ 1]  461     LDW Y,X 
      00A904 90 EE 08         [ 2]  462     LDW Y,(8,Y)
      00A907 FF               [ 2]  463     LDW (X),Y  ; d1 hi 
      00A908 90 93            [ 1]  464     LDW Y,X 
      00A90A 90 EE 0A         [ 2]  465     LDW Y,(10,Y) 
      00A90D EF 02            [ 2]  466     LDW (2,X),Y ; d1 lo 
                                    467 ; put d2 in d1 slot 
      00A90F 90 93            [ 1]  468     LDW Y,X 
      00A911 90 EE 04         [ 2]  469     LDW Y,(4,Y) ; d2 hi 
      00A914 EF 08            [ 2]  470     LDW (8,X),Y 
      00A916 90 93            [ 1]  471     LDW Y,X 
      00A918 90 EE 06         [ 2]  472     LDW Y,(6,Y) ; d2 lo 
      00A91B EF 0A            [ 2]  473     LDW (10,X),Y 
                                    474 ; put d3 in d2 slot 
      00A91D 90 BE 26         [ 2]  475     LDW Y,YTEMP 
      00A920 EF 04            [ 2]  476     LDW (4,X),Y 
      00A922 90 BE 24         [ 2]  477     LDW Y,XTEMP 
      00A925 EF 06            [ 2]  478     LDW (6,X),Y 
      00A927 81               [ 4]  479     RET 
                                    480 
                                    481 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    482 ;    D0= ( d -- 0|-1 )
                                    483 ;    check if double is 0 
                                    484 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0028A8                        485     _HEADER DZEQUAL,3,"D0="
      00A928 A8 EE                    1         .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 150.
Hexadecimal [24-Bits]



                           0028AA     2         LINK=.
      00A92A 03                       3         .byte 3  
      00A92B 44 30 3D                 4         .ascii "D0="
      00A92E                          5         DZEQUAL:
      00A92E 4F               [ 1]  486     CLR A  
      00A92F 90 93            [ 1]  487     LDW Y,X 
      00A931 90 FE            [ 2]  488     LDW Y,(Y)
      00A933 26 09            [ 1]  489     JRNE ZEQ1 
      00A935 90 93            [ 1]  490     LDW Y,X 
      00A937 90 EE 02         [ 2]  491     LDW Y,(2,Y)
      00A93A 26 02            [ 1]  492     JRNE ZEQ1 
      00A93C A6 FF            [ 1]  493     LD A,#0xFF
      00A93E                        494 ZEQ1:
      00A93E 1C 00 02         [ 2]  495     ADDW X,#CELLL 
      00A941 F7               [ 1]  496     LD (X),A
      00A942 E7 01            [ 1]  497     LD (1,X),A
      00A944 81               [ 4]  498 	RET     
                                    499 
                                    500 
                                    501 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    502 ;   D= ( d1 d2 -- f )
                                    503 ;   d1==d2?
                                    504 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0028C5                        505     _HEADER DEQUAL,2,"D="
      00A945 A9 2A                    1         .word LINK 
                           0028C7     2         LINK=.
      00A947 02                       3         .byte 2  
      00A948 44 3D                    4         .ascii "D="
      00A94A                          5         DEQUAL:
      00A94A A6 00            [ 1]  506     LD A,#0 
      00A94C 90 93            [ 1]  507     LDW Y,X 
      00A94E 90 FE            [ 2]  508     LDW Y,(Y)
      00A950 E3 04            [ 2]  509     CPW Y,(4,X)
      00A952 26 0B            [ 1]  510     JRNE DEQU4 
      00A954 90 93            [ 1]  511     LDW Y,X 
      00A956 90 EE 02         [ 2]  512     LDW Y,(2,Y)
      00A959 E3 06            [ 2]  513     CPW Y,(6,X)
      00A95B 26 02            [ 1]  514     JRNE DEQU4 
      00A95D A6 FF            [ 1]  515     LD A,#0XFF
      00A95F                        516 DEQU4:
      00A95F 1C 00 06         [ 2]  517     ADDW X,#6
      00A962 F7               [ 1]  518     LD (X),A 
      00A963 E7 01            [ 1]  519     LD (1,X),A 
      00A965 81               [ 4]  520     RET 
                                    521 
                                    522 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    523 ;   D> ( d1 d2 -- f )
                                    524 ;   d1>d2?
                                    525 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0028E6                        526     _HEADER DGREAT,2,"D>"
      00A966 A9 47                    1         .word LINK 
                           0028E8     2         LINK=.
      00A968 02                       3         .byte 2  
      00A969 44 3E                    4         .ascii "D>"
      00A96B                          5         DGREAT:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 151.
Hexadecimal [24-Bits]



      00A96B CD A8 59         [ 4]  527     CALL DSWAP 
      00A96E CC A9 76         [ 2]  528     JP DLESS 
                                    529 
                                    530 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    531 ;   D< ( d1 d2 -- f )
                                    532 ;   d1<d2? 
                                    533 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0028F1                        534     _HEADER DLESS,2,"D<"
      00A971 A9 68                    1         .word LINK 
                           0028F3     2         LINK=.
      00A973 02                       3         .byte 2  
      00A974 44 3C                    4         .ascii "D<"
      00A976                          5         DLESS:
      00A976 CD AC 8D         [ 4]  535     CALL DSUB
      00A979 CD 8C 8F         [ 4]  536     CALL ZERO
      00A97C CD 88 7D         [ 4]  537     CALL NROT  
      00A97F CD A9 91         [ 4]  538     CALL DZLESS 
      002902                        539     _QBRAN DLESS4
      00A982 CD 85 19         [ 4]    1     CALL QBRAN
      00A985 A9 8A                    2     .word DLESS4
      00A987 CC 88 F6         [ 2]  540     JP INVER  
      00A98A                        541 DLESS4:
      00A98A 81               [ 4]  542     RET
                                    543 
                                    544 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    545 ;  D0< ( d -- f )
                                    546 ;  d<0? 
                                    547 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00290B                        548     _HEADER DZLESS,3,"D0<"
      00A98B A9 73                    1         .word LINK 
                           00290D     2         LINK=.
      00A98D 03                       3         .byte 3  
      00A98E 44 30 3C                 4         .ascii "D0<"
      00A991                          5         DZLESS:
      00A991 A6 00            [ 1]  549     LD A,#0 
      00A993 90 93            [ 1]  550     LDW Y,X 
      00A995 90 FE            [ 2]  551     LDW Y,(Y)
      00A997 2A 02            [ 1]  552     JRPL DZLESS1 
      00A999 A6 FF            [ 1]  553     LD A,#0XFF 
      00A99B                        554 DZLESS1:
      00A99B 1C 00 02         [ 2]  555     ADDW X,#CELLL 
      00A99E F7               [ 1]  556     LD (X),A 
      00A99F E7 01            [ 1]  557     LD (1,X),A    
      00A9A1 81               [ 4]  558     RET 
                                    559 
                                    560 
                                    561 
                                    562 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    563 ;   2>R ( d -- R: d )
                                    564 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002922                        565     _HEADER DTOR,3,"2>R"
      00A9A2 A9 8D                    1         .word LINK 
                           002924     2         LINK=.
      00A9A4 03                       3         .byte 3  
      00A9A5 32 3E 52                 4         .ascii "2>R"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 152.
Hexadecimal [24-Bits]



      00A9A8                          5         DTOR:
      00A9A8 90 85            [ 2]  566     POPW Y 
      00A9AA 90 BF 26         [ 2]  567     LDW YTEMP,Y 
      00A9AD 90 93            [ 1]  568     LDW Y,X 
      00A9AF 90 EE 02         [ 2]  569     LDW Y,(2,Y)
      00A9B2 90 89            [ 2]  570     PUSHW Y   ; d low 
      00A9B4 90 93            [ 1]  571     LDW Y,X 
      00A9B6 90 FE            [ 2]  572     LDW Y,(Y)
      00A9B8 90 89            [ 2]  573     PUSHW Y   ; d hi 
      00293A                        574     _DDROP  
      00A9BA 1C 00 04         [ 2]    1    ADDW X,#2*CELLL 
      00A9BD 92 CC 26         [ 5]  575     JP [YTEMP]
                                    576 
                                    577 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    578 ;  2R> ( -- d ) R: d --      
                                    579 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002940                        580     _HEADER DRFROM,3,"2R>"
      00A9C0 A9 A4                    1         .word LINK 
                           002942     2         LINK=.
      00A9C2 03                       3         .byte 3  
      00A9C3 32 52 3E                 4         .ascii "2R>"
      00A9C6                          5         DRFROM:
      00A9C6 90 85            [ 2]  581     POPW Y      ; d hi 
      00A9C8 90 BF 26         [ 2]  582     LDW YTEMP,Y 
      00A9CB 1D 00 04         [ 2]  583     SUBW X,#4
      00A9CE 90 85            [ 2]  584     POPW Y       ; d hi 
      00A9D0 FF               [ 2]  585     LDW (X),Y 
      00A9D1 90 85            [ 2]  586     POPW Y       ; d low  
      00A9D3 EF 02            [ 2]  587     LDW (2,X),Y 
      00A9D5 92 CC 26         [ 5]  588     JP [YTEMP]
                                    589     
                                    590 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    591 ;   2R@ ( -- d )
                                    592 ;   fecth a double from RSTACK
                                    593 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002958                        594     _HEADER DRAT,3,"2R@"
      00A9D8 A9 C2                    1         .word LINK 
                           00295A     2         LINK=.
      00A9DA 03                       3         .byte 3  
      00A9DB 32 52 40                 4         .ascii "2R@"
      00A9DE                          5         DRAT:
      00A9DE 90 85            [ 2]  595     POPW Y 
      00A9E0 90 BF 26         [ 2]  596     LDW YTEMP,Y 
      00A9E3 1D 00 04         [ 2]  597     SUBW X,#4 
      00A9E6 16 01            [ 2]  598     LDW Y,(1,SP)
      00A9E8 FF               [ 2]  599     LDW (X),Y 
      00A9E9 16 03            [ 2]  600     LDW Y,(3,SP)
      00A9EB EF 02            [ 2]  601     LDW (2,X),Y 
      00A9ED 92 CC 26         [ 5]  602     JP [YTEMP]
                                    603 
                                    604 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    605 ;  2VARIABLE <name> 
                                    606 ;  create a double variable 
                                    607 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002970                        608     _HEADER DVARIA,9,"2VARIABLE"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 153.
Hexadecimal [24-Bits]



      00A9F0 A9 DA                    1         .word LINK 
                           002972     2         LINK=.
      00A9F2 09                       3         .byte 9  
      00A9F3 32 56 41 52 49 41 42     4         .ascii "2VARIABLE"
             4C 45
      00A9FC                          5         DVARIA:
      00A9FC CD 8D 69         [ 4]  609         CALL HERE
      00A9FF CD 86 9A         [ 4]  610         CALL DUPP
      002982                        611         _DOLIT 4  
      00AA02 CD 84 F0         [ 4]    1     CALL DOLIT 
      00AA05 00 04                    2     .word 4 
      00AA07 CD 88 BD         [ 4]  612         CALL PLUS 
      00AA0A CD 87 F1         [ 4]  613         CALL VPP 
      00AA0D CD 85 52         [ 4]  614         CALL STORE
      00AA10 CD 99 98         [ 4]  615         CALL CREAT
      00AA13 CD 86 9A         [ 4]  616         CALL DUPP
      00AA16 CD 95 B9         [ 4]  617         CALL COMMA
      00AA19 CD 8C 8F         [ 4]  618         CALL ZERO
      00AA1C CD 86 C2         [ 4]  619         CALL OVER 
      00AA1F CD 85 52         [ 4]  620         CALL STORE 
      00AA22 CD 8C 8F         [ 4]  621         CALL ZERO 
      00AA25 CD 86 AA         [ 4]  622         CALL SWAPP 
      00AA28 CD 85 52         [ 4]  623         CALL STORE
      00AA2B CD A3 0C         [ 4]  624         CALL FMOVE ; move definition to FLASH
      00AA2E CD 88 4D         [ 4]  625         CALL QDUP 
      00AA31 CD 85 19         [ 4]  626         CALL QBRAN 
      00AA34 99 E5                  627         .word SET_RAMLAST   
      00AA36 CD 9D B4         [ 4]  628         CALL UPDATVP  ; don't update if variable kept in RAM.
      00AA39 CC A3 A0         [ 2]  629         JP UPDATPTR
                                    630                 
                                    631 
                                    632 
                                    633 
                                    634 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    635 ;  2LITERAL ( d -- )
                                    636 ;  compile double literal 
                                    637 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0029BC                        638     _HEADER DLITER,IMEDD+8,"2LITERAL"
      00AA3C A9 F2                    1         .word LINK 
                           0029BE     2         LINK=.
      00AA3E 88                       3         .byte IMEDD+8  
      00AA3F 32 4C 49 54 45 52 41     4         .ascii "2LITERAL"
             4C
      00AA47                          5         DLITER:
      00AA47 CD 95 FE         [ 4]  639     CALL COMPI 
      00AA4A AA 52                  640     .word do2lit 
      00AA4C CD 95 B9         [ 4]  641     CALL COMMA 
      00AA4F CC 95 B9         [ 2]  642     JP   COMMA 
                                    643 
                                    644 
                                    645 ; runtime for 2LITERAL 
      00AA52                        646 do2lit:
      00AA52 1D 00 04         [ 2]  647     SUBW X,#4 
      00AA55 16 01            [ 2]  648     LDW Y,(1,SP)
      00AA57 90 FE            [ 2]  649     LDW Y,(Y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 154.
Hexadecimal [24-Bits]



      00AA59 FF               [ 2]  650     LDW (X),Y 
      00AA5A 16 01            [ 2]  651     LDW Y,(1,SP)
      00AA5C 90 EE 02         [ 2]  652     LDW Y,(2,Y)
      00AA5F EF 02            [ 2]  653     LDW (2,X),Y 
      00AA61 90 85            [ 2]  654     POPW Y 
      00AA63 90 EC 04         [ 2]  655     JP (4,Y)
                                    656 
                                    657 
                                    658 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    659 ;   2OVER ( d1 d2 -- d1 d2 d1 )
                                    660 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0029E6                        661     _HEADER DOVER,5,"2OVER"
      00AA66 AA 3E                    1         .word LINK 
                           0029E8     2         LINK=.
      00AA68 05                       3         .byte 5  
      00AA69 32 4F 56 45 52           4         .ascii "2OVER"
      00AA6E                          5         DOVER:
      00AA6E 90 93            [ 1]  662     LDW Y,X 
      00AA70 1D 00 04         [ 2]  663     SUBW X,#4 
      00AA73 90 89            [ 2]  664     PUSHW Y 
      00AA75 90 EE 04         [ 2]  665     LDW Y,(4,Y)  ; d1 hi 
      00AA78 FF               [ 2]  666     LDW (X),Y 
      00AA79 90 85            [ 2]  667     POPW Y 
      00AA7B 90 EE 06         [ 2]  668     LDW Y,(6,Y)  ;d1 lo 
      00AA7E EF 02            [ 2]  669     LDW (2,X),Y 
      00AA80 81               [ 4]  670     RET 
                                    671 
                                    672 
                                    673 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    674 ;   D2/ ( d -- d/2 )
                                    675 ;   divide double by 2 
                                    676 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002A01                        677     _HEADER D2SLASH,3,"D2/"
      00AA81 AA 68                    1         .word LINK 
                           002A03     2         LINK=.
      00AA83 03                       3         .byte 3  
      00AA84 44 32 2F                 4         .ascii "D2/"
      00AA87                          5         D2SLASH:
      00AA87 90 93            [ 1]  678     LDW Y,X 
      00AA89 90 FE            [ 2]  679     LDW Y,(Y)
      00AA8B 90 57            [ 2]  680     SRAW Y 
      00AA8D FF               [ 2]  681     LDW (X),Y 
      00AA8E 90 93            [ 1]  682     LDW Y,X 
      00AA90 90 EE 02         [ 2]  683     LDW Y,(2,Y)
      00AA93 90 56            [ 2]  684     RRCW Y 
      00AA95 EF 02            [ 2]  685     LDW (2,X),Y 
      00AA97 81               [ 4]  686     RET
                                    687 
                                    688 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    689 ;  D2* ( d -- d*2 )
                                    690 ;  multiply double by 2 
                                    691 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002A18                        692     _HEADER D2STAR,3,"D2*"
      00AA98 AA 83                    1         .word LINK 
                           002A1A     2         LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 155.
Hexadecimal [24-Bits]



      00AA9A 03                       3         .byte 3  
      00AA9B 44 32 2A                 4         .ascii "D2*"
      00AA9E                          5         D2STAR:
      00AA9E 90 93            [ 1]  693     LDW Y,X 
      00AAA0 90 EE 02         [ 2]  694     LDW Y,(2,Y)
      00AAA3 98               [ 1]  695     RCF 
      00AAA4 90 59            [ 2]  696     RLCW Y 
      00AAA6 EF 02            [ 2]  697     LDW (2,X),Y 
      00AAA8 90 93            [ 1]  698     LDW Y,X 
      00AAAA 90 FE            [ 2]  699     LDW Y,(Y)
      00AAAC 90 59            [ 2]  700     RLCW Y 
      00AAAE FF               [ 2]  701     LDW (X),Y 
      00AAAF 81               [ 4]  702     RET 
                                    703 
                                    704 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    705 ;   DLSHIFT ( d n -- d )
                                    706 ;   left shift double 
                                    707 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002A30                        708     _HEADER DLSHIFT,7,"DLSHIFT"
      00AAB0 AA 9A                    1         .word LINK 
                           002A32     2         LINK=.
      00AAB2 07                       3         .byte 7  
      00AAB3 44 4C 53 48 49 46 54     4         .ascii "DLSHIFT"
      00AABA                          5         DLSHIFT:
      00AABA E6 01            [ 1]  709     LD A,(1,X) ; shift count 
      00AABC A4 1F            [ 1]  710     AND A,#31
      00AABE 1C 00 02         [ 2]  711     ADDW X,#CELLL 
      00AAC1 90 93            [ 1]  712     LDW Y,X 
      00AAC3 90 FE            [ 2]  713     LDW Y,(Y)
      00AAC5 90 BF 26         [ 2]  714     LDW YTEMP,Y  ; d hi 
      00AAC8 90 93            [ 1]  715     LDW Y,X 
      00AACA 90 EE 02         [ 2]  716     LDW Y,(2,Y)  ; d low 
      00AACD                        717 DLSHIFT1:
      00AACD 4D               [ 1]  718     TNZ A 
      00AACE 27 12            [ 1]  719     JREQ DLSHIFT2 
      00AAD0 98               [ 1]  720     RCF 
      00AAD1 90 59            [ 2]  721     RLCW Y 
      00AAD3 90 89            [ 2]  722     PUSHW Y 
      00AAD5 90 BE 26         [ 2]  723     LDW Y,YTEMP 
      00AAD8 90 59            [ 2]  724     RLCW Y 
      00AADA 90 BF 26         [ 2]  725     LDW YTEMP,Y 
      00AADD 90 85            [ 2]  726     POPW Y 
      00AADF 4A               [ 1]  727     DEC A 
      00AAE0 20 EB            [ 2]  728     JRA DLSHIFT1 
      00AAE2                        729 DLSHIFT2:
      00AAE2 EF 02            [ 2]  730     LDW (2,X),Y 
      00AAE4 90 BE 26         [ 2]  731     LDW Y,YTEMP 
      00AAE7 FF               [ 2]  732     LDW (X),Y 
      00AAE8 81               [ 4]  733     RET 
                                    734 
                                    735 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    736 ;  DRSHIFT ( d n -- d )
                                    737 ;  shift right n bits 
                                    738 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002A69                        739     _HEADER DRSHIFT,7,"DRSHIFT"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 156.
Hexadecimal [24-Bits]



      00AAE9 AA B2                    1         .word LINK 
                           002A6B     2         LINK=.
      00AAEB 07                       3         .byte 7  
      00AAEC 44 52 53 48 49 46 54     4         .ascii "DRSHIFT"
      00AAF3                          5         DRSHIFT:
      00AAF3 E6 01            [ 1]  740     LD A,(1,X)
      00AAF5 A4 1F            [ 1]  741     AND A,#31
      00AAF7 1C 00 02         [ 2]  742     ADDW X,#2 
      00AAFA                        743 DRSHIFT1:
      00AAFA 4D               [ 1]  744     TNZ A 
      00AAFB 27 13            [ 1]  745     JREQ DRSHIFT2 
      00AAFD 90 93            [ 1]  746     LDW Y,X 
      00AAFF 90 FE            [ 2]  747     LDW Y,(Y)
      00AB01 90 54            [ 2]  748     SRLW Y 
      00AB03 FF               [ 2]  749     LDW (X),Y 
      00AB04 90 93            [ 1]  750     LDW Y,X 
      00AB06 90 EE 02         [ 2]  751     LDW Y,(2,Y)
      00AB09 90 56            [ 2]  752     RRCW Y 
      00AB0B EF 02            [ 2]  753     LDW (2,X),Y 
      00AB0D 4A               [ 1]  754     DEC A
      00AB0E 20 EA            [ 2]  755     JRA DRSHIFT1  
      00AB10                        756 DRSHIFT2:
      00AB10 81               [ 4]  757     RET 
                                    758 
                                    759 
                                    760 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    761 ;   D* ( d1 d2 -- d3 )
                                    762 ;   double product 
                                    763 ;   d3 = d1 * d2
                                    764 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002A91                        765     _HEADER DSTAR,2,"D*"
      00AB11 AA EB                    1         .word LINK 
                           002A93     2         LINK=.
      00AB13 02                       3         .byte 2  
      00AB14 44 2A                    4         .ascii "D*"
      00AB16                          5         DSTAR:
      00AB16 90 5F            [ 1]  766     CLRW Y 
      00AB18 F6               [ 1]  767     LD A,(X)   ; d2 sign 
      00AB19 E8 04            [ 1]  768     XOR A,(4,X) ; d1 sign 
      00AB1B 2A 02            [ 1]  769     JRPL 1$
      00AB1D 90 53            [ 2]  770     CPLW Y  
      00AB1F 52 02            [ 2]  771 1$: SUB SP,#2 
      00AB21 17 01            [ 2]  772     LDW (1,SP),Y ; R: prod_sign 
      00AB23 CD A7 40         [ 4]  773     CALL DABS   
      00AB26 CD A9 A8         [ 4]  774     CALL DTOR 
      00AB29 CD A7 40         [ 4]  775     CALL DABS
      00AB2C CD 88 A8         [ 4]  776     CALL DDUP   ; ud1 ud1  
      00AB2F CD 85 B5         [ 4]  777     CALL RFROM  ; ud1 ud1 ud2hi 
      00AB32 CD A8 33         [ 4]  778     CALL DSSTAR ; ud1 dprodhi 
                                    779 ; shift partial product 16 bits left 
      002AB5                        780     _DROP   ; drop overflow 
      00AB35 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00AB38 CD 8C 8F         [ 4]  781     CALL ZERO   ; ud1 prodhi 
      00AB3B CD 86 AA         [ 4]  782     CALL SWAPP  
      00AB3E CD A8 59         [ 4]  783     CALL DSWAP  ; dprodhi ud1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 157.
Hexadecimal [24-Bits]



      00AB41 CD 85 B5         [ 4]  784     CALL RFROM  ; dprodhi ud1 ud2lo
      00AB44 CD A8 33         [ 4]  785     CALL DSSTAR ; dprodhi dprodlo 
      00AB47 CD AC 5B         [ 4]  786     CALL DPLUS    
      00AB4A CD 85 B5         [ 4]  787     CALL RFROM    ; dprod ps 
      002ACD                        788     _QBRAN DDSTAR3 
      00AB4D CD 85 19         [ 4]    1     CALL QBRAN
      00AB50 AB 55                    2     .word DDSTAR3
      00AB52 CC 89 19         [ 2]  789     JP DNEGA 
      00AB55                        790 DDSTAR3:  
      00AB55 81               [ 4]  791     RET 
                                    792 
                                    793 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    794 ;  UD/MOD ( ud1 ud2 -- dr udq )
                                    795 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002AD6                        796     _HEADER UDSLMOD,6,"UD/MOD"
      00AB56 AB 13                    1         .word LINK 
                           002AD8     2         LINK=.
      00AB58 06                       3         .byte 6  
      00AB59 55 44 2F 4D 4F 44        4         .ascii "UD/MOD"
      00AB5F                          5         UDSLMOD:
                                    797 ;;;;;;;;;;;LOCAL VARIABLES ;;;;;;;;;;;;;;;;
                           000007   798     QLO = 7   ;   int16 
                           000005   799     QHI = 5   ;   int16 
                           000004   800     CNT1 = 4  ;   byte 
                           000003   801     CNT2 = 3  ;   byte 
                           000001   802     QLBIT = 1 ;   int16
                                    803 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    804 ; unsigned double division 
      00AB5F 52 08            [ 2]  805     SUB SP,#4*CELLL ; space for local variables 
      00AB61 90 5F            [ 1]  806     CLRW Y 
      00AB63 17 07            [ 2]  807     LDW (QLO,SP),Y 
      00AB65 17 05            [ 2]  808     LDW (QHI,SP),Y ; quotient=0  
      00AB67 CD AA 6E         [ 4]  809     CALL DOVER 
      00AB6A CD A8 87         [ 4]  810     CALL DCLZ ; n2, dividend leading zeros  
      00AB6D CD 86 63         [ 4]  811     CALL TOR 
      00AB70 CD 88 A8         [ 4]  812     CALL DDUP    
      00AB73 CD A8 87         [ 4]  813     CALL DCLZ  ; n1, divisor leading zeros
      00AB76 CD 85 B5         [ 4]  814     CALL RFROM ; n1 n2 
      00AB79 CD 89 53         [ 4]  815     CALL SUBB  ; loop count 
      00AB7C 90 93            [ 1]  816     LDW Y,X 
      00AB7E 90 FE            [ 2]  817     LDW Y,(Y)
      00AB80 90 9F            [ 1]  818     LD A,YL 
      00AB82 6B 04            [ 1]  819     LD (CNT1,SP),A
      00AB84 6B 03            [ 1]  820     LD (CNT2,SP),A 
      00AB86 90 5D            [ 2]  821     TNZW Y 
      00AB88 2B 45            [ 1]  822     JRMI UDSLA7 ; quotient is null 
      00AB8A CD AA BA         [ 4]  823     CALL DLSHIFT ; align divisor with dividend 
      00AB8D 90 5F            [ 1]  824     CLRW Y  
      00AB8F 17 01            [ 2]  825     LDW (QLBIT,SP),Y ; quotient least bit R: qlo qhi cntr qlbit 
      00AB91                        826 UDSLA3: ; division loop -- dividend divisor  
      00AB91 0F 02            [ 1]  827     CLR (2,SP)  ; qlbit=0 
      00AB93 CD AA 6E         [ 4]  828     CALL DOVER 
      00AB96 CD AA 6E         [ 4]  829     CALL DOVER 
      00AB99 CD AC 8D         [ 4]  830     CALL DSUB
      00AB9C F6               [ 1]  831     LD A,(X)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 158.
Hexadecimal [24-Bits]



      00AB9D 2B 08            [ 1]  832     JRMI UDSLA4  
      00AB9F CD A8 59         [ 4]  833     CALL DSWAP 
      00ABA2 CD A8 F3         [ 4]  834     CALL DROT 
      00ABA5 0C 02            [ 1]  835     INC (2,SP) ; quotient least bit 1 
      00ABA7                        836 UDSLA4: ; shift quotient and add qlbit 
      002B27                        837     _DDROP 
      00ABA7 1C 00 04         [ 2]    1    ADDW X,#2*CELLL 
      00ABAA 16 07            [ 2]  838     LDW Y,(QLO,SP) ; quotient low 
      00ABAC 98               [ 1]  839     RCF 
      00ABAD 90 59            [ 2]  840     RLCW Y
      00ABAF 17 07            [ 2]  841     LDW (QLO,SP),Y 
      00ABB1 16 05            [ 2]  842     LDW Y,(QHI,SP) ; quotient hi 
      00ABB3 90 59            [ 2]  843     RLCW Y 
      00ABB5 17 05            [ 2]  844     LDW (QHI,SP),Y 
      00ABB7 16 07            [ 2]  845     LDW Y,(QLO,SP) 
      00ABB9 72 F9 01         [ 2]  846     ADDW Y,(QLBIT,SP)
      00ABBC 17 07            [ 2]  847     LDW (QLO,SP),Y 
      00ABBE 7B 03            [ 1]  848     LD A,(CNT2,SP)
      00ABC0 27 1B            [ 1]  849     JREQ UDSLA8 
      00ABC2 0A 03            [ 1]  850     DEC (CNT2,SP) ; loop counter  
                                    851 ; shift dividend left 1 bit      
      00ABC4 CD A8 59         [ 4]  852     CALL DSWAP 
      00ABC7 CD AA 9E         [ 4]  853     CALL D2STAR 
      00ABCA CD A8 59         [ 4]  854     CALL DSWAP 
      00ABCD 20 C2            [ 2]  855     JRA UDSLA3 
      00ABCF                        856 UDSLA7:
      002B4F                        857     _DROP 
      00ABCF 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00ABD2 CD 8C 8F         [ 4]  858     CALL ZERO 
      002B55                        859     _DOLIT 2   ; cnt1 local var 
      00ABD5 CD 84 F0         [ 4]    1     CALL DOLIT 
      00ABD8 00 02                    2     .word 2 
      00ABDA CD 86 3F         [ 4]  860     CALL NRSTO ; R: 0 0 cnt1 cnt2 qlbit     
      00ABDD                        861 UDSLA8:
      00ABDD 1C 00 04         [ 2]  862     ADDW X,#4 ; drop divisor
      00ABE0 5B 03            [ 2]  863     ADDW SP,#3 ; drop cnt2 qlbit   
      00ABE2 84               [ 1]  864     POP A 
      00ABE3 90 5F            [ 1]  865     CLRW Y 
      00ABE5 90 97            [ 1]  866     LD YL,A 
      00ABE7 1D 00 02         [ 2]  867     SUBW X,#CELLL 
      00ABEA FF               [ 2]  868     LDW (X),Y  
      00ABEB CD AA F3         [ 4]  869     CALL DRSHIFT 
                                    870     ; quotient replace dividend 
      00ABEE CD A9 C6         [ 4]  871     CALL DRFROM  ; quotient 
      00ABF1 81               [ 4]  872     RET 
                                    873 
                                    874 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    875 ;   D/MOD  ( d1 d2 -- dr dq )
                                    876 ;   double division dq=d1/d2
                                    877 ;   dr remainder double 
                                    878 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002B72                        879     _HEADER DDSLMOD,5,"D/MOD"  
      00ABF2 AB 58                    1         .word LINK 
                           002B74     2         LINK=.
      00ABF4 05                       3         .byte 5  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 159.
Hexadecimal [24-Bits]



      00ABF5 44 2F 4D 4F 44           4         .ascii "D/MOD"
      00ABFA                          5         DDSLMOD:
      00ABFA F6               [ 1]  880     LD A,(X) ; disisor sign 
      00ABFB 88               [ 1]  881     PUSH A 
      00ABFC E6 04            [ 1]  882     LD A,(4,X) ; dividend sign 
      00ABFE 88               [ 1]  883     PUSH A   ; R: sdivsor sdivnd 
      00ABFF CD A7 40         [ 4]  884     CALL DABS 
      00AC02 CD A9 A8         [ 4]  885     CALL DTOR ; R: sign abs(divisor)
      00AC05 CD A7 40         [ 4]  886     CALL DABS  ; ud1  
      00AC08 CD A9 DE         [ 4]  887     CALL DRAT  ; ud1 ud2 R: sign abs(divisor) 
      00AC0B CD AB 5F         [ 4]  888     CALL UDSLMOD ; ud1/ud2 -- dr dq  
      00AC0E 7B 05            [ 1]  889     LD A,(5,SP) ; sdivnd 
      00AC10 18 06            [ 1]  890     XOR A,(6,SP) ; 
      00AC12 2A 23            [ 1]  891     JRPL DSLA8 
      00AC14 CD 89 19         [ 4]  892     CALL DNEGA ; negate quotient  
      00AC17 CD AA 6E         [ 4]  893     CALL DOVER 
      00AC1A CD A9 2E         [ 4]  894     CALL DZEQUAL
      002B9D                        895     _TBRAN DSLA9 
      00AC1D CD 85 27         [ 4]    1     CALL TBRAN 
      00AC20 AC 44                    2     .word DSLA9 
      00AC22 CD 8C 9A         [ 4]  896     CALL ONE 
      00AC25 CD 8C 8F         [ 4]  897     CALL ZERO 
      00AC28 CD AC 8D         [ 4]  898     CALL DSUB  
      00AC2B CD A9 DE         [ 4]  899     CALL DRAT 
      00AC2E CD A8 F3         [ 4]  900     CALL DROT 
      00AC31 CD AC 8D         [ 4]  901     CALL DSUB  ; corrected_remainder=divisor-remainder 
      00AC34 CD A8 59         [ 4]  902     CALL DSWAP
      00AC37                        903 DSLA8:      
                                    904 ; check for divisor sign 
                                    905 ; if negative change negate remainder 
      00AC37 7B 06            [ 1]  906     LD A,(6,SP) ; divisor sign 
      00AC39 2A 09            [ 1]  907     JRPL DSLA9 
      00AC3B CD A9 A8         [ 4]  908     CALL DTOR 
      00AC3E CD 89 19         [ 4]  909     CALL DNEGA 
      00AC41 CD A9 C6         [ 4]  910     CALL DRFROM 
      00AC44                        911 DSLA9:
      00AC44 5B 06            [ 2]  912     ADDW SP,#6 
      00AC46 81               [ 4]  913     RET 
                                    914 
                                    915 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    916 ;   D/  ( d1 d2 -- dq )
                                    917 ;   division double by double 
                                    918 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002BC7                        919     _HEADER DSLASH,2,"D/"
      00AC47 AB F4                    1         .word LINK 
                           002BC9     2         LINK=.
      00AC49 02                       3         .byte 2  
      00AC4A 44 2F                    4         .ascii "D/"
      00AC4C                          5         DSLASH:
      00AC4C CD AB FA         [ 4]  920     CALL DDSLMOD
      00AC4F CD A8 59         [ 4]  921     CALL DSWAP
      002BD2                        922     _DDROP 
      00AC52 1C 00 04         [ 2]    1    ADDW X,#2*CELLL 
      00AC55 81               [ 4]  923     RET 
                                    924 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 160.
Hexadecimal [24-Bits]



                                    925 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    926 ;   D+ ( d1 d2 -- d3 )
                                    927 ;   add 2 doubles 
                                    928 ;   d3=d1+d2 
                                    929 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002BD6                        930     _HEADER DPLUS,2,"D+"
      00AC56 AC 49                    1         .word LINK 
                           002BD8     2         LINK=.
      00AC58 02                       3         .byte 2  
      00AC59 44 2B                    4         .ascii "D+"
      00AC5B                          5         DPLUS:
      00AC5B 90 93            [ 1]  931     LDW Y,X 
      00AC5D 90 FE            [ 2]  932     LDW Y,(Y)
      00AC5F 90 BF 26         [ 2]  933     LDW YTEMP,Y ; d2 hi 
      00AC62 90 93            [ 1]  934     LDW Y,X 
      00AC64 90 EE 02         [ 2]  935     LDW Y,(2,Y)
      00AC67 90 BF 24         [ 2]  936     LDW XTEMP,Y ; d2 lo 
      00AC6A 1C 00 04         [ 2]  937     ADDW X,#4 
      00AC6D 90 93            [ 1]  938     LDW Y,X 
      00AC6F 90 EE 02         [ 2]  939     LDW Y,(2,Y) ; d1 lo
      00AC72 72 B9 00 24      [ 2]  940     ADDW Y,XTEMP
      00AC76 EF 02            [ 2]  941     LDW (2,X),Y 
      00AC78 90 93            [ 1]  942     LDW Y,X 
      00AC7A 90 FE            [ 2]  943     LDW Y,(Y) ; d1 hi 
      00AC7C 24 04            [ 1]  944     JRNC DPLUS1 
      00AC7E 72 A9 00 01      [ 2]  945     ADDW Y,#1 
      00AC82                        946 DPLUS1: 
      00AC82 72 B9 00 26      [ 2]  947     ADDW Y,YTEMP 
      00AC86 FF               [ 2]  948     LDW (X),Y 
      00AC87 81               [ 4]  949     RET 
                                    950 
                                    951 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    952 ;   D- ( d1 d2 -- d3 )
                                    953 ;   d3=d1-d2 
                                    954 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002C08                        955     _HEADER DSUB,2,"D-"
      00AC88 AC 58                    1         .word LINK 
                           002C0A     2         LINK=.
      00AC8A 02                       3         .byte 2  
      00AC8B 44 2D                    4         .ascii "D-"
      00AC8D                          5         DSUB:
      00AC8D 90 93            [ 1]  956     LDW Y,X 
      00AC8F 90 FE            [ 2]  957     LDW Y,(Y)
      00AC91 90 BF 26         [ 2]  958     LDW YTEMP,Y ; d2 hi 
      00AC94 90 93            [ 1]  959     LDW Y,X 
      00AC96 90 EE 02         [ 2]  960     LDW Y,(2,Y)
      00AC99 90 BF 24         [ 2]  961     LDW XTEMP,Y ; d2 lo 
      00AC9C 1C 00 04         [ 2]  962     ADDW X,#4 
      00AC9F 90 93            [ 1]  963     LDW Y,X 
      00ACA1 90 EE 02         [ 2]  964     LDW Y,(2,Y) ; d1 lo
      00ACA4 72 B2 00 24      [ 2]  965     SUBW Y,XTEMP
      00ACA8 EF 02            [ 2]  966     LDW (2,X),Y 
      00ACAA 90 93            [ 1]  967     LDW Y,X 
      00ACAC 90 FE            [ 2]  968     LDW Y,(Y) ; d1 hi 
      00ACAE 24 04            [ 1]  969     JRNC DSUB1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 161.
Hexadecimal [24-Bits]



      00ACB0 72 A2 00 01      [ 2]  970     SUBW Y,#1 
      00ACB4                        971 DSUB1: 
      00ACB4 72 B2 00 26      [ 2]  972     SUBW Y,YTEMP 
      00ACB8 FF               [ 2]  973     LDW (X),Y 
      00ACB9 81               [ 4]  974     RET 
                                    975 
                                    976 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 162.
Hexadecimal [24-Bits]



                                   4654 .endif 
                           000001  4655 .if WANT_FLOAT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 163.
Hexadecimal [24-Bits]



                                   4656         .include "float.asm"
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 164.
Hexadecimal [24-Bits]



                                     55 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002C3A                         56     _HEADER FVER,9,"FLOAT-VER"
      00ACBA AC 8A                    1         .word LINK 
                           002C3C     2         LINK=.
      00ACBC 09                       3         .byte 9  
      00ACBD 46 4C 4F 41 54 2D 56     4         .ascii "FLOAT-VER"
             45 52
      00ACC6                          5         FVER:
      00ACC6 CD 90 16         [ 4]   57     CALL CR 
      00ACC9 CD 90 43         [ 4]   58     CALL DOTQP 
      00ACCC 11                      59     .byte  17 
      00ACCD 66 6C 6F 61 74 33 32    60     .ascii "float32 library, "
             20 6C 69 62 72 61 72
             79 2C 20
      00ACDE CD 9B E0         [ 4]   61     CALL PRT_LICENCE 
      00ACE1 CD 9B B8         [ 4]   62     CALL COPYRIGHT 
      002C64                         63     _DOLIT FLOAT_MAJOR     
      00ACE4 CD 84 F0         [ 4]    1     CALL DOLIT 
      00ACE7 00 01                    2     .word FLOAT_MAJOR 
      002C69                         64     _DOLIT FLOAT_MINOR 
      00ACE9 CD 84 F0         [ 4]    1     CALL DOLIT 
      00ACEC 00 00                    2     .word FLOAT_MINOR 
      00ACEE CC 9B F4         [ 2]   65     JP PRINT_VERSION 
                                     66 
                                     67 
                                     68 ;-------------------------
                                     69 ;    FPSW ( -- a )
                                     70 ;    floating state variable
                                     71 ;    bit 0 zero flag 
                                     72 ;    bit 1 negative flag 
                                     73 ;    bit 2 overflow/error flag 
                                     74 ;---------------------------
      002C71                         75     _HEADER FPSW,4,"FPSW"
      00ACF1 AC BC                    1         .word LINK 
                           002C73     2         LINK=.
      00ACF3 04                       3         .byte 4  
      00ACF4 46 50 53 57              4         .ascii "FPSW"
      00ACF8                          5         FPSW:
      00ACF8 90 AE 00 08      [ 2]   76 	LDW Y,#UFPSW  
      00ACFC 1D 00 02         [ 2]   77 	SUBW X,#2
      00ACFF FF               [ 2]   78     LDW (X),Y
      00AD00 81               [ 4]   79     RET
                                     80 
                                     81 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     82 ;   FRESET ( -- )
                                     83 ;   reset FPSW variable 
                                     84 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
      002C81                         85     _HEADER FRESET,6,"FRESET"
      00AD01 AC F3                    1         .word LINK 
                           002C83     2         LINK=.
      00AD03 06                       3         .byte 6  
      00AD04 46 52 45 53 45 54        4         .ascii "FRESET"
      00AD0A                          5         FRESET:
      00AD0A CD 8C 8F         [ 4]   86     CALL ZERO  
      00AD0D CD AC F8         [ 4]   87     CALL FPSW 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 165.
Hexadecimal [24-Bits]



      00AD10 CD 85 52         [ 4]   88     CALL STORE 
      00AD13 81               [ 4]   89     RET 
                                     90 
                                     91 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     92 ;   FINIT ( -- )
                                     93 ;   initialize floating point 
                                     94 ;   library 
                                     95 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002C94                         96     _HEADER FINIT,5,"FINIT"
      00AD14 AD 03                    1         .word LINK 
                           002C96     2         LINK=.
      00AD16 05                       3         .byte 5  
      00AD17 46 49 4E 49 54           4         .ascii "FINIT"
      00AD1C                          5         FINIT:
      00AD1C CD AD 0A         [ 4]   97     CALL FRESET 
      00AD1F 81               [ 4]   98     RET 
                                     99 
                                    100 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    101 ;    FER ( -- u )
                                    102 ;    return FPSW value 
                                    103 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002CA0                        104     _HEADER FER,3,"FER"
      00AD20 AD 16                    1         .word LINK 
                           002CA2     2         LINK=.
      00AD22 03                       3         .byte 3  
      00AD23 46 45 52                 4         .ascii "FER"
      00AD26                          5         FER:
      00AD26 CD AC F8         [ 4]  105     CALL FPSW 
      00AD29 CD 85 64         [ 4]  106     CALL AT 
      00AD2C 81               [ 4]  107     RET 
                                    108 
                                    109 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    110 ;    FZE  ( -- 0|-1 )
                                    111 ;    return FPSW zero flag 
                                    112 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002CAD                        113     _HEADER FZE,3,"FZE"
      00AD2D AD 22                    1         .word LINK 
                           002CAF     2         LINK=.
      00AD2F 03                       3         .byte 3  
      00AD30 46 5A 45                 4         .ascii "FZE"
      00AD33                          5         FZE:
      00AD33 CD AC F8         [ 4]  114     CALL FPSW
      00AD36 CD 85 64         [ 4]  115     CALL AT  
      00AD39 CD 8C 9A         [ 4]  116     CALL ONE 
      00AD3C CD 86 F7         [ 4]  117     CALL ANDD
      00AD3F CD 89 07         [ 4]  118     CALL NEGAT  
      00AD42 81               [ 4]  119     RET 
                                    120 
                                    121 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    122 ;    FNE ( -- 0|-1 )
                                    123 ;    return FPSW negative flag 
                                    124 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002CC3                        125     _HEADER FNE,3,"FNE"
      00AD43 AD 2F                    1         .word LINK 
                           002CC5     2         LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 166.
Hexadecimal [24-Bits]



      00AD45 03                       3         .byte 3  
      00AD46 46 4E 45                 4         .ascii "FNE"
      00AD49                          5         FNE:
      00AD49 CD AC F8         [ 4]  126     CALL FPSW 
      00AD4C CD 85 64         [ 4]  127     CALL AT 
      002CCF                        128     _DOLIT 2 
      00AD4F CD 84 F0         [ 4]    1     CALL DOLIT 
      00AD52 00 02                    2     .word 2 
      00AD54 CD 86 F7         [ 4]  129     CALL ANDD
      00AD57 CD 8C 75         [ 4]  130     CALL TWOSL
      00AD5A CD 89 07         [ 4]  131     CALL NEGAT   
      00AD5D 81               [ 4]  132     RET 
                                    133 
                                    134 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    135 ;   FOV (  -- 0|-1 )
                                    136 ;   return FPSW overflow flag 
                                    137 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002CDE                        138     _HEADER FOV,3,"FOV"
      00AD5E AD 45                    1         .word LINK 
                           002CE0     2         LINK=.
      00AD60 03                       3         .byte 3  
      00AD61 46 4F 56                 4         .ascii "FOV"
      00AD64                          5         FOV:
      00AD64 CD AC F8         [ 4]  139     CALL FPSW
      00AD67 CD 85 64         [ 4]  140     CALL AT  
      002CEA                        141     _DOLIT 4 
      00AD6A CD 84 F0         [ 4]    1     CALL DOLIT 
      00AD6D 00 04                    2     .word 4 
      00AD6F CD 86 F7         [ 4]  142     CALL ANDD
      002CF2                        143     _DOLIT 2 
      00AD72 CD 84 F0         [ 4]    1     CALL DOLIT 
      00AD75 00 02                    2     .word 2 
      00AD77 CD 8C 5D         [ 4]  144     CALL RSHIFT 
      00AD7A CD 89 07         [ 4]  145     CALL NEGAT  
      00AD7D 81               [ 4]  146     RET 
                                    147 
                                    148 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    149 ;    SFZ ( f# -- f# )
                                    150 ;    set FPSW zero flag 
                                    151 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002CFE                        152     _HEADER SFZ,3,"SFZ"
      00AD7E AD 60                    1         .word LINK 
                           002D00     2         LINK=.
      00AD80 03                       3         .byte 3  
      00AD81 53 46 5A                 4         .ascii "SFZ"
      00AD84                          5         SFZ:
      00AD84 CD AD 26         [ 4]  153     CALL FER 
      002D07                        154     _DOLIT 0xfffe 
      00AD87 CD 84 F0         [ 4]    1     CALL DOLIT 
      00AD8A FF FE                    2     .word 0xfffe 
      00AD8C CD 86 F7         [ 4]  155     CALL ANDD 
      00AD8F CD 86 63         [ 4]  156     CALL TOR    
      00AD92 CD 88 A8         [ 4]  157     CALL DDUP 
      002D15                        158     _DOLIT 0xFF  
      00AD95 CD 84 F0         [ 4]    1     CALL DOLIT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 167.
Hexadecimal [24-Bits]



      00AD98 00 FF                    2     .word 0xFF 
      00AD9A CD 86 F7         [ 4]  159     CALL ANDD
      00AD9D CD A9 2E         [ 4]  160     CALL DZEQUAL 
      002D20                        161     _DOLIT 1 
      00ADA0 CD 84 F0         [ 4]    1     CALL DOLIT 
      00ADA3 00 01                    2     .word 1 
      00ADA5 CD 86 F7         [ 4]  162     CALL ANDD 
      00ADA8 CD 85 B5         [ 4]  163     CALL RFROM 
      00ADAB CD 87 0B         [ 4]  164     CALL ORR 
      00ADAE CD AC F8         [ 4]  165     CALL FPSW 
      00ADB1 CD 85 52         [ 4]  166     CALL STORE 
      00ADB4 81               [ 4]  167     RET 
                                    168 
                                    169 
                                    170 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    171 ;   SFN ( f# -- f# )
                                    172 ;   set FPSW negative flag 
                                    173 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002D35                        174     _HEADER SFN,3,"SFN"
      00ADB5 AD 80                    1         .word LINK 
                           002D37     2         LINK=.
      00ADB7 03                       3         .byte 3  
      00ADB8 53 46 4E                 4         .ascii "SFN"
      00ADBB                          5         SFN:
      00ADBB CD AD 26         [ 4]  175     CALL FER 
      002D3E                        176     _DOLIT 0xFFFD 
      00ADBE CD 84 F0         [ 4]    1     CALL DOLIT 
      00ADC1 FF FD                    2     .word 0xFFFD 
      00ADC3 CD 86 F7         [ 4]  177     CALL ANDD  
      00ADC6 CD 86 63         [ 4]  178     CALL TOR 
      00ADC9 CD 86 9A         [ 4]  179     CALL DUPP 
      002D4C                        180     _DOLIT 0X80 
      00ADCC CD 84 F0         [ 4]    1     CALL DOLIT 
      00ADCF 00 80                    2     .word 0X80 
      00ADD1 CD 86 F7         [ 4]  181     CALL ANDD 
      002D54                        182     _DOLIT 6 
      00ADD4 CD 84 F0         [ 4]    1     CALL DOLIT 
      00ADD7 00 06                    2     .word 6 
      00ADD9 CD 8C 5D         [ 4]  183     CALL RSHIFT 
      00ADDC CD 85 B5         [ 4]  184     CALL RFROM 
      00ADDF CD 87 0B         [ 4]  185     CALL ORR 
      00ADE2 CD AC F8         [ 4]  186     CALL FPSW 
      00ADE5 CD 85 52         [ 4]  187     CALL STORE 
      00ADE8 81               [ 4]  188     RET 
                                    189 
                                    190 
                                    191 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    192 ;   SFV ( -- )
                                    193 ;   set overflow flag 
                                    194 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002D69                        195     _HEADER SFV,3,"SFV"
      00ADE9 AD B7                    1         .word LINK 
                           002D6B     2         LINK=.
      00ADEB 03                       3         .byte 3  
      00ADEC 53 46 56                 4         .ascii "SFV"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 168.
Hexadecimal [24-Bits]



      00ADEF                          5         SFV:
      00ADEF CD AD 26         [ 4]  196     CALL FER 
      002D72                        197     _DOLIT 4 
      00ADF2 CD 84 F0         [ 4]    1     CALL DOLIT 
      00ADF5 00 04                    2     .word 4 
      00ADF7 CD 87 0B         [ 4]  198     CALL ORR 
      00ADFA CD AC F8         [ 4]  199     CALL FPSW 
      00ADFD CD 85 52         [ 4]  200     CALL STORE 
      00AE00 81               [ 4]  201     RET 
                                    202 
                                    203 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    204 ;  F>ME ( f# -- m e )
                                    205 ;  split float in mantissa/exponent 
                                    206 ;  m mantissa as a double 
                                    207 ;  e exponent as a single 
                                    208 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002D81                        209     _HEADER ATEXP,4,"F>ME"             
      00AE01 AD EB                    1         .word LINK 
                           002D83     2         LINK=.
      00AE03 04                       3         .byte 4  
      00AE04 46 3E 4D 45              4         .ascii "F>ME"
      00AE08                          5         ATEXP:
      00AE08 CD AD 0A         [ 4]  210     CALL FRESET
      00AE0B CD AD BB         [ 4]  211     CALL SFN
      00AE0E CD AD 84         [ 4]  212     CALL SFZ 
      00AE11 90 93            [ 1]  213     LDW Y,X 
      00AE13 90 FE            [ 2]  214     LDW Y,(Y)
      00AE15 90 89            [ 2]  215     PUSHW Y 
      00AE17 4F               [ 1]  216     CLR A  
      00AE18 90 5E            [ 1]  217     SWAPW Y 
      00AE1A 2A 01            [ 1]  218     JRPL ATEXP1 
      00AE1C 43               [ 1]  219     CPL A 
      00AE1D                        220 ATEXP1: ; sign extend mantissa 
      00AE1D 90 5E            [ 1]  221     SWAPW Y 
      00AE1F 90 95            [ 1]  222     LD YH,A 
      00AE21 FF               [ 2]  223     LDW (X),Y 
      00AE22 1D 00 02         [ 2]  224     SUBW X,#CELLL 
      00AE25 90 85            [ 2]  225     POPW Y 
      00AE27 4F               [ 1]  226     CLR A 
      00AE28 90 5D            [ 2]  227     TNZW Y 
      00AE2A 2A 01            [ 1]  228     JRPL ATEXP2 
      00AE2C 43               [ 1]  229     CPL A 
      00AE2D                        230 ATEXP2:
      00AE2D 90 5E            [ 1]  231     SWAPW Y 
      00AE2F 90 95            [ 1]  232     LD YH,A 
      00AE31 FF               [ 2]  233     LDW (X),Y 
      00AE32 81               [ 4]  234     RET 
                                    235 
                                    236 
                                    237 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    238 ;    ME>F ( m e -- f# )
                                    239 ;    built float from mantissa/exponent 
                                    240 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002DB3                        241     _HEADER STEXP,4,"ME>F"
      00AE33 AE 03                    1         .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 169.
Hexadecimal [24-Bits]



                           002DB5     2         LINK=.
      00AE35 04                       3         .byte 4  
      00AE36 4D 45 3E 46              4         .ascii "ME>F"
      00AE3A                          5         STEXP:
      00AE3A CD 86 9A         [ 4]  242     CALL DUPP 
      00AE3D CD 89 6D         [ 4]  243     CALL ABSS 
      002DC0                        244     _DOLIT 127 
      00AE40 CD 84 F0         [ 4]    1     CALL DOLIT 
      00AE43 00 7F                    2     .word 127 
      00AE45 CD 89 D4         [ 4]  245     CALL GREAT
      002DC8                        246     _QBRAN STEXP1
      00AE48 CD 85 19         [ 4]    1     CALL QBRAN
      00AE4B AE 50                    2     .word STEXP1
      00AE4D CD AD EF         [ 4]  247     CALL SFV
      00AE50                        248 STEXP1:
      00AE50 90 93            [ 1]  249     LDW Y,X 
      00AE52 90 FE            [ 2]  250     LDW Y,(Y)
      00AE54 4F               [ 1]  251     CLR A 
      00AE55 90 95            [ 1]  252     LD YH,A
      00AE57 90 5E            [ 1]  253     SWAPW Y 
      00AE59 90 89            [ 2]  254     PUSHW Y  ; e >r 
      00AE5B 1C 00 02         [ 2]  255     ADDW X,#CELLL 
      00AE5E CD 88 A8         [ 4]  256     CALL DDUP 
      00AE61 CD A7 40         [ 4]  257     CALL DABS
      00AE64 CD 86 AA         [ 4]  258     CALL SWAPP 
      002DE7                        259     _DROP  
      00AE67 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      002DEA                        260     _DOLIT 127 
      00AE6A CD 84 F0         [ 4]    1     CALL DOLIT 
      00AE6D 00 7F                    2     .word 127 
      00AE6F CD 89 D4         [ 4]  261     CALL GREAT 
      002DF2                        262     _QBRAN STEXP2 
      00AE72 CD 85 19         [ 4]    1     CALL QBRAN
      00AE75 AE 7A                    2     .word STEXP2
      00AE77 CD AD EF         [ 4]  263     CALL SFV 
      00AE7A                        264 STEXP2: 
      00AE7A 4F               [ 1]  265     CLR A 
      00AE7B F7               [ 1]  266     LD (X),A     
      00AE7C CD 85 B5         [ 4]  267     CALL RFROM 
      00AE7F CD 87 0B         [ 4]  268     CALL ORR
      00AE82 CD AD 84         [ 4]  269     CALL SFZ 
      00AE85 CD AD BB         [ 4]  270     CALL SFN 
      00AE88 81               [ 4]  271     RET 
                                    272 
                                    273 
                                    274 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    275 ;   E. ( f# -- )
                                    276 ;   print float in scientific 
                                    277 ;   format 
                                    278 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002E09                        279     _HEADER EDOT,2,"E."
      00AE89 AE 35                    1         .word LINK 
                           002E0B     2         LINK=.
      00AE8B 02                       3         .byte 2  
      00AE8C 45 2E                    4         .ascii "E."
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 170.
Hexadecimal [24-Bits]



      00AE8E                          5         EDOT:
      00AE8E CD 87 60         [ 4]  280     CALL BASE 
      00AE91 CD 85 64         [ 4]  281     CALL AT 
      00AE94 CD 86 63         [ 4]  282     CALL TOR 
      002E17                        283     _DOLIT 10 
      00AE97 CD 84 F0         [ 4]    1     CALL DOLIT 
      00AE9A 00 0A                    2     .word 10 
      00AE9C CD 87 60         [ 4]  284     CALL BASE 
      00AE9F CD 85 52         [ 4]  285     CALL STORE 
      00AEA2 CD AE 08         [ 4]  286     CALL ATEXP ; m e 
      00AEA5                        287 EDOT0:
      00AEA5 CD 86 63         [ 4]  288     CALL TOR   
      00AEA8 CD A7 40         [ 4]  289     CALL DABS 
      00AEAB CD 8F D3         [ 4]  290     CALL SPACE 
      00AEAE CD 8E 97         [ 4]  291     CALL BDIGS     
      00AEB1                        292 EDOT2: 
      00AEB1 CD A7 AC         [ 4]  293     CALL DDIG
      00AEB4 CD 85 B5         [ 4]  294     CALL RFROM 
      00AEB7 CD 8C 23         [ 4]  295     CALL ONEP 
      00AEBA CD 86 63         [ 4]  296     CALL TOR 
      00AEBD CD 86 9A         [ 4]  297     CALL DUPP
      002E40                        298     _QBRAN EDOT3 
      00AEC0 CD 85 19         [ 4]    1     CALL QBRAN
      00AEC3 AE C7                    2     .word EDOT3
      00AEC5 20 EA            [ 2]  299     JRA EDOT2  
      00AEC7                        300 EDOT3:
      00AEC7 CD 86 C2         [ 4]  301     CALL OVER 
      00AECA CD 87 60         [ 4]  302     CALL BASE 
      00AECD CD 85 64         [ 4]  303     CALL AT 
      00AED0 CD 89 91         [ 4]  304     CALL ULESS 
      002E53                        305     _QBRAN EDOT2 
      00AED3 CD 85 19         [ 4]    1     CALL QBRAN
      00AED6 AE B1                    2     .word EDOT2
      002E58                        306     _DOLIT '.'
      00AED8 CD 84 F0         [ 4]    1     CALL DOLIT 
      00AEDB 00 2E                    2     .word '.' 
      00AEDD CD 8E A7         [ 4]  307     CALL HOLD  
      00AEE0 CD A7 AC         [ 4]  308     CALL DDIG
      00AEE3 CD AD 49         [ 4]  309     CALL FNE 
      002E66                        310     _QBRAN EDOT4 
      00AEE6 CD 85 19         [ 4]    1     CALL QBRAN
      00AEE9 AE F3                    2     .word EDOT4
      002E6B                        311     _DOLIT '-'
      00AEEB CD 84 F0         [ 4]    1     CALL DOLIT 
      00AEEE 00 2D                    2     .word '-' 
      00AEF0 CD 8E A7         [ 4]  312     CALL HOLD 
      00AEF3                        313 EDOT4:       
      002E73                        314     _DROP 
      00AEF3 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00AEF6 CD 8E FC         [ 4]  315     CALL EDIGS 
      00AEF9 CD 8F FD         [ 4]  316     CALL TYPES
      00AEFC CD 85 B5         [ 4]  317     CALL RFROM 
      00AEFF CD 88 4D         [ 4]  318     CALL QDUP 
      002E82                        319     _QBRAN EDOT5     
      00AF02 CD 85 19         [ 4]    1     CALL QBRAN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 171.
Hexadecimal [24-Bits]



      00AF05 AF 12                    2     .word EDOT5
      002E87                        320     _DOLIT 'E'
      00AF07 CD 84 F0         [ 4]    1     CALL DOLIT 
      00AF0A 00 45                    2     .word 'E' 
      00AF0C CD 84 B7         [ 4]  321     CALL EMIT 
      00AF0F CD 90 BC         [ 4]  322     CALL DOT
      00AF12                        323 EDOT5: 
      00AF12 CD 85 B5         [ 4]  324     CALL RFROM 
      00AF15 CD 87 60         [ 4]  325     CALL BASE 
      00AF18 CD 85 52         [ 4]  326     CALL STORE  
      00AF1B 81               [ 4]  327     RET 
                                    328 
                                    329 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                    330 ;   F. (f# -- )
                                    331 ;   print float in fixed
                                    332 ;   point format. 
                                    333 ;;;;;;;;;;;;;;;;;;;;;;;;;
      002E9C                        334     _HEADER FDOT,2,"F."
      00AF1C AE 8B                    1         .word LINK 
                           002E9E     2         LINK=.
      00AF1E 02                       3         .byte 2  
      00AF1F 46 2E                    4         .ascii "F."
      00AF21                          5         FDOT:
      00AF21 CD 87 60         [ 4]  335     CALL BASE 
      00AF24 CD 85 64         [ 4]  336     CALL AT 
      00AF27 CD 86 63         [ 4]  337     CALL TOR 
      002EAA                        338     _DOLIT 10 
      00AF2A CD 84 F0         [ 4]    1     CALL DOLIT 
      00AF2D 00 0A                    2     .word 10 
      00AF2F CD 87 60         [ 4]  339     CALL BASE 
      00AF32 CD 85 52         [ 4]  340     CALL STORE 
      00AF35 CD AE 08         [ 4]  341     CALL    ATEXP
      00AF38 CD 86 9A         [ 4]  342     CALL    DUPP  
      00AF3B CD 89 6D         [ 4]  343     CALL    ABSS 
      002EBE                        344     _DOLIT  8
      00AF3E CD 84 F0         [ 4]    1     CALL DOLIT 
      00AF41 00 08                    2     .word 8 
      00AF43 CD 89 D4         [ 4]  345     CALL    GREAT 
      002EC6                        346     _QBRAN  FDOT1 
      00AF46 CD 85 19         [ 4]    1     CALL QBRAN
      00AF49 AF 4E                    2     .word FDOT1
      00AF4B CC AE A5         [ 2]  347     JP      EDOT0 
      00AF4E                        348 FDOT1:
      00AF4E CD 8F D3         [ 4]  349     CALL    SPACE 
      00AF51 CD 86 63         [ 4]  350     CALL    TOR 
      00AF54 CD AD 49         [ 4]  351     CALL    FNE 
      002ED7                        352     _QBRAN  FDOT0 
      00AF57 CD 85 19         [ 4]    1     CALL QBRAN
      00AF5A AF 5F                    2     .word FDOT0
      00AF5C CD 89 19         [ 4]  353     CALL    DNEGA 
      00AF5F                        354 FDOT0: 
      00AF5F CD 8E 97         [ 4]  355     CALL    BDIGS
      00AF62 CD 85 C6         [ 4]  356     CALL    RAT  
      00AF65 CD 86 D1         [ 4]  357     CALL    ZLESS 
      002EE8                        358     _QBRAN  FDOT6 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 172.
Hexadecimal [24-Bits]



      00AF68 CD 85 19         [ 4]    1     CALL QBRAN
      00AF6B AF 90                    2     .word FDOT6
      00AF6D                        359 FDOT2: ; e<0 
      00AF6D CD A7 AC         [ 4]  360     CALL    DDIG 
      00AF70 CD 85 B5         [ 4]  361     CALL    RFROM
      00AF73 CD 8C 23         [ 4]  362     CALL    ONEP 
      00AF76 CD 88 4D         [ 4]  363     CALL    QDUP 
      002EF9                        364     _QBRAN  FDOT3 
      00AF79 CD 85 19         [ 4]    1     CALL QBRAN
      00AF7C AF 83                    2     .word FDOT3
      00AF7E CD 86 63         [ 4]  365     CALL    TOR 
      00AF81 20 EA            [ 2]  366     JRA   FDOT2 
      00AF83                        367 FDOT3:
      002F03                        368     _DOLIT  '.' 
      00AF83 CD 84 F0         [ 4]    1     CALL DOLIT 
      00AF86 00 2E                    2     .word '.' 
      00AF88 CD 8E A7         [ 4]  369     CALL    HOLD 
      00AF8B CD A7 C4         [ 4]  370     CALL    DDIGS
      00AF8E 20 12            [ 2]  371     JRA   FDOT9  
      00AF90                        372 FDOT6: ; e>=0 
      00AF90 20 08            [ 2]  373     JRA   FDOT8
      00AF92                        374 FDOT7:     
      002F12                        375     _DOLIT  '0'
      00AF92 CD 84 F0         [ 4]    1     CALL DOLIT 
      00AF95 00 30                    2     .word '0' 
      00AF97 CD 8E A7         [ 4]  376     CALL    HOLD 
      00AF9A                        377 FDOT8:
      00AF9A CD 85 04         [ 4]  378     CALL    DONXT 
      00AF9D AF 92                  379     .word   FDOT7
      00AF9F CD A7 C4         [ 4]  380     CALL    DDIGS 
      00AFA2                        381 FDOT9:
      00AFA2 CD AD 49         [ 4]  382     CALL    FNE 
      002F25                        383     _QBRAN  FDOT10 
      00AFA5 CD 85 19         [ 4]    1     CALL QBRAN
      00AFA8 AF B2                    2     .word FDOT10
      002F2A                        384     _DOLIT '-' 
      00AFAA CD 84 F0         [ 4]    1     CALL DOLIT 
      00AFAD 00 2D                    2     .word '-' 
      00AFAF CD 8E A7         [ 4]  385     CALL   HOLD 
      00AFB2                        386 FDOT10:
      00AFB2 CD 8E FC         [ 4]  387     CALL    EDIGS 
      00AFB5 CD 8F FD         [ 4]  388     CALL    TYPES 
      00AFB8 CD 85 B5         [ 4]  389     CALL    RFROM 
      00AFBB CD 87 60         [ 4]  390     CALL    BASE 
      00AFBE CD 85 52         [ 4]  391     CALL    STORE 
      00AFC1 81               [ 4]  392     RET 
                                    393 
                                    394 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    395 ; return parsed exponent or 
                                    396 ; 0 if failed
                                    397 ; at entry exprect *a=='E'    
                                    398 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00AFC2                        399 parse_exponent: ; a cntr -- e -1 | 0 
      00AFC2 CD 86 63         [ 4]  400     CALL TOR   ; R: cntr 
      00AFC5 CD 86 9A         [ 4]  401     CALL DUPP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 173.
Hexadecimal [24-Bits]



      00AFC8 CD 85 82         [ 4]  402     CALL CAT 
      002F4B                        403     _DOLIT 'E' 
      00AFCB CD 84 F0         [ 4]    1     CALL DOLIT 
      00AFCE 00 45                    2     .word 'E' 
      00AFD0 CD 89 7B         [ 4]  404     CALL EQUAL 
      002F53                        405     _QBRAN 1$
      00AFD3 CD 85 19         [ 4]    1     CALL QBRAN
      00AFD6 B0 03                    2     .word 1$
      00AFD8 CD 8C 23         [ 4]  406     CALL ONEP 
      00AFDB CD 85 B5         [ 4]  407     CALL RFROM  ; a cntr 
      00AFDE CD 8C 30         [ 4]  408     CALL ONEM
      00AFE1 CD 86 9A         [ 4]  409     CALL DUPP 
      002F64                        410     _QBRAN 2$ ; a cntr 
      00AFE4 CD 85 19         [ 4]    1     CALL QBRAN
      00AFE7 B0 06                    2     .word 2$
      00AFE9 CD 8C 8F         [ 4]  411     CALL ZERO
      00AFEC CD 86 9A         [ 4]  412     CALL DUPP 
      00AFEF CD A8 59         [ 4]  413     CALL DSWAP ; 0 0 a cntr  
      00AFF2 CD A5 E8         [ 4]  414     CALL nsign 
      00AFF5 CD 86 63         [ 4]  415     CALL TOR   ; R: esign  
      00AFF8 CD A6 15         [ 4]  416     CALL parse_digits
      002F7B                        417     _QBRAN PARSEXP_SUCCESS ; parsed to end of string 
      00AFFB CD 85 19         [ 4]    1     CALL QBRAN
      00AFFE B0 0D                    2     .word PARSEXP_SUCCESS
                                    418 ; failed invalid character
      002F80                        419     _DDROP ; 0 a 
      00B000 1C 00 04         [ 2]    1    ADDW X,#2*CELLL 
      00B003                        420 1$: 
      00B003 CD 85 B5         [ 4]  421     CALL RFROM ; sign||cntr  
      00B006                        422 2$:
      002F86                        423     _DDROP  ; a cntr || a sign || 0 cntr   
      00B006 1C 00 04         [ 2]    1    ADDW X,#2*CELLL 
      00B009 CD 8C 8F         [ 4]  424     CALL ZERO   ; return only 0 
      00B00C 81               [ 4]  425     RET 
      00B00D                        426 PARSEXP_SUCCESS: 
      002F8D                        427     _DDROP ; drop dhi a 
      00B00D 1C 00 04         [ 2]    1    ADDW X,#2*CELLL 
      00B010 CD 85 B5         [ 4]  428     CALL RFROM ; es 
      002F93                        429     _QBRAN 1$
      00B013 CD 85 19         [ 4]    1     CALL QBRAN
      00B016 B0 1B                    2     .word 1$
      00B018 CD 89 07         [ 4]  430     CALL NEGAT
      00B01B                        431 1$:
      002F9B                        432     _DOLIT -1 ; -- e -1 
      00B01B CD 84 F0         [ 4]    1     CALL DOLIT 
      00B01E FF FF                    2     .word -1 
      00B020 81               [ 4]  433     RET 
                                    434 
                                    435 
                                    436 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    437 ;   FLOAT?  ( a dlo dhi a+ cntr sign d? -- f -3 | a 0 )
                                    438 ;   called by NUMBER? 
                                    439 ;   convert string to float 
                                    440 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002FA1                        441     _HEADER FLOATQ,5,"FLOAT?"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 174.
Hexadecimal [24-Bits]



      00B021 AF 1E                    1         .word LINK 
                           002FA3     2         LINK=.
      00B023 05                       3         .byte 5  
      00B024 46 4C 4F 41 54 3F        4         .ascii "FLOAT?"
      00B02A                          5         FLOATQ:
      002FAA                        442     _QBRAN FLOATQ0 
      00B02A CD 85 19         [ 4]    1     CALL QBRAN
      00B02D B0 32                    2     .word FLOATQ0
      00B02F CC B0 D1         [ 2]  443     JP FLOAT_ERROR  ; not a float, string start with '#'
      00B032                        444 FLOATQ0:
                                    445 ; BASE must be 10 
      00B032 CD 87 60         [ 4]  446     CALL BASE 
      00B035 CD 85 64         [ 4]  447     CALL AT 
      002FB8                        448     _DOLIT 10 
      00B038 CD 84 F0         [ 4]    1     CALL DOLIT 
      00B03B 00 0A                    2     .word 10 
      00B03D CD 89 7B         [ 4]  449     CALL EQUAL 
      002FC0                        450     _QBRAN FLOAT_ERROR 
      00B040 CD 85 19         [ 4]    1     CALL QBRAN
      00B043 B0 D1                    2     .word FLOAT_ERROR
                                    451 ; if float next char is '.' or 'E' 
      00B045 CD 86 63         [ 4]  452     CALL TOR ; R: sign  
      00B048 CD 86 63         [ 4]  453     CALL TOR ; R: sign cntr 
      00B04B CD 86 9A         [ 4]  454     CALL DUPP
      00B04E CD 85 82         [ 4]  455     CALL CAT 
      002FD1                        456     _DOLIT '.' 
      00B051 CD 84 F0         [ 4]    1     CALL DOLIT 
      00B054 00 2E                    2     .word '.' 
      00B056 CD 89 7B         [ 4]  457     CALL EQUAL 
      002FD9                        458     _QBRAN FLOATQ1 ; not a dot 
      00B059 CD 85 19         [ 4]    1     CALL QBRAN
      00B05C B0 91                    2     .word FLOATQ1
      00B05E CD 8C 23         [ 4]  459     CALL ONEP 
      00B061 CD 85 B5         [ 4]  460     CALL RFROM  ; dlo dhi a cntr R: sign  
      00B064 CD 8C 30         [ 4]  461     CALL ONEM 
      00B067 CD 86 9A         [ 4]  462     CALL DUPP 
      00B06A CD 86 63         [ 4]  463     CALL TOR  ; R: sign cntr 
                                    464 ; parse fractional part
      00B06D CD A6 15         [ 4]  465     CALL parse_digits ; dlo dhi a cntr -- dm a cntr 
      00B070 CD 86 9A         [ 4]  466     CALL DUPP 
      00B073 CD 85 B5         [ 4]  467     CALL RFROM 
      00B076 CD 86 AA         [ 4]  468     CALL SWAPP 
      00B079 CD 89 53         [ 4]  469     CALL SUBB ; fd -> fraction digits count 
      00B07C CD 86 63         [ 4]  470     CALL TOR  ; dlo dhi a cntr R: sign fd 
      00B07F CD 86 9A         [ 4]  471     CALL DUPP ; cntr cntr  
      003002                        472     _QBRAN 1$ ; end of string, no exponent
      00B082 CD 85 19         [ 4]    1     CALL QBRAN
      00B085 B0 89                    2     .word 1$
      00B087 20 11            [ 2]  473     JRA FLOATQ2
      00B089 CD 86 AA         [ 4]  474 1$: CALL SWAPP 
      00300C                        475     _DROP ; a
      00B08C 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00B08F 20 11            [ 2]  476     JRA FLOATQ3        
      00B091                        477 FLOATQ1: ; must push fd==0 on RSTACK 
      00B091 CD 85 B5         [ 4]  478     CALL RFROM ; cntr 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 175.
Hexadecimal [24-Bits]



      00B094 CD 8C 8F         [ 4]  479     CALL ZERO  ; fd 
      00B097 CD 86 63         [ 4]  480     CALL TOR   ; dm a cntr R: sign fd 
      00B09A                        481 FLOATQ2: 
      00B09A CD AF C2         [ 4]  482     CALL parse_exponent 
      00301D                        483     _QBRAN FLOAT_ERROR0 ; exponent expected 
      00B09D CD 85 19         [ 4]    1     CALL QBRAN
      00B0A0 B0 CE                    2     .word FLOAT_ERROR0
      00B0A2                        484 FLOATQ3: ; dm 0 || dm e  
      00B0A2 CD 85 B5         [ 4]  485     CALL RFROM ;  fd  
      00B0A5 CD 89 53         [ 4]  486     CALL SUBB  ; exp=e-fd 
      00B0A8 CD 88 7D         [ 4]  487     CALL NROT 
      00B0AB CD 85 B5         [ 4]  488     CALL RFROM  ; sign 
      00302E                        489     _QBRAN FLOATQ4 
      00B0AE CD 85 19         [ 4]    1     CALL QBRAN
      00B0B1 B0 B6                    2     .word FLOATQ4
      00B0B3 CD 89 19         [ 4]  490     CALL DNEGA 
      00B0B6                        491 FLOATQ4:
      00B0B6 CD 88 5E         [ 4]  492     CALL ROT 
      00B0B9 CD AE 3A         [ 4]  493     CALL STEXP 
      00B0BC CD 88 5E         [ 4]  494     CALL ROT 
      00303F                        495     _DROP 
      00B0BF 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00B0C2 CD AD BB         [ 4]  496     CALL SFN 
      00B0C5 CD AD 84         [ 4]  497     CALL SFZ 
      003048                        498     _DOLIT -3 
      00B0C8 CD 84 F0         [ 4]    1     CALL DOLIT 
      00B0CB FF FD                    2     .word -3 
      00B0CD 81               [ 4]  499     RET       
      00B0CE                        500 FLOAT_ERROR0: 
      00B0CE CD A9 C6         [ 4]  501     CALL DRFROM ; sign df      
      00B0D1                        502 FLOAT_ERROR: 
      00B0D1 CD 8C D1         [ 4]  503     CALL DEPTH 
      00B0D4 CD 8C 16         [ 4]  504     CALL CELLS 
      00B0D7 CD 86 7A         [ 4]  505     CALL SPAT 
      00B0DA CD 86 AA         [ 4]  506     CALL SWAPP 
      00B0DD CD 88 BD         [ 4]  507     CALL PLUS  
      00B0E0 CD 86 87         [ 4]  508     CALL SPSTO 
      00B0E3 CD 8C 8F         [ 4]  509     CALL ZERO 
      00B0E6 81               [ 4]  510     RET 
                                    511 
                                    512 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    513 ;  LSCALE ( f# -- f# )
                                    514 ;  m *=10 , e -= 1
                                    515 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      003067                        516     _HEADER LSCALE,6,"LSCALE"
      00B0E7 B0 23                    1         .word LINK 
                           003069     2         LINK=.
      00B0E9 06                       3         .byte 6  
      00B0EA 4C 53 43 41 4C 45        4         .ascii "LSCALE"
      00B0F0                          5         LSCALE:
      00B0F0 CD AE 08         [ 4]  517     CALL ATEXP 
      00B0F3 CD 8C 9A         [ 4]  518     CALL ONE 
      00B0F6 CD 89 53         [ 4]  519     CALL SUBB 
      00B0F9 CD 86 63         [ 4]  520     CALL TOR
      00307C                        521     _DOLIT 10 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 176.
Hexadecimal [24-Bits]



      00B0FC CD 84 F0         [ 4]    1     CALL DOLIT 
      00B0FF 00 0A                    2     .word 10 
      00B101 CD A8 33         [ 4]  522     CALL DSSTAR
      00B104 CD 85 B5         [ 4]  523     CALL RFROM 
      00B107 CD AE 3A         [ 4]  524     CALL STEXP 
      00B10A 81               [ 4]  525     RET  
                                    526 
                                    527 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    528 ;  RSCALE ( f# -- f# )
                                    529 ;  m /=10 , e+=1 
                                    530 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00308B                        531     _HEADER RSCALE,6,"RSCALE"
      00B10B B0 E9                    1         .word LINK 
                           00308D     2         LINK=.
      00B10D 06                       3         .byte 6  
      00B10E 52 53 43 41 4C 45        4         .ascii "RSCALE"
      00B114                          5         RSCALE:
      00B114 CD AE 08         [ 4]  532     CALL ATEXP 
      00B117 CD 8C 9A         [ 4]  533     CALL ONE 
      00B11A CD 88 BD         [ 4]  534     CALL PLUS 
      00B11D CD 86 63         [ 4]  535     CALL TOR 
      0030A0                        536     _DOLIT 10 
      00B120 CD 84 F0         [ 4]    1     CALL DOLIT 
      00B123 00 0A                    2     .word 10 
      00B125 CD A7 6B         [ 4]  537     CALL DSLMOD 
      00B128 CD 88 5E         [ 4]  538     CALL ROT 
      0030AB                        539     _DROP 
      00B12B 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00B12E CD 85 B5         [ 4]  540     CALL RFROM 
      00B131 CD AE 3A         [ 4]  541     CALL STEXP 
      00B134 81               [ 4]  542     RET 
                                    543 
                                    544 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    545 ;  SCALEUP ( ud u1 u2 -- ud*10 u1 u2 )
                                    546 ;  while (ud<=0xcccccccc && u1<u2 ){
                                    547 ;        ud*10;
                                    548 ;        u2--;
                                    549 ;  }  
                                    550 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00B135                        551 SCALEUP:
      00B135 CD 88 A8         [ 4]  552     CALL DDUP
      00B138 CD 89 A7         [ 4]  553     CALL LESS  
      0030BB                        554     _QBRAN SCALEUP3
      00B13B CD 85 19         [ 4]    1     CALL QBRAN
      00B13E B1 6B                    2     .word SCALEUP3
      00B140 CD A9 A8         [ 4]  555     CALL DTOR   ; R: u1 u2  
      00B143 CD 88 A8         [ 4]  556     CALL DDUP 
      0030C6                        557     _DOLIT 0XCCCC 
      00B146 CD 84 F0         [ 4]    1     CALL DOLIT 
      00B149 CC CC                    2     .word 0XCCCC 
      0030CB                        558     _DOLIT 0XCCC 
      00B14B CD 84 F0         [ 4]    1     CALL DOLIT 
      00B14E 0C CC                    2     .word 0XCCC 
      00B150 CD A9 6B         [ 4]  559     CALL DGREAT  
      0030D3                        560     _TBRAN SCALEUP2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 177.
Hexadecimal [24-Bits]



      00B153 CD 85 27         [ 4]    1     CALL TBRAN 
      00B156 B1 68                    2     .word SCALEUP2 
      0030D8                        561     _DOLIT 10 
      00B158 CD 84 F0         [ 4]    1     CALL DOLIT 
      00B15B 00 0A                    2     .word 10 
      00B15D CD A8 12         [ 4]  562     CALL UDSSTAR 
      00B160 CD A9 C6         [ 4]  563     CALL DRFROM 
      00B163 CD 8C 30         [ 4]  564     CALL ONEM
      00B166 20 CD            [ 2]  565     JRA SCALEUP
      00B168                        566 SCALEUP2:
      00B168 CD A9 C6         [ 4]  567     CALL DRFROM
      00B16B                        568 SCALEUP3: 
      00B16B 81               [ 4]  569     RET 
                                    570 
                                    571 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    572 ; SCALEDOWN ( ud u1 u2 -- ud u1 u2 )
                                    573 ;  whhile (ud && u1>u2 ){ 
                                    574 ;     ud/10;
                                    575 ;     u2++;
                                    576 ;  } 
                                    577 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00B16C                        578 SCALEDOWN: 
      00B16C CD 88 A8         [ 4]  579     CALL DDUP 
      00B16F CD 89 D4         [ 4]  580     CALL GREAT 
      0030F2                        581     _QBRAN SCALDN3 
      00B172 CD 85 19         [ 4]    1     CALL QBRAN
      00B175 B1 9B                    2     .word SCALDN3
      00B177 CD A9 A8         [ 4]  582     CALL DTOR 
      00B17A CD 88 A8         [ 4]  583     CALL DDUP 
      00B17D CD A9 2E         [ 4]  584     CALL DZEQUAL 
      003100                        585     _TBRAN SCALDN2  
      00B180 CD 85 27         [ 4]    1     CALL TBRAN 
      00B183 B1 98                    2     .word SCALDN2 
      003105                        586     _DOLIT 10
      00B185 CD 84 F0         [ 4]    1     CALL DOLIT 
      00B188 00 0A                    2     .word 10 
      00B18A CD 8C 8F         [ 4]  587     CALL ZERO  
      00B18D CD AC 4C         [ 4]  588     CALL DSLASH 
      00B190 CD A9 C6         [ 4]  589     CALL DRFROM 
      00B193 CD 8C 23         [ 4]  590     CALL ONEP  
      00B196 20 D4            [ 2]  591     JRA SCALEDOWN 
      00B198                        592 SCALDN2:
      00B198 CD A9 C6         [ 4]  593     CALL DRFROM 
      00B19B                        594 SCALDN3:
      00B19B 81               [ 4]  595     RET 
                                    596 
                                    597 
                                    598 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    599 ;  F-ALIGN ( f#1 f#2 -- m1 m2 e )
                                    600 ;  align to same exponent 
                                    601 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00311C                        602     _HEADER FALIGN,7,"F-ALIGN"
      00B19C B1 0D                    1         .word LINK 
                           00311E     2         LINK=.
      00B19E 07                       3         .byte 7  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 178.
Hexadecimal [24-Bits]



      00B19F 46 2D 41 4C 49 47 4E     4         .ascii "F-ALIGN"
      00B1A6                          5         FALIGN:
      00B1A6 CD AE 08         [ 4]  603     CALL ATEXP 
      00B1A9 CD 86 63         [ 4]  604     CALL TOR 
      00B1AC CD A8 59         [ 4]  605     CALL DSWAP 
      00B1AF CD AE 08         [ 4]  606     CALL ATEXP 
      00B1B2 CD 86 63         [ 4]  607     CALL TOR    ; m2 m1 R: e2 e1 
      00B1B5 CD A8 59         [ 4]  608     CALL DSWAP 
      00B1B8 CD A9 DE         [ 4]  609     CALL DRAT 
      00B1BB CD 89 7B         [ 4]  610     CALL EQUAL 
      00313E                        611     _TBRAN FALGN8
      00B1BE CD 85 27         [ 4]    1     CALL TBRAN 
      00B1C1 B2 43                    2     .word FALGN8 
                                    612 ; scaleup the largest float 
                                    613 ; but limit mantissa <=0xccccccc
                                    614 ; to avoid mantissa overflow     
      00B1C3 CD A9 DE         [ 4]  615     CALL DRAT ; m1 m2 e2 e1 
      00B1C6 CD 89 D4         [ 4]  616     CALL GREAT 
      003149                        617     _QBRAN FALGN4 ; e2<e1 
      00B1C9 CD 85 19         [ 4]    1     CALL QBRAN
      00B1CC B1 DF                    2     .word FALGN4
                                    618 ; e2>e1 then scale up m2   
      00B1CE CD A9 C6         [ 4]  619     CALL DRFROM 
      00B1D1 CD 86 AA         [ 4]  620     CALL SWAPP 
      00B1D4 CD B1 35         [ 4]  621     CALL SCALEUP 
      00B1D7 CD 86 AA         [ 4]  622     CALL SWAPP 
      00B1DA CD A9 A8         [ 4]  623     CALL DTOR 
      00B1DD 20 0F            [ 2]  624     JRA FALGN6
      00B1DF                        625 FALGN4: ; e2<e1 then scaleup m1 
      00B1DF CD A8 59         [ 4]  626     CALL DSWAP 
      00B1E2 CD A9 C6         [ 4]  627     CALL DRFROM 
      00B1E5 CD B1 35         [ 4]  628     CALL SCALEUP 
      00B1E8 CD A9 A8         [ 4]  629     CALL DTOR
      00B1EB CD A8 59         [ 4]  630     CALL DSWAP 
                                    631 ; check again for e2==e1 
                                    632 ; if scaleup was not enough 
                                    633 ; to equalize exponent then
                                    634 ; scaledown smallest float     
      00B1EE                        635 FALGN6: 
      00B1EE CD A9 DE         [ 4]  636     CALL DRAT 
      00B1F1 CD 89 7B         [ 4]  637     CALL EQUAL 
      003174                        638     _TBRAN FALGN8 
      00B1F4 CD 85 27         [ 4]    1     CALL TBRAN 
      00B1F7 B2 43                    2     .word FALGN8 
                                    639 ; e2!=e1 need to scale down smallest 
      00B1F9 CD A9 DE         [ 4]  640     CALL DRAT 
      00B1FC CD 89 D4         [ 4]  641     CALL GREAT 
      00317F                        642     _QBRAN FALGN7 ; e2<e1 
      00B1FF CD 85 19         [ 4]    1     CALL QBRAN
      00B202 B2 15                    2     .word FALGN7
                                    643 ; e2>e1 scaledown m1 
      00B204 CD A8 59         [ 4]  644     CALL DSWAP 
      00B207 CD A9 C6         [ 4]  645     CALL DRFROM 
      00B20A CD B1 6C         [ 4]  646     CALL SCALEDOWN
      00B20D CD 86 AA         [ 4]  647     CALL SWAPP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 179.
Hexadecimal [24-Bits]



      00B210 CD A9 A8         [ 4]  648     CALL DTOR 
      00B213 20 0F            [ 2]  649     JRA FALGN71  
      00B215                        650 FALGN7: ; e2<e1 scaledown m2 
      00B215 CD A9 C6         [ 4]  651     CALL DRFROM 
      00B218 CD 86 AA         [ 4]  652     CALL SWAPP 
      00B21B CD B1 6C         [ 4]  653     CALL SCALEDOWN 
      00B21E CD 86 AA         [ 4]  654     CALL SWAPP 
      00B221 CD A9 A8         [ 4]  655     CALL DTOR 
                                    656 ; after scaledown if e2!=e1 
                                    657 ; this imply that one of mantissa 
                                    658 ; as been nullified by scalling 
                                    659 ; hence keep largest exponent 
      00B224                        660 FALGN71:
      00B224 CD A9 DE         [ 4]  661     CALL DRAT 
      00B227 CD 89 7B         [ 4]  662     CALL EQUAL
      0031AA                        663     _TBRAN FALGN8 
      00B22A CD 85 27         [ 4]    1     CALL TBRAN 
      00B22D B2 43                    2     .word FALGN8 
      00B22F CD A9 C6         [ 4]  664     CALL DRFROM 
      00B232 CD 88 A8         [ 4]  665     CALL DDUP 
      00B235 CD 89 D4         [ 4]  666     CALL GREAT 
      0031B8                        667     _TBRAN FALGN72
      00B238 CD 85 27         [ 4]    1     CALL TBRAN 
      00B23B B2 40                    2     .word FALGN72 
      00B23D CD 86 AA         [ 4]  668     CALL SWAPP     
      00B240                        669 FALGN72:
      00B240 CD A9 A8         [ 4]  670     CALL DTOR  ; now smallest e is at rtop.
      00B243                        671 FALGN8:
      00B243 CD A9 C6         [ 4]  672     CALL DRFROM 
      0031C6                        673     _DROP 
      00B246 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00B249 81               [ 4]  674     RET 
                                    675 
                                    676 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    677 ;   F+ ( f#1 f#2 -- f#1+f#2 )
                                    678 ;   float addition 
                                    679 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0031CA                        680     _HEADER FPLUS,2,"F+"
      00B24A B1 9E                    1         .word LINK 
                           0031CC     2         LINK=.
      00B24C 02                       3         .byte 2  
      00B24D 46 2B                    4         .ascii "F+"
      00B24F                          5         FPLUS:
      00B24F CD B1 A6         [ 4]  681     CALL FALIGN 
      00B252 CD 86 63         [ 4]  682     CALL TOR 
      00B255 CD AC 5B         [ 4]  683     CALL DPLUS
      00B258 CD A7 51         [ 4]  684     CALL DSIGN 
      00B25B CD 86 63         [ 4]  685     CALL TOR 
      00B25E CD A7 40         [ 4]  686     CALL DABS 
      00B261 CD B2 C4         [ 4]  687     CALL SCALETOM
      00B264 CD 85 B5         [ 4]  688     CALL RFROM 
      0031E7                        689     _QBRAN FPLUS1 
      00B267 CD 85 19         [ 4]    1     CALL QBRAN
      00B26A B2 6F                    2     .word FPLUS1
      00B26C CD 89 19         [ 4]  690     CALL DNEGA  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 180.
Hexadecimal [24-Bits]



      00B26F                        691 FPLUS1: 
      00B26F CD 88 5E         [ 4]  692     CALL ROT   
      00B272 CD 85 B5         [ 4]  693     CALL RFROM
      00B275 CD 88 BD         [ 4]  694     CALL PLUS  
      00B278 CD AE 3A         [ 4]  695     CALL STEXP 
      00B27B 81               [ 4]  696     RET 
                                    697 
                                    698 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    699 ;  F- ( f#1 f#2 -- f#1-f#2 )
                                    700 ;  substraction 
                                    701 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0031FC                        702     _HEADER FSUB,2,"F-"
      00B27C B2 4C                    1         .word LINK 
                           0031FE     2         LINK=.
      00B27E 02                       3         .byte 2  
      00B27F 46 2D                    4         .ascii "F-"
      00B281                          5         FSUB:
      00B281 CD B1 A6         [ 4]  703     CALL FALIGN 
      00B284 CD 86 63         [ 4]  704     CALL TOR 
      00B287 CD AC 8D         [ 4]  705     CALL DSUB
      00B28A CD A7 51         [ 4]  706     CALL DSIGN 
      00B28D CD 86 63         [ 4]  707     CALL TOR 
      00B290 CD A7 40         [ 4]  708     CALL DABS 
      00B293 CD B2 C4         [ 4]  709     CALL SCALETOM 
      00B296 CD 85 B5         [ 4]  710     CALL RFROM 
      003219                        711     _QBRAN FSUB1 
      00B299 CD 85 19         [ 4]    1     CALL QBRAN
      00B29C B2 A1                    2     .word FSUB1
      00B29E CD 89 19         [ 4]  712     CALL DNEGA 
      00B2A1                        713 FSUB1:
      00B2A1 CD 88 5E         [ 4]  714     CALL ROT 
      00B2A4 CD 85 B5         [ 4]  715     CALL RFROM
      00B2A7 CD 88 BD         [ 4]  716     CALL PLUS  
      00B2AA CD AE 3A         [ 4]  717     CALL STEXP 
      00B2AD 81               [ 4]  718     RET 
                                    719 
                                    720 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    721 ; /mod10  ( m -- m/10 r )
                                    722 ; divide mantissa by 10 
                                    723 ; return quotient and remainder 
                                    724 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00B2AE                        725 UMOD10:
      00322E                        726     _DOLIT 10 
      00B2AE CD 84 F0         [ 4]    1     CALL DOLIT 
      00B2B1 00 0A                    2     .word 10 
      00B2B3 CD A7 6B         [ 4]  727     CALL DSLMOD
      00B2B6 CD 88 5E         [ 4]  728     CALL ROT  
      00B2B9 81               [ 4]  729     RET 
                                    730 
                                    731 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    732 ;   SCALE>M ( ud1 -- e ud2 )
                                    733 ;   scale down a double  
                                    734 ;   by repeated d/10
                                    735 ;   until ud<=MAX_MANTISSA   
                                    736 ;   e is log10 exponent of scaled down
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 181.
Hexadecimal [24-Bits]



                                    737 ;   ud2 is scaled down ud1 
                                    738 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00323A                        739     _HEADER SCALETOM,7,"SCALE>M"
      00B2BA B2 7E                    1         .word LINK 
                           00323C     2         LINK=.
      00B2BC 07                       3         .byte 7  
      00B2BD 53 43 41 4C 45 3E 4D     4         .ascii "SCALE>M"
      00B2C4                          5         SCALETOM:
      00B2C4 CD 8C 8F         [ 4]  740     CALL ZERO 
      00B2C7 CD 88 7D         [ 4]  741     CALL NROT 
      00B2CA                        742 SCAL1:
      00B2CA CD 86 9A         [ 4]  743     CALL DUPP 
      00324D                        744     _DOLIT 0X7F 
      00B2CD CD 84 F0         [ 4]    1     CALL DOLIT 
      00B2D0 00 7F                    2     .word 0X7F 
      00B2D2 CD 89 BE         [ 4]  745     CALL UGREAT 
      003255                        746     _QBRAN SCAL2  
      00B2D5 CD 85 19         [ 4]    1     CALL QBRAN
      00B2D8 B2 EB                    2     .word SCAL2
      00B2DA CD B2 AE         [ 4]  747     CALL UMOD10 
      00325D                        748     _DROP 
      00B2DD 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00B2E0 CD 88 5E         [ 4]  749     CALL ROT 
      00B2E3 CD 8C 23         [ 4]  750     CALL ONEP 
      00B2E6 CD 88 7D         [ 4]  751     CALL NROT  
      00B2E9 20 DF            [ 2]  752     JRA SCAL1 
      00B2EB                        753 SCAL2: 
      00B2EB 81               [ 4]  754     RET 
                                    755 
                                    756 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    757 ;  UDIV10 ( ut -- ut )
                                    758 ;  divide a 48 bits uint by 10 
                                    759 ;  used to scale down MM* 
                                    760 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00B2EC                        761 UDIV10:
      00B2EC 90 93            [ 1]  762     LDW Y,X 
      00B2EE 90 FE            [ 2]  763     LDW Y,(Y)
      00B2F0 A6 0A            [ 1]  764     LD A,#10 
      00B2F2 90 62            [ 2]  765     DIV Y,A 
      00B2F4 FF               [ 2]  766     LDW (X),Y 
      00B2F5 90 95            [ 1]  767     LD YH,A 
      00B2F7 E6 02            [ 1]  768     LD A,(2,X)
      00B2F9 90 97            [ 1]  769     LD YL,A 
      00B2FB A6 0A            [ 1]  770     LD A,#10 
      00B2FD 90 62            [ 2]  771     DIV Y,A 
      00B2FF 90 95            [ 1]  772     LD YH,A 
      00B301 90 9F            [ 1]  773     LD A,YL 
      00B303 E7 02            [ 1]  774     LD (2,X),A 
      00B305 E6 03            [ 1]  775     LD A,(3,X)
      00B307 90 97            [ 1]  776     LD YL,A 
      00B309 A6 0A            [ 1]  777     LD A,#10 
      00B30B 90 62            [ 2]  778     DIV Y,A 
      00B30D 90 95            [ 1]  779     LD YH,A 
      00B30F 90 9F            [ 1]  780     LD A,YL 
      00B311 E7 03            [ 1]  781     LD (3,X),A 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 182.
Hexadecimal [24-Bits]



      00B313 E6 04            [ 1]  782     LD A,(4,X)
      00B315 90 97            [ 1]  783     LD YL,A 
      00B317 A6 0A            [ 1]  784     LD A,#10 
      00B319 90 62            [ 2]  785     DIV Y,A 
      00B31B 90 95            [ 1]  786     LD YH,A 
      00B31D 90 9F            [ 1]  787     LD A,YL 
      00B31F E7 04            [ 1]  788     LD (4,X),A 
      00B321 E6 05            [ 1]  789     LD A,(5,X)
      00B323 90 97            [ 1]  790     LD YL,A 
      00B325 A6 0A            [ 1]  791     LD A,#10 
      00B327 90 62            [ 2]  792     DIV Y,A 
      00B329 90 9F            [ 1]  793     LD A,YL 
      00B32B E7 05            [ 1]  794     LD (5,X),A 
      00B32D 81               [ 4]  795     RET 
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
      0032AE                        806     _HEADER MMSTAR,3,"MM*"
      00B32E B2 BC                    1         .word LINK 
                           0032B0     2         LINK=.
      00B330 03                       3         .byte 3  
      00B331 4D 4D 2A                 4         .ascii "MM*"
      00B334                          5         MMSTAR:
      00B334 CD 88 A8         [ 4]  807     CALL DDUP
      00B337 CD A9 2E         [ 4]  808     CALL DZEQUAL
      0032BA                        809     _TBRAN MMSTA2
      00B33A CD 85 27         [ 4]    1     CALL TBRAN 
      00B33D B3 4A                    2     .word MMSTA2 
      00B33F                        810 MMSTA1:
      00B33F CD AA 6E         [ 4]  811     CALL DOVER 
      00B342 CD A9 2E         [ 4]  812     CALL DZEQUAL 
      0032C5                        813     _QBRAN MMSTA3 
      00B345 CD 85 19         [ 4]    1     CALL QBRAN
      00B348 B3 55                    2     .word MMSTA3
      00B34A                        814 MMSTA2: ; ( -- 0 0 0 )
      00B34A 1C 00 02         [ 2]  815     ADDW X,#2 
      00B34D 90 5F            [ 1]  816     CLRW Y 
      00B34F FF               [ 2]  817     LDW (X),Y 
      00B350 EF 02            [ 2]  818     LDW (2,X),Y
      00B352 EF 04            [ 2]  819     LDW (4,X),Y 
      00B354 81               [ 4]  820     RET 
      00B355                        821 MMSTA3:
      00B355 CD A7 51         [ 4]  822     CALL DSIGN 
      00B358 CD 86 63         [ 4]  823     CALL TOR    ; R: m2sign 
      00B35B CD A7 40         [ 4]  824     CALL DABS   ; m1 um2 
      00B35E CD A8 59         [ 4]  825     CALL DSWAP  ; um2 m1 
      00B361 CD A7 51         [ 4]  826     CALL DSIGN  ; um2 m1 m1sign 
      00B364 CD 85 B5         [ 4]  827     CALL RFROM 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 183.
Hexadecimal [24-Bits]



      00B367 CD 87 20         [ 4]  828     CALL XORR 
      00B36A CD 86 63         [ 4]  829     CALL TOR   ; R: product_sign 
      00B36D CD A7 40         [ 4]  830     CALL DABS  ; um2 um1  
      00B370 CD A9 A8         [ 4]  831     CALL DTOR  ; um2 
      00B373 CD 86 9A         [ 4]  832     CALL DUPP  ; um2 um2hi 
      00B376 CD 85 C6         [ 4]  833     CALL RAT   ; um2 um2hi um1hi
                                    834 ; first partial product  
                                    835 ; pd1=um2hi*um1hi 
      00B379 CD 8B A2         [ 4]  836     CALL STAR 
      00B37C CD 8C 8F         [ 4]  837     CALL ZERO 
      00B37F CD 86 AA         [ 4]  838     CALL SWAPP ; pd1<<16  
      00B382 CD A8 59         [ 4]  839     CALL DSWAP ; pd1 um2 
      00B385 CD 86 C2         [ 4]  840     CALL OVER  ; pd1 um2 um2lo 
      00B388 CD 85 B5         [ 4]  841     CALL RFROM ; pd1 um2 um2lo um1hi 
                                    842 ; pd2=um2lo*um1hi 
      00B38B CD 8B 58         [ 4]  843     CALL UMSTA ; pd1 um2 pd2 
      00B38E CD A8 59         [ 4]  844     CALL DSWAP ; pd1 pd2 um2 
      00B391 CD 85 C6         [ 4]  845     CALL RAT   ; pd1 pd2 um2 um1lo 
                                    846 ; pd3= um2hi*um1lo 
      00B394 CD 8B 58         [ 4]  847     CALL UMSTA ; pd1 pd2 um2lo pd3 
      00B397 CD 88 5E         [ 4]  848     CALL ROT ; pd1 pd2 pd3 um2lo 
      00B39A CD 86 63         [ 4]  849     CALL TOR ; pd1 pd2 pd3 R: psign um1lo um2lo 
                                    850 ; pd1+pd2+pd3  pd1
      00B39D CD AC 5B         [ 4]  851     CALL DPLUS 
      00B3A0 CD AC 5B         [ 4]  852     CALL DPLUS  
      00B3A3 CD A9 C6         [ 4]  853     CALL DRFROM ; triple um2lo um1lo 
                                    854 ; last partial product um2lo*um1lo 
      00B3A6 CD 8B 58         [ 4]  855     CALL UMSTA ; prod pd4 
                                    856 ; mm*=prod<<16+pd4  
      00B3A9 CD A9 A8         [ 4]  857     CALL DTOR ;   R: psign pd4lo pd4hi  
                                    858  ; add pd4hi to prodlo and propagate carry 
      00B3AC 90 93            [ 1]  859     LDW Y,X 
      00B3AE 90 EE 02         [ 2]  860     LDW Y,(2,Y)  ; prodlo 
      00B3B1 72 F9 01         [ 2]  861     ADDW Y,(1,SP)  ; prodlo+pd4hi 
      00B3B4 17 01            [ 2]  862     LDW (1,SP),Y    ; plo phi  
      00B3B6 90 93            [ 1]  863     LDW Y,X
      00B3B8 90 FE            [ 2]  864     LDW Y,(Y) ; prodhi  
      00B3BA 24 04            [ 1]  865     JRNC MMSTA4
      00B3BC 72 A9 00 01      [ 2]  866     ADDW Y,#1 ; add carry 
      00B3C0                        867 MMSTA4:     
      00B3C0 1D 00 02         [ 2]  868     SUBW X,#2 
      00B3C3 FF               [ 2]  869     LDW (X),Y 
      00B3C4 90 85            [ 2]  870     POPW Y 
      00B3C6 EF 02            [ 2]  871     LDW (2,X),Y 
      00B3C8 90 85            [ 2]  872     POPW Y 
      00B3CA EF 04            [ 2]  873     LDW (4,X),Y
      00B3CC CD 8C 8F         [ 4]  874     CALL ZERO 
      00B3CF CD 86 63         [ 4]  875     CALL TOR 
      00B3D2                        876 MMSTA5:
      00B3D2 CD 88 4D         [ 4]  877     CALL QDUP 
      003355                        878     _QBRAN MMSTA6 
      00B3D5 CD 85 19         [ 4]    1     CALL QBRAN
      00B3D8 B3 E8                    2     .word MMSTA6
      00B3DA CD B2 EC         [ 4]  879     CALL UDIV10 
      00B3DD CD 85 B5         [ 4]  880     CALL RFROM 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 184.
Hexadecimal [24-Bits]



      00B3E0 CD 8C 23         [ 4]  881     CALL ONEP 
      00B3E3 CD 86 63         [ 4]  882     CALL TOR 
      00B3E6 20 EA            [ 2]  883     JRA MMSTA5 
                                    884 ; now scale to double 
                                    885 ; scale further <= MAX_MANTISSA 
      00B3E8                        886 MMSTA6: 
      00B3E8 CD 85 B5         [ 4]  887     CALL RFROM 
      00B3EB CD 88 7D         [ 4]  888     CALL NROT 
      00B3EE CD B2 C4         [ 4]  889     CALL SCALETOM
      00B3F1 CD A9 A8         [ 4]  890     CALL DTOR 
      00B3F4 CD 88 BD         [ 4]  891     CALL PLUS 
      00B3F7 CD A9 C6         [ 4]  892     CALL DRFROM 
      00B3FA CD 85 B5         [ 4]  893     CALL RFROM
      00337D                        894     _QBRAN MMSTA7
      00B3FD CD 85 19         [ 4]    1     CALL QBRAN
      00B400 B4 05                    2     .word MMSTA7
      00B402 CD 89 19         [ 4]  895     CALL DNEGA
      00B405                        896 MMSTA7:
      00B405 CD 88 5E         [ 4]  897     CALL ROT ; m e 
      00B408 81               [ 4]  898     RET 
                                    899 
                                    900 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    901 ;    F* ( f#1 f#2 -- f#3 )
                                    902 ;    float product 
                                    903 ;    f#3=f#1 * f#2 
                                    904 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      003389                        905     _HEADER FSTAR,2,"F*"
      00B409 B3 30                    1         .word LINK 
                           00338B     2         LINK=.
      00B40B 02                       3         .byte 2  
      00B40C 46 2A                    4         .ascii "F*"
      00B40E                          5         FSTAR:
      00B40E CD AE 08         [ 4]  906     CALL ATEXP ; f#1 m2 e2 
      00B411 CD 86 63         [ 4]  907     CALL TOR   
      00B414 CD A8 59         [ 4]  908     CALL DSWAP ; m2 f#1
      00B417 CD AE 08         [ 4]  909     CALL ATEXP ; m2 m1 e1 
      00B41A CD 85 B5         [ 4]  910     CALL RFROM ; m2 m1 e1 e2 
      00B41D CD 88 BD         [ 4]  911     CALL PLUS  ; m2 m1 e 
      00B420 CD 86 63         [ 4]  912     CALL TOR   ; m2 m1 R: e 
      00B423 CD B3 34         [ 4]  913     CALL MMSTAR ; m2*m1 e   
      00B426 CD 85 B5         [ 4]  914     CALL RFROM 
      00B429 CD 88 BD         [ 4]  915     CALL PLUS 
      00B42C CD AE 3A         [ 4]  916     CALL STEXP ; f#3 
      00B42F 81               [ 4]  917     RET 
                                    918 
                                    919 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    920 ;  F/ ( f#1 f#2 -- f#3 )
                                    921 ;  float division
                                    922 ;  f#3 = f#1/f#2
                                    923 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0033B0                        924     _HEADER FSLASH,2,"F/"
      00B430 B4 0B                    1         .word LINK 
                           0033B2     2         LINK=.
      00B432 02                       3         .byte 2  
      00B433 46 2F                    4         .ascii "F/"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 185.
Hexadecimal [24-Bits]



      00B435                          5         FSLASH:
      00B435 CD AE 08         [ 4]  925     CALL ATEXP  ; f#1 m2 e2 
      00B438 CD 86 63         [ 4]  926     CALL TOR    ; f#1 m2   R: e2 
      00B43B CD A7 51         [ 4]  927     CALL DSIGN  ; f#1 m2 m2sign 
      00B43E CD 86 63         [ 4]  928     CALL TOR    ; F#1 m2 R: e2 m2s 
      00B441 CD A7 40         [ 4]  929     CALL DABS   ; F#1 um2 
      00B444 CD A8 59         [ 4]  930     CALL DSWAP  ; m2 f#1 
      00B447 CD AE 08         [ 4]  931     CALL ATEXP  ; m2 m1 e1 
      00B44A CD 8C 9A         [ 4]  932     CALL ONE    ; e2 slot on rstack  
      00B44D CD 86 20         [ 4]  933     CALL NRAT   ; m2 m1 e1 e2 
      00B450 CD 89 53         [ 4]  934     CALL SUBB   ; m2 m1 e 
      00B453 CD 8C 9A         [ 4]  935     CALL ONE    ; e slot on rstack 
      00B456 CD 86 3F         [ 4]  936     CALL NRSTO  ; m2 m1 R: e m2s 
      00B459 CD A7 51         [ 4]  937     CALL DSIGN  ; m2 m1 m1sign 
      00B45C CD 85 B5         [ 4]  938     CALL RFROM  ; m2 m1 m1s m2s  
      00B45F CD 87 20         [ 4]  939     CALL XORR   ; m2 m1 quot_sign R: e 
      00B462 CD 85 B5         [ 4]  940     CALL RFROM   
      00B465 CD A9 A8         [ 4]  941     CALL DTOR   ; m2 m1 R: qs e  
      00B468 CD A7 40         [ 4]  942     CALL DABS   ; um2 um1 R: qs e  
      00B46B CD A8 59         [ 4]  943     CALL DSWAP  ; m1 m2 R: qs e
      00B46E CD 88 A8         [ 4]  944     CALL DDUP  ; m1 m2 m2 R: qs e
      00B471 CD A9 A8         [ 4]  945     CALL DTOR  ; m1 m2 R: qs e m2 ( keep divisor need later ) 
      00B474 CD AB 5F         [ 4]  946     CALL UDSLMOD ; remainder m1/m2 R: e m2 
      00B477                        947 FSLASH1: 
      00B477 CD AA 6E         [ 4]  948     CALL DOVER ; if remainder null done 
      00B47A CD A9 2E         [ 4]  949     CALL DZEQUAL 
      0033FD                        950     _TBRAN FSLASH8 
      00B47D CD 85 27         [ 4]    1     CALL TBRAN 
      00B480 B4 DA                    2     .word FSLASH8 
                                    951 ; get fractional digits from remainder until mantissa saturate
                                    952 ; remainder mantissa R: e divisor 
                                    953 ; check for mantissa saturation 
      00B482 CD 88 A8         [ 4]  954     CALL DDUP 
      003405                        955     _DOLIT 0XCCCC 
      00B485 CD 84 F0         [ 4]    1     CALL DOLIT 
      00B488 CC CC                    2     .word 0XCCCC 
      00340A                        956     _DOLIT 0xC
      00B48A CD 84 F0         [ 4]    1     CALL DOLIT 
      00B48D 00 0C                    2     .word 0xC 
      00B48F CD A9 6B         [ 4]  957     CALL DGREAT 
      003412                        958     _TBRAN FSLASH8 ; another loop would result in mantissa overflow 
      00B492 CD 85 27         [ 4]    1     CALL TBRAN 
      00B495 B4 DA                    2     .word FSLASH8 
                                    959 ; multiply mantissa by 10 
      003417                        960     _DOLIT 10 
      00B497 CD 84 F0         [ 4]    1     CALL DOLIT 
      00B49A 00 0A                    2     .word 10 
      00B49C CD 8C 8F         [ 4]  961     CALL ZERO 
      00B49F CD AB 16         [ 4]  962     CALL DSTAR 
                                    963 ; mutliply remainder by 10     
      00B4A2 CD A8 59         [ 4]  964     CALL DSWAP 
      003425                        965     _DOLIT 10 
      00B4A5 CD 84 F0         [ 4]    1     CALL DOLIT 
      00B4A8 00 0A                    2     .word 10 
      00B4AA CD 8C 8F         [ 4]  966     CALL ZERO 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 186.
Hexadecimal [24-Bits]



      00B4AD CD AB 16         [ 4]  967     CALL DSTAR 
                                    968 ; divide remainder by m2     
      00B4B0 CD A9 DE         [ 4]  969     CALL DRAT  ; mantissa remainder divisor R: e divisor 
      00B4B3 CD AB 5F         [ 4]  970     CALL UDSLMOD ; mantissa dr dq R: qs e divisor 
      00B4B6 CD A8 59         [ 4]  971     CALL DSWAP ; mantissa frac_digit remainder R: qs e divisor  
      00B4B9 CD A9 A8         [ 4]  972     CALL DTOR  ; mantissa frac_digit R: qs e divisor remainder 
      00B4BC CD AC 5B         [ 4]  973     CALL DPLUS ; mantissa+frac_digit 
      00B4BF CD A9 C6         [ 4]  974     CALL DRFROM ; mantissa remainder R: qs e divisor  
      00B4C2 CD A8 59         [ 4]  975     CALL DSWAP  ; remainder mantissa  
                                    976 ; increment e 
      003445                        977     _DOLIT 2    ; e slot on rstack 
      00B4C5 CD 84 F0         [ 4]    1     CALL DOLIT 
      00B4C8 00 02                    2     .word 2 
      00B4CA CD 86 20         [ 4]  978     CALL NRAT   ;  2 NR@ -- e 
      00B4CD CD 8C 23         [ 4]  979     CALL ONEP   ; increment exponent 
      003450                        980     _DOLIT 2 
      00B4D0 CD 84 F0         [ 4]    1     CALL DOLIT 
      00B4D3 00 02                    2     .word 2 
      00B4D5 CD 86 3F         [ 4]  981     CALL NRSTO  ; e 2 NR! , update e on rstack     
      00B4D8 20 9D            [ 2]  982     JRA FSLASH1
      00B4DA                        983 FSLASH8: ; remainder mantissa R: qs e divisor 
      00B4DA CD A8 59         [ 4]  984     CALL DSWAP  
      00345D                        985     _DDROP  ; drop remainder     
      00B4DD 1C 00 04         [ 2]    1    ADDW X,#2*CELLL 
      00B4E0 CD A9 C6         [ 4]  986     CALL DRFROM
      003463                        987     _DDROP  ; drop divisor 
      00B4E3 1C 00 04         [ 2]    1    ADDW X,#2*CELLL 
      00B4E6 CD 96 71         [ 4]  988     CALL JFETCH    ; quotient sign 
      003469                        989     _QBRAN FSLASH9 
      00B4E9 CD 85 19         [ 4]    1     CALL QBRAN
      00B4EC B4 F1                    2     .word FSLASH9
      00B4EE CD 89 19         [ 4]  990     CALL DNEGA  
      00B4F1                        991 FSLASH9:
      00B4F1 CD 85 B5         [ 4]  992     CALL RFROM  ; exponent 
      00B4F4 CD AE 3A         [ 4]  993     CALL STEXP 
      00B4F7 CD 85 B5         [ 4]  994     CALL RFROM 
      00347A                        995     _DROP ; drop qs 
      00B4FA 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00B4FD 81               [ 4]  996     RET 
                                    997 
                                    998 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    999 ;   D>F  ( # -- f# )
                                   1000 ;   convert double to float 
                                   1001 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00347E                       1002     _HEADER DTOF,3,"D>F"
      00B4FE B4 32                    1         .word LINK 
                           003480     2         LINK=.
      00B500 03                       3         .byte 3  
      00B501 44 3E 46                 4         .ascii "D>F"
      00B504                          5         DTOF:
      00B504 CD A7 51         [ 4] 1003     CALL DSIGN 
      00B507 CD 86 63         [ 4] 1004     CALL TOR
      00B50A CD A7 40         [ 4] 1005     CALL DABS  
      00B50D                       1006 DTOF1:      
      00B50D CD B2 C4         [ 4] 1007     CALL SCALETOM 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 187.
Hexadecimal [24-Bits]



      00B510 CD 85 B5         [ 4] 1008     CALL RFROM
      003493                       1009     _QBRAN DTOF2 
      00B513 CD 85 19         [ 4]    1     CALL QBRAN
      00B516 B5 1B                    2     .word DTOF2
      00B518 CD 89 19         [ 4] 1010     CALL DNEGA 
      00B51B                       1011 DTOF2: 
      00B51B CD 88 5E         [ 4] 1012     CALL ROT 
      00B51E CD AE 3A         [ 4] 1013     CALL STEXP 
      00B521 81               [ 4] 1014     RET 
                                   1015 
                                   1016 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1017 ;   F>D  ( f# -- # )
                                   1018 ;  convert float to double 
                                   1019 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0034A2                       1020     _HEADER FTOD,3,"F>D"
      00B522 B5 00                    1         .word LINK 
                           0034A4     2         LINK=.
      00B524 03                       3         .byte 3  
      00B525 46 3E 44                 4         .ascii "F>D"
      00B528                          5         FTOD:
      00B528 CD AE 08         [ 4] 1021     CALL ATEXP ; m e 
      00B52B CD 88 4D         [ 4] 1022     CALL QDUP
      0034AE                       1023     _QBRAN FTOD9
      00B52E CD 85 19         [ 4]    1     CALL QBRAN
      00B531 B5 B2                    2     .word FTOD9
      00B533 CD 86 63         [ 4] 1024     CALL TOR 
      00B536 CD A7 51         [ 4] 1025     CALL DSIGN 
      00B539 CD 88 7D         [ 4] 1026     CALL NROT 
      00B53C CD A7 40         [ 4] 1027     CALL DABS
      00B53F CD 85 B5         [ 4] 1028     CALL RFROM  
      00B542 CD 86 9A         [ 4] 1029     CALL DUPP   
      00B545 CD 86 D1         [ 4] 1030     CALL ZLESS 
      0034C8                       1031     _QBRAN FTOD4 
      00B548 CD 85 19         [ 4]    1     CALL QBRAN
      00B54B B5 7D                    2     .word FTOD4
                                   1032 ; negative exponent 
      00B54D CD 89 6D         [ 4] 1033     CALL ABSS 
      00B550 CD 86 63         [ 4] 1034     CALL TOR
      00B553 20 19            [ 2] 1035     JRA FTOD2  
      00B555                       1036 FTOD1:
      00B555 CD 88 A8         [ 4] 1037     CALL DDUP 
      00B558 CD A9 2E         [ 4] 1038     CALL DZEQUAL 
      0034DB                       1039     _TBRAN FTOD3 
      00B55B CD 85 27         [ 4]    1     CALL TBRAN 
      00B55E B5 75                    2     .word FTOD3 
      0034E0                       1040     _DOLIT 10 
      00B560 CD 84 F0         [ 4]    1     CALL DOLIT 
      00B563 00 0A                    2     .word 10 
      00B565 CD A7 6B         [ 4] 1041     CALL DSLMOD 
      00B568 CD 88 5E         [ 4] 1042     CALL ROT 
      0034EB                       1043     _DROP
      00B56B 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00B56E                       1044 FTOD2:      
      0034EE                       1045     _DONXT FTOD1
      00B56E CD 85 04         [ 4]    1     CALL DONXT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 188.
Hexadecimal [24-Bits]



      00B571 B5 55                    2     .word FTOD1 
      00B573 20 32            [ 2] 1046     JRA FTOD8   
      00B575                       1047 FTOD3: 
      00B575 CD 85 B5         [ 4] 1048     CALL RFROM 
      0034F8                       1049     _DROP 
      00B578 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00B57B 20 2A            [ 2] 1050     JRA FTOD8  
                                   1051 ; positive exponent 
      00B57D                       1052 FTOD4:
      00B57D CD 86 63         [ 4] 1053     CALL TOR 
      00B580 20 20            [ 2] 1054     JRA FTOD6
      00B582                       1055 FTOD5:
      00B582 CD 88 A8         [ 4] 1056     CALL DDUP 
      003505                       1057     _DOLIT 0XCCCC
      00B585 CD 84 F0         [ 4]    1     CALL DOLIT 
      00B588 CC CC                    2     .word 0XCCCC 
      00350A                       1058     _DOLIT 0XCCC  
      00B58A CD 84 F0         [ 4]    1     CALL DOLIT 
      00B58D 0C CC                    2     .word 0XCCC 
      00B58F CD A9 6B         [ 4] 1059     CALL DGREAT 
      003512                       1060     _TBRAN FTOD3 
      00B592 CD 85 27         [ 4]    1     CALL TBRAN 
      00B595 B5 75                    2     .word FTOD3 
      003517                       1061     _DOLIT 10 
      00B597 CD 84 F0         [ 4]    1     CALL DOLIT 
      00B59A 00 0A                    2     .word 10 
      00B59C CD 8C 8F         [ 4] 1062     CALL ZERO 
      00B59F CD AB 16         [ 4] 1063     CALL DSTAR 
      00B5A2                       1064 FTOD6: 
      003522                       1065     _DONXT FTOD5 
      00B5A2 CD 85 04         [ 4]    1     CALL DONXT 
      00B5A5 B5 82                    2     .word FTOD5 
      00B5A7                       1066 FTOD8:
      00B5A7 CD 88 5E         [ 4] 1067     CALL ROT 
      00352A                       1068     _QBRAN FTOD9 
      00B5AA CD 85 19         [ 4]    1     CALL QBRAN
      00B5AD B5 B2                    2     .word FTOD9
      00B5AF CD 89 19         [ 4] 1069     CALL DNEGA
      00B5B2                       1070 FTOD9:          
      00B5B2 81               [ 4] 1071     RET 
                                   1072 
                                   1073 
                                   1074 ;;;;;;;;;;;;;;;;;;;;;;;;
                                   1075 ;   F0< ( f# -- f )
                                   1076 ;   true if f#<0
                                   1077 ;;;;;;;;;;;;;;;;;;;;;;;;
      003533                       1078     _HEADER FZLESS,3,"F0<"
      00B5B3 B5 24                    1         .word LINK 
                           003535     2         LINK=.
      00B5B5 03                       3         .byte 3  
      00B5B6 46 30 3C                 4         .ascii "F0<"
      00B5B9                          5         FZLESS:
      00B5B9 CD AE 08         [ 4] 1079     CALL ATEXP 
      00353C                       1080     _DROP 
      00B5BC 1C 00 02         [ 2]    1     ADDW X,#CELLL  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 189.
Hexadecimal [24-Bits]



      00B5BF CD 86 AA         [ 4] 1081     CALL SWAPP 
      003542                       1082     _DROP 
      00B5C2 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00B5C5 CD 86 D1         [ 4] 1083     CALL ZLESS 
      00B5C8 81               [ 4] 1084     RET
                                   1085 
                                   1086 ;;;;;;;;;;;;;;;;;;;;;;;;
                                   1087 ;   F< ( f#1 f#2 -- f )
                                   1088 ; true if f#1 < f#1 
                                   1089 ;;;;;;;;;;;;;;;;;;;;;;;
      003549                       1090     _HEADER FLESS,2,"F<"
      00B5C9 B5 B5                    1         .word LINK 
                           00354B     2         LINK=.
      00B5CB 02                       3         .byte 2  
      00B5CC 46 3C                    4         .ascii "F<"
      00B5CE                          5         FLESS:
      00B5CE CD B2 81         [ 4] 1091     CALL FSUB  
      00B5D1 CC B5 B9         [ 2] 1092     JP FZLESS
                                   1093 
                                   1094 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1095 ;   F> ( f#1 f#2 -- f )
                                   1096 ;   true fi f#1>f#2
                                   1097 ;;;;;;;;;;;;;;;;;;;;;;;;;
      003554                       1098     _HEADER FGREAT,2,"F>"
      00B5D4 B5 CB                    1         .word LINK 
                           003556     2         LINK=.
      00B5D6 02                       3         .byte 2  
      00B5D7 46 3E                    4         .ascii "F>"
      00B5D9                          5         FGREAT:
      00B5D9 CD A8 59         [ 4] 1099     CALL DSWAP 
      00B5DC CC B5 CE         [ 2] 1100     JP FLESS 
                                   1101 
                                   1102 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1103 ;   F= ( f#1 f#2 -- f ) 
                                   1104 ;   true fi f#1==f#2 
                                   1105 ;;;;;;;;;;;;;;;;;;;;;;;;;
      00355F                       1106     _HEADER FEQUAL,2,"F="
      00B5DF B5 D6                    1         .word LINK 
                           003561     2         LINK=.
      00B5E1 02                       3         .byte 2  
      00B5E2 46 3D                    4         .ascii "F="
      00B5E4                          5         FEQUAL:
      00B5E4 CC A9 4A         [ 2] 1107     JP DEQUAL 
                                   1108 
                                   1109 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1110 ;   F0= ( f# -- f )
                                   1111 ;   true if f# is 0.0 
                                   1112 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      003567                       1113     _HEADER FZEQUAL,3,"F0="
      00B5E7 B5 E1                    1         .word LINK 
                           003569     2         LINK=.
      00B5E9 03                       3         .byte 3  
      00B5EA 46 30 3D                 4         .ascii "F0="
      00B5ED                          5         FZEQUAL:
      00B5ED CD AE 08         [ 4] 1114     CALL ATEXP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 190.
Hexadecimal [24-Bits]



      003570                       1115     _DROP 
      00B5F0 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00B5F3 CC A9 2E         [ 2] 1116     JP DZEQUAL  
                                   1117 
                                   1118 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1119 ;  FNEGATE ( f#1 -- f#2 )
                                   1120 ;  f#2 is negation of f#1 
                                   1121 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      003576                       1122     _HEADER FNEGA,7,"FNEGATE"
      00B5F6 B5 E9                    1         .word LINK 
                           003578     2         LINK=.
      00B5F8 07                       3         .byte 7  
      00B5F9 46 4E 45 47 41 54 45     4         .ascii "FNEGATE"
      00B600                          5         FNEGA:
      00B600 CD AE 08         [ 4] 1123     CALL ATEXP 
      00B603 CD 86 63         [ 4] 1124     CALL TOR 
      00B606 CD 89 19         [ 4] 1125     CALL DNEGA
      00B609 CD 85 B5         [ 4] 1126     CALL RFROM 
      00B60C CD AE 3A         [ 4] 1127     CALL STEXP 
      00B60F CD AD BB         [ 4] 1128     CALL SFN 
      00B612 81               [ 4] 1129     RET 
                                   1130 
                                   1131 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1132 ;  FABS ( f#1 -- abs(f#1) )
                                   1133 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      003593                       1134     _HEADER FABS,4,"FABS"
      00B613 B5 F8                    1         .word LINK 
                           003595     2         LINK=.
      00B615 04                       3         .byte 4  
      00B616 46 41 42 53              4         .ascii "FABS"
      00B61A                          5         FABS:
      00B61A CD AE 08         [ 4] 1135     CALL ATEXP 
      00B61D CD 86 63         [ 4] 1136     CALL TOR 
      00B620 CD 86 9A         [ 4] 1137     CALL DUPP 
      0035A3                       1138     _DOLIT 0X80 
      00B623 CD 84 F0         [ 4]    1     CALL DOLIT 
      00B626 00 80                    2     .word 0X80 
      00B628 CD 86 F7         [ 4] 1139     CALL ANDD 
      0035AB                       1140     _QBRAN FABS1
      00B62B CD 85 19         [ 4]    1     CALL QBRAN
      00B62E B6 33                    2     .word FABS1
      00B630 CD 89 19         [ 4] 1141     CALL DNEGA 
      00B633                       1142 FABS1: 
      00B633 CD 85 B5         [ 4] 1143     CALL RFROM 
      00B636 CD AE 3A         [ 4] 1144     CALL STEXP 
      00B639 CD AD BB         [ 4] 1145     CALL SFN 
      00B63C 81               [ 4] 1146     RET 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 191.
Hexadecimal [24-Bits]



                                   4657 .endif 
                                   4658 
                                   4659 ;===============================================================
                                   4660 
                           003595  4661 LASTN =	LINK   ;last name defined
                                   4662 
                                   4663 ; application code begin here
      00B680                       4664 	.bndry 128 ; align on flash block  
      00B680                       4665 app_space: 
                                   4666 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 192.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   6 AB1        0008F6 R   |   6 ABOR1      001406 R
  6 ABOR2      00141D R   |   6 ABORQ      0013FE R   |   6 ABORT      0013EF R
  6 ABRTQ      0016E9 R   |   6 ABSS       0008ED R   |   6 ACCEP      001385 R
  6 ACCP1      00138E R   |   6 ACCP2      0013B4 R   |   6 ACCP3      0013B7 R
  6 ACCP4      0013B9 R   |     ADC_CR1 =  005401     |     ADC_CR1_=  000000 
    ADC_CR1_=  000001     |     ADC_CR1_=  000004     |     ADC_CR1_=  000005 
    ADC_CR1_=  000006     |     ADC_CR2 =  005402     |     ADC_CR2_=  000003 
    ADC_CR2_=  000004     |     ADC_CR2_=  000005     |     ADC_CR2_=  000006 
    ADC_CR2_=  000001     |     ADC_CR3 =  005403     |     ADC_CR3_=  000007 
    ADC_CR3_=  000006     |     ADC_CSR =  005400     |     ADC_CSR_=  000006 
    ADC_CSR_=  000004     |     ADC_CSR_=  000000     |     ADC_CSR_=  000001 
    ADC_CSR_=  000002     |     ADC_CSR_=  000003     |     ADC_CSR_=  000007 
    ADC_CSR_=  000005     |     ADC_DRH =  005404     |     ADC_DRL =  005405 
    ADC_TDRH=  005406     |     ADC_TDRL=  005407     |     ADDWX   =  00001C 
  6 ADRADJ     0007BD R   |     AFR     =  004803     |     AFR0_ADC=  000000 
    AFR1_TIM=  000001     |     AFR2_CCO=  000002     |     AFR3_TIM=  000003 
    AFR4_TIM=  000004     |     AFR5_TIM=  000005     |     AFR6_I2C=  000006 
    AFR7_BEE=  000007     |   6 AFT        0016D4 R   |   6 AGAIN      00161E R
  6 AHEAD      001681 R   |   6 ALLOT      00152B R   |   6 ANDD       000677 R
    APP_CP  =  004004     |     APP_LAST=  004000     |     APP_RUN =  004002 
    APP_VP  =  004006     |   6 AT         0004E4 R   |   6 ATEXE      000D1F R
  6 ATEXP      002D88 R   |   6 ATEXP1     002D9D R   |   6 ATEXP2     002DAD R
  6 AUTORUN    000129 R   |     AWU_APR =  0050F1     |     AWU_CSR =  0050F0 
    AWU_TBR =  0050F2     |     B0_MASK =  000001     |     B115200 =  000006 
  6 B115K2     0003E1 R   |     B19200  =  000003     |   6 B19K2      0003BE R
    B1_MASK =  000002     |     B230400 =  000007     |     B2400   =  000000 
  6 B2K4       00038F R   |     B2_MASK =  000004     |     B38400  =  000004 
    B3_MASK =  000008     |     B460800 =  000008     |     B4800   =  000001 
  6 B4K8       00039D R   |     B4_MASK =  000010     |     B57600  =  000005 
  6 B57K6      0003CF R   |     B5_MASK =  000020     |     B6_MASK =  000040 
    B7_MASK =  000080     |     B921600 =  000009     |     B9600   =  000002 
  6 B9K6       0003AD R   |   6 BACK1      00132D R   |   6 BASE       0006E0 R
    BASEE   =  00000A     |   6 BAUD       0003F1 R   |     BCNT    =  000001 
  6 BCOMP      00156E R   |   6 BDIGS      000E17 R   |     BEEP_BIT=  000004 
    BEEP_CSR=  0050F3     |     BEEP_MAS=  000010     |     BEEP_POR=  00000F 
  6 BEGIN      001600 R   |     BIT0    =  000000     |     BIT1    =  000001 
    BIT2    =  000002     |     BIT3    =  000003     |     BIT4    =  000004 
    BIT5    =  000005     |     BIT6    =  000006     |     BIT7    =  000007 
  6 BKSLA      001182 R   |   6 BKSP       0012FD R   |     BKSPP   =  000008 
  6 BLANK      000C02 R   |     BLOCK_SI=  000080     |     BOOT_ROM=  006000 
    BOOT_ROM=  007FFF     |   6 BRAN       0004B5 R   |     BTW     =  000001 
  6 BUF2ROW    0021FF R   |   6 BYE        0000B6 R   |     CADR    =  000003 
    CALLL   =  0000CD     |   6 CALLOT     002448 R   |     CAN_DGR =  005426 
    CAN_FPSR=  005427     |     CAN_IER =  005425     |     CAN_MCR =  005420 
    CAN_MSR =  005421     |     CAN_P0  =  005428     |     CAN_P1  =  005429 
    CAN_P2  =  00542A     |     CAN_P3  =  00542B     |     CAN_P4  =  00542C 
    CAN_P5  =  00542D     |     CAN_P6  =  00542E     |     CAN_P7  =  00542F 
    CAN_P8  =  005430     |     CAN_P9  =  005431     |     CAN_PA  =  005432 
    CAN_PB  =  005433     |     CAN_PC  =  005434     |     CAN_PD  =  005435 
    CAN_PE  =  005436     |     CAN_PF  =  005437     |     CAN_RFR =  005424 
    CAN_TPR =  005423     |     CAN_TSR =  005422     |     CARRY   =  00002A 
    CASE_SEN=  000000     |   6 CAT        000502 R   |   6 CCOMMA     001550 R
    CC_C    =  000000     |     CC_H    =  000004     |     CC_I0   =  000003 
    CC_I1   =  000005     |     CC_N    =  000002     |     CC_V    =  000007 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 193.
Hexadecimal [24-Bits]

Symbol Table

    CC_Z    =  000001     |     CELLL   =  000002     |   6 CELLM      000B87 R
  6 CELLP      000B78 R   |   6 CELLS      000B96 R   |     CFG_GCR =  007F60 
    CFG_GCR_=  000001     |     CFG_GCR_=  000000     |   6 CHAR1      000F6D R
  6 CHAR2      000F70 R   |   6 CHKIVEC    0020ED R   |     CLKOPT  =  004807 
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
    CLK_SWR_=  0000E1     |     CLK_SWR_=  0000D2     |   6 CMOV1      000D52 R
  6 CMOV2      000D66 R   |   6 CMOV3      000D7A R   |   6 CMOVE      000D36 R
    CNT     =  000001     |     CNT1    =  000004     |     CNT2    =  000003 
    CNTDWN  =  000032     |   6 CNTXT      000763 R   |   6 COLD       001BEE R
  6 COLD1      001BEE R   |   6 COLON      0018D2 R   |   6 COMMA      001539 R
  6 COMPI      00157E R   |     COMPO   =  000040     |   6 CONSTANT   00197C R
  6 COPYRIGH   001B38 R   |   6 COUNT      000CD2 R   |   6 CPP        00077F R
    CPU_A   =  007F00     |     CPU_CCR =  007F0A     |     CPU_PCE =  007F01 
    CPU_PCH =  007F02     |     CPU_PCL =  007F03     |     CPU_SPH =  007F08 
    CPU_SPL =  007F09     |     CPU_XH  =  007F04     |     CPU_XL  =  007F05 
    CPU_YH  =  007F06     |     CPU_YL  =  007F07     |   6 CR         000F96 R
  6 CREAT      001918 R   |     CRR     =  00000D     |   6 CSTOR      0004F1 R
  6 CTABLE     002469 R   |   6 CTAT       00248A R   |   6 CTINIT     0024B2 R
  6 D2SLASH    002A07 R   |   6 D2STAR     002A1E R   |   6 DABS       0026C0 R
  6 DABS1      0026C8 R   |   6 DAT        000CB6 R   |     DATSTK  =  001680 
  6 DBLVER     002536 R   |   6 DCLZ       002807 R   |   6 DCLZ1      002810 R
  6 DCLZ4      002819 R   |   6 DCLZ8      002826 R   |   6 DCONST     0019B1 R
  6 DDIG       00272C R   |   6 DDIGS      002744 R   |   6 DDOT       00275B R
  6 DDOT0      00276F R   |   6 DDOT1      002785 R   |   6 DDROP      00081D R
  6 DDSLMOD    002B7A R   |   6 DDSTAR3    002AD5 R   |   6 DDUP       000828 R
    DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF     |   6 DECIM      000EC7 R
  6 DEPTH      000C51 R   |   6 DEQU4      0028DF R   |   6 DEQUAL     0028CA R
    DEVID_BA=  0048CD     |     DEVID_EN=  0048D8     |     DEVID_LO=  0048D2 
    DEVID_LO=  0048D3     |     DEVID_LO=  0048D4     |     DEVID_LO=  0048D5 
    DEVID_LO=  0048D6     |     DEVID_LO=  0048D7     |     DEVID_LO=  0048D8 
    DEVID_WA=  0048D1     |     DEVID_XH=  0048CE     |     DEVID_XL=  0048CD 
    DEVID_YH=  0048D0     |     DEVID_YL=  0048CF     |   6 DGREAT     0028EB R
  6 DGTQ1      000F0C R   |   6 DI         0000C4 R   |   6 DIG        000E40 R
  6 DIGIT      000DDB R   |   6 DIGS       000E51 R   |   6 DIGS1      000E51 R
  6 DIGS2      000E5E R   |   6 DIGTQ      000EDB R   |     DISCOVER=  000000 
  6 DLESS      0028F6 R   |   6 DLESS4     00290A R   |   6 DLITER     0029C7 R
  6 DLSHIFT    002A3A R   |   6 DLSHIFT1   002A4D R   |   6 DLSHIFT2   002A62 R
    DM_BK1RE=  007F90     |     DM_BK1RH=  007F91     |     DM_BK1RL=  007F92 
    DM_BK2RE=  007F93     |     DM_BK2RH=  007F94     |     DM_BK2RL=  007F95 
    DM_CR1  =  007F96     |     DM_CR2  =  007F97     |     DM_CSR1 =  007F98 
    DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A     |   6 DN1        0008B4 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 194.
Hexadecimal [24-Bits]

Symbol Table

  6 DNEGA      000899 R   |   6 DOCONST    00199C R   |   6 DOLIT      000470 R
  6 DONXT      000484 R   |     DOORBELL=  000000     |   6 DOSTR      000FA6 R
  6 DOT        00103C R   |   6 DOT1       001051 R   |   6 DOTI1      001B01 R
  6 DOTID      001AEB R   |   6 DOTO1      001492 R   |   6 DOTOK      001478 R
  6 DOTPR      001163 R   |   6 DOTQ       001703 R   |   6 DOTQP      000FC3 R
  6 DOTR       000FD1 R   |   6 DOTS       001A8D R   |   6 DOTS1      001A98 R
  6 DOTS2      001AA1 R   |   6 DOVAR      0006D0 R   |   6 DOVER      0029EE R
  6 DO_DCONS   0019D4 R   |     DP      =  000005     |   6 DPLUS      002BDB R
  6 DPLUS1     002C02 R   |   6 DRAT       00295E R   |   6 DRFROM     002946 R
  6 DROP       000610 R   |   6 DROT       002873 R   |   6 DRSHIFT    002A73 R
  6 DRSHIFT1   002A7A R   |   6 DRSHIFT2   002A90 R   |   6 DSIGN      0026D1 R
  6 DSIGN1     0026DB R   |   6 DSLA8      002BB7 R   |   6 DSLA9      002BC4 R
  6 DSLASH     002BCC R   |   6 DSLMOD     0026EB R   |   6 DSLMOD3    002706 R
  6 DSLMOD4    002712 R   |   6 DSLMODa    00270D R   |   6 DSLMODb    002718 R
  6 DSSTAR     0027B3 R   |   6 DSSTAR3    0027D0 R   |   6 DSTAR      002A96 R
  6 DSTOR      000C9D R   |   6 DSUB       002C0D R   |   6 DSUB1      002C34 R
  6 DSWAP      0027D9 R   |   6 DTOF       003484 R   |   6 DTOF1      00348D R
  6 DTOF2      00349B R   |   6 DTOR       002928 R   |   6 DUMP       001A43 R
  6 DUMP1      001A5A R   |   6 DUMP3      001A7C R   |   6 DUMPP      001A12 R
  6 DUPP       00061A R   |   6 DVARIA     00297C R   |     DVER_MAJ=  000001 
    DVER_MIN=  000000     |   6 DZEQUAL    0028AE R   |   6 DZLESS     002911 R
  6 DZLESS1    00291B R   |   6 EDIGS      000E7C R   |   6 EDOT       002E0E R
  6 EDOT0      002E25 R   |   6 EDOT2      002E31 R   |   6 EDOT3      002E47 R
  6 EDOT4      002E73 R   |   6 EDOT5      002E92 R   |   6 EECSTORE   001E9E R
  6 EEPCP      001CC4 R   |   6 EEPLAST    001C97 R   |   6 EEPROM     001C7F R
    EEPROM_B=  004000     |     EEPROM_E=  0047FF     |     EEPROM_R=  000010 
    EEPROM_S=  000800     |   6 EEPRUN     001CAE R   |   6 EEPVP      001CDA R
  6 EESTORE    001EEA R   |   6 EE_CCOMM   0021B4 R   |   6 EE_COMMA   002193 R
  6 EE_CREAD   001E2F R   |   6 EE_READ    001E0D R   |   6 EI         0000BD R
  6 ELSEE      001659 R   |   6 EMIT       000437 R   |   6 ENEPER     0023D4 R
    EOL_CR  =  000001     |     EOL_LF  =  000000     |   6 EQ1        000908 R
  6 EQUAL      0008FB R   |   6 ERASE      000DA9 R   |     ERR     =  00001B 
  6 EVAL       0014BB R   |   6 EVAL1      0014BB R   |   6 EVAL2      0014D4 R
  6 EXE1       000D2D R   |   6 EXECU      0004C5 R   |     EXT     =  000000 
    EXTI_CR1=  0050A0     |     EXTI_CR2=  0050A1     |   6 EXTRC      000E03 R
  6 FABS       00359A R   |   6 FABS1      0035B3 R   |   6 FADDR      002281 R
  6 FALGN4     00315F R   |   6 FALGN6     00316E R   |   6 FALGN7     003195 R
  6 FALGN71    0031A4 R   |   6 FALGN72    0031C0 R   |   6 FALGN8     0031C3 R
  6 FALIGN     003126 R   |   6 FALSE      000869 R   |   6 FARAT      001D45 R
  6 FARCAT     001D51 R   |   6 FC_XOFF    000464 R   |   6 FC_XON     00044E R
  6 FDOT       002EA1 R   |   6 FDOT0      002EDF R   |   6 FDOT1      002ECE R
  6 FDOT10     002F32 R   |   6 FDOT2      002EED R   |   6 FDOT3      002F03 R
  6 FDOT6      002F10 R   |   6 FDOT7      002F12 R   |   6 FDOT8      002F1A R
  6 FDOT9      002F22 R   |   6 FEQUAL     003564 R   |   6 FER        002CA6 R
  6 FGREAT     003559 R   |     FHSE    =  7A1200     |     FHSI    =  F42400 
  6 FILL       000D89 R   |   6 FILL0      000D97 R   |   6 FILL1      000D9F R
  6 FIND       001259 R   |   6 FIND1      001277 R   |   6 FIND2      0012A5 R
  6 FIND3      0012B1 R   |   6 FIND4      0012C5 R   |   6 FIND5      0012D2 R
  6 FIND6      0012B6 R   |   6 FINIT      002C9C R   |     FLASH_BA=  008000 
    FLASH_CR=  00505A     |     FLASH_CR=  000002     |     FLASH_CR=  000000 
    FLASH_CR=  000003     |     FLASH_CR=  000001     |     FLASH_CR=  00505B 
    FLASH_CR=  000005     |     FLASH_CR=  000004     |     FLASH_CR=  000007 
    FLASH_CR=  000000     |     FLASH_CR=  000006     |     FLASH_DU=  005064 
    FLASH_DU=  0000AE     |     FLASH_DU=  000056     |     FLASH_EN=  027FFF 
    FLASH_FP=  00505D     |     FLASH_FP=  000000     |     FLASH_FP=  000001 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 195.
Hexadecimal [24-Bits]

Symbol Table

    FLASH_FP=  000002     |     FLASH_FP=  000003     |     FLASH_FP=  000004 
    FLASH_FP=  000005     |     FLASH_IA=  00505F     |     FLASH_IA=  000003 
    FLASH_IA=  000002     |     FLASH_IA=  000006     |     FLASH_IA=  000001 
    FLASH_IA=  000000     |     FLASH_NC=  00505C     |     FLASH_NF=  00505E 
    FLASH_NF=  000000     |     FLASH_NF=  000001     |     FLASH_NF=  000002 
    FLASH_NF=  000003     |     FLASH_NF=  000004     |     FLASH_NF=  000005 
    FLASH_PU=  005062     |     FLASH_PU=  000056     |     FLASH_PU=  0000AE 
    FLASH_SI=  020000     |     FLASH_WS=  00480D     |   6 FLESS      00354E R
  6 FLOATQ     002FAA R   |   6 FLOATQ0    002FB2 R   |   6 FLOATQ1    003011 R
  6 FLOATQ2    00301A R   |   6 FLOATQ3    003022 R   |   6 FLOATQ4    003036 R
  6 FLOAT_ER   003051 R   |   6 FLOAT_ER   00304E R   |     FLOAT_MA=  000001 
    FLOAT_MI=  000000     |     FLSI    =  01F400     |   6 FMOVE      00228C R
  6 FMOVE2     0022BD R   |   6 FNE        002CC9 R   |   6 FNEGA      003580 R
  6 FOR        0015C8 R   |   6 FORGET     00015A R   |   6 FORGET1    000189 R
  6 FORGET2    00020F R   |   6 FORGET4    000218 R   |   6 FORGET6    0001D1 R
  6 FOV        002CE4 R   |   6 FPLUS      0031CF R   |   6 FPLUS1     0031EF R
  6 FPSTOR     001C60 R   |   6 FPSW       002C78 R   |     FPTR    =  000034 
  6 FREEVAR    000225 R   |   6 FREEVAR4   00025B R   |   6 FRESET     002C8A R
  6 FSLASH     0033B5 R   |   6 FSLASH1    0033F7 R   |   6 FSLASH8    00345A R
  6 FSLASH9    003471 R   |   6 FSTAR      00338E R   |   6 FSUB       003201 R
  6 FSUB1      003221 R   |   6 FTOD       0034A8 R   |   6 FTOD1      0034D5 R
  6 FTOD2      0034EE R   |   6 FTOD3      0034F5 R   |   6 FTOD4      0034FD R
  6 FTOD5      003502 R   |   6 FTOD6      003522 R   |   6 FTOD8      003527 R
  6 FTOD9      003532 R   |   6 FVER       002C46 R   |   6 FZE        002CB3 R
  6 FZEQUAL    00356D R   |   6 FZLESS     003539 R   |     GPIO_BAS=  005000 
    GPIO_CR1=  000003     |     GPIO_CR2=  000004     |     GPIO_DDR=  000002 
    GPIO_IDR=  000001     |     GPIO_ODR=  000000     |     GPIO_SIZ=  000005 
  6 GREAT      000954 R   |   6 GREAT1     00095F R   |   6 HDOT       001020 R
  6 HERE       000CE9 R   |   6 HEX        000EB2 R   |   6 HI         001BA3 R
  6 HLD        000750 R   |   6 HOLD       000E27 R   |     HSECNT  =  004809 
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
  6 ICOLON     0018E3 R   |   6 IFETCH     0015E6 R   |   6 IFF        001631 R
  6 IFMOVE     002365 R   |     IMEDD   =  000080     |   6 IMMED      0018F5 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 196.
Hexadecimal [24-Bits]

Symbol Table

  6 INCH       00042B R   |   6 INC_FPTR   001DDA R   |   6 INITOFS    0018AB R
  6 INN        0006FE R   |     INPUT_DI=  000000     |     INPUT_EI=  000001 
    INPUT_FL=  000000     |     INPUT_PU=  000001     |   6 INTE1      00145A R
  6 INTER      001430 R   |   6 INTQ       00250E R   |     INT_ADC2=  000016 
    INT_AUAR=  000012     |     INT_AWU =  000001     |     INT_CAN_=  000008 
    INT_CAN_=  000009     |     INT_CLK =  000002     |     INT_EXTI=  000003 
    INT_EXTI=  000004     |     INT_EXTI=  000005     |     INT_EXTI=  000006 
    INT_EXTI=  000007     |     INT_FLAS=  000018     |     INT_I2C =  000013 
    INT_SPI =  00000A     |     INT_TIM1=  00000C     |     INT_TIM1=  00000B 
    INT_TIM2=  00000E     |     INT_TIM2=  00000D     |     INT_TIM3=  000010 
    INT_TIM3=  00000F     |     INT_TIM4=  000017     |     INT_TLI =  000000 
    INT_UART=  000011     |     INT_UART=  000015     |     INT_UART=  000014 
    INT_VECT=  008060     |     INT_VECT=  00800C     |     INT_VECT=  008028 
    INT_VECT=  00802C     |     INT_VECT=  008010     |     INT_VECT=  008014 
    INT_VECT=  008018     |     INT_VECT=  00801C     |     INT_VECT=  008020 
    INT_VECT=  008024     |     INT_VECT=  008068     |     INT_VECT=  008054 
    INT_VECT=  008000     |     INT_VECT=  008030     |     INT_VECT=  008038 
    INT_VECT=  008034     |     INT_VECT=  008040     |     INT_VECT=  00803C 
    INT_VECT=  008048     |     INT_VECT=  008044     |     INT_VECT=  008064 
    INT_VECT=  008008     |     INT_VECT=  008004     |     INT_VECT=  008050 
    INT_VECT=  00804C     |     INT_VECT=  00805C     |     INT_VECT=  008058 
  6 INVER      000876 R   |     IPR0    =  000002     |     IPR1    =  000001 
    IPR2    =  000000     |     IPR3    =  000003     |     IPR_MASK=  000003 
    IRET_COD=  000080     |   6 ISEMI      0017FA R   |     ITC_SPR1=  007F70 
    ITC_SPR2=  007F71     |     ITC_SPR3=  007F72     |     ITC_SPR4=  007F73 
    ITC_SPR5=  007F74     |     ITC_SPR6=  007F75     |     ITC_SPR7=  007F76 
    ITC_SPR8=  007F77     |     IWDG_KR =  0050E0     |     IWDG_PR =  0050E1 
    IWDG_RLR=  0050E2     |   6 JFETCH     0015F1 R   |     JPIMM   =  0000CC 
  6 JSRC       00184F R   |   6 JSRC1      001872 R   |   6 JSRC2      001895 R
  6 KEY        000F1B R   |   6 KTAP       00134A R   |   6 KTAP1      00136D R
  6 KTAP2      001370 R   |   6 LAST       00078F R   |   6 LASTN   =  003595 R
  6 LBRAC      001467 R   |     LED2_BIT=  000005     |     LED2_MAS=  000020 
    LED2_POR=  00500A     |   6 LESS       000927 R   |     LF      =  00000A 
  6 LINK    =  003595 R   |   6 LITER      0015A0 R   |   6 LN2S       002430 R
  6 LOCAL      000555 R   |   6 LOCK       001DC6 R   |   6 LOG2S      00241A R
  6 LSCALE     003070 R   |   6 LSHIFT     000BC1 R   |   6 LSHIFT1    000BCA R
  6 LSHIFT4    000BD2 R   |   6 LT1        000932 R   |     MASKK   =  001F7F 
  6 MAX        00096C R   |   6 MAX1       000976 R   |     MAX_MANT=  7FFFFF 
  6 MIN        000980 R   |   6 MIN1       00098A R   |   6 MMOD1      000A39 R
  6 MMOD2      000A4D R   |   6 MMOD3      000A64 R   |   6 MMSM0      0009C9 R
  6 MMSM1      0009D9 R   |   6 MMSM3      0009DD R   |   6 MMSM4      0009E9 R
  6 MMSMa      0009E4 R   |   6 MMSMb      0009EF R   |   6 MMSTA1     0032BF R
  6 MMSTA2     0032CA R   |   6 MMSTA3     0032D5 R   |   6 MMSTA4     003340 R
  6 MMSTA5     003352 R   |   6 MMSTA6     003368 R   |   6 MMSTA7     003385 R
  6 MMSTAR     0032B4 R   |   6 MODD       000ABF R   |   6 MONE       000C28 R
    MS      =  000030     |   6 MSEC       0002D1 R   |   6 MSMOD      000A1C R
  6 MSTA1      000B50 R   |   6 MSTAR      000B2D R   |     NAFR    =  004804 
  6 NAMEQ      0012F2 R   |   6 NAMET      001203 R   |     NCLKOPT =  004808 
  6 NDROT      002837 R   |   6 NEGAT      000887 R   |   6 NEG_SIGN   002579 R
  6 NEX1       000491 R   |   6 NEXT       0015D7 R   |     NFLASH_W=  00480E 
    NHSECNT =  00480A     |     NOPT1   =  004802     |     NOPT2   =  004804 
    NOPT3   =  004806     |     NOPT4   =  004808     |     NOPT5   =  00480A 
    NOPT6   =  00480C     |     NOPT7   =  00480E     |     NOPTBL  =  00487F 
  6 NRAT       0005A0 R   |   6 NRDROP     00057C R   |   6 NROT       0007FD R
  6 NRSTO      0005BF R   |   6 NTIB       00070E R   |     NUBC    =  004802 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 197.
Hexadecimal [24-Bits]

Symbol Table

    NUCLEO  =  000001     |   6 NUFQ       000F31 R   |   6 NUFQ1      000F4A R
  6 NUMBQ      0025E8 R   |   6 NUMQ0      002629 R   |   6 NUMQ1      002653 R
  6 NUMQ3      00267D R   |   6 NUMQ4      00269B R   |   6 NUMQ5      0026A6 R
  6 NUMQ6      0026A8 R   |   6 NUMQ8      0026B0 R   |     NWDGOPT =  004806 
    NWDGOPT_=  FFFFFFFD     |     NWDGOPT_=  FFFFFFFC     |     NWDGOPT_=  FFFFFFFF 
    NWDGOPT_=  FFFFFFFE     |   6 NonHandl   000000 R   |   6 OFFSET     0007B4 R
    OFS     =  000005     |   6 ONE        000C1A R   |   6 ONEM       000BB0 R
  6 ONEP       000BA3 R   |     OPT     =  000002     |     OPT0    =  004800 
    OPT1    =  004801     |     OPT2    =  004803     |     OPT3    =  004805 
    OPT4    =  004807     |     OPT5    =  004809     |     OPT6    =  00480B 
    OPT7    =  00480D     |     OPTBL   =  00487E     |     OPTIMIZE=  000001 
    OPTION_B=  004800     |     OPTION_E=  00487F     |     OPTION_S=  000080 
  6 ORIG       000049 R   |   6 ORR        00068B R   |   6 OUTPUT     00043C R
    OUTPUT_F=  000001     |     OUTPUT_O=  000000     |     OUTPUT_P=  000001 
    OUTPUT_S=  000000     |   6 OVER       000642 R   |   6 OVERT      0017C8 R
    PA      =  000000     |   6 PACKS      000DBA R   |   6 PAD        000CFA R
  6 PAREN      001172 R   |   6 PARS       00106B R   |   6 PARS1      001096 R
  6 PARS2      0010C1 R   |   6 PARS3      0010C4 R   |   6 PARS4      0010CD R
  6 PARS5      0010F0 R   |   6 PARS6      001105 R   |   6 PARS7      001114 R
  6 PARS8      001123 R   |   6 PARSE      001134 R   |   6 PARSEXP_   002F8D R
  6 PAUSE      0002E1 R   |     PA_BASE =  005000     |     PA_CR1  =  005003 
    PA_CR2  =  005004     |     PA_DDR  =  005002     |     PA_IDR  =  005001 
    PA_ODR  =  005000     |     PB      =  000005     |     PB_BASE =  005005 
    PB_CR1  =  005008     |     PB_CR2  =  005009     |     PB_DDR  =  005007 
    PB_IDR  =  005006     |     PB_ODR  =  005005     |     PC      =  00000A 
    PC_BASE =  00500A     |     PC_CR1  =  00500D     |     PC_CR2  =  00500E 
    PC_DDR  =  00500C     |     PC_IDR  =  00500B     |     PC_ODR  =  00500A 
    PD      =  00000F     |   6 PDUM1      001A25 R   |   6 PDUM2      001A36 R
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
    PH_ODR  =  005023     |     PI      =  000028     |   6 PICK       000C68 R
  6 PII        002393 R   |     PI_BASE =  005028     |     PI_CR1  =  00502B 
    PI_CR2  =  00502C     |     PI_DDR  =  00502A     |     PI_IDR  =  005029 
    PI_ODR  =  005028     |   6 PLUS       00083D R   |   6 PNAM1      00176D R
  6 PRESE      0014E3 R   |   6 PRINT_VE   001B74 R   |     PROD1   =  000024 
    PROD2   =  000026     |     PROD3   =  000028     |   6 PROTECTE   000201 R
  6 PRT_LICE   001B60 R   |   6 PSTOR      000C7F R   |     PTR16   =  000035 
    PTR8    =  000036     |   6 PTRPLUS    001DF2 R   |   6 QBRAN      000499 R
  6 QDUP       0007CD R   |   6 QDUP1      0007D7 R   |     QHI     =  000005 
  6 QKEY       000419 R   |     QLBIT   =  000001     |     QLO     =  000007 
  6 QSTAC      00149E R   |   6 QUERY      0013CA R   |   6 QUEST      00105E R
  6 QUIT       001500 R   |   6 QUIT1      001508 R   |   6 QUIT2      00150B R
  6 RAM2EE     00222D R   |     RAMBASE =  000000     |   6 RAMLAST    0007A2 R
    RAM_BASE=  000000     |     RAM_END =  0017FF     |     RAM_SIZE=  001800 
  6 RANDOM     00027F R   |   6 RAT        000546 R   |   6 RBRAC      00183C R
  6 REPEA      0016B4 R   |   6 RFREE      002214 R   |   6 RFROM      000535 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 198.
Hexadecimal [24-Bits]

Symbol Table

    ROP     =  004800     |   6 ROT        0007DE R   |   6 ROW2BUF    0021D6 R
    ROWBUFF =  001680     |     RP0     =  00002E     |   6 RPAT       000512 R
    RPP     =  0017FF     |   6 RPSTO      00051F R   |   6 RSCALE     003094 R
  6 RSHIFT     000BDD R   |   6 RSHIFT1    000BE6 R   |   6 RSHIFT4    000BEE R
    RST_SR  =  0050B3     |   6 RT12_2     002403 R   |   6 SAME1      001221 R
  6 SAME2      00124A R   |   6 SAMEQ      001219 R   |   6 SCAL1      00324A R
  6 SCAL2      00326B R   |   6 SCALDN2    003118 R   |   6 SCALDN3    00311B R
  6 SCALEDOW   0030EC R   |   6 SCALETOM   003244 R   |   6 SCALEUP    0030B5 R
  6 SCALEUP2   0030E8 R   |   6 SCALEUP3   0030EB R   |   6 SCOM1      0017A2 R
  6 SCOM2      0017A5 R   |   6 SCOMP      001784 R   |   6 SEED       000266 R
    SEEDX   =  000038     |     SEEDY   =  00003A     |   6 SEMIS      0017D8 R
  6 SETISP     0000D0 R   |   6 SET_RAML   001965 R   |   6 SFN        002D3B R
    SFR_BASE=  005000     |     SFR_END =  0057FF     |   6 SFV        002D6F R
  6 SFZ        002D04 R   |   6 SIGN       000E66 R   |   6 SIGN1      000E76 R
  6 SLASH      000AC9 R   |   6 SLMOD      000A6C R   |   6 SLMOD1     000AA9 R
  6 SLMOD8     000AB6 R   |   6 SNAME      001737 R   |     SP0     =  00002C 
  6 SPACE      000F53 R   |   6 SPACS      000F62 R   |   6 SPAT       0005FA R
    SPI_CR1 =  005200     |     SPI_CR2 =  005201     |     SPI_CRCP=  005205 
    SPI_DR  =  005204     |     SPI_ICR =  005202     |     SPI_RXCR=  005206 
    SPI_SR  =  005203     |     SPI_TXCR=  005207     |     SPP     =  001680 
    SPSAVE  =  000001     |   6 SPSTO      000607 R   |   6 SQRT10     0023EC R
  6 SQRT2      0023AA R   |   6 SQRT3      0023C1 R   |   6 SSMOD      000B59 R
    SSP     =  000001     |     STACK   =  0017FF     |   6 STAR       000B22 R
  6 STASL      000B6A R   |   6 STEXP      002DBA R   |   6 STEXP1     002DD0 R
  6 STEXP2     002DFA R   |   6 STOD       0008BC R   |   6 STORE      0004D2 R
  6 STO_SIGN   002591 R   |   6 STR        000E94 R   |   6 STRCQ      0015A8 R
  6 STRQ       0016F6 R   |   6 STRQP      000FBF R   |   6 SUBB       0008D3 R
  6 SWAPP      00062A R   |     SWIM_CSR=  007F80     |   6 TAP        001334 R
  6 TBOOT      001BE2 R   |   6 TBRAN      0004A7 R   |   6 TBUF       00071E R
    TBUFFBAS=  001680     |   6 TCHAR      000C39 R   |   6 TEMP       0006EF R
  6 TEVAL      000741 R   |   6 TFLASH     000730 R   |   6 THENN      001646 R
  6 TIB        000D0B R   |     TIBB    =  001700     |     TIBBASE =  001700 
    TIC     =  000027     |   6 TICK       001517 R   |     TIM1_ARR=  005262 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 199.
Hexadecimal [24-Bits]

Symbol Table

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
    TIM4_SR =  005342     |     TIM4_SR_=  000000     |   6 TIMEOUTQ   000311 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 200.
Hexadecimal [24-Bits]

Symbol Table

  6 TIMER      0002FB R   |     TIM_CR1_=  000007     |     TIM_CR1_=  000000 
    TIM_CR1_=  000006     |     TIM_CR1_=  000005     |     TIM_CR1_=  000004 
    TIM_CR1_=  000003     |     TIM_CR1_=  000001     |     TIM_CR1_=  000002 
  6 TNAM2      001ABB R   |   6 TNAM3      001AD9 R   |   6 TNAM4      001ADF R
  6 TNAME      001AB8 R   |   6 TOFLASH    000336 R   |   6 TOKEN      0011F5 R
  6 TOR        0005E3 R   |   6 TORAM      000376 R   |   6 TRUE       000858 R
    TRUEE   =  00FFFF     |   6 TWOSL      000BF5 R   |   6 TYPE1      000F82 R
  6 TYPE2      000F88 R   |   6 TYPES      000F7D R   |   6 Timer4Ha   000005 R
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
    UD4     =  000004     |   6 UDIV10     00326C R   |   6 UDOT       00100C R
  6 UDOTR      000FEC R   |   6 UDSLA3     002B11 R   |   6 UDSLA4     002B27 R
  6 UDSLA7     002B4F R   |   6 UDSLA8     002B5D R   |   6 UDSLMOD    002ADF R
  6 UDSSTAR    002792 R   |   6 UEND       000047 R   |     UFPSW   =  000008 
  6 UGREAT     00093E R   |   6 UGREAT1    000949 R   |     UHLD    =  000014 
    UINN    =  00000C     |     UINTER  =  000012     |     ULAST   =  00001C 
  6 ULES1      00091C R   |   6 ULESS      000911 R   |   6 UMMOD      0009B2 R
  6 UMOD10     00322E R   |   6 UMSTA      000AD8 R   |   6 UNIQ1      001734 R
  6 UNIQU      001715 R   |   6 UNLKEE     001D60 R   |   6 UNLKFL     001D7F R
  6 UNLOCK     001D9E R   |   6 UNTIL      00160B R   |     UOFFSET =  00001E 
  6 UPDATCP    001D1D R   |   6 UPDATLAS   001CF4 R   |   6 UPDATPTR   002320 R
  6 UPDATRUN   001D0C R   |   6 UPDATVP    001D34 R   |   6 UPL1       0006CC R
  6 UPLUS      0006B5 R   |     UPP     =  000006     |   6 UPPER      0011B8 R
  6 UPPER1     0011DB R   |   6 UPPER2     0011E4 R   |     URLAST  =  000022 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 201.
Hexadecimal [24-Bits]

Symbol Table

  6 USLMOD     000A01 R   |     USR_BTN_=  000004     |     USR_BTN_=  000010 
    USR_BTN_=  005015     |     UTFLASH =  000020     |     UTIB    =  000010 
    UTMP    =  00000A     |   6 UTYP1      0019F5 R   |   6 UTYP2      001A04 R
  6 UTYPE      0019F0 R   |     UVP     =  000018     |   6 UZERO      00002B R
  6 VARIA      001932 R   |     VAR_BASE=  000080     |     VAR_TOP =  0017BF 
    VER     =  000004     |   6 VPP        000771 R   |     VSIZE   =  000006 
    WANT_CON=  000001     |     WANT_DEB=  000000     |     WANT_DOU=  000001 
    WANT_FLO=  000001     |     WANT_SCA=  000001     |     WANT_SEE=  000000 
    WDGOPT  =  004805     |     WDGOPT_I=  000002     |     WDGOPT_L=  000003 
    WDGOPT_W=  000000     |     WDGOPT_W=  000001     |   6 WHILE      00169A R
  6 WITHI      000997 R   |   6 WORDD      00119E R   |   6 WORDS      001B15 R
  6 WORS1      001B1B R   |   6 WORS2      001B37 R   |   6 WR_BYTE    001E49 R
  6 WR_WORD    001E6E R   |   6 WTABLE     002478 R   |   6 WTAT       00249C R
  6 WTINIT     0024E1 R   |     WWDG_CR =  0050D1     |     WWDG_WR =  0050D2 
    XMEM_SIZ=  017830     |     XOFF    =  000013     |     XON     =  000011 
  6 XORR       0006A0 R   |     XTEMP   =  000024     |     YTEMP   =  000026 
    YTMP    =  000003     |   6 ZEQ1       0028BE R   |   6 ZEQU1      00066D R
  6 ZEQUAL     000663 R   |   6 ZERO       000C0F R   |   6 ZL1        00065A R
  6 ZLESS      000651 R   |   6 app_spac   003600 R   |   6 baudrate   00037C R
  6 block_er   001F34 R   |   6 clear_ra   000019 R   |   6 clock_in   000064 R
  6 copy_buf   001F94 R   |   6 copy_buf   001FB3 R   |   6 copy_pro   001FB3 R
    da      =  000002     |     db      =  000003     |     dc      =  000000 
    dd      =  000001     |   6 do2lit     0029D2 R   |   6 erase_fl   001F56 R
  6 fmove_do   002309 R   |   6 main       000016 R   |   6 next_row   0022C6 R
  6 no_move    002310 R   |   6 nsign      002568 R   |   6 parse_d4   0025D1 R
  6 parse_d5   0025DD R   |   6 parse_di   002595 R   |   6 parse_ex   002F42 R
  6 pristine   002034 R   |   6 proceed_   001F59 R   |   6 reboot     000328 R
  6 reset_ve   00209B R   |   6 row_eras   001F14 R   |   6 row_eras   001F6D R
  6 row_eras   001F94 R   |   6 set_opti   002008 R   |   6 set_vect   00213C R
  6 uart_ini   000076 R   |   6 write_ro   001FD8 R

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 202.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 DATA       size      0   flags    8
   2 DATA0      size      0   flags    8
   3 SSEG       size      0   flags    8
   4 SSEG1      size    100   flags    8
   5 HOME       size     80   flags    0
   6 CODE       size   3600   flags    0

