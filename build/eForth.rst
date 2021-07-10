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
      0080B7 94 B3                  314         .word      INTER   ;'EVAL
      0080B9 00 00                  315         .word      0       ;HLD
      0080BB B5 F6                  316         .word      LASTN  ;CNTXT pointer
      0080BD 00 80                  317         .word      VAR_BASE   ;variables free space pointer 
      0080BF B6 80                  318         .word      app_space ; FLASH free space pointer 
      0080C1 B5 F6                  319         .word      LASTN   ;LAST
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
      00812D CC 9C 23         [ 2]  391         jp  COLD   ;default=MN1
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



      00817E CD 8C 50         [ 4]  447         call LSHIFT ; creat slot mask 
      008181 CD 88 F5         [ 4]  448         call INVER  ; ( level reg lshift rval mask )
      008184 CD 86 F6         [ 4]  449         call ANDD ; ( level reg lshift slot_masked )
      008187 CD 86 62         [ 4]  450         call TOR  ; ( level reg lshift -- R: slot_masked )
      00818A CD 88 5D         [ 4]  451         call ROT  ; ( reg lshift level )
      00818D CD 86 A9         [ 4]  452         call SWAPP ; ( reg level lshift )
      008190 CD 8C 50         [ 4]  453         call LSHIFT  ; ( reg slot_level -- )
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
      0081A9 CD 92 78         [ 4]  465         call TOKEN 
      0081AC CD 86 99         [ 4]  466         call DUPP 
      0081AF CD 85 18         [ 4]  467         call QBRAN 
      0081B2 82 8F                  468         .word FORGET2
      0081B4 CD 93 75         [ 4]  469         call NAMEQ
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
      0081CE CC 9F 1F         [ 2]  479         jp EESTORE 
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
      0081DA CD 92 78         [ 4]  488         call TOKEN
      0081DD CD 86 99         [ 4]  489         call DUPP 
      0081E0 CD 85 18         [ 4]  490         call QBRAN 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 11.
Hexadecimal [24-Bits]



      0081E3 82 8F                  491         .word FORGET2
      0081E5 CD 93 75         [ 4]  492         call NAMEQ ; ( a -- ca na | a F )
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
      008206 CD A1 22         [ 4]  507         call CHKIVEC ; ( na -- ) 
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
      00824B CD 9D 52         [ 4]  535         call UPDATCP 
      00824E CC 9D 29         [ 2]  536         jp UPDATLAST 
      008251                        537 FORGET6: ; tried to forget a RAM or system word 
                                    538 ; ( ca na -- )
      008251 1D 00 02         [ 2]  539         subw x,#CELLL 
      008254 90 BE 2C         [ 2]  540         ldw y,SP0 
      008257 FF               [ 2]  541         ldw (x),y  
      008258 CD 89 90         [ 4]  542         call ULESS
      00825B CD 85 18         [ 4]  543         call QBRAN 
      00825E 82 81                  544         .word PROTECTED 
      008260 CD 94 81         [ 4]  545         call ABORQ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 12.
Hexadecimal [24-Bits]



      008263 1D                     546         .byte 29
      008264 20 46 6F 72 20 52 41   547         .ascii " For RAM definition do REBOOT"
             4D 20 64 65 66 69 6E
             69 74 69 6F 6E 20 64
             6F 20 52 45 42 4F 4F
             54
      008281                        548 PROTECTED:
      008281 CD 94 81         [ 4]  549         call ABORQ
      008284 0A                     550         .byte 10
      008285 20 50 72 6F 74 65 63   551         .ascii " Protected"
             74 65 64
      00828F                        552 FORGET2: ; no name or not found in dictionary 
      00828F CD 94 81         [ 4]  553         call ABORQ
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
      0082AB CD 8C 32         [ 4]  568         call ONEP ;
      0082AE CD 88 BC         [ 4]  569         CALL PLUS ; ( na c+1 -- ca ) 
      0082B1 CD 8C 32         [ 4]  570         call ONEP ; ( ca+ -- ) to get routne address 
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
      0082D8 CC 9D 69         [ 2]  584         jp UPDATVP 
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
      0083C3 CD 94 81         [ 4]  733         call ABORQ 
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
      0009A8                       1815         _HEADER UMMOD,6,"UM/MOD" 
      008A28 8A 0F                    1         .word LINK 
                           0009AA     2         LINK=.
      008A2A 06                       3         .byte 6  
      008A2B 55 4D 2F 4D 4F 44        4         .ascii "UM/MOD"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
Hexadecimal [24-Bits]



      008A31                          5         UMMOD:
                                   1816         ;;;;;; local variables ;;;;
                           000007  1817         DP=7
                           000005  1818         DIV=5 
                           000003  1819         UDL=3 
                           000001  1820         UDH=1
                                   1821         ;;;;;;;;;;;;;;;;;;;;;;;;;;;
      008A31 90 93            [ 1] 1822         LDW Y,X 
      008A33 90 EE 02         [ 2] 1823         LDW Y,(2,Y) ; udh 
      008A36 26 0C            [ 1] 1824         JRNE UMMOD1 
                                   1825 ; udh==0 use faster U/MOD         
      008A38 90 93            [ 1] 1826         LDW Y,X 
      008A3A 90 FE            [ 2] 1827         LDW Y,(Y)
      008A3C EF 02            [ 2] 1828         LDW (2,X),Y  ; replace udh by un 
      008A3E 1C 00 02         [ 2] 1829         ADDW X,#CELLL ; drop un  
      008A41 CC 8A 9B         [ 2] 1830         JP USLMOD 
      008A44                       1831 UMMOD1:
      008A44 52 08            [ 2] 1832         SUB SP,#4*CELLL ; local variables space 
      008A46 17 01            [ 2] 1833         LDW (UDH,SP),Y ; save udh 
      008A48 90 93            [ 1] 1834         LDW Y,X 
      008A4A 5C               [ 1] 1835         INCW X 
      008A4B 5C               [ 1] 1836         INCW X 
      008A4C 1F 07            [ 2] 1837         LDW (DP,SP),X ; save DP 
      008A4E 90 FE            [ 2] 1838         LDW Y,(Y) ; divisor 
      008A50 17 05            [ 2] 1839         LDW (DIV,SP),Y ; divisor 
      008A52 51               [ 1] 1840         EXGW X,Y 
      008A53 13 01            [ 2] 1841         CPW X,(UDH,SP) 
      008A55 22 0D            [ 1] 1842         JRUGT UMMOD2
                                   1843 ; divisor < udh overflow          
      008A57 1E 07            [ 2] 1844         LDW X,(DP,SP)
      008A59 90 AE FF FF      [ 2] 1845         LDW Y,#-1 
      008A5D FF               [ 2] 1846         LDW (X),Y 
      008A5E 90 5F            [ 1] 1847         CLRW Y 
      008A60 EF 02            [ 2] 1848         LDW (2,X),Y
      008A62 20 2C            [ 2] 1849         JRA UMMOD8 
      008A64                       1850 UMMOD2: ; shift left dividend until negative 
      008A64 1E 01            [ 2] 1851         LDW X,(UDH,SP)
      008A66 16 03            [ 2] 1852         LDW Y,(UDL,SP) ; X:Y dividend 
      008A68 A6 10            [ 1] 1853         LD A,#16
      008A6A                       1854 UMMOD3:  
      008A6A 4D               [ 1] 1855         TNZ A 
      008A6B 27 0A            [ 1] 1856         JREQ UMMOD4 
      008A6D 5D               [ 2] 1857         TNZW X 
      008A6E 2B 07            [ 1] 1858         JRMI UMMOD4 
      008A70 98               [ 1] 1859         RCF 
      008A71 90 59            [ 2] 1860         RLCW Y 
      008A73 59               [ 2] 1861         RLCW X
      008A74 4A               [ 1] 1862         DEC A 
      008A75 20 F3            [ 2] 1863         JRA UMMOD3 
      008A77                       1864 UMMOD4:
      008A77 17 03            [ 2] 1865         LDW (UDL,SP),Y ; save least bits of remainder  
      008A79 16 05            [ 2] 1866         LDW Y,(DIV,SP) ; divisor 
      008A7B 65               [ 2] 1867         DIVW X,Y  ; X=X/Y , Y=X%Y 
      008A7C 1F 01            [ 2] 1868         LDW (UDH,SP),X ; save quotient 
      008A7E 1E 03            [ 2] 1869         LDW X,(UDL,SP) ; Y:X remainder 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



                                   1870 ; shift left remainder until A==0        
      008A80 4D               [ 1] 1871         TNZ A 
      008A81 27 06            [ 1] 1872         JREQ UMMOD6 
      008A83                       1873 UMMOD5: 
      008A83 59               [ 2] 1874         RLCW X 
      008A84 90 59            [ 2] 1875         RLCW Y 
      008A86 4A               [ 1] 1876         DEC A  
      008A87 26 FA            [ 1] 1877         JRNE UMMOD5 
      008A89                       1878 UMMOD6: ; Y=remainder 
      008A89 1E 07            [ 2] 1879         LDW X,(DP,SP)        
      008A8B EF 02            [ 2] 1880         LDW (2,X),Y 
      008A8D 16 01            [ 2] 1881         LDW Y,(UDH,SP)
      008A8F FF               [ 2] 1882         LDW (X),Y 
      008A90                       1883 UMMOD8:          
      008A90 5B 08            [ 2] 1884         ADDW SP,#4*CELLL 
      008A92 81               [ 4] 1885         RET
                                   1886 
                                   1887 
                                   1888 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1889 ;   U/MOD ( u1 u2 -- ur uq )
                                   1890 ;   unsigned divide u1/u2 
                                   1891 ;   return remainder and quotient 
                                   1892 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000A13                       1893         _HEADER USLMOD,5,"U/MOD"
      008A93 8A 2A                    1         .word LINK 
                           000A15     2         LINK=.
      008A95 05                       3         .byte 5  
      008A96 55 2F 4D 4F 44           4         .ascii "U/MOD"
      008A9B                          5         USLMOD:
      008A9B 90 93            [ 1] 1894         LDW Y,X 
      008A9D 90 FE            [ 2] 1895         LDW Y,(Y)  ; dividend 
      008A9F 89               [ 2] 1896         PUSHW X    ; DP >R 
      008AA0 EE 02            [ 2] 1897         LDW X,(2,X) ; divisor 
      008AA2 65               [ 2] 1898         DIVW X,Y 
      008AA3 89               [ 2] 1899         PUSHW X     ; quotient 
      008AA4 1E 03            [ 2] 1900         LDW X,(3,SP) ; DP 
      008AA6 EF 02            [ 2] 1901         LDW (2,X),Y ; remainder 
      008AA8 16 01            [ 2] 1902         LDW Y,(1,SP) ; quotient 
      008AAA FF               [ 2] 1903         LDW (X),Y 
      008AAB 5B 04            [ 2] 1904         ADDW SP,#2*CELLL ; drop quotient and DP from rstack 
      008AAD 81               [ 4] 1905         RET 
                                   1906 
                                   1907 
                                   1908 
                                   1909 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
                                   1910 ;       M/MOD   ( d n -- r q )
                                   1911 ;       Signed floored divide of double by
                                   1912 ;       single. Return mod and quotient.
                                   1913 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000A2E                       1914         _HEADER MSMOD,5,"M/MOD"
      008AAE 8A 95                    1         .word LINK 
                           000A30     2         LINK=.
      008AB0 05                       3         .byte 5  
      008AB1 4D 2F 4D 4F 44           4         .ascii "M/MOD"
      008AB6                          5         MSMOD:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



      008AB6 CD 86 99         [ 4] 1915         CALL	DUPP
      008AB9 CD 86 D0         [ 4] 1916         CALL	ZLESS
      008ABC CD 86 99         [ 4] 1917         CALL	DUPP
      008ABF CD 86 62         [ 4] 1918         CALL	TOR
      008AC2 CD 85 18         [ 4] 1919         CALL	QBRAN
      008AC5 8A D3                 1920         .word	MMOD1
      008AC7 CD 89 06         [ 4] 1921         CALL	NEGAT
      008ACA CD 86 62         [ 4] 1922         CALL	TOR
      008ACD CD 89 18         [ 4] 1923         CALL	DNEGA
      008AD0 CD 85 B4         [ 4] 1924         CALL	RFROM
      008AD3 CD 86 62         [ 4] 1925 MMOD1:	CALL	TOR
      008AD6 CD 86 99         [ 4] 1926         CALL	DUPP
      008AD9 CD 86 D0         [ 4] 1927         CALL	ZLESS
      008ADC CD 85 18         [ 4] 1928         CALL	QBRAN
      008ADF 8A E7                 1929         .word	MMOD2
      008AE1 CD 85 C5         [ 4] 1930         CALL	RAT
      008AE4 CD 88 BC         [ 4] 1931         CALL	PLUS
      008AE7 CD 85 B4         [ 4] 1932 MMOD2:	CALL	RFROM
      008AEA CD 8A 31         [ 4] 1933         CALL	UMMOD
      008AED CD 85 B4         [ 4] 1934         CALL	RFROM
      008AF0 CD 85 18         [ 4] 1935         CALL	QBRAN
      008AF3 8A FE                 1936         .word	MMOD3
      008AF5 CD 86 A9         [ 4] 1937         CALL	SWAPP
      008AF8 CD 89 06         [ 4] 1938         CALL	NEGAT
      008AFB CD 86 A9         [ 4] 1939         CALL	SWAPP
      008AFE 81               [ 4] 1940 MMOD3:	RET
                                   1941 
                                   1942 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1943 ;       /MOD    ( n1 n2 -- r q )
                                   1944 ;       Signed divide n1/n2. 
                                   1945 ;       Return mod and quotient.
                                   1946 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000A7F                       1947         _HEADER SLMOD,4,"/MOD"
      008AFF 8A B0                    1         .word LINK 
                           000A81     2         LINK=.
      008B01 04                       3         .byte 4  
      008B02 2F 4D 4F 44              4         .ascii "/MOD"
      008B06                          5         SLMOD:
      008B06 F6               [ 1] 1948         LD A,(X)
      008B07 88               [ 1] 1949         PUSH A   ; n2 sign 
      008B08 E6 02            [ 1] 1950         LD A,(2,X)
      008B0A 88               [ 1] 1951         PUSH A    ; n1 sign 
      008B0B CD 89 6C         [ 4] 1952         CALL ABSS 
      008B0E CD 86 62         [ 4] 1953         CALL TOR  ; 
      008B11 CD 89 6C         [ 4] 1954         CALL ABSS 
      008B14 CD 85 C5         [ 4] 1955         CALL RAT   
      008B17 CD 8A 9B         [ 4] 1956         CALL USLMOD 
      008B1A 7B 03            [ 1] 1957         LD A,(3,SP)
      008B1C 1A 04            [ 1] 1958         OR A,(4,SP)
      008B1E 2A 25            [ 1] 1959         JRPL SLMOD8 ; both positive nothing to change 
      008B20 7B 03            [ 1] 1960         LD A,(3,SP)
      008B22 18 04            [ 1] 1961         XOR A,(4,SP)
      008B24 2A 12            [ 1] 1962         JRPL SLMOD1
                                   1963 ; dividend and divisor are opposite sign          
      008B26 CD 8C 32         [ 4] 1964         CALL ONEP   ; add one to quotient 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



      008B29 CD 89 06         [ 4] 1965         CALL NEGAT ; negative quotient
      008B2C CD 85 C5         [ 4] 1966         CALL RAT 
      008B2F CD 88 5D         [ 4] 1967         CALL ROT 
      008B32 CD 89 52         [ 4] 1968         CALL SUBB  ; corrected_remainder=divisor-remainder 
      008B35 CD 86 A9         [ 4] 1969         CALL SWAPP
      008B38                       1970 SLMOD1:
      008B38 7B 04            [ 1] 1971         LD A,(4,SP) ; divisor sign 
      008B3A 2A 09            [ 1] 1972         JRPL SLMOD8 
      008B3C CD 86 62         [ 4] 1973         CALL TOR 
      008B3F CD 89 06         [ 4] 1974         CALL NEGAT ; if divisor negative negate remainder 
      008B42 CD 85 B4         [ 4] 1975         CALL RFROM 
      008B45                       1976 SLMOD8: 
      008B45 5B 04            [ 2] 1977         ADDW SP,#4 
      008B47 81               [ 4] 1978         RET 
                                   1979 
                                   1980 ;        CALL	OVER
                                   1981 ;        CALL	ZLESS
                                   1982 ;        CALL	SWAPP
                                   1983 ;        JP	MSMOD
                                   1984 
                                   1985 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1986 ;       MOD     ( n n -- r )
                                   1987 ;       Signed divide. Return mod only.
                                   1988 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000AC8                       1989         _HEADER MODD,3,"MOD"
      008B48 8B 01                    1         .word LINK 
                           000ACA     2         LINK=.
      008B4A 03                       3         .byte 3  
      008B4B 4D 4F 44                 4         .ascii "MOD"
      008B4E                          5         MODD:
      008B4E CD 8B 06         [ 4] 1990 	CALL	SLMOD
      008B51 CC 86 8F         [ 2] 1991 	JP	DROP
                                   1992 
                                   1993 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1994 ;       /       ( n n -- q )
                                   1995 ;       Signed divide. Return quotient only.
                                   1996 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000AD4                       1997         _HEADER SLASH,1,"/"
      008B54 8B 4A                    1         .word LINK 
                           000AD6     2         LINK=.
      008B56 01                       3         .byte 1  
      008B57 2F                       4         .ascii "/"
      008B58                          5         SLASH:
      008B58 CD 8B 06         [ 4] 1998         CALL	SLMOD
      008B5B CD 86 A9         [ 4] 1999         CALL	SWAPP
      008B5E CC 86 8F         [ 2] 2000         JP	DROP
                                   2001 
                                   2002 ;; Multiply
                                   2003 
                                   2004 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2005 ;       UM*     ( u u -- ud )
                                   2006 ;       Unsigned multiply. Return 
                                   2007 ;       double product.
                                   2008 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000AE1                       2009         _HEADER UMSTA,3,"UM*"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



      008B61 8B 56                    1         .word LINK 
                           000AE3     2         LINK=.
      008B63 03                       3         .byte 3  
      008B64 55 4D 2A                 4         .ascii "UM*"
      008B67                          5         UMSTA:
                                   2010 ; stack have 4 bytes u1=a,b u2=c,d
                                   2011 ; take advantage of SP addressing modes
                                   2012 ; these PRODx in RAM are not required
                                   2013 ; the product is kept on stack as local variable 
                                   2014         ;; bytes offset on data stack 
                           000002  2015         da=2 
                           000003  2016         db=3 
                           000000  2017         dc=0 
                           000001  2018         dd=1 
                                   2019         ;; product bytes offset on return stack 
                           000001  2020         UD1=1  ; ud bits 31..24
                           000002  2021         UD2=2  ; ud bits 23..16
                           000003  2022         UD3=3  ; ud bits 15..8 
                           000004  2023         UD4=4  ; ud bits 7..0 
                                   2024         ;; local variable for product set to zero   
      008B67 90 5F            [ 1] 2025         clrw y 
      008B69 90 89            [ 2] 2026         pushw y  ; bits 15..0
      008B6B 90 89            [ 2] 2027         pushw y  ; bits 31..16 
      008B6D E6 03            [ 1] 2028         ld a,(db,x) ; b 
      008B6F 90 97            [ 1] 2029         ld yl,a 
      008B71 E6 01            [ 1] 2030         ld a,(dd,x)   ; d
      008B73 90 42            [ 4] 2031         mul y,a    ; b*d  
      008B75 17 03            [ 2] 2032         ldw (UD3,sp),y ; lowest weight product 
      008B77 E6 03            [ 1] 2033         ld a,(db,x)
      008B79 90 97            [ 1] 2034         ld yl,a 
      008B7B E6 00            [ 1] 2035         ld a,(dc,x)
      008B7D 90 42            [ 4] 2036         mul y,a  ; b*c 
                                   2037         ;;; do the partial sum 
      008B7F 72 F9 02         [ 2] 2038         addw y,(UD2,sp)
      008B82 4F               [ 1] 2039         clr a 
      008B83 49               [ 1] 2040         rlc a
      008B84 6B 01            [ 1] 2041         ld (UD1,sp),a 
      008B86 17 02            [ 2] 2042         ldw (UD2,sp),y 
      008B88 E6 02            [ 1] 2043         ld a,(da,x)
      008B8A 90 97            [ 1] 2044         ld yl,a 
      008B8C E6 01            [ 1] 2045         ld a,(dd,x)
      008B8E 90 42            [ 4] 2046         mul y,a   ; a*d 
                                   2047         ;; do partial sum 
      008B90 72 F9 02         [ 2] 2048         addw y,(UD2,sp)
      008B93 4F               [ 1] 2049         clr a 
      008B94 19 01            [ 1] 2050         adc a,(UD1,sp)
      008B96 6B 01            [ 1] 2051         ld (UD1,sp),a  
      008B98 17 02            [ 2] 2052         ldw (UD2,sp),y 
      008B9A E6 02            [ 1] 2053         ld a,(da,x)
      008B9C 90 97            [ 1] 2054         ld yl,a 
      008B9E E6 00            [ 1] 2055         ld a,(dc,x)
      008BA0 90 42            [ 4] 2056         mul y,a  ;  a*c highest weight product 
                                   2057         ;;; do partial sum 
      008BA2 72 F9 01         [ 2] 2058         addw y,(UD1,sp)
      008BA5 FF               [ 2] 2059         ldw (x),y  ; udh 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



      008BA6 16 03            [ 2] 2060         ldw y,(UD3,sp)
      008BA8 EF 02            [ 2] 2061         ldw (2,x),y  ; udl  
      008BAA 5B 04            [ 2] 2062         addw sp,#4 ; drop local variable 
      008BAC 81               [ 4] 2063         ret  
                                   2064 
                                   2065 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2066 ;       *       ( n n -- n )
                                   2067 ;       Signed multiply. Return 
                                   2068 ;       single product.
                                   2069 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000B2D                       2070         _HEADER STAR,1,"*"
      008BAD 8B 63                    1         .word LINK 
                           000B2F     2         LINK=.
      008BAF 01                       3         .byte 1  
      008BB0 2A                       4         .ascii "*"
      008BB1                          5         STAR:
      008BB1 CD 8B 67         [ 4] 2071 	CALL	UMSTA
      008BB4 CC 86 8F         [ 2] 2072 	JP	DROP
                                   2073 
                                   2074 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2075 ;       M*      ( n n -- d )
                                   2076 ;       Signed multiply. Return 
                                   2077 ;       double product.
                                   2078 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000B37                       2079         _HEADER MSTAR,2,"M*"
      008BB7 8B AF                    1         .word LINK 
                           000B39     2         LINK=.
      008BB9 02                       3         .byte 2  
      008BBA 4D 2A                    4         .ascii "M*"
      008BBC                          5         MSTAR:
      008BBC CD 88 A7         [ 4] 2080         CALL	DDUP
      008BBF CD 87 1F         [ 4] 2081         CALL	XORR
      008BC2 CD 86 D0         [ 4] 2082         CALL	ZLESS
      008BC5 CD 86 62         [ 4] 2083         CALL	TOR
      008BC8 CD 89 6C         [ 4] 2084         CALL	ABSS
      008BCB CD 86 A9         [ 4] 2085         CALL	SWAPP
      008BCE CD 89 6C         [ 4] 2086         CALL	ABSS
      008BD1 CD 8B 67         [ 4] 2087         CALL	UMSTA
      008BD4 CD 85 B4         [ 4] 2088         CALL	RFROM
      008BD7 CD 85 18         [ 4] 2089         CALL	QBRAN
      008BDA 8B DF                 2090         .word	MSTA1
      008BDC CD 89 18         [ 4] 2091         CALL	DNEGA
      008BDF 81               [ 4] 2092 MSTA1:	RET
                                   2093 
                                   2094 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2095 ;       */MOD   ( n1 n2 n3 -- r q )
                                   2096 ;       Multiply n1 and n2, then divide
                                   2097 ;       by n3. Return mod and quotient.
                                   2098 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000B60                       2099         _HEADER SSMOD,5,"*/MOD"
      008BE0 8B B9                    1         .word LINK 
                           000B62     2         LINK=.
      008BE2 05                       3         .byte 5  
      008BE3 2A 2F 4D 4F 44           4         .ascii "*/MOD"
      008BE8                          5         SSMOD:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



      008BE8 CD 86 62         [ 4] 2100         CALL     TOR
      008BEB CD 8B BC         [ 4] 2101         CALL     MSTAR
      008BEE CD 85 B4         [ 4] 2102         CALL     RFROM
      008BF1 CC 8A B6         [ 2] 2103         JP     MSMOD
                                   2104 
                                   2105 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2106 ;       */      ( n1 n2 n3 -- q )
                                   2107 ;       Multiply n1 by n2, then divide
                                   2108 ;       by n3. Return quotient only.
                                   2109 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000B74                       2110         _HEADER STASL,2,"*/"
      008BF4 8B E2                    1         .word LINK 
                           000B76     2         LINK=.
      008BF6 02                       3         .byte 2  
      008BF7 2A 2F                    4         .ascii "*/"
      008BF9                          5         STASL:
      008BF9 CD 8B E8         [ 4] 2111         CALL	SSMOD
      008BFC CD 86 A9         [ 4] 2112         CALL	SWAPP
      008BFF CC 86 8F         [ 2] 2113         JP	DROP
                                   2114 
                                   2115 ;; Miscellaneous
                                   2116 
                                   2117 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2118 ;       CELL+   ( a -- a )
                                   2119 ;       Add cell size in byte to address.
                                   2120 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000B82                       2121         _HEADER CELLP,2,"2+"
      008C02 8B F6                    1         .word LINK 
                           000B84     2         LINK=.
      008C04 02                       3         .byte 2  
      008C05 32 2B                    4         .ascii "2+"
      008C07                          5         CELLP:
      008C07 90 93            [ 1] 2122         LDW Y,X
      008C09 90 FE            [ 2] 2123 	LDW Y,(Y)
      008C0B 72 A9 00 02      [ 2] 2124         ADDW Y,#CELLL 
      008C0F FF               [ 2] 2125         LDW (X),Y
      008C10 81               [ 4] 2126         RET
                                   2127 
                                   2128 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2129 ;       CELL-   ( a -- a )
                                   2130 ;       Subtract 2 from address.
                                   2131 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000B91                       2132         _HEADER CELLM,2,"2-"
      008C11 8C 04                    1         .word LINK 
                           000B93     2         LINK=.
      008C13 02                       3         .byte 2  
      008C14 32 2D                    4         .ascii "2-"
      008C16                          5         CELLM:
      008C16 90 93            [ 1] 2133         LDW Y,X
      008C18 90 FE            [ 2] 2134 	LDW Y,(Y)
      008C1A 72 A2 00 02      [ 2] 2135         SUBW Y,#CELLL
      008C1E FF               [ 2] 2136         LDW (X),Y
      008C1F 81               [ 4] 2137         RET
                                   2138 
                                   2139 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



                                   2140 ;       CELLS   ( n -- n )
                                   2141 ;       Multiply tos by 2.
                                   2142 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000BA0                       2143         _HEADER CELLS,2,"2*"
      008C20 8C 13                    1         .word LINK 
                           000BA2     2         LINK=.
      008C22 02                       3         .byte 2  
      008C23 32 2A                    4         .ascii "2*"
      008C25                          5         CELLS:
      008C25 90 93            [ 1] 2144         LDW Y,X
      008C27 90 FE            [ 2] 2145 	LDW Y,(Y)
      008C29 90 58            [ 2] 2146         SLAW Y
      008C2B FF               [ 2] 2147         LDW (X),Y
      008C2C 81               [ 4] 2148         RET
                                   2149 
                                   2150 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2151 ;       1+      ( a -- a )
                                   2152 ;       Add cell size in byte 
                                   2153 ;       to address.
                                   2154 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000BAD                       2155         _HEADER ONEP,2,"1+"
      008C2D 8C 22                    1         .word LINK 
                           000BAF     2         LINK=.
      008C2F 02                       3         .byte 2  
      008C30 31 2B                    4         .ascii "1+"
      008C32                          5         ONEP:
      008C32 90 93            [ 1] 2156         LDW Y,X
      008C34 90 FE            [ 2] 2157 	LDW Y,(Y)
      008C36 90 5C            [ 1] 2158         INCW Y
      008C38 FF               [ 2] 2159         LDW (X),Y
      008C39 81               [ 4] 2160         RET
                                   2161 
                                   2162 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2163 ;       1-      ( a -- a )
                                   2164 ;       Subtract 2 from address.
                                   2165 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000BBA                       2166         _HEADER ONEM,2,"1-"
      008C3A 8C 2F                    1         .word LINK 
                           000BBC     2         LINK=.
      008C3C 02                       3         .byte 2  
      008C3D 31 2D                    4         .ascii "1-"
      008C3F                          5         ONEM:
      008C3F 90 93            [ 1] 2167         LDW Y,X
      008C41 90 FE            [ 2] 2168 	LDW Y,(Y)
      008C43 90 5A            [ 2] 2169         DECW Y
      008C45 FF               [ 2] 2170         LDW (X),Y
      008C46 81               [ 4] 2171         RET
                                   2172 
                                   2173 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2174 ;  shift left n times 
                                   2175 ; LSHIFT ( n1 n2 -- n1<<n2 )
                                   2176 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000BC7                       2177         _HEADER LSHIFT,6,"LSHIFT"
      008C47 8C 3C                    1         .word LINK 
                           000BC9     2         LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



      008C49 06                       3         .byte 6  
      008C4A 4C 53 48 49 46 54        4         .ascii "LSHIFT"
      008C50                          5         LSHIFT:
      008C50 E6 01            [ 1] 2178         ld a,(1,x)
      008C52 1C 00 02         [ 2] 2179         addw x,#CELLL 
      008C55 90 93            [ 1] 2180         ldw y,x 
      008C57 90 FE            [ 2] 2181         ldw y,(y)
      008C59                       2182 LSHIFT1:
      008C59 4D               [ 1] 2183         tnz a 
      008C5A 27 05            [ 1] 2184         jreq LSHIFT4 
      008C5C 90 58            [ 2] 2185         sllw y 
      008C5E 4A               [ 1] 2186         dec a 
      008C5F 20 F8            [ 2] 2187         jra LSHIFT1 
      008C61                       2188 LSHIFT4:
      008C61 FF               [ 2] 2189         ldw (x),y 
      008C62 81               [ 4] 2190         ret 
                                   2191 
                                   2192 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2193 ; shift right n times                 
                                   2194 ; RSHIFT (n1 n2 -- n1>>n2 )
                                   2195 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000BE3                       2196         _HEADER RSHIFT,6,"RSHIFT"
      008C63 8C 49                    1         .word LINK 
                           000BE5     2         LINK=.
      008C65 06                       3         .byte 6  
      008C66 52 53 48 49 46 54        4         .ascii "RSHIFT"
      008C6C                          5         RSHIFT:
      008C6C E6 01            [ 1] 2197         ld a,(1,x)
      008C6E 1C 00 02         [ 2] 2198         addw x,#CELLL 
      008C71 90 93            [ 1] 2199         ldw y,x 
      008C73 90 FE            [ 2] 2200         ldw y,(y)
      008C75                       2201 RSHIFT1:
      008C75 4D               [ 1] 2202         tnz a 
      008C76 27 05            [ 1] 2203         jreq RSHIFT4 
      008C78 90 54            [ 2] 2204         srlw y 
      008C7A 4A               [ 1] 2205         dec a 
      008C7B 20 F8            [ 2] 2206         jra RSHIFT1 
      008C7D                       2207 RSHIFT4:
      008C7D FF               [ 2] 2208         ldw (x),y 
      008C7E 81               [ 4] 2209         ret 
                                   2210 
                                   2211 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2212 ;       2/      ( n -- n )
                                   2213 ;       divide  tos by 2.
                                   2214 ;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000BFF                       2215         _HEADER TWOSL,2,"2/"
      008C7F 8C 65                    1         .word LINK 
                           000C01     2         LINK=.
      008C81 02                       3         .byte 2  
      008C82 32 2F                    4         .ascii "2/"
      008C84                          5         TWOSL:
      008C84 90 93            [ 1] 2216         LDW Y,X
      008C86 90 FE            [ 2] 2217 	LDW Y,(Y)
      008C88 90 57            [ 2] 2218         SRAW Y
      008C8A FF               [ 2] 2219         LDW (X),Y
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



      008C8B 81               [ 4] 2220         RET
                                   2221 
                                   2222 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2223 ;       BL      ( -- 32 )
                                   2224 ;       Return 32,  blank character.
                                   2225 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000C0C                       2226         _HEADER BLANK,2,"BL"
      008C8C 8C 81                    1         .word LINK 
                           000C0E     2         LINK=.
      008C8E 02                       3         .byte 2  
      008C8F 42 4C                    4         .ascii "BL"
      008C91                          5         BLANK:
      008C91 1D 00 02         [ 2] 2227         SUBW X,#2
      008C94 90 AE 00 20      [ 2] 2228 	LDW Y,#32
      008C98 FF               [ 2] 2229         LDW (X),Y
      008C99 81               [ 4] 2230         RET
                                   2231 
                                   2232 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2233 ;         0     ( -- 0)
                                   2234 ;         Return 0.
                                   2235 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000C1A                       2236         _HEADER ZERO,1,"0"
      008C9A 8C 8E                    1         .word LINK 
                           000C1C     2         LINK=.
      008C9C 01                       3         .byte 1  
      008C9D 30                       4         .ascii "0"
      008C9E                          5         ZERO:
      008C9E 1D 00 02         [ 2] 2237         SUBW X,#2
      008CA1 90 5F            [ 1] 2238 	CLRW Y
      008CA3 FF               [ 2] 2239         LDW (X),Y
      008CA4 81               [ 4] 2240         RET
                                   2241 
                                   2242 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2243 ;         1     ( -- 1)
                                   2244 ;         Return 1.
                                   2245 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000C25                       2246         _HEADER ONE,1,"1"
      008CA5 8C 9C                    1         .word LINK 
                           000C27     2         LINK=.
      008CA7 01                       3         .byte 1  
      008CA8 31                       4         .ascii "1"
      008CA9                          5         ONE:
      008CA9 1D 00 02         [ 2] 2247         SUBW X,#2
      008CAC 90 AE 00 01      [ 2] 2248 	LDW Y,#1
      008CB0 FF               [ 2] 2249         LDW (X),Y
      008CB1 81               [ 4] 2250         RET
                                   2251 
                                   2252 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2253 ;         -1    ( -- -1)
                                   2254 ;   Return -1
                                   2255 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000C32                       2256         _HEADER MONE,2,"-1"
      008CB2 8C A7                    1         .word LINK 
                           000C34     2         LINK=.
      008CB4 02                       3         .byte 2  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



      008CB5 2D 31                    4         .ascii "-1"
      008CB7                          5         MONE:
      008CB7 1D 00 02         [ 2] 2257         SUBW X,#2
      008CBA 90 AE FF FF      [ 2] 2258 	LDW Y,#0xFFFF
      008CBE FF               [ 2] 2259         LDW (X),Y
      008CBF 81               [ 4] 2260         RET
                                   2261 
                                   2262 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2263 ;       >CHAR   ( c -- c )
                                   2264 ;       Filter non-printing characters.
                                   2265 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000C40                       2266         _HEADER TCHAR,5,">CHAR"
      008CC0 8C B4                    1         .word LINK 
                           000C42     2         LINK=.
      008CC2 05                       3         .byte 5  
      008CC3 3E 43 48 41 52           4         .ascii ">CHAR"
      008CC8                          5         TCHAR:
      008CC8 E6 01            [ 1] 2267         ld a,(1,x)
      008CCA A1 20            [ 1] 2268         cp a,#32  
      008CCC 2B 05            [ 1] 2269         jrmi 1$ 
      008CCE A1 7F            [ 1] 2270         cp a,#127 
      008CD0 2A 01            [ 1] 2271         jrpl 1$ 
      008CD2 81               [ 4] 2272         ret 
      008CD3 A6 5F            [ 1] 2273 1$:     ld a,#'_ 
      008CD5 E7 01            [ 1] 2274         ld (1,x),a 
      008CD7 81               [ 4] 2275         ret 
                                   2276 
                                   2277 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2278 ;       DEPTH   ( -- n )
                                   2279 ;       Return  depth of  data stack.
                                   2280 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000C58                       2281         _HEADER DEPTH,5,"DEPTH"
      008CD8 8C C2                    1         .word LINK 
                           000C5A     2         LINK=.
      008CDA 05                       3         .byte 5  
      008CDB 44 45 50 54 48           4         .ascii "DEPTH"
      008CE0                          5         DEPTH:
      008CE0 90 BE 2C         [ 2] 2282         LDW Y,SP0    ;save data stack ptr
      008CE3 BF 24            [ 2] 2283 	LDW XTEMP,X
      008CE5 72 B2 00 24      [ 2] 2284         SUBW Y,XTEMP     ;#bytes = SP0 - X
      008CE9 90 57            [ 2] 2285         SRAW Y    ;Y = #stack items
      008CEB 1D 00 02         [ 2] 2286 	SUBW X,#2
      008CEE FF               [ 2] 2287         LDW (X),Y     ; if neg, underflow
      008CEF 81               [ 4] 2288         RET
                                   2289 
                                   2290 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2291 ;       PICK    ( ... +n -- ... w )
                                   2292 ;       Copy  nth stack item to tos.
                                   2293 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000C70                       2294         _HEADER PICK,4,"PICK"
      008CF0 8C DA                    1         .word LINK 
                           000C72     2         LINK=.
      008CF2 04                       3         .byte 4  
      008CF3 50 49 43 4B              4         .ascii "PICK"
      008CF7                          5         PICK:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



      008CF7 90 93            [ 1] 2295         LDW Y,X   ;D = n1
      008CF9 90 FE            [ 2] 2296         LDW Y,(Y)
                                   2297 ; modified for standard compliance          
                                   2298 ; 0 PICK must be equivalent to DUP 
      008CFB 90 5C            [ 1] 2299         INCW Y 
      008CFD 90 58            [ 2] 2300         SLAW Y
      008CFF BF 24            [ 2] 2301         LDW XTEMP,X
      008D01 72 B9 00 24      [ 2] 2302         ADDW Y,XTEMP
      008D05 90 FE            [ 2] 2303         LDW Y,(Y)
      008D07 FF               [ 2] 2304         LDW (X),Y
      008D08 81               [ 4] 2305         RET
                                   2306 
                                   2307 ;; Memory access
                                   2308 
                                   2309 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2310 ;       +!      ( n a -- )
                                   2311 ;       Add n to  contents at 
                                   2312 ;       address a.
                                   2313 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000C89                       2314         _HEADER PSTOR,2,"+!"
      008D09 8C F2                    1         .word LINK 
                           000C8B     2         LINK=.
      008D0B 02                       3         .byte 2  
      008D0C 2B 21                    4         .ascii "+!"
      008D0E                          5         PSTOR:
      008D0E 90 93            [ 1] 2315         ldw y,x 
      008D10 90 FE            [ 2] 2316         ldw y,(y)
      008D12 90 BF 26         [ 2] 2317         ldw YTEMP,y  ; address
      008D15 90 FE            [ 2] 2318         ldw y,(y)  
      008D17 90 89            [ 2] 2319         pushw y  ; value at address 
      008D19 90 93            [ 1] 2320         ldw y,x 
      008D1B 90 EE 02         [ 2] 2321         ldw y,(2,y) ; n 
      008D1E 72 F9 01         [ 2] 2322         addw y,(1,sp) ; n+value
      008D21 91 CF 26         [ 5] 2323         ldw [YTEMP],y ;  a!
      008D24 90 85            [ 2] 2324         popw y    ;drop local var
      008D26 1C 00 04         [ 2] 2325         addw x,#4 ; DDROP 
      008D29 81               [ 4] 2326         ret 
                                   2327 
                                   2328 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2329 ;       2!      ( d a -- )
                                   2330 ;       Store  double integer 
                                   2331 ;       to address a.
                                   2332 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000CAA                       2333         _HEADER DSTOR,2,"2!"
      008D2A 8D 0B                    1         .word LINK 
                           000CAC     2         LINK=.
      008D2C 02                       3         .byte 2  
      008D2D 32 21                    4         .ascii "2!"
      008D2F                          5         DSTOR:
      008D2F 90 93            [ 1] 2334         LDW Y,X 
      008D31 89               [ 2] 2335         PUSHW X 
      008D32 FE               [ 2] 2336         LDW X,(X) ; a 
      008D33 90 EE 02         [ 2] 2337         LDW Y,(2,Y) ; dhi 
      008D36 FF               [ 2] 2338         LDW (X),Y 
      008D37 16 01            [ 2] 2339         LDW Y,(1,SP)  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



      008D39 90 EE 04         [ 2] 2340         LDW Y,(4,Y) ; dlo 
      008D3C EF 02            [ 2] 2341         LDW (2,X),Y  
      008D3E 85               [ 2] 2342         POPW X 
      008D3F 1C 00 06         [ 2] 2343         ADDW X,#3*CELLL 
      008D42 81               [ 4] 2344         RET 
                                   2345 
                                   2346 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2347 ;       2@      ( a -- d )
                                   2348 ;       Fetch double integer 
                                   2349 ;       from address a.
                                   2350 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000CC3                       2351         _HEADER DAT,2,"2@"
      008D43 8D 2C                    1         .word LINK 
                           000CC5     2         LINK=.
      008D45 02                       3         .byte 2  
      008D46 32 40                    4         .ascii "2@"
      008D48                          5         DAT:
      008D48 90 93            [ 1] 2352         ldw y,x 
      008D4A 1D 00 02         [ 2] 2353         subw x,#CELLL 
      008D4D 90 FE            [ 2] 2354         ldw y,(y) ;address 
      008D4F 90 89            [ 2] 2355         pushw y  
      008D51 90 FE            [ 2] 2356         ldw y,(y) ; dhi 
      008D53 FF               [ 2] 2357         ldw (x),y 
      008D54 90 85            [ 2] 2358         popw y 
      008D56 90 EE 02         [ 2] 2359         ldw y,(2,y) ; dlo 
      008D59 EF 02            [ 2] 2360         ldw (2,x),y 
      008D5B 81               [ 4] 2361         ret 
                                   2362 
                                   2363 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2364 ;       COUNT   ( b -- b +n )
                                   2365 ;       Return count byte of a string
                                   2366 ;       and add 1 to byte address.
                                   2367 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000CDC                       2368         _HEADER COUNT,5,"COUNT"
      008D5C 8D 45                    1         .word LINK 
                           000CDE     2         LINK=.
      008D5E 05                       3         .byte 5  
      008D5F 43 4F 55 4E 54           4         .ascii "COUNT"
      008D64                          5         COUNT:
      008D64 90 93            [ 1] 2369         ldw y,x 
      008D66 90 FE            [ 2] 2370         ldw y,(y) ; address 
      008D68 90 F6            [ 1] 2371         ld a,(y)  ; count 
      008D6A 90 5C            [ 1] 2372         incw y 
      008D6C FF               [ 2] 2373         ldw (x),y 
      008D6D 1D 00 02         [ 2] 2374         subw x,#CELLL 
      008D70 E7 01            [ 1] 2375         ld (1,x),a 
      008D72 7F               [ 1] 2376         clr (x)
      008D73 81               [ 4] 2377         ret 
                                   2378 
                                   2379 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2380 ;       HERE    ( -- a )
                                   2381 ;       Return  top of  variables
                                   2382 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000CF4                       2383         _HEADER HERE,4,"HERE"
      008D74 8D 5E                    1         .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



                           000CF6     2         LINK=.
      008D76 04                       3         .byte 4  
      008D77 48 45 52 45              4         .ascii "HERE"
      008D7B                          5         HERE:
      008D7B 90 AE 00 18      [ 2] 2384       	ldw y,#UVP 
      008D7F 90 FE            [ 2] 2385         ldw y,(y)
      008D81 1D 00 02         [ 2] 2386         subw x,#CELLL 
      008D84 FF               [ 2] 2387         ldw (x),y 
      008D85 81               [ 4] 2388         ret 
                                   2389 
                                   2390 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2391 ;       PAD     ( -- a )
                                   2392 ;       Return address of text buffer
                                   2393 ;       above  code dictionary.
                                   2394 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000D06                       2395         _HEADER PAD,3,"PAD"
      008D86 8D 76                    1         .word LINK 
                           000D08     2         LINK=.
      008D88 03                       3         .byte 3  
      008D89 50 41 44                 4         .ascii "PAD"
      008D8C                          5         PAD:
      008D8C CD 8D 7B         [ 4] 2396         CALL     HERE
      000D0F                       2397         _DOLIT   80
      008D8F CD 84 EF         [ 4]    1     CALL DOLIT 
      008D92 00 50                    2     .word 80 
      008D94 CC 88 BC         [ 2] 2398         JP     PLUS
                                   2399 
                                   2400 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2401 ;       TIB     ( -- a )
                                   2402 ;       Return address of 
                                   2403 ;       terminal input buffer.
                                   2404 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000D17                       2405         _HEADER TIB,3,"TIB"
      008D97 8D 88                    1         .word LINK 
                           000D19     2         LINK=.
      008D99 03                       3         .byte 3  
      008D9A 54 49 42                 4         .ascii "TIB"
      008D9D                          5         TIB:
      008D9D CD 87 8D         [ 4] 2406         CALL     NTIB
      008DA0 CD 8C 07         [ 4] 2407         CALL     CELLP
      008DA3 CC 85 63         [ 2] 2408         JP     AT
                                   2409 
                                   2410 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2411 ;       @EXECUTE        ( a -- )
                                   2412 ;       Execute vector stored in 
                                   2413 ;       address a.
                                   2414 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000D26                       2415         _HEADER ATEXE,8,"@EXECUTE"
      008DA6 8D 99                    1         .word LINK 
                           000D28     2         LINK=.
      008DA8 08                       3         .byte 8  
      008DA9 40 45 58 45 43 55 54     4         .ascii "@EXECUTE"
             45
      008DB1                          5         ATEXE:
      008DB1 CD 85 63         [ 4] 2416         CALL     AT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



      008DB4 CD 88 4C         [ 4] 2417         CALL     QDUP    ;?address or zero
      008DB7 CD 85 18         [ 4] 2418         CALL     QBRAN
      008DBA 8D BF                 2419         .word      EXE1
      008DBC CD 85 44         [ 4] 2420         CALL     EXECU   ;execute if non-zero
      008DBF 81               [ 4] 2421 EXE1:   RET     ;do nothing if zero
                                   2422 
                                   2423 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2424 ;       CMOVE   ( b1 b2 u -- )
                                   2425 ;       Copy u bytes from b1 to b2.
                                   2426 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000D40                       2427         _HEADER CMOVE,5,"CMOVE"
      008DC0 8D A8                    1         .word LINK 
                           000D42     2         LINK=.
      008DC2 05                       3         .byte 5  
      008DC3 43 4D 4F 56 45           4         .ascii "CMOVE"
      008DC8                          5         CMOVE:
      008DC8 CD 86 62         [ 4] 2428         CALL	TOR
      008DCB CD 85 34         [ 4] 2429         CALL	BRAN
      008DCE 8D E8                 2430         .word	CMOV2
      008DD0 CD 86 62         [ 4] 2431 CMOV1:	CALL	TOR
      008DD3 CD 86 99         [ 4] 2432         CALL	DUPP
      008DD6 CD 85 81         [ 4] 2433         CALL	CAT
      008DD9 CD 85 C5         [ 4] 2434         CALL	RAT
      008DDC CD 85 70         [ 4] 2435         CALL	CSTOR
      008DDF CD 8C 32         [ 4] 2436         CALL	ONEP
      008DE2 CD 85 B4         [ 4] 2437         CALL	RFROM
      008DE5 CD 8C 32         [ 4] 2438         CALL	ONEP
      008DE8 CD 85 03         [ 4] 2439 CMOV2:	CALL	DONXT
      008DEB 8D D0                 2440         .word	CMOV1
      008DED CC 88 9C         [ 2] 2441         JP	DDROP
                                   2442 
                                   2443 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2444 ;       FILL    ( b u c -- )
                                   2445 ;       Fill u bytes of character c
                                   2446 ;       to area beginning at b.
                                   2447 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000D70                       2448         _HEADER FILL,4,"FILL"
      008DF0 8D C2                    1         .word LINK 
                           000D72     2         LINK=.
      008DF2 04                       3         .byte 4  
      008DF3 46 49 4C 4C              4         .ascii "FILL"
      008DF7                          5         FILL:
      008DF7 90 93            [ 1] 2449         ldw y,x 
      008DF9 90 E6 01         [ 1] 2450         ld a,(1,y) ; c 
      008DFC 1C 00 02         [ 2] 2451         addw x,#CELLL ; drop c 
      008DFF 90 93            [ 1] 2452         ldw y,x 
      008E01 90 FE            [ 2] 2453         ldw y,(y) ; count
      008E03 90 89            [ 2] 2454         pushw y 
      008E05 1C 00 02         [ 2] 2455         addw x,#CELLL ; drop u 
      008E08 90 93            [ 1] 2456         ldw y,x 
      008E0A 1C 00 02         [ 2] 2457         addw x,#CELLL ; drop b 
      008E0D 90 FE            [ 2] 2458         ldw y,(y) ; address
      008E0F 90 BF 26         [ 2] 2459         ldw YTEMP,y
      008E12 90 85            [ 2] 2460         popw y ; count 
      008E14                       2461 FILL1:  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



      008E14 92 C7 26         [ 4] 2462         ld [YTEMP],a 
      008E17 3C 27            [ 1] 2463         inc YTEMP+1
      008E19 24 02            [ 1] 2464         jrnc FILL2 
      008E1B 3C 26            [ 1] 2465         inc YTEMP
      008E1D                       2466 FILL2: 
      008E1D 90 5A            [ 2] 2467         decw y ; count 
      008E1F 26 F3            [ 1] 2468         jrne FILL1  
      008E21 81               [ 4] 2469         ret 
                                   2470 
                                   2471 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2472 ;       ERASE   ( b u -- )
                                   2473 ;       Erase u bytes beginning at b.
                                   2474 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000DA2                       2475         _HEADER ERASE,5,"ERASE"
      008E22 8D F2                    1         .word LINK 
                           000DA4     2         LINK=.
      008E24 05                       3         .byte 5  
      008E25 45 52 41 53 45           4         .ascii "ERASE"
      008E2A                          5         ERASE:
      008E2A 90 5F            [ 1] 2476         clrw y 
      008E2C 1D 00 02         [ 2] 2477         subw x,#CELLL 
      008E2F FF               [ 2] 2478         ldw (x),y 
      008E30 CC 8D F7         [ 2] 2479         jp FILL 
                                   2480 
                                   2481 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2482 ;       PACK0   ( b u a -- a )
                                   2483 ;       Build a counted string with
                                   2484 ;       u characters from b. Null fill.
                                   2485 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000DB3                       2486         _HEADER PACKS,5,"PACK0"
      008E33 8E 24                    1         .word LINK 
                           000DB5     2         LINK=.
      008E35 05                       3         .byte 5  
      008E36 50 41 43 4B 30           4         .ascii "PACK0"
      008E3B                          5         PACKS:
      008E3B CD 86 99         [ 4] 2487         CALL     DUPP
      008E3E CD 86 62         [ 4] 2488         CALL     TOR     ;strings only on cell boundary
      008E41 CD 88 A7         [ 4] 2489         CALL     DDUP
      008E44 CD 85 70         [ 4] 2490         CALL     CSTOR
      008E47 CD 8C 32         [ 4] 2491         CALL     ONEP ;save count
      008E4A CD 86 A9         [ 4] 2492         CALL     SWAPP
      008E4D CD 8D C8         [ 4] 2493         CALL     CMOVE
      008E50 CD 85 B4         [ 4] 2494         CALL     RFROM
      008E53 81               [ 4] 2495         RET
                                   2496 
                                   2497 ;; Numeric output, single precision
                                   2498 
                                   2499 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2500 ;       DIGIT   ( u -- c )
                                   2501 ;       Convert digit u to a character.
                                   2502 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000DD4                       2503         _HEADER DIGIT,5,"DIGIT"
      008E54 8E 35                    1         .word LINK 
                           000DD6     2         LINK=.
      008E56 05                       3         .byte 5  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



      008E57 44 49 47 49 54           4         .ascii "DIGIT"
      008E5C                          5         DIGIT:
      008E5C CD 84 EF         [ 4] 2504         CALL	DOLIT
      008E5F 00 09                 2505         .word	9
      008E61 CD 86 C1         [ 4] 2506         CALL	OVER
      008E64 CD 89 A6         [ 4] 2507         CALL	LESS
      008E67 CD 84 EF         [ 4] 2508         CALL	DOLIT
      008E6A 00 07                 2509         .word	7
      008E6C CD 86 F6         [ 4] 2510         CALL	ANDD
      008E6F CD 88 BC         [ 4] 2511         CALL	PLUS
      008E72 CD 84 EF         [ 4] 2512         CALL	DOLIT
      008E75 00 30                 2513         .word	48	;'0'
      008E77 CC 88 BC         [ 2] 2514         JP	PLUS
                                   2515 
                                   2516 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2517 ;       EXTRACT ( n base -- n c )
                                   2518 ;       Extract least significant 
                                   2519 ;       digit from n.
                                   2520 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000DFA                       2521         _HEADER EXTRC,7,"EXTRACT"
      008E7A 8E 56                    1         .word LINK 
                           000DFC     2         LINK=.
      008E7C 07                       3         .byte 7  
      008E7D 45 58 54 52 41 43 54     4         .ascii "EXTRACT"
      008E84                          5         EXTRC:
      008E84 CD 8C 9E         [ 4] 2522         CALL     ZERO
      008E87 CD 86 A9         [ 4] 2523         CALL     SWAPP
      008E8A CD 8A 31         [ 4] 2524         CALL     UMMOD
      008E8D CD 86 A9         [ 4] 2525         CALL     SWAPP
      008E90 CC 8E 5C         [ 2] 2526         JP     DIGIT
                                   2527 
                                   2528 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2529 ;       <#      ( -- )
                                   2530 ;       Initiate  numeric 
                                   2531 ;       output process.
                                   2532 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000E13                       2533         _HEADER BDIGS,2,"#<"
      008E93 8E 7C                    1         .word LINK 
                           000E15     2         LINK=.
      008E95 02                       3         .byte 2  
      008E96 23 3C                    4         .ascii "#<"
      008E98                          5         BDIGS:
      008E98 CD 8D 8C         [ 4] 2534         CALL     PAD
      008E9B CD 87 CF         [ 4] 2535         CALL     HLD
      008E9E CC 85 51         [ 2] 2536         JP     STORE
                                   2537 
                                   2538 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2539 ;       HOLD    ( c -- )
                                   2540 ;       Insert a character 
                                   2541 ;       into output string.
                                   2542 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000E21                       2543         _HEADER HOLD,4,"HOLD"
      008EA1 8E 95                    1         .word LINK 
                           000E23     2         LINK=.
      008EA3 04                       3         .byte 4  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



      008EA4 48 4F 4C 44              4         .ascii "HOLD"
      008EA8                          5         HOLD:
      008EA8 CD 87 CF         [ 4] 2544         CALL     HLD
      008EAB CD 85 63         [ 4] 2545         CALL     AT
      008EAE CD 8C 3F         [ 4] 2546         CALL     ONEM
      008EB1 CD 86 99         [ 4] 2547         CALL     DUPP
      008EB4 CD 87 CF         [ 4] 2548         CALL     HLD
      008EB7 CD 85 51         [ 4] 2549         CALL     STORE
      008EBA CC 85 70         [ 2] 2550         JP     CSTOR
                                   2551 
                                   2552 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2553 ;       #       ( u -- u )
                                   2554 ;       Extract one digit from u and
                                   2555 ;       append digit to output string.
                                   2556 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000E3D                       2557         _HEADER DIG,1,"#"
      008EBD 8E A3                    1         .word LINK 
                           000E3F     2         LINK=.
      008EBF 01                       3         .byte 1  
      008EC0 23                       4         .ascii "#"
      008EC1                          5         DIG:
      008EC1 CD 87 5F         [ 4] 2558         CALL     BASE
      008EC4 CD 85 63         [ 4] 2559         CALL     AT
      008EC7 CD 8E 84         [ 4] 2560         CALL     EXTRC
      008ECA CC 8E A8         [ 2] 2561         JP     HOLD
                                   2562 
                                   2563 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2564 ;       #S      ( u -- 0 )
                                   2565 ;       Convert u until all digits
                                   2566 ;       are added to output string.
                                   2567 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000E4D                       2568         _HEADER DIGS,2,"#S"
      008ECD 8E BF                    1         .word LINK 
                           000E4F     2         LINK=.
      008ECF 02                       3         .byte 2  
      008ED0 23 53                    4         .ascii "#S"
      008ED2                          5         DIGS:
      008ED2 CD 8E C1         [ 4] 2569 DIGS1:  CALL     DIG
      008ED5 CD 86 99         [ 4] 2570         CALL     DUPP
      008ED8 CD 85 18         [ 4] 2571         CALL     QBRAN
      008EDB 8E DF                 2572         .word      DIGS2
      008EDD 20 F3            [ 2] 2573         JRA     DIGS1
      008EDF 81               [ 4] 2574 DIGS2:  RET
                                   2575 
                                   2576 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2577 ;       SIGN    ( n -- )
                                   2578 ;       Add a minus sign to
                                   2579 ;       numeric output string.
                                   2580 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000E60                       2581         _HEADER SIGN,4,"SIGN"
      008EE0 8E CF                    1         .word LINK 
                           000E62     2         LINK=.
      008EE2 04                       3         .byte 4  
      008EE3 53 49 47 4E              4         .ascii "SIGN"
      008EE7                          5         SIGN:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



      008EE7 CD 86 D0         [ 4] 2582         CALL     ZLESS
      008EEA CD 85 18         [ 4] 2583         CALL     QBRAN
      008EED 8E F7                 2584         .word      SIGN1
      008EEF CD 84 EF         [ 4] 2585         CALL     DOLIT
      008EF2 00 2D                 2586         .word      45	;"-"
      008EF4 CC 8E A8         [ 2] 2587         JP     HOLD
      008EF7 81               [ 4] 2588 SIGN1:  RET
                                   2589 
                                   2590 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2591 ;       #>      ( w -- b u )
                                   2592 ;       Prepare output string.
                                   2593 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000E78                       2594         _HEADER EDIGS,2,"#>"
      008EF8 8E E2                    1         .word LINK 
                           000E7A     2         LINK=.
      008EFA 02                       3         .byte 2  
      008EFB 23 3E                    4         .ascii "#>"
      008EFD                          5         EDIGS:
      008EFD CD 86 8F         [ 4] 2595         CALL     DROP
      008F00 CD 87 CF         [ 4] 2596         CALL     HLD
      008F03 CD 85 63         [ 4] 2597         CALL     AT
      008F06 CD 8D 8C         [ 4] 2598         CALL     PAD
      008F09 CD 86 C1         [ 4] 2599         CALL     OVER
      008F0C CC 89 52         [ 2] 2600         JP     SUBB
                                   2601 
                                   2602 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2603 ;       str     ( w -- b u )
                                   2604 ;       Convert a signed integer
                                   2605 ;       to a numeric string.
                                   2606 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000E8F                       2607         _HEADER STR,3,"STR"
      008F0F 8E FA                    1         .word LINK 
                           000E91     2         LINK=.
      008F11 03                       3         .byte 3  
      008F12 53 54 52                 4         .ascii "STR"
      008F15                          5         STR:
      008F15 CD 86 99         [ 4] 2608         CALL     DUPP
      008F18 CD 86 62         [ 4] 2609         CALL     TOR
      008F1B CD 89 6C         [ 4] 2610         CALL     ABSS
      008F1E CD 8E 98         [ 4] 2611         CALL     BDIGS
      008F21 CD 8E D2         [ 4] 2612         CALL     DIGS
      008F24 CD 85 B4         [ 4] 2613         CALL     RFROM
      008F27 CD 8E E7         [ 4] 2614         CALL     SIGN
      008F2A CC 8E FD         [ 2] 2615         JP     EDIGS
                                   2616 
                                   2617 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2618 ;       HEX     ( -- )
                                   2619 ;       Use radix 16 as base for
                                   2620 ;       numeric conversions.
                                   2621 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000EAD                       2622         _HEADER HEX,3,"HEX"
      008F2D 8F 11                    1         .word LINK 
                           000EAF     2         LINK=.
      008F2F 03                       3         .byte 3  
      008F30 48 45 58                 4         .ascii "HEX"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



      008F33                          5         HEX:
      008F33 CD 84 EF         [ 4] 2623         CALL     DOLIT
      008F36 00 10                 2624         .word      16
      008F38 CD 87 5F         [ 4] 2625         CALL     BASE
      008F3B CC 85 51         [ 2] 2626         JP     STORE
                                   2627 
                                   2628 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2629 ;       DECIMAL ( -- )
                                   2630 ;       Use radix 10 as base
                                   2631 ;       for numeric conversions.
                                   2632 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000EBE                       2633         _HEADER DECIM,7,"DECIMAL"
      008F3E 8F 2F                    1         .word LINK 
                           000EC0     2         LINK=.
      008F40 07                       3         .byte 7  
      008F41 44 45 43 49 4D 41 4C     4         .ascii "DECIMAL"
      008F48                          5         DECIM:
      008F48 CD 84 EF         [ 4] 2634         CALL     DOLIT
      008F4B 00 0A                 2635         .word      10
      008F4D CD 87 5F         [ 4] 2636         CALL     BASE
      008F50 CC 85 51         [ 2] 2637         JP     STORE
                                   2638 
                                   2639 ;; Numeric input, single precision
                                   2640 
                                   2641 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2642 ;       DIGIT?  ( c base -- u t )
                                   2643 ;       Convert a character to its numeric
                                   2644 ;       value. A flag indicates success.
                                   2645 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000ED3                       2646         _HEADER DIGTQ,6,"DIGIT?"
      008F53 8F 40                    1         .word LINK 
                           000ED5     2         LINK=.
      008F55 06                       3         .byte 6  
      008F56 44 49 47 49 54 3F        4         .ascii "DIGIT?"
      008F5C                          5         DIGTQ:
      008F5C CD 86 62         [ 4] 2647         CALL     TOR
      008F5F CD 84 EF         [ 4] 2648         CALL     DOLIT
      008F62 00 30                 2649         .word     48	; "0"
      008F64 CD 89 52         [ 4] 2650         CALL     SUBB
      008F67 CD 84 EF         [ 4] 2651         CALL     DOLIT
      008F6A 00 09                 2652         .word      9
      008F6C CD 86 C1         [ 4] 2653         CALL     OVER
      008F6F CD 89 A6         [ 4] 2654         CALL     LESS
      008F72 CD 85 18         [ 4] 2655         CALL     QBRAN
      008F75 8F 8D                 2656         .word      DGTQ1
      008F77 CD 84 EF         [ 4] 2657         CALL     DOLIT
      008F7A 00 07                 2658         .word      7
      008F7C CD 89 52         [ 4] 2659         CALL     SUBB
      008F7F CD 86 99         [ 4] 2660         CALL     DUPP
      008F82 CD 84 EF         [ 4] 2661         CALL     DOLIT
      008F85 00 0A                 2662         .word      10
      008F87 CD 89 A6         [ 4] 2663         CALL     LESS
      008F8A CD 87 0A         [ 4] 2664         CALL     ORR
      008F8D CD 86 99         [ 4] 2665 DGTQ1:  CALL     DUPP
      008F90 CD 85 B4         [ 4] 2666         CALL     RFROM
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



      008F93 CC 89 90         [ 2] 2667         JP     ULESS
                                   2668 
                           000001  2669 .if  WANT_DOUBLE
                           000000  2670 .else 
                                   2671 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2672 ;       NUMBER? ( a -- n T | a F )
                                   2673 ;       Convert a number string to
                                   2674 ;       integer. Push a flag on tos.
                                   2675 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2676         _HEADER NUMBQ,7,"NUMBER?"
                                   2677         CALL     BASE
                                   2678         CALL     AT
                                   2679         CALL     TOR
                                   2680         CALL     ZERO
                                   2681         CALL     OVER
                                   2682         CALL     COUNT
                                   2683         CALL     OVER
                                   2684         CALL     CAT
                                   2685         CALL     DOLIT
                                   2686         .word     36	; "0x"
                                   2687         CALL     EQUAL
                                   2688         CALL     QBRAN
                                   2689         .word      NUMQ1
                                   2690         CALL     HEX
                                   2691         CALL     SWAPP
                                   2692         CALL     ONEP
                                   2693         CALL     SWAPP
                                   2694         CALL     ONEM
                                   2695 NUMQ1:  CALL     OVER
                                   2696         CALL     CAT
                                   2697         CALL     DOLIT
                                   2698         .word     45	; "-"
                                   2699         CALL     EQUAL
                                   2700         CALL     TOR
                                   2701         CALL     SWAPP
                                   2702         CALL     RAT
                                   2703         CALL     SUBB
                                   2704         CALL     SWAPP
                                   2705         CALL     RAT
                                   2706         CALL     PLUS
                                   2707         CALL     QDUP
                                   2708         CALL     QBRAN
                                   2709         .word      NUMQ6
                                   2710         CALL     ONEM
                                   2711         CALL     TOR
                                   2712 NUMQ2:  CALL     DUPP
                                   2713         CALL     TOR
                                   2714         CALL     CAT
                                   2715         CALL     BASE
                                   2716         CALL     AT
                                   2717         CALL     DIGTQ
                                   2718         CALL     QBRAN
                                   2719         .word      NUMQ4
                                   2720         CALL     SWAPP
                                   2721         CALL     BASE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



                                   2722         CALL     AT
                                   2723         CALL     STAR
                                   2724         CALL     PLUS
                                   2725         CALL     RFROM
                                   2726         CALL     ONEP
                                   2727         CALL     DONXT
                                   2728         .word      NUMQ2
                                   2729         CALL     RAT
                                   2730         CALL     SWAPP
                                   2731         CALL     DROP
                                   2732         CALL     QBRAN
                                   2733         .word      NUMQ3
                                   2734         CALL     NEGAT
                                   2735 NUMQ3:  CALL     SWAPP
                                   2736         JRA     NUMQ5
                                   2737 NUMQ4:  CALL     RFROM
                                   2738         CALL     RFROM
                                   2739         CALL     DDROP
                                   2740         CALL     DDROP
                                   2741         CALL     ZERO
                                   2742 NUMQ5:  CALL     DUPP
                                   2743 NUMQ6:  CALL     RFROM
                                   2744         CALL     DDROP
                                   2745         CALL     RFROM
                                   2746         CALL     BASE
                                   2747         JP     STORE
                                   2748 .endif ; WANT_DOUBLE  
                                   2749 
                                   2750 ;; Basic I/O
                                   2751 
                                   2752 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2753 ;       KEY     ( -- c )
                                   2754 ;       Wait for and return an
                                   2755 ;       input character.
                                   2756 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000F16                       2757         _HEADER KEY,3,"KEY"
      008F96 8F 55                    1         .word LINK 
                           000F18     2         LINK=.
      008F98 03                       3         .byte 3  
      008F99 4B 45 59                 4         .ascii "KEY"
      008F9C                          5         KEY:
      008F9C 72 0B 52 30 FB   [ 2] 2758         btjf UART_SR,#UART_SR_RXNE,. 
      008FA1 C6 52 31         [ 1] 2759         ld a,UART_DR 
      008FA4 1D 00 02         [ 2] 2760         subw x,#CELLL 
      008FA7 E7 01            [ 1] 2761         ld (1,x),a 
      008FA9 7F               [ 1] 2762         clr (x)
      008FAA 81               [ 4] 2763         ret 
                                   2764 
                                   2765 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2766 ;       NUF?    ( -- t )
                                   2767 ;       Return false if no input,
                                   2768 ;       else pause and if CR return true.
                                   2769 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000F2B                       2770         _HEADER NUFQ,4,"NUF?"
      008FAB 8F 98                    1         .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



                           000F2D     2         LINK=.
      008FAD 04                       3         .byte 4  
      008FAE 4E 55 46 3F              4         .ascii "NUF?"
      008FB2                          5         NUFQ:
      008FB2 CD 84 98         [ 4] 2771         CALL     QKEY
      008FB5 CD 86 99         [ 4] 2772         CALL     DUPP
      008FB8 CD 85 18         [ 4] 2773         CALL     QBRAN
      008FBB 8F CB                 2774         .word    NUFQ1
      008FBD CD 88 9C         [ 4] 2775         CALL     DDROP
      008FC0 CD 8F 9C         [ 4] 2776         CALL     KEY
      008FC3 CD 84 EF         [ 4] 2777         CALL     DOLIT
      008FC6 00 0D                 2778         .word      CRR
      008FC8 CC 89 7A         [ 2] 2779         JP     EQUAL
      008FCB 81               [ 4] 2780 NUFQ1:  RET
                                   2781 
                                   2782 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2783 ;       SPACE   ( -- )
                                   2784 ;       Send  blank character to
                                   2785 ;       output device.
                                   2786 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000F4C                       2787         _HEADER SPACE,5,"SPACE"
      008FCC 8F AD                    1         .word LINK 
                           000F4E     2         LINK=.
      008FCE 05                       3         .byte 5  
      008FCF 53 50 41 43 45           4         .ascii "SPACE"
      008FD4                          5         SPACE:
      008FD4 CD 8C 91         [ 4] 2788         CALL     BLANK
      008FD7 CC 84 B6         [ 2] 2789         JP     EMIT
                                   2790 
                                   2791 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2792 ;       SPACES  ( +n -- )
                                   2793 ;       Send n spaces to output device.
                                   2794 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000F5A                       2795         _HEADER SPACS,6,"SPACES"
      008FDA 8F CE                    1         .word LINK 
                           000F5C     2         LINK=.
      008FDC 06                       3         .byte 6  
      008FDD 53 50 41 43 45 53        4         .ascii "SPACES"
      008FE3                          5         SPACS:
      008FE3 CD 8C 9E         [ 4] 2796         CALL     ZERO
      008FE6 CD 89 EB         [ 4] 2797         CALL     MAX
      008FE9 CD 86 62         [ 4] 2798         CALL     TOR
      008FEC 20 03            [ 2] 2799         JRA      CHAR2
      008FEE CD 8F D4         [ 4] 2800 CHAR1:  CALL     SPACE
      008FF1 CD 85 03         [ 4] 2801 CHAR2:  CALL     DONXT
      008FF4 8F EE                 2802         .word    CHAR1
      008FF6 81               [ 4] 2803         RET
                                   2804 
                                   2805 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2806 ;       TYPE    ( b u -- )
                                   2807 ;       Output u characters from b.
                                   2808 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000F77                       2809         _HEADER TYPES,4,"TYPE"
      008FF7 8F DC                    1         .word LINK 
                           000F79     2         LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



      008FF9 04                       3         .byte 4  
      008FFA 54 59 50 45              4         .ascii "TYPE"
      008FFE                          5         TYPES:
      008FFE CD 86 62         [ 4] 2810         CALL     TOR
      009001 20 06            [ 2] 2811         JRA     TYPE2
      009003 CD 8D 64         [ 4] 2812 TYPE1:  CALL     COUNT 
      009006 CD 84 B6         [ 4] 2813         CALL     EMIT
      000F89                       2814 TYPE2:  _DONXT  TYPE1
      009009 CD 85 03         [ 4]    1     CALL DONXT 
      00900C 90 03                    2     .word TYPE1 
      00900E CC 86 8F         [ 2] 2815         JP     DROP
                                   2816 
                                   2817 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2818 ;       CR      ( -- )
                                   2819 ;       Output a carriage return
                                   2820 ;       and a line feed.
                                   2821 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000F91                       2822         _HEADER CR,2,"CR"
      009011 8F F9                    1         .word LINK 
                           000F93     2         LINK=.
      009013 02                       3         .byte 2  
      009014 43 52                    4         .ascii "CR"
      009016                          5         CR:
      000F96                       2823         _DOLIT  CRR 
      009016 CD 84 EF         [ 4]    1     CALL DOLIT 
      009019 00 0D                    2     .word CRR 
      00901B CD 84 B6         [ 4] 2824         CALL    EMIT
      000F9E                       2825         _DOLIT  LF
      00901E CD 84 EF         [ 4]    1     CALL DOLIT 
      009021 00 0A                    2     .word LF 
      009023 CC 84 B6         [ 2] 2826         JP      EMIT
                                   2827 
                                   2828 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2829 ;       do$     ( -- a )
                                   2830 ;       Return  address of a compiled
                                   2831 ;       string.
                                   2832 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2833 ;       _HEADER DOSTR,COMPO+3,"DO$"
      009026                       2834 DOSTR:
      009026 CD 85 B4         [ 4] 2835         CALL     RFROM
      009029 CD 85 C5         [ 4] 2836         CALL     RAT
      00902C CD 85 B4         [ 4] 2837         CALL     RFROM
      00902F CD 8D 64         [ 4] 2838         CALL     COUNT
      009032 CD 88 BC         [ 4] 2839         CALL     PLUS
      009035 CD 86 62         [ 4] 2840         CALL     TOR
      009038 CD 86 A9         [ 4] 2841         CALL     SWAPP
      00903B CD 86 62         [ 4] 2842         CALL     TOR
      00903E 81               [ 4] 2843         RET
                                   2844 
                                   2845 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2846 ;       $"|     ( -- a )
                                   2847 ;       Run time routine compiled by $".
                                   2848 ;       Return address of a compiled string.
                                   2849 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2850 ;       _HEADER STRQP,COMPO+3,"$\"|"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



      00903F                       2851 STRQP:
      00903F CD 90 26         [ 4] 2852         CALL     DOSTR
      009042 81               [ 4] 2853         RET
                                   2854 
                                   2855 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2856 ;       ."|     ( -- )
                                   2857 ;       Run time routine of ." .
                                   2858 ;       Output a compiled string.
                                   2859 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2860 ;       _HEADER DOTQP,COMPO+3,".\"|"
      009043                       2861 DOTQP:
      009043 CD 90 26         [ 4] 2862         CALL     DOSTR
      009046 CD 8D 64         [ 4] 2863         CALL     COUNT
      009049 CC 8F FE         [ 2] 2864         JP     TYPES
                                   2865 
                                   2866 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2867 ;       .R      ( n +n -- )
                                   2868 ;       Display an integer in a field
                                   2869 ;       of n columns, right justified.
                                   2870 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000FCC                       2871         _HEADER DOTR,2,".R"
      00904C 90 13                    1         .word LINK 
                           000FCE     2         LINK=.
      00904E 02                       3         .byte 2  
      00904F 2E 52                    4         .ascii ".R"
      009051                          5         DOTR:
      009051 CD 86 62         [ 4] 2872         CALL     TOR
      009054 CD 8F 15         [ 4] 2873         CALL     STR
      009057 CD 85 B4         [ 4] 2874         CALL     RFROM
      00905A CD 86 C1         [ 4] 2875         CALL     OVER
      00905D CD 89 52         [ 4] 2876         CALL     SUBB
      009060 CD 8F E3         [ 4] 2877         CALL     SPACS
      009063 CC 8F FE         [ 2] 2878         JP     TYPES
                                   2879 
                                   2880 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2881 ;       U.R     ( u +n -- )
                                   2882 ;       Display an unsigned integer
                                   2883 ;       in n column, right justified.
                                   2884 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000FE6                       2885         _HEADER UDOTR,3,"U.R"
      009066 90 4E                    1         .word LINK 
                           000FE8     2         LINK=.
      009068 03                       3         .byte 3  
      009069 55 2E 52                 4         .ascii "U.R"
      00906C                          5         UDOTR:
      00906C CD 86 62         [ 4] 2886         CALL     TOR
      00906F CD 8E 98         [ 4] 2887         CALL     BDIGS
      009072 CD 8E D2         [ 4] 2888         CALL     DIGS
      009075 CD 8E FD         [ 4] 2889         CALL     EDIGS
      009078 CD 85 B4         [ 4] 2890         CALL     RFROM
      00907B CD 86 C1         [ 4] 2891         CALL     OVER
      00907E CD 89 52         [ 4] 2892         CALL     SUBB
      009081 CD 8F E3         [ 4] 2893         CALL     SPACS
      009084 CC 8F FE         [ 2] 2894         JP     TYPES
                                   2895 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



                                   2896 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2897 ;       U.      ( u -- )
                                   2898 ;       Display an unsigned integer
                                   2899 ;       in free format.
                                   2900 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001007                       2901         _HEADER UDOT,2,"U."
      009087 90 68                    1         .word LINK 
                           001009     2         LINK=.
      009089 02                       3         .byte 2  
      00908A 55 2E                    4         .ascii "U."
      00908C                          5         UDOT:
      00908C CD 8E 98         [ 4] 2902         CALL     BDIGS
      00908F CD 8E D2         [ 4] 2903         CALL     DIGS
      009092 CD 8E FD         [ 4] 2904         CALL     EDIGS
      009095 CD 8F D4         [ 4] 2905         CALL     SPACE
      009098 CC 8F FE         [ 2] 2906         JP     TYPES
                                   2907 
                                   2908 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2909 ;   H. ( n -- )
                                   2910 ;   display n in hexadecimal 
                                   2911 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00101B                       2912         _HEADER HDOT,2,"H."
      00909B 90 89                    1         .word LINK 
                           00101D     2         LINK=.
      00909D 02                       3         .byte 2  
      00909E 48 2E                    4         .ascii "H."
      0090A0                          5         HDOT:
      0090A0 CD 87 5F         [ 4] 2913         CALL BASE 
      0090A3 CD 85 63         [ 4] 2914         CALL AT 
      0090A6 CD 86 62         [ 4] 2915         CALL TOR 
      0090A9 CD 8F 33         [ 4] 2916         CALL HEX 
      0090AC CD 90 8C         [ 4] 2917         CALL UDOT 
      0090AF CD 85 B4         [ 4] 2918         CALL RFROM 
      0090B2 CD 87 5F         [ 4] 2919         CALL BASE 
      0090B5 CD 85 51         [ 4] 2920         CALL STORE 
      0090B8 81               [ 4] 2921         RET 
                                   2922 
                                   2923 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2924 ;       .       ( w -- )
                                   2925 ;       Display an integer in free
                                   2926 ;       format, preceeded by a space.
                                   2927 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001039                       2928         _HEADER DOT,1,"."
      0090B9 90 9D                    1         .word LINK 
                           00103B     2         LINK=.
      0090BB 01                       3         .byte 1  
      0090BC 2E                       4         .ascii "."
      0090BD                          5         DOT:
      0090BD CD 87 5F         [ 4] 2929         CALL     BASE
      0090C0 CD 85 63         [ 4] 2930         CALL     AT
      0090C3 CD 84 EF         [ 4] 2931         CALL     DOLIT
      0090C6 00 0A                 2932         .word      10
      0090C8 CD 87 1F         [ 4] 2933         CALL     XORR    ;?decimal
      0090CB CD 85 18         [ 4] 2934         CALL     QBRAN
      0090CE 90 D3                 2935         .word      DOT1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



      0090D0 CC 90 8C         [ 2] 2936         JP     UDOT
      0090D3 CD 8F 15         [ 4] 2937 DOT1:   CALL     STR
      0090D6 CD 8F D4         [ 4] 2938         CALL     SPACE
      0090D9 CC 8F FE         [ 2] 2939         JP     TYPES
                                   2940 
                                   2941 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2942 ;       ?       ( a -- )
                                   2943 ;       Display contents in memory cell.
                                   2944 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00105C                       2945         _HEADER QUEST,1,"?"
      0090DC 90 BB                    1         .word LINK 
                           00105E     2         LINK=.
      0090DE 01                       3         .byte 1  
      0090DF 3F                       4         .ascii "?"
      0090E0                          5         QUEST:
      0090E0 CD 85 63         [ 4] 2946         CALL     AT
      0090E3 CC 90 BD         [ 2] 2947         JP     DOT
                                   2948 
                                   2949 ;; Parsing
                                   2950 
                                   2951 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2952 ;       parse   ( b u c -- b u delta ; <string> )
                                   2953 ;       Scan string delimited by c.
                                   2954 ;       Return found string and its offset.
                                   2955 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001066                       2956         _HEADER PARS,5,"PARS$"
      0090E6 90 DE                    1         .word LINK 
                           001068     2         LINK=.
      0090E8 05                       3         .byte 5  
      0090E9 50 41 52 53 24           4         .ascii "PARS$"
      0090EE                          5         PARS:
      0090EE CD 87 6E         [ 4] 2957         CALL     TEMP
      0090F1 CD 85 51         [ 4] 2958         CALL     STORE
      0090F4 CD 86 C1         [ 4] 2959         CALL     OVER
      0090F7 CD 86 62         [ 4] 2960         CALL     TOR
      0090FA CD 86 99         [ 4] 2961         CALL     DUPP
      0090FD CD 85 18         [ 4] 2962         CALL     QBRAN
      009100 91 A6                 2963         .word    PARS8
      009102 CD 8C 3F         [ 4] 2964         CALL     ONEM
      009105 CD 87 6E         [ 4] 2965         CALL     TEMP
      009108 CD 85 63         [ 4] 2966         CALL     AT
      00910B CD 8C 91         [ 4] 2967         CALL     BLANK
      00910E CD 89 7A         [ 4] 2968         CALL     EQUAL
      009111 CD 85 18         [ 4] 2969         CALL     QBRAN
      009114 91 47                 2970         .word      PARS3
      009116 CD 86 62         [ 4] 2971         CALL     TOR
      009119 CD 8C 91         [ 4] 2972 PARS1:  CALL     BLANK
      00911C CD 86 C1         [ 4] 2973         CALL     OVER
      00911F CD 85 81         [ 4] 2974         CALL     CAT     ;skip leading blanks ONLY
      009122 CD 89 52         [ 4] 2975         CALL     SUBB
      009125 CD 86 D0         [ 4] 2976         CALL     ZLESS
      009128 CD 88 F5         [ 4] 2977         CALL     INVER
      00912B CD 85 18         [ 4] 2978         CALL     QBRAN
      00912E 91 44                 2979         .word      PARS2
      009130 CD 8C 32         [ 4] 2980         CALL     ONEP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



      009133 CD 85 03         [ 4] 2981         CALL     DONXT
      009136 91 19                 2982         .word      PARS1
      009138 CD 85 B4         [ 4] 2983         CALL     RFROM
      00913B CD 86 8F         [ 4] 2984         CALL     DROP
      00913E CD 8C 9E         [ 4] 2985         CALL     ZERO
      009141 CC 86 99         [ 2] 2986         JP     DUPP
      009144 CD 85 B4         [ 4] 2987 PARS2:  CALL     RFROM
      009147 CD 86 C1         [ 4] 2988 PARS3:  CALL     OVER
      00914A CD 86 A9         [ 4] 2989         CALL     SWAPP
      00914D CD 86 62         [ 4] 2990         CALL     TOR
      009150 CD 87 6E         [ 4] 2991 PARS4:  CALL     TEMP
      009153 CD 85 63         [ 4] 2992         CALL     AT
      009156 CD 86 C1         [ 4] 2993         CALL     OVER
      009159 CD 85 81         [ 4] 2994         CALL     CAT
      00915C CD 89 52         [ 4] 2995         CALL     SUBB    ;scan for delimiter
      00915F CD 87 6E         [ 4] 2996         CALL     TEMP
      009162 CD 85 63         [ 4] 2997         CALL     AT
      009165 CD 8C 91         [ 4] 2998         CALL     BLANK
      009168 CD 89 7A         [ 4] 2999         CALL     EQUAL
      00916B CD 85 18         [ 4] 3000         CALL     QBRAN
      00916E 91 73                 3001         .word      PARS5
      009170 CD 86 D0         [ 4] 3002         CALL     ZLESS
      009173 CD 85 18         [ 4] 3003 PARS5:  CALL     QBRAN
      009176 91 88                 3004         .word      PARS6
      009178 CD 8C 32         [ 4] 3005         CALL     ONEP
      00917B CD 85 03         [ 4] 3006         CALL     DONXT
      00917E 91 50                 3007         .word      PARS4
      009180 CD 86 99         [ 4] 3008         CALL     DUPP
      009183 CD 86 62         [ 4] 3009         CALL     TOR
      009186 20 0F            [ 2] 3010         JRA     PARS7
      009188 CD 85 B4         [ 4] 3011 PARS6:  CALL     RFROM
      00918B CD 86 8F         [ 4] 3012         CALL     DROP
      00918E CD 86 99         [ 4] 3013         CALL     DUPP
      009191 CD 8C 32         [ 4] 3014         CALL     ONEP
      009194 CD 86 62         [ 4] 3015         CALL     TOR
      009197 CD 86 C1         [ 4] 3016 PARS7:  CALL     OVER
      00919A CD 89 52         [ 4] 3017         CALL     SUBB
      00919D CD 85 B4         [ 4] 3018         CALL     RFROM
      0091A0 CD 85 B4         [ 4] 3019         CALL     RFROM
      0091A3 CC 89 52         [ 2] 3020         JP     SUBB
      0091A6 CD 86 C1         [ 4] 3021 PARS8:  CALL     OVER
      0091A9 CD 85 B4         [ 4] 3022         CALL     RFROM
      0091AC CC 89 52         [ 2] 3023         JP     SUBB
                                   3024 
                                   3025 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3026 ;       PARSE   ( c -- b u ; <string> )
                                   3027 ;       Scan input stream and return
                                   3028 ;       counted string delimited by c.
                                   3029 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00112F                       3030         _HEADER PARSE,5,"PARSE"
      0091AF 90 E8                    1         .word LINK 
                           001131     2         LINK=.
      0091B1 05                       3         .byte 5  
      0091B2 50 41 52 53 45           4         .ascii "PARSE"
      0091B7                          5         PARSE:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



      0091B7 CD 86 62         [ 4] 3031         CALL     TOR
      0091BA CD 8D 9D         [ 4] 3032         CALL     TIB
      0091BD CD 87 7D         [ 4] 3033         CALL     INN
      0091C0 CD 85 63         [ 4] 3034         CALL     AT
      0091C3 CD 88 BC         [ 4] 3035         CALL     PLUS    ;current input buffer pointer
      0091C6 CD 87 8D         [ 4] 3036         CALL     NTIB
      0091C9 CD 85 63         [ 4] 3037         CALL     AT
      0091CC CD 87 7D         [ 4] 3038         CALL     INN
      0091CF CD 85 63         [ 4] 3039         CALL     AT
      0091D2 CD 89 52         [ 4] 3040         CALL     SUBB    ;remaining count
      0091D5 CD 85 B4         [ 4] 3041         CALL     RFROM
      0091D8 CD 90 EE         [ 4] 3042         CALL     PARS
      0091DB CD 87 7D         [ 4] 3043         CALL     INN
      0091DE CC 8D 0E         [ 2] 3044         JP     PSTOR
                                   3045 
                                   3046 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3047 ;       .(      ( -- )
                                   3048 ;       Output following string up to next ) .
                                   3049 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001161                       3050         _HEADER DOTPR,IMEDD+2,".("
      0091E1 91 B1                    1         .word LINK 
                           001163     2         LINK=.
      0091E3 82                       3         .byte IMEDD+2  
      0091E4 2E 28                    4         .ascii ".("
      0091E6                          5         DOTPR:
      0091E6 CD 84 EF         [ 4] 3051         CALL     DOLIT
      0091E9 00 29                 3052         .word     41	; ")"
      0091EB CD 91 B7         [ 4] 3053         CALL     PARSE
      0091EE CC 8F FE         [ 2] 3054         JP     TYPES
                                   3055 
                                   3056 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3057 ;       (       ( -- )
                                   3058 ;       Ignore following string up to next ).
                                   3059 ;       A comment.
                                   3060 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001171                       3061         _HEADER PAREN,IMEDD+1,"("
      0091F1 91 E3                    1         .word LINK 
                           001173     2         LINK=.
      0091F3 81                       3         .byte IMEDD+1  
      0091F4 28                       4         .ascii "("
      0091F5                          5         PAREN:
      0091F5 CD 84 EF         [ 4] 3062         CALL     DOLIT
      0091F8 00 29                 3063         .word     41	; ")"
      0091FA CD 91 B7         [ 4] 3064         CALL     PARSE
      0091FD CC 88 9C         [ 2] 3065         JP     DDROP
                                   3066 
                                   3067 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3068 ;       \       ( -- )
                                   3069 ;       Ignore following text till
                                   3070 ;       end of line.
                                   3071 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001180                       3072         _HEADER BKSLA,IMEDD+1,"\\"
      009200 91 F3                    1         .word LINK 
                           001182     2         LINK=.
      009202 81                       3         .byte IMEDD+1  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



      009203 5C 5C                    4         .ascii "\\"
      009205                          5         BKSLA:
      009205 90 AE 00 0E      [ 2] 3073         ldw y,#UCTIB ; #TIB  
      009209 90 FE            [ 2] 3074         ldw y,(y)
      00920B 90 89            [ 2] 3075         pushw y ; count in TIB 
      00920D 90 AE 00 0C      [ 2] 3076         ldw y,#UINN ; >IN 
      009211 90 BF 26         [ 2] 3077         ldw YTEMP,y
      009214 90 85            [ 2] 3078         popw y 
      009216 91 CF 26         [ 5] 3079         ldw [YTEMP],y
      009219 81               [ 4] 3080         ret 
                                   3081 
                                   3082 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3083 ;       WORD    ( c -- a ; <string> )
                                   3084 ;       Parse a word from input stream
                                   3085 ;       and copy it to code dictionary.
                                   3086 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00119A                       3087         _HEADER WORDD,4,"WORD"
      00921A 92 02                    1         .word LINK 
                           00119C     2         LINK=.
      00921C 04                       3         .byte 4  
      00921D 57 4F 52 44              4         .ascii "WORD"
      009221                          5         WORDD:
      009221 CD 91 B7         [ 4] 3088         CALL     PARSE
      009224 CD 8D 7B         [ 4] 3089         CALL     HERE
      009227 CD 8C 07         [ 4] 3090         CALL     CELLP
                           000000  3091 .IF CASE_SENSE 
                                   3092         JP      PACKS 
                           000001  3093 .ELSE                 
      00922A CD 8E 3B         [ 4] 3094         CALL     PACKS
                                   3095 ; uppercase TOKEN 
      00922D CD 86 99         [ 4] 3096         CALL    DUPP 
      009230 CD 8D 64         [ 4] 3097         CALL    COUNT 
      009233 CD 86 62         [ 4] 3098         CALL    TOR 
      009236 CD 85 34         [ 4] 3099         CALL    BRAN 
      009239 92 67                 3100         .word   UPPER2  
      00923B                       3101 UPPER:
      00923B CD 86 99         [ 4] 3102         CALL    DUPP 
      00923E CD 85 81         [ 4] 3103         CALL    CAT
      009241 CD 86 99         [ 4] 3104         CALL    DUPP 
      009244 CD 84 EF         [ 4] 3105         CALL   DOLIT
      009247 00 61                 3106         .word   'a' 
      009249 CD 84 EF         [ 4] 3107         CALL    DOLIT
      00924C 00 7B                 3108         .word   'z'+1 
      00924E CD 8A 16         [ 4] 3109         CALL   WITHI 
      009251 CD 85 18         [ 4] 3110         CALL   QBRAN
      009254 92 5E                 3111         .word  UPPER1  
      009256 CD 84 EF         [ 4] 3112         CALL    DOLIT 
      009259 00 DF                 3113         .word   0xDF 
      00925B CD 86 F6         [ 4] 3114         CALL    ANDD 
      00925E                       3115 UPPER1:
      00925E CD 86 C1         [ 4] 3116         CALL    OVER 
      009261 CD 85 70         [ 4] 3117         CALL    CSTOR          
      009264 CD 8C 32         [ 4] 3118         CALL    ONEP 
      009267                       3119 UPPER2: 
      009267 CD 85 03         [ 4] 3120         CALL    DONXT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



      00926A 92 3B                 3121         .word   UPPER  
      00926C CD 86 8F         [ 4] 3122         CALL    DROP  
      00926F 81               [ 4] 3123         RET 
                                   3124 .ENDIF 
                                   3125 
                                   3126 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3127 ;       TOKEN   ( -- a ; <string> )
                                   3128 ;       Parse a word from input stream
                                   3129 ;       and copy it to name dictionary.
                                   3130 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0011F0                       3131         _HEADER TOKEN,5,"TOKEN"
      009270 92 1C                    1         .word LINK 
                           0011F2     2         LINK=.
      009272 05                       3         .byte 5  
      009273 54 4F 4B 45 4E           4         .ascii "TOKEN"
      009278                          5         TOKEN:
      009278 CD 8C 91         [ 4] 3132         CALL     BLANK
      00927B CC 92 21         [ 2] 3133         JP     WORDD
                                   3134 
                                   3135 ;; Dictionary search
                                   3136 
                                   3137 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3138 ;       NAME>   ( na -- ca )
                                   3139 ;       Return a code address given
                                   3140 ;       a name address.
                                   3141 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0011FE                       3142         _HEADER NAMET,5,"NAME>"
      00927E 92 72                    1         .word LINK 
                           001200     2         LINK=.
      009280 05                       3         .byte 5  
      009281 4E 41 4D 45 3E           4         .ascii "NAME>"
      009286                          5         NAMET:
      009286 CD 8D 64         [ 4] 3143         CALL     COUNT
      009289 CD 84 EF         [ 4] 3144         CALL     DOLIT
      00928C 00 1F                 3145         .word      31
      00928E CD 86 F6         [ 4] 3146         CALL     ANDD
      009291 CC 88 BC         [ 2] 3147         JP     PLUS
                                   3148 
                                   3149 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3150 ;       SAME?   ( a a u -- a a f \ -0+ )
                                   3151 ;       Compare u cells in two
                                   3152 ;       strings. Return 0 if identical.
                                   3153 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001214                       3154         _HEADER SAMEQ,5,"SAME?"
      009294 92 80                    1         .word LINK 
                           001216     2         LINK=.
      009296 05                       3         .byte 5  
      009297 53 41 4D 45 3F           4         .ascii "SAME?"
      00929C                          5         SAMEQ:
      00929C CD 8C 3F         [ 4] 3155         CALL     ONEM
      00929F CD 86 62         [ 4] 3156         CALL     TOR
      0092A2 20 29            [ 2] 3157         JRA     SAME2
      0092A4 CD 86 C1         [ 4] 3158 SAME1:  CALL     OVER
      0092A7 CD 85 C5         [ 4] 3159         CALL     RAT
      0092AA CD 88 BC         [ 4] 3160         CALL     PLUS
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



      0092AD CD 85 81         [ 4] 3161         CALL     CAT
      0092B0 CD 86 C1         [ 4] 3162         CALL     OVER
      0092B3 CD 85 C5         [ 4] 3163         CALL     RAT
      0092B6 CD 88 BC         [ 4] 3164         CALL     PLUS
      0092B9 CD 85 81         [ 4] 3165         CALL     CAT
      0092BC CD 89 52         [ 4] 3166         CALL     SUBB
      0092BF CD 88 4C         [ 4] 3167         CALL     QDUP
      0092C2 CD 85 18         [ 4] 3168         CALL     QBRAN
      0092C5 92 CD                 3169         .word      SAME2
      0092C7 CD 85 B4         [ 4] 3170         CALL     RFROM
      0092CA CC 86 8F         [ 2] 3171         JP     DROP
      0092CD CD 85 03         [ 4] 3172 SAME2:  CALL     DONXT
      0092D0 92 A4                 3173         .word      SAME1
      0092D2 CC 8C 9E         [ 2] 3174         JP     ZERO
                                   3175 
                                   3176 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3177 ;       find    ( a va -- ca na | a F )
                                   3178 ;       Search vocabulary for string.
                                   3179 ;       Return ca and na if succeeded.
                                   3180 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001255                       3181         _HEADER FIND,4,"FIND"
      0092D5 92 96                    1         .word LINK 
                           001257     2         LINK=.
      0092D7 04                       3         .byte 4  
      0092D8 46 49 4E 44              4         .ascii "FIND"
      0092DC                          5         FIND:
      0092DC CD 86 A9         [ 4] 3182         CALL     SWAPP
      0092DF CD 86 99         [ 4] 3183         CALL     DUPP
      0092E2 CD 85 81         [ 4] 3184         CALL     CAT
      0092E5 CD 87 6E         [ 4] 3185         CALL     TEMP
      0092E8 CD 85 51         [ 4] 3186         CALL     STORE
      0092EB CD 86 99         [ 4] 3187         CALL     DUPP
      0092EE CD 85 63         [ 4] 3188         CALL     AT
      0092F1 CD 86 62         [ 4] 3189         CALL     TOR
      0092F4 CD 8C 07         [ 4] 3190         CALL     CELLP
      0092F7 CD 86 A9         [ 4] 3191         CALL     SWAPP
      0092FA CD 85 63         [ 4] 3192 FIND1:  CALL     AT
      0092FD CD 86 99         [ 4] 3193         CALL     DUPP
      009300 CD 85 18         [ 4] 3194         CALL     QBRAN
      009303 93 39                 3195         .word      FIND6
      009305 CD 86 99         [ 4] 3196         CALL     DUPP
      009308 CD 85 63         [ 4] 3197         CALL     AT
      00930B CD 84 EF         [ 4] 3198         CALL     DOLIT
      00930E 1F 7F                 3199         .word      MASKK
      009310 CD 86 F6         [ 4] 3200         CALL     ANDD
      009313 CD 85 C5         [ 4] 3201         CALL     RAT
      009316 CD 87 1F         [ 4] 3202         CALL     XORR
      009319 CD 85 18         [ 4] 3203         CALL     QBRAN
      00931C 93 28                 3204         .word      FIND2
      00931E CD 8C 07         [ 4] 3205         CALL     CELLP
      009321 CD 84 EF         [ 4] 3206         CALL     DOLIT
      009324 FF FF                 3207         .word     0xFFFF
      009326 20 0C            [ 2] 3208         JRA     FIND3
      009328 CD 8C 07         [ 4] 3209 FIND2:  CALL     CELLP
      00932B CD 87 6E         [ 4] 3210         CALL     TEMP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



      00932E CD 85 63         [ 4] 3211         CALL     AT
      009331 CD 92 9C         [ 4] 3212         CALL     SAMEQ
      009334 CD 85 34         [ 4] 3213 FIND3:  CALL     BRAN
      009337 93 48                 3214         .word      FIND4
      009339 CD 85 B4         [ 4] 3215 FIND6:  CALL     RFROM
      00933C CD 86 8F         [ 4] 3216         CALL     DROP
      00933F CD 86 A9         [ 4] 3217         CALL     SWAPP
      009342 CD 8C 16         [ 4] 3218         CALL     CELLM
      009345 CC 86 A9         [ 2] 3219         JP     SWAPP
      009348 CD 85 18         [ 4] 3220 FIND4:  CALL     QBRAN
      00934B 93 55                 3221         .word      FIND5
      00934D CD 8C 16         [ 4] 3222         CALL     CELLM
      009350 CD 8C 16         [ 4] 3223         CALL     CELLM
      009353 20 A5            [ 2] 3224         JRA     FIND1
      009355 CD 85 B4         [ 4] 3225 FIND5:  CALL     RFROM
      009358 CD 86 8F         [ 4] 3226         CALL     DROP
      00935B CD 86 A9         [ 4] 3227         CALL     SWAPP
      00935E CD 86 8F         [ 4] 3228         CALL     DROP
      009361 CD 8C 16         [ 4] 3229         CALL     CELLM
      009364 CD 86 99         [ 4] 3230         CALL     DUPP
      009367 CD 92 86         [ 4] 3231         CALL     NAMET
      00936A CC 86 A9         [ 2] 3232         JP     SWAPP
                                   3233 
                                   3234 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3235 ;       NAME?   ( a -- ca na | a F )
                                   3236 ;       Search vocabularies for a string.
                                   3237 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0012ED                       3238         _HEADER NAMEQ,5,"NAME?"
      00936D 92 D7                    1         .word LINK 
                           0012EF     2         LINK=.
      00936F 05                       3         .byte 5  
      009370 4E 41 4D 45 3F           4         .ascii "NAME?"
      009375                          5         NAMEQ:
      009375 CD 87 E2         [ 4] 3239         CALL   CNTXT
      009378 CC 92 DC         [ 2] 3240         JP     FIND
                                   3241 
                                   3242 ;; Terminal response
                                   3243 
                                   3244 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3245 ;       ^H      ( bot eot cur -- bot eot cur )
                                   3246 ;       Backup cursor by one character.
                                   3247 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0012FB                       3248         _HEADER BKSP,2,"^H"
      00937B 93 6F                    1         .word LINK 
                           0012FD     2         LINK=.
      00937D 02                       3         .byte 2  
      00937E 5E 48                    4         .ascii "^H"
      009380                          5         BKSP:
      009380 CD 86 62         [ 4] 3249         CALL     TOR
      009383 CD 86 C1         [ 4] 3250         CALL     OVER
      009386 CD 85 B4         [ 4] 3251         CALL     RFROM
      009389 CD 86 A9         [ 4] 3252         CALL     SWAPP
      00938C CD 86 C1         [ 4] 3253         CALL     OVER
      00938F CD 87 1F         [ 4] 3254         CALL     XORR
      009392 CD 85 18         [ 4] 3255         CALL     QBRAN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



      009395 93 B0                 3256         .word      BACK1
      009397 CD 84 EF         [ 4] 3257         CALL     DOLIT
      00939A 00 08                 3258         .word      BKSPP
      00939C CD 84 B6         [ 4] 3259         CALL     EMIT
      00939F CD 8C 3F         [ 4] 3260         CALL     ONEM
      0093A2 CD 8C 91         [ 4] 3261         CALL     BLANK
      0093A5 CD 84 B6         [ 4] 3262         CALL     EMIT
      0093A8 CD 84 EF         [ 4] 3263         CALL     DOLIT
      0093AB 00 08                 3264         .word      BKSPP
      0093AD CC 84 B6         [ 2] 3265         JP     EMIT
      0093B0 81               [ 4] 3266 BACK1:  RET
                                   3267 
                                   3268 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3269 ;       TAP    ( bot eot cur c -- bot eot cur )
                                   3270 ;       Accept and echo key stroke
                                   3271 ;       and bump cursor.
                                   3272 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001331                       3273         _HEADER TAP,3,"TAP"
      0093B1 93 7D                    1         .word LINK 
                           001333     2         LINK=.
      0093B3 03                       3         .byte 3  
      0093B4 54 41 50                 4         .ascii "TAP"
      0093B7                          5         TAP:
      0093B7 CD 86 99         [ 4] 3274         CALL     DUPP
      0093BA CD 84 B6         [ 4] 3275         CALL     EMIT
      0093BD CD 86 C1         [ 4] 3276         CALL     OVER
      0093C0 CD 85 70         [ 4] 3277         CALL     CSTOR
      0093C3 CC 8C 32         [ 2] 3278         JP     ONEP
                                   3279 
                                   3280 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3281 ;       kTAP    ( bot eot cur c -- bot eot cur )
                                   3282 ;       Process a key stroke,
                                   3283 ;       CR,LF or backspace.
                                   3284 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001346                       3285         _HEADER KTAP,4,"KTAP"
      0093C6 93 B3                    1         .word LINK 
                           001348     2         LINK=.
      0093C8 04                       3         .byte 4  
      0093C9 4B 54 41 50              4         .ascii "KTAP"
      0093CD                          5         KTAP:
      0093CD CD 86 99         [ 4] 3286         CALL     DUPP
      0093D0 CD 84 EF         [ 4] 3287         CALL     DOLIT
                           000001  3288 .if EOL_CR
      0093D3 00 0D                 3289         .word   CRR
                           000000  3290 .else ; EOL_LF 
                                   3291         .word   LF
                                   3292 .endif 
      0093D5 CD 87 1F         [ 4] 3293         CALL     XORR
      0093D8 CD 85 18         [ 4] 3294         CALL     QBRAN
      0093DB 93 F3                 3295         .word      KTAP2
      0093DD CD 84 EF         [ 4] 3296         CALL     DOLIT
      0093E0 00 08                 3297         .word      BKSPP
      0093E2 CD 87 1F         [ 4] 3298         CALL     XORR
      0093E5 CD 85 18         [ 4] 3299         CALL     QBRAN
      0093E8 93 F0                 3300         .word      KTAP1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



      0093EA CD 8C 91         [ 4] 3301         CALL     BLANK
      0093ED CC 93 B7         [ 2] 3302         JP     TAP
      0093F0 CC 93 80         [ 2] 3303 KTAP1:  JP     BKSP
      0093F3 CD 86 8F         [ 4] 3304 KTAP2:  CALL     DROP
      0093F6 CD 86 A9         [ 4] 3305         CALL     SWAPP
      0093F9 CD 86 8F         [ 4] 3306         CALL     DROP
      0093FC CC 86 99         [ 2] 3307         JP     DUPP
                                   3308 
                                   3309 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3310 ;       accept  ( b u -- b u )
                                   3311 ;       Accept characters to input
                                   3312 ;       buffer. Return with actual count.
                                   3313 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00137F                       3314         _HEADER ACCEP,6,"ACCEPT"
      0093FF 93 C8                    1         .word LINK 
                           001381     2         LINK=.
      009401 06                       3         .byte 6  
      009402 41 43 43 45 50 54        4         .ascii "ACCEPT"
      009408                          5         ACCEP:
      009408 CD 86 C1         [ 4] 3315         CALL     OVER
      00940B CD 88 BC         [ 4] 3316         CALL     PLUS
      00940E CD 86 C1         [ 4] 3317         CALL     OVER
      009411 CD 88 A7         [ 4] 3318 ACCP1:  CALL     DDUP
      009414 CD 87 1F         [ 4] 3319         CALL     XORR
      009417 CD 85 18         [ 4] 3320         CALL     QBRAN
      00941A 94 3C                 3321         .word      ACCP4
      00941C CD 8F 9C         [ 4] 3322         CALL     KEY
      00941F CD 86 99         [ 4] 3323         CALL     DUPP
      009422 CD 8C 91         [ 4] 3324         CALL     BLANK
      009425 CD 84 EF         [ 4] 3325         CALL     DOLIT
      009428 00 7F                 3326         .word      127
      00942A CD 8A 16         [ 4] 3327         CALL     WITHI
      00942D CD 85 18         [ 4] 3328         CALL     QBRAN
      009430 94 37                 3329         .word      ACCP2
      009432 CD 93 B7         [ 4] 3330         CALL     TAP
      009435 20 03            [ 2] 3331         JRA     ACCP3
      009437 CD 93 CD         [ 4] 3332 ACCP2:  CALL     KTAP
      00943A 20 D5            [ 2] 3333 ACCP3:  JRA     ACCP1
      00943C CD 86 8F         [ 4] 3334 ACCP4:  CALL     DROP
      00943F CD 86 C1         [ 4] 3335         CALL     OVER
      009442 CC 89 52         [ 2] 3336         JP     SUBB
                                   3337 
                                   3338 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3339 ;       QUERY   ( -- )
                                   3340 ;       Accept input stream to
                                   3341 ;       terminal input buffer.
                                   3342 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0013C5                       3343         _HEADER QUERY,5,"QUERY"
      009445 94 01                    1         .word LINK 
                           0013C7     2         LINK=.
      009447 05                       3         .byte 5  
      009448 51 55 45 52 59           4         .ascii "QUERY"
      00944D                          5         QUERY:
      00944D CD 8D 9D         [ 4] 3344         CALL     TIB
      009450 CD 84 EF         [ 4] 3345         CALL     DOLIT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



      009453 00 50                 3346         .word      80
      009455 CD 94 08         [ 4] 3347         CALL     ACCEP
      009458 CD 87 8D         [ 4] 3348         CALL     NTIB
      00945B CD 85 51         [ 4] 3349         CALL     STORE
      00945E CD 86 8F         [ 4] 3350         CALL     DROP
      009461 CD 8C 9E         [ 4] 3351         CALL     ZERO
      009464 CD 87 7D         [ 4] 3352         CALL     INN
      009467 CC 85 51         [ 2] 3353         JP     STORE
                                   3354 
                                   3355 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3356 ;       ABORT   ( -- )
                                   3357 ;       Reset data stack and
                                   3358 ;       jump to QUIT.
                                   3359 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0013EA                       3360         _HEADER ABORT,5,"ABORT"
      00946A 94 47                    1         .word LINK 
                           0013EC     2         LINK=.
      00946C 05                       3         .byte 5  
      00946D 41 42 4F 52 54           4         .ascii "ABORT"
      009472                          5         ABORT:
      009472 CD 95 69         [ 4] 3361         CALL     PRESE
      009475 CC 95 86         [ 2] 3362         JP     QUIT
                                   3363 
                                   3364 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3365 ;       abort"  ( f -- )
                                   3366 ;       Run time routine of ABORT".
                                   3367 ;       Abort with a message.
                                   3368 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0013F8                       3369         _HEADER ABORQ,COMPO+6,'ABORT"'
      009478 94 6C                    1         .word LINK 
                           0013FA     2         LINK=.
      00947A 46                       3         .byte COMPO+6  
      00947B 41 42 4F 52 54 22        4         .ascii 'ABORT"'
      009481                          5         ABORQ:
      009481 CD 85 18         [ 4] 3370         CALL     QBRAN
      009484 94 A0                 3371         .word      ABOR2   ;text flag
      009486 CD 90 26         [ 4] 3372         CALL     DOSTR
      009489 CD 8F D4         [ 4] 3373 ABOR1:  CALL     SPACE
      00948C CD 8D 64         [ 4] 3374         CALL     COUNT
      00948F CD 8F FE         [ 4] 3375         CALL     TYPES
      009492 CD 84 EF         [ 4] 3376         CALL     DOLIT
      009495 00 3F                 3377         .word     63 ; "?"
      009497 CD 84 B6         [ 4] 3378         CALL     EMIT
      00949A CD 90 16         [ 4] 3379         CALL     CR
      00949D CC 94 72         [ 2] 3380         JP     ABORT   ;pass error string
      0094A0 CD 90 26         [ 4] 3381 ABOR2:  CALL     DOSTR
      0094A3 CC 86 8F         [ 2] 3382         JP     DROP
                                   3383 
                                   3384 ;; The text interpreter
                                   3385 
                                   3386 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3387 ;       $INTERPRET      ( a -- )
                                   3388 ;       Interpret a word. If failed,
                                   3389 ;       try to convert it to an integer.
                                   3390 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



      001426                       3391         _HEADER INTER,10,"$INTERPRET"
      0094A6 94 7A                    1         .word LINK 
                           001428     2         LINK=.
      0094A8 0A                       3         .byte 10  
      0094A9 24 49 4E 54 45 52 50     4         .ascii "$INTERPRET"
             52 45 54
      0094B3                          5         INTER:
      0094B3 CD 93 75         [ 4] 3392         CALL     NAMEQ
      0094B6 CD 88 4C         [ 4] 3393         CALL     QDUP    ;?defined
      0094B9 CD 85 18         [ 4] 3394         CALL     QBRAN
      0094BC 94 DD                 3395         .word      INTE1
      0094BE CD 85 63         [ 4] 3396         CALL     AT
      0094C1 CD 84 EF         [ 4] 3397         CALL     DOLIT
      0094C4 40 00                 3398 	.word       0x4000	; COMPO*256
      0094C6 CD 86 F6         [ 4] 3399         CALL     ANDD    ;?compile only lexicon bits
      0094C9 CD 94 81         [ 4] 3400         CALL     ABORQ
      0094CC 0D                    3401         .byte      13
      0094CD 20 63 6F 6D 70 69 6C  3402         .ascii     " compile only"
             65 20 6F 6E 6C 79
      0094DA CC 85 44         [ 2] 3403         JP     EXECU
      0094DD CD A6 1D         [ 4] 3404 INTE1:  CALL     NUMBQ   ;convert a number
      0094E0 CD 85 18         [ 4] 3405         CALL     QBRAN
      0094E3 94 89                 3406         .word    ABOR1
      0094E5 81               [ 4] 3407         RET
                                   3408 
                                   3409 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3410 ;       [       ( -- )
                                   3411 ;       Start  text interpreter.
                                   3412 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001466                       3413         _HEADER LBRAC,IMEDD+1,"["
      0094E6 94 A8                    1         .word LINK 
                           001468     2         LINK=.
      0094E8 81                       3         .byte IMEDD+1  
      0094E9 5B                       4         .ascii "["
      0094EA                          5         LBRAC:
      0094EA CD 84 EF         [ 4] 3414         CALL   DOLIT
      0094ED 94 B3                 3415         .word  INTER
      0094EF CD 87 C0         [ 4] 3416         CALL   TEVAL
      0094F2 CC 85 51         [ 2] 3417         JP     STORE
                                   3418 
                                   3419 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3420 ;       .OK     ( -- )
                                   3421 ;       Display 'ok' while interpreting.
                                   3422 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001475                       3423         _HEADER DOTOK,3,".OK"
      0094F5 94 E8                    1         .word LINK 
                           001477     2         LINK=.
      0094F7 03                       3         .byte 3  
      0094F8 2E 4F 4B                 4         .ascii ".OK"
      0094FB                          5         DOTOK:
      0094FB CD 84 EF         [ 4] 3424         CALL     DOLIT
      0094FE 94 B3                 3425         .word      INTER
      009500 CD 87 C0         [ 4] 3426         CALL     TEVAL
      009503 CD 85 63         [ 4] 3427         CALL     AT
      009506 CD 89 7A         [ 4] 3428         CALL     EQUAL
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



      009509 CD 85 18         [ 4] 3429         CALL     QBRAN
      00950C 95 15                 3430         .word      DOTO1
      00950E CD 90 43         [ 4] 3431         CALL     DOTQP
      009511 03                    3432         .byte      3
      009512 20 6F 6B              3433         .ascii     " ok"
      009515 CC 90 16         [ 2] 3434 DOTO1:  JP     CR
                                   3435 
                                   3436 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3437 ;       ?STACK  ( -- )
                                   3438 ;       Abort if stack underflows.
                                   3439 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001498                       3440         _HEADER QSTAC,6,"?STACK"
      009518 94 F7                    1         .word LINK 
                           00149A     2         LINK=.
      00951A 06                       3         .byte 6  
      00951B 3F 53 54 41 43 4B        4         .ascii "?STACK"
      009521                          5         QSTAC:
      009521 CD 8C E0         [ 4] 3441         CALL     DEPTH
      009524 CD 86 D0         [ 4] 3442         CALL     ZLESS   ;check only for underflow
      009527 CD 94 81         [ 4] 3443         CALL     ABORQ
      00952A 0B                    3444         .byte      11
      00952B 20 75 6E 64 65 72 66  3445         .ascii     " underflow "
             6C 6F 77 20
      009536 81               [ 4] 3446         RET
                                   3447 
                                   3448 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3449 ;       EVAL    ( -- )
                                   3450 ;       Interpret  input stream.
                                   3451 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0014B7                       3452         _HEADER EVAL,4,"EVAL"
      009537 95 1A                    1         .word LINK 
                           0014B9     2         LINK=.
      009539 04                       3         .byte 4  
      00953A 45 56 41 4C              4         .ascii "EVAL"
      00953E                          5         EVAL:
      00953E CD 92 78         [ 4] 3453 EVAL1:  CALL     TOKEN
      009541 CD 86 99         [ 4] 3454         CALL     DUPP
      009544 CD 85 81         [ 4] 3455         CALL     CAT     ;?input stream empty
      009547 CD 85 18         [ 4] 3456         CALL     QBRAN
      00954A 95 5A                 3457         .word    EVAL2
      00954C CD 87 C0         [ 4] 3458         CALL     TEVAL
      00954F CD 8D B1         [ 4] 3459         CALL     ATEXE
      009552 CD 95 21         [ 4] 3460         CALL     QSTAC   ;evaluate input, check stack
      009555 CD 85 34         [ 4] 3461         CALL     BRAN
      009558 95 3E                 3462         .word    EVAL1
      00955A CD 86 8F         [ 4] 3463 EVAL2:  CALL     DROP
      00955D CC 94 FB         [ 2] 3464         JP       DOTOK
                                   3465 
                                   3466 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3467 ;       PRESET  ( -- )
                                   3468 ;       Reset data stack pointer and
                                   3469 ;       terminal input buffer.
                                   3470 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0014E0                       3471         _HEADER PRESE,6,"PRESET"
      009560 95 39                    1         .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



                           0014E2     2         LINK=.
      009562 06                       3         .byte 6  
      009563 50 52 45 53 45 54        4         .ascii "PRESET"
      009569                          5         PRESE:
      009569 CD 84 EF         [ 4] 3472         CALL     DOLIT
      00956C 16 80                 3473         .word      SPP
      00956E CD 86 86         [ 4] 3474         CALL     SPSTO
      009571 CD 84 EF         [ 4] 3475         CALL     DOLIT
      009574 17 00                 3476         .word      TIBB
      009576 CD 87 8D         [ 4] 3477         CALL     NTIB
      009579 CD 8C 07         [ 4] 3478         CALL     CELLP
      00957C CC 85 51         [ 2] 3479         JP     STORE
                                   3480 
                                   3481 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3482 ;       QUIT    ( -- )
                                   3483 ;       Reset return stack pointer
                                   3484 ;       and start text interpreter.
                                   3485 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0014FF                       3486         _HEADER QUIT,4,"QUIT"
      00957F 95 62                    1         .word LINK 
                           001501     2         LINK=.
      009581 04                       3         .byte 4  
      009582 51 55 49 54              4         .ascii "QUIT"
      009586                          5         QUIT:
      009586 CD 84 EF         [ 4] 3487         CALL     DOLIT
      009589 17 FF                 3488         .word      RPP
      00958B CD 85 9E         [ 4] 3489         CALL     RPSTO   ;reset return stack pointer
      00958E CD 94 EA         [ 4] 3490 QUIT1:  CALL     LBRAC   ;start interpretation
      009591 CD 94 4D         [ 4] 3491 QUIT2:  CALL     QUERY   ;get input
      009594 CD 95 3E         [ 4] 3492         CALL     EVAL
      009597 20 F8            [ 2] 3493         JRA     QUIT2   ;continue till error
                                   3494 
                                   3495 ;; The compiler
                                   3496 
                                   3497 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3498 ;       '       ( -- ca )
                                   3499 ;       Search vocabularies for
                                   3500 ;       next word in input stream.
                                   3501 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001519                       3502         _HEADER TICK,1,"'"
      009599 95 81                    1         .word LINK 
                           00151B     2         LINK=.
      00959B 01                       3         .byte 1  
      00959C 27                       4         .ascii "'"
      00959D                          5         TICK:
      00959D CD 92 78         [ 4] 3503         CALL     TOKEN
      0095A0 CD 93 75         [ 4] 3504         CALL     NAMEQ   ;?defined
      0095A3 CD 85 18         [ 4] 3505         CALL     QBRAN
      0095A6 94 89                 3506         .word      ABOR1
      0095A8 81               [ 4] 3507         RET     ;yes, push code address
                                   3508 
                                   3509 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3510 ;       ALLOT   ( n -- )
                                   3511 ;       Allocate n bytes to RAM 
                                   3512 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



      001529                       3513         _HEADER ALLOT,5,"ALLOT"
      0095A9 95 9B                    1         .word LINK 
                           00152B     2         LINK=.
      0095AB 05                       3         .byte 5  
      0095AC 41 4C 4C 4F 54           4         .ascii "ALLOT"
      0095B1                          5         ALLOT:
      0095B1 CD 87 F0         [ 4] 3514         CALL     VPP
                                   3515 ; must update APP_VP each time VP is modidied
      0095B4 CD 8D 0E         [ 4] 3516         call PSTOR 
      0095B7 CC 9D 69         [ 2] 3517         jp UPDATVP 
                                   3518 
                                   3519 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3520 ;       ,       ( w -- )
                                   3521 ;         Compile an integer into
                                   3522 ;         variable space.
                                   3523 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00153A                       3524         _HEADER COMMA,1,^/"\,"/
      0095BA 95 AB                    1         .word LINK 
                           00153C     2         LINK=.
      0095BC 01                       3         .byte 1  
      0095BD 5C 2C                    4         .ascii "\,"
      0095BF                          5         COMMA:
      0095BF CD 8D 7B         [ 4] 3525         CALL     HERE
      0095C2 CD 86 99         [ 4] 3526         CALL     DUPP
      0095C5 CD 8C 07         [ 4] 3527         CALL     CELLP   ;cell boundary
      0095C8 CD 87 F0         [ 4] 3528         CALL     VPP
      0095CB CD 85 51         [ 4] 3529         CALL     STORE
      0095CE CC 85 51         [ 2] 3530         JP     STORE
                                   3531 
                                   3532 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3533 ;       C,      ( c -- )
                                   3534 ;       Compile a byte into
                                   3535 ;       variables space.
                                   3536 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001551                       3537         _HEADER CCOMMA,2,^/"C,"/
      0095D1 95 BC                    1         .word LINK 
                           001553     2         LINK=.
      0095D3 02                       3         .byte 2  
      0095D4 43 2C                    4         .ascii "C,"
      0095D6                          5         CCOMMA:
      0095D6 CD 8D 7B         [ 4] 3538         CALL     HERE
      0095D9 CD 86 99         [ 4] 3539         CALL     DUPP
      0095DC CD 8C 32         [ 4] 3540         CALL     ONEP
      0095DF CD 87 F0         [ 4] 3541         CALL     VPP
      0095E2 CD 85 51         [ 4] 3542         CALL     STORE
      0095E5 CC 85 70         [ 2] 3543         JP     CSTOR
                                   3544 
                                   3545 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3546 ;       [COMPILE]       ( -- ; <string> )
                                   3547 ;       Compile next immediate
                                   3548 ;       word into code dictionary.
                                   3549 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001568                       3550         _HEADER BCOMP,IMEDD+9,"[COMPILE]"
      0095E8 95 D3                    1         .word LINK 
                           00156A     2         LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



      0095EA 89                       3         .byte IMEDD+9  
      0095EB 5B 43 4F 4D 50 49 4C     4         .ascii "[COMPILE]"
             45 5D
      0095F4                          5         BCOMP:
      0095F4 CD 95 9D         [ 4] 3551         CALL     TICK
      0095F7 CC 98 C9         [ 2] 3552         JP     JSRC
                                   3553 
                                   3554 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3555 ;       COMPILE ( -- )
                                   3556 ;       Compile next jsr in
                                   3557 ;       colon list to code dictionary.
                                   3558 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00157A                       3559         _HEADER COMPI,COMPO+7,"COMPILE"
      0095FA 95 EA                    1         .word LINK 
                           00157C     2         LINK=.
      0095FC 47                       3         .byte COMPO+7  
      0095FD 43 4F 4D 50 49 4C 45     4         .ascii "COMPILE"
      009604                          5         COMPI:
      009604 CD 85 B4         [ 4] 3560         CALL     RFROM
      009607 CD 86 99         [ 4] 3561         CALL     DUPP
      00960A CD 85 63         [ 4] 3562         CALL     AT
      00960D CD 98 C9         [ 4] 3563         CALL     JSRC    ;compile subroutine
      009610 CD 8C 07         [ 4] 3564         CALL     CELLP
      009613 90 93            [ 1] 3565         ldw y,x 
      009615 90 FE            [ 2] 3566         ldw y,(y)
      009617 1C 00 02         [ 2] 3567         addw x,#CELLL 
      00961A 90 FC            [ 2] 3568         jp (y)
                                   3569 
                                   3570 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3571 ;       LITERAL ( w -- )
                                   3572 ;       Compile tos to dictionary
                                   3573 ;       as an integer literal.
                                   3574 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00159C                       3575         _HEADER LITER,COMPO+IMEDD+7,"LITERAL"
      00961C 95 FC                    1         .word LINK 
                           00159E     2         LINK=.
      00961E C7                       3         .byte COMPO+IMEDD+7  
      00961F 4C 49 54 45 52 41 4C     4         .ascii "LITERAL"
      009626                          5         LITER:
      009626 CD 96 04         [ 4] 3576         CALL     COMPI
      009629 84 EF                 3577         .word DOLIT 
      00962B CC 95 BF         [ 2] 3578         JP     COMMA
                                   3579 
                                   3580 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3581 ;       $,"     ( -- )
                                   3582 ;       Compile a literal string
                                   3583 ;       up to next " .
                                   3584 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3585 ;        _HEADER STRCQ,3,^/'$,"'/
      00962E                       3586 STRCQ:
      00962E CD 84 EF         [ 4] 3587         CALL     DOLIT
      009631 00 22                 3588         .word     34	; "
      009633 CD 91 B7         [ 4] 3589         CALL     PARSE
      009636 CD 8D 7B         [ 4] 3590         CALL     HERE
      009639 CD 8E 3B         [ 4] 3591         CALL     PACKS   ;string to code dictionary
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



      00963C CD 8D 64         [ 4] 3592         CALL     COUNT
      00963F CD 88 BC         [ 4] 3593         CALL     PLUS    ;calculate aligned end of string
      009642 CD 87 F0         [ 4] 3594         CALL     VPP
      009645 CC 85 51         [ 2] 3595         JP     STORE
                                   3596 
                                   3597 ;; Structures
                                   3598 
                                   3599 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3600 ;       FOR     ( -- a )
                                   3601 ;       Start a FOR-NEXT loop
                                   3602 ;       structure in a colon definition.
                                   3603 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0015C8                       3604         _HEADER FOR,IMEDD+3,"FOR"
      009648 96 1E                    1         .word LINK 
                           0015CA     2         LINK=.
      00964A 83                       3         .byte IMEDD+3  
      00964B 46 4F 52                 4         .ascii "FOR"
      00964E                          5         FOR:
      00964E CD 96 04         [ 4] 3605         CALL     COMPI
      009651 86 62                 3606         .word TOR 
      009653 CC 8D 7B         [ 2] 3607         JP     HERE
                                   3608 
                                   3609 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3610 ;       NEXT    ( a -- )
                                   3611 ;       Terminate a FOR-NEXT loop.
                                   3612 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0015D6                       3613         _HEADER NEXT,IMEDD+4,"NEXT"
      009656 96 4A                    1         .word LINK 
                           0015D8     2         LINK=.
      009658 84                       3         .byte IMEDD+4  
      009659 4E 45 58 54              4         .ascii "NEXT"
      00965D                          5         NEXT:
      00965D CD 96 04         [ 4] 3614         CALL     COMPI
      009660 85 03                 3615         .word DONXT 
      009662 CD 88 3C         [ 4] 3616         call ADRADJ
      009665 CC 95 BF         [ 2] 3617         JP     COMMA
                                   3618 
                                   3619 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3620 ;       I ( -- n )
                                   3621 ;       stack COUNTER
                                   3622 ;       of innermost FOR-NEXT  
                                   3623 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0015E8                       3624         _HEADER IFETCH,1,"I"
      009668 96 58                    1         .word LINK 
                           0015EA     2         LINK=.
      00966A 01                       3         .byte 1  
      00966B 49                       4         .ascii "I"
      00966C                          5         IFETCH:
      00966C 1D 00 02         [ 2] 3625         subw x,#CELLL 
      00966F 16 03            [ 2] 3626         ldw y,(3,sp)
      009671 FF               [ 2] 3627         ldw (x),y 
      009672 81               [ 4] 3628         ret 
                                   3629 
                                   3630 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3631 ;       J ( -- n )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



                                   3632 ;   stack COUNTER
                                   3633 ;   of outer FOR-NEXT  
                                   3634 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0015F3                       3635         _HEADER JFETCH,1,"J"
      009673 96 6A                    1         .word LINK 
                           0015F5     2         LINK=.
      009675 01                       3         .byte 1  
      009676 4A                       4         .ascii "J"
      009677                          5         JFETCH:
      009677 1D 00 02         [ 2] 3636         SUBW X,#CELLL 
      00967A 16 05            [ 2] 3637         LDW Y,(5,SP)
      00967C FF               [ 2] 3638         LDW (X),Y 
      00967D 81               [ 4] 3639         RET 
                                   3640 
                                   3641 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3642 ;       BEGIN   ( -- a )
                                   3643 ;       Start an infinite or
                                   3644 ;       indefinite loop structure.
                                   3645 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0015FE                       3646         _HEADER BEGIN,IMEDD+5,"BEGIN"
      00967E 96 75                    1         .word LINK 
                           001600     2         LINK=.
      009680 85                       3         .byte IMEDD+5  
      009681 42 45 47 49 4E           4         .ascii "BEGIN"
      009686                          5         BEGIN:
      009686 CC 8D 7B         [ 2] 3647         JP     HERE
                                   3648 
                                   3649 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3650 ;       UNTIL   ( a -- )
                                   3651 ;       Terminate a BEGIN-UNTIL
                                   3652 ;       indefinite loop structure.
                                   3653 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001609                       3654         _HEADER UNTIL,IMEDD+5,"UNTIL"
      009689 96 80                    1         .word LINK 
                           00160B     2         LINK=.
      00968B 85                       3         .byte IMEDD+5  
      00968C 55 4E 54 49 4C           4         .ascii "UNTIL"
      009691                          5         UNTIL:
      009691 CD 96 04         [ 4] 3655         CALL     COMPI
      009694 85 18                 3656         .word    QBRAN 
      009696 CD 88 3C         [ 4] 3657         call ADRADJ
      009699 CC 95 BF         [ 2] 3658         JP     COMMA
                                   3659 
                                   3660 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3661 ;       AGAIN   ( a -- )
                                   3662 ;       Terminate a BEGIN-AGAIN
                                   3663 ;       infinite loop structure.
                                   3664 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00161C                       3665         _HEADER AGAIN,IMEDD+5,"AGAIN"
      00969C 96 8B                    1         .word LINK 
                           00161E     2         LINK=.
      00969E 85                       3         .byte IMEDD+5  
      00969F 41 47 41 49 4E           4         .ascii "AGAIN"
      0096A4                          5         AGAIN:
      0096A4 CD 96 04         [ 4] 3666         CALL     COMPI
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



      0096A7 85 34                 3667         .word BRAN
      0096A9 CD 88 3C         [ 4] 3668         call ADRADJ 
      0096AC CC 95 BF         [ 2] 3669         JP     COMMA
                                   3670 
                                   3671 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3672 ;       IF      ( -- A )
                                   3673 ;       Begin a conditional branch.
                                   3674 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00162F                       3675         _HEADER IFF,IMEDD+2,"IF"
      0096AF 96 9E                    1         .word LINK 
                           001631     2         LINK=.
      0096B1 82                       3         .byte IMEDD+2  
      0096B2 49 46                    4         .ascii "IF"
      0096B4                          5         IFF:
      0096B4 CD 96 04         [ 4] 3676         CALL     COMPI
      0096B7 85 18                 3677         .word QBRAN
      0096B9 CD 8D 7B         [ 4] 3678         CALL     HERE
      0096BC CD 8C 9E         [ 4] 3679         CALL     ZERO
      0096BF CC 95 BF         [ 2] 3680         JP     COMMA
                                   3681 
                                   3682 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3683 ;       THEN        ( A -- )
                                   3684 ;       Terminate a conditional 
                                   3685 ;       branch structure.
                                   3686 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001642                       3687         _HEADER THENN,IMEDD+4,"THEN"
      0096C2 96 B1                    1         .word LINK 
                           001644     2         LINK=.
      0096C4 84                       3         .byte IMEDD+4  
      0096C5 54 48 45 4E              4         .ascii "THEN"
      0096C9                          5         THENN:
      0096C9 CD 8D 7B         [ 4] 3688         CALL     HERE
      0096CC CD 88 3C         [ 4] 3689         call ADRADJ 
      0096CF CD 86 A9         [ 4] 3690         CALL     SWAPP
      0096D2 CC 85 51         [ 2] 3691         JP     STORE
                                   3692 
                                   3693 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3694 ;       ELSE        ( A -- A )
                                   3695 ;       Start the false clause in 
                                   3696 ;       an IF-ELSE-THEN structure.
                                   3697 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001655                       3698         _HEADER ELSEE,IMEDD+4,"ELSE"
      0096D5 96 C4                    1         .word LINK 
                           001657     2         LINK=.
      0096D7 84                       3         .byte IMEDD+4  
      0096D8 45 4C 53 45              4         .ascii "ELSE"
      0096DC                          5         ELSEE:
      0096DC CD 96 04         [ 4] 3699         CALL     COMPI
      0096DF 85 34                 3700         .word BRAN
      0096E1 CD 8D 7B         [ 4] 3701         CALL     HERE
      0096E4 CD 8C 9E         [ 4] 3702         CALL     ZERO
      0096E7 CD 95 BF         [ 4] 3703         CALL     COMMA
      0096EA CD 86 A9         [ 4] 3704         CALL     SWAPP
      0096ED CD 8D 7B         [ 4] 3705         CALL     HERE
      0096F0 CD 88 3C         [ 4] 3706         call ADRADJ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



      0096F3 CD 86 A9         [ 4] 3707         CALL     SWAPP
      0096F6 CC 85 51         [ 2] 3708         JP     STORE
                                   3709 
                                   3710 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3711 ;       AHEAD       ( -- A )
                                   3712 ;       Compile a forward branch
                                   3713 ;       instruction.
                                   3714 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001679                       3715         _HEADER AHEAD,IMEDD+5,"AHEAD"
      0096F9 96 D7                    1         .word LINK 
                           00167B     2         LINK=.
      0096FB 85                       3         .byte IMEDD+5  
      0096FC 41 48 45 41 44           4         .ascii "AHEAD"
      009701                          5         AHEAD:
      009701 CD 96 04         [ 4] 3716         CALL     COMPI
      009704 85 34                 3717         .word BRAN
      009706 CD 8D 7B         [ 4] 3718         CALL     HERE
      009709 CD 8C 9E         [ 4] 3719         CALL     ZERO
      00970C CC 95 BF         [ 2] 3720         JP     COMMA
                                   3721 
                                   3722 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3723 ;       WHILE       ( a -- A a )
                                   3724 ;       Conditional branch out of a 
                                   3725 ;       BEGIN-WHILE-REPEAT loop.
                                   3726 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00168F                       3727         _HEADER WHILE,IMEDD+5,"WHILE"
      00970F 96 FB                    1         .word LINK 
                           001691     2         LINK=.
      009711 85                       3         .byte IMEDD+5  
      009712 57 48 49 4C 45           4         .ascii "WHILE"
      009717                          5         WHILE:
      009717 CD 96 04         [ 4] 3728         CALL     COMPI
      00971A 85 18                 3729         .word QBRAN
      00971C CD 8D 7B         [ 4] 3730         CALL     HERE
      00971F CD 8C 9E         [ 4] 3731         CALL     ZERO
      009722 CD 95 BF         [ 4] 3732         CALL     COMMA
      009725 CC 86 A9         [ 2] 3733         JP     SWAPP
                                   3734 
                                   3735 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3736 ;       REPEAT      ( A a -- )
                                   3737 ;       Terminate a BEGIN-WHILE-REPEAT 
                                   3738 ;       indefinite loop.
                                   3739 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0016A8                       3740         _HEADER REPEA,IMEDD+6,"REPEAT"
      009728 97 11                    1         .word LINK 
                           0016AA     2         LINK=.
      00972A 86                       3         .byte IMEDD+6  
      00972B 52 45 50 45 41 54        4         .ascii "REPEAT"
      009731                          5         REPEA:
      009731 CD 96 04         [ 4] 3741         CALL     COMPI
      009734 85 34                 3742         .word BRAN
      009736 CD 88 3C         [ 4] 3743         call ADRADJ 
      009739 CD 95 BF         [ 4] 3744         CALL     COMMA
      00973C CD 8D 7B         [ 4] 3745         CALL     HERE
      00973F CD 88 3C         [ 4] 3746         call ADRADJ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



      009742 CD 86 A9         [ 4] 3747         CALL     SWAPP
      009745 CC 85 51         [ 2] 3748         JP     STORE
                                   3749 
                                   3750 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3751 ;       AFT         ( a -- a A )
                                   3752 ;       Jump to THEN in a FOR-AFT-THEN-NEXT 
                                   3753 ;       loop the first time through.
                                   3754 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0016C8                       3755         _HEADER AFT,IMEDD+3,"AFT"
      009748 97 2A                    1         .word LINK 
                           0016CA     2         LINK=.
      00974A 83                       3         .byte IMEDD+3  
      00974B 41 46 54                 4         .ascii "AFT"
      00974E                          5         AFT:
      00974E CD 86 8F         [ 4] 3756         CALL     DROP
      009751 CD 97 01         [ 4] 3757         CALL     AHEAD
      009754 CD 8D 7B         [ 4] 3758         CALL     HERE
      009757 CC 86 A9         [ 2] 3759         JP     SWAPP
                                   3760 
                                   3761 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3762 ;       ABORT"      ( -- ; <string> )
                                   3763 ;       Conditional abort with an error message.
                                   3764 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0016DA                       3765         _HEADER ABRTQ,IMEDD+6,'ABORT"'
      00975A 97 4A                    1         .word LINK 
                           0016DC     2         LINK=.
      00975C 86                       3         .byte IMEDD+6  
      00975D 41 42 4F 52 54 22        4         .ascii 'ABORT"'
      009763                          5         ABRTQ:
      009763 CD 96 04         [ 4] 3766         CALL     COMPI
      009766 94 81                 3767         .word ABORQ
      009768 CC 96 2E         [ 2] 3768         JP     STRCQ
                                   3769 
                                   3770 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3771 ;       $"     ( -- ; <string> )
                                   3772 ;       Compile an inline string literal.
                                   3773 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0016EB                       3774         _HEADER STRQ,IMEDD+2,'$"'
      00976B 97 5C                    1         .word LINK 
                           0016ED     2         LINK=.
      00976D 82                       3         .byte IMEDD+2  
      00976E 24 22                    4         .ascii '$"'
      009770                          5         STRQ:
      009770 CD 96 04         [ 4] 3775         CALL     COMPI
      009773 90 3F                 3776         .word STRQP 
      009775 CC 96 2E         [ 2] 3777         JP     STRCQ
                                   3778 
                                   3779 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3780 ;       ."          ( -- ; <string> )
                                   3781 ;       Compile an inline string literal 
                                   3782 ;       to be typed out at run time.
                                   3783 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0016F8                       3784         _HEADER DOTQ,IMEDD+2,'."'
      009778 97 6D                    1         .word LINK 
                           0016FA     2         LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



      00977A 82                       3         .byte IMEDD+2  
      00977B 2E 22                    4         .ascii '."'
      00977D                          5         DOTQ:
      00977D CD 96 04         [ 4] 3785         CALL     COMPI
      009780 90 43                 3786         .word DOTQP 
      009782 CC 96 2E         [ 2] 3787         JP     STRCQ
                                   3788 
                                   3789 ;; Name compiler
                                   3790 
                                   3791 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3792 ;       ?UNIQUE ( a -- a )
                                   3793 ;       Display a warning message
                                   3794 ;       if word already exists.
                                   3795 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001705                       3796         _HEADER UNIQU,7,"?UNIQUE"
      009785 97 7A                    1         .word LINK 
                           001707     2         LINK=.
      009787 07                       3         .byte 7  
      009788 3F 55 4E 49 51 55 45     4         .ascii "?UNIQUE"
      00978F                          5         UNIQU:
      00978F CD 86 99         [ 4] 3797         CALL     DUPP
      009792 CD 93 75         [ 4] 3798         CALL     NAMEQ   ;?name exists
      009795 CD 85 18         [ 4] 3799         CALL     QBRAN
      009798 97 AE                 3800         .word      UNIQ1
      00979A CD 90 43         [ 4] 3801         CALL     DOTQP   ;redef are OK
      00979D 07                    3802         .byte       7
      00979E 20 72 65 44 65 66 20  3803         .ascii     " reDef "       
      0097A5 CD 86 C1         [ 4] 3804         CALL     OVER
      0097A8 CD 8D 64         [ 4] 3805         CALL     COUNT
      0097AB CD 8F FE         [ 4] 3806         CALL     TYPES   ;just in case
      0097AE CC 86 8F         [ 2] 3807 UNIQ1:  JP     DROP
                                   3808 
                                   3809 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3810 ;       $,n     ( na -- )
                                   3811 ;       Build a new dictionary name
                                   3812 ;       using string at na.
                                   3813 ; compile dans l'espace des variables 
                                   3814 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3815 ;        _HEADER SNAME,3,^/"$,n"/
      0097B1                       3816 SNAME: 
      0097B1 CD 86 99         [ 4] 3817         CALL     DUPP
      0097B4 CD 85 81         [ 4] 3818         CALL     CAT     ;?null input
      0097B7 CD 85 18         [ 4] 3819         CALL     QBRAN
      0097BA 97 E7                 3820         .word      PNAM1
      0097BC CD 97 8F         [ 4] 3821         CALL     UNIQU   ;?redefinition
      0097BF CD 86 99         [ 4] 3822         CALL     DUPP
      0097C2 CD 8D 64         [ 4] 3823         CALL     COUNT
      0097C5 CD 88 BC         [ 4] 3824         CALL     PLUS
      0097C8 CD 87 F0         [ 4] 3825         CALL     VPP
      0097CB CD 85 51         [ 4] 3826         CALL     STORE
      0097CE CD 86 99         [ 4] 3827         CALL     DUPP
      0097D1 CD 88 0E         [ 4] 3828         CALL     LAST
      0097D4 CD 85 51         [ 4] 3829         CALL     STORE   ;save na for vocabulary link
      0097D7 CD 8C 16         [ 4] 3830         CALL     CELLM   ;link address
      0097DA CD 87 E2         [ 4] 3831         CALL     CNTXT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



      0097DD CD 85 63         [ 4] 3832         CALL     AT
      0097E0 CD 86 A9         [ 4] 3833         CALL     SWAPP
      0097E3 CD 85 51         [ 4] 3834         CALL     STORE
      0097E6 81               [ 4] 3835         RET     ;save code pointer
      0097E7 CD 90 3F         [ 4] 3836 PNAM1:  CALL     STRQP
      0097EA 05                    3837         .byte      5
      0097EB 20 6E 61 6D 65        3838         .ascii     " name" ;null input
      0097F0 CC 94 89         [ 2] 3839         JP     ABOR1
                                   3840 
                                   3841 ;; FORTH compiler
                                   3842 
                                   3843 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3844 ;       $COMPILE        ( a -- )
                                   3845 ;       Compile next word to
                                   3846 ;       dictionary as a token or literal.
                                   3847 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001773                       3848         _HEADER SCOMP,8,"$COMPILE"
      0097F3 97 87                    1         .word LINK 
                           001775     2         LINK=.
      0097F5 08                       3         .byte 8  
      0097F6 24 43 4F 4D 50 49 4C     4         .ascii "$COMPILE"
             45
      0097FE                          5         SCOMP:
      0097FE CD 93 75         [ 4] 3849         CALL     NAMEQ
      009801 CD 88 4C         [ 4] 3850         CALL     QDUP    ;?defined
      009804 CD 85 18         [ 4] 3851         CALL     QBRAN
      009807 98 1F                 3852         .word      SCOM2
      009809 CD 85 63         [ 4] 3853         CALL     AT
      00980C CD 84 EF         [ 4] 3854         CALL     DOLIT
      00980F 80 00                 3855         .word     0x8000	;  IMEDD*256
      009811 CD 86 F6         [ 4] 3856         CALL     ANDD    ;?immediate
      009814 CD 85 18         [ 4] 3857         CALL     QBRAN
      009817 98 1C                 3858         .word      SCOM1
      009819 CC 85 44         [ 2] 3859         JP     EXECU
      00981C CC 98 C9         [ 2] 3860 SCOM1:  JP     JSRC
      00981F CD A6 1D         [ 4] 3861 SCOM2:  CALL     NUMBQ   ;try to convert to number
      009822 CD 88 4C         [ 4] 3862         CALL    QDUP  
      009825 CD 85 18         [ 4] 3863         CALL     QBRAN
      009828 94 89                 3864         .word      ABOR1
      0017AA                       3865         _DOLIT  -1
      00982A CD 84 EF         [ 4]    1     CALL DOLIT 
      00982D FF FF                    2     .word -1 
      00982F CD 89 7A         [ 4] 3866         CALL    EQUAL
      0017B2                       3867         _QBRAN DLITER  
      009832 CD 85 18         [ 4]    1     CALL QBRAN
      009835 A9 F0                    2     .word DLITER
      009837 CC 96 26         [ 2] 3868         JP     LITER
                                   3869 
                                   3870 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3871 ;       OVERT   ( -- )
                                   3872 ;       Link a new word into vocabulary.
                                   3873 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0017BA                       3874         _HEADER OVERT,5,"OVERT"
      00983A 97 F5                    1         .word LINK 
                           0017BC     2         LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



      00983C 05                       3         .byte 5  
      00983D 4F 56 45 52 54           4         .ascii "OVERT"
      009842                          5         OVERT:
      009842 CD 88 0E         [ 4] 3875         CALL     LAST
      009845 CD 85 63         [ 4] 3876         CALL     AT
      009848 CD 87 E2         [ 4] 3877         CALL     CNTXT
      00984B CC 85 51         [ 2] 3878         JP     STORE
                                   3879 
                                   3880 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3881 ;       ;       ( -- )
                                   3882 ;       Terminate a colon definition.
                                   3883 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0017CE                       3884         _HEADER SEMIS,IMEDD+COMPO+1,^/";"/
      00984E 98 3C                    1         .word LINK 
                           0017D0     2         LINK=.
      009850 C1                       3         .byte IMEDD+COMPO+1  
      009851 3B                       4         .ascii ";"
      009852                          5         SEMIS:
                           000001  3885 .if OPTIMIZE ; more compact and faster
      009852 CD 84 EF         [ 4] 3886         call DOLIT 
      009855 00 81                 3887         .word 0x81   ; opcode for RET 
      009857 CD 95 D6         [ 4] 3888         call CCOMMA 
                           000000  3889 .else
                                   3890         CALL     COMPI
                                   3891         .word EXIT 
                                   3892 .endif 
      00985A CD 94 EA         [ 4] 3893         CALL     LBRAC
      00985D CD 98 42         [ 4] 3894         call OVERT 
      009860 CD A2 C1         [ 4] 3895         CALL FMOVE
      009863 CD 88 4C         [ 4] 3896         call QDUP 
      009866 CD 85 18         [ 4] 3897         call QBRAN 
      009869 99 99                 3898         .word SET_RAMLAST 
      00986B CD A3 55         [ 4] 3899         CALL UPDATPTR
      00986E 81               [ 4] 3900         RET 
                                   3901 
                                   3902 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3903 ;       Terminate an ISR definition 
                                   3904 ;       retourn ca of ISR as double
                                   3905 ;       I; ( -- ud )
                                   3906 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0017EF                       3907        _HEADER ISEMI,2+IMEDD+COMPO,^/"I;"/
      00986F 98 50                    1         .word LINK 
                           0017F1     2         LINK=.
      009871 C2                       3         .byte 2+IMEDD+COMPO  
      009872 49 3B                    4         .ascii "I;"
      009874                          5         ISEMI:
      009874 1D 00 02         [ 2] 3908         subw x,#CELLL  
      009877 90 AE 00 80      [ 2] 3909         ldw y,#IRET_CODE 
      00987B FF               [ 2] 3910         ldw (x),y 
      00987C CD 95 D6         [ 4] 3911         call CCOMMA
      00987F CD 94 EA         [ 4] 3912         call LBRAC 
      009882 CD A3 9A         [ 4] 3913         call IFMOVE
      009885 CD 88 4C         [ 4] 3914         call QDUP 
      009888 CD 85 18         [ 4] 3915         CALL QBRAN 
      00988B 99 99                 3916         .word SET_RAMLAST
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



      00988D CD 87 FE         [ 4] 3917         CALL CPP
      009890 CD 85 63         [ 4] 3918         call AT 
      009893 CD 86 A9         [ 4] 3919         call SWAPP 
      009896 CD 87 FE         [ 4] 3920         CALL CPP 
      009899 CD 85 51         [ 4] 3921         call STORE 
      00989C CD 9D 52         [ 4] 3922         call UPDATCP 
      00989F CD 9D 0F         [ 4] 3923         call EEPVP 
      001822                       3924         _DROP 
      0098A2 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      0098A5 CD 85 63         [ 4] 3925         call AT 
      0098A8 CD 87 F0         [ 4] 3926         call VPP 
      0098AB CD 85 51         [ 4] 3927         call STORE 
      0098AE CC 8C 9E         [ 2] 3928         jp ZERO
      0098B1 81               [ 4] 3929         ret           
                                   3930         
                                   3931 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3932 ;       ]       ( -- )
                                   3933 ;       Start compiling words in
                                   3934 ;       input stream.
                                   3935 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001832                       3936         _HEADER RBRAC,1,"]"
      0098B2 98 71                    1         .word LINK 
                           001834     2         LINK=.
      0098B4 01                       3         .byte 1  
      0098B5 5D                       4         .ascii "]"
      0098B6                          5         RBRAC:
      0098B6 CD 84 EF         [ 4] 3937         CALL   DOLIT
      0098B9 97 FE                 3938         .word  SCOMP
      0098BB CD 87 C0         [ 4] 3939         CALL   TEVAL
      0098BE CC 85 51         [ 2] 3940         JP     STORE
                                   3941 
                                   3942 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3943 ;       CALL,    ( ca -- )
                                   3944 ;       Compile a subroutine call.
                                   3945 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001841                       3946         _HEADER JSRC,5,^/"CALL,"/
      0098C1 98 B4                    1         .word LINK 
                           001843     2         LINK=.
      0098C3 05                       3         .byte 5  
      0098C4 43 41 4C 4C 2C           4         .ascii "CALL,"
      0098C9                          5         JSRC:
      0098C9 CD 84 EF         [ 4] 3947         CALL     DOLIT
      0098CC 00 CD                 3948         .word     CALLL     ;CALL
      0098CE CD 95 D6         [ 4] 3949         CALL     CCOMMA
      0098D1 CC 95 BF         [ 2] 3950         JP     COMMA
                                   3951 
                                   3952 ;       INIT-OFS ( -- )
                                   3953 ;       compute offset to adjust jump address 
                                   3954 ;       set variable OFFSET 
      0098D4 98 C3                 3955         .word LINK 
                           001856  3956         LINK=.
      0098D6 08                    3957         .byte 8 
      0098D7 49 4E 49 54 2D 4F 46  3958         .ascii "INIT-OFS" 
             53
      0098DF                       3959 INITOFS:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



      0098DF CD 87 AF         [ 4] 3960         call TFLASH 
      0098E2 CD 85 63         [ 4] 3961         CALL AT 
      0098E5 CD 86 99         [ 4] 3962         CALL DUPP 
      0098E8 CD 85 18         [ 4] 3963         call QBRAN
      0098EB 98 FC                 3964         .word 1$
      00186D                       3965         _DROP  
      0098ED 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      0098F0 CD 87 FE         [ 4] 3966         call CPP 
      0098F3 CD 85 63         [ 4] 3967         call AT 
      0098F6 CD 8D 7B         [ 4] 3968         call HERE
      0098F9 CD 89 52         [ 4] 3969         call SUBB 
      0098FC CD 88 33         [ 4] 3970 1$:     call OFFSET 
      0098FF CC 85 51         [ 2] 3971         jp STORE  
                                   3972 
                                   3973 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3974 ;       :       ( -- ; <string> )
                                   3975 ;       Start a new colon definition
                                   3976 ;       using next word as its name.
                                   3977 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001882                       3978         _HEADER COLON,1,":"
      009902 98 D6                    1         .word LINK 
                           001884     2         LINK=.
      009904 01                       3         .byte 1  
      009905 3A                       4         .ascii ":"
      009906                          5         COLON:
      009906 CD 98 DF         [ 4] 3979         call INITOFS       
      009909 CD 92 78         [ 4] 3980         CALL   TOKEN
      00990C CD 97 B1         [ 4] 3981         CALL   SNAME
      00990F CC 98 B6         [ 2] 3982         JP     RBRAC
                                   3983 
                                   3984 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3985 ;       I:  ( -- )
                                   3986 ;       Start interrupt service 
                                   3987 ;       routine definition
                                   3988 ;       those definition have 
                                   3989 ;       no name.
                                   3990 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001892                       3991         _HEADER ICOLON,2,"I:"
      009912 99 04                    1         .word LINK 
                           001894     2         LINK=.
      009914 02                       3         .byte 2  
      009915 49 3A                    4         .ascii "I:"
      009917                          5         ICOLON:
      009917 CD 98 DF         [ 4] 3992         call INITOFS 
      00991A CC 98 B6         [ 2] 3993         jp RBRAC  
                                   3994 
                                   3995 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3996 ;       IMMEDIATE       ( -- )
                                   3997 ;       Make last compiled word
                                   3998 ;       an immediate word.
                                   3999 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00189D                       4000         _HEADER IMMED,9,"IMMEDIATE"
      00991D 99 14                    1         .word LINK 
                           00189F     2         LINK=.
      00991F 09                       3         .byte 9  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



      009920 49 4D 4D 45 44 49 41     4         .ascii "IMMEDIATE"
             54 45
      009929                          5         IMMED:
      009929 CD 84 EF         [ 4] 4001         CALL     DOLIT
      00992C 80 00                 4002         .word     0x8000	;  IMEDD*256
      00992E CD 88 0E         [ 4] 4003         CALL     LAST
      009931 CD 85 63         [ 4] 4004         CALL     AT
      009934 CD 85 63         [ 4] 4005         CALL     AT
      009937 CD 87 0A         [ 4] 4006         CALL     ORR
      00993A CD 88 0E         [ 4] 4007         CALL     LAST
      00993D CD 85 63         [ 4] 4008         CALL     AT
      009940 CC 85 51         [ 2] 4009         JP     STORE
                                   4010 
                                   4011 ;; Defining words
                                   4012 
                                   4013 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4014 ;       CREATE  ( -- ; <string> )
                                   4015 ;       Compile a new array
                                   4016 ;       without allocating space.
                                   4017 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0018C3                       4018         _HEADER CREAT,6,"CREATE"
      009943 99 1F                    1         .word LINK 
                           0018C5     2         LINK=.
      009945 06                       3         .byte 6  
      009946 43 52 45 41 54 45        4         .ascii "CREATE"
      00994C                          5         CREAT:
      00994C CD 92 78         [ 4] 4019         CALL     TOKEN
      00994F CD 97 B1         [ 4] 4020         CALL     SNAME
      009952 CD 98 42         [ 4] 4021         CALL     OVERT        
      009955 CD 96 04         [ 4] 4022         CALL     COMPI 
      009958 87 4F                 4023         .word DOVAR 
      00995A 81               [ 4] 4024         RET
                                   4025 
                                   4026 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4027 ;       VARIABLE  ( -- ; <string> )
                                   4028 ;       Compile a new variable
                                   4029 ;       initialized to 0.
                                   4030 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0018DB                       4031         _HEADER VARIA,8,"VARIABLE"
      00995B 99 45                    1         .word LINK 
                           0018DD     2         LINK=.
      00995D 08                       3         .byte 8  
      00995E 56 41 52 49 41 42 4C     4         .ascii "VARIABLE"
             45
      009966                          5         VARIA:
                                   4032 ; indirect variable so that VARIABLE definition can be compiled in FLASH 
      009966 CD 8D 7B         [ 4] 4033         CALL HERE
      009969 CD 86 99         [ 4] 4034         CALL DUPP 
      00996C CD 8C 07         [ 4] 4035         CALL CELLP
      00996F CD 87 F0         [ 4] 4036         CALL VPP 
      009972 CD 85 51         [ 4] 4037         CALL STORE
      009975 CD 99 4C         [ 4] 4038         CALL CREAT
      009978 CD 86 99         [ 4] 4039         CALL DUPP
      00997B CD 95 BF         [ 4] 4040         CALL COMMA
      00997E CD 8C 9E         [ 4] 4041         CALL ZERO
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



      009981 CD 86 A9         [ 4] 4042         call SWAPP 
      009984 CD 85 51         [ 4] 4043         CALL STORE
      009987 CD A2 C1         [ 4] 4044         CALL FMOVE ; move definition to FLASH
      00998A CD 88 4C         [ 4] 4045         CALL QDUP 
      00998D CD 85 18         [ 4] 4046         CALL QBRAN 
      009990 99 99                 4047         .word SET_RAMLAST   
      009992 CD 9D 69         [ 4] 4048         call UPDATVP  ; don't update if variable kept in RAM.
      009995 CD A3 55         [ 4] 4049         CALL UPDATPTR
      009998 81               [ 4] 4050         RET         
      009999                       4051 SET_RAMLAST: 
      009999 CD 88 0E         [ 4] 4052         CALL LAST 
      00999C CD 85 63         [ 4] 4053         CALL AT 
      00999F CD 88 21         [ 4] 4054         CALL RAMLAST 
      0099A2 CC 85 51         [ 2] 4055         jp STORE  
                                   4056 
                                   4057 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4058 ;       CONSTANT  ( n -- ; <string> )
                                   4059 ;       Compile a new constant 
                                   4060 ;       n CONSTANT name 
                                   4061 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001925                       4062         _HEADER CONSTANT,8,"CONSTANT"
      0099A5 99 5D                    1         .word LINK 
                           001927     2         LINK=.
      0099A7 08                       3         .byte 8  
      0099A8 43 4F 4E 53 54 41 4E     4         .ascii "CONSTANT"
             54
      0099B0                          5         CONSTANT:
      0099B0 CD 92 78         [ 4] 4063         CALL TOKEN
      0099B3 CD 97 B1         [ 4] 4064         CALL SNAME 
      0099B6 CD 98 42         [ 4] 4065         CALL OVERT 
      0099B9 CD 96 04         [ 4] 4066         CALL COMPI 
      0099BC 99 D0                 4067         .word DOCONST
      0099BE CD 95 BF         [ 4] 4068         CALL COMMA 
      0099C1 CD A2 C1         [ 4] 4069         CALL FMOVE
      0099C4 CD 88 4C         [ 4] 4070         CALL QDUP 
      0099C7 CD 85 18         [ 4] 4071         CALL QBRAN 
      0099CA 99 99                 4072         .word SET_RAMLAST  
      0099CC CD A3 55         [ 4] 4073         CALL UPDATPTR  
      0099CF 81               [ 4] 4074 1$:     RET          
                                   4075 
                                   4076 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4077 ; CONSTANT runtime semantic 
                                   4078 ; doCONST  ( -- n )
                                   4079 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4080 ;       _HEADER DOCONST,7,"DOCONST"
      0099D0                       4081 DOCONST:
      0099D0 1D 00 02         [ 2] 4082         subw x,#CELLL
      0099D3 90 85            [ 2] 4083         popw y 
      0099D5 90 FE            [ 2] 4084         ldw y,(y) 
      0099D7 FF               [ 2] 4085         ldw (x),y 
      0099D8 81               [ 4] 4086         ret 
                                   4087 
                                   4088 ;----------------------------------
                                   4089 ; create double constant 
                                   4090 ; 2CONSTANT ( d -- ; <string> )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



                                   4091 ;----------------------------------
      001959                       4092         _HEADER DCONST,9,"2CONSTANT"
      0099D9 99 A7                    1         .word LINK 
                           00195B     2         LINK=.
      0099DB 09                       3         .byte 9  
      0099DC 32 43 4F 4E 53 54 41     4         .ascii "2CONSTANT"
             4E 54
      0099E5                          5         DCONST:
      0099E5 CD 92 78         [ 4] 4093         CALL TOKEN
      0099E8 CD 97 B1         [ 4] 4094         CALL SNAME 
      0099EB CD 98 42         [ 4] 4095         CALL OVERT 
      0099EE CD 96 04         [ 4] 4096         CALL COMPI 
      0099F1 9A 08                 4097         .word DO_DCONST
      0099F3 CD 95 BF         [ 4] 4098         CALL COMMA
      0099F6 CD 95 BF         [ 4] 4099         CALL COMMA  
      0099F9 CD A2 C1         [ 4] 4100         CALL FMOVE
      0099FC CD 88 4C         [ 4] 4101         CALL QDUP 
      0099FF CD 85 18         [ 4] 4102         CALL QBRAN 
      009A02 99 99                 4103         .word SET_RAMLAST  
      009A04 CD A3 55         [ 4] 4104         CALL UPDATPTR  
      009A07 81               [ 4] 4105 1$:     RET          
                                   4106     
                                   4107 ;----------------------------------
                                   4108 ; runtime for DCONST 
                                   4109 ; stack double constant 
                                   4110 ; DO-DCONST ( -- d )
                                   4111 ;-----------------------------------
                                   4112 ;       _HEADER DO_DCONST,9,"DO-DCONST"
      009A08                       4113 DO_DCONST:
      009A08 90 85            [ 2] 4114     popw y 
      009A0A 90 BF 26         [ 2] 4115     ldw YTEMP,y 
      009A0D 1D 00 04         [ 2] 4116     subw x,#2*CELLL 
      009A10 90 FE            [ 2] 4117     ldw y,(y)
      009A12 FF               [ 2] 4118     ldw (x),y 
      009A13 90 BE 26         [ 2] 4119     ldw y,YTEMP 
      009A16 90 EE 02         [ 2] 4120     ldw y,(2,y)
      009A19 EF 02            [ 2] 4121     ldw (2,x),y 
      009A1B 81               [ 4] 4122     ret 
                                   4123 
                                   4124 ;; Tools
                                   4125 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4126 ;       _TYPE   ( b u -- )
                                   4127 ;       Display a string. Filter
                                   4128 ;       non-printing characters.
                                   4129 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00199C                       4130         _HEADER UTYPE,5,"_TYPE"
      009A1C 99 DB                    1         .word LINK 
                           00199E     2         LINK=.
      009A1E 05                       3         .byte 5  
      009A1F 5F 54 59 50 45           4         .ascii "_TYPE"
      009A24                          5         UTYPE:
      009A24 CD 86 62         [ 4] 4131         CALL     TOR     ;start count down loop
      009A27 20 0F            [ 2] 4132         JRA     UTYP2   ;skip first pass
      009A29 CD 86 99         [ 4] 4133 UTYP1:  CALL     DUPP
      009A2C CD 85 81         [ 4] 4134         CALL     CAT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



      009A2F CD 8C C8         [ 4] 4135         CALL     TCHAR
      009A32 CD 84 B6         [ 4] 4136         CALL     EMIT    ;display only printable
      009A35 CD 8C 32         [ 4] 4137         CALL     ONEP    ;increment address
      009A38 CD 85 03         [ 4] 4138 UTYP2:  CALL     DONXT
      009A3B 9A 29                 4139         .word      UTYP1   ;loop till done
      009A3D CC 86 8F         [ 2] 4140         JP     DROP
                                   4141 
                                   4142 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4143 ;       dm+     ( a u -- a )
                                   4144 ;       Dump u bytes from ,
                                   4145 ;       leaving a+u on  stack.
                                   4146 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0019C0                       4147         _HEADER DUMPP,3,"DM+"
      009A40 9A 1E                    1         .word LINK 
                           0019C2     2         LINK=.
      009A42 03                       3         .byte 3  
      009A43 44 4D 2B                 4         .ascii "DM+"
      009A46                          5         DUMPP:
      009A46 CD 86 C1         [ 4] 4148         CALL     OVER
      009A49 CD 84 EF         [ 4] 4149         CALL     DOLIT
      009A4C 00 04                 4150         .word      4
      009A4E CD 90 6C         [ 4] 4151         CALL     UDOTR   ;display address
      009A51 CD 8F D4         [ 4] 4152         CALL     SPACE
      009A54 CD 86 62         [ 4] 4153         CALL     TOR     ;start count down loop
      009A57 20 11            [ 2] 4154         JRA     PDUM2   ;skip first pass
      009A59 CD 86 99         [ 4] 4155 PDUM1:  CALL     DUPP
      009A5C CD 85 81         [ 4] 4156         CALL     CAT
      009A5F CD 84 EF         [ 4] 4157         CALL     DOLIT
      009A62 00 03                 4158         .word      3
      009A64 CD 90 6C         [ 4] 4159         CALL     UDOTR   ;display numeric data
      009A67 CD 8C 32         [ 4] 4160         CALL     ONEP    ;increment address
      009A6A CD 85 03         [ 4] 4161 PDUM2:  CALL     DONXT
      009A6D 9A 59                 4162         .word      PDUM1   ;loop till done
      009A6F 81               [ 4] 4163         RET
                                   4164 
                                   4165 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4166 ;       DUMP    ( a u -- )
                                   4167 ;       Dump u bytes from a,
                                   4168 ;       in a formatted manner.
                                   4169 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0019F0                       4170         _HEADER DUMP,4,"DUMP"
      009A70 9A 42                    1         .word LINK 
                           0019F2     2         LINK=.
      009A72 04                       3         .byte 4  
      009A73 44 55 4D 50              4         .ascii "DUMP"
      009A77                          5         DUMP:
      009A77 CD 87 5F         [ 4] 4171         CALL     BASE
      009A7A CD 85 63         [ 4] 4172         CALL     AT
      009A7D CD 86 62         [ 4] 4173         CALL     TOR
      009A80 CD 8F 33         [ 4] 4174         CALL     HEX     ;save radix, set hex
      009A83 CD 84 EF         [ 4] 4175         CALL     DOLIT
      009A86 00 10                 4176         .word      16
      009A88 CD 8B 58         [ 4] 4177         CALL     SLASH   ;change count to lines
      009A8B CD 86 62         [ 4] 4178         CALL     TOR     ;start count down loop
      009A8E CD 90 16         [ 4] 4179 DUMP1:  CALL     CR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



      009A91 CD 84 EF         [ 4] 4180         CALL     DOLIT
      009A94 00 10                 4181         .word      16
      009A96 CD 88 A7         [ 4] 4182         CALL     DDUP
      009A99 CD 9A 46         [ 4] 4183         CALL     DUMPP   ;display numeric
      009A9C CD 88 5D         [ 4] 4184         CALL     ROT
      009A9F CD 88 5D         [ 4] 4185         CALL     ROT
      009AA2 CD 8F D4         [ 4] 4186         CALL     SPACE
      009AA5 CD 8F D4         [ 4] 4187         CALL     SPACE
      009AA8 CD 9A 24         [ 4] 4188         CALL     UTYPE   ;display printable characters
      009AAB CD 85 03         [ 4] 4189         CALL     DONXT
      009AAE 9A 8E                 4190         .word      DUMP1   ;loop till done
      009AB0 CD 86 8F         [ 4] 4191 DUMP3:  CALL     DROP
      009AB3 CD 85 B4         [ 4] 4192         CALL     RFROM
      009AB6 CD 87 5F         [ 4] 4193         CALL     BASE
      009AB9 CC 85 51         [ 2] 4194         JP     STORE   ;restore radix
                                   4195 
                                   4196 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4197 ;       .S      ( ... -- ... )
                                   4198 ;        Display  contents of stack.
                                   4199 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001A3C                       4200         _HEADER DOTS,2,".S"
      009ABC 9A 72                    1         .word LINK 
                           001A3E     2         LINK=.
      009ABE 02                       3         .byte 2  
      009ABF 2E 53                    4         .ascii ".S"
      009AC1                          5         DOTS:
      009AC1 CD 90 16         [ 4] 4201         CALL     CR
      009AC4 CD 8C E0         [ 4] 4202         CALL     DEPTH   ;stack depth
      009AC7 CD 86 62         [ 4] 4203         CALL     TOR     ;start count down loop
      009ACA 20 09            [ 2] 4204         JRA     DOTS2   ;skip first pass
      009ACC CD 85 C5         [ 4] 4205 DOTS1:  CALL     RAT
      009ACF CD 8C F7         [ 4] 4206 	CALL     PICK
      009AD2 CD 90 BD         [ 4] 4207         CALL     DOT     ;index stack, display contents
      009AD5 CD 85 03         [ 4] 4208 DOTS2:  CALL     DONXT
      009AD8 9A CC                 4209         .word      DOTS1   ;loop till done
      009ADA CD 90 43         [ 4] 4210         CALL     DOTQP
      009ADD 05                    4211         .byte      5
      009ADE 20 3C 73 70 20        4212         .ascii     " <sp "
      009AE3 81               [ 4] 4213         RET
                                   4214 
                                   4215 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4216 ;       >NAME   ( ca -- na | F )
                                   4217 ;       Convert code address
                                   4218 ;       to a name address.
                                   4219 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001A64                       4220         _HEADER TNAME,5,">NAME"
      009AE4 9A BE                    1         .word LINK 
                           001A66     2         LINK=.
      009AE6 05                       3         .byte 5  
      009AE7 3E 4E 41 4D 45           4         .ascii ">NAME"
      009AEC                          5         TNAME:
      009AEC CD 87 E2         [ 4] 4221         CALL     CNTXT   ;vocabulary link
      009AEF CD 85 63         [ 4] 4222 TNAM2:  CALL     AT
      009AF2 CD 86 99         [ 4] 4223         CALL     DUPP    ;?last word in a vocabulary
      009AF5 CD 85 18         [ 4] 4224         CALL     QBRAN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



      009AF8 9B 13                 4225         .word      TNAM4
      009AFA CD 88 A7         [ 4] 4226         CALL     DDUP
      009AFD CD 92 86         [ 4] 4227         CALL     NAMET
      009B00 CD 87 1F         [ 4] 4228         CALL     XORR    ;compare
      009B03 CD 85 18         [ 4] 4229         CALL     QBRAN
      009B06 9B 0D                 4230         .word      TNAM3
      009B08 CD 8C 16         [ 4] 4231         CALL     CELLM   ;continue with next word
      009B0B 20 E2            [ 2] 4232         JRA     TNAM2
      009B0D CD 86 A9         [ 4] 4233 TNAM3:  CALL     SWAPP
      009B10 CC 86 8F         [ 2] 4234         JP     DROP
      009B13 CD 88 9C         [ 4] 4235 TNAM4:  CALL     DDROP
      009B16 CC 8C 9E         [ 2] 4236         JP     ZERO
                                   4237 
                                   4238 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4239 ;       .ID     ( na -- )
                                   4240 ;        Display  name at address.
                                   4241 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001A99                       4242         _HEADER DOTID,3,".ID"
      009B19 9A E6                    1         .word LINK 
                           001A9B     2         LINK=.
      009B1B 03                       3         .byte 3  
      009B1C 2E 49 44                 4         .ascii ".ID"
      009B1F                          5         DOTID:
      009B1F CD 88 4C         [ 4] 4243         CALL     QDUP    ;if zero no name
      009B22 CD 85 18         [ 4] 4244         CALL     QBRAN
      009B25 9B 35                 4245         .word      DOTI1
      009B27 CD 8D 64         [ 4] 4246         CALL     COUNT
      009B2A CD 84 EF         [ 4] 4247         CALL     DOLIT
      009B2D 00 1F                 4248         .word      0x1F
      009B2F CD 86 F6         [ 4] 4249         CALL     ANDD    ;mask lexicon bits
      009B32 CC 9A 24         [ 2] 4250         JP     UTYPE
      009B35 CD 90 43         [ 4] 4251 DOTI1:  CALL     DOTQP
      009B38 09                    4252         .byte      9
      009B39 20 6E 6F 4E 61 6D 65  4253         .ascii     " noName"
      009B40 81               [ 4] 4254         RET
                                   4255 
                           000000  4256 WANT_SEE=0
                           000000  4257 .if WANT_SEE 
                                   4258 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4259 ;       SEE     ( -- ; <string> )
                                   4260 ;       A simple decompiler.
                                   4261 ;       Updated for byte machines.
                                   4262 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4263         _HEADER SEE,3,"SEE"
                                   4264         CALL     TICK    ;starting address
                                   4265         CALL     CR
                                   4266         CALL     ONEM
                                   4267 SEE1:   CALL     ONEP
                                   4268         CALL     DUPP
                                   4269         CALL     AT
                                   4270         CALL     DUPP
                                   4271         CALL     QBRAN
                                   4272         .word    SEE2
                                   4273         CALL     TNAME   ;?is it a name
                                   4274 SEE2:   CALL     QDUP    ;name address or zero
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



                                   4275         CALL     QBRAN
                                   4276         .word    SEE3
                                   4277         CALL     SPACE
                                   4278         CALL     DOTID   ;display name
                                   4279         CALL     ONEP
                                   4280         JRA      SEE4
                                   4281 SEE3:   CALL     DUPP
                                   4282         CALL     CAT
                                   4283         CALL     UDOT    ;display number
                                   4284 SEE4:   CALL     NUFQ    ;user control
                                   4285         CALL     QBRAN
                                   4286         .word    SEE1
                                   4287         JP     DROP
                                   4288 .endif ; WANT_SEE 
                                   4289 
                                   4290 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4291 ;       WORDS   ( -- )
                                   4292 ;       Display names in vocabulary.
                                   4293 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001AC1                       4294         _HEADER WORDS,5,"WORDS"
      009B41 9B 1B                    1         .word LINK 
                           001AC3     2         LINK=.
      009B43 05                       3         .byte 5  
      009B44 57 4F 52 44 53           4         .ascii "WORDS"
      009B49                          5         WORDS:
      009B49 CD 90 16         [ 4] 4295         CALL     CR
      009B4C CD 87 E2         [ 4] 4296         CALL     CNTXT   ;only in context
      009B4F CD 85 63         [ 4] 4297 WORS1:  CALL     AT
      009B52 CD 88 4C         [ 4] 4298         CALL     QDUP    ;?at end of list
      009B55 CD 85 18         [ 4] 4299         CALL     QBRAN
      009B58 9B 6B                 4300         .word      WORS2
      009B5A CD 86 99         [ 4] 4301         CALL     DUPP
      009B5D CD 8F D4         [ 4] 4302         CALL     SPACE
      009B60 CD 9B 1F         [ 4] 4303         CALL     DOTID   ;display a name
      009B63 CD 8C 16         [ 4] 4304         CALL     CELLM
      009B66 CD 85 34         [ 4] 4305         CALL     BRAN
      009B69 9B 4F                 4306         .word      WORS1
      009B6B 81               [ 4] 4307 WORS2:  RET
                                   4308 
                                   4309         
                                   4310 ;; Hardware reset
                                   4311 
                                   4312 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4313 ;  COPYRIGTH
                                   4314 ; print copyright notice 
                                   4315 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      009B6C                       4316 COPYRIGHT:
      009B6C CD 90 43         [ 4] 4317     CALL DOTQP 
      009B6F 21                    4318     .byte 33 
      009B70 4A 61 63 71 75 65 73  4319     .ascii "Jacques Deschenes, Copyright 2021"
             20 44 65 73 63 68 65
             6E 65 73 2C 20 43 6F
             70 79 72 69 67 68 74
             20 32 30 32 31
      009B91 CC 90 16         [ 2] 4320     JP CR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



                                   4321 
                                   4322 
                                   4323 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4324 ;  PRT_LICENCE 
                                   4325 ;  print GPLV2 licence 
                                   4326 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      009B94                       4327 PRT_LICENCE:
      009B94 CD 90 43         [ 4] 4328         CALL DOTQP 
      009B97 0F                    4329         .byte  15 
      009B98 4C 49 43 45 4E 43 45  4330         .ascii "LICENCE GPLV3\r\n"
             20 47 50 4C 56 33 0D
             0A
      009BA7 81               [ 4] 4331         RET 
                                   4332 
                                   4333 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4334 ;    PRINT_VERSION ( c1 c2 -- )
                                   4335 ;    c2 minor 
                                   4336 ;    c1 major 
                                   4337 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      009BA8                       4338 PRINT_VERSION:
      009BA8 CD 90 43         [ 4] 4339      CALL DOTQP 
      009BAB 09                    4340      .byte 9
      009BAC 20 76 65 72 73 69 6F  4341      .ascii " version "
             6E 20
      009BB5 CD 8E 98         [ 4] 4342      CALL BDIGS 
      009BB8 CD 8E D2         [ 4] 4343      CALL DIGS 
      009BBB CD 8E D2         [ 4] 4344      CALL DIGS 
      001B3E                       4345      _DOLIT '.' 
      009BBE CD 84 EF         [ 4]    1     CALL DOLIT 
      009BC1 00 2E                    2     .word '.' 
      009BC3 CD 8E A8         [ 4] 4346      CALL HOLD 
      001B46                       4347      _DROP 
      009BC6 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      009BC9 CD 8E D2         [ 4] 4348      CALL DIGS 
      009BCC CD 8E FD         [ 4] 4349      CALL EDIGS 
      009BCF CD 8F FE         [ 4] 4350      CALL TYPES 
      009BD2 81               [ 4] 4351      RET 
                                   4352 
                                   4353 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4354 ;       hi      ( -- )
                                   4355 ;       Display sign-on message.
                                   4356 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001B53                       4357         _HEADER HI,2,"HI"
      009BD3 9B 43                    1         .word LINK 
                           001B55     2         LINK=.
      009BD5 02                       3         .byte 2  
      009BD6 48 49                    4         .ascii "HI"
      009BD8                          5         HI:
      009BD8 CD 90 16         [ 4] 4358         CALL     CR
      009BDB CD 90 43         [ 4] 4359         CALL     DOTQP   
      009BDE 0A                    4360         .byte      10
      009BDF 73 74 6D 38 65 46 6F  4361         .ascii     "stm8eForth"
             72 74 68
      001B69                       4362 	_DOLIT VER 
      009BE9 CD 84 EF         [ 4]    1     CALL DOLIT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



      009BEC 00 04                    2     .word VER 
      001B6E                       4363         _DOLIT EXT 
      009BEE CD 84 EF         [ 4]    1     CALL DOLIT 
      009BF1 00 00                    2     .word EXT 
      009BF3 CD 9B A8         [ 4] 4364         CALL PRINT_VERSION 
      009BF6 CD 90 43         [ 4] 4365         CALL    DOTQP
                           000001  4366 .if NUCLEO          
      009BF9 12                    4367         .byte 18
      009BFA 20 6F 6E 20 4E 55 43  4368         .ascii  " on NUCLEO-8S208RB"
             4C 45 4F 2D 38 53 32
             30 38 52 42
                                   4369 .endif
                           000000  4370 .if DISCOVERY
                                   4371         .byte 19
                                   4372         .ascii  " on STM8S-DISCOVERY"
                                   4373 .endif
                           000000  4374 .if DOORBELL
                                   4375         .byte 16
                                   4376         .ascii " on stm8s105k6b6"
                                   4377 .endif
      009C0C CC 90 16         [ 2] 4378         JP     CR
                                   4379 
                           000000  4380 WANT_DEBUG=0
                           000000  4381 .if WANT_DEBUG 
                                   4382 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4383 ;       DEBUG      ( -- )
                                   4384 ;       Display sign-on message.
                                   4385 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4386         _HEADER DEBUG,5,"DEBUG"
                                   4387 	CALL DOLIT
                                   4388 	.word 0x65
                                   4389 	CALL EMIT
                                   4390 	CALL ZERO
                                   4391  	CALL ZLESS 
                                   4392 	CALL DOLIT
                                   4393 	.word 0xFFFE
                                   4394 	CALL ZLESS 
                                   4395 	CALL UPLUS 
                                   4396  	_DROP 
                                   4397 	CALL DOLIT
                                   4398 	.word 3
                                   4399 	CALL UPLUS 
                                   4400 	CALL UPLUS 
                                   4401  	_DROP
                                   4402 	CALL DOLIT
                                   4403 	.word 0x43
                                   4404 	CALL UPLUS 
                                   4405  	_DROP
                                   4406 	CALL EMIT
                                   4407 	CALL DOLIT
                                   4408 	.word 0x4F
                                   4409 	CALL DOLIT
                                   4410 	.word 0x6F
                                   4411  	CALL XORR
                                   4412 	CALL DOLIT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



                                   4413 	.word 0xF0
                                   4414  	CALL ANDD
                                   4415 	CALL DOLIT
                                   4416 	.word 0x4F
                                   4417  	CALL ORR
                                   4418 	CALL EMIT
                                   4419 	CALL DOLIT
                                   4420 	.word 8
                                   4421 	CALL DOLIT
                                   4422 	.word 6
                                   4423  	CALL SWAPP
                                   4424 	CALL OVER
                                   4425 	CALL XORR
                                   4426 	CALL DOLIT
                                   4427 	.word 3
                                   4428 	CALL ANDD 
                                   4429 	CALL ANDD
                                   4430 	CALL DOLIT
                                   4431 	.word 0x70
                                   4432 	CALL UPLUS 
                                   4433 	_DROP
                                   4434 	CALL EMIT
                                   4435 	CALL ZERO
                                   4436 	CALL QBRAN
                                   4437 	.word DEBUG1
                                   4438 	CALL DOLIT
                                   4439 	.word 0x3F
                                   4440 DEBUG1:
                                   4441 	CALL DOLIT
                                   4442 	.word 0xFFFF
                                   4443 	CALL QBRAN
                                   4444 	.word DEBUG2
                                   4445 	CALL DOLIT
                                   4446 	.word 0x74
                                   4447 	CALL BRAN
                                   4448 	.word DEBUG3
                                   4449 DEBUG2:
                                   4450 	CALL DOLIT
                                   4451 	.word 0x21
                                   4452 DEBUG3:
                                   4453 	CALL EMIT
                                   4454 	CALL DOLIT
                                   4455 	.word 0x68
                                   4456 	CALL DOLIT
                                   4457 	.word 0x80
                                   4458 	CALL STORE
                                   4459 	CALL DOLIT
                                   4460 	.word 0x80
                                   4461 	CALL AT
                                   4462 	CALL EMIT
                                   4463 	CALL DOLIT
                                   4464 	.word 0x4D
                                   4465 	CALL TOR
                                   4466 	CALL RAT
                                   4467 	CALL RFROM
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



                                   4468 	CALL ANDD
                                   4469 	CALL EMIT
                                   4470 	CALL DOLIT
                                   4471 	.word 0x61
                                   4472 	CALL DOLIT
                                   4473 	.word 0xA
                                   4474 	CALL TOR
                                   4475 DEBUG4:
                                   4476 	CALL ONE
                                   4477 	CALL UPLUS 
                                   4478 	_DROP
                                   4479 	CALL DONXT
                                   4480 	.word DEBUG4
                                   4481 	CALL EMIT
                                   4482 	CALL DOLIT
                                   4483 	.word 0x656D
                                   4484 	CALL DOLIT
                                   4485 	.word 0x100
                                   4486 	CALL UMSTA
                                   4487 	CALL SWAPP
                                   4488 	CALL DOLIT
                                   4489 	.word 0x100
                                   4490 	CALL UMSTA
                                   4491 	CALL SWAPP 
                                   4492 	_DROP
                                   4493 	CALL EMIT
                                   4494 	CALL EMIT
                                   4495 	CALL DOLIT
                                   4496 	.word 0x2043
                                   4497 	CALL ZERO
                                   4498 	CALL DOLIT
                                   4499 	.word 0x100
                                   4500 	CALL UMMOD
                                   4501 	CALL EMIT
                                   4502 	CALL EMIT
                                   4503 	;JP ORIG
                                   4504 	RET
                                   4505 .endif ; WANT_DEBUG 
                                   4506 
                                   4507 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4508 ;       'BOOT   ( -- a )
                                   4509 ;       The application startup vector.
                                   4510 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001B8F                       4511         _HEADER TBOOT,5,"'BOOT"
      009C0F 9B D5                    1         .word LINK 
                           001B91     2         LINK=.
      009C11 05                       3         .byte 5  
      009C12 27 42 4F 4F 54           4         .ascii "'BOOT"
      009C17                          5         TBOOT:
      009C17 CD 87 4F         [ 4] 4512         CALL     DOVAR
      009C1A 40 02                 4513         .word    APP_RUN      ;application to boot
                                   4514 
                                   4515 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4516 ;       COLD    ( -- )
                                   4517 ;       The hilevel cold start s=ence.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



                                   4518 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001B9C                       4519         _HEADER COLD,4,"COLD"
      009C1C 9C 11                    1         .word LINK 
                           001B9E     2         LINK=.
      009C1E 04                       3         .byte 4  
      009C1F 43 4F 4C 44              4         .ascii "COLD"
      009C23                          5         COLD:
                           000000  4520 .if WANT_DEBUG
                                   4521         CALL DEBUG
                                   4522 .endif ; WANT_DEBUG
      009C23 CD 84 EF         [ 4] 4523 COLD1:  CALL     DOLIT
      009C26 80 AB                 4524         .word      UZERO
      009C28 CD 84 EF         [ 4] 4525 	CALL     DOLIT
      009C2B 00 06                 4526         .word      UPP
      009C2D CD 84 EF         [ 4] 4527         CALL     DOLIT
      009C30 00 1C                 4528 	.word      UEND-UZERO
      009C32 CD 8D C8         [ 4] 4529         CALL     CMOVE   ;initialize user area
                           000001  4530 .if WANT_FLOAT 
      009C35 CD AC D4         [ 4] 4531         CALL    FINIT 
                                   4532 .endif 
                                   4533 ; if APP_RUN==0 initialize with ca de 'hi'  
      009C38 90 CE 40 02      [ 2] 4534         ldw y,APP_RUN 
      009C3C 26 0B            [ 1] 4535         jrne 0$
      009C3E 1D 00 02         [ 2] 4536         subw x,#CELLL 
      009C41 90 AE 9B D8      [ 2] 4537         ldw y,#HI  
      009C45 FF               [ 2] 4538         ldw (x),y
      009C46 CD 9D 41         [ 4] 4539         call UPDATRUN 
      009C49                       4540 0$:        
                                   4541 ; update LAST with APP_LAST 
                                   4542 ; if APP_LAST > LAST else do the opposite
      009C49 90 CE 40 00      [ 2] 4543         ldw y,APP_LAST 
      009C4D 90 B3 1C         [ 2] 4544         cpw y,ULAST 
      009C50 22 05            [ 1] 4545         jrugt 1$ 
                                   4546 ; save LAST at APP_LAST  
      009C52 CD 9D 29         [ 4] 4547         call UPDATLAST 
      009C55 20 06            [ 2] 4548         jra 2$
      009C57                       4549 1$: ; update LAST with APP_LAST 
      009C57 90 BF 1C         [ 2] 4550         ldw ULAST,y
      009C5A 90 BF 16         [ 2] 4551         ldw UCNTXT,y
      009C5D                       4552 2$:  
                                   4553 ; update APP_CP if < app_space 
      009C5D 90 CE 40 04      [ 2] 4554         ldw y,APP_CP  
      009C61 90 B3 1A         [ 2] 4555         cpw y,UCP   
      009C64 24 06            [ 1] 4556         jruge 3$ 
      009C66 CD 9D 52         [ 4] 4557         call UPDATCP
      009C69 90 BE 1A         [ 2] 4558         ldw y,UCP   
      009C6C                       4559 3$:
      009C6C 90 BF 1A         [ 2] 4560         ldw UCP,y                 
                                   4561 ; update UVP with APP_VP  
                                   4562 ; if APP_VP>UVP else do the opposite 
      009C6F 90 CE 40 06      [ 2] 4563         ldw y,APP_VP 
      009C73 90 B3 18         [ 2] 4564         cpw y,UVP 
      009C76 22 05            [ 1] 4565         jrugt 4$
      009C78 CD 9D 69         [ 4] 4566         call UPDATVP 
      009C7B 20 03            [ 2] 4567         jra 6$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



      009C7D                       4568 4$: ; update UVP with APP_VP 
      009C7D 90 BF 18         [ 2] 4569         ldw UVP,y 
      009C80                       4570 6$:      
      009C80 CD 95 69         [ 4] 4571         CALL     PRESE   ;initialize data stack and TIB
      009C83 CD 9C 17         [ 4] 4572         CALL     TBOOT
      009C86 CD 8D B1         [ 4] 4573         CALL     ATEXE   ;application boot
      009C89 CD 98 42         [ 4] 4574         CALL     OVERT
      009C8C CC 95 86         [ 2] 4575         JP     QUIT    ;start interpretation
                                   4576 
                                   4577 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



                                   4578         .include "flash.asm"
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
      009C8F 9C 1E                   31     .word LINK 
                           001C11    32     LINK=.
      009C91 03                      33     .byte 3 
      009C92 46 50 21                34     .ascii "FP!"
      009C95                         35 FPSTOR:
      009C95 90 93            [ 1]   36     ldw y,x
      009C97 90 FE            [ 2]   37     ldw y,(y)
      009C99 90 9F            [ 1]   38     ld a,yl 
      009C9B B7 34            [ 1]   39     ld FPTR,a 
      009C9D 1C 00 02         [ 2]   40     addw x,#CELLL 
      009CA0 90 93            [ 1]   41     ldw y,x 
      009CA2 90 FE            [ 2]   42     ldw y,(y)
      009CA4 90 BF 35         [ 2]   43     ldw PTR16,y
      009CA7 1C 00 02         [ 2]   44     addw x,#CELLL 
      009CAA 81               [ 4]   45     ret 
                                     46 
                                     47 ;-----------------------------------
                                     48 ; return EEPROM base address 
                                     49 ; as a double 
                                     50 ;  EEPROM  ( -- ud )
                                     51 ;-----------------------------------
      009CAB 9C 91                   52     .word LINK 
                           001C2D    53 LINK=.
      009CAD 06                      54     .byte 6 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]



      009CAE 45 45 50 52 4F 4D       55     .ascii "EEPROM"
      009CB4                         56 EEPROM: 
      009CB4 90 AE 40 00      [ 2]   57     ldw y,#EEPROM_BASE
      009CB8 1D 00 04         [ 2]   58     subw x,#2*CELLL 
      009CBB EF 02            [ 2]   59     ldw (2,x),y 
      009CBD 90 5F            [ 1]   60     clrw y 
      009CBF FF               [ 2]   61     ldw (x),y 
      009CC0 81               [ 4]   62     ret
                                     63 
                                     64 ;---------------------------------
                                     65 ; return APP_LAST pointer as double
                                     66 ; EEP-LAST ( -- ud )
                                     67 ;---------------------------------
      009CC1 9C AD                   68 	.word LINK 
                           001C43    69 	LINK=.
      009CC3 08                      70 	.byte 8 
      009CC4 45 45 50 2D 4C 41 53    71 	.ascii "EEP-LAST"
             54
      009CCC                         72 EEPLAST:
      009CCC 1D 00 04         [ 2]   73 	subw x,#2*CELLL 
      009CCF 90 AE 40 00      [ 2]   74 	ldw y,#APP_LAST 
      009CD3 EF 02            [ 2]   75 	ldw (2,x),y 
      009CD5 90 5F            [ 1]   76 	clrw y 
      009CD7 FF               [ 2]   77 	ldw (x),y 
      009CD8 81               [ 4]   78 	ret 
                                     79 
                                     80 ;----------------------------------
                                     81 ; return APP_RUN pointer as double	
                                     82 ; EEP-RUN ( -- ud )
                                     83 ;-----------------------------------
      009CD9 9C C3                   84 	.word LINK 
                           001C5B    85 	LINK=.
      009CDB 07                      86 	.byte 7
      009CDC 45 45 50 2D 52 55 4E    87 	.ascii "EEP-RUN"
      009CE3                         88 EEPRUN:
      009CE3 1D 00 04         [ 2]   89 	subw x,#2*CELLL 
      009CE6 90 AE 40 02      [ 2]   90 	ldw y,#APP_RUN 
      009CEA EF 02            [ 2]   91 	ldw (2,x),y 
      009CEC 90 5F            [ 1]   92 	clrw y 
      009CEE FF               [ 2]   93 	ldw (x),y 
      009CEF 81               [ 4]   94 	ret 
                                     95 
                                     96 ;------------------------------------
                                     97 ; return APP_CP pointer as double 
                                     98 ; EEP-CP ( -- ud )
                                     99 ;------------------------------------
      009CF0 9C DB                  100 	.word LINK
                           001C72   101 	LINK=.
      009CF2 06                     102 	.byte 6 
      009CF3 45 45 50 2D 43 50      103 	.ascii "EEP-CP"
      009CF9                        104 EEPCP:
      009CF9 1D 00 04         [ 2]  105 	subw x,#2*CELLL 
      009CFC 90 AE 40 04      [ 2]  106 	ldw y,#APP_CP  
      009D00 EF 02            [ 2]  107 	ldw (2,x),y 
      009D02 90 5F            [ 1]  108 	clrw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]



      009D04 FF               [ 2]  109 	ldw (x),y 
      009D05 81               [ 4]  110 	ret 
                                    111 
                                    112 ;------------------------------------
                                    113 ; return APP_VP pointer as double 
                                    114 ; EEP-VP ( -- ud )
                                    115 ;-------------------------------------
      009D06 9C F2                  116 	.word LINK
                           001C88   117 	LINK=.
      009D08 06                     118 	.byte 6
      009D09 45 45 50 2D 56 50      119 	.ascii "EEP-VP"
      009D0F                        120 EEPVP:
      009D0F 1D 00 04         [ 2]  121 	subw x,#2*CELLL 
      009D12 90 AE 40 06      [ 2]  122 	ldw y,#APP_VP  
      009D16 EF 02            [ 2]  123 	ldw (2,x),y 
      009D18 90 5F            [ 1]  124 	clrw y 
      009D1A FF               [ 2]  125 	ldw (x),y 
      009D1B 81               [ 4]  126 	ret 
                                    127 
                                    128 ;----------------------------------
                                    129 ; update APP_LAST with LAST 
                                    130 ; UPDAT-LAST ( -- )
                                    131 ;----------------------------------
      009D1C 9D 08                  132 	.word LINK 
                           001C9E   133 	LINK=.
      009D1E 0A                     134 	.byte 10
      009D1F 55 50 44 41 54 2D 4C   135 	.ascii "UPDAT-LAST"
             41 53 54
      009D29                        136 UPDATLAST:
      009D29 CD 88 0E         [ 4]  137 	call LAST
      009D2C CD 85 63         [ 4]  138 	call AT  
      009D2F CD 9C CC         [ 4]  139 	call EEPLAST
      009D32 CC 9F 1F         [ 2]  140 	jp EESTORE 
                                    141 
                                    142 ;---------------------------------
                                    143 ; update APP_RUN 
                                    144 ; UPDAT-RUN ( a -- )
                                    145 ;---------------------------------
      009D35 9D 1E                  146 	.word LINK
                           001CB7   147 	LINK=.
      009D37 09                     148 	.byte 9
      009D38 55 50 44 41 54 2D 52   149 	.ascii "UPDAT-RUN"
             55 4E
      009D41                        150 UPDATRUN:
      009D41 CD 9C E3         [ 4]  151 	call EEPRUN
      009D44 CC 9F 1F         [ 2]  152 	jp EESTORE 
                                    153 	
                                    154 ;---------------------------------
                                    155 ; update APP_CP with CP 
                                    156 ; UPDAT-CP ( -- )
                                    157 ;---------------------------------
      009D47 9D 37                  158 	.word LINK 
                           001CC9   159 	LINK=.
      009D49 08                     160 	.byte 8 
      009D4A 55 50 44 41 54 2D 43   161 	.ascii "UPDAT-CP"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal  50-Bits]



             50
      009D52                        162 UPDATCP:
      009D52 CD 87 FE         [ 4]  163 	call CPP 
      009D55 CD 85 63         [ 4]  164 	call AT 
      009D58 CD 9C F9         [ 4]  165 	call EEPCP 
      009D5B CC 9F 1F         [ 2]  166 	jp EESTORE 
                                    167 
                                    168 ;----------------------------------
                                    169 ; update APP_VP with VP 
                                    170 ; UPDAT-VP ( -- )
                                    171 ;----------------------------------
      009D5E 9D 49                  172 	.word LINK
                           001CE0   173 	LINK=.
      009D60 08                     174 	.byte 8 
      009D61 55 50 44 41 54 2D 56   175 	.ascii "UPDAT-VP" 
             50
      009D69                        176 UPDATVP:
      009D69 CD 87 F0         [ 4]  177 	call VPP 
      009D6C CD 85 63         [ 4]  178 	call AT
      009D6F CD 9D 0F         [ 4]  179 	call EEPVP 
      009D72 CC 9F 1F         [ 2]  180 	jp EESTORE
                                    181 	
                           000001   182 .if NUCLEO
                                    183 ;----------------------------------
                                    184 ; fetch integer at address over 65535
                                    185 ;  F@   ( ud -- n )
                                    186 ;----------------------------------
      009D75 9D 60                  187     .word LINK 
                           001CF7   188 LINK=.
      009D77 02                     189     .byte 2
      009D78 46 40                  190     .ascii "F@"
      009D7A                        191 FARAT:
      009D7A CD 9C 95         [ 4]  192     call FPSTOR
      009D7D CC 9E 42         [ 2]  193 	jp EE_READ 
                                    194 
                                    195 
                                    196 ;-------------------------------------
                                    197 ; fetch C at address over 65535 
                                    198 ; FC@ ( ud -- c)
                                    199 ;-------------------------------------
      009D80 9D 77                  200     .word LINK
                           001D02   201     LINK=.
      009D82 03                     202     .byte 3 
      009D83 46 43 40               203     .ascii "FC@" 
      009D86                        204 FARCAT:
      009D86 CD 9C 95         [ 4]  205     call FPSTOR
      009D89 CC 9E 64         [ 2]  206 	jp EE_CREAD  
                                    207 .endif ; NUCLEO 
                                    208 
                                    209 ;----------------------------------
                                    210 ; UNLOCK EEPROM/OPT for writing/erasing
                                    211 ; wait endlessly for FLASH_IAPSR_DUL bit.
                                    212 ;  UNLKEE   ( -- )
                                    213 ;----------------------------------
      009D8C 9D 82                  214     .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]



                           001D0E   215 LINK=.
      009D8E 06                     216     .byte 6 
      009D8F 55 4E 4C 4B 45 45      217     .ascii "UNLKEE"
      009D95                        218 UNLKEE:
      009D95 35 00 50 5B      [ 1]  219 	mov FLASH_CR2,#0 
      009D99 35 FF 50 5C      [ 1]  220 	mov FLASH_NCR2,#0xFF 
      009D9D 35 AE 50 64      [ 1]  221 	mov FLASH_DUKR,#FLASH_DUKR_KEY1
      009DA1 35 56 50 64      [ 1]  222     mov FLASH_DUKR,#FLASH_DUKR_KEY2
      009DA5 72 07 50 5F FB   [ 2]  223 	btjf FLASH_IAPSR,#FLASH_IAPSR_DUL,.
      009DAA 81               [ 4]  224 	ret
                                    225 
                                    226 ;----------------------------------
                                    227 ; UNLOCK FLASH for writing/erasing
                                    228 ; wait endlessly for FLASH_IAPSR_PUL bit.
                                    229 ; UNLKFL  ( -- )
                                    230 ;----------------------------------
      009DAB 9D 8E                  231     .word LINK 
                           001D2D   232 LINK=. 
      009DAD 06                     233     .byte 6 
      009DAE 55 4E 4C 4B 46 4C      234     .ascii "UNLKFL"    
      009DB4                        235 UNLKFL:
      009DB4 35 00 50 5B      [ 1]  236 	mov FLASH_CR2,#0 
      009DB8 35 FF 50 5C      [ 1]  237 	mov FLASH_NCR2,#0xFF 
      009DBC 35 56 50 62      [ 1]  238 	mov FLASH_PUKR,#FLASH_PUKR_KEY1
      009DC0 35 AE 50 62      [ 1]  239 	mov FLASH_PUKR,#FLASH_PUKR_KEY2
      009DC4 72 03 50 5F FB   [ 2]  240 	btjf FLASH_IAPSR,#FLASH_IAPSR_PUL,.
      009DC9 81               [ 4]  241 	ret
                                    242 
                                    243 ;-----------------------------
                                    244 ; UNLOCK FLASH or EEPROM 
                                    245 ; according to FPTR address 
                                    246 ;  UNLOCK ( -- )
                                    247 ;-----------------------------
      009DCA 9D AD                  248 	.word LINK 
                           001D4C   249 	LINK=.
      009DCC 06                     250 	.byte 6
      009DCD 55 4E 4C 4F 43 4B      251 	.ascii "UNLOCK"
      009DD3                        252 UNLOCK:
                                    253 ; put addr[15:0] in Y, for bounds check.
      009DD3 90 BE 35         [ 2]  254 	ldw y,PTR16   ; Y=addr15:0
                                    255 ; check addr[23:16], if <> 0 then it is extened flash memory
      009DD6 3D 34            [ 1]  256 	tnz FPTR 
      009DD8 26 16            [ 1]  257 	jrne 4$
      009DDA 90 A3 80 00      [ 2]  258     cpw y,#FLASH_BASE
      009DDE 24 10            [ 1]  259     jruge 4$
      009DE0 90 A3 40 00      [ 2]  260 	cpw y,#EEPROM_BASE  
      009DE4 25 0D            [ 1]  261     jrult 9$
      009DE6 90 A3 48 7F      [ 2]  262 	cpw y,#OPTION_END 
      009DEA 22 07            [ 1]  263 	jrugt 9$
      009DEC CD 9D 95         [ 4]  264 	call UNLKEE
      009DEF 81               [ 4]  265 	ret 
      009DF0 CD 9D B4         [ 4]  266 4$: call UNLKFL
      009DF3 81               [ 4]  267 9$: ret 
                                    268 
                                    269 ;-------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]



                                    270 ; LOCK write access to 
                                    271 ; FLASH and EEPROM 
                                    272 ; LOCK ( -- )
                                    273 ;-------------------------
      009DF4 9D CC                  274 	.word LINK 
                           001D76   275 	LINK=.
      009DF6 04                     276 	.byte 4 
      009DF7 4C 4F 43 4B            277 	.ascii "LOCK" 
      009DFB                        278 LOCK: 
      009DFB 72 13 50 5F      [ 1]  279 	bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      009DFF 72 17 50 5F      [ 1]  280 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      009E03 81               [ 4]  281 	ret 
                                    282 
                                    283 ;-------------------------
                                    284 ; increment FPTR 
                                    285 ; INC-FPTR ( -- )
                                    286 ;-------------------------
      009E04 9D F6                  287 	.word LINK 
                           001D86   288 	LINK=. 
      009E06 08                     289 	.byte 8 
      009E07 49 4E 43 2D 46 50 54   290 	.ascii "INC-FPTR" 
             52
      009E0F                        291 INC_FPTR:
      009E0F 3C 36            [ 1]  292 	inc PTR8 
      009E11 26 0C            [ 1]  293 	jrne 1$
      009E13 90 89            [ 2]  294 	pushw y 
      009E15 90 BE 34         [ 2]  295 	ldw y,FPTR 
      009E18 90 5C            [ 1]  296 	incw y 
      009E1A 90 BF 34         [ 2]  297 	ldw FPTR,y
      009E1D 90 85            [ 2]  298 	popw y  
      009E1F 81               [ 4]  299 1$: ret 
                                    300 
                                    301 ;------------------------------
                                    302 ; add u to FPTR 
                                    303 ; PTR+ ( u -- )
                                    304 ;------------------------------
      009E20 9E 06                  305 	.word LINK 
                           001DA2   306 	LINK=.
      009E22 04                     307 	.byte 4 
      009E23 50 54 52 2B            308 	.ascii "PTR+"
      009E27                        309 PTRPLUS:
      009E27 90 93            [ 1]  310 	ldw y,x 
      009E29 1C 00 02         [ 2]  311 	addw x,#CELLL 
      009E2C 72 B9 00 35      [ 2]  312 	addw y,PTR16 
      009E30 90 BF 35         [ 2]  313 	ldw PTR16,y  
      009E33 24 02            [ 1]  314 	jrnc 1$
      009E35 3C 34            [ 1]  315 	inc FPTR 
      009E37 81               [ 4]  316 1$: ret 
                                    317 
                                    318 ;---------------------------------
                                    319 ; read word at address pointed FPTR
                                    320 ; increment FPTR 
                                    321 ; EE-READ ( -- w )
                                    322 ;------------------------------------
      009E38 9E 22                  323 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
Hexadecimal [24-Bits]



                           001DBA   324 	LINK=.
      009E3A 07                     325 	.byte 7 
      009E3B 45 45 2D 52 45 41 44   326 	.ascii "EE-READ"
      009E42                        327 EE_READ:
      009E42 1D 00 02         [ 2]  328 	subw x,#CELLL 
      009E45 92 BC 00 34      [ 5]  329 	ldf a,[FPTR]
      009E49 90 95            [ 1]  330 	ld yh,a 
      009E4B CD 9E 0F         [ 4]  331 	call INC_FPTR 
      009E4E 92 BC 00 34      [ 5]  332 	ldf a,[FPTR]
      009E52 CD 9E 0F         [ 4]  333 	call INC_FPTR 
      009E55 90 97            [ 1]  334 	ld yl,a 
      009E57 FF               [ 2]  335 	ldw (x),y 
      009E58 81               [ 4]  336 	ret 
                                    337 
                                    338 ;---------------------------------------
                                    339 ; Read byte at address pointed by FPTR 
                                    340 ; EE-CREAD ( -- c )
                                    341 ;---------------------------------------
      009E59 9E 3A                  342 	.word LINK 
                           001DDB   343 	LINK=.
      009E5B 08                     344 	.byte 8
      009E5C 45 45 2D 43 52 45 41   345 	.ascii "EE-CREAD" 
             44
      009E64                        346 EE_CREAD:
      009E64 1D 00 02         [ 2]  347 	subw x,#CELLL 
      009E67 92 BC 00 34      [ 5]  348 	ldf a,[FPTR]	
      009E6B CD 9E 0F         [ 4]  349 	call INC_FPTR
      009E6E 90 5F            [ 1]  350 	clrw y 
      009E70 90 97            [ 1]  351 	ld yl,a 
      009E72 FF               [ 2]  352 	ldw (x),y 
      009E73 81               [ 4]  353 	ret 
                                    354 
                                    355 ;----------------------------
                                    356 ; write a byte at address pointed 
                                    357 ; by FPTR and increment FPTR.
                                    358 ; Expect pointer already initialized 
                                    359 ; and memory unlocked 
                                    360 ; WR-BYTE ( c -- )
                                    361 ;----------------------------
      009E74 9E 5B                  362 	.word LINK 
                           001DF6   363 	LINK=. 
      009E76 07                     364 	.byte 7 
      009E77 57 52 2D 42 59 54 45   365 	.ascii "WR-BYTE" 
                                    366 
      009E7E                        367 WR_BYTE:
      009E7E CD 84 E3         [ 4]  368 	call FC_XOFF
      009E81 90 93            [ 1]  369 	ldw y,x 
      009E83 90 FE            [ 2]  370 	ldw y,(y)
      009E85 1C 00 02         [ 2]  371 	addw x,#CELLL 
      009E88 90 9F            [ 1]  372 	ld a,yl
      009E8A 92 BD 00 34      [ 4]  373 	ldf [FPTR],a
      009E8E 72 05 50 5F FB   [ 2]  374 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009E93 CD 84 CD         [ 4]  375 	call FC_XON
      009E96 CC 9E 0F         [ 2]  376 	jp INC_FPTR 
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
      009E99 9E 76                  385 	.word LINK 
                           001E1B   386 	LINK=.
      009E9B 07                     387 	.byte 7 
      009E9C 57 52 2D 57 4F 52 44   388 	.ascii "WR-WORD" 
      009EA3                        389 WR_WORD:
      009EA3 CD 84 E3         [ 4]  390 	call FC_XOFF
      009EA6 90 93            [ 1]  391 	ldw y,x
      009EA8 90 FE            [ 2]  392 	ldw y,(y)
      009EAA 1C 00 02         [ 2]  393 	addw x,#CELLL 
      009EAD 90 9E            [ 1]  394 	ld a,yh 
      009EAF 92 BD 00 34      [ 4]  395 	ldf [FPTR],a
      009EB3 72 05 50 5F FB   [ 2]  396 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009EB8 CD 9E 0F         [ 4]  397 	call INC_FPTR 
      009EBB 90 9F            [ 1]  398 	ld a,yl 
      009EBD 92 BD 00 34      [ 4]  399 	ldf [FPTR],a
      009EC1 72 05 50 5F FB   [ 2]  400 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009EC6 CD 84 CD         [ 4]  401 	call FC_XON
      009EC9 CC 9E 0F         [ 2]  402 	jp INC_FPTR 
                                    403 
                                    404 
                                    405 ;---------------------------------------
                                    406 ; write a byte to FLASH or EEPROM/OPTION  
                                    407 ; EEC!  (c ud -- )
                                    408 ;---------------------------------------
      009ECC 9E 9B                  409     .word LINK 
                           001E4E   410 	LINK=.
      009ECE 04                     411     .byte 4 
      009ECF 45 45 43 21            412     .ascii "EEC!"
                                    413 	; local variables 
                           000001   414 	BTW = 1   ; byte to write offset on stack
                           000002   415     OPT = 2 
                           000002   416 	VSIZE = 2
      009ED3                        417 EECSTORE:
      009ED3 52 02            [ 2]  418 	sub sp,#VSIZE
      009ED5 CD 9C 95         [ 4]  419     call FPSTOR
      009ED8 E6 01            [ 1]  420 	ld a,(1,x)
      009EDA 43               [ 1]  421 	cpl a 
      009EDB 6B 01            [ 1]  422 	ld (BTW,sp),a ; byte to write 
      009EDD 0F 02            [ 1]  423 	clr (OPT,sp)  ; OPTION flag
      009EDF CD 9D D3         [ 4]  424 	call UNLOCK 
                                    425 	; check if option
      009EE2 3D 34            [ 1]  426 	tnz FPTR 
      009EE4 26 19            [ 1]  427 	jrne 2$
      009EE6 90 BE 35         [ 2]  428 	ldw y,PTR16 
      009EE9 90 A3 48 00      [ 2]  429 	cpw y,#OPTION_BASE
      009EED 2B 10            [ 1]  430 	jrmi 2$
      009EEF 90 A3 48 80      [ 2]  431 	cpw y,#OPTION_END+1
      009EF3 2A 0A            [ 1]  432 	jrpl 2$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]



      009EF5 03 02            [ 1]  433 	cpl (OPT,sp)
                                    434 	; OPTION WRITE require this UNLOCK 
      009EF7 72 1E 50 5B      [ 1]  435     bset FLASH_CR2,#FLASH_CR2_OPT
      009EFB 72 1F 50 5C      [ 1]  436     bres FLASH_NCR2,#FLASH_CR2_OPT 
      009EFF                        437 2$: 
      009EFF CD 9E 7E         [ 4]  438 	call WR_BYTE 	
      009F02 0D 02            [ 1]  439 	tnz (OPT,sp)
      009F04 27 0D            [ 1]  440 	jreq 3$ 
      009F06 7B 01            [ 1]  441     ld a,(BTW,sp)
      009F08 90 5F            [ 1]  442     clrw y
      009F0A 90 97            [ 1]  443 	ld yl,a 
      009F0C 1D 00 02         [ 2]  444 	subw x,#CELLL 
      009F0F FF               [ 2]  445 	ldw (x),y 
      009F10 CD 9E 7E         [ 4]  446 	call WR_BYTE
      009F13                        447 3$: 
      009F13 CD 9D FB         [ 4]  448 	call LOCK 
      009F16 5B 02            [ 2]  449 	addw sp,#VSIZE 
      009F18 81               [ 4]  450     ret
                                    451 
                                    452 ;------------------------------
                                    453 ; write integer in FLASH|EEPROM
                                    454 ; EE! ( n ud -- )
                                    455 ;------------------------------
      009F19 9E CE                  456 	.word LINK 
                           001E9B   457 	LINK=.
      009F1B 03                     458 	.byte 3 
      009F1C 45 45 21               459 	.ascii "EE!"
      009F1F                        460 EESTORE:
      009F1F CD 9C 95         [ 4]  461 	call FPSTOR 
      009F22 CD 9D D3         [ 4]  462 	call UNLOCK 
      009F25 90 93            [ 1]  463 	ldw y,x 
      009F27 90 FE            [ 2]  464 	ldw y,(y)
      009F29 90 89            [ 2]  465 	pushw y 
      009F2B 90 5E            [ 1]  466 	swapw y 
      009F2D FF               [ 2]  467 	ldw (x),y 
      009F2E CD 9E 7E         [ 4]  468 	call WR_BYTE 
      009F31 90 85            [ 2]  469 	popw y 
      009F33 1D 00 02         [ 2]  470 	subw x,#CELLL
      009F36 FF               [ 2]  471 	ldw (x),y 
      009F37 CD 9E 7E         [ 4]  472 	call WR_BYTE
      009F3A CC 9D FB         [ 2]  473 	jp LOCK 
                                    474 
                                    475 
                                    476 ;----------------------------
                                    477 ; Erase flash memory row 
                                    478 ; stm8s208 as 128 bytes rows
                                    479 ; ROW-ERASE ( ud -- )
                                    480 ;----------------------------
      009F3D 9F 1B                  481 	.word LINK 
                           001EBF   482 	LINK=. 
      009F3F 09                     483 	.byte 9 
      009F40 52 4F 57 2D 45 52 41   484 	.ascii "ROW-ERASE" 
             53 45
      009F49                        485 row_erase:
      009F49 CD 84 E3         [ 4]  486 	call FC_XOFF
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]



      009F4C CD 9C 95         [ 4]  487 	call FPSTOR
                                    488 ;code must be execute from RAM 
                                    489 ;copy routine to PAD 
      009F4F 1D 00 02         [ 2]  490 	subw x,#CELLL 
      009F52 90 AE 9F A2      [ 2]  491 	ldw y,#row_erase_proc
      009F56 FF               [ 2]  492 	ldw (x),y 
      009F57 CD 8D 8C         [ 4]  493 	call PAD 
      009F5A 90 AE 9F C9      [ 2]  494 	ldw y,#row_erase_proc_end 
      009F5E 72 A2 9F A2      [ 2]  495 	subw y,#row_erase_proc
      009F62 1D 00 02         [ 2]  496 	subw x,#CELLL 
      009F65 FF               [ 2]  497 	ldw (x),y 
      009F66 CD 8D C8         [ 4]  498 	call CMOVE 
      009F69                        499 block_erase:
      009F69 90 BE 35         [ 2]  500 	ldw y,FPTR+1
      009F6C 90 A3 B6 80      [ 2]  501 	cpw y,#app_space 
      009F70 2A 19            [ 1]  502 	jrpl erase_flash 
                                    503 ; erase EEPROM block
      009F72 90 A3 40 00      [ 2]  504 	cpw y,#EEPROM_BASE 
      009F76 24 04            [ 1]  505 	jruge 1$
      009F78 CD 84 CD         [ 4]  506 	call FC_XON
      009F7B 81               [ 4]  507 	ret ; bad address 
      009F7C 90 A3 47 FF      [ 2]  508 1$: cpw y,#EEPROM_END 
      009F80 23 04            [ 2]  509 	jrule 2$ 
      009F82 CD 84 CD         [ 4]  510 	call FC_XON
      009F85 81               [ 4]  511 	ret ; bad address 
      009F86                        512 2$:	
      009F86 CD 9D 95         [ 4]  513 	call UNLKEE 
      009F89 20 03            [ 2]  514 	jra proceed_erase
                                    515 ; erase flash block:
      009F8B                        516 erase_flash:
      009F8B CD 9D B4         [ 4]  517 	call UNLKFL 
      009F8E                        518 proceed_erase:
      009F8E CD 8D 8C         [ 4]  519 	call PAD 
      009F91 90 93            [ 1]  520 	ldw y,x
      009F93 90 FE            [ 2]  521 	ldw y,(y)
      009F95 1C 00 02         [ 2]  522 	addw x,#CELLL  
      009F98 90 FD            [ 4]  523 	call (y) 
      009F9A 72 17 50 5F      [ 1]  524 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      009F9E CD 84 CD         [ 4]  525 	call FC_XON
      009FA1 81               [ 4]  526 	ret 
                                    527 
                                    528 ; this routine is to be copied to PAD 
      009FA2                        529 row_erase_proc:
      009FA2 35 20 50 5B      [ 1]  530 	mov FLASH_CR2,#(1<<FLASH_CR2_ERASE) 
      009FA6 35 DF 50 5C      [ 1]  531 	mov FLASH_NCR2,#~(1<<FLASH_CR2_ERASE)
      009FAA 4F               [ 1]  532 	clr a 
      009FAB 90 5F            [ 1]  533 	clrw y 
      009FAD 91 A7 00 34      [ 1]  534 	ldf ([FPTR],y),a
      009FB1 90 5C            [ 1]  535     incw y
      009FB3 91 A7 00 34      [ 1]  536 	ldf ([FPTR],y),a
      009FB7 90 5C            [ 1]  537     incw y
      009FB9 91 A7 00 34      [ 1]  538 	ldf ([FPTR],y),a
      009FBD 90 5C            [ 1]  539     incw y
      009FBF 91 A7 00 34      [ 1]  540 	ldf ([FPTR],y),a
      009FC3 72 05 50 5F FB   [ 2]  541 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]



      009FC8 81               [ 4]  542 	ret
      009FC9                        543 row_erase_proc_end:
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
      009FC9                        556 copy_buffer:
      009FC9 4B 80            [ 1]  557 	push #BLOCK_SIZE  
                                    558 ;enable block programming 
      009FCB 72 10 50 5B      [ 1]  559 	bset FLASH_CR2,#FLASH_CR2_PRG 
      009FCF 72 11 50 5C      [ 1]  560 	bres FLASH_NCR2,#FLASH_CR2_PRG
      009FD3 90 5F            [ 1]  561 	clrw y
      009FD5 F6               [ 1]  562 1$:	ld a,(x)
      009FD6 91 A7 00 34      [ 1]  563 	ldf ([FPTR],y),a
      009FDA 5C               [ 1]  564 	incw x 
      009FDB 90 5C            [ 1]  565 	incw y 
      009FDD 0A 01            [ 1]  566 	dec (BCNT,sp)
      009FDF 26 F4            [ 1]  567 	jrne 1$
                                    568 ; wait EOP bit 
      009FE1 72 05 50 5F FB   [ 2]  569 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. 
      009FE6 84               [ 1]  570 	pop a ; remove BCNT from stack 
      009FE7 81               [ 4]  571 	ret 
      009FE8                        572 copy_buffer_end:
                                    573 
                                    574 ;-------------------------
                                    575 ; move program_row to RAM 
                                    576 ; in TIB 
                                    577 ;------------------------
      009FE8                        578 copy_prog_to_ram:
      009FE8 1D 00 06         [ 2]  579 	subw x,#6
      009FEB 90 AE 9F C9      [ 2]  580 	ldw y,#copy_buffer 
      009FEF EF 04            [ 2]  581 	ldw (4,x),y 
      009FF1 90 AE 17 00      [ 2]  582 	ldw y,#TIBBASE
      009FF5 EF 02            [ 2]  583 	ldw (2,x),y 
      009FF7 90 AE 9F E8      [ 2]  584 	ldw y,#copy_buffer_end 
      009FFB 72 A2 9F C9      [ 2]  585 	subw y,#copy_buffer  
      009FFF FF               [ 2]  586 	ldw (x),y 
      00A000 CD 8D C8         [ 4]  587 	call CMOVE 
      00A003 81               [ 4]  588 	ret 
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



      00A004 9F 3F                  597 	.word LINK 
                           001F86   598 	LINK=.
      00A006 06                     599 	.byte 6 
      00A007 57 52 2D 52 4F 57      600 	.ascii "WR-ROW"
      00A00D                        601 write_row:
      00A00D CD 84 E3         [ 4]  602 	call FC_XOFF
      00A010 CD 9C 95         [ 4]  603 	call FPSTOR
                                    604 ; align to FLASH block 
      00A013 A6 80            [ 1]  605 	ld a,#0x80 
      00A015 B4 36            [ 1]  606 	and a,PTR8 
      00A017 B7 36            [ 1]  607 	ld PTR8,a  
      00A019 CD 9F E8         [ 4]  608 	call copy_prog_to_ram
      00A01C CD 9D D3         [ 4]  609 	call UNLOCK
      00A01F 90 93            [ 1]  610 	ldw y,x 
      00A021 90 FE            [ 2]  611 	ldw y,(y)
      00A023 1C 00 02         [ 2]  612 	addw x,#CELLL 
      00A026 89               [ 2]  613 	pushw x 
      00A027 93               [ 1]  614 	ldw x,y ; buffer address in x 
      00A028 CD 17 00         [ 4]  615 	call TIBBASE
      00A02B CD 9D FB         [ 4]  616 	call LOCK
      00A02E 85               [ 2]  617 	popw x 
      00A02F CD 84 CD         [ 4]  618 	call FC_XON 
      00A032 81               [ 4]  619 	ret 
                                    620 
                                    621 ;-------------------------------------
                                    622 ; change value of OPTION register 
                                    623 ; SET-OPT (c n -- ) 
                                    624 ; c new value.
                                    625 ; n OPT  number {1..7}
                                    626 ;--------------------------------------
      00A033 A0 06                  627 		.word LINK 
                           001FB5   628 		LINK=.
      00A035 07                     629 		.byte 7 
      00A036 53 45 54 2D 4F 50 54   630 		.ascii "SET-OPT" 
      00A03D                        631 set_option: 
      00A03D 90 93            [ 1]  632 		ldw y,x 
      00A03F 90 FE            [ 2]  633 		ldw y,(y)
      00A041 27 06            [ 1]  634 		jreq 1$
      00A043 90 A3 00 07      [ 2]  635 		cpw y,#7 
      00A047 23 04            [ 2]  636 		jrule 2$ 
                                    637 ; invalid OPTION number 		
      00A049 1C 00 04         [ 2]  638 1$:		addw x,#2*CELLL
      00A04C 81               [ 4]  639 		ret
      00A04D 90 58            [ 2]  640 2$:		sllw y 
      00A04F 72 A9 47 FF      [ 2]  641 		addw y,#OPTION_BASE-1
      00A053 FF               [ 2]  642 		ldw (x),y 
      00A054 1D 00 02         [ 2]  643 		subw x,#CELLL 
      00A057 90 5F            [ 1]  644 		clrw y 
      00A059 FF               [ 2]  645 		ldw (x),y 
      00A05A CD 9E D3         [ 4]  646 		call EECSTORE
      00A05D 81               [ 4]  647 		ret 
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
      00A05E A0 35                  656 	.word LINK  
                           001FE0   657 	LINK=.
      00A060 08                     658 	.byte 8 
      00A061 50 52 49 53 54 49 4E   659 	.ascii "PRISTINE"
             45
      00A069                        660 pristine:
                                    661 ;;; erase EEPROM
      00A069 CD 9C B4         [ 4]  662 	call EEPROM 
      00A06C CD 88 A7         [ 4]  663 1$:	call DDUP 
      00A06F CD 9F 49         [ 4]  664 	call row_erase
      00A072 90 93            [ 1]  665 	ldw y,x 
      00A074 90 EE 02         [ 2]  666 	ldw y,(2,y)
      00A077 72 A9 00 80      [ 2]  667 	addw y,#BLOCK_SIZE
      00A07B EF 02            [ 2]  668 	ldw (2,x),y
      00A07D 90 A3 48 00      [ 2]  669 	cpw y,#OPTION_BASE 
      00A081 25 E9            [ 1]  670 	jrult 1$
                                    671 ;;; reset OPTION to default values
      00A083 90 AE 00 01      [ 2]  672 	ldw y,#1 ; OPT1 
      00A087 FF               [ 2]  673 2$:	ldw (x),y   
      00A088 90 5F            [ 1]  674 	clrw y 
      00A08A EF 02            [ 2]  675 	ldw (2,x),y  ; ( 0 1 -- ) 
      00A08C CD 88 A7         [ 4]  676 	call DDUP    ; ( 0 1 0 1 -- )  
      00A08F CD A0 3D         [ 4]  677 	call set_option
      00A092 90 93            [ 1]  678 	ldw y,x 
      00A094 90 FE            [ 2]  679 	ldw y,(y)
      00A096 90 5C            [ 1]  680 	incw y  ; next OPTION 
      00A098 90 A3 00 08      [ 2]  681 	cpw y,#8 
      00A09C 25 E9            [ 1]  682 	jrult 2$
                                    683 ;;; erase first row of app_space 	
      00A09E 90 AE B6 80      [ 2]  684 	ldw y,#app_space
      00A0A2 EF 02            [ 2]  685 	ldw (2,x),y  
      00A0A4 90 5F            [ 1]  686 	clrw y 
      00A0A6 FF               [ 2]  687 	ldw (x),y ; ( app_space 0 -- )
      00A0A7 CD 9F 49         [ 4]  688 	call row_erase 
                                    689 ; reset interrupt vectors 
      00A0AA 1D 00 02         [ 2]  690 	subw x,#CELLL 
      00A0AD 90 5F            [ 1]  691 	clrw y  
      00A0AF FF               [ 2]  692 4$:	ldw (x),y  ; ( n -- ) int# 
      00A0B0 CD 86 99         [ 4]  693 	call DUPP  
      00A0B3 CD A0 D0         [ 4]  694 	call reset_vector
      00A0B6 90 93            [ 1]  695 	ldw y,x 
      00A0B8 90 FE            [ 2]  696 	ldw y,(y)
      00A0BA 90 5C            [ 1]  697 	incw y   ; next vector 
      00A0BC 90 A3 00 19      [ 2]  698 	cpw y,#25 
      00A0C0 25 ED            [ 1]  699 	jrult 4$
      00A0C2 CC 80 80         [ 2]  700 	jp NonHandledInterrupt ; reset MCU
                                    701 
                                    702 ;------------------------------
                                    703 ; reset an interrupt vector 
                                    704 ; to its initial value 
                                    705 ; i.e. NonHandledInterrupt
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 120.
Hexadecimal [24-Bits]



                                    706 ; RST-IVEC ( n -- )
                                    707 ;-----------------------------
      00A0C5 A0 60                  708 	.word LINK 
                           002047   709 	LINK=. 
      00A0C7 08                     710 	.byte 8 
      00A0C8 52 53 54 2D 49 56 45   711 	.ascii "RST-IVEC"
             43
      00A0D0                        712 reset_vector:
      00A0D0 90 93            [ 1]  713 	ldw y,x
      00A0D2 1C 00 02         [ 2]  714 	addw x,#CELLL 
      00A0D5 90 FE            [ 2]  715 	ldw y,(y)
      00A0D7 90 A3 00 17      [ 2]  716 	cpw y,#23 
      00A0DB 27 3A            [ 1]  717 	jreq 9$
      00A0DD 90 A3 00 1D      [ 2]  718 	cpw y,#29 ; last vector
      00A0E1 22 34            [ 1]  719 	jrugt 9$  
      00A0E3 90 58            [ 2]  720 	sllw y 
      00A0E5 90 58            [ 2]  721 	sllw y 
      00A0E7 72 A9 80 08      [ 2]  722 	addw y,#0x8008 ; irq0 address 
      00A0EB 90 BF 26         [ 2]  723 	ldw YTEMP,y
      00A0EE 1D 00 06         [ 2]  724 	subw x,#3*CELLL 
      00A0F1 EF 02            [ 2]  725 	ldw (2,x),y 
      00A0F3 90 5F            [ 1]  726 	clrw y
      00A0F5 FF               [ 2]  727 	ldw (x),y 
      00A0F6 A6 82            [ 1]  728 	ld a,#0x82 
      00A0F8 90 95            [ 1]  729 	ld yh,a
      00A0FA EF 04            [ 2]  730 	ldw (4,x),y
      00A0FC CD 9F 1F         [ 4]  731 	call EESTORE
      00A0FF 1D 00 06         [ 2]  732 	subw x,#3*CELLL
      00A102 90 5F            [ 1]  733 	clrw y 
      00A104 FF               [ 2]  734 	ldw (x),y 
      00A105 90 AE 80 80      [ 2]  735 	ldw y,#NonHandledInterrupt
      00A109 EF 04            [ 2]  736 	ldw (4,x),y 
      00A10B 90 BE 26         [ 2]  737 	ldw y,YTEMP  
      00A10E 72 A9 00 02      [ 2]  738 	addw y,#2
      00A112 EF 02            [ 2]  739 	ldw (2,x),y 
      00A114 CD 9F 1F         [ 4]  740 	call EESTORE
      00A117 81               [ 4]  741 9$:	ret 
                                    742 
                                    743 
                                    744 ;------------------------------
                                    745 ; all interrupt vector with 
                                    746 ; an address >= a are resetted 
                                    747 ; to default
                                    748 ; CHKIVEC ( a -- )
                                    749 ;------------------------------
      00A118 A0 C7                  750 	.word LINK 
                           00209A   751 	LINK=.
      00A11A 07                     752 	.byte 7
      00A11B 43 48 4B 49 56 45 43   753 	.ascii "CHKIVEC"
                                    754 ;local variables 
                           000001   755 	SSP=1
                           000003   756 	CADR=3
                           000005   757 	OFS=5
                           000006   758 	VSIZE=6  
      00A122                        759 CHKIVEC:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 121.
Hexadecimal [24-Bits]



      00A122 52 06            [ 2]  760 	sub sp,#VSIZE ;alloc local variables 
      00A124 90 93            [ 1]  761 	ldw y,x 
      00A126 90 FE            [ 2]  762 	ldw y,(y)
      00A128 17 03            [ 2]  763 	ldw (CADR,sp),y ; ca 
      00A12A 1F 01            [ 2]  764 	ldw (SSP,sp),x 
      00A12C AE 80 0A         [ 2]  765 	ldw x,#0x800a ; irq0 address 
      00A12F BF 35            [ 2]  766 	ldw PTR16,X
      00A131 AE FF FC         [ 2]  767 	ldw x,#-4 
      00A134 1C 00 04         [ 2]  768 1$:	addw x,#4
      00A137 A3 00 78         [ 2]  769 	cpw x,#30*4 ; irq0-29 
      00A13A 27 22            [ 1]  770 	jreq 9$
      00A13C 90 93            [ 1]  771 	ldw y,x  
      00A13E 91 D6 35         [ 4]  772 	ld a,([PTR16],y)
      00A141 11 03            [ 1]  773 	cp a,(CADR,sp)
      00A143 25 EF            [ 1]  774 	jrult 1$
      00A145 90 5C            [ 1]  775 	incw y 
      00A147 91 D6 35         [ 4]  776 	ld a,([PTR16],y)
      00A14A 11 04            [ 1]  777 	cp a,(CADR+1,sp) 
      00A14C 25 E6            [ 1]  778 	jrult 1$ 
      00A14E 1F 05            [ 2]  779 	ldw (OFS,sp),x 
      00A150 54               [ 2]  780 	srlw x
      00A151 54               [ 2]  781 	srlw x 
      00A152 90 93            [ 1]  782 	ldw y,x 
      00A154 1E 01            [ 2]  783 	ldw x,(SSP,sp)
      00A156 FF               [ 2]  784 	ldw (x),y
      00A157 CD A0 D0         [ 4]  785 	call reset_vector
      00A15A 1E 05            [ 2]  786 	ldw x,(OFS,sp) 
      00A15C 20 D6            [ 2]  787 	jra 1$
      00A15E 1E 01            [ 2]  788 9$:	ldw x,(SSP,sp) 
      00A160 1C 00 02         [ 2]  789 	addw x,#CELLL 
      00A163 5B 06            [ 2]  790 	addw sp,#VSIZE ; drop local variables  
      00A165 81               [ 4]  791 	ret 
                                    792 
                                    793 ;------------------------------
                                    794 ; set interrupt vector 
                                    795 ; SET-IVEC ( ud n -- )
                                    796 ;  ud Handler address
                                    797 ;  n  vector # 0 .. 29 
                                    798 ;-----------------------------
      00A166 A1 1A                  799 	.word LINK
                           0020E8   800 	LINK=.
      00A168 08                     801 	.byte 8 
      00A169 53 45 54 2D 49 56 45   802 	.ascii "SET-IVEC" 
             43
      00A171                        803 set_vector:
      00A171 90 93            [ 1]  804     ldw y,x 
      00A173 1C 00 02         [ 2]  805 	addw x,#CELLL 
      00A176 90 FE            [ 2]  806 	ldw y,(y) ; vector #
      00A178 90 A3 00 1D      [ 2]  807 	cpw y,#29 ; last vector
      00A17C 23 04            [ 2]  808 	jrule 2$
      00A17E 1C 00 04         [ 2]  809 	addw x,#2*CELLL 
      00A181 81               [ 4]  810 	ret
      00A182 90 58            [ 2]  811 2$:	sllw y 
      00A184 90 58            [ 2]  812 	sllw y 
      00A186 72 A9 80 08      [ 2]  813 	addw y,#0X8008 ; IRQ0 vector address 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 122.
Hexadecimal [24-Bits]



      00A18A 90 BF 26         [ 2]  814 	ldw YTEMP,y ; vector address 
      00A18D A6 82            [ 1]  815 	ld a,#0x82 
      00A18F 90 95            [ 1]  816 	ld yh,a 
      00A191 E6 01            [ 1]  817 	ld a,(1,x) ; isr address bits 23..16 
      00A193 90 97            [ 1]  818 	ld yl,a 
                                    819 ;  write 0x82 + most significant byte of int address	
      00A195 1D 00 06         [ 2]  820 	subw x,#3*CELLL 
      00A198 EF 04            [ 2]  821 	ldw (4,x),y 
      00A19A 90 BE 26         [ 2]  822 	ldw y,YTEMP
      00A19D EF 02            [ 2]  823 	ldw (2,x),y ; vector address 
      00A19F 90 5F            [ 1]  824 	clrw y 
      00A1A1 FF               [ 2]  825 	ldw (x),y   ; as a double 
      00A1A2 CD 9F 1F         [ 4]  826 	call EESTORE 
      00A1A5 90 93            [ 1]  827 	ldw y,x 
      00A1A7 90 EE 02         [ 2]  828 	ldw y,(2,y) ; bits 15..0 int vector 
      00A1AA 1D 00 06         [ 2]  829 	subw x,#3*CELLL 
      00A1AD EF 04            [ 2]  830 	ldw (4,x),y 
      00A1AF 90 BE 26         [ 2]  831 	ldw y,YTEMP 
      00A1B2 72 A9 00 02      [ 2]  832 	addw y,#2 
      00A1B6 EF 02            [ 2]  833 	ldw (2,x),y 
      00A1B8 90 5F            [ 1]  834 	clrw y 
      00A1BA FF               [ 2]  835 	ldw (x),y 
      00A1BB CD 9F 1F         [ 4]  836 	call EESTORE
      00A1BE 1C 00 04         [ 2]  837 	addw x,#2*CELLL  
      00A1C1 81               [ 4]  838 9$: ret 
                                    839 
                                    840 
                                    841 ;------------------------
                                    842 ; Compile word to flash
                                    843 ; EE, (w -- )
                                    844 ;-----------------------
      00A1C2 A1 68                  845 	.word LINK
                           002144   846 	LINK=.
      00A1C4 03                     847 	.byte 3
      00A1C5 45 45 2C               848 	.ascii "EE,"
      00A1C8                        849 EE_COMMA:
      00A1C8 1D 00 04         [ 2]  850 	subw x,#2*CELLL 
      00A1CB 90 BE 1A         [ 2]  851 	ldw y,UCP
      00A1CE 90 89            [ 2]  852 	pushw y 
      00A1D0 EF 02            [ 2]  853 	ldw (2,x),y 
      00A1D2 90 5F            [ 1]  854 	clrw y 
      00A1D4 FF               [ 2]  855 	ldw (x),y
      00A1D5 CD 9F 1F         [ 4]  856 	call EESTORE
      00A1D8 90 85            [ 2]  857 	popw y 
      00A1DA 72 A9 00 02      [ 2]  858 	addw y,#2
      00A1DE 90 BF 1A         [ 2]  859 	ldw UCP,y
      00A1E1 81               [ 4]  860 	ret 
                                    861 
                                    862 
                                    863 ;-------------------------
                                    864 ; Compile byte to flash 
                                    865 ; EEC, ( c -- )	
                                    866 ;-------------------------
      00A1E2 A1 C4                  867 	.word LINK 
                           002164   868 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 123.
Hexadecimal [24-Bits]



      00A1E4 04                     869 	.byte 4 
      00A1E5 45 45 43 2C            870 	.ascii "EEC,"
      00A1E9                        871 EE_CCOMMA:
      00A1E9 1D 00 04         [ 2]  872 	subw x,#2*CELLL 
      00A1EC 90 BE 1A         [ 2]  873 	ldw y,UCP
      00A1EF 90 89            [ 2]  874 	pushw y 
      00A1F1 EF 02            [ 2]  875 	ldw (2,x),y 
      00A1F3 90 5F            [ 1]  876 	clrw y 
      00A1F5 FF               [ 2]  877 	ldw (x),y
      00A1F6 CD 9E D3         [ 4]  878 	call EECSTORE
      00A1F9 90 85            [ 2]  879 	popw y 
      00A1FB 90 5C            [ 1]  880 	incw y 
      00A1FD 90 BF 1A         [ 2]  881 	ldw UCP,y
      00A200 81               [ 4]  882 	ret 
                                    883 
                                    884 
                                    885 ;--------------------------
                                    886 ; copy FLASH block to ROWBUF
                                    887 ; ROW>BUF ( ud -- )
                                    888 ;--------------------------
      00A201 A1 E4                  889 	.word LINK 
                           002183   890 	LINK=.
      00A203 07                     891 	.byte 7 
      00A204 52 4F 57 3E 42 55 46   892 	.ascii "ROW>BUF"
      00A20B                        893 ROW2BUF: 
      00A20B CD 9C 95         [ 4]  894 	call FPSTOR 
      00A20E A6 80            [ 1]  895 	ld a,#BLOCK_SIZE
      00A210 88               [ 1]  896 	push a 
      00A211 B4 36            [ 1]  897 	and a,PTR8 ; block align 
      00A213 B7 36            [ 1]  898 	ld PTR8,a
      00A215 90 AE 16 80      [ 2]  899 	ldw y,#ROWBUFF 
      00A219 92 BC 00 34      [ 5]  900 1$: ldf a,[FPTR]
      00A21D 90 F7            [ 1]  901 	ld (y),a
      00A21F CD 9E 0F         [ 4]  902 	call INC_FPTR
      00A222 90 5C            [ 1]  903 	incw y 
      00A224 0A 01            [ 1]  904 	dec (1,sp)
      00A226 26 F1            [ 1]  905 	jrne 1$ 
      00A228 84               [ 1]  906 	pop a 
      00A229 81               [ 4]  907 	ret 
                                    908 
                                    909 
                                    910 ;---------------------------
                                    911 ; copy ROWBUFF to flash 
                                    912 ; BUF>ROW ( ud -- )
                                    913 ; ud is row address as double 
                                    914 ;---------------------------
      00A22A A2 03                  915 	.word LINK 
                           0021AC   916 	LINK=.
      00A22C 07                     917 	.byte 7 
      00A22D 42 55 46 3E 52 4F 57   918 	.ascii "BUF>ROW" 
      00A234                        919 BUF2ROW:
      00A234 CD 87 9D         [ 4]  920 	call TBUF ; ( ud rb -- )
      00A237 CD 88 5D         [ 4]  921 	call ROT 
      00A23A CD 88 5D         [ 4]  922 	call ROT  ; ( rb ud -- )
      00A23D CD A0 0D         [ 4]  923 	call write_row 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 124.
Hexadecimal [24-Bits]



      00A240 81               [ 4]  924 	ret 
                                    925 
                                    926 ;---------------------------------
                                    927 ; how many byte free in that row 
                                    928 ; RFREE ( a -- n )
                                    929 ; a is least byte of target address
                                    930 ;----------------------------------
      00A241 A2 2C                  931 	.word LINK 
                           0021C3   932 	LINK=.
      00A243 05                     933 	.byte 5 
      00A244 52 46 52 45 45         934 	.ascii "RFREE"
      00A249                        935 RFREE:
      00A249 E6 01            [ 1]  936 	ld a,(1,x)
      00A24B A4 7F            [ 1]  937 	and a,#BLOCK_SIZE-1 
      00A24D B7 26            [ 1]  938 	ld YTEMP,a 
      00A24F A6 80            [ 1]  939 	ld a,#BLOCK_SIZE 
      00A251 B0 26            [ 1]  940 	sub a,YTEMP 
      00A253 90 5F            [ 1]  941 	clrw y 
      00A255 90 97            [ 1]  942 	ld yl,a
      00A257 FF               [ 2]  943 	ldw (x),y 
      00A258 81               [ 4]  944 	ret 
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
      00A259 A2 43                  955 	.word LINK 
                           0021DB   956 	LINK=. 
      00A25B 06                     957 	.byte 6
      00A25C 52 41 4D 3E 45 45      958 	.ascii "RAM>EE"
                                    959 	
      00A262                        960 RAM2EE:
                                    961 ; copy ud on top 
      00A262 90 93            [ 1]  962 	ldw y,x 
      00A264 90 EE 06         [ 2]  963 	ldw y,(6,y) ; LSW of ud  
      00A267 90 BF 26         [ 2]  964 	ldw YTEMP,y 
      00A26A 90 93            [ 1]  965 	ldw y,x 
      00A26C 90 EE 04         [ 2]  966 	ldw y,(4,y)  ; MSW of ud 
      00A26F 1D 00 04         [ 2]  967 	subw x,#2*CELLL 
      00A272 FF               [ 2]  968 	ldw (x),y 
      00A273 90 BE 26         [ 2]  969 	ldw y,YTEMP 
      00A276 EF 02            [ 2]  970 	ldw (2,x),y 
      00A278 CD A2 0B         [ 4]  971 	call ROW2BUF 
      00A27B 90 93            [ 1]  972 	ldw y,x 
      00A27D 90 EE 06         [ 2]  973 	ldw y,(6,y)
      00A280 90 89            [ 2]  974 	pushw y ; udl 
      00A282 90 9F            [ 1]  975 	ld a,yl
      00A284 A4 7F            [ 1]  976 	and a,#BLOCK_SIZE-1 
      00A286 90 5F            [ 1]  977 	clrw y 
      00A288 90 97            [ 1]  978 	ld yl,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 125.
Hexadecimal [24-Bits]



      00A28A 72 A9 16 80      [ 2]  979 	addw y,#ROWBUFF 
      00A28E 1D 00 02         [ 2]  980 	subw x,#CELLL 
      00A291 FF               [ 2]  981 	ldw (x),y  
      00A292 CD 86 A9         [ 4]  982 	call SWAPP ;  ( ud a ra u -- )
      00A295 CD 85 B4         [ 4]  983 	call RFROM  
      00A298 CD A2 49         [ 4]  984 	call RFREE 
      00A29B CD 89 FF         [ 4]  985 	call MIN
      00A29E CD 86 99         [ 4]  986 	call DUPP 
      00A2A1 CD 86 62         [ 4]  987 	call TOR  
      00A2A4 CD 8D C8         [ 4]  988 	call CMOVE
      00A2A7 CD A2 34         [ 4]  989 	call BUF2ROW 
      00A2AA CD 85 B4         [ 4]  990 	call RFROM 
      00A2AD 81               [ 4]  991 	ret 
                                    992 
                                    993 
                                    994 ;--------------------------
                                    995 ; expand 16 bit address 
                                    996 ; to 32 bit address 
                                    997 ; FADDR ( a -- ud )
                                    998 ;--------------------------
      00A2AE A2 5B                  999 	.word LINK 
                           002230  1000 	LINK=. 
      00A2B0 05                    1001 	.byte 5 
      00A2B1 46 41 44 44 52        1002 	.ascii "FADDR"
      00A2B6                       1003 FADDR:
      00A2B6 CC 8C 9E         [ 2] 1004 	jp ZERO 
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
      00A2B9 A2 B0                 1020 	.word LINK 
                           00223B  1021 	LINK=.
      00A2BB 05                    1022 	.byte 5 
      00A2BC 46 4D 4F 56 45        1023 	.ascii "FMOVE" 
      00A2C1                       1024 FMOVE:
      00A2C1 CD 87 AF         [ 4] 1025 	call TFLASH 
      00A2C4 CD 85 63         [ 4] 1026 	CALL AT 
      00A2C7 CD 85 18         [ 4] 1027 	CALL QBRAN 
      00A2CA A3 45                 1028 	.word no_move  
      00A2CC CD 87 FE         [ 4] 1029 	call CPP
      00A2CF CD 85 63         [ 4] 1030 	call AT  
      00A2D2 CD 86 99         [ 4] 1031 	call DUPP ; ( udl udl -- )
      00A2D5 CD 87 E2         [ 4] 1032 	call CNTXT 
      00A2D8 CD 85 63         [ 4] 1033 	call AT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 126.
Hexadecimal [24-Bits]



      00A2DB CD 84 EF         [ 4] 1034 	call DOLIT 
      00A2DE 00 02                 1035 	.word 2 
      00A2E0 CD 89 52         [ 4] 1036 	call SUBB ; ( udl udl a -- )
      00A2E3 CD 86 A9         [ 4] 1037 	call SWAPP 
      00A2E6 CD A2 B6         [ 4] 1038 	call FADDR 
      00A2E9 CD 88 5D         [ 4] 1039 	call ROT  ; ( udl ud a -- )
      00A2EC CD 86 99         [ 4] 1040 	call DUPP 
      00A2EF CD 86 62         [ 4] 1041 	call TOR    ; R: a 
      00A2F2                       1042 FMOVE2: 
      00A2F2 CD 8D 7B         [ 4] 1043 	call HERE 
      00A2F5 CD 85 C5         [ 4] 1044 	call RAT 
      00A2F8 CD 89 52         [ 4] 1045 	call SUBB ; (udl ud a wl -- )
      00A2FB                       1046 next_row:
      00A2FB CD 86 99         [ 4] 1047 	call DUPP 
      00A2FE CD 86 62         [ 4] 1048 	call TOR  ; ( udl ud a wl -- ) R: a wl
      00A301 CD A2 62         [ 4] 1049 	call RAM2EE ; ( udl a u -- udl u2 ) u2 is byte written to FLASH 
      00A304 CD 86 99         [ 4] 1050 	call DUPP 
      00A307 CD 86 62         [ 4] 1051 	call TOR
      00A30A CD 88 BC         [ 4] 1052 	call PLUS  ; ( udl+ ) 
      00A30D CD 86 99         [ 4] 1053 	call DUPP 
      00A310 CD 8C 9E         [ 4] 1054 	call ZERO   ; ( udl+ ud -- )
      00A313 CD 85 B4         [ 4] 1055 	call RFROM  ; ( udl+ ud u2  R: a wl ) 
      00A316 CD 85 B4         [ 4] 1056 	call RFROM  ; ( udl+ ud u2 wl R: a ) 
      00A319 CD 86 C1         [ 4] 1057 	call OVER   ; ( udl+ ud u2 wl u2 -- )
      00A31C CD 89 52         [ 4] 1058 	call SUBB  ; ( udl+ ud u2 wl- R: a )
      00A31F CD 86 99         [ 4] 1059 	call DUPP 
      00A322 CD 85 18         [ 4] 1060 	call QBRAN
      00A325 A3 3E                 1061 	.word fmove_done 
      00A327 CD 86 A9         [ 4] 1062 	call SWAPP  ; ( udl+ ud wl- u2 R: a )
      00A32A CD 85 B4         [ 4] 1063 	call RFROM ; ( udl+ ud wl- u2 a -- ) 
      00A32D CD 88 BC         [ 4] 1064 	call PLUS  ; ( udl+2 ud wl- a+ )
      00A330 CD 86 99         [ 4] 1065 	call DUPP 
      00A333 CD 86 62         [ 4] 1066 	call TOR   ; ( udl+2 ud wl- a+ ) R: a+
      00A336 CD 86 A9         [ 4] 1067 	call SWAPP 
      00A339 CD 85 34         [ 4] 1068 	call BRAN
      00A33C A2 FB                 1069 	.word next_row  
      00A33E                       1070 fmove_done:	
      00A33E CD 85 B4         [ 4] 1071 	call RFROM  ; ( -- udl+ ud u2 wl- a  )
      00A341 1C 00 0A         [ 2] 1072 	addw x,#5*CELLL ; (  -- cp+ ) new CP 
      00A344 81               [ 4] 1073  	ret  
      00A345                       1074 no_move:
      00A345 CD 8C 9E         [ 4] 1075 	call ZERO
      00A348 81               [ 4] 1076 	ret 
                                   1077 
                                   1078 ;------------------------------------------
                                   1079 ; adjust pointers after **FMOVE** operetion.
                                   1080 ; UPDAT-PTR ( cp+ -- )
                                   1081 ; cp+ is new CP position after FMOVE 
                                   1082 ;-------------------------------------------
      00A349 A2 BB                 1083 	.word LINK 
                           0022CB  1084 	LINK=.
      00A34B 09                    1085 	.byte 9
      00A34C 55 50 44 41 54 2D 50  1086 	.ascii "UPDAT-PTR" 
             54 52
      00A355                       1087 UPDATPTR:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 127.
Hexadecimal [24-Bits]



                                   1088 ;reset VP to previous position  
      00A355 CD 9D 0F         [ 4] 1089 	call EEPVP 
      0022D8                       1090 	_DROP 
      00A358 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00A35B CD 85 63         [ 4] 1091 	call AT
      00A35E CD 87 F0         [ 4] 1092 	call VPP 
      00A361 CD 85 51         [ 4] 1093 	call STORE
                                   1094 ;update CONTEXT and LAST 
      00A364 CD 9C F9         [ 4] 1095 	call EEPCP 
      0022E7                       1096 	_DROP
      00A367 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00A36A CD 85 63         [ 4] 1097 	call AT
      00A36D CD 84 EF         [ 4] 1098 	call DOLIT 
      00A370 00 02                 1099 	.word 2 
      00A372 CD 88 BC         [ 4] 1100 	call PLUS 
      00A375 CD 86 99         [ 4] 1101 	call DUPP 
      00A378 CD 87 E2         [ 4] 1102 	call CNTXT 
      00A37B CD 85 51         [ 4] 1103 	call STORE
      00A37E CD 88 0E         [ 4] 1104 	call LAST
      00A381 CD 85 51         [ 4] 1105 	call STORE 
      00A384 CD 9D 29         [ 4] 1106 	call UPDATLAST 
                                   1107 ;update CP 
      00A387 CD 87 FE         [ 4] 1108 	call CPP 
      00A38A CD 85 51         [ 4] 1109 	call STORE
      00A38D CD 9D 52         [ 4] 1110 	call UPDATCP 
      00A390 81               [ 4] 1111 	ret 
                                   1112 
                                   1113 ;-----------------------------
                                   1114 ; move interrupt sub-routine
                                   1115 ; in flash memory
                                   1116 ;----------------------------- 
      00A391 A3 4B                 1117 	.word LINK 
                           002313  1118 	LINK=. 
      00A393 06                    1119 	.byte 6
      00A394 49 46 4D 4F 56 45     1120 	.ascii "IFMOVE" 
      00A39A                       1121 IFMOVE:
      00A39A CD 87 AF         [ 4] 1122 	call TFLASH 
      00A39D CD 85 63         [ 4] 1123 	CALL AT 
      00A3A0 CD 85 18         [ 4] 1124 	CALL QBRAN 
      00A3A3 A3 45                 1125 	.word no_move 
      00A3A5 CD 87 FE         [ 4] 1126 	call CPP 
      00A3A8 CD 85 63         [ 4] 1127 	call AT 
      00A3AB CD 86 99         [ 4] 1128 	call DUPP ; ( udl udl -- )
      00A3AE CD 9D 0F         [ 4] 1129 	call EEPVP 
      002331                       1130 	_DROP
      00A3B1 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00A3B4 CD 85 63         [ 4] 1131 	call AT  ; ( udl udl a )
      00A3B7 CD 86 62         [ 4] 1132 	call TOR 
      00A3BA CD A2 B6         [ 4] 1133 	call FADDR
      00A3BD CD 85 C5         [ 4] 1134 	call RAT ; ( udl ud a -- ) R: a 
      00A3C0 CC A2 F2         [ 2] 1135 	jp FMOVE2 
                                   1136 
                                   1137 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 128.
Hexadecimal [24-Bits]



                           000001  4579 .if WANT_SCALING_CONST 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 129.
Hexadecimal [24-Bits]



                                   4580         .include "const_ratio.asm"
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
      00A3C3 A3 93                   34         .word LINK 
                           002345    35         LINK=.
      00A3C5 02                      36         .byte 2
      00A3C6 50 49                   37         .ascii "PI" 
      00A3C8                         38 PII:
      00A3C8 1D 00 04         [ 2]   39         subw x,#2*CELLL 
      00A3CB 90 AE 01 63      [ 2]   40         ldw y,#355 
      00A3CF EF 02            [ 2]   41         ldw (2,x),y 
      00A3D1 90 AE 00 71      [ 2]   42         ldw y,#113 
      00A3D5 FF               [ 2]   43         ldw (x),y 
      00A3D6 81               [ 4]   44         ret 
                                     45 
                                     46 ;      SQRT2 ( -- 19601  13860 )
                                     47 ; precision: 1.5e-9 
                                     48 ; usage example to compute Voltage peek to peek from Vrms 
                                     49 ; : VPP SQRT2 */ 2 * ;
                                     50 ;
      00A3D7 A3 C5                   51         .word LINK 
                           002359    52         LINK=.
      00A3D9 05                      53         .byte 5 
      00A3DA 53 51 52 54 32          54         .ascii "SQRT2" 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 130.
Hexadecimal [24-Bits]



      00A3DF                         55 SQRT2:
      00A3DF 1D 00 04         [ 2]   56         subw x,#2*CELLL 
      00A3E2 90 AE 4C 91      [ 2]   57         ldw y,#19601 
      00A3E6 EF 02            [ 2]   58         ldw (2,x),y 
      00A3E8 90 AE 36 24      [ 2]   59         ldw y,#13860 
      00A3EC FF               [ 2]   60         ldw (x),y 
      00A3ED 81               [ 4]   61         ret 
                                     62 
                                     63 ;   SQRT3 ( -- 18817 10864 )
                                     64 ; precision: 1.1e-9
                                     65 ;
      00A3EE A3 D9                   66         .word LINK 
                           002370    67         LINK=.
      00A3F0 05                      68         .byte 5
      00A3F1 53 51 52 54 33          69         .ascii "SQRT3" 
      00A3F6                         70 SQRT3: 
      00A3F6 1D 00 04         [ 2]   71     subw x,#2*CELLL 
      00A3F9 90 AE 49 81      [ 2]   72     ldw y,#18817 
      00A3FD EF 02            [ 2]   73     ldw (2,x),y 
      00A3FF 90 AE 2A 70      [ 2]   74     ldw y,#10864 
      00A403 FF               [ 2]   75     ldw (x),y 
      00A404 81               [ 4]   76     ret 
                                     77 
                                     78 ;   E ( -- 28667 10546 )
                                     79 ; precision: 5.5e-9 
                                     80 ; natural log base 
      00A405 A3 F0                   81         .word LINK 
                           002387    82         LINK=.
      00A407 01                      83         .byte 1
      00A408 45                      84         .ascii "E" 
      00A409                         85 ENEPER:
      00A409 1D 00 04         [ 2]   86     subw x,#2*CELLL 
      00A40C 90 AE 6F FB      [ 2]   87     ldw y,#28667 
      00A410 EF 02            [ 2]   88     ldw (2,x),y 
      00A412 90 AE 29 32      [ 2]   89     ldw y,#10546 
      00A416 FF               [ 2]   90     ldw (x),y 
      00A417 81               [ 4]   91     ret 
                                     92 
                                     93 ;   SQRT10 ( -- 22936 7253 )
                                     94 ; precision: 5.7e-9 
      00A418 A4 07                   95         .word LINK 
                           00239A    96         LINK=.
      00A41A 06                      97         .byte 6 
      00A41B 53 51 52 54 31 30       98         .ascii "SQRT10" 
      00A421                         99 SQRT10:
      00A421 1D 00 04         [ 2]  100     subw x,#2*CELLL
      00A424 90 AE 59 98      [ 2]  101     ldw y,#22936 
      00A428 EF 02            [ 2]  102     ldw (2,x),y 
      00A42A 90 AE 1C 55      [ 2]  103     ldw y,#7253
      00A42E FF               [ 2]  104     ldw (x),y 
      00A42F 81               [ 4]  105     ret 
                                    106 
                                    107 ;   12RT2 ( -- 26797 25293 )
                                    108 ; precision: 1.0e-9 
                                    109 ; used in music to compute well tempered scale
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 131.
Hexadecimal [24-Bits]



      00A430 A4 1A                  110         .word LINK 
                           0023B2   111         LINK=. 
      00A432 05                     112         .byte 5 
      00A433 31 32 52 54 32         113         .ascii "12RT2"
      00A438                        114 RT12_2:
      00A438 1D 00 04         [ 2]  115     subw x,#2*CELLL 
      00A43B 90 AE 68 AD      [ 2]  116     ldw y,#26797
      00A43F EF 02            [ 2]  117     ldw (2,x),y 
      00A441 90 AE 62 CD      [ 2]  118     ldw y,#25293
      00A445 FF               [ 2]  119     ldw (x),y 
      00A446 81               [ 4]  120     ret 
                                    121 
                                    122 ;   LOG2s ( -- 2040 11103 )
                                    123 ; log(2)/1.6384
                                    124 ; precision: 1.1e-8
      00A447 A4 32                  125         .word LINK 
                           0023C9   126         LINK=.
      00A449 05                     127         .byte 5 
      00A44A 4C 4F 47 32 53         128         .ascii "LOG2S" 
      00A44F                        129 LOG2S:
      00A44F 1D 00 04         [ 2]  130     subw x,#2*CELLL
      00A452 90 AE 07 F8      [ 2]  131     ldw y,#2040 
      00A456 EF 02            [ 2]  132     ldw (2,x),y 
      00A458 90 AE 2B 5F      [ 2]  133     ldw y,#11103 
      00A45C FF               [ 2]  134     ldw (x),y 
      00A45D 81               [ 4]  135     ret 
                                    136 
                                    137 ;   LN2 ( -- 485 11464 )
                                    138 ; ln(2)/16.384 
                                    139 ; precision: 1.0e-7 
      00A45E A4 49                  140         .word LINK 
                           0023E0   141         LINK=.
      00A460 04                     142         .byte 4 
      00A461 4C 4E 32 53            143         .ascii "LN2S" 
      00A465                        144 LN2S: 
      00A465 1D 00 04         [ 2]  145     subw x,#2*CELLL
      00A468 90 AE 01 E5      [ 2]  146     ldw y,#485
      00A46C EF 02            [ 2]  147     ldw (2,x),y 
      00A46E 90 AE 2C C8      [ 2]  148     ldw y,#11464 
      00A472 FF               [ 2]  149     ldw (x),y 
      00A473 81               [ 4]  150     ret 
                                    151 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 132.
Hexadecimal [24-Bits]



                                   4581 .endif
                           000001  4582 .if WANT_CONST_TABLE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 133.
Hexadecimal [24-Bits]



                                   4583         .include "ctable.asm"
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
      00A474 A4 60                   34     .word LINK 
                           0023F6    35     LINK=.
      00A476 06                      36     .byte 6
      00A477 43 41 4C 4C 4F 54       37     .ascii "CALLOT"
      00A47D                         38 CALLOT:
      00A47D CD 87 FE         [ 4]   39     CALL CPP
      00A480 CD 86 99         [ 4]   40     CALL DUPP 
      00A483 CD 85 63         [ 4]   41     CALL AT 
      00A486 CD 86 62         [ 4]   42     CALL TOR 
      00A489 CD 8D 0E         [ 4]   43     CALL PSTOR 
      00A48C CD 9D 52         [ 4]   44     CALL UPDATCP 
      00A48F CD 85 B4         [ 4]   45     CALL RFROM
      00A492 CC 8C 9E         [ 2]   46     JP ZERO 
                                     47 
                                     48 ;------------------------------
                                     49 ; create constants bytes table 
                                     50 ; in persistant memory
                                     51 ;  CTABLE ( n+ -- ad ; <string> )
                                     52 ; n+ bytes reserved 
                                     53 ;-----------------------------
      00A495 A4 76                   54     .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 134.
Hexadecimal [24-Bits]



                           002417    55     LINK=.
      00A497 06                      56     .byte 6
      00A498 43 54 41 42 4C 45       57     .ascii "CTABLE"
      00A49E                         58 CTABLE:
      00A49E CD A4 7D         [ 4]   59     CALL CALLOT     
      00A4A1 CC 99 E5         [ 2]   60     JP DCONST 
                                     61      
                                     62 
                                     63 ;--------------------------------
                                     64 ; create constants words table 
                                     65 ; in persistant memory 
                                     66 ; WTABLE ( n+ -- ad ; <string> )
                                     67 ; n+  words reserved  
                                     68 ;--------------------------------
      00A4A4 A4 97                   69     .word LINK 
                           002426    70     LINK=.
      00A4A6 06                      71     .byte 6
      00A4A7 57 54 41 42 4C 45       72     .ascii "WTABLE"
      00A4AD                         73 WTABLE:
      00A4AD CD 8C 25         [ 4]   74     CALL CELLS  
      00A4B0 CD A4 7D         [ 4]   75     CALL CALLOT 
      00A4B3 CC 99 E5         [ 2]   76     JP DCONST 
                                     77 
                                     78 ;---------------------------------
                                     79 ; stack an element of CTABLE 
                                     80 ; CTABL@ ( u ad -- c )
                                     81 ; u element order {0..size-1}
                                     82 ; a|ad table address 
                                     83 ;--------------------------------
      00A4B6 A4 A6                   84     .word LINK 
                           002438    85     LINK=.
      00A4B8 06                      86     .byte 6
      00A4B9 43 54 41 42 4C 40       87     .ascii "CTABL@" 
      00A4BF                         88 CTAT:
      00A4BF CD 9C 95         [ 4]   89     call FPSTOR 
      00A4C2 CD 9E 27         [ 4]   90     call PTRPLUS 
      00A4C5 CC 9E 64         [ 2]   91     jp EE_CREAD 
                                     92 
                                     93 ;---------------------------------
                                     94 ; stack an element of WTABLE 
                                     95 ; WTABL@ ( u ud -- w )
                                     96 ; u is element order {0..size-1}
                                     97 ; a|ud table address 
                                     98 ;----------------------------------
      00A4C8 A4 B8                   99     .word LINK 
                           00244A   100     LINK=.
      00A4CA 06                     101     .byte 6
      00A4CB 57 54 41 42 4C 40      102     .ascii "WTABL@" 
      00A4D1                        103 WTAT:
      00A4D1 CD 9C 95         [ 4]  104     call FPSTOR 
      00A4D4 CD 8C 25         [ 4]  105     call CELLS 
      00A4D7 CD 9E 27         [ 4]  106     call PTRPLUS 
      00A4DA CD 9E 42         [ 4]  107     call EE_READ 
      00A4DD 81               [ 4]  108     ret 
                                    109 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 135.
Hexadecimal [24-Bits]



                                    110 ;--------------------------
                                    111 ; tool to initialize character table 
                                    112 ; CTINIT ( ad -- )
                                    113 ; ad is table address 
                                    114 ;--------------------------
      00A4DE A4 CA                  115     .word LINK 
                           002460   116     LINK=.
      00A4E0 06                     117     .byte 6 
      00A4E1 43 54 49 4E 49 54      118     .ascii "CTINIT"
      00A4E7                        119 CTINIT:
      00A4E7 CD 9C 95         [ 4]  120     CALL FPSTOR
      00A4EA CD 9D D3         [ 4]  121     CALL UNLOCK
      00A4ED CD 8C 9E         [ 4]  122     CALL ZERO 
      00A4F0 CD 8C 32         [ 4]  123 1$: CALL ONEP 
      00A4F3 CD 86 99         [ 4]  124     CALL DUPP 
      00A4F6 CD A5 43         [ 4]  125     CALL INTQ 
      00A4F9 CD 85 18         [ 4]  126     CALL QBRAN 
      00A4FC A5 06                  127     .word 2$
      00A4FE CD 9E 7E         [ 4]  128     call WR_BYTE 
      00A501 CD 85 34         [ 4]  129     CALL BRAN 
      00A504 A4 F0                  130     .word 1$ 
      002486                        131 2$: _DDROP 
      00A506 1C 00 04         [ 2]    1    ADDW X,#2*CELLL 
      00A509 CD 9D FB         [ 4]  132     CALL LOCK 
      00A50C 81               [ 4]  133     ret 
                                    134 
                                    135 ;--------------------------
                                    136 ; tool to initialize word table 
                                    137 ; WTINIT ( ad -- )
                                    138 ; ad is table address 
                                    139 ;--------------------------
      00A50D A4 E0                  140     .word LINK 
                           00248F   141     LINK=.
      00A50F 06                     142     .byte 6 
      00A510 57 54 49 4E 49 54      143     .ascii "WTINIT"
      00A516                        144 WTINIT:
      00A516 CD 9C 95         [ 4]  145     CALL FPSTOR
      00A519 CD 9D D3         [ 4]  146     CALL UNLOCK
      00A51C CD 8C 9E         [ 4]  147     CALL ZERO 
      00A51F CD 8C 32         [ 4]  148 1$: CALL ONEP 
      00A522 CD 86 99         [ 4]  149     CALL DUPP
      00A525 CD A5 43         [ 4]  150     CALL INTQ
      00A528 CD 85 18         [ 4]  151     CALL QBRAN 
      00A52B A5 35                  152     .word 2$
      00A52D CD 9E A3         [ 4]  153     call WR_WORD 
      00A530 CD 85 34         [ 4]  154     CALL BRAN 
      00A533 A5 1F                  155     .word 1$ 
      0024B5                        156 2$: _DDROP 
      00A535 1C 00 04         [ 2]    1    ADDW X,#2*CELLL 
      00A538 CD 9D FB         [ 4]  157     CALL LOCK 
      00A53B 81               [ 4]  158     ret 
                                    159 
                                    160 ;------------------------
                                    161 ; Prompted input for integer 
                                    162 ; display n+ in bracket and
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 136.
Hexadecimal [24-Bits]



                                    163 ; '?' 
                                    164 ; [N]? ( n+ -- a )
                                    165 ;------------------------
      00A53C A5 0F                  166     .word LINK 
                           0024BE   167     LINK=.
      00A53E 04                     168     .byte 4
      00A53F 5B 4E 5D 3F            169     .ascii "[N]?" 
      00A543                        170 INTQ:
      00A543 CD 90 16         [ 4]  171     CALL CR 
      00A546 CD 84 EF         [ 4]  172     call DOLIT 
      00A549 00 5B                  173     .word '[
      00A54B CD 84 B6         [ 4]  174     CALL EMIT 
      00A54E CD 90 BD         [ 4]  175     CALL DOT 
      00A551 CD 90 43         [ 4]  176     CALL  DOTQP
      00A554 03                     177     .byte 3
      00A555 5D 3F 20               178     .ascii "]? " 
      00A558 CD 94 4D         [ 4]  179     CALL QUERY 
      00A55B CD 92 78         [ 4]  180     call TOKEN 
      00A55E CC A6 1D         [ 2]  181     jp NUMBQ
                                    182 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 137.
Hexadecimal [24-Bits]



                                   4584 .endif
                           000001  4585 .if WANT_DOUBLE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 138.
Hexadecimal [24-Bits]



                                   4586         .include "double.asm"
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
      0024E1                         35     _HEADER DBLVER,7,"DBL-VER"
      00A561 A5 3E                    1         .word LINK 
                           0024E3     2         LINK=.
      00A563 07                       3         .byte 7  
      00A564 44 42 4C 2D 56 45 52     4         .ascii "DBL-VER"
      00A56B                          5         DBLVER:
      00A56B CD 90 16         [ 4]   36     CALL CR 
      00A56E CD 90 43         [ 4]   37     CALL DOTQP 
      00A571 18                      38     .byte  24 
      00A572 64 6F 75 62 6C 65 20    39     .ascii "double integer library, "
             69 6E 74 65 67 65 72
             20 6C 69 62 72 61 72
             79 2C 20
      00A58A CD 9B 94         [ 4]   40     CALL PRT_LICENCE
      00A58D CD 9B 6C         [ 4]   41     CALL COPYRIGHT  
      002510                         42     _DOLIT DVER_MAJOR 
      00A590 CD 84 EF         [ 4]    1     CALL DOLIT 
      00A593 00 01                    2     .word DVER_MAJOR 
      002515                         43     _DOLIT DVER_MINOR  
      00A595 CD 84 EF         [ 4]    1     CALL DOLIT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 139.
Hexadecimal [24-Bits]



      00A598 00 00                    2     .word DVER_MINOR 
      00A59A CC 9B A8         [ 2]   44     JP PRINT_VERSION  
                                     45 
                                     46 
                                     47 ; check for negative sign 
                                     48 ; ajust pointer and cntr 
      00A59D                         49 nsign: ; addr cntr -- addr cntr f 
      00A59D 1D 00 02         [ 2]   50     SUBW X,#CELLL ; a cntr f 
      00A5A0 90 93            [ 1]   51     LDW Y,X 
      00A5A2 90 EE 04         [ 2]   52     LDW Y,(4,Y) ; addr 
      00A5A5 90 F6            [ 1]   53     LD A,(Y) ; char=*addr  
      00A5A7 A1 2D            [ 1]   54     CP A,#'-' 
      00A5A9 27 03            [ 1]   55     JREQ NEG_SIGN 
      00A5AB 4F               [ 1]   56     CLR A  
      00A5AC 20 18            [ 2]   57     JRA STO_SIGN 
      00A5AE                         58 NEG_SIGN:
                                     59 ; increment addr 
      00A5AE 90 93            [ 1]   60     LDW Y,X 
      00A5B0 90 EE 04         [ 2]   61     LDW Y,(4,Y)
      00A5B3 72 A9 00 01      [ 2]   62     ADDW Y,#1   ;addr+1 
      00A5B7 EF 04            [ 2]   63     LDW (4,X),Y 
                                     64 ; decrement cntr 
      00A5B9 90 93            [ 1]   65     LDW Y,X
      00A5BB 90 EE 02         [ 2]   66     LDW Y,(2,Y)
      00A5BE 72 A2 00 01      [ 2]   67     SUBW Y,#1   ;cntr-1 
      00A5C2 EF 02            [ 2]   68     LDW (2,X),Y 
      00A5C4 A6 FF            [ 1]   69     LD A,#0XFF
      00A5C6                         70 STO_SIGN:   
      00A5C6 F7               [ 1]   71     LD (X),A 
      00A5C7 E7 01            [ 1]   72     LD (1,X),A 
      00A5C9 81               [ 4]   73     RET 
                                     74 
                                     75 
                                     76 ; get all digits in row 
                                     77 ; stop at first non-digit or end of string 
                                     78 ; ( dlo dhi a cntr -- dlo dhi [ a+ cntr- | a+ 0 ] )
      00A5CA                         79 parse_digits:
      00A5CA                         80 1$:
      00A5CA CD 86 99         [ 4]   81     CALL DUPP 
      00254D                         82     _QBRAN 5$ 
      00A5CD CD 85 18         [ 4]    1     CALL QBRAN
      00A5D0 A6 12                    2     .word 5$
      00A5D2 CD 86 62         [ 4]   83     CALL TOR   ; dlo dhi a R: cntr 
      00A5D5 CD 8D 64         [ 4]   84     CALL COUNT ; dlo dhi a+ char 
      00A5D8 CD 87 5F         [ 4]   85     CALL BASE 
      00A5DB CD 85 63         [ 4]   86     CALL AT 
      00A5DE CD 8F 5C         [ 4]   87     CALL DIGTQ 
      002561                         88     _QBRAN 4$ ; not a digit
      00A5E1 CD 85 18         [ 4]    1     CALL QBRAN
      00A5E4 A6 09                    2     .word 4$
      00A5E6 CD A9 50         [ 4]   89     CALL DTOR  ; dlo dhi R: cntr a+ c  
      00A5E9 CD 87 5F         [ 4]   90     CALL BASE 
      00A5EC CD 85 63         [ 4]   91     CALL AT 
      00A5EF CD A7 DB         [ 4]   92     CALL DSSTAR
      00A5F2 CD 85 B4         [ 4]   93     CALL RFROM 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 140.
Hexadecimal [24-Bits]



      00A5F5 CD 8C 9E         [ 4]   94     CALL ZERO 
      00A5F8 CD AC 13         [ 4]   95     CALL DPLUS 
      00A5FB CD 85 B4         [ 4]   96     CALL RFROM  ; dlo dhi a+ 
      00A5FE CD 85 B4         [ 4]   97     CALL RFROM ; dlo dhi a+ cntr 
      00A601 CD 8C 3F         [ 4]   98     CALL ONEM 
      002584                         99     _BRAN 1$ ; dlo dhi a+ R: 
      00A604 CD 85 34         [ 4]    1     CALL BRAN 
      00A607 A5 CA                    2     .word 1$ 
      002589                        100 4$: _DROP  ; dlo dhi a+ 
      00A609 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00A60C CD 8C 3F         [ 4]  101     CALL ONEM  ; unget char 
      00A60F CD 85 B4         [ 4]  102     CALL RFROM ; dlo dhi a+ cntr-
      00A612                        103 5$:
      00A612 81               [ 4]  104     RET 
                                    105 
                                    106 
                                    107 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    108 ;   NUMBER? (a -- s -1 |d -2 | a F )
                                    109 ;   convert string to integer 
                                    110 ;   double begin with '#' 
                                    111 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002593                        112     _HEADER NUMBQ,7,"NUMBER?"
      00A613 A5 63                    1         .word LINK 
                           002595     2         LINK=.
      00A615 07                       3         .byte 7  
      00A616 4E 55 4D 42 45 52 3F     4         .ascii "NUMBER?"
      00A61D                          5         NUMBQ:
                                    113 ; save current base value 
      00A61D CD 87 5F         [ 4]  114     CALL BASE 
      00A620 CD 85 63         [ 4]  115     CALL AT 
      00A623 CD 86 62         [ 4]  116     CALL TOR 
                                    117 ; initialize integer to 0     
      00A626 1D 00 04         [ 2]  118     SUBW X,#4 
      00A629 90 5F            [ 1]  119     CLRW Y 
      00A62B FF               [ 2]  120     LDW (X),Y 
      00A62C EF 02            [ 2]  121     LDW (2,X),Y ; a 0 0 R: base  
      0025AE                        122     _DOLIT 2 
      00A62E CD 84 EF         [ 4]    1     CALL DOLIT 
      00A631 00 02                    2     .word 2 
      00A633 CD 8C F7         [ 4]  123     CALL PICK  ; a 0 0 a R: base    
      00A636 CD 8D 64         [ 4]  124     CALL COUNT ; a 0 0 a+ n 
                                    125 ; check for '#' double integer 
      00A639 CD 86 C1         [ 4]  126     CALL OVER  ; a 0 0 a+ n a+
      00A63C CD 85 81         [ 4]  127     CALL CAT   ; a 0 0 a+ n c 
      0025BF                        128     _DOLIT '#' ; a 0 0 a+ n c '#' 
      00A63F CD 84 EF         [ 4]    1     CALL DOLIT 
      00A642 00 23                    2     .word '#' 
      00A644 CD 89 7A         [ 4]  129     CALL EQUAL 
      00A647 CD 86 62         [ 4]  130     CALL TOR   ; a 0 0 a+ n R: base d? 
      00A64A CD 85 C5         [ 4]  131     CALL RAT   ; a 0 0 a+ n d? R: base d?
      0025CD                        132     _QBRAN NUMQ0
      00A64D CD 85 18         [ 4]    1     CALL QBRAN
      00A650 A6 5E                    2     .word NUMQ0
                                    133 ; update a and count
      00A652 CD 86 A9         [ 4]  134     CALL SWAPP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 141.
Hexadecimal [24-Bits]



      00A655 CD 8C 32         [ 4]  135     CALL ONEP 
      00A658 CD 86 A9         [ 4]  136     CALL SWAPP 
      00A65B CD 8C 3F         [ 4]  137     CALL ONEM  ; a 0 0 a+ n- R: base d?
                                    138 ; check for '$' hexadecimal  
      00A65E                        139 NUMQ0: 
      00A65E CD 86 C1         [ 4]  140     CALL OVER   
      00A661 CD 85 81         [ 4]  141     CALL CAT   
      0025E4                        142     _DOLIT '$'
      00A664 CD 84 EF         [ 4]    1     CALL DOLIT 
      00A667 00 24                    2     .word '$' 
      00A669 CD 89 7A         [ 4]  143     CALL EQUAL ; a 0 0 a+ n- f  
      0025EC                        144     _QBRAN NUMQ1 
      00A66C CD 85 18         [ 4]    1     CALL QBRAN
      00A66F A6 80                    2     .word NUMQ1
      00A671 CD 8F 33         [ 4]  145     CALL HEX   ; switch to hexadecimal base 
                                    146 ; update a and count 
      00A674 CD 86 A9         [ 4]  147     CALL SWAPP 
      00A677 CD 8C 32         [ 4]  148     CALL ONEP 
      00A67A CD 86 A9         [ 4]  149     CALL SWAPP
      00A67D CD 8C 3F         [ 4]  150     CALL ONEM ; a 0 0 a+ n-  R: base d?
                                    151 ; check for minus sign 
      00A680                        152 NUMQ1: 
      00A680 CD A5 9D         [ 4]  153     CALL nsign 
      00A683 CD 86 62         [ 4]  154     CALL TOR ; R: base d? sign  
                                    155 ; check for end of string     
      00A686 CD 88 4C         [ 4]  156     CALL QDUP    ; a dlo dhi a+ cntr R: base d? sign 
      002609                        157     _QBRAN NUMQ4 ; yes , not a number 
      00A689 CD 85 18         [ 4]    1     CALL QBRAN
      00A68C A6 CB                    2     .word NUMQ4
      00A68E CD A5 CA         [ 4]  158     CALL parse_digits
      00A691 CD 88 4C         [ 4]  159     CALL QDUP 
      00A694 CD 86 E2         [ 4]  160     CALL ZEQUAL  
      002617                        161     _QBRAN NUMQ4 ; error not end of string  ( a dlo dhi a+ R: base d? sign )
      00A697 CD 85 18         [ 4]    1     CALL QBRAN
      00A69A A6 CB                    2     .word NUMQ4
      00261C                        162     _DROP  ; a dlo dhi 
      00A69C 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00A69F CD 85 B4         [ 4]  163     CALL RFROM  ; a dlo dhi sign 
      002622                        164     _QBRAN NUMQ3
      00A6A2 CD 85 18         [ 4]    1     CALL QBRAN
      00A6A5 A6 AA                    2     .word NUMQ3
      00A6A7 CD 89 18         [ 4]  165     CALL DNEGA
      00A6AA                        166 NUMQ3: 
      00A6AA CD 88 5D         [ 4]  167     CALL ROT ; dlo dhi a  R: base d?
      00262D                        168     _DROP
      00A6AD 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      002630                        169     _DOLIT -2  ; double return -2 flag 
      00A6B0 CD 84 EF         [ 4]    1     CALL DOLIT 
      00A6B3 FF FE                    2     .word -2 
      00A6B5 CD 85 B4         [ 4]  170     CALL RFROM ; dlo dhi d? R: base 
      002638                        171     _TBRAN NUMQ8 
      00A6B8 CD 85 26         [ 4]    1     CALL TBRAN 
      00A6BB A6 D4                    2     .word NUMQ8 
      00A6BD CD 86 A9         [ 4]  172     CALL SWAPP 
      002640                        173     _DROP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 142.
Hexadecimal [24-Bits]



      00A6C0 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00A6C3 CD 8C 32         [ 4]  174     CALL ONEP   ; single return -1 flag   
      002646                        175     _BRAN NUMQ8
      00A6C6 CD 85 34         [ 4]    1     CALL BRAN 
      00A6C9 A6 D4                    2     .word NUMQ8 
      00A6CB                        176 NUMQ4: ; not end of string error , ( a dlo dhi a+ cntr R: base d? sign )
                           000001   177 .if WANT_FLOAT
      00A6CB CD 85 B4         [ 4]  178     CALL RFROM ; sign 
      00A6CE CD 85 B4         [ 4]  179     CALL RFROM ; d? 
      00A6D1 CD AF EE         [ 4]  180     CALL FLOATQ ; ( a dlo dhi a+ cntr sign d? )    
                           000000   181 .else 
                                    182     ADDW X,#4 ; drop dhi a+  , ( a dlo R: base d? sign ) 
                                    183     ADDW SP,#4 ; drop d? sign  R: base 
                                    184     CLRW Y 
                                    185     LDW (X),Y ; dlo replaced by 0 ( -- a 0 R: base ) 
                                    186 .endif 
                                    187 ; restore original base value     
      00A6D4                        188 NUMQ8: 
      00A6D4 CD 85 B4         [ 4]  189     CALL RFROM 
      00A6D7 CD 87 5F         [ 4]  190     CALL BASE 
      00A6DA CD 85 51         [ 4]  191     CALL STORE 
      00A6DD 81               [ 4]  192     RET 
                                    193 
                                    194 
                                    195 
                                    196 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    197 ;   DABS ( d -- d )
                                    198 ;   absolute value of double
                                    199 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00265E                        200     _HEADER DABS,4,"DABS"
      00A6DE A6 15                    1         .word LINK 
                           002660     2         LINK=.
      00A6E0 04                       3         .byte 4  
      00A6E1 44 41 42 53              4         .ascii "DABS"
      00A6E5                          5         DABS:
      00A6E5 F6               [ 1]  201     LD A,(X) 
      00A6E6 A4 80            [ 1]  202     AND A,#0X80 
      00A6E8 27 03            [ 1]  203     JREQ DABS1 
      00A6EA CD 89 18         [ 4]  204     CALL DNEGA 
      00A6ED                        205 DABS1:
      00A6ED 81               [ 4]  206     RET 
                                    207 
                                    208 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    209 ;  DSIGN ( d -- d f )
                                    210 ;  sign of double 
                                    211 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00266E                        212     _HEADER DSIGN,5,"DSIGN"
      00A6EE A6 E0                    1         .word LINK 
                           002670     2         LINK=.
      00A6F0 05                       3         .byte 5  
      00A6F1 44 53 49 47 4E           4         .ascii "DSIGN"
      00A6F6                          5         DSIGN:
      00A6F6 A6 00            [ 1]  213     LD A,#0 
      00A6F8 90 93            [ 1]  214     LDW Y,X 
      00A6FA 90 FE            [ 2]  215     LDW Y,(Y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 143.
Hexadecimal [24-Bits]



      00A6FC 2A 02            [ 1]  216     JRPL DSIGN1
      00A6FE A6 FF            [ 1]  217     LD A,#0XFF 
      00A700                        218 DSIGN1:
      00A700 1D 00 02         [ 2]  219     SUBW X,#2 
      00A703 F7               [ 1]  220     LD (X),A 
      00A704 E7 01            [ 1]  221     LD (1,X),A 
      00A706 81               [ 4]  222     RET 
                                    223 
                                    224 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    225 ;   DS/MOD ( ud us - ur qud )
                                    226 ;   unsigned divide double by single 
                                    227 ;   return double quotient 
                                    228 ;   and single remainder 
                                    229 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002687                        230     _HEADER DSLMOD,6,"DS/MOD"
      00A707 A6 F0                    1         .word LINK 
                           002689     2         LINK=.
      00A709 06                       3         .byte 6  
      00A70A 44 53 2F 4D 4F 44        4         .ascii "DS/MOD"
      00A710                          5         DSLMOD:
      00A710 90 93            [ 1]  231         LDW     Y,X             ; stack pointer to Y
      00A712 FE               [ 2]  232         LDW     X,(X)           ; un
      00A713 BF 26            [ 2]  233         LDW     YTEMP,X         ; save un
      00A715 93               [ 1]  234         LDW     X,Y
      00A716 89               [ 2]  235         PUSHW   X               ; save stack pointer
      00A717 90 89            [ 2]  236         PUSHW   Y 
      00A719 EE 02            [ 2]  237         LDW     X,(2,X)           ; X=udh
      00A71B 90 BE 26         [ 2]  238         LDW     Y,YTEMP         ; divisor 
      00A71E 65               [ 2]  239         DIVW    X,Y 
      00A71F BF 24            [ 2]  240         LDW     XTEMP,X         ; QUOTIENT hi 
      00A721 93               [ 1]  241         LDW     X,Y             ; remainder in X 
      00A722 90 85            [ 2]  242         POPW    Y 
      00A724 90 EE 04         [ 2]  243         LDW     Y,(4,Y)         ; Y=udl (offset before drop)
      00A727 A6 10            [ 1]  244         LD      A,#16           ; loop count
      00A729 90 58            [ 2]  245         SLLW    Y               ; udl shift udl into udh
      00A72B                        246 DSLMOD3:
      00A72B 59               [ 2]  247         RLCW    X               ; rotate udl bit into uhdh (= remainder)
      00A72C 25 04            [ 1]  248         JRC     DSLMODa         ; if carry out of rotate
      00A72E B3 26            [ 2]  249         CPW     X,YTEMP         ; compare udh to un
      00A730 25 05            [ 1]  250         JRULT   DSLMOD4         ; can't subtract
      00A732                        251 DSLMODa:
      00A732 72 B0 00 26      [ 2]  252         SUBW    X,YTEMP         ; can subtract
      00A736 98               [ 1]  253         RCF
      00A737                        254 DSLMOD4:
      00A737 8C               [ 1]  255         CCF                     ; quotient bit
      00A738 90 59            [ 2]  256         RLCW    Y               ; rotate into quotient, rotate out udl
      00A73A 4A               [ 1]  257         DEC     A               ; repeat
      00A73B 26 EE            [ 1]  258         JRNE    DSLMOD3           ; if A == 0
      00A73D                        259 DSLMODb:
      00A73D BF 26            [ 2]  260         LDW     YTEMP,X         ; done, save remainder
      00A73F 85               [ 2]  261         POPW    X               ; restore stack pointer
      00A740 EF 02            [ 2]  262         LDW     (2,X),Y           ; save quotient low 
      00A742 90 BE 24         [ 2]  263         LDW     Y,XTEMP         ; quotient hi 
      00A745 FF               [ 2]  264         LDW     (X),Y           ; save quotient hi 
      00A746 90 BE 26         [ 2]  265         LDW     Y,YTEMP         ; remainder onto stack
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 144.
Hexadecimal [24-Bits]



      00A749 EF 04            [ 2]  266         LDW     (4,X),Y
      00A74B 81               [ 4]  267         RET 
                                    268 
                                    269 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    270 ;   D# ( d -- d )
                                    271 ;   extract least digit 
                                    272 ;   from double integer 
                                    273 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0026CC                        274     _HEADER DDIG,2,"D#"
      00A74C A7 09                    1         .word LINK 
                           0026CE     2         LINK=.
      00A74E 02                       3         .byte 2  
      00A74F 44 23                    4         .ascii "D#"
      00A751                          5         DDIG:
      00A751 CD 87 5F         [ 4]  275     CALL BASE 
      00A754 CD 85 63         [ 4]  276     CALL AT 
      00A757 CD A7 10         [ 4]  277     CALL DSLMOD
      00A75A CD 88 5D         [ 4]  278     CALL ROT   
      00A75D CD 8E 5C         [ 4]  279     CALL DIGIT 
      00A760 CD 8E A8         [ 4]  280     CALL HOLD 
      00A763 81               [ 4]  281     RET 
                                    282 
                                    283 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    284 ;    D#S ( d -- s )
                                    285 ;   extract digit from double 
                                    286 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0026E4                        287     _HEADER DDIGS,3,"D#S"
      00A764 A7 4E                    1         .word LINK 
                           0026E6     2         LINK=.
      00A766 03                       3         .byte 3  
      00A767 44 23 53                 4         .ascii "D#S"
      00A76A                          5         DDIGS:
      00A76A CD A7 51         [ 4]  288     CALL    DDIG 
      00A76D CD 88 A7         [ 4]  289     CALL    DDUP 
      00A770 CD A8 D6         [ 4]  290     CALL    DZEQUAL
      0026F3                        291     _QBRAN  DDIGS 
      00A773 CD 85 18         [ 4]    1     CALL QBRAN
      00A776 A7 6A                    2     .word DDIGS
      00A778 CD 86 8F         [ 4]  292     CALL    DROP 
      00A77B 81               [ 4]  293     RET 
                                    294 
                                    295 
                                    296 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    297 ;   D. ( d -- )
                                    298 ;   display double integer 
                                    299 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0026FC                        300     _HEADER DDOT,2,"D."
      00A77C A7 66                    1         .word LINK 
                           0026FE     2         LINK=.
      00A77E 02                       3         .byte 2  
      00A77F 44 2E                    4         .ascii "D."
      00A781                          5         DDOT:
      00A781 CD 8F D4         [ 4]  301     CALL SPACE 
      00A784 CD A6 F6         [ 4]  302     CALL DSIGN 
      00A787 CD 86 62         [ 4]  303     CALL TOR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 145.
Hexadecimal [24-Bits]



      00A78A CD 85 C5         [ 4]  304     CALL RAT 
      00270D                        305     _QBRAN DDOT0
      00A78D CD 85 18         [ 4]    1     CALL QBRAN
      00A790 A7 95                    2     .word DDOT0
      00A792 CD 89 18         [ 4]  306     CALL DNEGA 
      00A795                        307 DDOT0:     
      00A795 CD 8E 98         [ 4]  308     CALL BDIGS 
      00A798 CD A7 6A         [ 4]  309     CALL DDIGS 
      00A79B CD 85 B4         [ 4]  310     CALL RFROM 
      00271E                        311     _QBRAN DDOT1 
      00A79E CD 85 18         [ 4]    1     CALL QBRAN
      00A7A1 A7 AB                    2     .word DDOT1
      002723                        312     _DOLIT '-' 
      00A7A3 CD 84 EF         [ 4]    1     CALL DOLIT 
      00A7A6 00 2D                    2     .word '-' 
      00A7A8 CD 8E A8         [ 4]  313     CALL HOLD 
      00A7AB                        314 DDOT1: 
      00A7AB CD 8E FD         [ 4]  315     CALL EDIGS 
      00A7AE CD 8F FE         [ 4]  316     CALL TYPES     
      00A7B1 81               [ 4]  317     RET 
                                    318 
                                    319 
                                    320 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    321 ;  UDS* ( ud u -- ud*u )
                                    322 ;  uint32*uint16 
                                    323 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002732                        324     _HEADER UDSSTAR,4,"UDS*"
      00A7B2 A7 7E                    1         .word LINK 
                           002734     2         LINK=.
      00A7B4 04                       3         .byte 4  
      00A7B5 55 44 53 2A              4         .ascii "UDS*"
      00A7B9                          5         UDSSTAR:
      00A7B9 CD 86 62         [ 4]  325     CALL TOR 
      00A7BC CD 86 A9         [ 4]  326     CALL SWAPP 
      00A7BF CD 85 C5         [ 4]  327     CALL RAT 
      00A7C2 CD 8B 67         [ 4]  328     CALL UMSTA ; udlo*u 
      00A7C5 CD 88 5D         [ 4]  329     CALL ROT 
      00A7C8 CD 85 B4         [ 4]  330     CALL RFROM 
      00A7CB CD 8B 67         [ 4]  331     CALL UMSTA ; udhi*u 
      00274E                        332     _DROP  ; drop overflow 
      00A7CE 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00A7D1 CD 88 BC         [ 4]  333     CALL PLUS  ; udlo*u+(uhi*u<<16)
      00A7D4 81               [ 4]  334     RET 
                                    335 
                                    336 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    337 ; multiply double by unsigned single 
                                    338 ; return double 
                                    339 ;  ( d u -- d )
                                    340 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002755                        341     _HEADER DSSTAR,3,"DS*"
      00A7D5 A7 B4                    1         .word LINK 
                           002757     2         LINK=.
      00A7D7 03                       3         .byte 3  
      00A7D8 44 53 2A                 4         .ascii "DS*"
      00A7DB                          5         DSSTAR:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 146.
Hexadecimal [24-Bits]



                                    342 ;DSSTAR:
      00A7DB CD 86 62         [ 4]  343     CALL TOR
      00A7DE CD A6 F6         [ 4]  344     CALL DSIGN 
      00A7E1 CD 88 7C         [ 4]  345     CALL NROT 
      00A7E4 CD A6 E5         [ 4]  346     CALL DABS
      00A7E7 CD 85 B4         [ 4]  347     CALL RFROM 
      00A7EA CD A7 B9         [ 4]  348     CALL UDSSTAR  
      00A7ED CD 88 5D         [ 4]  349     CALL ROT 
      002770                        350     _QBRAN DSSTAR3 
      00A7F0 CD 85 18         [ 4]    1     CALL QBRAN
      00A7F3 A7 F8                    2     .word DSSTAR3
      00A7F5 CD 89 18         [ 4]  351     CALL DNEGA 
      00A7F8                        352 DSSTAR3:
      00A7F8 81               [ 4]  353     RET 
                                    354 
                                    355 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    356 ;  2SWAP ( d1 d2 -- d2 d1 )
                                    357 ;  swap double 
                                    358 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002779                        359     _HEADER DSWAP,5,"2SWAP"
      00A7F9 A7 D7                    1         .word LINK 
                           00277B     2         LINK=.
      00A7FB 05                       3         .byte 5  
      00A7FC 32 53 57 41 50           4         .ascii "2SWAP"
      00A801                          5         DSWAP:
      00A801 90 93            [ 1]  360     LDW Y,X 
      00A803 90 FE            [ 2]  361     LDW Y,(Y)
      00A805 90 BF 26         [ 2]  362     LDW YTEMP,Y ; d2 hi 
      00A808 90 93            [ 1]  363     LDW Y,X 
      00A80A 90 EE 02         [ 2]  364     LDW Y,(2,Y)
      00A80D 90 BF 24         [ 2]  365     LDW XTEMP,Y  ; d2 lo 
      00A810 90 93            [ 1]  366     LDW Y,X 
      00A812 90 EE 04         [ 2]  367     LDW Y,(4,Y)  ; d1 hi 
      00A815 FF               [ 2]  368     LDW (X),Y 
      00A816 90 93            [ 1]  369     LDW Y,X
      00A818 90 EE 06         [ 2]  370     LDW Y,(6,Y)  ; d1 lo 
      00A81B EF 02            [ 2]  371     LDW (2,X),Y
      00A81D 90 BE 26         [ 2]  372     LDW Y,YTEMP  
      00A820 EF 04            [ 2]  373     LDW (4,X),Y 
      00A822 90 BE 24         [ 2]  374     LDW Y,XTEMP 
      00A825 EF 06            [ 2]  375     LDW (6,X),Y 
      00A827 81               [ 4]  376     RET 
                                    377 
                                    378 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    379 ;    DCLZ ( d -- u )
                                    380 ;    double count leading zeros
                                    381 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0027A8                        382     _HEADER DCLZ,4,"DCLZ"
      00A828 A7 FB                    1         .word LINK 
                           0027AA     2         LINK=.
      00A82A 04                       3         .byte 4  
      00A82B 44 43 4C 5A              4         .ascii "DCLZ"
      00A82F                          5         DCLZ:
      00A82F 4F               [ 1]  383     CLR A 
      00A830 90 93            [ 1]  384     LDW Y,X 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 147.
Hexadecimal [24-Bits]



      00A832 90 FE            [ 2]  385     LDW Y,(Y)
      00A834 2B 18            [ 1]  386     JRMI DCLZ8 ; no leading zero 
      00A836 27 09            [ 1]  387     JREQ DCLZ4 ; >=16 
      00A838                        388 DCLZ1: ; <16
      00A838 90 58            [ 2]  389     SLLW Y
      00A83A 4C               [ 1]  390     INC A 
      00A83B 90 5D            [ 2]  391     TNZW Y 
      00A83D 2B 0F            [ 1]  392     JRMI DCLZ8
      00A83F 20 F7            [ 2]  393     JRA DCLZ1 
      00A841                        394 DCLZ4: ; >=16 
      00A841 A6 10            [ 1]  395     LD A,#16 
      00A843 90 93            [ 1]  396     LDW Y,X 
      00A845 90 EE 02         [ 2]  397     LDW Y,(2,Y)
      00A848 2B 04            [ 1]  398     JRMI DCLZ8 
      00A84A 26 EC            [ 1]  399     JRNE DCLZ1 
      00A84C AB 10            [ 1]  400     ADD A,#16
      00A84E                        401 DCLZ8: 
      00A84E 1C 00 02         [ 2]  402     ADDW X,#2 
      00A851 90 5F            [ 1]  403     CLRW Y 
      00A853 90 97            [ 1]  404     LD YL,A 
      00A855 FF               [ 2]  405     LDW (X),Y 
      00A856 81               [ 4]  406     RET 
                                    407 
                                    408 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    409 ;   <2ROT ( d1 d2 d3 -- d3 d1 d2 )
                                    410 ;   rotate left doubles 
                                    411 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0027D7                        412     _HEADER NDROT,5,"<2ROT"
      00A857 A8 2A                    1         .word LINK 
                           0027D9     2         LINK=.
      00A859 05                       3         .byte 5  
      00A85A 3C 32 52 4F 54           4         .ascii "<2ROT"
      00A85F                          5         NDROT:
                                    413 ; save d3 in temp 
      00A85F 90 93            [ 1]  414     LDW Y,X 
      00A861 90 FE            [ 2]  415     LDW Y,(Y)
      00A863 90 BF 26         [ 2]  416     LDW YTEMP,Y  ; d3 hi 
      00A866 90 93            [ 1]  417     LDW Y,X 
      00A868 90 EE 02         [ 2]  418     LDW Y,(2,Y)
      00A86B 90 BF 24         [ 2]  419     LDW XTEMP,Y  ; d3 lo 
                                    420 ; put d2 in d1 slot 
      00A86E 90 93            [ 1]  421     LDW Y,X 
      00A870 90 EE 04         [ 2]  422     LDW Y,(4,Y) 
      00A873 FF               [ 2]  423     LDW (X),Y   ; d2 hi 
      00A874 90 93            [ 1]  424     LDW Y,X 
      00A876 90 EE 06         [ 2]  425     LDW Y,(6,Y)
      00A879 EF 02            [ 2]  426     LDW (2,X),Y ; d2 lo
                                    427 ; put d1 in d2 slot 
      00A87B 90 93            [ 1]  428     LDW Y,X 
      00A87D 90 EE 08         [ 2]  429     LDW Y,(8,Y) 
      00A880 EF 04            [ 2]  430     LDW (4,X),Y ; d1 hi 
      00A882 90 93            [ 1]  431     LDW Y,X 
      00A884 90 EE 0A         [ 2]  432     LDW Y,(10,Y)
      00A887 EF 06            [ 2]  433     LDW (6,X),Y  ; d1 lo 
                                    434 ; put d3 in d1 slot 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 148.
Hexadecimal [24-Bits]



      00A889 90 BE 26         [ 2]  435     LDW Y,YTEMP 
      00A88C EF 08            [ 2]  436     LDW (8,X),Y  ; d3 hi 
      00A88E 90 BE 24         [ 2]  437     LDW Y,XTEMP 
      00A891 EF 0A            [ 2]  438     LDW (10,X),Y  ; d3 lo 
      00A893 81               [ 4]  439     RET 
                                    440 
                                    441 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    442 ;   2ROT ( d1 d2 d3 -- d2 d3 d1 )
                                    443 ;   rotate right doubles 
                                    444 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002814                        445     _HEADER DROT,4,"2ROT"
      00A894 A8 59                    1         .word LINK 
                           002816     2         LINK=.
      00A896 04                       3         .byte 4  
      00A897 32 52 4F 54              4         .ascii "2ROT"
      00A89B                          5         DROT:
                                    446 ; save d3 in temp 
      00A89B 90 93            [ 1]  447     LDW Y,X 
      00A89D 90 FE            [ 2]  448     LDW Y,(Y)
      00A89F 90 BF 26         [ 2]  449     LDW YTEMP,Y ; d3 hi 
      00A8A2 90 93            [ 1]  450     LDW Y,X 
      00A8A4 90 EE 02         [ 2]  451     LDW Y,(2,Y)
      00A8A7 90 BF 24         [ 2]  452     LDW XTEMP,Y ; d3 lo 
                                    453 ; put d1 in d3 slot 
      00A8AA 90 93            [ 1]  454     LDW Y,X 
      00A8AC 90 EE 08         [ 2]  455     LDW Y,(8,Y)
      00A8AF FF               [ 2]  456     LDW (X),Y  ; d1 hi 
      00A8B0 90 93            [ 1]  457     LDW Y,X 
      00A8B2 90 EE 0A         [ 2]  458     LDW Y,(10,Y) 
      00A8B5 EF 02            [ 2]  459     LDW (2,X),Y ; d1 lo 
                                    460 ; put d2 in d1 slot 
      00A8B7 90 93            [ 1]  461     LDW Y,X 
      00A8B9 90 EE 04         [ 2]  462     LDW Y,(4,Y) ; d2 hi 
      00A8BC EF 08            [ 2]  463     LDW (8,X),Y 
      00A8BE 90 93            [ 1]  464     LDW Y,X 
      00A8C0 90 EE 06         [ 2]  465     LDW Y,(6,Y) ; d2 lo 
      00A8C3 EF 0A            [ 2]  466     LDW (10,X),Y 
                                    467 ; put d3 in d2 slot 
      00A8C5 90 BE 26         [ 2]  468     LDW Y,YTEMP 
      00A8C8 EF 04            [ 2]  469     LDW (4,X),Y 
      00A8CA 90 BE 24         [ 2]  470     LDW Y,XTEMP 
      00A8CD EF 06            [ 2]  471     LDW (6,X),Y 
      00A8CF 81               [ 4]  472     RET 
                                    473 
                                    474 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    475 ;    D0= ( d -- 0|-1 )
                                    476 ;    check if double is 0 
                                    477 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002850                        478     _HEADER DZEQUAL,3,"D0="
      00A8D0 A8 96                    1         .word LINK 
                           002852     2         LINK=.
      00A8D2 03                       3         .byte 3  
      00A8D3 44 30 3D                 4         .ascii "D0="
      00A8D6                          5         DZEQUAL:
      00A8D6 4F               [ 1]  479     CLR A  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 149.
Hexadecimal [24-Bits]



      00A8D7 90 93            [ 1]  480     LDW Y,X 
      00A8D9 90 FE            [ 2]  481     LDW Y,(Y)
      00A8DB 26 09            [ 1]  482     JRNE ZEQ1 
      00A8DD 90 93            [ 1]  483     LDW Y,X 
      00A8DF 90 EE 02         [ 2]  484     LDW Y,(2,Y)
      00A8E2 26 02            [ 1]  485     JRNE ZEQ1 
      00A8E4 A6 FF            [ 1]  486     LD A,#0xFF
      00A8E6                        487 ZEQ1:
      00A8E6 1C 00 02         [ 2]  488     ADDW X,#CELLL 
      00A8E9 F7               [ 1]  489     LD (X),A
      00A8EA E7 01            [ 1]  490     LD (1,X),A
      00A8EC 81               [ 4]  491 	RET     
                                    492 
                                    493 
                                    494 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    495 ;   D= ( d1 d2 -- f )
                                    496 ;   d1==d2?
                                    497 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00286D                        498     _HEADER DEQUAL,2,"D="
      00A8ED A8 D2                    1         .word LINK 
                           00286F     2         LINK=.
      00A8EF 02                       3         .byte 2  
      00A8F0 44 3D                    4         .ascii "D="
      00A8F2                          5         DEQUAL:
      00A8F2 A6 00            [ 1]  499     LD A,#0 
      00A8F4 90 93            [ 1]  500     LDW Y,X 
      00A8F6 90 FE            [ 2]  501     LDW Y,(Y)
      00A8F8 E3 04            [ 2]  502     CPW Y,(4,X)
      00A8FA 26 0B            [ 1]  503     JRNE DEQU4 
      00A8FC 90 93            [ 1]  504     LDW Y,X 
      00A8FE 90 EE 02         [ 2]  505     LDW Y,(2,Y)
      00A901 E3 06            [ 2]  506     CPW Y,(6,X)
      00A903 26 02            [ 1]  507     JRNE DEQU4 
      00A905 A6 FF            [ 1]  508     LD A,#0XFF
      00A907                        509 DEQU4:
      00A907 1C 00 06         [ 2]  510     ADDW X,#6
      00A90A F7               [ 1]  511     LD (X),A 
      00A90B E7 01            [ 1]  512     LD (1,X),A 
      00A90D 81               [ 4]  513     RET 
                                    514 
                                    515 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    516 ;   D> ( d1 d2 -- f )
                                    517 ;   d1>d2?
                                    518 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00288E                        519     _HEADER DGREAT,2,"D>"
      00A90E A8 EF                    1         .word LINK 
                           002890     2         LINK=.
      00A910 02                       3         .byte 2  
      00A911 44 3E                    4         .ascii "D>"
      00A913                          5         DGREAT:
      00A913 CD A8 01         [ 4]  520     CALL DSWAP 
      00A916 CC A9 1E         [ 2]  521     JP DLESS 
                                    522 
                                    523 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    524 ;   D< ( d1 d2 -- f )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 150.
Hexadecimal [24-Bits]



                                    525 ;   d1<d2? 
                                    526 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002899                        527     _HEADER DLESS,2,"D<"
      00A919 A9 10                    1         .word LINK 
                           00289B     2         LINK=.
      00A91B 02                       3         .byte 2  
      00A91C 44 3C                    4         .ascii "D<"
      00A91E                          5         DLESS:
      00A91E CD AC 45         [ 4]  528     CALL DSUB
      00A921 CD 8C 9E         [ 4]  529     CALL ZERO
      00A924 CD 88 7C         [ 4]  530     CALL NROT  
      00A927 CD A9 39         [ 4]  531     CALL DZLESS 
      0028AA                        532     _QBRAN DLESS4
      00A92A CD 85 18         [ 4]    1     CALL QBRAN
      00A92D A9 32                    2     .word DLESS4
      00A92F CD 88 F5         [ 4]  533     CALL INVER  
      00A932                        534 DLESS4:
      00A932 81               [ 4]  535     RET
                                    536 
                                    537 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    538 ;  D0< ( d -- f )
                                    539 ;  d<0? 
                                    540 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0028B3                        541     _HEADER DZLESS,3,"D0<"
      00A933 A9 1B                    1         .word LINK 
                           0028B5     2         LINK=.
      00A935 03                       3         .byte 3  
      00A936 44 30 3C                 4         .ascii "D0<"
      00A939                          5         DZLESS:
      00A939 A6 00            [ 1]  542     LD A,#0 
      00A93B 90 93            [ 1]  543     LDW Y,X 
      00A93D 90 FE            [ 2]  544     LDW Y,(Y)
      00A93F 2A 02            [ 1]  545     JRPL DZLESS1 
      00A941 A6 FF            [ 1]  546     LD A,#0XFF 
      00A943                        547 DZLESS1:
      00A943 1C 00 02         [ 2]  548     ADDW X,#CELLL 
      00A946 F7               [ 1]  549     LD (X),A 
      00A947 E7 01            [ 1]  550     LD (1,X),A    
      00A949 81               [ 4]  551     RET 
                                    552 
                                    553 
                                    554 
                                    555 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    556 ;   2>R ( d -- R: d )
                                    557 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0028CA                        558     _HEADER DTOR,3,"2>R"
      00A94A A9 35                    1         .word LINK 
                           0028CC     2         LINK=.
      00A94C 03                       3         .byte 3  
      00A94D 32 3E 52                 4         .ascii "2>R"
      00A950                          5         DTOR:
      00A950 90 85            [ 2]  559     POPW Y 
      00A952 90 BF 26         [ 2]  560     LDW YTEMP,Y 
      00A955 90 93            [ 1]  561     LDW Y,X 
      00A957 90 EE 02         [ 2]  562     LDW Y,(2,Y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 151.
Hexadecimal [24-Bits]



      00A95A 90 89            [ 2]  563     PUSHW Y   ; d low 
      00A95C 90 93            [ 1]  564     LDW Y,X 
      00A95E 90 FE            [ 2]  565     LDW Y,(Y)
      00A960 90 89            [ 2]  566     PUSHW Y   ; d hi 
      00A962 1C 00 04         [ 2]  567     ADDW X,#4  
      00A965 92 CC 26         [ 5]  568     JP [YTEMP]
                                    569 
                                    570 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    571 ;  2R> ( -- d ) R: d --      
                                    572 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0028E8                        573     _HEADER DRFROM,3,"2R>"
      00A968 A9 4C                    1         .word LINK 
                           0028EA     2         LINK=.
      00A96A 03                       3         .byte 3  
      00A96B 32 52 3E                 4         .ascii "2R>"
      00A96E                          5         DRFROM:
      00A96E 90 85            [ 2]  574     POPW Y      ; d hi 
      00A970 90 BF 26         [ 2]  575     LDW YTEMP,Y 
      00A973 1D 00 04         [ 2]  576     SUBW X,#4
      00A976 90 85            [ 2]  577     POPW Y       ; d hi 
      00A978 FF               [ 2]  578     LDW (X),Y 
      00A979 90 85            [ 2]  579     POPW Y       ; d low  
      00A97B EF 02            [ 2]  580     LDW (2,X),Y 
      00A97D 92 CC 26         [ 5]  581     JP [YTEMP]
                                    582     
                                    583 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    584 ;   2R@ ( -- d )
                                    585 ;   fecth a double from RSTACK
                                    586 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002900                        587     _HEADER DRAT,3,"2R@"
      00A980 A9 6A                    1         .word LINK 
                           002902     2         LINK=.
      00A982 03                       3         .byte 3  
      00A983 32 52 40                 4         .ascii "2R@"
      00A986                          5         DRAT:
      00A986 90 85            [ 2]  588     POPW Y 
      00A988 90 BF 26         [ 2]  589     LDW YTEMP,Y 
      00A98B 1D 00 04         [ 2]  590     SUBW X,#4 
      00A98E 16 01            [ 2]  591     LDW Y,(1,SP)
      00A990 FF               [ 2]  592     LDW (X),Y 
      00A991 16 03            [ 2]  593     LDW Y,(3,SP)
      00A993 EF 02            [ 2]  594     LDW (2,X),Y 
      00A995 92 CC 26         [ 5]  595     JP [YTEMP]
                                    596 
                                    597 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    598 ;  2VARIABLE <name> 
                                    599 ;  create a double variable 
                                    600 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002918                        601     _HEADER DVARIA,9,"2VARIABLE"
      00A998 A9 82                    1         .word LINK 
                           00291A     2         LINK=.
      00A99A 09                       3         .byte 9  
      00A99B 32 56 41 52 49 41 42     4         .ascii "2VARIABLE"
             4C 45
      00A9A4                          5         DVARIA:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 152.
Hexadecimal [24-Bits]



      00A9A4 CD 8D 7B         [ 4]  602         CALL HERE
      00A9A7 CD 86 99         [ 4]  603         CALL DUPP
      00292A                        604         _DOLIT 4  
      00A9AA CD 84 EF         [ 4]    1     CALL DOLIT 
      00A9AD 00 04                    2     .word 4 
      00A9AF CD 88 BC         [ 4]  605         CALL PLUS 
      00A9B2 CD 87 F0         [ 4]  606         CALL VPP 
      00A9B5 CD 85 51         [ 4]  607         CALL STORE
      00A9B8 CD 99 4C         [ 4]  608         CALL CREAT
      00A9BB CD 86 99         [ 4]  609         CALL DUPP
      00A9BE CD 95 BF         [ 4]  610         CALL COMMA
      00A9C1 CD 8C 9E         [ 4]  611         CALL ZERO
      00A9C4 CD 86 C1         [ 4]  612         CALL OVER 
      00A9C7 CD 85 51         [ 4]  613         CALL STORE 
      00A9CA CD 8C 9E         [ 4]  614         CALL ZERO 
      00A9CD CD 86 A9         [ 4]  615         CALL SWAPP 
      00A9D0 CD 85 51         [ 4]  616         CALL STORE
      00A9D3 CD A2 C1         [ 4]  617         CALL FMOVE ; move definition to FLASH
      00A9D6 CD 88 4C         [ 4]  618         CALL QDUP 
      00A9D9 CD 85 18         [ 4]  619         CALL QBRAN 
      00A9DC 99 99                  620         .word SET_RAMLAST   
      00A9DE CD 9D 69         [ 4]  621         call UPDATVP  ; don't update if variable kept in RAM.
      00A9E1 CD A3 55         [ 4]  622         CALL UPDATPTR
      00A9E4 81               [ 4]  623         RET         
                                    624 
                                    625 
                                    626 
                                    627 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    628 ;  2LITERAL ( d -- )
                                    629 ;  compile double literal 
                                    630 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002965                        631     _HEADER DLITER,IMEDD+8,"2LITERAL"
      00A9E5 A9 9A                    1         .word LINK 
                           002967     2         LINK=.
      00A9E7 88                       3         .byte IMEDD+8  
      00A9E8 32 4C 49 54 45 52 41     4         .ascii "2LITERAL"
             4C
      00A9F0                          5         DLITER:
      00A9F0 CD 96 04         [ 4]  632     CALL COMPI 
      00A9F3 A9 FB                  633     .word do2lit 
      00A9F5 CD 95 BF         [ 4]  634     CALL COMMA 
      00A9F8 CC 95 BF         [ 2]  635     JP   COMMA 
                                    636 
                                    637 
                                    638 ; runtime for 2LITERAL 
      00A9FB                        639 do2lit:
      00A9FB 1D 00 04         [ 2]  640     SUBW X,#4 
      00A9FE 16 01            [ 2]  641     LDW Y,(1,SP)
      00AA00 90 FE            [ 2]  642     LDW Y,(Y)
      00AA02 FF               [ 2]  643     LDW (X),Y 
      00AA03 16 01            [ 2]  644     LDW Y,(1,SP)
      00AA05 90 EE 02         [ 2]  645     LDW Y,(2,Y)
      00AA08 EF 02            [ 2]  646     LDW (2,X),Y 
      00AA0A 90 85            [ 2]  647     POPW Y 
      00AA0C 90 EC 04         [ 2]  648     JP (4,Y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 153.
Hexadecimal [24-Bits]



                                    649 
                                    650 
                                    651 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    652 ;   2OVER ( d1 d2 -- d1 d2 d1 )
                                    653 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00298F                        654     _HEADER DOVER,5,"2OVER"
      00AA0F A9 E7                    1         .word LINK 
                           002991     2         LINK=.
      00AA11 05                       3         .byte 5  
      00AA12 32 4F 56 45 52           4         .ascii "2OVER"
      00AA17                          5         DOVER:
      00AA17 90 93            [ 1]  655     LDW Y,X 
      00AA19 1D 00 04         [ 2]  656     SUBW X,#4 
      00AA1C 90 89            [ 2]  657     PUSHW Y 
      00AA1E 90 EE 04         [ 2]  658     LDW Y,(4,Y)  ; d1 hi 
      00AA21 FF               [ 2]  659     LDW (X),Y 
      00AA22 90 85            [ 2]  660     POPW Y 
      00AA24 90 EE 06         [ 2]  661     LDW Y,(6,Y)  ;d1 lo 
      00AA27 EF 02            [ 2]  662     LDW (2,X),Y 
      00AA29 81               [ 4]  663     RET 
                                    664 
                                    665 
                                    666 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    667 ;   D2/ ( d -- d/2 )
                                    668 ;   divide double by 2 
                                    669 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0029AA                        670     _HEADER D2SLASH,3,"D2/"
      00AA2A AA 11                    1         .word LINK 
                           0029AC     2         LINK=.
      00AA2C 03                       3         .byte 3  
      00AA2D 44 32 2F                 4         .ascii "D2/"
      00AA30                          5         D2SLASH:
      00AA30 90 93            [ 1]  671     LDW Y,X 
      00AA32 90 FE            [ 2]  672     LDW Y,(Y)
      00AA34 90 57            [ 2]  673     SRAW Y 
      00AA36 FF               [ 2]  674     LDW (X),Y 
      00AA37 90 93            [ 1]  675     LDW Y,X 
      00AA39 90 EE 02         [ 2]  676     LDW Y,(2,Y)
      00AA3C 90 56            [ 2]  677     RRCW Y 
      00AA3E EF 02            [ 2]  678     LDW (2,X),Y 
      00AA40 81               [ 4]  679     RET
                                    680 
                                    681 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    682 ;  D2* ( d -- d*2 )
                                    683 ;  multiply double by 2 
                                    684 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0029C1                        685     _HEADER D2STAR,3,"D2*"
      00AA41 AA 2C                    1         .word LINK 
                           0029C3     2         LINK=.
      00AA43 03                       3         .byte 3  
      00AA44 44 32 2A                 4         .ascii "D2*"
      00AA47                          5         D2STAR:
      00AA47 90 93            [ 1]  686     LDW Y,X 
      00AA49 90 EE 02         [ 2]  687     LDW Y,(2,Y)
      00AA4C 98               [ 1]  688     RCF 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 154.
Hexadecimal [24-Bits]



      00AA4D 90 59            [ 2]  689     RLCW Y 
      00AA4F EF 02            [ 2]  690     LDW (2,X),Y 
      00AA51 90 93            [ 1]  691     LDW Y,X 
      00AA53 90 FE            [ 2]  692     LDW Y,(Y)
      00AA55 90 59            [ 2]  693     RLCW Y 
      00AA57 FF               [ 2]  694     LDW (X),Y 
      00AA58 81               [ 4]  695     RET 
                                    696 
                                    697 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    698 ;   DLSHIFT ( d n -- d )
                                    699 ;   left shift double 
                                    700 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0029D9                        701     _HEADER DLSHIFT,7,"DLSHIFT"
      00AA59 AA 43                    1         .word LINK 
                           0029DB     2         LINK=.
      00AA5B 07                       3         .byte 7  
      00AA5C 44 4C 53 48 49 46 54     4         .ascii "DLSHIFT"
      00AA63                          5         DLSHIFT:
      00AA63 E6 01            [ 1]  702     LD A,(1,X) ; shift count 
      00AA65 A4 1F            [ 1]  703     AND A,#31
      00AA67 1C 00 02         [ 2]  704     ADDW X,#CELLL 
      00AA6A 90 93            [ 1]  705     LDW Y,X 
      00AA6C 90 FE            [ 2]  706     LDW Y,(Y)
      00AA6E 90 BF 26         [ 2]  707     LDW YTEMP,Y  ; d hi 
      00AA71 90 93            [ 1]  708     LDW Y,X 
      00AA73 90 EE 02         [ 2]  709     LDW Y,(2,Y)  ; d low 
      00AA76                        710 DLSHIFT1:
      00AA76 4D               [ 1]  711     TNZ A 
      00AA77 27 12            [ 1]  712     JREQ DLSHIFT2 
      00AA79 98               [ 1]  713     RCF 
      00AA7A 90 59            [ 2]  714     RLCW Y 
      00AA7C 90 89            [ 2]  715     PUSHW Y 
      00AA7E 90 BE 26         [ 2]  716     LDW Y,YTEMP 
      00AA81 90 59            [ 2]  717     RLCW Y 
      00AA83 90 BF 26         [ 2]  718     LDW YTEMP,Y 
      00AA86 90 85            [ 2]  719     POPW Y 
      00AA88 4A               [ 1]  720     DEC A 
      00AA89 20 EB            [ 2]  721     JRA DLSHIFT1 
      00AA8B                        722 DLSHIFT2:
      00AA8B EF 02            [ 2]  723     LDW (2,X),Y 
      00AA8D 90 BE 26         [ 2]  724     LDW Y,YTEMP 
      00AA90 FF               [ 2]  725     LDW (X),Y 
      00AA91 81               [ 4]  726     RET 
                                    727 
                                    728 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    729 ;  DRSHIFT ( d n -- d )
                                    730 ;  shift right n bits 
                                    731 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002A12                        732     _HEADER DRSHIFT,7,"DRSHIFT"
      00AA92 AA 5B                    1         .word LINK 
                           002A14     2         LINK=.
      00AA94 07                       3         .byte 7  
      00AA95 44 52 53 48 49 46 54     4         .ascii "DRSHIFT"
      00AA9C                          5         DRSHIFT:
      00AA9C E6 01            [ 1]  733     LD A,(1,X)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 155.
Hexadecimal [24-Bits]



      00AA9E A4 1F            [ 1]  734     AND A,#31
      00AAA0 1C 00 02         [ 2]  735     ADDW X,#2 
      00AAA3                        736 DRSHIFT1:
      00AAA3 4D               [ 1]  737     TNZ A 
      00AAA4 27 13            [ 1]  738     JREQ DRSHIFT2 
      00AAA6 90 93            [ 1]  739     LDW Y,X 
      00AAA8 90 FE            [ 2]  740     LDW Y,(Y)
      00AAAA 90 54            [ 2]  741     SRLW Y 
      00AAAC FF               [ 2]  742     LDW (X),Y 
      00AAAD 90 93            [ 1]  743     LDW Y,X 
      00AAAF 90 EE 02         [ 2]  744     LDW Y,(2,Y)
      00AAB2 90 56            [ 2]  745     RRCW Y 
      00AAB4 EF 02            [ 2]  746     LDW (2,X),Y 
      00AAB6 4A               [ 1]  747     DEC A
      00AAB7 20 EA            [ 2]  748     JRA DRSHIFT1  
      00AAB9                        749 DRSHIFT2:
      00AAB9 81               [ 4]  750     RET 
                                    751 
                                    752 
                                    753 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    754 ;   D* ( d1 d2 -- d3 )
                                    755 ;   double product 
                                    756 ;   d3 = d1 * d2
                                    757 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002A3A                        758     _HEADER DSTAR,2,"D*"
      00AABA AA 94                    1         .word LINK 
                           002A3C     2         LINK=.
      00AABC 02                       3         .byte 2  
      00AABD 44 2A                    4         .ascii "D*"
      00AABF                          5         DSTAR:
      00AABF CD 86 99         [ 4]  759     CALL DUPP 
      00AAC2 CD 86 D0         [ 4]  760     CALL ZLESS  
      00AAC5 CD 86 62         [ 4]  761     CALL TOR    ; R: d2sign 
      00AAC8 CD A6 E5         [ 4]  762     CALL DABS   
      00AACB CD 85 B4         [ 4]  763     CALL RFROM 
      00AACE CD 88 7C         [ 4]  764     CALL NROT  ; d1 d2s ud2
      00AAD1 CD A9 50         [ 4]  765     CALL DTOR  ; d1 d2s R: ud2  
      00AAD4 CD 86 62         [ 4]  766     CALL TOR   ; d1 R: ud2 d2s   
      00AAD7 CD 86 99         [ 4]  767     CALL DUPP 
      00AADA CD 86 D0         [ 4]  768     CALL ZLESS 
      00AADD CD 85 B4         [ 4]  769     CALL RFROM 
      00AAE0 CD 87 1F         [ 4]  770     CALL XORR   
      00AAE3 CD 86 62         [ 4]  771     CALL TOR   ; d1 R: ud2 prod_sign  
      00AAE6 CD A6 E5         [ 4]  772     CALL DABS ; ud1 R: ud2 ps  
      00AAE9 CD 85 B4         [ 4]  773     CALL RFROM  
      00AAEC CD 88 7C         [ 4]  774     CALL NROT   ; ps ud1 
      00AAEF CD 88 A7         [ 4]  775     CALL DDUP   ; ps ud1 ud1  
      00AAF2 CD 85 B4         [ 4]  776     CALL RFROM  ; ps ud1 ud1 ud2hi 
      00AAF5 CD A7 DB         [ 4]  777     CALL DSSTAR ; ps ud1 dprodhi 
                                    778 ; shift partial product 16 bits left 
      002A78                        779     _DROP   ; drop overflow 
      00AAF8 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00AAFB CD 8C 9E         [ 4]  780     CALL ZERO   ; ps ud1 prodhi 
      00AAFE CD 86 A9         [ 4]  781     CALL SWAPP  
      00AB01 CD A8 01         [ 4]  782     CALL DSWAP  ; ps dprodhi ud1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 156.
Hexadecimal [24-Bits]



      00AB04 CD 85 B4         [ 4]  783     CALL RFROM  ; ps dprodhi ud1 ud2lo
      00AB07 CD A7 DB         [ 4]  784     CALL DSSTAR ; ps  dprodhi dprodlo 
      00AB0A CD AC 13         [ 4]  785     CALL DPLUS
      00AB0D CD 88 5D         [ 4]  786     CALL ROT    ; dprod ps 
      002A90                        787     _QBRAN DDSTAR3 
      00AB10 CD 85 18         [ 4]    1     CALL QBRAN
      00AB13 AB 18                    2     .word DDSTAR3
      00AB15 CD 89 18         [ 4]  788     CALL DNEGA 
      00AB18                        789 DDSTAR3:  
      00AB18 81               [ 4]  790     RET 
                                    791 
                                    792 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    793 ;  UD/MOD ( ud1 ud2 -- dr udq )
                                    794 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002A99                        795     _HEADER UDSLMOD,6,"UD/MOD"
      00AB19 AA BC                    1         .word LINK 
                           002A9B     2         LINK=.
      00AB1B 06                       3         .byte 6  
      00AB1C 55 44 2F 4D 4F 44        4         .ascii "UD/MOD"
      00AB22                          5         UDSLMOD:
                                    796 ; unsigned double division 
      00AB22 CD 8C 9E         [ 4]  797     CALL ZERO 
      00AB25 CD 8C 9E         [ 4]  798     CALL ZERO
      00AB28 CD A9 50         [ 4]  799     CALL DTOR ; quotient  R: qlo qhi 
      00AB2B CD AA 17         [ 4]  800     CALL DOVER 
      00AB2E CD A8 2F         [ 4]  801     CALL DCLZ ; n2, dividend leading zeros  
      00AB31 CD 86 62         [ 4]  802     CALL TOR 
      00AB34 CD 88 A7         [ 4]  803     CALL DDUP    
      00AB37 CD A8 2F         [ 4]  804     CALL DCLZ  ; n1, divisor leading zeros
      00AB3A CD 85 B4         [ 4]  805     CALL RFROM ; n1 n2 
      00AB3D CD 89 52         [ 4]  806     CALL SUBB  ; loop count 
      00AB40 CD 86 99         [ 4]  807     CALL DUPP
      00AB43 CD A9 50         [ 4]  808     CALL DTOR  ; ud1 ud2 R: qlo qhi cntr cntr 
      00AB46 CD 85 C5         [ 4]  809     CALL RAT    
      00AB49 CD 86 D0         [ 4]  810     CALL ZLESS 
      002ACC                        811     _TBRAN UDSLA7 ; quotient is null 
      00AB4C CD 85 26         [ 4]    1     CALL TBRAN 
      00AB4F AB AE                    2     .word UDSLA7 
      00AB51 CD 85 C5         [ 4]  812     CALL RAT 
      00AB54 CD AA 63         [ 4]  813     CALL DLSHIFT ; align divisor with dividend 
      00AB57                        814 UDSLA3: ; division loop -- dividend divisor  
      00AB57 90 5F            [ 1]  815     CLRW Y 
      00AB59 90 89            [ 2]  816     PUSHW Y  
      00AB5B CD AA 17         [ 4]  817     CALL DOVER 
      00AB5E CD AA 17         [ 4]  818     CALL DOVER 
      00AB61 CD A9 1E         [ 4]  819     CALL DLESS 
      002AE4                        820     _TBRAN UDSLA4 
      00AB64 CD 85 26         [ 4]    1     CALL TBRAN 
      00AB67 AB 7D                    2     .word UDSLA4 
      00AB69 90 85            [ 2]  821     POPW Y 
      00AB6B 72 A9 00 01      [ 2]  822     ADDW Y,#1 
      00AB6F 90 89            [ 2]  823     PUSHW Y    ; quotiend least bit 
      00AB71 CD 88 A7         [ 4]  824     CALL DDUP  ; dividend divisor divisor 
      00AB74 CD A9 50         [ 4]  825     CALL DTOR  
      00AB77 CD AC 45         [ 4]  826     CALL DSUB  ; dividend-divisor 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 157.
Hexadecimal [24-Bits]



      00AB7A CD A9 6E         [ 4]  827     CALL DRFROM  ; dividend- divisor  
      00AB7D                        828 UDSLA4: ; shift quotient and add 1 bit 
      00AB7D 90 85            [ 2]  829     POPW Y 
      00AB7F 90 BF 26         [ 2]  830     LDW YTEMP,Y 
      00AB82 16 07            [ 2]  831     LDW Y,(7,SP) ; quotient low 
      00AB84 98               [ 1]  832     RCF 
      00AB85 90 59            [ 2]  833     RLCW Y
      00AB87 17 07            [ 2]  834     LDW (7,SP),Y 
      00AB89 16 05            [ 2]  835     LDW Y,(5,SP) ; quotient hi 
      00AB8B 90 59            [ 2]  836     RLCW Y 
      00AB8D 17 05            [ 2]  837     LDW (5,SP),Y 
      00AB8F 16 07            [ 2]  838     LDW Y,(7,SP) 
      00AB91 72 B9 00 26      [ 2]  839     ADDW Y,YTEMP
      00AB95 17 07            [ 2]  840     LDW (7,SP),Y 
      00AB97 16 01            [ 2]  841     LDW Y,(1,SP) ; loop counter 
      00AB99 90 5D            [ 2]  842     TNZW Y 
      00AB9B 27 1C            [ 1]  843     JREQ UDSLA8
      00AB9D 72 A2 00 01      [ 2]  844     SUBW Y,#1  
      00ABA1 17 01            [ 2]  845     LDW (1,SP),Y  
                                    846 ; shift dividend left 1 bit      
      00ABA3 CD A8 01         [ 4]  847     CALL DSWAP 
      00ABA6 CD AA 47         [ 4]  848     CALL D2STAR 
      00ABA9 CD A8 01         [ 4]  849     CALL DSWAP 
      00ABAC 20 A9            [ 2]  850     JRA UDSLA3 
      00ABAE                        851 UDSLA7:
      00ABAE CD 8C 9E         [ 4]  852     CALL ZERO 
      002B31                        853     _DOLIT 1 
      00ABB1 CD 84 EF         [ 4]    1     CALL DOLIT 
      00ABB4 00 01                    2     .word 1 
      00ABB6 CD 86 3E         [ 4]  854     CALL NRSTO ; R: 0 0 0 cntr    
      00ABB9                        855 UDSLA8:
      00ABB9 1C 00 04         [ 2]  856     ADDW X,#4 ; drop divisor
      00ABBC CD 85 B4         [ 4]  857     CALL RFROM  
      002B3F                        858     _DROP ; drop cntr 
      00ABBF 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00ABC2 CD 85 B4         [ 4]  859     CALL RFROM   ; shift count
      00ABC5 CD AA 9C         [ 4]  860     CALL DRSHIFT 
                                    861     ; quotient replace dividend 
      00ABC8 CD A9 6E         [ 4]  862     CALL DRFROM  ; quotient 
      00ABCB 81               [ 4]  863     RET 
                                    864 
                                    865 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    866 ;   D/MOD  ( d1 d2 -- dr dq )
                                    867 ;   double division dq=d1/d2
                                    868 ;   dr remainder double 
                                    869 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002B4C                        870     _HEADER DDSLMOD,5,"D/MOD"  
      00ABCC AB 1B                    1         .word LINK 
                           002B4E     2         LINK=.
      00ABCE 05                       3         .byte 5  
      00ABCF 44 2F 4D 4F 44           4         .ascii "D/MOD"
      00ABD4                          5         DDSLMOD:
      00ABD4 CD A6 F6         [ 4]  871     CALL DSIGN 
      00ABD7 CD 86 62         [ 4]  872     CALL TOR   ; R: divisor sign 
      00ABDA CD A6 E5         [ 4]  873     CALL DABS 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 158.
Hexadecimal [24-Bits]



      00ABDD CD A8 01         [ 4]  874     CALL DSWAP 
      00ABE0 CD A6 F6         [ 4]  875     CALL DSIGN ; dividend sign 
      00ABE3 CD 85 B4         [ 4]  876     CALL RFROM 
      00ABE6 CD 87 1F         [ 4]  877     CALL XORR  ; quotient sign
      00ABE9 CD 86 62         [ 4]  878     CALL TOR   ; 
      00ABEC CD A6 E5         [ 4]  879     CALL DABS  ; d2 ud1 R: sign 
      00ABEF CD A8 01         [ 4]  880     CALL DSWAP  ; ud1 ud2 
      00ABF2 CD AB 22         [ 4]  881     CALL UDSLMOD ; ud1/ud2 -- dr dq  
      00ABF5 90 85            [ 2]  882     POPW Y ; sign 
      00ABF7 90 5D            [ 2]  883     TNZW Y 
      00ABF9 2A 03            [ 1]  884     JRPL DSLA9 
      00ABFB CD 89 18         [ 4]  885     CALL DNEGA ; remainder quotient 
      00ABFE                        886 DSLA9: 
      00ABFE 81               [ 4]  887     RET 
                                    888 
                                    889 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    890 ;   D/  ( d1 d2 -- dq )
                                    891 ;   division double by double 
                                    892 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002B7F                        893     _HEADER DSLASH,2,"D/"
      00ABFF AB CE                    1         .word LINK 
                           002B81     2         LINK=.
      00AC01 02                       3         .byte 2  
      00AC02 44 2F                    4         .ascii "D/"
      00AC04                          5         DSLASH:
      00AC04 CD AB D4         [ 4]  894     CALL DDSLMOD
      00AC07 CD A8 01         [ 4]  895     CALL DSWAP
      002B8A                        896     _DDROP 
      00AC0A 1C 00 04         [ 2]    1    ADDW X,#2*CELLL 
      00AC0D 81               [ 4]  897     RET 
                                    898 
                                    899 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    900 ;   D+ ( d1 d2 -- d3 )
                                    901 ;   add 2 doubles 
                                    902 ;   d3=d1+d2 
                                    903 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002B8E                        904     _HEADER DPLUS,2,"D+"
      00AC0E AC 01                    1         .word LINK 
                           002B90     2         LINK=.
      00AC10 02                       3         .byte 2  
      00AC11 44 2B                    4         .ascii "D+"
      00AC13                          5         DPLUS:
      00AC13 90 93            [ 1]  905     LDW Y,X 
      00AC15 90 FE            [ 2]  906     LDW Y,(Y)
      00AC17 90 BF 26         [ 2]  907     LDW YTEMP,Y ; d2 hi 
      00AC1A 90 93            [ 1]  908     LDW Y,X 
      00AC1C 90 EE 02         [ 2]  909     LDW Y,(2,Y)
      00AC1F 90 BF 24         [ 2]  910     LDW XTEMP,Y ; d2 lo 
      00AC22 1C 00 04         [ 2]  911     ADDW X,#4 
      00AC25 90 93            [ 1]  912     LDW Y,X 
      00AC27 90 EE 02         [ 2]  913     LDW Y,(2,Y) ; d1 lo
      00AC2A 72 B9 00 24      [ 2]  914     ADDW Y,XTEMP
      00AC2E EF 02            [ 2]  915     LDW (2,X),Y 
      00AC30 90 93            [ 1]  916     LDW Y,X 
      00AC32 90 FE            [ 2]  917     LDW Y,(Y) ; d1 hi 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 159.
Hexadecimal [24-Bits]



      00AC34 24 04            [ 1]  918     JRNC DPLUS1 
      00AC36 72 A9 00 01      [ 2]  919     ADDW Y,#1 
      00AC3A                        920 DPLUS1: 
      00AC3A 72 B9 00 26      [ 2]  921     ADDW Y,YTEMP 
      00AC3E FF               [ 2]  922     LDW (X),Y 
      00AC3F 81               [ 4]  923     RET 
                                    924 
                                    925 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    926 ;   D- ( d1 d2 -- d3 )
                                    927 ;   d3=d1-d2 
                                    928 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002BC0                        929     _HEADER DSUB,2,"D-"
      00AC40 AC 10                    1         .word LINK 
                           002BC2     2         LINK=.
      00AC42 02                       3         .byte 2  
      00AC43 44 2D                    4         .ascii "D-"
      00AC45                          5         DSUB:
      00AC45 90 93            [ 1]  930     LDW Y,X 
      00AC47 90 FE            [ 2]  931     LDW Y,(Y)
      00AC49 90 BF 26         [ 2]  932     LDW YTEMP,Y ; d2 hi 
      00AC4C 90 93            [ 1]  933     LDW Y,X 
      00AC4E 90 EE 02         [ 2]  934     LDW Y,(2,Y)
      00AC51 90 BF 24         [ 2]  935     LDW XTEMP,Y ; d2 lo 
      00AC54 1C 00 04         [ 2]  936     ADDW X,#4 
      00AC57 90 93            [ 1]  937     LDW Y,X 
      00AC59 90 EE 02         [ 2]  938     LDW Y,(2,Y) ; d1 lo
      00AC5C 72 B2 00 24      [ 2]  939     SUBW Y,XTEMP
      00AC60 EF 02            [ 2]  940     LDW (2,X),Y 
      00AC62 90 93            [ 1]  941     LDW Y,X 
      00AC64 90 FE            [ 2]  942     LDW Y,(Y) ; d1 hi 
      00AC66 24 04            [ 1]  943     JRNC DSUB1 
      00AC68 72 A2 00 01      [ 2]  944     SUBW Y,#1 
      00AC6C                        945 DSUB1: 
      00AC6C 72 B2 00 26      [ 2]  946     SUBW Y,YTEMP 
      00AC70 FF               [ 2]  947     LDW (X),Y 
      00AC71 81               [ 4]  948     RET 
                                    949 
                                    950 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 160.
Hexadecimal [24-Bits]



                                   4587 .endif 
                           000001  4588 .if WANT_FLOAT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 161.
Hexadecimal [24-Bits]



                                   4589         .include "float.asm"
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
      002BF2                         56     _HEADER FVER,9,"FLOAT-VER"
      00AC72 AC 42                    1         .word LINK 
                           002BF4     2         LINK=.
      00AC74 09                       3         .byte 9  
      00AC75 46 4C 4F 41 54 2D 56     4         .ascii "FLOAT-VER"
             45 52
      00AC7E                          5         FVER:
      00AC7E CD 90 16         [ 4]   57     CALL CR 
      00AC81 CD 90 43         [ 4]   58     CALL DOTQP 
      00AC84 11                      59     .byte  17 
      00AC85 66 6C 6F 61 74 33 32    60     .ascii "float32 library, "
             20 6C 69 62 72 61 72
             79 2C 20
      00AC96 CD 9B 94         [ 4]   61     CALL PRT_LICENCE 
      00AC99 CD 9B 6C         [ 4]   62     CALL COPYRIGHT 
      002C1C                         63     _DOLIT FLOAT_MAJOR     
      00AC9C CD 84 EF         [ 4]    1     CALL DOLIT 
      00AC9F 00 01                    2     .word FLOAT_MAJOR 
      002C21                         64     _DOLIT FLOAT_MINOR 
      00ACA1 CD 84 EF         [ 4]    1     CALL DOLIT 
      00ACA4 00 00                    2     .word FLOAT_MINOR 
      00ACA6 CC 9B A8         [ 2]   65     JP PRINT_VERSION 
                                     66 
                                     67 
                                     68 ;-------------------------
                                     69 ;    FPSW ( -- a )
                                     70 ;    floating state variable
                                     71 ;    bit 0 zero flag 
                                     72 ;    bit 1 negative flag 
                                     73 ;    bit 2 overflow/error flag 
                                     74 ;---------------------------
      002C29                         75     _HEADER FPSW,4,"FPSW"
      00ACA9 AC 74                    1         .word LINK 
                           002C2B     2         LINK=.
      00ACAB 04                       3         .byte 4  
      00ACAC 46 50 53 57              4         .ascii "FPSW"
      00ACB0                          5         FPSW:
      00ACB0 90 AE 00 08      [ 2]   76 	LDW Y,#UFPSW  
      00ACB4 1D 00 02         [ 2]   77 	SUBW X,#2
      00ACB7 FF               [ 2]   78     LDW (X),Y
      00ACB8 81               [ 4]   79     RET
                                     80 
                                     81 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     82 ;   FRESET ( -- )
                                     83 ;   reset FPSW variable 
                                     84 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
      002C39                         85     _HEADER FRESET,6,"FRESET"
      00ACB9 AC AB                    1         .word LINK 
                           002C3B     2         LINK=.
      00ACBB 06                       3         .byte 6  
      00ACBC 46 52 45 53 45 54        4         .ascii "FRESET"
      00ACC2                          5         FRESET:
      00ACC2 CD 8C 9E         [ 4]   86     CALL ZERO  
      00ACC5 CD AC B0         [ 4]   87     CALL FPSW 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 163.
Hexadecimal [24-Bits]



      00ACC8 CD 85 51         [ 4]   88     CALL STORE 
      00ACCB 81               [ 4]   89     RET 
                                     90 
                                     91 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     92 ;   FINIT ( -- )
                                     93 ;   initialize floating point 
                                     94 ;   library 
                                     95 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002C4C                         96     _HEADER FINIT,5,"FINIT"
      00ACCC AC BB                    1         .word LINK 
                           002C4E     2         LINK=.
      00ACCE 05                       3         .byte 5  
      00ACCF 46 49 4E 49 54           4         .ascii "FINIT"
      00ACD4                          5         FINIT:
      00ACD4 CD AC C2         [ 4]   97     CALL FRESET 
      00ACD7 81               [ 4]   98     RET 
                                     99 
                                    100 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    101 ;    FER ( -- u )
                                    102 ;    return FPSW value 
                                    103 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002C58                        104     _HEADER FER,3,"FER"
      00ACD8 AC CE                    1         .word LINK 
                           002C5A     2         LINK=.
      00ACDA 03                       3         .byte 3  
      00ACDB 46 45 52                 4         .ascii "FER"
      00ACDE                          5         FER:
      00ACDE CD AC B0         [ 4]  105     CALL FPSW 
      00ACE1 CD 85 63         [ 4]  106     CALL AT 
      00ACE4 81               [ 4]  107     RET 
                                    108 
                                    109 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    110 ;    FZE  ( -- 0|-1 )
                                    111 ;    return FPSW zero flag 
                                    112 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002C65                        113     _HEADER FZE,3,"FZE"
      00ACE5 AC DA                    1         .word LINK 
                           002C67     2         LINK=.
      00ACE7 03                       3         .byte 3  
      00ACE8 46 5A 45                 4         .ascii "FZE"
      00ACEB                          5         FZE:
      00ACEB CD AC B0         [ 4]  114     CALL FPSW
      00ACEE CD 85 63         [ 4]  115     CALL AT  
      00ACF1 CD 8C A9         [ 4]  116     CALL ONE 
      00ACF4 CD 86 F6         [ 4]  117     CALL ANDD
      00ACF7 CD 89 06         [ 4]  118     CALL NEGAT  
      00ACFA 81               [ 4]  119     RET 
                                    120 
                                    121 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    122 ;    FNE ( -- 0|-1 )
                                    123 ;    return FPSW negative flag 
                                    124 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002C7B                        125     _HEADER FNE,3,"FNE"
      00ACFB AC E7                    1         .word LINK 
                           002C7D     2         LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 164.
Hexadecimal [24-Bits]



      00ACFD 03                       3         .byte 3  
      00ACFE 46 4E 45                 4         .ascii "FNE"
      00AD01                          5         FNE:
      00AD01 CD AC B0         [ 4]  126     CALL FPSW 
      00AD04 CD 85 63         [ 4]  127     CALL AT 
      002C87                        128     _DOLIT 2 
      00AD07 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AD0A 00 02                    2     .word 2 
      00AD0C CD 86 F6         [ 4]  129     CALL ANDD
      00AD0F CD 8C 84         [ 4]  130     CALL TWOSL
      00AD12 CD 89 06         [ 4]  131     CALL NEGAT   
      00AD15 81               [ 4]  132     RET 
                                    133 
                                    134 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    135 ;   FOV (  -- 0|-1 )
                                    136 ;   return FPSW overflow flag 
                                    137 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002C96                        138     _HEADER FOV,3,"FOV"
      00AD16 AC FD                    1         .word LINK 
                           002C98     2         LINK=.
      00AD18 03                       3         .byte 3  
      00AD19 46 4F 56                 4         .ascii "FOV"
      00AD1C                          5         FOV:
      00AD1C CD AC B0         [ 4]  139     CALL FPSW
      00AD1F CD 85 63         [ 4]  140     CALL AT  
      002CA2                        141     _DOLIT 4 
      00AD22 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AD25 00 04                    2     .word 4 
      00AD27 CD 86 F6         [ 4]  142     CALL ANDD
      002CAA                        143     _DOLIT 2 
      00AD2A CD 84 EF         [ 4]    1     CALL DOLIT 
      00AD2D 00 02                    2     .word 2 
      00AD2F CD 8C 6C         [ 4]  144     CALL RSHIFT 
      00AD32 CD 89 06         [ 4]  145     CALL NEGAT  
      00AD35 81               [ 4]  146     RET 
                                    147 
                                    148 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    149 ;    SFZ ( f# -- f# )
                                    150 ;    set FPSW zero flag 
                                    151 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002CB6                        152     _HEADER SFZ,3,"SFZ"
      00AD36 AD 18                    1         .word LINK 
                           002CB8     2         LINK=.
      00AD38 03                       3         .byte 3  
      00AD39 53 46 5A                 4         .ascii "SFZ"
      00AD3C                          5         SFZ:
      00AD3C CD AC DE         [ 4]  153     CALL FER 
      002CBF                        154     _DOLIT 0xfffe 
      00AD3F CD 84 EF         [ 4]    1     CALL DOLIT 
      00AD42 FF FE                    2     .word 0xfffe 
      00AD44 CD 86 F6         [ 4]  155     CALL ANDD 
      00AD47 CD 86 62         [ 4]  156     CALL TOR    
      00AD4A CD 88 A7         [ 4]  157     CALL DDUP 
      002CCD                        158     _DOLIT 0xFF  
      00AD4D CD 84 EF         [ 4]    1     CALL DOLIT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 165.
Hexadecimal [24-Bits]



      00AD50 00 FF                    2     .word 0xFF 
      00AD52 CD 86 F6         [ 4]  159     CALL ANDD
      00AD55 CD A8 D6         [ 4]  160     CALL DZEQUAL 
      002CD8                        161     _DOLIT 1 
      00AD58 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AD5B 00 01                    2     .word 1 
      00AD5D CD 86 F6         [ 4]  162     CALL ANDD 
      00AD60 CD 85 B4         [ 4]  163     CALL RFROM 
      00AD63 CD 87 0A         [ 4]  164     CALL ORR 
      00AD66 CD AC B0         [ 4]  165     CALL FPSW 
      00AD69 CD 85 51         [ 4]  166     CALL STORE 
      00AD6C 81               [ 4]  167     RET 
                                    168 
                                    169 
                                    170 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    171 ;   SFN ( f# -- f# )
                                    172 ;   set FPSW negative flag 
                                    173 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002CED                        174     _HEADER SFN,3,"SFN"
      00AD6D AD 38                    1         .word LINK 
                           002CEF     2         LINK=.
      00AD6F 03                       3         .byte 3  
      00AD70 53 46 4E                 4         .ascii "SFN"
      00AD73                          5         SFN:
      00AD73 CD AC DE         [ 4]  175     CALL FER 
      002CF6                        176     _DOLIT 0xFFFD 
      00AD76 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AD79 FF FD                    2     .word 0xFFFD 
      00AD7B CD 86 F6         [ 4]  177     CALL ANDD  
      00AD7E CD 86 62         [ 4]  178     CALL TOR 
      00AD81 CD 86 99         [ 4]  179     CALL DUPP 
      002D04                        180     _DOLIT 0X80 
      00AD84 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AD87 00 80                    2     .word 0X80 
      00AD89 CD 86 F6         [ 4]  181     CALL ANDD 
      002D0C                        182     _DOLIT 6 
      00AD8C CD 84 EF         [ 4]    1     CALL DOLIT 
      00AD8F 00 06                    2     .word 6 
      00AD91 CD 8C 6C         [ 4]  183     CALL RSHIFT 
      00AD94 CD 85 B4         [ 4]  184     CALL RFROM 
      00AD97 CD 87 0A         [ 4]  185     CALL ORR 
      00AD9A CD AC B0         [ 4]  186     CALL FPSW 
      00AD9D CD 85 51         [ 4]  187     CALL STORE 
      00ADA0 81               [ 4]  188     RET 
                                    189 
                                    190 
                                    191 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    192 ;   SFV ( -- )
                                    193 ;   set overflow flag 
                                    194 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002D21                        195     _HEADER SFV,3,"SFV"
      00ADA1 AD 6F                    1         .word LINK 
                           002D23     2         LINK=.
      00ADA3 03                       3         .byte 3  
      00ADA4 53 46 56                 4         .ascii "SFV"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 166.
Hexadecimal [24-Bits]



      00ADA7                          5         SFV:
      00ADA7 CD AC DE         [ 4]  196     CALL FER 
      002D2A                        197     _DOLIT 4 
      00ADAA CD 84 EF         [ 4]    1     CALL DOLIT 
      00ADAD 00 04                    2     .word 4 
      00ADAF CD 87 0A         [ 4]  198     CALL ORR 
      00ADB2 CD AC B0         [ 4]  199     CALL FPSW 
      00ADB5 CD 85 51         [ 4]  200     CALL STORE 
      00ADB8 81               [ 4]  201     RET 
                                    202 
                                    203 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    204 ;  F>ME ( f# -- m e )
                                    205 ;  split float in mantissa/exponent 
                                    206 ;  m mantissa as a double 
                                    207 ;  e exponent as a single 
                                    208 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002D39                        209     _HEADER ATEXP,4,"F>ME"             
      00ADB9 AD A3                    1         .word LINK 
                           002D3B     2         LINK=.
      00ADBB 04                       3         .byte 4  
      00ADBC 46 3E 4D 45              4         .ascii "F>ME"
      00ADC0                          5         ATEXP:
      00ADC0 CD AC C2         [ 4]  210     CALL FRESET
      00ADC3 CD AD 73         [ 4]  211     CALL SFN
      00ADC6 CD AD 3C         [ 4]  212     CALL SFZ 
      00ADC9 90 93            [ 1]  213     LDW Y,X 
      00ADCB 90 FE            [ 2]  214     LDW Y,(Y)
      00ADCD 90 89            [ 2]  215     PUSHW Y 
      00ADCF 4F               [ 1]  216     CLR A  
      00ADD0 90 5E            [ 1]  217     SWAPW Y 
      00ADD2 2A 01            [ 1]  218     JRPL ATEXP1 
      00ADD4 43               [ 1]  219     CPL A 
      00ADD5                        220 ATEXP1: ; sign extend mantissa 
      00ADD5 90 5E            [ 1]  221     SWAPW Y 
      00ADD7 90 95            [ 1]  222     LD YH,A 
      00ADD9 FF               [ 2]  223     LDW (X),Y 
      00ADDA 1D 00 02         [ 2]  224     SUBW X,#CELLL 
      00ADDD 90 85            [ 2]  225     POPW Y 
      00ADDF 4F               [ 1]  226     CLR A 
      00ADE0 90 5D            [ 2]  227     TNZW Y 
      00ADE2 2A 01            [ 1]  228     JRPL ATEXP2 
      00ADE4 43               [ 1]  229     CPL A 
      00ADE5                        230 ATEXP2:
      00ADE5 90 5E            [ 1]  231     SWAPW Y 
      00ADE7 90 95            [ 1]  232     LD YH,A 
      00ADE9 FF               [ 2]  233     LDW (X),Y 
      00ADEA 81               [ 4]  234     RET 
                                    235 
                                    236 
                                    237 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    238 ;    ME>F ( m e -- f# )
                                    239 ;    built float from mantissa/exponent 
                                    240 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002D6B                        241     _HEADER STEXP,4,"ME>F"
      00ADEB AD BB                    1         .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 167.
Hexadecimal [24-Bits]



                           002D6D     2         LINK=.
      00ADED 04                       3         .byte 4  
      00ADEE 4D 45 3E 46              4         .ascii "ME>F"
      00ADF2                          5         STEXP:
      00ADF2 CD 86 99         [ 4]  242     CALL DUPP 
      00ADF5 CD 89 6C         [ 4]  243     CALL ABSS 
      002D78                        244     _DOLIT 127 
      00ADF8 CD 84 EF         [ 4]    1     CALL DOLIT 
      00ADFB 00 7F                    2     .word 127 
      00ADFD CD 89 D3         [ 4]  245     CALL GREAT
      002D80                        246     _QBRAN STEXP1
      00AE00 CD 85 18         [ 4]    1     CALL QBRAN
      00AE03 AE 08                    2     .word STEXP1
      00AE05 CD AD A7         [ 4]  247     CALL SFV
      00AE08                        248 STEXP1:
      00AE08 90 93            [ 1]  249     LDW Y,X 
      00AE0A 90 FE            [ 2]  250     LDW Y,(Y)
      00AE0C 4F               [ 1]  251     CLR A 
      00AE0D 90 95            [ 1]  252     LD YH,A
      00AE0F 90 5E            [ 1]  253     SWAPW Y 
      00AE11 90 89            [ 2]  254     PUSHW Y  ; e >r 
      00AE13 1C 00 02         [ 2]  255     ADDW X,#CELLL 
      00AE16 CD 88 A7         [ 4]  256     CALL DDUP 
      00AE19 CD A6 E5         [ 4]  257     CALL DABS
      00AE1C CD 86 A9         [ 4]  258     CALL SWAPP 
      002D9F                        259     _DROP  
      00AE1F 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      002DA2                        260     _DOLIT 127 
      00AE22 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AE25 00 7F                    2     .word 127 
      00AE27 CD 89 D3         [ 4]  261     CALL GREAT 
      002DAA                        262     _QBRAN STEXP2 
      00AE2A CD 85 18         [ 4]    1     CALL QBRAN
      00AE2D AE 32                    2     .word STEXP2
      00AE2F CD AD A7         [ 4]  263     CALL SFV 
      00AE32                        264 STEXP2: 
      00AE32 4F               [ 1]  265     CLR A 
      00AE33 F7               [ 1]  266     LD (X),A     
      00AE34 CD 85 B4         [ 4]  267     CALL RFROM 
      00AE37 CD 87 0A         [ 4]  268     CALL ORR
      00AE3A CD AD 3C         [ 4]  269     CALL SFZ 
      00AE3D CD AD 73         [ 4]  270     CALL SFN 
      00AE40 81               [ 4]  271     RET 
                                    272 
                                    273 
                                    274 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    275 ;   E. ( f# -- )
                                    276 ;   print float in scientific 
                                    277 ;   format 
                                    278 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002DC1                        279     _HEADER EDOT,2,"E."
      00AE41 AD ED                    1         .word LINK 
                           002DC3     2         LINK=.
      00AE43 02                       3         .byte 2  
      00AE44 45 2E                    4         .ascii "E."
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 168.
Hexadecimal [24-Bits]



      00AE46                          5         EDOT:
      00AE46 CD 87 5F         [ 4]  280     CALL BASE 
      00AE49 CD 85 63         [ 4]  281     CALL AT 
      00AE4C CD 86 62         [ 4]  282     CALL TOR 
      002DCF                        283     _DOLIT 10 
      00AE4F CD 84 EF         [ 4]    1     CALL DOLIT 
      00AE52 00 0A                    2     .word 10 
      00AE54 CD 87 5F         [ 4]  284     CALL BASE 
      00AE57 CD 85 51         [ 4]  285     CALL STORE 
      00AE5A CD AD C0         [ 4]  286     CALL ATEXP ; m e 
      00AE5D                        287 EDOT0:
      00AE5D CD 86 62         [ 4]  288     CALL TOR   
      00AE60 CD A6 E5         [ 4]  289     CALL DABS 
      00AE63 CD 8F D4         [ 4]  290     CALL SPACE 
      00AE66 CD 8E 98         [ 4]  291     CALL BDIGS     
      00AE69                        292 EDOT2: 
      00AE69 CD A7 51         [ 4]  293     CALL DDIG
      00AE6C CD 85 B4         [ 4]  294     CALL RFROM 
      00AE6F CD 8C 32         [ 4]  295     CALL ONEP 
      00AE72 CD 86 62         [ 4]  296     CALL TOR 
      00AE75 CD 86 99         [ 4]  297     CALL DUPP
      002DF8                        298     _QBRAN EDOT3 
      00AE78 CD 85 18         [ 4]    1     CALL QBRAN
      00AE7B AE 82                    2     .word EDOT3
      002DFD                        299     _BRAN EDOT2  
      00AE7D CD 85 34         [ 4]    1     CALL BRAN 
      00AE80 AE 69                    2     .word EDOT2 
      00AE82                        300 EDOT3:
      00AE82 CD 86 C1         [ 4]  301     CALL OVER 
      00AE85 CD 87 5F         [ 4]  302     CALL BASE 
      00AE88 CD 85 63         [ 4]  303     CALL AT 
      00AE8B CD 89 90         [ 4]  304     CALL ULESS 
      002E0E                        305     _QBRAN EDOT2 
      00AE8E CD 85 18         [ 4]    1     CALL QBRAN
      00AE91 AE 69                    2     .word EDOT2
      002E13                        306     _DOLIT '.'
      00AE93 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AE96 00 2E                    2     .word '.' 
      00AE98 CD 8E A8         [ 4]  307     CALL HOLD  
      00AE9B CD A7 51         [ 4]  308     CALL DDIG
      00AE9E CD AD 01         [ 4]  309     CALL FNE 
      002E21                        310     _QBRAN EDOT4 
      00AEA1 CD 85 18         [ 4]    1     CALL QBRAN
      00AEA4 AE AE                    2     .word EDOT4
      002E26                        311     _DOLIT '-'
      00AEA6 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AEA9 00 2D                    2     .word '-' 
      00AEAB CD 8E A8         [ 4]  312     CALL HOLD 
      00AEAE                        313 EDOT4:       
      002E2E                        314     _DROP 
      00AEAE 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00AEB1 CD 8E FD         [ 4]  315     CALL EDIGS 
      00AEB4 CD 8F FE         [ 4]  316     CALL TYPES
      00AEB7 CD 85 B4         [ 4]  317     CALL RFROM 
      00AEBA CD 88 4C         [ 4]  318     CALL QDUP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 169.
Hexadecimal [24-Bits]



      002E3D                        319     _QBRAN EDOT5     
      00AEBD CD 85 18         [ 4]    1     CALL QBRAN
      00AEC0 AE CD                    2     .word EDOT5
      002E42                        320     _DOLIT 'E'
      00AEC2 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AEC5 00 45                    2     .word 'E' 
      00AEC7 CD 84 B6         [ 4]  321     CALL EMIT 
      00AECA CD 90 BD         [ 4]  322     CALL DOT
      00AECD                        323 EDOT5: 
      00AECD CD 85 B4         [ 4]  324     CALL RFROM 
      00AED0 CD 87 5F         [ 4]  325     CALL BASE 
      00AED3 CD 85 51         [ 4]  326     CALL STORE  
      00AED6 81               [ 4]  327     RET 
                                    328 
                                    329 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                    330 ;   F. (f# -- )
                                    331 ;   print float in fixed
                                    332 ;   point format. 
                                    333 ;;;;;;;;;;;;;;;;;;;;;;;;;
      002E57                        334     _HEADER FDOT,2,"F."
      00AED7 AE 43                    1         .word LINK 
                           002E59     2         LINK=.
      00AED9 02                       3         .byte 2  
      00AEDA 46 2E                    4         .ascii "F."
      00AEDC                          5         FDOT:
      00AEDC CD 87 5F         [ 4]  335     CALL BASE 
      00AEDF CD 85 63         [ 4]  336     CALL AT 
      00AEE2 CD 86 62         [ 4]  337     CALL TOR 
      002E65                        338     _DOLIT 10 
      00AEE5 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AEE8 00 0A                    2     .word 10 
      00AEEA CD 87 5F         [ 4]  339     CALL BASE 
      00AEED CD 85 51         [ 4]  340     CALL STORE 
      00AEF0 CD AD C0         [ 4]  341     CALL    ATEXP
      00AEF3 CD 86 99         [ 4]  342     CALL    DUPP  
      00AEF6 CD 89 6C         [ 4]  343     CALL    ABSS 
      002E79                        344     _DOLIT  8
      00AEF9 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AEFC 00 08                    2     .word 8 
      00AEFE CD 89 D3         [ 4]  345     CALL    GREAT 
      002E81                        346     _QBRAN  FDOT1 
      00AF01 CD 85 18         [ 4]    1     CALL QBRAN
      00AF04 AF 09                    2     .word FDOT1
      00AF06 CC AE 5D         [ 2]  347     JP      EDOT0 
      00AF09                        348 FDOT1:
      00AF09 CD 8F D4         [ 4]  349     CALL    SPACE 
      00AF0C CD 86 62         [ 4]  350     CALL    TOR 
      00AF0F CD AD 01         [ 4]  351     CALL    FNE 
      002E92                        352     _QBRAN  FDOT0 
      00AF12 CD 85 18         [ 4]    1     CALL QBRAN
      00AF15 AF 1A                    2     .word FDOT0
      00AF17 CD 89 18         [ 4]  353     CALL    DNEGA 
      00AF1A                        354 FDOT0: 
      00AF1A CD 8E 98         [ 4]  355     CALL    BDIGS
      00AF1D CD 85 C5         [ 4]  356     CALL    RAT  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 170.
Hexadecimal [24-Bits]



      00AF20 CD 86 D0         [ 4]  357     CALL    ZLESS 
      002EA3                        358     _QBRAN  FDOT6 
      00AF23 CD 85 18         [ 4]    1     CALL QBRAN
      00AF26 AF 51                    2     .word FDOT6
      00AF28                        359 FDOT2: ; e<0 
      00AF28 CD A7 51         [ 4]  360     CALL    DDIG 
      00AF2B CD 85 B4         [ 4]  361     CALL    RFROM
      00AF2E CD 8C 32         [ 4]  362     CALL    ONEP 
      00AF31 CD 88 4C         [ 4]  363     CALL    QDUP 
      002EB4                        364     _QBRAN  FDOT3 
      00AF34 CD 85 18         [ 4]    1     CALL QBRAN
      00AF37 AF 41                    2     .word FDOT3
      00AF39 CD 86 62         [ 4]  365     CALL    TOR 
      002EBC                        366     _BRAN   FDOT2 
      00AF3C CD 85 34         [ 4]    1     CALL BRAN 
      00AF3F AF 28                    2     .word FDOT2 
      00AF41                        367 FDOT3:
      002EC1                        368     _DOLIT  '.' 
      00AF41 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AF44 00 2E                    2     .word '.' 
      00AF46 CD 8E A8         [ 4]  369     CALL    HOLD 
      00AF49 CD A7 6A         [ 4]  370     CALL    DDIGS
      002ECC                        371     _BRAN   FDOT9  
      00AF4C CD 85 34         [ 4]    1     CALL BRAN 
      00AF4F AF 66                    2     .word FDOT9 
      00AF51                        372 FDOT6: ; e>=0 
      002ED1                        373     _BRAN   FDOT8
      00AF51 CD 85 34         [ 4]    1     CALL BRAN 
      00AF54 AF 5E                    2     .word FDOT8 
      00AF56                        374 FDOT7:     
      002ED6                        375     _DOLIT  '0'
      00AF56 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AF59 00 30                    2     .word '0' 
      00AF5B CD 8E A8         [ 4]  376     CALL    HOLD 
      00AF5E                        377 FDOT8:
      00AF5E CD 85 03         [ 4]  378     CALL    DONXT 
      00AF61 AF 56                  379     .word   FDOT7
      00AF63 CD A7 6A         [ 4]  380     CALL    DDIGS 
      00AF66                        381 FDOT9:
      00AF66 CD AD 01         [ 4]  382     CALL    FNE 
      002EE9                        383     _QBRAN  FDOT10 
      00AF69 CD 85 18         [ 4]    1     CALL QBRAN
      00AF6C AF 76                    2     .word FDOT10
      002EEE                        384     _DOLIT '-' 
      00AF6E CD 84 EF         [ 4]    1     CALL DOLIT 
      00AF71 00 2D                    2     .word '-' 
      00AF73 CD 8E A8         [ 4]  385     CALL   HOLD 
      00AF76                        386 FDOT10:
      00AF76 CD 8E FD         [ 4]  387     CALL    EDIGS 
      00AF79 CD 8F FE         [ 4]  388     CALL    TYPES 
      00AF7C CD 85 B4         [ 4]  389     CALL    RFROM 
      00AF7F CD 87 5F         [ 4]  390     CALL    BASE 
      00AF82 CD 85 51         [ 4]  391     CALL    STORE 
      00AF85 81               [ 4]  392     RET 
                                    393 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 171.
Hexadecimal [24-Bits]



                                    394 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    395 ; return parsed exponent or 
                                    396 ; 0 if failed
                                    397 ; at entry exprect *a=='E'    
                                    398 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00AF86                        399 parse_exponent: ; a cntr -- e -1 | 0 
      00AF86 CD 86 62         [ 4]  400     CALL TOR   ; R: cntr 
      00AF89 CD 86 99         [ 4]  401     CALL DUPP 
      00AF8C CD 85 81         [ 4]  402     CALL CAT 
      002F0F                        403     _DOLIT 'E' 
      00AF8F CD 84 EF         [ 4]    1     CALL DOLIT 
      00AF92 00 45                    2     .word 'E' 
      00AF94 CD 89 7A         [ 4]  404     CALL EQUAL 
      002F17                        405     _QBRAN 1$
      00AF97 CD 85 18         [ 4]    1     CALL QBRAN
      00AF9A AF C7                    2     .word 1$
      00AF9C CD 8C 32         [ 4]  406     CALL ONEP 
      00AF9F CD 85 B4         [ 4]  407     CALL RFROM  ; a cntr 
      00AFA2 CD 8C 3F         [ 4]  408     CALL ONEM
      00AFA5 CD 86 99         [ 4]  409     CALL DUPP 
      002F28                        410     _QBRAN 2$ ; a cntr 
      00AFA8 CD 85 18         [ 4]    1     CALL QBRAN
      00AFAB AF CA                    2     .word 2$
      00AFAD CD 8C 9E         [ 4]  411     CALL ZERO
      00AFB0 CD 86 99         [ 4]  412     CALL DUPP 
      00AFB3 CD A8 01         [ 4]  413     CALL DSWAP ; 0 0 a cntr  
      00AFB6 CD A5 9D         [ 4]  414     CALL nsign 
      00AFB9 CD 86 62         [ 4]  415     CALL TOR   ; R: esign  
      00AFBC CD A5 CA         [ 4]  416     CALL parse_digits
      002F3F                        417     _QBRAN PARSEXP_SUCCESS ; parsed to end of string 
      00AFBF CD 85 18         [ 4]    1     CALL QBRAN
      00AFC2 AF D1                    2     .word PARSEXP_SUCCESS
                                    418 ; failed invalid character
      002F44                        419     _DDROP ; 0 a 
      00AFC4 1C 00 04         [ 2]    1    ADDW X,#2*CELLL 
      00AFC7                        420 1$: 
      00AFC7 CD 85 B4         [ 4]  421     CALL RFROM ; sign||cntr  
      00AFCA                        422 2$:
      002F4A                        423     _DDROP  ; a cntr || a sign || 0 cntr   
      00AFCA 1C 00 04         [ 2]    1    ADDW X,#2*CELLL 
      00AFCD CD 8C 9E         [ 4]  424     CALL ZERO   ; return only 0 
      00AFD0 81               [ 4]  425     RET 
      00AFD1                        426 PARSEXP_SUCCESS: 
      002F51                        427     _DDROP ; drop dhi a 
      00AFD1 1C 00 04         [ 2]    1    ADDW X,#2*CELLL 
      00AFD4 CD 85 B4         [ 4]  428     CALL RFROM ; es 
      002F57                        429     _QBRAN 1$
      00AFD7 CD 85 18         [ 4]    1     CALL QBRAN
      00AFDA AF DF                    2     .word 1$
      00AFDC CD 89 06         [ 4]  430     CALL NEGAT
      00AFDF                        431 1$:
      002F5F                        432     _DOLIT -1 ; -- e -1 
      00AFDF CD 84 EF         [ 4]    1     CALL DOLIT 
      00AFE2 FF FF                    2     .word -1 
      00AFE4 81               [ 4]  433     RET 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 172.
Hexadecimal [24-Bits]



                                    434 
                                    435 
                                    436 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    437 ;   FLOAT?  ( a dlo dhi a+ cntr sign d? -- f -3 | a 0 )
                                    438 ;   called by NUMBER? 
                                    439 ;   convert string to float 
                                    440 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002F65                        441     _HEADER FLOATQ,5,"FLOAT?"
      00AFE5 AE D9                    1         .word LINK 
                           002F67     2         LINK=.
      00AFE7 05                       3         .byte 5  
      00AFE8 46 4C 4F 41 54 3F        4         .ascii "FLOAT?"
      00AFEE                          5         FLOATQ:
      002F6E                        442     _QBRAN FLOATQ0 
      00AFEE CD 85 18         [ 4]    1     CALL QBRAN
      00AFF1 AF F8                    2     .word FLOATQ0
      002F73                        443     _BRAN FLOAT_ERROR  ; not a float, string start with '#'
      00AFF3 CD 85 34         [ 4]    1     CALL BRAN 
      00AFF6 B0 9D                    2     .word FLOAT_ERROR 
      00AFF8                        444 FLOATQ0:
                                    445 ; BASE must be 10 
      00AFF8 CD 87 5F         [ 4]  446     CALL BASE 
      00AFFB CD 85 63         [ 4]  447     CALL AT 
      002F7E                        448     _DOLIT 10 
      00AFFE CD 84 EF         [ 4]    1     CALL DOLIT 
      00B001 00 0A                    2     .word 10 
      00B003 CD 89 7A         [ 4]  449     CALL EQUAL 
      002F86                        450     _QBRAN FLOAT_ERROR 
      00B006 CD 85 18         [ 4]    1     CALL QBRAN
      00B009 B0 9D                    2     .word FLOAT_ERROR
                                    451 ; if float next char is '.' or 'E' 
      00B00B CD 86 62         [ 4]  452     CALL TOR ; R: sign  
      00B00E CD 86 62         [ 4]  453     CALL TOR ; R: sign cntr 
      00B011 CD 86 99         [ 4]  454     CALL DUPP
      00B014 CD 85 81         [ 4]  455     CALL CAT 
      002F97                        456     _DOLIT '.' 
      00B017 CD 84 EF         [ 4]    1     CALL DOLIT 
      00B01A 00 2E                    2     .word '.' 
      00B01C CD 89 7A         [ 4]  457     CALL EQUAL 
      002F9F                        458     _QBRAN FLOATQ1 ; not a dot 
      00B01F CD 85 18         [ 4]    1     CALL QBRAN
      00B022 B0 5D                    2     .word FLOATQ1
      00B024 CD 8C 32         [ 4]  459     CALL ONEP 
      00B027 CD 85 B4         [ 4]  460     CALL RFROM  ; dlo dhi a cntr R: sign  
      00B02A CD 8C 3F         [ 4]  461     CALL ONEM 
      00B02D CD 86 99         [ 4]  462     CALL DUPP 
      00B030 CD 86 62         [ 4]  463     CALL TOR  ; R: sign cntr 
                                    464 ; parse fractional part
      00B033 CD A5 CA         [ 4]  465     CALL parse_digits ; dlo dhi a cntr -- dm a cntr 
      00B036 CD 86 99         [ 4]  466     CALL DUPP 
      00B039 CD 85 B4         [ 4]  467     CALL RFROM 
      00B03C CD 86 A9         [ 4]  468     CALL SWAPP 
      00B03F CD 89 52         [ 4]  469     CALL SUBB ; fd -> fraction digits count 
      00B042 CD 86 62         [ 4]  470     CALL TOR  ; dlo dhi a cntr R: sign fd 
      00B045 CD 86 99         [ 4]  471     CALL DUPP ; cntr cntr  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 173.
Hexadecimal [24-Bits]



      002FC8                        472     _QBRAN 1$ ; end of string, no exponent
      00B048 CD 85 18         [ 4]    1     CALL QBRAN
      00B04B B0 52                    2     .word 1$
      002FCD                        473     _BRAN FLOATQ2
      00B04D CD 85 34         [ 4]    1     CALL BRAN 
      00B050 B0 66                    2     .word FLOATQ2 
      00B052 CD 86 A9         [ 4]  474 1$: CALL SWAPP 
      002FD5                        475     _DROP ; a
      00B055 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      002FD8                        476     _BRAN FLOATQ3        
      00B058 CD 85 34         [ 4]    1     CALL BRAN 
      00B05B B0 6E                    2     .word FLOATQ3 
      00B05D                        477 FLOATQ1: ; must push fd==0 on RSTACK 
      00B05D CD 85 B4         [ 4]  478     CALL RFROM ; cntr 
      00B060 CD 8C 9E         [ 4]  479     CALL ZERO  ; fd 
      00B063 CD 86 62         [ 4]  480     CALL TOR   ; dm a cntr R: sign fd 
      00B066                        481 FLOATQ2: 
      00B066 CD AF 86         [ 4]  482     CALL parse_exponent 
      002FE9                        483     _QBRAN FLOAT_ERROR0 ; exponent expected 
      00B069 CD 85 18         [ 4]    1     CALL QBRAN
      00B06C B0 9A                    2     .word FLOAT_ERROR0
      00B06E                        484 FLOATQ3: ; dm 0 || dm e  
      00B06E CD 85 B4         [ 4]  485     CALL RFROM ;  fd  
      00B071 CD 89 52         [ 4]  486     CALL SUBB  ; exp=e-fd 
      00B074 CD 88 7C         [ 4]  487     CALL NROT 
      00B077 CD 85 B4         [ 4]  488     CALL RFROM  ; sign 
      002FFA                        489     _QBRAN FLOATQ4 
      00B07A CD 85 18         [ 4]    1     CALL QBRAN
      00B07D B0 82                    2     .word FLOATQ4
      00B07F CD 89 18         [ 4]  490     CALL DNEGA 
      00B082                        491 FLOATQ4:
      00B082 CD 88 5D         [ 4]  492     CALL ROT 
      00B085 CD AD F2         [ 4]  493     CALL STEXP 
      00B088 CD 88 5D         [ 4]  494     CALL ROT 
      00300B                        495     _DROP 
      00B08B 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00B08E CD AD 73         [ 4]  496     CALL SFN 
      00B091 CD AD 3C         [ 4]  497     CALL SFZ 
      003014                        498     _DOLIT -3 
      00B094 CD 84 EF         [ 4]    1     CALL DOLIT 
      00B097 FF FD                    2     .word -3 
      00B099 81               [ 4]  499     RET       
      00B09A                        500 FLOAT_ERROR0: 
      00B09A CD A9 6E         [ 4]  501     CALL DRFROM ; sign df      
      00B09D                        502 FLOAT_ERROR: 
      00B09D CD 8C E0         [ 4]  503     CALL DEPTH 
      00B0A0 CD 8C 25         [ 4]  504     CALL CELLS 
      00B0A3 CD 86 79         [ 4]  505     CALL SPAT 
      00B0A6 CD 86 A9         [ 4]  506     CALL SWAPP 
      00B0A9 CD 88 BC         [ 4]  507     CALL PLUS  
      00B0AC CD 86 86         [ 4]  508     CALL SPSTO 
      00B0AF CD 8C 9E         [ 4]  509     CALL ZERO 
      00B0B2 81               [ 4]  510     RET 
                                    511 
                                    512 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 174.
Hexadecimal [24-Bits]



                                    513 ;  LSCALE ( f# -- f# )
                                    514 ;  m *=10 , e -= 1
                                    515 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      003033                        516     _HEADER LSCALE,6,"LSCALE"
      00B0B3 AF E7                    1         .word LINK 
                           003035     2         LINK=.
      00B0B5 06                       3         .byte 6  
      00B0B6 4C 53 43 41 4C 45        4         .ascii "LSCALE"
      00B0BC                          5         LSCALE:
      00B0BC CD AD C0         [ 4]  517     CALL ATEXP 
      00B0BF CD 8C A9         [ 4]  518     CALL ONE 
      00B0C2 CD 89 52         [ 4]  519     CALL SUBB 
      00B0C5 CD 86 62         [ 4]  520     CALL TOR
      003048                        521     _DOLIT 10 
      00B0C8 CD 84 EF         [ 4]    1     CALL DOLIT 
      00B0CB 00 0A                    2     .word 10 
      00B0CD CD A7 DB         [ 4]  522     CALL DSSTAR
      00B0D0 CD 85 B4         [ 4]  523     CALL RFROM 
      00B0D3 CD AD F2         [ 4]  524     CALL STEXP 
      00B0D6 81               [ 4]  525     RET  
                                    526 
                                    527 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    528 ;  RSCALE ( f# -- f# )
                                    529 ;  m /=10 , e+=1 
                                    530 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      003057                        531     _HEADER RSCALE,6,"RSCALE"
      00B0D7 B0 B5                    1         .word LINK 
                           003059     2         LINK=.
      00B0D9 06                       3         .byte 6  
      00B0DA 52 53 43 41 4C 45        4         .ascii "RSCALE"
      00B0E0                          5         RSCALE:
      00B0E0 CD AD C0         [ 4]  532     CALL ATEXP 
      00B0E3 CD 8C A9         [ 4]  533     CALL ONE 
      00B0E6 CD 88 BC         [ 4]  534     CALL PLUS 
      00B0E9 CD 86 62         [ 4]  535     CALL TOR 
      00306C                        536     _DOLIT 10 
      00B0EC CD 84 EF         [ 4]    1     CALL DOLIT 
      00B0EF 00 0A                    2     .word 10 
      00B0F1 CD A7 10         [ 4]  537     CALL DSLMOD 
      00B0F4 CD 88 5D         [ 4]  538     CALL ROT 
      003077                        539     _DROP 
      00B0F7 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00B0FA CD 85 B4         [ 4]  540     CALL RFROM 
      00B0FD CD AD F2         [ 4]  541     CALL STEXP 
      00B100 81               [ 4]  542     RET 
                                    543 
                                    544 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    545 ;  SCALEUP ( ud u1 u2 -- ud*10 u1 u2 )
                                    546 ;  while (ud<=0xcccccccc && u1<u2 ){
                                    547 ;        ud*10;
                                    548 ;        u2--;
                                    549 ;  }  
                                    550 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00B101                        551 SCALEUP:
      00B101 CD 88 A7         [ 4]  552     CALL DDUP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 175.
Hexadecimal [24-Bits]



      00B104 CD 89 A6         [ 4]  553     CALL LESS  
      003087                        554     _QBRAN SCALEUP3
      00B107 CD 85 18         [ 4]    1     CALL QBRAN
      00B10A B1 37                    2     .word SCALEUP3
      00B10C CD A9 50         [ 4]  555     CALL DTOR   ; R: u1 u2  
      00B10F CD 88 A7         [ 4]  556     CALL DDUP 
      003092                        557     _DOLIT 0XCCCC 
      00B112 CD 84 EF         [ 4]    1     CALL DOLIT 
      00B115 CC CC                    2     .word 0XCCCC 
      003097                        558     _DOLIT 0XCCC 
      00B117 CD 84 EF         [ 4]    1     CALL DOLIT 
      00B11A 0C CC                    2     .word 0XCCC 
      00B11C CD A9 13         [ 4]  559     CALL DGREAT  
      00309F                        560     _TBRAN SCALEUP2 
      00B11F CD 85 26         [ 4]    1     CALL TBRAN 
      00B122 B1 34                    2     .word SCALEUP2 
      0030A4                        561     _DOLIT 10 
      00B124 CD 84 EF         [ 4]    1     CALL DOLIT 
      00B127 00 0A                    2     .word 10 
      00B129 CD A7 B9         [ 4]  562     CALL UDSSTAR 
      00B12C CD A9 6E         [ 4]  563     CALL DRFROM 
      00B12F CD 8C 3F         [ 4]  564     CALL ONEM
      00B132 20 CD            [ 2]  565     JRA SCALEUP
      00B134                        566 SCALEUP2:
      00B134 CD A9 6E         [ 4]  567     CALL DRFROM
      00B137                        568 SCALEUP3: 
      00B137 81               [ 4]  569     RET 
                                    570 
                                    571 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    572 ; SCALEDOWN ( ud u1 u2 -- ud u1 u2 )
                                    573 ;  whhile (ud && u1>u2 ){ 
                                    574 ;     ud/10;
                                    575 ;     u2++;
                                    576 ;  } 
                                    577 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00B138                        578 SCALEDOWN: 
      00B138 CD 88 A7         [ 4]  579     CALL DDUP 
      00B13B CD 89 D3         [ 4]  580     CALL GREAT 
      0030BE                        581     _QBRAN SCALDN3 
      00B13E CD 85 18         [ 4]    1     CALL QBRAN
      00B141 B1 67                    2     .word SCALDN3
      00B143 CD A9 50         [ 4]  582     CALL DTOR 
      00B146 CD 88 A7         [ 4]  583     CALL DDUP 
      00B149 CD A8 D6         [ 4]  584     CALL DZEQUAL 
      0030CC                        585     _TBRAN SCALDN2  
      00B14C CD 85 26         [ 4]    1     CALL TBRAN 
      00B14F B1 64                    2     .word SCALDN2 
      0030D1                        586     _DOLIT 10
      00B151 CD 84 EF         [ 4]    1     CALL DOLIT 
      00B154 00 0A                    2     .word 10 
      00B156 CD 8C 9E         [ 4]  587     CALL ZERO  
      00B159 CD AC 04         [ 4]  588     CALL DSLASH 
      00B15C CD A9 6E         [ 4]  589     CALL DRFROM 
      00B15F CD 8C 32         [ 4]  590     CALL ONEP  
      00B162 20 D4            [ 2]  591     JRA SCALEDOWN 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 176.
Hexadecimal [24-Bits]



      00B164                        592 SCALDN2:
      00B164 CD A9 6E         [ 4]  593     CALL DRFROM 
      00B167                        594 SCALDN3:
      00B167 81               [ 4]  595     RET 
                                    596 
                                    597 
                                    598 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    599 ;  F-ALIGN ( f#1 f#2 -- m1 m2 e )
                                    600 ;  align to same exponent 
                                    601 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0030E8                        602     _HEADER FALIGN,7,"F-ALIGN"
      00B168 B0 D9                    1         .word LINK 
                           0030EA     2         LINK=.
      00B16A 07                       3         .byte 7  
      00B16B 46 2D 41 4C 49 47 4E     4         .ascii "F-ALIGN"
      00B172                          5         FALIGN:
      00B172 CD AD C0         [ 4]  603     CALL ATEXP 
      00B175 CD 86 62         [ 4]  604     CALL TOR 
      00B178 CD A8 01         [ 4]  605     CALL DSWAP 
      00B17B CD AD C0         [ 4]  606     CALL ATEXP 
      00B17E CD 86 62         [ 4]  607     CALL TOR    ; m2 m1 R: e2 e1 
      00B181 CD A8 01         [ 4]  608     CALL DSWAP 
      00B184 CD A9 86         [ 4]  609     CALL DRAT 
      00B187 CD 89 7A         [ 4]  610     CALL EQUAL 
      00310A                        611     _TBRAN FALGN8
      00B18A CD 85 26         [ 4]    1     CALL TBRAN 
      00B18D B2 0F                    2     .word FALGN8 
                                    612 ; scaleup the largest float 
                                    613 ; but limit mantissa <=0xccccccc
                                    614 ; to avoid mantissa overflow     
      00B18F CD A9 86         [ 4]  615     CALL DRAT ; m1 m2 e2 e1 
      00B192 CD 89 D3         [ 4]  616     CALL GREAT 
      003115                        617     _QBRAN FALGN4 ; e2<e1 
      00B195 CD 85 18         [ 4]    1     CALL QBRAN
      00B198 B1 AB                    2     .word FALGN4
                                    618 ; e2>e1 then scale up m2   
      00B19A CD A9 6E         [ 4]  619     CALL DRFROM 
      00B19D CD 86 A9         [ 4]  620     CALL SWAPP 
      00B1A0 CD B1 01         [ 4]  621     CALL SCALEUP 
      00B1A3 CD 86 A9         [ 4]  622     CALL SWAPP 
      00B1A6 CD A9 50         [ 4]  623     CALL DTOR 
      00B1A9 20 0F            [ 2]  624     JRA FALGN6
      00B1AB                        625 FALGN4: ; e2<e1 then scaleup m1 
      00B1AB CD A8 01         [ 4]  626     CALL DSWAP 
      00B1AE CD A9 6E         [ 4]  627     CALL DRFROM 
      00B1B1 CD B1 01         [ 4]  628     CALL SCALEUP 
      00B1B4 CD A9 50         [ 4]  629     CALL DTOR
      00B1B7 CD A8 01         [ 4]  630     CALL DSWAP 
                                    631 ; check again for e2==e1 
                                    632 ; if scaleup was not enough 
                                    633 ; to equalize exponent then
                                    634 ; scaledown smallest float     
      00B1BA                        635 FALGN6: 
      00B1BA CD A9 86         [ 4]  636     CALL DRAT 
      00B1BD CD 89 7A         [ 4]  637     CALL EQUAL 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 177.
Hexadecimal [24-Bits]



      003140                        638     _TBRAN FALGN8 
      00B1C0 CD 85 26         [ 4]    1     CALL TBRAN 
      00B1C3 B2 0F                    2     .word FALGN8 
                                    639 ; e2!=e1 need to scale down smallest 
      00B1C5 CD A9 86         [ 4]  640     CALL DRAT 
      00B1C8 CD 89 D3         [ 4]  641     CALL GREAT 
      00314B                        642     _QBRAN FALGN7 ; e2<e1 
      00B1CB CD 85 18         [ 4]    1     CALL QBRAN
      00B1CE B1 E1                    2     .word FALGN7
                                    643 ; e2>e1 scaledown m1 
      00B1D0 CD A8 01         [ 4]  644     CALL DSWAP 
      00B1D3 CD A9 6E         [ 4]  645     CALL DRFROM 
      00B1D6 CD B1 38         [ 4]  646     CALL SCALEDOWN
      00B1D9 CD 86 A9         [ 4]  647     CALL SWAPP 
      00B1DC CD A9 50         [ 4]  648     CALL DTOR 
      00B1DF 20 0F            [ 2]  649     JRA FALGN71  
      00B1E1                        650 FALGN7: ; e2<e1 scaledown m2 
      00B1E1 CD A9 6E         [ 4]  651     CALL DRFROM 
      00B1E4 CD 86 A9         [ 4]  652     CALL SWAPP 
      00B1E7 CD B1 38         [ 4]  653     CALL SCALEDOWN 
      00B1EA CD 86 A9         [ 4]  654     CALL SWAPP 
      00B1ED CD A9 50         [ 4]  655     CALL DTOR 
                                    656 ; after scaledown if e2!=e1 
                                    657 ; this imply that one of mantissa 
                                    658 ; as been nullified by scalling 
                                    659 ; hence keep largest exponent 
      00B1F0                        660 FALGN71:
      00B1F0 CD A9 86         [ 4]  661     CALL DRAT 
      00B1F3 CD 89 7A         [ 4]  662     CALL EQUAL
      003176                        663     _TBRAN FALGN8 
      00B1F6 CD 85 26         [ 4]    1     CALL TBRAN 
      00B1F9 B2 0F                    2     .word FALGN8 
      00B1FB CD A9 6E         [ 4]  664     CALL DRFROM 
      00B1FE CD 88 A7         [ 4]  665     CALL DDUP 
      00B201 CD 89 D3         [ 4]  666     CALL GREAT 
      003184                        667     _TBRAN FALGN72
      00B204 CD 85 26         [ 4]    1     CALL TBRAN 
      00B207 B2 0C                    2     .word FALGN72 
      00B209 CD 86 A9         [ 4]  668     CALL SWAPP     
      00B20C                        669 FALGN72:
      00B20C CD A9 50         [ 4]  670     CALL DTOR  ; now smallest e is at rtop.
      00B20F                        671 FALGN8:
      00B20F CD A9 6E         [ 4]  672     CALL DRFROM 
      003192                        673     _DROP 
      00B212 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00B215 81               [ 4]  674     RET 
                                    675 
                                    676 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    677 ;   F+ ( f#1 f#2 -- f#1+f#2 )
                                    678 ;   float addition 
                                    679 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      003196                        680     _HEADER FPLUS,2,"F+"
      00B216 B1 6A                    1         .word LINK 
                           003198     2         LINK=.
      00B218 02                       3         .byte 2  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 178.
Hexadecimal [24-Bits]



      00B219 46 2B                    4         .ascii "F+"
      00B21B                          5         FPLUS:
      00B21B CD B1 72         [ 4]  681     CALL FALIGN 
      00B21E CD 86 62         [ 4]  682     CALL TOR 
      00B221 CD AC 13         [ 4]  683     CALL DPLUS
      00B224 CD A6 F6         [ 4]  684     CALL DSIGN 
      00B227 CD 86 62         [ 4]  685     CALL TOR 
      00B22A CD A6 E5         [ 4]  686     CALL DABS 
      00B22D CD B2 90         [ 4]  687     CALL SCALETOM
      00B230 CD 85 B4         [ 4]  688     CALL RFROM 
      0031B3                        689     _QBRAN FPLUS1 
      00B233 CD 85 18         [ 4]    1     CALL QBRAN
      00B236 B2 3B                    2     .word FPLUS1
      00B238 CD 89 18         [ 4]  690     CALL DNEGA  
      00B23B                        691 FPLUS1: 
      00B23B CD 88 5D         [ 4]  692     CALL ROT   
      00B23E CD 85 B4         [ 4]  693     CALL RFROM
      00B241 CD 88 BC         [ 4]  694     CALL PLUS  
      00B244 CD AD F2         [ 4]  695     CALL STEXP 
      00B247 81               [ 4]  696     RET 
                                    697 
                                    698 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    699 ;  F- ( f#1 f#2 -- f#1-f#2 )
                                    700 ;  substraction 
                                    701 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0031C8                        702     _HEADER FSUB,2,"F-"
      00B248 B2 18                    1         .word LINK 
                           0031CA     2         LINK=.
      00B24A 02                       3         .byte 2  
      00B24B 46 2D                    4         .ascii "F-"
      00B24D                          5         FSUB:
      00B24D CD B1 72         [ 4]  703     CALL FALIGN 
      00B250 CD 86 62         [ 4]  704     CALL TOR 
      00B253 CD AC 45         [ 4]  705     CALL DSUB
      00B256 CD A6 F6         [ 4]  706     CALL DSIGN 
      00B259 CD 86 62         [ 4]  707     CALL TOR 
      00B25C CD A6 E5         [ 4]  708     CALL DABS 
      00B25F CD B2 90         [ 4]  709     CALL SCALETOM 
      00B262 CD 85 B4         [ 4]  710     CALL RFROM 
      0031E5                        711     _QBRAN FSUB1 
      00B265 CD 85 18         [ 4]    1     CALL QBRAN
      00B268 B2 6D                    2     .word FSUB1
      00B26A CD 89 18         [ 4]  712     CALL DNEGA 
      00B26D                        713 FSUB1:
      00B26D CD 88 5D         [ 4]  714     CALL ROT 
      00B270 CD 85 B4         [ 4]  715     CALL RFROM
      00B273 CD 88 BC         [ 4]  716     CALL PLUS  
      00B276 CD AD F2         [ 4]  717     CALL STEXP 
      00B279 81               [ 4]  718     RET 
                                    719 
                                    720 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    721 ; /mod10  ( m -- m/10 r )
                                    722 ; divide mantissa by 10 
                                    723 ; return quotient and remainder 
                                    724 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 179.
Hexadecimal [24-Bits]



      00B27A                        725 UMOD10:
      0031FA                        726     _DOLIT 10 
      00B27A CD 84 EF         [ 4]    1     CALL DOLIT 
      00B27D 00 0A                    2     .word 10 
      00B27F CD A7 10         [ 4]  727     CALL DSLMOD
      00B282 CD 88 5D         [ 4]  728     CALL ROT  
      00B285 81               [ 4]  729     RET 
                                    730 
                                    731 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    732 ;   SCALE>M ( ud1 -- e ud2 )
                                    733 ;   scale down a double  
                                    734 ;   by repeated d/10
                                    735 ;   until ud<=MAX_MANTISSA   
                                    736 ;   e is log10 exponent of scaled down
                                    737 ;   ud2 is scaled down ud1 
                                    738 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      003206                        739     _HEADER SCALETOM,7,"SCALE>M"
      00B286 B2 4A                    1         .word LINK 
                           003208     2         LINK=.
      00B288 07                       3         .byte 7  
      00B289 53 43 41 4C 45 3E 4D     4         .ascii "SCALE>M"
      00B290                          5         SCALETOM:
      00B290 CD 8C 9E         [ 4]  740     CALL ZERO 
      00B293 CD 88 7C         [ 4]  741     CALL NROT 
      00B296                        742 SCAL1:
      00B296 CD 86 99         [ 4]  743     CALL DUPP 
      003219                        744     _DOLIT 0X7F 
      00B299 CD 84 EF         [ 4]    1     CALL DOLIT 
      00B29C 00 7F                    2     .word 0X7F 
      00B29E CD 89 BD         [ 4]  745     CALL UGREAT 
      003221                        746     _QBRAN SCAL2  
      00B2A1 CD 85 18         [ 4]    1     CALL QBRAN
      00B2A4 B2 BA                    2     .word SCAL2
      00B2A6 CD B2 7A         [ 4]  747     CALL UMOD10 
      003229                        748     _DROP 
      00B2A9 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00B2AC CD 88 5D         [ 4]  749     CALL ROT 
      00B2AF CD 8C 32         [ 4]  750     CALL ONEP 
      00B2B2 CD 88 7C         [ 4]  751     CALL NROT  
      003235                        752     _BRAN SCAL1 
      00B2B5 CD 85 34         [ 4]    1     CALL BRAN 
      00B2B8 B2 96                    2     .word SCAL1 
      00B2BA                        753 SCAL2: 
      00B2BA 81               [ 4]  754     RET 
                                    755 
                                    756 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    757 ;  UDIV10 ( ut -- ut )
                                    758 ;  divide a 48 bits uint by 10 
                                    759 ;  used to scale down MM* 
                                    760 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00B2BB                        761 UDIV10:
      00B2BB 90 93            [ 1]  762     LDW Y,X 
      00B2BD 90 FE            [ 2]  763     LDW Y,(Y)
      00B2BF A6 0A            [ 1]  764     LD A,#10 
      00B2C1 90 62            [ 2]  765     DIV Y,A 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 180.
Hexadecimal [24-Bits]



      00B2C3 FF               [ 2]  766     LDW (X),Y 
      00B2C4 90 95            [ 1]  767     LD YH,A 
      00B2C6 E6 02            [ 1]  768     LD A,(2,X)
      00B2C8 90 97            [ 1]  769     LD YL,A 
      00B2CA A6 0A            [ 1]  770     LD A,#10 
      00B2CC 90 62            [ 2]  771     DIV Y,A 
      00B2CE 90 95            [ 1]  772     LD YH,A 
      00B2D0 90 9F            [ 1]  773     LD A,YL 
      00B2D2 E7 02            [ 1]  774     LD (2,X),A 
      00B2D4 E6 03            [ 1]  775     LD A,(3,X)
      00B2D6 90 97            [ 1]  776     LD YL,A 
      00B2D8 A6 0A            [ 1]  777     LD A,#10 
      00B2DA 90 62            [ 2]  778     DIV Y,A 
      00B2DC 90 95            [ 1]  779     LD YH,A 
      00B2DE 90 9F            [ 1]  780     LD A,YL 
      00B2E0 E7 03            [ 1]  781     LD (3,X),A 
      00B2E2 E6 04            [ 1]  782     LD A,(4,X)
      00B2E4 90 97            [ 1]  783     LD YL,A 
      00B2E6 A6 0A            [ 1]  784     LD A,#10 
      00B2E8 90 62            [ 2]  785     DIV Y,A 
      00B2EA 90 95            [ 1]  786     LD YH,A 
      00B2EC 90 9F            [ 1]  787     LD A,YL 
      00B2EE E7 04            [ 1]  788     LD (4,X),A 
      00B2F0 E6 05            [ 1]  789     LD A,(5,X)
      00B2F2 90 97            [ 1]  790     LD YL,A 
      00B2F4 A6 0A            [ 1]  791     LD A,#10 
      00B2F6 90 62            [ 2]  792     DIV Y,A 
      00B2F8 90 9F            [ 1]  793     LD A,YL 
      00B2FA E7 05            [ 1]  794     LD (5,X),A 
      00B2FC 81               [ 4]  795     RET 
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
      00327D                        806     _HEADER MMSTAR,3,"MM*"
      00B2FD B2 88                    1         .word LINK 
                           00327F     2         LINK=.
      00B2FF 03                       3         .byte 3  
      00B300 4D 4D 2A                 4         .ascii "MM*"
      00B303                          5         MMSTAR:
      00B303 CD 88 A7         [ 4]  807     CALL DDUP
      00B306 CD A8 D6         [ 4]  808     CALL DZEQUAL
      003289                        809     _TBRAN MMSTA2
      00B309 CD 85 26         [ 4]    1     CALL TBRAN 
      00B30C B3 19                    2     .word MMSTA2 
      00B30E                        810 MMSTA1:
      00B30E CD AA 17         [ 4]  811     CALL DOVER 
      00B311 CD A8 D6         [ 4]  812     CALL DZEQUAL 
      003294                        813     _QBRAN MMSTA3 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 181.
Hexadecimal [24-Bits]



      00B314 CD 85 18         [ 4]    1     CALL QBRAN
      00B317 B3 24                    2     .word MMSTA3
      00B319                        814 MMSTA2: ; ( -- 0 0 0 )
      00B319 1C 00 02         [ 2]  815     ADDW X,#2 
      00B31C 90 5F            [ 1]  816     CLRW Y 
      00B31E FF               [ 2]  817     LDW (X),Y 
      00B31F EF 02            [ 2]  818     LDW (2,X),Y
      00B321 EF 04            [ 2]  819     LDW (4,X),Y 
      00B323 81               [ 4]  820     RET 
      00B324                        821 MMSTA3:
      00B324 CD A6 F6         [ 4]  822     CALL DSIGN 
      00B327 CD 86 62         [ 4]  823     CALL TOR    ; R: m2sign 
      00B32A CD A6 E5         [ 4]  824     CALL DABS   ; m1 um2 
      00B32D CD A8 01         [ 4]  825     CALL DSWAP  ; um2 m1 
      00B330 CD A6 F6         [ 4]  826     CALL DSIGN  ; um2 m1 m1sign 
      00B333 CD 85 B4         [ 4]  827     CALL RFROM 
      00B336 CD 87 1F         [ 4]  828     CALL XORR 
      00B339 CD 86 62         [ 4]  829     CALL TOR   ; R: product_sign 
      00B33C CD A6 E5         [ 4]  830     CALL DABS  ; um2 um1  
      00B33F CD A9 50         [ 4]  831     CALL DTOR  ; um2 
      00B342 CD 86 99         [ 4]  832     CALL DUPP  ; um2 um2hi 
      00B345 CD 85 C5         [ 4]  833     CALL RAT   ; um2 um2hi um1hi
                                    834 ; first partial product  
                                    835 ; pd1=um2hi*um1hi 
      00B348 CD 8B B1         [ 4]  836     CALL STAR 
      00B34B CD 8C 9E         [ 4]  837     CALL ZERO 
      00B34E CD 86 A9         [ 4]  838     CALL SWAPP ; pd1<<16  
      00B351 CD A8 01         [ 4]  839     CALL DSWAP ; pd1 um2 
      00B354 CD 86 C1         [ 4]  840     CALL OVER  ; pd1 um2 um2lo 
      00B357 CD 85 B4         [ 4]  841     CALL RFROM ; pd1 um2 um2lo um1hi 
                                    842 ; pd2=um2lo*um1hi 
      00B35A CD 8B 67         [ 4]  843     CALL UMSTA ; pd1 um2 pd2 
      00B35D CD A8 01         [ 4]  844     CALL DSWAP ; pd1 pd2 um2 
      00B360 CD 85 C5         [ 4]  845     CALL RAT   ; pd1 pd2 um2 um1lo 
                                    846 ; pd3= um2hi*um1lo 
      00B363 CD 8B 67         [ 4]  847     CALL UMSTA ; pd1 pd2 um2lo pd3 
      00B366 CD 88 5D         [ 4]  848     CALL ROT ; pd1 pd2 pd3 um2lo 
      00B369 CD 86 62         [ 4]  849     CALL TOR ; pd1 pd2 pd3 R: psign um1lo um2lo 
                                    850 ; pd1+pd2+pd3  pd1
      00B36C CD AC 13         [ 4]  851     CALL DPLUS 
      00B36F CD AC 13         [ 4]  852     CALL DPLUS  
      00B372 CD A9 6E         [ 4]  853     CALL DRFROM ; triple um2lo um1lo 
                                    854 ; last partial product um2lo*um1lo 
      00B375 CD 8B 67         [ 4]  855     CALL UMSTA ; prod pd4 
                                    856 ; mm*=prod<<16+pd4  
      00B378 CD A9 50         [ 4]  857     CALL DTOR ;   R: psign pd4lo pd4hi  
                                    858  ; add pd4hi to prodlo and propagate carry 
      00B37B 90 93            [ 1]  859     LDW Y,X 
      00B37D 90 EE 02         [ 2]  860     LDW Y,(2,Y)  ; prodlo 
      00B380 72 F9 01         [ 2]  861     ADDW Y,(1,SP)  ; prodlo+pd4hi 
      00B383 17 01            [ 2]  862     LDW (1,SP),Y    ; plo phi  
      00B385 90 93            [ 1]  863     LDW Y,X
      00B387 90 FE            [ 2]  864     LDW Y,(Y) ; prodhi  
      00B389 24 04            [ 1]  865     JRNC MMSTA4
      00B38B 72 A9 00 01      [ 2]  866     ADDW Y,#1 ; add carry 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 182.
Hexadecimal [24-Bits]



      00B38F                        867 MMSTA4:     
      00B38F 1D 00 02         [ 2]  868     SUBW X,#2 
      00B392 FF               [ 2]  869     LDW (X),Y 
      00B393 90 85            [ 2]  870     POPW Y 
      00B395 EF 02            [ 2]  871     LDW (2,X),Y 
      00B397 90 85            [ 2]  872     POPW Y 
      00B399 EF 04            [ 2]  873     LDW (4,X),Y
      00B39B CD 8C 9E         [ 4]  874     CALL ZERO 
      00B39E CD 86 62         [ 4]  875     CALL TOR 
      00B3A1                        876 MMSTA5:
      00B3A1 CD 88 4C         [ 4]  877     CALL QDUP 
      003324                        878     _QBRAN MMSTA6 
      00B3A4 CD 85 18         [ 4]    1     CALL QBRAN
      00B3A7 B3 BA                    2     .word MMSTA6
      00B3A9 CD B2 BB         [ 4]  879     CALL UDIV10 
      00B3AC CD 85 B4         [ 4]  880     CALL RFROM 
      00B3AF CD 8C 32         [ 4]  881     CALL ONEP 
      00B3B2 CD 86 62         [ 4]  882     CALL TOR 
      003335                        883     _BRAN MMSTA5 
      00B3B5 CD 85 34         [ 4]    1     CALL BRAN 
      00B3B8 B3 A1                    2     .word MMSTA5 
                                    884 ; now scale to double 
                                    885 ; scale further <= MAX_MANTISSA 
      00B3BA                        886 MMSTA6: 
      00B3BA CD 85 B4         [ 4]  887     CALL RFROM 
      00B3BD CD 88 7C         [ 4]  888     CALL NROT 
      00B3C0 CD B2 90         [ 4]  889     CALL SCALETOM
      00B3C3 CD A9 50         [ 4]  890     CALL DTOR 
      00B3C6 CD 88 BC         [ 4]  891     CALL PLUS 
      00B3C9 CD A9 6E         [ 4]  892     CALL DRFROM 
      00B3CC CD 85 B4         [ 4]  893     CALL RFROM
      00334F                        894     _QBRAN MMSTA7
      00B3CF CD 85 18         [ 4]    1     CALL QBRAN
      00B3D2 B3 D7                    2     .word MMSTA7
      00B3D4 CD 89 18         [ 4]  895     CALL DNEGA
      00B3D7                        896 MMSTA7:
      00B3D7 CD 88 5D         [ 4]  897     CALL ROT ; m e 
      00B3DA 81               [ 4]  898     RET 
                                    899 
                                    900 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    901 ;    F* ( f#1 f#2 -- f#3 )
                                    902 ;    float product 
                                    903 ;    f#3=f#1 * f#2 
                                    904 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00335B                        905     _HEADER FSTAR,2,"F*"
      00B3DB B2 FF                    1         .word LINK 
                           00335D     2         LINK=.
      00B3DD 02                       3         .byte 2  
      00B3DE 46 2A                    4         .ascii "F*"
      00B3E0                          5         FSTAR:
      00B3E0 CD AD C0         [ 4]  906     CALL ATEXP ; f#1 m2 e2 
      00B3E3 CD 86 62         [ 4]  907     CALL TOR   
      00B3E6 CD A8 01         [ 4]  908     CALL DSWAP ; m2 f#1
      00B3E9 CD AD C0         [ 4]  909     CALL ATEXP ; m2 m1 e1 
      00B3EC CD 85 B4         [ 4]  910     CALL RFROM ; m2 m1 e1 e2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 183.
Hexadecimal [24-Bits]



      00B3EF CD 88 BC         [ 4]  911     CALL PLUS  ; m2 m1 e 
      00B3F2 CD 86 62         [ 4]  912     CALL TOR   ; m2 m1 R: e 
      00B3F5 CD B3 03         [ 4]  913     CALL MMSTAR ; m2*m1 e   
      00B3F8 CD 85 B4         [ 4]  914     CALL RFROM 
      00B3FB CD 88 BC         [ 4]  915     CALL PLUS 
      00B3FE CD AD F2         [ 4]  916     CALL STEXP ; f#3 
      00B401 81               [ 4]  917     RET 
                                    918 
                                    919 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    920 ;  F/ ( f#1 f#2 -- f#3 )
                                    921 ;  float division
                                    922 ;  f#3 = f#1/f#2
                                    923 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      003382                        924     _HEADER FSLASH,2,"F/"
      00B402 B3 DD                    1         .word LINK 
                           003384     2         LINK=.
      00B404 02                       3         .byte 2  
      00B405 46 2F                    4         .ascii "F/"
      00B407                          5         FSLASH:
      00B407 CD AD C0         [ 4]  925     CALL ATEXP  ; f#1 m2 e2 
      00B40A CD 86 62         [ 4]  926     CALL TOR    ; f#1 m2   R: e2 
      00B40D CD A6 F6         [ 4]  927     CALL DSIGN  ; f#1 m2 m2sign 
      00B410 CD 86 62         [ 4]  928     CALL TOR    ; F#1 m2 R: e2 m2s 
      00B413 CD A6 E5         [ 4]  929     CALL DABS   ; F#1 um2 
      00B416 CD A8 01         [ 4]  930     CALL DSWAP  ; m2 f#1 
      00B419 CD AD C0         [ 4]  931     CALL ATEXP  ; m2 m1 e1 
      00B41C CD 8C A9         [ 4]  932     CALL ONE    ; e2 slot on rstack  
      00B41F CD 86 1F         [ 4]  933     CALL NRAT   ; m2 m1 e1 e2 
      00B422 CD 89 52         [ 4]  934     CALL SUBB   ; m2 m1 e 
      00B425 CD 8C A9         [ 4]  935     CALL ONE    ; e slot on rstack 
      00B428 CD 86 3E         [ 4]  936     CALL NRSTO  ; m2 m1 R: e m2s 
      00B42B CD A6 F6         [ 4]  937     CALL DSIGN  ; m2 m1 m1sign 
      00B42E CD 85 B4         [ 4]  938     CALL RFROM  ; m2 m1 m1s m2s  
      00B431 CD 87 1F         [ 4]  939     CALL XORR   ; m2 m1 quot_sign R: e 
      00B434 CD 85 B4         [ 4]  940     CALL RFROM   
      00B437 CD A9 50         [ 4]  941     CALL DTOR   ; m2 m1 R: qs e  
      00B43A CD A6 E5         [ 4]  942     CALL DABS   ; um2 um1 R: qs e  
      00B43D CD A8 01         [ 4]  943     CALL DSWAP  ; m1 m2 R: qs e
      00B440 CD 88 A7         [ 4]  944     CALL DDUP  ; m1 m2 m2 R: qs e
      00B443 CD A9 50         [ 4]  945     CALL DTOR  ; m1 m2 R: qs e m2 ( keep divisor need later ) 
      00B446 CD AB 22         [ 4]  946     CALL UDSLMOD ; remainder m1/m2 R: e m2 
      00B449                        947 FSLASH1: 
      00B449 CD AA 17         [ 4]  948     CALL DOVER ; if remainder null done 
      00B44C CD A8 D6         [ 4]  949     CALL DZEQUAL 
      0033CF                        950     _TBRAN FSLASH8 
      00B44F CD 85 26         [ 4]    1     CALL TBRAN 
      00B452 B4 AF                    2     .word FSLASH8 
                                    951 ; get fractional digits from remainder until mantissa saturate
                                    952 ; remainder mantissa R: e divisor 
                                    953 ; check for mantissa saturation 
      00B454 CD 88 A7         [ 4]  954     CALL DDUP 
      0033D7                        955     _DOLIT 0XCCCC 
      00B457 CD 84 EF         [ 4]    1     CALL DOLIT 
      00B45A CC CC                    2     .word 0XCCCC 
      0033DC                        956     _DOLIT 0xC
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 184.
Hexadecimal [24-Bits]



      00B45C CD 84 EF         [ 4]    1     CALL DOLIT 
      00B45F 00 0C                    2     .word 0xC 
      00B461 CD A9 13         [ 4]  957     CALL DGREAT 
      0033E4                        958     _TBRAN FSLASH8 ; another loop would result in mantissa overflow 
      00B464 CD 85 26         [ 4]    1     CALL TBRAN 
      00B467 B4 AF                    2     .word FSLASH8 
                                    959 ; multiply mantissa by 10 
      0033E9                        960     _DOLIT 10 
      00B469 CD 84 EF         [ 4]    1     CALL DOLIT 
      00B46C 00 0A                    2     .word 10 
      00B46E CD 8C 9E         [ 4]  961     CALL ZERO 
      00B471 CD AA BF         [ 4]  962     CALL DSTAR 
                                    963 ; mutliply remainder by 10     
      00B474 CD A8 01         [ 4]  964     CALL DSWAP 
      0033F7                        965     _DOLIT 10 
      00B477 CD 84 EF         [ 4]    1     CALL DOLIT 
      00B47A 00 0A                    2     .word 10 
      00B47C CD 8C 9E         [ 4]  966     CALL ZERO 
      00B47F CD AA BF         [ 4]  967     CALL DSTAR 
                                    968 ; divide remainder by m2     
      00B482 CD A9 86         [ 4]  969     CALL DRAT  ; mantissa remainder divisor R: e divisor 
      00B485 CD AB 22         [ 4]  970     CALL UDSLMOD ; mantissa dr dq R: qs e divisor 
      00B488 CD A8 01         [ 4]  971     CALL DSWAP ; mantissa frac_digit remainder R: qs e divisor  
      00B48B CD A9 50         [ 4]  972     CALL DTOR  ; mantissa frac_digit R: qs e divisor remainder 
      00B48E CD AC 13         [ 4]  973     CALL DPLUS ; mantissa+frac_digit 
      00B491 CD A9 6E         [ 4]  974     CALL DRFROM ; mantissa remainder R: qs e divisor  
      00B494 CD A8 01         [ 4]  975     CALL DSWAP  ; remainder mantissa  
                                    976 ; increment e 
      003417                        977     _DOLIT 2    ; e slot on rstack 
      00B497 CD 84 EF         [ 4]    1     CALL DOLIT 
      00B49A 00 02                    2     .word 2 
      00B49C CD 86 1F         [ 4]  978     CALL NRAT   ;  2 NR@ -- e 
      00B49F CD 8C 32         [ 4]  979     CALL ONEP   ; increment exponent 
      003422                        980     _DOLIT 2 
      00B4A2 CD 84 EF         [ 4]    1     CALL DOLIT 
      00B4A5 00 02                    2     .word 2 
      00B4A7 CD 86 3E         [ 4]  981     CALL NRSTO  ; e 2 NR! , update e on rstack     
      00342A                        982     _BRAN FSLASH1
      00B4AA CD 85 34         [ 4]    1     CALL BRAN 
      00B4AD B4 49                    2     .word FSLASH1 
      00B4AF                        983 FSLASH8: ; remainder mantissa R: qs e divisor 
      00B4AF CD A8 01         [ 4]  984     CALL DSWAP  
      003432                        985     _DDROP  ; drop remainder     
      00B4B2 1C 00 04         [ 2]    1    ADDW X,#2*CELLL 
      00B4B5 CD A9 6E         [ 4]  986     CALL DRFROM
      003438                        987     _DDROP  ; drop divisor 
      00B4B8 1C 00 04         [ 2]    1    ADDW X,#2*CELLL 
      00B4BB CD 96 77         [ 4]  988     CALL JFETCH    ; quotient sign 
      00343E                        989     _QBRAN FSLASH9 
      00B4BE CD 85 18         [ 4]    1     CALL QBRAN
      00B4C1 B4 C6                    2     .word FSLASH9
      00B4C3 CD 89 18         [ 4]  990     CALL DNEGA  
      00B4C6                        991 FSLASH9:
      00B4C6 CD 85 B4         [ 4]  992     CALL RFROM  ; exponent 
      00B4C9 CD AD F2         [ 4]  993     CALL STEXP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 185.
Hexadecimal [24-Bits]



      00B4CC CD 85 B4         [ 4]  994     CALL RFROM 
      00344F                        995     _DROP ; drop qs 
      00B4CF 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00B4D2 81               [ 4]  996     RET 
                                    997 
                                    998 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    999 ;   D>F  ( # -- f# )
                                   1000 ;   convert double to float 
                                   1001 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      003453                       1002     _HEADER DTOF,3,"D>F"
      00B4D3 B4 04                    1         .word LINK 
                           003455     2         LINK=.
      00B4D5 03                       3         .byte 3  
      00B4D6 44 3E 46                 4         .ascii "D>F"
      00B4D9                          5         DTOF:
      00B4D9 CD A6 F6         [ 4] 1003     CALL DSIGN 
      00B4DC CD 86 62         [ 4] 1004     CALL TOR
      00B4DF CD A6 E5         [ 4] 1005     CALL DABS  
      00B4E2                       1006 DTOF1:      
      00B4E2 CD B2 90         [ 4] 1007     CALL SCALETOM 
      00B4E5 CD 85 B4         [ 4] 1008     CALL RFROM
      003468                       1009     _QBRAN DTOF2 
      00B4E8 CD 85 18         [ 4]    1     CALL QBRAN
      00B4EB B4 F0                    2     .word DTOF2
      00B4ED CD 89 18         [ 4] 1010     CALL DNEGA 
      00B4F0                       1011 DTOF2: 
      00B4F0 CD 88 5D         [ 4] 1012     CALL ROT 
      00B4F3 CD AD F2         [ 4] 1013     CALL STEXP 
      00B4F6 81               [ 4] 1014     RET 
                                   1015 
                                   1016 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1017 ;   F>D  ( f# -- # )
                                   1018 ;  convert float to double 
                                   1019 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      003477                       1020     _HEADER FTOD,3,"F>D"
      00B4F7 B4 D5                    1         .word LINK 
                           003479     2         LINK=.
      00B4F9 03                       3         .byte 3  
      00B4FA 46 3E 44                 4         .ascii "F>D"
      00B4FD                          5         FTOD:
      00B4FD CD AD C0         [ 4] 1021     CALL ATEXP ; m e 
      00B500 CD 88 4C         [ 4] 1022     CALL QDUP
      003483                       1023     _QBRAN FTOD9
      00B503 CD 85 18         [ 4]    1     CALL QBRAN
      00B506 B5 93                    2     .word FTOD9
      00B508 CD 86 62         [ 4] 1024     CALL TOR 
      00B50B CD A6 F6         [ 4] 1025     CALL DSIGN 
      00B50E CD 88 7C         [ 4] 1026     CALL NROT 
      00B511 CD A6 E5         [ 4] 1027     CALL DABS
      00B514 CD 85 B4         [ 4] 1028     CALL RFROM  
      00B517 CD 86 99         [ 4] 1029     CALL DUPP   
      00B51A CD 86 D0         [ 4] 1030     CALL ZLESS 
      00349D                       1031     _QBRAN FTOD4 
      00B51D CD 85 18         [ 4]    1     CALL QBRAN
      00B520 B5 5B                    2     .word FTOD4
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 186.
Hexadecimal [24-Bits]



                                   1032 ; negative exponent 
      00B522 CD 89 6C         [ 4] 1033     CALL ABSS 
      00B525 CD 86 62         [ 4] 1034     CALL TOR
      0034A8                       1035     _BRAN FTOD2  
      00B528 CD 85 34         [ 4]    1     CALL BRAN 
      00B52B B5 46                    2     .word FTOD2 
      00B52D                       1036 FTOD1:
      00B52D CD 88 A7         [ 4] 1037     CALL DDUP 
      00B530 CD A8 D6         [ 4] 1038     CALL DZEQUAL 
      0034B3                       1039     _TBRAN FTOD3 
      00B533 CD 85 26         [ 4]    1     CALL TBRAN 
      00B536 B5 50                    2     .word FTOD3 
      0034B8                       1040     _DOLIT 10 
      00B538 CD 84 EF         [ 4]    1     CALL DOLIT 
      00B53B 00 0A                    2     .word 10 
      00B53D CD A7 10         [ 4] 1041     CALL DSLMOD 
      00B540 CD 88 5D         [ 4] 1042     CALL ROT 
      0034C3                       1043     _DROP
      00B543 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00B546                       1044 FTOD2:      
      0034C6                       1045     _DONXT FTOD1
      00B546 CD 85 03         [ 4]    1     CALL DONXT 
      00B549 B5 2D                    2     .word FTOD1 
      0034CB                       1046     _BRAN FTOD8   
      00B54B CD 85 34         [ 4]    1     CALL BRAN 
      00B54E B5 88                    2     .word FTOD8 
      00B550                       1047 FTOD3: 
      00B550 CD 85 B4         [ 4] 1048     CALL RFROM 
      0034D3                       1049     _DROP 
      00B553 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      0034D6                       1050     _BRAN FTOD8  
      00B556 CD 85 34         [ 4]    1     CALL BRAN 
      00B559 B5 88                    2     .word FTOD8 
                                   1051 ; positive exponent 
      00B55B                       1052 FTOD4:
      00B55B CD 86 62         [ 4] 1053     CALL TOR 
      0034DE                       1054     _BRAN FTOD6
      00B55E CD 85 34         [ 4]    1     CALL BRAN 
      00B561 B5 83                    2     .word FTOD6 
      00B563                       1055 FTOD5:
      00B563 CD 88 A7         [ 4] 1056     CALL DDUP 
      0034E6                       1057     _DOLIT 0XCCCC
      00B566 CD 84 EF         [ 4]    1     CALL DOLIT 
      00B569 CC CC                    2     .word 0XCCCC 
      0034EB                       1058     _DOLIT 0XCCC  
      00B56B CD 84 EF         [ 4]    1     CALL DOLIT 
      00B56E 0C CC                    2     .word 0XCCC 
      00B570 CD A9 13         [ 4] 1059     CALL DGREAT 
      0034F3                       1060     _TBRAN FTOD3 
      00B573 CD 85 26         [ 4]    1     CALL TBRAN 
      00B576 B5 50                    2     .word FTOD3 
      0034F8                       1061     _DOLIT 10 
      00B578 CD 84 EF         [ 4]    1     CALL DOLIT 
      00B57B 00 0A                    2     .word 10 
      00B57D CD 8C 9E         [ 4] 1062     CALL ZERO 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 187.
Hexadecimal [24-Bits]



      00B580 CD AA BF         [ 4] 1063     CALL DSTAR 
      00B583                       1064 FTOD6: 
      003503                       1065     _DONXT FTOD5 
      00B583 CD 85 03         [ 4]    1     CALL DONXT 
      00B586 B5 63                    2     .word FTOD5 
      00B588                       1066 FTOD8:
      00B588 CD 88 5D         [ 4] 1067     CALL ROT 
      00350B                       1068     _QBRAN FTOD9 
      00B58B CD 85 18         [ 4]    1     CALL QBRAN
      00B58E B5 93                    2     .word FTOD9
      00B590 CD 89 18         [ 4] 1069     CALL DNEGA
      00B593                       1070 FTOD9:          
      00B593 81               [ 4] 1071     RET 
                                   1072 
                                   1073 
                                   1074 ;;;;;;;;;;;;;;;;;;;;;;;;
                                   1075 ;   F0< ( f# -- f )
                                   1076 ;   true if f#<0
                                   1077 ;;;;;;;;;;;;;;;;;;;;;;;;
      003514                       1078     _HEADER FZLESS,3,"F0<"
      00B594 B4 F9                    1         .word LINK 
                           003516     2         LINK=.
      00B596 03                       3         .byte 3  
      00B597 46 30 3C                 4         .ascii "F0<"
      00B59A                          5         FZLESS:
      00B59A CD AD C0         [ 4] 1079     CALL ATEXP 
      00351D                       1080     _DROP 
      00B59D 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00B5A0 CD 86 A9         [ 4] 1081     CALL SWAPP 
      003523                       1082     _DROP 
      00B5A3 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00B5A6 CD 86 D0         [ 4] 1083     CALL ZLESS 
      00B5A9 81               [ 4] 1084     RET
                                   1085 
                                   1086 ;;;;;;;;;;;;;;;;;;;;;;;;
                                   1087 ;   F< ( f#1 f#2 -- f )
                                   1088 ; true if f#1 < f#1 
                                   1089 ;;;;;;;;;;;;;;;;;;;;;;;
      00352A                       1090     _HEADER FLESS,2,"F<"
      00B5AA B5 96                    1         .word LINK 
                           00352C     2         LINK=.
      00B5AC 02                       3         .byte 2  
      00B5AD 46 3C                    4         .ascii "F<"
      00B5AF                          5         FLESS:
      00B5AF CD B2 4D         [ 4] 1091     CALL FSUB  
      00B5B2 CC B5 9A         [ 2] 1092     JP FZLESS
                                   1093 
                                   1094 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1095 ;   F> ( f#1 f#2 -- f )
                                   1096 ;   true fi f#1>f#2
                                   1097 ;;;;;;;;;;;;;;;;;;;;;;;;;
      003535                       1098     _HEADER FGREAT,2,"F>"
      00B5B5 B5 AC                    1         .word LINK 
                           003537     2         LINK=.
      00B5B7 02                       3         .byte 2  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 188.
Hexadecimal [24-Bits]



      00B5B8 46 3E                    4         .ascii "F>"
      00B5BA                          5         FGREAT:
      00B5BA CD A8 01         [ 4] 1099     CALL DSWAP 
      00B5BD CC B5 AF         [ 2] 1100     JP FLESS 
                                   1101 
                                   1102 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1103 ;   F= ( f#1 f#2 -- f ) 
                                   1104 ;   true fi f#1==f#2 
                                   1105 ;;;;;;;;;;;;;;;;;;;;;;;;;
      003540                       1106     _HEADER FEQUAL,2,"F="
      00B5C0 B5 B7                    1         .word LINK 
                           003542     2         LINK=.
      00B5C2 02                       3         .byte 2  
      00B5C3 46 3D                    4         .ascii "F="
      00B5C5                          5         FEQUAL:
      00B5C5 CC A8 F2         [ 2] 1107     JP DEQUAL 
                                   1108 
                                   1109 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1110 ;   F0= ( f# -- f )
                                   1111 ;   true if f# is 0.0 
                                   1112 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      003548                       1113     _HEADER FZEQUAL,3,"F0="
      00B5C8 B5 C2                    1         .word LINK 
                           00354A     2         LINK=.
      00B5CA 03                       3         .byte 3  
      00B5CB 46 30 3D                 4         .ascii "F0="
      00B5CE                          5         FZEQUAL:
      00B5CE CD AD C0         [ 4] 1114     CALL ATEXP 
      003551                       1115     _DROP 
      00B5D1 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00B5D4 CC A8 D6         [ 2] 1116     JP DZEQUAL  
                                   1117 
                                   1118 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1119 ;  FNEGATE ( f#1 -- f#2 )
                                   1120 ;  f#2 is negation of f#1 
                                   1121 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      003557                       1122     _HEADER FNEGA,7,"FNEGATE"
      00B5D7 B5 CA                    1         .word LINK 
                           003559     2         LINK=.
      00B5D9 07                       3         .byte 7  
      00B5DA 46 4E 45 47 41 54 45     4         .ascii "FNEGATE"
      00B5E1                          5         FNEGA:
      00B5E1 CD AD C0         [ 4] 1123     CALL ATEXP 
      00B5E4 CD 86 62         [ 4] 1124     CALL TOR 
      00B5E7 CD 89 18         [ 4] 1125     CALL DNEGA
      00B5EA CD 85 B4         [ 4] 1126     CALL RFROM 
      00B5ED CD AD F2         [ 4] 1127     CALL STEXP 
      00B5F0 CD AD 73         [ 4] 1128     CALL SFN 
      00B5F3 81               [ 4] 1129     RET 
                                   1130 
                                   1131 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1132 ;  FABS ( f#1 -- abs(f#1) )
                                   1133 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      003574                       1134     _HEADER FABS,4,"FABS"
      00B5F4 B5 D9                    1         .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 189.
Hexadecimal [24-Bits]



                           003576     2         LINK=.
      00B5F6 04                       3         .byte 4  
      00B5F7 46 41 42 53              4         .ascii "FABS"
      00B5FB                          5         FABS:
      00B5FB CD AD C0         [ 4] 1135     CALL ATEXP 
      00B5FE CD 86 62         [ 4] 1136     CALL TOR 
      00B601 CD 86 99         [ 4] 1137     CALL DUPP 
      003584                       1138     _DOLIT 0X80 
      00B604 CD 84 EF         [ 4]    1     CALL DOLIT 
      00B607 00 80                    2     .word 0X80 
      00B609 CD 86 F6         [ 4] 1139     CALL ANDD 
      00358C                       1140     _QBRAN FABS1
      00B60C CD 85 18         [ 4]    1     CALL QBRAN
      00B60F B6 14                    2     .word FABS1
      00B611 CD 89 18         [ 4] 1141     CALL DNEGA 
      00B614                       1142 FABS1: 
      00B614 CD 85 B4         [ 4] 1143     CALL RFROM 
      00B617 CD AD F2         [ 4] 1144     CALL STEXP 
      00B61A CD AD 73         [ 4] 1145     CALL SFN 
      00B61D 81               [ 4] 1146     RET 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 190.
Hexadecimal [24-Bits]



                                   4590 .endif 
                                   4591 
                                   4592 ;===============================================================
                                   4593 
                           003576  4594 LASTN =	LINK   ;last name defined
                                   4595 
                                   4596 ; application code begin here
      00B680                       4597 	.bndry 128 ; align on flash block  
      00B680                       4598 app_space: 
                                   4599 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 191.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   6 AB1        0008F5 R   |   6 ABOR1      001409 R
  6 ABOR2      001420 R   |   6 ABORQ      001401 R   |   6 ABORT      0013F2 R
  6 ABRTQ      0016E3 R   |   6 ABSS       0008EC R   |   6 ACCEP      001388 R
  6 ACCP1      001391 R   |   6 ACCP2      0013B7 R   |   6 ACCP3      0013BA R
  6 ACCP4      0013BC R   |     ADC_CR1 =  005401     |     ADC_CR1_=  000000 
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
  6 AFT        0016CE R   |   6 AGAIN      001624 R   |   6 AHEAD      001681 R
  6 ALLOT      001531 R   |   6 ANDD       000676 R   |     APP_CP  =  004004 
    APP_LAST=  004000     |     APP_RUN =  004002     |     APP_VP  =  004006 
  6 AT         0004E3 R   |   6 ATEXE      000D31 R   |   6 ATEXP      002D40 R
  6 ATEXP1     002D55 R   |   6 ATEXP2     002D65 R   |   6 AUTORUN    000129 R
    AWU_APR =  0050F1     |     AWU_CSR =  0050F0     |     AWU_TBR =  0050F2 
    B0_MASK =  000001     |     B115200 =  000006     |   6 B115K2     0003E0 R
    B19200  =  000003     |   6 B19K2      0003BD R   |     B1_MASK =  000002 
    B230400 =  000007     |     B2400   =  000000     |   6 B2K4       00038E R
    B2_MASK =  000004     |     B38400  =  000004     |     B3_MASK =  000008 
    B460800 =  000008     |     B4800   =  000001     |   6 B4K8       00039C R
    B4_MASK =  000010     |     B57600  =  000005     |   6 B57K6      0003CE R
    B5_MASK =  000020     |     B6_MASK =  000040     |     B7_MASK =  000080 
    B921600 =  000009     |     B9600   =  000002     |   6 B9K6       0003AC R
  6 BACK1      001330 R   |   6 BASE       0006DF R   |     BASEE   =  00000A 
  6 BAUD       0003F0 R   |     BCNT    =  000001     |   6 BCOMP      001574 R
  6 BDIGS      000E18 R   |     BEEP_BIT=  000004     |     BEEP_CSR=  0050F3 
    BEEP_MAS=  000010     |     BEEP_POR=  00000F     |   6 BEGIN      001606 R
    BIT0    =  000000     |     BIT1    =  000001     |     BIT2    =  000002 
    BIT3    =  000003     |     BIT4    =  000004     |     BIT5    =  000005 
    BIT6    =  000006     |     BIT7    =  000007     |   6 BKSLA      001185 R
  6 BKSP       001300 R   |     BKSPP   =  000008     |   6 BLANK      000C11 R
    BLOCK_SI=  000080     |     BOOT_ROM=  006000     |     BOOT_ROM=  007FFF 
  6 BRAN       0004B4 R   |     BTW     =  000001     |   6 BUF2ROW    0021B4 R
  6 BYE        0000B6 R   |     CADR    =  000003     |     CALLL   =  0000CD 
  6 CALLOT     0023FD R   |     CAN_DGR =  005426     |     CAN_FPSR=  005427 
    CAN_IER =  005425     |     CAN_MCR =  005420     |     CAN_MSR =  005421 
    CAN_P0  =  005428     |     CAN_P1  =  005429     |     CAN_P2  =  00542A 
    CAN_P3  =  00542B     |     CAN_P4  =  00542C     |     CAN_P5  =  00542D 
    CAN_P6  =  00542E     |     CAN_P7  =  00542F     |     CAN_P8  =  005430 
    CAN_P9  =  005431     |     CAN_PA  =  005432     |     CAN_PB  =  005433 
    CAN_PC  =  005434     |     CAN_PD  =  005435     |     CAN_PE  =  005436 
    CAN_PF  =  005437     |     CAN_RFR =  005424     |     CAN_TPR =  005423 
    CAN_TSR =  005422     |     CARRY   =  00002A     |     CASE_SEN=  000000 
  6 CAT        000501 R   |   6 CCOMMA     001556 R   |     CC_C    =  000000 
    CC_H    =  000004     |     CC_I0   =  000003     |     CC_I1   =  000005 
    CC_N    =  000002     |     CC_V    =  000007     |     CC_Z    =  000001 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 192.
Hexadecimal [24-Bits]

Symbol Table

    CELLL   =  000002     |   6 CELLM      000B96 R   |   6 CELLP      000B87 R
  6 CELLS      000BA5 R   |     CFG_GCR =  007F60     |     CFG_GCR_=  000001 
    CFG_GCR_=  000000     |   6 CHAR1      000F6E R   |   6 CHAR2      000F71 R
  6 CHKIVEC    0020A2 R   |     CLKOPT  =  004807     |     CLKOPT_C=  000002 
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
    CLK_SWR_=  0000D2     |   6 CMOV1      000D50 R   |   6 CMOV2      000D68 R
  6 CMOVE      000D48 R   |     CNTDWN  =  000032     |   6 CNTXT      000762 R
  6 COLD       001BA3 R   |   6 COLD1      001BA3 R   |   6 COLON      001886 R
  6 COMMA      00153F R   |   6 COMPI      001584 R   |     COMPO   =  000040 
  6 CONSTANT   001930 R   |   6 COPYRIGH   001AEC R   |   6 COUNT      000CE4 R
  6 CPP        00077E R   |     CPU_A   =  007F00     |     CPU_CCR =  007F0A 
    CPU_PCE =  007F01     |     CPU_PCH =  007F02     |     CPU_PCL =  007F03 
    CPU_SPH =  007F08     |     CPU_SPL =  007F09     |     CPU_XH  =  007F04 
    CPU_XL  =  007F05     |     CPU_YH  =  007F06     |     CPU_YL  =  007F07 
  6 CR         000F96 R   |   6 CREAT      0018CC R   |     CRR     =  00000D 
  6 CSTOR      0004F0 R   |   6 CTABLE     00241E R   |   6 CTAT       00243F R
  6 CTINIT     002467 R   |   6 D2SLASH    0029B0 R   |   6 D2STAR     0029C7 R
  6 DABS       002665 R   |   6 DABS1      00266D R   |   6 DAT        000CC8 R
    DATSTK  =  001680     |   6 DBLVER     0024EB R   |   6 DCLZ       0027AF R
  6 DCLZ1      0027B8 R   |   6 DCLZ4      0027C1 R   |   6 DCLZ8      0027CE R
  6 DCONST     001965 R   |   6 DDIG       0026D1 R   |   6 DDIGS      0026EA R
  6 DDOT       002701 R   |   6 DDOT0      002715 R   |   6 DDOT1      00272B R
  6 DDROP      00081C R   |   6 DDSLMOD    002B54 R   |   6 DDSTAR3    002A98 R
  6 DDUP       000827 R   |     DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF 
  6 DECIM      000EC8 R   |   6 DEPTH      000C60 R   |   6 DEQU4      002887 R
  6 DEQUAL     002872 R   |     DEVID_BA=  0048CD     |     DEVID_EN=  0048D8 
    DEVID_LO=  0048D2     |     DEVID_LO=  0048D3     |     DEVID_LO=  0048D4 
    DEVID_LO=  0048D5     |     DEVID_LO=  0048D6     |     DEVID_LO=  0048D7 
    DEVID_LO=  0048D8     |     DEVID_WA=  0048D1     |     DEVID_XH=  0048CE 
    DEVID_XL=  0048CD     |     DEVID_YH=  0048D0     |     DEVID_YL=  0048CF 
  6 DGREAT     002893 R   |   6 DGTQ1      000F0D R   |   6 DI         0000C4 R
  6 DIG        000E41 R   |   6 DIGIT      000DDC R   |   6 DIGS       000E52 R
  6 DIGS1      000E52 R   |   6 DIGS2      000E5F R   |   6 DIGTQ      000EDC R
    DISCOVER=  000000     |     DIV     =  000005     |   6 DLESS      00289E R
  6 DLESS4     0028B2 R   |   6 DLITER     002970 R   |   6 DLSHIFT    0029E3 R
  6 DLSHIFT1   0029F6 R   |   6 DLSHIFT2   002A0B R   |     DM_BK1RE=  007F90 
    DM_BK1RH=  007F91     |     DM_BK1RL=  007F92     |     DM_BK2RE=  007F93 
    DM_BK2RH=  007F94     |     DM_BK2RL=  007F95     |     DM_CR1  =  007F96 
    DM_CR2  =  007F97     |     DM_CSR1 =  007F98     |     DM_CSR2 =  007F99 
    DM_ENFCT=  007F9A     |   6 DN1        0008B3 R   |   6 DNEGA      000898 R
  6 DOCONST    001950 R   |   6 DOLIT      00046F R   |   6 DONXT      000483 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 193.
Hexadecimal [24-Bits]

Symbol Table

    DOORBELL=  000000     |   6 DOSTR      000FA6 R   |   6 DOT        00103D R
  6 DOT1       001053 R   |   6 DOTI1      001AB5 R   |   6 DOTID      001A9F R
  6 DOTO1      001495 R   |   6 DOTOK      00147B R   |   6 DOTPR      001166 R
  6 DOTQ       0016FD R   |   6 DOTQP      000FC3 R   |   6 DOTR       000FD1 R
  6 DOTS       001A41 R   |   6 DOTS1      001A4C R   |   6 DOTS2      001A55 R
  6 DOVAR      0006CF R   |   6 DOVER      002997 R   |   6 DO_DCONS   001988 R
    DP      =  000007     |   6 DPLUS      002B93 R   |   6 DPLUS1     002BBA R
  6 DRAT       002906 R   |   6 DRFROM     0028EE R   |   6 DROP       00060F R
  6 DROT       00281B R   |   6 DRSHIFT    002A1C R   |   6 DRSHIFT1   002A23 R
  6 DRSHIFT2   002A39 R   |   6 DSIGN      002676 R   |   6 DSIGN1     002680 R
  6 DSLA9      002B7E R   |   6 DSLASH     002B84 R   |   6 DSLMOD     002690 R
  6 DSLMOD3    0026AB R   |   6 DSLMOD4    0026B7 R   |   6 DSLMODa    0026B2 R
  6 DSLMODb    0026BD R   |   6 DSSTAR     00275B R   |   6 DSSTAR3    002778 R
  6 DSTAR      002A3F R   |   6 DSTOR      000CAF R   |   6 DSUB       002BC5 R
  6 DSUB1      002BEC R   |   6 DSWAP      002781 R   |   6 DTOF       003459 R
  6 DTOF1      003462 R   |   6 DTOF2      003470 R   |   6 DTOR       0028D0 R
  6 DUMP       0019F7 R   |   6 DUMP1      001A0E R   |   6 DUMP3      001A30 R
  6 DUMPP      0019C6 R   |   6 DUPP       000619 R   |   6 DVARIA     002924 R
    DVER_MAJ=  000001     |     DVER_MIN=  000000     |   6 DZEQUAL    002856 R
  6 DZLESS     0028B9 R   |   6 DZLESS1    0028C3 R   |   6 EDIGS      000E7D R
  6 EDOT       002DC6 R   |   6 EDOT0      002DDD R   |   6 EDOT2      002DE9 R
  6 EDOT3      002E02 R   |   6 EDOT4      002E2E R   |   6 EDOT5      002E4D R
  6 EECSTORE   001E53 R   |   6 EEPCP      001C79 R   |   6 EEPLAST    001C4C R
  6 EEPROM     001C34 R   |     EEPROM_B=  004000     |     EEPROM_E=  0047FF 
    EEPROM_R=  000010     |     EEPROM_S=  000800     |   6 EEPRUN     001C63 R
  6 EEPVP      001C8F R   |   6 EESTORE    001E9F R   |   6 EE_CCOMM   002169 R
  6 EE_COMMA   002148 R   |   6 EE_CREAD   001DE4 R   |   6 EE_READ    001DC2 R
  6 EI         0000BD R   |   6 ELSEE      00165C R   |   6 EMIT       000436 R
  6 ENEPER     002389 R   |     EOL_CR  =  000001     |     EOL_LF  =  000000 
  6 EQ1        000907 R   |   6 EQUAL      0008FA R   |   6 ERASE      000DAA R
    ERR     =  00001B     |   6 EVAL       0014BE R   |   6 EVAL1      0014BE R
  6 EVAL2      0014DA R   |   6 EXE1       000D3F R   |   6 EXECU      0004C4 R
    EXT     =  000000     |     EXTI_CR1=  0050A0     |     EXTI_CR2=  0050A1 
  6 EXTRC      000E04 R   |   6 FABS       00357B R   |   6 FABS1      003594 R
  6 FADDR      002236 R   |   6 FALGN4     00312B R   |   6 FALGN6     00313A R
  6 FALGN7     003161 R   |   6 FALGN71    003170 R   |   6 FALGN72    00318C R
  6 FALGN8     00318F R   |   6 FALIGN     0030F2 R   |   6 FALSE      000868 R
  6 FARAT      001CFA R   |   6 FARCAT     001D06 R   |   6 FC_XOFF    000463 R
  6 FC_XON     00044D R   |   6 FDOT       002E5C R   |   6 FDOT0      002E9A R
  6 FDOT1      002E89 R   |   6 FDOT10     002EF6 R   |   6 FDOT2      002EA8 R
  6 FDOT3      002EC1 R   |   6 FDOT6      002ED1 R   |   6 FDOT7      002ED6 R
  6 FDOT8      002EDE R   |   6 FDOT9      002EE6 R   |   6 FEQUAL     003545 R
  6 FER        002C5E R   |   6 FGREAT     00353A R   |     FHSE    =  7A1200 
    FHSI    =  F42400     |   6 FILL       000D77 R   |   6 FILL1      000D94 R
  6 FILL2      000D9D R   |   6 FIND       00125C R   |   6 FIND1      00127A R
  6 FIND2      0012A8 R   |   6 FIND3      0012B4 R   |   6 FIND4      0012C8 R
  6 FIND5      0012D5 R   |   6 FIND6      0012B9 R   |   6 FINIT      002C54 R
    FLASH_BA=  008000     |     FLASH_CR=  00505A     |     FLASH_CR=  000002 
    FLASH_CR=  000000     |     FLASH_CR=  000003     |     FLASH_CR=  000001 
    FLASH_CR=  00505B     |     FLASH_CR=  000005     |     FLASH_CR=  000004 
    FLASH_CR=  000007     |     FLASH_CR=  000000     |     FLASH_CR=  000006 
    FLASH_DU=  005064     |     FLASH_DU=  0000AE     |     FLASH_DU=  000056 
    FLASH_EN=  027FFF     |     FLASH_FP=  00505D     |     FLASH_FP=  000000 
    FLASH_FP=  000001     |     FLASH_FP=  000002     |     FLASH_FP=  000003 
    FLASH_FP=  000004     |     FLASH_FP=  000005     |     FLASH_IA=  00505F 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 194.
Hexadecimal [24-Bits]

Symbol Table

    FLASH_IA=  000003     |     FLASH_IA=  000002     |     FLASH_IA=  000006 
    FLASH_IA=  000001     |     FLASH_IA=  000000     |     FLASH_NC=  00505C 
    FLASH_NF=  00505E     |     FLASH_NF=  000000     |     FLASH_NF=  000001 
    FLASH_NF=  000002     |     FLASH_NF=  000003     |     FLASH_NF=  000004 
    FLASH_NF=  000005     |     FLASH_PU=  005062     |     FLASH_PU=  000056 
    FLASH_PU=  0000AE     |     FLASH_SI=  020000     |     FLASH_WS=  00480D 
  6 FLESS      00352F R   |   6 FLOATQ     002F6E R   |   6 FLOATQ0    002F78 R
  6 FLOATQ1    002FDD R   |   6 FLOATQ2    002FE6 R   |   6 FLOATQ3    002FEE R
  6 FLOATQ4    003002 R   |   6 FLOAT_ER   00301D R   |   6 FLOAT_ER   00301A R
    FLOAT_MA=  000001     |     FLOAT_MI=  000000     |     FLSI    =  01F400 
  6 FMOVE      002241 R   |   6 FMOVE2     002272 R   |   6 FNE        002C81 R
  6 FNEGA      003561 R   |   6 FOR        0015CE R   |   6 FORGET     00015A R
  6 FORGET1    000189 R   |   6 FORGET2    00020F R   |   6 FORGET4    000218 R
  6 FORGET6    0001D1 R   |   6 FOV        002C9C R   |   6 FPLUS      00319B R
  6 FPLUS1     0031BB R   |   6 FPSTOR     001C15 R   |   6 FPSW       002C30 R
    FPTR    =  000034     |   6 FREEVAR    000225 R   |   6 FREEVAR4   00025B R
  6 FRESET     002C42 R   |   6 FSLASH     003387 R   |   6 FSLASH1    0033C9 R
  6 FSLASH8    00342F R   |   6 FSLASH9    003446 R   |   6 FSTAR      003360 R
  6 FSUB       0031CD R   |   6 FSUB1      0031ED R   |   6 FTOD       00347D R
  6 FTOD1      0034AD R   |   6 FTOD2      0034C6 R   |   6 FTOD3      0034D0 R
  6 FTOD4      0034DB R   |   6 FTOD5      0034E3 R   |   6 FTOD6      003503 R
  6 FTOD8      003508 R   |   6 FTOD9      003513 R   |   6 FVER       002BFE R
  6 FZE        002C6B R   |   6 FZEQUAL    00354E R   |   6 FZLESS     00351A R
    GPIO_BAS=  005000     |     GPIO_CR1=  000003     |     GPIO_CR2=  000004 
    GPIO_DDR=  000002     |     GPIO_IDR=  000001     |     GPIO_ODR=  000000 
    GPIO_SIZ=  000005     |   6 GREAT      000953 R   |   6 GREAT1     00095E R
  6 HDOT       001020 R   |   6 HERE       000CFB R   |   6 HEX        000EB3 R
  6 HI         001B58 R   |   6 HLD        00074F R   |   6 HOLD       000E28 R
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
    I2C_WRIT=  000000     |   6 ICOLON     001897 R   |   6 IFETCH     0015EC R
  6 IFF        001634 R   |   6 IFMOVE     00231A R   |     IMEDD   =  000080 
  6 IMMED      0018A9 R   |   6 INCH       00042A R   |   6 INC_FPTR   001D8F R
  6 INITOFS    00185F R   |   6 INN        0006FD R   |     INPUT_DI=  000000 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 195.
Hexadecimal [24-Bits]

Symbol Table

    INPUT_EI=  000001     |     INPUT_FL=  000000     |     INPUT_PU=  000001 
  6 INTE1      00145D R   |   6 INTER      001433 R   |   6 INTQ       0024C3 R
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
    IPR_MASK=  000003     |     IRET_COD=  000080     |   6 ISEMI      0017F4 R
    ITC_SPR1=  007F70     |     ITC_SPR2=  007F71     |     ITC_SPR3=  007F72 
    ITC_SPR4=  007F73     |     ITC_SPR5=  007F74     |     ITC_SPR6=  007F75 
    ITC_SPR7=  007F76     |     ITC_SPR8=  007F77     |     IWDG_KR =  0050E0 
    IWDG_PR =  0050E1     |     IWDG_RLR=  0050E2     |   6 JFETCH     0015F7 R
  6 JSRC       001849 R   |   6 KEY        000F1C R   |   6 KTAP       00134D R
  6 KTAP1      001370 R   |   6 KTAP2      001373 R   |   6 LAST       00078E R
  6 LASTN   =  003576 R   |   6 LBRAC      00146A R   |     LED2_BIT=  000005 
    LED2_MAS=  000020     |     LED2_POR=  00500A     |   6 LESS       000926 R
    LF      =  00000A     |   6 LINK    =  003576 R   |   6 LITER      0015A6 R
  6 LN2S       0023E5 R   |   6 LOCAL      000554 R   |   6 LOCK       001D7B R
  6 LOG2S      0023CF R   |   6 LSCALE     00303C R   |   6 LSHIFT     000BD0 R
  6 LSHIFT1    000BD9 R   |   6 LSHIFT4    000BE1 R   |   6 LT1        000931 R
    MASKK   =  001F7F     |   6 MAX        00096B R   |   6 MAX1       000975 R
    MAX_MANT=  7FFFFF     |   6 MIN        00097F R   |   6 MIN1       000989 R
  6 MMOD1      000A53 R   |   6 MMOD2      000A67 R   |   6 MMOD3      000A7E R
  6 MMSTA1     00328E R   |   6 MMSTA2     003299 R   |   6 MMSTA3     0032A4 R
  6 MMSTA4     00330F R   |   6 MMSTA5     003321 R   |   6 MMSTA6     00333A R
  6 MMSTA7     003357 R   |   6 MMSTAR     003283 R   |   6 MODD       000ACE R
  6 MONE       000C37 R   |     MS      =  000030     |   6 MSEC       0002D0 R
  6 MSMOD      000A36 R   |   6 MSTA1      000B5F R   |   6 MSTAR      000B3C R
    NAFR    =  004804     |   6 NAMEQ      0012F5 R   |   6 NAMET      001206 R
    NCLKOPT =  004808     |   6 NDROT      0027DF R   |   6 NEGAT      000886 R
  6 NEG_SIGN   00252E R   |   6 NEX1       000490 R   |   6 NEXT       0015DD R
    NFLASH_W=  00480E     |     NHSECNT =  00480A     |     NOPT1   =  004802 
    NOPT2   =  004804     |     NOPT3   =  004806     |     NOPT4   =  004808 
    NOPT5   =  00480A     |     NOPT6   =  00480C     |     NOPT7   =  00480E 
    NOPTBL  =  00487F     |   6 NRAT       00059F R   |   6 NRDROP     00057B R
  6 NROT       0007FC R   |   6 NRSTO      0005BE R   |   6 NTIB       00070D R
    NUBC    =  004802     |     NUCLEO  =  000001     |   6 NUFQ       000F32 R
  6 NUFQ1      000F4B R   |   6 NUMBQ      00259D R   |   6 NUMQ0      0025DE R
  6 NUMQ1      002600 R   |   6 NUMQ3      00262A R   |   6 NUMQ4      00264B R
  6 NUMQ8      002654 R   |     NWDGOPT =  004806     |     NWDGOPT_=  FFFFFFFD 
    NWDGOPT_=  FFFFFFFC     |     NWDGOPT_=  FFFFFFFF     |     NWDGOPT_=  FFFFFFFE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 196.
Hexadecimal [24-Bits]

Symbol Table

  6 NonHandl   000000 R   |   6 OFFSET     0007B3 R   |     OFS     =  000005 
  6 ONE        000C29 R   |   6 ONEM       000BBF R   |   6 ONEP       000BB2 R
    OPT     =  000002     |     OPT0    =  004800     |     OPT1    =  004801 
    OPT2    =  004803     |     OPT3    =  004805     |     OPT4    =  004807 
    OPT5    =  004809     |     OPT6    =  00480B     |     OPT7    =  00480D 
    OPTBL   =  00487E     |     OPTIMIZE=  000001     |     OPTION_B=  004800 
    OPTION_E=  00487F     |     OPTION_S=  000080     |   6 ORIG       000049 R
  6 ORR        00068A R   |   6 OUTPUT     00043B R   |     OUTPUT_F=  000001 
    OUTPUT_O=  000000     |     OUTPUT_P=  000001     |     OUTPUT_S=  000000 
  6 OVER       000641 R   |   6 OVERT      0017C2 R   |     PA      =  000000 
  6 PACKS      000DBB R   |   6 PAD        000D0C R   |   6 PAREN      001175 R
  6 PARS       00106E R   |   6 PARS1      001099 R   |   6 PARS2      0010C4 R
  6 PARS3      0010C7 R   |   6 PARS4      0010D0 R   |   6 PARS5      0010F3 R
  6 PARS6      001108 R   |   6 PARS7      001117 R   |   6 PARS8      001126 R
  6 PARSE      001137 R   |   6 PARSEXP_   002F51 R   |   6 PAUSE      0002E0 R
    PA_BASE =  005000     |     PA_CR1  =  005003     |     PA_CR2  =  005004 
    PA_DDR  =  005002     |     PA_IDR  =  005001     |     PA_ODR  =  005000 
    PB      =  000005     |     PB_BASE =  005005     |     PB_CR1  =  005008 
    PB_CR2  =  005009     |     PB_DDR  =  005007     |     PB_IDR  =  005006 
    PB_ODR  =  005005     |     PC      =  00000A     |     PC_BASE =  00500A 
    PC_CR1  =  00500D     |     PC_CR2  =  00500E     |     PC_DDR  =  00500C 
    PC_IDR  =  00500B     |     PC_ODR  =  00500A     |     PD      =  00000F 
  6 PDUM1      0019D9 R   |   6 PDUM2      0019EA R   |     PD_BASE =  00500F 
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
    PI      =  000028     |   6 PICK       000C77 R   |   6 PII        002348 R
    PI_BASE =  005028     |     PI_CR1  =  00502B     |     PI_CR2  =  00502C 
    PI_DDR  =  00502A     |     PI_IDR  =  005029     |     PI_ODR  =  005028 
  6 PLUS       00083C R   |   6 PNAM1      001767 R   |   6 PRESE      0014E9 R
  6 PRINT_VE   001B28 R   |     PROD1   =  000024     |     PROD2   =  000026 
    PROD3   =  000028     |   6 PROTECTE   000201 R   |   6 PRT_LICE   001B14 R
  6 PSTOR      000C8E R   |     PTR16   =  000035     |     PTR8    =  000036 
  6 PTRPLUS    001DA7 R   |   6 QBRAN      000498 R   |   6 QDUP       0007CC R
  6 QDUP1      0007D6 R   |   6 QKEY       000418 R   |   6 QSTAC      0014A1 R
  6 QUERY      0013CD R   |   6 QUEST      001060 R   |   6 QUIT       001506 R
  6 QUIT1      00150E R   |   6 QUIT2      001511 R   |   6 RAM2EE     0021E2 R
    RAMBASE =  000000     |   6 RAMLAST    0007A1 R   |     RAM_BASE=  000000 
    RAM_END =  0017FF     |     RAM_SIZE=  001800     |   6 RANDOM     00027E R
  6 RAT        000545 R   |   6 RBRAC      001836 R   |   6 REPEA      0016B1 R
  6 RFREE      0021C9 R   |   6 RFROM      000534 R   |     ROP     =  004800 
  6 ROT        0007DD R   |   6 ROW2BUF    00218B R   |     ROWBUFF =  001680 
    RP0     =  00002E     |   6 RPAT       000511 R   |     RPP     =  0017FF 
  6 RPSTO      00051E R   |   6 RSCALE     003060 R   |   6 RSHIFT     000BEC R
  6 RSHIFT1    000BF5 R   |   6 RSHIFT4    000BFD R   |     RST_SR  =  0050B3 
  6 RT12_2     0023B8 R   |   6 SAME1      001224 R   |   6 SAME2      00124D R
  6 SAMEQ      00121C R   |   6 SCAL1      003216 R   |   6 SCAL2      00323A R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 197.
Hexadecimal [24-Bits]

Symbol Table

  6 SCALDN2    0030E4 R   |   6 SCALDN3    0030E7 R   |   6 SCALEDOW   0030B8 R
  6 SCALETOM   003210 R   |   6 SCALEUP    003081 R   |   6 SCALEUP2   0030B4 R
  6 SCALEUP3   0030B7 R   |   6 SCOM1      00179C R   |   6 SCOM2      00179F R
  6 SCOMP      00177E R   |   6 SEED       000265 R   |     SEEDX   =  000038 
    SEEDY   =  00003A     |   6 SEMIS      0017D2 R   |   6 SETISP     0000D0 R
  6 SET_RAML   001919 R   |   6 SFN        002CF3 R   |     SFR_BASE=  005000 
    SFR_END =  0057FF     |   6 SFV        002D27 R   |   6 SFZ        002CBC R
  6 SIGN       000E67 R   |   6 SIGN1      000E77 R   |   6 SLASH      000AD8 R
  6 SLMOD      000A86 R   |   6 SLMOD1     000AB8 R   |   6 SLMOD8     000AC5 R
  6 SNAME      001731 R   |     SP0     =  00002C     |   6 SPACE      000F54 R
  6 SPACS      000F63 R   |   6 SPAT       0005F9 R   |     SPI_CR1 =  005200 
    SPI_CR2 =  005201     |     SPI_CRCP=  005205     |     SPI_DR  =  005204 
    SPI_ICR =  005202     |     SPI_RXCR=  005206     |     SPI_SR  =  005203 
    SPI_TXCR=  005207     |     SPP     =  001680     |     SPSAVE  =  000001 
  6 SPSTO      000606 R   |   6 SQRT10     0023A1 R   |   6 SQRT2      00235F R
  6 SQRT3      002376 R   |   6 SSMOD      000B68 R   |     SSP     =  000001 
    STACK   =  0017FF     |   6 STAR       000B31 R   |   6 STASL      000B79 R
  6 STEXP      002D72 R   |   6 STEXP1     002D88 R   |   6 STEXP2     002DB2 R
  6 STOD       0008BB R   |   6 STORE      0004D1 R   |   6 STO_SIGN   002546 R
  6 STR        000E95 R   |   6 STRCQ      0015AE R   |   6 STRQ       0016F0 R
  6 STRQP      000FBF R   |   6 SUBB       0008D2 R   |   6 SWAPP      000629 R
    SWIM_CSR=  007F80     |   6 TAP        001337 R   |   6 TBOOT      001B97 R
  6 TBRAN      0004A6 R   |   6 TBUF       00071D R   |     TBUFFBAS=  001680 
  6 TCHAR      000C48 R   |   6 TEMP       0006EE R   |   6 TEVAL      000740 R
  6 TFLASH     00072F R   |   6 THENN      001649 R   |   6 TIB        000D1D R
    TIBB    =  001700     |     TIBBASE =  001700     |     TIC     =  000027 
  6 TICK       00151D R   |     TIM1_ARR=  005262     |     TIM1_ARR=  005263 
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
    TIM1_CNT=  00525F     |     TIM1_CR1=  005250     |     TIM1_CR2=  005251 
    TIM1_CR2=  000000     |     TIM1_CR2=  000002     |     TIM1_CR2=  000004 
    TIM1_CR2=  000005     |     TIM1_CR2=  000006     |     TIM1_DTR=  00526E 
    TIM1_EGR=  005257     |     TIM1_EGR=  000007     |     TIM1_EGR=  000001 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 198.
Hexadecimal [24-Bits]

Symbol Table

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
    TIM_CR1_=  000001     |     TIM_CR1_=  000002     |   6 TNAM2      001A6F R
  6 TNAM3      001A8D R   |   6 TNAM4      001A93 R   |   6 TNAME      001A6C R
  6 TOFLASH    000335 R   |   6 TOKEN      0011F8 R   |   6 TOR        0005E2 R
  6 TORAM      000375 R   |   6 TRUE       000857 R   |     TRUEE   =  00FFFF 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 199.
Hexadecimal [24-Bits]

Symbol Table

  6 TWOSL      000C04 R   |   6 TYPE1      000F83 R   |   6 TYPE2      000F89 R
  6 TYPES      000F7E R   |   6 Timer4Ha   000005 R   |     UART1   =  000000 
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
    UDH     =  000001     |   6 UDIV10     00323B R   |     UDL     =  000003 
  6 UDOT       00100C R   |   6 UDOTR      000FEC R   |   6 UDSLA3     002AD7 R
  6 UDSLA4     002AFD R   |   6 UDSLA7     002B2E R   |   6 UDSLA8     002B39 R
  6 UDSLMOD    002AA2 R   |   6 UDSSTAR    002739 R   |   6 UEND       000047 R
    UFPSW   =  000008     |   6 UGREAT     00093D R   |   6 UGREAT1    000948 R
    UHLD    =  000014     |     UINN    =  00000C     |     UINTER  =  000012 
    ULAST   =  00001C     |   6 ULES1      00091B R   |   6 ULESS      000910 R
  6 UMMOD      0009B1 R   |   6 UMMOD1     0009C4 R   |   6 UMMOD2     0009E4 R
  6 UMMOD3     0009EA R   |   6 UMMOD4     0009F7 R   |   6 UMMOD5     000A03 R
  6 UMMOD6     000A09 R   |   6 UMMOD8     000A10 R   |   6 UMOD10     0031FA R
  6 UMSTA      000AE7 R   |   6 UNIQ1      00172E R   |   6 UNIQU      00170F R
  6 UNLKEE     001D15 R   |   6 UNLKFL     001D34 R   |   6 UNLOCK     001D53 R
  6 UNTIL      001611 R   |     UOFFSET =  00001E     |   6 UPDATCP    001CD2 R
  6 UPDATLAS   001CA9 R   |   6 UPDATPTR   0022D5 R   |   6 UPDATRUN   001CC1 R
  6 UPDATVP    001CE9 R   |   6 UPL1       0006CB R   |   6 UPLUS      0006B4 R
    UPP     =  000006     |   6 UPPER      0011BB R   |   6 UPPER1     0011DE R
  6 UPPER2     0011E7 R   |     URLAST  =  000022     |   6 USLMOD     000A1B R
    USR_BTN_=  000004     |     USR_BTN_=  000010     |     USR_BTN_=  005015 
    UTFLASH =  000020     |     UTIB    =  000010     |     UTMP    =  00000A 
  6 UTYP1      0019A9 R   |   6 UTYP2      0019B8 R   |   6 UTYPE      0019A4 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 200.
Hexadecimal [24-Bits]

Symbol Table

    UVP     =  000018     |   6 UZERO      00002B R   |   6 VARIA      0018E6 R
    VAR_BASE=  000080     |     VAR_TOP =  0017BF     |     VER     =  000004 
  6 VPP        000770 R   |     VSIZE   =  000006     |     WANT_CON=  000001 
    WANT_DEB=  000000     |     WANT_DOU=  000001     |     WANT_FLO=  000001 
    WANT_SCA=  000001     |     WANT_SEE=  000000     |     WDGOPT  =  004805 
    WDGOPT_I=  000002     |     WDGOPT_L=  000003     |     WDGOPT_W=  000000 
    WDGOPT_W=  000001     |   6 WHILE      001697 R   |   6 WITHI      000996 R
  6 WORDD      0011A1 R   |   6 WORDS      001AC9 R   |   6 WORS1      001ACF R
  6 WORS2      001AEB R   |   6 WR_BYTE    001DFE R   |   6 WR_WORD    001E23 R
  6 WTABLE     00242D R   |   6 WTAT       002451 R   |   6 WTINIT     002496 R
    WWDG_CR =  0050D1     |     WWDG_WR =  0050D2     |     XMEM_SIZ=  017830 
    XOFF    =  000013     |     XON     =  000011     |   6 XORR       00069F R
    XTEMP   =  000024     |     YTEMP   =  000026     |   6 ZEQ1       002866 R
  6 ZEQU1      00066C R   |   6 ZEQUAL     000662 R   |   6 ZERO       000C1E R
  6 ZL1        000659 R   |   6 ZLESS      000650 R   |   6 app_spac   003600 R
  6 baudrate   00037B R   |   6 block_er   001EE9 R   |   6 clear_ra   000019 R
  6 clock_in   000064 R   |   6 copy_buf   001F49 R   |   6 copy_buf   001F68 R
  6 copy_pro   001F68 R   |     da      =  000002     |     db      =  000003 
    dc      =  000000     |     dd      =  000001     |   6 do2lit     00297B R
  6 erase_fl   001F0B R   |   6 fmove_do   0022BE R   |   6 main       000016 R
  6 next_row   00227B R   |   6 no_move    0022C5 R   |   6 nsign      00251D R
  6 parse_di   00254A R   |   6 parse_ex   002F06 R   |   6 pristine   001FE9 R
  6 proceed_   001F0E R   |   6 reboot     000327 R   |   6 reset_ve   002050 R
  6 row_eras   001EC9 R   |   6 row_eras   001F22 R   |   6 row_eras   001F49 R
  6 set_opti   001FBD R   |   6 set_vect   0020F1 R   |   6 uart_ini   000076 R
  6 write_ro   001F8D R

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

