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
      0080B7 94 A5                  316         .word      INTER   ;'EVAL
      0080B9 00 00                  317         .word      0       ;HLD
      0080BB B6 1E                  318         .word      LASTN  ;CNTXT pointer
      0080BD 00 80                  319         .word      VAR_BASE   ;variables free space pointer 
      0080BF B6 80                  320         .word      app_space ; FLASH free space pointer 
      0080C1 B6 1E                  321         .word      LASTN   ;LAST
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
      00812D CC 9C 63         [ 2]  393         jp  COLD   ;default=MN1
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
      008173 CD 86 C1         [ 4]  445         call OVER ; ( level reg lshift rval lshift -- )
      008176 CD 84 EF         [ 4]  446         call DOLIT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 10.
Hexadecimal [24-Bits]



      008179 00 03                  447         .word 3
      00817B CD 86 A9         [ 4]  448         call SWAPP  ; ( level reg lshift rval 3 lshift )
      00817E CD 8C 35         [ 4]  449         call LSHIFT ; creat slot mask 
      008181 CD 88 F5         [ 4]  450         call INVER  ; ( level reg lshift rval mask )
      008184 CD 86 F6         [ 4]  451         call ANDD ; ( level reg lshift slot_masked )
      008187 CD 86 62         [ 4]  452         call TOR  ; ( level reg lshift -- R: slot_masked )
      00818A CD 88 5D         [ 4]  453         call ROT  ; ( reg lshift level )
      00818D CD 86 A9         [ 4]  454         call SWAPP ; ( reg level lshift )
      008190 CD 8C 35         [ 4]  455         call LSHIFT  ; ( reg slot_level -- )
      008193 CD 85 B4         [ 4]  456         call RFROM ; ( reg slot_level masked_val )
      008196 CD 87 0A         [ 4]  457         call ORR   ; ( reg updated_rval )
      008199 CD 86 A9         [ 4]  458         call SWAPP 
      00819C CC 85 70         [ 2]  459         jp CSTOR
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
      0081A9 CD 92 6A         [ 4]  467         call TOKEN 
      0081AC CD 86 99         [ 4]  468         call DUPP 
      0081AF CD 85 18         [ 4]  469         call QBRAN 
      0081B2 82 8F                  470         .word FORGET2
      0081B4 CD 93 67         [ 4]  471         call NAMEQ
      0081B7 CD 88 4C         [ 4]  472         call QDUP 
      0081BA CD 85 18         [ 4]  473         call QBRAN 
      0081BD 82 8F                  474         .word FORGET2
      00013F                        475         _DROP 
      0081BF 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      0081C2 1D 00 04         [ 2]  476         subw x,#2*CELLL 
      0081C5 90 5F            [ 1]  477         clrw y 
      0081C7 FF               [ 2]  478         ldw (x),y 
      0081C8 90 AE 40 02      [ 2]  479         ldw y,#APP_RUN 
      0081CC EF 02            [ 2]  480         ldw (2,x),y 
      0081CE CC 9F 5F         [ 2]  481         jp EESTORE 
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
      0081DA CD 92 6A         [ 4]  490         call TOKEN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 11.
Hexadecimal [24-Bits]



      0081DD CD 86 99         [ 4]  491         call DUPP 
      0081E0 CD 85 18         [ 4]  492         call QBRAN 
      0081E3 82 8F                  493         .word FORGET2
      0081E5 CD 93 67         [ 4]  494         call NAMEQ ; ( a -- ca na | a F )
      0081E8 CD 88 4C         [ 4]  495         call QDUP 
      0081EB CD 85 18         [ 4]  496         call QBRAN 
      0081EE 82 8F                  497         .word FORGET2
                                    498 ; only forget users words 
      0081F0 CD 86 99         [ 4]  499         call DUPP ; ( ca na na )
      0081F3 CD 84 EF         [ 4]  500         call DOLIT 
      0081F6 B6 80                  501         .word app_space 
      0081F8 CD 86 A9         [ 4]  502         call SWAPP 
      0081FB CD 89 90         [ 4]  503         call  ULESS 
      0081FE CD 85 18         [ 4]  504         call QBRAN 
      008201 82 51                  505         .word FORGET6 
                                    506 ; ( ca na -- )        
                                    507 ;reset ivec with address >= ca
      008203 CD 86 A9         [ 4]  508         call SWAPP ; ( na ca -- ) 
      008206 CD A1 62         [ 4]  509         call CHKIVEC ; ( na -- ) 
                                    510 ; start at LAST and link back to na 
                                    511 ; if variable found reset VP at that point.
      008209                        512 FORGET1:
      008209 CD 88 0E         [ 4]  513         call LAST 
      00820C CD 85 63         [ 4]  514         call AT 
      00820F CD 86 99         [ 4]  515         call DUPP  ; ( -- na last last )
      008212 CD 82 A5         [ 4]  516         call FREEVAR ; ( -- na last )
      008215 CD 86 99         [ 4]  517         call DUPP 
      008218 CD 84 EF         [ 4]  518         call DOLIT 
      00821B 00 02                  519         .word 2 
      00821D CD 89 52         [ 4]  520         call SUBB ; ( na last -- na last lfa ) link address 
      008220 CD 85 63         [ 4]  521         call AT 
      008223 CD 86 99         [ 4]  522         call DUPP ; ( -- na last a a )
      008226 CD 87 E2         [ 4]  523         call CNTXT 
      008229 CD 85 51         [ 4]  524         call STORE
      00822C CD 88 0E         [ 4]  525         call LAST  
      00822F CD 85 51         [ 4]  526         call STORE ; ( --  na last )
      008232 CD 86 C1         [ 4]  527         call OVER 
      008235 CD 89 7A         [ 4]  528         call EQUAL ; ( na last na -- na T|F ) 
      008238 CD 85 18         [ 4]  529         call QBRAN 
      00823B 82 09                  530         .word FORGET1 
                                    531 ; ( na -- )
      00823D CD 84 EF         [ 4]  532         call DOLIT 
      008240 00 02                  533         .word 2 
      008242 CD 89 52         [ 4]  534         call SUBB 
      008245 CD 87 FE         [ 4]  535         call CPP 
      008248 CD 85 51         [ 4]  536         call STORE  
      00824B CD 9D 92         [ 4]  537         call UPDATCP 
      00824E CC 9D 69         [ 2]  538         jp UPDATLAST 
      008251                        539 FORGET6: ; tried to forget a RAM or system word 
                                    540 ; ( ca na -- )
      008251 1D 00 02         [ 2]  541         subw x,#CELLL 
      008254 90 BE 2C         [ 2]  542         ldw y,SP0 
      008257 FF               [ 2]  543         ldw (x),y  
      008258 CD 89 90         [ 4]  544         call ULESS
      00825B CD 85 18         [ 4]  545         call QBRAN 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 12.
Hexadecimal [24-Bits]



      00825E 82 81                  546         .word PROTECTED 
      008260 CD 94 73         [ 4]  547         call ABORQ 
      008263 1D                     548         .byte 29
      008264 20 46 6F 72 20 52 41   549         .ascii " For RAM definition do REBOOT"
             4D 20 64 65 66 69 6E
             69 74 69 6F 6E 20 64
             6F 20 52 45 42 4F 4F
             54
      008281                        550 PROTECTED:
      008281 CD 94 73         [ 4]  551         call ABORQ
      008284 0A                     552         .byte 10
      008285 20 50 72 6F 74 65 63   553         .ascii " Protected"
             74 65 64
      00828F                        554 FORGET2: ; no name or not found in dictionary 
      00828F CD 94 73         [ 4]  555         call ABORQ
      008292 05                     556         .byte 5
      008293 20 77 68 61 74         557         .ascii " what"
      008298                        558 FORGET4:
      008298 CC 86 8F         [ 2]  559         jp DROP 
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
      0082A5 CD 86 99         [ 4]  568         call DUPP ; ( na na -- )
      0082A8 CD 85 81         [ 4]  569         CALL CAT  ; ( na c -- )
      0082AB CD 8C 17         [ 4]  570         call ONEP ;
      0082AE CD 88 BC         [ 4]  571         CALL PLUS ; ( na c+1 -- ca ) 
      0082B1 CD 8C 17         [ 4]  572         call ONEP ; ( ca+ -- ) to get routne address 
      0082B4 CD 86 99         [ 4]  573         call DUPP ; ( ca+ ca+ -- )
      0082B7 CD 85 63         [ 4]  574         CALL AT   ; ( ca+ fnaddr -- ) ; fnaddr is routine address 
      0082BA CD 84 EF         [ 4]  575         call DOLIT 
      0082BD 87 4F                  576         .word DOVAR ; if routine address is DOVAR then variable 
      0082BF CD 89 7A         [ 4]  577         call EQUAL  ; ( ca+ fnaddr DOVAR -- ca+ T|F ) 
      0082C2 CD 85 18         [ 4]  578         call QBRAN 
      0082C5 82 DB                  579         .word FREEVAR4 
      0082C7 CD 84 EF         [ 4]  580         call DOLIT 
      0082CA 00 02                  581         .word 2 
      0082CC CD 88 BC         [ 4]  582         call PLUS  ; ( ca+ 2 -- da ) da is data address 
      0082CF CD 85 63         [ 4]  583         call AT 
      0082D2 CD 87 F0         [ 4]  584         call VPP   
      0082D5 CD 85 51         [ 4]  585         call STORE 
      0082D8 CC 9D A9         [ 2]  586         jp UPDATVP 
      0082DB                        587 FREEVAR4: ; not variable
      0082DB CC 86 8F         [ 2]  588         jp  DROP 
                                    589 
                                    590 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 13.
Hexadecimal [24-Bits]



                                    591 ;    SEED ( n -- )
                                    592 ; Initialize PRNG seed with n 
                                    593 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00025E                        594         _HEADER SEED,4,"SEED"
      0082DE 82 9D                    1         .word LINK 
                           000260     2         LINK=.
      0082E0 04                       3         .byte 4  
      0082E1 53 45 45 44              4         .ascii "SEED"
      0082E5                          5         SEED:
      0082E5 90 93            [ 1]  595         ldw y,x 
      0082E7 1C 00 02         [ 2]  596         addw x,#CELLL
      0082EA 90 FE            [ 2]  597         ldw y,(y)
      0082EC 90 9E            [ 1]  598         ld a,yh 
      0082EE B7 38            [ 1]  599         ld SEEDX,a 
      0082F0 90 9F            [ 1]  600         ld a,yl 
      0082F2 B7 3A            [ 1]  601         ld SEEDY,a 
      0082F4 81               [ 4]  602         ret 
                                    603 
                                    604 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    605 ;    RANDOM ( u1 -- u2 )
                                    606 ; Pseudo random number betwen 0 and u1-1
                                    607 ;  XOR32 algorithm 
                                    608 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000275                        609         _HEADER RANDOM,6,"RANDOM"
      0082F5 82 E0                    1         .word LINK 
                           000277     2         LINK=.
      0082F7 06                       3         .byte 6  
      0082F8 52 41 4E 44 4F 4D        4         .ascii "RANDOM"
      0082FE                          5         RANDOM:
                                    610 ;local variable 
                           000001   611         SPSAVE=1
                           000002   612         VSIZE=2 
      0082FE 52 02            [ 2]  613         sub sp,#VSIZE
      008300 1F 01            [ 2]  614         ldw (SPSAVE,sp),x  
                                    615 ; XTEMP=(SEEDX<<5)^SEEDX 
      008302 90 93            [ 1]  616         ldw y,x 
      008304 90 FE            [ 2]  617         ldw y,(y)
      008306 90 BF 26         [ 2]  618         ldw YTEMP,y 
      008309 BE 38            [ 2]  619 	ldw x,SEEDX 
      00830B 58               [ 2]  620 	sllw x 
      00830C 58               [ 2]  621 	sllw x 
      00830D 58               [ 2]  622 	sllw x 
      00830E 58               [ 2]  623 	sllw x 
      00830F 58               [ 2]  624 	sllw x 
      008310 9E               [ 1]  625 	ld a,xh 
      008311 B8 38            [ 1]  626 	xor a,SEEDX 
      008313 B7 24            [ 1]  627 	ld XTEMP,a 
      008315 9F               [ 1]  628 	ld a,xl 
      008316 B8 39            [ 1]  629 	xor a,SEEDX+1 
      008318 B7 25            [ 1]  630 	ld XTEMP+1,a 
                                    631 ; SEEDX=SEEDY 
      00831A BE 3A            [ 2]  632 	ldw x,SEEDY 
      00831C BF 38            [ 2]  633 	ldw SEEDX,x  
                                    634 ; SEEDY=SEEDY^(SEEDY>>1)
      00831E 54               [ 2]  635 	srlw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 14.
Hexadecimal [24-Bits]



      00831F 9E               [ 1]  636 	ld a,xh 
      008320 B8 3A            [ 1]  637 	xor a,SEEDY 
      008322 B7 3A            [ 1]  638 	ld SEEDY,a  
      008324 9F               [ 1]  639 	ld a,xl 
      008325 B8 3B            [ 1]  640 	xor a,SEEDY+1 
      008327 B7 3B            [ 1]  641 	ld SEEDY+1,a 
                                    642 ; XTEMP>>3 
      008329 BE 24            [ 2]  643 	ldw x,XTEMP 
      00832B 54               [ 2]  644 	srlw x 
      00832C 54               [ 2]  645 	srlw x 
      00832D 54               [ 2]  646 	srlw x 
                                    647 ; x=XTEMP^x 
      00832E 9E               [ 1]  648 	ld a,xh 
      00832F B8 24            [ 1]  649 	xor a,XTEMP 
      008331 95               [ 1]  650 	ld xh,a 
      008332 9F               [ 1]  651 	ld a,xl 
      008333 B8 25            [ 1]  652 	xor a,XTEMP+1  
      008335 97               [ 1]  653 	ld xl,a 
                                    654 ; SEEDY=x^SEEDY 
      008336 B8 3B            [ 1]  655 	xor a,SEEDY+1
      008338 97               [ 1]  656 	ld xl,a 
      008339 9E               [ 1]  657 	ld a,xh 
      00833A B8 3A            [ 1]  658 	xor a,SEEDY
      00833C 95               [ 1]  659 	ld xh,a 
      00833D BF 3A            [ 2]  660 	ldw SEEDY,x 
                                    661 ; return SEEDY modulo YTEMP  
      00833F 90 BE 26         [ 2]  662 	ldw y,YTEMP  
      008342 65               [ 2]  663 	divw x,y 
      008343 1E 01            [ 2]  664 	ldw x,(SPSAVE,sp)
      008345 FF               [ 2]  665         ldw (x),y 
      008346 5B 02            [ 2]  666         addw sp,#VSIZE 
      008348 81               [ 4]  667 	ret 
                                    668 
                                    669 
                                    670 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    671 ;; get millisecond counter 
                                    672 ;; msec ( -- u )
                                    673 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0002C9                        674         _HEADER MSEC,4,"MSEC"
      008349 82 F7                    1         .word LINK 
                           0002CB     2         LINK=.
      00834B 04                       3         .byte 4  
      00834C 4D 53 45 43              4         .ascii "MSEC"
      008350                          5         MSEC:
      008350 1D 00 02         [ 2]  675         subw x,#CELLL 
      008353 90 BE 30         [ 2]  676         ldw y,MS 
      008356 FF               [ 2]  677         ldw (x),y 
      008357 81               [ 4]  678         ret 
                                    679 
                                    680 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    681 ; suspend execution for u msec 
                                    682 ;  pause ( u -- )
                                    683 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0002D8                        684         _HEADER PAUSE,5,"PAUSE"
      008358 83 4B                    1         .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 15.
Hexadecimal [24-Bits]



                           0002DA     2         LINK=.
      00835A 05                       3         .byte 5  
      00835B 50 41 55 53 45           4         .ascii "PAUSE"
      008360                          5         PAUSE:
      008360 90 93            [ 1]  685         ldw y,x
      008362 90 FE            [ 2]  686         ldw y,(y)
      008364 72 B9 00 30      [ 2]  687         addw y,MS 
      008368 8F               [10]  688 1$:     wfi  
      008369 90 B3 30         [ 2]  689         cpw y,MS  
      00836C 26 FA            [ 1]  690         jrne 1$        
      00836E 1C 00 02         [ 2]  691         addw x,#CELLL 
      008371 81               [ 4]  692         ret 
                                    693 
                                    694 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    695 ; initialize count down timer 
                                    696 ;  TIMER ( u -- )  milliseconds
                                    697 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0002F2                        698         _HEADER TIMER,5,"TIMER"
      008372 83 5A                    1         .word LINK 
                           0002F4     2         LINK=.
      008374 05                       3         .byte 5  
      008375 54 49 4D 45 52           4         .ascii "TIMER"
      00837A                          5         TIMER:
      00837A 90 93            [ 1]  699         ldw y,x
      00837C 90 FE            [ 2]  700         ldw y,(y) 
      00837E 90 BF 32         [ 2]  701         ldw CNTDWN,y
      008381 1C 00 02         [ 2]  702         addw x,#CELLL 
      008384 81               [ 4]  703         ret 
                                    704 
                                    705 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    706 ; check for TIMER exiparition 
                                    707 ;  TIMEOUT? ( -- 0|-1 )
                                    708 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000305                        709         _HEADER TIMEOUTQ,8,"TIMEOUT?"
      008385 83 74                    1         .word LINK 
                           000307     2         LINK=.
      008387 08                       3         .byte 8  
      008388 54 49 4D 45 4F 55 54     4         .ascii "TIMEOUT?"
             3F
      008390                          5         TIMEOUTQ:
      008390 4F               [ 1]  710         clr a
      008391 1D 00 02         [ 2]  711         subw x,#CELLL 
      008394 90 BE 32         [ 2]  712         ldw y,CNTDWN 
      008397 26 01            [ 1]  713         jrne 1$ 
      008399 43               [ 1]  714         cpl a 
      00839A E7 01            [ 1]  715 1$:     ld (1,x),a 
      00839C F7               [ 1]  716         ld (x),a 
      00839D 81               [ 4]  717         ret         
                                    718 
                                    719 ;;;;;;;;;;;;;;;;;;;;;
                                    720 ; reboot MCU 
                                    721 ; REBOOT ( -- )
                                    722 ;;;;;;;;;;;;;;;;;;;;;
      00031E                        723         _HEADER reboot,6,"REBOOT"
      00839E 83 87                    1         .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 16.
Hexadecimal [24-Bits]



                           000320     2         LINK=.
      0083A0 06                       3         .byte 6  
      0083A1 52 45 42 4F 4F 54        4         .ascii "REBOOT"
      0083A7                          5         reboot:
      0083A7 CC 80 80         [ 2]  724         jp NonHandledInterrupt
                                    725 
                                    726 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    727 ; compile to flash memory 
                                    728 ; TO-FLASH ( -- )
                                    729 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      00032A                        730         _HEADER TOFLASH,8,"TO-FLASH"
      0083AA 83 A0                    1         .word LINK 
                           00032C     2         LINK=.
      0083AC 08                       3         .byte 8  
      0083AD 54 4F 2D 46 4C 41 53     4         .ascii "TO-FLASH"
             48
      0083B5                          5         TOFLASH:
      0083B5 CD 88 21         [ 4]  731         call RAMLAST 
      0083B8 CD 85 63         [ 4]  732         call AT 
      0083BB CD 88 4C         [ 4]  733         call QDUP 
      0083BE CD 85 18         [ 4]  734         call QBRAN
      0083C1 83 E4                  735         .word 1$
      0083C3 CD 94 73         [ 4]  736         call ABORQ 
      0083C6 1D                     737         .byte 29
      0083C7 20 4E 6F 74 20 77 68   738         .ascii " Not while definitions in RAM"   
             69 6C 65 20 64 65 66
             69 6E 69 74 69 6F 6E
             73 20 69 6E 20 52 41
             4D
      0083E4 90 AE FF FF      [ 2]  739 1$:     ldw y,#-1 
      0083E8 90 BF 20         [ 2]  740         ldw UTFLASH,y
      0083EB 81               [ 4]  741         ret 
                                    742 
                                    743 ;;;;;;;;;;;;;;;;;;;;;;
                                    744 ; compile to RAM 
                                    745 ; TO-RAM ( -- )
                                    746 ;;;;;;;;;;;;;;;;;;;;;;
      00036C                        747         _HEADER TORAM,6,"TO-RAM"
      0083EC 83 AC                    1         .word LINK 
                           00036E     2         LINK=.
      0083EE 06                       3         .byte 6  
      0083EF 54 4F 2D 52 41 4D        4         .ascii "TO-RAM"
      0083F5                          5         TORAM:
      0083F5 90 5F            [ 1]  748         clrw y 
      0083F7 90 BF 20         [ 2]  749         ldw UTFLASH,y 
      0083FA 81               [ 4]  750         ret 
                                    751 
                                    752 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    753 ;; BAUD RATE constants table
                                    754 ; values to put in BRR1 & BRR2 
                                    755 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0083FB                        756 baudrate: 
      0083FB A0 1B                  757 	.byte 0xa0,0x1b ; 2400
      0083FD D0 05                  758 	.byte 0xd0,0x5  ; 4800 
      0083FF 68 03                  759 	.byte 0x68,0x3  ; 9600
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 17.
Hexadecimal [24-Bits]



      008401 34 01                  760 	.byte 0x34,0x1  ; 19200
      008403 11 06                  761 	.byte 0x11,0x6  ; 57600
      008405 08 0B                  762 	.byte 0x8,0xb   ; 115200
                                    763 
                                    764 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    765 ; BAUD RATE CONSTANTS names 
                                    766 ; 2400 baud  ( -- n )
                                    767 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000387                        768         _HEADER B2K4,4,"B2K4"
      008407 83 EE                    1         .word LINK 
                           000389     2         LINK=.
      008409 04                       3         .byte 4  
      00840A 42 32 4B 34              4         .ascii "B2K4"
      00840E                          5         B2K4:
      00840E 1D 00 02         [ 2]  769 	subw x,#CELLL 
      008411 90 5F            [ 1]  770         clrw y
      008413 FF               [ 2]  771         ldw (x),y
      008414 81               [ 4]  772 	ret
                                    773 
                                    774 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    775 ; 4800 baud	
                                    776 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000395                        777         _HEADER B4K8,4,"B4K8"
      008415 84 09                    1         .word LINK 
                           000397     2         LINK=.
      008417 04                       3         .byte 4  
      008418 42 34 4B 38              4         .ascii "B4K8"
      00841C                          5         B4K8:
      00841C 1D 00 02         [ 2]  778         subw x,#CELLL 
      00841F 90 AE 00 02      [ 2]  779         ldw y,#2 
      008423 FF               [ 2]  780         ldw (x),y
      008424 81               [ 4]  781         ret 
                                    782 
                                    783 ;;;;;;;;;;;;;;;;;;;;
                                    784 ; 9600 baud
                                    785 ;;;;;;;;;;;;;;;;;;;;
      0003A5                        786         _HEADER B9K6,4,"B9K6"
      008425 84 17                    1         .word LINK 
                           0003A7     2         LINK=.
      008427 04                       3         .byte 4  
      008428 42 39 4B 36              4         .ascii "B9K6"
      00842C                          5         B9K6:
      00842C 1D 00 02         [ 2]  787         subw x,#CELLL 
      00842F 90 AE 00 04      [ 2]  788         ldw y,#4 
      008433 FF               [ 2]  789         ldw (x),y 
      008434 81               [ 4]  790         ret 
                                    791 ;;;;;;;;;;;;;;
                                    792 ; 19200 baud
                                    793 ;;;;;;;;;;;;;;
      0003B5                        794         _HEADER B19K2,5,"B19K2"
      008435 84 27                    1         .word LINK 
                           0003B7     2         LINK=.
      008437 05                       3         .byte 5  
      008438 42 31 39 4B 32           4         .ascii "B19K2"
      00843D                          5         B19K2:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 18.
Hexadecimal [24-Bits]



      00843D 1D 00 02         [ 2]  795         subw x,#CELLL
      008440 90 AE 00 06      [ 2]  796         ldw y,#6 
      008444 FF               [ 2]  797         ldw (x),y 
      008445 81               [ 4]  798         ret 
                                    799 ;;;;;;;;;;;;;;
                                    800 ; 57600 baud  
                                    801 ;;;;;;;;;;;;;;
      0003C6                        802         _HEADER B57K6,5,"B57K6"
      008446 84 37                    1         .word LINK 
                           0003C8     2         LINK=.
      008448 05                       3         .byte 5  
      008449 42 35 37 4B 36           4         .ascii "B57K6"
      00844E                          5         B57K6:
      00844E 1D 00 02         [ 2]  803         subw x,#CELLL 
      008451 90 AE 00 08      [ 2]  804         ldw y,#8 
      008455 FF               [ 2]  805         ldw (x),y 
      008456 81               [ 4]  806         ret 
                                    807 ;;;;;;;;;;;;;;
                                    808 ; 115200 baud 
                                    809 ;;;;;;;;;;;;;;
      0003D7                        810         _HEADER B115K2,6,"B115K2"
      008457 84 48                    1         .word LINK 
                           0003D9     2         LINK=.
      008459 06                       3         .byte 6  
      00845A 42 31 31 35 4B 32        4         .ascii "B115K2"
      008460                          5         B115K2:
      008460 1D 00 02         [ 2]  811 	subw x,#CELLL 
      008463 90 AE 00 0A      [ 2]  812         ldw y,#10 
      008467 FF               [ 2]  813         ldw (x),y 
      008468 81               [ 4]  814         ret 
                                    815 
                                    816 ;;;;;;;;;;;;;;;;;;;;;;;	
                                    817 ;; set UART2 BAUD rate
                                    818 ;	BAUD ( u -- )
                                    819 ;;;;;;;;;;;;;;;;;;;;;;;
      0003E9                        820         _HEADER BAUD,4,"BAUD"
      008469 84 59                    1         .word LINK 
                           0003EB     2         LINK=.
      00846B 04                       3         .byte 4  
      00846C 42 41 55 44              4         .ascii "BAUD"
      008470                          5         BAUD:
      008470 1D 00 02         [ 2]  821 	subw x,#CELLL
      008473 90 AE 83 FB      [ 2]  822         ldw y,#baudrate 
      008477 FF               [ 2]  823         ldw (x),y 
      008478 CD 88 BC         [ 4]  824         call PLUS
      00847B 90 93            [ 1]  825         ldw y,x  
      00847D 90 FE            [ 2]  826         ldw y,(y)
      00847F 90 F6            [ 1]  827         ld a,(y)
      008481 88               [ 1]  828         push a 
      008482 90 5C            [ 1]  829         incw y 
      008484 90 F6            [ 1]  830         ld a,(y)
      008486 C7 52 33         [ 1]  831         ld UART_BRR2,a 
      008489 84               [ 1]  832         pop a
      00848A C7 52 32         [ 1]  833         ld UART_BRR1,a 
      00848D 1C 00 02         [ 2]  834         addw x,#CELLL 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 19.
Hexadecimal [24-Bits]



      008490 81               [ 4]  835         ret 
                                    836 
                                    837 ;; Device dependent I/O
                                    838 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    839 ;       ?RX     ( -- c T | F )
                                    840 ;         Return input byte and true, or false.
                                    841 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000411                        842         _HEADER QKEY,4,"?KEY"
      008491 84 6B                    1         .word LINK 
                           000413     2         LINK=.
      008493 04                       3         .byte 4  
      008494 3F 4B 45 59              4         .ascii "?KEY"
      008498                          5         QKEY:
      008498 90 5F            [ 1]  843         CLRW Y 
      00849A 72 0B 52 30 0B   [ 2]  844         BTJF UART_SR,#UART_SR_RXNE,INCH   ;check status
      00849F C6 52 31         [ 1]  845         LD    A,UART_DR   ;get char in A
      0084A2 1D 00 02         [ 2]  846 	SUBW	X,#2
      0084A5 E7 01            [ 1]  847         LD     (1,X),A
      0084A7 7F               [ 1]  848 	CLR	(X)
      0084A8 90 53            [ 2]  849         CPLW     Y
      0084AA                        850 INCH:
      0084AA 1D 00 02         [ 2]  851 		SUBW	X,#2
      0084AD FF               [ 2]  852         LDW     (X),Y
      0084AE 81               [ 4]  853         RET
                                    854 
                                    855 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    856 ;       TX!     ( c -- )
                                    857 ;       Send character c to  output device.
                                    858 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00042F                        859         _HEADER EMIT,4,"EMIT"
      0084AF 84 93                    1         .word LINK 
                           000431     2         LINK=.
      0084B1 04                       3         .byte 4  
      0084B2 45 4D 49 54              4         .ascii "EMIT"
      0084B6                          5         EMIT:
      0084B6 E6 01            [ 1]  860         LD     A,(1,X)
      0084B8 1C 00 02         [ 2]  861 	ADDW	X,#2
      0084BB 72 0F 52 30 FB   [ 2]  862 OUTPUT: BTJF UART_SR,#UART_SR_TXE,OUTPUT  ;loop until tx empty 
      0084C0 C7 52 31         [ 1]  863         LD    UART_DR,A   ;send A
      0084C3 81               [ 4]  864         RET
                                    865 
                                    866 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    867 ;       FC-XON  ( -- )
                                    868 ;       send XON character 
                                    869 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000444                        870         _HEADER FC_XON,6,"FC-XON"
      0084C4 84 B1                    1         .word LINK 
                           000446     2         LINK=.
      0084C6 06                       3         .byte 6  
      0084C7 46 43 2D 58 4F 4E        4         .ascii "FC-XON"
      0084CD                          5         FC_XON:
      0084CD 1D 00 02         [ 2]  871         subw x,#CELLL 
      0084D0 7F               [ 1]  872         clr (x)
      0084D1 A6 11            [ 1]  873         ld a,#XON 
      0084D3 E7 01            [ 1]  874         ld (1,x),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 20.
Hexadecimal [24-Bits]



      0084D5 CD 84 B6         [ 4]  875         call EMIT 
      0084D8 81               [ 4]  876         ret 
                                    877 
                                    878 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    879 ;       FC-XOFF ( -- )
                                    880 ;       Send XOFF character 
                                    881 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000459                        882         _HEADER FC_XOFF,7,"FC-XOFF"
      0084D9 84 C6                    1         .word LINK 
                           00045B     2         LINK=.
      0084DB 07                       3         .byte 7  
      0084DC 46 43 2D 58 4F 46 46     4         .ascii "FC-XOFF"
      0084E3                          5         FC_XOFF:
      0084E3 1D 00 02         [ 2]  883         subw x,#CELLL 
      0084E6 7F               [ 1]  884         clr (x)
      0084E7 A6 13            [ 1]  885         ld a,#XOFF 
      0084E9 E7 01            [ 1]  886         ld (1,x),a 
      0084EB CD 84 B6         [ 4]  887         call EMIT 
      0084EE 81               [ 4]  888         ret
                                    889 
                                    890 ;; The kernel
                                    891 
                                    892 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    893 ;       doLIT   ( -- w )
                                    894 ;       Push an inline literal.
                                    895 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0084EF                        896 DOLIT:
      0084EF 1D 00 02         [ 2]  897 	SUBW X,#2
      0084F2 16 01            [ 2]  898         ldw y,(1,sp)
      0084F4 90 FE            [ 2]  899         ldw y,(y)
      0084F6 FF               [ 2]  900         ldw (x),y
      0084F7 90 85            [ 2]  901         popw y 
      0084F9 90 EC 02         [ 2]  902         jp (2,y)
                                    903 
                                    904 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    905 ;       NEXT    ( -- )
                                    906 ;       Code for  single index loop.
                                    907 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00047C                        908         _HEADER DONXT,COMPO+4,"NEXT"
      0084FC 84 DB                    1         .word LINK 
                           00047E     2         LINK=.
      0084FE 44                       3         .byte COMPO+4  
      0084FF 4E 45 58 54              4         .ascii "NEXT"
      008503                          5         DONXT:
      008503 16 03            [ 2]  909 	LDW Y,(3,SP)
      008505 90 5A            [ 2]  910 	DECW Y
      008507 2A 07            [ 1]  911 	JRPL NEX1 ; jump if N=0
      008509 90 85            [ 2]  912 	POPW Y
      00850B 5B 02            [ 2]  913         addw sp,#2
      00850D 90 EC 02         [ 2]  914         JP (2,Y)
      008510                        915 NEX1:
      008510 17 03            [ 2]  916         LDW (3,SP),Y
      008512 90 85            [ 2]  917         POPW Y
      008514 90 FE            [ 2]  918 	LDW Y,(Y)
      008516 90 FC            [ 2]  919 	JP (Y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 21.
Hexadecimal [24-Bits]



                                    920 
                                    921 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    922 ;       ?branch ( f -- )
                                    923 ;       Branch if flag is zero.
                                    924 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    925 ;       _HEADER QBRAN,COMPO+7,"?BRANCH"        
      008518                        926 QBRAN:	
      008518 90 93            [ 1]  927         LDW Y,X
      00851A 1C 00 02         [ 2]  928 	ADDW X,#2
      00851D 90 FE            [ 2]  929 	LDW Y,(Y)
      00851F 27 13            [ 1]  930         JREQ     BRAN
      008521 90 85            [ 2]  931 	POPW Y
      008523 90 EC 02         [ 2]  932 	JP (2,Y)
                                    933 
                                    934 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    935 ;  TBRANCH ( f -- )
                                    936 ;  branch if f==TRUE 
                                    937 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    938 ;        _HEADER TBRAN,COMPO+7,"TBRANCH"
      008526                        939 TBRAN: 
      008526 90 93            [ 1]  940         LDW Y,X 
      008528 1C 00 02         [ 2]  941         ADDW X,#2 
      00852B 90 FE            [ 2]  942         LDW Y,(Y)
      00852D 26 05            [ 1]  943         JRNE BRAN 
      00852F 90 85            [ 2]  944         POPW Y 
      008531 90 EC 02         [ 2]  945         JP (2,Y)
                                    946 
                                    947 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    948 ;       branch  ( -- )
                                    949 ;       Branch to an inline address.
                                    950 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    951 ;       _HEADER BRAN,COMPO+6,"BRANCH"
      008534                        952 BRAN:
      008534 90 85            [ 2]  953         POPW Y
      008536 90 FE            [ 2]  954 	LDW Y,(Y)
      008538 90 FC            [ 2]  955         JP  (Y)
                                    956 
                                    957 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    958 ;       EXECUTE ( ca -- )
                                    959 ;       Execute  word at ca.
                                    960 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0004BA                        961         _HEADER EXECU,7,"EXECUTE"
      00853A 84 FE                    1         .word LINK 
                           0004BC     2         LINK=.
      00853C 07                       3         .byte 7  
      00853D 45 58 45 43 55 54 45     4         .ascii "EXECUTE"
      008544                          5         EXECU:
      008544 90 93            [ 1]  962         LDW Y,X
      008546 1C 00 02         [ 2]  963 	ADDW X,#CELLL 
      008549 90 FE            [ 2]  964 	LDW  Y,(Y)
      00854B 90 FC            [ 2]  965         JP   (Y)
                                    966 
                           000001   967 OPTIMIZE = 1
                           000001   968 .if OPTIMIZE 
                                    969 ; remplacement de CALL EXIT par 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 22.
Hexadecimal [24-Bits]



                                    970 ; le opcode de RET.
                                    971 ; Voir modification au code de ";"
                           000000   972 .else 
                                    973 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    974 ;       EXIT    ( -- )
                                    975 ;       Terminate a colon definition.
                                    976 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    977 ;       _HEADER EXIT,4,"EXIT"
                                    978 EXIT:
                                    979         POPW Y
                                    980         RET
                                    981 .endif 
                                    982 
                                    983 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    984 ;       !       ( w a -- )
                                    985 ;       Pop  data stack to memory.
                                    986 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0004CD                        987         _HEADER STORE,1,"!"
      00854D 85 3C                    1         .word LINK 
                           0004CF     2         LINK=.
      00854F 01                       3         .byte 1  
      008550 21                       4         .ascii "!"
      008551                          5         STORE:
      008551 90 93            [ 1]  988         LDW Y,X
      008553 90 FE            [ 2]  989         LDW Y,(Y)    ;Y=a
      008555 89               [ 2]  990         PUSHW X
      008556 EE 02            [ 2]  991         LDW X,(2,X) ; x=w 
      008558 90 FF            [ 2]  992         LDW (Y),X 
      00855A 85               [ 2]  993         POPW X  
      00855B 1C 00 04         [ 2]  994         ADDW X,#4 ; DDROP 
      00855E 81               [ 4]  995         RET     
                                    996 
                                    997 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    998 ;       @       ( a -- w )
                                    999 ;       Push memory location to stack.
                                   1000 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0004DF                       1001         _HEADER AT,1,"@"
      00855F 85 4F                    1         .word LINK 
                           0004E1     2         LINK=.
      008561 01                       3         .byte 1  
      008562 40                       4         .ascii "@"
      008563                          5         AT:
      008563 90 93            [ 1] 1002         LDW Y,X     ;Y = a
      008565 90 FE            [ 2] 1003         LDW Y,(Y)   ; address 
      008567 90 FE            [ 2] 1004         LDW Y,(Y)   ; value 
      008569 FF               [ 2] 1005         LDW (X),Y ;w = @Y
      00856A 81               [ 4] 1006         RET     
                                   1007 
                                   1008 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1009 ;       C!      ( c b -- )
                                   1010 ;       Pop  data stack to byte memory.
                                   1011 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0004EB                       1012         _HEADER CSTOR,2,"C!"
      00856B 85 61                    1         .word LINK 
                           0004ED     2         LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 23.
Hexadecimal [24-Bits]



      00856D 02                       3         .byte 2  
      00856E 43 21                    4         .ascii "C!"
      008570                          5         CSTOR:
      008570 90 93            [ 1] 1013         LDW Y,X
      008572 90 FE            [ 2] 1014 	LDW Y,(Y)    ;Y=b
      008574 E6 03            [ 1] 1015         LD A,(3,X)    ;D = c
      008576 90 F7            [ 1] 1016         LD  (Y),A     ;store c at b
      008578 1C 00 04         [ 2] 1017 	ADDW X,#4 ; DDROP 
      00857B 81               [ 4] 1018         RET     
                                   1019 
                                   1020 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1021 ;       C@      ( b -- c )
                                   1022 ;       Push byte in memory to  stack.
                                   1023 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0004FC                       1024         _HEADER CAT,2,"C@"
      00857C 85 6D                    1         .word LINK 
                           0004FE     2         LINK=.
      00857E 02                       3         .byte 2  
      00857F 43 40                    4         .ascii "C@"
      008581                          5         CAT:
      008581 90 93            [ 1] 1025         LDW Y,X     ;Y=b
      008583 90 FE            [ 2] 1026         LDW Y,(Y)
      008585 90 F6            [ 1] 1027         LD A,(Y)
      008587 E7 01            [ 1] 1028         LD (1,X),A
      008589 7F               [ 1] 1029         CLR (X)
      00858A 81               [ 4] 1030         RET     
                                   1031 
                                   1032 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1033 ;       RP@     ( -- a )
                                   1034 ;       Push current RP to data stack.
                                   1035 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00050B                       1036         _HEADER RPAT,3,"RP@"
      00858B 85 7E                    1         .word LINK 
                           00050D     2         LINK=.
      00858D 03                       3         .byte 3  
      00858E 52 50 40                 4         .ascii "RP@"
      008591                          5         RPAT:
      008591 90 96            [ 1] 1037         LDW Y,SP    ;save return addr
      008593 1D 00 02         [ 2] 1038         SUBW X,#2
      008596 FF               [ 2] 1039         LDW (X),Y
      008597 81               [ 4] 1040         RET     
                                   1041 
                                   1042 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1043 ;       RP!     ( a -- )
                                   1044 ;       Set  return stack pointer.
                                   1045 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000518                       1046         _HEADER RPSTO,COMPO+3,"RP!"
      008598 85 8D                    1         .word LINK 
                           00051A     2         LINK=.
      00859A 43                       3         .byte COMPO+3  
      00859B 52 50 21                 4         .ascii "RP!"
      00859E                          5         RPSTO:
      00859E 90 85            [ 2] 1047         POPW Y
      0085A0 90 BF 26         [ 2] 1048         LDW YTEMP,Y
      0085A3 90 93            [ 1] 1049         LDW Y,X
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 24.
Hexadecimal [24-Bits]



      0085A5 90 FE            [ 2] 1050         LDW Y,(Y)
      0085A7 90 94            [ 1] 1051         LDW SP,Y
      0085A9 1C 00 02         [ 2] 1052         ADDW X,#CELLL ; a was not dropped, Picatout 2020-05-24
      0085AC 92 CC 26         [ 5] 1053         JP [YTEMP]
                                   1054 
                                   1055 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1056 ;       R>      ( -- w )
                                   1057 ;       Pop return stack to data stack.
                                   1058 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00052F                       1059         _HEADER RFROM,2,"R>"
      0085AF 85 9A                    1         .word LINK 
                           000531     2         LINK=.
      0085B1 02                       3         .byte 2  
      0085B2 52 3E                    4         .ascii "R>"
      0085B4                          5         RFROM:
      0085B4 1D 00 02         [ 2] 1060         SUBW X,#CELLL 
      0085B7 16 03            [ 2] 1061         LDW Y,(3,SP)
      0085B9 FF               [ 2] 1062         LDW (X),Y 
      0085BA 90 85            [ 2] 1063         POPW Y 
      0085BC 5B 02            [ 2] 1064         ADDW SP,#2 
      0085BE 90 FC            [ 2] 1065         JP (Y)
                                   1066 
                                   1067 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1068 ;       R@      ( -- w )
                                   1069 ;       Copy top of return stack to stack.
                                   1070 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000540                       1071         _HEADER RAT,2,"R@"
      0085C0 85 B1                    1         .word LINK 
                           000542     2         LINK=.
      0085C2 02                       3         .byte 2  
      0085C3 52 40                    4         .ascii "R@"
      0085C5                          5         RAT:
      0085C5 16 03            [ 2] 1072         ldw y,(3,sp)
      0085C7 1D 00 02         [ 2] 1073         subw x,#CELLL 
      0085CA FF               [ 2] 1074         ldw (x),y 
      0085CB 81               [ 4] 1075         ret 
                                   1076 
                                   1077 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1078 ;       LOCAL ( n -- )
                                   1079 ;       reserve n slots on return stack
                                   1080 ;       for local variables 
                                   1081 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00054C                       1082         _HEADER LOCAL,5,"LOCAL"
      0085CC 85 C2                    1         .word LINK 
                           00054E     2         LINK=.
      0085CE 05                       3         .byte 5  
      0085CF 4C 4F 43 41 4C           4         .ascii "LOCAL"
      0085D4                          5         LOCAL:
      0085D4 90 85            [ 2] 1083         POPW Y  
      0085D6 90 BF 26         [ 2] 1084         LDW YTEMP,Y ; RETURN ADDRESS 
      0085D9 E6 01            [ 1] 1085         LD A,(1,X)
      0085DB 90 97            [ 1] 1086         LD YL,A 
      0085DD A6 02            [ 1] 1087         LD A,#CELLL 
      0085DF 90 42            [ 4] 1088         MUL Y,A 
      0085E1 90 BF 24         [ 2] 1089         LDw XTEMP,Y
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 25.
Hexadecimal [24-Bits]



      0085E4 90 96            [ 1] 1090         LDW Y,SP 
      0085E6 72 B2 00 24      [ 2] 1091         SUBW Y,XTEMP
      0085EA 90 94            [ 1] 1092         LDW SP,Y 
      0085EC 1C 00 02         [ 2] 1093         ADDW X,#CELLL 
      0085EF 92 CC 26         [ 5] 1094         JP [YTEMP]
                                   1095 
                                   1096 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1097 ;       NRDROP ( n -- )
                                   1098 ;       drop n elements from rstack
                                   1099 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000572                       1100         _HEADER NRDROP,6,"NRDROP" 
      0085F2 85 CE                    1         .word LINK 
                           000574     2         LINK=.
      0085F4 06                       3         .byte 6  
      0085F5 4E 52 44 52 4F 50        4         .ascii "NRDROP"
      0085FB                          5         NRDROP:
      0085FB 90 85            [ 2] 1101         POPW Y 
      0085FD 90 BF 26         [ 2] 1102         LDW YTEMP,Y ; RETURN ADDRESS 
      008600 E6 01            [ 1] 1103         LD A,(1,X)
      008602 90 97            [ 1] 1104         LD YL,A  
      008604 A6 02            [ 1] 1105         LD A,#CELLL 
      008606 90 42            [ 4] 1106         MUL Y,A 
      008608 90 BF 24         [ 2] 1107         LDW XTEMP,Y 
      00860B 90 96            [ 1] 1108         LDW Y,SP 
      00860D 72 B9 00 24      [ 2] 1109         ADDW Y,XTEMP 
      008611 90 94            [ 1] 1110         LDW SP,Y  
      008613 1C 00 02         [ 2] 1111         ADDW X,#CELLL 
      008616 92 CC 26         [ 5] 1112         JP [YTEMP]
                                   1113 
                                   1114 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1115 ;        ( n -- w)
                                   1116 ;      fetch nth element ofr return stack 
                                   1117 ;      n==0 is same as R@ 
                                   1118 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000599                       1119         _HEADER NRAT,3,"NR@"
      008619 85 F4                    1         .word LINK 
                           00059B     2         LINK=.
      00861B 03                       3         .byte 3  
      00861C 4E 52 40                 4         .ascii "NR@"
      00861F                          5         NRAT:
      00861F E6 01            [ 1] 1120         LD A,(1,X)
      008621 90 97            [ 1] 1121         LD YL,A 
      008623 A6 02            [ 1] 1122         LD A,#CELLL 
      008625 90 42            [ 4] 1123         MUL Y,A 
      008627 90 BF 26         [ 2] 1124         LDW YTEMP,Y 
      00862A 90 96            [ 1] 1125         LDW Y,SP 
      00862C 72 A9 00 03      [ 2] 1126         ADDW Y,#3 
      008630 72 B9 00 26      [ 2] 1127         ADDW Y,YTEMP 
      008634 90 FE            [ 2] 1128         LDW Y,(Y)
      008636 FF               [ 2] 1129         LDW (X),Y 
      008637 81               [ 4] 1130         RET 
                                   1131 
                                   1132 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1133 ;       NR! ( w n --  )
                                   1134 ;       store w on nth position of 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 26.
Hexadecimal [24-Bits]



                                   1135 ;       return stack 
                                   1136 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0005B8                       1137         _HEADER NRSTO,3,"NR!"
      008638 86 1B                    1         .word LINK 
                           0005BA     2         LINK=.
      00863A 03                       3         .byte 3  
      00863B 4E 52 21                 4         .ascii "NR!"
      00863E                          5         NRSTO:
      00863E 90 96            [ 1] 1138         LDW Y,SP
      008640 72 A9 00 03      [ 2] 1139         ADDW Y,#3 
      008644 90 BF 26         [ 2] 1140         LDW YTEMP,Y 
      008647 E6 01            [ 1] 1141         LD A,(1,X)
      008649 90 97            [ 1] 1142         LD YL,A 
      00864B A6 02            [ 1] 1143         LD A,#CELLL 
      00864D 90 42            [ 4] 1144         MUL Y,A 
      00864F 72 B9 00 26      [ 2] 1145         ADDW Y,YTEMP
      008653 89               [ 2] 1146         PUSHW X 
      008654 EE 02            [ 2] 1147         LDW X,(2,X)
      008656 90 FF            [ 2] 1148         LDW (Y),X
      008658 85               [ 2] 1149         POPW X 
      008659 1C 00 04         [ 2] 1150         ADDW X,#2*CELLL 
      00865C 81               [ 4] 1151         RET 
                                   1152 
                                   1153 
                                   1154 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1155 ;       >R      ( w -- )
                                   1156 ;       Push data stack to return stack.
                                   1157 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0005DD                       1158         _HEADER TOR,COMPO+2,">R"
      00865D 86 3A                    1         .word LINK 
                           0005DF     2         LINK=.
      00865F 42                       3         .byte COMPO+2  
      008660 3E 52                    4         .ascii ">R"
      008662                          5         TOR:
      008662 90 85            [ 2] 1159         POPW Y    ;save return addr
      008664 90 BF 26         [ 2] 1160         LDW YTEMP,Y
      008667 90 93            [ 1] 1161         LDW Y,X
      008669 90 FE            [ 2] 1162         LDW Y,(Y)  ; W
      00866B 90 89            [ 2] 1163         PUSHW Y    ;W >R 
      00866D 1C 00 02         [ 2] 1164         ADDW X,#2
      008670 92 CC 26         [ 5] 1165         JP [YTEMP]
                                   1166 
                                   1167 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1168 ;       SP@     ( -- a )
                                   1169 ;       Push current stack pointer.
                                   1170 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0005F3                       1171         _HEADER SPAT,3,"SP@"
      008673 86 5F                    1         .word LINK 
                           0005F5     2         LINK=.
      008675 03                       3         .byte 3  
      008676 53 50 40                 4         .ascii "SP@"
      008679                          5         SPAT:
      008679 90 93            [ 1] 1172 	LDW Y,X
      00867B 1D 00 02         [ 2] 1173         SUBW X,#2
      00867E FF               [ 2] 1174 	LDW (X),Y
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 27.
Hexadecimal [24-Bits]



      00867F 81               [ 4] 1175         RET     
                                   1176 
                                   1177 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1178 ;       SP!     ( a -- )
                                   1179 ;       Set  data stack pointer.
                                   1180 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000600                       1181         _HEADER SPSTO,3,"SP!"
      008680 86 75                    1         .word LINK 
                           000602     2         LINK=.
      008682 03                       3         .byte 3  
      008683 53 50 21                 4         .ascii "SP!"
      008686                          5         SPSTO:
      008686 FE               [ 2] 1182         LDW     X,(X)     ;X = a
      008687 81               [ 4] 1183         RET     
                                   1184 
                                   1185 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1186 ;       DROP    ( w -- )
                                   1187 ;       Discard top stack item.
                                   1188 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000608                       1189         _HEADER DROP,4,"DROP"
      008688 86 82                    1         .word LINK 
                           00060A     2         LINK=.
      00868A 04                       3         .byte 4  
      00868B 44 52 4F 50              4         .ascii "DROP"
      00868F                          5         DROP:
      00868F 1C 00 02         [ 2] 1190         ADDW X,#2     
      008692 81               [ 4] 1191         RET     
                                   1192 
                                   1193 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1194 ;       DUP     ( w -- w w )
                                   1195 ;       Duplicate  top stack item.
                                   1196 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000613                       1197         _HEADER DUPP,3,"DUP"
      008693 86 8A                    1         .word LINK 
                           000615     2         LINK=.
      008695 03                       3         .byte 3  
      008696 44 55 50                 4         .ascii "DUP"
      008699                          5         DUPP:
      008699 90 93            [ 1] 1198 	LDW Y,X
      00869B 1D 00 02         [ 2] 1199         SUBW X,#2
      00869E 90 FE            [ 2] 1200 	LDW Y,(Y)
      0086A0 FF               [ 2] 1201 	LDW (X),Y
      0086A1 81               [ 4] 1202         RET     
                                   1203 
                                   1204 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1205 ;       SWAP    ( w1 w2 -- w2 w1 )
                                   1206 ;       Exchange top two stack items.
                                   1207 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000622                       1208         _HEADER SWAPP,4,"SWAP"
      0086A2 86 95                    1         .word LINK 
                           000624     2         LINK=.
      0086A4 04                       3         .byte 4  
      0086A5 53 57 41 50              4         .ascii "SWAP"
      0086A9                          5         SWAPP:
      0086A9 90 93            [ 1] 1209         LDW Y,X
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 28.
Hexadecimal [24-Bits]



      0086AB 90 FE            [ 2] 1210         LDW Y,(Y)
      0086AD 90 89            [ 2] 1211         PUSHW Y  
      0086AF 90 93            [ 1] 1212         LDW Y,X
      0086B1 90 EE 02         [ 2] 1213         LDW Y,(2,Y)
      0086B4 FF               [ 2] 1214         LDW (X),Y
      0086B5 90 85            [ 2] 1215         POPW Y 
      0086B7 EF 02            [ 2] 1216         LDW (2,X),Y
      0086B9 81               [ 4] 1217         RET     
                                   1218 
                                   1219 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1220 ;       OVER    ( w1 w2 -- w1 w2 w1 )
                                   1221 ;       Copy second stack item to top.
                                   1222 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00063A                       1223         _HEADER OVER,4,"OVER"
      0086BA 86 A4                    1         .word LINK 
                           00063C     2         LINK=.
      0086BC 04                       3         .byte 4  
      0086BD 4F 56 45 52              4         .ascii "OVER"
      0086C1                          5         OVER:
      0086C1 1D 00 02         [ 2] 1224         SUBW X,#2
      0086C4 90 93            [ 1] 1225         LDW Y,X
      0086C6 90 EE 04         [ 2] 1226         LDW Y,(4,Y)
      0086C9 FF               [ 2] 1227         LDW (X),Y
      0086CA 81               [ 4] 1228         RET     
                                   1229 
                                   1230 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1231 ;       0<      ( n -- t )
                                   1232 ;       Return true if n is negative.
                                   1233 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00064B                       1234         _HEADER ZLESS,2,"0<"
      0086CB 86 BC                    1         .word LINK 
                           00064D     2         LINK=.
      0086CD 02                       3         .byte 2  
      0086CE 30 3C                    4         .ascii "0<"
      0086D0                          5         ZLESS:
      0086D0 A6 FF            [ 1] 1235         LD A,#0xFF
      0086D2 90 93            [ 1] 1236         LDW Y,X
      0086D4 90 FE            [ 2] 1237         LDW Y,(Y)
      0086D6 2B 01            [ 1] 1238         JRMI     ZL1
      0086D8 4F               [ 1] 1239         CLR A   ;false
      0086D9 F7               [ 1] 1240 ZL1:    LD     (X),A
      0086DA E7 01            [ 1] 1241         LD (1,X),A
      0086DC 81               [ 4] 1242 	RET     
                                   1243 
                                   1244 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1245 ;       0= ( n -- f )
                                   1246 ;   n==0?
                                   1247 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00065D                       1248         _HEADER ZEQUAL,2,"0="
      0086DD 86 CD                    1         .word LINK 
                           00065F     2         LINK=.
      0086DF 02                       3         .byte 2  
      0086E0 30 3D                    4         .ascii "0="
      0086E2                          5         ZEQUAL:
      0086E2 A6 FF            [ 1] 1249         LD A,#0XFF 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 29.
Hexadecimal [24-Bits]



      0086E4 90 93            [ 1] 1250         LDW Y,X 
      0086E6 90 FE            [ 2] 1251         LDW Y,(Y)
      0086E8 27 02            [ 1] 1252         JREQ ZEQU1 
      0086EA A6 00            [ 1] 1253         LD A,#0 
      0086EC                       1254 ZEQU1:  
      0086EC F7               [ 1] 1255         LD (X),A 
      0086ED E7 01            [ 1] 1256         LD (1,X),A         
      0086EF 81               [ 4] 1257         RET 
                                   1258 
                                   1259 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1260 ;       AND     ( w w -- w )
                                   1261 ;       Bitwise AND.
                                   1262 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000670                       1263         _HEADER ANDD,3,"AND"
      0086F0 86 DF                    1         .word LINK 
                           000672     2         LINK=.
      0086F2 03                       3         .byte 3  
      0086F3 41 4E 44                 4         .ascii "AND"
      0086F6                          5         ANDD:
      0086F6 F6               [ 1] 1264         LD  A,(X)    ;D=w
      0086F7 E4 02            [ 1] 1265         AND A,(2,X)
      0086F9 E7 02            [ 1] 1266         LD (2,X),A
      0086FB E6 01            [ 1] 1267         LD A,(1,X)
      0086FD E4 03            [ 1] 1268         AND A,(3,X)
      0086FF E7 03            [ 1] 1269         LD (3,X),A
      008701 1C 00 02         [ 2] 1270         ADDW X,#2
      008704 81               [ 4] 1271         RET
                                   1272 
                                   1273 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1274 ;       OR      ( w w -- w )
                                   1275 ;       Bitwise inclusive OR.
                                   1276 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000685                       1277         _HEADER ORR,2,"OR"
      008705 86 F2                    1         .word LINK 
                           000687     2         LINK=.
      008707 02                       3         .byte 2  
      008708 4F 52                    4         .ascii "OR"
      00870A                          5         ORR:
      00870A F6               [ 1] 1278         LD A,(X)    ;D=w
      00870B EA 02            [ 1] 1279         OR A,(2,X)
      00870D E7 02            [ 1] 1280         LD (2,X),A
      00870F E6 01            [ 1] 1281         LD A,(1,X)
      008711 EA 03            [ 1] 1282         OR A,(3,X)
      008713 E7 03            [ 1] 1283         LD (3,X),A
      008715 1C 00 02         [ 2] 1284         ADDW X,#2
      008718 81               [ 4] 1285         RET
                                   1286 
                                   1287 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1288 ;       XOR     ( w w -- w )
                                   1289 ;       Bitwise exclusive OR.
                                   1290 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000699                       1291         _HEADER XORR,3,"XOR"
      008719 87 07                    1         .word LINK 
                           00069B     2         LINK=.
      00871B 03                       3         .byte 3  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 30.
Hexadecimal [24-Bits]



      00871C 58 4F 52                 4         .ascii "XOR"
      00871F                          5         XORR:
      00871F F6               [ 1] 1292         LD A,(X)    ;D=w
      008720 E8 02            [ 1] 1293         XOR A,(2,X)
      008722 E7 02            [ 1] 1294         LD (2,X),A
      008724 E6 01            [ 1] 1295         LD A,(1,X)
      008726 E8 03            [ 1] 1296         XOR A,(3,X)
      008728 E7 03            [ 1] 1297         LD (3,X),A
      00872A 1C 00 02         [ 2] 1298         ADDW X,#2
      00872D 81               [ 4] 1299         RET
                                   1300 
                                   1301 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1302 ;       UM+     ( u u -- udsum )
                                   1303 ;       Add two unsigned single
                                   1304 ;       and return a double sum.
                                   1305 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0006AE                       1306         _HEADER UPLUS,3,"UM+"
      00872E 87 1B                    1         .word LINK 
                           0006B0     2         LINK=.
      008730 03                       3         .byte 3  
      008731 55 4D 2B                 4         .ascii "UM+"
      008734                          5         UPLUS:
      008734 A6 01            [ 1] 1307         LD A,#1
      008736 90 93            [ 1] 1308         LDW Y,X
      008738 90 EE 02         [ 2] 1309         LDW Y,(2,Y)
      00873B 90 BF 26         [ 2] 1310         LDW YTEMP,Y
      00873E 90 93            [ 1] 1311         LDW Y,X
      008740 90 FE            [ 2] 1312         LDW Y,(Y)
      008742 72 B9 00 26      [ 2] 1313         ADDW Y,YTEMP
      008746 EF 02            [ 2] 1314         LDW (2,X),Y
      008748 25 01            [ 1] 1315         JRC     UPL1
      00874A 4F               [ 1] 1316         CLR A
      00874B E7 01            [ 1] 1317 UPL1:   LD     (1,X),A
      00874D 7F               [ 1] 1318         CLR (X)
      00874E 81               [ 4] 1319         RET
                                   1320 
                                   1321 ;; System and user variables
                                   1322 
                                   1323 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1324 ;       doVAR   ( -- a )
                                   1325 ;       run time code 
                                   1326 ;       for VARIABLE and CREATE.
                                   1327 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1328 ;       HEADER DOVAR,COMPO+5,"DOVAR"
      00874F                       1329 DOVAR:
      00874F 1D 00 02         [ 2] 1330 	SUBW X,#2
      008752 90 85            [ 2] 1331         POPW Y    ;get return addr (pfa)
      008754 90 FE            [ 2] 1332         LDW Y,(Y) ; indirect address 
      008756 FF               [ 2] 1333         LDW (X),Y    ;push on stack
      008757 81               [ 4] 1334         RET     ;go to RET of EXEC
                                   1335 
                                   1336 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1337 ;       BASE    ( -- a )
                                   1338 ;       Radix base for numeric I/O.
                                   1339 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 31.
Hexadecimal [24-Bits]



      0006D8                       1340         _HEADER BASE,4,"BASE"
      008758 87 30                    1         .word LINK 
                           0006DA     2         LINK=.
      00875A 04                       3         .byte 4  
      00875B 42 41 53 45              4         .ascii "BASE"
      00875F                          5         BASE:
      00875F 90 AE 00 06      [ 2] 1341 	LDW Y,#UBASE 
      008763 1D 00 02         [ 2] 1342 	SUBW X,#2
      008766 FF               [ 2] 1343         LDW (X),Y
      008767 81               [ 4] 1344         RET
                                   1345 
                                   1346 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1347 ;       tmp     ( -- a )
                                   1348 ;       A temporary storage.
                                   1349 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0006E8                       1350         _HEADER TEMP,3,"TMP"
      008768 87 5A                    1         .word LINK 
                           0006EA     2         LINK=.
      00876A 03                       3         .byte 3  
      00876B 54 4D 50                 4         .ascii "TMP"
      00876E                          5         TEMP:
      00876E 90 AE 00 0A      [ 2] 1351 	LDW Y,#UTMP
      008772 1D 00 02         [ 2] 1352 	SUBW X,#2
      008775 FF               [ 2] 1353         LDW (X),Y
      008776 81               [ 4] 1354         RET
                                   1355 
                                   1356 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1357 ;       >IN     ( -- a )
                                   1358 ;        Hold parsing pointer.
                                   1359 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0006F7                       1360         _HEADER INN,3,">IN"
      008777 87 6A                    1         .word LINK 
                           0006F9     2         LINK=.
      008779 03                       3         .byte 3  
      00877A 3E 49 4E                 4         .ascii ">IN"
      00877D                          5         INN:
      00877D 90 AE 00 0C      [ 2] 1361 	LDW Y,#UINN 
      008781 1D 00 02         [ 2] 1362 	SUBW X,#2
      008784 FF               [ 2] 1363         LDW (X),Y
      008785 81               [ 4] 1364         RET
                                   1365 
                                   1366 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1367 ;       #TIB    ( -- a )
                                   1368 ;       Count in terminal input 
                                   1369 ;       buffer.
                                   1370 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000706                       1371         _HEADER NTIB,4,"#TIB"
      008786 87 79                    1         .word LINK 
                           000708     2         LINK=.
      008788 04                       3         .byte 4  
      008789 23 54 49 42              4         .ascii "#TIB"
      00878D                          5         NTIB:
      00878D 90 AE 00 0E      [ 2] 1372 	LDW Y,#UCTIB 
      008791 1D 00 02         [ 2] 1373 	SUBW X,#2
      008794 FF               [ 2] 1374         LDW (X),Y
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 32.
Hexadecimal [24-Bits]



      008795 81               [ 4] 1375         RET
                                   1376 
                                   1377 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1378 ;       TBUF ( -- a )
                                   1379 ;       address of 128 bytes 
                                   1380 ;       transaction buffer
                                   1381 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000716                       1382         _HEADER TBUF,4,"TBUF"
      008796 87 88                    1         .word LINK 
                           000718     2         LINK=.
      008798 04                       3         .byte 4  
      008799 54 42 55 46              4         .ascii "TBUF"
      00879D                          5         TBUF:
      00879D 90 AE 16 80      [ 2] 1383         ldw y,#ROWBUFF
      0087A1 1D 00 02         [ 2] 1384         subw x,#CELLL
      0087A4 FF               [ 2] 1385         ldw (x),y 
      0087A5 81               [ 4] 1386         ret 
                                   1387 
                                   1388 ; systeme variable 
                                   1389 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1390 ; compilation destination 
                                   1391 ; TFLASH ( -- A )
                                   1392 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000726                       1393         _HEADER TFLASH,6,"TFLASH"
      0087A6 87 98                    1         .word LINK 
                           000728     2         LINK=.
      0087A8 06                       3         .byte 6  
      0087A9 54 46 4C 41 53 48        4         .ascii "TFLASH"
      0087AF                          5         TFLASH:
      0087AF 1D 00 02         [ 2] 1394         subw x,#CELLL 
      0087B2 90 AE 00 20      [ 2] 1395         ldw y,#UTFLASH
      0087B6 FF               [ 2] 1396         ldw (x),y 
      0087B7 81               [ 4] 1397         ret 
                                   1398 
                                   1399 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1400 ;       "EVAL   ( -- a )
                                   1401 ;       Execution vector of EVAL.
                                   1402 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000738                       1403         _HEADER TEVAL,5,"'EVAL"
      0087B8 87 A8                    1         .word LINK 
                           00073A     2         LINK=.
      0087BA 05                       3         .byte 5  
      0087BB 27 45 56 41 4C           4         .ascii "'EVAL"
      0087C0                          5         TEVAL:
      0087C0 90 AE 00 12      [ 2] 1404 	LDW Y,#UINTER 
      0087C4 1D 00 02         [ 2] 1405 	SUBW X,#2
      0087C7 FF               [ 2] 1406         LDW (X),Y
      0087C8 81               [ 4] 1407         RET
                                   1408 
                                   1409 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1410 ;       HLD     ( -- a )
                                   1411 ;       Hold a pointer of output
                                   1412 ;        string.
                                   1413 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000749                       1414         _HEADER HLD,3,"HLD"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 33.
Hexadecimal [24-Bits]



      0087C9 87 BA                    1         .word LINK 
                           00074B     2         LINK=.
      0087CB 03                       3         .byte 3  
      0087CC 48 4C 44                 4         .ascii "HLD"
      0087CF                          5         HLD:
      0087CF 90 AE 00 14      [ 2] 1415 	LDW Y,#UHLD 
      0087D3 1D 00 02         [ 2] 1416 	SUBW X,#2
      0087D6 FF               [ 2] 1417         LDW (X),Y
      0087D7 81               [ 4] 1418         RET
                                   1419 
                                   1420 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1421 ;       CONTEXT ( -- a )
                                   1422 ;       Start vocabulary search.
                                   1423 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000758                       1424         _HEADER CNTXT,7,"CONTEXT"
      0087D8 87 CB                    1         .word LINK 
                           00075A     2         LINK=.
      0087DA 07                       3         .byte 7  
      0087DB 43 4F 4E 54 45 58 54     4         .ascii "CONTEXT"
      0087E2                          5         CNTXT:
      0087E2 90 AE 00 16      [ 2] 1425 	LDW Y,#UCNTXT
      0087E6 1D 00 02         [ 2] 1426 	SUBW X,#2
      0087E9 FF               [ 2] 1427         LDW (X),Y
      0087EA 81               [ 4] 1428         RET
                                   1429 
                                   1430 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1431 ;       VP      ( -- a )
                                   1432 ;       Point to top of variables
                                   1433 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00076B                       1434         _HEADER VPP,2,"VP"
      0087EB 87 DA                    1         .word LINK 
                           00076D     2         LINK=.
      0087ED 02                       3         .byte 2  
      0087EE 56 50                    4         .ascii "VP"
      0087F0                          5         VPP:
      0087F0 90 AE 00 18      [ 2] 1435 	LDW Y,#UVP 
      0087F4 1D 00 02         [ 2] 1436 	SUBW X,#2
      0087F7 FF               [ 2] 1437         LDW (X),Y
      0087F8 81               [ 4] 1438         RET
                                   1439 
                                   1440 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1441 ;       CP    ( -- a )
                                   1442 ;       Pointer to top of FLASH 
                                   1443 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000779                       1444         _HEADER CPP,2,"CP"
      0087F9 87 ED                    1         .word LINK 
                           00077B     2         LINK=.
      0087FB 02                       3         .byte 2  
      0087FC 43 50                    4         .ascii "CP"
      0087FE                          5         CPP:
      0087FE 90 AE 00 1A      [ 2] 1445         ldw y,#UCP 
      008802 1D 00 02         [ 2] 1446         subw x,#CELLL 
      008805 FF               [ 2] 1447         ldw (x),y 
      008806 81               [ 4] 1448         ret                
                                   1449 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



                                   1450 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1451 ;       LAST    ( -- a )
                                   1452 ;       Point to last name in 
                                   1453 ;       dictionary.
                                   1454 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000787                       1455         _HEADER LAST,4,"LAST"
      008807 87 FB                    1         .word LINK 
                           000789     2         LINK=.
      008809 04                       3         .byte 4  
      00880A 4C 41 53 54              4         .ascii "LAST"
      00880E                          5         LAST:
      00880E 90 AE 00 1C      [ 2] 1456 	LDW Y,#ULAST 
      008812 1D 00 02         [ 2] 1457 	SUBW X,#2
      008815 FF               [ 2] 1458         LDW (X),Y
      008816 81               [ 4] 1459         RET
                                   1460 
                                   1461 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1462 ; address of system variable URLAST 
                                   1463 ;       RAMLAST ( -- a )
                                   1464 ; RAM dictionary context 
                                   1465 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000797                       1466         _HEADER RAMLAST,7,"RAMLAST"
      008817 88 09                    1         .word LINK 
                           000799     2         LINK=.
      008819 07                       3         .byte 7  
      00881A 52 41 4D 4C 41 53 54     4         .ascii "RAMLAST"
      008821                          5         RAMLAST:
      008821 90 AE 00 22      [ 2] 1467         ldw y,#URLAST 
      008825 1D 00 02         [ 2] 1468         subw x,#CELLL 
      008828 FF               [ 2] 1469         ldw (x),y 
      008829 81               [ 4] 1470         ret 
                                   1471 
                                   1472 ;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1473 ;       OFFSET ( -- a )
                                   1474 ;       address of system 
                                   1475 ;       variable OFFSET 
                                   1476 ;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0007AA                       1477         _HEADER OFFSET,6,"OFFSET"
      00882A 88 19                    1         .word LINK 
                           0007AC     2         LINK=.
      00882C 06                       3         .byte 6  
      00882D 4F 46 46 53 45 54        4         .ascii "OFFSET"
      008833                          5         OFFSET:
      008833 1D 00 02         [ 2] 1478         subw x,#CELLL
      008836 90 AE 00 1E      [ 2] 1479         ldw y,#UOFFSET 
      00883A FF               [ 2] 1480         ldw (x),y 
      00883B 81               [ 4] 1481         ret 
                                   1482 
                                   1483 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1484 ; adjust jump address 
                                   1485 ;  adding OFFSET
                                   1486 ; ADR-ADJ ( a -- a+offset )
                                   1487 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00883C                       1488 ADRADJ: 
      00883C CD 88 33         [ 4] 1489         call OFFSET 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



      00883F CD 85 63         [ 4] 1490         call AT 
      008842 CC 88 BC         [ 2] 1491         jp PLUS 
                                   1492 
                                   1493 
                                   1494 ;; Common functions
                                   1495 
                                   1496 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1497 ;       ?DUP    ( w -- w w | 0 )
                                   1498 ;       Dup tos if its is not zero.
                                   1499 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0007C5                       1500         _HEADER QDUP,4,"?DUP"
      008845 88 2C                    1         .word LINK 
                           0007C7     2         LINK=.
      008847 04                       3         .byte 4  
      008848 3F 44 55 50              4         .ascii "?DUP"
      00884C                          5         QDUP:
      00884C 90 93            [ 1] 1501         LDW Y,X
      00884E 90 FE            [ 2] 1502 	LDW Y,(Y)
      008850 27 04            [ 1] 1503         JREQ     QDUP1
      008852 1D 00 02         [ 2] 1504 	SUBW X,#CELLL 
      008855 FF               [ 2] 1505         LDW (X),Y
      008856 81               [ 4] 1506 QDUP1:  RET
                                   1507 
                                   1508 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1509 ;       ROT     ( w1 w2 w3 -- w2 w3 w1 )
                                   1510 ;       Rot 3rd item to top.
                                   1511 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0007D7                       1512         _HEADER ROT,3,"ROT"
      008857 88 47                    1         .word LINK 
                           0007D9     2         LINK=.
      008859 03                       3         .byte 3  
      00885A 52 4F 54                 4         .ascii "ROT"
      00885D                          5         ROT:
      00885D 90 93            [ 1] 1513         ldw y,x 
      00885F 90 FE            [ 2] 1514         ldw y,(y)
      008861 90 89            [ 2] 1515         pushw y 
      008863 90 93            [ 1] 1516         ldw y,x 
      008865 90 EE 04         [ 2] 1517         ldw y,(4,y)
      008868 FF               [ 2] 1518         ldw (x),y 
      008869 90 93            [ 1] 1519         ldw y,x 
      00886B 90 EE 02         [ 2] 1520         ldw y,(2,y)
      00886E EF 04            [ 2] 1521         ldw (4,x),y 
      008870 90 85            [ 2] 1522         popw y 
      008872 EF 02            [ 2] 1523         ldw (2,x),y
      008874 81               [ 4] 1524         ret 
                                   1525 
                                   1526 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1527 ;    <ROT ( n1 n2 n3 -- n3 n1 n2 )
                                   1528 ;    rotate left 3 top elements 
                                   1529 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0007F5                       1530     _HEADER NROT,4,"<ROT"
      008875 88 59                    1         .word LINK 
                           0007F7     2         LINK=.
      008877 04                       3         .byte 4  
      008878 3C 52 4F 54              4         .ascii "<ROT"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 36.
Hexadecimal [24-Bits]



      00887C                          5         NROT:
      00887C 90 93            [ 1] 1531     LDW Y,X 
      00887E 90 FE            [ 2] 1532     LDW Y,(Y)
      008880 90 89            [ 2] 1533     PUSHW Y ; n3 >R 
      008882 90 93            [ 1] 1534     LDW Y,X 
      008884 90 EE 02         [ 2] 1535     LDW Y,(2,Y) ; Y = n2 
      008887 FF               [ 2] 1536     LDW (X),Y   ; TOS = n2 
      008888 90 93            [ 1] 1537     LDW Y,X    
      00888A 90 EE 04         [ 2] 1538     LDW Y,(4,Y) ; Y = n1 
      00888D EF 02            [ 2] 1539     LDW (2,X),Y ;   = n1 
      00888F 90 85            [ 2] 1540     POPW Y  ; R> Y 
      008891 EF 04            [ 2] 1541     LDW (4,X),Y ; = n3 
      008893 81               [ 4] 1542     RET 
                                   1543 
                                   1544 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1545 ;       2DROP   ( w w -- )
                                   1546 ;       Discard two items on stack.
                                   1547 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000814                       1548         _HEADER DDROP,5,"2DROP"
      008894 88 77                    1         .word LINK 
                           000816     2         LINK=.
      008896 05                       3         .byte 5  
      008897 32 44 52 4F 50           4         .ascii "2DROP"
      00889C                          5         DDROP:
      00889C 1C 00 04         [ 2] 1549         ADDW X,#4
      00889F 81               [ 4] 1550         RET
                                   1551 
                                   1552 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1553 ;       2DUP    ( w1 w2 -- w1 w2 w1 w2 )
                                   1554 ;       Duplicate top two items.
                                   1555 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000820                       1556         _HEADER DDUP,4,"2DUP"
      0088A0 88 96                    1         .word LINK 
                           000822     2         LINK=.
      0088A2 04                       3         .byte 4  
      0088A3 32 44 55 50              4         .ascii "2DUP"
      0088A7                          5         DDUP:
      0088A7 1D 00 04         [ 2] 1557         SUBW X,#4
      0088AA 90 93            [ 1] 1558         LDW Y,X
      0088AC 90 EE 06         [ 2] 1559         LDW Y,(6,Y)
      0088AF EF 02            [ 2] 1560         LDW (2,X),Y
      0088B1 90 93            [ 1] 1561         LDW Y,X
      0088B3 90 EE 04         [ 2] 1562         LDW Y,(4,Y)
      0088B6 FF               [ 2] 1563         LDW (X),Y
      0088B7 81               [ 4] 1564         RET
                                   1565 
                                   1566 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1567 ;       +       ( w w -- sum )
                                   1568 ;       Add top two items.
                                   1569 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000838                       1570         _HEADER PLUS,1,"+"
      0088B8 88 A2                    1         .word LINK 
                           00083A     2         LINK=.
      0088BA 01                       3         .byte 1  
      0088BB 2B                       4         .ascii "+"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 37.
Hexadecimal [24-Bits]



      0088BC                          5         PLUS:
      0088BC 90 93            [ 1] 1571         LDW Y,X
      0088BE 90 FE            [ 2] 1572         LDW Y,(Y)
      0088C0 90 BF 26         [ 2] 1573         LDW YTEMP,Y
      0088C3 1C 00 02         [ 2] 1574         ADDW X,#2
      0088C6 90 93            [ 1] 1575         LDW Y,X
      0088C8 90 FE            [ 2] 1576         LDW Y,(Y)
      0088CA 72 B9 00 26      [ 2] 1577         ADDW Y,YTEMP
      0088CE FF               [ 2] 1578         LDW (X),Y
      0088CF 81               [ 4] 1579         RET
                                   1580 
                                   1581 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1582 ;       TRUE ( -- -1 )
                                   1583 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000850                       1584         _HEADER TRUE,4,"TRUE"
      0088D0 88 BA                    1         .word LINK 
                           000852     2         LINK=.
      0088D2 04                       3         .byte 4  
      0088D3 54 52 55 45              4         .ascii "TRUE"
      0088D7                          5         TRUE:
      0088D7 A6 FF            [ 1] 1585         LD A,#255 
      0088D9 1D 00 02         [ 2] 1586         SUBW X,#CELLL
      0088DC F7               [ 1] 1587         LD (X),A 
      0088DD E7 01            [ 1] 1588         LD (1,X),A 
      0088DF 81               [ 4] 1589         RET 
                                   1590 
                                   1591 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1592 ;       FALSE ( -- 0 )
                                   1593 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000860                       1594         _HEADER FALSE,5,"FALSE"
      0088E0 88 D2                    1         .word LINK 
                           000862     2         LINK=.
      0088E2 05                       3         .byte 5  
      0088E3 46 41 4C 53 45           4         .ascii "FALSE"
      0088E8                          5         FALSE:
      0088E8 1D 00 02         [ 2] 1595         SUBW X,#CELLL 
      0088EB 7F               [ 1] 1596         CLR (X) 
      0088EC 6F 01            [ 1] 1597         CLR (1,X)
      0088EE 81               [ 4] 1598         RET 
                                   1599 
                                   1600 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1601 ;       NOT     ( w -- w )
                                   1602 ;       One's complement of tos.
                                   1603 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00086F                       1604         _HEADER INVER,3,"NOT"
      0088EF 88 E2                    1         .word LINK 
                           000871     2         LINK=.
      0088F1 03                       3         .byte 3  
      0088F2 4E 4F 54                 4         .ascii "NOT"
      0088F5                          5         INVER:
      0088F5 90 93            [ 1] 1605         LDW Y,X
      0088F7 90 FE            [ 2] 1606         LDW Y,(Y)
      0088F9 90 53            [ 2] 1607         CPLW Y
      0088FB FF               [ 2] 1608         LDW (X),Y
      0088FC 81               [ 4] 1609         RET
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



                                   1610 
                                   1611 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1612 ;       NEGATE  ( n -- -n )
                                   1613 ;       Two's complement of tos.
                                   1614 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00087D                       1615         _HEADER NEGAT,6,"NEGATE"
      0088FD 88 F1                    1         .word LINK 
                           00087F     2         LINK=.
      0088FF 06                       3         .byte 6  
      008900 4E 45 47 41 54 45        4         .ascii "NEGATE"
      008906                          5         NEGAT:
      008906 90 93            [ 1] 1616         LDW Y,X
      008908 90 FE            [ 2] 1617         LDW Y,(Y)
      00890A 90 50            [ 2] 1618         NEGW Y
      00890C FF               [ 2] 1619         LDW (X),Y
      00890D 81               [ 4] 1620         RET
                                   1621 
                                   1622 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1623 ;       DNEGATE ( d -- -d )
                                   1624 ;       Two's complement of double.
                                   1625 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00088E                       1626         _HEADER DNEGA,7,"DNEGATE"
      00890E 88 FF                    1         .word LINK 
                           000890     2         LINK=.
      008910 07                       3         .byte 7  
      008911 44 4E 45 47 41 54 45     4         .ascii "DNEGATE"
      008918                          5         DNEGA:
      008918 90 93            [ 1] 1627         LDW Y,X
      00891A 90 FE            [ 2] 1628 	LDW Y,(Y)
      00891C 90 53            [ 2] 1629         CPLW Y
      00891E 90 89            [ 2] 1630         PUSHW Y      ; Y >R 
      008920 90 93            [ 1] 1631         LDW Y,X
      008922 90 EE 02         [ 2] 1632         LDW Y,(2,Y)
      008925 90 53            [ 2] 1633         CPLW Y
      008927 72 A9 00 01      [ 2] 1634         ADDW Y,#1
      00892B EF 02            [ 2] 1635         LDW (2,X),Y
      00892D 90 85            [ 2] 1636         POPW Y       ; R> Y  
      00892F 24 02            [ 1] 1637         JRNC DN1 
      008931 90 5C            [ 1] 1638         INCW Y
      008933 FF               [ 2] 1639 DN1:    LDW (X),Y
      008934 81               [ 4] 1640         RET
                                   1641 
                                   1642 
                                   1643 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1644 ;       S>D ( n -- d )
                                   1645 ; convert single integer to double 
                                   1646 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0008B5                       1647         _HEADER STOD,3,"S>D"
      008935 89 10                    1         .word LINK 
                           0008B7     2         LINK=.
      008937 03                       3         .byte 3  
      008938 53 3E 44                 4         .ascii "S>D"
      00893B                          5         STOD:
      00893B 1D 00 02         [ 2] 1648         SUBW X,#CELLL 
      00893E 7F               [ 1] 1649         CLR (X) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 39.
Hexadecimal [24-Bits]



      00893F 6F 01            [ 1] 1650         CLR (1,X) 
      008941 90 93            [ 1] 1651         LDW Y,X 
      008943 90 EE 02         [ 2] 1652         LDW Y,(2,Y)
      008946 2A 05            [ 1] 1653         JRPL 1$
      008948 90 AE FF FF      [ 2] 1654         LDW Y,#-1 
      00894C FF               [ 2] 1655         LDW (X),Y 
      00894D 81               [ 4] 1656 1$:     RET 
                                   1657 
                                   1658 
                                   1659 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1660 ;       -       ( n1 n2 -- n1-n2 )
                                   1661 ;       Subtraction.
                                   1662 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0008CE                       1663         _HEADER SUBB,1,"-"
      00894E 89 37                    1         .word LINK 
                           0008D0     2         LINK=.
      008950 01                       3         .byte 1  
      008951 2D                       4         .ascii "-"
      008952                          5         SUBB:
      008952 90 93            [ 1] 1664         LDW Y,X
      008954 90 FE            [ 2] 1665         LDW Y,(Y) ; n2 
      008956 90 BF 26         [ 2] 1666         LDW YTEMP,Y 
      008959 1C 00 02         [ 2] 1667         ADDW X,#CELLL 
      00895C 90 93            [ 1] 1668         LDW Y,X
      00895E 90 FE            [ 2] 1669         LDW Y,(Y) ; n1 
      008960 72 B2 00 26      [ 2] 1670         SUBW Y,YTEMP ; n1-n2 
      008964 FF               [ 2] 1671         LDW (X),Y
      008965 81               [ 4] 1672         RET
                                   1673 
                                   1674 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1675 ;       ABS     ( n -- n )
                                   1676 ;       Return  absolute value of n.
                                   1677 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0008E6                       1678         _HEADER ABSS,3,"ABS"
      008966 89 50                    1         .word LINK 
                           0008E8     2         LINK=.
      008968 03                       3         .byte 3  
      008969 41 42 53                 4         .ascii "ABS"
      00896C                          5         ABSS:
      00896C 90 93            [ 1] 1679         LDW Y,X
      00896E 90 FE            [ 2] 1680 	LDW Y,(Y)
      008970 2A 03            [ 1] 1681         JRPL     AB1     ;negate:
      008972 90 50            [ 2] 1682         NEGW     Y     ;else negate hi byte
      008974 FF               [ 2] 1683         LDW (X),Y
      008975 81               [ 4] 1684 AB1:    RET
                                   1685 
                                   1686 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1687 ;       =       ( w w -- t )
                                   1688 ;       Return true if top two are equal.
                                   1689 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0008F6                       1690         _HEADER EQUAL,1,"="
      008976 89 68                    1         .word LINK 
                           0008F8     2         LINK=.
      008978 01                       3         .byte 1  
      008979 3D                       4         .ascii "="
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 40.
Hexadecimal [24-Bits]



      00897A                          5         EQUAL:
      00897A A6 FF            [ 1] 1691         LD A,#0xFF  ;true
      00897C 90 93            [ 1] 1692         LDW Y,X    
      00897E 90 FE            [ 2] 1693         LDW Y,(Y)   ; n2 
      008980 1C 00 02         [ 2] 1694         ADDW X,#CELLL 
      008983 F3               [ 2] 1695         CPW Y,(X)   ; n1==n2
      008984 27 01            [ 1] 1696         JREQ EQ1 
      008986 4F               [ 1] 1697         CLR A 
      008987 F7               [ 1] 1698 EQ1:    LD (X),A
      008988 E7 01            [ 1] 1699         LD (1,X),A
      00898A 81               [ 4] 1700 	RET     
                                   1701 
                                   1702 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1703 ;       U<      ( u1 u2 -- f )
                                   1704 ;       Unsigned compare of top two items.
                                   1705 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00090B                       1706         _HEADER ULESS,2,"U<"
      00898B 89 78                    1         .word LINK 
                           00090D     2         LINK=.
      00898D 02                       3         .byte 2  
      00898E 55 3C                    4         .ascii "U<"
      008990                          5         ULESS:
      008990 A6 FF            [ 1] 1707         LD A,#0xFF  ;true
      008992 90 93            [ 1] 1708         LDW Y,X    
      008994 90 EE 02         [ 2] 1709         LDW Y,(2,Y) ; u1 
      008997 F3               [ 2] 1710         CPW Y,(X)   ; cpw u1  u2 
      008998 25 01            [ 1] 1711         JRULT     ULES1
      00899A 4F               [ 1] 1712         CLR A
      00899B 1C 00 02         [ 2] 1713 ULES1:  ADDW X,#CELLL 
      00899E F7               [ 1] 1714         LD (X),A
      00899F E7 01            [ 1] 1715         LD (1,X),A
      0089A1 81               [ 4] 1716 	RET     
                                   1717 
                                   1718 
                                   1719 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1720 ;       <       ( n1 n2 -- t )
                                   1721 ;       Signed compare of top two items.
                                   1722 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000922                       1723         _HEADER LESS,1,"<"
      0089A2 89 8D                    1         .word LINK 
                           000924     2         LINK=.
      0089A4 01                       3         .byte 1  
      0089A5 3C                       4         .ascii "<"
      0089A6                          5         LESS:
      0089A6 A6 FF            [ 1] 1724         LD A,#0xFF  ;true
      0089A8 90 93            [ 1] 1725         LDW Y,X    
      0089AA 90 EE 02         [ 2] 1726         LDW Y,(2,Y)  ; n1 
      0089AD F3               [ 2] 1727         CPW Y,(X)  ; n1 < n2 ? 
      0089AE 2F 01            [ 1] 1728         JRSLT     LT1
      0089B0 4F               [ 1] 1729         CLR A
      0089B1 1C 00 02         [ 2] 1730 LT1:    ADDW X,#CELLL 
      0089B4 F7               [ 1] 1731         LD (X),A
      0089B5 E7 01            [ 1] 1732         LD (1,X),A
      0089B7 81               [ 4] 1733 	RET     
                                   1734 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



                                   1735 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1736 ;   U> ( u1 u2 -- f )
                                   1737 ;   f = true if u1>u2 
                                   1738 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000938                       1739         _HEADER UGREAT,2,"U>"
      0089B8 89 A4                    1         .word LINK 
                           00093A     2         LINK=.
      0089BA 02                       3         .byte 2  
      0089BB 55 3E                    4         .ascii "U>"
      0089BD                          5         UGREAT:
      0089BD A6 FF            [ 1] 1740         LD A,#255  
      0089BF 90 93            [ 1] 1741         LDW Y,X 
      0089C1 90 EE 02         [ 2] 1742         LDW Y,(2,Y)  ; u1 
      0089C4 F3               [ 2] 1743         CPW Y,(X)  ; u1 > u2 
      0089C5 22 01            [ 1] 1744         JRUGT UGREAT1 
      0089C7 4F               [ 1] 1745         CLR A   
      0089C8                       1746 UGREAT1:
      0089C8 1C 00 02         [ 2] 1747         ADDW X,#CELLL 
      0089CB F7               [ 1] 1748         LD (X),A 
      0089CC E7 01            [ 1] 1749         LD (1,X),A 
      0089CE 81               [ 4] 1750         RET 
                                   1751 
                                   1752 
                                   1753 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1754 ;       >   (n1 n2 -- f )
                                   1755 ;  signed compare n1 n2 
                                   1756 ;  true if n1 > n2 
                                   1757 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00094F                       1758         _HEADER GREAT,1,">"
      0089CF 89 BA                    1         .word LINK 
                           000951     2         LINK=.
      0089D1 01                       3         .byte 1  
      0089D2 3E                       4         .ascii ">"
      0089D3                          5         GREAT:
      0089D3 A6 FF            [ 1] 1759         LD A,#0xFF ;
      0089D5 90 93            [ 1] 1760         LDW Y,X 
      0089D7 90 EE 02         [ 2] 1761         LDW Y,(2,Y)  ; n1 
      0089DA F3               [ 2] 1762         CPW Y,(X) ; n1 > n2 ?  
      0089DB 2C 01            [ 1] 1763         JRSGT GREAT1 
      0089DD 4F               [ 1] 1764         CLR  A
      0089DE                       1765 GREAT1:
      0089DE 1C 00 02         [ 2] 1766         ADDW X,#CELLL 
      0089E1 F7               [ 1] 1767         LD (X),A 
      0089E2 E7 01            [ 1] 1768         LD (1,X),A 
      0089E4 81               [ 4] 1769         RET 
                                   1770 
                                   1771 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1772 ;       MAX     ( n n -- n )
                                   1773 ;       Return greater of two top items.
                                   1774 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000965                       1775         _HEADER MAX,3,"MAX"
      0089E5 89 D1                    1         .word LINK 
                           000967     2         LINK=.
      0089E7 03                       3         .byte 3  
      0089E8 4D 41 58                 4         .ascii "MAX"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal [24-Bits]



      0089EB                          5         MAX:
      0089EB 90 93            [ 1] 1776         LDW Y,X    
      0089ED 90 FE            [ 2] 1777         LDW Y,(Y) ; n2 
      0089EF E3 02            [ 2] 1778         CPW Y,(2,X)   
      0089F1 2F 02            [ 1] 1779         JRSLT  MAX1
      0089F3 EF 02            [ 2] 1780         LDW (2,X),Y
      0089F5 1C 00 02         [ 2] 1781 MAX1:   ADDW X,#2
      0089F8 81               [ 4] 1782 	RET     
                                   1783 
                                   1784 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1785 ;       MIN     ( n n -- n )
                                   1786 ;       Return smaller of top two items.
                                   1787 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000979                       1788         _HEADER MIN,3,"MIN"
      0089F9 89 E7                    1         .word LINK 
                           00097B     2         LINK=.
      0089FB 03                       3         .byte 3  
      0089FC 4D 49 4E                 4         .ascii "MIN"
      0089FF                          5         MIN:
      0089FF 90 93            [ 1] 1789         LDW Y,X    
      008A01 90 FE            [ 2] 1790         LDW Y,(Y)  ; n2 
      008A03 E3 02            [ 2] 1791         CPW Y,(2,X) 
      008A05 2C 02            [ 1] 1792         JRSGT MIN1
      008A07 EF 02            [ 2] 1793         LDW (2,X),Y
      008A09 1C 00 02         [ 2] 1794 MIN1:	ADDW X,#2
      008A0C 81               [ 4] 1795 	RET     
                                   1796 
                                   1797 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1798 ;       WITHIN  ( u ul uh -- t )
                                   1799 ;       Return true if u is within
                                   1800 ;       range of ul and uh. ( ul <= u < uh )
                                   1801 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00098D                       1802         _HEADER WITHI,6,"WITHIN"
      008A0D 89 FB                    1         .word LINK 
                           00098F     2         LINK=.
      008A0F 06                       3         .byte 6  
      008A10 57 49 54 48 49 4E        4         .ascii "WITHIN"
      008A16                          5         WITHI:
      008A16 CD 86 C1         [ 4] 1803         CALL     OVER
      008A19 CD 89 52         [ 4] 1804         CALL     SUBB
      008A1C CD 86 62         [ 4] 1805         CALL     TOR
      008A1F CD 89 52         [ 4] 1806         CALL     SUBB
      008A22 CD 85 B4         [ 4] 1807         CALL     RFROM
      008A25 CC 89 90         [ 2] 1808         JP     ULESS
                                   1809 
                                   1810 ;; Divide
                                   1811 
                                   1812 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1813 ;       UM/MOD  ( udl udh un -- ur uq )
                                   1814 ;       Unsigned divide of a double by a
                                   1815 ;       single. Return mod and quotient.
                                   1816 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1817 ; 2021-02-22
                                   1818 ; changed algorithm for Jeeek one 
                                   1819 ; ref: https://github.com/TG9541/stm8ef/pull/406        
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
Hexadecimal [24-Bits]



      0009A8                       1820         _HEADER UMMOD,6,"UM/MOD"
      008A28 8A 0F                    1         .word LINK 
                           0009AA     2         LINK=.
      008A2A 06                       3         .byte 6  
      008A2B 55 4D 2F 4D 4F 44        4         .ascii "UM/MOD"
      008A31                          5         UMMOD:
      008A31 90 93            [ 1] 1821         LDW     Y,X             ; stack pointer to Y
      008A33 FE               [ 2] 1822         LDW     X,(X)           ; un
      008A34 BF 26            [ 2] 1823         LDW     YTEMP,X         ; save un
      008A36 93               [ 1] 1824         LDW     X,Y
      008A37 5C               [ 1] 1825         INCW    X               ; drop un
      008A38 5C               [ 1] 1826         INCW    X
      008A39 89               [ 2] 1827         PUSHW   X               ; save stack pointer
      008A3A FE               [ 2] 1828         LDW     X,(X)           ; X=udh
      008A3B 26 0B            [ 1] 1829         JRNE    MMSM0
      008A3D 1E 01            [ 2] 1830         LDW    X,(1,SP)
      008A3F EE 02            [ 2] 1831         LDW    X,(2,X)          ; udl 
      008A41 90 BE 26         [ 2] 1832         LDW     Y,YTEMP         ;divisor 
      008A44 65               [ 2] 1833         DIVW    X,Y             ; udl/un 
      008A45 51               [ 1] 1834         EXGW    X,Y 
      008A46 20 26            [ 2] 1835         JRA     MMSMb 
      008A48                       1836 MMSM0:    
      008A48 90 EE 04         [ 2] 1837         LDW     Y,(4,Y)         ; Y=udl (offset before drop)
      008A4B B3 26            [ 2] 1838         CPW     X,YTEMP
      008A4D 25 09            [ 1] 1839         JRULT   MMSM1           ; X is still on the R-stack
      008A4F 85               [ 2] 1840         POPW    X               ; restore stack pointer
      008A50 90 5F            [ 1] 1841         CLRW    Y
      008A52 EF 02            [ 2] 1842         LDW     (2,X),Y         ; remainder 0
      008A54 90 5A            [ 2] 1843         DECW    Y
      008A56 FF               [ 2] 1844         LDW     (X),Y           ; quotient max. 16 bit value
      008A57 81               [ 4] 1845         RET
      008A58                       1846 MMSM1:
      008A58 A6 10            [ 1] 1847         LD      A,#16           ; loop count
      008A5A 90 58            [ 2] 1848         SLLW    Y               ; udl shift udl into udh
      008A5C                       1849 MMSM3:
      008A5C 59               [ 2] 1850         RLCW    X               ; rotate udl bit into uhdh (= remainder)
      008A5D 25 04            [ 1] 1851         JRC     MMSMa           ; if carry out of rotate
      008A5F B3 26            [ 2] 1852         CPW     X,YTEMP         ; compare udh to un
      008A61 25 05            [ 1] 1853         JRULT   MMSM4           ; can't subtract
      008A63                       1854 MMSMa:
      008A63 72 B0 00 26      [ 2] 1855         SUBW    X,YTEMP         ; can subtract
      008A67 98               [ 1] 1856         RCF
      008A68                       1857 MMSM4:
      008A68 8C               [ 1] 1858         CCF                     ; quotient bit
      008A69 90 59            [ 2] 1859         RLCW    Y               ; rotate into quotient, rotate out udl
      008A6B 4A               [ 1] 1860         DEC     A               ; repeat
      008A6C 26 EE            [ 1] 1861         JRNE    MMSM3           ; if A == 0
      008A6E                       1862 MMSMb:
      008A6E BF 26            [ 2] 1863         LDW     YTEMP,X         ; done, save remainder
      008A70 85               [ 2] 1864         POPW    X               ; restore stack pointer
      008A71 FF               [ 2] 1865         LDW     (X),Y           ; save quotient
      008A72 90 BE 26         [ 2] 1866         LDW     Y,YTEMP         ; remainder onto stack
      008A75 EF 02            [ 2] 1867         LDW     (2,X),Y
      008A77 81               [ 4] 1868         RET
                                   1869 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



                                   1870 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1871 ;   U/MOD ( u1 u2 -- ur uq )
                                   1872 ;   unsigned divide u1/u2 
                                   1873 ;   return remainder and quotient 
                                   1874 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0009F8                       1875         _HEADER USLMOD,5,"U/MOD"
      008A78 8A 2A                    1         .word LINK 
                           0009FA     2         LINK=.
      008A7A 05                       3         .byte 5  
      008A7B 55 2F 4D 4F 44           4         .ascii "U/MOD"
      008A80                          5         USLMOD:
      008A80 90 93            [ 1] 1876         LDW Y,X 
      008A82 90 FE            [ 2] 1877         LDW Y,(Y)  ; dividend 
      008A84 89               [ 2] 1878         PUSHW X    ; DP >R 
      008A85 EE 02            [ 2] 1879         LDW X,(2,X) ; divisor 
      008A87 65               [ 2] 1880         DIVW X,Y 
      008A88 89               [ 2] 1881         PUSHW X     ; quotient 
      008A89 1E 03            [ 2] 1882         LDW X,(3,SP) ; DP 
      008A8B EF 02            [ 2] 1883         LDW (2,X),Y ; remainder 
      008A8D 16 01            [ 2] 1884         LDW Y,(1,SP) ; quotient 
      008A8F FF               [ 2] 1885         LDW (X),Y 
      008A90 5B 04            [ 2] 1886         ADDW SP,#2*CELLL ; drop quotient and DP from rstack 
      008A92 81               [ 4] 1887         RET 
                                   1888 
                                   1889 
                                   1890 
                                   1891 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
                                   1892 ;       M/MOD   ( d n -- r q )
                                   1893 ;       Signed floored divide of double by
                                   1894 ;       single. Return mod and quotient.
                                   1895 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000A13                       1896         _HEADER MSMOD,5,"M/MOD"
      008A93 8A 7A                    1         .word LINK 
                           000A15     2         LINK=.
      008A95 05                       3         .byte 5  
      008A96 4D 2F 4D 4F 44           4         .ascii "M/MOD"
      008A9B                          5         MSMOD:
      008A9B CD 86 99         [ 4] 1897         CALL	DUPP
      008A9E CD 86 D0         [ 4] 1898         CALL	ZLESS
      008AA1 CD 86 99         [ 4] 1899         CALL	DUPP
      008AA4 CD 86 62         [ 4] 1900         CALL	TOR
      008AA7 CD 85 18         [ 4] 1901         CALL	QBRAN
      008AAA 8A B8                 1902         .word	MMOD1
      008AAC CD 89 06         [ 4] 1903         CALL	NEGAT
      008AAF CD 86 62         [ 4] 1904         CALL	TOR
      008AB2 CD 89 18         [ 4] 1905         CALL	DNEGA
      008AB5 CD 85 B4         [ 4] 1906         CALL	RFROM
      008AB8 CD 86 62         [ 4] 1907 MMOD1:	CALL	TOR
      008ABB CD 86 99         [ 4] 1908         CALL	DUPP
      008ABE CD 86 D0         [ 4] 1909         CALL	ZLESS
      008AC1 CD 85 18         [ 4] 1910         CALL	QBRAN
      008AC4 8A CC                 1911         .word	MMOD2
      008AC6 CD 85 C5         [ 4] 1912         CALL	RAT
      008AC9 CD 88 BC         [ 4] 1913         CALL	PLUS
      008ACC CD 85 B4         [ 4] 1914 MMOD2:	CALL	RFROM
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



      008ACF CD 8A 31         [ 4] 1915         CALL	UMMOD
      008AD2 CD 85 B4         [ 4] 1916         CALL	RFROM
      008AD5 CD 85 18         [ 4] 1917         CALL	QBRAN
      008AD8 8A E3                 1918         .word	MMOD3
      008ADA CD 86 A9         [ 4] 1919         CALL	SWAPP
      008ADD CD 89 06         [ 4] 1920         CALL	NEGAT
      008AE0 CC 86 A9         [ 2] 1921         JP	SWAPP
      008AE3 81               [ 4] 1922 MMOD3:	RET
                                   1923 
                                   1924 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1925 ;       /MOD    ( n1 n2 -- r q )
                                   1926 ;       Signed divide n1/n2. 
                                   1927 ;       Return mod and quotient.
                                   1928 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000A64                       1929         _HEADER SLMOD,4,"/MOD"
      008AE4 8A 95                    1         .word LINK 
                           000A66     2         LINK=.
      008AE6 04                       3         .byte 4  
      008AE7 2F 4D 4F 44              4         .ascii "/MOD"
      008AEB                          5         SLMOD:
      008AEB F6               [ 1] 1930         LD A,(X)
      008AEC 88               [ 1] 1931         PUSH A   ; n2 sign 
      008AED E6 02            [ 1] 1932         LD A,(2,X)
      008AEF 88               [ 1] 1933         PUSH A    ; n1 sign 
      008AF0 CD 89 6C         [ 4] 1934         CALL ABSS 
      008AF3 CD 86 62         [ 4] 1935         CALL TOR  ; 
      008AF6 CD 89 6C         [ 4] 1936         CALL ABSS 
      008AF9 CD 85 C5         [ 4] 1937         CALL RAT   
      008AFC CD 8A 80         [ 4] 1938         CALL USLMOD 
      008AFF 7B 03            [ 1] 1939         LD A,(3,SP)
      008B01 1A 04            [ 1] 1940         OR A,(4,SP)
      008B03 2A 25            [ 1] 1941         JRPL SLMOD8 ; both positive nothing to change 
      008B05 7B 03            [ 1] 1942         LD A,(3,SP)
      008B07 18 04            [ 1] 1943         XOR A,(4,SP)
      008B09 2A 12            [ 1] 1944         JRPL SLMOD1
                                   1945 ; dividend and divisor are opposite sign          
      008B0B CD 8C 17         [ 4] 1946         CALL ONEP   ; add one to quotient 
      008B0E CD 89 06         [ 4] 1947         CALL NEGAT ; negative quotient
      008B11 CD 85 C5         [ 4] 1948         CALL RAT 
      008B14 CD 88 5D         [ 4] 1949         CALL ROT 
      008B17 CD 89 52         [ 4] 1950         CALL SUBB  ; corrected_remainder=divisor-remainder 
      008B1A CD 86 A9         [ 4] 1951         CALL SWAPP
      008B1D                       1952 SLMOD1:
      008B1D 7B 04            [ 1] 1953         LD A,(4,SP) ; divisor sign 
      008B1F 2A 09            [ 1] 1954         JRPL SLMOD8 
      008B21 CD 86 62         [ 4] 1955         CALL TOR 
      008B24 CD 89 06         [ 4] 1956         CALL NEGAT ; if divisor negative negate remainder 
      008B27 CD 85 B4         [ 4] 1957         CALL RFROM 
      008B2A                       1958 SLMOD8: 
      008B2A 5B 04            [ 2] 1959         ADDW SP,#4 
      008B2C 81               [ 4] 1960         RET 
                                   1961 
                                   1962 
                                   1963 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1964 ;       MOD     ( n n -- r )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



                                   1965 ;       Signed divide. Return mod only.
                                   1966 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000AAD                       1967         _HEADER MODD,3,"MOD"
      008B2D 8A E6                    1         .word LINK 
                           000AAF     2         LINK=.
      008B2F 03                       3         .byte 3  
      008B30 4D 4F 44                 4         .ascii "MOD"
      008B33                          5         MODD:
      008B33 CD 8A EB         [ 4] 1968 	CALL	SLMOD
      008B36 CC 86 8F         [ 2] 1969 	JP	DROP
                                   1970 
                                   1971 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1972 ;       /       ( n n -- q )
                                   1973 ;       Signed divide. Return quotient only.
                                   1974 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000AB9                       1975         _HEADER SLASH,1,"/"
      008B39 8B 2F                    1         .word LINK 
                           000ABB     2         LINK=.
      008B3B 01                       3         .byte 1  
      008B3C 2F                       4         .ascii "/"
      008B3D                          5         SLASH:
      008B3D CD 8A EB         [ 4] 1976         CALL	SLMOD
      008B40 CD 86 A9         [ 4] 1977         CALL	SWAPP
      008B43 CC 86 8F         [ 2] 1978         JP	DROP
                                   1979 
                                   1980 ;; Multiply
                                   1981 
                                   1982 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1983 ;       UM*     ( u1 u2 -- ud )
                                   1984 ;       Unsigned multiply. Return 
                                   1985 ;       double product.
                                   1986 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000AC6                       1987         _HEADER UMSTA,3,"UM*"
      008B46 8B 3B                    1         .word LINK 
                           000AC8     2         LINK=.
      008B48 03                       3         .byte 3  
      008B49 55 4D 2A                 4         .ascii "UM*"
      008B4C                          5         UMSTA:
                                   1988 ; stack have 4 bytes u1=a:b u2=c:d
                                   1989         ;; bytes offset on data stack 
                           000002  1990         da=2 
                           000003  1991         db=3 
                           000000  1992         dc=0 
                           000001  1993         dd=1 
                                   1994         ;;;;;; local variables ;;;;;;;;;
                                   1995         ;; product bytes offset on return stack 
                           000001  1996         UD1=1  ; ud bits 31..24
                           000002  1997         UD2=2  ; ud bits 23..16
                           000003  1998         UD3=3  ; ud bits 15..8 
                           000004  1999         UD4=4  ; ud bits 7..0 
                                   2000         ;; local variable for product set to zero   
      008B4C 90 5F            [ 1] 2001         clrw y 
      008B4E 90 89            [ 2] 2002         pushw y  ; bits 15..0
      008B50 90 89            [ 2] 2003         pushw y  ; bits 31..16 
      008B52 E6 03            [ 1] 2004         ld a,(db,x) ; b 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



      008B54 90 97            [ 1] 2005         ld yl,a 
      008B56 E6 01            [ 1] 2006         ld a,(dd,x)   ; d
      008B58 90 42            [ 4] 2007         mul y,a    ; b*d  
      008B5A 17 03            [ 2] 2008         ldw (UD3,sp),y ; lowest weight product 
      008B5C E6 03            [ 1] 2009         ld a,(db,x)
      008B5E 90 97            [ 1] 2010         ld yl,a 
      008B60 E6 00            [ 1] 2011         ld a,(dc,x)
      008B62 90 42            [ 4] 2012         mul y,a  ; b*c 
                                   2013         ;;; do the partial sum 
      008B64 72 F9 02         [ 2] 2014         addw y,(UD2,sp)
      008B67 4F               [ 1] 2015         clr a 
      008B68 49               [ 1] 2016         rlc a
      008B69 6B 01            [ 1] 2017         ld (UD1,sp),a 
      008B6B 17 02            [ 2] 2018         ldw (UD2,sp),y 
      008B6D E6 02            [ 1] 2019         ld a,(da,x)
      008B6F 90 97            [ 1] 2020         ld yl,a 
      008B71 E6 01            [ 1] 2021         ld a,(dd,x)
      008B73 90 42            [ 4] 2022         mul y,a   ; a*d 
                                   2023         ;; do partial sum 
      008B75 72 F9 02         [ 2] 2024         addw y,(UD2,sp)
      008B78 4F               [ 1] 2025         clr a 
      008B79 19 01            [ 1] 2026         adc a,(UD1,sp)
      008B7B 6B 01            [ 1] 2027         ld (UD1,sp),a  
      008B7D 17 02            [ 2] 2028         ldw (UD2,sp),y 
      008B7F E6 02            [ 1] 2029         ld a,(da,x)
      008B81 90 97            [ 1] 2030         ld yl,a 
      008B83 E6 00            [ 1] 2031         ld a,(dc,x)
      008B85 90 42            [ 4] 2032         mul y,a  ;  a*c highest weight product 
                                   2033         ;;; do partial sum 
      008B87 72 F9 01         [ 2] 2034         addw y,(UD1,sp)
      008B8A FF               [ 2] 2035         ldw (x),y  ; udh 
      008B8B 16 03            [ 2] 2036         ldw y,(UD3,sp)
      008B8D EF 02            [ 2] 2037         ldw (2,x),y  ; udl  
      008B8F 5B 04            [ 2] 2038         addw sp,#4 ; drop local variable 
      008B91 81               [ 4] 2039         ret  
                                   2040 
                                   2041 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2042 ;       *       ( n n -- n )
                                   2043 ;       Signed multiply. Return 
                                   2044 ;       single product.
                                   2045 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000B12                       2046         _HEADER STAR,1,"*"
      008B92 8B 48                    1         .word LINK 
                           000B14     2         LINK=.
      008B94 01                       3         .byte 1  
      008B95 2A                       4         .ascii "*"
      008B96                          5         STAR:
      008B96 CD 8B 4C         [ 4] 2047 	CALL	UMSTA
      008B99 CC 86 8F         [ 2] 2048 	JP	DROP
                                   2049 
                                   2050 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2051 ;       M*      ( n n -- d )
                                   2052 ;       Signed multiply. Return 
                                   2053 ;       double product.
                                   2054 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



      000B1C                       2055         _HEADER MSTAR,2,"M*"
      008B9C 8B 94                    1         .word LINK 
                           000B1E     2         LINK=.
      008B9E 02                       3         .byte 2  
      008B9F 4D 2A                    4         .ascii "M*"
      008BA1                          5         MSTAR:
      008BA1 CD 88 A7         [ 4] 2056         CALL	DDUP
      008BA4 CD 87 1F         [ 4] 2057         CALL	XORR
      008BA7 CD 86 D0         [ 4] 2058         CALL	ZLESS
      008BAA CD 86 62         [ 4] 2059         CALL	TOR
      008BAD CD 89 6C         [ 4] 2060         CALL	ABSS
      008BB0 CD 86 A9         [ 4] 2061         CALL	SWAPP
      008BB3 CD 89 6C         [ 4] 2062         CALL	ABSS
      008BB6 CD 8B 4C         [ 4] 2063         CALL	UMSTA
      008BB9 CD 85 B4         [ 4] 2064         CALL	RFROM
      008BBC CD 85 18         [ 4] 2065         CALL	QBRAN
      008BBF 8B C4                 2066         .word	MSTA1
      008BC1 CC 89 18         [ 2] 2067         JP	DNEGA
      008BC4 81               [ 4] 2068 MSTA1:	RET
                                   2069 
                                   2070 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2071 ;       */MOD   ( n1 n2 n3 -- r q )
                                   2072 ;       Multiply n1 and n2, then divide
                                   2073 ;       by n3. Return mod and quotient.
                                   2074 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000B45                       2075         _HEADER SSMOD,5,"*/MOD"
      008BC5 8B 9E                    1         .word LINK 
                           000B47     2         LINK=.
      008BC7 05                       3         .byte 5  
      008BC8 2A 2F 4D 4F 44           4         .ascii "*/MOD"
      008BCD                          5         SSMOD:
      008BCD CD 86 62         [ 4] 2076         CALL     TOR
      008BD0 CD 8B A1         [ 4] 2077         CALL     MSTAR
      008BD3 CD 85 B4         [ 4] 2078         CALL     RFROM
      008BD6 CC 8A 9B         [ 2] 2079         JP     MSMOD
                                   2080 
                                   2081 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2082 ;       */      ( n1 n2 n3 -- q )
                                   2083 ;       Multiply n1 by n2, then divide
                                   2084 ;       by n3. Return quotient only.
                                   2085 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000B59                       2086         _HEADER STASL,2,"*/"
      008BD9 8B C7                    1         .word LINK 
                           000B5B     2         LINK=.
      008BDB 02                       3         .byte 2  
      008BDC 2A 2F                    4         .ascii "*/"
      008BDE                          5         STASL:
      008BDE CD 8B CD         [ 4] 2087         CALL	SSMOD
      008BE1 CD 86 A9         [ 4] 2088         CALL	SWAPP
      008BE4 CC 86 8F         [ 2] 2089         JP	DROP
                                   2090 
                                   2091 ;; Miscellaneous
                                   2092 
                                   2093 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2094 ;       2+   ( a -- a )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



                                   2095 ;       Add cell size in byte to address.
                                   2096 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000B67                       2097         _HEADER CELLP,2,"2+"
      008BE7 8B DB                    1         .word LINK 
                           000B69     2         LINK=.
      008BE9 02                       3         .byte 2  
      008BEA 32 2B                    4         .ascii "2+"
      008BEC                          5         CELLP:
      008BEC 90 93            [ 1] 2098         LDW Y,X
      008BEE 90 FE            [ 2] 2099 	LDW Y,(Y)
      008BF0 72 A9 00 02      [ 2] 2100         ADDW Y,#CELLL 
      008BF4 FF               [ 2] 2101         LDW (X),Y
      008BF5 81               [ 4] 2102         RET
                                   2103 
                                   2104 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2105 ;       2-   ( a -- a )
                                   2106 ;       Subtract 2 from address.
                                   2107 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000B76                       2108         _HEADER CELLM,2,"2-"
      008BF6 8B E9                    1         .word LINK 
                           000B78     2         LINK=.
      008BF8 02                       3         .byte 2  
      008BF9 32 2D                    4         .ascii "2-"
      008BFB                          5         CELLM:
      008BFB 90 93            [ 1] 2109         LDW Y,X
      008BFD 90 FE            [ 2] 2110 	LDW Y,(Y)
      008BFF 72 A2 00 02      [ 2] 2111         SUBW Y,#CELLL
      008C03 FF               [ 2] 2112         LDW (X),Y
      008C04 81               [ 4] 2113         RET
                                   2114 
                                   2115 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2116 ;       2*   ( n -- n )
                                   2117 ;       Multiply tos by 2.
                                   2118 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000B85                       2119         _HEADER CELLS,2,"2*"
      008C05 8B F8                    1         .word LINK 
                           000B87     2         LINK=.
      008C07 02                       3         .byte 2  
      008C08 32 2A                    4         .ascii "2*"
      008C0A                          5         CELLS:
      008C0A 90 93            [ 1] 2120         LDW Y,X
      008C0C 90 FE            [ 2] 2121 	LDW Y,(Y)
      008C0E 90 58            [ 2] 2122         SLAW Y
      008C10 FF               [ 2] 2123         LDW (X),Y
      008C11 81               [ 4] 2124         RET
                                   2125 
                                   2126 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2127 ;       1+      ( a -- a )
                                   2128 ;       Add cell size in byte 
                                   2129 ;       to address.
                                   2130 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000B92                       2131         _HEADER ONEP,2,"1+"
      008C12 8C 07                    1         .word LINK 
                           000B94     2         LINK=.
      008C14 02                       3         .byte 2  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



      008C15 31 2B                    4         .ascii "1+"
      008C17                          5         ONEP:
      008C17 90 93            [ 1] 2132         LDW Y,X
      008C19 90 FE            [ 2] 2133 	LDW Y,(Y)
      008C1B 90 5C            [ 1] 2134         INCW Y
      008C1D FF               [ 2] 2135         LDW (X),Y
      008C1E 81               [ 4] 2136         RET
                                   2137 
                                   2138 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2139 ;       1-      ( a -- a )
                                   2140 ;       Subtract 2 from address.
                                   2141 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000B9F                       2142         _HEADER ONEM,2,"1-"
      008C1F 8C 14                    1         .word LINK 
                           000BA1     2         LINK=.
      008C21 02                       3         .byte 2  
      008C22 31 2D                    4         .ascii "1-"
      008C24                          5         ONEM:
      008C24 90 93            [ 1] 2143         LDW Y,X
      008C26 90 FE            [ 2] 2144 	LDW Y,(Y)
      008C28 90 5A            [ 2] 2145         DECW Y
      008C2A FF               [ 2] 2146         LDW (X),Y
      008C2B 81               [ 4] 2147         RET
                                   2148 
                                   2149 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2150 ;  shift left n times 
                                   2151 ; LSHIFT ( n1 n2 -- n1<<n2 )
                                   2152 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000BAC                       2153         _HEADER LSHIFT,6,"LSHIFT"
      008C2C 8C 21                    1         .word LINK 
                           000BAE     2         LINK=.
      008C2E 06                       3         .byte 6  
      008C2F 4C 53 48 49 46 54        4         .ascii "LSHIFT"
      008C35                          5         LSHIFT:
      008C35 E6 01            [ 1] 2154         ld a,(1,x)
      008C37 1C 00 02         [ 2] 2155         addw x,#CELLL 
      008C3A 90 93            [ 1] 2156         ldw y,x 
      008C3C 90 FE            [ 2] 2157         ldw y,(y)
      008C3E                       2158 LSHIFT1:
      008C3E 4D               [ 1] 2159         tnz a 
      008C3F 27 05            [ 1] 2160         jreq LSHIFT4 
      008C41 90 58            [ 2] 2161         sllw y 
      008C43 4A               [ 1] 2162         dec a 
      008C44 20 F8            [ 2] 2163         jra LSHIFT1 
      008C46                       2164 LSHIFT4:
      008C46 FF               [ 2] 2165         ldw (x),y 
      008C47 81               [ 4] 2166         ret 
                                   2167 
                                   2168 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2169 ; shift right n times                 
                                   2170 ; RSHIFT (n1 n2 -- n1>>n2 )
                                   2171 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000BC8                       2172         _HEADER RSHIFT,6,"RSHIFT"
      008C48 8C 2E                    1         .word LINK 
                           000BCA     2         LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



      008C4A 06                       3         .byte 6  
      008C4B 52 53 48 49 46 54        4         .ascii "RSHIFT"
      008C51                          5         RSHIFT:
      008C51 E6 01            [ 1] 2173         ld a,(1,x)
      008C53 1C 00 02         [ 2] 2174         addw x,#CELLL 
      008C56 90 93            [ 1] 2175         ldw y,x 
      008C58 90 FE            [ 2] 2176         ldw y,(y)
      008C5A                       2177 RSHIFT1:
      008C5A 4D               [ 1] 2178         tnz a 
      008C5B 27 05            [ 1] 2179         jreq RSHIFT4 
      008C5D 90 54            [ 2] 2180         srlw y 
      008C5F 4A               [ 1] 2181         dec a 
      008C60 20 F8            [ 2] 2182         jra RSHIFT1 
      008C62                       2183 RSHIFT4:
      008C62 FF               [ 2] 2184         ldw (x),y 
      008C63 81               [ 4] 2185         ret 
                                   2186 
                                   2187 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2188 ;       2/      ( n -- n )
                                   2189 ;       divide  tos by 2.
                                   2190 ;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000BE4                       2191         _HEADER TWOSL,2,"2/"
      008C64 8C 4A                    1         .word LINK 
                           000BE6     2         LINK=.
      008C66 02                       3         .byte 2  
      008C67 32 2F                    4         .ascii "2/"
      008C69                          5         TWOSL:
      008C69 90 93            [ 1] 2192         LDW Y,X
      008C6B 90 FE            [ 2] 2193 	LDW Y,(Y)
      008C6D 90 57            [ 2] 2194         SRAW Y
      008C6F FF               [ 2] 2195         LDW (X),Y
      008C70 81               [ 4] 2196         RET
                                   2197 
                                   2198 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2199 ;       BL      ( -- 32 )
                                   2200 ;       Return 32,  blank character.
                                   2201 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000BF1                       2202         _HEADER BLANK,2,"BL"
      008C71 8C 66                    1         .word LINK 
                           000BF3     2         LINK=.
      008C73 02                       3         .byte 2  
      008C74 42 4C                    4         .ascii "BL"
      008C76                          5         BLANK:
      008C76 1D 00 02         [ 2] 2203         SUBW X,#2
      008C79 90 AE 00 20      [ 2] 2204 	LDW Y,#32
      008C7D FF               [ 2] 2205         LDW (X),Y
      008C7E 81               [ 4] 2206         RET
                                   2207 
                                   2208 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2209 ;         0     ( -- 0)
                                   2210 ;         Return 0.
                                   2211 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000BFF                       2212         _HEADER ZERO,1,"0"
      008C7F 8C 73                    1         .word LINK 
                           000C01     2         LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



      008C81 01                       3         .byte 1  
      008C82 30                       4         .ascii "0"
      008C83                          5         ZERO:
      008C83 1D 00 02         [ 2] 2213         SUBW X,#2
      008C86 90 5F            [ 1] 2214 	CLRW Y
      008C88 FF               [ 2] 2215         LDW (X),Y
      008C89 81               [ 4] 2216         RET
                                   2217 
                                   2218 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2219 ;         1     ( -- 1)
                                   2220 ;         Return 1.
                                   2221 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000C0A                       2222         _HEADER ONE,1,"1"
      008C8A 8C 81                    1         .word LINK 
                           000C0C     2         LINK=.
      008C8C 01                       3         .byte 1  
      008C8D 31                       4         .ascii "1"
      008C8E                          5         ONE:
      008C8E 1D 00 02         [ 2] 2223         SUBW X,#2
      008C91 90 AE 00 01      [ 2] 2224 	LDW Y,#1
      008C95 FF               [ 2] 2225         LDW (X),Y
      008C96 81               [ 4] 2226         RET
                                   2227 
                                   2228 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2229 ;         -1    ( -- -1)
                                   2230 ;   Return -1
                                   2231 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000C17                       2232         _HEADER MONE,2,"-1"
      008C97 8C 8C                    1         .word LINK 
                           000C19     2         LINK=.
      008C99 02                       3         .byte 2  
      008C9A 2D 31                    4         .ascii "-1"
      008C9C                          5         MONE:
      008C9C 1D 00 02         [ 2] 2233         SUBW X,#2
      008C9F 90 AE FF FF      [ 2] 2234 	LDW Y,#0xFFFF
      008CA3 FF               [ 2] 2235         LDW (X),Y
      008CA4 81               [ 4] 2236         RET
                                   2237 
                                   2238 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2239 ;       >CHAR   ( c -- c )
                                   2240 ;       Filter non-printing characters.
                                   2241 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000C25                       2242         _HEADER TCHAR,5,">CHAR"
      008CA5 8C 99                    1         .word LINK 
                           000C27     2         LINK=.
      008CA7 05                       3         .byte 5  
      008CA8 3E 43 48 41 52           4         .ascii ">CHAR"
      008CAD                          5         TCHAR:
      008CAD E6 01            [ 1] 2243         ld a,(1,x)
      008CAF A1 20            [ 1] 2244         cp a,#32  
      008CB1 2B 05            [ 1] 2245         jrmi 1$ 
      008CB3 A1 7F            [ 1] 2246         cp a,#127 
      008CB5 2A 01            [ 1] 2247         jrpl 1$ 
      008CB7 81               [ 4] 2248         ret 
      008CB8 A6 5F            [ 1] 2249 1$:     ld a,#'_ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



      008CBA E7 01            [ 1] 2250         ld (1,x),a 
      008CBC 81               [ 4] 2251         ret 
                                   2252 
                                   2253 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2254 ;       DEPTH   ( -- n )
                                   2255 ;       Return  depth of  data stack.
                                   2256 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000C3D                       2257         _HEADER DEPTH,5,"DEPTH"
      008CBD 8C A7                    1         .word LINK 
                           000C3F     2         LINK=.
      008CBF 05                       3         .byte 5  
      008CC0 44 45 50 54 48           4         .ascii "DEPTH"
      008CC5                          5         DEPTH:
      008CC5 90 BE 2C         [ 2] 2258         LDW Y,SP0    ;save data stack ptr
      008CC8 BF 24            [ 2] 2259 	LDW XTEMP,X
      008CCA 72 B2 00 24      [ 2] 2260         SUBW Y,XTEMP     ;#bytes = SP0 - X
      008CCE 90 57            [ 2] 2261         SRAW Y    ;Y = #stack items
      008CD0 1D 00 02         [ 2] 2262 	SUBW X,#2
      008CD3 FF               [ 2] 2263         LDW (X),Y     ; if neg, underflow
      008CD4 81               [ 4] 2264         RET
                                   2265 
                                   2266 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2267 ;       PICK    ( ... +n -- ... w )
                                   2268 ;       Copy  nth stack item to tos.
                                   2269 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000C55                       2270         _HEADER PICK,4,"PICK"
      008CD5 8C BF                    1         .word LINK 
                           000C57     2         LINK=.
      008CD7 04                       3         .byte 4  
      008CD8 50 49 43 4B              4         .ascii "PICK"
      008CDC                          5         PICK:
      008CDC 90 93            [ 1] 2271         LDW Y,X   ;D = n1
      008CDE 90 FE            [ 2] 2272         LDW Y,(Y)
                                   2273 ; modified for standard compliance          
                                   2274 ; 0 PICK must be equivalent to DUP 
      008CE0 90 5C            [ 1] 2275         INCW Y 
      008CE2 90 58            [ 2] 2276         SLAW Y
      008CE4 BF 24            [ 2] 2277         LDW XTEMP,X
      008CE6 72 B9 00 24      [ 2] 2278         ADDW Y,XTEMP
      008CEA 90 FE            [ 2] 2279         LDW Y,(Y)
      008CEC FF               [ 2] 2280         LDW (X),Y
      008CED 81               [ 4] 2281         RET
                                   2282 
                                   2283 ;; Memory access
                                   2284 
                                   2285 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2286 ;       +!      ( n a -- )
                                   2287 ;       Add n to  contents at 
                                   2288 ;       address a.
                                   2289 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000C6E                       2290         _HEADER PSTOR,2,"+!"
      008CEE 8C D7                    1         .word LINK 
                           000C70     2         LINK=.
      008CF0 02                       3         .byte 2  
      008CF1 2B 21                    4         .ascii "+!"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



      008CF3                          5         PSTOR:
      008CF3 89               [ 2] 2291         PUSHW X   ; R: DP 
      008CF4 90 93            [ 1] 2292         LDW Y,X 
      008CF6 FE               [ 2] 2293         LDW X,(X) ; a 
      008CF7 90 EE 02         [ 2] 2294         LDW Y,(2,Y)  ; n 
      008CFA 90 89            [ 2] 2295         PUSHW Y      ; R: DP n 
      008CFC 90 93            [ 1] 2296         LDW Y,X 
      008CFE 90 FE            [ 2] 2297         LDW Y,(Y)
      008D00 72 F9 01         [ 2] 2298         ADDW Y,(1,SP) ; *a + n 
      008D03 FF               [ 2] 2299         LDW (X),Y 
      008D04 1E 03            [ 2] 2300         LDW X,(3,SP) ; DP
      008D06 1C 00 04         [ 2] 2301         ADDW X,#2*CELLL  ; ( n a -- )  
      008D09 5B 04            [ 2] 2302         ADDW SP,#2*CELLL ; R: DP n -- 
      008D0B 81               [ 4] 2303         RET 
                                   2304                 
                                   2305 
                                   2306 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2307 ;       2!      ( d a -- )
                                   2308 ;       Store  double integer 
                                   2309 ;       to address a.
                                   2310 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000C8C                       2311         _HEADER DSTOR,2,"2!"
      008D0C 8C F0                    1         .word LINK 
                           000C8E     2         LINK=.
      008D0E 02                       3         .byte 2  
      008D0F 32 21                    4         .ascii "2!"
      008D11                          5         DSTOR:
      008D11 90 93            [ 1] 2312         LDW Y,X 
      008D13 89               [ 2] 2313         PUSHW X 
      008D14 FE               [ 2] 2314         LDW X,(X) ; a 
      008D15 90 EE 02         [ 2] 2315         LDW Y,(2,Y) ; dhi 
      008D18 FF               [ 2] 2316         LDW (X),Y 
      008D19 16 01            [ 2] 2317         LDW Y,(1,SP)  
      008D1B 90 EE 04         [ 2] 2318         LDW Y,(4,Y) ; dlo 
      008D1E EF 02            [ 2] 2319         LDW (2,X),Y  
      008D20 85               [ 2] 2320         POPW X 
      008D21 1C 00 06         [ 2] 2321         ADDW X,#3*CELLL 
      008D24 81               [ 4] 2322         RET 
                                   2323 
                                   2324 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2325 ;       2@      ( a -- d )
                                   2326 ;       Fetch double integer 
                                   2327 ;       from address a.
                                   2328 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000CA5                       2329         _HEADER DAT,2,"2@"
      008D25 8D 0E                    1         .word LINK 
                           000CA7     2         LINK=.
      008D27 02                       3         .byte 2  
      008D28 32 40                    4         .ascii "2@"
      008D2A                          5         DAT:
      008D2A 90 93            [ 1] 2330         ldw y,x 
      008D2C 1D 00 02         [ 2] 2331         subw x,#CELLL 
      008D2F 90 FE            [ 2] 2332         ldw y,(y) ;address 
      008D31 90 89            [ 2] 2333         pushw y  
      008D33 90 FE            [ 2] 2334         ldw y,(y) ; dhi 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



      008D35 FF               [ 2] 2335         ldw (x),y 
      008D36 90 85            [ 2] 2336         popw y 
      008D38 90 EE 02         [ 2] 2337         ldw y,(2,y) ; dlo 
      008D3B EF 02            [ 2] 2338         ldw (2,x),y 
      008D3D 81               [ 4] 2339         ret 
                                   2340 
                                   2341 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2342 ;       COUNT   ( b -- b +n )
                                   2343 ;       Return count byte of a string
                                   2344 ;       and add 1 to byte address.
                                   2345 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000CBE                       2346         _HEADER COUNT,5,"COUNT"
      008D3E 8D 27                    1         .word LINK 
                           000CC0     2         LINK=.
      008D40 05                       3         .byte 5  
      008D41 43 4F 55 4E 54           4         .ascii "COUNT"
      008D46                          5         COUNT:
      008D46 90 93            [ 1] 2347         ldw y,x 
      008D48 90 FE            [ 2] 2348         ldw y,(y) ; address 
      008D4A 90 F6            [ 1] 2349         ld a,(y)  ; count 
      008D4C 90 5C            [ 1] 2350         incw y 
      008D4E FF               [ 2] 2351         ldw (x),y 
      008D4F 1D 00 02         [ 2] 2352         subw x,#CELLL 
      008D52 E7 01            [ 1] 2353         ld (1,x),a 
      008D54 7F               [ 1] 2354         clr (x)
      008D55 81               [ 4] 2355         ret 
                                   2356 
                                   2357 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2358 ;       HERE    ( -- a )
                                   2359 ;       Return  top of  variables
                                   2360 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000CD6                       2361         _HEADER HERE,4,"HERE"
      008D56 8D 40                    1         .word LINK 
                           000CD8     2         LINK=.
      008D58 04                       3         .byte 4  
      008D59 48 45 52 45              4         .ascii "HERE"
      008D5D                          5         HERE:
      008D5D 90 AE 00 18      [ 2] 2362       	ldw y,#UVP 
      008D61 90 FE            [ 2] 2363         ldw y,(y)
      008D63 1D 00 02         [ 2] 2364         subw x,#CELLL 
      008D66 FF               [ 2] 2365         ldw (x),y 
      008D67 81               [ 4] 2366         ret 
                                   2367 
                                   2368 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2369 ;       PAD     ( -- a )
                                   2370 ;       Return address of text buffer
                                   2371 ;       above  code dictionary.
                                   2372 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000CE8                       2373         _HEADER PAD,3,"PAD"
      008D68 8D 58                    1         .word LINK 
                           000CEA     2         LINK=.
      008D6A 03                       3         .byte 3  
      008D6B 50 41 44                 4         .ascii "PAD"
      008D6E                          5         PAD:
      008D6E CD 8D 5D         [ 4] 2374         CALL     HERE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



      000CF1                       2375         _DOLIT   80
      008D71 CD 84 EF         [ 4]    1     CALL DOLIT 
      008D74 00 50                    2     .word 80 
      008D76 CC 88 BC         [ 2] 2376         JP     PLUS
                                   2377 
                                   2378 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2379 ;       TIB     ( -- a )
                                   2380 ;       Return address of 
                                   2381 ;       terminal input buffer.
                                   2382 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000CF9                       2383         _HEADER TIB,3,"TIB"
      008D79 8D 6A                    1         .word LINK 
                           000CFB     2         LINK=.
      008D7B 03                       3         .byte 3  
      008D7C 54 49 42                 4         .ascii "TIB"
      008D7F                          5         TIB:
      008D7F CD 87 8D         [ 4] 2384         CALL     NTIB
      008D82 CD 8B EC         [ 4] 2385         CALL     CELLP
      008D85 CC 85 63         [ 2] 2386         JP     AT
                                   2387 
                                   2388 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2389 ;       @EXECUTE        ( a -- )
                                   2390 ;       Execute vector stored in 
                                   2391 ;       address a.
                                   2392 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000D08                       2393         _HEADER ATEXE,8,"@EXECUTE"
      008D88 8D 7B                    1         .word LINK 
                           000D0A     2         LINK=.
      008D8A 08                       3         .byte 8  
      008D8B 40 45 58 45 43 55 54     4         .ascii "@EXECUTE"
             45
      008D93                          5         ATEXE:
      008D93 CD 85 63         [ 4] 2394         CALL     AT
      008D96 CD 88 4C         [ 4] 2395         CALL     QDUP    ;?address or zero
      008D99 CD 85 18         [ 4] 2396         CALL     QBRAN
      008D9C 8D A1                 2397         .word      EXE1
      008D9E CD 85 44         [ 4] 2398         CALL     EXECU   ;execute if non-zero
      008DA1 81               [ 4] 2399 EXE1:   RET     ;do nothing if zero
                                   2400 
                                   2401 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2402 ;       CMOVE   ( b1 b2 u -- )
                                   2403 ;       Copy u bytes from b1 to b2.
                                   2404 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000D22                       2405         _HEADER CMOVE,5,"CMOVE"
      008DA2 8D 8A                    1         .word LINK 
                           000D24     2         LINK=.
      008DA4 05                       3         .byte 5  
      008DA5 43 4D 4F 56 45           4         .ascii "CMOVE"
      008DAA                          5         CMOVE:
                                   2406         ;;;;  local variables ;;;;;;;
                           000005  2407         DP = 5
                           000003  2408         YTMP = 3 
                           000001  2409         CNT  = 1 
                                   2410         ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      008DAA 89               [ 2] 2411         PUSHW X  ; R: DP  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



      008DAB 52 02            [ 2] 2412         SUB SP,#2 ; R: DP YTMP 
      008DAD 90 93            [ 1] 2413         LDW Y,X 
      008DAF 90 FE            [ 2] 2414         LDW Y,(Y) ; CNT 
      008DB1 90 89            [ 2] 2415         PUSHW Y  ; R: DP YTMP CNT
      008DB3 90 93            [ 1] 2416         LDW Y,X 
      008DB5 90 EE 02         [ 2] 2417         LDW Y,(2,Y) ; b2, dest 
      008DB8 EE 04            [ 2] 2418         LDW X,(4,X) ; b1, src 
      008DBA 17 03            [ 2] 2419         LDW (YTMP,SP),Y 
      008DBC 13 03            [ 2] 2420         CPW X,(YTMP,SP) 
      008DBE 22 1A            [ 1] 2421         JRUGT CMOV2  ; src>dest 
                                   2422 ; src<dest copy from top to bottom
      008DC0 72 FB 01         [ 2] 2423         ADDW X,(CNT,SP)
      008DC3 72 F9 01         [ 2] 2424         ADDW Y,(CNT,SP)
      008DC6                       2425 CMOV1:  
      008DC6 17 03            [ 2] 2426         LDW (YTMP,SP),Y 
      008DC8 16 01            [ 2] 2427         LDW Y,(CNT,SP)
      008DCA 27 22            [ 1] 2428         JREQ CMOV3 
      008DCC 90 5A            [ 2] 2429         DECW Y 
      008DCE 17 01            [ 2] 2430         LDW (CNT,SP),Y 
      008DD0 16 03            [ 2] 2431         LDW Y,(YTMP,SP)
      008DD2 5A               [ 2] 2432         DECW X
      008DD3 F6               [ 1] 2433         LD A,(X)
      008DD4 90 5A            [ 2] 2434         DECW Y 
      008DD6 90 F7            [ 1] 2435         LD (Y),A 
      008DD8 20 EC            [ 2] 2436         JRA CMOV1
                                   2437 ; src>dest copy from bottom to top   
      008DDA                       2438 CMOV2: 
      008DDA 17 03            [ 2] 2439         LDW (YTMP,SP),Y 
      008DDC 16 01            [ 2] 2440         LDW Y,(CNT,SP)
      008DDE 27 0E            [ 1] 2441         JREQ CMOV3
      008DE0 90 5A            [ 2] 2442         DECW Y 
      008DE2 17 01            [ 2] 2443         LDW (CNT,SP),Y 
      008DE4 16 03            [ 2] 2444         LDW Y,(YTMP,SP)
      008DE6 F6               [ 1] 2445         LD A,(X)
      008DE7 5C               [ 1] 2446         INCW X 
      008DE8 90 F7            [ 1] 2447         LD (Y),A 
      008DEA 90 5C            [ 1] 2448         INCW Y 
      008DEC 20 EC            [ 2] 2449         JRA CMOV2 
      008DEE                       2450 CMOV3:
      008DEE 1E 05            [ 2] 2451         LDW X,(DP,SP)
      008DF0 1C 00 06         [ 2] 2452         ADDW X,#3*CELLL 
      008DF3 5B 06            [ 2] 2453         ADDW SP,#3*CELLL 
      008DF5 81               [ 4] 2454         RET 
                                   2455         
                                   2456 
                                   2457 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2458 ;       FILL    ( b u c -- )
                                   2459 ;       Fill u bytes of character c
                                   2460 ;       to area beginning at b.
                                   2461 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000D76                       2462         _HEADER FILL,4,"FILL"
      008DF6 8D A4                    1         .word LINK 
                           000D78     2         LINK=.
      008DF8 04                       3         .byte 4  
      008DF9 46 49 4C 4C              4         .ascii "FILL"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



      008DFD                          5         FILL:
      008DFD E6 01            [ 1] 2463         LD A,(1,X)
      008DFF 90 93            [ 1] 2464         LDW Y,X 
      008E01 1C 00 06         [ 2] 2465         ADDW X,#3*CELLL 
      008E04 89               [ 2] 2466         PUSHW X ; R: DP 
      008E05 93               [ 1] 2467         LDW X,Y 
      008E06 EE 04            [ 2] 2468         LDW X,(4,X) ; b
      008E08 90 EE 02         [ 2] 2469         LDW Y,(2,Y) ; u
      008E0B                       2470 FILL0:
      008E0B 27 06            [ 1] 2471         JREQ FILL1
      008E0D F7               [ 1] 2472         LD (X),A 
      008E0E 5C               [ 1] 2473         INCW X 
      008E0F 90 5A            [ 2] 2474         DECW Y 
      008E11 20 F8            [ 2] 2475         JRA FILL0         
      008E13 85               [ 2] 2476 FILL1: POPW X 
      008E14 81               [ 4] 2477         RET         
                                   2478         
                                   2479 
                                   2480 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2481 ;       ERASE   ( b u -- )
                                   2482 ;       Erase u bytes beginning at b.
                                   2483 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000D95                       2484         _HEADER ERASE,5,"ERASE"
      008E15 8D F8                    1         .word LINK 
                           000D97     2         LINK=.
      008E17 05                       3         .byte 5  
      008E18 45 52 41 53 45           4         .ascii "ERASE"
      008E1D                          5         ERASE:
      008E1D 90 5F            [ 1] 2485         clrw y 
      008E1F 1D 00 02         [ 2] 2486         subw x,#CELLL 
      008E22 FF               [ 2] 2487         ldw (x),y 
      008E23 CC 8D FD         [ 2] 2488         jp FILL 
                                   2489 
                                   2490 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2491 ;       PACK0   ( b u a -- a )
                                   2492 ;       Build a counted string with
                                   2493 ;       u characters from b. Null fill.
                                   2494 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000DA6                       2495         _HEADER PACKS,5,"PACK0"
      008E26 8E 17                    1         .word LINK 
                           000DA8     2         LINK=.
      008E28 05                       3         .byte 5  
      008E29 50 41 43 4B 30           4         .ascii "PACK0"
      008E2E                          5         PACKS:
      008E2E CD 86 99         [ 4] 2496         CALL     DUPP
      008E31 CD 86 62         [ 4] 2497         CALL     TOR     ;strings only on cell boundary
      008E34 CD 88 A7         [ 4] 2498         CALL     DDUP
      008E37 CD 85 70         [ 4] 2499         CALL     CSTOR
      008E3A CD 8C 17         [ 4] 2500         CALL     ONEP ;save count
      008E3D CD 86 A9         [ 4] 2501         CALL     SWAPP
      008E40 CD 8D AA         [ 4] 2502         CALL     CMOVE
      008E43 CD 85 B4         [ 4] 2503         CALL     RFROM
      008E46 81               [ 4] 2504         RET
                                   2505 
                                   2506 ;; Numeric output, single precision
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



                                   2507 
                                   2508 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2509 ;       DIGIT   ( u -- c )
                                   2510 ;       Convert digit u to a character.
                                   2511 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000DC7                       2512         _HEADER DIGIT,5,"DIGIT"
      008E47 8E 28                    1         .word LINK 
                           000DC9     2         LINK=.
      008E49 05                       3         .byte 5  
      008E4A 44 49 47 49 54           4         .ascii "DIGIT"
      008E4F                          5         DIGIT:
      008E4F CD 84 EF         [ 4] 2513         CALL	DOLIT
      008E52 00 09                 2514         .word	9
      008E54 CD 86 C1         [ 4] 2515         CALL	OVER
      008E57 CD 89 A6         [ 4] 2516         CALL	LESS
      008E5A CD 84 EF         [ 4] 2517         CALL	DOLIT
      008E5D 00 07                 2518         .word	7
      008E5F CD 86 F6         [ 4] 2519         CALL	ANDD
      008E62 CD 88 BC         [ 4] 2520         CALL	PLUS
      008E65 CD 84 EF         [ 4] 2521         CALL	DOLIT
      008E68 00 30                 2522         .word	48	;'0'
      008E6A CC 88 BC         [ 2] 2523         JP	PLUS
                                   2524 
                                   2525 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2526 ;       EXTRACT ( n base -- n c )
                                   2527 ;       Extract least significant 
                                   2528 ;       digit from n.
                                   2529 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000DED                       2530         _HEADER EXTRC,7,"EXTRACT"
      008E6D 8E 49                    1         .word LINK 
                           000DEF     2         LINK=.
      008E6F 07                       3         .byte 7  
      008E70 45 58 54 52 41 43 54     4         .ascii "EXTRACT"
      008E77                          5         EXTRC:
      008E77 CD 8C 83         [ 4] 2531         CALL     ZERO
      008E7A CD 86 A9         [ 4] 2532         CALL     SWAPP
      008E7D CD 8A 31         [ 4] 2533         CALL     UMMOD
      008E80 CD 86 A9         [ 4] 2534         CALL     SWAPP
      008E83 CC 8E 4F         [ 2] 2535         JP     DIGIT
                                   2536 
                                   2537 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2538 ;       <#      ( -- )
                                   2539 ;       Initiate  numeric 
                                   2540 ;       output process.
                                   2541 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000E06                       2542         _HEADER BDIGS,2,"#<"
      008E86 8E 6F                    1         .word LINK 
                           000E08     2         LINK=.
      008E88 02                       3         .byte 2  
      008E89 23 3C                    4         .ascii "#<"
      008E8B                          5         BDIGS:
      008E8B CD 8D 6E         [ 4] 2543         CALL     PAD
      008E8E CD 87 CF         [ 4] 2544         CALL     HLD
      008E91 CC 85 51         [ 2] 2545         JP     STORE
                                   2546 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



                                   2547 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2548 ;       HOLD    ( c -- )
                                   2549 ;       Insert a character 
                                   2550 ;       into output string.
                                   2551 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000E14                       2552         _HEADER HOLD,4,"HOLD"
      008E94 8E 88                    1         .word LINK 
                           000E16     2         LINK=.
      008E96 04                       3         .byte 4  
      008E97 48 4F 4C 44              4         .ascii "HOLD"
      008E9B                          5         HOLD:
      008E9B CD 87 CF         [ 4] 2553         CALL     HLD
      008E9E CD 85 63         [ 4] 2554         CALL     AT
      008EA1 CD 8C 24         [ 4] 2555         CALL     ONEM
      008EA4 CD 86 99         [ 4] 2556         CALL     DUPP
      008EA7 CD 87 CF         [ 4] 2557         CALL     HLD
      008EAA CD 85 51         [ 4] 2558         CALL     STORE
      008EAD CC 85 70         [ 2] 2559         JP     CSTOR
                                   2560 
                                   2561 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2562 ;       #       ( u -- u )
                                   2563 ;       Extract one digit from u and
                                   2564 ;       append digit to output string.
                                   2565 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000E30                       2566         _HEADER DIG,1,"#"
      008EB0 8E 96                    1         .word LINK 
                           000E32     2         LINK=.
      008EB2 01                       3         .byte 1  
      008EB3 23                       4         .ascii "#"
      008EB4                          5         DIG:
      008EB4 CD 87 5F         [ 4] 2567         CALL     BASE
      008EB7 CD 85 63         [ 4] 2568         CALL     AT
      008EBA CD 8E 77         [ 4] 2569         CALL     EXTRC
      008EBD CC 8E 9B         [ 2] 2570         JP     HOLD
                                   2571 
                                   2572 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2573 ;       #S      ( u -- 0 )
                                   2574 ;       Convert u until all digits
                                   2575 ;       are added to output string.
                                   2576 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000E40                       2577         _HEADER DIGS,2,"#S"
      008EC0 8E B2                    1         .word LINK 
                           000E42     2         LINK=.
      008EC2 02                       3         .byte 2  
      008EC3 23 53                    4         .ascii "#S"
      008EC5                          5         DIGS:
      008EC5 CD 8E B4         [ 4] 2578 DIGS1:  CALL     DIG
      008EC8 CD 86 99         [ 4] 2579         CALL     DUPP
      008ECB CD 85 18         [ 4] 2580         CALL     QBRAN
      008ECE 8E D2                 2581         .word      DIGS2
      008ED0 20 F3            [ 2] 2582         JRA     DIGS1
      008ED2 81               [ 4] 2583 DIGS2:  RET
                                   2584 
                                   2585 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2586 ;       SIGN    ( n -- )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



                                   2587 ;       Add a minus sign to
                                   2588 ;       numeric output string.
                                   2589 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000E53                       2590         _HEADER SIGN,4,"SIGN"
      008ED3 8E C2                    1         .word LINK 
                           000E55     2         LINK=.
      008ED5 04                       3         .byte 4  
      008ED6 53 49 47 4E              4         .ascii "SIGN"
      008EDA                          5         SIGN:
      008EDA CD 86 D0         [ 4] 2591         CALL     ZLESS
      008EDD CD 85 18         [ 4] 2592         CALL     QBRAN
      008EE0 8E EA                 2593         .word      SIGN1
      008EE2 CD 84 EF         [ 4] 2594         CALL     DOLIT
      008EE5 00 2D                 2595         .word      45	;"-"
      008EE7 CC 8E 9B         [ 2] 2596         JP     HOLD
      008EEA 81               [ 4] 2597 SIGN1:  RET
                                   2598 
                                   2599 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2600 ;       #>      ( w -- b u )
                                   2601 ;       Prepare output string.
                                   2602 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000E6B                       2603         _HEADER EDIGS,2,"#>"
      008EEB 8E D5                    1         .word LINK 
                           000E6D     2         LINK=.
      008EED 02                       3         .byte 2  
      008EEE 23 3E                    4         .ascii "#>"
      008EF0                          5         EDIGS:
      008EF0 CD 86 8F         [ 4] 2604         CALL     DROP
      008EF3 CD 87 CF         [ 4] 2605         CALL     HLD
      008EF6 CD 85 63         [ 4] 2606         CALL     AT
      008EF9 CD 8D 6E         [ 4] 2607         CALL     PAD
      008EFC CD 86 C1         [ 4] 2608         CALL     OVER
      008EFF CC 89 52         [ 2] 2609         JP     SUBB
                                   2610 
                                   2611 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2612 ;       str     ( w -- b u )
                                   2613 ;       Convert a signed integer
                                   2614 ;       to a numeric string.
                                   2615 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000E82                       2616         _HEADER STR,3,"STR"
      008F02 8E ED                    1         .word LINK 
                           000E84     2         LINK=.
      008F04 03                       3         .byte 3  
      008F05 53 54 52                 4         .ascii "STR"
      008F08                          5         STR:
      008F08 CD 86 99         [ 4] 2617         CALL     DUPP
      008F0B CD 86 62         [ 4] 2618         CALL     TOR
      008F0E CD 89 6C         [ 4] 2619         CALL     ABSS
      008F11 CD 8E 8B         [ 4] 2620         CALL     BDIGS
      008F14 CD 8E C5         [ 4] 2621         CALL     DIGS
      008F17 CD 85 B4         [ 4] 2622         CALL     RFROM
      008F1A CD 8E DA         [ 4] 2623         CALL     SIGN
      008F1D CC 8E F0         [ 2] 2624         JP     EDIGS
                                   2625 
                                   2626 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



                                   2627 ;       HEX     ( -- )
                                   2628 ;       Use radix 16 as base for
                                   2629 ;       numeric conversions.
                                   2630 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000EA0                       2631         _HEADER HEX,3,"HEX"
      008F20 8F 04                    1         .word LINK 
                           000EA2     2         LINK=.
      008F22 03                       3         .byte 3  
      008F23 48 45 58                 4         .ascii "HEX"
      008F26                          5         HEX:
      008F26 CD 84 EF         [ 4] 2632         CALL     DOLIT
      008F29 00 10                 2633         .word      16
      008F2B CD 87 5F         [ 4] 2634         CALL     BASE
      008F2E CC 85 51         [ 2] 2635         JP     STORE
                                   2636 
                                   2637 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2638 ;       DECIMAL ( -- )
                                   2639 ;       Use radix 10 as base
                                   2640 ;       for numeric conversions.
                                   2641 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000EB1                       2642         _HEADER DECIM,7,"DECIMAL"
      008F31 8F 22                    1         .word LINK 
                           000EB3     2         LINK=.
      008F33 07                       3         .byte 7  
      008F34 44 45 43 49 4D 41 4C     4         .ascii "DECIMAL"
      008F3B                          5         DECIM:
      008F3B CD 84 EF         [ 4] 2643         CALL     DOLIT
      008F3E 00 0A                 2644         .word      10
      008F40 CD 87 5F         [ 4] 2645         CALL     BASE
      008F43 CC 85 51         [ 2] 2646         JP     STORE
                                   2647 
                                   2648 ;; Numeric input, single precision
                                   2649 
                                   2650 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2651 ;       DIGIT?  ( c base -- u t )
                                   2652 ;       Convert a character to its numeric
                                   2653 ;       value. A flag indicates success.
                                   2654 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000EC6                       2655         _HEADER DIGTQ,6,"DIGIT?"
      008F46 8F 33                    1         .word LINK 
                           000EC8     2         LINK=.
      008F48 06                       3         .byte 6  
      008F49 44 49 47 49 54 3F        4         .ascii "DIGIT?"
      008F4F                          5         DIGTQ:
      008F4F CD 86 62         [ 4] 2656         CALL     TOR
      008F52 CD 84 EF         [ 4] 2657         CALL     DOLIT
      008F55 00 30                 2658         .word     48	; "0"
      008F57 CD 89 52         [ 4] 2659         CALL     SUBB
      008F5A CD 84 EF         [ 4] 2660         CALL     DOLIT
      008F5D 00 09                 2661         .word      9
      008F5F CD 86 C1         [ 4] 2662         CALL     OVER
      008F62 CD 89 A6         [ 4] 2663         CALL     LESS
      008F65 CD 85 18         [ 4] 2664         CALL     QBRAN
      008F68 8F 80                 2665         .word      DGTQ1
      008F6A CD 84 EF         [ 4] 2666         CALL     DOLIT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



      008F6D 00 07                 2667         .word      7
      008F6F CD 89 52         [ 4] 2668         CALL     SUBB
      008F72 CD 86 99         [ 4] 2669         CALL     DUPP
      008F75 CD 84 EF         [ 4] 2670         CALL     DOLIT
      008F78 00 0A                 2671         .word      10
      008F7A CD 89 A6         [ 4] 2672         CALL     LESS
      008F7D CD 87 0A         [ 4] 2673         CALL     ORR
      008F80 CD 86 99         [ 4] 2674 DGTQ1:  CALL     DUPP
      008F83 CD 85 B4         [ 4] 2675         CALL     RFROM
      008F86 CC 89 90         [ 2] 2676         JP     ULESS
                                   2677 
                           000001  2678 .if  WANT_DOUBLE
                           000000  2679 .else 
                                   2680 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2681 ;       NUMBER? ( a -- n T | a F )
                                   2682 ;       Convert a number string to
                                   2683 ;       integer. Push a flag on tos.
                                   2684 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2685         _HEADER NUMBQ,7,"NUMBER?"
                                   2686         CALL     BASE
                                   2687         CALL     AT
                                   2688         CALL     TOR
                                   2689         CALL     ZERO
                                   2690         CALL     OVER
                                   2691         CALL     COUNT
                                   2692         CALL     OVER
                                   2693         CALL     CAT
                                   2694         CALL     DOLIT
                                   2695         .word     36	; "0x"
                                   2696         CALL     EQUAL
                                   2697         CALL     QBRAN
                                   2698         .word      NUMQ1
                                   2699         CALL     HEX
                                   2700         CALL     SWAPP
                                   2701         CALL     ONEP
                                   2702         CALL     SWAPP
                                   2703         CALL     ONEM
                                   2704 NUMQ1:  CALL     OVER
                                   2705         CALL     CAT
                                   2706         CALL     DOLIT
                                   2707         .word     45	; "-"
                                   2708         CALL     EQUAL
                                   2709         CALL     TOR
                                   2710         CALL     SWAPP
                                   2711         CALL     RAT
                                   2712         CALL     SUBB
                                   2713         CALL     SWAPP
                                   2714         CALL     RAT
                                   2715         CALL     PLUS
                                   2716         CALL     QDUP
                                   2717         CALL     QBRAN
                                   2718         .word      NUMQ6
                                   2719         CALL     ONEM
                                   2720         CALL     TOR
                                   2721 NUMQ2:  CALL     DUPP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



                                   2722         CALL     TOR
                                   2723         CALL     CAT
                                   2724         CALL     BASE
                                   2725         CALL     AT
                                   2726         CALL     DIGTQ
                                   2727         CALL     QBRAN
                                   2728         .word      NUMQ4
                                   2729         CALL     SWAPP
                                   2730         CALL     BASE
                                   2731         CALL     AT
                                   2732         CALL     STAR
                                   2733         CALL     PLUS
                                   2734         CALL     RFROM
                                   2735         CALL     ONEP
                                   2736         CALL     DONXT
                                   2737         .word      NUMQ2
                                   2738         CALL     RAT
                                   2739         CALL     SWAPP
                                   2740         CALL     DROP
                                   2741         CALL     QBRAN
                                   2742         .word      NUMQ3
                                   2743         CALL     NEGAT
                                   2744 NUMQ3:  CALL     SWAPP
                                   2745         JRA     NUMQ5
                                   2746 NUMQ4:  CALL     RFROM
                                   2747         CALL     RFROM
                                   2748         CALL     DDROP
                                   2749         CALL     DDROP
                                   2750         CALL     ZERO
                                   2751 NUMQ5:  CALL     DUPP
                                   2752 NUMQ6:  CALL     RFROM
                                   2753         CALL     DDROP
                                   2754         CALL     RFROM
                                   2755         CALL     BASE
                                   2756         JP     STORE
                                   2757 .endif ; WANT_DOUBLE  
                                   2758 
                                   2759 ;; Basic I/O
                                   2760 
                                   2761 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2762 ;       KEY     ( -- c )
                                   2763 ;       Wait for and return an
                                   2764 ;       input character.
                                   2765 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000F09                       2766         _HEADER KEY,3,"KEY"
      008F89 8F 48                    1         .word LINK 
                           000F0B     2         LINK=.
      008F8B 03                       3         .byte 3  
      008F8C 4B 45 59                 4         .ascii "KEY"
      008F8F                          5         KEY:
      008F8F 72 0B 52 30 FB   [ 2] 2767         btjf UART_SR,#UART_SR_RXNE,. 
      008F94 C6 52 31         [ 1] 2768         ld a,UART_DR 
      008F97 1D 00 02         [ 2] 2769         subw x,#CELLL 
      008F9A E7 01            [ 1] 2770         ld (1,x),a 
      008F9C 7F               [ 1] 2771         clr (x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



      008F9D 81               [ 4] 2772         ret 
                                   2773 
                                   2774 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2775 ;       NUF?    ( -- t )
                                   2776 ;       Return false if no input,
                                   2777 ;       else pause and if CR return true.
                                   2778 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000F1E                       2779         _HEADER NUFQ,4,"NUF?"
      008F9E 8F 8B                    1         .word LINK 
                           000F20     2         LINK=.
      008FA0 04                       3         .byte 4  
      008FA1 4E 55 46 3F              4         .ascii "NUF?"
      008FA5                          5         NUFQ:
      008FA5 CD 84 98         [ 4] 2780         CALL     QKEY
      008FA8 CD 86 99         [ 4] 2781         CALL     DUPP
      008FAB CD 85 18         [ 4] 2782         CALL     QBRAN
      008FAE 8F BE                 2783         .word    NUFQ1
      008FB0 CD 88 9C         [ 4] 2784         CALL     DDROP
      008FB3 CD 8F 8F         [ 4] 2785         CALL     KEY
      008FB6 CD 84 EF         [ 4] 2786         CALL     DOLIT
      008FB9 00 0D                 2787         .word      CRR
      008FBB CC 89 7A         [ 2] 2788         JP     EQUAL
      008FBE 81               [ 4] 2789 NUFQ1:  RET
                                   2790 
                                   2791 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2792 ;       SPACE   ( -- )
                                   2793 ;       Send  blank character to
                                   2794 ;       output device.
                                   2795 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000F3F                       2796         _HEADER SPACE,5,"SPACE"
      008FBF 8F A0                    1         .word LINK 
                           000F41     2         LINK=.
      008FC1 05                       3         .byte 5  
      008FC2 53 50 41 43 45           4         .ascii "SPACE"
      008FC7                          5         SPACE:
      008FC7 CD 8C 76         [ 4] 2797         CALL     BLANK
      008FCA CC 84 B6         [ 2] 2798         JP     EMIT
                                   2799 
                                   2800 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2801 ;       SPACES  ( +n -- )
                                   2802 ;       Send n spaces to output device.
                                   2803 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000F4D                       2804         _HEADER SPACS,6,"SPACES"
      008FCD 8F C1                    1         .word LINK 
                           000F4F     2         LINK=.
      008FCF 06                       3         .byte 6  
      008FD0 53 50 41 43 45 53        4         .ascii "SPACES"
      008FD6                          5         SPACS:
      008FD6 CD 8C 83         [ 4] 2805         CALL     ZERO
      008FD9 CD 89 EB         [ 4] 2806         CALL     MAX
      008FDC CD 86 62         [ 4] 2807         CALL     TOR
      008FDF 20 03            [ 2] 2808         JRA      CHAR2
      008FE1 CD 8F C7         [ 4] 2809 CHAR1:  CALL     SPACE
      008FE4 CD 85 03         [ 4] 2810 CHAR2:  CALL     DONXT
      008FE7 8F E1                 2811         .word    CHAR1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



      008FE9 81               [ 4] 2812         RET
                                   2813 
                                   2814 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2815 ;       TYPE    ( b u -- )
                                   2816 ;       Output u characters from b.
                                   2817 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000F6A                       2818         _HEADER TYPES,4,"TYPE"
      008FEA 8F CF                    1         .word LINK 
                           000F6C     2         LINK=.
      008FEC 04                       3         .byte 4  
      008FED 54 59 50 45              4         .ascii "TYPE"
      008FF1                          5         TYPES:
      008FF1 CD 86 62         [ 4] 2819         CALL     TOR
      008FF4 20 06            [ 2] 2820         JRA     TYPE2
      008FF6 CD 8D 46         [ 4] 2821 TYPE1:  CALL     COUNT 
      008FF9 CD 84 B6         [ 4] 2822         CALL     EMIT
      000F7C                       2823 TYPE2:  _DONXT  TYPE1
      008FFC CD 85 03         [ 4]    1     CALL DONXT 
      008FFF 8F F6                    2     .word TYPE1 
      009001 CC 86 8F         [ 2] 2824         JP     DROP
                                   2825 
                                   2826 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2827 ;       CR      ( -- )
                                   2828 ;       Output a carriage return
                                   2829 ;       and a line feed.
                                   2830 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000F84                       2831         _HEADER CR,2,"CR"
      009004 8F EC                    1         .word LINK 
                           000F86     2         LINK=.
      009006 02                       3         .byte 2  
      009007 43 52                    4         .ascii "CR"
      009009                          5         CR:
      000F89                       2832         _DOLIT  CRR 
      009009 CD 84 EF         [ 4]    1     CALL DOLIT 
      00900C 00 0D                    2     .word CRR 
      00900E CD 84 B6         [ 4] 2833         CALL    EMIT
      000F91                       2834         _DOLIT  LF
      009011 CD 84 EF         [ 4]    1     CALL DOLIT 
      009014 00 0A                    2     .word LF 
      009016 CC 84 B6         [ 2] 2835         JP      EMIT
                                   2836 
                                   2837 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2838 ;       do$     ( -- a )
                                   2839 ;       Return  address of a compiled
                                   2840 ;       string.
                                   2841 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2842 ;       _HEADER DOSTR,COMPO+3,"DO$"
      009019                       2843 DOSTR:
      009019 CD 85 B4         [ 4] 2844         CALL     RFROM
      00901C CD 85 C5         [ 4] 2845         CALL     RAT
      00901F CD 85 B4         [ 4] 2846         CALL     RFROM
      009022 CD 8D 46         [ 4] 2847         CALL     COUNT
      009025 CD 88 BC         [ 4] 2848         CALL     PLUS
      009028 CD 86 62         [ 4] 2849         CALL     TOR
      00902B CD 86 A9         [ 4] 2850         CALL     SWAPP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



      00902E CD 86 62         [ 4] 2851         CALL     TOR
      009031 81               [ 4] 2852         RET
                                   2853 
                                   2854 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2855 ;       $"|     ( -- a )
                                   2856 ;       Run time routine compiled by $".
                                   2857 ;       Return address of a compiled string.
                                   2858 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2859 ;       _HEADER STRQP,COMPO+3,"$\"|"
      009032                       2860 STRQP:
      009032 CD 90 19         [ 4] 2861         CALL     DOSTR
      009035 81               [ 4] 2862         RET
                                   2863 
                                   2864 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2865 ;       ."|     ( -- )
                                   2866 ;       Run time routine of ." .
                                   2867 ;       Output a compiled string.
                                   2868 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2869 ;       _HEADER DOTQP,COMPO+3,".\"|"
      009036                       2870 DOTQP:
      009036 CD 90 19         [ 4] 2871         CALL     DOSTR
      009039 CD 8D 46         [ 4] 2872         CALL     COUNT
      00903C CC 8F F1         [ 2] 2873         JP     TYPES
                                   2874 
                                   2875 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2876 ;       .R      ( n +n -- )
                                   2877 ;       Display an integer in a field
                                   2878 ;       of n columns, right justified.
                                   2879 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000FBF                       2880         _HEADER DOTR,2,".R"
      00903F 90 06                    1         .word LINK 
                           000FC1     2         LINK=.
      009041 02                       3         .byte 2  
      009042 2E 52                    4         .ascii ".R"
      009044                          5         DOTR:
      009044 CD 86 62         [ 4] 2881         CALL     TOR
      009047 CD 8F 08         [ 4] 2882         CALL     STR
      00904A CD 85 B4         [ 4] 2883         CALL     RFROM
      00904D CD 86 C1         [ 4] 2884         CALL     OVER
      009050 CD 89 52         [ 4] 2885         CALL     SUBB
      009053 CD 8F D6         [ 4] 2886         CALL     SPACS
      009056 CC 8F F1         [ 2] 2887         JP     TYPES
                                   2888 
                                   2889 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2890 ;       U.R     ( u +n -- )
                                   2891 ;       Display an unsigned integer
                                   2892 ;       in n column, right justified.
                                   2893 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000FD9                       2894         _HEADER UDOTR,3,"U.R"
      009059 90 41                    1         .word LINK 
                           000FDB     2         LINK=.
      00905B 03                       3         .byte 3  
      00905C 55 2E 52                 4         .ascii "U.R"
      00905F                          5         UDOTR:
      00905F CD 86 62         [ 4] 2895         CALL     TOR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



      009062 CD 8E 8B         [ 4] 2896         CALL     BDIGS
      009065 CD 8E C5         [ 4] 2897         CALL     DIGS
      009068 CD 8E F0         [ 4] 2898         CALL     EDIGS
      00906B CD 85 B4         [ 4] 2899         CALL     RFROM
      00906E CD 86 C1         [ 4] 2900         CALL     OVER
      009071 CD 89 52         [ 4] 2901         CALL     SUBB
      009074 CD 8F D6         [ 4] 2902         CALL     SPACS
      009077 CC 8F F1         [ 2] 2903         JP     TYPES
                                   2904 
                                   2905 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2906 ;       U.      ( u -- )
                                   2907 ;       Display an unsigned integer
                                   2908 ;       in free format.
                                   2909 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000FFA                       2910         _HEADER UDOT,2,"U."
      00907A 90 5B                    1         .word LINK 
                           000FFC     2         LINK=.
      00907C 02                       3         .byte 2  
      00907D 55 2E                    4         .ascii "U."
      00907F                          5         UDOT:
      00907F CD 8E 8B         [ 4] 2911         CALL     BDIGS
      009082 CD 8E C5         [ 4] 2912         CALL     DIGS
      009085 CD 8E F0         [ 4] 2913         CALL     EDIGS
      009088 CD 8F C7         [ 4] 2914         CALL     SPACE
      00908B CC 8F F1         [ 2] 2915         JP     TYPES
                                   2916 
                                   2917 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2918 ;   H. ( n -- )
                                   2919 ;   display n in hexadecimal 
                                   2920 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00100E                       2921         _HEADER HDOT,2,"H."
      00908E 90 7C                    1         .word LINK 
                           001010     2         LINK=.
      009090 02                       3         .byte 2  
      009091 48 2E                    4         .ascii "H."
      009093                          5         HDOT:
      009093 CD 87 5F         [ 4] 2922         CALL BASE 
      009096 CD 85 63         [ 4] 2923         CALL AT 
      009099 CD 86 62         [ 4] 2924         CALL TOR 
      00909C CD 8F 26         [ 4] 2925         CALL HEX 
      00909F CD 90 7F         [ 4] 2926         CALL UDOT 
      0090A2 CD 85 B4         [ 4] 2927         CALL RFROM 
      0090A5 CD 87 5F         [ 4] 2928         CALL BASE 
      0090A8 CC 85 51         [ 2] 2929         JP STORE 
                                   2930          
                                   2931 
                                   2932 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2933 ;       .       ( w -- )
                                   2934 ;       Display an integer in free
                                   2935 ;       format, preceeded by a space.
                                   2936 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00102B                       2937         _HEADER DOT,1,"."
      0090AB 90 90                    1         .word LINK 
                           00102D     2         LINK=.
      0090AD 01                       3         .byte 1  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



      0090AE 2E                       4         .ascii "."
      0090AF                          5         DOT:
      0090AF CD 87 5F         [ 4] 2938         CALL     BASE
      0090B2 CD 85 63         [ 4] 2939         CALL     AT
      0090B5 CD 84 EF         [ 4] 2940         CALL     DOLIT
      0090B8 00 0A                 2941         .word      10
      0090BA CD 87 1F         [ 4] 2942         CALL     XORR    ;?decimal
      0090BD CD 85 18         [ 4] 2943         CALL     QBRAN
      0090C0 90 C5                 2944         .word      DOT1
      0090C2 CC 90 7F         [ 2] 2945         JP     UDOT
      0090C5 CD 8F 08         [ 4] 2946 DOT1:   CALL     STR
      0090C8 CD 8F C7         [ 4] 2947         CALL     SPACE
      0090CB CC 8F F1         [ 2] 2948         JP     TYPES
                                   2949 
                                   2950 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2951 ;       ?       ( a -- )
                                   2952 ;       Display contents in memory cell.
                                   2953 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00104E                       2954         _HEADER QUEST,1,"?"
      0090CE 90 AD                    1         .word LINK 
                           001050     2         LINK=.
      0090D0 01                       3         .byte 1  
      0090D1 3F                       4         .ascii "?"
      0090D2                          5         QUEST:
      0090D2 CD 85 63         [ 4] 2955         CALL     AT
      0090D5 CC 90 AF         [ 2] 2956         JP     DOT
                                   2957 
                                   2958 ;; Parsing
                                   2959 
                                   2960 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2961 ;       parse   ( b u c -- b u delta ; <string> )
                                   2962 ;       Scan string delimited by c.
                                   2963 ;       Return found string and its offset.
                                   2964 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001058                       2965         _HEADER PARS,5,"PARS$"
      0090D8 90 D0                    1         .word LINK 
                           00105A     2         LINK=.
      0090DA 05                       3         .byte 5  
      0090DB 50 41 52 53 24           4         .ascii "PARS$"
      0090E0                          5         PARS:
      0090E0 CD 87 6E         [ 4] 2966         CALL     TEMP
      0090E3 CD 85 51         [ 4] 2967         CALL     STORE
      0090E6 CD 86 C1         [ 4] 2968         CALL     OVER
      0090E9 CD 86 62         [ 4] 2969         CALL     TOR
      0090EC CD 86 99         [ 4] 2970         CALL     DUPP
      0090EF CD 85 18         [ 4] 2971         CALL     QBRAN
      0090F2 91 98                 2972         .word    PARS8
      0090F4 CD 8C 24         [ 4] 2973         CALL     ONEM
      0090F7 CD 87 6E         [ 4] 2974         CALL     TEMP
      0090FA CD 85 63         [ 4] 2975         CALL     AT
      0090FD CD 8C 76         [ 4] 2976         CALL     BLANK
      009100 CD 89 7A         [ 4] 2977         CALL     EQUAL
      009103 CD 85 18         [ 4] 2978         CALL     QBRAN
      009106 91 39                 2979         .word      PARS3
      009108 CD 86 62         [ 4] 2980         CALL     TOR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



      00910B CD 8C 76         [ 4] 2981 PARS1:  CALL     BLANK
      00910E CD 86 C1         [ 4] 2982         CALL     OVER
      009111 CD 85 81         [ 4] 2983         CALL     CAT     ;skip leading blanks ONLY
      009114 CD 89 52         [ 4] 2984         CALL     SUBB
      009117 CD 86 D0         [ 4] 2985         CALL     ZLESS
      00911A CD 88 F5         [ 4] 2986         CALL     INVER
      00911D CD 85 18         [ 4] 2987         CALL     QBRAN
      009120 91 36                 2988         .word      PARS2
      009122 CD 8C 17         [ 4] 2989         CALL     ONEP
      009125 CD 85 03         [ 4] 2990         CALL     DONXT
      009128 91 0B                 2991         .word      PARS1
      00912A CD 85 B4         [ 4] 2992         CALL     RFROM
      00912D CD 86 8F         [ 4] 2993         CALL     DROP
      009130 CD 8C 83         [ 4] 2994         CALL     ZERO
      009133 CC 86 99         [ 2] 2995         JP     DUPP
      009136 CD 85 B4         [ 4] 2996 PARS2:  CALL     RFROM
      009139 CD 86 C1         [ 4] 2997 PARS3:  CALL     OVER
      00913C CD 86 A9         [ 4] 2998         CALL     SWAPP
      00913F CD 86 62         [ 4] 2999         CALL     TOR
      009142 CD 87 6E         [ 4] 3000 PARS4:  CALL     TEMP
      009145 CD 85 63         [ 4] 3001         CALL     AT
      009148 CD 86 C1         [ 4] 3002         CALL     OVER
      00914B CD 85 81         [ 4] 3003         CALL     CAT
      00914E CD 89 52         [ 4] 3004         CALL     SUBB    ;scan for delimiter
      009151 CD 87 6E         [ 4] 3005         CALL     TEMP
      009154 CD 85 63         [ 4] 3006         CALL     AT
      009157 CD 8C 76         [ 4] 3007         CALL     BLANK
      00915A CD 89 7A         [ 4] 3008         CALL     EQUAL
      00915D CD 85 18         [ 4] 3009         CALL     QBRAN
      009160 91 65                 3010         .word      PARS5
      009162 CD 86 D0         [ 4] 3011         CALL     ZLESS
      009165 CD 85 18         [ 4] 3012 PARS5:  CALL     QBRAN
      009168 91 7A                 3013         .word      PARS6
      00916A CD 8C 17         [ 4] 3014         CALL     ONEP
      00916D CD 85 03         [ 4] 3015         CALL     DONXT
      009170 91 42                 3016         .word      PARS4
      009172 CD 86 99         [ 4] 3017         CALL     DUPP
      009175 CD 86 62         [ 4] 3018         CALL     TOR
      009178 20 0F            [ 2] 3019         JRA     PARS7
      00917A CD 85 B4         [ 4] 3020 PARS6:  CALL     RFROM
      00917D CD 86 8F         [ 4] 3021         CALL     DROP
      009180 CD 86 99         [ 4] 3022         CALL     DUPP
      009183 CD 8C 17         [ 4] 3023         CALL     ONEP
      009186 CD 86 62         [ 4] 3024         CALL     TOR
      009189 CD 86 C1         [ 4] 3025 PARS7:  CALL     OVER
      00918C CD 89 52         [ 4] 3026         CALL     SUBB
      00918F CD 85 B4         [ 4] 3027         CALL     RFROM
      009192 CD 85 B4         [ 4] 3028         CALL     RFROM
      009195 CC 89 52         [ 2] 3029         JP     SUBB
      009198 CD 86 C1         [ 4] 3030 PARS8:  CALL     OVER
      00919B CD 85 B4         [ 4] 3031         CALL     RFROM
      00919E CC 89 52         [ 2] 3032         JP     SUBB
                                   3033 
                                   3034 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3035 ;       PARSE   ( c -- b u ; <string> )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



                                   3036 ;       Scan input stream and return
                                   3037 ;       counted string delimited by c.
                                   3038 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001121                       3039         _HEADER PARSE,5,"PARSE"
      0091A1 90 DA                    1         .word LINK 
                           001123     2         LINK=.
      0091A3 05                       3         .byte 5  
      0091A4 50 41 52 53 45           4         .ascii "PARSE"
      0091A9                          5         PARSE:
      0091A9 CD 86 62         [ 4] 3040         CALL     TOR
      0091AC CD 8D 7F         [ 4] 3041         CALL     TIB
      0091AF CD 87 7D         [ 4] 3042         CALL     INN
      0091B2 CD 85 63         [ 4] 3043         CALL     AT
      0091B5 CD 88 BC         [ 4] 3044         CALL     PLUS    ;current input buffer pointer
      0091B8 CD 87 8D         [ 4] 3045         CALL     NTIB
      0091BB CD 85 63         [ 4] 3046         CALL     AT
      0091BE CD 87 7D         [ 4] 3047         CALL     INN
      0091C1 CD 85 63         [ 4] 3048         CALL     AT
      0091C4 CD 89 52         [ 4] 3049         CALL     SUBB    ;remaining count
      0091C7 CD 85 B4         [ 4] 3050         CALL     RFROM
      0091CA CD 90 E0         [ 4] 3051         CALL     PARS
      0091CD CD 87 7D         [ 4] 3052         CALL     INN
      0091D0 CC 8C F3         [ 2] 3053         JP     PSTOR
                                   3054 
                                   3055 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3056 ;       .(      ( -- )
                                   3057 ;       Output following string up to next ) .
                                   3058 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001153                       3059         _HEADER DOTPR,IMEDD+2,".("
      0091D3 91 A3                    1         .word LINK 
                           001155     2         LINK=.
      0091D5 82                       3         .byte IMEDD+2  
      0091D6 2E 28                    4         .ascii ".("
      0091D8                          5         DOTPR:
      0091D8 CD 84 EF         [ 4] 3060         CALL     DOLIT
      0091DB 00 29                 3061         .word     41	; ")"
      0091DD CD 91 A9         [ 4] 3062         CALL     PARSE
      0091E0 CC 8F F1         [ 2] 3063         JP     TYPES
                                   3064 
                                   3065 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3066 ;       (       ( -- )
                                   3067 ;       Ignore following string up to next ).
                                   3068 ;       A comment.
                                   3069 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001163                       3070         _HEADER PAREN,IMEDD+1,"("
      0091E3 91 D5                    1         .word LINK 
                           001165     2         LINK=.
      0091E5 81                       3         .byte IMEDD+1  
      0091E6 28                       4         .ascii "("
      0091E7                          5         PAREN:
      0091E7 CD 84 EF         [ 4] 3071         CALL     DOLIT
      0091EA 00 29                 3072         .word     41	; ")"
      0091EC CD 91 A9         [ 4] 3073         CALL     PARSE
      0091EF CC 88 9C         [ 2] 3074         JP     DDROP
                                   3075 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



                                   3076 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3077 ;       \       ( -- )
                                   3078 ;       Ignore following text till
                                   3079 ;       end of line.
                                   3080 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001172                       3081         _HEADER BKSLA,IMEDD+1,"\\"
      0091F2 91 E5                    1         .word LINK 
                           001174     2         LINK=.
      0091F4 81                       3         .byte IMEDD+1  
      0091F5 5C 5C                    4         .ascii "\\"
      0091F7                          5         BKSLA:
      0091F7 90 AE 00 0E      [ 2] 3082         ldw y,#UCTIB ; #TIB  
      0091FB 90 FE            [ 2] 3083         ldw y,(y)
      0091FD 90 89            [ 2] 3084         pushw y ; count in TIB 
      0091FF 90 AE 00 0C      [ 2] 3085         ldw y,#UINN ; >IN 
      009203 90 BF 26         [ 2] 3086         ldw YTEMP,y
      009206 90 85            [ 2] 3087         popw y 
      009208 91 CF 26         [ 5] 3088         ldw [YTEMP],y
      00920B 81               [ 4] 3089         ret 
                                   3090 
                                   3091 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3092 ;       WORD    ( c -- a ; <string> )
                                   3093 ;       Parse a word from input stream
                                   3094 ;       and copy it to code dictionary.
                                   3095 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00118C                       3096         _HEADER WORDD,4,"WORD"
      00920C 91 F4                    1         .word LINK 
                           00118E     2         LINK=.
      00920E 04                       3         .byte 4  
      00920F 57 4F 52 44              4         .ascii "WORD"
      009213                          5         WORDD:
      009213 CD 91 A9         [ 4] 3097         CALL     PARSE
      009216 CD 8D 5D         [ 4] 3098         CALL     HERE
      009219 CD 8B EC         [ 4] 3099         CALL     CELLP
                           000000  3100 .IF CASE_SENSE 
                                   3101         JP      PACKS 
                           000001  3102 .ELSE                 
      00921C CD 8E 2E         [ 4] 3103         CALL     PACKS
                                   3104 ; uppercase TOKEN 
      00921F CD 86 99         [ 4] 3105         CALL    DUPP 
      009222 CD 8D 46         [ 4] 3106         CALL    COUNT 
      009225 CD 86 62         [ 4] 3107         CALL    TOR 
      009228 CD 85 34         [ 4] 3108         CALL    BRAN 
      00922B 92 59                 3109         .word   UPPER2  
      00922D                       3110 UPPER:
      00922D CD 86 99         [ 4] 3111         CALL    DUPP 
      009230 CD 85 81         [ 4] 3112         CALL    CAT
      009233 CD 86 99         [ 4] 3113         CALL    DUPP 
      009236 CD 84 EF         [ 4] 3114         CALL   DOLIT
      009239 00 61                 3115         .word   'a' 
      00923B CD 84 EF         [ 4] 3116         CALL    DOLIT
      00923E 00 7B                 3117         .word   'z'+1 
      009240 CD 8A 16         [ 4] 3118         CALL   WITHI 
      009243 CD 85 18         [ 4] 3119         CALL   QBRAN
      009246 92 50                 3120         .word  UPPER1  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



      009248 CD 84 EF         [ 4] 3121         CALL    DOLIT 
      00924B 00 DF                 3122         .word   0xDF 
      00924D CD 86 F6         [ 4] 3123         CALL    ANDD 
      009250                       3124 UPPER1:
      009250 CD 86 C1         [ 4] 3125         CALL    OVER 
      009253 CD 85 70         [ 4] 3126         CALL    CSTOR          
      009256 CD 8C 17         [ 4] 3127         CALL    ONEP 
      009259                       3128 UPPER2: 
      009259 CD 85 03         [ 4] 3129         CALL    DONXT
      00925C 92 2D                 3130         .word   UPPER  
      00925E CD 86 8F         [ 4] 3131         CALL    DROP  
      009261 81               [ 4] 3132         RET 
                                   3133 .ENDIF 
                                   3134 
                                   3135 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3136 ;       TOKEN   ( -- a ; <string> )
                                   3137 ;       Parse a word from input stream
                                   3138 ;       and copy it to name dictionary.
                                   3139 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0011E2                       3140         _HEADER TOKEN,5,"TOKEN"
      009262 92 0E                    1         .word LINK 
                           0011E4     2         LINK=.
      009264 05                       3         .byte 5  
      009265 54 4F 4B 45 4E           4         .ascii "TOKEN"
      00926A                          5         TOKEN:
      00926A CD 8C 76         [ 4] 3141         CALL     BLANK
      00926D CC 92 13         [ 2] 3142         JP     WORDD
                                   3143 
                                   3144 ;; Dictionary search
                                   3145 
                                   3146 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3147 ;       NAME>   ( na -- ca )
                                   3148 ;       Return a code address given
                                   3149 ;       a name address.
                                   3150 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0011F0                       3151         _HEADER NAMET,5,"NAME>"
      009270 92 64                    1         .word LINK 
                           0011F2     2         LINK=.
      009272 05                       3         .byte 5  
      009273 4E 41 4D 45 3E           4         .ascii "NAME>"
      009278                          5         NAMET:
      009278 CD 8D 46         [ 4] 3152         CALL     COUNT
      00927B CD 84 EF         [ 4] 3153         CALL     DOLIT
      00927E 00 1F                 3154         .word      31
      009280 CD 86 F6         [ 4] 3155         CALL     ANDD
      009283 CC 88 BC         [ 2] 3156         JP     PLUS
                                   3157 
                                   3158 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3159 ;       SAME?   ( a a u -- a a f \ -0+ )
                                   3160 ;       Compare u cells in two
                                   3161 ;       strings. Return 0 if identical.
                                   3162 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001206                       3163         _HEADER SAMEQ,5,"SAME?"
      009286 92 72                    1         .word LINK 
                           001208     2         LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



      009288 05                       3         .byte 5  
      009289 53 41 4D 45 3F           4         .ascii "SAME?"
      00928E                          5         SAMEQ:
      00928E CD 8C 24         [ 4] 3164         CALL     ONEM
      009291 CD 86 62         [ 4] 3165         CALL     TOR
      009294 20 29            [ 2] 3166         JRA     SAME2
      009296 CD 86 C1         [ 4] 3167 SAME1:  CALL     OVER
      009299 CD 85 C5         [ 4] 3168         CALL     RAT
      00929C CD 88 BC         [ 4] 3169         CALL     PLUS
      00929F CD 85 81         [ 4] 3170         CALL     CAT
      0092A2 CD 86 C1         [ 4] 3171         CALL     OVER
      0092A5 CD 85 C5         [ 4] 3172         CALL     RAT
      0092A8 CD 88 BC         [ 4] 3173         CALL     PLUS
      0092AB CD 85 81         [ 4] 3174         CALL     CAT
      0092AE CD 89 52         [ 4] 3175         CALL     SUBB
      0092B1 CD 88 4C         [ 4] 3176         CALL     QDUP
      0092B4 CD 85 18         [ 4] 3177         CALL     QBRAN
      0092B7 92 BF                 3178         .word      SAME2
      0092B9 CD 85 B4         [ 4] 3179         CALL     RFROM
      0092BC CC 86 8F         [ 2] 3180         JP     DROP
      0092BF CD 85 03         [ 4] 3181 SAME2:  CALL     DONXT
      0092C2 92 96                 3182         .word      SAME1
      0092C4 CC 8C 83         [ 2] 3183         JP     ZERO
                                   3184 
                                   3185 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3186 ;       find    ( a va -- ca na | a F )
                                   3187 ;       Search vocabulary for string.
                                   3188 ;       Return ca and na if succeeded.
                                   3189 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001247                       3190         _HEADER FIND,4,"FIND"
      0092C7 92 88                    1         .word LINK 
                           001249     2         LINK=.
      0092C9 04                       3         .byte 4  
      0092CA 46 49 4E 44              4         .ascii "FIND"
      0092CE                          5         FIND:
      0092CE CD 86 A9         [ 4] 3191         CALL     SWAPP
      0092D1 CD 86 99         [ 4] 3192         CALL     DUPP
      0092D4 CD 85 81         [ 4] 3193         CALL     CAT
      0092D7 CD 87 6E         [ 4] 3194         CALL     TEMP
      0092DA CD 85 51         [ 4] 3195         CALL     STORE
      0092DD CD 86 99         [ 4] 3196         CALL     DUPP
      0092E0 CD 85 63         [ 4] 3197         CALL     AT
      0092E3 CD 86 62         [ 4] 3198         CALL     TOR
      0092E6 CD 8B EC         [ 4] 3199         CALL     CELLP
      0092E9 CD 86 A9         [ 4] 3200         CALL     SWAPP
      0092EC CD 85 63         [ 4] 3201 FIND1:  CALL     AT
      0092EF CD 86 99         [ 4] 3202         CALL     DUPP
      0092F2 CD 85 18         [ 4] 3203         CALL     QBRAN
      0092F5 93 2B                 3204         .word      FIND6
      0092F7 CD 86 99         [ 4] 3205         CALL     DUPP
      0092FA CD 85 63         [ 4] 3206         CALL     AT
      0092FD CD 84 EF         [ 4] 3207         CALL     DOLIT
      009300 1F 7F                 3208         .word      MASKK
      009302 CD 86 F6         [ 4] 3209         CALL     ANDD
      009305 CD 85 C5         [ 4] 3210         CALL     RAT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



      009308 CD 87 1F         [ 4] 3211         CALL     XORR
      00930B CD 85 18         [ 4] 3212         CALL     QBRAN
      00930E 93 1A                 3213         .word      FIND2
      009310 CD 8B EC         [ 4] 3214         CALL     CELLP
      009313 CD 84 EF         [ 4] 3215         CALL     DOLIT
      009316 FF FF                 3216         .word     0xFFFF
      009318 20 0C            [ 2] 3217         JRA     FIND3
      00931A CD 8B EC         [ 4] 3218 FIND2:  CALL     CELLP
      00931D CD 87 6E         [ 4] 3219         CALL     TEMP
      009320 CD 85 63         [ 4] 3220         CALL     AT
      009323 CD 92 8E         [ 4] 3221         CALL     SAMEQ
      009326 CD 85 34         [ 4] 3222 FIND3:  CALL     BRAN
      009329 93 3A                 3223         .word      FIND4
      00932B CD 85 B4         [ 4] 3224 FIND6:  CALL     RFROM
      00932E CD 86 8F         [ 4] 3225         CALL     DROP
      009331 CD 86 A9         [ 4] 3226         CALL     SWAPP
      009334 CD 8B FB         [ 4] 3227         CALL     CELLM
      009337 CC 86 A9         [ 2] 3228         JP     SWAPP
      00933A CD 85 18         [ 4] 3229 FIND4:  CALL     QBRAN
      00933D 93 47                 3230         .word      FIND5
      00933F CD 8B FB         [ 4] 3231         CALL     CELLM
      009342 CD 8B FB         [ 4] 3232         CALL     CELLM
      009345 20 A5            [ 2] 3233         JRA     FIND1
      009347 CD 85 B4         [ 4] 3234 FIND5:  CALL     RFROM
      00934A CD 86 8F         [ 4] 3235         CALL     DROP
      00934D CD 86 A9         [ 4] 3236         CALL     SWAPP
      009350 CD 86 8F         [ 4] 3237         CALL     DROP
      009353 CD 8B FB         [ 4] 3238         CALL     CELLM
      009356 CD 86 99         [ 4] 3239         CALL     DUPP
      009359 CD 92 78         [ 4] 3240         CALL     NAMET
      00935C CC 86 A9         [ 2] 3241         JP     SWAPP
                                   3242 
                                   3243 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3244 ;       NAME?   ( a -- ca na | a F )
                                   3245 ;       Search vocabularies for a string.
                                   3246 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0012DF                       3247         _HEADER NAMEQ,5,"NAME?"
      00935F 92 C9                    1         .word LINK 
                           0012E1     2         LINK=.
      009361 05                       3         .byte 5  
      009362 4E 41 4D 45 3F           4         .ascii "NAME?"
      009367                          5         NAMEQ:
      009367 CD 87 E2         [ 4] 3248         CALL   CNTXT
      00936A CC 92 CE         [ 2] 3249         JP     FIND
                                   3250 
                                   3251 ;; Terminal response
                                   3252 
                                   3253 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3254 ;       ^H      ( bot eot cur -- bot eot cur )
                                   3255 ;       Backup cursor by one character.
                                   3256 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0012ED                       3257         _HEADER BKSP,2,"^H"
      00936D 93 61                    1         .word LINK 
                           0012EF     2         LINK=.
      00936F 02                       3         .byte 2  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



      009370 5E 48                    4         .ascii "^H"
      009372                          5         BKSP:
      009372 CD 86 62         [ 4] 3258         CALL     TOR
      009375 CD 86 C1         [ 4] 3259         CALL     OVER
      009378 CD 85 B4         [ 4] 3260         CALL     RFROM
      00937B CD 86 A9         [ 4] 3261         CALL     SWAPP
      00937E CD 86 C1         [ 4] 3262         CALL     OVER
      009381 CD 87 1F         [ 4] 3263         CALL     XORR
      009384 CD 85 18         [ 4] 3264         CALL     QBRAN
      009387 93 A2                 3265         .word      BACK1
      009389 CD 84 EF         [ 4] 3266         CALL     DOLIT
      00938C 00 08                 3267         .word      BKSPP
      00938E CD 84 B6         [ 4] 3268         CALL     EMIT
      009391 CD 8C 24         [ 4] 3269         CALL     ONEM
      009394 CD 8C 76         [ 4] 3270         CALL     BLANK
      009397 CD 84 B6         [ 4] 3271         CALL     EMIT
      00939A CD 84 EF         [ 4] 3272         CALL     DOLIT
      00939D 00 08                 3273         .word      BKSPP
      00939F CC 84 B6         [ 2] 3274         JP     EMIT
      0093A2 81               [ 4] 3275 BACK1:  RET
                                   3276 
                                   3277 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3278 ;       TAP    ( bot eot cur c -- bot eot cur )
                                   3279 ;       Accept and echo key stroke
                                   3280 ;       and bump cursor.
                                   3281 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001323                       3282         _HEADER TAP,3,"TAP"
      0093A3 93 6F                    1         .word LINK 
                           001325     2         LINK=.
      0093A5 03                       3         .byte 3  
      0093A6 54 41 50                 4         .ascii "TAP"
      0093A9                          5         TAP:
      0093A9 CD 86 99         [ 4] 3283         CALL     DUPP
      0093AC CD 84 B6         [ 4] 3284         CALL     EMIT
      0093AF CD 86 C1         [ 4] 3285         CALL     OVER
      0093B2 CD 85 70         [ 4] 3286         CALL     CSTOR
      0093B5 CC 8C 17         [ 2] 3287         JP     ONEP
                                   3288 
                                   3289 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3290 ;       kTAP    ( bot eot cur c -- bot eot cur )
                                   3291 ;       Process a key stroke,
                                   3292 ;       CR,LF or backspace.
                                   3293 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001338                       3294         _HEADER KTAP,4,"KTAP"
      0093B8 93 A5                    1         .word LINK 
                           00133A     2         LINK=.
      0093BA 04                       3         .byte 4  
      0093BB 4B 54 41 50              4         .ascii "KTAP"
      0093BF                          5         KTAP:
      0093BF CD 86 99         [ 4] 3295         CALL     DUPP
      0093C2 CD 84 EF         [ 4] 3296         CALL     DOLIT
                           000001  3297 .if EOL_CR
      0093C5 00 0D                 3298         .word   CRR
                           000000  3299 .else ; EOL_LF 
                                   3300         .word   LF
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



                                   3301 .endif 
      0093C7 CD 87 1F         [ 4] 3302         CALL     XORR
      0093CA CD 85 18         [ 4] 3303         CALL     QBRAN
      0093CD 93 E5                 3304         .word      KTAP2
      0093CF CD 84 EF         [ 4] 3305         CALL     DOLIT
      0093D2 00 08                 3306         .word      BKSPP
      0093D4 CD 87 1F         [ 4] 3307         CALL     XORR
      0093D7 CD 85 18         [ 4] 3308         CALL     QBRAN
      0093DA 93 E2                 3309         .word      KTAP1
      0093DC CD 8C 76         [ 4] 3310         CALL     BLANK
      0093DF CC 93 A9         [ 2] 3311         JP     TAP
      0093E2 CC 93 72         [ 2] 3312 KTAP1:  JP     BKSP
      0093E5 CD 86 8F         [ 4] 3313 KTAP2:  CALL     DROP
      0093E8 CD 86 A9         [ 4] 3314         CALL     SWAPP
      0093EB CD 86 8F         [ 4] 3315         CALL     DROP
      0093EE CC 86 99         [ 2] 3316         JP     DUPP
                                   3317 
                                   3318 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3319 ;       accept  ( b u -- b u )
                                   3320 ;       Accept characters to input
                                   3321 ;       buffer. Return with actual count.
                                   3322 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001371                       3323         _HEADER ACCEP,6,"ACCEPT"
      0093F1 93 BA                    1         .word LINK 
                           001373     2         LINK=.
      0093F3 06                       3         .byte 6  
      0093F4 41 43 43 45 50 54        4         .ascii "ACCEPT"
      0093FA                          5         ACCEP:
      0093FA CD 86 C1         [ 4] 3324         CALL     OVER
      0093FD CD 88 BC         [ 4] 3325         CALL     PLUS
      009400 CD 86 C1         [ 4] 3326         CALL     OVER
      009403 CD 88 A7         [ 4] 3327 ACCP1:  CALL     DDUP
      009406 CD 87 1F         [ 4] 3328         CALL     XORR
      009409 CD 85 18         [ 4] 3329         CALL     QBRAN
      00940C 94 2E                 3330         .word      ACCP4
      00940E CD 8F 8F         [ 4] 3331         CALL     KEY
      009411 CD 86 99         [ 4] 3332         CALL     DUPP
      009414 CD 8C 76         [ 4] 3333         CALL     BLANK
      009417 CD 84 EF         [ 4] 3334         CALL     DOLIT
      00941A 00 7F                 3335         .word      127
      00941C CD 8A 16         [ 4] 3336         CALL     WITHI
      00941F CD 85 18         [ 4] 3337         CALL     QBRAN
      009422 94 29                 3338         .word      ACCP2
      009424 CD 93 A9         [ 4] 3339         CALL     TAP
      009427 20 03            [ 2] 3340         JRA     ACCP3
      009429 CD 93 BF         [ 4] 3341 ACCP2:  CALL     KTAP
      00942C 20 D5            [ 2] 3342 ACCP3:  JRA     ACCP1
      00942E CD 86 8F         [ 4] 3343 ACCP4:  CALL     DROP
      009431 CD 86 C1         [ 4] 3344         CALL     OVER
      009434 CC 89 52         [ 2] 3345         JP     SUBB
                                   3346 
                                   3347 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3348 ;       QUERY   ( -- )
                                   3349 ;       Accept input stream to
                                   3350 ;       terminal input buffer.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



                                   3351 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0013B7                       3352         _HEADER QUERY,5,"QUERY"
      009437 93 F3                    1         .word LINK 
                           0013B9     2         LINK=.
      009439 05                       3         .byte 5  
      00943A 51 55 45 52 59           4         .ascii "QUERY"
      00943F                          5         QUERY:
      00943F CD 8D 7F         [ 4] 3353         CALL     TIB
      009442 CD 84 EF         [ 4] 3354         CALL     DOLIT
      009445 00 50                 3355         .word      80
      009447 CD 93 FA         [ 4] 3356         CALL     ACCEP
      00944A CD 87 8D         [ 4] 3357         CALL     NTIB
      00944D CD 85 51         [ 4] 3358         CALL     STORE
      009450 CD 86 8F         [ 4] 3359         CALL     DROP
      009453 CD 8C 83         [ 4] 3360         CALL     ZERO
      009456 CD 87 7D         [ 4] 3361         CALL     INN
      009459 CC 85 51         [ 2] 3362         JP     STORE
                                   3363 
                                   3364 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3365 ;       ABORT   ( -- )
                                   3366 ;       Reset data stack and
                                   3367 ;       jump to QUIT.
                                   3368 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0013DC                       3369         _HEADER ABORT,5,"ABORT"
      00945C 94 39                    1         .word LINK 
                           0013DE     2         LINK=.
      00945E 05                       3         .byte 5  
      00945F 41 42 4F 52 54           4         .ascii "ABORT"
      009464                          5         ABORT:
      009464 CD 95 58         [ 4] 3370         CALL     PRESE
      009467 CC 95 75         [ 2] 3371         JP     QUIT
                                   3372 
                                   3373 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3374 ;       abort"  ( f -- )
                                   3375 ;       Run time routine of ABORT".
                                   3376 ;       Abort with a message.
                                   3377 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0013EA                       3378         _HEADER ABORQ,COMPO+6,'ABORT"'
      00946A 94 5E                    1         .word LINK 
                           0013EC     2         LINK=.
      00946C 46                       3         .byte COMPO+6  
      00946D 41 42 4F 52 54 22        4         .ascii 'ABORT"'
      009473                          5         ABORQ:
      009473 CD 85 18         [ 4] 3379         CALL     QBRAN
      009476 94 92                 3380         .word      ABOR2   ;text flag
      009478 CD 90 19         [ 4] 3381         CALL     DOSTR
      00947B CD 8F C7         [ 4] 3382 ABOR1:  CALL     SPACE
      00947E CD 8D 46         [ 4] 3383         CALL     COUNT
      009481 CD 8F F1         [ 4] 3384         CALL     TYPES
      009484 CD 84 EF         [ 4] 3385         CALL     DOLIT
      009487 00 3F                 3386         .word     63 ; "?"
      009489 CD 84 B6         [ 4] 3387         CALL     EMIT
      00948C CD 90 09         [ 4] 3388         CALL     CR
      00948F CC 94 64         [ 2] 3389         JP     ABORT   ;pass error string
      009492 CD 90 19         [ 4] 3390 ABOR2:  CALL     DOSTR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



      009495 CC 86 8F         [ 2] 3391         JP     DROP
                                   3392 
                                   3393 ;; The text interpreter
                                   3394 
                                   3395 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3396 ;       $INTERPRET      ( a -- )
                                   3397 ;       Interpret a word. If failed,
                                   3398 ;       try to convert it to an integer.
                                   3399 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001418                       3400         _HEADER INTER,10,"$INTERPRET"
      009498 94 6C                    1         .word LINK 
                           00141A     2         LINK=.
      00949A 0A                       3         .byte 10  
      00949B 24 49 4E 54 45 52 50     4         .ascii "$INTERPRET"
             52 45 54
      0094A5                          5         INTER:
      0094A5 CD 93 67         [ 4] 3401         CALL     NAMEQ
      0094A8 CD 88 4C         [ 4] 3402         CALL     QDUP    ;?defined
      0094AB CD 85 18         [ 4] 3403         CALL     QBRAN
      0094AE 94 CF                 3404         .word      INTE1
      0094B0 CD 85 63         [ 4] 3405         CALL     AT
      0094B3 CD 84 EF         [ 4] 3406         CALL     DOLIT
      0094B6 40 00                 3407 	.word       0x4000	; COMPO*256
      0094B8 CD 86 F6         [ 4] 3408         CALL     ANDD    ;?compile only lexicon bits
      0094BB CD 94 73         [ 4] 3409         CALL     ABORQ
      0094BE 0D                    3410         .byte      13
      0094BF 20 63 6F 6D 70 69 6C  3411         .ascii     " compile only"
             65 20 6F 6E 6C 79
      0094CC CC 85 44         [ 2] 3412         JP     EXECU
      0094CF CD A6 5A         [ 4] 3413 INTE1:  CALL     NUMBQ   ;convert a number
      0094D2 CD 85 18         [ 4] 3414         CALL     QBRAN
      0094D5 94 7B                 3415         .word    ABOR1
      0094D7 81               [ 4] 3416         RET
                                   3417 
                                   3418 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3419 ;       [       ( -- )
                                   3420 ;       Start  text interpreter.
                                   3421 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001458                       3422         _HEADER LBRAC,IMEDD+1,"["
      0094D8 94 9A                    1         .word LINK 
                           00145A     2         LINK=.
      0094DA 81                       3         .byte IMEDD+1  
      0094DB 5B                       4         .ascii "["
      0094DC                          5         LBRAC:
      0094DC CD 84 EF         [ 4] 3423         CALL   DOLIT
      0094DF 94 A5                 3424         .word  INTER
      0094E1 CD 87 C0         [ 4] 3425         CALL   TEVAL
      0094E4 CC 85 51         [ 2] 3426         JP     STORE
                                   3427 
                                   3428 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3429 ;       .OK     ( -- )
                                   3430 ;       Display 'ok' while interpreting.
                                   3431 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001467                       3432         _HEADER DOTOK,3,".OK"
      0094E7 94 DA                    1         .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



                           001469     2         LINK=.
      0094E9 03                       3         .byte 3  
      0094EA 2E 4F 4B                 4         .ascii ".OK"
      0094ED                          5         DOTOK:
      0094ED CD 84 EF         [ 4] 3433         CALL     DOLIT
      0094F0 94 A5                 3434         .word      INTER
      0094F2 CD 87 C0         [ 4] 3435         CALL     TEVAL
      0094F5 CD 85 63         [ 4] 3436         CALL     AT
      0094F8 CD 89 7A         [ 4] 3437         CALL     EQUAL
      0094FB CD 85 18         [ 4] 3438         CALL     QBRAN
      0094FE 95 07                 3439         .word      DOTO1
      009500 CD 90 36         [ 4] 3440         CALL     DOTQP
      009503 03                    3441         .byte      3
      009504 20 6F 6B              3442         .ascii     " ok"
      009507 CC 90 09         [ 2] 3443 DOTO1:  JP     CR
                                   3444 
                                   3445 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3446 ;       ?STACK  ( -- )
                                   3447 ;       Abort if stack underflows.
                                   3448 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00148A                       3449         _HEADER QSTAC,6,"?STACK"
      00950A 94 E9                    1         .word LINK 
                           00148C     2         LINK=.
      00950C 06                       3         .byte 6  
      00950D 3F 53 54 41 43 4B        4         .ascii "?STACK"
      009513                          5         QSTAC:
      009513 CD 8C C5         [ 4] 3450         CALL     DEPTH
      009516 CD 86 D0         [ 4] 3451         CALL     ZLESS   ;check only for underflow
      009519 CD 94 73         [ 4] 3452         CALL     ABORQ
      00951C 0B                    3453         .byte      11
      00951D 20 75 6E 64 65 72 66  3454         .ascii     " underflow "
             6C 6F 77 20
      009528 81               [ 4] 3455         RET
                                   3456 
                                   3457 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3458 ;       EVAL    ( -- )
                                   3459 ;       Interpret  input stream.
                                   3460 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0014A9                       3461         _HEADER EVAL,4,"EVAL"
      009529 95 0C                    1         .word LINK 
                           0014AB     2         LINK=.
      00952B 04                       3         .byte 4  
      00952C 45 56 41 4C              4         .ascii "EVAL"
      009530                          5         EVAL:
      009530 CD 92 6A         [ 4] 3462 EVAL1:  CALL     TOKEN
      009533 CD 86 99         [ 4] 3463         CALL     DUPP
      009536 CD 85 81         [ 4] 3464         CALL     CAT     ;?input stream empty
      009539 CD 85 18         [ 4] 3465         CALL     QBRAN
      00953C 95 49                 3466         .word    EVAL2
      00953E CD 87 C0         [ 4] 3467         CALL     TEVAL
      009541 CD 8D 93         [ 4] 3468         CALL     ATEXE
      009544 CD 95 13         [ 4] 3469         CALL     QSTAC   ;evaluate input, check stack
      009547 20 E7            [ 2] 3470         JRA     EVAL1 
      009549 CD 86 8F         [ 4] 3471 EVAL2:  CALL     DROP
      00954C CC 94 ED         [ 2] 3472         JP       DOTOK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



                                   3473 
                                   3474 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3475 ;       PRESET  ( -- )
                                   3476 ;       Reset data stack pointer and
                                   3477 ;       terminal input buffer.
                                   3478 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0014CF                       3479         _HEADER PRESE,6,"PRESET"
      00954F 95 2B                    1         .word LINK 
                           0014D1     2         LINK=.
      009551 06                       3         .byte 6  
      009552 50 52 45 53 45 54        4         .ascii "PRESET"
      009558                          5         PRESE:
      009558 CD 84 EF         [ 4] 3480         CALL     DOLIT
      00955B 16 80                 3481         .word      SPP
      00955D CD 86 86         [ 4] 3482         CALL     SPSTO
      009560 CD 84 EF         [ 4] 3483         CALL     DOLIT
      009563 17 00                 3484         .word      TIBB
      009565 CD 87 8D         [ 4] 3485         CALL     NTIB
      009568 CD 8B EC         [ 4] 3486         CALL     CELLP
      00956B CC 85 51         [ 2] 3487         JP     STORE
                                   3488 
                                   3489 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3490 ;       QUIT    ( -- )
                                   3491 ;       Reset return stack pointer
                                   3492 ;       and start text interpreter.
                                   3493 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0014EE                       3494         _HEADER QUIT,4,"QUIT"
      00956E 95 51                    1         .word LINK 
                           0014F0     2         LINK=.
      009570 04                       3         .byte 4  
      009571 51 55 49 54              4         .ascii "QUIT"
      009575                          5         QUIT:
      009575 CD 84 EF         [ 4] 3495         CALL     DOLIT
      009578 17 FF                 3496         .word      RPP
      00957A CD 85 9E         [ 4] 3497         CALL     RPSTO   ;reset return stack pointer
      00957D CD 94 DC         [ 4] 3498 QUIT1:  CALL     LBRAC   ;start interpretation
      009580 CD 94 3F         [ 4] 3499 QUIT2:  CALL     QUERY   ;get input
      009583 CD 95 30         [ 4] 3500         CALL     EVAL
      009586 20 F8            [ 2] 3501         JRA     QUIT2   ;continue till error
                                   3502 
                                   3503 ;; The compiler
                                   3504 
                                   3505 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3506 ;       '       ( -- ca )
                                   3507 ;       Search vocabularies for
                                   3508 ;       next word in input stream.
                                   3509 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001508                       3510         _HEADER TICK,1,"'"
      009588 95 70                    1         .word LINK 
                           00150A     2         LINK=.
      00958A 01                       3         .byte 1  
      00958B 27                       4         .ascii "'"
      00958C                          5         TICK:
      00958C CD 92 6A         [ 4] 3511         CALL     TOKEN
      00958F CD 93 67         [ 4] 3512         CALL     NAMEQ   ;?defined
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



      009592 CD 85 18         [ 4] 3513         CALL     QBRAN
      009595 94 7B                 3514         .word      ABOR1
      009597 81               [ 4] 3515         RET     ;yes, push code address
                                   3516 
                                   3517 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3518 ;       ALLOT   ( n -- )
                                   3519 ;       Allocate n bytes to RAM 
                                   3520 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001518                       3521         _HEADER ALLOT,5,"ALLOT"
      009598 95 8A                    1         .word LINK 
                           00151A     2         LINK=.
      00959A 05                       3         .byte 5  
      00959B 41 4C 4C 4F 54           4         .ascii "ALLOT"
      0095A0                          5         ALLOT:
      0095A0 CD 87 F0         [ 4] 3522         CALL     VPP
                                   3523 ; must update APP_VP each time VP is modidied
      0095A3 CD 8C F3         [ 4] 3524         call PSTOR 
      0095A6 CC 9D A9         [ 2] 3525         jp UPDATVP 
                                   3526 
                                   3527 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3528 ;       ,       ( w -- )
                                   3529 ;         Compile an integer into
                                   3530 ;         variable space.
                                   3531 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001529                       3532         _HEADER COMMA,1,^/"\,"/
      0095A9 95 9A                    1         .word LINK 
                           00152B     2         LINK=.
      0095AB 01                       3         .byte 1  
      0095AC 5C 2C                    4         .ascii "\,"
      0095AE                          5         COMMA:
      0095AE CD 8D 5D         [ 4] 3533         CALL     HERE
      0095B1 CD 86 99         [ 4] 3534         CALL     DUPP
      0095B4 CD 8B EC         [ 4] 3535         CALL     CELLP   ;cell boundary
      0095B7 CD 87 F0         [ 4] 3536         CALL     VPP
      0095BA CD 85 51         [ 4] 3537         CALL     STORE
      0095BD CC 85 51         [ 2] 3538         JP     STORE
                                   3539 
                                   3540 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3541 ;       C,      ( c -- )
                                   3542 ;       Compile a byte into
                                   3543 ;       variables space.
                                   3544 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001540                       3545         _HEADER CCOMMA,2,^/"C,"/
      0095C0 95 AB                    1         .word LINK 
                           001542     2         LINK=.
      0095C2 02                       3         .byte 2  
      0095C3 43 2C                    4         .ascii "C,"
      0095C5                          5         CCOMMA:
      0095C5 CD 8D 5D         [ 4] 3546         CALL     HERE
      0095C8 CD 86 99         [ 4] 3547         CALL     DUPP
      0095CB CD 8C 17         [ 4] 3548         CALL     ONEP
      0095CE CD 87 F0         [ 4] 3549         CALL     VPP
      0095D1 CD 85 51         [ 4] 3550         CALL     STORE
      0095D4 CC 85 70         [ 2] 3551         JP     CSTOR
                                   3552 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



                                   3553 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3554 ;       [COMPILE]       ( -- ; <string> )
                                   3555 ;       Compile next immediate
                                   3556 ;       word into code dictionary.
                                   3557 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001557                       3558         _HEADER BCOMP,IMEDD+9,"[COMPILE]"
      0095D7 95 C2                    1         .word LINK 
                           001559     2         LINK=.
      0095D9 89                       3         .byte IMEDD+9  
      0095DA 5B 43 4F 4D 50 49 4C     4         .ascii "[COMPILE]"
             45 5D
      0095E3                          5         BCOMP:
      0095E3 CD 95 8C         [ 4] 3559         CALL     TICK
      0095E6 CC 98 C4         [ 2] 3560         JP     JSRC
                                   3561 
                                   3562 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3563 ;       COMPILE ( -- )
                                   3564 ;       Compile next jsr in
                                   3565 ;       colon list to code dictionary.
                                   3566 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001569                       3567         _HEADER COMPI,COMPO+7,"COMPILE"
      0095E9 95 D9                    1         .word LINK 
                           00156B     2         LINK=.
      0095EB 47                       3         .byte COMPO+7  
      0095EC 43 4F 4D 50 49 4C 45     4         .ascii "COMPILE"
      0095F3                          5         COMPI:
      0095F3 CD 85 B4         [ 4] 3568         CALL     RFROM
      0095F6 CD 86 99         [ 4] 3569         CALL     DUPP
      0095F9 CD 85 63         [ 4] 3570         CALL     AT
      0095FC CD 98 C4         [ 4] 3571         CALL     JSRC    ;compile subroutine
      0095FF CD 8B EC         [ 4] 3572         CALL     CELLP
      009602 90 93            [ 1] 3573         ldw y,x 
      009604 90 FE            [ 2] 3574         ldw y,(y)
      009606 1C 00 02         [ 2] 3575         addw x,#CELLL 
      009609 90 FC            [ 2] 3576         jp (y)
                                   3577 
                                   3578 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3579 ;       LITERAL ( w -- )
                                   3580 ;       Compile tos to dictionary
                                   3581 ;       as an integer literal.
                                   3582 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00158B                       3583         _HEADER LITER,COMPO+IMEDD+7,"LITERAL"
      00960B 95 EB                    1         .word LINK 
                           00158D     2         LINK=.
      00960D C7                       3         .byte COMPO+IMEDD+7  
      00960E 4C 49 54 45 52 41 4C     4         .ascii "LITERAL"
      009615                          5         LITER:
      009615 CD 95 F3         [ 4] 3584         CALL     COMPI
      009618 84 EF                 3585         .word DOLIT 
      00961A CC 95 AE         [ 2] 3586         JP     COMMA
                                   3587 
                                   3588 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3589 ;       $,"     ( -- )
                                   3590 ;       Compile a literal string
                                   3591 ;       up to next " .
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



                                   3592 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3593 ;        _HEADER STRCQ,3,^/'$,"'/
      00961D                       3594 STRCQ:
      00961D CD 84 EF         [ 4] 3595         CALL     DOLIT
      009620 00 22                 3596         .word     34	; "
      009622 CD 91 A9         [ 4] 3597         CALL     PARSE
      009625 CD 8D 5D         [ 4] 3598         CALL     HERE
      009628 CD 8E 2E         [ 4] 3599         CALL     PACKS   ;string to code dictionary
      00962B CD 8D 46         [ 4] 3600         CALL     COUNT
      00962E CD 88 BC         [ 4] 3601         CALL     PLUS    ;calculate aligned end of string
      009631 CD 87 F0         [ 4] 3602         CALL     VPP
      009634 CC 85 51         [ 2] 3603         JP     STORE
                                   3604 
                                   3605 ;; Structures
                                   3606 
                                   3607 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3608 ;       FOR     ( -- a )
                                   3609 ;       Start a FOR-NEXT loop
                                   3610 ;       structure in a colon definition.
                                   3611 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0015B7                       3612         _HEADER FOR,IMEDD+3,"FOR"
      009637 96 0D                    1         .word LINK 
                           0015B9     2         LINK=.
      009639 83                       3         .byte IMEDD+3  
      00963A 46 4F 52                 4         .ascii "FOR"
      00963D                          5         FOR:
      00963D CD 95 F3         [ 4] 3613         CALL     COMPI
      009640 86 62                 3614         .word TOR 
      009642 CC 8D 5D         [ 2] 3615         JP     HERE
                                   3616 
                                   3617 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3618 ;       NEXT    ( a -- )
                                   3619 ;       Terminate a FOR-NEXT loop.
                                   3620 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0015C5                       3621         _HEADER NEXT,IMEDD+4,"NEXT"
      009645 96 39                    1         .word LINK 
                           0015C7     2         LINK=.
      009647 84                       3         .byte IMEDD+4  
      009648 4E 45 58 54              4         .ascii "NEXT"
      00964C                          5         NEXT:
      00964C CD 95 F3         [ 4] 3622         CALL     COMPI
      00964F 85 03                 3623         .word DONXT 
      009651 CD 88 3C         [ 4] 3624         call ADRADJ
      009654 CC 95 AE         [ 2] 3625         JP     COMMA
                                   3626 
                                   3627 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3628 ;       I ( -- n )
                                   3629 ;       stack COUNTER
                                   3630 ;       of innermost FOR-NEXT  
                                   3631 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0015D7                       3632         _HEADER IFETCH,1,"I"
      009657 96 47                    1         .word LINK 
                           0015D9     2         LINK=.
      009659 01                       3         .byte 1  
      00965A 49                       4         .ascii "I"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



      00965B                          5         IFETCH:
      00965B 1D 00 02         [ 2] 3633         subw x,#CELLL 
      00965E 16 03            [ 2] 3634         ldw y,(3,sp)
      009660 FF               [ 2] 3635         ldw (x),y 
      009661 81               [ 4] 3636         ret 
                                   3637 
                                   3638 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3639 ;       J ( -- n )
                                   3640 ;   stack COUNTER
                                   3641 ;   of outer FOR-NEXT  
                                   3642 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0015E2                       3643         _HEADER JFETCH,1,"J"
      009662 96 59                    1         .word LINK 
                           0015E4     2         LINK=.
      009664 01                       3         .byte 1  
      009665 4A                       4         .ascii "J"
      009666                          5         JFETCH:
      009666 1D 00 02         [ 2] 3644         SUBW X,#CELLL 
      009669 16 05            [ 2] 3645         LDW Y,(5,SP)
      00966B FF               [ 2] 3646         LDW (X),Y 
      00966C 81               [ 4] 3647         RET 
                                   3648 
                                   3649 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3650 ;       BEGIN   ( -- a )
                                   3651 ;       Start an infinite or
                                   3652 ;       indefinite loop structure.
                                   3653 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0015ED                       3654         _HEADER BEGIN,IMEDD+5,"BEGIN"
      00966D 96 64                    1         .word LINK 
                           0015EF     2         LINK=.
      00966F 85                       3         .byte IMEDD+5  
      009670 42 45 47 49 4E           4         .ascii "BEGIN"
      009675                          5         BEGIN:
      009675 CC 8D 5D         [ 2] 3655         JP     HERE
                                   3656 
                                   3657 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3658 ;       UNTIL   ( a -- )
                                   3659 ;       Terminate a BEGIN-UNTIL
                                   3660 ;       indefinite loop structure.
                                   3661 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0015F8                       3662         _HEADER UNTIL,IMEDD+5,"UNTIL"
      009678 96 6F                    1         .word LINK 
                           0015FA     2         LINK=.
      00967A 85                       3         .byte IMEDD+5  
      00967B 55 4E 54 49 4C           4         .ascii "UNTIL"
      009680                          5         UNTIL:
      009680 CD 95 F3         [ 4] 3663         CALL     COMPI
      009683 85 18                 3664         .word    QBRAN 
      009685 CD 88 3C         [ 4] 3665         call ADRADJ
      009688 CC 95 AE         [ 2] 3666         JP     COMMA
                                   3667 
                                   3668 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3669 ;       AGAIN   ( a -- )
                                   3670 ;       Terminate a BEGIN-AGAIN
                                   3671 ;       infinite loop structure.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



                                   3672 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00160B                       3673         _HEADER AGAIN,IMEDD+5,"AGAIN"
      00968B 96 7A                    1         .word LINK 
                           00160D     2         LINK=.
      00968D 85                       3         .byte IMEDD+5  
      00968E 41 47 41 49 4E           4         .ascii "AGAIN"
      009693                          5         AGAIN:
                           000001  3674 .if OPTIMIZE 
      001613                       3675         _DOLIT JPIMM 
      009693 CD 84 EF         [ 4]    1     CALL DOLIT 
      009696 00 CC                    2     .word JPIMM 
      009698 CD 95 C5         [ 4] 3676         CALL  CCOMMA
                           000000  3677 .else 
                                   3678         CALL     COMPI
                                   3679         .word BRAN
                                   3680 .endif 
      00969B CD 88 3C         [ 4] 3681         call ADRADJ 
      00969E CC 95 AE         [ 2] 3682         JP     COMMA
                                   3683 
                                   3684 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3685 ;       IF      ( -- A )
                                   3686 ;       Begin a conditional branch.
                                   3687 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001621                       3688         _HEADER IFF,IMEDD+2,"IF"
      0096A1 96 8D                    1         .word LINK 
                           001623     2         LINK=.
      0096A3 82                       3         .byte IMEDD+2  
      0096A4 49 46                    4         .ascii "IF"
      0096A6                          5         IFF:
      0096A6 CD 95 F3         [ 4] 3689         CALL     COMPI
      0096A9 85 18                 3690         .word QBRAN
      0096AB CD 8D 5D         [ 4] 3691         CALL     HERE
      0096AE CD 8C 83         [ 4] 3692         CALL     ZERO
      0096B1 CC 95 AE         [ 2] 3693         JP     COMMA
                                   3694 
                                   3695 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3696 ;       THEN        ( A -- )
                                   3697 ;       Terminate a conditional 
                                   3698 ;       branch structure.
                                   3699 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001634                       3700         _HEADER THENN,IMEDD+4,"THEN"
      0096B4 96 A3                    1         .word LINK 
                           001636     2         LINK=.
      0096B6 84                       3         .byte IMEDD+4  
      0096B7 54 48 45 4E              4         .ascii "THEN"
      0096BB                          5         THENN:
      0096BB CD 8D 5D         [ 4] 3701         CALL     HERE
      0096BE CD 88 3C         [ 4] 3702         call ADRADJ 
      0096C1 CD 86 A9         [ 4] 3703         CALL     SWAPP
      0096C4 CC 85 51         [ 2] 3704         JP     STORE
                                   3705 
                                   3706 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3707 ;       ELSE        ( A -- A )
                                   3708 ;       Start the false clause in 
                                   3709 ;       an IF-ELSE-THEN structure.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



                                   3710 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001647                       3711         _HEADER ELSEE,IMEDD+4,"ELSE"
      0096C7 96 B6                    1         .word LINK 
                           001649     2         LINK=.
      0096C9 84                       3         .byte IMEDD+4  
      0096CA 45 4C 53 45              4         .ascii "ELSE"
      0096CE                          5         ELSEE:
                           000001  3712 .if OPTIMIZE 
      00164E                       3713         _DOLIT JPIMM 
      0096CE CD 84 EF         [ 4]    1     CALL DOLIT 
      0096D1 00 CC                    2     .word JPIMM 
      0096D3 CD 95 C5         [ 4] 3714         CALL CCOMMA 
                           000000  3715 .else 
                                   3716          CALL     COMPI
                                   3717         .word BRAN
                                   3718 .endif 
      0096D6 CD 8D 5D         [ 4] 3719         CALL     HERE
      0096D9 CD 8C 83         [ 4] 3720         CALL     ZERO
      0096DC CD 95 AE         [ 4] 3721         CALL     COMMA
      0096DF CD 86 A9         [ 4] 3722         CALL     SWAPP
      0096E2 CD 8D 5D         [ 4] 3723         CALL     HERE
      0096E5 CD 88 3C         [ 4] 3724         call ADRADJ 
      0096E8 CD 86 A9         [ 4] 3725         CALL     SWAPP
      0096EB CC 85 51         [ 2] 3726         JP     STORE
                                   3727 
                                   3728 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3729 ;       AHEAD       ( -- A )
                                   3730 ;       Compile a forward branch
                                   3731 ;       instruction.
                                   3732 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00166E                       3733         _HEADER AHEAD,IMEDD+5,"AHEAD"
      0096EE 96 C9                    1         .word LINK 
                           001670     2         LINK=.
      0096F0 85                       3         .byte IMEDD+5  
      0096F1 41 48 45 41 44           4         .ascii "AHEAD"
      0096F6                          5         AHEAD:
                           000001  3734 .if OPTIMIZE 
      001676                       3735         _DOLIT JPIMM 
      0096F6 CD 84 EF         [ 4]    1     CALL DOLIT 
      0096F9 00 CC                    2     .word JPIMM 
      0096FB CD 95 C5         [ 4] 3736         CALL CCOMMA
                           000000  3737 .else 
                                   3738         CALL     COMPI
                                   3739         .word BRAN
                                   3740 .endif 
      0096FE CD 8D 5D         [ 4] 3741         CALL     HERE
      009701 CD 8C 83         [ 4] 3742         CALL     ZERO
      009704 CC 95 AE         [ 2] 3743         JP     COMMA
                                   3744 
                                   3745 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3746 ;       WHILE       ( a -- A a )
                                   3747 ;       Conditional branch out of a 
                                   3748 ;       BEGIN-WHILE-REPEAT loop.
                                   3749 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001687                       3750         _HEADER WHILE,IMEDD+5,"WHILE"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



      009707 96 F0                    1         .word LINK 
                           001689     2         LINK=.
      009709 85                       3         .byte IMEDD+5  
      00970A 57 48 49 4C 45           4         .ascii "WHILE"
      00970F                          5         WHILE:
      00970F CD 95 F3         [ 4] 3751         CALL     COMPI
      009712 85 18                 3752         .word QBRAN
      009714 CD 8D 5D         [ 4] 3753         CALL     HERE
      009717 CD 8C 83         [ 4] 3754         CALL     ZERO
      00971A CD 95 AE         [ 4] 3755         CALL     COMMA
      00971D CC 86 A9         [ 2] 3756         JP     SWAPP
                                   3757 
                                   3758 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3759 ;       REPEAT      ( A a -- )
                                   3760 ;       Terminate a BEGIN-WHILE-REPEAT 
                                   3761 ;       indefinite loop.
                                   3762 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0016A0                       3763         _HEADER REPEA,IMEDD+6,"REPEAT"
      009720 97 09                    1         .word LINK 
                           0016A2     2         LINK=.
      009722 86                       3         .byte IMEDD+6  
      009723 52 45 50 45 41 54        4         .ascii "REPEAT"
      009729                          5         REPEA:
                           000001  3764 .if OPTIMIZE 
      0016A9                       3765         _DOLIT JPIMM 
      009729 CD 84 EF         [ 4]    1     CALL DOLIT 
      00972C 00 CC                    2     .word JPIMM 
      00972E CD 95 C5         [ 4] 3766         CALL  CCOMMA
                           000000  3767 .else 
                                   3768         CALL     COMPI
                                   3769         .word BRAN
                                   3770 .endif 
      009731 CD 88 3C         [ 4] 3771         call ADRADJ 
      009734 CD 95 AE         [ 4] 3772         CALL     COMMA
      009737 CD 8D 5D         [ 4] 3773         CALL     HERE
      00973A CD 88 3C         [ 4] 3774         call ADRADJ 
      00973D CD 86 A9         [ 4] 3775         CALL     SWAPP
      009740 CC 85 51         [ 2] 3776         JP     STORE
                                   3777 
                                   3778 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3779 ;       AFT         ( a -- a A )
                                   3780 ;       Jump to THEN in a FOR-AFT-THEN-NEXT 
                                   3781 ;       loop the first time through.
                                   3782 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0016C3                       3783         _HEADER AFT,IMEDD+3,"AFT"
      009743 97 22                    1         .word LINK 
                           0016C5     2         LINK=.
      009745 83                       3         .byte IMEDD+3  
      009746 41 46 54                 4         .ascii "AFT"
      009749                          5         AFT:
      009749 CD 86 8F         [ 4] 3784         CALL     DROP
      00974C CD 96 F6         [ 4] 3785         CALL     AHEAD
      00974F CD 8D 5D         [ 4] 3786         CALL     HERE
      009752 CC 86 A9         [ 2] 3787         JP     SWAPP
                                   3788 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



                                   3789 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3790 ;       ABORT"      ( -- ; <string> )
                                   3791 ;       Conditional abort with an error message.
                                   3792 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0016D5                       3793         _HEADER ABRTQ,IMEDD+6,'ABORT"'
      009755 97 45                    1         .word LINK 
                           0016D7     2         LINK=.
      009757 86                       3         .byte IMEDD+6  
      009758 41 42 4F 52 54 22        4         .ascii 'ABORT"'
      00975E                          5         ABRTQ:
      00975E CD 95 F3         [ 4] 3794         CALL     COMPI
      009761 94 73                 3795         .word ABORQ
      009763 CC 96 1D         [ 2] 3796         JP     STRCQ
                                   3797 
                                   3798 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3799 ;       $"     ( -- ; <string> )
                                   3800 ;       Compile an inline string literal.
                                   3801 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0016E6                       3802         _HEADER STRQ,IMEDD+2,'$"'
      009766 97 57                    1         .word LINK 
                           0016E8     2         LINK=.
      009768 82                       3         .byte IMEDD+2  
      009769 24 22                    4         .ascii '$"'
      00976B                          5         STRQ:
      00976B CD 95 F3         [ 4] 3803         CALL     COMPI
      00976E 90 32                 3804         .word STRQP 
      009770 CC 96 1D         [ 2] 3805         JP     STRCQ
                                   3806 
                                   3807 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3808 ;       ."          ( -- ; <string> )
                                   3809 ;       Compile an inline string literal 
                                   3810 ;       to be typed out at run time.
                                   3811 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0016F3                       3812         _HEADER DOTQ,IMEDD+2,'."'
      009773 97 68                    1         .word LINK 
                           0016F5     2         LINK=.
      009775 82                       3         .byte IMEDD+2  
      009776 2E 22                    4         .ascii '."'
      009778                          5         DOTQ:
      009778 CD 95 F3         [ 4] 3813         CALL     COMPI
      00977B 90 36                 3814         .word DOTQP 
      00977D CC 96 1D         [ 2] 3815         JP     STRCQ
                                   3816 
                                   3817 ;; Name compiler
                                   3818 
                                   3819 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3820 ;       ?UNIQUE ( a -- a )
                                   3821 ;       Display a warning message
                                   3822 ;       if word already exists.
                                   3823 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001700                       3824         _HEADER UNIQU,7,"?UNIQUE"
      009780 97 75                    1         .word LINK 
                           001702     2         LINK=.
      009782 07                       3         .byte 7  
      009783 3F 55 4E 49 51 55 45     4         .ascii "?UNIQUE"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



      00978A                          5         UNIQU:
      00978A CD 86 99         [ 4] 3825         CALL     DUPP
      00978D CD 93 67         [ 4] 3826         CALL     NAMEQ   ;?name exists
      009790 CD 85 18         [ 4] 3827         CALL     QBRAN
      009793 97 A9                 3828         .word      UNIQ1
      009795 CD 90 36         [ 4] 3829         CALL     DOTQP   ;redef are OK
      009798 07                    3830         .byte       7
      009799 20 72 65 44 65 66 20  3831         .ascii     " reDef "       
      0097A0 CD 86 C1         [ 4] 3832         CALL     OVER
      0097A3 CD 8D 46         [ 4] 3833         CALL     COUNT
      0097A6 CD 8F F1         [ 4] 3834         CALL     TYPES   ;just in case
      0097A9 CC 86 8F         [ 2] 3835 UNIQ1:  JP     DROP
                                   3836 
                                   3837 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3838 ;       $,n     ( na -- )
                                   3839 ;       Build a new dictionary name
                                   3840 ;       using string at na.
                                   3841 ; compile dans l'espace des variables 
                                   3842 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3843 ;        _HEADER SNAME,3,^/"$,n"/
      0097AC                       3844 SNAME: 
      0097AC CD 86 99         [ 4] 3845         CALL     DUPP
      0097AF CD 85 81         [ 4] 3846         CALL     CAT     ;?null input
      0097B2 CD 85 18         [ 4] 3847         CALL     QBRAN
      0097B5 97 E2                 3848         .word      PNAM1
      0097B7 CD 97 8A         [ 4] 3849         CALL     UNIQU   ;?redefinition
      0097BA CD 86 99         [ 4] 3850         CALL     DUPP
      0097BD CD 8D 46         [ 4] 3851         CALL     COUNT
      0097C0 CD 88 BC         [ 4] 3852         CALL     PLUS
      0097C3 CD 87 F0         [ 4] 3853         CALL     VPP
      0097C6 CD 85 51         [ 4] 3854         CALL     STORE
      0097C9 CD 86 99         [ 4] 3855         CALL     DUPP
      0097CC CD 88 0E         [ 4] 3856         CALL     LAST
      0097CF CD 85 51         [ 4] 3857         CALL     STORE   ;save na for vocabulary link
      0097D2 CD 8B FB         [ 4] 3858         CALL     CELLM   ;link address
      0097D5 CD 87 E2         [ 4] 3859         CALL     CNTXT
      0097D8 CD 85 63         [ 4] 3860         CALL     AT
      0097DB CD 86 A9         [ 4] 3861         CALL     SWAPP
      0097DE CD 85 51         [ 4] 3862         CALL     STORE
      0097E1 81               [ 4] 3863         RET     ;save code pointer
      0097E2 CD 90 32         [ 4] 3864 PNAM1:  CALL     STRQP
      0097E5 05                    3865         .byte      5
      0097E6 20 6E 61 6D 65        3866         .ascii     " name" ;null input
      0097EB CC 94 7B         [ 2] 3867         JP     ABOR1
                                   3868 
                                   3869 ;; FORTH compiler
                                   3870 
                                   3871 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3872 ;       $COMPILE        ( a -- )
                                   3873 ;       Compile next word to
                                   3874 ;       dictionary as a token or literal.
                                   3875 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00176E                       3876         _HEADER SCOMP,8,"$COMPILE"
      0097EE 97 82                    1         .word LINK 
                           001770     2         LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



      0097F0 08                       3         .byte 8  
      0097F1 24 43 4F 4D 50 49 4C     4         .ascii "$COMPILE"
             45
      0097F9                          5         SCOMP:
      0097F9 CD 93 67         [ 4] 3877         CALL     NAMEQ
      0097FC CD 88 4C         [ 4] 3878         CALL     QDUP    ;?defined
      0097FF CD 85 18         [ 4] 3879         CALL     QBRAN
      009802 98 1A                 3880         .word      SCOM2
      009804 CD 85 63         [ 4] 3881         CALL     AT
      009807 CD 84 EF         [ 4] 3882         CALL     DOLIT
      00980A 80 00                 3883         .word     0x8000	;  IMEDD*256
      00980C CD 86 F6         [ 4] 3884         CALL     ANDD    ;?immediate
      00980F CD 85 18         [ 4] 3885         CALL     QBRAN
      009812 98 17                 3886         .word      SCOM1
      009814 CC 85 44         [ 2] 3887         JP     EXECU
      009817 CC 98 C4         [ 2] 3888 SCOM1:  JP     JSRC
      00981A CD A6 5A         [ 4] 3889 SCOM2:  CALL     NUMBQ   ;try to convert to number
      00981D CD 88 4C         [ 4] 3890         CALL    QDUP  
      009820 CD 85 18         [ 4] 3891         CALL     QBRAN
      009823 94 7B                 3892         .word      ABOR1
      0017A5                       3893         _DOLIT  -1
      009825 CD 84 EF         [ 4]    1     CALL DOLIT 
      009828 FF FF                    2     .word -1 
      00982A CD 89 7A         [ 4] 3894         CALL    EQUAL
      0017AD                       3895         _QBRAN DLITER  
      00982D CD 85 18         [ 4]    1     CALL QBRAN
      009830 AA 2A                    2     .word DLITER
      009832 CC 96 15         [ 2] 3896         JP     LITER
                                   3897 
                                   3898 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3899 ;       OVERT   ( -- )
                                   3900 ;       Link a new word into vocabulary.
                                   3901 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0017B5                       3902         _HEADER OVERT,5,"OVERT"
      009835 97 F0                    1         .word LINK 
                           0017B7     2         LINK=.
      009837 05                       3         .byte 5  
      009838 4F 56 45 52 54           4         .ascii "OVERT"
      00983D                          5         OVERT:
      00983D CD 88 0E         [ 4] 3903         CALL     LAST
      009840 CD 85 63         [ 4] 3904         CALL     AT
      009843 CD 87 E2         [ 4] 3905         CALL     CNTXT
      009846 CC 85 51         [ 2] 3906         JP     STORE
                                   3907 
                                   3908 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3909 ;       ;       ( -- )
                                   3910 ;       Terminate a colon definition.
                                   3911 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0017C9                       3912         _HEADER SEMIS,IMEDD+COMPO+1,^/";"/
      009849 98 37                    1         .word LINK 
                           0017CB     2         LINK=.
      00984B C1                       3         .byte IMEDD+COMPO+1  
      00984C 3B                       4         .ascii ";"
      00984D                          5         SEMIS:
                           000001  3913 .if OPTIMIZE ; more compact and faster
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



      00984D CD 84 EF         [ 4] 3914         call DOLIT 
      009850 00 81                 3915         .word 0x81   ; opcode for RET 
      009852 CD 95 C5         [ 4] 3916         call CCOMMA 
                           000000  3917 .else
                                   3918         CALL     COMPI
                                   3919         .word EXIT 
                                   3920 .endif 
      009855 CD 94 DC         [ 4] 3921         CALL     LBRAC
      009858 CD 98 3D         [ 4] 3922         call OVERT 
      00985B CD A3 01         [ 4] 3923         CALL FMOVE
      00985E CD 88 4C         [ 4] 3924         call QDUP 
      009861 CD 85 18         [ 4] 3925         call QBRAN 
      009864 99 DA                 3926         .word SET_RAMLAST 
      009866 CD A3 95         [ 4] 3927         CALL UPDATPTR
      009869 81               [ 4] 3928         RET 
                                   3929 
                                   3930 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3931 ;       Terminate an ISR definition 
                                   3932 ;       retourn ca of ISR as double
                                   3933 ;       I; ( -- ud )
                                   3934 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0017EA                       3935        _HEADER ISEMI,2+IMEDD+COMPO,^/"I;"/
      00986A 98 4B                    1         .word LINK 
                           0017EC     2         LINK=.
      00986C C2                       3         .byte 2+IMEDD+COMPO  
      00986D 49 3B                    4         .ascii "I;"
      00986F                          5         ISEMI:
      00986F 1D 00 02         [ 2] 3936         subw x,#CELLL  
      009872 90 AE 00 80      [ 2] 3937         ldw y,#IRET_CODE 
      009876 FF               [ 2] 3938         ldw (x),y 
      009877 CD 95 C5         [ 4] 3939         call CCOMMA
      00987A CD 94 DC         [ 4] 3940         call LBRAC 
      00987D CD A3 DA         [ 4] 3941         call IFMOVE
      009880 CD 88 4C         [ 4] 3942         call QDUP 
      009883 CD 85 18         [ 4] 3943         CALL QBRAN 
      009886 99 DA                 3944         .word SET_RAMLAST
      009888 CD 87 FE         [ 4] 3945         CALL CPP
      00988B CD 85 63         [ 4] 3946         call AT 
      00988E CD 86 A9         [ 4] 3947         call SWAPP 
      009891 CD 87 FE         [ 4] 3948         CALL CPP 
      009894 CD 85 51         [ 4] 3949         call STORE 
      009897 CD 9D 92         [ 4] 3950         call UPDATCP 
      00989A CD 9D 4F         [ 4] 3951         call EEPVP 
      00181D                       3952         _DROP 
      00989D 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      0098A0 CD 85 63         [ 4] 3953         call AT 
      0098A3 CD 87 F0         [ 4] 3954         call VPP 
      0098A6 CD 85 51         [ 4] 3955         call STORE 
      0098A9 CC 8C 83         [ 2] 3956         jp ZERO
      0098AC 81               [ 4] 3957         ret           
                                   3958         
                                   3959 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3960 ;       ]       ( -- )
                                   3961 ;       Start compiling words in
                                   3962 ;       input stream.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



                                   3963 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00182D                       3964         _HEADER RBRAC,1,"]"
      0098AD 98 6C                    1         .word LINK 
                           00182F     2         LINK=.
      0098AF 01                       3         .byte 1  
      0098B0 5D                       4         .ascii "]"
      0098B1                          5         RBRAC:
      0098B1 CD 84 EF         [ 4] 3965         CALL   DOLIT
      0098B4 97 F9                 3966         .word  SCOMP
      0098B6 CD 87 C0         [ 4] 3967         CALL   TEVAL
      0098B9 CC 85 51         [ 2] 3968         JP     STORE
                                   3969 
                                   3970 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3971 ;       CALL,    ( ca -- )
                                   3972 ;       Compile a subroutine call.
                                   3973 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00183C                       3974         _HEADER JSRC,5,^/"CALL,"/
      0098BC 98 AF                    1         .word LINK 
                           00183E     2         LINK=.
      0098BE 05                       3         .byte 5  
      0098BF 43 41 4C 4C 2C           4         .ascii "CALL,"
      0098C4                          5         JSRC:
                           000001  3975 .if OPTIMIZE 
                                   3976 ;;;;; optimization code ;;;;;;;;;;;;;;;
      0098C4 90 AE 86 8F      [ 2] 3977         LDW Y,#DROP 
      0098C8 90 BF 26         [ 2] 3978         LDW YTEMP,Y 
      0098CB 90 93            [ 1] 3979         LDW Y,X 
      0098CD 90 FE            [ 2] 3980         LDW Y,(Y)
      0098CF 90 B3 26         [ 2] 3981         CPW Y,YTEMP 
      0098D2 26 13            [ 1] 3982         JRNE JSRC1         
                                   3983 ; replace CALL DROP BY  ADDW X,#CELLL 
      0098D4 1C 00 02         [ 2] 3984         ADDW X,#CELLL 
      001857                       3985         _DOLIT ADDWX ; opcode 
      0098D7 CD 84 EF         [ 4]    1     CALL DOLIT 
      0098DA 00 1C                    2     .word ADDWX 
      0098DC CD 95 C5         [ 4] 3986         CALL   CCOMMA 
      00185F                       3987         _DOLIT CELLL 
      0098DF CD 84 EF         [ 4]    1     CALL DOLIT 
      0098E2 00 02                    2     .word CELLL 
      0098E4 CC 95 AE         [ 2] 3988         JP      COMMA 
      0098E7                       3989 JSRC1: ; check for DDROP 
      0098E7 90 AE 88 9C      [ 2] 3990         LDW Y,#DDROP 
      0098EB 90 BF 26         [ 2] 3991         LDW YTEMP,Y 
      0098EE 90 93            [ 1] 3992         LDW Y,X 
      0098F0 90 FE            [ 2] 3993         LDW Y,(Y)
      0098F2 90 B3 26         [ 2] 3994         CPW Y,YTEMP 
      0098F5 26 13            [ 1] 3995         JRNE JSRC2 
                                   3996 ; replace CALL DDROP BY ADDW X,#2*CELLL 
      0098F7 1C 00 02         [ 2] 3997         ADDW X,#CELLL 
      00187A                       3998         _DOLIT ADDWX 
      0098FA CD 84 EF         [ 4]    1     CALL DOLIT 
      0098FD 00 1C                    2     .word ADDWX 
      0098FF CD 95 C5         [ 4] 3999         CALL  CCOMMA 
      001882                       4000         _DOLIT 2*CELLL 
      009902 CD 84 EF         [ 4]    1     CALL DOLIT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



      009905 00 04                    2     .word 2*CELLL 
      009907 CC 95 AE         [ 2] 4001         JP  COMMA 
      00990A                       4002 JSRC2: 
                                   4003 ;;;;;;;; end optimization code ;;;;;;;;;;        
                                   4004 .endif        
      00990A CD 84 EF         [ 4] 4005         CALL     DOLIT
      00990D 00 CD                 4006         .word     CALLL     ;CALL
      00990F CD 95 C5         [ 4] 4007         CALL     CCOMMA
      009912 CC 95 AE         [ 2] 4008         JP     COMMA
                                   4009 
                                   4010 ;       INIT-OFS ( -- )
                                   4011 ;       compute offset to adjust jump address 
                                   4012 ;       set variable OFFSET 
      009915 98 BE                 4013         .word LINK 
                           001897  4014         LINK=.
      009917 08                    4015         .byte 8 
      009918 49 4E 49 54 2D 4F 46  4016         .ascii "INIT-OFS" 
             53
      009920                       4017 INITOFS:
      009920 CD 87 AF         [ 4] 4018         call TFLASH 
      009923 CD 85 63         [ 4] 4019         CALL AT 
      009926 CD 86 99         [ 4] 4020         CALL DUPP 
      009929 CD 85 18         [ 4] 4021         call QBRAN
      00992C 99 3D                 4022         .word 1$
      0018AE                       4023         _DROP  
      00992E 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      009931 CD 87 FE         [ 4] 4024         call CPP 
      009934 CD 85 63         [ 4] 4025         call AT 
      009937 CD 8D 5D         [ 4] 4026         call HERE
      00993A CD 89 52         [ 4] 4027         call SUBB 
      00993D CD 88 33         [ 4] 4028 1$:     call OFFSET 
      009940 CC 85 51         [ 2] 4029         jp STORE  
                                   4030 
                                   4031 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4032 ;       :       ( -- ; <string> )
                                   4033 ;       Start a new colon definition
                                   4034 ;       using next word as its name.
                                   4035 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0018C3                       4036         _HEADER COLON,1,":"
      009943 99 17                    1         .word LINK 
                           0018C5     2         LINK=.
      009945 01                       3         .byte 1  
      009946 3A                       4         .ascii ":"
      009947                          5         COLON:
      009947 CD 99 20         [ 4] 4037         call INITOFS       
      00994A CD 92 6A         [ 4] 4038         CALL   TOKEN
      00994D CD 97 AC         [ 4] 4039         CALL   SNAME
      009950 CC 98 B1         [ 2] 4040         JP     RBRAC
                                   4041 
                                   4042 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4043 ;       I:  ( -- )
                                   4044 ;       Start interrupt service 
                                   4045 ;       routine definition
                                   4046 ;       those definition have 
                                   4047 ;       no name.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



                                   4048 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0018D3                       4049         _HEADER ICOLON,2,"I:"
      009953 99 45                    1         .word LINK 
                           0018D5     2         LINK=.
      009955 02                       3         .byte 2  
      009956 49 3A                    4         .ascii "I:"
      009958                          5         ICOLON:
      009958 CD 99 20         [ 4] 4050         call INITOFS 
      00995B CC 98 B1         [ 2] 4051         jp RBRAC  
                                   4052 
                                   4053 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4054 ;       IMMEDIATE       ( -- )
                                   4055 ;       Make last compiled word
                                   4056 ;       an immediate word.
                                   4057 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0018DE                       4058         _HEADER IMMED,9,"IMMEDIATE"
      00995E 99 55                    1         .word LINK 
                           0018E0     2         LINK=.
      009960 09                       3         .byte 9  
      009961 49 4D 4D 45 44 49 41     4         .ascii "IMMEDIATE"
             54 45
      00996A                          5         IMMED:
      00996A CD 84 EF         [ 4] 4059         CALL     DOLIT
      00996D 80 00                 4060         .word     0x8000	;  IMEDD*256
      00996F CD 88 0E         [ 4] 4061         CALL     LAST
      009972 CD 85 63         [ 4] 4062         CALL     AT
      009975 CD 85 63         [ 4] 4063         CALL     AT
      009978 CD 87 0A         [ 4] 4064         CALL     ORR
      00997B CD 88 0E         [ 4] 4065         CALL     LAST
      00997E CD 85 63         [ 4] 4066         CALL     AT
      009981 CC 85 51         [ 2] 4067         JP     STORE
                                   4068 
                                   4069 ;; Defining words
                                   4070 
                                   4071 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4072 ;       CREATE  ( -- ; <string> )
                                   4073 ;       Compile a new array
                                   4074 ;       without allocating space.
                                   4075 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001904                       4076         _HEADER CREAT,6,"CREATE"
      009984 99 60                    1         .word LINK 
                           001906     2         LINK=.
      009986 06                       3         .byte 6  
      009987 43 52 45 41 54 45        4         .ascii "CREATE"
      00998D                          5         CREAT:
      00998D CD 92 6A         [ 4] 4077         CALL     TOKEN
      009990 CD 97 AC         [ 4] 4078         CALL     SNAME
      009993 CD 98 3D         [ 4] 4079         CALL     OVERT        
      009996 CD 95 F3         [ 4] 4080         CALL     COMPI 
      009999 87 4F                 4081         .word DOVAR 
      00999B 81               [ 4] 4082         RET
                                   4083 
                                   4084 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4085 ;       VARIABLE  ( -- ; <string> )
                                   4086 ;       Compile a new variable
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



                                   4087 ;       initialized to 0.
                                   4088 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00191C                       4089         _HEADER VARIA,8,"VARIABLE"
      00999C 99 86                    1         .word LINK 
                           00191E     2         LINK=.
      00999E 08                       3         .byte 8  
      00999F 56 41 52 49 41 42 4C     4         .ascii "VARIABLE"
             45
      0099A7                          5         VARIA:
                                   4090 ; indirect variable so that VARIABLE definition can be compiled in FLASH 
      0099A7 CD 8D 5D         [ 4] 4091         CALL HERE
      0099AA CD 86 99         [ 4] 4092         CALL DUPP 
      0099AD CD 8B EC         [ 4] 4093         CALL CELLP
      0099B0 CD 87 F0         [ 4] 4094         CALL VPP 
      0099B3 CD 85 51         [ 4] 4095         CALL STORE
      0099B6 CD 99 8D         [ 4] 4096         CALL CREAT
      0099B9 CD 86 99         [ 4] 4097         CALL DUPP
      0099BC CD 95 AE         [ 4] 4098         CALL COMMA
      0099BF CD 8C 83         [ 4] 4099         CALL ZERO
      0099C2 CD 86 A9         [ 4] 4100         call SWAPP 
      0099C5 CD 85 51         [ 4] 4101         CALL STORE
      0099C8 CD A3 01         [ 4] 4102         CALL FMOVE ; move definition to FLASH
      0099CB CD 88 4C         [ 4] 4103         CALL QDUP 
      0099CE CD 85 18         [ 4] 4104         CALL QBRAN 
      0099D1 99 DA                 4105         .word SET_RAMLAST   
      0099D3 CD 9D A9         [ 4] 4106         call UPDATVP  ; don't update if variable kept in RAM.
      0099D6 CD A3 95         [ 4] 4107         CALL UPDATPTR
      0099D9 81               [ 4] 4108         RET         
      0099DA                       4109 SET_RAMLAST: 
      0099DA CD 88 0E         [ 4] 4110         CALL LAST 
      0099DD CD 85 63         [ 4] 4111         CALL AT 
      0099E0 CD 88 21         [ 4] 4112         CALL RAMLAST 
      0099E3 CC 85 51         [ 2] 4113         JP STORE  
                                   4114 
                                   4115 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4116 ;       CONSTANT  ( n -- ; <string> )
                                   4117 ;       Compile a new constant 
                                   4118 ;       n CONSTANT name 
                                   4119 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001966                       4120         _HEADER CONSTANT,8,"CONSTANT"
      0099E6 99 9E                    1         .word LINK 
                           001968     2         LINK=.
      0099E8 08                       3         .byte 8  
      0099E9 43 4F 4E 53 54 41 4E     4         .ascii "CONSTANT"
             54
      0099F1                          5         CONSTANT:
      0099F1 CD 92 6A         [ 4] 4121         CALL TOKEN
      0099F4 CD 97 AC         [ 4] 4122         CALL SNAME 
      0099F7 CD 98 3D         [ 4] 4123         CALL OVERT 
      0099FA CD 95 F3         [ 4] 4124         CALL COMPI 
      0099FD 9A 11                 4125         .word DOCONST
      0099FF CD 95 AE         [ 4] 4126         CALL COMMA 
      009A02 CD A3 01         [ 4] 4127         CALL FMOVE
      009A05 CD 88 4C         [ 4] 4128         CALL QDUP 
      009A08 CD 85 18         [ 4] 4129         CALL QBRAN 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



      009A0B 99 DA                 4130         .word SET_RAMLAST  
      009A0D CD A3 95         [ 4] 4131         CALL UPDATPTR  
      009A10 81               [ 4] 4132 1$:     RET          
                                   4133 
                                   4134 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4135 ; CONSTANT runtime semantic 
                                   4136 ; doCONST  ( -- n )
                                   4137 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4138 ;       _HEADER DOCONST,7,"DOCONST"
      009A11                       4139 DOCONST:
      009A11 1D 00 02         [ 2] 4140         subw x,#CELLL
      009A14 90 85            [ 2] 4141         popw y 
      009A16 90 FE            [ 2] 4142         ldw y,(y) 
      009A18 FF               [ 2] 4143         ldw (x),y 
      009A19 81               [ 4] 4144         ret 
                                   4145 
                                   4146 ;----------------------------------
                                   4147 ; create double constant 
                                   4148 ; 2CONSTANT ( d -- ; <string> )
                                   4149 ;----------------------------------
      00199A                       4150         _HEADER DCONST,9,"2CONSTANT"
      009A1A 99 E8                    1         .word LINK 
                           00199C     2         LINK=.
      009A1C 09                       3         .byte 9  
      009A1D 32 43 4F 4E 53 54 41     4         .ascii "2CONSTANT"
             4E 54
      009A26                          5         DCONST:
      009A26 CD 92 6A         [ 4] 4151         CALL TOKEN
      009A29 CD 97 AC         [ 4] 4152         CALL SNAME 
      009A2C CD 98 3D         [ 4] 4153         CALL OVERT 
      009A2F CD 95 F3         [ 4] 4154         CALL COMPI 
      009A32 9A 49                 4155         .word DO_DCONST
      009A34 CD 95 AE         [ 4] 4156         CALL COMMA
      009A37 CD 95 AE         [ 4] 4157         CALL COMMA  
      009A3A CD A3 01         [ 4] 4158         CALL FMOVE
      009A3D CD 88 4C         [ 4] 4159         CALL QDUP 
      009A40 CD 85 18         [ 4] 4160         CALL QBRAN 
      009A43 99 DA                 4161         .word SET_RAMLAST  
      009A45 CD A3 95         [ 4] 4162         CALL UPDATPTR  
      009A48 81               [ 4] 4163 1$:     RET          
                                   4164     
                                   4165 ;----------------------------------
                                   4166 ; runtime for DCONST 
                                   4167 ; stack double constant 
                                   4168 ; DO-DCONST ( -- d )
                                   4169 ;-----------------------------------
                                   4170 ;       _HEADER DO_DCONST,9,"DO-DCONST"
      009A49                       4171 DO_DCONST:
      009A49 90 85            [ 2] 4172     popw y 
      009A4B 90 BF 26         [ 2] 4173     ldw YTEMP,y 
      009A4E 1D 00 04         [ 2] 4174     subw x,#2*CELLL 
      009A51 90 FE            [ 2] 4175     ldw y,(y)
      009A53 FF               [ 2] 4176     ldw (x),y 
      009A54 90 BE 26         [ 2] 4177     ldw y,YTEMP 
      009A57 90 EE 02         [ 2] 4178     ldw y,(2,y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



      009A5A EF 02            [ 2] 4179     ldw (2,x),y 
      009A5C 81               [ 4] 4180     ret 
                                   4181 
                                   4182 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4183 ;;          TOOLS 
                                   4184 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4185 
                                   4186 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4187 ;       _TYPE   ( b u -- )
                                   4188 ;       Display a string. Filter
                                   4189 ;       non-printing characters.
                                   4190 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0019DD                       4191         _HEADER UTYPE,5,"_TYPE"
      009A5D 9A 1C                    1         .word LINK 
                           0019DF     2         LINK=.
      009A5F 05                       3         .byte 5  
      009A60 5F 54 59 50 45           4         .ascii "_TYPE"
      009A65                          5         UTYPE:
      009A65 CD 86 62         [ 4] 4192         CALL     TOR     ;start count down loop
      009A68 20 0F            [ 2] 4193         JRA     UTYP2   ;skip first pass
      009A6A CD 86 99         [ 4] 4194 UTYP1:  CALL     DUPP
      009A6D CD 85 81         [ 4] 4195         CALL     CAT
      009A70 CD 8C AD         [ 4] 4196         CALL     TCHAR
      009A73 CD 84 B6         [ 4] 4197         CALL     EMIT    ;display only printable
      009A76 CD 8C 17         [ 4] 4198         CALL     ONEP    ;increment address
      009A79 CD 85 03         [ 4] 4199 UTYP2:  CALL     DONXT
      009A7C 9A 6A                 4200         .word      UTYP1   ;loop till done
      009A7E CC 86 8F         [ 2] 4201         JP     DROP
                                   4202 
                                   4203 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4204 ;       dm+     ( a u -- a )
                                   4205 ;       Dump u bytes from ,
                                   4206 ;       leaving a+u on  stack.
                                   4207 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001A01                       4208         _HEADER DUMPP,3,"DM+"
      009A81 9A 5F                    1         .word LINK 
                           001A03     2         LINK=.
      009A83 03                       3         .byte 3  
      009A84 44 4D 2B                 4         .ascii "DM+"
      009A87                          5         DUMPP:
      009A87 CD 86 C1         [ 4] 4209         CALL     OVER
      009A8A CD 84 EF         [ 4] 4210         CALL     DOLIT
      009A8D 00 04                 4211         .word      4
      009A8F CD 90 5F         [ 4] 4212         CALL     UDOTR   ;display address
      009A92 CD 8F C7         [ 4] 4213         CALL     SPACE
      009A95 CD 86 62         [ 4] 4214         CALL     TOR     ;start count down loop
      009A98 20 11            [ 2] 4215         JRA     PDUM2   ;skip first pass
      009A9A CD 86 99         [ 4] 4216 PDUM1:  CALL     DUPP
      009A9D CD 85 81         [ 4] 4217         CALL     CAT
      009AA0 CD 84 EF         [ 4] 4218         CALL     DOLIT
      009AA3 00 03                 4219         .word      3
      009AA5 CD 90 5F         [ 4] 4220         CALL     UDOTR   ;display numeric data
      009AA8 CD 8C 17         [ 4] 4221         CALL     ONEP    ;increment address
      009AAB CD 85 03         [ 4] 4222 PDUM2:  CALL     DONXT
      009AAE 9A 9A                 4223         .word      PDUM1   ;loop till done
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



      009AB0 81               [ 4] 4224         RET
                                   4225 
                                   4226 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4227 ;       DUMP    ( a u -- )
                                   4228 ;       Dump u bytes from a,
                                   4229 ;       in a formatted manner.
                                   4230 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001A31                       4231         _HEADER DUMP,4,"DUMP"
      009AB1 9A 83                    1         .word LINK 
                           001A33     2         LINK=.
      009AB3 04                       3         .byte 4  
      009AB4 44 55 4D 50              4         .ascii "DUMP"
      009AB8                          5         DUMP:
      009AB8 CD 87 5F         [ 4] 4232         CALL     BASE
      009ABB CD 85 63         [ 4] 4233         CALL     AT
      009ABE CD 86 62         [ 4] 4234         CALL     TOR
      009AC1 CD 8F 26         [ 4] 4235         CALL     HEX     ;save radix, set hex
      009AC4 CD 84 EF         [ 4] 4236         CALL     DOLIT
      009AC7 00 10                 4237         .word      16
      009AC9 CD 8B 3D         [ 4] 4238         CALL     SLASH   ;change count to lines
      009ACC CD 86 62         [ 4] 4239         CALL     TOR     ;start count down loop
      009ACF CD 90 09         [ 4] 4240 DUMP1:  CALL     CR
      009AD2 CD 84 EF         [ 4] 4241         CALL     DOLIT
      009AD5 00 10                 4242         .word      16
      009AD7 CD 88 A7         [ 4] 4243         CALL     DDUP
      009ADA CD 9A 87         [ 4] 4244         CALL     DUMPP   ;display numeric
      009ADD CD 88 5D         [ 4] 4245         CALL     ROT
      009AE0 CD 88 5D         [ 4] 4246         CALL     ROT
      009AE3 CD 8F C7         [ 4] 4247         CALL     SPACE
      009AE6 CD 8F C7         [ 4] 4248         CALL     SPACE
      009AE9 CD 9A 65         [ 4] 4249         CALL     UTYPE   ;display printable characters
      009AEC CD 85 03         [ 4] 4250         CALL     DONXT
      009AEF 9A CF                 4251         .word      DUMP1   ;loop till done
      009AF1 CD 86 8F         [ 4] 4252 DUMP3:  CALL     DROP
      009AF4 CD 85 B4         [ 4] 4253         CALL     RFROM
      009AF7 CD 87 5F         [ 4] 4254         CALL     BASE
      009AFA CC 85 51         [ 2] 4255         JP     STORE   ;restore radix
                                   4256 
                                   4257 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4258 ;       .S      ( ... -- ... )
                                   4259 ;        Display  contents of stack.
                                   4260 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001A7D                       4261         _HEADER DOTS,2,".S"
      009AFD 9A B3                    1         .word LINK 
                           001A7F     2         LINK=.
      009AFF 02                       3         .byte 2  
      009B00 2E 53                    4         .ascii ".S"
      009B02                          5         DOTS:
      009B02 CD 90 09         [ 4] 4262         CALL     CR
      009B05 CD 8C C5         [ 4] 4263         CALL     DEPTH   ;stack depth
      009B08 CD 86 62         [ 4] 4264         CALL     TOR     ;start count down loop
      009B0B 20 09            [ 2] 4265         JRA     DOTS2   ;skip first pass
      009B0D CD 85 C5         [ 4] 4266 DOTS1:  CALL     RAT
      009B10 CD 8C DC         [ 4] 4267 	CALL     PICK
      009B13 CD 90 AF         [ 4] 4268         CALL     DOT     ;index stack, display contents
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



      009B16 CD 85 03         [ 4] 4269 DOTS2:  CALL     DONXT
      009B19 9B 0D                 4270         .word      DOTS1   ;loop till done
      009B1B CD 90 36         [ 4] 4271         CALL     DOTQP
      009B1E 05                    4272         .byte      5
      009B1F 20 3C 73 70 20        4273         .ascii     " <sp "
      009B24 81               [ 4] 4274         RET
                                   4275 
                                   4276 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4277 ;       >NAME   ( ca -- na | F )
                                   4278 ;       Convert code address
                                   4279 ;       to a name address.
                                   4280 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001AA5                       4281         _HEADER TNAME,5,">NAME"
      009B25 9A FF                    1         .word LINK 
                           001AA7     2         LINK=.
      009B27 05                       3         .byte 5  
      009B28 3E 4E 41 4D 45           4         .ascii ">NAME"
      009B2D                          5         TNAME:
      009B2D CD 87 E2         [ 4] 4282         CALL     CNTXT   ;vocabulary link
      009B30 CD 85 63         [ 4] 4283 TNAM2:  CALL     AT
      009B33 CD 86 99         [ 4] 4284         CALL     DUPP    ;?last word in a vocabulary
      009B36 CD 85 18         [ 4] 4285         CALL     QBRAN
      009B39 9B 54                 4286         .word      TNAM4
      009B3B CD 88 A7         [ 4] 4287         CALL     DDUP
      009B3E CD 92 78         [ 4] 4288         CALL     NAMET
      009B41 CD 87 1F         [ 4] 4289         CALL     XORR    ;compare
      009B44 CD 85 18         [ 4] 4290         CALL     QBRAN
      009B47 9B 4E                 4291         .word      TNAM3
      009B49 CD 8B FB         [ 4] 4292         CALL     CELLM   ;continue with next word
      009B4C 20 E2            [ 2] 4293         JRA     TNAM2
      009B4E CD 86 A9         [ 4] 4294 TNAM3:  CALL     SWAPP
      009B51 CC 86 8F         [ 2] 4295         JP     DROP
      009B54 CD 88 9C         [ 4] 4296 TNAM4:  CALL     DDROP
      009B57 CC 8C 83         [ 2] 4297         JP     ZERO
                                   4298 
                                   4299 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4300 ;       .ID     ( na -- )
                                   4301 ;        Display  name at address.
                                   4302 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001ADA                       4303         _HEADER DOTID,3,".ID"
      009B5A 9B 27                    1         .word LINK 
                           001ADC     2         LINK=.
      009B5C 03                       3         .byte 3  
      009B5D 2E 49 44                 4         .ascii ".ID"
      009B60                          5         DOTID:
      009B60 CD 88 4C         [ 4] 4304         CALL     QDUP    ;if zero no name
      009B63 CD 85 18         [ 4] 4305         CALL     QBRAN
      009B66 9B 76                 4306         .word      DOTI1
      009B68 CD 8D 46         [ 4] 4307         CALL     COUNT
      009B6B CD 84 EF         [ 4] 4308         CALL     DOLIT
      009B6E 00 1F                 4309         .word      0x1F
      009B70 CD 86 F6         [ 4] 4310         CALL     ANDD    ;mask lexicon bits
      009B73 CC 9A 65         [ 2] 4311         JP     UTYPE
      009B76 CD 90 36         [ 4] 4312 DOTI1:  CALL     DOTQP
      009B79 09                    4313         .byte      9
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



      009B7A 20 6E 6F 4E 61 6D 65  4314         .ascii     " noName"
      009B81 81               [ 4] 4315         RET
                                   4316 
                           000000  4317 WANT_SEE=0
                           000000  4318 .if WANT_SEE 
                                   4319 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4320 ;       SEE     ( -- ; <string> )
                                   4321 ;       A simple decompiler.
                                   4322 ;       Updated for byte machines.
                                   4323 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4324         _HEADER SEE,3,"SEE"
                                   4325         CALL     TICK    ;starting address
                                   4326         CALL     CR
                                   4327         CALL     ONEM
                                   4328 SEE1:   CALL     ONEP
                                   4329         CALL     DUPP
                                   4330         CALL     AT
                                   4331         CALL     DUPP
                                   4332         CALL     QBRAN
                                   4333         .word    SEE2
                                   4334         CALL     TNAME   ;?is it a name
                                   4335 SEE2:   CALL     QDUP    ;name address or zero
                                   4336         CALL     QBRAN
                                   4337         .word    SEE3
                                   4338         CALL     SPACE
                                   4339         CALL     DOTID   ;display name
                                   4340         CALL     ONEP
                                   4341         JRA      SEE4
                                   4342 SEE3:   CALL     DUPP
                                   4343         CALL     CAT
                                   4344         CALL     UDOT    ;display number
                                   4345 SEE4:   CALL     NUFQ    ;user control
                                   4346         CALL     QBRAN
                                   4347         .word    SEE1
                                   4348         JP     DROP
                                   4349 .endif ; WANT_SEE 
                                   4350 
                                   4351 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4352 ;       WORDS   ( -- )
                                   4353 ;       Display names in vocabulary.
                                   4354 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001B02                       4355         _HEADER WORDS,5,"WORDS"
      009B82 9B 5C                    1         .word LINK 
                           001B04     2         LINK=.
      009B84 05                       3         .byte 5  
      009B85 57 4F 52 44 53           4         .ascii "WORDS"
      009B8A                          5         WORDS:
      009B8A CD 90 09         [ 4] 4356         CALL     CR
      009B8D CD 87 E2         [ 4] 4357         CALL     CNTXT   ;only in context
      009B90 CD 85 63         [ 4] 4358 WORS1:  CALL     AT
      009B93 CD 88 4C         [ 4] 4359         CALL     QDUP    ;?at end of list
      009B96 CD 85 18         [ 4] 4360         CALL     QBRAN
      009B99 9B AC                 4361         .word      WORS2
      009B9B CD 86 99         [ 4] 4362         CALL     DUPP
      009B9E CD 8F C7         [ 4] 4363         CALL     SPACE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



      009BA1 CD 9B 60         [ 4] 4364         CALL     DOTID   ;display a name
      009BA4 CD 8B FB         [ 4] 4365         CALL     CELLM
      009BA7 CD 85 34         [ 4] 4366         CALL     BRAN
      009BAA 9B 90                 4367         .word      WORS1
      009BAC 81               [ 4] 4368 WORS2:  RET
                                   4369 
                                   4370         
                                   4371 ;; Hardware reset
                                   4372 
                                   4373 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4374 ;  COPYRIGTH
                                   4375 ; print copyright notice 
                                   4376 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      009BAD                       4377 COPYRIGHT:
      009BAD CD 90 36         [ 4] 4378     CALL DOTQP 
      009BB0 21                    4379     .byte 33 
      009BB1 4A 61 63 71 75 65 73  4380     .ascii "Jacques Deschenes, Copyright 2021"
             20 44 65 73 63 68 65
             6E 65 73 2C 20 43 6F
             70 79 72 69 67 68 74
             20 32 30 32 31
      009BD2 CC 90 09         [ 2] 4381     JP CR 
                                   4382 
                                   4383 
                                   4384 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4385 ;  PRT_LICENCE 
                                   4386 ;  print GPLV2 licence 
                                   4387 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      009BD5                       4388 PRT_LICENCE:
      009BD5 CD 90 36         [ 4] 4389         CALL DOTQP 
      009BD8 0F                    4390         .byte  15 
      009BD9 4C 49 43 45 4E 43 45  4391         .ascii "LICENCE GPLV3\r\n"
             20 47 50 4C 56 33 0D
             0A
      009BE8 81               [ 4] 4392         RET 
                                   4393 
                                   4394 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4395 ;    PRINT_VERSION ( c1 c2 -- )
                                   4396 ;    c2 minor 
                                   4397 ;    c1 major 
                                   4398 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      009BE9                       4399 PRINT_VERSION:
      009BE9 CD 90 36         [ 4] 4400      CALL DOTQP 
      009BEC 09                    4401      .byte 9
      009BED 20 76 65 72 73 69 6F  4402      .ascii " version "
             6E 20
      009BF6 CD 8E 8B         [ 4] 4403      CALL BDIGS 
      009BF9 CD 8E C5         [ 4] 4404      CALL DIGS 
      009BFC CD 8E C5         [ 4] 4405      CALL DIGS 
      001B7F                       4406      _DOLIT '.' 
      009BFF CD 84 EF         [ 4]    1     CALL DOLIT 
      009C02 00 2E                    2     .word '.' 
      009C04 CD 8E 9B         [ 4] 4407      CALL HOLD 
      001B87                       4408      _DROP 
      009C07 1C 00 02         [ 2]    1     ADDW X,#CELLL  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



      009C0A CD 8E C5         [ 4] 4409      CALL DIGS 
      009C0D CD 8E F0         [ 4] 4410      CALL EDIGS 
      009C10 CC 8F F1         [ 2] 4411      JP TYPES 
                                   4412       
                                   4413 
                                   4414 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4415 ;       hi      ( -- )
                                   4416 ;       Display sign-on message.
                                   4417 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001B93                       4418         _HEADER HI,2,"HI"
      009C13 9B 84                    1         .word LINK 
                           001B95     2         LINK=.
      009C15 02                       3         .byte 2  
      009C16 48 49                    4         .ascii "HI"
      009C18                          5         HI:
      009C18 CD 90 09         [ 4] 4419         CALL     CR
      009C1B CD 90 36         [ 4] 4420         CALL     DOTQP   
      009C1E 0A                    4421         .byte      10
      009C1F 73 74 6D 38 65 46 6F  4422         .ascii     "stm8eForth"
             72 74 68
      001BA9                       4423 	_DOLIT VER 
      009C29 CD 84 EF         [ 4]    1     CALL DOLIT 
      009C2C 00 04                    2     .word VER 
      001BAE                       4424         _DOLIT EXT 
      009C2E CD 84 EF         [ 4]    1     CALL DOLIT 
      009C31 00 00                    2     .word EXT 
      009C33 CD 9B E9         [ 4] 4425         CALL PRINT_VERSION 
      009C36 CD 90 36         [ 4] 4426         CALL    DOTQP
                           000001  4427 .if NUCLEO          
      009C39 12                    4428         .byte 18
      009C3A 20 6F 6E 20 4E 55 43  4429         .ascii  " on NUCLEO-8S208RB"
             4C 45 4F 2D 38 53 32
             30 38 52 42
                                   4430 .endif
                           000000  4431 .if DISCOVERY
                                   4432         .byte 19
                                   4433         .ascii  " on STM8S-DISCOVERY"
                                   4434 .endif
                           000000  4435 .if DOORBELL
                                   4436         .byte 16
                                   4437         .ascii " on stm8s105k6b6"
                                   4438 .endif
      009C4C CC 90 09         [ 2] 4439         JP     CR
                                   4440 
                           000000  4441 WANT_DEBUG=0
                           000000  4442 .if WANT_DEBUG 
                                   4443 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4444 ;       DEBUG      ( -- )
                                   4445 ;       Display sign-on message.
                                   4446 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4447         _HEADER DEBUG,5,"DEBUG"
                                   4448 	CALL DOLIT
                                   4449 	.word 0x65
                                   4450 	CALL EMIT
                                   4451 	CALL ZERO
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



                                   4452  	CALL ZLESS 
                                   4453 	CALL DOLIT
                                   4454 	.word 0xFFFE
                                   4455 	CALL ZLESS 
                                   4456 	CALL UPLUS 
                                   4457  	_DROP 
                                   4458 	CALL DOLIT
                                   4459 	.word 3
                                   4460 	CALL UPLUS 
                                   4461 	CALL UPLUS 
                                   4462  	_DROP
                                   4463 	CALL DOLIT
                                   4464 	.word 0x43
                                   4465 	CALL UPLUS 
                                   4466  	_DROP
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
                                   4492 	.word 0x70
                                   4493 	CALL UPLUS 
                                   4494 	_DROP
                                   4495 	CALL EMIT
                                   4496 	CALL ZERO
                                   4497 	CALL QBRAN
                                   4498 	.word DEBUG1
                                   4499 	CALL DOLIT
                                   4500 	.word 0x3F
                                   4501 DEBUG1:
                                   4502 	CALL DOLIT
                                   4503 	.word 0xFFFF
                                   4504 	CALL QBRAN
                                   4505 	.word DEBUG2
                                   4506 	CALL DOLIT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



                                   4507 	.word 0x74
                                   4508 	CALL BRAN
                                   4509 	.word DEBUG3
                                   4510 DEBUG2:
                                   4511 	CALL DOLIT
                                   4512 	.word 0x21
                                   4513 DEBUG3:
                                   4514 	CALL EMIT
                                   4515 	CALL DOLIT
                                   4516 	.word 0x68
                                   4517 	CALL DOLIT
                                   4518 	.word 0x80
                                   4519 	CALL STORE
                                   4520 	CALL DOLIT
                                   4521 	.word 0x80
                                   4522 	CALL AT
                                   4523 	CALL EMIT
                                   4524 	CALL DOLIT
                                   4525 	.word 0x4D
                                   4526 	CALL TOR
                                   4527 	CALL RAT
                                   4528 	CALL RFROM
                                   4529 	CALL ANDD
                                   4530 	CALL EMIT
                                   4531 	CALL DOLIT
                                   4532 	.word 0x61
                                   4533 	CALL DOLIT
                                   4534 	.word 0xA
                                   4535 	CALL TOR
                                   4536 DEBUG4:
                                   4537 	CALL ONE
                                   4538 	CALL UPLUS 
                                   4539 	_DROP
                                   4540 	CALL DONXT
                                   4541 	.word DEBUG4
                                   4542 	CALL EMIT
                                   4543 	CALL DOLIT
                                   4544 	.word 0x656D
                                   4545 	CALL DOLIT
                                   4546 	.word 0x100
                                   4547 	CALL UMSTA
                                   4548 	CALL SWAPP
                                   4549 	CALL DOLIT
                                   4550 	.word 0x100
                                   4551 	CALL UMSTA
                                   4552 	CALL SWAPP 
                                   4553 	_DROP
                                   4554 	CALL EMIT
                                   4555 	CALL EMIT
                                   4556 	CALL DOLIT
                                   4557 	.word 0x2043
                                   4558 	CALL ZERO
                                   4559 	CALL DOLIT
                                   4560 	.word 0x100
                                   4561 	CALL UMMOD
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



                                   4562 	CALL EMIT
                                   4563 	CALL EMIT
                                   4564 	;JP ORIG
                                   4565 	RET
                                   4566 .endif ; WANT_DEBUG 
                                   4567 
                                   4568 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4569 ;       'BOOT   ( -- a )
                                   4570 ;       The application startup vector.
                                   4571 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001BCF                       4572         _HEADER TBOOT,5,"'BOOT"
      009C4F 9C 15                    1         .word LINK 
                           001BD1     2         LINK=.
      009C51 05                       3         .byte 5  
      009C52 27 42 4F 4F 54           4         .ascii "'BOOT"
      009C57                          5         TBOOT:
      009C57 CD 87 4F         [ 4] 4573         CALL     DOVAR
      009C5A 40 02                 4574         .word    APP_RUN      ;application to boot
                                   4575 
                                   4576 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4577 ;       COLD    ( -- )
                                   4578 ;       The hilevel cold start s=ence.
                                   4579 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001BDC                       4580         _HEADER COLD,4,"COLD"
      009C5C 9C 51                    1         .word LINK 
                           001BDE     2         LINK=.
      009C5E 04                       3         .byte 4  
      009C5F 43 4F 4C 44              4         .ascii "COLD"
      009C63                          5         COLD:
                           000000  4581 .if WANT_DEBUG
                                   4582         CALL DEBUG
                                   4583 .endif ; WANT_DEBUG
      009C63 CD 84 EF         [ 4] 4584 COLD1:  CALL     DOLIT
      009C66 80 AB                 4585         .word      UZERO
      009C68 CD 84 EF         [ 4] 4586 	CALL     DOLIT
      009C6B 00 06                 4587         .word      UPP
      009C6D CD 84 EF         [ 4] 4588         CALL     DOLIT
      009C70 00 1C                 4589 	.word      UEND-UZERO
      009C72 CD 8D AA         [ 4] 4590         CALL     CMOVE   ;initialize user area
                           000001  4591 .if WANT_FLOAT 
      009C75 CD AD 25         [ 4] 4592         CALL    FINIT 
                                   4593 .endif 
                                   4594 ; if APP_RUN==0 initialize with ca de 'hi'  
      009C78 90 CE 40 02      [ 2] 4595         ldw y,APP_RUN 
      009C7C 26 0B            [ 1] 4596         jrne 0$
      009C7E 1D 00 02         [ 2] 4597         subw x,#CELLL 
      009C81 90 AE 9C 18      [ 2] 4598         ldw y,#HI  
      009C85 FF               [ 2] 4599         ldw (x),y
      009C86 CD 9D 81         [ 4] 4600         call UPDATRUN 
      009C89                       4601 0$:        
                                   4602 ; update LAST with APP_LAST 
                                   4603 ; if APP_LAST > LAST else do the opposite
      009C89 90 CE 40 00      [ 2] 4604         ldw y,APP_LAST 
      009C8D 90 B3 1C         [ 2] 4605         cpw y,ULAST 
      009C90 22 05            [ 1] 4606         jrugt 1$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



                                   4607 ; save LAST at APP_LAST  
      009C92 CD 9D 69         [ 4] 4608         call UPDATLAST 
      009C95 20 06            [ 2] 4609         jra 2$
      009C97                       4610 1$: ; update LAST with APP_LAST 
      009C97 90 BF 1C         [ 2] 4611         ldw ULAST,y
      009C9A 90 BF 16         [ 2] 4612         ldw UCNTXT,y
      009C9D                       4613 2$:  
                                   4614 ; update APP_CP if < app_space 
      009C9D 90 CE 40 04      [ 2] 4615         ldw y,APP_CP  
      009CA1 90 B3 1A         [ 2] 4616         cpw y,UCP   
      009CA4 24 06            [ 1] 4617         jruge 3$ 
      009CA6 CD 9D 92         [ 4] 4618         call UPDATCP
      009CA9 90 BE 1A         [ 2] 4619         ldw y,UCP   
      009CAC                       4620 3$:
      009CAC 90 BF 1A         [ 2] 4621         ldw UCP,y                 
                                   4622 ; update UVP with APP_VP  
                                   4623 ; if APP_VP>UVP else do the opposite 
      009CAF 90 CE 40 06      [ 2] 4624         ldw y,APP_VP 
      009CB3 90 B3 18         [ 2] 4625         cpw y,UVP 
      009CB6 22 05            [ 1] 4626         jrugt 4$
      009CB8 CD 9D A9         [ 4] 4627         call UPDATVP 
      009CBB 20 03            [ 2] 4628         jra 6$
      009CBD                       4629 4$: ; update UVP with APP_VP 
      009CBD 90 BF 18         [ 2] 4630         ldw UVP,y 
      009CC0                       4631 6$:      
      009CC0 CD 95 58         [ 4] 4632         CALL     PRESE   ;initialize data stack and TIB
      009CC3 CD 9C 57         [ 4] 4633         CALL     TBOOT
      009CC6 CD 8D 93         [ 4] 4634         CALL     ATEXE   ;application boot
      009CC9 CD 98 3D         [ 4] 4635         CALL     OVERT
      009CCC CC 95 75         [ 2] 4636         JP     QUIT    ;start interpretation
                                   4637 
                                   4638 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]



                                   4639         .include "flash.asm"
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
      009CCF 9C 5E                   31     .word LINK 
                           001C51    32     LINK=.
      009CD1 03                      33     .byte 3 
      009CD2 46 50 21                34     .ascii "FP!"
      009CD5                         35 FPSTOR:
      009CD5 90 93            [ 1]   36     ldw y,x
      009CD7 90 FE            [ 2]   37     ldw y,(y)
      009CD9 90 9F            [ 1]   38     ld a,yl 
      009CDB B7 34            [ 1]   39     ld FPTR,a 
      009CDD 1C 00 02         [ 2]   40     addw x,#CELLL 
      009CE0 90 93            [ 1]   41     ldw y,x 
      009CE2 90 FE            [ 2]   42     ldw y,(y)
      009CE4 90 BF 35         [ 2]   43     ldw PTR16,y
      009CE7 1C 00 02         [ 2]   44     addw x,#CELLL 
      009CEA 81               [ 4]   45     ret 
                                     46 
                                     47 ;-----------------------------------
                                     48 ; return EEPROM base address 
                                     49 ; as a double 
                                     50 ;  EEPROM  ( -- ud )
                                     51 ;-----------------------------------
      009CEB 9C D1                   52     .word LINK 
                           001C6D    53 LINK=.
      009CED 06                      54     .byte 6 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]



      009CEE 45 45 50 52 4F 4D       55     .ascii "EEPROM"
      009CF4                         56 EEPROM: 
      009CF4 90 AE 40 00      [ 2]   57     ldw y,#EEPROM_BASE
      009CF8 1D 00 04         [ 2]   58     subw x,#2*CELLL 
      009CFB EF 02            [ 2]   59     ldw (2,x),y 
      009CFD 90 5F            [ 1]   60     clrw y 
      009CFF FF               [ 2]   61     ldw (x),y 
      009D00 81               [ 4]   62     ret
                                     63 
                                     64 ;---------------------------------
                                     65 ; return APP_LAST pointer as double
                                     66 ; EEP-LAST ( -- ud )
                                     67 ;---------------------------------
      009D01 9C ED                   68 	.word LINK 
                           001C83    69 	LINK=.
      009D03 08                      70 	.byte 8 
      009D04 45 45 50 2D 4C 41 53    71 	.ascii "EEP-LAST"
             54
      009D0C                         72 EEPLAST:
      009D0C 1D 00 04         [ 2]   73 	subw x,#2*CELLL 
      009D0F 90 AE 40 00      [ 2]   74 	ldw y,#APP_LAST 
      009D13 EF 02            [ 2]   75 	ldw (2,x),y 
      009D15 90 5F            [ 1]   76 	clrw y 
      009D17 FF               [ 2]   77 	ldw (x),y 
      009D18 81               [ 4]   78 	ret 
                                     79 
                                     80 ;----------------------------------
                                     81 ; return APP_RUN pointer as double	
                                     82 ; EEP-RUN ( -- ud )
                                     83 ;-----------------------------------
      009D19 9D 03                   84 	.word LINK 
                           001C9B    85 	LINK=.
      009D1B 07                      86 	.byte 7
      009D1C 45 45 50 2D 52 55 4E    87 	.ascii "EEP-RUN"
      009D23                         88 EEPRUN:
      009D23 1D 00 04         [ 2]   89 	subw x,#2*CELLL 
      009D26 90 AE 40 02      [ 2]   90 	ldw y,#APP_RUN 
      009D2A EF 02            [ 2]   91 	ldw (2,x),y 
      009D2C 90 5F            [ 1]   92 	clrw y 
      009D2E FF               [ 2]   93 	ldw (x),y 
      009D2F 81               [ 4]   94 	ret 
                                     95 
                                     96 ;------------------------------------
                                     97 ; return APP_CP pointer as double 
                                     98 ; EEP-CP ( -- ud )
                                     99 ;------------------------------------
      009D30 9D 1B                  100 	.word LINK
                           001CB2   101 	LINK=.
      009D32 06                     102 	.byte 6 
      009D33 45 45 50 2D 43 50      103 	.ascii "EEP-CP"
      009D39                        104 EEPCP:
      009D39 1D 00 04         [ 2]  105 	subw x,#2*CELLL 
      009D3C 90 AE 40 04      [ 2]  106 	ldw y,#APP_CP  
      009D40 EF 02            [ 2]  107 	ldw (2,x),y 
      009D42 90 5F            [ 1]  108 	clrw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]



      009D44 FF               [ 2]  109 	ldw (x),y 
      009D45 81               [ 4]  110 	ret 
                                    111 
                                    112 ;------------------------------------
                                    113 ; return APP_VP pointer as double 
                                    114 ; EEP-VP ( -- ud )
                                    115 ;-------------------------------------
      009D46 9D 32                  116 	.word LINK
                           001CC8   117 	LINK=.
      009D48 06                     118 	.byte 6
      009D49 45 45 50 2D 56 50      119 	.ascii "EEP-VP"
      009D4F                        120 EEPVP:
      009D4F 1D 00 04         [ 2]  121 	subw x,#2*CELLL 
      009D52 90 AE 40 06      [ 2]  122 	ldw y,#APP_VP  
      009D56 EF 02            [ 2]  123 	ldw (2,x),y 
      009D58 90 5F            [ 1]  124 	clrw y 
      009D5A FF               [ 2]  125 	ldw (x),y 
      009D5B 81               [ 4]  126 	ret 
                                    127 
                                    128 ;----------------------------------
                                    129 ; update APP_LAST with LAST 
                                    130 ; UPDAT-LAST ( -- )
                                    131 ;----------------------------------
      009D5C 9D 48                  132 	.word LINK 
                           001CDE   133 	LINK=.
      009D5E 0A                     134 	.byte 10
      009D5F 55 50 44 41 54 2D 4C   135 	.ascii "UPDAT-LAST"
             41 53 54
      009D69                        136 UPDATLAST:
      009D69 CD 88 0E         [ 4]  137 	call LAST
      009D6C CD 85 63         [ 4]  138 	call AT  
      009D6F CD 9D 0C         [ 4]  139 	call EEPLAST
      009D72 CC 9F 5F         [ 2]  140 	jp EESTORE 
                                    141 
                                    142 ;---------------------------------
                                    143 ; update APP_RUN 
                                    144 ; UPDAT-RUN ( a -- )
                                    145 ;---------------------------------
      009D75 9D 5E                  146 	.word LINK
                           001CF7   147 	LINK=.
      009D77 09                     148 	.byte 9
      009D78 55 50 44 41 54 2D 52   149 	.ascii "UPDAT-RUN"
             55 4E
      009D81                        150 UPDATRUN:
      009D81 CD 9D 23         [ 4]  151 	call EEPRUN
      009D84 CC 9F 5F         [ 2]  152 	jp EESTORE 
                                    153 	
                                    154 ;---------------------------------
                                    155 ; update APP_CP with CP 
                                    156 ; UPDAT-CP ( -- )
                                    157 ;---------------------------------
      009D87 9D 77                  158 	.word LINK 
                           001D09   159 	LINK=.
      009D89 08                     160 	.byte 8 
      009D8A 55 50 44 41 54 2D 43   161 	.ascii "UPDAT-CP"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal  50-Bits]



             50
      009D92                        162 UPDATCP:
      009D92 CD 87 FE         [ 4]  163 	call CPP 
      009D95 CD 85 63         [ 4]  164 	call AT 
      009D98 CD 9D 39         [ 4]  165 	call EEPCP 
      009D9B CC 9F 5F         [ 2]  166 	jp EESTORE 
                                    167 
                                    168 ;----------------------------------
                                    169 ; update APP_VP with VP 
                                    170 ; UPDAT-VP ( -- )
                                    171 ;----------------------------------
      009D9E 9D 89                  172 	.word LINK
                           001D20   173 	LINK=.
      009DA0 08                     174 	.byte 8 
      009DA1 55 50 44 41 54 2D 56   175 	.ascii "UPDAT-VP" 
             50
      009DA9                        176 UPDATVP:
      009DA9 CD 87 F0         [ 4]  177 	call VPP 
      009DAC CD 85 63         [ 4]  178 	call AT
      009DAF CD 9D 4F         [ 4]  179 	call EEPVP 
      009DB2 CC 9F 5F         [ 2]  180 	jp EESTORE
                                    181 	
                           000001   182 .if NUCLEO
                                    183 ;----------------------------------
                                    184 ; fetch integer at address over 65535
                                    185 ;  F@   ( ud -- n )
                                    186 ;----------------------------------
      009DB5 9D A0                  187     .word LINK 
                           001D37   188 LINK=.
      009DB7 02                     189     .byte 2
      009DB8 46 40                  190     .ascii "F@"
      009DBA                        191 FARAT:
      009DBA CD 9C D5         [ 4]  192     call FPSTOR
      009DBD CC 9E 82         [ 2]  193 	jp EE_READ 
                                    194 
                                    195 
                                    196 ;-------------------------------------
                                    197 ; fetch C at address over 65535 
                                    198 ; FC@ ( ud -- c)
                                    199 ;-------------------------------------
      009DC0 9D B7                  200     .word LINK
                           001D42   201     LINK=.
      009DC2 03                     202     .byte 3 
      009DC3 46 43 40               203     .ascii "FC@" 
      009DC6                        204 FARCAT:
      009DC6 CD 9C D5         [ 4]  205     call FPSTOR
      009DC9 CC 9E A4         [ 2]  206 	jp EE_CREAD  
                                    207 .endif ; NUCLEO 
                                    208 
                                    209 ;----------------------------------
                                    210 ; UNLOCK EEPROM/OPT for writing/erasing
                                    211 ; wait endlessly for FLASH_IAPSR_DUL bit.
                                    212 ;  UNLKEE   ( -- )
                                    213 ;----------------------------------
      009DCC 9D C2                  214     .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]



                           001D4E   215 LINK=.
      009DCE 06                     216     .byte 6 
      009DCF 55 4E 4C 4B 45 45      217     .ascii "UNLKEE"
      009DD5                        218 UNLKEE:
      009DD5 35 00 50 5B      [ 1]  219 	mov FLASH_CR2,#0 
      009DD9 35 FF 50 5C      [ 1]  220 	mov FLASH_NCR2,#0xFF 
      009DDD 35 AE 50 64      [ 1]  221 	mov FLASH_DUKR,#FLASH_DUKR_KEY1
      009DE1 35 56 50 64      [ 1]  222     mov FLASH_DUKR,#FLASH_DUKR_KEY2
      009DE5 72 07 50 5F FB   [ 2]  223 	btjf FLASH_IAPSR,#FLASH_IAPSR_DUL,.
      009DEA 81               [ 4]  224 	ret
                                    225 
                                    226 ;----------------------------------
                                    227 ; UNLOCK FLASH for writing/erasing
                                    228 ; wait endlessly for FLASH_IAPSR_PUL bit.
                                    229 ; UNLKFL  ( -- )
                                    230 ;----------------------------------
      009DEB 9D CE                  231     .word LINK 
                           001D6D   232 LINK=. 
      009DED 06                     233     .byte 6 
      009DEE 55 4E 4C 4B 46 4C      234     .ascii "UNLKFL"    
      009DF4                        235 UNLKFL:
      009DF4 35 00 50 5B      [ 1]  236 	mov FLASH_CR2,#0 
      009DF8 35 FF 50 5C      [ 1]  237 	mov FLASH_NCR2,#0xFF 
      009DFC 35 56 50 62      [ 1]  238 	mov FLASH_PUKR,#FLASH_PUKR_KEY1
      009E00 35 AE 50 62      [ 1]  239 	mov FLASH_PUKR,#FLASH_PUKR_KEY2
      009E04 72 03 50 5F FB   [ 2]  240 	btjf FLASH_IAPSR,#FLASH_IAPSR_PUL,.
      009E09 81               [ 4]  241 	ret
                                    242 
                                    243 ;-----------------------------
                                    244 ; UNLOCK FLASH or EEPROM 
                                    245 ; according to FPTR address 
                                    246 ;  UNLOCK ( -- )
                                    247 ;-----------------------------
      009E0A 9D ED                  248 	.word LINK 
                           001D8C   249 	LINK=.
      009E0C 06                     250 	.byte 6
      009E0D 55 4E 4C 4F 43 4B      251 	.ascii "UNLOCK"
      009E13                        252 UNLOCK:
                                    253 ; put addr[15:0] in Y, for bounds check.
      009E13 90 BE 35         [ 2]  254 	ldw y,PTR16   ; Y=addr15:0
                                    255 ; check addr[23:16], if <> 0 then it is extened flash memory
      009E16 3D 34            [ 1]  256 	tnz FPTR 
      009E18 26 16            [ 1]  257 	jrne 4$
      009E1A 90 A3 80 00      [ 2]  258     cpw y,#FLASH_BASE
      009E1E 24 10            [ 1]  259     jruge 4$
      009E20 90 A3 40 00      [ 2]  260 	cpw y,#EEPROM_BASE  
      009E24 25 0D            [ 1]  261     jrult 9$
      009E26 90 A3 48 7F      [ 2]  262 	cpw y,#OPTION_END 
      009E2A 22 07            [ 1]  263 	jrugt 9$
      009E2C CD 9D D5         [ 4]  264 	call UNLKEE
      009E2F 81               [ 4]  265 	ret 
      009E30 CD 9D F4         [ 4]  266 4$: call UNLKFL
      009E33 81               [ 4]  267 9$: ret 
                                    268 
                                    269 ;-------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
Hexadecimal [24-Bits]



                                    270 ; LOCK write access to 
                                    271 ; FLASH and EEPROM 
                                    272 ; LOCK ( -- )
                                    273 ;-------------------------
      009E34 9E 0C                  274 	.word LINK 
                           001DB6   275 	LINK=.
      009E36 04                     276 	.byte 4 
      009E37 4C 4F 43 4B            277 	.ascii "LOCK" 
      009E3B                        278 LOCK: 
      009E3B 72 13 50 5F      [ 1]  279 	bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      009E3F 72 17 50 5F      [ 1]  280 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      009E43 81               [ 4]  281 	ret 
                                    282 
                                    283 ;-------------------------
                                    284 ; increment FPTR 
                                    285 ; INC-FPTR ( -- )
                                    286 ;-------------------------
      009E44 9E 36                  287 	.word LINK 
                           001DC6   288 	LINK=. 
      009E46 08                     289 	.byte 8 
      009E47 49 4E 43 2D 46 50 54   290 	.ascii "INC-FPTR" 
             52
      009E4F                        291 INC_FPTR:
      009E4F 3C 36            [ 1]  292 	inc PTR8 
      009E51 26 0C            [ 1]  293 	jrne 1$
      009E53 90 89            [ 2]  294 	pushw y 
      009E55 90 BE 34         [ 2]  295 	ldw y,FPTR 
      009E58 90 5C            [ 1]  296 	incw y 
      009E5A 90 BF 34         [ 2]  297 	ldw FPTR,y
      009E5D 90 85            [ 2]  298 	popw y  
      009E5F 81               [ 4]  299 1$: ret 
                                    300 
                                    301 ;------------------------------
                                    302 ; add u to FPTR 
                                    303 ; PTR+ ( u -- )
                                    304 ;------------------------------
      009E60 9E 46                  305 	.word LINK 
                           001DE2   306 	LINK=.
      009E62 04                     307 	.byte 4 
      009E63 50 54 52 2B            308 	.ascii "PTR+"
      009E67                        309 PTRPLUS:
      009E67 90 93            [ 1]  310 	ldw y,x 
      009E69 1C 00 02         [ 2]  311 	addw x,#CELLL 
      009E6C 72 B9 00 35      [ 2]  312 	addw y,PTR16 
      009E70 90 BF 35         [ 2]  313 	ldw PTR16,y  
      009E73 24 02            [ 1]  314 	jrnc 1$
      009E75 3C 34            [ 1]  315 	inc FPTR 
      009E77 81               [ 4]  316 1$: ret 
                                    317 
                                    318 ;---------------------------------
                                    319 ; read word at address pointed FPTR
                                    320 ; increment FPTR 
                                    321 ; EE-READ ( -- w )
                                    322 ;------------------------------------
      009E78 9E 62                  323 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
Hexadecimal [24-Bits]



                           001DFA   324 	LINK=.
      009E7A 07                     325 	.byte 7 
      009E7B 45 45 2D 52 45 41 44   326 	.ascii "EE-READ"
      009E82                        327 EE_READ:
      009E82 1D 00 02         [ 2]  328 	subw x,#CELLL 
      009E85 92 BC 00 34      [ 5]  329 	ldf a,[FPTR]
      009E89 90 95            [ 1]  330 	ld yh,a 
      009E8B CD 9E 4F         [ 4]  331 	call INC_FPTR 
      009E8E 92 BC 00 34      [ 5]  332 	ldf a,[FPTR]
      009E92 CD 9E 4F         [ 4]  333 	call INC_FPTR 
      009E95 90 97            [ 1]  334 	ld yl,a 
      009E97 FF               [ 2]  335 	ldw (x),y 
      009E98 81               [ 4]  336 	ret 
                                    337 
                                    338 ;---------------------------------------
                                    339 ; Read byte at address pointed by FPTR 
                                    340 ; EE-CREAD ( -- c )
                                    341 ;---------------------------------------
      009E99 9E 7A                  342 	.word LINK 
                           001E1B   343 	LINK=.
      009E9B 08                     344 	.byte 8
      009E9C 45 45 2D 43 52 45 41   345 	.ascii "EE-CREAD" 
             44
      009EA4                        346 EE_CREAD:
      009EA4 1D 00 02         [ 2]  347 	subw x,#CELLL 
      009EA7 92 BC 00 34      [ 5]  348 	ldf a,[FPTR]	
      009EAB CD 9E 4F         [ 4]  349 	call INC_FPTR
      009EAE 90 5F            [ 1]  350 	clrw y 
      009EB0 90 97            [ 1]  351 	ld yl,a 
      009EB2 FF               [ 2]  352 	ldw (x),y 
      009EB3 81               [ 4]  353 	ret 
                                    354 
                                    355 ;----------------------------
                                    356 ; write a byte at address pointed 
                                    357 ; by FPTR and increment FPTR.
                                    358 ; Expect pointer already initialized 
                                    359 ; and memory unlocked 
                                    360 ; WR-BYTE ( c -- )
                                    361 ;----------------------------
      009EB4 9E 9B                  362 	.word LINK 
                           001E36   363 	LINK=. 
      009EB6 07                     364 	.byte 7 
      009EB7 57 52 2D 42 59 54 45   365 	.ascii "WR-BYTE" 
                                    366 
      009EBE                        367 WR_BYTE:
      009EBE CD 84 E3         [ 4]  368 	call FC_XOFF
      009EC1 90 93            [ 1]  369 	ldw y,x 
      009EC3 90 FE            [ 2]  370 	ldw y,(y)
      009EC5 1C 00 02         [ 2]  371 	addw x,#CELLL 
      009EC8 90 9F            [ 1]  372 	ld a,yl
      009ECA 92 BD 00 34      [ 4]  373 	ldf [FPTR],a
      009ECE 72 05 50 5F FB   [ 2]  374 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009ED3 CD 84 CD         [ 4]  375 	call FC_XON
      009ED6 CC 9E 4F         [ 2]  376 	jp INC_FPTR 
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
      009ED9 9E B6                  385 	.word LINK 
                           001E5B   386 	LINK=.
      009EDB 07                     387 	.byte 7 
      009EDC 57 52 2D 57 4F 52 44   388 	.ascii "WR-WORD" 
      009EE3                        389 WR_WORD:
      009EE3 CD 84 E3         [ 4]  390 	call FC_XOFF
      009EE6 90 93            [ 1]  391 	ldw y,x
      009EE8 90 FE            [ 2]  392 	ldw y,(y)
      009EEA 1C 00 02         [ 2]  393 	addw x,#CELLL 
      009EED 90 9E            [ 1]  394 	ld a,yh 
      009EEF 92 BD 00 34      [ 4]  395 	ldf [FPTR],a
      009EF3 72 05 50 5F FB   [ 2]  396 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009EF8 CD 9E 4F         [ 4]  397 	call INC_FPTR 
      009EFB 90 9F            [ 1]  398 	ld a,yl 
      009EFD 92 BD 00 34      [ 4]  399 	ldf [FPTR],a
      009F01 72 05 50 5F FB   [ 2]  400 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009F06 CD 84 CD         [ 4]  401 	call FC_XON
      009F09 CC 9E 4F         [ 2]  402 	jp INC_FPTR 
                                    403 
                                    404 
                                    405 ;---------------------------------------
                                    406 ; write a byte to FLASH or EEPROM/OPTION  
                                    407 ; EEC!  (c ud -- )
                                    408 ;---------------------------------------
      009F0C 9E DB                  409     .word LINK 
                           001E8E   410 	LINK=.
      009F0E 04                     411     .byte 4 
      009F0F 45 45 43 21            412     .ascii "EEC!"
                                    413 	; local variables 
                           000001   414 	BTW = 1   ; byte to write offset on stack
                           000002   415     OPT = 2 
                           000002   416 	VSIZE = 2
      009F13                        417 EECSTORE:
      009F13 52 02            [ 2]  418 	sub sp,#VSIZE
      009F15 CD 9C D5         [ 4]  419     call FPSTOR
      009F18 E6 01            [ 1]  420 	ld a,(1,x)
      009F1A 43               [ 1]  421 	cpl a 
      009F1B 6B 01            [ 1]  422 	ld (BTW,sp),a ; byte to write 
      009F1D 0F 02            [ 1]  423 	clr (OPT,sp)  ; OPTION flag
      009F1F CD 9E 13         [ 4]  424 	call UNLOCK 
                                    425 	; check if option
      009F22 3D 34            [ 1]  426 	tnz FPTR 
      009F24 26 19            [ 1]  427 	jrne 2$
      009F26 90 BE 35         [ 2]  428 	ldw y,PTR16 
      009F29 90 A3 48 00      [ 2]  429 	cpw y,#OPTION_BASE
      009F2D 2B 10            [ 1]  430 	jrmi 2$
      009F2F 90 A3 48 80      [ 2]  431 	cpw y,#OPTION_END+1
      009F33 2A 0A            [ 1]  432 	jrpl 2$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]



      009F35 03 02            [ 1]  433 	cpl (OPT,sp)
                                    434 	; OPTION WRITE require this UNLOCK 
      009F37 72 1E 50 5B      [ 1]  435     bset FLASH_CR2,#FLASH_CR2_OPT
      009F3B 72 1F 50 5C      [ 1]  436     bres FLASH_NCR2,#FLASH_CR2_OPT 
      009F3F                        437 2$: 
      009F3F CD 9E BE         [ 4]  438 	call WR_BYTE 	
      009F42 0D 02            [ 1]  439 	tnz (OPT,sp)
      009F44 27 0D            [ 1]  440 	jreq 3$ 
      009F46 7B 01            [ 1]  441     ld a,(BTW,sp)
      009F48 90 5F            [ 1]  442     clrw y
      009F4A 90 97            [ 1]  443 	ld yl,a 
      009F4C 1D 00 02         [ 2]  444 	subw x,#CELLL 
      009F4F FF               [ 2]  445 	ldw (x),y 
      009F50 CD 9E BE         [ 4]  446 	call WR_BYTE
      009F53                        447 3$: 
      009F53 CD 9E 3B         [ 4]  448 	call LOCK 
      009F56 5B 02            [ 2]  449 	addw sp,#VSIZE 
      009F58 81               [ 4]  450     ret
                                    451 
                                    452 ;------------------------------
                                    453 ; write integer in FLASH|EEPROM
                                    454 ; EE! ( n ud -- )
                                    455 ;------------------------------
      009F59 9F 0E                  456 	.word LINK 
                           001EDB   457 	LINK=.
      009F5B 03                     458 	.byte 3 
      009F5C 45 45 21               459 	.ascii "EE!"
      009F5F                        460 EESTORE:
      009F5F CD 9C D5         [ 4]  461 	call FPSTOR 
      009F62 CD 9E 13         [ 4]  462 	call UNLOCK 
      009F65 90 93            [ 1]  463 	ldw y,x 
      009F67 90 FE            [ 2]  464 	ldw y,(y)
      009F69 90 89            [ 2]  465 	pushw y 
      009F6B 90 5E            [ 1]  466 	swapw y 
      009F6D FF               [ 2]  467 	ldw (x),y 
      009F6E CD 9E BE         [ 4]  468 	call WR_BYTE 
      009F71 90 85            [ 2]  469 	popw y 
      009F73 1D 00 02         [ 2]  470 	subw x,#CELLL
      009F76 FF               [ 2]  471 	ldw (x),y 
      009F77 CD 9E BE         [ 4]  472 	call WR_BYTE
      009F7A CC 9E 3B         [ 2]  473 	jp LOCK 
                                    474 
                                    475 
                                    476 ;----------------------------
                                    477 ; Erase flash memory row 
                                    478 ; stm8s208 as 128 bytes rows
                                    479 ; ROW-ERASE ( ud -- )
                                    480 ;----------------------------
      009F7D 9F 5B                  481 	.word LINK 
                           001EFF   482 	LINK=. 
      009F7F 09                     483 	.byte 9 
      009F80 52 4F 57 2D 45 52 41   484 	.ascii "ROW-ERASE" 
             53 45
      009F89                        485 row_erase:
      009F89 CD 84 E3         [ 4]  486 	call FC_XOFF
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]



      009F8C CD 9C D5         [ 4]  487 	call FPSTOR
                                    488 ;code must be execute from RAM 
                                    489 ;copy routine to PAD 
      009F8F 1D 00 02         [ 2]  490 	subw x,#CELLL 
      009F92 90 AE 9F E2      [ 2]  491 	ldw y,#row_erase_proc
      009F96 FF               [ 2]  492 	ldw (x),y 
      009F97 CD 8D 6E         [ 4]  493 	call PAD 
      009F9A 90 AE A0 09      [ 2]  494 	ldw y,#row_erase_proc_end 
      009F9E 72 A2 9F E2      [ 2]  495 	subw y,#row_erase_proc
      009FA2 1D 00 02         [ 2]  496 	subw x,#CELLL 
      009FA5 FF               [ 2]  497 	ldw (x),y 
      009FA6 CD 8D AA         [ 4]  498 	call CMOVE 
      009FA9                        499 block_erase:
      009FA9 90 BE 35         [ 2]  500 	ldw y,FPTR+1
      009FAC 90 A3 B6 80      [ 2]  501 	cpw y,#app_space 
      009FB0 2A 19            [ 1]  502 	jrpl erase_flash 
                                    503 ; erase EEPROM block
      009FB2 90 A3 40 00      [ 2]  504 	cpw y,#EEPROM_BASE 
      009FB6 24 04            [ 1]  505 	jruge 1$
      009FB8 CD 84 CD         [ 4]  506 	call FC_XON
      009FBB 81               [ 4]  507 	ret ; bad address 
      009FBC 90 A3 47 FF      [ 2]  508 1$: cpw y,#EEPROM_END 
      009FC0 23 04            [ 2]  509 	jrule 2$ 
      009FC2 CD 84 CD         [ 4]  510 	call FC_XON
      009FC5 81               [ 4]  511 	ret ; bad address 
      009FC6                        512 2$:	
      009FC6 CD 9D D5         [ 4]  513 	call UNLKEE 
      009FC9 20 03            [ 2]  514 	jra proceed_erase
                                    515 ; erase flash block:
      009FCB                        516 erase_flash:
      009FCB CD 9D F4         [ 4]  517 	call UNLKFL 
      009FCE                        518 proceed_erase:
      009FCE CD 8D 6E         [ 4]  519 	call PAD 
      009FD1 90 93            [ 1]  520 	ldw y,x
      009FD3 90 FE            [ 2]  521 	ldw y,(y)
      009FD5 1C 00 02         [ 2]  522 	addw x,#CELLL  
      009FD8 90 FD            [ 4]  523 	call (y) 
      009FDA 72 17 50 5F      [ 1]  524 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      009FDE CD 84 CD         [ 4]  525 	call FC_XON
      009FE1 81               [ 4]  526 	ret 
                                    527 
                                    528 ; this routine is to be copied to PAD 
      009FE2                        529 row_erase_proc:
      009FE2 35 20 50 5B      [ 1]  530 	mov FLASH_CR2,#(1<<FLASH_CR2_ERASE) 
      009FE6 35 DF 50 5C      [ 1]  531 	mov FLASH_NCR2,#~(1<<FLASH_CR2_ERASE)
      009FEA 4F               [ 1]  532 	clr a 
      009FEB 90 5F            [ 1]  533 	clrw y 
      009FED 91 A7 00 34      [ 1]  534 	ldf ([FPTR],y),a
      009FF1 90 5C            [ 1]  535     incw y
      009FF3 91 A7 00 34      [ 1]  536 	ldf ([FPTR],y),a
      009FF7 90 5C            [ 1]  537     incw y
      009FF9 91 A7 00 34      [ 1]  538 	ldf ([FPTR],y),a
      009FFD 90 5C            [ 1]  539     incw y
      009FFF 91 A7 00 34      [ 1]  540 	ldf ([FPTR],y),a
      00A003 72 05 50 5F FB   [ 2]  541 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 118.
Hexadecimal [24-Bits]



      00A008 81               [ 4]  542 	ret
      00A009                        543 row_erase_proc_end:
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
      00A009                        556 copy_buffer:
      00A009 4B 80            [ 1]  557 	push #BLOCK_SIZE  
                                    558 ;enable block programming 
      00A00B 72 10 50 5B      [ 1]  559 	bset FLASH_CR2,#FLASH_CR2_PRG 
      00A00F 72 11 50 5C      [ 1]  560 	bres FLASH_NCR2,#FLASH_CR2_PRG
      00A013 90 5F            [ 1]  561 	clrw y
      00A015 F6               [ 1]  562 1$:	ld a,(x)
      00A016 91 A7 00 34      [ 1]  563 	ldf ([FPTR],y),a
      00A01A 5C               [ 1]  564 	incw x 
      00A01B 90 5C            [ 1]  565 	incw y 
      00A01D 0A 01            [ 1]  566 	dec (BCNT,sp)
      00A01F 26 F4            [ 1]  567 	jrne 1$
                                    568 ; wait EOP bit 
      00A021 72 05 50 5F FB   [ 2]  569 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. 
      00A026 84               [ 1]  570 	pop a ; remove BCNT from stack 
      00A027 81               [ 4]  571 	ret 
      00A028                        572 copy_buffer_end:
                                    573 
                                    574 ;-------------------------
                                    575 ; move program_row to RAM 
                                    576 ; in TIB 
                                    577 ;------------------------
      00A028                        578 copy_prog_to_ram:
      00A028 1D 00 06         [ 2]  579 	subw x,#6
      00A02B 90 AE A0 09      [ 2]  580 	ldw y,#copy_buffer 
      00A02F EF 04            [ 2]  581 	ldw (4,x),y 
      00A031 90 AE 17 00      [ 2]  582 	ldw y,#TIBBASE
      00A035 EF 02            [ 2]  583 	ldw (2,x),y 
      00A037 90 AE A0 28      [ 2]  584 	ldw y,#copy_buffer_end 
      00A03B 72 A2 A0 09      [ 2]  585 	subw y,#copy_buffer  
      00A03F FF               [ 2]  586 	ldw (x),y 
      00A040 CD 8D AA         [ 4]  587 	call CMOVE 
      00A043 81               [ 4]  588 	ret 
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



      00A044 9F 7F                  597 	.word LINK 
                           001FC6   598 	LINK=.
      00A046 06                     599 	.byte 6 
      00A047 57 52 2D 52 4F 57      600 	.ascii "WR-ROW"
      00A04D                        601 write_row:
      00A04D CD 84 E3         [ 4]  602 	call FC_XOFF
      00A050 CD 9C D5         [ 4]  603 	call FPSTOR
                                    604 ; align to FLASH block 
      00A053 A6 80            [ 1]  605 	ld a,#0x80 
      00A055 B4 36            [ 1]  606 	and a,PTR8 
      00A057 B7 36            [ 1]  607 	ld PTR8,a  
      00A059 CD A0 28         [ 4]  608 	call copy_prog_to_ram
      00A05C CD 9E 13         [ 4]  609 	call UNLOCK
      00A05F 90 93            [ 1]  610 	ldw y,x 
      00A061 90 FE            [ 2]  611 	ldw y,(y)
      00A063 1C 00 02         [ 2]  612 	addw x,#CELLL 
      00A066 89               [ 2]  613 	pushw x 
      00A067 93               [ 1]  614 	ldw x,y ; buffer address in x 
      00A068 CD 17 00         [ 4]  615 	call TIBBASE
      00A06B CD 9E 3B         [ 4]  616 	call LOCK
      00A06E 85               [ 2]  617 	popw x 
      00A06F CD 84 CD         [ 4]  618 	call FC_XON 
      00A072 81               [ 4]  619 	ret 
                                    620 
                                    621 ;-------------------------------------
                                    622 ; change value of OPTION register 
                                    623 ; SET-OPT (c n -- ) 
                                    624 ; c new value.
                                    625 ; n OPT  number {1..7}
                                    626 ;--------------------------------------
      00A073 A0 46                  627 		.word LINK 
                           001FF5   628 		LINK=.
      00A075 07                     629 		.byte 7 
      00A076 53 45 54 2D 4F 50 54   630 		.ascii "SET-OPT" 
      00A07D                        631 set_option: 
      00A07D 90 93            [ 1]  632 		ldw y,x 
      00A07F 90 FE            [ 2]  633 		ldw y,(y)
      00A081 27 06            [ 1]  634 		jreq 1$
      00A083 90 A3 00 07      [ 2]  635 		cpw y,#7 
      00A087 23 04            [ 2]  636 		jrule 2$ 
                                    637 ; invalid OPTION number 		
      00A089 1C 00 04         [ 2]  638 1$:		addw x,#2*CELLL
      00A08C 81               [ 4]  639 		ret
      00A08D 90 58            [ 2]  640 2$:		sllw y 
      00A08F 72 A9 47 FF      [ 2]  641 		addw y,#OPTION_BASE-1
      00A093 FF               [ 2]  642 		ldw (x),y 
      00A094 1D 00 02         [ 2]  643 		subw x,#CELLL 
      00A097 90 5F            [ 1]  644 		clrw y 
      00A099 FF               [ 2]  645 		ldw (x),y 
      00A09A CD 9F 13         [ 4]  646 		call EECSTORE
      00A09D 81               [ 4]  647 		ret 
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
      00A09E A0 75                  656 	.word LINK  
                           002020   657 	LINK=.
      00A0A0 08                     658 	.byte 8 
      00A0A1 50 52 49 53 54 49 4E   659 	.ascii "PRISTINE"
             45
      00A0A9                        660 pristine:
                                    661 ;;; erase EEPROM
      00A0A9 CD 9C F4         [ 4]  662 	call EEPROM 
      00A0AC CD 88 A7         [ 4]  663 1$:	call DDUP 
      00A0AF CD 9F 89         [ 4]  664 	call row_erase
      00A0B2 90 93            [ 1]  665 	ldw y,x 
      00A0B4 90 EE 02         [ 2]  666 	ldw y,(2,y)
      00A0B7 72 A9 00 80      [ 2]  667 	addw y,#BLOCK_SIZE
      00A0BB EF 02            [ 2]  668 	ldw (2,x),y
      00A0BD 90 A3 48 00      [ 2]  669 	cpw y,#OPTION_BASE 
      00A0C1 25 E9            [ 1]  670 	jrult 1$
                                    671 ;;; reset OPTION to default values
      00A0C3 90 AE 00 01      [ 2]  672 	ldw y,#1 ; OPT1 
      00A0C7 FF               [ 2]  673 2$:	ldw (x),y   
      00A0C8 90 5F            [ 1]  674 	clrw y 
      00A0CA EF 02            [ 2]  675 	ldw (2,x),y  ; ( 0 1 -- ) 
      00A0CC CD 88 A7         [ 4]  676 	call DDUP    ; ( 0 1 0 1 -- )  
      00A0CF CD A0 7D         [ 4]  677 	call set_option
      00A0D2 90 93            [ 1]  678 	ldw y,x 
      00A0D4 90 FE            [ 2]  679 	ldw y,(y)
      00A0D6 90 5C            [ 1]  680 	incw y  ; next OPTION 
      00A0D8 90 A3 00 08      [ 2]  681 	cpw y,#8 
      00A0DC 25 E9            [ 1]  682 	jrult 2$
                                    683 ;;; erase first row of app_space 	
      00A0DE 90 AE B6 80      [ 2]  684 	ldw y,#app_space
      00A0E2 EF 02            [ 2]  685 	ldw (2,x),y  
      00A0E4 90 5F            [ 1]  686 	clrw y 
      00A0E6 FF               [ 2]  687 	ldw (x),y ; ( app_space 0 -- )
      00A0E7 CD 9F 89         [ 4]  688 	call row_erase 
                                    689 ; reset interrupt vectors 
      00A0EA 1D 00 02         [ 2]  690 	subw x,#CELLL 
      00A0ED 90 5F            [ 1]  691 	clrw y  
      00A0EF FF               [ 2]  692 4$:	ldw (x),y  ; ( n -- ) int# 
      00A0F0 CD 86 99         [ 4]  693 	call DUPP  
      00A0F3 CD A1 10         [ 4]  694 	call reset_vector
      00A0F6 90 93            [ 1]  695 	ldw y,x 
      00A0F8 90 FE            [ 2]  696 	ldw y,(y)
      00A0FA 90 5C            [ 1]  697 	incw y   ; next vector 
      00A0FC 90 A3 00 19      [ 2]  698 	cpw y,#25 
      00A100 25 ED            [ 1]  699 	jrult 4$
      00A102 CC 80 80         [ 2]  700 	jp NonHandledInterrupt ; reset MCU
                                    701 
                                    702 ;------------------------------
                                    703 ; reset an interrupt vector 
                                    704 ; to its initial value 
                                    705 ; i.e. NonHandledInterrupt
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 121.
Hexadecimal [24-Bits]



                                    706 ; RST-IVEC ( n -- )
                                    707 ;-----------------------------
      00A105 A0 A0                  708 	.word LINK 
                           002087   709 	LINK=. 
      00A107 08                     710 	.byte 8 
      00A108 52 53 54 2D 49 56 45   711 	.ascii "RST-IVEC"
             43
      00A110                        712 reset_vector:
      00A110 90 93            [ 1]  713 	ldw y,x
      00A112 1C 00 02         [ 2]  714 	addw x,#CELLL 
      00A115 90 FE            [ 2]  715 	ldw y,(y)
      00A117 90 A3 00 17      [ 2]  716 	cpw y,#23 
      00A11B 27 3A            [ 1]  717 	jreq 9$
      00A11D 90 A3 00 1D      [ 2]  718 	cpw y,#29 ; last vector
      00A121 22 34            [ 1]  719 	jrugt 9$  
      00A123 90 58            [ 2]  720 	sllw y 
      00A125 90 58            [ 2]  721 	sllw y 
      00A127 72 A9 80 08      [ 2]  722 	addw y,#0x8008 ; irq0 address 
      00A12B 90 BF 26         [ 2]  723 	ldw YTEMP,y
      00A12E 1D 00 06         [ 2]  724 	subw x,#3*CELLL 
      00A131 EF 02            [ 2]  725 	ldw (2,x),y 
      00A133 90 5F            [ 1]  726 	clrw y
      00A135 FF               [ 2]  727 	ldw (x),y 
      00A136 A6 82            [ 1]  728 	ld a,#0x82 
      00A138 90 95            [ 1]  729 	ld yh,a
      00A13A EF 04            [ 2]  730 	ldw (4,x),y
      00A13C CD 9F 5F         [ 4]  731 	call EESTORE
      00A13F 1D 00 06         [ 2]  732 	subw x,#3*CELLL
      00A142 90 5F            [ 1]  733 	clrw y 
      00A144 FF               [ 2]  734 	ldw (x),y 
      00A145 90 AE 80 80      [ 2]  735 	ldw y,#NonHandledInterrupt
      00A149 EF 04            [ 2]  736 	ldw (4,x),y 
      00A14B 90 BE 26         [ 2]  737 	ldw y,YTEMP  
      00A14E 72 A9 00 02      [ 2]  738 	addw y,#2
      00A152 EF 02            [ 2]  739 	ldw (2,x),y 
      00A154 CD 9F 5F         [ 4]  740 	call EESTORE
      00A157 81               [ 4]  741 9$:	ret 
                                    742 
                                    743 
                                    744 ;------------------------------
                                    745 ; all interrupt vector with 
                                    746 ; an address >= a are resetted 
                                    747 ; to default
                                    748 ; CHKIVEC ( a -- )
                                    749 ;------------------------------
      00A158 A1 07                  750 	.word LINK 
                           0020DA   751 	LINK=.
      00A15A 07                     752 	.byte 7
      00A15B 43 48 4B 49 56 45 43   753 	.ascii "CHKIVEC"
                                    754 ;local variables 
                           000001   755 	SSP=1
                           000003   756 	CADR=3
                           000005   757 	OFS=5
                           000006   758 	VSIZE=6  
      00A162                        759 CHKIVEC:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 122.
Hexadecimal [24-Bits]



      00A162 52 06            [ 2]  760 	sub sp,#VSIZE ;alloc local variables 
      00A164 90 93            [ 1]  761 	ldw y,x 
      00A166 90 FE            [ 2]  762 	ldw y,(y)
      00A168 17 03            [ 2]  763 	ldw (CADR,sp),y ; ca 
      00A16A 1F 01            [ 2]  764 	ldw (SSP,sp),x 
      00A16C AE 80 0A         [ 2]  765 	ldw x,#0x800a ; irq0 address 
      00A16F BF 35            [ 2]  766 	ldw PTR16,X
      00A171 AE FF FC         [ 2]  767 	ldw x,#-4 
      00A174 1C 00 04         [ 2]  768 1$:	addw x,#4
      00A177 A3 00 78         [ 2]  769 	cpw x,#30*4 ; irq0-29 
      00A17A 27 22            [ 1]  770 	jreq 9$
      00A17C 90 93            [ 1]  771 	ldw y,x  
      00A17E 91 D6 35         [ 4]  772 	ld a,([PTR16],y)
      00A181 11 03            [ 1]  773 	cp a,(CADR,sp)
      00A183 25 EF            [ 1]  774 	jrult 1$
      00A185 90 5C            [ 1]  775 	incw y 
      00A187 91 D6 35         [ 4]  776 	ld a,([PTR16],y)
      00A18A 11 04            [ 1]  777 	cp a,(CADR+1,sp) 
      00A18C 25 E6            [ 1]  778 	jrult 1$ 
      00A18E 1F 05            [ 2]  779 	ldw (OFS,sp),x 
      00A190 54               [ 2]  780 	srlw x
      00A191 54               [ 2]  781 	srlw x 
      00A192 90 93            [ 1]  782 	ldw y,x 
      00A194 1E 01            [ 2]  783 	ldw x,(SSP,sp)
      00A196 FF               [ 2]  784 	ldw (x),y
      00A197 CD A1 10         [ 4]  785 	call reset_vector
      00A19A 1E 05            [ 2]  786 	ldw x,(OFS,sp) 
      00A19C 20 D6            [ 2]  787 	jra 1$
      00A19E 1E 01            [ 2]  788 9$:	ldw x,(SSP,sp) 
      00A1A0 1C 00 02         [ 2]  789 	addw x,#CELLL 
      00A1A3 5B 06            [ 2]  790 	addw sp,#VSIZE ; drop local variables  
      00A1A5 81               [ 4]  791 	ret 
                                    792 
                                    793 ;------------------------------
                                    794 ; set interrupt vector 
                                    795 ; SET-IVEC ( ud n -- )
                                    796 ;  ud Handler address
                                    797 ;  n  vector # 0 .. 29 
                                    798 ;-----------------------------
      00A1A6 A1 5A                  799 	.word LINK
                           002128   800 	LINK=.
      00A1A8 08                     801 	.byte 8 
      00A1A9 53 45 54 2D 49 56 45   802 	.ascii "SET-IVEC" 
             43
      00A1B1                        803 set_vector:
      00A1B1 90 93            [ 1]  804     ldw y,x 
      00A1B3 1C 00 02         [ 2]  805 	addw x,#CELLL 
      00A1B6 90 FE            [ 2]  806 	ldw y,(y) ; vector #
      00A1B8 90 A3 00 1D      [ 2]  807 	cpw y,#29 ; last vector
      00A1BC 23 04            [ 2]  808 	jrule 2$
      00A1BE 1C 00 04         [ 2]  809 	addw x,#2*CELLL 
      00A1C1 81               [ 4]  810 	ret
      00A1C2 90 58            [ 2]  811 2$:	sllw y 
      00A1C4 90 58            [ 2]  812 	sllw y 
      00A1C6 72 A9 80 08      [ 2]  813 	addw y,#0X8008 ; IRQ0 vector address 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 123.
Hexadecimal [24-Bits]



      00A1CA 90 BF 26         [ 2]  814 	ldw YTEMP,y ; vector address 
      00A1CD A6 82            [ 1]  815 	ld a,#0x82 
      00A1CF 90 95            [ 1]  816 	ld yh,a 
      00A1D1 E6 01            [ 1]  817 	ld a,(1,x) ; isr address bits 23..16 
      00A1D3 90 97            [ 1]  818 	ld yl,a 
                                    819 ;  write 0x82 + most significant byte of int address	
      00A1D5 1D 00 06         [ 2]  820 	subw x,#3*CELLL 
      00A1D8 EF 04            [ 2]  821 	ldw (4,x),y 
      00A1DA 90 BE 26         [ 2]  822 	ldw y,YTEMP
      00A1DD EF 02            [ 2]  823 	ldw (2,x),y ; vector address 
      00A1DF 90 5F            [ 1]  824 	clrw y 
      00A1E1 FF               [ 2]  825 	ldw (x),y   ; as a double 
      00A1E2 CD 9F 5F         [ 4]  826 	call EESTORE 
      00A1E5 90 93            [ 1]  827 	ldw y,x 
      00A1E7 90 EE 02         [ 2]  828 	ldw y,(2,y) ; bits 15..0 int vector 
      00A1EA 1D 00 06         [ 2]  829 	subw x,#3*CELLL 
      00A1ED EF 04            [ 2]  830 	ldw (4,x),y 
      00A1EF 90 BE 26         [ 2]  831 	ldw y,YTEMP 
      00A1F2 72 A9 00 02      [ 2]  832 	addw y,#2 
      00A1F6 EF 02            [ 2]  833 	ldw (2,x),y 
      00A1F8 90 5F            [ 1]  834 	clrw y 
      00A1FA FF               [ 2]  835 	ldw (x),y 
      00A1FB CD 9F 5F         [ 4]  836 	call EESTORE
      00A1FE 1C 00 04         [ 2]  837 	addw x,#2*CELLL  
      00A201 81               [ 4]  838 9$: ret 
                                    839 
                                    840 
                                    841 ;------------------------
                                    842 ; Compile word to flash
                                    843 ; EE, (w -- )
                                    844 ;-----------------------
      00A202 A1 A8                  845 	.word LINK
                           002184   846 	LINK=.
      00A204 03                     847 	.byte 3
      00A205 45 45 2C               848 	.ascii "EE,"
      00A208                        849 EE_COMMA:
      00A208 1D 00 04         [ 2]  850 	subw x,#2*CELLL 
      00A20B 90 BE 1A         [ 2]  851 	ldw y,UCP
      00A20E 90 89            [ 2]  852 	pushw y 
      00A210 EF 02            [ 2]  853 	ldw (2,x),y 
      00A212 90 5F            [ 1]  854 	clrw y 
      00A214 FF               [ 2]  855 	ldw (x),y
      00A215 CD 9F 5F         [ 4]  856 	call EESTORE
      00A218 90 85            [ 2]  857 	popw y 
      00A21A 72 A9 00 02      [ 2]  858 	addw y,#2
      00A21E 90 BF 1A         [ 2]  859 	ldw UCP,y
      00A221 81               [ 4]  860 	ret 
                                    861 
                                    862 
                                    863 ;-------------------------
                                    864 ; Compile byte to flash 
                                    865 ; EEC, ( c -- )	
                                    866 ;-------------------------
      00A222 A2 04                  867 	.word LINK 
                           0021A4   868 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 124.
Hexadecimal [24-Bits]



      00A224 04                     869 	.byte 4 
      00A225 45 45 43 2C            870 	.ascii "EEC,"
      00A229                        871 EE_CCOMMA:
      00A229 1D 00 04         [ 2]  872 	subw x,#2*CELLL 
      00A22C 90 BE 1A         [ 2]  873 	ldw y,UCP
      00A22F 90 89            [ 2]  874 	pushw y 
      00A231 EF 02            [ 2]  875 	ldw (2,x),y 
      00A233 90 5F            [ 1]  876 	clrw y 
      00A235 FF               [ 2]  877 	ldw (x),y
      00A236 CD 9F 13         [ 4]  878 	call EECSTORE
      00A239 90 85            [ 2]  879 	popw y 
      00A23B 90 5C            [ 1]  880 	incw y 
      00A23D 90 BF 1A         [ 2]  881 	ldw UCP,y
      00A240 81               [ 4]  882 	ret 
                                    883 
                                    884 
                                    885 ;--------------------------
                                    886 ; copy FLASH block to ROWBUF
                                    887 ; ROW>BUF ( ud -- )
                                    888 ;--------------------------
      00A241 A2 24                  889 	.word LINK 
                           0021C3   890 	LINK=.
      00A243 07                     891 	.byte 7 
      00A244 52 4F 57 3E 42 55 46   892 	.ascii "ROW>BUF"
      00A24B                        893 ROW2BUF: 
      00A24B CD 9C D5         [ 4]  894 	call FPSTOR 
      00A24E A6 80            [ 1]  895 	ld a,#BLOCK_SIZE
      00A250 88               [ 1]  896 	push a 
      00A251 B4 36            [ 1]  897 	and a,PTR8 ; block align 
      00A253 B7 36            [ 1]  898 	ld PTR8,a
      00A255 90 AE 16 80      [ 2]  899 	ldw y,#ROWBUFF 
      00A259 92 BC 00 34      [ 5]  900 1$: ldf a,[FPTR]
      00A25D 90 F7            [ 1]  901 	ld (y),a
      00A25F CD 9E 4F         [ 4]  902 	call INC_FPTR
      00A262 90 5C            [ 1]  903 	incw y 
      00A264 0A 01            [ 1]  904 	dec (1,sp)
      00A266 26 F1            [ 1]  905 	jrne 1$ 
      00A268 84               [ 1]  906 	pop a 
      00A269 81               [ 4]  907 	ret 
                                    908 
                                    909 
                                    910 ;---------------------------
                                    911 ; copy ROWBUFF to flash 
                                    912 ; BUF>ROW ( ud -- )
                                    913 ; ud is row address as double 
                                    914 ;---------------------------
      00A26A A2 43                  915 	.word LINK 
                           0021EC   916 	LINK=.
      00A26C 07                     917 	.byte 7 
      00A26D 42 55 46 3E 52 4F 57   918 	.ascii "BUF>ROW" 
      00A274                        919 BUF2ROW:
      00A274 CD 87 9D         [ 4]  920 	call TBUF ; ( ud rb -- )
      00A277 CD 88 5D         [ 4]  921 	call ROT 
      00A27A CD 88 5D         [ 4]  922 	call ROT  ; ( rb ud -- )
      00A27D CD A0 4D         [ 4]  923 	call write_row 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 125.
Hexadecimal [24-Bits]



      00A280 81               [ 4]  924 	ret 
                                    925 
                                    926 ;---------------------------------
                                    927 ; how many byte free in that row 
                                    928 ; RFREE ( a -- n )
                                    929 ; a is least byte of target address
                                    930 ;----------------------------------
      00A281 A2 6C                  931 	.word LINK 
                           002203   932 	LINK=.
      00A283 05                     933 	.byte 5 
      00A284 52 46 52 45 45         934 	.ascii "RFREE"
      00A289                        935 RFREE:
      00A289 E6 01            [ 1]  936 	ld a,(1,x)
      00A28B A4 7F            [ 1]  937 	and a,#BLOCK_SIZE-1 
      00A28D B7 26            [ 1]  938 	ld YTEMP,a 
      00A28F A6 80            [ 1]  939 	ld a,#BLOCK_SIZE 
      00A291 B0 26            [ 1]  940 	sub a,YTEMP 
      00A293 90 5F            [ 1]  941 	clrw y 
      00A295 90 97            [ 1]  942 	ld yl,a
      00A297 FF               [ 2]  943 	ldw (x),y 
      00A298 81               [ 4]  944 	ret 
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
      00A299 A2 83                  955 	.word LINK 
                           00221B   956 	LINK=. 
      00A29B 06                     957 	.byte 6
      00A29C 52 41 4D 3E 45 45      958 	.ascii "RAM>EE"
                                    959 	
      00A2A2                        960 RAM2EE:
                                    961 ; copy ud on top 
      00A2A2 90 93            [ 1]  962 	ldw y,x 
      00A2A4 90 EE 06         [ 2]  963 	ldw y,(6,y) ; LSW of ud  
      00A2A7 90 BF 26         [ 2]  964 	ldw YTEMP,y 
      00A2AA 90 93            [ 1]  965 	ldw y,x 
      00A2AC 90 EE 04         [ 2]  966 	ldw y,(4,y)  ; MSW of ud 
      00A2AF 1D 00 04         [ 2]  967 	subw x,#2*CELLL 
      00A2B2 FF               [ 2]  968 	ldw (x),y 
      00A2B3 90 BE 26         [ 2]  969 	ldw y,YTEMP 
      00A2B6 EF 02            [ 2]  970 	ldw (2,x),y 
      00A2B8 CD A2 4B         [ 4]  971 	call ROW2BUF 
      00A2BB 90 93            [ 1]  972 	ldw y,x 
      00A2BD 90 EE 06         [ 2]  973 	ldw y,(6,y)
      00A2C0 90 89            [ 2]  974 	pushw y ; udl 
      00A2C2 90 9F            [ 1]  975 	ld a,yl
      00A2C4 A4 7F            [ 1]  976 	and a,#BLOCK_SIZE-1 
      00A2C6 90 5F            [ 1]  977 	clrw y 
      00A2C8 90 97            [ 1]  978 	ld yl,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 126.
Hexadecimal [24-Bits]



      00A2CA 72 A9 16 80      [ 2]  979 	addw y,#ROWBUFF 
      00A2CE 1D 00 02         [ 2]  980 	subw x,#CELLL 
      00A2D1 FF               [ 2]  981 	ldw (x),y  
      00A2D2 CD 86 A9         [ 4]  982 	call SWAPP ;  ( ud a ra u -- )
      00A2D5 CD 85 B4         [ 4]  983 	call RFROM  
      00A2D8 CD A2 89         [ 4]  984 	call RFREE 
      00A2DB CD 89 FF         [ 4]  985 	call MIN
      00A2DE CD 86 99         [ 4]  986 	call DUPP 
      00A2E1 CD 86 62         [ 4]  987 	call TOR  
      00A2E4 CD 8D AA         [ 4]  988 	call CMOVE
      00A2E7 CD A2 74         [ 4]  989 	call BUF2ROW 
      00A2EA CD 85 B4         [ 4]  990 	call RFROM 
      00A2ED 81               [ 4]  991 	ret 
                                    992 
                                    993 
                                    994 ;--------------------------
                                    995 ; expand 16 bit address 
                                    996 ; to 32 bit address 
                                    997 ; FADDR ( a -- ud )
                                    998 ;--------------------------
      00A2EE A2 9B                  999 	.word LINK 
                           002270  1000 	LINK=. 
      00A2F0 05                    1001 	.byte 5 
      00A2F1 46 41 44 44 52        1002 	.ascii "FADDR"
      00A2F6                       1003 FADDR:
      00A2F6 CC 8C 83         [ 2] 1004 	jp ZERO 
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
      00A2F9 A2 F0                 1020 	.word LINK 
                           00227B  1021 	LINK=.
      00A2FB 05                    1022 	.byte 5 
      00A2FC 46 4D 4F 56 45        1023 	.ascii "FMOVE" 
      00A301                       1024 FMOVE:
      00A301 CD 87 AF         [ 4] 1025 	call TFLASH 
      00A304 CD 85 63         [ 4] 1026 	CALL AT 
      00A307 CD 85 18         [ 4] 1027 	CALL QBRAN 
      00A30A A3 85                 1028 	.word no_move  
      00A30C CD 87 FE         [ 4] 1029 	call CPP
      00A30F CD 85 63         [ 4] 1030 	call AT  
      00A312 CD 86 99         [ 4] 1031 	call DUPP ; ( udl udl -- )
      00A315 CD 87 E2         [ 4] 1032 	call CNTXT 
      00A318 CD 85 63         [ 4] 1033 	call AT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 127.
Hexadecimal [24-Bits]



      00A31B CD 84 EF         [ 4] 1034 	call DOLIT 
      00A31E 00 02                 1035 	.word 2 
      00A320 CD 89 52         [ 4] 1036 	call SUBB ; ( udl udl a -- )
      00A323 CD 86 A9         [ 4] 1037 	call SWAPP 
      00A326 CD A2 F6         [ 4] 1038 	call FADDR 
      00A329 CD 88 5D         [ 4] 1039 	call ROT  ; ( udl ud a -- )
      00A32C CD 86 99         [ 4] 1040 	call DUPP 
      00A32F CD 86 62         [ 4] 1041 	call TOR    ; R: a 
      00A332                       1042 FMOVE2: 
      00A332 CD 8D 5D         [ 4] 1043 	call HERE 
      00A335 CD 85 C5         [ 4] 1044 	call RAT 
      00A338 CD 89 52         [ 4] 1045 	call SUBB ; (udl ud a wl -- )
      00A33B                       1046 next_row:
      00A33B CD 86 99         [ 4] 1047 	call DUPP 
      00A33E CD 86 62         [ 4] 1048 	call TOR  ; ( udl ud a wl -- ) R: a wl
      00A341 CD A2 A2         [ 4] 1049 	call RAM2EE ; ( udl a u -- udl u2 ) u2 is byte written to FLASH 
      00A344 CD 86 99         [ 4] 1050 	call DUPP 
      00A347 CD 86 62         [ 4] 1051 	call TOR
      00A34A CD 88 BC         [ 4] 1052 	call PLUS  ; ( udl+ ) 
      00A34D CD 86 99         [ 4] 1053 	call DUPP 
      00A350 CD 8C 83         [ 4] 1054 	call ZERO   ; ( udl+ ud -- )
      00A353 CD 85 B4         [ 4] 1055 	call RFROM  ; ( udl+ ud u2  R: a wl ) 
      00A356 CD 85 B4         [ 4] 1056 	call RFROM  ; ( udl+ ud u2 wl R: a ) 
      00A359 CD 86 C1         [ 4] 1057 	call OVER   ; ( udl+ ud u2 wl u2 -- )
      00A35C CD 89 52         [ 4] 1058 	call SUBB  ; ( udl+ ud u2 wl- R: a )
      00A35F CD 86 99         [ 4] 1059 	call DUPP 
      00A362 CD 85 18         [ 4] 1060 	call QBRAN
      00A365 A3 7E                 1061 	.word fmove_done 
      00A367 CD 86 A9         [ 4] 1062 	call SWAPP  ; ( udl+ ud wl- u2 R: a )
      00A36A CD 85 B4         [ 4] 1063 	call RFROM ; ( udl+ ud wl- u2 a -- ) 
      00A36D CD 88 BC         [ 4] 1064 	call PLUS  ; ( udl+2 ud wl- a+ )
      00A370 CD 86 99         [ 4] 1065 	call DUPP 
      00A373 CD 86 62         [ 4] 1066 	call TOR   ; ( udl+2 ud wl- a+ ) R: a+
      00A376 CD 86 A9         [ 4] 1067 	call SWAPP 
      00A379 CD 85 34         [ 4] 1068 	call BRAN
      00A37C A3 3B                 1069 	.word next_row  
      00A37E                       1070 fmove_done:	
      00A37E CD 85 B4         [ 4] 1071 	call RFROM  ; ( -- udl+ ud u2 wl- a  )
      00A381 1C 00 0A         [ 2] 1072 	addw x,#5*CELLL ; (  -- cp+ ) new CP 
      00A384 81               [ 4] 1073  	ret  
      00A385                       1074 no_move:
      00A385 CD 8C 83         [ 4] 1075 	call ZERO
      00A388 81               [ 4] 1076 	ret 
                                   1077 
                                   1078 ;------------------------------------------
                                   1079 ; adjust pointers after **FMOVE** operetion.
                                   1080 ; UPDAT-PTR ( cp+ -- )
                                   1081 ; cp+ is new CP position after FMOVE 
                                   1082 ;-------------------------------------------
      00A389 A2 FB                 1083 	.word LINK 
                           00230B  1084 	LINK=.
      00A38B 09                    1085 	.byte 9
      00A38C 55 50 44 41 54 2D 50  1086 	.ascii "UPDAT-PTR" 
             54 52
      00A395                       1087 UPDATPTR:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 128.
Hexadecimal [24-Bits]



                                   1088 ;reset VP to previous position  
      00A395 CD 9D 4F         [ 4] 1089 	call EEPVP 
      002318                       1090 	_DROP 
      00A398 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00A39B CD 85 63         [ 4] 1091 	call AT
      00A39E CD 87 F0         [ 4] 1092 	call VPP 
      00A3A1 CD 85 51         [ 4] 1093 	call STORE
                                   1094 ;update CONTEXT and LAST 
      00A3A4 CD 9D 39         [ 4] 1095 	call EEPCP 
      002327                       1096 	_DROP
      00A3A7 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00A3AA CD 85 63         [ 4] 1097 	call AT
      00A3AD CD 84 EF         [ 4] 1098 	call DOLIT 
      00A3B0 00 02                 1099 	.word 2 
      00A3B2 CD 88 BC         [ 4] 1100 	call PLUS 
      00A3B5 CD 86 99         [ 4] 1101 	call DUPP 
      00A3B8 CD 87 E2         [ 4] 1102 	call CNTXT 
      00A3BB CD 85 51         [ 4] 1103 	call STORE
      00A3BE CD 88 0E         [ 4] 1104 	call LAST
      00A3C1 CD 85 51         [ 4] 1105 	call STORE 
      00A3C4 CD 9D 69         [ 4] 1106 	call UPDATLAST 
                                   1107 ;update CP 
      00A3C7 CD 87 FE         [ 4] 1108 	call CPP 
      00A3CA CD 85 51         [ 4] 1109 	call STORE
      00A3CD CD 9D 92         [ 4] 1110 	call UPDATCP 
      00A3D0 81               [ 4] 1111 	ret 
                                   1112 
                                   1113 ;-----------------------------
                                   1114 ; move interrupt sub-routine
                                   1115 ; in flash memory
                                   1116 ;----------------------------- 
      00A3D1 A3 8B                 1117 	.word LINK 
                           002353  1118 	LINK=. 
      00A3D3 06                    1119 	.byte 6
      00A3D4 49 46 4D 4F 56 45     1120 	.ascii "IFMOVE" 
      00A3DA                       1121 IFMOVE:
      00A3DA CD 87 AF         [ 4] 1122 	call TFLASH 
      00A3DD CD 85 63         [ 4] 1123 	CALL AT 
      00A3E0 CD 85 18         [ 4] 1124 	CALL QBRAN 
      00A3E3 A3 85                 1125 	.word no_move 
      00A3E5 CD 87 FE         [ 4] 1126 	call CPP 
      00A3E8 CD 85 63         [ 4] 1127 	call AT 
      00A3EB CD 86 99         [ 4] 1128 	call DUPP ; ( udl udl -- )
      00A3EE CD 9D 4F         [ 4] 1129 	call EEPVP 
      002371                       1130 	_DROP
      00A3F1 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00A3F4 CD 85 63         [ 4] 1131 	call AT  ; ( udl udl a )
      00A3F7 CD 86 62         [ 4] 1132 	call TOR 
      00A3FA CD A2 F6         [ 4] 1133 	call FADDR
      00A3FD CD 85 C5         [ 4] 1134 	call RAT ; ( udl ud a -- ) R: a 
      00A400 CC A3 32         [ 2] 1135 	jp FMOVE2 
                                   1136 
                                   1137 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 129.
Hexadecimal [24-Bits]



                           000001  4640 .if WANT_SCALING_CONST 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 130.
Hexadecimal [24-Bits]



                                   4641         .include "const_ratio.asm"
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
      00A403 A3 D3                   34         .word LINK 
                           002385    35         LINK=.
      00A405 02                      36         .byte 2
      00A406 50 49                   37         .ascii "PI" 
      00A408                         38 PII:
      00A408 1D 00 04         [ 2]   39         subw x,#2*CELLL 
      00A40B 90 AE 01 63      [ 2]   40         ldw y,#355 
      00A40F EF 02            [ 2]   41         ldw (2,x),y 
      00A411 90 AE 00 71      [ 2]   42         ldw y,#113 
      00A415 FF               [ 2]   43         ldw (x),y 
      00A416 81               [ 4]   44         ret 
                                     45 
                                     46 ;      SQRT2 ( -- 19601  13860 )
                                     47 ; precision: 1.5e-9 
                                     48 ; usage example to compute Voltage peek to peek from Vrms 
                                     49 ; : VPP SQRT2 */ 2 * ;
                                     50 ;
      00A417 A4 05                   51         .word LINK 
                           002399    52         LINK=.
      00A419 05                      53         .byte 5 
      00A41A 53 51 52 54 32          54         .ascii "SQRT2" 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 131.
Hexadecimal [24-Bits]



      00A41F                         55 SQRT2:
      00A41F 1D 00 04         [ 2]   56         subw x,#2*CELLL 
      00A422 90 AE 4C 91      [ 2]   57         ldw y,#19601 
      00A426 EF 02            [ 2]   58         ldw (2,x),y 
      00A428 90 AE 36 24      [ 2]   59         ldw y,#13860 
      00A42C FF               [ 2]   60         ldw (x),y 
      00A42D 81               [ 4]   61         ret 
                                     62 
                                     63 ;   SQRT3 ( -- 18817 10864 )
                                     64 ; precision: 1.1e-9
                                     65 ;
      00A42E A4 19                   66         .word LINK 
                           0023B0    67         LINK=.
      00A430 05                      68         .byte 5
      00A431 53 51 52 54 33          69         .ascii "SQRT3" 
      00A436                         70 SQRT3: 
      00A436 1D 00 04         [ 2]   71     subw x,#2*CELLL 
      00A439 90 AE 49 81      [ 2]   72     ldw y,#18817 
      00A43D EF 02            [ 2]   73     ldw (2,x),y 
      00A43F 90 AE 2A 70      [ 2]   74     ldw y,#10864 
      00A443 FF               [ 2]   75     ldw (x),y 
      00A444 81               [ 4]   76     ret 
                                     77 
                                     78 ;   E ( -- 28667 10546 )
                                     79 ; precision: 5.5e-9 
                                     80 ; natural log base 
      00A445 A4 30                   81         .word LINK 
                           0023C7    82         LINK=.
      00A447 01                      83         .byte 1
      00A448 45                      84         .ascii "E" 
      00A449                         85 ENEPER:
      00A449 1D 00 04         [ 2]   86     subw x,#2*CELLL 
      00A44C 90 AE 6F FB      [ 2]   87     ldw y,#28667 
      00A450 EF 02            [ 2]   88     ldw (2,x),y 
      00A452 90 AE 29 32      [ 2]   89     ldw y,#10546 
      00A456 FF               [ 2]   90     ldw (x),y 
      00A457 81               [ 4]   91     ret 
                                     92 
                                     93 ;   SQRT10 ( -- 22936 7253 )
                                     94 ; precision: 5.7e-9 
      00A458 A4 47                   95         .word LINK 
                           0023DA    96         LINK=.
      00A45A 06                      97         .byte 6 
      00A45B 53 51 52 54 31 30       98         .ascii "SQRT10" 
      00A461                         99 SQRT10:
      00A461 1D 00 04         [ 2]  100     subw x,#2*CELLL
      00A464 90 AE 59 98      [ 2]  101     ldw y,#22936 
      00A468 EF 02            [ 2]  102     ldw (2,x),y 
      00A46A 90 AE 1C 55      [ 2]  103     ldw y,#7253
      00A46E FF               [ 2]  104     ldw (x),y 
      00A46F 81               [ 4]  105     ret 
                                    106 
                                    107 ;   12RT2 ( -- 26797 25293 )
                                    108 ; precision: 1.0e-9 
                                    109 ; used in music to compute well tempered scale
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 132.
Hexadecimal [24-Bits]



      00A470 A4 5A                  110         .word LINK 
                           0023F2   111         LINK=. 
      00A472 05                     112         .byte 5 
      00A473 31 32 52 54 32         113         .ascii "12RT2"
      00A478                        114 RT12_2:
      00A478 1D 00 04         [ 2]  115     subw x,#2*CELLL 
      00A47B 90 AE 68 AD      [ 2]  116     ldw y,#26797
      00A47F EF 02            [ 2]  117     ldw (2,x),y 
      00A481 90 AE 62 CD      [ 2]  118     ldw y,#25293
      00A485 FF               [ 2]  119     ldw (x),y 
      00A486 81               [ 4]  120     ret 
                                    121 
                                    122 ;   LOG2s ( -- 2040 11103 )
                                    123 ; log(2)/1.6384
                                    124 ; precision: 1.1e-8
      00A487 A4 72                  125         .word LINK 
                           002409   126         LINK=.
      00A489 05                     127         .byte 5 
      00A48A 4C 4F 47 32 53         128         .ascii "LOG2S" 
      00A48F                        129 LOG2S:
      00A48F 1D 00 04         [ 2]  130     subw x,#2*CELLL
      00A492 90 AE 07 F8      [ 2]  131     ldw y,#2040 
      00A496 EF 02            [ 2]  132     ldw (2,x),y 
      00A498 90 AE 2B 5F      [ 2]  133     ldw y,#11103 
      00A49C FF               [ 2]  134     ldw (x),y 
      00A49D 81               [ 4]  135     ret 
                                    136 
                                    137 ;   LN2 ( -- 485 11464 )
                                    138 ; ln(2)/16.384 
                                    139 ; precision: 1.0e-7 
      00A49E A4 89                  140         .word LINK 
                           002420   141         LINK=.
      00A4A0 04                     142         .byte 4 
      00A4A1 4C 4E 32 53            143         .ascii "LN2S" 
      00A4A5                        144 LN2S: 
      00A4A5 1D 00 04         [ 2]  145     subw x,#2*CELLL
      00A4A8 90 AE 01 E5      [ 2]  146     ldw y,#485
      00A4AC EF 02            [ 2]  147     ldw (2,x),y 
      00A4AE 90 AE 2C C8      [ 2]  148     ldw y,#11464 
      00A4B2 FF               [ 2]  149     ldw (x),y 
      00A4B3 81               [ 4]  150     ret 
                                    151 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 133.
Hexadecimal [24-Bits]



                                   4642 .endif
                           000001  4643 .if WANT_CONST_TABLE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 134.
Hexadecimal [24-Bits]



                                   4644         .include "ctable.asm"
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
      00A4B4 A4 A0                   34     .word LINK 
                           002436    35     LINK=.
      00A4B6 06                      36     .byte 6
      00A4B7 43 41 4C 4C 4F 54       37     .ascii "CALLOT"
      00A4BD                         38 CALLOT:
      00A4BD CD 87 FE         [ 4]   39     CALL CPP
      00A4C0 CD 86 99         [ 4]   40     CALL DUPP 
      00A4C3 CD 85 63         [ 4]   41     CALL AT 
      00A4C6 CD 86 62         [ 4]   42     CALL TOR 
      00A4C9 CD 8C F3         [ 4]   43     CALL PSTOR 
      00A4CC CD 9D 92         [ 4]   44     CALL UPDATCP 
      00A4CF CD 85 B4         [ 4]   45     CALL RFROM
      00A4D2 CC 8C 83         [ 2]   46     JP ZERO 
                                     47 
                                     48 ;------------------------------
                                     49 ; create constants bytes table 
                                     50 ; in persistant memory
                                     51 ;  CTABLE ( n+ -- ad ; <string> )
                                     52 ; n+ bytes reserved 
                                     53 ;-----------------------------
      00A4D5 A4 B6                   54     .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 135.
Hexadecimal [24-Bits]



                           002457    55     LINK=.
      00A4D7 06                      56     .byte 6
      00A4D8 43 54 41 42 4C 45       57     .ascii "CTABLE"
      00A4DE                         58 CTABLE:
      00A4DE CD A4 BD         [ 4]   59     CALL CALLOT     
      00A4E1 CC 9A 26         [ 2]   60     JP DCONST 
                                     61      
                                     62 
                                     63 ;--------------------------------
                                     64 ; create constants words table 
                                     65 ; in persistant memory 
                                     66 ; WTABLE ( n+ -- ad ; <string> )
                                     67 ; n+  words reserved  
                                     68 ;--------------------------------
      00A4E4 A4 D7                   69     .word LINK 
                           002466    70     LINK=.
      00A4E6 06                      71     .byte 6
      00A4E7 57 54 41 42 4C 45       72     .ascii "WTABLE"
      00A4ED                         73 WTABLE:
      00A4ED CD 8C 0A         [ 4]   74     CALL CELLS  
      00A4F0 CD A4 BD         [ 4]   75     CALL CALLOT 
      00A4F3 CC 9A 26         [ 2]   76     JP DCONST 
                                     77 
                                     78 ;---------------------------------
                                     79 ; stack an element of CTABLE 
                                     80 ; CTABL@ ( u ad -- c )
                                     81 ; u element order {0..size-1}
                                     82 ; a|ad table address 
                                     83 ;--------------------------------
      00A4F6 A4 E6                   84     .word LINK 
                           002478    85     LINK=.
      00A4F8 06                      86     .byte 6
      00A4F9 43 54 41 42 4C 40       87     .ascii "CTABL@" 
      00A4FF                         88 CTAT:
      00A4FF CD 9C D5         [ 4]   89     call FPSTOR 
      00A502 CD 9E 67         [ 4]   90     call PTRPLUS 
      00A505 CC 9E A4         [ 2]   91     jp EE_CREAD 
                                     92 
                                     93 ;---------------------------------
                                     94 ; stack an element of WTABLE 
                                     95 ; WTABL@ ( u ud -- w )
                                     96 ; u is element order {0..size-1}
                                     97 ; a|ud table address 
                                     98 ;----------------------------------
      00A508 A4 F8                   99     .word LINK 
                           00248A   100     LINK=.
      00A50A 06                     101     .byte 6
      00A50B 57 54 41 42 4C 40      102     .ascii "WTABL@" 
      00A511                        103 WTAT:
      00A511 CD 9C D5         [ 4]  104     call FPSTOR 
      00A514 CD 8C 0A         [ 4]  105     call CELLS 
      00A517 CD 9E 67         [ 4]  106     call PTRPLUS 
      00A51A CD 9E 82         [ 4]  107     call EE_READ 
      00A51D 81               [ 4]  108     ret 
                                    109 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 136.
Hexadecimal [24-Bits]



                                    110 ;--------------------------
                                    111 ; tool to initialize character table 
                                    112 ; CTINIT ( ad -- )
                                    113 ; ad is table address 
                                    114 ;--------------------------
      00A51E A5 0A                  115     .word LINK 
                           0024A0   116     LINK=.
      00A520 06                     117     .byte 6 
      00A521 43 54 49 4E 49 54      118     .ascii "CTINIT"
      00A527                        119 CTINIT:
      00A527 CD 9C D5         [ 4]  120     CALL FPSTOR
      00A52A CD 9E 13         [ 4]  121     CALL UNLOCK
      00A52D CD 8C 83         [ 4]  122     CALL ZERO 
      00A530 CD 8C 17         [ 4]  123 1$: CALL ONEP 
      00A533 CD 86 99         [ 4]  124     CALL DUPP 
      00A536 CD A5 83         [ 4]  125     CALL INTQ 
      00A539 CD 85 18         [ 4]  126     CALL QBRAN 
      00A53C A5 46                  127     .word 2$
      00A53E CD 9E BE         [ 4]  128     call WR_BYTE 
      00A541 CD 85 34         [ 4]  129     CALL BRAN 
      00A544 A5 30                  130     .word 1$ 
      0024C6                        131 2$: _DDROP 
      00A546 1C 00 04         [ 2]    1    ADDW X,#2*CELLL 
      00A549 CD 9E 3B         [ 4]  132     CALL LOCK 
      00A54C 81               [ 4]  133     ret 
                                    134 
                                    135 ;--------------------------
                                    136 ; tool to initialize word table 
                                    137 ; WTINIT ( ad -- )
                                    138 ; ad is table address 
                                    139 ;--------------------------
      00A54D A5 20                  140     .word LINK 
                           0024CF   141     LINK=.
      00A54F 06                     142     .byte 6 
      00A550 57 54 49 4E 49 54      143     .ascii "WTINIT"
      00A556                        144 WTINIT:
      00A556 CD 9C D5         [ 4]  145     CALL FPSTOR
      00A559 CD 9E 13         [ 4]  146     CALL UNLOCK
      00A55C CD 8C 83         [ 4]  147     CALL ZERO 
      00A55F CD 8C 17         [ 4]  148 1$: CALL ONEP 
      00A562 CD 86 99         [ 4]  149     CALL DUPP
      00A565 CD A5 83         [ 4]  150     CALL INTQ
      00A568 CD 85 18         [ 4]  151     CALL QBRAN 
      00A56B A5 75                  152     .word 2$
      00A56D CD 9E E3         [ 4]  153     call WR_WORD 
      00A570 CD 85 34         [ 4]  154     CALL BRAN 
      00A573 A5 5F                  155     .word 1$ 
      0024F5                        156 2$: _DDROP 
      00A575 1C 00 04         [ 2]    1    ADDW X,#2*CELLL 
      00A578 CD 9E 3B         [ 4]  157     CALL LOCK 
      00A57B 81               [ 4]  158     ret 
                                    159 
                                    160 ;------------------------
                                    161 ; Prompted input for integer 
                                    162 ; display n+ in bracket and
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 137.
Hexadecimal [24-Bits]



                                    163 ; '?' 
                                    164 ; [N]? ( n+ -- a )
                                    165 ;------------------------
      00A57C A5 4F                  166     .word LINK 
                           0024FE   167     LINK=.
      00A57E 04                     168     .byte 4
      00A57F 5B 4E 5D 3F            169     .ascii "[N]?" 
      00A583                        170 INTQ:
      00A583 CD 90 09         [ 4]  171     CALL CR 
      00A586 CD 84 EF         [ 4]  172     call DOLIT 
      00A589 00 5B                  173     .word '[
      00A58B CD 84 B6         [ 4]  174     CALL EMIT 
      00A58E CD 90 AF         [ 4]  175     CALL DOT 
      00A591 CD 90 36         [ 4]  176     CALL  DOTQP
      00A594 03                     177     .byte 3
      00A595 5D 3F 20               178     .ascii "]? " 
      00A598 CD 94 3F         [ 4]  179     CALL QUERY 
      00A59B CD 92 6A         [ 4]  180     call TOKEN 
      00A59E CC A6 5A         [ 2]  181     jp NUMBQ
                                    182 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 138.
Hexadecimal [24-Bits]



                                   4645 .endif
                           000001  4646 .if WANT_DOUBLE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 139.
Hexadecimal [24-Bits]



                                   4647         .include "double.asm"
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
      002521                         35     _HEADER DBLVER,7,"DBL-VER"
      00A5A1 A5 7E                    1         .word LINK 
                           002523     2         LINK=.
      00A5A3 07                       3         .byte 7  
      00A5A4 44 42 4C 2D 56 45 52     4         .ascii "DBL-VER"
      00A5AB                          5         DBLVER:
      00A5AB CD 90 09         [ 4]   36     CALL CR 
      00A5AE CD 90 36         [ 4]   37     CALL DOTQP 
      00A5B1 18                      38     .byte  24 
      00A5B2 64 6F 75 62 6C 65 20    39     .ascii "double integer library, "
             69 6E 74 65 67 65 72
             20 6C 69 62 72 61 72
             79 2C 20
      00A5CA CD 9B D5         [ 4]   40     CALL PRT_LICENCE
      00A5CD CD 9B AD         [ 4]   41     CALL COPYRIGHT  
      002550                         42     _DOLIT DVER_MAJOR 
      00A5D0 CD 84 EF         [ 4]    1     CALL DOLIT 
      00A5D3 00 01                    2     .word DVER_MAJOR 
      002555                         43     _DOLIT DVER_MINOR  
      00A5D5 CD 84 EF         [ 4]    1     CALL DOLIT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 140.
Hexadecimal [24-Bits]



      00A5D8 00 00                    2     .word DVER_MINOR 
      00A5DA CC 9B E9         [ 2]   44     JP PRINT_VERSION  
                                     45 
                                     46 
                                     47 ; check for negative sign 
                                     48 ; ajust pointer and cntr 
      00A5DD                         49 nsign: ; addr cntr -- addr cntr f 
      00A5DD 1D 00 02         [ 2]   50     SUBW X,#CELLL ; a cntr f 
      00A5E0 90 93            [ 1]   51     LDW Y,X 
      00A5E2 90 EE 04         [ 2]   52     LDW Y,(4,Y) ; addr 
      00A5E5 90 F6            [ 1]   53     LD A,(Y) ; char=*addr  
      00A5E7 A1 2D            [ 1]   54     CP A,#'-' 
      00A5E9 27 03            [ 1]   55     JREQ NEG_SIGN 
      00A5EB 4F               [ 1]   56     CLR A  
      00A5EC 20 18            [ 2]   57     JRA STO_SIGN 
      00A5EE                         58 NEG_SIGN:
                                     59 ; increment addr 
      00A5EE 90 93            [ 1]   60     LDW Y,X 
      00A5F0 90 EE 04         [ 2]   61     LDW Y,(4,Y)
      00A5F3 72 A9 00 01      [ 2]   62     ADDW Y,#1   ;addr+1 
      00A5F7 EF 04            [ 2]   63     LDW (4,X),Y 
                                     64 ; decrement cntr 
      00A5F9 90 93            [ 1]   65     LDW Y,X
      00A5FB 90 EE 02         [ 2]   66     LDW Y,(2,Y)
      00A5FE 72 A2 00 01      [ 2]   67     SUBW Y,#1   ;cntr-1 
      00A602 EF 02            [ 2]   68     LDW (2,X),Y 
      00A604 A6 FF            [ 1]   69     LD A,#0XFF
      00A606                         70 STO_SIGN:   
      00A606 F7               [ 1]   71     LD (X),A 
      00A607 E7 01            [ 1]   72     LD (1,X),A 
      00A609 81               [ 4]   73     RET 
                                     74 
                                     75 
                                     76 ; get all digits in row 
                                     77 ; stop at first non-digit or end of string 
                                     78 ; ( dlo dhi a cntr -- dlo dhi [ a+ cntr- | a+ 0 ] )
      00A60A                         79 parse_digits:
      00A60A                         80 1$:
      00A60A CD 86 99         [ 4]   81     CALL DUPP 
      00258D                         82     _QBRAN 5$ 
      00A60D CD 85 18         [ 4]    1     CALL QBRAN
      00A610 A6 4F                    2     .word 5$
      00A612 CD 86 62         [ 4]   83     CALL TOR   ; dlo dhi a R: cntr 
      00A615 CD 8D 46         [ 4]   84     CALL COUNT ; dlo dhi a+ char 
      00A618 CD 87 5F         [ 4]   85     CALL BASE 
      00A61B CD 85 63         [ 4]   86     CALL AT 
      00A61E CD 8F 4F         [ 4]   87     CALL DIGTQ 
      0025A1                         88     _QBRAN 4$ ; not a digit
      00A621 CD 85 18         [ 4]    1     CALL QBRAN
      00A624 A6 46                    2     .word 4$
      00A626 CD A9 8A         [ 4]   89     CALL DTOR  ; dlo dhi R: cntr a+ c  
      00A629 CD 87 5F         [ 4]   90     CALL BASE 
      00A62C CD 85 63         [ 4]   91     CALL AT 
      00A62F CD A8 15         [ 4]   92     CALL DSSTAR
      00A632 CD 85 B4         [ 4]   93     CALL RFROM 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 141.
Hexadecimal [24-Bits]



      00A635 CD 8C 83         [ 4]   94     CALL ZERO 
      00A638 CD AC 64         [ 4]   95     CALL DPLUS 
      00A63B CD 85 B4         [ 4]   96     CALL RFROM  ; dlo dhi a+ 
      00A63E CD 85 B4         [ 4]   97     CALL RFROM ; dlo dhi a+ cntr 
      00A641 CD 8C 24         [ 4]   98     CALL ONEM 
      00A644 20 C4            [ 2]   99     JRA 1$ ; dlo dhi a+ R: 
      0025C6                        100 4$: _DROP  ; dlo dhi a+ 
      00A646 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00A649 CD 8C 24         [ 4]  101     CALL ONEM  ; unget char 
      00A64C CD 85 B4         [ 4]  102     CALL RFROM ; dlo dhi a+ cntr-
      00A64F                        103 5$:
      00A64F 81               [ 4]  104     RET 
                                    105 
                                    106 
                                    107 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    108 ;   NUMBER? (a -- s -1 |d -2 | a F )
                                    109 ;   convert string to integer 
                                    110 ;   double begin with '#' 
                                    111 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0025D0                        112     _HEADER NUMBQ,7,"NUMBER?"
      00A650 A5 A3                    1         .word LINK 
                           0025D2     2         LINK=.
      00A652 07                       3         .byte 7  
      00A653 4E 55 4D 42 45 52 3F     4         .ascii "NUMBER?"
      00A65A                          5         NUMBQ:
                                    113 ; save current base value 
      00A65A CD 87 5F         [ 4]  114     CALL BASE 
      00A65D CD 85 63         [ 4]  115     CALL AT 
      00A660 CD 86 62         [ 4]  116     CALL TOR 
                                    117 ; initialize integer to 0     
      00A663 1D 00 04         [ 2]  118     SUBW X,#4 
      00A666 90 5F            [ 1]  119     CLRW Y 
      00A668 FF               [ 2]  120     LDW (X),Y 
      00A669 EF 02            [ 2]  121     LDW (2,X),Y ; a 0 0 R: base  
      0025EB                        122     _DOLIT 2 
      00A66B CD 84 EF         [ 4]    1     CALL DOLIT 
      00A66E 00 02                    2     .word 2 
      00A670 CD 8C DC         [ 4]  123     CALL PICK  ; a 0 0 a R: base    
      00A673 CD 8D 46         [ 4]  124     CALL COUNT ; a 0 0 a+ n 
                                    125 ; check for '#' double integer 
      00A676 CD 86 C1         [ 4]  126     CALL OVER  ; a 0 0 a+ n a+
      00A679 CD 85 81         [ 4]  127     CALL CAT   ; a 0 0 a+ n c 
      0025FC                        128     _DOLIT '#' ; a 0 0 a+ n c '#' 
      00A67C CD 84 EF         [ 4]    1     CALL DOLIT 
      00A67F 00 23                    2     .word '#' 
      00A681 CD 89 7A         [ 4]  129     CALL EQUAL 
      00A684 CD 86 62         [ 4]  130     CALL TOR   ; a 0 0 a+ n R: base d? 
      00A687 CD 85 C5         [ 4]  131     CALL RAT   ; a 0 0 a+ n d? R: base d?
      00260A                        132     _QBRAN NUMQ0
      00A68A CD 85 18         [ 4]    1     CALL QBRAN
      00A68D A6 9B                    2     .word NUMQ0
                                    133 ; update a and count
      00A68F CD 86 A9         [ 4]  134     CALL SWAPP 
      00A692 CD 8C 17         [ 4]  135     CALL ONEP 
      00A695 CD 86 A9         [ 4]  136     CALL SWAPP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 142.
Hexadecimal [24-Bits]



      00A698 CD 8C 24         [ 4]  137     CALL ONEM  ; a 0 0 a+ n- R: base d?
                                    138 ; check for '$' hexadecimal  
      00A69B                        139 NUMQ0: 
      00A69B CD 86 C1         [ 4]  140     CALL OVER   
      00A69E CD 85 81         [ 4]  141     CALL CAT   
      002621                        142     _DOLIT '$'
      00A6A1 CD 84 EF         [ 4]    1     CALL DOLIT 
      00A6A4 00 24                    2     .word '$' 
      00A6A6 CD 89 7A         [ 4]  143     CALL EQUAL ; a 0 0 a+ n- f  
      002629                        144     _QBRAN NUMQ1 
      00A6A9 CD 85 18         [ 4]    1     CALL QBRAN
      00A6AC A6 BD                    2     .word NUMQ1
      00A6AE CD 8F 26         [ 4]  145     CALL HEX   ; switch to hexadecimal base 
                                    146 ; update a and count 
      00A6B1 CD 86 A9         [ 4]  147     CALL SWAPP 
      00A6B4 CD 8C 17         [ 4]  148     CALL ONEP 
      00A6B7 CD 86 A9         [ 4]  149     CALL SWAPP
      00A6BA CD 8C 24         [ 4]  150     CALL ONEM ; a 0 0 a+ n-  R: base d?
                                    151 ; check for minus sign 
      00A6BD                        152 NUMQ1: 
      00A6BD CD A5 DD         [ 4]  153     CALL nsign 
      00A6C0 CD 86 62         [ 4]  154     CALL TOR ; R: base d? sign  
                                    155 ; check for end of string     
      00A6C3 CD 88 4C         [ 4]  156     CALL QDUP    ; a dlo dhi a+ cntr R: base d? sign 
      002646                        157     _QBRAN NUMQ4 ; yes , not a number 
      00A6C6 CD 85 18         [ 4]    1     CALL QBRAN
      00A6C9 A7 05                    2     .word NUMQ4
      00A6CB CD A6 0A         [ 4]  158     CALL parse_digits
      00A6CE CD 88 4C         [ 4]  159     CALL QDUP 
      00A6D1 CD 86 E2         [ 4]  160     CALL ZEQUAL  
      002654                        161     _QBRAN NUMQ4 ; error not end of string  ( a dlo dhi a+ R: base d? sign )
      00A6D4 CD 85 18         [ 4]    1     CALL QBRAN
      00A6D7 A7 05                    2     .word NUMQ4
      002659                        162     _DROP  ; a dlo dhi 
      00A6D9 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00A6DC CD 85 B4         [ 4]  163     CALL RFROM  ; a dlo dhi sign 
      00265F                        164     _QBRAN NUMQ3
      00A6DF CD 85 18         [ 4]    1     CALL QBRAN
      00A6E2 A6 E7                    2     .word NUMQ3
      00A6E4 CD 89 18         [ 4]  165     CALL DNEGA
      00A6E7                        166 NUMQ3: 
      00A6E7 CD 88 5D         [ 4]  167     CALL ROT ; dlo dhi a  R: base d?
      00266A                        168     _DROP
      00A6EA 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00266D                        169     _DOLIT -2  ; double return -2 flag 
      00A6ED CD 84 EF         [ 4]    1     CALL DOLIT 
      00A6F0 FF FE                    2     .word -2 
      00A6F2 CD 85 B4         [ 4]  170     CALL RFROM ; dlo dhi d? R: base 
      002675                        171     _TBRAN NUMQ8 
      00A6F5 CD 85 26         [ 4]    1     CALL TBRAN 
      00A6F8 A7 0E                    2     .word NUMQ8 
      00A6FA CD 86 A9         [ 4]  172     CALL SWAPP 
      00267D                        173     _DROP
      00A6FD 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00A700 CD 8C 17         [ 4]  174     CALL ONEP   ; single return -1 flag   
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 143.
Hexadecimal [24-Bits]



      00A703 20 09            [ 2]  175     JRA NUMQ8
      00A705                        176 NUMQ4: ; not end of string error , ( a dlo dhi a+ cntr R: base d? sign )
                           000001   177 .if WANT_FLOAT
      00A705 CD 85 B4         [ 4]  178     CALL RFROM ; sign 
      00A708 CD 85 B4         [ 4]  179     CALL RFROM ; d? 
      00A70B CD B0 33         [ 4]  180     CALL FLOATQ ; ( a dlo dhi a+ cntr sign d? )    
                           000000   181 .else 
                                    182     ADDW X,#4 ; drop dhi a+  , ( a dlo R: base d? sign ) 
                                    183     ADDW SP,#4 ; drop d? sign  R: base 
                                    184     CLRW Y 
                                    185     LDW (X),Y ; dlo replaced by 0 ( -- a 0 R: base ) 
                                    186 .endif 
                                    187 ; restore original base value     
      00A70E                        188 NUMQ8: 
      00A70E CD 85 B4         [ 4]  189     CALL RFROM 
      00A711 CD 87 5F         [ 4]  190     CALL BASE 
      00A714 CD 85 51         [ 4]  191     CALL STORE 
      00A717 81               [ 4]  192     RET 
                                    193 
                                    194 
                                    195 
                                    196 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    197 ;   DABS ( d -- d )
                                    198 ;   absolute value of double
                                    199 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002698                        200     _HEADER DABS,4,"DABS"
      00A718 A6 52                    1         .word LINK 
                           00269A     2         LINK=.
      00A71A 04                       3         .byte 4  
      00A71B 44 41 42 53              4         .ascii "DABS"
      00A71F                          5         DABS:
      00A71F F6               [ 1]  201     LD A,(X) 
      00A720 A4 80            [ 1]  202     AND A,#0X80 
      00A722 27 03            [ 1]  203     JREQ DABS1 
      00A724 CD 89 18         [ 4]  204     CALL DNEGA 
      00A727                        205 DABS1:
      00A727 81               [ 4]  206     RET 
                                    207 
                                    208 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    209 ;  DSIGN ( d -- d f )
                                    210 ;  sign of double 
                                    211 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0026A8                        212     _HEADER DSIGN,5,"DSIGN"
      00A728 A7 1A                    1         .word LINK 
                           0026AA     2         LINK=.
      00A72A 05                       3         .byte 5  
      00A72B 44 53 49 47 4E           4         .ascii "DSIGN"
      00A730                          5         DSIGN:
      00A730 A6 00            [ 1]  213     LD A,#0 
      00A732 90 93            [ 1]  214     LDW Y,X 
      00A734 90 FE            [ 2]  215     LDW Y,(Y)
      00A736 2A 02            [ 1]  216     JRPL DSIGN1
      00A738 A6 FF            [ 1]  217     LD A,#0XFF 
      00A73A                        218 DSIGN1:
      00A73A 1D 00 02         [ 2]  219     SUBW X,#2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 144.
Hexadecimal [24-Bits]



      00A73D F7               [ 1]  220     LD (X),A 
      00A73E E7 01            [ 1]  221     LD (1,X),A 
      00A740 81               [ 4]  222     RET 
                                    223 
                                    224 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    225 ;   DS/MOD ( ud us - ur qud )
                                    226 ;   unsigned divide double by single 
                                    227 ;   return double quotient 
                                    228 ;   and single remainder 
                                    229 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0026C1                        230     _HEADER DSLMOD,6,"DS/MOD"
      00A741 A7 2A                    1         .word LINK 
                           0026C3     2         LINK=.
      00A743 06                       3         .byte 6  
      00A744 44 53 2F 4D 4F 44        4         .ascii "DS/MOD"
      00A74A                          5         DSLMOD:
      00A74A 90 93            [ 1]  231         LDW     Y,X             ; stack pointer to Y
      00A74C FE               [ 2]  232         LDW     X,(X)           ; un
      00A74D BF 26            [ 2]  233         LDW     YTEMP,X         ; save un
      00A74F 93               [ 1]  234         LDW     X,Y
      00A750 89               [ 2]  235         PUSHW   X               ; save stack pointer
      00A751 90 89            [ 2]  236         PUSHW   Y 
      00A753 EE 02            [ 2]  237         LDW     X,(2,X)           ; X=udh
      00A755 90 BE 26         [ 2]  238         LDW     Y,YTEMP         ; divisor 
      00A758 65               [ 2]  239         DIVW    X,Y 
      00A759 BF 24            [ 2]  240         LDW     XTEMP,X         ; QUOTIENT hi 
      00A75B 93               [ 1]  241         LDW     X,Y             ; remainder in X 
      00A75C 90 85            [ 2]  242         POPW    Y 
      00A75E 90 EE 04         [ 2]  243         LDW     Y,(4,Y)         ; Y=udl (offset before drop)
      00A761 A6 10            [ 1]  244         LD      A,#16           ; loop count
      00A763 90 58            [ 2]  245         SLLW    Y               ; udl shift udl into udh
      00A765                        246 DSLMOD3:
      00A765 59               [ 2]  247         RLCW    X               ; rotate udl bit into uhdh (= remainder)
      00A766 25 04            [ 1]  248         JRC     DSLMODa         ; if carry out of rotate
      00A768 B3 26            [ 2]  249         CPW     X,YTEMP         ; compare udh to un
      00A76A 25 05            [ 1]  250         JRULT   DSLMOD4         ; can't subtract
      00A76C                        251 DSLMODa:
      00A76C 72 B0 00 26      [ 2]  252         SUBW    X,YTEMP         ; can subtract
      00A770 98               [ 1]  253         RCF
      00A771                        254 DSLMOD4:
      00A771 8C               [ 1]  255         CCF                     ; quotient bit
      00A772 90 59            [ 2]  256         RLCW    Y               ; rotate into quotient, rotate out udl
      00A774 4A               [ 1]  257         DEC     A               ; repeat
      00A775 26 EE            [ 1]  258         JRNE    DSLMOD3           ; if A == 0
      00A777                        259 DSLMODb:
      00A777 BF 26            [ 2]  260         LDW     YTEMP,X         ; done, save remainder
      00A779 85               [ 2]  261         POPW    X               ; restore stack pointer
      00A77A EF 02            [ 2]  262         LDW     (2,X),Y           ; save quotient low 
      00A77C 90 BE 24         [ 2]  263         LDW     Y,XTEMP         ; quotient hi 
      00A77F FF               [ 2]  264         LDW     (X),Y           ; save quotient hi 
      00A780 90 BE 26         [ 2]  265         LDW     Y,YTEMP         ; remainder onto stack
      00A783 EF 04            [ 2]  266         LDW     (4,X),Y
      00A785 81               [ 4]  267         RET 
                                    268 
                                    269 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 145.
Hexadecimal [24-Bits]



                                    270 ;   D# ( d -- d )
                                    271 ;   extract least digit 
                                    272 ;   from double integer 
                                    273 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002706                        274     _HEADER DDIG,2,"D#"
      00A786 A7 43                    1         .word LINK 
                           002708     2         LINK=.
      00A788 02                       3         .byte 2  
      00A789 44 23                    4         .ascii "D#"
      00A78B                          5         DDIG:
      00A78B CD 87 5F         [ 4]  275     CALL BASE 
      00A78E CD 85 63         [ 4]  276     CALL AT 
      00A791 CD A7 4A         [ 4]  277     CALL DSLMOD
      00A794 CD 88 5D         [ 4]  278     CALL ROT   
      00A797 CD 8E 4F         [ 4]  279     CALL DIGIT 
      00A79A CD 8E 9B         [ 4]  280     CALL HOLD 
      00A79D 81               [ 4]  281     RET 
                                    282 
                                    283 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    284 ;    D#S ( d -- s )
                                    285 ;   extract digit from double 
                                    286 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00271E                        287     _HEADER DDIGS,3,"D#S"
      00A79E A7 88                    1         .word LINK 
                           002720     2         LINK=.
      00A7A0 03                       3         .byte 3  
      00A7A1 44 23 53                 4         .ascii "D#S"
      00A7A4                          5         DDIGS:
      00A7A4 CD A7 8B         [ 4]  288     CALL    DDIG 
      00A7A7 CD 88 A7         [ 4]  289     CALL    DDUP 
      00A7AA CD A9 10         [ 4]  290     CALL    DZEQUAL
      00272D                        291     _QBRAN  DDIGS 
      00A7AD CD 85 18         [ 4]    1     CALL QBRAN
      00A7B0 A7 A4                    2     .word DDIGS
      00A7B2 CD 86 8F         [ 4]  292     CALL    DROP 
      00A7B5 81               [ 4]  293     RET 
                                    294 
                                    295 
                                    296 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    297 ;   D. ( d -- )
                                    298 ;   display double integer 
                                    299 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002736                        300     _HEADER DDOT,2,"D."
      00A7B6 A7 A0                    1         .word LINK 
                           002738     2         LINK=.
      00A7B8 02                       3         .byte 2  
      00A7B9 44 2E                    4         .ascii "D."
      00A7BB                          5         DDOT:
      00A7BB CD 8F C7         [ 4]  301     CALL SPACE 
      00A7BE CD A7 30         [ 4]  302     CALL DSIGN 
      00A7C1 CD 86 62         [ 4]  303     CALL TOR
      00A7C4 CD 85 C5         [ 4]  304     CALL RAT 
      002747                        305     _QBRAN DDOT0
      00A7C7 CD 85 18         [ 4]    1     CALL QBRAN
      00A7CA A7 CF                    2     .word DDOT0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 146.
Hexadecimal [24-Bits]



      00A7CC CD 89 18         [ 4]  306     CALL DNEGA 
      00A7CF                        307 DDOT0:     
      00A7CF CD 8E 8B         [ 4]  308     CALL BDIGS 
      00A7D2 CD A7 A4         [ 4]  309     CALL DDIGS 
      00A7D5 CD 85 B4         [ 4]  310     CALL RFROM 
      002758                        311     _QBRAN DDOT1 
      00A7D8 CD 85 18         [ 4]    1     CALL QBRAN
      00A7DB A7 E5                    2     .word DDOT1
      00275D                        312     _DOLIT '-' 
      00A7DD CD 84 EF         [ 4]    1     CALL DOLIT 
      00A7E0 00 2D                    2     .word '-' 
      00A7E2 CD 8E 9B         [ 4]  313     CALL HOLD 
      00A7E5                        314 DDOT1: 
      00A7E5 CD 8E F0         [ 4]  315     CALL EDIGS 
      00A7E8 CD 8F F1         [ 4]  316     CALL TYPES     
      00A7EB 81               [ 4]  317     RET 
                                    318 
                                    319 
                                    320 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    321 ;  UDS* ( ud u -- ud*u )
                                    322 ;  uint32*uint16 
                                    323 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00276C                        324     _HEADER UDSSTAR,4,"UDS*"
      00A7EC A7 B8                    1         .word LINK 
                           00276E     2         LINK=.
      00A7EE 04                       3         .byte 4  
      00A7EF 55 44 53 2A              4         .ascii "UDS*"
      00A7F3                          5         UDSSTAR:
      00A7F3 CD 86 62         [ 4]  325     CALL TOR 
      00A7F6 CD 86 A9         [ 4]  326     CALL SWAPP 
      00A7F9 CD 85 C5         [ 4]  327     CALL RAT 
      00A7FC CD 8B 4C         [ 4]  328     CALL UMSTA ; udlo*u 
      00A7FF CD 88 5D         [ 4]  329     CALL ROT 
      00A802 CD 85 B4         [ 4]  330     CALL RFROM 
      00A805 CD 8B 4C         [ 4]  331     CALL UMSTA ; udhi*u 
      002788                        332     _DROP  ; drop overflow 
      00A808 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00A80B CD 88 BC         [ 4]  333     CALL PLUS  ; udlo*u+(uhi*u<<16)
      00A80E 81               [ 4]  334     RET 
                                    335 
                                    336 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    337 ; multiply double by unsigned single 
                                    338 ; return double 
                                    339 ;  ( d u -- d )
                                    340 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00278F                        341     _HEADER DSSTAR,3,"DS*"
      00A80F A7 EE                    1         .word LINK 
                           002791     2         LINK=.
      00A811 03                       3         .byte 3  
      00A812 44 53 2A                 4         .ascii "DS*"
      00A815                          5         DSSTAR:
                                    342 ;DSSTAR:
      00A815 CD 86 62         [ 4]  343     CALL TOR
      00A818 CD A7 30         [ 4]  344     CALL DSIGN 
      00A81B CD 88 7C         [ 4]  345     CALL NROT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 147.
Hexadecimal [24-Bits]



      00A81E CD A7 1F         [ 4]  346     CALL DABS
      00A821 CD 85 B4         [ 4]  347     CALL RFROM 
      00A824 CD A7 F3         [ 4]  348     CALL UDSSTAR  
      00A827 CD 88 5D         [ 4]  349     CALL ROT 
      0027AA                        350     _QBRAN DSSTAR3 
      00A82A CD 85 18         [ 4]    1     CALL QBRAN
      00A82D A8 32                    2     .word DSSTAR3
      00A82F CD 89 18         [ 4]  351     CALL DNEGA 
      00A832                        352 DSSTAR3:
      00A832 81               [ 4]  353     RET 
                                    354 
                                    355 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    356 ;  2SWAP ( d1 d2 -- d2 d1 )
                                    357 ;  swap double 
                                    358 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0027B3                        359     _HEADER DSWAP,5,"2SWAP"
      00A833 A8 11                    1         .word LINK 
                           0027B5     2         LINK=.
      00A835 05                       3         .byte 5  
      00A836 32 53 57 41 50           4         .ascii "2SWAP"
      00A83B                          5         DSWAP:
      00A83B 90 93            [ 1]  360     LDW Y,X 
      00A83D 90 FE            [ 2]  361     LDW Y,(Y)
      00A83F 90 BF 26         [ 2]  362     LDW YTEMP,Y ; d2 hi 
      00A842 90 93            [ 1]  363     LDW Y,X 
      00A844 90 EE 02         [ 2]  364     LDW Y,(2,Y)
      00A847 90 BF 24         [ 2]  365     LDW XTEMP,Y  ; d2 lo 
      00A84A 90 93            [ 1]  366     LDW Y,X 
      00A84C 90 EE 04         [ 2]  367     LDW Y,(4,Y)  ; d1 hi 
      00A84F FF               [ 2]  368     LDW (X),Y 
      00A850 90 93            [ 1]  369     LDW Y,X
      00A852 90 EE 06         [ 2]  370     LDW Y,(6,Y)  ; d1 lo 
      00A855 EF 02            [ 2]  371     LDW (2,X),Y
      00A857 90 BE 26         [ 2]  372     LDW Y,YTEMP  
      00A85A EF 04            [ 2]  373     LDW (4,X),Y 
      00A85C 90 BE 24         [ 2]  374     LDW Y,XTEMP 
      00A85F EF 06            [ 2]  375     LDW (6,X),Y 
      00A861 81               [ 4]  376     RET 
                                    377 
                                    378 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    379 ;    DCLZ ( d -- u )
                                    380 ;    double count leading zeros
                                    381 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0027E2                        382     _HEADER DCLZ,4,"DCLZ"
      00A862 A8 35                    1         .word LINK 
                           0027E4     2         LINK=.
      00A864 04                       3         .byte 4  
      00A865 44 43 4C 5A              4         .ascii "DCLZ"
      00A869                          5         DCLZ:
      00A869 4F               [ 1]  383     CLR A 
      00A86A 90 93            [ 1]  384     LDW Y,X 
      00A86C 90 FE            [ 2]  385     LDW Y,(Y)
      00A86E 2B 18            [ 1]  386     JRMI DCLZ8 ; no leading zero 
      00A870 27 09            [ 1]  387     JREQ DCLZ4 ; >=16 
      00A872                        388 DCLZ1: ; <16
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 148.
Hexadecimal [24-Bits]



      00A872 90 58            [ 2]  389     SLLW Y
      00A874 4C               [ 1]  390     INC A 
      00A875 90 5D            [ 2]  391     TNZW Y 
      00A877 2B 0F            [ 1]  392     JRMI DCLZ8
      00A879 20 F7            [ 2]  393     JRA DCLZ1 
      00A87B                        394 DCLZ4: ; >=16 
      00A87B A6 10            [ 1]  395     LD A,#16 
      00A87D 90 93            [ 1]  396     LDW Y,X 
      00A87F 90 EE 02         [ 2]  397     LDW Y,(2,Y)
      00A882 2B 04            [ 1]  398     JRMI DCLZ8 
      00A884 26 EC            [ 1]  399     JRNE DCLZ1 
      00A886 AB 10            [ 1]  400     ADD A,#16
      00A888                        401 DCLZ8: 
      00A888 1C 00 02         [ 2]  402     ADDW X,#2 
      00A88B 90 5F            [ 1]  403     CLRW Y 
      00A88D 90 97            [ 1]  404     LD YL,A 
      00A88F FF               [ 2]  405     LDW (X),Y 
      00A890 81               [ 4]  406     RET 
                                    407 
                                    408 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    409 ;   <2ROT ( d1 d2 d3 -- d3 d1 d2 )
                                    410 ;   rotate left doubles 
                                    411 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002811                        412     _HEADER NDROT,5,"<2ROT"
      00A891 A8 64                    1         .word LINK 
                           002813     2         LINK=.
      00A893 05                       3         .byte 5  
      00A894 3C 32 52 4F 54           4         .ascii "<2ROT"
      00A899                          5         NDROT:
                                    413 ; save d3 in temp 
      00A899 90 93            [ 1]  414     LDW Y,X 
      00A89B 90 FE            [ 2]  415     LDW Y,(Y)
      00A89D 90 BF 26         [ 2]  416     LDW YTEMP,Y  ; d3 hi 
      00A8A0 90 93            [ 1]  417     LDW Y,X 
      00A8A2 90 EE 02         [ 2]  418     LDW Y,(2,Y)
      00A8A5 90 BF 24         [ 2]  419     LDW XTEMP,Y  ; d3 lo 
                                    420 ; put d2 in d1 slot 
      00A8A8 90 93            [ 1]  421     LDW Y,X 
      00A8AA 90 EE 04         [ 2]  422     LDW Y,(4,Y) 
      00A8AD FF               [ 2]  423     LDW (X),Y   ; d2 hi 
      00A8AE 90 93            [ 1]  424     LDW Y,X 
      00A8B0 90 EE 06         [ 2]  425     LDW Y,(6,Y)
      00A8B3 EF 02            [ 2]  426     LDW (2,X),Y ; d2 lo
                                    427 ; put d1 in d2 slot 
      00A8B5 90 93            [ 1]  428     LDW Y,X 
      00A8B7 90 EE 08         [ 2]  429     LDW Y,(8,Y) 
      00A8BA EF 04            [ 2]  430     LDW (4,X),Y ; d1 hi 
      00A8BC 90 93            [ 1]  431     LDW Y,X 
      00A8BE 90 EE 0A         [ 2]  432     LDW Y,(10,Y)
      00A8C1 EF 06            [ 2]  433     LDW (6,X),Y  ; d1 lo 
                                    434 ; put d3 in d1 slot 
      00A8C3 90 BE 26         [ 2]  435     LDW Y,YTEMP 
      00A8C6 EF 08            [ 2]  436     LDW (8,X),Y  ; d3 hi 
      00A8C8 90 BE 24         [ 2]  437     LDW Y,XTEMP 
      00A8CB EF 0A            [ 2]  438     LDW (10,X),Y  ; d3 lo 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 149.
Hexadecimal [24-Bits]



      00A8CD 81               [ 4]  439     RET 
                                    440 
                                    441 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    442 ;   2ROT ( d1 d2 d3 -- d2 d3 d1 )
                                    443 ;   rotate right doubles 
                                    444 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00284E                        445     _HEADER DROT,4,"2ROT"
      00A8CE A8 93                    1         .word LINK 
                           002850     2         LINK=.
      00A8D0 04                       3         .byte 4  
      00A8D1 32 52 4F 54              4         .ascii "2ROT"
      00A8D5                          5         DROT:
                                    446 ; save d3 in temp 
      00A8D5 90 93            [ 1]  447     LDW Y,X 
      00A8D7 90 FE            [ 2]  448     LDW Y,(Y)
      00A8D9 90 BF 26         [ 2]  449     LDW YTEMP,Y ; d3 hi 
      00A8DC 90 93            [ 1]  450     LDW Y,X 
      00A8DE 90 EE 02         [ 2]  451     LDW Y,(2,Y)
      00A8E1 90 BF 24         [ 2]  452     LDW XTEMP,Y ; d3 lo 
                                    453 ; put d1 in d3 slot 
      00A8E4 90 93            [ 1]  454     LDW Y,X 
      00A8E6 90 EE 08         [ 2]  455     LDW Y,(8,Y)
      00A8E9 FF               [ 2]  456     LDW (X),Y  ; d1 hi 
      00A8EA 90 93            [ 1]  457     LDW Y,X 
      00A8EC 90 EE 0A         [ 2]  458     LDW Y,(10,Y) 
      00A8EF EF 02            [ 2]  459     LDW (2,X),Y ; d1 lo 
                                    460 ; put d2 in d1 slot 
      00A8F1 90 93            [ 1]  461     LDW Y,X 
      00A8F3 90 EE 04         [ 2]  462     LDW Y,(4,Y) ; d2 hi 
      00A8F6 EF 08            [ 2]  463     LDW (8,X),Y 
      00A8F8 90 93            [ 1]  464     LDW Y,X 
      00A8FA 90 EE 06         [ 2]  465     LDW Y,(6,Y) ; d2 lo 
      00A8FD EF 0A            [ 2]  466     LDW (10,X),Y 
                                    467 ; put d3 in d2 slot 
      00A8FF 90 BE 26         [ 2]  468     LDW Y,YTEMP 
      00A902 EF 04            [ 2]  469     LDW (4,X),Y 
      00A904 90 BE 24         [ 2]  470     LDW Y,XTEMP 
      00A907 EF 06            [ 2]  471     LDW (6,X),Y 
      00A909 81               [ 4]  472     RET 
                                    473 
                                    474 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    475 ;    D0= ( d -- 0|-1 )
                                    476 ;    check if double is 0 
                                    477 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00288A                        478     _HEADER DZEQUAL,3,"D0="
      00A90A A8 D0                    1         .word LINK 
                           00288C     2         LINK=.
      00A90C 03                       3         .byte 3  
      00A90D 44 30 3D                 4         .ascii "D0="
      00A910                          5         DZEQUAL:
      00A910 4F               [ 1]  479     CLR A  
      00A911 90 93            [ 1]  480     LDW Y,X 
      00A913 90 FE            [ 2]  481     LDW Y,(Y)
      00A915 26 09            [ 1]  482     JRNE ZEQ1 
      00A917 90 93            [ 1]  483     LDW Y,X 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 150.
Hexadecimal [24-Bits]



      00A919 90 EE 02         [ 2]  484     LDW Y,(2,Y)
      00A91C 26 02            [ 1]  485     JRNE ZEQ1 
      00A91E A6 FF            [ 1]  486     LD A,#0xFF
      00A920                        487 ZEQ1:
      00A920 1C 00 02         [ 2]  488     ADDW X,#CELLL 
      00A923 F7               [ 1]  489     LD (X),A
      00A924 E7 01            [ 1]  490     LD (1,X),A
      00A926 81               [ 4]  491 	RET     
                                    492 
                                    493 
                                    494 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    495 ;   D= ( d1 d2 -- f )
                                    496 ;   d1==d2?
                                    497 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0028A7                        498     _HEADER DEQUAL,2,"D="
      00A927 A9 0C                    1         .word LINK 
                           0028A9     2         LINK=.
      00A929 02                       3         .byte 2  
      00A92A 44 3D                    4         .ascii "D="
      00A92C                          5         DEQUAL:
      00A92C A6 00            [ 1]  499     LD A,#0 
      00A92E 90 93            [ 1]  500     LDW Y,X 
      00A930 90 FE            [ 2]  501     LDW Y,(Y)
      00A932 E3 04            [ 2]  502     CPW Y,(4,X)
      00A934 26 0B            [ 1]  503     JRNE DEQU4 
      00A936 90 93            [ 1]  504     LDW Y,X 
      00A938 90 EE 02         [ 2]  505     LDW Y,(2,Y)
      00A93B E3 06            [ 2]  506     CPW Y,(6,X)
      00A93D 26 02            [ 1]  507     JRNE DEQU4 
      00A93F A6 FF            [ 1]  508     LD A,#0XFF
      00A941                        509 DEQU4:
      00A941 1C 00 06         [ 2]  510     ADDW X,#6
      00A944 F7               [ 1]  511     LD (X),A 
      00A945 E7 01            [ 1]  512     LD (1,X),A 
      00A947 81               [ 4]  513     RET 
                                    514 
                                    515 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    516 ;   D> ( d1 d2 -- f )
                                    517 ;   d1>d2?
                                    518 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0028C8                        519     _HEADER DGREAT,2,"D>"
      00A948 A9 29                    1         .word LINK 
                           0028CA     2         LINK=.
      00A94A 02                       3         .byte 2  
      00A94B 44 3E                    4         .ascii "D>"
      00A94D                          5         DGREAT:
      00A94D CD A8 3B         [ 4]  520     CALL DSWAP 
      00A950 CC A9 58         [ 2]  521     JP DLESS 
                                    522 
                                    523 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    524 ;   D< ( d1 d2 -- f )
                                    525 ;   d1<d2? 
                                    526 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0028D3                        527     _HEADER DLESS,2,"D<"
      00A953 A9 4A                    1         .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 151.
Hexadecimal [24-Bits]



                           0028D5     2         LINK=.
      00A955 02                       3         .byte 2  
      00A956 44 3C                    4         .ascii "D<"
      00A958                          5         DLESS:
      00A958 CD AC 96         [ 4]  528     CALL DSUB
      00A95B CD 8C 83         [ 4]  529     CALL ZERO
      00A95E CD 88 7C         [ 4]  530     CALL NROT  
      00A961 CD A9 73         [ 4]  531     CALL DZLESS 
      0028E4                        532     _QBRAN DLESS4
      00A964 CD 85 18         [ 4]    1     CALL QBRAN
      00A967 A9 6C                    2     .word DLESS4
      00A969 CD 88 F5         [ 4]  533     CALL INVER  
      00A96C                        534 DLESS4:
      00A96C 81               [ 4]  535     RET
                                    536 
                                    537 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    538 ;  D0< ( d -- f )
                                    539 ;  d<0? 
                                    540 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0028ED                        541     _HEADER DZLESS,3,"D0<"
      00A96D A9 55                    1         .word LINK 
                           0028EF     2         LINK=.
      00A96F 03                       3         .byte 3  
      00A970 44 30 3C                 4         .ascii "D0<"
      00A973                          5         DZLESS:
      00A973 A6 00            [ 1]  542     LD A,#0 
      00A975 90 93            [ 1]  543     LDW Y,X 
      00A977 90 FE            [ 2]  544     LDW Y,(Y)
      00A979 2A 02            [ 1]  545     JRPL DZLESS1 
      00A97B A6 FF            [ 1]  546     LD A,#0XFF 
      00A97D                        547 DZLESS1:
      00A97D 1C 00 02         [ 2]  548     ADDW X,#CELLL 
      00A980 F7               [ 1]  549     LD (X),A 
      00A981 E7 01            [ 1]  550     LD (1,X),A    
      00A983 81               [ 4]  551     RET 
                                    552 
                                    553 
                                    554 
                                    555 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    556 ;   2>R ( d -- R: d )
                                    557 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002904                        558     _HEADER DTOR,3,"2>R"
      00A984 A9 6F                    1         .word LINK 
                           002906     2         LINK=.
      00A986 03                       3         .byte 3  
      00A987 32 3E 52                 4         .ascii "2>R"
      00A98A                          5         DTOR:
      00A98A 90 85            [ 2]  559     POPW Y 
      00A98C 90 BF 26         [ 2]  560     LDW YTEMP,Y 
      00A98F 90 93            [ 1]  561     LDW Y,X 
      00A991 90 EE 02         [ 2]  562     LDW Y,(2,Y)
      00A994 90 89            [ 2]  563     PUSHW Y   ; d low 
      00A996 90 93            [ 1]  564     LDW Y,X 
      00A998 90 FE            [ 2]  565     LDW Y,(Y)
      00A99A 90 89            [ 2]  566     PUSHW Y   ; d hi 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 152.
Hexadecimal [24-Bits]



      00A99C 1C 00 04         [ 2]  567     ADDW X,#4  
      00A99F 92 CC 26         [ 5]  568     JP [YTEMP]
                                    569 
                                    570 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    571 ;  2R> ( -- d ) R: d --      
                                    572 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002922                        573     _HEADER DRFROM,3,"2R>"
      00A9A2 A9 86                    1         .word LINK 
                           002924     2         LINK=.
      00A9A4 03                       3         .byte 3  
      00A9A5 32 52 3E                 4         .ascii "2R>"
      00A9A8                          5         DRFROM:
      00A9A8 90 85            [ 2]  574     POPW Y      ; d hi 
      00A9AA 90 BF 26         [ 2]  575     LDW YTEMP,Y 
      00A9AD 1D 00 04         [ 2]  576     SUBW X,#4
      00A9B0 90 85            [ 2]  577     POPW Y       ; d hi 
      00A9B2 FF               [ 2]  578     LDW (X),Y 
      00A9B3 90 85            [ 2]  579     POPW Y       ; d low  
      00A9B5 EF 02            [ 2]  580     LDW (2,X),Y 
      00A9B7 92 CC 26         [ 5]  581     JP [YTEMP]
                                    582     
                                    583 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    584 ;   2R@ ( -- d )
                                    585 ;   fecth a double from RSTACK
                                    586 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00293A                        587     _HEADER DRAT,3,"2R@"
      00A9BA A9 A4                    1         .word LINK 
                           00293C     2         LINK=.
      00A9BC 03                       3         .byte 3  
      00A9BD 32 52 40                 4         .ascii "2R@"
      00A9C0                          5         DRAT:
      00A9C0 90 85            [ 2]  588     POPW Y 
      00A9C2 90 BF 26         [ 2]  589     LDW YTEMP,Y 
      00A9C5 1D 00 04         [ 2]  590     SUBW X,#4 
      00A9C8 16 01            [ 2]  591     LDW Y,(1,SP)
      00A9CA FF               [ 2]  592     LDW (X),Y 
      00A9CB 16 03            [ 2]  593     LDW Y,(3,SP)
      00A9CD EF 02            [ 2]  594     LDW (2,X),Y 
      00A9CF 92 CC 26         [ 5]  595     JP [YTEMP]
                                    596 
                                    597 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    598 ;  2VARIABLE <name> 
                                    599 ;  create a double variable 
                                    600 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002952                        601     _HEADER DVARIA,9,"2VARIABLE"
      00A9D2 A9 BC                    1         .word LINK 
                           002954     2         LINK=.
      00A9D4 09                       3         .byte 9  
      00A9D5 32 56 41 52 49 41 42     4         .ascii "2VARIABLE"
             4C 45
      00A9DE                          5         DVARIA:
      00A9DE CD 8D 5D         [ 4]  602         CALL HERE
      00A9E1 CD 86 99         [ 4]  603         CALL DUPP
      002964                        604         _DOLIT 4  
      00A9E4 CD 84 EF         [ 4]    1     CALL DOLIT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 153.
Hexadecimal [24-Bits]



      00A9E7 00 04                    2     .word 4 
      00A9E9 CD 88 BC         [ 4]  605         CALL PLUS 
      00A9EC CD 87 F0         [ 4]  606         CALL VPP 
      00A9EF CD 85 51         [ 4]  607         CALL STORE
      00A9F2 CD 99 8D         [ 4]  608         CALL CREAT
      00A9F5 CD 86 99         [ 4]  609         CALL DUPP
      00A9F8 CD 95 AE         [ 4]  610         CALL COMMA
      00A9FB CD 8C 83         [ 4]  611         CALL ZERO
      00A9FE CD 86 C1         [ 4]  612         CALL OVER 
      00AA01 CD 85 51         [ 4]  613         CALL STORE 
      00AA04 CD 8C 83         [ 4]  614         CALL ZERO 
      00AA07 CD 86 A9         [ 4]  615         CALL SWAPP 
      00AA0A CD 85 51         [ 4]  616         CALL STORE
      00AA0D CD A3 01         [ 4]  617         CALL FMOVE ; move definition to FLASH
      00AA10 CD 88 4C         [ 4]  618         CALL QDUP 
      00AA13 CD 85 18         [ 4]  619         CALL QBRAN 
      00AA16 99 DA                  620         .word SET_RAMLAST   
      00AA18 CD 9D A9         [ 4]  621         call UPDATVP  ; don't update if variable kept in RAM.
      00AA1B CD A3 95         [ 4]  622         CALL UPDATPTR
      00AA1E 81               [ 4]  623         RET         
                                    624 
                                    625 
                                    626 
                                    627 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    628 ;  2LITERAL ( d -- )
                                    629 ;  compile double literal 
                                    630 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00299F                        631     _HEADER DLITER,IMEDD+8,"2LITERAL"
      00AA1F A9 D4                    1         .word LINK 
                           0029A1     2         LINK=.
      00AA21 88                       3         .byte IMEDD+8  
      00AA22 32 4C 49 54 45 52 41     4         .ascii "2LITERAL"
             4C
      00AA2A                          5         DLITER:
      00AA2A CD 95 F3         [ 4]  632     CALL COMPI 
      00AA2D AA 35                  633     .word do2lit 
      00AA2F CD 95 AE         [ 4]  634     CALL COMMA 
      00AA32 CC 95 AE         [ 2]  635     JP   COMMA 
                                    636 
                                    637 
                                    638 ; runtime for 2LITERAL 
      00AA35                        639 do2lit:
      00AA35 1D 00 04         [ 2]  640     SUBW X,#4 
      00AA38 16 01            [ 2]  641     LDW Y,(1,SP)
      00AA3A 90 FE            [ 2]  642     LDW Y,(Y)
      00AA3C FF               [ 2]  643     LDW (X),Y 
      00AA3D 16 01            [ 2]  644     LDW Y,(1,SP)
      00AA3F 90 EE 02         [ 2]  645     LDW Y,(2,Y)
      00AA42 EF 02            [ 2]  646     LDW (2,X),Y 
      00AA44 90 85            [ 2]  647     POPW Y 
      00AA46 90 EC 04         [ 2]  648     JP (4,Y)
                                    649 
                                    650 
                                    651 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    652 ;   2OVER ( d1 d2 -- d1 d2 d1 )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 154.
Hexadecimal [24-Bits]



                                    653 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0029C9                        654     _HEADER DOVER,5,"2OVER"
      00AA49 AA 21                    1         .word LINK 
                           0029CB     2         LINK=.
      00AA4B 05                       3         .byte 5  
      00AA4C 32 4F 56 45 52           4         .ascii "2OVER"
      00AA51                          5         DOVER:
      00AA51 90 93            [ 1]  655     LDW Y,X 
      00AA53 1D 00 04         [ 2]  656     SUBW X,#4 
      00AA56 90 89            [ 2]  657     PUSHW Y 
      00AA58 90 EE 04         [ 2]  658     LDW Y,(4,Y)  ; d1 hi 
      00AA5B FF               [ 2]  659     LDW (X),Y 
      00AA5C 90 85            [ 2]  660     POPW Y 
      00AA5E 90 EE 06         [ 2]  661     LDW Y,(6,Y)  ;d1 lo 
      00AA61 EF 02            [ 2]  662     LDW (2,X),Y 
      00AA63 81               [ 4]  663     RET 
                                    664 
                                    665 
                                    666 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    667 ;   D2/ ( d -- d/2 )
                                    668 ;   divide double by 2 
                                    669 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0029E4                        670     _HEADER D2SLASH,3,"D2/"
      00AA64 AA 4B                    1         .word LINK 
                           0029E6     2         LINK=.
      00AA66 03                       3         .byte 3  
      00AA67 44 32 2F                 4         .ascii "D2/"
      00AA6A                          5         D2SLASH:
      00AA6A 90 93            [ 1]  671     LDW Y,X 
      00AA6C 90 FE            [ 2]  672     LDW Y,(Y)
      00AA6E 90 57            [ 2]  673     SRAW Y 
      00AA70 FF               [ 2]  674     LDW (X),Y 
      00AA71 90 93            [ 1]  675     LDW Y,X 
      00AA73 90 EE 02         [ 2]  676     LDW Y,(2,Y)
      00AA76 90 56            [ 2]  677     RRCW Y 
      00AA78 EF 02            [ 2]  678     LDW (2,X),Y 
      00AA7A 81               [ 4]  679     RET
                                    680 
                                    681 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    682 ;  D2* ( d -- d*2 )
                                    683 ;  multiply double by 2 
                                    684 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0029FB                        685     _HEADER D2STAR,3,"D2*"
      00AA7B AA 66                    1         .word LINK 
                           0029FD     2         LINK=.
      00AA7D 03                       3         .byte 3  
      00AA7E 44 32 2A                 4         .ascii "D2*"
      00AA81                          5         D2STAR:
      00AA81 90 93            [ 1]  686     LDW Y,X 
      00AA83 90 EE 02         [ 2]  687     LDW Y,(2,Y)
      00AA86 98               [ 1]  688     RCF 
      00AA87 90 59            [ 2]  689     RLCW Y 
      00AA89 EF 02            [ 2]  690     LDW (2,X),Y 
      00AA8B 90 93            [ 1]  691     LDW Y,X 
      00AA8D 90 FE            [ 2]  692     LDW Y,(Y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 155.
Hexadecimal [24-Bits]



      00AA8F 90 59            [ 2]  693     RLCW Y 
      00AA91 FF               [ 2]  694     LDW (X),Y 
      00AA92 81               [ 4]  695     RET 
                                    696 
                                    697 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    698 ;   DLSHIFT ( d n -- d )
                                    699 ;   left shift double 
                                    700 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002A13                        701     _HEADER DLSHIFT,7,"DLSHIFT"
      00AA93 AA 7D                    1         .word LINK 
                           002A15     2         LINK=.
      00AA95 07                       3         .byte 7  
      00AA96 44 4C 53 48 49 46 54     4         .ascii "DLSHIFT"
      00AA9D                          5         DLSHIFT:
      00AA9D E6 01            [ 1]  702     LD A,(1,X) ; shift count 
      00AA9F A4 1F            [ 1]  703     AND A,#31
      00AAA1 1C 00 02         [ 2]  704     ADDW X,#CELLL 
      00AAA4 90 93            [ 1]  705     LDW Y,X 
      00AAA6 90 FE            [ 2]  706     LDW Y,(Y)
      00AAA8 90 BF 26         [ 2]  707     LDW YTEMP,Y  ; d hi 
      00AAAB 90 93            [ 1]  708     LDW Y,X 
      00AAAD 90 EE 02         [ 2]  709     LDW Y,(2,Y)  ; d low 
      00AAB0                        710 DLSHIFT1:
      00AAB0 4D               [ 1]  711     TNZ A 
      00AAB1 27 12            [ 1]  712     JREQ DLSHIFT2 
      00AAB3 98               [ 1]  713     RCF 
      00AAB4 90 59            [ 2]  714     RLCW Y 
      00AAB6 90 89            [ 2]  715     PUSHW Y 
      00AAB8 90 BE 26         [ 2]  716     LDW Y,YTEMP 
      00AABB 90 59            [ 2]  717     RLCW Y 
      00AABD 90 BF 26         [ 2]  718     LDW YTEMP,Y 
      00AAC0 90 85            [ 2]  719     POPW Y 
      00AAC2 4A               [ 1]  720     DEC A 
      00AAC3 20 EB            [ 2]  721     JRA DLSHIFT1 
      00AAC5                        722 DLSHIFT2:
      00AAC5 EF 02            [ 2]  723     LDW (2,X),Y 
      00AAC7 90 BE 26         [ 2]  724     LDW Y,YTEMP 
      00AACA FF               [ 2]  725     LDW (X),Y 
      00AACB 81               [ 4]  726     RET 
                                    727 
                                    728 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    729 ;  DRSHIFT ( d n -- d )
                                    730 ;  shift right n bits 
                                    731 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002A4C                        732     _HEADER DRSHIFT,7,"DRSHIFT"
      00AACC AA 95                    1         .word LINK 
                           002A4E     2         LINK=.
      00AACE 07                       3         .byte 7  
      00AACF 44 52 53 48 49 46 54     4         .ascii "DRSHIFT"
      00AAD6                          5         DRSHIFT:
      00AAD6 E6 01            [ 1]  733     LD A,(1,X)
      00AAD8 A4 1F            [ 1]  734     AND A,#31
      00AADA 1C 00 02         [ 2]  735     ADDW X,#2 
      00AADD                        736 DRSHIFT1:
      00AADD 4D               [ 1]  737     TNZ A 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 156.
Hexadecimal [24-Bits]



      00AADE 27 13            [ 1]  738     JREQ DRSHIFT2 
      00AAE0 90 93            [ 1]  739     LDW Y,X 
      00AAE2 90 FE            [ 2]  740     LDW Y,(Y)
      00AAE4 90 54            [ 2]  741     SRLW Y 
      00AAE6 FF               [ 2]  742     LDW (X),Y 
      00AAE7 90 93            [ 1]  743     LDW Y,X 
      00AAE9 90 EE 02         [ 2]  744     LDW Y,(2,Y)
      00AAEC 90 56            [ 2]  745     RRCW Y 
      00AAEE EF 02            [ 2]  746     LDW (2,X),Y 
      00AAF0 4A               [ 1]  747     DEC A
      00AAF1 20 EA            [ 2]  748     JRA DRSHIFT1  
      00AAF3                        749 DRSHIFT2:
      00AAF3 81               [ 4]  750     RET 
                                    751 
                                    752 
                                    753 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    754 ;   D* ( d1 d2 -- d3 )
                                    755 ;   double product 
                                    756 ;   d3 = d1 * d2
                                    757 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002A74                        758     _HEADER DSTAR,2,"D*"
      00AAF4 AA CE                    1         .word LINK 
                           002A76     2         LINK=.
      00AAF6 02                       3         .byte 2  
      00AAF7 44 2A                    4         .ascii "D*"
      00AAF9                          5         DSTAR:
      00AAF9 CD 86 99         [ 4]  759     CALL DUPP 
      00AAFC CD 86 D0         [ 4]  760     CALL ZLESS  
      00AAFF CD 86 62         [ 4]  761     CALL TOR    ; R: d2sign 
      00AB02 CD A7 1F         [ 4]  762     CALL DABS   
      00AB05 CD 85 B4         [ 4]  763     CALL RFROM 
      00AB08 CD 88 7C         [ 4]  764     CALL NROT  ; d1 d2s ud2
      00AB0B CD A9 8A         [ 4]  765     CALL DTOR  ; d1 d2s R: ud2  
      00AB0E CD 86 62         [ 4]  766     CALL TOR   ; d1 R: ud2 d2s   
      00AB11 CD 86 99         [ 4]  767     CALL DUPP 
      00AB14 CD 86 D0         [ 4]  768     CALL ZLESS 
      00AB17 CD 85 B4         [ 4]  769     CALL RFROM 
      00AB1A CD 87 1F         [ 4]  770     CALL XORR   
      00AB1D CD 86 62         [ 4]  771     CALL TOR   ; d1 R: ud2 prod_sign  
      00AB20 CD A7 1F         [ 4]  772     CALL DABS ; ud1 R: ud2 ps  
      00AB23 CD 85 B4         [ 4]  773     CALL RFROM  
      00AB26 CD 88 7C         [ 4]  774     CALL NROT   ; ps ud1 
      00AB29 CD 88 A7         [ 4]  775     CALL DDUP   ; ps ud1 ud1  
      00AB2C CD 85 B4         [ 4]  776     CALL RFROM  ; ps ud1 ud1 ud2hi 
      00AB2F CD A8 15         [ 4]  777     CALL DSSTAR ; ps ud1 dprodhi 
                                    778 ; shift partial product 16 bits left 
      002AB2                        779     _DROP   ; drop overflow 
      00AB32 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00AB35 CD 8C 83         [ 4]  780     CALL ZERO   ; ps ud1 prodhi 
      00AB38 CD 86 A9         [ 4]  781     CALL SWAPP  
      00AB3B CD A8 3B         [ 4]  782     CALL DSWAP  ; ps dprodhi ud1 
      00AB3E CD 85 B4         [ 4]  783     CALL RFROM  ; ps dprodhi ud1 ud2lo
      00AB41 CD A8 15         [ 4]  784     CALL DSSTAR ; ps  dprodhi dprodlo 
      00AB44 CD AC 64         [ 4]  785     CALL DPLUS
      00AB47 CD 88 5D         [ 4]  786     CALL ROT    ; dprod ps 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 157.
Hexadecimal [24-Bits]



      002ACA                        787     _QBRAN DDSTAR3 
      00AB4A CD 85 18         [ 4]    1     CALL QBRAN
      00AB4D AB 52                    2     .word DDSTAR3
      00AB4F CD 89 18         [ 4]  788     CALL DNEGA 
      00AB52                        789 DDSTAR3:  
      00AB52 81               [ 4]  790     RET 
                                    791 
                                    792 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    793 ;  UD/MOD ( ud1 ud2 -- dr udq )
                                    794 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002AD3                        795     _HEADER UDSLMOD,6,"UD/MOD"
      00AB53 AA F6                    1         .word LINK 
                           002AD5     2         LINK=.
      00AB55 06                       3         .byte 6  
      00AB56 55 44 2F 4D 4F 44        4         .ascii "UD/MOD"
      00AB5C                          5         UDSLMOD:
                                    796 ; unsigned double division 
      00AB5C CD 8C 83         [ 4]  797     CALL ZERO 
      00AB5F CD 8C 83         [ 4]  798     CALL ZERO
      00AB62 CD A9 8A         [ 4]  799     CALL DTOR ; quotient  R: qlo qhi 
      00AB65 CD AA 51         [ 4]  800     CALL DOVER 
      00AB68 CD A8 69         [ 4]  801     CALL DCLZ ; n2, dividend leading zeros  
      00AB6B CD 86 62         [ 4]  802     CALL TOR 
      00AB6E CD 88 A7         [ 4]  803     CALL DDUP    
      00AB71 CD A8 69         [ 4]  804     CALL DCLZ  ; n1, divisor leading zeros
      00AB74 CD 85 B4         [ 4]  805     CALL RFROM ; n1 n2 
      00AB77 CD 89 52         [ 4]  806     CALL SUBB  ; loop count 
      00AB7A CD 86 99         [ 4]  807     CALL DUPP
      00AB7D CD A9 8A         [ 4]  808     CALL DTOR  ; ud1 ud2 R: qlo qhi cntr cntr 
      00AB80 CD 85 C5         [ 4]  809     CALL RAT    
      00AB83 CD 86 D0         [ 4]  810     CALL ZLESS 
      002B06                        811     _TBRAN UDSLA7 ; quotient is null 
      00AB86 CD 85 26         [ 4]    1     CALL TBRAN 
      00AB89 AB E8                    2     .word UDSLA7 
      00AB8B CD 85 C5         [ 4]  812     CALL RAT 
      00AB8E CD AA 9D         [ 4]  813     CALL DLSHIFT ; align divisor with dividend 
      00AB91                        814 UDSLA3: ; division loop -- dividend divisor  
      00AB91 90 5F            [ 1]  815     CLRW Y 
      00AB93 90 89            [ 2]  816     PUSHW Y  
      00AB95 CD AA 51         [ 4]  817     CALL DOVER 
      00AB98 CD AA 51         [ 4]  818     CALL DOVER 
      00AB9B CD A9 58         [ 4]  819     CALL DLESS 
      002B1E                        820     _TBRAN UDSLA4 
      00AB9E CD 85 26         [ 4]    1     CALL TBRAN 
      00ABA1 AB B7                    2     .word UDSLA4 
      00ABA3 90 85            [ 2]  821     POPW Y 
      00ABA5 72 A9 00 01      [ 2]  822     ADDW Y,#1 
      00ABA9 90 89            [ 2]  823     PUSHW Y    ; quotiend least bit 
      00ABAB CD 88 A7         [ 4]  824     CALL DDUP  ; dividend divisor divisor 
      00ABAE CD A9 8A         [ 4]  825     CALL DTOR  
      00ABB1 CD AC 96         [ 4]  826     CALL DSUB  ; dividend-divisor 
      00ABB4 CD A9 A8         [ 4]  827     CALL DRFROM  ; dividend- divisor  
      00ABB7                        828 UDSLA4: ; shift quotient and add 1 bit 
      00ABB7 90 85            [ 2]  829     POPW Y 
      00ABB9 90 BF 26         [ 2]  830     LDW YTEMP,Y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 158.
Hexadecimal [24-Bits]



      00ABBC 16 07            [ 2]  831     LDW Y,(7,SP) ; quotient low 
      00ABBE 98               [ 1]  832     RCF 
      00ABBF 90 59            [ 2]  833     RLCW Y
      00ABC1 17 07            [ 2]  834     LDW (7,SP),Y 
      00ABC3 16 05            [ 2]  835     LDW Y,(5,SP) ; quotient hi 
      00ABC5 90 59            [ 2]  836     RLCW Y 
      00ABC7 17 05            [ 2]  837     LDW (5,SP),Y 
      00ABC9 16 07            [ 2]  838     LDW Y,(7,SP) 
      00ABCB 72 B9 00 26      [ 2]  839     ADDW Y,YTEMP
      00ABCF 17 07            [ 2]  840     LDW (7,SP),Y 
      00ABD1 16 01            [ 2]  841     LDW Y,(1,SP) ; loop counter 
      00ABD3 90 5D            [ 2]  842     TNZW Y 
      00ABD5 27 1C            [ 1]  843     JREQ UDSLA8
      00ABD7 72 A2 00 01      [ 2]  844     SUBW Y,#1  
      00ABDB 17 01            [ 2]  845     LDW (1,SP),Y  
                                    846 ; shift dividend left 1 bit      
      00ABDD CD A8 3B         [ 4]  847     CALL DSWAP 
      00ABE0 CD AA 81         [ 4]  848     CALL D2STAR 
      00ABE3 CD A8 3B         [ 4]  849     CALL DSWAP 
      00ABE6 20 A9            [ 2]  850     JRA UDSLA3 
      00ABE8                        851 UDSLA7:
      00ABE8 CD 8C 83         [ 4]  852     CALL ZERO 
      002B6B                        853     _DOLIT 1 
      00ABEB CD 84 EF         [ 4]    1     CALL DOLIT 
      00ABEE 00 01                    2     .word 1 
      00ABF0 CD 86 3E         [ 4]  854     CALL NRSTO ; R: 0 0 0 cntr    
      00ABF3                        855 UDSLA8:
      00ABF3 1C 00 04         [ 2]  856     ADDW X,#4 ; drop divisor
      00ABF6 CD 85 B4         [ 4]  857     CALL RFROM  
      002B79                        858     _DROP ; drop cntr 
      00ABF9 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00ABFC CD 85 B4         [ 4]  859     CALL RFROM   ; shift count
      00ABFF CD AA D6         [ 4]  860     CALL DRSHIFT 
                                    861     ; quotient replace dividend 
      00AC02 CD A9 A8         [ 4]  862     CALL DRFROM  ; quotient 
      00AC05 81               [ 4]  863     RET 
                                    864 
                                    865 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    866 ;   D/MOD  ( d1 d2 -- dr dq )
                                    867 ;   double division dq=d1/d2
                                    868 ;   dr remainder double 
                                    869 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002B86                        870     _HEADER DDSLMOD,5,"D/MOD"  
      00AC06 AB 55                    1         .word LINK 
                           002B88     2         LINK=.
      00AC08 05                       3         .byte 5  
      00AC09 44 2F 4D 4F 44           4         .ascii "D/MOD"
      00AC0E                          5         DDSLMOD:
      00AC0E F6               [ 1]  871     LD A,(X) ; disisor sign 
      00AC0F 88               [ 1]  872     PUSH A 
      00AC10 E6 04            [ 1]  873     LD A,(4,X) ; dividend sign 
      00AC12 88               [ 1]  874     PUSH A   ; R: sdivsor sdivnd 
      00AC13 CD A7 1F         [ 4]  875     CALL DABS 
      00AC16 CD A9 8A         [ 4]  876     CALL DTOR ; R: sign abs(divisor)
      00AC19 CD A7 1F         [ 4]  877     CALL DABS  ; ud1  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 159.
Hexadecimal [24-Bits]



      00AC1C CD A9 C0         [ 4]  878     CALL DRAT  ; ud1 ud2 R: sign abs(divisor) 
      00AC1F CD AB 5C         [ 4]  879     CALL UDSLMOD ; ud1/ud2 -- dr dq  
      00AC22 7B 05            [ 1]  880     LD A,(5,SP) ; sdivnd 
      00AC24 18 06            [ 1]  881     XOR A,(6,SP) ; 
      00AC26 2A 18            [ 1]  882     JRPL DSLA8 
      00AC28 CD 8C 8E         [ 4]  883     CALL ONE 
      00AC2B CD 8C 83         [ 4]  884     CALL ZERO 
      00AC2E CD AC 64         [ 4]  885     CALL DPLUS 
      00AC31 CD 89 18         [ 4]  886     CALL DNEGA ; negate quotient  
      00AC34 CD A9 C0         [ 4]  887     CALL DRAT 
      00AC37 CD A8 D5         [ 4]  888     CALL DROT 
      00AC3A CD AC 96         [ 4]  889     CALL DSUB  ; corrected_remainder=divisor-remainder 
      00AC3D CD A8 3B         [ 4]  890     CALL DSWAP
      00AC40                        891 DSLA8:      
                                    892 ; check for divisor sign 
                                    893 ; if negative change negate remainder 
      00AC40 7B 06            [ 1]  894     LD A,(6,SP) ; divisor sign 
      00AC42 2A 09            [ 1]  895     JRPL DSLA9 
      00AC44 CD A9 8A         [ 4]  896     CALL DTOR 
      00AC47 CD 89 18         [ 4]  897     CALL DNEGA 
      00AC4A CD A9 A8         [ 4]  898     CALL DRFROM 
      00AC4D                        899 DSLA9:
      00AC4D 5B 06            [ 2]  900     ADDW SP,#6 
      00AC4F 81               [ 4]  901     RET 
                                    902 
                                    903 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    904 ;   D/  ( d1 d2 -- dq )
                                    905 ;   division double by double 
                                    906 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002BD0                        907     _HEADER DSLASH,2,"D/"
      00AC50 AC 08                    1         .word LINK 
                           002BD2     2         LINK=.
      00AC52 02                       3         .byte 2  
      00AC53 44 2F                    4         .ascii "D/"
      00AC55                          5         DSLASH:
      00AC55 CD AC 0E         [ 4]  908     CALL DDSLMOD
      00AC58 CD A8 3B         [ 4]  909     CALL DSWAP
      002BDB                        910     _DDROP 
      00AC5B 1C 00 04         [ 2]    1    ADDW X,#2*CELLL 
      00AC5E 81               [ 4]  911     RET 
                                    912 
                                    913 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    914 ;   D+ ( d1 d2 -- d3 )
                                    915 ;   add 2 doubles 
                                    916 ;   d3=d1+d2 
                                    917 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002BDF                        918     _HEADER DPLUS,2,"D+"
      00AC5F AC 52                    1         .word LINK 
                           002BE1     2         LINK=.
      00AC61 02                       3         .byte 2  
      00AC62 44 2B                    4         .ascii "D+"
      00AC64                          5         DPLUS:
      00AC64 90 93            [ 1]  919     LDW Y,X 
      00AC66 90 FE            [ 2]  920     LDW Y,(Y)
      00AC68 90 BF 26         [ 2]  921     LDW YTEMP,Y ; d2 hi 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 160.
Hexadecimal [24-Bits]



      00AC6B 90 93            [ 1]  922     LDW Y,X 
      00AC6D 90 EE 02         [ 2]  923     LDW Y,(2,Y)
      00AC70 90 BF 24         [ 2]  924     LDW XTEMP,Y ; d2 lo 
      00AC73 1C 00 04         [ 2]  925     ADDW X,#4 
      00AC76 90 93            [ 1]  926     LDW Y,X 
      00AC78 90 EE 02         [ 2]  927     LDW Y,(2,Y) ; d1 lo
      00AC7B 72 B9 00 24      [ 2]  928     ADDW Y,XTEMP
      00AC7F EF 02            [ 2]  929     LDW (2,X),Y 
      00AC81 90 93            [ 1]  930     LDW Y,X 
      00AC83 90 FE            [ 2]  931     LDW Y,(Y) ; d1 hi 
      00AC85 24 04            [ 1]  932     JRNC DPLUS1 
      00AC87 72 A9 00 01      [ 2]  933     ADDW Y,#1 
      00AC8B                        934 DPLUS1: 
      00AC8B 72 B9 00 26      [ 2]  935     ADDW Y,YTEMP 
      00AC8F FF               [ 2]  936     LDW (X),Y 
      00AC90 81               [ 4]  937     RET 
                                    938 
                                    939 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    940 ;   D- ( d1 d2 -- d3 )
                                    941 ;   d3=d1-d2 
                                    942 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002C11                        943     _HEADER DSUB,2,"D-"
      00AC91 AC 61                    1         .word LINK 
                           002C13     2         LINK=.
      00AC93 02                       3         .byte 2  
      00AC94 44 2D                    4         .ascii "D-"
      00AC96                          5         DSUB:
      00AC96 90 93            [ 1]  944     LDW Y,X 
      00AC98 90 FE            [ 2]  945     LDW Y,(Y)
      00AC9A 90 BF 26         [ 2]  946     LDW YTEMP,Y ; d2 hi 
      00AC9D 90 93            [ 1]  947     LDW Y,X 
      00AC9F 90 EE 02         [ 2]  948     LDW Y,(2,Y)
      00ACA2 90 BF 24         [ 2]  949     LDW XTEMP,Y ; d2 lo 
      00ACA5 1C 00 04         [ 2]  950     ADDW X,#4 
      00ACA8 90 93            [ 1]  951     LDW Y,X 
      00ACAA 90 EE 02         [ 2]  952     LDW Y,(2,Y) ; d1 lo
      00ACAD 72 B2 00 24      [ 2]  953     SUBW Y,XTEMP
      00ACB1 EF 02            [ 2]  954     LDW (2,X),Y 
      00ACB3 90 93            [ 1]  955     LDW Y,X 
      00ACB5 90 FE            [ 2]  956     LDW Y,(Y) ; d1 hi 
      00ACB7 24 04            [ 1]  957     JRNC DSUB1 
      00ACB9 72 A2 00 01      [ 2]  958     SUBW Y,#1 
      00ACBD                        959 DSUB1: 
      00ACBD 72 B2 00 26      [ 2]  960     SUBW Y,YTEMP 
      00ACC1 FF               [ 2]  961     LDW (X),Y 
      00ACC2 81               [ 4]  962     RET 
                                    963 
                                    964 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 161.
Hexadecimal [24-Bits]



                                   4648 .endif 
                           000001  4649 .if WANT_FLOAT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 162.
Hexadecimal [24-Bits]



                                   4650         .include "float.asm"
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 163.
Hexadecimal [24-Bits]



                                     55 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002C43                         56     _HEADER FVER,9,"FLOAT-VER"
      00ACC3 AC 93                    1         .word LINK 
                           002C45     2         LINK=.
      00ACC5 09                       3         .byte 9  
      00ACC6 46 4C 4F 41 54 2D 56     4         .ascii "FLOAT-VER"
             45 52
      00ACCF                          5         FVER:
      00ACCF CD 90 09         [ 4]   57     CALL CR 
      00ACD2 CD 90 36         [ 4]   58     CALL DOTQP 
      00ACD5 11                      59     .byte  17 
      00ACD6 66 6C 6F 61 74 33 32    60     .ascii "float32 library, "
             20 6C 69 62 72 61 72
             79 2C 20
      00ACE7 CD 9B D5         [ 4]   61     CALL PRT_LICENCE 
      00ACEA CD 9B AD         [ 4]   62     CALL COPYRIGHT 
      002C6D                         63     _DOLIT FLOAT_MAJOR     
      00ACED CD 84 EF         [ 4]    1     CALL DOLIT 
      00ACF0 00 01                    2     .word FLOAT_MAJOR 
      002C72                         64     _DOLIT FLOAT_MINOR 
      00ACF2 CD 84 EF         [ 4]    1     CALL DOLIT 
      00ACF5 00 00                    2     .word FLOAT_MINOR 
      00ACF7 CC 9B E9         [ 2]   65     JP PRINT_VERSION 
                                     66 
                                     67 
                                     68 ;-------------------------
                                     69 ;    FPSW ( -- a )
                                     70 ;    floating state variable
                                     71 ;    bit 0 zero flag 
                                     72 ;    bit 1 negative flag 
                                     73 ;    bit 2 overflow/error flag 
                                     74 ;---------------------------
      002C7A                         75     _HEADER FPSW,4,"FPSW"
      00ACFA AC C5                    1         .word LINK 
                           002C7C     2         LINK=.
      00ACFC 04                       3         .byte 4  
      00ACFD 46 50 53 57              4         .ascii "FPSW"
      00AD01                          5         FPSW:
      00AD01 90 AE 00 08      [ 2]   76 	LDW Y,#UFPSW  
      00AD05 1D 00 02         [ 2]   77 	SUBW X,#2
      00AD08 FF               [ 2]   78     LDW (X),Y
      00AD09 81               [ 4]   79     RET
                                     80 
                                     81 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     82 ;   FRESET ( -- )
                                     83 ;   reset FPSW variable 
                                     84 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
      002C8A                         85     _HEADER FRESET,6,"FRESET"
      00AD0A AC FC                    1         .word LINK 
                           002C8C     2         LINK=.
      00AD0C 06                       3         .byte 6  
      00AD0D 46 52 45 53 45 54        4         .ascii "FRESET"
      00AD13                          5         FRESET:
      00AD13 CD 8C 83         [ 4]   86     CALL ZERO  
      00AD16 CD AD 01         [ 4]   87     CALL FPSW 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 164.
Hexadecimal [24-Bits]



      00AD19 CD 85 51         [ 4]   88     CALL STORE 
      00AD1C 81               [ 4]   89     RET 
                                     90 
                                     91 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     92 ;   FINIT ( -- )
                                     93 ;   initialize floating point 
                                     94 ;   library 
                                     95 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002C9D                         96     _HEADER FINIT,5,"FINIT"
      00AD1D AD 0C                    1         .word LINK 
                           002C9F     2         LINK=.
      00AD1F 05                       3         .byte 5  
      00AD20 46 49 4E 49 54           4         .ascii "FINIT"
      00AD25                          5         FINIT:
      00AD25 CD AD 13         [ 4]   97     CALL FRESET 
      00AD28 81               [ 4]   98     RET 
                                     99 
                                    100 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    101 ;    FER ( -- u )
                                    102 ;    return FPSW value 
                                    103 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002CA9                        104     _HEADER FER,3,"FER"
      00AD29 AD 1F                    1         .word LINK 
                           002CAB     2         LINK=.
      00AD2B 03                       3         .byte 3  
      00AD2C 46 45 52                 4         .ascii "FER"
      00AD2F                          5         FER:
      00AD2F CD AD 01         [ 4]  105     CALL FPSW 
      00AD32 CD 85 63         [ 4]  106     CALL AT 
      00AD35 81               [ 4]  107     RET 
                                    108 
                                    109 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    110 ;    FZE  ( -- 0|-1 )
                                    111 ;    return FPSW zero flag 
                                    112 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002CB6                        113     _HEADER FZE,3,"FZE"
      00AD36 AD 2B                    1         .word LINK 
                           002CB8     2         LINK=.
      00AD38 03                       3         .byte 3  
      00AD39 46 5A 45                 4         .ascii "FZE"
      00AD3C                          5         FZE:
      00AD3C CD AD 01         [ 4]  114     CALL FPSW
      00AD3F CD 85 63         [ 4]  115     CALL AT  
      00AD42 CD 8C 8E         [ 4]  116     CALL ONE 
      00AD45 CD 86 F6         [ 4]  117     CALL ANDD
      00AD48 CD 89 06         [ 4]  118     CALL NEGAT  
      00AD4B 81               [ 4]  119     RET 
                                    120 
                                    121 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    122 ;    FNE ( -- 0|-1 )
                                    123 ;    return FPSW negative flag 
                                    124 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002CCC                        125     _HEADER FNE,3,"FNE"
      00AD4C AD 38                    1         .word LINK 
                           002CCE     2         LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 165.
Hexadecimal [24-Bits]



      00AD4E 03                       3         .byte 3  
      00AD4F 46 4E 45                 4         .ascii "FNE"
      00AD52                          5         FNE:
      00AD52 CD AD 01         [ 4]  126     CALL FPSW 
      00AD55 CD 85 63         [ 4]  127     CALL AT 
      002CD8                        128     _DOLIT 2 
      00AD58 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AD5B 00 02                    2     .word 2 
      00AD5D CD 86 F6         [ 4]  129     CALL ANDD
      00AD60 CD 8C 69         [ 4]  130     CALL TWOSL
      00AD63 CD 89 06         [ 4]  131     CALL NEGAT   
      00AD66 81               [ 4]  132     RET 
                                    133 
                                    134 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    135 ;   FOV (  -- 0|-1 )
                                    136 ;   return FPSW overflow flag 
                                    137 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002CE7                        138     _HEADER FOV,3,"FOV"
      00AD67 AD 4E                    1         .word LINK 
                           002CE9     2         LINK=.
      00AD69 03                       3         .byte 3  
      00AD6A 46 4F 56                 4         .ascii "FOV"
      00AD6D                          5         FOV:
      00AD6D CD AD 01         [ 4]  139     CALL FPSW
      00AD70 CD 85 63         [ 4]  140     CALL AT  
      002CF3                        141     _DOLIT 4 
      00AD73 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AD76 00 04                    2     .word 4 
      00AD78 CD 86 F6         [ 4]  142     CALL ANDD
      002CFB                        143     _DOLIT 2 
      00AD7B CD 84 EF         [ 4]    1     CALL DOLIT 
      00AD7E 00 02                    2     .word 2 
      00AD80 CD 8C 51         [ 4]  144     CALL RSHIFT 
      00AD83 CD 89 06         [ 4]  145     CALL NEGAT  
      00AD86 81               [ 4]  146     RET 
                                    147 
                                    148 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    149 ;    SFZ ( f# -- f# )
                                    150 ;    set FPSW zero flag 
                                    151 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002D07                        152     _HEADER SFZ,3,"SFZ"
      00AD87 AD 69                    1         .word LINK 
                           002D09     2         LINK=.
      00AD89 03                       3         .byte 3  
      00AD8A 53 46 5A                 4         .ascii "SFZ"
      00AD8D                          5         SFZ:
      00AD8D CD AD 2F         [ 4]  153     CALL FER 
      002D10                        154     _DOLIT 0xfffe 
      00AD90 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AD93 FF FE                    2     .word 0xfffe 
      00AD95 CD 86 F6         [ 4]  155     CALL ANDD 
      00AD98 CD 86 62         [ 4]  156     CALL TOR    
      00AD9B CD 88 A7         [ 4]  157     CALL DDUP 
      002D1E                        158     _DOLIT 0xFF  
      00AD9E CD 84 EF         [ 4]    1     CALL DOLIT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 166.
Hexadecimal [24-Bits]



      00ADA1 00 FF                    2     .word 0xFF 
      00ADA3 CD 86 F6         [ 4]  159     CALL ANDD
      00ADA6 CD A9 10         [ 4]  160     CALL DZEQUAL 
      002D29                        161     _DOLIT 1 
      00ADA9 CD 84 EF         [ 4]    1     CALL DOLIT 
      00ADAC 00 01                    2     .word 1 
      00ADAE CD 86 F6         [ 4]  162     CALL ANDD 
      00ADB1 CD 85 B4         [ 4]  163     CALL RFROM 
      00ADB4 CD 87 0A         [ 4]  164     CALL ORR 
      00ADB7 CD AD 01         [ 4]  165     CALL FPSW 
      00ADBA CD 85 51         [ 4]  166     CALL STORE 
      00ADBD 81               [ 4]  167     RET 
                                    168 
                                    169 
                                    170 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    171 ;   SFN ( f# -- f# )
                                    172 ;   set FPSW negative flag 
                                    173 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002D3E                        174     _HEADER SFN,3,"SFN"
      00ADBE AD 89                    1         .word LINK 
                           002D40     2         LINK=.
      00ADC0 03                       3         .byte 3  
      00ADC1 53 46 4E                 4         .ascii "SFN"
      00ADC4                          5         SFN:
      00ADC4 CD AD 2F         [ 4]  175     CALL FER 
      002D47                        176     _DOLIT 0xFFFD 
      00ADC7 CD 84 EF         [ 4]    1     CALL DOLIT 
      00ADCA FF FD                    2     .word 0xFFFD 
      00ADCC CD 86 F6         [ 4]  177     CALL ANDD  
      00ADCF CD 86 62         [ 4]  178     CALL TOR 
      00ADD2 CD 86 99         [ 4]  179     CALL DUPP 
      002D55                        180     _DOLIT 0X80 
      00ADD5 CD 84 EF         [ 4]    1     CALL DOLIT 
      00ADD8 00 80                    2     .word 0X80 
      00ADDA CD 86 F6         [ 4]  181     CALL ANDD 
      002D5D                        182     _DOLIT 6 
      00ADDD CD 84 EF         [ 4]    1     CALL DOLIT 
      00ADE0 00 06                    2     .word 6 
      00ADE2 CD 8C 51         [ 4]  183     CALL RSHIFT 
      00ADE5 CD 85 B4         [ 4]  184     CALL RFROM 
      00ADE8 CD 87 0A         [ 4]  185     CALL ORR 
      00ADEB CD AD 01         [ 4]  186     CALL FPSW 
      00ADEE CD 85 51         [ 4]  187     CALL STORE 
      00ADF1 81               [ 4]  188     RET 
                                    189 
                                    190 
                                    191 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    192 ;   SFV ( -- )
                                    193 ;   set overflow flag 
                                    194 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002D72                        195     _HEADER SFV,3,"SFV"
      00ADF2 AD C0                    1         .word LINK 
                           002D74     2         LINK=.
      00ADF4 03                       3         .byte 3  
      00ADF5 53 46 56                 4         .ascii "SFV"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 167.
Hexadecimal [24-Bits]



      00ADF8                          5         SFV:
      00ADF8 CD AD 2F         [ 4]  196     CALL FER 
      002D7B                        197     _DOLIT 4 
      00ADFB CD 84 EF         [ 4]    1     CALL DOLIT 
      00ADFE 00 04                    2     .word 4 
      00AE00 CD 87 0A         [ 4]  198     CALL ORR 
      00AE03 CD AD 01         [ 4]  199     CALL FPSW 
      00AE06 CD 85 51         [ 4]  200     CALL STORE 
      00AE09 81               [ 4]  201     RET 
                                    202 
                                    203 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    204 ;  F>ME ( f# -- m e )
                                    205 ;  split float in mantissa/exponent 
                                    206 ;  m mantissa as a double 
                                    207 ;  e exponent as a single 
                                    208 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002D8A                        209     _HEADER ATEXP,4,"F>ME"             
      00AE0A AD F4                    1         .word LINK 
                           002D8C     2         LINK=.
      00AE0C 04                       3         .byte 4  
      00AE0D 46 3E 4D 45              4         .ascii "F>ME"
      00AE11                          5         ATEXP:
      00AE11 CD AD 13         [ 4]  210     CALL FRESET
      00AE14 CD AD C4         [ 4]  211     CALL SFN
      00AE17 CD AD 8D         [ 4]  212     CALL SFZ 
      00AE1A 90 93            [ 1]  213     LDW Y,X 
      00AE1C 90 FE            [ 2]  214     LDW Y,(Y)
      00AE1E 90 89            [ 2]  215     PUSHW Y 
      00AE20 4F               [ 1]  216     CLR A  
      00AE21 90 5E            [ 1]  217     SWAPW Y 
      00AE23 2A 01            [ 1]  218     JRPL ATEXP1 
      00AE25 43               [ 1]  219     CPL A 
      00AE26                        220 ATEXP1: ; sign extend mantissa 
      00AE26 90 5E            [ 1]  221     SWAPW Y 
      00AE28 90 95            [ 1]  222     LD YH,A 
      00AE2A FF               [ 2]  223     LDW (X),Y 
      00AE2B 1D 00 02         [ 2]  224     SUBW X,#CELLL 
      00AE2E 90 85            [ 2]  225     POPW Y 
      00AE30 4F               [ 1]  226     CLR A 
      00AE31 90 5D            [ 2]  227     TNZW Y 
      00AE33 2A 01            [ 1]  228     JRPL ATEXP2 
      00AE35 43               [ 1]  229     CPL A 
      00AE36                        230 ATEXP2:
      00AE36 90 5E            [ 1]  231     SWAPW Y 
      00AE38 90 95            [ 1]  232     LD YH,A 
      00AE3A FF               [ 2]  233     LDW (X),Y 
      00AE3B 81               [ 4]  234     RET 
                                    235 
                                    236 
                                    237 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    238 ;    ME>F ( m e -- f# )
                                    239 ;    built float from mantissa/exponent 
                                    240 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002DBC                        241     _HEADER STEXP,4,"ME>F"
      00AE3C AE 0C                    1         .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 168.
Hexadecimal [24-Bits]



                           002DBE     2         LINK=.
      00AE3E 04                       3         .byte 4  
      00AE3F 4D 45 3E 46              4         .ascii "ME>F"
      00AE43                          5         STEXP:
      00AE43 CD 86 99         [ 4]  242     CALL DUPP 
      00AE46 CD 89 6C         [ 4]  243     CALL ABSS 
      002DC9                        244     _DOLIT 127 
      00AE49 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AE4C 00 7F                    2     .word 127 
      00AE4E CD 89 D3         [ 4]  245     CALL GREAT
      002DD1                        246     _QBRAN STEXP1
      00AE51 CD 85 18         [ 4]    1     CALL QBRAN
      00AE54 AE 59                    2     .word STEXP1
      00AE56 CD AD F8         [ 4]  247     CALL SFV
      00AE59                        248 STEXP1:
      00AE59 90 93            [ 1]  249     LDW Y,X 
      00AE5B 90 FE            [ 2]  250     LDW Y,(Y)
      00AE5D 4F               [ 1]  251     CLR A 
      00AE5E 90 95            [ 1]  252     LD YH,A
      00AE60 90 5E            [ 1]  253     SWAPW Y 
      00AE62 90 89            [ 2]  254     PUSHW Y  ; e >r 
      00AE64 1C 00 02         [ 2]  255     ADDW X,#CELLL 
      00AE67 CD 88 A7         [ 4]  256     CALL DDUP 
      00AE6A CD A7 1F         [ 4]  257     CALL DABS
      00AE6D CD 86 A9         [ 4]  258     CALL SWAPP 
      002DF0                        259     _DROP  
      00AE70 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      002DF3                        260     _DOLIT 127 
      00AE73 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AE76 00 7F                    2     .word 127 
      00AE78 CD 89 D3         [ 4]  261     CALL GREAT 
      002DFB                        262     _QBRAN STEXP2 
      00AE7B CD 85 18         [ 4]    1     CALL QBRAN
      00AE7E AE 83                    2     .word STEXP2
      00AE80 CD AD F8         [ 4]  263     CALL SFV 
      00AE83                        264 STEXP2: 
      00AE83 4F               [ 1]  265     CLR A 
      00AE84 F7               [ 1]  266     LD (X),A     
      00AE85 CD 85 B4         [ 4]  267     CALL RFROM 
      00AE88 CD 87 0A         [ 4]  268     CALL ORR
      00AE8B CD AD 8D         [ 4]  269     CALL SFZ 
      00AE8E CD AD C4         [ 4]  270     CALL SFN 
      00AE91 81               [ 4]  271     RET 
                                    272 
                                    273 
                                    274 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    275 ;   E. ( f# -- )
                                    276 ;   print float in scientific 
                                    277 ;   format 
                                    278 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002E12                        279     _HEADER EDOT,2,"E."
      00AE92 AE 3E                    1         .word LINK 
                           002E14     2         LINK=.
      00AE94 02                       3         .byte 2  
      00AE95 45 2E                    4         .ascii "E."
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 169.
Hexadecimal [24-Bits]



      00AE97                          5         EDOT:
      00AE97 CD 87 5F         [ 4]  280     CALL BASE 
      00AE9A CD 85 63         [ 4]  281     CALL AT 
      00AE9D CD 86 62         [ 4]  282     CALL TOR 
      002E20                        283     _DOLIT 10 
      00AEA0 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AEA3 00 0A                    2     .word 10 
      00AEA5 CD 87 5F         [ 4]  284     CALL BASE 
      00AEA8 CD 85 51         [ 4]  285     CALL STORE 
      00AEAB CD AE 11         [ 4]  286     CALL ATEXP ; m e 
      00AEAE                        287 EDOT0:
      00AEAE CD 86 62         [ 4]  288     CALL TOR   
      00AEB1 CD A7 1F         [ 4]  289     CALL DABS 
      00AEB4 CD 8F C7         [ 4]  290     CALL SPACE 
      00AEB7 CD 8E 8B         [ 4]  291     CALL BDIGS     
      00AEBA                        292 EDOT2: 
      00AEBA CD A7 8B         [ 4]  293     CALL DDIG
      00AEBD CD 85 B4         [ 4]  294     CALL RFROM 
      00AEC0 CD 8C 17         [ 4]  295     CALL ONEP 
      00AEC3 CD 86 62         [ 4]  296     CALL TOR 
      00AEC6 CD 86 99         [ 4]  297     CALL DUPP
      002E49                        298     _QBRAN EDOT3 
      00AEC9 CD 85 18         [ 4]    1     CALL QBRAN
      00AECC AE D0                    2     .word EDOT3
      00AECE 20 EA            [ 2]  299     JRA EDOT2  
      00AED0                        300 EDOT3:
      00AED0 CD 86 C1         [ 4]  301     CALL OVER 
      00AED3 CD 87 5F         [ 4]  302     CALL BASE 
      00AED6 CD 85 63         [ 4]  303     CALL AT 
      00AED9 CD 89 90         [ 4]  304     CALL ULESS 
      002E5C                        305     _QBRAN EDOT2 
      00AEDC CD 85 18         [ 4]    1     CALL QBRAN
      00AEDF AE BA                    2     .word EDOT2
      002E61                        306     _DOLIT '.'
      00AEE1 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AEE4 00 2E                    2     .word '.' 
      00AEE6 CD 8E 9B         [ 4]  307     CALL HOLD  
      00AEE9 CD A7 8B         [ 4]  308     CALL DDIG
      00AEEC CD AD 52         [ 4]  309     CALL FNE 
      002E6F                        310     _QBRAN EDOT4 
      00AEEF CD 85 18         [ 4]    1     CALL QBRAN
      00AEF2 AE FC                    2     .word EDOT4
      002E74                        311     _DOLIT '-'
      00AEF4 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AEF7 00 2D                    2     .word '-' 
      00AEF9 CD 8E 9B         [ 4]  312     CALL HOLD 
      00AEFC                        313 EDOT4:       
      002E7C                        314     _DROP 
      00AEFC 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00AEFF CD 8E F0         [ 4]  315     CALL EDIGS 
      00AF02 CD 8F F1         [ 4]  316     CALL TYPES
      00AF05 CD 85 B4         [ 4]  317     CALL RFROM 
      00AF08 CD 88 4C         [ 4]  318     CALL QDUP 
      002E8B                        319     _QBRAN EDOT5     
      00AF0B CD 85 18         [ 4]    1     CALL QBRAN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 170.
Hexadecimal [24-Bits]



      00AF0E AF 1B                    2     .word EDOT5
      002E90                        320     _DOLIT 'E'
      00AF10 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AF13 00 45                    2     .word 'E' 
      00AF15 CD 84 B6         [ 4]  321     CALL EMIT 
      00AF18 CD 90 AF         [ 4]  322     CALL DOT
      00AF1B                        323 EDOT5: 
      00AF1B CD 85 B4         [ 4]  324     CALL RFROM 
      00AF1E CD 87 5F         [ 4]  325     CALL BASE 
      00AF21 CD 85 51         [ 4]  326     CALL STORE  
      00AF24 81               [ 4]  327     RET 
                                    328 
                                    329 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                    330 ;   F. (f# -- )
                                    331 ;   print float in fixed
                                    332 ;   point format. 
                                    333 ;;;;;;;;;;;;;;;;;;;;;;;;;
      002EA5                        334     _HEADER FDOT,2,"F."
      00AF25 AE 94                    1         .word LINK 
                           002EA7     2         LINK=.
      00AF27 02                       3         .byte 2  
      00AF28 46 2E                    4         .ascii "F."
      00AF2A                          5         FDOT:
      00AF2A CD 87 5F         [ 4]  335     CALL BASE 
      00AF2D CD 85 63         [ 4]  336     CALL AT 
      00AF30 CD 86 62         [ 4]  337     CALL TOR 
      002EB3                        338     _DOLIT 10 
      00AF33 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AF36 00 0A                    2     .word 10 
      00AF38 CD 87 5F         [ 4]  339     CALL BASE 
      00AF3B CD 85 51         [ 4]  340     CALL STORE 
      00AF3E CD AE 11         [ 4]  341     CALL    ATEXP
      00AF41 CD 86 99         [ 4]  342     CALL    DUPP  
      00AF44 CD 89 6C         [ 4]  343     CALL    ABSS 
      002EC7                        344     _DOLIT  8
      00AF47 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AF4A 00 08                    2     .word 8 
      00AF4C CD 89 D3         [ 4]  345     CALL    GREAT 
      002ECF                        346     _QBRAN  FDOT1 
      00AF4F CD 85 18         [ 4]    1     CALL QBRAN
      00AF52 AF 57                    2     .word FDOT1
      00AF54 CC AE AE         [ 2]  347     JP      EDOT0 
      00AF57                        348 FDOT1:
      00AF57 CD 8F C7         [ 4]  349     CALL    SPACE 
      00AF5A CD 86 62         [ 4]  350     CALL    TOR 
      00AF5D CD AD 52         [ 4]  351     CALL    FNE 
      002EE0                        352     _QBRAN  FDOT0 
      00AF60 CD 85 18         [ 4]    1     CALL QBRAN
      00AF63 AF 68                    2     .word FDOT0
      00AF65 CD 89 18         [ 4]  353     CALL    DNEGA 
      00AF68                        354 FDOT0: 
      00AF68 CD 8E 8B         [ 4]  355     CALL    BDIGS
      00AF6B CD 85 C5         [ 4]  356     CALL    RAT  
      00AF6E CD 86 D0         [ 4]  357     CALL    ZLESS 
      002EF1                        358     _QBRAN  FDOT6 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 171.
Hexadecimal [24-Bits]



      00AF71 CD 85 18         [ 4]    1     CALL QBRAN
      00AF74 AF 99                    2     .word FDOT6
      00AF76                        359 FDOT2: ; e<0 
      00AF76 CD A7 8B         [ 4]  360     CALL    DDIG 
      00AF79 CD 85 B4         [ 4]  361     CALL    RFROM
      00AF7C CD 8C 17         [ 4]  362     CALL    ONEP 
      00AF7F CD 88 4C         [ 4]  363     CALL    QDUP 
      002F02                        364     _QBRAN  FDOT3 
      00AF82 CD 85 18         [ 4]    1     CALL QBRAN
      00AF85 AF 8C                    2     .word FDOT3
      00AF87 CD 86 62         [ 4]  365     CALL    TOR 
      00AF8A 20 EA            [ 2]  366     JRA   FDOT2 
      00AF8C                        367 FDOT3:
      002F0C                        368     _DOLIT  '.' 
      00AF8C CD 84 EF         [ 4]    1     CALL DOLIT 
      00AF8F 00 2E                    2     .word '.' 
      00AF91 CD 8E 9B         [ 4]  369     CALL    HOLD 
      00AF94 CD A7 A4         [ 4]  370     CALL    DDIGS
      00AF97 20 12            [ 2]  371     JRA   FDOT9  
      00AF99                        372 FDOT6: ; e>=0 
      00AF99 20 08            [ 2]  373     JRA   FDOT8
      00AF9B                        374 FDOT7:     
      002F1B                        375     _DOLIT  '0'
      00AF9B CD 84 EF         [ 4]    1     CALL DOLIT 
      00AF9E 00 30                    2     .word '0' 
      00AFA0 CD 8E 9B         [ 4]  376     CALL    HOLD 
      00AFA3                        377 FDOT8:
      00AFA3 CD 85 03         [ 4]  378     CALL    DONXT 
      00AFA6 AF 9B                  379     .word   FDOT7
      00AFA8 CD A7 A4         [ 4]  380     CALL    DDIGS 
      00AFAB                        381 FDOT9:
      00AFAB CD AD 52         [ 4]  382     CALL    FNE 
      002F2E                        383     _QBRAN  FDOT10 
      00AFAE CD 85 18         [ 4]    1     CALL QBRAN
      00AFB1 AF BB                    2     .word FDOT10
      002F33                        384     _DOLIT '-' 
      00AFB3 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AFB6 00 2D                    2     .word '-' 
      00AFB8 CD 8E 9B         [ 4]  385     CALL   HOLD 
      00AFBB                        386 FDOT10:
      00AFBB CD 8E F0         [ 4]  387     CALL    EDIGS 
      00AFBE CD 8F F1         [ 4]  388     CALL    TYPES 
      00AFC1 CD 85 B4         [ 4]  389     CALL    RFROM 
      00AFC4 CD 87 5F         [ 4]  390     CALL    BASE 
      00AFC7 CD 85 51         [ 4]  391     CALL    STORE 
      00AFCA 81               [ 4]  392     RET 
                                    393 
                                    394 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    395 ; return parsed exponent or 
                                    396 ; 0 if failed
                                    397 ; at entry exprect *a=='E'    
                                    398 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00AFCB                        399 parse_exponent: ; a cntr -- e -1 | 0 
      00AFCB CD 86 62         [ 4]  400     CALL TOR   ; R: cntr 
      00AFCE CD 86 99         [ 4]  401     CALL DUPP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 172.
Hexadecimal [24-Bits]



      00AFD1 CD 85 81         [ 4]  402     CALL CAT 
      002F54                        403     _DOLIT 'E' 
      00AFD4 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AFD7 00 45                    2     .word 'E' 
      00AFD9 CD 89 7A         [ 4]  404     CALL EQUAL 
      002F5C                        405     _QBRAN 1$
      00AFDC CD 85 18         [ 4]    1     CALL QBRAN
      00AFDF B0 0C                    2     .word 1$
      00AFE1 CD 8C 17         [ 4]  406     CALL ONEP 
      00AFE4 CD 85 B4         [ 4]  407     CALL RFROM  ; a cntr 
      00AFE7 CD 8C 24         [ 4]  408     CALL ONEM
      00AFEA CD 86 99         [ 4]  409     CALL DUPP 
      002F6D                        410     _QBRAN 2$ ; a cntr 
      00AFED CD 85 18         [ 4]    1     CALL QBRAN
      00AFF0 B0 0F                    2     .word 2$
      00AFF2 CD 8C 83         [ 4]  411     CALL ZERO
      00AFF5 CD 86 99         [ 4]  412     CALL DUPP 
      00AFF8 CD A8 3B         [ 4]  413     CALL DSWAP ; 0 0 a cntr  
      00AFFB CD A5 DD         [ 4]  414     CALL nsign 
      00AFFE CD 86 62         [ 4]  415     CALL TOR   ; R: esign  
      00B001 CD A6 0A         [ 4]  416     CALL parse_digits
      002F84                        417     _QBRAN PARSEXP_SUCCESS ; parsed to end of string 
      00B004 CD 85 18         [ 4]    1     CALL QBRAN
      00B007 B0 16                    2     .word PARSEXP_SUCCESS
                                    418 ; failed invalid character
      002F89                        419     _DDROP ; 0 a 
      00B009 1C 00 04         [ 2]    1    ADDW X,#2*CELLL 
      00B00C                        420 1$: 
      00B00C CD 85 B4         [ 4]  421     CALL RFROM ; sign||cntr  
      00B00F                        422 2$:
      002F8F                        423     _DDROP  ; a cntr || a sign || 0 cntr   
      00B00F 1C 00 04         [ 2]    1    ADDW X,#2*CELLL 
      00B012 CD 8C 83         [ 4]  424     CALL ZERO   ; return only 0 
      00B015 81               [ 4]  425     RET 
      00B016                        426 PARSEXP_SUCCESS: 
      002F96                        427     _DDROP ; drop dhi a 
      00B016 1C 00 04         [ 2]    1    ADDW X,#2*CELLL 
      00B019 CD 85 B4         [ 4]  428     CALL RFROM ; es 
      002F9C                        429     _QBRAN 1$
      00B01C CD 85 18         [ 4]    1     CALL QBRAN
      00B01F B0 24                    2     .word 1$
      00B021 CD 89 06         [ 4]  430     CALL NEGAT
      00B024                        431 1$:
      002FA4                        432     _DOLIT -1 ; -- e -1 
      00B024 CD 84 EF         [ 4]    1     CALL DOLIT 
      00B027 FF FF                    2     .word -1 
      00B029 81               [ 4]  433     RET 
                                    434 
                                    435 
                                    436 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    437 ;   FLOAT?  ( a dlo dhi a+ cntr sign d? -- f -3 | a 0 )
                                    438 ;   called by NUMBER? 
                                    439 ;   convert string to float 
                                    440 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002FAA                        441     _HEADER FLOATQ,5,"FLOAT?"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 173.
Hexadecimal [24-Bits]



      00B02A AF 27                    1         .word LINK 
                           002FAC     2         LINK=.
      00B02C 05                       3         .byte 5  
      00B02D 46 4C 4F 41 54 3F        4         .ascii "FLOAT?"
      00B033                          5         FLOATQ:
      002FB3                        442     _QBRAN FLOATQ0 
      00B033 CD 85 18         [ 4]    1     CALL QBRAN
      00B036 B0 3B                    2     .word FLOATQ0
      00B038 CC B0 DA         [ 2]  443     JP FLOAT_ERROR  ; not a float, string start with '#'
      00B03B                        444 FLOATQ0:
                                    445 ; BASE must be 10 
      00B03B CD 87 5F         [ 4]  446     CALL BASE 
      00B03E CD 85 63         [ 4]  447     CALL AT 
      002FC1                        448     _DOLIT 10 
      00B041 CD 84 EF         [ 4]    1     CALL DOLIT 
      00B044 00 0A                    2     .word 10 
      00B046 CD 89 7A         [ 4]  449     CALL EQUAL 
      002FC9                        450     _QBRAN FLOAT_ERROR 
      00B049 CD 85 18         [ 4]    1     CALL QBRAN
      00B04C B0 DA                    2     .word FLOAT_ERROR
                                    451 ; if float next char is '.' or 'E' 
      00B04E CD 86 62         [ 4]  452     CALL TOR ; R: sign  
      00B051 CD 86 62         [ 4]  453     CALL TOR ; R: sign cntr 
      00B054 CD 86 99         [ 4]  454     CALL DUPP
      00B057 CD 85 81         [ 4]  455     CALL CAT 
      002FDA                        456     _DOLIT '.' 
      00B05A CD 84 EF         [ 4]    1     CALL DOLIT 
      00B05D 00 2E                    2     .word '.' 
      00B05F CD 89 7A         [ 4]  457     CALL EQUAL 
      002FE2                        458     _QBRAN FLOATQ1 ; not a dot 
      00B062 CD 85 18         [ 4]    1     CALL QBRAN
      00B065 B0 9A                    2     .word FLOATQ1
      00B067 CD 8C 17         [ 4]  459     CALL ONEP 
      00B06A CD 85 B4         [ 4]  460     CALL RFROM  ; dlo dhi a cntr R: sign  
      00B06D CD 8C 24         [ 4]  461     CALL ONEM 
      00B070 CD 86 99         [ 4]  462     CALL DUPP 
      00B073 CD 86 62         [ 4]  463     CALL TOR  ; R: sign cntr 
                                    464 ; parse fractional part
      00B076 CD A6 0A         [ 4]  465     CALL parse_digits ; dlo dhi a cntr -- dm a cntr 
      00B079 CD 86 99         [ 4]  466     CALL DUPP 
      00B07C CD 85 B4         [ 4]  467     CALL RFROM 
      00B07F CD 86 A9         [ 4]  468     CALL SWAPP 
      00B082 CD 89 52         [ 4]  469     CALL SUBB ; fd -> fraction digits count 
      00B085 CD 86 62         [ 4]  470     CALL TOR  ; dlo dhi a cntr R: sign fd 
      00B088 CD 86 99         [ 4]  471     CALL DUPP ; cntr cntr  
      00300B                        472     _QBRAN 1$ ; end of string, no exponent
      00B08B CD 85 18         [ 4]    1     CALL QBRAN
      00B08E B0 92                    2     .word 1$
      00B090 20 11            [ 2]  473     JRA FLOATQ2
      00B092 CD 86 A9         [ 4]  474 1$: CALL SWAPP 
      003015                        475     _DROP ; a
      00B095 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00B098 20 11            [ 2]  476     JRA FLOATQ3        
      00B09A                        477 FLOATQ1: ; must push fd==0 on RSTACK 
      00B09A CD 85 B4         [ 4]  478     CALL RFROM ; cntr 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 174.
Hexadecimal [24-Bits]



      00B09D CD 8C 83         [ 4]  479     CALL ZERO  ; fd 
      00B0A0 CD 86 62         [ 4]  480     CALL TOR   ; dm a cntr R: sign fd 
      00B0A3                        481 FLOATQ2: 
      00B0A3 CD AF CB         [ 4]  482     CALL parse_exponent 
      003026                        483     _QBRAN FLOAT_ERROR0 ; exponent expected 
      00B0A6 CD 85 18         [ 4]    1     CALL QBRAN
      00B0A9 B0 D7                    2     .word FLOAT_ERROR0
      00B0AB                        484 FLOATQ3: ; dm 0 || dm e  
      00B0AB CD 85 B4         [ 4]  485     CALL RFROM ;  fd  
      00B0AE CD 89 52         [ 4]  486     CALL SUBB  ; exp=e-fd 
      00B0B1 CD 88 7C         [ 4]  487     CALL NROT 
      00B0B4 CD 85 B4         [ 4]  488     CALL RFROM  ; sign 
      003037                        489     _QBRAN FLOATQ4 
      00B0B7 CD 85 18         [ 4]    1     CALL QBRAN
      00B0BA B0 BF                    2     .word FLOATQ4
      00B0BC CD 89 18         [ 4]  490     CALL DNEGA 
      00B0BF                        491 FLOATQ4:
      00B0BF CD 88 5D         [ 4]  492     CALL ROT 
      00B0C2 CD AE 43         [ 4]  493     CALL STEXP 
      00B0C5 CD 88 5D         [ 4]  494     CALL ROT 
      003048                        495     _DROP 
      00B0C8 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00B0CB CD AD C4         [ 4]  496     CALL SFN 
      00B0CE CD AD 8D         [ 4]  497     CALL SFZ 
      003051                        498     _DOLIT -3 
      00B0D1 CD 84 EF         [ 4]    1     CALL DOLIT 
      00B0D4 FF FD                    2     .word -3 
      00B0D6 81               [ 4]  499     RET       
      00B0D7                        500 FLOAT_ERROR0: 
      00B0D7 CD A9 A8         [ 4]  501     CALL DRFROM ; sign df      
      00B0DA                        502 FLOAT_ERROR: 
      00B0DA CD 8C C5         [ 4]  503     CALL DEPTH 
      00B0DD CD 8C 0A         [ 4]  504     CALL CELLS 
      00B0E0 CD 86 79         [ 4]  505     CALL SPAT 
      00B0E3 CD 86 A9         [ 4]  506     CALL SWAPP 
      00B0E6 CD 88 BC         [ 4]  507     CALL PLUS  
      00B0E9 CD 86 86         [ 4]  508     CALL SPSTO 
      00B0EC CD 8C 83         [ 4]  509     CALL ZERO 
      00B0EF 81               [ 4]  510     RET 
                                    511 
                                    512 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    513 ;  LSCALE ( f# -- f# )
                                    514 ;  m *=10 , e -= 1
                                    515 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      003070                        516     _HEADER LSCALE,6,"LSCALE"
      00B0F0 B0 2C                    1         .word LINK 
                           003072     2         LINK=.
      00B0F2 06                       3         .byte 6  
      00B0F3 4C 53 43 41 4C 45        4         .ascii "LSCALE"
      00B0F9                          5         LSCALE:
      00B0F9 CD AE 11         [ 4]  517     CALL ATEXP 
      00B0FC CD 8C 8E         [ 4]  518     CALL ONE 
      00B0FF CD 89 52         [ 4]  519     CALL SUBB 
      00B102 CD 86 62         [ 4]  520     CALL TOR
      003085                        521     _DOLIT 10 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 175.
Hexadecimal [24-Bits]



      00B105 CD 84 EF         [ 4]    1     CALL DOLIT 
      00B108 00 0A                    2     .word 10 
      00B10A CD A8 15         [ 4]  522     CALL DSSTAR
      00B10D CD 85 B4         [ 4]  523     CALL RFROM 
      00B110 CD AE 43         [ 4]  524     CALL STEXP 
      00B113 81               [ 4]  525     RET  
                                    526 
                                    527 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    528 ;  RSCALE ( f# -- f# )
                                    529 ;  m /=10 , e+=1 
                                    530 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      003094                        531     _HEADER RSCALE,6,"RSCALE"
      00B114 B0 F2                    1         .word LINK 
                           003096     2         LINK=.
      00B116 06                       3         .byte 6  
      00B117 52 53 43 41 4C 45        4         .ascii "RSCALE"
      00B11D                          5         RSCALE:
      00B11D CD AE 11         [ 4]  532     CALL ATEXP 
      00B120 CD 8C 8E         [ 4]  533     CALL ONE 
      00B123 CD 88 BC         [ 4]  534     CALL PLUS 
      00B126 CD 86 62         [ 4]  535     CALL TOR 
      0030A9                        536     _DOLIT 10 
      00B129 CD 84 EF         [ 4]    1     CALL DOLIT 
      00B12C 00 0A                    2     .word 10 
      00B12E CD A7 4A         [ 4]  537     CALL DSLMOD 
      00B131 CD 88 5D         [ 4]  538     CALL ROT 
      0030B4                        539     _DROP 
      00B134 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00B137 CD 85 B4         [ 4]  540     CALL RFROM 
      00B13A CD AE 43         [ 4]  541     CALL STEXP 
      00B13D 81               [ 4]  542     RET 
                                    543 
                                    544 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    545 ;  SCALEUP ( ud u1 u2 -- ud*10 u1 u2 )
                                    546 ;  while (ud<=0xcccccccc && u1<u2 ){
                                    547 ;        ud*10;
                                    548 ;        u2--;
                                    549 ;  }  
                                    550 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00B13E                        551 SCALEUP:
      00B13E CD 88 A7         [ 4]  552     CALL DDUP
      00B141 CD 89 A6         [ 4]  553     CALL LESS  
      0030C4                        554     _QBRAN SCALEUP3
      00B144 CD 85 18         [ 4]    1     CALL QBRAN
      00B147 B1 74                    2     .word SCALEUP3
      00B149 CD A9 8A         [ 4]  555     CALL DTOR   ; R: u1 u2  
      00B14C CD 88 A7         [ 4]  556     CALL DDUP 
      0030CF                        557     _DOLIT 0XCCCC 
      00B14F CD 84 EF         [ 4]    1     CALL DOLIT 
      00B152 CC CC                    2     .word 0XCCCC 
      0030D4                        558     _DOLIT 0XCCC 
      00B154 CD 84 EF         [ 4]    1     CALL DOLIT 
      00B157 0C CC                    2     .word 0XCCC 
      00B159 CD A9 4D         [ 4]  559     CALL DGREAT  
      0030DC                        560     _TBRAN SCALEUP2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 176.
Hexadecimal [24-Bits]



      00B15C CD 85 26         [ 4]    1     CALL TBRAN 
      00B15F B1 71                    2     .word SCALEUP2 
      0030E1                        561     _DOLIT 10 
      00B161 CD 84 EF         [ 4]    1     CALL DOLIT 
      00B164 00 0A                    2     .word 10 
      00B166 CD A7 F3         [ 4]  562     CALL UDSSTAR 
      00B169 CD A9 A8         [ 4]  563     CALL DRFROM 
      00B16C CD 8C 24         [ 4]  564     CALL ONEM
      00B16F 20 CD            [ 2]  565     JRA SCALEUP
      00B171                        566 SCALEUP2:
      00B171 CD A9 A8         [ 4]  567     CALL DRFROM
      00B174                        568 SCALEUP3: 
      00B174 81               [ 4]  569     RET 
                                    570 
                                    571 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    572 ; SCALEDOWN ( ud u1 u2 -- ud u1 u2 )
                                    573 ;  whhile (ud && u1>u2 ){ 
                                    574 ;     ud/10;
                                    575 ;     u2++;
                                    576 ;  } 
                                    577 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00B175                        578 SCALEDOWN: 
      00B175 CD 88 A7         [ 4]  579     CALL DDUP 
      00B178 CD 89 D3         [ 4]  580     CALL GREAT 
      0030FB                        581     _QBRAN SCALDN3 
      00B17B CD 85 18         [ 4]    1     CALL QBRAN
      00B17E B1 A4                    2     .word SCALDN3
      00B180 CD A9 8A         [ 4]  582     CALL DTOR 
      00B183 CD 88 A7         [ 4]  583     CALL DDUP 
      00B186 CD A9 10         [ 4]  584     CALL DZEQUAL 
      003109                        585     _TBRAN SCALDN2  
      00B189 CD 85 26         [ 4]    1     CALL TBRAN 
      00B18C B1 A1                    2     .word SCALDN2 
      00310E                        586     _DOLIT 10
      00B18E CD 84 EF         [ 4]    1     CALL DOLIT 
      00B191 00 0A                    2     .word 10 
      00B193 CD 8C 83         [ 4]  587     CALL ZERO  
      00B196 CD AC 55         [ 4]  588     CALL DSLASH 
      00B199 CD A9 A8         [ 4]  589     CALL DRFROM 
      00B19C CD 8C 17         [ 4]  590     CALL ONEP  
      00B19F 20 D4            [ 2]  591     JRA SCALEDOWN 
      00B1A1                        592 SCALDN2:
      00B1A1 CD A9 A8         [ 4]  593     CALL DRFROM 
      00B1A4                        594 SCALDN3:
      00B1A4 81               [ 4]  595     RET 
                                    596 
                                    597 
                                    598 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    599 ;  F-ALIGN ( f#1 f#2 -- m1 m2 e )
                                    600 ;  align to same exponent 
                                    601 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      003125                        602     _HEADER FALIGN,7,"F-ALIGN"
      00B1A5 B1 16                    1         .word LINK 
                           003127     2         LINK=.
      00B1A7 07                       3         .byte 7  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 177.
Hexadecimal [24-Bits]



      00B1A8 46 2D 41 4C 49 47 4E     4         .ascii "F-ALIGN"
      00B1AF                          5         FALIGN:
      00B1AF CD AE 11         [ 4]  603     CALL ATEXP 
      00B1B2 CD 86 62         [ 4]  604     CALL TOR 
      00B1B5 CD A8 3B         [ 4]  605     CALL DSWAP 
      00B1B8 CD AE 11         [ 4]  606     CALL ATEXP 
      00B1BB CD 86 62         [ 4]  607     CALL TOR    ; m2 m1 R: e2 e1 
      00B1BE CD A8 3B         [ 4]  608     CALL DSWAP 
      00B1C1 CD A9 C0         [ 4]  609     CALL DRAT 
      00B1C4 CD 89 7A         [ 4]  610     CALL EQUAL 
      003147                        611     _TBRAN FALGN8
      00B1C7 CD 85 26         [ 4]    1     CALL TBRAN 
      00B1CA B2 4C                    2     .word FALGN8 
                                    612 ; scaleup the largest float 
                                    613 ; but limit mantissa <=0xccccccc
                                    614 ; to avoid mantissa overflow     
      00B1CC CD A9 C0         [ 4]  615     CALL DRAT ; m1 m2 e2 e1 
      00B1CF CD 89 D3         [ 4]  616     CALL GREAT 
      003152                        617     _QBRAN FALGN4 ; e2<e1 
      00B1D2 CD 85 18         [ 4]    1     CALL QBRAN
      00B1D5 B1 E8                    2     .word FALGN4
                                    618 ; e2>e1 then scale up m2   
      00B1D7 CD A9 A8         [ 4]  619     CALL DRFROM 
      00B1DA CD 86 A9         [ 4]  620     CALL SWAPP 
      00B1DD CD B1 3E         [ 4]  621     CALL SCALEUP 
      00B1E0 CD 86 A9         [ 4]  622     CALL SWAPP 
      00B1E3 CD A9 8A         [ 4]  623     CALL DTOR 
      00B1E6 20 0F            [ 2]  624     JRA FALGN6
      00B1E8                        625 FALGN4: ; e2<e1 then scaleup m1 
      00B1E8 CD A8 3B         [ 4]  626     CALL DSWAP 
      00B1EB CD A9 A8         [ 4]  627     CALL DRFROM 
      00B1EE CD B1 3E         [ 4]  628     CALL SCALEUP 
      00B1F1 CD A9 8A         [ 4]  629     CALL DTOR
      00B1F4 CD A8 3B         [ 4]  630     CALL DSWAP 
                                    631 ; check again for e2==e1 
                                    632 ; if scaleup was not enough 
                                    633 ; to equalize exponent then
                                    634 ; scaledown smallest float     
      00B1F7                        635 FALGN6: 
      00B1F7 CD A9 C0         [ 4]  636     CALL DRAT 
      00B1FA CD 89 7A         [ 4]  637     CALL EQUAL 
      00317D                        638     _TBRAN FALGN8 
      00B1FD CD 85 26         [ 4]    1     CALL TBRAN 
      00B200 B2 4C                    2     .word FALGN8 
                                    639 ; e2!=e1 need to scale down smallest 
      00B202 CD A9 C0         [ 4]  640     CALL DRAT 
      00B205 CD 89 D3         [ 4]  641     CALL GREAT 
      003188                        642     _QBRAN FALGN7 ; e2<e1 
      00B208 CD 85 18         [ 4]    1     CALL QBRAN
      00B20B B2 1E                    2     .word FALGN7
                                    643 ; e2>e1 scaledown m1 
      00B20D CD A8 3B         [ 4]  644     CALL DSWAP 
      00B210 CD A9 A8         [ 4]  645     CALL DRFROM 
      00B213 CD B1 75         [ 4]  646     CALL SCALEDOWN
      00B216 CD 86 A9         [ 4]  647     CALL SWAPP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 178.
Hexadecimal [24-Bits]



      00B219 CD A9 8A         [ 4]  648     CALL DTOR 
      00B21C 20 0F            [ 2]  649     JRA FALGN71  
      00B21E                        650 FALGN7: ; e2<e1 scaledown m2 
      00B21E CD A9 A8         [ 4]  651     CALL DRFROM 
      00B221 CD 86 A9         [ 4]  652     CALL SWAPP 
      00B224 CD B1 75         [ 4]  653     CALL SCALEDOWN 
      00B227 CD 86 A9         [ 4]  654     CALL SWAPP 
      00B22A CD A9 8A         [ 4]  655     CALL DTOR 
                                    656 ; after scaledown if e2!=e1 
                                    657 ; this imply that one of mantissa 
                                    658 ; as been nullified by scalling 
                                    659 ; hence keep largest exponent 
      00B22D                        660 FALGN71:
      00B22D CD A9 C0         [ 4]  661     CALL DRAT 
      00B230 CD 89 7A         [ 4]  662     CALL EQUAL
      0031B3                        663     _TBRAN FALGN8 
      00B233 CD 85 26         [ 4]    1     CALL TBRAN 
      00B236 B2 4C                    2     .word FALGN8 
      00B238 CD A9 A8         [ 4]  664     CALL DRFROM 
      00B23B CD 88 A7         [ 4]  665     CALL DDUP 
      00B23E CD 89 D3         [ 4]  666     CALL GREAT 
      0031C1                        667     _TBRAN FALGN72
      00B241 CD 85 26         [ 4]    1     CALL TBRAN 
      00B244 B2 49                    2     .word FALGN72 
      00B246 CD 86 A9         [ 4]  668     CALL SWAPP     
      00B249                        669 FALGN72:
      00B249 CD A9 8A         [ 4]  670     CALL DTOR  ; now smallest e is at rtop.
      00B24C                        671 FALGN8:
      00B24C CD A9 A8         [ 4]  672     CALL DRFROM 
      0031CF                        673     _DROP 
      00B24F 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00B252 81               [ 4]  674     RET 
                                    675 
                                    676 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    677 ;   F+ ( f#1 f#2 -- f#1+f#2 )
                                    678 ;   float addition 
                                    679 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0031D3                        680     _HEADER FPLUS,2,"F+"
      00B253 B1 A7                    1         .word LINK 
                           0031D5     2         LINK=.
      00B255 02                       3         .byte 2  
      00B256 46 2B                    4         .ascii "F+"
      00B258                          5         FPLUS:
      00B258 CD B1 AF         [ 4]  681     CALL FALIGN 
      00B25B CD 86 62         [ 4]  682     CALL TOR 
      00B25E CD AC 64         [ 4]  683     CALL DPLUS
      00B261 CD A7 30         [ 4]  684     CALL DSIGN 
      00B264 CD 86 62         [ 4]  685     CALL TOR 
      00B267 CD A7 1F         [ 4]  686     CALL DABS 
      00B26A CD B2 CD         [ 4]  687     CALL SCALETOM
      00B26D CD 85 B4         [ 4]  688     CALL RFROM 
      0031F0                        689     _QBRAN FPLUS1 
      00B270 CD 85 18         [ 4]    1     CALL QBRAN
      00B273 B2 78                    2     .word FPLUS1
      00B275 CD 89 18         [ 4]  690     CALL DNEGA  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 179.
Hexadecimal [24-Bits]



      00B278                        691 FPLUS1: 
      00B278 CD 88 5D         [ 4]  692     CALL ROT   
      00B27B CD 85 B4         [ 4]  693     CALL RFROM
      00B27E CD 88 BC         [ 4]  694     CALL PLUS  
      00B281 CD AE 43         [ 4]  695     CALL STEXP 
      00B284 81               [ 4]  696     RET 
                                    697 
                                    698 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    699 ;  F- ( f#1 f#2 -- f#1-f#2 )
                                    700 ;  substraction 
                                    701 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      003205                        702     _HEADER FSUB,2,"F-"
      00B285 B2 55                    1         .word LINK 
                           003207     2         LINK=.
      00B287 02                       3         .byte 2  
      00B288 46 2D                    4         .ascii "F-"
      00B28A                          5         FSUB:
      00B28A CD B1 AF         [ 4]  703     CALL FALIGN 
      00B28D CD 86 62         [ 4]  704     CALL TOR 
      00B290 CD AC 96         [ 4]  705     CALL DSUB
      00B293 CD A7 30         [ 4]  706     CALL DSIGN 
      00B296 CD 86 62         [ 4]  707     CALL TOR 
      00B299 CD A7 1F         [ 4]  708     CALL DABS 
      00B29C CD B2 CD         [ 4]  709     CALL SCALETOM 
      00B29F CD 85 B4         [ 4]  710     CALL RFROM 
      003222                        711     _QBRAN FSUB1 
      00B2A2 CD 85 18         [ 4]    1     CALL QBRAN
      00B2A5 B2 AA                    2     .word FSUB1
      00B2A7 CD 89 18         [ 4]  712     CALL DNEGA 
      00B2AA                        713 FSUB1:
      00B2AA CD 88 5D         [ 4]  714     CALL ROT 
      00B2AD CD 85 B4         [ 4]  715     CALL RFROM
      00B2B0 CD 88 BC         [ 4]  716     CALL PLUS  
      00B2B3 CD AE 43         [ 4]  717     CALL STEXP 
      00B2B6 81               [ 4]  718     RET 
                                    719 
                                    720 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    721 ; /mod10  ( m -- m/10 r )
                                    722 ; divide mantissa by 10 
                                    723 ; return quotient and remainder 
                                    724 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00B2B7                        725 UMOD10:
      003237                        726     _DOLIT 10 
      00B2B7 CD 84 EF         [ 4]    1     CALL DOLIT 
      00B2BA 00 0A                    2     .word 10 
      00B2BC CD A7 4A         [ 4]  727     CALL DSLMOD
      00B2BF CD 88 5D         [ 4]  728     CALL ROT  
      00B2C2 81               [ 4]  729     RET 
                                    730 
                                    731 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    732 ;   SCALE>M ( ud1 -- e ud2 )
                                    733 ;   scale down a double  
                                    734 ;   by repeated d/10
                                    735 ;   until ud<=MAX_MANTISSA   
                                    736 ;   e is log10 exponent of scaled down
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 180.
Hexadecimal [24-Bits]



                                    737 ;   ud2 is scaled down ud1 
                                    738 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      003243                        739     _HEADER SCALETOM,7,"SCALE>M"
      00B2C3 B2 87                    1         .word LINK 
                           003245     2         LINK=.
      00B2C5 07                       3         .byte 7  
      00B2C6 53 43 41 4C 45 3E 4D     4         .ascii "SCALE>M"
      00B2CD                          5         SCALETOM:
      00B2CD CD 8C 83         [ 4]  740     CALL ZERO 
      00B2D0 CD 88 7C         [ 4]  741     CALL NROT 
      00B2D3                        742 SCAL1:
      00B2D3 CD 86 99         [ 4]  743     CALL DUPP 
      003256                        744     _DOLIT 0X7F 
      00B2D6 CD 84 EF         [ 4]    1     CALL DOLIT 
      00B2D9 00 7F                    2     .word 0X7F 
      00B2DB CD 89 BD         [ 4]  745     CALL UGREAT 
      00325E                        746     _QBRAN SCAL2  
      00B2DE CD 85 18         [ 4]    1     CALL QBRAN
      00B2E1 B2 F4                    2     .word SCAL2
      00B2E3 CD B2 B7         [ 4]  747     CALL UMOD10 
      003266                        748     _DROP 
      00B2E6 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00B2E9 CD 88 5D         [ 4]  749     CALL ROT 
      00B2EC CD 8C 17         [ 4]  750     CALL ONEP 
      00B2EF CD 88 7C         [ 4]  751     CALL NROT  
      00B2F2 20 DF            [ 2]  752     JRA SCAL1 
      00B2F4                        753 SCAL2: 
      00B2F4 81               [ 4]  754     RET 
                                    755 
                                    756 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    757 ;  UDIV10 ( ut -- ut )
                                    758 ;  divide a 48 bits uint by 10 
                                    759 ;  used to scale down MM* 
                                    760 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00B2F5                        761 UDIV10:
      00B2F5 90 93            [ 1]  762     LDW Y,X 
      00B2F7 90 FE            [ 2]  763     LDW Y,(Y)
      00B2F9 A6 0A            [ 1]  764     LD A,#10 
      00B2FB 90 62            [ 2]  765     DIV Y,A 
      00B2FD FF               [ 2]  766     LDW (X),Y 
      00B2FE 90 95            [ 1]  767     LD YH,A 
      00B300 E6 02            [ 1]  768     LD A,(2,X)
      00B302 90 97            [ 1]  769     LD YL,A 
      00B304 A6 0A            [ 1]  770     LD A,#10 
      00B306 90 62            [ 2]  771     DIV Y,A 
      00B308 90 95            [ 1]  772     LD YH,A 
      00B30A 90 9F            [ 1]  773     LD A,YL 
      00B30C E7 02            [ 1]  774     LD (2,X),A 
      00B30E E6 03            [ 1]  775     LD A,(3,X)
      00B310 90 97            [ 1]  776     LD YL,A 
      00B312 A6 0A            [ 1]  777     LD A,#10 
      00B314 90 62            [ 2]  778     DIV Y,A 
      00B316 90 95            [ 1]  779     LD YH,A 
      00B318 90 9F            [ 1]  780     LD A,YL 
      00B31A E7 03            [ 1]  781     LD (3,X),A 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 181.
Hexadecimal [24-Bits]



      00B31C E6 04            [ 1]  782     LD A,(4,X)
      00B31E 90 97            [ 1]  783     LD YL,A 
      00B320 A6 0A            [ 1]  784     LD A,#10 
      00B322 90 62            [ 2]  785     DIV Y,A 
      00B324 90 95            [ 1]  786     LD YH,A 
      00B326 90 9F            [ 1]  787     LD A,YL 
      00B328 E7 04            [ 1]  788     LD (4,X),A 
      00B32A E6 05            [ 1]  789     LD A,(5,X)
      00B32C 90 97            [ 1]  790     LD YL,A 
      00B32E A6 0A            [ 1]  791     LD A,#10 
      00B330 90 62            [ 2]  792     DIV Y,A 
      00B332 90 9F            [ 1]  793     LD A,YL 
      00B334 E7 05            [ 1]  794     LD (5,X),A 
      00B336 81               [ 4]  795     RET 
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
      0032B7                        806     _HEADER MMSTAR,3,"MM*"
      00B337 B2 C5                    1         .word LINK 
                           0032B9     2         LINK=.
      00B339 03                       3         .byte 3  
      00B33A 4D 4D 2A                 4         .ascii "MM*"
      00B33D                          5         MMSTAR:
      00B33D CD 88 A7         [ 4]  807     CALL DDUP
      00B340 CD A9 10         [ 4]  808     CALL DZEQUAL
      0032C3                        809     _TBRAN MMSTA2
      00B343 CD 85 26         [ 4]    1     CALL TBRAN 
      00B346 B3 53                    2     .word MMSTA2 
      00B348                        810 MMSTA1:
      00B348 CD AA 51         [ 4]  811     CALL DOVER 
      00B34B CD A9 10         [ 4]  812     CALL DZEQUAL 
      0032CE                        813     _QBRAN MMSTA3 
      00B34E CD 85 18         [ 4]    1     CALL QBRAN
      00B351 B3 5E                    2     .word MMSTA3
      00B353                        814 MMSTA2: ; ( -- 0 0 0 )
      00B353 1C 00 02         [ 2]  815     ADDW X,#2 
      00B356 90 5F            [ 1]  816     CLRW Y 
      00B358 FF               [ 2]  817     LDW (X),Y 
      00B359 EF 02            [ 2]  818     LDW (2,X),Y
      00B35B EF 04            [ 2]  819     LDW (4,X),Y 
      00B35D 81               [ 4]  820     RET 
      00B35E                        821 MMSTA3:
      00B35E CD A7 30         [ 4]  822     CALL DSIGN 
      00B361 CD 86 62         [ 4]  823     CALL TOR    ; R: m2sign 
      00B364 CD A7 1F         [ 4]  824     CALL DABS   ; m1 um2 
      00B367 CD A8 3B         [ 4]  825     CALL DSWAP  ; um2 m1 
      00B36A CD A7 30         [ 4]  826     CALL DSIGN  ; um2 m1 m1sign 
      00B36D CD 85 B4         [ 4]  827     CALL RFROM 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 182.
Hexadecimal [24-Bits]



      00B370 CD 87 1F         [ 4]  828     CALL XORR 
      00B373 CD 86 62         [ 4]  829     CALL TOR   ; R: product_sign 
      00B376 CD A7 1F         [ 4]  830     CALL DABS  ; um2 um1  
      00B379 CD A9 8A         [ 4]  831     CALL DTOR  ; um2 
      00B37C CD 86 99         [ 4]  832     CALL DUPP  ; um2 um2hi 
      00B37F CD 85 C5         [ 4]  833     CALL RAT   ; um2 um2hi um1hi
                                    834 ; first partial product  
                                    835 ; pd1=um2hi*um1hi 
      00B382 CD 8B 96         [ 4]  836     CALL STAR 
      00B385 CD 8C 83         [ 4]  837     CALL ZERO 
      00B388 CD 86 A9         [ 4]  838     CALL SWAPP ; pd1<<16  
      00B38B CD A8 3B         [ 4]  839     CALL DSWAP ; pd1 um2 
      00B38E CD 86 C1         [ 4]  840     CALL OVER  ; pd1 um2 um2lo 
      00B391 CD 85 B4         [ 4]  841     CALL RFROM ; pd1 um2 um2lo um1hi 
                                    842 ; pd2=um2lo*um1hi 
      00B394 CD 8B 4C         [ 4]  843     CALL UMSTA ; pd1 um2 pd2 
      00B397 CD A8 3B         [ 4]  844     CALL DSWAP ; pd1 pd2 um2 
      00B39A CD 85 C5         [ 4]  845     CALL RAT   ; pd1 pd2 um2 um1lo 
                                    846 ; pd3= um2hi*um1lo 
      00B39D CD 8B 4C         [ 4]  847     CALL UMSTA ; pd1 pd2 um2lo pd3 
      00B3A0 CD 88 5D         [ 4]  848     CALL ROT ; pd1 pd2 pd3 um2lo 
      00B3A3 CD 86 62         [ 4]  849     CALL TOR ; pd1 pd2 pd3 R: psign um1lo um2lo 
                                    850 ; pd1+pd2+pd3  pd1
      00B3A6 CD AC 64         [ 4]  851     CALL DPLUS 
      00B3A9 CD AC 64         [ 4]  852     CALL DPLUS  
      00B3AC CD A9 A8         [ 4]  853     CALL DRFROM ; triple um2lo um1lo 
                                    854 ; last partial product um2lo*um1lo 
      00B3AF CD 8B 4C         [ 4]  855     CALL UMSTA ; prod pd4 
                                    856 ; mm*=prod<<16+pd4  
      00B3B2 CD A9 8A         [ 4]  857     CALL DTOR ;   R: psign pd4lo pd4hi  
                                    858  ; add pd4hi to prodlo and propagate carry 
      00B3B5 90 93            [ 1]  859     LDW Y,X 
      00B3B7 90 EE 02         [ 2]  860     LDW Y,(2,Y)  ; prodlo 
      00B3BA 72 F9 01         [ 2]  861     ADDW Y,(1,SP)  ; prodlo+pd4hi 
      00B3BD 17 01            [ 2]  862     LDW (1,SP),Y    ; plo phi  
      00B3BF 90 93            [ 1]  863     LDW Y,X
      00B3C1 90 FE            [ 2]  864     LDW Y,(Y) ; prodhi  
      00B3C3 24 04            [ 1]  865     JRNC MMSTA4
      00B3C5 72 A9 00 01      [ 2]  866     ADDW Y,#1 ; add carry 
      00B3C9                        867 MMSTA4:     
      00B3C9 1D 00 02         [ 2]  868     SUBW X,#2 
      00B3CC FF               [ 2]  869     LDW (X),Y 
      00B3CD 90 85            [ 2]  870     POPW Y 
      00B3CF EF 02            [ 2]  871     LDW (2,X),Y 
      00B3D1 90 85            [ 2]  872     POPW Y 
      00B3D3 EF 04            [ 2]  873     LDW (4,X),Y
      00B3D5 CD 8C 83         [ 4]  874     CALL ZERO 
      00B3D8 CD 86 62         [ 4]  875     CALL TOR 
      00B3DB                        876 MMSTA5:
      00B3DB CD 88 4C         [ 4]  877     CALL QDUP 
      00335E                        878     _QBRAN MMSTA6 
      00B3DE CD 85 18         [ 4]    1     CALL QBRAN
      00B3E1 B3 F1                    2     .word MMSTA6
      00B3E3 CD B2 F5         [ 4]  879     CALL UDIV10 
      00B3E6 CD 85 B4         [ 4]  880     CALL RFROM 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 183.
Hexadecimal [24-Bits]



      00B3E9 CD 8C 17         [ 4]  881     CALL ONEP 
      00B3EC CD 86 62         [ 4]  882     CALL TOR 
      00B3EF 20 EA            [ 2]  883     JRA MMSTA5 
                                    884 ; now scale to double 
                                    885 ; scale further <= MAX_MANTISSA 
      00B3F1                        886 MMSTA6: 
      00B3F1 CD 85 B4         [ 4]  887     CALL RFROM 
      00B3F4 CD 88 7C         [ 4]  888     CALL NROT 
      00B3F7 CD B2 CD         [ 4]  889     CALL SCALETOM
      00B3FA CD A9 8A         [ 4]  890     CALL DTOR 
      00B3FD CD 88 BC         [ 4]  891     CALL PLUS 
      00B400 CD A9 A8         [ 4]  892     CALL DRFROM 
      00B403 CD 85 B4         [ 4]  893     CALL RFROM
      003386                        894     _QBRAN MMSTA7
      00B406 CD 85 18         [ 4]    1     CALL QBRAN
      00B409 B4 0E                    2     .word MMSTA7
      00B40B CD 89 18         [ 4]  895     CALL DNEGA
      00B40E                        896 MMSTA7:
      00B40E CD 88 5D         [ 4]  897     CALL ROT ; m e 
      00B411 81               [ 4]  898     RET 
                                    899 
                                    900 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    901 ;    F* ( f#1 f#2 -- f#3 )
                                    902 ;    float product 
                                    903 ;    f#3=f#1 * f#2 
                                    904 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      003392                        905     _HEADER FSTAR,2,"F*"
      00B412 B3 39                    1         .word LINK 
                           003394     2         LINK=.
      00B414 02                       3         .byte 2  
      00B415 46 2A                    4         .ascii "F*"
      00B417                          5         FSTAR:
      00B417 CD AE 11         [ 4]  906     CALL ATEXP ; f#1 m2 e2 
      00B41A CD 86 62         [ 4]  907     CALL TOR   
      00B41D CD A8 3B         [ 4]  908     CALL DSWAP ; m2 f#1
      00B420 CD AE 11         [ 4]  909     CALL ATEXP ; m2 m1 e1 
      00B423 CD 85 B4         [ 4]  910     CALL RFROM ; m2 m1 e1 e2 
      00B426 CD 88 BC         [ 4]  911     CALL PLUS  ; m2 m1 e 
      00B429 CD 86 62         [ 4]  912     CALL TOR   ; m2 m1 R: e 
      00B42C CD B3 3D         [ 4]  913     CALL MMSTAR ; m2*m1 e   
      00B42F CD 85 B4         [ 4]  914     CALL RFROM 
      00B432 CD 88 BC         [ 4]  915     CALL PLUS 
      00B435 CD AE 43         [ 4]  916     CALL STEXP ; f#3 
      00B438 81               [ 4]  917     RET 
                                    918 
                                    919 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    920 ;  F/ ( f#1 f#2 -- f#3 )
                                    921 ;  float division
                                    922 ;  f#3 = f#1/f#2
                                    923 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0033B9                        924     _HEADER FSLASH,2,"F/"
      00B439 B4 14                    1         .word LINK 
                           0033BB     2         LINK=.
      00B43B 02                       3         .byte 2  
      00B43C 46 2F                    4         .ascii "F/"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 184.
Hexadecimal [24-Bits]



      00B43E                          5         FSLASH:
      00B43E CD AE 11         [ 4]  925     CALL ATEXP  ; f#1 m2 e2 
      00B441 CD 86 62         [ 4]  926     CALL TOR    ; f#1 m2   R: e2 
      00B444 CD A7 30         [ 4]  927     CALL DSIGN  ; f#1 m2 m2sign 
      00B447 CD 86 62         [ 4]  928     CALL TOR    ; F#1 m2 R: e2 m2s 
      00B44A CD A7 1F         [ 4]  929     CALL DABS   ; F#1 um2 
      00B44D CD A8 3B         [ 4]  930     CALL DSWAP  ; m2 f#1 
      00B450 CD AE 11         [ 4]  931     CALL ATEXP  ; m2 m1 e1 
      00B453 CD 8C 8E         [ 4]  932     CALL ONE    ; e2 slot on rstack  
      00B456 CD 86 1F         [ 4]  933     CALL NRAT   ; m2 m1 e1 e2 
      00B459 CD 89 52         [ 4]  934     CALL SUBB   ; m2 m1 e 
      00B45C CD 8C 8E         [ 4]  935     CALL ONE    ; e slot on rstack 
      00B45F CD 86 3E         [ 4]  936     CALL NRSTO  ; m2 m1 R: e m2s 
      00B462 CD A7 30         [ 4]  937     CALL DSIGN  ; m2 m1 m1sign 
      00B465 CD 85 B4         [ 4]  938     CALL RFROM  ; m2 m1 m1s m2s  
      00B468 CD 87 1F         [ 4]  939     CALL XORR   ; m2 m1 quot_sign R: e 
      00B46B CD 85 B4         [ 4]  940     CALL RFROM   
      00B46E CD A9 8A         [ 4]  941     CALL DTOR   ; m2 m1 R: qs e  
      00B471 CD A7 1F         [ 4]  942     CALL DABS   ; um2 um1 R: qs e  
      00B474 CD A8 3B         [ 4]  943     CALL DSWAP  ; m1 m2 R: qs e
      00B477 CD 88 A7         [ 4]  944     CALL DDUP  ; m1 m2 m2 R: qs e
      00B47A CD A9 8A         [ 4]  945     CALL DTOR  ; m1 m2 R: qs e m2 ( keep divisor need later ) 
      00B47D CD AB 5C         [ 4]  946     CALL UDSLMOD ; remainder m1/m2 R: e m2 
      00B480                        947 FSLASH1: 
      00B480 CD AA 51         [ 4]  948     CALL DOVER ; if remainder null done 
      00B483 CD A9 10         [ 4]  949     CALL DZEQUAL 
      003406                        950     _TBRAN FSLASH8 
      00B486 CD 85 26         [ 4]    1     CALL TBRAN 
      00B489 B4 E3                    2     .word FSLASH8 
                                    951 ; get fractional digits from remainder until mantissa saturate
                                    952 ; remainder mantissa R: e divisor 
                                    953 ; check for mantissa saturation 
      00B48B CD 88 A7         [ 4]  954     CALL DDUP 
      00340E                        955     _DOLIT 0XCCCC 
      00B48E CD 84 EF         [ 4]    1     CALL DOLIT 
      00B491 CC CC                    2     .word 0XCCCC 
      003413                        956     _DOLIT 0xC
      00B493 CD 84 EF         [ 4]    1     CALL DOLIT 
      00B496 00 0C                    2     .word 0xC 
      00B498 CD A9 4D         [ 4]  957     CALL DGREAT 
      00341B                        958     _TBRAN FSLASH8 ; another loop would result in mantissa overflow 
      00B49B CD 85 26         [ 4]    1     CALL TBRAN 
      00B49E B4 E3                    2     .word FSLASH8 
                                    959 ; multiply mantissa by 10 
      003420                        960     _DOLIT 10 
      00B4A0 CD 84 EF         [ 4]    1     CALL DOLIT 
      00B4A3 00 0A                    2     .word 10 
      00B4A5 CD 8C 83         [ 4]  961     CALL ZERO 
      00B4A8 CD AA F9         [ 4]  962     CALL DSTAR 
                                    963 ; mutliply remainder by 10     
      00B4AB CD A8 3B         [ 4]  964     CALL DSWAP 
      00342E                        965     _DOLIT 10 
      00B4AE CD 84 EF         [ 4]    1     CALL DOLIT 
      00B4B1 00 0A                    2     .word 10 
      00B4B3 CD 8C 83         [ 4]  966     CALL ZERO 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 185.
Hexadecimal [24-Bits]



      00B4B6 CD AA F9         [ 4]  967     CALL DSTAR 
                                    968 ; divide remainder by m2     
      00B4B9 CD A9 C0         [ 4]  969     CALL DRAT  ; mantissa remainder divisor R: e divisor 
      00B4BC CD AB 5C         [ 4]  970     CALL UDSLMOD ; mantissa dr dq R: qs e divisor 
      00B4BF CD A8 3B         [ 4]  971     CALL DSWAP ; mantissa frac_digit remainder R: qs e divisor  
      00B4C2 CD A9 8A         [ 4]  972     CALL DTOR  ; mantissa frac_digit R: qs e divisor remainder 
      00B4C5 CD AC 64         [ 4]  973     CALL DPLUS ; mantissa+frac_digit 
      00B4C8 CD A9 A8         [ 4]  974     CALL DRFROM ; mantissa remainder R: qs e divisor  
      00B4CB CD A8 3B         [ 4]  975     CALL DSWAP  ; remainder mantissa  
                                    976 ; increment e 
      00344E                        977     _DOLIT 2    ; e slot on rstack 
      00B4CE CD 84 EF         [ 4]    1     CALL DOLIT 
      00B4D1 00 02                    2     .word 2 
      00B4D3 CD 86 1F         [ 4]  978     CALL NRAT   ;  2 NR@ -- e 
      00B4D6 CD 8C 17         [ 4]  979     CALL ONEP   ; increment exponent 
      003459                        980     _DOLIT 2 
      00B4D9 CD 84 EF         [ 4]    1     CALL DOLIT 
      00B4DC 00 02                    2     .word 2 
      00B4DE CD 86 3E         [ 4]  981     CALL NRSTO  ; e 2 NR! , update e on rstack     
      00B4E1 20 9D            [ 2]  982     JRA FSLASH1
      00B4E3                        983 FSLASH8: ; remainder mantissa R: qs e divisor 
      00B4E3 CD A8 3B         [ 4]  984     CALL DSWAP  
      003466                        985     _DDROP  ; drop remainder     
      00B4E6 1C 00 04         [ 2]    1    ADDW X,#2*CELLL 
      00B4E9 CD A9 A8         [ 4]  986     CALL DRFROM
      00346C                        987     _DDROP  ; drop divisor 
      00B4EC 1C 00 04         [ 2]    1    ADDW X,#2*CELLL 
      00B4EF CD 96 66         [ 4]  988     CALL JFETCH    ; quotient sign 
      003472                        989     _QBRAN FSLASH9 
      00B4F2 CD 85 18         [ 4]    1     CALL QBRAN
      00B4F5 B4 FA                    2     .word FSLASH9
      00B4F7 CD 89 18         [ 4]  990     CALL DNEGA  
      00B4FA                        991 FSLASH9:
      00B4FA CD 85 B4         [ 4]  992     CALL RFROM  ; exponent 
      00B4FD CD AE 43         [ 4]  993     CALL STEXP 
      00B500 CD 85 B4         [ 4]  994     CALL RFROM 
      003483                        995     _DROP ; drop qs 
      00B503 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00B506 81               [ 4]  996     RET 
                                    997 
                                    998 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    999 ;   D>F  ( # -- f# )
                                   1000 ;   convert double to float 
                                   1001 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      003487                       1002     _HEADER DTOF,3,"D>F"
      00B507 B4 3B                    1         .word LINK 
                           003489     2         LINK=.
      00B509 03                       3         .byte 3  
      00B50A 44 3E 46                 4         .ascii "D>F"
      00B50D                          5         DTOF:
      00B50D CD A7 30         [ 4] 1003     CALL DSIGN 
      00B510 CD 86 62         [ 4] 1004     CALL TOR
      00B513 CD A7 1F         [ 4] 1005     CALL DABS  
      00B516                       1006 DTOF1:      
      00B516 CD B2 CD         [ 4] 1007     CALL SCALETOM 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 186.
Hexadecimal [24-Bits]



      00B519 CD 85 B4         [ 4] 1008     CALL RFROM
      00349C                       1009     _QBRAN DTOF2 
      00B51C CD 85 18         [ 4]    1     CALL QBRAN
      00B51F B5 24                    2     .word DTOF2
      00B521 CD 89 18         [ 4] 1010     CALL DNEGA 
      00B524                       1011 DTOF2: 
      00B524 CD 88 5D         [ 4] 1012     CALL ROT 
      00B527 CD AE 43         [ 4] 1013     CALL STEXP 
      00B52A 81               [ 4] 1014     RET 
                                   1015 
                                   1016 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1017 ;   F>D  ( f# -- # )
                                   1018 ;  convert float to double 
                                   1019 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0034AB                       1020     _HEADER FTOD,3,"F>D"
      00B52B B5 09                    1         .word LINK 
                           0034AD     2         LINK=.
      00B52D 03                       3         .byte 3  
      00B52E 46 3E 44                 4         .ascii "F>D"
      00B531                          5         FTOD:
      00B531 CD AE 11         [ 4] 1021     CALL ATEXP ; m e 
      00B534 CD 88 4C         [ 4] 1022     CALL QDUP
      0034B7                       1023     _QBRAN FTOD9
      00B537 CD 85 18         [ 4]    1     CALL QBRAN
      00B53A B5 BB                    2     .word FTOD9
      00B53C CD 86 62         [ 4] 1024     CALL TOR 
      00B53F CD A7 30         [ 4] 1025     CALL DSIGN 
      00B542 CD 88 7C         [ 4] 1026     CALL NROT 
      00B545 CD A7 1F         [ 4] 1027     CALL DABS
      00B548 CD 85 B4         [ 4] 1028     CALL RFROM  
      00B54B CD 86 99         [ 4] 1029     CALL DUPP   
      00B54E CD 86 D0         [ 4] 1030     CALL ZLESS 
      0034D1                       1031     _QBRAN FTOD4 
      00B551 CD 85 18         [ 4]    1     CALL QBRAN
      00B554 B5 86                    2     .word FTOD4
                                   1032 ; negative exponent 
      00B556 CD 89 6C         [ 4] 1033     CALL ABSS 
      00B559 CD 86 62         [ 4] 1034     CALL TOR
      00B55C 20 19            [ 2] 1035     JRA FTOD2  
      00B55E                       1036 FTOD1:
      00B55E CD 88 A7         [ 4] 1037     CALL DDUP 
      00B561 CD A9 10         [ 4] 1038     CALL DZEQUAL 
      0034E4                       1039     _TBRAN FTOD3 
      00B564 CD 85 26         [ 4]    1     CALL TBRAN 
      00B567 B5 7E                    2     .word FTOD3 
      0034E9                       1040     _DOLIT 10 
      00B569 CD 84 EF         [ 4]    1     CALL DOLIT 
      00B56C 00 0A                    2     .word 10 
      00B56E CD A7 4A         [ 4] 1041     CALL DSLMOD 
      00B571 CD 88 5D         [ 4] 1042     CALL ROT 
      0034F4                       1043     _DROP
      00B574 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00B577                       1044 FTOD2:      
      0034F7                       1045     _DONXT FTOD1
      00B577 CD 85 03         [ 4]    1     CALL DONXT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 187.
Hexadecimal [24-Bits]



      00B57A B5 5E                    2     .word FTOD1 
      00B57C 20 32            [ 2] 1046     JRA FTOD8   
      00B57E                       1047 FTOD3: 
      00B57E CD 85 B4         [ 4] 1048     CALL RFROM 
      003501                       1049     _DROP 
      00B581 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00B584 20 2A            [ 2] 1050     JRA FTOD8  
                                   1051 ; positive exponent 
      00B586                       1052 FTOD4:
      00B586 CD 86 62         [ 4] 1053     CALL TOR 
      00B589 20 20            [ 2] 1054     JRA FTOD6
      00B58B                       1055 FTOD5:
      00B58B CD 88 A7         [ 4] 1056     CALL DDUP 
      00350E                       1057     _DOLIT 0XCCCC
      00B58E CD 84 EF         [ 4]    1     CALL DOLIT 
      00B591 CC CC                    2     .word 0XCCCC 
      003513                       1058     _DOLIT 0XCCC  
      00B593 CD 84 EF         [ 4]    1     CALL DOLIT 
      00B596 0C CC                    2     .word 0XCCC 
      00B598 CD A9 4D         [ 4] 1059     CALL DGREAT 
      00351B                       1060     _TBRAN FTOD3 
      00B59B CD 85 26         [ 4]    1     CALL TBRAN 
      00B59E B5 7E                    2     .word FTOD3 
      003520                       1061     _DOLIT 10 
      00B5A0 CD 84 EF         [ 4]    1     CALL DOLIT 
      00B5A3 00 0A                    2     .word 10 
      00B5A5 CD 8C 83         [ 4] 1062     CALL ZERO 
      00B5A8 CD AA F9         [ 4] 1063     CALL DSTAR 
      00B5AB                       1064 FTOD6: 
      00352B                       1065     _DONXT FTOD5 
      00B5AB CD 85 03         [ 4]    1     CALL DONXT 
      00B5AE B5 8B                    2     .word FTOD5 
      00B5B0                       1066 FTOD8:
      00B5B0 CD 88 5D         [ 4] 1067     CALL ROT 
      003533                       1068     _QBRAN FTOD9 
      00B5B3 CD 85 18         [ 4]    1     CALL QBRAN
      00B5B6 B5 BB                    2     .word FTOD9
      00B5B8 CD 89 18         [ 4] 1069     CALL DNEGA
      00B5BB                       1070 FTOD9:          
      00B5BB 81               [ 4] 1071     RET 
                                   1072 
                                   1073 
                                   1074 ;;;;;;;;;;;;;;;;;;;;;;;;
                                   1075 ;   F0< ( f# -- f )
                                   1076 ;   true if f#<0
                                   1077 ;;;;;;;;;;;;;;;;;;;;;;;;
      00353C                       1078     _HEADER FZLESS,3,"F0<"
      00B5BC B5 2D                    1         .word LINK 
                           00353E     2         LINK=.
      00B5BE 03                       3         .byte 3  
      00B5BF 46 30 3C                 4         .ascii "F0<"
      00B5C2                          5         FZLESS:
      00B5C2 CD AE 11         [ 4] 1079     CALL ATEXP 
      003545                       1080     _DROP 
      00B5C5 1C 00 02         [ 2]    1     ADDW X,#CELLL  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 188.
Hexadecimal [24-Bits]



      00B5C8 CD 86 A9         [ 4] 1081     CALL SWAPP 
      00354B                       1082     _DROP 
      00B5CB 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00B5CE CD 86 D0         [ 4] 1083     CALL ZLESS 
      00B5D1 81               [ 4] 1084     RET
                                   1085 
                                   1086 ;;;;;;;;;;;;;;;;;;;;;;;;
                                   1087 ;   F< ( f#1 f#2 -- f )
                                   1088 ; true if f#1 < f#1 
                                   1089 ;;;;;;;;;;;;;;;;;;;;;;;
      003552                       1090     _HEADER FLESS,2,"F<"
      00B5D2 B5 BE                    1         .word LINK 
                           003554     2         LINK=.
      00B5D4 02                       3         .byte 2  
      00B5D5 46 3C                    4         .ascii "F<"
      00B5D7                          5         FLESS:
      00B5D7 CD B2 8A         [ 4] 1091     CALL FSUB  
      00B5DA CC B5 C2         [ 2] 1092     JP FZLESS
                                   1093 
                                   1094 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1095 ;   F> ( f#1 f#2 -- f )
                                   1096 ;   true fi f#1>f#2
                                   1097 ;;;;;;;;;;;;;;;;;;;;;;;;;
      00355D                       1098     _HEADER FGREAT,2,"F>"
      00B5DD B5 D4                    1         .word LINK 
                           00355F     2         LINK=.
      00B5DF 02                       3         .byte 2  
      00B5E0 46 3E                    4         .ascii "F>"
      00B5E2                          5         FGREAT:
      00B5E2 CD A8 3B         [ 4] 1099     CALL DSWAP 
      00B5E5 CC B5 D7         [ 2] 1100     JP FLESS 
                                   1101 
                                   1102 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1103 ;   F= ( f#1 f#2 -- f ) 
                                   1104 ;   true fi f#1==f#2 
                                   1105 ;;;;;;;;;;;;;;;;;;;;;;;;;
      003568                       1106     _HEADER FEQUAL,2,"F="
      00B5E8 B5 DF                    1         .word LINK 
                           00356A     2         LINK=.
      00B5EA 02                       3         .byte 2  
      00B5EB 46 3D                    4         .ascii "F="
      00B5ED                          5         FEQUAL:
      00B5ED CC A9 2C         [ 2] 1107     JP DEQUAL 
                                   1108 
                                   1109 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1110 ;   F0= ( f# -- f )
                                   1111 ;   true if f# is 0.0 
                                   1112 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      003570                       1113     _HEADER FZEQUAL,3,"F0="
      00B5F0 B5 EA                    1         .word LINK 
                           003572     2         LINK=.
      00B5F2 03                       3         .byte 3  
      00B5F3 46 30 3D                 4         .ascii "F0="
      00B5F6                          5         FZEQUAL:
      00B5F6 CD AE 11         [ 4] 1114     CALL ATEXP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 189.
Hexadecimal [24-Bits]



      003579                       1115     _DROP 
      00B5F9 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00B5FC CC A9 10         [ 2] 1116     JP DZEQUAL  
                                   1117 
                                   1118 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1119 ;  FNEGATE ( f#1 -- f#2 )
                                   1120 ;  f#2 is negation of f#1 
                                   1121 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      00357F                       1122     _HEADER FNEGA,7,"FNEGATE"
      00B5FF B5 F2                    1         .word LINK 
                           003581     2         LINK=.
      00B601 07                       3         .byte 7  
      00B602 46 4E 45 47 41 54 45     4         .ascii "FNEGATE"
      00B609                          5         FNEGA:
      00B609 CD AE 11         [ 4] 1123     CALL ATEXP 
      00B60C CD 86 62         [ 4] 1124     CALL TOR 
      00B60F CD 89 18         [ 4] 1125     CALL DNEGA
      00B612 CD 85 B4         [ 4] 1126     CALL RFROM 
      00B615 CD AE 43         [ 4] 1127     CALL STEXP 
      00B618 CD AD C4         [ 4] 1128     CALL SFN 
      00B61B 81               [ 4] 1129     RET 
                                   1130 
                                   1131 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1132 ;  FABS ( f#1 -- abs(f#1) )
                                   1133 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00359C                       1134     _HEADER FABS,4,"FABS"
      00B61C B6 01                    1         .word LINK 
                           00359E     2         LINK=.
      00B61E 04                       3         .byte 4  
      00B61F 46 41 42 53              4         .ascii "FABS"
      00B623                          5         FABS:
      00B623 CD AE 11         [ 4] 1135     CALL ATEXP 
      00B626 CD 86 62         [ 4] 1136     CALL TOR 
      00B629 CD 86 99         [ 4] 1137     CALL DUPP 
      0035AC                       1138     _DOLIT 0X80 
      00B62C CD 84 EF         [ 4]    1     CALL DOLIT 
      00B62F 00 80                    2     .word 0X80 
      00B631 CD 86 F6         [ 4] 1139     CALL ANDD 
      0035B4                       1140     _QBRAN FABS1
      00B634 CD 85 18         [ 4]    1     CALL QBRAN
      00B637 B6 3C                    2     .word FABS1
      00B639 CD 89 18         [ 4] 1141     CALL DNEGA 
      00B63C                       1142 FABS1: 
      00B63C CD 85 B4         [ 4] 1143     CALL RFROM 
      00B63F CD AE 43         [ 4] 1144     CALL STEXP 
      00B642 CD AD C4         [ 4] 1145     CALL SFN 
      00B645 81               [ 4] 1146     RET 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 190.
Hexadecimal [24-Bits]



                                   4651 .endif 
                                   4652 
                                   4653 ;===============================================================
                                   4654 
                           00359E  4655 LASTN =	LINK   ;last name defined
                                   4656 
                                   4657 ; application code begin here
      00B680                       4658 	.bndry 128 ; align on flash block  
      00B680                       4659 app_space: 
                                   4660 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 191.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   6 AB1        0008F5 R   |   6 ABOR1      0013FB R
  6 ABOR2      001412 R   |   6 ABORQ      0013F3 R   |   6 ABORT      0013E4 R
  6 ABRTQ      0016DE R   |   6 ABSS       0008EC R   |   6 ACCEP      00137A R
  6 ACCP1      001383 R   |   6 ACCP2      0013A9 R   |   6 ACCP3      0013AC R
  6 ACCP4      0013AE R   |     ADC_CR1 =  005401     |     ADC_CR1_=  000000 
    ADC_CR1_=  000001     |     ADC_CR1_=  000004     |     ADC_CR1_=  000005 
    ADC_CR1_=  000006     |     ADC_CR2 =  005402     |     ADC_CR2_=  000003 
    ADC_CR2_=  000004     |     ADC_CR2_=  000005     |     ADC_CR2_=  000006 
    ADC_CR2_=  000001     |     ADC_CR3 =  005403     |     ADC_CR3_=  000007 
    ADC_CR3_=  000006     |     ADC_CSR =  005400     |     ADC_CSR_=  000006 
    ADC_CSR_=  000004     |     ADC_CSR_=  000000     |     ADC_CSR_=  000001 
    ADC_CSR_=  000002     |     ADC_CSR_=  000003     |     ADC_CSR_=  000007 
    ADC_CSR_=  000005     |     ADC_DRH =  005404     |     ADC_DRL =  005405 
    ADC_TDRH=  005406     |     ADC_TDRL=  005407     |     ADDWX   =  00001C 
  6 ADRADJ     0007BC R   |     AFR     =  004803     |     AFR0_ADC=  000000 
    AFR1_TIM=  000001     |     AFR2_CCO=  000002     |     AFR3_TIM=  000003 
    AFR4_TIM=  000004     |     AFR5_TIM=  000005     |     AFR6_I2C=  000006 
    AFR7_BEE=  000007     |   6 AFT        0016C9 R   |   6 AGAIN      001613 R
  6 AHEAD      001676 R   |   6 ALLOT      001520 R   |   6 ANDD       000676 R
    APP_CP  =  004004     |     APP_LAST=  004000     |     APP_RUN =  004002 
    APP_VP  =  004006     |   6 AT         0004E3 R   |   6 ATEXE      000D13 R
  6 ATEXP      002D91 R   |   6 ATEXP1     002DA6 R   |   6 ATEXP2     002DB6 R
  6 AUTORUN    000129 R   |     AWU_APR =  0050F1     |     AWU_CSR =  0050F0 
    AWU_TBR =  0050F2     |     B0_MASK =  000001     |     B115200 =  000006 
  6 B115K2     0003E0 R   |     B19200  =  000003     |   6 B19K2      0003BD R
    B1_MASK =  000002     |     B230400 =  000007     |     B2400   =  000000 
  6 B2K4       00038E R   |     B2_MASK =  000004     |     B38400  =  000004 
    B3_MASK =  000008     |     B460800 =  000008     |     B4800   =  000001 
  6 B4K8       00039C R   |     B4_MASK =  000010     |     B57600  =  000005 
  6 B57K6      0003CE R   |     B5_MASK =  000020     |     B6_MASK =  000040 
    B7_MASK =  000080     |     B921600 =  000009     |     B9600   =  000002 
  6 B9K6       0003AC R   |   6 BACK1      001322 R   |   6 BASE       0006DF R
    BASEE   =  00000A     |   6 BAUD       0003F0 R   |     BCNT    =  000001 
  6 BCOMP      001563 R   |   6 BDIGS      000E0B R   |     BEEP_BIT=  000004 
    BEEP_CSR=  0050F3     |     BEEP_MAS=  000010     |     BEEP_POR=  00000F 
  6 BEGIN      0015F5 R   |     BIT0    =  000000     |     BIT1    =  000001 
    BIT2    =  000002     |     BIT3    =  000003     |     BIT4    =  000004 
    BIT5    =  000005     |     BIT6    =  000006     |     BIT7    =  000007 
  6 BKSLA      001177 R   |   6 BKSP       0012F2 R   |     BKSPP   =  000008 
  6 BLANK      000BF6 R   |     BLOCK_SI=  000080     |     BOOT_ROM=  006000 
    BOOT_ROM=  007FFF     |   6 BRAN       0004B4 R   |     BTW     =  000001 
  6 BUF2ROW    0021F4 R   |   6 BYE        0000B6 R   |     CADR    =  000003 
    CALLL   =  0000CD     |   6 CALLOT     00243D R   |     CAN_DGR =  005426 
    CAN_FPSR=  005427     |     CAN_IER =  005425     |     CAN_MCR =  005420 
    CAN_MSR =  005421     |     CAN_P0  =  005428     |     CAN_P1  =  005429 
    CAN_P2  =  00542A     |     CAN_P3  =  00542B     |     CAN_P4  =  00542C 
    CAN_P5  =  00542D     |     CAN_P6  =  00542E     |     CAN_P7  =  00542F 
    CAN_P8  =  005430     |     CAN_P9  =  005431     |     CAN_PA  =  005432 
    CAN_PB  =  005433     |     CAN_PC  =  005434     |     CAN_PD  =  005435 
    CAN_PE  =  005436     |     CAN_PF  =  005437     |     CAN_RFR =  005424 
    CAN_TPR =  005423     |     CAN_TSR =  005422     |     CARRY   =  00002A 
    CASE_SEN=  000000     |   6 CAT        000501 R   |   6 CCOMMA     001545 R
    CC_C    =  000000     |     CC_H    =  000004     |     CC_I0   =  000003 
    CC_I1   =  000005     |     CC_N    =  000002     |     CC_V    =  000007 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 192.
Hexadecimal [24-Bits]

Symbol Table

    CC_Z    =  000001     |     CELLL   =  000002     |   6 CELLM      000B7B R
  6 CELLP      000B6C R   |   6 CELLS      000B8A R   |     CFG_GCR =  007F60 
    CFG_GCR_=  000001     |     CFG_GCR_=  000000     |   6 CHAR1      000F61 R
  6 CHAR2      000F64 R   |   6 CHKIVEC    0020E2 R   |     CLKOPT  =  004807 
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
    CLK_SWR_=  0000E1     |     CLK_SWR_=  0000D2     |   6 CMOV1      000D46 R
  6 CMOV2      000D5A R   |   6 CMOV3      000D6E R   |   6 CMOVE      000D2A R
    CNT     =  000001     |     CNTDWN  =  000032     |   6 CNTXT      000762 R
  6 COLD       001BE3 R   |   6 COLD1      001BE3 R   |   6 COLON      0018C7 R
  6 COMMA      00152E R   |   6 COMPI      001573 R   |     COMPO   =  000040 
  6 CONSTANT   001971 R   |   6 COPYRIGH   001B2D R   |   6 COUNT      000CC6 R
  6 CPP        00077E R   |     CPU_A   =  007F00     |     CPU_CCR =  007F0A 
    CPU_PCE =  007F01     |     CPU_PCH =  007F02     |     CPU_PCL =  007F03 
    CPU_SPH =  007F08     |     CPU_SPL =  007F09     |     CPU_XH  =  007F04 
    CPU_XL  =  007F05     |     CPU_YH  =  007F06     |     CPU_YL  =  007F07 
  6 CR         000F89 R   |   6 CREAT      00190D R   |     CRR     =  00000D 
  6 CSTOR      0004F0 R   |   6 CTABLE     00245E R   |   6 CTAT       00247F R
  6 CTINIT     0024A7 R   |   6 D2SLASH    0029EA R   |   6 D2STAR     002A01 R
  6 DABS       00269F R   |   6 DABS1      0026A7 R   |   6 DAT        000CAA R
    DATSTK  =  001680     |   6 DBLVER     00252B R   |   6 DCLZ       0027E9 R
  6 DCLZ1      0027F2 R   |   6 DCLZ4      0027FB R   |   6 DCLZ8      002808 R
  6 DCONST     0019A6 R   |   6 DDIG       00270B R   |   6 DDIGS      002724 R
  6 DDOT       00273B R   |   6 DDOT0      00274F R   |   6 DDOT1      002765 R
  6 DDROP      00081C R   |   6 DDSLMOD    002B8E R   |   6 DDSTAR3    002AD2 R
  6 DDUP       000827 R   |     DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF 
  6 DECIM      000EBB R   |   6 DEPTH      000C45 R   |   6 DEQU4      0028C1 R
  6 DEQUAL     0028AC R   |     DEVID_BA=  0048CD     |     DEVID_EN=  0048D8 
    DEVID_LO=  0048D2     |     DEVID_LO=  0048D3     |     DEVID_LO=  0048D4 
    DEVID_LO=  0048D5     |     DEVID_LO=  0048D6     |     DEVID_LO=  0048D7 
    DEVID_LO=  0048D8     |     DEVID_WA=  0048D1     |     DEVID_XH=  0048CE 
    DEVID_XL=  0048CD     |     DEVID_YH=  0048D0     |     DEVID_YL=  0048CF 
  6 DGREAT     0028CD R   |   6 DGTQ1      000F00 R   |   6 DI         0000C4 R
  6 DIG        000E34 R   |   6 DIGIT      000DCF R   |   6 DIGS       000E45 R
  6 DIGS1      000E45 R   |   6 DIGS2      000E52 R   |   6 DIGTQ      000ECF R
    DISCOVER=  000000     |   6 DLESS      0028D8 R   |   6 DLESS4     0028EC R
  6 DLITER     0029AA R   |   6 DLSHIFT    002A1D R   |   6 DLSHIFT1   002A30 R
  6 DLSHIFT2   002A45 R   |     DM_BK1RE=  007F90     |     DM_BK1RH=  007F91 
    DM_BK1RL=  007F92     |     DM_BK2RE=  007F93     |     DM_BK2RH=  007F94 
    DM_BK2RL=  007F95     |     DM_CR1  =  007F96     |     DM_CR2  =  007F97 
    DM_CSR1 =  007F98     |     DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A 
  6 DN1        0008B3 R   |   6 DNEGA      000898 R   |   6 DOCONST    001991 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 193.
Hexadecimal [24-Bits]

Symbol Table

  6 DOLIT      00046F R   |   6 DONXT      000483 R   |     DOORBELL=  000000 
  6 DOSTR      000F99 R   |   6 DOT        00102F R   |   6 DOT1       001045 R
  6 DOTI1      001AF6 R   |   6 DOTID      001AE0 R   |   6 DOTO1      001487 R
  6 DOTOK      00146D R   |   6 DOTPR      001158 R   |   6 DOTQ       0016F8 R
  6 DOTQP      000FB6 R   |   6 DOTR       000FC4 R   |   6 DOTS       001A82 R
  6 DOTS1      001A8D R   |   6 DOTS2      001A96 R   |   6 DOVAR      0006CF R
  6 DOVER      0029D1 R   |   6 DO_DCONS   0019C9 R   |     DP      =  000005 
  6 DPLUS      002BE4 R   |   6 DPLUS1     002C0B R   |   6 DRAT       002940 R
  6 DRFROM     002928 R   |   6 DROP       00060F R   |   6 DROT       002855 R
  6 DRSHIFT    002A56 R   |   6 DRSHIFT1   002A5D R   |   6 DRSHIFT2   002A73 R
  6 DSIGN      0026B0 R   |   6 DSIGN1     0026BA R   |   6 DSLA8      002BC0 R
  6 DSLA9      002BCD R   |   6 DSLASH     002BD5 R   |   6 DSLMOD     0026CA R
  6 DSLMOD3    0026E5 R   |   6 DSLMOD4    0026F1 R   |   6 DSLMODa    0026EC R
  6 DSLMODb    0026F7 R   |   6 DSSTAR     002795 R   |   6 DSSTAR3    0027B2 R
  6 DSTAR      002A79 R   |   6 DSTOR      000C91 R   |   6 DSUB       002C16 R
  6 DSUB1      002C3D R   |   6 DSWAP      0027BB R   |   6 DTOF       00348D R
  6 DTOF1      003496 R   |   6 DTOF2      0034A4 R   |   6 DTOR       00290A R
  6 DUMP       001A38 R   |   6 DUMP1      001A4F R   |   6 DUMP3      001A71 R
  6 DUMPP      001A07 R   |   6 DUPP       000619 R   |   6 DVARIA     00295E R
    DVER_MAJ=  000001     |     DVER_MIN=  000000     |   6 DZEQUAL    002890 R
  6 DZLESS     0028F3 R   |   6 DZLESS1    0028FD R   |   6 EDIGS      000E70 R
  6 EDOT       002E17 R   |   6 EDOT0      002E2E R   |   6 EDOT2      002E3A R
  6 EDOT3      002E50 R   |   6 EDOT4      002E7C R   |   6 EDOT5      002E9B R
  6 EECSTORE   001E93 R   |   6 EEPCP      001CB9 R   |   6 EEPLAST    001C8C R
  6 EEPROM     001C74 R   |     EEPROM_B=  004000     |     EEPROM_E=  0047FF 
    EEPROM_R=  000010     |     EEPROM_S=  000800     |   6 EEPRUN     001CA3 R
  6 EEPVP      001CCF R   |   6 EESTORE    001EDF R   |   6 EE_CCOMM   0021A9 R
  6 EE_COMMA   002188 R   |   6 EE_CREAD   001E24 R   |   6 EE_READ    001E02 R
  6 EI         0000BD R   |   6 ELSEE      00164E R   |   6 EMIT       000436 R
  6 ENEPER     0023C9 R   |     EOL_CR  =  000001     |     EOL_LF  =  000000 
  6 EQ1        000907 R   |   6 EQUAL      0008FA R   |   6 ERASE      000D9D R
    ERR     =  00001B     |   6 EVAL       0014B0 R   |   6 EVAL1      0014B0 R
  6 EVAL2      0014C9 R   |   6 EXE1       000D21 R   |   6 EXECU      0004C4 R
    EXT     =  000000     |     EXTI_CR1=  0050A0     |     EXTI_CR2=  0050A1 
  6 EXTRC      000DF7 R   |   6 FABS       0035A3 R   |   6 FABS1      0035BC R
  6 FADDR      002276 R   |   6 FALGN4     003168 R   |   6 FALGN6     003177 R
  6 FALGN7     00319E R   |   6 FALGN71    0031AD R   |   6 FALGN72    0031C9 R
  6 FALGN8     0031CC R   |   6 FALIGN     00312F R   |   6 FALSE      000868 R
  6 FARAT      001D3A R   |   6 FARCAT     001D46 R   |   6 FC_XOFF    000463 R
  6 FC_XON     00044D R   |   6 FDOT       002EAA R   |   6 FDOT0      002EE8 R
  6 FDOT1      002ED7 R   |   6 FDOT10     002F3B R   |   6 FDOT2      002EF6 R
  6 FDOT3      002F0C R   |   6 FDOT6      002F19 R   |   6 FDOT7      002F1B R
  6 FDOT8      002F23 R   |   6 FDOT9      002F2B R   |   6 FEQUAL     00356D R
  6 FER        002CAF R   |   6 FGREAT     003562 R   |     FHSE    =  7A1200 
    FHSI    =  F42400     |   6 FILL       000D7D R   |   6 FILL0      000D8B R
  6 FILL1      000D93 R   |   6 FIND       00124E R   |   6 FIND1      00126C R
  6 FIND2      00129A R   |   6 FIND3      0012A6 R   |   6 FIND4      0012BA R
  6 FIND5      0012C7 R   |   6 FIND6      0012AB R   |   6 FINIT      002CA5 R
    FLASH_BA=  008000     |     FLASH_CR=  00505A     |     FLASH_CR=  000002 
    FLASH_CR=  000000     |     FLASH_CR=  000003     |     FLASH_CR=  000001 
    FLASH_CR=  00505B     |     FLASH_CR=  000005     |     FLASH_CR=  000004 
    FLASH_CR=  000007     |     FLASH_CR=  000000     |     FLASH_CR=  000006 
    FLASH_DU=  005064     |     FLASH_DU=  0000AE     |     FLASH_DU=  000056 
    FLASH_EN=  027FFF     |     FLASH_FP=  00505D     |     FLASH_FP=  000000 
    FLASH_FP=  000001     |     FLASH_FP=  000002     |     FLASH_FP=  000003 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 194.
Hexadecimal [24-Bits]

Symbol Table

    FLASH_FP=  000004     |     FLASH_FP=  000005     |     FLASH_IA=  00505F 
    FLASH_IA=  000003     |     FLASH_IA=  000002     |     FLASH_IA=  000006 
    FLASH_IA=  000001     |     FLASH_IA=  000000     |     FLASH_NC=  00505C 
    FLASH_NF=  00505E     |     FLASH_NF=  000000     |     FLASH_NF=  000001 
    FLASH_NF=  000002     |     FLASH_NF=  000003     |     FLASH_NF=  000004 
    FLASH_NF=  000005     |     FLASH_PU=  005062     |     FLASH_PU=  000056 
    FLASH_PU=  0000AE     |     FLASH_SI=  020000     |     FLASH_WS=  00480D 
  6 FLESS      003557 R   |   6 FLOATQ     002FB3 R   |   6 FLOATQ0    002FBB R
  6 FLOATQ1    00301A R   |   6 FLOATQ2    003023 R   |   6 FLOATQ3    00302B R
  6 FLOATQ4    00303F R   |   6 FLOAT_ER   00305A R   |   6 FLOAT_ER   003057 R
    FLOAT_MA=  000001     |     FLOAT_MI=  000000     |     FLSI    =  01F400 
  6 FMOVE      002281 R   |   6 FMOVE2     0022B2 R   |   6 FNE        002CD2 R
  6 FNEGA      003589 R   |   6 FOR        0015BD R   |   6 FORGET     00015A R
  6 FORGET1    000189 R   |   6 FORGET2    00020F R   |   6 FORGET4    000218 R
  6 FORGET6    0001D1 R   |   6 FOV        002CED R   |   6 FPLUS      0031D8 R
  6 FPLUS1     0031F8 R   |   6 FPSTOR     001C55 R   |   6 FPSW       002C81 R
    FPTR    =  000034     |   6 FREEVAR    000225 R   |   6 FREEVAR4   00025B R
  6 FRESET     002C93 R   |   6 FSLASH     0033BE R   |   6 FSLASH1    003400 R
  6 FSLASH8    003463 R   |   6 FSLASH9    00347A R   |   6 FSTAR      003397 R
  6 FSUB       00320A R   |   6 FSUB1      00322A R   |   6 FTOD       0034B1 R
  6 FTOD1      0034DE R   |   6 FTOD2      0034F7 R   |   6 FTOD3      0034FE R
  6 FTOD4      003506 R   |   6 FTOD5      00350B R   |   6 FTOD6      00352B R
  6 FTOD8      003530 R   |   6 FTOD9      00353B R   |   6 FVER       002C4F R
  6 FZE        002CBC R   |   6 FZEQUAL    003576 R   |   6 FZLESS     003542 R
    GPIO_BAS=  005000     |     GPIO_CR1=  000003     |     GPIO_CR2=  000004 
    GPIO_DDR=  000002     |     GPIO_IDR=  000001     |     GPIO_ODR=  000000 
    GPIO_SIZ=  000005     |   6 GREAT      000953 R   |   6 GREAT1     00095E R
  6 HDOT       001013 R   |   6 HERE       000CDD R   |   6 HEX        000EA6 R
  6 HI         001B98 R   |   6 HLD        00074F R   |   6 HOLD       000E1B R
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
    I2C_WRIT=  000000     |   6 ICOLON     0018D8 R   |   6 IFETCH     0015DB R
  6 IFF        001626 R   |   6 IFMOVE     00235A R   |     IMEDD   =  000080 
  6 IMMED      0018EA R   |   6 INCH       00042A R   |   6 INC_FPTR   001DCF R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 195.
Hexadecimal [24-Bits]

Symbol Table

  6 INITOFS    0018A0 R   |   6 INN        0006FD R   |     INPUT_DI=  000000 
    INPUT_EI=  000001     |     INPUT_FL=  000000     |     INPUT_PU=  000001 
  6 INTE1      00144F R   |   6 INTER      001425 R   |   6 INTQ       002503 R
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
    INT_VECT=  008058     |   6 INVER      000875 R   |     IPR0    =  000002 
    IPR1    =  000001     |     IPR2    =  000000     |     IPR3    =  000003 
    IPR_MASK=  000003     |     IRET_COD=  000080     |   6 ISEMI      0017EF R
    ITC_SPR1=  007F70     |     ITC_SPR2=  007F71     |     ITC_SPR3=  007F72 
    ITC_SPR4=  007F73     |     ITC_SPR5=  007F74     |     ITC_SPR6=  007F75 
    ITC_SPR7=  007F76     |     ITC_SPR8=  007F77     |     IWDG_KR =  0050E0 
    IWDG_PR =  0050E1     |     IWDG_RLR=  0050E2     |   6 JFETCH     0015E6 R
    JPIMM   =  0000CC     |   6 JSRC       001844 R   |   6 JSRC1      001867 R
  6 JSRC2      00188A R   |   6 KEY        000F0F R   |   6 KTAP       00133F R
  6 KTAP1      001362 R   |   6 KTAP2      001365 R   |   6 LAST       00078E R
  6 LASTN   =  00359E R   |   6 LBRAC      00145C R   |     LED2_BIT=  000005 
    LED2_MAS=  000020     |     LED2_POR=  00500A     |   6 LESS       000926 R
    LF      =  00000A     |   6 LINK    =  00359E R   |   6 LITER      001595 R
  6 LN2S       002425 R   |   6 LOCAL      000554 R   |   6 LOCK       001DBB R
  6 LOG2S      00240F R   |   6 LSCALE     003079 R   |   6 LSHIFT     000BB5 R
  6 LSHIFT1    000BBE R   |   6 LSHIFT4    000BC6 R   |   6 LT1        000931 R
    MASKK   =  001F7F     |   6 MAX        00096B R   |   6 MAX1       000975 R
    MAX_MANT=  7FFFFF     |   6 MIN        00097F R   |   6 MIN1       000989 R
  6 MMOD1      000A38 R   |   6 MMOD2      000A4C R   |   6 MMOD3      000A63 R
  6 MMSM0      0009C8 R   |   6 MMSM1      0009D8 R   |   6 MMSM3      0009DC R
  6 MMSM4      0009E8 R   |   6 MMSMa      0009E3 R   |   6 MMSMb      0009EE R
  6 MMSTA1     0032C8 R   |   6 MMSTA2     0032D3 R   |   6 MMSTA3     0032DE R
  6 MMSTA4     003349 R   |   6 MMSTA5     00335B R   |   6 MMSTA6     003371 R
  6 MMSTA7     00338E R   |   6 MMSTAR     0032BD R   |   6 MODD       000AB3 R
  6 MONE       000C1C R   |     MS      =  000030     |   6 MSEC       0002D0 R
  6 MSMOD      000A1B R   |   6 MSTA1      000B44 R   |   6 MSTAR      000B21 R
    NAFR    =  004804     |   6 NAMEQ      0012E7 R   |   6 NAMET      0011F8 R
    NCLKOPT =  004808     |   6 NDROT      002819 R   |   6 NEGAT      000886 R
  6 NEG_SIGN   00256E R   |   6 NEX1       000490 R   |   6 NEXT       0015CC R
    NFLASH_W=  00480E     |     NHSECNT =  00480A     |     NOPT1   =  004802 
    NOPT2   =  004804     |     NOPT3   =  004806     |     NOPT4   =  004808 
    NOPT5   =  00480A     |     NOPT6   =  00480C     |     NOPT7   =  00480E 
    NOPTBL  =  00487F     |   6 NRAT       00059F R   |   6 NRDROP     00057B R
  6 NROT       0007FC R   |   6 NRSTO      0005BE R   |   6 NTIB       00070D R
    NUBC    =  004802     |     NUCLEO  =  000001     |   6 NUFQ       000F25 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 196.
Hexadecimal [24-Bits]

Symbol Table

  6 NUFQ1      000F3E R   |   6 NUMBQ      0025DA R   |   6 NUMQ0      00261B R
  6 NUMQ1      00263D R   |   6 NUMQ3      002667 R   |   6 NUMQ4      002685 R
  6 NUMQ8      00268E R   |     NWDGOPT =  004806     |     NWDGOPT_=  FFFFFFFD 
    NWDGOPT_=  FFFFFFFC     |     NWDGOPT_=  FFFFFFFF     |     NWDGOPT_=  FFFFFFFE 
  6 NonHandl   000000 R   |   6 OFFSET     0007B3 R   |     OFS     =  000005 
  6 ONE        000C0E R   |   6 ONEM       000BA4 R   |   6 ONEP       000B97 R
    OPT     =  000002     |     OPT0    =  004800     |     OPT1    =  004801 
    OPT2    =  004803     |     OPT3    =  004805     |     OPT4    =  004807 
    OPT5    =  004809     |     OPT6    =  00480B     |     OPT7    =  00480D 
    OPTBL   =  00487E     |     OPTIMIZE=  000001     |     OPTION_B=  004800 
    OPTION_E=  00487F     |     OPTION_S=  000080     |   6 ORIG       000049 R
  6 ORR        00068A R   |   6 OUTPUT     00043B R   |     OUTPUT_F=  000001 
    OUTPUT_O=  000000     |     OUTPUT_P=  000001     |     OUTPUT_S=  000000 
  6 OVER       000641 R   |   6 OVERT      0017BD R   |     PA      =  000000 
  6 PACKS      000DAE R   |   6 PAD        000CEE R   |   6 PAREN      001167 R
  6 PARS       001060 R   |   6 PARS1      00108B R   |   6 PARS2      0010B6 R
  6 PARS3      0010B9 R   |   6 PARS4      0010C2 R   |   6 PARS5      0010E5 R
  6 PARS6      0010FA R   |   6 PARS7      001109 R   |   6 PARS8      001118 R
  6 PARSE      001129 R   |   6 PARSEXP_   002F96 R   |   6 PAUSE      0002E0 R
    PA_BASE =  005000     |     PA_CR1  =  005003     |     PA_CR2  =  005004 
    PA_DDR  =  005002     |     PA_IDR  =  005001     |     PA_ODR  =  005000 
    PB      =  000005     |     PB_BASE =  005005     |     PB_CR1  =  005008 
    PB_CR2  =  005009     |     PB_DDR  =  005007     |     PB_IDR  =  005006 
    PB_ODR  =  005005     |     PC      =  00000A     |     PC_BASE =  00500A 
    PC_CR1  =  00500D     |     PC_CR2  =  00500E     |     PC_DDR  =  00500C 
    PC_IDR  =  00500B     |     PC_ODR  =  00500A     |     PD      =  00000F 
  6 PDUM1      001A1A R   |   6 PDUM2      001A2B R   |     PD_BASE =  00500F 
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
    PI      =  000028     |   6 PICK       000C5C R   |   6 PII        002388 R
    PI_BASE =  005028     |     PI_CR1  =  00502B     |     PI_CR2  =  00502C 
    PI_DDR  =  00502A     |     PI_IDR  =  005029     |     PI_ODR  =  005028 
  6 PLUS       00083C R   |   6 PNAM1      001762 R   |   6 PRESE      0014D8 R
  6 PRINT_VE   001B69 R   |     PROD1   =  000024     |     PROD2   =  000026 
    PROD3   =  000028     |   6 PROTECTE   000201 R   |   6 PRT_LICE   001B55 R
  6 PSTOR      000C73 R   |     PTR16   =  000035     |     PTR8    =  000036 
  6 PTRPLUS    001DE7 R   |   6 QBRAN      000498 R   |   6 QDUP       0007CC R
  6 QDUP1      0007D6 R   |   6 QKEY       000418 R   |   6 QSTAC      001493 R
  6 QUERY      0013BF R   |   6 QUEST      001052 R   |   6 QUIT       0014F5 R
  6 QUIT1      0014FD R   |   6 QUIT2      001500 R   |   6 RAM2EE     002222 R
    RAMBASE =  000000     |   6 RAMLAST    0007A1 R   |     RAM_BASE=  000000 
    RAM_END =  0017FF     |     RAM_SIZE=  001800     |   6 RANDOM     00027E R
  6 RAT        000545 R   |   6 RBRAC      001831 R   |   6 REPEA      0016A9 R
  6 RFREE      002209 R   |   6 RFROM      000534 R   |     ROP     =  004800 
  6 ROT        0007DD R   |   6 ROW2BUF    0021CB R   |     ROWBUFF =  001680 
    RP0     =  00002E     |   6 RPAT       000511 R   |     RPP     =  0017FF 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 197.
Hexadecimal [24-Bits]

Symbol Table

  6 RPSTO      00051E R   |   6 RSCALE     00309D R   |   6 RSHIFT     000BD1 R
  6 RSHIFT1    000BDA R   |   6 RSHIFT4    000BE2 R   |     RST_SR  =  0050B3 
  6 RT12_2     0023F8 R   |   6 SAME1      001216 R   |   6 SAME2      00123F R
  6 SAMEQ      00120E R   |   6 SCAL1      003253 R   |   6 SCAL2      003274 R
  6 SCALDN2    003121 R   |   6 SCALDN3    003124 R   |   6 SCALEDOW   0030F5 R
  6 SCALETOM   00324D R   |   6 SCALEUP    0030BE R   |   6 SCALEUP2   0030F1 R
  6 SCALEUP3   0030F4 R   |   6 SCOM1      001797 R   |   6 SCOM2      00179A R
  6 SCOMP      001779 R   |   6 SEED       000265 R   |     SEEDX   =  000038 
    SEEDY   =  00003A     |   6 SEMIS      0017CD R   |   6 SETISP     0000D0 R
  6 SET_RAML   00195A R   |   6 SFN        002D44 R   |     SFR_BASE=  005000 
    SFR_END =  0057FF     |   6 SFV        002D78 R   |   6 SFZ        002D0D R
  6 SIGN       000E5A R   |   6 SIGN1      000E6A R   |   6 SLASH      000ABD R
  6 SLMOD      000A6B R   |   6 SLMOD1     000A9D R   |   6 SLMOD8     000AAA R
  6 SNAME      00172C R   |     SP0     =  00002C     |   6 SPACE      000F47 R
  6 SPACS      000F56 R   |   6 SPAT       0005F9 R   |     SPI_CR1 =  005200 
    SPI_CR2 =  005201     |     SPI_CRCP=  005205     |     SPI_DR  =  005204 
    SPI_ICR =  005202     |     SPI_RXCR=  005206     |     SPI_SR  =  005203 
    SPI_TXCR=  005207     |     SPP     =  001680     |     SPSAVE  =  000001 
  6 SPSTO      000606 R   |   6 SQRT10     0023E1 R   |   6 SQRT2      00239F R
  6 SQRT3      0023B6 R   |   6 SSMOD      000B4D R   |     SSP     =  000001 
    STACK   =  0017FF     |   6 STAR       000B16 R   |   6 STASL      000B5E R
  6 STEXP      002DC3 R   |   6 STEXP1     002DD9 R   |   6 STEXP2     002E03 R
  6 STOD       0008BB R   |   6 STORE      0004D1 R   |   6 STO_SIGN   002586 R
  6 STR        000E88 R   |   6 STRCQ      00159D R   |   6 STRQ       0016EB R
  6 STRQP      000FB2 R   |   6 SUBB       0008D2 R   |   6 SWAPP      000629 R
    SWIM_CSR=  007F80     |   6 TAP        001329 R   |   6 TBOOT      001BD7 R
  6 TBRAN      0004A6 R   |   6 TBUF       00071D R   |     TBUFFBAS=  001680 
  6 TCHAR      000C2D R   |   6 TEMP       0006EE R   |   6 TEVAL      000740 R
  6 TFLASH     00072F R   |   6 THENN      00163B R   |   6 TIB        000CFF R
    TIBB    =  001700     |     TIBBASE =  001700     |     TIC     =  000027 
  6 TICK       00150C R   |     TIM1_ARR=  005262     |     TIM1_ARR=  005263 
    TIM1_BKR=  00526D     |     TIM1_CCE=  00525C     |     TIM1_CCE=  00525D 
    TIM1_CCM=  005258     |     TIM1_CCM=  000000     |     TIM1_CCM=  000001 
    TIM1_CCM=  000004     |     TIM1_CCM=  000005     |     TIM1_CCM=  000006 
    TIM1_CCM=  000007     |     TIM1_CCM=  000002     |     TIM1_CCM=  000003 
    TIM1_CCM=  000007     |     TIM1_CCM=  000002     |     TIM1_CCM=  000004 
    TIM1_CCM=  000005     |     TIM1_CCM=  000006     |     TIM1_CCM=  000003 
    TIM1_CCM=  005259     |     TIM1_CCM=  000000     |     TIM1_CCM=  000001 
    TIM1_CCM=  000004     |     TIM1_CCM=  000005     |     TIM1_CCM=  000006 
    TIM1_CCM=  000007     |     TIM1_CCM=  000002     |     TIM1_CCM=  000003 
    TIM1_CCM=  000007     |     TIM1_CCM=  000002     |     TIM1_CCM=  000004 
    TIM1_CCM=  000005     |     TIM1_CCM=  000006     |     TIM1_CCM=  000003 
    TIM1_CCM=  00525A     |     TIM1_CCM=  000000     |     TIM1_CCM=  000001 
    TIM1_CCM=  000004     |     TIM1_CCM=  000005     |     TIM1_CCM=  000006 
    TIM1_CCM=  000007     |     TIM1_CCM=  000002     |     TIM1_CCM=  000003 
    TIM1_CCM=  000007     |     TIM1_CCM=  000002     |     TIM1_CCM=  000004 
    TIM1_CCM=  000005     |     TIM1_CCM=  000006     |     TIM1_CCM=  000003 
    TIM1_CCM=  00525B     |     TIM1_CCM=  000000     |     TIM1_CCM=  000001 
    TIM1_CCM=  000004     |     TIM1_CCM=  000005     |     TIM1_CCM=  000006 
    TIM1_CCM=  000007     |     TIM1_CCM=  000002     |     TIM1_CCM=  000003 
    TIM1_CCM=  000007     |     TIM1_CCM=  000002     |     TIM1_CCM=  000004 
    TIM1_CCM=  000005     |     TIM1_CCM=  000006     |     TIM1_CCM=  000003 
    TIM1_CCR=  005265     |     TIM1_CCR=  005266     |     TIM1_CCR=  005267 
    TIM1_CCR=  005268     |     TIM1_CCR=  005269     |     TIM1_CCR=  00526A 
    TIM1_CCR=  00526B     |     TIM1_CCR=  00526C     |     TIM1_CNT=  00525E 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 198.
Hexadecimal [24-Bits]

Symbol Table

    TIM1_CNT=  00525F     |     TIM1_CR1=  005250     |     TIM1_CR2=  005251 
    TIM1_CR2=  000000     |     TIM1_CR2=  000002     |     TIM1_CR2=  000004 
    TIM1_CR2=  000005     |     TIM1_CR2=  000006     |     TIM1_DTR=  00526E 
    TIM1_EGR=  005257     |     TIM1_EGR=  000007     |     TIM1_EGR=  000001 
    TIM1_EGR=  000002     |     TIM1_EGR=  000003     |     TIM1_EGR=  000004 
    TIM1_EGR=  000005     |     TIM1_EGR=  000006     |     TIM1_EGR=  000000 
    TIM1_ETR=  005253     |     TIM1_ETR=  000006     |     TIM1_ETR=  000000 
    TIM1_ETR=  000001     |     TIM1_ETR=  000002     |     TIM1_ETR=  000003 
    TIM1_ETR=  000007     |     TIM1_ETR=  000004     |     TIM1_ETR=  000005 
    TIM1_IER=  005254     |     TIM1_IER=  000007     |     TIM1_IER=  000001 
    TIM1_IER=  000002     |     TIM1_IER=  000003     |     TIM1_IER=  000004 
    TIM1_IER=  000005     |     TIM1_IER=  000006     |     TIM1_IER=  000000 
    TIM1_OIS=  00526F     |     TIM1_PSC=  005260     |     TIM1_PSC=  005261 
    TIM1_RCR=  005264     |     TIM1_SMC=  005252     |     TIM1_SMC=  000007 
    TIM1_SMC=  000000     |     TIM1_SMC=  000001     |     TIM1_SMC=  000002 
    TIM1_SMC=  000004     |     TIM1_SMC=  000005     |     TIM1_SMC=  000006 
    TIM1_SR1=  005255     |     TIM1_SR1=  000007     |     TIM1_SR1=  000001 
    TIM1_SR1=  000002     |     TIM1_SR1=  000003     |     TIM1_SR1=  000004 
    TIM1_SR1=  000005     |     TIM1_SR1=  000006     |     TIM1_SR1=  000000 
    TIM1_SR2=  005256     |     TIM1_SR2=  000001     |     TIM1_SR2=  000002 
    TIM1_SR2=  000003     |     TIM1_SR2=  000004     |     TIM2_ARR=  00530D 
    TIM2_ARR=  00530E     |     TIM2_CCE=  005308     |     TIM2_CCE=  000000 
    TIM2_CCE=  000001     |     TIM2_CCE=  000004     |     TIM2_CCE=  000005 
    TIM2_CCE=  005309     |     TIM2_CCM=  005305     |     TIM2_CCM=  005306 
    TIM2_CCM=  005307     |     TIM2_CCM=  000000     |     TIM2_CCM=  000004 
    TIM2_CCM=  000003     |     TIM2_CCR=  00530F     |     TIM2_CCR=  005310 
    TIM2_CCR=  005311     |     TIM2_CCR=  005312     |     TIM2_CCR=  005313 
    TIM2_CCR=  005314     |     TIM2_CNT=  00530A     |     TIM2_CNT=  00530B 
    TIM2_CR1=  005300     |     TIM2_CR1=  000007     |     TIM2_CR1=  000000 
    TIM2_CR1=  000003     |     TIM2_CR1=  000001     |     TIM2_CR1=  000002 
    TIM2_EGR=  005304     |     TIM2_EGR=  000001     |     TIM2_EGR=  000002 
    TIM2_EGR=  000003     |     TIM2_EGR=  000006     |     TIM2_EGR=  000000 
    TIM2_IER=  005301     |     TIM2_PSC=  00530C     |     TIM2_SR1=  005302 
    TIM2_SR2=  005303     |     TIM3_ARR=  00532B     |     TIM3_ARR=  00532C 
    TIM3_CCE=  005327     |     TIM3_CCE=  000000     |     TIM3_CCE=  000001 
    TIM3_CCE=  000004     |     TIM3_CCE=  000005     |     TIM3_CCE=  000000 
    TIM3_CCE=  000001     |     TIM3_CCM=  005325     |     TIM3_CCM=  005326 
    TIM3_CCM=  000000     |     TIM3_CCM=  000004     |     TIM3_CCM=  000003 
    TIM3_CCR=  00532D     |     TIM3_CCR=  00532E     |     TIM3_CCR=  00532F 
    TIM3_CCR=  005330     |     TIM3_CNT=  005328     |     TIM3_CNT=  005329 
    TIM3_CR1=  005320     |     TIM3_CR1=  000007     |     TIM3_CR1=  000000 
    TIM3_CR1=  000003     |     TIM3_CR1=  000001     |     TIM3_CR1=  000002 
    TIM3_EGR=  005324     |     TIM3_IER=  005321     |     TIM3_PSC=  00532A 
    TIM3_SR1=  005322     |     TIM3_SR2=  005323     |     TIM4_ARR=  005346 
    TIM4_CNT=  005344     |     TIM4_CR1=  005340     |     TIM4_CR1=  000007 
    TIM4_CR1=  000000     |     TIM4_CR1=  000003     |     TIM4_CR1=  000001 
    TIM4_CR1=  000002     |     TIM4_EGR=  005343     |     TIM4_EGR=  000000 
    TIM4_IER=  005341     |     TIM4_IER=  000000     |     TIM4_PSC=  005345 
    TIM4_PSC=  000000     |     TIM4_PSC=  000007     |     TIM4_PSC=  000004 
    TIM4_PSC=  000001     |     TIM4_PSC=  000005     |     TIM4_PSC=  000002 
    TIM4_PSC=  000006     |     TIM4_PSC=  000003     |     TIM4_PSC=  000000 
    TIM4_PSC=  000001     |     TIM4_PSC=  000002     |     TIM4_SR =  005342 
    TIM4_SR_=  000000     |   6 TIMEOUTQ   000310 R   |   6 TIMER      0002FA R
    TIM_CR1_=  000007     |     TIM_CR1_=  000000     |     TIM_CR1_=  000006 
    TIM_CR1_=  000005     |     TIM_CR1_=  000004     |     TIM_CR1_=  000003 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 199.
Hexadecimal [24-Bits]

Symbol Table

    TIM_CR1_=  000001     |     TIM_CR1_=  000002     |   6 TNAM2      001AB0 R
  6 TNAM3      001ACE R   |   6 TNAM4      001AD4 R   |   6 TNAME      001AAD R
  6 TOFLASH    000335 R   |   6 TOKEN      0011EA R   |   6 TOR        0005E2 R
  6 TORAM      000375 R   |   6 TRUE       000857 R   |     TRUEE   =  00FFFF 
  6 TWOSL      000BE9 R   |   6 TYPE1      000F76 R   |   6 TYPE2      000F7C R
  6 TYPES      000F71 R   |   6 Timer4Ha   000005 R   |     UART1   =  000000 
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
    UBASE   =  000006     |     UBC     =  004801     |     UCNTXT  =  000016 
    UCP     =  00001A     |     UCTIB   =  00000E     |     UD1     =  000001 
    UD2     =  000002     |     UD3     =  000003     |     UD4     =  000004 
  6 UDIV10     003275 R   |   6 UDOT       000FFF R   |   6 UDOTR      000FDF R
  6 UDSLA3     002B11 R   |   6 UDSLA4     002B37 R   |   6 UDSLA7     002B68 R
  6 UDSLA8     002B73 R   |   6 UDSLMOD    002ADC R   |   6 UDSSTAR    002773 R
  6 UEND       000047 R   |     UFPSW   =  000008     |   6 UGREAT     00093D R
  6 UGREAT1    000948 R   |     UHLD    =  000014     |     UINN    =  00000C 
    UINTER  =  000012     |     ULAST   =  00001C     |   6 ULES1      00091B R
  6 ULESS      000910 R   |   6 UMMOD      0009B1 R   |   6 UMOD10     003237 R
  6 UMSTA      000ACC R   |   6 UNIQ1      001729 R   |   6 UNIQU      00170A R
  6 UNLKEE     001D55 R   |   6 UNLKFL     001D74 R   |   6 UNLOCK     001D93 R
  6 UNTIL      001600 R   |     UOFFSET =  00001E     |   6 UPDATCP    001D12 R
  6 UPDATLAS   001CE9 R   |   6 UPDATPTR   002315 R   |   6 UPDATRUN   001D01 R
  6 UPDATVP    001D29 R   |   6 UPL1       0006CB R   |   6 UPLUS      0006B4 R
    UPP     =  000006     |   6 UPPER      0011AD R   |   6 UPPER1     0011D0 R
  6 UPPER2     0011D9 R   |     URLAST  =  000022     |   6 USLMOD     000A00 R
    USR_BTN_=  000004     |     USR_BTN_=  000010     |     USR_BTN_=  005015 
    UTFLASH =  000020     |     UTIB    =  000010     |     UTMP    =  00000A 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 200.
Hexadecimal [24-Bits]

Symbol Table

  6 UTYP1      0019EA R   |   6 UTYP2      0019F9 R   |   6 UTYPE      0019E5 R
    UVP     =  000018     |   6 UZERO      00002B R   |   6 VARIA      001927 R
    VAR_BASE=  000080     |     VAR_TOP =  0017BF     |     VER     =  000004 
  6 VPP        000770 R   |     VSIZE   =  000006     |     WANT_CON=  000001 
    WANT_DEB=  000000     |     WANT_DOU=  000001     |     WANT_FLO=  000001 
    WANT_SCA=  000001     |     WANT_SEE=  000000     |     WDGOPT  =  004805 
    WDGOPT_I=  000002     |     WDGOPT_L=  000003     |     WDGOPT_W=  000000 
    WDGOPT_W=  000001     |   6 WHILE      00168F R   |   6 WITHI      000996 R
  6 WORDD      001193 R   |   6 WORDS      001B0A R   |   6 WORS1      001B10 R
  6 WORS2      001B2C R   |   6 WR_BYTE    001E3E R   |   6 WR_WORD    001E63 R
  6 WTABLE     00246D R   |   6 WTAT       002491 R   |   6 WTINIT     0024D6 R
    WWDG_CR =  0050D1     |     WWDG_WR =  0050D2     |     XMEM_SIZ=  017830 
    XOFF    =  000013     |     XON     =  000011     |   6 XORR       00069F R
    XTEMP   =  000024     |     YTEMP   =  000026     |     YTMP    =  000003 
  6 ZEQ1       0028A0 R   |   6 ZEQU1      00066C R   |   6 ZEQUAL     000662 R
  6 ZERO       000C03 R   |   6 ZL1        000659 R   |   6 ZLESS      000650 R
  6 app_spac   003600 R   |   6 baudrate   00037B R   |   6 block_er   001F29 R
  6 clear_ra   000019 R   |   6 clock_in   000064 R   |   6 copy_buf   001F89 R
  6 copy_buf   001FA8 R   |   6 copy_pro   001FA8 R   |     da      =  000002 
    db      =  000003     |     dc      =  000000     |     dd      =  000001 
  6 do2lit     0029B5 R   |   6 erase_fl   001F4B R   |   6 fmove_do   0022FE R
  6 main       000016 R   |   6 next_row   0022BB R   |   6 no_move    002305 R
  6 nsign      00255D R   |   6 parse_di   00258A R   |   6 parse_ex   002F4B R
  6 pristine   002029 R   |   6 proceed_   001F4E R   |   6 reboot     000327 R
  6 reset_ve   002090 R   |   6 row_eras   001F09 R   |   6 row_eras   001F62 R
  6 row_eras   001F89 R   |   6 set_opti   001FFD R   |   6 set_vect   002131 R
  6 uart_ini   000076 R   |   6 write_ro   001FCD R

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

