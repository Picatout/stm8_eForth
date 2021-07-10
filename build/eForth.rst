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
      0080B7 94 94                  314         .word      INTER   ;'EVAL
      0080B9 00 00                  315         .word      0       ;HLD
      0080BB B5 D7                  316         .word      LASTN  ;CNTXT pointer
      0080BD 00 80                  317         .word      VAR_BASE   ;variables free space pointer 
      0080BF B6 00                  318         .word      app_space ; FLASH free space pointer 
      0080C1 B5 D7                  319         .word      LASTN   ;LAST
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
      00812D CC 9C 04         [ 2]  391         jp  COLD   ;default=MN1
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



      00817E CD 8C 31         [ 4]  447         call LSHIFT ; creat slot mask 
      008181 CD 88 F5         [ 4]  448         call INVER  ; ( level reg lshift rval mask )
      008184 CD 86 F6         [ 4]  449         call ANDD ; ( level reg lshift slot_masked )
      008187 CD 86 62         [ 4]  450         call TOR  ; ( level reg lshift -- R: slot_masked )
      00818A CD 88 5D         [ 4]  451         call ROT  ; ( reg lshift level )
      00818D CD 86 A9         [ 4]  452         call SWAPP ; ( reg level lshift )
      008190 CD 8C 31         [ 4]  453         call LSHIFT  ; ( reg slot_level -- )
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
      0081A9 CD 92 59         [ 4]  465         call TOKEN 
      0081AC CD 86 99         [ 4]  466         call DUPP 
      0081AF CD 85 18         [ 4]  467         call QBRAN 
      0081B2 82 8F                  468         .word FORGET2
      0081B4 CD 93 56         [ 4]  469         call NAMEQ
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
      0081CE CC 9F 00         [ 2]  479         jp EESTORE 
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
      0081DA CD 92 59         [ 4]  488         call TOKEN
      0081DD CD 86 99         [ 4]  489         call DUPP 
      0081E0 CD 85 18         [ 4]  490         call QBRAN 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 11.
Hexadecimal [24-Bits]



      0081E3 82 8F                  491         .word FORGET2
      0081E5 CD 93 56         [ 4]  492         call NAMEQ ; ( a -- ca na | a F )
      0081E8 CD 88 4C         [ 4]  493         call QDUP 
      0081EB CD 85 18         [ 4]  494         call QBRAN 
      0081EE 82 8F                  495         .word FORGET2
                                    496 ; only forget users words 
      0081F0 CD 86 99         [ 4]  497         call DUPP ; ( ca na na )
      0081F3 CD 84 EF         [ 4]  498         call DOLIT 
      0081F6 B6 00                  499         .word app_space 
      0081F8 CD 86 A9         [ 4]  500         call SWAPP 
      0081FB CD 89 90         [ 4]  501         call  ULESS 
      0081FE CD 85 18         [ 4]  502         call QBRAN 
      008201 82 51                  503         .word FORGET6 
                                    504 ; ( ca na -- )        
                                    505 ;reset ivec with address >= ca
      008203 CD 86 A9         [ 4]  506         call SWAPP ; ( na ca -- ) 
      008206 CD A1 03         [ 4]  507         call CHKIVEC ; ( na -- ) 
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
      00824B CD 9D 33         [ 4]  535         call UPDATCP 
      00824E CC 9D 0A         [ 2]  536         jp UPDATLAST 
      008251                        537 FORGET6: ; tried to forget a RAM or system word 
                                    538 ; ( ca na -- )
      008251 1D 00 02         [ 2]  539         subw x,#CELLL 
      008254 90 BE 2C         [ 2]  540         ldw y,SP0 
      008257 FF               [ 2]  541         ldw (x),y  
      008258 CD 89 90         [ 4]  542         call ULESS
      00825B CD 85 18         [ 4]  543         call QBRAN 
      00825E 82 81                  544         .word PROTECTED 
      008260 CD 94 62         [ 4]  545         call ABORQ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 12.
Hexadecimal [24-Bits]



      008263 1D                     546         .byte 29
      008264 20 46 6F 72 20 52 41   547         .ascii " For RAM definition do REBOOT"
             4D 20 64 65 66 69 6E
             69 74 69 6F 6E 20 64
             6F 20 52 45 42 4F 4F
             54
      008281                        548 PROTECTED:
      008281 CD 94 62         [ 4]  549         call ABORQ
      008284 0A                     550         .byte 10
      008285 20 50 72 6F 74 65 63   551         .ascii " Protected"
             74 65 64
      00828F                        552 FORGET2: ; no name or not found in dictionary 
      00828F CD 94 62         [ 4]  553         call ABORQ
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
      0082AB CD 8C 13         [ 4]  568         call ONEP ;
      0082AE CD 88 BC         [ 4]  569         CALL PLUS ; ( na c+1 -- ca ) 
      0082B1 CD 8C 13         [ 4]  570         call ONEP ; ( ca+ -- ) to get routne address 
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
      0082D8 CC 9D 4A         [ 2]  584         jp UPDATVP 
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
      0083C3 CD 94 62         [ 4]  733         call ABORQ 
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
      008546 1C 00 02         [ 2]  960 	ADDW X,#2
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
      008A3B 26 07            [ 1] 1827         JRNE    MMSM0
      008A3D 85               [ 2] 1828         POPW    X 
      008A3E 90 BE 26         [ 2] 1829         LDW     Y,YTEMP
      008A41 FF               [ 2] 1830         LDW (X), Y 
      008A42 20 38            [ 2] 1831         JRA     USLMOD          ; faster when udl==0 
      008A44                       1832 MMSM0:    
      008A44 90 EE 04         [ 2] 1833         LDW     Y,(4,Y)         ; Y=udl (offset before drop)
      008A47 B3 26            [ 2] 1834         CPW     X,YTEMP
      008A49 25 09            [ 1] 1835         JRULT   MMSM1           ; X is still on the R-stack
      008A4B 85               [ 2] 1836         POPW    X               ; restore stack pointer
      008A4C 90 5F            [ 1] 1837         CLRW    Y
      008A4E EF 02            [ 2] 1838         LDW     (2,X),Y         ; remainder 0
      008A50 90 5A            [ 2] 1839         DECW    Y
      008A52 FF               [ 2] 1840         LDW     (X),Y           ; quotient max. 16 bit value
      008A53 81               [ 4] 1841         RET
      008A54                       1842 MMSM1:
      008A54 A6 10            [ 1] 1843         LD      A,#16           ; loop count
      008A56 90 58            [ 2] 1844         SLLW    Y               ; udl shift udl into udh
      008A58                       1845 MMSM3:
      008A58 59               [ 2] 1846         RLCW    X               ; rotate udl bit into uhdh (= remainder)
      008A59 25 04            [ 1] 1847         JRC     MMSMa           ; if carry out of rotate
      008A5B B3 26            [ 2] 1848         CPW     X,YTEMP         ; compare udh to un
      008A5D 25 05            [ 1] 1849         JRULT   MMSM4           ; can't subtract
      008A5F                       1850 MMSMa:
      008A5F 72 B0 00 26      [ 2] 1851         SUBW    X,YTEMP         ; can subtract
      008A63 98               [ 1] 1852         RCF
      008A64                       1853 MMSM4:
      008A64 8C               [ 1] 1854         CCF                     ; quotient bit
      008A65 90 59            [ 2] 1855         RLCW    Y               ; rotate into quotient, rotate out udl
      008A67 4A               [ 1] 1856         DEC     A               ; repeat
      008A68 26 EE            [ 1] 1857         JRNE    MMSM3           ; if A == 0
      008A6A                       1858 MMSMb:
      008A6A BF 26            [ 2] 1859         LDW     YTEMP,X         ; done, save remainder
      008A6C 85               [ 2] 1860         POPW    X               ; restore stack pointer
      008A6D FF               [ 2] 1861         LDW     (X),Y           ; save quotient
      008A6E 90 BE 26         [ 2] 1862         LDW     Y,YTEMP         ; remainder onto stack
      008A71 EF 02            [ 2] 1863         LDW     (2,X),Y
      008A73 81               [ 4] 1864         RET
                                   1865 
                                   1866 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1867 ;   U/MOD ( u1 u2 -- ur uq )
                                   1868 ;   unsigned divide u1/u2 
                                   1869 ;   return remainder and quotient 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



                                   1870 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0009F4                       1871         _HEADER USLMOD,5,"U/MOD"
      008A74 8A 2A                    1         .word LINK 
                           0009F6     2         LINK=.
      008A76 05                       3         .byte 5  
      008A77 55 2F 4D 4F 44           4         .ascii "U/MOD"
      008A7C                          5         USLMOD:
      008A7C 90 93            [ 1] 1872         LDW Y,X 
      008A7E 90 FE            [ 2] 1873         LDW Y,(Y)  ; dividend 
      008A80 89               [ 2] 1874         PUSHW X    ; DP >R 
      008A81 EE 02            [ 2] 1875         LDW X,(2,X) ; divisor 
      008A83 65               [ 2] 1876         DIVW X,Y 
      008A84 89               [ 2] 1877         PUSHW X     ; quotient 
      008A85 1E 03            [ 2] 1878         LDW X,(3,SP) ; DP 
      008A87 EF 02            [ 2] 1879         LDW (2,X),Y ; remainder 
      008A89 16 01            [ 2] 1880         LDW Y,(1,SP) ; quotient 
      008A8B FF               [ 2] 1881         LDW (X),Y 
      008A8C 5B 04            [ 2] 1882         ADDW SP,#2*CELLL ; drop quotient and DP from rstack 
      008A8E 81               [ 4] 1883         RET 
                                   1884 
                                   1885 
                                   1886 
                                   1887 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
                                   1888 ;       M/MOD   ( d n -- r q )
                                   1889 ;       Signed floored divide of double by
                                   1890 ;       single. Return mod and quotient.
                                   1891 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000A0F                       1892         _HEADER MSMOD,5,"M/MOD"
      008A8F 8A 76                    1         .word LINK 
                           000A11     2         LINK=.
      008A91 05                       3         .byte 5  
      008A92 4D 2F 4D 4F 44           4         .ascii "M/MOD"
      008A97                          5         MSMOD:
      008A97 CD 86 99         [ 4] 1893         CALL	DUPP
      008A9A CD 86 D0         [ 4] 1894         CALL	ZLESS
      008A9D CD 86 99         [ 4] 1895         CALL	DUPP
      008AA0 CD 86 62         [ 4] 1896         CALL	TOR
      008AA3 CD 85 18         [ 4] 1897         CALL	QBRAN
      008AA6 8A B4                 1898         .word	MMOD1
      008AA8 CD 89 06         [ 4] 1899         CALL	NEGAT
      008AAB CD 86 62         [ 4] 1900         CALL	TOR
      008AAE CD 89 18         [ 4] 1901         CALL	DNEGA
      008AB1 CD 85 B4         [ 4] 1902         CALL	RFROM
      008AB4 CD 86 62         [ 4] 1903 MMOD1:	CALL	TOR
      008AB7 CD 86 99         [ 4] 1904         CALL	DUPP
      008ABA CD 86 D0         [ 4] 1905         CALL	ZLESS
      008ABD CD 85 18         [ 4] 1906         CALL	QBRAN
      008AC0 8A C8                 1907         .word	MMOD2
      008AC2 CD 85 C5         [ 4] 1908         CALL	RAT
      008AC5 CD 88 BC         [ 4] 1909         CALL	PLUS
      008AC8 CD 85 B4         [ 4] 1910 MMOD2:	CALL	RFROM
      008ACB CD 8A 31         [ 4] 1911         CALL	UMMOD
      008ACE CD 85 B4         [ 4] 1912         CALL	RFROM
      008AD1 CD 85 18         [ 4] 1913         CALL	QBRAN
      008AD4 8A DF                 1914         .word	MMOD3
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



      008AD6 CD 86 A9         [ 4] 1915         CALL	SWAPP
      008AD9 CD 89 06         [ 4] 1916         CALL	NEGAT
      008ADC CD 86 A9         [ 4] 1917         CALL	SWAPP
      008ADF 81               [ 4] 1918 MMOD3:	RET
                                   1919 
                                   1920 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1921 ;       /MOD    ( n1 n2 -- r q )
                                   1922 ;       Signed divide n1/n2. 
                                   1923 ;       Return mod and quotient.
                                   1924 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000A60                       1925         _HEADER SLMOD,4,"/MOD"
      008AE0 8A 91                    1         .word LINK 
                           000A62     2         LINK=.
      008AE2 04                       3         .byte 4  
      008AE3 2F 4D 4F 44              4         .ascii "/MOD"
      008AE7                          5         SLMOD:
      008AE7 F6               [ 1] 1926         LD A,(X)
      008AE8 88               [ 1] 1927         PUSH A   ; n2 sign 
      008AE9 E6 02            [ 1] 1928         LD A,(2,X)
      008AEB 88               [ 1] 1929         PUSH A    ; n1 sign 
      008AEC CD 89 6C         [ 4] 1930         CALL ABSS 
      008AEF CD 86 62         [ 4] 1931         CALL TOR  ; 
      008AF2 CD 89 6C         [ 4] 1932         CALL ABSS 
      008AF5 CD 85 C5         [ 4] 1933         CALL RAT   
      008AF8 CD 8A 7C         [ 4] 1934         CALL USLMOD 
      008AFB 7B 03            [ 1] 1935         LD A,(3,SP)
      008AFD 1A 04            [ 1] 1936         OR A,(4,SP)
      008AFF 2A 25            [ 1] 1937         JRPL SLMOD8 ; both positive nothing to change 
      008B01 7B 03            [ 1] 1938         LD A,(3,SP)
      008B03 18 04            [ 1] 1939         XOR A,(4,SP)
      008B05 2A 12            [ 1] 1940         JRPL SLMOD1
                                   1941 ; dividend and divisor are opposite sign          
      008B07 CD 8C 13         [ 4] 1942         CALL ONEP   ; add one to quotient 
      008B0A CD 89 06         [ 4] 1943         CALL NEGAT ; negative quotient
      008B0D CD 85 C5         [ 4] 1944         CALL RAT 
      008B10 CD 88 5D         [ 4] 1945         CALL ROT 
      008B13 CD 89 52         [ 4] 1946         CALL SUBB  ; corrected_remainder=divisor-remainder 
      008B16 CD 86 A9         [ 4] 1947         CALL SWAPP
      008B19                       1948 SLMOD1:
      008B19 7B 04            [ 1] 1949         LD A,(4,SP) ; divisor sign 
      008B1B 2A 09            [ 1] 1950         JRPL SLMOD8 
      008B1D CD 86 62         [ 4] 1951         CALL TOR 
      008B20 CD 89 06         [ 4] 1952         CALL NEGAT ; if divisor negative negate remainder 
      008B23 CD 85 B4         [ 4] 1953         CALL RFROM 
      008B26                       1954 SLMOD8: 
      008B26 5B 04            [ 2] 1955         ADDW SP,#4 
      008B28 81               [ 4] 1956         RET 
                                   1957 
                                   1958 ;        CALL	OVER
                                   1959 ;        CALL	ZLESS
                                   1960 ;        CALL	SWAPP
                                   1961 ;        JP	MSMOD
                                   1962 
                                   1963 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1964 ;       MOD     ( n n -- r )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



                                   1965 ;       Signed divide. Return mod only.
                                   1966 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000AA9                       1967         _HEADER MODD,3,"MOD"
      008B29 8A E2                    1         .word LINK 
                           000AAB     2         LINK=.
      008B2B 03                       3         .byte 3  
      008B2C 4D 4F 44                 4         .ascii "MOD"
      008B2F                          5         MODD:
      008B2F CD 8A E7         [ 4] 1968 	CALL	SLMOD
      008B32 CC 86 8F         [ 2] 1969 	JP	DROP
                                   1970 
                                   1971 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1972 ;       /       ( n n -- q )
                                   1973 ;       Signed divide. Return quotient only.
                                   1974 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000AB5                       1975         _HEADER SLASH,1,"/"
      008B35 8B 2B                    1         .word LINK 
                           000AB7     2         LINK=.
      008B37 01                       3         .byte 1  
      008B38 2F                       4         .ascii "/"
      008B39                          5         SLASH:
      008B39 CD 8A E7         [ 4] 1976         CALL	SLMOD
      008B3C CD 86 A9         [ 4] 1977         CALL	SWAPP
      008B3F CC 86 8F         [ 2] 1978         JP	DROP
                                   1979 
                                   1980 ;; Multiply
                                   1981 
                                   1982 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1983 ;       UM*     ( u u -- ud )
                                   1984 ;       Unsigned multiply. Return 
                                   1985 ;       double product.
                                   1986 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000AC2                       1987         _HEADER UMSTA,3,"UM*"
      008B42 8B 37                    1         .word LINK 
                           000AC4     2         LINK=.
      008B44 03                       3         .byte 3  
      008B45 55 4D 2A                 4         .ascii "UM*"
      008B48                          5         UMSTA:
                                   1988 ; stack have 4 bytes u1=a,b u2=c,d
                                   1989 ; take advantage of SP addressing modes
                                   1990 ; these PRODx in RAM are not required
                                   1991 ; the product is kept on stack as local variable 
                                   1992         ;; bytes offset on data stack 
                           000002  1993         da=2 
                           000003  1994         db=3 
                           000000  1995         dc=0 
                           000001  1996         dd=1 
                                   1997         ;; product bytes offset on return stack 
                           000001  1998         UD1=1  ; ud bits 31..24
                           000002  1999         UD2=2  ; ud bits 23..16
                           000003  2000         UD3=3  ; ud bits 15..8 
                           000004  2001         UD4=4  ; ud bits 7..0 
                                   2002         ;; local variable for product set to zero   
      008B48 90 5F            [ 1] 2003         clrw y 
      008B4A 90 89            [ 2] 2004         pushw y  ; bits 15..0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



      008B4C 90 89            [ 2] 2005         pushw y  ; bits 31..16 
      008B4E E6 03            [ 1] 2006         ld a,(db,x) ; b 
      008B50 90 97            [ 1] 2007         ld yl,a 
      008B52 E6 01            [ 1] 2008         ld a,(dd,x)   ; d
      008B54 90 42            [ 4] 2009         mul y,a    ; b*d  
      008B56 17 03            [ 2] 2010         ldw (UD3,sp),y ; lowest weight product 
      008B58 E6 03            [ 1] 2011         ld a,(db,x)
      008B5A 90 97            [ 1] 2012         ld yl,a 
      008B5C E6 00            [ 1] 2013         ld a,(dc,x)
      008B5E 90 42            [ 4] 2014         mul y,a  ; b*c 
                                   2015         ;;; do the partial sum 
      008B60 72 F9 02         [ 2] 2016         addw y,(UD2,sp)
      008B63 4F               [ 1] 2017         clr a 
      008B64 49               [ 1] 2018         rlc a
      008B65 6B 01            [ 1] 2019         ld (UD1,sp),a 
      008B67 17 02            [ 2] 2020         ldw (UD2,sp),y 
      008B69 E6 02            [ 1] 2021         ld a,(da,x)
      008B6B 90 97            [ 1] 2022         ld yl,a 
      008B6D E6 01            [ 1] 2023         ld a,(dd,x)
      008B6F 90 42            [ 4] 2024         mul y,a   ; a*d 
                                   2025         ;; do partial sum 
      008B71 72 F9 02         [ 2] 2026         addw y,(UD2,sp)
      008B74 4F               [ 1] 2027         clr a 
      008B75 19 01            [ 1] 2028         adc a,(UD1,sp)
      008B77 6B 01            [ 1] 2029         ld (UD1,sp),a  
      008B79 17 02            [ 2] 2030         ldw (UD2,sp),y 
      008B7B E6 02            [ 1] 2031         ld a,(da,x)
      008B7D 90 97            [ 1] 2032         ld yl,a 
      008B7F E6 00            [ 1] 2033         ld a,(dc,x)
      008B81 90 42            [ 4] 2034         mul y,a  ;  a*c highest weight product 
                                   2035         ;;; do partial sum 
      008B83 72 F9 01         [ 2] 2036         addw y,(UD1,sp)
      008B86 FF               [ 2] 2037         ldw (x),y  ; udh 
      008B87 16 03            [ 2] 2038         ldw y,(UD3,sp)
      008B89 EF 02            [ 2] 2039         ldw (2,x),y  ; udl  
      008B8B 5B 04            [ 2] 2040         addw sp,#4 ; drop local variable 
      008B8D 81               [ 4] 2041         ret  
                                   2042 
                                   2043 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2044 ;       *       ( n n -- n )
                                   2045 ;       Signed multiply. Return 
                                   2046 ;       single product.
                                   2047 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000B0E                       2048         _HEADER STAR,1,"*"
      008B8E 8B 44                    1         .word LINK 
                           000B10     2         LINK=.
      008B90 01                       3         .byte 1  
      008B91 2A                       4         .ascii "*"
      008B92                          5         STAR:
      008B92 CD 8B 48         [ 4] 2049 	CALL	UMSTA
      008B95 CC 86 8F         [ 2] 2050 	JP	DROP
                                   2051 
                                   2052 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2053 ;       M*      ( n n -- d )
                                   2054 ;       Signed multiply. Return 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



                                   2055 ;       double product.
                                   2056 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000B18                       2057         _HEADER MSTAR,2,"M*"
      008B98 8B 90                    1         .word LINK 
                           000B1A     2         LINK=.
      008B9A 02                       3         .byte 2  
      008B9B 4D 2A                    4         .ascii "M*"
      008B9D                          5         MSTAR:
      008B9D CD 88 A7         [ 4] 2058         CALL	DDUP
      008BA0 CD 87 1F         [ 4] 2059         CALL	XORR
      008BA3 CD 86 D0         [ 4] 2060         CALL	ZLESS
      008BA6 CD 86 62         [ 4] 2061         CALL	TOR
      008BA9 CD 89 6C         [ 4] 2062         CALL	ABSS
      008BAC CD 86 A9         [ 4] 2063         CALL	SWAPP
      008BAF CD 89 6C         [ 4] 2064         CALL	ABSS
      008BB2 CD 8B 48         [ 4] 2065         CALL	UMSTA
      008BB5 CD 85 B4         [ 4] 2066         CALL	RFROM
      008BB8 CD 85 18         [ 4] 2067         CALL	QBRAN
      008BBB 8B C0                 2068         .word	MSTA1
      008BBD CD 89 18         [ 4] 2069         CALL	DNEGA
      008BC0 81               [ 4] 2070 MSTA1:	RET
                                   2071 
                                   2072 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2073 ;       */MOD   ( n1 n2 n3 -- r q )
                                   2074 ;       Multiply n1 and n2, then divide
                                   2075 ;       by n3. Return mod and quotient.
                                   2076 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000B41                       2077         _HEADER SSMOD,5,"*/MOD"
      008BC1 8B 9A                    1         .word LINK 
                           000B43     2         LINK=.
      008BC3 05                       3         .byte 5  
      008BC4 2A 2F 4D 4F 44           4         .ascii "*/MOD"
      008BC9                          5         SSMOD:
      008BC9 CD 86 62         [ 4] 2078         CALL     TOR
      008BCC CD 8B 9D         [ 4] 2079         CALL     MSTAR
      008BCF CD 85 B4         [ 4] 2080         CALL     RFROM
      008BD2 CC 8A 97         [ 2] 2081         JP     MSMOD
                                   2082 
                                   2083 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2084 ;       */      ( n1 n2 n3 -- q )
                                   2085 ;       Multiply n1 by n2, then divide
                                   2086 ;       by n3. Return quotient only.
                                   2087 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000B55                       2088         _HEADER STASL,2,"*/"
      008BD5 8B C3                    1         .word LINK 
                           000B57     2         LINK=.
      008BD7 02                       3         .byte 2  
      008BD8 2A 2F                    4         .ascii "*/"
      008BDA                          5         STASL:
      008BDA CD 8B C9         [ 4] 2089         CALL	SSMOD
      008BDD CD 86 A9         [ 4] 2090         CALL	SWAPP
      008BE0 CC 86 8F         [ 2] 2091         JP	DROP
                                   2092 
                                   2093 ;; Miscellaneous
                                   2094 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



                                   2095 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2096 ;       CELL+   ( a -- a )
                                   2097 ;       Add cell size in byte to address.
                                   2098 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000B63                       2099         _HEADER CELLP,2,"2+"
      008BE3 8B D7                    1         .word LINK 
                           000B65     2         LINK=.
      008BE5 02                       3         .byte 2  
      008BE6 32 2B                    4         .ascii "2+"
      008BE8                          5         CELLP:
      008BE8 90 93            [ 1] 2100         LDW Y,X
      008BEA 90 FE            [ 2] 2101 	LDW Y,(Y)
      008BEC 72 A9 00 02      [ 2] 2102         ADDW Y,#CELLL 
      008BF0 FF               [ 2] 2103         LDW (X),Y
      008BF1 81               [ 4] 2104         RET
                                   2105 
                                   2106 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2107 ;       CELL-   ( a -- a )
                                   2108 ;       Subtract 2 from address.
                                   2109 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000B72                       2110         _HEADER CELLM,2,"2-"
      008BF2 8B E5                    1         .word LINK 
                           000B74     2         LINK=.
      008BF4 02                       3         .byte 2  
      008BF5 32 2D                    4         .ascii "2-"
      008BF7                          5         CELLM:
      008BF7 90 93            [ 1] 2111         LDW Y,X
      008BF9 90 FE            [ 2] 2112 	LDW Y,(Y)
      008BFB 72 A2 00 02      [ 2] 2113         SUBW Y,#CELLL
      008BFF FF               [ 2] 2114         LDW (X),Y
      008C00 81               [ 4] 2115         RET
                                   2116 
                                   2117 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2118 ;       CELLS   ( n -- n )
                                   2119 ;       Multiply tos by 2.
                                   2120 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000B81                       2121         _HEADER CELLS,2,"2*"
      008C01 8B F4                    1         .word LINK 
                           000B83     2         LINK=.
      008C03 02                       3         .byte 2  
      008C04 32 2A                    4         .ascii "2*"
      008C06                          5         CELLS:
      008C06 90 93            [ 1] 2122         LDW Y,X
      008C08 90 FE            [ 2] 2123 	LDW Y,(Y)
      008C0A 90 58            [ 2] 2124         SLAW Y
      008C0C FF               [ 2] 2125         LDW (X),Y
      008C0D 81               [ 4] 2126         RET
                                   2127 
                                   2128 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2129 ;       1+      ( a -- a )
                                   2130 ;       Add cell size in byte 
                                   2131 ;       to address.
                                   2132 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000B8E                       2133         _HEADER ONEP,2,"1+"
      008C0E 8C 03                    1         .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



                           000B90     2         LINK=.
      008C10 02                       3         .byte 2  
      008C11 31 2B                    4         .ascii "1+"
      008C13                          5         ONEP:
      008C13 90 93            [ 1] 2134         LDW Y,X
      008C15 90 FE            [ 2] 2135 	LDW Y,(Y)
      008C17 90 5C            [ 1] 2136         INCW Y
      008C19 FF               [ 2] 2137         LDW (X),Y
      008C1A 81               [ 4] 2138         RET
                                   2139 
                                   2140 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2141 ;       1-      ( a -- a )
                                   2142 ;       Subtract 2 from address.
                                   2143 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000B9B                       2144         _HEADER ONEM,2,"1-"
      008C1B 8C 10                    1         .word LINK 
                           000B9D     2         LINK=.
      008C1D 02                       3         .byte 2  
      008C1E 31 2D                    4         .ascii "1-"
      008C20                          5         ONEM:
      008C20 90 93            [ 1] 2145         LDW Y,X
      008C22 90 FE            [ 2] 2146 	LDW Y,(Y)
      008C24 90 5A            [ 2] 2147         DECW Y
      008C26 FF               [ 2] 2148         LDW (X),Y
      008C27 81               [ 4] 2149         RET
                                   2150 
                                   2151 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2152 ;  shift left n times 
                                   2153 ; LSHIFT ( n1 n2 -- n1<<n2 )
                                   2154 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000BA8                       2155         _HEADER LSHIFT,6,"LSHIFT"
      008C28 8C 1D                    1         .word LINK 
                           000BAA     2         LINK=.
      008C2A 06                       3         .byte 6  
      008C2B 4C 53 48 49 46 54        4         .ascii "LSHIFT"
      008C31                          5         LSHIFT:
      008C31 E6 01            [ 1] 2156         ld a,(1,x)
      008C33 1C 00 02         [ 2] 2157         addw x,#CELLL 
      008C36 90 93            [ 1] 2158         ldw y,x 
      008C38 90 FE            [ 2] 2159         ldw y,(y)
      008C3A                       2160 LSHIFT1:
      008C3A 4D               [ 1] 2161         tnz a 
      008C3B 27 05            [ 1] 2162         jreq LSHIFT4 
      008C3D 90 58            [ 2] 2163         sllw y 
      008C3F 4A               [ 1] 2164         dec a 
      008C40 20 F8            [ 2] 2165         jra LSHIFT1 
      008C42                       2166 LSHIFT4:
      008C42 FF               [ 2] 2167         ldw (x),y 
      008C43 81               [ 4] 2168         ret 
                                   2169 
                                   2170 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2171 ; shift right n times                 
                                   2172 ; RSHIFT (n1 n2 -- n1>>n2 )
                                   2173 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000BC4                       2174         _HEADER RSHIFT,6,"RSHIFT"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



      008C44 8C 2A                    1         .word LINK 
                           000BC6     2         LINK=.
      008C46 06                       3         .byte 6  
      008C47 52 53 48 49 46 54        4         .ascii "RSHIFT"
      008C4D                          5         RSHIFT:
      008C4D E6 01            [ 1] 2175         ld a,(1,x)
      008C4F 1C 00 02         [ 2] 2176         addw x,#CELLL 
      008C52 90 93            [ 1] 2177         ldw y,x 
      008C54 90 FE            [ 2] 2178         ldw y,(y)
      008C56                       2179 RSHIFT1:
      008C56 4D               [ 1] 2180         tnz a 
      008C57 27 05            [ 1] 2181         jreq RSHIFT4 
      008C59 90 54            [ 2] 2182         srlw y 
      008C5B 4A               [ 1] 2183         dec a 
      008C5C 20 F8            [ 2] 2184         jra RSHIFT1 
      008C5E                       2185 RSHIFT4:
      008C5E FF               [ 2] 2186         ldw (x),y 
      008C5F 81               [ 4] 2187         ret 
                                   2188 
                                   2189 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2190 ;       2/      ( n -- n )
                                   2191 ;       divide  tos by 2.
                                   2192 ;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000BE0                       2193         _HEADER TWOSL,2,"2/"
      008C60 8C 46                    1         .word LINK 
                           000BE2     2         LINK=.
      008C62 02                       3         .byte 2  
      008C63 32 2F                    4         .ascii "2/"
      008C65                          5         TWOSL:
      008C65 90 93            [ 1] 2194         LDW Y,X
      008C67 90 FE            [ 2] 2195 	LDW Y,(Y)
      008C69 90 57            [ 2] 2196         SRAW Y
      008C6B FF               [ 2] 2197         LDW (X),Y
      008C6C 81               [ 4] 2198         RET
                                   2199 
                                   2200 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2201 ;       BL      ( -- 32 )
                                   2202 ;       Return 32,  blank character.
                                   2203 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000BED                       2204         _HEADER BLANK,2,"BL"
      008C6D 8C 62                    1         .word LINK 
                           000BEF     2         LINK=.
      008C6F 02                       3         .byte 2  
      008C70 42 4C                    4         .ascii "BL"
      008C72                          5         BLANK:
      008C72 1D 00 02         [ 2] 2205         SUBW X,#2
      008C75 90 AE 00 20      [ 2] 2206 	LDW Y,#32
      008C79 FF               [ 2] 2207         LDW (X),Y
      008C7A 81               [ 4] 2208         RET
                                   2209 
                                   2210 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2211 ;         0     ( -- 0)
                                   2212 ;         Return 0.
                                   2213 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000BFB                       2214         _HEADER ZERO,1,"0"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



      008C7B 8C 6F                    1         .word LINK 
                           000BFD     2         LINK=.
      008C7D 01                       3         .byte 1  
      008C7E 30                       4         .ascii "0"
      008C7F                          5         ZERO:
      008C7F 1D 00 02         [ 2] 2215         SUBW X,#2
      008C82 90 5F            [ 1] 2216 	CLRW Y
      008C84 FF               [ 2] 2217         LDW (X),Y
      008C85 81               [ 4] 2218         RET
                                   2219 
                                   2220 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2221 ;         1     ( -- 1)
                                   2222 ;         Return 1.
                                   2223 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000C06                       2224         _HEADER ONE,1,"1"
      008C86 8C 7D                    1         .word LINK 
                           000C08     2         LINK=.
      008C88 01                       3         .byte 1  
      008C89 31                       4         .ascii "1"
      008C8A                          5         ONE:
      008C8A 1D 00 02         [ 2] 2225         SUBW X,#2
      008C8D 90 AE 00 01      [ 2] 2226 	LDW Y,#1
      008C91 FF               [ 2] 2227         LDW (X),Y
      008C92 81               [ 4] 2228         RET
                                   2229 
                                   2230 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2231 ;         -1    ( -- -1)
                                   2232 ;   Return -1
                                   2233 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000C13                       2234         _HEADER MONE,2,"-1"
      008C93 8C 88                    1         .word LINK 
                           000C15     2         LINK=.
      008C95 02                       3         .byte 2  
      008C96 2D 31                    4         .ascii "-1"
      008C98                          5         MONE:
      008C98 1D 00 02         [ 2] 2235         SUBW X,#2
      008C9B 90 AE FF FF      [ 2] 2236 	LDW Y,#0xFFFF
      008C9F FF               [ 2] 2237         LDW (X),Y
      008CA0 81               [ 4] 2238         RET
                                   2239 
                                   2240 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2241 ;       >CHAR   ( c -- c )
                                   2242 ;       Filter non-printing characters.
                                   2243 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000C21                       2244         _HEADER TCHAR,5,">CHAR"
      008CA1 8C 95                    1         .word LINK 
                           000C23     2         LINK=.
      008CA3 05                       3         .byte 5  
      008CA4 3E 43 48 41 52           4         .ascii ">CHAR"
      008CA9                          5         TCHAR:
      008CA9 E6 01            [ 1] 2245         ld a,(1,x)
      008CAB A1 20            [ 1] 2246         cp a,#32  
      008CAD 2B 05            [ 1] 2247         jrmi 1$ 
      008CAF A1 7F            [ 1] 2248         cp a,#127 
      008CB1 2A 01            [ 1] 2249         jrpl 1$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



      008CB3 81               [ 4] 2250         ret 
      008CB4 A6 5F            [ 1] 2251 1$:     ld a,#'_ 
      008CB6 E7 01            [ 1] 2252         ld (1,x),a 
      008CB8 81               [ 4] 2253         ret 
                                   2254 
                                   2255 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2256 ;       DEPTH   ( -- n )
                                   2257 ;       Return  depth of  data stack.
                                   2258 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000C39                       2259         _HEADER DEPTH,5,"DEPTH"
      008CB9 8C A3                    1         .word LINK 
                           000C3B     2         LINK=.
      008CBB 05                       3         .byte 5  
      008CBC 44 45 50 54 48           4         .ascii "DEPTH"
      008CC1                          5         DEPTH:
      008CC1 90 BE 2C         [ 2] 2260         LDW Y,SP0    ;save data stack ptr
      008CC4 BF 24            [ 2] 2261 	LDW XTEMP,X
      008CC6 72 B2 00 24      [ 2] 2262         SUBW Y,XTEMP     ;#bytes = SP0 - X
      008CCA 90 57            [ 2] 2263         SRAW Y    ;Y = #stack items
      008CCC 1D 00 02         [ 2] 2264 	SUBW X,#2
      008CCF FF               [ 2] 2265         LDW (X),Y     ; if neg, underflow
      008CD0 81               [ 4] 2266         RET
                                   2267 
                                   2268 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2269 ;       PICK    ( ... +n -- ... w )
                                   2270 ;       Copy  nth stack item to tos.
                                   2271 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000C51                       2272         _HEADER PICK,4,"PICK"
      008CD1 8C BB                    1         .word LINK 
                           000C53     2         LINK=.
      008CD3 04                       3         .byte 4  
      008CD4 50 49 43 4B              4         .ascii "PICK"
      008CD8                          5         PICK:
      008CD8 90 93            [ 1] 2273         LDW Y,X   ;D = n1
      008CDA 90 FE            [ 2] 2274         LDW Y,(Y)
                                   2275 ; modified for standard compliance          
                                   2276 ; 0 PICK must be equivalent to DUP 
      008CDC 90 5C            [ 1] 2277         INCW Y 
      008CDE 90 58            [ 2] 2278         SLAW Y
      008CE0 BF 24            [ 2] 2279         LDW XTEMP,X
      008CE2 72 B9 00 24      [ 2] 2280         ADDW Y,XTEMP
      008CE6 90 FE            [ 2] 2281         LDW Y,(Y)
      008CE8 FF               [ 2] 2282         LDW (X),Y
      008CE9 81               [ 4] 2283         RET
                                   2284 
                                   2285 ;; Memory access
                                   2286 
                                   2287 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2288 ;       +!      ( n a -- )
                                   2289 ;       Add n to  contents at 
                                   2290 ;       address a.
                                   2291 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000C6A                       2292         _HEADER PSTOR,2,"+!"
      008CEA 8C D3                    1         .word LINK 
                           000C6C     2         LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



      008CEC 02                       3         .byte 2  
      008CED 2B 21                    4         .ascii "+!"
      008CEF                          5         PSTOR:
      008CEF 90 93            [ 1] 2293         ldw y,x 
      008CF1 90 FE            [ 2] 2294         ldw y,(y)
      008CF3 90 BF 26         [ 2] 2295         ldw YTEMP,y  ; address
      008CF6 90 FE            [ 2] 2296         ldw y,(y)  
      008CF8 90 89            [ 2] 2297         pushw y  ; value at address 
      008CFA 90 93            [ 1] 2298         ldw y,x 
      008CFC 90 EE 02         [ 2] 2299         ldw y,(2,y) ; n 
      008CFF 72 F9 01         [ 2] 2300         addw y,(1,sp) ; n+value
      008D02 91 CF 26         [ 5] 2301         ldw [YTEMP],y ;  a!
      008D05 90 85            [ 2] 2302         popw y    ;drop local var
      008D07 1C 00 04         [ 2] 2303         addw x,#4 ; DDROP 
      008D0A 81               [ 4] 2304         ret 
                                   2305 
                                   2306 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2307 ;       2!      ( d a -- )
                                   2308 ;       Store  double integer 
                                   2309 ;       to address a.
                                   2310 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000C8B                       2311         _HEADER DSTOR,2,"2!"
      008D0B 8C EC                    1         .word LINK 
                           000C8D     2         LINK=.
      008D0D 02                       3         .byte 2  
      008D0E 32 21                    4         .ascii "2!"
      008D10                          5         DSTOR:
      008D10 90 93            [ 1] 2312         LDW Y,X 
      008D12 89               [ 2] 2313         PUSHW X 
      008D13 FE               [ 2] 2314         LDW X,(X) ; a 
      008D14 90 EE 02         [ 2] 2315         LDW Y,(2,Y) ; dhi 
      008D17 FF               [ 2] 2316         LDW (X),Y 
      008D18 16 01            [ 2] 2317         LDW Y,(1,SP)  
      008D1A 90 EE 04         [ 2] 2318         LDW Y,(4,Y) ; dlo 
      008D1D EF 02            [ 2] 2319         LDW (2,X),Y  
      008D1F 85               [ 2] 2320         POPW X 
      008D20 1C 00 06         [ 2] 2321         ADDW X,#3*CELLL 
      008D23 81               [ 4] 2322         RET 
                                   2323 
                                   2324 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2325 ;       2@      ( a -- d )
                                   2326 ;       Fetch double integer 
                                   2327 ;       from address a.
                                   2328 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000CA4                       2329         _HEADER DAT,2,"2@"
      008D24 8D 0D                    1         .word LINK 
                           000CA6     2         LINK=.
      008D26 02                       3         .byte 2  
      008D27 32 40                    4         .ascii "2@"
      008D29                          5         DAT:
      008D29 90 93            [ 1] 2330         ldw y,x 
      008D2B 1D 00 02         [ 2] 2331         subw x,#CELLL 
      008D2E 90 FE            [ 2] 2332         ldw y,(y) ;address 
      008D30 90 89            [ 2] 2333         pushw y  
      008D32 90 FE            [ 2] 2334         ldw y,(y) ; dhi 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



      008D34 FF               [ 2] 2335         ldw (x),y 
      008D35 90 85            [ 2] 2336         popw y 
      008D37 90 EE 02         [ 2] 2337         ldw y,(2,y) ; dlo 
      008D3A EF 02            [ 2] 2338         ldw (2,x),y 
      008D3C 81               [ 4] 2339         ret 
                                   2340 
                                   2341 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2342 ;       COUNT   ( b -- b +n )
                                   2343 ;       Return count byte of a string
                                   2344 ;       and add 1 to byte address.
                                   2345 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000CBD                       2346         _HEADER COUNT,5,"COUNT"
      008D3D 8D 26                    1         .word LINK 
                           000CBF     2         LINK=.
      008D3F 05                       3         .byte 5  
      008D40 43 4F 55 4E 54           4         .ascii "COUNT"
      008D45                          5         COUNT:
      008D45 90 93            [ 1] 2347         ldw y,x 
      008D47 90 FE            [ 2] 2348         ldw y,(y) ; address 
      008D49 90 F6            [ 1] 2349         ld a,(y)  ; count 
      008D4B 90 5C            [ 1] 2350         incw y 
      008D4D FF               [ 2] 2351         ldw (x),y 
      008D4E 1D 00 02         [ 2] 2352         subw x,#CELLL 
      008D51 E7 01            [ 1] 2353         ld (1,x),a 
      008D53 7F               [ 1] 2354         clr (x)
      008D54 81               [ 4] 2355         ret 
                                   2356 
                                   2357 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2358 ;       HERE    ( -- a )
                                   2359 ;       Return  top of  variables
                                   2360 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000CD5                       2361         _HEADER HERE,4,"HERE"
      008D55 8D 3F                    1         .word LINK 
                           000CD7     2         LINK=.
      008D57 04                       3         .byte 4  
      008D58 48 45 52 45              4         .ascii "HERE"
      008D5C                          5         HERE:
      008D5C 90 AE 00 18      [ 2] 2362       	ldw y,#UVP 
      008D60 90 FE            [ 2] 2363         ldw y,(y)
      008D62 1D 00 02         [ 2] 2364         subw x,#CELLL 
      008D65 FF               [ 2] 2365         ldw (x),y 
      008D66 81               [ 4] 2366         ret 
                                   2367 
                                   2368 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2369 ;       PAD     ( -- a )
                                   2370 ;       Return address of text buffer
                                   2371 ;       above  code dictionary.
                                   2372 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000CE7                       2373         _HEADER PAD,3,"PAD"
      008D67 8D 57                    1         .word LINK 
                           000CE9     2         LINK=.
      008D69 03                       3         .byte 3  
      008D6A 50 41 44                 4         .ascii "PAD"
      008D6D                          5         PAD:
      008D6D CD 8D 5C         [ 4] 2374         CALL     HERE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



      000CF0                       2375         _DOLIT   80
      008D70 CD 84 EF         [ 4]    1     CALL DOLIT 
      008D73 00 50                    2     .word 80 
      008D75 CC 88 BC         [ 2] 2376         JP     PLUS
                                   2377 
                                   2378 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2379 ;       TIB     ( -- a )
                                   2380 ;       Return address of 
                                   2381 ;       terminal input buffer.
                                   2382 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000CF8                       2383         _HEADER TIB,3,"TIB"
      008D78 8D 69                    1         .word LINK 
                           000CFA     2         LINK=.
      008D7A 03                       3         .byte 3  
      008D7B 54 49 42                 4         .ascii "TIB"
      008D7E                          5         TIB:
      008D7E CD 87 8D         [ 4] 2384         CALL     NTIB
      008D81 CD 8B E8         [ 4] 2385         CALL     CELLP
      008D84 CC 85 63         [ 2] 2386         JP     AT
                                   2387 
                                   2388 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2389 ;       @EXECUTE        ( a -- )
                                   2390 ;       Execute vector stored in 
                                   2391 ;       address a.
                                   2392 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000D07                       2393         _HEADER ATEXE,8,"@EXECUTE"
      008D87 8D 7A                    1         .word LINK 
                           000D09     2         LINK=.
      008D89 08                       3         .byte 8  
      008D8A 40 45 58 45 43 55 54     4         .ascii "@EXECUTE"
             45
      008D92                          5         ATEXE:
      008D92 CD 85 63         [ 4] 2394         CALL     AT
      008D95 CD 88 4C         [ 4] 2395         CALL     QDUP    ;?address or zero
      008D98 CD 85 18         [ 4] 2396         CALL     QBRAN
      008D9B 8D A0                 2397         .word      EXE1
      008D9D CD 85 44         [ 4] 2398         CALL     EXECU   ;execute if non-zero
      008DA0 81               [ 4] 2399 EXE1:   RET     ;do nothing if zero
                                   2400 
                                   2401 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2402 ;       CMOVE   ( b1 b2 u -- )
                                   2403 ;       Copy u bytes from b1 to b2.
                                   2404 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000D21                       2405         _HEADER CMOVE,5,"CMOVE"
      008DA1 8D 89                    1         .word LINK 
                           000D23     2         LINK=.
      008DA3 05                       3         .byte 5  
      008DA4 43 4D 4F 56 45           4         .ascii "CMOVE"
      008DA9                          5         CMOVE:
      008DA9 CD 86 62         [ 4] 2406         CALL	TOR
      008DAC CD 85 34         [ 4] 2407         CALL	BRAN
      008DAF 8D C9                 2408         .word	CMOV2
      008DB1 CD 86 62         [ 4] 2409 CMOV1:	CALL	TOR
      008DB4 CD 86 99         [ 4] 2410         CALL	DUPP
      008DB7 CD 85 81         [ 4] 2411         CALL	CAT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



      008DBA CD 85 C5         [ 4] 2412         CALL	RAT
      008DBD CD 85 70         [ 4] 2413         CALL	CSTOR
      008DC0 CD 8C 13         [ 4] 2414         CALL	ONEP
      008DC3 CD 85 B4         [ 4] 2415         CALL	RFROM
      008DC6 CD 8C 13         [ 4] 2416         CALL	ONEP
      008DC9 CD 85 03         [ 4] 2417 CMOV2:	CALL	DONXT
      008DCC 8D B1                 2418         .word	CMOV1
      008DCE CC 88 9C         [ 2] 2419         JP	DDROP
                                   2420 
                                   2421 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2422 ;       FILL    ( b u c -- )
                                   2423 ;       Fill u bytes of character c
                                   2424 ;       to area beginning at b.
                                   2425 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000D51                       2426         _HEADER FILL,4,"FILL"
      008DD1 8D A3                    1         .word LINK 
                           000D53     2         LINK=.
      008DD3 04                       3         .byte 4  
      008DD4 46 49 4C 4C              4         .ascii "FILL"
      008DD8                          5         FILL:
      008DD8 90 93            [ 1] 2427         ldw y,x 
      008DDA 90 E6 01         [ 1] 2428         ld a,(1,y) ; c 
      008DDD 1C 00 02         [ 2] 2429         addw x,#CELLL ; drop c 
      008DE0 90 93            [ 1] 2430         ldw y,x 
      008DE2 90 FE            [ 2] 2431         ldw y,(y) ; count
      008DE4 90 89            [ 2] 2432         pushw y 
      008DE6 1C 00 02         [ 2] 2433         addw x,#CELLL ; drop u 
      008DE9 90 93            [ 1] 2434         ldw y,x 
      008DEB 1C 00 02         [ 2] 2435         addw x,#CELLL ; drop b 
      008DEE 90 FE            [ 2] 2436         ldw y,(y) ; address
      008DF0 90 BF 26         [ 2] 2437         ldw YTEMP,y
      008DF3 90 85            [ 2] 2438         popw y ; count 
      008DF5                       2439 FILL1:  
      008DF5 92 C7 26         [ 4] 2440         ld [YTEMP],a 
      008DF8 3C 27            [ 1] 2441         inc YTEMP+1
      008DFA 24 02            [ 1] 2442         jrnc FILL2 
      008DFC 3C 26            [ 1] 2443         inc YTEMP
      008DFE                       2444 FILL2: 
      008DFE 90 5A            [ 2] 2445         decw y ; count 
      008E00 26 F3            [ 1] 2446         jrne FILL1  
      008E02 81               [ 4] 2447         ret 
                                   2448 
                                   2449 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2450 ;       ERASE   ( b u -- )
                                   2451 ;       Erase u bytes beginning at b.
                                   2452 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000D83                       2453         _HEADER ERASE,5,"ERASE"
      008E03 8D D3                    1         .word LINK 
                           000D85     2         LINK=.
      008E05 05                       3         .byte 5  
      008E06 45 52 41 53 45           4         .ascii "ERASE"
      008E0B                          5         ERASE:
      008E0B 90 5F            [ 1] 2454         clrw y 
      008E0D 1D 00 02         [ 2] 2455         subw x,#CELLL 
      008E10 FF               [ 2] 2456         ldw (x),y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



      008E11 CC 8D D8         [ 2] 2457         jp FILL 
                                   2458 
                                   2459 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2460 ;       PACK0   ( b u a -- a )
                                   2461 ;       Build a counted string with
                                   2462 ;       u characters from b. Null fill.
                                   2463 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000D94                       2464         _HEADER PACKS,5,"PACK0"
      008E14 8E 05                    1         .word LINK 
                           000D96     2         LINK=.
      008E16 05                       3         .byte 5  
      008E17 50 41 43 4B 30           4         .ascii "PACK0"
      008E1C                          5         PACKS:
      008E1C CD 86 99         [ 4] 2465         CALL     DUPP
      008E1F CD 86 62         [ 4] 2466         CALL     TOR     ;strings only on cell boundary
      008E22 CD 88 A7         [ 4] 2467         CALL     DDUP
      008E25 CD 85 70         [ 4] 2468         CALL     CSTOR
      008E28 CD 8C 13         [ 4] 2469         CALL     ONEP ;save count
      008E2B CD 86 A9         [ 4] 2470         CALL     SWAPP
      008E2E CD 8D A9         [ 4] 2471         CALL     CMOVE
      008E31 CD 85 B4         [ 4] 2472         CALL     RFROM
      008E34 81               [ 4] 2473         RET
                                   2474 
                                   2475 ;; Numeric output, single precision
                                   2476 
                                   2477 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2478 ;       DIGIT   ( u -- c )
                                   2479 ;       Convert digit u to a character.
                                   2480 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000DB5                       2481         _HEADER DIGIT,5,"DIGIT"
      008E35 8E 16                    1         .word LINK 
                           000DB7     2         LINK=.
      008E37 05                       3         .byte 5  
      008E38 44 49 47 49 54           4         .ascii "DIGIT"
      008E3D                          5         DIGIT:
      008E3D CD 84 EF         [ 4] 2482         CALL	DOLIT
      008E40 00 09                 2483         .word	9
      008E42 CD 86 C1         [ 4] 2484         CALL	OVER
      008E45 CD 89 A6         [ 4] 2485         CALL	LESS
      008E48 CD 84 EF         [ 4] 2486         CALL	DOLIT
      008E4B 00 07                 2487         .word	7
      008E4D CD 86 F6         [ 4] 2488         CALL	ANDD
      008E50 CD 88 BC         [ 4] 2489         CALL	PLUS
      008E53 CD 84 EF         [ 4] 2490         CALL	DOLIT
      008E56 00 30                 2491         .word	48	;'0'
      008E58 CC 88 BC         [ 2] 2492         JP	PLUS
                                   2493 
                                   2494 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2495 ;       EXTRACT ( n base -- n c )
                                   2496 ;       Extract least significant 
                                   2497 ;       digit from n.
                                   2498 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000DDB                       2499         _HEADER EXTRC,7,"EXTRACT"
      008E5B 8E 37                    1         .word LINK 
                           000DDD     2         LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



      008E5D 07                       3         .byte 7  
      008E5E 45 58 54 52 41 43 54     4         .ascii "EXTRACT"
      008E65                          5         EXTRC:
      008E65 CD 8C 7F         [ 4] 2500         CALL     ZERO
      008E68 CD 86 A9         [ 4] 2501         CALL     SWAPP
      008E6B CD 8A 31         [ 4] 2502         CALL     UMMOD
      008E6E CD 86 A9         [ 4] 2503         CALL     SWAPP
      008E71 CC 8E 3D         [ 2] 2504         JP     DIGIT
                                   2505 
                                   2506 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2507 ;       <#      ( -- )
                                   2508 ;       Initiate  numeric 
                                   2509 ;       output process.
                                   2510 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000DF4                       2511         _HEADER BDIGS,2,"#<"
      008E74 8E 5D                    1         .word LINK 
                           000DF6     2         LINK=.
      008E76 02                       3         .byte 2  
      008E77 23 3C                    4         .ascii "#<"
      008E79                          5         BDIGS:
      008E79 CD 8D 6D         [ 4] 2512         CALL     PAD
      008E7C CD 87 CF         [ 4] 2513         CALL     HLD
      008E7F CC 85 51         [ 2] 2514         JP     STORE
                                   2515 
                                   2516 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2517 ;       HOLD    ( c -- )
                                   2518 ;       Insert a character 
                                   2519 ;       into output string.
                                   2520 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000E02                       2521         _HEADER HOLD,4,"HOLD"
      008E82 8E 76                    1         .word LINK 
                           000E04     2         LINK=.
      008E84 04                       3         .byte 4  
      008E85 48 4F 4C 44              4         .ascii "HOLD"
      008E89                          5         HOLD:
      008E89 CD 87 CF         [ 4] 2522         CALL     HLD
      008E8C CD 85 63         [ 4] 2523         CALL     AT
      008E8F CD 8C 20         [ 4] 2524         CALL     ONEM
      008E92 CD 86 99         [ 4] 2525         CALL     DUPP
      008E95 CD 87 CF         [ 4] 2526         CALL     HLD
      008E98 CD 85 51         [ 4] 2527         CALL     STORE
      008E9B CC 85 70         [ 2] 2528         JP     CSTOR
                                   2529 
                                   2530 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2531 ;       #       ( u -- u )
                                   2532 ;       Extract one digit from u and
                                   2533 ;       append digit to output string.
                                   2534 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000E1E                       2535         _HEADER DIG,1,"#"
      008E9E 8E 84                    1         .word LINK 
                           000E20     2         LINK=.
      008EA0 01                       3         .byte 1  
      008EA1 23                       4         .ascii "#"
      008EA2                          5         DIG:
      008EA2 CD 87 5F         [ 4] 2536         CALL     BASE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



      008EA5 CD 85 63         [ 4] 2537         CALL     AT
      008EA8 CD 8E 65         [ 4] 2538         CALL     EXTRC
      008EAB CC 8E 89         [ 2] 2539         JP     HOLD
                                   2540 
                                   2541 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2542 ;       #S      ( u -- 0 )
                                   2543 ;       Convert u until all digits
                                   2544 ;       are added to output string.
                                   2545 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000E2E                       2546         _HEADER DIGS,2,"#S"
      008EAE 8E A0                    1         .word LINK 
                           000E30     2         LINK=.
      008EB0 02                       3         .byte 2  
      008EB1 23 53                    4         .ascii "#S"
      008EB3                          5         DIGS:
      008EB3 CD 8E A2         [ 4] 2547 DIGS1:  CALL     DIG
      008EB6 CD 86 99         [ 4] 2548         CALL     DUPP
      008EB9 CD 85 18         [ 4] 2549         CALL     QBRAN
      008EBC 8E C0                 2550         .word      DIGS2
      008EBE 20 F3            [ 2] 2551         JRA     DIGS1
      008EC0 81               [ 4] 2552 DIGS2:  RET
                                   2553 
                                   2554 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2555 ;       SIGN    ( n -- )
                                   2556 ;       Add a minus sign to
                                   2557 ;       numeric output string.
                                   2558 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000E41                       2559         _HEADER SIGN,4,"SIGN"
      008EC1 8E B0                    1         .word LINK 
                           000E43     2         LINK=.
      008EC3 04                       3         .byte 4  
      008EC4 53 49 47 4E              4         .ascii "SIGN"
      008EC8                          5         SIGN:
      008EC8 CD 86 D0         [ 4] 2560         CALL     ZLESS
      008ECB CD 85 18         [ 4] 2561         CALL     QBRAN
      008ECE 8E D8                 2562         .word      SIGN1
      008ED0 CD 84 EF         [ 4] 2563         CALL     DOLIT
      008ED3 00 2D                 2564         .word      45	;"-"
      008ED5 CC 8E 89         [ 2] 2565         JP     HOLD
      008ED8 81               [ 4] 2566 SIGN1:  RET
                                   2567 
                                   2568 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2569 ;       #>      ( w -- b u )
                                   2570 ;       Prepare output string.
                                   2571 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000E59                       2572         _HEADER EDIGS,2,"#>"
      008ED9 8E C3                    1         .word LINK 
                           000E5B     2         LINK=.
      008EDB 02                       3         .byte 2  
      008EDC 23 3E                    4         .ascii "#>"
      008EDE                          5         EDIGS:
      008EDE CD 86 8F         [ 4] 2573         CALL     DROP
      008EE1 CD 87 CF         [ 4] 2574         CALL     HLD
      008EE4 CD 85 63         [ 4] 2575         CALL     AT
      008EE7 CD 8D 6D         [ 4] 2576         CALL     PAD
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



      008EEA CD 86 C1         [ 4] 2577         CALL     OVER
      008EED CC 89 52         [ 2] 2578         JP     SUBB
                                   2579 
                                   2580 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2581 ;       str     ( w -- b u )
                                   2582 ;       Convert a signed integer
                                   2583 ;       to a numeric string.
                                   2584 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000E70                       2585         _HEADER STR,3,"STR"
      008EF0 8E DB                    1         .word LINK 
                           000E72     2         LINK=.
      008EF2 03                       3         .byte 3  
      008EF3 53 54 52                 4         .ascii "STR"
      008EF6                          5         STR:
      008EF6 CD 86 99         [ 4] 2586         CALL     DUPP
      008EF9 CD 86 62         [ 4] 2587         CALL     TOR
      008EFC CD 89 6C         [ 4] 2588         CALL     ABSS
      008EFF CD 8E 79         [ 4] 2589         CALL     BDIGS
      008F02 CD 8E B3         [ 4] 2590         CALL     DIGS
      008F05 CD 85 B4         [ 4] 2591         CALL     RFROM
      008F08 CD 8E C8         [ 4] 2592         CALL     SIGN
      008F0B CC 8E DE         [ 2] 2593         JP     EDIGS
                                   2594 
                                   2595 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2596 ;       HEX     ( -- )
                                   2597 ;       Use radix 16 as base for
                                   2598 ;       numeric conversions.
                                   2599 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000E8E                       2600         _HEADER HEX,3,"HEX"
      008F0E 8E F2                    1         .word LINK 
                           000E90     2         LINK=.
      008F10 03                       3         .byte 3  
      008F11 48 45 58                 4         .ascii "HEX"
      008F14                          5         HEX:
      008F14 CD 84 EF         [ 4] 2601         CALL     DOLIT
      008F17 00 10                 2602         .word      16
      008F19 CD 87 5F         [ 4] 2603         CALL     BASE
      008F1C CC 85 51         [ 2] 2604         JP     STORE
                                   2605 
                                   2606 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2607 ;       DECIMAL ( -- )
                                   2608 ;       Use radix 10 as base
                                   2609 ;       for numeric conversions.
                                   2610 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000E9F                       2611         _HEADER DECIM,7,"DECIMAL"
      008F1F 8F 10                    1         .word LINK 
                           000EA1     2         LINK=.
      008F21 07                       3         .byte 7  
      008F22 44 45 43 49 4D 41 4C     4         .ascii "DECIMAL"
      008F29                          5         DECIM:
      008F29 CD 84 EF         [ 4] 2612         CALL     DOLIT
      008F2C 00 0A                 2613         .word      10
      008F2E CD 87 5F         [ 4] 2614         CALL     BASE
      008F31 CC 85 51         [ 2] 2615         JP     STORE
                                   2616 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



                                   2617 ;; Numeric input, single precision
                                   2618 
                                   2619 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2620 ;       DIGIT?  ( c base -- u t )
                                   2621 ;       Convert a character to its numeric
                                   2622 ;       value. A flag indicates success.
                                   2623 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000EB4                       2624         _HEADER DIGTQ,6,"DIGIT?"
      008F34 8F 21                    1         .word LINK 
                           000EB6     2         LINK=.
      008F36 06                       3         .byte 6  
      008F37 44 49 47 49 54 3F        4         .ascii "DIGIT?"
      008F3D                          5         DIGTQ:
      008F3D CD 86 62         [ 4] 2625         CALL     TOR
      008F40 CD 84 EF         [ 4] 2626         CALL     DOLIT
      008F43 00 30                 2627         .word     48	; "0"
      008F45 CD 89 52         [ 4] 2628         CALL     SUBB
      008F48 CD 84 EF         [ 4] 2629         CALL     DOLIT
      008F4B 00 09                 2630         .word      9
      008F4D CD 86 C1         [ 4] 2631         CALL     OVER
      008F50 CD 89 A6         [ 4] 2632         CALL     LESS
      008F53 CD 85 18         [ 4] 2633         CALL     QBRAN
      008F56 8F 6E                 2634         .word      DGTQ1
      008F58 CD 84 EF         [ 4] 2635         CALL     DOLIT
      008F5B 00 07                 2636         .word      7
      008F5D CD 89 52         [ 4] 2637         CALL     SUBB
      008F60 CD 86 99         [ 4] 2638         CALL     DUPP
      008F63 CD 84 EF         [ 4] 2639         CALL     DOLIT
      008F66 00 0A                 2640         .word      10
      008F68 CD 89 A6         [ 4] 2641         CALL     LESS
      008F6B CD 87 0A         [ 4] 2642         CALL     ORR
      008F6E CD 86 99         [ 4] 2643 DGTQ1:  CALL     DUPP
      008F71 CD 85 B4         [ 4] 2644         CALL     RFROM
      008F74 CC 89 90         [ 2] 2645         JP     ULESS
                                   2646 
                           000001  2647 .if  WANT_DOUBLE
                           000000  2648 .else 
                                   2649 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2650 ;       NUMBER? ( a -- n T | a F )
                                   2651 ;       Convert a number string to
                                   2652 ;       integer. Push a flag on tos.
                                   2653 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2654         _HEADER NUMBQ,7,"NUMBER?"
                                   2655         CALL     BASE
                                   2656         CALL     AT
                                   2657         CALL     TOR
                                   2658         CALL     ZERO
                                   2659         CALL     OVER
                                   2660         CALL     COUNT
                                   2661         CALL     OVER
                                   2662         CALL     CAT
                                   2663         CALL     DOLIT
                                   2664         .word     36	; "0x"
                                   2665         CALL     EQUAL
                                   2666         CALL     QBRAN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



                                   2667         .word      NUMQ1
                                   2668         CALL     HEX
                                   2669         CALL     SWAPP
                                   2670         CALL     ONEP
                                   2671         CALL     SWAPP
                                   2672         CALL     ONEM
                                   2673 NUMQ1:  CALL     OVER
                                   2674         CALL     CAT
                                   2675         CALL     DOLIT
                                   2676         .word     45	; "-"
                                   2677         CALL     EQUAL
                                   2678         CALL     TOR
                                   2679         CALL     SWAPP
                                   2680         CALL     RAT
                                   2681         CALL     SUBB
                                   2682         CALL     SWAPP
                                   2683         CALL     RAT
                                   2684         CALL     PLUS
                                   2685         CALL     QDUP
                                   2686         CALL     QBRAN
                                   2687         .word      NUMQ6
                                   2688         CALL     ONEM
                                   2689         CALL     TOR
                                   2690 NUMQ2:  CALL     DUPP
                                   2691         CALL     TOR
                                   2692         CALL     CAT
                                   2693         CALL     BASE
                                   2694         CALL     AT
                                   2695         CALL     DIGTQ
                                   2696         CALL     QBRAN
                                   2697         .word      NUMQ4
                                   2698         CALL     SWAPP
                                   2699         CALL     BASE
                                   2700         CALL     AT
                                   2701         CALL     STAR
                                   2702         CALL     PLUS
                                   2703         CALL     RFROM
                                   2704         CALL     ONEP
                                   2705         CALL     DONXT
                                   2706         .word      NUMQ2
                                   2707         CALL     RAT
                                   2708         CALL     SWAPP
                                   2709         CALL     DROP
                                   2710         CALL     QBRAN
                                   2711         .word      NUMQ3
                                   2712         CALL     NEGAT
                                   2713 NUMQ3:  CALL     SWAPP
                                   2714         JRA     NUMQ5
                                   2715 NUMQ4:  CALL     RFROM
                                   2716         CALL     RFROM
                                   2717         CALL     DDROP
                                   2718         CALL     DDROP
                                   2719         CALL     ZERO
                                   2720 NUMQ5:  CALL     DUPP
                                   2721 NUMQ6:  CALL     RFROM
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



                                   2722         CALL     DDROP
                                   2723         CALL     RFROM
                                   2724         CALL     BASE
                                   2725         JP     STORE
                                   2726 .endif ; WANT_DOUBLE  
                                   2727 
                                   2728 ;; Basic I/O
                                   2729 
                                   2730 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2731 ;       KEY     ( -- c )
                                   2732 ;       Wait for and return an
                                   2733 ;       input character.
                                   2734 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000EF7                       2735         _HEADER KEY,3,"KEY"
      008F77 8F 36                    1         .word LINK 
                           000EF9     2         LINK=.
      008F79 03                       3         .byte 3  
      008F7A 4B 45 59                 4         .ascii "KEY"
      008F7D                          5         KEY:
      008F7D 72 0B 52 30 FB   [ 2] 2736         btjf UART_SR,#UART_SR_RXNE,. 
      008F82 C6 52 31         [ 1] 2737         ld a,UART_DR 
      008F85 1D 00 02         [ 2] 2738         subw x,#CELLL 
      008F88 E7 01            [ 1] 2739         ld (1,x),a 
      008F8A 7F               [ 1] 2740         clr (x)
      008F8B 81               [ 4] 2741         ret 
                                   2742 
                                   2743 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2744 ;       NUF?    ( -- t )
                                   2745 ;       Return false if no input,
                                   2746 ;       else pause and if CR return true.
                                   2747 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000F0C                       2748         _HEADER NUFQ,4,"NUF?"
      008F8C 8F 79                    1         .word LINK 
                           000F0E     2         LINK=.
      008F8E 04                       3         .byte 4  
      008F8F 4E 55 46 3F              4         .ascii "NUF?"
      008F93                          5         NUFQ:
      008F93 CD 84 98         [ 4] 2749         CALL     QKEY
      008F96 CD 86 99         [ 4] 2750         CALL     DUPP
      008F99 CD 85 18         [ 4] 2751         CALL     QBRAN
      008F9C 8F AC                 2752         .word    NUFQ1
      008F9E CD 88 9C         [ 4] 2753         CALL     DDROP
      008FA1 CD 8F 7D         [ 4] 2754         CALL     KEY
      008FA4 CD 84 EF         [ 4] 2755         CALL     DOLIT
      008FA7 00 0D                 2756         .word      CRR
      008FA9 CC 89 7A         [ 2] 2757         JP     EQUAL
      008FAC 81               [ 4] 2758 NUFQ1:  RET
                                   2759 
                                   2760 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2761 ;       SPACE   ( -- )
                                   2762 ;       Send  blank character to
                                   2763 ;       output device.
                                   2764 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000F2D                       2765         _HEADER SPACE,5,"SPACE"
      008FAD 8F 8E                    1         .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



                           000F2F     2         LINK=.
      008FAF 05                       3         .byte 5  
      008FB0 53 50 41 43 45           4         .ascii "SPACE"
      008FB5                          5         SPACE:
      008FB5 CD 8C 72         [ 4] 2766         CALL     BLANK
      008FB8 CC 84 B6         [ 2] 2767         JP     EMIT
                                   2768 
                                   2769 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2770 ;       SPACES  ( +n -- )
                                   2771 ;       Send n spaces to output device.
                                   2772 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000F3B                       2773         _HEADER SPACS,6,"SPACES"
      008FBB 8F AF                    1         .word LINK 
                           000F3D     2         LINK=.
      008FBD 06                       3         .byte 6  
      008FBE 53 50 41 43 45 53        4         .ascii "SPACES"
      008FC4                          5         SPACS:
      008FC4 CD 8C 7F         [ 4] 2774         CALL     ZERO
      008FC7 CD 89 EB         [ 4] 2775         CALL     MAX
      008FCA CD 86 62         [ 4] 2776         CALL     TOR
      008FCD 20 03            [ 2] 2777         JRA      CHAR2
      008FCF CD 8F B5         [ 4] 2778 CHAR1:  CALL     SPACE
      008FD2 CD 85 03         [ 4] 2779 CHAR2:  CALL     DONXT
      008FD5 8F CF                 2780         .word    CHAR1
      008FD7 81               [ 4] 2781         RET
                                   2782 
                                   2783 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2784 ;       TYPE    ( b u -- )
                                   2785 ;       Output u characters from b.
                                   2786 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000F58                       2787         _HEADER TYPES,4,"TYPE"
      008FD8 8F BD                    1         .word LINK 
                           000F5A     2         LINK=.
      008FDA 04                       3         .byte 4  
      008FDB 54 59 50 45              4         .ascii "TYPE"
      008FDF                          5         TYPES:
      008FDF CD 86 62         [ 4] 2788         CALL     TOR
      008FE2 20 06            [ 2] 2789         JRA     TYPE2
      008FE4 CD 8D 45         [ 4] 2790 TYPE1:  CALL     COUNT 
      008FE7 CD 84 B6         [ 4] 2791         CALL     EMIT
      000F6A                       2792 TYPE2:  _DONXT  TYPE1
      008FEA CD 85 03         [ 4]    1     CALL DONXT 
      008FED 8F E4                    2     .word TYPE1 
      008FEF CC 86 8F         [ 2] 2793         JP     DROP
                                   2794 
                                   2795 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2796 ;       CR      ( -- )
                                   2797 ;       Output a carriage return
                                   2798 ;       and a line feed.
                                   2799 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000F72                       2800         _HEADER CR,2,"CR"
      008FF2 8F DA                    1         .word LINK 
                           000F74     2         LINK=.
      008FF4 02                       3         .byte 2  
      008FF5 43 52                    4         .ascii "CR"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



      008FF7                          5         CR:
      000F77                       2801         _DOLIT  CRR 
      008FF7 CD 84 EF         [ 4]    1     CALL DOLIT 
      008FFA 00 0D                    2     .word CRR 
      008FFC CD 84 B6         [ 4] 2802         CALL    EMIT
      000F7F                       2803         _DOLIT  LF
      008FFF CD 84 EF         [ 4]    1     CALL DOLIT 
      009002 00 0A                    2     .word LF 
      009004 CC 84 B6         [ 2] 2804         JP      EMIT
                                   2805 
                                   2806 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2807 ;       do$     ( -- a )
                                   2808 ;       Return  address of a compiled
                                   2809 ;       string.
                                   2810 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2811 ;       _HEADER DOSTR,COMPO+3,"DO$"
      009007                       2812 DOSTR:
      009007 CD 85 B4         [ 4] 2813         CALL     RFROM
      00900A CD 85 C5         [ 4] 2814         CALL     RAT
      00900D CD 85 B4         [ 4] 2815         CALL     RFROM
      009010 CD 8D 45         [ 4] 2816         CALL     COUNT
      009013 CD 88 BC         [ 4] 2817         CALL     PLUS
      009016 CD 86 62         [ 4] 2818         CALL     TOR
      009019 CD 86 A9         [ 4] 2819         CALL     SWAPP
      00901C CD 86 62         [ 4] 2820         CALL     TOR
      00901F 81               [ 4] 2821         RET
                                   2822 
                                   2823 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2824 ;       $"|     ( -- a )
                                   2825 ;       Run time routine compiled by $".
                                   2826 ;       Return address of a compiled string.
                                   2827 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2828 ;       _HEADER STRQP,COMPO+3,"$\"|"
      009020                       2829 STRQP:
      009020 CD 90 07         [ 4] 2830         CALL     DOSTR
      009023 81               [ 4] 2831         RET
                                   2832 
                                   2833 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2834 ;       ."|     ( -- )
                                   2835 ;       Run time routine of ." .
                                   2836 ;       Output a compiled string.
                                   2837 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2838 ;       _HEADER DOTQP,COMPO+3,".\"|"
      009024                       2839 DOTQP:
      009024 CD 90 07         [ 4] 2840         CALL     DOSTR
      009027 CD 8D 45         [ 4] 2841         CALL     COUNT
      00902A CC 8F DF         [ 2] 2842         JP     TYPES
                                   2843 
                                   2844 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2845 ;       .R      ( n +n -- )
                                   2846 ;       Display an integer in a field
                                   2847 ;       of n columns, right justified.
                                   2848 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000FAD                       2849         _HEADER DOTR,2,".R"
      00902D 8F F4                    1         .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



                           000FAF     2         LINK=.
      00902F 02                       3         .byte 2  
      009030 2E 52                    4         .ascii ".R"
      009032                          5         DOTR:
      009032 CD 86 62         [ 4] 2850         CALL     TOR
      009035 CD 8E F6         [ 4] 2851         CALL     STR
      009038 CD 85 B4         [ 4] 2852         CALL     RFROM
      00903B CD 86 C1         [ 4] 2853         CALL     OVER
      00903E CD 89 52         [ 4] 2854         CALL     SUBB
      009041 CD 8F C4         [ 4] 2855         CALL     SPACS
      009044 CC 8F DF         [ 2] 2856         JP     TYPES
                                   2857 
                                   2858 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2859 ;       U.R     ( u +n -- )
                                   2860 ;       Display an unsigned integer
                                   2861 ;       in n column, right justified.
                                   2862 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000FC7                       2863         _HEADER UDOTR,3,"U.R"
      009047 90 2F                    1         .word LINK 
                           000FC9     2         LINK=.
      009049 03                       3         .byte 3  
      00904A 55 2E 52                 4         .ascii "U.R"
      00904D                          5         UDOTR:
      00904D CD 86 62         [ 4] 2864         CALL     TOR
      009050 CD 8E 79         [ 4] 2865         CALL     BDIGS
      009053 CD 8E B3         [ 4] 2866         CALL     DIGS
      009056 CD 8E DE         [ 4] 2867         CALL     EDIGS
      009059 CD 85 B4         [ 4] 2868         CALL     RFROM
      00905C CD 86 C1         [ 4] 2869         CALL     OVER
      00905F CD 89 52         [ 4] 2870         CALL     SUBB
      009062 CD 8F C4         [ 4] 2871         CALL     SPACS
      009065 CC 8F DF         [ 2] 2872         JP     TYPES
                                   2873 
                                   2874 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2875 ;       U.      ( u -- )
                                   2876 ;       Display an unsigned integer
                                   2877 ;       in free format.
                                   2878 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000FE8                       2879         _HEADER UDOT,2,"U."
      009068 90 49                    1         .word LINK 
                           000FEA     2         LINK=.
      00906A 02                       3         .byte 2  
      00906B 55 2E                    4         .ascii "U."
      00906D                          5         UDOT:
      00906D CD 8E 79         [ 4] 2880         CALL     BDIGS
      009070 CD 8E B3         [ 4] 2881         CALL     DIGS
      009073 CD 8E DE         [ 4] 2882         CALL     EDIGS
      009076 CD 8F B5         [ 4] 2883         CALL     SPACE
      009079 CC 8F DF         [ 2] 2884         JP     TYPES
                                   2885 
                                   2886 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2887 ;   H. ( n -- )
                                   2888 ;   display n in hexadecimal 
                                   2889 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000FFC                       2890         _HEADER HDOT,2,"H."
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



      00907C 90 6A                    1         .word LINK 
                           000FFE     2         LINK=.
      00907E 02                       3         .byte 2  
      00907F 48 2E                    4         .ascii "H."
      009081                          5         HDOT:
      009081 CD 87 5F         [ 4] 2891         CALL BASE 
      009084 CD 85 63         [ 4] 2892         CALL AT 
      009087 CD 86 62         [ 4] 2893         CALL TOR 
      00908A CD 8F 14         [ 4] 2894         CALL HEX 
      00908D CD 90 6D         [ 4] 2895         CALL UDOT 
      009090 CD 85 B4         [ 4] 2896         CALL RFROM 
      009093 CD 87 5F         [ 4] 2897         CALL BASE 
      009096 CD 85 51         [ 4] 2898         CALL STORE 
      009099 81               [ 4] 2899         RET 
                                   2900 
                                   2901 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2902 ;       .       ( w -- )
                                   2903 ;       Display an integer in free
                                   2904 ;       format, preceeded by a space.
                                   2905 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00101A                       2906         _HEADER DOT,1,"."
      00909A 90 7E                    1         .word LINK 
                           00101C     2         LINK=.
      00909C 01                       3         .byte 1  
      00909D 2E                       4         .ascii "."
      00909E                          5         DOT:
      00909E CD 87 5F         [ 4] 2907         CALL     BASE
      0090A1 CD 85 63         [ 4] 2908         CALL     AT
      0090A4 CD 84 EF         [ 4] 2909         CALL     DOLIT
      0090A7 00 0A                 2910         .word      10
      0090A9 CD 87 1F         [ 4] 2911         CALL     XORR    ;?decimal
      0090AC CD 85 18         [ 4] 2912         CALL     QBRAN
      0090AF 90 B4                 2913         .word      DOT1
      0090B1 CC 90 6D         [ 2] 2914         JP     UDOT
      0090B4 CD 8E F6         [ 4] 2915 DOT1:   CALL     STR
      0090B7 CD 8F B5         [ 4] 2916         CALL     SPACE
      0090BA CC 8F DF         [ 2] 2917         JP     TYPES
                                   2918 
                                   2919 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2920 ;       ?       ( a -- )
                                   2921 ;       Display contents in memory cell.
                                   2922 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00103D                       2923         _HEADER QUEST,1,"?"
      0090BD 90 9C                    1         .word LINK 
                           00103F     2         LINK=.
      0090BF 01                       3         .byte 1  
      0090C0 3F                       4         .ascii "?"
      0090C1                          5         QUEST:
      0090C1 CD 85 63         [ 4] 2924         CALL     AT
      0090C4 CC 90 9E         [ 2] 2925         JP     DOT
                                   2926 
                                   2927 ;; Parsing
                                   2928 
                                   2929 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2930 ;       parse   ( b u c -- b u delta ; <string> )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



                                   2931 ;       Scan string delimited by c.
                                   2932 ;       Return found string and its offset.
                                   2933 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001047                       2934         _HEADER PARS,5,"PARS$"
      0090C7 90 BF                    1         .word LINK 
                           001049     2         LINK=.
      0090C9 05                       3         .byte 5  
      0090CA 50 41 52 53 24           4         .ascii "PARS$"
      0090CF                          5         PARS:
      0090CF CD 87 6E         [ 4] 2935         CALL     TEMP
      0090D2 CD 85 51         [ 4] 2936         CALL     STORE
      0090D5 CD 86 C1         [ 4] 2937         CALL     OVER
      0090D8 CD 86 62         [ 4] 2938         CALL     TOR
      0090DB CD 86 99         [ 4] 2939         CALL     DUPP
      0090DE CD 85 18         [ 4] 2940         CALL     QBRAN
      0090E1 91 87                 2941         .word    PARS8
      0090E3 CD 8C 20         [ 4] 2942         CALL     ONEM
      0090E6 CD 87 6E         [ 4] 2943         CALL     TEMP
      0090E9 CD 85 63         [ 4] 2944         CALL     AT
      0090EC CD 8C 72         [ 4] 2945         CALL     BLANK
      0090EF CD 89 7A         [ 4] 2946         CALL     EQUAL
      0090F2 CD 85 18         [ 4] 2947         CALL     QBRAN
      0090F5 91 28                 2948         .word      PARS3
      0090F7 CD 86 62         [ 4] 2949         CALL     TOR
      0090FA CD 8C 72         [ 4] 2950 PARS1:  CALL     BLANK
      0090FD CD 86 C1         [ 4] 2951         CALL     OVER
      009100 CD 85 81         [ 4] 2952         CALL     CAT     ;skip leading blanks ONLY
      009103 CD 89 52         [ 4] 2953         CALL     SUBB
      009106 CD 86 D0         [ 4] 2954         CALL     ZLESS
      009109 CD 88 F5         [ 4] 2955         CALL     INVER
      00910C CD 85 18         [ 4] 2956         CALL     QBRAN
      00910F 91 25                 2957         .word      PARS2
      009111 CD 8C 13         [ 4] 2958         CALL     ONEP
      009114 CD 85 03         [ 4] 2959         CALL     DONXT
      009117 90 FA                 2960         .word      PARS1
      009119 CD 85 B4         [ 4] 2961         CALL     RFROM
      00911C CD 86 8F         [ 4] 2962         CALL     DROP
      00911F CD 8C 7F         [ 4] 2963         CALL     ZERO
      009122 CC 86 99         [ 2] 2964         JP     DUPP
      009125 CD 85 B4         [ 4] 2965 PARS2:  CALL     RFROM
      009128 CD 86 C1         [ 4] 2966 PARS3:  CALL     OVER
      00912B CD 86 A9         [ 4] 2967         CALL     SWAPP
      00912E CD 86 62         [ 4] 2968         CALL     TOR
      009131 CD 87 6E         [ 4] 2969 PARS4:  CALL     TEMP
      009134 CD 85 63         [ 4] 2970         CALL     AT
      009137 CD 86 C1         [ 4] 2971         CALL     OVER
      00913A CD 85 81         [ 4] 2972         CALL     CAT
      00913D CD 89 52         [ 4] 2973         CALL     SUBB    ;scan for delimiter
      009140 CD 87 6E         [ 4] 2974         CALL     TEMP
      009143 CD 85 63         [ 4] 2975         CALL     AT
      009146 CD 8C 72         [ 4] 2976         CALL     BLANK
      009149 CD 89 7A         [ 4] 2977         CALL     EQUAL
      00914C CD 85 18         [ 4] 2978         CALL     QBRAN
      00914F 91 54                 2979         .word      PARS5
      009151 CD 86 D0         [ 4] 2980         CALL     ZLESS
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



      009154 CD 85 18         [ 4] 2981 PARS5:  CALL     QBRAN
      009157 91 69                 2982         .word      PARS6
      009159 CD 8C 13         [ 4] 2983         CALL     ONEP
      00915C CD 85 03         [ 4] 2984         CALL     DONXT
      00915F 91 31                 2985         .word      PARS4
      009161 CD 86 99         [ 4] 2986         CALL     DUPP
      009164 CD 86 62         [ 4] 2987         CALL     TOR
      009167 20 0F            [ 2] 2988         JRA     PARS7
      009169 CD 85 B4         [ 4] 2989 PARS6:  CALL     RFROM
      00916C CD 86 8F         [ 4] 2990         CALL     DROP
      00916F CD 86 99         [ 4] 2991         CALL     DUPP
      009172 CD 8C 13         [ 4] 2992         CALL     ONEP
      009175 CD 86 62         [ 4] 2993         CALL     TOR
      009178 CD 86 C1         [ 4] 2994 PARS7:  CALL     OVER
      00917B CD 89 52         [ 4] 2995         CALL     SUBB
      00917E CD 85 B4         [ 4] 2996         CALL     RFROM
      009181 CD 85 B4         [ 4] 2997         CALL     RFROM
      009184 CC 89 52         [ 2] 2998         JP     SUBB
      009187 CD 86 C1         [ 4] 2999 PARS8:  CALL     OVER
      00918A CD 85 B4         [ 4] 3000         CALL     RFROM
      00918D CC 89 52         [ 2] 3001         JP     SUBB
                                   3002 
                                   3003 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3004 ;       PARSE   ( c -- b u ; <string> )
                                   3005 ;       Scan input stream and return
                                   3006 ;       counted string delimited by c.
                                   3007 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001110                       3008         _HEADER PARSE,5,"PARSE"
      009190 90 C9                    1         .word LINK 
                           001112     2         LINK=.
      009192 05                       3         .byte 5  
      009193 50 41 52 53 45           4         .ascii "PARSE"
      009198                          5         PARSE:
      009198 CD 86 62         [ 4] 3009         CALL     TOR
      00919B CD 8D 7E         [ 4] 3010         CALL     TIB
      00919E CD 87 7D         [ 4] 3011         CALL     INN
      0091A1 CD 85 63         [ 4] 3012         CALL     AT
      0091A4 CD 88 BC         [ 4] 3013         CALL     PLUS    ;current input buffer pointer
      0091A7 CD 87 8D         [ 4] 3014         CALL     NTIB
      0091AA CD 85 63         [ 4] 3015         CALL     AT
      0091AD CD 87 7D         [ 4] 3016         CALL     INN
      0091B0 CD 85 63         [ 4] 3017         CALL     AT
      0091B3 CD 89 52         [ 4] 3018         CALL     SUBB    ;remaining count
      0091B6 CD 85 B4         [ 4] 3019         CALL     RFROM
      0091B9 CD 90 CF         [ 4] 3020         CALL     PARS
      0091BC CD 87 7D         [ 4] 3021         CALL     INN
      0091BF CC 8C EF         [ 2] 3022         JP     PSTOR
                                   3023 
                                   3024 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3025 ;       .(      ( -- )
                                   3026 ;       Output following string up to next ) .
                                   3027 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001142                       3028         _HEADER DOTPR,IMEDD+2,".("
      0091C2 91 92                    1         .word LINK 
                           001144     2         LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



      0091C4 82                       3         .byte IMEDD+2  
      0091C5 2E 28                    4         .ascii ".("
      0091C7                          5         DOTPR:
      0091C7 CD 84 EF         [ 4] 3029         CALL     DOLIT
      0091CA 00 29                 3030         .word     41	; ")"
      0091CC CD 91 98         [ 4] 3031         CALL     PARSE
      0091CF CC 8F DF         [ 2] 3032         JP     TYPES
                                   3033 
                                   3034 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3035 ;       (       ( -- )
                                   3036 ;       Ignore following string up to next ).
                                   3037 ;       A comment.
                                   3038 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001152                       3039         _HEADER PAREN,IMEDD+1,"("
      0091D2 91 C4                    1         .word LINK 
                           001154     2         LINK=.
      0091D4 81                       3         .byte IMEDD+1  
      0091D5 28                       4         .ascii "("
      0091D6                          5         PAREN:
      0091D6 CD 84 EF         [ 4] 3040         CALL     DOLIT
      0091D9 00 29                 3041         .word     41	; ")"
      0091DB CD 91 98         [ 4] 3042         CALL     PARSE
      0091DE CC 88 9C         [ 2] 3043         JP     DDROP
                                   3044 
                                   3045 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3046 ;       \       ( -- )
                                   3047 ;       Ignore following text till
                                   3048 ;       end of line.
                                   3049 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001161                       3050         _HEADER BKSLA,IMEDD+1,"\\"
      0091E1 91 D4                    1         .word LINK 
                           001163     2         LINK=.
      0091E3 81                       3         .byte IMEDD+1  
      0091E4 5C 5C                    4         .ascii "\\"
      0091E6                          5         BKSLA:
      0091E6 90 AE 00 0E      [ 2] 3051         ldw y,#UCTIB ; #TIB  
      0091EA 90 FE            [ 2] 3052         ldw y,(y)
      0091EC 90 89            [ 2] 3053         pushw y ; count in TIB 
      0091EE 90 AE 00 0C      [ 2] 3054         ldw y,#UINN ; >IN 
      0091F2 90 BF 26         [ 2] 3055         ldw YTEMP,y
      0091F5 90 85            [ 2] 3056         popw y 
      0091F7 91 CF 26         [ 5] 3057         ldw [YTEMP],y
      0091FA 81               [ 4] 3058         ret 
                                   3059 
                                   3060 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3061 ;       WORD    ( c -- a ; <string> )
                                   3062 ;       Parse a word from input stream
                                   3063 ;       and copy it to code dictionary.
                                   3064 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00117B                       3065         _HEADER WORDD,4,"WORD"
      0091FB 91 E3                    1         .word LINK 
                           00117D     2         LINK=.
      0091FD 04                       3         .byte 4  
      0091FE 57 4F 52 44              4         .ascii "WORD"
      009202                          5         WORDD:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



      009202 CD 91 98         [ 4] 3066         CALL     PARSE
      009205 CD 8D 5C         [ 4] 3067         CALL     HERE
      009208 CD 8B E8         [ 4] 3068         CALL     CELLP
                           000000  3069 .IF CASE_SENSE 
                                   3070         JP      PACKS 
                           000001  3071 .ELSE                 
      00920B CD 8E 1C         [ 4] 3072         CALL     PACKS
                                   3073 ; uppercase TOKEN 
      00920E CD 86 99         [ 4] 3074         CALL    DUPP 
      009211 CD 8D 45         [ 4] 3075         CALL    COUNT 
      009214 CD 86 62         [ 4] 3076         CALL    TOR 
      009217 CD 85 34         [ 4] 3077         CALL    BRAN 
      00921A 92 48                 3078         .word   UPPER2  
      00921C                       3079 UPPER:
      00921C CD 86 99         [ 4] 3080         CALL    DUPP 
      00921F CD 85 81         [ 4] 3081         CALL    CAT
      009222 CD 86 99         [ 4] 3082         CALL    DUPP 
      009225 CD 84 EF         [ 4] 3083         CALL   DOLIT
      009228 00 61                 3084         .word   'a' 
      00922A CD 84 EF         [ 4] 3085         CALL    DOLIT
      00922D 00 7B                 3086         .word   'z'+1 
      00922F CD 8A 16         [ 4] 3087         CALL   WITHI 
      009232 CD 85 18         [ 4] 3088         CALL   QBRAN
      009235 92 3F                 3089         .word  UPPER1  
      009237 CD 84 EF         [ 4] 3090         CALL    DOLIT 
      00923A 00 DF                 3091         .word   0xDF 
      00923C CD 86 F6         [ 4] 3092         CALL    ANDD 
      00923F                       3093 UPPER1:
      00923F CD 86 C1         [ 4] 3094         CALL    OVER 
      009242 CD 85 70         [ 4] 3095         CALL    CSTOR          
      009245 CD 8C 13         [ 4] 3096         CALL    ONEP 
      009248                       3097 UPPER2: 
      009248 CD 85 03         [ 4] 3098         CALL    DONXT
      00924B 92 1C                 3099         .word   UPPER  
      00924D CD 86 8F         [ 4] 3100         CALL    DROP  
      009250 81               [ 4] 3101         RET 
                                   3102 .ENDIF 
                                   3103 
                                   3104 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3105 ;       TOKEN   ( -- a ; <string> )
                                   3106 ;       Parse a word from input stream
                                   3107 ;       and copy it to name dictionary.
                                   3108 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0011D1                       3109         _HEADER TOKEN,5,"TOKEN"
      009251 91 FD                    1         .word LINK 
                           0011D3     2         LINK=.
      009253 05                       3         .byte 5  
      009254 54 4F 4B 45 4E           4         .ascii "TOKEN"
      009259                          5         TOKEN:
      009259 CD 8C 72         [ 4] 3110         CALL     BLANK
      00925C CC 92 02         [ 2] 3111         JP     WORDD
                                   3112 
                                   3113 ;; Dictionary search
                                   3114 
                                   3115 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



                                   3116 ;       NAME>   ( na -- ca )
                                   3117 ;       Return a code address given
                                   3118 ;       a name address.
                                   3119 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0011DF                       3120         _HEADER NAMET,5,"NAME>"
      00925F 92 53                    1         .word LINK 
                           0011E1     2         LINK=.
      009261 05                       3         .byte 5  
      009262 4E 41 4D 45 3E           4         .ascii "NAME>"
      009267                          5         NAMET:
      009267 CD 8D 45         [ 4] 3121         CALL     COUNT
      00926A CD 84 EF         [ 4] 3122         CALL     DOLIT
      00926D 00 1F                 3123         .word      31
      00926F CD 86 F6         [ 4] 3124         CALL     ANDD
      009272 CC 88 BC         [ 2] 3125         JP     PLUS
                                   3126 
                                   3127 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3128 ;       SAME?   ( a a u -- a a f \ -0+ )
                                   3129 ;       Compare u cells in two
                                   3130 ;       strings. Return 0 if identical.
                                   3131 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0011F5                       3132         _HEADER SAMEQ,5,"SAME?"
      009275 92 61                    1         .word LINK 
                           0011F7     2         LINK=.
      009277 05                       3         .byte 5  
      009278 53 41 4D 45 3F           4         .ascii "SAME?"
      00927D                          5         SAMEQ:
      00927D CD 8C 20         [ 4] 3133         CALL     ONEM
      009280 CD 86 62         [ 4] 3134         CALL     TOR
      009283 20 29            [ 2] 3135         JRA     SAME2
      009285 CD 86 C1         [ 4] 3136 SAME1:  CALL     OVER
      009288 CD 85 C5         [ 4] 3137         CALL     RAT
      00928B CD 88 BC         [ 4] 3138         CALL     PLUS
      00928E CD 85 81         [ 4] 3139         CALL     CAT
      009291 CD 86 C1         [ 4] 3140         CALL     OVER
      009294 CD 85 C5         [ 4] 3141         CALL     RAT
      009297 CD 88 BC         [ 4] 3142         CALL     PLUS
      00929A CD 85 81         [ 4] 3143         CALL     CAT
      00929D CD 89 52         [ 4] 3144         CALL     SUBB
      0092A0 CD 88 4C         [ 4] 3145         CALL     QDUP
      0092A3 CD 85 18         [ 4] 3146         CALL     QBRAN
      0092A6 92 AE                 3147         .word      SAME2
      0092A8 CD 85 B4         [ 4] 3148         CALL     RFROM
      0092AB CC 86 8F         [ 2] 3149         JP     DROP
      0092AE CD 85 03         [ 4] 3150 SAME2:  CALL     DONXT
      0092B1 92 85                 3151         .word      SAME1
      0092B3 CC 8C 7F         [ 2] 3152         JP     ZERO
                                   3153 
                                   3154 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3155 ;       find    ( a va -- ca na | a F )
                                   3156 ;       Search vocabulary for string.
                                   3157 ;       Return ca and na if succeeded.
                                   3158 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001236                       3159         _HEADER FIND,4,"FIND"
      0092B6 92 77                    1         .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



                           001238     2         LINK=.
      0092B8 04                       3         .byte 4  
      0092B9 46 49 4E 44              4         .ascii "FIND"
      0092BD                          5         FIND:
      0092BD CD 86 A9         [ 4] 3160         CALL     SWAPP
      0092C0 CD 86 99         [ 4] 3161         CALL     DUPP
      0092C3 CD 85 81         [ 4] 3162         CALL     CAT
      0092C6 CD 87 6E         [ 4] 3163         CALL     TEMP
      0092C9 CD 85 51         [ 4] 3164         CALL     STORE
      0092CC CD 86 99         [ 4] 3165         CALL     DUPP
      0092CF CD 85 63         [ 4] 3166         CALL     AT
      0092D2 CD 86 62         [ 4] 3167         CALL     TOR
      0092D5 CD 8B E8         [ 4] 3168         CALL     CELLP
      0092D8 CD 86 A9         [ 4] 3169         CALL     SWAPP
      0092DB CD 85 63         [ 4] 3170 FIND1:  CALL     AT
      0092DE CD 86 99         [ 4] 3171         CALL     DUPP
      0092E1 CD 85 18         [ 4] 3172         CALL     QBRAN
      0092E4 93 1A                 3173         .word      FIND6
      0092E6 CD 86 99         [ 4] 3174         CALL     DUPP
      0092E9 CD 85 63         [ 4] 3175         CALL     AT
      0092EC CD 84 EF         [ 4] 3176         CALL     DOLIT
      0092EF 1F 7F                 3177         .word      MASKK
      0092F1 CD 86 F6         [ 4] 3178         CALL     ANDD
      0092F4 CD 85 C5         [ 4] 3179         CALL     RAT
      0092F7 CD 87 1F         [ 4] 3180         CALL     XORR
      0092FA CD 85 18         [ 4] 3181         CALL     QBRAN
      0092FD 93 09                 3182         .word      FIND2
      0092FF CD 8B E8         [ 4] 3183         CALL     CELLP
      009302 CD 84 EF         [ 4] 3184         CALL     DOLIT
      009305 FF FF                 3185         .word     0xFFFF
      009307 20 0C            [ 2] 3186         JRA     FIND3
      009309 CD 8B E8         [ 4] 3187 FIND2:  CALL     CELLP
      00930C CD 87 6E         [ 4] 3188         CALL     TEMP
      00930F CD 85 63         [ 4] 3189         CALL     AT
      009312 CD 92 7D         [ 4] 3190         CALL     SAMEQ
      009315 CD 85 34         [ 4] 3191 FIND3:  CALL     BRAN
      009318 93 29                 3192         .word      FIND4
      00931A CD 85 B4         [ 4] 3193 FIND6:  CALL     RFROM
      00931D CD 86 8F         [ 4] 3194         CALL     DROP
      009320 CD 86 A9         [ 4] 3195         CALL     SWAPP
      009323 CD 8B F7         [ 4] 3196         CALL     CELLM
      009326 CC 86 A9         [ 2] 3197         JP     SWAPP
      009329 CD 85 18         [ 4] 3198 FIND4:  CALL     QBRAN
      00932C 93 36                 3199         .word      FIND5
      00932E CD 8B F7         [ 4] 3200         CALL     CELLM
      009331 CD 8B F7         [ 4] 3201         CALL     CELLM
      009334 20 A5            [ 2] 3202         JRA     FIND1
      009336 CD 85 B4         [ 4] 3203 FIND5:  CALL     RFROM
      009339 CD 86 8F         [ 4] 3204         CALL     DROP
      00933C CD 86 A9         [ 4] 3205         CALL     SWAPP
      00933F CD 86 8F         [ 4] 3206         CALL     DROP
      009342 CD 8B F7         [ 4] 3207         CALL     CELLM
      009345 CD 86 99         [ 4] 3208         CALL     DUPP
      009348 CD 92 67         [ 4] 3209         CALL     NAMET
      00934B CC 86 A9         [ 2] 3210         JP     SWAPP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



                                   3211 
                                   3212 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3213 ;       NAME?   ( a -- ca na | a F )
                                   3214 ;       Search vocabularies for a string.
                                   3215 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0012CE                       3216         _HEADER NAMEQ,5,"NAME?"
      00934E 92 B8                    1         .word LINK 
                           0012D0     2         LINK=.
      009350 05                       3         .byte 5  
      009351 4E 41 4D 45 3F           4         .ascii "NAME?"
      009356                          5         NAMEQ:
      009356 CD 87 E2         [ 4] 3217         CALL   CNTXT
      009359 CC 92 BD         [ 2] 3218         JP     FIND
                                   3219 
                                   3220 ;; Terminal response
                                   3221 
                                   3222 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3223 ;       ^H      ( bot eot cur -- bot eot cur )
                                   3224 ;       Backup cursor by one character.
                                   3225 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0012DC                       3226         _HEADER BKSP,2,"^H"
      00935C 93 50                    1         .word LINK 
                           0012DE     2         LINK=.
      00935E 02                       3         .byte 2  
      00935F 5E 48                    4         .ascii "^H"
      009361                          5         BKSP:
      009361 CD 86 62         [ 4] 3227         CALL     TOR
      009364 CD 86 C1         [ 4] 3228         CALL     OVER
      009367 CD 85 B4         [ 4] 3229         CALL     RFROM
      00936A CD 86 A9         [ 4] 3230         CALL     SWAPP
      00936D CD 86 C1         [ 4] 3231         CALL     OVER
      009370 CD 87 1F         [ 4] 3232         CALL     XORR
      009373 CD 85 18         [ 4] 3233         CALL     QBRAN
      009376 93 91                 3234         .word      BACK1
      009378 CD 84 EF         [ 4] 3235         CALL     DOLIT
      00937B 00 08                 3236         .word      BKSPP
      00937D CD 84 B6         [ 4] 3237         CALL     EMIT
      009380 CD 8C 20         [ 4] 3238         CALL     ONEM
      009383 CD 8C 72         [ 4] 3239         CALL     BLANK
      009386 CD 84 B6         [ 4] 3240         CALL     EMIT
      009389 CD 84 EF         [ 4] 3241         CALL     DOLIT
      00938C 00 08                 3242         .word      BKSPP
      00938E CC 84 B6         [ 2] 3243         JP     EMIT
      009391 81               [ 4] 3244 BACK1:  RET
                                   3245 
                                   3246 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3247 ;       TAP    ( bot eot cur c -- bot eot cur )
                                   3248 ;       Accept and echo key stroke
                                   3249 ;       and bump cursor.
                                   3250 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001312                       3251         _HEADER TAP,3,"TAP"
      009392 93 5E                    1         .word LINK 
                           001314     2         LINK=.
      009394 03                       3         .byte 3  
      009395 54 41 50                 4         .ascii "TAP"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



      009398                          5         TAP:
      009398 CD 86 99         [ 4] 3252         CALL     DUPP
      00939B CD 84 B6         [ 4] 3253         CALL     EMIT
      00939E CD 86 C1         [ 4] 3254         CALL     OVER
      0093A1 CD 85 70         [ 4] 3255         CALL     CSTOR
      0093A4 CC 8C 13         [ 2] 3256         JP     ONEP
                                   3257 
                                   3258 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3259 ;       kTAP    ( bot eot cur c -- bot eot cur )
                                   3260 ;       Process a key stroke,
                                   3261 ;       CR,LF or backspace.
                                   3262 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001327                       3263         _HEADER KTAP,4,"KTAP"
      0093A7 93 94                    1         .word LINK 
                           001329     2         LINK=.
      0093A9 04                       3         .byte 4  
      0093AA 4B 54 41 50              4         .ascii "KTAP"
      0093AE                          5         KTAP:
      0093AE CD 86 99         [ 4] 3264         CALL     DUPP
      0093B1 CD 84 EF         [ 4] 3265         CALL     DOLIT
                           000001  3266 .if EOL_CR
      0093B4 00 0D                 3267         .word   CRR
                           000000  3268 .else ; EOL_LF 
                                   3269         .word   LF
                                   3270 .endif 
      0093B6 CD 87 1F         [ 4] 3271         CALL     XORR
      0093B9 CD 85 18         [ 4] 3272         CALL     QBRAN
      0093BC 93 D4                 3273         .word      KTAP2
      0093BE CD 84 EF         [ 4] 3274         CALL     DOLIT
      0093C1 00 08                 3275         .word      BKSPP
      0093C3 CD 87 1F         [ 4] 3276         CALL     XORR
      0093C6 CD 85 18         [ 4] 3277         CALL     QBRAN
      0093C9 93 D1                 3278         .word      KTAP1
      0093CB CD 8C 72         [ 4] 3279         CALL     BLANK
      0093CE CC 93 98         [ 2] 3280         JP     TAP
      0093D1 CC 93 61         [ 2] 3281 KTAP1:  JP     BKSP
      0093D4 CD 86 8F         [ 4] 3282 KTAP2:  CALL     DROP
      0093D7 CD 86 A9         [ 4] 3283         CALL     SWAPP
      0093DA CD 86 8F         [ 4] 3284         CALL     DROP
      0093DD CC 86 99         [ 2] 3285         JP     DUPP
                                   3286 
                                   3287 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3288 ;       accept  ( b u -- b u )
                                   3289 ;       Accept characters to input
                                   3290 ;       buffer. Return with actual count.
                                   3291 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001360                       3292         _HEADER ACCEP,6,"ACCEPT"
      0093E0 93 A9                    1         .word LINK 
                           001362     2         LINK=.
      0093E2 06                       3         .byte 6  
      0093E3 41 43 43 45 50 54        4         .ascii "ACCEPT"
      0093E9                          5         ACCEP:
      0093E9 CD 86 C1         [ 4] 3293         CALL     OVER
      0093EC CD 88 BC         [ 4] 3294         CALL     PLUS
      0093EF CD 86 C1         [ 4] 3295         CALL     OVER
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



      0093F2 CD 88 A7         [ 4] 3296 ACCP1:  CALL     DDUP
      0093F5 CD 87 1F         [ 4] 3297         CALL     XORR
      0093F8 CD 85 18         [ 4] 3298         CALL     QBRAN
      0093FB 94 1D                 3299         .word      ACCP4
      0093FD CD 8F 7D         [ 4] 3300         CALL     KEY
      009400 CD 86 99         [ 4] 3301         CALL     DUPP
      009403 CD 8C 72         [ 4] 3302         CALL     BLANK
      009406 CD 84 EF         [ 4] 3303         CALL     DOLIT
      009409 00 7F                 3304         .word      127
      00940B CD 8A 16         [ 4] 3305         CALL     WITHI
      00940E CD 85 18         [ 4] 3306         CALL     QBRAN
      009411 94 18                 3307         .word      ACCP2
      009413 CD 93 98         [ 4] 3308         CALL     TAP
      009416 20 03            [ 2] 3309         JRA     ACCP3
      009418 CD 93 AE         [ 4] 3310 ACCP2:  CALL     KTAP
      00941B 20 D5            [ 2] 3311 ACCP3:  JRA     ACCP1
      00941D CD 86 8F         [ 4] 3312 ACCP4:  CALL     DROP
      009420 CD 86 C1         [ 4] 3313         CALL     OVER
      009423 CC 89 52         [ 2] 3314         JP     SUBB
                                   3315 
                                   3316 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3317 ;       QUERY   ( -- )
                                   3318 ;       Accept input stream to
                                   3319 ;       terminal input buffer.
                                   3320 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0013A6                       3321         _HEADER QUERY,5,"QUERY"
      009426 93 E2                    1         .word LINK 
                           0013A8     2         LINK=.
      009428 05                       3         .byte 5  
      009429 51 55 45 52 59           4         .ascii "QUERY"
      00942E                          5         QUERY:
      00942E CD 8D 7E         [ 4] 3322         CALL     TIB
      009431 CD 84 EF         [ 4] 3323         CALL     DOLIT
      009434 00 50                 3324         .word      80
      009436 CD 93 E9         [ 4] 3325         CALL     ACCEP
      009439 CD 87 8D         [ 4] 3326         CALL     NTIB
      00943C CD 85 51         [ 4] 3327         CALL     STORE
      00943F CD 86 8F         [ 4] 3328         CALL     DROP
      009442 CD 8C 7F         [ 4] 3329         CALL     ZERO
      009445 CD 87 7D         [ 4] 3330         CALL     INN
      009448 CC 85 51         [ 2] 3331         JP     STORE
                                   3332 
                                   3333 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3334 ;       ABORT   ( -- )
                                   3335 ;       Reset data stack and
                                   3336 ;       jump to QUIT.
                                   3337 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0013CB                       3338         _HEADER ABORT,5,"ABORT"
      00944B 94 28                    1         .word LINK 
                           0013CD     2         LINK=.
      00944D 05                       3         .byte 5  
      00944E 41 42 4F 52 54           4         .ascii "ABORT"
      009453                          5         ABORT:
      009453 CD 95 4A         [ 4] 3339         CALL     PRESE
      009456 CC 95 67         [ 2] 3340         JP     QUIT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



                                   3341 
                                   3342 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3343 ;       abort"  ( f -- )
                                   3344 ;       Run time routine of ABORT".
                                   3345 ;       Abort with a message.
                                   3346 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0013D9                       3347         _HEADER ABORQ,COMPO+6,'ABORT"'
      009459 94 4D                    1         .word LINK 
                           0013DB     2         LINK=.
      00945B 46                       3         .byte COMPO+6  
      00945C 41 42 4F 52 54 22        4         .ascii 'ABORT"'
      009462                          5         ABORQ:
      009462 CD 85 18         [ 4] 3348         CALL     QBRAN
      009465 94 81                 3349         .word      ABOR2   ;text flag
      009467 CD 90 07         [ 4] 3350         CALL     DOSTR
      00946A CD 8F B5         [ 4] 3351 ABOR1:  CALL     SPACE
      00946D CD 8D 45         [ 4] 3352         CALL     COUNT
      009470 CD 8F DF         [ 4] 3353         CALL     TYPES
      009473 CD 84 EF         [ 4] 3354         CALL     DOLIT
      009476 00 3F                 3355         .word     63 ; "?"
      009478 CD 84 B6         [ 4] 3356         CALL     EMIT
      00947B CD 8F F7         [ 4] 3357         CALL     CR
      00947E CC 94 53         [ 2] 3358         JP     ABORT   ;pass error string
      009481 CD 90 07         [ 4] 3359 ABOR2:  CALL     DOSTR
      009484 CC 86 8F         [ 2] 3360         JP     DROP
                                   3361 
                                   3362 ;; The text interpreter
                                   3363 
                                   3364 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3365 ;       $INTERPRET      ( a -- )
                                   3366 ;       Interpret a word. If failed,
                                   3367 ;       try to convert it to an integer.
                                   3368 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001407                       3369         _HEADER INTER,10,"$INTERPRET"
      009487 94 5B                    1         .word LINK 
                           001409     2         LINK=.
      009489 0A                       3         .byte 10  
      00948A 24 49 4E 54 45 52 50     4         .ascii "$INTERPRET"
             52 45 54
      009494                          5         INTER:
      009494 CD 93 56         [ 4] 3370         CALL     NAMEQ
      009497 CD 88 4C         [ 4] 3371         CALL     QDUP    ;?defined
      00949A CD 85 18         [ 4] 3372         CALL     QBRAN
      00949D 94 BE                 3373         .word      INTE1
      00949F CD 85 63         [ 4] 3374         CALL     AT
      0094A2 CD 84 EF         [ 4] 3375         CALL     DOLIT
      0094A5 40 00                 3376 	.word       0x4000	; COMPO*256
      0094A7 CD 86 F6         [ 4] 3377         CALL     ANDD    ;?compile only lexicon bits
      0094AA CD 94 62         [ 4] 3378         CALL     ABORQ
      0094AD 0D                    3379         .byte      13
      0094AE 20 63 6F 6D 70 69 6C  3380         .ascii     " compile only"
             65 20 6F 6E 6C 79
      0094BB CC 85 44         [ 2] 3381         JP     EXECU
      0094BE CD A5 FE         [ 4] 3382 INTE1:  CALL     NUMBQ   ;convert a number
      0094C1 CD 85 18         [ 4] 3383         CALL     QBRAN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



      0094C4 94 6A                 3384         .word    ABOR1
      0094C6 81               [ 4] 3385         RET
                                   3386 
                                   3387 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3388 ;       [       ( -- )
                                   3389 ;       Start  text interpreter.
                                   3390 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001447                       3391         _HEADER LBRAC,IMEDD+1,"["
      0094C7 94 89                    1         .word LINK 
                           001449     2         LINK=.
      0094C9 81                       3         .byte IMEDD+1  
      0094CA 5B                       4         .ascii "["
      0094CB                          5         LBRAC:
      0094CB CD 84 EF         [ 4] 3392         CALL   DOLIT
      0094CE 94 94                 3393         .word  INTER
      0094D0 CD 87 C0         [ 4] 3394         CALL   TEVAL
      0094D3 CC 85 51         [ 2] 3395         JP     STORE
                                   3396 
                                   3397 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3398 ;       .OK     ( -- )
                                   3399 ;       Display 'ok' while interpreting.
                                   3400 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001456                       3401         _HEADER DOTOK,3,".OK"
      0094D6 94 C9                    1         .word LINK 
                           001458     2         LINK=.
      0094D8 03                       3         .byte 3  
      0094D9 2E 4F 4B                 4         .ascii ".OK"
      0094DC                          5         DOTOK:
      0094DC CD 84 EF         [ 4] 3402         CALL     DOLIT
      0094DF 94 94                 3403         .word      INTER
      0094E1 CD 87 C0         [ 4] 3404         CALL     TEVAL
      0094E4 CD 85 63         [ 4] 3405         CALL     AT
      0094E7 CD 89 7A         [ 4] 3406         CALL     EQUAL
      0094EA CD 85 18         [ 4] 3407         CALL     QBRAN
      0094ED 94 F6                 3408         .word      DOTO1
      0094EF CD 90 24         [ 4] 3409         CALL     DOTQP
      0094F2 03                    3410         .byte      3
      0094F3 20 6F 6B              3411         .ascii     " ok"
      0094F6 CC 8F F7         [ 2] 3412 DOTO1:  JP     CR
                                   3413 
                                   3414 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3415 ;       ?STACK  ( -- )
                                   3416 ;       Abort if stack underflows.
                                   3417 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001479                       3418         _HEADER QSTAC,6,"?STACK"
      0094F9 94 D8                    1         .word LINK 
                           00147B     2         LINK=.
      0094FB 06                       3         .byte 6  
      0094FC 3F 53 54 41 43 4B        4         .ascii "?STACK"
      009502                          5         QSTAC:
      009502 CD 8C C1         [ 4] 3419         CALL     DEPTH
      009505 CD 86 D0         [ 4] 3420         CALL     ZLESS   ;check only for underflow
      009508 CD 94 62         [ 4] 3421         CALL     ABORQ
      00950B 0B                    3422         .byte      11
      00950C 20 75 6E 64 65 72 66  3423         .ascii     " underflow "
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal  6C-Bits]



             6C 6F 77 20
      009514 6F               [ 4] 3424         RET
                                   3425 
                                   3426 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3427 ;       EVAL    ( -- )
                                   3428 ;       Interpret  input stream.
                                   3429 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001498                       3430         _HEADER EVAL,4,"EVAL"
      009515 77 20                    1         .word LINK 
                           00149A     2         LINK=.
      009517 81                       3         .byte 4  
      009518 94 FB 04 45              4         .ascii "EVAL"
      00149F                          5         EVAL:
      00951C 56 41 4C         [ 4] 3431 EVAL1:  CALL     TOKEN
      00951F CD 06 19         [ 4] 3432         CALL     DUPP
      00951F CD 92 59         [ 4] 3433         CALL     CAT     ;?input stream empty
      009522 CD 86 99         [ 4] 3434         CALL     QBRAN
      009525 CD 85                 3435         .word    EVAL2
      009527 81 CD 85         [ 4] 3436         CALL     TEVAL
      00952A 18 95 3B         [ 4] 3437         CALL     ATEXE
      00952D CD 87 C0         [ 4] 3438         CALL     QSTAC   ;evaluate input, check stack
      009530 CD 8D 92         [ 4] 3439         CALL     BRAN
      009533 CD 95                 3440         .word    EVAL1
      009535 02 CD 85         [ 4] 3441 EVAL2:  CALL     DROP
      009538 34 95 1F         [ 2] 3442         JP       DOTOK
                                   3443 
                                   3444 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3445 ;       PRESET  ( -- )
                                   3446 ;       Reset data stack pointer and
                                   3447 ;       terminal input buffer.
                                   3448 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0014C1                       3449         _HEADER PRESE,6,"PRESET"
      00953B CD 86                    1         .word LINK 
                           0014C3     2         LINK=.
      00953D 8F                       3         .byte 6  
      00953E CC 94 DC 95 1A 06        4         .ascii "PRESET"
      0014CA                          5         PRESE:
      009544 50 52 45         [ 4] 3450         CALL     DOLIT
      009547 53 45                 3451         .word      SPP
      009549 54 06 06         [ 4] 3452         CALL     SPSTO
      00954A CD 04 6F         [ 4] 3453         CALL     DOLIT
      00954A CD 84                 3454         .word      TIBB
      00954C EF 16 80         [ 4] 3455         CALL     NTIB
      00954F CD 86 86         [ 4] 3456         CALL     CELLP
      009552 CD 84 EF         [ 2] 3457         JP     STORE
                                   3458 
                                   3459 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3460 ;       QUIT    ( -- )
                                   3461 ;       Reset return stack pointer
                                   3462 ;       and start text interpreter.
                                   3463 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0014E0                       3464         _HEADER QUIT,4,"QUIT"
      009555 17 00                    1         .word LINK 
                           0014E2     2         LINK=.
      009557 CD                       3         .byte 4  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



      009558 87 8D CD 8B              4         .ascii "QUIT"
      0014E7                          5         QUIT:
      00955C E8 CC 85         [ 4] 3465         CALL     DOLIT
      00955F 51 95                 3466         .word      RPP
      009561 43 04 51         [ 4] 3467         CALL     RPSTO   ;reset return stack pointer
      009564 55 49 54         [ 4] 3468 QUIT1:  CALL     LBRAC   ;start interpretation
      009567 CD 13 AE         [ 4] 3469 QUIT2:  CALL     QUERY   ;get input
      009567 CD 84 EF         [ 4] 3470         CALL     EVAL
      00956A 17 FF            [ 2] 3471         JRA     QUIT2   ;continue till error
                                   3472 
                                   3473 ;; The compiler
                                   3474 
                                   3475 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3476 ;       '       ( -- ca )
                                   3477 ;       Search vocabularies for
                                   3478 ;       next word in input stream.
                                   3479 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0014FA                       3480         _HEADER TICK,1,"'"
      00956C CD 85                    1         .word LINK 
                           0014FC     2         LINK=.
      00956E 9E                       3         .byte 1  
      00956F CD                       4         .ascii "'"
      0014FE                          5         TICK:
      009570 94 CB CD         [ 4] 3481         CALL     TOKEN
      009573 94 2E CD         [ 4] 3482         CALL     NAMEQ   ;?defined
      009576 95 1F 20         [ 4] 3483         CALL     QBRAN
      009579 F8 95                 3484         .word      ABOR1
      00957B 62               [ 4] 3485         RET     ;yes, push code address
                                   3486 
                                   3487 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3488 ;       ALLOT   ( n -- )
                                   3489 ;       Allocate n bytes to RAM 
                                   3490 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00150A                       3491         _HEADER ALLOT,5,"ALLOT"
      00957C 01 27                    1         .word LINK 
                           00150C     2         LINK=.
      00957E 05                       3         .byte 5  
      00957E CD 92 59 CD 93           4         .ascii "ALLOT"
      001512                          5         ALLOT:
      009583 56 CD 85         [ 4] 3492         CALL     VPP
                                   3493 ; must update APP_VP each time VP is modidied
      009586 18 94 6A         [ 4] 3494         call PSTOR 
      009589 81 95 7C         [ 2] 3495         jp UPDATVP 
                                   3496 
                                   3497 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3498 ;       ,       ( w -- )
                                   3499 ;         Compile an integer into
                                   3500 ;         variable space.
                                   3501 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00151B                       3502         _HEADER COMMA,1,^/"\,"/
      00958C 05 41                    1         .word LINK 
                           00151D     2         LINK=.
      00958E 4C                       3         .byte 1  
      00958F 4C 4F                    4         .ascii "\,"
      001520                          5         COMMA:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



      009591 54 0C DC         [ 4] 3503         CALL     HERE
      009592 CD 06 19         [ 4] 3504         CALL     DUPP
      009592 CD 87 F0         [ 4] 3505         CALL     CELLP   ;cell boundary
      009595 CD 8C EF         [ 4] 3506         CALL     VPP
      009598 CC 9D 4A         [ 4] 3507         CALL     STORE
      00959B 95 8C 01         [ 2] 3508         JP     STORE
                                   3509 
                                   3510 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3511 ;       C,      ( c -- )
                                   3512 ;       Compile a byte into
                                   3513 ;       variables space.
                                   3514 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001532                       3515         _HEADER CCOMMA,2,^/"C,"/
      00959E 5C 2C                    1         .word LINK 
                           001534     2         LINK=.
      0095A0 02                       3         .byte 2  
      0095A0 CD 8D                    4         .ascii "C,"
      001537                          5         CCOMMA:
      0095A2 5C CD 86         [ 4] 3516         CALL     HERE
      0095A5 99 CD 8B         [ 4] 3517         CALL     DUPP
      0095A8 E8 CD 87         [ 4] 3518         CALL     ONEP
      0095AB F0 CD 85         [ 4] 3519         CALL     VPP
      0095AE 51 CC 85         [ 4] 3520         CALL     STORE
      0095B1 51 95 9D         [ 2] 3521         JP     CSTOR
                                   3522 
                                   3523 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3524 ;       [COMPILE]       ( -- ; <string> )
                                   3525 ;       Compile next immediate
                                   3526 ;       word into code dictionary.
                                   3527 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001549                       3528         _HEADER BCOMP,IMEDD+9,"[COMPILE]"
      0095B4 02 43                    1         .word LINK 
                           00154B     2         LINK=.
      0095B6 2C                       3         .byte IMEDD+9  
      0095B7 5B 43 4F 4D 50 49 4C     4         .ascii "[COMPILE]"
             45 5D
      001555                          5         BCOMP:
      0095B7 CD 8D 5C         [ 4] 3529         CALL     TICK
      0095BA CD 86 99         [ 2] 3530         JP     JSRC
                                   3531 
                                   3532 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3533 ;       COMPILE ( -- )
                                   3534 ;       Compile next jsr in
                                   3535 ;       colon list to code dictionary.
                                   3536 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00155B                       3537         _HEADER COMPI,COMPO+7,"COMPILE"
      0095BD CD 8C                    1         .word LINK 
                           00155D     2         LINK=.
      0095BF 13                       3         .byte COMPO+7  
      0095C0 CD 87 F0 CD 85 51 CC     4         .ascii "COMPILE"
      001565                          5         COMPI:
      0095C7 85 70 95         [ 4] 3538         CALL     RFROM
      0095CA B4 89 5B         [ 4] 3539         CALL     DUPP
      0095CD 43 4F 4D         [ 4] 3540         CALL     AT
      0095D0 50 49 4C         [ 4] 3541         CALL     JSRC    ;compile subroutine
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



      0095D3 45 5D 68         [ 4] 3542         CALL     CELLP
      0095D5 90 93            [ 1] 3543         ldw y,x 
      0095D5 CD 95            [ 2] 3544         ldw y,(y)
      0095D7 7E CC 98         [ 2] 3545         addw x,#CELLL 
      0095DA AA 95            [ 2] 3546         jp (y)
                                   3547 
                                   3548 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3549 ;       LITERAL ( w -- )
                                   3550 ;       Compile tos to dictionary
                                   3551 ;       as an integer literal.
                                   3552 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00157D                       3553         _HEADER LITER,COMPO+IMEDD+7,"LITERAL"
      0095DC CB 47                    1         .word LINK 
                           00157F     2         LINK=.
      0095DE 43                       3         .byte COMPO+IMEDD+7  
      0095DF 4F 4D 50 49 4C 45 4C     4         .ascii "LITERAL"
      0095E5                          5         LITER:
      0095E5 CD 85 B4         [ 4] 3554         CALL     COMPI
      0095E8 CD 86                 3555         .word DOLIT 
      0095EA 99 CD 85         [ 2] 3556         JP     COMMA
                                   3557 
                                   3558 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3559 ;       $,"     ( -- )
                                   3560 ;       Compile a literal string
                                   3561 ;       up to next " .
                                   3562 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3563 ;        _HEADER STRCQ,3,^/'$,"'/
      00158F                       3564 STRCQ:
      0095ED 63 CD 98         [ 4] 3565         CALL     DOLIT
      0095F0 AA CD                 3566         .word     34	; "
      0095F2 8B E8 90         [ 4] 3567         CALL     PARSE
      0095F5 93 90 FE         [ 4] 3568         CALL     HERE
      0095F8 1C 00 02         [ 4] 3569         CALL     PACKS   ;string to code dictionary
      0095FB 90 FC 95         [ 4] 3570         CALL     COUNT
      0095FE DD C7 4C         [ 4] 3571         CALL     PLUS    ;calculate aligned end of string
      009601 49 54 45         [ 4] 3572         CALL     VPP
      009604 52 41 4C         [ 2] 3573         JP     STORE
                                   3574 
                                   3575 ;; Structures
                                   3576 
                                   3577 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3578 ;       FOR     ( -- a )
                                   3579 ;       Start a FOR-NEXT loop
                                   3580 ;       structure in a colon definition.
                                   3581 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      009607                       3582         _HEADER FOR,IMEDD+3,"FOR"
      009607 CD 95                    1         .word LINK 
                           0015AB     2         LINK=.
      009609 E5                       3         .byte IMEDD+3  
      00960A 84 EF CC                 4         .ascii "FOR"
      0015AF                          5         FOR:
      00960D 95 A0 65         [ 4] 3583         CALL     COMPI
      00960F 05 E2                 3584         .word TOR 
      00960F CD 84 EF         [ 2] 3585         JP     HERE
                                   3586 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



                                   3587 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3588 ;       NEXT    ( a -- )
                                   3589 ;       Terminate a FOR-NEXT loop.
                                   3590 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0015B7                       3591         _HEADER NEXT,IMEDD+4,"NEXT"
      009612 00 22                    1         .word LINK 
                           0015B9     2         LINK=.
      009614 CD                       3         .byte IMEDD+4  
      009615 91 98 CD 8D              4         .ascii "NEXT"
      0015BE                          5         NEXT:
      009619 5C CD 8E         [ 4] 3592         CALL     COMPI
      00961C 1C CD                 3593         .word DONXT 
      00961E 8D 45 CD         [ 4] 3594         call ADRADJ
      009621 88 BC CD         [ 2] 3595         JP     COMMA
                                   3596 
                                   3597 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3598 ;       I ( -- n )
                                   3599 ;       stack COUNTER
                                   3600 ;       of innermost FOR-NEXT  
                                   3601 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0015C9                       3602         _HEADER IFETCH,1,"I"
      009624 87 F0                    1         .word LINK 
                           0015CB     2         LINK=.
      009626 CC                       3         .byte 1  
      009627 85                       4         .ascii "I"
      0015CD                          5         IFETCH:
      009628 51 95 FF         [ 2] 3603         subw x,#CELLL 
      00962B 83 46            [ 2] 3604         ldw y,(3,sp)
      00962D 4F               [ 2] 3605         ldw (x),y 
      00962E 52               [ 4] 3606         ret 
                                   3607 
                                   3608 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3609 ;       J ( -- n )
                                   3610 ;   stack COUNTER
                                   3611 ;   of outer FOR-NEXT  
                                   3612 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00962F                       3613         _HEADER JFETCH,1,"J"
      00962F CD 95                    1         .word LINK 
                           0015D6     2         LINK=.
      009631 E5                       3         .byte 1  
      009632 86                       4         .ascii "J"
      0015D8                          5         JFETCH:
      009633 62 CC 8D         [ 2] 3614         SUBW X,#CELLL 
      009636 5C 96            [ 2] 3615         LDW Y,(5,SP)
      009638 2B               [ 2] 3616         LDW (X),Y 
      009639 84               [ 4] 3617         RET 
                                   3618 
                                   3619 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3620 ;       BEGIN   ( -- a )
                                   3621 ;       Start an infinite or
                                   3622 ;       indefinite loop structure.
                                   3623 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0015DF                       3624         _HEADER BEGIN,IMEDD+5,"BEGIN"
      00963A 4E 45                    1         .word LINK 
                           0015E1     2         LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



      00963C 58                       3         .byte IMEDD+5  
      00963D 54 45 47 49 4E           4         .ascii "BEGIN"
      00963E                          5         BEGIN:
      00963E CD 95 E5         [ 2] 3625         JP     HERE
                                   3626 
                                   3627 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3628 ;       UNTIL   ( a -- )
                                   3629 ;       Terminate a BEGIN-UNTIL
                                   3630 ;       indefinite loop structure.
                                   3631 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0015EA                       3632         _HEADER UNTIL,IMEDD+5,"UNTIL"
      009641 85 03                    1         .word LINK 
                           0015EC     2         LINK=.
      009643 CD                       3         .byte IMEDD+5  
      009644 88 3C CC 95 A0           4         .ascii "UNTIL"
      0015F2                          5         UNTIL:
      009649 96 39 01         [ 4] 3633         CALL     COMPI
      00964C 49 98                 3634         .word    QBRAN 
      00964D CD 07 BC         [ 4] 3635         call ADRADJ
      00964D 1D 00 02         [ 2] 3636         JP     COMMA
                                   3637 
                                   3638 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3639 ;       AGAIN   ( a -- )
                                   3640 ;       Terminate a BEGIN-AGAIN
                                   3641 ;       infinite loop structure.
                                   3642 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0015FD                       3643         _HEADER AGAIN,IMEDD+5,"AGAIN"
      009650 16 03                    1         .word LINK 
                           0015FF     2         LINK=.
      009652 FF                       3         .byte IMEDD+5  
      009653 81 96 4B 01 4A           4         .ascii "AGAIN"
      009658                          5         AGAIN:
      009658 1D 00 02         [ 4] 3644         CALL     COMPI
      00965B 16 05                 3645         .word BRAN
      00965D FF 81 96         [ 4] 3646         call ADRADJ 
      009660 56 85 42         [ 2] 3647         JP     COMMA
                                   3648 
                                   3649 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3650 ;       IF      ( -- A )
                                   3651 ;       Begin a conditional branch.
                                   3652 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001610                       3653         _HEADER IFF,IMEDD+2,"IF"
      009663 45 47                    1         .word LINK 
                           001612     2         LINK=.
      009665 49                       3         .byte IMEDD+2  
      009666 4E 46                    4         .ascii "IF"
      009667                          5         IFF:
      009667 CC 8D 5C         [ 4] 3654         CALL     COMPI
      00966A 96 61                 3655         .word QBRAN
      00966C 85 55 4E         [ 4] 3656         CALL     HERE
      00966F 54 49 4C         [ 4] 3657         CALL     ZERO
      009672 CC 15 20         [ 2] 3658         JP     COMMA
                                   3659 
                                   3660 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3661 ;       THEN        ( A -- )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



                                   3662 ;       Terminate a conditional 
                                   3663 ;       branch structure.
                                   3664 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001623                       3665         _HEADER THENN,IMEDD+4,"THEN"
      009672 CD 95                    1         .word LINK 
                           001625     2         LINK=.
      009674 E5                       3         .byte IMEDD+4  
      009675 85 18 CD 88              4         .ascii "THEN"
      00162A                          5         THENN:
      009679 3C CC 95         [ 4] 3666         CALL     HERE
      00967C A0 96 6C         [ 4] 3667         call ADRADJ 
      00967F 85 41 47         [ 4] 3668         CALL     SWAPP
      009682 41 49 4E         [ 2] 3669         JP     STORE
                                   3670 
                                   3671 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3672 ;       ELSE        ( A -- A )
                                   3673 ;       Start the false clause in 
                                   3674 ;       an IF-ELSE-THEN structure.
                                   3675 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      009685                       3676         _HEADER ELSEE,IMEDD+4,"ELSE"
      009685 CD 95                    1         .word LINK 
                           001638     2         LINK=.
      009687 E5                       3         .byte IMEDD+4  
      009688 85 34 CD 88              4         .ascii "ELSE"
      00163D                          5         ELSEE:
      00968C 3C CC 95         [ 4] 3677         CALL     COMPI
      00968F A0 96                 3678         .word BRAN
      009691 7F 82 49         [ 4] 3679         CALL     HERE
      009694 46 0B FF         [ 4] 3680         CALL     ZERO
      009695 CD 15 20         [ 4] 3681         CALL     COMMA
      009695 CD 95 E5         [ 4] 3682         CALL     SWAPP
      009698 85 18 CD         [ 4] 3683         CALL     HERE
      00969B 8D 5C CD         [ 4] 3684         call ADRADJ 
      00969E 8C 7F CC         [ 4] 3685         CALL     SWAPP
      0096A1 95 A0 96         [ 2] 3686         JP     STORE
                                   3687 
                                   3688 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3689 ;       AHEAD       ( -- A )
                                   3690 ;       Compile a forward branch
                                   3691 ;       instruction.
                                   3692 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00165A                       3693         _HEADER AHEAD,IMEDD+5,"AHEAD"
      0096A4 92 84                    1         .word LINK 
                           00165C     2         LINK=.
      0096A6 54                       3         .byte IMEDD+5  
      0096A7 48 45 4E 41 44           4         .ascii "AHEAD"
      0096AA                          5         AHEAD:
      0096AA CD 8D 5C         [ 4] 3694         CALL     COMPI
      0096AD CD 88                 3695         .word BRAN
      0096AF 3C CD 86         [ 4] 3696         CALL     HERE
      0096B2 A9 CC 85         [ 4] 3697         CALL     ZERO
      0096B5 51 96 A5         [ 2] 3698         JP     COMMA
                                   3699 
                                   3700 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3701 ;       WHILE       ( a -- A a )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



                                   3702 ;       Conditional branch out of a 
                                   3703 ;       BEGIN-WHILE-REPEAT loop.
                                   3704 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001670                       3705         _HEADER WHILE,IMEDD+5,"WHILE"
      0096B8 84 45                    1         .word LINK 
                           001672     2         LINK=.
      0096BA 4C                       3         .byte IMEDD+5  
      0096BB 53 45 49 4C 45           4         .ascii "WHILE"
      0096BD                          5         WHILE:
      0096BD CD 95 E5         [ 4] 3706         CALL     COMPI
      0096C0 85 34                 3707         .word QBRAN
      0096C2 CD 8D 5C         [ 4] 3708         CALL     HERE
      0096C5 CD 8C 7F         [ 4] 3709         CALL     ZERO
      0096C8 CD 95 A0         [ 4] 3710         CALL     COMMA
      0096CB CD 86 A9         [ 2] 3711         JP     SWAPP
                                   3712 
                                   3713 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3714 ;       REPEAT      ( A a -- )
                                   3715 ;       Terminate a BEGIN-WHILE-REPEAT 
                                   3716 ;       indefinite loop.
                                   3717 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001689                       3718         _HEADER REPEA,IMEDD+6,"REPEAT"
      0096CE CD 8D                    1         .word LINK 
                           00168B     2         LINK=.
      0096D0 5C                       3         .byte IMEDD+6  
      0096D1 CD 88 3C CD 86 A9        4         .ascii "REPEAT"
      001692                          5         REPEA:
      0096D7 CC 85 51         [ 4] 3719         CALL     COMPI
      0096DA 96 B8                 3720         .word BRAN
      0096DC 85 41 48         [ 4] 3721         call ADRADJ 
      0096DF 45 41 44         [ 4] 3722         CALL     COMMA
      0096E2 CD 0C DC         [ 4] 3723         CALL     HERE
      0096E2 CD 95 E5         [ 4] 3724         call ADRADJ 
      0096E5 85 34 CD         [ 4] 3725         CALL     SWAPP
      0096E8 8D 5C CD         [ 2] 3726         JP     STORE
                                   3727 
                                   3728 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3729 ;       AFT         ( a -- a A )
                                   3730 ;       Jump to THEN in a FOR-AFT-THEN-NEXT 
                                   3731 ;       loop the first time through.
                                   3732 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0016A9                       3733         _HEADER AFT,IMEDD+3,"AFT"
      0096EB 8C 7F                    1         .word LINK 
                           0016AB     2         LINK=.
      0096ED CC                       3         .byte IMEDD+3  
      0096EE 95 A0 96                 4         .ascii "AFT"
      0016AF                          5         AFT:
      0096F1 DC 85 57         [ 4] 3734         CALL     DROP
      0096F4 48 49 4C         [ 4] 3735         CALL     AHEAD
      0096F7 45 0C DC         [ 4] 3736         CALL     HERE
      0096F8 CC 06 29         [ 2] 3737         JP     SWAPP
                                   3738 
                                   3739 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3740 ;       ABORT"      ( -- ; <string> )
                                   3741 ;       Conditional abort with an error message.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



                                   3742 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0016BB                       3743         _HEADER ABRTQ,IMEDD+6,'ABORT"'
      0096F8 CD 95                    1         .word LINK 
                           0016BD     2         LINK=.
      0096FA E5                       3         .byte IMEDD+6  
      0096FB 85 18 CD 8D 5C CD        4         .ascii 'ABORT"'
      0016C4                          5         ABRTQ:
      009701 8C 7F CD         [ 4] 3744         CALL     COMPI
      009704 95 A0                 3745         .word ABORQ
      009706 CC 86 A9         [ 2] 3746         JP     STRCQ
                                   3747 
                                   3748 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3749 ;       $"     ( -- ; <string> )
                                   3750 ;       Compile an inline string literal.
                                   3751 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0016CC                       3752         _HEADER STRQ,IMEDD+2,'$"'
      009709 96 F2                    1         .word LINK 
                           0016CE     2         LINK=.
      00970B 86                       3         .byte IMEDD+2  
      00970C 52 45                    4         .ascii '$"'
      0016D1                          5         STRQ:
      00970E 50 45 41         [ 4] 3753         CALL     COMPI
      009711 54 A0                 3754         .word STRQP 
      009712 CC 15 8F         [ 2] 3755         JP     STRCQ
                                   3756 
                                   3757 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3758 ;       ."          ( -- ; <string> )
                                   3759 ;       Compile an inline string literal 
                                   3760 ;       to be typed out at run time.
                                   3761 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0016D9                       3762         _HEADER DOTQ,IMEDD+2,'."'
      009712 CD 95                    1         .word LINK 
                           0016DB     2         LINK=.
      009714 E5                       3         .byte IMEDD+2  
      009715 85 34                    4         .ascii '."'
      0016DE                          5         DOTQ:
      009717 CD 88 3C         [ 4] 3763         CALL     COMPI
      00971A CD 95                 3764         .word DOTQP 
      00971C A0 CD 8D         [ 2] 3765         JP     STRCQ
                                   3766 
                                   3767 ;; Name compiler
                                   3768 
                                   3769 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3770 ;       ?UNIQUE ( a -- a )
                                   3771 ;       Display a warning message
                                   3772 ;       if word already exists.
                                   3773 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0016E6                       3774         _HEADER UNIQU,7,"?UNIQUE"
      00971F 5C CD                    1         .word LINK 
                           0016E8     2         LINK=.
      009721 88                       3         .byte 7  
      009722 3C CD 86 A9 CC 85 51     4         .ascii "?UNIQUE"
      0016F0                          5         UNIQU:
      009729 97 0B 83         [ 4] 3775         CALL     DUPP
      00972C 41 46 54         [ 4] 3776         CALL     NAMEQ   ;?name exists
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



      00972F CD 04 98         [ 4] 3777         CALL     QBRAN
      00972F CD 86                 3778         .word      UNIQ1
      009731 8F CD 96         [ 4] 3779         CALL     DOTQP   ;redef are OK
      009734 E2                    3780         .byte       7
      009735 CD 8D 5C CC 86 A9 97  3781         .ascii     " reDef "       
      00973C 2B 86 41         [ 4] 3782         CALL     OVER
      00973F 42 4F 52         [ 4] 3783         CALL     COUNT
      009742 54 22 5F         [ 4] 3784         CALL     TYPES   ;just in case
      009744 CC 06 0F         [ 2] 3785 UNIQ1:  JP     DROP
                                   3786 
                                   3787 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3788 ;       $,n     ( na -- )
                                   3789 ;       Build a new dictionary name
                                   3790 ;       using string at na.
                                   3791 ; compile dans l'espace des variables 
                                   3792 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3793 ;        _HEADER SNAME,3,^/"$,n"/
      001712                       3794 SNAME: 
      009744 CD 95 E5         [ 4] 3795         CALL     DUPP
      009747 94 62 CC         [ 4] 3796         CALL     CAT     ;?null input
      00974A 96 0F 97         [ 4] 3797         CALL     QBRAN
      00974D 3D 82                 3798         .word      PNAM1
      00974F 24 22 F0         [ 4] 3799         CALL     UNIQU   ;?redefinition
      009751 CD 06 19         [ 4] 3800         CALL     DUPP
      009751 CD 95 E5         [ 4] 3801         CALL     COUNT
      009754 90 20 CC         [ 4] 3802         CALL     PLUS
      009757 96 0F 97         [ 4] 3803         CALL     VPP
      00975A 4E 82 2E         [ 4] 3804         CALL     STORE
      00975D 22 06 19         [ 4] 3805         CALL     DUPP
      00975E CD 07 8E         [ 4] 3806         CALL     LAST
      00975E CD 95 E5         [ 4] 3807         CALL     STORE   ;save na for vocabulary link
      009761 90 24 CC         [ 4] 3808         CALL     CELLM   ;link address
      009764 96 0F 97         [ 4] 3809         CALL     CNTXT
      009767 5B 07 3F         [ 4] 3810         CALL     AT
      00976A 55 4E 49         [ 4] 3811         CALL     SWAPP
      00976D 51 55 45         [ 4] 3812         CALL     STORE
      009770 81               [ 4] 3813         RET     ;save code pointer
      009770 CD 86 99         [ 4] 3814 PNAM1:  CALL     STRQP
      009773 CD                    3815         .byte      5
      009774 93 56 CD 85 18        3816         .ascii     " name" ;null input
      009779 97 8F CD         [ 2] 3817         JP     ABOR1
                                   3818 
                                   3819 ;; FORTH compiler
                                   3820 
                                   3821 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3822 ;       $COMPILE        ( a -- )
                                   3823 ;       Compile next word to
                                   3824 ;       dictionary as a token or literal.
                                   3825 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001754                       3826         _HEADER SCOMP,8,"$COMPILE"
      00977C 90 24                    1         .word LINK 
                           001756     2         LINK=.
      00977E 07                       3         .byte 8  
      00977F 20 72 65 44 65 66 20     4         .ascii "$COMPILE"
             CD
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



      00175F                          5         SCOMP:
      009787 86 C1 CD         [ 4] 3827         CALL     NAMEQ
      00978A 8D 45 CD         [ 4] 3828         CALL     QDUP    ;?defined
      00978D 8F DF CC         [ 4] 3829         CALL     QBRAN
      009790 86 8F                 3830         .word      SCOM2
      009792 CD 04 E3         [ 4] 3831         CALL     AT
      009792 CD 86 99         [ 4] 3832         CALL     DOLIT
      009795 CD 85                 3833         .word     0x8000	;  IMEDD*256
      009797 81 CD 85         [ 4] 3834         CALL     ANDD    ;?immediate
      00979A 18 97 C8         [ 4] 3835         CALL     QBRAN
      00979D CD 97                 3836         .word      SCOM1
      00979F 70 CD 86         [ 2] 3837         JP     EXECU
      0097A2 99 CD 8D         [ 2] 3838 SCOM1:  JP     JSRC
      0097A5 45 CD 88         [ 4] 3839 SCOM2:  CALL     NUMBQ   ;try to convert to number
      0097A8 BC CD 87         [ 4] 3840         CALL    QDUP  
      0097AB F0 CD 85         [ 4] 3841         CALL     QBRAN
      0097AE 51 CD                 3842         .word      ABOR1
      00178B                       3843         _DOLIT  -1
      0097B0 86 99 CD         [ 4]    1     CALL DOLIT 
      0097B3 88 0E                    2     .word -1 
      0097B5 CD 85 51         [ 4] 3844         CALL    EQUAL
      001793                       3845         _QBRAN DLITER  
      0097B8 CD 8B F7         [ 4]    1     CALL QBRAN
      0097BB CD 87                    2     .word DLITER
      0097BD E2 CD 85         [ 2] 3846         JP     LITER
                                   3847 
                                   3848 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3849 ;       OVERT   ( -- )
                                   3850 ;       Link a new word into vocabulary.
                                   3851 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00179B                       3852         _HEADER OVERT,5,"OVERT"
      0097C0 63 CD                    1         .word LINK 
                           00179D     2         LINK=.
      0097C2 86                       3         .byte 5  
      0097C3 A9 CD 85 51 81           4         .ascii "OVERT"
      0017A3                          5         OVERT:
      0097C8 CD 90 20         [ 4] 3853         CALL     LAST
      0097CB 05 20 6E         [ 4] 3854         CALL     AT
      0097CE 61 6D 65         [ 4] 3855         CALL     CNTXT
      0097D1 CC 94 6A         [ 2] 3856         JP     STORE
                                   3857 
                                   3858 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3859 ;       ;       ( -- )
                                   3860 ;       Terminate a colon definition.
                                   3861 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0017AF                       3862         _HEADER SEMIS,IMEDD+COMPO+1,^/";"/
      0097D4 97 68                    1         .word LINK 
                           0017B1     2         LINK=.
      0097D6 08                       3         .byte IMEDD+COMPO+1  
      0097D7 24                       4         .ascii ";"
      0017B3                          5         SEMIS:
                           000001  3863 .if OPTIMIZE ; more compact and faster
      0097D8 43 4F 4D         [ 4] 3864         call DOLIT 
      0097DB 50 49                 3865         .word 0x81   ; opcode for RET 
      0097DD 4C 45 37         [ 4] 3866         call CCOMMA 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



                           000000  3867 .else
                                   3868         CALL     COMPI
                                   3869         .word EXIT 
                                   3870 .endif 
      0097DF CD 14 4B         [ 4] 3871         CALL     LBRAC
      0097DF CD 93 56         [ 4] 3872         call OVERT 
      0097E2 CD 88 4C         [ 4] 3873         CALL FMOVE
      0097E5 CD 85 18         [ 4] 3874         call QDUP 
      0097E8 98 00 CD         [ 4] 3875         call QBRAN 
      0097EB 85 63                 3876         .word SET_RAMLAST 
      0097ED CD 84 EF         [ 4] 3877         CALL UPDATPTR
      0097F0 80               [ 4] 3878         RET 
                                   3879 
                                   3880 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3881 ;       Terminate an ISR definition 
                                   3882 ;       retourn ca of ISR as double
                                   3883 ;       I; ( -- ud )
                                   3884 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0017D0                       3885        _HEADER ISEMI,2+IMEDD+COMPO,^/"I;"/
      0097F1 00 CD                    1         .word LINK 
                           0017D2     2         LINK=.
      0097F3 86                       3         .byte 2+IMEDD+COMPO  
      0097F4 F6 CD                    4         .ascii "I;"
      0017D5                          5         ISEMI:
      0097F6 85 18 97         [ 2] 3886         subw x,#CELLL  
      0097F9 FD CC 85 44      [ 2] 3887         ldw y,#IRET_CODE 
      0097FD CC               [ 2] 3888         ldw (x),y 
      0097FE 98 AA CD         [ 4] 3889         call CCOMMA
      009801 A5 FE CD         [ 4] 3890         call LBRAC 
      009804 88 4C CD         [ 4] 3891         call IFMOVE
      009807 85 18 94         [ 4] 3892         call QDUP 
      00980A 6A CD 84         [ 4] 3893         CALL QBRAN 
      00980D EF FF                 3894         .word SET_RAMLAST
      00980F FF CD 89         [ 4] 3895         CALL CPP
      009812 7A CD 85         [ 4] 3896         call AT 
      009815 18 A9 D1         [ 4] 3897         call SWAPP 
      009818 CC 96 07         [ 4] 3898         CALL CPP 
      00981B 97 D6 05         [ 4] 3899         call STORE 
      00981E 4F 56 45         [ 4] 3900         call UPDATCP 
      009821 52 54 70         [ 4] 3901         call EEPVP 
      009823                       3902         _DROP 
      009823 CD 88 0E         [ 2]    1     ADDW X,#CELLL  
      009826 CD 85 63         [ 4] 3903         call AT 
      009829 CD 87 E2         [ 4] 3904         call VPP 
      00982C CC 85 51         [ 4] 3905         call STORE 
      00982F 98 1D C1         [ 2] 3906         jp ZERO
      009832 3B               [ 4] 3907         ret           
                                   3908         
                                   3909 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3910 ;       ]       ( -- )
                                   3911 ;       Start compiling words in
                                   3912 ;       input stream.
                                   3913 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      009833                       3914         _HEADER RBRAC,1,"]"
      009833 CD 84                    1         .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



                           001815     2         LINK=.
      009835 EF                       3         .byte 1  
      009836 00                       4         .ascii "]"
      001817                          5         RBRAC:
      009837 81 CD 95         [ 4] 3915         CALL   DOLIT
      00983A B7 CD                 3916         .word  SCOMP
      00983C 94 CB CD         [ 4] 3917         CALL   TEVAL
      00983F 98 23 CD         [ 2] 3918         JP     STORE
                                   3919 
                                   3920 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3921 ;       CALL,    ( ca -- )
                                   3922 ;       Compile a subroutine call.
                                   3923 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001822                       3924         _HEADER JSRC,5,^/"CALL,"/
      009842 A2 A2                    1         .word LINK 
                           001824     2         LINK=.
      009844 CD                       3         .byte 5  
      009845 88 4C CD 85 18           4         .ascii "CALL,"
      00182A                          5         JSRC:
      00984A 99 7A CD         [ 4] 3925         CALL     DOLIT
      00984D A3 36                 3926         .word     CALLL     ;CALL
      00984F 81 98 31         [ 4] 3927         CALL     CCOMMA
      009852 C2 49 3B         [ 2] 3928         JP     COMMA
                                   3929 
                                   3930 ;       INIT-OFS ( -- )
                                   3931 ;       compute offset to adjust jump address 
                                   3932 ;       set variable OFFSET 
      009855 18 24                 3933         .word LINK 
                           001837  3934         LINK=.
      009855 1D                    3935         .byte 8 
      009856 00 02 90 AE 00 80 FF  3936         .ascii "INIT-OFS" 
             CD
      001840                       3937 INITOFS:
      00985E 95 B7 CD         [ 4] 3938         call TFLASH 
      009861 94 CB CD         [ 4] 3939         CALL AT 
      009864 A3 7B CD         [ 4] 3940         CALL DUPP 
      009867 88 4C CD         [ 4] 3941         call QBRAN
      00986A 85 18                 3942         .word 1$
      00184E                       3943         _DROP  
      00986C 99 7A CD         [ 2]    1     ADDW X,#CELLL  
      00986F 87 FE CD         [ 4] 3944         call CPP 
      009872 85 63 CD         [ 4] 3945         call AT 
      009875 86 A9 CD         [ 4] 3946         call HERE
      009878 87 FE CD         [ 4] 3947         call SUBB 
      00987B 85 51 CD         [ 4] 3948 1$:     call OFFSET 
      00987E 9D 33 CD         [ 2] 3949         jp STORE  
                                   3950 
                                   3951 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3952 ;       :       ( -- ; <string> )
                                   3953 ;       Start a new colon definition
                                   3954 ;       using next word as its name.
                                   3955 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001863                       3956         _HEADER COLON,1,":"
      009881 9C F0                    1         .word LINK 
                           001865     2         LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



      009883 1C                       3         .byte 1  
      009884 00                       4         .ascii ":"
      001867                          5         COLON:
      009885 02 CD 85         [ 4] 3957         call INITOFS       
      009888 63 CD 87         [ 4] 3958         CALL   TOKEN
      00988B F0 CD 85         [ 4] 3959         CALL   SNAME
      00988E 51 CC 8C         [ 2] 3960         JP     RBRAC
                                   3961 
                                   3962 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3963 ;       I:  ( -- )
                                   3964 ;       Start interrupt service 
                                   3965 ;       routine definition
                                   3966 ;       those definition have 
                                   3967 ;       no name.
                                   3968 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001873                       3969         _HEADER ICOLON,2,"I:"
      009891 7F 81                    1         .word LINK 
                           001875     2         LINK=.
      009893 98                       3         .byte 2  
      009894 52 01                    4         .ascii "I:"
      001878                          5         ICOLON:
      009896 5D 18 40         [ 4] 3970         call INITOFS 
      009897 CC 18 17         [ 2] 3971         jp RBRAC  
                                   3972 
                                   3973 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3974 ;       IMMEDIATE       ( -- )
                                   3975 ;       Make last compiled word
                                   3976 ;       an immediate word.
                                   3977 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00187E                       3978         _HEADER IMMED,9,"IMMEDIATE"
      009897 CD 84                    1         .word LINK 
                           001880     2         LINK=.
      009899 EF                       3         .byte 9  
      00989A 97 DF CD 87 C0 CC 85     4         .ascii "IMMEDIATE"
             51 98
      00188A                          5         IMMED:
      0098A3 95 05 43         [ 4] 3979         CALL     DOLIT
      0098A6 41 4C                 3980         .word     0x8000	;  IMEDD*256
      0098A8 4C 2C 8E         [ 4] 3981         CALL     LAST
      0098AA CD 04 E3         [ 4] 3982         CALL     AT
      0098AA CD 84 EF         [ 4] 3983         CALL     AT
      0098AD 00 CD CD         [ 4] 3984         CALL     ORR
      0098B0 95 B7 CC         [ 4] 3985         CALL     LAST
      0098B3 95 A0 98         [ 4] 3986         CALL     AT
      0098B6 A4 08 49         [ 2] 3987         JP     STORE
                                   3988 
                                   3989 ;; Defining words
                                   3990 
                                   3991 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3992 ;       CREATE  ( -- ; <string> )
                                   3993 ;       Compile a new array
                                   3994 ;       without allocating space.
                                   3995 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0018A4                       3996         _HEADER CREAT,6,"CREATE"
      0098B9 4E 49                    1         .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



                           0018A6     2         LINK=.
      0098BB 54                       3         .byte 6  
      0098BC 2D 4F 46 53 54 45        4         .ascii "CREATE"
      0098C0                          5         CREAT:
      0098C0 CD 87 AF         [ 4] 3997         CALL     TOKEN
      0098C3 CD 85 63         [ 4] 3998         CALL     SNAME
      0098C6 CD 86 99         [ 4] 3999         CALL     OVERT        
      0098C9 CD 85 18         [ 4] 4000         CALL     COMPI 
      0098CC 98 DD                 4001         .word DOVAR 
      0098CE 1C               [ 4] 4002         RET
                                   4003 
                                   4004 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4005 ;       VARIABLE  ( -- ; <string> )
                                   4006 ;       Compile a new variable
                                   4007 ;       initialized to 0.
                                   4008 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0018BC                       4009         _HEADER VARIA,8,"VARIABLE"
      0098CF 00 02                    1         .word LINK 
                           0018BE     2         LINK=.
      0098D1 CD                       3         .byte 8  
      0098D2 87 FE CD 85 63 CD 8D     4         .ascii "VARIABLE"
             5C
      0018C7                          5         VARIA:
                                   4010 ; indirect variable so that VARIABLE definition can be compiled in FLASH 
      0098DA CD 89 52         [ 4] 4011         CALL HERE
      0098DD CD 88 33         [ 4] 4012         CALL DUPP 
      0098E0 CC 85 51         [ 4] 4013         CALL CELLP
      0098E3 98 B7 01         [ 4] 4014         CALL VPP 
      0098E6 3A 04 D1         [ 4] 4015         CALL STORE
      0098E7 CD 18 AD         [ 4] 4016         CALL CREAT
      0098E7 CD 98 C0         [ 4] 4017         CALL DUPP
      0098EA CD 92 59         [ 4] 4018         CALL COMMA
      0098ED CD 97 92         [ 4] 4019         CALL ZERO
      0098F0 CC 98 97         [ 4] 4020         call SWAPP 
      0098F3 98 E5 02         [ 4] 4021         CALL STORE
      0098F6 49 3A 22         [ 4] 4022         CALL FMOVE ; move definition to FLASH
      0098F8 CD 07 CC         [ 4] 4023         CALL QDUP 
      0098F8 CD 98 C0         [ 4] 4024         CALL QBRAN 
      0098FB CC 98                 4025         .word SET_RAMLAST   
      0098FD 97 98 F5         [ 4] 4026         call UPDATVP  ; don't update if variable kept in RAM.
      009900 09 49 4D         [ 4] 4027         CALL UPDATPTR
      009903 4D               [ 4] 4028         RET         
      0018FA                       4029 SET_RAMLAST: 
      009904 45 44 49         [ 4] 4030         CALL LAST 
      009907 41 54 45         [ 4] 4031         CALL AT 
      00990A CD 07 A1         [ 4] 4032         CALL RAMLAST 
      00990A CD 84 EF         [ 2] 4033         jp STORE  
                                   4034 
                                   4035 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4036 ;       CONSTANT  ( n -- ; <string> )
                                   4037 ;       Compile a new constant 
                                   4038 ;       n CONSTANT name 
                                   4039 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001906                       4040         _HEADER CONSTANT,8,"CONSTANT"
      00990D 80 00                    1         .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



                           001908     2         LINK=.
      00990F CD                       3         .byte 8  
      009910 88 0E CD 85 63 CD 85     4         .ascii "CONSTANT"
             63
      001911                          5         CONSTANT:
      009918 CD 87 0A         [ 4] 4041         CALL TOKEN
      00991B CD 88 0E         [ 4] 4042         CALL SNAME 
      00991E CD 85 63         [ 4] 4043         CALL OVERT 
      009921 CC 85 51         [ 4] 4044         CALL COMPI 
      009924 99 00                 4045         .word DOCONST
      009926 06 43 52         [ 4] 4046         CALL COMMA 
      009929 45 41 54         [ 4] 4047         CALL FMOVE
      00992C 45 07 CC         [ 4] 4048         CALL QDUP 
      00992D CD 04 98         [ 4] 4049         CALL QBRAN 
      00992D CD 92                 4050         .word SET_RAMLAST  
      00992F 59 CD 97         [ 4] 4051         CALL UPDATPTR  
      009932 92               [ 4] 4052 1$:     RET          
                                   4053 
                                   4054 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4055 ; CONSTANT runtime semantic 
                                   4056 ; doCONST  ( -- n )
                                   4057 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4058 ;       _HEADER DOCONST,7,"DOCONST"
      001931                       4059 DOCONST:
      009933 CD 98 23         [ 2] 4060         subw x,#CELLL
      009936 CD 95            [ 2] 4061         popw y 
      009938 E5 87            [ 2] 4062         ldw y,(y) 
      00993A 4F               [ 2] 4063         ldw (x),y 
      00993B 81               [ 4] 4064         ret 
                                   4065 
                                   4066 ;----------------------------------
                                   4067 ; create double constant 
                                   4068 ; 2CONSTANT ( d -- ; <string> )
                                   4069 ;----------------------------------
      00193A                       4070         _HEADER DCONST,9,"2CONSTANT"
      00993C 99 26                    1         .word LINK 
                           00193C     2         LINK=.
      00993E 08                       3         .byte 9  
      00993F 56 41 52 49 41 42 4C     4         .ascii "2CONSTANT"
             45 54
      009947                          5         DCONST:
      009947 CD 8D 5C         [ 4] 4071         CALL TOKEN
      00994A CD 86 99         [ 4] 4072         CALL SNAME 
      00994D CD 8B E8         [ 4] 4073         CALL OVERT 
      009950 CD 87 F0         [ 4] 4074         CALL COMPI 
      009953 CD 85                 4075         .word DO_DCONST
      009955 51 CD 99         [ 4] 4076         CALL COMMA
      009958 2D CD 86         [ 4] 4077         CALL COMMA  
      00995B 99 CD 95         [ 4] 4078         CALL FMOVE
      00995E A0 CD 8C         [ 4] 4079         CALL QDUP 
      009961 7F CD 86         [ 4] 4080         CALL QBRAN 
      009964 A9 CD                 4081         .word SET_RAMLAST  
      009966 85 51 CD         [ 4] 4082         CALL UPDATPTR  
      009969 A2               [ 4] 4083 1$:     RET          
                                   4084     
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



                                   4085 ;----------------------------------
                                   4086 ; runtime for DCONST 
                                   4087 ; stack double constant 
                                   4088 ; DO-DCONST ( -- d )
                                   4089 ;-----------------------------------
                                   4090 ;       _HEADER DO_DCONST,9,"DO-DCONST"
      001969                       4091 DO_DCONST:
      00996A A2 CD            [ 2] 4092     popw y 
      00996C 88 4C CD         [ 2] 4093     ldw YTEMP,y 
      00996F 85 18 99         [ 2] 4094     subw x,#2*CELLL 
      009972 7A CD            [ 2] 4095     ldw y,(y)
      009974 9D               [ 2] 4096     ldw (x),y 
      009975 4A CD A3         [ 2] 4097     ldw y,YTEMP 
      009978 36 81 02         [ 2] 4098     ldw y,(2,y)
      00997A EF 02            [ 2] 4099     ldw (2,x),y 
      00997A CD               [ 4] 4100     ret 
                                   4101 
                                   4102 ;; Tools
                                   4103 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4104 ;       _TYPE   ( b u -- )
                                   4105 ;       Display a string. Filter
                                   4106 ;       non-printing characters.
                                   4107 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00197D                       4108         _HEADER UTYPE,5,"_TYPE"
      00997B 88 0E                    1         .word LINK 
                           00197F     2         LINK=.
      00997D CD                       3         .byte 5  
      00997E 85 63 CD 88 21           4         .ascii "_TYPE"
      001985                          5         UTYPE:
      009983 CC 85 51         [ 4] 4109         CALL     TOR     ;start count down loop
      009986 99 3E            [ 2] 4110         JRA     UTYP2   ;skip first pass
      009988 08 43 4F         [ 4] 4111 UTYP1:  CALL     DUPP
      00998B 4E 53 54         [ 4] 4112         CALL     CAT
      00998E 41 4E 54         [ 4] 4113         CALL     TCHAR
      009991 CD 04 36         [ 4] 4114         CALL     EMIT    ;display only printable
      009991 CD 92 59         [ 4] 4115         CALL     ONEP    ;increment address
      009994 CD 97 92         [ 4] 4116 UTYP2:  CALL     DONXT
      009997 CD 98                 4117         .word      UTYP1   ;loop till done
      009999 23 CD 95         [ 2] 4118         JP     DROP
                                   4119 
                                   4120 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4121 ;       dm+     ( a u -- a )
                                   4122 ;       Dump u bytes from ,
                                   4123 ;       leaving a+u on  stack.
                                   4124 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0019A1                       4125         _HEADER DUMPP,3,"DM+"
      00999C E5 99                    1         .word LINK 
                           0019A3     2         LINK=.
      00999E B1                       3         .byte 3  
      00999F CD 95 A0                 4         .ascii "DM+"
      0019A7                          5         DUMPP:
      0099A2 CD A2 A2         [ 4] 4126         CALL     OVER
      0099A5 CD 88 4C         [ 4] 4127         CALL     DOLIT
      0099A8 CD 85                 4128         .word      4
      0099AA 18 99 7A         [ 4] 4129         CALL     UDOTR   ;display address
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



      0099AD CD A3 36         [ 4] 4130         CALL     SPACE
      0099B0 81 05 E2         [ 4] 4131         CALL     TOR     ;start count down loop
      0099B1 20 11            [ 2] 4132         JRA     PDUM2   ;skip first pass
      0099B1 1D 00 02         [ 4] 4133 PDUM1:  CALL     DUPP
      0099B4 90 85 90         [ 4] 4134         CALL     CAT
      0099B7 FE FF 81         [ 4] 4135         CALL     DOLIT
      0099BA 99 88                 4136         .word      3
      0099BC 09 32 43         [ 4] 4137         CALL     UDOTR   ;display numeric data
      0099BF 4F 4E 53         [ 4] 4138         CALL     ONEP    ;increment address
      0099C2 54 41 4E         [ 4] 4139 PDUM2:  CALL     DONXT
      0099C5 54 BA                 4140         .word      PDUM1   ;loop till done
      0099C6 81               [ 4] 4141         RET
                                   4142 
                                   4143 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4144 ;       DUMP    ( a u -- )
                                   4145 ;       Dump u bytes from a,
                                   4146 ;       in a formatted manner.
                                   4147 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0019D1                       4148         _HEADER DUMP,4,"DUMP"
      0099C6 CD 92                    1         .word LINK 
                           0019D3     2         LINK=.
      0099C8 59                       3         .byte 4  
      0099C9 CD 97 92 CD              4         .ascii "DUMP"
      0019D8                          5         DUMP:
      0099CD 98 23 CD         [ 4] 4149         CALL     BASE
      0099D0 95 E5 99         [ 4] 4150         CALL     AT
      0099D3 E9 CD 95         [ 4] 4151         CALL     TOR
      0099D6 A0 CD 95         [ 4] 4152         CALL     HEX     ;save radix, set hex
      0099D9 A0 CD A2         [ 4] 4153         CALL     DOLIT
      0099DC A2 CD                 4154         .word      16
      0099DE 88 4C CD         [ 4] 4155         CALL     SLASH   ;change count to lines
      0099E1 85 18 99         [ 4] 4156         CALL     TOR     ;start count down loop
      0099E4 7A CD A3         [ 4] 4157 DUMP1:  CALL     CR
      0099E7 36 81 6F         [ 4] 4158         CALL     DOLIT
      0099E9 00 10                 4159         .word      16
      0099E9 90 85 90         [ 4] 4160         CALL     DDUP
      0099EC BF 26 1D         [ 4] 4161         CALL     DUMPP   ;display numeric
      0099EF 00 04 90         [ 4] 4162         CALL     ROT
      0099F2 FE FF 90         [ 4] 4163         CALL     ROT
      0099F5 BE 26 90         [ 4] 4164         CALL     SPACE
      0099F8 EE 02 EF         [ 4] 4165         CALL     SPACE
      0099FB 02 81 99         [ 4] 4166         CALL     UTYPE   ;display printable characters
      0099FE BC 05 5F         [ 4] 4167         CALL     DONXT
      009A01 54 59                 4168         .word      DUMP1   ;loop till done
      009A03 50 45 0F         [ 4] 4169 DUMP3:  CALL     DROP
      009A05 CD 05 34         [ 4] 4170         CALL     RFROM
      009A05 CD 86 62         [ 4] 4171         CALL     BASE
      009A08 20 0F CD         [ 2] 4172         JP     STORE   ;restore radix
                                   4173 
                                   4174 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4175 ;       .S      ( ... -- ... )
                                   4176 ;        Display  contents of stack.
                                   4177 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001A1D                       4178         _HEADER DOTS,2,".S"
      009A0B 86 99                    1         .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



                           001A1F     2         LINK=.
      009A0D CD                       3         .byte 2  
      009A0E 85 81                    4         .ascii ".S"
      001A22                          5         DOTS:
      009A10 CD 8C A9         [ 4] 4179         CALL     CR
      009A13 CD 84 B6         [ 4] 4180         CALL     DEPTH   ;stack depth
      009A16 CD 8C 13         [ 4] 4181         CALL     TOR     ;start count down loop
      009A19 CD 85            [ 2] 4182         JRA     DOTS2   ;skip first pass
      009A1B 03 9A 0A         [ 4] 4183 DOTS1:  CALL     RAT
      009A1E CC 86 8F         [ 4] 4184 	CALL     PICK
      009A21 99 FF 03         [ 4] 4185         CALL     DOT     ;index stack, display contents
      009A24 44 4D 2B         [ 4] 4186 DOTS2:  CALL     DONXT
      009A27 1A 2D                 4187         .word      DOTS1   ;loop till done
      009A27 CD 86 C1         [ 4] 4188         CALL     DOTQP
      009A2A CD                    4189         .byte      5
      009A2B 84 EF 00 04 CD        4190         .ascii     " <sp "
      009A30 90               [ 4] 4191         RET
                                   4192 
                                   4193 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4194 ;       >NAME   ( ca -- na | F )
                                   4195 ;       Convert code address
                                   4196 ;       to a name address.
                                   4197 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001A45                       4198         _HEADER TNAME,5,">NAME"
      009A31 4D CD                    1         .word LINK 
                           001A47     2         LINK=.
      009A33 8F                       3         .byte 5  
      009A34 B5 CD 86 62 20           4         .ascii ">NAME"
      001A4D                          5         TNAME:
      009A39 11 CD 86         [ 4] 4199         CALL     CNTXT   ;vocabulary link
      009A3C 99 CD 85         [ 4] 4200 TNAM2:  CALL     AT
      009A3F 81 CD 84         [ 4] 4201         CALL     DUPP    ;?last word in a vocabulary
      009A42 EF 00 03         [ 4] 4202         CALL     QBRAN
      009A45 CD 90                 4203         .word      TNAM4
      009A47 4D CD 8C         [ 4] 4204         CALL     DDUP
      009A4A 13 CD 85         [ 4] 4205         CALL     NAMET
      009A4D 03 9A 3A         [ 4] 4206         CALL     XORR    ;compare
      009A50 81 9A 23         [ 4] 4207         CALL     QBRAN
      009A53 04 44                 4208         .word      TNAM3
      009A55 55 4D 50         [ 4] 4209         CALL     CELLM   ;continue with next word
      009A58 20 E2            [ 2] 4210         JRA     TNAM2
      009A58 CD 87 5F         [ 4] 4211 TNAM3:  CALL     SWAPP
      009A5B CD 85 63         [ 2] 4212         JP     DROP
      009A5E CD 86 62         [ 4] 4213 TNAM4:  CALL     DDROP
      009A61 CD 8F 14         [ 2] 4214         JP     ZERO
                                   4215 
                                   4216 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4217 ;       .ID     ( na -- )
                                   4218 ;        Display  name at address.
                                   4219 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001A7A                       4220         _HEADER DOTID,3,".ID"
      009A64 CD 84                    1         .word LINK 
                           001A7C     2         LINK=.
      009A66 EF                       3         .byte 3  
      009A67 00 10 CD                 4         .ascii ".ID"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



      001A80                          5         DOTID:
      009A6A 8B 39 CD         [ 4] 4221         CALL     QDUP    ;if zero no name
      009A6D 86 62 CD         [ 4] 4222         CALL     QBRAN
      009A70 8F F7                 4223         .word      DOTI1
      009A72 CD 84 EF         [ 4] 4224         CALL     COUNT
      009A75 00 10 CD         [ 4] 4225         CALL     DOLIT
      009A78 88 A7                 4226         .word      0x1F
      009A7A CD 9A 27         [ 4] 4227         CALL     ANDD    ;mask lexicon bits
      009A7D CD 88 5D         [ 2] 4228         JP     UTYPE
      009A80 CD 88 5D         [ 4] 4229 DOTI1:  CALL     DOTQP
      009A83 CD                    4230         .byte      9
      009A84 8F B5 CD 8F B5 CD 9A  4231         .ascii     " noName"
      009A8B 05               [ 4] 4232         RET
                                   4233 
                           000000  4234 WANT_SEE=0
                           000000  4235 .if WANT_SEE 
                                   4236 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4237 ;       SEE     ( -- ; <string> )
                                   4238 ;       A simple decompiler.
                                   4239 ;       Updated for byte machines.
                                   4240 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4241         _HEADER SEE,3,"SEE"
                                   4242         CALL     TICK    ;starting address
                                   4243         CALL     CR
                                   4244         CALL     ONEM
                                   4245 SEE1:   CALL     ONEP
                                   4246         CALL     DUPP
                                   4247         CALL     AT
                                   4248         CALL     DUPP
                                   4249         CALL     QBRAN
                                   4250         .word    SEE2
                                   4251         CALL     TNAME   ;?is it a name
                                   4252 SEE2:   CALL     QDUP    ;name address or zero
                                   4253         CALL     QBRAN
                                   4254         .word    SEE3
                                   4255         CALL     SPACE
                                   4256         CALL     DOTID   ;display name
                                   4257         CALL     ONEP
                                   4258         JRA      SEE4
                                   4259 SEE3:   CALL     DUPP
                                   4260         CALL     CAT
                                   4261         CALL     UDOT    ;display number
                                   4262 SEE4:   CALL     NUFQ    ;user control
                                   4263         CALL     QBRAN
                                   4264         .word    SEE1
                                   4265         JP     DROP
                                   4266 .endif ; WANT_SEE 
                                   4267 
                                   4268 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4269 ;       WORDS   ( -- )
                                   4270 ;       Display names in vocabulary.
                                   4271 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001AA2                       4272         _HEADER WORDS,5,"WORDS"
      009A8C CD 85                    1         .word LINK 
                           001AA4     2         LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



      009A8E 03                       3         .byte 5  
      009A8F 9A 6F CD 86 8F           4         .ascii "WORDS"
      001AAA                          5         WORDS:
      009A94 CD 85 B4         [ 4] 4273         CALL     CR
      009A97 CD 87 5F         [ 4] 4274         CALL     CNTXT   ;only in context
      009A9A CC 85 51         [ 4] 4275 WORS1:  CALL     AT
      009A9D 9A 53 02         [ 4] 4276         CALL     QDUP    ;?at end of list
      009AA0 2E 53 98         [ 4] 4277         CALL     QBRAN
      009AA2 1A CC                 4278         .word      WORS2
      009AA2 CD 8F F7         [ 4] 4279         CALL     DUPP
      009AA5 CD 8C C1         [ 4] 4280         CALL     SPACE
      009AA8 CD 86 62         [ 4] 4281         CALL     DOTID   ;display a name
      009AAB 20 09 CD         [ 4] 4282         CALL     CELLM
      009AAE 85 C5 CD         [ 4] 4283         CALL     BRAN
      009AB1 8C D8                 4284         .word      WORS1
      009AB3 CD               [ 4] 4285 WORS2:  RET
                                   4286 
                                   4287         
                                   4288 ;; Hardware reset
                                   4289 
                                   4290 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4291 ;  COPYRIGTH
                                   4292 ; print copyright notice 
                                   4293 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001ACD                       4294 COPYRIGHT:
      009AB4 90 9E CD         [ 4] 4295     CALL DOTQP 
      009AB7 85                    4296     .byte 33 
      009AB8 03 9A AD CD 90 24 05  4297     .ascii "Jacques Deschenes, Copyright 2021"
             20 3C 73 70 20 81 9A
             9F 05 3E 4E 41 4D 45
             70 79 72 69 67 68 74
             20 32 30 32 31
      009ACD CC 0F 77         [ 2] 4298     JP CR 
                                   4299 
                                   4300 
                                   4301 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4302 ;  PRT_LICENCE 
                                   4303 ;  print GPLV2 licence 
                                   4304 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001AF5                       4305 PRT_LICENCE:
      009ACD CD 87 E2         [ 4] 4306         CALL DOTQP 
      009AD0 CD                    4307         .byte  15 
      009AD1 85 63 CD 86 99 CD 85  4308         .ascii "LICENCE GPLV3\r\n"
             18 9A F4 CD 88 A7 CD
             92
      009AE0 67               [ 4] 4309         RET 
                                   4310 
                                   4311 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4312 ;    PRINT_VERSION ( c1 c2 -- )
                                   4313 ;    c2 minor 
                                   4314 ;    c1 major 
                                   4315 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001B09                       4316 PRINT_VERSION:
      009AE1 CD 87 1F         [ 4] 4317      CALL DOTQP 
      009AE4 CD                    4318      .byte 9
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



      009AE5 85 18 9A EE CD 8B F7  4319      .ascii " version "
             20 E2
      009AEE CD 86 A9         [ 4] 4320      CALL BDIGS 
      009AF1 CC 86 8F         [ 4] 4321      CALL DIGS 
      009AF4 CD 88 9C         [ 4] 4322      CALL DIGS 
      001B1F                       4323      _DOLIT '.' 
      009AF7 CC 8C 7F         [ 4]    1     CALL DOLIT 
      009AFA 9A C7                    2     .word '.' 
      009AFC 03 2E 49         [ 4] 4324      CALL HOLD 
      001B27                       4325      _DROP 
      009AFF 44 00 02         [ 2]    1     ADDW X,#CELLL  
      009B00 CD 0E 33         [ 4] 4326      CALL DIGS 
      009B00 CD 88 4C         [ 4] 4327      CALL EDIGS 
      009B03 CD 85 18         [ 4] 4328      CALL TYPES 
      009B06 9B               [ 4] 4329      RET 
                                   4330 
                                   4331 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4332 ;       hi      ( -- )
                                   4333 ;       Display sign-on message.
                                   4334 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001B34                       4335         _HEADER HI,2,"HI"
      009B07 16 CD                    1         .word LINK 
                           001B36     2         LINK=.
      009B09 8D                       3         .byte 2  
      009B0A 45 CD                    4         .ascii "HI"
      001B39                          5         HI:
      009B0C 84 EF 00         [ 4] 4336         CALL     CR
      009B0F 1F CD 86         [ 4] 4337         CALL     DOTQP   
      009B12 F6                    4338         .byte      10
      009B13 CC 9A 05 CD 90 24 09  4339         .ascii     "stm8eForth"
             20 6E 6F
      001B4A                       4340 	_DOLIT VER 
      009B1D 4E 61 6D         [ 4]    1     CALL DOLIT 
      009B20 65 81                    2     .word VER 
      001B4F                       4341         _DOLIT EXT 
      009B22 9A FC 05         [ 4]    1     CALL DOLIT 
      009B25 57 4F                    2     .word EXT 
      009B27 52 44 53         [ 4] 4342         CALL PRINT_VERSION 
      009B2A CD 0F A4         [ 4] 4343         CALL    DOTQP
                           000001  4344 .if NUCLEO          
      009B2A CD                    4345         .byte 18
      009B2B 8F F7 CD 87 E2 CD 85  4346         .ascii  " on NUCLEO-8S208RB"
             63 CD 88 4C CD 85 18
             9B 4C CD 86
                                   4347 .endif
                           000000  4348 .if DISCOVERY
                                   4349         .byte 19
                                   4350         .ascii  " on STM8S-DISCOVERY"
                                   4351 .endif
                           000000  4352 .if DOORBELL
                                   4353         .byte 16
                                   4354         .ascii " on stm8s105k6b6"
                                   4355 .endif
      009B3D 99 CD 8F         [ 2] 4356         JP     CR
                                   4357 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



                           000000  4358 WANT_DEBUG=0
                           000000  4359 .if WANT_DEBUG 
                                   4360 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4361 ;       DEBUG      ( -- )
                                   4362 ;       Display sign-on message.
                                   4363 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4364         _HEADER DEBUG,5,"DEBUG"
                                   4365 	CALL DOLIT
                                   4366 	.word 0x65
                                   4367 	CALL EMIT
                                   4368 	CALL ZERO
                                   4369  	CALL ZLESS 
                                   4370 	CALL DOLIT
                                   4371 	.word 0xFFFE
                                   4372 	CALL ZLESS 
                                   4373 	CALL UPLUS 
                                   4374  	_DROP 
                                   4375 	CALL DOLIT
                                   4376 	.word 3
                                   4377 	CALL UPLUS 
                                   4378 	CALL UPLUS 
                                   4379  	_DROP
                                   4380 	CALL DOLIT
                                   4381 	.word 0x43
                                   4382 	CALL UPLUS 
                                   4383  	_DROP
                                   4384 	CALL EMIT
                                   4385 	CALL DOLIT
                                   4386 	.word 0x4F
                                   4387 	CALL DOLIT
                                   4388 	.word 0x6F
                                   4389  	CALL XORR
                                   4390 	CALL DOLIT
                                   4391 	.word 0xF0
                                   4392  	CALL ANDD
                                   4393 	CALL DOLIT
                                   4394 	.word 0x4F
                                   4395  	CALL ORR
                                   4396 	CALL EMIT
                                   4397 	CALL DOLIT
                                   4398 	.word 8
                                   4399 	CALL DOLIT
                                   4400 	.word 6
                                   4401  	CALL SWAPP
                                   4402 	CALL OVER
                                   4403 	CALL XORR
                                   4404 	CALL DOLIT
                                   4405 	.word 3
                                   4406 	CALL ANDD 
                                   4407 	CALL ANDD
                                   4408 	CALL DOLIT
                                   4409 	.word 0x70
                                   4410 	CALL UPLUS 
                                   4411 	_DROP
                                   4412 	CALL EMIT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



                                   4413 	CALL ZERO
                                   4414 	CALL QBRAN
                                   4415 	.word DEBUG1
                                   4416 	CALL DOLIT
                                   4417 	.word 0x3F
                                   4418 DEBUG1:
                                   4419 	CALL DOLIT
                                   4420 	.word 0xFFFF
                                   4421 	CALL QBRAN
                                   4422 	.word DEBUG2
                                   4423 	CALL DOLIT
                                   4424 	.word 0x74
                                   4425 	CALL BRAN
                                   4426 	.word DEBUG3
                                   4427 DEBUG2:
                                   4428 	CALL DOLIT
                                   4429 	.word 0x21
                                   4430 DEBUG3:
                                   4431 	CALL EMIT
                                   4432 	CALL DOLIT
                                   4433 	.word 0x68
                                   4434 	CALL DOLIT
                                   4435 	.word 0x80
                                   4436 	CALL STORE
                                   4437 	CALL DOLIT
                                   4438 	.word 0x80
                                   4439 	CALL AT
                                   4440 	CALL EMIT
                                   4441 	CALL DOLIT
                                   4442 	.word 0x4D
                                   4443 	CALL TOR
                                   4444 	CALL RAT
                                   4445 	CALL RFROM
                                   4446 	CALL ANDD
                                   4447 	CALL EMIT
                                   4448 	CALL DOLIT
                                   4449 	.word 0x61
                                   4450 	CALL DOLIT
                                   4451 	.word 0xA
                                   4452 	CALL TOR
                                   4453 DEBUG4:
                                   4454 	CALL ONE
                                   4455 	CALL UPLUS 
                                   4456 	_DROP
                                   4457 	CALL DONXT
                                   4458 	.word DEBUG4
                                   4459 	CALL EMIT
                                   4460 	CALL DOLIT
                                   4461 	.word 0x656D
                                   4462 	CALL DOLIT
                                   4463 	.word 0x100
                                   4464 	CALL UMSTA
                                   4465 	CALL SWAPP
                                   4466 	CALL DOLIT
                                   4467 	.word 0x100
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



                                   4468 	CALL UMSTA
                                   4469 	CALL SWAPP 
                                   4470 	_DROP
                                   4471 	CALL EMIT
                                   4472 	CALL EMIT
                                   4473 	CALL DOLIT
                                   4474 	.word 0x2043
                                   4475 	CALL ZERO
                                   4476 	CALL DOLIT
                                   4477 	.word 0x100
                                   4478 	CALL UMMOD
                                   4479 	CALL EMIT
                                   4480 	CALL EMIT
                                   4481 	;JP ORIG
                                   4482 	RET
                                   4483 .endif ; WANT_DEBUG 
                                   4484 
                                   4485 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4486 ;       'BOOT   ( -- a )
                                   4487 ;       The application startup vector.
                                   4488 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001B70                       4489         _HEADER TBOOT,5,"'BOOT"
      009B40 B5 CD                    1         .word LINK 
                           001B72     2         LINK=.
      009B42 9B                       3         .byte 5  
      009B43 00 CD 8B F7 CD           4         .ascii "'BOOT"
      001B78                          5         TBOOT:
      009B48 85 34 9B         [ 4] 4490         CALL     DOVAR
      009B4B 30 81                 4491         .word    APP_RUN      ;application to boot
                                   4492 
                                   4493 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4494 ;       COLD    ( -- )
                                   4495 ;       The hilevel cold start s=ence.
                                   4496 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      009B4D                       4497         _HEADER COLD,4,"COLD"
      009B4D CD 90                    1         .word LINK 
                           001B7F     2         LINK=.
      009B4F 24                       3         .byte 4  
      009B50 21 4A 61 63              4         .ascii "COLD"
      001B84                          5         COLD:
                           000000  4498 .if WANT_DEBUG
                                   4499         CALL DEBUG
                                   4500 .endif ; WANT_DEBUG
      009B54 71 75 65         [ 4] 4501 COLD1:  CALL     DOLIT
      009B57 73 20                 4502         .word      UZERO
      009B59 44 65 73         [ 4] 4503 	CALL     DOLIT
      009B5C 63 68                 4504         .word      UPP
      009B5E 65 6E 65         [ 4] 4505         CALL     DOLIT
      009B61 73 2C                 4506 	.word      UEND-UZERO
      009B63 20 43 6F         [ 4] 4507         CALL     CMOVE   ;initialize user area
                           000001  4508 .if WANT_FLOAT 
      009B66 70 79 72         [ 4] 4509         CALL    FINIT 
                                   4510 .endif 
                                   4511 ; if APP_RUN==0 initialize with ca de 'hi'  
      009B69 69 67 68 74      [ 2] 4512         ldw y,APP_RUN 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



      009B6D 20 32            [ 1] 4513         jrne 0$
      009B6F 30 32 31         [ 2] 4514         subw x,#CELLL 
      009B72 CC 8F F7 39      [ 2] 4515         ldw y,#HI  
      009B75 FF               [ 2] 4516         ldw (x),y
      009B75 CD 90 24         [ 4] 4517         call UPDATRUN 
      001BAA                       4518 0$:        
                                   4519 ; update LAST with APP_LAST 
                                   4520 ; if APP_LAST > LAST else do the opposite
      009B78 0F 4C 49 43      [ 2] 4521         ldw y,APP_LAST 
      009B7C 45 4E 43         [ 2] 4522         cpw y,ULAST 
      009B7F 45 20            [ 1] 4523         jrugt 1$ 
                                   4524 ; save LAST at APP_LAST  
      009B81 47 50 4C         [ 4] 4525         call UPDATLAST 
      009B84 56 33            [ 2] 4526         jra 2$
      001BB8                       4527 1$: ; update LAST with APP_LAST 
      009B86 0D 0A 81         [ 2] 4528         ldw ULAST,y
      009B89 90 BF 16         [ 2] 4529         ldw UCNTXT,y
      001BBE                       4530 2$:  
                                   4531 ; update APP_CP if < app_space 
      009B89 CD 90 24 09      [ 2] 4532         ldw y,APP_CP  
      009B8D 20 76 65         [ 2] 4533         cpw y,UCP   
      009B90 72 73            [ 1] 4534         jruge 3$ 
      009B92 69 6F 6E         [ 4] 4535         call UPDATCP
      009B95 20 CD 8E         [ 2] 4536         ldw y,UCP   
      001BCD                       4537 3$:
      009B98 79 CD 8E         [ 2] 4538         ldw UCP,y                 
                                   4539 ; update UVP with APP_VP  
                                   4540 ; if APP_VP>UVP else do the opposite 
      009B9B B3 CD 8E B3      [ 2] 4541         ldw y,APP_VP 
      009B9F CD 84 EF         [ 2] 4542         cpw y,UVP 
      009BA2 00 2E            [ 1] 4543         jrugt 4$
      009BA4 CD 8E 89         [ 4] 4544         call UPDATVP 
      009BA7 1C 00            [ 2] 4545         jra 6$
      001BDE                       4546 4$: ; update UVP with APP_VP 
      009BA9 02 CD 8E         [ 2] 4547         ldw UVP,y 
      001BE1                       4548 6$:      
      009BAC B3 CD 8E         [ 4] 4549         CALL     PRESE   ;initialize data stack and TIB
      009BAF DE CD 8F         [ 4] 4550         CALL     TBOOT
      009BB2 DF 81 9B         [ 4] 4551         CALL     ATEXE   ;application boot
      009BB5 24 02 48         [ 4] 4552         CALL     OVERT
      009BB8 49 14 E7         [ 2] 4553         JP     QUIT    ;start interpretation
                                   4554 
                                   4555 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



                                   4556         .include "flash.asm"
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
      009BB9 1B 7F                   31     .word LINK 
                           001BF2    32     LINK=.
      009BB9 CD                      33     .byte 3 
      009BBA 8F F7 CD                34     .ascii "FP!"
      001BF6                         35 FPSTOR:
      009BBD 90 24            [ 1]   36     ldw y,x
      009BBF 0A 73            [ 2]   37     ldw y,(y)
      009BC1 74 6D            [ 1]   38     ld a,yl 
      009BC3 38 65            [ 1]   39     ld FPTR,a 
      009BC5 46 6F 72         [ 2]   40     addw x,#CELLL 
      009BC8 74 68            [ 1]   41     ldw y,x 
      009BCA CD 84            [ 2]   42     ldw y,(y)
      009BCC EF 00 04         [ 2]   43     ldw PTR16,y
      009BCF CD 84 EF         [ 2]   44     addw x,#CELLL 
      009BD2 00               [ 4]   45     ret 
                                     46 
                                     47 ;-----------------------------------
                                     48 ; return EEPROM base address 
                                     49 ; as a double 
                                     50 ;  EEPROM  ( -- ud )
                                     51 ;-----------------------------------
      009BD3 00 CD                   52     .word LINK 
                           001C0E    53 LINK=.
      009BD5 9B                      54     .byte 6 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



      009BD6 89 CD 90 24 12 20       55     .ascii "EEPROM"
      001C15                         56 EEPROM: 
      009BDC 6F 6E 20 4E      [ 2]   57     ldw y,#EEPROM_BASE
      009BE0 55 43 4C         [ 2]   58     subw x,#2*CELLL 
      009BE3 45 4F            [ 2]   59     ldw (2,x),y 
      009BE5 2D 38            [ 1]   60     clrw y 
      009BE7 53               [ 2]   61     ldw (x),y 
      009BE8 32               [ 4]   62     ret
                                     63 
                                     64 ;---------------------------------
                                     65 ; return APP_LAST pointer as double
                                     66 ; EEP-LAST ( -- ud )
                                     67 ;---------------------------------
      009BE9 30 38                   68 	.word LINK 
                           001C24    69 	LINK=.
      009BEB 52                      70 	.byte 8 
      009BEC 42 CC 8F F7 9B B6 05    71 	.ascii "EEP-LAST"
             27
      001C2D                         72 EEPLAST:
      009BF4 42 4F 4F         [ 2]   73 	subw x,#2*CELLL 
      009BF7 54 AE 40 00      [ 2]   74 	ldw y,#APP_LAST 
      009BF8 EF 02            [ 2]   75 	ldw (2,x),y 
      009BF8 CD 87            [ 1]   76 	clrw y 
      009BFA 4F               [ 2]   77 	ldw (x),y 
      009BFB 40               [ 4]   78 	ret 
                                     79 
                                     80 ;----------------------------------
                                     81 ; return APP_RUN pointer as double	
                                     82 ; EEP-RUN ( -- ud )
                                     83 ;-----------------------------------
      009BFC 02 9B                   84 	.word LINK 
                           001C3C    85 	LINK=.
      009BFE F2                      86 	.byte 7
      009BFF 04 43 4F 4C 44 55 4E    87 	.ascii "EEP-RUN"
      009C04                         88 EEPRUN:
      009C04 CD 84 EF         [ 2]   89 	subw x,#2*CELLL 
      009C07 80 AB CD 84      [ 2]   90 	ldw y,#APP_RUN 
      009C0B EF 00            [ 2]   91 	ldw (2,x),y 
      009C0D 06 CD            [ 1]   92 	clrw y 
      009C0F 84               [ 2]   93 	ldw (x),y 
      009C10 EF               [ 4]   94 	ret 
                                     95 
                                     96 ;------------------------------------
                                     97 ; return APP_CP pointer as double 
                                     98 ; EEP-CP ( -- ud )
                                     99 ;------------------------------------
      009C11 00 1C                  100 	.word LINK
                           001C53   101 	LINK=.
      009C13 CD                     102 	.byte 6 
      009C14 8D A9 CD AC B5 90      103 	.ascii "EEP-CP"
      001C5A                        104 EEPCP:
      009C1A CE 40 02         [ 2]  105 	subw x,#2*CELLL 
      009C1D 26 0B 1D 00      [ 2]  106 	ldw y,#APP_CP  
      009C21 02 90            [ 2]  107 	ldw (2,x),y 
      009C23 AE 9B            [ 1]  108 	clrw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]



      009C25 B9               [ 2]  109 	ldw (x),y 
      009C26 FF               [ 4]  110 	ret 
                                    111 
                                    112 ;------------------------------------
                                    113 ; return APP_VP pointer as double 
                                    114 ; EEP-VP ( -- ud )
                                    115 ;-------------------------------------
      009C27 CD 9D                  116 	.word LINK
                           001C69   117 	LINK=.
      009C29 22                     118 	.byte 6
      009C2A 45 45 50 2D 56 50      119 	.ascii "EEP-VP"
      001C70                        120 EEPVP:
      009C2A 90 CE 40         [ 2]  121 	subw x,#2*CELLL 
      009C2D 00 90 B3 1C      [ 2]  122 	ldw y,#APP_VP  
      009C31 22 05            [ 2]  123 	ldw (2,x),y 
      009C33 CD 9D            [ 1]  124 	clrw y 
      009C35 0A               [ 2]  125 	ldw (x),y 
      009C36 20               [ 4]  126 	ret 
                                    127 
                                    128 ;----------------------------------
                                    129 ; update APP_LAST with LAST 
                                    130 ; UPDAT-LAST ( -- )
                                    131 ;----------------------------------
      009C37 06 69                  132 	.word LINK 
                           001C7F   133 	LINK=.
      009C38 0A                     134 	.byte 10
      009C38 90 BF 1C 90 BF 16 4C   135 	.ascii "UPDAT-LAST"
             41 53 54
      009C3E                        136 UPDATLAST:
      009C3E 90 CE 40         [ 4]  137 	call LAST
      009C41 04 90 B3         [ 4]  138 	call AT  
      009C44 1A 24 06         [ 4]  139 	call EEPLAST
      009C47 CD 9D 33         [ 2]  140 	jp EESTORE 
                                    141 
                                    142 ;---------------------------------
                                    143 ; update APP_RUN 
                                    144 ; UPDAT-RUN ( a -- )
                                    145 ;---------------------------------
      009C4A 90 BE                  146 	.word LINK
                           001C98   147 	LINK=.
      009C4C 1A                     148 	.byte 9
      009C4D 55 50 44 41 54 2D 52   149 	.ascii "UPDAT-RUN"
             55 4E
      001CA2                        150 UPDATRUN:
      009C4D 90 BF 1A         [ 4]  151 	call EEPRUN
      009C50 90 CE 40         [ 2]  152 	jp EESTORE 
                                    153 	
                                    154 ;---------------------------------
                                    155 ; update APP_CP with CP 
                                    156 ; UPDAT-CP ( -- )
                                    157 ;---------------------------------
      009C53 06 90                  158 	.word LINK 
                           001CAA   159 	LINK=.
      009C55 B3                     160 	.byte 8 
      009C56 18 22 05 CD 9D 4A 20   161 	.ascii "UPDAT-CP"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal  03-Bits]



             50
      009C5E                        162 UPDATCP:
      009C5E 90 BF 18         [ 4]  163 	call CPP 
      009C61 CD 04 E3         [ 4]  164 	call AT 
      009C61 CD 95 4A         [ 4]  165 	call EEPCP 
      009C64 CD 9B F8         [ 2]  166 	jp EESTORE 
                                    167 
                                    168 ;----------------------------------
                                    169 ; update APP_VP with VP 
                                    170 ; UPDAT-VP ( -- )
                                    171 ;----------------------------------
      009C67 CD 8D                  172 	.word LINK
                           001CC1   173 	LINK=.
      009C69 92                     174 	.byte 8 
      009C6A CD 98 23 CC 95 67 9B   175 	.ascii "UPDAT-VP" 
             FF
      001CCA                        176 UPDATVP:
      009C72 03 46 50         [ 4]  177 	call VPP 
      009C75 21 04 E3         [ 4]  178 	call AT
      009C76 CD 1C 70         [ 4]  179 	call EEPVP 
      009C76 90 93 90         [ 2]  180 	jp EESTORE
                                    181 	
                           000001   182 .if NUCLEO
                                    183 ;----------------------------------
                                    184 ; fetch integer at address over 65535
                                    185 ;  F@   ( ud -- n )
                                    186 ;----------------------------------
      009C79 FE 90                  187     .word LINK 
                           001CD8   188 LINK=.
      009C7B 9F                     189     .byte 2
      009C7C B7 34                  190     .ascii "F@"
      001CDB                        191 FARAT:
      009C7E 1C 00 02         [ 4]  192     call FPSTOR
      009C81 90 93 90         [ 2]  193 	jp EE_READ 
                                    194 
                                    195 
                                    196 ;-------------------------------------
                                    197 ; fetch C at address over 65535 
                                    198 ; FC@ ( ud -- c)
                                    199 ;-------------------------------------
      009C84 FE 90                  200     .word LINK
                           001CE3   201     LINK=.
      009C86 BF                     202     .byte 3 
      009C87 35 1C 00               203     .ascii "FC@" 
      001CE7                        204 FARCAT:
      009C8A 02 81 9C         [ 4]  205     call FPSTOR
      009C8D 72 06 45         [ 2]  206 	jp EE_CREAD  
                                    207 .endif ; NUCLEO 
                                    208 
                                    209 ;----------------------------------
                                    210 ; UNLOCK EEPROM/OPT for writing/erasing
                                    211 ; wait endlessly for FLASH_IAPSR_DUL bit.
                                    212 ;  UNLKEE   ( -- )
                                    213 ;----------------------------------
      009C90 45 50                  214     .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]



                           001CEF   215 LINK=.
      009C92 52                     216     .byte 6 
      009C93 4F 4D 4C 4B 45 45      217     .ascii "UNLKEE"
      009C95                        218 UNLKEE:
      009C95 90 AE 40 00      [ 1]  219 	mov FLASH_CR2,#0 
      009C99 1D 00 04 EF      [ 1]  220 	mov FLASH_NCR2,#0xFF 
      009C9D 02 90 5F FF      [ 1]  221 	mov FLASH_DUKR,#FLASH_DUKR_KEY1
      009CA1 81 9C 8E 08      [ 1]  222     mov FLASH_DUKR,#FLASH_DUKR_KEY2
      009CA5 45 45 50 2D 4C   [ 2]  223 	btjf FLASH_IAPSR,#FLASH_IAPSR_DUL,.
      009CAA 41               [ 4]  224 	ret
                                    225 
                                    226 ;----------------------------------
                                    227 ; UNLOCK FLASH for writing/erasing
                                    228 ; wait endlessly for FLASH_IAPSR_PUL bit.
                                    229 ; UNLKFL  ( -- )
                                    230 ;----------------------------------
      009CAB 53 54                  231     .word LINK 
                           001D0E   232 LINK=. 
      009CAD 06                     233     .byte 6 
      009CAD 1D 00 04 90 AE 40      234     .ascii "UNLKFL"    
      001D15                        235 UNLKFL:
      009CB3 00 EF 02 90      [ 1]  236 	mov FLASH_CR2,#0 
      009CB7 5F FF 81 9C      [ 1]  237 	mov FLASH_NCR2,#0xFF 
      009CBB A4 07 45 45      [ 1]  238 	mov FLASH_PUKR,#FLASH_PUKR_KEY1
      009CBF 50 2D 52 55      [ 1]  239 	mov FLASH_PUKR,#FLASH_PUKR_KEY2
      009CC3 4E 03 50 5F FB   [ 2]  240 	btjf FLASH_IAPSR,#FLASH_IAPSR_PUL,.
      009CC4 81               [ 4]  241 	ret
                                    242 
                                    243 ;-----------------------------
                                    244 ; UNLOCK FLASH or EEPROM 
                                    245 ; according to FPTR address 
                                    246 ;  UNLOCK ( -- )
                                    247 ;-----------------------------
      009CC4 1D 00                  248 	.word LINK 
                           001D2D   249 	LINK=.
      009CC6 04                     250 	.byte 6
      009CC7 90 AE 40 02 EF 02      251 	.ascii "UNLOCK"
      001D34                        252 UNLOCK:
                                    253 ; put addr[15:0] in Y, for bounds check.
      009CCD 90 5F FF         [ 2]  254 	ldw y,PTR16   ; Y=addr15:0
                                    255 ; check addr[23:16], if <> 0 then it is extened flash memory
      009CD0 81 9C            [ 1]  256 	tnz FPTR 
      009CD2 BC 06            [ 1]  257 	jrne 4$
      009CD4 45 45 50 2D      [ 2]  258     cpw y,#FLASH_BASE
      009CD8 43 50            [ 1]  259     jruge 4$
      009CDA 90 A3 40 00      [ 2]  260 	cpw y,#EEPROM_BASE  
      009CDA 1D 00            [ 1]  261     jrult 9$
      009CDC 04 90 AE 40      [ 2]  262 	cpw y,#OPTION_END 
      009CE0 04 EF            [ 1]  263 	jrugt 9$
      009CE2 02 90 5F         [ 4]  264 	call UNLKEE
      009CE5 FF               [ 4]  265 	ret 
      009CE6 81 9C D3         [ 4]  266 4$: call UNLKFL
      009CE9 06               [ 4]  267 9$: ret 
                                    268 
                                    269 ;-------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]



                                    270 ; LOCK write access to 
                                    271 ; FLASH and EEPROM 
                                    272 ; LOCK ( -- )
                                    273 ;-------------------------
      009CEA 45 45                  274 	.word LINK 
                           001D57   275 	LINK=.
      009CEC 50                     276 	.byte 4 
      009CED 2D 56 50 4B            277 	.ascii "LOCK" 
      009CF0                        278 LOCK: 
      009CF0 1D 00 04 90      [ 1]  279 	bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      009CF4 AE 40 06 EF      [ 1]  280 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      009CF8 02               [ 4]  281 	ret 
                                    282 
                                    283 ;-------------------------
                                    284 ; increment FPTR 
                                    285 ; INC-FPTR ( -- )
                                    286 ;-------------------------
      009CF9 90 5F                  287 	.word LINK 
                           001D67   288 	LINK=. 
      009CFB FF                     289 	.byte 8 
      009CFC 81 9C E9 0A 55 50 44   290 	.ascii "INC-FPTR" 
             41
      001D70                        291 INC_FPTR:
      009D04 54 2D            [ 1]  292 	inc PTR8 
      009D06 4C 41            [ 1]  293 	jrne 1$
      009D08 53 54            [ 2]  294 	pushw y 
      009D0A 90 BE 34         [ 2]  295 	ldw y,FPTR 
      009D0A CD 88            [ 1]  296 	incw y 
      009D0C 0E CD 85         [ 2]  297 	ldw FPTR,y
      009D0F 63 CD            [ 2]  298 	popw y  
      009D11 9C               [ 4]  299 1$: ret 
                                    300 
                                    301 ;------------------------------
                                    302 ; add u to FPTR 
                                    303 ; PTR+ ( u -- )
                                    304 ;------------------------------
      009D12 AD CC                  305 	.word LINK 
                           001D83   306 	LINK=.
      009D14 9F                     307 	.byte 4 
      009D15 00 9C FF 09            308 	.ascii "PTR+"
      001D88                        309 PTRPLUS:
      009D19 55 50            [ 1]  310 	ldw y,x 
      009D1B 44 41 54         [ 2]  311 	addw x,#CELLL 
      009D1E 2D 52 55 4E      [ 2]  312 	addw y,PTR16 
      009D22 90 BF 35         [ 2]  313 	ldw PTR16,y  
      009D22 CD 9C            [ 1]  314 	jrnc 1$
      009D24 C4 CC            [ 1]  315 	inc FPTR 
      009D26 9F               [ 4]  316 1$: ret 
                                    317 
                                    318 ;---------------------------------
                                    319 ; read word at address pointed FPTR
                                    320 ; increment FPTR 
                                    321 ; EE-READ ( -- w )
                                    322 ;------------------------------------
      009D27 00 9D                  323 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]



                           001D9B   324 	LINK=.
      009D29 18                     325 	.byte 7 
      009D2A 08 55 50 44 41 54 2D   326 	.ascii "EE-READ"
      001DA3                        327 EE_READ:
      009D31 43 50 02         [ 2]  328 	subw x,#CELLL 
      009D33 92 BC 00 34      [ 5]  329 	ldf a,[FPTR]
      009D33 CD 87            [ 1]  330 	ld yh,a 
      009D35 FE CD 85         [ 4]  331 	call INC_FPTR 
      009D38 63 CD 9C DA      [ 5]  332 	ldf a,[FPTR]
      009D3C CC 9F 00         [ 4]  333 	call INC_FPTR 
      009D3F 9D 2A            [ 1]  334 	ld yl,a 
      009D41 08               [ 2]  335 	ldw (x),y 
      009D42 55               [ 4]  336 	ret 
                                    337 
                                    338 ;---------------------------------------
                                    339 ; Read byte at address pointed by FPTR 
                                    340 ; EE-CREAD ( -- c )
                                    341 ;---------------------------------------
      009D43 50 44                  342 	.word LINK 
                           001DBC   343 	LINK=.
      009D45 41                     344 	.byte 8
      009D46 54 2D 56 50 52 45 41   345 	.ascii "EE-CREAD" 
             44
      009D4A                        346 EE_CREAD:
      009D4A CD 87 F0         [ 2]  347 	subw x,#CELLL 
      009D4D CD 85 63 CD      [ 5]  348 	ldf a,[FPTR]	
      009D51 9C F0 CC         [ 4]  349 	call INC_FPTR
      009D54 9F 00            [ 1]  350 	clrw y 
      009D56 9D 41            [ 1]  351 	ld yl,a 
      009D58 02               [ 2]  352 	ldw (x),y 
      009D59 46               [ 4]  353 	ret 
                                    354 
                                    355 ;----------------------------
                                    356 ; write a byte at address pointed 
                                    357 ; by FPTR and increment FPTR.
                                    358 ; Expect pointer already initialized 
                                    359 ; and memory unlocked 
                                    360 ; WR-BYTE ( c -- )
                                    361 ;----------------------------
      009D5A 40 BC                  362 	.word LINK 
                           001DD7   363 	LINK=. 
      009D5B 07                     364 	.byte 7 
      009D5B CD 9C 76 CC 9E 23 9D   365 	.ascii "WR-BYTE" 
                                    366 
      001DDF                        367 WR_BYTE:
      009D62 58 03 46         [ 4]  368 	call FC_XOFF
      009D65 43 40            [ 1]  369 	ldw y,x 
      009D67 90 FE            [ 2]  370 	ldw y,(y)
      009D67 CD 9C 76         [ 2]  371 	addw x,#CELLL 
      009D6A CC 9E            [ 1]  372 	ld a,yl
      009D6C 45 9D 63 06      [ 4]  373 	ldf [FPTR],a
      009D70 55 4E 4C 4B 45   [ 2]  374 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009D75 45 04 4D         [ 4]  375 	call FC_XON
      009D76 CC 1D 70         [ 2]  376 	jp INC_FPTR 
                                    377 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
Hexadecimal [24-Bits]



                                    378 ;---------------------------------------
                                    379 ; write a word at address pointed 
                                    380 ; by FPTR and increment FPTR 
                                    381 ; Expect pointer already initialzed 
                                    382 ; and memory unlocked 
                                    383 ; WR-WORD ( w -- )
                                    384 ;---------------------------------------
      009D76 35 00                  385 	.word LINK 
                           001DFC   386 	LINK=.
      009D78 50                     387 	.byte 7 
      009D79 5B 35 FF 50 5C 35 AE   388 	.ascii "WR-WORD" 
      001E04                        389 WR_WORD:
      009D80 50 64 35         [ 4]  390 	call FC_XOFF
      009D83 56 50            [ 1]  391 	ldw y,x
      009D85 64 72            [ 2]  392 	ldw y,(y)
      009D87 07 50 5F         [ 2]  393 	addw x,#CELLL 
      009D8A FB 81            [ 1]  394 	ld a,yh 
      009D8C 9D 6F 06 55      [ 4]  395 	ldf [FPTR],a
      009D90 4E 4C 4B 46 4C   [ 2]  396 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009D95 CD 1D 70         [ 4]  397 	call INC_FPTR 
      009D95 35 00            [ 1]  398 	ld a,yl 
      009D97 50 5B 35 FF      [ 4]  399 	ldf [FPTR],a
      009D9B 50 5C 35 56 50   [ 2]  400 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009DA0 62 35 AE         [ 4]  401 	call FC_XON
      009DA3 50 62 72         [ 2]  402 	jp INC_FPTR 
                                    403 
                                    404 
                                    405 ;---------------------------------------
                                    406 ; write a byte to FLASH or EEPROM/OPTION  
                                    407 ; EEC!  (c ud -- )
                                    408 ;---------------------------------------
      009DA6 03 50                  409     .word LINK 
                           001E2F   410 	LINK=.
      009DA8 5F                     411     .byte 4 
      009DA9 FB 81 9D 8E            412     .ascii "EEC!"
                                    413 	; local variables 
                           000001   414 	BTW = 1   ; byte to write offset on stack
                           000002   415     OPT = 2 
                           000002   416 	VSIZE = 2
      001E34                        417 EECSTORE:
      009DAD 06 55            [ 2]  418 	sub sp,#VSIZE
      009DAF 4E 4C 4F         [ 4]  419     call FPSTOR
      009DB2 43 4B            [ 1]  420 	ld a,(1,x)
      009DB4 43               [ 1]  421 	cpl a 
      009DB4 90 BE            [ 1]  422 	ld (BTW,sp),a ; byte to write 
      009DB6 35 3D            [ 1]  423 	clr (OPT,sp)  ; OPTION flag
      009DB8 34 26 16         [ 4]  424 	call UNLOCK 
                                    425 	; check if option
      009DBB 90 A3            [ 1]  426 	tnz FPTR 
      009DBD 80 00            [ 1]  427 	jrne 2$
      009DBF 24 10 90         [ 2]  428 	ldw y,PTR16 
      009DC2 A3 40 00 25      [ 2]  429 	cpw y,#OPTION_BASE
      009DC6 0D 90            [ 1]  430 	jrmi 2$
      009DC8 A3 48 7F 22      [ 2]  431 	cpw y,#OPTION_END+1
      009DCC 07 CD            [ 1]  432 	jrpl 2$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
Hexadecimal [24-Bits]



      009DCE 9D 76            [ 1]  433 	cpl (OPT,sp)
                                    434 	; OPTION WRITE require this UNLOCK 
      009DD0 81 CD 9D 95      [ 1]  435     bset FLASH_CR2,#FLASH_CR2_OPT
      009DD4 81 9D AD 04      [ 1]  436     bres FLASH_NCR2,#FLASH_CR2_OPT 
      001E60                        437 2$: 
      009DD8 4C 4F 43         [ 4]  438 	call WR_BYTE 	
      009DDB 4B 02            [ 1]  439 	tnz (OPT,sp)
      009DDC 27 0D            [ 1]  440 	jreq 3$ 
      009DDC 72 13            [ 1]  441     ld a,(BTW,sp)
      009DDE 50 5F            [ 1]  442     clrw y
      009DE0 72 17            [ 1]  443 	ld yl,a 
      009DE2 50 5F 81         [ 2]  444 	subw x,#CELLL 
      009DE5 9D               [ 2]  445 	ldw (x),y 
      009DE6 D7 08 49         [ 4]  446 	call WR_BYTE
      001E74                        447 3$: 
      009DE9 4E 43 2D         [ 4]  448 	call LOCK 
      009DEC 46 50            [ 2]  449 	addw sp,#VSIZE 
      009DEE 54               [ 4]  450     ret
                                    451 
                                    452 ;------------------------------
                                    453 ; write integer in FLASH|EEPROM
                                    454 ; EE! ( n ud -- )
                                    455 ;------------------------------
      009DEF 52 2F                  456 	.word LINK 
                           001E7C   457 	LINK=.
      009DF0 03                     458 	.byte 3 
      009DF0 3C 36 26               459 	.ascii "EE!"
      001E80                        460 EESTORE:
      009DF3 0C 90 89         [ 4]  461 	call FPSTOR 
      009DF6 90 BE 34         [ 4]  462 	call UNLOCK 
      009DF9 90 5C            [ 1]  463 	ldw y,x 
      009DFB 90 BF            [ 2]  464 	ldw y,(y)
      009DFD 34 90            [ 2]  465 	pushw y 
      009DFF 85 81            [ 1]  466 	swapw y 
      009E01 9D               [ 2]  467 	ldw (x),y 
      009E02 E7 04 50         [ 4]  468 	call WR_BYTE 
      009E05 54 52            [ 2]  469 	popw y 
      009E07 2B 00 02         [ 2]  470 	subw x,#CELLL
      009E08 FF               [ 2]  471 	ldw (x),y 
      009E08 90 93 1C         [ 4]  472 	call WR_BYTE
      009E0B 00 02 72         [ 2]  473 	jp LOCK 
                                    474 
                                    475 
                                    476 ;----------------------------
                                    477 ; Erase flash memory row 
                                    478 ; stm8s208 as 128 bytes rows
                                    479 ; ROW-ERASE ( ud -- )
                                    480 ;----------------------------
      009E0E B9 00                  481 	.word LINK 
                           001EA0   482 	LINK=. 
      009E10 35                     483 	.byte 9 
      009E11 90 BF 35 24 02 3C 34   484 	.ascii "ROW-ERASE" 
             81 9E
      001EAA                        485 row_erase:
      009E1A 03 07 45         [ 4]  486 	call FC_XOFF
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]



      009E1D 45 2D 52         [ 4]  487 	call FPSTOR
                                    488 ;code must be execute from RAM 
                                    489 ;copy routine to PAD 
      009E20 45 41 44         [ 2]  490 	subw x,#CELLL 
      009E23 90 AE 1F 03      [ 2]  491 	ldw y,#row_erase_proc
      009E23 1D               [ 2]  492 	ldw (x),y 
      009E24 00 02 92         [ 4]  493 	call PAD 
      009E27 BC 00 34 90      [ 2]  494 	ldw y,#row_erase_proc_end 
      009E2B 95 CD 9D F0      [ 2]  495 	subw y,#row_erase_proc
      009E2F 92 BC 00         [ 2]  496 	subw x,#CELLL 
      009E32 34               [ 2]  497 	ldw (x),y 
      009E33 CD 9D F0         [ 4]  498 	call CMOVE 
      001ECA                        499 block_erase:
      009E36 90 97 FF         [ 2]  500 	ldw y,FPTR+1
      009E39 81 9E 1B 08      [ 2]  501 	cpw y,#app_space 
      009E3D 45 45            [ 1]  502 	jrpl erase_flash 
                                    503 ; erase EEPROM block
      009E3F 2D 43 52 45      [ 2]  504 	cpw y,#EEPROM_BASE 
      009E43 41 44            [ 1]  505 	jruge 1$
      009E45 CD 04 4D         [ 4]  506 	call FC_XON
      009E45 1D               [ 4]  507 	ret ; bad address 
      009E46 00 02 92 BC      [ 2]  508 1$: cpw y,#EEPROM_END 
      009E4A 00 34            [ 2]  509 	jrule 2$ 
      009E4C CD 9D F0         [ 4]  510 	call FC_XON
      009E4F 90               [ 4]  511 	ret ; bad address 
      001EE7                        512 2$:	
      009E50 5F 90 97         [ 4]  513 	call UNLKEE 
      009E53 FF 81            [ 2]  514 	jra proceed_erase
                                    515 ; erase flash block:
      001EEC                        516 erase_flash:
      009E55 9E 3C 07         [ 4]  517 	call UNLKFL 
      001EEF                        518 proceed_erase:
      009E58 57 52 2D         [ 4]  519 	call PAD 
      009E5B 42 59            [ 1]  520 	ldw y,x
      009E5D 54 45            [ 2]  521 	ldw y,(y)
      009E5F 1C 00 02         [ 2]  522 	addw x,#CELLL  
      009E5F CD 84            [ 4]  523 	call (y) 
      009E61 E3 90 93 90      [ 1]  524 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      009E65 FE 1C 00         [ 4]  525 	call FC_XON
      009E68 02               [ 4]  526 	ret 
                                    527 
                                    528 ; this routine is to be copied to PAD 
      001F03                        529 row_erase_proc:
      009E69 90 9F 92 BD      [ 1]  530 	mov FLASH_CR2,#(1<<FLASH_CR2_ERASE) 
      009E6D 00 34 72 05      [ 1]  531 	mov FLASH_NCR2,#~(1<<FLASH_CR2_ERASE)
      009E71 50               [ 1]  532 	clr a 
      009E72 5F FB            [ 1]  533 	clrw y 
      009E74 CD 84 CD CC      [ 1]  534 	ldf ([FPTR],y),a
      009E78 9D F0            [ 1]  535     incw y
      009E7A 9E 57 07 57      [ 1]  536 	ldf ([FPTR],y),a
      009E7E 52 2D            [ 1]  537     incw y
      009E80 57 4F 52 44      [ 1]  538 	ldf ([FPTR],y),a
      009E84 90 5C            [ 1]  539     incw y
      009E84 CD 84 E3 90      [ 1]  540 	ldf ([FPTR],y),a
      009E88 93 90 FE 1C 00   [ 2]  541 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]



      009E8D 02               [ 4]  542 	ret
      001F2A                        543 row_erase_proc_end:
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
      001F2A                        556 copy_buffer:
      009E8E 90 9E            [ 1]  557 	push #BLOCK_SIZE  
                                    558 ;enable block programming 
      009E90 92 BD 00 34      [ 1]  559 	bset FLASH_CR2,#FLASH_CR2_PRG 
      009E94 72 05 50 5F      [ 1]  560 	bres FLASH_NCR2,#FLASH_CR2_PRG
      009E98 FB CD            [ 1]  561 	clrw y
      009E9A 9D               [ 1]  562 1$:	ld a,(x)
      009E9B F0 90 9F 92      [ 1]  563 	ldf ([FPTR],y),a
      009E9F BD               [ 1]  564 	incw x 
      009EA0 00 34            [ 1]  565 	incw y 
      009EA2 72 05            [ 1]  566 	dec (BCNT,sp)
      009EA4 50 5F            [ 1]  567 	jrne 1$
                                    568 ; wait EOP bit 
      009EA6 FB CD 84 CD CC   [ 2]  569 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. 
      009EAB 9D               [ 1]  570 	pop a ; remove BCNT from stack 
      009EAC F0               [ 4]  571 	ret 
      001F49                        572 copy_buffer_end:
                                    573 
                                    574 ;-------------------------
                                    575 ; move program_row to RAM 
                                    576 ; in TIB 
                                    577 ;------------------------
      001F49                        578 copy_prog_to_ram:
      009EAD 9E 7C 04         [ 2]  579 	subw x,#6
      009EB0 45 45 43 21      [ 2]  580 	ldw y,#copy_buffer 
      009EB4 EF 04            [ 2]  581 	ldw (4,x),y 
      009EB4 52 02 CD 9C      [ 2]  582 	ldw y,#TIBBASE
      009EB8 76 E6            [ 2]  583 	ldw (2,x),y 
      009EBA 01 43 6B 01      [ 2]  584 	ldw y,#copy_buffer_end 
      009EBE 0F 02 CD 9D      [ 2]  585 	subw y,#copy_buffer  
      009EC2 B4               [ 2]  586 	ldw (x),y 
      009EC3 3D 34 26         [ 4]  587 	call CMOVE 
      009EC6 19               [ 4]  588 	ret 
                                    589 
                                    590 
                                    591 ;-----------------------------
                                    592 ; write a row in FLASH/EEPROM 
                                    593 ; WR-ROW ( a ud -- )
                                    594 ; a -> address 128 byte buffer to write 
                                    595 ; ud ->  row address in FLASH|EEPROM 
                                    596 ;-----------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]



      009EC7 90 BE                  597 	.word LINK 
                           001F67   598 	LINK=.
      009EC9 35                     599 	.byte 6 
      009ECA 90 A3 48 00 2B 10      600 	.ascii "WR-ROW"
      001F6E                        601 write_row:
      009ED0 90 A3 48         [ 4]  602 	call FC_XOFF
      009ED3 80 2A 0A         [ 4]  603 	call FPSTOR
                                    604 ; align to FLASH block 
      009ED6 03 02            [ 1]  605 	ld a,#0x80 
      009ED8 72 1E            [ 1]  606 	and a,PTR8 
      009EDA 50 5B            [ 1]  607 	ld PTR8,a  
      009EDC 72 1F 50         [ 4]  608 	call copy_prog_to_ram
      009EDF 5C 1D 34         [ 4]  609 	call UNLOCK
      009EE0 90 93            [ 1]  610 	ldw y,x 
      009EE0 CD 9E            [ 2]  611 	ldw y,(y)
      009EE2 5F 0D 02         [ 2]  612 	addw x,#CELLL 
      009EE5 27               [ 2]  613 	pushw x 
      009EE6 0D               [ 1]  614 	ldw x,y ; buffer address in x 
      009EE7 7B 01 90         [ 4]  615 	call TIBBASE
      009EEA 5F 90 97         [ 4]  616 	call LOCK
      009EED 1D               [ 2]  617 	popw x 
      009EEE 00 02 FF         [ 4]  618 	call FC_XON 
      009EF1 CD               [ 4]  619 	ret 
                                    620 
                                    621 ;-------------------------------------
                                    622 ; change value of OPTION register 
                                    623 ; SET-OPT (c n -- ) 
                                    624 ; c new value.
                                    625 ; n OPT  number {1..7}
                                    626 ;--------------------------------------
      009EF2 9E 5F                  627 		.word LINK 
                           001F96   628 		LINK=.
      009EF4 07                     629 		.byte 7 
      009EF4 CD 9D DC 5B 02 81 9E   630 		.ascii "SET-OPT" 
      001F9E                        631 set_option: 
      009EFB AF 03            [ 1]  632 		ldw y,x 
      009EFD 45 45            [ 2]  633 		ldw y,(y)
      009EFF 21 06            [ 1]  634 		jreq 1$
      009F00 90 A3 00 07      [ 2]  635 		cpw y,#7 
      009F00 CD 9C            [ 2]  636 		jrule 2$ 
                                    637 ; invalid OPTION number 		
      009F02 76 CD 9D         [ 2]  638 1$:		addw x,#2*CELLL
      009F05 B4               [ 4]  639 		ret
      009F06 90 93            [ 2]  640 2$:		sllw y 
      009F08 90 FE 90 89      [ 2]  641 		addw y,#OPTION_BASE-1
      009F0C 90               [ 2]  642 		ldw (x),y 
      009F0D 5E FF CD         [ 2]  643 		subw x,#CELLL 
      009F10 9E 5F            [ 1]  644 		clrw y 
      009F12 90               [ 2]  645 		ldw (x),y 
      009F13 85 1D 00         [ 4]  646 		call EECSTORE
      009F16 02               [ 4]  647 		ret 
                                    648 
                                    649 
                                    650 
                                    651 ;--------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 118.
Hexadecimal [24-Bits]



                                    652 ; reset system to its original state 
                                    653 ; before any user modification
                                    654 ; PRISTINE ( -- )
                                    655 ;-------------------------------------
      009F17 FF CD                  656 	.word LINK  
                           001FC1   657 	LINK=.
      009F19 9E                     658 	.byte 8 
      009F1A 5F CC 9D DC 9E FC 09   659 	.ascii "PRISTINE"
             52
      001FCA                        660 pristine:
                                    661 ;;; erase EEPROM
      009F22 4F 57 2D         [ 4]  662 	call EEPROM 
      009F25 45 52 41         [ 4]  663 1$:	call DDUP 
      009F28 53 45 AA         [ 4]  664 	call row_erase
      009F2A 90 93            [ 1]  665 	ldw y,x 
      009F2A CD 84 E3         [ 2]  666 	ldw y,(2,y)
      009F2D CD 9C 76 1D      [ 2]  667 	addw y,#BLOCK_SIZE
      009F31 00 02            [ 2]  668 	ldw (2,x),y
      009F33 90 AE 9F 83      [ 2]  669 	cpw y,#OPTION_BASE 
      009F37 FF CD            [ 1]  670 	jrult 1$
                                    671 ;;; reset OPTION to default values
      009F39 8D 6D 90 AE      [ 2]  672 	ldw y,#1 ; OPT1 
      009F3D 9F               [ 2]  673 2$:	ldw (x),y   
      009F3E AA 72            [ 1]  674 	clrw y 
      009F40 A2 9F            [ 2]  675 	ldw (2,x),y  ; ( 0 1 -- ) 
      009F42 83 1D 00         [ 4]  676 	call DDUP    ; ( 0 1 0 1 -- )  
      009F45 02 FF CD         [ 4]  677 	call set_option
      009F48 8D A9            [ 1]  678 	ldw y,x 
      009F4A 90 FE            [ 2]  679 	ldw y,(y)
      009F4A 90 BE            [ 1]  680 	incw y  ; next OPTION 
      009F4C 35 90 A3 B6      [ 2]  681 	cpw y,#8 
      009F50 00 2A            [ 1]  682 	jrult 2$
                                    683 ;;; erase first row of app_space 	
      009F52 19 90 A3 40      [ 2]  684 	ldw y,#app_space
      009F56 00 24            [ 2]  685 	ldw (2,x),y  
      009F58 04 CD            [ 1]  686 	clrw y 
      009F5A 84               [ 2]  687 	ldw (x),y ; ( app_space 0 -- )
      009F5B CD 81 90         [ 4]  688 	call row_erase 
                                    689 ; reset interrupt vectors 
      009F5E A3 47 FF         [ 2]  690 	subw x,#CELLL 
      009F61 23 04            [ 1]  691 	clrw y  
      009F63 CD               [ 2]  692 4$:	ldw (x),y  ; ( n -- ) int# 
      009F64 84 CD 81         [ 4]  693 	call DUPP  
      009F67 CD 20 31         [ 4]  694 	call reset_vector
      009F67 CD 9D            [ 1]  695 	ldw y,x 
      009F69 76 20            [ 2]  696 	ldw y,(y)
      009F6B 03 5C            [ 1]  697 	incw y   ; next vector 
      009F6C 90 A3 00 19      [ 2]  698 	cpw y,#25 
      009F6C CD 9D            [ 1]  699 	jrult 4$
      009F6E 95 00 00         [ 2]  700 	jp NonHandledInterrupt ; reset MCU
                                    701 
                                    702 ;------------------------------
                                    703 ; reset an interrupt vector 
                                    704 ; to its initial value 
                                    705 ; i.e. NonHandledInterrupt
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 119.
Hexadecimal [24-Bits]



                                    706 ; RST-IVEC ( n -- )
                                    707 ;-----------------------------
      009F6F 1F C1                  708 	.word LINK 
                           002028   709 	LINK=. 
      009F6F CD                     710 	.byte 8 
      009F70 8D 6D 90 93 90 FE 1C   711 	.ascii "RST-IVEC"
             00
      002031                        712 reset_vector:
      009F78 02 90            [ 1]  713 	ldw y,x
      009F7A FD 72 17         [ 2]  714 	addw x,#CELLL 
      009F7D 50 5F            [ 2]  715 	ldw y,(y)
      009F7F CD 84 CD 81      [ 2]  716 	cpw y,#23 
      009F83 27 3A            [ 1]  717 	jreq 9$
      009F83 35 20 50 5B      [ 2]  718 	cpw y,#29 ; last vector
      009F87 35 DF            [ 1]  719 	jrugt 9$  
      009F89 50 5C            [ 2]  720 	sllw y 
      009F8B 4F 90            [ 2]  721 	sllw y 
      009F8D 5F 91 A7 00      [ 2]  722 	addw y,#0x8008 ; irq0 address 
      009F91 34 90 5C         [ 2]  723 	ldw YTEMP,y
      009F94 91 A7 00         [ 2]  724 	subw x,#3*CELLL 
      009F97 34 90            [ 2]  725 	ldw (2,x),y 
      009F99 5C 91            [ 1]  726 	clrw y
      009F9B A7               [ 2]  727 	ldw (x),y 
      009F9C 00 34            [ 1]  728 	ld a,#0x82 
      009F9E 90 5C            [ 1]  729 	ld yh,a
      009FA0 91 A7            [ 2]  730 	ldw (4,x),y
      009FA2 00 34 72         [ 4]  731 	call EESTORE
      009FA5 05 50 5F         [ 2]  732 	subw x,#3*CELLL
      009FA8 FB 81            [ 1]  733 	clrw y 
      009FAA FF               [ 2]  734 	ldw (x),y 
      009FAA 90 AE 00 00      [ 2]  735 	ldw y,#NonHandledInterrupt
      009FAA 4B 80            [ 2]  736 	ldw (4,x),y 
      009FAC 72 10 50         [ 2]  737 	ldw y,YTEMP  
      009FAF 5B 72 11 50      [ 2]  738 	addw y,#2
      009FB3 5C 90            [ 2]  739 	ldw (2,x),y 
      009FB5 5F F6 91         [ 4]  740 	call EESTORE
      009FB8 A7               [ 4]  741 9$:	ret 
                                    742 
                                    743 
                                    744 ;------------------------------
                                    745 ; all interrupt vector with 
                                    746 ; an address >= a are resetted 
                                    747 ; to default
                                    748 ; CHKIVEC ( a -- )
                                    749 ;------------------------------
      009FB9 00 34                  750 	.word LINK 
                           00207B   751 	LINK=.
      009FBB 5C                     752 	.byte 7
      009FBC 90 5C 0A 01 26 F4 72   753 	.ascii "CHKIVEC"
                                    754 ;local variables 
                           000001   755 	SSP=1
                           000003   756 	CADR=3
                           000005   757 	OFS=5
                           000006   758 	VSIZE=6  
      002083                        759 CHKIVEC:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 120.
Hexadecimal  05-Bits]



      009FC4 50 5F            [ 2]  760 	sub sp,#VSIZE ;alloc local variables 
      009FC6 FB 84            [ 1]  761 	ldw y,x 
      009FC8 81 FE            [ 2]  762 	ldw y,(y)
      009FC9 17 03            [ 2]  763 	ldw (CADR,sp),y ; ca 
      009FC9 1F 01            [ 2]  764 	ldw (SSP,sp),x 
      009FC9 1D 00 06         [ 2]  765 	ldw x,#0x800a ; irq0 address 
      009FCC 90 AE            [ 2]  766 	ldw PTR16,X
      009FCE 9F AA EF         [ 2]  767 	ldw x,#-4 
      009FD1 04 90 AE         [ 2]  768 1$:	addw x,#4
      009FD4 17 00 EF         [ 2]  769 	cpw x,#30*4 ; irq0-29 
      009FD7 02 90            [ 1]  770 	jreq 9$
      009FD9 AE 9F            [ 1]  771 	ldw y,x  
      009FDB C9 72 A2         [ 4]  772 	ld a,([PTR16],y)
      009FDE 9F AA            [ 1]  773 	cp a,(CADR,sp)
      009FE0 FF CD            [ 1]  774 	jrult 1$
      009FE2 8D A9            [ 1]  775 	incw y 
      009FE4 81 9F 20         [ 4]  776 	ld a,([PTR16],y)
      009FE7 06 57            [ 1]  777 	cp a,(CADR+1,sp) 
      009FE9 52 2D            [ 1]  778 	jrult 1$ 
      009FEB 52 4F            [ 2]  779 	ldw (OFS,sp),x 
      009FED 57               [ 2]  780 	srlw x
      009FEE 54               [ 2]  781 	srlw x 
      009FEE CD 84            [ 1]  782 	ldw y,x 
      009FF0 E3 CD            [ 2]  783 	ldw x,(SSP,sp)
      009FF2 9C               [ 2]  784 	ldw (x),y
      009FF3 76 A6 80         [ 4]  785 	call reset_vector
      009FF6 B4 36            [ 2]  786 	ldw x,(OFS,sp) 
      009FF8 B7 36            [ 2]  787 	jra 1$
      009FFA CD 9F            [ 2]  788 9$:	ldw x,(SSP,sp) 
      009FFC C9 CD 9D         [ 2]  789 	addw x,#CELLL 
      009FFF B4 90            [ 2]  790 	addw sp,#VSIZE ; drop local variables  
      00A001 93               [ 4]  791 	ret 
                                    792 
                                    793 ;------------------------------
                                    794 ; set interrupt vector 
                                    795 ; SET-IVEC ( ud n -- )
                                    796 ;  ud Handler address
                                    797 ;  n  vector # 0 .. 29 
                                    798 ;-----------------------------
      00A002 90 FE                  799 	.word LINK
                           0020C9   800 	LINK=.
      00A004 1C                     801 	.byte 8 
      00A005 00 02 89 93 CD 17 00   802 	.ascii "SET-IVEC" 
             CD
      0020D2                        803 set_vector:
      00A00D 9D DC            [ 1]  804     ldw y,x 
      00A00F 85 CD 84         [ 2]  805 	addw x,#CELLL 
      00A012 CD 81            [ 2]  806 	ldw y,(y) ; vector #
      00A014 9F E7 07 53      [ 2]  807 	cpw y,#29 ; last vector
      00A018 45 54            [ 2]  808 	jrule 2$
      00A01A 2D 4F 50         [ 2]  809 	addw x,#2*CELLL 
      00A01D 54               [ 4]  810 	ret
      00A01E 90 58            [ 2]  811 2$:	sllw y 
      00A01E 90 93            [ 2]  812 	sllw y 
      00A020 90 FE 27 06      [ 2]  813 	addw y,#0X8008 ; IRQ0 vector address 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 121.
Hexadecimal [24-Bits]



      00A024 90 A3 00         [ 2]  814 	ldw YTEMP,y ; vector address 
      00A027 07 23            [ 1]  815 	ld a,#0x82 
      00A029 04 1C            [ 1]  816 	ld yh,a 
      00A02B 00 04            [ 1]  817 	ld a,(1,x) ; isr address bits 23..16 
      00A02D 81 90            [ 1]  818 	ld yl,a 
                                    819 ;  write 0x82 + most significant byte of int address	
      00A02F 58 72 A9         [ 2]  820 	subw x,#3*CELLL 
      00A032 47 FF            [ 2]  821 	ldw (4,x),y 
      00A034 FF 1D 00         [ 2]  822 	ldw y,YTEMP
      00A037 02 90            [ 2]  823 	ldw (2,x),y ; vector address 
      00A039 5F FF            [ 1]  824 	clrw y 
      00A03B CD               [ 2]  825 	ldw (x),y   ; as a double 
      00A03C 9E B4 81         [ 4]  826 	call EESTORE 
      00A03F A0 16            [ 1]  827 	ldw y,x 
      00A041 08 50 52         [ 2]  828 	ldw y,(2,y) ; bits 15..0 int vector 
      00A044 49 53 54         [ 2]  829 	subw x,#3*CELLL 
      00A047 49 4E            [ 2]  830 	ldw (4,x),y 
      00A049 45 BE 26         [ 2]  831 	ldw y,YTEMP 
      00A04A 72 A9 00 02      [ 2]  832 	addw y,#2 
      00A04A CD 9C            [ 2]  833 	ldw (2,x),y 
      00A04C 95 CD            [ 1]  834 	clrw y 
      00A04E 88               [ 2]  835 	ldw (x),y 
      00A04F A7 CD 9F         [ 4]  836 	call EESTORE
      00A052 2A 90 93         [ 2]  837 	addw x,#2*CELLL  
      00A055 90               [ 4]  838 9$: ret 
                                    839 
                                    840 
                                    841 ;------------------------
                                    842 ; Compile word to flash
                                    843 ; EE, (w -- )
                                    844 ;-----------------------
      00A056 EE 02                  845 	.word LINK
                           002125   846 	LINK=.
      00A058 72                     847 	.byte 3
      00A059 A9 00 80               848 	.ascii "EE,"
      002129                        849 EE_COMMA:
      00A05C EF 02 90         [ 2]  850 	subw x,#2*CELLL 
      00A05F A3 48 00         [ 2]  851 	ldw y,UCP
      00A062 25 E9            [ 2]  852 	pushw y 
      00A064 90 AE            [ 2]  853 	ldw (2,x),y 
      00A066 00 01            [ 1]  854 	clrw y 
      00A068 FF               [ 2]  855 	ldw (x),y
      00A069 90 5F EF         [ 4]  856 	call EESTORE
      00A06C 02 CD            [ 2]  857 	popw y 
      00A06E 88 A7 CD A0      [ 2]  858 	addw y,#2
      00A072 1E 90 93         [ 2]  859 	ldw UCP,y
      00A075 90               [ 4]  860 	ret 
                                    861 
                                    862 
                                    863 ;-------------------------
                                    864 ; Compile byte to flash 
                                    865 ; EEC, ( c -- )	
                                    866 ;-------------------------
      00A076 FE 90                  867 	.word LINK 
                           002145   868 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 122.
Hexadecimal [24-Bits]



      00A078 5C                     869 	.byte 4 
      00A079 90 A3 00 08            870 	.ascii "EEC,"
      00214A                        871 EE_CCOMMA:
      00A07D 25 E9 90         [ 2]  872 	subw x,#2*CELLL 
      00A080 AE B6 00         [ 2]  873 	ldw y,UCP
      00A083 EF 02            [ 2]  874 	pushw y 
      00A085 90 5F            [ 2]  875 	ldw (2,x),y 
      00A087 FF CD            [ 1]  876 	clrw y 
      00A089 9F               [ 2]  877 	ldw (x),y
      00A08A 2A 1D 00         [ 4]  878 	call EECSTORE
      00A08D 02 90            [ 2]  879 	popw y 
      00A08F 5F FF            [ 1]  880 	incw y 
      00A091 CD 86 99         [ 2]  881 	ldw UCP,y
      00A094 CD               [ 4]  882 	ret 
                                    883 
                                    884 
                                    885 ;--------------------------
                                    886 ; copy FLASH block to ROWBUF
                                    887 ; ROW>BUF ( ud -- )
                                    888 ;--------------------------
      00A095 A0 B1                  889 	.word LINK 
                           002164   890 	LINK=.
      00A097 90                     891 	.byte 7 
      00A098 93 90 FE 90 5C 90 A3   892 	.ascii "ROW>BUF"
      00216C                        893 ROW2BUF: 
      00A09F 00 19 25         [ 4]  894 	call FPSTOR 
      00A0A2 ED CC            [ 1]  895 	ld a,#BLOCK_SIZE
      00A0A4 80               [ 1]  896 	push a 
      00A0A5 80 A0            [ 1]  897 	and a,PTR8 ; block align 
      00A0A7 41 08            [ 1]  898 	ld PTR8,a
      00A0A9 52 53 54 2D      [ 2]  899 	ldw y,#ROWBUFF 
      00A0AD 49 56 45 43      [ 5]  900 1$: ldf a,[FPTR]
      00A0B1 90 F7            [ 1]  901 	ld (y),a
      00A0B1 90 93 1C         [ 4]  902 	call INC_FPTR
      00A0B4 00 02            [ 1]  903 	incw y 
      00A0B6 90 FE            [ 1]  904 	dec (1,sp)
      00A0B8 90 A3            [ 1]  905 	jrne 1$ 
      00A0BA 00               [ 1]  906 	pop a 
      00A0BB 17               [ 4]  907 	ret 
                                    908 
                                    909 
                                    910 ;---------------------------
                                    911 ; copy ROWBUFF to flash 
                                    912 ; BUF>ROW ( ud -- )
                                    913 ; ud is row address as double 
                                    914 ;---------------------------
      00A0BC 27 3A                  915 	.word LINK 
                           00218D   916 	LINK=.
      00A0BE 90                     917 	.byte 7 
      00A0BF A3 00 1D 22 34 90 58   918 	.ascii "BUF>ROW" 
      002195                        919 BUF2ROW:
      00A0C6 90 58 72         [ 4]  920 	call TBUF ; ( ud rb -- )
      00A0C9 A9 80 08         [ 4]  921 	call ROT 
      00A0CC 90 BF 26         [ 4]  922 	call ROT  ; ( rb ud -- )
      00A0CF 1D 00 06         [ 4]  923 	call write_row 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 123.
Hexadecimal [24-Bits]



      00A0D2 EF               [ 4]  924 	ret 
                                    925 
                                    926 ;---------------------------------
                                    927 ; how many byte free in that row 
                                    928 ; RFREE ( a -- n )
                                    929 ; a is least byte of target address
                                    930 ;----------------------------------
      00A0D3 02 90                  931 	.word LINK 
                           0021A4   932 	LINK=.
      00A0D5 5F                     933 	.byte 5 
      00A0D6 FF A6 82 90 95         934 	.ascii "RFREE"
      0021AA                        935 RFREE:
      00A0DB EF 04            [ 1]  936 	ld a,(1,x)
      00A0DD CD 9F            [ 1]  937 	and a,#BLOCK_SIZE-1 
      00A0DF 00 1D            [ 1]  938 	ld YTEMP,a 
      00A0E1 00 06            [ 1]  939 	ld a,#BLOCK_SIZE 
      00A0E3 90 5F            [ 1]  940 	sub a,YTEMP 
      00A0E5 FF 90            [ 1]  941 	clrw y 
      00A0E7 AE 80            [ 1]  942 	ld yl,a
      00A0E9 80               [ 2]  943 	ldw (x),y 
      00A0EA EF               [ 4]  944 	ret 
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
      00A0EB 04 90                  955 	.word LINK 
                           0021BC   956 	LINK=. 
      00A0ED BE                     957 	.byte 6
      00A0EE 26 72 A9 00 02 EF      958 	.ascii "RAM>EE"
                                    959 	
      0021C3                        960 RAM2EE:
                                    961 ; copy ud on top 
      00A0F4 02 CD            [ 1]  962 	ldw y,x 
      00A0F6 9F 00 81         [ 2]  963 	ldw y,(6,y) ; LSW of ud  
      00A0F9 A0 A8 07         [ 2]  964 	ldw YTEMP,y 
      00A0FC 43 48            [ 1]  965 	ldw y,x 
      00A0FE 4B 49 56         [ 2]  966 	ldw y,(4,y)  ; MSW of ud 
      00A101 45 43 04         [ 2]  967 	subw x,#2*CELLL 
      00A103 FF               [ 2]  968 	ldw (x),y 
      00A103 52 06 90         [ 2]  969 	ldw y,YTEMP 
      00A106 93 90            [ 2]  970 	ldw (2,x),y 
      00A108 FE 17 03         [ 4]  971 	call ROW2BUF 
      00A10B 1F 01            [ 1]  972 	ldw y,x 
      00A10D AE 80 0A         [ 2]  973 	ldw y,(6,y)
      00A110 BF 35            [ 2]  974 	pushw y ; udl 
      00A112 AE FF            [ 1]  975 	ld a,yl
      00A114 FC 1C            [ 1]  976 	and a,#BLOCK_SIZE-1 
      00A116 00 04            [ 1]  977 	clrw y 
      00A118 A3 00            [ 1]  978 	ld yl,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 124.
Hexadecimal [24-Bits]



      00A11A 78 27 22 90      [ 2]  979 	addw y,#ROWBUFF 
      00A11E 93 91 D6         [ 2]  980 	subw x,#CELLL 
      00A121 35               [ 2]  981 	ldw (x),y  
      00A122 11 03 25         [ 4]  982 	call SWAPP ;  ( ud a ra u -- )
      00A125 EF 90 5C         [ 4]  983 	call RFROM  
      00A128 91 D6 35         [ 4]  984 	call RFREE 
      00A12B 11 04 25         [ 4]  985 	call MIN
      00A12E E6 1F 05         [ 4]  986 	call DUPP 
      00A131 54 54 90         [ 4]  987 	call TOR  
      00A134 93 1E 01         [ 4]  988 	call CMOVE
      00A137 FF CD A0         [ 4]  989 	call BUF2ROW 
      00A13A B1 1E 05         [ 4]  990 	call RFROM 
      00A13D 20               [ 4]  991 	ret 
                                    992 
                                    993 
                                    994 ;--------------------------
                                    995 ; expand 16 bit address 
                                    996 ; to 32 bit address 
                                    997 ; FADDR ( a -- ud )
                                    998 ;--------------------------
      00A13E D6 1E                  999 	.word LINK 
                           002211  1000 	LINK=. 
      00A140 01                    1001 	.byte 5 
      00A141 1C 00 02 5B 06        1002 	.ascii "FADDR"
      002217                       1003 FADDR:
      00A146 81 A0 FB         [ 2] 1004 	jp ZERO 
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
      00A149 08 53                 1020 	.word LINK 
                           00221C  1021 	LINK=.
      00A14B 45                    1022 	.byte 5 
      00A14C 54 2D 49 56 45        1023 	.ascii "FMOVE" 
      002222                       1024 FMOVE:
      00A151 43 07 2F         [ 4] 1025 	call TFLASH 
      00A152 CD 04 E3         [ 4] 1026 	CALL AT 
      00A152 90 93 1C         [ 4] 1027 	CALL QBRAN 
      00A155 00 02                 1028 	.word no_move  
      00A157 90 FE 90         [ 4] 1029 	call CPP
      00A15A A3 00 1D         [ 4] 1030 	call AT  
      00A15D 23 04 1C         [ 4] 1031 	call DUPP ; ( udl udl -- )
      00A160 00 04 81         [ 4] 1032 	call CNTXT 
      00A163 90 58 90         [ 4] 1033 	call AT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 125.
Hexadecimal [24-Bits]



      00A166 58 72 A9         [ 4] 1034 	call DOLIT 
      00A169 80 08                 1035 	.word 2 
      00A16B 90 BF 26         [ 4] 1036 	call SUBB ; ( udl udl a -- )
      00A16E A6 82 90         [ 4] 1037 	call SWAPP 
      00A171 95 E6 01         [ 4] 1038 	call FADDR 
      00A174 90 97 1D         [ 4] 1039 	call ROT  ; ( udl ud a -- )
      00A177 00 06 EF         [ 4] 1040 	call DUPP 
      00A17A 04 90 BE         [ 4] 1041 	call TOR    ; R: a 
      002253                       1042 FMOVE2: 
      00A17D 26 EF 02         [ 4] 1043 	call HERE 
      00A180 90 5F FF         [ 4] 1044 	call RAT 
      00A183 CD 9F 00         [ 4] 1045 	call SUBB ; (udl ud a wl -- )
      00225C                       1046 next_row:
      00A186 90 93 90         [ 4] 1047 	call DUPP 
      00A189 EE 02 1D         [ 4] 1048 	call TOR  ; ( udl ud a wl -- ) R: a wl
      00A18C 00 06 EF         [ 4] 1049 	call RAM2EE ; ( udl a u -- udl u2 ) u2 is byte written to FLASH 
      00A18F 04 90 BE         [ 4] 1050 	call DUPP 
      00A192 26 72 A9         [ 4] 1051 	call TOR
      00A195 00 02 EF         [ 4] 1052 	call PLUS  ; ( udl+ ) 
      00A198 02 90 5F         [ 4] 1053 	call DUPP 
      00A19B FF CD 9F         [ 4] 1054 	call ZERO   ; ( udl+ ud -- )
      00A19E 00 1C 00         [ 4] 1055 	call RFROM  ; ( udl+ ud u2  R: a wl ) 
      00A1A1 04 81 A1         [ 4] 1056 	call RFROM  ; ( udl+ ud u2 wl R: a ) 
      00A1A4 49 03 45         [ 4] 1057 	call OVER   ; ( udl+ ud u2 wl u2 -- )
      00A1A7 45 2C D2         [ 4] 1058 	call SUBB  ; ( udl+ ud u2 wl- R: a )
      00A1A9 CD 06 19         [ 4] 1059 	call DUPP 
      00A1A9 1D 00 04         [ 4] 1060 	call QBRAN
      00A1AC 90 BE                 1061 	.word fmove_done 
      00A1AE 1A 90 89         [ 4] 1062 	call SWAPP  ; ( udl+ ud wl- u2 R: a )
      00A1B1 EF 02 90         [ 4] 1063 	call RFROM ; ( udl+ ud wl- u2 a -- ) 
      00A1B4 5F FF CD         [ 4] 1064 	call PLUS  ; ( udl+2 ud wl- a+ )
      00A1B7 9F 00 90         [ 4] 1065 	call DUPP 
      00A1BA 85 72 A9         [ 4] 1066 	call TOR   ; ( udl+2 ud wl- a+ ) R: a+
      00A1BD 00 02 90         [ 4] 1067 	call SWAPP 
      00A1C0 BF 1A 81         [ 4] 1068 	call BRAN
      00A1C3 A1 A5                 1069 	.word next_row  
      00229F                       1070 fmove_done:	
      00A1C5 04 45 45         [ 4] 1071 	call RFROM  ; ( -- udl+ ud u2 wl- a  )
      00A1C8 43 2C 0A         [ 2] 1072 	addw x,#5*CELLL ; (  -- cp+ ) new CP 
      00A1CA 81               [ 4] 1073  	ret  
      0022A6                       1074 no_move:
      00A1CA 1D 00 04         [ 4] 1075 	call ZERO
      00A1CD 90               [ 4] 1076 	ret 
                                   1077 
                                   1078 ;------------------------------------------
                                   1079 ; adjust pointers after **FMOVE** operetion.
                                   1080 ; UPDAT-PTR ( cp+ -- )
                                   1081 ; cp+ is new CP position after FMOVE 
                                   1082 ;-------------------------------------------
      00A1CE BE 1A                 1083 	.word LINK 
                           0022AC  1084 	LINK=.
      00A1D0 90                    1085 	.byte 9
      00A1D1 89 EF 02 90 5F FF CD  1086 	.ascii "UPDAT-PTR" 
             9E B4
      0022B6                       1087 UPDATPTR:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 126.
Hexadecimal [24-Bits]



                                   1088 ;reset VP to previous position  
      00A1DA 90 85 90         [ 4] 1089 	call EEPVP 
      0022B9                       1090 	_DROP 
      00A1DD 5C 90 BF         [ 2]    1     ADDW X,#CELLL  
      00A1E0 1A 81 A1         [ 4] 1091 	call AT
      00A1E3 C5 07 52         [ 4] 1092 	call VPP 
      00A1E6 4F 57 3E         [ 4] 1093 	call STORE
                                   1094 ;update CONTEXT and LAST 
      00A1E9 42 55 46         [ 4] 1095 	call EEPCP 
      00A1EC                       1096 	_DROP
      00A1EC CD 9C 76         [ 2]    1     ADDW X,#CELLL  
      00A1EF A6 80 88         [ 4] 1097 	call AT
      00A1F2 B4 36 B7         [ 4] 1098 	call DOLIT 
      00A1F5 36 90                 1099 	.word 2 
      00A1F7 AE 16 80         [ 4] 1100 	call PLUS 
      00A1FA 92 BC 00         [ 4] 1101 	call DUPP 
      00A1FD 34 90 F7         [ 4] 1102 	call CNTXT 
      00A200 CD 9D F0         [ 4] 1103 	call STORE
      00A203 90 5C 0A         [ 4] 1104 	call LAST
      00A206 01 26 F1         [ 4] 1105 	call STORE 
      00A209 84 81 A1         [ 4] 1106 	call UPDATLAST 
                                   1107 ;update CP 
      00A20C E4 07 42         [ 4] 1108 	call CPP 
      00A20F 55 46 3E         [ 4] 1109 	call STORE
      00A212 52 4F 57         [ 4] 1110 	call UPDATCP 
      00A215 81               [ 4] 1111 	ret 
                                   1112 
                                   1113 ;-----------------------------
                                   1114 ; move interrupt sub-routine
                                   1115 ; in flash memory
                                   1116 ;----------------------------- 
      00A215 CD 87                 1117 	.word LINK 
                           0022F4  1118 	LINK=. 
      00A217 9D                    1119 	.byte 6
      00A218 CD 88 5D CD 88 5D     1120 	.ascii "IFMOVE" 
      0022FB                       1121 IFMOVE:
      00A21E CD 9F EE         [ 4] 1122 	call TFLASH 
      00A221 81 A2 0D         [ 4] 1123 	CALL AT 
      00A224 05 52 46         [ 4] 1124 	CALL QBRAN 
      00A227 52 45                 1125 	.word no_move 
      00A229 45 07 7E         [ 4] 1126 	call CPP 
      00A22A CD 04 E3         [ 4] 1127 	call AT 
      00A22A E6 01 A4         [ 4] 1128 	call DUPP ; ( udl udl -- )
      00A22D 7F B7 26         [ 4] 1129 	call EEPVP 
      002312                       1130 	_DROP
      00A230 A6 80 B0         [ 2]    1     ADDW X,#CELLL  
      00A233 26 90 5F         [ 4] 1131 	call AT  ; ( udl udl a )
      00A236 90 97 FF         [ 4] 1132 	call TOR 
      00A239 81 A2 24         [ 4] 1133 	call FADDR
      00A23C 06 52 41         [ 4] 1134 	call RAT ; ( udl ud a -- ) R: a 
      00A23F 4D 3E 45         [ 2] 1135 	jp FMOVE2 
                                   1136 
                                   1137 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 127.
Hexadecimal [24-Bits]



                           000001  4557 .if WANT_SCALING_CONST 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 128.
Hexadecimal [24-Bits]



                                   4558         .include "const_ratio.asm"
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
      00A242 45 F4                   34         .word LINK 
                           002326    35         LINK=.
      00A243 02                      36         .byte 2
      00A243 90 93                   37         .ascii "PI" 
      002329                         38 PII:
      00A245 90 EE 06         [ 2]   39         subw x,#2*CELLL 
      00A248 90 BF 26 90      [ 2]   40         ldw y,#355 
      00A24C 93 90            [ 2]   41         ldw (2,x),y 
      00A24E EE 04 1D 00      [ 2]   42         ldw y,#113 
      00A252 04               [ 2]   43         ldw (x),y 
      00A253 FF               [ 4]   44         ret 
                                     45 
                                     46 ;      SQRT2 ( -- 19601  13860 )
                                     47 ; precision: 1.5e-9 
                                     48 ; usage example to compute Voltage peek to peek from Vrms 
                                     49 ; : VPP SQRT2 */ 2 * ;
                                     50 ;
      00A254 90 BE                   51         .word LINK 
                           00233A    52         LINK=.
      00A256 26                      53         .byte 5 
      00A257 EF 02 CD A1 EC          54         .ascii "SQRT2" 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 129.
Hexadecimal [24-Bits]



      002340                         55 SQRT2:
      00A25C 90 93 90         [ 2]   56         subw x,#2*CELLL 
      00A25F EE 06 90 89      [ 2]   57         ldw y,#19601 
      00A263 90 9F            [ 2]   58         ldw (2,x),y 
      00A265 A4 7F 90 5F      [ 2]   59         ldw y,#13860 
      00A269 90               [ 2]   60         ldw (x),y 
      00A26A 97               [ 4]   61         ret 
                                     62 
                                     63 ;   SQRT3 ( -- 18817 10864 )
                                     64 ; precision: 1.1e-9
                                     65 ;
      00A26B 72 A9                   66         .word LINK 
                           002351    67         LINK=.
      00A26D 16                      68         .byte 5
      00A26E 80 1D 00 02 FF          69         .ascii "SQRT3" 
      002357                         70 SQRT3: 
      00A273 CD 86 A9         [ 2]   71     subw x,#2*CELLL 
      00A276 CD 85 B4 CD      [ 2]   72     ldw y,#18817 
      00A27A A2 2A            [ 2]   73     ldw (2,x),y 
      00A27C CD 89 FF CD      [ 2]   74     ldw y,#10864 
      00A280 86               [ 2]   75     ldw (x),y 
      00A281 99               [ 4]   76     ret 
                                     77 
                                     78 ;   E ( -- 28667 10546 )
                                     79 ; precision: 5.5e-9 
                                     80 ; natural log base 
      00A282 CD 86                   81         .word LINK 
                           002368    82         LINK=.
      00A284 62                      83         .byte 1
      00A285 CD                      84         .ascii "E" 
      00236A                         85 ENEPER:
      00A286 8D A9 CD         [ 2]   86     subw x,#2*CELLL 
      00A289 A2 15 CD 85      [ 2]   87     ldw y,#28667 
      00A28D B4 81            [ 2]   88     ldw (2,x),y 
      00A28F A2 3C 05 46      [ 2]   89     ldw y,#10546 
      00A293 41               [ 2]   90     ldw (x),y 
      00A294 44               [ 4]   91     ret 
                                     92 
                                     93 ;   SQRT10 ( -- 22936 7253 )
                                     94 ; precision: 5.7e-9 
      00A295 44 52                   95         .word LINK 
                           00237B    96         LINK=.
      00A297 06                      97         .byte 6 
      00A297 CC 8C 7F A2 91 05       98         .ascii "SQRT10" 
      002382                         99 SQRT10:
      00A29D 46 4D 4F         [ 2]  100     subw x,#2*CELLL
      00A2A0 56 45 59 98      [ 2]  101     ldw y,#22936 
      00A2A2 EF 02            [ 2]  102     ldw (2,x),y 
      00A2A2 CD 87 AF CD      [ 2]  103     ldw y,#7253
      00A2A6 85               [ 2]  104     ldw (x),y 
      00A2A7 63               [ 4]  105     ret 
                                    106 
                                    107 ;   12RT2 ( -- 26797 25293 )
                                    108 ; precision: 1.0e-9 
                                    109 ; used in music to compute well tempered scale
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 130.
Hexadecimal [24-Bits]



      00A2A8 CD 85                  110         .word LINK 
                           002393   111         LINK=. 
      00A2AA 18                     112         .byte 5 
      00A2AB A3 26 CD 87 FE         113         .ascii "12RT2"
      002399                        114 RT12_2:
      00A2B0 CD 85 63         [ 2]  115     subw x,#2*CELLL 
      00A2B3 CD 86 99 CD      [ 2]  116     ldw y,#26797
      00A2B7 87 E2            [ 2]  117     ldw (2,x),y 
      00A2B9 CD 85 63 CD      [ 2]  118     ldw y,#25293
      00A2BD 84               [ 2]  119     ldw (x),y 
      00A2BE EF               [ 4]  120     ret 
                                    121 
                                    122 ;   LOG2s ( -- 2040 11103 )
                                    123 ; log(2)/1.6384
                                    124 ; precision: 1.1e-8
      00A2BF 00 02                  125         .word LINK 
                           0023AA   126         LINK=.
      00A2C1 CD                     127         .byte 5 
      00A2C2 89 52 CD 86 A9         128         .ascii "LOG2S" 
      0023B0                        129 LOG2S:
      00A2C7 CD A2 97         [ 2]  130     subw x,#2*CELLL
      00A2CA CD 88 5D CD      [ 2]  131     ldw y,#2040 
      00A2CE 86 99            [ 2]  132     ldw (2,x),y 
      00A2D0 CD 86 62 5F      [ 2]  133     ldw y,#11103 
      00A2D3 FF               [ 2]  134     ldw (x),y 
      00A2D3 CD               [ 4]  135     ret 
                                    136 
                                    137 ;   LN2 ( -- 485 11464 )
                                    138 ; ln(2)/16.384 
                                    139 ; precision: 1.0e-7 
      00A2D4 8D 5C                  140         .word LINK 
                           0023C1   141         LINK=.
      00A2D6 CD                     142         .byte 4 
      00A2D7 85 C5 CD 89            143         .ascii "LN2S" 
      0023C6                        144 LN2S: 
      00A2DB 52 00 04         [ 2]  145     subw x,#2*CELLL
      00A2DC 90 AE 01 E5      [ 2]  146     ldw y,#485
      00A2DC CD 86            [ 2]  147     ldw (2,x),y 
      00A2DE 99 CD 86 62      [ 2]  148     ldw y,#11464 
      00A2E2 CD               [ 2]  149     ldw (x),y 
      00A2E3 A2               [ 4]  150     ret 
                                    151 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 131.
Hexadecimal [24-Bits]



                                   4559 .endif
                           000001  4560 .if WANT_CONST_TABLE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 132.
Hexadecimal [24-Bits]



                                   4561         .include "ctable.asm"
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
      00A2E4 43 CD                   34     .word LINK 
                           0023D7    35     LINK=.
      00A2E6 86                      36     .byte 6
      00A2E7 99 CD 86 62 CD 88       37     .ascii "CALLOT"
      0023DE                         38 CALLOT:
      00A2ED BC CD 86         [ 4]   39     CALL CPP
      00A2F0 99 CD 8C         [ 4]   40     CALL DUPP 
      00A2F3 7F CD 85         [ 4]   41     CALL AT 
      00A2F6 B4 CD 85         [ 4]   42     CALL TOR 
      00A2F9 B4 CD 86         [ 4]   43     CALL PSTOR 
      00A2FC C1 CD 89         [ 4]   44     CALL UPDATCP 
      00A2FF 52 CD 86         [ 4]   45     CALL RFROM
      00A302 99 CD 85         [ 2]   46     JP ZERO 
                                     47 
                                     48 ;------------------------------
                                     49 ; create constants bytes table 
                                     50 ; in persistant memory
                                     51 ;  CTABLE ( n+ -- ad ; <string> )
                                     52 ; n+ bytes reserved 
                                     53 ;-----------------------------
      00A305 18 A3                   54     .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 133.
Hexadecimal [24-Bits]



                           0023F8    55     LINK=.
      00A307 1F                      56     .byte 6
      00A308 CD 86 A9 CD 85 B4       57     .ascii "CTABLE"
      0023FF                         58 CTABLE:
      00A30E CD 88 BC         [ 4]   59     CALL CALLOT     
      00A311 CD 86 99         [ 2]   60     JP DCONST 
                                     61      
                                     62 
                                     63 ;--------------------------------
                                     64 ; create constants words table 
                                     65 ; in persistant memory 
                                     66 ; WTABLE ( n+ -- ad ; <string> )
                                     67 ; n+  words reserved  
                                     68 ;--------------------------------
      00A314 CD 86                   69     .word LINK 
                           002407    70     LINK=.
      00A316 62                      71     .byte 6
      00A317 CD 86 A9 CD 85 34       72     .ascii "WTABLE"
      00240E                         73 WTABLE:
      00A31D A2 DC 86         [ 4]   74     CALL CELLS  
      00A31F CD 23 DE         [ 4]   75     CALL CALLOT 
      00A31F CD 85 B4         [ 2]   76     JP DCONST 
                                     77 
                                     78 ;---------------------------------
                                     79 ; stack an element of CTABLE 
                                     80 ; CTABL@ ( u ad -- c )
                                     81 ; u element order {0..size-1}
                                     82 ; a|ad table address 
                                     83 ;--------------------------------
      00A322 1C 00                   84     .word LINK 
                           002419    85     LINK=.
      00A324 0A                      86     .byte 6
      00A325 81 54 41 42 4C 40       87     .ascii "CTABL@" 
      00A326                         88 CTAT:
      00A326 CD 8C 7F         [ 4]   89     call FPSTOR 
      00A329 81 A2 9C         [ 4]   90     call PTRPLUS 
      00A32C 09 55 50         [ 2]   91     jp EE_CREAD 
                                     92 
                                     93 ;---------------------------------
                                     94 ; stack an element of WTABLE 
                                     95 ; WTABL@ ( u ud -- w )
                                     96 ; u is element order {0..size-1}
                                     97 ; a|ud table address 
                                     98 ;----------------------------------
      00A32F 44 41                   99     .word LINK 
                           00242B   100     LINK=.
      00A331 54                     101     .byte 6
      00A332 2D 50 54 52 4C 40      102     .ascii "WTABL@" 
      00A336                        103 WTAT:
      00A336 CD 9C F0         [ 4]  104     call FPSTOR 
      00A339 1C 00 02         [ 4]  105     call CELLS 
      00A33C CD 85 63         [ 4]  106     call PTRPLUS 
      00A33F CD 87 F0         [ 4]  107     call EE_READ 
      00A342 CD               [ 4]  108     ret 
                                    109 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 134.
Hexadecimal [24-Bits]



                                    110 ;--------------------------
                                    111 ; tool to initialize character table 
                                    112 ; CTINIT ( ad -- )
                                    113 ; ad is table address 
                                    114 ;--------------------------
      00A343 85 51                  115     .word LINK 
                           002441   116     LINK=.
      00A345 CD                     117     .byte 6 
      00A346 9C DA 1C 00 02 CD      118     .ascii "CTINIT"
      002448                        119 CTINIT:
      00A34C 85 63 CD         [ 4]  120     CALL FPSTOR
      00A34F 84 EF 00         [ 4]  121     CALL UNLOCK
      00A352 02 CD 88         [ 4]  122     CALL ZERO 
      00A355 BC CD 86         [ 4]  123 1$: CALL ONEP 
      00A358 99 CD 87         [ 4]  124     CALL DUPP 
      00A35B E2 CD 85         [ 4]  125     CALL INTQ 
      00A35E 51 CD 88         [ 4]  126     CALL QBRAN 
      00A361 0E CD                  127     .word 2$
      00A363 85 51 CD         [ 4]  128     call WR_BYTE 
      00A366 9D 0A CD         [ 4]  129     CALL BRAN 
      00A369 87 FE                  130     .word 1$ 
      002467                        131 2$: _DDROP 
      00A36B CD 85 51         [ 2]    1    ADDW X,#2*CELLL 
      00A36E CD 9D 33         [ 4]  132     CALL LOCK 
      00A371 81               [ 4]  133     ret 
                                    134 
                                    135 ;--------------------------
                                    136 ; tool to initialize word table 
                                    137 ; WTINIT ( ad -- )
                                    138 ; ad is table address 
                                    139 ;--------------------------
      00A372 A3 2C                  140     .word LINK 
                           002470   141     LINK=.
      00A374 06                     142     .byte 6 
      00A375 49 46 4D 4F 56 45      143     .ascii "WTINIT"
      00A37B                        144 WTINIT:
      00A37B CD 87 AF         [ 4]  145     CALL FPSTOR
      00A37E CD 85 63         [ 4]  146     CALL UNLOCK
      00A381 CD 85 18         [ 4]  147     CALL ZERO 
      00A384 A3 26 CD         [ 4]  148 1$: CALL ONEP 
      00A387 87 FE CD         [ 4]  149     CALL DUPP
      00A38A 85 63 CD         [ 4]  150     CALL INTQ
      00A38D 86 99 CD         [ 4]  151     CALL QBRAN 
      00A390 9C F0                  152     .word 2$
      00A392 1C 00 02         [ 4]  153     call WR_WORD 
      00A395 CD 85 63         [ 4]  154     CALL BRAN 
      00A398 CD 86                  155     .word 1$ 
      002496                        156 2$: _DDROP 
      00A39A 62 CD A2         [ 2]    1    ADDW X,#2*CELLL 
      00A39D 97 CD 85         [ 4]  157     CALL LOCK 
      00A3A0 C5               [ 4]  158     ret 
                                    159 
                                    160 ;------------------------
                                    161 ; Prompted input for integer 
                                    162 ; display n+ in bracket and
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 135.
Hexadecimal [24-Bits]



                                    163 ; '?' 
                                    164 ; [N]? ( n+ -- a )
                                    165 ;------------------------
      00A3A1 CC A2                  166     .word LINK 
                           00249F   167     LINK=.
      00A3A3 D3                     168     .byte 4
      00A3A4 A3 74 02 50            169     .ascii "[N]?" 
      0024A4                        170 INTQ:
      00A3A8 49 0F 77         [ 4]  171     CALL CR 
      00A3A9 CD 04 6F         [ 4]  172     call DOLIT 
      00A3A9 1D 00                  173     .word '[
      00A3AB 04 90 AE         [ 4]  174     CALL EMIT 
      00A3AE 01 63 EF         [ 4]  175     CALL DOT 
      00A3B1 02 90 AE         [ 4]  176     CALL  DOTQP
      00A3B4 00                     177     .byte 3
      00A3B5 71 FF 81               178     .ascii "]? " 
      00A3B8 A3 A6 05         [ 4]  179     CALL QUERY 
      00A3BB 53 51 52         [ 4]  180     call TOKEN 
      00A3BE 54 32 7E         [ 2]  181     jp NUMBQ
                                    182 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 136.
Hexadecimal [24-Bits]



                                   4562 .endif
                           000001  4563 .if WANT_DOUBLE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 137.
Hexadecimal [24-Bits]



                                   4564         .include "double.asm"
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
      00A3C0                         35     _HEADER DBLVER,7,"DBL-VER"
      00A3C0 1D 00                    1         .word LINK 
                           0024C4     2         LINK=.
      00A3C2 04                       3         .byte 7  
      00A3C3 90 AE 4C 91 EF 02 90     4         .ascii "DBL-VER"
      0024CC                          5         DBLVER:
      00A3CA AE 36 24         [ 4]   36     CALL CR 
      00A3CD FF 81 A3         [ 4]   37     CALL DOTQP 
      00A3D0 BA                      38     .byte  24 
      00A3D1 05 53 51 52 54 33 20    39     .ascii "double integer library, "
             69 6E 74 65 67 65 72
             20 6C 69 62 72 61 72
             79 2C 20
      00A3D7 CD 1A F5         [ 4]   40     CALL PRT_LICENCE
      00A3D7 1D 00 04         [ 4]   41     CALL COPYRIGHT  
      0024F1                         42     _DOLIT DVER_MAJOR 
      00A3DA 90 AE 49         [ 4]    1     CALL DOLIT 
      00A3DD 81 EF                    2     .word DVER_MAJOR 
      0024F6                         43     _DOLIT DVER_MINOR  
      00A3DF 02 90 AE         [ 4]    1     CALL DOLIT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 138.
Hexadecimal [24-Bits]



      00A3E2 2A 70                    2     .word DVER_MINOR 
      00A3E4 FF 81 A3         [ 2]   44     JP PRINT_VERSION  
                                     45 
                                     46 
                                     47 ; check for negative sign 
                                     48 ; ajust pointer and cntr 
      0024FE                         49 nsign: ; addr cntr -- addr cntr f 
      00A3E7 D1 01 45         [ 2]   50     SUBW X,#CELLL ; a cntr f 
      00A3EA 90 93            [ 1]   51     LDW Y,X 
      00A3EA 1D 00 04         [ 2]   52     LDW Y,(4,Y) ; addr 
      00A3ED 90 AE            [ 1]   53     LD A,(Y) ; char=*addr  
      00A3EF 6F FB            [ 1]   54     CP A,#'-' 
      00A3F1 EF 02            [ 1]   55     JREQ NEG_SIGN 
      00A3F3 90               [ 1]   56     CLR A  
      00A3F4 AE 29            [ 2]   57     JRA STO_SIGN 
      00250F                         58 NEG_SIGN:
                                     59 ; increment addr 
      00A3F6 32 FF            [ 1]   60     LDW Y,X 
      00A3F8 81 A3 E8         [ 2]   61     LDW Y,(4,Y)
      00A3FB 06 53 51 52      [ 2]   62     ADDW Y,#1   ;addr+1 
      00A3FF 54 31            [ 2]   63     LDW (4,X),Y 
                                     64 ; decrement cntr 
      00A401 30 93            [ 1]   65     LDW Y,X
      00A402 90 EE 02         [ 2]   66     LDW Y,(2,Y)
      00A402 1D 00 04 90      [ 2]   67     SUBW Y,#1   ;cntr-1 
      00A406 AE 59            [ 2]   68     LDW (2,X),Y 
      00A408 98 EF            [ 1]   69     LD A,#0XFF
      002527                         70 STO_SIGN:   
      00A40A 02               [ 1]   71     LD (X),A 
      00A40B 90 AE            [ 1]   72     LD (1,X),A 
      00A40D 1C               [ 4]   73     RET 
                                     74 
                                     75 
                                     76 ; get all digits in row 
                                     77 ; stop at first non-digit or end of string 
                                     78 ; ( dlo dhi a cntr -- dlo dhi [ a+ cntr- | a+ 0 ] )
      00252B                         79 parse_digits:
      00252B                         80 1$:
      00A40E 55 FF 81         [ 4]   81     CALL DUPP 
      00252E                         82     _QBRAN 5$ 
      00A411 A3 FB 05         [ 4]    1     CALL QBRAN
      00A414 31 32                    2     .word 5$
      00A416 52 54 32         [ 4]   83     CALL TOR   ; dlo dhi a R: cntr 
      00A419 CD 0C C5         [ 4]   84     CALL COUNT ; dlo dhi a+ char 
      00A419 1D 00 04         [ 4]   85     CALL BASE 
      00A41C 90 AE 68         [ 4]   86     CALL AT 
      00A41F AD EF 02         [ 4]   87     CALL DIGTQ 
      002542                         88     _QBRAN 4$ ; not a digit
      00A422 90 AE 62         [ 4]    1     CALL QBRAN
      00A425 CD FF                    2     .word 4$
      00A427 81 A4 13         [ 4]   89     CALL DTOR  ; dlo dhi R: cntr a+ c  
      00A42A 05 4C 4F         [ 4]   90     CALL BASE 
      00A42D 47 32 53         [ 4]   91     CALL AT 
      00A430 CD 27 3C         [ 4]   92     CALL DSSTAR
      00A430 1D 00 04         [ 4]   93     CALL RFROM 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 139.
Hexadecimal [24-Bits]



      00A433 90 AE 07         [ 4]   94     CALL ZERO 
      00A436 F8 EF 02         [ 4]   95     CALL DPLUS 
      00A439 90 AE 2B         [ 4]   96     CALL RFROM  ; dlo dhi a+ 
      00A43C 5F FF 81         [ 4]   97     CALL RFROM ; dlo dhi a+ cntr 
      00A43F A4 2A 04         [ 4]   98     CALL ONEM 
      002565                         99     _BRAN 1$ ; dlo dhi a+ R: 
      00A442 4C 4E 32         [ 4]    1     CALL BRAN 
      00A445 53 2B                    2     .word 1$ 
      00A446                        100 4$: _DROP  ; dlo dhi a+ 
      00A446 1D 00 04         [ 2]    1     ADDW X,#CELLL  
      00A449 90 AE 01         [ 4]  101     CALL ONEM  ; unget char 
      00A44C E5 EF 02         [ 4]  102     CALL RFROM ; dlo dhi a+ cntr-
      002573                        103 5$:
      00A44F 90               [ 4]  104     RET 
                                    105 
                                    106 
                                    107 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    108 ;   NUMBER? (a -- s -1 |d -2 | a F )
                                    109 ;   convert string to integer 
                                    110 ;   double begin with '#' 
                                    111 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002574                        112     _HEADER NUMBQ,7,"NUMBER?"
      00A450 AE 2C                    1         .word LINK 
                           002576     2         LINK=.
      00A452 C8                       3         .byte 7  
      00A453 FF 81 A4 41 06 43 41     4         .ascii "NUMBER?"
      00257E                          5         NUMBQ:
                                    113 ; save current base value 
      00A45A 4C 4C 4F         [ 4]  114     CALL BASE 
      00A45D 54 04 E3         [ 4]  115     CALL AT 
      00A45E CD 05 E2         [ 4]  116     CALL TOR 
                                    117 ; initialize integer to 0     
      00A45E CD 87 FE         [ 2]  118     SUBW X,#4 
      00A461 CD 86            [ 1]  119     CLRW Y 
      00A463 99               [ 2]  120     LDW (X),Y 
      00A464 CD 85            [ 2]  121     LDW (2,X),Y ; a 0 0 R: base  
      00258F                        122     _DOLIT 2 
      00A466 63 CD 86         [ 4]    1     CALL DOLIT 
      00A469 62 CD                    2     .word 2 
      00A46B 8C EF CD         [ 4]  123     CALL PICK  ; a 0 0 a R: base    
      00A46E 9D 33 CD         [ 4]  124     CALL COUNT ; a 0 0 a+ n 
                                    125 ; check for '#' double integer 
      00A471 85 B4 CC         [ 4]  126     CALL OVER  ; a 0 0 a+ n a+
      00A474 8C 7F A4         [ 4]  127     CALL CAT   ; a 0 0 a+ n c 
      0025A0                        128     _DOLIT '#' ; a 0 0 a+ n c '#' 
      00A477 57 06 43         [ 4]    1     CALL DOLIT 
      00A47A 54 41                    2     .word '#' 
      00A47C 42 4C 45         [ 4]  129     CALL EQUAL 
      00A47F CD 05 E2         [ 4]  130     CALL TOR   ; a 0 0 a+ n R: base d? 
      00A47F CD A4 5E         [ 4]  131     CALL RAT   ; a 0 0 a+ n d? R: base d?
      0025AE                        132     _QBRAN NUMQ0
      00A482 CC 99 C6         [ 4]    1     CALL QBRAN
      00A485 A4 78                    2     .word NUMQ0
                                    133 ; update a and count
      00A487 06 57 54         [ 4]  134     CALL SWAPP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 140.
Hexadecimal [24-Bits]



      00A48A 41 42 4C         [ 4]  135     CALL ONEP 
      00A48D 45 06 29         [ 4]  136     CALL SWAPP 
      00A48E CD 0B A0         [ 4]  137     CALL ONEM  ; a 0 0 a+ n- R: base d?
                                    138 ; check for '$' hexadecimal  
      0025BF                        139 NUMQ0: 
      00A48E CD 8C 06         [ 4]  140     CALL OVER   
      00A491 CD A4 5E         [ 4]  141     CALL CAT   
      0025C5                        142     _DOLIT '$'
      00A494 CC 99 C6         [ 4]    1     CALL DOLIT 
      00A497 A4 87                    2     .word '$' 
      00A499 06 43 54         [ 4]  143     CALL EQUAL ; a 0 0 a+ n- f  
      0025CD                        144     _QBRAN NUMQ1 
      00A49C 41 42 4C         [ 4]    1     CALL QBRAN
      00A49F 40 E1                    2     .word NUMQ1
      00A4A0 CD 0E 94         [ 4]  145     CALL HEX   ; switch to hexadecimal base 
                                    146 ; update a and count 
      00A4A0 CD 9C 76         [ 4]  147     CALL SWAPP 
      00A4A3 CD 9E 08         [ 4]  148     CALL ONEP 
      00A4A6 CC 9E 45         [ 4]  149     CALL SWAPP
      00A4A9 A4 99 06         [ 4]  150     CALL ONEM ; a 0 0 a+ n-  R: base d?
                                    151 ; check for minus sign 
      0025E1                        152 NUMQ1: 
      00A4AC 57 54 41         [ 4]  153     CALL nsign 
      00A4AF 42 4C 40         [ 4]  154     CALL TOR ; R: base d? sign  
                                    155 ; check for end of string     
      00A4B2 CD 07 CC         [ 4]  156     CALL QDUP    ; a dlo dhi a+ cntr R: base d? sign 
      0025EA                        157     _QBRAN NUMQ4 ; yes , not a number 
      00A4B2 CD 9C 76         [ 4]    1     CALL QBRAN
      00A4B5 CD 8C                    2     .word NUMQ4
      00A4B7 06 CD 9E         [ 4]  158     CALL parse_digits
      00A4BA 08 CD 9E         [ 4]  159     CALL QDUP 
      00A4BD 23 81 A4         [ 4]  160     CALL ZEQUAL  
      0025F8                        161     _QBRAN NUMQ4 ; error not end of string  ( a dlo dhi a+ R: base d? sign )
      00A4C0 AB 06 43         [ 4]    1     CALL QBRAN
      00A4C3 54 49                    2     .word NUMQ4
      0025FD                        162     _DROP  ; a dlo dhi 
      00A4C5 4E 49 54         [ 2]    1     ADDW X,#CELLL  
      00A4C8 CD 05 34         [ 4]  163     CALL RFROM  ; a dlo dhi sign 
      002603                        164     _QBRAN NUMQ3
      00A4C8 CD 9C 76         [ 4]    1     CALL QBRAN
      00A4CB CD 9D                    2     .word NUMQ3
      00A4CD B4 CD 8C         [ 4]  165     CALL DNEGA
      00260B                        166 NUMQ3: 
      00A4D0 7F CD 8C         [ 4]  167     CALL ROT ; dlo dhi a  R: base d?
      00260E                        168     _DROP
      00A4D3 13 CD 86         [ 2]    1     ADDW X,#CELLL  
      002611                        169     _DOLIT -2  ; double return -2 flag 
      00A4D6 99 CD A5         [ 4]    1     CALL DOLIT 
      00A4D9 24 CD                    2     .word -2 
      00A4DB 85 18 A4         [ 4]  170     CALL RFROM ; dlo dhi d? R: base 
      002619                        171     _TBRAN NUMQ8 
      00A4DE E7 CD 9E         [ 4]    1     CALL TBRAN 
      00A4E1 5F CD                    2     .word NUMQ8 
      00A4E3 85 34 A4         [ 4]  172     CALL SWAPP 
      002621                        173     _DROP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 141.
Hexadecimal [24-Bits]



      00A4E6 D1 1C 00         [ 2]    1     ADDW X,#CELLL  
      00A4E9 04 CD 9D         [ 4]  174     CALL ONEP   ; single return -1 flag   
      002627                        175     _BRAN NUMQ8
      00A4EC DC 81 A4         [ 4]    1     CALL BRAN 
      00A4EF C1 06                    2     .word NUMQ8 
      00262C                        176 NUMQ4: ; not end of string error , ( a dlo dhi a+ cntr R: base d? sign )
                           000001   177 .if WANT_FLOAT
      00A4F1 57 54 49         [ 4]  178     CALL RFROM ; sign 
      00A4F4 4E 49 54         [ 4]  179     CALL RFROM ; d? 
      00A4F7 CD 2F 4F         [ 4]  180     CALL FLOATQ ; ( a dlo dhi a+ cntr sign d? )    
                           000000   181 .else 
                                    182     ADDW X,#4 ; drop dhi a+  , ( a dlo R: base d? sign ) 
                                    183     ADDW SP,#4 ; drop d? sign  R: base 
                                    184     CLRW Y 
                                    185     LDW (X),Y ; dlo replaced by 0 ( -- a 0 R: base ) 
                                    186 .endif 
                                    187 ; restore original base value     
      002635                        188 NUMQ8: 
      00A4F7 CD 9C 76         [ 4]  189     CALL RFROM 
      00A4FA CD 9D B4         [ 4]  190     CALL BASE 
      00A4FD CD 8C 7F         [ 4]  191     CALL STORE 
      00A500 CD               [ 4]  192     RET 
                                    193 
                                    194 
                                    195 
                                    196 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    197 ;   DABS ( d -- d )
                                    198 ;   absolute value of double
                                    199 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00263F                        200     _HEADER DABS,4,"DABS"
      00A501 8C 13                    1         .word LINK 
                           002641     2         LINK=.
      00A503 CD                       3         .byte 4  
      00A504 86 99 CD A5              4         .ascii "DABS"
      002646                          5         DABS:
      00A508 24               [ 1]  201     LD A,(X) 
      00A509 CD 85            [ 1]  202     AND A,#0X80 
      00A50B 18 A5            [ 1]  203     JREQ DABS1 
      00A50D 16 CD 9E         [ 4]  204     CALL DNEGA 
      00264E                        205 DABS1:
      00A510 84               [ 4]  206     RET 
                                    207 
                                    208 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    209 ;  DSIGN ( d -- d f )
                                    210 ;  sign of double 
                                    211 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00264F                        212     _HEADER DSIGN,5,"DSIGN"
      00A511 CD 85                    1         .word LINK 
                           002651     2         LINK=.
      00A513 34                       3         .byte 5  
      00A514 A5 00 1C 00 04           4         .ascii "DSIGN"
      002657                          5         DSIGN:
      00A519 CD 9D            [ 1]  213     LD A,#0 
      00A51B DC 81            [ 1]  214     LDW Y,X 
      00A51D A4 F0            [ 2]  215     LDW Y,(Y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 142.
Hexadecimal [24-Bits]



      00A51F 04 5B            [ 1]  216     JRPL DSIGN1
      00A521 4E 5D            [ 1]  217     LD A,#0XFF 
      002661                        218 DSIGN1:
      00A523 3F 00 02         [ 2]  219     SUBW X,#2 
      00A524 F7               [ 1]  220     LD (X),A 
      00A524 CD 8F            [ 1]  221     LD (1,X),A 
      00A526 F7               [ 4]  222     RET 
                                    223 
                                    224 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    225 ;   DS/MOD ( ud us - ur qud )
                                    226 ;   unsigned divide double by single 
                                    227 ;   return double quotient 
                                    228 ;   and single remainder 
                                    229 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002668                        230     _HEADER DSLMOD,6,"DS/MOD"
      00A527 CD 84                    1         .word LINK 
                           00266A     2         LINK=.
      00A529 EF                       3         .byte 6  
      00A52A 00 5B CD 84 B6 CD        4         .ascii "DS/MOD"
      002671                          5         DSLMOD:
      00A530 90 9E            [ 1]  231         LDW     Y,X             ; stack pointer to Y
      00A532 CD               [ 2]  232         LDW     X,(X)           ; un
      00A533 90 24            [ 2]  233         LDW     YTEMP,X         ; save un
      00A535 03               [ 1]  234         LDW     X,Y
      00A536 5D               [ 2]  235         PUSHW   X               ; save stack pointer
      00A537 3F 20            [ 2]  236         PUSHW   Y 
      00A539 CD 94            [ 2]  237         LDW     X,(2,X)           ; X=udh
      00A53B 2E CD 92         [ 2]  238         LDW     Y,YTEMP         ; divisor 
      00A53E 59               [ 2]  239         DIVW    X,Y 
      00A53F CC A5            [ 2]  240         LDW     XTEMP,X         ; QUOTIENT hi 
      00A541 FE               [ 1]  241         LDW     X,Y             ; remainder in X 
      00A542 A5 1F            [ 2]  242         POPW    Y 
      00A544 07 44 42         [ 2]  243         LDW     Y,(4,Y)         ; Y=udl (offset before drop)
      00A547 4C 2D            [ 1]  244         LD      A,#16           ; loop count
      00A549 56 45            [ 2]  245         SLLW    Y               ; udl shift udl into udh
      00268C                        246 DSLMOD3:
      00A54B 52               [ 2]  247         RLCW    X               ; rotate udl bit into uhdh (= remainder)
      00A54C 25 04            [ 1]  248         JRC     DSLMODa         ; if carry out of rotate
      00A54C CD 8F            [ 2]  249         CPW     X,YTEMP         ; compare udh to un
      00A54E F7 CD            [ 1]  250         JRULT   DSLMOD4         ; can't subtract
      002693                        251 DSLMODa:
      00A550 90 24 18 64      [ 2]  252         SUBW    X,YTEMP         ; can subtract
      00A554 6F               [ 1]  253         RCF
      002698                        254 DSLMOD4:
      00A555 75               [ 1]  255         CCF                     ; quotient bit
      00A556 62 6C            [ 2]  256         RLCW    Y               ; rotate into quotient, rotate out udl
      00A558 65               [ 1]  257         DEC     A               ; repeat
      00A559 20 69            [ 1]  258         JRNE    DSLMOD3           ; if A == 0
      00269E                        259 DSLMODb:
      00A55B 6E 74            [ 2]  260         LDW     YTEMP,X         ; done, save remainder
      00A55D 65               [ 2]  261         POPW    X               ; restore stack pointer
      00A55E 67 65            [ 2]  262         LDW     (2,X),Y           ; save quotient low 
      00A560 72 20 6C         [ 2]  263         LDW     Y,XTEMP         ; quotient hi 
      00A563 69               [ 2]  264         LDW     (X),Y           ; save quotient hi 
      00A564 62 72 61         [ 2]  265         LDW     Y,YTEMP         ; remainder onto stack
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 143.
Hexadecimal [24-Bits]



      00A567 72 79            [ 2]  266         LDW     (4,X),Y
      00A569 2C               [ 4]  267         RET 
                                    268 
                                    269 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    270 ;   D# ( d -- d )
                                    271 ;   extract least digit 
                                    272 ;   from double integer 
                                    273 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0026AD                        274     _HEADER DDIG,2,"D#"
      00A56A 20 CD                    1         .word LINK 
                           0026AF     2         LINK=.
      00A56C 9B                       3         .byte 2  
      00A56D 75 CD                    4         .ascii "D#"
      0026B2                          5         DDIG:
      00A56F 9B 4D CD         [ 4]  275     CALL BASE 
      00A572 84 EF 00         [ 4]  276     CALL AT 
      00A575 01 CD 84         [ 4]  277     CALL DSLMOD
      00A578 EF 00 00         [ 4]  278     CALL ROT   
      00A57B CC 9B 89         [ 4]  279     CALL DIGIT 
      00A57E CD 0E 09         [ 4]  280     CALL HOLD 
      00A57E 1D               [ 4]  281     RET 
                                    282 
                                    283 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    284 ;    D#S ( d -- s )
                                    285 ;   extract digit from double 
                                    286 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0026C5                        287     _HEADER DDIGS,3,"D#S"
      00A57F 00 02                    1         .word LINK 
                           0026C7     2         LINK=.
      00A581 90                       3         .byte 3  
      00A582 93 90 EE                 4         .ascii "D#S"
      0026CB                          5         DDIGS:
      00A585 04 90 F6         [ 4]  288     CALL    DDIG 
      00A588 A1 2D 27         [ 4]  289     CALL    DDUP 
      00A58B 03 4F 20         [ 4]  290     CALL    DZEQUAL
      0026D4                        291     _QBRAN  DDIGS 
      00A58E 18 04 98         [ 4]    1     CALL QBRAN
      00A58F 26 CB                    2     .word DDIGS
      00A58F 90 93 90         [ 4]  292     CALL    DROP 
      00A592 EE               [ 4]  293     RET 
                                    294 
                                    295 
                                    296 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    297 ;   D. ( d -- )
                                    298 ;   display double integer 
                                    299 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0026DD                        300     _HEADER DDOT,2,"D."
      00A593 04 72                    1         .word LINK 
                           0026DF     2         LINK=.
      00A595 A9                       3         .byte 2  
      00A596 00 01                    4         .ascii "D."
      0026E2                          5         DDOT:
      00A598 EF 04 90         [ 4]  301     CALL SPACE 
      00A59B 93 90 EE         [ 4]  302     CALL DSIGN 
      00A59E 02 72 A2         [ 4]  303     CALL TOR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 144.
Hexadecimal [24-Bits]



      00A5A1 00 01 EF         [ 4]  304     CALL RAT 
      0026EE                        305     _QBRAN DDOT0
      00A5A4 02 A6 FF         [ 4]    1     CALL QBRAN
      00A5A7 26 F6                    2     .word DDOT0
      00A5A7 F7 E7 01         [ 4]  306     CALL DNEGA 
      0026F6                        307 DDOT0:     
      00A5AA 81 0D F9         [ 4]  308     CALL BDIGS 
      00A5AB CD 26 CB         [ 4]  309     CALL DDIGS 
      00A5AB CD 05 34         [ 4]  310     CALL RFROM 
      0026FF                        311     _QBRAN DDOT1 
      00A5AB CD 86 99         [ 4]    1     CALL QBRAN
      00A5AE CD 85                    2     .word DDOT1
      002704                        312     _DOLIT '-' 
      00A5B0 18 A5 F3         [ 4]    1     CALL DOLIT 
      00A5B3 CD 86                    2     .word '-' 
      00A5B5 62 CD 8D         [ 4]  313     CALL HOLD 
      00270C                        314 DDOT1: 
      00A5B8 45 CD 87         [ 4]  315     CALL EDIGS 
      00A5BB 5F CD 85         [ 4]  316     CALL TYPES     
      00A5BE 63               [ 4]  317     RET 
                                    318 
                                    319 
                                    320 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    321 ;  UDS* ( ud u -- ud*u )
                                    322 ;  uint32*uint16 
                                    323 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002713                        324     _HEADER UDSSTAR,4,"UDS*"
      00A5BF CD 8F                    1         .word LINK 
                           002715     2         LINK=.
      00A5C1 3D                       3         .byte 4  
      00A5C2 CD 85 18 A5              4         .ascii "UDS*"
      00271A                          5         UDSSTAR:
      00A5C6 EA CD A9         [ 4]  325     CALL TOR 
      00A5C9 31 CD 87         [ 4]  326     CALL SWAPP 
      00A5CC 5F CD 85         [ 4]  327     CALL RAT 
      00A5CF 63 CD A7         [ 4]  328     CALL UMSTA ; udlo*u 
      00A5D2 BC CD 85         [ 4]  329     CALL ROT 
      00A5D5 B4 CD 8C         [ 4]  330     CALL RFROM 
      00A5D8 7F CD AB         [ 4]  331     CALL UMSTA ; udhi*u 
      00272F                        332     _DROP  ; drop overflow 
      00A5DB F4 CD 85         [ 2]    1     ADDW X,#CELLL  
      00A5DE B4 CD 85         [ 4]  333     CALL PLUS  ; udlo*u+(uhi*u<<16)
      00A5E1 B4               [ 4]  334     RET 
                                    335 
                                    336 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    337 ; multiply double by unsigned single 
                                    338 ; return double 
                                    339 ;  ( d u -- d )
                                    340 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002736                        341     _HEADER DSSTAR,3,"DS*"
      00A5E2 CD 8C                    1         .word LINK 
                           002738     2         LINK=.
      00A5E4 20                       3         .byte 3  
      00A5E5 CD 85 34                 4         .ascii "DS*"
      00273C                          5         DSSTAR:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 145.
Hexadecimal [24-Bits]



                                    342 ;DSSTAR:
      00A5E8 A5 AB 1C         [ 4]  343     CALL TOR
      00A5EB 00 02 CD         [ 4]  344     CALL DSIGN 
      00A5EE 8C 20 CD         [ 4]  345     CALL NROT 
      00A5F1 85 B4 46         [ 4]  346     CALL DABS
      00A5F3 CD 05 34         [ 4]  347     CALL RFROM 
      00A5F3 81 A5 44         [ 4]  348     CALL UDSSTAR  
      00A5F6 07 4E 55         [ 4]  349     CALL ROT 
      002751                        350     _QBRAN DSSTAR3 
      00A5F9 4D 42 45         [ 4]    1     CALL QBRAN
      00A5FC 52 3F                    2     .word DSSTAR3
      00A5FE CD 08 98         [ 4]  351     CALL DNEGA 
      002759                        352 DSSTAR3:
      00A5FE CD               [ 4]  353     RET 
                                    354 
                                    355 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    356 ;  2SWAP ( d1 d2 -- d2 d1 )
                                    357 ;  swap double 
                                    358 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00275A                        359     _HEADER DSWAP,5,"2SWAP"
      00A5FF 87 5F                    1         .word LINK 
                           00275C     2         LINK=.
      00A601 CD                       3         .byte 5  
      00A602 85 63 CD 86 62           4         .ascii "2SWAP"
      002762                          5         DSWAP:
      00A607 1D 00            [ 1]  360     LDW Y,X 
      00A609 04 90            [ 2]  361     LDW Y,(Y)
      00A60B 5F FF EF         [ 2]  362     LDW YTEMP,Y ; d2 hi 
      00A60E 02 CD            [ 1]  363     LDW Y,X 
      00A610 84 EF 00         [ 2]  364     LDW Y,(2,Y)
      00A613 02 CD 8C         [ 2]  365     LDW XTEMP,Y  ; d2 lo 
      00A616 D8 CD            [ 1]  366     LDW Y,X 
      00A618 8D 45 CD         [ 2]  367     LDW Y,(4,Y)  ; d1 hi 
      00A61B 86               [ 2]  368     LDW (X),Y 
      00A61C C1 CD            [ 1]  369     LDW Y,X
      00A61E 85 81 CD         [ 2]  370     LDW Y,(6,Y)  ; d1 lo 
      00A621 84 EF            [ 2]  371     LDW (2,X),Y
      00A623 00 23 CD         [ 2]  372     LDW Y,YTEMP  
      00A626 89 7A            [ 2]  373     LDW (4,X),Y 
      00A628 CD 86 62         [ 2]  374     LDW Y,XTEMP 
      00A62B CD 85            [ 2]  375     LDW (6,X),Y 
      00A62D C5               [ 4]  376     RET 
                                    377 
                                    378 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    379 ;    DCLZ ( d -- u )
                                    380 ;    double count leading zeros
                                    381 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002789                        382     _HEADER DCLZ,4,"DCLZ"
      00A62E CD 85                    1         .word LINK 
                           00278B     2         LINK=.
      00A630 18                       3         .byte 4  
      00A631 A6 3F CD 86              4         .ascii "DCLZ"
      002790                          5         DCLZ:
      00A635 A9               [ 1]  383     CLR A 
      00A636 CD 8C            [ 1]  384     LDW Y,X 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 146.
Hexadecimal [24-Bits]



      00A638 13 CD            [ 2]  385     LDW Y,(Y)
      00A63A 86 A9            [ 1]  386     JRMI DCLZ8 ; no leading zero 
      00A63C CD 8C            [ 1]  387     JREQ DCLZ4 ; >=16 
      002799                        388 DCLZ1: ; <16
      00A63E 20 58            [ 2]  389     SLLW Y
      00A63F 4C               [ 1]  390     INC A 
      00A63F CD 86            [ 2]  391     TNZW Y 
      00A641 C1 CD            [ 1]  392     JRMI DCLZ8
      00A643 85 81            [ 2]  393     JRA DCLZ1 
      0027A2                        394 DCLZ4: ; >=16 
      00A645 CD 84            [ 1]  395     LD A,#16 
      00A647 EF 00            [ 1]  396     LDW Y,X 
      00A649 24 CD 89         [ 2]  397     LDW Y,(2,Y)
      00A64C 7A CD            [ 1]  398     JRMI DCLZ8 
      00A64E 85 18            [ 1]  399     JRNE DCLZ1 
      00A650 A6 61            [ 1]  400     ADD A,#16
      0027AF                        401 DCLZ8: 
      00A652 CD 8F 14         [ 2]  402     ADDW X,#2 
      00A655 CD 86            [ 1]  403     CLRW Y 
      00A657 A9 CD            [ 1]  404     LD YL,A 
      00A659 8C               [ 2]  405     LDW (X),Y 
      00A65A 13               [ 4]  406     RET 
                                    407 
                                    408 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    409 ;   <2ROT ( d1 d2 d3 -- d3 d1 d2 )
                                    410 ;   rotate left doubles 
                                    411 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0027B8                        412     _HEADER NDROT,5,"<2ROT"
      00A65B CD 86                    1         .word LINK 
                           0027BA     2         LINK=.
      00A65D A9                       3         .byte 5  
      00A65E CD 8C 20 4F 54           4         .ascii "<2ROT"
      00A661                          5         NDROT:
                                    413 ; save d3 in temp 
      00A661 CD A5            [ 1]  414     LDW Y,X 
      00A663 7E CD            [ 2]  415     LDW Y,(Y)
      00A665 86 62 CD         [ 2]  416     LDW YTEMP,Y  ; d3 hi 
      00A668 88 4C            [ 1]  417     LDW Y,X 
      00A66A CD 85 18         [ 2]  418     LDW Y,(2,Y)
      00A66D A6 AC CD         [ 2]  419     LDW XTEMP,Y  ; d3 lo 
                                    420 ; put d2 in d1 slot 
      00A670 A5 AB            [ 1]  421     LDW Y,X 
      00A672 CD 88 4C         [ 2]  422     LDW Y,(4,Y) 
      00A675 CD               [ 2]  423     LDW (X),Y   ; d2 hi 
      00A676 86 E2            [ 1]  424     LDW Y,X 
      00A678 CD 85 18         [ 2]  425     LDW Y,(6,Y)
      00A67B A6 AC            [ 2]  426     LDW (2,X),Y ; d2 lo
                                    427 ; put d1 in d2 slot 
      00A67D 1C 00            [ 1]  428     LDW Y,X 
      00A67F 02 CD 85         [ 2]  429     LDW Y,(8,Y) 
      00A682 B4 CD            [ 2]  430     LDW (4,X),Y ; d1 hi 
      00A684 85 18            [ 1]  431     LDW Y,X 
      00A686 A6 8B CD         [ 2]  432     LDW Y,(10,Y)
      00A689 89 18            [ 2]  433     LDW (6,X),Y  ; d1 lo 
                                    434 ; put d3 in d1 slot 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 147.
Hexadecimal [24-Bits]



      00A68B 90 BE 26         [ 2]  435     LDW Y,YTEMP 
      00A68B CD 88            [ 2]  436     LDW (8,X),Y  ; d3 hi 
      00A68D 5D 1C 00         [ 2]  437     LDW Y,XTEMP 
      00A690 02 CD            [ 2]  438     LDW (10,X),Y  ; d3 lo 
      00A692 84               [ 4]  439     RET 
                                    440 
                                    441 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    442 ;   2ROT ( d1 d2 d3 -- d2 d3 d1 )
                                    443 ;   rotate right doubles 
                                    444 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0027F5                        445     _HEADER DROT,4,"2ROT"
      00A693 EF FF                    1         .word LINK 
                           0027F7     2         LINK=.
      00A695 FE                       3         .byte 4  
      00A696 CD 85 B4 CD              4         .ascii "2ROT"
      0027FC                          5         DROT:
                                    446 ; save d3 in temp 
      00A69A 85 26            [ 1]  447     LDW Y,X 
      00A69C A6 B5            [ 2]  448     LDW Y,(Y)
      00A69E CD 86 A9         [ 2]  449     LDW YTEMP,Y ; d3 hi 
      00A6A1 1C 00            [ 1]  450     LDW Y,X 
      00A6A3 02 CD 8C         [ 2]  451     LDW Y,(2,Y)
      00A6A6 13 CD 85         [ 2]  452     LDW XTEMP,Y ; d3 lo 
                                    453 ; put d1 in d3 slot 
      00A6A9 34 A6            [ 1]  454     LDW Y,X 
      00A6AB B5 EE 08         [ 2]  455     LDW Y,(8,Y)
      00A6AC FF               [ 2]  456     LDW (X),Y  ; d1 hi 
      00A6AC CD 85            [ 1]  457     LDW Y,X 
      00A6AE B4 CD 85         [ 2]  458     LDW Y,(10,Y) 
      00A6B1 B4 CD            [ 2]  459     LDW (2,X),Y ; d1 lo 
                                    460 ; put d2 in d1 slot 
      00A6B3 AF CF            [ 1]  461     LDW Y,X 
      00A6B5 90 EE 04         [ 2]  462     LDW Y,(4,Y) ; d2 hi 
      00A6B5 CD 85            [ 2]  463     LDW (8,X),Y 
      00A6B7 B4 CD            [ 1]  464     LDW Y,X 
      00A6B9 87 5F CD         [ 2]  465     LDW Y,(6,Y) ; d2 lo 
      00A6BC 85 51            [ 2]  466     LDW (10,X),Y 
                                    467 ; put d3 in d2 slot 
      00A6BE 81 A5 F6         [ 2]  468     LDW Y,YTEMP 
      00A6C1 04 44            [ 2]  469     LDW (4,X),Y 
      00A6C3 41 42 53         [ 2]  470     LDW Y,XTEMP 
      00A6C6 EF 06            [ 2]  471     LDW (6,X),Y 
      00A6C6 F6               [ 4]  472     RET 
                                    473 
                                    474 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    475 ;    D0= ( d -- 0|-1 )
                                    476 ;    check if double is 0 
                                    477 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002831                        478     _HEADER DZEQUAL,3,"D0="
      00A6C7 A4 80                    1         .word LINK 
                           002833     2         LINK=.
      00A6C9 27                       3         .byte 3  
      00A6CA 03 CD 89                 4         .ascii "D0="
      002837                          5         DZEQUAL:
      00A6CD 18               [ 1]  479     CLR A  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 148.
Hexadecimal [24-Bits]



      00A6CE 90 93            [ 1]  480     LDW Y,X 
      00A6CE 81 A6            [ 2]  481     LDW Y,(Y)
      00A6D0 C1 05            [ 1]  482     JRNE ZEQ1 
      00A6D2 44 53            [ 1]  483     LDW Y,X 
      00A6D4 49 47 4E         [ 2]  484     LDW Y,(2,Y)
      00A6D7 26 02            [ 1]  485     JRNE ZEQ1 
      00A6D7 A6 00            [ 1]  486     LD A,#0xFF
      002847                        487 ZEQ1:
      00A6D9 90 93 90         [ 2]  488     ADDW X,#CELLL 
      00A6DC FE               [ 1]  489     LD (X),A
      00A6DD 2A 02            [ 1]  490     LD (1,X),A
      00A6DF A6               [ 4]  491 	RET     
                                    492 
                                    493 
                                    494 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    495 ;   D= ( d1 d2 -- f )
                                    496 ;   d1==d2?
                                    497 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00284E                        498     _HEADER DEQUAL,2,"D="
      00A6E0 FF 33                    1         .word LINK 
                           002850     2         LINK=.
      00A6E1 02                       3         .byte 2  
      00A6E1 1D 00                    4         .ascii "D="
      002853                          5         DEQUAL:
      00A6E3 02 F7            [ 1]  499     LD A,#0 
      00A6E5 E7 01            [ 1]  500     LDW Y,X 
      00A6E7 81 A6            [ 2]  501     LDW Y,(Y)
      00A6E9 D1 06            [ 2]  502     CPW Y,(4,X)
      00A6EB 44 53            [ 1]  503     JRNE DEQU4 
      00A6ED 2F 4D            [ 1]  504     LDW Y,X 
      00A6EF 4F 44 02         [ 2]  505     LDW Y,(2,Y)
      00A6F1 E3 06            [ 2]  506     CPW Y,(6,X)
      00A6F1 90 93            [ 1]  507     JRNE DEQU4 
      00A6F3 FE BF            [ 1]  508     LD A,#0XFF
      002868                        509 DEQU4:
      00A6F5 26 93 89         [ 2]  510     ADDW X,#6
      00A6F8 90               [ 1]  511     LD (X),A 
      00A6F9 89 EE            [ 1]  512     LD (1,X),A 
      00A6FB 02               [ 4]  513     RET 
                                    514 
                                    515 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    516 ;   D> ( d1 d2 -- f )
                                    517 ;   d1>d2?
                                    518 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00286F                        519     _HEADER DGREAT,2,"D>"
      00A6FC 90 BE                    1         .word LINK 
                           002871     2         LINK=.
      00A6FE 26                       3         .byte 2  
      00A6FF 65 BF                    4         .ascii "D>"
      002874                          5         DGREAT:
      00A701 24 93 90         [ 4]  520     CALL DSWAP 
      00A704 85 90 EE         [ 2]  521     JP DLESS 
                                    522 
                                    523 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    524 ;   D< ( d1 d2 -- f )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 149.
Hexadecimal [24-Bits]



                                    525 ;   d1<d2? 
                                    526 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00287A                        527     _HEADER DLESS,2,"D<"
      00A707 04 A6                    1         .word LINK 
                           00287C     2         LINK=.
      00A709 10                       3         .byte 2  
      00A70A 90 58                    4         .ascii "D<"
      00A70C                          5         DLESS:
      00A70C 59 25 04         [ 4]  528     CALL DSUB
      00A70F B3 26 25         [ 4]  529     CALL ZERO
      00A712 05 07 FC         [ 4]  530     CALL NROT  
      00A713 CD 28 9A         [ 4]  531     CALL DZLESS 
      00288B                        532     _QBRAN DLESS4
      00A713 72 B0 00         [ 4]    1     CALL QBRAN
      00A716 26 98                    2     .word DLESS4
      00A718 CD 08 75         [ 4]  533     CALL INVER  
      002893                        534 DLESS4:
      00A718 8C               [ 4]  535     RET
                                    536 
                                    537 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    538 ;  D0< ( d -- f )
                                    539 ;  d<0? 
                                    540 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002894                        541     _HEADER DZLESS,3,"D0<"
      00A719 90 59                    1         .word LINK 
                           002896     2         LINK=.
      00A71B 4A                       3         .byte 3  
      00A71C 26 EE 3C                 4         .ascii "D0<"
      00A71E                          5         DZLESS:
      00A71E BF 26            [ 1]  542     LD A,#0 
      00A720 85 EF            [ 1]  543     LDW Y,X 
      00A722 02 90            [ 2]  544     LDW Y,(Y)
      00A724 BE 24            [ 1]  545     JRPL DZLESS1 
      00A726 FF 90            [ 1]  546     LD A,#0XFF 
      0028A4                        547 DZLESS1:
      00A728 BE 26 EF         [ 2]  548     ADDW X,#CELLL 
      00A72B 04               [ 1]  549     LD (X),A 
      00A72C 81 A6            [ 1]  550     LD (1,X),A    
      00A72E EA               [ 4]  551     RET 
                                    552 
                                    553 
                                    554 
                                    555 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    556 ;   2>R ( d -- R: d )
                                    557 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0028AB                        558     _HEADER DTOR,3,"2>R"
      00A72F 02 44                    1         .word LINK 
                           0028AD     2         LINK=.
      00A731 23                       3         .byte 3  
      00A732 32 3E 52                 4         .ascii "2>R"
      0028B1                          5         DTOR:
      00A732 CD 87            [ 2]  559     POPW Y 
      00A734 5F CD 85         [ 2]  560     LDW YTEMP,Y 
      00A737 63 CD            [ 1]  561     LDW Y,X 
      00A739 A6 F1 CD         [ 2]  562     LDW Y,(2,Y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 150.
Hexadecimal [24-Bits]



      00A73C 88 5D            [ 2]  563     PUSHW Y   ; d low 
      00A73E CD 8E            [ 1]  564     LDW Y,X 
      00A740 3D CD            [ 2]  565     LDW Y,(Y)
      00A742 8E 89            [ 2]  566     PUSHW Y   ; d hi 
      00A744 81 A7 2F         [ 2]  567     ADDW X,#4  
      00A747 03 44 23         [ 5]  568     JP [YTEMP]
                                    569 
                                    570 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    571 ;  2R> ( -- d ) R: d --      
                                    572 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0028C9                        573     _HEADER DRFROM,3,"2R>"
      00A74A 53 AD                    1         .word LINK 
                           0028CB     2         LINK=.
      00A74B 03                       3         .byte 3  
      00A74B CD A7 32                 4         .ascii "2R>"
      0028CF                          5         DRFROM:
      00A74E CD 88            [ 2]  574     POPW Y      ; d hi 
      00A750 A7 CD A8         [ 2]  575     LDW YTEMP,Y 
      00A753 B7 CD 85         [ 2]  576     SUBW X,#4
      00A756 18 A7            [ 2]  577     POPW Y       ; d hi 
      00A758 4B               [ 2]  578     LDW (X),Y 
      00A759 CD 86            [ 2]  579     POPW Y       ; d low  
      00A75B 8F 81            [ 2]  580     LDW (2,X),Y 
      00A75D A7 47 02         [ 5]  581     JP [YTEMP]
                                    582     
                                    583 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    584 ;   2R@ ( -- d )
                                    585 ;   fecth a double from RSTACK
                                    586 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0028E1                        587     _HEADER DRAT,3,"2R@"
      00A760 44 2E                    1         .word LINK 
                           0028E3     2         LINK=.
      00A762 03                       3         .byte 3  
      00A762 CD 8F B5                 4         .ascii "2R@"
      0028E7                          5         DRAT:
      00A765 CD A6            [ 2]  588     POPW Y 
      00A767 D7 CD 86         [ 2]  589     LDW YTEMP,Y 
      00A76A 62 CD 85         [ 2]  590     SUBW X,#4 
      00A76D C5 CD            [ 2]  591     LDW Y,(1,SP)
      00A76F 85               [ 2]  592     LDW (X),Y 
      00A770 18 A7            [ 2]  593     LDW Y,(3,SP)
      00A772 76 CD            [ 2]  594     LDW (2,X),Y 
      00A774 89 18 26         [ 5]  595     JP [YTEMP]
                                    596 
                                    597 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    598 ;  2VARIABLE <name> 
                                    599 ;  create a double variable 
                                    600 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00A776                        601     _HEADER DVARIA,9,"2VARIABLE"
      00A776 CD 8E                    1         .word LINK 
                           0028FB     2         LINK=.
      00A778 79                       3         .byte 9  
      00A779 CD A7 4B CD 85 B4 CD     4         .ascii "2VARIABLE"
             85 18
      002905                          5         DVARIA:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 151.
Hexadecimal [24-Bits]



      00A782 A7 8C CD         [ 4]  602         CALL HERE
      00A785 84 EF 00         [ 4]  603         CALL DUPP
      00290B                        604         _DOLIT 4  
      00A788 2D CD 8E         [ 4]    1     CALL DOLIT 
      00A78B 89 04                    2     .word 4 
      00A78C CD 08 3C         [ 4]  605         CALL PLUS 
      00A78C CD 8E DE         [ 4]  606         CALL VPP 
      00A78F CD 8F DF         [ 4]  607         CALL STORE
      00A792 81 A7 5F         [ 4]  608         CALL CREAT
      00A795 04 55 44         [ 4]  609         CALL DUPP
      00A798 53 2A 20         [ 4]  610         CALL COMMA
      00A79A CD 0B FF         [ 4]  611         CALL ZERO
      00A79A CD 86 62         [ 4]  612         CALL OVER 
      00A79D CD 86 A9         [ 4]  613         CALL STORE 
      00A7A0 CD 85 C5         [ 4]  614         CALL ZERO 
      00A7A3 CD 8B 48         [ 4]  615         CALL SWAPP 
      00A7A6 CD 88 5D         [ 4]  616         CALL STORE
      00A7A9 CD 85 B4         [ 4]  617         CALL FMOVE ; move definition to FLASH
      00A7AC CD 8B 48         [ 4]  618         CALL QDUP 
      00A7AF 1C 00 02         [ 4]  619         CALL QBRAN 
      00A7B2 CD 88                  620         .word SET_RAMLAST   
      00A7B4 BC 81 A7         [ 4]  621         call UPDATVP  ; don't update if variable kept in RAM.
      00A7B7 95 03 44         [ 4]  622         CALL UPDATPTR
      00A7BA 53               [ 4]  623         RET         
                                    624 
                                    625 
                                    626 
                                    627 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    628 ;  2LITERAL ( d -- )
                                    629 ;  compile double literal 
                                    630 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002946                        631     _HEADER DLITER,IMEDD+8,"2LITERAL"
      00A7BB 2A FB                    1         .word LINK 
                           002948     2         LINK=.
      00A7BC 88                       3         .byte IMEDD+8  
      00A7BC CD 86 62 CD A6 D7 CD     4         .ascii "2LITERAL"
             88
      002951                          5         DLITER:
      00A7C4 7C CD A6         [ 4]  632     CALL COMPI 
      00A7C7 C6 CD                  633     .word do2lit 
      00A7C9 85 B4 CD         [ 4]  634     CALL COMMA 
      00A7CC A7 9A CD         [ 2]  635     JP   COMMA 
                                    636 
                                    637 
                                    638 ; runtime for 2LITERAL 
      00295C                        639 do2lit:
      00A7CF 88 5D CD         [ 2]  640     SUBW X,#4 
      00A7D2 85 18            [ 2]  641     LDW Y,(1,SP)
      00A7D4 A7 D9            [ 2]  642     LDW Y,(Y)
      00A7D6 CD               [ 2]  643     LDW (X),Y 
      00A7D7 89 18            [ 2]  644     LDW Y,(1,SP)
      00A7D9 90 EE 02         [ 2]  645     LDW Y,(2,Y)
      00A7D9 81 A7            [ 2]  646     LDW (2,X),Y 
      00A7DB B8 05            [ 2]  647     POPW Y 
      00A7DD 32 53 57         [ 2]  648     JP (4,Y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 152.
Hexadecimal [24-Bits]



                                    649 
                                    650 
                                    651 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    652 ;   2OVER ( d1 d2 -- d1 d2 d1 )
                                    653 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002970                        654     _HEADER DOVER,5,"2OVER"
      00A7E0 41 50                    1         .word LINK 
                           002972     2         LINK=.
      00A7E2 05                       3         .byte 5  
      00A7E2 90 93 90 FE 90           4         .ascii "2OVER"
      002978                          5         DOVER:
      00A7E7 BF 26            [ 1]  655     LDW Y,X 
      00A7E9 90 93 90         [ 2]  656     SUBW X,#4 
      00A7EC EE 02            [ 2]  657     PUSHW Y 
      00A7EE 90 BF 24         [ 2]  658     LDW Y,(4,Y)  ; d1 hi 
      00A7F1 90               [ 2]  659     LDW (X),Y 
      00A7F2 93 90            [ 2]  660     POPW Y 
      00A7F4 EE 04 FF         [ 2]  661     LDW Y,(6,Y)  ;d1 lo 
      00A7F7 90 93            [ 2]  662     LDW (2,X),Y 
      00A7F9 90               [ 4]  663     RET 
                                    664 
                                    665 
                                    666 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    667 ;   D2/ ( d -- d/2 )
                                    668 ;   divide double by 2 
                                    669 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00298B                        670     _HEADER D2SLASH,3,"D2/"
      00A7FA EE 06                    1         .word LINK 
                           00298D     2         LINK=.
      00A7FC EF                       3         .byte 3  
      00A7FD 02 90 BE                 4         .ascii "D2/"
      002991                          5         D2SLASH:
      00A800 26 EF            [ 1]  671     LDW Y,X 
      00A802 04 90            [ 2]  672     LDW Y,(Y)
      00A804 BE 24            [ 2]  673     SRAW Y 
      00A806 EF               [ 2]  674     LDW (X),Y 
      00A807 06 81            [ 1]  675     LDW Y,X 
      00A809 A7 DC 04         [ 2]  676     LDW Y,(2,Y)
      00A80C 44 43            [ 2]  677     RRCW Y 
      00A80E 4C 5A            [ 2]  678     LDW (2,X),Y 
      00A810 81               [ 4]  679     RET
                                    680 
                                    681 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    682 ;  D2* ( d -- d*2 )
                                    683 ;  multiply double by 2 
                                    684 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0029A2                        685     _HEADER D2STAR,3,"D2*"
      00A810 4F 90                    1         .word LINK 
                           0029A4     2         LINK=.
      00A812 93                       3         .byte 3  
      00A813 90 FE 2B                 4         .ascii "D2*"
      0029A8                          5         D2STAR:
      00A816 18 27            [ 1]  686     LDW Y,X 
      00A818 09 EE 02         [ 2]  687     LDW Y,(2,Y)
      00A819 98               [ 1]  688     RCF 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 153.
Hexadecimal [24-Bits]



      00A819 90 58            [ 2]  689     RLCW Y 
      00A81B 4C 90            [ 2]  690     LDW (2,X),Y 
      00A81D 5D 2B            [ 1]  691     LDW Y,X 
      00A81F 0F 20            [ 2]  692     LDW Y,(Y)
      00A821 F7 59            [ 2]  693     RLCW Y 
      00A822 FF               [ 2]  694     LDW (X),Y 
      00A822 A6               [ 4]  695     RET 
                                    696 
                                    697 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    698 ;   DLSHIFT ( d n -- d )
                                    699 ;   left shift double 
                                    700 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0029BA                        701     _HEADER DLSHIFT,7,"DLSHIFT"
      00A823 10 90                    1         .word LINK 
                           0029BC     2         LINK=.
      00A825 93                       3         .byte 7  
      00A826 90 EE 02 2B 04 26 EC     4         .ascii "DLSHIFT"
      0029C4                          5         DLSHIFT:
      00A82D AB 10            [ 1]  702     LD A,(1,X) ; shift count 
      00A82F A4 1F            [ 1]  703     AND A,#31
      00A82F 1C 00 02         [ 2]  704     ADDW X,#CELLL 
      00A832 90 5F            [ 1]  705     LDW Y,X 
      00A834 90 97            [ 2]  706     LDW Y,(Y)
      00A836 FF 81 A8         [ 2]  707     LDW YTEMP,Y  ; d hi 
      00A839 0B 05            [ 1]  708     LDW Y,X 
      00A83B 3C 32 52         [ 2]  709     LDW Y,(2,Y)  ; d low 
      0029D7                        710 DLSHIFT1:
      00A83E 4F               [ 1]  711     TNZ A 
      00A83F 54 12            [ 1]  712     JREQ DLSHIFT2 
      00A840 98               [ 1]  713     RCF 
      00A840 90 93            [ 2]  714     RLCW Y 
      00A842 90 FE            [ 2]  715     PUSHW Y 
      00A844 90 BF 26         [ 2]  716     LDW Y,YTEMP 
      00A847 90 93            [ 2]  717     RLCW Y 
      00A849 90 EE 02         [ 2]  718     LDW YTEMP,Y 
      00A84C 90 BF            [ 2]  719     POPW Y 
      00A84E 24               [ 1]  720     DEC A 
      00A84F 90 93            [ 2]  721     JRA DLSHIFT1 
      0029EC                        722 DLSHIFT2:
      00A851 90 EE            [ 2]  723     LDW (2,X),Y 
      00A853 04 FF 90         [ 2]  724     LDW Y,YTEMP 
      00A856 93               [ 2]  725     LDW (X),Y 
      00A857 90               [ 4]  726     RET 
                                    727 
                                    728 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    729 ;  DRSHIFT ( d n -- d )
                                    730 ;  shift right n bits 
                                    731 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0029F3                        732     _HEADER DRSHIFT,7,"DRSHIFT"
      00A858 EE 06                    1         .word LINK 
                           0029F5     2         LINK=.
      00A85A EF                       3         .byte 7  
      00A85B 02 90 93 90 EE 08 EF     4         .ascii "DRSHIFT"
      0029FD                          5         DRSHIFT:
      00A862 04 90            [ 1]  733     LD A,(1,X)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 154.
Hexadecimal [24-Bits]



      00A864 93 90            [ 1]  734     AND A,#31
      00A866 EE 0A EF         [ 2]  735     ADDW X,#2 
      002A04                        736 DRSHIFT1:
      00A869 06               [ 1]  737     TNZ A 
      00A86A 90 BE            [ 1]  738     JREQ DRSHIFT2 
      00A86C 26 EF            [ 1]  739     LDW Y,X 
      00A86E 08 90            [ 2]  740     LDW Y,(Y)
      00A870 BE 24            [ 2]  741     SRLW Y 
      00A872 EF               [ 2]  742     LDW (X),Y 
      00A873 0A 81            [ 1]  743     LDW Y,X 
      00A875 A8 3A 04         [ 2]  744     LDW Y,(2,Y)
      00A878 32 52            [ 2]  745     RRCW Y 
      00A87A 4F 54            [ 2]  746     LDW (2,X),Y 
      00A87C 4A               [ 1]  747     DEC A
      00A87C 90 93            [ 2]  748     JRA DRSHIFT1  
      002A1A                        749 DRSHIFT2:
      00A87E 90               [ 4]  750     RET 
                                    751 
                                    752 
                                    753 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    754 ;   D* ( d1 d2 -- d3 )
                                    755 ;   double product 
                                    756 ;   d3 = d1 * d2
                                    757 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002A1B                        758     _HEADER DSTAR,2,"D*"
      00A87F FE 90                    1         .word LINK 
                           002A1D     2         LINK=.
      00A881 BF                       3         .byte 2  
      00A882 26 90                    4         .ascii "D*"
      002A20                          5         DSTAR:
      00A884 93 90 EE         [ 4]  759     CALL DUPP 
      00A887 02 90 BF         [ 4]  760     CALL ZLESS  
      00A88A 24 90 93         [ 4]  761     CALL TOR    ; R: d2sign 
      00A88D 90 EE 08         [ 4]  762     CALL DABS   
      00A890 FF 90 93         [ 4]  763     CALL RFROM 
      00A893 90 EE 0A         [ 4]  764     CALL NROT  ; d1 d2s ud2
      00A896 EF 02 90         [ 4]  765     CALL DTOR  ; d1 d2s R: ud2  
      00A899 93 90 EE         [ 4]  766     CALL TOR   ; d1 R: ud2 d2s   
      00A89C 04 EF 08         [ 4]  767     CALL DUPP 
      00A89F 90 93 90         [ 4]  768     CALL ZLESS 
      00A8A2 EE 06 EF         [ 4]  769     CALL RFROM 
      00A8A5 0A 90 BE         [ 4]  770     CALL XORR   
      00A8A8 26 EF 04         [ 4]  771     CALL TOR   ; d1 R: ud2 prod_sign  
      00A8AB 90 BE 24         [ 4]  772     CALL DABS ; ud1 R: ud2 ps  
      00A8AE EF 06 81         [ 4]  773     CALL RFROM  
      00A8B1 A8 77 03         [ 4]  774     CALL NROT   ; ps ud1 
      00A8B4 44 30 3D         [ 4]  775     CALL DDUP   ; ps ud1 ud1  
      00A8B7 CD 05 34         [ 4]  776     CALL RFROM  ; ps ud1 ud1 ud2hi 
      00A8B7 4F 90 93         [ 4]  777     CALL DSSTAR ; ps ud1 dprodhi 
                                    778 ; shift partial product 16 bits left 
      002A59                        779     _DROP   ; drop overflow 
      00A8BA 90 FE 26         [ 2]    1     ADDW X,#CELLL  
      00A8BD 09 90 93         [ 4]  780     CALL ZERO   ; ps ud1 prodhi 
      00A8C0 90 EE 02         [ 4]  781     CALL SWAPP  
      00A8C3 26 02 A6         [ 4]  782     CALL DSWAP  ; ps dprodhi ud1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 155.
Hexadecimal [24-Bits]



      00A8C6 FF 05 34         [ 4]  783     CALL RFROM  ; ps dprodhi ud1 ud2lo
      00A8C7 CD 27 3C         [ 4]  784     CALL DSSTAR ; ps  dprodhi dprodlo 
      00A8C7 1C 00 02         [ 4]  785     CALL DPLUS
      00A8CA F7 E7 01         [ 4]  786     CALL ROT    ; dprod ps 
      002A71                        787     _QBRAN DDSTAR3 
      00A8CD 81 A8 B3         [ 4]    1     CALL QBRAN
      00A8D0 02 44                    2     .word DDSTAR3
      00A8D2 3D 08 98         [ 4]  788     CALL DNEGA 
      00A8D3                        789 DDSTAR3:  
      00A8D3 A6               [ 4]  790     RET 
                                    791 
                                    792 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    793 ;  UD/MOD ( ud1 ud2 -- dr udq )
                                    794 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002A7A                        795     _HEADER UDSLMOD,6,"UD/MOD"
      00A8D4 00 90                    1         .word LINK 
                           002A7C     2         LINK=.
      00A8D6 93                       3         .byte 6  
      00A8D7 90 FE E3 04 26 0B        4         .ascii "UD/MOD"
      002A83                          5         UDSLMOD:
                                    796 ; unsigned double division 
      00A8DD 90 93 90         [ 4]  797     CALL ZERO 
      00A8E0 EE 02 E3         [ 4]  798     CALL ZERO
      00A8E3 06 26 02         [ 4]  799     CALL DTOR ; quotient  R: qlo qhi 
      00A8E6 A6 FF 78         [ 4]  800     CALL DOVER 
      00A8E8 CD 27 90         [ 4]  801     CALL DCLZ ; n2, dividend leading zeros  
      00A8E8 1C 00 06         [ 4]  802     CALL TOR 
      00A8EB F7 E7 01         [ 4]  803     CALL DDUP    
      00A8EE 81 A8 D0         [ 4]  804     CALL DCLZ  ; n1, divisor leading zeros
      00A8F1 02 44 3E         [ 4]  805     CALL RFROM ; n1 n2 
      00A8F4 CD 08 D2         [ 4]  806     CALL SUBB  ; loop count 
      00A8F4 CD A7 E2         [ 4]  807     CALL DUPP
      00A8F7 CC A8 FF         [ 4]  808     CALL DTOR  ; ud1 ud2 R: qlo qhi cntr cntr 
      00A8FA A8 F1 02         [ 4]  809     CALL RAT    
      00A8FD 44 3C 50         [ 4]  810     CALL ZLESS 
      00A8FF                        811     _TBRAN UDSLA7 ; quotient is null 
      00A8FF CD AC 26         [ 4]    1     CALL TBRAN 
      00A902 CD 8C                    2     .word UDSLA7 
      00A904 7F CD 88         [ 4]  812     CALL RAT 
      00A907 7C CD A9         [ 4]  813     CALL DLSHIFT ; align divisor with dividend 
      002AB8                        814 UDSLA3: ; division loop -- dividend divisor  
      00A90A 1A CD            [ 1]  815     CLRW Y 
      00A90C 85 18            [ 2]  816     PUSHW Y  
      00A90E A9 13 CD         [ 4]  817     CALL DOVER 
      00A911 88 F5 78         [ 4]  818     CALL DOVER 
      00A913 CD 28 7F         [ 4]  819     CALL DLESS 
      002AC5                        820     _TBRAN UDSLA4 
      00A913 81 A8 FC         [ 4]    1     CALL TBRAN 
      00A916 03 44                    2     .word UDSLA4 
      00A918 30 3C            [ 2]  821     POPW Y 
      00A91A 72 A9 00 01      [ 2]  822     ADDW Y,#1 
      00A91A A6 00            [ 2]  823     PUSHW Y    ; quotiend least bit 
      00A91C 90 93 90         [ 4]  824     CALL DDUP  ; dividend divisor divisor 
      00A91F FE 2A 02         [ 4]  825     CALL DTOR  
      00A922 A6 FF A6         [ 4]  826     CALL DSUB  ; dividend-divisor 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 156.
Hexadecimal [24-Bits]



      00A924 CD 28 CF         [ 4]  827     CALL DRFROM  ; dividend- divisor  
      002ADE                        828 UDSLA4: ; shift quotient and add 1 bit 
      00A924 1C 00            [ 2]  829     POPW Y 
      00A926 02 F7 E7         [ 2]  830     LDW YTEMP,Y 
      00A929 01 81            [ 2]  831     LDW Y,(7,SP) ; quotient low 
      00A92B A9               [ 1]  832     RCF 
      00A92C 16 03            [ 2]  833     RLCW Y
      00A92E 32 3E            [ 2]  834     LDW (7,SP),Y 
      00A930 52 05            [ 2]  835     LDW Y,(5,SP) ; quotient hi 
      00A931 90 59            [ 2]  836     RLCW Y 
      00A931 90 85            [ 2]  837     LDW (5,SP),Y 
      00A933 90 BF            [ 2]  838     LDW Y,(7,SP) 
      00A935 26 90 93 90      [ 2]  839     ADDW Y,YTEMP
      00A939 EE 02            [ 2]  840     LDW (7,SP),Y 
      00A93B 90 89            [ 2]  841     LDW Y,(1,SP) ; loop counter 
      00A93D 90 93            [ 2]  842     TNZW Y 
      00A93F 90 FE            [ 1]  843     JREQ UDSLA8
      00A941 90 89 1C 00      [ 2]  844     SUBW Y,#1  
      00A945 04 92            [ 2]  845     LDW (1,SP),Y  
                                    846 ; shift dividend left 1 bit      
      00A947 CC 26 A9         [ 4]  847     CALL DSWAP 
      00A94A 2D 03 32         [ 4]  848     CALL D2STAR 
      00A94D 52 3E 62         [ 4]  849     CALL DSWAP 
      00A94F 20 A9            [ 2]  850     JRA UDSLA3 
      002B0F                        851 UDSLA7:
      00A94F 90 85 90         [ 4]  852     CALL ZERO 
      002B12                        853     _DOLIT 1 
      00A952 BF 26 1D         [ 4]    1     CALL DOLIT 
      00A955 00 04                    2     .word 1 
      00A957 90 85 FF         [ 4]  854     CALL NRSTO ; R: 0 0 0 cntr    
      002B1A                        855 UDSLA8:
      00A95A 90 85 EF         [ 2]  856     ADDW X,#4 ; drop divisor
      00A95D 02 92 CC         [ 4]  857     CALL RFROM  
      002B20                        858     _DROP ; drop cntr 
      00A960 26 A9 4B         [ 2]    1     ADDW X,#CELLL  
      00A963 03 32 52         [ 4]  859     CALL RFROM   ; shift count
      00A966 40 29 FD         [ 4]  860     CALL DRSHIFT 
                                    861     ; quotient replace dividend 
      00A967 CD 28 CF         [ 4]  862     CALL DRFROM  ; quotient 
      00A967 90               [ 4]  863     RET 
                                    864 
                                    865 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    866 ;   D/MOD  ( d1 d2 -- dr dq )
                                    867 ;   double division dq=d1/d2
                                    868 ;   dr remainder double 
                                    869 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002B2D                        870     _HEADER DDSLMOD,5,"D/MOD"  
      00A968 85 90                    1         .word LINK 
                           002B2F     2         LINK=.
      00A96A BF                       3         .byte 5  
      00A96B 26 1D 00 04 16           4         .ascii "D/MOD"
      002B35                          5         DDSLMOD:
      00A970 01 FF 16         [ 4]  871     CALL DSIGN 
      00A973 03 EF 02         [ 4]  872     CALL TOR   ; R: divisor sign 
      00A976 92 CC 26         [ 4]  873     CALL DABS 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 157.
Hexadecimal [24-Bits]



      00A979 A9 63 09         [ 4]  874     CALL DSWAP 
      00A97C 32 56 41         [ 4]  875     CALL DSIGN ; dividend sign 
      00A97F 52 49 41         [ 4]  876     CALL RFROM 
      00A982 42 4C 45         [ 4]  877     CALL XORR  ; quotient sign
      00A985 CD 05 E2         [ 4]  878     CALL TOR   ; 
      00A985 CD 8D 5C         [ 4]  879     CALL DABS  ; d2 ud1 R: sign 
      00A988 CD 86 99         [ 4]  880     CALL DSWAP  ; ud1 ud2 
      00A98B CD 84 EF         [ 4]  881     CALL UDSLMOD ; ud1/ud2 -- dr dq  
      00A98E 00 04            [ 2]  882     POPW Y ; sign 
      00A990 CD 88            [ 2]  883     TNZW Y 
      00A992 BC CD            [ 1]  884     JRPL DSLA9 
      00A994 87 F0 CD         [ 4]  885     CALL DNEGA ; remainder quotient 
      002B5F                        886 DSLA9: 
      00A997 85               [ 4]  887     RET 
                                    888 
                                    889 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    890 ;   D/  ( d1 d2 -- dq )
                                    891 ;   division double by double 
                                    892 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002B60                        893     _HEADER DSLASH,2,"D/"
      00A998 51 CD                    1         .word LINK 
                           002B62     2         LINK=.
      00A99A 99                       3         .byte 2  
      00A99B 2D CD                    4         .ascii "D/"
      002B65                          5         DSLASH:
      00A99D 86 99 CD         [ 4]  894     CALL DDSLMOD
      00A9A0 95 A0 CD         [ 4]  895     CALL DSWAP
      002B6B                        896     _DDROP 
      00A9A3 8C 7F CD         [ 2]    1    ADDW X,#2*CELLL 
      00A9A6 86               [ 4]  897     RET 
                                    898 
                                    899 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    900 ;   D+ ( d1 d2 -- d3 )
                                    901 ;   add 2 doubles 
                                    902 ;   d3=d1+d2 
                                    903 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002B6F                        904     _HEADER DPLUS,2,"D+"
      00A9A7 C1 CD                    1         .word LINK 
                           002B71     2         LINK=.
      00A9A9 85                       3         .byte 2  
      00A9AA 51 CD                    4         .ascii "D+"
      002B74                          5         DPLUS:
      00A9AC 8C 7F            [ 1]  905     LDW Y,X 
      00A9AE CD 86            [ 2]  906     LDW Y,(Y)
      00A9B0 A9 CD 85         [ 2]  907     LDW YTEMP,Y ; d2 hi 
      00A9B3 51 CD            [ 1]  908     LDW Y,X 
      00A9B5 A2 A2 CD         [ 2]  909     LDW Y,(2,Y)
      00A9B8 88 4C CD         [ 2]  910     LDW XTEMP,Y ; d2 lo 
      00A9BB 85 18 99         [ 2]  911     ADDW X,#4 
      00A9BE 7A CD            [ 1]  912     LDW Y,X 
      00A9C0 9D 4A CD         [ 2]  913     LDW Y,(2,Y) ; d1 lo
      00A9C3 A3 36 81 A9      [ 2]  914     ADDW Y,XTEMP
      00A9C7 7B 88            [ 2]  915     LDW (2,X),Y 
      00A9C9 32 4C            [ 1]  916     LDW Y,X 
      00A9CB 49 54            [ 2]  917     LDW Y,(Y) ; d1 hi 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 158.
Hexadecimal [24-Bits]



      00A9CD 45 52            [ 1]  918     JRNC DPLUS1 
      00A9CF 41 4C 00 01      [ 2]  919     ADDW Y,#1 
      00A9D1                        920 DPLUS1: 
      00A9D1 CD 95 E5 A9      [ 2]  921     ADDW Y,YTEMP 
      00A9D5 DC               [ 2]  922     LDW (X),Y 
      00A9D6 CD               [ 4]  923     RET 
                                    924 
                                    925 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    926 ;   D- ( d1 d2 -- d3 )
                                    927 ;   d3=d1-d2 
                                    928 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002BA1                        929     _HEADER DSUB,2,"D-"
      00A9D7 95 A0                    1         .word LINK 
                           002BA3     2         LINK=.
      00A9D9 CC                       3         .byte 2  
      00A9DA 95 A0                    4         .ascii "D-"
      00A9DC                          5         DSUB:
      00A9DC 1D 00            [ 1]  930     LDW Y,X 
      00A9DE 04 16            [ 2]  931     LDW Y,(Y)
      00A9E0 01 90 FE         [ 2]  932     LDW YTEMP,Y ; d2 hi 
      00A9E3 FF 16            [ 1]  933     LDW Y,X 
      00A9E5 01 90 EE         [ 2]  934     LDW Y,(2,Y)
      00A9E8 02 EF 02         [ 2]  935     LDW XTEMP,Y ; d2 lo 
      00A9EB 90 85 90         [ 2]  936     ADDW X,#4 
      00A9EE EC 04            [ 1]  937     LDW Y,X 
      00A9F0 A9 C8 05         [ 2]  938     LDW Y,(2,Y) ; d1 lo
      00A9F3 32 4F 56 45      [ 2]  939     SUBW Y,XTEMP
      00A9F7 52 02            [ 2]  940     LDW (2,X),Y 
      00A9F8 90 93            [ 1]  941     LDW Y,X 
      00A9F8 90 93            [ 2]  942     LDW Y,(Y) ; d1 hi 
      00A9FA 1D 00            [ 1]  943     JRNC DSUB1 
      00A9FC 04 90 89 90      [ 2]  944     SUBW Y,#1 
      002BCD                        945 DSUB1: 
      00AA00 EE 04 FF 90      [ 2]  946     SUBW Y,YTEMP 
      00AA04 85               [ 2]  947     LDW (X),Y 
      00AA05 90               [ 4]  948     RET 
                                    949 
                                    950 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 159.
Hexadecimal [24-Bits]



                                   4565 .endif 
                           000001  4566 .if WANT_FLOAT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 160.
Hexadecimal [24-Bits]



                                   4567         .include "float.asm"
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 161.
Hexadecimal [24-Bits]



                                     55 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002BD3                         56     _HEADER FVER,9,"FLOAT-VER"
      00AA06 EE 06                    1         .word LINK 
                           002BD5     2         LINK=.
      00AA08 EF                       3         .byte 9  
      00AA09 02 81 A9 F2 03 44 32     4         .ascii "FLOAT-VER"
             2F 52
      00AA11                          5         FVER:
      00AA11 90 93 90         [ 4]   57     CALL CR 
      00AA14 FE 90 57         [ 4]   58     CALL DOTQP 
      00AA17 FF                      59     .byte  17 
      00AA18 90 93 90 EE 02 90 56    60     .ascii "float32 library, "
             EF 02 81 AA 0D 03 44
             32 2A 20
      00AA28 CD 1A F5         [ 4]   61     CALL PRT_LICENCE 
      00AA28 90 93 90         [ 4]   62     CALL COPYRIGHT 
      002BFD                         63     _DOLIT FLOAT_MAJOR     
      00AA2B EE 02 98         [ 4]    1     CALL DOLIT 
      00AA2E 90 59                    2     .word FLOAT_MAJOR 
      002C02                         64     _DOLIT FLOAT_MINOR 
      00AA30 EF 02 90         [ 4]    1     CALL DOLIT 
      00AA33 93 90                    2     .word FLOAT_MINOR 
      00AA35 FE 90 59         [ 2]   65     JP PRINT_VERSION 
                                     66 
                                     67 
                                     68 ;-------------------------
                                     69 ;    FPSW ( -- a )
                                     70 ;    floating state variable
                                     71 ;    bit 0 zero flag 
                                     72 ;    bit 1 negative flag 
                                     73 ;    bit 2 overflow/error flag 
                                     74 ;---------------------------
      002C0A                         75     _HEADER FPSW,4,"FPSW"
      00AA38 FF 81                    1         .word LINK 
                           002C0C     2         LINK=.
      00AA3A AA                       3         .byte 4  
      00AA3B 24 07 44 4C              4         .ascii "FPSW"
      002C11                          5         FPSW:
      00AA3F 53 48 49 46      [ 2]   76 	LDW Y,#UFPSW  
      00AA43 54 00 02         [ 2]   77 	SUBW X,#2
      00AA44 FF               [ 2]   78     LDW (X),Y
      00AA44 E6               [ 4]   79     RET
                                     80 
                                     81 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     82 ;   FRESET ( -- )
                                     83 ;   reset FPSW variable 
                                     84 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
      002C1A                         85     _HEADER FRESET,6,"FRESET"
      00AA45 01 A4                    1         .word LINK 
                           002C1C     2         LINK=.
      00AA47 1F                       3         .byte 6  
      00AA48 1C 00 02 90 93 90        4         .ascii "FRESET"
      002C23                          5         FRESET:
      00AA4E FE 90 BF         [ 4]   86     CALL ZERO  
      00AA51 26 90 93         [ 4]   87     CALL FPSW 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 162.
Hexadecimal [24-Bits]



      00AA54 90 EE 02         [ 4]   88     CALL STORE 
      00AA57 81               [ 4]   89     RET 
                                     90 
                                     91 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     92 ;   FINIT ( -- )
                                     93 ;   initialize floating point 
                                     94 ;   library 
                                     95 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002C2D                         96     _HEADER FINIT,5,"FINIT"
      00AA57 4D 27                    1         .word LINK 
                           002C2F     2         LINK=.
      00AA59 12                       3         .byte 5  
      00AA5A 98 90 59 90 89           4         .ascii "FINIT"
      002C35                          5         FINIT:
      00AA5F 90 BE 26         [ 4]   97     CALL FRESET 
      00AA62 90               [ 4]   98     RET 
                                     99 
                                    100 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    101 ;    FER ( -- u )
                                    102 ;    return FPSW value 
                                    103 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002C39                        104     _HEADER FER,3,"FER"
      00AA63 59 90                    1         .word LINK 
                           002C3B     2         LINK=.
      00AA65 BF                       3         .byte 3  
      00AA66 26 90 85                 4         .ascii "FER"
      002C3F                          5         FER:
      00AA69 4A 20 EB         [ 4]  105     CALL FPSW 
      00AA6C CD 04 E3         [ 4]  106     CALL AT 
      00AA6C EF               [ 4]  107     RET 
                                    108 
                                    109 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    110 ;    FZE  ( -- 0|-1 )
                                    111 ;    return FPSW zero flag 
                                    112 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002C46                        113     _HEADER FZE,3,"FZE"
      00AA6D 02 90                    1         .word LINK 
                           002C48     2         LINK=.
      00AA6F BE                       3         .byte 3  
      00AA70 26 FF 81                 4         .ascii "FZE"
      002C4C                          5         FZE:
      00AA73 AA 3C 07         [ 4]  114     CALL FPSW
      00AA76 44 52 53         [ 4]  115     CALL AT  
      00AA79 48 49 46         [ 4]  116     CALL ONE 
      00AA7C 54 06 76         [ 4]  117     CALL ANDD
      00AA7D CD 08 86         [ 4]  118     CALL NEGAT  
      00AA7D E6               [ 4]  119     RET 
                                    120 
                                    121 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    122 ;    FNE ( -- 0|-1 )
                                    123 ;    return FPSW negative flag 
                                    124 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002C5C                        125     _HEADER FNE,3,"FNE"
      00AA7E 01 A4                    1         .word LINK 
                           002C5E     2         LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 163.
Hexadecimal [24-Bits]



      00AA80 1F                       3         .byte 3  
      00AA81 1C 00 02                 4         .ascii "FNE"
      00AA84                          5         FNE:
      00AA84 4D 27 13         [ 4]  126     CALL FPSW 
      00AA87 90 93 90         [ 4]  127     CALL AT 
      002C68                        128     _DOLIT 2 
      00AA8A FE 90 54         [ 4]    1     CALL DOLIT 
      00AA8D FF 90                    2     .word 2 
      00AA8F 93 90 EE         [ 4]  129     CALL ANDD
      00AA92 02 90 56         [ 4]  130     CALL TWOSL
      00AA95 EF 02 4A         [ 4]  131     CALL NEGAT   
      00AA98 20               [ 4]  132     RET 
                                    133 
                                    134 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    135 ;   FOV (  -- 0|-1 )
                                    136 ;   return FPSW overflow flag 
                                    137 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002C77                        138     _HEADER FOV,3,"FOV"
      00AA99 EA 5E                    1         .word LINK 
                           002C79     2         LINK=.
      00AA9A 03                       3         .byte 3  
      00AA9A 81 AA 75                 4         .ascii "FOV"
      002C7D                          5         FOV:
      00AA9D 02 44 2A         [ 4]  139     CALL FPSW
      00AAA0 CD 04 E3         [ 4]  140     CALL AT  
      002C83                        141     _DOLIT 4 
      00AAA0 CD 86 99         [ 4]    1     CALL DOLIT 
      00AAA3 CD 86                    2     .word 4 
      00AAA5 D0 CD 86         [ 4]  142     CALL ANDD
      002C8B                        143     _DOLIT 2 
      00AAA8 62 CD A6         [ 4]    1     CALL DOLIT 
      00AAAB C6 CD                    2     .word 2 
      00AAAD 85 B4 CD         [ 4]  144     CALL RSHIFT 
      00AAB0 88 7C CD         [ 4]  145     CALL NEGAT  
      00AAB3 A9               [ 4]  146     RET 
                                    147 
                                    148 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    149 ;    SFZ ( f# -- f# )
                                    150 ;    set FPSW zero flag 
                                    151 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002C97                        152     _HEADER SFZ,3,"SFZ"
      00AAB4 31 CD                    1         .word LINK 
                           002C99     2         LINK=.
      00AAB6 86                       3         .byte 3  
      00AAB7 62 CD 86                 4         .ascii "SFZ"
      002C9D                          5         SFZ:
      00AABA 99 CD 86         [ 4]  153     CALL FER 
      002CA0                        154     _DOLIT 0xfffe 
      00AABD D0 CD 85         [ 4]    1     CALL DOLIT 
      00AAC0 B4 CD                    2     .word 0xfffe 
      00AAC2 87 1F CD         [ 4]  155     CALL ANDD 
      00AAC5 86 62 CD         [ 4]  156     CALL TOR    
      00AAC8 A6 C6 CD         [ 4]  157     CALL DDUP 
      002CAE                        158     _DOLIT 0xFF  
      00AACB 85 B4 CD         [ 4]    1     CALL DOLIT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 164.
Hexadecimal [24-Bits]



      00AACE 88 7C                    2     .word 0xFF 
      00AAD0 CD 88 A7         [ 4]  159     CALL ANDD
      00AAD3 CD 85 B4         [ 4]  160     CALL DZEQUAL 
      002CB9                        161     _DOLIT 1 
      00AAD6 CD A7 BC         [ 4]    1     CALL DOLIT 
      00AAD9 1C 00                    2     .word 1 
      00AADB 02 CD 8C         [ 4]  162     CALL ANDD 
      00AADE 7F CD 86         [ 4]  163     CALL RFROM 
      00AAE1 A9 CD A7         [ 4]  164     CALL ORR 
      00AAE4 E2 CD 85         [ 4]  165     CALL FPSW 
      00AAE7 B4 CD A7         [ 4]  166     CALL STORE 
      00AAEA BC               [ 4]  167     RET 
                                    168 
                                    169 
                                    170 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    171 ;   SFN ( f# -- f# )
                                    172 ;   set FPSW negative flag 
                                    173 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002CCE                        174     _HEADER SFN,3,"SFN"
      00AAEB CD AB                    1         .word LINK 
                           002CD0     2         LINK=.
      00AAED F4                       3         .byte 3  
      00AAEE CD 88 5D                 4         .ascii "SFN"
      002CD4                          5         SFN:
      00AAF1 CD 85 18         [ 4]  175     CALL FER 
      002CD7                        176     _DOLIT 0xFFFD 
      00AAF4 AA F9 CD         [ 4]    1     CALL DOLIT 
      00AAF7 89 18                    2     .word 0xFFFD 
      00AAF9 CD 06 76         [ 4]  177     CALL ANDD  
      00AAF9 81 AA 9D         [ 4]  178     CALL TOR 
      00AAFC 06 55 44         [ 4]  179     CALL DUPP 
      002CE5                        180     _DOLIT 0X80 
      00AAFF 2F 4D 4F         [ 4]    1     CALL DOLIT 
      00AB02 44 80                    2     .word 0X80 
      00AB03 CD 06 76         [ 4]  181     CALL ANDD 
      002CED                        182     _DOLIT 6 
      00AB03 CD 8C 7F         [ 4]    1     CALL DOLIT 
      00AB06 CD 8C                    2     .word 6 
      00AB08 7F CD A9         [ 4]  183     CALL RSHIFT 
      00AB0B 31 CD A9         [ 4]  184     CALL RFROM 
      00AB0E F8 CD A8         [ 4]  185     CALL ORR 
      00AB11 10 CD 86         [ 4]  186     CALL FPSW 
      00AB14 62 CD 88         [ 4]  187     CALL STORE 
      00AB17 A7               [ 4]  188     RET 
                                    189 
                                    190 
                                    191 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    192 ;   SFV ( -- )
                                    193 ;   set overflow flag 
                                    194 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002D02                        195     _HEADER SFV,3,"SFV"
      00AB18 CD A8                    1         .word LINK 
                           002D04     2         LINK=.
      00AB1A 10                       3         .byte 3  
      00AB1B CD 85 B4                 4         .ascii "SFV"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 165.
Hexadecimal [24-Bits]



      002D08                          5         SFV:
      00AB1E CD 89 52         [ 4]  196     CALL FER 
      002D0B                        197     _DOLIT 4 
      00AB21 CD 86 99         [ 4]    1     CALL DOLIT 
      00AB24 CD A9                    2     .word 4 
      00AB26 31 CD 85         [ 4]  198     CALL ORR 
      00AB29 C5 CD 86         [ 4]  199     CALL FPSW 
      00AB2C D0 CD 85         [ 4]  200     CALL STORE 
      00AB2F 26               [ 4]  201     RET 
                                    202 
                                    203 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    204 ;  F>ME ( f# -- m e )
                                    205 ;  split float in mantissa/exponent 
                                    206 ;  m mantissa as a double 
                                    207 ;  e exponent as a single 
                                    208 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002D1A                        209     _HEADER ATEXP,4,"F>ME"             
      00AB30 AB 8F                    1         .word LINK 
                           002D1C     2         LINK=.
      00AB32 CD                       3         .byte 4  
      00AB33 85 C5 CD AA              4         .ascii "F>ME"
      002D21                          5         ATEXP:
      00AB37 44 2C 23         [ 4]  210     CALL FRESET
      00AB38 CD 2C D4         [ 4]  211     CALL SFN
      00AB38 90 5F 90         [ 4]  212     CALL SFZ 
      00AB3B 89 CD            [ 1]  213     LDW Y,X 
      00AB3D A9 F8            [ 2]  214     LDW Y,(Y)
      00AB3F CD A9            [ 2]  215     PUSHW Y 
      00AB41 F8               [ 1]  216     CLR A  
      00AB42 CD A8            [ 1]  217     SWAPW Y 
      00AB44 FF CD            [ 1]  218     JRPL ATEXP1 
      00AB46 85               [ 1]  219     CPL A 
      002D36                        220 ATEXP1: ; sign extend mantissa 
      00AB47 26 AB            [ 1]  221     SWAPW Y 
      00AB49 5E 90            [ 1]  222     LD YH,A 
      00AB4B 85               [ 2]  223     LDW (X),Y 
      00AB4C 72 A9 00         [ 2]  224     SUBW X,#CELLL 
      00AB4F 01 90            [ 2]  225     POPW Y 
      00AB51 89               [ 1]  226     CLR A 
      00AB52 CD 88            [ 2]  227     TNZW Y 
      00AB54 A7 CD            [ 1]  228     JRPL ATEXP2 
      00AB56 A9               [ 1]  229     CPL A 
      002D46                        230 ATEXP2:
      00AB57 31 CD            [ 1]  231     SWAPW Y 
      00AB59 AC 26            [ 1]  232     LD YH,A 
      00AB5B CD               [ 2]  233     LDW (X),Y 
      00AB5C A9               [ 4]  234     RET 
                                    235 
                                    236 
                                    237 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    238 ;    ME>F ( m e -- f# )
                                    239 ;    built float from mantissa/exponent 
                                    240 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002D4C                        241     _HEADER STEXP,4,"ME>F"
      00AB5D 4F 1C                    1         .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 166.
Hexadecimal [24-Bits]



                           002D4E     2         LINK=.
      00AB5E 04                       3         .byte 4  
      00AB5E 90 85 90 BF              4         .ascii "ME>F"
      002D53                          5         STEXP:
      00AB62 26 16 07         [ 4]  242     CALL DUPP 
      00AB65 98 90 59         [ 4]  243     CALL ABSS 
      002D59                        244     _DOLIT 127 
      00AB68 17 07 16         [ 4]    1     CALL DOLIT 
      00AB6B 05 90                    2     .word 127 
      00AB6D 59 17 05         [ 4]  245     CALL GREAT
      002D61                        246     _QBRAN STEXP1
      00AB70 16 07 72         [ 4]    1     CALL QBRAN
      00AB73 B9 00                    2     .word STEXP1
      00AB75 26 17 07         [ 4]  247     CALL SFV
      002D69                        248 STEXP1:
      00AB78 16 01            [ 1]  249     LDW Y,X 
      00AB7A 90 5D            [ 2]  250     LDW Y,(Y)
      00AB7C 27               [ 1]  251     CLR A 
      00AB7D 1C 72            [ 1]  252     LD YH,A
      00AB7F A2 00            [ 1]  253     SWAPW Y 
      00AB81 01 17            [ 2]  254     PUSHW Y  ; e >r 
      00AB83 01 CD A7         [ 2]  255     ADDW X,#CELLL 
      00AB86 E2 CD AA         [ 4]  256     CALL DDUP 
      00AB89 28 CD A7         [ 4]  257     CALL DABS
      00AB8C E2 20 A9         [ 4]  258     CALL SWAPP 
      00AB8F                        259     _DROP  
      00AB8F CD 8C 7F         [ 2]    1     ADDW X,#CELLL  
      002D83                        260     _DOLIT 127 
      00AB92 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AB95 00 01                    2     .word 127 
      00AB97 CD 86 3E         [ 4]  261     CALL GREAT 
      00AB9A                        262     _QBRAN STEXP2 
      00AB9A 1C 00 04         [ 4]    1     CALL QBRAN
      00AB9D CD 85                    2     .word STEXP2
      00AB9F B4 1C 00         [ 4]  263     CALL SFV 
      002D93                        264 STEXP2: 
      00ABA2 02               [ 1]  265     CLR A 
      00ABA3 CD               [ 1]  266     LD (X),A     
      00ABA4 85 B4 CD         [ 4]  267     CALL RFROM 
      00ABA7 AA 7D CD         [ 4]  268     CALL ORR
      00ABAA A9 4F 81         [ 4]  269     CALL SFZ 
      00ABAD AA FC 05         [ 4]  270     CALL SFN 
      00ABB0 44               [ 4]  271     RET 
                                    272 
                                    273 
                                    274 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    275 ;   E. ( f# -- )
                                    276 ;   print float in scientific 
                                    277 ;   format 
                                    278 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002DA2                        279     _HEADER EDOT,2,"E."
      00ABB1 2F 4D                    1         .word LINK 
                           002DA4     2         LINK=.
      00ABB3 4F                       3         .byte 2  
      00ABB4 44 2E                    4         .ascii "E."
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 167.
Hexadecimal [24-Bits]



      00ABB5                          5         EDOT:
      00ABB5 CD A6 D7         [ 4]  280     CALL BASE 
      00ABB8 CD 86 62         [ 4]  281     CALL AT 
      00ABBB CD A6 C6         [ 4]  282     CALL TOR 
      002DB0                        283     _DOLIT 10 
      00ABBE CD A7 E2         [ 4]    1     CALL DOLIT 
      00ABC1 CD A6                    2     .word 10 
      00ABC3 D7 CD 85         [ 4]  284     CALL BASE 
      00ABC6 B4 CD 87         [ 4]  285     CALL STORE 
      00ABC9 1F CD 86         [ 4]  286     CALL ATEXP ; m e 
      002DBE                        287 EDOT0:
      00ABCC 62 CD A6         [ 4]  288     CALL TOR   
      00ABCF C6 CD A7         [ 4]  289     CALL DABS 
      00ABD2 E2 CD AB         [ 4]  290     CALL SPACE 
      00ABD5 03 90 85         [ 4]  291     CALL BDIGS     
      002DCA                        292 EDOT2: 
      00ABD8 90 5D 2A         [ 4]  293     CALL DDIG
      00ABDB 03 CD 89         [ 4]  294     CALL RFROM 
      00ABDE 18 0B 93         [ 4]  295     CALL ONEP 
      00ABDF CD 05 E2         [ 4]  296     CALL TOR 
      00ABDF 81 AB AF         [ 4]  297     CALL DUPP
      002DD9                        298     _QBRAN EDOT3 
      00ABE2 02 44 2F         [ 4]    1     CALL QBRAN
      00ABE5 2D E3                    2     .word EDOT3
      002DDE                        299     _BRAN EDOT2  
      00ABE5 CD AB B5         [ 4]    1     CALL BRAN 
      00ABE8 CD A7                    2     .word EDOT2 
      002DE3                        300 EDOT3:
      00ABEA E2 1C 00         [ 4]  301     CALL OVER 
      00ABED 04 81 AB         [ 4]  302     CALL BASE 
      00ABF0 E2 02 44         [ 4]  303     CALL AT 
      00ABF3 2B 09 10         [ 4]  304     CALL ULESS 
      00ABF4                        305     _QBRAN EDOT2 
      00ABF4 90 93 90         [ 4]    1     CALL QBRAN
      00ABF7 FE 90                    2     .word EDOT2
      002DF4                        306     _DOLIT '.'
      00ABF9 BF 26 90         [ 4]    1     CALL DOLIT 
      00ABFC 93 90                    2     .word '.' 
      00ABFE EE 02 90         [ 4]  307     CALL HOLD  
      00AC01 BF 24 1C         [ 4]  308     CALL DDIG
      00AC04 00 04 90         [ 4]  309     CALL FNE 
      002E02                        310     _QBRAN EDOT4 
      00AC07 93 90 EE         [ 4]    1     CALL QBRAN
      00AC0A 02 72                    2     .word EDOT4
      002E07                        311     _DOLIT '-'
      00AC0C B9 00 24         [ 4]    1     CALL DOLIT 
      00AC0F EF 02                    2     .word '-' 
      00AC11 90 93 90         [ 4]  312     CALL HOLD 
      002E0F                        313 EDOT4:       
      002E0F                        314     _DROP 
      00AC14 FE 24 04         [ 2]    1     ADDW X,#CELLL  
      00AC17 72 A9 00         [ 4]  315     CALL EDIGS 
      00AC1A 01 0F 5F         [ 4]  316     CALL TYPES
      00AC1B CD 05 34         [ 4]  317     CALL RFROM 
      00AC1B 72 B9 00         [ 4]  318     CALL QDUP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 168.
Hexadecimal [24-Bits]



      002E1E                        319     _QBRAN EDOT5     
      00AC1E 26 FF 81         [ 4]    1     CALL QBRAN
      00AC21 AB F1                    2     .word EDOT5
      002E23                        320     _DOLIT 'E'
      00AC23 02 44 2D         [ 4]    1     CALL DOLIT 
      00AC26 00 45                    2     .word 'E' 
      00AC26 90 93 90         [ 4]  321     CALL EMIT 
      00AC29 FE 90 BF         [ 4]  322     CALL DOT
      002E2E                        323 EDOT5: 
      00AC2C 26 90 93         [ 4]  324     CALL RFROM 
      00AC2F 90 EE 02         [ 4]  325     CALL BASE 
      00AC32 90 BF 24         [ 4]  326     CALL STORE  
      00AC35 1C               [ 4]  327     RET 
                                    328 
                                    329 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                    330 ;   F. (f# -- )
                                    331 ;   print float in fixed
                                    332 ;   point format. 
                                    333 ;;;;;;;;;;;;;;;;;;;;;;;;;
      002E38                        334     _HEADER FDOT,2,"F."
      00AC36 00 04                    1         .word LINK 
                           002E3A     2         LINK=.
      00AC38 90                       3         .byte 2  
      00AC39 93 90                    4         .ascii "F."
      002E3D                          5         FDOT:
      00AC3B EE 02 72         [ 4]  335     CALL BASE 
      00AC3E B2 00 24         [ 4]  336     CALL AT 
      00AC41 EF 02 90         [ 4]  337     CALL TOR 
      002E46                        338     _DOLIT 10 
      00AC44 93 90 FE         [ 4]    1     CALL DOLIT 
      00AC47 24 04                    2     .word 10 
      00AC49 72 A2 00         [ 4]  339     CALL BASE 
      00AC4C 01 04 D1         [ 4]  340     CALL STORE 
      00AC4D CD 2D 21         [ 4]  341     CALL    ATEXP
      00AC4D 72 B2 00         [ 4]  342     CALL    DUPP  
      00AC50 26 FF 81         [ 4]  343     CALL    ABSS 
      002E5A                        344     _DOLIT  8
      00AC53 AC 23 09         [ 4]    1     CALL DOLIT 
      00AC56 46 4C                    2     .word 8 
      00AC58 4F 41 54         [ 4]  345     CALL    GREAT 
      002E62                        346     _QBRAN  FDOT1 
      00AC5B 2D 56 45         [ 4]    1     CALL QBRAN
      00AC5E 52 6A                    2     .word FDOT1
      00AC5F CC 2D BE         [ 2]  347     JP      EDOT0 
      002E6A                        348 FDOT1:
      00AC5F CD 8F F7         [ 4]  349     CALL    SPACE 
      00AC62 CD 90 24         [ 4]  350     CALL    TOR 
      00AC65 11 66 6C         [ 4]  351     CALL    FNE 
      002E73                        352     _QBRAN  FDOT0 
      00AC68 6F 61 74         [ 4]    1     CALL QBRAN
      00AC6B 33 32                    2     .word FDOT0
      00AC6D 20 6C 69         [ 4]  353     CALL    DNEGA 
      002E7B                        354 FDOT0: 
      00AC70 62 72 61         [ 4]  355     CALL    BDIGS
      00AC73 72 79 2C         [ 4]  356     CALL    RAT  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 169.
Hexadecimal [24-Bits]



      00AC76 20 CD 9B         [ 4]  357     CALL    ZLESS 
      002E84                        358     _QBRAN  FDOT6 
      00AC79 75 CD 9B         [ 4]    1     CALL QBRAN
      00AC7C 4D CD                    2     .word FDOT6
      002E89                        359 FDOT2: ; e<0 
      00AC7E 84 EF 00         [ 4]  360     CALL    DDIG 
      00AC81 01 CD 84         [ 4]  361     CALL    RFROM
      00AC84 EF 00 00         [ 4]  362     CALL    ONEP 
      00AC87 CC 9B 89         [ 4]  363     CALL    QDUP 
      002E95                        364     _QBRAN  FDOT3 
      00AC8A AC 55 04         [ 4]    1     CALL QBRAN
      00AC8D 46 50                    2     .word FDOT3
      00AC8F 53 57 E2         [ 4]  365     CALL    TOR 
      00AC91                        366     _BRAN   FDOT2 
      00AC91 90 AE 00         [ 4]    1     CALL BRAN 
      00AC94 08 1D                    2     .word FDOT2 
      002EA2                        367 FDOT3:
      002EA2                        368     _DOLIT  '.' 
      00AC96 00 02 FF         [ 4]    1     CALL DOLIT 
      00AC99 81 AC                    2     .word '.' 
      00AC9B 8C 06 46         [ 4]  369     CALL    HOLD 
      00AC9E 52 45 53         [ 4]  370     CALL    DDIGS
      002EAD                        371     _BRAN   FDOT9  
      00ACA1 45 54 B4         [ 4]    1     CALL BRAN 
      00ACA3 2E C7                    2     .word FDOT9 
      002EB2                        372 FDOT6: ; e>=0 
      002EB2                        373     _BRAN   FDOT8
      00ACA3 CD 8C 7F         [ 4]    1     CALL BRAN 
      00ACA6 CD AC                    2     .word FDOT8 
      002EB7                        374 FDOT7:     
      002EB7                        375     _DOLIT  '0'
      00ACA8 91 CD 85         [ 4]    1     CALL DOLIT 
      00ACAB 51 81                    2     .word '0' 
      00ACAD AC 9C 05         [ 4]  376     CALL    HOLD 
      002EBF                        377 FDOT8:
      00ACB0 46 49 4E         [ 4]  378     CALL    DONXT 
      00ACB3 49 54                  379     .word   FDOT7
      00ACB5 CD 26 CB         [ 4]  380     CALL    DDIGS 
      002EC7                        381 FDOT9:
      00ACB5 CD AC A3         [ 4]  382     CALL    FNE 
      002ECA                        383     _QBRAN  FDOT10 
      00ACB8 81 AC AF         [ 4]    1     CALL QBRAN
      00ACBB 03 46                    2     .word FDOT10
      002ECF                        384     _DOLIT '-' 
      00ACBD 45 52 6F         [ 4]    1     CALL DOLIT 
      00ACBF 00 2D                    2     .word '-' 
      00ACBF CD AC 91         [ 4]  385     CALL   HOLD 
      002ED7                        386 FDOT10:
      00ACC2 CD 85 63         [ 4]  387     CALL    EDIGS 
      00ACC5 81 AC BB         [ 4]  388     CALL    TYPES 
      00ACC8 03 46 5A         [ 4]  389     CALL    RFROM 
      00ACCB 45 06 DF         [ 4]  390     CALL    BASE 
      00ACCC CD 04 D1         [ 4]  391     CALL    STORE 
      00ACCC CD               [ 4]  392     RET 
                                    393 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 170.
Hexadecimal [24-Bits]



                                    394 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    395 ; return parsed exponent or 
                                    396 ; 0 if failed
                                    397 ; at entry exprect *a=='E'    
                                    398 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002EE7                        399 parse_exponent: ; a cntr -- e -1 | 0 
      00ACCD AC 91 CD         [ 4]  400     CALL TOR   ; R: cntr 
      00ACD0 85 63 CD         [ 4]  401     CALL DUPP 
      00ACD3 8C 8A CD         [ 4]  402     CALL CAT 
      002EF0                        403     _DOLIT 'E' 
      00ACD6 86 F6 CD         [ 4]    1     CALL DOLIT 
      00ACD9 89 06                    2     .word 'E' 
      00ACDB 81 AC C8         [ 4]  404     CALL EQUAL 
      002EF8                        405     _QBRAN 1$
      00ACDE 03 46 4E         [ 4]    1     CALL QBRAN
      00ACE1 45 28                    2     .word 1$
      00ACE2 CD 0B 93         [ 4]  406     CALL ONEP 
      00ACE2 CD AC 91         [ 4]  407     CALL RFROM  ; a cntr 
      00ACE5 CD 85 63         [ 4]  408     CALL ONEM
      00ACE8 CD 84 EF         [ 4]  409     CALL DUPP 
      002F09                        410     _QBRAN 2$ ; a cntr 
      00ACEB 00 02 CD         [ 4]    1     CALL QBRAN
      00ACEE 86 F6                    2     .word 2$
      00ACF0 CD 8C 65         [ 4]  411     CALL ZERO
      00ACF3 CD 89 06         [ 4]  412     CALL DUPP 
      00ACF6 81 AC DE         [ 4]  413     CALL DSWAP ; 0 0 a cntr  
      00ACF9 03 46 4F         [ 4]  414     CALL nsign 
      00ACFC 56 05 E2         [ 4]  415     CALL TOR   ; R: esign  
      00ACFD CD 25 2B         [ 4]  416     CALL parse_digits
      002F20                        417     _QBRAN PARSEXP_SUCCESS ; parsed to end of string 
      00ACFD CD AC 91         [ 4]    1     CALL QBRAN
      00AD00 CD 85                    2     .word PARSEXP_SUCCESS
                                    418 ; failed invalid character
      002F25                        419     _DDROP ; 0 a 
      00AD02 63 CD 84         [ 2]    1    ADDW X,#2*CELLL 
      002F28                        420 1$: 
      00AD05 EF 00 04         [ 4]  421     CALL RFROM ; sign||cntr  
      002F2B                        422 2$:
      002F2B                        423     _DDROP  ; a cntr || a sign || 0 cntr   
      00AD08 CD 86 F6         [ 2]    1    ADDW X,#2*CELLL 
      00AD0B CD 84 EF         [ 4]  424     CALL ZERO   ; return only 0 
      00AD0E 00               [ 4]  425     RET 
      002F32                        426 PARSEXP_SUCCESS: 
      002F32                        427     _DDROP ; drop dhi a 
      00AD0F 02 CD 8C         [ 2]    1    ADDW X,#2*CELLL 
      00AD12 4D CD 89         [ 4]  428     CALL RFROM ; es 
      002F38                        429     _QBRAN 1$
      00AD15 06 81 AC         [ 4]    1     CALL QBRAN
      00AD18 F9 03                    2     .word 1$
      00AD1A 53 46 5A         [ 4]  430     CALL NEGAT
      00AD1D                        431 1$:
      002F40                        432     _DOLIT -1 ; -- e -1 
      00AD1D CD AC BF         [ 4]    1     CALL DOLIT 
      00AD20 CD 84                    2     .word -1 
      00AD22 EF               [ 4]  433     RET 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 171.
Hexadecimal [24-Bits]



                                    434 
                                    435 
                                    436 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    437 ;   FLOAT?  ( a dlo dhi a+ cntr sign d? -- f -3 | a 0 )
                                    438 ;   called by NUMBER? 
                                    439 ;   convert string to float 
                                    440 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002F46                        441     _HEADER FLOATQ,5,"FLOAT?"
      00AD23 FF FE                    1         .word LINK 
                           002F48     2         LINK=.
      00AD25 CD                       3         .byte 5  
      00AD26 86 F6 CD 86 62 CD        4         .ascii "FLOAT?"
      002F4F                          5         FLOATQ:
      002F4F                        442     _QBRAN FLOATQ0 
      00AD2C 88 A7 CD         [ 4]    1     CALL QBRAN
      00AD2F 84 EF                    2     .word FLOATQ0
      002F54                        443     _BRAN FLOAT_ERROR  ; not a float, string start with '#'
      00AD31 00 FF CD         [ 4]    1     CALL BRAN 
      00AD34 86 F6                    2     .word FLOAT_ERROR 
      002F59                        444 FLOATQ0:
                                    445 ; BASE must be 10 
      00AD36 CD A8 B7         [ 4]  446     CALL BASE 
      00AD39 CD 84 EF         [ 4]  447     CALL AT 
      002F5F                        448     _DOLIT 10 
      00AD3C 00 01 CD         [ 4]    1     CALL DOLIT 
      00AD3F 86 F6                    2     .word 10 
      00AD41 CD 85 B4         [ 4]  449     CALL EQUAL 
      002F67                        450     _QBRAN FLOAT_ERROR 
      00AD44 CD 87 0A         [ 4]    1     CALL QBRAN
      00AD47 CD AC                    2     .word FLOAT_ERROR
                                    451 ; if float next char is '.' or 'E' 
      00AD49 91 CD 85         [ 4]  452     CALL TOR ; R: sign  
      00AD4C 51 81 AD         [ 4]  453     CALL TOR ; R: sign cntr 
      00AD4F 19 03 53         [ 4]  454     CALL DUPP
      00AD52 46 4E 01         [ 4]  455     CALL CAT 
      00AD54                        456     _DOLIT '.' 
      00AD54 CD AC BF         [ 4]    1     CALL DOLIT 
      00AD57 CD 84                    2     .word '.' 
      00AD59 EF FF FD         [ 4]  457     CALL EQUAL 
      002F80                        458     _QBRAN FLOATQ1 ; not a dot 
      00AD5C CD 86 F6         [ 4]    1     CALL QBRAN
      00AD5F CD 86                    2     .word FLOATQ1
      00AD61 62 CD 86         [ 4]  459     CALL ONEP 
      00AD64 99 CD 84         [ 4]  460     CALL RFROM  ; dlo dhi a cntr R: sign  
      00AD67 EF 00 80         [ 4]  461     CALL ONEM 
      00AD6A CD 86 F6         [ 4]  462     CALL DUPP 
      00AD6D CD 84 EF         [ 4]  463     CALL TOR  ; R: sign cntr 
                                    464 ; parse fractional part
      00AD70 00 06 CD         [ 4]  465     CALL parse_digits ; dlo dhi a cntr -- dm a cntr 
      00AD73 8C 4D CD         [ 4]  466     CALL DUPP 
      00AD76 85 B4 CD         [ 4]  467     CALL RFROM 
      00AD79 87 0A CD         [ 4]  468     CALL SWAPP 
      00AD7C AC 91 CD         [ 4]  469     CALL SUBB ; fd -> fraction digits count 
      00AD7F 85 51 81         [ 4]  470     CALL TOR  ; dlo dhi a cntr R: sign fd 
      00AD82 AD 50 03         [ 4]  471     CALL DUPP ; cntr cntr  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 172.
Hexadecimal [24-Bits]



      002FA9                        472     _QBRAN 1$ ; end of string, no exponent
      00AD85 53 46 56         [ 4]    1     CALL QBRAN
      00AD88 2F B3                    2     .word 1$
      002FAE                        473     _BRAN FLOATQ2
      00AD88 CD AC BF         [ 4]    1     CALL BRAN 
      00AD8B CD 84                    2     .word FLOATQ2 
      00AD8D EF 00 04         [ 4]  474 1$: CALL SWAPP 
      002FB6                        475     _DROP ; a
      00AD90 CD 87 0A         [ 2]    1     ADDW X,#CELLL  
      002FB9                        476     _BRAN FLOATQ3        
      00AD93 CD AC 91         [ 4]    1     CALL BRAN 
      00AD96 CD 85                    2     .word FLOATQ3 
      002FBE                        477 FLOATQ1: ; must push fd==0 on RSTACK 
      00AD98 51 81 AD         [ 4]  478     CALL RFROM ; cntr 
      00AD9B 84 04 46         [ 4]  479     CALL ZERO  ; fd 
      00AD9E 3E 4D 45         [ 4]  480     CALL TOR   ; dm a cntr R: sign fd 
      00ADA1                        481 FLOATQ2: 
      00ADA1 CD AC A3         [ 4]  482     CALL parse_exponent 
      002FCA                        483     _QBRAN FLOAT_ERROR0 ; exponent expected 
      00ADA4 CD AD 54         [ 4]    1     CALL QBRAN
      00ADA7 CD AD                    2     .word FLOAT_ERROR0
      002FCF                        484 FLOATQ3: ; dm 0 || dm e  
      00ADA9 1D 90 93         [ 4]  485     CALL RFROM ;  fd  
      00ADAC 90 FE 90         [ 4]  486     CALL SUBB  ; exp=e-fd 
      00ADAF 89 4F 90         [ 4]  487     CALL NROT 
      00ADB2 5E 2A 01         [ 4]  488     CALL RFROM  ; sign 
      002FDB                        489     _QBRAN FLOATQ4 
      00ADB5 43 04 98         [ 4]    1     CALL QBRAN
      00ADB6 2F E3                    2     .word FLOATQ4
      00ADB6 90 5E 90         [ 4]  490     CALL DNEGA 
      002FE3                        491 FLOATQ4:
      00ADB9 95 FF 1D         [ 4]  492     CALL ROT 
      00ADBC 00 02 90         [ 4]  493     CALL STEXP 
      00ADBF 85 4F 90         [ 4]  494     CALL ROT 
      002FEC                        495     _DROP 
      00ADC2 5D 2A 01         [ 2]    1     ADDW X,#CELLL  
      00ADC5 43 2C D4         [ 4]  496     CALL SFN 
      00ADC6 CD 2C 9D         [ 4]  497     CALL SFZ 
      002FF5                        498     _DOLIT -3 
      00ADC6 90 5E 90         [ 4]    1     CALL DOLIT 
      00ADC9 95 FF                    2     .word -3 
      00ADCB 81               [ 4]  499     RET       
      002FFB                        500 FLOAT_ERROR0: 
      00ADCC AD 9C 04         [ 4]  501     CALL DRFROM ; sign df      
      002FFE                        502 FLOAT_ERROR: 
      00ADCF 4D 45 3E         [ 4]  503     CALL DEPTH 
      00ADD2 46 0B 86         [ 4]  504     CALL CELLS 
      00ADD3 CD 05 F9         [ 4]  505     CALL SPAT 
      00ADD3 CD 86 99         [ 4]  506     CALL SWAPP 
      00ADD6 CD 89 6C         [ 4]  507     CALL PLUS  
      00ADD9 CD 84 EF         [ 4]  508     CALL SPSTO 
      00ADDC 00 7F CD         [ 4]  509     CALL ZERO 
      00ADDF 89               [ 4]  510     RET 
                                    511 
                                    512 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 173.
Hexadecimal [24-Bits]



                                    513 ;  LSCALE ( f# -- f# )
                                    514 ;  m *=10 , e -= 1
                                    515 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      003014                        516     _HEADER LSCALE,6,"LSCALE"
      00ADE0 D3 CD                    1         .word LINK 
                           003016     2         LINK=.
      00ADE2 85                       3         .byte 6  
      00ADE3 18 AD E9 CD AD 88        4         .ascii "LSCALE"
      00ADE9                          5         LSCALE:
      00ADE9 90 93 90         [ 4]  517     CALL ATEXP 
      00ADEC FE 4F 90         [ 4]  518     CALL ONE 
      00ADEF 95 90 5E         [ 4]  519     CALL SUBB 
      00ADF2 90 89 1C         [ 4]  520     CALL TOR
      003029                        521     _DOLIT 10 
      00ADF5 00 02 CD         [ 4]    1     CALL DOLIT 
      00ADF8 88 A7                    2     .word 10 
      00ADFA CD A6 C6         [ 4]  522     CALL DSSTAR
      00ADFD CD 86 A9         [ 4]  523     CALL RFROM 
      00AE00 1C 00 02         [ 4]  524     CALL STEXP 
      00AE03 CD               [ 4]  525     RET  
                                    526 
                                    527 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    528 ;  RSCALE ( f# -- f# )
                                    529 ;  m /=10 , e+=1 
                                    530 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      003038                        531     _HEADER RSCALE,6,"RSCALE"
      00AE04 84 EF                    1         .word LINK 
                           00303A     2         LINK=.
      00AE06 00                       3         .byte 6  
      00AE07 7F CD 89 D3 CD 85        4         .ascii "RSCALE"
      003041                          5         RSCALE:
      00AE0D 18 AE 13         [ 4]  532     CALL ATEXP 
      00AE10 CD AD 88         [ 4]  533     CALL ONE 
      00AE13 CD 08 3C         [ 4]  534     CALL PLUS 
      00AE13 4F F7 CD         [ 4]  535     CALL TOR 
      00304D                        536     _DOLIT 10 
      00AE16 85 B4 CD         [ 4]    1     CALL DOLIT 
      00AE19 87 0A                    2     .word 10 
      00AE1B CD AD 1D         [ 4]  537     CALL DSLMOD 
      00AE1E CD AD 54         [ 4]  538     CALL ROT 
      003058                        539     _DROP 
      00AE21 81 AD CE         [ 2]    1     ADDW X,#CELLL  
      00AE24 02 45 2E         [ 4]  540     CALL RFROM 
      00AE27 CD 2D 53         [ 4]  541     CALL STEXP 
      00AE27 CD               [ 4]  542     RET 
                                    543 
                                    544 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    545 ;  SCALEUP ( ud u1 u2 -- ud*10 u1 u2 )
                                    546 ;  while (ud<=0xcccccccc && u1<u2 ){
                                    547 ;        ud*10;
                                    548 ;        u2--;
                                    549 ;  }  
                                    550 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      003062                        551 SCALEUP:
      00AE28 87 5F CD         [ 4]  552     CALL DDUP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 174.
Hexadecimal [24-Bits]



      00AE2B 85 63 CD         [ 4]  553     CALL LESS  
      003068                        554     _QBRAN SCALEUP3
      00AE2E 86 62 CD         [ 4]    1     CALL QBRAN
      00AE31 84 EF                    2     .word SCALEUP3
      00AE33 00 0A CD         [ 4]  555     CALL DTOR   ; R: u1 u2  
      00AE36 87 5F CD         [ 4]  556     CALL DDUP 
      003073                        557     _DOLIT 0XCCCC 
      00AE39 85 51 CD         [ 4]    1     CALL DOLIT 
      00AE3C AD A1                    2     .word 0XCCCC 
      00AE3E                        558     _DOLIT 0XCCC 
      00AE3E CD 86 62         [ 4]    1     CALL DOLIT 
      00AE41 CD A6                    2     .word 0XCCC 
      00AE43 C6 CD 8F         [ 4]  559     CALL DGREAT  
      003080                        560     _TBRAN SCALEUP2 
      00AE46 B5 CD 8E         [ 4]    1     CALL TBRAN 
      00AE49 79 95                    2     .word SCALEUP2 
      00AE4A                        561     _DOLIT 10 
      00AE4A CD A7 32         [ 4]    1     CALL DOLIT 
      00AE4D CD 85                    2     .word 10 
      00AE4F B4 CD 8C         [ 4]  562     CALL UDSSTAR 
      00AE52 13 CD 86         [ 4]  563     CALL DRFROM 
      00AE55 62 CD 86         [ 4]  564     CALL ONEM
      00AE58 99 CD            [ 2]  565     JRA SCALEUP
      003095                        566 SCALEUP2:
      00AE5A 85 18 AE         [ 4]  567     CALL DRFROM
      003098                        568 SCALEUP3: 
      00AE5D 63               [ 4]  569     RET 
                                    570 
                                    571 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    572 ; SCALEDOWN ( ud u1 u2 -- ud u1 u2 )
                                    573 ;  whhile (ud && u1>u2 ){ 
                                    574 ;     ud/10;
                                    575 ;     u2++;
                                    576 ;  } 
                                    577 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      003099                        578 SCALEDOWN: 
      00AE5E CD 85 34         [ 4]  579     CALL DDUP 
      00AE61 AE 4A 53         [ 4]  580     CALL GREAT 
      00AE63                        581     _QBRAN SCALDN3 
      00AE63 CD 86 C1         [ 4]    1     CALL QBRAN
      00AE66 CD 87                    2     .word SCALDN3
      00AE68 5F CD 85         [ 4]  582     CALL DTOR 
      00AE6B 63 CD 89         [ 4]  583     CALL DDUP 
      00AE6E 90 CD 85         [ 4]  584     CALL DZEQUAL 
      0030AD                        585     _TBRAN SCALDN2  
      00AE71 18 AE 4A         [ 4]    1     CALL TBRAN 
      00AE74 CD 84                    2     .word SCALDN2 
      0030B2                        586     _DOLIT 10
      00AE76 EF 00 2E         [ 4]    1     CALL DOLIT 
      00AE79 CD 8E                    2     .word 10 
      00AE7B 89 CD A7         [ 4]  587     CALL ZERO  
      00AE7E 32 CD AC         [ 4]  588     CALL DSLASH 
      00AE81 E2 CD 85         [ 4]  589     CALL DRFROM 
      00AE84 18 AE 8F         [ 4]  590     CALL ONEP  
      00AE87 CD 84            [ 2]  591     JRA SCALEDOWN 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 175.
Hexadecimal [24-Bits]



      0030C5                        592 SCALDN2:
      00AE89 EF 00 2D         [ 4]  593     CALL DRFROM 
      0030C8                        594 SCALDN3:
      00AE8C CD               [ 4]  595     RET 
                                    596 
                                    597 
                                    598 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    599 ;  F-ALIGN ( f#1 f#2 -- m1 m2 e )
                                    600 ;  align to same exponent 
                                    601 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0030C9                        602     _HEADER FALIGN,7,"F-ALIGN"
      00AE8D 8E 89                    1         .word LINK 
                           0030CB     2         LINK=.
      00AE8F 07                       3         .byte 7  
      00AE8F 1C 00 02 CD 8E DE CD     4         .ascii "F-ALIGN"
      0030D3                          5         FALIGN:
      00AE96 8F DF CD         [ 4]  603     CALL ATEXP 
      00AE99 85 B4 CD         [ 4]  604     CALL TOR 
      00AE9C 88 4C CD         [ 4]  605     CALL DSWAP 
      00AE9F 85 18 AE         [ 4]  606     CALL ATEXP 
      00AEA2 AE CD 84         [ 4]  607     CALL TOR    ; m2 m1 R: e2 e1 
      00AEA5 EF 00 45         [ 4]  608     CALL DSWAP 
      00AEA8 CD 84 B6         [ 4]  609     CALL DRAT 
      00AEAB CD 90 9E         [ 4]  610     CALL EQUAL 
      00AEAE                        611     _TBRAN FALGN8
      00AEAE CD 85 B4         [ 4]    1     CALL TBRAN 
      00AEB1 CD 87                    2     .word FALGN8 
                                    612 ; scaleup the largest float 
                                    613 ; but limit mantissa <=0xccccccc
                                    614 ; to avoid mantissa overflow     
      00AEB3 5F CD 85         [ 4]  615     CALL DRAT ; m1 m2 e2 e1 
      00AEB6 51 81 AE         [ 4]  616     CALL GREAT 
      0030F6                        617     _QBRAN FALGN4 ; e2<e1 
      00AEB9 24 02 46         [ 4]    1     CALL QBRAN
      00AEBC 2E 0C                    2     .word FALGN4
                                    618 ; e2>e1 then scale up m2   
      00AEBD CD 28 CF         [ 4]  619     CALL DRFROM 
      00AEBD CD 87 5F         [ 4]  620     CALL SWAPP 
      00AEC0 CD 85 63         [ 4]  621     CALL SCALEUP 
      00AEC3 CD 86 62         [ 4]  622     CALL SWAPP 
      00AEC6 CD 84 EF         [ 4]  623     CALL DTOR 
      00AEC9 00 0A            [ 2]  624     JRA FALGN6
      00310C                        625 FALGN4: ; e2<e1 then scaleup m1 
      00AECB CD 87 5F         [ 4]  626     CALL DSWAP 
      00AECE CD 85 51         [ 4]  627     CALL DRFROM 
      00AED1 CD AD A1         [ 4]  628     CALL SCALEUP 
      00AED4 CD 86 99         [ 4]  629     CALL DTOR
      00AED7 CD 89 6C         [ 4]  630     CALL DSWAP 
                                    631 ; check again for e2==e1 
                                    632 ; if scaleup was not enough 
                                    633 ; to equalize exponent then
                                    634 ; scaledown smallest float     
      00311B                        635 FALGN6: 
      00AEDA CD 84 EF         [ 4]  636     CALL DRAT 
      00AEDD 00 08 CD         [ 4]  637     CALL EQUAL 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 176.
Hexadecimal [24-Bits]



      003121                        638     _TBRAN FALGN8 
      00AEE0 89 D3 CD         [ 4]    1     CALL TBRAN 
      00AEE3 85 18                    2     .word FALGN8 
                                    639 ; e2!=e1 need to scale down smallest 
      00AEE5 AE EA CC         [ 4]  640     CALL DRAT 
      00AEE8 AE 3E 53         [ 4]  641     CALL GREAT 
      00AEEA                        642     _QBRAN FALGN7 ; e2<e1 
      00AEEA CD 8F B5         [ 4]    1     CALL QBRAN
      00AEED CD 86                    2     .word FALGN7
                                    643 ; e2>e1 scaledown m1 
      00AEEF 62 CD AC         [ 4]  644     CALL DSWAP 
      00AEF2 E2 CD 85         [ 4]  645     CALL DRFROM 
      00AEF5 18 AE FB         [ 4]  646     CALL SCALEDOWN
      00AEF8 CD 89 18         [ 4]  647     CALL SWAPP 
      00AEFB CD 28 B1         [ 4]  648     CALL DTOR 
      00AEFB CD 8E            [ 2]  649     JRA FALGN71  
      003142                        650 FALGN7: ; e2<e1 scaledown m2 
      00AEFD 79 CD 85         [ 4]  651     CALL DRFROM 
      00AF00 C5 CD 86         [ 4]  652     CALL SWAPP 
      00AF03 D0 CD 85         [ 4]  653     CALL SCALEDOWN 
      00AF06 18 AF 32         [ 4]  654     CALL SWAPP 
      00AF09 CD 28 B1         [ 4]  655     CALL DTOR 
                                    656 ; after scaledown if e2!=e1 
                                    657 ; this imply that one of mantissa 
                                    658 ; as been nullified by scalling 
                                    659 ; hence keep largest exponent 
      003151                        660 FALGN71:
      00AF09 CD A7 32         [ 4]  661     CALL DRAT 
      00AF0C CD 85 B4         [ 4]  662     CALL EQUAL
      003157                        663     _TBRAN FALGN8 
      00AF0F CD 8C 13         [ 4]    1     CALL TBRAN 
      00AF12 CD 88                    2     .word FALGN8 
      00AF14 4C CD 85         [ 4]  664     CALL DRFROM 
      00AF17 18 AF 22         [ 4]  665     CALL DDUP 
      00AF1A CD 86 62         [ 4]  666     CALL GREAT 
      003165                        667     _TBRAN FALGN72
      00AF1D CD 85 34         [ 4]    1     CALL TBRAN 
      00AF20 AF 09                    2     .word FALGN72 
      00AF22 CD 06 29         [ 4]  668     CALL SWAPP     
      00316D                        669 FALGN72:
      00AF22 CD 84 EF         [ 4]  670     CALL DTOR  ; now smallest e is at rtop.
      003170                        671 FALGN8:
      00AF25 00 2E CD         [ 4]  672     CALL DRFROM 
      003173                        673     _DROP 
      00AF28 8E 89 CD         [ 2]    1     ADDW X,#CELLL  
      00AF2B A7               [ 4]  674     RET 
                                    675 
                                    676 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    677 ;   F+ ( f#1 f#2 -- f#1+f#2 )
                                    678 ;   float addition 
                                    679 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      003177                        680     _HEADER FPLUS,2,"F+"
      00AF2C 4B CD                    1         .word LINK 
                           003179     2         LINK=.
      00AF2E 85                       3         .byte 2  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 177.
Hexadecimal [24-Bits]



      00AF2F 34 AF                    4         .ascii "F+"
      00317C                          5         FPLUS:
      00AF31 47 30 D3         [ 4]  681     CALL FALIGN 
      00AF32 CD 05 E2         [ 4]  682     CALL TOR 
      00AF32 CD 85 34         [ 4]  683     CALL DPLUS
      00AF35 AF 3F 57         [ 4]  684     CALL DSIGN 
      00AF37 CD 05 E2         [ 4]  685     CALL TOR 
      00AF37 CD 84 EF         [ 4]  686     CALL DABS 
      00AF3A 00 30 CD         [ 4]  687     CALL SCALETOM
      00AF3D 8E 89 34         [ 4]  688     CALL RFROM 
      00AF3F                        689     _QBRAN FPLUS1 
      00AF3F CD 85 03         [ 4]    1     CALL QBRAN
      00AF42 AF 37                    2     .word FPLUS1
      00AF44 CD A7 4B         [ 4]  690     CALL DNEGA  
      00AF47                        691 FPLUS1: 
      00AF47 CD AC E2         [ 4]  692     CALL ROT   
      00AF4A CD 85 18         [ 4]  693     CALL RFROM
      00AF4D AF 57 CD         [ 4]  694     CALL PLUS  
      00AF50 84 EF 00         [ 4]  695     CALL STEXP 
      00AF53 2D               [ 4]  696     RET 
                                    697 
                                    698 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    699 ;  F- ( f#1 f#2 -- f#1-f#2 )
                                    700 ;  substraction 
                                    701 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0031A9                        702     _HEADER FSUB,2,"F-"
      00AF54 CD 8E                    1         .word LINK 
                           0031AB     2         LINK=.
      00AF56 89                       3         .byte 2  
      00AF57 46 2D                    4         .ascii "F-"
      0031AE                          5         FSUB:
      00AF57 CD 8E DE         [ 4]  703     CALL FALIGN 
      00AF5A CD 8F DF         [ 4]  704     CALL TOR 
      00AF5D CD 85 B4         [ 4]  705     CALL DSUB
      00AF60 CD 87 5F         [ 4]  706     CALL DSIGN 
      00AF63 CD 85 51         [ 4]  707     CALL TOR 
      00AF66 81 26 46         [ 4]  708     CALL DABS 
      00AF67 CD 31 F1         [ 4]  709     CALL SCALETOM 
      00AF67 CD 86 62         [ 4]  710     CALL RFROM 
      0031C6                        711     _QBRAN FSUB1 
      00AF6A CD 86 99         [ 4]    1     CALL QBRAN
      00AF6D CD 85                    2     .word FSUB1
      00AF6F 81 CD 84         [ 4]  712     CALL DNEGA 
      0031CE                        713 FSUB1:
      00AF72 EF 00 45         [ 4]  714     CALL ROT 
      00AF75 CD 89 7A         [ 4]  715     CALL RFROM
      00AF78 CD 85 18         [ 4]  716     CALL PLUS  
      00AF7B AF A8 CD         [ 4]  717     CALL STEXP 
      00AF7E 8C               [ 4]  718     RET 
                                    719 
                                    720 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    721 ; /mod10  ( m -- m/10 r )
                                    722 ; divide mantissa by 10 
                                    723 ; return quotient and remainder 
                                    724 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 178.
Hexadecimal [24-Bits]



      0031DB                        725 UMOD10:
      0031DB                        726     _DOLIT 10 
      00AF7F 13 CD 85         [ 4]    1     CALL DOLIT 
      00AF82 B4 CD                    2     .word 10 
      00AF84 8C 20 CD         [ 4]  727     CALL DSLMOD
      00AF87 86 99 CD         [ 4]  728     CALL ROT  
      00AF8A 85               [ 4]  729     RET 
                                    730 
                                    731 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    732 ;   SCALE>M ( ud1 -- e ud2 )
                                    733 ;   scale down a double  
                                    734 ;   by repeated d/10
                                    735 ;   until ud<=MAX_MANTISSA   
                                    736 ;   e is log10 exponent of scaled down
                                    737 ;   ud2 is scaled down ud1 
                                    738 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0031E7                        739     _HEADER SCALETOM,7,"SCALE>M"
      00AF8B 18 AF                    1         .word LINK 
                           0031E9     2         LINK=.
      00AF8D AB                       3         .byte 7  
      00AF8E CD 8C 7F CD 86 99 CD     4         .ascii "SCALE>M"
      0031F1                          5         SCALETOM:
      00AF95 A7 E2 CD         [ 4]  740     CALL ZERO 
      00AF98 A5 7E CD         [ 4]  741     CALL NROT 
      0031F7                        742 SCAL1:
      00AF9B 86 62 CD         [ 4]  743     CALL DUPP 
      0031FA                        744     _DOLIT 0X7F 
      00AF9E A5 AB CD         [ 4]    1     CALL DOLIT 
      00AFA1 85 18                    2     .word 0X7F 
      00AFA3 AF B2 1C         [ 4]  745     CALL UGREAT 
      003202                        746     _QBRAN SCAL2  
      00AFA6 00 04 98         [ 4]    1     CALL QBRAN
      00AFA8 32 1B                    2     .word SCAL2
      00AFA8 CD 85 B4         [ 4]  747     CALL UMOD10 
      00AFAB                        748     _DROP 
      00AFAB 1C 00 04         [ 2]    1     ADDW X,#CELLL  
      00AFAE CD 8C 7F         [ 4]  749     CALL ROT 
      00AFB1 81 0B 93         [ 4]  750     CALL ONEP 
      00AFB2 CD 07 FC         [ 4]  751     CALL NROT  
      003216                        752     _BRAN SCAL1 
      00AFB2 1C 00 04         [ 4]    1     CALL BRAN 
      00AFB5 CD 85                    2     .word SCAL1 
      00321B                        753 SCAL2: 
      00AFB7 B4               [ 4]  754     RET 
                                    755 
                                    756 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    757 ;  UDIV10 ( ut -- ut )
                                    758 ;  divide a 48 bits uint by 10 
                                    759 ;  used to scale down MM* 
                                    760 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00321C                        761 UDIV10:
      00AFB8 CD 85            [ 1]  762     LDW Y,X 
      00AFBA 18 AF            [ 2]  763     LDW Y,(Y)
      00AFBC C0 CD            [ 1]  764     LD A,#10 
      00AFBE 89 06            [ 2]  765     DIV Y,A 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 179.
Hexadecimal [24-Bits]



      00AFC0 FF               [ 2]  766     LDW (X),Y 
      00AFC0 CD 84            [ 1]  767     LD YH,A 
      00AFC2 EF FF            [ 1]  768     LD A,(2,X)
      00AFC4 FF 81            [ 1]  769     LD YL,A 
      00AFC6 AE BA            [ 1]  770     LD A,#10 
      00AFC8 05 46            [ 2]  771     DIV Y,A 
      00AFCA 4C 4F            [ 1]  772     LD YH,A 
      00AFCC 41 54            [ 1]  773     LD A,YL 
      00AFCE 3F 02            [ 1]  774     LD (2,X),A 
      00AFCF E6 03            [ 1]  775     LD A,(3,X)
      00AFCF CD 85            [ 1]  776     LD YL,A 
      00AFD1 18 AF            [ 1]  777     LD A,#10 
      00AFD3 D9 CD            [ 2]  778     DIV Y,A 
      00AFD5 85 34            [ 1]  779     LD YH,A 
      00AFD7 B0 7E            [ 1]  780     LD A,YL 
      00AFD9 E7 03            [ 1]  781     LD (3,X),A 
      00AFD9 CD 87            [ 1]  782     LD A,(4,X)
      00AFDB 5F CD            [ 1]  783     LD YL,A 
      00AFDD 85 63            [ 1]  784     LD A,#10 
      00AFDF CD 84            [ 2]  785     DIV Y,A 
      00AFE1 EF 00            [ 1]  786     LD YH,A 
      00AFE3 0A CD            [ 1]  787     LD A,YL 
      00AFE5 89 7A            [ 1]  788     LD (4,X),A 
      00AFE7 CD 85            [ 1]  789     LD A,(5,X)
      00AFE9 18 B0            [ 1]  790     LD YL,A 
      00AFEB 7E CD            [ 1]  791     LD A,#10 
      00AFED 86 62            [ 2]  792     DIV Y,A 
      00AFEF CD 86            [ 1]  793     LD A,YL 
      00AFF1 62 CD            [ 1]  794     LD (5,X),A 
      00AFF3 86               [ 4]  795     RET 
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
      00325E                        806     _HEADER MMSTAR,3,"MM*"
      00AFF4 99 CD                    1         .word LINK 
                           003260     2         LINK=.
      00AFF6 85                       3         .byte 3  
      00AFF7 81 CD 84                 4         .ascii "MM*"
      003264                          5         MMSTAR:
      00AFFA EF 00 2E         [ 4]  807     CALL DDUP
      00AFFD CD 89 7A         [ 4]  808     CALL DZEQUAL
      00326A                        809     _TBRAN MMSTA2
      00B000 CD 85 18         [ 4]    1     CALL TBRAN 
      00B003 B0 3E                    2     .word MMSTA2 
      00326F                        810 MMSTA1:
      00B005 CD 8C 13         [ 4]  811     CALL DOVER 
      00B008 CD 85 B4         [ 4]  812     CALL DZEQUAL 
      003275                        813     _QBRAN MMSTA3 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 180.
Hexadecimal [24-Bits]



      00B00B CD 8C 20         [ 4]    1     CALL QBRAN
      00B00E CD 86                    2     .word MMSTA3
      00327A                        814 MMSTA2: ; ( -- 0 0 0 )
      00B010 99 CD 86         [ 2]  815     ADDW X,#2 
      00B013 62 CD            [ 1]  816     CLRW Y 
      00B015 A5               [ 2]  817     LDW (X),Y 
      00B016 AB CD            [ 2]  818     LDW (2,X),Y
      00B018 86 99            [ 2]  819     LDW (4,X),Y 
      00B01A CD               [ 4]  820     RET 
      003285                        821 MMSTA3:
      00B01B 85 B4 CD         [ 4]  822     CALL DSIGN 
      00B01E 86 A9 CD         [ 4]  823     CALL TOR    ; R: m2sign 
      00B021 89 52 CD         [ 4]  824     CALL DABS   ; m1 um2 
      00B024 86 62 CD         [ 4]  825     CALL DSWAP  ; um2 m1 
      00B027 86 99 CD         [ 4]  826     CALL DSIGN  ; um2 m1 m1sign 
      00B02A 85 18 B0         [ 4]  827     CALL RFROM 
      00B02D 33 CD 85         [ 4]  828     CALL XORR 
      00B030 34 B0 47         [ 4]  829     CALL TOR   ; R: product_sign 
      00B033 CD 86 A9         [ 4]  830     CALL DABS  ; um2 um1  
      00B036 1C 00 02         [ 4]  831     CALL DTOR  ; um2 
      00B039 CD 85 34         [ 4]  832     CALL DUPP  ; um2 um2hi 
      00B03C B0 4F 45         [ 4]  833     CALL RAT   ; um2 um2hi um1hi
                                    834 ; first partial product  
                                    835 ; pd1=um2hi*um1hi 
      00B03E CD 0B 12         [ 4]  836     CALL STAR 
      00B03E CD 85 B4         [ 4]  837     CALL ZERO 
      00B041 CD 8C 7F         [ 4]  838     CALL SWAPP ; pd1<<16  
      00B044 CD 86 62         [ 4]  839     CALL DSWAP ; pd1 um2 
      00B047 CD 06 41         [ 4]  840     CALL OVER  ; pd1 um2 um2lo 
      00B047 CD AF 67         [ 4]  841     CALL RFROM ; pd1 um2 um2lo um1hi 
                                    842 ; pd2=um2lo*um1hi 
      00B04A CD 85 18         [ 4]  843     CALL UMSTA ; pd1 um2 pd2 
      00B04D B0 7B 62         [ 4]  844     CALL DSWAP ; pd1 pd2 um2 
      00B04F CD 05 45         [ 4]  845     CALL RAT   ; pd1 pd2 um2 um1lo 
                                    846 ; pd3= um2hi*um1lo 
      00B04F CD 85 B4         [ 4]  847     CALL UMSTA ; pd1 pd2 um2lo pd3 
      00B052 CD 89 52         [ 4]  848     CALL ROT ; pd1 pd2 pd3 um2lo 
      00B055 CD 88 7C         [ 4]  849     CALL TOR ; pd1 pd2 pd3 R: psign um1lo um2lo 
                                    850 ; pd1+pd2+pd3  pd1
      00B058 CD 85 B4         [ 4]  851     CALL DPLUS 
      00B05B CD 85 18         [ 4]  852     CALL DPLUS  
      00B05E B0 63 CD         [ 4]  853     CALL DRFROM ; triple um2lo um1lo 
                                    854 ; last partial product um2lo*um1lo 
      00B061 89 18 C8         [ 4]  855     CALL UMSTA ; prod pd4 
                                    856 ; mm*=prod<<16+pd4  
      00B063 CD 28 B1         [ 4]  857     CALL DTOR ;   R: psign pd4lo pd4hi  
                                    858  ; add pd4hi to prodlo and propagate carry 
      00B063 CD 88            [ 1]  859     LDW Y,X 
      00B065 5D CD AD         [ 2]  860     LDW Y,(2,Y)  ; prodlo 
      00B068 D3 CD 88         [ 2]  861     ADDW Y,(1,SP)  ; prodlo+pd4hi 
      00B06B 5D 1C            [ 2]  862     LDW (1,SP),Y    ; plo phi  
      00B06D 00 02            [ 1]  863     LDW Y,X
      00B06F CD AD            [ 2]  864     LDW Y,(Y) ; prodhi  
      00B071 54 CD            [ 1]  865     JRNC MMSTA4
      00B073 AD 1D CD 84      [ 2]  866     ADDW Y,#1 ; add carry 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 181.
Hexadecimal [24-Bits]



      0032F0                        867 MMSTA4:     
      00B077 EF FF FD         [ 2]  868     SUBW X,#2 
      00B07A 81               [ 2]  869     LDW (X),Y 
      00B07B 90 85            [ 2]  870     POPW Y 
      00B07B CD A9            [ 2]  871     LDW (2,X),Y 
      00B07D 4F 85            [ 2]  872     POPW Y 
      00B07E EF 04            [ 2]  873     LDW (4,X),Y
      00B07E CD 8C C1         [ 4]  874     CALL ZERO 
      00B081 CD 8C 06         [ 4]  875     CALL TOR 
      003302                        876 MMSTA5:
      00B084 CD 86 79         [ 4]  877     CALL QDUP 
      003305                        878     _QBRAN MMSTA6 
      00B087 CD 86 A9         [ 4]    1     CALL QBRAN
      00B08A CD 88                    2     .word MMSTA6
      00B08C BC CD 86         [ 4]  879     CALL UDIV10 
      00B08F 86 CD 8C         [ 4]  880     CALL RFROM 
      00B092 7F 81 AF         [ 4]  881     CALL ONEP 
      00B095 C8 06 4C         [ 4]  882     CALL TOR 
      003316                        883     _BRAN MMSTA5 
      00B098 53 43 41         [ 4]    1     CALL BRAN 
      00B09B 4C 45                    2     .word MMSTA5 
                                    884 ; now scale to double 
                                    885 ; scale further <= MAX_MANTISSA 
      00B09D                        886 MMSTA6: 
      00B09D CD AD A1         [ 4]  887     CALL RFROM 
      00B0A0 CD 8C 8A         [ 4]  888     CALL NROT 
      00B0A3 CD 89 52         [ 4]  889     CALL SCALETOM
      00B0A6 CD 86 62         [ 4]  890     CALL DTOR 
      00B0A9 CD 84 EF         [ 4]  891     CALL PLUS 
      00B0AC 00 0A CD         [ 4]  892     CALL DRFROM 
      00B0AF A7 BC CD         [ 4]  893     CALL RFROM
      003330                        894     _QBRAN MMSTA7
      00B0B2 85 B4 CD         [ 4]    1     CALL QBRAN
      00B0B5 AD D3                    2     .word MMSTA7
      00B0B7 81 B0 96         [ 4]  895     CALL DNEGA
      003338                        896 MMSTA7:
      00B0BA 06 52 53         [ 4]  897     CALL ROT ; m e 
      00B0BD 43               [ 4]  898     RET 
                                    899 
                                    900 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    901 ;    F* ( f#1 f#2 -- f#3 )
                                    902 ;    float product 
                                    903 ;    f#3=f#1 * f#2 
                                    904 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00333C                        905     _HEADER FSTAR,2,"F*"
      00B0BE 41 4C                    1         .word LINK 
                           00333E     2         LINK=.
      00B0C0 45                       3         .byte 2  
      00B0C1 46 2A                    4         .ascii "F*"
      003341                          5         FSTAR:
      00B0C1 CD AD A1         [ 4]  906     CALL ATEXP ; f#1 m2 e2 
      00B0C4 CD 8C 8A         [ 4]  907     CALL TOR   
      00B0C7 CD 88 BC         [ 4]  908     CALL DSWAP ; m2 f#1
      00B0CA CD 86 62         [ 4]  909     CALL ATEXP ; m2 m1 e1 
      00B0CD CD 84 EF         [ 4]  910     CALL RFROM ; m2 m1 e1 e2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 182.
Hexadecimal [24-Bits]



      00B0D0 00 0A CD         [ 4]  911     CALL PLUS  ; m2 m1 e 
      00B0D3 A6 F1 CD         [ 4]  912     CALL TOR   ; m2 m1 R: e 
      00B0D6 88 5D 1C         [ 4]  913     CALL MMSTAR ; m2*m1 e   
      00B0D9 00 02 CD         [ 4]  914     CALL RFROM 
      00B0DC 85 B4 CD         [ 4]  915     CALL PLUS 
      00B0DF AD D3 81         [ 4]  916     CALL STEXP ; f#3 
      00B0E2 81               [ 4]  917     RET 
                                    918 
                                    919 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    920 ;  F/ ( f#1 f#2 -- f#3 )
                                    921 ;  float division
                                    922 ;  f#3 = f#1/f#2
                                    923 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      003363                        924     _HEADER FSLASH,2,"F/"
      00B0E2 CD 88                    1         .word LINK 
                           003365     2         LINK=.
      00B0E4 A7                       3         .byte 2  
      00B0E5 CD 89                    4         .ascii "F/"
      003368                          5         FSLASH:
      00B0E7 A6 CD 85         [ 4]  925     CALL ATEXP  ; f#1 m2 e2 
      00B0EA 18 B1 18         [ 4]  926     CALL TOR    ; f#1 m2   R: e2 
      00B0ED CD A9 31         [ 4]  927     CALL DSIGN  ; f#1 m2 m2sign 
      00B0F0 CD 88 A7         [ 4]  928     CALL TOR    ; F#1 m2 R: e2 m2s 
      00B0F3 CD 84 EF         [ 4]  929     CALL DABS   ; F#1 um2 
      00B0F6 CC CC CD         [ 4]  930     CALL DSWAP  ; m2 f#1 
      00B0F9 84 EF 0C         [ 4]  931     CALL ATEXP  ; m2 m1 e1 
      00B0FC CC CD A8         [ 4]  932     CALL ONE    ; e2 slot on rstack  
      00B0FF F4 CD 85         [ 4]  933     CALL NRAT   ; m2 m1 e1 e2 
      00B102 26 B1 15         [ 4]  934     CALL SUBB   ; m2 m1 e 
      00B105 CD 84 EF         [ 4]  935     CALL ONE    ; e slot on rstack 
      00B108 00 0A CD         [ 4]  936     CALL NRSTO  ; m2 m1 R: e m2s 
      00B10B A7 9A CD         [ 4]  937     CALL DSIGN  ; m2 m1 m1sign 
      00B10E A9 4F CD         [ 4]  938     CALL RFROM  ; m2 m1 m1s m2s  
      00B111 8C 20 20         [ 4]  939     CALL XORR   ; m2 m1 quot_sign R: e 
      00B114 CD 05 34         [ 4]  940     CALL RFROM   
      00B115 CD 28 B1         [ 4]  941     CALL DTOR   ; m2 m1 R: qs e  
      00B115 CD A9 4F         [ 4]  942     CALL DABS   ; um2 um1 R: qs e  
      00B118 CD 27 62         [ 4]  943     CALL DSWAP  ; m1 m2 R: qs e
      00B118 81 08 27         [ 4]  944     CALL DDUP  ; m1 m2 m2 R: qs e
      00B119 CD 28 B1         [ 4]  945     CALL DTOR  ; m1 m2 R: qs e m2 ( keep divisor need later ) 
      00B119 CD 88 A7         [ 4]  946     CALL UDSLMOD ; remainder m1/m2 R: e m2 
      0033AA                        947 FSLASH1: 
      00B11C CD 89 D3         [ 4]  948     CALL DOVER ; if remainder null done 
      00B11F CD 85 18         [ 4]  949     CALL DZEQUAL 
      0033B0                        950     _TBRAN FSLASH8 
      00B122 B1 48 CD         [ 4]    1     CALL TBRAN 
      00B125 A9 31                    2     .word FSLASH8 
                                    951 ; get fractional digits from remainder until mantissa saturate
                                    952 ; remainder mantissa R: e divisor 
                                    953 ; check for mantissa saturation 
      00B127 CD 88 A7         [ 4]  954     CALL DDUP 
      0033B8                        955     _DOLIT 0XCCCC 
      00B12A CD A8 B7         [ 4]    1     CALL DOLIT 
      00B12D CD 85                    2     .word 0XCCCC 
      0033BD                        956     _DOLIT 0xC
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 183.
Hexadecimal [24-Bits]



      00B12F 26 B1 45         [ 4]    1     CALL DOLIT 
      00B132 CD 84                    2     .word 0xC 
      00B134 EF 00 0A         [ 4]  957     CALL DGREAT 
      0033C5                        958     _TBRAN FSLASH8 ; another loop would result in mantissa overflow 
      00B137 CD 8C 7F         [ 4]    1     CALL TBRAN 
      00B13A CD AB                    2     .word FSLASH8 
                                    959 ; multiply mantissa by 10 
      0033CA                        960     _DOLIT 10 
      00B13C E5 CD A9         [ 4]    1     CALL DOLIT 
      00B13F 4F CD                    2     .word 10 
      00B141 8C 13 20         [ 4]  961     CALL ZERO 
      00B144 D4 2A 20         [ 4]  962     CALL DSTAR 
                                    963 ; mutliply remainder by 10     
      00B145 CD 27 62         [ 4]  964     CALL DSWAP 
      0033D8                        965     _DOLIT 10 
      00B145 CD A9 4F         [ 4]    1     CALL DOLIT 
      00B148 00 0A                    2     .word 10 
      00B148 81 B0 BA         [ 4]  966     CALL ZERO 
      00B14B 07 46 2D         [ 4]  967     CALL DSTAR 
                                    968 ; divide remainder by m2     
      00B14E 41 4C 49         [ 4]  969     CALL DRAT  ; mantissa remainder divisor R: e divisor 
      00B151 47 4E 83         [ 4]  970     CALL UDSLMOD ; mantissa dr dq R: qs e divisor 
      00B153 CD 27 62         [ 4]  971     CALL DSWAP ; mantissa frac_digit remainder R: qs e divisor  
      00B153 CD AD A1         [ 4]  972     CALL DTOR  ; mantissa frac_digit R: qs e divisor remainder 
      00B156 CD 86 62         [ 4]  973     CALL DPLUS ; mantissa+frac_digit 
      00B159 CD A7 E2         [ 4]  974     CALL DRFROM ; mantissa remainder R: qs e divisor  
      00B15C CD AD A1         [ 4]  975     CALL DSWAP  ; remainder mantissa  
                                    976 ; increment e 
      0033F8                        977     _DOLIT 2    ; e slot on rstack 
      00B15F CD 86 62         [ 4]    1     CALL DOLIT 
      00B162 CD A7                    2     .word 2 
      00B164 E2 CD A9         [ 4]  978     CALL NRAT   ;  2 NR@ -- e 
      00B167 67 CD 89         [ 4]  979     CALL ONEP   ; increment exponent 
      003403                        980     _DOLIT 2 
      00B16A 7A CD 85         [ 4]    1     CALL DOLIT 
      00B16D 26 B1                    2     .word 2 
      00B16F F0 CD A9         [ 4]  981     CALL NRSTO  ; e 2 NR! , update e on rstack     
      00340B                        982     _BRAN FSLASH1
      00B172 67 CD 89         [ 4]    1     CALL BRAN 
      00B175 D3 CD                    2     .word FSLASH1 
      003410                        983 FSLASH8: ; remainder mantissa R: qs e divisor 
      00B177 85 18 B1         [ 4]  984     CALL DSWAP  
      003413                        985     _DDROP  ; drop remainder     
      00B17A 8C CD A9         [ 2]    1    ADDW X,#2*CELLL 
      00B17D 4F CD 86         [ 4]  986     CALL DRFROM
      003419                        987     _DDROP  ; drop divisor 
      00B180 A9 CD B0         [ 2]    1    ADDW X,#2*CELLL 
      00B183 E2 CD 86         [ 4]  988     CALL JFETCH    ; quotient sign 
      00341F                        989     _QBRAN FSLASH9 
      00B186 A9 CD A9         [ 4]    1     CALL QBRAN
      00B189 31 20                    2     .word FSLASH9
      00B18B 0F 08 98         [ 4]  990     CALL DNEGA  
      00B18C                        991 FSLASH9:
      00B18C CD A7 E2         [ 4]  992     CALL RFROM  ; exponent 
      00B18F CD A9 4F         [ 4]  993     CALL STEXP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 184.
Hexadecimal [24-Bits]



      00B192 CD B0 E2         [ 4]  994     CALL RFROM 
      003430                        995     _DROP ; drop qs 
      00B195 CD A9 31         [ 2]    1     ADDW X,#CELLL  
      00B198 CD               [ 4]  996     RET 
                                    997 
                                    998 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    999 ;   D>F  ( # -- f# )
                                   1000 ;   convert double to float 
                                   1001 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      003434                       1002     _HEADER DTOF,3,"D>F"
      00B199 A7 E2                    1         .word LINK 
                           003436     2         LINK=.
      00B19B 03                       3         .byte 3  
      00B19B CD A9 67                 4         .ascii "D>F"
      00343A                          5         DTOF:
      00B19E CD 89 7A         [ 4] 1003     CALL DSIGN 
      00B1A1 CD 85 26         [ 4] 1004     CALL TOR
      00B1A4 B1 F0 CD         [ 4] 1005     CALL DABS  
      003443                       1006 DTOF1:      
      00B1A7 A9 67 CD         [ 4] 1007     CALL SCALETOM 
      00B1AA 89 D3 CD         [ 4] 1008     CALL RFROM
      003449                       1009     _QBRAN DTOF2 
      00B1AD 85 18 B1         [ 4]    1     CALL QBRAN
      00B1B0 C2 CD                    2     .word DTOF2
      00B1B2 A7 E2 CD         [ 4] 1010     CALL DNEGA 
      003451                       1011 DTOF2: 
      00B1B5 A9 4F CD         [ 4] 1012     CALL ROT 
      00B1B8 B1 19 CD         [ 4] 1013     CALL STEXP 
      00B1BB 86               [ 4] 1014     RET 
                                   1015 
                                   1016 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1017 ;   F>D  ( f# -- # )
                                   1018 ;  convert float to double 
                                   1019 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      003458                       1020     _HEADER FTOD,3,"F>D"
      00B1BC A9 CD                    1         .word LINK 
                           00345A     2         LINK=.
      00B1BE A9                       3         .byte 3  
      00B1BF 31 20 0F                 4         .ascii "F>D"
      00B1C2                          5         FTOD:
      00B1C2 CD A9 4F         [ 4] 1021     CALL ATEXP ; m e 
      00B1C5 CD 86 A9         [ 4] 1022     CALL QDUP
      003464                       1023     _QBRAN FTOD9
      00B1C8 CD B1 19         [ 4]    1     CALL QBRAN
      00B1CB CD 86                    2     .word FTOD9
      00B1CD A9 CD A9         [ 4] 1024     CALL TOR 
      00B1D0 31 26 57         [ 4] 1025     CALL DSIGN 
      00B1D1 CD 07 FC         [ 4] 1026     CALL NROT 
      00B1D1 CD A9 67         [ 4] 1027     CALL DABS
      00B1D4 CD 89 7A         [ 4] 1028     CALL RFROM  
      00B1D7 CD 85 26         [ 4] 1029     CALL DUPP   
      00B1DA B1 F0 CD         [ 4] 1030     CALL ZLESS 
      00347E                       1031     _QBRAN FTOD4 
      00B1DD A9 4F CD         [ 4]    1     CALL QBRAN
      00B1E0 88 A7                    2     .word FTOD4
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 185.
Hexadecimal [24-Bits]



                                   1032 ; negative exponent 
      00B1E2 CD 89 D3         [ 4] 1033     CALL ABSS 
      00B1E5 CD 85 26         [ 4] 1034     CALL TOR
      003489                       1035     _BRAN FTOD2  
      00B1E8 B1 ED CD         [ 4]    1     CALL BRAN 
      00B1EB 86 A9                    2     .word FTOD2 
      00B1ED                       1036 FTOD1:
      00B1ED CD A9 31         [ 4] 1037     CALL DDUP 
      00B1F0 CD 28 37         [ 4] 1038     CALL DZEQUAL 
      003494                       1039     _TBRAN FTOD3 
      00B1F0 CD A9 4F         [ 4]    1     CALL TBRAN 
      00B1F3 1C 00                    2     .word FTOD3 
      003499                       1040     _DOLIT 10 
      00B1F5 02 81 B1         [ 4]    1     CALL DOLIT 
      00B1F8 4B 02                    2     .word 10 
      00B1FA 46 2B 71         [ 4] 1041     CALL DSLMOD 
      00B1FC CD 07 DD         [ 4] 1042     CALL ROT 
      0034A4                       1043     _DROP
      00B1FC CD B1 53         [ 2]    1     ADDW X,#CELLL  
      0034A7                       1044 FTOD2:      
      0034A7                       1045     _DONXT FTOD1
      00B1FF CD 86 62         [ 4]    1     CALL DONXT 
      00B202 CD AB                    2     .word FTOD1 
      0034AC                       1046     _BRAN FTOD8   
      00B204 F4 CD A6         [ 4]    1     CALL BRAN 
      00B207 D7 CD                    2     .word FTOD8 
      0034B1                       1047 FTOD3: 
      00B209 86 62 CD         [ 4] 1048     CALL RFROM 
      0034B4                       1049     _DROP 
      00B20C A6 C6 CD         [ 2]    1     ADDW X,#CELLL  
      0034B7                       1050     _BRAN FTOD8  
      00B20F B2 71 CD         [ 4]    1     CALL BRAN 
      00B212 85 B4                    2     .word FTOD8 
                                   1051 ; positive exponent 
      0034BC                       1052 FTOD4:
      00B214 CD 85 18         [ 4] 1053     CALL TOR 
      0034BF                       1054     _BRAN FTOD6
      00B217 B2 1C CD         [ 4]    1     CALL BRAN 
      00B21A 89 18                    2     .word FTOD6 
      00B21C                       1055 FTOD5:
      00B21C CD 88 5D         [ 4] 1056     CALL DDUP 
      0034C7                       1057     _DOLIT 0XCCCC
      00B21F CD 85 B4         [ 4]    1     CALL DOLIT 
      00B222 CD 88                    2     .word 0XCCCC 
      0034CC                       1058     _DOLIT 0XCCC  
      00B224 BC CD AD         [ 4]    1     CALL DOLIT 
      00B227 D3 81                    2     .word 0XCCC 
      00B229 B1 F9 02         [ 4] 1059     CALL DGREAT 
      0034D4                       1060     _TBRAN FTOD3 
      00B22C 46 2D A6         [ 4]    1     CALL TBRAN 
      00B22E 34 B1                    2     .word FTOD3 
      0034D9                       1061     _DOLIT 10 
      00B22E CD B1 53         [ 4]    1     CALL DOLIT 
      00B231 CD 86                    2     .word 10 
      00B233 62 CD AC         [ 4] 1062     CALL ZERO 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 186.
Hexadecimal [24-Bits]



      00B236 26 CD A6         [ 4] 1063     CALL DSTAR 
      0034E4                       1064 FTOD6: 
      0034E4                       1065     _DONXT FTOD5 
      00B239 D7 CD 86         [ 4]    1     CALL DONXT 
      00B23C 62 CD                    2     .word FTOD5 
      0034E9                       1066 FTOD8:
      00B23E A6 C6 CD         [ 4] 1067     CALL ROT 
      0034EC                       1068     _QBRAN FTOD9 
      00B241 B2 71 CD         [ 4]    1     CALL QBRAN
      00B244 85 B4                    2     .word FTOD9
      00B246 CD 85 18         [ 4] 1069     CALL DNEGA
      0034F4                       1070 FTOD9:          
      00B249 B2               [ 4] 1071     RET 
                                   1072 
                                   1073 
                                   1074 ;;;;;;;;;;;;;;;;;;;;;;;;
                                   1075 ;   F0< ( f# -- f )
                                   1076 ;   true if f#<0
                                   1077 ;;;;;;;;;;;;;;;;;;;;;;;;
      0034F5                       1078     _HEADER FZLESS,3,"F0<"
      00B24A 4E CD                    1         .word LINK 
                           0034F7     2         LINK=.
      00B24C 89                       3         .byte 3  
      00B24D 18 30 3C                 4         .ascii "F0<"
      00B24E                          5         FZLESS:
      00B24E CD 88 5D         [ 4] 1079     CALL ATEXP 
      0034FE                       1080     _DROP 
      00B251 CD 85 B4         [ 2]    1     ADDW X,#CELLL  
      00B254 CD 88 BC         [ 4] 1081     CALL SWAPP 
      003504                       1082     _DROP 
      00B257 CD AD D3         [ 2]    1     ADDW X,#CELLL  
      00B25A 81 06 50         [ 4] 1083     CALL ZLESS 
      00B25B 81               [ 4] 1084     RET
                                   1085 
                                   1086 ;;;;;;;;;;;;;;;;;;;;;;;;
                                   1087 ;   F< ( f#1 f#2 -- f )
                                   1088 ; true if f#1 < f#1 
                                   1089 ;;;;;;;;;;;;;;;;;;;;;;;
      00350B                       1090     _HEADER FLESS,2,"F<"
      00B25B CD 84                    1         .word LINK 
                           00350D     2         LINK=.
      00B25D EF                       3         .byte 2  
      00B25E 00 0A                    4         .ascii "F<"
      003510                          5         FLESS:
      00B260 CD A6 F1         [ 4] 1091     CALL FSUB  
      00B263 CD 88 5D         [ 2] 1092     JP FZLESS
                                   1093 
                                   1094 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1095 ;   F> ( f#1 f#2 -- f )
                                   1096 ;   true fi f#1>f#2
                                   1097 ;;;;;;;;;;;;;;;;;;;;;;;;;
      003516                       1098     _HEADER FGREAT,2,"F>"
      00B266 81 B2                    1         .word LINK 
                           003518     2         LINK=.
      00B268 2B                       3         .byte 2  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 187.
Hexadecimal [24-Bits]



      00B269 07 53                    4         .ascii "F>"
      00351B                          5         FGREAT:
      00B26B 43 41 4C         [ 4] 1099     CALL DSWAP 
      00B26E 45 3E 4D         [ 2] 1100     JP FLESS 
                                   1101 
                                   1102 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1103 ;   F= ( f#1 f#2 -- f ) 
                                   1104 ;   true fi f#1==f#2 
                                   1105 ;;;;;;;;;;;;;;;;;;;;;;;;;
      00B271                       1106     _HEADER FEQUAL,2,"F="
      00B271 CD 8C                    1         .word LINK 
                           003523     2         LINK=.
      00B273 7F                       3         .byte 2  
      00B274 CD 88                    4         .ascii "F="
      003526                          5         FEQUAL:
      00B276 7C 28 53         [ 2] 1107     JP DEQUAL 
                                   1108 
                                   1109 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1110 ;   F0= ( f# -- f )
                                   1111 ;   true if f# is 0.0 
                                   1112 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      00B277                       1113     _HEADER FZEQUAL,3,"F0="
      00B277 CD 86                    1         .word LINK 
                           00352B     2         LINK=.
      00B279 99                       3         .byte 3  
      00B27A CD 84 EF                 4         .ascii "F0="
      00352F                          5         FZEQUAL:
      00B27D 00 7F CD         [ 4] 1114     CALL ATEXP 
      003532                       1115     _DROP 
      00B280 89 BD CD         [ 2]    1     ADDW X,#CELLL  
      00B283 85 18 B2         [ 2] 1116     JP DZEQUAL  
                                   1117 
                                   1118 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1119 ;  FNEGATE ( f#1 -- f#2 )
                                   1120 ;  f#2 is negation of f#1 
                                   1121 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      003538                       1122     _HEADER FNEGA,7,"FNEGATE"
      00B286 9B CD                    1         .word LINK 
                           00353A     2         LINK=.
      00B288 B2                       3         .byte 7  
      00B289 5B 1C 00 02 CD 88 5D     4         .ascii "FNEGATE"
      003542                          5         FNEGA:
      00B290 CD 8C 13         [ 4] 1123     CALL ATEXP 
      00B293 CD 88 7C         [ 4] 1124     CALL TOR 
      00B296 CD 85 34         [ 4] 1125     CALL DNEGA
      00B299 B2 77 34         [ 4] 1126     CALL RFROM 
      00B29B CD 2D 53         [ 4] 1127     CALL STEXP 
      00B29B 81 2C D4         [ 4] 1128     CALL SFN 
      00B29C 81               [ 4] 1129     RET 
                                   1130 
                                   1131 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1132 ;  FABS ( f#1 -- abs(f#1) )
                                   1133 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      003555                       1134     _HEADER FABS,4,"FABS"
      00B29C 90 93                    1         .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 188.
Hexadecimal [24-Bits]



                           003557     2         LINK=.
      00B29E 90                       3         .byte 4  
      00B29F FE A6 0A 90              4         .ascii "FABS"
      00355C                          5         FABS:
      00B2A3 62 FF 90         [ 4] 1135     CALL ATEXP 
      00B2A6 95 E6 02         [ 4] 1136     CALL TOR 
      00B2A9 90 97 A6         [ 4] 1137     CALL DUPP 
      003565                       1138     _DOLIT 0X80 
      00B2AC 0A 90 62         [ 4]    1     CALL DOLIT 
      00B2AF 90 95                    2     .word 0X80 
      00B2B1 90 9F E7         [ 4] 1139     CALL ANDD 
      00356D                       1140     _QBRAN FABS1
      00B2B4 02 E6 03         [ 4]    1     CALL QBRAN
      00B2B7 90 97                    2     .word FABS1
      00B2B9 A6 0A 90         [ 4] 1141     CALL DNEGA 
      003575                       1142 FABS1: 
      00B2BC 62 90 95         [ 4] 1143     CALL RFROM 
      00B2BF 90 9F E7         [ 4] 1144     CALL STEXP 
      00B2C2 03 E6 04         [ 4] 1145     CALL SFN 
      00B2C5 90               [ 4] 1146     RET 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 189.
Hexadecimal [24-Bits]



                                   4568 .endif 
                                   4569 
                                   4570 ;===============================================================
                                   4571 
                           003557  4572 LASTN =	LINK   ;last name defined
                                   4573 
                                   4574 ; application code begin here
      003580                       4575 	.bndry 128 ; align on flash block  
      003580                       4576 app_space: 
                                   4577 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 190.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   6 AB1        0008F5 R   |   6 ABOR1      0013EA R
  6 ABOR2      001401 R   |   6 ABORQ      0013E2 R   |   6 ABORT      0013D3 R
  6 ABRTQ      0016C4 R   |   6 ABSS       0008EC R   |   6 ACCEP      001369 R
  6 ACCP1      001372 R   |   6 ACCP2      001398 R   |   6 ACCP3      00139B R
  6 ACCP4      00139D R   |     ADC_CR1 =  005401     |     ADC_CR1_=  000000 
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
  6 AFT        0016AF R   |   6 AGAIN      001605 R   |   6 AHEAD      001662 R
  6 ALLOT      001512 R   |   6 ANDD       000676 R   |     APP_CP  =  004004 
    APP_LAST=  004000     |     APP_RUN =  004002     |     APP_VP  =  004006 
  6 AT         0004E3 R   |   6 ATEXE      000D12 R   |   6 ATEXP      002D21 R
  6 ATEXP1     002D36 R   |   6 ATEXP2     002D46 R   |   6 AUTORUN    000129 R
    AWU_APR =  0050F1     |     AWU_CSR =  0050F0     |     AWU_TBR =  0050F2 
    B0_MASK =  000001     |     B115200 =  000006     |   6 B115K2     0003E0 R
    B19200  =  000003     |   6 B19K2      0003BD R   |     B1_MASK =  000002 
    B230400 =  000007     |     B2400   =  000000     |   6 B2K4       00038E R
    B2_MASK =  000004     |     B38400  =  000004     |     B3_MASK =  000008 
    B460800 =  000008     |     B4800   =  000001     |   6 B4K8       00039C R
    B4_MASK =  000010     |     B57600  =  000005     |   6 B57K6      0003CE R
    B5_MASK =  000020     |     B6_MASK =  000040     |     B7_MASK =  000080 
    B921600 =  000009     |     B9600   =  000002     |   6 B9K6       0003AC R
  6 BACK1      001311 R   |   6 BASE       0006DF R   |     BASEE   =  00000A 
  6 BAUD       0003F0 R   |     BCNT    =  000001     |   6 BCOMP      001555 R
  6 BDIGS      000DF9 R   |     BEEP_BIT=  000004     |     BEEP_CSR=  0050F3 
    BEEP_MAS=  000010     |     BEEP_POR=  00000F     |   6 BEGIN      0015E7 R
    BIT0    =  000000     |     BIT1    =  000001     |     BIT2    =  000002 
    BIT3    =  000003     |     BIT4    =  000004     |     BIT5    =  000005 
    BIT6    =  000006     |     BIT7    =  000007     |   6 BKSLA      001166 R
  6 BKSP       0012E1 R   |     BKSPP   =  000008     |   6 BLANK      000BF2 R
    BLOCK_SI=  000080     |     BOOT_ROM=  006000     |     BOOT_ROM=  007FFF 
  6 BRAN       0004B4 R   |     BTW     =  000001     |   6 BUF2ROW    002195 R
  6 BYE        0000B6 R   |     CADR    =  000003     |     CALLL   =  0000CD 
  6 CALLOT     0023DE R   |     CAN_DGR =  005426     |     CAN_FPSR=  005427 
    CAN_IER =  005425     |     CAN_MCR =  005420     |     CAN_MSR =  005421 
    CAN_P0  =  005428     |     CAN_P1  =  005429     |     CAN_P2  =  00542A 
    CAN_P3  =  00542B     |     CAN_P4  =  00542C     |     CAN_P5  =  00542D 
    CAN_P6  =  00542E     |     CAN_P7  =  00542F     |     CAN_P8  =  005430 
    CAN_P9  =  005431     |     CAN_PA  =  005432     |     CAN_PB  =  005433 
    CAN_PC  =  005434     |     CAN_PD  =  005435     |     CAN_PE  =  005436 
    CAN_PF  =  005437     |     CAN_RFR =  005424     |     CAN_TPR =  005423 
    CAN_TSR =  005422     |     CARRY   =  00002A     |     CASE_SEN=  000000 
  6 CAT        000501 R   |   6 CCOMMA     001537 R   |     CC_C    =  000000 
    CC_H    =  000004     |     CC_I0   =  000003     |     CC_I1   =  000005 
    CC_N    =  000002     |     CC_V    =  000007     |     CC_Z    =  000001 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 191.
Hexadecimal [24-Bits]

Symbol Table

    CELLL   =  000002     |   6 CELLM      000B77 R   |   6 CELLP      000B68 R
  6 CELLS      000B86 R   |     CFG_GCR =  007F60     |     CFG_GCR_=  000001 
    CFG_GCR_=  000000     |   6 CHAR1      000F4F R   |   6 CHAR2      000F52 R
  6 CHKIVEC    002083 R   |     CLKOPT  =  004807     |     CLKOPT_C=  000002 
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
    CLK_SWR_=  0000D2     |   6 CMOV1      000D31 R   |   6 CMOV2      000D49 R
  6 CMOVE      000D29 R   |     CNTDWN  =  000032     |   6 CNTXT      000762 R
  6 COLD       001B84 R   |   6 COLD1      001B84 R   |   6 COLON      001867 R
  6 COMMA      001520 R   |   6 COMPI      001565 R   |     COMPO   =  000040 
  6 CONSTANT   001911 R   |   6 COPYRIGH   001ACD R   |   6 COUNT      000CC5 R
  6 CPP        00077E R   |     CPU_A   =  007F00     |     CPU_CCR =  007F0A 
    CPU_PCE =  007F01     |     CPU_PCH =  007F02     |     CPU_PCL =  007F03 
    CPU_SPH =  007F08     |     CPU_SPL =  007F09     |     CPU_XH  =  007F04 
    CPU_XL  =  007F05     |     CPU_YH  =  007F06     |     CPU_YL  =  007F07 
  6 CR         000F77 R   |   6 CREAT      0018AD R   |     CRR     =  00000D 
  6 CSTOR      0004F0 R   |   6 CTABLE     0023FF R   |   6 CTAT       002420 R
  6 CTINIT     002448 R   |   6 D2SLASH    002991 R   |   6 D2STAR     0029A8 R
  6 DABS       002646 R   |   6 DABS1      00264E R   |   6 DAT        000CA9 R
    DATSTK  =  001680     |   6 DBLVER     0024CC R   |   6 DCLZ       002790 R
  6 DCLZ1      002799 R   |   6 DCLZ4      0027A2 R   |   6 DCLZ8      0027AF R
  6 DCONST     001946 R   |   6 DDIG       0026B2 R   |   6 DDIGS      0026CB R
  6 DDOT       0026E2 R   |   6 DDOT0      0026F6 R   |   6 DDOT1      00270C R
  6 DDROP      00081C R   |   6 DDSLMOD    002B35 R   |   6 DDSTAR3    002A79 R
  6 DDUP       000827 R   |     DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF 
  6 DECIM      000EA9 R   |   6 DEPTH      000C41 R   |   6 DEQU4      002868 R
  6 DEQUAL     002853 R   |     DEVID_BA=  0048CD     |     DEVID_EN=  0048D8 
    DEVID_LO=  0048D2     |     DEVID_LO=  0048D3     |     DEVID_LO=  0048D4 
    DEVID_LO=  0048D5     |     DEVID_LO=  0048D6     |     DEVID_LO=  0048D7 
    DEVID_LO=  0048D8     |     DEVID_WA=  0048D1     |     DEVID_XH=  0048CE 
    DEVID_XL=  0048CD     |     DEVID_YH=  0048D0     |     DEVID_YL=  0048CF 
  6 DGREAT     002874 R   |   6 DGTQ1      000EEE R   |   6 DI         0000C4 R
  6 DIG        000E22 R   |   6 DIGIT      000DBD R   |   6 DIGS       000E33 R
  6 DIGS1      000E33 R   |   6 DIGS2      000E40 R   |   6 DIGTQ      000EBD R
    DISCOVER=  000000     |   6 DLESS      00287F R   |   6 DLESS4     002893 R
  6 DLITER     002951 R   |   6 DLSHIFT    0029C4 R   |   6 DLSHIFT1   0029D7 R
  6 DLSHIFT2   0029EC R   |     DM_BK1RE=  007F90     |     DM_BK1RH=  007F91 
    DM_BK1RL=  007F92     |     DM_BK2RE=  007F93     |     DM_BK2RH=  007F94 
    DM_BK2RL=  007F95     |     DM_CR1  =  007F96     |     DM_CR2  =  007F97 
    DM_CSR1 =  007F98     |     DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A 
  6 DN1        0008B3 R   |   6 DNEGA      000898 R   |   6 DOCONST    001931 R
  6 DOLIT      00046F R   |   6 DONXT      000483 R   |     DOORBELL=  000000 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 192.
Hexadecimal [24-Bits]

Symbol Table

  6 DOSTR      000F87 R   |   6 DOT        00101E R   |   6 DOT1       001034 R
  6 DOTI1      001A96 R   |   6 DOTID      001A80 R   |   6 DOTO1      001476 R
  6 DOTOK      00145C R   |   6 DOTPR      001147 R   |   6 DOTQ       0016DE R
  6 DOTQP      000FA4 R   |   6 DOTR       000FB2 R   |   6 DOTS       001A22 R
  6 DOTS1      001A2D R   |   6 DOTS2      001A36 R   |   6 DOVAR      0006CF R
  6 DOVER      002978 R   |   6 DO_DCONS   001969 R   |   6 DPLUS      002B74 R
  6 DPLUS1     002B9B R   |   6 DRAT       0028E7 R   |   6 DRFROM     0028CF R
  6 DROP       00060F R   |   6 DROT       0027FC R   |   6 DRSHIFT    0029FD R
  6 DRSHIFT1   002A04 R   |   6 DRSHIFT2   002A1A R   |   6 DSIGN      002657 R
  6 DSIGN1     002661 R   |   6 DSLA9      002B5F R   |   6 DSLASH     002B65 R
  6 DSLMOD     002671 R   |   6 DSLMOD3    00268C R   |   6 DSLMOD4    002698 R
  6 DSLMODa    002693 R   |   6 DSLMODb    00269E R   |   6 DSSTAR     00273C R
  6 DSSTAR3    002759 R   |   6 DSTAR      002A20 R   |   6 DSTOR      000C90 R
  6 DSUB       002BA6 R   |   6 DSUB1      002BCD R   |   6 DSWAP      002762 R
  6 DTOF       00343A R   |   6 DTOF1      003443 R   |   6 DTOF2      003451 R
  6 DTOR       0028B1 R   |   6 DUMP       0019D8 R   |   6 DUMP1      0019EF R
  6 DUMP3      001A11 R   |   6 DUMPP      0019A7 R   |   6 DUPP       000619 R
  6 DVARIA     002905 R   |     DVER_MAJ=  000001     |     DVER_MIN=  000000 
  6 DZEQUAL    002837 R   |   6 DZLESS     00289A R   |   6 DZLESS1    0028A4 R
  6 EDIGS      000E5E R   |   6 EDOT       002DA7 R   |   6 EDOT0      002DBE R
  6 EDOT2      002DCA R   |   6 EDOT3      002DE3 R   |   6 EDOT4      002E0F R
  6 EDOT5      002E2E R   |   6 EECSTORE   001E34 R   |   6 EEPCP      001C5A R
  6 EEPLAST    001C2D R   |   6 EEPROM     001C15 R   |     EEPROM_B=  004000 
    EEPROM_E=  0047FF     |     EEPROM_R=  000010     |     EEPROM_S=  000800 
  6 EEPRUN     001C44 R   |   6 EEPVP      001C70 R   |   6 EESTORE    001E80 R
  6 EE_CCOMM   00214A R   |   6 EE_COMMA   002129 R   |   6 EE_CREAD   001DC5 R
  6 EE_READ    001DA3 R   |   6 EI         0000BD R   |   6 ELSEE      00163D R
  6 EMIT       000436 R   |   6 ENEPER     00236A R   |     EOL_CR  =  000001 
    EOL_LF  =  000000     |   6 EQ1        000907 R   |   6 EQUAL      0008FA R
  6 ERASE      000D8B R   |     ERR     =  00001B     |   6 EVAL       00149F R
  6 EVAL1      00149F R   |   6 EVAL2      0014BB R   |   6 EXE1       000D20 R
  6 EXECU      0004C4 R   |     EXT     =  000000     |     EXTI_CR1=  0050A0 
    EXTI_CR2=  0050A1     |   6 EXTRC      000DE5 R   |   6 FABS       00355C R
  6 FABS1      003575 R   |   6 FADDR      002217 R   |   6 FALGN4     00310C R
  6 FALGN6     00311B R   |   6 FALGN7     003142 R   |   6 FALGN71    003151 R
  6 FALGN72    00316D R   |   6 FALGN8     003170 R   |   6 FALIGN     0030D3 R
  6 FALSE      000868 R   |   6 FARAT      001CDB R   |   6 FARCAT     001CE7 R
  6 FC_XOFF    000463 R   |   6 FC_XON     00044D R   |   6 FDOT       002E3D R
  6 FDOT0      002E7B R   |   6 FDOT1      002E6A R   |   6 FDOT10     002ED7 R
  6 FDOT2      002E89 R   |   6 FDOT3      002EA2 R   |   6 FDOT6      002EB2 R
  6 FDOT7      002EB7 R   |   6 FDOT8      002EBF R   |   6 FDOT9      002EC7 R
  6 FEQUAL     003526 R   |   6 FER        002C3F R   |   6 FGREAT     00351B R
    FHSE    =  7A1200     |     FHSI    =  F42400     |   6 FILL       000D58 R
  6 FILL1      000D75 R   |   6 FILL2      000D7E R   |   6 FIND       00123D R
  6 FIND1      00125B R   |   6 FIND2      001289 R   |   6 FIND3      001295 R
  6 FIND4      0012A9 R   |   6 FIND5      0012B6 R   |   6 FIND6      00129A R
  6 FINIT      002C35 R   |     FLASH_BA=  008000     |     FLASH_CR=  00505A 
    FLASH_CR=  000002     |     FLASH_CR=  000000     |     FLASH_CR=  000003 
    FLASH_CR=  000001     |     FLASH_CR=  00505B     |     FLASH_CR=  000005 
    FLASH_CR=  000004     |     FLASH_CR=  000007     |     FLASH_CR=  000000 
    FLASH_CR=  000006     |     FLASH_DU=  005064     |     FLASH_DU=  0000AE 
    FLASH_DU=  000056     |     FLASH_EN=  027FFF     |     FLASH_FP=  00505D 
    FLASH_FP=  000000     |     FLASH_FP=  000001     |     FLASH_FP=  000002 
    FLASH_FP=  000003     |     FLASH_FP=  000004     |     FLASH_FP=  000005 
    FLASH_IA=  00505F     |     FLASH_IA=  000003     |     FLASH_IA=  000002 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 193.
Hexadecimal [24-Bits]

Symbol Table

    FLASH_IA=  000006     |     FLASH_IA=  000001     |     FLASH_IA=  000000 
    FLASH_NC=  00505C     |     FLASH_NF=  00505E     |     FLASH_NF=  000000 
    FLASH_NF=  000001     |     FLASH_NF=  000002     |     FLASH_NF=  000003 
    FLASH_NF=  000004     |     FLASH_NF=  000005     |     FLASH_PU=  005062 
    FLASH_PU=  000056     |     FLASH_PU=  0000AE     |     FLASH_SI=  020000 
    FLASH_WS=  00480D     |   6 FLESS      003510 R   |   6 FLOATQ     002F4F R
  6 FLOATQ0    002F59 R   |   6 FLOATQ1    002FBE R   |   6 FLOATQ2    002FC7 R
  6 FLOATQ3    002FCF R   |   6 FLOATQ4    002FE3 R   |   6 FLOAT_ER   002FFE R
  6 FLOAT_ER   002FFB R   |     FLOAT_MA=  000001     |     FLOAT_MI=  000000 
    FLSI    =  01F400     |   6 FMOVE      002222 R   |   6 FMOVE2     002253 R
  6 FNE        002C62 R   |   6 FNEGA      003542 R   |   6 FOR        0015AF R
  6 FORGET     00015A R   |   6 FORGET1    000189 R   |   6 FORGET2    00020F R
  6 FORGET4    000218 R   |   6 FORGET6    0001D1 R   |   6 FOV        002C7D R
  6 FPLUS      00317C R   |   6 FPLUS1     00319C R   |   6 FPSTOR     001BF6 R
  6 FPSW       002C11 R   |     FPTR    =  000034     |   6 FREEVAR    000225 R
  6 FREEVAR4   00025B R   |   6 FRESET     002C23 R   |   6 FSLASH     003368 R
  6 FSLASH1    0033AA R   |   6 FSLASH8    003410 R   |   6 FSLASH9    003427 R
  6 FSTAR      003341 R   |   6 FSUB       0031AE R   |   6 FSUB1      0031CE R
  6 FTOD       00345E R   |   6 FTOD1      00348E R   |   6 FTOD2      0034A7 R
  6 FTOD3      0034B1 R   |   6 FTOD4      0034BC R   |   6 FTOD5      0034C4 R
  6 FTOD6      0034E4 R   |   6 FTOD8      0034E9 R   |   6 FTOD9      0034F4 R
  6 FVER       002BDF R   |   6 FZE        002C4C R   |   6 FZEQUAL    00352F R
  6 FZLESS     0034FB R   |     GPIO_BAS=  005000     |     GPIO_CR1=  000003 
    GPIO_CR2=  000004     |     GPIO_DDR=  000002     |     GPIO_IDR=  000001 
    GPIO_ODR=  000000     |     GPIO_SIZ=  000005     |   6 GREAT      000953 R
  6 GREAT1     00095E R   |   6 HDOT       001001 R   |   6 HERE       000CDC R
  6 HEX        000E94 R   |   6 HI         001B39 R   |   6 HLD        00074F R
  6 HOLD       000E09 R   |     HSECNT  =  004809     |     I2C_CCRH=  00521C 
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
    I2C_TRIS=  000011     |     I2C_WRIT=  000000     |   6 ICOLON     001878 R
  6 IFETCH     0015CD R   |   6 IFF        001615 R   |   6 IFMOVE     0022FB R
    IMEDD   =  000080     |   6 IMMED      00188A R   |   6 INCH       00042A R
  6 INC_FPTR   001D70 R   |   6 INITOFS    001840 R   |   6 INN        0006FD R
    INPUT_DI=  000000     |     INPUT_EI=  000001     |     INPUT_FL=  000000 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 194.
Hexadecimal [24-Bits]

Symbol Table

    INPUT_PU=  000001     |   6 INTE1      00143E R   |   6 INTER      001414 R
  6 INTQ       0024A4 R   |     INT_ADC2=  000016     |     INT_AUAR=  000012 
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
  6 ISEMI      0017D5 R   |     ITC_SPR1=  007F70     |     ITC_SPR2=  007F71 
    ITC_SPR3=  007F72     |     ITC_SPR4=  007F73     |     ITC_SPR5=  007F74 
    ITC_SPR6=  007F75     |     ITC_SPR7=  007F76     |     ITC_SPR8=  007F77 
    IWDG_KR =  0050E0     |     IWDG_PR =  0050E1     |     IWDG_RLR=  0050E2 
  6 JFETCH     0015D8 R   |   6 JSRC       00182A R   |   6 KEY        000EFD R
  6 KTAP       00132E R   |   6 KTAP1      001351 R   |   6 KTAP2      001354 R
  6 LAST       00078E R   |   6 LASTN   =  003557 R   |   6 LBRAC      00144B R
    LED2_BIT=  000005     |     LED2_MAS=  000020     |     LED2_POR=  00500A 
  6 LESS       000926 R   |     LF      =  00000A     |   6 LINK    =  003557 R
  6 LITER      001587 R   |   6 LN2S       0023C6 R   |   6 LOCAL      000554 R
  6 LOCK       001D5C R   |   6 LOG2S      0023B0 R   |   6 LSCALE     00301D R
  6 LSHIFT     000BB1 R   |   6 LSHIFT1    000BBA R   |   6 LSHIFT4    000BC2 R
  6 LT1        000931 R   |     MASKK   =  001F7F     |   6 MAX        00096B R
  6 MAX1       000975 R   |     MAX_MANT=  7FFFFF     |   6 MIN        00097F R
  6 MIN1       000989 R   |   6 MMOD1      000A34 R   |   6 MMOD2      000A48 R
  6 MMOD3      000A5F R   |   6 MMSM0      0009C4 R   |   6 MMSM1      0009D4 R
  6 MMSM3      0009D8 R   |   6 MMSM4      0009E4 R   |   6 MMSMa      0009DF R
  6 MMSMb      0009EA R   |   6 MMSTA1     00326F R   |   6 MMSTA2     00327A R
  6 MMSTA3     003285 R   |   6 MMSTA4     0032F0 R   |   6 MMSTA5     003302 R
  6 MMSTA6     00331B R   |   6 MMSTA7     003338 R   |   6 MMSTAR     003264 R
  6 MODD       000AAF R   |   6 MONE       000C18 R   |     MS      =  000030 
  6 MSEC       0002D0 R   |   6 MSMOD      000A17 R   |   6 MSTA1      000B40 R
  6 MSTAR      000B1D R   |     NAFR    =  004804     |   6 NAMEQ      0012D6 R
  6 NAMET      0011E7 R   |     NCLKOPT =  004808     |   6 NDROT      0027C0 R
  6 NEGAT      000886 R   |   6 NEG_SIGN   00250F R   |   6 NEX1       000490 R
  6 NEXT       0015BE R   |     NFLASH_W=  00480E     |     NHSECNT =  00480A 
    NOPT1   =  004802     |     NOPT2   =  004804     |     NOPT3   =  004806 
    NOPT4   =  004808     |     NOPT5   =  00480A     |     NOPT6   =  00480C 
    NOPT7   =  00480E     |     NOPTBL  =  00487F     |   6 NRAT       00059F R
  6 NRDROP     00057B R   |   6 NROT       0007FC R   |   6 NRSTO      0005BE R
  6 NTIB       00070D R   |     NUBC    =  004802     |     NUCLEO  =  000001 
  6 NUFQ       000F13 R   |   6 NUFQ1      000F2C R   |   6 NUMBQ      00257E R
  6 NUMQ0      0025BF R   |   6 NUMQ1      0025E1 R   |   6 NUMQ3      00260B R
  6 NUMQ4      00262C R   |   6 NUMQ8      002635 R   |     NWDGOPT =  004806 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 195.
Hexadecimal [24-Bits]

Symbol Table

    NWDGOPT_=  FFFFFFFD     |     NWDGOPT_=  FFFFFFFC     |     NWDGOPT_=  FFFFFFFF 
    NWDGOPT_=  FFFFFFFE     |   6 NonHandl   000000 R   |   6 OFFSET     0007B3 R
    OFS     =  000005     |   6 ONE        000C0A R   |   6 ONEM       000BA0 R
  6 ONEP       000B93 R   |     OPT     =  000002     |     OPT0    =  004800 
    OPT1    =  004801     |     OPT2    =  004803     |     OPT3    =  004805 
    OPT4    =  004807     |     OPT5    =  004809     |     OPT6    =  00480B 
    OPT7    =  00480D     |     OPTBL   =  00487E     |     OPTIMIZE=  000001 
    OPTION_B=  004800     |     OPTION_E=  00487F     |     OPTION_S=  000080 
  6 ORIG       000049 R   |   6 ORR        00068A R   |   6 OUTPUT     00043B R
    OUTPUT_F=  000001     |     OUTPUT_O=  000000     |     OUTPUT_P=  000001 
    OUTPUT_S=  000000     |   6 OVER       000641 R   |   6 OVERT      0017A3 R
    PA      =  000000     |   6 PACKS      000D9C R   |   6 PAD        000CED R
  6 PAREN      001156 R   |   6 PARS       00104F R   |   6 PARS1      00107A R
  6 PARS2      0010A5 R   |   6 PARS3      0010A8 R   |   6 PARS4      0010B1 R
  6 PARS5      0010D4 R   |   6 PARS6      0010E9 R   |   6 PARS7      0010F8 R
  6 PARS8      001107 R   |   6 PARSE      001118 R   |   6 PARSEXP_   002F32 R
  6 PAUSE      0002E0 R   |     PA_BASE =  005000     |     PA_CR1  =  005003 
    PA_CR2  =  005004     |     PA_DDR  =  005002     |     PA_IDR  =  005001 
    PA_ODR  =  005000     |     PB      =  000005     |     PB_BASE =  005005 
    PB_CR1  =  005008     |     PB_CR2  =  005009     |     PB_DDR  =  005007 
    PB_IDR  =  005006     |     PB_ODR  =  005005     |     PC      =  00000A 
    PC_BASE =  00500A     |     PC_CR1  =  00500D     |     PC_CR2  =  00500E 
    PC_DDR  =  00500C     |     PC_IDR  =  00500B     |     PC_ODR  =  00500A 
    PD      =  00000F     |   6 PDUM1      0019BA R   |   6 PDUM2      0019CB R
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
    PH_ODR  =  005023     |     PI      =  000028     |   6 PICK       000C58 R
  6 PII        002329 R   |     PI_BASE =  005028     |     PI_CR1  =  00502B 
    PI_CR2  =  00502C     |     PI_DDR  =  00502A     |     PI_IDR  =  005029 
    PI_ODR  =  005028     |   6 PLUS       00083C R   |   6 PNAM1      001748 R
  6 PRESE      0014CA R   |   6 PRINT_VE   001B09 R   |     PROD1   =  000024 
    PROD2   =  000026     |     PROD3   =  000028     |   6 PROTECTE   000201 R
  6 PRT_LICE   001AF5 R   |   6 PSTOR      000C6F R   |     PTR16   =  000035 
    PTR8    =  000036     |   6 PTRPLUS    001D88 R   |   6 QBRAN      000498 R
  6 QDUP       0007CC R   |   6 QDUP1      0007D6 R   |   6 QKEY       000418 R
  6 QSTAC      001482 R   |   6 QUERY      0013AE R   |   6 QUEST      001041 R
  6 QUIT       0014E7 R   |   6 QUIT1      0014EF R   |   6 QUIT2      0014F2 R
  6 RAM2EE     0021C3 R   |     RAMBASE =  000000     |   6 RAMLAST    0007A1 R
    RAM_BASE=  000000     |     RAM_END =  0017FF     |     RAM_SIZE=  001800 
  6 RANDOM     00027E R   |   6 RAT        000545 R   |   6 RBRAC      001817 R
  6 REPEA      001692 R   |   6 RFREE      0021AA R   |   6 RFROM      000534 R
    ROP     =  004800     |   6 ROT        0007DD R   |   6 ROW2BUF    00216C R
    ROWBUFF =  001680     |     RP0     =  00002E     |   6 RPAT       000511 R
    RPP     =  0017FF     |   6 RPSTO      00051E R   |   6 RSCALE     003041 R
  6 RSHIFT     000BCD R   |   6 RSHIFT1    000BD6 R   |   6 RSHIFT4    000BDE R
    RST_SR  =  0050B3     |   6 RT12_2     002399 R   |   6 SAME1      001205 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 196.
Hexadecimal [24-Bits]

Symbol Table

  6 SAME2      00122E R   |   6 SAMEQ      0011FD R   |   6 SCAL1      0031F7 R
  6 SCAL2      00321B R   |   6 SCALDN2    0030C5 R   |   6 SCALDN3    0030C8 R
  6 SCALEDOW   003099 R   |   6 SCALETOM   0031F1 R   |   6 SCALEUP    003062 R
  6 SCALEUP2   003095 R   |   6 SCALEUP3   003098 R   |   6 SCOM1      00177D R
  6 SCOM2      001780 R   |   6 SCOMP      00175F R   |   6 SEED       000265 R
    SEEDX   =  000038     |     SEEDY   =  00003A     |   6 SEMIS      0017B3 R
  6 SETISP     0000D0 R   |   6 SET_RAML   0018FA R   |   6 SFN        002CD4 R
    SFR_BASE=  005000     |     SFR_END =  0057FF     |   6 SFV        002D08 R
  6 SFZ        002C9D R   |   6 SIGN       000E48 R   |   6 SIGN1      000E58 R
  6 SLASH      000AB9 R   |   6 SLMOD      000A67 R   |   6 SLMOD1     000A99 R
  6 SLMOD8     000AA6 R   |   6 SNAME      001712 R   |     SP0     =  00002C 
  6 SPACE      000F35 R   |   6 SPACS      000F44 R   |   6 SPAT       0005F9 R
    SPI_CR1 =  005200     |     SPI_CR2 =  005201     |     SPI_CRCP=  005205 
    SPI_DR  =  005204     |     SPI_ICR =  005202     |     SPI_RXCR=  005206 
    SPI_SR  =  005203     |     SPI_TXCR=  005207     |     SPP     =  001680 
    SPSAVE  =  000001     |   6 SPSTO      000606 R   |   6 SQRT10     002382 R
  6 SQRT2      002340 R   |   6 SQRT3      002357 R   |   6 SSMOD      000B49 R
    SSP     =  000001     |     STACK   =  0017FF     |   6 STAR       000B12 R
  6 STASL      000B5A R   |   6 STEXP      002D53 R   |   6 STEXP1     002D69 R
  6 STEXP2     002D93 R   |   6 STOD       0008BB R   |   6 STORE      0004D1 R
  6 STO_SIGN   002527 R   |   6 STR        000E76 R   |   6 STRCQ      00158F R
  6 STRQ       0016D1 R   |   6 STRQP      000FA0 R   |   6 SUBB       0008D2 R
  6 SWAPP      000629 R   |     SWIM_CSR=  007F80     |   6 TAP        001318 R
  6 TBOOT      001B78 R   |   6 TBRAN      0004A6 R   |   6 TBUF       00071D R
    TBUFFBAS=  001680     |   6 TCHAR      000C29 R   |   6 TEMP       0006EE R
  6 TEVAL      000740 R   |   6 TFLASH     00072F R   |   6 THENN      00162A R
  6 TIB        000CFE R   |     TIBB    =  001700     |     TIBBASE =  001700 
    TIC     =  000027     |   6 TICK       0014FE R   |     TIM1_ARR=  005262 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 197.
Hexadecimal [24-Bits]

Symbol Table

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
  6 TNAM2      001A50 R   |   6 TNAM3      001A6E R   |   6 TNAM4      001A74 R
  6 TNAME      001A4D R   |   6 TOFLASH    000335 R   |   6 TOKEN      0011D9 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 198.
Hexadecimal [24-Bits]

Symbol Table

  6 TOR        0005E2 R   |   6 TORAM      000375 R   |   6 TRUE       000857 R
    TRUEE   =  00FFFF     |   6 TWOSL      000BE5 R   |   6 TYPE1      000F64 R
  6 TYPE2      000F6A R   |   6 TYPES      000F5F R   |   6 Timer4Ha   000005 R
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
    UD4     =  000004     |   6 UDIV10     00321C R   |   6 UDOT       000FED R
  6 UDOTR      000FCD R   |   6 UDSLA3     002AB8 R   |   6 UDSLA4     002ADE R
  6 UDSLA7     002B0F R   |   6 UDSLA8     002B1A R   |   6 UDSLMOD    002A83 R
  6 UDSSTAR    00271A R   |   6 UEND       000047 R   |     UFPSW   =  000008 
  6 UGREAT     00093D R   |   6 UGREAT1    000948 R   |     UHLD    =  000014 
    UINN    =  00000C     |     UINTER  =  000012     |     ULAST   =  00001C 
  6 ULES1      00091B R   |   6 ULESS      000910 R   |   6 UMMOD      0009B1 R
  6 UMOD10     0031DB R   |   6 UMSTA      000AC8 R   |   6 UNIQ1      00170F R
  6 UNIQU      0016F0 R   |   6 UNLKEE     001CF6 R   |   6 UNLKFL     001D15 R
  6 UNLOCK     001D34 R   |   6 UNTIL      0015F2 R   |     UOFFSET =  00001E 
  6 UPDATCP    001CB3 R   |   6 UPDATLAS   001C8A R   |   6 UPDATPTR   0022B6 R
  6 UPDATRUN   001CA2 R   |   6 UPDATVP    001CCA R   |   6 UPL1       0006CB R
  6 UPLUS      0006B4 R   |     UPP     =  000006     |   6 UPPER      00119C R
  6 UPPER1     0011BF R   |   6 UPPER2     0011C8 R   |     URLAST  =  000022 
  6 USLMOD     0009FC R   |     USR_BTN_=  000004     |     USR_BTN_=  000010 
    USR_BTN_=  005015     |     UTFLASH =  000020     |     UTIB    =  000010 
    UTMP    =  00000A     |   6 UTYP1      00198A R   |   6 UTYP2      001999 R
  6 UTYPE      001985 R   |     UVP     =  000018     |   6 UZERO      00002B R
  6 VARIA      0018C7 R   |     VAR_BASE=  000080     |     VAR_TOP =  0017BF 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 199.
Hexadecimal [24-Bits]

Symbol Table

    VER     =  000004     |   6 VPP        000770 R   |     VSIZE   =  000006 
    WANT_CON=  000001     |     WANT_DEB=  000000     |     WANT_DOU=  000001 
    WANT_FLO=  000001     |     WANT_SCA=  000001     |     WANT_SEE=  000000 
    WDGOPT  =  004805     |     WDGOPT_I=  000002     |     WDGOPT_L=  000003 
    WDGOPT_W=  000000     |     WDGOPT_W=  000001     |   6 WHILE      001678 R
  6 WITHI      000996 R   |   6 WORDD      001182 R   |   6 WORDS      001AAA R
  6 WORS1      001AB0 R   |   6 WORS2      001ACC R   |   6 WR_BYTE    001DDF R
  6 WR_WORD    001E04 R   |   6 WTABLE     00240E R   |   6 WTAT       002432 R
  6 WTINIT     002477 R   |     WWDG_CR =  0050D1     |     WWDG_WR =  0050D2 
    XMEM_SIZ=  017830     |     XOFF    =  000013     |     XON     =  000011 
  6 XORR       00069F R   |     XTEMP   =  000024     |     YTEMP   =  000026 
  6 ZEQ1       002847 R   |   6 ZEQU1      00066C R   |   6 ZEQUAL     000662 R
  6 ZERO       000BFF R   |   6 ZL1        000659 R   |   6 ZLESS      000650 R
  6 app_spac   003580 R   |   6 baudrate   00037B R   |   6 block_er   001ECA R
  6 clear_ra   000019 R   |   6 clock_in   000064 R   |   6 copy_buf   001F2A R
  6 copy_buf   001F49 R   |   6 copy_pro   001F49 R   |     da      =  000002 
    db      =  000003     |     dc      =  000000     |     dd      =  000001 
  6 do2lit     00295C R   |   6 erase_fl   001EEC R   |   6 fmove_do   00229F R
  6 main       000016 R   |   6 next_row   00225C R   |   6 no_move    0022A6 R
  6 nsign      0024FE R   |   6 parse_di   00252B R   |   6 parse_ex   002EE7 R
  6 pristine   001FCA R   |   6 proceed_   001EEF R   |   6 reboot     000327 R
  6 reset_ve   002031 R   |   6 row_eras   001EAA R   |   6 row_eras   001F03 R
  6 row_eras   001F2A R   |   6 set_opti   001F9E R   |   6 set_vect   0020D2 R
  6 uart_ini   000076 R   |   6 write_ro   001F6E R

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 200.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 DATA       size      0   flags    8
   2 DATA0      size      0   flags    8
   3 SSEG       size      0   flags    8
   4 SSEG1      size    100   flags    8
   5 HOME       size     80   flags    0
   6 CODE       size   3580   flags    0

