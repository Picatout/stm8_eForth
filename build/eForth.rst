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
      0080BB B6 00                  316         .word      LASTN  ;CNTXT pointer
      0080BD 00 80                  317         .word      VAR_BASE   ;variables free space pointer 
      0080BF B6 80                  318         .word      app_space ; FLASH free space pointer 
      0080C1 B6 00                  319         .word      LASTN   ;LAST
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
      00812D CC 9C 5C         [ 2]  391         jp  COLD   ;default=MN1
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
      0081CE CC 9F 58         [ 2]  479         jp EESTORE 
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
      008206 CD A1 5B         [ 4]  507         call CHKIVEC ; ( na -- ) 
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
      00824B CD 9D 8B         [ 4]  535         call UPDATCP 
      00824E CC 9D 62         [ 2]  536         jp UPDATLAST 
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
      0082D8 CC 9D A2         [ 2]  584         jp UPDATVP 
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
      008956 90 BF 26         [ 2] 1663         LDW YTEMP,Y 
      008959 1C 00 02         [ 2] 1664         ADDW X,#CELLL 
      00895C 90 93            [ 1] 1665         LDW Y,X
      00895E 90 FE            [ 2] 1666         LDW Y,(Y) ; n1 
      008960 72 B2 00 26      [ 2] 1667         SUBW Y,YTEMP ; n1-n2 
      008964 FF               [ 2] 1668         LDW (X),Y
      008965 81               [ 4] 1669         RET
                                   1670 
                                   1671 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1672 ;       ABS     ( n -- n )
                                   1673 ;       Return  absolute value of n.
                                   1674 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0008E6                       1675         _HEADER ABSS,3,"ABS"
      008966 89 50                    1         .word LINK 
                           0008E8     2         LINK=.
      008968 03                       3         .byte 3  
      008969 41 42 53                 4         .ascii "ABS"
      00896C                          5         ABSS:
      00896C 90 93            [ 1] 1676         LDW Y,X
      00896E 90 FE            [ 2] 1677 	LDW Y,(Y)
      008970 2A 03            [ 1] 1678         JRPL     AB1     ;negate:
      008972 90 50            [ 2] 1679         NEGW     Y     ;else negate hi byte
      008974 FF               [ 2] 1680         LDW (X),Y
      008975 81               [ 4] 1681 AB1:    RET
                                   1682 
                                   1683 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1684 ;       =       ( w w -- t )
                                   1685 ;       Return true if top two are equal.
                                   1686 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0008F6                       1687         _HEADER EQUAL,1,"="
      008976 89 68                    1         .word LINK 
                           0008F8     2         LINK=.
      008978 01                       3         .byte 1  
      008979 3D                       4         .ascii "="
      00897A                          5         EQUAL:
      00897A A6 FF            [ 1] 1688         LD A,#0xFF  ;true
      00897C 90 93            [ 1] 1689         LDW Y,X    
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 40.
Hexadecimal [24-Bits]



      00897E 90 FE            [ 2] 1690         LDW Y,(Y)   ; n2 
      008980 1C 00 02         [ 2] 1691         ADDW X,#CELLL 
      008983 F3               [ 2] 1692         CPW Y,(X)   ; n1==n2
      008984 27 01            [ 1] 1693         JREQ EQ1 
      008986 4F               [ 1] 1694         CLR A 
      008987 F7               [ 1] 1695 EQ1:    LD (X),A
      008988 E7 01            [ 1] 1696         LD (1,X),A
      00898A 81               [ 4] 1697 	RET     
                                   1698 
                                   1699 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1700 ;       U<      ( u1 u2 -- f )
                                   1701 ;       Unsigned compare of top two items.
                                   1702 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00090B                       1703         _HEADER ULESS,2,"U<"
      00898B 89 78                    1         .word LINK 
                           00090D     2         LINK=.
      00898D 02                       3         .byte 2  
      00898E 55 3C                    4         .ascii "U<"
      008990                          5         ULESS:
      008990 A6 FF            [ 1] 1704         LD A,#0xFF  ;true
      008992 90 93            [ 1] 1705         LDW Y,X    
      008994 90 EE 02         [ 2] 1706         LDW Y,(2,Y) ; u1 
      008997 F3               [ 2] 1707         CPW Y,(X)   ; cpw u1  u2 
      008998 25 01            [ 1] 1708         JRULT     ULES1
      00899A 4F               [ 1] 1709         CLR A
      00899B 1C 00 02         [ 2] 1710 ULES1:  ADDW X,#CELLL 
      00899E F7               [ 1] 1711         LD (X),A
      00899F E7 01            [ 1] 1712         LD (1,X),A
      0089A1 81               [ 4] 1713 	RET     
                                   1714 
                                   1715 
                                   1716 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1717 ;       <       ( n1 n2 -- t )
                                   1718 ;       Signed compare of top two items.
                                   1719 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000922                       1720         _HEADER LESS,1,"<"
      0089A2 89 8D                    1         .word LINK 
                           000924     2         LINK=.
      0089A4 01                       3         .byte 1  
      0089A5 3C                       4         .ascii "<"
      0089A6                          5         LESS:
      0089A6 A6 FF            [ 1] 1721         LD A,#0xFF  ;true
      0089A8 90 93            [ 1] 1722         LDW Y,X    
      0089AA 90 EE 02         [ 2] 1723         LDW Y,(2,Y)  ; n1 
      0089AD F3               [ 2] 1724         CPW Y,(X)  ; n1 < n2 ? 
      0089AE 2F 01            [ 1] 1725         JRSLT     LT1
      0089B0 4F               [ 1] 1726         CLR A
      0089B1 1C 00 02         [ 2] 1727 LT1:    ADDW X,#CELLL 
      0089B4 F7               [ 1] 1728         LD (X),A
      0089B5 E7 01            [ 1] 1729         LD (1,X),A
      0089B7 81               [ 4] 1730 	RET     
                                   1731 
                                   1732 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1733 ;   U> ( u1 u2 -- f )
                                   1734 ;   f = true if u1>u2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



                                   1735 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000938                       1736         _HEADER UGREAT,2,"U>"
      0089B8 89 A4                    1         .word LINK 
                           00093A     2         LINK=.
      0089BA 02                       3         .byte 2  
      0089BB 55 3E                    4         .ascii "U>"
      0089BD                          5         UGREAT:
      0089BD A6 FF            [ 1] 1737         LD A,#255  
      0089BF 90 93            [ 1] 1738         LDW Y,X 
      0089C1 90 EE 02         [ 2] 1739         LDW Y,(2,Y)  ; u1 
      0089C4 F3               [ 2] 1740         CPW Y,(X)  ; u1 > u2 
      0089C5 22 01            [ 1] 1741         JRUGT UGREAT1 
      0089C7 4F               [ 1] 1742         CLR A   
      0089C8                       1743 UGREAT1:
      0089C8 1C 00 02         [ 2] 1744         ADDW X,#CELLL 
      0089CB F7               [ 1] 1745         LD (X),A 
      0089CC E7 01            [ 1] 1746         LD (1,X),A 
      0089CE 81               [ 4] 1747         RET 
                                   1748 
                                   1749 
                                   1750 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1751 ;       >   (n1 n2 -- f )
                                   1752 ;  signed compare n1 n2 
                                   1753 ;  true if n1 > n2 
                                   1754 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00094F                       1755         _HEADER GREAT,1,">"
      0089CF 89 BA                    1         .word LINK 
                           000951     2         LINK=.
      0089D1 01                       3         .byte 1  
      0089D2 3E                       4         .ascii ">"
      0089D3                          5         GREAT:
      0089D3 A6 FF            [ 1] 1756         LD A,#0xFF ;
      0089D5 90 93            [ 1] 1757         LDW Y,X 
      0089D7 90 EE 02         [ 2] 1758         LDW Y,(2,Y)  ; n1 
      0089DA F3               [ 2] 1759         CPW Y,(X) ; n1 > n2 ?  
      0089DB 2C 01            [ 1] 1760         JRSGT GREAT1 
      0089DD 4F               [ 1] 1761         CLR  A
      0089DE                       1762 GREAT1:
      0089DE 1C 00 02         [ 2] 1763         ADDW X,#CELLL 
      0089E1 F7               [ 1] 1764         LD (X),A 
      0089E2 E7 01            [ 1] 1765         LD (1,X),A 
      0089E4 81               [ 4] 1766         RET 
                                   1767 
                                   1768 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1769 ;       MAX     ( n n -- n )
                                   1770 ;       Return greater of two top items.
                                   1771 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000965                       1772         _HEADER MAX,3,"MAX"
      0089E5 89 D1                    1         .word LINK 
                           000967     2         LINK=.
      0089E7 03                       3         .byte 3  
      0089E8 4D 41 58                 4         .ascii "MAX"
      0089EB                          5         MAX:
      0089EB 90 93            [ 1] 1773         LDW Y,X    
      0089ED 90 FE            [ 2] 1774         LDW Y,(Y) ; n2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal [24-Bits]



      0089EF E3 02            [ 2] 1775         CPW Y,(2,X)   
      0089F1 2F 02            [ 1] 1776         JRSLT  MAX1
      0089F3 EF 02            [ 2] 1777         LDW (2,X),Y
      0089F5 1C 00 02         [ 2] 1778 MAX1:   ADDW X,#2
      0089F8 81               [ 4] 1779 	RET     
                                   1780 
                                   1781 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1782 ;       MIN     ( n n -- n )
                                   1783 ;       Return smaller of top two items.
                                   1784 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000979                       1785         _HEADER MIN,3,"MIN"
      0089F9 89 E7                    1         .word LINK 
                           00097B     2         LINK=.
      0089FB 03                       3         .byte 3  
      0089FC 4D 49 4E                 4         .ascii "MIN"
      0089FF                          5         MIN:
      0089FF 90 93            [ 1] 1786         LDW Y,X    
      008A01 90 FE            [ 2] 1787         LDW Y,(Y)  ; n2 
      008A03 E3 02            [ 2] 1788         CPW Y,(2,X) 
      008A05 2C 02            [ 1] 1789         JRSGT MIN1
      008A07 EF 02            [ 2] 1790         LDW (2,X),Y
      008A09 1C 00 02         [ 2] 1791 MIN1:	ADDW X,#2
      008A0C 81               [ 4] 1792 	RET     
                                   1793 
                                   1794 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1795 ;       WITHIN  ( u ul uh -- t )
                                   1796 ;       Return true if u is within
                                   1797 ;       range of ul and uh. ( ul <= u < uh )
                                   1798 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00098D                       1799         _HEADER WITHI,6,"WITHIN"
      008A0D 89 FB                    1         .word LINK 
                           00098F     2         LINK=.
      008A0F 06                       3         .byte 6  
      008A10 57 49 54 48 49 4E        4         .ascii "WITHIN"
      008A16                          5         WITHI:
      008A16 CD 86 C1         [ 4] 1800         CALL     OVER
      008A19 CD 89 52         [ 4] 1801         CALL     SUBB
      008A1C CD 86 62         [ 4] 1802         CALL     TOR
      008A1F CD 89 52         [ 4] 1803         CALL     SUBB
      008A22 CD 85 B4         [ 4] 1804         CALL     RFROM
      008A25 CC 89 90         [ 2] 1805         JP     ULESS
                                   1806 
                                   1807 ;; Divide
                                   1808 
                                   1809 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1810 ;       UM/MOD  ( udl udh un -- ur uq )
                                   1811 ;       Unsigned divide of a double by a
                                   1812 ;       single. Return mod and quotient.
                                   1813 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1814 ; 2021-02-22
                                   1815 ; changed algorithm for Jeeek one 
                                   1816 ; ref: https://github.com/TG9541/stm8ef/pull/406        
      0009A8                       1817         _HEADER UMMOD,6,"UM/MOD"
      008A28 8A 0F                    1         .word LINK 
                           0009AA     2         LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
Hexadecimal [24-Bits]



      008A2A 06                       3         .byte 6  
      008A2B 55 4D 2F 4D 4F 44        4         .ascii "UM/MOD"
      008A31                          5         UMMOD:
      008A31 90 93            [ 1] 1818         LDW     Y,X             ; stack pointer to Y
      008A33 FE               [ 2] 1819         LDW     X,(X)           ; un
      008A34 BF 26            [ 2] 1820         LDW     YTEMP,X         ; save un
      008A36 93               [ 1] 1821         LDW     X,Y
      008A37 5C               [ 1] 1822         INCW    X               ; drop un
      008A38 5C               [ 1] 1823         INCW    X
      008A39 89               [ 2] 1824         PUSHW   X               ; save stack pointer
      008A3A FE               [ 2] 1825         LDW     X,(X)           ; X=udh
      008A3B 26 0B            [ 1] 1826         JRNE    MMSM0
      008A3D 1E 01            [ 2] 1827         LDW    X,(1,SP)
      008A3F EE 02            [ 2] 1828         LDW    X,(2,X)          ; udl 
      008A41 90 BE 26         [ 2] 1829         LDW     Y,YTEMP         ;divisor 
      008A44 65               [ 2] 1830         DIVW    X,Y             ; udl/un 
      008A45 51               [ 1] 1831         EXGW    X,Y 
      008A46 20 26            [ 2] 1832         JRA     MMSMb 
      008A48                       1833 MMSM0:    
      008A48 90 EE 04         [ 2] 1834         LDW     Y,(4,Y)         ; Y=udl (offset before drop)
      008A4B B3 26            [ 2] 1835         CPW     X,YTEMP
      008A4D 25 09            [ 1] 1836         JRULT   MMSM1           ; X is still on the R-stack
      008A4F 85               [ 2] 1837         POPW    X               ; restore stack pointer
      008A50 90 5F            [ 1] 1838         CLRW    Y
      008A52 EF 02            [ 2] 1839         LDW     (2,X),Y         ; remainder 0
      008A54 90 5A            [ 2] 1840         DECW    Y
      008A56 FF               [ 2] 1841         LDW     (X),Y           ; quotient max. 16 bit value
      008A57 81               [ 4] 1842         RET
      008A58                       1843 MMSM1:
      008A58 A6 10            [ 1] 1844         LD      A,#16           ; loop count
      008A5A 90 58            [ 2] 1845         SLLW    Y               ; udl shift udl into udh
      008A5C                       1846 MMSM3:
      008A5C 59               [ 2] 1847         RLCW    X               ; rotate udl bit into uhdh (= remainder)
      008A5D 25 04            [ 1] 1848         JRC     MMSMa           ; if carry out of rotate
      008A5F B3 26            [ 2] 1849         CPW     X,YTEMP         ; compare udh to un
      008A61 25 05            [ 1] 1850         JRULT   MMSM4           ; can't subtract
      008A63                       1851 MMSMa:
      008A63 72 B0 00 26      [ 2] 1852         SUBW    X,YTEMP         ; can subtract
      008A67 98               [ 1] 1853         RCF
      008A68                       1854 MMSM4:
      008A68 8C               [ 1] 1855         CCF                     ; quotient bit
      008A69 90 59            [ 2] 1856         RLCW    Y               ; rotate into quotient, rotate out udl
      008A6B 4A               [ 1] 1857         DEC     A               ; repeat
      008A6C 26 EE            [ 1] 1858         JRNE    MMSM3           ; if A == 0
      008A6E                       1859 MMSMb:
      008A6E BF 26            [ 2] 1860         LDW     YTEMP,X         ; done, save remainder
      008A70 85               [ 2] 1861         POPW    X               ; restore stack pointer
      008A71 FF               [ 2] 1862         LDW     (X),Y           ; save quotient
      008A72 90 BE 26         [ 2] 1863         LDW     Y,YTEMP         ; remainder onto stack
      008A75 EF 02            [ 2] 1864         LDW     (2,X),Y
      008A77 81               [ 4] 1865         RET
                                   1866 
                                   1867 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1868 ;   U/MOD ( u1 u2 -- ur uq )
                                   1869 ;   unsigned divide u1/u2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



                                   1870 ;   return remainder and quotient 
                                   1871 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0009F8                       1872         _HEADER USLMOD,5,"U/MOD"
      008A78 8A 2A                    1         .word LINK 
                           0009FA     2         LINK=.
      008A7A 05                       3         .byte 5  
      008A7B 55 2F 4D 4F 44           4         .ascii "U/MOD"
      008A80                          5         USLMOD:
      008A80 90 93            [ 1] 1873         LDW Y,X 
      008A82 90 FE            [ 2] 1874         LDW Y,(Y)  ; dividend 
      008A84 89               [ 2] 1875         PUSHW X    ; DP >R 
      008A85 EE 02            [ 2] 1876         LDW X,(2,X) ; divisor 
      008A87 65               [ 2] 1877         DIVW X,Y 
      008A88 89               [ 2] 1878         PUSHW X     ; quotient 
      008A89 1E 03            [ 2] 1879         LDW X,(3,SP) ; DP 
      008A8B EF 02            [ 2] 1880         LDW (2,X),Y ; remainder 
      008A8D 16 01            [ 2] 1881         LDW Y,(1,SP) ; quotient 
      008A8F FF               [ 2] 1882         LDW (X),Y 
      008A90 5B 04            [ 2] 1883         ADDW SP,#2*CELLL ; drop quotient and DP from rstack 
      008A92 81               [ 4] 1884         RET 
                                   1885 
                                   1886 
                                   1887 
                                   1888 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
                                   1889 ;       M/MOD   ( d n -- r q )
                                   1890 ;       Signed floored divide of double by
                                   1891 ;       single. Return mod and quotient.
                                   1892 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000A13                       1893         _HEADER MSMOD,5,"M/MOD"
      008A93 8A 7A                    1         .word LINK 
                           000A15     2         LINK=.
      008A95 05                       3         .byte 5  
      008A96 4D 2F 4D 4F 44           4         .ascii "M/MOD"
      008A9B                          5         MSMOD:
      008A9B CD 86 99         [ 4] 1894         CALL	DUPP
      008A9E CD 86 D0         [ 4] 1895         CALL	ZLESS
      008AA1 CD 86 99         [ 4] 1896         CALL	DUPP
      008AA4 CD 86 62         [ 4] 1897         CALL	TOR
      008AA7 CD 85 18         [ 4] 1898         CALL	QBRAN
      008AAA 8A B8                 1899         .word	MMOD1
      008AAC CD 89 06         [ 4] 1900         CALL	NEGAT
      008AAF CD 86 62         [ 4] 1901         CALL	TOR
      008AB2 CD 89 18         [ 4] 1902         CALL	DNEGA
      008AB5 CD 85 B4         [ 4] 1903         CALL	RFROM
      008AB8 CD 86 62         [ 4] 1904 MMOD1:	CALL	TOR
      008ABB CD 86 99         [ 4] 1905         CALL	DUPP
      008ABE CD 86 D0         [ 4] 1906         CALL	ZLESS
      008AC1 CD 85 18         [ 4] 1907         CALL	QBRAN
      008AC4 8A CC                 1908         .word	MMOD2
      008AC6 CD 85 C5         [ 4] 1909         CALL	RAT
      008AC9 CD 88 BC         [ 4] 1910         CALL	PLUS
      008ACC CD 85 B4         [ 4] 1911 MMOD2:	CALL	RFROM
      008ACF CD 8A 31         [ 4] 1912         CALL	UMMOD
      008AD2 CD 85 B4         [ 4] 1913         CALL	RFROM
      008AD5 CD 85 18         [ 4] 1914         CALL	QBRAN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



      008AD8 8A E3                 1915         .word	MMOD3
      008ADA CD 86 A9         [ 4] 1916         CALL	SWAPP
      008ADD CD 89 06         [ 4] 1917         CALL	NEGAT
      008AE0 CD 86 A9         [ 4] 1918         CALL	SWAPP
      008AE3 81               [ 4] 1919 MMOD3:	RET
                                   1920 
                                   1921 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1922 ;       /MOD    ( n1 n2 -- r q )
                                   1923 ;       Signed divide n1/n2. 
                                   1924 ;       Return mod and quotient.
                                   1925 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000A64                       1926         _HEADER SLMOD,4,"/MOD"
      008AE4 8A 95                    1         .word LINK 
                           000A66     2         LINK=.
      008AE6 04                       3         .byte 4  
      008AE7 2F 4D 4F 44              4         .ascii "/MOD"
      008AEB                          5         SLMOD:
      008AEB F6               [ 1] 1927         LD A,(X)
      008AEC 88               [ 1] 1928         PUSH A   ; n2 sign 
      008AED E6 02            [ 1] 1929         LD A,(2,X)
      008AEF 88               [ 1] 1930         PUSH A    ; n1 sign 
      008AF0 CD 89 6C         [ 4] 1931         CALL ABSS 
      008AF3 CD 86 62         [ 4] 1932         CALL TOR  ; 
      008AF6 CD 89 6C         [ 4] 1933         CALL ABSS 
      008AF9 CD 85 C5         [ 4] 1934         CALL RAT   
      008AFC CD 8A 80         [ 4] 1935         CALL USLMOD 
      008AFF 7B 03            [ 1] 1936         LD A,(3,SP)
      008B01 1A 04            [ 1] 1937         OR A,(4,SP)
      008B03 2A 25            [ 1] 1938         JRPL SLMOD8 ; both positive nothing to change 
      008B05 7B 03            [ 1] 1939         LD A,(3,SP)
      008B07 18 04            [ 1] 1940         XOR A,(4,SP)
      008B09 2A 12            [ 1] 1941         JRPL SLMOD1
                                   1942 ; dividend and divisor are opposite sign          
      008B0B CD 8C 17         [ 4] 1943         CALL ONEP   ; add one to quotient 
      008B0E CD 89 06         [ 4] 1944         CALL NEGAT ; negative quotient
      008B11 CD 85 C5         [ 4] 1945         CALL RAT 
      008B14 CD 88 5D         [ 4] 1946         CALL ROT 
      008B17 CD 89 52         [ 4] 1947         CALL SUBB  ; corrected_remainder=divisor-remainder 
      008B1A CD 86 A9         [ 4] 1948         CALL SWAPP
      008B1D                       1949 SLMOD1:
      008B1D 7B 04            [ 1] 1950         LD A,(4,SP) ; divisor sign 
      008B1F 2A 09            [ 1] 1951         JRPL SLMOD8 
      008B21 CD 86 62         [ 4] 1952         CALL TOR 
      008B24 CD 89 06         [ 4] 1953         CALL NEGAT ; if divisor negative negate remainder 
      008B27 CD 85 B4         [ 4] 1954         CALL RFROM 
      008B2A                       1955 SLMOD8: 
      008B2A 5B 04            [ 2] 1956         ADDW SP,#4 
      008B2C 81               [ 4] 1957         RET 
                                   1958 
                                   1959 ;        CALL	OVER
                                   1960 ;        CALL	ZLESS
                                   1961 ;        CALL	SWAPP
                                   1962 ;        JP	MSMOD
                                   1963 
                                   1964 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



                                   1965 ;       MOD     ( n n -- r )
                                   1966 ;       Signed divide. Return mod only.
                                   1967 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000AAD                       1968         _HEADER MODD,3,"MOD"
      008B2D 8A E6                    1         .word LINK 
                           000AAF     2         LINK=.
      008B2F 03                       3         .byte 3  
      008B30 4D 4F 44                 4         .ascii "MOD"
      008B33                          5         MODD:
      008B33 CD 8A EB         [ 4] 1969 	CALL	SLMOD
      008B36 CC 86 8F         [ 2] 1970 	JP	DROP
                                   1971 
                                   1972 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1973 ;       /       ( n n -- q )
                                   1974 ;       Signed divide. Return quotient only.
                                   1975 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000AB9                       1976         _HEADER SLASH,1,"/"
      008B39 8B 2F                    1         .word LINK 
                           000ABB     2         LINK=.
      008B3B 01                       3         .byte 1  
      008B3C 2F                       4         .ascii "/"
      008B3D                          5         SLASH:
      008B3D CD 8A EB         [ 4] 1977         CALL	SLMOD
      008B40 CD 86 A9         [ 4] 1978         CALL	SWAPP
      008B43 CC 86 8F         [ 2] 1979         JP	DROP
                                   1980 
                                   1981 ;; Multiply
                                   1982 
                                   1983 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1984 ;       UM*     ( u1 u2 -- ud )
                                   1985 ;       Unsigned multiply. Return 
                                   1986 ;       double product.
                                   1987 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000AC6                       1988         _HEADER UMSTA,3,"UM*"
      008B46 8B 3B                    1         .word LINK 
                           000AC8     2         LINK=.
      008B48 03                       3         .byte 3  
      008B49 55 4D 2A                 4         .ascii "UM*"
      008B4C                          5         UMSTA:
                                   1989 ; stack have 4 bytes u1=a:b u2=c:d
                                   1990         ;; bytes offset on data stack 
                           000002  1991         da=2 
                           000003  1992         db=3 
                           000000  1993         dc=0 
                           000001  1994         dd=1 
                                   1995         ;;;;;; local variables ;;;;;;;;;
                                   1996         ;; product bytes offset on return stack 
                           000001  1997         UD1=1  ; ud bits 31..24
                           000002  1998         UD2=2  ; ud bits 23..16
                           000003  1999         UD3=3  ; ud bits 15..8 
                           000004  2000         UD4=4  ; ud bits 7..0 
                                   2001         ;; local variable for product set to zero   
      008B4C 90 5F            [ 1] 2002         clrw y 
      008B4E 90 89            [ 2] 2003         pushw y  ; bits 15..0
      008B50 90 89            [ 2] 2004         pushw y  ; bits 31..16 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



      008B52 E6 03            [ 1] 2005         ld a,(db,x) ; b 
      008B54 90 97            [ 1] 2006         ld yl,a 
      008B56 E6 01            [ 1] 2007         ld a,(dd,x)   ; d
      008B58 90 42            [ 4] 2008         mul y,a    ; b*d  
      008B5A 17 03            [ 2] 2009         ldw (UD3,sp),y ; lowest weight product 
      008B5C E6 03            [ 1] 2010         ld a,(db,x)
      008B5E 90 97            [ 1] 2011         ld yl,a 
      008B60 E6 00            [ 1] 2012         ld a,(dc,x)
      008B62 90 42            [ 4] 2013         mul y,a  ; b*c 
                                   2014         ;;; do the partial sum 
      008B64 72 F9 02         [ 2] 2015         addw y,(UD2,sp)
      008B67 4F               [ 1] 2016         clr a 
      008B68 49               [ 1] 2017         rlc a
      008B69 6B 01            [ 1] 2018         ld (UD1,sp),a 
      008B6B 17 02            [ 2] 2019         ldw (UD2,sp),y 
      008B6D E6 02            [ 1] 2020         ld a,(da,x)
      008B6F 90 97            [ 1] 2021         ld yl,a 
      008B71 E6 01            [ 1] 2022         ld a,(dd,x)
      008B73 90 42            [ 4] 2023         mul y,a   ; a*d 
                                   2024         ;; do partial sum 
      008B75 72 F9 02         [ 2] 2025         addw y,(UD2,sp)
      008B78 4F               [ 1] 2026         clr a 
      008B79 19 01            [ 1] 2027         adc a,(UD1,sp)
      008B7B 6B 01            [ 1] 2028         ld (UD1,sp),a  
      008B7D 17 02            [ 2] 2029         ldw (UD2,sp),y 
      008B7F E6 02            [ 1] 2030         ld a,(da,x)
      008B81 90 97            [ 1] 2031         ld yl,a 
      008B83 E6 00            [ 1] 2032         ld a,(dc,x)
      008B85 90 42            [ 4] 2033         mul y,a  ;  a*c highest weight product 
                                   2034         ;;; do partial sum 
      008B87 72 F9 01         [ 2] 2035         addw y,(UD1,sp)
      008B8A FF               [ 2] 2036         ldw (x),y  ; udh 
      008B8B 16 03            [ 2] 2037         ldw y,(UD3,sp)
      008B8D EF 02            [ 2] 2038         ldw (2,x),y  ; udl  
      008B8F 5B 04            [ 2] 2039         addw sp,#4 ; drop local variable 
      008B91 81               [ 4] 2040         ret  
                                   2041 
                                   2042 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2043 ;       *       ( n n -- n )
                                   2044 ;       Signed multiply. Return 
                                   2045 ;       single product.
                                   2046 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000B12                       2047         _HEADER STAR,1,"*"
      008B92 8B 48                    1         .word LINK 
                           000B14     2         LINK=.
      008B94 01                       3         .byte 1  
      008B95 2A                       4         .ascii "*"
      008B96                          5         STAR:
      008B96 CD 8B 4C         [ 4] 2048 	CALL	UMSTA
      008B99 CC 86 8F         [ 2] 2049 	JP	DROP
                                   2050 
                                   2051 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2052 ;       M*      ( n n -- d )
                                   2053 ;       Signed multiply. Return 
                                   2054 ;       double product.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



                                   2055 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000B1C                       2056         _HEADER MSTAR,2,"M*"
      008B9C 8B 94                    1         .word LINK 
                           000B1E     2         LINK=.
      008B9E 02                       3         .byte 2  
      008B9F 4D 2A                    4         .ascii "M*"
      008BA1                          5         MSTAR:
      008BA1 CD 88 A7         [ 4] 2057         CALL	DDUP
      008BA4 CD 87 1F         [ 4] 2058         CALL	XORR
      008BA7 CD 86 D0         [ 4] 2059         CALL	ZLESS
      008BAA CD 86 62         [ 4] 2060         CALL	TOR
      008BAD CD 89 6C         [ 4] 2061         CALL	ABSS
      008BB0 CD 86 A9         [ 4] 2062         CALL	SWAPP
      008BB3 CD 89 6C         [ 4] 2063         CALL	ABSS
      008BB6 CD 8B 4C         [ 4] 2064         CALL	UMSTA
      008BB9 CD 85 B4         [ 4] 2065         CALL	RFROM
      008BBC CD 85 18         [ 4] 2066         CALL	QBRAN
      008BBF 8B C4                 2067         .word	MSTA1
      008BC1 CD 89 18         [ 4] 2068         CALL	DNEGA
      008BC4 81               [ 4] 2069 MSTA1:	RET
                                   2070 
                                   2071 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2072 ;       */MOD   ( n1 n2 n3 -- r q )
                                   2073 ;       Multiply n1 and n2, then divide
                                   2074 ;       by n3. Return mod and quotient.
                                   2075 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000B45                       2076         _HEADER SSMOD,5,"*/MOD"
      008BC5 8B 9E                    1         .word LINK 
                           000B47     2         LINK=.
      008BC7 05                       3         .byte 5  
      008BC8 2A 2F 4D 4F 44           4         .ascii "*/MOD"
      008BCD                          5         SSMOD:
      008BCD CD 86 62         [ 4] 2077         CALL     TOR
      008BD0 CD 8B A1         [ 4] 2078         CALL     MSTAR
      008BD3 CD 85 B4         [ 4] 2079         CALL     RFROM
      008BD6 CC 8A 9B         [ 2] 2080         JP     MSMOD
                                   2081 
                                   2082 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2083 ;       */      ( n1 n2 n3 -- q )
                                   2084 ;       Multiply n1 by n2, then divide
                                   2085 ;       by n3. Return quotient only.
                                   2086 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000B59                       2087         _HEADER STASL,2,"*/"
      008BD9 8B C7                    1         .word LINK 
                           000B5B     2         LINK=.
      008BDB 02                       3         .byte 2  
      008BDC 2A 2F                    4         .ascii "*/"
      008BDE                          5         STASL:
      008BDE CD 8B CD         [ 4] 2088         CALL	SSMOD
      008BE1 CD 86 A9         [ 4] 2089         CALL	SWAPP
      008BE4 CC 86 8F         [ 2] 2090         JP	DROP
                                   2091 
                                   2092 ;; Miscellaneous
                                   2093 
                                   2094 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



                                   2095 ;       2+   ( a -- a )
                                   2096 ;       Add cell size in byte to address.
                                   2097 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000B67                       2098         _HEADER CELLP,2,"2+"
      008BE7 8B DB                    1         .word LINK 
                           000B69     2         LINK=.
      008BE9 02                       3         .byte 2  
      008BEA 32 2B                    4         .ascii "2+"
      008BEC                          5         CELLP:
      008BEC 90 93            [ 1] 2099         LDW Y,X
      008BEE 90 FE            [ 2] 2100 	LDW Y,(Y)
      008BF0 72 A9 00 02      [ 2] 2101         ADDW Y,#CELLL 
      008BF4 FF               [ 2] 2102         LDW (X),Y
      008BF5 81               [ 4] 2103         RET
                                   2104 
                                   2105 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2106 ;       2-   ( a -- a )
                                   2107 ;       Subtract 2 from address.
                                   2108 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000B76                       2109         _HEADER CELLM,2,"2-"
      008BF6 8B E9                    1         .word LINK 
                           000B78     2         LINK=.
      008BF8 02                       3         .byte 2  
      008BF9 32 2D                    4         .ascii "2-"
      008BFB                          5         CELLM:
      008BFB 90 93            [ 1] 2110         LDW Y,X
      008BFD 90 FE            [ 2] 2111 	LDW Y,(Y)
      008BFF 72 A2 00 02      [ 2] 2112         SUBW Y,#CELLL
      008C03 FF               [ 2] 2113         LDW (X),Y
      008C04 81               [ 4] 2114         RET
                                   2115 
                                   2116 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2117 ;       2*   ( n -- n )
                                   2118 ;       Multiply tos by 2.
                                   2119 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000B85                       2120         _HEADER CELLS,2,"2*"
      008C05 8B F8                    1         .word LINK 
                           000B87     2         LINK=.
      008C07 02                       3         .byte 2  
      008C08 32 2A                    4         .ascii "2*"
      008C0A                          5         CELLS:
      008C0A 90 93            [ 1] 2121         LDW Y,X
      008C0C 90 FE            [ 2] 2122 	LDW Y,(Y)
      008C0E 90 58            [ 2] 2123         SLAW Y
      008C10 FF               [ 2] 2124         LDW (X),Y
      008C11 81               [ 4] 2125         RET
                                   2126 
                                   2127 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2128 ;       1+      ( a -- a )
                                   2129 ;       Add cell size in byte 
                                   2130 ;       to address.
                                   2131 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000B92                       2132         _HEADER ONEP,2,"1+"
      008C12 8C 07                    1         .word LINK 
                           000B94     2         LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



      008C14 02                       3         .byte 2  
      008C15 31 2B                    4         .ascii "1+"
      008C17                          5         ONEP:
      008C17 90 93            [ 1] 2133         LDW Y,X
      008C19 90 FE            [ 2] 2134 	LDW Y,(Y)
      008C1B 90 5C            [ 1] 2135         INCW Y
      008C1D FF               [ 2] 2136         LDW (X),Y
      008C1E 81               [ 4] 2137         RET
                                   2138 
                                   2139 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2140 ;       1-      ( a -- a )
                                   2141 ;       Subtract 2 from address.
                                   2142 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000B9F                       2143         _HEADER ONEM,2,"1-"
      008C1F 8C 14                    1         .word LINK 
                           000BA1     2         LINK=.
      008C21 02                       3         .byte 2  
      008C22 31 2D                    4         .ascii "1-"
      008C24                          5         ONEM:
      008C24 90 93            [ 1] 2144         LDW Y,X
      008C26 90 FE            [ 2] 2145 	LDW Y,(Y)
      008C28 90 5A            [ 2] 2146         DECW Y
      008C2A FF               [ 2] 2147         LDW (X),Y
      008C2B 81               [ 4] 2148         RET
                                   2149 
                                   2150 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2151 ;  shift left n times 
                                   2152 ; LSHIFT ( n1 n2 -- n1<<n2 )
                                   2153 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000BAC                       2154         _HEADER LSHIFT,6,"LSHIFT"
      008C2C 8C 21                    1         .word LINK 
                           000BAE     2         LINK=.
      008C2E 06                       3         .byte 6  
      008C2F 4C 53 48 49 46 54        4         .ascii "LSHIFT"
      008C35                          5         LSHIFT:
      008C35 E6 01            [ 1] 2155         ld a,(1,x)
      008C37 1C 00 02         [ 2] 2156         addw x,#CELLL 
      008C3A 90 93            [ 1] 2157         ldw y,x 
      008C3C 90 FE            [ 2] 2158         ldw y,(y)
      008C3E                       2159 LSHIFT1:
      008C3E 4D               [ 1] 2160         tnz a 
      008C3F 27 05            [ 1] 2161         jreq LSHIFT4 
      008C41 90 58            [ 2] 2162         sllw y 
      008C43 4A               [ 1] 2163         dec a 
      008C44 20 F8            [ 2] 2164         jra LSHIFT1 
      008C46                       2165 LSHIFT4:
      008C46 FF               [ 2] 2166         ldw (x),y 
      008C47 81               [ 4] 2167         ret 
                                   2168 
                                   2169 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2170 ; shift right n times                 
                                   2171 ; RSHIFT (n1 n2 -- n1>>n2 )
                                   2172 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000BC8                       2173         _HEADER RSHIFT,6,"RSHIFT"
      008C48 8C 2E                    1         .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



                           000BCA     2         LINK=.
      008C4A 06                       3         .byte 6  
      008C4B 52 53 48 49 46 54        4         .ascii "RSHIFT"
      008C51                          5         RSHIFT:
      008C51 E6 01            [ 1] 2174         ld a,(1,x)
      008C53 1C 00 02         [ 2] 2175         addw x,#CELLL 
      008C56 90 93            [ 1] 2176         ldw y,x 
      008C58 90 FE            [ 2] 2177         ldw y,(y)
      008C5A                       2178 RSHIFT1:
      008C5A 4D               [ 1] 2179         tnz a 
      008C5B 27 05            [ 1] 2180         jreq RSHIFT4 
      008C5D 90 54            [ 2] 2181         srlw y 
      008C5F 4A               [ 1] 2182         dec a 
      008C60 20 F8            [ 2] 2183         jra RSHIFT1 
      008C62                       2184 RSHIFT4:
      008C62 FF               [ 2] 2185         ldw (x),y 
      008C63 81               [ 4] 2186         ret 
                                   2187 
                                   2188 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2189 ;       2/      ( n -- n )
                                   2190 ;       divide  tos by 2.
                                   2191 ;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000BE4                       2192         _HEADER TWOSL,2,"2/"
      008C64 8C 4A                    1         .word LINK 
                           000BE6     2         LINK=.
      008C66 02                       3         .byte 2  
      008C67 32 2F                    4         .ascii "2/"
      008C69                          5         TWOSL:
      008C69 90 93            [ 1] 2193         LDW Y,X
      008C6B 90 FE            [ 2] 2194 	LDW Y,(Y)
      008C6D 90 57            [ 2] 2195         SRAW Y
      008C6F FF               [ 2] 2196         LDW (X),Y
      008C70 81               [ 4] 2197         RET
                                   2198 
                                   2199 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2200 ;       BL      ( -- 32 )
                                   2201 ;       Return 32,  blank character.
                                   2202 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000BF1                       2203         _HEADER BLANK,2,"BL"
      008C71 8C 66                    1         .word LINK 
                           000BF3     2         LINK=.
      008C73 02                       3         .byte 2  
      008C74 42 4C                    4         .ascii "BL"
      008C76                          5         BLANK:
      008C76 1D 00 02         [ 2] 2204         SUBW X,#2
      008C79 90 AE 00 20      [ 2] 2205 	LDW Y,#32
      008C7D FF               [ 2] 2206         LDW (X),Y
      008C7E 81               [ 4] 2207         RET
                                   2208 
                                   2209 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2210 ;         0     ( -- 0)
                                   2211 ;         Return 0.
                                   2212 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000BFF                       2213         _HEADER ZERO,1,"0"
      008C7F 8C 73                    1         .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



                           000C01     2         LINK=.
      008C81 01                       3         .byte 1  
      008C82 30                       4         .ascii "0"
      008C83                          5         ZERO:
      008C83 1D 00 02         [ 2] 2214         SUBW X,#2
      008C86 90 5F            [ 1] 2215 	CLRW Y
      008C88 FF               [ 2] 2216         LDW (X),Y
      008C89 81               [ 4] 2217         RET
                                   2218 
                                   2219 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2220 ;         1     ( -- 1)
                                   2221 ;         Return 1.
                                   2222 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000C0A                       2223         _HEADER ONE,1,"1"
      008C8A 8C 81                    1         .word LINK 
                           000C0C     2         LINK=.
      008C8C 01                       3         .byte 1  
      008C8D 31                       4         .ascii "1"
      008C8E                          5         ONE:
      008C8E 1D 00 02         [ 2] 2224         SUBW X,#2
      008C91 90 AE 00 01      [ 2] 2225 	LDW Y,#1
      008C95 FF               [ 2] 2226         LDW (X),Y
      008C96 81               [ 4] 2227         RET
                                   2228 
                                   2229 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2230 ;         -1    ( -- -1)
                                   2231 ;   Return -1
                                   2232 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000C17                       2233         _HEADER MONE,2,"-1"
      008C97 8C 8C                    1         .word LINK 
                           000C19     2         LINK=.
      008C99 02                       3         .byte 2  
      008C9A 2D 31                    4         .ascii "-1"
      008C9C                          5         MONE:
      008C9C 1D 00 02         [ 2] 2234         SUBW X,#2
      008C9F 90 AE FF FF      [ 2] 2235 	LDW Y,#0xFFFF
      008CA3 FF               [ 2] 2236         LDW (X),Y
      008CA4 81               [ 4] 2237         RET
                                   2238 
                                   2239 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2240 ;       >CHAR   ( c -- c )
                                   2241 ;       Filter non-printing characters.
                                   2242 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000C25                       2243         _HEADER TCHAR,5,">CHAR"
      008CA5 8C 99                    1         .word LINK 
                           000C27     2         LINK=.
      008CA7 05                       3         .byte 5  
      008CA8 3E 43 48 41 52           4         .ascii ">CHAR"
      008CAD                          5         TCHAR:
      008CAD E6 01            [ 1] 2244         ld a,(1,x)
      008CAF A1 20            [ 1] 2245         cp a,#32  
      008CB1 2B 05            [ 1] 2246         jrmi 1$ 
      008CB3 A1 7F            [ 1] 2247         cp a,#127 
      008CB5 2A 01            [ 1] 2248         jrpl 1$ 
      008CB7 81               [ 4] 2249         ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



      008CB8 A6 5F            [ 1] 2250 1$:     ld a,#'_ 
      008CBA E7 01            [ 1] 2251         ld (1,x),a 
      008CBC 81               [ 4] 2252         ret 
                                   2253 
                                   2254 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2255 ;       DEPTH   ( -- n )
                                   2256 ;       Return  depth of  data stack.
                                   2257 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000C3D                       2258         _HEADER DEPTH,5,"DEPTH"
      008CBD 8C A7                    1         .word LINK 
                           000C3F     2         LINK=.
      008CBF 05                       3         .byte 5  
      008CC0 44 45 50 54 48           4         .ascii "DEPTH"
      008CC5                          5         DEPTH:
      008CC5 90 BE 2C         [ 2] 2259         LDW Y,SP0    ;save data stack ptr
      008CC8 BF 24            [ 2] 2260 	LDW XTEMP,X
      008CCA 72 B2 00 24      [ 2] 2261         SUBW Y,XTEMP     ;#bytes = SP0 - X
      008CCE 90 57            [ 2] 2262         SRAW Y    ;Y = #stack items
      008CD0 1D 00 02         [ 2] 2263 	SUBW X,#2
      008CD3 FF               [ 2] 2264         LDW (X),Y     ; if neg, underflow
      008CD4 81               [ 4] 2265         RET
                                   2266 
                                   2267 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2268 ;       PICK    ( ... +n -- ... w )
                                   2269 ;       Copy  nth stack item to tos.
                                   2270 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000C55                       2271         _HEADER PICK,4,"PICK"
      008CD5 8C BF                    1         .word LINK 
                           000C57     2         LINK=.
      008CD7 04                       3         .byte 4  
      008CD8 50 49 43 4B              4         .ascii "PICK"
      008CDC                          5         PICK:
      008CDC 90 93            [ 1] 2272         LDW Y,X   ;D = n1
      008CDE 90 FE            [ 2] 2273         LDW Y,(Y)
                                   2274 ; modified for standard compliance          
                                   2275 ; 0 PICK must be equivalent to DUP 
      008CE0 90 5C            [ 1] 2276         INCW Y 
      008CE2 90 58            [ 2] 2277         SLAW Y
      008CE4 BF 24            [ 2] 2278         LDW XTEMP,X
      008CE6 72 B9 00 24      [ 2] 2279         ADDW Y,XTEMP
      008CEA 90 FE            [ 2] 2280         LDW Y,(Y)
      008CEC FF               [ 2] 2281         LDW (X),Y
      008CED 81               [ 4] 2282         RET
                                   2283 
                                   2284 ;; Memory access
                                   2285 
                                   2286 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2287 ;       +!      ( n a -- )
                                   2288 ;       Add n to  contents at 
                                   2289 ;       address a.
                                   2290 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000C6E                       2291         _HEADER PSTOR,2,"+!"
      008CEE 8C D7                    1         .word LINK 
                           000C70     2         LINK=.
      008CF0 02                       3         .byte 2  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



      008CF1 2B 21                    4         .ascii "+!"
      008CF3                          5         PSTOR:
      008CF3 89               [ 2] 2292         PUSHW X   ; R: DP 
      008CF4 90 93            [ 1] 2293         LDW Y,X 
      008CF6 FE               [ 2] 2294         LDW X,(X) ; a 
      008CF7 90 EE 02         [ 2] 2295         LDW Y,(2,Y)  ; n 
      008CFA 90 89            [ 2] 2296         PUSHW Y      ; R: DP n 
      008CFC 90 93            [ 1] 2297         LDW Y,X 
      008CFE 90 FE            [ 2] 2298         LDW Y,(Y)
      008D00 72 F9 01         [ 2] 2299         ADDW Y,(1,SP) ; *a + n 
      008D03 FF               [ 2] 2300         LDW (X),Y 
      008D04 1E 03            [ 2] 2301         LDW X,(3,SP) ; DP
      008D06 1C 00 04         [ 2] 2302         ADDW X,#2*CELLL  ; ( n a -- )  
      008D09 5B 04            [ 2] 2303         ADDW SP,#2*CELLL ; R: DP n -- 
      008D0B 81               [ 4] 2304         RET 
                                   2305                 
                                   2306 
                                   2307 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2308 ;       2!      ( d a -- )
                                   2309 ;       Store  double integer 
                                   2310 ;       to address a.
                                   2311 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000C8C                       2312         _HEADER DSTOR,2,"2!"
      008D0C 8C F0                    1         .word LINK 
                           000C8E     2         LINK=.
      008D0E 02                       3         .byte 2  
      008D0F 32 21                    4         .ascii "2!"
      008D11                          5         DSTOR:
      008D11 90 93            [ 1] 2313         LDW Y,X 
      008D13 89               [ 2] 2314         PUSHW X 
      008D14 FE               [ 2] 2315         LDW X,(X) ; a 
      008D15 90 EE 02         [ 2] 2316         LDW Y,(2,Y) ; dhi 
      008D18 FF               [ 2] 2317         LDW (X),Y 
      008D19 16 01            [ 2] 2318         LDW Y,(1,SP)  
      008D1B 90 EE 04         [ 2] 2319         LDW Y,(4,Y) ; dlo 
      008D1E EF 02            [ 2] 2320         LDW (2,X),Y  
      008D20 85               [ 2] 2321         POPW X 
      008D21 1C 00 06         [ 2] 2322         ADDW X,#3*CELLL 
      008D24 81               [ 4] 2323         RET 
                                   2324 
                                   2325 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2326 ;       2@      ( a -- d )
                                   2327 ;       Fetch double integer 
                                   2328 ;       from address a.
                                   2329 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000CA5                       2330         _HEADER DAT,2,"2@"
      008D25 8D 0E                    1         .word LINK 
                           000CA7     2         LINK=.
      008D27 02                       3         .byte 2  
      008D28 32 40                    4         .ascii "2@"
      008D2A                          5         DAT:
      008D2A 90 93            [ 1] 2331         ldw y,x 
      008D2C 1D 00 02         [ 2] 2332         subw x,#CELLL 
      008D2F 90 FE            [ 2] 2333         ldw y,(y) ;address 
      008D31 90 89            [ 2] 2334         pushw y  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



      008D33 90 FE            [ 2] 2335         ldw y,(y) ; dhi 
      008D35 FF               [ 2] 2336         ldw (x),y 
      008D36 90 85            [ 2] 2337         popw y 
      008D38 90 EE 02         [ 2] 2338         ldw y,(2,y) ; dlo 
      008D3B EF 02            [ 2] 2339         ldw (2,x),y 
      008D3D 81               [ 4] 2340         ret 
                                   2341 
                                   2342 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2343 ;       COUNT   ( b -- b +n )
                                   2344 ;       Return count byte of a string
                                   2345 ;       and add 1 to byte address.
                                   2346 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000CBE                       2347         _HEADER COUNT,5,"COUNT"
      008D3E 8D 27                    1         .word LINK 
                           000CC0     2         LINK=.
      008D40 05                       3         .byte 5  
      008D41 43 4F 55 4E 54           4         .ascii "COUNT"
      008D46                          5         COUNT:
      008D46 90 93            [ 1] 2348         ldw y,x 
      008D48 90 FE            [ 2] 2349         ldw y,(y) ; address 
      008D4A 90 F6            [ 1] 2350         ld a,(y)  ; count 
      008D4C 90 5C            [ 1] 2351         incw y 
      008D4E FF               [ 2] 2352         ldw (x),y 
      008D4F 1D 00 02         [ 2] 2353         subw x,#CELLL 
      008D52 E7 01            [ 1] 2354         ld (1,x),a 
      008D54 7F               [ 1] 2355         clr (x)
      008D55 81               [ 4] 2356         ret 
                                   2357 
                                   2358 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2359 ;       HERE    ( -- a )
                                   2360 ;       Return  top of  variables
                                   2361 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000CD6                       2362         _HEADER HERE,4,"HERE"
      008D56 8D 40                    1         .word LINK 
                           000CD8     2         LINK=.
      008D58 04                       3         .byte 4  
      008D59 48 45 52 45              4         .ascii "HERE"
      008D5D                          5         HERE:
      008D5D 90 AE 00 18      [ 2] 2363       	ldw y,#UVP 
      008D61 90 FE            [ 2] 2364         ldw y,(y)
      008D63 1D 00 02         [ 2] 2365         subw x,#CELLL 
      008D66 FF               [ 2] 2366         ldw (x),y 
      008D67 81               [ 4] 2367         ret 
                                   2368 
                                   2369 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2370 ;       PAD     ( -- a )
                                   2371 ;       Return address of text buffer
                                   2372 ;       above  code dictionary.
                                   2373 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000CE8                       2374         _HEADER PAD,3,"PAD"
      008D68 8D 58                    1         .word LINK 
                           000CEA     2         LINK=.
      008D6A 03                       3         .byte 3  
      008D6B 50 41 44                 4         .ascii "PAD"
      008D6E                          5         PAD:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



      008D6E CD 8D 5D         [ 4] 2375         CALL     HERE
      000CF1                       2376         _DOLIT   80
      008D71 CD 84 EF         [ 4]    1     CALL DOLIT 
      008D74 00 50                    2     .word 80 
      008D76 CC 88 BC         [ 2] 2377         JP     PLUS
                                   2378 
                                   2379 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2380 ;       TIB     ( -- a )
                                   2381 ;       Return address of 
                                   2382 ;       terminal input buffer.
                                   2383 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000CF9                       2384         _HEADER TIB,3,"TIB"
      008D79 8D 6A                    1         .word LINK 
                           000CFB     2         LINK=.
      008D7B 03                       3         .byte 3  
      008D7C 54 49 42                 4         .ascii "TIB"
      008D7F                          5         TIB:
      008D7F CD 87 8D         [ 4] 2385         CALL     NTIB
      008D82 CD 8B EC         [ 4] 2386         CALL     CELLP
      008D85 CC 85 63         [ 2] 2387         JP     AT
                                   2388 
                                   2389 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2390 ;       @EXECUTE        ( a -- )
                                   2391 ;       Execute vector stored in 
                                   2392 ;       address a.
                                   2393 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000D08                       2394         _HEADER ATEXE,8,"@EXECUTE"
      008D88 8D 7B                    1         .word LINK 
                           000D0A     2         LINK=.
      008D8A 08                       3         .byte 8  
      008D8B 40 45 58 45 43 55 54     4         .ascii "@EXECUTE"
             45
      008D93                          5         ATEXE:
      008D93 CD 85 63         [ 4] 2395         CALL     AT
      008D96 CD 88 4C         [ 4] 2396         CALL     QDUP    ;?address or zero
      008D99 CD 85 18         [ 4] 2397         CALL     QBRAN
      008D9C 8D A1                 2398         .word      EXE1
      008D9E CD 85 44         [ 4] 2399         CALL     EXECU   ;execute if non-zero
      008DA1 81               [ 4] 2400 EXE1:   RET     ;do nothing if zero
                                   2401 
                                   2402 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2403 ;       CMOVE   ( b1 b2 u -- )
                                   2404 ;       Copy u bytes from b1 to b2.
                                   2405 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000D22                       2406         _HEADER CMOVE,5,"CMOVE"
      008DA2 8D 8A                    1         .word LINK 
                           000D24     2         LINK=.
      008DA4 05                       3         .byte 5  
      008DA5 43 4D 4F 56 45           4         .ascii "CMOVE"
      008DAA                          5         CMOVE:
                                   2407         ;;;;  local variables ;;;;;;;
                           000005  2408         DP = 5
                           000003  2409         YTMP = 3 
                           000001  2410         CNT  = 1 
                                   2411         ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



      008DAA 89               [ 2] 2412         PUSHW X  ; R: DP  
      008DAB 52 02            [ 2] 2413         SUB SP,#2 ; R: DP YTMP 
      008DAD 90 93            [ 1] 2414         LDW Y,X 
      008DAF 90 FE            [ 2] 2415         LDW Y,(Y) ; CNT 
      008DB1 90 89            [ 2] 2416         PUSHW Y  ; R: DP YTMP CNT
      008DB3 90 93            [ 1] 2417         LDW Y,X 
      008DB5 90 EE 02         [ 2] 2418         LDW Y,(2,Y) ; b2, dest 
      008DB8 EE 04            [ 2] 2419         LDW X,(4,X) ; b1, src 
      008DBA 17 03            [ 2] 2420         LDW (YTMP,SP),Y 
      008DBC 13 03            [ 2] 2421         CPW X,(YTMP,SP) 
      008DBE 22 1A            [ 1] 2422         JRUGT CMOV2  ; src>dest 
                                   2423 ; src<dest copy from top to bottom
      008DC0 72 FB 01         [ 2] 2424         ADDW X,(CNT,SP)
      008DC3 72 F9 01         [ 2] 2425         ADDW Y,(CNT,SP)
      008DC6                       2426 CMOV1:  
      008DC6 17 03            [ 2] 2427         LDW (YTMP,SP),Y 
      008DC8 16 01            [ 2] 2428         LDW Y,(CNT,SP)
      008DCA 27 22            [ 1] 2429         JREQ CMOV3 
      008DCC 90 5A            [ 2] 2430         DECW Y 
      008DCE 17 01            [ 2] 2431         LDW (CNT,SP),Y 
      008DD0 16 03            [ 2] 2432         LDW Y,(YTMP,SP)
      008DD2 5A               [ 2] 2433         DECW X
      008DD3 F6               [ 1] 2434         LD A,(X)
      008DD4 90 5A            [ 2] 2435         DECW Y 
      008DD6 90 F7            [ 1] 2436         LD (Y),A 
      008DD8 20 EC            [ 2] 2437         JRA CMOV1
                                   2438 ; src>dest copy from bottom to top   
      008DDA                       2439 CMOV2: 
      008DDA 17 03            [ 2] 2440         LDW (YTMP,SP),Y 
      008DDC 16 01            [ 2] 2441         LDW Y,(CNT,SP)
      008DDE 27 0E            [ 1] 2442         JREQ CMOV3
      008DE0 90 5A            [ 2] 2443         DECW Y 
      008DE2 17 01            [ 2] 2444         LDW (CNT,SP),Y 
      008DE4 16 03            [ 2] 2445         LDW Y,(YTMP,SP)
      008DE6 F6               [ 1] 2446         LD A,(X)
      008DE7 5C               [ 1] 2447         INCW X 
      008DE8 90 F7            [ 1] 2448         LD (Y),A 
      008DEA 90 5C            [ 1] 2449         INCW Y 
      008DEC 20 EC            [ 2] 2450         JRA CMOV2 
      008DEE                       2451 CMOV3:
      008DEE 1E 05            [ 2] 2452         LDW X,(DP,SP)
      008DF0 1C 00 06         [ 2] 2453         ADDW X,#3*CELLL 
      008DF3 5B 06            [ 2] 2454         ADDW SP,#3*CELLL 
      008DF5 81               [ 4] 2455         RET 
                                   2456         
                                   2457 
                                   2458 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2459 ;       FILL    ( b u c -- )
                                   2460 ;       Fill u bytes of character c
                                   2461 ;       to area beginning at b.
                                   2462 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000D76                       2463         _HEADER FILL,4,"FILL"
      008DF6 8D A4                    1         .word LINK 
                           000D78     2         LINK=.
      008DF8 04                       3         .byte 4  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



      008DF9 46 49 4C 4C              4         .ascii "FILL"
      008DFD                          5         FILL:
      008DFD E6 01            [ 1] 2464         LD A,(1,X)
      008DFF 90 93            [ 1] 2465         LDW Y,X 
      008E01 1C 00 06         [ 2] 2466         ADDW X,#3*CELLL 
      008E04 89               [ 2] 2467         PUSHW X ; R: DP 
      008E05 93               [ 1] 2468         LDW X,Y 
      008E06 EE 04            [ 2] 2469         LDW X,(4,X) ; b
      008E08 90 EE 02         [ 2] 2470         LDW Y,(2,Y) ; u
      008E0B                       2471 FILL0:
      008E0B 27 06            [ 1] 2472         JREQ FILL1
      008E0D F7               [ 1] 2473         LD (X),A 
      008E0E 5C               [ 1] 2474         INCW X 
      008E0F 90 5A            [ 2] 2475         DECW Y 
      008E11 20 F8            [ 2] 2476         JRA FILL0         
      008E13 85               [ 2] 2477 FILL1: POPW X 
      008E14 81               [ 4] 2478         RET         
                                   2479         
                                   2480 
                                   2481 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2482 ;       ERASE   ( b u -- )
                                   2483 ;       Erase u bytes beginning at b.
                                   2484 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000D95                       2485         _HEADER ERASE,5,"ERASE"
      008E15 8D F8                    1         .word LINK 
                           000D97     2         LINK=.
      008E17 05                       3         .byte 5  
      008E18 45 52 41 53 45           4         .ascii "ERASE"
      008E1D                          5         ERASE:
      008E1D 90 5F            [ 1] 2486         clrw y 
      008E1F 1D 00 02         [ 2] 2487         subw x,#CELLL 
      008E22 FF               [ 2] 2488         ldw (x),y 
      008E23 CC 8D FD         [ 2] 2489         jp FILL 
                                   2490 
                                   2491 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2492 ;       PACK0   ( b u a -- a )
                                   2493 ;       Build a counted string with
                                   2494 ;       u characters from b. Null fill.
                                   2495 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000DA6                       2496         _HEADER PACKS,5,"PACK0"
      008E26 8E 17                    1         .word LINK 
                           000DA8     2         LINK=.
      008E28 05                       3         .byte 5  
      008E29 50 41 43 4B 30           4         .ascii "PACK0"
      008E2E                          5         PACKS:
      008E2E CD 86 99         [ 4] 2497         CALL     DUPP
      008E31 CD 86 62         [ 4] 2498         CALL     TOR     ;strings only on cell boundary
      008E34 CD 88 A7         [ 4] 2499         CALL     DDUP
      008E37 CD 85 70         [ 4] 2500         CALL     CSTOR
      008E3A CD 8C 17         [ 4] 2501         CALL     ONEP ;save count
      008E3D CD 86 A9         [ 4] 2502         CALL     SWAPP
      008E40 CD 8D AA         [ 4] 2503         CALL     CMOVE
      008E43 CD 85 B4         [ 4] 2504         CALL     RFROM
      008E46 81               [ 4] 2505         RET
                                   2506 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



                                   2507 ;; Numeric output, single precision
                                   2508 
                                   2509 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2510 ;       DIGIT   ( u -- c )
                                   2511 ;       Convert digit u to a character.
                                   2512 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000DC7                       2513         _HEADER DIGIT,5,"DIGIT"
      008E47 8E 28                    1         .word LINK 
                           000DC9     2         LINK=.
      008E49 05                       3         .byte 5  
      008E4A 44 49 47 49 54           4         .ascii "DIGIT"
      008E4F                          5         DIGIT:
      008E4F CD 84 EF         [ 4] 2514         CALL	DOLIT
      008E52 00 09                 2515         .word	9
      008E54 CD 86 C1         [ 4] 2516         CALL	OVER
      008E57 CD 89 A6         [ 4] 2517         CALL	LESS
      008E5A CD 84 EF         [ 4] 2518         CALL	DOLIT
      008E5D 00 07                 2519         .word	7
      008E5F CD 86 F6         [ 4] 2520         CALL	ANDD
      008E62 CD 88 BC         [ 4] 2521         CALL	PLUS
      008E65 CD 84 EF         [ 4] 2522         CALL	DOLIT
      008E68 00 30                 2523         .word	48	;'0'
      008E6A CC 88 BC         [ 2] 2524         JP	PLUS
                                   2525 
                                   2526 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2527 ;       EXTRACT ( n base -- n c )
                                   2528 ;       Extract least significant 
                                   2529 ;       digit from n.
                                   2530 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000DED                       2531         _HEADER EXTRC,7,"EXTRACT"
      008E6D 8E 49                    1         .word LINK 
                           000DEF     2         LINK=.
      008E6F 07                       3         .byte 7  
      008E70 45 58 54 52 41 43 54     4         .ascii "EXTRACT"
      008E77                          5         EXTRC:
      008E77 CD 8C 83         [ 4] 2532         CALL     ZERO
      008E7A CD 86 A9         [ 4] 2533         CALL     SWAPP
      008E7D CD 8A 31         [ 4] 2534         CALL     UMMOD
      008E80 CD 86 A9         [ 4] 2535         CALL     SWAPP
      008E83 CC 8E 4F         [ 2] 2536         JP     DIGIT
                                   2537 
                                   2538 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2539 ;       <#      ( -- )
                                   2540 ;       Initiate  numeric 
                                   2541 ;       output process.
                                   2542 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000E06                       2543         _HEADER BDIGS,2,"#<"
      008E86 8E 6F                    1         .word LINK 
                           000E08     2         LINK=.
      008E88 02                       3         .byte 2  
      008E89 23 3C                    4         .ascii "#<"
      008E8B                          5         BDIGS:
      008E8B CD 8D 6E         [ 4] 2544         CALL     PAD
      008E8E CD 87 CF         [ 4] 2545         CALL     HLD
      008E91 CC 85 51         [ 2] 2546         JP     STORE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



                                   2547 
                                   2548 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2549 ;       HOLD    ( c -- )
                                   2550 ;       Insert a character 
                                   2551 ;       into output string.
                                   2552 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000E14                       2553         _HEADER HOLD,4,"HOLD"
      008E94 8E 88                    1         .word LINK 
                           000E16     2         LINK=.
      008E96 04                       3         .byte 4  
      008E97 48 4F 4C 44              4         .ascii "HOLD"
      008E9B                          5         HOLD:
      008E9B CD 87 CF         [ 4] 2554         CALL     HLD
      008E9E CD 85 63         [ 4] 2555         CALL     AT
      008EA1 CD 8C 24         [ 4] 2556         CALL     ONEM
      008EA4 CD 86 99         [ 4] 2557         CALL     DUPP
      008EA7 CD 87 CF         [ 4] 2558         CALL     HLD
      008EAA CD 85 51         [ 4] 2559         CALL     STORE
      008EAD CC 85 70         [ 2] 2560         JP     CSTOR
                                   2561 
                                   2562 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2563 ;       #       ( u -- u )
                                   2564 ;       Extract one digit from u and
                                   2565 ;       append digit to output string.
                                   2566 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000E30                       2567         _HEADER DIG,1,"#"
      008EB0 8E 96                    1         .word LINK 
                           000E32     2         LINK=.
      008EB2 01                       3         .byte 1  
      008EB3 23                       4         .ascii "#"
      008EB4                          5         DIG:
      008EB4 CD 87 5F         [ 4] 2568         CALL     BASE
      008EB7 CD 85 63         [ 4] 2569         CALL     AT
      008EBA CD 8E 77         [ 4] 2570         CALL     EXTRC
      008EBD CC 8E 9B         [ 2] 2571         JP     HOLD
                                   2572 
                                   2573 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2574 ;       #S      ( u -- 0 )
                                   2575 ;       Convert u until all digits
                                   2576 ;       are added to output string.
                                   2577 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000E40                       2578         _HEADER DIGS,2,"#S"
      008EC0 8E B2                    1         .word LINK 
                           000E42     2         LINK=.
      008EC2 02                       3         .byte 2  
      008EC3 23 53                    4         .ascii "#S"
      008EC5                          5         DIGS:
      008EC5 CD 8E B4         [ 4] 2579 DIGS1:  CALL     DIG
      008EC8 CD 86 99         [ 4] 2580         CALL     DUPP
      008ECB CD 85 18         [ 4] 2581         CALL     QBRAN
      008ECE 8E D2                 2582         .word      DIGS2
      008ED0 20 F3            [ 2] 2583         JRA     DIGS1
      008ED2 81               [ 4] 2584 DIGS2:  RET
                                   2585 
                                   2586 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



                                   2587 ;       SIGN    ( n -- )
                                   2588 ;       Add a minus sign to
                                   2589 ;       numeric output string.
                                   2590 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000E53                       2591         _HEADER SIGN,4,"SIGN"
      008ED3 8E C2                    1         .word LINK 
                           000E55     2         LINK=.
      008ED5 04                       3         .byte 4  
      008ED6 53 49 47 4E              4         .ascii "SIGN"
      008EDA                          5         SIGN:
      008EDA CD 86 D0         [ 4] 2592         CALL     ZLESS
      008EDD CD 85 18         [ 4] 2593         CALL     QBRAN
      008EE0 8E EA                 2594         .word      SIGN1
      008EE2 CD 84 EF         [ 4] 2595         CALL     DOLIT
      008EE5 00 2D                 2596         .word      45	;"-"
      008EE7 CC 8E 9B         [ 2] 2597         JP     HOLD
      008EEA 81               [ 4] 2598 SIGN1:  RET
                                   2599 
                                   2600 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2601 ;       #>      ( w -- b u )
                                   2602 ;       Prepare output string.
                                   2603 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000E6B                       2604         _HEADER EDIGS,2,"#>"
      008EEB 8E D5                    1         .word LINK 
                           000E6D     2         LINK=.
      008EED 02                       3         .byte 2  
      008EEE 23 3E                    4         .ascii "#>"
      008EF0                          5         EDIGS:
      008EF0 CD 86 8F         [ 4] 2605         CALL     DROP
      008EF3 CD 87 CF         [ 4] 2606         CALL     HLD
      008EF6 CD 85 63         [ 4] 2607         CALL     AT
      008EF9 CD 8D 6E         [ 4] 2608         CALL     PAD
      008EFC CD 86 C1         [ 4] 2609         CALL     OVER
      008EFF CC 89 52         [ 2] 2610         JP     SUBB
                                   2611 
                                   2612 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2613 ;       str     ( w -- b u )
                                   2614 ;       Convert a signed integer
                                   2615 ;       to a numeric string.
                                   2616 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000E82                       2617         _HEADER STR,3,"STR"
      008F02 8E ED                    1         .word LINK 
                           000E84     2         LINK=.
      008F04 03                       3         .byte 3  
      008F05 53 54 52                 4         .ascii "STR"
      008F08                          5         STR:
      008F08 CD 86 99         [ 4] 2618         CALL     DUPP
      008F0B CD 86 62         [ 4] 2619         CALL     TOR
      008F0E CD 89 6C         [ 4] 2620         CALL     ABSS
      008F11 CD 8E 8B         [ 4] 2621         CALL     BDIGS
      008F14 CD 8E C5         [ 4] 2622         CALL     DIGS
      008F17 CD 85 B4         [ 4] 2623         CALL     RFROM
      008F1A CD 8E DA         [ 4] 2624         CALL     SIGN
      008F1D CC 8E F0         [ 2] 2625         JP     EDIGS
                                   2626 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



                                   2627 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2628 ;       HEX     ( -- )
                                   2629 ;       Use radix 16 as base for
                                   2630 ;       numeric conversions.
                                   2631 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000EA0                       2632         _HEADER HEX,3,"HEX"
      008F20 8F 04                    1         .word LINK 
                           000EA2     2         LINK=.
      008F22 03                       3         .byte 3  
      008F23 48 45 58                 4         .ascii "HEX"
      008F26                          5         HEX:
      008F26 CD 84 EF         [ 4] 2633         CALL     DOLIT
      008F29 00 10                 2634         .word      16
      008F2B CD 87 5F         [ 4] 2635         CALL     BASE
      008F2E CC 85 51         [ 2] 2636         JP     STORE
                                   2637 
                                   2638 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2639 ;       DECIMAL ( -- )
                                   2640 ;       Use radix 10 as base
                                   2641 ;       for numeric conversions.
                                   2642 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000EB1                       2643         _HEADER DECIM,7,"DECIMAL"
      008F31 8F 22                    1         .word LINK 
                           000EB3     2         LINK=.
      008F33 07                       3         .byte 7  
      008F34 44 45 43 49 4D 41 4C     4         .ascii "DECIMAL"
      008F3B                          5         DECIM:
      008F3B CD 84 EF         [ 4] 2644         CALL     DOLIT
      008F3E 00 0A                 2645         .word      10
      008F40 CD 87 5F         [ 4] 2646         CALL     BASE
      008F43 CC 85 51         [ 2] 2647         JP     STORE
                                   2648 
                                   2649 ;; Numeric input, single precision
                                   2650 
                                   2651 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2652 ;       DIGIT?  ( c base -- u t )
                                   2653 ;       Convert a character to its numeric
                                   2654 ;       value. A flag indicates success.
                                   2655 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000EC6                       2656         _HEADER DIGTQ,6,"DIGIT?"
      008F46 8F 33                    1         .word LINK 
                           000EC8     2         LINK=.
      008F48 06                       3         .byte 6  
      008F49 44 49 47 49 54 3F        4         .ascii "DIGIT?"
      008F4F                          5         DIGTQ:
      008F4F CD 86 62         [ 4] 2657         CALL     TOR
      008F52 CD 84 EF         [ 4] 2658         CALL     DOLIT
      008F55 00 30                 2659         .word     48	; "0"
      008F57 CD 89 52         [ 4] 2660         CALL     SUBB
      008F5A CD 84 EF         [ 4] 2661         CALL     DOLIT
      008F5D 00 09                 2662         .word      9
      008F5F CD 86 C1         [ 4] 2663         CALL     OVER
      008F62 CD 89 A6         [ 4] 2664         CALL     LESS
      008F65 CD 85 18         [ 4] 2665         CALL     QBRAN
      008F68 8F 80                 2666         .word      DGTQ1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



      008F6A CD 84 EF         [ 4] 2667         CALL     DOLIT
      008F6D 00 07                 2668         .word      7
      008F6F CD 89 52         [ 4] 2669         CALL     SUBB
      008F72 CD 86 99         [ 4] 2670         CALL     DUPP
      008F75 CD 84 EF         [ 4] 2671         CALL     DOLIT
      008F78 00 0A                 2672         .word      10
      008F7A CD 89 A6         [ 4] 2673         CALL     LESS
      008F7D CD 87 0A         [ 4] 2674         CALL     ORR
      008F80 CD 86 99         [ 4] 2675 DGTQ1:  CALL     DUPP
      008F83 CD 85 B4         [ 4] 2676         CALL     RFROM
      008F86 CC 89 90         [ 2] 2677         JP     ULESS
                                   2678 
                           000001  2679 .if  WANT_DOUBLE
                           000000  2680 .else 
                                   2681 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2682 ;       NUMBER? ( a -- n T | a F )
                                   2683 ;       Convert a number string to
                                   2684 ;       integer. Push a flag on tos.
                                   2685 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2686         _HEADER NUMBQ,7,"NUMBER?"
                                   2687         CALL     BASE
                                   2688         CALL     AT
                                   2689         CALL     TOR
                                   2690         CALL     ZERO
                                   2691         CALL     OVER
                                   2692         CALL     COUNT
                                   2693         CALL     OVER
                                   2694         CALL     CAT
                                   2695         CALL     DOLIT
                                   2696         .word     36	; "0x"
                                   2697         CALL     EQUAL
                                   2698         CALL     QBRAN
                                   2699         .word      NUMQ1
                                   2700         CALL     HEX
                                   2701         CALL     SWAPP
                                   2702         CALL     ONEP
                                   2703         CALL     SWAPP
                                   2704         CALL     ONEM
                                   2705 NUMQ1:  CALL     OVER
                                   2706         CALL     CAT
                                   2707         CALL     DOLIT
                                   2708         .word     45	; "-"
                                   2709         CALL     EQUAL
                                   2710         CALL     TOR
                                   2711         CALL     SWAPP
                                   2712         CALL     RAT
                                   2713         CALL     SUBB
                                   2714         CALL     SWAPP
                                   2715         CALL     RAT
                                   2716         CALL     PLUS
                                   2717         CALL     QDUP
                                   2718         CALL     QBRAN
                                   2719         .word      NUMQ6
                                   2720         CALL     ONEM
                                   2721         CALL     TOR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



                                   2722 NUMQ2:  CALL     DUPP
                                   2723         CALL     TOR
                                   2724         CALL     CAT
                                   2725         CALL     BASE
                                   2726         CALL     AT
                                   2727         CALL     DIGTQ
                                   2728         CALL     QBRAN
                                   2729         .word      NUMQ4
                                   2730         CALL     SWAPP
                                   2731         CALL     BASE
                                   2732         CALL     AT
                                   2733         CALL     STAR
                                   2734         CALL     PLUS
                                   2735         CALL     RFROM
                                   2736         CALL     ONEP
                                   2737         CALL     DONXT
                                   2738         .word      NUMQ2
                                   2739         CALL     RAT
                                   2740         CALL     SWAPP
                                   2741         CALL     DROP
                                   2742         CALL     QBRAN
                                   2743         .word      NUMQ3
                                   2744         CALL     NEGAT
                                   2745 NUMQ3:  CALL     SWAPP
                                   2746         JRA     NUMQ5
                                   2747 NUMQ4:  CALL     RFROM
                                   2748         CALL     RFROM
                                   2749         CALL     DDROP
                                   2750         CALL     DDROP
                                   2751         CALL     ZERO
                                   2752 NUMQ5:  CALL     DUPP
                                   2753 NUMQ6:  CALL     RFROM
                                   2754         CALL     DDROP
                                   2755         CALL     RFROM
                                   2756         CALL     BASE
                                   2757         JP     STORE
                                   2758 .endif ; WANT_DOUBLE  
                                   2759 
                                   2760 ;; Basic I/O
                                   2761 
                                   2762 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2763 ;       KEY     ( -- c )
                                   2764 ;       Wait for and return an
                                   2765 ;       input character.
                                   2766 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000F09                       2767         _HEADER KEY,3,"KEY"
      008F89 8F 48                    1         .word LINK 
                           000F0B     2         LINK=.
      008F8B 03                       3         .byte 3  
      008F8C 4B 45 59                 4         .ascii "KEY"
      008F8F                          5         KEY:
      008F8F 72 0B 52 30 FB   [ 2] 2768         btjf UART_SR,#UART_SR_RXNE,. 
      008F94 C6 52 31         [ 1] 2769         ld a,UART_DR 
      008F97 1D 00 02         [ 2] 2770         subw x,#CELLL 
      008F9A E7 01            [ 1] 2771         ld (1,x),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



      008F9C 7F               [ 1] 2772         clr (x)
      008F9D 81               [ 4] 2773         ret 
                                   2774 
                                   2775 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2776 ;       NUF?    ( -- t )
                                   2777 ;       Return false if no input,
                                   2778 ;       else pause and if CR return true.
                                   2779 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000F1E                       2780         _HEADER NUFQ,4,"NUF?"
      008F9E 8F 8B                    1         .word LINK 
                           000F20     2         LINK=.
      008FA0 04                       3         .byte 4  
      008FA1 4E 55 46 3F              4         .ascii "NUF?"
      008FA5                          5         NUFQ:
      008FA5 CD 84 98         [ 4] 2781         CALL     QKEY
      008FA8 CD 86 99         [ 4] 2782         CALL     DUPP
      008FAB CD 85 18         [ 4] 2783         CALL     QBRAN
      008FAE 8F BE                 2784         .word    NUFQ1
      008FB0 CD 88 9C         [ 4] 2785         CALL     DDROP
      008FB3 CD 8F 8F         [ 4] 2786         CALL     KEY
      008FB6 CD 84 EF         [ 4] 2787         CALL     DOLIT
      008FB9 00 0D                 2788         .word      CRR
      008FBB CC 89 7A         [ 2] 2789         JP     EQUAL
      008FBE 81               [ 4] 2790 NUFQ1:  RET
                                   2791 
                                   2792 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2793 ;       SPACE   ( -- )
                                   2794 ;       Send  blank character to
                                   2795 ;       output device.
                                   2796 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000F3F                       2797         _HEADER SPACE,5,"SPACE"
      008FBF 8F A0                    1         .word LINK 
                           000F41     2         LINK=.
      008FC1 05                       3         .byte 5  
      008FC2 53 50 41 43 45           4         .ascii "SPACE"
      008FC7                          5         SPACE:
      008FC7 CD 8C 76         [ 4] 2798         CALL     BLANK
      008FCA CC 84 B6         [ 2] 2799         JP     EMIT
                                   2800 
                                   2801 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2802 ;       SPACES  ( +n -- )
                                   2803 ;       Send n spaces to output device.
                                   2804 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000F4D                       2805         _HEADER SPACS,6,"SPACES"
      008FCD 8F C1                    1         .word LINK 
                           000F4F     2         LINK=.
      008FCF 06                       3         .byte 6  
      008FD0 53 50 41 43 45 53        4         .ascii "SPACES"
      008FD6                          5         SPACS:
      008FD6 CD 8C 83         [ 4] 2806         CALL     ZERO
      008FD9 CD 89 EB         [ 4] 2807         CALL     MAX
      008FDC CD 86 62         [ 4] 2808         CALL     TOR
      008FDF 20 03            [ 2] 2809         JRA      CHAR2
      008FE1 CD 8F C7         [ 4] 2810 CHAR1:  CALL     SPACE
      008FE4 CD 85 03         [ 4] 2811 CHAR2:  CALL     DONXT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



      008FE7 8F E1                 2812         .word    CHAR1
      008FE9 81               [ 4] 2813         RET
                                   2814 
                                   2815 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2816 ;       TYPE    ( b u -- )
                                   2817 ;       Output u characters from b.
                                   2818 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000F6A                       2819         _HEADER TYPES,4,"TYPE"
      008FEA 8F CF                    1         .word LINK 
                           000F6C     2         LINK=.
      008FEC 04                       3         .byte 4  
      008FED 54 59 50 45              4         .ascii "TYPE"
      008FF1                          5         TYPES:
      008FF1 CD 86 62         [ 4] 2820         CALL     TOR
      008FF4 20 06            [ 2] 2821         JRA     TYPE2
      008FF6 CD 8D 46         [ 4] 2822 TYPE1:  CALL     COUNT 
      008FF9 CD 84 B6         [ 4] 2823         CALL     EMIT
      000F7C                       2824 TYPE2:  _DONXT  TYPE1
      008FFC CD 85 03         [ 4]    1     CALL DONXT 
      008FFF 8F F6                    2     .word TYPE1 
      009001 CC 86 8F         [ 2] 2825         JP     DROP
                                   2826 
                                   2827 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2828 ;       CR      ( -- )
                                   2829 ;       Output a carriage return
                                   2830 ;       and a line feed.
                                   2831 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000F84                       2832         _HEADER CR,2,"CR"
      009004 8F EC                    1         .word LINK 
                           000F86     2         LINK=.
      009006 02                       3         .byte 2  
      009007 43 52                    4         .ascii "CR"
      009009                          5         CR:
      000F89                       2833         _DOLIT  CRR 
      009009 CD 84 EF         [ 4]    1     CALL DOLIT 
      00900C 00 0D                    2     .word CRR 
      00900E CD 84 B6         [ 4] 2834         CALL    EMIT
      000F91                       2835         _DOLIT  LF
      009011 CD 84 EF         [ 4]    1     CALL DOLIT 
      009014 00 0A                    2     .word LF 
      009016 CC 84 B6         [ 2] 2836         JP      EMIT
                                   2837 
                                   2838 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2839 ;       do$     ( -- a )
                                   2840 ;       Return  address of a compiled
                                   2841 ;       string.
                                   2842 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2843 ;       _HEADER DOSTR,COMPO+3,"DO$"
      009019                       2844 DOSTR:
      009019 CD 85 B4         [ 4] 2845         CALL     RFROM
      00901C CD 85 C5         [ 4] 2846         CALL     RAT
      00901F CD 85 B4         [ 4] 2847         CALL     RFROM
      009022 CD 8D 46         [ 4] 2848         CALL     COUNT
      009025 CD 88 BC         [ 4] 2849         CALL     PLUS
      009028 CD 86 62         [ 4] 2850         CALL     TOR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



      00902B CD 86 A9         [ 4] 2851         CALL     SWAPP
      00902E CD 86 62         [ 4] 2852         CALL     TOR
      009031 81               [ 4] 2853         RET
                                   2854 
                                   2855 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2856 ;       $"|     ( -- a )
                                   2857 ;       Run time routine compiled by $".
                                   2858 ;       Return address of a compiled string.
                                   2859 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2860 ;       _HEADER STRQP,COMPO+3,"$\"|"
      009032                       2861 STRQP:
      009032 CD 90 19         [ 4] 2862         CALL     DOSTR
      009035 81               [ 4] 2863         RET
                                   2864 
                                   2865 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2866 ;       ."|     ( -- )
                                   2867 ;       Run time routine of ." .
                                   2868 ;       Output a compiled string.
                                   2869 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2870 ;       _HEADER DOTQP,COMPO+3,".\"|"
      009036                       2871 DOTQP:
      009036 CD 90 19         [ 4] 2872         CALL     DOSTR
      009039 CD 8D 46         [ 4] 2873         CALL     COUNT
      00903C CC 8F F1         [ 2] 2874         JP     TYPES
                                   2875 
                                   2876 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2877 ;       .R      ( n +n -- )
                                   2878 ;       Display an integer in a field
                                   2879 ;       of n columns, right justified.
                                   2880 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000FBF                       2881         _HEADER DOTR,2,".R"
      00903F 90 06                    1         .word LINK 
                           000FC1     2         LINK=.
      009041 02                       3         .byte 2  
      009042 2E 52                    4         .ascii ".R"
      009044                          5         DOTR:
      009044 CD 86 62         [ 4] 2882         CALL     TOR
      009047 CD 8F 08         [ 4] 2883         CALL     STR
      00904A CD 85 B4         [ 4] 2884         CALL     RFROM
      00904D CD 86 C1         [ 4] 2885         CALL     OVER
      009050 CD 89 52         [ 4] 2886         CALL     SUBB
      009053 CD 8F D6         [ 4] 2887         CALL     SPACS
      009056 CC 8F F1         [ 2] 2888         JP     TYPES
                                   2889 
                                   2890 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2891 ;       U.R     ( u +n -- )
                                   2892 ;       Display an unsigned integer
                                   2893 ;       in n column, right justified.
                                   2894 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000FD9                       2895         _HEADER UDOTR,3,"U.R"
      009059 90 41                    1         .word LINK 
                           000FDB     2         LINK=.
      00905B 03                       3         .byte 3  
      00905C 55 2E 52                 4         .ascii "U.R"
      00905F                          5         UDOTR:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



      00905F CD 86 62         [ 4] 2896         CALL     TOR
      009062 CD 8E 8B         [ 4] 2897         CALL     BDIGS
      009065 CD 8E C5         [ 4] 2898         CALL     DIGS
      009068 CD 8E F0         [ 4] 2899         CALL     EDIGS
      00906B CD 85 B4         [ 4] 2900         CALL     RFROM
      00906E CD 86 C1         [ 4] 2901         CALL     OVER
      009071 CD 89 52         [ 4] 2902         CALL     SUBB
      009074 CD 8F D6         [ 4] 2903         CALL     SPACS
      009077 CC 8F F1         [ 2] 2904         JP     TYPES
                                   2905 
                                   2906 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2907 ;       U.      ( u -- )
                                   2908 ;       Display an unsigned integer
                                   2909 ;       in free format.
                                   2910 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000FFA                       2911         _HEADER UDOT,2,"U."
      00907A 90 5B                    1         .word LINK 
                           000FFC     2         LINK=.
      00907C 02                       3         .byte 2  
      00907D 55 2E                    4         .ascii "U."
      00907F                          5         UDOT:
      00907F CD 8E 8B         [ 4] 2912         CALL     BDIGS
      009082 CD 8E C5         [ 4] 2913         CALL     DIGS
      009085 CD 8E F0         [ 4] 2914         CALL     EDIGS
      009088 CD 8F C7         [ 4] 2915         CALL     SPACE
      00908B CC 8F F1         [ 2] 2916         JP     TYPES
                                   2917 
                                   2918 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2919 ;   H. ( n -- )
                                   2920 ;   display n in hexadecimal 
                                   2921 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00100E                       2922         _HEADER HDOT,2,"H."
      00908E 90 7C                    1         .word LINK 
                           001010     2         LINK=.
      009090 02                       3         .byte 2  
      009091 48 2E                    4         .ascii "H."
      009093                          5         HDOT:
      009093 CD 87 5F         [ 4] 2923         CALL BASE 
      009096 CD 85 63         [ 4] 2924         CALL AT 
      009099 CD 86 62         [ 4] 2925         CALL TOR 
      00909C CD 8F 26         [ 4] 2926         CALL HEX 
      00909F CD 90 7F         [ 4] 2927         CALL UDOT 
      0090A2 CD 85 B4         [ 4] 2928         CALL RFROM 
      0090A5 CD 87 5F         [ 4] 2929         CALL BASE 
      0090A8 CD 85 51         [ 4] 2930         CALL STORE 
      0090AB 81               [ 4] 2931         RET 
                                   2932 
                                   2933 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2934 ;       .       ( w -- )
                                   2935 ;       Display an integer in free
                                   2936 ;       format, preceeded by a space.
                                   2937 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00102C                       2938         _HEADER DOT,1,"."
      0090AC 90 90                    1         .word LINK 
                           00102E     2         LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



      0090AE 01                       3         .byte 1  
      0090AF 2E                       4         .ascii "."
      0090B0                          5         DOT:
      0090B0 CD 87 5F         [ 4] 2939         CALL     BASE
      0090B3 CD 85 63         [ 4] 2940         CALL     AT
      0090B6 CD 84 EF         [ 4] 2941         CALL     DOLIT
      0090B9 00 0A                 2942         .word      10
      0090BB CD 87 1F         [ 4] 2943         CALL     XORR    ;?decimal
      0090BE CD 85 18         [ 4] 2944         CALL     QBRAN
      0090C1 90 C6                 2945         .word      DOT1
      0090C3 CC 90 7F         [ 2] 2946         JP     UDOT
      0090C6 CD 8F 08         [ 4] 2947 DOT1:   CALL     STR
      0090C9 CD 8F C7         [ 4] 2948         CALL     SPACE
      0090CC CC 8F F1         [ 2] 2949         JP     TYPES
                                   2950 
                                   2951 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2952 ;       ?       ( a -- )
                                   2953 ;       Display contents in memory cell.
                                   2954 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00104F                       2955         _HEADER QUEST,1,"?"
      0090CF 90 AE                    1         .word LINK 
                           001051     2         LINK=.
      0090D1 01                       3         .byte 1  
      0090D2 3F                       4         .ascii "?"
      0090D3                          5         QUEST:
      0090D3 CD 85 63         [ 4] 2956         CALL     AT
      0090D6 CC 90 B0         [ 2] 2957         JP     DOT
                                   2958 
                                   2959 ;; Parsing
                                   2960 
                                   2961 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2962 ;       parse   ( b u c -- b u delta ; <string> )
                                   2963 ;       Scan string delimited by c.
                                   2964 ;       Return found string and its offset.
                                   2965 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001059                       2966         _HEADER PARS,5,"PARS$"
      0090D9 90 D1                    1         .word LINK 
                           00105B     2         LINK=.
      0090DB 05                       3         .byte 5  
      0090DC 50 41 52 53 24           4         .ascii "PARS$"
      0090E1                          5         PARS:
      0090E1 CD 87 6E         [ 4] 2967         CALL     TEMP
      0090E4 CD 85 51         [ 4] 2968         CALL     STORE
      0090E7 CD 86 C1         [ 4] 2969         CALL     OVER
      0090EA CD 86 62         [ 4] 2970         CALL     TOR
      0090ED CD 86 99         [ 4] 2971         CALL     DUPP
      0090F0 CD 85 18         [ 4] 2972         CALL     QBRAN
      0090F3 91 99                 2973         .word    PARS8
      0090F5 CD 8C 24         [ 4] 2974         CALL     ONEM
      0090F8 CD 87 6E         [ 4] 2975         CALL     TEMP
      0090FB CD 85 63         [ 4] 2976         CALL     AT
      0090FE CD 8C 76         [ 4] 2977         CALL     BLANK
      009101 CD 89 7A         [ 4] 2978         CALL     EQUAL
      009104 CD 85 18         [ 4] 2979         CALL     QBRAN
      009107 91 3A                 2980         .word      PARS3
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



      009109 CD 86 62         [ 4] 2981         CALL     TOR
      00910C CD 8C 76         [ 4] 2982 PARS1:  CALL     BLANK
      00910F CD 86 C1         [ 4] 2983         CALL     OVER
      009112 CD 85 81         [ 4] 2984         CALL     CAT     ;skip leading blanks ONLY
      009115 CD 89 52         [ 4] 2985         CALL     SUBB
      009118 CD 86 D0         [ 4] 2986         CALL     ZLESS
      00911B CD 88 F5         [ 4] 2987         CALL     INVER
      00911E CD 85 18         [ 4] 2988         CALL     QBRAN
      009121 91 37                 2989         .word      PARS2
      009123 CD 8C 17         [ 4] 2990         CALL     ONEP
      009126 CD 85 03         [ 4] 2991         CALL     DONXT
      009129 91 0C                 2992         .word      PARS1
      00912B CD 85 B4         [ 4] 2993         CALL     RFROM
      00912E CD 86 8F         [ 4] 2994         CALL     DROP
      009131 CD 8C 83         [ 4] 2995         CALL     ZERO
      009134 CC 86 99         [ 2] 2996         JP     DUPP
      009137 CD 85 B4         [ 4] 2997 PARS2:  CALL     RFROM
      00913A CD 86 C1         [ 4] 2998 PARS3:  CALL     OVER
      00913D CD 86 A9         [ 4] 2999         CALL     SWAPP
      009140 CD 86 62         [ 4] 3000         CALL     TOR
      009143 CD 87 6E         [ 4] 3001 PARS4:  CALL     TEMP
      009146 CD 85 63         [ 4] 3002         CALL     AT
      009149 CD 86 C1         [ 4] 3003         CALL     OVER
      00914C CD 85 81         [ 4] 3004         CALL     CAT
      00914F CD 89 52         [ 4] 3005         CALL     SUBB    ;scan for delimiter
      009152 CD 87 6E         [ 4] 3006         CALL     TEMP
      009155 CD 85 63         [ 4] 3007         CALL     AT
      009158 CD 8C 76         [ 4] 3008         CALL     BLANK
      00915B CD 89 7A         [ 4] 3009         CALL     EQUAL
      00915E CD 85 18         [ 4] 3010         CALL     QBRAN
      009161 91 66                 3011         .word      PARS5
      009163 CD 86 D0         [ 4] 3012         CALL     ZLESS
      009166 CD 85 18         [ 4] 3013 PARS5:  CALL     QBRAN
      009169 91 7B                 3014         .word      PARS6
      00916B CD 8C 17         [ 4] 3015         CALL     ONEP
      00916E CD 85 03         [ 4] 3016         CALL     DONXT
      009171 91 43                 3017         .word      PARS4
      009173 CD 86 99         [ 4] 3018         CALL     DUPP
      009176 CD 86 62         [ 4] 3019         CALL     TOR
      009179 20 0F            [ 2] 3020         JRA     PARS7
      00917B CD 85 B4         [ 4] 3021 PARS6:  CALL     RFROM
      00917E CD 86 8F         [ 4] 3022         CALL     DROP
      009181 CD 86 99         [ 4] 3023         CALL     DUPP
      009184 CD 8C 17         [ 4] 3024         CALL     ONEP
      009187 CD 86 62         [ 4] 3025         CALL     TOR
      00918A CD 86 C1         [ 4] 3026 PARS7:  CALL     OVER
      00918D CD 89 52         [ 4] 3027         CALL     SUBB
      009190 CD 85 B4         [ 4] 3028         CALL     RFROM
      009193 CD 85 B4         [ 4] 3029         CALL     RFROM
      009196 CC 89 52         [ 2] 3030         JP     SUBB
      009199 CD 86 C1         [ 4] 3031 PARS8:  CALL     OVER
      00919C CD 85 B4         [ 4] 3032         CALL     RFROM
      00919F CC 89 52         [ 2] 3033         JP     SUBB
                                   3034 
                                   3035 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



                                   3036 ;       PARSE   ( c -- b u ; <string> )
                                   3037 ;       Scan input stream and return
                                   3038 ;       counted string delimited by c.
                                   3039 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001122                       3040         _HEADER PARSE,5,"PARSE"
      0091A2 90 DB                    1         .word LINK 
                           001124     2         LINK=.
      0091A4 05                       3         .byte 5  
      0091A5 50 41 52 53 45           4         .ascii "PARSE"
      0091AA                          5         PARSE:
      0091AA CD 86 62         [ 4] 3041         CALL     TOR
      0091AD CD 8D 7F         [ 4] 3042         CALL     TIB
      0091B0 CD 87 7D         [ 4] 3043         CALL     INN
      0091B3 CD 85 63         [ 4] 3044         CALL     AT
      0091B6 CD 88 BC         [ 4] 3045         CALL     PLUS    ;current input buffer pointer
      0091B9 CD 87 8D         [ 4] 3046         CALL     NTIB
      0091BC CD 85 63         [ 4] 3047         CALL     AT
      0091BF CD 87 7D         [ 4] 3048         CALL     INN
      0091C2 CD 85 63         [ 4] 3049         CALL     AT
      0091C5 CD 89 52         [ 4] 3050         CALL     SUBB    ;remaining count
      0091C8 CD 85 B4         [ 4] 3051         CALL     RFROM
      0091CB CD 90 E1         [ 4] 3052         CALL     PARS
      0091CE CD 87 7D         [ 4] 3053         CALL     INN
      0091D1 CC 8C F3         [ 2] 3054         JP     PSTOR
                                   3055 
                                   3056 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3057 ;       .(      ( -- )
                                   3058 ;       Output following string up to next ) .
                                   3059 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001154                       3060         _HEADER DOTPR,IMEDD+2,".("
      0091D4 91 A4                    1         .word LINK 
                           001156     2         LINK=.
      0091D6 82                       3         .byte IMEDD+2  
      0091D7 2E 28                    4         .ascii ".("
      0091D9                          5         DOTPR:
      0091D9 CD 84 EF         [ 4] 3061         CALL     DOLIT
      0091DC 00 29                 3062         .word     41	; ")"
      0091DE CD 91 AA         [ 4] 3063         CALL     PARSE
      0091E1 CC 8F F1         [ 2] 3064         JP     TYPES
                                   3065 
                                   3066 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3067 ;       (       ( -- )
                                   3068 ;       Ignore following string up to next ).
                                   3069 ;       A comment.
                                   3070 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001164                       3071         _HEADER PAREN,IMEDD+1,"("
      0091E4 91 D6                    1         .word LINK 
                           001166     2         LINK=.
      0091E6 81                       3         .byte IMEDD+1  
      0091E7 28                       4         .ascii "("
      0091E8                          5         PAREN:
      0091E8 CD 84 EF         [ 4] 3072         CALL     DOLIT
      0091EB 00 29                 3073         .word     41	; ")"
      0091ED CD 91 AA         [ 4] 3074         CALL     PARSE
      0091F0 CC 88 9C         [ 2] 3075         JP     DDROP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



                                   3076 
                                   3077 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3078 ;       \       ( -- )
                                   3079 ;       Ignore following text till
                                   3080 ;       end of line.
                                   3081 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001173                       3082         _HEADER BKSLA,IMEDD+1,"\\"
      0091F3 91 E6                    1         .word LINK 
                           001175     2         LINK=.
      0091F5 81                       3         .byte IMEDD+1  
      0091F6 5C 5C                    4         .ascii "\\"
      0091F8                          5         BKSLA:
      0091F8 90 AE 00 0E      [ 2] 3083         ldw y,#UCTIB ; #TIB  
      0091FC 90 FE            [ 2] 3084         ldw y,(y)
      0091FE 90 89            [ 2] 3085         pushw y ; count in TIB 
      009200 90 AE 00 0C      [ 2] 3086         ldw y,#UINN ; >IN 
      009204 90 BF 26         [ 2] 3087         ldw YTEMP,y
      009207 90 85            [ 2] 3088         popw y 
      009209 91 CF 26         [ 5] 3089         ldw [YTEMP],y
      00920C 81               [ 4] 3090         ret 
                                   3091 
                                   3092 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3093 ;       WORD    ( c -- a ; <string> )
                                   3094 ;       Parse a word from input stream
                                   3095 ;       and copy it to code dictionary.
                                   3096 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00118D                       3097         _HEADER WORDD,4,"WORD"
      00920D 91 F5                    1         .word LINK 
                           00118F     2         LINK=.
      00920F 04                       3         .byte 4  
      009210 57 4F 52 44              4         .ascii "WORD"
      009214                          5         WORDD:
      009214 CD 91 AA         [ 4] 3098         CALL     PARSE
      009217 CD 8D 5D         [ 4] 3099         CALL     HERE
      00921A CD 8B EC         [ 4] 3100         CALL     CELLP
                           000000  3101 .IF CASE_SENSE 
                                   3102         JP      PACKS 
                           000001  3103 .ELSE                 
      00921D CD 8E 2E         [ 4] 3104         CALL     PACKS
                                   3105 ; uppercase TOKEN 
      009220 CD 86 99         [ 4] 3106         CALL    DUPP 
      009223 CD 8D 46         [ 4] 3107         CALL    COUNT 
      009226 CD 86 62         [ 4] 3108         CALL    TOR 
      009229 CD 85 34         [ 4] 3109         CALL    BRAN 
      00922C 92 5A                 3110         .word   UPPER2  
      00922E                       3111 UPPER:
      00922E CD 86 99         [ 4] 3112         CALL    DUPP 
      009231 CD 85 81         [ 4] 3113         CALL    CAT
      009234 CD 86 99         [ 4] 3114         CALL    DUPP 
      009237 CD 84 EF         [ 4] 3115         CALL   DOLIT
      00923A 00 61                 3116         .word   'a' 
      00923C CD 84 EF         [ 4] 3117         CALL    DOLIT
      00923F 00 7B                 3118         .word   'z'+1 
      009241 CD 8A 16         [ 4] 3119         CALL   WITHI 
      009244 CD 85 18         [ 4] 3120         CALL   QBRAN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



      009247 92 51                 3121         .word  UPPER1  
      009249 CD 84 EF         [ 4] 3122         CALL    DOLIT 
      00924C 00 DF                 3123         .word   0xDF 
      00924E CD 86 F6         [ 4] 3124         CALL    ANDD 
      009251                       3125 UPPER1:
      009251 CD 86 C1         [ 4] 3126         CALL    OVER 
      009254 CD 85 70         [ 4] 3127         CALL    CSTOR          
      009257 CD 8C 17         [ 4] 3128         CALL    ONEP 
      00925A                       3129 UPPER2: 
      00925A CD 85 03         [ 4] 3130         CALL    DONXT
      00925D 92 2E                 3131         .word   UPPER  
      00925F CD 86 8F         [ 4] 3132         CALL    DROP  
      009262 81               [ 4] 3133         RET 
                                   3134 .ENDIF 
                                   3135 
                                   3136 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3137 ;       TOKEN   ( -- a ; <string> )
                                   3138 ;       Parse a word from input stream
                                   3139 ;       and copy it to name dictionary.
                                   3140 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0011E3                       3141         _HEADER TOKEN,5,"TOKEN"
      009263 92 0F                    1         .word LINK 
                           0011E5     2         LINK=.
      009265 05                       3         .byte 5  
      009266 54 4F 4B 45 4E           4         .ascii "TOKEN"
      00926B                          5         TOKEN:
      00926B CD 8C 76         [ 4] 3142         CALL     BLANK
      00926E CC 92 14         [ 2] 3143         JP     WORDD
                                   3144 
                                   3145 ;; Dictionary search
                                   3146 
                                   3147 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3148 ;       NAME>   ( na -- ca )
                                   3149 ;       Return a code address given
                                   3150 ;       a name address.
                                   3151 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0011F1                       3152         _HEADER NAMET,5,"NAME>"
      009271 92 65                    1         .word LINK 
                           0011F3     2         LINK=.
      009273 05                       3         .byte 5  
      009274 4E 41 4D 45 3E           4         .ascii "NAME>"
      009279                          5         NAMET:
      009279 CD 8D 46         [ 4] 3153         CALL     COUNT
      00927C CD 84 EF         [ 4] 3154         CALL     DOLIT
      00927F 00 1F                 3155         .word      31
      009281 CD 86 F6         [ 4] 3156         CALL     ANDD
      009284 CC 88 BC         [ 2] 3157         JP     PLUS
                                   3158 
                                   3159 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3160 ;       SAME?   ( a a u -- a a f \ -0+ )
                                   3161 ;       Compare u cells in two
                                   3162 ;       strings. Return 0 if identical.
                                   3163 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001207                       3164         _HEADER SAMEQ,5,"SAME?"
      009287 92 73                    1         .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



                           001209     2         LINK=.
      009289 05                       3         .byte 5  
      00928A 53 41 4D 45 3F           4         .ascii "SAME?"
      00928F                          5         SAMEQ:
      00928F CD 8C 24         [ 4] 3165         CALL     ONEM
      009292 CD 86 62         [ 4] 3166         CALL     TOR
      009295 20 29            [ 2] 3167         JRA     SAME2
      009297 CD 86 C1         [ 4] 3168 SAME1:  CALL     OVER
      00929A CD 85 C5         [ 4] 3169         CALL     RAT
      00929D CD 88 BC         [ 4] 3170         CALL     PLUS
      0092A0 CD 85 81         [ 4] 3171         CALL     CAT
      0092A3 CD 86 C1         [ 4] 3172         CALL     OVER
      0092A6 CD 85 C5         [ 4] 3173         CALL     RAT
      0092A9 CD 88 BC         [ 4] 3174         CALL     PLUS
      0092AC CD 85 81         [ 4] 3175         CALL     CAT
      0092AF CD 89 52         [ 4] 3176         CALL     SUBB
      0092B2 CD 88 4C         [ 4] 3177         CALL     QDUP
      0092B5 CD 85 18         [ 4] 3178         CALL     QBRAN
      0092B8 92 C0                 3179         .word      SAME2
      0092BA CD 85 B4         [ 4] 3180         CALL     RFROM
      0092BD CC 86 8F         [ 2] 3181         JP     DROP
      0092C0 CD 85 03         [ 4] 3182 SAME2:  CALL     DONXT
      0092C3 92 97                 3183         .word      SAME1
      0092C5 CC 8C 83         [ 2] 3184         JP     ZERO
                                   3185 
                                   3186 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3187 ;       find    ( a va -- ca na | a F )
                                   3188 ;       Search vocabulary for string.
                                   3189 ;       Return ca and na if succeeded.
                                   3190 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001248                       3191         _HEADER FIND,4,"FIND"
      0092C8 92 89                    1         .word LINK 
                           00124A     2         LINK=.
      0092CA 04                       3         .byte 4  
      0092CB 46 49 4E 44              4         .ascii "FIND"
      0092CF                          5         FIND:
      0092CF CD 86 A9         [ 4] 3192         CALL     SWAPP
      0092D2 CD 86 99         [ 4] 3193         CALL     DUPP
      0092D5 CD 85 81         [ 4] 3194         CALL     CAT
      0092D8 CD 87 6E         [ 4] 3195         CALL     TEMP
      0092DB CD 85 51         [ 4] 3196         CALL     STORE
      0092DE CD 86 99         [ 4] 3197         CALL     DUPP
      0092E1 CD 85 63         [ 4] 3198         CALL     AT
      0092E4 CD 86 62         [ 4] 3199         CALL     TOR
      0092E7 CD 8B EC         [ 4] 3200         CALL     CELLP
      0092EA CD 86 A9         [ 4] 3201         CALL     SWAPP
      0092ED CD 85 63         [ 4] 3202 FIND1:  CALL     AT
      0092F0 CD 86 99         [ 4] 3203         CALL     DUPP
      0092F3 CD 85 18         [ 4] 3204         CALL     QBRAN
      0092F6 93 2C                 3205         .word      FIND6
      0092F8 CD 86 99         [ 4] 3206         CALL     DUPP
      0092FB CD 85 63         [ 4] 3207         CALL     AT
      0092FE CD 84 EF         [ 4] 3208         CALL     DOLIT
      009301 1F 7F                 3209         .word      MASKK
      009303 CD 86 F6         [ 4] 3210         CALL     ANDD
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



      009306 CD 85 C5         [ 4] 3211         CALL     RAT
      009309 CD 87 1F         [ 4] 3212         CALL     XORR
      00930C CD 85 18         [ 4] 3213         CALL     QBRAN
      00930F 93 1B                 3214         .word      FIND2
      009311 CD 8B EC         [ 4] 3215         CALL     CELLP
      009314 CD 84 EF         [ 4] 3216         CALL     DOLIT
      009317 FF FF                 3217         .word     0xFFFF
      009319 20 0C            [ 2] 3218         JRA     FIND3
      00931B CD 8B EC         [ 4] 3219 FIND2:  CALL     CELLP
      00931E CD 87 6E         [ 4] 3220         CALL     TEMP
      009321 CD 85 63         [ 4] 3221         CALL     AT
      009324 CD 92 8F         [ 4] 3222         CALL     SAMEQ
      009327 CD 85 34         [ 4] 3223 FIND3:  CALL     BRAN
      00932A 93 3B                 3224         .word      FIND4
      00932C CD 85 B4         [ 4] 3225 FIND6:  CALL     RFROM
      00932F CD 86 8F         [ 4] 3226         CALL     DROP
      009332 CD 86 A9         [ 4] 3227         CALL     SWAPP
      009335 CD 8B FB         [ 4] 3228         CALL     CELLM
      009338 CC 86 A9         [ 2] 3229         JP     SWAPP
      00933B CD 85 18         [ 4] 3230 FIND4:  CALL     QBRAN
      00933E 93 48                 3231         .word      FIND5
      009340 CD 8B FB         [ 4] 3232         CALL     CELLM
      009343 CD 8B FB         [ 4] 3233         CALL     CELLM
      009346 20 A5            [ 2] 3234         JRA     FIND1
      009348 CD 85 B4         [ 4] 3235 FIND5:  CALL     RFROM
      00934B CD 86 8F         [ 4] 3236         CALL     DROP
      00934E CD 86 A9         [ 4] 3237         CALL     SWAPP
      009351 CD 86 8F         [ 4] 3238         CALL     DROP
      009354 CD 8B FB         [ 4] 3239         CALL     CELLM
      009357 CD 86 99         [ 4] 3240         CALL     DUPP
      00935A CD 92 79         [ 4] 3241         CALL     NAMET
      00935D CC 86 A9         [ 2] 3242         JP     SWAPP
                                   3243 
                                   3244 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3245 ;       NAME?   ( a -- ca na | a F )
                                   3246 ;       Search vocabularies for a string.
                                   3247 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0012E0                       3248         _HEADER NAMEQ,5,"NAME?"
      009360 92 CA                    1         .word LINK 
                           0012E2     2         LINK=.
      009362 05                       3         .byte 5  
      009363 4E 41 4D 45 3F           4         .ascii "NAME?"
      009368                          5         NAMEQ:
      009368 CD 87 E2         [ 4] 3249         CALL   CNTXT
      00936B CC 92 CF         [ 2] 3250         JP     FIND
                                   3251 
                                   3252 ;; Terminal response
                                   3253 
                                   3254 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3255 ;       ^H      ( bot eot cur -- bot eot cur )
                                   3256 ;       Backup cursor by one character.
                                   3257 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0012EE                       3258         _HEADER BKSP,2,"^H"
      00936E 93 62                    1         .word LINK 
                           0012F0     2         LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



      009370 02                       3         .byte 2  
      009371 5E 48                    4         .ascii "^H"
      009373                          5         BKSP:
      009373 CD 86 62         [ 4] 3259         CALL     TOR
      009376 CD 86 C1         [ 4] 3260         CALL     OVER
      009379 CD 85 B4         [ 4] 3261         CALL     RFROM
      00937C CD 86 A9         [ 4] 3262         CALL     SWAPP
      00937F CD 86 C1         [ 4] 3263         CALL     OVER
      009382 CD 87 1F         [ 4] 3264         CALL     XORR
      009385 CD 85 18         [ 4] 3265         CALL     QBRAN
      009388 93 A3                 3266         .word      BACK1
      00938A CD 84 EF         [ 4] 3267         CALL     DOLIT
      00938D 00 08                 3268         .word      BKSPP
      00938F CD 84 B6         [ 4] 3269         CALL     EMIT
      009392 CD 8C 24         [ 4] 3270         CALL     ONEM
      009395 CD 8C 76         [ 4] 3271         CALL     BLANK
      009398 CD 84 B6         [ 4] 3272         CALL     EMIT
      00939B CD 84 EF         [ 4] 3273         CALL     DOLIT
      00939E 00 08                 3274         .word      BKSPP
      0093A0 CC 84 B6         [ 2] 3275         JP     EMIT
      0093A3 81               [ 4] 3276 BACK1:  RET
                                   3277 
                                   3278 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3279 ;       TAP    ( bot eot cur c -- bot eot cur )
                                   3280 ;       Accept and echo key stroke
                                   3281 ;       and bump cursor.
                                   3282 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001324                       3283         _HEADER TAP,3,"TAP"
      0093A4 93 70                    1         .word LINK 
                           001326     2         LINK=.
      0093A6 03                       3         .byte 3  
      0093A7 54 41 50                 4         .ascii "TAP"
      0093AA                          5         TAP:
      0093AA CD 86 99         [ 4] 3284         CALL     DUPP
      0093AD CD 84 B6         [ 4] 3285         CALL     EMIT
      0093B0 CD 86 C1         [ 4] 3286         CALL     OVER
      0093B3 CD 85 70         [ 4] 3287         CALL     CSTOR
      0093B6 CC 8C 17         [ 2] 3288         JP     ONEP
                                   3289 
                                   3290 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3291 ;       kTAP    ( bot eot cur c -- bot eot cur )
                                   3292 ;       Process a key stroke,
                                   3293 ;       CR,LF or backspace.
                                   3294 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001339                       3295         _HEADER KTAP,4,"KTAP"
      0093B9 93 A6                    1         .word LINK 
                           00133B     2         LINK=.
      0093BB 04                       3         .byte 4  
      0093BC 4B 54 41 50              4         .ascii "KTAP"
      0093C0                          5         KTAP:
      0093C0 CD 86 99         [ 4] 3296         CALL     DUPP
      0093C3 CD 84 EF         [ 4] 3297         CALL     DOLIT
                           000001  3298 .if EOL_CR
      0093C6 00 0D                 3299         .word   CRR
                           000000  3300 .else ; EOL_LF 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



                                   3301         .word   LF
                                   3302 .endif 
      0093C8 CD 87 1F         [ 4] 3303         CALL     XORR
      0093CB CD 85 18         [ 4] 3304         CALL     QBRAN
      0093CE 93 E6                 3305         .word      KTAP2
      0093D0 CD 84 EF         [ 4] 3306         CALL     DOLIT
      0093D3 00 08                 3307         .word      BKSPP
      0093D5 CD 87 1F         [ 4] 3308         CALL     XORR
      0093D8 CD 85 18         [ 4] 3309         CALL     QBRAN
      0093DB 93 E3                 3310         .word      KTAP1
      0093DD CD 8C 76         [ 4] 3311         CALL     BLANK
      0093E0 CC 93 AA         [ 2] 3312         JP     TAP
      0093E3 CC 93 73         [ 2] 3313 KTAP1:  JP     BKSP
      0093E6 CD 86 8F         [ 4] 3314 KTAP2:  CALL     DROP
      0093E9 CD 86 A9         [ 4] 3315         CALL     SWAPP
      0093EC CD 86 8F         [ 4] 3316         CALL     DROP
      0093EF CC 86 99         [ 2] 3317         JP     DUPP
                                   3318 
                                   3319 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3320 ;       accept  ( b u -- b u )
                                   3321 ;       Accept characters to input
                                   3322 ;       buffer. Return with actual count.
                                   3323 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001372                       3324         _HEADER ACCEP,6,"ACCEPT"
      0093F2 93 BB                    1         .word LINK 
                           001374     2         LINK=.
      0093F4 06                       3         .byte 6  
      0093F5 41 43 43 45 50 54        4         .ascii "ACCEPT"
      0093FB                          5         ACCEP:
      0093FB CD 86 C1         [ 4] 3325         CALL     OVER
      0093FE CD 88 BC         [ 4] 3326         CALL     PLUS
      009401 CD 86 C1         [ 4] 3327         CALL     OVER
      009404 CD 88 A7         [ 4] 3328 ACCP1:  CALL     DDUP
      009407 CD 87 1F         [ 4] 3329         CALL     XORR
      00940A CD 85 18         [ 4] 3330         CALL     QBRAN
      00940D 94 2F                 3331         .word      ACCP4
      00940F CD 8F 8F         [ 4] 3332         CALL     KEY
      009412 CD 86 99         [ 4] 3333         CALL     DUPP
      009415 CD 8C 76         [ 4] 3334         CALL     BLANK
      009418 CD 84 EF         [ 4] 3335         CALL     DOLIT
      00941B 00 7F                 3336         .word      127
      00941D CD 8A 16         [ 4] 3337         CALL     WITHI
      009420 CD 85 18         [ 4] 3338         CALL     QBRAN
      009423 94 2A                 3339         .word      ACCP2
      009425 CD 93 AA         [ 4] 3340         CALL     TAP
      009428 20 03            [ 2] 3341         JRA     ACCP3
      00942A CD 93 C0         [ 4] 3342 ACCP2:  CALL     KTAP
      00942D 20 D5            [ 2] 3343 ACCP3:  JRA     ACCP1
      00942F CD 86 8F         [ 4] 3344 ACCP4:  CALL     DROP
      009432 CD 86 C1         [ 4] 3345         CALL     OVER
      009435 CC 89 52         [ 2] 3346         JP     SUBB
                                   3347 
                                   3348 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3349 ;       QUERY   ( -- )
                                   3350 ;       Accept input stream to
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



                                   3351 ;       terminal input buffer.
                                   3352 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0013B8                       3353         _HEADER QUERY,5,"QUERY"
      009438 93 F4                    1         .word LINK 
                           0013BA     2         LINK=.
      00943A 05                       3         .byte 5  
      00943B 51 55 45 52 59           4         .ascii "QUERY"
      009440                          5         QUERY:
      009440 CD 8D 7F         [ 4] 3354         CALL     TIB
      009443 CD 84 EF         [ 4] 3355         CALL     DOLIT
      009446 00 50                 3356         .word      80
      009448 CD 93 FB         [ 4] 3357         CALL     ACCEP
      00944B CD 87 8D         [ 4] 3358         CALL     NTIB
      00944E CD 85 51         [ 4] 3359         CALL     STORE
      009451 CD 86 8F         [ 4] 3360         CALL     DROP
      009454 CD 8C 83         [ 4] 3361         CALL     ZERO
      009457 CD 87 7D         [ 4] 3362         CALL     INN
      00945A CC 85 51         [ 2] 3363         JP     STORE
                                   3364 
                                   3365 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3366 ;       ABORT   ( -- )
                                   3367 ;       Reset data stack and
                                   3368 ;       jump to QUIT.
                                   3369 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0013DD                       3370         _HEADER ABORT,5,"ABORT"
      00945D 94 3A                    1         .word LINK 
                           0013DF     2         LINK=.
      00945F 05                       3         .byte 5  
      009460 41 42 4F 52 54           4         .ascii "ABORT"
      009465                          5         ABORT:
      009465 CD 95 5C         [ 4] 3371         CALL     PRESE
      009468 CC 95 79         [ 2] 3372         JP     QUIT
                                   3373 
                                   3374 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3375 ;       abort"  ( f -- )
                                   3376 ;       Run time routine of ABORT".
                                   3377 ;       Abort with a message.
                                   3378 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0013EB                       3379         _HEADER ABORQ,COMPO+6,'ABORT"'
      00946B 94 5F                    1         .word LINK 
                           0013ED     2         LINK=.
      00946D 46                       3         .byte COMPO+6  
      00946E 41 42 4F 52 54 22        4         .ascii 'ABORT"'
      009474                          5         ABORQ:
      009474 CD 85 18         [ 4] 3380         CALL     QBRAN
      009477 94 93                 3381         .word      ABOR2   ;text flag
      009479 CD 90 19         [ 4] 3382         CALL     DOSTR
      00947C CD 8F C7         [ 4] 3383 ABOR1:  CALL     SPACE
      00947F CD 8D 46         [ 4] 3384         CALL     COUNT
      009482 CD 8F F1         [ 4] 3385         CALL     TYPES
      009485 CD 84 EF         [ 4] 3386         CALL     DOLIT
      009488 00 3F                 3387         .word     63 ; "?"
      00948A CD 84 B6         [ 4] 3388         CALL     EMIT
      00948D CD 90 09         [ 4] 3389         CALL     CR
      009490 CC 94 65         [ 2] 3390         JP     ABORT   ;pass error string
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



      009493 CD 90 19         [ 4] 3391 ABOR2:  CALL     DOSTR
      009496 CC 86 8F         [ 2] 3392         JP     DROP
                                   3393 
                                   3394 ;; The text interpreter
                                   3395 
                                   3396 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3397 ;       $INTERPRET      ( a -- )
                                   3398 ;       Interpret a word. If failed,
                                   3399 ;       try to convert it to an integer.
                                   3400 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001419                       3401         _HEADER INTER,10,"$INTERPRET"
      009499 94 6D                    1         .word LINK 
                           00141B     2         LINK=.
      00949B 0A                       3         .byte 10  
      00949C 24 49 4E 54 45 52 50     4         .ascii "$INTERPRET"
             52 45 54
      0094A6                          5         INTER:
      0094A6 CD 93 68         [ 4] 3402         CALL     NAMEQ
      0094A9 CD 88 4C         [ 4] 3403         CALL     QDUP    ;?defined
      0094AC CD 85 18         [ 4] 3404         CALL     QBRAN
      0094AF 94 D0                 3405         .word      INTE1
      0094B1 CD 85 63         [ 4] 3406         CALL     AT
      0094B4 CD 84 EF         [ 4] 3407         CALL     DOLIT
      0094B7 40 00                 3408 	.word       0x4000	; COMPO*256
      0094B9 CD 86 F6         [ 4] 3409         CALL     ANDD    ;?compile only lexicon bits
      0094BC CD 94 74         [ 4] 3410         CALL     ABORQ
      0094BF 0D                    3411         .byte      13
      0094C0 20 63 6F 6D 70 69 6C  3412         .ascii     " compile only"
             65 20 6F 6E 6C 79
      0094CD CC 85 44         [ 2] 3413         JP     EXECU
      0094D0 CD A6 53         [ 4] 3414 INTE1:  CALL     NUMBQ   ;convert a number
      0094D3 CD 85 18         [ 4] 3415         CALL     QBRAN
      0094D6 94 7C                 3416         .word    ABOR1
      0094D8 81               [ 4] 3417         RET
                                   3418 
                                   3419 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3420 ;       [       ( -- )
                                   3421 ;       Start  text interpreter.
                                   3422 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001459                       3423         _HEADER LBRAC,IMEDD+1,"["
      0094D9 94 9B                    1         .word LINK 
                           00145B     2         LINK=.
      0094DB 81                       3         .byte IMEDD+1  
      0094DC 5B                       4         .ascii "["
      0094DD                          5         LBRAC:
      0094DD CD 84 EF         [ 4] 3424         CALL   DOLIT
      0094E0 94 A6                 3425         .word  INTER
      0094E2 CD 87 C0         [ 4] 3426         CALL   TEVAL
      0094E5 CC 85 51         [ 2] 3427         JP     STORE
                                   3428 
                                   3429 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3430 ;       .OK     ( -- )
                                   3431 ;       Display 'ok' while interpreting.
                                   3432 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001468                       3433         _HEADER DOTOK,3,".OK"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



      0094E8 94 DB                    1         .word LINK 
                           00146A     2         LINK=.
      0094EA 03                       3         .byte 3  
      0094EB 2E 4F 4B                 4         .ascii ".OK"
      0094EE                          5         DOTOK:
      0094EE CD 84 EF         [ 4] 3434         CALL     DOLIT
      0094F1 94 A6                 3435         .word      INTER
      0094F3 CD 87 C0         [ 4] 3436         CALL     TEVAL
      0094F6 CD 85 63         [ 4] 3437         CALL     AT
      0094F9 CD 89 7A         [ 4] 3438         CALL     EQUAL
      0094FC CD 85 18         [ 4] 3439         CALL     QBRAN
      0094FF 95 08                 3440         .word      DOTO1
      009501 CD 90 36         [ 4] 3441         CALL     DOTQP
      009504 03                    3442         .byte      3
      009505 20 6F 6B              3443         .ascii     " ok"
      009508 CC 90 09         [ 2] 3444 DOTO1:  JP     CR
                                   3445 
                                   3446 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3447 ;       ?STACK  ( -- )
                                   3448 ;       Abort if stack underflows.
                                   3449 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00148B                       3450         _HEADER QSTAC,6,"?STACK"
      00950B 94 EA                    1         .word LINK 
                           00148D     2         LINK=.
      00950D 06                       3         .byte 6  
      00950E 3F 53 54 41 43 4B        4         .ascii "?STACK"
      009514                          5         QSTAC:
      009514 CD 8C C5         [ 4] 3451         CALL     DEPTH
      009517 CD 86 D0         [ 4] 3452         CALL     ZLESS   ;check only for underflow
      00951A CD 94 74         [ 4] 3453         CALL     ABORQ
      00951D 0B                    3454         .byte      11
      00951E 20 75 6E 64 65 72 66  3455         .ascii     " underflow "
             6C 6F 77 20
      009529 81               [ 4] 3456         RET
                                   3457 
                                   3458 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3459 ;       EVAL    ( -- )
                                   3460 ;       Interpret  input stream.
                                   3461 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0014AA                       3462         _HEADER EVAL,4,"EVAL"
      00952A 95 0D                    1         .word LINK 
                           0014AC     2         LINK=.
      00952C 04                       3         .byte 4  
      00952D 45 56 41 4C              4         .ascii "EVAL"
      009531                          5         EVAL:
      009531 CD 92 6B         [ 4] 3463 EVAL1:  CALL     TOKEN
      009534 CD 86 99         [ 4] 3464         CALL     DUPP
      009537 CD 85 81         [ 4] 3465         CALL     CAT     ;?input stream empty
      00953A CD 85 18         [ 4] 3466         CALL     QBRAN
      00953D 95 4D                 3467         .word    EVAL2
      00953F CD 87 C0         [ 4] 3468         CALL     TEVAL
      009542 CD 8D 93         [ 4] 3469         CALL     ATEXE
      009545 CD 95 14         [ 4] 3470         CALL     QSTAC   ;evaluate input, check stack
      009548 CD 85 34         [ 4] 3471         CALL     BRAN
      00954B 95 31                 3472         .word    EVAL1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



      00954D CD 86 8F         [ 4] 3473 EVAL2:  CALL     DROP
      009550 CC 94 EE         [ 2] 3474         JP       DOTOK
                                   3475 
                                   3476 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3477 ;       PRESET  ( -- )
                                   3478 ;       Reset data stack pointer and
                                   3479 ;       terminal input buffer.
                                   3480 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0014D3                       3481         _HEADER PRESE,6,"PRESET"
      009553 95 2C                    1         .word LINK 
                           0014D5     2         LINK=.
      009555 06                       3         .byte 6  
      009556 50 52 45 53 45 54        4         .ascii "PRESET"
      00955C                          5         PRESE:
      00955C CD 84 EF         [ 4] 3482         CALL     DOLIT
      00955F 16 80                 3483         .word      SPP
      009561 CD 86 86         [ 4] 3484         CALL     SPSTO
      009564 CD 84 EF         [ 4] 3485         CALL     DOLIT
      009567 17 00                 3486         .word      TIBB
      009569 CD 87 8D         [ 4] 3487         CALL     NTIB
      00956C CD 8B EC         [ 4] 3488         CALL     CELLP
      00956F CC 85 51         [ 2] 3489         JP     STORE
                                   3490 
                                   3491 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3492 ;       QUIT    ( -- )
                                   3493 ;       Reset return stack pointer
                                   3494 ;       and start text interpreter.
                                   3495 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0014F2                       3496         _HEADER QUIT,4,"QUIT"
      009572 95 55                    1         .word LINK 
                           0014F4     2         LINK=.
      009574 04                       3         .byte 4  
      009575 51 55 49 54              4         .ascii "QUIT"
      009579                          5         QUIT:
      009579 CD 84 EF         [ 4] 3497         CALL     DOLIT
      00957C 17 FF                 3498         .word      RPP
      00957E CD 85 9E         [ 4] 3499         CALL     RPSTO   ;reset return stack pointer
      009581 CD 94 DD         [ 4] 3500 QUIT1:  CALL     LBRAC   ;start interpretation
      009584 CD 94 40         [ 4] 3501 QUIT2:  CALL     QUERY   ;get input
      009587 CD 95 31         [ 4] 3502         CALL     EVAL
      00958A 20 F8            [ 2] 3503         JRA     QUIT2   ;continue till error
                                   3504 
                                   3505 ;; The compiler
                                   3506 
                                   3507 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3508 ;       '       ( -- ca )
                                   3509 ;       Search vocabularies for
                                   3510 ;       next word in input stream.
                                   3511 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00150C                       3512         _HEADER TICK,1,"'"
      00958C 95 74                    1         .word LINK 
                           00150E     2         LINK=.
      00958E 01                       3         .byte 1  
      00958F 27                       4         .ascii "'"
      009590                          5         TICK:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



      009590 CD 92 6B         [ 4] 3513         CALL     TOKEN
      009593 CD 93 68         [ 4] 3514         CALL     NAMEQ   ;?defined
      009596 CD 85 18         [ 4] 3515         CALL     QBRAN
      009599 94 7C                 3516         .word      ABOR1
      00959B 81               [ 4] 3517         RET     ;yes, push code address
                                   3518 
                                   3519 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3520 ;       ALLOT   ( n -- )
                                   3521 ;       Allocate n bytes to RAM 
                                   3522 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00151C                       3523         _HEADER ALLOT,5,"ALLOT"
      00959C 95 8E                    1         .word LINK 
                           00151E     2         LINK=.
      00959E 05                       3         .byte 5  
      00959F 41 4C 4C 4F 54           4         .ascii "ALLOT"
      0095A4                          5         ALLOT:
      0095A4 CD 87 F0         [ 4] 3524         CALL     VPP
                                   3525 ; must update APP_VP each time VP is modidied
      0095A7 CD 8C F3         [ 4] 3526         call PSTOR 
      0095AA CC 9D A2         [ 2] 3527         jp UPDATVP 
                                   3528 
                                   3529 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3530 ;       ,       ( w -- )
                                   3531 ;         Compile an integer into
                                   3532 ;         variable space.
                                   3533 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00152D                       3534         _HEADER COMMA,1,^/"\,"/
      0095AD 95 9E                    1         .word LINK 
                           00152F     2         LINK=.
      0095AF 01                       3         .byte 1  
      0095B0 5C 2C                    4         .ascii "\,"
      0095B2                          5         COMMA:
      0095B2 CD 8D 5D         [ 4] 3535         CALL     HERE
      0095B5 CD 86 99         [ 4] 3536         CALL     DUPP
      0095B8 CD 8B EC         [ 4] 3537         CALL     CELLP   ;cell boundary
      0095BB CD 87 F0         [ 4] 3538         CALL     VPP
      0095BE CD 85 51         [ 4] 3539         CALL     STORE
      0095C1 CC 85 51         [ 2] 3540         JP     STORE
                                   3541 
                                   3542 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3543 ;       C,      ( c -- )
                                   3544 ;       Compile a byte into
                                   3545 ;       variables space.
                                   3546 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001544                       3547         _HEADER CCOMMA,2,^/"C,"/
      0095C4 95 AF                    1         .word LINK 
                           001546     2         LINK=.
      0095C6 02                       3         .byte 2  
      0095C7 43 2C                    4         .ascii "C,"
      0095C9                          5         CCOMMA:
      0095C9 CD 8D 5D         [ 4] 3548         CALL     HERE
      0095CC CD 86 99         [ 4] 3549         CALL     DUPP
      0095CF CD 8C 17         [ 4] 3550         CALL     ONEP
      0095D2 CD 87 F0         [ 4] 3551         CALL     VPP
      0095D5 CD 85 51         [ 4] 3552         CALL     STORE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



      0095D8 CC 85 70         [ 2] 3553         JP     CSTOR
                                   3554 
                                   3555 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3556 ;       [COMPILE]       ( -- ; <string> )
                                   3557 ;       Compile next immediate
                                   3558 ;       word into code dictionary.
                                   3559 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00155B                       3560         _HEADER BCOMP,IMEDD+9,"[COMPILE]"
      0095DB 95 C6                    1         .word LINK 
                           00155D     2         LINK=.
      0095DD 89                       3         .byte IMEDD+9  
      0095DE 5B 43 4F 4D 50 49 4C     4         .ascii "[COMPILE]"
             45 5D
      0095E7                          5         BCOMP:
      0095E7 CD 95 90         [ 4] 3561         CALL     TICK
      0095EA CC 98 BC         [ 2] 3562         JP     JSRC
                                   3563 
                                   3564 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3565 ;       COMPILE ( -- )
                                   3566 ;       Compile next jsr in
                                   3567 ;       colon list to code dictionary.
                                   3568 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00156D                       3569         _HEADER COMPI,COMPO+7,"COMPILE"
      0095ED 95 DD                    1         .word LINK 
                           00156F     2         LINK=.
      0095EF 47                       3         .byte COMPO+7  
      0095F0 43 4F 4D 50 49 4C 45     4         .ascii "COMPILE"
      0095F7                          5         COMPI:
      0095F7 CD 85 B4         [ 4] 3570         CALL     RFROM
      0095FA CD 86 99         [ 4] 3571         CALL     DUPP
      0095FD CD 85 63         [ 4] 3572         CALL     AT
      009600 CD 98 BC         [ 4] 3573         CALL     JSRC    ;compile subroutine
      009603 CD 8B EC         [ 4] 3574         CALL     CELLP
      009606 90 93            [ 1] 3575         ldw y,x 
      009608 90 FE            [ 2] 3576         ldw y,(y)
      00960A 1C 00 02         [ 2] 3577         addw x,#CELLL 
      00960D 90 FC            [ 2] 3578         jp (y)
                                   3579 
                                   3580 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3581 ;       LITERAL ( w -- )
                                   3582 ;       Compile tos to dictionary
                                   3583 ;       as an integer literal.
                                   3584 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00158F                       3585         _HEADER LITER,COMPO+IMEDD+7,"LITERAL"
      00960F 95 EF                    1         .word LINK 
                           001591     2         LINK=.
      009611 C7                       3         .byte COMPO+IMEDD+7  
      009612 4C 49 54 45 52 41 4C     4         .ascii "LITERAL"
      009619                          5         LITER:
      009619 CD 95 F7         [ 4] 3586         CALL     COMPI
      00961C 84 EF                 3587         .word DOLIT 
      00961E CC 95 B2         [ 2] 3588         JP     COMMA
                                   3589 
                                   3590 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3591 ;       $,"     ( -- )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



                                   3592 ;       Compile a literal string
                                   3593 ;       up to next " .
                                   3594 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3595 ;        _HEADER STRCQ,3,^/'$,"'/
      009621                       3596 STRCQ:
      009621 CD 84 EF         [ 4] 3597         CALL     DOLIT
      009624 00 22                 3598         .word     34	; "
      009626 CD 91 AA         [ 4] 3599         CALL     PARSE
      009629 CD 8D 5D         [ 4] 3600         CALL     HERE
      00962C CD 8E 2E         [ 4] 3601         CALL     PACKS   ;string to code dictionary
      00962F CD 8D 46         [ 4] 3602         CALL     COUNT
      009632 CD 88 BC         [ 4] 3603         CALL     PLUS    ;calculate aligned end of string
      009635 CD 87 F0         [ 4] 3604         CALL     VPP
      009638 CC 85 51         [ 2] 3605         JP     STORE
                                   3606 
                                   3607 ;; Structures
                                   3608 
                                   3609 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3610 ;       FOR     ( -- a )
                                   3611 ;       Start a FOR-NEXT loop
                                   3612 ;       structure in a colon definition.
                                   3613 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0015BB                       3614         _HEADER FOR,IMEDD+3,"FOR"
      00963B 96 11                    1         .word LINK 
                           0015BD     2         LINK=.
      00963D 83                       3         .byte IMEDD+3  
      00963E 46 4F 52                 4         .ascii "FOR"
      009641                          5         FOR:
      009641 CD 95 F7         [ 4] 3615         CALL     COMPI
      009644 86 62                 3616         .word TOR 
      009646 CC 8D 5D         [ 2] 3617         JP     HERE
                                   3618 
                                   3619 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3620 ;       NEXT    ( a -- )
                                   3621 ;       Terminate a FOR-NEXT loop.
                                   3622 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0015C9                       3623         _HEADER NEXT,IMEDD+4,"NEXT"
      009649 96 3D                    1         .word LINK 
                           0015CB     2         LINK=.
      00964B 84                       3         .byte IMEDD+4  
      00964C 4E 45 58 54              4         .ascii "NEXT"
      009650                          5         NEXT:
      009650 CD 95 F7         [ 4] 3624         CALL     COMPI
      009653 85 03                 3625         .word DONXT 
      009655 CD 88 3C         [ 4] 3626         call ADRADJ
      009658 CC 95 B2         [ 2] 3627         JP     COMMA
                                   3628 
                                   3629 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3630 ;       I ( -- n )
                                   3631 ;       stack COUNTER
                                   3632 ;       of innermost FOR-NEXT  
                                   3633 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0015DB                       3634         _HEADER IFETCH,1,"I"
      00965B 96 4B                    1         .word LINK 
                           0015DD     2         LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



      00965D 01                       3         .byte 1  
      00965E 49                       4         .ascii "I"
      00965F                          5         IFETCH:
      00965F 1D 00 02         [ 2] 3635         subw x,#CELLL 
      009662 16 03            [ 2] 3636         ldw y,(3,sp)
      009664 FF               [ 2] 3637         ldw (x),y 
      009665 81               [ 4] 3638         ret 
                                   3639 
                                   3640 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3641 ;       J ( -- n )
                                   3642 ;   stack COUNTER
                                   3643 ;   of outer FOR-NEXT  
                                   3644 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0015E6                       3645         _HEADER JFETCH,1,"J"
      009666 96 5D                    1         .word LINK 
                           0015E8     2         LINK=.
      009668 01                       3         .byte 1  
      009669 4A                       4         .ascii "J"
      00966A                          5         JFETCH:
      00966A 1D 00 02         [ 2] 3646         SUBW X,#CELLL 
      00966D 16 05            [ 2] 3647         LDW Y,(5,SP)
      00966F FF               [ 2] 3648         LDW (X),Y 
      009670 81               [ 4] 3649         RET 
                                   3650 
                                   3651 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3652 ;       BEGIN   ( -- a )
                                   3653 ;       Start an infinite or
                                   3654 ;       indefinite loop structure.
                                   3655 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0015F1                       3656         _HEADER BEGIN,IMEDD+5,"BEGIN"
      009671 96 68                    1         .word LINK 
                           0015F3     2         LINK=.
      009673 85                       3         .byte IMEDD+5  
      009674 42 45 47 49 4E           4         .ascii "BEGIN"
      009679                          5         BEGIN:
      009679 CC 8D 5D         [ 2] 3657         JP     HERE
                                   3658 
                                   3659 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3660 ;       UNTIL   ( a -- )
                                   3661 ;       Terminate a BEGIN-UNTIL
                                   3662 ;       indefinite loop structure.
                                   3663 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0015FC                       3664         _HEADER UNTIL,IMEDD+5,"UNTIL"
      00967C 96 73                    1         .word LINK 
                           0015FE     2         LINK=.
      00967E 85                       3         .byte IMEDD+5  
      00967F 55 4E 54 49 4C           4         .ascii "UNTIL"
      009684                          5         UNTIL:
      009684 CD 95 F7         [ 4] 3665         CALL     COMPI
      009687 85 18                 3666         .word    QBRAN 
      009689 CD 88 3C         [ 4] 3667         call ADRADJ
      00968C CC 95 B2         [ 2] 3668         JP     COMMA
                                   3669 
                                   3670 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3671 ;       AGAIN   ( a -- )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



                                   3672 ;       Terminate a BEGIN-AGAIN
                                   3673 ;       infinite loop structure.
                                   3674 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00160F                       3675         _HEADER AGAIN,IMEDD+5,"AGAIN"
      00968F 96 7E                    1         .word LINK 
                           001611     2         LINK=.
      009691 85                       3         .byte IMEDD+5  
      009692 41 47 41 49 4E           4         .ascii "AGAIN"
      009697                          5         AGAIN:
      009697 CD 95 F7         [ 4] 3676         CALL     COMPI
      00969A 85 34                 3677         .word BRAN
      00969C CD 88 3C         [ 4] 3678         call ADRADJ 
      00969F CC 95 B2         [ 2] 3679         JP     COMMA
                                   3680 
                                   3681 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3682 ;       IF      ( -- A )
                                   3683 ;       Begin a conditional branch.
                                   3684 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001622                       3685         _HEADER IFF,IMEDD+2,"IF"
      0096A2 96 91                    1         .word LINK 
                           001624     2         LINK=.
      0096A4 82                       3         .byte IMEDD+2  
      0096A5 49 46                    4         .ascii "IF"
      0096A7                          5         IFF:
      0096A7 CD 95 F7         [ 4] 3686         CALL     COMPI
      0096AA 85 18                 3687         .word QBRAN
      0096AC CD 8D 5D         [ 4] 3688         CALL     HERE
      0096AF CD 8C 83         [ 4] 3689         CALL     ZERO
      0096B2 CC 95 B2         [ 2] 3690         JP     COMMA
                                   3691 
                                   3692 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3693 ;       THEN        ( A -- )
                                   3694 ;       Terminate a conditional 
                                   3695 ;       branch structure.
                                   3696 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001635                       3697         _HEADER THENN,IMEDD+4,"THEN"
      0096B5 96 A4                    1         .word LINK 
                           001637     2         LINK=.
      0096B7 84                       3         .byte IMEDD+4  
      0096B8 54 48 45 4E              4         .ascii "THEN"
      0096BC                          5         THENN:
      0096BC CD 8D 5D         [ 4] 3698         CALL     HERE
      0096BF CD 88 3C         [ 4] 3699         call ADRADJ 
      0096C2 CD 86 A9         [ 4] 3700         CALL     SWAPP
      0096C5 CC 85 51         [ 2] 3701         JP     STORE
                                   3702 
                                   3703 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3704 ;       ELSE        ( A -- A )
                                   3705 ;       Start the false clause in 
                                   3706 ;       an IF-ELSE-THEN structure.
                                   3707 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001648                       3708         _HEADER ELSEE,IMEDD+4,"ELSE"
      0096C8 96 B7                    1         .word LINK 
                           00164A     2         LINK=.
      0096CA 84                       3         .byte IMEDD+4  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



      0096CB 45 4C 53 45              4         .ascii "ELSE"
      0096CF                          5         ELSEE:
      0096CF CD 95 F7         [ 4] 3709         CALL     COMPI
      0096D2 85 34                 3710         .word BRAN
      0096D4 CD 8D 5D         [ 4] 3711         CALL     HERE
      0096D7 CD 8C 83         [ 4] 3712         CALL     ZERO
      0096DA CD 95 B2         [ 4] 3713         CALL     COMMA
      0096DD CD 86 A9         [ 4] 3714         CALL     SWAPP
      0096E0 CD 8D 5D         [ 4] 3715         CALL     HERE
      0096E3 CD 88 3C         [ 4] 3716         call ADRADJ 
      0096E6 CD 86 A9         [ 4] 3717         CALL     SWAPP
      0096E9 CC 85 51         [ 2] 3718         JP     STORE
                                   3719 
                                   3720 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3721 ;       AHEAD       ( -- A )
                                   3722 ;       Compile a forward branch
                                   3723 ;       instruction.
                                   3724 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00166C                       3725         _HEADER AHEAD,IMEDD+5,"AHEAD"
      0096EC 96 CA                    1         .word LINK 
                           00166E     2         LINK=.
      0096EE 85                       3         .byte IMEDD+5  
      0096EF 41 48 45 41 44           4         .ascii "AHEAD"
      0096F4                          5         AHEAD:
      0096F4 CD 95 F7         [ 4] 3726         CALL     COMPI
      0096F7 85 34                 3727         .word BRAN
      0096F9 CD 8D 5D         [ 4] 3728         CALL     HERE
      0096FC CD 8C 83         [ 4] 3729         CALL     ZERO
      0096FF CC 95 B2         [ 2] 3730         JP     COMMA
                                   3731 
                                   3732 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3733 ;       WHILE       ( a -- A a )
                                   3734 ;       Conditional branch out of a 
                                   3735 ;       BEGIN-WHILE-REPEAT loop.
                                   3736 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001682                       3737         _HEADER WHILE,IMEDD+5,"WHILE"
      009702 96 EE                    1         .word LINK 
                           001684     2         LINK=.
      009704 85                       3         .byte IMEDD+5  
      009705 57 48 49 4C 45           4         .ascii "WHILE"
      00970A                          5         WHILE:
      00970A CD 95 F7         [ 4] 3738         CALL     COMPI
      00970D 85 18                 3739         .word QBRAN
      00970F CD 8D 5D         [ 4] 3740         CALL     HERE
      009712 CD 8C 83         [ 4] 3741         CALL     ZERO
      009715 CD 95 B2         [ 4] 3742         CALL     COMMA
      009718 CC 86 A9         [ 2] 3743         JP     SWAPP
                                   3744 
                                   3745 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3746 ;       REPEAT      ( A a -- )
                                   3747 ;       Terminate a BEGIN-WHILE-REPEAT 
                                   3748 ;       indefinite loop.
                                   3749 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00169B                       3750         _HEADER REPEA,IMEDD+6,"REPEAT"
      00971B 97 04                    1         .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



                           00169D     2         LINK=.
      00971D 86                       3         .byte IMEDD+6  
      00971E 52 45 50 45 41 54        4         .ascii "REPEAT"
      009724                          5         REPEA:
      009724 CD 95 F7         [ 4] 3751         CALL     COMPI
      009727 85 34                 3752         .word BRAN
      009729 CD 88 3C         [ 4] 3753         call ADRADJ 
      00972C CD 95 B2         [ 4] 3754         CALL     COMMA
      00972F CD 8D 5D         [ 4] 3755         CALL     HERE
      009732 CD 88 3C         [ 4] 3756         call ADRADJ 
      009735 CD 86 A9         [ 4] 3757         CALL     SWAPP
      009738 CC 85 51         [ 2] 3758         JP     STORE
                                   3759 
                                   3760 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3761 ;       AFT         ( a -- a A )
                                   3762 ;       Jump to THEN in a FOR-AFT-THEN-NEXT 
                                   3763 ;       loop the first time through.
                                   3764 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0016BB                       3765         _HEADER AFT,IMEDD+3,"AFT"
      00973B 97 1D                    1         .word LINK 
                           0016BD     2         LINK=.
      00973D 83                       3         .byte IMEDD+3  
      00973E 41 46 54                 4         .ascii "AFT"
      009741                          5         AFT:
      009741 CD 86 8F         [ 4] 3766         CALL     DROP
      009744 CD 96 F4         [ 4] 3767         CALL     AHEAD
      009747 CD 8D 5D         [ 4] 3768         CALL     HERE
      00974A CC 86 A9         [ 2] 3769         JP     SWAPP
                                   3770 
                                   3771 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3772 ;       ABORT"      ( -- ; <string> )
                                   3773 ;       Conditional abort with an error message.
                                   3774 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0016CD                       3775         _HEADER ABRTQ,IMEDD+6,'ABORT"'
      00974D 97 3D                    1         .word LINK 
                           0016CF     2         LINK=.
      00974F 86                       3         .byte IMEDD+6  
      009750 41 42 4F 52 54 22        4         .ascii 'ABORT"'
      009756                          5         ABRTQ:
      009756 CD 95 F7         [ 4] 3776         CALL     COMPI
      009759 94 74                 3777         .word ABORQ
      00975B CC 96 21         [ 2] 3778         JP     STRCQ
                                   3779 
                                   3780 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3781 ;       $"     ( -- ; <string> )
                                   3782 ;       Compile an inline string literal.
                                   3783 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0016DE                       3784         _HEADER STRQ,IMEDD+2,'$"'
      00975E 97 4F                    1         .word LINK 
                           0016E0     2         LINK=.
      009760 82                       3         .byte IMEDD+2  
      009761 24 22                    4         .ascii '$"'
      009763                          5         STRQ:
      009763 CD 95 F7         [ 4] 3785         CALL     COMPI
      009766 90 32                 3786         .word STRQP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



      009768 CC 96 21         [ 2] 3787         JP     STRCQ
                                   3788 
                                   3789 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3790 ;       ."          ( -- ; <string> )
                                   3791 ;       Compile an inline string literal 
                                   3792 ;       to be typed out at run time.
                                   3793 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0016EB                       3794         _HEADER DOTQ,IMEDD+2,'."'
      00976B 97 60                    1         .word LINK 
                           0016ED     2         LINK=.
      00976D 82                       3         .byte IMEDD+2  
      00976E 2E 22                    4         .ascii '."'
      009770                          5         DOTQ:
      009770 CD 95 F7         [ 4] 3795         CALL     COMPI
      009773 90 36                 3796         .word DOTQP 
      009775 CC 96 21         [ 2] 3797         JP     STRCQ
                                   3798 
                                   3799 ;; Name compiler
                                   3800 
                                   3801 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3802 ;       ?UNIQUE ( a -- a )
                                   3803 ;       Display a warning message
                                   3804 ;       if word already exists.
                                   3805 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0016F8                       3806         _HEADER UNIQU,7,"?UNIQUE"
      009778 97 6D                    1         .word LINK 
                           0016FA     2         LINK=.
      00977A 07                       3         .byte 7  
      00977B 3F 55 4E 49 51 55 45     4         .ascii "?UNIQUE"
      009782                          5         UNIQU:
      009782 CD 86 99         [ 4] 3807         CALL     DUPP
      009785 CD 93 68         [ 4] 3808         CALL     NAMEQ   ;?name exists
      009788 CD 85 18         [ 4] 3809         CALL     QBRAN
      00978B 97 A1                 3810         .word      UNIQ1
      00978D CD 90 36         [ 4] 3811         CALL     DOTQP   ;redef are OK
      009790 07                    3812         .byte       7
      009791 20 72 65 44 65 66 20  3813         .ascii     " reDef "       
      009798 CD 86 C1         [ 4] 3814         CALL     OVER
      00979B CD 8D 46         [ 4] 3815         CALL     COUNT
      00979E CD 8F F1         [ 4] 3816         CALL     TYPES   ;just in case
      0097A1 CC 86 8F         [ 2] 3817 UNIQ1:  JP     DROP
                                   3818 
                                   3819 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3820 ;       $,n     ( na -- )
                                   3821 ;       Build a new dictionary name
                                   3822 ;       using string at na.
                                   3823 ; compile dans l'espace des variables 
                                   3824 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3825 ;        _HEADER SNAME,3,^/"$,n"/
      0097A4                       3826 SNAME: 
      0097A4 CD 86 99         [ 4] 3827         CALL     DUPP
      0097A7 CD 85 81         [ 4] 3828         CALL     CAT     ;?null input
      0097AA CD 85 18         [ 4] 3829         CALL     QBRAN
      0097AD 97 DA                 3830         .word      PNAM1
      0097AF CD 97 82         [ 4] 3831         CALL     UNIQU   ;?redefinition
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



      0097B2 CD 86 99         [ 4] 3832         CALL     DUPP
      0097B5 CD 8D 46         [ 4] 3833         CALL     COUNT
      0097B8 CD 88 BC         [ 4] 3834         CALL     PLUS
      0097BB CD 87 F0         [ 4] 3835         CALL     VPP
      0097BE CD 85 51         [ 4] 3836         CALL     STORE
      0097C1 CD 86 99         [ 4] 3837         CALL     DUPP
      0097C4 CD 88 0E         [ 4] 3838         CALL     LAST
      0097C7 CD 85 51         [ 4] 3839         CALL     STORE   ;save na for vocabulary link
      0097CA CD 8B FB         [ 4] 3840         CALL     CELLM   ;link address
      0097CD CD 87 E2         [ 4] 3841         CALL     CNTXT
      0097D0 CD 85 63         [ 4] 3842         CALL     AT
      0097D3 CD 86 A9         [ 4] 3843         CALL     SWAPP
      0097D6 CD 85 51         [ 4] 3844         CALL     STORE
      0097D9 81               [ 4] 3845         RET     ;save code pointer
      0097DA CD 90 32         [ 4] 3846 PNAM1:  CALL     STRQP
      0097DD 05                    3847         .byte      5
      0097DE 20 6E 61 6D 65        3848         .ascii     " name" ;null input
      0097E3 CC 94 7C         [ 2] 3849         JP     ABOR1
                                   3850 
                                   3851 ;; FORTH compiler
                                   3852 
                                   3853 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3854 ;       $COMPILE        ( a -- )
                                   3855 ;       Compile next word to
                                   3856 ;       dictionary as a token or literal.
                                   3857 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001766                       3858         _HEADER SCOMP,8,"$COMPILE"
      0097E6 97 7A                    1         .word LINK 
                           001768     2         LINK=.
      0097E8 08                       3         .byte 8  
      0097E9 24 43 4F 4D 50 49 4C     4         .ascii "$COMPILE"
             45
      0097F1                          5         SCOMP:
      0097F1 CD 93 68         [ 4] 3859         CALL     NAMEQ
      0097F4 CD 88 4C         [ 4] 3860         CALL     QDUP    ;?defined
      0097F7 CD 85 18         [ 4] 3861         CALL     QBRAN
      0097FA 98 12                 3862         .word      SCOM2
      0097FC CD 85 63         [ 4] 3863         CALL     AT
      0097FF CD 84 EF         [ 4] 3864         CALL     DOLIT
      009802 80 00                 3865         .word     0x8000	;  IMEDD*256
      009804 CD 86 F6         [ 4] 3866         CALL     ANDD    ;?immediate
      009807 CD 85 18         [ 4] 3867         CALL     QBRAN
      00980A 98 0F                 3868         .word      SCOM1
      00980C CC 85 44         [ 2] 3869         JP     EXECU
      00980F CC 98 BC         [ 2] 3870 SCOM1:  JP     JSRC
      009812 CD A6 53         [ 4] 3871 SCOM2:  CALL     NUMBQ   ;try to convert to number
      009815 CD 88 4C         [ 4] 3872         CALL    QDUP  
      009818 CD 85 18         [ 4] 3873         CALL     QBRAN
      00981B 94 7C                 3874         .word      ABOR1
      00179D                       3875         _DOLIT  -1
      00981D CD 84 EF         [ 4]    1     CALL DOLIT 
      009820 FF FF                    2     .word -1 
      009822 CD 89 7A         [ 4] 3876         CALL    EQUAL
      0017A5                       3877         _QBRAN DLITER  
      009825 CD 85 18         [ 4]    1     CALL QBRAN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



      009828 AA 23                    2     .word DLITER
      00982A CC 96 19         [ 2] 3878         JP     LITER
                                   3879 
                                   3880 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3881 ;       OVERT   ( -- )
                                   3882 ;       Link a new word into vocabulary.
                                   3883 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0017AD                       3884         _HEADER OVERT,5,"OVERT"
      00982D 97 E8                    1         .word LINK 
                           0017AF     2         LINK=.
      00982F 05                       3         .byte 5  
      009830 4F 56 45 52 54           4         .ascii "OVERT"
      009835                          5         OVERT:
      009835 CD 88 0E         [ 4] 3885         CALL     LAST
      009838 CD 85 63         [ 4] 3886         CALL     AT
      00983B CD 87 E2         [ 4] 3887         CALL     CNTXT
      00983E CC 85 51         [ 2] 3888         JP     STORE
                                   3889 
                                   3890 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3891 ;       ;       ( -- )
                                   3892 ;       Terminate a colon definition.
                                   3893 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0017C1                       3894         _HEADER SEMIS,IMEDD+COMPO+1,^/";"/
      009841 98 2F                    1         .word LINK 
                           0017C3     2         LINK=.
      009843 C1                       3         .byte IMEDD+COMPO+1  
      009844 3B                       4         .ascii ";"
      009845                          5         SEMIS:
                           000001  3895 .if OPTIMIZE ; more compact and faster
      009845 CD 84 EF         [ 4] 3896         call DOLIT 
      009848 00 81                 3897         .word 0x81   ; opcode for RET 
      00984A CD 95 C9         [ 4] 3898         call CCOMMA 
                           000000  3899 .else
                                   3900         CALL     COMPI
                                   3901         .word EXIT 
                                   3902 .endif 
      00984D CD 94 DD         [ 4] 3903         CALL     LBRAC
      009850 CD 98 35         [ 4] 3904         call OVERT 
      009853 CD A2 FA         [ 4] 3905         CALL FMOVE
      009856 CD 88 4C         [ 4] 3906         call QDUP 
      009859 CD 85 18         [ 4] 3907         call QBRAN 
      00985C 99 D2                 3908         .word SET_RAMLAST 
      00985E CD A3 8E         [ 4] 3909         CALL UPDATPTR
      009861 81               [ 4] 3910         RET 
                                   3911 
                                   3912 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3913 ;       Terminate an ISR definition 
                                   3914 ;       retourn ca of ISR as double
                                   3915 ;       I; ( -- ud )
                                   3916 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0017E2                       3917        _HEADER ISEMI,2+IMEDD+COMPO,^/"I;"/
      009862 98 43                    1         .word LINK 
                           0017E4     2         LINK=.
      009864 C2                       3         .byte 2+IMEDD+COMPO  
      009865 49 3B                    4         .ascii "I;"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



      009867                          5         ISEMI:
      009867 1D 00 02         [ 2] 3918         subw x,#CELLL  
      00986A 90 AE 00 80      [ 2] 3919         ldw y,#IRET_CODE 
      00986E FF               [ 2] 3920         ldw (x),y 
      00986F CD 95 C9         [ 4] 3921         call CCOMMA
      009872 CD 94 DD         [ 4] 3922         call LBRAC 
      009875 CD A3 D3         [ 4] 3923         call IFMOVE
      009878 CD 88 4C         [ 4] 3924         call QDUP 
      00987B CD 85 18         [ 4] 3925         CALL QBRAN 
      00987E 99 D2                 3926         .word SET_RAMLAST
      009880 CD 87 FE         [ 4] 3927         CALL CPP
      009883 CD 85 63         [ 4] 3928         call AT 
      009886 CD 86 A9         [ 4] 3929         call SWAPP 
      009889 CD 87 FE         [ 4] 3930         CALL CPP 
      00988C CD 85 51         [ 4] 3931         call STORE 
      00988F CD 9D 8B         [ 4] 3932         call UPDATCP 
      009892 CD 9D 48         [ 4] 3933         call EEPVP 
      001815                       3934         _DROP 
      009895 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      009898 CD 85 63         [ 4] 3935         call AT 
      00989B CD 87 F0         [ 4] 3936         call VPP 
      00989E CD 85 51         [ 4] 3937         call STORE 
      0098A1 CC 8C 83         [ 2] 3938         jp ZERO
      0098A4 81               [ 4] 3939         ret           
                                   3940         
                                   3941 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3942 ;       ]       ( -- )
                                   3943 ;       Start compiling words in
                                   3944 ;       input stream.
                                   3945 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001825                       3946         _HEADER RBRAC,1,"]"
      0098A5 98 64                    1         .word LINK 
                           001827     2         LINK=.
      0098A7 01                       3         .byte 1  
      0098A8 5D                       4         .ascii "]"
      0098A9                          5         RBRAC:
      0098A9 CD 84 EF         [ 4] 3947         CALL   DOLIT
      0098AC 97 F1                 3948         .word  SCOMP
      0098AE CD 87 C0         [ 4] 3949         CALL   TEVAL
      0098B1 CC 85 51         [ 2] 3950         JP     STORE
                                   3951 
                                   3952 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3953 ;       CALL,    ( ca -- )
                                   3954 ;       Compile a subroutine call.
                                   3955 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001834                       3956         _HEADER JSRC,5,^/"CALL,"/
      0098B4 98 A7                    1         .word LINK 
                           001836     2         LINK=.
      0098B6 05                       3         .byte 5  
      0098B7 43 41 4C 4C 2C           4         .ascii "CALL,"
      0098BC                          5         JSRC:
                                   3957 ;;;;; optimization code ;;;;;;;;;;;;;;;
      0098BC 90 AE 86 8F      [ 2] 3958         LDW Y,#DROP 
      0098C0 90 BF 26         [ 2] 3959         LDW YTEMP,Y 
      0098C3 90 93            [ 1] 3960         LDW Y,X 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



      0098C5 90 FE            [ 2] 3961         LDW Y,(Y)
      0098C7 90 B3 26         [ 2] 3962         CPW Y,YTEMP 
      0098CA 26 13            [ 1] 3963         JRNE JSRC1 
                                   3964 ; replace CALL DROP BY  ADDW X,#CELLL 
      0098CC 1C 00 02         [ 2] 3965         ADDW X,#CELLL 
      00184F                       3966         _DOLIT ADDWX ; opcode 
      0098CF CD 84 EF         [ 4]    1     CALL DOLIT 
      0098D2 00 1C                    2     .word ADDWX 
      0098D4 CD 95 C9         [ 4] 3967         CALL   CCOMMA 
      001857                       3968         _DOLIT CELLL 
      0098D7 CD 84 EF         [ 4]    1     CALL DOLIT 
      0098DA 00 02                    2     .word CELLL 
      0098DC CC 95 B2         [ 2] 3969         JP      COMMA 
      0098DF                       3970 JSRC1: ; check for DDROP 
      0098DF 90 AE 88 9C      [ 2] 3971         LDW Y,#DDROP 
      0098E3 90 BF 26         [ 2] 3972         LDW YTEMP,Y 
      0098E6 90 93            [ 1] 3973         LDW Y,X 
      0098E8 90 FE            [ 2] 3974         LDW Y,(Y)
      0098EA 90 B3 26         [ 2] 3975         CPW Y,YTEMP 
      0098ED 26 13            [ 1] 3976         JRNE JSRC2 
                                   3977 ; replace CALL DDROP BY ADDW X,#2*CELLL 
      0098EF 1C 00 02         [ 2] 3978         ADDW X,#CELLL 
      001872                       3979         _DOLIT ADDWX 
      0098F2 CD 84 EF         [ 4]    1     CALL DOLIT 
      0098F5 00 1C                    2     .word ADDWX 
      0098F7 CD 95 C9         [ 4] 3980         CALL  CCOMMA 
      00187A                       3981         _DOLIT 2*CELLL 
      0098FA CD 84 EF         [ 4]    1     CALL DOLIT 
      0098FD 00 04                    2     .word 2*CELLL 
      0098FF CC 95 B2         [ 2] 3982         JP  COMMA 
                                   3983 ;;;;;;;; end optimization code ;;;;;;;;;;        
      009902                       3984 JSRC2:        
      009902 CD 84 EF         [ 4] 3985         CALL     DOLIT
      009905 00 CD                 3986         .word     CALLL     ;CALL
      009907 CD 95 C9         [ 4] 3987         CALL     CCOMMA
      00990A CC 95 B2         [ 2] 3988         JP     COMMA
                                   3989 
                                   3990 ;       INIT-OFS ( -- )
                                   3991 ;       compute offset to adjust jump address 
                                   3992 ;       set variable OFFSET 
      00990D 98 B6                 3993         .word LINK 
                           00188F  3994         LINK=.
      00990F 08                    3995         .byte 8 
      009910 49 4E 49 54 2D 4F 46  3996         .ascii "INIT-OFS" 
             53
      009918                       3997 INITOFS:
      009918 CD 87 AF         [ 4] 3998         call TFLASH 
      00991B CD 85 63         [ 4] 3999         CALL AT 
      00991E CD 86 99         [ 4] 4000         CALL DUPP 
      009921 CD 85 18         [ 4] 4001         call QBRAN
      009924 99 35                 4002         .word 1$
      0018A6                       4003         _DROP  
      009926 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      009929 CD 87 FE         [ 4] 4004         call CPP 
      00992C CD 85 63         [ 4] 4005         call AT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



      00992F CD 8D 5D         [ 4] 4006         call HERE
      009932 CD 89 52         [ 4] 4007         call SUBB 
      009935 CD 88 33         [ 4] 4008 1$:     call OFFSET 
      009938 CC 85 51         [ 2] 4009         jp STORE  
                                   4010 
                                   4011 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4012 ;       :       ( -- ; <string> )
                                   4013 ;       Start a new colon definition
                                   4014 ;       using next word as its name.
                                   4015 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0018BB                       4016         _HEADER COLON,1,":"
      00993B 99 0F                    1         .word LINK 
                           0018BD     2         LINK=.
      00993D 01                       3         .byte 1  
      00993E 3A                       4         .ascii ":"
      00993F                          5         COLON:
      00993F CD 99 18         [ 4] 4017         call INITOFS       
      009942 CD 92 6B         [ 4] 4018         CALL   TOKEN
      009945 CD 97 A4         [ 4] 4019         CALL   SNAME
      009948 CC 98 A9         [ 2] 4020         JP     RBRAC
                                   4021 
                                   4022 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4023 ;       I:  ( -- )
                                   4024 ;       Start interrupt service 
                                   4025 ;       routine definition
                                   4026 ;       those definition have 
                                   4027 ;       no name.
                                   4028 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0018CB                       4029         _HEADER ICOLON,2,"I:"
      00994B 99 3D                    1         .word LINK 
                           0018CD     2         LINK=.
      00994D 02                       3         .byte 2  
      00994E 49 3A                    4         .ascii "I:"
      009950                          5         ICOLON:
      009950 CD 99 18         [ 4] 4030         call INITOFS 
      009953 CC 98 A9         [ 2] 4031         jp RBRAC  
                                   4032 
                                   4033 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4034 ;       IMMEDIATE       ( -- )
                                   4035 ;       Make last compiled word
                                   4036 ;       an immediate word.
                                   4037 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0018D6                       4038         _HEADER IMMED,9,"IMMEDIATE"
      009956 99 4D                    1         .word LINK 
                           0018D8     2         LINK=.
      009958 09                       3         .byte 9  
      009959 49 4D 4D 45 44 49 41     4         .ascii "IMMEDIATE"
             54 45
      009962                          5         IMMED:
      009962 CD 84 EF         [ 4] 4039         CALL     DOLIT
      009965 80 00                 4040         .word     0x8000	;  IMEDD*256
      009967 CD 88 0E         [ 4] 4041         CALL     LAST
      00996A CD 85 63         [ 4] 4042         CALL     AT
      00996D CD 85 63         [ 4] 4043         CALL     AT
      009970 CD 87 0A         [ 4] 4044         CALL     ORR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



      009973 CD 88 0E         [ 4] 4045         CALL     LAST
      009976 CD 85 63         [ 4] 4046         CALL     AT
      009979 CC 85 51         [ 2] 4047         JP     STORE
                                   4048 
                                   4049 ;; Defining words
                                   4050 
                                   4051 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4052 ;       CREATE  ( -- ; <string> )
                                   4053 ;       Compile a new array
                                   4054 ;       without allocating space.
                                   4055 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0018FC                       4056         _HEADER CREAT,6,"CREATE"
      00997C 99 58                    1         .word LINK 
                           0018FE     2         LINK=.
      00997E 06                       3         .byte 6  
      00997F 43 52 45 41 54 45        4         .ascii "CREATE"
      009985                          5         CREAT:
      009985 CD 92 6B         [ 4] 4057         CALL     TOKEN
      009988 CD 97 A4         [ 4] 4058         CALL     SNAME
      00998B CD 98 35         [ 4] 4059         CALL     OVERT        
      00998E CD 95 F7         [ 4] 4060         CALL     COMPI 
      009991 87 4F                 4061         .word DOVAR 
      009993 81               [ 4] 4062         RET
                                   4063 
                                   4064 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4065 ;       VARIABLE  ( -- ; <string> )
                                   4066 ;       Compile a new variable
                                   4067 ;       initialized to 0.
                                   4068 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001914                       4069         _HEADER VARIA,8,"VARIABLE"
      009994 99 7E                    1         .word LINK 
                           001916     2         LINK=.
      009996 08                       3         .byte 8  
      009997 56 41 52 49 41 42 4C     4         .ascii "VARIABLE"
             45
      00999F                          5         VARIA:
                                   4070 ; indirect variable so that VARIABLE definition can be compiled in FLASH 
      00999F CD 8D 5D         [ 4] 4071         CALL HERE
      0099A2 CD 86 99         [ 4] 4072         CALL DUPP 
      0099A5 CD 8B EC         [ 4] 4073         CALL CELLP
      0099A8 CD 87 F0         [ 4] 4074         CALL VPP 
      0099AB CD 85 51         [ 4] 4075         CALL STORE
      0099AE CD 99 85         [ 4] 4076         CALL CREAT
      0099B1 CD 86 99         [ 4] 4077         CALL DUPP
      0099B4 CD 95 B2         [ 4] 4078         CALL COMMA
      0099B7 CD 8C 83         [ 4] 4079         CALL ZERO
      0099BA CD 86 A9         [ 4] 4080         call SWAPP 
      0099BD CD 85 51         [ 4] 4081         CALL STORE
      0099C0 CD A2 FA         [ 4] 4082         CALL FMOVE ; move definition to FLASH
      0099C3 CD 88 4C         [ 4] 4083         CALL QDUP 
      0099C6 CD 85 18         [ 4] 4084         CALL QBRAN 
      0099C9 99 D2                 4085         .word SET_RAMLAST   
      0099CB CD 9D A2         [ 4] 4086         call UPDATVP  ; don't update if variable kept in RAM.
      0099CE CD A3 8E         [ 4] 4087         CALL UPDATPTR
      0099D1 81               [ 4] 4088         RET         
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



      0099D2                       4089 SET_RAMLAST: 
      0099D2 CD 88 0E         [ 4] 4090         CALL LAST 
      0099D5 CD 85 63         [ 4] 4091         CALL AT 
      0099D8 CD 88 21         [ 4] 4092         CALL RAMLAST 
      0099DB CC 85 51         [ 2] 4093         jp STORE  
                                   4094 
                                   4095 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4096 ;       CONSTANT  ( n -- ; <string> )
                                   4097 ;       Compile a new constant 
                                   4098 ;       n CONSTANT name 
                                   4099 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00195E                       4100         _HEADER CONSTANT,8,"CONSTANT"
      0099DE 99 96                    1         .word LINK 
                           001960     2         LINK=.
      0099E0 08                       3         .byte 8  
      0099E1 43 4F 4E 53 54 41 4E     4         .ascii "CONSTANT"
             54
      0099E9                          5         CONSTANT:
      0099E9 CD 92 6B         [ 4] 4101         CALL TOKEN
      0099EC CD 97 A4         [ 4] 4102         CALL SNAME 
      0099EF CD 98 35         [ 4] 4103         CALL OVERT 
      0099F2 CD 95 F7         [ 4] 4104         CALL COMPI 
      0099F5 9A 09                 4105         .word DOCONST
      0099F7 CD 95 B2         [ 4] 4106         CALL COMMA 
      0099FA CD A2 FA         [ 4] 4107         CALL FMOVE
      0099FD CD 88 4C         [ 4] 4108         CALL QDUP 
      009A00 CD 85 18         [ 4] 4109         CALL QBRAN 
      009A03 99 D2                 4110         .word SET_RAMLAST  
      009A05 CD A3 8E         [ 4] 4111         CALL UPDATPTR  
      009A08 81               [ 4] 4112 1$:     RET          
                                   4113 
                                   4114 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4115 ; CONSTANT runtime semantic 
                                   4116 ; doCONST  ( -- n )
                                   4117 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4118 ;       _HEADER DOCONST,7,"DOCONST"
      009A09                       4119 DOCONST:
      009A09 1D 00 02         [ 2] 4120         subw x,#CELLL
      009A0C 90 85            [ 2] 4121         popw y 
      009A0E 90 FE            [ 2] 4122         ldw y,(y) 
      009A10 FF               [ 2] 4123         ldw (x),y 
      009A11 81               [ 4] 4124         ret 
                                   4125 
                                   4126 ;----------------------------------
                                   4127 ; create double constant 
                                   4128 ; 2CONSTANT ( d -- ; <string> )
                                   4129 ;----------------------------------
      001992                       4130         _HEADER DCONST,9,"2CONSTANT"
      009A12 99 E0                    1         .word LINK 
                           001994     2         LINK=.
      009A14 09                       3         .byte 9  
      009A15 32 43 4F 4E 53 54 41     4         .ascii "2CONSTANT"
             4E 54
      009A1E                          5         DCONST:
      009A1E CD 92 6B         [ 4] 4131         CALL TOKEN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



      009A21 CD 97 A4         [ 4] 4132         CALL SNAME 
      009A24 CD 98 35         [ 4] 4133         CALL OVERT 
      009A27 CD 95 F7         [ 4] 4134         CALL COMPI 
      009A2A 9A 41                 4135         .word DO_DCONST
      009A2C CD 95 B2         [ 4] 4136         CALL COMMA
      009A2F CD 95 B2         [ 4] 4137         CALL COMMA  
      009A32 CD A2 FA         [ 4] 4138         CALL FMOVE
      009A35 CD 88 4C         [ 4] 4139         CALL QDUP 
      009A38 CD 85 18         [ 4] 4140         CALL QBRAN 
      009A3B 99 D2                 4141         .word SET_RAMLAST  
      009A3D CD A3 8E         [ 4] 4142         CALL UPDATPTR  
      009A40 81               [ 4] 4143 1$:     RET          
                                   4144     
                                   4145 ;----------------------------------
                                   4146 ; runtime for DCONST 
                                   4147 ; stack double constant 
                                   4148 ; DO-DCONST ( -- d )
                                   4149 ;-----------------------------------
                                   4150 ;       _HEADER DO_DCONST,9,"DO-DCONST"
      009A41                       4151 DO_DCONST:
      009A41 90 85            [ 2] 4152     popw y 
      009A43 90 BF 26         [ 2] 4153     ldw YTEMP,y 
      009A46 1D 00 04         [ 2] 4154     subw x,#2*CELLL 
      009A49 90 FE            [ 2] 4155     ldw y,(y)
      009A4B FF               [ 2] 4156     ldw (x),y 
      009A4C 90 BE 26         [ 2] 4157     ldw y,YTEMP 
      009A4F 90 EE 02         [ 2] 4158     ldw y,(2,y)
      009A52 EF 02            [ 2] 4159     ldw (2,x),y 
      009A54 81               [ 4] 4160     ret 
                                   4161 
                                   4162 ;; Tools
                                   4163 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4164 ;       _TYPE   ( b u -- )
                                   4165 ;       Display a string. Filter
                                   4166 ;       non-printing characters.
                                   4167 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0019D5                       4168         _HEADER UTYPE,5,"_TYPE"
      009A55 9A 14                    1         .word LINK 
                           0019D7     2         LINK=.
      009A57 05                       3         .byte 5  
      009A58 5F 54 59 50 45           4         .ascii "_TYPE"
      009A5D                          5         UTYPE:
      009A5D CD 86 62         [ 4] 4169         CALL     TOR     ;start count down loop
      009A60 20 0F            [ 2] 4170         JRA     UTYP2   ;skip first pass
      009A62 CD 86 99         [ 4] 4171 UTYP1:  CALL     DUPP
      009A65 CD 85 81         [ 4] 4172         CALL     CAT
      009A68 CD 8C AD         [ 4] 4173         CALL     TCHAR
      009A6B CD 84 B6         [ 4] 4174         CALL     EMIT    ;display only printable
      009A6E CD 8C 17         [ 4] 4175         CALL     ONEP    ;increment address
      009A71 CD 85 03         [ 4] 4176 UTYP2:  CALL     DONXT
      009A74 9A 62                 4177         .word      UTYP1   ;loop till done
      009A76 CC 86 8F         [ 2] 4178         JP     DROP
                                   4179 
                                   4180 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4181 ;       dm+     ( a u -- a )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



                                   4182 ;       Dump u bytes from ,
                                   4183 ;       leaving a+u on  stack.
                                   4184 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0019F9                       4185         _HEADER DUMPP,3,"DM+"
      009A79 9A 57                    1         .word LINK 
                           0019FB     2         LINK=.
      009A7B 03                       3         .byte 3  
      009A7C 44 4D 2B                 4         .ascii "DM+"
      009A7F                          5         DUMPP:
      009A7F CD 86 C1         [ 4] 4186         CALL     OVER
      009A82 CD 84 EF         [ 4] 4187         CALL     DOLIT
      009A85 00 04                 4188         .word      4
      009A87 CD 90 5F         [ 4] 4189         CALL     UDOTR   ;display address
      009A8A CD 8F C7         [ 4] 4190         CALL     SPACE
      009A8D CD 86 62         [ 4] 4191         CALL     TOR     ;start count down loop
      009A90 20 11            [ 2] 4192         JRA     PDUM2   ;skip first pass
      009A92 CD 86 99         [ 4] 4193 PDUM1:  CALL     DUPP
      009A95 CD 85 81         [ 4] 4194         CALL     CAT
      009A98 CD 84 EF         [ 4] 4195         CALL     DOLIT
      009A9B 00 03                 4196         .word      3
      009A9D CD 90 5F         [ 4] 4197         CALL     UDOTR   ;display numeric data
      009AA0 CD 8C 17         [ 4] 4198         CALL     ONEP    ;increment address
      009AA3 CD 85 03         [ 4] 4199 PDUM2:  CALL     DONXT
      009AA6 9A 92                 4200         .word      PDUM1   ;loop till done
      009AA8 81               [ 4] 4201         RET
                                   4202 
                                   4203 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4204 ;       DUMP    ( a u -- )
                                   4205 ;       Dump u bytes from a,
                                   4206 ;       in a formatted manner.
                                   4207 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001A29                       4208         _HEADER DUMP,4,"DUMP"
      009AA9 9A 7B                    1         .word LINK 
                           001A2B     2         LINK=.
      009AAB 04                       3         .byte 4  
      009AAC 44 55 4D 50              4         .ascii "DUMP"
      009AB0                          5         DUMP:
      009AB0 CD 87 5F         [ 4] 4209         CALL     BASE
      009AB3 CD 85 63         [ 4] 4210         CALL     AT
      009AB6 CD 86 62         [ 4] 4211         CALL     TOR
      009AB9 CD 8F 26         [ 4] 4212         CALL     HEX     ;save radix, set hex
      009ABC CD 84 EF         [ 4] 4213         CALL     DOLIT
      009ABF 00 10                 4214         .word      16
      009AC1 CD 8B 3D         [ 4] 4215         CALL     SLASH   ;change count to lines
      009AC4 CD 86 62         [ 4] 4216         CALL     TOR     ;start count down loop
      009AC7 CD 90 09         [ 4] 4217 DUMP1:  CALL     CR
      009ACA CD 84 EF         [ 4] 4218         CALL     DOLIT
      009ACD 00 10                 4219         .word      16
      009ACF CD 88 A7         [ 4] 4220         CALL     DDUP
      009AD2 CD 9A 7F         [ 4] 4221         CALL     DUMPP   ;display numeric
      009AD5 CD 88 5D         [ 4] 4222         CALL     ROT
      009AD8 CD 88 5D         [ 4] 4223         CALL     ROT
      009ADB CD 8F C7         [ 4] 4224         CALL     SPACE
      009ADE CD 8F C7         [ 4] 4225         CALL     SPACE
      009AE1 CD 9A 5D         [ 4] 4226         CALL     UTYPE   ;display printable characters
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



      009AE4 CD 85 03         [ 4] 4227         CALL     DONXT
      009AE7 9A C7                 4228         .word      DUMP1   ;loop till done
      009AE9 CD 86 8F         [ 4] 4229 DUMP3:  CALL     DROP
      009AEC CD 85 B4         [ 4] 4230         CALL     RFROM
      009AEF CD 87 5F         [ 4] 4231         CALL     BASE
      009AF2 CC 85 51         [ 2] 4232         JP     STORE   ;restore radix
                                   4233 
                                   4234 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4235 ;       .S      ( ... -- ... )
                                   4236 ;        Display  contents of stack.
                                   4237 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001A75                       4238         _HEADER DOTS,2,".S"
      009AF5 9A AB                    1         .word LINK 
                           001A77     2         LINK=.
      009AF7 02                       3         .byte 2  
      009AF8 2E 53                    4         .ascii ".S"
      009AFA                          5         DOTS:
      009AFA CD 90 09         [ 4] 4239         CALL     CR
      009AFD CD 8C C5         [ 4] 4240         CALL     DEPTH   ;stack depth
      009B00 CD 86 62         [ 4] 4241         CALL     TOR     ;start count down loop
      009B03 20 09            [ 2] 4242         JRA     DOTS2   ;skip first pass
      009B05 CD 85 C5         [ 4] 4243 DOTS1:  CALL     RAT
      009B08 CD 8C DC         [ 4] 4244 	CALL     PICK
      009B0B CD 90 B0         [ 4] 4245         CALL     DOT     ;index stack, display contents
      009B0E CD 85 03         [ 4] 4246 DOTS2:  CALL     DONXT
      009B11 9B 05                 4247         .word      DOTS1   ;loop till done
      009B13 CD 90 36         [ 4] 4248         CALL     DOTQP
      009B16 05                    4249         .byte      5
      009B17 20 3C 73 70 20        4250         .ascii     " <sp "
      009B1C 81               [ 4] 4251         RET
                                   4252 
                                   4253 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4254 ;       >NAME   ( ca -- na | F )
                                   4255 ;       Convert code address
                                   4256 ;       to a name address.
                                   4257 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001A9D                       4258         _HEADER TNAME,5,">NAME"
      009B1D 9A F7                    1         .word LINK 
                           001A9F     2         LINK=.
      009B1F 05                       3         .byte 5  
      009B20 3E 4E 41 4D 45           4         .ascii ">NAME"
      009B25                          5         TNAME:
      009B25 CD 87 E2         [ 4] 4259         CALL     CNTXT   ;vocabulary link
      009B28 CD 85 63         [ 4] 4260 TNAM2:  CALL     AT
      009B2B CD 86 99         [ 4] 4261         CALL     DUPP    ;?last word in a vocabulary
      009B2E CD 85 18         [ 4] 4262         CALL     QBRAN
      009B31 9B 4C                 4263         .word      TNAM4
      009B33 CD 88 A7         [ 4] 4264         CALL     DDUP
      009B36 CD 92 79         [ 4] 4265         CALL     NAMET
      009B39 CD 87 1F         [ 4] 4266         CALL     XORR    ;compare
      009B3C CD 85 18         [ 4] 4267         CALL     QBRAN
      009B3F 9B 46                 4268         .word      TNAM3
      009B41 CD 8B FB         [ 4] 4269         CALL     CELLM   ;continue with next word
      009B44 20 E2            [ 2] 4270         JRA     TNAM2
      009B46 CD 86 A9         [ 4] 4271 TNAM3:  CALL     SWAPP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



      009B49 CC 86 8F         [ 2] 4272         JP     DROP
      009B4C CD 88 9C         [ 4] 4273 TNAM4:  CALL     DDROP
      009B4F CC 8C 83         [ 2] 4274         JP     ZERO
                                   4275 
                                   4276 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4277 ;       .ID     ( na -- )
                                   4278 ;        Display  name at address.
                                   4279 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001AD2                       4280         _HEADER DOTID,3,".ID"
      009B52 9B 1F                    1         .word LINK 
                           001AD4     2         LINK=.
      009B54 03                       3         .byte 3  
      009B55 2E 49 44                 4         .ascii ".ID"
      009B58                          5         DOTID:
      009B58 CD 88 4C         [ 4] 4281         CALL     QDUP    ;if zero no name
      009B5B CD 85 18         [ 4] 4282         CALL     QBRAN
      009B5E 9B 6E                 4283         .word      DOTI1
      009B60 CD 8D 46         [ 4] 4284         CALL     COUNT
      009B63 CD 84 EF         [ 4] 4285         CALL     DOLIT
      009B66 00 1F                 4286         .word      0x1F
      009B68 CD 86 F6         [ 4] 4287         CALL     ANDD    ;mask lexicon bits
      009B6B CC 9A 5D         [ 2] 4288         JP     UTYPE
      009B6E CD 90 36         [ 4] 4289 DOTI1:  CALL     DOTQP
      009B71 09                    4290         .byte      9
      009B72 20 6E 6F 4E 61 6D 65  4291         .ascii     " noName"
      009B79 81               [ 4] 4292         RET
                                   4293 
                           000000  4294 WANT_SEE=0
                           000000  4295 .if WANT_SEE 
                                   4296 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4297 ;       SEE     ( -- ; <string> )
                                   4298 ;       A simple decompiler.
                                   4299 ;       Updated for byte machines.
                                   4300 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4301         _HEADER SEE,3,"SEE"
                                   4302         CALL     TICK    ;starting address
                                   4303         CALL     CR
                                   4304         CALL     ONEM
                                   4305 SEE1:   CALL     ONEP
                                   4306         CALL     DUPP
                                   4307         CALL     AT
                                   4308         CALL     DUPP
                                   4309         CALL     QBRAN
                                   4310         .word    SEE2
                                   4311         CALL     TNAME   ;?is it a name
                                   4312 SEE2:   CALL     QDUP    ;name address or zero
                                   4313         CALL     QBRAN
                                   4314         .word    SEE3
                                   4315         CALL     SPACE
                                   4316         CALL     DOTID   ;display name
                                   4317         CALL     ONEP
                                   4318         JRA      SEE4
                                   4319 SEE3:   CALL     DUPP
                                   4320         CALL     CAT
                                   4321         CALL     UDOT    ;display number
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



                                   4322 SEE4:   CALL     NUFQ    ;user control
                                   4323         CALL     QBRAN
                                   4324         .word    SEE1
                                   4325         JP     DROP
                                   4326 .endif ; WANT_SEE 
                                   4327 
                                   4328 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4329 ;       WORDS   ( -- )
                                   4330 ;       Display names in vocabulary.
                                   4331 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001AFA                       4332         _HEADER WORDS,5,"WORDS"
      009B7A 9B 54                    1         .word LINK 
                           001AFC     2         LINK=.
      009B7C 05                       3         .byte 5  
      009B7D 57 4F 52 44 53           4         .ascii "WORDS"
      009B82                          5         WORDS:
      009B82 CD 90 09         [ 4] 4333         CALL     CR
      009B85 CD 87 E2         [ 4] 4334         CALL     CNTXT   ;only in context
      009B88 CD 85 63         [ 4] 4335 WORS1:  CALL     AT
      009B8B CD 88 4C         [ 4] 4336         CALL     QDUP    ;?at end of list
      009B8E CD 85 18         [ 4] 4337         CALL     QBRAN
      009B91 9B A4                 4338         .word      WORS2
      009B93 CD 86 99         [ 4] 4339         CALL     DUPP
      009B96 CD 8F C7         [ 4] 4340         CALL     SPACE
      009B99 CD 9B 58         [ 4] 4341         CALL     DOTID   ;display a name
      009B9C CD 8B FB         [ 4] 4342         CALL     CELLM
      009B9F CD 85 34         [ 4] 4343         CALL     BRAN
      009BA2 9B 88                 4344         .word      WORS1
      009BA4 81               [ 4] 4345 WORS2:  RET
                                   4346 
                                   4347         
                                   4348 ;; Hardware reset
                                   4349 
                                   4350 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4351 ;  COPYRIGTH
                                   4352 ; print copyright notice 
                                   4353 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      009BA5                       4354 COPYRIGHT:
      009BA5 CD 90 36         [ 4] 4355     CALL DOTQP 
      009BA8 21                    4356     .byte 33 
      009BA9 4A 61 63 71 75 65 73  4357     .ascii "Jacques Deschenes, Copyright 2021"
             20 44 65 73 63 68 65
             6E 65 73 2C 20 43 6F
             70 79 72 69 67 68 74
             20 32 30 32 31
      009BCA CC 90 09         [ 2] 4358     JP CR 
                                   4359 
                                   4360 
                                   4361 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4362 ;  PRT_LICENCE 
                                   4363 ;  print GPLV2 licence 
                                   4364 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      009BCD                       4365 PRT_LICENCE:
      009BCD CD 90 36         [ 4] 4366         CALL DOTQP 
      009BD0 0F                    4367         .byte  15 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



      009BD1 4C 49 43 45 4E 43 45  4368         .ascii "LICENCE GPLV3\r\n"
             20 47 50 4C 56 33 0D
             0A
      009BE0 81               [ 4] 4369         RET 
                                   4370 
                                   4371 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4372 ;    PRINT_VERSION ( c1 c2 -- )
                                   4373 ;    c2 minor 
                                   4374 ;    c1 major 
                                   4375 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      009BE1                       4376 PRINT_VERSION:
      009BE1 CD 90 36         [ 4] 4377      CALL DOTQP 
      009BE4 09                    4378      .byte 9
      009BE5 20 76 65 72 73 69 6F  4379      .ascii " version "
             6E 20
      009BEE CD 8E 8B         [ 4] 4380      CALL BDIGS 
      009BF1 CD 8E C5         [ 4] 4381      CALL DIGS 
      009BF4 CD 8E C5         [ 4] 4382      CALL DIGS 
      001B77                       4383      _DOLIT '.' 
      009BF7 CD 84 EF         [ 4]    1     CALL DOLIT 
      009BFA 00 2E                    2     .word '.' 
      009BFC CD 8E 9B         [ 4] 4384      CALL HOLD 
      001B7F                       4385      _DROP 
      009BFF 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      009C02 CD 8E C5         [ 4] 4386      CALL DIGS 
      009C05 CD 8E F0         [ 4] 4387      CALL EDIGS 
      009C08 CD 8F F1         [ 4] 4388      CALL TYPES 
      009C0B 81               [ 4] 4389      RET 
                                   4390 
                                   4391 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4392 ;       hi      ( -- )
                                   4393 ;       Display sign-on message.
                                   4394 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001B8C                       4395         _HEADER HI,2,"HI"
      009C0C 9B 7C                    1         .word LINK 
                           001B8E     2         LINK=.
      009C0E 02                       3         .byte 2  
      009C0F 48 49                    4         .ascii "HI"
      009C11                          5         HI:
      009C11 CD 90 09         [ 4] 4396         CALL     CR
      009C14 CD 90 36         [ 4] 4397         CALL     DOTQP   
      009C17 0A                    4398         .byte      10
      009C18 73 74 6D 38 65 46 6F  4399         .ascii     "stm8eForth"
             72 74 68
      001BA2                       4400 	_DOLIT VER 
      009C22 CD 84 EF         [ 4]    1     CALL DOLIT 
      009C25 00 04                    2     .word VER 
      001BA7                       4401         _DOLIT EXT 
      009C27 CD 84 EF         [ 4]    1     CALL DOLIT 
      009C2A 00 00                    2     .word EXT 
      009C2C CD 9B E1         [ 4] 4402         CALL PRINT_VERSION 
      009C2F CD 90 36         [ 4] 4403         CALL    DOTQP
                           000001  4404 .if NUCLEO          
      009C32 12                    4405         .byte 18
      009C33 20 6F 6E 20 4E 55 43  4406         .ascii  " on NUCLEO-8S208RB"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal  4C-Bits]



             4C 45 4F 2D 38 53 32
             30 38 52 42
                                   4407 .endif
                           000000  4408 .if DISCOVERY
                                   4409         .byte 19
                                   4410         .ascii  " on STM8S-DISCOVERY"
                                   4411 .endif
                           000000  4412 .if DOORBELL
                                   4413         .byte 16
                                   4414         .ascii " on stm8s105k6b6"
                                   4415 .endif
      009C3B 45 4F 2D         [ 2] 4416         JP     CR
                                   4417 
                           000000  4418 WANT_DEBUG=0
                           000000  4419 .if WANT_DEBUG 
                                   4420 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4421 ;       DEBUG      ( -- )
                                   4422 ;       Display sign-on message.
                                   4423 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4424         _HEADER DEBUG,5,"DEBUG"
                                   4425 	CALL DOLIT
                                   4426 	.word 0x65
                                   4427 	CALL EMIT
                                   4428 	CALL ZERO
                                   4429  	CALL ZLESS 
                                   4430 	CALL DOLIT
                                   4431 	.word 0xFFFE
                                   4432 	CALL ZLESS 
                                   4433 	CALL UPLUS 
                                   4434  	_DROP 
                                   4435 	CALL DOLIT
                                   4436 	.word 3
                                   4437 	CALL UPLUS 
                                   4438 	CALL UPLUS 
                                   4439  	_DROP
                                   4440 	CALL DOLIT
                                   4441 	.word 0x43
                                   4442 	CALL UPLUS 
                                   4443  	_DROP
                                   4444 	CALL EMIT
                                   4445 	CALL DOLIT
                                   4446 	.word 0x4F
                                   4447 	CALL DOLIT
                                   4448 	.word 0x6F
                                   4449  	CALL XORR
                                   4450 	CALL DOLIT
                                   4451 	.word 0xF0
                                   4452  	CALL ANDD
                                   4453 	CALL DOLIT
                                   4454 	.word 0x4F
                                   4455  	CALL ORR
                                   4456 	CALL EMIT
                                   4457 	CALL DOLIT
                                   4458 	.word 8
                                   4459 	CALL DOLIT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



                                   4460 	.word 6
                                   4461  	CALL SWAPP
                                   4462 	CALL OVER
                                   4463 	CALL XORR
                                   4464 	CALL DOLIT
                                   4465 	.word 3
                                   4466 	CALL ANDD 
                                   4467 	CALL ANDD
                                   4468 	CALL DOLIT
                                   4469 	.word 0x70
                                   4470 	CALL UPLUS 
                                   4471 	_DROP
                                   4472 	CALL EMIT
                                   4473 	CALL ZERO
                                   4474 	CALL QBRAN
                                   4475 	.word DEBUG1
                                   4476 	CALL DOLIT
                                   4477 	.word 0x3F
                                   4478 DEBUG1:
                                   4479 	CALL DOLIT
                                   4480 	.word 0xFFFF
                                   4481 	CALL QBRAN
                                   4482 	.word DEBUG2
                                   4483 	CALL DOLIT
                                   4484 	.word 0x74
                                   4485 	CALL BRAN
                                   4486 	.word DEBUG3
                                   4487 DEBUG2:
                                   4488 	CALL DOLIT
                                   4489 	.word 0x21
                                   4490 DEBUG3:
                                   4491 	CALL EMIT
                                   4492 	CALL DOLIT
                                   4493 	.word 0x68
                                   4494 	CALL DOLIT
                                   4495 	.word 0x80
                                   4496 	CALL STORE
                                   4497 	CALL DOLIT
                                   4498 	.word 0x80
                                   4499 	CALL AT
                                   4500 	CALL EMIT
                                   4501 	CALL DOLIT
                                   4502 	.word 0x4D
                                   4503 	CALL TOR
                                   4504 	CALL RAT
                                   4505 	CALL RFROM
                                   4506 	CALL ANDD
                                   4507 	CALL EMIT
                                   4508 	CALL DOLIT
                                   4509 	.word 0x61
                                   4510 	CALL DOLIT
                                   4511 	.word 0xA
                                   4512 	CALL TOR
                                   4513 DEBUG4:
                                   4514 	CALL ONE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



                                   4515 	CALL UPLUS 
                                   4516 	_DROP
                                   4517 	CALL DONXT
                                   4518 	.word DEBUG4
                                   4519 	CALL EMIT
                                   4520 	CALL DOLIT
                                   4521 	.word 0x656D
                                   4522 	CALL DOLIT
                                   4523 	.word 0x100
                                   4524 	CALL UMSTA
                                   4525 	CALL SWAPP
                                   4526 	CALL DOLIT
                                   4527 	.word 0x100
                                   4528 	CALL UMSTA
                                   4529 	CALL SWAPP 
                                   4530 	_DROP
                                   4531 	CALL EMIT
                                   4532 	CALL EMIT
                                   4533 	CALL DOLIT
                                   4534 	.word 0x2043
                                   4535 	CALL ZERO
                                   4536 	CALL DOLIT
                                   4537 	.word 0x100
                                   4538 	CALL UMMOD
                                   4539 	CALL EMIT
                                   4540 	CALL EMIT
                                   4541 	;JP ORIG
                                   4542 	RET
                                   4543 .endif ; WANT_DEBUG 
                                   4544 
                                   4545 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4546 ;       'BOOT   ( -- a )
                                   4547 ;       The application startup vector.
                                   4548 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001BC8                       4549         _HEADER TBOOT,5,"'BOOT"
      009C3E 38 53                    1         .word LINK 
                           001BCA     2         LINK=.
      009C40 32                       3         .byte 5  
      009C41 30 38 52 42 CC           4         .ascii "'BOOT"
      001BD0                          5         TBOOT:
      009C46 90 09 9C         [ 4] 4550         CALL     DOVAR
      009C49 0E 05                 4551         .word    APP_RUN      ;application to boot
                                   4552 
                                   4553 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4554 ;       COLD    ( -- )
                                   4555 ;       The hilevel cold start s=ence.
                                   4556 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001BD5                       4557         _HEADER COLD,4,"COLD"
      009C4B 27 42                    1         .word LINK 
                           001BD7     2         LINK=.
      009C4D 4F                       3         .byte 4  
      009C4E 4F 54 4C 44              4         .ascii "COLD"
      009C50                          5         COLD:
                           000000  4558 .if WANT_DEBUG
                                   4559         CALL DEBUG
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



                                   4560 .endif ; WANT_DEBUG
      009C50 CD 87 4F         [ 4] 4561 COLD1:  CALL     DOLIT
      009C53 40 02                 4562         .word      UZERO
      009C55 9C 4A 04         [ 4] 4563 	CALL     DOLIT
      009C58 43 4F                 4564         .word      UPP
      009C5A 4C 44 6F         [ 4] 4565         CALL     DOLIT
      009C5C 00 1C                 4566 	.word      UEND-UZERO
      009C5C CD 84 EF         [ 4] 4567         CALL     CMOVE   ;initialize user area
                           000001  4568 .if WANT_FLOAT 
      009C5F 80 AB CD         [ 4] 4569         CALL    FINIT 
                                   4570 .endif 
                                   4571 ; if APP_RUN==0 initialize with ca de 'hi'  
      009C62 84 EF 00 06      [ 2] 4572         ldw y,APP_RUN 
      009C66 CD 84            [ 1] 4573         jrne 0$
      009C68 EF 00 1C         [ 2] 4574         subw x,#CELLL 
      009C6B CD 8D AA CD      [ 2] 4575         ldw y,#HI  
      009C6F AD               [ 2] 4576         ldw (x),y
      009C70 07 90 CE         [ 4] 4577         call UPDATRUN 
      001C02                       4578 0$:        
                                   4579 ; update LAST with APP_LAST 
                                   4580 ; if APP_LAST > LAST else do the opposite
      009C73 40 02 26 0B      [ 2] 4581         ldw y,APP_LAST 
      009C77 1D 00 02         [ 2] 4582         cpw y,ULAST 
      009C7A 90 AE            [ 1] 4583         jrugt 1$ 
                                   4584 ; save LAST at APP_LAST  
      009C7C 9C 11 FF         [ 4] 4585         call UPDATLAST 
      009C7F CD 9D            [ 2] 4586         jra 2$
      001C10                       4587 1$: ; update LAST with APP_LAST 
      009C81 7A BF 1C         [ 2] 4588         ldw ULAST,y
      009C82 90 BF 16         [ 2] 4589         ldw UCNTXT,y
      001C16                       4590 2$:  
                                   4591 ; update APP_CP if < app_space 
      009C82 90 CE 40 00      [ 2] 4592         ldw y,APP_CP  
      009C86 90 B3 1C         [ 2] 4593         cpw y,UCP   
      009C89 22 05            [ 1] 4594         jruge 3$ 
      009C8B CD 9D 62         [ 4] 4595         call UPDATCP
      009C8E 20 06 1A         [ 2] 4596         ldw y,UCP   
      009C90                       4597 3$:
      009C90 90 BF 1C         [ 2] 4598         ldw UCP,y                 
                                   4599 ; update UVP with APP_VP  
                                   4600 ; if APP_VP>UVP else do the opposite 
      009C93 90 BF 16 06      [ 2] 4601         ldw y,APP_VP 
      009C96 90 B3 18         [ 2] 4602         cpw y,UVP 
      009C96 90 CE            [ 1] 4603         jrugt 4$
      009C98 40 04 90         [ 4] 4604         call UPDATVP 
      009C9B B3 1A            [ 2] 4605         jra 6$
      001C36                       4606 4$: ; update UVP with APP_VP 
      009C9D 24 06 CD         [ 2] 4607         ldw UVP,y 
      001C39                       4608 6$:      
      009CA0 9D 8B 90         [ 4] 4609         CALL     PRESE   ;initialize data stack and TIB
      009CA3 BE 1A D0         [ 4] 4610         CALL     TBOOT
      009CA5 CD 0D 13         [ 4] 4611         CALL     ATEXE   ;application boot
      009CA5 90 BF 1A         [ 4] 4612         CALL     OVERT
      009CA8 90 CE 40         [ 2] 4613         JP     QUIT    ;start interpretation
                                   4614 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



                                   4615 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]



                                   4616         .include "flash.asm"
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
      009CAB 06 90                   31     .word LINK 
                           001C4A    32     LINK=.
      009CAD B3                      33     .byte 3 
      009CAE 18 22 05                34     .ascii "FP!"
      001C4E                         35 FPSTOR:
      009CB1 CD 9D            [ 1]   36     ldw y,x
      009CB3 A2 20            [ 2]   37     ldw y,(y)
      009CB5 03 9F            [ 1]   38     ld a,yl 
      009CB6 B7 34            [ 1]   39     ld FPTR,a 
      009CB6 90 BF 18         [ 2]   40     addw x,#CELLL 
      009CB9 90 93            [ 1]   41     ldw y,x 
      009CB9 CD 95            [ 2]   42     ldw y,(y)
      009CBB 5C CD 9C         [ 2]   43     ldw PTR16,y
      009CBE 50 CD 8D         [ 2]   44     addw x,#CELLL 
      009CC1 93               [ 4]   45     ret 
                                     46 
                                     47 ;-----------------------------------
                                     48 ; return EEPROM base address 
                                     49 ; as a double 
                                     50 ;  EEPROM  ( -- ud )
                                     51 ;-----------------------------------
      009CC2 CD 98                   52     .word LINK 
                           001C66    53 LINK=.
      009CC4 35                      54     .byte 6 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]



      009CC5 CC 95 79 9C 57 03       55     .ascii "EEPROM"
      001C6D                         56 EEPROM: 
      009CCB 46 50 21 00      [ 2]   57     ldw y,#EEPROM_BASE
      009CCE 1D 00 04         [ 2]   58     subw x,#2*CELLL 
      009CCE 90 93            [ 2]   59     ldw (2,x),y 
      009CD0 90 FE            [ 1]   60     clrw y 
      009CD2 90               [ 2]   61     ldw (x),y 
      009CD3 9F               [ 4]   62     ret
                                     63 
                                     64 ;---------------------------------
                                     65 ; return APP_LAST pointer as double
                                     66 ; EEP-LAST ( -- ud )
                                     67 ;---------------------------------
      009CD4 B7 34                   68 	.word LINK 
                           001C7C    69 	LINK=.
      009CD6 1C                      70 	.byte 8 
      009CD7 00 02 90 93 90 FE 90    71 	.ascii "EEP-LAST"
             BF
      001C85                         72 EEPLAST:
      009CDF 35 1C 00         [ 2]   73 	subw x,#2*CELLL 
      009CE2 02 81 9C CA      [ 2]   74 	ldw y,#APP_LAST 
      009CE6 06 45            [ 2]   75 	ldw (2,x),y 
      009CE8 45 50            [ 1]   76 	clrw y 
      009CEA 52               [ 2]   77 	ldw (x),y 
      009CEB 4F               [ 4]   78 	ret 
                                     79 
                                     80 ;----------------------------------
                                     81 ; return APP_RUN pointer as double	
                                     82 ; EEP-RUN ( -- ud )
                                     83 ;-----------------------------------
      009CEC 4D 7C                   84 	.word LINK 
                           001C94    85 	LINK=.
      009CED 07                      86 	.byte 7
      009CED 90 AE 40 00 1D 00 04    87 	.ascii "EEP-RUN"
      001C9C                         88 EEPRUN:
      009CF4 EF 02 90         [ 2]   89 	subw x,#2*CELLL 
      009CF7 5F FF 81 9C      [ 2]   90 	ldw y,#APP_RUN 
      009CFB E6 08            [ 2]   91 	ldw (2,x),y 
      009CFD 45 45            [ 1]   92 	clrw y 
      009CFF 50               [ 2]   93 	ldw (x),y 
      009D00 2D               [ 4]   94 	ret 
                                     95 
                                     96 ;------------------------------------
                                     97 ; return APP_CP pointer as double 
                                     98 ; EEP-CP ( -- ud )
                                     99 ;------------------------------------
      009D01 4C 41                  100 	.word LINK
                           001CAB   101 	LINK=.
      009D03 53                     102 	.byte 6 
      009D04 54 45 50 2D 43 50      103 	.ascii "EEP-CP"
      009D05                        104 EEPCP:
      009D05 1D 00 04         [ 2]  105 	subw x,#2*CELLL 
      009D08 90 AE 40 00      [ 2]  106 	ldw y,#APP_CP  
      009D0C EF 02            [ 2]  107 	ldw (2,x),y 
      009D0E 90 5F            [ 1]  108 	clrw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]



      009D10 FF               [ 2]  109 	ldw (x),y 
      009D11 81               [ 4]  110 	ret 
                                    111 
                                    112 ;------------------------------------
                                    113 ; return APP_VP pointer as double 
                                    114 ; EEP-VP ( -- ud )
                                    115 ;-------------------------------------
      009D12 9C FC                  116 	.word LINK
                           001CC1   117 	LINK=.
      009D14 07                     118 	.byte 6
      009D15 45 45 50 2D 52 55      119 	.ascii "EEP-VP"
      001CC8                        120 EEPVP:
      009D1B 4E 00 04         [ 2]  121 	subw x,#2*CELLL 
      009D1C 90 AE 40 06      [ 2]  122 	ldw y,#APP_VP  
      009D1C 1D 00            [ 2]  123 	ldw (2,x),y 
      009D1E 04 90            [ 1]  124 	clrw y 
      009D20 AE               [ 2]  125 	ldw (x),y 
      009D21 40               [ 4]  126 	ret 
                                    127 
                                    128 ;----------------------------------
                                    129 ; update APP_LAST with LAST 
                                    130 ; UPDAT-LAST ( -- )
                                    131 ;----------------------------------
      009D22 02 EF                  132 	.word LINK 
                           001CD7   133 	LINK=.
      009D24 02                     134 	.byte 10
      009D25 90 5F FF 81 9D 14 06   135 	.ascii "UPDAT-LAST"
             45 45 50
      001CE2                        136 UPDATLAST:
      009D2F 2D 43 50         [ 4]  137 	call LAST
      009D32 CD 04 E3         [ 4]  138 	call AT  
      009D32 1D 00 04         [ 4]  139 	call EEPLAST
      009D35 90 AE 40         [ 2]  140 	jp EESTORE 
                                    141 
                                    142 ;---------------------------------
                                    143 ; update APP_RUN 
                                    144 ; UPDAT-RUN ( a -- )
                                    145 ;---------------------------------
      009D38 04 EF                  146 	.word LINK
                           001CF0   147 	LINK=.
      009D3A 02                     148 	.byte 9
      009D3B 90 5F FF 81 9D 2B 06   149 	.ascii "UPDAT-RUN"
             45 45
      001CFA                        150 UPDATRUN:
      009D44 50 2D 56         [ 4]  151 	call EEPRUN
      009D47 50 1E D8         [ 2]  152 	jp EESTORE 
                                    153 	
                                    154 ;---------------------------------
                                    155 ; update APP_CP with CP 
                                    156 ; UPDAT-CP ( -- )
                                    157 ;---------------------------------
      009D48 1C F0                  158 	.word LINK 
                           001D02   159 	LINK=.
      009D48 1D                     160 	.byte 8 
      009D49 00 04 90 AE 40 06 EF   161 	.ascii "UPDAT-CP"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal  02-Bits]



             50
      001D0B                        162 UPDATCP:
      009D51 90 5F FF         [ 4]  163 	call CPP 
      009D54 81 9D 41         [ 4]  164 	call AT 
      009D57 0A 55 50         [ 4]  165 	call EEPCP 
      009D5A 44 41 54         [ 2]  166 	jp EESTORE 
                                    167 
                                    168 ;----------------------------------
                                    169 ; update APP_VP with VP 
                                    170 ; UPDAT-VP ( -- )
                                    171 ;----------------------------------
      009D5D 2D 4C                  172 	.word LINK
                           001D19   173 	LINK=.
      009D5F 41                     174 	.byte 8 
      009D60 53 54 44 41 54 2D 56   175 	.ascii "UPDAT-VP" 
             50
      009D62                        176 UPDATVP:
      009D62 CD 88 0E         [ 4]  177 	call VPP 
      009D65 CD 85 63         [ 4]  178 	call AT
      009D68 CD 9D 05         [ 4]  179 	call EEPVP 
      009D6B CC 9F 58         [ 2]  180 	jp EESTORE
                                    181 	
                           000001   182 .if NUCLEO
                                    183 ;----------------------------------
                                    184 ; fetch integer at address over 65535
                                    185 ;  F@   ( ud -- n )
                                    186 ;----------------------------------
      009D6E 9D 57                  187     .word LINK 
                           001D30   188 LINK=.
      009D70 09                     189     .byte 2
      009D71 55 50                  190     .ascii "F@"
      001D33                        191 FARAT:
      009D73 44 41 54         [ 4]  192     call FPSTOR
      009D76 2D 52 55         [ 2]  193 	jp EE_READ 
                                    194 
                                    195 
                                    196 ;-------------------------------------
                                    197 ; fetch C at address over 65535 
                                    198 ; FC@ ( ud -- c)
                                    199 ;-------------------------------------
      009D79 4E 30                  200     .word LINK
                           001D3B   201     LINK=.
      009D7A 03                     202     .byte 3 
      009D7A CD 9D 1C               203     .ascii "FC@" 
      001D3F                        204 FARCAT:
      009D7D CC 9F 58         [ 4]  205     call FPSTOR
      009D80 9D 70 08         [ 2]  206 	jp EE_CREAD  
                                    207 .endif ; NUCLEO 
                                    208 
                                    209 ;----------------------------------
                                    210 ; UNLOCK EEPROM/OPT for writing/erasing
                                    211 ; wait endlessly for FLASH_IAPSR_DUL bit.
                                    212 ;  UNLKEE   ( -- )
                                    213 ;----------------------------------
      009D83 55 50                  214     .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]



                           001D47   215 LINK=.
      009D85 44                     216     .byte 6 
      009D86 41 54 2D 43 50 45      217     .ascii "UNLKEE"
      009D8B                        218 UNLKEE:
      009D8B CD 87 FE CD      [ 1]  219 	mov FLASH_CR2,#0 
      009D8F 85 63 CD 9D      [ 1]  220 	mov FLASH_NCR2,#0xFF 
      009D93 32 CC 9F 58      [ 1]  221 	mov FLASH_DUKR,#FLASH_DUKR_KEY1
      009D97 9D 82 08 55      [ 1]  222     mov FLASH_DUKR,#FLASH_DUKR_KEY2
      009D9B 50 44 41 54 2D   [ 2]  223 	btjf FLASH_IAPSR,#FLASH_IAPSR_DUL,.
      009DA0 56               [ 4]  224 	ret
                                    225 
                                    226 ;----------------------------------
                                    227 ; UNLOCK FLASH for writing/erasing
                                    228 ; wait endlessly for FLASH_IAPSR_PUL bit.
                                    229 ; UNLKFL  ( -- )
                                    230 ;----------------------------------
      009DA1 50 47                  231     .word LINK 
                           001D66   232 LINK=. 
      009DA2 06                     233     .byte 6 
      009DA2 CD 87 F0 CD 85 63      234     .ascii "UNLKFL"    
      001D6D                        235 UNLKFL:
      009DA8 CD 9D 48 CC      [ 1]  236 	mov FLASH_CR2,#0 
      009DAC 9F 58 9D 99      [ 1]  237 	mov FLASH_NCR2,#0xFF 
      009DB0 02 46 40 62      [ 1]  238 	mov FLASH_PUKR,#FLASH_PUKR_KEY1
      009DB3 35 AE 50 62      [ 1]  239 	mov FLASH_PUKR,#FLASH_PUKR_KEY2
      009DB3 CD 9C CE CC 9E   [ 2]  240 	btjf FLASH_IAPSR,#FLASH_IAPSR_PUL,.
      009DB8 7B               [ 4]  241 	ret
                                    242 
                                    243 ;-----------------------------
                                    244 ; UNLOCK FLASH or EEPROM 
                                    245 ; according to FPTR address 
                                    246 ;  UNLOCK ( -- )
                                    247 ;-----------------------------
      009DB9 9D B0                  248 	.word LINK 
                           001D85   249 	LINK=.
      009DBB 03                     250 	.byte 6
      009DBC 46 43 40 4F 43 4B      251 	.ascii "UNLOCK"
      009DBF                        252 UNLOCK:
                                    253 ; put addr[15:0] in Y, for bounds check.
      009DBF CD 9C CE         [ 2]  254 	ldw y,PTR16   ; Y=addr15:0
                                    255 ; check addr[23:16], if <> 0 then it is extened flash memory
      009DC2 CC 9E            [ 1]  256 	tnz FPTR 
      009DC4 9D 9D            [ 1]  257 	jrne 4$
      009DC6 BB 06 55 4E      [ 2]  258     cpw y,#FLASH_BASE
      009DCA 4C 4B            [ 1]  259     jruge 4$
      009DCC 45 45 40 00      [ 2]  260 	cpw y,#EEPROM_BASE  
      009DCE 25 0D            [ 1]  261     jrult 9$
      009DCE 35 00 50 5B      [ 2]  262 	cpw y,#OPTION_END 
      009DD2 35 FF            [ 1]  263 	jrugt 9$
      009DD4 50 5C 35         [ 4]  264 	call UNLKEE
      009DD7 AE               [ 4]  265 	ret 
      009DD8 50 64 35         [ 4]  266 4$: call UNLKFL
      009DDB 56               [ 4]  267 9$: ret 
                                    268 
                                    269 ;-------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
Hexadecimal [24-Bits]



                                    270 ; LOCK write access to 
                                    271 ; FLASH and EEPROM 
                                    272 ; LOCK ( -- )
                                    273 ;-------------------------
      009DDC 50 64                  274 	.word LINK 
                           001DAF   275 	LINK=.
      009DDE 72                     276 	.byte 4 
      009DDF 07 50 5F FB            277 	.ascii "LOCK" 
      001DB4                        278 LOCK: 
      009DE3 81 9D C7 06      [ 1]  279 	bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      009DE7 55 4E 4C 4B      [ 1]  280 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      009DEB 46               [ 4]  281 	ret 
                                    282 
                                    283 ;-------------------------
                                    284 ; increment FPTR 
                                    285 ; INC-FPTR ( -- )
                                    286 ;-------------------------
      009DEC 4C AF                  287 	.word LINK 
                           001DBF   288 	LINK=. 
      009DED 08                     289 	.byte 8 
      009DED 35 00 50 5B 35 FF 50   290 	.ascii "INC-FPTR" 
             5C
      001DC8                        291 INC_FPTR:
      009DF5 35 56            [ 1]  292 	inc PTR8 
      009DF7 50 62            [ 1]  293 	jrne 1$
      009DF9 35 AE            [ 2]  294 	pushw y 
      009DFB 50 62 72         [ 2]  295 	ldw y,FPTR 
      009DFE 03 50            [ 1]  296 	incw y 
      009E00 5F FB 81         [ 2]  297 	ldw FPTR,y
      009E03 9D E6            [ 2]  298 	popw y  
      009E05 06               [ 4]  299 1$: ret 
                                    300 
                                    301 ;------------------------------
                                    302 ; add u to FPTR 
                                    303 ; PTR+ ( u -- )
                                    304 ;------------------------------
      009E06 55 4E                  305 	.word LINK 
                           001DDB   306 	LINK=.
      009E08 4C                     307 	.byte 4 
      009E09 4F 43 4B 2B            308 	.ascii "PTR+"
      009E0C                        309 PTRPLUS:
      009E0C 90 BE            [ 1]  310 	ldw y,x 
      009E0E 35 3D 34         [ 2]  311 	addw x,#CELLL 
      009E11 26 16 90 A3      [ 2]  312 	addw y,PTR16 
      009E15 80 00 24         [ 2]  313 	ldw PTR16,y  
      009E18 10 90            [ 1]  314 	jrnc 1$
      009E1A A3 40            [ 1]  315 	inc FPTR 
      009E1C 00               [ 4]  316 1$: ret 
                                    317 
                                    318 ;---------------------------------
                                    319 ; read word at address pointed FPTR
                                    320 ; increment FPTR 
                                    321 ; EE-READ ( -- w )
                                    322 ;------------------------------------
      009E1D 25 0D                  323 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
Hexadecimal [24-Bits]



                           001DF3   324 	LINK=.
      009E1F 90                     325 	.byte 7 
      009E20 A3 48 7F 22 07 CD 9D   326 	.ascii "EE-READ"
      001DFB                        327 EE_READ:
      009E27 CE 81 CD         [ 2]  328 	subw x,#CELLL 
      009E2A 9D ED 81 9E      [ 5]  329 	ldf a,[FPTR]
      009E2E 05 04            [ 1]  330 	ld yh,a 
      009E30 4C 4F 43         [ 4]  331 	call INC_FPTR 
      009E33 4B BC 00 34      [ 5]  332 	ldf a,[FPTR]
      009E34 CD 1D C8         [ 4]  333 	call INC_FPTR 
      009E34 72 13            [ 1]  334 	ld yl,a 
      009E36 50               [ 2]  335 	ldw (x),y 
      009E37 5F               [ 4]  336 	ret 
                                    337 
                                    338 ;---------------------------------------
                                    339 ; Read byte at address pointed by FPTR 
                                    340 ; EE-CREAD ( -- c )
                                    341 ;---------------------------------------
      009E38 72 17                  342 	.word LINK 
                           001E14   343 	LINK=.
      009E3A 50                     344 	.byte 8
      009E3B 5F 81 9E 2F 08 49 4E   345 	.ascii "EE-CREAD" 
             43
      001E1D                        346 EE_CREAD:
      009E43 2D 46 50         [ 2]  347 	subw x,#CELLL 
      009E46 54 52 00 34      [ 5]  348 	ldf a,[FPTR]	
      009E48 CD 1D C8         [ 4]  349 	call INC_FPTR
      009E48 3C 36            [ 1]  350 	clrw y 
      009E4A 26 0C            [ 1]  351 	ld yl,a 
      009E4C 90               [ 2]  352 	ldw (x),y 
      009E4D 89               [ 4]  353 	ret 
                                    354 
                                    355 ;----------------------------
                                    356 ; write a byte at address pointed 
                                    357 ; by FPTR and increment FPTR.
                                    358 ; Expect pointer already initialized 
                                    359 ; and memory unlocked 
                                    360 ; WR-BYTE ( c -- )
                                    361 ;----------------------------
      009E4E 90 BE                  362 	.word LINK 
                           001E2F   363 	LINK=. 
      009E50 34                     364 	.byte 7 
      009E51 90 5C 90 BF 34 90 85   365 	.ascii "WR-BYTE" 
                                    366 
      001E37                        367 WR_BYTE:
      009E58 81 9E 3F         [ 4]  368 	call FC_XOFF
      009E5B 04 50            [ 1]  369 	ldw y,x 
      009E5D 54 52            [ 2]  370 	ldw y,(y)
      009E5F 2B 00 02         [ 2]  371 	addw x,#CELLL 
      009E60 90 9F            [ 1]  372 	ld a,yl
      009E60 90 93 1C 00      [ 4]  373 	ldf [FPTR],a
      009E64 02 72 B9 00 35   [ 2]  374 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009E69 90 BF 35         [ 4]  375 	call FC_XON
      009E6C 24 02 3C         [ 2]  376 	jp INC_FPTR 
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
      009E6F 34 81                  385 	.word LINK 
                           001E54   386 	LINK=.
      009E71 9E                     387 	.byte 7 
      009E72 5B 07 45 45 2D 52 45   388 	.ascii "WR-WORD" 
      001E5C                        389 WR_WORD:
      009E79 41 44 63         [ 4]  390 	call FC_XOFF
      009E7B 90 93            [ 1]  391 	ldw y,x
      009E7B 1D 00            [ 2]  392 	ldw y,(y)
      009E7D 02 92 BC         [ 2]  393 	addw x,#CELLL 
      009E80 00 34            [ 1]  394 	ld a,yh 
      009E82 90 95 CD 9E      [ 4]  395 	ldf [FPTR],a
      009E86 48 92 BC 00 34   [ 2]  396 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009E8B CD 9E 48         [ 4]  397 	call INC_FPTR 
      009E8E 90 97            [ 1]  398 	ld a,yl 
      009E90 FF 81 9E 73      [ 4]  399 	ldf [FPTR],a
      009E94 08 45 45 2D 43   [ 2]  400 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009E99 52 45 41         [ 4]  401 	call FC_XON
      009E9C 44 1D C8         [ 2]  402 	jp INC_FPTR 
                                    403 
                                    404 
                                    405 ;---------------------------------------
                                    406 ; write a byte to FLASH or EEPROM/OPTION  
                                    407 ; EEC!  (c ud -- )
                                    408 ;---------------------------------------
      009E9D 1E 54                  409     .word LINK 
                           001E87   410 	LINK=.
      009E9D 1D                     411     .byte 4 
      009E9E 00 02 92 BC            412     .ascii "EEC!"
                                    413 	; local variables 
                           000001   414 	BTW = 1   ; byte to write offset on stack
                           000002   415     OPT = 2 
                           000002   416 	VSIZE = 2
      001E8C                        417 EECSTORE:
      009EA2 00 34            [ 2]  418 	sub sp,#VSIZE
      009EA4 CD 9E 48         [ 4]  419     call FPSTOR
      009EA7 90 5F            [ 1]  420 	ld a,(1,x)
      009EA9 90               [ 1]  421 	cpl a 
      009EAA 97 FF            [ 1]  422 	ld (BTW,sp),a ; byte to write 
      009EAC 81 9E            [ 1]  423 	clr (OPT,sp)  ; OPTION flag
      009EAE 94 07 57         [ 4]  424 	call UNLOCK 
                                    425 	; check if option
      009EB1 52 2D            [ 1]  426 	tnz FPTR 
      009EB3 42 59            [ 1]  427 	jrne 2$
      009EB5 54 45 35         [ 2]  428 	ldw y,PTR16 
      009EB7 90 A3 48 00      [ 2]  429 	cpw y,#OPTION_BASE
      009EB7 CD 84            [ 1]  430 	jrmi 2$
      009EB9 E3 90 93 90      [ 2]  431 	cpw y,#OPTION_END+1
      009EBD FE 1C            [ 1]  432 	jrpl 2$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]



      009EBF 00 02            [ 1]  433 	cpl (OPT,sp)
                                    434 	; OPTION WRITE require this UNLOCK 
      009EC1 90 9F 92 BD      [ 1]  435     bset FLASH_CR2,#FLASH_CR2_OPT
      009EC5 00 34 72 05      [ 1]  436     bres FLASH_NCR2,#FLASH_CR2_OPT 
      001EB8                        437 2$: 
      009EC9 50 5F FB         [ 4]  438 	call WR_BYTE 	
      009ECC CD 84            [ 1]  439 	tnz (OPT,sp)
      009ECE CD CC            [ 1]  440 	jreq 3$ 
      009ED0 9E 48            [ 1]  441     ld a,(BTW,sp)
      009ED2 9E AF            [ 1]  442     clrw y
      009ED4 07 57            [ 1]  443 	ld yl,a 
      009ED6 52 2D 57         [ 2]  444 	subw x,#CELLL 
      009ED9 4F               [ 2]  445 	ldw (x),y 
      009EDA 52 44 37         [ 4]  446 	call WR_BYTE
      009EDC                        447 3$: 
      009EDC CD 84 E3         [ 4]  448 	call LOCK 
      009EDF 90 93            [ 2]  449 	addw sp,#VSIZE 
      009EE1 90               [ 4]  450     ret
                                    451 
                                    452 ;------------------------------
                                    453 ; write integer in FLASH|EEPROM
                                    454 ; EE! ( n ud -- )
                                    455 ;------------------------------
      009EE2 FE 1C                  456 	.word LINK 
                           001ED4   457 	LINK=.
      009EE4 00                     458 	.byte 3 
      009EE5 02 90 9E               459 	.ascii "EE!"
      001ED8                        460 EESTORE:
      009EE8 92 BD 00         [ 4]  461 	call FPSTOR 
      009EEB 34 72 05         [ 4]  462 	call UNLOCK 
      009EEE 50 5F            [ 1]  463 	ldw y,x 
      009EF0 FB CD            [ 2]  464 	ldw y,(y)
      009EF2 9E 48            [ 2]  465 	pushw y 
      009EF4 90 9F            [ 1]  466 	swapw y 
      009EF6 92               [ 2]  467 	ldw (x),y 
      009EF7 BD 00 34         [ 4]  468 	call WR_BYTE 
      009EFA 72 05            [ 2]  469 	popw y 
      009EFC 50 5F FB         [ 2]  470 	subw x,#CELLL
      009EFF CD               [ 2]  471 	ldw (x),y 
      009F00 84 CD CC         [ 4]  472 	call WR_BYTE
      009F03 9E 48 9E         [ 2]  473 	jp LOCK 
                                    474 
                                    475 
                                    476 ;----------------------------
                                    477 ; Erase flash memory row 
                                    478 ; stm8s208 as 128 bytes rows
                                    479 ; ROW-ERASE ( ud -- )
                                    480 ;----------------------------
      009F06 D4 04                  481 	.word LINK 
                           001EF8   482 	LINK=. 
      009F08 45                     483 	.byte 9 
      009F09 45 43 21 2D 45 52 41   484 	.ascii "ROW-ERASE" 
             53 45
      009F0C                        485 row_erase:
      009F0C 52 02 CD         [ 4]  486 	call FC_XOFF
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]



      009F0F 9C CE E6         [ 4]  487 	call FPSTOR
                                    488 ;code must be execute from RAM 
                                    489 ;copy routine to PAD 
      009F12 01 43 6B         [ 2]  490 	subw x,#CELLL 
      009F15 01 0F 02 CD      [ 2]  491 	ldw y,#row_erase_proc
      009F19 9E               [ 2]  492 	ldw (x),y 
      009F1A 0C 3D 34         [ 4]  493 	call PAD 
      009F1D 26 19 90 BE      [ 2]  494 	ldw y,#row_erase_proc_end 
      009F21 35 90 A3 48      [ 2]  495 	subw y,#row_erase_proc
      009F25 00 2B 10         [ 2]  496 	subw x,#CELLL 
      009F28 90               [ 2]  497 	ldw (x),y 
      009F29 A3 48 80         [ 4]  498 	call CMOVE 
      001F22                        499 block_erase:
      009F2C 2A 0A 03         [ 2]  500 	ldw y,FPTR+1
      009F2F 02 72 1E 50      [ 2]  501 	cpw y,#app_space 
      009F33 5B 72            [ 1]  502 	jrpl erase_flash 
                                    503 ; erase EEPROM block
      009F35 1F 50 5C 00      [ 2]  504 	cpw y,#EEPROM_BASE 
      009F38 24 04            [ 1]  505 	jruge 1$
      009F38 CD 9E B7         [ 4]  506 	call FC_XON
      009F3B 0D               [ 4]  507 	ret ; bad address 
      009F3C 02 27 0D 7B      [ 2]  508 1$: cpw y,#EEPROM_END 
      009F40 01 90            [ 2]  509 	jrule 2$ 
      009F42 5F 90 97         [ 4]  510 	call FC_XON
      009F45 1D               [ 4]  511 	ret ; bad address 
      001F3F                        512 2$:	
      009F46 00 02 FF         [ 4]  513 	call UNLKEE 
      009F49 CD 9E            [ 2]  514 	jra proceed_erase
                                    515 ; erase flash block:
      001F44                        516 erase_flash:
      009F4B B7 1D 6D         [ 4]  517 	call UNLKFL 
      009F4C                        518 proceed_erase:
      009F4C CD 9E 34         [ 4]  519 	call PAD 
      009F4F 5B 02            [ 1]  520 	ldw y,x
      009F51 81 9F            [ 2]  521 	ldw y,(y)
      009F53 07 03 45         [ 2]  522 	addw x,#CELLL  
      009F56 45 21            [ 4]  523 	call (y) 
      009F58 72 17 50 5F      [ 1]  524 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      009F58 CD 9C CE         [ 4]  525 	call FC_XON
      009F5B CD               [ 4]  526 	ret 
                                    527 
                                    528 ; this routine is to be copied to PAD 
      001F5B                        529 row_erase_proc:
      009F5C 9E 0C 90 93      [ 1]  530 	mov FLASH_CR2,#(1<<FLASH_CR2_ERASE) 
      009F60 90 FE 90 89      [ 1]  531 	mov FLASH_NCR2,#~(1<<FLASH_CR2_ERASE)
      009F64 90               [ 1]  532 	clr a 
      009F65 5E FF            [ 1]  533 	clrw y 
      009F67 CD 9E B7 90      [ 1]  534 	ldf ([FPTR],y),a
      009F6B 85 1D            [ 1]  535     incw y
      009F6D 00 02 FF CD      [ 1]  536 	ldf ([FPTR],y),a
      009F71 9E B7            [ 1]  537     incw y
      009F73 CC 9E 34 9F      [ 1]  538 	ldf ([FPTR],y),a
      009F77 54 09            [ 1]  539     incw y
      009F79 52 4F 57 2D      [ 1]  540 	ldf ([FPTR],y),a
      009F7D 45 52 41 53 45   [ 2]  541 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 118.
Hexadecimal [24-Bits]



      009F82 81               [ 4]  542 	ret
      001F82                        543 row_erase_proc_end:
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
      001F82                        556 copy_buffer:
      009F82 CD 84            [ 1]  557 	push #BLOCK_SIZE  
                                    558 ;enable block programming 
      009F84 E3 CD 9C CE      [ 1]  559 	bset FLASH_CR2,#FLASH_CR2_PRG 
      009F88 1D 00 02 90      [ 1]  560 	bres FLASH_NCR2,#FLASH_CR2_PRG
      009F8C AE 9F            [ 1]  561 	clrw y
      009F8E DB               [ 1]  562 1$:	ld a,(x)
      009F8F FF CD 8D 6E      [ 1]  563 	ldf ([FPTR],y),a
      009F93 90               [ 1]  564 	incw x 
      009F94 AE A0            [ 1]  565 	incw y 
      009F96 02 72            [ 1]  566 	dec (BCNT,sp)
      009F98 A2 9F            [ 1]  567 	jrne 1$
                                    568 ; wait EOP bit 
      009F9A DB 1D 00 02 FF   [ 2]  569 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. 
      009F9F CD               [ 1]  570 	pop a ; remove BCNT from stack 
      009FA0 8D               [ 4]  571 	ret 
      001FA1                        572 copy_buffer_end:
                                    573 
                                    574 ;-------------------------
                                    575 ; move program_row to RAM 
                                    576 ; in TIB 
                                    577 ;------------------------
      001FA1                        578 copy_prog_to_ram:
      009FA1 AA 00 06         [ 2]  579 	subw x,#6
      009FA2 90 AE 1F 82      [ 2]  580 	ldw y,#copy_buffer 
      009FA2 90 BE            [ 2]  581 	ldw (4,x),y 
      009FA4 35 90 A3 B6      [ 2]  582 	ldw y,#TIBBASE
      009FA8 80 2A            [ 2]  583 	ldw (2,x),y 
      009FAA 19 90 A3 40      [ 2]  584 	ldw y,#copy_buffer_end 
      009FAE 00 24 04 CD      [ 2]  585 	subw y,#copy_buffer  
      009FB2 84               [ 2]  586 	ldw (x),y 
      009FB3 CD 81 90         [ 4]  587 	call CMOVE 
      009FB6 A3               [ 4]  588 	ret 
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



      009FB7 47 FF                  597 	.word LINK 
                           001FBF   598 	LINK=.
      009FB9 23                     599 	.byte 6 
      009FBA 04 CD 84 CD 81 57      600 	.ascii "WR-ROW"
      009FBF                        601 write_row:
      009FBF CD 9D CE         [ 4]  602 	call FC_XOFF
      009FC2 20 03 4E         [ 4]  603 	call FPSTOR
                                    604 ; align to FLASH block 
      009FC4 A6 80            [ 1]  605 	ld a,#0x80 
      009FC4 CD 9D            [ 1]  606 	and a,PTR8 
      009FC6 ED 36            [ 1]  607 	ld PTR8,a  
      009FC7 CD 1F A1         [ 4]  608 	call copy_prog_to_ram
      009FC7 CD 8D 6E         [ 4]  609 	call UNLOCK
      009FCA 90 93            [ 1]  610 	ldw y,x 
      009FCC 90 FE            [ 2]  611 	ldw y,(y)
      009FCE 1C 00 02         [ 2]  612 	addw x,#CELLL 
      009FD1 90               [ 2]  613 	pushw x 
      009FD2 FD               [ 1]  614 	ldw x,y ; buffer address in x 
      009FD3 72 17 50         [ 4]  615 	call TIBBASE
      009FD6 5F CD 84         [ 4]  616 	call LOCK
      009FD9 CD               [ 2]  617 	popw x 
      009FDA 81 04 4D         [ 4]  618 	call FC_XON 
      009FDB 81               [ 4]  619 	ret 
                                    620 
                                    621 ;-------------------------------------
                                    622 ; change value of OPTION register 
                                    623 ; SET-OPT (c n -- ) 
                                    624 ; c new value.
                                    625 ; n OPT  number {1..7}
                                    626 ;--------------------------------------
      009FDB 35 20                  627 		.word LINK 
                           001FEE   628 		LINK=.
      009FDD 50                     629 		.byte 7 
      009FDE 5B 35 DF 50 5C 4F 90   630 		.ascii "SET-OPT" 
      001FF6                        631 set_option: 
      009FE5 5F 91            [ 1]  632 		ldw y,x 
      009FE7 A7 00            [ 2]  633 		ldw y,(y)
      009FE9 34 90            [ 1]  634 		jreq 1$
      009FEB 5C 91 A7 00      [ 2]  635 		cpw y,#7 
      009FEF 34 90            [ 2]  636 		jrule 2$ 
                                    637 ; invalid OPTION number 		
      009FF1 5C 91 A7         [ 2]  638 1$:		addw x,#2*CELLL
      009FF4 00               [ 4]  639 		ret
      009FF5 34 90            [ 2]  640 2$:		sllw y 
      009FF7 5C 91 A7 00      [ 2]  641 		addw y,#OPTION_BASE-1
      009FFB 34               [ 2]  642 		ldw (x),y 
      009FFC 72 05 50         [ 2]  643 		subw x,#CELLL 
      009FFF 5F FB            [ 1]  644 		clrw y 
      00A001 81               [ 2]  645 		ldw (x),y 
      00A002 CD 1E 8C         [ 4]  646 		call EECSTORE
      00A002 81               [ 4]  647 		ret 
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
      00A002 4B 80                  656 	.word LINK  
                           002019   657 	LINK=.
      00A004 72                     658 	.byte 8 
      00A005 10 50 5B 72 11 50 5C   659 	.ascii "PRISTINE"
             90
      002022                        660 pristine:
                                    661 ;;; erase EEPROM
      00A00D 5F F6 91         [ 4]  662 	call EEPROM 
      00A010 A7 00 34         [ 4]  663 1$:	call DDUP 
      00A013 5C 90 5C         [ 4]  664 	call row_erase
      00A016 0A 01            [ 1]  665 	ldw y,x 
      00A018 26 F4 72         [ 2]  666 	ldw y,(2,y)
      00A01B 05 50 5F FB      [ 2]  667 	addw y,#BLOCK_SIZE
      00A01F 84 81            [ 2]  668 	ldw (2,x),y
      00A021 90 A3 48 00      [ 2]  669 	cpw y,#OPTION_BASE 
      00A021 25 E9            [ 1]  670 	jrult 1$
                                    671 ;;; reset OPTION to default values
      00A021 1D 00 06 90      [ 2]  672 	ldw y,#1 ; OPT1 
      00A025 AE               [ 2]  673 2$:	ldw (x),y   
      00A026 A0 02            [ 1]  674 	clrw y 
      00A028 EF 04            [ 2]  675 	ldw (2,x),y  ; ( 0 1 -- ) 
      00A02A 90 AE 17         [ 4]  676 	call DDUP    ; ( 0 1 0 1 -- )  
      00A02D 00 EF 02         [ 4]  677 	call set_option
      00A030 90 AE            [ 1]  678 	ldw y,x 
      00A032 A0 21            [ 2]  679 	ldw y,(y)
      00A034 72 A2            [ 1]  680 	incw y  ; next OPTION 
      00A036 A0 02 FF CD      [ 2]  681 	cpw y,#8 
      00A03A 8D AA            [ 1]  682 	jrult 2$
                                    683 ;;; erase first row of app_space 	
      00A03C 81 9F 78 06      [ 2]  684 	ldw y,#app_space
      00A040 57 52            [ 2]  685 	ldw (2,x),y  
      00A042 2D 52            [ 1]  686 	clrw y 
      00A044 4F               [ 2]  687 	ldw (x),y ; ( app_space 0 -- )
      00A045 57 1F 02         [ 4]  688 	call row_erase 
                                    689 ; reset interrupt vectors 
      00A046 1D 00 02         [ 2]  690 	subw x,#CELLL 
      00A046 CD 84            [ 1]  691 	clrw y  
      00A048 E3               [ 2]  692 4$:	ldw (x),y  ; ( n -- ) int# 
      00A049 CD 9C CE         [ 4]  693 	call DUPP  
      00A04C A6 80 B4         [ 4]  694 	call reset_vector
      00A04F 36 B7            [ 1]  695 	ldw y,x 
      00A051 36 CD            [ 2]  696 	ldw y,(y)
      00A053 A0 21            [ 1]  697 	incw y   ; next vector 
      00A055 CD 9E 0C 90      [ 2]  698 	cpw y,#25 
      00A059 93 90            [ 1]  699 	jrult 4$
      00A05B FE 1C 00         [ 2]  700 	jp NonHandledInterrupt ; reset MCU
                                    701 
                                    702 ;------------------------------
                                    703 ; reset an interrupt vector 
                                    704 ; to its initial value 
                                    705 ; i.e. NonHandledInterrupt
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 121.
Hexadecimal [24-Bits]



                                    706 ; RST-IVEC ( n -- )
                                    707 ;-----------------------------
      00A05E 02 89                  708 	.word LINK 
                           002080   709 	LINK=. 
      00A060 93                     710 	.byte 8 
      00A061 CD 17 00 CD 9E 34 85   711 	.ascii "RST-IVEC"
             CD
      002089                        712 reset_vector:
      00A069 84 CD            [ 1]  713 	ldw y,x
      00A06B 81 A0 3F         [ 2]  714 	addw x,#CELLL 
      00A06E 07 53            [ 2]  715 	ldw y,(y)
      00A070 45 54 2D 4F      [ 2]  716 	cpw y,#23 
      00A074 50 54            [ 1]  717 	jreq 9$
      00A076 90 A3 00 1D      [ 2]  718 	cpw y,#29 ; last vector
      00A076 90 93            [ 1]  719 	jrugt 9$  
      00A078 90 FE            [ 2]  720 	sllw y 
      00A07A 27 06            [ 2]  721 	sllw y 
      00A07C 90 A3 00 07      [ 2]  722 	addw y,#0x8008 ; irq0 address 
      00A080 23 04 1C         [ 2]  723 	ldw YTEMP,y
      00A083 00 04 81         [ 2]  724 	subw x,#3*CELLL 
      00A086 90 58            [ 2]  725 	ldw (2,x),y 
      00A088 72 A9            [ 1]  726 	clrw y
      00A08A 47               [ 2]  727 	ldw (x),y 
      00A08B FF FF            [ 1]  728 	ld a,#0x82 
      00A08D 1D 00            [ 1]  729 	ld yh,a
      00A08F 02 90            [ 2]  730 	ldw (4,x),y
      00A091 5F FF CD         [ 4]  731 	call EESTORE
      00A094 9F 0C 81         [ 2]  732 	subw x,#3*CELLL
      00A097 A0 6E            [ 1]  733 	clrw y 
      00A099 08               [ 2]  734 	ldw (x),y 
      00A09A 50 52 49 53      [ 2]  735 	ldw y,#NonHandledInterrupt
      00A09E 54 49            [ 2]  736 	ldw (4,x),y 
      00A0A0 4E 45 26         [ 2]  737 	ldw y,YTEMP  
      00A0A2 72 A9 00 02      [ 2]  738 	addw y,#2
      00A0A2 CD 9C            [ 2]  739 	ldw (2,x),y 
      00A0A4 ED CD 88         [ 4]  740 	call EESTORE
      00A0A7 A7               [ 4]  741 9$:	ret 
                                    742 
                                    743 
                                    744 ;------------------------------
                                    745 ; all interrupt vector with 
                                    746 ; an address >= a are resetted 
                                    747 ; to default
                                    748 ; CHKIVEC ( a -- )
                                    749 ;------------------------------
      00A0A8 CD 9F                  750 	.word LINK 
                           0020D3   751 	LINK=.
      00A0AA 82                     752 	.byte 7
      00A0AB 90 93 90 EE 02 72 A9   753 	.ascii "CHKIVEC"
                                    754 ;local variables 
                           000001   755 	SSP=1
                           000003   756 	CADR=3
                           000005   757 	OFS=5
                           000006   758 	VSIZE=6  
      0020DB                        759 CHKIVEC:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 122.
Hexadecimal  00-Bits]



      00A0B3 80 EF            [ 2]  760 	sub sp,#VSIZE ;alloc local variables 
      00A0B5 02 90            [ 1]  761 	ldw y,x 
      00A0B7 A3 48            [ 2]  762 	ldw y,(y)
      00A0B9 00 25            [ 2]  763 	ldw (CADR,sp),y ; ca 
      00A0BB E9 90            [ 2]  764 	ldw (SSP,sp),x 
      00A0BD AE 00 01         [ 2]  765 	ldw x,#0x800a ; irq0 address 
      00A0C0 FF 90            [ 2]  766 	ldw PTR16,X
      00A0C2 5F EF 02         [ 2]  767 	ldw x,#-4 
      00A0C5 CD 88 A7         [ 2]  768 1$:	addw x,#4
      00A0C8 CD A0 76         [ 2]  769 	cpw x,#30*4 ; irq0-29 
      00A0CB 90 93            [ 1]  770 	jreq 9$
      00A0CD 90 FE            [ 1]  771 	ldw y,x  
      00A0CF 90 5C 90         [ 4]  772 	ld a,([PTR16],y)
      00A0D2 A3 00            [ 1]  773 	cp a,(CADR,sp)
      00A0D4 08 25            [ 1]  774 	jrult 1$
      00A0D6 E9 90            [ 1]  775 	incw y 
      00A0D8 AE B6 80         [ 4]  776 	ld a,([PTR16],y)
      00A0DB EF 02            [ 1]  777 	cp a,(CADR+1,sp) 
      00A0DD 90 5F            [ 1]  778 	jrult 1$ 
      00A0DF FF CD            [ 2]  779 	ldw (OFS,sp),x 
      00A0E1 9F               [ 2]  780 	srlw x
      00A0E2 82               [ 2]  781 	srlw x 
      00A0E3 1D 00            [ 1]  782 	ldw y,x 
      00A0E5 02 90            [ 2]  783 	ldw x,(SSP,sp)
      00A0E7 5F               [ 2]  784 	ldw (x),y
      00A0E8 FF CD 86         [ 4]  785 	call reset_vector
      00A0EB 99 CD            [ 2]  786 	ldw x,(OFS,sp) 
      00A0ED A1 09            [ 2]  787 	jra 1$
      00A0EF 90 93            [ 2]  788 9$:	ldw x,(SSP,sp) 
      00A0F1 90 FE 90         [ 2]  789 	addw x,#CELLL 
      00A0F4 5C 90            [ 2]  790 	addw sp,#VSIZE ; drop local variables  
      00A0F6 A3               [ 4]  791 	ret 
                                    792 
                                    793 ;------------------------------
                                    794 ; set interrupt vector 
                                    795 ; SET-IVEC ( ud n -- )
                                    796 ;  ud Handler address
                                    797 ;  n  vector # 0 .. 29 
                                    798 ;-----------------------------
      00A0F7 00 19                  799 	.word LINK
                           002121   800 	LINK=.
      00A0F9 25                     801 	.byte 8 
      00A0FA ED CC 80 80 A0 99 08   802 	.ascii "SET-IVEC" 
             52
      00212A                        803 set_vector:
      00A102 53 54            [ 1]  804     ldw y,x 
      00A104 2D 49 56         [ 2]  805 	addw x,#CELLL 
      00A107 45 43            [ 2]  806 	ldw y,(y) ; vector #
      00A109 90 A3 00 1D      [ 2]  807 	cpw y,#29 ; last vector
      00A109 90 93            [ 2]  808 	jrule 2$
      00A10B 1C 00 02         [ 2]  809 	addw x,#2*CELLL 
      00A10E 90               [ 4]  810 	ret
      00A10F FE 90            [ 2]  811 2$:	sllw y 
      00A111 A3 00            [ 2]  812 	sllw y 
      00A113 17 27 3A 90      [ 2]  813 	addw y,#0X8008 ; IRQ0 vector address 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 123.
Hexadecimal [24-Bits]



      00A117 A3 00 1D         [ 2]  814 	ldw YTEMP,y ; vector address 
      00A11A 22 34            [ 1]  815 	ld a,#0x82 
      00A11C 90 58            [ 1]  816 	ld yh,a 
      00A11E 90 58            [ 1]  817 	ld a,(1,x) ; isr address bits 23..16 
      00A120 72 A9            [ 1]  818 	ld yl,a 
                                    819 ;  write 0x82 + most significant byte of int address	
      00A122 80 08 90         [ 2]  820 	subw x,#3*CELLL 
      00A125 BF 26            [ 2]  821 	ldw (4,x),y 
      00A127 1D 00 06         [ 2]  822 	ldw y,YTEMP
      00A12A EF 02            [ 2]  823 	ldw (2,x),y ; vector address 
      00A12C 90 5F            [ 1]  824 	clrw y 
      00A12E FF               [ 2]  825 	ldw (x),y   ; as a double 
      00A12F A6 82 90         [ 4]  826 	call EESTORE 
      00A132 95 EF            [ 1]  827 	ldw y,x 
      00A134 04 CD 9F         [ 2]  828 	ldw y,(2,y) ; bits 15..0 int vector 
      00A137 58 1D 00         [ 2]  829 	subw x,#3*CELLL 
      00A13A 06 90            [ 2]  830 	ldw (4,x),y 
      00A13C 5F FF 90         [ 2]  831 	ldw y,YTEMP 
      00A13F AE 80 80 EF      [ 2]  832 	addw y,#2 
      00A143 04 90            [ 2]  833 	ldw (2,x),y 
      00A145 BE 26            [ 1]  834 	clrw y 
      00A147 72               [ 2]  835 	ldw (x),y 
      00A148 A9 00 02         [ 4]  836 	call EESTORE
      00A14B EF 02 CD         [ 2]  837 	addw x,#2*CELLL  
      00A14E 9F               [ 4]  838 9$: ret 
                                    839 
                                    840 
                                    841 ;------------------------
                                    842 ; Compile word to flash
                                    843 ; EE, (w -- )
                                    844 ;-----------------------
      00A14F 58 81                  845 	.word LINK
                           00217D   846 	LINK=.
      00A151 A1                     847 	.byte 3
      00A152 00 07 43               848 	.ascii "EE,"
      002181                        849 EE_COMMA:
      00A155 48 4B 49         [ 2]  850 	subw x,#2*CELLL 
      00A158 56 45 43         [ 2]  851 	ldw y,UCP
      00A15B 90 89            [ 2]  852 	pushw y 
      00A15B 52 06            [ 2]  853 	ldw (2,x),y 
      00A15D 90 93            [ 1]  854 	clrw y 
      00A15F 90               [ 2]  855 	ldw (x),y
      00A160 FE 17 03         [ 4]  856 	call EESTORE
      00A163 1F 01            [ 2]  857 	popw y 
      00A165 AE 80 0A BF      [ 2]  858 	addw y,#2
      00A169 35 AE FF         [ 2]  859 	ldw UCP,y
      00A16C FC               [ 4]  860 	ret 
                                    861 
                                    862 
                                    863 ;-------------------------
                                    864 ; Compile byte to flash 
                                    865 ; EEC, ( c -- )	
                                    866 ;-------------------------
      00A16D 1C 00                  867 	.word LINK 
                           00219D   868 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 124.
Hexadecimal [24-Bits]



      00A16F 04                     869 	.byte 4 
      00A170 A3 00 78 27            870 	.ascii "EEC,"
      0021A2                        871 EE_CCOMMA:
      00A174 22 90 93         [ 2]  872 	subw x,#2*CELLL 
      00A177 91 D6 35         [ 2]  873 	ldw y,UCP
      00A17A 11 03            [ 2]  874 	pushw y 
      00A17C 25 EF            [ 2]  875 	ldw (2,x),y 
      00A17E 90 5C            [ 1]  876 	clrw y 
      00A180 91               [ 2]  877 	ldw (x),y
      00A181 D6 35 11         [ 4]  878 	call EECSTORE
      00A184 04 25            [ 2]  879 	popw y 
      00A186 E6 1F            [ 1]  880 	incw y 
      00A188 05 54 54         [ 2]  881 	ldw UCP,y
      00A18B 90               [ 4]  882 	ret 
                                    883 
                                    884 
                                    885 ;--------------------------
                                    886 ; copy FLASH block to ROWBUF
                                    887 ; ROW>BUF ( ud -- )
                                    888 ;--------------------------
      00A18C 93 1E                  889 	.word LINK 
                           0021BC   890 	LINK=.
      00A18E 01                     891 	.byte 7 
      00A18F FF CD A1 09 1E 05 20   892 	.ascii "ROW>BUF"
      0021C4                        893 ROW2BUF: 
      00A196 D6 1E 01         [ 4]  894 	call FPSTOR 
      00A199 1C 00            [ 1]  895 	ld a,#BLOCK_SIZE
      00A19B 02               [ 1]  896 	push a 
      00A19C 5B 06            [ 1]  897 	and a,PTR8 ; block align 
      00A19E 81 A1            [ 1]  898 	ld PTR8,a
      00A1A0 53 08 53 45      [ 2]  899 	ldw y,#ROWBUFF 
      00A1A4 54 2D 49 56      [ 5]  900 1$: ldf a,[FPTR]
      00A1A8 45 43            [ 1]  901 	ld (y),a
      00A1AA CD 1D C8         [ 4]  902 	call INC_FPTR
      00A1AA 90 93            [ 1]  903 	incw y 
      00A1AC 1C 00            [ 1]  904 	dec (1,sp)
      00A1AE 02 90            [ 1]  905 	jrne 1$ 
      00A1B0 FE               [ 1]  906 	pop a 
      00A1B1 90               [ 4]  907 	ret 
                                    908 
                                    909 
                                    910 ;---------------------------
                                    911 ; copy ROWBUFF to flash 
                                    912 ; BUF>ROW ( ud -- )
                                    913 ; ud is row address as double 
                                    914 ;---------------------------
      00A1B2 A3 00                  915 	.word LINK 
                           0021E5   916 	LINK=.
      00A1B4 1D                     917 	.byte 7 
      00A1B5 23 04 1C 00 04 81 90   918 	.ascii "BUF>ROW" 
      0021ED                        919 BUF2ROW:
      00A1BC 58 90 58         [ 4]  920 	call TBUF ; ( ud rb -- )
      00A1BF 72 A9 80         [ 4]  921 	call ROT 
      00A1C2 08 90 BF         [ 4]  922 	call ROT  ; ( rb ud -- )
      00A1C5 26 A6 82         [ 4]  923 	call write_row 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 125.
Hexadecimal [24-Bits]



      00A1C8 90               [ 4]  924 	ret 
                                    925 
                                    926 ;---------------------------------
                                    927 ; how many byte free in that row 
                                    928 ; RFREE ( a -- n )
                                    929 ; a is least byte of target address
                                    930 ;----------------------------------
      00A1C9 95 E6                  931 	.word LINK 
                           0021FC   932 	LINK=.
      00A1CB 01                     933 	.byte 5 
      00A1CC 90 97 1D 00 06         934 	.ascii "RFREE"
      002202                        935 RFREE:
      00A1D1 EF 04            [ 1]  936 	ld a,(1,x)
      00A1D3 90 BE            [ 1]  937 	and a,#BLOCK_SIZE-1 
      00A1D5 26 EF            [ 1]  938 	ld YTEMP,a 
      00A1D7 02 90            [ 1]  939 	ld a,#BLOCK_SIZE 
      00A1D9 5F FF            [ 1]  940 	sub a,YTEMP 
      00A1DB CD 9F            [ 1]  941 	clrw y 
      00A1DD 58 90            [ 1]  942 	ld yl,a
      00A1DF 93               [ 2]  943 	ldw (x),y 
      00A1E0 90               [ 4]  944 	ret 
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
      00A1E1 EE 02                  955 	.word LINK 
                           002214   956 	LINK=. 
      00A1E3 1D                     957 	.byte 6
      00A1E4 00 06 EF 04 90 BE      958 	.ascii "RAM>EE"
                                    959 	
      00221B                        960 RAM2EE:
                                    961 ; copy ud on top 
      00A1EA 26 72            [ 1]  962 	ldw y,x 
      00A1EC A9 00 02         [ 2]  963 	ldw y,(6,y) ; LSW of ud  
      00A1EF EF 02 90         [ 2]  964 	ldw YTEMP,y 
      00A1F2 5F FF            [ 1]  965 	ldw y,x 
      00A1F4 CD 9F 58         [ 2]  966 	ldw y,(4,y)  ; MSW of ud 
      00A1F7 1C 00 04         [ 2]  967 	subw x,#2*CELLL 
      00A1FA 81               [ 2]  968 	ldw (x),y 
      00A1FB A1 A1 03         [ 2]  969 	ldw y,YTEMP 
      00A1FE 45 45            [ 2]  970 	ldw (2,x),y 
      00A200 2C 21 C4         [ 4]  971 	call ROW2BUF 
      00A201 90 93            [ 1]  972 	ldw y,x 
      00A201 1D 00 04         [ 2]  973 	ldw y,(6,y)
      00A204 90 BE            [ 2]  974 	pushw y ; udl 
      00A206 1A 90            [ 1]  975 	ld a,yl
      00A208 89 EF            [ 1]  976 	and a,#BLOCK_SIZE-1 
      00A20A 02 90            [ 1]  977 	clrw y 
      00A20C 5F FF            [ 1]  978 	ld yl,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 126.
Hexadecimal [24-Bits]



      00A20E CD 9F 58 90      [ 2]  979 	addw y,#ROWBUFF 
      00A212 85 72 A9         [ 2]  980 	subw x,#CELLL 
      00A215 00               [ 2]  981 	ldw (x),y  
      00A216 02 90 BF         [ 4]  982 	call SWAPP ;  ( ud a ra u -- )
      00A219 1A 81 A1         [ 4]  983 	call RFROM  
      00A21C FD 04 45         [ 4]  984 	call RFREE 
      00A21F 45 43 2C         [ 4]  985 	call MIN
      00A222 CD 06 19         [ 4]  986 	call DUPP 
      00A222 1D 00 04         [ 4]  987 	call TOR  
      00A225 90 BE 1A         [ 4]  988 	call CMOVE
      00A228 90 89 EF         [ 4]  989 	call BUF2ROW 
      00A22B 02 90 5F         [ 4]  990 	call RFROM 
      00A22E FF               [ 4]  991 	ret 
                                    992 
                                    993 
                                    994 ;--------------------------
                                    995 ; expand 16 bit address 
                                    996 ; to 32 bit address 
                                    997 ; FADDR ( a -- ud )
                                    998 ;--------------------------
      00A22F CD 9F                  999 	.word LINK 
                           002269  1000 	LINK=. 
      00A231 0C                    1001 	.byte 5 
      00A232 90 85 90 5C 90        1002 	.ascii "FADDR"
      00226F                       1003 FADDR:
      00A237 BF 1A 81         [ 2] 1004 	jp ZERO 
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
      00A23A A2 1D                 1020 	.word LINK 
                           002274  1021 	LINK=.
      00A23C 07                    1022 	.byte 5 
      00A23D 52 4F 57 3E 42        1023 	.ascii "FMOVE" 
      00227A                       1024 FMOVE:
      00A242 55 46 2F         [ 4] 1025 	call TFLASH 
      00A244 CD 04 E3         [ 4] 1026 	CALL AT 
      00A244 CD 9C CE         [ 4] 1027 	CALL QBRAN 
      00A247 A6 80                 1028 	.word no_move  
      00A249 88 B4 36         [ 4] 1029 	call CPP
      00A24C B7 36 90         [ 4] 1030 	call AT  
      00A24F AE 16 80         [ 4] 1031 	call DUPP ; ( udl udl -- )
      00A252 92 BC 00         [ 4] 1032 	call CNTXT 
      00A255 34 90 F7         [ 4] 1033 	call AT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 127.
Hexadecimal [24-Bits]



      00A258 CD 9E 48         [ 4] 1034 	call DOLIT 
      00A25B 90 5C                 1035 	.word 2 
      00A25D 0A 01 26         [ 4] 1036 	call SUBB ; ( udl udl a -- )
      00A260 F1 84 81         [ 4] 1037 	call SWAPP 
      00A263 A2 3C 07         [ 4] 1038 	call FADDR 
      00A266 42 55 46         [ 4] 1039 	call ROT  ; ( udl ud a -- )
      00A269 3E 52 4F         [ 4] 1040 	call DUPP 
      00A26C 57 05 E2         [ 4] 1041 	call TOR    ; R: a 
      00A26D                       1042 FMOVE2: 
      00A26D CD 87 9D         [ 4] 1043 	call HERE 
      00A270 CD 88 5D         [ 4] 1044 	call RAT 
      00A273 CD 88 5D         [ 4] 1045 	call SUBB ; (udl ud a wl -- )
      0022B4                       1046 next_row:
      00A276 CD A0 46         [ 4] 1047 	call DUPP 
      00A279 81 A2 65         [ 4] 1048 	call TOR  ; ( udl ud a wl -- ) R: a wl
      00A27C 05 52 46         [ 4] 1049 	call RAM2EE ; ( udl a u -- udl u2 ) u2 is byte written to FLASH 
      00A27F 52 45 45         [ 4] 1050 	call DUPP 
      00A282 CD 05 E2         [ 4] 1051 	call TOR
      00A282 E6 01 A4         [ 4] 1052 	call PLUS  ; ( udl+ ) 
      00A285 7F B7 26         [ 4] 1053 	call DUPP 
      00A288 A6 80 B0         [ 4] 1054 	call ZERO   ; ( udl+ ud -- )
      00A28B 26 90 5F         [ 4] 1055 	call RFROM  ; ( udl+ ud u2  R: a wl ) 
      00A28E 90 97 FF         [ 4] 1056 	call RFROM  ; ( udl+ ud u2 wl R: a ) 
      00A291 81 A2 7C         [ 4] 1057 	call OVER   ; ( udl+ ud u2 wl u2 -- )
      00A294 06 52 41         [ 4] 1058 	call SUBB  ; ( udl+ ud u2 wl- R: a )
      00A297 4D 3E 45         [ 4] 1059 	call DUPP 
      00A29A 45 04 98         [ 4] 1060 	call QBRAN
      00A29B 22 F7                 1061 	.word fmove_done 
      00A29B 90 93 90         [ 4] 1062 	call SWAPP  ; ( udl+ ud wl- u2 R: a )
      00A29E EE 06 90         [ 4] 1063 	call RFROM ; ( udl+ ud wl- u2 a -- ) 
      00A2A1 BF 26 90         [ 4] 1064 	call PLUS  ; ( udl+2 ud wl- a+ )
      00A2A4 93 90 EE         [ 4] 1065 	call DUPP 
      00A2A7 04 1D 00         [ 4] 1066 	call TOR   ; ( udl+2 ud wl- a+ ) R: a+
      00A2AA 04 FF 90         [ 4] 1067 	call SWAPP 
      00A2AD BE 26 EF         [ 4] 1068 	call BRAN
      00A2B0 02 CD                 1069 	.word next_row  
      0022F7                       1070 fmove_done:	
      00A2B2 A2 44 90         [ 4] 1071 	call RFROM  ; ( -- udl+ ud u2 wl- a  )
      00A2B5 93 90 EE         [ 2] 1072 	addw x,#5*CELLL ; (  -- cp+ ) new CP 
      00A2B8 06               [ 4] 1073  	ret  
      0022FE                       1074 no_move:
      00A2B9 90 89 90         [ 4] 1075 	call ZERO
      00A2BC 9F               [ 4] 1076 	ret 
                                   1077 
                                   1078 ;------------------------------------------
                                   1079 ; adjust pointers after **FMOVE** operetion.
                                   1080 ; UPDAT-PTR ( cp+ -- )
                                   1081 ; cp+ is new CP position after FMOVE 
                                   1082 ;-------------------------------------------
      00A2BD A4 7F                 1083 	.word LINK 
                           002304  1084 	LINK=.
      00A2BF 90                    1085 	.byte 9
      00A2C0 5F 90 97 72 A9 16 80  1086 	.ascii "UPDAT-PTR" 
             1D 00
      00230E                       1087 UPDATPTR:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 128.
Hexadecimal [24-Bits]



                                   1088 ;reset VP to previous position  
      00A2C9 02 FF CD         [ 4] 1089 	call EEPVP 
      002311                       1090 	_DROP 
      00A2CC 86 A9 CD         [ 2]    1     ADDW X,#CELLL  
      00A2CF 85 B4 CD         [ 4] 1091 	call AT
      00A2D2 A2 82 CD         [ 4] 1092 	call VPP 
      00A2D5 89 FF CD         [ 4] 1093 	call STORE
                                   1094 ;update CONTEXT and LAST 
      00A2D8 86 99 CD         [ 4] 1095 	call EEPCP 
      002320                       1096 	_DROP
      00A2DB 86 62 CD         [ 2]    1     ADDW X,#CELLL  
      00A2DE 8D AA CD         [ 4] 1097 	call AT
      00A2E1 A2 6D CD         [ 4] 1098 	call DOLIT 
      00A2E4 85 B4                 1099 	.word 2 
      00A2E6 81 A2 94         [ 4] 1100 	call PLUS 
      00A2E9 05 46 41         [ 4] 1101 	call DUPP 
      00A2EC 44 44 52         [ 4] 1102 	call CNTXT 
      00A2EF CD 04 D1         [ 4] 1103 	call STORE
      00A2EF CC 8C 83         [ 4] 1104 	call LAST
      00A2F2 A2 E9 05         [ 4] 1105 	call STORE 
      00A2F5 46 4D 4F         [ 4] 1106 	call UPDATLAST 
                                   1107 ;update CP 
      00A2F8 56 45 7E         [ 4] 1108 	call CPP 
      00A2FA CD 04 D1         [ 4] 1109 	call STORE
      00A2FA CD 87 AF         [ 4] 1110 	call UPDATCP 
      00A2FD CD               [ 4] 1111 	ret 
                                   1112 
                                   1113 ;-----------------------------
                                   1114 ; move interrupt sub-routine
                                   1115 ; in flash memory
                                   1116 ;----------------------------- 
      00A2FE 85 63                 1117 	.word LINK 
                           00234C  1118 	LINK=. 
      00A300 CD                    1119 	.byte 6
      00A301 85 18 A3 7E CD 87     1120 	.ascii "IFMOVE" 
      002353                       1121 IFMOVE:
      00A307 FE CD 85         [ 4] 1122 	call TFLASH 
      00A30A 63 CD 86         [ 4] 1123 	CALL AT 
      00A30D 99 CD 87         [ 4] 1124 	CALL QBRAN 
      00A310 E2 CD                 1125 	.word no_move 
      00A312 85 63 CD         [ 4] 1126 	call CPP 
      00A315 84 EF 00         [ 4] 1127 	call AT 
      00A318 02 CD 89         [ 4] 1128 	call DUPP ; ( udl udl -- )
      00A31B 52 CD 86         [ 4] 1129 	call EEPVP 
      00236A                       1130 	_DROP
      00A31E A9 CD A2         [ 2]    1     ADDW X,#CELLL  
      00A321 EF CD 88         [ 4] 1131 	call AT  ; ( udl udl a )
      00A324 5D CD 86         [ 4] 1132 	call TOR 
      00A327 99 CD 86         [ 4] 1133 	call FADDR
      00A32A 62 05 45         [ 4] 1134 	call RAT ; ( udl ud a -- ) R: a 
      00A32B CC 22 AB         [ 2] 1135 	jp FMOVE2 
                                   1136 
                                   1137 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 129.
Hexadecimal [24-Bits]



                           000001  4617 .if WANT_SCALING_CONST 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 130.
Hexadecimal [24-Bits]



                                   4618         .include "const_ratio.asm"
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
      00A32B CD 8D                   34         .word LINK 
                           00237E    35         LINK=.
      00A32D 5D                      36         .byte 2
      00A32E CD 85                   37         .ascii "PI" 
      002381                         38 PII:
      00A330 C5 CD 89         [ 2]   39         subw x,#2*CELLL 
      00A333 52 AE 01 63      [ 2]   40         ldw y,#355 
      00A334 EF 02            [ 2]   41         ldw (2,x),y 
      00A334 CD 86 99 CD      [ 2]   42         ldw y,#113 
      00A338 86               [ 2]   43         ldw (x),y 
      00A339 62               [ 4]   44         ret 
                                     45 
                                     46 ;      SQRT2 ( -- 19601  13860 )
                                     47 ; precision: 1.5e-9 
                                     48 ; usage example to compute Voltage peek to peek from Vrms 
                                     49 ; : VPP SQRT2 */ 2 * ;
                                     50 ;
      00A33A CD A2                   51         .word LINK 
                           002392    52         LINK=.
      00A33C 9B                      53         .byte 5 
      00A33D CD 86 99 CD 86          54         .ascii "SQRT2" 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 131.
Hexadecimal [24-Bits]



      002398                         55 SQRT2:
      00A342 62 CD 88         [ 2]   56         subw x,#2*CELLL 
      00A345 BC CD 86 99      [ 2]   57         ldw y,#19601 
      00A349 CD 8C            [ 2]   58         ldw (2,x),y 
      00A34B 83 CD 85 B4      [ 2]   59         ldw y,#13860 
      00A34F CD               [ 2]   60         ldw (x),y 
      00A350 85               [ 4]   61         ret 
                                     62 
                                     63 ;   SQRT3 ( -- 18817 10864 )
                                     64 ; precision: 1.1e-9
                                     65 ;
      00A351 B4 CD                   66         .word LINK 
                           0023A9    67         LINK=.
      00A353 86                      68         .byte 5
      00A354 C1 CD 89 52 CD          69         .ascii "SQRT3" 
      0023AF                         70 SQRT3: 
      00A359 86 99 CD         [ 2]   71     subw x,#2*CELLL 
      00A35C 85 18 A3 77      [ 2]   72     ldw y,#18817 
      00A360 CD 86            [ 2]   73     ldw (2,x),y 
      00A362 A9 CD 85 B4      [ 2]   74     ldw y,#10864 
      00A366 CD               [ 2]   75     ldw (x),y 
      00A367 88               [ 4]   76     ret 
                                     77 
                                     78 ;   E ( -- 28667 10546 )
                                     79 ; precision: 5.5e-9 
                                     80 ; natural log base 
      00A368 BC CD                   81         .word LINK 
                           0023C0    82         LINK=.
      00A36A 86                      83         .byte 1
      00A36B 99                      84         .ascii "E" 
      0023C2                         85 ENEPER:
      00A36C CD 86 62         [ 2]   86     subw x,#2*CELLL 
      00A36F CD 86 A9 CD      [ 2]   87     ldw y,#28667 
      00A373 85 34            [ 2]   88     ldw (2,x),y 
      00A375 A3 34 29 32      [ 2]   89     ldw y,#10546 
      00A377 FF               [ 2]   90     ldw (x),y 
      00A377 CD               [ 4]   91     ret 
                                     92 
                                     93 ;   SQRT10 ( -- 22936 7253 )
                                     94 ; precision: 5.7e-9 
      00A378 85 B4                   95         .word LINK 
                           0023D3    96         LINK=.
      00A37A 1C                      97         .byte 6 
      00A37B 00 0A 81 54 31 30       98         .ascii "SQRT10" 
      00A37E                         99 SQRT10:
      00A37E CD 8C 83         [ 2]  100     subw x,#2*CELLL
      00A381 81 A2 F4 09      [ 2]  101     ldw y,#22936 
      00A385 55 50            [ 2]  102     ldw (2,x),y 
      00A387 44 41 54 2D      [ 2]  103     ldw y,#7253
      00A38B 50               [ 2]  104     ldw (x),y 
      00A38C 54               [ 4]  105     ret 
                                    106 
                                    107 ;   12RT2 ( -- 26797 25293 )
                                    108 ; precision: 1.0e-9 
                                    109 ; used in music to compute well tempered scale
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 132.
Hexadecimal [24-Bits]



      00A38D 52 D3                  110         .word LINK 
                           0023EB   111         LINK=. 
      00A38E 05                     112         .byte 5 
      00A38E CD 9D 48 1C 00         113         .ascii "12RT2"
      0023F1                        114 RT12_2:
      00A393 02 CD 85         [ 2]  115     subw x,#2*CELLL 
      00A396 63 CD 87 F0      [ 2]  116     ldw y,#26797
      00A39A CD 85            [ 2]  117     ldw (2,x),y 
      00A39C 51 CD 9D 32      [ 2]  118     ldw y,#25293
      00A3A0 1C               [ 2]  119     ldw (x),y 
      00A3A1 00               [ 4]  120     ret 
                                    121 
                                    122 ;   LOG2s ( -- 2040 11103 )
                                    123 ; log(2)/1.6384
                                    124 ; precision: 1.1e-8
      00A3A2 02 CD                  125         .word LINK 
                           002402   126         LINK=.
      00A3A4 85                     127         .byte 5 
      00A3A5 63 CD 84 EF 00         128         .ascii "LOG2S" 
      002408                        129 LOG2S:
      00A3AA 02 CD 88         [ 2]  130     subw x,#2*CELLL
      00A3AD BC CD 86 99      [ 2]  131     ldw y,#2040 
      00A3B1 CD 87            [ 2]  132     ldw (2,x),y 
      00A3B3 E2 CD 85 51      [ 2]  133     ldw y,#11103 
      00A3B7 CD               [ 2]  134     ldw (x),y 
      00A3B8 88               [ 4]  135     ret 
                                    136 
                                    137 ;   LN2 ( -- 485 11464 )
                                    138 ; ln(2)/16.384 
                                    139 ; precision: 1.0e-7 
      00A3B9 0E CD                  140         .word LINK 
                           002419   141         LINK=.
      00A3BB 85                     142         .byte 4 
      00A3BC 51 CD 9D 62            143         .ascii "LN2S" 
      00241E                        144 LN2S: 
      00A3C0 CD 87 FE         [ 2]  145     subw x,#2*CELLL
      00A3C3 CD 85 51 CD      [ 2]  146     ldw y,#485
      00A3C7 9D 8B            [ 2]  147     ldw (2,x),y 
      00A3C9 81 A3 84 06      [ 2]  148     ldw y,#11464 
      00A3CD 49               [ 2]  149     ldw (x),y 
      00A3CE 46               [ 4]  150     ret 
                                    151 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 133.
Hexadecimal [24-Bits]



                                   4619 .endif
                           000001  4620 .if WANT_CONST_TABLE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 134.
Hexadecimal [24-Bits]



                                   4621         .include "ctable.asm"
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
      00A3CF 4D 4F                   34     .word LINK 
                           00242F    35     LINK=.
      00A3D1 56                      36     .byte 6
      00A3D2 45 41 4C 4C 4F 54       37     .ascii "CALLOT"
      00A3D3                         38 CALLOT:
      00A3D3 CD 87 AF         [ 4]   39     CALL CPP
      00A3D6 CD 85 63         [ 4]   40     CALL DUPP 
      00A3D9 CD 85 18         [ 4]   41     CALL AT 
      00A3DC A3 7E CD         [ 4]   42     CALL TOR 
      00A3DF 87 FE CD         [ 4]   43     CALL PSTOR 
      00A3E2 85 63 CD         [ 4]   44     CALL UPDATCP 
      00A3E5 86 99 CD         [ 4]   45     CALL RFROM
      00A3E8 9D 48 1C         [ 2]   46     JP ZERO 
                                     47 
                                     48 ;------------------------------
                                     49 ; create constants bytes table 
                                     50 ; in persistant memory
                                     51 ;  CTABLE ( n+ -- ad ; <string> )
                                     52 ; n+ bytes reserved 
                                     53 ;-----------------------------
      00A3EB 00 02                   54     .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 135.
Hexadecimal [24-Bits]



                           002450    55     LINK=.
      00A3ED CD                      56     .byte 6
      00A3EE 85 63 CD 86 62 CD       57     .ascii "CTABLE"
      002457                         58 CTABLE:
      00A3F4 A2 EF CD         [ 4]   59     CALL CALLOT     
      00A3F7 85 C5 CC         [ 2]   60     JP DCONST 
                                     61      
                                     62 
                                     63 ;--------------------------------
                                     64 ; create constants words table 
                                     65 ; in persistant memory 
                                     66 ; WTABLE ( n+ -- ad ; <string> )
                                     67 ; n+  words reserved  
                                     68 ;--------------------------------
      00A3FA A3 2B                   69     .word LINK 
                           00245F    70     LINK=.
      00A3FC A3                      71     .byte 6
      00A3FD CC 02 50 49 4C 45       72     .ascii "WTABLE"
      00A401                         73 WTABLE:
      00A401 1D 00 04         [ 4]   74     CALL CELLS  
      00A404 90 AE 01         [ 4]   75     CALL CALLOT 
      00A407 63 EF 02         [ 2]   76     JP DCONST 
                                     77 
                                     78 ;---------------------------------
                                     79 ; stack an element of CTABLE 
                                     80 ; CTABL@ ( u ad -- c )
                                     81 ; u element order {0..size-1}
                                     82 ; a|ad table address 
                                     83 ;--------------------------------
      00A40A 90 AE                   84     .word LINK 
                           002471    85     LINK=.
      00A40C 00                      86     .byte 6
      00A40D 71 FF 81 A3 FE 05       87     .ascii "CTABL@" 
      002478                         88 CTAT:
      00A413 53 51 52         [ 4]   89     call FPSTOR 
      00A416 54 32 E0         [ 4]   90     call PTRPLUS 
      00A418 CC 1E 1D         [ 2]   91     jp EE_CREAD 
                                     92 
                                     93 ;---------------------------------
                                     94 ; stack an element of WTABLE 
                                     95 ; WTABL@ ( u ud -- w )
                                     96 ; u is element order {0..size-1}
                                     97 ; a|ud table address 
                                     98 ;----------------------------------
      00A418 1D 00                   99     .word LINK 
                           002483   100     LINK=.
      00A41A 04                     101     .byte 6
      00A41B 90 AE 4C 91 EF 02      102     .ascii "WTABL@" 
      00248A                        103 WTAT:
      00A421 90 AE 36         [ 4]  104     call FPSTOR 
      00A424 24 FF 81         [ 4]  105     call CELLS 
      00A427 A4 12 05         [ 4]  106     call PTRPLUS 
      00A42A 53 51 52         [ 4]  107     call EE_READ 
      00A42D 54               [ 4]  108     ret 
                                    109 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 136.
Hexadecimal [24-Bits]



                                    110 ;--------------------------
                                    111 ; tool to initialize character table 
                                    112 ; CTINIT ( ad -- )
                                    113 ; ad is table address 
                                    114 ;--------------------------
      00A42E 33 83                  115     .word LINK 
                           002499   116     LINK=.
      00A42F 06                     117     .byte 6 
      00A42F 1D 00 04 90 AE 49      118     .ascii "CTINIT"
      0024A0                        119 CTINIT:
      00A435 81 EF 02         [ 4]  120     CALL FPSTOR
      00A438 90 AE 2A         [ 4]  121     CALL UNLOCK
      00A43B 70 FF 81         [ 4]  122     CALL ZERO 
      00A43E A4 29 01         [ 4]  123 1$: CALL ONEP 
      00A441 45 06 19         [ 4]  124     CALL DUPP 
      00A442 CD 24 FC         [ 4]  125     CALL INTQ 
      00A442 1D 00 04         [ 4]  126     CALL QBRAN 
      00A445 90 AE                  127     .word 2$
      00A447 6F FB EF         [ 4]  128     call WR_BYTE 
      00A44A 02 90 AE         [ 4]  129     CALL BRAN 
      00A44D 29 32                  130     .word 1$ 
      0024BF                        131 2$: _DDROP 
      00A44F FF 81 A4         [ 2]    1    ADDW X,#2*CELLL 
      00A452 40 06 53         [ 4]  132     CALL LOCK 
      00A455 51               [ 4]  133     ret 
                                    134 
                                    135 ;--------------------------
                                    136 ; tool to initialize word table 
                                    137 ; WTINIT ( ad -- )
                                    138 ; ad is table address 
                                    139 ;--------------------------
      00A456 52 54                  140     .word LINK 
                           0024C8   141     LINK=.
      00A458 31                     142     .byte 6 
      00A459 30 54 49 4E 49 54      143     .ascii "WTINIT"
      00A45A                        144 WTINIT:
      00A45A 1D 00 04         [ 4]  145     CALL FPSTOR
      00A45D 90 AE 59         [ 4]  146     CALL UNLOCK
      00A460 98 EF 02         [ 4]  147     CALL ZERO 
      00A463 90 AE 1C         [ 4]  148 1$: CALL ONEP 
      00A466 55 FF 81         [ 4]  149     CALL DUPP
      00A469 A4 53 05         [ 4]  150     CALL INTQ
      00A46C 31 32 52         [ 4]  151     CALL QBRAN 
      00A46F 54 32                  152     .word 2$
      00A471 CD 1E 5C         [ 4]  153     call WR_WORD 
      00A471 1D 00 04         [ 4]  154     CALL BRAN 
      00A474 90 AE                  155     .word 1$ 
      0024EE                        156 2$: _DDROP 
      00A476 68 AD EF         [ 2]    1    ADDW X,#2*CELLL 
      00A479 02 90 AE         [ 4]  157     CALL LOCK 
      00A47C 62               [ 4]  158     ret 
                                    159 
                                    160 ;------------------------
                                    161 ; Prompted input for integer 
                                    162 ; display n+ in bracket and
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 137.
Hexadecimal [24-Bits]



                                    163 ; '?' 
                                    164 ; [N]? ( n+ -- a )
                                    165 ;------------------------
      00A47D CD FF                  166     .word LINK 
                           0024F7   167     LINK=.
      00A47F 81                     168     .byte 4
      00A480 A4 6B 05 4C            169     .ascii "[N]?" 
      0024FC                        170 INTQ:
      00A484 4F 47 32         [ 4]  171     CALL CR 
      00A487 53 04 6F         [ 4]  172     call DOLIT 
      00A488 00 5B                  173     .word '[
      00A488 1D 00 04         [ 4]  174     CALL EMIT 
      00A48B 90 AE 07         [ 4]  175     CALL DOT 
      00A48E F8 EF 02         [ 4]  176     CALL  DOTQP
      00A491 90                     177     .byte 3
      00A492 AE 2B 5F               178     .ascii "]? " 
      00A495 FF 81 A4         [ 4]  179     CALL QUERY 
      00A498 82 04 4C         [ 4]  180     call TOKEN 
      00A49B 4E 32 53         [ 2]  181     jp NUMBQ
                                    182 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 138.
Hexadecimal [24-Bits]



                                   4622 .endif
                           000001  4623 .if WANT_DOUBLE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 139.
Hexadecimal [24-Bits]



                                   4624         .include "double.asm"
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
      00A49E                         35     _HEADER DBLVER,7,"DBL-VER"
      00A49E 1D 00                    1         .word LINK 
                           00251C     2         LINK=.
      00A4A0 04                       3         .byte 7  
      00A4A1 90 AE 01 E5 EF 02 90     4         .ascii "DBL-VER"
      002524                          5         DBLVER:
      00A4A8 AE 2C C8         [ 4]   36     CALL CR 
      00A4AB FF 81 A4         [ 4]   37     CALL DOTQP 
      00A4AE 99                      38     .byte  24 
      00A4AF 06 43 41 4C 4C 4F 54    39     .ascii "double integer library, "
             69 6E 74 65 67 65 72
             20 6C 69 62 72 61 72
             79 2C 20
      00A4B6 CD 1B 4D         [ 4]   40     CALL PRT_LICENCE
      00A4B6 CD 87 FE         [ 4]   41     CALL COPYRIGHT  
      002549                         42     _DOLIT DVER_MAJOR 
      00A4B9 CD 86 99         [ 4]    1     CALL DOLIT 
      00A4BC CD 85                    2     .word DVER_MAJOR 
      00254E                         43     _DOLIT DVER_MINOR  
      00A4BE 63 CD 86         [ 4]    1     CALL DOLIT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 140.
Hexadecimal [24-Bits]



      00A4C1 62 CD                    2     .word DVER_MINOR 
      00A4C3 8C F3 CD         [ 2]   44     JP PRINT_VERSION  
                                     45 
                                     46 
                                     47 ; check for negative sign 
                                     48 ; ajust pointer and cntr 
      002556                         49 nsign: ; addr cntr -- addr cntr f 
      00A4C6 9D 8B CD         [ 2]   50     SUBW X,#CELLL ; a cntr f 
      00A4C9 85 B4            [ 1]   51     LDW Y,X 
      00A4CB CC 8C 83         [ 2]   52     LDW Y,(4,Y) ; addr 
      00A4CE A4 AF            [ 1]   53     LD A,(Y) ; char=*addr  
      00A4D0 06 43            [ 1]   54     CP A,#'-' 
      00A4D2 54 41            [ 1]   55     JREQ NEG_SIGN 
      00A4D4 42               [ 1]   56     CLR A  
      00A4D5 4C 45            [ 2]   57     JRA STO_SIGN 
      00A4D7                         58 NEG_SIGN:
                                     59 ; increment addr 
      00A4D7 CD A4            [ 1]   60     LDW Y,X 
      00A4D9 B6 CC 9A         [ 2]   61     LDW Y,(4,Y)
      00A4DC 1E A4 D0 06      [ 2]   62     ADDW Y,#1   ;addr+1 
      00A4E0 57 54            [ 2]   63     LDW (4,X),Y 
                                     64 ; decrement cntr 
      00A4E2 41 42            [ 1]   65     LDW Y,X
      00A4E4 4C 45 02         [ 2]   66     LDW Y,(2,Y)
      00A4E6 72 A2 00 01      [ 2]   67     SUBW Y,#1   ;cntr-1 
      00A4E6 CD 8C            [ 2]   68     LDW (2,X),Y 
      00A4E8 0A CD            [ 1]   69     LD A,#0XFF
      00257F                         70 STO_SIGN:   
      00A4EA A4               [ 1]   71     LD (X),A 
      00A4EB B6 CC            [ 1]   72     LD (1,X),A 
      00A4ED 9A               [ 4]   73     RET 
                                     74 
                                     75 
                                     76 ; get all digits in row 
                                     77 ; stop at first non-digit or end of string 
                                     78 ; ( dlo dhi a cntr -- dlo dhi [ a+ cntr- | a+ 0 ] )
      002583                         79 parse_digits:
      002583                         80 1$:
      00A4EE 1E A4 DF         [ 4]   81     CALL DUPP 
      002586                         82     _QBRAN 5$ 
      00A4F1 06 43 54         [ 4]    1     CALL QBRAN
      00A4F4 41 42                    2     .word 5$
      00A4F6 4C 40 E2         [ 4]   83     CALL TOR   ; dlo dhi a R: cntr 
      00A4F8 CD 0C C6         [ 4]   84     CALL COUNT ; dlo dhi a+ char 
      00A4F8 CD 9C CE         [ 4]   85     CALL BASE 
      00A4FB CD 9E 60         [ 4]   86     CALL AT 
      00A4FE CC 9E 9D         [ 4]   87     CALL DIGTQ 
      00259A                         88     _QBRAN 4$ ; not a digit
      00A501 A4 F1 06         [ 4]    1     CALL QBRAN
      00A504 57 54                    2     .word 4$
      00A506 41 42 4C         [ 4]   89     CALL DTOR  ; dlo dhi R: cntr a+ c  
      00A509 40 06 DF         [ 4]   90     CALL BASE 
      00A50A CD 04 E3         [ 4]   91     CALL AT 
      00A50A CD 9C CE         [ 4]   92     CALL DSSTAR
      00A50D CD 8C 0A         [ 4]   93     CALL RFROM 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 141.
Hexadecimal [24-Bits]



      00A510 CD 9E 60         [ 4]   94     CALL ZERO 
      00A513 CD 9E 7B         [ 4]   95     CALL DPLUS 
      00A516 81 A5 03         [ 4]   96     CALL RFROM  ; dlo dhi a+ 
      00A519 06 43 54         [ 4]   97     CALL RFROM ; dlo dhi a+ cntr 
      00A51C 49 4E 49         [ 4]   98     CALL ONEM 
      00A51F 54 C4            [ 2]   99     JRA 1$ ; dlo dhi a+ R: 
      00A520                        100 4$: _DROP  ; dlo dhi a+ 
      00A520 CD 9C CE         [ 2]    1     ADDW X,#CELLL  
      00A523 CD 9E 0C         [ 4]  101     CALL ONEM  ; unget char 
      00A526 CD 8C 83         [ 4]  102     CALL RFROM ; dlo dhi a+ cntr-
      0025C8                        103 5$:
      00A529 CD               [ 4]  104     RET 
                                    105 
                                    106 
                                    107 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    108 ;   NUMBER? (a -- s -1 |d -2 | a F )
                                    109 ;   convert string to integer 
                                    110 ;   double begin with '#' 
                                    111 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0025C9                        112     _HEADER NUMBQ,7,"NUMBER?"
      00A52A 8C 17                    1         .word LINK 
                           0025CB     2         LINK=.
      00A52C CD                       3         .byte 7  
      00A52D 86 99 CD A5 7C CD 85     4         .ascii "NUMBER?"
      0025D3                          5         NUMBQ:
                                    113 ; save current base value 
      00A534 18 A5 3F         [ 4]  114     CALL BASE 
      00A537 CD 9E B7         [ 4]  115     CALL AT 
      00A53A CD 85 34         [ 4]  116     CALL TOR 
                                    117 ; initialize integer to 0     
      00A53D A5 29 1C         [ 2]  118     SUBW X,#4 
      00A540 00 04            [ 1]  119     CLRW Y 
      00A542 CD               [ 2]  120     LDW (X),Y 
      00A543 9E 34            [ 2]  121     LDW (2,X),Y ; a 0 0 R: base  
      0025E4                        122     _DOLIT 2 
      00A545 81 A5 19         [ 4]    1     CALL DOLIT 
      00A548 06 57                    2     .word 2 
      00A54A 54 49 4E         [ 4]  123     CALL PICK  ; a 0 0 a R: base    
      00A54D 49 54 C6         [ 4]  124     CALL COUNT ; a 0 0 a+ n 
                                    125 ; check for '#' double integer 
      00A54F CD 06 41         [ 4]  126     CALL OVER  ; a 0 0 a+ n a+
      00A54F CD 9C CE         [ 4]  127     CALL CAT   ; a 0 0 a+ n c 
      0025F5                        128     _DOLIT '#' ; a 0 0 a+ n c '#' 
      00A552 CD 9E 0C         [ 4]    1     CALL DOLIT 
      00A555 CD 8C                    2     .word '#' 
      00A557 83 CD 8C         [ 4]  129     CALL EQUAL 
      00A55A 17 CD 86         [ 4]  130     CALL TOR   ; a 0 0 a+ n R: base d? 
      00A55D 99 CD A5         [ 4]  131     CALL RAT   ; a 0 0 a+ n d? R: base d?
      002603                        132     _QBRAN NUMQ0
      00A560 7C CD 85         [ 4]    1     CALL QBRAN
      00A563 18 A5                    2     .word NUMQ0
                                    133 ; update a and count
      00A565 6E CD 9E         [ 4]  134     CALL SWAPP 
      00A568 DC CD 85         [ 4]  135     CALL ONEP 
      00A56B 34 A5 58         [ 4]  136     CALL SWAPP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 142.
Hexadecimal [24-Bits]



      00A56E 1C 00 04         [ 4]  137     CALL ONEM  ; a 0 0 a+ n- R: base d?
                                    138 ; check for '$' hexadecimal  
      002614                        139 NUMQ0: 
      00A571 CD 9E 34         [ 4]  140     CALL OVER   
      00A574 81 A5 48         [ 4]  141     CALL CAT   
      00261A                        142     _DOLIT '$'
      00A577 04 5B 4E         [ 4]    1     CALL DOLIT 
      00A57A 5D 3F                    2     .word '$' 
      00A57C CD 08 FA         [ 4]  143     CALL EQUAL ; a 0 0 a+ n- f  
      002622                        144     _QBRAN NUMQ1 
      00A57C CD 90 09         [ 4]    1     CALL QBRAN
      00A57F CD 84                    2     .word NUMQ1
      00A581 EF 00 5B         [ 4]  145     CALL HEX   ; switch to hexadecimal base 
                                    146 ; update a and count 
      00A584 CD 84 B6         [ 4]  147     CALL SWAPP 
      00A587 CD 90 B0         [ 4]  148     CALL ONEP 
      00A58A CD 90 36         [ 4]  149     CALL SWAPP
      00A58D 03 5D 3F         [ 4]  150     CALL ONEM ; a 0 0 a+ n-  R: base d?
                                    151 ; check for minus sign 
      002636                        152 NUMQ1: 
      00A590 20 CD 94         [ 4]  153     CALL nsign 
      00A593 40 CD 92         [ 4]  154     CALL TOR ; R: base d? sign  
                                    155 ; check for end of string     
      00A596 6B CC A6         [ 4]  156     CALL QDUP    ; a dlo dhi a+ cntr R: base d? sign 
      00263F                        157     _QBRAN NUMQ4 ; yes , not a number 
      00A599 53 A5 77         [ 4]    1     CALL QBRAN
      00A59C 07 44                    2     .word NUMQ4
      00A59E 42 4C 2D         [ 4]  158     CALL parse_digits
      00A5A1 56 45 52         [ 4]  159     CALL QDUP 
      00A5A4 CD 06 62         [ 4]  160     CALL ZEQUAL  
      00264D                        161     _QBRAN NUMQ4 ; error not end of string  ( a dlo dhi a+ R: base d? sign )
      00A5A4 CD 90 09         [ 4]    1     CALL QBRAN
      00A5A7 CD 90                    2     .word NUMQ4
      002652                        162     _DROP  ; a dlo dhi 
      00A5A9 36 18 64         [ 2]    1     ADDW X,#CELLL  
      00A5AC 6F 75 62         [ 4]  163     CALL RFROM  ; a dlo dhi sign 
      002658                        164     _QBRAN NUMQ3
      00A5AF 6C 65 20         [ 4]    1     CALL QBRAN
      00A5B2 69 6E                    2     .word NUMQ3
      00A5B4 74 65 67         [ 4]  165     CALL DNEGA
      002660                        166 NUMQ3: 
      00A5B7 65 72 20         [ 4]  167     CALL ROT ; dlo dhi a  R: base d?
      002663                        168     _DROP
      00A5BA 6C 69 62         [ 2]    1     ADDW X,#CELLL  
      002666                        169     _DOLIT -2  ; double return -2 flag 
      00A5BD 72 61 72         [ 4]    1     CALL DOLIT 
      00A5C0 79 2C                    2     .word -2 
      00A5C2 20 CD 9B         [ 4]  170     CALL RFROM ; dlo dhi d? R: base 
      00266E                        171     _TBRAN NUMQ8 
      00A5C5 CD CD 9B         [ 4]    1     CALL TBRAN 
      00A5C8 A5 CD                    2     .word NUMQ8 
      00A5CA 84 EF 00         [ 4]  172     CALL SWAPP 
      002676                        173     _DROP
      00A5CD 01 CD 84         [ 2]    1     ADDW X,#CELLL  
      00A5D0 EF 00 00         [ 4]  174     CALL ONEP   ; single return -1 flag   
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 143.
Hexadecimal [24-Bits]



      00A5D3 CC 9B            [ 2]  175     JRA NUMQ8
      00267E                        176 NUMQ4: ; not end of string error , ( a dlo dhi a+ cntr R: base d? sign )
                           000001   177 .if WANT_FLOAT
      00A5D5 E1 05 34         [ 4]  178     CALL RFROM ; sign 
      00A5D6 CD 05 34         [ 4]  179     CALL RFROM ; d? 
      00A5D6 1D 00 02         [ 4]  180     CALL FLOATQ ; ( a dlo dhi a+ cntr sign d? )    
                           000000   181 .else 
                                    182     ADDW X,#4 ; drop dhi a+  , ( a dlo R: base d? sign ) 
                                    183     ADDW SP,#4 ; drop d? sign  R: base 
                                    184     CLRW Y 
                                    185     LDW (X),Y ; dlo replaced by 0 ( -- a 0 R: base ) 
                                    186 .endif 
                                    187 ; restore original base value     
      002687                        188 NUMQ8: 
      00A5D9 90 93 90         [ 4]  189     CALL RFROM 
      00A5DC EE 04 90         [ 4]  190     CALL BASE 
      00A5DF F6 A1 2D         [ 4]  191     CALL STORE 
      00A5E2 27               [ 4]  192     RET 
                                    193 
                                    194 
                                    195 
                                    196 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    197 ;   DABS ( d -- d )
                                    198 ;   absolute value of double
                                    199 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002691                        200     _HEADER DABS,4,"DABS"
      00A5E3 03 4F                    1         .word LINK 
                           002693     2         LINK=.
      00A5E5 20                       3         .byte 4  
      00A5E6 18 41 42 53              4         .ascii "DABS"
      00A5E7                          5         DABS:
      00A5E7 90               [ 1]  201     LD A,(X) 
      00A5E8 93 90            [ 1]  202     AND A,#0X80 
      00A5EA EE 04            [ 1]  203     JREQ DABS1 
      00A5EC 72 A9 00         [ 4]  204     CALL DNEGA 
      0026A0                        205 DABS1:
      00A5EF 01               [ 4]  206     RET 
                                    207 
                                    208 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    209 ;  DSIGN ( d -- d f )
                                    210 ;  sign of double 
                                    211 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0026A1                        212     _HEADER DSIGN,5,"DSIGN"
      00A5F0 EF 04                    1         .word LINK 
                           0026A3     2         LINK=.
      00A5F2 90                       3         .byte 5  
      00A5F3 93 90 EE 02 72           4         .ascii "DSIGN"
      0026A9                          5         DSIGN:
      00A5F8 A2 00            [ 1]  213     LD A,#0 
      00A5FA 01 EF            [ 1]  214     LDW Y,X 
      00A5FC 02 A6            [ 2]  215     LDW Y,(Y)
      00A5FE FF 02            [ 1]  216     JRPL DSIGN1
      00A5FF A6 FF            [ 1]  217     LD A,#0XFF 
      0026B3                        218 DSIGN1:
      00A5FF F7 E7 01         [ 2]  219     SUBW X,#2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 144.
Hexadecimal [24-Bits]



      00A602 81               [ 1]  220     LD (X),A 
      00A603 E7 01            [ 1]  221     LD (1,X),A 
      00A603 81               [ 4]  222     RET 
                                    223 
                                    224 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    225 ;   DS/MOD ( ud us - ur qud )
                                    226 ;   unsigned divide double by single 
                                    227 ;   return double quotient 
                                    228 ;   and single remainder 
                                    229 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0026BA                        230     _HEADER DSLMOD,6,"DS/MOD"
      00A603 CD 86                    1         .word LINK 
                           0026BC     2         LINK=.
      00A605 99                       3         .byte 6  
      00A606 CD 85 18 A6 48 CD        4         .ascii "DS/MOD"
      0026C3                          5         DSLMOD:
      00A60C 86 62            [ 1]  231         LDW     Y,X             ; stack pointer to Y
      00A60E CD               [ 2]  232         LDW     X,(X)           ; un
      00A60F 8D 46            [ 2]  233         LDW     YTEMP,X         ; save un
      00A611 CD               [ 1]  234         LDW     X,Y
      00A612 87               [ 2]  235         PUSHW   X               ; save stack pointer
      00A613 5F CD            [ 2]  236         PUSHW   Y 
      00A615 85 63            [ 2]  237         LDW     X,(2,X)           ; X=udh
      00A617 CD 8F 4F         [ 2]  238         LDW     Y,YTEMP         ; divisor 
      00A61A CD               [ 2]  239         DIVW    X,Y 
      00A61B 85 18            [ 2]  240         LDW     XTEMP,X         ; QUOTIENT hi 
      00A61D A6               [ 1]  241         LDW     X,Y             ; remainder in X 
      00A61E 3F CD            [ 2]  242         POPW    Y 
      00A620 A9 83 CD         [ 2]  243         LDW     Y,(4,Y)         ; Y=udl (offset before drop)
      00A623 87 5F            [ 1]  244         LD      A,#16           ; loop count
      00A625 CD 85            [ 2]  245         SLLW    Y               ; udl shift udl into udh
      0026DE                        246 DSLMOD3:
      00A627 63               [ 2]  247         RLCW    X               ; rotate udl bit into uhdh (= remainder)
      00A628 CD A8            [ 1]  248         JRC     DSLMODa         ; if carry out of rotate
      00A62A 0E CD            [ 2]  249         CPW     X,YTEMP         ; compare udh to un
      00A62C 85 B4            [ 1]  250         JRULT   DSLMOD4         ; can't subtract
      0026E5                        251 DSLMODa:
      00A62E CD 8C 83 CD      [ 2]  252         SUBW    X,YTEMP         ; can subtract
      00A632 AC               [ 1]  253         RCF
      0026EA                        254 DSLMOD4:
      00A633 46               [ 1]  255         CCF                     ; quotient bit
      00A634 CD 85            [ 2]  256         RLCW    Y               ; rotate into quotient, rotate out udl
      00A636 B4               [ 1]  257         DEC     A               ; repeat
      00A637 CD 85            [ 1]  258         JRNE    DSLMOD3           ; if A == 0
      0026F0                        259 DSLMODb:
      00A639 B4 CD            [ 2]  260         LDW     YTEMP,X         ; done, save remainder
      00A63B 8C               [ 2]  261         POPW    X               ; restore stack pointer
      00A63C 24 20            [ 2]  262         LDW     (2,X),Y           ; save quotient low 
      00A63E C4 1C 00         [ 2]  263         LDW     Y,XTEMP         ; quotient hi 
      00A641 02               [ 2]  264         LDW     (X),Y           ; save quotient hi 
      00A642 CD 8C 24         [ 2]  265         LDW     Y,YTEMP         ; remainder onto stack
      00A645 CD 85            [ 2]  266         LDW     (4,X),Y
      00A647 B4               [ 4]  267         RET 
                                    268 
                                    269 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 145.
Hexadecimal [24-Bits]



                                    270 ;   D# ( d -- d )
                                    271 ;   extract least digit 
                                    272 ;   from double integer 
                                    273 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00A648                        274     _HEADER DDIG,2,"D#"
      00A648 81 A5                    1         .word LINK 
                           002701     2         LINK=.
      00A64A 9C                       3         .byte 2  
      00A64B 07 4E                    4         .ascii "D#"
      002704                          5         DDIG:
      00A64D 55 4D 42         [ 4]  275     CALL BASE 
      00A650 45 52 3F         [ 4]  276     CALL AT 
      00A653 CD 26 C3         [ 4]  277     CALL DSLMOD
      00A653 CD 87 5F         [ 4]  278     CALL ROT   
      00A656 CD 85 63         [ 4]  279     CALL DIGIT 
      00A659 CD 86 62         [ 4]  280     CALL HOLD 
      00A65C 1D               [ 4]  281     RET 
                                    282 
                                    283 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    284 ;    D#S ( d -- s )
                                    285 ;   extract digit from double 
                                    286 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002717                        287     _HEADER DDIGS,3,"D#S"
      00A65D 00 04                    1         .word LINK 
                           002719     2         LINK=.
      00A65F 90                       3         .byte 3  
      00A660 5F FF EF                 4         .ascii "D#S"
      00271D                          5         DDIGS:
      00A663 02 CD 84         [ 4]  288     CALL    DDIG 
      00A666 EF 00 02         [ 4]  289     CALL    DDUP 
      00A669 CD 8C DC         [ 4]  290     CALL    DZEQUAL
      002726                        291     _QBRAN  DDIGS 
      00A66C CD 8D 46         [ 4]    1     CALL QBRAN
      00A66F CD 86                    2     .word DDIGS
      00A671 C1 CD 85         [ 4]  292     CALL    DROP 
      00A674 81               [ 4]  293     RET 
                                    294 
                                    295 
                                    296 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    297 ;   D. ( d -- )
                                    298 ;   display double integer 
                                    299 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00272F                        300     _HEADER DDOT,2,"D."
      00A675 CD 84                    1         .word LINK 
                           002731     2         LINK=.
      00A677 EF                       3         .byte 2  
      00A678 00 23                    4         .ascii "D."
      002734                          5         DDOT:
      00A67A CD 89 7A         [ 4]  301     CALL SPACE 
      00A67D CD 86 62         [ 4]  302     CALL DSIGN 
      00A680 CD 85 C5         [ 4]  303     CALL TOR
      00A683 CD 85 18         [ 4]  304     CALL RAT 
      002740                        305     _QBRAN DDOT0
      00A686 A6 94 CD         [ 4]    1     CALL QBRAN
      00A689 86 A9                    2     .word DDOT0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 146.
Hexadecimal [24-Bits]



      00A68B CD 8C 17         [ 4]  306     CALL DNEGA 
      002748                        307 DDOT0:     
      00A68E CD 86 A9         [ 4]  308     CALL BDIGS 
      00A691 CD 8C 24         [ 4]  309     CALL DDIGS 
      00A694 CD 05 34         [ 4]  310     CALL RFROM 
      002751                        311     _QBRAN DDOT1 
      00A694 CD 86 C1         [ 4]    1     CALL QBRAN
      00A697 CD 85                    2     .word DDOT1
      002756                        312     _DOLIT '-' 
      00A699 81 CD 84         [ 4]    1     CALL DOLIT 
      00A69C EF 00                    2     .word '-' 
      00A69E 24 CD 89         [ 4]  313     CALL HOLD 
      00275E                        314 DDOT1: 
      00A6A1 7A CD 85         [ 4]  315     CALL EDIGS 
      00A6A4 18 A6 B6         [ 4]  316     CALL TYPES     
      00A6A7 CD               [ 4]  317     RET 
                                    318 
                                    319 
                                    320 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    321 ;  UDS* ( ud u -- ud*u )
                                    322 ;  uint32*uint16 
                                    323 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002765                        324     _HEADER UDSSTAR,4,"UDS*"
      00A6A8 8F 26                    1         .word LINK 
                           002767     2         LINK=.
      00A6AA CD                       3         .byte 4  
      00A6AB 86 A9 CD 8C              4         .ascii "UDS*"
      00276C                          5         UDSSTAR:
      00A6AF 17 CD 86         [ 4]  325     CALL TOR 
      00A6B2 A9 CD 8C         [ 4]  326     CALL SWAPP 
      00A6B5 24 05 45         [ 4]  327     CALL RAT 
      00A6B6 CD 0A CC         [ 4]  328     CALL UMSTA ; udlo*u 
      00A6B6 CD A5 D6         [ 4]  329     CALL ROT 
      00A6B9 CD 86 62         [ 4]  330     CALL RFROM 
      00A6BC CD 88 4C         [ 4]  331     CALL UMSTA ; udhi*u 
      002781                        332     _DROP  ; drop overflow 
      00A6BF CD 85 18         [ 2]    1     ADDW X,#CELLL  
      00A6C2 A6 FE CD         [ 4]  333     CALL PLUS  ; udlo*u+(uhi*u<<16)
      00A6C5 A6               [ 4]  334     RET 
                                    335 
                                    336 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    337 ; multiply double by unsigned single 
                                    338 ; return double 
                                    339 ;  ( d u -- d )
                                    340 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002788                        341     _HEADER DSSTAR,3,"DS*"
      00A6C6 03 CD                    1         .word LINK 
                           00278A     2         LINK=.
      00A6C8 88                       3         .byte 3  
      00A6C9 4C CD 86                 4         .ascii "DS*"
      00278E                          5         DSSTAR:
                                    342 ;DSSTAR:
      00A6CC E2 CD 85         [ 4]  343     CALL TOR
      00A6CF 18 A6 FE         [ 4]  344     CALL DSIGN 
      00A6D2 1C 00 02         [ 4]  345     CALL NROT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 147.
Hexadecimal [24-Bits]



      00A6D5 CD 85 B4         [ 4]  346     CALL DABS
      00A6D8 CD 85 18         [ 4]  347     CALL RFROM 
      00A6DB A6 E0 CD         [ 4]  348     CALL UDSSTAR  
      00A6DE 89 18 DD         [ 4]  349     CALL ROT 
      00A6E0                        350     _QBRAN DSSTAR3 
      00A6E0 CD 88 5D         [ 4]    1     CALL QBRAN
      00A6E3 1C 00                    2     .word DSSTAR3
      00A6E5 02 CD 84         [ 4]  351     CALL DNEGA 
      0027AB                        352 DSSTAR3:
      00A6E8 EF               [ 4]  353     RET 
                                    354 
                                    355 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    356 ;  2SWAP ( d1 d2 -- d2 d1 )
                                    357 ;  swap double 
                                    358 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0027AC                        359     _HEADER DSWAP,5,"2SWAP"
      00A6E9 FF FE                    1         .word LINK 
                           0027AE     2         LINK=.
      00A6EB CD                       3         .byte 5  
      00A6EC 85 B4 CD 85 26           4         .ascii "2SWAP"
      0027B4                          5         DSWAP:
      00A6F1 A7 07            [ 1]  360     LDW Y,X 
      00A6F3 CD 86            [ 2]  361     LDW Y,(Y)
      00A6F5 A9 1C 00         [ 2]  362     LDW YTEMP,Y ; d2 hi 
      00A6F8 02 CD            [ 1]  363     LDW Y,X 
      00A6FA 8C 17 20         [ 2]  364     LDW Y,(2,Y)
      00A6FD 09 BF 24         [ 2]  365     LDW XTEMP,Y  ; d2 lo 
      00A6FE 90 93            [ 1]  366     LDW Y,X 
      00A6FE CD 85 B4         [ 2]  367     LDW Y,(4,Y)  ; d1 hi 
      00A701 CD               [ 2]  368     LDW (X),Y 
      00A702 85 B4            [ 1]  369     LDW Y,X
      00A704 CD B0 15         [ 2]  370     LDW Y,(6,Y)  ; d1 lo 
      00A707 EF 02            [ 2]  371     LDW (2,X),Y
      00A707 CD 85 B4         [ 2]  372     LDW Y,YTEMP  
      00A70A CD 87            [ 2]  373     LDW (4,X),Y 
      00A70C 5F CD 85         [ 2]  374     LDW Y,XTEMP 
      00A70F 51 81            [ 2]  375     LDW (6,X),Y 
      00A711 A6               [ 4]  376     RET 
                                    377 
                                    378 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    379 ;    DCLZ ( d -- u )
                                    380 ;    double count leading zeros
                                    381 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0027DB                        382     _HEADER DCLZ,4,"DCLZ"
      00A712 4B 04                    1         .word LINK 
                           0027DD     2         LINK=.
      00A714 44                       3         .byte 4  
      00A715 41 42 53 5A              4         .ascii "DCLZ"
      00A718                          5         DCLZ:
      00A718 F6               [ 1]  383     CLR A 
      00A719 A4 80            [ 1]  384     LDW Y,X 
      00A71B 27 03            [ 2]  385     LDW Y,(Y)
      00A71D CD 89            [ 1]  386     JRMI DCLZ8 ; no leading zero 
      00A71F 18 09            [ 1]  387     JREQ DCLZ4 ; >=16 
      00A720                        388 DCLZ1: ; <16
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 148.
Hexadecimal [24-Bits]



      00A720 81 A7            [ 2]  389     SLLW Y
      00A722 13               [ 1]  390     INC A 
      00A723 05 44            [ 2]  391     TNZW Y 
      00A725 53 49            [ 1]  392     JRMI DCLZ8
      00A727 47 4E            [ 2]  393     JRA DCLZ1 
      00A729                        394 DCLZ4: ; >=16 
      00A729 A6 00            [ 1]  395     LD A,#16 
      00A72B 90 93            [ 1]  396     LDW Y,X 
      00A72D 90 FE 2A         [ 2]  397     LDW Y,(2,Y)
      00A730 02 A6            [ 1]  398     JRMI DCLZ8 
      00A732 FF EC            [ 1]  399     JRNE DCLZ1 
      00A733 AB 10            [ 1]  400     ADD A,#16
      002801                        401 DCLZ8: 
      00A733 1D 00 02         [ 2]  402     ADDW X,#2 
      00A736 F7 E7            [ 1]  403     CLRW Y 
      00A738 01 81            [ 1]  404     LD YL,A 
      00A73A A7               [ 2]  405     LDW (X),Y 
      00A73B 23               [ 4]  406     RET 
                                    407 
                                    408 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    409 ;   <2ROT ( d1 d2 d3 -- d3 d1 d2 )
                                    410 ;   rotate left doubles 
                                    411 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00280A                        412     _HEADER NDROT,5,"<2ROT"
      00A73C 06 44                    1         .word LINK 
                           00280C     2         LINK=.
      00A73E 53                       3         .byte 5  
      00A73F 2F 4D 4F 44 54           4         .ascii "<2ROT"
      00A743                          5         NDROT:
                                    413 ; save d3 in temp 
      00A743 90 93            [ 1]  414     LDW Y,X 
      00A745 FE BF            [ 2]  415     LDW Y,(Y)
      00A747 26 93 89         [ 2]  416     LDW YTEMP,Y  ; d3 hi 
      00A74A 90 89            [ 1]  417     LDW Y,X 
      00A74C EE 02 90         [ 2]  418     LDW Y,(2,Y)
      00A74F BE 26 65         [ 2]  419     LDW XTEMP,Y  ; d3 lo 
                                    420 ; put d2 in d1 slot 
      00A752 BF 24            [ 1]  421     LDW Y,X 
      00A754 93 90 85         [ 2]  422     LDW Y,(4,Y) 
      00A757 90               [ 2]  423     LDW (X),Y   ; d2 hi 
      00A758 EE 04            [ 1]  424     LDW Y,X 
      00A75A A6 10 90         [ 2]  425     LDW Y,(6,Y)
      00A75D 58 02            [ 2]  426     LDW (2,X),Y ; d2 lo
                                    427 ; put d1 in d2 slot 
      00A75E 90 93            [ 1]  428     LDW Y,X 
      00A75E 59 25 04         [ 2]  429     LDW Y,(8,Y) 
      00A761 B3 26            [ 2]  430     LDW (4,X),Y ; d1 hi 
      00A763 25 05            [ 1]  431     LDW Y,X 
      00A765 90 EE 0A         [ 2]  432     LDW Y,(10,Y)
      00A765 72 B0            [ 2]  433     LDW (6,X),Y  ; d1 lo 
                                    434 ; put d3 in d1 slot 
      00A767 00 26 98         [ 2]  435     LDW Y,YTEMP 
      00A76A EF 08            [ 2]  436     LDW (8,X),Y  ; d3 hi 
      00A76A 8C 90 59         [ 2]  437     LDW Y,XTEMP 
      00A76D 4A 26            [ 2]  438     LDW (10,X),Y  ; d3 lo 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 149.
Hexadecimal [24-Bits]



      00A76F EE               [ 4]  439     RET 
                                    440 
                                    441 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    442 ;   2ROT ( d1 d2 d3 -- d2 d3 d1 )
                                    443 ;   rotate right doubles 
                                    444 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00A770                        445     _HEADER DROT,4,"2ROT"
      00A770 BF 26                    1         .word LINK 
                           002849     2         LINK=.
      00A772 85                       3         .byte 4  
      00A773 EF 02 90 BE              4         .ascii "2ROT"
      00284E                          5         DROT:
                                    446 ; save d3 in temp 
      00A777 24 FF            [ 1]  447     LDW Y,X 
      00A779 90 BE            [ 2]  448     LDW Y,(Y)
      00A77B 26 EF 04         [ 2]  449     LDW YTEMP,Y ; d3 hi 
      00A77E 81 A7            [ 1]  450     LDW Y,X 
      00A780 3C 02 44         [ 2]  451     LDW Y,(2,Y)
      00A783 23 BF 24         [ 2]  452     LDW XTEMP,Y ; d3 lo 
                                    453 ; put d1 in d3 slot 
      00A784 90 93            [ 1]  454     LDW Y,X 
      00A784 CD 87 5F         [ 2]  455     LDW Y,(8,Y)
      00A787 CD               [ 2]  456     LDW (X),Y  ; d1 hi 
      00A788 85 63            [ 1]  457     LDW Y,X 
      00A78A CD A7 43         [ 2]  458     LDW Y,(10,Y) 
      00A78D CD 88            [ 2]  459     LDW (2,X),Y ; d1 lo 
                                    460 ; put d2 in d1 slot 
      00A78F 5D CD            [ 1]  461     LDW Y,X 
      00A791 8E 4F CD         [ 2]  462     LDW Y,(4,Y) ; d2 hi 
      00A794 8E 9B            [ 2]  463     LDW (8,X),Y 
      00A796 81 A7            [ 1]  464     LDW Y,X 
      00A798 81 03 44         [ 2]  465     LDW Y,(6,Y) ; d2 lo 
      00A79B 23 53            [ 2]  466     LDW (10,X),Y 
                                    467 ; put d3 in d2 slot 
      00A79D 90 BE 26         [ 2]  468     LDW Y,YTEMP 
      00A79D CD A7            [ 2]  469     LDW (4,X),Y 
      00A79F 84 CD 88         [ 2]  470     LDW Y,XTEMP 
      00A7A2 A7 CD            [ 2]  471     LDW (6,X),Y 
      00A7A4 A9               [ 4]  472     RET 
                                    473 
                                    474 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    475 ;    D0= ( d -- 0|-1 )
                                    476 ;    check if double is 0 
                                    477 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002883                        478     _HEADER DZEQUAL,3,"D0="
      00A7A5 09 CD                    1         .word LINK 
                           002885     2         LINK=.
      00A7A7 85                       3         .byte 3  
      00A7A8 18 A7 9D                 4         .ascii "D0="
      002889                          5         DZEQUAL:
      00A7AB CD               [ 1]  479     CLR A  
      00A7AC 86 8F            [ 1]  480     LDW Y,X 
      00A7AE 81 A7            [ 2]  481     LDW Y,(Y)
      00A7B0 99 02            [ 1]  482     JRNE ZEQ1 
      00A7B2 44 2E            [ 1]  483     LDW Y,X 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 150.
Hexadecimal [24-Bits]



      00A7B4 90 EE 02         [ 2]  484     LDW Y,(2,Y)
      00A7B4 CD 8F            [ 1]  485     JRNE ZEQ1 
      00A7B6 C7 CD            [ 1]  486     LD A,#0xFF
      002899                        487 ZEQ1:
      00A7B8 A7 29 CD         [ 2]  488     ADDW X,#CELLL 
      00A7BB 86               [ 1]  489     LD (X),A
      00A7BC 62 CD            [ 1]  490     LD (1,X),A
      00A7BE 85               [ 4]  491 	RET     
                                    492 
                                    493 
                                    494 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    495 ;   D= ( d1 d2 -- f )
                                    496 ;   d1==d2?
                                    497 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0028A0                        498     _HEADER DEQUAL,2,"D="
      00A7BF C5 CD                    1         .word LINK 
                           0028A2     2         LINK=.
      00A7C1 85                       3         .byte 2  
      00A7C2 18 A7                    4         .ascii "D="
      0028A5                          5         DEQUAL:
      00A7C4 C8 CD            [ 1]  499     LD A,#0 
      00A7C6 89 18            [ 1]  500     LDW Y,X 
      00A7C8 90 FE            [ 2]  501     LDW Y,(Y)
      00A7C8 CD 8E            [ 2]  502     CPW Y,(4,X)
      00A7CA 8B CD            [ 1]  503     JRNE DEQU4 
      00A7CC A7 9D            [ 1]  504     LDW Y,X 
      00A7CE CD 85 B4         [ 2]  505     LDW Y,(2,Y)
      00A7D1 CD 85            [ 2]  506     CPW Y,(6,X)
      00A7D3 18 A7            [ 1]  507     JRNE DEQU4 
      00A7D5 DE CD            [ 1]  508     LD A,#0XFF
      0028BA                        509 DEQU4:
      00A7D7 84 EF 00         [ 2]  510     ADDW X,#6
      00A7DA 2D               [ 1]  511     LD (X),A 
      00A7DB CD 8E            [ 1]  512     LD (1,X),A 
      00A7DD 9B               [ 4]  513     RET 
                                    514 
                                    515 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    516 ;   D> ( d1 d2 -- f )
                                    517 ;   d1>d2?
                                    518 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00A7DE                        519     _HEADER DGREAT,2,"D>"
      00A7DE CD 8E                    1         .word LINK 
                           0028C3     2         LINK=.
      00A7E0 F0                       3         .byte 2  
      00A7E1 CD 8F                    4         .ascii "D>"
      0028C6                          5         DGREAT:
      00A7E3 F1 81 A7         [ 4]  520     CALL DSWAP 
      00A7E6 B1 04 55         [ 2]  521     JP DLESS 
                                    522 
                                    523 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    524 ;   D< ( d1 d2 -- f )
                                    525 ;   d1<d2? 
                                    526 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0028CC                        527     _HEADER DLESS,2,"D<"
      00A7E9 44 53                    1         .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 151.
Hexadecimal [24-Bits]



                           0028CE     2         LINK=.
      00A7EB 2A                       3         .byte 2  
      00A7EC 44 3C                    4         .ascii "D<"
      0028D1                          5         DLESS:
      00A7EC CD 86 62         [ 4]  528     CALL DSUB
      00A7EF CD 86 A9         [ 4]  529     CALL ZERO
      00A7F2 CD 85 C5         [ 4]  530     CALL NROT  
      00A7F5 CD 8B 4C         [ 4]  531     CALL DZLESS 
      0028DD                        532     _QBRAN DLESS4
      00A7F8 CD 88 5D         [ 4]    1     CALL QBRAN
      00A7FB CD 85                    2     .word DLESS4
      00A7FD B4 CD 8B         [ 4]  533     CALL INVER  
      0028E5                        534 DLESS4:
      00A800 4C               [ 4]  535     RET
                                    536 
                                    537 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    538 ;  D0< ( d -- f )
                                    539 ;  d<0? 
                                    540 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0028E6                        541     _HEADER DZLESS,3,"D0<"
      00A801 1C 00                    1         .word LINK 
                           0028E8     2         LINK=.
      00A803 02                       3         .byte 3  
      00A804 CD 88 BC                 4         .ascii "D0<"
      0028EC                          5         DZLESS:
      00A807 81 A7            [ 1]  542     LD A,#0 
      00A809 E7 03            [ 1]  543     LDW Y,X 
      00A80B 44 53            [ 2]  544     LDW Y,(Y)
      00A80D 2A 02            [ 1]  545     JRPL DZLESS1 
      00A80E A6 FF            [ 1]  546     LD A,#0XFF 
      0028F6                        547 DZLESS1:
      00A80E CD 86 62         [ 2]  548     ADDW X,#CELLL 
      00A811 CD               [ 1]  549     LD (X),A 
      00A812 A7 29            [ 1]  550     LD (1,X),A    
      00A814 CD               [ 4]  551     RET 
                                    552 
                                    553 
                                    554 
                                    555 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    556 ;   2>R ( d -- R: d )
                                    557 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0028FD                        558     _HEADER DTOR,3,"2>R"
      00A815 88 7C                    1         .word LINK 
                           0028FF     2         LINK=.
      00A817 CD                       3         .byte 3  
      00A818 A7 18 CD                 4         .ascii "2>R"
      002903                          5         DTOR:
      00A81B 85 B4            [ 2]  559     POPW Y 
      00A81D CD A7 EC         [ 2]  560     LDW YTEMP,Y 
      00A820 CD 88            [ 1]  561     LDW Y,X 
      00A822 5D CD 85         [ 2]  562     LDW Y,(2,Y)
      00A825 18 A8            [ 2]  563     PUSHW Y   ; d low 
      00A827 2B CD            [ 1]  564     LDW Y,X 
      00A829 89 18            [ 2]  565     LDW Y,(Y)
      00A82B 90 89            [ 2]  566     PUSHW Y   ; d hi 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 152.
Hexadecimal [24-Bits]



      00A82B 81 A8 0A         [ 2]  567     ADDW X,#4  
      00A82E 05 32 53         [ 5]  568     JP [YTEMP]
                                    569 
                                    570 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    571 ;  2R> ( -- d ) R: d --      
                                    572 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00291B                        573     _HEADER DRFROM,3,"2R>"
      00A831 57 41                    1         .word LINK 
                           00291D     2         LINK=.
      00A833 50                       3         .byte 3  
      00A834 32 52 3E                 4         .ascii "2R>"
      002921                          5         DRFROM:
      00A834 90 93            [ 2]  574     POPW Y      ; d hi 
      00A836 90 FE 90         [ 2]  575     LDW YTEMP,Y 
      00A839 BF 26 90         [ 2]  576     SUBW X,#4
      00A83C 93 90            [ 2]  577     POPW Y       ; d hi 
      00A83E EE               [ 2]  578     LDW (X),Y 
      00A83F 02 90            [ 2]  579     POPW Y       ; d low  
      00A841 BF 24            [ 2]  580     LDW (2,X),Y 
      00A843 90 93 90         [ 5]  581     JP [YTEMP]
                                    582     
                                    583 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    584 ;   2R@ ( -- d )
                                    585 ;   fecth a double from RSTACK
                                    586 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002933                        587     _HEADER DRAT,3,"2R@"
      00A846 EE 04                    1         .word LINK 
                           002935     2         LINK=.
      00A848 FF                       3         .byte 3  
      00A849 90 93 90                 4         .ascii "2R@"
      002939                          5         DRAT:
      00A84C EE 06            [ 2]  588     POPW Y 
      00A84E EF 02 90         [ 2]  589     LDW YTEMP,Y 
      00A851 BE 26 EF         [ 2]  590     SUBW X,#4 
      00A854 04 90            [ 2]  591     LDW Y,(1,SP)
      00A856 BE               [ 2]  592     LDW (X),Y 
      00A857 24 EF            [ 2]  593     LDW Y,(3,SP)
      00A859 06 81            [ 2]  594     LDW (2,X),Y 
      00A85B A8 2E 04         [ 5]  595     JP [YTEMP]
                                    596 
                                    597 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    598 ;  2VARIABLE <name> 
                                    599 ;  create a double variable 
                                    600 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00294B                        601     _HEADER DVARIA,9,"2VARIABLE"
      00A85E 44 43                    1         .word LINK 
                           00294D     2         LINK=.
      00A860 4C                       3         .byte 9  
      00A861 5A 56 41 52 49 41 42     4         .ascii "2VARIABLE"
             4C 45
      00A862                          5         DVARIA:
      00A862 4F 90 93         [ 4]  602         CALL HERE
      00A865 90 FE 2B         [ 4]  603         CALL DUPP
      00295D                        604         _DOLIT 4  
      00A868 18 27 09         [ 4]    1     CALL DOLIT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 153.
Hexadecimal [24-Bits]



      00A86B 00 04                    2     .word 4 
      00A86B 90 58 4C         [ 4]  605         CALL PLUS 
      00A86E 90 5D 2B         [ 4]  606         CALL VPP 
      00A871 0F 20 F7         [ 4]  607         CALL STORE
      00A874 CD 19 05         [ 4]  608         CALL CREAT
      00A874 A6 10 90         [ 4]  609         CALL DUPP
      00A877 93 90 EE         [ 4]  610         CALL COMMA
      00A87A 02 2B 04         [ 4]  611         CALL ZERO
      00A87D 26 EC AB         [ 4]  612         CALL OVER 
      00A880 10 04 D1         [ 4]  613         CALL STORE 
      00A881 CD 0C 03         [ 4]  614         CALL ZERO 
      00A881 1C 00 02         [ 4]  615         CALL SWAPP 
      00A884 90 5F 90         [ 4]  616         CALL STORE
      00A887 97 FF 81         [ 4]  617         CALL FMOVE ; move definition to FLASH
      00A88A A8 5D 05         [ 4]  618         CALL QDUP 
      00A88D 3C 32 52         [ 4]  619         CALL QBRAN 
      00A890 4F 54                  620         .word SET_RAMLAST   
      00A892 CD 1D 22         [ 4]  621         call UPDATVP  ; don't update if variable kept in RAM.
      00A892 90 93 90         [ 4]  622         CALL UPDATPTR
      00A895 FE               [ 4]  623         RET         
                                    624 
                                    625 
                                    626 
                                    627 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    628 ;  2LITERAL ( d -- )
                                    629 ;  compile double literal 
                                    630 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002998                        631     _HEADER DLITER,IMEDD+8,"2LITERAL"
      00A896 90 BF                    1         .word LINK 
                           00299A     2         LINK=.
      00A898 26                       3         .byte IMEDD+8  
      00A899 90 93 90 EE 02 90 BF     4         .ascii "2LITERAL"
             24
      0029A3                          5         DLITER:
      00A8A1 90 93 90         [ 4]  632     CALL COMPI 
      00A8A4 EE 04                  633     .word do2lit 
      00A8A6 FF 90 93         [ 4]  634     CALL COMMA 
      00A8A9 90 EE 06         [ 2]  635     JP   COMMA 
                                    636 
                                    637 
                                    638 ; runtime for 2LITERAL 
      0029AE                        639 do2lit:
      00A8AC EF 02 90         [ 2]  640     SUBW X,#4 
      00A8AF 93 90            [ 2]  641     LDW Y,(1,SP)
      00A8B1 EE 08            [ 2]  642     LDW Y,(Y)
      00A8B3 EF               [ 2]  643     LDW (X),Y 
      00A8B4 04 90            [ 2]  644     LDW Y,(1,SP)
      00A8B6 93 90 EE         [ 2]  645     LDW Y,(2,Y)
      00A8B9 0A EF            [ 2]  646     LDW (2,X),Y 
      00A8BB 06 90            [ 2]  647     POPW Y 
      00A8BD BE 26 EF         [ 2]  648     JP (4,Y)
                                    649 
                                    650 
                                    651 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    652 ;   2OVER ( d1 d2 -- d1 d2 d1 )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 154.
Hexadecimal [24-Bits]



                                    653 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0029C2                        654     _HEADER DOVER,5,"2OVER"
      00A8C0 08 90                    1         .word LINK 
                           0029C4     2         LINK=.
      00A8C2 BE                       3         .byte 5  
      00A8C3 24 EF 0A 81 A8           4         .ascii "2OVER"
      0029CA                          5         DOVER:
      00A8C8 8C 04            [ 1]  655     LDW Y,X 
      00A8CA 32 52 4F         [ 2]  656     SUBW X,#4 
      00A8CD 54 89            [ 2]  657     PUSHW Y 
      00A8CE 90 EE 04         [ 2]  658     LDW Y,(4,Y)  ; d1 hi 
      00A8CE 90               [ 2]  659     LDW (X),Y 
      00A8CF 93 90            [ 2]  660     POPW Y 
      00A8D1 FE 90 BF         [ 2]  661     LDW Y,(6,Y)  ;d1 lo 
      00A8D4 26 90            [ 2]  662     LDW (2,X),Y 
      00A8D6 93               [ 4]  663     RET 
                                    664 
                                    665 
                                    666 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    667 ;   D2/ ( d -- d/2 )
                                    668 ;   divide double by 2 
                                    669 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0029DD                        670     _HEADER D2SLASH,3,"D2/"
      00A8D7 90 EE                    1         .word LINK 
                           0029DF     2         LINK=.
      00A8D9 02                       3         .byte 3  
      00A8DA 90 BF 24                 4         .ascii "D2/"
      0029E3                          5         D2SLASH:
      00A8DD 90 93            [ 1]  671     LDW Y,X 
      00A8DF 90 EE            [ 2]  672     LDW Y,(Y)
      00A8E1 08 FF            [ 2]  673     SRAW Y 
      00A8E3 90               [ 2]  674     LDW (X),Y 
      00A8E4 93 90            [ 1]  675     LDW Y,X 
      00A8E6 EE 0A EF         [ 2]  676     LDW Y,(2,Y)
      00A8E9 02 90            [ 2]  677     RRCW Y 
      00A8EB 93 90            [ 2]  678     LDW (2,X),Y 
      00A8ED EE               [ 4]  679     RET
                                    680 
                                    681 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    682 ;  D2* ( d -- d*2 )
                                    683 ;  multiply double by 2 
                                    684 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0029F4                        685     _HEADER D2STAR,3,"D2*"
      00A8EE 04 EF                    1         .word LINK 
                           0029F6     2         LINK=.
      00A8F0 08                       3         .byte 3  
      00A8F1 90 93 90                 4         .ascii "D2*"
      0029FA                          5         D2STAR:
      00A8F4 EE 06            [ 1]  686     LDW Y,X 
      00A8F6 EF 0A 90         [ 2]  687     LDW Y,(2,Y)
      00A8F9 BE               [ 1]  688     RCF 
      00A8FA 26 EF            [ 2]  689     RLCW Y 
      00A8FC 04 90            [ 2]  690     LDW (2,X),Y 
      00A8FE BE 24            [ 1]  691     LDW Y,X 
      00A900 EF 06            [ 2]  692     LDW Y,(Y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 155.
Hexadecimal [24-Bits]



      00A902 81 A8            [ 2]  693     RLCW Y 
      00A904 C9               [ 2]  694     LDW (X),Y 
      00A905 03               [ 4]  695     RET 
                                    696 
                                    697 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    698 ;   DLSHIFT ( d n -- d )
                                    699 ;   left shift double 
                                    700 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002A0C                        701     _HEADER DLSHIFT,7,"DLSHIFT"
      00A906 44 30                    1         .word LINK 
                           002A0E     2         LINK=.
      00A908 3D                       3         .byte 7  
      00A909 44 4C 53 48 49 46 54     4         .ascii "DLSHIFT"
      002A16                          5         DLSHIFT:
      00A909 4F 90            [ 1]  702     LD A,(1,X) ; shift count 
      00A90B 93 90            [ 1]  703     AND A,#31
      00A90D FE 26 09         [ 2]  704     ADDW X,#CELLL 
      00A910 90 93            [ 1]  705     LDW Y,X 
      00A912 90 EE            [ 2]  706     LDW Y,(Y)
      00A914 02 26 02         [ 2]  707     LDW YTEMP,Y  ; d hi 
      00A917 A6 FF            [ 1]  708     LDW Y,X 
      00A919 90 EE 02         [ 2]  709     LDW Y,(2,Y)  ; d low 
      002A29                        710 DLSHIFT1:
      00A919 1C               [ 1]  711     TNZ A 
      00A91A 00 02            [ 1]  712     JREQ DLSHIFT2 
      00A91C F7               [ 1]  713     RCF 
      00A91D E7 01            [ 2]  714     RLCW Y 
      00A91F 81 A9            [ 2]  715     PUSHW Y 
      00A921 05 02 44         [ 2]  716     LDW Y,YTEMP 
      00A924 3D 59            [ 2]  717     RLCW Y 
      00A925 90 BF 26         [ 2]  718     LDW YTEMP,Y 
      00A925 A6 00            [ 2]  719     POPW Y 
      00A927 90               [ 1]  720     DEC A 
      00A928 93 90            [ 2]  721     JRA DLSHIFT1 
      002A3E                        722 DLSHIFT2:
      00A92A FE E3            [ 2]  723     LDW (2,X),Y 
      00A92C 04 26 0B         [ 2]  724     LDW Y,YTEMP 
      00A92F 90               [ 2]  725     LDW (X),Y 
      00A930 93               [ 4]  726     RET 
                                    727 
                                    728 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    729 ;  DRSHIFT ( d n -- d )
                                    730 ;  shift right n bits 
                                    731 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002A45                        732     _HEADER DRSHIFT,7,"DRSHIFT"
      00A931 90 EE                    1         .word LINK 
                           002A47     2         LINK=.
      00A933 02                       3         .byte 7  
      00A934 E3 06 26 02 A6 FF 54     4         .ascii "DRSHIFT"
      00A93A                          5         DRSHIFT:
      00A93A 1C 00            [ 1]  733     LD A,(1,X)
      00A93C 06 F7            [ 1]  734     AND A,#31
      00A93E E7 01 81         [ 2]  735     ADDW X,#2 
      002A56                        736 DRSHIFT1:
      00A941 A9               [ 1]  737     TNZ A 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 156.
Hexadecimal [24-Bits]



      00A942 22 02            [ 1]  738     JREQ DRSHIFT2 
      00A944 44 3E            [ 1]  739     LDW Y,X 
      00A946 90 FE            [ 2]  740     LDW Y,(Y)
      00A946 CD A8            [ 2]  741     SRLW Y 
      00A948 34               [ 2]  742     LDW (X),Y 
      00A949 CC A9            [ 1]  743     LDW Y,X 
      00A94B 51 A9 43         [ 2]  744     LDW Y,(2,Y)
      00A94E 02 44            [ 2]  745     RRCW Y 
      00A950 3C 02            [ 2]  746     LDW (2,X),Y 
      00A951 4A               [ 1]  747     DEC A
      00A951 CD AC            [ 2]  748     JRA DRSHIFT1  
      002A6C                        749 DRSHIFT2:
      00A953 78               [ 4]  750     RET 
                                    751 
                                    752 
                                    753 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    754 ;   D* ( d1 d2 -- d3 )
                                    755 ;   double product 
                                    756 ;   d3 = d1 * d2
                                    757 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002A6D                        758     _HEADER DSTAR,2,"D*"
      00A954 CD 8C                    1         .word LINK 
                           002A6F     2         LINK=.
      00A956 83                       3         .byte 2  
      00A957 CD 88                    4         .ascii "D*"
      002A72                          5         DSTAR:
      00A959 7C CD A9         [ 4]  759     CALL DUPP 
      00A95C 6C CD 85         [ 4]  760     CALL ZLESS  
      00A95F 18 A9 65         [ 4]  761     CALL TOR    ; R: d2sign 
      00A962 CD 88 F5         [ 4]  762     CALL DABS   
      00A965 CD 05 34         [ 4]  763     CALL RFROM 
      00A965 81 A9 4E         [ 4]  764     CALL NROT  ; d1 d2s ud2
      00A968 03 44 30         [ 4]  765     CALL DTOR  ; d1 d2s R: ud2  
      00A96B 3C 05 E2         [ 4]  766     CALL TOR   ; d1 R: ud2 d2s   
      00A96C CD 06 19         [ 4]  767     CALL DUPP 
      00A96C A6 00 90         [ 4]  768     CALL ZLESS 
      00A96F 93 90 FE         [ 4]  769     CALL RFROM 
      00A972 2A 02 A6         [ 4]  770     CALL XORR   
      00A975 FF 05 E2         [ 4]  771     CALL TOR   ; d1 R: ud2 prod_sign  
      00A976 CD 26 98         [ 4]  772     CALL DABS ; ud1 R: ud2 ps  
      00A976 1C 00 02         [ 4]  773     CALL RFROM  
      00A979 F7 E7 01         [ 4]  774     CALL NROT   ; ps ud1 
      00A97C 81 A9 68         [ 4]  775     CALL DDUP   ; ps ud1 ud1  
      00A97F 03 32 3E         [ 4]  776     CALL RFROM  ; ps ud1 ud1 ud2hi 
      00A982 52 27 8E         [ 4]  777     CALL DSSTAR ; ps ud1 dprodhi 
                                    778 ; shift partial product 16 bits left 
      00A983                        779     _DROP   ; drop overflow 
      00A983 90 85 90         [ 2]    1     ADDW X,#CELLL  
      00A986 BF 26 90         [ 4]  780     CALL ZERO   ; ps ud1 prodhi 
      00A989 93 90 EE         [ 4]  781     CALL SWAPP  
      00A98C 02 90 89         [ 4]  782     CALL DSWAP  ; ps dprodhi ud1 
      00A98F 90 93 90         [ 4]  783     CALL RFROM  ; ps dprodhi ud1 ud2lo
      00A992 FE 90 89         [ 4]  784     CALL DSSTAR ; ps  dprodhi dprodlo 
      00A995 1C 00 04         [ 4]  785     CALL DPLUS
      00A998 92 CC 26         [ 4]  786     CALL ROT    ; dprod ps 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 157.
Hexadecimal [24-Bits]



      002AC3                        787     _QBRAN DDSTAR3 
      00A99B A9 7F 03         [ 4]    1     CALL QBRAN
      00A99E 32 52                    2     .word DDSTAR3
      00A9A0 3E 08 98         [ 4]  788     CALL DNEGA 
      00A9A1                        789 DDSTAR3:  
      00A9A1 90               [ 4]  790     RET 
                                    791 
                                    792 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    793 ;  UD/MOD ( ud1 ud2 -- dr udq )
                                    794 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002ACC                        795     _HEADER UDSLMOD,6,"UD/MOD"
      00A9A2 85 90                    1         .word LINK 
                           002ACE     2         LINK=.
      00A9A4 BF                       3         .byte 6  
      00A9A5 26 1D 00 04 90 85        4         .ascii "UD/MOD"
      002AD5                          5         UDSLMOD:
                                    796 ; unsigned double division 
      00A9AB FF 90 85         [ 4]  797     CALL ZERO 
      00A9AE EF 02 92         [ 4]  798     CALL ZERO
      00A9B1 CC 26 A9         [ 4]  799     CALL DTOR ; quotient  R: qlo qhi 
      00A9B4 9D 03 32         [ 4]  800     CALL DOVER 
      00A9B7 52 40 E2         [ 4]  801     CALL DCLZ ; n2, dividend leading zeros  
      00A9B9 CD 05 E2         [ 4]  802     CALL TOR 
      00A9B9 90 85 90         [ 4]  803     CALL DDUP    
      00A9BC BF 26 1D         [ 4]  804     CALL DCLZ  ; n1, divisor leading zeros
      00A9BF 00 04 16         [ 4]  805     CALL RFROM ; n1 n2 
      00A9C2 01 FF 16         [ 4]  806     CALL SUBB  ; loop count 
      00A9C5 03 EF 02         [ 4]  807     CALL DUPP
      00A9C8 92 CC 26         [ 4]  808     CALL DTOR  ; ud1 ud2 R: qlo qhi cntr cntr 
      00A9CB A9 B5 09         [ 4]  809     CALL RAT    
      00A9CE 32 56 41         [ 4]  810     CALL ZLESS 
      002AFF                        811     _TBRAN UDSLA7 ; quotient is null 
      00A9D1 52 49 41         [ 4]    1     CALL TBRAN 
      00A9D4 42 4C                    2     .word UDSLA7 
      00A9D6 45 05 45         [ 4]  812     CALL RAT 
      00A9D7 CD 2A 16         [ 4]  813     CALL DLSHIFT ; align divisor with dividend 
      002B0A                        814 UDSLA3: ; division loop -- dividend divisor  
      00A9D7 CD 8D            [ 1]  815     CLRW Y 
      00A9D9 5D CD            [ 2]  816     PUSHW Y  
      00A9DB 86 99 CD         [ 4]  817     CALL DOVER 
      00A9DE 84 EF 00         [ 4]  818     CALL DOVER 
      00A9E1 04 CD 88         [ 4]  819     CALL DLESS 
      002B17                        820     _TBRAN UDSLA4 
      00A9E4 BC CD 87         [ 4]    1     CALL TBRAN 
      00A9E7 F0 CD                    2     .word UDSLA4 
      00A9E9 85 51            [ 2]  821     POPW Y 
      00A9EB CD 99 85 CD      [ 2]  822     ADDW Y,#1 
      00A9EF 86 99            [ 2]  823     PUSHW Y    ; quotiend least bit 
      00A9F1 CD 95 B2         [ 4]  824     CALL DDUP  ; dividend divisor divisor 
      00A9F4 CD 8C 83         [ 4]  825     CALL DTOR  
      00A9F7 CD 86 C1         [ 4]  826     CALL DSUB  ; dividend-divisor 
      00A9FA CD 85 51         [ 4]  827     CALL DRFROM  ; dividend- divisor  
      002B30                        828 UDSLA4: ; shift quotient and add 1 bit 
      00A9FD CD 8C            [ 2]  829     POPW Y 
      00A9FF 83 CD 86         [ 2]  830     LDW YTEMP,Y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 158.
Hexadecimal [24-Bits]



      00AA02 A9 CD            [ 2]  831     LDW Y,(7,SP) ; quotient low 
      00AA04 85               [ 1]  832     RCF 
      00AA05 51 CD            [ 2]  833     RLCW Y
      00AA07 A2 FA            [ 2]  834     LDW (7,SP),Y 
      00AA09 CD 88            [ 2]  835     LDW Y,(5,SP) ; quotient hi 
      00AA0B 4C CD            [ 2]  836     RLCW Y 
      00AA0D 85 18            [ 2]  837     LDW (5,SP),Y 
      00AA0F 99 D2            [ 2]  838     LDW Y,(7,SP) 
      00AA11 CD 9D A2 CD      [ 2]  839     ADDW Y,YTEMP
      00AA15 A3 8E            [ 2]  840     LDW (7,SP),Y 
      00AA17 81 A9            [ 2]  841     LDW Y,(1,SP) ; loop counter 
      00AA19 CD 88            [ 2]  842     TNZW Y 
      00AA1B 32 4C            [ 1]  843     JREQ UDSLA8
      00AA1D 49 54 45 52      [ 2]  844     SUBW Y,#1  
      00AA21 41 4C            [ 2]  845     LDW (1,SP),Y  
                                    846 ; shift dividend left 1 bit      
      00AA23 CD 27 B4         [ 4]  847     CALL DSWAP 
      00AA23 CD 95 F7         [ 4]  848     CALL D2STAR 
      00AA26 AA 2E CD         [ 4]  849     CALL DSWAP 
      00AA29 95 B2            [ 2]  850     JRA UDSLA3 
      002B61                        851 UDSLA7:
      00AA2B CC 95 B2         [ 4]  852     CALL ZERO 
      00AA2E                        853     _DOLIT 1 
      00AA2E 1D 00 04         [ 4]    1     CALL DOLIT 
      00AA31 16 01                    2     .word 1 
      00AA33 90 FE FF         [ 4]  854     CALL NRSTO ; R: 0 0 0 cntr    
      002B6C                        855 UDSLA8:
      00AA36 16 01 90         [ 2]  856     ADDW X,#4 ; drop divisor
      00AA39 EE 02 EF         [ 4]  857     CALL RFROM  
      002B72                        858     _DROP ; drop cntr 
      00AA3C 02 90 85         [ 2]    1     ADDW X,#CELLL  
      00AA3F 90 EC 04         [ 4]  859     CALL RFROM   ; shift count
      00AA42 AA 1A 05         [ 4]  860     CALL DRSHIFT 
                                    861     ; quotient replace dividend 
      00AA45 32 4F 56         [ 4]  862     CALL DRFROM  ; quotient 
      00AA48 45               [ 4]  863     RET 
                                    864 
                                    865 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    866 ;   D/MOD  ( d1 d2 -- dr dq )
                                    867 ;   double division dq=d1/d2
                                    868 ;   dr remainder double 
                                    869 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002B7F                        870     _HEADER DDSLMOD,5,"D/MOD"  
      00AA49 52 CE                    1         .word LINK 
                           002B81     2         LINK=.
      00AA4A 05                       3         .byte 5  
      00AA4A 90 93 1D 00 04           4         .ascii "D/MOD"
      002B87                          5         DDSLMOD:
      00AA4F 90 89 90         [ 4]  871     CALL DSIGN 
      00AA52 EE 04 FF         [ 4]  872     CALL TOR   ; R: divisor sign 
      00AA55 90 85 90         [ 4]  873     CALL DABS 
      00AA58 EE 06 EF         [ 4]  874     CALL DSWAP 
      00AA5B 02 81 AA         [ 4]  875     CALL DSIGN ; dividend sign 
      00AA5E 44 03 44         [ 4]  876     CALL RFROM 
      00AA61 32 2F 9F         [ 4]  877     CALL XORR  ; quotient sign
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 159.
Hexadecimal [24-Bits]



      00AA63 CD 05 E2         [ 4]  878     CALL TOR   ; 
      00AA63 90 93 90         [ 4]  879     CALL DABS  ; d2 ud1 R: sign 
      00AA66 FE 90 57         [ 4]  880     CALL DSWAP  ; ud1 ud2 
      00AA69 FF 90 93         [ 4]  881     CALL UDSLMOD ; ud1/ud2 -- dr dq  
      00AA6C 90 EE            [ 2]  882     POPW Y ; sign 
      00AA6E 02 90            [ 2]  883     TNZW Y 
      00AA70 56 EF            [ 1]  884     JRPL DSLA9 
      00AA72 02 81 AA         [ 4]  885     CALL DNEGA ; remainder quotient 
      002BB1                        886 DSLA9: 
      00AA75 5F               [ 4]  887     RET 
                                    888 
                                    889 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    890 ;   D/  ( d1 d2 -- dq )
                                    891 ;   division double by double 
                                    892 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002BB2                        893     _HEADER DSLASH,2,"D/"
      00AA76 03 44                    1         .word LINK 
                           002BB4     2         LINK=.
      00AA78 32                       3         .byte 2  
      00AA79 2A 2F                    4         .ascii "D/"
      00AA7A                          5         DSLASH:
      00AA7A 90 93 90         [ 4]  894     CALL DDSLMOD
      00AA7D EE 02 98         [ 4]  895     CALL DSWAP
      002BBD                        896     _DDROP 
      00AA80 90 59 EF         [ 2]    1    ADDW X,#2*CELLL 
      00AA83 02               [ 4]  897     RET 
                                    898 
                                    899 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    900 ;   D+ ( d1 d2 -- d3 )
                                    901 ;   add 2 doubles 
                                    902 ;   d3=d1+d2 
                                    903 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002BC1                        904     _HEADER DPLUS,2,"D+"
      00AA84 90 93                    1         .word LINK 
                           002BC3     2         LINK=.
      00AA86 90                       3         .byte 2  
      00AA87 FE 90                    4         .ascii "D+"
      002BC6                          5         DPLUS:
      00AA89 59 FF            [ 1]  905     LDW Y,X 
      00AA8B 81 AA            [ 2]  906     LDW Y,(Y)
      00AA8D 76 07 44         [ 2]  907     LDW YTEMP,Y ; d2 hi 
      00AA90 4C 53            [ 1]  908     LDW Y,X 
      00AA92 48 49 46         [ 2]  909     LDW Y,(2,Y)
      00AA95 54 BF 24         [ 2]  910     LDW XTEMP,Y ; d2 lo 
      00AA96 1C 00 04         [ 2]  911     ADDW X,#4 
      00AA96 E6 01            [ 1]  912     LDW Y,X 
      00AA98 A4 1F 1C         [ 2]  913     LDW Y,(2,Y) ; d1 lo
      00AA9B 00 02 90 93      [ 2]  914     ADDW Y,XTEMP
      00AA9F 90 FE            [ 2]  915     LDW (2,X),Y 
      00AAA1 90 BF            [ 1]  916     LDW Y,X 
      00AAA3 26 90            [ 2]  917     LDW Y,(Y) ; d1 hi 
      00AAA5 93 90            [ 1]  918     JRNC DPLUS1 
      00AAA7 EE 02 00 01      [ 2]  919     ADDW Y,#1 
      00AAA9                        920 DPLUS1: 
      00AAA9 4D 27 12 98      [ 2]  921     ADDW Y,YTEMP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 160.
Hexadecimal [24-Bits]



      00AAAD 90               [ 2]  922     LDW (X),Y 
      00AAAE 59               [ 4]  923     RET 
                                    924 
                                    925 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    926 ;   D- ( d1 d2 -- d3 )
                                    927 ;   d3=d1-d2 
                                    928 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002BF3                        929     _HEADER DSUB,2,"D-"
      00AAAF 90 89                    1         .word LINK 
                           002BF5     2         LINK=.
      00AAB1 90                       3         .byte 2  
      00AAB2 BE 26                    4         .ascii "D-"
      002BF8                          5         DSUB:
      00AAB4 90 59            [ 1]  930     LDW Y,X 
      00AAB6 90 BF            [ 2]  931     LDW Y,(Y)
      00AAB8 26 90 85         [ 2]  932     LDW YTEMP,Y ; d2 hi 
      00AABB 4A 20            [ 1]  933     LDW Y,X 
      00AABD EB EE 02         [ 2]  934     LDW Y,(2,Y)
      00AABE 90 BF 24         [ 2]  935     LDW XTEMP,Y ; d2 lo 
      00AABE EF 02 90         [ 2]  936     ADDW X,#4 
      00AAC1 BE 26            [ 1]  937     LDW Y,X 
      00AAC3 FF 81 AA         [ 2]  938     LDW Y,(2,Y) ; d1 lo
      00AAC6 8E 07 44 52      [ 2]  939     SUBW Y,XTEMP
      00AACA 53 48            [ 2]  940     LDW (2,X),Y 
      00AACC 49 46            [ 1]  941     LDW Y,X 
      00AACE 54 FE            [ 2]  942     LDW Y,(Y) ; d1 hi 
      00AACF 24 04            [ 1]  943     JRNC DSUB1 
      00AACF E6 01 A4 1F      [ 2]  944     SUBW Y,#1 
      002C1F                        945 DSUB1: 
      00AAD3 1C 00 02 26      [ 2]  946     SUBW Y,YTEMP 
      00AAD6 FF               [ 2]  947     LDW (X),Y 
      00AAD6 4D               [ 4]  948     RET 
                                    949 
                                    950 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 161.
Hexadecimal [24-Bits]



                                   4625 .endif 
                           000001  4626 .if WANT_FLOAT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 162.
Hexadecimal [24-Bits]



                                   4627         .include "float.asm"
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
      002C25                         56     _HEADER FVER,9,"FLOAT-VER"
      00AAD7 27 13                    1         .word LINK 
                           002C27     2         LINK=.
      00AAD9 90                       3         .byte 9  
      00AADA 93 90 FE 90 54 FF 90     4         .ascii "FLOAT-VER"
             93 90
      002C31                          5         FVER:
      00AAE3 EE 02 90         [ 4]   57     CALL CR 
      00AAE6 56 EF 02         [ 4]   58     CALL DOTQP 
      00AAE9 4A                      59     .byte  17 
      00AAEA 20 EA 6F 61 74 33 32    60     .ascii "float32 library, "
             20 6C 69 62 72 61 72
             79 2C 20
      00AAEC CD 1B 4D         [ 4]   61     CALL PRT_LICENCE 
      00AAEC 81 AA C7         [ 4]   62     CALL COPYRIGHT 
      002C4F                         63     _DOLIT FLOAT_MAJOR     
      00AAEF 02 44 2A         [ 4]    1     CALL DOLIT 
      00AAF2 00 01                    2     .word FLOAT_MAJOR 
      002C54                         64     _DOLIT FLOAT_MINOR 
      00AAF2 CD 86 99         [ 4]    1     CALL DOLIT 
      00AAF5 CD 86                    2     .word FLOAT_MINOR 
      00AAF7 D0 CD 86         [ 2]   65     JP PRINT_VERSION 
                                     66 
                                     67 
                                     68 ;-------------------------
                                     69 ;    FPSW ( -- a )
                                     70 ;    floating state variable
                                     71 ;    bit 0 zero flag 
                                     72 ;    bit 1 negative flag 
                                     73 ;    bit 2 overflow/error flag 
                                     74 ;---------------------------
      002C5C                         75     _HEADER FPSW,4,"FPSW"
      00AAFA 62 CD                    1         .word LINK 
                           002C5E     2         LINK=.
      00AAFC A7                       3         .byte 4  
      00AAFD 18 CD 85 B4              4         .ascii "FPSW"
      002C63                          5         FPSW:
      00AB01 CD 88 7C CD      [ 2]   76 	LDW Y,#UFPSW  
      00AB05 A9 83 CD         [ 2]   77 	SUBW X,#2
      00AB08 86               [ 2]   78     LDW (X),Y
      00AB09 62               [ 4]   79     RET
                                     80 
                                     81 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     82 ;   FRESET ( -- )
                                     83 ;   reset FPSW variable 
                                     84 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
      002C6C                         85     _HEADER FRESET,6,"FRESET"
      00AB0A CD 86                    1         .word LINK 
                           002C6E     2         LINK=.
      00AB0C 99                       3         .byte 6  
      00AB0D CD 86 D0 CD 85 B4        4         .ascii "FRESET"
      002C75                          5         FRESET:
      00AB13 CD 87 1F         [ 4]   86     CALL ZERO  
      00AB16 CD 86 62         [ 4]   87     CALL FPSW 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 164.
Hexadecimal [24-Bits]



      00AB19 CD A7 18         [ 4]   88     CALL STORE 
      00AB1C CD               [ 4]   89     RET 
                                     90 
                                     91 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     92 ;   FINIT ( -- )
                                     93 ;   initialize floating point 
                                     94 ;   library 
                                     95 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002C7F                         96     _HEADER FINIT,5,"FINIT"
      00AB1D 85 B4                    1         .word LINK 
                           002C81     2         LINK=.
      00AB1F CD                       3         .byte 5  
      00AB20 88 7C CD 88 A7           4         .ascii "FINIT"
      002C87                          5         FINIT:
      00AB25 CD 85 B4         [ 4]   97     CALL FRESET 
      00AB28 CD               [ 4]   98     RET 
                                     99 
                                    100 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    101 ;    FER ( -- u )
                                    102 ;    return FPSW value 
                                    103 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002C8B                        104     _HEADER FER,3,"FER"
      00AB29 A8 0E                    1         .word LINK 
                           002C8D     2         LINK=.
      00AB2B 1C                       3         .byte 3  
      00AB2C 00 02 CD                 4         .ascii "FER"
      002C91                          5         FER:
      00AB2F 8C 83 CD         [ 4]  105     CALL FPSW 
      00AB32 86 A9 CD         [ 4]  106     CALL AT 
      00AB35 A8               [ 4]  107     RET 
                                    108 
                                    109 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    110 ;    FZE  ( -- 0|-1 )
                                    111 ;    return FPSW zero flag 
                                    112 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002C98                        113     _HEADER FZE,3,"FZE"
      00AB36 34 CD                    1         .word LINK 
                           002C9A     2         LINK=.
      00AB38 85                       3         .byte 3  
      00AB39 B4 CD A8                 4         .ascii "FZE"
      002C9E                          5         FZE:
      00AB3C 0E CD AC         [ 4]  114     CALL FPSW
      00AB3F 46 CD 88         [ 4]  115     CALL AT  
      00AB42 5D CD 85         [ 4]  116     CALL ONE 
      00AB45 18 AB 4B         [ 4]  117     CALL ANDD
      00AB48 CD 89 18         [ 4]  118     CALL NEGAT  
      00AB4B 81               [ 4]  119     RET 
                                    120 
                                    121 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    122 ;    FNE ( -- 0|-1 )
                                    123 ;    return FPSW negative flag 
                                    124 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002CAE                        125     _HEADER FNE,3,"FNE"
      00AB4B 81 AA                    1         .word LINK 
                           002CB0     2         LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 165.
Hexadecimal [24-Bits]



      00AB4D EF                       3         .byte 3  
      00AB4E 06 55 44                 4         .ascii "FNE"
      002CB4                          5         FNE:
      00AB51 2F 4D 4F         [ 4]  126     CALL FPSW 
      00AB54 44 04 E3         [ 4]  127     CALL AT 
      00AB55                        128     _DOLIT 2 
      00AB55 CD 8C 83         [ 4]    1     CALL DOLIT 
      00AB58 CD 8C                    2     .word 2 
      00AB5A 83 CD A9         [ 4]  129     CALL ANDD
      00AB5D 83 CD AA         [ 4]  130     CALL TWOSL
      00AB60 4A CD A8         [ 4]  131     CALL NEGAT   
      00AB63 62               [ 4]  132     RET 
                                    133 
                                    134 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    135 ;   FOV (  -- 0|-1 )
                                    136 ;   return FPSW overflow flag 
                                    137 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002CC9                        138     _HEADER FOV,3,"FOV"
      00AB64 CD 86                    1         .word LINK 
                           002CCB     2         LINK=.
      00AB66 62                       3         .byte 3  
      00AB67 CD 88 A7                 4         .ascii "FOV"
      002CCF                          5         FOV:
      00AB6A CD A8 62         [ 4]  139     CALL FPSW
      00AB6D CD 85 B4         [ 4]  140     CALL AT  
      002CD5                        141     _DOLIT 4 
      00AB70 CD 89 52         [ 4]    1     CALL DOLIT 
      00AB73 CD 86                    2     .word 4 
      00AB75 99 CD A9         [ 4]  142     CALL ANDD
      002CDD                        143     _DOLIT 2 
      00AB78 83 CD 85         [ 4]    1     CALL DOLIT 
      00AB7B C5 CD                    2     .word 2 
      00AB7D 86 D0 CD         [ 4]  144     CALL RSHIFT 
      00AB80 85 26 AB         [ 4]  145     CALL NEGAT  
      00AB83 E1               [ 4]  146     RET 
                                    147 
                                    148 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    149 ;    SFZ ( f# -- f# )
                                    150 ;    set FPSW zero flag 
                                    151 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002CE9                        152     _HEADER SFZ,3,"SFZ"
      00AB84 CD 85                    1         .word LINK 
                           002CEB     2         LINK=.
      00AB86 C5                       3         .byte 3  
      00AB87 CD AA 96                 4         .ascii "SFZ"
      00AB8A                          5         SFZ:
      00AB8A 90 5F 90         [ 4]  153     CALL FER 
      002CF2                        154     _DOLIT 0xfffe 
      00AB8D 89 CD AA         [ 4]    1     CALL DOLIT 
      00AB90 4A CD                    2     .word 0xfffe 
      00AB92 AA 4A CD         [ 4]  155     CALL ANDD 
      00AB95 A9 51 CD         [ 4]  156     CALL TOR    
      00AB98 85 26 AB         [ 4]  157     CALL DDUP 
      002D00                        158     _DOLIT 0xFF  
      00AB9B B0 90 85         [ 4]    1     CALL DOLIT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 166.
Hexadecimal [24-Bits]



      00AB9E 72 A9                    2     .word 0xFF 
      00ABA0 00 01 90         [ 4]  159     CALL ANDD
      00ABA3 89 CD 88         [ 4]  160     CALL DZEQUAL 
      002D0B                        161     _DOLIT 1 
      00ABA6 A7 CD A9         [ 4]    1     CALL DOLIT 
      00ABA9 83 CD                    2     .word 1 
      00ABAB AC 78 CD         [ 4]  162     CALL ANDD 
      00ABAE A9 A1 34         [ 4]  163     CALL RFROM 
      00ABB0 CD 06 8A         [ 4]  164     CALL ORR 
      00ABB0 90 85 90         [ 4]  165     CALL FPSW 
      00ABB3 BF 26 16         [ 4]  166     CALL STORE 
      00ABB6 07               [ 4]  167     RET 
                                    168 
                                    169 
                                    170 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    171 ;   SFN ( f# -- f# )
                                    172 ;   set FPSW negative flag 
                                    173 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002D20                        174     _HEADER SFN,3,"SFN"
      00ABB7 98 90                    1         .word LINK 
                           002D22     2         LINK=.
      00ABB9 59                       3         .byte 3  
      00ABBA 17 07 16                 4         .ascii "SFN"
      002D26                          5         SFN:
      00ABBD 05 90 59         [ 4]  175     CALL FER 
      002D29                        176     _DOLIT 0xFFFD 
      00ABC0 17 05 16         [ 4]    1     CALL DOLIT 
      00ABC3 07 72                    2     .word 0xFFFD 
      00ABC5 B9 00 26         [ 4]  177     CALL ANDD  
      00ABC8 17 07 16         [ 4]  178     CALL TOR 
      00ABCB 01 90 5D         [ 4]  179     CALL DUPP 
      002D37                        180     _DOLIT 0X80 
      00ABCE 27 1C 72         [ 4]    1     CALL DOLIT 
      00ABD1 A2 00                    2     .word 0X80 
      00ABD3 01 17 01         [ 4]  181     CALL ANDD 
      002D3F                        182     _DOLIT 6 
      00ABD6 CD A8 34         [ 4]    1     CALL DOLIT 
      00ABD9 CD AA                    2     .word 6 
      00ABDB 7A CD A8         [ 4]  183     CALL RSHIFT 
      00ABDE 34 20 A9         [ 4]  184     CALL RFROM 
      00ABE1 CD 06 8A         [ 4]  185     CALL ORR 
      00ABE1 CD 8C 83         [ 4]  186     CALL FPSW 
      00ABE4 CD 84 EF         [ 4]  187     CALL STORE 
      00ABE7 00               [ 4]  188     RET 
                                    189 
                                    190 
                                    191 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    192 ;   SFV ( -- )
                                    193 ;   set overflow flag 
                                    194 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002D54                        195     _HEADER SFV,3,"SFV"
      00ABE8 01 CD                    1         .word LINK 
                           002D56     2         LINK=.
      00ABEA 86                       3         .byte 3  
      00ABEB 3E 46 56                 4         .ascii "SFV"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 167.
Hexadecimal [24-Bits]



      00ABEC                          5         SFV:
      00ABEC 1C 00 04         [ 4]  196     CALL FER 
      002D5D                        197     _DOLIT 4 
      00ABEF CD 85 B4         [ 4]    1     CALL DOLIT 
      00ABF2 1C 00                    2     .word 4 
      00ABF4 02 CD 85         [ 4]  198     CALL ORR 
      00ABF7 B4 CD AA         [ 4]  199     CALL FPSW 
      00ABFA CF CD A9         [ 4]  200     CALL STORE 
      00ABFD A1               [ 4]  201     RET 
                                    202 
                                    203 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    204 ;  F>ME ( f# -- m e )
                                    205 ;  split float in mantissa/exponent 
                                    206 ;  m mantissa as a double 
                                    207 ;  e exponent as a single 
                                    208 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002D6C                        209     _HEADER ATEXP,4,"F>ME"             
      00ABFE 81 AB                    1         .word LINK 
                           002D6E     2         LINK=.
      00AC00 4E                       3         .byte 4  
      00AC01 05 44 2F 4D              4         .ascii "F>ME"
      002D73                          5         ATEXP:
      00AC05 4F 44 75         [ 4]  210     CALL FRESET
      00AC07 CD 2D 26         [ 4]  211     CALL SFN
      00AC07 CD A7 29         [ 4]  212     CALL SFZ 
      00AC0A CD 86            [ 1]  213     LDW Y,X 
      00AC0C 62 CD            [ 2]  214     LDW Y,(Y)
      00AC0E A7 18            [ 2]  215     PUSHW Y 
      00AC10 CD               [ 1]  216     CLR A  
      00AC11 A8 34            [ 1]  217     SWAPW Y 
      00AC13 CD A7            [ 1]  218     JRPL ATEXP1 
      00AC15 29               [ 1]  219     CPL A 
      002D88                        220 ATEXP1: ; sign extend mantissa 
      00AC16 CD 85            [ 1]  221     SWAPW Y 
      00AC18 B4 CD            [ 1]  222     LD YH,A 
      00AC1A 87               [ 2]  223     LDW (X),Y 
      00AC1B 1F CD 86         [ 2]  224     SUBW X,#CELLL 
      00AC1E 62 CD            [ 2]  225     POPW Y 
      00AC20 A7               [ 1]  226     CLR A 
      00AC21 18 CD            [ 2]  227     TNZW Y 
      00AC23 A8 34            [ 1]  228     JRPL ATEXP2 
      00AC25 CD               [ 1]  229     CPL A 
      002D98                        230 ATEXP2:
      00AC26 AB 55            [ 1]  231     SWAPW Y 
      00AC28 90 85            [ 1]  232     LD YH,A 
      00AC2A 90               [ 2]  233     LDW (X),Y 
      00AC2B 5D               [ 4]  234     RET 
                                    235 
                                    236 
                                    237 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    238 ;    ME>F ( m e -- f# )
                                    239 ;    built float from mantissa/exponent 
                                    240 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002D9E                        241     _HEADER STEXP,4,"ME>F"
      00AC2C 2A 03                    1         .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 168.
Hexadecimal [24-Bits]



                           002DA0     2         LINK=.
      00AC2E CD                       3         .byte 4  
      00AC2F 89 18 3E 46              4         .ascii "ME>F"
      00AC31                          5         STEXP:
      00AC31 81 AC 01         [ 4]  242     CALL DUPP 
      00AC34 02 44 2F         [ 4]  243     CALL ABSS 
      00AC37                        244     _DOLIT 127 
      00AC37 CD AC 07         [ 4]    1     CALL DOLIT 
      00AC3A CD A8                    2     .word 127 
      00AC3C 34 1C 00         [ 4]  245     CALL GREAT
      002DB3                        246     _QBRAN STEXP1
      00AC3F 04 81 AC         [ 4]    1     CALL QBRAN
      00AC42 34 02                    2     .word STEXP1
      00AC44 44 2B 5A         [ 4]  247     CALL SFV
      00AC46                        248 STEXP1:
      00AC46 90 93            [ 1]  249     LDW Y,X 
      00AC48 90 FE            [ 2]  250     LDW Y,(Y)
      00AC4A 90               [ 1]  251     CLR A 
      00AC4B BF 26            [ 1]  252     LD YH,A
      00AC4D 90 93            [ 1]  253     SWAPW Y 
      00AC4F 90 EE            [ 2]  254     PUSHW Y  ; e >r 
      00AC51 02 90 BF         [ 2]  255     ADDW X,#CELLL 
      00AC54 24 1C 00         [ 4]  256     CALL DDUP 
      00AC57 04 90 93         [ 4]  257     CALL DABS
      00AC5A 90 EE 02         [ 4]  258     CALL SWAPP 
      002DD2                        259     _DROP  
      00AC5D 72 B9 00         [ 2]    1     ADDW X,#CELLL  
      002DD5                        260     _DOLIT 127 
      00AC60 24 EF 02         [ 4]    1     CALL DOLIT 
      00AC63 90 93                    2     .word 127 
      00AC65 90 FE 24         [ 4]  261     CALL GREAT 
      002DDD                        262     _QBRAN STEXP2 
      00AC68 04 72 A9         [ 4]    1     CALL QBRAN
      00AC6B 00 01                    2     .word STEXP2
      00AC6D CD 2D 5A         [ 4]  263     CALL SFV 
      002DE5                        264 STEXP2: 
      00AC6D 72               [ 1]  265     CLR A 
      00AC6E B9               [ 1]  266     LD (X),A     
      00AC6F 00 26 FF         [ 4]  267     CALL RFROM 
      00AC72 81 AC 43         [ 4]  268     CALL ORR
      00AC75 02 44 2D         [ 4]  269     CALL SFZ 
      00AC78 CD 2D 26         [ 4]  270     CALL SFN 
      00AC78 90               [ 4]  271     RET 
                                    272 
                                    273 
                                    274 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    275 ;   E. ( f# -- )
                                    276 ;   print float in scientific 
                                    277 ;   format 
                                    278 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002DF4                        279     _HEADER EDOT,2,"E."
      00AC79 93 90                    1         .word LINK 
                           002DF6     2         LINK=.
      00AC7B FE                       3         .byte 2  
      00AC7C 90 BF                    4         .ascii "E."
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 169.
Hexadecimal [24-Bits]



      002DF9                          5         EDOT:
      00AC7E 26 90 93         [ 4]  280     CALL BASE 
      00AC81 90 EE 02         [ 4]  281     CALL AT 
      00AC84 90 BF 24         [ 4]  282     CALL TOR 
      002E02                        283     _DOLIT 10 
      00AC87 1C 00 04         [ 4]    1     CALL DOLIT 
      00AC8A 90 93                    2     .word 10 
      00AC8C 90 EE 02         [ 4]  284     CALL BASE 
      00AC8F 72 B2 00         [ 4]  285     CALL STORE 
      00AC92 24 EF 02         [ 4]  286     CALL ATEXP ; m e 
      002E10                        287 EDOT0:
      00AC95 90 93 90         [ 4]  288     CALL TOR   
      00AC98 FE 24 04         [ 4]  289     CALL DABS 
      00AC9B 72 A2 00         [ 4]  290     CALL SPACE 
      00AC9E 01 0E 0B         [ 4]  291     CALL BDIGS     
      00AC9F                        292 EDOT2: 
      00AC9F 72 B2 00         [ 4]  293     CALL DDIG
      00ACA2 26 FF 81         [ 4]  294     CALL RFROM 
      00ACA5 AC 75 09         [ 4]  295     CALL ONEP 
      00ACA8 46 4C 4F         [ 4]  296     CALL TOR 
      00ACAB 41 54 2D         [ 4]  297     CALL DUPP
      002E2B                        298     _QBRAN EDOT3 
      00ACAE 56 45 52         [ 4]    1     CALL QBRAN
      00ACB1 2E 32                    2     .word EDOT3
      00ACB1 CD 90            [ 2]  299     JRA EDOT2  
      002E32                        300 EDOT3:
      00ACB3 09 CD 90         [ 4]  301     CALL OVER 
      00ACB6 36 11 66         [ 4]  302     CALL BASE 
      00ACB9 6C 6F 61         [ 4]  303     CALL AT 
      00ACBC 74 33 32         [ 4]  304     CALL ULESS 
      002E3E                        305     _QBRAN EDOT2 
      00ACBF 20 6C 69         [ 4]    1     CALL QBRAN
      00ACC2 62 72                    2     .word EDOT2
      002E43                        306     _DOLIT '.'
      00ACC4 61 72 79         [ 4]    1     CALL DOLIT 
      00ACC7 2C 20                    2     .word '.' 
      00ACC9 CD 9B CD         [ 4]  307     CALL HOLD  
      00ACCC CD 9B A5         [ 4]  308     CALL DDIG
      00ACCF CD 84 EF         [ 4]  309     CALL FNE 
      002E51                        310     _QBRAN EDOT4 
      00ACD2 00 01 CD         [ 4]    1     CALL QBRAN
      00ACD5 84 EF                    2     .word EDOT4
      002E56                        311     _DOLIT '-'
      00ACD7 00 00 CC         [ 4]    1     CALL DOLIT 
      00ACDA 9B E1                    2     .word '-' 
      00ACDC AC A7 04         [ 4]  312     CALL HOLD 
      002E5E                        313 EDOT4:       
      002E5E                        314     _DROP 
      00ACDF 46 50 53         [ 2]    1     ADDW X,#CELLL  
      00ACE2 57 0E 70         [ 4]  315     CALL EDIGS 
      00ACE3 CD 0F 71         [ 4]  316     CALL TYPES
      00ACE3 90 AE 00         [ 4]  317     CALL RFROM 
      00ACE6 08 1D 00         [ 4]  318     CALL QDUP 
      002E6D                        319     _QBRAN EDOT5     
      00ACE9 02 FF 81         [ 4]    1     CALL QBRAN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 170.
Hexadecimal [24-Bits]



      00ACEC AC DE                    2     .word EDOT5
      002E72                        320     _DOLIT 'E'
      00ACEE 06 46 52         [ 4]    1     CALL DOLIT 
      00ACF1 45 53                    2     .word 'E' 
      00ACF3 45 54 36         [ 4]  321     CALL EMIT 
      00ACF5 CD 10 30         [ 4]  322     CALL DOT
      002E7D                        323 EDOT5: 
      00ACF5 CD 8C 83         [ 4]  324     CALL RFROM 
      00ACF8 CD AC E3         [ 4]  325     CALL BASE 
      00ACFB CD 85 51         [ 4]  326     CALL STORE  
      00ACFE 81               [ 4]  327     RET 
                                    328 
                                    329 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                    330 ;   F. (f# -- )
                                    331 ;   print float in fixed
                                    332 ;   point format. 
                                    333 ;;;;;;;;;;;;;;;;;;;;;;;;;
      002E87                        334     _HEADER FDOT,2,"F."
      00ACFF AC EE                    1         .word LINK 
                           002E89     2         LINK=.
      00AD01 05                       3         .byte 2  
      00AD02 46 49                    4         .ascii "F."
      002E8C                          5         FDOT:
      00AD04 4E 49 54         [ 4]  335     CALL BASE 
      00AD07 CD 04 E3         [ 4]  336     CALL AT 
      00AD07 CD AC F5         [ 4]  337     CALL TOR 
      002E95                        338     _DOLIT 10 
      00AD0A 81 AD 01         [ 4]    1     CALL DOLIT 
      00AD0D 03 46                    2     .word 10 
      00AD0F 45 52 DF         [ 4]  339     CALL BASE 
      00AD11 CD 04 D1         [ 4]  340     CALL STORE 
      00AD11 CD AC E3         [ 4]  341     CALL    ATEXP
      00AD14 CD 85 63         [ 4]  342     CALL    DUPP  
      00AD17 81 AD 0D         [ 4]  343     CALL    ABSS 
      002EA9                        344     _DOLIT  8
      00AD1A 03 46 5A         [ 4]    1     CALL DOLIT 
      00AD1D 45 08                    2     .word 8 
      00AD1E CD 09 53         [ 4]  345     CALL    GREAT 
      002EB1                        346     _QBRAN  FDOT1 
      00AD1E CD AC E3         [ 4]    1     CALL QBRAN
      00AD21 CD 85                    2     .word FDOT1
      00AD23 63 CD 8C         [ 2]  347     JP      EDOT0 
      002EB9                        348 FDOT1:
      00AD26 8E CD 86         [ 4]  349     CALL    SPACE 
      00AD29 F6 CD 89         [ 4]  350     CALL    TOR 
      00AD2C 06 81 AD         [ 4]  351     CALL    FNE 
      002EC2                        352     _QBRAN  FDOT0 
      00AD2F 1A 03 46         [ 4]    1     CALL QBRAN
      00AD32 4E 45                    2     .word FDOT0
      00AD34 CD 08 98         [ 4]  353     CALL    DNEGA 
      002ECA                        354 FDOT0: 
      00AD34 CD AC E3         [ 4]  355     CALL    BDIGS
      00AD37 CD 85 63         [ 4]  356     CALL    RAT  
      00AD3A CD 84 EF         [ 4]  357     CALL    ZLESS 
      002ED3                        358     _QBRAN  FDOT6 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 171.
Hexadecimal [24-Bits]



      00AD3D 00 02 CD         [ 4]    1     CALL QBRAN
      00AD40 86 F6                    2     .word FDOT6
      002ED8                        359 FDOT2: ; e<0 
      00AD42 CD 8C 69         [ 4]  360     CALL    DDIG 
      00AD45 CD 89 06         [ 4]  361     CALL    RFROM
      00AD48 81 AD 30         [ 4]  362     CALL    ONEP 
      00AD4B 03 46 4F         [ 4]  363     CALL    QDUP 
      002EE4                        364     _QBRAN  FDOT3 
      00AD4E 56 04 98         [ 4]    1     CALL QBRAN
      00AD4F 2E EE                    2     .word FDOT3
      00AD4F CD AC E3         [ 4]  365     CALL    TOR 
      00AD52 CD 85            [ 2]  366     JRA   FDOT2 
      002EEE                        367 FDOT3:
      002EEE                        368     _DOLIT  '.' 
      00AD54 63 CD 84         [ 4]    1     CALL DOLIT 
      00AD57 EF 00                    2     .word '.' 
      00AD59 04 CD 86         [ 4]  369     CALL    HOLD 
      00AD5C F6 CD 84         [ 4]  370     CALL    DDIGS
      00AD5F EF 00            [ 2]  371     JRA   FDOT9  
      002EFB                        372 FDOT6: ; e>=0 
      00AD61 02 CD            [ 2]  373     JRA   FDOT8
      002EFD                        374 FDOT7:     
      002EFD                        375     _DOLIT  '0'
      00AD63 8C 51 CD         [ 4]    1     CALL DOLIT 
      00AD66 89 06                    2     .word '0' 
      00AD68 81 AD 4B         [ 4]  376     CALL    HOLD 
      002F05                        377 FDOT8:
      00AD6B 03 53 46         [ 4]  378     CALL    DONXT 
      00AD6E 5A FD                  379     .word   FDOT7
      00AD6F CD 27 1D         [ 4]  380     CALL    DDIGS 
      002F0D                        381 FDOT9:
      00AD6F CD AD 11         [ 4]  382     CALL    FNE 
      002F10                        383     _QBRAN  FDOT10 
      00AD72 CD 84 EF         [ 4]    1     CALL QBRAN
      00AD75 FF FE                    2     .word FDOT10
      002F15                        384     _DOLIT '-' 
      00AD77 CD 86 F6         [ 4]    1     CALL DOLIT 
      00AD7A CD 86                    2     .word '-' 
      00AD7C 62 CD 88         [ 4]  385     CALL   HOLD 
      002F1D                        386 FDOT10:
      00AD7F A7 CD 84         [ 4]  387     CALL    EDIGS 
      00AD82 EF 00 FF         [ 4]  388     CALL    TYPES 
      00AD85 CD 86 F6         [ 4]  389     CALL    RFROM 
      00AD88 CD A9 09         [ 4]  390     CALL    BASE 
      00AD8B CD 84 EF         [ 4]  391     CALL    STORE 
      00AD8E 00               [ 4]  392     RET 
                                    393 
                                    394 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    395 ; return parsed exponent or 
                                    396 ; 0 if failed
                                    397 ; at entry exprect *a=='E'    
                                    398 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002F2D                        399 parse_exponent: ; a cntr -- e -1 | 0 
      00AD8F 01 CD 86         [ 4]  400     CALL TOR   ; R: cntr 
      00AD92 F6 CD 85         [ 4]  401     CALL DUPP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 172.
Hexadecimal [24-Bits]



      00AD95 B4 CD 87         [ 4]  402     CALL CAT 
      002F36                        403     _DOLIT 'E' 
      00AD98 0A CD AC         [ 4]    1     CALL DOLIT 
      00AD9B E3 CD                    2     .word 'E' 
      00AD9D 85 51 81         [ 4]  404     CALL EQUAL 
      002F3E                        405     _QBRAN 1$
      00ADA0 AD 6B 03         [ 4]    1     CALL QBRAN
      00ADA3 53 46                    2     .word 1$
      00ADA5 4E 0B 97         [ 4]  406     CALL ONEP 
      00ADA6 CD 05 34         [ 4]  407     CALL RFROM  ; a cntr 
      00ADA6 CD AD 11         [ 4]  408     CALL ONEM
      00ADA9 CD 84 EF         [ 4]  409     CALL DUPP 
      002F4F                        410     _QBRAN 2$ ; a cntr 
      00ADAC FF FD CD         [ 4]    1     CALL QBRAN
      00ADAF 86 F6                    2     .word 2$
      00ADB1 CD 86 62         [ 4]  411     CALL ZERO
      00ADB4 CD 86 99         [ 4]  412     CALL DUPP 
      00ADB7 CD 84 EF         [ 4]  413     CALL DSWAP ; 0 0 a cntr  
      00ADBA 00 80 CD         [ 4]  414     CALL nsign 
      00ADBD 86 F6 CD         [ 4]  415     CALL TOR   ; R: esign  
      00ADC0 84 EF 00         [ 4]  416     CALL parse_digits
      002F66                        417     _QBRAN PARSEXP_SUCCESS ; parsed to end of string 
      00ADC3 06 CD 8C         [ 4]    1     CALL QBRAN
      00ADC6 51 CD                    2     .word PARSEXP_SUCCESS
                                    418 ; failed invalid character
      002F6B                        419     _DDROP ; 0 a 
      00ADC8 85 B4 CD         [ 2]    1    ADDW X,#2*CELLL 
      002F6E                        420 1$: 
      00ADCB 87 0A CD         [ 4]  421     CALL RFROM ; sign||cntr  
      002F71                        422 2$:
      002F71                        423     _DDROP  ; a cntr || a sign || 0 cntr   
      00ADCE AC E3 CD         [ 2]    1    ADDW X,#2*CELLL 
      00ADD1 85 51 81         [ 4]  424     CALL ZERO   ; return only 0 
      00ADD4 AD               [ 4]  425     RET 
      002F78                        426 PARSEXP_SUCCESS: 
      002F78                        427     _DDROP ; drop dhi a 
      00ADD5 A2 03 53         [ 2]    1    ADDW X,#2*CELLL 
      00ADD8 46 56 34         [ 4]  428     CALL RFROM ; es 
      00ADDA                        429     _QBRAN 1$
      00ADDA CD AD 11         [ 4]    1     CALL QBRAN
      00ADDD CD 84                    2     .word 1$
      00ADDF EF 00 04         [ 4]  430     CALL NEGAT
      002F86                        431 1$:
      002F86                        432     _DOLIT -1 ; -- e -1 
      00ADE2 CD 87 0A         [ 4]    1     CALL DOLIT 
      00ADE5 CD AC                    2     .word -1 
      00ADE7 E3               [ 4]  433     RET 
                                    434 
                                    435 
                                    436 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    437 ;   FLOAT?  ( a dlo dhi a+ cntr sign d? -- f -3 | a 0 )
                                    438 ;   called by NUMBER? 
                                    439 ;   convert string to float 
                                    440 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002F8C                        441     _HEADER FLOATQ,5,"FLOAT?"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 173.
Hexadecimal [24-Bits]



      00ADE8 CD 85                    1         .word LINK 
                           002F8E     2         LINK=.
      00ADEA 51                       3         .byte 5  
      00ADEB 81 AD D6 04 46 3E        4         .ascii "FLOAT?"
      002F95                          5         FLOATQ:
      002F95                        442     _QBRAN FLOATQ0 
      00ADF1 4D 45 98         [ 4]    1     CALL QBRAN
      00ADF3 2F 9D                    2     .word FLOATQ0
      00ADF3 CD AC F5         [ 2]  443     JP FLOAT_ERROR  ; not a float, string start with '#'
      002F9D                        444 FLOATQ0:
                                    445 ; BASE must be 10 
      00ADF6 CD AD A6         [ 4]  446     CALL BASE 
      00ADF9 CD AD 6F         [ 4]  447     CALL AT 
      002FA3                        448     _DOLIT 10 
      00ADFC 90 93 90         [ 4]    1     CALL DOLIT 
      00ADFF FE 90                    2     .word 10 
      00AE01 89 4F 90         [ 4]  449     CALL EQUAL 
      002FAB                        450     _QBRAN FLOAT_ERROR 
      00AE04 5E 2A 01         [ 4]    1     CALL QBRAN
      00AE07 43 3C                    2     .word FLOAT_ERROR
                                    451 ; if float next char is '.' or 'E' 
      00AE08 CD 05 E2         [ 4]  452     CALL TOR ; R: sign  
      00AE08 90 5E 90         [ 4]  453     CALL TOR ; R: sign cntr 
      00AE0B 95 FF 1D         [ 4]  454     CALL DUPP
      00AE0E 00 02 90         [ 4]  455     CALL CAT 
      002FBC                        456     _DOLIT '.' 
      00AE11 85 4F 90         [ 4]    1     CALL DOLIT 
      00AE14 5D 2A                    2     .word '.' 
      00AE16 01 43 FA         [ 4]  457     CALL EQUAL 
      00AE18                        458     _QBRAN FLOATQ1 ; not a dot 
      00AE18 90 5E 90         [ 4]    1     CALL QBRAN
      00AE1B 95 FF                    2     .word FLOATQ1
      00AE1D 81 AD EE         [ 4]  459     CALL ONEP 
      00AE20 04 4D 45         [ 4]  460     CALL RFROM  ; dlo dhi a cntr R: sign  
      00AE23 3E 46 A4         [ 4]  461     CALL ONEM 
      00AE25 CD 06 19         [ 4]  462     CALL DUPP 
      00AE25 CD 86 99         [ 4]  463     CALL TOR  ; R: sign cntr 
                                    464 ; parse fractional part
      00AE28 CD 89 6C         [ 4]  465     CALL parse_digits ; dlo dhi a cntr -- dm a cntr 
      00AE2B CD 84 EF         [ 4]  466     CALL DUPP 
      00AE2E 00 7F CD         [ 4]  467     CALL RFROM 
      00AE31 89 D3 CD         [ 4]  468     CALL SWAPP 
      00AE34 85 18 AE         [ 4]  469     CALL SUBB ; fd -> fraction digits count 
      00AE37 3B CD AD         [ 4]  470     CALL TOR  ; dlo dhi a cntr R: sign fd 
      00AE3A DA 06 19         [ 4]  471     CALL DUPP ; cntr cntr  
      00AE3B                        472     _QBRAN 1$ ; end of string, no exponent
      00AE3B 90 93 90         [ 4]    1     CALL QBRAN
      00AE3E FE 4F                    2     .word 1$
      00AE40 90 95            [ 2]  473     JRA FLOATQ2
      00AE42 90 5E 90         [ 4]  474 1$: CALL SWAPP 
      002FF7                        475     _DROP ; a
      00AE45 89 1C 00         [ 2]    1     ADDW X,#CELLL  
      00AE48 02 CD            [ 2]  476     JRA FLOATQ3        
      002FFC                        477 FLOATQ1: ; must push fd==0 on RSTACK 
      00AE4A 88 A7 CD         [ 4]  478     CALL RFROM ; cntr 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 174.
Hexadecimal [24-Bits]



      00AE4D A7 18 CD         [ 4]  479     CALL ZERO  ; fd 
      00AE50 86 A9 1C         [ 4]  480     CALL TOR   ; dm a cntr R: sign fd 
      003005                        481 FLOATQ2: 
      00AE53 00 02 CD         [ 4]  482     CALL parse_exponent 
      003008                        483     _QBRAN FLOAT_ERROR0 ; exponent expected 
      00AE56 84 EF 00         [ 4]    1     CALL QBRAN
      00AE59 7F CD                    2     .word FLOAT_ERROR0
      00300D                        484 FLOATQ3: ; dm 0 || dm e  
      00AE5B 89 D3 CD         [ 4]  485     CALL RFROM ;  fd  
      00AE5E 85 18 AE         [ 4]  486     CALL SUBB  ; exp=e-fd 
      00AE61 65 CD AD         [ 4]  487     CALL NROT 
      00AE64 DA 05 34         [ 4]  488     CALL RFROM  ; sign 
      00AE65                        489     _QBRAN FLOATQ4 
      00AE65 4F F7 CD         [ 4]    1     CALL QBRAN
      00AE68 85 B4                    2     .word FLOATQ4
      00AE6A CD 87 0A         [ 4]  490     CALL DNEGA 
      003021                        491 FLOATQ4:
      00AE6D CD AD 6F         [ 4]  492     CALL ROT 
      00AE70 CD AD A6         [ 4]  493     CALL STEXP 
      00AE73 81 AE 20         [ 4]  494     CALL ROT 
      00302A                        495     _DROP 
      00AE76 02 45 2E         [ 2]    1     ADDW X,#CELLL  
      00AE79 CD 2D 26         [ 4]  496     CALL SFN 
      00AE79 CD 87 5F         [ 4]  497     CALL SFZ 
      003033                        498     _DOLIT -3 
      00AE7C CD 85 63         [ 4]    1     CALL DOLIT 
      00AE7F CD 86                    2     .word -3 
      00AE81 62               [ 4]  499     RET       
      003039                        500 FLOAT_ERROR0: 
      00AE82 CD 84 EF         [ 4]  501     CALL DRFROM ; sign df      
      00303C                        502 FLOAT_ERROR: 
      00AE85 00 0A CD         [ 4]  503     CALL DEPTH 
      00AE88 87 5F CD         [ 4]  504     CALL CELLS 
      00AE8B 85 51 CD         [ 4]  505     CALL SPAT 
      00AE8E AD F3 29         [ 4]  506     CALL SWAPP 
      00AE90 CD 08 3C         [ 4]  507     CALL PLUS  
      00AE90 CD 86 62         [ 4]  508     CALL SPSTO 
      00AE93 CD A7 18         [ 4]  509     CALL ZERO 
      00AE96 CD               [ 4]  510     RET 
                                    511 
                                    512 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    513 ;  LSCALE ( f# -- f# )
                                    514 ;  m *=10 , e -= 1
                                    515 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      003052                        516     _HEADER LSCALE,6,"LSCALE"
      00AE97 8F C7                    1         .word LINK 
                           003054     2         LINK=.
      00AE99 CD                       3         .byte 6  
      00AE9A 8E 8B 43 41 4C 45        4         .ascii "LSCALE"
      00AE9C                          5         LSCALE:
      00AE9C CD A7 84         [ 4]  517     CALL ATEXP 
      00AE9F CD 85 B4         [ 4]  518     CALL ONE 
      00AEA2 CD 8C 17         [ 4]  519     CALL SUBB 
      00AEA5 CD 86 62         [ 4]  520     CALL TOR
      003067                        521     _DOLIT 10 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 175.
Hexadecimal [24-Bits]



      00AEA8 CD 86 99         [ 4]    1     CALL DOLIT 
      00AEAB CD 85                    2     .word 10 
      00AEAD 18 AE B2         [ 4]  522     CALL DSSTAR
      00AEB0 20 EA 34         [ 4]  523     CALL RFROM 
      00AEB2 CD 2D A5         [ 4]  524     CALL STEXP 
      00AEB2 CD               [ 4]  525     RET  
                                    526 
                                    527 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    528 ;  RSCALE ( f# -- f# )
                                    529 ;  m /=10 , e+=1 
                                    530 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      003076                        531     _HEADER RSCALE,6,"RSCALE"
      00AEB3 86 C1                    1         .word LINK 
                           003078     2         LINK=.
      00AEB5 CD                       3         .byte 6  
      00AEB6 87 5F CD 85 63 CD        4         .ascii "RSCALE"
      00307F                          5         RSCALE:
      00AEBC 89 90 CD         [ 4]  532     CALL ATEXP 
      00AEBF 85 18 AE         [ 4]  533     CALL ONE 
      00AEC2 9C CD 84         [ 4]  534     CALL PLUS 
      00AEC5 EF 00 2E         [ 4]  535     CALL TOR 
      00308B                        536     _DOLIT 10 
      00AEC8 CD 8E 9B         [ 4]    1     CALL DOLIT 
      00AECB CD A7                    2     .word 10 
      00AECD 84 CD AD         [ 4]  537     CALL DSLMOD 
      00AED0 34 CD 85         [ 4]  538     CALL ROT 
      003096                        539     _DROP 
      00AED3 18 AE DE         [ 2]    1     ADDW X,#CELLL  
      00AED6 CD 84 EF         [ 4]  540     CALL RFROM 
      00AED9 00 2D CD         [ 4]  541     CALL STEXP 
      00AEDC 8E               [ 4]  542     RET 
                                    543 
                                    544 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    545 ;  SCALEUP ( ud u1 u2 -- ud*10 u1 u2 )
                                    546 ;  while (ud<=0xcccccccc && u1<u2 ){
                                    547 ;        ud*10;
                                    548 ;        u2--;
                                    549 ;  }  
                                    550 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0030A0                        551 SCALEUP:
      00AEDD 9B 08 27         [ 4]  552     CALL DDUP
      00AEDE CD 09 26         [ 4]  553     CALL LESS  
      0030A6                        554     _QBRAN SCALEUP3
      00AEDE 1C 00 02         [ 4]    1     CALL QBRAN
      00AEE1 CD 8E                    2     .word SCALEUP3
      00AEE3 F0 CD 8F         [ 4]  555     CALL DTOR   ; R: u1 u2  
      00AEE6 F1 CD 85         [ 4]  556     CALL DDUP 
      0030B1                        557     _DOLIT 0XCCCC 
      00AEE9 B4 CD 88         [ 4]    1     CALL DOLIT 
      00AEEC 4C CD                    2     .word 0XCCCC 
      0030B6                        558     _DOLIT 0XCCC 
      00AEEE 85 18 AE         [ 4]    1     CALL DOLIT 
      00AEF1 FD CD                    2     .word 0XCCC 
      00AEF3 84 EF 00         [ 4]  559     CALL DGREAT  
      0030BE                        560     _TBRAN SCALEUP2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 176.
Hexadecimal [24-Bits]



      00AEF6 45 CD 84         [ 4]    1     CALL TBRAN 
      00AEF9 B6 CD                    2     .word SCALEUP2 
      0030C3                        561     _DOLIT 10 
      00AEFB 90 B0 6F         [ 4]    1     CALL DOLIT 
      00AEFD 00 0A                    2     .word 10 
      00AEFD CD 85 B4         [ 4]  562     CALL UDSSTAR 
      00AF00 CD 87 5F         [ 4]  563     CALL DRFROM 
      00AF03 CD 85 51         [ 4]  564     CALL ONEM
      00AF06 81 AE            [ 2]  565     JRA SCALEUP
      0030D3                        566 SCALEUP2:
      00AF08 76 02 46         [ 4]  567     CALL DRFROM
      0030D6                        568 SCALEUP3: 
      00AF0B 2E               [ 4]  569     RET 
                                    570 
                                    571 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    572 ; SCALEDOWN ( ud u1 u2 -- ud u1 u2 )
                                    573 ;  whhile (ud && u1>u2 ){ 
                                    574 ;     ud/10;
                                    575 ;     u2++;
                                    576 ;  } 
                                    577 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00AF0C                        578 SCALEDOWN: 
      00AF0C CD 87 5F         [ 4]  579     CALL DDUP 
      00AF0F CD 85 63         [ 4]  580     CALL GREAT 
      0030DD                        581     _QBRAN SCALDN3 
      00AF12 CD 86 62         [ 4]    1     CALL QBRAN
      00AF15 CD 84                    2     .word SCALDN3
      00AF17 EF 00 0A         [ 4]  582     CALL DTOR 
      00AF1A CD 87 5F         [ 4]  583     CALL DDUP 
      00AF1D CD 85 51         [ 4]  584     CALL DZEQUAL 
      0030EB                        585     _TBRAN SCALDN2  
      00AF20 CD AD F3         [ 4]    1     CALL TBRAN 
      00AF23 CD 86                    2     .word SCALDN2 
      0030F0                        586     _DOLIT 10
      00AF25 99 CD 89         [ 4]    1     CALL DOLIT 
      00AF28 6C CD                    2     .word 10 
      00AF2A 84 EF 00         [ 4]  587     CALL ZERO  
      00AF2D 08 CD 89         [ 4]  588     CALL DSLASH 
      00AF30 D3 CD 85         [ 4]  589     CALL DRFROM 
      00AF33 18 AF 39         [ 4]  590     CALL ONEP  
      00AF36 CC AE            [ 2]  591     JRA SCALEDOWN 
      003103                        592 SCALDN2:
      00AF38 90 29 21         [ 4]  593     CALL DRFROM 
      00AF39                        594 SCALDN3:
      00AF39 CD               [ 4]  595     RET 
                                    596 
                                    597 
                                    598 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    599 ;  F-ALIGN ( f#1 f#2 -- m1 m2 e )
                                    600 ;  align to same exponent 
                                    601 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      003107                        602     _HEADER FALIGN,7,"F-ALIGN"
      00AF3A 8F C7                    1         .word LINK 
                           003109     2         LINK=.
      00AF3C CD                       3         .byte 7  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 177.
Hexadecimal [24-Bits]



      00AF3D 86 62 CD AD 34 CD 85     4         .ascii "F-ALIGN"
      003111                          5         FALIGN:
      00AF44 18 AF 4A         [ 4]  603     CALL ATEXP 
      00AF47 CD 89 18         [ 4]  604     CALL TOR 
      00AF4A CD 27 B4         [ 4]  605     CALL DSWAP 
      00AF4A CD 8E 8B         [ 4]  606     CALL ATEXP 
      00AF4D CD 85 C5         [ 4]  607     CALL TOR    ; m2 m1 R: e2 e1 
      00AF50 CD 86 D0         [ 4]  608     CALL DSWAP 
      00AF53 CD 85 18         [ 4]  609     CALL DRAT 
      00AF56 AF 7B FA         [ 4]  610     CALL EQUAL 
      00AF58                        611     _TBRAN FALGN8
      00AF58 CD A7 84         [ 4]    1     CALL TBRAN 
      00AF5B CD 85                    2     .word FALGN8 
                                    612 ; scaleup the largest float 
                                    613 ; but limit mantissa <=0xccccccc
                                    614 ; to avoid mantissa overflow     
      00AF5D B4 CD 8C         [ 4]  615     CALL DRAT ; m1 m2 e2 e1 
      00AF60 17 CD 88         [ 4]  616     CALL GREAT 
      003134                        617     _QBRAN FALGN4 ; e2<e1 
      00AF63 4C CD 85         [ 4]    1     CALL QBRAN
      00AF66 18 AF                    2     .word FALGN4
                                    618 ; e2>e1 then scale up m2   
      00AF68 6E CD 86         [ 4]  619     CALL DRFROM 
      00AF6B 62 20 EA         [ 4]  620     CALL SWAPP 
      00AF6E CD 30 A0         [ 4]  621     CALL SCALEUP 
      00AF6E CD 84 EF         [ 4]  622     CALL SWAPP 
      00AF71 00 2E CD         [ 4]  623     CALL DTOR 
      00AF74 8E 9B            [ 2]  624     JRA FALGN6
      00314A                        625 FALGN4: ; e2<e1 then scaleup m1 
      00AF76 CD A7 9D         [ 4]  626     CALL DSWAP 
      00AF79 20 12 21         [ 4]  627     CALL DRFROM 
      00AF7B CD 30 A0         [ 4]  628     CALL SCALEUP 
      00AF7B 20 08 03         [ 4]  629     CALL DTOR
      00AF7D CD 27 B4         [ 4]  630     CALL DSWAP 
                                    631 ; check again for e2==e1 
                                    632 ; if scaleup was not enough 
                                    633 ; to equalize exponent then
                                    634 ; scaledown smallest float     
      003159                        635 FALGN6: 
      00AF7D CD 84 EF         [ 4]  636     CALL DRAT 
      00AF80 00 30 CD         [ 4]  637     CALL EQUAL 
      00315F                        638     _TBRAN FALGN8 
      00AF83 8E 9B A6         [ 4]    1     CALL TBRAN 
      00AF85 31 AE                    2     .word FALGN8 
                                    639 ; e2!=e1 need to scale down smallest 
      00AF85 CD 85 03         [ 4]  640     CALL DRAT 
      00AF88 AF 7D CD         [ 4]  641     CALL GREAT 
      00316A                        642     _QBRAN FALGN7 ; e2<e1 
      00AF8B A7 9D 98         [ 4]    1     CALL QBRAN
      00AF8D 31 80                    2     .word FALGN7
                                    643 ; e2>e1 scaledown m1 
      00AF8D CD AD 34         [ 4]  644     CALL DSWAP 
      00AF90 CD 85 18         [ 4]  645     CALL DRFROM 
      00AF93 AF 9D CD         [ 4]  646     CALL SCALEDOWN
      00AF96 84 EF 00         [ 4]  647     CALL SWAPP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 178.
Hexadecimal [24-Bits]



      00AF99 2D CD 8E         [ 4]  648     CALL DTOR 
      00AF9C 9B 0F            [ 2]  649     JRA FALGN71  
      00AF9D                        650 FALGN7: ; e2<e1 scaledown m2 
      00AF9D CD 8E F0         [ 4]  651     CALL DRFROM 
      00AFA0 CD 8F F1         [ 4]  652     CALL SWAPP 
      00AFA3 CD 85 B4         [ 4]  653     CALL SCALEDOWN 
      00AFA6 CD 87 5F         [ 4]  654     CALL SWAPP 
      00AFA9 CD 85 51         [ 4]  655     CALL DTOR 
                                    656 ; after scaledown if e2!=e1 
                                    657 ; this imply that one of mantissa 
                                    658 ; as been nullified by scalling 
                                    659 ; hence keep largest exponent 
      00318F                        660 FALGN71:
      00AFAC 81 29 39         [ 4]  661     CALL DRAT 
      00AFAD CD 08 FA         [ 4]  662     CALL EQUAL
      003195                        663     _TBRAN FALGN8 
      00AFAD CD 86 62         [ 4]    1     CALL TBRAN 
      00AFB0 CD 86                    2     .word FALGN8 
      00AFB2 99 CD 85         [ 4]  664     CALL DRFROM 
      00AFB5 81 CD 84         [ 4]  665     CALL DDUP 
      00AFB8 EF 00 45         [ 4]  666     CALL GREAT 
      0031A3                        667     _TBRAN FALGN72
      00AFBB CD 89 7A         [ 4]    1     CALL TBRAN 
      00AFBE CD 85                    2     .word FALGN72 
      00AFC0 18 AF EE         [ 4]  668     CALL SWAPP     
      0031AB                        669 FALGN72:
      00AFC3 CD 8C 17         [ 4]  670     CALL DTOR  ; now smallest e is at rtop.
      0031AE                        671 FALGN8:
      00AFC6 CD 85 B4         [ 4]  672     CALL DRFROM 
      0031B1                        673     _DROP 
      00AFC9 CD 8C 24         [ 2]    1     ADDW X,#CELLL  
      00AFCC CD               [ 4]  674     RET 
                                    675 
                                    676 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    677 ;   F+ ( f#1 f#2 -- f#1+f#2 )
                                    678 ;   float addition 
                                    679 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0031B5                        680     _HEADER FPLUS,2,"F+"
      00AFCD 86 99                    1         .word LINK 
                           0031B7     2         LINK=.
      00AFCF CD                       3         .byte 2  
      00AFD0 85 18                    4         .ascii "F+"
      0031BA                          5         FPLUS:
      00AFD2 AF F1 CD         [ 4]  681     CALL FALIGN 
      00AFD5 8C 83 CD         [ 4]  682     CALL TOR 
      00AFD8 86 99 CD         [ 4]  683     CALL DPLUS
      00AFDB A8 34 CD         [ 4]  684     CALL DSIGN 
      00AFDE A5 D6 CD         [ 4]  685     CALL TOR 
      00AFE1 86 62 CD         [ 4]  686     CALL DABS 
      00AFE4 A6 03 CD         [ 4]  687     CALL SCALETOM
      00AFE7 85 18 AF         [ 4]  688     CALL RFROM 
      0031D2                        689     _QBRAN FPLUS1 
      00AFEA F8 1C 00         [ 4]    1     CALL QBRAN
      00AFED 04 DA                    2     .word FPLUS1
      00AFEE CD 08 98         [ 4]  690     CALL DNEGA  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 179.
Hexadecimal [24-Bits]



      0031DA                        691 FPLUS1: 
      00AFEE CD 85 B4         [ 4]  692     CALL ROT   
      00AFF1 CD 05 34         [ 4]  693     CALL RFROM
      00AFF1 1C 00 04         [ 4]  694     CALL PLUS  
      00AFF4 CD 8C 83         [ 4]  695     CALL STEXP 
      00AFF7 81               [ 4]  696     RET 
                                    697 
                                    698 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    699 ;  F- ( f#1 f#2 -- f#1-f#2 )
                                    700 ;  substraction 
                                    701 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00AFF8                        702     _HEADER FSUB,2,"F-"
      00AFF8 1C 00                    1         .word LINK 
                           0031E9     2         LINK=.
      00AFFA 04                       3         .byte 2  
      00AFFB CD 85                    4         .ascii "F-"
      0031EC                          5         FSUB:
      00AFFD B4 CD 85         [ 4]  703     CALL FALIGN 
      00B000 18 B0 06         [ 4]  704     CALL TOR 
      00B003 CD 89 06         [ 4]  705     CALL DSUB
      00B006 CD 26 A9         [ 4]  706     CALL DSIGN 
      00B006 CD 84 EF         [ 4]  707     CALL TOR 
      00B009 FF FF 81         [ 4]  708     CALL DABS 
      00B00C AF 09 05         [ 4]  709     CALL SCALETOM 
      00B00F 46 4C 4F         [ 4]  710     CALL RFROM 
      003204                        711     _QBRAN FSUB1 
      00B012 41 54 3F         [ 4]    1     CALL QBRAN
      00B015 32 0C                    2     .word FSUB1
      00B015 CD 85 18         [ 4]  712     CALL DNEGA 
      00320C                        713 FSUB1:
      00B018 B0 1D CC         [ 4]  714     CALL ROT 
      00B01B B0 BC 34         [ 4]  715     CALL RFROM
      00B01D CD 08 3C         [ 4]  716     CALL PLUS  
      00B01D CD 87 5F         [ 4]  717     CALL STEXP 
      00B020 CD               [ 4]  718     RET 
                                    719 
                                    720 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    721 ; /mod10  ( m -- m/10 r )
                                    722 ; divide mantissa by 10 
                                    723 ; return quotient and remainder 
                                    724 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      003219                        725 UMOD10:
      003219                        726     _DOLIT 10 
      00B021 85 63 CD         [ 4]    1     CALL DOLIT 
      00B024 84 EF                    2     .word 10 
      00B026 00 0A CD         [ 4]  727     CALL DSLMOD
      00B029 89 7A CD         [ 4]  728     CALL ROT  
      00B02C 85               [ 4]  729     RET 
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
      003225                        739     _HEADER SCALETOM,7,"SCALE>M"
      00B02D 18 B0                    1         .word LINK 
                           003227     2         LINK=.
      00B02F BC                       3         .byte 7  
      00B030 CD 86 62 CD 86 62 CD     4         .ascii "SCALE>M"
      00322F                          5         SCALETOM:
      00B037 86 99 CD         [ 4]  740     CALL ZERO 
      00B03A 85 81 CD         [ 4]  741     CALL NROT 
      003235                        742 SCAL1:
      00B03D 84 EF 00         [ 4]  743     CALL DUPP 
      003238                        744     _DOLIT 0X7F 
      00B040 2E CD 89         [ 4]    1     CALL DOLIT 
      00B043 7A CD                    2     .word 0X7F 
      00B045 85 18 B0         [ 4]  745     CALL UGREAT 
      003240                        746     _QBRAN SCAL2  
      00B048 7C CD 8C         [ 4]    1     CALL QBRAN
      00B04B 17 CD                    2     .word SCAL2
      00B04D 85 B4 CD         [ 4]  747     CALL UMOD10 
      003248                        748     _DROP 
      00B050 8C 24 CD         [ 2]    1     ADDW X,#CELLL  
      00B053 86 99 CD         [ 4]  749     CALL ROT 
      00B056 86 62 CD         [ 4]  750     CALL ONEP 
      00B059 A6 03 CD         [ 4]  751     CALL NROT  
      00B05C 86 99            [ 2]  752     JRA SCAL1 
      003256                        753 SCAL2: 
      00B05E CD               [ 4]  754     RET 
                                    755 
                                    756 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    757 ;  UDIV10 ( ut -- ut )
                                    758 ;  divide a 48 bits uint by 10 
                                    759 ;  used to scale down MM* 
                                    760 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      003257                        761 UDIV10:
      00B05F 85 B4            [ 1]  762     LDW Y,X 
      00B061 CD 86            [ 2]  763     LDW Y,(Y)
      00B063 A9 CD            [ 1]  764     LD A,#10 
      00B065 89 52            [ 2]  765     DIV Y,A 
      00B067 CD               [ 2]  766     LDW (X),Y 
      00B068 86 62            [ 1]  767     LD YH,A 
      00B06A CD 86            [ 1]  768     LD A,(2,X)
      00B06C 99 CD            [ 1]  769     LD YL,A 
      00B06E 85 18            [ 1]  770     LD A,#10 
      00B070 B0 74            [ 2]  771     DIV Y,A 
      00B072 20 11            [ 1]  772     LD YH,A 
      00B074 CD 86            [ 1]  773     LD A,YL 
      00B076 A9 1C            [ 1]  774     LD (2,X),A 
      00B078 00 02            [ 1]  775     LD A,(3,X)
      00B07A 20 11            [ 1]  776     LD YL,A 
      00B07C A6 0A            [ 1]  777     LD A,#10 
      00B07C CD 85            [ 2]  778     DIV Y,A 
      00B07E B4 CD            [ 1]  779     LD YH,A 
      00B080 8C 83            [ 1]  780     LD A,YL 
      00B082 CD 86            [ 1]  781     LD (3,X),A 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 181.
Hexadecimal [24-Bits]



      00B084 62 04            [ 1]  782     LD A,(4,X)
      00B085 90 97            [ 1]  783     LD YL,A 
      00B085 CD AF            [ 1]  784     LD A,#10 
      00B087 AD CD            [ 2]  785     DIV Y,A 
      00B089 85 18            [ 1]  786     LD YH,A 
      00B08B B0 B9            [ 1]  787     LD A,YL 
      00B08D E7 04            [ 1]  788     LD (4,X),A 
      00B08D CD 85            [ 1]  789     LD A,(5,X)
      00B08F B4 CD            [ 1]  790     LD YL,A 
      00B091 89 52            [ 1]  791     LD A,#10 
      00B093 CD 88            [ 2]  792     DIV Y,A 
      00B095 7C CD            [ 1]  793     LD A,YL 
      00B097 85 B4            [ 1]  794     LD (5,X),A 
      00B099 CD               [ 4]  795     RET 
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
      003299                        806     _HEADER MMSTAR,3,"MM*"
      00B09A 85 18                    1         .word LINK 
                           00329B     2         LINK=.
      00B09C B0                       3         .byte 3  
      00B09D A1 CD 89                 4         .ascii "MM*"
      00329F                          5         MMSTAR:
      00B0A0 18 08 27         [ 4]  807     CALL DDUP
      00B0A1 CD 28 89         [ 4]  808     CALL DZEQUAL
      0032A5                        809     _TBRAN MMSTA2
      00B0A1 CD 88 5D         [ 4]    1     CALL TBRAN 
      00B0A4 CD AE                    2     .word MMSTA2 
      0032AA                        810 MMSTA1:
      00B0A6 25 CD 88         [ 4]  811     CALL DOVER 
      00B0A9 5D 1C 00         [ 4]  812     CALL DZEQUAL 
      0032B0                        813     _QBRAN MMSTA3 
      00B0AC 02 CD AD         [ 4]    1     CALL QBRAN
      00B0AF A6 CD                    2     .word MMSTA3
      0032B5                        814 MMSTA2: ; ( -- 0 0 0 )
      00B0B1 AD 6F CD         [ 2]  815     ADDW X,#2 
      00B0B4 84 EF            [ 1]  816     CLRW Y 
      00B0B6 FF               [ 2]  817     LDW (X),Y 
      00B0B7 FD 81            [ 2]  818     LDW (2,X),Y
      00B0B9 EF 04            [ 2]  819     LDW (4,X),Y 
      00B0B9 CD               [ 4]  820     RET 
      0032C0                        821 MMSTA3:
      00B0BA A9 A1 A9         [ 4]  822     CALL DSIGN 
      00B0BC CD 05 E2         [ 4]  823     CALL TOR    ; R: m2sign 
      00B0BC CD 8C C5         [ 4]  824     CALL DABS   ; m1 um2 
      00B0BF CD 8C 0A         [ 4]  825     CALL DSWAP  ; um2 m1 
      00B0C2 CD 86 79         [ 4]  826     CALL DSIGN  ; um2 m1 m1sign 
      00B0C5 CD 86 A9         [ 4]  827     CALL RFROM 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 182.
Hexadecimal [24-Bits]



      00B0C8 CD 88 BC         [ 4]  828     CALL XORR 
      00B0CB CD 86 86         [ 4]  829     CALL TOR   ; R: product_sign 
      00B0CE CD 8C 83         [ 4]  830     CALL DABS  ; um2 um1  
      00B0D1 81 B0 0E         [ 4]  831     CALL DTOR  ; um2 
      00B0D4 06 4C 53         [ 4]  832     CALL DUPP  ; um2 um2hi 
      00B0D7 43 41 4C         [ 4]  833     CALL RAT   ; um2 um2hi um1hi
                                    834 ; first partial product  
                                    835 ; pd1=um2hi*um1hi 
      00B0DA 45 0B 16         [ 4]  836     CALL STAR 
      00B0DB CD 0C 03         [ 4]  837     CALL ZERO 
      00B0DB CD AD F3         [ 4]  838     CALL SWAPP ; pd1<<16  
      00B0DE CD 8C 8E         [ 4]  839     CALL DSWAP ; pd1 um2 
      00B0E1 CD 89 52         [ 4]  840     CALL OVER  ; pd1 um2 um2lo 
      00B0E4 CD 86 62         [ 4]  841     CALL RFROM ; pd1 um2 um2lo um1hi 
                                    842 ; pd2=um2lo*um1hi 
      00B0E7 CD 84 EF         [ 4]  843     CALL UMSTA ; pd1 um2 pd2 
      00B0EA 00 0A CD         [ 4]  844     CALL DSWAP ; pd1 pd2 um2 
      00B0ED A8 0E CD         [ 4]  845     CALL RAT   ; pd1 pd2 um2 um1lo 
                                    846 ; pd3= um2hi*um1lo 
      00B0F0 85 B4 CD         [ 4]  847     CALL UMSTA ; pd1 pd2 um2lo pd3 
      00B0F3 AE 25 81         [ 4]  848     CALL ROT ; pd1 pd2 pd3 um2lo 
      00B0F6 B0 D4 06         [ 4]  849     CALL TOR ; pd1 pd2 pd3 R: psign um1lo um2lo 
                                    850 ; pd1+pd2+pd3  pd1
      00B0F9 52 53 43         [ 4]  851     CALL DPLUS 
      00B0FC 41 4C 45         [ 4]  852     CALL DPLUS  
      00B0FF CD 29 21         [ 4]  853     CALL DRFROM ; triple um2lo um1lo 
                                    854 ; last partial product um2lo*um1lo 
      00B0FF CD AD F3         [ 4]  855     CALL UMSTA ; prod pd4 
                                    856 ; mm*=prod<<16+pd4  
      00B102 CD 8C 8E         [ 4]  857     CALL DTOR ;   R: psign pd4lo pd4hi  
                                    858  ; add pd4hi to prodlo and propagate carry 
      00B105 CD 88            [ 1]  859     LDW Y,X 
      00B107 BC CD 86         [ 2]  860     LDW Y,(2,Y)  ; prodlo 
      00B10A 62 CD 84         [ 2]  861     ADDW Y,(1,SP)  ; prodlo+pd4hi 
      00B10D EF 00            [ 2]  862     LDW (1,SP),Y    ; plo phi  
      00B10F 0A CD            [ 1]  863     LDW Y,X
      00B111 A7 43            [ 2]  864     LDW Y,(Y) ; prodhi  
      00B113 CD 88            [ 1]  865     JRNC MMSTA4
      00B115 5D 1C 00 02      [ 2]  866     ADDW Y,#1 ; add carry 
      00332B                        867 MMSTA4:     
      00B119 CD 85 B4         [ 2]  868     SUBW X,#2 
      00B11C CD               [ 2]  869     LDW (X),Y 
      00B11D AE 25            [ 2]  870     POPW Y 
      00B11F 81 02            [ 2]  871     LDW (2,X),Y 
      00B120 90 85            [ 2]  872     POPW Y 
      00B120 CD 88            [ 2]  873     LDW (4,X),Y
      00B122 A7 CD 89         [ 4]  874     CALL ZERO 
      00B125 A6 CD 85         [ 4]  875     CALL TOR 
      00333D                        876 MMSTA5:
      00B128 18 B1 56         [ 4]  877     CALL QDUP 
      003340                        878     _QBRAN MMSTA6 
      00B12B CD A9 83         [ 4]    1     CALL QBRAN
      00B12E CD 88                    2     .word MMSTA6
      00B130 A7 CD 84         [ 4]  879     CALL UDIV10 
      00B133 EF CC CC         [ 4]  880     CALL RFROM 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 183.
Hexadecimal [24-Bits]



      00B136 CD 84 EF         [ 4]  881     CALL ONEP 
      00B139 0C CC CD         [ 4]  882     CALL TOR 
      00B13C A9 46            [ 2]  883     JRA MMSTA5 
                                    884 ; now scale to double 
                                    885 ; scale further <= MAX_MANTISSA 
      003353                        886 MMSTA6: 
      00B13E CD 85 26         [ 4]  887     CALL RFROM 
      00B141 B1 53 CD         [ 4]  888     CALL NROT 
      00B144 84 EF 00         [ 4]  889     CALL SCALETOM
      00B147 0A CD A7         [ 4]  890     CALL DTOR 
      00B14A EC CD A9         [ 4]  891     CALL PLUS 
      00B14D A1 CD 8C         [ 4]  892     CALL DRFROM 
      00B150 24 20 CD         [ 4]  893     CALL RFROM
      00B153                        894     _QBRAN MMSTA7
      00B153 CD A9 A1         [ 4]    1     CALL QBRAN
      00B156 33 70                    2     .word MMSTA7
      00B156 81 08 98         [ 4]  895     CALL DNEGA
      00B157                        896 MMSTA7:
      00B157 CD 88 A7         [ 4]  897     CALL ROT ; m e 
      00B15A CD               [ 4]  898     RET 
                                    899 
                                    900 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    901 ;    F* ( f#1 f#2 -- f#3 )
                                    902 ;    float product 
                                    903 ;    f#3=f#1 * f#2 
                                    904 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      003374                        905     _HEADER FSTAR,2,"F*"
      00B15B 89 D3                    1         .word LINK 
                           003376     2         LINK=.
      00B15D CD                       3         .byte 2  
      00B15E 85 18                    4         .ascii "F*"
      003379                          5         FSTAR:
      00B160 B1 86 CD         [ 4]  906     CALL ATEXP ; f#1 m2 e2 
      00B163 A9 83 CD         [ 4]  907     CALL TOR   
      00B166 88 A7 CD         [ 4]  908     CALL DSWAP ; m2 f#1
      00B169 A9 09 CD         [ 4]  909     CALL ATEXP ; m2 m1 e1 
      00B16C 85 26 B1         [ 4]  910     CALL RFROM ; m2 m1 e1 e2 
      00B16F 83 CD 84         [ 4]  911     CALL PLUS  ; m2 m1 e 
      00B172 EF 00 0A         [ 4]  912     CALL TOR   ; m2 m1 R: e 
      00B175 CD 8C 83         [ 4]  913     CALL MMSTAR ; m2*m1 e   
      00B178 CD AC 37         [ 4]  914     CALL RFROM 
      00B17B CD A9 A1         [ 4]  915     CALL PLUS 
      00B17E CD 8C 17         [ 4]  916     CALL STEXP ; f#3 
      00B181 20               [ 4]  917     RET 
                                    918 
                                    919 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    920 ;  F/ ( f#1 f#2 -- f#3 )
                                    921 ;  float division
                                    922 ;  f#3 = f#1/f#2
                                    923 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00339B                        924     _HEADER FSLASH,2,"F/"
      00B182 D4 76                    1         .word LINK 
                           00339D     2         LINK=.
      00B183 02                       3         .byte 2  
      00B183 CD A9                    4         .ascii "F/"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 184.
Hexadecimal [24-Bits]



      0033A0                          5         FSLASH:
      00B185 A1 2D 73         [ 4]  925     CALL ATEXP  ; f#1 m2 e2 
      00B186 CD 05 E2         [ 4]  926     CALL TOR    ; f#1 m2   R: e2 
      00B186 81 B0 F8         [ 4]  927     CALL DSIGN  ; f#1 m2 m2sign 
      00B189 07 46 2D         [ 4]  928     CALL TOR    ; F#1 m2 R: e2 m2s 
      00B18C 41 4C 49         [ 4]  929     CALL DABS   ; F#1 um2 
      00B18F 47 4E B4         [ 4]  930     CALL DSWAP  ; m2 f#1 
      00B191 CD 2D 73         [ 4]  931     CALL ATEXP  ; m2 m1 e1 
      00B191 CD AD F3         [ 4]  932     CALL ONE    ; e2 slot on rstack  
      00B194 CD 86 62         [ 4]  933     CALL NRAT   ; m2 m1 e1 e2 
      00B197 CD A8 34         [ 4]  934     CALL SUBB   ; m2 m1 e 
      00B19A CD AD F3         [ 4]  935     CALL ONE    ; e slot on rstack 
      00B19D CD 86 62         [ 4]  936     CALL NRSTO  ; m2 m1 R: e m2s 
      00B1A0 CD A8 34         [ 4]  937     CALL DSIGN  ; m2 m1 m1sign 
      00B1A3 CD A9 B9         [ 4]  938     CALL RFROM  ; m2 m1 m1s m2s  
      00B1A6 CD 89 7A         [ 4]  939     CALL XORR   ; m2 m1 quot_sign R: e 
      00B1A9 CD 85 26         [ 4]  940     CALL RFROM   
      00B1AC B2 2E CD         [ 4]  941     CALL DTOR   ; m2 m1 R: qs e  
      00B1AF A9 B9 CD         [ 4]  942     CALL DABS   ; um2 um1 R: qs e  
      00B1B2 89 D3 CD         [ 4]  943     CALL DSWAP  ; m1 m2 R: qs e
      00B1B5 85 18 B1         [ 4]  944     CALL DDUP  ; m1 m2 m2 R: qs e
      00B1B8 CA CD A9         [ 4]  945     CALL DTOR  ; m1 m2 R: qs e m2 ( keep divisor need later ) 
      00B1BB A1 CD 86         [ 4]  946     CALL UDSLMOD ; remainder m1/m2 R: e m2 
      0033E2                        947 FSLASH1: 
      00B1BE A9 CD B1         [ 4]  948     CALL DOVER ; if remainder null done 
      00B1C1 20 CD 86         [ 4]  949     CALL DZEQUAL 
      0033E8                        950     _TBRAN FSLASH8 
      00B1C4 A9 CD A9         [ 4]    1     CALL TBRAN 
      00B1C7 83 20                    2     .word FSLASH8 
                                    951 ; get fractional digits from remainder until mantissa saturate
                                    952 ; remainder mantissa R: e divisor 
                                    953 ; check for mantissa saturation 
      00B1C9 0F 08 27         [ 4]  954     CALL DDUP 
      00B1CA                        955     _DOLIT 0XCCCC 
      00B1CA CD A8 34         [ 4]    1     CALL DOLIT 
      00B1CD CD A9                    2     .word 0XCCCC 
      0033F5                        956     _DOLIT 0xC
      00B1CF A1 CD B1         [ 4]    1     CALL DOLIT 
      00B1D2 20 CD                    2     .word 0xC 
      00B1D4 A9 83 CD         [ 4]  957     CALL DGREAT 
      0033FD                        958     _TBRAN FSLASH8 ; another loop would result in mantissa overflow 
      00B1D7 A8 34 A6         [ 4]    1     CALL TBRAN 
      00B1D9 34 45                    2     .word FSLASH8 
                                    959 ; multiply mantissa by 10 
      003402                        960     _DOLIT 10 
      00B1D9 CD A9 B9         [ 4]    1     CALL DOLIT 
      00B1DC CD 89                    2     .word 10 
      00B1DE 7A CD 85         [ 4]  961     CALL ZERO 
      00B1E1 26 B2 2E         [ 4]  962     CALL DSTAR 
                                    963 ; mutliply remainder by 10     
      00B1E4 CD A9 B9         [ 4]  964     CALL DSWAP 
      003410                        965     _DOLIT 10 
      00B1E7 CD 89 D3         [ 4]    1     CALL DOLIT 
      00B1EA CD 85                    2     .word 10 
      00B1EC 18 B2 00         [ 4]  966     CALL ZERO 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 185.
Hexadecimal [24-Bits]



      00B1EF CD A8 34         [ 4]  967     CALL DSTAR 
                                    968 ; divide remainder by m2     
      00B1F2 CD A9 A1         [ 4]  969     CALL DRAT  ; mantissa remainder divisor R: e divisor 
      00B1F5 CD B1 57         [ 4]  970     CALL UDSLMOD ; mantissa dr dq R: qs e divisor 
      00B1F8 CD 86 A9         [ 4]  971     CALL DSWAP ; mantissa frac_digit remainder R: qs e divisor  
      00B1FB CD A9 83         [ 4]  972     CALL DTOR  ; mantissa frac_digit R: qs e divisor remainder 
      00B1FE 20 0F C6         [ 4]  973     CALL DPLUS ; mantissa+frac_digit 
      00B200 CD 29 21         [ 4]  974     CALL DRFROM ; mantissa remainder R: qs e divisor  
      00B200 CD A9 A1         [ 4]  975     CALL DSWAP  ; remainder mantissa  
                                    976 ; increment e 
      003430                        977     _DOLIT 2    ; e slot on rstack 
      00B203 CD 86 A9         [ 4]    1     CALL DOLIT 
      00B206 CD B1                    2     .word 2 
      00B208 57 CD 86         [ 4]  978     CALL NRAT   ;  2 NR@ -- e 
      00B20B A9 CD A9         [ 4]  979     CALL ONEP   ; increment exponent 
      00343B                        980     _DOLIT 2 
      00B20E 83 04 6F         [ 4]    1     CALL DOLIT 
      00B20F 00 02                    2     .word 2 
      00B20F CD A9 B9         [ 4]  981     CALL NRSTO  ; e 2 NR! , update e on rstack     
      00B212 CD 89            [ 2]  982     JRA FSLASH1
      003445                        983 FSLASH8: ; remainder mantissa R: qs e divisor 
      00B214 7A CD 85         [ 4]  984     CALL DSWAP  
      003448                        985     _DDROP  ; drop remainder     
      00B217 26 B2 2E         [ 2]    1    ADDW X,#2*CELLL 
      00B21A CD A9 A1         [ 4]  986     CALL DRFROM
      00344E                        987     _DDROP  ; drop divisor 
      00B21D CD 88 A7         [ 2]    1    ADDW X,#2*CELLL 
      00B220 CD 89 D3         [ 4]  988     CALL JFETCH    ; quotient sign 
      003454                        989     _QBRAN FSLASH9 
      00B223 CD 85 26         [ 4]    1     CALL QBRAN
      00B226 B2 2B                    2     .word FSLASH9
      00B228 CD 86 A9         [ 4]  990     CALL DNEGA  
      00B22B                        991 FSLASH9:
      00B22B CD A9 83         [ 4]  992     CALL RFROM  ; exponent 
      00B22E CD 2D A5         [ 4]  993     CALL STEXP 
      00B22E CD A9 A1         [ 4]  994     CALL RFROM 
      003465                        995     _DROP ; drop qs 
      00B231 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00B234 81               [ 4]  996     RET 
                                    997 
                                    998 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    999 ;   D>F  ( # -- f# )
                                   1000 ;   convert double to float 
                                   1001 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      003469                       1002     _HEADER DTOF,3,"D>F"
      00B235 B1 89                    1         .word LINK 
                           00346B     2         LINK=.
      00B237 02                       3         .byte 3  
      00B238 46 2B 46                 4         .ascii "D>F"
      00B23A                          5         DTOF:
      00B23A CD B1 91         [ 4] 1003     CALL DSIGN 
      00B23D CD 86 62         [ 4] 1004     CALL TOR
      00B240 CD AC 46         [ 4] 1005     CALL DABS  
      003478                       1006 DTOF1:      
      00B243 CD A7 29         [ 4] 1007     CALL SCALETOM 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 186.
Hexadecimal [24-Bits]



      00B246 CD 86 62         [ 4] 1008     CALL RFROM
      00347E                       1009     _QBRAN DTOF2 
      00B249 CD A7 18         [ 4]    1     CALL QBRAN
      00B24C CD B2                    2     .word DTOF2
      00B24E AF CD 85         [ 4] 1010     CALL DNEGA 
      003486                       1011 DTOF2: 
      00B251 B4 CD 85         [ 4] 1012     CALL ROT 
      00B254 18 B2 5A         [ 4] 1013     CALL STEXP 
      00B257 CD               [ 4] 1014     RET 
                                   1015 
                                   1016 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1017 ;   F>D  ( f# -- # )
                                   1018 ;  convert float to double 
                                   1019 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00348D                       1020     _HEADER FTOD,3,"F>D"
      00B258 89 18                    1         .word LINK 
                           00348F     2         LINK=.
      00B25A 03                       3         .byte 3  
      00B25A CD 88 5D                 4         .ascii "F>D"
      003493                          5         FTOD:
      00B25D CD 85 B4         [ 4] 1021     CALL ATEXP ; m e 
      00B260 CD 88 BC         [ 4] 1022     CALL QDUP
      003499                       1023     _QBRAN FTOD9
      00B263 CD AE 25         [ 4]    1     CALL QBRAN
      00B266 81 B2                    2     .word FTOD9
      00B268 37 02 46         [ 4] 1024     CALL TOR 
      00B26B 2D 26 A9         [ 4] 1025     CALL DSIGN 
      00B26C CD 07 FC         [ 4] 1026     CALL NROT 
      00B26C CD B1 91         [ 4] 1027     CALL DABS
      00B26F CD 86 62         [ 4] 1028     CALL RFROM  
      00B272 CD AC 78         [ 4] 1029     CALL DUPP   
      00B275 CD A7 29         [ 4] 1030     CALL ZLESS 
      0034B3                       1031     _QBRAN FTOD4 
      00B278 CD 86 62         [ 4]    1     CALL QBRAN
      00B27B CD A7                    2     .word FTOD4
                                   1032 ; negative exponent 
      00B27D 18 CD B2         [ 4] 1033     CALL ABSS 
      00B280 AF CD 85         [ 4] 1034     CALL TOR
      00B283 B4 CD            [ 2] 1035     JRA FTOD2  
      0034C0                       1036 FTOD1:
      00B285 85 18 B2         [ 4] 1037     CALL DDUP 
      00B288 8C CD 89         [ 4] 1038     CALL DZEQUAL 
      0034C6                       1039     _TBRAN FTOD3 
      00B28B 18 04 A6         [ 4]    1     CALL TBRAN 
      00B28C 34 E0                    2     .word FTOD3 
      0034CB                       1040     _DOLIT 10 
      00B28C CD 88 5D         [ 4]    1     CALL DOLIT 
      00B28F CD 85                    2     .word 10 
      00B291 B4 CD 88         [ 4] 1041     CALL DSLMOD 
      00B294 BC CD AE         [ 4] 1042     CALL ROT 
      0034D6                       1043     _DROP
      00B297 25 81 02         [ 2]    1     ADDW X,#CELLL  
      00B299                       1044 FTOD2:      
      0034D9                       1045     _DONXT FTOD1
      00B299 CD 84 EF         [ 4]    1     CALL DONXT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 187.
Hexadecimal [24-Bits]



      00B29C 00 0A                    2     .word FTOD1 
      00B29E CD A7            [ 2] 1046     JRA FTOD8   
      0034E0                       1047 FTOD3: 
      00B2A0 43 CD 88         [ 4] 1048     CALL RFROM 
      0034E3                       1049     _DROP 
      00B2A3 5D 81 B2         [ 2]    1     ADDW X,#CELLL  
      00B2A6 69 07            [ 2] 1050     JRA FTOD8  
                                   1051 ; positive exponent 
      0034E8                       1052 FTOD4:
      00B2A8 53 43 41         [ 4] 1053     CALL TOR 
      00B2AB 4C 45            [ 2] 1054     JRA FTOD6
      0034ED                       1055 FTOD5:
      00B2AD 3E 4D 27         [ 4] 1056     CALL DDUP 
      00B2AF                       1057     _DOLIT 0XCCCC
      00B2AF CD 8C 83         [ 4]    1     CALL DOLIT 
      00B2B2 CD 88                    2     .word 0XCCCC 
      0034F5                       1058     _DOLIT 0XCCC  
      00B2B4 7C 04 6F         [ 4]    1     CALL DOLIT 
      00B2B5 0C CC                    2     .word 0XCCC 
      00B2B5 CD 86 99         [ 4] 1059     CALL DGREAT 
      0034FD                       1060     _TBRAN FTOD3 
      00B2B8 CD 84 EF         [ 4]    1     CALL TBRAN 
      00B2BB 00 7F                    2     .word FTOD3 
      003502                       1061     _DOLIT 10 
      00B2BD CD 89 BD         [ 4]    1     CALL DOLIT 
      00B2C0 CD 85                    2     .word 10 
      00B2C2 18 B2 D6         [ 4] 1062     CALL ZERO 
      00B2C5 CD B2 99         [ 4] 1063     CALL DSTAR 
      00350D                       1064 FTOD6: 
      00350D                       1065     _DONXT FTOD5 
      00B2C8 1C 00 02         [ 4]    1     CALL DONXT 
      00B2CB CD 88                    2     .word FTOD5 
      003512                       1066 FTOD8:
      00B2CD 5D CD 8C         [ 4] 1067     CALL ROT 
      003515                       1068     _QBRAN FTOD9 
      00B2D0 17 CD 88         [ 4]    1     CALL QBRAN
      00B2D3 7C 20                    2     .word FTOD9
      00B2D5 DF 08 98         [ 4] 1069     CALL DNEGA
      00B2D6                       1070 FTOD9:          
      00B2D6 81               [ 4] 1071     RET 
                                   1072 
                                   1073 
                                   1074 ;;;;;;;;;;;;;;;;;;;;;;;;
                                   1075 ;   F0< ( f# -- f )
                                   1076 ;   true if f#<0
                                   1077 ;;;;;;;;;;;;;;;;;;;;;;;;
      00B2D7                       1078     _HEADER FZLESS,3,"F0<"
      00B2D7 90 93                    1         .word LINK 
                           003520     2         LINK=.
      00B2D9 90                       3         .byte 3  
      00B2DA FE A6 0A                 4         .ascii "F0<"
      003524                          5         FZLESS:
      00B2DD 90 62 FF         [ 4] 1079     CALL ATEXP 
      003527                       1080     _DROP 
      00B2E0 90 95 E6         [ 2]    1     ADDW X,#CELLL  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 188.
Hexadecimal [24-Bits]



      00B2E3 02 90 97         [ 4] 1081     CALL SWAPP 
      00352D                       1082     _DROP 
      00B2E6 A6 0A 90         [ 2]    1     ADDW X,#CELLL  
      00B2E9 62 90 95         [ 4] 1083     CALL ZLESS 
      00B2EC 90               [ 4] 1084     RET
                                   1085 
                                   1086 ;;;;;;;;;;;;;;;;;;;;;;;;
                                   1087 ;   F< ( f#1 f#2 -- f )
                                   1088 ; true if f#1 < f#1 
                                   1089 ;;;;;;;;;;;;;;;;;;;;;;;
      003534                       1090     _HEADER FLESS,2,"F<"
      00B2ED 9F E7                    1         .word LINK 
                           003536     2         LINK=.
      00B2EF 02                       3         .byte 2  
      00B2F0 E6 03                    4         .ascii "F<"
      003539                          5         FLESS:
      00B2F2 90 97 A6         [ 4] 1091     CALL FSUB  
      00B2F5 0A 90 62         [ 2] 1092     JP FZLESS
                                   1093 
                                   1094 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1095 ;   F> ( f#1 f#2 -- f )
                                   1096 ;   true fi f#1>f#2
                                   1097 ;;;;;;;;;;;;;;;;;;;;;;;;;
      00353F                       1098     _HEADER FGREAT,2,"F>"
      00B2F8 90 95                    1         .word LINK 
                           003541     2         LINK=.
      00B2FA 90                       3         .byte 2  
      00B2FB 9F E7                    4         .ascii "F>"
      003544                          5         FGREAT:
      00B2FD 03 E6 04         [ 4] 1099     CALL DSWAP 
      00B300 90 97 A6         [ 2] 1100     JP FLESS 
                                   1101 
                                   1102 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1103 ;   F= ( f#1 f#2 -- f ) 
                                   1104 ;   true fi f#1==f#2 
                                   1105 ;;;;;;;;;;;;;;;;;;;;;;;;;
      00354A                       1106     _HEADER FEQUAL,2,"F="
      00B303 0A 90                    1         .word LINK 
                           00354C     2         LINK=.
      00B305 62                       3         .byte 2  
      00B306 90 95                    4         .ascii "F="
      00354F                          5         FEQUAL:
      00B308 90 9F E7         [ 2] 1107     JP DEQUAL 
                                   1108 
                                   1109 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1110 ;   F0= ( f# -- f )
                                   1111 ;   true if f# is 0.0 
                                   1112 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      003552                       1113     _HEADER FZEQUAL,3,"F0="
      00B30B 04 E6                    1         .word LINK 
                           003554     2         LINK=.
      00B30D 05                       3         .byte 3  
      00B30E 90 97 A6                 4         .ascii "F0="
      003558                          5         FZEQUAL:
      00B311 0A 90 62         [ 4] 1114     CALL ATEXP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 189.
Hexadecimal [24-Bits]



      00355B                       1115     _DROP 
      00B314 90 9F E7         [ 2]    1     ADDW X,#CELLL  
      00B317 05 81 B2         [ 2] 1116     JP DZEQUAL  
                                   1117 
                                   1118 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1119 ;  FNEGATE ( f#1 -- f#2 )
                                   1120 ;  f#2 is negation of f#1 
                                   1121 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      003561                       1122     _HEADER FNEGA,7,"FNEGATE"
      00B31A A7 03                    1         .word LINK 
                           003563     2         LINK=.
      00B31C 4D                       3         .byte 7  
      00B31D 4D 2A 45 47 41 54 45     4         .ascii "FNEGATE"
      00B31F                          5         FNEGA:
      00B31F CD 88 A7         [ 4] 1123     CALL ATEXP 
      00B322 CD A9 09         [ 4] 1124     CALL TOR 
      00B325 CD 85 26         [ 4] 1125     CALL DNEGA
      00B328 B3 35 34         [ 4] 1126     CALL RFROM 
      00B32A CD 2D A5         [ 4] 1127     CALL STEXP 
      00B32A CD AA 4A         [ 4] 1128     CALL SFN 
      00B32D CD               [ 4] 1129     RET 
                                   1130 
                                   1131 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1132 ;  FABS ( f#1 -- abs(f#1) )
                                   1133 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00357E                       1134     _HEADER FABS,4,"FABS"
      00B32E A9 09                    1         .word LINK 
                           003580     2         LINK=.
      00B330 CD                       3         .byte 4  
      00B331 85 18 B3 40              4         .ascii "FABS"
      00B335                          5         FABS:
      00B335 1C 00 02         [ 4] 1135     CALL ATEXP 
      00B338 90 5F FF         [ 4] 1136     CALL TOR 
      00B33B EF 02 EF         [ 4] 1137     CALL DUPP 
      00358E                       1138     _DOLIT 0X80 
      00B33E 04 81 6F         [ 4]    1     CALL DOLIT 
      00B340 00 80                    2     .word 0X80 
      00B340 CD A7 29         [ 4] 1139     CALL ANDD 
      003596                       1140     _QBRAN FABS1
      00B343 CD 86 62         [ 4]    1     CALL QBRAN
      00B346 CD A7                    2     .word FABS1
      00B348 18 CD A8         [ 4] 1141     CALL DNEGA 
      00359E                       1142 FABS1: 
      00B34B 34 CD A7         [ 4] 1143     CALL RFROM 
      00B34E 29 CD 85         [ 4] 1144     CALL STEXP 
      00B351 B4 CD 87         [ 4] 1145     CALL SFN 
      00B354 1F               [ 4] 1146     RET 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 190.
Hexadecimal [24-Bits]



                                   4628 .endif 
                                   4629 
                                   4630 ;===============================================================
                                   4631 
                           003580  4632 LASTN =	LINK   ;last name defined
                                   4633 
                                   4634 ; application code begin here
      003600                       4635 	.bndry 128 ; align on flash block  
      003600                       4636 app_space: 
                                   4637 
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
    ADC_TDRH=  005406     |     ADC_TDRL=  005407     |     ADDWX   =  00001C 
  6 ADRADJ     0007BC R   |     AFR     =  004803     |     AFR0_ADC=  000000 
    AFR1_TIM=  000001     |     AFR2_CCO=  000002     |     AFR3_TIM=  000003 
    AFR4_TIM=  000004     |     AFR5_TIM=  000005     |     AFR6_I2C=  000006 
    AFR7_BEE=  000007     |   6 AFT        0016C1 R   |   6 AGAIN      001617 R
  6 AHEAD      001674 R   |   6 ALLOT      001524 R   |   6 ANDD       000676 R
    APP_CP  =  004004     |     APP_LAST=  004000     |     APP_RUN =  004002 
    APP_VP  =  004006     |   6 AT         0004E3 R   |   6 ATEXE      000D13 R
  6 ATEXP      002D73 R   |   6 ATEXP1     002D88 R   |   6 ATEXP2     002D98 R
  6 AUTORUN    000129 R   |     AWU_APR =  0050F1     |     AWU_CSR =  0050F0 
    AWU_TBR =  0050F2     |     B0_MASK =  000001     |     B115200 =  000006 
  6 B115K2     0003E0 R   |     B19200  =  000003     |   6 B19K2      0003BD R
    B1_MASK =  000002     |     B230400 =  000007     |     B2400   =  000000 
  6 B2K4       00038E R   |     B2_MASK =  000004     |     B38400  =  000004 
    B3_MASK =  000008     |     B460800 =  000008     |     B4800   =  000001 
  6 B4K8       00039C R   |     B4_MASK =  000010     |     B57600  =  000005 
  6 B57K6      0003CE R   |     B5_MASK =  000020     |     B6_MASK =  000040 
    B7_MASK =  000080     |     B921600 =  000009     |     B9600   =  000002 
  6 B9K6       0003AC R   |   6 BACK1      001323 R   |   6 BASE       0006DF R
    BASEE   =  00000A     |   6 BAUD       0003F0 R   |     BCNT    =  000001 
  6 BCOMP      001567 R   |   6 BDIGS      000E0B R   |     BEEP_BIT=  000004 
    BEEP_CSR=  0050F3     |     BEEP_MAS=  000010     |     BEEP_POR=  00000F 
  6 BEGIN      0015F9 R   |     BIT0    =  000000     |     BIT1    =  000001 
    BIT2    =  000002     |     BIT3    =  000003     |     BIT4    =  000004 
    BIT5    =  000005     |     BIT6    =  000006     |     BIT7    =  000007 
  6 BKSLA      001178 R   |   6 BKSP       0012F3 R   |     BKSPP   =  000008 
  6 BLANK      000BF6 R   |     BLOCK_SI=  000080     |     BOOT_ROM=  006000 
    BOOT_ROM=  007FFF     |   6 BRAN       0004B4 R   |     BTW     =  000001 
  6 BUF2ROW    0021ED R   |   6 BYE        0000B6 R   |     CADR    =  000003 
    CALLL   =  0000CD     |   6 CALLOT     002436 R   |     CAN_DGR =  005426 
    CAN_FPSR=  005427     |     CAN_IER =  005425     |     CAN_MCR =  005420 
    CAN_MSR =  005421     |     CAN_P0  =  005428     |     CAN_P1  =  005429 
    CAN_P2  =  00542A     |     CAN_P3  =  00542B     |     CAN_P4  =  00542C 
    CAN_P5  =  00542D     |     CAN_P6  =  00542E     |     CAN_P7  =  00542F 
    CAN_P8  =  005430     |     CAN_P9  =  005431     |     CAN_PA  =  005432 
    CAN_PB  =  005433     |     CAN_PC  =  005434     |     CAN_PD  =  005435 
    CAN_PE  =  005436     |     CAN_PF  =  005437     |     CAN_RFR =  005424 
    CAN_TPR =  005423     |     CAN_TSR =  005422     |     CARRY   =  00002A 
    CASE_SEN=  000000     |   6 CAT        000501 R   |   6 CCOMMA     001549 R
    CC_C    =  000000     |     CC_H    =  000004     |     CC_I0   =  000003 
    CC_I1   =  000005     |     CC_N    =  000002     |     CC_V    =  000007 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 192.
Hexadecimal [24-Bits]

Symbol Table

    CC_Z    =  000001     |     CELLL   =  000002     |   6 CELLM      000B7B R
  6 CELLP      000B6C R   |   6 CELLS      000B8A R   |     CFG_GCR =  007F60 
    CFG_GCR_=  000001     |     CFG_GCR_=  000000     |   6 CHAR1      000F61 R
  6 CHAR2      000F64 R   |   6 CHKIVEC    0020DB R   |     CLKOPT  =  004807 
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
  6 COLD       001BDC R   |   6 COLD1      001BDC R   |   6 COLON      0018BF R
  6 COMMA      001532 R   |   6 COMPI      001577 R   |     COMPO   =  000040 
  6 CONSTANT   001969 R   |   6 COPYRIGH   001B25 R   |   6 COUNT      000CC6 R
  6 CPP        00077E R   |     CPU_A   =  007F00     |     CPU_CCR =  007F0A 
    CPU_PCE =  007F01     |     CPU_PCH =  007F02     |     CPU_PCL =  007F03 
    CPU_SPH =  007F08     |     CPU_SPL =  007F09     |     CPU_XH  =  007F04 
    CPU_XL  =  007F05     |     CPU_YH  =  007F06     |     CPU_YL  =  007F07 
  6 CR         000F89 R   |   6 CREAT      001905 R   |     CRR     =  00000D 
  6 CSTOR      0004F0 R   |   6 CTABLE     002457 R   |   6 CTAT       002478 R
  6 CTINIT     0024A0 R   |   6 D2SLASH    0029E3 R   |   6 D2STAR     0029FA R
  6 DABS       002698 R   |   6 DABS1      0026A0 R   |   6 DAT        000CAA R
    DATSTK  =  001680     |   6 DBLVER     002524 R   |   6 DCLZ       0027E2 R
  6 DCLZ1      0027EB R   |   6 DCLZ4      0027F4 R   |   6 DCLZ8      002801 R
  6 DCONST     00199E R   |   6 DDIG       002704 R   |   6 DDIGS      00271D R
  6 DDOT       002734 R   |   6 DDOT0      002748 R   |   6 DDOT1      00275E R
  6 DDROP      00081C R   |   6 DDSLMOD    002B87 R   |   6 DDSTAR3    002ACB R
  6 DDUP       000827 R   |     DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF 
  6 DECIM      000EBB R   |   6 DEPTH      000C45 R   |   6 DEQU4      0028BA R
  6 DEQUAL     0028A5 R   |     DEVID_BA=  0048CD     |     DEVID_EN=  0048D8 
    DEVID_LO=  0048D2     |     DEVID_LO=  0048D3     |     DEVID_LO=  0048D4 
    DEVID_LO=  0048D5     |     DEVID_LO=  0048D6     |     DEVID_LO=  0048D7 
    DEVID_LO=  0048D8     |     DEVID_WA=  0048D1     |     DEVID_XH=  0048CE 
    DEVID_XL=  0048CD     |     DEVID_YH=  0048D0     |     DEVID_YL=  0048CF 
  6 DGREAT     0028C6 R   |   6 DGTQ1      000F00 R   |   6 DI         0000C4 R
  6 DIG        000E34 R   |   6 DIGIT      000DCF R   |   6 DIGS       000E45 R
  6 DIGS1      000E45 R   |   6 DIGS2      000E52 R   |   6 DIGTQ      000ECF R
    DISCOVER=  000000     |   6 DLESS      0028D1 R   |   6 DLESS4     0028E5 R
  6 DLITER     0029A3 R   |   6 DLSHIFT    002A16 R   |   6 DLSHIFT1   002A29 R
  6 DLSHIFT2   002A3E R   |     DM_BK1RE=  007F90     |     DM_BK1RH=  007F91 
    DM_BK1RL=  007F92     |     DM_BK2RE=  007F93     |     DM_BK2RH=  007F94 
    DM_BK2RL=  007F95     |     DM_CR1  =  007F96     |     DM_CR2  =  007F97 
    DM_CSR1 =  007F98     |     DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A 
  6 DN1        0008B3 R   |   6 DNEGA      000898 R   |   6 DOCONST    001989 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 193.
Hexadecimal [24-Bits]

Symbol Table

  6 DOLIT      00046F R   |   6 DONXT      000483 R   |     DOORBELL=  000000 
  6 DOSTR      000F99 R   |   6 DOT        001030 R   |   6 DOT1       001046 R
  6 DOTI1      001AEE R   |   6 DOTID      001AD8 R   |   6 DOTO1      001488 R
  6 DOTOK      00146E R   |   6 DOTPR      001159 R   |   6 DOTQ       0016F0 R
  6 DOTQP      000FB6 R   |   6 DOTR       000FC4 R   |   6 DOTS       001A7A R
  6 DOTS1      001A85 R   |   6 DOTS2      001A8E R   |   6 DOVAR      0006CF R
  6 DOVER      0029CA R   |   6 DO_DCONS   0019C1 R   |     DP      =  000005 
  6 DPLUS      002BC6 R   |   6 DPLUS1     002BED R   |   6 DRAT       002939 R
  6 DRFROM     002921 R   |   6 DROP       00060F R   |   6 DROT       00284E R
  6 DRSHIFT    002A4F R   |   6 DRSHIFT1   002A56 R   |   6 DRSHIFT2   002A6C R
  6 DSIGN      0026A9 R   |   6 DSIGN1     0026B3 R   |   6 DSLA9      002BB1 R
  6 DSLASH     002BB7 R   |   6 DSLMOD     0026C3 R   |   6 DSLMOD3    0026DE R
  6 DSLMOD4    0026EA R   |   6 DSLMODa    0026E5 R   |   6 DSLMODb    0026F0 R
  6 DSSTAR     00278E R   |   6 DSSTAR3    0027AB R   |   6 DSTAR      002A72 R
  6 DSTOR      000C91 R   |   6 DSUB       002BF8 R   |   6 DSUB1      002C1F R
  6 DSWAP      0027B4 R   |   6 DTOF       00346F R   |   6 DTOF1      003478 R
  6 DTOF2      003486 R   |   6 DTOR       002903 R   |   6 DUMP       001A30 R
  6 DUMP1      001A47 R   |   6 DUMP3      001A69 R   |   6 DUMPP      0019FF R
  6 DUPP       000619 R   |   6 DVARIA     002957 R   |     DVER_MAJ=  000001 
    DVER_MIN=  000000     |   6 DZEQUAL    002889 R   |   6 DZLESS     0028EC R
  6 DZLESS1    0028F6 R   |   6 EDIGS      000E70 R   |   6 EDOT       002DF9 R
  6 EDOT0      002E10 R   |   6 EDOT2      002E1C R   |   6 EDOT3      002E32 R
  6 EDOT4      002E5E R   |   6 EDOT5      002E7D R   |   6 EECSTORE   001E8C R
  6 EEPCP      001CB2 R   |   6 EEPLAST    001C85 R   |   6 EEPROM     001C6D R
    EEPROM_B=  004000     |     EEPROM_E=  0047FF     |     EEPROM_R=  000010 
    EEPROM_S=  000800     |   6 EEPRUN     001C9C R   |   6 EEPVP      001CC8 R
  6 EESTORE    001ED8 R   |   6 EE_CCOMM   0021A2 R   |   6 EE_COMMA   002181 R
  6 EE_CREAD   001E1D R   |   6 EE_READ    001DFB R   |   6 EI         0000BD R
  6 ELSEE      00164F R   |   6 EMIT       000436 R   |   6 ENEPER     0023C2 R
    EOL_CR  =  000001     |     EOL_LF  =  000000     |   6 EQ1        000907 R
  6 EQUAL      0008FA R   |   6 ERASE      000D9D R   |     ERR     =  00001B 
  6 EVAL       0014B1 R   |   6 EVAL1      0014B1 R   |   6 EVAL2      0014CD R
  6 EXE1       000D21 R   |   6 EXECU      0004C4 R   |     EXT     =  000000 
    EXTI_CR1=  0050A0     |     EXTI_CR2=  0050A1     |   6 EXTRC      000DF7 R
  6 FABS       003585 R   |   6 FABS1      00359E R   |   6 FADDR      00226F R
  6 FALGN4     00314A R   |   6 FALGN6     003159 R   |   6 FALGN7     003180 R
  6 FALGN71    00318F R   |   6 FALGN72    0031AB R   |   6 FALGN8     0031AE R
  6 FALIGN     003111 R   |   6 FALSE      000868 R   |   6 FARAT      001D33 R
  6 FARCAT     001D3F R   |   6 FC_XOFF    000463 R   |   6 FC_XON     00044D R
  6 FDOT       002E8C R   |   6 FDOT0      002ECA R   |   6 FDOT1      002EB9 R
  6 FDOT10     002F1D R   |   6 FDOT2      002ED8 R   |   6 FDOT3      002EEE R
  6 FDOT6      002EFB R   |   6 FDOT7      002EFD R   |   6 FDOT8      002F05 R
  6 FDOT9      002F0D R   |   6 FEQUAL     00354F R   |   6 FER        002C91 R
  6 FGREAT     003544 R   |     FHSE    =  7A1200     |     FHSI    =  F42400 
  6 FILL       000D7D R   |   6 FILL0      000D8B R   |   6 FILL1      000D93 R
  6 FIND       00124F R   |   6 FIND1      00126D R   |   6 FIND2      00129B R
  6 FIND3      0012A7 R   |   6 FIND4      0012BB R   |   6 FIND5      0012C8 R
  6 FIND6      0012AC R   |   6 FINIT      002C87 R   |     FLASH_BA=  008000 
    FLASH_CR=  00505A     |     FLASH_CR=  000002     |     FLASH_CR=  000000 
    FLASH_CR=  000003     |     FLASH_CR=  000001     |     FLASH_CR=  00505B 
    FLASH_CR=  000005     |     FLASH_CR=  000004     |     FLASH_CR=  000007 
    FLASH_CR=  000000     |     FLASH_CR=  000006     |     FLASH_DU=  005064 
    FLASH_DU=  0000AE     |     FLASH_DU=  000056     |     FLASH_EN=  027FFF 
    FLASH_FP=  00505D     |     FLASH_FP=  000000     |     FLASH_FP=  000001 
    FLASH_FP=  000002     |     FLASH_FP=  000003     |     FLASH_FP=  000004 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 194.
Hexadecimal [24-Bits]

Symbol Table

    FLASH_FP=  000005     |     FLASH_IA=  00505F     |     FLASH_IA=  000003 
    FLASH_IA=  000002     |     FLASH_IA=  000006     |     FLASH_IA=  000001 
    FLASH_IA=  000000     |     FLASH_NC=  00505C     |     FLASH_NF=  00505E 
    FLASH_NF=  000000     |     FLASH_NF=  000001     |     FLASH_NF=  000002 
    FLASH_NF=  000003     |     FLASH_NF=  000004     |     FLASH_NF=  000005 
    FLASH_PU=  005062     |     FLASH_PU=  000056     |     FLASH_PU=  0000AE 
    FLASH_SI=  020000     |     FLASH_WS=  00480D     |   6 FLESS      003539 R
  6 FLOATQ     002F95 R   |   6 FLOATQ0    002F9D R   |   6 FLOATQ1    002FFC R
  6 FLOATQ2    003005 R   |   6 FLOATQ3    00300D R   |   6 FLOATQ4    003021 R
  6 FLOAT_ER   00303C R   |   6 FLOAT_ER   003039 R   |     FLOAT_MA=  000001 
    FLOAT_MI=  000000     |     FLSI    =  01F400     |   6 FMOVE      00227A R
  6 FMOVE2     0022AB R   |   6 FNE        002CB4 R   |   6 FNEGA      00356B R
  6 FOR        0015C1 R   |   6 FORGET     00015A R   |   6 FORGET1    000189 R
  6 FORGET2    00020F R   |   6 FORGET4    000218 R   |   6 FORGET6    0001D1 R
  6 FOV        002CCF R   |   6 FPLUS      0031BA R   |   6 FPLUS1     0031DA R
  6 FPSTOR     001C4E R   |   6 FPSW       002C63 R   |     FPTR    =  000034 
  6 FREEVAR    000225 R   |   6 FREEVAR4   00025B R   |   6 FRESET     002C75 R
  6 FSLASH     0033A0 R   |   6 FSLASH1    0033E2 R   |   6 FSLASH8    003445 R
  6 FSLASH9    00345C R   |   6 FSTAR      003379 R   |   6 FSUB       0031EC R
  6 FSUB1      00320C R   |   6 FTOD       003493 R   |   6 FTOD1      0034C0 R
  6 FTOD2      0034D9 R   |   6 FTOD3      0034E0 R   |   6 FTOD4      0034E8 R
  6 FTOD5      0034ED R   |   6 FTOD6      00350D R   |   6 FTOD8      003512 R
  6 FTOD9      00351D R   |   6 FVER       002C31 R   |   6 FZE        002C9E R
  6 FZEQUAL    003558 R   |   6 FZLESS     003524 R   |     GPIO_BAS=  005000 
    GPIO_CR1=  000003     |     GPIO_CR2=  000004     |     GPIO_DDR=  000002 
    GPIO_IDR=  000001     |     GPIO_ODR=  000000     |     GPIO_SIZ=  000005 
  6 GREAT      000953 R   |   6 GREAT1     00095E R   |   6 HDOT       001013 R
  6 HERE       000CDD R   |   6 HEX        000EA6 R   |   6 HI         001B91 R
  6 HLD        00074F R   |   6 HOLD       000E1B R   |     HSECNT  =  004809 
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
  6 ICOLON     0018D0 R   |   6 IFETCH     0015DF R   |   6 IFF        001627 R
  6 IFMOVE     002353 R   |     IMEDD   =  000080     |   6 IMMED      0018E2 R
  6 INCH       00042A R   |   6 INC_FPTR   001DC8 R   |   6 INITOFS    001898 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 195.
Hexadecimal [24-Bits]

Symbol Table

  6 INN        0006FD R   |     INPUT_DI=  000000     |     INPUT_EI=  000001 
    INPUT_FL=  000000     |     INPUT_PU=  000001     |   6 INTE1      001450 R
  6 INTER      001426 R   |   6 INTQ       0024FC R   |     INT_ADC2=  000016 
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
  6 INVER      000875 R   |     IPR0    =  000002     |     IPR1    =  000001 
    IPR2    =  000000     |     IPR3    =  000003     |     IPR_MASK=  000003 
    IRET_COD=  000080     |   6 ISEMI      0017E7 R   |     ITC_SPR1=  007F70 
    ITC_SPR2=  007F71     |     ITC_SPR3=  007F72     |     ITC_SPR4=  007F73 
    ITC_SPR5=  007F74     |     ITC_SPR6=  007F75     |     ITC_SPR7=  007F76 
    ITC_SPR8=  007F77     |     IWDG_KR =  0050E0     |     IWDG_PR =  0050E1 
    IWDG_RLR=  0050E2     |   6 JFETCH     0015EA R   |   6 JSRC       00183C R
  6 JSRC1      00185F R   |   6 JSRC2      001882 R   |   6 KEY        000F0F R
  6 KTAP       001340 R   |   6 KTAP1      001363 R   |   6 KTAP2      001366 R
  6 LAST       00078E R   |   6 LASTN   =  003580 R   |   6 LBRAC      00145D R
    LED2_BIT=  000005     |     LED2_MAS=  000020     |     LED2_POR=  00500A 
  6 LESS       000926 R   |     LF      =  00000A     |   6 LINK    =  003580 R
  6 LITER      001599 R   |   6 LN2S       00241E R   |   6 LOCAL      000554 R
  6 LOCK       001DB4 R   |   6 LOG2S      002408 R   |   6 LSCALE     00305B R
  6 LSHIFT     000BB5 R   |   6 LSHIFT1    000BBE R   |   6 LSHIFT4    000BC6 R
  6 LT1        000931 R   |     MASKK   =  001F7F     |   6 MAX        00096B R
  6 MAX1       000975 R   |     MAX_MANT=  7FFFFF     |   6 MIN        00097F R
  6 MIN1       000989 R   |   6 MMOD1      000A38 R   |   6 MMOD2      000A4C R
  6 MMOD3      000A63 R   |   6 MMSM0      0009C8 R   |   6 MMSM1      0009D8 R
  6 MMSM3      0009DC R   |   6 MMSM4      0009E8 R   |   6 MMSMa      0009E3 R
  6 MMSMb      0009EE R   |   6 MMSTA1     0032AA R   |   6 MMSTA2     0032B5 R
  6 MMSTA3     0032C0 R   |   6 MMSTA4     00332B R   |   6 MMSTA5     00333D R
  6 MMSTA6     003353 R   |   6 MMSTA7     003370 R   |   6 MMSTAR     00329F R
  6 MODD       000AB3 R   |   6 MONE       000C1C R   |     MS      =  000030 
  6 MSEC       0002D0 R   |   6 MSMOD      000A1B R   |   6 MSTA1      000B44 R
  6 MSTAR      000B21 R   |     NAFR    =  004804     |   6 NAMEQ      0012E8 R
  6 NAMET      0011F9 R   |     NCLKOPT =  004808     |   6 NDROT      002812 R
  6 NEGAT      000886 R   |   6 NEG_SIGN   002567 R   |   6 NEX1       000490 R
  6 NEXT       0015D0 R   |     NFLASH_W=  00480E     |     NHSECNT =  00480A 
    NOPT1   =  004802     |     NOPT2   =  004804     |     NOPT3   =  004806 
    NOPT4   =  004808     |     NOPT5   =  00480A     |     NOPT6   =  00480C 
    NOPT7   =  00480E     |     NOPTBL  =  00487F     |   6 NRAT       00059F R
  6 NRDROP     00057B R   |   6 NROT       0007FC R   |   6 NRSTO      0005BE R
  6 NTIB       00070D R   |     NUBC    =  004802     |     NUCLEO  =  000001 
  6 NUFQ       000F25 R   |   6 NUFQ1      000F3E R   |   6 NUMBQ      0025D3 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 196.
Hexadecimal [24-Bits]

Symbol Table

  6 NUMQ0      002614 R   |   6 NUMQ1      002636 R   |   6 NUMQ3      002660 R
  6 NUMQ4      00267E R   |   6 NUMQ8      002687 R   |     NWDGOPT =  004806 
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
  6 PARS8      001119 R   |   6 PARSE      00112A R   |   6 PARSEXP_   002F78 R
  6 PAUSE      0002E0 R   |     PA_BASE =  005000     |     PA_CR1  =  005003 
    PA_CR2  =  005004     |     PA_DDR  =  005002     |     PA_IDR  =  005001 
    PA_ODR  =  005000     |     PB      =  000005     |     PB_BASE =  005005 
    PB_CR1  =  005008     |     PB_CR2  =  005009     |     PB_DDR  =  005007 
    PB_IDR  =  005006     |     PB_ODR  =  005005     |     PC      =  00000A 
    PC_BASE =  00500A     |     PC_CR1  =  00500D     |     PC_CR2  =  00500E 
    PC_DDR  =  00500C     |     PC_IDR  =  00500B     |     PC_ODR  =  00500A 
    PD      =  00000F     |   6 PDUM1      001A12 R   |   6 PDUM2      001A23 R
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
  6 PII        002381 R   |     PI_BASE =  005028     |     PI_CR1  =  00502B 
    PI_CR2  =  00502C     |     PI_DDR  =  00502A     |     PI_IDR  =  005029 
    PI_ODR  =  005028     |   6 PLUS       00083C R   |   6 PNAM1      00175A R
  6 PRESE      0014DC R   |   6 PRINT_VE   001B61 R   |     PROD1   =  000024 
    PROD2   =  000026     |     PROD3   =  000028     |   6 PROTECTE   000201 R
  6 PRT_LICE   001B4D R   |   6 PSTOR      000C73 R   |     PTR16   =  000035 
    PTR8    =  000036     |   6 PTRPLUS    001DE0 R   |   6 QBRAN      000498 R
  6 QDUP       0007CC R   |   6 QDUP1      0007D6 R   |   6 QKEY       000418 R
  6 QSTAC      001494 R   |   6 QUERY      0013C0 R   |   6 QUEST      001053 R
  6 QUIT       0014F9 R   |   6 QUIT1      001501 R   |   6 QUIT2      001504 R
  6 RAM2EE     00221B R   |     RAMBASE =  000000     |   6 RAMLAST    0007A1 R
    RAM_BASE=  000000     |     RAM_END =  0017FF     |     RAM_SIZE=  001800 
  6 RANDOM     00027E R   |   6 RAT        000545 R   |   6 RBRAC      001829 R
  6 REPEA      0016A4 R   |   6 RFREE      002202 R   |   6 RFROM      000534 R
    ROP     =  004800     |   6 ROT        0007DD R   |   6 ROW2BUF    0021C4 R
    ROWBUFF =  001680     |     RP0     =  00002E     |   6 RPAT       000511 R
    RPP     =  0017FF     |   6 RPSTO      00051E R   |   6 RSCALE     00307F R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 197.
Hexadecimal [24-Bits]

Symbol Table

  6 RSHIFT     000BD1 R   |   6 RSHIFT1    000BDA R   |   6 RSHIFT4    000BE2 R
    RST_SR  =  0050B3     |   6 RT12_2     0023F1 R   |   6 SAME1      001217 R
  6 SAME2      001240 R   |   6 SAMEQ      00120F R   |   6 SCAL1      003235 R
  6 SCAL2      003256 R   |   6 SCALDN2    003103 R   |   6 SCALDN3    003106 R
  6 SCALEDOW   0030D7 R   |   6 SCALETOM   00322F R   |   6 SCALEUP    0030A0 R
  6 SCALEUP2   0030D3 R   |   6 SCALEUP3   0030D6 R   |   6 SCOM1      00178F R
  6 SCOM2      001792 R   |   6 SCOMP      001771 R   |   6 SEED       000265 R
    SEEDX   =  000038     |     SEEDY   =  00003A     |   6 SEMIS      0017C5 R
  6 SETISP     0000D0 R   |   6 SET_RAML   001952 R   |   6 SFN        002D26 R
    SFR_BASE=  005000     |     SFR_END =  0057FF     |   6 SFV        002D5A R
  6 SFZ        002CEF R   |   6 SIGN       000E5A R   |   6 SIGN1      000E6A R
  6 SLASH      000ABD R   |   6 SLMOD      000A6B R   |   6 SLMOD1     000A9D R
  6 SLMOD8     000AAA R   |   6 SNAME      001724 R   |     SP0     =  00002C 
  6 SPACE      000F47 R   |   6 SPACS      000F56 R   |   6 SPAT       0005F9 R
    SPI_CR1 =  005200     |     SPI_CR2 =  005201     |     SPI_CRCP=  005205 
    SPI_DR  =  005204     |     SPI_ICR =  005202     |     SPI_RXCR=  005206 
    SPI_SR  =  005203     |     SPI_TXCR=  005207     |     SPP     =  001680 
    SPSAVE  =  000001     |   6 SPSTO      000606 R   |   6 SQRT10     0023DA R
  6 SQRT2      002398 R   |   6 SQRT3      0023AF R   |   6 SSMOD      000B4D R
    SSP     =  000001     |     STACK   =  0017FF     |   6 STAR       000B16 R
  6 STASL      000B5E R   |   6 STEXP      002DA5 R   |   6 STEXP1     002DBB R
  6 STEXP2     002DE5 R   |   6 STOD       0008BB R   |   6 STORE      0004D1 R
  6 STO_SIGN   00257F R   |   6 STR        000E88 R   |   6 STRCQ      0015A1 R
  6 STRQ       0016E3 R   |   6 STRQP      000FB2 R   |   6 SUBB       0008D2 R
  6 SWAPP      000629 R   |     SWIM_CSR=  007F80     |   6 TAP        00132A R
  6 TBOOT      001BD0 R   |   6 TBRAN      0004A6 R   |   6 TBUF       00071D R
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 198.
Hexadecimal [24-Bits]

Symbol Table

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
    TIM4_SR =  005342     |     TIM4_SR_=  000000     |   6 TIMEOUTQ   000310 R
  6 TIMER      0002FA R   |     TIM_CR1_=  000007     |     TIM_CR1_=  000000 
    TIM_CR1_=  000006     |     TIM_CR1_=  000005     |     TIM_CR1_=  000004 
    TIM_CR1_=  000003     |     TIM_CR1_=  000001     |     TIM_CR1_=  000002 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 199.
Hexadecimal [24-Bits]

Symbol Table

  6 TNAM2      001AA8 R   |   6 TNAM3      001AC6 R   |   6 TNAM4      001ACC R
  6 TNAME      001AA5 R   |   6 TOFLASH    000335 R   |   6 TOKEN      0011EB R
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
    UD4     =  000004     |   6 UDIV10     003257 R   |   6 UDOT       000FFF R
  6 UDOTR      000FDF R   |   6 UDSLA3     002B0A R   |   6 UDSLA4     002B30 R
  6 UDSLA7     002B61 R   |   6 UDSLA8     002B6C R   |   6 UDSLMOD    002AD5 R
  6 UDSSTAR    00276C R   |   6 UEND       000047 R   |     UFPSW   =  000008 
  6 UGREAT     00093D R   |   6 UGREAT1    000948 R   |     UHLD    =  000014 
    UINN    =  00000C     |     UINTER  =  000012     |     ULAST   =  00001C 
  6 ULES1      00091B R   |   6 ULESS      000910 R   |   6 UMMOD      0009B1 R
  6 UMOD10     003219 R   |   6 UMSTA      000ACC R   |   6 UNIQ1      001721 R
  6 UNIQU      001702 R   |   6 UNLKEE     001D4E R   |   6 UNLKFL     001D6D R
  6 UNLOCK     001D8C R   |   6 UNTIL      001604 R   |     UOFFSET =  00001E 
  6 UPDATCP    001D0B R   |   6 UPDATLAS   001CE2 R   |   6 UPDATPTR   00230E R
  6 UPDATRUN   001CFA R   |   6 UPDATVP    001D22 R   |   6 UPL1       0006CB R
  6 UPLUS      0006B4 R   |     UPP     =  000006     |   6 UPPER      0011AE R
  6 UPPER1     0011D1 R   |   6 UPPER2     0011DA R   |     URLAST  =  000022 
  6 USLMOD     000A00 R   |     USR_BTN_=  000004     |     USR_BTN_=  000010 
    USR_BTN_=  005015     |     UTFLASH =  000020     |     UTIB    =  000010 
    UTMP    =  00000A     |   6 UTYP1      0019E2 R   |   6 UTYP2      0019F1 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 200.
Hexadecimal [24-Bits]

Symbol Table

  6 UTYPE      0019DD R   |     UVP     =  000018     |   6 UZERO      00002B R
  6 VARIA      00191F R   |     VAR_BASE=  000080     |     VAR_TOP =  0017BF 
    VER     =  000004     |   6 VPP        000770 R   |     VSIZE   =  000006 
    WANT_CON=  000001     |     WANT_DEB=  000000     |     WANT_DOU=  000001 
    WANT_FLO=  000001     |     WANT_SCA=  000001     |     WANT_SEE=  000000 
    WDGOPT  =  004805     |     WDGOPT_I=  000002     |     WDGOPT_L=  000003 
    WDGOPT_W=  000000     |     WDGOPT_W=  000001     |   6 WHILE      00168A R
  6 WITHI      000996 R   |   6 WORDD      001194 R   |   6 WORDS      001B02 R
  6 WORS1      001B08 R   |   6 WORS2      001B24 R   |   6 WR_BYTE    001E37 R
  6 WR_WORD    001E5C R   |   6 WTABLE     002466 R   |   6 WTAT       00248A R
  6 WTINIT     0024CF R   |     WWDG_CR =  0050D1     |     WWDG_WR =  0050D2 
    XMEM_SIZ=  017830     |     XOFF    =  000013     |     XON     =  000011 
  6 XORR       00069F R   |     XTEMP   =  000024     |     YTEMP   =  000026 
    YTMP    =  000003     |   6 ZEQ1       002899 R   |   6 ZEQU1      00066C R
  6 ZEQUAL     000662 R   |   6 ZERO       000C03 R   |   6 ZL1        000659 R
  6 ZLESS      000650 R   |   6 app_spac   003600 R   |   6 baudrate   00037B R
  6 block_er   001F22 R   |   6 clear_ra   000019 R   |   6 clock_in   000064 R
  6 copy_buf   001F82 R   |   6 copy_buf   001FA1 R   |   6 copy_pro   001FA1 R
    da      =  000002     |     db      =  000003     |     dc      =  000000 
    dd      =  000001     |   6 do2lit     0029AE R   |   6 erase_fl   001F44 R
  6 fmove_do   0022F7 R   |   6 main       000016 R   |   6 next_row   0022B4 R
  6 no_move    0022FE R   |   6 nsign      002556 R   |   6 parse_di   002583 R
  6 parse_ex   002F2D R   |   6 pristine   002022 R   |   6 proceed_   001F47 R
  6 reboot     000327 R   |   6 reset_ve   002089 R   |   6 row_eras   001F02 R
  6 row_eras   001F5B R   |   6 row_eras   001F82 R   |   6 set_opti   001FF6 R
  6 set_vect   00212A R   |   6 uart_ini   000076 R   |   6 write_ro   001FC6 R

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

