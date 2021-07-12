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
      0080BB B6 06                  318         .word      LASTN  ;CNTXT pointer
      0080BD 00 80                  319         .word      VAR_BASE   ;variables free space pointer 
      0080BF B6 80                  320         .word      app_space ; FLASH free space pointer 
      0080C1 B6 06                  321         .word      LASTN   ;LAST
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
      008173 CD 86 C2         [ 4]  445         call OVER ; ( level reg lshift rval lshift -- )
      008176 CD 84 F0         [ 4]  446         call DOLIT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 10.
Hexadecimal [24-Bits]



      008179 00 03                  447         .word 3
      00817B CD 86 AA         [ 4]  448         call SWAPP  ; ( level reg lshift rval 3 lshift )
      00817E CD 8C 36         [ 4]  449         call LSHIFT ; creat slot mask 
      008181 CD 88 F6         [ 4]  450         call INVER  ; ( level reg lshift rval mask )
      008184 CD 86 F7         [ 4]  451         call ANDD ; ( level reg lshift slot_masked )
      008187 CD 86 63         [ 4]  452         call TOR  ; ( level reg lshift -- R: slot_masked )
      00818A CD 88 5E         [ 4]  453         call ROT  ; ( reg lshift level )
      00818D CD 86 AA         [ 4]  454         call SWAPP ; ( reg level lshift )
      008190 CD 8C 36         [ 4]  455         call LSHIFT  ; ( reg slot_level -- )
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
      0081A9 CD 92 6A         [ 4]  467         call TOKEN 
      0081AC CD 86 9A         [ 4]  468         call DUPP 
      0081AF CD 85 19         [ 4]  469         call QBRAN 
      0081B2 82 8F                  470         .word FORGET2
      0081B4 CD 93 67         [ 4]  471         call NAMEQ
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



      0081DD CD 86 9A         [ 4]  491         call DUPP 
      0081E0 CD 85 19         [ 4]  492         call QBRAN 
      0081E3 82 8F                  493         .word FORGET2
      0081E5 CD 93 67         [ 4]  494         call NAMEQ ; ( a -- ca na | a F )
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
      008206 CD A1 62         [ 4]  509         call CHKIVEC ; ( na -- ) 
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
      00824B CD 9D 92         [ 4]  537         call UPDATCP 
      00824E CC 9D 69         [ 2]  538         jp UPDATLAST 
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
      0082AB CD 8C 18         [ 4]  570         call ONEP ;
      0082AE CD 88 BD         [ 4]  571         CALL PLUS ; ( na c+1 -- ca ) 
      0082B1 CD 8C 18         [ 4]  572         call ONEP ; ( ca+ -- ) to get routne address 
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
      0082D8 CC 9D A9         [ 2]  586         jp UPDATVP 
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
      0083C4 CD 94 73         [ 4]  737         call ABORQ 
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
      008B04 2A 25            [ 1] 1942         JRPL SLMOD8 ; both positive nothing to change 
      008B06 7B 03            [ 1] 1943         LD A,(3,SP)
      008B08 18 04            [ 1] 1944         XOR A,(4,SP)
      008B0A 2A 12            [ 1] 1945         JRPL SLMOD1
                                   1946 ; dividend and divisor are opposite sign          
      008B0C CD 8C 18         [ 4] 1947         CALL ONEP   ; add one to quotient 
      008B0F CD 89 07         [ 4] 1948         CALL NEGAT ; negative quotient
      008B12 CD 85 C6         [ 4] 1949         CALL RAT 
      008B15 CD 88 5E         [ 4] 1950         CALL ROT 
      008B18 CD 89 53         [ 4] 1951         CALL SUBB  ; corrected_remainder=divisor-remainder 
      008B1B CD 86 AA         [ 4] 1952         CALL SWAPP
      008B1E                       1953 SLMOD1:
      008B1E 7B 04            [ 1] 1954         LD A,(4,SP) ; divisor sign 
      008B20 2A 09            [ 1] 1955         JRPL SLMOD8 
      008B22 CD 86 63         [ 4] 1956         CALL TOR 
      008B25 CD 89 07         [ 4] 1957         CALL NEGAT ; if divisor negative negate remainder 
      008B28 CD 85 B5         [ 4] 1958         CALL RFROM 
      008B2B                       1959 SLMOD8: 
      008B2B 5B 04            [ 2] 1960         ADDW SP,#4 
      008B2D 81               [ 4] 1961         RET 
                                   1962 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



                                   1963 
                                   1964 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1965 ;       MOD     ( n n -- r )
                                   1966 ;       Signed divide. Return mod only.
                                   1967 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000AAE                       1968         _HEADER MODD,3,"MOD"
      008B2E 8A E7                    1         .word LINK 
                           000AB0     2         LINK=.
      008B30 03                       3         .byte 3  
      008B31 4D 4F 44                 4         .ascii "MOD"
      008B34                          5         MODD:
      008B34 CD 8A EC         [ 4] 1969 	CALL	SLMOD
      008B37 CC 86 90         [ 2] 1970 	JP	DROP
                                   1971 
                                   1972 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1973 ;       /       ( n n -- q )
                                   1974 ;       Signed divide. Return quotient only.
                                   1975 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000ABA                       1976         _HEADER SLASH,1,"/"
      008B3A 8B 30                    1         .word LINK 
                           000ABC     2         LINK=.
      008B3C 01                       3         .byte 1  
      008B3D 2F                       4         .ascii "/"
      008B3E                          5         SLASH:
      008B3E CD 8A EC         [ 4] 1977         CALL	SLMOD
      008B41 CD 86 AA         [ 4] 1978         CALL	SWAPP
      008B44 CC 86 90         [ 2] 1979         JP	DROP
                                   1980 
                                   1981 ;; Multiply
                                   1982 
                                   1983 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1984 ;       UM*     ( u1 u2 -- ud )
                                   1985 ;       Unsigned multiply. Return 
                                   1986 ;       double product.
                                   1987 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000AC7                       1988         _HEADER UMSTA,3,"UM*"
      008B47 8B 3C                    1         .word LINK 
                           000AC9     2         LINK=.
      008B49 03                       3         .byte 3  
      008B4A 55 4D 2A                 4         .ascii "UM*"
      008B4D                          5         UMSTA:
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
      008B4D 90 5F            [ 1] 2002         clrw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



      008B4F 90 89            [ 2] 2003         pushw y  ; bits 15..0
      008B51 90 89            [ 2] 2004         pushw y  ; bits 31..16 
      008B53 E6 03            [ 1] 2005         ld a,(db,x) ; b 
      008B55 90 97            [ 1] 2006         ld yl,a 
      008B57 E6 01            [ 1] 2007         ld a,(dd,x)   ; d
      008B59 90 42            [ 4] 2008         mul y,a    ; b*d  
      008B5B 17 03            [ 2] 2009         ldw (UD3,sp),y ; lowest weight product 
      008B5D E6 03            [ 1] 2010         ld a,(db,x)
      008B5F 90 97            [ 1] 2011         ld yl,a 
      008B61 E6 00            [ 1] 2012         ld a,(dc,x)
      008B63 90 42            [ 4] 2013         mul y,a  ; b*c 
                                   2014         ;;; do the partial sum 
      008B65 72 F9 02         [ 2] 2015         addw y,(UD2,sp)
      008B68 4F               [ 1] 2016         clr a 
      008B69 49               [ 1] 2017         rlc a
      008B6A 6B 01            [ 1] 2018         ld (UD1,sp),a 
      008B6C 17 02            [ 2] 2019         ldw (UD2,sp),y 
      008B6E E6 02            [ 1] 2020         ld a,(da,x)
      008B70 90 97            [ 1] 2021         ld yl,a 
      008B72 E6 01            [ 1] 2022         ld a,(dd,x)
      008B74 90 42            [ 4] 2023         mul y,a   ; a*d 
                                   2024         ;; do partial sum 
      008B76 72 F9 02         [ 2] 2025         addw y,(UD2,sp)
      008B79 4F               [ 1] 2026         clr a 
      008B7A 19 01            [ 1] 2027         adc a,(UD1,sp)
      008B7C 6B 01            [ 1] 2028         ld (UD1,sp),a  
      008B7E 17 02            [ 2] 2029         ldw (UD2,sp),y 
      008B80 E6 02            [ 1] 2030         ld a,(da,x)
      008B82 90 97            [ 1] 2031         ld yl,a 
      008B84 E6 00            [ 1] 2032         ld a,(dc,x)
      008B86 90 42            [ 4] 2033         mul y,a  ;  a*c highest weight product 
                                   2034         ;;; do partial sum 
      008B88 72 F9 01         [ 2] 2035         addw y,(UD1,sp)
      008B8B FF               [ 2] 2036         ldw (x),y  ; udh 
      008B8C 16 03            [ 2] 2037         ldw y,(UD3,sp)
      008B8E EF 02            [ 2] 2038         ldw (2,x),y  ; udl  
      008B90 5B 04            [ 2] 2039         addw sp,#4 ; drop local variable 
      008B92 81               [ 4] 2040         ret  
                                   2041 
                                   2042 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2043 ;       *       ( n n -- n )
                                   2044 ;       Signed multiply. Return 
                                   2045 ;       single product.
                                   2046 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000B13                       2047         _HEADER STAR,1,"*"
      008B93 8B 49                    1         .word LINK 
                           000B15     2         LINK=.
      008B95 01                       3         .byte 1  
      008B96 2A                       4         .ascii "*"
      008B97                          5         STAR:
      008B97 CD 8B 4D         [ 4] 2048 	CALL	UMSTA
      008B9A CC 86 90         [ 2] 2049 	JP	DROP
                                   2050 
                                   2051 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2052 ;       M*      ( n n -- d )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



                                   2053 ;       Signed multiply. Return 
                                   2054 ;       double product.
                                   2055 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000B1D                       2056         _HEADER MSTAR,2,"M*"
      008B9D 8B 95                    1         .word LINK 
                           000B1F     2         LINK=.
      008B9F 02                       3         .byte 2  
      008BA0 4D 2A                    4         .ascii "M*"
      008BA2                          5         MSTAR:
      008BA2 CD 88 A8         [ 4] 2057         CALL	DDUP
      008BA5 CD 87 20         [ 4] 2058         CALL	XORR
      008BA8 CD 86 D1         [ 4] 2059         CALL	ZLESS
      008BAB CD 86 63         [ 4] 2060         CALL	TOR
      008BAE CD 89 6D         [ 4] 2061         CALL	ABSS
      008BB1 CD 86 AA         [ 4] 2062         CALL	SWAPP
      008BB4 CD 89 6D         [ 4] 2063         CALL	ABSS
      008BB7 CD 8B 4D         [ 4] 2064         CALL	UMSTA
      008BBA CD 85 B5         [ 4] 2065         CALL	RFROM
      008BBD CD 85 19         [ 4] 2066         CALL	QBRAN
      008BC0 8B C5                 2067         .word	MSTA1
      008BC2 CC 89 19         [ 2] 2068         JP	DNEGA
      008BC5 81               [ 4] 2069 MSTA1:	RET
                                   2070 
                                   2071 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2072 ;       */MOD   ( n1 n2 n3 -- r q )
                                   2073 ;       Multiply n1 and n2, then divide
                                   2074 ;       by n3. Return mod and quotient.
                                   2075 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000B46                       2076         _HEADER SSMOD,5,"*/MOD"
      008BC6 8B 9F                    1         .word LINK 
                           000B48     2         LINK=.
      008BC8 05                       3         .byte 5  
      008BC9 2A 2F 4D 4F 44           4         .ascii "*/MOD"
      008BCE                          5         SSMOD:
      008BCE CD 86 63         [ 4] 2077         CALL     TOR
      008BD1 CD 8B A2         [ 4] 2078         CALL     MSTAR
      008BD4 CD 85 B5         [ 4] 2079         CALL     RFROM
      008BD7 CC 8A 9C         [ 2] 2080         JP     MSMOD
                                   2081 
                                   2082 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2083 ;       */      ( n1 n2 n3 -- q )
                                   2084 ;       Multiply n1 by n2, then divide
                                   2085 ;       by n3. Return quotient only.
                                   2086 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000B5A                       2087         _HEADER STASL,2,"*/"
      008BDA 8B C8                    1         .word LINK 
                           000B5C     2         LINK=.
      008BDC 02                       3         .byte 2  
      008BDD 2A 2F                    4         .ascii "*/"
      008BDF                          5         STASL:
      008BDF CD 8B CE         [ 4] 2088         CALL	SSMOD
      008BE2 CD 86 AA         [ 4] 2089         CALL	SWAPP
      008BE5 CC 86 90         [ 2] 2090         JP	DROP
                                   2091 
                                   2092 ;; Miscellaneous
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



                                   2093 
                                   2094 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2095 ;       2+   ( a -- a )
                                   2096 ;       Add cell size in byte to address.
                                   2097 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000B68                       2098         _HEADER CELLP,2,"2+"
      008BE8 8B DC                    1         .word LINK 
                           000B6A     2         LINK=.
      008BEA 02                       3         .byte 2  
      008BEB 32 2B                    4         .ascii "2+"
      008BED                          5         CELLP:
      008BED 90 93            [ 1] 2099         LDW Y,X
      008BEF 90 FE            [ 2] 2100 	LDW Y,(Y)
      008BF1 72 A9 00 02      [ 2] 2101         ADDW Y,#CELLL 
      008BF5 FF               [ 2] 2102         LDW (X),Y
      008BF6 81               [ 4] 2103         RET
                                   2104 
                                   2105 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2106 ;       2-   ( a -- a )
                                   2107 ;       Subtract 2 from address.
                                   2108 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000B77                       2109         _HEADER CELLM,2,"2-"
      008BF7 8B EA                    1         .word LINK 
                           000B79     2         LINK=.
      008BF9 02                       3         .byte 2  
      008BFA 32 2D                    4         .ascii "2-"
      008BFC                          5         CELLM:
      008BFC 90 93            [ 1] 2110         LDW Y,X
      008BFE 90 FE            [ 2] 2111 	LDW Y,(Y)
      008C00 72 A2 00 02      [ 2] 2112         SUBW Y,#CELLL
      008C04 FF               [ 2] 2113         LDW (X),Y
      008C05 81               [ 4] 2114         RET
                                   2115 
                                   2116 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2117 ;       2*   ( n -- n )
                                   2118 ;       Multiply tos by 2.
                                   2119 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000B86                       2120         _HEADER CELLS,2,"2*"
      008C06 8B F9                    1         .word LINK 
                           000B88     2         LINK=.
      008C08 02                       3         .byte 2  
      008C09 32 2A                    4         .ascii "2*"
      008C0B                          5         CELLS:
      008C0B 90 93            [ 1] 2121         LDW Y,X
      008C0D 90 FE            [ 2] 2122 	LDW Y,(Y)
      008C0F 90 58            [ 2] 2123         SLAW Y
      008C11 FF               [ 2] 2124         LDW (X),Y
      008C12 81               [ 4] 2125         RET
                                   2126 
                                   2127 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2128 ;       1+      ( a -- a )
                                   2129 ;       Add cell size in byte 
                                   2130 ;       to address.
                                   2131 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000B93                       2132         _HEADER ONEP,2,"1+"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



      008C13 8C 08                    1         .word LINK 
                           000B95     2         LINK=.
      008C15 02                       3         .byte 2  
      008C16 31 2B                    4         .ascii "1+"
      008C18                          5         ONEP:
      008C18 90 93            [ 1] 2133         LDW Y,X
      008C1A 90 FE            [ 2] 2134 	LDW Y,(Y)
      008C1C 90 5C            [ 1] 2135         INCW Y
      008C1E FF               [ 2] 2136         LDW (X),Y
      008C1F 81               [ 4] 2137         RET
                                   2138 
                                   2139 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2140 ;       1-      ( a -- a )
                                   2141 ;       Subtract 2 from address.
                                   2142 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000BA0                       2143         _HEADER ONEM,2,"1-"
      008C20 8C 15                    1         .word LINK 
                           000BA2     2         LINK=.
      008C22 02                       3         .byte 2  
      008C23 31 2D                    4         .ascii "1-"
      008C25                          5         ONEM:
      008C25 90 93            [ 1] 2144         LDW Y,X
      008C27 90 FE            [ 2] 2145 	LDW Y,(Y)
      008C29 90 5A            [ 2] 2146         DECW Y
      008C2B FF               [ 2] 2147         LDW (X),Y
      008C2C 81               [ 4] 2148         RET
                                   2149 
                                   2150 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2151 ;  shift left n times 
                                   2152 ; LSHIFT ( n1 n2 -- n1<<n2 )
                                   2153 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000BAD                       2154         _HEADER LSHIFT,6,"LSHIFT"
      008C2D 8C 22                    1         .word LINK 
                           000BAF     2         LINK=.
      008C2F 06                       3         .byte 6  
      008C30 4C 53 48 49 46 54        4         .ascii "LSHIFT"
      008C36                          5         LSHIFT:
      008C36 E6 01            [ 1] 2155         ld a,(1,x)
      008C38 1C 00 02         [ 2] 2156         addw x,#CELLL 
      008C3B 90 93            [ 1] 2157         ldw y,x 
      008C3D 90 FE            [ 2] 2158         ldw y,(y)
      008C3F                       2159 LSHIFT1:
      008C3F 4D               [ 1] 2160         tnz a 
      008C40 27 05            [ 1] 2161         jreq LSHIFT4 
      008C42 90 58            [ 2] 2162         sllw y 
      008C44 4A               [ 1] 2163         dec a 
      008C45 20 F8            [ 2] 2164         jra LSHIFT1 
      008C47                       2165 LSHIFT4:
      008C47 FF               [ 2] 2166         ldw (x),y 
      008C48 81               [ 4] 2167         ret 
                                   2168 
                                   2169 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2170 ; shift right n times                 
                                   2171 ; RSHIFT (n1 n2 -- n1>>n2 )
                                   2172 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



      000BC9                       2173         _HEADER RSHIFT,6,"RSHIFT"
      008C49 8C 2F                    1         .word LINK 
                           000BCB     2         LINK=.
      008C4B 06                       3         .byte 6  
      008C4C 52 53 48 49 46 54        4         .ascii "RSHIFT"
      008C52                          5         RSHIFT:
      008C52 E6 01            [ 1] 2174         ld a,(1,x)
      008C54 1C 00 02         [ 2] 2175         addw x,#CELLL 
      008C57 90 93            [ 1] 2176         ldw y,x 
      008C59 90 FE            [ 2] 2177         ldw y,(y)
      008C5B                       2178 RSHIFT1:
      008C5B 4D               [ 1] 2179         tnz a 
      008C5C 27 05            [ 1] 2180         jreq RSHIFT4 
      008C5E 90 54            [ 2] 2181         srlw y 
      008C60 4A               [ 1] 2182         dec a 
      008C61 20 F8            [ 2] 2183         jra RSHIFT1 
      008C63                       2184 RSHIFT4:
      008C63 FF               [ 2] 2185         ldw (x),y 
      008C64 81               [ 4] 2186         ret 
                                   2187 
                                   2188 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2189 ;       2/      ( n -- n )
                                   2190 ;       divide  tos by 2.
                                   2191 ;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000BE5                       2192         _HEADER TWOSL,2,"2/"
      008C65 8C 4B                    1         .word LINK 
                           000BE7     2         LINK=.
      008C67 02                       3         .byte 2  
      008C68 32 2F                    4         .ascii "2/"
      008C6A                          5         TWOSL:
      008C6A 90 93            [ 1] 2193         LDW Y,X
      008C6C 90 FE            [ 2] 2194 	LDW Y,(Y)
      008C6E 90 57            [ 2] 2195         SRAW Y
      008C70 FF               [ 2] 2196         LDW (X),Y
      008C71 81               [ 4] 2197         RET
                                   2198 
                                   2199 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2200 ;       BL      ( -- 32 )
                                   2201 ;       Return 32,  blank character.
                                   2202 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000BF2                       2203         _HEADER BLANK,2,"BL"
      008C72 8C 67                    1         .word LINK 
                           000BF4     2         LINK=.
      008C74 02                       3         .byte 2  
      008C75 42 4C                    4         .ascii "BL"
      008C77                          5         BLANK:
      008C77 1D 00 02         [ 2] 2204         SUBW X,#2
      008C7A 90 AE 00 20      [ 2] 2205 	LDW Y,#32
      008C7E FF               [ 2] 2206         LDW (X),Y
      008C7F 81               [ 4] 2207         RET
                                   2208 
                                   2209 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2210 ;         0     ( -- 0)
                                   2211 ;         Return 0.
                                   2212 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



      000C00                       2213         _HEADER ZERO,1,"0"
      008C80 8C 74                    1         .word LINK 
                           000C02     2         LINK=.
      008C82 01                       3         .byte 1  
      008C83 30                       4         .ascii "0"
      008C84                          5         ZERO:
      008C84 1D 00 02         [ 2] 2214         SUBW X,#2
      008C87 90 5F            [ 1] 2215 	CLRW Y
      008C89 FF               [ 2] 2216         LDW (X),Y
      008C8A 81               [ 4] 2217         RET
                                   2218 
                                   2219 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2220 ;         1     ( -- 1)
                                   2221 ;         Return 1.
                                   2222 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000C0B                       2223         _HEADER ONE,1,"1"
      008C8B 8C 82                    1         .word LINK 
                           000C0D     2         LINK=.
      008C8D 01                       3         .byte 1  
      008C8E 31                       4         .ascii "1"
      008C8F                          5         ONE:
      008C8F 1D 00 02         [ 2] 2224         SUBW X,#2
      008C92 90 AE 00 01      [ 2] 2225 	LDW Y,#1
      008C96 FF               [ 2] 2226         LDW (X),Y
      008C97 81               [ 4] 2227         RET
                                   2228 
                                   2229 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2230 ;         -1    ( -- -1)
                                   2231 ;   Return -1
                                   2232 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000C18                       2233         _HEADER MONE,2,"-1"
      008C98 8C 8D                    1         .word LINK 
                           000C1A     2         LINK=.
      008C9A 02                       3         .byte 2  
      008C9B 2D 31                    4         .ascii "-1"
      008C9D                          5         MONE:
      008C9D 1D 00 02         [ 2] 2234         SUBW X,#2
      008CA0 90 AE FF FF      [ 2] 2235 	LDW Y,#0xFFFF
      008CA4 FF               [ 2] 2236         LDW (X),Y
      008CA5 81               [ 4] 2237         RET
                                   2238 
                                   2239 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2240 ;       >CHAR   ( c -- c )
                                   2241 ;       Filter non-printing characters.
                                   2242 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000C26                       2243         _HEADER TCHAR,5,">CHAR"
      008CA6 8C 9A                    1         .word LINK 
                           000C28     2         LINK=.
      008CA8 05                       3         .byte 5  
      008CA9 3E 43 48 41 52           4         .ascii ">CHAR"
      008CAE                          5         TCHAR:
      008CAE E6 01            [ 1] 2244         ld a,(1,x)
      008CB0 A1 20            [ 1] 2245         cp a,#32  
      008CB2 2B 05            [ 1] 2246         jrmi 1$ 
      008CB4 A1 7F            [ 1] 2247         cp a,#127 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



      008CB6 2A 01            [ 1] 2248         jrpl 1$ 
      008CB8 81               [ 4] 2249         ret 
      008CB9 A6 5F            [ 1] 2250 1$:     ld a,#'_ 
      008CBB E7 01            [ 1] 2251         ld (1,x),a 
      008CBD 81               [ 4] 2252         ret 
                                   2253 
                                   2254 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2255 ;       DEPTH   ( -- n )
                                   2256 ;       Return  depth of  data stack.
                                   2257 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000C3E                       2258         _HEADER DEPTH,5,"DEPTH"
      008CBE 8C A8                    1         .word LINK 
                           000C40     2         LINK=.
      008CC0 05                       3         .byte 5  
      008CC1 44 45 50 54 48           4         .ascii "DEPTH"
      008CC6                          5         DEPTH:
      008CC6 90 BE 2C         [ 2] 2259         LDW Y,SP0    ;save data stack ptr
      008CC9 BF 24            [ 2] 2260 	LDW XTEMP,X
      008CCB 72 B2 00 24      [ 2] 2261         SUBW Y,XTEMP     ;#bytes = SP0 - X
      008CCF 90 57            [ 2] 2262         SRAW Y    ;Y = #stack items
      008CD1 1D 00 02         [ 2] 2263 	SUBW X,#2
      008CD4 FF               [ 2] 2264         LDW (X),Y     ; if neg, underflow
      008CD5 81               [ 4] 2265         RET
                                   2266 
                                   2267 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2268 ;       PICK    ( ... +n -- ... w )
                                   2269 ;       Copy  nth stack item to tos.
                                   2270 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000C56                       2271         _HEADER PICK,4,"PICK"
      008CD6 8C C0                    1         .word LINK 
                           000C58     2         LINK=.
      008CD8 04                       3         .byte 4  
      008CD9 50 49 43 4B              4         .ascii "PICK"
      008CDD                          5         PICK:
      008CDD 90 93            [ 1] 2272         LDW Y,X   ;D = n1
      008CDF 90 FE            [ 2] 2273         LDW Y,(Y)
                                   2274 ; modified for standard compliance          
                                   2275 ; 0 PICK must be equivalent to DUP 
      008CE1 90 5C            [ 1] 2276         INCW Y 
      008CE3 90 58            [ 2] 2277         SLAW Y
      008CE5 BF 24            [ 2] 2278         LDW XTEMP,X
      008CE7 72 B9 00 24      [ 2] 2279         ADDW Y,XTEMP
      008CEB 90 FE            [ 2] 2280         LDW Y,(Y)
      008CED FF               [ 2] 2281         LDW (X),Y
      008CEE 81               [ 4] 2282         RET
                                   2283 
                                   2284 ;; Memory access
                                   2285 
                                   2286 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2287 ;       +!      ( n a -- )
                                   2288 ;       Add n to  contents at 
                                   2289 ;       address a.
                                   2290 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000C6F                       2291         _HEADER PSTOR,2,"+!"
      008CEF 8C D8                    1         .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



                           000C71     2         LINK=.
      008CF1 02                       3         .byte 2  
      008CF2 2B 21                    4         .ascii "+!"
      008CF4                          5         PSTOR:
      008CF4 89               [ 2] 2292         PUSHW X   ; R: DP 
      008CF5 90 93            [ 1] 2293         LDW Y,X 
      008CF7 FE               [ 2] 2294         LDW X,(X) ; a 
      008CF8 90 EE 02         [ 2] 2295         LDW Y,(2,Y)  ; n 
      008CFB 90 89            [ 2] 2296         PUSHW Y      ; R: DP n 
      008CFD 90 93            [ 1] 2297         LDW Y,X 
      008CFF 90 FE            [ 2] 2298         LDW Y,(Y)
      008D01 72 F9 01         [ 2] 2299         ADDW Y,(1,SP) ; *a + n 
      008D04 FF               [ 2] 2300         LDW (X),Y 
      008D05 1E 03            [ 2] 2301         LDW X,(3,SP) ; DP
      008D07 1C 00 04         [ 2] 2302         ADDW X,#2*CELLL  ; ( n a -- )  
      008D0A 5B 04            [ 2] 2303         ADDW SP,#2*CELLL ; R: DP n -- 
      008D0C 81               [ 4] 2304         RET 
                                   2305                 
                                   2306 
                                   2307 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2308 ;       2!      ( d a -- )
                                   2309 ;       Store  double integer 
                                   2310 ;       to address a.
                                   2311 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000C8D                       2312         _HEADER DSTOR,2,"2!"
      008D0D 8C F1                    1         .word LINK 
                           000C8F     2         LINK=.
      008D0F 02                       3         .byte 2  
      008D10 32 21                    4         .ascii "2!"
      008D12                          5         DSTOR:
      008D12 90 93            [ 1] 2313         LDW Y,X 
      008D14 89               [ 2] 2314         PUSHW X 
      008D15 FE               [ 2] 2315         LDW X,(X) ; a 
      008D16 90 EE 02         [ 2] 2316         LDW Y,(2,Y) ; dhi 
      008D19 FF               [ 2] 2317         LDW (X),Y 
      008D1A 16 01            [ 2] 2318         LDW Y,(1,SP)  
      008D1C 90 EE 04         [ 2] 2319         LDW Y,(4,Y) ; dlo 
      008D1F EF 02            [ 2] 2320         LDW (2,X),Y  
      008D21 85               [ 2] 2321         POPW X 
      008D22 1C 00 06         [ 2] 2322         ADDW X,#3*CELLL 
      008D25 81               [ 4] 2323         RET 
                                   2324 
                                   2325 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2326 ;       2@      ( a -- d )
                                   2327 ;       Fetch double integer 
                                   2328 ;       from address a.
                                   2329 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000CA6                       2330         _HEADER DAT,2,"2@"
      008D26 8D 0F                    1         .word LINK 
                           000CA8     2         LINK=.
      008D28 02                       3         .byte 2  
      008D29 32 40                    4         .ascii "2@"
      008D2B                          5         DAT:
      008D2B 90 93            [ 1] 2331         ldw y,x 
      008D2D 1D 00 02         [ 2] 2332         subw x,#CELLL 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



      008D30 90 FE            [ 2] 2333         ldw y,(y) ;address 
      008D32 90 89            [ 2] 2334         pushw y  
      008D34 90 FE            [ 2] 2335         ldw y,(y) ; dhi 
      008D36 FF               [ 2] 2336         ldw (x),y 
      008D37 90 85            [ 2] 2337         popw y 
      008D39 90 EE 02         [ 2] 2338         ldw y,(2,y) ; dlo 
      008D3C EF 02            [ 2] 2339         ldw (2,x),y 
      008D3E 81               [ 4] 2340         ret 
                                   2341 
                                   2342 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2343 ;       COUNT   ( b -- b +n )
                                   2344 ;       Return count byte of a string
                                   2345 ;       and add 1 to byte address.
                                   2346 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000CBF                       2347         _HEADER COUNT,5,"COUNT"
      008D3F 8D 28                    1         .word LINK 
                           000CC1     2         LINK=.
      008D41 05                       3         .byte 5  
      008D42 43 4F 55 4E 54           4         .ascii "COUNT"
      008D47                          5         COUNT:
      008D47 90 93            [ 1] 2348         ldw y,x 
      008D49 90 FE            [ 2] 2349         ldw y,(y) ; address 
      008D4B 90 F6            [ 1] 2350         ld a,(y)  ; count 
      008D4D 90 5C            [ 1] 2351         incw y 
      008D4F FF               [ 2] 2352         ldw (x),y 
      008D50 1D 00 02         [ 2] 2353         subw x,#CELLL 
      008D53 E7 01            [ 1] 2354         ld (1,x),a 
      008D55 7F               [ 1] 2355         clr (x)
      008D56 81               [ 4] 2356         ret 
                                   2357 
                                   2358 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2359 ;       HERE    ( -- a )
                                   2360 ;       Return  top of  variables
                                   2361 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000CD7                       2362         _HEADER HERE,4,"HERE"
      008D57 8D 41                    1         .word LINK 
                           000CD9     2         LINK=.
      008D59 04                       3         .byte 4  
      008D5A 48 45 52 45              4         .ascii "HERE"
      008D5E                          5         HERE:
      008D5E 90 AE 00 18      [ 2] 2363       	ldw y,#UVP 
      008D62 90 FE            [ 2] 2364         ldw y,(y)
      008D64 1D 00 02         [ 2] 2365         subw x,#CELLL 
      008D67 FF               [ 2] 2366         ldw (x),y 
      008D68 81               [ 4] 2367         ret 
                                   2368 
                                   2369 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2370 ;       PAD     ( -- a )
                                   2371 ;       Return address of text buffer
                                   2372 ;       above  code dictionary.
                                   2373 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000CE9                       2374         _HEADER PAD,3,"PAD"
      008D69 8D 59                    1         .word LINK 
                           000CEB     2         LINK=.
      008D6B 03                       3         .byte 3  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



      008D6C 50 41 44                 4         .ascii "PAD"
      008D6F                          5         PAD:
      008D6F CD 8D 5E         [ 4] 2375         CALL     HERE
      000CF2                       2376         _DOLIT   80
      008D72 CD 84 F0         [ 4]    1     CALL DOLIT 
      008D75 00 50                    2     .word 80 
      008D77 CC 88 BD         [ 2] 2377         JP     PLUS
                                   2378 
                                   2379 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2380 ;       TIB     ( -- a )
                                   2381 ;       Return address of 
                                   2382 ;       terminal input buffer.
                                   2383 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000CFA                       2384         _HEADER TIB,3,"TIB"
      008D7A 8D 6B                    1         .word LINK 
                           000CFC     2         LINK=.
      008D7C 03                       3         .byte 3  
      008D7D 54 49 42                 4         .ascii "TIB"
      008D80                          5         TIB:
      008D80 CD 87 8E         [ 4] 2385         CALL     NTIB
      008D83 CD 8B ED         [ 4] 2386         CALL     CELLP
      008D86 CC 85 64         [ 2] 2387         JP     AT
                                   2388 
                                   2389 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2390 ;       @EXECUTE        ( a -- )
                                   2391 ;       Execute vector stored in 
                                   2392 ;       address a.
                                   2393 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000D09                       2394         _HEADER ATEXE,8,"@EXECUTE"
      008D89 8D 7C                    1         .word LINK 
                           000D0B     2         LINK=.
      008D8B 08                       3         .byte 8  
      008D8C 40 45 58 45 43 55 54     4         .ascii "@EXECUTE"
             45
      008D94                          5         ATEXE:
      008D94 CD 85 64         [ 4] 2395         CALL     AT
      008D97 CD 88 4D         [ 4] 2396         CALL     QDUP    ;?address or zero
      008D9A CD 85 19         [ 4] 2397         CALL     QBRAN
      008D9D 8D A2                 2398         .word      EXE1
      008D9F CD 85 45         [ 4] 2399         CALL     EXECU   ;execute if non-zero
      008DA2 81               [ 4] 2400 EXE1:   RET     ;do nothing if zero
                                   2401 
                                   2402 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2403 ;       CMOVE   ( b1 b2 u -- )
                                   2404 ;       Copy u bytes from b1 to b2.
                                   2405 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000D23                       2406         _HEADER CMOVE,5,"CMOVE"
      008DA3 8D 8B                    1         .word LINK 
                           000D25     2         LINK=.
      008DA5 05                       3         .byte 5  
      008DA6 43 4D 4F 56 45           4         .ascii "CMOVE"
      008DAB                          5         CMOVE:
                                   2407         ;;;;  local variables ;;;;;;;
                           000005  2408         DP = 5
                           000003  2409         YTMP = 3 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



                           000001  2410         CNT  = 1 
                                   2411         ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      008DAB 89               [ 2] 2412         PUSHW X  ; R: DP  
      008DAC 52 02            [ 2] 2413         SUB SP,#2 ; R: DP YTMP 
      008DAE 90 93            [ 1] 2414         LDW Y,X 
      008DB0 90 FE            [ 2] 2415         LDW Y,(Y) ; CNT 
      008DB2 90 89            [ 2] 2416         PUSHW Y  ; R: DP YTMP CNT
      008DB4 90 93            [ 1] 2417         LDW Y,X 
      008DB6 90 EE 02         [ 2] 2418         LDW Y,(2,Y) ; b2, dest 
      008DB9 EE 04            [ 2] 2419         LDW X,(4,X) ; b1, src 
      008DBB 17 03            [ 2] 2420         LDW (YTMP,SP),Y 
      008DBD 13 03            [ 2] 2421         CPW X,(YTMP,SP) 
      008DBF 22 1A            [ 1] 2422         JRUGT CMOV2  ; src>dest 
                                   2423 ; src<dest copy from top to bottom
      008DC1 72 FB 01         [ 2] 2424         ADDW X,(CNT,SP)
      008DC4 72 F9 01         [ 2] 2425         ADDW Y,(CNT,SP)
      008DC7                       2426 CMOV1:  
      008DC7 17 03            [ 2] 2427         LDW (YTMP,SP),Y 
      008DC9 16 01            [ 2] 2428         LDW Y,(CNT,SP)
      008DCB 27 22            [ 1] 2429         JREQ CMOV3 
      008DCD 90 5A            [ 2] 2430         DECW Y 
      008DCF 17 01            [ 2] 2431         LDW (CNT,SP),Y 
      008DD1 16 03            [ 2] 2432         LDW Y,(YTMP,SP)
      008DD3 5A               [ 2] 2433         DECW X
      008DD4 F6               [ 1] 2434         LD A,(X)
      008DD5 90 5A            [ 2] 2435         DECW Y 
      008DD7 90 F7            [ 1] 2436         LD (Y),A 
      008DD9 20 EC            [ 2] 2437         JRA CMOV1
                                   2438 ; src>dest copy from bottom to top   
      008DDB                       2439 CMOV2: 
      008DDB 17 03            [ 2] 2440         LDW (YTMP,SP),Y 
      008DDD 16 01            [ 2] 2441         LDW Y,(CNT,SP)
      008DDF 27 0E            [ 1] 2442         JREQ CMOV3
      008DE1 90 5A            [ 2] 2443         DECW Y 
      008DE3 17 01            [ 2] 2444         LDW (CNT,SP),Y 
      008DE5 16 03            [ 2] 2445         LDW Y,(YTMP,SP)
      008DE7 F6               [ 1] 2446         LD A,(X)
      008DE8 5C               [ 1] 2447         INCW X 
      008DE9 90 F7            [ 1] 2448         LD (Y),A 
      008DEB 90 5C            [ 1] 2449         INCW Y 
      008DED 20 EC            [ 2] 2450         JRA CMOV2 
      008DEF                       2451 CMOV3:
      008DEF 1E 05            [ 2] 2452         LDW X,(DP,SP)
      008DF1 1C 00 06         [ 2] 2453         ADDW X,#3*CELLL 
      008DF4 5B 06            [ 2] 2454         ADDW SP,#3*CELLL 
      008DF6 81               [ 4] 2455         RET 
                                   2456         
                                   2457 
                                   2458 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2459 ;       FILL    ( b u c -- )
                                   2460 ;       Fill u bytes of character c
                                   2461 ;       to area beginning at b.
                                   2462 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000D77                       2463         _HEADER FILL,4,"FILL"
      008DF7 8D A5                    1         .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



                           000D79     2         LINK=.
      008DF9 04                       3         .byte 4  
      008DFA 46 49 4C 4C              4         .ascii "FILL"
      008DFE                          5         FILL:
      008DFE E6 01            [ 1] 2464         LD A,(1,X)
      008E00 90 93            [ 1] 2465         LDW Y,X 
      008E02 1C 00 06         [ 2] 2466         ADDW X,#3*CELLL 
      008E05 89               [ 2] 2467         PUSHW X ; R: DP 
      008E06 93               [ 1] 2468         LDW X,Y 
      008E07 EE 04            [ 2] 2469         LDW X,(4,X) ; b
      008E09 90 EE 02         [ 2] 2470         LDW Y,(2,Y) ; u
      008E0C                       2471 FILL0:
      008E0C 27 06            [ 1] 2472         JREQ FILL1
      008E0E F7               [ 1] 2473         LD (X),A 
      008E0F 5C               [ 1] 2474         INCW X 
      008E10 90 5A            [ 2] 2475         DECW Y 
      008E12 20 F8            [ 2] 2476         JRA FILL0         
      008E14 85               [ 2] 2477 FILL1: POPW X 
      008E15 81               [ 4] 2478         RET         
                                   2479         
                                   2480 
                                   2481 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2482 ;       ERASE   ( b u -- )
                                   2483 ;       Erase u bytes beginning at b.
                                   2484 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000D96                       2485         _HEADER ERASE,5,"ERASE"
      008E16 8D F9                    1         .word LINK 
                           000D98     2         LINK=.
      008E18 05                       3         .byte 5  
      008E19 45 52 41 53 45           4         .ascii "ERASE"
      008E1E                          5         ERASE:
      008E1E 90 5F            [ 1] 2486         clrw y 
      008E20 1D 00 02         [ 2] 2487         subw x,#CELLL 
      008E23 FF               [ 2] 2488         ldw (x),y 
      008E24 CC 8D FE         [ 2] 2489         jp FILL 
                                   2490 
                                   2491 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2492 ;       PACK0   ( b u a -- a )
                                   2493 ;       Build a counted string with
                                   2494 ;       u characters from b. Null fill.
                                   2495 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000DA7                       2496         _HEADER PACKS,5,"PACK0"
      008E27 8E 18                    1         .word LINK 
                           000DA9     2         LINK=.
      008E29 05                       3         .byte 5  
      008E2A 50 41 43 4B 30           4         .ascii "PACK0"
      008E2F                          5         PACKS:
      008E2F CD 86 9A         [ 4] 2497         CALL     DUPP
      008E32 CD 86 63         [ 4] 2498         CALL     TOR     ;strings only on cell boundary
      008E35 CD 88 A8         [ 4] 2499         CALL     DDUP
      008E38 CD 85 71         [ 4] 2500         CALL     CSTOR
      008E3B CD 8C 18         [ 4] 2501         CALL     ONEP ;save count
      008E3E CD 86 AA         [ 4] 2502         CALL     SWAPP
      008E41 CD 8D AB         [ 4] 2503         CALL     CMOVE
      008E44 CD 85 B5         [ 4] 2504         CALL     RFROM
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



      008E47 81               [ 4] 2505         RET
                                   2506 
                                   2507 ;; Numeric output, single precision
                                   2508 
                                   2509 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2510 ;       DIGIT   ( u -- c )
                                   2511 ;       Convert digit u to a character.
                                   2512 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000DC8                       2513         _HEADER DIGIT,5,"DIGIT"
      008E48 8E 29                    1         .word LINK 
                           000DCA     2         LINK=.
      008E4A 05                       3         .byte 5  
      008E4B 44 49 47 49 54           4         .ascii "DIGIT"
      008E50                          5         DIGIT:
      008E50 CD 84 F0         [ 4] 2514         CALL	DOLIT
      008E53 00 09                 2515         .word	9
      008E55 CD 86 C2         [ 4] 2516         CALL	OVER
      008E58 CD 89 A7         [ 4] 2517         CALL	LESS
      008E5B CD 84 F0         [ 4] 2518         CALL	DOLIT
      008E5E 00 07                 2519         .word	7
      008E60 CD 86 F7         [ 4] 2520         CALL	ANDD
      008E63 CD 88 BD         [ 4] 2521         CALL	PLUS
      008E66 CD 84 F0         [ 4] 2522         CALL	DOLIT
      008E69 00 30                 2523         .word	48	;'0'
      008E6B CC 88 BD         [ 2] 2524         JP	PLUS
                                   2525 
                                   2526 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2527 ;       EXTRACT ( n base -- n c )
                                   2528 ;       Extract least significant 
                                   2529 ;       digit from n.
                                   2530 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000DEE                       2531         _HEADER EXTRC,7,"EXTRACT"
      008E6E 8E 4A                    1         .word LINK 
                           000DF0     2         LINK=.
      008E70 07                       3         .byte 7  
      008E71 45 58 54 52 41 43 54     4         .ascii "EXTRACT"
      008E78                          5         EXTRC:
      008E78 CD 8C 84         [ 4] 2532         CALL     ZERO
      008E7B CD 86 AA         [ 4] 2533         CALL     SWAPP
      008E7E CD 8A 32         [ 4] 2534         CALL     UMMOD
      008E81 CD 86 AA         [ 4] 2535         CALL     SWAPP
      008E84 CC 8E 50         [ 2] 2536         JP     DIGIT
                                   2537 
                                   2538 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2539 ;       <#      ( -- )
                                   2540 ;       Initiate  numeric 
                                   2541 ;       output process.
                                   2542 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000E07                       2543         _HEADER BDIGS,2,"#<"
      008E87 8E 70                    1         .word LINK 
                           000E09     2         LINK=.
      008E89 02                       3         .byte 2  
      008E8A 23 3C                    4         .ascii "#<"
      008E8C                          5         BDIGS:
      008E8C CD 8D 6F         [ 4] 2544         CALL     PAD
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



      008E8F CD 87 D0         [ 4] 2545         CALL     HLD
      008E92 CC 85 52         [ 2] 2546         JP     STORE
                                   2547 
                                   2548 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2549 ;       HOLD    ( c -- )
                                   2550 ;       Insert a character 
                                   2551 ;       into output string.
                                   2552 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000E15                       2553         _HEADER HOLD,4,"HOLD"
      008E95 8E 89                    1         .word LINK 
                           000E17     2         LINK=.
      008E97 04                       3         .byte 4  
      008E98 48 4F 4C 44              4         .ascii "HOLD"
      008E9C                          5         HOLD:
      008E9C CD 87 D0         [ 4] 2554         CALL     HLD
      008E9F CD 85 64         [ 4] 2555         CALL     AT
      008EA2 CD 8C 25         [ 4] 2556         CALL     ONEM
      008EA5 CD 86 9A         [ 4] 2557         CALL     DUPP
      008EA8 CD 87 D0         [ 4] 2558         CALL     HLD
      008EAB CD 85 52         [ 4] 2559         CALL     STORE
      008EAE CC 85 71         [ 2] 2560         JP     CSTOR
                                   2561 
                                   2562 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2563 ;       #       ( u -- u )
                                   2564 ;       Extract one digit from u and
                                   2565 ;       append digit to output string.
                                   2566 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000E31                       2567         _HEADER DIG,1,"#"
      008EB1 8E 97                    1         .word LINK 
                           000E33     2         LINK=.
      008EB3 01                       3         .byte 1  
      008EB4 23                       4         .ascii "#"
      008EB5                          5         DIG:
      008EB5 CD 87 60         [ 4] 2568         CALL     BASE
      008EB8 CD 85 64         [ 4] 2569         CALL     AT
      008EBB CD 8E 78         [ 4] 2570         CALL     EXTRC
      008EBE CC 8E 9C         [ 2] 2571         JP     HOLD
                                   2572 
                                   2573 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2574 ;       #S      ( u -- 0 )
                                   2575 ;       Convert u until all digits
                                   2576 ;       are added to output string.
                                   2577 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000E41                       2578         _HEADER DIGS,2,"#S"
      008EC1 8E B3                    1         .word LINK 
                           000E43     2         LINK=.
      008EC3 02                       3         .byte 2  
      008EC4 23 53                    4         .ascii "#S"
      008EC6                          5         DIGS:
      008EC6 CD 8E B5         [ 4] 2579 DIGS1:  CALL     DIG
      008EC9 CD 86 9A         [ 4] 2580         CALL     DUPP
      008ECC CD 85 19         [ 4] 2581         CALL     QBRAN
      008ECF 8E D3                 2582         .word      DIGS2
      008ED1 20 F3            [ 2] 2583         JRA     DIGS1
      008ED3 81               [ 4] 2584 DIGS2:  RET
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



                                   2585 
                                   2586 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2587 ;       SIGN    ( n -- )
                                   2588 ;       Add a minus sign to
                                   2589 ;       numeric output string.
                                   2590 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000E54                       2591         _HEADER SIGN,4,"SIGN"
      008ED4 8E C3                    1         .word LINK 
                           000E56     2         LINK=.
      008ED6 04                       3         .byte 4  
      008ED7 53 49 47 4E              4         .ascii "SIGN"
      008EDB                          5         SIGN:
      008EDB CD 86 D1         [ 4] 2592         CALL     ZLESS
      008EDE CD 85 19         [ 4] 2593         CALL     QBRAN
      008EE1 8E EB                 2594         .word      SIGN1
      008EE3 CD 84 F0         [ 4] 2595         CALL     DOLIT
      008EE6 00 2D                 2596         .word      45	;"-"
      008EE8 CC 8E 9C         [ 2] 2597         JP     HOLD
      008EEB 81               [ 4] 2598 SIGN1:  RET
                                   2599 
                                   2600 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2601 ;       #>      ( w -- b u )
                                   2602 ;       Prepare output string.
                                   2603 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000E6C                       2604         _HEADER EDIGS,2,"#>"
      008EEC 8E D6                    1         .word LINK 
                           000E6E     2         LINK=.
      008EEE 02                       3         .byte 2  
      008EEF 23 3E                    4         .ascii "#>"
      008EF1                          5         EDIGS:
      008EF1 CD 86 90         [ 4] 2605         CALL     DROP
      008EF4 CD 87 D0         [ 4] 2606         CALL     HLD
      008EF7 CD 85 64         [ 4] 2607         CALL     AT
      008EFA CD 8D 6F         [ 4] 2608         CALL     PAD
      008EFD CD 86 C2         [ 4] 2609         CALL     OVER
      008F00 CC 89 53         [ 2] 2610         JP     SUBB
                                   2611 
                                   2612 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2613 ;       str     ( w -- b u )
                                   2614 ;       Convert a signed integer
                                   2615 ;       to a numeric string.
                                   2616 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000E83                       2617         _HEADER STR,3,"STR"
      008F03 8E EE                    1         .word LINK 
                           000E85     2         LINK=.
      008F05 03                       3         .byte 3  
      008F06 53 54 52                 4         .ascii "STR"
      008F09                          5         STR:
      008F09 CD 86 9A         [ 4] 2618         CALL     DUPP
      008F0C CD 86 63         [ 4] 2619         CALL     TOR
      008F0F CD 89 6D         [ 4] 2620         CALL     ABSS
      008F12 CD 8E 8C         [ 4] 2621         CALL     BDIGS
      008F15 CD 8E C6         [ 4] 2622         CALL     DIGS
      008F18 CD 85 B5         [ 4] 2623         CALL     RFROM
      008F1B CD 8E DB         [ 4] 2624         CALL     SIGN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



      008F1E CC 8E F1         [ 2] 2625         JP     EDIGS
                                   2626 
                                   2627 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2628 ;       HEX     ( -- )
                                   2629 ;       Use radix 16 as base for
                                   2630 ;       numeric conversions.
                                   2631 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000EA1                       2632         _HEADER HEX,3,"HEX"
      008F21 8F 05                    1         .word LINK 
                           000EA3     2         LINK=.
      008F23 03                       3         .byte 3  
      008F24 48 45 58                 4         .ascii "HEX"
      008F27                          5         HEX:
      008F27 CD 84 F0         [ 4] 2633         CALL     DOLIT
      008F2A 00 10                 2634         .word      16
      008F2C CD 87 60         [ 4] 2635         CALL     BASE
      008F2F CC 85 52         [ 2] 2636         JP     STORE
                                   2637 
                                   2638 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2639 ;       DECIMAL ( -- )
                                   2640 ;       Use radix 10 as base
                                   2641 ;       for numeric conversions.
                                   2642 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000EB2                       2643         _HEADER DECIM,7,"DECIMAL"
      008F32 8F 23                    1         .word LINK 
                           000EB4     2         LINK=.
      008F34 07                       3         .byte 7  
      008F35 44 45 43 49 4D 41 4C     4         .ascii "DECIMAL"
      008F3C                          5         DECIM:
      008F3C CD 84 F0         [ 4] 2644         CALL     DOLIT
      008F3F 00 0A                 2645         .word      10
      008F41 CD 87 60         [ 4] 2646         CALL     BASE
      008F44 CC 85 52         [ 2] 2647         JP     STORE
                                   2648 
                                   2649 ;; Numeric input, single precision
                                   2650 
                                   2651 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2652 ;       DIGIT?  ( c base -- u t )
                                   2653 ;       Convert a character to its numeric
                                   2654 ;       value. A flag indicates success.
                                   2655 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000EC7                       2656         _HEADER DIGTQ,6,"DIGIT?"
      008F47 8F 34                    1         .word LINK 
                           000EC9     2         LINK=.
      008F49 06                       3         .byte 6  
      008F4A 44 49 47 49 54 3F        4         .ascii "DIGIT?"
      008F50                          5         DIGTQ:
      008F50 CD 86 63         [ 4] 2657         CALL     TOR
      008F53 CD 84 F0         [ 4] 2658         CALL     DOLIT
      008F56 00 30                 2659         .word     48	; "0"
      008F58 CD 89 53         [ 4] 2660         CALL     SUBB
      008F5B CD 84 F0         [ 4] 2661         CALL     DOLIT
      008F5E 00 09                 2662         .word      9
      008F60 CD 86 C2         [ 4] 2663         CALL     OVER
      008F63 CD 89 A7         [ 4] 2664         CALL     LESS
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



      008F66 CD 85 19         [ 4] 2665         CALL     QBRAN
      008F69 8F 81                 2666         .word      DGTQ1
      008F6B CD 84 F0         [ 4] 2667         CALL     DOLIT
      008F6E 00 07                 2668         .word      7
      008F70 CD 89 53         [ 4] 2669         CALL     SUBB
      008F73 CD 86 9A         [ 4] 2670         CALL     DUPP
      008F76 CD 84 F0         [ 4] 2671         CALL     DOLIT
      008F79 00 0A                 2672         .word      10
      008F7B CD 89 A7         [ 4] 2673         CALL     LESS
      008F7E CD 87 0B         [ 4] 2674         CALL     ORR
      008F81 CD 86 9A         [ 4] 2675 DGTQ1:  CALL     DUPP
      008F84 CD 85 B5         [ 4] 2676         CALL     RFROM
      008F87 CC 89 91         [ 2] 2677         JP     ULESS
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



                                   2720         CALL     ONEM
                                   2721         CALL     TOR
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
      000F0A                       2767         _HEADER KEY,3,"KEY"
      008F8A 8F 49                    1         .word LINK 
                           000F0C     2         LINK=.
      008F8C 03                       3         .byte 3  
      008F8D 4B 45 59                 4         .ascii "KEY"
      008F90                          5         KEY:
      008F90 72 0B 52 30 FB   [ 2] 2768         btjf UART_SR,#UART_SR_RXNE,. 
      008F95 C6 52 31         [ 1] 2769         ld a,UART_DR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



      008F98 1D 00 02         [ 2] 2770         subw x,#CELLL 
      008F9B E7 01            [ 1] 2771         ld (1,x),a 
      008F9D 7F               [ 1] 2772         clr (x)
      008F9E 81               [ 4] 2773         ret 
                                   2774 
                                   2775 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2776 ;       NUF?    ( -- t )
                                   2777 ;       Return false if no input,
                                   2778 ;       else pause and if CR return true.
                                   2779 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000F1F                       2780         _HEADER NUFQ,4,"NUF?"
      008F9F 8F 8C                    1         .word LINK 
                           000F21     2         LINK=.
      008FA1 04                       3         .byte 4  
      008FA2 4E 55 46 3F              4         .ascii "NUF?"
      008FA6                          5         NUFQ:
      008FA6 CD 84 99         [ 4] 2781         CALL     QKEY
      008FA9 CD 86 9A         [ 4] 2782         CALL     DUPP
      008FAC CD 85 19         [ 4] 2783         CALL     QBRAN
      008FAF 8F BF                 2784         .word    NUFQ1
      008FB1 CD 88 9D         [ 4] 2785         CALL     DDROP
      008FB4 CD 8F 90         [ 4] 2786         CALL     KEY
      008FB7 CD 84 F0         [ 4] 2787         CALL     DOLIT
      008FBA 00 0D                 2788         .word      CRR
      008FBC CC 89 7B         [ 2] 2789         JP     EQUAL
      008FBF 81               [ 4] 2790 NUFQ1:  RET
                                   2791 
                                   2792 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2793 ;       SPACE   ( -- )
                                   2794 ;       Send  blank character to
                                   2795 ;       output device.
                                   2796 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000F40                       2797         _HEADER SPACE,5,"SPACE"
      008FC0 8F A1                    1         .word LINK 
                           000F42     2         LINK=.
      008FC2 05                       3         .byte 5  
      008FC3 53 50 41 43 45           4         .ascii "SPACE"
      008FC8                          5         SPACE:
      008FC8 CD 8C 77         [ 4] 2798         CALL     BLANK
      008FCB CC 84 B7         [ 2] 2799         JP     EMIT
                                   2800 
                                   2801 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2802 ;       SPACES  ( +n -- )
                                   2803 ;       Send n spaces to output device.
                                   2804 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000F4E                       2805         _HEADER SPACS,6,"SPACES"
      008FCE 8F C2                    1         .word LINK 
                           000F50     2         LINK=.
      008FD0 06                       3         .byte 6  
      008FD1 53 50 41 43 45 53        4         .ascii "SPACES"
      008FD7                          5         SPACS:
      008FD7 CD 8C 84         [ 4] 2806         CALL     ZERO
      008FDA CD 89 EC         [ 4] 2807         CALL     MAX
      008FDD CD 86 63         [ 4] 2808         CALL     TOR
      008FE0 20 03            [ 2] 2809         JRA      CHAR2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



      008FE2 CD 8F C8         [ 4] 2810 CHAR1:  CALL     SPACE
      008FE5 CD 85 04         [ 4] 2811 CHAR2:  CALL     DONXT
      008FE8 8F E2                 2812         .word    CHAR1
      008FEA 81               [ 4] 2813         RET
                                   2814 
                                   2815 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2816 ;       TYPE    ( b u -- )
                                   2817 ;       Output u characters from b.
                                   2818 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000F6B                       2819         _HEADER TYPES,4,"TYPE"
      008FEB 8F D0                    1         .word LINK 
                           000F6D     2         LINK=.
      008FED 04                       3         .byte 4  
      008FEE 54 59 50 45              4         .ascii "TYPE"
      008FF2                          5         TYPES:
      008FF2 CD 86 63         [ 4] 2820         CALL     TOR
      008FF5 20 06            [ 2] 2821         JRA     TYPE2
      008FF7 CD 8D 47         [ 4] 2822 TYPE1:  CALL     COUNT 
      008FFA CD 84 B7         [ 4] 2823         CALL     EMIT
      000F7D                       2824 TYPE2:  _DONXT  TYPE1
      008FFD CD 85 04         [ 4]    1     CALL DONXT 
      009000 8F F7                    2     .word TYPE1 
      000F82                       2825         _DROP
      009002 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      009005 81               [ 4] 2826         RET 
                                   2827 
                                   2828 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2829 ;       CR      ( -- )
                                   2830 ;       Output a carriage return
                                   2831 ;       and a line feed.
                                   2832 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000F86                       2833         _HEADER CR,2,"CR"
      009006 8F ED                    1         .word LINK 
                           000F88     2         LINK=.
      009008 02                       3         .byte 2  
      009009 43 52                    4         .ascii "CR"
      00900B                          5         CR:
      000F8B                       2834         _DOLIT  CRR 
      00900B CD 84 F0         [ 4]    1     CALL DOLIT 
      00900E 00 0D                    2     .word CRR 
      009010 CD 84 B7         [ 4] 2835         CALL    EMIT
      000F93                       2836         _DOLIT  LF
      009013 CD 84 F0         [ 4]    1     CALL DOLIT 
      009016 00 0A                    2     .word LF 
      009018 CC 84 B7         [ 2] 2837         JP      EMIT
                                   2838 
                                   2839 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2840 ;       do$     ( -- a )
                                   2841 ;       Return  address of a compiled
                                   2842 ;       string.
                                   2843 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2844 ;       _HEADER DOSTR,COMPO+3,"DO$"
      00901B                       2845 DOSTR:
      00901B CD 85 B5         [ 4] 2846         CALL     RFROM
      00901E CD 85 C6         [ 4] 2847         CALL     RAT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



      009021 CD 85 B5         [ 4] 2848         CALL     RFROM
      009024 CD 8D 47         [ 4] 2849         CALL     COUNT
      009027 CD 88 BD         [ 4] 2850         CALL     PLUS
      00902A CD 86 63         [ 4] 2851         CALL     TOR
      00902D CD 86 AA         [ 4] 2852         CALL     SWAPP
      009030 CD 86 63         [ 4] 2853         CALL     TOR
      009033 81               [ 4] 2854         RET
                                   2855 
                                   2856 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2857 ;       $"|     ( -- a )
                                   2858 ;       Run time routine compiled by $".
                                   2859 ;       Return address of a compiled string.
                                   2860 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2861 ;       _HEADER STRQP,COMPO+3,"$\"|"
      009034                       2862 STRQP:
      009034 CD 90 1B         [ 4] 2863         CALL     DOSTR
      009037 81               [ 4] 2864         RET
                                   2865 
                                   2866 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2867 ;       ."|     ( -- )
                                   2868 ;       Run time routine of ." .
                                   2869 ;       Output a compiled string.
                                   2870 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2871 ;       _HEADER DOTQP,COMPO+3,".\"|"
      009038                       2872 DOTQP:
      009038 CD 90 1B         [ 4] 2873         CALL     DOSTR
      00903B CD 8D 47         [ 4] 2874         CALL     COUNT
      00903E CC 8F F2         [ 2] 2875         JP     TYPES
                                   2876 
                                   2877 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2878 ;       .R      ( n +n -- )
                                   2879 ;       Display an integer in a field
                                   2880 ;       of n columns, right justified.
                                   2881 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000FC1                       2882         _HEADER DOTR,2,".R"
      009041 90 08                    1         .word LINK 
                           000FC3     2         LINK=.
      009043 02                       3         .byte 2  
      009044 2E 52                    4         .ascii ".R"
      009046                          5         DOTR:
      009046 CD 86 63         [ 4] 2883         CALL     TOR
      009049 CD 8F 09         [ 4] 2884         CALL     STR
      00904C CD 85 B5         [ 4] 2885         CALL     RFROM
      00904F CD 86 C2         [ 4] 2886         CALL     OVER
      009052 CD 89 53         [ 4] 2887         CALL     SUBB
      009055 CD 8F D7         [ 4] 2888         CALL     SPACS
      009058 CC 8F F2         [ 2] 2889         JP     TYPES
                                   2890 
                                   2891 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2892 ;       U.R     ( u +n -- )
                                   2893 ;       Display an unsigned integer
                                   2894 ;       in n column, right justified.
                                   2895 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000FDB                       2896         _HEADER UDOTR,3,"U.R"
      00905B 90 43                    1         .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



                           000FDD     2         LINK=.
      00905D 03                       3         .byte 3  
      00905E 55 2E 52                 4         .ascii "U.R"
      009061                          5         UDOTR:
      009061 CD 86 63         [ 4] 2897         CALL     TOR
      009064 CD 8E 8C         [ 4] 2898         CALL     BDIGS
      009067 CD 8E C6         [ 4] 2899         CALL     DIGS
      00906A CD 8E F1         [ 4] 2900         CALL     EDIGS
      00906D CD 85 B5         [ 4] 2901         CALL     RFROM
      009070 CD 86 C2         [ 4] 2902         CALL     OVER
      009073 CD 89 53         [ 4] 2903         CALL     SUBB
      009076 CD 8F D7         [ 4] 2904         CALL     SPACS
      009079 CC 8F F2         [ 2] 2905         JP     TYPES
                                   2906 
                                   2907 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2908 ;       U.      ( u -- )
                                   2909 ;       Display an unsigned integer
                                   2910 ;       in free format.
                                   2911 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000FFC                       2912         _HEADER UDOT,2,"U."
      00907C 90 5D                    1         .word LINK 
                           000FFE     2         LINK=.
      00907E 02                       3         .byte 2  
      00907F 55 2E                    4         .ascii "U."
      009081                          5         UDOT:
      009081 CD 8E 8C         [ 4] 2913         CALL     BDIGS
      009084 CD 8E C6         [ 4] 2914         CALL     DIGS
      009087 CD 8E F1         [ 4] 2915         CALL     EDIGS
      00908A CD 8F C8         [ 4] 2916         CALL     SPACE
      00908D CC 8F F2         [ 2] 2917         JP     TYPES
                                   2918 
                                   2919 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2920 ;   H. ( n -- )
                                   2921 ;   display n in hexadecimal 
                                   2922 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001010                       2923         _HEADER HDOT,2,"H."
      009090 90 7E                    1         .word LINK 
                           001012     2         LINK=.
      009092 02                       3         .byte 2  
      009093 48 2E                    4         .ascii "H."
      009095                          5         HDOT:
      009095 CD 87 60         [ 4] 2924         CALL BASE 
      009098 CD 85 64         [ 4] 2925         CALL AT 
      00909B CD 86 63         [ 4] 2926         CALL TOR 
      00909E CD 8F 27         [ 4] 2927         CALL HEX 
      0090A1 CD 90 81         [ 4] 2928         CALL UDOT 
      0090A4 CD 85 B5         [ 4] 2929         CALL RFROM 
      0090A7 CD 87 60         [ 4] 2930         CALL BASE 
      0090AA CC 85 52         [ 2] 2931         JP STORE 
                                   2932          
                                   2933 
                                   2934 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2935 ;       .       ( w -- )
                                   2936 ;       Display an integer in free
                                   2937 ;       format, preceeded by a space.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



                                   2938 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00102D                       2939         _HEADER DOT,1,"."
      0090AD 90 92                    1         .word LINK 
                           00102F     2         LINK=.
      0090AF 01                       3         .byte 1  
      0090B0 2E                       4         .ascii "."
      0090B1                          5         DOT:
      0090B1 CD 87 60         [ 4] 2940         CALL     BASE
      0090B4 CD 85 64         [ 4] 2941         CALL     AT
      0090B7 CD 84 F0         [ 4] 2942         CALL     DOLIT
      0090BA 00 0A                 2943         .word      10
      0090BC CD 87 20         [ 4] 2944         CALL     XORR    ;?decimal
      0090BF CD 85 19         [ 4] 2945         CALL     QBRAN
      0090C2 90 C6                 2946         .word      DOT1
      0090C4 20 BB            [ 2] 2947         JRA     UDOT
      0090C6 CD 8F 09         [ 4] 2948 DOT1:   CALL     STR
      0090C9 CD 8F C8         [ 4] 2949         CALL     SPACE
      0090CC CC 8F F2         [ 2] 2950         JP     TYPES
                                   2951 
                                   2952 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2953 ;       ?       ( a -- )
                                   2954 ;       Display contents in memory cell.
                                   2955 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00104F                       2956         _HEADER QUEST,1,"?"
      0090CF 90 AF                    1         .word LINK 
                           001051     2         LINK=.
      0090D1 01                       3         .byte 1  
      0090D2 3F                       4         .ascii "?"
      0090D3                          5         QUEST:
      0090D3 CD 85 64         [ 4] 2957         CALL     AT
      0090D6 20 D9            [ 2] 2958         JRA     DOT
                                   2959 
                                   2960 ;; Parsing
                                   2961 
                                   2962 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2963 ;       parse   ( b u c -- b u delta ; <string> )
                                   2964 ;       Scan string delimited by c.
                                   2965 ;       Return found string and its offset.
                                   2966 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001058                       2967         _HEADER PARS,5,"PARS$"
      0090D8 90 D1                    1         .word LINK 
                           00105A     2         LINK=.
      0090DA 05                       3         .byte 5  
      0090DB 50 41 52 53 24           4         .ascii "PARS$"
      0090E0                          5         PARS:
      0090E0 CD 87 6F         [ 4] 2968         CALL     TEMP
      0090E3 CD 85 52         [ 4] 2969         CALL     STORE
      0090E6 CD 86 C2         [ 4] 2970         CALL     OVER
      0090E9 CD 86 63         [ 4] 2971         CALL     TOR
      0090EC CD 86 9A         [ 4] 2972         CALL     DUPP
      0090EF CD 85 19         [ 4] 2973         CALL     QBRAN
      0090F2 91 98                 2974         .word    PARS8
      0090F4 CD 8C 25         [ 4] 2975         CALL     ONEM
      0090F7 CD 87 6F         [ 4] 2976         CALL     TEMP
      0090FA CD 85 64         [ 4] 2977         CALL     AT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



      0090FD CD 8C 77         [ 4] 2978         CALL     BLANK
      009100 CD 89 7B         [ 4] 2979         CALL     EQUAL
      009103 CD 85 19         [ 4] 2980         CALL     QBRAN
      009106 91 39                 2981         .word      PARS3
      009108 CD 86 63         [ 4] 2982         CALL     TOR
      00910B CD 8C 77         [ 4] 2983 PARS1:  CALL     BLANK
      00910E CD 86 C2         [ 4] 2984         CALL     OVER
      009111 CD 85 82         [ 4] 2985         CALL     CAT     ;skip leading blanks ONLY
      009114 CD 89 53         [ 4] 2986         CALL     SUBB
      009117 CD 86 D1         [ 4] 2987         CALL     ZLESS
      00911A CD 88 F6         [ 4] 2988         CALL     INVER
      00911D CD 85 19         [ 4] 2989         CALL     QBRAN
      009120 91 36                 2990         .word      PARS2
      009122 CD 8C 18         [ 4] 2991         CALL     ONEP
      009125 CD 85 04         [ 4] 2992         CALL     DONXT
      009128 91 0B                 2993         .word      PARS1
      00912A CD 85 B5         [ 4] 2994         CALL     RFROM
      00912D CD 86 90         [ 4] 2995         CALL     DROP
      009130 CD 8C 84         [ 4] 2996         CALL     ZERO
      009133 CC 86 9A         [ 2] 2997         JP     DUPP
      009136 CD 85 B5         [ 4] 2998 PARS2:  CALL     RFROM
      009139 CD 86 C2         [ 4] 2999 PARS3:  CALL     OVER
      00913C CD 86 AA         [ 4] 3000         CALL     SWAPP
      00913F CD 86 63         [ 4] 3001         CALL     TOR
      009142 CD 87 6F         [ 4] 3002 PARS4:  CALL     TEMP
      009145 CD 85 64         [ 4] 3003         CALL     AT
      009148 CD 86 C2         [ 4] 3004         CALL     OVER
      00914B CD 85 82         [ 4] 3005         CALL     CAT
      00914E CD 89 53         [ 4] 3006         CALL     SUBB    ;scan for delimiter
      009151 CD 87 6F         [ 4] 3007         CALL     TEMP
      009154 CD 85 64         [ 4] 3008         CALL     AT
      009157 CD 8C 77         [ 4] 3009         CALL     BLANK
      00915A CD 89 7B         [ 4] 3010         CALL     EQUAL
      00915D CD 85 19         [ 4] 3011         CALL     QBRAN
      009160 91 65                 3012         .word      PARS5
      009162 CD 86 D1         [ 4] 3013         CALL     ZLESS
      009165 CD 85 19         [ 4] 3014 PARS5:  CALL     QBRAN
      009168 91 7A                 3015         .word      PARS6
      00916A CD 8C 18         [ 4] 3016         CALL     ONEP
      00916D CD 85 04         [ 4] 3017         CALL     DONXT
      009170 91 42                 3018         .word      PARS4
      009172 CD 86 9A         [ 4] 3019         CALL     DUPP
      009175 CD 86 63         [ 4] 3020         CALL     TOR
      009178 20 0F            [ 2] 3021         JRA     PARS7
      00917A CD 85 B5         [ 4] 3022 PARS6:  CALL     RFROM
      00917D CD 86 90         [ 4] 3023         CALL     DROP
      009180 CD 86 9A         [ 4] 3024         CALL     DUPP
      009183 CD 8C 18         [ 4] 3025         CALL     ONEP
      009186 CD 86 63         [ 4] 3026         CALL     TOR
      009189 CD 86 C2         [ 4] 3027 PARS7:  CALL     OVER
      00918C CD 89 53         [ 4] 3028         CALL     SUBB
      00918F CD 85 B5         [ 4] 3029         CALL     RFROM
      009192 CD 85 B5         [ 4] 3030         CALL     RFROM
      009195 CC 89 53         [ 2] 3031         JP     SUBB
      009198 CD 86 C2         [ 4] 3032 PARS8:  CALL     OVER
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



      00919B CD 85 B5         [ 4] 3033         CALL     RFROM
      00919E CC 89 53         [ 2] 3034         JP     SUBB
                                   3035 
                                   3036 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3037 ;       PARSE   ( c -- b u ; <string> )
                                   3038 ;       Scan input stream and return
                                   3039 ;       counted string delimited by c.
                                   3040 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001121                       3041         _HEADER PARSE,5,"PARSE"
      0091A1 90 DA                    1         .word LINK 
                           001123     2         LINK=.
      0091A3 05                       3         .byte 5  
      0091A4 50 41 52 53 45           4         .ascii "PARSE"
      0091A9                          5         PARSE:
      0091A9 CD 86 63         [ 4] 3042         CALL     TOR
      0091AC CD 8D 80         [ 4] 3043         CALL     TIB
      0091AF CD 87 7E         [ 4] 3044         CALL     INN
      0091B2 CD 85 64         [ 4] 3045         CALL     AT
      0091B5 CD 88 BD         [ 4] 3046         CALL     PLUS    ;current input buffer pointer
      0091B8 CD 87 8E         [ 4] 3047         CALL     NTIB
      0091BB CD 85 64         [ 4] 3048         CALL     AT
      0091BE CD 87 7E         [ 4] 3049         CALL     INN
      0091C1 CD 85 64         [ 4] 3050         CALL     AT
      0091C4 CD 89 53         [ 4] 3051         CALL     SUBB    ;remaining count
      0091C7 CD 85 B5         [ 4] 3052         CALL     RFROM
      0091CA CD 90 E0         [ 4] 3053         CALL     PARS
      0091CD CD 87 7E         [ 4] 3054         CALL     INN
      0091D0 CC 8C F4         [ 2] 3055         JP     PSTOR
                                   3056 
                                   3057 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3058 ;       .(      ( -- )
                                   3059 ;       Output following string up to next ) .
                                   3060 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001153                       3061         _HEADER DOTPR,IMEDD+2,".("
      0091D3 91 A3                    1         .word LINK 
                           001155     2         LINK=.
      0091D5 82                       3         .byte IMEDD+2  
      0091D6 2E 28                    4         .ascii ".("
      0091D8                          5         DOTPR:
      0091D8 CD 84 F0         [ 4] 3062         CALL     DOLIT
      0091DB 00 29                 3063         .word     41	; ")"
      0091DD CD 91 A9         [ 4] 3064         CALL     PARSE
      0091E0 CC 8F F2         [ 2] 3065         JP     TYPES
                                   3066 
                                   3067 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3068 ;       (       ( -- )
                                   3069 ;       Ignore following string up to next ).
                                   3070 ;       A comment.
                                   3071 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001163                       3072         _HEADER PAREN,IMEDD+1,"("
      0091E3 91 D5                    1         .word LINK 
                           001165     2         LINK=.
      0091E5 81                       3         .byte IMEDD+1  
      0091E6 28                       4         .ascii "("
      0091E7                          5         PAREN:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



      0091E7 CD 84 F0         [ 4] 3073         CALL     DOLIT
      0091EA 00 29                 3074         .word     41	; ")"
      0091EC CD 91 A9         [ 4] 3075         CALL     PARSE
      0091EF CC 88 9D         [ 2] 3076         JP     DDROP
                                   3077 
                                   3078 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3079 ;       \       ( -- )
                                   3080 ;       Ignore following text till
                                   3081 ;       end of line.
                                   3082 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001172                       3083         _HEADER BKSLA,IMEDD+1,"\\"
      0091F2 91 E5                    1         .word LINK 
                           001174     2         LINK=.
      0091F4 81                       3         .byte IMEDD+1  
      0091F5 5C 5C                    4         .ascii "\\"
      0091F7                          5         BKSLA:
      0091F7 90 AE 00 0E      [ 2] 3084         ldw y,#UCTIB ; #TIB  
      0091FB 90 FE            [ 2] 3085         ldw y,(y)
      0091FD 90 89            [ 2] 3086         pushw y ; count in TIB 
      0091FF 90 AE 00 0C      [ 2] 3087         ldw y,#UINN ; >IN 
      009203 90 BF 26         [ 2] 3088         ldw YTEMP,y
      009206 90 85            [ 2] 3089         popw y 
      009208 91 CF 26         [ 5] 3090         ldw [YTEMP],y
      00920B 81               [ 4] 3091         ret 
                                   3092 
                                   3093 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3094 ;       WORD    ( c -- a ; <string> )
                                   3095 ;       Parse a word from input stream
                                   3096 ;       and copy it to code dictionary.
                                   3097 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00118C                       3098         _HEADER WORDD,4,"WORD"
      00920C 91 F4                    1         .word LINK 
                           00118E     2         LINK=.
      00920E 04                       3         .byte 4  
      00920F 57 4F 52 44              4         .ascii "WORD"
      009213                          5         WORDD:
      009213 CD 91 A9         [ 4] 3099         CALL     PARSE
      009216 CD 8D 5E         [ 4] 3100         CALL     HERE
      009219 CD 8B ED         [ 4] 3101         CALL     CELLP
                           000000  3102 .IF CASE_SENSE 
                                   3103         JP      PACKS 
                           000001  3104 .ELSE                 
      00921C CD 8E 2F         [ 4] 3105         CALL     PACKS
                                   3106 ; uppercase TOKEN 
      00921F CD 86 9A         [ 4] 3107         CALL    DUPP 
      009222 CD 8D 47         [ 4] 3108         CALL    COUNT 
      009225 CD 86 63         [ 4] 3109         CALL    TOR 
      009228 CD 85 35         [ 4] 3110         CALL    BRAN 
      00922B 92 59                 3111         .word   UPPER2  
      00922D                       3112 UPPER:
      00922D CD 86 9A         [ 4] 3113         CALL    DUPP 
      009230 CD 85 82         [ 4] 3114         CALL    CAT
      009233 CD 86 9A         [ 4] 3115         CALL    DUPP 
      009236 CD 84 F0         [ 4] 3116         CALL   DOLIT
      009239 00 61                 3117         .word   'a' 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



      00923B CD 84 F0         [ 4] 3118         CALL    DOLIT
      00923E 00 7B                 3119         .word   'z'+1 
      009240 CD 8A 17         [ 4] 3120         CALL   WITHI 
      009243 CD 85 19         [ 4] 3121         CALL   QBRAN
      009246 92 50                 3122         .word  UPPER1  
      009248 CD 84 F0         [ 4] 3123         CALL    DOLIT 
      00924B 00 DF                 3124         .word   0xDF 
      00924D CD 86 F7         [ 4] 3125         CALL    ANDD 
      009250                       3126 UPPER1:
      009250 CD 86 C2         [ 4] 3127         CALL    OVER 
      009253 CD 85 71         [ 4] 3128         CALL    CSTOR          
      009256 CD 8C 18         [ 4] 3129         CALL    ONEP 
      009259                       3130 UPPER2: 
      009259 CD 85 04         [ 4] 3131         CALL    DONXT
      00925C 92 2D                 3132         .word   UPPER  
      00925E CD 86 90         [ 4] 3133         CALL    DROP  
      009261 81               [ 4] 3134         RET 
                                   3135 .ENDIF 
                                   3136 
                                   3137 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3138 ;       TOKEN   ( -- a ; <string> )
                                   3139 ;       Parse a word from input stream
                                   3140 ;       and copy it to name dictionary.
                                   3141 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0011E2                       3142         _HEADER TOKEN,5,"TOKEN"
      009262 92 0E                    1         .word LINK 
                           0011E4     2         LINK=.
      009264 05                       3         .byte 5  
      009265 54 4F 4B 45 4E           4         .ascii "TOKEN"
      00926A                          5         TOKEN:
      00926A CD 8C 77         [ 4] 3143         CALL     BLANK
      00926D CC 92 13         [ 2] 3144         JP     WORDD
                                   3145 
                                   3146 ;; Dictionary search
                                   3147 
                                   3148 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3149 ;       NAME>   ( na -- ca )
                                   3150 ;       Return a code address given
                                   3151 ;       a name address.
                                   3152 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0011F0                       3153         _HEADER NAMET,5,"NAME>"
      009270 92 64                    1         .word LINK 
                           0011F2     2         LINK=.
      009272 05                       3         .byte 5  
      009273 4E 41 4D 45 3E           4         .ascii "NAME>"
      009278                          5         NAMET:
      009278 CD 8D 47         [ 4] 3154         CALL     COUNT
      00927B CD 84 F0         [ 4] 3155         CALL     DOLIT
      00927E 00 1F                 3156         .word      31
      009280 CD 86 F7         [ 4] 3157         CALL     ANDD
      009283 CC 88 BD         [ 2] 3158         JP     PLUS
                                   3159 
                                   3160 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3161 ;       SAME?   ( a a u -- a a f \ -0+ )
                                   3162 ;       Compare u cells in two
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



                                   3163 ;       strings. Return 0 if identical.
                                   3164 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001206                       3165         _HEADER SAMEQ,5,"SAME?"
      009286 92 72                    1         .word LINK 
                           001208     2         LINK=.
      009288 05                       3         .byte 5  
      009289 53 41 4D 45 3F           4         .ascii "SAME?"
      00928E                          5         SAMEQ:
      00928E CD 8C 25         [ 4] 3166         CALL     ONEM
      009291 CD 86 63         [ 4] 3167         CALL     TOR
      009294 20 29            [ 2] 3168         JRA     SAME2
      009296 CD 86 C2         [ 4] 3169 SAME1:  CALL     OVER
      009299 CD 85 C6         [ 4] 3170         CALL     RAT
      00929C CD 88 BD         [ 4] 3171         CALL     PLUS
      00929F CD 85 82         [ 4] 3172         CALL     CAT
      0092A2 CD 86 C2         [ 4] 3173         CALL     OVER
      0092A5 CD 85 C6         [ 4] 3174         CALL     RAT
      0092A8 CD 88 BD         [ 4] 3175         CALL     PLUS
      0092AB CD 85 82         [ 4] 3176         CALL     CAT
      0092AE CD 89 53         [ 4] 3177         CALL     SUBB
      0092B1 CD 88 4D         [ 4] 3178         CALL     QDUP
      0092B4 CD 85 19         [ 4] 3179         CALL     QBRAN
      0092B7 92 BF                 3180         .word      SAME2
      0092B9 CD 85 B5         [ 4] 3181         CALL     RFROM
      0092BC CC 86 90         [ 2] 3182         JP     DROP
      0092BF CD 85 04         [ 4] 3183 SAME2:  CALL     DONXT
      0092C2 92 96                 3184         .word      SAME1
      0092C4 CC 8C 84         [ 2] 3185         JP     ZERO
                                   3186 
                                   3187 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3188 ;       find    ( a va -- ca na | a F )
                                   3189 ;       Search vocabulary for string.
                                   3190 ;       Return ca and na if succeeded.
                                   3191 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001247                       3192         _HEADER FIND,4,"FIND"
      0092C7 92 88                    1         .word LINK 
                           001249     2         LINK=.
      0092C9 04                       3         .byte 4  
      0092CA 46 49 4E 44              4         .ascii "FIND"
      0092CE                          5         FIND:
      0092CE CD 86 AA         [ 4] 3193         CALL     SWAPP
      0092D1 CD 86 9A         [ 4] 3194         CALL     DUPP
      0092D4 CD 85 82         [ 4] 3195         CALL     CAT
      0092D7 CD 87 6F         [ 4] 3196         CALL     TEMP
      0092DA CD 85 52         [ 4] 3197         CALL     STORE
      0092DD CD 86 9A         [ 4] 3198         CALL     DUPP
      0092E0 CD 85 64         [ 4] 3199         CALL     AT
      0092E3 CD 86 63         [ 4] 3200         CALL     TOR
      0092E6 CD 8B ED         [ 4] 3201         CALL     CELLP
      0092E9 CD 86 AA         [ 4] 3202         CALL     SWAPP
      0092EC CD 85 64         [ 4] 3203 FIND1:  CALL     AT
      0092EF CD 86 9A         [ 4] 3204         CALL     DUPP
      0092F2 CD 85 19         [ 4] 3205         CALL     QBRAN
      0092F5 93 2B                 3206         .word      FIND6
      0092F7 CD 86 9A         [ 4] 3207         CALL     DUPP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



      0092FA CD 85 64         [ 4] 3208         CALL     AT
      0092FD CD 84 F0         [ 4] 3209         CALL     DOLIT
      009300 1F 7F                 3210         .word      MASKK
      009302 CD 86 F7         [ 4] 3211         CALL     ANDD
      009305 CD 85 C6         [ 4] 3212         CALL     RAT
      009308 CD 87 20         [ 4] 3213         CALL     XORR
      00930B CD 85 19         [ 4] 3214         CALL     QBRAN
      00930E 93 1A                 3215         .word      FIND2
      009310 CD 8B ED         [ 4] 3216         CALL     CELLP
      009313 CD 84 F0         [ 4] 3217         CALL     DOLIT
      009316 FF FF                 3218         .word     0xFFFF
      009318 20 0C            [ 2] 3219         JRA     FIND3
      00931A CD 8B ED         [ 4] 3220 FIND2:  CALL     CELLP
      00931D CD 87 6F         [ 4] 3221         CALL     TEMP
      009320 CD 85 64         [ 4] 3222         CALL     AT
      009323 CD 92 8E         [ 4] 3223         CALL     SAMEQ
      009326 CD 85 35         [ 4] 3224 FIND3:  CALL     BRAN
      009329 93 3A                 3225         .word      FIND4
      00932B CD 85 B5         [ 4] 3226 FIND6:  CALL     RFROM
      00932E CD 86 90         [ 4] 3227         CALL     DROP
      009331 CD 86 AA         [ 4] 3228         CALL     SWAPP
      009334 CD 8B FC         [ 4] 3229         CALL     CELLM
      009337 CC 86 AA         [ 2] 3230         JP     SWAPP
      00933A CD 85 19         [ 4] 3231 FIND4:  CALL     QBRAN
      00933D 93 47                 3232         .word      FIND5
      00933F CD 8B FC         [ 4] 3233         CALL     CELLM
      009342 CD 8B FC         [ 4] 3234         CALL     CELLM
      009345 20 A5            [ 2] 3235         JRA     FIND1
      009347 CD 85 B5         [ 4] 3236 FIND5:  CALL     RFROM
      00934A CD 86 90         [ 4] 3237         CALL     DROP
      00934D CD 86 AA         [ 4] 3238         CALL     SWAPP
      009350 CD 86 90         [ 4] 3239         CALL     DROP
      009353 CD 8B FC         [ 4] 3240         CALL     CELLM
      009356 CD 86 9A         [ 4] 3241         CALL     DUPP
      009359 CD 92 78         [ 4] 3242         CALL     NAMET
      00935C CC 86 AA         [ 2] 3243         JP     SWAPP
                                   3244 
                                   3245 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3246 ;       NAME?   ( a -- ca na | a F )
                                   3247 ;       Search vocabularies for a string.
                                   3248 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0012DF                       3249         _HEADER NAMEQ,5,"NAME?"
      00935F 92 C9                    1         .word LINK 
                           0012E1     2         LINK=.
      009361 05                       3         .byte 5  
      009362 4E 41 4D 45 3F           4         .ascii "NAME?"
      009367                          5         NAMEQ:
      009367 CD 87 E3         [ 4] 3250         CALL   CNTXT
      00936A CC 92 CE         [ 2] 3251         JP     FIND
                                   3252 
                                   3253 ;; Terminal response
                                   3254 
                                   3255 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3256 ;       ^H      ( bot eot cur -- bot eot cur )
                                   3257 ;       Backup cursor by one character.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



                                   3258 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0012ED                       3259         _HEADER BKSP,2,"^H"
      00936D 93 61                    1         .word LINK 
                           0012EF     2         LINK=.
      00936F 02                       3         .byte 2  
      009370 5E 48                    4         .ascii "^H"
      009372                          5         BKSP:
      009372 CD 86 63         [ 4] 3260         CALL     TOR
      009375 CD 86 C2         [ 4] 3261         CALL     OVER
      009378 CD 85 B5         [ 4] 3262         CALL     RFROM
      00937B CD 86 AA         [ 4] 3263         CALL     SWAPP
      00937E CD 86 C2         [ 4] 3264         CALL     OVER
      009381 CD 87 20         [ 4] 3265         CALL     XORR
      009384 CD 85 19         [ 4] 3266         CALL     QBRAN
      009387 93 A2                 3267         .word      BACK1
      009389 CD 84 F0         [ 4] 3268         CALL     DOLIT
      00938C 00 08                 3269         .word      BKSPP
      00938E CD 84 B7         [ 4] 3270         CALL     EMIT
      009391 CD 8C 25         [ 4] 3271         CALL     ONEM
      009394 CD 8C 77         [ 4] 3272         CALL     BLANK
      009397 CD 84 B7         [ 4] 3273         CALL     EMIT
      00939A CD 84 F0         [ 4] 3274         CALL     DOLIT
      00939D 00 08                 3275         .word      BKSPP
      00939F CC 84 B7         [ 2] 3276         JP     EMIT
      0093A2 81               [ 4] 3277 BACK1:  RET
                                   3278 
                                   3279 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3280 ;       TAP    ( bot eot cur c -- bot eot cur )
                                   3281 ;       Accept and echo key stroke
                                   3282 ;       and bump cursor.
                                   3283 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001323                       3284         _HEADER TAP,3,"TAP"
      0093A3 93 6F                    1         .word LINK 
                           001325     2         LINK=.
      0093A5 03                       3         .byte 3  
      0093A6 54 41 50                 4         .ascii "TAP"
      0093A9                          5         TAP:
      0093A9 CD 86 9A         [ 4] 3285         CALL     DUPP
      0093AC CD 84 B7         [ 4] 3286         CALL     EMIT
      0093AF CD 86 C2         [ 4] 3287         CALL     OVER
      0093B2 CD 85 71         [ 4] 3288         CALL     CSTOR
      0093B5 CC 8C 18         [ 2] 3289         JP     ONEP
                                   3290 
                                   3291 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3292 ;       kTAP    ( bot eot cur c -- bot eot cur )
                                   3293 ;       Process a key stroke,
                                   3294 ;       CR,LF or backspace.
                                   3295 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001338                       3296         _HEADER KTAP,4,"KTAP"
      0093B8 93 A5                    1         .word LINK 
                           00133A     2         LINK=.
      0093BA 04                       3         .byte 4  
      0093BB 4B 54 41 50              4         .ascii "KTAP"
      0093BF                          5         KTAP:
      0093BF CD 86 9A         [ 4] 3297         CALL     DUPP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



      0093C2 CD 84 F0         [ 4] 3298         CALL     DOLIT
                           000001  3299 .if EOL_CR
      0093C5 00 0D                 3300         .word   CRR
                           000000  3301 .else ; EOL_LF 
                                   3302         .word   LF
                                   3303 .endif 
      0093C7 CD 87 20         [ 4] 3304         CALL     XORR
      0093CA CD 85 19         [ 4] 3305         CALL     QBRAN
      0093CD 93 E5                 3306         .word      KTAP2
      0093CF CD 84 F0         [ 4] 3307         CALL     DOLIT
      0093D2 00 08                 3308         .word      BKSPP
      0093D4 CD 87 20         [ 4] 3309         CALL     XORR
      0093D7 CD 85 19         [ 4] 3310         CALL     QBRAN
      0093DA 93 E2                 3311         .word      KTAP1
      0093DC CD 8C 77         [ 4] 3312         CALL     BLANK
      0093DF CC 93 A9         [ 2] 3313         JP     TAP
      0093E2 CC 93 72         [ 2] 3314 KTAP1:  JP     BKSP
      0093E5 CD 86 90         [ 4] 3315 KTAP2:  CALL     DROP
      0093E8 CD 86 AA         [ 4] 3316         CALL     SWAPP
      0093EB CD 86 90         [ 4] 3317         CALL     DROP
      0093EE CC 86 9A         [ 2] 3318         JP     DUPP
                                   3319 
                                   3320 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3321 ;       accept  ( b u -- b u )
                                   3322 ;       Accept characters to input
                                   3323 ;       buffer. Return with actual count.
                                   3324 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001371                       3325         _HEADER ACCEP,6,"ACCEPT"
      0093F1 93 BA                    1         .word LINK 
                           001373     2         LINK=.
      0093F3 06                       3         .byte 6  
      0093F4 41 43 43 45 50 54        4         .ascii "ACCEPT"
      0093FA                          5         ACCEP:
      0093FA CD 86 C2         [ 4] 3326         CALL     OVER
      0093FD CD 88 BD         [ 4] 3327         CALL     PLUS
      009400 CD 86 C2         [ 4] 3328         CALL     OVER
      009403 CD 88 A8         [ 4] 3329 ACCP1:  CALL     DDUP
      009406 CD 87 20         [ 4] 3330         CALL     XORR
      009409 CD 85 19         [ 4] 3331         CALL     QBRAN
      00940C 94 2E                 3332         .word      ACCP4
      00940E CD 8F 90         [ 4] 3333         CALL     KEY
      009411 CD 86 9A         [ 4] 3334         CALL     DUPP
      009414 CD 8C 77         [ 4] 3335         CALL     BLANK
      009417 CD 84 F0         [ 4] 3336         CALL     DOLIT
      00941A 00 7F                 3337         .word      127
      00941C CD 8A 17         [ 4] 3338         CALL     WITHI
      00941F CD 85 19         [ 4] 3339         CALL     QBRAN
      009422 94 29                 3340         .word      ACCP2
      009424 CD 93 A9         [ 4] 3341         CALL     TAP
      009427 20 03            [ 2] 3342         JRA     ACCP3
      009429 CD 93 BF         [ 4] 3343 ACCP2:  CALL     KTAP
      00942C 20 D5            [ 2] 3344 ACCP3:  JRA     ACCP1
      00942E CD 86 90         [ 4] 3345 ACCP4:  CALL     DROP
      009431 CD 86 C2         [ 4] 3346         CALL     OVER
      009434 CC 89 53         [ 2] 3347         JP     SUBB
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



                                   3348 
                                   3349 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3350 ;       QUERY   ( -- )
                                   3351 ;       Accept input stream to
                                   3352 ;       terminal input buffer.
                                   3353 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0013B7                       3354         _HEADER QUERY,5,"QUERY"
      009437 93 F3                    1         .word LINK 
                           0013B9     2         LINK=.
      009439 05                       3         .byte 5  
      00943A 51 55 45 52 59           4         .ascii "QUERY"
      00943F                          5         QUERY:
      00943F CD 8D 80         [ 4] 3355         CALL     TIB
      009442 CD 84 F0         [ 4] 3356         CALL     DOLIT
      009445 00 50                 3357         .word      80
      009447 CD 93 FA         [ 4] 3358         CALL     ACCEP
      00944A CD 87 8E         [ 4] 3359         CALL     NTIB
      00944D CD 85 52         [ 4] 3360         CALL     STORE
      009450 CD 86 90         [ 4] 3361         CALL     DROP
      009453 CD 8C 84         [ 4] 3362         CALL     ZERO
      009456 CD 87 7E         [ 4] 3363         CALL     INN
      009459 CC 85 52         [ 2] 3364         JP     STORE
                                   3365 
                                   3366 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3367 ;       ABORT   ( -- )
                                   3368 ;       Reset data stack and
                                   3369 ;       jump to QUIT.
                                   3370 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0013DC                       3371         _HEADER ABORT,5,"ABORT"
      00945C 94 39                    1         .word LINK 
                           0013DE     2         LINK=.
      00945E 05                       3         .byte 5  
      00945F 41 42 4F 52 54           4         .ascii "ABORT"
      009464                          5         ABORT:
      009464 CD 95 58         [ 4] 3372         CALL     PRESE
      009467 CC 95 75         [ 2] 3373         JP     QUIT
                                   3374 
                                   3375 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3376 ;       abort"  ( f -- )
                                   3377 ;       Run time routine of ABORT".
                                   3378 ;       Abort with a message.
                                   3379 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0013EA                       3380         _HEADER ABORQ,COMPO+6,'ABORT"'
      00946A 94 5E                    1         .word LINK 
                           0013EC     2         LINK=.
      00946C 46                       3         .byte COMPO+6  
      00946D 41 42 4F 52 54 22        4         .ascii 'ABORT"'
      009473                          5         ABORQ:
      009473 CD 85 19         [ 4] 3381         CALL     QBRAN
      009476 94 92                 3382         .word      ABOR2   ;text flag
      009478 CD 90 1B         [ 4] 3383         CALL     DOSTR
      00947B CD 8F C8         [ 4] 3384 ABOR1:  CALL     SPACE
      00947E CD 8D 47         [ 4] 3385         CALL     COUNT
      009481 CD 8F F2         [ 4] 3386         CALL     TYPES
      009484 CD 84 F0         [ 4] 3387         CALL     DOLIT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



      009487 00 3F                 3388         .word     63 ; "?"
      009489 CD 84 B7         [ 4] 3389         CALL     EMIT
      00948C CD 90 0B         [ 4] 3390         CALL     CR
      00948F CC 94 64         [ 2] 3391         JP     ABORT   ;pass error string
      009492 CD 90 1B         [ 4] 3392 ABOR2:  CALL     DOSTR
      009495 CC 86 90         [ 2] 3393         JP     DROP
                                   3394 
                                   3395 ;; The text interpreter
                                   3396 
                                   3397 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3398 ;       $INTERPRET      ( a -- )
                                   3399 ;       Interpret a word. If failed,
                                   3400 ;       try to convert it to an integer.
                                   3401 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001418                       3402         _HEADER INTER,10,"$INTERPRET"
      009498 94 6C                    1         .word LINK 
                           00141A     2         LINK=.
      00949A 0A                       3         .byte 10  
      00949B 24 49 4E 54 45 52 50     4         .ascii "$INTERPRET"
             52 45 54
      0094A5                          5         INTER:
      0094A5 CD 93 67         [ 4] 3403         CALL     NAMEQ
      0094A8 CD 88 4D         [ 4] 3404         CALL     QDUP    ;?defined
      0094AB CD 85 19         [ 4] 3405         CALL     QBRAN
      0094AE 94 CF                 3406         .word      INTE1
      0094B0 CD 85 64         [ 4] 3407         CALL     AT
      0094B3 CD 84 F0         [ 4] 3408         CALL     DOLIT
      0094B6 40 00                 3409 	.word       0x4000	; COMPO*256
      0094B8 CD 86 F7         [ 4] 3410         CALL     ANDD    ;?compile only lexicon bits
      0094BB CD 94 73         [ 4] 3411         CALL     ABORQ
      0094BE 0D                    3412         .byte      13
      0094BF 20 63 6F 6D 70 69 6C  3413         .ascii     " compile only"
             65 20 6F 6E 6C 79
      0094CC CC 85 45         [ 2] 3414         JP      EXECU
      0094CF                       3415 INTE1:  
      0094CF CD A6 5D         [ 4] 3416         CALL     NUMBQ   ;convert a number
      0094D2 CD 85 19         [ 4] 3417         CALL     QBRAN
      0094D5 94 7B                 3418         .word    ABOR1
      0094D7 81               [ 4] 3419         RET
                                   3420 
                                   3421 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3422 ;       [       ( -- )
                                   3423 ;       Start  text interpreter.
                                   3424 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001458                       3425         _HEADER LBRAC,IMEDD+1,"["
      0094D8 94 9A                    1         .word LINK 
                           00145A     2         LINK=.
      0094DA 81                       3         .byte IMEDD+1  
      0094DB 5B                       4         .ascii "["
      0094DC                          5         LBRAC:
      0094DC CD 84 F0         [ 4] 3426         CALL   DOLIT
      0094DF 94 A5                 3427         .word  INTER
      0094E1 CD 87 C1         [ 4] 3428         CALL   TEVAL
      0094E4 CC 85 52         [ 2] 3429         JP     STORE
                                   3430 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



                                   3431 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3432 ;       .OK     ( -- )
                                   3433 ;       Display 'ok' while interpreting.
                                   3434 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001467                       3435         _HEADER DOTOK,3,".OK"
      0094E7 94 DA                    1         .word LINK 
                           001469     2         LINK=.
      0094E9 03                       3         .byte 3  
      0094EA 2E 4F 4B                 4         .ascii ".OK"
      0094ED                          5         DOTOK:
      0094ED CD 84 F0         [ 4] 3436         CALL     DOLIT
      0094F0 94 A5                 3437         .word      INTER
      0094F2 CD 87 C1         [ 4] 3438         CALL     TEVAL
      0094F5 CD 85 64         [ 4] 3439         CALL     AT
      0094F8 CD 89 7B         [ 4] 3440         CALL     EQUAL
      0094FB CD 85 19         [ 4] 3441         CALL     QBRAN
      0094FE 95 07                 3442         .word      DOTO1
      009500 CD 90 38         [ 4] 3443         CALL     DOTQP
      009503 03                    3444         .byte      3
      009504 20 6F 6B              3445         .ascii     " ok"
      009507 CC 90 0B         [ 2] 3446 DOTO1:  JP     CR
                                   3447 
                                   3448 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3449 ;       ?STACK  ( -- )
                                   3450 ;       Abort if stack underflows.
                                   3451 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00148A                       3452         _HEADER QSTAC,6,"?STACK"
      00950A 94 E9                    1         .word LINK 
                           00148C     2         LINK=.
      00950C 06                       3         .byte 6  
      00950D 3F 53 54 41 43 4B        4         .ascii "?STACK"
      009513                          5         QSTAC:
      009513 CD 8C C6         [ 4] 3453         CALL     DEPTH
      009516 CD 86 D1         [ 4] 3454         CALL     ZLESS   ;check only for underflow
      009519 CD 94 73         [ 4] 3455         CALL     ABORQ
      00951C 0B                    3456         .byte      11
      00951D 20 75 6E 64 65 72 66  3457         .ascii     " underflow "
             6C 6F 77 20
      009528 81               [ 4] 3458         RET
                                   3459 
                                   3460 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3461 ;       EVAL    ( -- )
                                   3462 ;       Interpret  input stream.
                                   3463 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0014A9                       3464         _HEADER EVAL,4,"EVAL"
      009529 95 0C                    1         .word LINK 
                           0014AB     2         LINK=.
      00952B 04                       3         .byte 4  
      00952C 45 56 41 4C              4         .ascii "EVAL"
      009530                          5         EVAL:
      009530 CD 92 6A         [ 4] 3465 EVAL1:  CALL     TOKEN
      009533 CD 86 9A         [ 4] 3466         CALL     DUPP
      009536 CD 85 82         [ 4] 3467         CALL     CAT     ;?input stream empty
      009539 CD 85 19         [ 4] 3468         CALL     QBRAN
      00953C 95 49                 3469         .word    EVAL2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



      00953E CD 87 C1         [ 4] 3470         CALL     TEVAL
      009541 CD 8D 94         [ 4] 3471         CALL     ATEXE
      009544 CD 95 13         [ 4] 3472         CALL     QSTAC   ;evaluate input, check stack
      009547 20 E7            [ 2] 3473         JRA     EVAL1 
      009549 CD 86 90         [ 4] 3474 EVAL2:  CALL     DROP
      00954C CC 94 ED         [ 2] 3475         JP       DOTOK
                                   3476 
                                   3477 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3478 ;       PRESET  ( -- )
                                   3479 ;       Reset data stack pointer and
                                   3480 ;       terminal input buffer.
                                   3481 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0014CF                       3482         _HEADER PRESE,6,"PRESET"
      00954F 95 2B                    1         .word LINK 
                           0014D1     2         LINK=.
      009551 06                       3         .byte 6  
      009552 50 52 45 53 45 54        4         .ascii "PRESET"
      009558                          5         PRESE:
      009558 CD 84 F0         [ 4] 3483         CALL     DOLIT
      00955B 16 80                 3484         .word      SPP
      00955D CD 86 87         [ 4] 3485         CALL     SPSTO
      009560 CD 84 F0         [ 4] 3486         CALL     DOLIT
      009563 17 00                 3487         .word      TIBB
      009565 CD 87 8E         [ 4] 3488         CALL     NTIB
      009568 CD 8B ED         [ 4] 3489         CALL     CELLP
      00956B CC 85 52         [ 2] 3490         JP     STORE
                                   3491 
                                   3492 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3493 ;       QUIT    ( -- )
                                   3494 ;       Reset return stack pointer
                                   3495 ;       and start text interpreter.
                                   3496 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0014EE                       3497         _HEADER QUIT,4,"QUIT"
      00956E 95 51                    1         .word LINK 
                           0014F0     2         LINK=.
      009570 04                       3         .byte 4  
      009571 51 55 49 54              4         .ascii "QUIT"
      009575                          5         QUIT:
      009575 CD 84 F0         [ 4] 3498         CALL     DOLIT
      009578 17 FF                 3499         .word      RPP
      00957A CD 85 9F         [ 4] 3500         CALL     RPSTO   ;reset return stack pointer
      00957D CD 94 DC         [ 4] 3501 QUIT1:  CALL     LBRAC   ;start interpretation
      009580 CD 94 3F         [ 4] 3502 QUIT2:  CALL     QUERY   ;get input
      009583 CD 95 30         [ 4] 3503         CALL     EVAL
      009586 20 F8            [ 2] 3504         JRA     QUIT2   ;continue till error
                                   3505 
                                   3506 ;; The compiler
                                   3507 
                                   3508 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3509 ;       '       ( -- ca )
                                   3510 ;       Search vocabularies for
                                   3511 ;       next word in input stream.
                                   3512 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001508                       3513         _HEADER TICK,1,"'"
      009588 95 70                    1         .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



                           00150A     2         LINK=.
      00958A 01                       3         .byte 1  
      00958B 27                       4         .ascii "'"
      00958C                          5         TICK:
      00958C CD 92 6A         [ 4] 3514         CALL     TOKEN
      00958F CD 93 67         [ 4] 3515         CALL     NAMEQ   ;?defined
      009592 CD 85 19         [ 4] 3516         CALL     QBRAN
      009595 94 7B                 3517         .word      ABOR1
      009597 81               [ 4] 3518         RET     ;yes, push code address
                                   3519 
                                   3520 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3521 ;       ALLOT   ( n -- )
                                   3522 ;       Allocate n bytes to RAM 
                                   3523 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001518                       3524         _HEADER ALLOT,5,"ALLOT"
      009598 95 8A                    1         .word LINK 
                           00151A     2         LINK=.
      00959A 05                       3         .byte 5  
      00959B 41 4C 4C 4F 54           4         .ascii "ALLOT"
      0095A0                          5         ALLOT:
      0095A0 CD 87 F1         [ 4] 3525         CALL     VPP
                                   3526 ; must update APP_VP each time VP is modidied
      0095A3 CD 8C F4         [ 4] 3527         call PSTOR 
      0095A6 CC 9D A9         [ 2] 3528         jp UPDATVP 
                                   3529 
                                   3530 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3531 ;       ,       ( w -- )
                                   3532 ;         Compile an integer into
                                   3533 ;         variable space.
                                   3534 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001529                       3535         _HEADER COMMA,1,^/"\,"/
      0095A9 95 9A                    1         .word LINK 
                           00152B     2         LINK=.
      0095AB 01                       3         .byte 1  
      0095AC 5C 2C                    4         .ascii "\,"
      0095AE                          5         COMMA:
      0095AE CD 8D 5E         [ 4] 3536         CALL     HERE
      0095B1 CD 86 9A         [ 4] 3537         CALL     DUPP
      0095B4 CD 8B ED         [ 4] 3538         CALL     CELLP   ;cell boundary
      0095B7 CD 87 F1         [ 4] 3539         CALL     VPP
      0095BA CD 85 52         [ 4] 3540         CALL     STORE
      0095BD CC 85 52         [ 2] 3541         JP     STORE
                                   3542 
                                   3543 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3544 ;       C,      ( c -- )
                                   3545 ;       Compile a byte into
                                   3546 ;       variables space.
                                   3547 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001540                       3548         _HEADER CCOMMA,2,^/"C,"/
      0095C0 95 AB                    1         .word LINK 
                           001542     2         LINK=.
      0095C2 02                       3         .byte 2  
      0095C3 43 2C                    4         .ascii "C,"
      0095C5                          5         CCOMMA:
      0095C5 CD 8D 5E         [ 4] 3549         CALL     HERE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



      0095C8 CD 86 9A         [ 4] 3550         CALL     DUPP
      0095CB CD 8C 18         [ 4] 3551         CALL     ONEP
      0095CE CD 87 F1         [ 4] 3552         CALL     VPP
      0095D1 CD 85 52         [ 4] 3553         CALL     STORE
      0095D4 CC 85 71         [ 2] 3554         JP     CSTOR
                                   3555 
                                   3556 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3557 ;       [COMPILE]       ( -- ; <string> )
                                   3558 ;       Compile next immediate
                                   3559 ;       word into code dictionary.
                                   3560 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001557                       3561         _HEADER BCOMP,IMEDD+9,"[COMPILE]"
      0095D7 95 C2                    1         .word LINK 
                           001559     2         LINK=.
      0095D9 89                       3         .byte IMEDD+9  
      0095DA 5B 43 4F 4D 50 49 4C     4         .ascii "[COMPILE]"
             45 5D
      0095E3                          5         BCOMP:
      0095E3 CD 95 8C         [ 4] 3562         CALL     TICK
      0095E6 CC 98 C4         [ 2] 3563         JP     JSRC
                                   3564 
                                   3565 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3566 ;       COMPILE ( -- )
                                   3567 ;       Compile next jsr in
                                   3568 ;       colon list to code dictionary.
                                   3569 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001569                       3570         _HEADER COMPI,COMPO+7,"COMPILE"
      0095E9 95 D9                    1         .word LINK 
                           00156B     2         LINK=.
      0095EB 47                       3         .byte COMPO+7  
      0095EC 43 4F 4D 50 49 4C 45     4         .ascii "COMPILE"
      0095F3                          5         COMPI:
      0095F3 CD 85 B5         [ 4] 3571         CALL     RFROM
      0095F6 CD 86 9A         [ 4] 3572         CALL     DUPP
      0095F9 CD 85 64         [ 4] 3573         CALL     AT
      0095FC CD 98 C4         [ 4] 3574         CALL     JSRC    ;compile subroutine
      0095FF CD 8B ED         [ 4] 3575         CALL     CELLP
      009602 90 93            [ 1] 3576         ldw y,x 
      009604 90 FE            [ 2] 3577         ldw y,(y)
      009606 1C 00 02         [ 2] 3578         addw x,#CELLL 
      009609 90 FC            [ 2] 3579         jp (y)
                                   3580 
                                   3581 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3582 ;       LITERAL ( w -- )
                                   3583 ;       Compile tos to dictionary
                                   3584 ;       as an integer literal.
                                   3585 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00158B                       3586         _HEADER LITER,COMPO+IMEDD+7,"LITERAL"
      00960B 95 EB                    1         .word LINK 
                           00158D     2         LINK=.
      00960D C7                       3         .byte COMPO+IMEDD+7  
      00960E 4C 49 54 45 52 41 4C     4         .ascii "LITERAL"
      009615                          5         LITER:
      009615 CD 95 F3         [ 4] 3587         CALL     COMPI
      009618 84 F0                 3588         .word DOLIT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



      00961A CC 95 AE         [ 2] 3589         JP     COMMA
                                   3590 
                                   3591 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3592 ;       $,"     ( -- )
                                   3593 ;       Compile a literal string
                                   3594 ;       up to next " .
                                   3595 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3596 ;        _HEADER STRCQ,3,^/'$,"'/
      00961D                       3597 STRCQ:
      00961D CD 84 F0         [ 4] 3598         CALL     DOLIT
      009620 00 22                 3599         .word     34	; "
      009622 CD 91 A9         [ 4] 3600         CALL     PARSE
      009625 CD 8D 5E         [ 4] 3601         CALL     HERE
      009628 CD 8E 2F         [ 4] 3602         CALL     PACKS   ;string to code dictionary
      00962B CD 8D 47         [ 4] 3603         CALL     COUNT
      00962E CD 88 BD         [ 4] 3604         CALL     PLUS    ;calculate aligned end of string
      009631 CD 87 F1         [ 4] 3605         CALL     VPP
      009634 CC 85 52         [ 2] 3606         JP     STORE
                                   3607 
                                   3608 ;; Structures
                                   3609 
                                   3610 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3611 ;       FOR     ( -- a )
                                   3612 ;       Start a FOR-NEXT loop
                                   3613 ;       structure in a colon definition.
                                   3614 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0015B7                       3615         _HEADER FOR,IMEDD+3,"FOR"
      009637 96 0D                    1         .word LINK 
                           0015B9     2         LINK=.
      009639 83                       3         .byte IMEDD+3  
      00963A 46 4F 52                 4         .ascii "FOR"
      00963D                          5         FOR:
      00963D CD 95 F3         [ 4] 3616         CALL     COMPI
      009640 86 63                 3617         .word TOR 
      009642 CC 8D 5E         [ 2] 3618         JP     HERE
                                   3619 
                                   3620 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3621 ;       NEXT    ( a -- )
                                   3622 ;       Terminate a FOR-NEXT loop.
                                   3623 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0015C5                       3624         _HEADER NEXT,IMEDD+4,"NEXT"
      009645 96 39                    1         .word LINK 
                           0015C7     2         LINK=.
      009647 84                       3         .byte IMEDD+4  
      009648 4E 45 58 54              4         .ascii "NEXT"
      00964C                          5         NEXT:
      00964C CD 95 F3         [ 4] 3625         CALL     COMPI
      00964F 85 04                 3626         .word DONXT 
      009651 CD 88 3D         [ 4] 3627         call ADRADJ
      009654 CC 95 AE         [ 2] 3628         JP     COMMA
                                   3629 
                                   3630 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3631 ;       I ( -- n )
                                   3632 ;       stack COUNTER
                                   3633 ;       of innermost FOR-NEXT  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



                                   3634 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0015D7                       3635         _HEADER IFETCH,1,"I"
      009657 96 47                    1         .word LINK 
                           0015D9     2         LINK=.
      009659 01                       3         .byte 1  
      00965A 49                       4         .ascii "I"
      00965B                          5         IFETCH:
      00965B 1D 00 02         [ 2] 3636         subw x,#CELLL 
      00965E 16 03            [ 2] 3637         ldw y,(3,sp)
      009660 FF               [ 2] 3638         ldw (x),y 
      009661 81               [ 4] 3639         ret 
                                   3640 
                                   3641 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3642 ;       J ( -- n )
                                   3643 ;   stack COUNTER
                                   3644 ;   of outer FOR-NEXT  
                                   3645 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0015E2                       3646         _HEADER JFETCH,1,"J"
      009662 96 59                    1         .word LINK 
                           0015E4     2         LINK=.
      009664 01                       3         .byte 1  
      009665 4A                       4         .ascii "J"
      009666                          5         JFETCH:
      009666 1D 00 02         [ 2] 3647         SUBW X,#CELLL 
      009669 16 05            [ 2] 3648         LDW Y,(5,SP)
      00966B FF               [ 2] 3649         LDW (X),Y 
      00966C 81               [ 4] 3650         RET 
                                   3651 
                                   3652 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3653 ;       BEGIN   ( -- a )
                                   3654 ;       Start an infinite or
                                   3655 ;       indefinite loop structure.
                                   3656 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0015ED                       3657         _HEADER BEGIN,IMEDD+5,"BEGIN"
      00966D 96 64                    1         .word LINK 
                           0015EF     2         LINK=.
      00966F 85                       3         .byte IMEDD+5  
      009670 42 45 47 49 4E           4         .ascii "BEGIN"
      009675                          5         BEGIN:
      009675 CC 8D 5E         [ 2] 3658         JP     HERE
                                   3659 
                                   3660 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3661 ;       UNTIL   ( a -- )
                                   3662 ;       Terminate a BEGIN-UNTIL
                                   3663 ;       indefinite loop structure.
                                   3664 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0015F8                       3665         _HEADER UNTIL,IMEDD+5,"UNTIL"
      009678 96 6F                    1         .word LINK 
                           0015FA     2         LINK=.
      00967A 85                       3         .byte IMEDD+5  
      00967B 55 4E 54 49 4C           4         .ascii "UNTIL"
      009680                          5         UNTIL:
      009680 CD 95 F3         [ 4] 3666         CALL     COMPI
      009683 85 19                 3667         .word    QBRAN 
      009685 CD 88 3D         [ 4] 3668         call ADRADJ
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



      009688 CC 95 AE         [ 2] 3669         JP     COMMA
                                   3670 
                                   3671 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3672 ;       AGAIN   ( a -- )
                                   3673 ;       Terminate a BEGIN-AGAIN
                                   3674 ;       infinite loop structure.
                                   3675 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00160B                       3676         _HEADER AGAIN,IMEDD+5,"AGAIN"
      00968B 96 7A                    1         .word LINK 
                           00160D     2         LINK=.
      00968D 85                       3         .byte IMEDD+5  
      00968E 41 47 41 49 4E           4         .ascii "AGAIN"
      009693                          5         AGAIN:
                           000001  3677 .if OPTIMIZE 
      001613                       3678         _DOLIT JPIMM 
      009693 CD 84 F0         [ 4]    1     CALL DOLIT 
      009696 00 CC                    2     .word JPIMM 
      009698 CD 95 C5         [ 4] 3679         CALL  CCOMMA
                           000000  3680 .else 
                                   3681         CALL     COMPI
                                   3682         .word BRAN
                                   3683 .endif 
      00969B CD 88 3D         [ 4] 3684         call ADRADJ 
      00969E CC 95 AE         [ 2] 3685         JP     COMMA
                                   3686 
                                   3687 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3688 ;       IF      ( -- A )
                                   3689 ;       Begin a conditional branch.
                                   3690 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001621                       3691         _HEADER IFF,IMEDD+2,"IF"
      0096A1 96 8D                    1         .word LINK 
                           001623     2         LINK=.
      0096A3 82                       3         .byte IMEDD+2  
      0096A4 49 46                    4         .ascii "IF"
      0096A6                          5         IFF:
      0096A6 CD 95 F3         [ 4] 3692         CALL     COMPI
      0096A9 85 19                 3693         .word QBRAN
      0096AB CD 8D 5E         [ 4] 3694         CALL     HERE
      0096AE CD 8C 84         [ 4] 3695         CALL     ZERO
      0096B1 CC 95 AE         [ 2] 3696         JP     COMMA
                                   3697 
                                   3698 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3699 ;       THEN        ( A -- )
                                   3700 ;       Terminate a conditional 
                                   3701 ;       branch structure.
                                   3702 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001634                       3703         _HEADER THENN,IMEDD+4,"THEN"
      0096B4 96 A3                    1         .word LINK 
                           001636     2         LINK=.
      0096B6 84                       3         .byte IMEDD+4  
      0096B7 54 48 45 4E              4         .ascii "THEN"
      0096BB                          5         THENN:
      0096BB CD 8D 5E         [ 4] 3704         CALL     HERE
      0096BE CD 88 3D         [ 4] 3705         call ADRADJ 
      0096C1 CD 86 AA         [ 4] 3706         CALL     SWAPP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



      0096C4 CC 85 52         [ 2] 3707         JP     STORE
                                   3708 
                                   3709 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3710 ;       ELSE        ( A -- A )
                                   3711 ;       Start the false clause in 
                                   3712 ;       an IF-ELSE-THEN structure.
                                   3713 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001647                       3714         _HEADER ELSEE,IMEDD+4,"ELSE"
      0096C7 96 B6                    1         .word LINK 
                           001649     2         LINK=.
      0096C9 84                       3         .byte IMEDD+4  
      0096CA 45 4C 53 45              4         .ascii "ELSE"
      0096CE                          5         ELSEE:
                           000001  3715 .if OPTIMIZE 
      00164E                       3716         _DOLIT JPIMM 
      0096CE CD 84 F0         [ 4]    1     CALL DOLIT 
      0096D1 00 CC                    2     .word JPIMM 
      0096D3 CD 95 C5         [ 4] 3717         CALL CCOMMA 
                           000000  3718 .else 
                                   3719          CALL     COMPI
                                   3720         .word BRAN
                                   3721 .endif 
      0096D6 CD 8D 5E         [ 4] 3722         CALL     HERE
      0096D9 CD 8C 84         [ 4] 3723         CALL     ZERO
      0096DC CD 95 AE         [ 4] 3724         CALL     COMMA
      0096DF CD 86 AA         [ 4] 3725         CALL     SWAPP
      0096E2 CD 8D 5E         [ 4] 3726         CALL     HERE
      0096E5 CD 88 3D         [ 4] 3727         call ADRADJ 
      0096E8 CD 86 AA         [ 4] 3728         CALL     SWAPP
      0096EB CC 85 52         [ 2] 3729         JP     STORE
                                   3730 
                                   3731 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3732 ;       AHEAD       ( -- A )
                                   3733 ;       Compile a forward branch
                                   3734 ;       instruction.
                                   3735 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00166E                       3736         _HEADER AHEAD,IMEDD+5,"AHEAD"
      0096EE 96 C9                    1         .word LINK 
                           001670     2         LINK=.
      0096F0 85                       3         .byte IMEDD+5  
      0096F1 41 48 45 41 44           4         .ascii "AHEAD"
      0096F6                          5         AHEAD:
                           000001  3737 .if OPTIMIZE 
      001676                       3738         _DOLIT JPIMM 
      0096F6 CD 84 F0         [ 4]    1     CALL DOLIT 
      0096F9 00 CC                    2     .word JPIMM 
      0096FB CD 95 C5         [ 4] 3739         CALL CCOMMA
                           000000  3740 .else 
                                   3741         CALL     COMPI
                                   3742         .word BRAN
                                   3743 .endif 
      0096FE CD 8D 5E         [ 4] 3744         CALL     HERE
      009701 CD 8C 84         [ 4] 3745         CALL     ZERO
      009704 CC 95 AE         [ 2] 3746         JP     COMMA
                                   3747 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



                                   3748 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3749 ;       WHILE       ( a -- A a )
                                   3750 ;       Conditional branch out of a 
                                   3751 ;       BEGIN-WHILE-REPEAT loop.
                                   3752 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001687                       3753         _HEADER WHILE,IMEDD+5,"WHILE"
      009707 96 F0                    1         .word LINK 
                           001689     2         LINK=.
      009709 85                       3         .byte IMEDD+5  
      00970A 57 48 49 4C 45           4         .ascii "WHILE"
      00970F                          5         WHILE:
      00970F CD 95 F3         [ 4] 3754         CALL     COMPI
      009712 85 19                 3755         .word QBRAN
      009714 CD 8D 5E         [ 4] 3756         CALL     HERE
      009717 CD 8C 84         [ 4] 3757         CALL     ZERO
      00971A CD 95 AE         [ 4] 3758         CALL     COMMA
      00971D CC 86 AA         [ 2] 3759         JP     SWAPP
                                   3760 
                                   3761 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3762 ;       REPEAT      ( A a -- )
                                   3763 ;       Terminate a BEGIN-WHILE-REPEAT 
                                   3764 ;       indefinite loop.
                                   3765 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0016A0                       3766         _HEADER REPEA,IMEDD+6,"REPEAT"
      009720 97 09                    1         .word LINK 
                           0016A2     2         LINK=.
      009722 86                       3         .byte IMEDD+6  
      009723 52 45 50 45 41 54        4         .ascii "REPEAT"
      009729                          5         REPEA:
                           000001  3767 .if OPTIMIZE 
      0016A9                       3768         _DOLIT JPIMM 
      009729 CD 84 F0         [ 4]    1     CALL DOLIT 
      00972C 00 CC                    2     .word JPIMM 
      00972E CD 95 C5         [ 4] 3769         CALL  CCOMMA
                           000000  3770 .else 
                                   3771         CALL     COMPI
                                   3772         .word BRAN
                                   3773 .endif 
      009731 CD 88 3D         [ 4] 3774         call ADRADJ 
      009734 CD 95 AE         [ 4] 3775         CALL     COMMA
      009737 CD 8D 5E         [ 4] 3776         CALL     HERE
      00973A CD 88 3D         [ 4] 3777         call ADRADJ 
      00973D CD 86 AA         [ 4] 3778         CALL     SWAPP
      009740 CC 85 52         [ 2] 3779         JP     STORE
                                   3780 
                                   3781 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3782 ;       AFT         ( a -- a A )
                                   3783 ;       Jump to THEN in a FOR-AFT-THEN-NEXT 
                                   3784 ;       loop the first time through.
                                   3785 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0016C3                       3786         _HEADER AFT,IMEDD+3,"AFT"
      009743 97 22                    1         .word LINK 
                           0016C5     2         LINK=.
      009745 83                       3         .byte IMEDD+3  
      009746 41 46 54                 4         .ascii "AFT"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



      009749                          5         AFT:
      009749 CD 86 90         [ 4] 3787         CALL     DROP
      00974C CD 96 F6         [ 4] 3788         CALL     AHEAD
      00974F CD 8D 5E         [ 4] 3789         CALL     HERE
      009752 CC 86 AA         [ 2] 3790         JP     SWAPP
                                   3791 
                                   3792 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3793 ;       ABORT"      ( -- ; <string> )
                                   3794 ;       Conditional abort with an error message.
                                   3795 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0016D5                       3796         _HEADER ABRTQ,IMEDD+6,'ABORT"'
      009755 97 45                    1         .word LINK 
                           0016D7     2         LINK=.
      009757 86                       3         .byte IMEDD+6  
      009758 41 42 4F 52 54 22        4         .ascii 'ABORT"'
      00975E                          5         ABRTQ:
      00975E CD 95 F3         [ 4] 3797         CALL     COMPI
      009761 94 73                 3798         .word ABORQ
      009763 CC 96 1D         [ 2] 3799         JP     STRCQ
                                   3800 
                                   3801 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3802 ;       $"     ( -- ; <string> )
                                   3803 ;       Compile an inline string literal.
                                   3804 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0016E6                       3805         _HEADER STRQ,IMEDD+2,'$"'
      009766 97 57                    1         .word LINK 
                           0016E8     2         LINK=.
      009768 82                       3         .byte IMEDD+2  
      009769 24 22                    4         .ascii '$"'
      00976B                          5         STRQ:
      00976B CD 95 F3         [ 4] 3806         CALL     COMPI
      00976E 90 34                 3807         .word STRQP 
      009770 CC 96 1D         [ 2] 3808         JP     STRCQ
                                   3809 
                                   3810 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3811 ;       ."          ( -- ; <string> )
                                   3812 ;       Compile an inline string literal 
                                   3813 ;       to be typed out at run time.
                                   3814 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0016F3                       3815         _HEADER DOTQ,IMEDD+2,'."'
      009773 97 68                    1         .word LINK 
                           0016F5     2         LINK=.
      009775 82                       3         .byte IMEDD+2  
      009776 2E 22                    4         .ascii '."'
      009778                          5         DOTQ:
      009778 CD 95 F3         [ 4] 3816         CALL     COMPI
      00977B 90 38                 3817         .word DOTQP 
      00977D CC 96 1D         [ 2] 3818         JP     STRCQ
                                   3819 
                                   3820 ;; Name compiler
                                   3821 
                                   3822 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3823 ;       ?UNIQUE ( a -- a )
                                   3824 ;       Display a warning message
                                   3825 ;       if word already exists.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



                                   3826 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001700                       3827         _HEADER UNIQU,7,"?UNIQUE"
      009780 97 75                    1         .word LINK 
                           001702     2         LINK=.
      009782 07                       3         .byte 7  
      009783 3F 55 4E 49 51 55 45     4         .ascii "?UNIQUE"
      00978A                          5         UNIQU:
      00978A CD 86 9A         [ 4] 3828         CALL     DUPP
      00978D CD 93 67         [ 4] 3829         CALL     NAMEQ   ;?name exists
      009790 CD 85 19         [ 4] 3830         CALL     QBRAN
      009793 97 A9                 3831         .word      UNIQ1
      009795 CD 90 38         [ 4] 3832         CALL     DOTQP   ;redef are OK
      009798 07                    3833         .byte       7
      009799 20 72 65 44 65 66 20  3834         .ascii     " reDef "       
      0097A0 CD 86 C2         [ 4] 3835         CALL     OVER
      0097A3 CD 8D 47         [ 4] 3836         CALL     COUNT
      0097A6 CD 8F F2         [ 4] 3837         CALL     TYPES   ;just in case
      0097A9 CC 86 90         [ 2] 3838 UNIQ1:  JP     DROP
                                   3839 
                                   3840 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3841 ;       $,n     ( na -- )
                                   3842 ;       Build a new dictionary name
                                   3843 ;       using string at na.
                                   3844 ; compile dans l'espace des variables 
                                   3845 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3846 ;        _HEADER SNAME,3,^/"$,n"/
      0097AC                       3847 SNAME: 
      0097AC CD 86 9A         [ 4] 3848         CALL     DUPP
      0097AF CD 85 82         [ 4] 3849         CALL     CAT     ;?null input
      0097B2 CD 85 19         [ 4] 3850         CALL     QBRAN
      0097B5 97 E2                 3851         .word      PNAM1
      0097B7 CD 97 8A         [ 4] 3852         CALL     UNIQU   ;?redefinition
      0097BA CD 86 9A         [ 4] 3853         CALL     DUPP
      0097BD CD 8D 47         [ 4] 3854         CALL     COUNT
      0097C0 CD 88 BD         [ 4] 3855         CALL     PLUS
      0097C3 CD 87 F1         [ 4] 3856         CALL     VPP
      0097C6 CD 85 52         [ 4] 3857         CALL     STORE
      0097C9 CD 86 9A         [ 4] 3858         CALL     DUPP
      0097CC CD 88 0F         [ 4] 3859         CALL     LAST
      0097CF CD 85 52         [ 4] 3860         CALL     STORE   ;save na for vocabulary link
      0097D2 CD 8B FC         [ 4] 3861         CALL     CELLM   ;link address
      0097D5 CD 87 E3         [ 4] 3862         CALL     CNTXT
      0097D8 CD 85 64         [ 4] 3863         CALL     AT
      0097DB CD 86 AA         [ 4] 3864         CALL     SWAPP
      0097DE CD 85 52         [ 4] 3865         CALL     STORE
      0097E1 81               [ 4] 3866         RET     ;save code pointer
      0097E2 CD 90 34         [ 4] 3867 PNAM1:  CALL     STRQP
      0097E5 05                    3868         .byte      5
      0097E6 20 6E 61 6D 65        3869         .ascii     " name" ;null input
      0097EB CC 94 7B         [ 2] 3870         JP     ABOR1
                                   3871 
                                   3872 ;; FORTH compiler
                                   3873 
                                   3874 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3875 ;       $COMPILE        ( a -- )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



                                   3876 ;       Compile next word to
                                   3877 ;       dictionary as a token or literal.
                                   3878 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00176E                       3879         _HEADER SCOMP,8,"$COMPILE"
      0097EE 97 82                    1         .word LINK 
                           001770     2         LINK=.
      0097F0 08                       3         .byte 8  
      0097F1 24 43 4F 4D 50 49 4C     4         .ascii "$COMPILE"
             45
      0097F9                          5         SCOMP:
      0097F9 CD 93 67         [ 4] 3880         CALL     NAMEQ
      0097FC CD 88 4D         [ 4] 3881         CALL     QDUP    ;?defined
      0097FF CD 85 19         [ 4] 3882         CALL     QBRAN
      009802 98 1A                 3883         .word      SCOM2
      009804 CD 85 64         [ 4] 3884         CALL     AT
      009807 CD 84 F0         [ 4] 3885         CALL     DOLIT
      00980A 80 00                 3886         .word     0x8000	;  IMEDD*256
      00980C CD 86 F7         [ 4] 3887         CALL     ANDD    ;?immediate
      00980F CD 85 19         [ 4] 3888         CALL     QBRAN
      009812 98 17                 3889         .word      SCOM1
      009814 CC 85 45         [ 2] 3890         JP     EXECU
      009817 CC 98 C4         [ 2] 3891 SCOM1:  JP     JSRC
      00981A CD A6 5D         [ 4] 3892 SCOM2:  CALL     NUMBQ   ;try to convert to number
      00981D CD 88 4D         [ 4] 3893         CALL    QDUP  
      009820 CD 85 19         [ 4] 3894         CALL     QBRAN
      009823 94 7B                 3895         .word      ABOR1
      0017A5                       3896         _DOLIT  -1
      009825 CD 84 F0         [ 4]    1     CALL DOLIT 
      009828 FF FF                    2     .word -1 
      00982A CD 89 7B         [ 4] 3897         CALL    EQUAL
      0017AD                       3898         _QBRAN DLITER  
      00982D CD 85 19         [ 4]    1     CALL QBRAN
      009830 AA 3C                    2     .word DLITER
      009832 CC 96 15         [ 2] 3899         JP     LITER
                                   3900 
                                   3901 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3902 ;       OVERT   ( -- )
                                   3903 ;       Link a new word into vocabulary.
                                   3904 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0017B5                       3905         _HEADER OVERT,5,"OVERT"
      009835 97 F0                    1         .word LINK 
                           0017B7     2         LINK=.
      009837 05                       3         .byte 5  
      009838 4F 56 45 52 54           4         .ascii "OVERT"
      00983D                          5         OVERT:
      00983D CD 88 0F         [ 4] 3906         CALL     LAST
      009840 CD 85 64         [ 4] 3907         CALL     AT
      009843 CD 87 E3         [ 4] 3908         CALL     CNTXT
      009846 CC 85 52         [ 2] 3909         JP     STORE
                                   3910 
                                   3911 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3912 ;       ;       ( -- )
                                   3913 ;       Terminate a colon definition.
                                   3914 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0017C9                       3915         _HEADER SEMIS,IMEDD+COMPO+1,^/";"/
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



      009849 98 37                    1         .word LINK 
                           0017CB     2         LINK=.
      00984B C1                       3         .byte IMEDD+COMPO+1  
      00984C 3B                       4         .ascii ";"
      00984D                          5         SEMIS:
                           000001  3916 .if OPTIMIZE ; more compact and faster
      00984D CD 84 F0         [ 4] 3917         call DOLIT 
      009850 00 81                 3918         .word 0x81   ; opcode for RET 
      009852 CD 95 C5         [ 4] 3919         call CCOMMA 
                           000000  3920 .else
                                   3921         CALL     COMPI
                                   3922         .word EXIT 
                                   3923 .endif 
      009855 CD 94 DC         [ 4] 3924         CALL     LBRAC
      009858 CD 98 3D         [ 4] 3925         call OVERT 
      00985B CD A3 01         [ 4] 3926         CALL FMOVE
      00985E CD 88 4D         [ 4] 3927         call QDUP 
      009861 CD 85 19         [ 4] 3928         call QBRAN 
      009864 99 DA                 3929         .word SET_RAMLAST 
      009866 CD A3 95         [ 4] 3930         CALL UPDATPTR
      009869 81               [ 4] 3931         RET 
                                   3932 
                                   3933 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3934 ;       Terminate an ISR definition 
                                   3935 ;       retourn ca of ISR as double
                                   3936 ;       I; ( -- ud )
                                   3937 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0017EA                       3938        _HEADER ISEMI,2+IMEDD+COMPO,^/"I;"/
      00986A 98 4B                    1         .word LINK 
                           0017EC     2         LINK=.
      00986C C2                       3         .byte 2+IMEDD+COMPO  
      00986D 49 3B                    4         .ascii "I;"
      00986F                          5         ISEMI:
      00986F 1D 00 02         [ 2] 3939         subw x,#CELLL  
      009872 90 AE 00 80      [ 2] 3940         ldw y,#IRET_CODE 
      009876 FF               [ 2] 3941         ldw (x),y 
      009877 CD 95 C5         [ 4] 3942         call CCOMMA
      00987A CD 94 DC         [ 4] 3943         call LBRAC 
      00987D CD A3 DA         [ 4] 3944         call IFMOVE
      009880 CD 88 4D         [ 4] 3945         call QDUP 
      009883 CD 85 19         [ 4] 3946         CALL QBRAN 
      009886 99 DA                 3947         .word SET_RAMLAST
      009888 CD 87 FF         [ 4] 3948         CALL CPP
      00988B CD 85 64         [ 4] 3949         call AT 
      00988E CD 86 AA         [ 4] 3950         call SWAPP 
      009891 CD 87 FF         [ 4] 3951         CALL CPP 
      009894 CD 85 52         [ 4] 3952         call STORE 
      009897 CD 9D 92         [ 4] 3953         call UPDATCP 
      00989A CD 9D 4F         [ 4] 3954         call EEPVP 
      00181D                       3955         _DROP 
      00989D 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      0098A0 CD 85 64         [ 4] 3956         call AT 
      0098A3 CD 87 F1         [ 4] 3957         call VPP 
      0098A6 CD 85 52         [ 4] 3958         call STORE 
      0098A9 CC 8C 84         [ 2] 3959         jp ZERO
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



      0098AC 81               [ 4] 3960         ret           
                                   3961         
                                   3962 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3963 ;       ]       ( -- )
                                   3964 ;       Start compiling words in
                                   3965 ;       input stream.
                                   3966 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00182D                       3967         _HEADER RBRAC,1,"]"
      0098AD 98 6C                    1         .word LINK 
                           00182F     2         LINK=.
      0098AF 01                       3         .byte 1  
      0098B0 5D                       4         .ascii "]"
      0098B1                          5         RBRAC:
      0098B1 CD 84 F0         [ 4] 3968         CALL   DOLIT
      0098B4 97 F9                 3969         .word  SCOMP
      0098B6 CD 87 C1         [ 4] 3970         CALL   TEVAL
      0098B9 CC 85 52         [ 2] 3971         JP     STORE
                                   3972 
                                   3973 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3974 ;       CALL,    ( ca -- )
                                   3975 ;       Compile a subroutine call.
                                   3976 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00183C                       3977         _HEADER JSRC,5,^/"CALL,"/
      0098BC 98 AF                    1         .word LINK 
                           00183E     2         LINK=.
      0098BE 05                       3         .byte 5  
      0098BF 43 41 4C 4C 2C           4         .ascii "CALL,"
      0098C4                          5         JSRC:
                           000001  3978 .if OPTIMIZE 
                                   3979 ;;;;; optimization code ;;;;;;;;;;;;;;;
      0098C4 90 AE 86 90      [ 2] 3980         LDW Y,#DROP 
      0098C8 90 BF 26         [ 2] 3981         LDW YTEMP,Y 
      0098CB 90 93            [ 1] 3982         LDW Y,X 
      0098CD 90 FE            [ 2] 3983         LDW Y,(Y)
      0098CF 90 B3 26         [ 2] 3984         CPW Y,YTEMP 
      0098D2 26 13            [ 1] 3985         JRNE JSRC1         
                                   3986 ; replace CALL DROP BY  ADDW X,#CELLL 
      0098D4 1C 00 02         [ 2] 3987         ADDW X,#CELLL 
      001857                       3988         _DOLIT ADDWX ; opcode 
      0098D7 CD 84 F0         [ 4]    1     CALL DOLIT 
      0098DA 00 1C                    2     .word ADDWX 
      0098DC CD 95 C5         [ 4] 3989         CALL   CCOMMA 
      00185F                       3990         _DOLIT CELLL 
      0098DF CD 84 F0         [ 4]    1     CALL DOLIT 
      0098E2 00 02                    2     .word CELLL 
      0098E4 CC 95 AE         [ 2] 3991         JP      COMMA 
      0098E7                       3992 JSRC1: ; check for DDROP 
      0098E7 90 AE 88 9D      [ 2] 3993         LDW Y,#DDROP 
      0098EB 90 BF 26         [ 2] 3994         LDW YTEMP,Y 
      0098EE 90 93            [ 1] 3995         LDW Y,X 
      0098F0 90 FE            [ 2] 3996         LDW Y,(Y)
      0098F2 90 B3 26         [ 2] 3997         CPW Y,YTEMP 
      0098F5 26 13            [ 1] 3998         JRNE JSRC2 
                                   3999 ; replace CALL DDROP BY ADDW X,#2*CELLL 
      0098F7 1C 00 02         [ 2] 4000         ADDW X,#CELLL 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



      00187A                       4001         _DOLIT ADDWX 
      0098FA CD 84 F0         [ 4]    1     CALL DOLIT 
      0098FD 00 1C                    2     .word ADDWX 
      0098FF CD 95 C5         [ 4] 4002         CALL  CCOMMA 
      001882                       4003         _DOLIT 2*CELLL 
      009902 CD 84 F0         [ 4]    1     CALL DOLIT 
      009905 00 04                    2     .word 2*CELLL 
      009907 CC 95 AE         [ 2] 4004         JP  COMMA 
      00990A                       4005 JSRC2: 
                                   4006 ;;;;;;;; end optimization code ;;;;;;;;;;        
                                   4007 .endif        
      00990A CD 84 F0         [ 4] 4008         CALL     DOLIT
      00990D 00 CD                 4009         .word     CALLL     ;CALL
      00990F CD 95 C5         [ 4] 4010         CALL     CCOMMA
      009912 CC 95 AE         [ 2] 4011         JP     COMMA
                                   4012 
                                   4013 ;       INIT-OFS ( -- )
                                   4014 ;       compute offset to adjust jump address 
                                   4015 ;       set variable OFFSET 
      009915 98 BE                 4016         .word LINK 
                           001897  4017         LINK=.
      009917 08                    4018         .byte 8 
      009918 49 4E 49 54 2D 4F 46  4019         .ascii "INIT-OFS" 
             53
      009920                       4020 INITOFS:
      009920 CD 87 B0         [ 4] 4021         call TFLASH 
      009923 CD 85 64         [ 4] 4022         CALL AT 
      009926 CD 86 9A         [ 4] 4023         CALL DUPP 
      009929 CD 85 19         [ 4] 4024         call QBRAN
      00992C 99 3D                 4025         .word 1$
      0018AE                       4026         _DROP  
      00992E 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      009931 CD 87 FF         [ 4] 4027         call CPP 
      009934 CD 85 64         [ 4] 4028         call AT 
      009937 CD 8D 5E         [ 4] 4029         call HERE
      00993A CD 89 53         [ 4] 4030         call SUBB 
      00993D CD 88 34         [ 4] 4031 1$:     call OFFSET 
      009940 CC 85 52         [ 2] 4032         jp STORE  
                                   4033 
                                   4034 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4035 ;       :       ( -- ; <string> )
                                   4036 ;       Start a new colon definition
                                   4037 ;       using next word as its name.
                                   4038 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0018C3                       4039         _HEADER COLON,1,":"
      009943 99 17                    1         .word LINK 
                           0018C5     2         LINK=.
      009945 01                       3         .byte 1  
      009946 3A                       4         .ascii ":"
      009947                          5         COLON:
      009947 CD 99 20         [ 4] 4040         call INITOFS       
      00994A CD 92 6A         [ 4] 4041         CALL   TOKEN
      00994D CD 97 AC         [ 4] 4042         CALL   SNAME
      009950 CC 98 B1         [ 2] 4043         JP     RBRAC
                                   4044 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



                                   4045 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4046 ;       I:  ( -- )
                                   4047 ;       Start interrupt service 
                                   4048 ;       routine definition
                                   4049 ;       those definition have 
                                   4050 ;       no name.
                                   4051 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0018D3                       4052         _HEADER ICOLON,2,"I:"
      009953 99 45                    1         .word LINK 
                           0018D5     2         LINK=.
      009955 02                       3         .byte 2  
      009956 49 3A                    4         .ascii "I:"
      009958                          5         ICOLON:
      009958 CD 99 20         [ 4] 4053         call INITOFS 
      00995B CC 98 B1         [ 2] 4054         jp RBRAC  
                                   4055 
                                   4056 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4057 ;       IMMEDIATE       ( -- )
                                   4058 ;       Make last compiled word
                                   4059 ;       an immediate word.
                                   4060 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0018DE                       4061         _HEADER IMMED,9,"IMMEDIATE"
      00995E 99 55                    1         .word LINK 
                           0018E0     2         LINK=.
      009960 09                       3         .byte 9  
      009961 49 4D 4D 45 44 49 41     4         .ascii "IMMEDIATE"
             54 45
      00996A                          5         IMMED:
      00996A CD 84 F0         [ 4] 4062         CALL     DOLIT
      00996D 80 00                 4063         .word     0x8000	;  IMEDD*256
      00996F CD 88 0F         [ 4] 4064         CALL     LAST
      009972 CD 85 64         [ 4] 4065         CALL     AT
      009975 CD 85 64         [ 4] 4066         CALL     AT
      009978 CD 87 0B         [ 4] 4067         CALL     ORR
      00997B CD 88 0F         [ 4] 4068         CALL     LAST
      00997E CD 85 64         [ 4] 4069         CALL     AT
      009981 CC 85 52         [ 2] 4070         JP     STORE
                                   4071 
                                   4072 ;; Defining words
                                   4073 
                                   4074 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4075 ;       CREATE  ( -- ; <string> )
                                   4076 ;       Compile a new array
                                   4077 ;       without allocating space.
                                   4078 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001904                       4079         _HEADER CREAT,6,"CREATE"
      009984 99 60                    1         .word LINK 
                           001906     2         LINK=.
      009986 06                       3         .byte 6  
      009987 43 52 45 41 54 45        4         .ascii "CREATE"
      00998D                          5         CREAT:
      00998D CD 92 6A         [ 4] 4080         CALL     TOKEN
      009990 CD 97 AC         [ 4] 4081         CALL     SNAME
      009993 CD 98 3D         [ 4] 4082         CALL     OVERT        
      009996 CD 95 F3         [ 4] 4083         CALL     COMPI 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



      009999 87 50                 4084         .word DOVAR 
      00999B 81               [ 4] 4085         RET
                                   4086 
                                   4087 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4088 ;       VARIABLE  ( -- ; <string> )
                                   4089 ;       Compile a new variable
                                   4090 ;       initialized to 0.
                                   4091 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00191C                       4092         _HEADER VARIA,8,"VARIABLE"
      00999C 99 86                    1         .word LINK 
                           00191E     2         LINK=.
      00999E 08                       3         .byte 8  
      00999F 56 41 52 49 41 42 4C     4         .ascii "VARIABLE"
             45
      0099A7                          5         VARIA:
                                   4093 ; indirect variable so that VARIABLE definition can be compiled in FLASH 
      0099A7 CD 8D 5E         [ 4] 4094         CALL HERE
      0099AA CD 86 9A         [ 4] 4095         CALL DUPP 
      0099AD CD 8B ED         [ 4] 4096         CALL CELLP
      0099B0 CD 87 F1         [ 4] 4097         CALL VPP 
      0099B3 CD 85 52         [ 4] 4098         CALL STORE
      0099B6 CD 99 8D         [ 4] 4099         CALL CREAT
      0099B9 CD 86 9A         [ 4] 4100         CALL DUPP
      0099BC CD 95 AE         [ 4] 4101         CALL COMMA
      0099BF CD 8C 84         [ 4] 4102         CALL ZERO
      0099C2 CD 86 AA         [ 4] 4103         call SWAPP 
      0099C5 CD 85 52         [ 4] 4104         CALL STORE
      0099C8 CD A3 01         [ 4] 4105         CALL FMOVE ; move definition to FLASH
      0099CB CD 88 4D         [ 4] 4106         CALL QDUP 
      0099CE CD 85 19         [ 4] 4107         CALL QBRAN 
      0099D1 99 DA                 4108         .word SET_RAMLAST   
      0099D3 CD 9D A9         [ 4] 4109         call UPDATVP  ; don't update if variable kept in RAM.
      0099D6 CD A3 95         [ 4] 4110         CALL UPDATPTR
      0099D9 81               [ 4] 4111         RET         
      0099DA                       4112 SET_RAMLAST: 
      0099DA CD 88 0F         [ 4] 4113         CALL LAST 
      0099DD CD 85 64         [ 4] 4114         CALL AT 
      0099E0 CD 88 22         [ 4] 4115         CALL RAMLAST 
      0099E3 CC 85 52         [ 2] 4116         JP STORE  
                                   4117 
                                   4118 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4119 ;       CONSTANT  ( n -- ; <string> )
                                   4120 ;       Compile a new constant 
                                   4121 ;       n CONSTANT name 
                                   4122 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001966                       4123         _HEADER CONSTANT,8,"CONSTANT"
      0099E6 99 9E                    1         .word LINK 
                           001968     2         LINK=.
      0099E8 08                       3         .byte 8  
      0099E9 43 4F 4E 53 54 41 4E     4         .ascii "CONSTANT"
             54
      0099F1                          5         CONSTANT:
      0099F1 CD 92 6A         [ 4] 4124         CALL TOKEN
      0099F4 CD 97 AC         [ 4] 4125         CALL SNAME 
      0099F7 CD 98 3D         [ 4] 4126         CALL OVERT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



      0099FA CD 95 F3         [ 4] 4127         CALL COMPI 
      0099FD 9A 11                 4128         .word DOCONST
      0099FF CD 95 AE         [ 4] 4129         CALL COMMA 
      009A02 CD A3 01         [ 4] 4130         CALL FMOVE
      009A05 CD 88 4D         [ 4] 4131         CALL QDUP 
      009A08 CD 85 19         [ 4] 4132         CALL QBRAN 
      009A0B 99 DA                 4133         .word SET_RAMLAST  
      009A0D CD A3 95         [ 4] 4134         CALL UPDATPTR  
      009A10 81               [ 4] 4135 1$:     RET          
                                   4136 
                                   4137 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4138 ; CONSTANT runtime semantic 
                                   4139 ; doCONST  ( -- n )
                                   4140 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4141 ;       _HEADER DOCONST,7,"DOCONST"
      009A11                       4142 DOCONST:
      009A11 1D 00 02         [ 2] 4143         subw x,#CELLL
      009A14 90 85            [ 2] 4144         popw y 
      009A16 90 FE            [ 2] 4145         ldw y,(y) 
      009A18 FF               [ 2] 4146         ldw (x),y 
      009A19 81               [ 4] 4147         ret 
                                   4148 
                                   4149 ;----------------------------------
                                   4150 ; create double constant 
                                   4151 ; 2CONSTANT ( d -- ; <string> )
                                   4152 ;----------------------------------
      00199A                       4153         _HEADER DCONST,9,"2CONSTANT"
      009A1A 99 E8                    1         .word LINK 
                           00199C     2         LINK=.
      009A1C 09                       3         .byte 9  
      009A1D 32 43 4F 4E 53 54 41     4         .ascii "2CONSTANT"
             4E 54
      009A26                          5         DCONST:
      009A26 CD 92 6A         [ 4] 4154         CALL TOKEN
      009A29 CD 97 AC         [ 4] 4155         CALL SNAME 
      009A2C CD 98 3D         [ 4] 4156         CALL OVERT 
      009A2F CD 95 F3         [ 4] 4157         CALL COMPI 
      009A32 9A 49                 4158         .word DO_DCONST
      009A34 CD 95 AE         [ 4] 4159         CALL COMMA
      009A37 CD 95 AE         [ 4] 4160         CALL COMMA  
      009A3A CD A3 01         [ 4] 4161         CALL FMOVE
      009A3D CD 88 4D         [ 4] 4162         CALL QDUP 
      009A40 CD 85 19         [ 4] 4163         CALL QBRAN 
      009A43 99 DA                 4164         .word SET_RAMLAST  
      009A45 CD A3 95         [ 4] 4165         CALL UPDATPTR  
      009A48 81               [ 4] 4166 1$:     RET          
                                   4167     
                                   4168 ;----------------------------------
                                   4169 ; runtime for DCONST 
                                   4170 ; stack double constant 
                                   4171 ; DO-DCONST ( -- d )
                                   4172 ;-----------------------------------
                                   4173 ;       _HEADER DO_DCONST,9,"DO-DCONST"
      009A49                       4174 DO_DCONST:
      009A49 90 85            [ 2] 4175     popw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



      009A4B 90 BF 26         [ 2] 4176     ldw YTEMP,y 
      009A4E 1D 00 04         [ 2] 4177     subw x,#2*CELLL 
      009A51 90 FE            [ 2] 4178     ldw y,(y)
      009A53 FF               [ 2] 4179     ldw (x),y 
      009A54 90 BE 26         [ 2] 4180     ldw y,YTEMP 
      009A57 90 EE 02         [ 2] 4181     ldw y,(2,y)
      009A5A EF 02            [ 2] 4182     ldw (2,x),y 
      009A5C 81               [ 4] 4183     ret 
                                   4184 
                                   4185 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4186 ;;          TOOLS 
                                   4187 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4188 
                                   4189 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4190 ;       _TYPE   ( b u -- )
                                   4191 ;       Display a string. Filter
                                   4192 ;       non-printing characters.
                                   4193 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0019DD                       4194         _HEADER UTYPE,5,"_TYPE"
      009A5D 9A 1C                    1         .word LINK 
                           0019DF     2         LINK=.
      009A5F 05                       3         .byte 5  
      009A60 5F 54 59 50 45           4         .ascii "_TYPE"
      009A65                          5         UTYPE:
      009A65 CD 86 63         [ 4] 4195         CALL     TOR     ;start count down loop
      009A68 20 0F            [ 2] 4196         JRA     UTYP2   ;skip first pass
      009A6A CD 86 9A         [ 4] 4197 UTYP1:  CALL     DUPP
      009A6D CD 85 82         [ 4] 4198         CALL     CAT
      009A70 CD 8C AE         [ 4] 4199         CALL     TCHAR
      009A73 CD 84 B7         [ 4] 4200         CALL     EMIT    ;display only printable
      009A76 CD 8C 18         [ 4] 4201         CALL     ONEP    ;increment address
      009A79 CD 85 04         [ 4] 4202 UTYP2:  CALL     DONXT
      009A7C 9A 6A                 4203         .word      UTYP1   ;loop till done
      009A7E CC 86 90         [ 2] 4204         JP     DROP
                                   4205 
                                   4206 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4207 ;       dm+     ( a u -- a )
                                   4208 ;       Dump u bytes from ,
                                   4209 ;       leaving a+u on  stack.
                                   4210 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001A01                       4211         _HEADER DUMPP,3,"DM+"
      009A81 9A 5F                    1         .word LINK 
                           001A03     2         LINK=.
      009A83 03                       3         .byte 3  
      009A84 44 4D 2B                 4         .ascii "DM+"
      009A87                          5         DUMPP:
      009A87 CD 86 C2         [ 4] 4212         CALL     OVER
      009A8A CD 84 F0         [ 4] 4213         CALL     DOLIT
      009A8D 00 04                 4214         .word      4
      009A8F CD 90 61         [ 4] 4215         CALL     UDOTR   ;display address
      009A92 CD 8F C8         [ 4] 4216         CALL     SPACE
      009A95 CD 86 63         [ 4] 4217         CALL     TOR     ;start count down loop
      009A98 20 11            [ 2] 4218         JRA     PDUM2   ;skip first pass
      009A9A CD 86 9A         [ 4] 4219 PDUM1:  CALL     DUPP
      009A9D CD 85 82         [ 4] 4220         CALL     CAT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



      009AA0 CD 84 F0         [ 4] 4221         CALL     DOLIT
      009AA3 00 03                 4222         .word      3
      009AA5 CD 90 61         [ 4] 4223         CALL     UDOTR   ;display numeric data
      009AA8 CD 8C 18         [ 4] 4224         CALL     ONEP    ;increment address
      009AAB CD 85 04         [ 4] 4225 PDUM2:  CALL     DONXT
      009AAE 9A 9A                 4226         .word      PDUM1   ;loop till done
      009AB0 81               [ 4] 4227         RET
                                   4228 
                                   4229 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4230 ;       DUMP    ( a u -- )
                                   4231 ;       Dump u bytes from a,
                                   4232 ;       in a formatted manner.
                                   4233 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001A31                       4234         _HEADER DUMP,4,"DUMP"
      009AB1 9A 83                    1         .word LINK 
                           001A33     2         LINK=.
      009AB3 04                       3         .byte 4  
      009AB4 44 55 4D 50              4         .ascii "DUMP"
      009AB8                          5         DUMP:
      009AB8 CD 87 60         [ 4] 4235         CALL     BASE
      009ABB CD 85 64         [ 4] 4236         CALL     AT
      009ABE CD 86 63         [ 4] 4237         CALL     TOR
      009AC1 CD 8F 27         [ 4] 4238         CALL     HEX     ;save radix, set hex
      009AC4 CD 84 F0         [ 4] 4239         CALL     DOLIT
      009AC7 00 10                 4240         .word      16
      009AC9 CD 8B 3E         [ 4] 4241         CALL     SLASH   ;change count to lines
      009ACC CD 86 63         [ 4] 4242         CALL     TOR     ;start count down loop
      009ACF CD 90 0B         [ 4] 4243 DUMP1:  CALL     CR
      009AD2 CD 84 F0         [ 4] 4244         CALL     DOLIT
      009AD5 00 10                 4245         .word      16
      009AD7 CD 88 A8         [ 4] 4246         CALL     DDUP
      009ADA CD 9A 87         [ 4] 4247         CALL     DUMPP   ;display numeric
      009ADD CD 88 5E         [ 4] 4248         CALL     ROT
      009AE0 CD 88 5E         [ 4] 4249         CALL     ROT
      009AE3 CD 8F C8         [ 4] 4250         CALL     SPACE
      009AE6 CD 8F C8         [ 4] 4251         CALL     SPACE
      009AE9 CD 9A 65         [ 4] 4252         CALL     UTYPE   ;display printable characters
      009AEC CD 85 04         [ 4] 4253         CALL     DONXT
      009AEF 9A CF                 4254         .word      DUMP1   ;loop till done
      009AF1 CD 86 90         [ 4] 4255 DUMP3:  CALL     DROP
      009AF4 CD 85 B5         [ 4] 4256         CALL     RFROM
      009AF7 CD 87 60         [ 4] 4257         CALL     BASE
      009AFA CC 85 52         [ 2] 4258         JP     STORE   ;restore radix
                                   4259 
                                   4260 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4261 ;       .S      ( ... -- ... )
                                   4262 ;        Display  contents of stack.
                                   4263 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001A7D                       4264         _HEADER DOTS,2,".S"
      009AFD 9A B3                    1         .word LINK 
                           001A7F     2         LINK=.
      009AFF 02                       3         .byte 2  
      009B00 2E 53                    4         .ascii ".S"
      009B02                          5         DOTS:
      009B02 CD 90 0B         [ 4] 4265         CALL     CR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



      009B05 CD 8C C6         [ 4] 4266         CALL     DEPTH   ;stack depth
      009B08 CD 86 63         [ 4] 4267         CALL     TOR     ;start count down loop
      009B0B 20 09            [ 2] 4268         JRA     DOTS2   ;skip first pass
      009B0D CD 85 C6         [ 4] 4269 DOTS1:  CALL     RAT
      009B10 CD 8C DD         [ 4] 4270 	CALL     PICK
      009B13 CD 90 B1         [ 4] 4271         CALL     DOT     ;index stack, display contents
      009B16 CD 85 04         [ 4] 4272 DOTS2:  CALL     DONXT
      009B19 9B 0D                 4273         .word      DOTS1   ;loop till done
      009B1B CD 90 38         [ 4] 4274         CALL     DOTQP
      009B1E 05                    4275         .byte      5
      009B1F 20 3C 73 70 20        4276         .ascii     " <sp "
      009B24 81               [ 4] 4277         RET
                                   4278 
                                   4279 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4280 ;       >NAME   ( ca -- na | F )
                                   4281 ;       Convert code address
                                   4282 ;       to a name address.
                                   4283 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001AA5                       4284         _HEADER TNAME,5,">NAME"
      009B25 9A FF                    1         .word LINK 
                           001AA7     2         LINK=.
      009B27 05                       3         .byte 5  
      009B28 3E 4E 41 4D 45           4         .ascii ">NAME"
      009B2D                          5         TNAME:
      009B2D CD 87 E3         [ 4] 4285         CALL     CNTXT   ;vocabulary link
      009B30 CD 85 64         [ 4] 4286 TNAM2:  CALL     AT
      009B33 CD 86 9A         [ 4] 4287         CALL     DUPP    ;?last word in a vocabulary
      009B36 CD 85 19         [ 4] 4288         CALL     QBRAN
      009B39 9B 54                 4289         .word      TNAM4
      009B3B CD 88 A8         [ 4] 4290         CALL     DDUP
      009B3E CD 92 78         [ 4] 4291         CALL     NAMET
      009B41 CD 87 20         [ 4] 4292         CALL     XORR    ;compare
      009B44 CD 85 19         [ 4] 4293         CALL     QBRAN
      009B47 9B 4E                 4294         .word      TNAM3
      009B49 CD 8B FC         [ 4] 4295         CALL     CELLM   ;continue with next word
      009B4C 20 E2            [ 2] 4296         JRA     TNAM2
      009B4E CD 86 AA         [ 4] 4297 TNAM3:  CALL     SWAPP
      009B51 CC 86 90         [ 2] 4298         JP     DROP
      009B54 CD 88 9D         [ 4] 4299 TNAM4:  CALL     DDROP
      009B57 CC 8C 84         [ 2] 4300         JP     ZERO
                                   4301 
                                   4302 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4303 ;       .ID     ( na -- )
                                   4304 ;        Display  name at address.
                                   4305 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001ADA                       4306         _HEADER DOTID,3,".ID"
      009B5A 9B 27                    1         .word LINK 
                           001ADC     2         LINK=.
      009B5C 03                       3         .byte 3  
      009B5D 2E 49 44                 4         .ascii ".ID"
      009B60                          5         DOTID:
      009B60 CD 88 4D         [ 4] 4307         CALL     QDUP    ;if zero no name
      009B63 CD 85 19         [ 4] 4308         CALL     QBRAN
      009B66 9B 76                 4309         .word      DOTI1
      009B68 CD 8D 47         [ 4] 4310         CALL     COUNT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



      009B6B CD 84 F0         [ 4] 4311         CALL     DOLIT
      009B6E 00 1F                 4312         .word      0x1F
      009B70 CD 86 F7         [ 4] 4313         CALL     ANDD    ;mask lexicon bits
      009B73 CC 9A 65         [ 2] 4314         JP     UTYPE
      009B76 CD 90 38         [ 4] 4315 DOTI1:  CALL     DOTQP
      009B79 09                    4316         .byte      9
      009B7A 20 6E 6F 4E 61 6D 65  4317         .ascii     " noName"
      009B81 81               [ 4] 4318         RET
                                   4319 
                           000000  4320 WANT_SEE=0
                           000000  4321 .if WANT_SEE 
                                   4322 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4323 ;       SEE     ( -- ; <string> )
                                   4324 ;       A simple decompiler.
                                   4325 ;       Updated for byte machines.
                                   4326 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4327         _HEADER SEE,3,"SEE"
                                   4328         CALL     TICK    ;starting address
                                   4329         CALL     CR
                                   4330         CALL     ONEM
                                   4331 SEE1:   CALL     ONEP
                                   4332         CALL     DUPP
                                   4333         CALL     AT
                                   4334         CALL     DUPP
                                   4335         CALL     QBRAN
                                   4336         .word    SEE2
                                   4337         CALL     TNAME   ;?is it a name
                                   4338 SEE2:   CALL     QDUP    ;name address or zero
                                   4339         CALL     QBRAN
                                   4340         .word    SEE3
                                   4341         CALL     SPACE
                                   4342         CALL     DOTID   ;display name
                                   4343         CALL     ONEP
                                   4344         JRA      SEE4
                                   4345 SEE3:   CALL     DUPP
                                   4346         CALL     CAT
                                   4347         CALL     UDOT    ;display number
                                   4348 SEE4:   CALL     NUFQ    ;user control
                                   4349         CALL     QBRAN
                                   4350         .word    SEE1
                                   4351         JP     DROP
                                   4352 .endif ; WANT_SEE 
                                   4353 
                                   4354 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4355 ;       WORDS   ( -- )
                                   4356 ;       Display names in vocabulary.
                                   4357 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001B02                       4358         _HEADER WORDS,5,"WORDS"
      009B82 9B 5C                    1         .word LINK 
                           001B04     2         LINK=.
      009B84 05                       3         .byte 5  
      009B85 57 4F 52 44 53           4         .ascii "WORDS"
      009B8A                          5         WORDS:
      009B8A CD 90 0B         [ 4] 4359         CALL     CR
      009B8D CD 87 E3         [ 4] 4360         CALL     CNTXT   ;only in context
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



      009B90 CD 85 64         [ 4] 4361 WORS1:  CALL     AT
      009B93 CD 88 4D         [ 4] 4362         CALL     QDUP    ;?at end of list
      009B96 CD 85 19         [ 4] 4363         CALL     QBRAN
      009B99 9B AC                 4364         .word      WORS2
      009B9B CD 86 9A         [ 4] 4365         CALL     DUPP
      009B9E CD 8F C8         [ 4] 4366         CALL     SPACE
      009BA1 CD 9B 60         [ 4] 4367         CALL     DOTID   ;display a name
      009BA4 CD 8B FC         [ 4] 4368         CALL     CELLM
      009BA7 CD 85 35         [ 4] 4369         CALL     BRAN
      009BAA 9B 90                 4370         .word      WORS1
      009BAC 81               [ 4] 4371 WORS2:  RET
                                   4372 
                                   4373         
                                   4374 ;; Hardware reset
                                   4375 
                                   4376 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4377 ;  COPYRIGTH
                                   4378 ; print copyright notice 
                                   4379 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      009BAD                       4380 COPYRIGHT:
      009BAD CD 90 38         [ 4] 4381     CALL DOTQP 
      009BB0 21                    4382     .byte 33 
      009BB1 4A 61 63 71 75 65 73  4383     .ascii "Jacques Deschenes, Copyright 2021"
             20 44 65 73 63 68 65
             6E 65 73 2C 20 43 6F
             70 79 72 69 67 68 74
             20 32 30 32 31
      009BD2 CC 90 0B         [ 2] 4384     JP CR 
                                   4385 
                                   4386 
                                   4387 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4388 ;  PRT_LICENCE 
                                   4389 ;  print GPLV2 licence 
                                   4390 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      009BD5                       4391 PRT_LICENCE:
      009BD5 CD 90 38         [ 4] 4392         CALL DOTQP 
      009BD8 0F                    4393         .byte  15 
      009BD9 4C 49 43 45 4E 43 45  4394         .ascii "LICENCE GPLV3\r\n"
             20 47 50 4C 56 33 0D
             0A
      009BE8 81               [ 4] 4395         RET 
                                   4396 
                                   4397 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4398 ;    PRINT_VERSION ( c1 c2 -- )
                                   4399 ;    c2 minor 
                                   4400 ;    c1 major 
                                   4401 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      009BE9                       4402 PRINT_VERSION:
      009BE9 CD 90 38         [ 4] 4403      CALL DOTQP 
      009BEC 09                    4404      .byte 9
      009BED 20 76 65 72 73 69 6F  4405      .ascii " version "
             6E 20
      009BF6 CD 8E 8C         [ 4] 4406      CALL BDIGS 
      009BF9 CD 8E C6         [ 4] 4407      CALL DIGS 
      009BFC CD 8E C6         [ 4] 4408      CALL DIGS 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



      001B7F                       4409      _DOLIT '.' 
      009BFF CD 84 F0         [ 4]    1     CALL DOLIT 
      009C02 00 2E                    2     .word '.' 
      009C04 CD 8E 9C         [ 4] 4410      CALL HOLD 
      001B87                       4411      _DROP 
      009C07 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      009C0A CD 8E C6         [ 4] 4412      CALL DIGS 
      009C0D CD 8E F1         [ 4] 4413      CALL EDIGS 
      009C10 CC 8F F2         [ 2] 4414      JP TYPES 
                                   4415       
                                   4416 
                                   4417 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4418 ;       hi      ( -- )
                                   4419 ;       Display sign-on message.
                                   4420 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001B93                       4421         _HEADER HI,2,"HI"
      009C13 9B 84                    1         .word LINK 
                           001B95     2         LINK=.
      009C15 02                       3         .byte 2  
      009C16 48 49                    4         .ascii "HI"
      009C18                          5         HI:
      009C18 CD 90 0B         [ 4] 4422         CALL     CR
      009C1B CD 90 38         [ 4] 4423         CALL     DOTQP   
      009C1E 0A                    4424         .byte      10
      009C1F 73 74 6D 38 65 46 6F  4425         .ascii     "stm8eForth"
             72 74 68
      001BA9                       4426 	_DOLIT VER 
      009C29 CD 84 F0         [ 4]    1     CALL DOLIT 
      009C2C 00 04                    2     .word VER 
      001BAE                       4427         _DOLIT EXT 
      009C2E CD 84 F0         [ 4]    1     CALL DOLIT 
      009C31 00 00                    2     .word EXT 
      009C33 CD 9B E9         [ 4] 4428         CALL PRINT_VERSION 
      009C36 CD 90 38         [ 4] 4429         CALL    DOTQP
                           000001  4430 .if NUCLEO          
      009C39 12                    4431         .byte 18
      009C3A 20 6F 6E 20 4E 55 43  4432         .ascii  " on NUCLEO-8S208RB"
             4C 45 4F 2D 38 53 32
             30 38 52 42
                                   4433 .endif
                           000000  4434 .if DISCOVERY
                                   4435         .byte 19
                                   4436         .ascii  " on STM8S-DISCOVERY"
                                   4437 .endif
                           000000  4438 .if DOORBELL
                                   4439         .byte 16
                                   4440         .ascii " on stm8s105k6b6"
                                   4441 .endif
      009C4C CC 90 0B         [ 2] 4442         JP     CR
                                   4443 
                           000000  4444 WANT_DEBUG=0
                           000000  4445 .if WANT_DEBUG 
                                   4446 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4447 ;       DEBUG      ( -- )
                                   4448 ;       Display sign-on message.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



                                   4449 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4450         _HEADER DEBUG,5,"DEBUG"
                                   4451 	CALL DOLIT
                                   4452 	.word 0x65
                                   4453 	CALL EMIT
                                   4454 	CALL ZERO
                                   4455  	CALL ZLESS 
                                   4456 	CALL DOLIT
                                   4457 	.word 0xFFFE
                                   4458 	CALL ZLESS 
                                   4459 	CALL UPLUS 
                                   4460  	_DROP 
                                   4461 	CALL DOLIT
                                   4462 	.word 3
                                   4463 	CALL UPLUS 
                                   4464 	CALL UPLUS 
                                   4465  	_DROP
                                   4466 	CALL DOLIT
                                   4467 	.word 0x43
                                   4468 	CALL UPLUS 
                                   4469  	_DROP
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
                                   4492 	CALL ANDD 
                                   4493 	CALL ANDD
                                   4494 	CALL DOLIT
                                   4495 	.word 0x70
                                   4496 	CALL UPLUS 
                                   4497 	_DROP
                                   4498 	CALL EMIT
                                   4499 	CALL ZERO
                                   4500 	CALL QBRAN
                                   4501 	.word DEBUG1
                                   4502 	CALL DOLIT
                                   4503 	.word 0x3F
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



                                   4504 DEBUG1:
                                   4505 	CALL DOLIT
                                   4506 	.word 0xFFFF
                                   4507 	CALL QBRAN
                                   4508 	.word DEBUG2
                                   4509 	CALL DOLIT
                                   4510 	.word 0x74
                                   4511 	CALL BRAN
                                   4512 	.word DEBUG3
                                   4513 DEBUG2:
                                   4514 	CALL DOLIT
                                   4515 	.word 0x21
                                   4516 DEBUG3:
                                   4517 	CALL EMIT
                                   4518 	CALL DOLIT
                                   4519 	.word 0x68
                                   4520 	CALL DOLIT
                                   4521 	.word 0x80
                                   4522 	CALL STORE
                                   4523 	CALL DOLIT
                                   4524 	.word 0x80
                                   4525 	CALL AT
                                   4526 	CALL EMIT
                                   4527 	CALL DOLIT
                                   4528 	.word 0x4D
                                   4529 	CALL TOR
                                   4530 	CALL RAT
                                   4531 	CALL RFROM
                                   4532 	CALL ANDD
                                   4533 	CALL EMIT
                                   4534 	CALL DOLIT
                                   4535 	.word 0x61
                                   4536 	CALL DOLIT
                                   4537 	.word 0xA
                                   4538 	CALL TOR
                                   4539 DEBUG4:
                                   4540 	CALL ONE
                                   4541 	CALL UPLUS 
                                   4542 	_DROP
                                   4543 	CALL DONXT
                                   4544 	.word DEBUG4
                                   4545 	CALL EMIT
                                   4546 	CALL DOLIT
                                   4547 	.word 0x656D
                                   4548 	CALL DOLIT
                                   4549 	.word 0x100
                                   4550 	CALL UMSTA
                                   4551 	CALL SWAPP
                                   4552 	CALL DOLIT
                                   4553 	.word 0x100
                                   4554 	CALL UMSTA
                                   4555 	CALL SWAPP 
                                   4556 	_DROP
                                   4557 	CALL EMIT
                                   4558 	CALL EMIT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



                                   4559 	CALL DOLIT
                                   4560 	.word 0x2043
                                   4561 	CALL ZERO
                                   4562 	CALL DOLIT
                                   4563 	.word 0x100
                                   4564 	CALL UMMOD
                                   4565 	CALL EMIT
                                   4566 	CALL EMIT
                                   4567 	;JP ORIG
                                   4568 	RET
                                   4569 .endif ; WANT_DEBUG 
                                   4570 
                                   4571 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4572 ;       'BOOT   ( -- a )
                                   4573 ;       The application startup vector.
                                   4574 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001BCF                       4575         _HEADER TBOOT,5,"'BOOT"
      009C4F 9C 15                    1         .word LINK 
                           001BD1     2         LINK=.
      009C51 05                       3         .byte 5  
      009C52 27 42 4F 4F 54           4         .ascii "'BOOT"
      009C57                          5         TBOOT:
      009C57 CD 87 50         [ 4] 4576         CALL     DOVAR
      009C5A 40 02                 4577         .word    APP_RUN      ;application to boot
                                   4578 
                                   4579 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4580 ;       COLD    ( -- )
                                   4581 ;       The hilevel cold start s=ence.
                                   4582 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001BDC                       4583         _HEADER COLD,4,"COLD"
      009C5C 9C 51                    1         .word LINK 
                           001BDE     2         LINK=.
      009C5E 04                       3         .byte 4  
      009C5F 43 4F 4C 44              4         .ascii "COLD"
      009C63                          5         COLD:
                           000000  4584 .if WANT_DEBUG
                                   4585         CALL DEBUG
                                   4586 .endif ; WANT_DEBUG
      009C63 CD 84 F0         [ 4] 4587 COLD1:  CALL     DOLIT
      009C66 80 AB                 4588         .word      UZERO
      009C68 CD 84 F0         [ 4] 4589 	CALL     DOLIT
      009C6B 00 06                 4590         .word      UPP
      009C6D CD 84 F0         [ 4] 4591         CALL     DOLIT
      009C70 00 1C                 4592 	.word      UEND-UZERO
      009C72 CD 8D AB         [ 4] 4593         CALL     CMOVE   ;initialize user area
                           000001  4594 .if WANT_FLOAT 
      009C75 CD AD 0D         [ 4] 4595         CALL    FINIT 
                                   4596 .endif 
                                   4597 ; if APP_RUN==0 initialize with ca de 'hi'  
      009C78 90 CE 40 02      [ 2] 4598         ldw y,APP_RUN 
      009C7C 26 0B            [ 1] 4599         jrne 0$
      009C7E 1D 00 02         [ 2] 4600         subw x,#CELLL 
      009C81 90 AE 9C 18      [ 2] 4601         ldw y,#HI  
      009C85 FF               [ 2] 4602         ldw (x),y
      009C86 CD 9D 81         [ 4] 4603         call UPDATRUN 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



      009C89                       4604 0$:        
                                   4605 ; update LAST with APP_LAST 
                                   4606 ; if APP_LAST > LAST else do the opposite
      009C89 90 CE 40 00      [ 2] 4607         ldw y,APP_LAST 
      009C8D 90 B3 1C         [ 2] 4608         cpw y,ULAST 
      009C90 22 05            [ 1] 4609         jrugt 1$ 
                                   4610 ; save LAST at APP_LAST  
      009C92 CD 9D 69         [ 4] 4611         call UPDATLAST 
      009C95 20 06            [ 2] 4612         jra 2$
      009C97                       4613 1$: ; update LAST with APP_LAST 
      009C97 90 BF 1C         [ 2] 4614         ldw ULAST,y
      009C9A 90 BF 16         [ 2] 4615         ldw UCNTXT,y
      009C9D                       4616 2$:  
                                   4617 ; update APP_CP if < app_space 
      009C9D 90 CE 40 04      [ 2] 4618         ldw y,APP_CP  
      009CA1 90 B3 1A         [ 2] 4619         cpw y,UCP   
      009CA4 24 06            [ 1] 4620         jruge 3$ 
      009CA6 CD 9D 92         [ 4] 4621         call UPDATCP
      009CA9 90 BE 1A         [ 2] 4622         ldw y,UCP   
      009CAC                       4623 3$:
      009CAC 90 BF 1A         [ 2] 4624         ldw UCP,y                 
                                   4625 ; update UVP with APP_VP  
                                   4626 ; if APP_VP>UVP else do the opposite 
      009CAF 90 CE 40 06      [ 2] 4627         ldw y,APP_VP 
      009CB3 90 B3 18         [ 2] 4628         cpw y,UVP 
      009CB6 22 05            [ 1] 4629         jrugt 4$
      009CB8 CD 9D A9         [ 4] 4630         call UPDATVP 
      009CBB 20 03            [ 2] 4631         jra 6$
      009CBD                       4632 4$: ; update UVP with APP_VP 
      009CBD 90 BF 18         [ 2] 4633         ldw UVP,y 
      009CC0                       4634 6$:      
      009CC0 CD 95 58         [ 4] 4635         CALL     PRESE   ;initialize data stack and TIB
      009CC3 CD 9C 57         [ 4] 4636         CALL     TBOOT
      009CC6 CD 8D 94         [ 4] 4637         CALL     ATEXE   ;application boot
      009CC9 CD 98 3D         [ 4] 4638         CALL     OVERT
      009CCC CC 95 75         [ 2] 4639         JP     QUIT    ;start interpretation
                                   4640 
                                   4641 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]



                                   4642         .include "flash.asm"
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
      009D69 CD 88 0F         [ 4]  137 	call LAST
      009D6C CD 85 64         [ 4]  138 	call AT  
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
      009D92 CD 87 FF         [ 4]  163 	call CPP 
      009D95 CD 85 64         [ 4]  164 	call AT 
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
      009DA9 CD 87 F1         [ 4]  177 	call VPP 
      009DAC CD 85 64         [ 4]  178 	call AT
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
      009EBE CD 84 E4         [ 4]  368 	call FC_XOFF
      009EC1 90 93            [ 1]  369 	ldw y,x 
      009EC3 90 FE            [ 2]  370 	ldw y,(y)
      009EC5 1C 00 02         [ 2]  371 	addw x,#CELLL 
      009EC8 90 9F            [ 1]  372 	ld a,yl
      009ECA 92 BD 00 34      [ 4]  373 	ldf [FPTR],a
      009ECE 72 05 50 5F FB   [ 2]  374 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009ED3 CD 84 CE         [ 4]  375 	call FC_XON
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
      009EE3 CD 84 E4         [ 4]  390 	call FC_XOFF
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
      009F06 CD 84 CE         [ 4]  401 	call FC_XON
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
      009F89 CD 84 E4         [ 4]  486 	call FC_XOFF
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]



      009F8C CD 9C D5         [ 4]  487 	call FPSTOR
                                    488 ;code must be execute from RAM 
                                    489 ;copy routine to PAD 
      009F8F 1D 00 02         [ 2]  490 	subw x,#CELLL 
      009F92 90 AE 9F E2      [ 2]  491 	ldw y,#row_erase_proc
      009F96 FF               [ 2]  492 	ldw (x),y 
      009F97 CD 8D 6F         [ 4]  493 	call PAD 
      009F9A 90 AE A0 09      [ 2]  494 	ldw y,#row_erase_proc_end 
      009F9E 72 A2 9F E2      [ 2]  495 	subw y,#row_erase_proc
      009FA2 1D 00 02         [ 2]  496 	subw x,#CELLL 
      009FA5 FF               [ 2]  497 	ldw (x),y 
      009FA6 CD 8D AB         [ 4]  498 	call CMOVE 
      009FA9                        499 block_erase:
      009FA9 90 BE 35         [ 2]  500 	ldw y,FPTR+1
      009FAC 90 A3 B6 80      [ 2]  501 	cpw y,#app_space 
      009FB0 2A 19            [ 1]  502 	jrpl erase_flash 
                                    503 ; erase EEPROM block
      009FB2 90 A3 40 00      [ 2]  504 	cpw y,#EEPROM_BASE 
      009FB6 24 04            [ 1]  505 	jruge 1$
      009FB8 CD 84 CE         [ 4]  506 	call FC_XON
      009FBB 81               [ 4]  507 	ret ; bad address 
      009FBC 90 A3 47 FF      [ 2]  508 1$: cpw y,#EEPROM_END 
      009FC0 23 04            [ 2]  509 	jrule 2$ 
      009FC2 CD 84 CE         [ 4]  510 	call FC_XON
      009FC5 81               [ 4]  511 	ret ; bad address 
      009FC6                        512 2$:	
      009FC6 CD 9D D5         [ 4]  513 	call UNLKEE 
      009FC9 20 03            [ 2]  514 	jra proceed_erase
                                    515 ; erase flash block:
      009FCB                        516 erase_flash:
      009FCB CD 9D F4         [ 4]  517 	call UNLKFL 
      009FCE                        518 proceed_erase:
      009FCE CD 8D 6F         [ 4]  519 	call PAD 
      009FD1 90 93            [ 1]  520 	ldw y,x
      009FD3 90 FE            [ 2]  521 	ldw y,(y)
      009FD5 1C 00 02         [ 2]  522 	addw x,#CELLL  
      009FD8 90 FD            [ 4]  523 	call (y) 
      009FDA 72 17 50 5F      [ 1]  524 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      009FDE CD 84 CE         [ 4]  525 	call FC_XON
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
      00A040 CD 8D AB         [ 4]  587 	call CMOVE 
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
      00A04D CD 84 E4         [ 4]  602 	call FC_XOFF
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
      00A06F CD 84 CE         [ 4]  618 	call FC_XON 
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
      00A0AC CD 88 A8         [ 4]  663 1$:	call DDUP 
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
      00A0CC CD 88 A8         [ 4]  676 	call DDUP    ; ( 0 1 0 1 -- )  
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
      00A0F0 CD 86 9A         [ 4]  693 	call DUPP  
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
      00A274 CD 87 9E         [ 4]  920 	call TBUF ; ( ud rb -- )
      00A277 CD 88 5E         [ 4]  921 	call ROT 
      00A27A CD 88 5E         [ 4]  922 	call ROT  ; ( rb ud -- )
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
      00A2D2 CD 86 AA         [ 4]  982 	call SWAPP ;  ( ud a ra u -- )
      00A2D5 CD 85 B5         [ 4]  983 	call RFROM  
      00A2D8 CD A2 89         [ 4]  984 	call RFREE 
      00A2DB CD 8A 00         [ 4]  985 	call MIN
      00A2DE CD 86 9A         [ 4]  986 	call DUPP 
      00A2E1 CD 86 63         [ 4]  987 	call TOR  
      00A2E4 CD 8D AB         [ 4]  988 	call CMOVE
      00A2E7 CD A2 74         [ 4]  989 	call BUF2ROW 
      00A2EA CD 85 B5         [ 4]  990 	call RFROM 
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
      00A2F6 CC 8C 84         [ 2] 1004 	jp ZERO 
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
      00A301 CD 87 B0         [ 4] 1025 	call TFLASH 
      00A304 CD 85 64         [ 4] 1026 	CALL AT 
      00A307 CD 85 19         [ 4] 1027 	CALL QBRAN 
      00A30A A3 85                 1028 	.word no_move  
      00A30C CD 87 FF         [ 4] 1029 	call CPP
      00A30F CD 85 64         [ 4] 1030 	call AT  
      00A312 CD 86 9A         [ 4] 1031 	call DUPP ; ( udl udl -- )
      00A315 CD 87 E3         [ 4] 1032 	call CNTXT 
      00A318 CD 85 64         [ 4] 1033 	call AT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 127.
Hexadecimal [24-Bits]



      00A31B CD 84 F0         [ 4] 1034 	call DOLIT 
      00A31E 00 02                 1035 	.word 2 
      00A320 CD 89 53         [ 4] 1036 	call SUBB ; ( udl udl a -- )
      00A323 CD 86 AA         [ 4] 1037 	call SWAPP 
      00A326 CD A2 F6         [ 4] 1038 	call FADDR 
      00A329 CD 88 5E         [ 4] 1039 	call ROT  ; ( udl ud a -- )
      00A32C CD 86 9A         [ 4] 1040 	call DUPP 
      00A32F CD 86 63         [ 4] 1041 	call TOR    ; R: a 
      00A332                       1042 FMOVE2: 
      00A332 CD 8D 5E         [ 4] 1043 	call HERE 
      00A335 CD 85 C6         [ 4] 1044 	call RAT 
      00A338 CD 89 53         [ 4] 1045 	call SUBB ; (udl ud a wl -- )
      00A33B                       1046 next_row:
      00A33B CD 86 9A         [ 4] 1047 	call DUPP 
      00A33E CD 86 63         [ 4] 1048 	call TOR  ; ( udl ud a wl -- ) R: a wl
      00A341 CD A2 A2         [ 4] 1049 	call RAM2EE ; ( udl a u -- udl u2 ) u2 is byte written to FLASH 
      00A344 CD 86 9A         [ 4] 1050 	call DUPP 
      00A347 CD 86 63         [ 4] 1051 	call TOR
      00A34A CD 88 BD         [ 4] 1052 	call PLUS  ; ( udl+ ) 
      00A34D CD 86 9A         [ 4] 1053 	call DUPP 
      00A350 CD 8C 84         [ 4] 1054 	call ZERO   ; ( udl+ ud -- )
      00A353 CD 85 B5         [ 4] 1055 	call RFROM  ; ( udl+ ud u2  R: a wl ) 
      00A356 CD 85 B5         [ 4] 1056 	call RFROM  ; ( udl+ ud u2 wl R: a ) 
      00A359 CD 86 C2         [ 4] 1057 	call OVER   ; ( udl+ ud u2 wl u2 -- )
      00A35C CD 89 53         [ 4] 1058 	call SUBB  ; ( udl+ ud u2 wl- R: a )
      00A35F CD 86 9A         [ 4] 1059 	call DUPP 
      00A362 CD 85 19         [ 4] 1060 	call QBRAN
      00A365 A3 7E                 1061 	.word fmove_done 
      00A367 CD 86 AA         [ 4] 1062 	call SWAPP  ; ( udl+ ud wl- u2 R: a )
      00A36A CD 85 B5         [ 4] 1063 	call RFROM ; ( udl+ ud wl- u2 a -- ) 
      00A36D CD 88 BD         [ 4] 1064 	call PLUS  ; ( udl+2 ud wl- a+ )
      00A370 CD 86 9A         [ 4] 1065 	call DUPP 
      00A373 CD 86 63         [ 4] 1066 	call TOR   ; ( udl+2 ud wl- a+ ) R: a+
      00A376 CD 86 AA         [ 4] 1067 	call SWAPP 
      00A379 CD 85 35         [ 4] 1068 	call BRAN
      00A37C A3 3B                 1069 	.word next_row  
      00A37E                       1070 fmove_done:	
      00A37E CD 85 B5         [ 4] 1071 	call RFROM  ; ( -- udl+ ud u2 wl- a  )
      00A381 1C 00 0A         [ 2] 1072 	addw x,#5*CELLL ; (  -- cp+ ) new CP 
      00A384 81               [ 4] 1073  	ret  
      00A385                       1074 no_move:
      00A385 CD 8C 84         [ 4] 1075 	call ZERO
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
      00A39B CD 85 64         [ 4] 1091 	call AT
      00A39E CD 87 F1         [ 4] 1092 	call VPP 
      00A3A1 CD 85 52         [ 4] 1093 	call STORE
                                   1094 ;update CONTEXT and LAST 
      00A3A4 CD 9D 39         [ 4] 1095 	call EEPCP 
      002327                       1096 	_DROP
      00A3A7 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00A3AA CD 85 64         [ 4] 1097 	call AT
      00A3AD CD 84 F0         [ 4] 1098 	call DOLIT 
      00A3B0 00 02                 1099 	.word 2 
      00A3B2 CD 88 BD         [ 4] 1100 	call PLUS 
      00A3B5 CD 86 9A         [ 4] 1101 	call DUPP 
      00A3B8 CD 87 E3         [ 4] 1102 	call CNTXT 
      00A3BB CD 85 52         [ 4] 1103 	call STORE
      00A3BE CD 88 0F         [ 4] 1104 	call LAST
      00A3C1 CD 85 52         [ 4] 1105 	call STORE 
      00A3C4 CD 9D 69         [ 4] 1106 	call UPDATLAST 
                                   1107 ;update CP 
      00A3C7 CD 87 FF         [ 4] 1108 	call CPP 
      00A3CA CD 85 52         [ 4] 1109 	call STORE
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
      00A3DA CD 87 B0         [ 4] 1122 	call TFLASH 
      00A3DD CD 85 64         [ 4] 1123 	CALL AT 
      00A3E0 CD 85 19         [ 4] 1124 	CALL QBRAN 
      00A3E3 A3 85                 1125 	.word no_move 
      00A3E5 CD 87 FF         [ 4] 1126 	call CPP 
      00A3E8 CD 85 64         [ 4] 1127 	call AT 
      00A3EB CD 86 9A         [ 4] 1128 	call DUPP ; ( udl udl -- )
      00A3EE CD 9D 4F         [ 4] 1129 	call EEPVP 
      002371                       1130 	_DROP
      00A3F1 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00A3F4 CD 85 64         [ 4] 1131 	call AT  ; ( udl udl a )
      00A3F7 CD 86 63         [ 4] 1132 	call TOR 
      00A3FA CD A2 F6         [ 4] 1133 	call FADDR
      00A3FD CD 85 C6         [ 4] 1134 	call RAT ; ( udl ud a -- ) R: a 
      00A400 CC A3 32         [ 2] 1135 	jp FMOVE2 
                                   1136 
                                   1137 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 129.
Hexadecimal [24-Bits]



                           000001  4643 .if WANT_SCALING_CONST 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 130.
Hexadecimal [24-Bits]



                                   4644         .include "const_ratio.asm"
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



                                   4645 .endif
                           000001  4646 .if WANT_CONST_TABLE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 134.
Hexadecimal [24-Bits]



                                   4647         .include "ctable.asm"
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
      00A4BD CD 87 FF         [ 4]   39     CALL CPP
      00A4C0 CD 86 9A         [ 4]   40     CALL DUPP 
      00A4C3 CD 85 64         [ 4]   41     CALL AT 
      00A4C6 CD 86 63         [ 4]   42     CALL TOR 
      00A4C9 CD 8C F4         [ 4]   43     CALL PSTOR 
      00A4CC CD 9D 92         [ 4]   44     CALL UPDATCP 
      00A4CF CD 85 B5         [ 4]   45     CALL RFROM
      00A4D2 CC 8C 84         [ 2]   46     JP ZERO 
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
      00A4ED CD 8C 0B         [ 4]   74     CALL CELLS  
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
      00A514 CD 8C 0B         [ 4]  105     call CELLS 
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
      00A52D CD 8C 84         [ 4]  122     CALL ZERO 
      00A530 CD 8C 18         [ 4]  123 1$: CALL ONEP 
      00A533 CD 86 9A         [ 4]  124     CALL DUPP 
      00A536 CD A5 83         [ 4]  125     CALL INTQ 
      00A539 CD 85 19         [ 4]  126     CALL QBRAN 
      00A53C A5 46                  127     .word 2$
      00A53E CD 9E BE         [ 4]  128     call WR_BYTE 
      00A541 CD 85 35         [ 4]  129     CALL BRAN 
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
      00A55C CD 8C 84         [ 4]  147     CALL ZERO 
      00A55F CD 8C 18         [ 4]  148 1$: CALL ONEP 
      00A562 CD 86 9A         [ 4]  149     CALL DUPP
      00A565 CD A5 83         [ 4]  150     CALL INTQ
      00A568 CD 85 19         [ 4]  151     CALL QBRAN 
      00A56B A5 75                  152     .word 2$
      00A56D CD 9E E3         [ 4]  153     call WR_WORD 
      00A570 CD 85 35         [ 4]  154     CALL BRAN 
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
      00A583 CD 90 0B         [ 4]  171     CALL CR 
      00A586 CD 84 F0         [ 4]  172     call DOLIT 
      00A589 00 5B                  173     .word '[
      00A58B CD 84 B7         [ 4]  174     CALL EMIT 
      00A58E CD 90 B1         [ 4]  175     CALL DOT 
      00A591 CD 90 38         [ 4]  176     CALL  DOTQP
      00A594 03                     177     .byte 3
      00A595 5D 3F 20               178     .ascii "]? " 
      00A598 CD 94 3F         [ 4]  179     CALL QUERY 
      00A59B CD 92 6A         [ 4]  180     call TOKEN 
      00A59E CC A6 5D         [ 2]  181     jp NUMBQ
                                    182 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 138.
Hexadecimal [24-Bits]



                                   4648 .endif
                           000001  4649 .if WANT_DOUBLE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 139.
Hexadecimal [24-Bits]



                                   4650         .include "double.asm"
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
      00A5AB CD 90 0B         [ 4]   36     CALL CR 
      00A5AE CD 90 38         [ 4]   37     CALL DOTQP 
      00A5B1 18                      38     .byte  24 
      00A5B2 64 6F 75 62 6C 65 20    39     .ascii "double integer library, "
             69 6E 74 65 67 65 72
             20 6C 69 62 72 61 72
             79 2C 20
      00A5CA CD 9B D5         [ 4]   40     CALL PRT_LICENCE
      00A5CD CD 9B AD         [ 4]   41     CALL COPYRIGHT  
      002550                         42     _DOLIT DVER_MAJOR 
      00A5D0 CD 84 F0         [ 4]    1     CALL DOLIT 
      00A5D3 00 01                    2     .word DVER_MAJOR 
      002555                         43     _DOLIT DVER_MINOR  
      00A5D5 CD 84 F0         [ 4]    1     CALL DOLIT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 140.
Hexadecimal [24-Bits]



      00A5D8 00 00                    2     .word DVER_MINOR 
      00A5DA CC 9B E9         [ 2]   44     JP PRINT_VERSION  
                                     45 
                                     46 
                                     47 ; check for negative sign 
                                     48 ; ajust pointer and cntr 
      00A5DD                         49 nsign: ; ( addr cntr -- addr cntr f ) 
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
      00A60A CD 86 9A         [ 4]   80     CALL DUPP 
      00258D                         81     _QBRAN parse_d5  
      00A60D CD 85 19         [ 4]    1     CALL QBRAN
      00A610 A6 52                    2     .word parse_d5
      00A612 CD 86 63         [ 4]   82     CALL TOR   ; dlo dhi a R: cntr 
      00A615 CD 8D 47         [ 4]   83     CALL COUNT ; dlo dhi a+ char 
      00A618 CD 87 60         [ 4]   84     CALL BASE 
      00A61B CD 85 64         [ 4]   85     CALL AT 
      00A61E CD 8F 50         [ 4]   86     CALL DIGTQ 
      0025A1                         87     _QBRAN parse_d4 ; not a digit
      00A621 CD 85 19         [ 4]    1     CALL QBRAN
      00A624 A6 46                    2     .word parse_d4
      00A626 CD A9 9D         [ 4]   88     CALL DTOR  ; dlo dhi R: cntr a+ c  
      00A629 CD 87 60         [ 4]   89     CALL BASE 
      00A62C CD 85 64         [ 4]   90     CALL AT 
      00A62F CD A8 28         [ 4]   91     CALL DSSTAR
      00A632 CD 85 B5         [ 4]   92     CALL RFROM 
      00A635 CD 8C 84         [ 4]   93     CALL ZERO 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 141.
Hexadecimal [24-Bits]



      00A638 CD AC 4C         [ 4]   94     CALL DPLUS 
      00A63B CD 85 B5         [ 4]   95     CALL RFROM  ; dlo dhi a+ 
      00A63E CD 85 B5         [ 4]   96     CALL RFROM ; dlo dhi a+ cntr 
      00A641 CD 8C 25         [ 4]   97     CALL ONEM 
      00A644 20 C4            [ 2]   98     JRA parse_digits ; dlo dhi a+ R: 
      00A646                         99 parse_d4:
      00A646 90 93            [ 1]  100     LDW Y,X 
      00A648 90 EE 02         [ 2]  101     LDW Y,(2,Y)
      00A64B 90 5A            [ 2]  102     DECW Y  ; dec(a)
      00A64D EF 02            [ 2]  103     LDW (2,X),Y 
      00A64F 90 85            [ 2]  104     POPW Y 
      00A651 FF               [ 2]  105     LDW (X),Y ; dlo dhi a cntr  
      00A652                        106 parse_d5:
      00A652 81               [ 4]  107     RET 
                                    108 
                                    109 
                                    110 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    111 ;   NUMBER? (a -- s -1 |d -2 | a F )
                                    112 ;   convert string to integer 
                                    113 ;   double begin with '#' 
                                    114 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0025D3                        115     _HEADER NUMBQ,7,"NUMBER?"
      00A653 A5 A3                    1         .word LINK 
                           0025D5     2         LINK=.
      00A655 07                       3         .byte 7  
      00A656 4E 55 4D 42 45 52 3F     4         .ascii "NUMBER?"
      00A65D                          5         NUMBQ:
                                    116 ; save current base value 
      00A65D CD 87 60         [ 4]  117     CALL BASE 
      00A660 CD 85 64         [ 4]  118     CALL AT 
      00A663 CD 86 63         [ 4]  119     CALL TOR  ; R: base 
                                    120 ; initialize integer to 0     
      00A666 1D 00 04         [ 2]  121     SUBW X,#4 ; create space for a double  
      00A669 90 5F            [ 1]  122     CLRW Y 
      00A66B FF               [ 2]  123     LDW (X),Y 
      00A66C EF 02            [ 2]  124     LDW (2,X),Y ; a 0 0 R: base  
      0025EE                        125     _DOLIT 2 
      00A66E CD 84 F0         [ 4]    1     CALL DOLIT 
      00A671 00 02                    2     .word 2 
      00A673 CD 8C DD         [ 4]  126     CALL PICK  ; a 0 0 a R: base    
      00A676 CD 8D 47         [ 4]  127     CALL COUNT ; a 0 0 a+ n 
                                    128 ; check for '#' double integer 
      00A679 CD 86 C2         [ 4]  129     CALL OVER  ; a 0 0 a+ n a+
      00A67C CD 85 82         [ 4]  130     CALL CAT   ; a 0 0 a+ n c 
      0025FF                        131     _DOLIT '#' ; a 0 0 a+ n c '#' 
      00A67F CD 84 F0         [ 4]    1     CALL DOLIT 
      00A682 00 23                    2     .word '#' 
      00A684 CD 89 7B         [ 4]  132     CALL EQUAL 
      00A687 CD 86 63         [ 4]  133     CALL TOR   ; a 0 0 a+ n R: base d? 
      00A68A CD 85 C6         [ 4]  134     CALL RAT   ; a 0 0 a+ n d? R: base d?
      00260D                        135     _QBRAN NUMQ0
      00A68D CD 85 19         [ 4]    1     CALL QBRAN
      00A690 A6 9E                    2     .word NUMQ0
                                    136 ; update a and count
      00A692 CD 86 AA         [ 4]  137     CALL SWAPP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 142.
Hexadecimal [24-Bits]



      00A695 CD 8C 18         [ 4]  138     CALL ONEP 
      00A698 CD 86 AA         [ 4]  139     CALL SWAPP 
      00A69B CD 8C 25         [ 4]  140     CALL ONEM  ; a 0 0 a+ n- R: base d?
                                    141 ; check for '$' hexadecimal  
      00A69E                        142 NUMQ0: 
      00A69E CD 86 C2         [ 4]  143     CALL OVER   
      00A6A1 CD 85 82         [ 4]  144     CALL CAT   
      002624                        145     _DOLIT '$'
      00A6A4 CD 84 F0         [ 4]    1     CALL DOLIT 
      00A6A7 00 24                    2     .word '$' 
      00A6A9 CD 89 7B         [ 4]  146     CALL EQUAL ; a 0 0 a+ n- f  
      00262C                        147     _QBRAN NUMQ1 
      00A6AC CD 85 19         [ 4]    1     CALL QBRAN
      00A6AF A6 C8                    2     .word NUMQ1
      00A6B1 CD 8F 27         [ 4]  148     CALL HEX   ; switch to hexadecimal base 
                                    149 ; update a and count 
      00A6B4 CD 86 AA         [ 4]  150     CALL SWAPP 
      00A6B7 CD 8C 18         [ 4]  151     CALL ONEP 
      00A6BA CD 86 AA         [ 4]  152     CALL SWAPP
      00A6BD CD 8C 25         [ 4]  153     CALL ONEM ; a 0 0 a+ n-  R: base d?
      00A6C0 CD 88 4D         [ 4]  154     CALL QDUP 
      002643                        155     _QBRAN NUMQ6 
      00A6C3 CD 85 19         [ 4]    1     CALL QBRAN
      00A6C6 A7 1D                    2     .word NUMQ6
                                    156 ; check for minus sign 
      00A6C8                        157 NUMQ1: 
      00A6C8 CD A5 DD         [ 4]  158     CALL nsign 
      00A6CB CD 86 63         [ 4]  159     CALL TOR ; R: base d? sign  
                                    160 ; check for end of string     
      00A6CE CD 88 4D         [ 4]  161     CALL QDUP    ; a dlo dhi a+ cntr R: base d? sign 
      002651                        162     _QBRAN NUMQ5 ; yes , not a number 
      00A6D1 CD 85 19         [ 4]    1     CALL QBRAN
      00A6D4 A7 1B                    2     .word NUMQ5
      00A6D6 CD A6 0A         [ 4]  163     CALL parse_digits
      00A6D9 CD 88 4D         [ 4]  164     CALL QDUP 
      00A6DC CD 86 E3         [ 4]  165     CALL ZEQUAL  
      00265F                        166     _QBRAN NUMQ4 ; error not end of string  ( a dlo dhi a+ R: base d? sign )
      00A6DF CD 85 19         [ 4]    1     CALL QBRAN
      00A6E2 A7 10                    2     .word NUMQ4
      002664                        167     _DROP  ; a dlo dhi 
      00A6E4 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00A6E7 CD 85 B5         [ 4]  168     CALL RFROM  ; a dlo dhi sign 
      00266A                        169     _QBRAN NUMQ3
      00A6EA CD 85 19         [ 4]    1     CALL QBRAN
      00A6ED A6 F2                    2     .word NUMQ3
      00A6EF CD 89 19         [ 4]  170     CALL DNEGA
      00A6F2                        171 NUMQ3: 
      00A6F2 CD 88 5E         [ 4]  172     CALL ROT ; dlo dhi a  R: base d?
      002675                        173     _DROP
      00A6F5 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      002678                        174     _DOLIT -2  ; double return -2 flag 
      00A6F8 CD 84 F0         [ 4]    1     CALL DOLIT 
      00A6FB FF FE                    2     .word -2 
      00A6FD CD 85 B5         [ 4]  175     CALL RFROM ; dlo dhi d? R: base 
      002680                        176     _TBRAN NUMQ8 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 143.
Hexadecimal [24-Bits]



      00A700 CD 85 27         [ 4]    1     CALL TBRAN 
      00A703 A7 25                    2     .word NUMQ8 
      00A705 CD 86 AA         [ 4]  177     CALL SWAPP 
      002688                        178     _DROP
      00A708 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00A70B CD 8C 18         [ 4]  179     CALL ONEP   ; single return -1 flag   
      00A70E 20 15            [ 2]  180     JRA NUMQ8
      00A710                        181 NUMQ4: ; not end of string error , ( a dlo dhi a+ cntr R: base d? sign )
                           000001   182 .if WANT_FLOAT
      00A710 CD 85 B5         [ 4]  183     CALL RFROM ; sign 
      00A713 CD 85 B5         [ 4]  184     CALL RFROM ; d? 
      00A716 CD B0 1B         [ 4]  185     CALL FLOATQ ; ( a dlo dhi a+ cntr sign d? )
      00A719 20 0A            [ 2]  186     JRA NUMQ8 
                                    187 .endif 
      00A71B                        188 NUMQ5: 
      00A71B 5B 02            [ 2]  189     ADDW SP,#2
      00A71D                        190 NUMQ6:    
      00A71D 5B 02            [ 2]  191     ADDW SP,#2 
      00A71F 1C 00 04         [ 2]  192     ADDW X,#4 
      00A722 90 5F            [ 1]  193     CLRW Y 
      00A724 FF               [ 2]  194     LDW (X),Y 
      00A725                        195 NUMQ8: 
      00A725 CD 85 B5         [ 4]  196     CALL RFROM 
      00A728 CD 87 60         [ 4]  197     CALL BASE 
      00A72B CC 85 52         [ 2]  198     JP STORE 
                                    199      
                                    200 
                                    201 
                                    202 
                                    203 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    204 ;   DABS ( d -- d )
                                    205 ;   absolute value of double
                                    206 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0026AE                        207     _HEADER DABS,4,"DABS"
      00A72E A6 55                    1         .word LINK 
                           0026B0     2         LINK=.
      00A730 04                       3         .byte 4  
      00A731 44 41 42 53              4         .ascii "DABS"
      00A735                          5         DABS:
      00A735 F6               [ 1]  208     LD A,(X) 
      00A736 A4 80            [ 1]  209     AND A,#0X80 
      00A738 27 03            [ 1]  210     JREQ DABS1 
      00A73A CC 89 19         [ 2]  211     JP DNEGA 
      00A73D                        212 DABS1:
      00A73D 81               [ 4]  213     RET 
                                    214 
                                    215 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    216 ;  DSIGN ( d -- d f )
                                    217 ;  sign of double 
                                    218 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0026BE                        219     _HEADER DSIGN,5,"DSIGN"
      00A73E A7 30                    1         .word LINK 
                           0026C0     2         LINK=.
      00A740 05                       3         .byte 5  
      00A741 44 53 49 47 4E           4         .ascii "DSIGN"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 144.
Hexadecimal [24-Bits]



      00A746                          5         DSIGN:
      00A746 A6 00            [ 1]  220     LD A,#0 
      00A748 90 93            [ 1]  221     LDW Y,X 
      00A74A 90 FE            [ 2]  222     LDW Y,(Y)
      00A74C 2A 02            [ 1]  223     JRPL DSIGN1
      00A74E A6 FF            [ 1]  224     LD A,#0XFF 
      00A750                        225 DSIGN1:
      00A750 1D 00 02         [ 2]  226     SUBW X,#2 
      00A753 F7               [ 1]  227     LD (X),A 
      00A754 E7 01            [ 1]  228     LD (1,X),A 
      00A756 81               [ 4]  229     RET 
                                    230 
                                    231 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    232 ;   DS/MOD ( ud us - ur qud )
                                    233 ;   unsigned divide double by single 
                                    234 ;   return double quotient 
                                    235 ;   and single remainder 
                                    236 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0026D7                        237     _HEADER DSLMOD,6,"DS/MOD"
      00A757 A7 40                    1         .word LINK 
                           0026D9     2         LINK=.
      00A759 06                       3         .byte 6  
      00A75A 44 53 2F 4D 4F 44        4         .ascii "DS/MOD"
      00A760                          5         DSLMOD:
      00A760 90 93            [ 1]  238         LDW     Y,X             ; stack pointer to Y
      00A762 FE               [ 2]  239         LDW     X,(X)           ; un
      00A763 BF 26            [ 2]  240         LDW     YTEMP,X         ; save un
      00A765 93               [ 1]  241         LDW     X,Y
      00A766 89               [ 2]  242         PUSHW   X               ; save stack pointer
      00A767 90 89            [ 2]  243         PUSHW   Y 
      00A769 EE 02            [ 2]  244         LDW     X,(2,X)           ; X=udh
      00A76B 90 BE 26         [ 2]  245         LDW     Y,YTEMP         ; divisor 
      00A76E 65               [ 2]  246         DIVW    X,Y 
      00A76F BF 24            [ 2]  247         LDW     XTEMP,X         ; QUOTIENT hi 
      00A771 93               [ 1]  248         LDW     X,Y             ; remainder in X 
      00A772 90 85            [ 2]  249         POPW    Y 
      00A774 90 EE 04         [ 2]  250         LDW     Y,(4,Y)         ; Y=udl (offset before drop)
      00A777 A6 10            [ 1]  251         LD      A,#16           ; loop count
      00A779 90 58            [ 2]  252         SLLW    Y               ; udl shift udl into udh
      00A77B                        253 DSLMOD3:
      00A77B 59               [ 2]  254         RLCW    X               ; rotate udl bit into uhdh (= remainder)
      00A77C 25 04            [ 1]  255         JRC     DSLMODa         ; if carry out of rotate
      00A77E B3 26            [ 2]  256         CPW     X,YTEMP         ; compare udh to un
      00A780 25 05            [ 1]  257         JRULT   DSLMOD4         ; can't subtract
      00A782                        258 DSLMODa:
      00A782 72 B0 00 26      [ 2]  259         SUBW    X,YTEMP         ; can subtract
      00A786 98               [ 1]  260         RCF
      00A787                        261 DSLMOD4:
      00A787 8C               [ 1]  262         CCF                     ; quotient bit
      00A788 90 59            [ 2]  263         RLCW    Y               ; rotate into quotient, rotate out udl
      00A78A 4A               [ 1]  264         DEC     A               ; repeat
      00A78B 26 EE            [ 1]  265         JRNE    DSLMOD3           ; if A == 0
      00A78D                        266 DSLMODb:
      00A78D BF 26            [ 2]  267         LDW     YTEMP,X         ; done, save remainder
      00A78F 85               [ 2]  268         POPW    X               ; restore stack pointer
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 145.
Hexadecimal [24-Bits]



      00A790 EF 02            [ 2]  269         LDW     (2,X),Y           ; save quotient low 
      00A792 90 BE 24         [ 2]  270         LDW     Y,XTEMP         ; quotient hi 
      00A795 FF               [ 2]  271         LDW     (X),Y           ; save quotient hi 
      00A796 90 BE 26         [ 2]  272         LDW     Y,YTEMP         ; remainder onto stack
      00A799 EF 04            [ 2]  273         LDW     (4,X),Y
      00A79B 81               [ 4]  274         RET 
                                    275 
                                    276 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    277 ;   D# ( d -- d )
                                    278 ;   extract least digit 
                                    279 ;   from double integer 
                                    280 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00271C                        281     _HEADER DDIG,2,"D#"
      00A79C A7 59                    1         .word LINK 
                           00271E     2         LINK=.
      00A79E 02                       3         .byte 2  
      00A79F 44 23                    4         .ascii "D#"
      00A7A1                          5         DDIG:
      00A7A1 CD 87 60         [ 4]  282     CALL BASE 
      00A7A4 CD 85 64         [ 4]  283     CALL AT 
      00A7A7 CD A7 60         [ 4]  284     CALL DSLMOD
      00A7AA CD 88 5E         [ 4]  285     CALL ROT   
      00A7AD CD 8E 50         [ 4]  286     CALL DIGIT 
      00A7B0 CC 8E 9C         [ 2]  287     JP HOLD 
                                    288      
                                    289 
                                    290 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    291 ;    D#S ( d -- s )
                                    292 ;   extract digit from double 
                                    293 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002733                        294     _HEADER DDIGS,3,"D#S"
      00A7B3 A7 9E                    1         .word LINK 
                           002735     2         LINK=.
      00A7B5 03                       3         .byte 3  
      00A7B6 44 23 53                 4         .ascii "D#S"
      00A7B9                          5         DDIGS:
      00A7B9 CD A7 A1         [ 4]  295     CALL    DDIG 
      00A7BC CD 88 A8         [ 4]  296     CALL    DDUP 
      00A7BF CD A9 23         [ 4]  297     CALL    DZEQUAL
      002742                        298     _QBRAN  DDIGS 
      00A7C2 CD 85 19         [ 4]    1     CALL QBRAN
      00A7C5 A7 B9                    2     .word DDIGS
      002747                        299     _DROP 
      00A7C7 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00A7CA 81               [ 4]  300     RET
                                    301 
                                    302 
                                    303 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    304 ;   D. ( d -- )
                                    305 ;   display double integer 
                                    306 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00274B                        307     _HEADER DDOT,2,"D."
      00A7CB A7 B5                    1         .word LINK 
                           00274D     2         LINK=.
      00A7CD 02                       3         .byte 2  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 146.
Hexadecimal [24-Bits]



      00A7CE 44 2E                    4         .ascii "D."
      00A7D0                          5         DDOT:
      00A7D0 CD 8F C8         [ 4]  308     CALL SPACE 
      00A7D3 CD A7 46         [ 4]  309     CALL DSIGN 
      00A7D6 CD 86 63         [ 4]  310     CALL TOR
      00A7D9 CD 85 C6         [ 4]  311     CALL RAT 
      00275C                        312     _QBRAN DDOT0
      00A7DC CD 85 19         [ 4]    1     CALL QBRAN
      00A7DF A7 E4                    2     .word DDOT0
      00A7E1 CD 89 19         [ 4]  313     CALL DNEGA 
      00A7E4                        314 DDOT0:     
      00A7E4 CD 8E 8C         [ 4]  315     CALL BDIGS 
      00A7E7 CD A7 B9         [ 4]  316     CALL DDIGS 
      00A7EA CD 85 B5         [ 4]  317     CALL RFROM 
      00276D                        318     _QBRAN DDOT1 
      00A7ED CD 85 19         [ 4]    1     CALL QBRAN
      00A7F0 A7 FA                    2     .word DDOT1
      002772                        319     _DOLIT '-' 
      00A7F2 CD 84 F0         [ 4]    1     CALL DOLIT 
      00A7F5 00 2D                    2     .word '-' 
      00A7F7 CD 8E 9C         [ 4]  320     CALL HOLD 
      00A7FA                        321 DDOT1: 
      00A7FA CD 8E F1         [ 4]  322     CALL EDIGS 
      00A7FD CC 8F F2         [ 2]  323     JP TYPES     
                                    324      
                                    325 
                                    326 
                                    327 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    328 ;  UDS* ( ud u -- ud*u )
                                    329 ;  uint32*uint16 
                                    330 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002780                        331     _HEADER UDSSTAR,4,"UDS*"
      00A800 A7 CD                    1         .word LINK 
                           002782     2         LINK=.
      00A802 04                       3         .byte 4  
      00A803 55 44 53 2A              4         .ascii "UDS*"
      00A807                          5         UDSSTAR:
      00A807 CD 86 63         [ 4]  332     CALL TOR 
      00A80A CD 86 AA         [ 4]  333     CALL SWAPP 
      00A80D CD 85 C6         [ 4]  334     CALL RAT 
      00A810 CD 8B 4D         [ 4]  335     CALL UMSTA ; udlo*u 
      00A813 CD 88 5E         [ 4]  336     CALL ROT 
      00A816 CD 85 B5         [ 4]  337     CALL RFROM 
      00A819 CD 8B 4D         [ 4]  338     CALL UMSTA ; udhi*u 
      00279C                        339     _DROP  ; drop overflow 
      00A81C 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00A81F CC 88 BD         [ 2]  340     JP PLUS  ; udlo*u+(uhi*u<<16)
                                    341      
                                    342 
                                    343 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    344 ; multiply double by unsigned single 
                                    345 ; return double 
                                    346 ;  ( d u -- d )
                                    347 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0027A2                        348     _HEADER DSSTAR,3,"DS*"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 147.
Hexadecimal [24-Bits]



      00A822 A8 02                    1         .word LINK 
                           0027A4     2         LINK=.
      00A824 03                       3         .byte 3  
      00A825 44 53 2A                 4         .ascii "DS*"
      00A828                          5         DSSTAR:
                                    349 ;DSSTAR:
      00A828 CD 86 63         [ 4]  350     CALL TOR
      00A82B CD A7 46         [ 4]  351     CALL DSIGN 
      00A82E CD 88 7D         [ 4]  352     CALL NROT 
      00A831 CD A7 35         [ 4]  353     CALL DABS
      00A834 CD 85 B5         [ 4]  354     CALL RFROM 
      00A837 CD A8 07         [ 4]  355     CALL UDSSTAR  
      00A83A CD 88 5E         [ 4]  356     CALL ROT 
      0027BD                        357     _QBRAN DSSTAR3 
      00A83D CD 85 19         [ 4]    1     CALL QBRAN
      00A840 A8 45                    2     .word DSSTAR3
      00A842 CC 89 19         [ 2]  358     JP DNEGA 
      00A845                        359 DSSTAR3:
      00A845 81               [ 4]  360     RET 
                                    361 
                                    362 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    363 ;  2SWAP ( d1 d2 -- d2 d1 )
                                    364 ;  swap double 
                                    365 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0027C6                        366     _HEADER DSWAP,5,"2SWAP"
      00A846 A8 24                    1         .word LINK 
                           0027C8     2         LINK=.
      00A848 05                       3         .byte 5  
      00A849 32 53 57 41 50           4         .ascii "2SWAP"
      00A84E                          5         DSWAP:
      00A84E 90 93            [ 1]  367     LDW Y,X 
      00A850 90 FE            [ 2]  368     LDW Y,(Y)
      00A852 90 BF 26         [ 2]  369     LDW YTEMP,Y ; d2 hi 
      00A855 90 93            [ 1]  370     LDW Y,X 
      00A857 90 EE 02         [ 2]  371     LDW Y,(2,Y)
      00A85A 90 BF 24         [ 2]  372     LDW XTEMP,Y  ; d2 lo 
      00A85D 90 93            [ 1]  373     LDW Y,X 
      00A85F 90 EE 04         [ 2]  374     LDW Y,(4,Y)  ; d1 hi 
      00A862 FF               [ 2]  375     LDW (X),Y 
      00A863 90 93            [ 1]  376     LDW Y,X
      00A865 90 EE 06         [ 2]  377     LDW Y,(6,Y)  ; d1 lo 
      00A868 EF 02            [ 2]  378     LDW (2,X),Y
      00A86A 90 BE 26         [ 2]  379     LDW Y,YTEMP  
      00A86D EF 04            [ 2]  380     LDW (4,X),Y 
      00A86F 90 BE 24         [ 2]  381     LDW Y,XTEMP 
      00A872 EF 06            [ 2]  382     LDW (6,X),Y 
      00A874 81               [ 4]  383     RET 
                                    384 
                                    385 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    386 ;    DCLZ ( d -- u )
                                    387 ;    double count leading zeros
                                    388 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0027F5                        389     _HEADER DCLZ,4,"DCLZ"
      00A875 A8 48                    1         .word LINK 
                           0027F7     2         LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 148.
Hexadecimal [24-Bits]



      00A877 04                       3         .byte 4  
      00A878 44 43 4C 5A              4         .ascii "DCLZ"
      00A87C                          5         DCLZ:
      00A87C 4F               [ 1]  390     CLR A 
      00A87D 90 93            [ 1]  391     LDW Y,X 
      00A87F 90 FE            [ 2]  392     LDW Y,(Y)
      00A881 2B 18            [ 1]  393     JRMI DCLZ8 ; no leading zero 
      00A883 27 09            [ 1]  394     JREQ DCLZ4 ; >=16 
      00A885                        395 DCLZ1: ; <16
      00A885 90 58            [ 2]  396     SLLW Y
      00A887 4C               [ 1]  397     INC A 
      00A888 90 5D            [ 2]  398     TNZW Y 
      00A88A 2B 0F            [ 1]  399     JRMI DCLZ8
      00A88C 20 F7            [ 2]  400     JRA DCLZ1 
      00A88E                        401 DCLZ4: ; >=16 
      00A88E A6 10            [ 1]  402     LD A,#16 
      00A890 90 93            [ 1]  403     LDW Y,X 
      00A892 90 EE 02         [ 2]  404     LDW Y,(2,Y)
      00A895 2B 04            [ 1]  405     JRMI DCLZ8 
      00A897 26 EC            [ 1]  406     JRNE DCLZ1 
      00A899 AB 10            [ 1]  407     ADD A,#16
      00A89B                        408 DCLZ8: 
      00A89B 1C 00 02         [ 2]  409     ADDW X,#2 
      00A89E 90 5F            [ 1]  410     CLRW Y 
      00A8A0 90 97            [ 1]  411     LD YL,A 
      00A8A2 FF               [ 2]  412     LDW (X),Y 
      00A8A3 81               [ 4]  413     RET 
                                    414 
                                    415 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    416 ;   <2ROT ( d1 d2 d3 -- d3 d1 d2 )
                                    417 ;   rotate left doubles 
                                    418 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002824                        419     _HEADER NDROT,5,"<2ROT"
      00A8A4 A8 77                    1         .word LINK 
                           002826     2         LINK=.
      00A8A6 05                       3         .byte 5  
      00A8A7 3C 32 52 4F 54           4         .ascii "<2ROT"
      00A8AC                          5         NDROT:
                                    420 ; save d3 in temp 
      00A8AC 90 93            [ 1]  421     LDW Y,X 
      00A8AE 90 FE            [ 2]  422     LDW Y,(Y)
      00A8B0 90 BF 26         [ 2]  423     LDW YTEMP,Y  ; d3 hi 
      00A8B3 90 93            [ 1]  424     LDW Y,X 
      00A8B5 90 EE 02         [ 2]  425     LDW Y,(2,Y)
      00A8B8 90 BF 24         [ 2]  426     LDW XTEMP,Y  ; d3 lo 
                                    427 ; put d2 in d1 slot 
      00A8BB 90 93            [ 1]  428     LDW Y,X 
      00A8BD 90 EE 04         [ 2]  429     LDW Y,(4,Y) 
      00A8C0 FF               [ 2]  430     LDW (X),Y   ; d2 hi 
      00A8C1 90 93            [ 1]  431     LDW Y,X 
      00A8C3 90 EE 06         [ 2]  432     LDW Y,(6,Y)
      00A8C6 EF 02            [ 2]  433     LDW (2,X),Y ; d2 lo
                                    434 ; put d1 in d2 slot 
      00A8C8 90 93            [ 1]  435     LDW Y,X 
      00A8CA 90 EE 08         [ 2]  436     LDW Y,(8,Y) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 149.
Hexadecimal [24-Bits]



      00A8CD EF 04            [ 2]  437     LDW (4,X),Y ; d1 hi 
      00A8CF 90 93            [ 1]  438     LDW Y,X 
      00A8D1 90 EE 0A         [ 2]  439     LDW Y,(10,Y)
      00A8D4 EF 06            [ 2]  440     LDW (6,X),Y  ; d1 lo 
                                    441 ; put d3 in d1 slot 
      00A8D6 90 BE 26         [ 2]  442     LDW Y,YTEMP 
      00A8D9 EF 08            [ 2]  443     LDW (8,X),Y  ; d3 hi 
      00A8DB 90 BE 24         [ 2]  444     LDW Y,XTEMP 
      00A8DE EF 0A            [ 2]  445     LDW (10,X),Y  ; d3 lo 
      00A8E0 81               [ 4]  446     RET 
                                    447 
                                    448 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    449 ;   2ROT ( d1 d2 d3 -- d2 d3 d1 )
                                    450 ;   rotate right doubles 
                                    451 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002861                        452     _HEADER DROT,4,"2ROT"
      00A8E1 A8 A6                    1         .word LINK 
                           002863     2         LINK=.
      00A8E3 04                       3         .byte 4  
      00A8E4 32 52 4F 54              4         .ascii "2ROT"
      00A8E8                          5         DROT:
                                    453 ; save d3 in temp 
      00A8E8 90 93            [ 1]  454     LDW Y,X 
      00A8EA 90 FE            [ 2]  455     LDW Y,(Y)
      00A8EC 90 BF 26         [ 2]  456     LDW YTEMP,Y ; d3 hi 
      00A8EF 90 93            [ 1]  457     LDW Y,X 
      00A8F1 90 EE 02         [ 2]  458     LDW Y,(2,Y)
      00A8F4 90 BF 24         [ 2]  459     LDW XTEMP,Y ; d3 lo 
                                    460 ; put d1 in d3 slot 
      00A8F7 90 93            [ 1]  461     LDW Y,X 
      00A8F9 90 EE 08         [ 2]  462     LDW Y,(8,Y)
      00A8FC FF               [ 2]  463     LDW (X),Y  ; d1 hi 
      00A8FD 90 93            [ 1]  464     LDW Y,X 
      00A8FF 90 EE 0A         [ 2]  465     LDW Y,(10,Y) 
      00A902 EF 02            [ 2]  466     LDW (2,X),Y ; d1 lo 
                                    467 ; put d2 in d1 slot 
      00A904 90 93            [ 1]  468     LDW Y,X 
      00A906 90 EE 04         [ 2]  469     LDW Y,(4,Y) ; d2 hi 
      00A909 EF 08            [ 2]  470     LDW (8,X),Y 
      00A90B 90 93            [ 1]  471     LDW Y,X 
      00A90D 90 EE 06         [ 2]  472     LDW Y,(6,Y) ; d2 lo 
      00A910 EF 0A            [ 2]  473     LDW (10,X),Y 
                                    474 ; put d3 in d2 slot 
      00A912 90 BE 26         [ 2]  475     LDW Y,YTEMP 
      00A915 EF 04            [ 2]  476     LDW (4,X),Y 
      00A917 90 BE 24         [ 2]  477     LDW Y,XTEMP 
      00A91A EF 06            [ 2]  478     LDW (6,X),Y 
      00A91C 81               [ 4]  479     RET 
                                    480 
                                    481 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    482 ;    D0= ( d -- 0|-1 )
                                    483 ;    check if double is 0 
                                    484 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00289D                        485     _HEADER DZEQUAL,3,"D0="
      00A91D A8 E3                    1         .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 150.
Hexadecimal [24-Bits]



                           00289F     2         LINK=.
      00A91F 03                       3         .byte 3  
      00A920 44 30 3D                 4         .ascii "D0="
      00A923                          5         DZEQUAL:
      00A923 4F               [ 1]  486     CLR A  
      00A924 90 93            [ 1]  487     LDW Y,X 
      00A926 90 FE            [ 2]  488     LDW Y,(Y)
      00A928 26 09            [ 1]  489     JRNE ZEQ1 
      00A92A 90 93            [ 1]  490     LDW Y,X 
      00A92C 90 EE 02         [ 2]  491     LDW Y,(2,Y)
      00A92F 26 02            [ 1]  492     JRNE ZEQ1 
      00A931 A6 FF            [ 1]  493     LD A,#0xFF
      00A933                        494 ZEQ1:
      00A933 1C 00 02         [ 2]  495     ADDW X,#CELLL 
      00A936 F7               [ 1]  496     LD (X),A
      00A937 E7 01            [ 1]  497     LD (1,X),A
      00A939 81               [ 4]  498 	RET     
                                    499 
                                    500 
                                    501 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    502 ;   D= ( d1 d2 -- f )
                                    503 ;   d1==d2?
                                    504 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0028BA                        505     _HEADER DEQUAL,2,"D="
      00A93A A9 1F                    1         .word LINK 
                           0028BC     2         LINK=.
      00A93C 02                       3         .byte 2  
      00A93D 44 3D                    4         .ascii "D="
      00A93F                          5         DEQUAL:
      00A93F A6 00            [ 1]  506     LD A,#0 
      00A941 90 93            [ 1]  507     LDW Y,X 
      00A943 90 FE            [ 2]  508     LDW Y,(Y)
      00A945 E3 04            [ 2]  509     CPW Y,(4,X)
      00A947 26 0B            [ 1]  510     JRNE DEQU4 
      00A949 90 93            [ 1]  511     LDW Y,X 
      00A94B 90 EE 02         [ 2]  512     LDW Y,(2,Y)
      00A94E E3 06            [ 2]  513     CPW Y,(6,X)
      00A950 26 02            [ 1]  514     JRNE DEQU4 
      00A952 A6 FF            [ 1]  515     LD A,#0XFF
      00A954                        516 DEQU4:
      00A954 1C 00 06         [ 2]  517     ADDW X,#6
      00A957 F7               [ 1]  518     LD (X),A 
      00A958 E7 01            [ 1]  519     LD (1,X),A 
      00A95A 81               [ 4]  520     RET 
                                    521 
                                    522 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    523 ;   D> ( d1 d2 -- f )
                                    524 ;   d1>d2?
                                    525 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0028DB                        526     _HEADER DGREAT,2,"D>"
      00A95B A9 3C                    1         .word LINK 
                           0028DD     2         LINK=.
      00A95D 02                       3         .byte 2  
      00A95E 44 3E                    4         .ascii "D>"
      00A960                          5         DGREAT:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 151.
Hexadecimal [24-Bits]



      00A960 CD A8 4E         [ 4]  527     CALL DSWAP 
      00A963 CC A9 6B         [ 2]  528     JP DLESS 
                                    529 
                                    530 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    531 ;   D< ( d1 d2 -- f )
                                    532 ;   d1<d2? 
                                    533 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0028E6                        534     _HEADER DLESS,2,"D<"
      00A966 A9 5D                    1         .word LINK 
                           0028E8     2         LINK=.
      00A968 02                       3         .byte 2  
      00A969 44 3C                    4         .ascii "D<"
      00A96B                          5         DLESS:
      00A96B CD AC 7E         [ 4]  535     CALL DSUB
      00A96E CD 8C 84         [ 4]  536     CALL ZERO
      00A971 CD 88 7D         [ 4]  537     CALL NROT  
      00A974 CD A9 86         [ 4]  538     CALL DZLESS 
      0028F7                        539     _QBRAN DLESS4
      00A977 CD 85 19         [ 4]    1     CALL QBRAN
      00A97A A9 7F                    2     .word DLESS4
      00A97C CC 88 F6         [ 2]  540     JP INVER  
      00A97F                        541 DLESS4:
      00A97F 81               [ 4]  542     RET
                                    543 
                                    544 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    545 ;  D0< ( d -- f )
                                    546 ;  d<0? 
                                    547 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002900                        548     _HEADER DZLESS,3,"D0<"
      00A980 A9 68                    1         .word LINK 
                           002902     2         LINK=.
      00A982 03                       3         .byte 3  
      00A983 44 30 3C                 4         .ascii "D0<"
      00A986                          5         DZLESS:
      00A986 A6 00            [ 1]  549     LD A,#0 
      00A988 90 93            [ 1]  550     LDW Y,X 
      00A98A 90 FE            [ 2]  551     LDW Y,(Y)
      00A98C 2A 02            [ 1]  552     JRPL DZLESS1 
      00A98E A6 FF            [ 1]  553     LD A,#0XFF 
      00A990                        554 DZLESS1:
      00A990 1C 00 02         [ 2]  555     ADDW X,#CELLL 
      00A993 F7               [ 1]  556     LD (X),A 
      00A994 E7 01            [ 1]  557     LD (1,X),A    
      00A996 81               [ 4]  558     RET 
                                    559 
                                    560 
                                    561 
                                    562 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    563 ;   2>R ( d -- R: d )
                                    564 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002917                        565     _HEADER DTOR,3,"2>R"
      00A997 A9 82                    1         .word LINK 
                           002919     2         LINK=.
      00A999 03                       3         .byte 3  
      00A99A 32 3E 52                 4         .ascii "2>R"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 152.
Hexadecimal [24-Bits]



      00A99D                          5         DTOR:
      00A99D 90 85            [ 2]  566     POPW Y 
      00A99F 90 BF 26         [ 2]  567     LDW YTEMP,Y 
      00A9A2 90 93            [ 1]  568     LDW Y,X 
      00A9A4 90 EE 02         [ 2]  569     LDW Y,(2,Y)
      00A9A7 90 89            [ 2]  570     PUSHW Y   ; d low 
      00A9A9 90 93            [ 1]  571     LDW Y,X 
      00A9AB 90 FE            [ 2]  572     LDW Y,(Y)
      00A9AD 90 89            [ 2]  573     PUSHW Y   ; d hi 
      00292F                        574     _DDROP  
      00A9AF 1C 00 04         [ 2]    1    ADDW X,#2*CELLL 
      00A9B2 92 CC 26         [ 5]  575     JP [YTEMP]
                                    576 
                                    577 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    578 ;  2R> ( -- d ) R: d --      
                                    579 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002935                        580     _HEADER DRFROM,3,"2R>"
      00A9B5 A9 99                    1         .word LINK 
                           002937     2         LINK=.
      00A9B7 03                       3         .byte 3  
      00A9B8 32 52 3E                 4         .ascii "2R>"
      00A9BB                          5         DRFROM:
      00A9BB 90 85            [ 2]  581     POPW Y      ; d hi 
      00A9BD 90 BF 26         [ 2]  582     LDW YTEMP,Y 
      00A9C0 1D 00 04         [ 2]  583     SUBW X,#4
      00A9C3 90 85            [ 2]  584     POPW Y       ; d hi 
      00A9C5 FF               [ 2]  585     LDW (X),Y 
      00A9C6 90 85            [ 2]  586     POPW Y       ; d low  
      00A9C8 EF 02            [ 2]  587     LDW (2,X),Y 
      00A9CA 92 CC 26         [ 5]  588     JP [YTEMP]
                                    589     
                                    590 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    591 ;   2R@ ( -- d )
                                    592 ;   fecth a double from RSTACK
                                    593 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00294D                        594     _HEADER DRAT,3,"2R@"
      00A9CD A9 B7                    1         .word LINK 
                           00294F     2         LINK=.
      00A9CF 03                       3         .byte 3  
      00A9D0 32 52 40                 4         .ascii "2R@"
      00A9D3                          5         DRAT:
      00A9D3 90 85            [ 2]  595     POPW Y 
      00A9D5 90 BF 26         [ 2]  596     LDW YTEMP,Y 
      00A9D8 1D 00 04         [ 2]  597     SUBW X,#4 
      00A9DB 16 01            [ 2]  598     LDW Y,(1,SP)
      00A9DD FF               [ 2]  599     LDW (X),Y 
      00A9DE 16 03            [ 2]  600     LDW Y,(3,SP)
      00A9E0 EF 02            [ 2]  601     LDW (2,X),Y 
      00A9E2 92 CC 26         [ 5]  602     JP [YTEMP]
                                    603 
                                    604 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    605 ;  2VARIABLE <name> 
                                    606 ;  create a double variable 
                                    607 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002965                        608     _HEADER DVARIA,9,"2VARIABLE"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 153.
Hexadecimal [24-Bits]



      00A9E5 A9 CF                    1         .word LINK 
                           002967     2         LINK=.
      00A9E7 09                       3         .byte 9  
      00A9E8 32 56 41 52 49 41 42     4         .ascii "2VARIABLE"
             4C 45
      00A9F1                          5         DVARIA:
      00A9F1 CD 8D 5E         [ 4]  609         CALL HERE
      00A9F4 CD 86 9A         [ 4]  610         CALL DUPP
      002977                        611         _DOLIT 4  
      00A9F7 CD 84 F0         [ 4]    1     CALL DOLIT 
      00A9FA 00 04                    2     .word 4 
      00A9FC CD 88 BD         [ 4]  612         CALL PLUS 
      00A9FF CD 87 F1         [ 4]  613         CALL VPP 
      00AA02 CD 85 52         [ 4]  614         CALL STORE
      00AA05 CD 99 8D         [ 4]  615         CALL CREAT
      00AA08 CD 86 9A         [ 4]  616         CALL DUPP
      00AA0B CD 95 AE         [ 4]  617         CALL COMMA
      00AA0E CD 8C 84         [ 4]  618         CALL ZERO
      00AA11 CD 86 C2         [ 4]  619         CALL OVER 
      00AA14 CD 85 52         [ 4]  620         CALL STORE 
      00AA17 CD 8C 84         [ 4]  621         CALL ZERO 
      00AA1A CD 86 AA         [ 4]  622         CALL SWAPP 
      00AA1D CD 85 52         [ 4]  623         CALL STORE
      00AA20 CD A3 01         [ 4]  624         CALL FMOVE ; move definition to FLASH
      00AA23 CD 88 4D         [ 4]  625         CALL QDUP 
      00AA26 CD 85 19         [ 4]  626         CALL QBRAN 
      00AA29 99 DA                  627         .word SET_RAMLAST   
      00AA2B CD 9D A9         [ 4]  628         CALL UPDATVP  ; don't update if variable kept in RAM.
      00AA2E CC A3 95         [ 2]  629         JP UPDATPTR
                                    630                 
                                    631 
                                    632 
                                    633 
                                    634 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    635 ;  2LITERAL ( d -- )
                                    636 ;  compile double literal 
                                    637 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0029B1                        638     _HEADER DLITER,IMEDD+8,"2LITERAL"
      00AA31 A9 E7                    1         .word LINK 
                           0029B3     2         LINK=.
      00AA33 88                       3         .byte IMEDD+8  
      00AA34 32 4C 49 54 45 52 41     4         .ascii "2LITERAL"
             4C
      00AA3C                          5         DLITER:
      00AA3C CD 95 F3         [ 4]  639     CALL COMPI 
      00AA3F AA 47                  640     .word do2lit 
      00AA41 CD 95 AE         [ 4]  641     CALL COMMA 
      00AA44 CC 95 AE         [ 2]  642     JP   COMMA 
                                    643 
                                    644 
                                    645 ; runtime for 2LITERAL 
      00AA47                        646 do2lit:
      00AA47 1D 00 04         [ 2]  647     SUBW X,#4 
      00AA4A 16 01            [ 2]  648     LDW Y,(1,SP)
      00AA4C 90 FE            [ 2]  649     LDW Y,(Y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 154.
Hexadecimal [24-Bits]



      00AA4E FF               [ 2]  650     LDW (X),Y 
      00AA4F 16 01            [ 2]  651     LDW Y,(1,SP)
      00AA51 90 EE 02         [ 2]  652     LDW Y,(2,Y)
      00AA54 EF 02            [ 2]  653     LDW (2,X),Y 
      00AA56 90 85            [ 2]  654     POPW Y 
      00AA58 90 EC 04         [ 2]  655     JP (4,Y)
                                    656 
                                    657 
                                    658 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    659 ;   2OVER ( d1 d2 -- d1 d2 d1 )
                                    660 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0029DB                        661     _HEADER DOVER,5,"2OVER"
      00AA5B AA 33                    1         .word LINK 
                           0029DD     2         LINK=.
      00AA5D 05                       3         .byte 5  
      00AA5E 32 4F 56 45 52           4         .ascii "2OVER"
      00AA63                          5         DOVER:
      00AA63 90 93            [ 1]  662     LDW Y,X 
      00AA65 1D 00 04         [ 2]  663     SUBW X,#4 
      00AA68 90 89            [ 2]  664     PUSHW Y 
      00AA6A 90 EE 04         [ 2]  665     LDW Y,(4,Y)  ; d1 hi 
      00AA6D FF               [ 2]  666     LDW (X),Y 
      00AA6E 90 85            [ 2]  667     POPW Y 
      00AA70 90 EE 06         [ 2]  668     LDW Y,(6,Y)  ;d1 lo 
      00AA73 EF 02            [ 2]  669     LDW (2,X),Y 
      00AA75 81               [ 4]  670     RET 
                                    671 
                                    672 
                                    673 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    674 ;   D2/ ( d -- d/2 )
                                    675 ;   divide double by 2 
                                    676 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0029F6                        677     _HEADER D2SLASH,3,"D2/"
      00AA76 AA 5D                    1         .word LINK 
                           0029F8     2         LINK=.
      00AA78 03                       3         .byte 3  
      00AA79 44 32 2F                 4         .ascii "D2/"
      00AA7C                          5         D2SLASH:
      00AA7C 90 93            [ 1]  678     LDW Y,X 
      00AA7E 90 FE            [ 2]  679     LDW Y,(Y)
      00AA80 90 57            [ 2]  680     SRAW Y 
      00AA82 FF               [ 2]  681     LDW (X),Y 
      00AA83 90 93            [ 1]  682     LDW Y,X 
      00AA85 90 EE 02         [ 2]  683     LDW Y,(2,Y)
      00AA88 90 56            [ 2]  684     RRCW Y 
      00AA8A EF 02            [ 2]  685     LDW (2,X),Y 
      00AA8C 81               [ 4]  686     RET
                                    687 
                                    688 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    689 ;  D2* ( d -- d*2 )
                                    690 ;  multiply double by 2 
                                    691 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002A0D                        692     _HEADER D2STAR,3,"D2*"
      00AA8D AA 78                    1         .word LINK 
                           002A0F     2         LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 155.
Hexadecimal [24-Bits]



      00AA8F 03                       3         .byte 3  
      00AA90 44 32 2A                 4         .ascii "D2*"
      00AA93                          5         D2STAR:
      00AA93 90 93            [ 1]  693     LDW Y,X 
      00AA95 90 EE 02         [ 2]  694     LDW Y,(2,Y)
      00AA98 98               [ 1]  695     RCF 
      00AA99 90 59            [ 2]  696     RLCW Y 
      00AA9B EF 02            [ 2]  697     LDW (2,X),Y 
      00AA9D 90 93            [ 1]  698     LDW Y,X 
      00AA9F 90 FE            [ 2]  699     LDW Y,(Y)
      00AAA1 90 59            [ 2]  700     RLCW Y 
      00AAA3 FF               [ 2]  701     LDW (X),Y 
      00AAA4 81               [ 4]  702     RET 
                                    703 
                                    704 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    705 ;   DLSHIFT ( d n -- d )
                                    706 ;   left shift double 
                                    707 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002A25                        708     _HEADER DLSHIFT,7,"DLSHIFT"
      00AAA5 AA 8F                    1         .word LINK 
                           002A27     2         LINK=.
      00AAA7 07                       3         .byte 7  
      00AAA8 44 4C 53 48 49 46 54     4         .ascii "DLSHIFT"
      00AAAF                          5         DLSHIFT:
      00AAAF E6 01            [ 1]  709     LD A,(1,X) ; shift count 
      00AAB1 A4 1F            [ 1]  710     AND A,#31
      00AAB3 1C 00 02         [ 2]  711     ADDW X,#CELLL 
      00AAB6 90 93            [ 1]  712     LDW Y,X 
      00AAB8 90 FE            [ 2]  713     LDW Y,(Y)
      00AABA 90 BF 26         [ 2]  714     LDW YTEMP,Y  ; d hi 
      00AABD 90 93            [ 1]  715     LDW Y,X 
      00AABF 90 EE 02         [ 2]  716     LDW Y,(2,Y)  ; d low 
      00AAC2                        717 DLSHIFT1:
      00AAC2 4D               [ 1]  718     TNZ A 
      00AAC3 27 12            [ 1]  719     JREQ DLSHIFT2 
      00AAC5 98               [ 1]  720     RCF 
      00AAC6 90 59            [ 2]  721     RLCW Y 
      00AAC8 90 89            [ 2]  722     PUSHW Y 
      00AACA 90 BE 26         [ 2]  723     LDW Y,YTEMP 
      00AACD 90 59            [ 2]  724     RLCW Y 
      00AACF 90 BF 26         [ 2]  725     LDW YTEMP,Y 
      00AAD2 90 85            [ 2]  726     POPW Y 
      00AAD4 4A               [ 1]  727     DEC A 
      00AAD5 20 EB            [ 2]  728     JRA DLSHIFT1 
      00AAD7                        729 DLSHIFT2:
      00AAD7 EF 02            [ 2]  730     LDW (2,X),Y 
      00AAD9 90 BE 26         [ 2]  731     LDW Y,YTEMP 
      00AADC FF               [ 2]  732     LDW (X),Y 
      00AADD 81               [ 4]  733     RET 
                                    734 
                                    735 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    736 ;  DRSHIFT ( d n -- d )
                                    737 ;  shift right n bits 
                                    738 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002A5E                        739     _HEADER DRSHIFT,7,"DRSHIFT"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 156.
Hexadecimal [24-Bits]



      00AADE AA A7                    1         .word LINK 
                           002A60     2         LINK=.
      00AAE0 07                       3         .byte 7  
      00AAE1 44 52 53 48 49 46 54     4         .ascii "DRSHIFT"
      00AAE8                          5         DRSHIFT:
      00AAE8 E6 01            [ 1]  740     LD A,(1,X)
      00AAEA A4 1F            [ 1]  741     AND A,#31
      00AAEC 1C 00 02         [ 2]  742     ADDW X,#2 
      00AAEF                        743 DRSHIFT1:
      00AAEF 4D               [ 1]  744     TNZ A 
      00AAF0 27 13            [ 1]  745     JREQ DRSHIFT2 
      00AAF2 90 93            [ 1]  746     LDW Y,X 
      00AAF4 90 FE            [ 2]  747     LDW Y,(Y)
      00AAF6 90 54            [ 2]  748     SRLW Y 
      00AAF8 FF               [ 2]  749     LDW (X),Y 
      00AAF9 90 93            [ 1]  750     LDW Y,X 
      00AAFB 90 EE 02         [ 2]  751     LDW Y,(2,Y)
      00AAFE 90 56            [ 2]  752     RRCW Y 
      00AB00 EF 02            [ 2]  753     LDW (2,X),Y 
      00AB02 4A               [ 1]  754     DEC A
      00AB03 20 EA            [ 2]  755     JRA DRSHIFT1  
      00AB05                        756 DRSHIFT2:
      00AB05 81               [ 4]  757     RET 
                                    758 
                                    759 
                                    760 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    761 ;   D* ( d1 d2 -- d3 )
                                    762 ;   double product 
                                    763 ;   d3 = d1 * d2
                                    764 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002A86                        765     _HEADER DSTAR,2,"D*"
      00AB06 AA E0                    1         .word LINK 
                           002A88     2         LINK=.
      00AB08 02                       3         .byte 2  
      00AB09 44 2A                    4         .ascii "D*"
      00AB0B                          5         DSTAR:
      00AB0B 90 5F            [ 1]  766     CLRW Y 
      00AB0D F6               [ 1]  767     LD A,(X)   ; d2 sign 
      00AB0E E8 04            [ 1]  768     XOR A,(4,X) ; d1 sign 
      00AB10 2A 02            [ 1]  769     JRPL 1$
      00AB12 90 53            [ 2]  770     CPLW Y  
      00AB14 52 02            [ 2]  771 1$: SUB SP,#2 
      00AB16 17 01            [ 2]  772     LDW (1,SP),Y ; R: prod_sign 
      00AB18 CD A7 35         [ 4]  773     CALL DABS   
      00AB1B CD A9 9D         [ 4]  774     CALL DTOR 
      00AB1E CD A7 35         [ 4]  775     CALL DABS
      00AB21 CD 88 A8         [ 4]  776     CALL DDUP   ; ud1 ud1  
      00AB24 CD 85 B5         [ 4]  777     CALL RFROM  ; ud1 ud1 ud2hi 
      00AB27 CD A8 28         [ 4]  778     CALL DSSTAR ; ud1 dprodhi 
                                    779 ; shift partial product 16 bits left 
      002AAA                        780     _DROP   ; drop overflow 
      00AB2A 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00AB2D CD 8C 84         [ 4]  781     CALL ZERO   ; ud1 prodhi 
      00AB30 CD 86 AA         [ 4]  782     CALL SWAPP  
      00AB33 CD A8 4E         [ 4]  783     CALL DSWAP  ; dprodhi ud1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 157.
Hexadecimal [24-Bits]



      00AB36 CD 85 B5         [ 4]  784     CALL RFROM  ; dprodhi ud1 ud2lo
      00AB39 CD A8 28         [ 4]  785     CALL DSSTAR ; dprodhi dprodlo 
      00AB3C CD AC 4C         [ 4]  786     CALL DPLUS    
      00AB3F CD 85 B5         [ 4]  787     CALL RFROM    ; dprod ps 
      002AC2                        788     _QBRAN DDSTAR3 
      00AB42 CD 85 19         [ 4]    1     CALL QBRAN
      00AB45 AB 4A                    2     .word DDSTAR3
      00AB47 CC 89 19         [ 2]  789     JP DNEGA 
      00AB4A                        790 DDSTAR3:  
      00AB4A 81               [ 4]  791     RET 
                                    792 
                                    793 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    794 ;  UD/MOD ( ud1 ud2 -- dr udq )
                                    795 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002ACB                        796     _HEADER UDSLMOD,6,"UD/MOD"
      00AB4B AB 08                    1         .word LINK 
                           002ACD     2         LINK=.
      00AB4D 06                       3         .byte 6  
      00AB4E 55 44 2F 4D 4F 44        4         .ascii "UD/MOD"
      00AB54                          5         UDSLMOD:
                                    797 ;;;;;;;;;;;LOCAL VARIABLES ;;;;;;;;;;;;;;;;
                           000009   798     QLO = 9   ; 4 
                           000007   799     QHI = 7   ; 3
                           000005   800     CNT1 = 5  ; 2 
                           000003   801     CNT2 = 3  ; 1
                           000001   802     QLBIT = 1 ; 0
                                    803 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    804 ; unsigned double division 
      00AB54 52 0A            [ 2]  805     SUB SP,#5*CELLL ; space for local variables 
      00AB56 90 5F            [ 1]  806     CLRW Y 
      00AB58 17 09            [ 2]  807     LDW (QLO,SP),Y 
      00AB5A 17 07            [ 2]  808     LDW (QHI,SP),Y ; quotient=0  
      00AB5C CD AA 63         [ 4]  809     CALL DOVER 
      00AB5F CD A8 7C         [ 4]  810     CALL DCLZ ; n2, dividend leading zeros  
      00AB62 CD 86 63         [ 4]  811     CALL TOR 
      00AB65 CD 88 A8         [ 4]  812     CALL DDUP    
      00AB68 CD A8 7C         [ 4]  813     CALL DCLZ  ; n1, divisor leading zeros
      00AB6B CD 85 B5         [ 4]  814     CALL RFROM ; n1 n2 
      00AB6E CD 89 53         [ 4]  815     CALL SUBB  ; loop count 
      00AB71 90 93            [ 1]  816     LDW Y,X 
      00AB73 90 FE            [ 2]  817     LDW Y,(Y)
      00AB75 17 05            [ 2]  818     LDW (CNT1,SP),Y 
      00AB77 17 03            [ 2]  819     LDW (CNT2,SP),Y 
      00AB79 90 5D            [ 2]  820     TNZW Y 
      00AB7B 2B 50            [ 1]  821     JRMI UDSLA7 ; quotient is null 
      00AB7D CD AA AF         [ 4]  822     CALL DLSHIFT ; align divisor with dividend 
      00AB80 90 5F            [ 1]  823     CLRW Y  
      00AB82 17 01            [ 2]  824     LDW (QLBIT,SP),Y ; quotient least bit R: qlo qhi cntr qlbit 
      00AB84                        825 UDSLA3: ; division loop -- dividend divisor  
      00AB84 0F 02            [ 1]  826     CLR (2,SP)  ; qlbit=0 
      00AB86 CD AA 63         [ 4]  827     CALL DOVER 
      00AB89 CD AA 63         [ 4]  828     CALL DOVER 
      00AB8C CD A9 6B         [ 4]  829     CALL DLESS 
      002B0F                        830     _TBRAN UDSLA4 
      00AB8F CD 85 27         [ 4]    1     CALL TBRAN 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 158.
Hexadecimal [24-Bits]



      00AB92 AB A2                    2     .word UDSLA4 
                                    831 ; divident >= divisor then substract     
      00AB94 0C 02            [ 1]  832     INC (2,SP) ; quotient least bit 1 
      00AB96 CD 88 A8         [ 4]  833     CALL DDUP  ; dividend divisor divisor 
      00AB99 CD A9 9D         [ 4]  834     CALL DTOR  
      00AB9C CD AC 7E         [ 4]  835     CALL DSUB  ; dividend-divisor 
      00AB9F CD A9 BB         [ 4]  836     CALL DRFROM  ; dividend- divisor  
      00ABA2                        837 UDSLA4: ; shift quotient and add qlbit 
      00ABA2 16 09            [ 2]  838     LDW Y,(QLO,SP) ; quotient low 
      00ABA4 98               [ 1]  839     RCF 
      00ABA5 90 59            [ 2]  840     RLCW Y
      00ABA7 17 09            [ 2]  841     LDW (QLO,SP),Y 
      00ABA9 16 07            [ 2]  842     LDW Y,(QHI,SP) ; quotient hi 
      00ABAB 90 59            [ 2]  843     RLCW Y 
      00ABAD 17 07            [ 2]  844     LDW (QHI,SP),Y 
      00ABAF 16 09            [ 2]  845     LDW Y,(QLO,SP) 
      00ABB1 72 F9 01         [ 2]  846     ADDW Y,(QLBIT,SP)
      00ABB4 17 09            [ 2]  847     LDW (QLO,SP),Y 
      00ABB6 16 03            [ 2]  848     LDW Y,(CNT2,SP) ; loop counter 
      00ABB8 90 5D            [ 2]  849     TNZW Y 
      00ABBA 27 1F            [ 1]  850     JREQ UDSLA8
      00ABBC 72 A2 00 01      [ 2]  851     SUBW Y,#1  
      00ABC0 17 03            [ 2]  852     LDW (CNT2,SP),Y  
                                    853 ; shift dividend left 1 bit      
      00ABC2 CD A8 4E         [ 4]  854     CALL DSWAP 
      00ABC5 CD AA 93         [ 4]  855     CALL D2STAR 
      00ABC8 CD A8 4E         [ 4]  856     CALL DSWAP 
      00ABCB 20 B7            [ 2]  857     JRA UDSLA3 
      00ABCD                        858 UDSLA7:
      002B4D                        859     _DROP 
      00ABCD 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00ABD0 CD 8C 84         [ 4]  860     CALL ZERO 
      002B53                        861     _DOLIT 2   ; cnt1 local var 
      00ABD3 CD 84 F0         [ 4]    1     CALL DOLIT 
      00ABD6 00 02                    2     .word 2 
      00ABD8 CD 86 3F         [ 4]  862     CALL NRSTO ; R: 0 0 cnt1 cnt2 qlbit     
      00ABDB                        863 UDSLA8:
      00ABDB 1C 00 04         [ 2]  864     ADDW X,#4 ; drop divisor
      00ABDE CD A9 BB         [ 4]  865     CALL DRFROM  
      002B61                        866     _DDROP ; drop cnt2 qlbit  
      00ABE1 1C 00 04         [ 2]    1    ADDW X,#2*CELLL 
      00ABE4 CD 85 B5         [ 4]  867     CALL RFROM   ; cnt1 
      00ABE7 CD AA E8         [ 4]  868     CALL DRSHIFT 
                                    869     ; quotient replace dividend 
      00ABEA CD A9 BB         [ 4]  870     CALL DRFROM  ; quotient 
      00ABED 81               [ 4]  871     RET 
                                    872 
                                    873 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    874 ;   D/MOD  ( d1 d2 -- dr dq )
                                    875 ;   double division dq=d1/d2
                                    876 ;   dr remainder double 
                                    877 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002B6E                        878     _HEADER DDSLMOD,5,"D/MOD"  
      00ABEE AB 4D                    1         .word LINK 
                           002B70     2         LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 159.
Hexadecimal [24-Bits]



      00ABF0 05                       3         .byte 5  
      00ABF1 44 2F 4D 4F 44           4         .ascii "D/MOD"
      00ABF6                          5         DDSLMOD:
      00ABF6 F6               [ 1]  879     LD A,(X) ; disisor sign 
      00ABF7 88               [ 1]  880     PUSH A 
      00ABF8 E6 04            [ 1]  881     LD A,(4,X) ; dividend sign 
      00ABFA 88               [ 1]  882     PUSH A   ; R: sdivsor sdivnd 
      00ABFB CD A7 35         [ 4]  883     CALL DABS 
      00ABFE CD A9 9D         [ 4]  884     CALL DTOR ; R: sign abs(divisor)
      00AC01 CD A7 35         [ 4]  885     CALL DABS  ; ud1  
      00AC04 CD A9 D3         [ 4]  886     CALL DRAT  ; ud1 ud2 R: sign abs(divisor) 
      00AC07 CD AB 54         [ 4]  887     CALL UDSLMOD ; ud1/ud2 -- dr dq  
      00AC0A 7B 05            [ 1]  888     LD A,(5,SP) ; sdivnd 
      00AC0C 18 06            [ 1]  889     XOR A,(6,SP) ; 
      00AC0E 2A 18            [ 1]  890     JRPL DSLA8 
      00AC10 CD 8C 8F         [ 4]  891     CALL ONE 
      00AC13 CD 8C 84         [ 4]  892     CALL ZERO 
      00AC16 CD AC 4C         [ 4]  893     CALL DPLUS 
      00AC19 CD 89 19         [ 4]  894     CALL DNEGA ; negate quotient  
      00AC1C CD A9 D3         [ 4]  895     CALL DRAT 
      00AC1F CD A8 E8         [ 4]  896     CALL DROT 
      00AC22 CD AC 7E         [ 4]  897     CALL DSUB  ; corrected_remainder=divisor-remainder 
      00AC25 CD A8 4E         [ 4]  898     CALL DSWAP
      00AC28                        899 DSLA8:      
                                    900 ; check for divisor sign 
                                    901 ; if negative change negate remainder 
      00AC28 7B 06            [ 1]  902     LD A,(6,SP) ; divisor sign 
      00AC2A 2A 09            [ 1]  903     JRPL DSLA9 
      00AC2C CD A9 9D         [ 4]  904     CALL DTOR 
      00AC2F CD 89 19         [ 4]  905     CALL DNEGA 
      00AC32 CD A9 BB         [ 4]  906     CALL DRFROM 
      00AC35                        907 DSLA9:
      00AC35 5B 06            [ 2]  908     ADDW SP,#6 
      00AC37 81               [ 4]  909     RET 
                                    910 
                                    911 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    912 ;   D/  ( d1 d2 -- dq )
                                    913 ;   division double by double 
                                    914 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002BB8                        915     _HEADER DSLASH,2,"D/"
      00AC38 AB F0                    1         .word LINK 
                           002BBA     2         LINK=.
      00AC3A 02                       3         .byte 2  
      00AC3B 44 2F                    4         .ascii "D/"
      00AC3D                          5         DSLASH:
      00AC3D CD AB F6         [ 4]  916     CALL DDSLMOD
      00AC40 CD A8 4E         [ 4]  917     CALL DSWAP
      002BC3                        918     _DDROP 
      00AC43 1C 00 04         [ 2]    1    ADDW X,#2*CELLL 
      00AC46 81               [ 4]  919     RET 
                                    920 
                                    921 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    922 ;   D+ ( d1 d2 -- d3 )
                                    923 ;   add 2 doubles 
                                    924 ;   d3=d1+d2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 160.
Hexadecimal [24-Bits]



                                    925 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002BC7                        926     _HEADER DPLUS,2,"D+"
      00AC47 AC 3A                    1         .word LINK 
                           002BC9     2         LINK=.
      00AC49 02                       3         .byte 2  
      00AC4A 44 2B                    4         .ascii "D+"
      00AC4C                          5         DPLUS:
      00AC4C 90 93            [ 1]  927     LDW Y,X 
      00AC4E 90 FE            [ 2]  928     LDW Y,(Y)
      00AC50 90 BF 26         [ 2]  929     LDW YTEMP,Y ; d2 hi 
      00AC53 90 93            [ 1]  930     LDW Y,X 
      00AC55 90 EE 02         [ 2]  931     LDW Y,(2,Y)
      00AC58 90 BF 24         [ 2]  932     LDW XTEMP,Y ; d2 lo 
      00AC5B 1C 00 04         [ 2]  933     ADDW X,#4 
      00AC5E 90 93            [ 1]  934     LDW Y,X 
      00AC60 90 EE 02         [ 2]  935     LDW Y,(2,Y) ; d1 lo
      00AC63 72 B9 00 24      [ 2]  936     ADDW Y,XTEMP
      00AC67 EF 02            [ 2]  937     LDW (2,X),Y 
      00AC69 90 93            [ 1]  938     LDW Y,X 
      00AC6B 90 FE            [ 2]  939     LDW Y,(Y) ; d1 hi 
      00AC6D 24 04            [ 1]  940     JRNC DPLUS1 
      00AC6F 72 A9 00 01      [ 2]  941     ADDW Y,#1 
      00AC73                        942 DPLUS1: 
      00AC73 72 B9 00 26      [ 2]  943     ADDW Y,YTEMP 
      00AC77 FF               [ 2]  944     LDW (X),Y 
      00AC78 81               [ 4]  945     RET 
                                    946 
                                    947 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    948 ;   D- ( d1 d2 -- d3 )
                                    949 ;   d3=d1-d2 
                                    950 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002BF9                        951     _HEADER DSUB,2,"D-"
      00AC79 AC 49                    1         .word LINK 
                           002BFB     2         LINK=.
      00AC7B 02                       3         .byte 2  
      00AC7C 44 2D                    4         .ascii "D-"
      00AC7E                          5         DSUB:
      00AC7E 90 93            [ 1]  952     LDW Y,X 
      00AC80 90 FE            [ 2]  953     LDW Y,(Y)
      00AC82 90 BF 26         [ 2]  954     LDW YTEMP,Y ; d2 hi 
      00AC85 90 93            [ 1]  955     LDW Y,X 
      00AC87 90 EE 02         [ 2]  956     LDW Y,(2,Y)
      00AC8A 90 BF 24         [ 2]  957     LDW XTEMP,Y ; d2 lo 
      00AC8D 1C 00 04         [ 2]  958     ADDW X,#4 
      00AC90 90 93            [ 1]  959     LDW Y,X 
      00AC92 90 EE 02         [ 2]  960     LDW Y,(2,Y) ; d1 lo
      00AC95 72 B2 00 24      [ 2]  961     SUBW Y,XTEMP
      00AC99 EF 02            [ 2]  962     LDW (2,X),Y 
      00AC9B 90 93            [ 1]  963     LDW Y,X 
      00AC9D 90 FE            [ 2]  964     LDW Y,(Y) ; d1 hi 
      00AC9F 24 04            [ 1]  965     JRNC DSUB1 
      00ACA1 72 A2 00 01      [ 2]  966     SUBW Y,#1 
      00ACA5                        967 DSUB1: 
      00ACA5 72 B2 00 26      [ 2]  968     SUBW Y,YTEMP 
      00ACA9 FF               [ 2]  969     LDW (X),Y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 161.
Hexadecimal [24-Bits]



      00ACAA 81               [ 4]  970     RET 
                                    971 
                                    972 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 162.
Hexadecimal [24-Bits]



                                   4651 .endif 
                           000001  4652 .if WANT_FLOAT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 163.
Hexadecimal [24-Bits]



                                   4653         .include "float.asm"
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
      002C2B                         56     _HEADER FVER,9,"FLOAT-VER"
      00ACAB AC 7B                    1         .word LINK 
                           002C2D     2         LINK=.
      00ACAD 09                       3         .byte 9  
      00ACAE 46 4C 4F 41 54 2D 56     4         .ascii "FLOAT-VER"
             45 52
      00ACB7                          5         FVER:
      00ACB7 CD 90 0B         [ 4]   57     CALL CR 
      00ACBA CD 90 38         [ 4]   58     CALL DOTQP 
      00ACBD 11                      59     .byte  17 
      00ACBE 66 6C 6F 61 74 33 32    60     .ascii "float32 library, "
             20 6C 69 62 72 61 72
             79 2C 20
      00ACCF CD 9B D5         [ 4]   61     CALL PRT_LICENCE 
      00ACD2 CD 9B AD         [ 4]   62     CALL COPYRIGHT 
      002C55                         63     _DOLIT FLOAT_MAJOR     
      00ACD5 CD 84 F0         [ 4]    1     CALL DOLIT 
      00ACD8 00 01                    2     .word FLOAT_MAJOR 
      002C5A                         64     _DOLIT FLOAT_MINOR 
      00ACDA CD 84 F0         [ 4]    1     CALL DOLIT 
      00ACDD 00 00                    2     .word FLOAT_MINOR 
      00ACDF CC 9B E9         [ 2]   65     JP PRINT_VERSION 
                                     66 
                                     67 
                                     68 ;-------------------------
                                     69 ;    FPSW ( -- a )
                                     70 ;    floating state variable
                                     71 ;    bit 0 zero flag 
                                     72 ;    bit 1 negative flag 
                                     73 ;    bit 2 overflow/error flag 
                                     74 ;---------------------------
      002C62                         75     _HEADER FPSW,4,"FPSW"
      00ACE2 AC AD                    1         .word LINK 
                           002C64     2         LINK=.
      00ACE4 04                       3         .byte 4  
      00ACE5 46 50 53 57              4         .ascii "FPSW"
      00ACE9                          5         FPSW:
      00ACE9 90 AE 00 08      [ 2]   76 	LDW Y,#UFPSW  
      00ACED 1D 00 02         [ 2]   77 	SUBW X,#2
      00ACF0 FF               [ 2]   78     LDW (X),Y
      00ACF1 81               [ 4]   79     RET
                                     80 
                                     81 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     82 ;   FRESET ( -- )
                                     83 ;   reset FPSW variable 
                                     84 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
      002C72                         85     _HEADER FRESET,6,"FRESET"
      00ACF2 AC E4                    1         .word LINK 
                           002C74     2         LINK=.
      00ACF4 06                       3         .byte 6  
      00ACF5 46 52 45 53 45 54        4         .ascii "FRESET"
      00ACFB                          5         FRESET:
      00ACFB CD 8C 84         [ 4]   86     CALL ZERO  
      00ACFE CD AC E9         [ 4]   87     CALL FPSW 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 165.
Hexadecimal [24-Bits]



      00AD01 CD 85 52         [ 4]   88     CALL STORE 
      00AD04 81               [ 4]   89     RET 
                                     90 
                                     91 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     92 ;   FINIT ( -- )
                                     93 ;   initialize floating point 
                                     94 ;   library 
                                     95 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002C85                         96     _HEADER FINIT,5,"FINIT"
      00AD05 AC F4                    1         .word LINK 
                           002C87     2         LINK=.
      00AD07 05                       3         .byte 5  
      00AD08 46 49 4E 49 54           4         .ascii "FINIT"
      00AD0D                          5         FINIT:
      00AD0D CD AC FB         [ 4]   97     CALL FRESET 
      00AD10 81               [ 4]   98     RET 
                                     99 
                                    100 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    101 ;    FER ( -- u )
                                    102 ;    return FPSW value 
                                    103 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002C91                        104     _HEADER FER,3,"FER"
      00AD11 AD 07                    1         .word LINK 
                           002C93     2         LINK=.
      00AD13 03                       3         .byte 3  
      00AD14 46 45 52                 4         .ascii "FER"
      00AD17                          5         FER:
      00AD17 CD AC E9         [ 4]  105     CALL FPSW 
      00AD1A CD 85 64         [ 4]  106     CALL AT 
      00AD1D 81               [ 4]  107     RET 
                                    108 
                                    109 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    110 ;    FZE  ( -- 0|-1 )
                                    111 ;    return FPSW zero flag 
                                    112 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002C9E                        113     _HEADER FZE,3,"FZE"
      00AD1E AD 13                    1         .word LINK 
                           002CA0     2         LINK=.
      00AD20 03                       3         .byte 3  
      00AD21 46 5A 45                 4         .ascii "FZE"
      00AD24                          5         FZE:
      00AD24 CD AC E9         [ 4]  114     CALL FPSW
      00AD27 CD 85 64         [ 4]  115     CALL AT  
      00AD2A CD 8C 8F         [ 4]  116     CALL ONE 
      00AD2D CD 86 F7         [ 4]  117     CALL ANDD
      00AD30 CD 89 07         [ 4]  118     CALL NEGAT  
      00AD33 81               [ 4]  119     RET 
                                    120 
                                    121 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    122 ;    FNE ( -- 0|-1 )
                                    123 ;    return FPSW negative flag 
                                    124 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002CB4                        125     _HEADER FNE,3,"FNE"
      00AD34 AD 20                    1         .word LINK 
                           002CB6     2         LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 166.
Hexadecimal [24-Bits]



      00AD36 03                       3         .byte 3  
      00AD37 46 4E 45                 4         .ascii "FNE"
      00AD3A                          5         FNE:
      00AD3A CD AC E9         [ 4]  126     CALL FPSW 
      00AD3D CD 85 64         [ 4]  127     CALL AT 
      002CC0                        128     _DOLIT 2 
      00AD40 CD 84 F0         [ 4]    1     CALL DOLIT 
      00AD43 00 02                    2     .word 2 
      00AD45 CD 86 F7         [ 4]  129     CALL ANDD
      00AD48 CD 8C 6A         [ 4]  130     CALL TWOSL
      00AD4B CD 89 07         [ 4]  131     CALL NEGAT   
      00AD4E 81               [ 4]  132     RET 
                                    133 
                                    134 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    135 ;   FOV (  -- 0|-1 )
                                    136 ;   return FPSW overflow flag 
                                    137 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002CCF                        138     _HEADER FOV,3,"FOV"
      00AD4F AD 36                    1         .word LINK 
                           002CD1     2         LINK=.
      00AD51 03                       3         .byte 3  
      00AD52 46 4F 56                 4         .ascii "FOV"
      00AD55                          5         FOV:
      00AD55 CD AC E9         [ 4]  139     CALL FPSW
      00AD58 CD 85 64         [ 4]  140     CALL AT  
      002CDB                        141     _DOLIT 4 
      00AD5B CD 84 F0         [ 4]    1     CALL DOLIT 
      00AD5E 00 04                    2     .word 4 
      00AD60 CD 86 F7         [ 4]  142     CALL ANDD
      002CE3                        143     _DOLIT 2 
      00AD63 CD 84 F0         [ 4]    1     CALL DOLIT 
      00AD66 00 02                    2     .word 2 
      00AD68 CD 8C 52         [ 4]  144     CALL RSHIFT 
      00AD6B CD 89 07         [ 4]  145     CALL NEGAT  
      00AD6E 81               [ 4]  146     RET 
                                    147 
                                    148 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    149 ;    SFZ ( f# -- f# )
                                    150 ;    set FPSW zero flag 
                                    151 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002CEF                        152     _HEADER SFZ,3,"SFZ"
      00AD6F AD 51                    1         .word LINK 
                           002CF1     2         LINK=.
      00AD71 03                       3         .byte 3  
      00AD72 53 46 5A                 4         .ascii "SFZ"
      00AD75                          5         SFZ:
      00AD75 CD AD 17         [ 4]  153     CALL FER 
      002CF8                        154     _DOLIT 0xfffe 
      00AD78 CD 84 F0         [ 4]    1     CALL DOLIT 
      00AD7B FF FE                    2     .word 0xfffe 
      00AD7D CD 86 F7         [ 4]  155     CALL ANDD 
      00AD80 CD 86 63         [ 4]  156     CALL TOR    
      00AD83 CD 88 A8         [ 4]  157     CALL DDUP 
      002D06                        158     _DOLIT 0xFF  
      00AD86 CD 84 F0         [ 4]    1     CALL DOLIT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 167.
Hexadecimal [24-Bits]



      00AD89 00 FF                    2     .word 0xFF 
      00AD8B CD 86 F7         [ 4]  159     CALL ANDD
      00AD8E CD A9 23         [ 4]  160     CALL DZEQUAL 
      002D11                        161     _DOLIT 1 
      00AD91 CD 84 F0         [ 4]    1     CALL DOLIT 
      00AD94 00 01                    2     .word 1 
      00AD96 CD 86 F7         [ 4]  162     CALL ANDD 
      00AD99 CD 85 B5         [ 4]  163     CALL RFROM 
      00AD9C CD 87 0B         [ 4]  164     CALL ORR 
      00AD9F CD AC E9         [ 4]  165     CALL FPSW 
      00ADA2 CD 85 52         [ 4]  166     CALL STORE 
      00ADA5 81               [ 4]  167     RET 
                                    168 
                                    169 
                                    170 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    171 ;   SFN ( f# -- f# )
                                    172 ;   set FPSW negative flag 
                                    173 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002D26                        174     _HEADER SFN,3,"SFN"
      00ADA6 AD 71                    1         .word LINK 
                           002D28     2         LINK=.
      00ADA8 03                       3         .byte 3  
      00ADA9 53 46 4E                 4         .ascii "SFN"
      00ADAC                          5         SFN:
      00ADAC CD AD 17         [ 4]  175     CALL FER 
      002D2F                        176     _DOLIT 0xFFFD 
      00ADAF CD 84 F0         [ 4]    1     CALL DOLIT 
      00ADB2 FF FD                    2     .word 0xFFFD 
      00ADB4 CD 86 F7         [ 4]  177     CALL ANDD  
      00ADB7 CD 86 63         [ 4]  178     CALL TOR 
      00ADBA CD 86 9A         [ 4]  179     CALL DUPP 
      002D3D                        180     _DOLIT 0X80 
      00ADBD CD 84 F0         [ 4]    1     CALL DOLIT 
      00ADC0 00 80                    2     .word 0X80 
      00ADC2 CD 86 F7         [ 4]  181     CALL ANDD 
      002D45                        182     _DOLIT 6 
      00ADC5 CD 84 F0         [ 4]    1     CALL DOLIT 
      00ADC8 00 06                    2     .word 6 
      00ADCA CD 8C 52         [ 4]  183     CALL RSHIFT 
      00ADCD CD 85 B5         [ 4]  184     CALL RFROM 
      00ADD0 CD 87 0B         [ 4]  185     CALL ORR 
      00ADD3 CD AC E9         [ 4]  186     CALL FPSW 
      00ADD6 CD 85 52         [ 4]  187     CALL STORE 
      00ADD9 81               [ 4]  188     RET 
                                    189 
                                    190 
                                    191 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    192 ;   SFV ( -- )
                                    193 ;   set overflow flag 
                                    194 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002D5A                        195     _HEADER SFV,3,"SFV"
      00ADDA AD A8                    1         .word LINK 
                           002D5C     2         LINK=.
      00ADDC 03                       3         .byte 3  
      00ADDD 53 46 56                 4         .ascii "SFV"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 168.
Hexadecimal [24-Bits]



      00ADE0                          5         SFV:
      00ADE0 CD AD 17         [ 4]  196     CALL FER 
      002D63                        197     _DOLIT 4 
      00ADE3 CD 84 F0         [ 4]    1     CALL DOLIT 
      00ADE6 00 04                    2     .word 4 
      00ADE8 CD 87 0B         [ 4]  198     CALL ORR 
      00ADEB CD AC E9         [ 4]  199     CALL FPSW 
      00ADEE CD 85 52         [ 4]  200     CALL STORE 
      00ADF1 81               [ 4]  201     RET 
                                    202 
                                    203 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    204 ;  F>ME ( f# -- m e )
                                    205 ;  split float in mantissa/exponent 
                                    206 ;  m mantissa as a double 
                                    207 ;  e exponent as a single 
                                    208 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002D72                        209     _HEADER ATEXP,4,"F>ME"             
      00ADF2 AD DC                    1         .word LINK 
                           002D74     2         LINK=.
      00ADF4 04                       3         .byte 4  
      00ADF5 46 3E 4D 45              4         .ascii "F>ME"
      00ADF9                          5         ATEXP:
      00ADF9 CD AC FB         [ 4]  210     CALL FRESET
      00ADFC CD AD AC         [ 4]  211     CALL SFN
      00ADFF CD AD 75         [ 4]  212     CALL SFZ 
      00AE02 90 93            [ 1]  213     LDW Y,X 
      00AE04 90 FE            [ 2]  214     LDW Y,(Y)
      00AE06 90 89            [ 2]  215     PUSHW Y 
      00AE08 4F               [ 1]  216     CLR A  
      00AE09 90 5E            [ 1]  217     SWAPW Y 
      00AE0B 2A 01            [ 1]  218     JRPL ATEXP1 
      00AE0D 43               [ 1]  219     CPL A 
      00AE0E                        220 ATEXP1: ; sign extend mantissa 
      00AE0E 90 5E            [ 1]  221     SWAPW Y 
      00AE10 90 95            [ 1]  222     LD YH,A 
      00AE12 FF               [ 2]  223     LDW (X),Y 
      00AE13 1D 00 02         [ 2]  224     SUBW X,#CELLL 
      00AE16 90 85            [ 2]  225     POPW Y 
      00AE18 4F               [ 1]  226     CLR A 
      00AE19 90 5D            [ 2]  227     TNZW Y 
      00AE1B 2A 01            [ 1]  228     JRPL ATEXP2 
      00AE1D 43               [ 1]  229     CPL A 
      00AE1E                        230 ATEXP2:
      00AE1E 90 5E            [ 1]  231     SWAPW Y 
      00AE20 90 95            [ 1]  232     LD YH,A 
      00AE22 FF               [ 2]  233     LDW (X),Y 
      00AE23 81               [ 4]  234     RET 
                                    235 
                                    236 
                                    237 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    238 ;    ME>F ( m e -- f# )
                                    239 ;    built float from mantissa/exponent 
                                    240 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002DA4                        241     _HEADER STEXP,4,"ME>F"
      00AE24 AD F4                    1         .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 169.
Hexadecimal [24-Bits]



                           002DA6     2         LINK=.
      00AE26 04                       3         .byte 4  
      00AE27 4D 45 3E 46              4         .ascii "ME>F"
      00AE2B                          5         STEXP:
      00AE2B CD 86 9A         [ 4]  242     CALL DUPP 
      00AE2E CD 89 6D         [ 4]  243     CALL ABSS 
      002DB1                        244     _DOLIT 127 
      00AE31 CD 84 F0         [ 4]    1     CALL DOLIT 
      00AE34 00 7F                    2     .word 127 
      00AE36 CD 89 D4         [ 4]  245     CALL GREAT
      002DB9                        246     _QBRAN STEXP1
      00AE39 CD 85 19         [ 4]    1     CALL QBRAN
      00AE3C AE 41                    2     .word STEXP1
      00AE3E CD AD E0         [ 4]  247     CALL SFV
      00AE41                        248 STEXP1:
      00AE41 90 93            [ 1]  249     LDW Y,X 
      00AE43 90 FE            [ 2]  250     LDW Y,(Y)
      00AE45 4F               [ 1]  251     CLR A 
      00AE46 90 95            [ 1]  252     LD YH,A
      00AE48 90 5E            [ 1]  253     SWAPW Y 
      00AE4A 90 89            [ 2]  254     PUSHW Y  ; e >r 
      00AE4C 1C 00 02         [ 2]  255     ADDW X,#CELLL 
      00AE4F CD 88 A8         [ 4]  256     CALL DDUP 
      00AE52 CD A7 35         [ 4]  257     CALL DABS
      00AE55 CD 86 AA         [ 4]  258     CALL SWAPP 
      002DD8                        259     _DROP  
      00AE58 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      002DDB                        260     _DOLIT 127 
      00AE5B CD 84 F0         [ 4]    1     CALL DOLIT 
      00AE5E 00 7F                    2     .word 127 
      00AE60 CD 89 D4         [ 4]  261     CALL GREAT 
      002DE3                        262     _QBRAN STEXP2 
      00AE63 CD 85 19         [ 4]    1     CALL QBRAN
      00AE66 AE 6B                    2     .word STEXP2
      00AE68 CD AD E0         [ 4]  263     CALL SFV 
      00AE6B                        264 STEXP2: 
      00AE6B 4F               [ 1]  265     CLR A 
      00AE6C F7               [ 1]  266     LD (X),A     
      00AE6D CD 85 B5         [ 4]  267     CALL RFROM 
      00AE70 CD 87 0B         [ 4]  268     CALL ORR
      00AE73 CD AD 75         [ 4]  269     CALL SFZ 
      00AE76 CD AD AC         [ 4]  270     CALL SFN 
      00AE79 81               [ 4]  271     RET 
                                    272 
                                    273 
                                    274 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    275 ;   E. ( f# -- )
                                    276 ;   print float in scientific 
                                    277 ;   format 
                                    278 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002DFA                        279     _HEADER EDOT,2,"E."
      00AE7A AE 26                    1         .word LINK 
                           002DFC     2         LINK=.
      00AE7C 02                       3         .byte 2  
      00AE7D 45 2E                    4         .ascii "E."
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 170.
Hexadecimal [24-Bits]



      00AE7F                          5         EDOT:
      00AE7F CD 87 60         [ 4]  280     CALL BASE 
      00AE82 CD 85 64         [ 4]  281     CALL AT 
      00AE85 CD 86 63         [ 4]  282     CALL TOR 
      002E08                        283     _DOLIT 10 
      00AE88 CD 84 F0         [ 4]    1     CALL DOLIT 
      00AE8B 00 0A                    2     .word 10 
      00AE8D CD 87 60         [ 4]  284     CALL BASE 
      00AE90 CD 85 52         [ 4]  285     CALL STORE 
      00AE93 CD AD F9         [ 4]  286     CALL ATEXP ; m e 
      00AE96                        287 EDOT0:
      00AE96 CD 86 63         [ 4]  288     CALL TOR   
      00AE99 CD A7 35         [ 4]  289     CALL DABS 
      00AE9C CD 8F C8         [ 4]  290     CALL SPACE 
      00AE9F CD 8E 8C         [ 4]  291     CALL BDIGS     
      00AEA2                        292 EDOT2: 
      00AEA2 CD A7 A1         [ 4]  293     CALL DDIG
      00AEA5 CD 85 B5         [ 4]  294     CALL RFROM 
      00AEA8 CD 8C 18         [ 4]  295     CALL ONEP 
      00AEAB CD 86 63         [ 4]  296     CALL TOR 
      00AEAE CD 86 9A         [ 4]  297     CALL DUPP
      002E31                        298     _QBRAN EDOT3 
      00AEB1 CD 85 19         [ 4]    1     CALL QBRAN
      00AEB4 AE B8                    2     .word EDOT3
      00AEB6 20 EA            [ 2]  299     JRA EDOT2  
      00AEB8                        300 EDOT3:
      00AEB8 CD 86 C2         [ 4]  301     CALL OVER 
      00AEBB CD 87 60         [ 4]  302     CALL BASE 
      00AEBE CD 85 64         [ 4]  303     CALL AT 
      00AEC1 CD 89 91         [ 4]  304     CALL ULESS 
      002E44                        305     _QBRAN EDOT2 
      00AEC4 CD 85 19         [ 4]    1     CALL QBRAN
      00AEC7 AE A2                    2     .word EDOT2
      002E49                        306     _DOLIT '.'
      00AEC9 CD 84 F0         [ 4]    1     CALL DOLIT 
      00AECC 00 2E                    2     .word '.' 
      00AECE CD 8E 9C         [ 4]  307     CALL HOLD  
      00AED1 CD A7 A1         [ 4]  308     CALL DDIG
      00AED4 CD AD 3A         [ 4]  309     CALL FNE 
      002E57                        310     _QBRAN EDOT4 
      00AED7 CD 85 19         [ 4]    1     CALL QBRAN
      00AEDA AE E4                    2     .word EDOT4
      002E5C                        311     _DOLIT '-'
      00AEDC CD 84 F0         [ 4]    1     CALL DOLIT 
      00AEDF 00 2D                    2     .word '-' 
      00AEE1 CD 8E 9C         [ 4]  312     CALL HOLD 
      00AEE4                        313 EDOT4:       
      002E64                        314     _DROP 
      00AEE4 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00AEE7 CD 8E F1         [ 4]  315     CALL EDIGS 
      00AEEA CD 8F F2         [ 4]  316     CALL TYPES
      00AEED CD 85 B5         [ 4]  317     CALL RFROM 
      00AEF0 CD 88 4D         [ 4]  318     CALL QDUP 
      002E73                        319     _QBRAN EDOT5     
      00AEF3 CD 85 19         [ 4]    1     CALL QBRAN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 171.
Hexadecimal [24-Bits]



      00AEF6 AF 03                    2     .word EDOT5
      002E78                        320     _DOLIT 'E'
      00AEF8 CD 84 F0         [ 4]    1     CALL DOLIT 
      00AEFB 00 45                    2     .word 'E' 
      00AEFD CD 84 B7         [ 4]  321     CALL EMIT 
      00AF00 CD 90 B1         [ 4]  322     CALL DOT
      00AF03                        323 EDOT5: 
      00AF03 CD 85 B5         [ 4]  324     CALL RFROM 
      00AF06 CD 87 60         [ 4]  325     CALL BASE 
      00AF09 CD 85 52         [ 4]  326     CALL STORE  
      00AF0C 81               [ 4]  327     RET 
                                    328 
                                    329 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                    330 ;   F. (f# -- )
                                    331 ;   print float in fixed
                                    332 ;   point format. 
                                    333 ;;;;;;;;;;;;;;;;;;;;;;;;;
      002E8D                        334     _HEADER FDOT,2,"F."
      00AF0D AE 7C                    1         .word LINK 
                           002E8F     2         LINK=.
      00AF0F 02                       3         .byte 2  
      00AF10 46 2E                    4         .ascii "F."
      00AF12                          5         FDOT:
      00AF12 CD 87 60         [ 4]  335     CALL BASE 
      00AF15 CD 85 64         [ 4]  336     CALL AT 
      00AF18 CD 86 63         [ 4]  337     CALL TOR 
      002E9B                        338     _DOLIT 10 
      00AF1B CD 84 F0         [ 4]    1     CALL DOLIT 
      00AF1E 00 0A                    2     .word 10 
      00AF20 CD 87 60         [ 4]  339     CALL BASE 
      00AF23 CD 85 52         [ 4]  340     CALL STORE 
      00AF26 CD AD F9         [ 4]  341     CALL    ATEXP
      00AF29 CD 86 9A         [ 4]  342     CALL    DUPP  
      00AF2C CD 89 6D         [ 4]  343     CALL    ABSS 
      002EAF                        344     _DOLIT  8
      00AF2F CD 84 F0         [ 4]    1     CALL DOLIT 
      00AF32 00 08                    2     .word 8 
      00AF34 CD 89 D4         [ 4]  345     CALL    GREAT 
      002EB7                        346     _QBRAN  FDOT1 
      00AF37 CD 85 19         [ 4]    1     CALL QBRAN
      00AF3A AF 3F                    2     .word FDOT1
      00AF3C CC AE 96         [ 2]  347     JP      EDOT0 
      00AF3F                        348 FDOT1:
      00AF3F CD 8F C8         [ 4]  349     CALL    SPACE 
      00AF42 CD 86 63         [ 4]  350     CALL    TOR 
      00AF45 CD AD 3A         [ 4]  351     CALL    FNE 
      002EC8                        352     _QBRAN  FDOT0 
      00AF48 CD 85 19         [ 4]    1     CALL QBRAN
      00AF4B AF 50                    2     .word FDOT0
      00AF4D CD 89 19         [ 4]  353     CALL    DNEGA 
      00AF50                        354 FDOT0: 
      00AF50 CD 8E 8C         [ 4]  355     CALL    BDIGS
      00AF53 CD 85 C6         [ 4]  356     CALL    RAT  
      00AF56 CD 86 D1         [ 4]  357     CALL    ZLESS 
      002ED9                        358     _QBRAN  FDOT6 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 172.
Hexadecimal [24-Bits]



      00AF59 CD 85 19         [ 4]    1     CALL QBRAN
      00AF5C AF 81                    2     .word FDOT6
      00AF5E                        359 FDOT2: ; e<0 
      00AF5E CD A7 A1         [ 4]  360     CALL    DDIG 
      00AF61 CD 85 B5         [ 4]  361     CALL    RFROM
      00AF64 CD 8C 18         [ 4]  362     CALL    ONEP 
      00AF67 CD 88 4D         [ 4]  363     CALL    QDUP 
      002EEA                        364     _QBRAN  FDOT3 
      00AF6A CD 85 19         [ 4]    1     CALL QBRAN
      00AF6D AF 74                    2     .word FDOT3
      00AF6F CD 86 63         [ 4]  365     CALL    TOR 
      00AF72 20 EA            [ 2]  366     JRA   FDOT2 
      00AF74                        367 FDOT3:
      002EF4                        368     _DOLIT  '.' 
      00AF74 CD 84 F0         [ 4]    1     CALL DOLIT 
      00AF77 00 2E                    2     .word '.' 
      00AF79 CD 8E 9C         [ 4]  369     CALL    HOLD 
      00AF7C CD A7 B9         [ 4]  370     CALL    DDIGS
      00AF7F 20 12            [ 2]  371     JRA   FDOT9  
      00AF81                        372 FDOT6: ; e>=0 
      00AF81 20 08            [ 2]  373     JRA   FDOT8
      00AF83                        374 FDOT7:     
      002F03                        375     _DOLIT  '0'
      00AF83 CD 84 F0         [ 4]    1     CALL DOLIT 
      00AF86 00 30                    2     .word '0' 
      00AF88 CD 8E 9C         [ 4]  376     CALL    HOLD 
      00AF8B                        377 FDOT8:
      00AF8B CD 85 04         [ 4]  378     CALL    DONXT 
      00AF8E AF 83                  379     .word   FDOT7
      00AF90 CD A7 B9         [ 4]  380     CALL    DDIGS 
      00AF93                        381 FDOT9:
      00AF93 CD AD 3A         [ 4]  382     CALL    FNE 
      002F16                        383     _QBRAN  FDOT10 
      00AF96 CD 85 19         [ 4]    1     CALL QBRAN
      00AF99 AF A3                    2     .word FDOT10
      002F1B                        384     _DOLIT '-' 
      00AF9B CD 84 F0         [ 4]    1     CALL DOLIT 
      00AF9E 00 2D                    2     .word '-' 
      00AFA0 CD 8E 9C         [ 4]  385     CALL   HOLD 
      00AFA3                        386 FDOT10:
      00AFA3 CD 8E F1         [ 4]  387     CALL    EDIGS 
      00AFA6 CD 8F F2         [ 4]  388     CALL    TYPES 
      00AFA9 CD 85 B5         [ 4]  389     CALL    RFROM 
      00AFAC CD 87 60         [ 4]  390     CALL    BASE 
      00AFAF CD 85 52         [ 4]  391     CALL    STORE 
      00AFB2 81               [ 4]  392     RET 
                                    393 
                                    394 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    395 ; return parsed exponent or 
                                    396 ; 0 if failed
                                    397 ; at entry exprect *a=='E'    
                                    398 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00AFB3                        399 parse_exponent: ; a cntr -- e -1 | 0 
      00AFB3 CD 86 63         [ 4]  400     CALL TOR   ; R: cntr 
      00AFB6 CD 86 9A         [ 4]  401     CALL DUPP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 173.
Hexadecimal [24-Bits]



      00AFB9 CD 85 82         [ 4]  402     CALL CAT 
      002F3C                        403     _DOLIT 'E' 
      00AFBC CD 84 F0         [ 4]    1     CALL DOLIT 
      00AFBF 00 45                    2     .word 'E' 
      00AFC1 CD 89 7B         [ 4]  404     CALL EQUAL 
      002F44                        405     _QBRAN 1$
      00AFC4 CD 85 19         [ 4]    1     CALL QBRAN
      00AFC7 AF F4                    2     .word 1$
      00AFC9 CD 8C 18         [ 4]  406     CALL ONEP 
      00AFCC CD 85 B5         [ 4]  407     CALL RFROM  ; a cntr 
      00AFCF CD 8C 25         [ 4]  408     CALL ONEM
      00AFD2 CD 86 9A         [ 4]  409     CALL DUPP 
      002F55                        410     _QBRAN 2$ ; a cntr 
      00AFD5 CD 85 19         [ 4]    1     CALL QBRAN
      00AFD8 AF F7                    2     .word 2$
      00AFDA CD 8C 84         [ 4]  411     CALL ZERO
      00AFDD CD 86 9A         [ 4]  412     CALL DUPP 
      00AFE0 CD A8 4E         [ 4]  413     CALL DSWAP ; 0 0 a cntr  
      00AFE3 CD A5 DD         [ 4]  414     CALL nsign 
      00AFE6 CD 86 63         [ 4]  415     CALL TOR   ; R: esign  
      00AFE9 CD A6 0A         [ 4]  416     CALL parse_digits
      002F6C                        417     _QBRAN PARSEXP_SUCCESS ; parsed to end of string 
      00AFEC CD 85 19         [ 4]    1     CALL QBRAN
      00AFEF AF FE                    2     .word PARSEXP_SUCCESS
                                    418 ; failed invalid character
      002F71                        419     _DDROP ; 0 a 
      00AFF1 1C 00 04         [ 2]    1    ADDW X,#2*CELLL 
      00AFF4                        420 1$: 
      00AFF4 CD 85 B5         [ 4]  421     CALL RFROM ; sign||cntr  
      00AFF7                        422 2$:
      002F77                        423     _DDROP  ; a cntr || a sign || 0 cntr   
      00AFF7 1C 00 04         [ 2]    1    ADDW X,#2*CELLL 
      00AFFA CD 8C 84         [ 4]  424     CALL ZERO   ; return only 0 
      00AFFD 81               [ 4]  425     RET 
      00AFFE                        426 PARSEXP_SUCCESS: 
      002F7E                        427     _DDROP ; drop dhi a 
      00AFFE 1C 00 04         [ 2]    1    ADDW X,#2*CELLL 
      00B001 CD 85 B5         [ 4]  428     CALL RFROM ; es 
      002F84                        429     _QBRAN 1$
      00B004 CD 85 19         [ 4]    1     CALL QBRAN
      00B007 B0 0C                    2     .word 1$
      00B009 CD 89 07         [ 4]  430     CALL NEGAT
      00B00C                        431 1$:
      002F8C                        432     _DOLIT -1 ; -- e -1 
      00B00C CD 84 F0         [ 4]    1     CALL DOLIT 
      00B00F FF FF                    2     .word -1 
      00B011 81               [ 4]  433     RET 
                                    434 
                                    435 
                                    436 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    437 ;   FLOAT?  ( a dlo dhi a+ cntr sign d? -- f -3 | a 0 )
                                    438 ;   called by NUMBER? 
                                    439 ;   convert string to float 
                                    440 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002F92                        441     _HEADER FLOATQ,5,"FLOAT?"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 174.
Hexadecimal [24-Bits]



      00B012 AF 0F                    1         .word LINK 
                           002F94     2         LINK=.
      00B014 05                       3         .byte 5  
      00B015 46 4C 4F 41 54 3F        4         .ascii "FLOAT?"
      00B01B                          5         FLOATQ:
      002F9B                        442     _QBRAN FLOATQ0 
      00B01B CD 85 19         [ 4]    1     CALL QBRAN
      00B01E B0 23                    2     .word FLOATQ0
      00B020 CC B0 C2         [ 2]  443     JP FLOAT_ERROR  ; not a float, string start with '#'
      00B023                        444 FLOATQ0:
                                    445 ; BASE must be 10 
      00B023 CD 87 60         [ 4]  446     CALL BASE 
      00B026 CD 85 64         [ 4]  447     CALL AT 
      002FA9                        448     _DOLIT 10 
      00B029 CD 84 F0         [ 4]    1     CALL DOLIT 
      00B02C 00 0A                    2     .word 10 
      00B02E CD 89 7B         [ 4]  449     CALL EQUAL 
      002FB1                        450     _QBRAN FLOAT_ERROR 
      00B031 CD 85 19         [ 4]    1     CALL QBRAN
      00B034 B0 C2                    2     .word FLOAT_ERROR
                                    451 ; if float next char is '.' or 'E' 
      00B036 CD 86 63         [ 4]  452     CALL TOR ; R: sign  
      00B039 CD 86 63         [ 4]  453     CALL TOR ; R: sign cntr 
      00B03C CD 86 9A         [ 4]  454     CALL DUPP
      00B03F CD 85 82         [ 4]  455     CALL CAT 
      002FC2                        456     _DOLIT '.' 
      00B042 CD 84 F0         [ 4]    1     CALL DOLIT 
      00B045 00 2E                    2     .word '.' 
      00B047 CD 89 7B         [ 4]  457     CALL EQUAL 
      002FCA                        458     _QBRAN FLOATQ1 ; not a dot 
      00B04A CD 85 19         [ 4]    1     CALL QBRAN
      00B04D B0 82                    2     .word FLOATQ1
      00B04F CD 8C 18         [ 4]  459     CALL ONEP 
      00B052 CD 85 B5         [ 4]  460     CALL RFROM  ; dlo dhi a cntr R: sign  
      00B055 CD 8C 25         [ 4]  461     CALL ONEM 
      00B058 CD 86 9A         [ 4]  462     CALL DUPP 
      00B05B CD 86 63         [ 4]  463     CALL TOR  ; R: sign cntr 
                                    464 ; parse fractional part
      00B05E CD A6 0A         [ 4]  465     CALL parse_digits ; dlo dhi a cntr -- dm a cntr 
      00B061 CD 86 9A         [ 4]  466     CALL DUPP 
      00B064 CD 85 B5         [ 4]  467     CALL RFROM 
      00B067 CD 86 AA         [ 4]  468     CALL SWAPP 
      00B06A CD 89 53         [ 4]  469     CALL SUBB ; fd -> fraction digits count 
      00B06D CD 86 63         [ 4]  470     CALL TOR  ; dlo dhi a cntr R: sign fd 
      00B070 CD 86 9A         [ 4]  471     CALL DUPP ; cntr cntr  
      002FF3                        472     _QBRAN 1$ ; end of string, no exponent
      00B073 CD 85 19         [ 4]    1     CALL QBRAN
      00B076 B0 7A                    2     .word 1$
      00B078 20 11            [ 2]  473     JRA FLOATQ2
      00B07A CD 86 AA         [ 4]  474 1$: CALL SWAPP 
      002FFD                        475     _DROP ; a
      00B07D 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00B080 20 11            [ 2]  476     JRA FLOATQ3        
      00B082                        477 FLOATQ1: ; must push fd==0 on RSTACK 
      00B082 CD 85 B5         [ 4]  478     CALL RFROM ; cntr 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 175.
Hexadecimal [24-Bits]



      00B085 CD 8C 84         [ 4]  479     CALL ZERO  ; fd 
      00B088 CD 86 63         [ 4]  480     CALL TOR   ; dm a cntr R: sign fd 
      00B08B                        481 FLOATQ2: 
      00B08B CD AF B3         [ 4]  482     CALL parse_exponent 
      00300E                        483     _QBRAN FLOAT_ERROR0 ; exponent expected 
      00B08E CD 85 19         [ 4]    1     CALL QBRAN
      00B091 B0 BF                    2     .word FLOAT_ERROR0
      00B093                        484 FLOATQ3: ; dm 0 || dm e  
      00B093 CD 85 B5         [ 4]  485     CALL RFROM ;  fd  
      00B096 CD 89 53         [ 4]  486     CALL SUBB  ; exp=e-fd 
      00B099 CD 88 7D         [ 4]  487     CALL NROT 
      00B09C CD 85 B5         [ 4]  488     CALL RFROM  ; sign 
      00301F                        489     _QBRAN FLOATQ4 
      00B09F CD 85 19         [ 4]    1     CALL QBRAN
      00B0A2 B0 A7                    2     .word FLOATQ4
      00B0A4 CD 89 19         [ 4]  490     CALL DNEGA 
      00B0A7                        491 FLOATQ4:
      00B0A7 CD 88 5E         [ 4]  492     CALL ROT 
      00B0AA CD AE 2B         [ 4]  493     CALL STEXP 
      00B0AD CD 88 5E         [ 4]  494     CALL ROT 
      003030                        495     _DROP 
      00B0B0 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00B0B3 CD AD AC         [ 4]  496     CALL SFN 
      00B0B6 CD AD 75         [ 4]  497     CALL SFZ 
      003039                        498     _DOLIT -3 
      00B0B9 CD 84 F0         [ 4]    1     CALL DOLIT 
      00B0BC FF FD                    2     .word -3 
      00B0BE 81               [ 4]  499     RET       
      00B0BF                        500 FLOAT_ERROR0: 
      00B0BF CD A9 BB         [ 4]  501     CALL DRFROM ; sign df      
      00B0C2                        502 FLOAT_ERROR: 
      00B0C2 CD 8C C6         [ 4]  503     CALL DEPTH 
      00B0C5 CD 8C 0B         [ 4]  504     CALL CELLS 
      00B0C8 CD 86 7A         [ 4]  505     CALL SPAT 
      00B0CB CD 86 AA         [ 4]  506     CALL SWAPP 
      00B0CE CD 88 BD         [ 4]  507     CALL PLUS  
      00B0D1 CD 86 87         [ 4]  508     CALL SPSTO 
      00B0D4 CD 8C 84         [ 4]  509     CALL ZERO 
      00B0D7 81               [ 4]  510     RET 
                                    511 
                                    512 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    513 ;  LSCALE ( f# -- f# )
                                    514 ;  m *=10 , e -= 1
                                    515 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      003058                        516     _HEADER LSCALE,6,"LSCALE"
      00B0D8 B0 14                    1         .word LINK 
                           00305A     2         LINK=.
      00B0DA 06                       3         .byte 6  
      00B0DB 4C 53 43 41 4C 45        4         .ascii "LSCALE"
      00B0E1                          5         LSCALE:
      00B0E1 CD AD F9         [ 4]  517     CALL ATEXP 
      00B0E4 CD 8C 8F         [ 4]  518     CALL ONE 
      00B0E7 CD 89 53         [ 4]  519     CALL SUBB 
      00B0EA CD 86 63         [ 4]  520     CALL TOR
      00306D                        521     _DOLIT 10 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 176.
Hexadecimal [24-Bits]



      00B0ED CD 84 F0         [ 4]    1     CALL DOLIT 
      00B0F0 00 0A                    2     .word 10 
      00B0F2 CD A8 28         [ 4]  522     CALL DSSTAR
      00B0F5 CD 85 B5         [ 4]  523     CALL RFROM 
      00B0F8 CD AE 2B         [ 4]  524     CALL STEXP 
      00B0FB 81               [ 4]  525     RET  
                                    526 
                                    527 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    528 ;  RSCALE ( f# -- f# )
                                    529 ;  m /=10 , e+=1 
                                    530 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00307C                        531     _HEADER RSCALE,6,"RSCALE"
      00B0FC B0 DA                    1         .word LINK 
                           00307E     2         LINK=.
      00B0FE 06                       3         .byte 6  
      00B0FF 52 53 43 41 4C 45        4         .ascii "RSCALE"
      00B105                          5         RSCALE:
      00B105 CD AD F9         [ 4]  532     CALL ATEXP 
      00B108 CD 8C 8F         [ 4]  533     CALL ONE 
      00B10B CD 88 BD         [ 4]  534     CALL PLUS 
      00B10E CD 86 63         [ 4]  535     CALL TOR 
      003091                        536     _DOLIT 10 
      00B111 CD 84 F0         [ 4]    1     CALL DOLIT 
      00B114 00 0A                    2     .word 10 
      00B116 CD A7 60         [ 4]  537     CALL DSLMOD 
      00B119 CD 88 5E         [ 4]  538     CALL ROT 
      00309C                        539     _DROP 
      00B11C 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00B11F CD 85 B5         [ 4]  540     CALL RFROM 
      00B122 CD AE 2B         [ 4]  541     CALL STEXP 
      00B125 81               [ 4]  542     RET 
                                    543 
                                    544 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    545 ;  SCALEUP ( ud u1 u2 -- ud*10 u1 u2 )
                                    546 ;  while (ud<=0xcccccccc && u1<u2 ){
                                    547 ;        ud*10;
                                    548 ;        u2--;
                                    549 ;  }  
                                    550 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00B126                        551 SCALEUP:
      00B126 CD 88 A8         [ 4]  552     CALL DDUP
      00B129 CD 89 A7         [ 4]  553     CALL LESS  
      0030AC                        554     _QBRAN SCALEUP3
      00B12C CD 85 19         [ 4]    1     CALL QBRAN
      00B12F B1 5C                    2     .word SCALEUP3
      00B131 CD A9 9D         [ 4]  555     CALL DTOR   ; R: u1 u2  
      00B134 CD 88 A8         [ 4]  556     CALL DDUP 
      0030B7                        557     _DOLIT 0XCCCC 
      00B137 CD 84 F0         [ 4]    1     CALL DOLIT 
      00B13A CC CC                    2     .word 0XCCCC 
      0030BC                        558     _DOLIT 0XCCC 
      00B13C CD 84 F0         [ 4]    1     CALL DOLIT 
      00B13F 0C CC                    2     .word 0XCCC 
      00B141 CD A9 60         [ 4]  559     CALL DGREAT  
      0030C4                        560     _TBRAN SCALEUP2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 177.
Hexadecimal [24-Bits]



      00B144 CD 85 27         [ 4]    1     CALL TBRAN 
      00B147 B1 59                    2     .word SCALEUP2 
      0030C9                        561     _DOLIT 10 
      00B149 CD 84 F0         [ 4]    1     CALL DOLIT 
      00B14C 00 0A                    2     .word 10 
      00B14E CD A8 07         [ 4]  562     CALL UDSSTAR 
      00B151 CD A9 BB         [ 4]  563     CALL DRFROM 
      00B154 CD 8C 25         [ 4]  564     CALL ONEM
      00B157 20 CD            [ 2]  565     JRA SCALEUP
      00B159                        566 SCALEUP2:
      00B159 CD A9 BB         [ 4]  567     CALL DRFROM
      00B15C                        568 SCALEUP3: 
      00B15C 81               [ 4]  569     RET 
                                    570 
                                    571 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    572 ; SCALEDOWN ( ud u1 u2 -- ud u1 u2 )
                                    573 ;  whhile (ud && u1>u2 ){ 
                                    574 ;     ud/10;
                                    575 ;     u2++;
                                    576 ;  } 
                                    577 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00B15D                        578 SCALEDOWN: 
      00B15D CD 88 A8         [ 4]  579     CALL DDUP 
      00B160 CD 89 D4         [ 4]  580     CALL GREAT 
      0030E3                        581     _QBRAN SCALDN3 
      00B163 CD 85 19         [ 4]    1     CALL QBRAN
      00B166 B1 8C                    2     .word SCALDN3
      00B168 CD A9 9D         [ 4]  582     CALL DTOR 
      00B16B CD 88 A8         [ 4]  583     CALL DDUP 
      00B16E CD A9 23         [ 4]  584     CALL DZEQUAL 
      0030F1                        585     _TBRAN SCALDN2  
      00B171 CD 85 27         [ 4]    1     CALL TBRAN 
      00B174 B1 89                    2     .word SCALDN2 
      0030F6                        586     _DOLIT 10
      00B176 CD 84 F0         [ 4]    1     CALL DOLIT 
      00B179 00 0A                    2     .word 10 
      00B17B CD 8C 84         [ 4]  587     CALL ZERO  
      00B17E CD AC 3D         [ 4]  588     CALL DSLASH 
      00B181 CD A9 BB         [ 4]  589     CALL DRFROM 
      00B184 CD 8C 18         [ 4]  590     CALL ONEP  
      00B187 20 D4            [ 2]  591     JRA SCALEDOWN 
      00B189                        592 SCALDN2:
      00B189 CD A9 BB         [ 4]  593     CALL DRFROM 
      00B18C                        594 SCALDN3:
      00B18C 81               [ 4]  595     RET 
                                    596 
                                    597 
                                    598 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    599 ;  F-ALIGN ( f#1 f#2 -- m1 m2 e )
                                    600 ;  align to same exponent 
                                    601 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00310D                        602     _HEADER FALIGN,7,"F-ALIGN"
      00B18D B0 FE                    1         .word LINK 
                           00310F     2         LINK=.
      00B18F 07                       3         .byte 7  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 178.
Hexadecimal [24-Bits]



      00B190 46 2D 41 4C 49 47 4E     4         .ascii "F-ALIGN"
      00B197                          5         FALIGN:
      00B197 CD AD F9         [ 4]  603     CALL ATEXP 
      00B19A CD 86 63         [ 4]  604     CALL TOR 
      00B19D CD A8 4E         [ 4]  605     CALL DSWAP 
      00B1A0 CD AD F9         [ 4]  606     CALL ATEXP 
      00B1A3 CD 86 63         [ 4]  607     CALL TOR    ; m2 m1 R: e2 e1 
      00B1A6 CD A8 4E         [ 4]  608     CALL DSWAP 
      00B1A9 CD A9 D3         [ 4]  609     CALL DRAT 
      00B1AC CD 89 7B         [ 4]  610     CALL EQUAL 
      00312F                        611     _TBRAN FALGN8
      00B1AF CD 85 27         [ 4]    1     CALL TBRAN 
      00B1B2 B2 34                    2     .word FALGN8 
                                    612 ; scaleup the largest float 
                                    613 ; but limit mantissa <=0xccccccc
                                    614 ; to avoid mantissa overflow     
      00B1B4 CD A9 D3         [ 4]  615     CALL DRAT ; m1 m2 e2 e1 
      00B1B7 CD 89 D4         [ 4]  616     CALL GREAT 
      00313A                        617     _QBRAN FALGN4 ; e2<e1 
      00B1BA CD 85 19         [ 4]    1     CALL QBRAN
      00B1BD B1 D0                    2     .word FALGN4
                                    618 ; e2>e1 then scale up m2   
      00B1BF CD A9 BB         [ 4]  619     CALL DRFROM 
      00B1C2 CD 86 AA         [ 4]  620     CALL SWAPP 
      00B1C5 CD B1 26         [ 4]  621     CALL SCALEUP 
      00B1C8 CD 86 AA         [ 4]  622     CALL SWAPP 
      00B1CB CD A9 9D         [ 4]  623     CALL DTOR 
      00B1CE 20 0F            [ 2]  624     JRA FALGN6
      00B1D0                        625 FALGN4: ; e2<e1 then scaleup m1 
      00B1D0 CD A8 4E         [ 4]  626     CALL DSWAP 
      00B1D3 CD A9 BB         [ 4]  627     CALL DRFROM 
      00B1D6 CD B1 26         [ 4]  628     CALL SCALEUP 
      00B1D9 CD A9 9D         [ 4]  629     CALL DTOR
      00B1DC CD A8 4E         [ 4]  630     CALL DSWAP 
                                    631 ; check again for e2==e1 
                                    632 ; if scaleup was not enough 
                                    633 ; to equalize exponent then
                                    634 ; scaledown smallest float     
      00B1DF                        635 FALGN6: 
      00B1DF CD A9 D3         [ 4]  636     CALL DRAT 
      00B1E2 CD 89 7B         [ 4]  637     CALL EQUAL 
      003165                        638     _TBRAN FALGN8 
      00B1E5 CD 85 27         [ 4]    1     CALL TBRAN 
      00B1E8 B2 34                    2     .word FALGN8 
                                    639 ; e2!=e1 need to scale down smallest 
      00B1EA CD A9 D3         [ 4]  640     CALL DRAT 
      00B1ED CD 89 D4         [ 4]  641     CALL GREAT 
      003170                        642     _QBRAN FALGN7 ; e2<e1 
      00B1F0 CD 85 19         [ 4]    1     CALL QBRAN
      00B1F3 B2 06                    2     .word FALGN7
                                    643 ; e2>e1 scaledown m1 
      00B1F5 CD A8 4E         [ 4]  644     CALL DSWAP 
      00B1F8 CD A9 BB         [ 4]  645     CALL DRFROM 
      00B1FB CD B1 5D         [ 4]  646     CALL SCALEDOWN
      00B1FE CD 86 AA         [ 4]  647     CALL SWAPP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 179.
Hexadecimal [24-Bits]



      00B201 CD A9 9D         [ 4]  648     CALL DTOR 
      00B204 20 0F            [ 2]  649     JRA FALGN71  
      00B206                        650 FALGN7: ; e2<e1 scaledown m2 
      00B206 CD A9 BB         [ 4]  651     CALL DRFROM 
      00B209 CD 86 AA         [ 4]  652     CALL SWAPP 
      00B20C CD B1 5D         [ 4]  653     CALL SCALEDOWN 
      00B20F CD 86 AA         [ 4]  654     CALL SWAPP 
      00B212 CD A9 9D         [ 4]  655     CALL DTOR 
                                    656 ; after scaledown if e2!=e1 
                                    657 ; this imply that one of mantissa 
                                    658 ; as been nullified by scalling 
                                    659 ; hence keep largest exponent 
      00B215                        660 FALGN71:
      00B215 CD A9 D3         [ 4]  661     CALL DRAT 
      00B218 CD 89 7B         [ 4]  662     CALL EQUAL
      00319B                        663     _TBRAN FALGN8 
      00B21B CD 85 27         [ 4]    1     CALL TBRAN 
      00B21E B2 34                    2     .word FALGN8 
      00B220 CD A9 BB         [ 4]  664     CALL DRFROM 
      00B223 CD 88 A8         [ 4]  665     CALL DDUP 
      00B226 CD 89 D4         [ 4]  666     CALL GREAT 
      0031A9                        667     _TBRAN FALGN72
      00B229 CD 85 27         [ 4]    1     CALL TBRAN 
      00B22C B2 31                    2     .word FALGN72 
      00B22E CD 86 AA         [ 4]  668     CALL SWAPP     
      00B231                        669 FALGN72:
      00B231 CD A9 9D         [ 4]  670     CALL DTOR  ; now smallest e is at rtop.
      00B234                        671 FALGN8:
      00B234 CD A9 BB         [ 4]  672     CALL DRFROM 
      0031B7                        673     _DROP 
      00B237 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00B23A 81               [ 4]  674     RET 
                                    675 
                                    676 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    677 ;   F+ ( f#1 f#2 -- f#1+f#2 )
                                    678 ;   float addition 
                                    679 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0031BB                        680     _HEADER FPLUS,2,"F+"
      00B23B B1 8F                    1         .word LINK 
                           0031BD     2         LINK=.
      00B23D 02                       3         .byte 2  
      00B23E 46 2B                    4         .ascii "F+"
      00B240                          5         FPLUS:
      00B240 CD B1 97         [ 4]  681     CALL FALIGN 
      00B243 CD 86 63         [ 4]  682     CALL TOR 
      00B246 CD AC 4C         [ 4]  683     CALL DPLUS
      00B249 CD A7 46         [ 4]  684     CALL DSIGN 
      00B24C CD 86 63         [ 4]  685     CALL TOR 
      00B24F CD A7 35         [ 4]  686     CALL DABS 
      00B252 CD B2 B5         [ 4]  687     CALL SCALETOM
      00B255 CD 85 B5         [ 4]  688     CALL RFROM 
      0031D8                        689     _QBRAN FPLUS1 
      00B258 CD 85 19         [ 4]    1     CALL QBRAN
      00B25B B2 60                    2     .word FPLUS1
      00B25D CD 89 19         [ 4]  690     CALL DNEGA  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 180.
Hexadecimal [24-Bits]



      00B260                        691 FPLUS1: 
      00B260 CD 88 5E         [ 4]  692     CALL ROT   
      00B263 CD 85 B5         [ 4]  693     CALL RFROM
      00B266 CD 88 BD         [ 4]  694     CALL PLUS  
      00B269 CD AE 2B         [ 4]  695     CALL STEXP 
      00B26C 81               [ 4]  696     RET 
                                    697 
                                    698 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    699 ;  F- ( f#1 f#2 -- f#1-f#2 )
                                    700 ;  substraction 
                                    701 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0031ED                        702     _HEADER FSUB,2,"F-"
      00B26D B2 3D                    1         .word LINK 
                           0031EF     2         LINK=.
      00B26F 02                       3         .byte 2  
      00B270 46 2D                    4         .ascii "F-"
      00B272                          5         FSUB:
      00B272 CD B1 97         [ 4]  703     CALL FALIGN 
      00B275 CD 86 63         [ 4]  704     CALL TOR 
      00B278 CD AC 7E         [ 4]  705     CALL DSUB
      00B27B CD A7 46         [ 4]  706     CALL DSIGN 
      00B27E CD 86 63         [ 4]  707     CALL TOR 
      00B281 CD A7 35         [ 4]  708     CALL DABS 
      00B284 CD B2 B5         [ 4]  709     CALL SCALETOM 
      00B287 CD 85 B5         [ 4]  710     CALL RFROM 
      00320A                        711     _QBRAN FSUB1 
      00B28A CD 85 19         [ 4]    1     CALL QBRAN
      00B28D B2 92                    2     .word FSUB1
      00B28F CD 89 19         [ 4]  712     CALL DNEGA 
      00B292                        713 FSUB1:
      00B292 CD 88 5E         [ 4]  714     CALL ROT 
      00B295 CD 85 B5         [ 4]  715     CALL RFROM
      00B298 CD 88 BD         [ 4]  716     CALL PLUS  
      00B29B CD AE 2B         [ 4]  717     CALL STEXP 
      00B29E 81               [ 4]  718     RET 
                                    719 
                                    720 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    721 ; /mod10  ( m -- m/10 r )
                                    722 ; divide mantissa by 10 
                                    723 ; return quotient and remainder 
                                    724 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00B29F                        725 UMOD10:
      00321F                        726     _DOLIT 10 
      00B29F CD 84 F0         [ 4]    1     CALL DOLIT 
      00B2A2 00 0A                    2     .word 10 
      00B2A4 CD A7 60         [ 4]  727     CALL DSLMOD
      00B2A7 CD 88 5E         [ 4]  728     CALL ROT  
      00B2AA 81               [ 4]  729     RET 
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
      00322B                        739     _HEADER SCALETOM,7,"SCALE>M"
      00B2AB B2 6F                    1         .word LINK 
                           00322D     2         LINK=.
      00B2AD 07                       3         .byte 7  
      00B2AE 53 43 41 4C 45 3E 4D     4         .ascii "SCALE>M"
      00B2B5                          5         SCALETOM:
      00B2B5 CD 8C 84         [ 4]  740     CALL ZERO 
      00B2B8 CD 88 7D         [ 4]  741     CALL NROT 
      00B2BB                        742 SCAL1:
      00B2BB CD 86 9A         [ 4]  743     CALL DUPP 
      00323E                        744     _DOLIT 0X7F 
      00B2BE CD 84 F0         [ 4]    1     CALL DOLIT 
      00B2C1 00 7F                    2     .word 0X7F 
      00B2C3 CD 89 BE         [ 4]  745     CALL UGREAT 
      003246                        746     _QBRAN SCAL2  
      00B2C6 CD 85 19         [ 4]    1     CALL QBRAN
      00B2C9 B2 DC                    2     .word SCAL2
      00B2CB CD B2 9F         [ 4]  747     CALL UMOD10 
      00324E                        748     _DROP 
      00B2CE 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00B2D1 CD 88 5E         [ 4]  749     CALL ROT 
      00B2D4 CD 8C 18         [ 4]  750     CALL ONEP 
      00B2D7 CD 88 7D         [ 4]  751     CALL NROT  
      00B2DA 20 DF            [ 2]  752     JRA SCAL1 
      00B2DC                        753 SCAL2: 
      00B2DC 81               [ 4]  754     RET 
                                    755 
                                    756 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    757 ;  UDIV10 ( ut -- ut )
                                    758 ;  divide a 48 bits uint by 10 
                                    759 ;  used to scale down MM* 
                                    760 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00B2DD                        761 UDIV10:
      00B2DD 90 93            [ 1]  762     LDW Y,X 
      00B2DF 90 FE            [ 2]  763     LDW Y,(Y)
      00B2E1 A6 0A            [ 1]  764     LD A,#10 
      00B2E3 90 62            [ 2]  765     DIV Y,A 
      00B2E5 FF               [ 2]  766     LDW (X),Y 
      00B2E6 90 95            [ 1]  767     LD YH,A 
      00B2E8 E6 02            [ 1]  768     LD A,(2,X)
      00B2EA 90 97            [ 1]  769     LD YL,A 
      00B2EC A6 0A            [ 1]  770     LD A,#10 
      00B2EE 90 62            [ 2]  771     DIV Y,A 
      00B2F0 90 95            [ 1]  772     LD YH,A 
      00B2F2 90 9F            [ 1]  773     LD A,YL 
      00B2F4 E7 02            [ 1]  774     LD (2,X),A 
      00B2F6 E6 03            [ 1]  775     LD A,(3,X)
      00B2F8 90 97            [ 1]  776     LD YL,A 
      00B2FA A6 0A            [ 1]  777     LD A,#10 
      00B2FC 90 62            [ 2]  778     DIV Y,A 
      00B2FE 90 95            [ 1]  779     LD YH,A 
      00B300 90 9F            [ 1]  780     LD A,YL 
      00B302 E7 03            [ 1]  781     LD (3,X),A 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 182.
Hexadecimal [24-Bits]



      00B304 E6 04            [ 1]  782     LD A,(4,X)
      00B306 90 97            [ 1]  783     LD YL,A 
      00B308 A6 0A            [ 1]  784     LD A,#10 
      00B30A 90 62            [ 2]  785     DIV Y,A 
      00B30C 90 95            [ 1]  786     LD YH,A 
      00B30E 90 9F            [ 1]  787     LD A,YL 
      00B310 E7 04            [ 1]  788     LD (4,X),A 
      00B312 E6 05            [ 1]  789     LD A,(5,X)
      00B314 90 97            [ 1]  790     LD YL,A 
      00B316 A6 0A            [ 1]  791     LD A,#10 
      00B318 90 62            [ 2]  792     DIV Y,A 
      00B31A 90 9F            [ 1]  793     LD A,YL 
      00B31C E7 05            [ 1]  794     LD (5,X),A 
      00B31E 81               [ 4]  795     RET 
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
      00329F                        806     _HEADER MMSTAR,3,"MM*"
      00B31F B2 AD                    1         .word LINK 
                           0032A1     2         LINK=.
      00B321 03                       3         .byte 3  
      00B322 4D 4D 2A                 4         .ascii "MM*"
      00B325                          5         MMSTAR:
      00B325 CD 88 A8         [ 4]  807     CALL DDUP
      00B328 CD A9 23         [ 4]  808     CALL DZEQUAL
      0032AB                        809     _TBRAN MMSTA2
      00B32B CD 85 27         [ 4]    1     CALL TBRAN 
      00B32E B3 3B                    2     .word MMSTA2 
      00B330                        810 MMSTA1:
      00B330 CD AA 63         [ 4]  811     CALL DOVER 
      00B333 CD A9 23         [ 4]  812     CALL DZEQUAL 
      0032B6                        813     _QBRAN MMSTA3 
      00B336 CD 85 19         [ 4]    1     CALL QBRAN
      00B339 B3 46                    2     .word MMSTA3
      00B33B                        814 MMSTA2: ; ( -- 0 0 0 )
      00B33B 1C 00 02         [ 2]  815     ADDW X,#2 
      00B33E 90 5F            [ 1]  816     CLRW Y 
      00B340 FF               [ 2]  817     LDW (X),Y 
      00B341 EF 02            [ 2]  818     LDW (2,X),Y
      00B343 EF 04            [ 2]  819     LDW (4,X),Y 
      00B345 81               [ 4]  820     RET 
      00B346                        821 MMSTA3:
      00B346 CD A7 46         [ 4]  822     CALL DSIGN 
      00B349 CD 86 63         [ 4]  823     CALL TOR    ; R: m2sign 
      00B34C CD A7 35         [ 4]  824     CALL DABS   ; m1 um2 
      00B34F CD A8 4E         [ 4]  825     CALL DSWAP  ; um2 m1 
      00B352 CD A7 46         [ 4]  826     CALL DSIGN  ; um2 m1 m1sign 
      00B355 CD 85 B5         [ 4]  827     CALL RFROM 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 183.
Hexadecimal [24-Bits]



      00B358 CD 87 20         [ 4]  828     CALL XORR 
      00B35B CD 86 63         [ 4]  829     CALL TOR   ; R: product_sign 
      00B35E CD A7 35         [ 4]  830     CALL DABS  ; um2 um1  
      00B361 CD A9 9D         [ 4]  831     CALL DTOR  ; um2 
      00B364 CD 86 9A         [ 4]  832     CALL DUPP  ; um2 um2hi 
      00B367 CD 85 C6         [ 4]  833     CALL RAT   ; um2 um2hi um1hi
                                    834 ; first partial product  
                                    835 ; pd1=um2hi*um1hi 
      00B36A CD 8B 97         [ 4]  836     CALL STAR 
      00B36D CD 8C 84         [ 4]  837     CALL ZERO 
      00B370 CD 86 AA         [ 4]  838     CALL SWAPP ; pd1<<16  
      00B373 CD A8 4E         [ 4]  839     CALL DSWAP ; pd1 um2 
      00B376 CD 86 C2         [ 4]  840     CALL OVER  ; pd1 um2 um2lo 
      00B379 CD 85 B5         [ 4]  841     CALL RFROM ; pd1 um2 um2lo um1hi 
                                    842 ; pd2=um2lo*um1hi 
      00B37C CD 8B 4D         [ 4]  843     CALL UMSTA ; pd1 um2 pd2 
      00B37F CD A8 4E         [ 4]  844     CALL DSWAP ; pd1 pd2 um2 
      00B382 CD 85 C6         [ 4]  845     CALL RAT   ; pd1 pd2 um2 um1lo 
                                    846 ; pd3= um2hi*um1lo 
      00B385 CD 8B 4D         [ 4]  847     CALL UMSTA ; pd1 pd2 um2lo pd3 
      00B388 CD 88 5E         [ 4]  848     CALL ROT ; pd1 pd2 pd3 um2lo 
      00B38B CD 86 63         [ 4]  849     CALL TOR ; pd1 pd2 pd3 R: psign um1lo um2lo 
                                    850 ; pd1+pd2+pd3  pd1
      00B38E CD AC 4C         [ 4]  851     CALL DPLUS 
      00B391 CD AC 4C         [ 4]  852     CALL DPLUS  
      00B394 CD A9 BB         [ 4]  853     CALL DRFROM ; triple um2lo um1lo 
                                    854 ; last partial product um2lo*um1lo 
      00B397 CD 8B 4D         [ 4]  855     CALL UMSTA ; prod pd4 
                                    856 ; mm*=prod<<16+pd4  
      00B39A CD A9 9D         [ 4]  857     CALL DTOR ;   R: psign pd4lo pd4hi  
                                    858  ; add pd4hi to prodlo and propagate carry 
      00B39D 90 93            [ 1]  859     LDW Y,X 
      00B39F 90 EE 02         [ 2]  860     LDW Y,(2,Y)  ; prodlo 
      00B3A2 72 F9 01         [ 2]  861     ADDW Y,(1,SP)  ; prodlo+pd4hi 
      00B3A5 17 01            [ 2]  862     LDW (1,SP),Y    ; plo phi  
      00B3A7 90 93            [ 1]  863     LDW Y,X
      00B3A9 90 FE            [ 2]  864     LDW Y,(Y) ; prodhi  
      00B3AB 24 04            [ 1]  865     JRNC MMSTA4
      00B3AD 72 A9 00 01      [ 2]  866     ADDW Y,#1 ; add carry 
      00B3B1                        867 MMSTA4:     
      00B3B1 1D 00 02         [ 2]  868     SUBW X,#2 
      00B3B4 FF               [ 2]  869     LDW (X),Y 
      00B3B5 90 85            [ 2]  870     POPW Y 
      00B3B7 EF 02            [ 2]  871     LDW (2,X),Y 
      00B3B9 90 85            [ 2]  872     POPW Y 
      00B3BB EF 04            [ 2]  873     LDW (4,X),Y
      00B3BD CD 8C 84         [ 4]  874     CALL ZERO 
      00B3C0 CD 86 63         [ 4]  875     CALL TOR 
      00B3C3                        876 MMSTA5:
      00B3C3 CD 88 4D         [ 4]  877     CALL QDUP 
      003346                        878     _QBRAN MMSTA6 
      00B3C6 CD 85 19         [ 4]    1     CALL QBRAN
      00B3C9 B3 D9                    2     .word MMSTA6
      00B3CB CD B2 DD         [ 4]  879     CALL UDIV10 
      00B3CE CD 85 B5         [ 4]  880     CALL RFROM 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 184.
Hexadecimal [24-Bits]



      00B3D1 CD 8C 18         [ 4]  881     CALL ONEP 
      00B3D4 CD 86 63         [ 4]  882     CALL TOR 
      00B3D7 20 EA            [ 2]  883     JRA MMSTA5 
                                    884 ; now scale to double 
                                    885 ; scale further <= MAX_MANTISSA 
      00B3D9                        886 MMSTA6: 
      00B3D9 CD 85 B5         [ 4]  887     CALL RFROM 
      00B3DC CD 88 7D         [ 4]  888     CALL NROT 
      00B3DF CD B2 B5         [ 4]  889     CALL SCALETOM
      00B3E2 CD A9 9D         [ 4]  890     CALL DTOR 
      00B3E5 CD 88 BD         [ 4]  891     CALL PLUS 
      00B3E8 CD A9 BB         [ 4]  892     CALL DRFROM 
      00B3EB CD 85 B5         [ 4]  893     CALL RFROM
      00336E                        894     _QBRAN MMSTA7
      00B3EE CD 85 19         [ 4]    1     CALL QBRAN
      00B3F1 B3 F6                    2     .word MMSTA7
      00B3F3 CD 89 19         [ 4]  895     CALL DNEGA
      00B3F6                        896 MMSTA7:
      00B3F6 CD 88 5E         [ 4]  897     CALL ROT ; m e 
      00B3F9 81               [ 4]  898     RET 
                                    899 
                                    900 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    901 ;    F* ( f#1 f#2 -- f#3 )
                                    902 ;    float product 
                                    903 ;    f#3=f#1 * f#2 
                                    904 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00337A                        905     _HEADER FSTAR,2,"F*"
      00B3FA B3 21                    1         .word LINK 
                           00337C     2         LINK=.
      00B3FC 02                       3         .byte 2  
      00B3FD 46 2A                    4         .ascii "F*"
      00B3FF                          5         FSTAR:
      00B3FF CD AD F9         [ 4]  906     CALL ATEXP ; f#1 m2 e2 
      00B402 CD 86 63         [ 4]  907     CALL TOR   
      00B405 CD A8 4E         [ 4]  908     CALL DSWAP ; m2 f#1
      00B408 CD AD F9         [ 4]  909     CALL ATEXP ; m2 m1 e1 
      00B40B CD 85 B5         [ 4]  910     CALL RFROM ; m2 m1 e1 e2 
      00B40E CD 88 BD         [ 4]  911     CALL PLUS  ; m2 m1 e 
      00B411 CD 86 63         [ 4]  912     CALL TOR   ; m2 m1 R: e 
      00B414 CD B3 25         [ 4]  913     CALL MMSTAR ; m2*m1 e   
      00B417 CD 85 B5         [ 4]  914     CALL RFROM 
      00B41A CD 88 BD         [ 4]  915     CALL PLUS 
      00B41D CD AE 2B         [ 4]  916     CALL STEXP ; f#3 
      00B420 81               [ 4]  917     RET 
                                    918 
                                    919 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    920 ;  F/ ( f#1 f#2 -- f#3 )
                                    921 ;  float division
                                    922 ;  f#3 = f#1/f#2
                                    923 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0033A1                        924     _HEADER FSLASH,2,"F/"
      00B421 B3 FC                    1         .word LINK 
                           0033A3     2         LINK=.
      00B423 02                       3         .byte 2  
      00B424 46 2F                    4         .ascii "F/"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 185.
Hexadecimal [24-Bits]



      00B426                          5         FSLASH:
      00B426 CD AD F9         [ 4]  925     CALL ATEXP  ; f#1 m2 e2 
      00B429 CD 86 63         [ 4]  926     CALL TOR    ; f#1 m2   R: e2 
      00B42C CD A7 46         [ 4]  927     CALL DSIGN  ; f#1 m2 m2sign 
      00B42F CD 86 63         [ 4]  928     CALL TOR    ; F#1 m2 R: e2 m2s 
      00B432 CD A7 35         [ 4]  929     CALL DABS   ; F#1 um2 
      00B435 CD A8 4E         [ 4]  930     CALL DSWAP  ; m2 f#1 
      00B438 CD AD F9         [ 4]  931     CALL ATEXP  ; m2 m1 e1 
      00B43B CD 8C 8F         [ 4]  932     CALL ONE    ; e2 slot on rstack  
      00B43E CD 86 20         [ 4]  933     CALL NRAT   ; m2 m1 e1 e2 
      00B441 CD 89 53         [ 4]  934     CALL SUBB   ; m2 m1 e 
      00B444 CD 8C 8F         [ 4]  935     CALL ONE    ; e slot on rstack 
      00B447 CD 86 3F         [ 4]  936     CALL NRSTO  ; m2 m1 R: e m2s 
      00B44A CD A7 46         [ 4]  937     CALL DSIGN  ; m2 m1 m1sign 
      00B44D CD 85 B5         [ 4]  938     CALL RFROM  ; m2 m1 m1s m2s  
      00B450 CD 87 20         [ 4]  939     CALL XORR   ; m2 m1 quot_sign R: e 
      00B453 CD 85 B5         [ 4]  940     CALL RFROM   
      00B456 CD A9 9D         [ 4]  941     CALL DTOR   ; m2 m1 R: qs e  
      00B459 CD A7 35         [ 4]  942     CALL DABS   ; um2 um1 R: qs e  
      00B45C CD A8 4E         [ 4]  943     CALL DSWAP  ; m1 m2 R: qs e
      00B45F CD 88 A8         [ 4]  944     CALL DDUP  ; m1 m2 m2 R: qs e
      00B462 CD A9 9D         [ 4]  945     CALL DTOR  ; m1 m2 R: qs e m2 ( keep divisor need later ) 
      00B465 CD AB 54         [ 4]  946     CALL UDSLMOD ; remainder m1/m2 R: e m2 
      00B468                        947 FSLASH1: 
      00B468 CD AA 63         [ 4]  948     CALL DOVER ; if remainder null done 
      00B46B CD A9 23         [ 4]  949     CALL DZEQUAL 
      0033EE                        950     _TBRAN FSLASH8 
      00B46E CD 85 27         [ 4]    1     CALL TBRAN 
      00B471 B4 CB                    2     .word FSLASH8 
                                    951 ; get fractional digits from remainder until mantissa saturate
                                    952 ; remainder mantissa R: e divisor 
                                    953 ; check for mantissa saturation 
      00B473 CD 88 A8         [ 4]  954     CALL DDUP 
      0033F6                        955     _DOLIT 0XCCCC 
      00B476 CD 84 F0         [ 4]    1     CALL DOLIT 
      00B479 CC CC                    2     .word 0XCCCC 
      0033FB                        956     _DOLIT 0xC
      00B47B CD 84 F0         [ 4]    1     CALL DOLIT 
      00B47E 00 0C                    2     .word 0xC 
      00B480 CD A9 60         [ 4]  957     CALL DGREAT 
      003403                        958     _TBRAN FSLASH8 ; another loop would result in mantissa overflow 
      00B483 CD 85 27         [ 4]    1     CALL TBRAN 
      00B486 B4 CB                    2     .word FSLASH8 
                                    959 ; multiply mantissa by 10 
      003408                        960     _DOLIT 10 
      00B488 CD 84 F0         [ 4]    1     CALL DOLIT 
      00B48B 00 0A                    2     .word 10 
      00B48D CD 8C 84         [ 4]  961     CALL ZERO 
      00B490 CD AB 0B         [ 4]  962     CALL DSTAR 
                                    963 ; mutliply remainder by 10     
      00B493 CD A8 4E         [ 4]  964     CALL DSWAP 
      003416                        965     _DOLIT 10 
      00B496 CD 84 F0         [ 4]    1     CALL DOLIT 
      00B499 00 0A                    2     .word 10 
      00B49B CD 8C 84         [ 4]  966     CALL ZERO 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 186.
Hexadecimal [24-Bits]



      00B49E CD AB 0B         [ 4]  967     CALL DSTAR 
                                    968 ; divide remainder by m2     
      00B4A1 CD A9 D3         [ 4]  969     CALL DRAT  ; mantissa remainder divisor R: e divisor 
      00B4A4 CD AB 54         [ 4]  970     CALL UDSLMOD ; mantissa dr dq R: qs e divisor 
      00B4A7 CD A8 4E         [ 4]  971     CALL DSWAP ; mantissa frac_digit remainder R: qs e divisor  
      00B4AA CD A9 9D         [ 4]  972     CALL DTOR  ; mantissa frac_digit R: qs e divisor remainder 
      00B4AD CD AC 4C         [ 4]  973     CALL DPLUS ; mantissa+frac_digit 
      00B4B0 CD A9 BB         [ 4]  974     CALL DRFROM ; mantissa remainder R: qs e divisor  
      00B4B3 CD A8 4E         [ 4]  975     CALL DSWAP  ; remainder mantissa  
                                    976 ; increment e 
      003436                        977     _DOLIT 2    ; e slot on rstack 
      00B4B6 CD 84 F0         [ 4]    1     CALL DOLIT 
      00B4B9 00 02                    2     .word 2 
      00B4BB CD 86 20         [ 4]  978     CALL NRAT   ;  2 NR@ -- e 
      00B4BE CD 8C 18         [ 4]  979     CALL ONEP   ; increment exponent 
      003441                        980     _DOLIT 2 
      00B4C1 CD 84 F0         [ 4]    1     CALL DOLIT 
      00B4C4 00 02                    2     .word 2 
      00B4C6 CD 86 3F         [ 4]  981     CALL NRSTO  ; e 2 NR! , update e on rstack     
      00B4C9 20 9D            [ 2]  982     JRA FSLASH1
      00B4CB                        983 FSLASH8: ; remainder mantissa R: qs e divisor 
      00B4CB CD A8 4E         [ 4]  984     CALL DSWAP  
      00344E                        985     _DDROP  ; drop remainder     
      00B4CE 1C 00 04         [ 2]    1    ADDW X,#2*CELLL 
      00B4D1 CD A9 BB         [ 4]  986     CALL DRFROM
      003454                        987     _DDROP  ; drop divisor 
      00B4D4 1C 00 04         [ 2]    1    ADDW X,#2*CELLL 
      00B4D7 CD 96 66         [ 4]  988     CALL JFETCH    ; quotient sign 
      00345A                        989     _QBRAN FSLASH9 
      00B4DA CD 85 19         [ 4]    1     CALL QBRAN
      00B4DD B4 E2                    2     .word FSLASH9
      00B4DF CD 89 19         [ 4]  990     CALL DNEGA  
      00B4E2                        991 FSLASH9:
      00B4E2 CD 85 B5         [ 4]  992     CALL RFROM  ; exponent 
      00B4E5 CD AE 2B         [ 4]  993     CALL STEXP 
      00B4E8 CD 85 B5         [ 4]  994     CALL RFROM 
      00346B                        995     _DROP ; drop qs 
      00B4EB 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00B4EE 81               [ 4]  996     RET 
                                    997 
                                    998 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    999 ;   D>F  ( # -- f# )
                                   1000 ;   convert double to float 
                                   1001 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00346F                       1002     _HEADER DTOF,3,"D>F"
      00B4EF B4 23                    1         .word LINK 
                           003471     2         LINK=.
      00B4F1 03                       3         .byte 3  
      00B4F2 44 3E 46                 4         .ascii "D>F"
      00B4F5                          5         DTOF:
      00B4F5 CD A7 46         [ 4] 1003     CALL DSIGN 
      00B4F8 CD 86 63         [ 4] 1004     CALL TOR
      00B4FB CD A7 35         [ 4] 1005     CALL DABS  
      00B4FE                       1006 DTOF1:      
      00B4FE CD B2 B5         [ 4] 1007     CALL SCALETOM 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 187.
Hexadecimal [24-Bits]



      00B501 CD 85 B5         [ 4] 1008     CALL RFROM
      003484                       1009     _QBRAN DTOF2 
      00B504 CD 85 19         [ 4]    1     CALL QBRAN
      00B507 B5 0C                    2     .word DTOF2
      00B509 CD 89 19         [ 4] 1010     CALL DNEGA 
      00B50C                       1011 DTOF2: 
      00B50C CD 88 5E         [ 4] 1012     CALL ROT 
      00B50F CD AE 2B         [ 4] 1013     CALL STEXP 
      00B512 81               [ 4] 1014     RET 
                                   1015 
                                   1016 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1017 ;   F>D  ( f# -- # )
                                   1018 ;  convert float to double 
                                   1019 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      003493                       1020     _HEADER FTOD,3,"F>D"
      00B513 B4 F1                    1         .word LINK 
                           003495     2         LINK=.
      00B515 03                       3         .byte 3  
      00B516 46 3E 44                 4         .ascii "F>D"
      00B519                          5         FTOD:
      00B519 CD AD F9         [ 4] 1021     CALL ATEXP ; m e 
      00B51C CD 88 4D         [ 4] 1022     CALL QDUP
      00349F                       1023     _QBRAN FTOD9
      00B51F CD 85 19         [ 4]    1     CALL QBRAN
      00B522 B5 A3                    2     .word FTOD9
      00B524 CD 86 63         [ 4] 1024     CALL TOR 
      00B527 CD A7 46         [ 4] 1025     CALL DSIGN 
      00B52A CD 88 7D         [ 4] 1026     CALL NROT 
      00B52D CD A7 35         [ 4] 1027     CALL DABS
      00B530 CD 85 B5         [ 4] 1028     CALL RFROM  
      00B533 CD 86 9A         [ 4] 1029     CALL DUPP   
      00B536 CD 86 D1         [ 4] 1030     CALL ZLESS 
      0034B9                       1031     _QBRAN FTOD4 
      00B539 CD 85 19         [ 4]    1     CALL QBRAN
      00B53C B5 6E                    2     .word FTOD4
                                   1032 ; negative exponent 
      00B53E CD 89 6D         [ 4] 1033     CALL ABSS 
      00B541 CD 86 63         [ 4] 1034     CALL TOR
      00B544 20 19            [ 2] 1035     JRA FTOD2  
      00B546                       1036 FTOD1:
      00B546 CD 88 A8         [ 4] 1037     CALL DDUP 
      00B549 CD A9 23         [ 4] 1038     CALL DZEQUAL 
      0034CC                       1039     _TBRAN FTOD3 
      00B54C CD 85 27         [ 4]    1     CALL TBRAN 
      00B54F B5 66                    2     .word FTOD3 
      0034D1                       1040     _DOLIT 10 
      00B551 CD 84 F0         [ 4]    1     CALL DOLIT 
      00B554 00 0A                    2     .word 10 
      00B556 CD A7 60         [ 4] 1041     CALL DSLMOD 
      00B559 CD 88 5E         [ 4] 1042     CALL ROT 
      0034DC                       1043     _DROP
      00B55C 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00B55F                       1044 FTOD2:      
      0034DF                       1045     _DONXT FTOD1
      00B55F CD 85 04         [ 4]    1     CALL DONXT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 188.
Hexadecimal [24-Bits]



      00B562 B5 46                    2     .word FTOD1 
      00B564 20 32            [ 2] 1046     JRA FTOD8   
      00B566                       1047 FTOD3: 
      00B566 CD 85 B5         [ 4] 1048     CALL RFROM 
      0034E9                       1049     _DROP 
      00B569 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00B56C 20 2A            [ 2] 1050     JRA FTOD8  
                                   1051 ; positive exponent 
      00B56E                       1052 FTOD4:
      00B56E CD 86 63         [ 4] 1053     CALL TOR 
      00B571 20 20            [ 2] 1054     JRA FTOD6
      00B573                       1055 FTOD5:
      00B573 CD 88 A8         [ 4] 1056     CALL DDUP 
      0034F6                       1057     _DOLIT 0XCCCC
      00B576 CD 84 F0         [ 4]    1     CALL DOLIT 
      00B579 CC CC                    2     .word 0XCCCC 
      0034FB                       1058     _DOLIT 0XCCC  
      00B57B CD 84 F0         [ 4]    1     CALL DOLIT 
      00B57E 0C CC                    2     .word 0XCCC 
      00B580 CD A9 60         [ 4] 1059     CALL DGREAT 
      003503                       1060     _TBRAN FTOD3 
      00B583 CD 85 27         [ 4]    1     CALL TBRAN 
      00B586 B5 66                    2     .word FTOD3 
      003508                       1061     _DOLIT 10 
      00B588 CD 84 F0         [ 4]    1     CALL DOLIT 
      00B58B 00 0A                    2     .word 10 
      00B58D CD 8C 84         [ 4] 1062     CALL ZERO 
      00B590 CD AB 0B         [ 4] 1063     CALL DSTAR 
      00B593                       1064 FTOD6: 
      003513                       1065     _DONXT FTOD5 
      00B593 CD 85 04         [ 4]    1     CALL DONXT 
      00B596 B5 73                    2     .word FTOD5 
      00B598                       1066 FTOD8:
      00B598 CD 88 5E         [ 4] 1067     CALL ROT 
      00351B                       1068     _QBRAN FTOD9 
      00B59B CD 85 19         [ 4]    1     CALL QBRAN
      00B59E B5 A3                    2     .word FTOD9
      00B5A0 CD 89 19         [ 4] 1069     CALL DNEGA
      00B5A3                       1070 FTOD9:          
      00B5A3 81               [ 4] 1071     RET 
                                   1072 
                                   1073 
                                   1074 ;;;;;;;;;;;;;;;;;;;;;;;;
                                   1075 ;   F0< ( f# -- f )
                                   1076 ;   true if f#<0
                                   1077 ;;;;;;;;;;;;;;;;;;;;;;;;
      003524                       1078     _HEADER FZLESS,3,"F0<"
      00B5A4 B5 15                    1         .word LINK 
                           003526     2         LINK=.
      00B5A6 03                       3         .byte 3  
      00B5A7 46 30 3C                 4         .ascii "F0<"
      00B5AA                          5         FZLESS:
      00B5AA CD AD F9         [ 4] 1079     CALL ATEXP 
      00352D                       1080     _DROP 
      00B5AD 1C 00 02         [ 2]    1     ADDW X,#CELLL  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 189.
Hexadecimal [24-Bits]



      00B5B0 CD 86 AA         [ 4] 1081     CALL SWAPP 
      003533                       1082     _DROP 
      00B5B3 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00B5B6 CD 86 D1         [ 4] 1083     CALL ZLESS 
      00B5B9 81               [ 4] 1084     RET
                                   1085 
                                   1086 ;;;;;;;;;;;;;;;;;;;;;;;;
                                   1087 ;   F< ( f#1 f#2 -- f )
                                   1088 ; true if f#1 < f#1 
                                   1089 ;;;;;;;;;;;;;;;;;;;;;;;
      00353A                       1090     _HEADER FLESS,2,"F<"
      00B5BA B5 A6                    1         .word LINK 
                           00353C     2         LINK=.
      00B5BC 02                       3         .byte 2  
      00B5BD 46 3C                    4         .ascii "F<"
      00B5BF                          5         FLESS:
      00B5BF CD B2 72         [ 4] 1091     CALL FSUB  
      00B5C2 CC B5 AA         [ 2] 1092     JP FZLESS
                                   1093 
                                   1094 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1095 ;   F> ( f#1 f#2 -- f )
                                   1096 ;   true fi f#1>f#2
                                   1097 ;;;;;;;;;;;;;;;;;;;;;;;;;
      003545                       1098     _HEADER FGREAT,2,"F>"
      00B5C5 B5 BC                    1         .word LINK 
                           003547     2         LINK=.
      00B5C7 02                       3         .byte 2  
      00B5C8 46 3E                    4         .ascii "F>"
      00B5CA                          5         FGREAT:
      00B5CA CD A8 4E         [ 4] 1099     CALL DSWAP 
      00B5CD CC B5 BF         [ 2] 1100     JP FLESS 
                                   1101 
                                   1102 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1103 ;   F= ( f#1 f#2 -- f ) 
                                   1104 ;   true fi f#1==f#2 
                                   1105 ;;;;;;;;;;;;;;;;;;;;;;;;;
      003550                       1106     _HEADER FEQUAL,2,"F="
      00B5D0 B5 C7                    1         .word LINK 
                           003552     2         LINK=.
      00B5D2 02                       3         .byte 2  
      00B5D3 46 3D                    4         .ascii "F="
      00B5D5                          5         FEQUAL:
      00B5D5 CC A9 3F         [ 2] 1107     JP DEQUAL 
                                   1108 
                                   1109 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1110 ;   F0= ( f# -- f )
                                   1111 ;   true if f# is 0.0 
                                   1112 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      003558                       1113     _HEADER FZEQUAL,3,"F0="
      00B5D8 B5 D2                    1         .word LINK 
                           00355A     2         LINK=.
      00B5DA 03                       3         .byte 3  
      00B5DB 46 30 3D                 4         .ascii "F0="
      00B5DE                          5         FZEQUAL:
      00B5DE CD AD F9         [ 4] 1114     CALL ATEXP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 190.
Hexadecimal [24-Bits]



      003561                       1115     _DROP 
      00B5E1 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00B5E4 CC A9 23         [ 2] 1116     JP DZEQUAL  
                                   1117 
                                   1118 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1119 ;  FNEGATE ( f#1 -- f#2 )
                                   1120 ;  f#2 is negation of f#1 
                                   1121 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      003567                       1122     _HEADER FNEGA,7,"FNEGATE"
      00B5E7 B5 DA                    1         .word LINK 
                           003569     2         LINK=.
      00B5E9 07                       3         .byte 7  
      00B5EA 46 4E 45 47 41 54 45     4         .ascii "FNEGATE"
      00B5F1                          5         FNEGA:
      00B5F1 CD AD F9         [ 4] 1123     CALL ATEXP 
      00B5F4 CD 86 63         [ 4] 1124     CALL TOR 
      00B5F7 CD 89 19         [ 4] 1125     CALL DNEGA
      00B5FA CD 85 B5         [ 4] 1126     CALL RFROM 
      00B5FD CD AE 2B         [ 4] 1127     CALL STEXP 
      00B600 CD AD AC         [ 4] 1128     CALL SFN 
      00B603 81               [ 4] 1129     RET 
                                   1130 
                                   1131 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1132 ;  FABS ( f#1 -- abs(f#1) )
                                   1133 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      003584                       1134     _HEADER FABS,4,"FABS"
      00B604 B5 E9                    1         .word LINK 
                           003586     2         LINK=.
      00B606 04                       3         .byte 4  
      00B607 46 41 42 53              4         .ascii "FABS"
      00B60B                          5         FABS:
      00B60B CD AD F9         [ 4] 1135     CALL ATEXP 
      00B60E CD 86 63         [ 4] 1136     CALL TOR 
      00B611 CD 86 9A         [ 4] 1137     CALL DUPP 
      003594                       1138     _DOLIT 0X80 
      00B614 CD 84 F0         [ 4]    1     CALL DOLIT 
      00B617 00 80                    2     .word 0X80 
      00B619 CD 86 F7         [ 4] 1139     CALL ANDD 
      00359C                       1140     _QBRAN FABS1
      00B61C CD 85 19         [ 4]    1     CALL QBRAN
      00B61F B6 24                    2     .word FABS1
      00B621 CD 89 19         [ 4] 1141     CALL DNEGA 
      00B624                       1142 FABS1: 
      00B624 CD 85 B5         [ 4] 1143     CALL RFROM 
      00B627 CD AE 2B         [ 4] 1144     CALL STEXP 
      00B62A CD AD AC         [ 4] 1145     CALL SFN 
      00B62D 81               [ 4] 1146     RET 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 191.
Hexadecimal [24-Bits]



                                   4654 .endif 
                                   4655 
                                   4656 ;===============================================================
                                   4657 
                           003586  4658 LASTN =	LINK   ;last name defined
                                   4659 
                                   4660 ; application code begin here
      00B680                       4661 	.bndry 128 ; align on flash block  
      00B680                       4662 app_space: 
                                   4663 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 192.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   6 AB1        0008F6 R   |   6 ABOR1      0013FB R
  6 ABOR2      001412 R   |   6 ABORQ      0013F3 R   |   6 ABORT      0013E4 R
  6 ABRTQ      0016DE R   |   6 ABSS       0008ED R   |   6 ACCEP      00137A R
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
  6 ADRADJ     0007BD R   |     AFR     =  004803     |     AFR0_ADC=  000000 
    AFR1_TIM=  000001     |     AFR2_CCO=  000002     |     AFR3_TIM=  000003 
    AFR4_TIM=  000004     |     AFR5_TIM=  000005     |     AFR6_I2C=  000006 
    AFR7_BEE=  000007     |   6 AFT        0016C9 R   |   6 AGAIN      001613 R
  6 AHEAD      001676 R   |   6 ALLOT      001520 R   |   6 ANDD       000677 R
    APP_CP  =  004004     |     APP_LAST=  004000     |     APP_RUN =  004002 
    APP_VP  =  004006     |   6 AT         0004E4 R   |   6 ATEXE      000D14 R
  6 ATEXP      002D79 R   |   6 ATEXP1     002D8E R   |   6 ATEXP2     002D9E R
  6 AUTORUN    000129 R   |     AWU_APR =  0050F1     |     AWU_CSR =  0050F0 
    AWU_TBR =  0050F2     |     B0_MASK =  000001     |     B115200 =  000006 
  6 B115K2     0003E1 R   |     B19200  =  000003     |   6 B19K2      0003BE R
    B1_MASK =  000002     |     B230400 =  000007     |     B2400   =  000000 
  6 B2K4       00038F R   |     B2_MASK =  000004     |     B38400  =  000004 
    B3_MASK =  000008     |     B460800 =  000008     |     B4800   =  000001 
  6 B4K8       00039D R   |     B4_MASK =  000010     |     B57600  =  000005 
  6 B57K6      0003CF R   |     B5_MASK =  000020     |     B6_MASK =  000040 
    B7_MASK =  000080     |     B921600 =  000009     |     B9600   =  000002 
  6 B9K6       0003AD R   |   6 BACK1      001322 R   |   6 BASE       0006E0 R
    BASEE   =  00000A     |   6 BAUD       0003F1 R   |     BCNT    =  000001 
  6 BCOMP      001563 R   |   6 BDIGS      000E0C R   |     BEEP_BIT=  000004 
    BEEP_CSR=  0050F3     |     BEEP_MAS=  000010     |     BEEP_POR=  00000F 
  6 BEGIN      0015F5 R   |     BIT0    =  000000     |     BIT1    =  000001 
    BIT2    =  000002     |     BIT3    =  000003     |     BIT4    =  000004 
    BIT5    =  000005     |     BIT6    =  000006     |     BIT7    =  000007 
  6 BKSLA      001177 R   |   6 BKSP       0012F2 R   |     BKSPP   =  000008 
  6 BLANK      000BF7 R   |     BLOCK_SI=  000080     |     BOOT_ROM=  006000 
    BOOT_ROM=  007FFF     |   6 BRAN       0004B5 R   |     BTW     =  000001 
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
    CASE_SEN=  000000     |   6 CAT        000502 R   |   6 CCOMMA     001545 R
    CC_C    =  000000     |     CC_H    =  000004     |     CC_I0   =  000003 
    CC_I1   =  000005     |     CC_N    =  000002     |     CC_V    =  000007 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 193.
Hexadecimal [24-Bits]

Symbol Table

    CC_Z    =  000001     |     CELLL   =  000002     |   6 CELLM      000B7C R
  6 CELLP      000B6D R   |   6 CELLS      000B8B R   |     CFG_GCR =  007F60 
    CFG_GCR_=  000001     |     CFG_GCR_=  000000     |   6 CHAR1      000F62 R
  6 CHAR2      000F65 R   |   6 CHKIVEC    0020E2 R   |     CLKOPT  =  004807 
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
    CLK_SWR_=  0000E1     |     CLK_SWR_=  0000D2     |   6 CMOV1      000D47 R
  6 CMOV2      000D5B R   |   6 CMOV3      000D6F R   |   6 CMOVE      000D2B R
    CNT     =  000001     |     CNT1    =  000005     |     CNT2    =  000003 
    CNTDWN  =  000032     |   6 CNTXT      000763 R   |   6 COLD       001BE3 R
  6 COLD1      001BE3 R   |   6 COLON      0018C7 R   |   6 COMMA      00152E R
  6 COMPI      001573 R   |     COMPO   =  000040     |   6 CONSTANT   001971 R
  6 COPYRIGH   001B2D R   |   6 COUNT      000CC7 R   |   6 CPP        00077F R
    CPU_A   =  007F00     |     CPU_CCR =  007F0A     |     CPU_PCE =  007F01 
    CPU_PCH =  007F02     |     CPU_PCL =  007F03     |     CPU_SPH =  007F08 
    CPU_SPL =  007F09     |     CPU_XH  =  007F04     |     CPU_XL  =  007F05 
    CPU_YH  =  007F06     |     CPU_YL  =  007F07     |   6 CR         000F8B R
  6 CREAT      00190D R   |     CRR     =  00000D     |   6 CSTOR      0004F1 R
  6 CTABLE     00245E R   |   6 CTAT       00247F R   |   6 CTINIT     0024A7 R
  6 D2SLASH    0029FC R   |   6 D2STAR     002A13 R   |   6 DABS       0026B5 R
  6 DABS1      0026BD R   |   6 DAT        000CAB R   |     DATSTK  =  001680 
  6 DBLVER     00252B R   |   6 DCLZ       0027FC R   |   6 DCLZ1      002805 R
  6 DCLZ4      00280E R   |   6 DCLZ8      00281B R   |   6 DCONST     0019A6 R
  6 DDIG       002721 R   |   6 DDIGS      002739 R   |   6 DDOT       002750 R
  6 DDOT0      002764 R   |   6 DDOT1      00277A R   |   6 DDROP      00081D R
  6 DDSLMOD    002B76 R   |   6 DDSTAR3    002ACA R   |   6 DDUP       000828 R
    DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF     |   6 DECIM      000EBC R
  6 DEPTH      000C46 R   |   6 DEQU4      0028D4 R   |   6 DEQUAL     0028BF R
    DEVID_BA=  0048CD     |     DEVID_EN=  0048D8     |     DEVID_LO=  0048D2 
    DEVID_LO=  0048D3     |     DEVID_LO=  0048D4     |     DEVID_LO=  0048D5 
    DEVID_LO=  0048D6     |     DEVID_LO=  0048D7     |     DEVID_LO=  0048D8 
    DEVID_WA=  0048D1     |     DEVID_XH=  0048CE     |     DEVID_XL=  0048CD 
    DEVID_YH=  0048D0     |     DEVID_YL=  0048CF     |   6 DGREAT     0028E0 R
  6 DGTQ1      000F01 R   |   6 DI         0000C4 R   |   6 DIG        000E35 R
  6 DIGIT      000DD0 R   |   6 DIGS       000E46 R   |   6 DIGS1      000E46 R
  6 DIGS2      000E53 R   |   6 DIGTQ      000ED0 R   |     DISCOVER=  000000 
  6 DLESS      0028EB R   |   6 DLESS4     0028FF R   |   6 DLITER     0029BC R
  6 DLSHIFT    002A2F R   |   6 DLSHIFT1   002A42 R   |   6 DLSHIFT2   002A57 R
    DM_BK1RE=  007F90     |     DM_BK1RH=  007F91     |     DM_BK1RL=  007F92 
    DM_BK2RE=  007F93     |     DM_BK2RH=  007F94     |     DM_BK2RL=  007F95 
    DM_CR1  =  007F96     |     DM_CR2  =  007F97     |     DM_CSR1 =  007F98 
    DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A     |   6 DN1        0008B4 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 194.
Hexadecimal [24-Bits]

Symbol Table

  6 DNEGA      000899 R   |   6 DOCONST    001991 R   |   6 DOLIT      000470 R
  6 DONXT      000484 R   |     DOORBELL=  000000     |   6 DOSTR      000F9B R
  6 DOT        001031 R   |   6 DOT1       001046 R   |   6 DOTI1      001AF6 R
  6 DOTID      001AE0 R   |   6 DOTO1      001487 R   |   6 DOTOK      00146D R
  6 DOTPR      001158 R   |   6 DOTQ       0016F8 R   |   6 DOTQP      000FB8 R
  6 DOTR       000FC6 R   |   6 DOTS       001A82 R   |   6 DOTS1      001A8D R
  6 DOTS2      001A96 R   |   6 DOVAR      0006D0 R   |   6 DOVER      0029E3 R
  6 DO_DCONS   0019C9 R   |     DP      =  000005     |   6 DPLUS      002BCC R
  6 DPLUS1     002BF3 R   |   6 DRAT       002953 R   |   6 DRFROM     00293B R
  6 DROP       000610 R   |   6 DROT       002868 R   |   6 DRSHIFT    002A68 R
  6 DRSHIFT1   002A6F R   |   6 DRSHIFT2   002A85 R   |   6 DSIGN      0026C6 R
  6 DSIGN1     0026D0 R   |   6 DSLA8      002BA8 R   |   6 DSLA9      002BB5 R
  6 DSLASH     002BBD R   |   6 DSLMOD     0026E0 R   |   6 DSLMOD3    0026FB R
  6 DSLMOD4    002707 R   |   6 DSLMODa    002702 R   |   6 DSLMODb    00270D R
  6 DSSTAR     0027A8 R   |   6 DSSTAR3    0027C5 R   |   6 DSTAR      002A8B R
  6 DSTOR      000C92 R   |   6 DSUB       002BFE R   |   6 DSUB1      002C25 R
  6 DSWAP      0027CE R   |   6 DTOF       003475 R   |   6 DTOF1      00347E R
  6 DTOF2      00348C R   |   6 DTOR       00291D R   |   6 DUMP       001A38 R
  6 DUMP1      001A4F R   |   6 DUMP3      001A71 R   |   6 DUMPP      001A07 R
  6 DUPP       00061A R   |   6 DVARIA     002971 R   |     DVER_MAJ=  000001 
    DVER_MIN=  000000     |   6 DZEQUAL    0028A3 R   |   6 DZLESS     002906 R
  6 DZLESS1    002910 R   |   6 EDIGS      000E71 R   |   6 EDOT       002DFF R
  6 EDOT0      002E16 R   |   6 EDOT2      002E22 R   |   6 EDOT3      002E38 R
  6 EDOT4      002E64 R   |   6 EDOT5      002E83 R   |   6 EECSTORE   001E93 R
  6 EEPCP      001CB9 R   |   6 EEPLAST    001C8C R   |   6 EEPROM     001C74 R
    EEPROM_B=  004000     |     EEPROM_E=  0047FF     |     EEPROM_R=  000010 
    EEPROM_S=  000800     |   6 EEPRUN     001CA3 R   |   6 EEPVP      001CCF R
  6 EESTORE    001EDF R   |   6 EE_CCOMM   0021A9 R   |   6 EE_COMMA   002188 R
  6 EE_CREAD   001E24 R   |   6 EE_READ    001E02 R   |   6 EI         0000BD R
  6 ELSEE      00164E R   |   6 EMIT       000437 R   |   6 ENEPER     0023C9 R
    EOL_CR  =  000001     |     EOL_LF  =  000000     |   6 EQ1        000908 R
  6 EQUAL      0008FB R   |   6 ERASE      000D9E R   |     ERR     =  00001B 
  6 EVAL       0014B0 R   |   6 EVAL1      0014B0 R   |   6 EVAL2      0014C9 R
  6 EXE1       000D22 R   |   6 EXECU      0004C5 R   |     EXT     =  000000 
    EXTI_CR1=  0050A0     |     EXTI_CR2=  0050A1     |   6 EXTRC      000DF8 R
  6 FABS       00358B R   |   6 FABS1      0035A4 R   |   6 FADDR      002276 R
  6 FALGN4     003150 R   |   6 FALGN6     00315F R   |   6 FALGN7     003186 R
  6 FALGN71    003195 R   |   6 FALGN72    0031B1 R   |   6 FALGN8     0031B4 R
  6 FALIGN     003117 R   |   6 FALSE      000869 R   |   6 FARAT      001D3A R
  6 FARCAT     001D46 R   |   6 FC_XOFF    000464 R   |   6 FC_XON     00044E R
  6 FDOT       002E92 R   |   6 FDOT0      002ED0 R   |   6 FDOT1      002EBF R
  6 FDOT10     002F23 R   |   6 FDOT2      002EDE R   |   6 FDOT3      002EF4 R
  6 FDOT6      002F01 R   |   6 FDOT7      002F03 R   |   6 FDOT8      002F0B R
  6 FDOT9      002F13 R   |   6 FEQUAL     003555 R   |   6 FER        002C97 R
  6 FGREAT     00354A R   |     FHSE    =  7A1200     |     FHSI    =  F42400 
  6 FILL       000D7E R   |   6 FILL0      000D8C R   |   6 FILL1      000D94 R
  6 FIND       00124E R   |   6 FIND1      00126C R   |   6 FIND2      00129A R
  6 FIND3      0012A6 R   |   6 FIND4      0012BA R   |   6 FIND5      0012C7 R
  6 FIND6      0012AB R   |   6 FINIT      002C8D R   |     FLASH_BA=  008000 
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
    FLASH_SI=  020000     |     FLASH_WS=  00480D     |   6 FLESS      00353F R
  6 FLOATQ     002F9B R   |   6 FLOATQ0    002FA3 R   |   6 FLOATQ1    003002 R
  6 FLOATQ2    00300B R   |   6 FLOATQ3    003013 R   |   6 FLOATQ4    003027 R
  6 FLOAT_ER   003042 R   |   6 FLOAT_ER   00303F R   |     FLOAT_MA=  000001 
    FLOAT_MI=  000000     |     FLSI    =  01F400     |   6 FMOVE      002281 R
  6 FMOVE2     0022B2 R   |   6 FNE        002CBA R   |   6 FNEGA      003571 R
  6 FOR        0015BD R   |   6 FORGET     00015A R   |   6 FORGET1    000189 R
  6 FORGET2    00020F R   |   6 FORGET4    000218 R   |   6 FORGET6    0001D1 R
  6 FOV        002CD5 R   |   6 FPLUS      0031C0 R   |   6 FPLUS1     0031E0 R
  6 FPSTOR     001C55 R   |   6 FPSW       002C69 R   |     FPTR    =  000034 
  6 FREEVAR    000225 R   |   6 FREEVAR4   00025B R   |   6 FRESET     002C7B R
  6 FSLASH     0033A6 R   |   6 FSLASH1    0033E8 R   |   6 FSLASH8    00344B R
  6 FSLASH9    003462 R   |   6 FSTAR      00337F R   |   6 FSUB       0031F2 R
  6 FSUB1      003212 R   |   6 FTOD       003499 R   |   6 FTOD1      0034C6 R
  6 FTOD2      0034DF R   |   6 FTOD3      0034E6 R   |   6 FTOD4      0034EE R
  6 FTOD5      0034F3 R   |   6 FTOD6      003513 R   |   6 FTOD8      003518 R
  6 FTOD9      003523 R   |   6 FVER       002C37 R   |   6 FZE        002CA4 R
  6 FZEQUAL    00355E R   |   6 FZLESS     00352A R   |     GPIO_BAS=  005000 
    GPIO_CR1=  000003     |     GPIO_CR2=  000004     |     GPIO_DDR=  000002 
    GPIO_IDR=  000001     |     GPIO_ODR=  000000     |     GPIO_SIZ=  000005 
  6 GREAT      000954 R   |   6 GREAT1     00095F R   |   6 HDOT       001015 R
  6 HERE       000CDE R   |   6 HEX        000EA7 R   |   6 HI         001B98 R
  6 HLD        000750 R   |   6 HOLD       000E1C R   |     HSECNT  =  004809 
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
  6 ICOLON     0018D8 R   |   6 IFETCH     0015DB R   |   6 IFF        001626 R
  6 IFMOVE     00235A R   |     IMEDD   =  000080     |   6 IMMED      0018EA R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 196.
Hexadecimal [24-Bits]

Symbol Table

  6 INCH       00042B R   |   6 INC_FPTR   001DCF R   |   6 INITOFS    0018A0 R
  6 INN        0006FE R   |     INPUT_DI=  000000     |     INPUT_EI=  000001 
    INPUT_FL=  000000     |     INPUT_PU=  000001     |   6 INTE1      00144F R
  6 INTER      001425 R   |   6 INTQ       002503 R   |     INT_ADC2=  000016 
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
    IRET_COD=  000080     |   6 ISEMI      0017EF R   |     ITC_SPR1=  007F70 
    ITC_SPR2=  007F71     |     ITC_SPR3=  007F72     |     ITC_SPR4=  007F73 
    ITC_SPR5=  007F74     |     ITC_SPR6=  007F75     |     ITC_SPR7=  007F76 
    ITC_SPR8=  007F77     |     IWDG_KR =  0050E0     |     IWDG_PR =  0050E1 
    IWDG_RLR=  0050E2     |   6 JFETCH     0015E6 R   |     JPIMM   =  0000CC 
  6 JSRC       001844 R   |   6 JSRC1      001867 R   |   6 JSRC2      00188A R
  6 KEY        000F10 R   |   6 KTAP       00133F R   |   6 KTAP1      001362 R
  6 KTAP2      001365 R   |   6 LAST       00078F R   |   6 LASTN   =  003586 R
  6 LBRAC      00145C R   |     LED2_BIT=  000005     |     LED2_MAS=  000020 
    LED2_POR=  00500A     |   6 LESS       000927 R   |     LF      =  00000A 
  6 LINK    =  003586 R   |   6 LITER      001595 R   |   6 LN2S       002425 R
  6 LOCAL      000555 R   |   6 LOCK       001DBB R   |   6 LOG2S      00240F R
  6 LSCALE     003061 R   |   6 LSHIFT     000BB6 R   |   6 LSHIFT1    000BBF R
  6 LSHIFT4    000BC7 R   |   6 LT1        000932 R   |     MASKK   =  001F7F 
  6 MAX        00096C R   |   6 MAX1       000976 R   |     MAX_MANT=  7FFFFF 
  6 MIN        000980 R   |   6 MIN1       00098A R   |   6 MMOD1      000A39 R
  6 MMOD2      000A4D R   |   6 MMOD3      000A64 R   |   6 MMSM0      0009C9 R
  6 MMSM1      0009D9 R   |   6 MMSM3      0009DD R   |   6 MMSM4      0009E9 R
  6 MMSMa      0009E4 R   |   6 MMSMb      0009EF R   |   6 MMSTA1     0032B0 R
  6 MMSTA2     0032BB R   |   6 MMSTA3     0032C6 R   |   6 MMSTA4     003331 R
  6 MMSTA5     003343 R   |   6 MMSTA6     003359 R   |   6 MMSTA7     003376 R
  6 MMSTAR     0032A5 R   |   6 MODD       000AB4 R   |   6 MONE       000C1D R
    MS      =  000030     |   6 MSEC       0002D1 R   |   6 MSMOD      000A1C R
  6 MSTA1      000B45 R   |   6 MSTAR      000B22 R   |     NAFR    =  004804 
  6 NAMEQ      0012E7 R   |   6 NAMET      0011F8 R   |     NCLKOPT =  004808 
  6 NDROT      00282C R   |   6 NEGAT      000887 R   |   6 NEG_SIGN   00256E R
  6 NEX1       000491 R   |   6 NEXT       0015CC R   |     NFLASH_W=  00480E 
    NHSECNT =  00480A     |     NOPT1   =  004802     |     NOPT2   =  004804 
    NOPT3   =  004806     |     NOPT4   =  004808     |     NOPT5   =  00480A 
    NOPT6   =  00480C     |     NOPT7   =  00480E     |     NOPTBL  =  00487F 
  6 NRAT       0005A0 R   |   6 NRDROP     00057C R   |   6 NROT       0007FD R
  6 NRSTO      0005BF R   |   6 NTIB       00070E R   |     NUBC    =  004802 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 197.
Hexadecimal [24-Bits]

Symbol Table

    NUCLEO  =  000001     |   6 NUFQ       000F26 R   |   6 NUFQ1      000F3F R
  6 NUMBQ      0025DD R   |   6 NUMQ0      00261E R   |   6 NUMQ1      002648 R
  6 NUMQ3      002672 R   |   6 NUMQ4      002690 R   |   6 NUMQ5      00269B R
  6 NUMQ6      00269D R   |   6 NUMQ8      0026A5 R   |     NWDGOPT =  004806 
    NWDGOPT_=  FFFFFFFD     |     NWDGOPT_=  FFFFFFFC     |     NWDGOPT_=  FFFFFFFF 
    NWDGOPT_=  FFFFFFFE     |   6 NonHandl   000000 R   |   6 OFFSET     0007B4 R
    OFS     =  000005     |   6 ONE        000C0F R   |   6 ONEM       000BA5 R
  6 ONEP       000B98 R   |     OPT     =  000002     |     OPT0    =  004800 
    OPT1    =  004801     |     OPT2    =  004803     |     OPT3    =  004805 
    OPT4    =  004807     |     OPT5    =  004809     |     OPT6    =  00480B 
    OPT7    =  00480D     |     OPTBL   =  00487E     |     OPTIMIZE=  000001 
    OPTION_B=  004800     |     OPTION_E=  00487F     |     OPTION_S=  000080 
  6 ORIG       000049 R   |   6 ORR        00068B R   |   6 OUTPUT     00043C R
    OUTPUT_F=  000001     |     OUTPUT_O=  000000     |     OUTPUT_P=  000001 
    OUTPUT_S=  000000     |   6 OVER       000642 R   |   6 OVERT      0017BD R
    PA      =  000000     |   6 PACKS      000DAF R   |   6 PAD        000CEF R
  6 PAREN      001167 R   |   6 PARS       001060 R   |   6 PARS1      00108B R
  6 PARS2      0010B6 R   |   6 PARS3      0010B9 R   |   6 PARS4      0010C2 R
  6 PARS5      0010E5 R   |   6 PARS6      0010FA R   |   6 PARS7      001109 R
  6 PARS8      001118 R   |   6 PARSE      001129 R   |   6 PARSEXP_   002F7E R
  6 PAUSE      0002E1 R   |     PA_BASE =  005000     |     PA_CR1  =  005003 
    PA_CR2  =  005004     |     PA_DDR  =  005002     |     PA_IDR  =  005001 
    PA_ODR  =  005000     |     PB      =  000005     |     PB_BASE =  005005 
    PB_CR1  =  005008     |     PB_CR2  =  005009     |     PB_DDR  =  005007 
    PB_IDR  =  005006     |     PB_ODR  =  005005     |     PC      =  00000A 
    PC_BASE =  00500A     |     PC_CR1  =  00500D     |     PC_CR2  =  00500E 
    PC_DDR  =  00500C     |     PC_IDR  =  00500B     |     PC_ODR  =  00500A 
    PD      =  00000F     |   6 PDUM1      001A1A R   |   6 PDUM2      001A2B R
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
    PH_ODR  =  005023     |     PI      =  000028     |   6 PICK       000C5D R
  6 PII        002388 R   |     PI_BASE =  005028     |     PI_CR1  =  00502B 
    PI_CR2  =  00502C     |     PI_DDR  =  00502A     |     PI_IDR  =  005029 
    PI_ODR  =  005028     |   6 PLUS       00083D R   |   6 PNAM1      001762 R
  6 PRESE      0014D8 R   |   6 PRINT_VE   001B69 R   |     PROD1   =  000024 
    PROD2   =  000026     |     PROD3   =  000028     |   6 PROTECTE   000201 R
  6 PRT_LICE   001B55 R   |   6 PSTOR      000C74 R   |     PTR16   =  000035 
    PTR8    =  000036     |   6 PTRPLUS    001DE7 R   |   6 QBRAN      000499 R
  6 QDUP       0007CD R   |   6 QDUP1      0007D7 R   |     QHI     =  000007 
  6 QKEY       000419 R   |     QLBIT   =  000001     |     QLO     =  000009 
  6 QSTAC      001493 R   |   6 QUERY      0013BF R   |   6 QUEST      001053 R
  6 QUIT       0014F5 R   |   6 QUIT1      0014FD R   |   6 QUIT2      001500 R
  6 RAM2EE     002222 R   |     RAMBASE =  000000     |   6 RAMLAST    0007A2 R
    RAM_BASE=  000000     |     RAM_END =  0017FF     |     RAM_SIZE=  001800 
  6 RANDOM     00027F R   |   6 RAT        000546 R   |   6 RBRAC      001831 R
  6 REPEA      0016A9 R   |   6 RFREE      002209 R   |   6 RFROM      000535 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 198.
Hexadecimal [24-Bits]

Symbol Table

    ROP     =  004800     |   6 ROT        0007DE R   |   6 ROW2BUF    0021CB R
    ROWBUFF =  001680     |     RP0     =  00002E     |   6 RPAT       000512 R
    RPP     =  0017FF     |   6 RPSTO      00051F R   |   6 RSCALE     003085 R
  6 RSHIFT     000BD2 R   |   6 RSHIFT1    000BDB R   |   6 RSHIFT4    000BE3 R
    RST_SR  =  0050B3     |   6 RT12_2     0023F8 R   |   6 SAME1      001216 R
  6 SAME2      00123F R   |   6 SAMEQ      00120E R   |   6 SCAL1      00323B R
  6 SCAL2      00325C R   |   6 SCALDN2    003109 R   |   6 SCALDN3    00310C R
  6 SCALEDOW   0030DD R   |   6 SCALETOM   003235 R   |   6 SCALEUP    0030A6 R
  6 SCALEUP2   0030D9 R   |   6 SCALEUP3   0030DC R   |   6 SCOM1      001797 R
  6 SCOM2      00179A R   |   6 SCOMP      001779 R   |   6 SEED       000266 R
    SEEDX   =  000038     |     SEEDY   =  00003A     |   6 SEMIS      0017CD R
  6 SETISP     0000D0 R   |   6 SET_RAML   00195A R   |   6 SFN        002D2C R
    SFR_BASE=  005000     |     SFR_END =  0057FF     |   6 SFV        002D60 R
  6 SFZ        002CF5 R   |   6 SIGN       000E5B R   |   6 SIGN1      000E6B R
  6 SLASH      000ABE R   |   6 SLMOD      000A6C R   |   6 SLMOD1     000A9E R
  6 SLMOD8     000AAB R   |   6 SNAME      00172C R   |     SP0     =  00002C 
  6 SPACE      000F48 R   |   6 SPACS      000F57 R   |   6 SPAT       0005FA R
    SPI_CR1 =  005200     |     SPI_CR2 =  005201     |     SPI_CRCP=  005205 
    SPI_DR  =  005204     |     SPI_ICR =  005202     |     SPI_RXCR=  005206 
    SPI_SR  =  005203     |     SPI_TXCR=  005207     |     SPP     =  001680 
    SPSAVE  =  000001     |   6 SPSTO      000607 R   |   6 SQRT10     0023E1 R
  6 SQRT2      00239F R   |   6 SQRT3      0023B6 R   |   6 SSMOD      000B4E R
    SSP     =  000001     |     STACK   =  0017FF     |   6 STAR       000B17 R
  6 STASL      000B5F R   |   6 STEXP      002DAB R   |   6 STEXP1     002DC1 R
  6 STEXP2     002DEB R   |   6 STOD       0008BC R   |   6 STORE      0004D2 R
  6 STO_SIGN   002586 R   |   6 STR        000E89 R   |   6 STRCQ      00159D R
  6 STRQ       0016EB R   |   6 STRQP      000FB4 R   |   6 SUBB       0008D3 R
  6 SWAPP      00062A R   |     SWIM_CSR=  007F80     |   6 TAP        001329 R
  6 TBOOT      001BD7 R   |   6 TBRAN      0004A7 R   |   6 TBUF       00071E R
    TBUFFBAS=  001680     |   6 TCHAR      000C2E R   |   6 TEMP       0006EF R
  6 TEVAL      000741 R   |   6 TFLASH     000730 R   |   6 THENN      00163B R
  6 TIB        000D00 R   |     TIBB    =  001700     |     TIBBASE =  001700 
    TIC     =  000027     |   6 TICK       00150C R   |     TIM1_ARR=  005262 
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
  6 TNAM2      001AB0 R   |   6 TNAM3      001ACE R   |   6 TNAM4      001AD4 R
  6 TNAME      001AAD R   |   6 TOFLASH    000336 R   |   6 TOKEN      0011EA R
  6 TOR        0005E3 R   |   6 TORAM      000376 R   |   6 TRUE       000858 R
    TRUEE   =  00FFFF     |   6 TWOSL      000BEA R   |   6 TYPE1      000F77 R
  6 TYPE2      000F7D R   |   6 TYPES      000F72 R   |   6 Timer4Ha   000005 R
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
    UD4     =  000004     |   6 UDIV10     00325D R   |   6 UDOT       001001 R
  6 UDOTR      000FE1 R   |   6 UDSLA3     002B04 R   |   6 UDSLA4     002B22 R
  6 UDSLA7     002B4D R   |   6 UDSLA8     002B5B R   |   6 UDSLMOD    002AD4 R
  6 UDSSTAR    002787 R   |   6 UEND       000047 R   |     UFPSW   =  000008 
  6 UGREAT     00093E R   |   6 UGREAT1    000949 R   |     UHLD    =  000014 
    UINN    =  00000C     |     UINTER  =  000012     |     ULAST   =  00001C 
  6 ULES1      00091C R   |   6 ULESS      000911 R   |   6 UMMOD      0009B2 R
  6 UMOD10     00321F R   |   6 UMSTA      000ACD R   |   6 UNIQ1      001729 R
  6 UNIQU      00170A R   |   6 UNLKEE     001D55 R   |   6 UNLKFL     001D74 R
  6 UNLOCK     001D93 R   |   6 UNTIL      001600 R   |     UOFFSET =  00001E 
  6 UPDATCP    001D12 R   |   6 UPDATLAS   001CE9 R   |   6 UPDATPTR   002315 R
  6 UPDATRUN   001D01 R   |   6 UPDATVP    001D29 R   |   6 UPL1       0006CC R
  6 UPLUS      0006B5 R   |     UPP     =  000006     |   6 UPPER      0011AD R
  6 UPPER1     0011D0 R   |   6 UPPER2     0011D9 R   |     URLAST  =  000022 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 201.
Hexadecimal [24-Bits]

Symbol Table

  6 USLMOD     000A01 R   |     USR_BTN_=  000004     |     USR_BTN_=  000010 
    USR_BTN_=  005015     |     UTFLASH =  000020     |     UTIB    =  000010 
    UTMP    =  00000A     |   6 UTYP1      0019EA R   |   6 UTYP2      0019F9 R
  6 UTYPE      0019E5 R   |     UVP     =  000018     |   6 UZERO      00002B R
  6 VARIA      001927 R   |     VAR_BASE=  000080     |     VAR_TOP =  0017BF 
    VER     =  000004     |   6 VPP        000771 R   |     VSIZE   =  000006 
    WANT_CON=  000001     |     WANT_DEB=  000000     |     WANT_DOU=  000001 
    WANT_FLO=  000001     |     WANT_SCA=  000001     |     WANT_SEE=  000000 
    WDGOPT  =  004805     |     WDGOPT_I=  000002     |     WDGOPT_L=  000003 
    WDGOPT_W=  000000     |     WDGOPT_W=  000001     |   6 WHILE      00168F R
  6 WITHI      000997 R   |   6 WORDD      001193 R   |   6 WORDS      001B0A R
  6 WORS1      001B10 R   |   6 WORS2      001B2C R   |   6 WR_BYTE    001E3E R
  6 WR_WORD    001E63 R   |   6 WTABLE     00246D R   |   6 WTAT       002491 R
  6 WTINIT     0024D6 R   |     WWDG_CR =  0050D1     |     WWDG_WR =  0050D2 
    XMEM_SIZ=  017830     |     XOFF    =  000013     |     XON     =  000011 
  6 XORR       0006A0 R   |     XTEMP   =  000024     |     YTEMP   =  000026 
    YTMP    =  000003     |   6 ZEQ1       0028B3 R   |   6 ZEQU1      00066D R
  6 ZEQUAL     000663 R   |   6 ZERO       000C04 R   |   6 ZL1        00065A R
  6 ZLESS      000651 R   |   6 app_spac   003600 R   |   6 baudrate   00037C R
  6 block_er   001F29 R   |   6 clear_ra   000019 R   |   6 clock_in   000064 R
  6 copy_buf   001F89 R   |   6 copy_buf   001FA8 R   |   6 copy_pro   001FA8 R
    da      =  000002     |     db      =  000003     |     dc      =  000000 
    dd      =  000001     |   6 do2lit     0029C7 R   |   6 erase_fl   001F4B R
  6 fmove_do   0022FE R   |   6 main       000016 R   |   6 next_row   0022BB R
  6 no_move    002305 R   |   6 nsign      00255D R   |   6 parse_d4   0025C6 R
  6 parse_d5   0025D2 R   |   6 parse_di   00258A R   |   6 parse_ex   002F33 R
  6 pristine   002029 R   |   6 proceed_   001F4E R   |   6 reboot     000328 R
  6 reset_ve   002090 R   |   6 row_eras   001F09 R   |   6 row_eras   001F62 R
  6 row_eras   001F89 R   |   6 set_opti   001FFD R   |   6 set_vect   002131 R
  6 uart_ini   000076 R   |   6 write_ro   001FCD R

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

