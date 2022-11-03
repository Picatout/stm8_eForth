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
                                 
                                        
                                        ; to include float24.asm 
                                        ; library 
                                 
                                        
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
      0080B7 95 96                  316         .word      INTER   ;'EVAL
      0080B9 00 00                  317         .word      0       ;HLD
      0080BB B0 2A                  318         .word      LASTN  ;CNTXT pointer
      0080BD 00 80                  319         .word      VAR_BASE   ;variables free space pointer 
      0080BF B0 80                  320         .word      app_space ; FLASH free space pointer 
      0080C1 B0 2A                  321         .word      LASTN   ;LAST
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
      00812D CC 9D 71         [ 2]  393         jp  COLD   ;default=MN1
                                    394 
                                    395 
                           000000   396         LINK = 0  ; used by _HEADER macro 
                                    397 
                                    398 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;        
                                    399 ;; place MCU in sleep mode with
                                    400 ;; halt opcode 
                                    401 ;; BYE ( -- )
                                    402 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0000B0                        403         _HEADER BYE,3,"BYE"
      008130 00 00                    1         .word LINK 
                           0000B2     2         LINK=.
      008132 03                       3         .byte 3  
      008133 42 59 45                 4         .ascii "BYE"
      008136                          5         BYE:
      008136 8E               [10]  404         halt 
      008137 81               [ 4]  405         ret 
                                    406 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 9.
Hexadecimal [24-Bits]



                                    407 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    408 ; Enable interrupts 
                                    409 ; EI ( -- )
                                    410 ;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0000B8                        411         _HEADER EI,2,"EI"
      008138 81 32                    1         .word LINK 
                           0000BA     2         LINK=.
      00813A 02                       3         .byte 2  
      00813B 45 49                    4         .ascii "EI"
      00813D                          5         EI:
      00813D 9A               [ 1]  412         rim 
      00813E 81               [ 4]  413         ret 
                                    414 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    415 ; Disable interrupts
                                    416 ; DI ( -- )
                                    417 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      0000BF                        418         _HEADER DI,2,"DI"
      00813F 81 3A                    1         .word LINK 
                           0000C1     2         LINK=.
      008141 02                       3         .byte 2  
      008142 44 49                    4         .ascii "DI"
      008144                          5         DI:
      008144 9B               [ 1]  419         sim 
      008145 81               [ 4]  420         ret 
                                    421 
                                    422 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    423 ; set interrupt priority level 
                                    424 ; SET-ISP ( n1 n2 -- )
                                    425 ; n1 level {1..3}
                                    426 ; n2 vector {0..29}
                                    427 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0000C6                        428         _HEADER SETISP,7,"SET-ISP"
      008146 81 41                    1         .word LINK 
                           0000C8     2         LINK=.
      008148 07                       3         .byte 7  
      008149 53 45 54 2D 49 53 50     4         .ascii "SET-ISP"
      008150                          5         SETISP:
      008150 90 93            [ 1]  429         ldw y,x 
      008152 90 FE            [ 2]  430         ldw y,(y)
      008154 A6 04            [ 1]  431         ld a,#4 ; 4 slot per register 
                                    432 ;  quotient select register, remainder select slot in register.        
      008156 90 62            [ 2]  433         div y,a ; register=ITC_SPR1[Y], lshift=2*A 
      008158 A4 03            [ 1]  434         and a,#3 
      00815A 48               [ 1]  435         sll a ; 2*SLOT  lshift 
      00815B 72 A9 7F 70      [ 2]  436         addw y,#ITC_SPR1 
      00815F FF               [ 2]  437         ldw (x),y  ; ( level reg -- )
      008160 90 5F            [ 1]  438         clrw y 
      008162 90 97            [ 1]  439         ld yl,a 
      008164 1D 00 02         [ 2]  440         subw x,#CELLL 
      008167 FF               [ 2]  441         ldw (x),y  ; ( level reg lshift -- )
      008168 90 93            [ 1]  442         ldw y,x 
      00816A 90 EE 02         [ 2]  443         ldw y,(2,y) 
      00816D 90 F6            [ 1]  444         ld a,(y)   ; reg_value
      00816F 1D 00 02         [ 2]  445         subw x,#CELLL 
      008172 FF               [ 2]  446         ldw (x),y ; ( level reg lshift rval -- )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 10.
Hexadecimal [24-Bits]



      008173 CD 86 C2         [ 4]  447         call OVER ; ( level reg lshift rval lshift -- )
      008176 CD 84 F0         [ 4]  448         call DOLIT 
      008179 00 03                  449         .word 3
      00817B CD 86 AA         [ 4]  450         call SWAPP  ; ( level reg lshift rval 3 lshift )
      00817E CD 8C 41         [ 4]  451         call LSHIFT ; creat slot mask 
      008181 CD 88 F6         [ 4]  452         call INVER  ; ( level reg lshift rval mask )
      008184 CD 86 F7         [ 4]  453         call ANDD ; ( level reg lshift slot_masked )
      008187 CD 86 63         [ 4]  454         call TOR  ; ( level reg lshift -- R: slot_masked )
      00818A CD 88 5E         [ 4]  455         call ROT  ; ( reg lshift level )
      00818D CD 86 AA         [ 4]  456         call SWAPP ; ( reg level lshift )
      008190 CD 8C 41         [ 4]  457         call LSHIFT  ; ( reg slot_level -- )
      008193 CD 85 B5         [ 4]  458         call RFROM ; ( reg slot_level masked_val )
      008196 CD 87 0B         [ 4]  459         call ORR   ; ( reg updated_rval )
      008199 CD 86 AA         [ 4]  460         call SWAPP 
      00819C CC 85 71         [ 2]  461         jp CSTOR
                                    462 
                                    463 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    464 ; sélectionne l'application 
                                    465 ; qui démarre automatique lors 
                                    466 ; d'un COLD start 
                                    467 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00011F                        468         _HEADER AUTORUN,7,"AUTORUN"
      00819F 81 48                    1         .word LINK 
                           000121     2         LINK=.
      0081A1 07                       3         .byte 7  
      0081A2 41 55 54 4F 52 55 4E     4         .ascii "AUTORUN"
      0081A9                          5         AUTORUN:
      0081A9 CD 93 5B         [ 4]  469         call TOKEN 
      0081AC CD 86 9A         [ 4]  470         call DUPP 
      0081AF CD 85 19         [ 4]  471         call QBRAN 
      0081B2 82 8F                  472         .word FORGET2
      0081B4 CD 94 58         [ 4]  473         call NAMEQ
      0081B7 CD 88 4D         [ 4]  474         call QDUP 
      0081BA CD 85 19         [ 4]  475         call QBRAN 
      0081BD 82 8F                  476         .word FORGET2
      00013F                        477         _DROP 
      0081BF 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      0081C2 1D 00 04         [ 2]  478         subw x,#2*CELLL 
      0081C5 90 5F            [ 1]  479         clrw y 
      0081C7 FF               [ 2]  480         ldw (x),y 
      0081C8 90 AE 40 02      [ 2]  481         ldw y,#APP_RUN 
      0081CC EF 02            [ 2]  482         ldw (2,x),y 
      0081CE CC A0 6D         [ 2]  483         jp EESTORE 
                                    484 
                                    485 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    486 ;; Reset dictionary pointer before 
                                    487 ;; forgotten word. RAM space and 
                                    488 ;; interrupt vector defined after 
                                    489 ;; must be resetted also.
                                    490 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000151                        491         _HEADER FORGET,6,"FORGET"
      0081D1 81 A1                    1         .word LINK 
                           000153     2         LINK=.
      0081D3 06                       3         .byte 6  
      0081D4 46 4F 52 47 45 54        4         .ascii "FORGET"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 11.
Hexadecimal [24-Bits]



      0081DA                          5         FORGET:
      0081DA CD 93 5B         [ 4]  492         call TOKEN
      0081DD CD 86 9A         [ 4]  493         call DUPP 
      0081E0 CD 85 19         [ 4]  494         call QBRAN 
      0081E3 82 8F                  495         .word FORGET2
      0081E5 CD 94 58         [ 4]  496         call NAMEQ ; ( a -- ca na | a F )
      0081E8 CD 88 4D         [ 4]  497         call QDUP 
      0081EB CD 85 19         [ 4]  498         call QBRAN 
      0081EE 82 8F                  499         .word FORGET2
                                    500 ; only forget users words 
      0081F0 CD 86 9A         [ 4]  501         call DUPP ; ( ca na na )
      0081F3 CD 84 F0         [ 4]  502         call DOLIT 
      0081F6 B0 80                  503         .word app_space 
      0081F8 CD 86 AA         [ 4]  504         call SWAPP 
      0081FB CD 89 91         [ 4]  505         call  ULESS 
      0081FE CD 85 19         [ 4]  506         call QBRAN 
      008201 82 51                  507         .word FORGET6 
                                    508 ; ( ca na -- )        
                                    509 ;reset ivec with address >= ca
      008203 CD 86 AA         [ 4]  510         call SWAPP ; ( na ca -- ) 
      008206 CD A2 70         [ 4]  511         call CHKIVEC ; ( na -- ) 
                                    512 ; start at LAST and link back to na 
                                    513 ; if variable found reset VP at that point.
      008209                        514 FORGET1:
      008209 CD 88 0F         [ 4]  515         call LAST 
      00820C CD 85 64         [ 4]  516         call AT 
      00820F CD 86 9A         [ 4]  517         call DUPP  ; ( -- na last last )
      008212 CD 82 A5         [ 4]  518         call FREEVAR ; ( -- na last )
      008215 CD 86 9A         [ 4]  519         call DUPP 
      008218 CD 84 F0         [ 4]  520         call DOLIT 
      00821B 00 02                  521         .word 2 
      00821D CD 89 53         [ 4]  522         call SUBB ; ( na last -- na last lfa ) link address 
      008220 CD 85 64         [ 4]  523         call AT 
      008223 CD 86 9A         [ 4]  524         call DUPP ; ( -- na last a a )
      008226 CD 87 E3         [ 4]  525         call CNTXT 
      008229 CD 85 52         [ 4]  526         call STORE
      00822C CD 88 0F         [ 4]  527         call LAST  
      00822F CD 85 52         [ 4]  528         call STORE ; ( --  na last )
      008232 CD 86 C2         [ 4]  529         call OVER 
      008235 CD 89 7B         [ 4]  530         call EQUAL ; ( na last na -- na T|F ) 
      008238 CD 85 19         [ 4]  531         call QBRAN 
      00823B 82 09                  532         .word FORGET1 
                                    533 ; ( na -- )
      00823D CD 84 F0         [ 4]  534         call DOLIT 
      008240 00 02                  535         .word 2 
      008242 CD 89 53         [ 4]  536         call SUBB 
      008245 CD 87 FF         [ 4]  537         call CPP 
      008248 CD 85 52         [ 4]  538         call STORE  
      00824B CD 9E A0         [ 4]  539         call UPDATCP 
      00824E CC 9E 77         [ 2]  540         jp UPDATLAST 
      008251                        541 FORGET6: ; tried to forget a RAM or system word 
                                    542 ; ( ca na -- )
      008251 1D 00 02         [ 2]  543         subw x,#CELLL 
      008254 90 BE 2C         [ 2]  544         ldw y,SP0 
      008257 FF               [ 2]  545         ldw (x),y  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 12.
Hexadecimal [24-Bits]



      008258 CD 89 91         [ 4]  546         call ULESS
      00825B CD 85 19         [ 4]  547         call QBRAN 
      00825E 82 81                  548         .word PROTECTED 
      008260 CD 95 64         [ 4]  549         call ABORQ 
      008263 1D                     550         .byte 29
      008264 20 46 6F 72 20 52 41   551         .ascii " For RAM definition do REBOOT"
             4D 20 64 65 66 69 6E
             69 74 69 6F 6E 20 64
             6F 20 52 45 42 4F 4F
             54
      008281                        552 PROTECTED:
      008281 CD 95 64         [ 4]  553         call ABORQ
      008284 0A                     554         .byte 10
      008285 20 50 72 6F 74 65 63   555         .ascii " Protected"
             74 65 64
      00828F                        556 FORGET2: ; no name or not found in dictionary 
      00828F CD 95 64         [ 4]  557         call ABORQ
      008292 05                     558         .byte 5
      008293 20 77 68 61 74         559         .ascii " what"
      008298                        560 FORGET4:
      008298 CC 86 90         [ 2]  561         jp DROP 
                                    562 
                                    563 
                                    564 ;;;;;;;;;;;;;;;;;;;;;
                                    565 ; if na is variable 
                                    566 ; free variable data  
                                    567 ; FREEVAR ( na -- )
                                    568 ;;;;;;;;;;;;;;;;;;;;;;
      00021B                        569         _HEADER FREEVAR,7,"FREEVAR"
      00829B 81 D3                    1         .word LINK 
                           00021D     2         LINK=.
      00829D 07                       3         .byte 7  
      00829E 46 52 45 45 56 41 52     4         .ascii "FREEVAR"
      0082A5                          5         FREEVAR:
      0082A5 CD 86 9A         [ 4]  570         call DUPP ; ( na na -- )
      0082A8 CD 85 82         [ 4]  571         CALL CAT  ; ( na c -- )
      0082AB CD 8C 23         [ 4]  572         call ONEP ;
      0082AE CD 88 BD         [ 4]  573         CALL PLUS ; ( na c+1 -- ca ) 
      0082B1 CD 8C 23         [ 4]  574         call ONEP ; ( ca+ -- ) to get routne address 
      0082B4 CD 86 9A         [ 4]  575         call DUPP ; ( ca+ ca+ -- )
      0082B7 CD 85 64         [ 4]  576         CALL AT   ; ( ca+ fnaddr -- ) ; fnaddr is routine address 
      0082BA CD 84 F0         [ 4]  577         call DOLIT 
      0082BD 87 50                  578         .word DOVAR ; if routine address is DOVAR then variable 
      0082BF CD 89 7B         [ 4]  579         call EQUAL  ; ( ca+ fnaddr DOVAR -- ca+ T|F ) 
      0082C2 CD 85 19         [ 4]  580         call QBRAN 
      0082C5 82 DB                  581         .word FREEVAR4 
      0082C7 CD 84 F0         [ 4]  582         call DOLIT 
      0082CA 00 02                  583         .word 2 
      0082CC CD 88 BD         [ 4]  584         call PLUS  ; ( ca+ 2 -- da ) da is data address 
      0082CF CD 85 64         [ 4]  585         call AT 
      0082D2 CD 87 F1         [ 4]  586         call VPP   
      0082D5 CD 85 52         [ 4]  587         call STORE 
      0082D8 CC 9E B7         [ 2]  588         jp UPDATVP 
      0082DB                        589 FREEVAR4: ; not variable
      00025B                        590         _DROP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 13.
Hexadecimal [24-Bits]



      0082DB 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      0082DE 81               [ 4]  591         RET 
                                    592 
                                    593 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    594 ;    SEED ( n -- )
                                    595 ; Initialize PRNG seed with n 
                                    596 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00025F                        597         _HEADER SEED,4,"SEED"
      0082DF 82 9D                    1         .word LINK 
                           000261     2         LINK=.
      0082E1 04                       3         .byte 4  
      0082E2 53 45 45 44              4         .ascii "SEED"
      0082E6                          5         SEED:
      0082E6 90 93            [ 1]  598         ldw y,x 
      0082E8 1C 00 02         [ 2]  599         addw x,#CELLL
      0082EB 90 FE            [ 2]  600         ldw y,(y)
      0082ED 90 9E            [ 1]  601         ld a,yh 
      0082EF B7 38            [ 1]  602         ld SEEDX,a 
      0082F1 90 9F            [ 1]  603         ld a,yl 
      0082F3 B7 3A            [ 1]  604         ld SEEDY,a 
      0082F5 81               [ 4]  605         ret 
                                    606 
                                    607 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    608 ;    RANDOM ( u1 -- u2 )
                                    609 ; Pseudo random number betwen 0 and u1-1
                                    610 ;  XOR32 algorithm 
                                    611 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000276                        612         _HEADER RANDOM,6,"RANDOM"
      0082F6 82 E1                    1         .word LINK 
                           000278     2         LINK=.
      0082F8 06                       3         .byte 6  
      0082F9 52 41 4E 44 4F 4D        4         .ascii "RANDOM"
      0082FF                          5         RANDOM:
                                    613 ;local variable 
                           000001   614         SPSAVE=1
                           000002   615         VSIZE=2 
      0082FF 52 02            [ 2]  616         sub sp,#VSIZE
      008301 1F 01            [ 2]  617         ldw (SPSAVE,sp),x  
                                    618 ; XTEMP=(SEEDX<<5)^SEEDX 
      008303 90 93            [ 1]  619         ldw y,x 
      008305 90 FE            [ 2]  620         ldw y,(y)
      008307 90 BF 26         [ 2]  621         ldw YTEMP,y 
      00830A BE 38            [ 2]  622 	ldw x,SEEDX 
      00830C 58               [ 2]  623 	sllw x 
      00830D 58               [ 2]  624 	sllw x 
      00830E 58               [ 2]  625 	sllw x 
      00830F 58               [ 2]  626 	sllw x 
      008310 58               [ 2]  627 	sllw x 
      008311 9E               [ 1]  628 	ld a,xh 
      008312 B8 38            [ 1]  629 	xor a,SEEDX 
      008314 B7 24            [ 1]  630 	ld XTEMP,a 
      008316 9F               [ 1]  631 	ld a,xl 
      008317 B8 39            [ 1]  632 	xor a,SEEDX+1 
      008319 B7 25            [ 1]  633 	ld XTEMP+1,a 
                                    634 ; SEEDX=SEEDY 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 14.
Hexadecimal [24-Bits]



      00831B BE 3A            [ 2]  635 	ldw x,SEEDY 
      00831D BF 38            [ 2]  636 	ldw SEEDX,x  
                                    637 ; SEEDY=SEEDY^(SEEDY>>1)
      00831F 54               [ 2]  638 	srlw x 
      008320 9E               [ 1]  639 	ld a,xh 
      008321 B8 3A            [ 1]  640 	xor a,SEEDY 
      008323 B7 3A            [ 1]  641 	ld SEEDY,a  
      008325 9F               [ 1]  642 	ld a,xl 
      008326 B8 3B            [ 1]  643 	xor a,SEEDY+1 
      008328 B7 3B            [ 1]  644 	ld SEEDY+1,a 
                                    645 ; XTEMP>>3 
      00832A BE 24            [ 2]  646 	ldw x,XTEMP 
      00832C 54               [ 2]  647 	srlw x 
      00832D 54               [ 2]  648 	srlw x 
      00832E 54               [ 2]  649 	srlw x 
                                    650 ; x=XTEMP^x 
      00832F 9E               [ 1]  651 	ld a,xh 
      008330 B8 24            [ 1]  652 	xor a,XTEMP 
      008332 95               [ 1]  653 	ld xh,a 
      008333 9F               [ 1]  654 	ld a,xl 
      008334 B8 25            [ 1]  655 	xor a,XTEMP+1  
      008336 97               [ 1]  656 	ld xl,a 
                                    657 ; SEEDY=x^SEEDY 
      008337 B8 3B            [ 1]  658 	xor a,SEEDY+1
      008339 97               [ 1]  659 	ld xl,a 
      00833A 9E               [ 1]  660 	ld a,xh 
      00833B B8 3A            [ 1]  661 	xor a,SEEDY
      00833D 95               [ 1]  662 	ld xh,a 
      00833E BF 3A            [ 2]  663 	ldw SEEDY,x 
                                    664 ; return SEEDY modulo YTEMP  
      008340 90 BE 26         [ 2]  665 	ldw y,YTEMP  
      008343 65               [ 2]  666 	divw x,y 
      008344 1E 01            [ 2]  667 	ldw x,(SPSAVE,sp)
      008346 FF               [ 2]  668         ldw (x),y 
      008347 5B 02            [ 2]  669         addw sp,#VSIZE 
      008349 81               [ 4]  670 	ret 
                                    671 
                                    672 
                                    673 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    674 ;; get millisecond counter 
                                    675 ;; msec ( -- u )
                                    676 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0002CA                        677         _HEADER MSEC,4,"MSEC"
      00834A 82 F8                    1         .word LINK 
                           0002CC     2         LINK=.
      00834C 04                       3         .byte 4  
      00834D 4D 53 45 43              4         .ascii "MSEC"
      008351                          5         MSEC:
      008351 1D 00 02         [ 2]  678         subw x,#CELLL 
      008354 90 BE 30         [ 2]  679         ldw y,MS 
      008357 FF               [ 2]  680         ldw (x),y 
      008358 81               [ 4]  681         ret 
                                    682 
                                    683 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    684 ; suspend execution for u msec 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 15.
Hexadecimal [24-Bits]



                                    685 ;  pause ( u -- )
                                    686 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0002D9                        687         _HEADER PAUSE,5,"PAUSE"
      008359 83 4C                    1         .word LINK 
                           0002DB     2         LINK=.
      00835B 05                       3         .byte 5  
      00835C 50 41 55 53 45           4         .ascii "PAUSE"
      008361                          5         PAUSE:
      008361 90 93            [ 1]  688         ldw y,x
      008363 90 FE            [ 2]  689         ldw y,(y)
      008365 72 B9 00 30      [ 2]  690         addw y,MS 
      008369 8F               [10]  691 1$:     wfi  
      00836A 90 B3 30         [ 2]  692         cpw y,MS  
      00836D 26 FA            [ 1]  693         jrne 1$        
      00836F 1C 00 02         [ 2]  694         addw x,#CELLL 
      008372 81               [ 4]  695         ret 
                                    696 
                                    697 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    698 ; initialize count down timer 
                                    699 ;  TIMER ( u -- )  milliseconds
                                    700 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0002F3                        701         _HEADER TIMER,5,"TIMER"
      008373 83 5B                    1         .word LINK 
                           0002F5     2         LINK=.
      008375 05                       3         .byte 5  
      008376 54 49 4D 45 52           4         .ascii "TIMER"
      00837B                          5         TIMER:
      00837B 90 93            [ 1]  702         ldw y,x
      00837D 90 FE            [ 2]  703         ldw y,(y) 
      00837F 90 BF 32         [ 2]  704         ldw CNTDWN,y
      008382 1C 00 02         [ 2]  705         addw x,#CELLL 
      008385 81               [ 4]  706         ret 
                                    707 
                                    708 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    709 ; check for TIMER exiparition 
                                    710 ;  TIMEOUT? ( -- 0|-1 )
                                    711 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000306                        712         _HEADER TIMEOUTQ,8,"TIMEOUT?"
      008386 83 75                    1         .word LINK 
                           000308     2         LINK=.
      008388 08                       3         .byte 8  
      008389 54 49 4D 45 4F 55 54     4         .ascii "TIMEOUT?"
             3F
      008391                          5         TIMEOUTQ:
      008391 4F               [ 1]  713         clr a
      008392 1D 00 02         [ 2]  714         subw x,#CELLL 
      008395 90 BE 32         [ 2]  715         ldw y,CNTDWN 
      008398 26 01            [ 1]  716         jrne 1$ 
      00839A 43               [ 1]  717         cpl a 
      00839B E7 01            [ 1]  718 1$:     ld (1,x),a 
      00839D F7               [ 1]  719         ld (x),a 
      00839E 81               [ 4]  720         ret         
                                    721 
                                    722 ;;;;;;;;;;;;;;;;;;;;;
                                    723 ; reboot MCU 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 16.
Hexadecimal [24-Bits]



                                    724 ; REBOOT ( -- )
                                    725 ;;;;;;;;;;;;;;;;;;;;;
      00031F                        726         _HEADER reboot,6,"REBOOT"
      00839F 83 88                    1         .word LINK 
                           000321     2         LINK=.
      0083A1 06                       3         .byte 6  
      0083A2 52 45 42 4F 4F 54        4         .ascii "REBOOT"
      0083A8                          5         reboot:
      0083A8 CC 80 80         [ 2]  727         jp NonHandledInterrupt
                                    728 
                                    729 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    730 ; compile to flash memory 
                                    731 ; TO-FLASH ( -- )
                                    732 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      00032B                        733         _HEADER TOFLASH,8,"TO-FLASH"
      0083AB 83 A1                    1         .word LINK 
                           00032D     2         LINK=.
      0083AD 08                       3         .byte 8  
      0083AE 54 4F 2D 46 4C 41 53     4         .ascii "TO-FLASH"
             48
      0083B6                          5         TOFLASH:
      0083B6 CD 88 22         [ 4]  734         call RAMLAST 
      0083B9 CD 85 64         [ 4]  735         call AT 
      0083BC CD 88 4D         [ 4]  736         call QDUP 
      0083BF CD 85 19         [ 4]  737         call QBRAN
      0083C2 83 E5                  738         .word 1$
      0083C4 CD 95 64         [ 4]  739         call ABORQ 
      0083C7 1D                     740         .byte 29
      0083C8 20 4E 6F 74 20 77 68   741         .ascii " Not while definitions in RAM"   
             69 6C 65 20 64 65 66
             69 6E 69 74 69 6F 6E
             73 20 69 6E 20 52 41
             4D
      0083E5 90 AE FF FF      [ 2]  742 1$:     ldw y,#-1 
      0083E9 90 BF 20         [ 2]  743         ldw UTFLASH,y
      0083EC 81               [ 4]  744         ret 
                                    745 
                                    746 ;;;;;;;;;;;;;;;;;;;;;;
                                    747 ; compile to RAM 
                                    748 ; TO-RAM ( -- )
                                    749 ;;;;;;;;;;;;;;;;;;;;;;
      00036D                        750         _HEADER TORAM,6,"TO-RAM"
      0083ED 83 AD                    1         .word LINK 
                           00036F     2         LINK=.
      0083EF 06                       3         .byte 6  
      0083F0 54 4F 2D 52 41 4D        4         .ascii "TO-RAM"
      0083F6                          5         TORAM:
      0083F6 90 5F            [ 1]  751         clrw y 
      0083F8 90 BF 20         [ 2]  752         ldw UTFLASH,y 
      0083FB 81               [ 4]  753         ret 
                                    754 
                                    755 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    756 ;; BAUD RATE constants table
                                    757 ; values to put in BRR1 & BRR2 
                                    758 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 17.
Hexadecimal [24-Bits]



      0083FC                        759 baudrate: 
      0083FC A0 1B                  760 	.byte 0xa0,0x1b ; 2400
      0083FE D0 05                  761 	.byte 0xd0,0x5  ; 4800 
      008400 68 03                  762 	.byte 0x68,0x3  ; 9600
      008402 34 01                  763 	.byte 0x34,0x1  ; 19200
      008404 11 06                  764 	.byte 0x11,0x6  ; 57600
      008406 08 0B                  765 	.byte 0x8,0xb   ; 115200
                                    766 
                                    767 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    768 ; BAUD RATE CONSTANTS names 
                                    769 ; 2400 baud  ( -- n )
                                    770 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000388                        771         _HEADER B2K4,4,"B2K4"
      008408 83 EF                    1         .word LINK 
                           00038A     2         LINK=.
      00840A 04                       3         .byte 4  
      00840B 42 32 4B 34              4         .ascii "B2K4"
      00840F                          5         B2K4:
      00840F 1D 00 02         [ 2]  772 	subw x,#CELLL 
      008412 90 5F            [ 1]  773         clrw y
      008414 FF               [ 2]  774         ldw (x),y
      008415 81               [ 4]  775 	ret
                                    776 
                                    777 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    778 ; 4800 baud	
                                    779 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000396                        780         _HEADER B4K8,4,"B4K8"
      008416 84 0A                    1         .word LINK 
                           000398     2         LINK=.
      008418 04                       3         .byte 4  
      008419 42 34 4B 38              4         .ascii "B4K8"
      00841D                          5         B4K8:
      00841D 1D 00 02         [ 2]  781         subw x,#CELLL 
      008420 90 AE 00 02      [ 2]  782         ldw y,#2 
      008424 FF               [ 2]  783         ldw (x),y
      008425 81               [ 4]  784         ret 
                                    785 
                                    786 ;;;;;;;;;;;;;;;;;;;;
                                    787 ; 9600 baud
                                    788 ;;;;;;;;;;;;;;;;;;;;
      0003A6                        789         _HEADER B9K6,4,"B9K6"
      008426 84 18                    1         .word LINK 
                           0003A8     2         LINK=.
      008428 04                       3         .byte 4  
      008429 42 39 4B 36              4         .ascii "B9K6"
      00842D                          5         B9K6:
      00842D 1D 00 02         [ 2]  790         subw x,#CELLL 
      008430 90 AE 00 04      [ 2]  791         ldw y,#4 
      008434 FF               [ 2]  792         ldw (x),y 
      008435 81               [ 4]  793         ret 
                                    794 ;;;;;;;;;;;;;;
                                    795 ; 19200 baud
                                    796 ;;;;;;;;;;;;;;
      0003B6                        797         _HEADER B19K2,5,"B19K2"
      008436 84 28                    1         .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 18.
Hexadecimal [24-Bits]



                           0003B8     2         LINK=.
      008438 05                       3         .byte 5  
      008439 42 31 39 4B 32           4         .ascii "B19K2"
      00843E                          5         B19K2:
      00843E 1D 00 02         [ 2]  798         subw x,#CELLL
      008441 90 AE 00 06      [ 2]  799         ldw y,#6 
      008445 FF               [ 2]  800         ldw (x),y 
      008446 81               [ 4]  801         ret 
                                    802 ;;;;;;;;;;;;;;
                                    803 ; 57600 baud  
                                    804 ;;;;;;;;;;;;;;
      0003C7                        805         _HEADER B57K6,5,"B57K6"
      008447 84 38                    1         .word LINK 
                           0003C9     2         LINK=.
      008449 05                       3         .byte 5  
      00844A 42 35 37 4B 36           4         .ascii "B57K6"
      00844F                          5         B57K6:
      00844F 1D 00 02         [ 2]  806         subw x,#CELLL 
      008452 90 AE 00 08      [ 2]  807         ldw y,#8 
      008456 FF               [ 2]  808         ldw (x),y 
      008457 81               [ 4]  809         ret 
                                    810 ;;;;;;;;;;;;;;
                                    811 ; 115200 baud 
                                    812 ;;;;;;;;;;;;;;
      0003D8                        813         _HEADER B115K2,6,"B115K2"
      008458 84 49                    1         .word LINK 
                           0003DA     2         LINK=.
      00845A 06                       3         .byte 6  
      00845B 42 31 31 35 4B 32        4         .ascii "B115K2"
      008461                          5         B115K2:
      008461 1D 00 02         [ 2]  814 	subw x,#CELLL 
      008464 90 AE 00 0A      [ 2]  815         ldw y,#10 
      008468 FF               [ 2]  816         ldw (x),y 
      008469 81               [ 4]  817         ret 
                                    818 
                                    819 ;;;;;;;;;;;;;;;;;;;;;;;	
                                    820 ;; set UART2 BAUD rate
                                    821 ;	BAUD ( u -- )
                                    822 ;;;;;;;;;;;;;;;;;;;;;;;
      0003EA                        823         _HEADER BAUD,4,"BAUD"
      00846A 84 5A                    1         .word LINK 
                           0003EC     2         LINK=.
      00846C 04                       3         .byte 4  
      00846D 42 41 55 44              4         .ascii "BAUD"
      008471                          5         BAUD:
      008471 1D 00 02         [ 2]  824 	subw x,#CELLL
      008474 90 AE 83 FC      [ 2]  825         ldw y,#baudrate 
      008478 FF               [ 2]  826         ldw (x),y 
      008479 CD 88 BD         [ 4]  827         call PLUS
      00847C 90 93            [ 1]  828         ldw y,x  
      00847E 90 FE            [ 2]  829         ldw y,(y)
      008480 90 F6            [ 1]  830         ld a,(y)
      008482 88               [ 1]  831         push a 
      008483 90 5C            [ 1]  832         incw y 
      008485 90 F6            [ 1]  833         ld a,(y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 19.
Hexadecimal [24-Bits]



      008487 C7 52 33         [ 1]  834         ld UART_BRR2,a 
      00848A 84               [ 1]  835         pop a
      00848B C7 52 32         [ 1]  836         ld UART_BRR1,a 
      00848E 1C 00 02         [ 2]  837         addw x,#CELLL 
      008491 81               [ 4]  838         ret 
                                    839 
                                    840 ;; Device dependent I/O
                                    841 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    842 ;       ?RX     ( -- c T | F )
                                    843 ;         Return input byte and true, or false.
                                    844 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000412                        845         _HEADER QKEY,4,"?KEY"
      008492 84 6C                    1         .word LINK 
                           000414     2         LINK=.
      008494 04                       3         .byte 4  
      008495 3F 4B 45 59              4         .ascii "?KEY"
      008499                          5         QKEY:
      008499 90 5F            [ 1]  846         CLRW Y 
      00849B 72 0B 52 30 0B   [ 2]  847         BTJF UART_SR,#UART_SR_RXNE,INCH   ;check status
      0084A0 C6 52 31         [ 1]  848         LD    A,UART_DR   ;get char in A
      0084A3 1D 00 02         [ 2]  849 	SUBW	X,#2
      0084A6 E7 01            [ 1]  850         LD     (1,X),A
      0084A8 7F               [ 1]  851 	CLR	(X)
      0084A9 90 53            [ 2]  852         CPLW     Y
      0084AB                        853 INCH:
      0084AB 1D 00 02         [ 2]  854 		SUBW	X,#2
      0084AE FF               [ 2]  855         LDW     (X),Y
      0084AF 81               [ 4]  856         RET
                                    857 
                                    858 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    859 ;       TX!     ( c -- )
                                    860 ;       Send character c to  output device.
                                    861 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000430                        862         _HEADER EMIT,4,"EMIT"
      0084B0 84 94                    1         .word LINK 
                           000432     2         LINK=.
      0084B2 04                       3         .byte 4  
      0084B3 45 4D 49 54              4         .ascii "EMIT"
      0084B7                          5         EMIT:
      0084B7 E6 01            [ 1]  863         LD     A,(1,X)
      0084B9 1C 00 02         [ 2]  864 	ADDW	X,#2
      0084BC 72 0F 52 30 FB   [ 2]  865 OUTPUT: BTJF UART_SR,#UART_SR_TXE,OUTPUT  ;loop until tx empty 
      0084C1 C7 52 31         [ 1]  866         LD    UART_DR,A   ;send A
      0084C4 81               [ 4]  867         RET
                                    868 
                                    869 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    870 ;       FC-XON  ( -- )
                                    871 ;       send XON character 
                                    872 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000445                        873         _HEADER FC_XON,6,"FC-XON"
      0084C5 84 B2                    1         .word LINK 
                           000447     2         LINK=.
      0084C7 06                       3         .byte 6  
      0084C8 46 43 2D 58 4F 4E        4         .ascii "FC-XON"
      0084CE                          5         FC_XON:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 20.
Hexadecimal [24-Bits]



      0084CE 1D 00 02         [ 2]  874         subw x,#CELLL 
      0084D1 7F               [ 1]  875         clr (x)
      0084D2 A6 11            [ 1]  876         ld a,#XON 
      0084D4 E7 01            [ 1]  877         ld (1,x),a 
      0084D6 CD 84 B7         [ 4]  878         call EMIT 
      0084D9 81               [ 4]  879         ret 
                                    880 
                                    881 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    882 ;       FC-XOFF ( -- )
                                    883 ;       Send XOFF character 
                                    884 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00045A                        885         _HEADER FC_XOFF,7,"FC-XOFF"
      0084DA 84 C7                    1         .word LINK 
                           00045C     2         LINK=.
      0084DC 07                       3         .byte 7  
      0084DD 46 43 2D 58 4F 46 46     4         .ascii "FC-XOFF"
      0084E4                          5         FC_XOFF:
      0084E4 1D 00 02         [ 2]  886         subw x,#CELLL 
      0084E7 7F               [ 1]  887         clr (x)
      0084E8 A6 13            [ 1]  888         ld a,#XOFF 
      0084EA E7 01            [ 1]  889         ld (1,x),a 
      0084EC CD 84 B7         [ 4]  890         call EMIT 
      0084EF 81               [ 4]  891         ret
                                    892 
                                    893 ;; The kernel
                                    894 
                                    895 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    896 ;       doLIT   ( -- w )
                                    897 ;       Push an inline literal.
                                    898 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0084F0                        899 DOLIT:
      0084F0 1D 00 02         [ 2]  900 	SUBW X,#2
      0084F3 16 01            [ 2]  901         ldw y,(1,sp)
      0084F5 90 FE            [ 2]  902         ldw y,(y)
      0084F7 FF               [ 2]  903         ldw (x),y
      0084F8 90 85            [ 2]  904         popw y 
      0084FA 90 EC 02         [ 2]  905         jp (2,y)
                                    906 
                                    907 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    908 ;       NEXT    ( -- )
                                    909 ;       Code for  single index loop.
                                    910 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00047D                        911         _HEADER DONXT,COMPO+4,"NEXT"
      0084FD 84 DC                    1         .word LINK 
                           00047F     2         LINK=.
      0084FF 44                       3         .byte COMPO+4  
      008500 4E 45 58 54              4         .ascii "NEXT"
      008504                          5         DONXT:
      008504 16 03            [ 2]  912 	LDW Y,(3,SP)
      008506 90 5A            [ 2]  913 	DECW Y
      008508 2A 07            [ 1]  914 	JRPL NEX1 ; jump if N=0
      00850A 90 85            [ 2]  915 	POPW Y
      00850C 5B 02            [ 2]  916         addw sp,#2
      00850E 90 EC 02         [ 2]  917         JP (2,Y)
      008511                        918 NEX1:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 21.
Hexadecimal [24-Bits]



      008511 17 03            [ 2]  919         LDW (3,SP),Y
      008513 90 85            [ 2]  920         POPW Y
      008515 90 FE            [ 2]  921 	LDW Y,(Y)
      008517 90 FC            [ 2]  922 	JP (Y)
                                    923 
                                    924 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    925 ;       ?branch ( f -- )
                                    926 ;       Branch if flag is zero.
                                    927 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    928 ;       _HEADER QBRAN,COMPO+7,"?BRANCH"        
      008519                        929 QBRAN:	
      008519 90 93            [ 1]  930         LDW Y,X
      00851B 1C 00 02         [ 2]  931 	ADDW X,#2
      00851E 90 FE            [ 2]  932 	LDW Y,(Y)
      008520 27 13            [ 1]  933         JREQ     BRAN
      008522 90 85            [ 2]  934 	POPW Y
      008524 90 EC 02         [ 2]  935 	JP (2,Y)
                                    936 
                                    937 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    938 ;  TBRANCH ( f -- )
                                    939 ;  branch if f==TRUE 
                                    940 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    941 ;        _HEADER TBRAN,COMPO+7,"TBRANCH"
      008527                        942 TBRAN: 
      008527 90 93            [ 1]  943         LDW Y,X 
      008529 1C 00 02         [ 2]  944         ADDW X,#2 
      00852C 90 FE            [ 2]  945         LDW Y,(Y)
      00852E 26 05            [ 1]  946         JRNE BRAN 
      008530 90 85            [ 2]  947         POPW Y 
      008532 90 EC 02         [ 2]  948         JP (2,Y)
                                    949 
                                    950 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    951 ;       branch  ( -- )
                                    952 ;       Branch to an inline address.
                                    953 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    954 ;       _HEADER BRAN,COMPO+6,"BRANCH"
      008535                        955 BRAN:
      008535 90 85            [ 2]  956         POPW Y
      008537 90 FE            [ 2]  957 	LDW Y,(Y)
      008539 90 FC            [ 2]  958         JP  (Y)
                                    959 
                                    960 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    961 ;       EXECUTE ( ca -- )
                                    962 ;       Execute  word at ca.
                                    963 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0004BB                        964         _HEADER EXECU,7,"EXECUTE"
      00853B 84 FF                    1         .word LINK 
                           0004BD     2         LINK=.
      00853D 07                       3         .byte 7  
      00853E 45 58 45 43 55 54 45     4         .ascii "EXECUTE"
      008545                          5         EXECU:
      008545 90 93            [ 1]  965         LDW Y,X
      008547 1C 00 02         [ 2]  966 	ADDW X,#CELLL 
      00854A 90 FE            [ 2]  967 	LDW  Y,(Y)
      00854C 90 FC            [ 2]  968         JP   (Y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 22.
Hexadecimal [24-Bits]



                                    969 
                           000001   970 OPTIMIZE = 1
                           000001   971 .if OPTIMIZE 
                                    972 ; remplacement de CALL EXIT par 
                                    973 ; le opcode de RET.
                                    974 ; Voir modification au code de ";"
                           000000   975 .else 
                                    976 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    977 ;       EXIT    ( -- )
                                    978 ;       Terminate a colon definition.
                                    979 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    980 ;       _HEADER EXIT,4,"EXIT"
                                    981 EXIT:
                                    982         POPW Y
                                    983         RET
                                    984 .endif 
                                    985 
                                    986 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    987 ;       !       ( w a -- )
                                    988 ;       Pop  data stack to memory.
                                    989 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0004CE                        990         _HEADER STORE,1,"!"
      00854E 85 3D                    1         .word LINK 
                           0004D0     2         LINK=.
      008550 01                       3         .byte 1  
      008551 21                       4         .ascii "!"
      008552                          5         STORE:
      008552 90 93            [ 1]  991         LDW Y,X
      008554 90 FE            [ 2]  992         LDW Y,(Y)    ;Y=a
      008556 89               [ 2]  993         PUSHW X
      008557 EE 02            [ 2]  994         LDW X,(2,X) ; x=w 
      008559 90 FF            [ 2]  995         LDW (Y),X 
      00855B 85               [ 2]  996         POPW X  
      0004DC                        997         _DDROP 
      00855C 1C 00 04         [ 2]    1    ADDW X,#2*CELLL 
      00855F 81               [ 4]  998         RET     
                                    999 
                                   1000 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1001 ;       @       ( a -- w )
                                   1002 ;       Push memory location to stack.
                                   1003 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0004E0                       1004         _HEADER AT,1,"@"
      008560 85 50                    1         .word LINK 
                           0004E2     2         LINK=.
      008562 01                       3         .byte 1  
      008563 40                       4         .ascii "@"
      008564                          5         AT:
      008564 90 93            [ 1] 1005         LDW Y,X     ;Y = a
      008566 90 FE            [ 2] 1006         LDW Y,(Y)   ; address 
      008568 90 FE            [ 2] 1007         LDW Y,(Y)   ; value 
      00856A FF               [ 2] 1008         LDW (X),Y ;w = @Y
      00856B 81               [ 4] 1009         RET     
                                   1010 
                                   1011 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1012 ;       C!      ( c b -- )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 23.
Hexadecimal [24-Bits]



                                   1013 ;       Pop  data stack to byte memory.
                                   1014 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0004EC                       1015         _HEADER CSTOR,2,"C!"
      00856C 85 62                    1         .word LINK 
                           0004EE     2         LINK=.
      00856E 02                       3         .byte 2  
      00856F 43 21                    4         .ascii "C!"
      008571                          5         CSTOR:
      008571 90 93            [ 1] 1016         LDW Y,X
      008573 90 FE            [ 2] 1017 	LDW Y,(Y)    ;Y=b
      008575 E6 03            [ 1] 1018         LD A,(3,X)    ;D = c
      008577 90 F7            [ 1] 1019         LD  (Y),A     ;store c at b
      008579 1C 00 04         [ 2] 1020 	ADDW X,#4 ; DDROP 
      00857C 81               [ 4] 1021         RET     
                                   1022 
                                   1023 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1024 ;       C@      ( b -- c )
                                   1025 ;       Push byte in memory to  stack.
                                   1026 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0004FD                       1027         _HEADER CAT,2,"C@"
      00857D 85 6E                    1         .word LINK 
                           0004FF     2         LINK=.
      00857F 02                       3         .byte 2  
      008580 43 40                    4         .ascii "C@"
      008582                          5         CAT:
      008582 90 93            [ 1] 1028         LDW Y,X     ;Y=b
      008584 90 FE            [ 2] 1029         LDW Y,(Y)
      008586 90 F6            [ 1] 1030         LD A,(Y)
      008588 E7 01            [ 1] 1031         LD (1,X),A
      00858A 7F               [ 1] 1032         CLR (X)
      00858B 81               [ 4] 1033         RET     
                                   1034 
                                   1035 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1036 ;       RP@     ( -- a )
                                   1037 ;       Push current RP to data stack.
                                   1038 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00050C                       1039         _HEADER RPAT,3,"RP@"
      00858C 85 7F                    1         .word LINK 
                           00050E     2         LINK=.
      00858E 03                       3         .byte 3  
      00858F 52 50 40                 4         .ascii "RP@"
      008592                          5         RPAT:
      008592 90 96            [ 1] 1040         LDW Y,SP    ;save return addr
      008594 1D 00 02         [ 2] 1041         SUBW X,#2
      008597 FF               [ 2] 1042         LDW (X),Y
      008598 81               [ 4] 1043         RET     
                                   1044 
                                   1045 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1046 ;       RP!     ( a -- )
                                   1047 ;       Set  return stack pointer.
                                   1048 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000519                       1049         _HEADER RPSTO,COMPO+3,"RP!"
      008599 85 8E                    1         .word LINK 
                           00051B     2         LINK=.
      00859B 43                       3         .byte COMPO+3  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 24.
Hexadecimal [24-Bits]



      00859C 52 50 21                 4         .ascii "RP!"
      00859F                          5         RPSTO:
      00859F 90 85            [ 2] 1050         POPW Y
      0085A1 90 BF 26         [ 2] 1051         LDW YTEMP,Y
      0085A4 90 93            [ 1] 1052         LDW Y,X
      0085A6 90 FE            [ 2] 1053         LDW Y,(Y)
      0085A8 90 94            [ 1] 1054         LDW SP,Y
      0085AA 1C 00 02         [ 2] 1055         ADDW X,#CELLL ; a was not dropped, Picatout 2020-05-24
      0085AD 92 CC 26         [ 5] 1056         JP [YTEMP]
                                   1057 
                                   1058 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1059 ;       R>      ( -- w )
                                   1060 ;       Pop return stack to data stack.
                                   1061 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000530                       1062         _HEADER RFROM,2,"R>"
      0085B0 85 9B                    1         .word LINK 
                           000532     2         LINK=.
      0085B2 02                       3         .byte 2  
      0085B3 52 3E                    4         .ascii "R>"
      0085B5                          5         RFROM:
      0085B5 1D 00 02         [ 2] 1063         SUBW X,#CELLL 
      0085B8 16 03            [ 2] 1064         LDW Y,(3,SP)
      0085BA FF               [ 2] 1065         LDW (X),Y 
      0085BB 90 85            [ 2] 1066         POPW Y 
      0085BD 5B 02            [ 2] 1067         ADDW SP,#2 
      0085BF 90 FC            [ 2] 1068         JP (Y)
                                   1069 
                                   1070 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1071 ;       R@      ( -- w )
                                   1072 ;       Copy top of return stack to stack.
                                   1073 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000541                       1074         _HEADER RAT,2,"R@"
      0085C1 85 B2                    1         .word LINK 
                           000543     2         LINK=.
      0085C3 02                       3         .byte 2  
      0085C4 52 40                    4         .ascii "R@"
      0085C6                          5         RAT:
      0085C6 16 03            [ 2] 1075         ldw y,(3,sp)
      0085C8 1D 00 02         [ 2] 1076         subw x,#CELLL 
      0085CB FF               [ 2] 1077         ldw (x),y 
      0085CC 81               [ 4] 1078         ret 
                                   1079 
                                   1080 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1081 ;       LOCAL ( n -- )
                                   1082 ;       reserve n slots on return stack
                                   1083 ;       for local variables 
                                   1084 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00054D                       1085         _HEADER LOCAL,5,"LOCAL"
      0085CD 85 C3                    1         .word LINK 
                           00054F     2         LINK=.
      0085CF 05                       3         .byte 5  
      0085D0 4C 4F 43 41 4C           4         .ascii "LOCAL"
      0085D5                          5         LOCAL:
      0085D5 90 85            [ 2] 1086         POPW Y  
      0085D7 90 BF 26         [ 2] 1087         LDW YTEMP,Y ; RETURN ADDRESS 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 25.
Hexadecimal [24-Bits]



      0085DA E6 01            [ 1] 1088         LD A,(1,X)
      0085DC 90 97            [ 1] 1089         LD YL,A 
      0085DE A6 02            [ 1] 1090         LD A,#CELLL 
      0085E0 90 42            [ 4] 1091         MUL Y,A 
      0085E2 90 BF 24         [ 2] 1092         LDw XTEMP,Y
      0085E5 90 96            [ 1] 1093         LDW Y,SP 
      0085E7 72 B2 00 24      [ 2] 1094         SUBW Y,XTEMP
      0085EB 90 94            [ 1] 1095         LDW SP,Y 
      0085ED 1C 00 02         [ 2] 1096         ADDW X,#CELLL 
      0085F0 92 CC 26         [ 5] 1097         JP [YTEMP]
                                   1098 
                                   1099 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1100 ;       NRDROP ( n -- )
                                   1101 ;       drop n elements from rstack
                                   1102 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000573                       1103         _HEADER NRDROP,6,"NRDROP" 
      0085F3 85 CF                    1         .word LINK 
                           000575     2         LINK=.
      0085F5 06                       3         .byte 6  
      0085F6 4E 52 44 52 4F 50        4         .ascii "NRDROP"
      0085FC                          5         NRDROP:
      0085FC 90 85            [ 2] 1104         POPW Y 
      0085FE 90 BF 26         [ 2] 1105         LDW YTEMP,Y ; RETURN ADDRESS 
      008601 E6 01            [ 1] 1106         LD A,(1,X)
      008603 90 97            [ 1] 1107         LD YL,A  
      008605 A6 02            [ 1] 1108         LD A,#CELLL 
      008607 90 42            [ 4] 1109         MUL Y,A 
      008609 90 BF 24         [ 2] 1110         LDW XTEMP,Y 
      00860C 90 96            [ 1] 1111         LDW Y,SP 
      00860E 72 B9 00 24      [ 2] 1112         ADDW Y,XTEMP 
      008612 90 94            [ 1] 1113         LDW SP,Y  
      008614 1C 00 02         [ 2] 1114         ADDW X,#CELLL 
      008617 92 CC 26         [ 5] 1115         JP [YTEMP]
                                   1116 
                                   1117 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1118 ;        ( n -- w)
                                   1119 ;      fetch nth element ofr return stack 
                                   1120 ;      n==0 is same as R@ 
                                   1121 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00059A                       1122         _HEADER NRAT,3,"NR@"
      00861A 85 F5                    1         .word LINK 
                           00059C     2         LINK=.
      00861C 03                       3         .byte 3  
      00861D 4E 52 40                 4         .ascii "NR@"
      008620                          5         NRAT:
      008620 E6 01            [ 1] 1123         LD A,(1,X)
      008622 90 97            [ 1] 1124         LD YL,A 
      008624 A6 02            [ 1] 1125         LD A,#CELLL 
      008626 90 42            [ 4] 1126         MUL Y,A 
      008628 90 BF 26         [ 2] 1127         LDW YTEMP,Y 
      00862B 90 96            [ 1] 1128         LDW Y,SP 
      00862D 72 A9 00 03      [ 2] 1129         ADDW Y,#3 
      008631 72 B9 00 26      [ 2] 1130         ADDW Y,YTEMP 
      008635 90 FE            [ 2] 1131         LDW Y,(Y)
      008637 FF               [ 2] 1132         LDW (X),Y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 26.
Hexadecimal [24-Bits]



      008638 81               [ 4] 1133         RET 
                                   1134 
                                   1135 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1136 ;       NR! ( w n --  )
                                   1137 ;       store w on nth position of 
                                   1138 ;       return stack 
                                   1139 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0005B9                       1140         _HEADER NRSTO,3,"NR!"
      008639 86 1C                    1         .word LINK 
                           0005BB     2         LINK=.
      00863B 03                       3         .byte 3  
      00863C 4E 52 21                 4         .ascii "NR!"
      00863F                          5         NRSTO:
      00863F 90 96            [ 1] 1141         LDW Y,SP
      008641 72 A9 00 03      [ 2] 1142         ADDW Y,#3 
      008645 90 BF 26         [ 2] 1143         LDW YTEMP,Y 
      008648 E6 01            [ 1] 1144         LD A,(1,X)
      00864A 90 97            [ 1] 1145         LD YL,A 
      00864C A6 02            [ 1] 1146         LD A,#CELLL 
      00864E 90 42            [ 4] 1147         MUL Y,A 
      008650 72 B9 00 26      [ 2] 1148         ADDW Y,YTEMP
      008654 89               [ 2] 1149         PUSHW X 
      008655 EE 02            [ 2] 1150         LDW X,(2,X)
      008657 90 FF            [ 2] 1151         LDW (Y),X
      008659 85               [ 2] 1152         POPW X 
      00865A 1C 00 04         [ 2] 1153         ADDW X,#2*CELLL 
      00865D 81               [ 4] 1154         RET 
                                   1155 
                                   1156 
                                   1157 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1158 ;       >R      ( w -- )
                                   1159 ;       Push data stack to return stack.
                                   1160 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0005DE                       1161         _HEADER TOR,COMPO+2,">R"
      00865E 86 3B                    1         .word LINK 
                           0005E0     2         LINK=.
      008660 42                       3         .byte COMPO+2  
      008661 3E 52                    4         .ascii ">R"
      008663                          5         TOR:
      008663 90 85            [ 2] 1162         POPW Y    ;save return addr
      008665 90 BF 26         [ 2] 1163         LDW YTEMP,Y
      008668 90 93            [ 1] 1164         LDW Y,X
      00866A 90 FE            [ 2] 1165         LDW Y,(Y)  ; W
      00866C 90 89            [ 2] 1166         PUSHW Y    ;W >R 
      00866E 1C 00 02         [ 2] 1167         ADDW X,#2
      008671 92 CC 26         [ 5] 1168         JP [YTEMP]
                                   1169 
                                   1170 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1171 ;       SP@     ( -- a )
                                   1172 ;       Push current stack pointer.
                                   1173 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0005F4                       1174         _HEADER SPAT,3,"SP@"
      008674 86 60                    1         .word LINK 
                           0005F6     2         LINK=.
      008676 03                       3         .byte 3  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 27.
Hexadecimal [24-Bits]



      008677 53 50 40                 4         .ascii "SP@"
      00867A                          5         SPAT:
      00867A 90 93            [ 1] 1175 	LDW Y,X
      00867C 1D 00 02         [ 2] 1176         SUBW X,#2
      00867F FF               [ 2] 1177 	LDW (X),Y
      008680 81               [ 4] 1178         RET     
                                   1179 
                                   1180 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1181 ;       SP!     ( a -- )
                                   1182 ;       Set  data stack pointer.
                                   1183 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000601                       1184         _HEADER SPSTO,3,"SP!"
      008681 86 76                    1         .word LINK 
                           000603     2         LINK=.
      008683 03                       3         .byte 3  
      008684 53 50 21                 4         .ascii "SP!"
      008687                          5         SPSTO:
      008687 FE               [ 2] 1185         LDW     X,(X)     ;X = a
      008688 81               [ 4] 1186         RET     
                                   1187 
                                   1188 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1189 ;       DROP    ( w -- )
                                   1190 ;       Discard top stack item.
                                   1191 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000609                       1192         _HEADER DROP,4,"DROP"
      008689 86 83                    1         .word LINK 
                           00060B     2         LINK=.
      00868B 04                       3         .byte 4  
      00868C 44 52 4F 50              4         .ascii "DROP"
      008690                          5         DROP:
      008690 1C 00 02         [ 2] 1193         ADDW X,#2     
      008693 81               [ 4] 1194         RET     
                                   1195 
                                   1196 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1197 ;       DUP     ( w -- w w )
                                   1198 ;       Duplicate  top stack item.
                                   1199 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000614                       1200         _HEADER DUPP,3,"DUP"
      008694 86 8B                    1         .word LINK 
                           000616     2         LINK=.
      008696 03                       3         .byte 3  
      008697 44 55 50                 4         .ascii "DUP"
      00869A                          5         DUPP:
      00869A 90 93            [ 1] 1201 	LDW Y,X
      00869C 1D 00 02         [ 2] 1202         SUBW X,#2
      00869F 90 FE            [ 2] 1203 	LDW Y,(Y)
      0086A1 FF               [ 2] 1204 	LDW (X),Y
      0086A2 81               [ 4] 1205         RET     
                                   1206 
                                   1207 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1208 ;       SWAP    ( w1 w2 -- w2 w1 )
                                   1209 ;       Exchange top two stack items.
                                   1210 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000623                       1211         _HEADER SWAPP,4,"SWAP"
      0086A3 86 96                    1         .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 28.
Hexadecimal [24-Bits]



                           000625     2         LINK=.
      0086A5 04                       3         .byte 4  
      0086A6 53 57 41 50              4         .ascii "SWAP"
      0086AA                          5         SWAPP:
      0086AA 90 93            [ 1] 1212         LDW Y,X
      0086AC 90 FE            [ 2] 1213         LDW Y,(Y)
      0086AE 90 89            [ 2] 1214         PUSHW Y  
      0086B0 90 93            [ 1] 1215         LDW Y,X
      0086B2 90 EE 02         [ 2] 1216         LDW Y,(2,Y)
      0086B5 FF               [ 2] 1217         LDW (X),Y
      0086B6 90 85            [ 2] 1218         POPW Y 
      0086B8 EF 02            [ 2] 1219         LDW (2,X),Y
      0086BA 81               [ 4] 1220         RET     
                                   1221 
                                   1222 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1223 ;       OVER    ( w1 w2 -- w1 w2 w1 )
                                   1224 ;       Copy second stack item to top.
                                   1225 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00063B                       1226         _HEADER OVER,4,"OVER"
      0086BB 86 A5                    1         .word LINK 
                           00063D     2         LINK=.
      0086BD 04                       3         .byte 4  
      0086BE 4F 56 45 52              4         .ascii "OVER"
      0086C2                          5         OVER:
      0086C2 1D 00 02         [ 2] 1227         SUBW X,#2
      0086C5 90 93            [ 1] 1228         LDW Y,X
      0086C7 90 EE 04         [ 2] 1229         LDW Y,(4,Y)
      0086CA FF               [ 2] 1230         LDW (X),Y
      0086CB 81               [ 4] 1231         RET     
                                   1232 
                                   1233 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1234 ;       0<      ( n -- t )
                                   1235 ;       Return true if n is negative.
                                   1236 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00064C                       1237         _HEADER ZLESS,2,"0<"
      0086CC 86 BD                    1         .word LINK 
                           00064E     2         LINK=.
      0086CE 02                       3         .byte 2  
      0086CF 30 3C                    4         .ascii "0<"
      0086D1                          5         ZLESS:
      0086D1 A6 FF            [ 1] 1238         LD A,#0xFF
      0086D3 90 93            [ 1] 1239         LDW Y,X
      0086D5 90 FE            [ 2] 1240         LDW Y,(Y)
      0086D7 2B 01            [ 1] 1241         JRMI     ZL1
      0086D9 4F               [ 1] 1242         CLR A   ;false
      0086DA F7               [ 1] 1243 ZL1:    LD     (X),A
      0086DB E7 01            [ 1] 1244         LD (1,X),A
      0086DD 81               [ 4] 1245 	RET     
                                   1246 
                                   1247 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1248 ;       0= ( n -- f )
                                   1249 ;   n==0?
                                   1250 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00065E                       1251         _HEADER ZEQUAL,2,"0="
      0086DE 86 CE                    1         .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 29.
Hexadecimal [24-Bits]



                           000660     2         LINK=.
      0086E0 02                       3         .byte 2  
      0086E1 30 3D                    4         .ascii "0="
      0086E3                          5         ZEQUAL:
      0086E3 A6 FF            [ 1] 1252         LD A,#0XFF 
      0086E5 90 93            [ 1] 1253         LDW Y,X 
      0086E7 90 FE            [ 2] 1254         LDW Y,(Y)
      0086E9 27 02            [ 1] 1255         JREQ ZEQU1 
      0086EB A6 00            [ 1] 1256         LD A,#0 
      0086ED                       1257 ZEQU1:  
      0086ED F7               [ 1] 1258         LD (X),A 
      0086EE E7 01            [ 1] 1259         LD (1,X),A         
      0086F0 81               [ 4] 1260         RET 
                                   1261 
                                   1262 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1263 ;       AND     ( w w -- w )
                                   1264 ;       Bitwise AND.
                                   1265 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000671                       1266         _HEADER ANDD,3,"AND"
      0086F1 86 E0                    1         .word LINK 
                           000673     2         LINK=.
      0086F3 03                       3         .byte 3  
      0086F4 41 4E 44                 4         .ascii "AND"
      0086F7                          5         ANDD:
      0086F7 F6               [ 1] 1267         LD  A,(X)    ;D=w
      0086F8 E4 02            [ 1] 1268         AND A,(2,X)
      0086FA E7 02            [ 1] 1269         LD (2,X),A
      0086FC E6 01            [ 1] 1270         LD A,(1,X)
      0086FE E4 03            [ 1] 1271         AND A,(3,X)
      008700 E7 03            [ 1] 1272         LD (3,X),A
      008702 1C 00 02         [ 2] 1273         ADDW X,#2
      008705 81               [ 4] 1274         RET
                                   1275 
                                   1276 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1277 ;       OR      ( w w -- w )
                                   1278 ;       Bitwise inclusive OR.
                                   1279 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000686                       1280         _HEADER ORR,2,"OR"
      008706 86 F3                    1         .word LINK 
                           000688     2         LINK=.
      008708 02                       3         .byte 2  
      008709 4F 52                    4         .ascii "OR"
      00870B                          5         ORR:
      00870B F6               [ 1] 1281         LD A,(X)    ;D=w
      00870C EA 02            [ 1] 1282         OR A,(2,X)
      00870E E7 02            [ 1] 1283         LD (2,X),A
      008710 E6 01            [ 1] 1284         LD A,(1,X)
      008712 EA 03            [ 1] 1285         OR A,(3,X)
      008714 E7 03            [ 1] 1286         LD (3,X),A
      008716 1C 00 02         [ 2] 1287         ADDW X,#2
      008719 81               [ 4] 1288         RET
                                   1289 
                                   1290 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1291 ;       XOR     ( w w -- w )
                                   1292 ;       Bitwise exclusive OR.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 30.
Hexadecimal [24-Bits]



                                   1293 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00069A                       1294         _HEADER XORR,3,"XOR"
      00871A 87 08                    1         .word LINK 
                           00069C     2         LINK=.
      00871C 03                       3         .byte 3  
      00871D 58 4F 52                 4         .ascii "XOR"
      008720                          5         XORR:
      008720 F6               [ 1] 1295         LD A,(X)    ;D=w
      008721 E8 02            [ 1] 1296         XOR A,(2,X)
      008723 E7 02            [ 1] 1297         LD (2,X),A
      008725 E6 01            [ 1] 1298         LD A,(1,X)
      008727 E8 03            [ 1] 1299         XOR A,(3,X)
      008729 E7 03            [ 1] 1300         LD (3,X),A
      00872B 1C 00 02         [ 2] 1301         ADDW X,#2
      00872E 81               [ 4] 1302         RET
                                   1303 
                                   1304 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1305 ;       UM+     ( u u -- udsum )
                                   1306 ;       Add two unsigned single
                                   1307 ;       and return a double sum.
                                   1308 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0006AF                       1309         _HEADER UPLUS,3,"UM+"
      00872F 87 1C                    1         .word LINK 
                           0006B1     2         LINK=.
      008731 03                       3         .byte 3  
      008732 55 4D 2B                 4         .ascii "UM+"
      008735                          5         UPLUS:
      008735 A6 01            [ 1] 1310         LD A,#1
      008737 90 93            [ 1] 1311         LDW Y,X
      008739 90 EE 02         [ 2] 1312         LDW Y,(2,Y)
      00873C 90 BF 26         [ 2] 1313         LDW YTEMP,Y
      00873F 90 93            [ 1] 1314         LDW Y,X
      008741 90 FE            [ 2] 1315         LDW Y,(Y)
      008743 72 B9 00 26      [ 2] 1316         ADDW Y,YTEMP
      008747 EF 02            [ 2] 1317         LDW (2,X),Y
      008749 25 01            [ 1] 1318         JRC     UPL1
      00874B 4F               [ 1] 1319         CLR A
      00874C E7 01            [ 1] 1320 UPL1:   LD     (1,X),A
      00874E 7F               [ 1] 1321         CLR (X)
      00874F 81               [ 4] 1322         RET
                                   1323 
                                   1324 ;; System and user variables
                                   1325 
                                   1326 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1327 ;       doVAR   ( -- a )
                                   1328 ;       run time code 
                                   1329 ;       for VARIABLE and CREATE.
                                   1330 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1331 ;       HEADER DOVAR,COMPO+5,"DOVAR"
      008750                       1332 DOVAR:
      008750 1D 00 02         [ 2] 1333 	SUBW X,#2
      008753 90 85            [ 2] 1334         POPW Y    ;get return addr (pfa)
      008755 90 FE            [ 2] 1335         LDW Y,(Y) ; indirect address 
      008757 FF               [ 2] 1336         LDW (X),Y    ;push on stack
      008758 81               [ 4] 1337         RET     ;go to RET of EXEC
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 31.
Hexadecimal [24-Bits]



                                   1338 
                                   1339 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1340 ;       BASE    ( -- a )
                                   1341 ;       Radix base for numeric I/O.
                                   1342 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0006D9                       1343         _HEADER BASE,4,"BASE"
      008759 87 31                    1         .word LINK 
                           0006DB     2         LINK=.
      00875B 04                       3         .byte 4  
      00875C 42 41 53 45              4         .ascii "BASE"
      008760                          5         BASE:
      008760 90 AE 00 06      [ 2] 1344 	LDW Y,#UBASE 
      008764 1D 00 02         [ 2] 1345 	SUBW X,#2
      008767 FF               [ 2] 1346         LDW (X),Y
      008768 81               [ 4] 1347         RET
                                   1348 
                                   1349 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1350 ;       tmp     ( -- a )
                                   1351 ;       A temporary storage.
                                   1352 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0006E9                       1353         _HEADER TEMP,3,"TMP"
      008769 87 5B                    1         .word LINK 
                           0006EB     2         LINK=.
      00876B 03                       3         .byte 3  
      00876C 54 4D 50                 4         .ascii "TMP"
      00876F                          5         TEMP:
      00876F 90 AE 00 0A      [ 2] 1354 	LDW Y,#UTMP
      008773 1D 00 02         [ 2] 1355 	SUBW X,#2
      008776 FF               [ 2] 1356         LDW (X),Y
      008777 81               [ 4] 1357         RET
                                   1358 
                                   1359 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1360 ;       >IN     ( -- a )
                                   1361 ;        Hold parsing pointer.
                                   1362 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0006F8                       1363         _HEADER INN,3,">IN"
      008778 87 6B                    1         .word LINK 
                           0006FA     2         LINK=.
      00877A 03                       3         .byte 3  
      00877B 3E 49 4E                 4         .ascii ">IN"
      00877E                          5         INN:
      00877E 90 AE 00 0C      [ 2] 1364 	LDW Y,#UINN 
      008782 1D 00 02         [ 2] 1365 	SUBW X,#2
      008785 FF               [ 2] 1366         LDW (X),Y
      008786 81               [ 4] 1367         RET
                                   1368 
                                   1369 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1370 ;       #TIB    ( -- a )
                                   1371 ;       Count in terminal input 
                                   1372 ;       buffer.
                                   1373 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000707                       1374         _HEADER NTIB,4,"#TIB"
      008787 87 7A                    1         .word LINK 
                           000709     2         LINK=.
      008789 04                       3         .byte 4  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 32.
Hexadecimal [24-Bits]



      00878A 23 54 49 42              4         .ascii "#TIB"
      00878E                          5         NTIB:
      00878E 90 AE 00 0E      [ 2] 1375 	LDW Y,#UCTIB 
      008792 1D 00 02         [ 2] 1376 	SUBW X,#2
      008795 FF               [ 2] 1377         LDW (X),Y
      008796 81               [ 4] 1378         RET
                                   1379 
                                   1380 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1381 ;       TBUF ( -- a )
                                   1382 ;       address of 128 bytes 
                                   1383 ;       transaction buffer
                                   1384 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000717                       1385         _HEADER TBUF,4,"TBUF"
      008797 87 89                    1         .word LINK 
                           000719     2         LINK=.
      008799 04                       3         .byte 4  
      00879A 54 42 55 46              4         .ascii "TBUF"
      00879E                          5         TBUF:
      00879E 90 AE 16 80      [ 2] 1386         ldw y,#ROWBUFF
      0087A2 1D 00 02         [ 2] 1387         subw x,#CELLL
      0087A5 FF               [ 2] 1388         ldw (x),y 
      0087A6 81               [ 4] 1389         ret 
                                   1390 
                                   1391 ; systeme variable 
                                   1392 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1393 ; compilation destination 
                                   1394 ; TFLASH ( -- A )
                                   1395 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000727                       1396         _HEADER TFLASH,6,"TFLASH"
      0087A7 87 99                    1         .word LINK 
                           000729     2         LINK=.
      0087A9 06                       3         .byte 6  
      0087AA 54 46 4C 41 53 48        4         .ascii "TFLASH"
      0087B0                          5         TFLASH:
      0087B0 1D 00 02         [ 2] 1397         subw x,#CELLL 
      0087B3 90 AE 00 20      [ 2] 1398         ldw y,#UTFLASH
      0087B7 FF               [ 2] 1399         ldw (x),y 
      0087B8 81               [ 4] 1400         ret 
                                   1401 
                                   1402 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1403 ;       "EVAL   ( -- a )
                                   1404 ;       Execution vector of EVAL.
                                   1405 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000739                       1406         _HEADER TEVAL,5,"'EVAL"
      0087B9 87 A9                    1         .word LINK 
                           00073B     2         LINK=.
      0087BB 05                       3         .byte 5  
      0087BC 27 45 56 41 4C           4         .ascii "'EVAL"
      0087C1                          5         TEVAL:
      0087C1 90 AE 00 12      [ 2] 1407 	LDW Y,#UINTER 
      0087C5 1D 00 02         [ 2] 1408 	SUBW X,#2
      0087C8 FF               [ 2] 1409         LDW (X),Y
      0087C9 81               [ 4] 1410         RET
                                   1411 
                                   1412 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 33.
Hexadecimal [24-Bits]



                                   1413 ;       HLD     ( -- a )
                                   1414 ;       Hold a pointer of output
                                   1415 ;        string.
                                   1416 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00074A                       1417         _HEADER HLD,3,"HLD"
      0087CA 87 BB                    1         .word LINK 
                           00074C     2         LINK=.
      0087CC 03                       3         .byte 3  
      0087CD 48 4C 44                 4         .ascii "HLD"
      0087D0                          5         HLD:
      0087D0 90 AE 00 14      [ 2] 1418 	LDW Y,#UHLD 
      0087D4 1D 00 02         [ 2] 1419 	SUBW X,#2
      0087D7 FF               [ 2] 1420         LDW (X),Y
      0087D8 81               [ 4] 1421         RET
                                   1422 
                                   1423 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1424 ;       CONTEXT ( -- a )
                                   1425 ;       Start vocabulary search.
                                   1426 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000759                       1427         _HEADER CNTXT,7,"CONTEXT"
      0087D9 87 CC                    1         .word LINK 
                           00075B     2         LINK=.
      0087DB 07                       3         .byte 7  
      0087DC 43 4F 4E 54 45 58 54     4         .ascii "CONTEXT"
      0087E3                          5         CNTXT:
      0087E3 90 AE 00 16      [ 2] 1428 	LDW Y,#UCNTXT
      0087E7 1D 00 02         [ 2] 1429 	SUBW X,#2
      0087EA FF               [ 2] 1430         LDW (X),Y
      0087EB 81               [ 4] 1431         RET
                                   1432 
                                   1433 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1434 ;       VP      ( -- a )
                                   1435 ;       Point to top of variables
                                   1436 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00076C                       1437         _HEADER VPP,2,"VP"
      0087EC 87 DB                    1         .word LINK 
                           00076E     2         LINK=.
      0087EE 02                       3         .byte 2  
      0087EF 56 50                    4         .ascii "VP"
      0087F1                          5         VPP:
      0087F1 90 AE 00 18      [ 2] 1438 	LDW Y,#UVP 
      0087F5 1D 00 02         [ 2] 1439 	SUBW X,#2
      0087F8 FF               [ 2] 1440         LDW (X),Y
      0087F9 81               [ 4] 1441         RET
                                   1442 
                                   1443 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1444 ;       CP    ( -- a )
                                   1445 ;       Pointer to top of FLASH 
                                   1446 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00077A                       1447         _HEADER CPP,2,"CP"
      0087FA 87 EE                    1         .word LINK 
                           00077C     2         LINK=.
      0087FC 02                       3         .byte 2  
      0087FD 43 50                    4         .ascii "CP"
      0087FF                          5         CPP:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



      0087FF 90 AE 00 1A      [ 2] 1448         ldw y,#UCP 
      008803 1D 00 02         [ 2] 1449         subw x,#CELLL 
      008806 FF               [ 2] 1450         ldw (x),y 
      008807 81               [ 4] 1451         ret                
                                   1452 
                                   1453 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1454 ;       LAST    ( -- a )
                                   1455 ;       Point to last name in 
                                   1456 ;       dictionary.
                                   1457 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000788                       1458         _HEADER LAST,4,"LAST"
      008808 87 FC                    1         .word LINK 
                           00078A     2         LINK=.
      00880A 04                       3         .byte 4  
      00880B 4C 41 53 54              4         .ascii "LAST"
      00880F                          5         LAST:
      00880F 90 AE 00 1C      [ 2] 1459 	LDW Y,#ULAST 
      008813 1D 00 02         [ 2] 1460 	SUBW X,#2
      008816 FF               [ 2] 1461         LDW (X),Y
      008817 81               [ 4] 1462         RET
                                   1463 
                                   1464 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1465 ; address of system variable URLAST 
                                   1466 ;       RAMLAST ( -- a )
                                   1467 ; RAM dictionary context 
                                   1468 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000798                       1469         _HEADER RAMLAST,7,"RAMLAST"
      008818 88 0A                    1         .word LINK 
                           00079A     2         LINK=.
      00881A 07                       3         .byte 7  
      00881B 52 41 4D 4C 41 53 54     4         .ascii "RAMLAST"
      008822                          5         RAMLAST:
      008822 90 AE 00 22      [ 2] 1470         ldw y,#URLAST 
      008826 1D 00 02         [ 2] 1471         subw x,#CELLL 
      008829 FF               [ 2] 1472         ldw (x),y 
      00882A 81               [ 4] 1473         ret 
                                   1474 
                                   1475 ;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1476 ;       OFFSET ( -- a )
                                   1477 ;       address of system 
                                   1478 ;       variable OFFSET 
                                   1479 ;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0007AB                       1480         _HEADER OFFSET,6,"OFFSET"
      00882B 88 1A                    1         .word LINK 
                           0007AD     2         LINK=.
      00882D 06                       3         .byte 6  
      00882E 4F 46 46 53 45 54        4         .ascii "OFFSET"
      008834                          5         OFFSET:
      008834 1D 00 02         [ 2] 1481         subw x,#CELLL
      008837 90 AE 00 1E      [ 2] 1482         ldw y,#UOFFSET 
      00883B FF               [ 2] 1483         ldw (x),y 
      00883C 81               [ 4] 1484         ret 
                                   1485 
                                   1486 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1487 ; adjust jump address 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



                                   1488 ;  adding OFFSET
                                   1489 ; ADR-ADJ ( a -- a+offset )
                                   1490 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00883D                       1491 ADRADJ: 
      00883D CD 88 34         [ 4] 1492         call OFFSET 
      008840 CD 85 64         [ 4] 1493         call AT 
      008843 CC 88 BD         [ 2] 1494         jp PLUS 
                                   1495 
                                   1496 
                                   1497 ;; Common functions
                                   1498 
                                   1499 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1500 ;       ?DUP    ( w -- w w | 0 )
                                   1501 ;       Dup tos if its is not zero.
                                   1502 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0007C6                       1503         _HEADER QDUP,4,"?DUP"
      008846 88 2D                    1         .word LINK 
                           0007C8     2         LINK=.
      008848 04                       3         .byte 4  
      008849 3F 44 55 50              4         .ascii "?DUP"
      00884D                          5         QDUP:
      00884D 90 93            [ 1] 1504         LDW Y,X
      00884F 90 FE            [ 2] 1505 	LDW Y,(Y)
      008851 27 04            [ 1] 1506         JREQ     QDUP1
      008853 1D 00 02         [ 2] 1507 	SUBW X,#CELLL 
      008856 FF               [ 2] 1508         LDW (X),Y
      008857 81               [ 4] 1509 QDUP1:  RET
                                   1510 
                                   1511 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1512 ;       ROT     ( w1 w2 w3 -- w2 w3 w1 )
                                   1513 ;       Rot 3rd item to top.
                                   1514 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0007D8                       1515         _HEADER ROT,3,"ROT"
      008858 88 48                    1         .word LINK 
                           0007DA     2         LINK=.
      00885A 03                       3         .byte 3  
      00885B 52 4F 54                 4         .ascii "ROT"
      00885E                          5         ROT:
      00885E 90 93            [ 1] 1516         ldw y,x 
      008860 90 FE            [ 2] 1517         ldw y,(y)
      008862 90 89            [ 2] 1518         pushw y 
      008864 90 93            [ 1] 1519         ldw y,x 
      008866 90 EE 04         [ 2] 1520         ldw y,(4,y)
      008869 FF               [ 2] 1521         ldw (x),y 
      00886A 90 93            [ 1] 1522         ldw y,x 
      00886C 90 EE 02         [ 2] 1523         ldw y,(2,y)
      00886F EF 04            [ 2] 1524         ldw (4,x),y 
      008871 90 85            [ 2] 1525         popw y 
      008873 EF 02            [ 2] 1526         ldw (2,x),y
      008875 81               [ 4] 1527         ret 
                                   1528 
                                   1529 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1530 ;    <ROT ( n1 n2 n3 -- n3 n1 n2 )
                                   1531 ;    rotate left 3 top elements 
                                   1532 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 36.
Hexadecimal [24-Bits]



      0007F6                       1533     _HEADER NROT,4,"<ROT"
      008876 88 5A                    1         .word LINK 
                           0007F8     2         LINK=.
      008878 04                       3         .byte 4  
      008879 3C 52 4F 54              4         .ascii "<ROT"
      00887D                          5         NROT:
      00887D 90 93            [ 1] 1534     LDW Y,X 
      00887F 90 FE            [ 2] 1535     LDW Y,(Y)
      008881 90 89            [ 2] 1536     PUSHW Y ; n3 >R 
      008883 90 93            [ 1] 1537     LDW Y,X 
      008885 90 EE 02         [ 2] 1538     LDW Y,(2,Y) ; Y = n2 
      008888 FF               [ 2] 1539     LDW (X),Y   ; TOS = n2 
      008889 90 93            [ 1] 1540     LDW Y,X    
      00888B 90 EE 04         [ 2] 1541     LDW Y,(4,Y) ; Y = n1 
      00888E EF 02            [ 2] 1542     LDW (2,X),Y ;   = n1 
      008890 90 85            [ 2] 1543     POPW Y  ; R> Y 
      008892 EF 04            [ 2] 1544     LDW (4,X),Y ; = n3 
      008894 81               [ 4] 1545     RET 
                                   1546 
                                   1547 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1548 ;       2DROP   ( w w -- )
                                   1549 ;       Discard two items on stack.
                                   1550 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000815                       1551         _HEADER DDROP,5,"2DROP"
      008895 88 78                    1         .word LINK 
                           000817     2         LINK=.
      008897 05                       3         .byte 5  
      008898 32 44 52 4F 50           4         .ascii "2DROP"
      00889D                          5         DDROP:
      00889D 1C 00 04         [ 2] 1552         ADDW X,#4
      0088A0 81               [ 4] 1553         RET
                                   1554 
                                   1555 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1556 ;       2DUP    ( w1 w2 -- w1 w2 w1 w2 )
                                   1557 ;       Duplicate top two items.
                                   1558 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000821                       1559         _HEADER DDUP,4,"2DUP"
      0088A1 88 97                    1         .word LINK 
                           000823     2         LINK=.
      0088A3 04                       3         .byte 4  
      0088A4 32 44 55 50              4         .ascii "2DUP"
      0088A8                          5         DDUP:
      0088A8 1D 00 04         [ 2] 1560         SUBW X,#4
      0088AB 90 93            [ 1] 1561         LDW Y,X
      0088AD 90 EE 06         [ 2] 1562         LDW Y,(6,Y)
      0088B0 EF 02            [ 2] 1563         LDW (2,X),Y
      0088B2 90 93            [ 1] 1564         LDW Y,X
      0088B4 90 EE 04         [ 2] 1565         LDW Y,(4,Y)
      0088B7 FF               [ 2] 1566         LDW (X),Y
      0088B8 81               [ 4] 1567         RET
                                   1568 
                                   1569 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1570 ;       +       ( w w -- sum )
                                   1571 ;       Add top two items.
                                   1572 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 37.
Hexadecimal [24-Bits]



      000839                       1573         _HEADER PLUS,1,"+"
      0088B9 88 A3                    1         .word LINK 
                           00083B     2         LINK=.
      0088BB 01                       3         .byte 1  
      0088BC 2B                       4         .ascii "+"
      0088BD                          5         PLUS:
      0088BD 90 93            [ 1] 1574         LDW Y,X
      0088BF 90 FE            [ 2] 1575         LDW Y,(Y)
      0088C1 90 BF 26         [ 2] 1576         LDW YTEMP,Y
      0088C4 1C 00 02         [ 2] 1577         ADDW X,#2
      0088C7 90 93            [ 1] 1578         LDW Y,X
      0088C9 90 FE            [ 2] 1579         LDW Y,(Y)
      0088CB 72 B9 00 26      [ 2] 1580         ADDW Y,YTEMP
      0088CF FF               [ 2] 1581         LDW (X),Y
      0088D0 81               [ 4] 1582         RET
                                   1583 
                                   1584 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1585 ;       TRUE ( -- -1 )
                                   1586 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000851                       1587         _HEADER TRUE,4,"TRUE"
      0088D1 88 BB                    1         .word LINK 
                           000853     2         LINK=.
      0088D3 04                       3         .byte 4  
      0088D4 54 52 55 45              4         .ascii "TRUE"
      0088D8                          5         TRUE:
      0088D8 A6 FF            [ 1] 1588         LD A,#255 
      0088DA 1D 00 02         [ 2] 1589         SUBW X,#CELLL
      0088DD F7               [ 1] 1590         LD (X),A 
      0088DE E7 01            [ 1] 1591         LD (1,X),A 
      0088E0 81               [ 4] 1592         RET 
                                   1593 
                                   1594 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1595 ;       FALSE ( -- 0 )
                                   1596 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000861                       1597         _HEADER FALSE,5,"FALSE"
      0088E1 88 D3                    1         .word LINK 
                           000863     2         LINK=.
      0088E3 05                       3         .byte 5  
      0088E4 46 41 4C 53 45           4         .ascii "FALSE"
      0088E9                          5         FALSE:
      0088E9 1D 00 02         [ 2] 1598         SUBW X,#CELLL 
      0088EC 7F               [ 1] 1599         CLR (X) 
      0088ED 6F 01            [ 1] 1600         CLR (1,X)
      0088EF 81               [ 4] 1601         RET 
                                   1602 
                                   1603 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1604 ;       NOT     ( w -- w )
                                   1605 ;       One's complement of tos.
                                   1606 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000870                       1607         _HEADER INVER,3,"NOT"
      0088F0 88 E3                    1         .word LINK 
                           000872     2         LINK=.
      0088F2 03                       3         .byte 3  
      0088F3 4E 4F 54                 4         .ascii "NOT"
      0088F6                          5         INVER:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



      0088F6 90 93            [ 1] 1608         LDW Y,X
      0088F8 90 FE            [ 2] 1609         LDW Y,(Y)
      0088FA 90 53            [ 2] 1610         CPLW Y
      0088FC FF               [ 2] 1611         LDW (X),Y
      0088FD 81               [ 4] 1612         RET
                                   1613 
                                   1614 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1615 ;       NEGATE  ( n -- -n )
                                   1616 ;       Two's complement of tos.
                                   1617 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00087E                       1618         _HEADER NEGAT,6,"NEGATE"
      0088FE 88 F2                    1         .word LINK 
                           000880     2         LINK=.
      008900 06                       3         .byte 6  
      008901 4E 45 47 41 54 45        4         .ascii "NEGATE"
      008907                          5         NEGAT:
      008907 90 93            [ 1] 1619         LDW Y,X
      008909 90 FE            [ 2] 1620         LDW Y,(Y)
      00890B 90 50            [ 2] 1621         NEGW Y
      00890D FF               [ 2] 1622         LDW (X),Y
      00890E 81               [ 4] 1623         RET
                                   1624 
                                   1625 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1626 ;       DNEGATE ( d -- -d )
                                   1627 ;       Two's complement of double.
                                   1628 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00088F                       1629         _HEADER DNEGA,7,"DNEGATE"
      00890F 89 00                    1         .word LINK 
                           000891     2         LINK=.
      008911 07                       3         .byte 7  
      008912 44 4E 45 47 41 54 45     4         .ascii "DNEGATE"
      008919                          5         DNEGA:
      008919 90 93            [ 1] 1630         LDW Y,X
      00891B 90 FE            [ 2] 1631 	LDW Y,(Y)
      00891D 90 53            [ 2] 1632         CPLW Y
      00891F 90 89            [ 2] 1633         PUSHW Y      ; Y >R 
      008921 90 93            [ 1] 1634         LDW Y,X
      008923 90 EE 02         [ 2] 1635         LDW Y,(2,Y)
      008926 90 53            [ 2] 1636         CPLW Y
      008928 72 A9 00 01      [ 2] 1637         ADDW Y,#1
      00892C EF 02            [ 2] 1638         LDW (2,X),Y
      00892E 90 85            [ 2] 1639         POPW Y       ; R> Y  
      008930 24 02            [ 1] 1640         JRNC DN1 
      008932 90 5C            [ 1] 1641         INCW Y
      008934 FF               [ 2] 1642 DN1:    LDW (X),Y
      008935 81               [ 4] 1643         RET
                                   1644 
                                   1645 
                                   1646 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1647 ;       S>D ( n -- d )
                                   1648 ; convert single integer to double 
                                   1649 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0008B6                       1650         _HEADER STOD,3,"S>D"
      008936 89 11                    1         .word LINK 
                           0008B8     2         LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 39.
Hexadecimal [24-Bits]



      008938 03                       3         .byte 3  
      008939 53 3E 44                 4         .ascii "S>D"
      00893C                          5         STOD:
      00893C 1D 00 02         [ 2] 1651         SUBW X,#CELLL 
      00893F 7F               [ 1] 1652         CLR (X) 
      008940 6F 01            [ 1] 1653         CLR (1,X) 
      008942 90 93            [ 1] 1654         LDW Y,X 
      008944 90 EE 02         [ 2] 1655         LDW Y,(2,Y)
      008947 2A 05            [ 1] 1656         JRPL 1$
      008949 90 AE FF FF      [ 2] 1657         LDW Y,#-1 
      00894D FF               [ 2] 1658         LDW (X),Y 
      00894E 81               [ 4] 1659 1$:     RET 
                                   1660 
                                   1661 
                                   1662 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1663 ;       -       ( n1 n2 -- n1-n2 )
                                   1664 ;       Subtraction.
                                   1665 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0008CF                       1666         _HEADER SUBB,1,"-"
      00894F 89 38                    1         .word LINK 
                           0008D1     2         LINK=.
      008951 01                       3         .byte 1  
      008952 2D                       4         .ascii "-"
      008953                          5         SUBB:
      008953 90 93            [ 1] 1667         LDW Y,X
      008955 90 FE            [ 2] 1668         LDW Y,(Y) ; n2 
      008957 90 BF 26         [ 2] 1669         LDW YTEMP,Y 
      00895A 1C 00 02         [ 2] 1670         ADDW X,#CELLL 
      00895D 90 93            [ 1] 1671         LDW Y,X
      00895F 90 FE            [ 2] 1672         LDW Y,(Y) ; n1 
      008961 72 B2 00 26      [ 2] 1673         SUBW Y,YTEMP ; n1-n2 
      008965 FF               [ 2] 1674         LDW (X),Y
      008966 81               [ 4] 1675         RET
                                   1676 
                                   1677 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1678 ;       ABS     ( n -- n )
                                   1679 ;       Return  absolute value of n.
                                   1680 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0008E7                       1681         _HEADER ABSS,3,"ABS"
      008967 89 51                    1         .word LINK 
                           0008E9     2         LINK=.
      008969 03                       3         .byte 3  
      00896A 41 42 53                 4         .ascii "ABS"
      00896D                          5         ABSS:
      00896D 90 93            [ 1] 1682         LDW Y,X
      00896F 90 FE            [ 2] 1683 	LDW Y,(Y)
      008971 2A 03            [ 1] 1684         JRPL     AB1     ;negate:
      008973 90 50            [ 2] 1685         NEGW     Y     ;else negate hi byte
      008975 FF               [ 2] 1686         LDW (X),Y
      008976 81               [ 4] 1687 AB1:    RET
                                   1688 
                                   1689 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1690 ;       =       ( w w -- t )
                                   1691 ;       Return true if top two are equal.
                                   1692 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 40.
Hexadecimal [24-Bits]



      0008F7                       1693         _HEADER EQUAL,1,"="
      008977 89 69                    1         .word LINK 
                           0008F9     2         LINK=.
      008979 01                       3         .byte 1  
      00897A 3D                       4         .ascii "="
      00897B                          5         EQUAL:
      00897B A6 FF            [ 1] 1694         LD A,#0xFF  ;true
      00897D 90 93            [ 1] 1695         LDW Y,X    
      00897F 90 FE            [ 2] 1696         LDW Y,(Y)   ; n2 
      008981 1C 00 02         [ 2] 1697         ADDW X,#CELLL 
      008984 F3               [ 2] 1698         CPW Y,(X)   ; n1==n2
      008985 27 01            [ 1] 1699         JREQ EQ1 
      008987 4F               [ 1] 1700         CLR A 
      008988 F7               [ 1] 1701 EQ1:    LD (X),A
      008989 E7 01            [ 1] 1702         LD (1,X),A
      00898B 81               [ 4] 1703 	RET     
                                   1704 
                                   1705 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1706 ;       U<      ( u1 u2 -- f )
                                   1707 ;       Unsigned compare of top two items.
                                   1708 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00090C                       1709         _HEADER ULESS,2,"U<"
      00898C 89 79                    1         .word LINK 
                           00090E     2         LINK=.
      00898E 02                       3         .byte 2  
      00898F 55 3C                    4         .ascii "U<"
      008991                          5         ULESS:
      008991 A6 FF            [ 1] 1710         LD A,#0xFF  ;true
      008993 90 93            [ 1] 1711         LDW Y,X    
      008995 90 EE 02         [ 2] 1712         LDW Y,(2,Y) ; u1 
      008998 F3               [ 2] 1713         CPW Y,(X)   ; cpw u1  u2 
      008999 25 01            [ 1] 1714         JRULT     ULES1
      00899B 4F               [ 1] 1715         CLR A
      00899C 1C 00 02         [ 2] 1716 ULES1:  ADDW X,#CELLL 
      00899F F7               [ 1] 1717         LD (X),A
      0089A0 E7 01            [ 1] 1718         LD (1,X),A
      0089A2 81               [ 4] 1719 	RET     
                                   1720 
                                   1721 
                                   1722 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1723 ;       <       ( n1 n2 -- t )
                                   1724 ;       Signed compare of top two items.
                                   1725 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000923                       1726         _HEADER LESS,1,"<"
      0089A3 89 8E                    1         .word LINK 
                           000925     2         LINK=.
      0089A5 01                       3         .byte 1  
      0089A6 3C                       4         .ascii "<"
      0089A7                          5         LESS:
      0089A7 A6 FF            [ 1] 1727         LD A,#0xFF  ;true
      0089A9 90 93            [ 1] 1728         LDW Y,X    
      0089AB 90 EE 02         [ 2] 1729         LDW Y,(2,Y)  ; n1 
      0089AE F3               [ 2] 1730         CPW Y,(X)  ; n1 < n2 ? 
      0089AF 2F 01            [ 1] 1731         JRSLT     LT1
      0089B1 4F               [ 1] 1732         CLR A
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



      0089B2 1C 00 02         [ 2] 1733 LT1:    ADDW X,#CELLL 
      0089B5 F7               [ 1] 1734         LD (X),A
      0089B6 E7 01            [ 1] 1735         LD (1,X),A
      0089B8 81               [ 4] 1736 	RET     
                                   1737 
                                   1738 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1739 ;   U> ( u1 u2 -- f )
                                   1740 ;   f = true if u1>u2 
                                   1741 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000939                       1742         _HEADER UGREAT,2,"U>"
      0089B9 89 A5                    1         .word LINK 
                           00093B     2         LINK=.
      0089BB 02                       3         .byte 2  
      0089BC 55 3E                    4         .ascii "U>"
      0089BE                          5         UGREAT:
      0089BE A6 FF            [ 1] 1743         LD A,#255  
      0089C0 90 93            [ 1] 1744         LDW Y,X 
      0089C2 90 EE 02         [ 2] 1745         LDW Y,(2,Y)  ; u1 
      0089C5 F3               [ 2] 1746         CPW Y,(X)  ; u1 > u2 
      0089C6 22 01            [ 1] 1747         JRUGT UGREAT1 
      0089C8 4F               [ 1] 1748         CLR A   
      0089C9                       1749 UGREAT1:
      0089C9 1C 00 02         [ 2] 1750         ADDW X,#CELLL 
      0089CC F7               [ 1] 1751         LD (X),A 
      0089CD E7 01            [ 1] 1752         LD (1,X),A 
      0089CF 81               [ 4] 1753         RET 
                                   1754 
                                   1755 
                                   1756 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1757 ;       >   (n1 n2 -- f )
                                   1758 ;  signed compare n1 n2 
                                   1759 ;  true if n1 > n2 
                                   1760 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000950                       1761         _HEADER GREAT,1,">"
      0089D0 89 BB                    1         .word LINK 
                           000952     2         LINK=.
      0089D2 01                       3         .byte 1  
      0089D3 3E                       4         .ascii ">"
      0089D4                          5         GREAT:
      0089D4 A6 FF            [ 1] 1762         LD A,#0xFF ;
      0089D6 90 93            [ 1] 1763         LDW Y,X 
      0089D8 90 EE 02         [ 2] 1764         LDW Y,(2,Y)  ; n1 
      0089DB F3               [ 2] 1765         CPW Y,(X) ; n1 > n2 ?  
      0089DC 2C 01            [ 1] 1766         JRSGT GREAT1 
      0089DE 4F               [ 1] 1767         CLR  A
      0089DF                       1768 GREAT1:
      0089DF 1C 00 02         [ 2] 1769         ADDW X,#CELLL 
      0089E2 F7               [ 1] 1770         LD (X),A 
      0089E3 E7 01            [ 1] 1771         LD (1,X),A 
      0089E5 81               [ 4] 1772         RET 
                                   1773 
                                   1774 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1775 ;       MAX     ( n n -- n )
                                   1776 ;       Return greater of two top items.
                                   1777 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal [24-Bits]



      000966                       1778         _HEADER MAX,3,"MAX"
      0089E6 89 D2                    1         .word LINK 
                           000968     2         LINK=.
      0089E8 03                       3         .byte 3  
      0089E9 4D 41 58                 4         .ascii "MAX"
      0089EC                          5         MAX:
      0089EC 90 93            [ 1] 1779         LDW Y,X    
      0089EE 90 FE            [ 2] 1780         LDW Y,(Y) ; n2 
      0089F0 E3 02            [ 2] 1781         CPW Y,(2,X)   
      0089F2 2F 02            [ 1] 1782         JRSLT  MAX1
      0089F4 EF 02            [ 2] 1783         LDW (2,X),Y
      0089F6 1C 00 02         [ 2] 1784 MAX1:   ADDW X,#2
      0089F9 81               [ 4] 1785 	RET     
                                   1786 
                                   1787 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1788 ;       MIN     ( n n -- n )
                                   1789 ;       Return smaller of top two items.
                                   1790 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00097A                       1791         _HEADER MIN,3,"MIN"
      0089FA 89 E8                    1         .word LINK 
                           00097C     2         LINK=.
      0089FC 03                       3         .byte 3  
      0089FD 4D 49 4E                 4         .ascii "MIN"
      008A00                          5         MIN:
      008A00 90 93            [ 1] 1792         LDW Y,X    
      008A02 90 FE            [ 2] 1793         LDW Y,(Y)  ; n2 
      008A04 E3 02            [ 2] 1794         CPW Y,(2,X) 
      008A06 2C 02            [ 1] 1795         JRSGT MIN1
      008A08 EF 02            [ 2] 1796         LDW (2,X),Y
      008A0A 1C 00 02         [ 2] 1797 MIN1:	ADDW X,#2
      008A0D 81               [ 4] 1798 	RET     
                                   1799 
                                   1800 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1801 ;       WITHIN  ( u ul uh -- t )
                                   1802 ;       Return true if u is within
                                   1803 ;       range of ul and uh. ( ul <= u < uh )
                                   1804 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00098E                       1805         _HEADER WITHI,6,"WITHIN"
      008A0E 89 FC                    1         .word LINK 
                           000990     2         LINK=.
      008A10 06                       3         .byte 6  
      008A11 57 49 54 48 49 4E        4         .ascii "WITHIN"
      008A17                          5         WITHI:
      008A17 CD 86 C2         [ 4] 1806         CALL     OVER
      008A1A CD 89 53         [ 4] 1807         CALL     SUBB
      008A1D CD 86 63         [ 4] 1808         CALL     TOR
      008A20 CD 89 53         [ 4] 1809         CALL     SUBB
      008A23 CD 85 B5         [ 4] 1810         CALL     RFROM
      008A26 CC 89 91         [ 2] 1811         JP     ULESS
                                   1812 
                                   1813 ;; Divide
                                   1814 
                                   1815 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1816 ;       UM/MOD  ( udl udh un -- ur uq )
                                   1817 ;       Unsigned divide of a double by a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
Hexadecimal [24-Bits]



                                   1818 ;       single. Return mod and quotient.
                                   1819 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1820 ; 2021-02-22
                                   1821 ; changed algorithm for Jeeek one 
                                   1822 ; ref: https://github.com/TG9541/stm8ef/pull/406        
      0009A9                       1823         _HEADER UMMOD,6,"UM/MOD"
      008A29 8A 10                    1         .word LINK 
                           0009AB     2         LINK=.
      008A2B 06                       3         .byte 6  
      008A2C 55 4D 2F 4D 4F 44        4         .ascii "UM/MOD"
      008A32                          5         UMMOD:
      008A32 90 93            [ 1] 1824         LDW     Y,X             ; stack pointer to Y
      008A34 FE               [ 2] 1825         LDW     X,(X)           ; un
      008A35 BF 26            [ 2] 1826         LDW     YTEMP,X         ; save un
      008A37 93               [ 1] 1827         LDW     X,Y
      008A38 5C               [ 1] 1828         INCW    X               ; drop un
      008A39 5C               [ 1] 1829         INCW    X
      008A3A 89               [ 2] 1830         PUSHW   X               ; save stack pointer
      008A3B FE               [ 2] 1831         LDW     X,(X)           ; X=udh
      008A3C 26 0B            [ 1] 1832         JRNE    MMSM0
      008A3E 1E 01            [ 2] 1833         LDW    X,(1,SP)
      008A40 EE 02            [ 2] 1834         LDW    X,(2,X)          ; udl 
      008A42 90 BE 26         [ 2] 1835         LDW     Y,YTEMP         ;divisor 
      008A45 65               [ 2] 1836         DIVW    X,Y             ; udl/un 
      008A46 51               [ 1] 1837         EXGW    X,Y 
      008A47 20 26            [ 2] 1838         JRA     MMSMb 
      008A49                       1839 MMSM0:    
      008A49 90 EE 04         [ 2] 1840         LDW     Y,(4,Y)         ; Y=udl (offset before drop)
      008A4C B3 26            [ 2] 1841         CPW     X,YTEMP
      008A4E 25 09            [ 1] 1842         JRULT   MMSM1           ; X is still on the R-stack
      008A50 85               [ 2] 1843         POPW    X               ; restore stack pointer
      008A51 90 5F            [ 1] 1844         CLRW    Y
      008A53 EF 02            [ 2] 1845         LDW     (2,X),Y         ; remainder 0
      008A55 90 5A            [ 2] 1846         DECW    Y
      008A57 FF               [ 2] 1847         LDW     (X),Y           ; quotient max. 16 bit value
      008A58 81               [ 4] 1848         RET
      008A59                       1849 MMSM1:
      008A59 A6 10            [ 1] 1850         LD      A,#16           ; loop count
      008A5B 90 58            [ 2] 1851         SLLW    Y               ; udl shift udl into udh
      008A5D                       1852 MMSM3:
      008A5D 59               [ 2] 1853         RLCW    X               ; rotate udl bit into uhdh (= remainder)
      008A5E 25 04            [ 1] 1854         JRC     MMSMa           ; if carry out of rotate
      008A60 B3 26            [ 2] 1855         CPW     X,YTEMP         ; compare udh to un
      008A62 25 05            [ 1] 1856         JRULT   MMSM4           ; can't subtract
      008A64                       1857 MMSMa:
      008A64 72 B0 00 26      [ 2] 1858         SUBW    X,YTEMP         ; can subtract
      008A68 98               [ 1] 1859         RCF
      008A69                       1860 MMSM4:
      008A69 8C               [ 1] 1861         CCF                     ; quotient bit
      008A6A 90 59            [ 2] 1862         RLCW    Y               ; rotate into quotient, rotate out udl
      008A6C 4A               [ 1] 1863         DEC     A               ; repeat
      008A6D 26 EE            [ 1] 1864         JRNE    MMSM3           ; if A == 0
      008A6F                       1865 MMSMb:
      008A6F BF 26            [ 2] 1866         LDW     YTEMP,X         ; done, save remainder
      008A71 85               [ 2] 1867         POPW    X               ; restore stack pointer
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



      008A72 FF               [ 2] 1868         LDW     (X),Y           ; save quotient
      008A73 90 BE 26         [ 2] 1869         LDW     Y,YTEMP         ; remainder onto stack
      008A76 EF 02            [ 2] 1870         LDW     (2,X),Y
      008A78 81               [ 4] 1871         RET
                                   1872 
                                   1873 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1874 ;   U/MOD ( u1 u2 -- ur uq )
                                   1875 ;   unsigned divide u1/u2 
                                   1876 ;   return remainder and quotient 
                                   1877 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0009F9                       1878         _HEADER USLMOD,5,"U/MOD"
      008A79 8A 2B                    1         .word LINK 
                           0009FB     2         LINK=.
      008A7B 05                       3         .byte 5  
      008A7C 55 2F 4D 4F 44           4         .ascii "U/MOD"
      008A81                          5         USLMOD:
      008A81 90 93            [ 1] 1879         LDW Y,X 
      008A83 90 FE            [ 2] 1880         LDW Y,(Y)  ; dividend 
      008A85 89               [ 2] 1881         PUSHW X    ; DP >R 
      008A86 EE 02            [ 2] 1882         LDW X,(2,X) ; divisor 
      008A88 65               [ 2] 1883         DIVW X,Y 
      008A89 89               [ 2] 1884         PUSHW X     ; quotient 
      008A8A 1E 03            [ 2] 1885         LDW X,(3,SP) ; DP 
      008A8C EF 02            [ 2] 1886         LDW (2,X),Y ; remainder 
      008A8E 16 01            [ 2] 1887         LDW Y,(1,SP) ; quotient 
      008A90 FF               [ 2] 1888         LDW (X),Y 
      008A91 5B 04            [ 2] 1889         ADDW SP,#2*CELLL ; drop quotient and DP from rstack 
      008A93 81               [ 4] 1890         RET 
                                   1891 
                                   1892 
                                   1893 
                                   1894 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
                                   1895 ;       M/MOD   ( d n -- r q )
                                   1896 ;       Signed floored divide of double by
                                   1897 ;       single. Return mod and quotient.
                                   1898 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000A14                       1899         _HEADER MSMOD,5,"M/MOD"
      008A94 8A 7B                    1         .word LINK 
                           000A16     2         LINK=.
      008A96 05                       3         .byte 5  
      008A97 4D 2F 4D 4F 44           4         .ascii "M/MOD"
      008A9C                          5         MSMOD:
      008A9C CD 86 9A         [ 4] 1900         CALL	DUPP
      008A9F CD 86 D1         [ 4] 1901         CALL	ZLESS
      008AA2 CD 86 9A         [ 4] 1902         CALL	DUPP
      008AA5 CD 86 63         [ 4] 1903         CALL	TOR
      008AA8 CD 85 19         [ 4] 1904         CALL	QBRAN
      008AAB 8A B9                 1905         .word	MMOD1
      008AAD CD 89 07         [ 4] 1906         CALL	NEGAT
      008AB0 CD 86 63         [ 4] 1907         CALL	TOR
      008AB3 CD 89 19         [ 4] 1908         CALL	DNEGA
      008AB6 CD 85 B5         [ 4] 1909         CALL	RFROM
      008AB9 CD 86 63         [ 4] 1910 MMOD1:	CALL	TOR
      008ABC CD 86 9A         [ 4] 1911         CALL	DUPP
      008ABF CD 86 D1         [ 4] 1912         CALL	ZLESS
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



      008AC2 CD 85 19         [ 4] 1913         CALL	QBRAN
      008AC5 8A CD                 1914         .word	MMOD2
      008AC7 CD 85 C6         [ 4] 1915         CALL	RAT
      008ACA CD 88 BD         [ 4] 1916         CALL	PLUS
      008ACD CD 85 B5         [ 4] 1917 MMOD2:	CALL	RFROM
      008AD0 CD 8A 32         [ 4] 1918         CALL	UMMOD
      008AD3 CD 85 B5         [ 4] 1919         CALL	RFROM
      008AD6 CD 85 19         [ 4] 1920         CALL	QBRAN
      008AD9 8A E4                 1921         .word	MMOD3
      008ADB CD 86 AA         [ 4] 1922         CALL	SWAPP
      008ADE CD 89 07         [ 4] 1923         CALL	NEGAT
      008AE1 CC 86 AA         [ 2] 1924         JP	SWAPP
      008AE4 81               [ 4] 1925 MMOD3:	RET
                                   1926 
                                   1927 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1928 ;       /MOD    ( n1 n2 -- r q )
                                   1929 ;       Signed divide n1/n2. 
                                   1930 ;       Return mod and quotient.
                                   1931 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000A65                       1932         _HEADER SLMOD,4,"/MOD"
      008AE5 8A 96                    1         .word LINK 
                           000A67     2         LINK=.
      008AE7 04                       3         .byte 4  
      008AE8 2F 4D 4F 44              4         .ascii "/MOD"
      008AEC                          5         SLMOD:
      008AEC F6               [ 1] 1933         LD A,(X)
      008AED 88               [ 1] 1934         PUSH A   ; n2 sign 
      008AEE E6 02            [ 1] 1935         LD A,(2,X)
      008AF0 88               [ 1] 1936         PUSH A    ; n1 sign 
      008AF1 CD 89 6D         [ 4] 1937         CALL ABSS 
      008AF4 CD 86 63         [ 4] 1938         CALL TOR  ; 
      008AF7 CD 89 6D         [ 4] 1939         CALL ABSS 
      008AFA CD 85 C6         [ 4] 1940         CALL RAT   
      008AFD CD 8A 81         [ 4] 1941         CALL USLMOD 
      008B00 7B 03            [ 1] 1942         LD A,(3,SP)
      008B02 1A 04            [ 1] 1943         OR A,(4,SP)
      008B04 2A 30            [ 1] 1944         JRPL SLMOD8 ; both positive nothing to change 
      008B06 7B 03            [ 1] 1945         LD A,(3,SP)
      008B08 18 04            [ 1] 1946         XOR A,(4,SP)
      008B0A 2A 1D            [ 1] 1947         JRPL SLMOD1
                                   1948 ; dividend and divisor are opposite sign          
      008B0C CD 89 07         [ 4] 1949         CALL NEGAT ; negative quotient
      008B0F CD 86 C2         [ 4] 1950         CALL OVER 
      008B12 CD 86 E3         [ 4] 1951         CALL ZEQUAL 
      000A95                       1952         _TBRAN SLMOD8 
      008B15 CD 85 27         [ 4]    1     CALL TBRAN 
      008B18 8B 36                    2     .word SLMOD8 
      008B1A CD 8C 30         [ 4] 1953         CALL ONEM   ; add one to quotient 
      008B1D CD 85 C6         [ 4] 1954         CALL RAT 
      008B20 CD 88 5E         [ 4] 1955         CALL ROT 
      008B23 CD 89 53         [ 4] 1956         CALL SUBB  ; corrected_remainder=divisor-remainder 
      008B26 CD 86 AA         [ 4] 1957         CALL SWAPP
      008B29                       1958 SLMOD1:
      008B29 7B 04            [ 1] 1959         LD A,(4,SP) ; divisor sign 
      008B2B 2A 09            [ 1] 1960         JRPL SLMOD8 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



      008B2D CD 86 63         [ 4] 1961         CALL TOR 
      008B30 CD 89 07         [ 4] 1962         CALL NEGAT ; if divisor negative negate remainder 
      008B33 CD 85 B5         [ 4] 1963         CALL RFROM 
      008B36                       1964 SLMOD8: 
      008B36 5B 04            [ 2] 1965         ADDW SP,#4 
      008B38 81               [ 4] 1966         RET 
                                   1967 
                                   1968 
                                   1969 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1970 ;       MOD     ( n n -- r )
                                   1971 ;       Signed divide. Return mod only.
                                   1972 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000AB9                       1973         _HEADER MODD,3,"MOD"
      008B39 8A E7                    1         .word LINK 
                           000ABB     2         LINK=.
      008B3B 03                       3         .byte 3  
      008B3C 4D 4F 44                 4         .ascii "MOD"
      008B3F                          5         MODD:
      008B3F CD 8A EC         [ 4] 1974 	CALL	SLMOD
      008B42 CC 86 90         [ 2] 1975 	JP	DROP
                                   1976 
                                   1977 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1978 ;       /       ( n n -- q )
                                   1979 ;       Signed divide. Return quotient only.
                                   1980 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000AC5                       1981         _HEADER SLASH,1,"/"
      008B45 8B 3B                    1         .word LINK 
                           000AC7     2         LINK=.
      008B47 01                       3         .byte 1  
      008B48 2F                       4         .ascii "/"
      008B49                          5         SLASH:
      008B49 CD 8A EC         [ 4] 1982         CALL	SLMOD
      008B4C CD 86 AA         [ 4] 1983         CALL	SWAPP
      008B4F CC 86 90         [ 2] 1984         JP	DROP
                                   1985 
                                   1986 ;; Multiply
                                   1987 
                                   1988 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1989 ;       UM*     ( u1 u2 -- ud )
                                   1990 ;       Unsigned multiply. Return 
                                   1991 ;       double product.
                                   1992 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000AD2                       1993         _HEADER UMSTA,3,"UM*"
      008B52 8B 47                    1         .word LINK 
                           000AD4     2         LINK=.
      008B54 03                       3         .byte 3  
      008B55 55 4D 2A                 4         .ascii "UM*"
      008B58                          5         UMSTA:
                                   1994 ; stack have 4 bytes u1=a:b u2=c:d
                                   1995         ;; bytes offset on data stack 
                           000002  1996         da=2 
                           000003  1997         db=3 
                           000000  1998         dc=0 
                           000001  1999         dd=1 
                                   2000         ;;;;;; local variables ;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



                                   2001         ;; product bytes offset on return stack 
                           000001  2002         UD1=1  ; ud bits 31..24
                           000002  2003         UD2=2  ; ud bits 23..16
                           000003  2004         UD3=3  ; ud bits 15..8 
                           000004  2005         UD4=4  ; ud bits 7..0 
                                   2006         ;; local variable for product set to zero   
      008B58 90 5F            [ 1] 2007         clrw y 
      008B5A 90 89            [ 2] 2008         pushw y  ; bits 15..0
      008B5C 90 89            [ 2] 2009         pushw y  ; bits 31..16 
      008B5E E6 03            [ 1] 2010         ld a,(db,x) ; b 
      008B60 90 97            [ 1] 2011         ld yl,a 
      008B62 E6 01            [ 1] 2012         ld a,(dd,x)   ; d
      008B64 90 42            [ 4] 2013         mul y,a    ; b*d  
      008B66 17 03            [ 2] 2014         ldw (UD3,sp),y ; lowest weight product 
      008B68 E6 03            [ 1] 2015         ld a,(db,x)
      008B6A 90 97            [ 1] 2016         ld yl,a 
      008B6C E6 00            [ 1] 2017         ld a,(dc,x)
      008B6E 90 42            [ 4] 2018         mul y,a  ; b*c 
                                   2019         ;;; do the partial sum 
      008B70 72 F9 02         [ 2] 2020         addw y,(UD2,sp)
      008B73 4F               [ 1] 2021         clr a 
      008B74 49               [ 1] 2022         rlc a
      008B75 6B 01            [ 1] 2023         ld (UD1,sp),a 
      008B77 17 02            [ 2] 2024         ldw (UD2,sp),y 
      008B79 E6 02            [ 1] 2025         ld a,(da,x)
      008B7B 90 97            [ 1] 2026         ld yl,a 
      008B7D E6 01            [ 1] 2027         ld a,(dd,x)
      008B7F 90 42            [ 4] 2028         mul y,a   ; a*d 
                                   2029         ;; do partial sum 
      008B81 72 F9 02         [ 2] 2030         addw y,(UD2,sp)
      008B84 4F               [ 1] 2031         clr a 
      008B85 19 01            [ 1] 2032         adc a,(UD1,sp)
      008B87 6B 01            [ 1] 2033         ld (UD1,sp),a  
      008B89 17 02            [ 2] 2034         ldw (UD2,sp),y 
      008B8B E6 02            [ 1] 2035         ld a,(da,x)
      008B8D 90 97            [ 1] 2036         ld yl,a 
      008B8F E6 00            [ 1] 2037         ld a,(dc,x)
      008B91 90 42            [ 4] 2038         mul y,a  ;  a*c highest weight product 
                                   2039         ;;; do partial sum 
      008B93 72 F9 01         [ 2] 2040         addw y,(UD1,sp)
      008B96 FF               [ 2] 2041         ldw (x),y  ; udh 
      008B97 16 03            [ 2] 2042         ldw y,(UD3,sp)
      008B99 EF 02            [ 2] 2043         ldw (2,x),y  ; udl  
      008B9B 5B 04            [ 2] 2044         addw sp,#4 ; drop local variable 
      008B9D 81               [ 4] 2045         ret  
                                   2046 
                                   2047 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2048 ;       *       ( n n -- n )
                                   2049 ;       Signed multiply. Return 
                                   2050 ;       single product.
                                   2051 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000B1E                       2052         _HEADER STAR,1,"*"
      008B9E 8B 54                    1         .word LINK 
                           000B20     2         LINK=.
      008BA0 01                       3         .byte 1  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



      008BA1 2A                       4         .ascii "*"
      008BA2                          5         STAR:
      008BA2 CD 8B 58         [ 4] 2053 	CALL	UMSTA
      008BA5 CC 86 90         [ 2] 2054 	JP	DROP
                                   2055 
                                   2056 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2057 ;       M*      ( n n -- d )
                                   2058 ;       Signed multiply. Return 
                                   2059 ;       double product.
                                   2060 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000B28                       2061         _HEADER MSTAR,2,"M*"
      008BA8 8B A0                    1         .word LINK 
                           000B2A     2         LINK=.
      008BAA 02                       3         .byte 2  
      008BAB 4D 2A                    4         .ascii "M*"
      008BAD                          5         MSTAR:
      008BAD CD 88 A8         [ 4] 2062         CALL	DDUP
      008BB0 CD 87 20         [ 4] 2063         CALL	XORR
      008BB3 CD 86 D1         [ 4] 2064         CALL	ZLESS
      008BB6 CD 86 63         [ 4] 2065         CALL	TOR
      008BB9 CD 89 6D         [ 4] 2066         CALL	ABSS
      008BBC CD 86 AA         [ 4] 2067         CALL	SWAPP
      008BBF CD 89 6D         [ 4] 2068         CALL	ABSS
      008BC2 CD 8B 58         [ 4] 2069         CALL	UMSTA
      008BC5 CD 85 B5         [ 4] 2070         CALL	RFROM
      008BC8 CD 85 19         [ 4] 2071         CALL	QBRAN
      008BCB 8B D0                 2072         .word	MSTA1
      008BCD CC 89 19         [ 2] 2073         JP	DNEGA
      008BD0 81               [ 4] 2074 MSTA1:	RET
                                   2075 
                                   2076 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2077 ;       */MOD   ( n1 n2 n3 -- r q )
                                   2078 ;       Multiply n1 and n2, then divide
                                   2079 ;       by n3. Return mod and quotient.
                                   2080 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000B51                       2081         _HEADER SSMOD,5,"*/MOD"
      008BD1 8B AA                    1         .word LINK 
                           000B53     2         LINK=.
      008BD3 05                       3         .byte 5  
      008BD4 2A 2F 4D 4F 44           4         .ascii "*/MOD"
      008BD9                          5         SSMOD:
      008BD9 CD 86 63         [ 4] 2082         CALL     TOR
      008BDC CD 8B AD         [ 4] 2083         CALL     MSTAR
      008BDF CD 85 B5         [ 4] 2084         CALL     RFROM
      008BE2 CC 8A 9C         [ 2] 2085         JP     MSMOD
                                   2086 
                                   2087 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2088 ;       */      ( n1 n2 n3 -- q )
                                   2089 ;       Multiply n1 by n2, then divide
                                   2090 ;       by n3. Return quotient only.
                                   2091 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000B65                       2092         _HEADER STASL,2,"*/"
      008BE5 8B D3                    1         .word LINK 
                           000B67     2         LINK=.
      008BE7 02                       3         .byte 2  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



      008BE8 2A 2F                    4         .ascii "*/"
      008BEA                          5         STASL:
      008BEA CD 8B D9         [ 4] 2093         CALL	SSMOD
      008BED CD 86 AA         [ 4] 2094         CALL	SWAPP
      008BF0 CC 86 90         [ 2] 2095         JP	DROP
                                   2096 
                                   2097 ;; Miscellaneous
                                   2098 
                                   2099 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2100 ;       2+   ( a -- a )
                                   2101 ;       Add cell size in byte to address.
                                   2102 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000B73                       2103         _HEADER CELLP,2,"2+"
      008BF3 8B E7                    1         .word LINK 
                           000B75     2         LINK=.
      008BF5 02                       3         .byte 2  
      008BF6 32 2B                    4         .ascii "2+"
      008BF8                          5         CELLP:
      008BF8 90 93            [ 1] 2104         LDW Y,X
      008BFA 90 FE            [ 2] 2105 	LDW Y,(Y)
      008BFC 72 A9 00 02      [ 2] 2106         ADDW Y,#CELLL 
      008C00 FF               [ 2] 2107         LDW (X),Y
      008C01 81               [ 4] 2108         RET
                                   2109 
                                   2110 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2111 ;       2-   ( a -- a )
                                   2112 ;       Subtract 2 from address.
                                   2113 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000B82                       2114         _HEADER CELLM,2,"2-"
      008C02 8B F5                    1         .word LINK 
                           000B84     2         LINK=.
      008C04 02                       3         .byte 2  
      008C05 32 2D                    4         .ascii "2-"
      008C07                          5         CELLM:
      008C07 90 93            [ 1] 2115         LDW Y,X
      008C09 90 FE            [ 2] 2116 	LDW Y,(Y)
      008C0B 72 A2 00 02      [ 2] 2117         SUBW Y,#CELLL
      008C0F FF               [ 2] 2118         LDW (X),Y
      008C10 81               [ 4] 2119         RET
                                   2120 
                                   2121 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2122 ;       2*   ( n -- n )
                                   2123 ;       Multiply tos by 2.
                                   2124 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000B91                       2125         _HEADER CELLS,2,"2*"
      008C11 8C 04                    1         .word LINK 
                           000B93     2         LINK=.
      008C13 02                       3         .byte 2  
      008C14 32 2A                    4         .ascii "2*"
      008C16                          5         CELLS:
      008C16 90 93            [ 1] 2126         LDW Y,X
      008C18 90 FE            [ 2] 2127 	LDW Y,(Y)
      008C1A 90 58            [ 2] 2128         SLAW Y
      008C1C FF               [ 2] 2129         LDW (X),Y
      008C1D 81               [ 4] 2130         RET
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



                                   2131 
                                   2132 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2133 ;       1+      ( a -- a )
                                   2134 ;       Add cell size in byte 
                                   2135 ;       to address.
                                   2136 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000B9E                       2137         _HEADER ONEP,2,"1+"
      008C1E 8C 13                    1         .word LINK 
                           000BA0     2         LINK=.
      008C20 02                       3         .byte 2  
      008C21 31 2B                    4         .ascii "1+"
      008C23                          5         ONEP:
      008C23 90 93            [ 1] 2138         LDW Y,X
      008C25 90 FE            [ 2] 2139 	LDW Y,(Y)
      008C27 90 5C            [ 1] 2140         INCW Y
      008C29 FF               [ 2] 2141         LDW (X),Y
      008C2A 81               [ 4] 2142         RET
                                   2143 
                                   2144 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2145 ;       1-      ( a -- a )
                                   2146 ;       Subtract 2 from address.
                                   2147 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000BAB                       2148         _HEADER ONEM,2,"1-"
      008C2B 8C 20                    1         .word LINK 
                           000BAD     2         LINK=.
      008C2D 02                       3         .byte 2  
      008C2E 31 2D                    4         .ascii "1-"
      008C30                          5         ONEM:
      008C30 90 93            [ 1] 2149         LDW Y,X
      008C32 90 FE            [ 2] 2150 	LDW Y,(Y)
      008C34 90 5A            [ 2] 2151         DECW Y
      008C36 FF               [ 2] 2152         LDW (X),Y
      008C37 81               [ 4] 2153         RET
                                   2154 
                                   2155 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2156 ;  shift left n times 
                                   2157 ; LSHIFT ( n1 n2 -- n1<<n2 )
                                   2158 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000BB8                       2159         _HEADER LSHIFT,6,"LSHIFT"
      008C38 8C 2D                    1         .word LINK 
                           000BBA     2         LINK=.
      008C3A 06                       3         .byte 6  
      008C3B 4C 53 48 49 46 54        4         .ascii "LSHIFT"
      008C41                          5         LSHIFT:
      008C41 E6 01            [ 1] 2160         ld a,(1,x)
      008C43 1C 00 02         [ 2] 2161         addw x,#CELLL 
      008C46 90 93            [ 1] 2162         ldw y,x 
      008C48 90 FE            [ 2] 2163         ldw y,(y)
      008C4A                       2164 LSHIFT1:
      008C4A 4D               [ 1] 2165         tnz a 
      008C4B 27 05            [ 1] 2166         jreq LSHIFT4 
      008C4D 90 58            [ 2] 2167         sllw y 
      008C4F 4A               [ 1] 2168         dec a 
      008C50 20 F8            [ 2] 2169         jra LSHIFT1 
      008C52                       2170 LSHIFT4:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



      008C52 FF               [ 2] 2171         ldw (x),y 
      008C53 81               [ 4] 2172         ret 
                                   2173 
                                   2174 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2175 ; shift right n times                 
                                   2176 ; RSHIFT (n1 n2 -- n1>>n2 )
                                   2177 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000BD4                       2178         _HEADER RSHIFT,6,"RSHIFT"
      008C54 8C 3A                    1         .word LINK 
                           000BD6     2         LINK=.
      008C56 06                       3         .byte 6  
      008C57 52 53 48 49 46 54        4         .ascii "RSHIFT"
      008C5D                          5         RSHIFT:
      008C5D E6 01            [ 1] 2179         ld a,(1,x)
      008C5F 1C 00 02         [ 2] 2180         addw x,#CELLL 
      008C62 90 93            [ 1] 2181         ldw y,x 
      008C64 90 FE            [ 2] 2182         ldw y,(y)
      008C66                       2183 RSHIFT1:
      008C66 4D               [ 1] 2184         tnz a 
      008C67 27 05            [ 1] 2185         jreq RSHIFT4 
      008C69 90 54            [ 2] 2186         srlw y 
      008C6B 4A               [ 1] 2187         dec a 
      008C6C 20 F8            [ 2] 2188         jra RSHIFT1 
      008C6E                       2189 RSHIFT4:
      008C6E FF               [ 2] 2190         ldw (x),y 
      008C6F 81               [ 4] 2191         ret 
                                   2192 
                                   2193 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2194 ;       2/      ( n -- n )
                                   2195 ;       divide  tos by 2.
                                   2196 ;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000BF0                       2197         _HEADER TWOSL,2,"2/"
      008C70 8C 56                    1         .word LINK 
                           000BF2     2         LINK=.
      008C72 02                       3         .byte 2  
      008C73 32 2F                    4         .ascii "2/"
      008C75                          5         TWOSL:
      008C75 90 93            [ 1] 2198         LDW Y,X
      008C77 90 FE            [ 2] 2199 	LDW Y,(Y)
      008C79 90 57            [ 2] 2200         SRAW Y
      008C7B FF               [ 2] 2201         LDW (X),Y
      008C7C 81               [ 4] 2202         RET
                                   2203 
                                   2204 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2205 ;       BL      ( -- 32 )
                                   2206 ;       Return 32,  blank character.
                                   2207 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000BFD                       2208         _HEADER BLANK,2,"BL"
      008C7D 8C 72                    1         .word LINK 
                           000BFF     2         LINK=.
      008C7F 02                       3         .byte 2  
      008C80 42 4C                    4         .ascii "BL"
      008C82                          5         BLANK:
      008C82 1D 00 02         [ 2] 2209         SUBW X,#2
      008C85 90 AE 00 20      [ 2] 2210 	LDW Y,#32
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



      008C89 FF               [ 2] 2211         LDW (X),Y
      008C8A 81               [ 4] 2212         RET
                                   2213 
                                   2214 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2215 ;         0     ( -- 0)
                                   2216 ;         Return 0.
                                   2217 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000C0B                       2218         _HEADER ZERO,1,"0"
      008C8B 8C 7F                    1         .word LINK 
                           000C0D     2         LINK=.
      008C8D 01                       3         .byte 1  
      008C8E 30                       4         .ascii "0"
      008C8F                          5         ZERO:
      008C8F 1D 00 02         [ 2] 2219         SUBW X,#2
      008C92 90 5F            [ 1] 2220 	CLRW Y
      008C94 FF               [ 2] 2221         LDW (X),Y
      008C95 81               [ 4] 2222         RET
                                   2223 
                                   2224 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2225 ;         1     ( -- 1)
                                   2226 ;         Return 1.
                                   2227 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000C16                       2228         _HEADER ONE,1,"1"
      008C96 8C 8D                    1         .word LINK 
                           000C18     2         LINK=.
      008C98 01                       3         .byte 1  
      008C99 31                       4         .ascii "1"
      008C9A                          5         ONE:
      008C9A 1D 00 02         [ 2] 2229         SUBW X,#2
      008C9D 90 AE 00 01      [ 2] 2230 	LDW Y,#1
      008CA1 FF               [ 2] 2231         LDW (X),Y
      008CA2 81               [ 4] 2232         RET
                                   2233 
                                   2234 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2235 ;         -1    ( -- -1)
                                   2236 ;   Return -1
                                   2237 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000C23                       2238         _HEADER MONE,2,"-1"
      008CA3 8C 98                    1         .word LINK 
                           000C25     2         LINK=.
      008CA5 02                       3         .byte 2  
      008CA6 2D 31                    4         .ascii "-1"
      008CA8                          5         MONE:
      008CA8 1D 00 02         [ 2] 2239         SUBW X,#2
      008CAB 90 AE FF FF      [ 2] 2240 	LDW Y,#0xFFFF
      008CAF FF               [ 2] 2241         LDW (X),Y
      008CB0 81               [ 4] 2242         RET
                                   2243 
                                   2244 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2245 ;       >CHAR   ( c -- c )
                                   2246 ;       Filter non-printing characters.
                                   2247 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000C31                       2248         _HEADER TCHAR,5,">CHAR"
      008CB1 8C A5                    1         .word LINK 
                           000C33     2         LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



      008CB3 05                       3         .byte 5  
      008CB4 3E 43 48 41 52           4         .ascii ">CHAR"
      008CB9                          5         TCHAR:
      008CB9 E6 01            [ 1] 2249         ld a,(1,x)
      008CBB A1 20            [ 1] 2250         cp a,#32  
      008CBD 2B 05            [ 1] 2251         jrmi 1$ 
      008CBF A1 7F            [ 1] 2252         cp a,#127 
      008CC1 2A 01            [ 1] 2253         jrpl 1$ 
      008CC3 81               [ 4] 2254         ret 
      008CC4 A6 5F            [ 1] 2255 1$:     ld a,#'_ 
      008CC6 E7 01            [ 1] 2256         ld (1,x),a 
      008CC8 81               [ 4] 2257         ret 
                                   2258 
                                   2259 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2260 ;       DEPTH   ( -- n )
                                   2261 ;       Return  depth of  data stack.
                                   2262 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000C49                       2263         _HEADER DEPTH,5,"DEPTH"
      008CC9 8C B3                    1         .word LINK 
                           000C4B     2         LINK=.
      008CCB 05                       3         .byte 5  
      008CCC 44 45 50 54 48           4         .ascii "DEPTH"
      008CD1                          5         DEPTH:
      008CD1 90 BE 2C         [ 2] 2264         LDW Y,SP0    ;save data stack ptr
      008CD4 BF 24            [ 2] 2265 	LDW XTEMP,X
      008CD6 72 B2 00 24      [ 2] 2266         SUBW Y,XTEMP     ;#bytes = SP0 - X
      008CDA 90 57            [ 2] 2267         SRAW Y    ;Y = #stack items
      008CDC 1D 00 02         [ 2] 2268 	SUBW X,#2
      008CDF FF               [ 2] 2269         LDW (X),Y     ; if neg, underflow
      008CE0 81               [ 4] 2270         RET
                                   2271 
                                   2272 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2273 ;       PICK    ( ... +n -- ... w )
                                   2274 ;       Copy  nth stack item to tos.
                                   2275 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000C61                       2276         _HEADER PICK,4,"PICK"
      008CE1 8C CB                    1         .word LINK 
                           000C63     2         LINK=.
      008CE3 04                       3         .byte 4  
      008CE4 50 49 43 4B              4         .ascii "PICK"
      008CE8                          5         PICK:
      008CE8 90 93            [ 1] 2277         LDW Y,X   ;D = n1
      008CEA 90 FE            [ 2] 2278         LDW Y,(Y)
                                   2279 ; modified for standard compliance          
                                   2280 ; 0 PICK must be equivalent to DUP 
      008CEC 90 5C            [ 1] 2281         INCW Y 
      008CEE 90 58            [ 2] 2282         SLAW Y
      008CF0 BF 24            [ 2] 2283         LDW XTEMP,X
      008CF2 72 B9 00 24      [ 2] 2284         ADDW Y,XTEMP
      008CF6 90 FE            [ 2] 2285         LDW Y,(Y)
      008CF8 FF               [ 2] 2286         LDW (X),Y
      008CF9 81               [ 4] 2287         RET
                                   2288 
                                   2289 ;; Memory access
                                   2290 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



                                   2291 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2292 ;       +!      ( n a -- )
                                   2293 ;       Add n to  contents at 
                                   2294 ;       address a.
                                   2295 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000C7A                       2296         _HEADER PSTOR,2,"+!"
      008CFA 8C E3                    1         .word LINK 
                           000C7C     2         LINK=.
      008CFC 02                       3         .byte 2  
      008CFD 2B 21                    4         .ascii "+!"
      008CFF                          5         PSTOR:
      008CFF 89               [ 2] 2297         PUSHW X   ; R: DP 
      008D00 90 93            [ 1] 2298         LDW Y,X 
      008D02 FE               [ 2] 2299         LDW X,(X) ; a 
      008D03 90 EE 02         [ 2] 2300         LDW Y,(2,Y)  ; n 
      008D06 90 89            [ 2] 2301         PUSHW Y      ; R: DP n 
      008D08 90 93            [ 1] 2302         LDW Y,X 
      008D0A 90 FE            [ 2] 2303         LDW Y,(Y)
      008D0C 72 F9 01         [ 2] 2304         ADDW Y,(1,SP) ; *a + n 
      008D0F FF               [ 2] 2305         LDW (X),Y 
      008D10 1E 03            [ 2] 2306         LDW X,(3,SP) ; DP
      008D12 1C 00 04         [ 2] 2307         ADDW X,#2*CELLL  ; ( n a -- )  
      008D15 5B 04            [ 2] 2308         ADDW SP,#2*CELLL ; R: DP n -- 
      008D17 81               [ 4] 2309         RET 
                                   2310                 
                                   2311 
                                   2312 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2313 ;       2!      ( d a -- )
                                   2314 ;       Store  double integer 
                                   2315 ;       to address a.
                                   2316 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000C98                       2317         _HEADER DSTOR,2,"2!"
      008D18 8C FC                    1         .word LINK 
                           000C9A     2         LINK=.
      008D1A 02                       3         .byte 2  
      008D1B 32 21                    4         .ascii "2!"
      008D1D                          5         DSTOR:
      008D1D 90 93            [ 1] 2318         LDW Y,X 
      008D1F 89               [ 2] 2319         PUSHW X 
      008D20 FE               [ 2] 2320         LDW X,(X) ; a 
      008D21 90 EE 02         [ 2] 2321         LDW Y,(2,Y) ; dhi 
      008D24 FF               [ 2] 2322         LDW (X),Y 
      008D25 16 01            [ 2] 2323         LDW Y,(1,SP)  
      008D27 90 EE 04         [ 2] 2324         LDW Y,(4,Y) ; dlo 
      008D2A EF 02            [ 2] 2325         LDW (2,X),Y  
      008D2C 85               [ 2] 2326         POPW X 
      008D2D 1C 00 06         [ 2] 2327         ADDW X,#3*CELLL 
      008D30 81               [ 4] 2328         RET 
                                   2329 
                                   2330 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2331 ;       2@      ( a -- d )
                                   2332 ;       Fetch double integer 
                                   2333 ;       from address a.
                                   2334 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000CB1                       2335         _HEADER DAT,2,"2@"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



      008D31 8D 1A                    1         .word LINK 
                           000CB3     2         LINK=.
      008D33 02                       3         .byte 2  
      008D34 32 40                    4         .ascii "2@"
      008D36                          5         DAT:
      008D36 90 93            [ 1] 2336         ldw y,x 
      008D38 1D 00 02         [ 2] 2337         subw x,#CELLL 
      008D3B 90 FE            [ 2] 2338         ldw y,(y) ;address 
      008D3D 90 89            [ 2] 2339         pushw y  
      008D3F 90 FE            [ 2] 2340         ldw y,(y) ; dhi 
      008D41 FF               [ 2] 2341         ldw (x),y 
      008D42 90 85            [ 2] 2342         popw y 
      008D44 90 EE 02         [ 2] 2343         ldw y,(2,y) ; dlo 
      008D47 EF 02            [ 2] 2344         ldw (2,x),y 
      008D49 81               [ 4] 2345         ret 
                                   2346 
                                   2347 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2348 ;       COUNT   ( b -- b +n )
                                   2349 ;       Return count byte of a string
                                   2350 ;       and add 1 to byte address.
                                   2351 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000CCA                       2352         _HEADER COUNT,5,"COUNT"
      008D4A 8D 33                    1         .word LINK 
                           000CCC     2         LINK=.
      008D4C 05                       3         .byte 5  
      008D4D 43 4F 55 4E 54           4         .ascii "COUNT"
      008D52                          5         COUNT:
      008D52 90 93            [ 1] 2353         ldw y,x 
      008D54 90 FE            [ 2] 2354         ldw y,(y) ; address 
      008D56 90 F6            [ 1] 2355         ld a,(y)  ; count 
      008D58 90 5C            [ 1] 2356         incw y 
      008D5A FF               [ 2] 2357         ldw (x),y 
      008D5B 1D 00 02         [ 2] 2358         subw x,#CELLL 
      008D5E E7 01            [ 1] 2359         ld (1,x),a 
      008D60 7F               [ 1] 2360         clr (x)
      008D61 81               [ 4] 2361         ret 
                                   2362 
                                   2363 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2364 ;       HERE    ( -- a )
                                   2365 ;       Return  top of  variables
                                   2366 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000CE2                       2367         _HEADER HERE,4,"HERE"
      008D62 8D 4C                    1         .word LINK 
                           000CE4     2         LINK=.
      008D64 04                       3         .byte 4  
      008D65 48 45 52 45              4         .ascii "HERE"
      008D69                          5         HERE:
      008D69 90 AE 00 18      [ 2] 2368       	ldw y,#UVP 
      008D6D 90 FE            [ 2] 2369         ldw y,(y)
      008D6F 1D 00 02         [ 2] 2370         subw x,#CELLL 
      008D72 FF               [ 2] 2371         ldw (x),y 
      008D73 81               [ 4] 2372         ret 
                                   2373 
                                   2374 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2375 ;       PAD     ( -- a )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



                                   2376 ;       Return address of text buffer
                                   2377 ;       above  code dictionary.
                                   2378 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000CF4                       2379         _HEADER PAD,3,"PAD"
      008D74 8D 64                    1         .word LINK 
                           000CF6     2         LINK=.
      008D76 03                       3         .byte 3  
      008D77 50 41 44                 4         .ascii "PAD"
      008D7A                          5         PAD:
      008D7A CD 8D 69         [ 4] 2380         CALL     HERE
      000CFD                       2381         _DOLIT   80
      008D7D CD 84 F0         [ 4]    1     CALL DOLIT 
      008D80 00 50                    2     .word 80 
      008D82 CC 88 BD         [ 2] 2382         JP     PLUS
                                   2383 
                                   2384 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2385 ;       TIB     ( -- a )
                                   2386 ;       Return address of 
                                   2387 ;       terminal input buffer.
                                   2388 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000D05                       2389         _HEADER TIB,3,"TIB"
      008D85 8D 76                    1         .word LINK 
                           000D07     2         LINK=.
      008D87 03                       3         .byte 3  
      008D88 54 49 42                 4         .ascii "TIB"
      008D8B                          5         TIB:
      008D8B CD 87 8E         [ 4] 2390         CALL     NTIB
      008D8E CD 8B F8         [ 4] 2391         CALL     CELLP
      008D91 CC 85 64         [ 2] 2392         JP     AT
                                   2393 
                                   2394 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2395 ;       @EXECUTE        ( a -- )
                                   2396 ;       Execute vector stored in 
                                   2397 ;       address a.
                                   2398 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000D14                       2399         _HEADER ATEXE,8,"@EXECUTE"
      008D94 8D 87                    1         .word LINK 
                           000D16     2         LINK=.
      008D96 08                       3         .byte 8  
      008D97 40 45 58 45 43 55 54     4         .ascii "@EXECUTE"
             45
      008D9F                          5         ATEXE:
      008D9F CD 85 64         [ 4] 2400         CALL     AT
      008DA2 CD 88 4D         [ 4] 2401         CALL     QDUP    ;?address or zero
      008DA5 CD 85 19         [ 4] 2402         CALL     QBRAN
      008DA8 8D AD                 2403         .word      EXE1
      008DAA CD 85 45         [ 4] 2404         CALL     EXECU   ;execute if non-zero
      008DAD 81               [ 4] 2405 EXE1:   RET     ;do nothing if zero
                                   2406 
                                   2407 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2408 ;       CMOVE   ( b1 b2 u -- )
                                   2409 ;       Copy u bytes from b1 to b2.
                                   2410 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000D2E                       2411         _HEADER CMOVE,5,"CMOVE"
      008DAE 8D 96                    1         .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



                           000D30     2         LINK=.
      008DB0 05                       3         .byte 5  
      008DB1 43 4D 4F 56 45           4         .ascii "CMOVE"
      008DB6                          5         CMOVE:
                                   2412         ;;;;  local variables ;;;;;;;
                           000005  2413         DP = 5
                           000003  2414         YTMP = 3 
                           000001  2415         CNT  = 1 
                                   2416         ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      008DB6 89               [ 2] 2417         PUSHW X  ; R: DP  
      008DB7 52 02            [ 2] 2418         SUB SP,#2 ; R: DP YTMP 
      008DB9 90 93            [ 1] 2419         LDW Y,X 
      008DBB 90 FE            [ 2] 2420         LDW Y,(Y) ; CNT 
      008DBD 90 89            [ 2] 2421         PUSHW Y  ; R: DP YTMP CNT
      008DBF 90 93            [ 1] 2422         LDW Y,X 
      008DC1 90 EE 02         [ 2] 2423         LDW Y,(2,Y) ; b2, dest 
      008DC4 EE 04            [ 2] 2424         LDW X,(4,X) ; b1, src 
      008DC6 17 03            [ 2] 2425         LDW (YTMP,SP),Y 
      008DC8 13 03            [ 2] 2426         CPW X,(YTMP,SP) 
      008DCA 22 1A            [ 1] 2427         JRUGT CMOV2  ; src>dest 
                                   2428 ; src<dest copy from top to bottom
      008DCC 72 FB 01         [ 2] 2429         ADDW X,(CNT,SP)
      008DCF 72 F9 01         [ 2] 2430         ADDW Y,(CNT,SP)
      008DD2                       2431 CMOV1:  
      008DD2 17 03            [ 2] 2432         LDW (YTMP,SP),Y 
      008DD4 16 01            [ 2] 2433         LDW Y,(CNT,SP)
      008DD6 27 22            [ 1] 2434         JREQ CMOV3 
      008DD8 90 5A            [ 2] 2435         DECW Y 
      008DDA 17 01            [ 2] 2436         LDW (CNT,SP),Y 
      008DDC 16 03            [ 2] 2437         LDW Y,(YTMP,SP)
      008DDE 5A               [ 2] 2438         DECW X
      008DDF F6               [ 1] 2439         LD A,(X)
      008DE0 90 5A            [ 2] 2440         DECW Y 
      008DE2 90 F7            [ 1] 2441         LD (Y),A 
      008DE4 20 EC            [ 2] 2442         JRA CMOV1
                                   2443 ; src>dest copy from bottom to top   
      008DE6                       2444 CMOV2: 
      008DE6 17 03            [ 2] 2445         LDW (YTMP,SP),Y 
      008DE8 16 01            [ 2] 2446         LDW Y,(CNT,SP)
      008DEA 27 0E            [ 1] 2447         JREQ CMOV3
      008DEC 90 5A            [ 2] 2448         DECW Y 
      008DEE 17 01            [ 2] 2449         LDW (CNT,SP),Y 
      008DF0 16 03            [ 2] 2450         LDW Y,(YTMP,SP)
      008DF2 F6               [ 1] 2451         LD A,(X)
      008DF3 5C               [ 1] 2452         INCW X 
      008DF4 90 F7            [ 1] 2453         LD (Y),A 
      008DF6 90 5C            [ 1] 2454         INCW Y 
      008DF8 20 EC            [ 2] 2455         JRA CMOV2 
      008DFA                       2456 CMOV3:
      008DFA 1E 05            [ 2] 2457         LDW X,(DP,SP)
      008DFC 1C 00 06         [ 2] 2458         ADDW X,#3*CELLL 
      008DFF 5B 06            [ 2] 2459         ADDW SP,#3*CELLL 
      008E01 81               [ 4] 2460         RET 
                                   2461         
                                   2462 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



                                   2463 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2464 ;       FILL    ( b u c -- )
                                   2465 ;       Fill u bytes of character c
                                   2466 ;       to area beginning at b.
                                   2467 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000D82                       2468         _HEADER FILL,4,"FILL"
      008E02 8D B0                    1         .word LINK 
                           000D84     2         LINK=.
      008E04 04                       3         .byte 4  
      008E05 46 49 4C 4C              4         .ascii "FILL"
      008E09                          5         FILL:
      008E09 E6 01            [ 1] 2469         LD A,(1,X)
      008E0B 90 93            [ 1] 2470         LDW Y,X 
      008E0D 1C 00 06         [ 2] 2471         ADDW X,#3*CELLL 
      008E10 89               [ 2] 2472         PUSHW X ; R: DP 
      008E11 93               [ 1] 2473         LDW X,Y 
      008E12 EE 04            [ 2] 2474         LDW X,(4,X) ; b
      008E14 90 EE 02         [ 2] 2475         LDW Y,(2,Y) ; u
      008E17                       2476 FILL0:
      008E17 27 06            [ 1] 2477         JREQ FILL1
      008E19 F7               [ 1] 2478         LD (X),A 
      008E1A 5C               [ 1] 2479         INCW X 
      008E1B 90 5A            [ 2] 2480         DECW Y 
      008E1D 20 F8            [ 2] 2481         JRA FILL0         
      008E1F 85               [ 2] 2482 FILL1: POPW X 
      008E20 81               [ 4] 2483         RET         
                                   2484         
                                   2485 
                                   2486 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2487 ;       ERASE   ( b u -- )
                                   2488 ;       Erase u bytes beginning at b.
                                   2489 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000DA1                       2490         _HEADER ERASE,5,"ERASE"
      008E21 8E 04                    1         .word LINK 
                           000DA3     2         LINK=.
      008E23 05                       3         .byte 5  
      008E24 45 52 41 53 45           4         .ascii "ERASE"
      008E29                          5         ERASE:
      008E29 90 5F            [ 1] 2491         clrw y 
      008E2B 1D 00 02         [ 2] 2492         subw x,#CELLL 
      008E2E FF               [ 2] 2493         ldw (x),y 
      008E2F CC 8E 09         [ 2] 2494         jp FILL 
                                   2495 
                                   2496 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2497 ;       PACK0   ( b u a -- a )
                                   2498 ;       Build a counted string with
                                   2499 ;       u characters from b. Null fill.
                                   2500 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000DB2                       2501         _HEADER PACKS,5,"PACK0"
      008E32 8E 23                    1         .word LINK 
                           000DB4     2         LINK=.
      008E34 05                       3         .byte 5  
      008E35 50 41 43 4B 30           4         .ascii "PACK0"
      008E3A                          5         PACKS:
      008E3A CD 86 9A         [ 4] 2502         CALL     DUPP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



      008E3D CD 86 63         [ 4] 2503         CALL     TOR     ;strings only on cell boundary
      008E40 CD 88 A8         [ 4] 2504         CALL     DDUP
      008E43 CD 85 71         [ 4] 2505         CALL     CSTOR
      008E46 CD 8C 23         [ 4] 2506         CALL     ONEP ;save count
      008E49 CD 86 AA         [ 4] 2507         CALL     SWAPP
      008E4C CD 8D B6         [ 4] 2508         CALL     CMOVE
      008E4F CD 85 B5         [ 4] 2509         CALL     RFROM
      008E52 81               [ 4] 2510         RET
                                   2511 
                                   2512 ;; Numeric output, single precision
                                   2513 
                                   2514 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2515 ;       DIGIT   ( u -- c )
                                   2516 ;       Convert digit u to a character.
                                   2517 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000DD3                       2518         _HEADER DIGIT,5,"DIGIT"
      008E53 8E 34                    1         .word LINK 
                           000DD5     2         LINK=.
      008E55 05                       3         .byte 5  
      008E56 44 49 47 49 54           4         .ascii "DIGIT"
      008E5B                          5         DIGIT:
      008E5B CD 84 F0         [ 4] 2519         CALL	DOLIT
      008E5E 00 09                 2520         .word	9
      008E60 CD 86 C2         [ 4] 2521         CALL	OVER
      008E63 CD 89 A7         [ 4] 2522         CALL	LESS
      008E66 CD 84 F0         [ 4] 2523         CALL	DOLIT
      008E69 00 07                 2524         .word	7
      008E6B CD 86 F7         [ 4] 2525         CALL	ANDD
      008E6E CD 88 BD         [ 4] 2526         CALL	PLUS
      008E71 CD 84 F0         [ 4] 2527         CALL	DOLIT
      008E74 00 30                 2528         .word	48	;'0'
      008E76 CC 88 BD         [ 2] 2529         JP	PLUS
                                   2530 
                                   2531 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2532 ;       EXTRACT ( n base -- n c )
                                   2533 ;       Extract least significant 
                                   2534 ;       digit from n.
                                   2535 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000DF9                       2536         _HEADER EXTRC,7,"EXTRACT"
      008E79 8E 55                    1         .word LINK 
                           000DFB     2         LINK=.
      008E7B 07                       3         .byte 7  
      008E7C 45 58 54 52 41 43 54     4         .ascii "EXTRACT"
      008E83                          5         EXTRC:
      008E83 CD 8C 8F         [ 4] 2537         CALL     ZERO
      008E86 CD 86 AA         [ 4] 2538         CALL     SWAPP
      008E89 CD 8A 32         [ 4] 2539         CALL     UMMOD
      008E8C CD 86 AA         [ 4] 2540         CALL     SWAPP
      008E8F CC 8E 5B         [ 2] 2541         JP     DIGIT
                                   2542 
                                   2543 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2544 ;       <#      ( -- )
                                   2545 ;       Initiate  numeric 
                                   2546 ;       output process.
                                   2547 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



      000E12                       2548         _HEADER BDIGS,2,"#<"
      008E92 8E 7B                    1         .word LINK 
                           000E14     2         LINK=.
      008E94 02                       3         .byte 2  
      008E95 23 3C                    4         .ascii "#<"
      008E97                          5         BDIGS:
      008E97 CD 8D 7A         [ 4] 2549         CALL     PAD
      008E9A CD 87 D0         [ 4] 2550         CALL     HLD
      008E9D CC 85 52         [ 2] 2551         JP     STORE
                                   2552 
                                   2553 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2554 ;       HOLD    ( c -- )
                                   2555 ;       Insert a character 
                                   2556 ;       into output string.
                                   2557 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000E20                       2558         _HEADER HOLD,4,"HOLD"
      008EA0 8E 94                    1         .word LINK 
                           000E22     2         LINK=.
      008EA2 04                       3         .byte 4  
      008EA3 48 4F 4C 44              4         .ascii "HOLD"
      008EA7                          5         HOLD:
      008EA7 CD 87 D0         [ 4] 2559         CALL     HLD
      008EAA CD 85 64         [ 4] 2560         CALL     AT
      008EAD CD 8C 30         [ 4] 2561         CALL     ONEM
      008EB0 CD 86 9A         [ 4] 2562         CALL     DUPP
      008EB3 CD 87 D0         [ 4] 2563         CALL     HLD
      008EB6 CD 85 52         [ 4] 2564         CALL     STORE
      008EB9 CC 85 71         [ 2] 2565         JP     CSTOR
                                   2566 
                                   2567 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2568 ;       #       ( u -- u )
                                   2569 ;       Extract one digit from u and
                                   2570 ;       append digit to output string.
                                   2571 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000E3C                       2572         _HEADER DIG,1,"#"
      008EBC 8E A2                    1         .word LINK 
                           000E3E     2         LINK=.
      008EBE 01                       3         .byte 1  
      008EBF 23                       4         .ascii "#"
      008EC0                          5         DIG:
      008EC0 CD 87 60         [ 4] 2573         CALL     BASE
      008EC3 CD 85 64         [ 4] 2574         CALL     AT
      008EC6 CD 8E 83         [ 4] 2575         CALL     EXTRC
      008EC9 CC 8E A7         [ 2] 2576         JP     HOLD
                                   2577 
                                   2578 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2579 ;       #S      ( u -- 0 )
                                   2580 ;       Convert u until all digits
                                   2581 ;       are added to output string.
                                   2582 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000E4C                       2583         _HEADER DIGS,2,"#S"
      008ECC 8E BE                    1         .word LINK 
                           000E4E     2         LINK=.
      008ECE 02                       3         .byte 2  
      008ECF 23 53                    4         .ascii "#S"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



      008ED1                          5         DIGS:
      008ED1 CD 8E C0         [ 4] 2584 DIGS1:  CALL     DIG
      008ED4 CD 86 9A         [ 4] 2585         CALL     DUPP
      008ED7 CD 85 19         [ 4] 2586         CALL     QBRAN
      008EDA 8E DE                 2587         .word      DIGS2
      008EDC 20 F3            [ 2] 2588         JRA     DIGS1
      008EDE 81               [ 4] 2589 DIGS2:  RET
                                   2590 
                                   2591 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2592 ;       SIGN    ( n -- )
                                   2593 ;       Add a minus sign to
                                   2594 ;       numeric output string.
                                   2595 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000E5F                       2596         _HEADER SIGN,4,"SIGN"
      008EDF 8E CE                    1         .word LINK 
                           000E61     2         LINK=.
      008EE1 04                       3         .byte 4  
      008EE2 53 49 47 4E              4         .ascii "SIGN"
      008EE6                          5         SIGN:
      008EE6 CD 86 D1         [ 4] 2597         CALL     ZLESS
      008EE9 CD 85 19         [ 4] 2598         CALL     QBRAN
      008EEC 8E F6                 2599         .word      SIGN1
      008EEE CD 84 F0         [ 4] 2600         CALL     DOLIT
      008EF1 00 2D                 2601         .word      45	;"-"
      008EF3 CC 8E A7         [ 2] 2602         JP     HOLD
      008EF6 81               [ 4] 2603 SIGN1:  RET
                                   2604 
                                   2605 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2606 ;       #>      ( w -- b u )
                                   2607 ;       Prepare output string.
                                   2608 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000E77                       2609         _HEADER EDIGS,2,"#>"
      008EF7 8E E1                    1         .word LINK 
                           000E79     2         LINK=.
      008EF9 02                       3         .byte 2  
      008EFA 23 3E                    4         .ascii "#>"
      008EFC                          5         EDIGS:
      008EFC CD 86 90         [ 4] 2610         CALL     DROP
      008EFF CD 87 D0         [ 4] 2611         CALL     HLD
      008F02 CD 85 64         [ 4] 2612         CALL     AT
      008F05 CD 8D 7A         [ 4] 2613         CALL     PAD
      008F08 CD 86 C2         [ 4] 2614         CALL     OVER
      008F0B CC 89 53         [ 2] 2615         JP     SUBB
                                   2616 
                                   2617 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2618 ;       str     ( w -- b u )
                                   2619 ;       Convert a signed integer
                                   2620 ;       to a numeric string.
                                   2621 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000E8E                       2622         _HEADER STR,3,"STR"
      008F0E 8E F9                    1         .word LINK 
                           000E90     2         LINK=.
      008F10 03                       3         .byte 3  
      008F11 53 54 52                 4         .ascii "STR"
      008F14                          5         STR:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



      008F14 CD 86 9A         [ 4] 2623         CALL     DUPP
      008F17 CD 86 63         [ 4] 2624         CALL     TOR
      008F1A CD 89 6D         [ 4] 2625         CALL     ABSS
      008F1D CD 8E 97         [ 4] 2626         CALL     BDIGS
      008F20 CD 8E D1         [ 4] 2627         CALL     DIGS
      008F23 CD 85 B5         [ 4] 2628         CALL     RFROM
      008F26 CD 8E E6         [ 4] 2629         CALL     SIGN
      008F29 CC 8E FC         [ 2] 2630         JP     EDIGS
                                   2631 
                                   2632 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2633 ;       HEX     ( -- )
                                   2634 ;       Use radix 16 as base for
                                   2635 ;       numeric conversions.
                                   2636 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000EAC                       2637         _HEADER HEX,3,"HEX"
      008F2C 8F 10                    1         .word LINK 
                           000EAE     2         LINK=.
      008F2E 03                       3         .byte 3  
      008F2F 48 45 58                 4         .ascii "HEX"
      008F32                          5         HEX:
      008F32 CD 84 F0         [ 4] 2638         CALL     DOLIT
      008F35 00 10                 2639         .word      16
      008F37 CD 87 60         [ 4] 2640         CALL     BASE
      008F3A CC 85 52         [ 2] 2641         JP     STORE
                                   2642 
                                   2643 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2644 ;       DECIMAL ( -- )
                                   2645 ;       Use radix 10 as base
                                   2646 ;       for numeric conversions.
                                   2647 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000EBD                       2648         _HEADER DECIM,7,"DECIMAL"
      008F3D 8F 2E                    1         .word LINK 
                           000EBF     2         LINK=.
      008F3F 07                       3         .byte 7  
      008F40 44 45 43 49 4D 41 4C     4         .ascii "DECIMAL"
      008F47                          5         DECIM:
      008F47 CD 84 F0         [ 4] 2649         CALL     DOLIT
      008F4A 00 0A                 2650         .word      10
      008F4C CD 87 60         [ 4] 2651         CALL     BASE
      008F4F CC 85 52         [ 2] 2652         JP     STORE
                                   2653 
                                   2654 ;; Numeric input, single precision
                                   2655 
                                   2656 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2657 ;       DIGIT?  ( c base -- u t )
                                   2658 ;       Convert a character to its numeric
                                   2659 ;       value. A flag indicates success.
                                   2660 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000ED2                       2661         _HEADER DIGTQ,6,"DIGIT?"
      008F52 8F 3F                    1         .word LINK 
                           000ED4     2         LINK=.
      008F54 06                       3         .byte 6  
      008F55 44 49 47 49 54 3F        4         .ascii "DIGIT?"
      008F5B                          5         DIGTQ:
      008F5B CD 86 63         [ 4] 2662         CALL     TOR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



      008F5E CD 84 F0         [ 4] 2663         CALL     DOLIT
      008F61 00 30                 2664         .word     48	; "0"
      008F63 CD 89 53         [ 4] 2665         CALL     SUBB
      008F66 CD 84 F0         [ 4] 2666         CALL     DOLIT
      008F69 00 09                 2667         .word      9
      008F6B CD 86 C2         [ 4] 2668         CALL     OVER
      008F6E CD 89 A7         [ 4] 2669         CALL     LESS
      008F71 CD 85 19         [ 4] 2670         CALL     QBRAN
      008F74 8F 8C                 2671         .word      DGTQ1
      008F76 CD 84 F0         [ 4] 2672         CALL     DOLIT
      008F79 00 07                 2673         .word      7
      008F7B CD 89 53         [ 4] 2674         CALL     SUBB
      008F7E CD 86 9A         [ 4] 2675         CALL     DUPP
      008F81 CD 84 F0         [ 4] 2676         CALL     DOLIT
      008F84 00 0A                 2677         .word      10
      008F86 CD 89 A7         [ 4] 2678         CALL     LESS
      008F89 CD 87 0B         [ 4] 2679         CALL     ORR
      008F8C CD 86 9A         [ 4] 2680 DGTQ1:  CALL     DUPP
      008F8F CD 85 B5         [ 4] 2681         CALL     RFROM
      008F92 CC 89 91         [ 2] 2682         JP     ULESS
                                   2683 
                           000000  2684 .if  WANT_DOUBLE  
                           000001  2685 .iff 
                                   2686 
                                   2687 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2688 ; get all digits in row 
                                   2689 ; stop at first non-digit or end of string
                                   2690 ; ( n a cntr -- n  a+ cntr-  )
                                   2691 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      008F95                       2692 parse_digits:
      008F95 CD 86 9A         [ 4] 2693     CALL DUPP 
      000F18                       2694     _QBRAN 5$  
      008F98 CD 85 19         [ 4]    1     CALL QBRAN
      008F9B 8F D7                    2     .word 5$
      008F9D CD 86 63         [ 4] 2695     CALL TOR   ; n a R: cntr 
      008FA0 CD 8D 52         [ 4] 2696 1$: CALL COUNT ; n a+ char 
      008FA3 CD 87 60         [ 4] 2697     CALL BASE 
      008FA6 CD 85 64         [ 4] 2698     CALL AT 
      008FA9 CD 8F 5B         [ 4] 2699     CALL DIGTQ 
      000F2C                       2700     _QBRAN 4$ ; not a digit
      008FAC CD 85 19         [ 4]    1     CALL QBRAN
      008FAF 8F CB                    2     .word 4$
      008FB1 CD 88 5E         [ 4] 2701     CALL ROT 
      008FB4 CD 87 60         [ 4] 2702     CALL BASE 
      008FB7 CD 85 64         [ 4] 2703     CALL AT 
      008FBA CD 8B A2         [ 4] 2704     CALL STAR
      008FBD CD 88 BD         [ 4] 2705     CALL PLUS
      008FC0 CD 86 AA         [ 4] 2706     CALL SWAPP  
      008FC3 CD 85 B5         [ 4] 2707     CALL RFROM  ; n a+ cntr 
      008FC6 CD 8C 30         [ 4] 2708     CALL ONEM 
      008FC9 20 CA            [ 2] 2709     JRA parse_digits ; n a+ cntr  
      008FCB                       2710 4$: ; n a+ char R: cntr 
      008FCB 90 93            [ 1] 2711     LDW Y,X 
      008FCD 90 EE 02         [ 2] 2712     LDW Y,(2,Y)
      008FD0 90 5A            [ 2] 2713     DECW Y  ; dec(a)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



      008FD2 EF 02            [ 2] 2714     LDW (2,X),Y 
      008FD4 90 85            [ 2] 2715     POPW Y 
      008FD6 FF               [ 2] 2716     LDW (X),Y ; n a cntr  
      008FD7                       2717 5$:
      008FD7 81               [ 4] 2718     RET 
                                   2719 
                                   2720 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2721 ;       NUMBER? ( a -- n T | a F )
                                   2722 ;       Convert a number string to
                                   2723 ;       integer. Push a flag on tos.
                                   2724 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000F58                       2725         _HEADER NUMBQ,7,"NUMBER?"
      008FD8 8F 54                    1         .word LINK 
                           000F5A     2         LINK=.
      008FDA 07                       3         .byte 7  
      008FDB 4E 55 4D 42 45 52 3F     4         .ascii "NUMBER?"
      008FE2                          5         NUMBQ:
                                   2726 ; save BASE
      008FE2 CD 87 60         [ 4] 2727         CALL     BASE
      008FE5 CD 85 64         [ 4] 2728         CALL     AT
      008FE8 CD 86 63         [ 4] 2729         CALL     TOR
      008FEB CD 8C 8F         [ 4] 2730         CALL     ZERO
      008FEE CD 86 C2         [ 4] 2731         CALL     OVER
      008FF1 CD 8D 52         [ 4] 2732         CALL     COUNT ; string length,  a 0 a+ cnt 
                                   2733 ;  check hexadecimal character        
      008FF4 CD 86 C2         [ 4] 2734         CALL     OVER           ; a 0 a+ cnt a+ 
      008FF7 CD 85 82         [ 4] 2735         CALL     CAT
      000F7A                       2736         _DOLIT   '$'  ; hex?    ; a 0 a+ cnt char '$'
      008FFA CD 84 F0         [ 4]    1     CALL DOLIT 
      008FFD 00 24                    2     .word '$' 
      008FFF CD 89 7B         [ 4] 2737         CALL     EQUAL
      000F82                       2738         _QBRAN   NUMQ1
      009002 CD 85 19         [ 4]    1     CALL QBRAN
      009005 90 16                    2     .word NUMQ1
      009007 CD 8F 32         [ 4] 2739         CALL     HEX
      00900A CD 86 AA         [ 4] 2740         CALL     SWAPP
      00900D CD 8C 23         [ 4] 2741         CALL     ONEP
      009010 CD 86 AA         [ 4] 2742         CALL     SWAPP
      009013 CD 8C 30         [ 4] 2743         CALL     ONEM
                                   2744 ; check for negative sign         
      009016 CD 86 C2         [ 4] 2745 NUMQ1:  CALL     OVER
      009019 CD 85 82         [ 4] 2746         CALL     CAT
      000F9C                       2747         _DOLIT   '-'
      00901C CD 84 F0         [ 4]    1     CALL DOLIT 
      00901F 00 2D                    2     .word '-' 
      009021 CD 89 7B         [ 4] 2748         CALL     EQUAL
      009024 CD 86 63         [ 4] 2749         CALL     TOR    ; a 0 a+ cnt R: base sign 
                                   2750 ; update address and count 
      009027 CD 86 AA         [ 4] 2751         CALL     SWAPP
      00902A CD 85 C6         [ 4] 2752         CALL     RAT
      00902D CD 89 53         [ 4] 2753         CALL     SUBB
      009030 CD 86 AA         [ 4] 2754         CALL     SWAPP
      009033 CD 85 C6         [ 4] 2755         CALL     RAT
      009036 CD 88 BD         [ 4] 2756         CALL     PLUS  ; a 0 a+ cnt- R: base sign 
      009039 CD 88 4D         [ 4] 2757         CALL     QDUP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



      000FBC                       2758         _QBRAN   NUMQ4  ; end of string  a 0 a+ R: base sign 
      00903C CD 85 19         [ 4]    1     CALL QBRAN
      00903F 90 64                    2     .word NUMQ4
      009041 CD 8F 95         [ 4] 2759         CALL     parse_digits ; a 0 a+ cntr- -- a n a+ cntr-  R: base sign 
      009044 CD 86 9A         [ 4] 2760         CALL     DUPP   ; a n a+ cnt cnt -- R: base sign  
      000FC7                       2761         _TBRAN   NUMQ6
      009047 CD 85 27         [ 4]    1     CALL TBRAN 
      00904A 90 6C                    2     .word NUMQ6 
      00904C CD 88 9D         [ 4] 2762         CALL     DDROP   ; a n  R: base sign  
      00904F CD 85 B5         [ 4] 2763         CALL     RFROM   ; a n sign R: base 
      000FD2                       2764         _QBRAN   NUMQ3
      009052 CD 85 19         [ 4]    1     CALL QBRAN
      009055 90 5A                    2     .word NUMQ3
      009057 CD 89 07         [ 4] 2765         CALL     NEGAT ; a n R: base 
      00905A CD 86 AA         [ 4] 2766 NUMQ3:  CALL     SWAPP
      00905D 90 AE FF FF      [ 2] 2767         LDW  Y, #-1 
      009061 FF               [ 2] 2768         LDW (X),Y     ; n -1 R: base 
      009062 20 0E            [ 2] 2769         JRA      NUMQ9
      009064 CD 85 B5         [ 4] 2770 NUMQ4:  CALL     RFROM
      009067 CD 88 9D         [ 4] 2771         CALL     DDROP
      00906A 20 06            [ 2] 2772         JRA      NUMQ9 
      00906C                       2773 NUMQ6:  
                           000001  2774 .if WANT_FLOAT24 
                           000001  2775 .ift 
      00906C CD 85 B5         [ 4] 2776         CALL     RFROM ; a n a+ cnt sign R: base 
      00906F CD A9 3A         [ 4] 2777         CALL     FLOATQ  
                           000000  2778 .iff
                                   2779         ADDW SP,#CELLL ; remove sign from rstack 
                                   2780         ADDW  X,#2*CELLL ; drop a+ cnt S: a n  R: sign 
                                   2781         CLRW Y  
                                   2782         LDW (X),Y  ;  a 0 R: base 
                                   2783 .endif 
                                   2784 ; restore BASE 
      009072                       2785 NUMQ9: 
      009072 CD 85 B5         [ 4] 2786         CALL     RFROM
      009075 CD 87 60         [ 4] 2787         CALL     BASE
      009078 CC 85 52         [ 2] 2788         JP       STORE
                                   2789 .endif ; WANT_DOUBLE   
                                   2790 
                                   2791 ;; Basic I/O
                                   2792 
                                   2793 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2794 ;       KEY     ( -- c )
                                   2795 ;       Wait for and return an
                                   2796 ;       input character.
                                   2797 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000FFB                       2798         _HEADER KEY,3,"KEY"
      00907B 8F DA                    1         .word LINK 
                           000FFD     2         LINK=.
      00907D 03                       3         .byte 3  
      00907E 4B 45 59                 4         .ascii "KEY"
      009081                          5         KEY:
      009081 72 0B 52 30 FB   [ 2] 2799         btjf UART_SR,#UART_SR_RXNE,. 
      009086 C6 52 31         [ 1] 2800         ld a,UART_DR 
      009089 1D 00 02         [ 2] 2801         subw x,#CELLL 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



      00908C E7 01            [ 1] 2802         ld (1,x),a 
      00908E 7F               [ 1] 2803         clr (x)
      00908F 81               [ 4] 2804         ret 
                                   2805 
                                   2806 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2807 ;       NUF?    ( -- t )
                                   2808 ;       Return false if no input,
                                   2809 ;       else pause and if CR return true.
                                   2810 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001010                       2811         _HEADER NUFQ,4,"NUF?"
      009090 90 7D                    1         .word LINK 
                           001012     2         LINK=.
      009092 04                       3         .byte 4  
      009093 4E 55 46 3F              4         .ascii "NUF?"
      009097                          5         NUFQ:
      009097 CD 84 99         [ 4] 2812         CALL     QKEY
      00909A CD 86 9A         [ 4] 2813         CALL     DUPP
      00909D CD 85 19         [ 4] 2814         CALL     QBRAN
      0090A0 90 B0                 2815         .word    NUFQ1
      0090A2 CD 88 9D         [ 4] 2816         CALL     DDROP
      0090A5 CD 90 81         [ 4] 2817         CALL     KEY
      0090A8 CD 84 F0         [ 4] 2818         CALL     DOLIT
      0090AB 00 0D                 2819         .word      CRR
      0090AD CC 89 7B         [ 2] 2820         JP     EQUAL
      0090B0 81               [ 4] 2821 NUFQ1:  RET
                                   2822 
                                   2823 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2824 ;       SPACE   ( -- )
                                   2825 ;       Send  blank character to
                                   2826 ;       output device.
                                   2827 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001031                       2828         _HEADER SPACE,5,"SPACE"
      0090B1 90 92                    1         .word LINK 
                           001033     2         LINK=.
      0090B3 05                       3         .byte 5  
      0090B4 53 50 41 43 45           4         .ascii "SPACE"
      0090B9                          5         SPACE:
      0090B9 CD 8C 82         [ 4] 2829         CALL     BLANK
      0090BC CC 84 B7         [ 2] 2830         JP     EMIT
                                   2831 
                                   2832 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2833 ;       SPACES  ( +n -- )
                                   2834 ;       Send n spaces to output device.
                                   2835 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00103F                       2836         _HEADER SPACS,6,"SPACES"
      0090BF 90 B3                    1         .word LINK 
                           001041     2         LINK=.
      0090C1 06                       3         .byte 6  
      0090C2 53 50 41 43 45 53        4         .ascii "SPACES"
      0090C8                          5         SPACS:
      0090C8 CD 8C 8F         [ 4] 2837         CALL     ZERO
      0090CB CD 89 EC         [ 4] 2838         CALL     MAX
      0090CE CD 86 63         [ 4] 2839         CALL     TOR
      0090D1 20 03            [ 2] 2840         JRA      CHAR2
      0090D3 CD 90 B9         [ 4] 2841 CHAR1:  CALL     SPACE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



      0090D6 CD 85 04         [ 4] 2842 CHAR2:  CALL     DONXT
      0090D9 90 D3                 2843         .word    CHAR1
      0090DB 81               [ 4] 2844         RET
                                   2845 
                                   2846 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2847 ;       TYPE    ( b u -- )
                                   2848 ;       Output u characters from b.
                                   2849 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00105C                       2850         _HEADER TYPES,4,"TYPE"
      0090DC 90 C1                    1         .word LINK 
                           00105E     2         LINK=.
      0090DE 04                       3         .byte 4  
      0090DF 54 59 50 45              4         .ascii "TYPE"
      0090E3                          5         TYPES:
      0090E3 CD 86 63         [ 4] 2851         CALL     TOR
      0090E6 20 06            [ 2] 2852         JRA     TYPE2
      0090E8 CD 8D 52         [ 4] 2853 TYPE1:  CALL     COUNT 
      0090EB CD 84 B7         [ 4] 2854         CALL     EMIT
      00106E                       2855 TYPE2:  _DONXT  TYPE1
      0090EE CD 85 04         [ 4]    1     CALL DONXT 
      0090F1 90 E8                    2     .word TYPE1 
      001073                       2856         _DROP
      0090F3 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      0090F6 81               [ 4] 2857         RET 
                                   2858 
                                   2859 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2860 ;       CR      ( -- )
                                   2861 ;       Output a carriage return
                                   2862 ;       and a line feed.
                                   2863 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001077                       2864         _HEADER CR,2,"CR"
      0090F7 90 DE                    1         .word LINK 
                           001079     2         LINK=.
      0090F9 02                       3         .byte 2  
      0090FA 43 52                    4         .ascii "CR"
      0090FC                          5         CR:
      00107C                       2865         _DOLIT  CRR 
      0090FC CD 84 F0         [ 4]    1     CALL DOLIT 
      0090FF 00 0D                    2     .word CRR 
      009101 CD 84 B7         [ 4] 2866         CALL    EMIT
      001084                       2867         _DOLIT  LF
      009104 CD 84 F0         [ 4]    1     CALL DOLIT 
      009107 00 0A                    2     .word LF 
      009109 CC 84 B7         [ 2] 2868         JP      EMIT
                                   2869 
                                   2870 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2871 ;       do$     ( -- a )
                                   2872 ;       Return  address of a compiled
                                   2873 ;       string.
                                   2874 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2875 ;       _HEADER DOSTR,COMPO+3,"DO$"
      00910C                       2876 DOSTR:
      00910C CD 85 B5         [ 4] 2877         CALL     RFROM
      00910F CD 85 C6         [ 4] 2878         CALL     RAT
      009112 CD 85 B5         [ 4] 2879         CALL     RFROM
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



      009115 CD 8D 52         [ 4] 2880         CALL     COUNT
      009118 CD 88 BD         [ 4] 2881         CALL     PLUS
      00911B CD 86 63         [ 4] 2882         CALL     TOR
      00911E CD 86 AA         [ 4] 2883         CALL     SWAPP
      009121 CD 86 63         [ 4] 2884         CALL     TOR
      009124 81               [ 4] 2885         RET
                                   2886 
                                   2887 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2888 ;       $"|     ( -- a )
                                   2889 ;       Run time routine compiled by $".
                                   2890 ;       Return address of a compiled string.
                                   2891 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2892 ;       _HEADER STRQP,COMPO+3,"$\"|"
      009125                       2893 STRQP:
      009125 CD 91 0C         [ 4] 2894         CALL     DOSTR
      009128 81               [ 4] 2895         RET
                                   2896 
                                   2897 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2898 ;       ."|     ( -- )
                                   2899 ;       Run time routine of ." .
                                   2900 ;       Output a compiled string.
                                   2901 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2902 ;       _HEADER DOTQP,COMPO+3,".\"|"
      009129                       2903 DOTQP:
      009129 CD 91 0C         [ 4] 2904         CALL     DOSTR
      00912C CD 8D 52         [ 4] 2905         CALL     COUNT
      00912F CC 90 E3         [ 2] 2906         JP     TYPES
                                   2907 
                                   2908 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2909 ;       .R      ( n +n -- )
                                   2910 ;       Display an integer in a field
                                   2911 ;       of n columns, right justified.
                                   2912 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0010B2                       2913         _HEADER DOTR,2,".R"
      009132 90 F9                    1         .word LINK 
                           0010B4     2         LINK=.
      009134 02                       3         .byte 2  
      009135 2E 52                    4         .ascii ".R"
      009137                          5         DOTR:
      009137 CD 86 63         [ 4] 2914         CALL     TOR
      00913A CD 8F 14         [ 4] 2915         CALL     STR
      00913D CD 85 B5         [ 4] 2916         CALL     RFROM
      009140 CD 86 C2         [ 4] 2917         CALL     OVER
      009143 CD 89 53         [ 4] 2918         CALL     SUBB
      009146 CD 90 C8         [ 4] 2919         CALL     SPACS
      009149 CC 90 E3         [ 2] 2920         JP     TYPES
                                   2921 
                                   2922 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2923 ;       U.R     ( u +n -- )
                                   2924 ;       Display an unsigned integer
                                   2925 ;       in n column, right justified.
                                   2926 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0010CC                       2927         _HEADER UDOTR,3,"U.R"
      00914C 91 34                    1         .word LINK 
                           0010CE     2         LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



      00914E 03                       3         .byte 3  
      00914F 55 2E 52                 4         .ascii "U.R"
      009152                          5         UDOTR:
      009152 CD 86 63         [ 4] 2928         CALL     TOR
      009155 CD 8E 97         [ 4] 2929         CALL     BDIGS
      009158 CD 8E D1         [ 4] 2930         CALL     DIGS
      00915B CD 8E FC         [ 4] 2931         CALL     EDIGS
      00915E CD 85 B5         [ 4] 2932         CALL     RFROM
      009161 CD 86 C2         [ 4] 2933         CALL     OVER
      009164 CD 89 53         [ 4] 2934         CALL     SUBB
      009167 CD 90 C8         [ 4] 2935         CALL     SPACS
      00916A CC 90 E3         [ 2] 2936         JP     TYPES
                                   2937 
                                   2938 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2939 ;       U.      ( u -- )
                                   2940 ;       Display an unsigned integer
                                   2941 ;       in free format.
                                   2942 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0010ED                       2943         _HEADER UDOT,2,"U."
      00916D 91 4E                    1         .word LINK 
                           0010EF     2         LINK=.
      00916F 02                       3         .byte 2  
      009170 55 2E                    4         .ascii "U."
      009172                          5         UDOT:
      009172 CD 8E 97         [ 4] 2944         CALL     BDIGS
      009175 CD 8E D1         [ 4] 2945         CALL     DIGS
      009178 CD 8E FC         [ 4] 2946         CALL     EDIGS
      00917B CD 90 B9         [ 4] 2947         CALL     SPACE
      00917E CC 90 E3         [ 2] 2948         JP     TYPES
                                   2949 
                                   2950 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2951 ;   H. ( n -- )
                                   2952 ;   display n in hexadecimal 
                                   2953 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001101                       2954         _HEADER HDOT,2,"H."
      009181 91 6F                    1         .word LINK 
                           001103     2         LINK=.
      009183 02                       3         .byte 2  
      009184 48 2E                    4         .ascii "H."
      009186                          5         HDOT:
      009186 CD 87 60         [ 4] 2955         CALL BASE 
      009189 CD 85 64         [ 4] 2956         CALL AT 
      00918C CD 86 63         [ 4] 2957         CALL TOR 
      00918F CD 8F 32         [ 4] 2958         CALL HEX 
      009192 CD 91 72         [ 4] 2959         CALL UDOT 
      009195 CD 85 B5         [ 4] 2960         CALL RFROM 
      009198 CD 87 60         [ 4] 2961         CALL BASE 
      00919B CC 85 52         [ 2] 2962         JP STORE 
                                   2963          
                                   2964 
                                   2965 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2966 ;       .       ( w -- )
                                   2967 ;       Display an integer in free
                                   2968 ;       format, preceeded by a space.
                                   2969 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



      00111E                       2970         _HEADER DOT,1,"."
      00919E 91 83                    1         .word LINK 
                           001120     2         LINK=.
      0091A0 01                       3         .byte 1  
      0091A1 2E                       4         .ascii "."
      0091A2                          5         DOT:
      0091A2 CD 87 60         [ 4] 2971         CALL     BASE
      0091A5 CD 85 64         [ 4] 2972         CALL     AT
      0091A8 CD 84 F0         [ 4] 2973         CALL     DOLIT
      0091AB 00 0A                 2974         .word      10
      0091AD CD 87 20         [ 4] 2975         CALL     XORR    ;?decimal
      0091B0 CD 85 19         [ 4] 2976         CALL     QBRAN
      0091B3 91 B7                 2977         .word      DOT1
      0091B5 20 BB            [ 2] 2978         JRA     UDOT
      0091B7 CD 8F 14         [ 4] 2979 DOT1:   CALL     STR
      0091BA CD 90 B9         [ 4] 2980         CALL     SPACE
      0091BD CC 90 E3         [ 2] 2981         JP     TYPES
                                   2982 
                                   2983 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2984 ;       ?       ( a -- )
                                   2985 ;       Display contents in memory cell.
                                   2986 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001140                       2987         _HEADER QUEST,1,"?"
      0091C0 91 A0                    1         .word LINK 
                           001142     2         LINK=.
      0091C2 01                       3         .byte 1  
      0091C3 3F                       4         .ascii "?"
      0091C4                          5         QUEST:
      0091C4 CD 85 64         [ 4] 2988         CALL     AT
      0091C7 20 D9            [ 2] 2989         JRA     DOT
                                   2990 
                                   2991 ;; Parsing
                                   2992 
                                   2993 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2994 ;       parse   ( b u c -- b u delta ; <string> )
                                   2995 ;       Scan string delimited by c.
                                   2996 ;       Return found string and its offset.
                                   2997 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001149                       2998         _HEADER PARS,5,"PARS$"
      0091C9 91 C2                    1         .word LINK 
                           00114B     2         LINK=.
      0091CB 05                       3         .byte 5  
      0091CC 50 41 52 53 24           4         .ascii "PARS$"
      0091D1                          5         PARS:
      0091D1 CD 87 6F         [ 4] 2999         CALL     TEMP
      0091D4 CD 85 52         [ 4] 3000         CALL     STORE
      0091D7 CD 86 C2         [ 4] 3001         CALL     OVER
      0091DA CD 86 63         [ 4] 3002         CALL     TOR
      0091DD CD 86 9A         [ 4] 3003         CALL     DUPP
      0091E0 CD 85 19         [ 4] 3004         CALL     QBRAN
      0091E3 92 89                 3005         .word    PARS8
      0091E5 CD 8C 30         [ 4] 3006         CALL     ONEM
      0091E8 CD 87 6F         [ 4] 3007         CALL     TEMP
      0091EB CD 85 64         [ 4] 3008         CALL     AT
      0091EE CD 8C 82         [ 4] 3009         CALL     BLANK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



      0091F1 CD 89 7B         [ 4] 3010         CALL     EQUAL
      0091F4 CD 85 19         [ 4] 3011         CALL     QBRAN
      0091F7 92 2A                 3012         .word      PARS3
      0091F9 CD 86 63         [ 4] 3013         CALL     TOR
      0091FC CD 8C 82         [ 4] 3014 PARS1:  CALL     BLANK
      0091FF CD 86 C2         [ 4] 3015         CALL     OVER
      009202 CD 85 82         [ 4] 3016         CALL     CAT     ;skip leading blanks ONLY
      009205 CD 89 53         [ 4] 3017         CALL     SUBB
      009208 CD 86 D1         [ 4] 3018         CALL     ZLESS
      00920B CD 88 F6         [ 4] 3019         CALL     INVER
      00920E CD 85 19         [ 4] 3020         CALL     QBRAN
      009211 92 27                 3021         .word      PARS2
      009213 CD 8C 23         [ 4] 3022         CALL     ONEP
      009216 CD 85 04         [ 4] 3023         CALL     DONXT
      009219 91 FC                 3024         .word      PARS1
      00921B CD 85 B5         [ 4] 3025         CALL     RFROM
      00921E CD 86 90         [ 4] 3026         CALL     DROP
      009221 CD 8C 8F         [ 4] 3027         CALL     ZERO
      009224 CC 86 9A         [ 2] 3028         JP     DUPP
      009227 CD 85 B5         [ 4] 3029 PARS2:  CALL     RFROM
      00922A CD 86 C2         [ 4] 3030 PARS3:  CALL     OVER
      00922D CD 86 AA         [ 4] 3031         CALL     SWAPP
      009230 CD 86 63         [ 4] 3032         CALL     TOR
      009233 CD 87 6F         [ 4] 3033 PARS4:  CALL     TEMP
      009236 CD 85 64         [ 4] 3034         CALL     AT
      009239 CD 86 C2         [ 4] 3035         CALL     OVER
      00923C CD 85 82         [ 4] 3036         CALL     CAT
      00923F CD 89 53         [ 4] 3037         CALL     SUBB    ;scan for delimiter
      009242 CD 87 6F         [ 4] 3038         CALL     TEMP
      009245 CD 85 64         [ 4] 3039         CALL     AT
      009248 CD 8C 82         [ 4] 3040         CALL     BLANK
      00924B CD 89 7B         [ 4] 3041         CALL     EQUAL
      00924E CD 85 19         [ 4] 3042         CALL     QBRAN
      009251 92 56                 3043         .word      PARS5
      009253 CD 86 D1         [ 4] 3044         CALL     ZLESS
      009256 CD 85 19         [ 4] 3045 PARS5:  CALL     QBRAN
      009259 92 6B                 3046         .word      PARS6
      00925B CD 8C 23         [ 4] 3047         CALL     ONEP
      00925E CD 85 04         [ 4] 3048         CALL     DONXT
      009261 92 33                 3049         .word      PARS4
      009263 CD 86 9A         [ 4] 3050         CALL     DUPP
      009266 CD 86 63         [ 4] 3051         CALL     TOR
      009269 20 0F            [ 2] 3052         JRA     PARS7
      00926B CD 85 B5         [ 4] 3053 PARS6:  CALL     RFROM
      00926E CD 86 90         [ 4] 3054         CALL     DROP
      009271 CD 86 9A         [ 4] 3055         CALL     DUPP
      009274 CD 8C 23         [ 4] 3056         CALL     ONEP
      009277 CD 86 63         [ 4] 3057         CALL     TOR
      00927A CD 86 C2         [ 4] 3058 PARS7:  CALL     OVER
      00927D CD 89 53         [ 4] 3059         CALL     SUBB
      009280 CD 85 B5         [ 4] 3060         CALL     RFROM
      009283 CD 85 B5         [ 4] 3061         CALL     RFROM
      009286 CC 89 53         [ 2] 3062         JP     SUBB
      009289 CD 86 C2         [ 4] 3063 PARS8:  CALL     OVER
      00928C CD 85 B5         [ 4] 3064         CALL     RFROM
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



      00928F CC 89 53         [ 2] 3065         JP     SUBB
                                   3066 
                                   3067 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3068 ;       PARSE   ( c -- b u ; <string> )
                                   3069 ;       Scan input stream and return
                                   3070 ;       counted string delimited by c.
                                   3071 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001212                       3072         _HEADER PARSE,5,"PARSE"
      009292 91 CB                    1         .word LINK 
                           001214     2         LINK=.
      009294 05                       3         .byte 5  
      009295 50 41 52 53 45           4         .ascii "PARSE"
      00929A                          5         PARSE:
      00929A CD 86 63         [ 4] 3073         CALL     TOR
      00929D CD 8D 8B         [ 4] 3074         CALL     TIB
      0092A0 CD 87 7E         [ 4] 3075         CALL     INN
      0092A3 CD 85 64         [ 4] 3076         CALL     AT
      0092A6 CD 88 BD         [ 4] 3077         CALL     PLUS    ;current input buffer pointer
      0092A9 CD 87 8E         [ 4] 3078         CALL     NTIB
      0092AC CD 85 64         [ 4] 3079         CALL     AT
      0092AF CD 87 7E         [ 4] 3080         CALL     INN
      0092B2 CD 85 64         [ 4] 3081         CALL     AT
      0092B5 CD 89 53         [ 4] 3082         CALL     SUBB    ;remaining count
      0092B8 CD 85 B5         [ 4] 3083         CALL     RFROM
      0092BB CD 91 D1         [ 4] 3084         CALL     PARS
      0092BE CD 87 7E         [ 4] 3085         CALL     INN
      0092C1 CC 8C FF         [ 2] 3086         JP     PSTOR
                                   3087 
                                   3088 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3089 ;       .(      ( -- )
                                   3090 ;       Output following string up to next ) .
                                   3091 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001244                       3092         _HEADER DOTPR,IMEDD+2,".("
      0092C4 92 94                    1         .word LINK 
                           001246     2         LINK=.
      0092C6 82                       3         .byte IMEDD+2  
      0092C7 2E 28                    4         .ascii ".("
      0092C9                          5         DOTPR:
      0092C9 CD 84 F0         [ 4] 3093         CALL     DOLIT
      0092CC 00 29                 3094         .word     41	; ")"
      0092CE CD 92 9A         [ 4] 3095         CALL     PARSE
      0092D1 CC 90 E3         [ 2] 3096         JP     TYPES
                                   3097 
                                   3098 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3099 ;       (       ( -- )
                                   3100 ;       Ignore following string up to next ).
                                   3101 ;       A comment.
                                   3102 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001254                       3103         _HEADER PAREN,IMEDD+1,"("
      0092D4 92 C6                    1         .word LINK 
                           001256     2         LINK=.
      0092D6 81                       3         .byte IMEDD+1  
      0092D7 28                       4         .ascii "("
      0092D8                          5         PAREN:
      0092D8 CD 84 F0         [ 4] 3104         CALL     DOLIT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



      0092DB 00 29                 3105         .word     41	; ")"
      0092DD CD 92 9A         [ 4] 3106         CALL     PARSE
      0092E0 CC 88 9D         [ 2] 3107         JP     DDROP
                                   3108 
                                   3109 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3110 ;       \       ( -- )
                                   3111 ;       Ignore following text till
                                   3112 ;       end of line.
                                   3113 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001263                       3114         _HEADER BKSLA,IMEDD+1,"\\"
      0092E3 92 D6                    1         .word LINK 
                           001265     2         LINK=.
      0092E5 81                       3         .byte IMEDD+1  
      0092E6 5C 5C                    4         .ascii "\\"
      0092E8                          5         BKSLA:
      0092E8 90 AE 00 0E      [ 2] 3115         ldw y,#UCTIB ; #TIB  
      0092EC 90 FE            [ 2] 3116         ldw y,(y)
      0092EE 90 89            [ 2] 3117         pushw y ; count in TIB 
      0092F0 90 AE 00 0C      [ 2] 3118         ldw y,#UINN ; >IN 
      0092F4 90 BF 26         [ 2] 3119         ldw YTEMP,y
      0092F7 90 85            [ 2] 3120         popw y 
      0092F9 91 CF 26         [ 5] 3121         ldw [YTEMP],y
      0092FC 81               [ 4] 3122         ret 
                                   3123 
                                   3124 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3125 ;       WORD    ( c -- a ; <string> )
                                   3126 ;       Parse a word from input stream
                                   3127 ;       and copy it to code dictionary.
                                   3128 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00127D                       3129         _HEADER WORDD,4,"WORD"
      0092FD 92 E5                    1         .word LINK 
                           00127F     2         LINK=.
      0092FF 04                       3         .byte 4  
      009300 57 4F 52 44              4         .ascii "WORD"
      009304                          5         WORDD:
      009304 CD 92 9A         [ 4] 3130         CALL     PARSE
      009307 CD 8D 69         [ 4] 3131         CALL     HERE
      00930A CD 8B F8         [ 4] 3132         CALL     CELLP
                           000000  3133 .IF CASE_SENSE 
                                   3134         JP      PACKS 
                           000001  3135 .ELSE                 
      00930D CD 8E 3A         [ 4] 3136         CALL     PACKS
                                   3137 ; uppercase TOKEN 
      009310 CD 86 9A         [ 4] 3138         CALL    DUPP 
      009313 CD 8D 52         [ 4] 3139         CALL    COUNT 
      009316 CD 86 63         [ 4] 3140         CALL    TOR 
      009319 CD 85 35         [ 4] 3141         CALL    BRAN 
      00931C 93 4A                 3142         .word   UPPER2  
      00931E                       3143 UPPER:
      00931E CD 86 9A         [ 4] 3144         CALL    DUPP 
      009321 CD 85 82         [ 4] 3145         CALL    CAT
      009324 CD 86 9A         [ 4] 3146         CALL    DUPP 
      009327 CD 84 F0         [ 4] 3147         CALL   DOLIT
      00932A 00 61                 3148         .word   'a' 
      00932C CD 84 F0         [ 4] 3149         CALL    DOLIT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



      00932F 00 7B                 3150         .word   'z'+1 
      009331 CD 8A 17         [ 4] 3151         CALL   WITHI 
      009334 CD 85 19         [ 4] 3152         CALL   QBRAN
      009337 93 41                 3153         .word  UPPER1  
      009339 CD 84 F0         [ 4] 3154         CALL    DOLIT 
      00933C 00 DF                 3155         .word   0xDF 
      00933E CD 86 F7         [ 4] 3156         CALL    ANDD 
      009341                       3157 UPPER1:
      009341 CD 86 C2         [ 4] 3158         CALL    OVER 
      009344 CD 85 71         [ 4] 3159         CALL    CSTOR          
      009347 CD 8C 23         [ 4] 3160         CALL    ONEP 
      00934A                       3161 UPPER2: 
      00934A CD 85 04         [ 4] 3162         CALL    DONXT
      00934D 93 1E                 3163         .word   UPPER  
      00934F CD 86 90         [ 4] 3164         CALL    DROP  
      009352 81               [ 4] 3165         RET 
                                   3166 .ENDIF 
                                   3167 
                                   3168 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3169 ;       TOKEN   ( -- a ; <string> )
                                   3170 ;       Parse a word from input stream
                                   3171 ;       and copy it to name dictionary.
                                   3172 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0012D3                       3173         _HEADER TOKEN,5,"TOKEN"
      009353 92 FF                    1         .word LINK 
                           0012D5     2         LINK=.
      009355 05                       3         .byte 5  
      009356 54 4F 4B 45 4E           4         .ascii "TOKEN"
      00935B                          5         TOKEN:
      00935B CD 8C 82         [ 4] 3174         CALL     BLANK
      00935E CC 93 04         [ 2] 3175         JP     WORDD
                                   3176 
                                   3177 ;; Dictionary search
                                   3178 
                                   3179 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3180 ;       NAME>   ( na -- ca )
                                   3181 ;       Return a code address given
                                   3182 ;       a name address.
                                   3183 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0012E1                       3184         _HEADER NAMET,5,"NAME>"
      009361 93 55                    1         .word LINK 
                           0012E3     2         LINK=.
      009363 05                       3         .byte 5  
      009364 4E 41 4D 45 3E           4         .ascii "NAME>"
      009369                          5         NAMET:
      009369 CD 8D 52         [ 4] 3185         CALL     COUNT
      00936C CD 84 F0         [ 4] 3186         CALL     DOLIT
      00936F 00 1F                 3187         .word      31
      009371 CD 86 F7         [ 4] 3188         CALL     ANDD
      009374 CC 88 BD         [ 2] 3189         JP     PLUS
                                   3190 
                                   3191 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3192 ;       SAME?   ( a a u -- a a f \ -0+ )
                                   3193 ;       Compare u cells in two
                                   3194 ;       strings. Return 0 if identical.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



                                   3195 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0012F7                       3196         _HEADER SAMEQ,5,"SAME?"
      009377 93 63                    1         .word LINK 
                           0012F9     2         LINK=.
      009379 05                       3         .byte 5  
      00937A 53 41 4D 45 3F           4         .ascii "SAME?"
      00937F                          5         SAMEQ:
      00937F CD 8C 30         [ 4] 3197         CALL     ONEM
      009382 CD 86 63         [ 4] 3198         CALL     TOR
      009385 20 29            [ 2] 3199         JRA     SAME2
      009387 CD 86 C2         [ 4] 3200 SAME1:  CALL     OVER
      00938A CD 85 C6         [ 4] 3201         CALL     RAT
      00938D CD 88 BD         [ 4] 3202         CALL     PLUS
      009390 CD 85 82         [ 4] 3203         CALL     CAT
      009393 CD 86 C2         [ 4] 3204         CALL     OVER
      009396 CD 85 C6         [ 4] 3205         CALL     RAT
      009399 CD 88 BD         [ 4] 3206         CALL     PLUS
      00939C CD 85 82         [ 4] 3207         CALL     CAT
      00939F CD 89 53         [ 4] 3208         CALL     SUBB
      0093A2 CD 88 4D         [ 4] 3209         CALL     QDUP
      0093A5 CD 85 19         [ 4] 3210         CALL     QBRAN
      0093A8 93 B0                 3211         .word      SAME2
      0093AA CD 85 B5         [ 4] 3212         CALL     RFROM
      0093AD CC 86 90         [ 2] 3213         JP     DROP
      0093B0 CD 85 04         [ 4] 3214 SAME2:  CALL     DONXT
      0093B3 93 87                 3215         .word      SAME1
      0093B5 CC 8C 8F         [ 2] 3216         JP     ZERO
                                   3217 
                                   3218 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3219 ;       find    ( a va -- ca na | a F )
                                   3220 ;       Search vocabulary for string.
                                   3221 ;       Return ca and na if succeeded.
                                   3222 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001338                       3223         _HEADER FIND,4,"FIND"
      0093B8 93 79                    1         .word LINK 
                           00133A     2         LINK=.
      0093BA 04                       3         .byte 4  
      0093BB 46 49 4E 44              4         .ascii "FIND"
      0093BF                          5         FIND:
      0093BF CD 86 AA         [ 4] 3224         CALL     SWAPP
      0093C2 CD 86 9A         [ 4] 3225         CALL     DUPP
      0093C5 CD 85 82         [ 4] 3226         CALL     CAT
      0093C8 CD 87 6F         [ 4] 3227         CALL     TEMP
      0093CB CD 85 52         [ 4] 3228         CALL     STORE
      0093CE CD 86 9A         [ 4] 3229         CALL     DUPP
      0093D1 CD 85 64         [ 4] 3230         CALL     AT
      0093D4 CD 86 63         [ 4] 3231         CALL     TOR
      0093D7 CD 8B F8         [ 4] 3232         CALL     CELLP
      0093DA CD 86 AA         [ 4] 3233         CALL     SWAPP
      0093DD CD 85 64         [ 4] 3234 FIND1:  CALL     AT
      0093E0 CD 86 9A         [ 4] 3235         CALL     DUPP
      0093E3 CD 85 19         [ 4] 3236         CALL     QBRAN
      0093E6 94 1C                 3237         .word      FIND6
      0093E8 CD 86 9A         [ 4] 3238         CALL     DUPP
      0093EB CD 85 64         [ 4] 3239         CALL     AT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



      0093EE CD 84 F0         [ 4] 3240         CALL     DOLIT
      0093F1 1F 7F                 3241         .word      MASKK
      0093F3 CD 86 F7         [ 4] 3242         CALL     ANDD
      0093F6 CD 85 C6         [ 4] 3243         CALL     RAT
      0093F9 CD 87 20         [ 4] 3244         CALL     XORR
      0093FC CD 85 19         [ 4] 3245         CALL     QBRAN
      0093FF 94 0B                 3246         .word      FIND2
      009401 CD 8B F8         [ 4] 3247         CALL     CELLP
      009404 CD 84 F0         [ 4] 3248         CALL     DOLIT
      009407 FF FF                 3249         .word     0xFFFF
      009409 20 0C            [ 2] 3250         JRA     FIND3
      00940B CD 8B F8         [ 4] 3251 FIND2:  CALL     CELLP
      00940E CD 87 6F         [ 4] 3252         CALL     TEMP
      009411 CD 85 64         [ 4] 3253         CALL     AT
      009414 CD 93 7F         [ 4] 3254         CALL     SAMEQ
      009417 CD 85 35         [ 4] 3255 FIND3:  CALL     BRAN
      00941A 94 2B                 3256         .word      FIND4
      00941C CD 85 B5         [ 4] 3257 FIND6:  CALL     RFROM
      00941F CD 86 90         [ 4] 3258         CALL     DROP
      009422 CD 86 AA         [ 4] 3259         CALL     SWAPP
      009425 CD 8C 07         [ 4] 3260         CALL     CELLM
      009428 CC 86 AA         [ 2] 3261         JP     SWAPP
      00942B CD 85 19         [ 4] 3262 FIND4:  CALL     QBRAN
      00942E 94 38                 3263         .word      FIND5
      009430 CD 8C 07         [ 4] 3264         CALL     CELLM
      009433 CD 8C 07         [ 4] 3265         CALL     CELLM
      009436 20 A5            [ 2] 3266         JRA     FIND1
      009438 CD 85 B5         [ 4] 3267 FIND5:  CALL     RFROM
      00943B CD 86 90         [ 4] 3268         CALL     DROP
      00943E CD 86 AA         [ 4] 3269         CALL     SWAPP
      009441 CD 86 90         [ 4] 3270         CALL     DROP
      009444 CD 8C 07         [ 4] 3271         CALL     CELLM
      009447 CD 86 9A         [ 4] 3272         CALL     DUPP
      00944A CD 93 69         [ 4] 3273         CALL     NAMET
      00944D CC 86 AA         [ 2] 3274         JP     SWAPP
                                   3275 
                                   3276 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3277 ;       NAME?   ( a -- ca na | a F )
                                   3278 ;       Search vocabularies for a string.
                                   3279 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0013D0                       3280         _HEADER NAMEQ,5,"NAME?"
      009450 93 BA                    1         .word LINK 
                           0013D2     2         LINK=.
      009452 05                       3         .byte 5  
      009453 4E 41 4D 45 3F           4         .ascii "NAME?"
      009458                          5         NAMEQ:
      009458 CD 87 E3         [ 4] 3281         CALL   CNTXT
      00945B CC 93 BF         [ 2] 3282         JP     FIND
                                   3283 
                                   3284 ;; Terminal response
                                   3285 
                                   3286 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3287 ;       ^H      ( bot eot cur -- bot eot cur )
                                   3288 ;       Backup cursor by one character.
                                   3289 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



      0013DE                       3290         _HEADER BKSP,2,"^H"
      00945E 94 52                    1         .word LINK 
                           0013E0     2         LINK=.
      009460 02                       3         .byte 2  
      009461 5E 48                    4         .ascii "^H"
      009463                          5         BKSP:
      009463 CD 86 63         [ 4] 3291         CALL     TOR
      009466 CD 86 C2         [ 4] 3292         CALL     OVER
      009469 CD 85 B5         [ 4] 3293         CALL     RFROM
      00946C CD 86 AA         [ 4] 3294         CALL     SWAPP
      00946F CD 86 C2         [ 4] 3295         CALL     OVER
      009472 CD 87 20         [ 4] 3296         CALL     XORR
      009475 CD 85 19         [ 4] 3297         CALL     QBRAN
      009478 94 93                 3298         .word      BACK1
      00947A CD 84 F0         [ 4] 3299         CALL     DOLIT
      00947D 00 08                 3300         .word      BKSPP
      00947F CD 84 B7         [ 4] 3301         CALL     EMIT
      009482 CD 8C 30         [ 4] 3302         CALL     ONEM
      009485 CD 8C 82         [ 4] 3303         CALL     BLANK
      009488 CD 84 B7         [ 4] 3304         CALL     EMIT
      00948B CD 84 F0         [ 4] 3305         CALL     DOLIT
      00948E 00 08                 3306         .word      BKSPP
      009490 CC 84 B7         [ 2] 3307         JP     EMIT
      009493 81               [ 4] 3308 BACK1:  RET
                                   3309 
                                   3310 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3311 ;       TAP    ( bot eot cur c -- bot eot cur )
                                   3312 ;       Accept and echo key stroke
                                   3313 ;       and bump cursor.
                                   3314 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001414                       3315         _HEADER TAP,3,"TAP"
      009494 94 60                    1         .word LINK 
                           001416     2         LINK=.
      009496 03                       3         .byte 3  
      009497 54 41 50                 4         .ascii "TAP"
      00949A                          5         TAP:
      00949A CD 86 9A         [ 4] 3316         CALL     DUPP
      00949D CD 84 B7         [ 4] 3317         CALL     EMIT
      0094A0 CD 86 C2         [ 4] 3318         CALL     OVER
      0094A3 CD 85 71         [ 4] 3319         CALL     CSTOR
      0094A6 CC 8C 23         [ 2] 3320         JP     ONEP
                                   3321 
                                   3322 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3323 ;       kTAP    ( bot eot cur c -- bot eot cur )
                                   3324 ;       Process a key stroke,
                                   3325 ;       CR,LF or backspace.
                                   3326 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001429                       3327         _HEADER KTAP,4,"KTAP"
      0094A9 94 96                    1         .word LINK 
                           00142B     2         LINK=.
      0094AB 04                       3         .byte 4  
      0094AC 4B 54 41 50              4         .ascii "KTAP"
      0094B0                          5         KTAP:
      0094B0 CD 86 9A         [ 4] 3328         CALL     DUPP
      0094B3 CD 84 F0         [ 4] 3329         CALL     DOLIT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



                           000001  3330 .if EOL_CR
      0094B6 00 0D                 3331         .word   CRR
                           000000  3332 .else ; EOL_LF 
                                   3333         .word   LF
                                   3334 .endif 
      0094B8 CD 87 20         [ 4] 3335         CALL     XORR
      0094BB CD 85 19         [ 4] 3336         CALL     QBRAN
      0094BE 94 D6                 3337         .word      KTAP2
      0094C0 CD 84 F0         [ 4] 3338         CALL     DOLIT
      0094C3 00 08                 3339         .word      BKSPP
      0094C5 CD 87 20         [ 4] 3340         CALL     XORR
      0094C8 CD 85 19         [ 4] 3341         CALL     QBRAN
      0094CB 94 D3                 3342         .word      KTAP1
      0094CD CD 8C 82         [ 4] 3343         CALL     BLANK
      0094D0 CC 94 9A         [ 2] 3344         JP     TAP
      0094D3 CC 94 63         [ 2] 3345 KTAP1:  JP     BKSP
      0094D6 CD 86 90         [ 4] 3346 KTAP2:  CALL     DROP
      0094D9 CD 86 AA         [ 4] 3347         CALL     SWAPP
      0094DC CD 86 90         [ 4] 3348         CALL     DROP
      0094DF CC 86 9A         [ 2] 3349         JP     DUPP
                                   3350 
                                   3351 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3352 ;       accept  ( b u -- b u )
                                   3353 ;       Accept characters to input
                                   3354 ;       buffer. Return with actual count.
                                   3355 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001462                       3356         _HEADER ACCEP,6,"ACCEPT"
      0094E2 94 AB                    1         .word LINK 
                           001464     2         LINK=.
      0094E4 06                       3         .byte 6  
      0094E5 41 43 43 45 50 54        4         .ascii "ACCEPT"
      0094EB                          5         ACCEP:
      0094EB CD 86 C2         [ 4] 3357         CALL     OVER
      0094EE CD 88 BD         [ 4] 3358         CALL     PLUS
      0094F1 CD 86 C2         [ 4] 3359         CALL     OVER
      0094F4 CD 88 A8         [ 4] 3360 ACCP1:  CALL     DDUP
      0094F7 CD 87 20         [ 4] 3361         CALL     XORR
      0094FA CD 85 19         [ 4] 3362         CALL     QBRAN
      0094FD 95 1F                 3363         .word      ACCP4
      0094FF CD 90 81         [ 4] 3364         CALL     KEY
      009502 CD 86 9A         [ 4] 3365         CALL     DUPP
      009505 CD 8C 82         [ 4] 3366         CALL     BLANK
      009508 CD 84 F0         [ 4] 3367         CALL     DOLIT
      00950B 00 7F                 3368         .word      127
      00950D CD 8A 17         [ 4] 3369         CALL     WITHI
      009510 CD 85 19         [ 4] 3370         CALL     QBRAN
      009513 95 1A                 3371         .word      ACCP2
      009515 CD 94 9A         [ 4] 3372         CALL     TAP
      009518 20 03            [ 2] 3373         JRA     ACCP3
      00951A CD 94 B0         [ 4] 3374 ACCP2:  CALL     KTAP
      00951D 20 D5            [ 2] 3375 ACCP3:  JRA     ACCP1
      00951F CD 86 90         [ 4] 3376 ACCP4:  CALL     DROP
      009522 CD 86 C2         [ 4] 3377         CALL     OVER
      009525 CC 89 53         [ 2] 3378         JP     SUBB
                                   3379 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



                                   3380 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3381 ;       QUERY   ( -- )
                                   3382 ;       Accept input stream to
                                   3383 ;       terminal input buffer.
                                   3384 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0014A8                       3385         _HEADER QUERY,5,"QUERY"
      009528 94 E4                    1         .word LINK 
                           0014AA     2         LINK=.
      00952A 05                       3         .byte 5  
      00952B 51 55 45 52 59           4         .ascii "QUERY"
      009530                          5         QUERY:
      009530 CD 8D 8B         [ 4] 3386         CALL     TIB
      009533 CD 84 F0         [ 4] 3387         CALL     DOLIT
      009536 00 50                 3388         .word      80
      009538 CD 94 EB         [ 4] 3389         CALL     ACCEP
      00953B CD 87 8E         [ 4] 3390         CALL     NTIB
      00953E CD 85 52         [ 4] 3391         CALL     STORE
      009541 CD 86 90         [ 4] 3392         CALL     DROP
      009544 CD 8C 8F         [ 4] 3393         CALL     ZERO
      009547 CD 87 7E         [ 4] 3394         CALL     INN
      00954A CC 85 52         [ 2] 3395         JP     STORE
                                   3396 
                                   3397 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3398 ;       ABORT   ( -- )
                                   3399 ;       Reset data stack and
                                   3400 ;       jump to QUIT.
                                   3401 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0014CD                       3402         _HEADER ABORT,5,"ABORT"
      00954D 95 2A                    1         .word LINK 
                           0014CF     2         LINK=.
      00954F 05                       3         .byte 5  
      009550 41 42 4F 52 54           4         .ascii "ABORT"
      009555                          5         ABORT:
      009555 CD 96 49         [ 4] 3403         CALL     PRESE
      009558 CC 96 66         [ 2] 3404         JP     QUIT
                                   3405 
                                   3406 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3407 ;       abort"  ( f -- )
                                   3408 ;       Run time routine of ABORT".
                                   3409 ;       Abort with a message.
                                   3410 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0014DB                       3411         _HEADER ABORQ,COMPO+6,'ABORT"'
      00955B 95 4F                    1         .word LINK 
                           0014DD     2         LINK=.
      00955D 46                       3         .byte COMPO+6  
      00955E 41 42 4F 52 54 22        4         .ascii 'ABORT"'
      009564                          5         ABORQ:
      009564 CD 85 19         [ 4] 3412         CALL     QBRAN
      009567 95 83                 3413         .word      ABOR2   ;text flag
      009569 CD 91 0C         [ 4] 3414         CALL     DOSTR
      00956C CD 90 B9         [ 4] 3415 ABOR1:  CALL     SPACE
      00956F CD 8D 52         [ 4] 3416         CALL     COUNT
      009572 CD 90 E3         [ 4] 3417         CALL     TYPES
      009575 CD 84 F0         [ 4] 3418         CALL     DOLIT
      009578 00 3F                 3419         .word     63 ; "?"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



      00957A CD 84 B7         [ 4] 3420         CALL     EMIT
      00957D CD 90 FC         [ 4] 3421         CALL     CR
      009580 CC 95 55         [ 2] 3422         JP     ABORT   ;pass error string
      009583 CD 91 0C         [ 4] 3423 ABOR2:  CALL     DOSTR
      009586 CC 86 90         [ 2] 3424         JP     DROP
                                   3425 
                                   3426 ;; The text interpreter
                                   3427 
                                   3428 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3429 ;       $INTERPRET      ( a -- )
                                   3430 ;       Interpret a word. If failed,
                                   3431 ;       try to convert it to an integer.
                                   3432 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001509                       3433         _HEADER INTER,10,"$INTERPRET"
      009589 95 5D                    1         .word LINK 
                           00150B     2         LINK=.
      00958B 0A                       3         .byte 10  
      00958C 24 49 4E 54 45 52 50     4         .ascii "$INTERPRET"
             52 45 54
      009596                          5         INTER:
      009596 CD 94 58         [ 4] 3434         CALL     NAMEQ
      009599 CD 88 4D         [ 4] 3435         CALL     QDUP    ;?defined
      00959C CD 85 19         [ 4] 3436         CALL     QBRAN
      00959F 95 C0                 3437         .word      INTE1
      0095A1 CD 85 64         [ 4] 3438         CALL     AT
      0095A4 CD 84 F0         [ 4] 3439         CALL     DOLIT
      0095A7 40 00                 3440 	.word       0x4000	; COMPO*256
      0095A9 CD 86 F7         [ 4] 3441         CALL     ANDD    ;?compile only lexicon bits
      0095AC CD 95 64         [ 4] 3442         CALL     ABORQ
      0095AF 0D                    3443         .byte      13
      0095B0 20 63 6F 6D 70 69 6C  3444         .ascii     " compile only"
             65 20 6F 6E 6C 79
      0095BD CC 85 45         [ 2] 3445         JP      EXECU
      0095C0                       3446 INTE1:  
      0095C0 CD 8F E2         [ 4] 3447         CALL     NUMBQ   ;convert a number
      0095C3 CD 85 19         [ 4] 3448         CALL     QBRAN
      0095C6 95 6C                 3449         .word    ABOR1
      0095C8 81               [ 4] 3450         RET
                                   3451 
                                   3452 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3453 ;       [       ( -- )
                                   3454 ;       Start  text interpreter.
                                   3455 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001549                       3456         _HEADER LBRAC,IMEDD+1,"["
      0095C9 95 8B                    1         .word LINK 
                           00154B     2         LINK=.
      0095CB 81                       3         .byte IMEDD+1  
      0095CC 5B                       4         .ascii "["
      0095CD                          5         LBRAC:
      0095CD CD 84 F0         [ 4] 3457         CALL   DOLIT
      0095D0 95 96                 3458         .word  INTER
      0095D2 CD 87 C1         [ 4] 3459         CALL   TEVAL
      0095D5 CC 85 52         [ 2] 3460         JP     STORE
                                   3461 
                                   3462 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



                                   3463 ;       .OK     ( -- )
                                   3464 ;       Display 'ok' while interpreting.
                                   3465 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001558                       3466         _HEADER DOTOK,3,".OK"
      0095D8 95 CB                    1         .word LINK 
                           00155A     2         LINK=.
      0095DA 03                       3         .byte 3  
      0095DB 2E 4F 4B                 4         .ascii ".OK"
      0095DE                          5         DOTOK:
      0095DE CD 84 F0         [ 4] 3467         CALL     DOLIT
      0095E1 95 96                 3468         .word      INTER
      0095E3 CD 87 C1         [ 4] 3469         CALL     TEVAL
      0095E6 CD 85 64         [ 4] 3470         CALL     AT
      0095E9 CD 89 7B         [ 4] 3471         CALL     EQUAL
      0095EC CD 85 19         [ 4] 3472         CALL     QBRAN
      0095EF 95 F8                 3473         .word      DOTO1
      0095F1 CD 91 29         [ 4] 3474         CALL     DOTQP
      0095F4 03                    3475         .byte      3
      0095F5 20 6F 6B              3476         .ascii     " ok"
      0095F8 CC 90 FC         [ 2] 3477 DOTO1:  JP     CR
                                   3478 
                                   3479 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3480 ;       ?STACK  ( -- )
                                   3481 ;       Abort if stack underflows.
                                   3482 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00157B                       3483         _HEADER QSTAC,6,"?STACK"
      0095FB 95 DA                    1         .word LINK 
                           00157D     2         LINK=.
      0095FD 06                       3         .byte 6  
      0095FE 3F 53 54 41 43 4B        4         .ascii "?STACK"
      009604                          5         QSTAC:
      009604 CD 8C D1         [ 4] 3484         CALL     DEPTH
      009607 CD 86 D1         [ 4] 3485         CALL     ZLESS   ;check only for underflow
      00960A CD 95 64         [ 4] 3486         CALL     ABORQ
      00960D 0B                    3487         .byte      11
      00960E 20 75 6E 64 65 72 66  3488         .ascii     " underflow "
             6C 6F 77 20
      009619 81               [ 4] 3489         RET
                                   3490 
                                   3491 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3492 ;       EVAL    ( -- )
                                   3493 ;       Interpret  input stream.
                                   3494 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00159A                       3495         _HEADER EVAL,4,"EVAL"
      00961A 95 FD                    1         .word LINK 
                           00159C     2         LINK=.
      00961C 04                       3         .byte 4  
      00961D 45 56 41 4C              4         .ascii "EVAL"
      009621                          5         EVAL:
      009621 CD 93 5B         [ 4] 3496 EVAL1:  CALL     TOKEN
      009624 CD 86 9A         [ 4] 3497         CALL     DUPP
      009627 CD 85 82         [ 4] 3498         CALL     CAT     ;?input stream empty
      00962A CD 85 19         [ 4] 3499         CALL     QBRAN
      00962D 96 3A                 3500         .word    EVAL2
      00962F CD 87 C1         [ 4] 3501         CALL     TEVAL
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



      009632 CD 8D 9F         [ 4] 3502         CALL     ATEXE
      009635 CD 96 04         [ 4] 3503         CALL     QSTAC   ;evaluate input, check stack
      009638 20 E7            [ 2] 3504         JRA     EVAL1 
      00963A CD 86 90         [ 4] 3505 EVAL2:  CALL     DROP
      00963D CC 95 DE         [ 2] 3506         JP       DOTOK
                                   3507 
                                   3508 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3509 ;       PRESET  ( -- )
                                   3510 ;       Reset data stack pointer and
                                   3511 ;       terminal input buffer.
                                   3512 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0015C0                       3513         _HEADER PRESE,6,"PRESET"
      009640 96 1C                    1         .word LINK 
                           0015C2     2         LINK=.
      009642 06                       3         .byte 6  
      009643 50 52 45 53 45 54        4         .ascii "PRESET"
      009649                          5         PRESE:
      009649 CD 84 F0         [ 4] 3514         CALL     DOLIT
      00964C 16 80                 3515         .word      SPP
      00964E CD 86 87         [ 4] 3516         CALL     SPSTO
      009651 CD 84 F0         [ 4] 3517         CALL     DOLIT
      009654 17 00                 3518         .word      TIBB
      009656 CD 87 8E         [ 4] 3519         CALL     NTIB
      009659 CD 8B F8         [ 4] 3520         CALL     CELLP
      00965C CC 85 52         [ 2] 3521         JP     STORE
                                   3522 
                                   3523 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3524 ;       QUIT    ( -- )
                                   3525 ;       Reset return stack pointer
                                   3526 ;       and start text interpreter.
                                   3527 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0015DF                       3528         _HEADER QUIT,4,"QUIT"
      00965F 96 42                    1         .word LINK 
                           0015E1     2         LINK=.
      009661 04                       3         .byte 4  
      009662 51 55 49 54              4         .ascii "QUIT"
      009666                          5         QUIT:
      009666 CD 84 F0         [ 4] 3529         CALL     DOLIT
      009669 17 FF                 3530         .word      RPP
      00966B CD 85 9F         [ 4] 3531         CALL     RPSTO   ;reset return stack pointer
      00966E CD 95 CD         [ 4] 3532 QUIT1:  CALL     LBRAC   ;start interpretation
      009671 CD 95 30         [ 4] 3533 QUIT2:  CALL     QUERY   ;get input
      009674 CD 96 21         [ 4] 3534         CALL     EVAL
      009677 20 F8            [ 2] 3535         JRA     QUIT2   ;continue till error
                                   3536 
                                   3537 ;; The compiler
                                   3538 
                                   3539 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3540 ;       '       ( -- ca )
                                   3541 ;       Search vocabularies for
                                   3542 ;       next word in input stream.
                                   3543 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0015F9                       3544         _HEADER TICK,1,"'"
      009679 96 61                    1         .word LINK 
                           0015FB     2         LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



      00967B 01                       3         .byte 1  
      00967C 27                       4         .ascii "'"
      00967D                          5         TICK:
      00967D CD 93 5B         [ 4] 3545         CALL     TOKEN
      009680 CD 94 58         [ 4] 3546         CALL     NAMEQ   ;?defined
      009683 CD 85 19         [ 4] 3547         CALL     QBRAN
      009686 95 6C                 3548         .word      ABOR1
      009688 81               [ 4] 3549         RET     ;yes, push code address
                                   3550 
                                   3551 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3552 ;       ALLOT   ( n -- )
                                   3553 ;       Allocate n bytes to RAM 
                                   3554 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001609                       3555         _HEADER ALLOT,5,"ALLOT"
      009689 96 7B                    1         .word LINK 
                           00160B     2         LINK=.
      00968B 05                       3         .byte 5  
      00968C 41 4C 4C 4F 54           4         .ascii "ALLOT"
      009691                          5         ALLOT:
      009691 CD 87 F1         [ 4] 3556         CALL     VPP
                                   3557 ; must update APP_VP each time VP is modidied
      009694 CD 8C FF         [ 4] 3558         call PSTOR 
      009697 CC 9E B7         [ 2] 3559         jp UPDATVP 
                                   3560 
                                   3561 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3562 ;       ,       ( w -- )
                                   3563 ;         Compile an integer into
                                   3564 ;         variable space.
                                   3565 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00161A                       3566         _HEADER COMMA,1,^/"\,"/
      00969A 96 8B                    1         .word LINK 
                           00161C     2         LINK=.
      00969C 01                       3         .byte 1  
      00969D 5C 2C                    4         .ascii "\,"
      00969F                          5         COMMA:
      00969F CD 8D 69         [ 4] 3567         CALL     HERE
      0096A2 CD 86 9A         [ 4] 3568         CALL     DUPP
      0096A5 CD 8B F8         [ 4] 3569         CALL     CELLP   ;cell boundary
      0096A8 CD 87 F1         [ 4] 3570         CALL     VPP
      0096AB CD 85 52         [ 4] 3571         CALL     STORE
      0096AE CC 85 52         [ 2] 3572         JP     STORE
                                   3573 
                                   3574 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3575 ;       C,      ( c -- )
                                   3576 ;       Compile a byte into
                                   3577 ;       variables space.
                                   3578 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001631                       3579         _HEADER CCOMMA,2,^/"C,"/
      0096B1 96 9C                    1         .word LINK 
                           001633     2         LINK=.
      0096B3 02                       3         .byte 2  
      0096B4 43 2C                    4         .ascii "C,"
      0096B6                          5         CCOMMA:
      0096B6 CD 8D 69         [ 4] 3580         CALL     HERE
      0096B9 CD 86 9A         [ 4] 3581         CALL     DUPP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



      0096BC CD 8C 23         [ 4] 3582         CALL     ONEP
      0096BF CD 87 F1         [ 4] 3583         CALL     VPP
      0096C2 CD 85 52         [ 4] 3584         CALL     STORE
      0096C5 CC 85 71         [ 2] 3585         JP     CSTOR
                                   3586 
                                   3587 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3588 ;       [COMPILE]       ( -- ; <string> )
                                   3589 ;       Compile next immediate
                                   3590 ;       word into code dictionary.
                                   3591 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001648                       3592         _HEADER BCOMP,COMPO+IMEDD+9,"[COMPILE]"
      0096C8 96 B3                    1         .word LINK 
                           00164A     2         LINK=.
      0096CA C9                       3         .byte COMPO+IMEDD+9  
      0096CB 5B 43 4F 4D 50 49 4C     4         .ascii "[COMPILE]"
             45 5D
      0096D4                          5         BCOMP:
      0096D4 CD 96 7D         [ 4] 3593         CALL     TICK
      0096D7 CC 99 BB         [ 2] 3594         JP     JSRC
                                   3595 
                                   3596 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3597 ;       COMPILE ( -- )
                                   3598 ;       Compile next jsr in
                                   3599 ;       colon list to code dictionary.
                                   3600 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00165A                       3601         _HEADER COMPI,COMPO+7,"COMPILE"
      0096DA 96 CA                    1         .word LINK 
                           00165C     2         LINK=.
      0096DC 47                       3         .byte COMPO+7  
      0096DD 43 4F 4D 50 49 4C 45     4         .ascii "COMPILE"
      0096E4                          5         COMPI:
      0096E4 CD 85 B5         [ 4] 3602         CALL     RFROM
      0096E7 CD 86 9A         [ 4] 3603         CALL     DUPP
      0096EA CD 85 64         [ 4] 3604         CALL     AT
      0096ED CD 99 BB         [ 4] 3605         CALL     JSRC    ;compile subroutine
      0096F0 CD 8B F8         [ 4] 3606         CALL     CELLP
      0096F3 90 93            [ 1] 3607         ldw y,x 
      0096F5 90 FE            [ 2] 3608         ldw y,(y)
      0096F7 1C 00 02         [ 2] 3609         addw x,#CELLL 
      0096FA 90 FC            [ 2] 3610         jp (y)
                                   3611 
                                   3612 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3613 ;       LITERAL ( w -- )
                                   3614 ;       Compile tos to dictionary
                                   3615 ;       as an integer literal.
                                   3616 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00167C                       3617         _HEADER LITER,COMPO+IMEDD+7,"LITERAL"
      0096FC 96 DC                    1         .word LINK 
                           00167E     2         LINK=.
      0096FE C7                       3         .byte COMPO+IMEDD+7  
      0096FF 4C 49 54 45 52 41 4C     4         .ascii "LITERAL"
      009706                          5         LITER:
      009706 CD 96 E4         [ 4] 3618         CALL     COMPI
      009709 84 F0                 3619         .word DOLIT 
      00970B CC 96 9F         [ 2] 3620         JP     COMMA
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



                                   3621 
                                   3622 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3623 ;       $,"     ( -- )
                                   3624 ;       Compile a literal string
                                   3625 ;       up to next " .
                                   3626 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3627 ;        _HEADER STRCQ,3,^/'$,"'/
      00970E                       3628 STRCQ:
      00970E CD 84 F0         [ 4] 3629         CALL     DOLIT
      009711 00 22                 3630         .word     34	; "
      009713 CD 92 9A         [ 4] 3631         CALL     PARSE
      009716 CD 8D 69         [ 4] 3632         CALL     HERE
      009719 CD 8E 3A         [ 4] 3633         CALL     PACKS   ;string to code dictionary
      00971C CD 8D 52         [ 4] 3634         CALL     COUNT
      00971F CD 88 BD         [ 4] 3635         CALL     PLUS    ;calculate aligned end of string
      009722 CD 87 F1         [ 4] 3636         CALL     VPP
      009725 CC 85 52         [ 2] 3637         JP     STORE
                                   3638 
                                   3639 ;; Structures
                                   3640 
                                   3641 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3642 ;       FOR     ( -- a )
                                   3643 ;       Start a FOR-NEXT loop
                                   3644 ;       structure in a colon definition.
                                   3645 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0016A8                       3646         _HEADER FOR,COMPO+IMEDD+3,"FOR"
      009728 96 FE                    1         .word LINK 
                           0016AA     2         LINK=.
      00972A C3                       3         .byte COMPO+IMEDD+3  
      00972B 46 4F 52                 4         .ascii "FOR"
      00972E                          5         FOR:
      00972E CD 96 E4         [ 4] 3647         CALL     COMPI
      009731 86 63                 3648         .word TOR 
      009733 CC 8D 69         [ 2] 3649         JP     HERE
                                   3650 
                                   3651 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3652 ;       NEXT    ( a -- )
                                   3653 ;       Terminate a FOR-NEXT loop.
                                   3654 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0016B6                       3655         _HEADER NEXT,COMPO+IMEDD+4,"NEXT"
      009736 97 2A                    1         .word LINK 
                           0016B8     2         LINK=.
      009738 C4                       3         .byte COMPO+IMEDD+4  
      009739 4E 45 58 54              4         .ascii "NEXT"
      00973D                          5         NEXT:
      00973D CD 96 E4         [ 4] 3656         CALL     COMPI
      009740 85 04                 3657         .word DONXT 
      009742 CD 88 3D         [ 4] 3658         call ADRADJ
      009745 CC 96 9F         [ 2] 3659         JP     COMMA
                                   3660 
                                   3661 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3662 ;       I ( -- n )
                                   3663 ;       stack COUNTER
                                   3664 ;       of innermost FOR-NEXT  
                                   3665 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



      0016C8                       3666         _HEADER IFETCH,1,"I"
      009748 97 38                    1         .word LINK 
                           0016CA     2         LINK=.
      00974A 01                       3         .byte 1  
      00974B 49                       4         .ascii "I"
      00974C                          5         IFETCH:
      00974C 1D 00 02         [ 2] 3667         subw x,#CELLL 
      00974F 16 03            [ 2] 3668         ldw y,(3,sp)
      009751 FF               [ 2] 3669         ldw (x),y 
      009752 81               [ 4] 3670         ret 
                                   3671 
                                   3672 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3673 ;       J ( -- n )
                                   3674 ;   stack COUNTER
                                   3675 ;   of outer FOR-NEXT  
                                   3676 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0016D3                       3677         _HEADER JFETCH,1,"J"
      009753 97 4A                    1         .word LINK 
                           0016D5     2         LINK=.
      009755 01                       3         .byte 1  
      009756 4A                       4         .ascii "J"
      009757                          5         JFETCH:
      009757 1D 00 02         [ 2] 3678         SUBW X,#CELLL 
      00975A 16 05            [ 2] 3679         LDW Y,(5,SP)
      00975C FF               [ 2] 3680         LDW (X),Y 
      00975D 81               [ 4] 3681         RET 
                                   3682 
                                   3683 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3684 ;       BEGIN   ( -- a )
                                   3685 ;       Start an infinite or
                                   3686 ;       indefinite loop structure.
                                   3687 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0016DE                       3688         _HEADER BEGIN,COMPO+IMEDD+5,"BEGIN"
      00975E 97 55                    1         .word LINK 
                           0016E0     2         LINK=.
      009760 C5                       3         .byte COMPO+IMEDD+5  
      009761 42 45 47 49 4E           4         .ascii "BEGIN"
      009766                          5         BEGIN:
      009766 CC 8D 69         [ 2] 3689         JP     HERE
                                   3690 
                                   3691 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3692 ;       UNTIL   ( a -- )
                                   3693 ;       Terminate a BEGIN-UNTIL
                                   3694 ;       indefinite loop structure.
                                   3695 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0016E9                       3696         _HEADER UNTIL,COMPO+IMEDD+5,"UNTIL"
      009769 97 60                    1         .word LINK 
                           0016EB     2         LINK=.
      00976B C5                       3         .byte COMPO+IMEDD+5  
      00976C 55 4E 54 49 4C           4         .ascii "UNTIL"
      009771                          5         UNTIL:
      009771 CD 96 E4         [ 4] 3697         CALL     COMPI
      009774 85 19                 3698         .word    QBRAN 
      009776 CD 88 3D         [ 4] 3699         call ADRADJ
      009779 CC 96 9F         [ 2] 3700         JP     COMMA
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



                                   3701 
                                   3702 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3703 ;       AGAIN   ( a -- )
                                   3704 ;       Terminate a BEGIN-AGAIN
                                   3705 ;       infinite loop structure.
                                   3706 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0016FC                       3707         _HEADER AGAIN,COMPO+IMEDD+5,"AGAIN"
      00977C 97 6B                    1         .word LINK 
                           0016FE     2         LINK=.
      00977E C5                       3         .byte COMPO+IMEDD+5  
      00977F 41 47 41 49 4E           4         .ascii "AGAIN"
      009784                          5         AGAIN:
                           000001  3708 .if OPTIMIZE 
      001704                       3709         _DOLIT JPIMM 
      009784 CD 84 F0         [ 4]    1     CALL DOLIT 
      009787 00 CC                    2     .word JPIMM 
      009789 CD 96 B6         [ 4] 3710         CALL  CCOMMA
                           000000  3711 .else 
                                   3712         CALL     COMPI
                                   3713         .word BRAN
                                   3714 .endif 
      00978C CD 88 3D         [ 4] 3715         call ADRADJ 
      00978F CC 96 9F         [ 2] 3716         JP     COMMA
                                   3717 
                                   3718 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3719 ;       IF      ( -- A )
                                   3720 ;       Begin a conditional branch.
                                   3721 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001712                       3722         _HEADER IFF,COMPO+IMEDD+2,"IF"
      009792 97 7E                    1         .word LINK 
                           001714     2         LINK=.
      009794 C2                       3         .byte COMPO+IMEDD+2  
      009795 49 46                    4         .ascii "IF"
      009797                          5         IFF:
      009797 CD 96 E4         [ 4] 3723         CALL     COMPI
      00979A 85 19                 3724         .word QBRAN
      00979C CD 8D 69         [ 4] 3725         CALL     HERE
      00979F CD 8C 8F         [ 4] 3726         CALL     ZERO
      0097A2 CC 96 9F         [ 2] 3727         JP     COMMA
                                   3728 
                                   3729 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3730 ;       THEN        ( A -- )
                                   3731 ;       Terminate a conditional 
                                   3732 ;       branch structure.
                                   3733 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001725                       3734         _HEADER THENN,COMPO+IMEDD+4,"THEN"
      0097A5 97 94                    1         .word LINK 
                           001727     2         LINK=.
      0097A7 C4                       3         .byte COMPO+IMEDD+4  
      0097A8 54 48 45 4E              4         .ascii "THEN"
      0097AC                          5         THENN:
      0097AC CD 8D 69         [ 4] 3735         CALL     HERE
      0097AF CD 88 3D         [ 4] 3736         call ADRADJ 
      0097B2 CD 86 AA         [ 4] 3737         CALL     SWAPP
      0097B5 CC 85 52         [ 2] 3738         JP     STORE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



                                   3739 
                                   3740 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3741 ;       ELSE        ( A -- A )
                                   3742 ;       Start the false clause in 
                                   3743 ;       an IF-ELSE-THEN structure.
                                   3744 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001738                       3745         _HEADER ELSEE,COMPO+IMEDD+4,"ELSE"
      0097B8 97 A7                    1         .word LINK 
                           00173A     2         LINK=.
      0097BA C4                       3         .byte COMPO+IMEDD+4  
      0097BB 45 4C 53 45              4         .ascii "ELSE"
      0097BF                          5         ELSEE:
                           000001  3746 .if OPTIMIZE 
      00173F                       3747         _DOLIT JPIMM 
      0097BF CD 84 F0         [ 4]    1     CALL DOLIT 
      0097C2 00 CC                    2     .word JPIMM 
      0097C4 CD 96 B6         [ 4] 3748         CALL CCOMMA 
                           000000  3749 .else 
                                   3750          CALL     COMPI
                                   3751         .word BRAN
                                   3752 .endif 
      0097C7 CD 8D 69         [ 4] 3753         CALL     HERE
      0097CA CD 8C 8F         [ 4] 3754         CALL     ZERO
      0097CD CD 96 9F         [ 4] 3755         CALL     COMMA
      0097D0 CD 86 AA         [ 4] 3756         CALL     SWAPP
      0097D3 CD 8D 69         [ 4] 3757         CALL     HERE
      0097D6 CD 88 3D         [ 4] 3758         call ADRADJ 
      0097D9 CD 86 AA         [ 4] 3759         CALL     SWAPP
      0097DC CC 85 52         [ 2] 3760         JP     STORE
                                   3761 
                                   3762 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3763 ;       AHEAD       ( -- A )
                                   3764 ;       Compile a forward branch
                                   3765 ;       instruction.
                                   3766 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00175F                       3767         _HEADER AHEAD,COMPO+IMEDD+5,"AHEAD"
      0097DF 97 BA                    1         .word LINK 
                           001761     2         LINK=.
      0097E1 C5                       3         .byte COMPO+IMEDD+5  
      0097E2 41 48 45 41 44           4         .ascii "AHEAD"
      0097E7                          5         AHEAD:
                           000001  3768 .if OPTIMIZE 
      001767                       3769         _DOLIT JPIMM 
      0097E7 CD 84 F0         [ 4]    1     CALL DOLIT 
      0097EA 00 CC                    2     .word JPIMM 
      0097EC CD 96 B6         [ 4] 3770         CALL CCOMMA
                           000000  3771 .else 
                                   3772         CALL     COMPI
                                   3773         .word BRAN
                                   3774 .endif 
      0097EF CD 8D 69         [ 4] 3775         CALL     HERE
      0097F2 CD 8C 8F         [ 4] 3776         CALL     ZERO
      0097F5 CC 96 9F         [ 2] 3777         JP     COMMA
                                   3778 
                                   3779 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



                                   3780 ;       WHILE       ( a -- A a )
                                   3781 ;       Conditional branch out of a 
                                   3782 ;       BEGIN-WHILE-REPEAT loop.
                                   3783 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001778                       3784         _HEADER WHILE,COMPO+IMEDD+5,"WHILE"
      0097F8 97 E1                    1         .word LINK 
                           00177A     2         LINK=.
      0097FA C5                       3         .byte COMPO+IMEDD+5  
      0097FB 57 48 49 4C 45           4         .ascii "WHILE"
      009800                          5         WHILE:
      009800 CD 96 E4         [ 4] 3785         CALL     COMPI
      009803 85 19                 3786         .word QBRAN
      009805 CD 8D 69         [ 4] 3787         CALL     HERE
      009808 CD 8C 8F         [ 4] 3788         CALL     ZERO
      00980B CD 96 9F         [ 4] 3789         CALL     COMMA
      00980E CC 86 AA         [ 2] 3790         JP     SWAPP
                                   3791 
                                   3792 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3793 ;       REPEAT      ( A a -- )
                                   3794 ;       Terminate a BEGIN-WHILE-REPEAT 
                                   3795 ;       indefinite loop.
                                   3796 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001791                       3797         _HEADER REPEA,COMPO+IMEDD+6,"REPEAT"
      009811 97 FA                    1         .word LINK 
                           001793     2         LINK=.
      009813 C6                       3         .byte COMPO+IMEDD+6  
      009814 52 45 50 45 41 54        4         .ascii "REPEAT"
      00981A                          5         REPEA:
                           000001  3798 .if OPTIMIZE 
      00179A                       3799         _DOLIT JPIMM 
      00981A CD 84 F0         [ 4]    1     CALL DOLIT 
      00981D 00 CC                    2     .word JPIMM 
      00981F CD 96 B6         [ 4] 3800         CALL  CCOMMA
                           000000  3801 .else 
                                   3802         CALL     COMPI
                                   3803         .word BRAN
                                   3804 .endif 
      009822 CD 88 3D         [ 4] 3805         call ADRADJ 
      009825 CD 96 9F         [ 4] 3806         CALL     COMMA
      009828 CD 8D 69         [ 4] 3807         CALL     HERE
      00982B CD 88 3D         [ 4] 3808         call ADRADJ 
      00982E CD 86 AA         [ 4] 3809         CALL     SWAPP
      009831 CC 85 52         [ 2] 3810         JP     STORE
                                   3811 
                                   3812 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3813 ;       AFT         ( a -- a A )
                                   3814 ;       Jump to THEN in a FOR-AFT-THEN-NEXT 
                                   3815 ;       loop the first time through.
                                   3816 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0017B4                       3817         _HEADER AFT,COMPO+IMEDD+3,"AFT"
      009834 98 13                    1         .word LINK 
                           0017B6     2         LINK=.
      009836 C3                       3         .byte COMPO+IMEDD+3  
      009837 41 46 54                 4         .ascii "AFT"
      00983A                          5         AFT:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



      00983A CD 86 90         [ 4] 3818         CALL     DROP
      00983D CD 97 E7         [ 4] 3819         CALL     AHEAD
      009840 CD 8D 69         [ 4] 3820         CALL     HERE
      009843 CC 86 AA         [ 2] 3821         JP     SWAPP
                                   3822 
                                   3823 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3824 ;       ABORT"      ( -- ; <string> )
                                   3825 ;       Conditional abort with an error message.
                                   3826 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0017C6                       3827         _HEADER ABRTQ,IMEDD+6,'ABORT"'
      009846 98 36                    1         .word LINK 
                           0017C8     2         LINK=.
      009848 86                       3         .byte IMEDD+6  
      009849 41 42 4F 52 54 22        4         .ascii 'ABORT"'
      00984F                          5         ABRTQ:
      00984F CD 96 E4         [ 4] 3828         CALL     COMPI
      009852 95 64                 3829         .word ABORQ
      009854 CC 97 0E         [ 2] 3830         JP     STRCQ
                                   3831 
                                   3832 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3833 ;       $"     ( -- ; <string> )
                                   3834 ;       Compile an inline string literal.
                                   3835 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0017D7                       3836         _HEADER STRQ,IMEDD+2,'$"'
      009857 98 48                    1         .word LINK 
                           0017D9     2         LINK=.
      009859 82                       3         .byte IMEDD+2  
      00985A 24 22                    4         .ascii '$"'
      00985C                          5         STRQ:
      00985C CD 96 E4         [ 4] 3837         CALL     COMPI
      00985F 91 25                 3838         .word STRQP 
      009861 CC 97 0E         [ 2] 3839         JP     STRCQ
                                   3840 
                                   3841 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3842 ;       ."          ( -- ; <string> )
                                   3843 ;       Compile an inline string literal 
                                   3844 ;       to be typed out at run time.
                                   3845 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0017E4                       3846         _HEADER DOTQ,IMEDD+2,'."'
      009864 98 59                    1         .word LINK 
                           0017E6     2         LINK=.
      009866 82                       3         .byte IMEDD+2  
      009867 2E 22                    4         .ascii '."'
      009869                          5         DOTQ:
      009869 CD 96 E4         [ 4] 3847         CALL     COMPI
      00986C 91 29                 3848         .word DOTQP 
      00986E CC 97 0E         [ 2] 3849         JP     STRCQ
                                   3850 
                                   3851 ;; Name compiler
                                   3852 
                                   3853 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3854 ;       ?UNIQUE ( a -- a )
                                   3855 ;       Display a warning message
                                   3856 ;       if word already exists.
                                   3857 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



      0017F1                       3858         _HEADER UNIQU,7,"?UNIQUE"
      009871 98 66                    1         .word LINK 
                           0017F3     2         LINK=.
      009873 07                       3         .byte 7  
      009874 3F 55 4E 49 51 55 45     4         .ascii "?UNIQUE"
      00987B                          5         UNIQU:
      00987B CD 86 9A         [ 4] 3859         CALL     DUPP
      00987E CD 94 58         [ 4] 3860         CALL     NAMEQ   ;?name exists
      009881 CD 85 19         [ 4] 3861         CALL     QBRAN
      009884 98 9A                 3862         .word      UNIQ1
      009886 CD 91 29         [ 4] 3863         CALL     DOTQP   ;redef are OK
      009889 07                    3864         .byte       7
      00988A 20 72 65 44 65 66 20  3865         .ascii     " reDef "       
      009891 CD 86 C2         [ 4] 3866         CALL     OVER
      009894 CD 8D 52         [ 4] 3867         CALL     COUNT
      009897 CD 90 E3         [ 4] 3868         CALL     TYPES   ;just in case
      00989A CC 86 90         [ 2] 3869 UNIQ1:  JP     DROP
                                   3870 
                                   3871 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3872 ;       $,n     ( na -- )
                                   3873 ;       Build a new dictionary name
                                   3874 ;       using string at na.
                                   3875 ; compile dans l'espace des variables 
                                   3876 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3877 ;        _HEADER SNAME,3,^/"$,n"/
      00989D                       3878 SNAME: 
      00989D CD 86 9A         [ 4] 3879         CALL     DUPP
      0098A0 CD 85 82         [ 4] 3880         CALL     CAT     ;?null input
      0098A3 CD 85 19         [ 4] 3881         CALL     QBRAN
      0098A6 98 D3                 3882         .word      PNAM1
      0098A8 CD 98 7B         [ 4] 3883         CALL     UNIQU   ;?redefinition
      0098AB CD 86 9A         [ 4] 3884         CALL     DUPP
      0098AE CD 8D 52         [ 4] 3885         CALL     COUNT
      0098B1 CD 88 BD         [ 4] 3886         CALL     PLUS
      0098B4 CD 87 F1         [ 4] 3887         CALL     VPP
      0098B7 CD 85 52         [ 4] 3888         CALL     STORE
      0098BA CD 86 9A         [ 4] 3889         CALL     DUPP
      0098BD CD 88 0F         [ 4] 3890         CALL     LAST
      0098C0 CD 85 52         [ 4] 3891         CALL     STORE   ;save na for vocabulary link
      0098C3 CD 8C 07         [ 4] 3892         CALL     CELLM   ;link address
      0098C6 CD 87 E3         [ 4] 3893         CALL     CNTXT
      0098C9 CD 85 64         [ 4] 3894         CALL     AT
      0098CC CD 86 AA         [ 4] 3895         CALL     SWAPP
      0098CF CD 85 52         [ 4] 3896         CALL     STORE
      0098D2 81               [ 4] 3897         RET     ;save code pointer
      0098D3 CD 91 25         [ 4] 3898 PNAM1:  CALL     STRQP
      0098D6 05                    3899         .byte      5
      0098D7 20 6E 61 6D 65        3900         .ascii     " name" ;null input
      0098DC CC 95 6C         [ 2] 3901         JP     ABOR1
                                   3902 
                                   3903 ;; FORTH compiler
                                   3904 
                                   3905 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3906 ;       $COMPILE        ( a -- )
                                   3907 ;       Compile next word to
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



                                   3908 ;       dictionary as a token or literal.
                                   3909 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00185F                       3910         _HEADER SCOMP,8,"$COMPILE"
      0098DF 98 73                    1         .word LINK 
                           001861     2         LINK=.
      0098E1 08                       3         .byte 8  
      0098E2 24 43 4F 4D 50 49 4C     4         .ascii "$COMPILE"
             45
      0098EA                          5         SCOMP:
      0098EA CD 94 58         [ 4] 3911         CALL     NAMEQ
      0098ED CD 88 4D         [ 4] 3912         CALL     QDUP    ;?defined
      0098F0 CD 85 19         [ 4] 3913         CALL     QBRAN
      0098F3 99 0B                 3914         .word      SCOM2
      0098F5 CD 85 64         [ 4] 3915         CALL     AT
      0098F8 CD 84 F0         [ 4] 3916         CALL     DOLIT
      0098FB 80 00                 3917         .word     0x8000	;  IMEDD*256
      0098FD CD 86 F7         [ 4] 3918         CALL     ANDD    ;?immediate
      009900 CD 85 19         [ 4] 3919         CALL     QBRAN
      009903 99 08                 3920         .word      SCOM1
      009905 CC 85 45         [ 2] 3921         JP     EXECU
      009908 CC 99 BB         [ 2] 3922 SCOM1:  JP     JSRC
      00990B CD 8F E2         [ 4] 3923 SCOM2:  CALL     NUMBQ   ;try to convert to number 
      00990E CD 88 4D         [ 4] 3924         CALL    QDUP  
      009911 CD 85 19         [ 4] 3925         CALL     QBRAN
      009914 95 6C                 3926         .word      ABOR1
                           000000  3927 .if WANT_DOUBLE 
                                   3928         _DOLIT  -1
                                   3929         CALL    EQUAL
                                   3930         _QBRAN DLITER
                                   3931         JP  LITER 
                                   3932 .endif 
                           000001  3933 .if WANT_FLOAT24 
      001896                       3934         _DOLIT -1 
      009916 CD 84 F0         [ 4]    1     CALL DOLIT 
      009919 FF FF                    2     .word -1 
      00991B CD 89 7B         [ 4] 3935         CALL EQUAL 
      00189E                       3936         _QBRAN FLITER
      00991E CD 85 19         [ 4]    1     CALL QBRAN
      009921 AA 64                    2     .word FLITER
      009923 CC 97 06         [ 2] 3937         JP  LITER  
                                   3938 .endif 
      0018A6                       3939         _DROP 
      009926 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      009929 CC 97 06         [ 2] 3940         JP     LITER
                                   3941 
                                   3942 
                                   3943 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3944 ;       OVERT   ( -- )
                                   3945 ;       Link a new word into vocabulary.
                                   3946 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0018AC                       3947         _HEADER OVERT,5,"OVERT"
      00992C 98 E1                    1         .word LINK 
                           0018AE     2         LINK=.
      00992E 05                       3         .byte 5  
      00992F 4F 56 45 52 54           4         .ascii "OVERT"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



      009934                          5         OVERT:
      009934 CD 88 0F         [ 4] 3948         CALL     LAST
      009937 CD 85 64         [ 4] 3949         CALL     AT
      00993A CD 87 E3         [ 4] 3950         CALL     CNTXT
      00993D CC 85 52         [ 2] 3951         JP     STORE
                                   3952 
                                   3953 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3954 ;       ;       ( -- )
                                   3955 ;       Terminate a colon definition.
                                   3956 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0018C0                       3957         _HEADER SEMIS,IMEDD+COMPO+1,^/";"/
      009940 99 2E                    1         .word LINK 
                           0018C2     2         LINK=.
      009942 C1                       3         .byte IMEDD+COMPO+1  
      009943 3B                       4         .ascii ";"
      009944                          5         SEMIS:
                           000001  3958 .if OPTIMIZE ; more compact and faster
      009944 CD 84 F0         [ 4] 3959         call DOLIT 
      009947 00 81                 3960         .word 0x81   ; opcode for RET 
      009949 CD 96 B6         [ 4] 3961         call CCOMMA 
                           000000  3962 .else
                                   3963         CALL     COMPI
                                   3964         .word EXIT 
                                   3965 .endif 
      00994C CD 95 CD         [ 4] 3966         CALL     LBRAC
      00994F CD 99 34         [ 4] 3967         call OVERT 
      009952 CD A4 0F         [ 4] 3968         CALL FMOVE
      009955 CD 88 4D         [ 4] 3969         call QDUP 
      009958 CD 85 19         [ 4] 3970         call QBRAN 
      00995B 9A E8                 3971         .word SET_RAMLAST 
      00995D CD A4 A3         [ 4] 3972         CALL UPDATPTR
      009960 81               [ 4] 3973         RET 
                                   3974 
                                   3975 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3976 ;       Terminate an ISR definition 
                                   3977 ;       retourn ca of ISR as double
                                   3978 ;       I; ( -- ud )
                                   3979 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0018E1                       3980        _HEADER ISEMI,2+IMEDD+COMPO,^/"I;"/
      009961 99 42                    1         .word LINK 
                           0018E3     2         LINK=.
      009963 C2                       3         .byte 2+IMEDD+COMPO  
      009964 49 3B                    4         .ascii "I;"
      009966                          5         ISEMI:
      009966 1D 00 02         [ 2] 3981         subw x,#CELLL  
      009969 90 AE 00 80      [ 2] 3982         ldw y,#IRET_CODE 
      00996D FF               [ 2] 3983         ldw (x),y 
      00996E CD 96 B6         [ 4] 3984         call CCOMMA
      009971 CD 95 CD         [ 4] 3985         call LBRAC 
      009974 CD A4 E8         [ 4] 3986         call IFMOVE
      009977 CD 88 4D         [ 4] 3987         call QDUP 
      00997A CD 85 19         [ 4] 3988         CALL QBRAN 
      00997D 9A E8                 3989         .word SET_RAMLAST
      00997F CD 87 FF         [ 4] 3990         CALL CPP
      009982 CD 85 64         [ 4] 3991         call AT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



      009985 CD 86 AA         [ 4] 3992         call SWAPP 
      009988 CD 87 FF         [ 4] 3993         CALL CPP 
      00998B CD 85 52         [ 4] 3994         call STORE 
      00998E CD 9E A0         [ 4] 3995         call UPDATCP 
      009991 CD 9E 5D         [ 4] 3996         call EEPVP 
      001914                       3997         _DROP 
      009994 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      009997 CD 85 64         [ 4] 3998         call AT 
      00999A CD 87 F1         [ 4] 3999         call VPP 
      00999D CD 85 52         [ 4] 4000         call STORE 
      0099A0 CC 8C 8F         [ 2] 4001         jp ZERO
      0099A3 81               [ 4] 4002         ret           
                                   4003         
                                   4004 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4005 ;       ]       ( -- )
                                   4006 ;       Start compiling words in
                                   4007 ;       input stream.
                                   4008 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001924                       4009         _HEADER RBRAC,1,"]"
      0099A4 99 63                    1         .word LINK 
                           001926     2         LINK=.
      0099A6 01                       3         .byte 1  
      0099A7 5D                       4         .ascii "]"
      0099A8                          5         RBRAC:
      0099A8 CD 84 F0         [ 4] 4010         CALL   DOLIT
      0099AB 98 EA                 4011         .word  SCOMP
      0099AD CD 87 C1         [ 4] 4012         CALL   TEVAL
      0099B0 CC 85 52         [ 2] 4013         JP     STORE
                                   4014 
                                   4015 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4016 ;       CALL,    ( ca -- )
                                   4017 ;       Compile a subroutine call.
                                   4018 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001933                       4019         _HEADER JSRC,5,^/"CALL,"/
      0099B3 99 A6                    1         .word LINK 
                           001935     2         LINK=.
      0099B5 05                       3         .byte 5  
      0099B6 43 41 4C 4C 2C           4         .ascii "CALL,"
      0099BB                          5         JSRC:
                           000001  4020 .if OPTIMIZE 
                                   4021 ;;;;; optimization code ;;;;;;;;;;;;;;;
      0099BB 90 AE 86 90      [ 2] 4022         LDW Y,#DROP 
      0099BF 90 BF 26         [ 2] 4023         LDW YTEMP,Y 
      0099C2 90 93            [ 1] 4024         LDW Y,X 
      0099C4 90 FE            [ 2] 4025         LDW Y,(Y)
      0099C6 90 B3 26         [ 2] 4026         CPW Y,YTEMP 
      0099C9 26 13            [ 1] 4027         JRNE JSRC1         
                                   4028 ; replace CALL DROP BY  ADDW X,#CELLL 
      0099CB 1C 00 02         [ 2] 4029         ADDW X,#CELLL 
      00194E                       4030         _DOLIT ADDWX ; opcode 
      0099CE CD 84 F0         [ 4]    1     CALL DOLIT 
      0099D1 00 1C                    2     .word ADDWX 
      0099D3 CD 96 B6         [ 4] 4031         CALL   CCOMMA 
      001956                       4032         _DOLIT CELLL 
      0099D6 CD 84 F0         [ 4]    1     CALL DOLIT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



      0099D9 00 02                    2     .word CELLL 
      0099DB CC 96 9F         [ 2] 4033         JP      COMMA 
      0099DE                       4034 JSRC1: ; check for DDROP 
      0099DE 90 AE 88 9D      [ 2] 4035         LDW Y,#DDROP 
      0099E2 90 BF 26         [ 2] 4036         LDW YTEMP,Y 
      0099E5 90 93            [ 1] 4037         LDW Y,X 
      0099E7 90 FE            [ 2] 4038         LDW Y,(Y)
      0099E9 90 B3 26         [ 2] 4039         CPW Y,YTEMP 
      0099EC 26 13            [ 1] 4040         JRNE JSRC2 
                                   4041 ; replace CALL DDROP BY ADDW X,#2*CELLL 
      0099EE 1C 00 02         [ 2] 4042         ADDW X,#CELLL 
      001971                       4043         _DOLIT ADDWX 
      0099F1 CD 84 F0         [ 4]    1     CALL DOLIT 
      0099F4 00 1C                    2     .word ADDWX 
      0099F6 CD 96 B6         [ 4] 4044         CALL  CCOMMA 
      001979                       4045         _DOLIT 2*CELLL 
      0099F9 CD 84 F0         [ 4]    1     CALL DOLIT 
      0099FC 00 04                    2     .word 2*CELLL 
      0099FE CC 96 9F         [ 2] 4046         JP  COMMA 
      009A01                       4047 JSRC2: 
                                   4048 ;;;;;;;; end optimization code ;;;;;;;;;;        
                                   4049 .endif        
      009A01 CD 84 F0         [ 4] 4050         CALL     DOLIT
      009A04 00 CD                 4051         .word     CALLL     ;CALL
      009A06 CD 96 B6         [ 4] 4052         CALL     CCOMMA
      009A09 CC 96 9F         [ 2] 4053         JP     COMMA
                                   4054 
                                   4055 ;       INIT-OFS ( -- )
                                   4056 ;       compute offset to adjust jump address 
                                   4057 ;       set variable OFFSET 
      009A0C 99 B5                 4058         .word LINK 
                           00198E  4059         LINK=.
      009A0E 08                    4060         .byte 8 
      009A0F 49 4E 49 54 2D 4F 46  4061         .ascii "INIT-OFS" 
             53
      009A17                       4062 INITOFS:
      009A17 CD 87 B0         [ 4] 4063         call TFLASH 
      009A1A CD 85 64         [ 4] 4064         CALL AT 
      009A1D CD 86 9A         [ 4] 4065         CALL DUPP 
      009A20 CD 85 19         [ 4] 4066         call QBRAN
      009A23 9A 34                 4067         .word 1$
      0019A5                       4068         _DROP  
      009A25 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      009A28 CD 87 FF         [ 4] 4069         call CPP 
      009A2B CD 85 64         [ 4] 4070         call AT 
      009A2E CD 8D 69         [ 4] 4071         call HERE
      009A31 CD 89 53         [ 4] 4072         call SUBB 
      009A34 CD 88 34         [ 4] 4073 1$:     call OFFSET 
      009A37 CC 85 52         [ 2] 4074         jp STORE  
                                   4075 
                                   4076 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4077 ;       :       ( -- ; <string> )
                                   4078 ;       Start a new colon definition
                                   4079 ;       using next word as its name.
                                   4080 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



      0019BA                       4081         _HEADER COLON,1,":"
      009A3A 9A 0E                    1         .word LINK 
                           0019BC     2         LINK=.
      009A3C 01                       3         .byte 1  
      009A3D 3A                       4         .ascii ":"
      009A3E                          5         COLON:
      009A3E CD 9A 17         [ 4] 4082         call INITOFS       
      009A41 CD 93 5B         [ 4] 4083         CALL   TOKEN
      009A44 CD 98 9D         [ 4] 4084         CALL   SNAME
      009A47 CC 99 A8         [ 2] 4085         JP     RBRAC
                                   4086 
                                   4087 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4088 ;       I:  ( -- )
                                   4089 ;       Start interrupt service 
                                   4090 ;       routine definition
                                   4091 ;       those definition have 
                                   4092 ;       no name.
                                   4093 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0019CA                       4094         _HEADER ICOLON,2,"I:"
      009A4A 9A 3C                    1         .word LINK 
                           0019CC     2         LINK=.
      009A4C 02                       3         .byte 2  
      009A4D 49 3A                    4         .ascii "I:"
      009A4F                          5         ICOLON:
      009A4F CD 9A 17         [ 4] 4095         call INITOFS 
      009A52 CC 99 A8         [ 2] 4096         jp RBRAC  
                                   4097 
                                   4098 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4099 ;       IMMEDIATE       ( -- )
                                   4100 ;       Make last compiled word
                                   4101 ;       an immediate word.
                                   4102 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0019D5                       4103         _HEADER IMMED,9,"IMMEDIATE"
      009A55 9A 4C                    1         .word LINK 
                           0019D7     2         LINK=.
      009A57 09                       3         .byte 9  
      009A58 49 4D 4D 45 44 49 41     4         .ascii "IMMEDIATE"
             54 45
      009A61                          5         IMMED:
      009A61 CD 84 F0         [ 4] 4104         CALL	DOLIT
      009A64 80 00                 4105         .word	(IMEDD<<8)
      009A66 CD 88 0F         [ 4] 4106 IMM01:  CALL	LAST
      009A69 CD 85 64         [ 4] 4107         CALL    AT
      009A6C CD 85 64         [ 4] 4108         CALL    AT
      009A6F CD 87 0B         [ 4] 4109         CALL    ORR
      009A72 CD 88 0F         [ 4] 4110         CALL    LAST
      009A75 CD 85 64         [ 4] 4111         CALL    AT
      009A78 CC 85 52         [ 2] 4112         JP      STORE
                                   4113 
                                   4114 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4115 ;		COMPILE-ONLY  ( -- )
                                   4116 ;		Make last compiled word 
                                   4117 ;		a compile only word.
                                   4118 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0019FB                       4119         _HEADER COMPONLY,12,"COMPILE-ONLY"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



      009A7B 9A 57                    1         .word LINK 
                           0019FD     2         LINK=.
      009A7D 0C                       3         .byte 12  
      009A7E 43 4F 4D 50 49 4C 45     4         .ascii "COMPILE-ONLY"
             2D 4F 4E 4C 59
      009A8A                          5         COMPONLY:
      009A8A CD 84 F0         [ 4] 4120         CALL     DOLIT
      009A8D 40 00                 4121         .word    (COMPO<<8)
      009A8F CC 9A 66         [ 2] 4122         JP       IMM01
                                   4123 		
                                   4124 ;; Defining words
                                   4125 
                                   4126 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4127 ;       CREATE  ( -- ; <string> )
                                   4128 ;       Compile a new array
                                   4129 ;       without allocating space.
                                   4130 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001A12                       4131         _HEADER CREAT,6,"CREATE"
      009A92 9A 7D                    1         .word LINK 
                           001A14     2         LINK=.
      009A94 06                       3         .byte 6  
      009A95 43 52 45 41 54 45        4         .ascii "CREATE"
      009A9B                          5         CREAT:
      009A9B CD 93 5B         [ 4] 4132         CALL     TOKEN
      009A9E CD 98 9D         [ 4] 4133         CALL     SNAME
      009AA1 CD 99 34         [ 4] 4134         CALL     OVERT        
      009AA4 CD 96 E4         [ 4] 4135         CALL     COMPI 
      009AA7 87 50                 4136         .word DOVAR 
      009AA9 81               [ 4] 4137         RET
                                   4138 
                                   4139 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4140 ;       VARIABLE  ( -- ; <string> )
                                   4141 ;       Compile a new variable
                                   4142 ;       initialized to 0.
                                   4143 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001A2A                       4144         _HEADER VARIA,8,"VARIABLE"
      009AAA 9A 94                    1         .word LINK 
                           001A2C     2         LINK=.
      009AAC 08                       3         .byte 8  
      009AAD 56 41 52 49 41 42 4C     4         .ascii "VARIABLE"
             45
      009AB5                          5         VARIA:
                                   4145 ; indirect variable so that VARIABLE definition can be compiled in FLASH 
      009AB5 CD 8D 69         [ 4] 4146         CALL HERE
      009AB8 CD 86 9A         [ 4] 4147         CALL DUPP 
      009ABB CD 8B F8         [ 4] 4148         CALL CELLP
      009ABE CD 87 F1         [ 4] 4149         CALL VPP 
      009AC1 CD 85 52         [ 4] 4150         CALL STORE
      009AC4 CD 9A 9B         [ 4] 4151         CALL CREAT
      009AC7 CD 86 9A         [ 4] 4152         CALL DUPP
      009ACA CD 96 9F         [ 4] 4153         CALL COMMA
      009ACD CD 8C 8F         [ 4] 4154         CALL ZERO
      009AD0 CD 86 AA         [ 4] 4155         call SWAPP 
      009AD3 CD 85 52         [ 4] 4156         CALL STORE
      009AD6 CD A4 0F         [ 4] 4157         CALL FMOVE ; move definition to FLASH
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



      009AD9 CD 88 4D         [ 4] 4158         CALL QDUP 
      009ADC CD 85 19         [ 4] 4159         CALL QBRAN 
      009ADF 9A E8                 4160         .word SET_RAMLAST   
      009AE1 CD 9E B7         [ 4] 4161         call UPDATVP  ; don't update if variable kept in RAM.
      009AE4 CD A4 A3         [ 4] 4162         CALL UPDATPTR
      009AE7 81               [ 4] 4163         RET         
      009AE8                       4164 SET_RAMLAST: 
      009AE8 CD 88 0F         [ 4] 4165         CALL LAST 
      009AEB CD 85 64         [ 4] 4166         CALL AT 
      009AEE CD 88 22         [ 4] 4167         CALL RAMLAST 
      009AF1 CC 85 52         [ 2] 4168         JP STORE  
                                   4169 
                                   4170 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4171 ;       CONSTANT  ( n -- ; <string> )
                                   4172 ;       Compile a new constant 
                                   4173 ;       n CONSTANT name 
                                   4174 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001A74                       4175         _HEADER CONSTANT,8,"CONSTANT"
      009AF4 9A AC                    1         .word LINK 
                           001A76     2         LINK=.
      009AF6 08                       3         .byte 8  
      009AF7 43 4F 4E 53 54 41 4E     4         .ascii "CONSTANT"
             54
      009AFF                          5         CONSTANT:
      009AFF CD 93 5B         [ 4] 4176         CALL TOKEN
      009B02 CD 98 9D         [ 4] 4177         CALL SNAME 
      009B05 CD 99 34         [ 4] 4178         CALL OVERT 
      009B08 CD 96 E4         [ 4] 4179         CALL COMPI 
      009B0B 9B 1F                 4180         .word DOCONST
      009B0D CD 96 9F         [ 4] 4181         CALL COMMA 
      009B10 CD A4 0F         [ 4] 4182         CALL FMOVE
      009B13 CD 88 4D         [ 4] 4183         CALL QDUP 
      009B16 CD 85 19         [ 4] 4184         CALL QBRAN 
      009B19 9A E8                 4185         .word SET_RAMLAST  
      009B1B CD A4 A3         [ 4] 4186         CALL UPDATPTR  
      009B1E 81               [ 4] 4187 1$:     RET          
                                   4188 
                                   4189 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4190 ; CONSTANT runtime semantic 
                                   4191 ; doCONST  ( -- n )
                                   4192 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4193 ;       _HEADER DOCONST,7,"DOCONST"
      009B1F                       4194 DOCONST:
      009B1F 1D 00 02         [ 2] 4195         subw x,#CELLL
      009B22 90 85            [ 2] 4196         popw y 
      009B24 90 FE            [ 2] 4197         ldw y,(y) 
      009B26 FF               [ 2] 4198         ldw (x),y 
      009B27 81               [ 4] 4199         ret 
                                   4200 
                                   4201 ;----------------------------------
                                   4202 ; create double constant 
                                   4203 ; 2CONSTANT ( d -- ; <string> )
                                   4204 ;----------------------------------
      001AA8                       4205         _HEADER DCONST,9,"2CONSTANT"
      009B28 9A F6                    1         .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



                           001AAA     2         LINK=.
      009B2A 09                       3         .byte 9  
      009B2B 32 43 4F 4E 53 54 41     4         .ascii "2CONSTANT"
             4E 54
      009B34                          5         DCONST:
      009B34 CD 93 5B         [ 4] 4206         CALL TOKEN
      009B37 CD 98 9D         [ 4] 4207         CALL SNAME 
      009B3A CD 99 34         [ 4] 4208         CALL OVERT 
      009B3D CD 96 E4         [ 4] 4209         CALL COMPI 
      009B40 9B 57                 4210         .word DO_DCONST
      009B42 CD 96 9F         [ 4] 4211         CALL COMMA
      009B45 CD 96 9F         [ 4] 4212         CALL COMMA  
      009B48 CD A4 0F         [ 4] 4213         CALL FMOVE
      009B4B CD 88 4D         [ 4] 4214         CALL QDUP 
      009B4E CD 85 19         [ 4] 4215         CALL QBRAN 
      009B51 9A E8                 4216         .word SET_RAMLAST  
      009B53 CD A4 A3         [ 4] 4217         CALL UPDATPTR  
      009B56 81               [ 4] 4218 1$:     RET          
                                   4219     
                                   4220 ;----------------------------------
                                   4221 ; runtime for DCONST 
                                   4222 ; stack double constant 
                                   4223 ; DO-DCONST ( -- d )
                                   4224 ;-----------------------------------
                                   4225 ;       _HEADER DO_DCONST,9,"DO-DCONST"
      009B57                       4226 DO_DCONST:
      009B57 90 85            [ 2] 4227     popw y 
      009B59 90 BF 26         [ 2] 4228     ldw YTEMP,y 
      009B5C 1D 00 04         [ 2] 4229     subw x,#2*CELLL 
      009B5F 90 FE            [ 2] 4230     ldw y,(y)
      009B61 FF               [ 2] 4231     ldw (x),y 
      009B62 90 BE 26         [ 2] 4232     ldw y,YTEMP 
      009B65 90 EE 02         [ 2] 4233     ldw y,(2,y)
      009B68 EF 02            [ 2] 4234     ldw (2,x),y 
      009B6A 81               [ 4] 4235     ret 
                                   4236 
                                   4237 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4238 ;;          TOOLS 
                                   4239 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4240 
                                   4241 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4242 ;       _TYPE   ( b u -- )
                                   4243 ;       Display a string. Filter
                                   4244 ;       non-printing characters.
                                   4245 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001AEB                       4246         _HEADER UTYPE,5,"_TYPE"
      009B6B 9B 2A                    1         .word LINK 
                           001AED     2         LINK=.
      009B6D 05                       3         .byte 5  
      009B6E 5F 54 59 50 45           4         .ascii "_TYPE"
      009B73                          5         UTYPE:
      009B73 CD 86 63         [ 4] 4247         CALL     TOR     ;start count down loop
      009B76 20 0F            [ 2] 4248         JRA     UTYP2   ;skip first pass
      009B78 CD 86 9A         [ 4] 4249 UTYP1:  CALL     DUPP
      009B7B CD 85 82         [ 4] 4250         CALL     CAT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



      009B7E CD 8C B9         [ 4] 4251         CALL     TCHAR
      009B81 CD 84 B7         [ 4] 4252         CALL     EMIT    ;display only printable
      009B84 CD 8C 23         [ 4] 4253         CALL     ONEP    ;increment address
      009B87 CD 85 04         [ 4] 4254 UTYP2:  CALL     DONXT
      009B8A 9B 78                 4255         .word      UTYP1   ;loop till done
      009B8C CC 86 90         [ 2] 4256         JP     DROP
                                   4257 
                                   4258 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4259 ;       dm+     ( a u -- a )
                                   4260 ;       Dump u bytes from ,
                                   4261 ;       leaving a+u on  stack.
                                   4262 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001B0F                       4263         _HEADER DUMPP,3,"DM+"
      009B8F 9B 6D                    1         .word LINK 
                           001B11     2         LINK=.
      009B91 03                       3         .byte 3  
      009B92 44 4D 2B                 4         .ascii "DM+"
      009B95                          5         DUMPP:
      009B95 CD 86 C2         [ 4] 4264         CALL     OVER
      009B98 CD 84 F0         [ 4] 4265         CALL     DOLIT
      009B9B 00 04                 4266         .word      4
      009B9D CD 91 52         [ 4] 4267         CALL     UDOTR   ;display address
      009BA0 CD 90 B9         [ 4] 4268         CALL     SPACE
      009BA3 CD 86 63         [ 4] 4269         CALL     TOR     ;start count down loop
      009BA6 20 11            [ 2] 4270         JRA     PDUM2   ;skip first pass
      009BA8 CD 86 9A         [ 4] 4271 PDUM1:  CALL     DUPP
      009BAB CD 85 82         [ 4] 4272         CALL     CAT
      009BAE CD 84 F0         [ 4] 4273         CALL     DOLIT
      009BB1 00 03                 4274         .word      3
      009BB3 CD 91 52         [ 4] 4275         CALL     UDOTR   ;display numeric data
      009BB6 CD 8C 23         [ 4] 4276         CALL     ONEP    ;increment address
      009BB9 CD 85 04         [ 4] 4277 PDUM2:  CALL     DONXT
      009BBC 9B A8                 4278         .word      PDUM1   ;loop till done
      009BBE 81               [ 4] 4279         RET
                                   4280 
                                   4281 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4282 ;       DUMP    ( a u -- )
                                   4283 ;       Dump u bytes from a,
                                   4284 ;       in a formatted manner.
                                   4285 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001B3F                       4286         _HEADER DUMP,4,"DUMP"
      009BBF 9B 91                    1         .word LINK 
                           001B41     2         LINK=.
      009BC1 04                       3         .byte 4  
      009BC2 44 55 4D 50              4         .ascii "DUMP"
      009BC6                          5         DUMP:
      009BC6 CD 87 60         [ 4] 4287         CALL     BASE
      009BC9 CD 85 64         [ 4] 4288         CALL     AT
      009BCC CD 86 63         [ 4] 4289         CALL     TOR
      009BCF CD 8F 32         [ 4] 4290         CALL     HEX     ;save radix, set hex
      009BD2 CD 84 F0         [ 4] 4291         CALL     DOLIT
      009BD5 00 10                 4292         .word      16
      009BD7 CD 8B 49         [ 4] 4293         CALL     SLASH   ;change count to lines
      009BDA CD 86 63         [ 4] 4294         CALL     TOR     ;start count down loop
      009BDD CD 90 FC         [ 4] 4295 DUMP1:  CALL     CR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



      009BE0 CD 84 F0         [ 4] 4296         CALL     DOLIT
      009BE3 00 10                 4297         .word      16
      009BE5 CD 88 A8         [ 4] 4298         CALL     DDUP
      009BE8 CD 9B 95         [ 4] 4299         CALL     DUMPP   ;display numeric
      009BEB CD 88 5E         [ 4] 4300         CALL     ROT
      009BEE CD 88 5E         [ 4] 4301         CALL     ROT
      009BF1 CD 90 B9         [ 4] 4302         CALL     SPACE
      009BF4 CD 90 B9         [ 4] 4303         CALL     SPACE
      009BF7 CD 9B 73         [ 4] 4304         CALL     UTYPE   ;display printable characters
      009BFA CD 85 04         [ 4] 4305         CALL     DONXT
      009BFD 9B DD                 4306         .word      DUMP1   ;loop till done
      009BFF CD 86 90         [ 4] 4307 DUMP3:  CALL     DROP
      009C02 CD 85 B5         [ 4] 4308         CALL     RFROM
      009C05 CD 87 60         [ 4] 4309         CALL     BASE
      009C08 CC 85 52         [ 2] 4310         JP     STORE   ;restore radix
                                   4311 
                                   4312 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4313 ;       .S      ( ... -- ... )
                                   4314 ;        Display  contents of stack.
                                   4315 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001B8B                       4316         _HEADER DOTS,2,".S"
      009C0B 9B C1                    1         .word LINK 
                           001B8D     2         LINK=.
      009C0D 02                       3         .byte 2  
      009C0E 2E 53                    4         .ascii ".S"
      009C10                          5         DOTS:
      009C10 CD 90 FC         [ 4] 4317         CALL     CR
      009C13 CD 8C D1         [ 4] 4318         CALL     DEPTH   ;stack depth
      009C16 CD 86 63         [ 4] 4319         CALL     TOR     ;start count down loop
      009C19 20 09            [ 2] 4320         JRA     DOTS2   ;skip first pass
      009C1B CD 85 C6         [ 4] 4321 DOTS1:  CALL     RAT
      009C1E CD 8C E8         [ 4] 4322 	CALL     PICK
      009C21 CD 91 A2         [ 4] 4323         CALL     DOT     ;index stack, display contents
      009C24 CD 85 04         [ 4] 4324 DOTS2:  CALL     DONXT
      009C27 9C 1B                 4325         .word      DOTS1   ;loop till done
      009C29 CD 91 29         [ 4] 4326         CALL     DOTQP
      009C2C 05                    4327         .byte      5
      009C2D 20 3C 73 70 20        4328         .ascii     " <sp "
      009C32 81               [ 4] 4329         RET
                                   4330 
                                   4331 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4332 ;       >NAME   ( ca -- na | F )
                                   4333 ;       Convert code address
                                   4334 ;       to a name address.
                                   4335 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001BB3                       4336         _HEADER TNAME,5,">NAME"
      009C33 9C 0D                    1         .word LINK 
                           001BB5     2         LINK=.
      009C35 05                       3         .byte 5  
      009C36 3E 4E 41 4D 45           4         .ascii ">NAME"
      009C3B                          5         TNAME:
      009C3B CD 87 E3         [ 4] 4337         CALL     CNTXT   ;vocabulary link
      009C3E CD 85 64         [ 4] 4338 TNAM2:  CALL     AT
      009C41 CD 86 9A         [ 4] 4339         CALL     DUPP    ;?last word in a vocabulary
      009C44 CD 85 19         [ 4] 4340         CALL     QBRAN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



      009C47 9C 62                 4341         .word      TNAM4
      009C49 CD 88 A8         [ 4] 4342         CALL     DDUP
      009C4C CD 93 69         [ 4] 4343         CALL     NAMET
      009C4F CD 87 20         [ 4] 4344         CALL     XORR    ;compare
      009C52 CD 85 19         [ 4] 4345         CALL     QBRAN
      009C55 9C 5C                 4346         .word      TNAM3
      009C57 CD 8C 07         [ 4] 4347         CALL     CELLM   ;continue with next word
      009C5A 20 E2            [ 2] 4348         JRA     TNAM2
      009C5C CD 86 AA         [ 4] 4349 TNAM3:  CALL     SWAPP
      009C5F CC 86 90         [ 2] 4350         JP     DROP
      009C62 CD 88 9D         [ 4] 4351 TNAM4:  CALL     DDROP
      009C65 CC 8C 8F         [ 2] 4352         JP     ZERO
                                   4353 
                                   4354 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4355 ;       .ID     ( na -- )
                                   4356 ;        Display  name at address.
                                   4357 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001BE8                       4358         _HEADER DOTID,3,".ID"
      009C68 9C 35                    1         .word LINK 
                           001BEA     2         LINK=.
      009C6A 03                       3         .byte 3  
      009C6B 2E 49 44                 4         .ascii ".ID"
      009C6E                          5         DOTID:
      009C6E CD 88 4D         [ 4] 4359         CALL     QDUP    ;if zero no name
      009C71 CD 85 19         [ 4] 4360         CALL     QBRAN
      009C74 9C 84                 4361         .word      DOTI1
      009C76 CD 8D 52         [ 4] 4362         CALL     COUNT
      009C79 CD 84 F0         [ 4] 4363         CALL     DOLIT
      009C7C 00 1F                 4364         .word      0x1F
      009C7E CD 86 F7         [ 4] 4365         CALL     ANDD    ;mask lexicon bits
      009C81 CC 9B 73         [ 2] 4366         JP     UTYPE
      009C84 CD 91 29         [ 4] 4367 DOTI1:  CALL     DOTQP
      009C87 09                    4368         .byte      9
      009C88 20 6E 6F 4E 61 6D 65  4369         .ascii     " noName"
      009C8F 81               [ 4] 4370         RET
                                   4371 
                           000000  4372 WANT_SEE=0
                           000000  4373 .if WANT_SEE 
                                   4374 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4375 ;       SEE     ( -- ; <string> )
                                   4376 ;       A simple decompiler.
                                   4377 ;       Updated for byte machines.
                                   4378 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4379         _HEADER SEE,3,"SEE"
                                   4380         CALL     TICK    ;starting address
                                   4381         CALL     CR
                                   4382         CALL     ONEM
                                   4383 SEE1:   CALL     ONEP
                                   4384         CALL     DUPP
                                   4385         CALL     AT
                                   4386         CALL     DUPP
                                   4387         CALL     QBRAN
                                   4388         .word    SEE2
                                   4389         CALL     TNAME   ;?is it a name
                                   4390 SEE2:   CALL     QDUP    ;name address or zero
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



                                   4391         CALL     QBRAN
                                   4392         .word    SEE3
                                   4393         CALL     SPACE
                                   4394         CALL     DOTID   ;display name
                                   4395         CALL     ONEP
                                   4396         JRA      SEE4
                                   4397 SEE3:   CALL     DUPP
                                   4398         CALL     CAT
                                   4399         CALL     UDOT    ;display number
                                   4400 SEE4:   CALL     NUFQ    ;user control
                                   4401         CALL     QBRAN
                                   4402         .word    SEE1
                                   4403         JP     DROP
                                   4404 .endif ; WANT_SEE 
                                   4405 
                                   4406 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4407 ;       WORDS   ( -- )
                                   4408 ;       Display names in vocabulary.
                                   4409 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001C10                       4410         _HEADER WORDS,5,"WORDS"
      009C90 9C 6A                    1         .word LINK 
                           001C12     2         LINK=.
      009C92 05                       3         .byte 5  
      009C93 57 4F 52 44 53           4         .ascii "WORDS"
      009C98                          5         WORDS:
      009C98 CD 90 FC         [ 4] 4411         CALL     CR
      009C9B CD 87 E3         [ 4] 4412         CALL     CNTXT   ;only in context
      009C9E CD 85 64         [ 4] 4413 WORS1:  CALL     AT
      009CA1 CD 88 4D         [ 4] 4414         CALL     QDUP    ;?at end of list
      009CA4 CD 85 19         [ 4] 4415         CALL     QBRAN
      009CA7 9C BA                 4416         .word      WORS2
      009CA9 CD 86 9A         [ 4] 4417         CALL     DUPP
      009CAC CD 90 B9         [ 4] 4418         CALL     SPACE
      009CAF CD 9C 6E         [ 4] 4419         CALL     DOTID   ;display a name
      009CB2 CD 8C 07         [ 4] 4420         CALL     CELLM
      009CB5 CD 85 35         [ 4] 4421         CALL     BRAN
      009CB8 9C 9E                 4422         .word      WORS1
      009CBA 81               [ 4] 4423 WORS2:  RET
                                   4424 
                                   4425         
                                   4426 ;; Hardware reset
                                   4427 
                                   4428 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4429 ;  COPYRIGTH
                                   4430 ; print copyright notice 
                                   4431 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      009CBB                       4432 COPYRIGHT:
      009CBB CD 91 29         [ 4] 4433     CALL DOTQP 
      009CBE 21                    4434     .byte 33 
      009CBF 4A 61 63 71 75 65 73  4435     .ascii "Jacques Deschenes, Copyright 2021"
             20 44 65 73 63 68 65
             6E 65 73 2C 20 43 6F
             70 79 72 69 67 68 74
             20 32 30 32 31
      009CE0 CC 90 FC         [ 2] 4436     JP CR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



                                   4437 
                                   4438 
                                   4439 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4440 ;  PRT_LICENCE 
                                   4441 ;  print GPLV2 licence 
                                   4442 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      009CE3                       4443 PRT_LICENCE:
      009CE3 CD 91 29         [ 4] 4444         CALL DOTQP 
      009CE6 0F                    4445         .byte  15 
      009CE7 4C 49 43 45 4E 43 45  4446         .ascii "LICENCE GPLV3\r\n"
             20 47 50 4C 56 33 0D
             0A
      009CF6 81               [ 4] 4447         RET 
                                   4448 
                                   4449 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4450 ;    PRINT_VERSION ( c1 c2 -- )
                                   4451 ;    c2 minor 
                                   4452 ;    c1 major 
                                   4453 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      009CF7                       4454 PRINT_VERSION:
      009CF7 CD 91 29         [ 4] 4455      CALL DOTQP 
      009CFA 09                    4456      .byte 9
      009CFB 20 76 65 72 73 69 6F  4457      .ascii " version "
             6E 20
      009D04 CD 8E 97         [ 4] 4458      CALL BDIGS 
      009D07 CD 8E D1         [ 4] 4459      CALL DIGS 
      009D0A CD 8E D1         [ 4] 4460      CALL DIGS 
      001C8D                       4461      _DOLIT '.' 
      009D0D CD 84 F0         [ 4]    1     CALL DOLIT 
      009D10 00 2E                    2     .word '.' 
      009D12 CD 8E A7         [ 4] 4462      CALL HOLD 
      001C95                       4463      _DROP 
      009D15 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      009D18 CD 8E D1         [ 4] 4464      CALL DIGS 
      009D1B CD 8E FC         [ 4] 4465      CALL EDIGS 
      009D1E CC 90 E3         [ 2] 4466      JP TYPES 
                                   4467       
                                   4468 
                                   4469 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4470 ;       hi      ( -- )
                                   4471 ;       Display sign-on message.
                                   4472 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001CA1                       4473         _HEADER HI,2,"HI"
      009D21 9C 92                    1         .word LINK 
                           001CA3     2         LINK=.
      009D23 02                       3         .byte 2  
      009D24 48 49                    4         .ascii "HI"
      009D26                          5         HI:
      009D26 CD 90 FC         [ 4] 4474         CALL     CR
      009D29 CD 91 29         [ 4] 4475         CALL     DOTQP   
      009D2C 0A                    4476         .byte      10
      009D2D 73 74 6D 38 65 46 6F  4477         .ascii     "stm8eForth"
             72 74 68
      001CB7                       4478 	_DOLIT VER 
      009D37 CD 84 F0         [ 4]    1     CALL DOLIT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



      009D3A 00 04                    2     .word VER 
      001CBC                       4479         _DOLIT EXT 
      009D3C CD 84 F0         [ 4]    1     CALL DOLIT 
      009D3F 00 00                    2     .word EXT 
      009D41 CD 9C F7         [ 4] 4480         CALL PRINT_VERSION 
      009D44 CD 91 29         [ 4] 4481         CALL    DOTQP
                           000001  4482 .if NUCLEO          
      009D47 12                    4483         .byte 18
      009D48 20 6F 6E 20 4E 55 43  4484         .ascii  " on NUCLEO-8S208RB"
             4C 45 4F 2D 38 53 32
             30 38 52 42
                                   4485 .endif
                           000000  4486 .if DISCOVERY
                                   4487         .byte 19
                                   4488         .ascii  " on STM8S-DISCOVERY"
                                   4489 .endif
                           000000  4490 .if DOORBELL
                                   4491         .byte 16
                                   4492         .ascii " on stm8s105k6b6"
                                   4493 .endif
      009D5A CC 90 FC         [ 2] 4494         JP     CR
                                   4495 
                           000000  4496 WANT_DEBUG=0
                           000000  4497 .if WANT_DEBUG 
                                   4498 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4499 ;       DEBUG      ( -- )
                                   4500 ;       Display sign-on message.
                                   4501 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4502         _HEADER DEBUG,5,"DEBUG"
                                   4503 	CALL DOLIT
                                   4504 	.word 0x65
                                   4505 	CALL EMIT
                                   4506 	CALL ZERO
                                   4507  	CALL ZLESS 
                                   4508 	CALL DOLIT
                                   4509 	.word 0xFFFE
                                   4510 	CALL ZLESS 
                                   4511 	CALL UPLUS 
                                   4512  	_DROP 
                                   4513 	CALL DOLIT
                                   4514 	.word 3
                                   4515 	CALL UPLUS 
                                   4516 	CALL UPLUS 
                                   4517  	_DROP
                                   4518 	CALL DOLIT
                                   4519 	.word 0x43
                                   4520 	CALL UPLUS 
                                   4521  	_DROP
                                   4522 	CALL EMIT
                                   4523 	CALL DOLIT
                                   4524 	.word 0x4F
                                   4525 	CALL DOLIT
                                   4526 	.word 0x6F
                                   4527  	CALL XORR
                                   4528 	CALL DOLIT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



                                   4529 	.word 0xF0
                                   4530  	CALL ANDD
                                   4531 	CALL DOLIT
                                   4532 	.word 0x4F
                                   4533  	CALL ORR
                                   4534 	CALL EMIT
                                   4535 	CALL DOLIT
                                   4536 	.word 8
                                   4537 	CALL DOLIT
                                   4538 	.word 6
                                   4539  	CALL SWAPP
                                   4540 	CALL OVER
                                   4541 	CALL XORR
                                   4542 	CALL DOLIT
                                   4543 	.word 3
                                   4544 	CALL ANDD 
                                   4545 	CALL ANDD
                                   4546 	CALL DOLIT
                                   4547 	.word 0x70
                                   4548 	CALL UPLUS 
                                   4549 	_DROP
                                   4550 	CALL EMIT
                                   4551 	CALL ZERO
                                   4552 	CALL QBRAN
                                   4553 	.word DEBUG1
                                   4554 	CALL DOLIT
                                   4555 	.word 0x3F
                                   4556 DEBUG1:
                                   4557 	CALL DOLIT
                                   4558 	.word 0xFFFF
                                   4559 	CALL QBRAN
                                   4560 	.word DEBUG2
                                   4561 	CALL DOLIT
                                   4562 	.word 0x74
                                   4563 	CALL BRAN
                                   4564 	.word DEBUG3
                                   4565 DEBUG2:
                                   4566 	CALL DOLIT
                                   4567 	.word 0x21
                                   4568 DEBUG3:
                                   4569 	CALL EMIT
                                   4570 	CALL DOLIT
                                   4571 	.word 0x68
                                   4572 	CALL DOLIT
                                   4573 	.word 0x80
                                   4574 	CALL STORE
                                   4575 	CALL DOLIT
                                   4576 	.word 0x80
                                   4577 	CALL AT
                                   4578 	CALL EMIT
                                   4579 	CALL DOLIT
                                   4580 	.word 0x4D
                                   4581 	CALL TOR
                                   4582 	CALL RAT
                                   4583 	CALL RFROM
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



                                   4584 	CALL ANDD
                                   4585 	CALL EMIT
                                   4586 	CALL DOLIT
                                   4587 	.word 0x61
                                   4588 	CALL DOLIT
                                   4589 	.word 0xA
                                   4590 	CALL TOR
                                   4591 DEBUG4:
                                   4592 	CALL ONE
                                   4593 	CALL UPLUS 
                                   4594 	_DROP
                                   4595 	CALL DONXT
                                   4596 	.word DEBUG4
                                   4597 	CALL EMIT
                                   4598 	CALL DOLIT
                                   4599 	.word 0x656D
                                   4600 	CALL DOLIT
                                   4601 	.word 0x100
                                   4602 	CALL UMSTA
                                   4603 	CALL SWAPP
                                   4604 	CALL DOLIT
                                   4605 	.word 0x100
                                   4606 	CALL UMSTA
                                   4607 	CALL SWAPP 
                                   4608 	_DROP
                                   4609 	CALL EMIT
                                   4610 	CALL EMIT
                                   4611 	CALL DOLIT
                                   4612 	.word 0x2043
                                   4613 	CALL ZERO
                                   4614 	CALL DOLIT
                                   4615 	.word 0x100
                                   4616 	CALL UMMOD
                                   4617 	CALL EMIT
                                   4618 	CALL EMIT
                                   4619 	;JP ORIG
                                   4620 	RET
                                   4621 .endif ; WANT_DEBUG 
                                   4622 
                                   4623 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4624 ;       'BOOT   ( -- a )
                                   4625 ;       The application startup vector.
                                   4626 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001CDD                       4627         _HEADER TBOOT,5,"'BOOT"
      009D5D 9D 23                    1         .word LINK 
                           001CDF     2         LINK=.
      009D5F 05                       3         .byte 5  
      009D60 27 42 4F 4F 54           4         .ascii "'BOOT"
      009D65                          5         TBOOT:
      009D65 CD 87 50         [ 4] 4628         CALL     DOVAR
      009D68 40 02                 4629         .word    APP_RUN      ;application to boot
                                   4630 
                                   4631 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4632 ;       COLD    ( -- )
                                   4633 ;       The hilevel cold start s=ence.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]



                                   4634 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001CEA                       4635         _HEADER COLD,4,"COLD"
      009D6A 9D 5F                    1         .word LINK 
                           001CEC     2         LINK=.
      009D6C 04                       3         .byte 4  
      009D6D 43 4F 4C 44              4         .ascii "COLD"
      009D71                          5         COLD:
                           000000  4636 .if WANT_DEBUG
                                   4637         CALL DEBUG
                                   4638 .endif ; WANT_DEBUG
      009D71 CD 84 F0         [ 4] 4639 COLD1:  CALL     DOLIT
      009D74 80 AB                 4640         .word      UZERO
      009D76 CD 84 F0         [ 4] 4641 	CALL     DOLIT
      009D79 00 06                 4642         .word      UPP
      009D7B CD 84 F0         [ 4] 4643         CALL     DOLIT
      009D7E 00 1C                 4644 	.word      UEND-UZERO
      009D80 CD 8D B6         [ 4] 4645         CALL     CMOVE   ;initialize user area
                           000001  4646 .if WANT_FLOAT + WANT_FLOAT24 
      009D83 CD A6 60         [ 4] 4647         CALL    FINIT 
                                   4648 .endif 
                                   4649 ; if APP_RUN==0 initialize with ca de 'hi'  
      009D86 90 CE 40 02      [ 2] 4650         ldw y,APP_RUN 
      009D8A 26 0B            [ 1] 4651         jrne 0$
      009D8C 1D 00 02         [ 2] 4652         subw x,#CELLL 
      009D8F 90 AE 9D 26      [ 2] 4653         ldw y,#HI  
      009D93 FF               [ 2] 4654         ldw (x),y
      009D94 CD 9E 8F         [ 4] 4655         call UPDATRUN 
      009D97                       4656 0$:        
                                   4657 ; update LAST with APP_LAST 
                                   4658 ; if APP_LAST > LAST else do the opposite
      009D97 90 CE 40 00      [ 2] 4659         ldw y,APP_LAST 
      009D9B 90 B3 1C         [ 2] 4660         cpw y,ULAST 
      009D9E 22 05            [ 1] 4661         jrugt 1$ 
                                   4662 ; save LAST at APP_LAST  
      009DA0 CD 9E 77         [ 4] 4663         call UPDATLAST 
      009DA3 20 06            [ 2] 4664         jra 2$
      009DA5                       4665 1$: ; update LAST with APP_LAST 
      009DA5 90 BF 1C         [ 2] 4666         ldw ULAST,y
      009DA8 90 BF 16         [ 2] 4667         ldw UCNTXT,y
      009DAB                       4668 2$:  
                                   4669 ; update APP_CP if < app_space 
      009DAB 90 CE 40 04      [ 2] 4670         ldw y,APP_CP  
      009DAF 90 B3 1A         [ 2] 4671         cpw y,UCP   
      009DB2 24 06            [ 1] 4672         jruge 3$ 
      009DB4 CD 9E A0         [ 4] 4673         call UPDATCP
      009DB7 90 BE 1A         [ 2] 4674         ldw y,UCP   
      009DBA                       4675 3$:
      009DBA 90 BF 1A         [ 2] 4676         ldw UCP,y                 
                                   4677 ; update UVP with APP_VP  
                                   4678 ; if APP_VP>UVP else do the opposite 
      009DBD 90 CE 40 06      [ 2] 4679         ldw y,APP_VP 
      009DC1 90 B3 18         [ 2] 4680         cpw y,UVP 
      009DC4 22 05            [ 1] 4681         jrugt 4$
      009DC6 CD 9E B7         [ 4] 4682         call UPDATVP 
      009DC9 20 03            [ 2] 4683         jra 6$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]



      009DCB                       4684 4$: ; update UVP with APP_VP 
      009DCB 90 BF 18         [ 2] 4685         ldw UVP,y 
      009DCE                       4686 6$:      
      009DCE CD 96 49         [ 4] 4687         CALL     PRESE   ;initialize data stack and TIB
      009DD1 CD 9D 65         [ 4] 4688         CALL     TBOOT
      009DD4 CD 8D 9F         [ 4] 4689         CALL     ATEXE   ;application boot
      009DD7 CD 99 34         [ 4] 4690         CALL     OVERT
      009DDA CC 96 66         [ 2] 4691         JP     QUIT    ;start interpretation
                                   4692 
                                   4693 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]



                                   4694         .include "flash.asm"
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
      009DDD 9D 6C                   31     .word LINK 
                           001D5F    32     LINK=.
      009DDF 03                      33     .byte 3 
      009DE0 46 50 21                34     .ascii "FP!"
      009DE3                         35 FPSTOR:
      009DE3 90 93            [ 1]   36     ldw y,x
      009DE5 90 FE            [ 2]   37     ldw y,(y)
      009DE7 90 9F            [ 1]   38     ld a,yl 
      009DE9 B7 34            [ 1]   39     ld FPTR,a 
      009DEB 1C 00 02         [ 2]   40     addw x,#CELLL 
      009DEE 90 93            [ 1]   41     ldw y,x 
      009DF0 90 FE            [ 2]   42     ldw y,(y)
      009DF2 90 BF 35         [ 2]   43     ldw PTR16,y
      009DF5 1C 00 02         [ 2]   44     addw x,#CELLL 
      009DF8 81               [ 4]   45     ret 
                                     46 
                                     47 ;-----------------------------------
                                     48 ; return EEPROM base address 
                                     49 ; as a double 
                                     50 ;  EEPROM  ( -- ud )
                                     51 ;-----------------------------------
      009DF9 9D DF                   52     .word LINK 
                           001D7B    53 LINK=.
      009DFB 06                      54     .byte 6 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]



      009DFC 45 45 50 52 4F 4D       55     .ascii "EEPROM"
      009E02                         56 EEPROM: 
      009E02 90 AE 40 00      [ 2]   57     ldw y,#EEPROM_BASE
      009E06 1D 00 04         [ 2]   58     subw x,#2*CELLL 
      009E09 EF 02            [ 2]   59     ldw (2,x),y 
      009E0B 90 5F            [ 1]   60     clrw y 
      009E0D FF               [ 2]   61     ldw (x),y 
      009E0E 81               [ 4]   62     ret
                                     63 
                                     64 ;---------------------------------
                                     65 ; return APP_LAST pointer as double
                                     66 ; EEP-LAST ( -- ud )
                                     67 ;---------------------------------
      009E0F 9D FB                   68 	.word LINK 
                           001D91    69 	LINK=.
      009E11 08                      70 	.byte 8 
      009E12 45 45 50 2D 4C 41 53    71 	.ascii "EEP-LAST"
             54
      009E1A                         72 EEPLAST:
      009E1A 1D 00 04         [ 2]   73 	subw x,#2*CELLL 
      009E1D 90 AE 40 00      [ 2]   74 	ldw y,#APP_LAST 
      009E21 EF 02            [ 2]   75 	ldw (2,x),y 
      009E23 90 5F            [ 1]   76 	clrw y 
      009E25 FF               [ 2]   77 	ldw (x),y 
      009E26 81               [ 4]   78 	ret 
                                     79 
                                     80 ;----------------------------------
                                     81 ; return APP_RUN pointer as double	
                                     82 ; EEP-RUN ( -- ud )
                                     83 ;-----------------------------------
      009E27 9E 11                   84 	.word LINK 
                           001DA9    85 	LINK=.
      009E29 07                      86 	.byte 7
      009E2A 45 45 50 2D 52 55 4E    87 	.ascii "EEP-RUN"
      009E31                         88 EEPRUN:
      009E31 1D 00 04         [ 2]   89 	subw x,#2*CELLL 
      009E34 90 AE 40 02      [ 2]   90 	ldw y,#APP_RUN 
      009E38 EF 02            [ 2]   91 	ldw (2,x),y 
      009E3A 90 5F            [ 1]   92 	clrw y 
      009E3C FF               [ 2]   93 	ldw (x),y 
      009E3D 81               [ 4]   94 	ret 
                                     95 
                                     96 ;------------------------------------
                                     97 ; return APP_CP pointer as double 
                                     98 ; EEP-CP ( -- ud )
                                     99 ;------------------------------------
      009E3E 9E 29                  100 	.word LINK
                           001DC0   101 	LINK=.
      009E40 06                     102 	.byte 6 
      009E41 45 45 50 2D 43 50      103 	.ascii "EEP-CP"
      009E47                        104 EEPCP:
      009E47 1D 00 04         [ 2]  105 	subw x,#2*CELLL 
      009E4A 90 AE 40 04      [ 2]  106 	ldw y,#APP_CP  
      009E4E EF 02            [ 2]  107 	ldw (2,x),y 
      009E50 90 5F            [ 1]  108 	clrw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]



      009E52 FF               [ 2]  109 	ldw (x),y 
      009E53 81               [ 4]  110 	ret 
                                    111 
                                    112 ;------------------------------------
                                    113 ; return APP_VP pointer as double 
                                    114 ; EEP-VP ( -- ud )
                                    115 ;-------------------------------------
      009E54 9E 40                  116 	.word LINK
                           001DD6   117 	LINK=.
      009E56 06                     118 	.byte 6
      009E57 45 45 50 2D 56 50      119 	.ascii "EEP-VP"
      009E5D                        120 EEPVP:
      009E5D 1D 00 04         [ 2]  121 	subw x,#2*CELLL 
      009E60 90 AE 40 06      [ 2]  122 	ldw y,#APP_VP  
      009E64 EF 02            [ 2]  123 	ldw (2,x),y 
      009E66 90 5F            [ 1]  124 	clrw y 
      009E68 FF               [ 2]  125 	ldw (x),y 
      009E69 81               [ 4]  126 	ret 
                                    127 
                                    128 ;----------------------------------
                                    129 ; update APP_LAST with LAST 
                                    130 ; UPDAT-LAST ( -- )
                                    131 ;----------------------------------
      009E6A 9E 56                  132 	.word LINK 
                           001DEC   133 	LINK=.
      009E6C 0A                     134 	.byte 10
      009E6D 55 50 44 41 54 2D 4C   135 	.ascii "UPDAT-LAST"
             41 53 54
      009E77                        136 UPDATLAST:
      009E77 CD 88 0F         [ 4]  137 	call LAST
      009E7A CD 85 64         [ 4]  138 	call AT  
      009E7D CD 9E 1A         [ 4]  139 	call EEPLAST
      009E80 CC A0 6D         [ 2]  140 	jp EESTORE 
                                    141 
                                    142 ;---------------------------------
                                    143 ; update APP_RUN 
                                    144 ; UPDAT-RUN ( a -- )
                                    145 ;---------------------------------
      009E83 9E 6C                  146 	.word LINK
                           001E05   147 	LINK=.
      009E85 09                     148 	.byte 9
      009E86 55 50 44 41 54 2D 52   149 	.ascii "UPDAT-RUN"
             55 4E
      009E8F                        150 UPDATRUN:
      009E8F CD 9E 31         [ 4]  151 	call EEPRUN
      009E92 CC A0 6D         [ 2]  152 	jp EESTORE 
                                    153 	
                                    154 ;---------------------------------
                                    155 ; update APP_CP with CP 
                                    156 ; UPDAT-CP ( -- )
                                    157 ;---------------------------------
      009E95 9E 85                  158 	.word LINK 
                           001E17   159 	LINK=.
      009E97 08                     160 	.byte 8 
      009E98 55 50 44 41 54 2D 43   161 	.ascii "UPDAT-CP"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
Hexadecimal  50-Bits]



             50
      009EA0                        162 UPDATCP:
      009EA0 CD 87 FF         [ 4]  163 	call CPP 
      009EA3 CD 85 64         [ 4]  164 	call AT 
      009EA6 CD 9E 47         [ 4]  165 	call EEPCP 
      009EA9 CC A0 6D         [ 2]  166 	jp EESTORE 
                                    167 
                                    168 ;----------------------------------
                                    169 ; update APP_VP with VP 
                                    170 ; UPDAT-VP ( -- )
                                    171 ;----------------------------------
      009EAC 9E 97                  172 	.word LINK
                           001E2E   173 	LINK=.
      009EAE 08                     174 	.byte 8 
      009EAF 55 50 44 41 54 2D 56   175 	.ascii "UPDAT-VP" 
             50
      009EB7                        176 UPDATVP:
      009EB7 CD 87 F1         [ 4]  177 	call VPP 
      009EBA CD 85 64         [ 4]  178 	call AT
      009EBD CD 9E 5D         [ 4]  179 	call EEPVP 
      009EC0 CC A0 6D         [ 2]  180 	jp EESTORE
                                    181 	
                           000001   182 .if NUCLEO
                                    183 ;----------------------------------
                                    184 ; fetch integer at address over 65535
                                    185 ;  F@   ( ud -- n )
                                    186 ;----------------------------------
      009EC3 9E AE                  187     .word LINK 
                           001E45   188 LINK=.
      009EC5 02                     189     .byte 2
      009EC6 46 40                  190     .ascii "F@"
      009EC8                        191 FARAT:
      009EC8 CD 9D E3         [ 4]  192     call FPSTOR
      009ECB CC 9F 90         [ 2]  193 	jp EE_READ 
                                    194 
                                    195 
                                    196 ;-------------------------------------
                                    197 ; fetch C at address over 65535 
                                    198 ; FC@ ( ud -- c)
                                    199 ;-------------------------------------
      009ECE 9E C5                  200     .word LINK
                           001E50   201     LINK=.
      009ED0 03                     202     .byte 3 
      009ED1 46 43 40               203     .ascii "FC@" 
      009ED4                        204 FARCAT:
      009ED4 CD 9D E3         [ 4]  205     call FPSTOR
      009ED7 CC 9F B2         [ 2]  206 	jp EE_CREAD  
                                    207 .endif ; NUCLEO 
                                    208 
                                    209 ;----------------------------------
                                    210 ; UNLOCK EEPROM/OPT for writing/erasing
                                    211 ; wait endlessly for FLASH_IAPSR_DUL bit.
                                    212 ;  UNLKEE   ( -- )
                                    213 ;----------------------------------
      009EDA 9E D0                  214     .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
Hexadecimal [24-Bits]



                           001E5C   215 LINK=.
      009EDC 06                     216     .byte 6 
      009EDD 55 4E 4C 4B 45 45      217     .ascii "UNLKEE"
      009EE3                        218 UNLKEE:
      009EE3 35 00 50 5B      [ 1]  219 	mov FLASH_CR2,#0 
      009EE7 35 FF 50 5C      [ 1]  220 	mov FLASH_NCR2,#0xFF 
      009EEB 35 AE 50 64      [ 1]  221 	mov FLASH_DUKR,#FLASH_DUKR_KEY1
      009EEF 35 56 50 64      [ 1]  222     mov FLASH_DUKR,#FLASH_DUKR_KEY2
      009EF3 72 07 50 5F FB   [ 2]  223 	btjf FLASH_IAPSR,#FLASH_IAPSR_DUL,.
      009EF8 81               [ 4]  224 	ret
                                    225 
                                    226 ;----------------------------------
                                    227 ; UNLOCK FLASH for writing/erasing
                                    228 ; wait endlessly for FLASH_IAPSR_PUL bit.
                                    229 ; UNLKFL  ( -- )
                                    230 ;----------------------------------
      009EF9 9E DC                  231     .word LINK 
                           001E7B   232 LINK=. 
      009EFB 06                     233     .byte 6 
      009EFC 55 4E 4C 4B 46 4C      234     .ascii "UNLKFL"    
      009F02                        235 UNLKFL:
      009F02 35 00 50 5B      [ 1]  236 	mov FLASH_CR2,#0 
      009F06 35 FF 50 5C      [ 1]  237 	mov FLASH_NCR2,#0xFF 
      009F0A 35 56 50 62      [ 1]  238 	mov FLASH_PUKR,#FLASH_PUKR_KEY1
      009F0E 35 AE 50 62      [ 1]  239 	mov FLASH_PUKR,#FLASH_PUKR_KEY2
      009F12 72 03 50 5F FB   [ 2]  240 	btjf FLASH_IAPSR,#FLASH_IAPSR_PUL,.
      009F17 81               [ 4]  241 	ret
                                    242 
                                    243 ;-----------------------------
                                    244 ; UNLOCK FLASH or EEPROM 
                                    245 ; according to FPTR address 
                                    246 ;  UNLOCK ( -- )
                                    247 ;-----------------------------
      009F18 9E FB                  248 	.word LINK 
                           001E9A   249 	LINK=.
      009F1A 06                     250 	.byte 6
      009F1B 55 4E 4C 4F 43 4B      251 	.ascii "UNLOCK"
      009F21                        252 UNLOCK:
                                    253 ; put addr[15:0] in Y, for bounds check.
      009F21 90 BE 35         [ 2]  254 	ldw y,PTR16   ; Y=addr15:0
                                    255 ; check addr[23:16], if <> 0 then it is extened flash memory
      009F24 3D 34            [ 1]  256 	tnz FPTR 
      009F26 26 16            [ 1]  257 	jrne 4$
      009F28 90 A3 80 00      [ 2]  258     cpw y,#FLASH_BASE
      009F2C 24 10            [ 1]  259     jruge 4$
      009F2E 90 A3 40 00      [ 2]  260 	cpw y,#EEPROM_BASE  
      009F32 25 0D            [ 1]  261     jrult 9$
      009F34 90 A3 48 7F      [ 2]  262 	cpw y,#OPTION_END 
      009F38 22 07            [ 1]  263 	jrugt 9$
      009F3A CD 9E E3         [ 4]  264 	call UNLKEE
      009F3D 81               [ 4]  265 	ret 
      009F3E CD 9F 02         [ 4]  266 4$: call UNLKFL
      009F41 81               [ 4]  267 9$: ret 
                                    268 
                                    269 ;-------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]



                                    270 ; LOCK write access to 
                                    271 ; FLASH and EEPROM 
                                    272 ; LOCK ( -- )
                                    273 ;-------------------------
      009F42 9F 1A                  274 	.word LINK 
                           001EC4   275 	LINK=.
      009F44 04                     276 	.byte 4 
      009F45 4C 4F 43 4B            277 	.ascii "LOCK" 
      009F49                        278 LOCK: 
      009F49 72 13 50 5F      [ 1]  279 	bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      009F4D 72 17 50 5F      [ 1]  280 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      009F51 81               [ 4]  281 	ret 
                                    282 
                                    283 ;-------------------------
                                    284 ; increment FPTR 
                                    285 ; INC-FPTR ( -- )
                                    286 ;-------------------------
      009F52 9F 44                  287 	.word LINK 
                           001ED4   288 	LINK=. 
      009F54 08                     289 	.byte 8 
      009F55 49 4E 43 2D 46 50 54   290 	.ascii "INC-FPTR" 
             52
      009F5D                        291 INC_FPTR:
      009F5D 3C 36            [ 1]  292 	inc PTR8 
      009F5F 26 0C            [ 1]  293 	jrne 1$
      009F61 90 89            [ 2]  294 	pushw y 
      009F63 90 BE 34         [ 2]  295 	ldw y,FPTR 
      009F66 90 5C            [ 1]  296 	incw y 
      009F68 90 BF 34         [ 2]  297 	ldw FPTR,y
      009F6B 90 85            [ 2]  298 	popw y  
      009F6D 81               [ 4]  299 1$: ret 
                                    300 
                                    301 ;------------------------------
                                    302 ; add u to FPTR 
                                    303 ; PTR+ ( u -- )
                                    304 ;------------------------------
      009F6E 9F 54                  305 	.word LINK 
                           001EF0   306 	LINK=.
      009F70 04                     307 	.byte 4 
      009F71 50 54 52 2B            308 	.ascii "PTR+"
      009F75                        309 PTRPLUS:
      009F75 90 93            [ 1]  310 	ldw y,x 
      009F77 1C 00 02         [ 2]  311 	addw x,#CELLL 
      009F7A 72 B9 00 35      [ 2]  312 	addw y,PTR16 
      009F7E 90 BF 35         [ 2]  313 	ldw PTR16,y  
      009F81 24 02            [ 1]  314 	jrnc 1$
      009F83 3C 34            [ 1]  315 	inc FPTR 
      009F85 81               [ 4]  316 1$: ret 
                                    317 
                                    318 ;---------------------------------
                                    319 ; read word at address pointed FPTR
                                    320 ; increment FPTR 
                                    321 ; EE-READ ( -- w )
                                    322 ;------------------------------------
      009F86 9F 70                  323 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]



                           001F08   324 	LINK=.
      009F88 07                     325 	.byte 7 
      009F89 45 45 2D 52 45 41 44   326 	.ascii "EE-READ"
      009F90                        327 EE_READ:
      009F90 1D 00 02         [ 2]  328 	subw x,#CELLL 
      009F93 92 BC 00 34      [ 5]  329 	ldf a,[FPTR]
      009F97 90 95            [ 1]  330 	ld yh,a 
      009F99 CD 9F 5D         [ 4]  331 	call INC_FPTR 
      009F9C 92 BC 00 34      [ 5]  332 	ldf a,[FPTR]
      009FA0 CD 9F 5D         [ 4]  333 	call INC_FPTR 
      009FA3 90 97            [ 1]  334 	ld yl,a 
      009FA5 FF               [ 2]  335 	ldw (x),y 
      009FA6 81               [ 4]  336 	ret 
                                    337 
                                    338 ;---------------------------------------
                                    339 ; Read byte at address pointed by FPTR 
                                    340 ; EE-CREAD ( -- c )
                                    341 ;---------------------------------------
      009FA7 9F 88                  342 	.word LINK 
                           001F29   343 	LINK=.
      009FA9 08                     344 	.byte 8
      009FAA 45 45 2D 43 52 45 41   345 	.ascii "EE-CREAD" 
             44
      009FB2                        346 EE_CREAD:
      009FB2 1D 00 02         [ 2]  347 	subw x,#CELLL 
      009FB5 92 BC 00 34      [ 5]  348 	ldf a,[FPTR]	
      009FB9 CD 9F 5D         [ 4]  349 	call INC_FPTR
      009FBC 90 5F            [ 1]  350 	clrw y 
      009FBE 90 97            [ 1]  351 	ld yl,a 
      009FC0 FF               [ 2]  352 	ldw (x),y 
      009FC1 81               [ 4]  353 	ret 
                                    354 
                                    355 ;----------------------------
                                    356 ; write a byte at address pointed 
                                    357 ; by FPTR and increment FPTR.
                                    358 ; Expect pointer already initialized 
                                    359 ; and memory unlocked 
                                    360 ; WR-BYTE ( c -- )
                                    361 ;----------------------------
      009FC2 9F A9                  362 	.word LINK 
                           001F44   363 	LINK=. 
      009FC4 07                     364 	.byte 7 
      009FC5 57 52 2D 42 59 54 45   365 	.ascii "WR-BYTE" 
                                    366 
      009FCC                        367 WR_BYTE:
      009FCC CD 84 E4         [ 4]  368 	call FC_XOFF
      009FCF 90 93            [ 1]  369 	ldw y,x 
      009FD1 90 FE            [ 2]  370 	ldw y,(y)
      009FD3 1C 00 02         [ 2]  371 	addw x,#CELLL 
      009FD6 90 9F            [ 1]  372 	ld a,yl
      009FD8 92 BD 00 34      [ 4]  373 	ldf [FPTR],a
      009FDC 72 05 50 5F FB   [ 2]  374 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009FE1 CD 84 CE         [ 4]  375 	call FC_XON
      009FE4 CC 9F 5D         [ 2]  376 	jp INC_FPTR 
                                    377 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]



                                    378 ;---------------------------------------
                                    379 ; write a word at address pointed 
                                    380 ; by FPTR and increment FPTR 
                                    381 ; Expect pointer already initialzed 
                                    382 ; and memory unlocked 
                                    383 ; WR-WORD ( w -- )
                                    384 ;---------------------------------------
      009FE7 9F C4                  385 	.word LINK 
                           001F69   386 	LINK=.
      009FE9 07                     387 	.byte 7 
      009FEA 57 52 2D 57 4F 52 44   388 	.ascii "WR-WORD" 
      009FF1                        389 WR_WORD:
      009FF1 CD 84 E4         [ 4]  390 	call FC_XOFF
      009FF4 90 93            [ 1]  391 	ldw y,x
      009FF6 90 FE            [ 2]  392 	ldw y,(y)
      009FF8 1C 00 02         [ 2]  393 	addw x,#CELLL 
      009FFB 90 9E            [ 1]  394 	ld a,yh 
      009FFD 92 BD 00 34      [ 4]  395 	ldf [FPTR],a
      00A001 72 05 50 5F FB   [ 2]  396 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      00A006 CD 9F 5D         [ 4]  397 	call INC_FPTR 
      00A009 90 9F            [ 1]  398 	ld a,yl 
      00A00B 92 BD 00 34      [ 4]  399 	ldf [FPTR],a
      00A00F 72 05 50 5F FB   [ 2]  400 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      00A014 CD 84 CE         [ 4]  401 	call FC_XON
      00A017 CC 9F 5D         [ 2]  402 	jp INC_FPTR 
                                    403 
                                    404 
                                    405 ;---------------------------------------
                                    406 ; write a byte to FLASH or EEPROM/OPTION  
                                    407 ; EEC!  (c ud -- )
                                    408 ;---------------------------------------
      00A01A 9F E9                  409     .word LINK 
                           001F9C   410 	LINK=.
      00A01C 04                     411     .byte 4 
      00A01D 45 45 43 21            412     .ascii "EEC!"
                                    413 	; local variables 
                           000001   414 	BTW = 1   ; byte to write offset on stack
                           000002   415     OPT = 2 
                           000002   416 	VSIZE = 2
      00A021                        417 EECSTORE:
      00A021 52 02            [ 2]  418 	sub sp,#VSIZE
      00A023 CD 9D E3         [ 4]  419     call FPSTOR
      00A026 E6 01            [ 1]  420 	ld a,(1,x)
      00A028 43               [ 1]  421 	cpl a 
      00A029 6B 01            [ 1]  422 	ld (BTW,sp),a ; byte to write 
      00A02B 0F 02            [ 1]  423 	clr (OPT,sp)  ; OPTION flag
      00A02D CD 9F 21         [ 4]  424 	call UNLOCK 
                                    425 	; check if option
      00A030 3D 34            [ 1]  426 	tnz FPTR 
      00A032 26 19            [ 1]  427 	jrne 2$
      00A034 90 BE 35         [ 2]  428 	ldw y,PTR16 
      00A037 90 A3 48 00      [ 2]  429 	cpw y,#OPTION_BASE
      00A03B 2B 10            [ 1]  430 	jrmi 2$
      00A03D 90 A3 48 80      [ 2]  431 	cpw y,#OPTION_END+1
      00A041 2A 0A            [ 1]  432 	jrpl 2$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 118.
Hexadecimal [24-Bits]



      00A043 03 02            [ 1]  433 	cpl (OPT,sp)
                                    434 	; OPTION WRITE require this UNLOCK 
      00A045 72 1E 50 5B      [ 1]  435     bset FLASH_CR2,#FLASH_CR2_OPT
      00A049 72 1F 50 5C      [ 1]  436     bres FLASH_NCR2,#FLASH_CR2_OPT 
      00A04D                        437 2$: 
      00A04D CD 9F CC         [ 4]  438 	call WR_BYTE 	
      00A050 0D 02            [ 1]  439 	tnz (OPT,sp)
      00A052 27 0D            [ 1]  440 	jreq 3$ 
      00A054 7B 01            [ 1]  441     ld a,(BTW,sp)
      00A056 90 5F            [ 1]  442     clrw y
      00A058 90 97            [ 1]  443 	ld yl,a 
      00A05A 1D 00 02         [ 2]  444 	subw x,#CELLL 
      00A05D FF               [ 2]  445 	ldw (x),y 
      00A05E CD 9F CC         [ 4]  446 	call WR_BYTE
      00A061                        447 3$: 
      00A061 CD 9F 49         [ 4]  448 	call LOCK 
      00A064 5B 02            [ 2]  449 	addw sp,#VSIZE 
      00A066 81               [ 4]  450     ret
                                    451 
                                    452 ;------------------------------
                                    453 ; write integer in FLASH|EEPROM
                                    454 ; EE! ( n ud -- )
                                    455 ;------------------------------
      00A067 A0 1C                  456 	.word LINK 
                           001FE9   457 	LINK=.
      00A069 03                     458 	.byte 3 
      00A06A 45 45 21               459 	.ascii "EE!"
      00A06D                        460 EESTORE:
      00A06D CD 9D E3         [ 4]  461 	call FPSTOR 
      00A070 CD 9F 21         [ 4]  462 	call UNLOCK 
      00A073 90 93            [ 1]  463 	ldw y,x 
      00A075 90 FE            [ 2]  464 	ldw y,(y)
      00A077 90 89            [ 2]  465 	pushw y 
      00A079 90 5E            [ 1]  466 	swapw y 
      00A07B FF               [ 2]  467 	ldw (x),y 
      00A07C CD 9F CC         [ 4]  468 	call WR_BYTE 
      00A07F 90 85            [ 2]  469 	popw y 
      00A081 1D 00 02         [ 2]  470 	subw x,#CELLL
      00A084 FF               [ 2]  471 	ldw (x),y 
      00A085 CD 9F CC         [ 4]  472 	call WR_BYTE
      00A088 CC 9F 49         [ 2]  473 	jp LOCK 
                                    474 
                                    475 
                                    476 ;----------------------------
                                    477 ; Erase flash memory row 
                                    478 ; stm8s208 as 128 bytes rows
                                    479 ; ROW-ERASE ( ud -- )
                                    480 ;----------------------------
      00A08B A0 69                  481 	.word LINK 
                           00200D   482 	LINK=. 
      00A08D 09                     483 	.byte 9 
      00A08E 52 4F 57 2D 45 52 41   484 	.ascii "ROW-ERASE" 
             53 45
      00A097                        485 row_erase:
      00A097 CD 84 E4         [ 4]  486 	call FC_XOFF
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 119.
Hexadecimal [24-Bits]



      00A09A CD 9D E3         [ 4]  487 	call FPSTOR
                                    488 ;code must be execute from RAM 
                                    489 ;copy routine to PAD 
      00A09D 1D 00 02         [ 2]  490 	subw x,#CELLL 
      00A0A0 90 AE A0 F0      [ 2]  491 	ldw y,#row_erase_proc
      00A0A4 FF               [ 2]  492 	ldw (x),y 
      00A0A5 CD 8D 7A         [ 4]  493 	call PAD 
      00A0A8 90 AE A1 17      [ 2]  494 	ldw y,#row_erase_proc_end 
      00A0AC 72 A2 A0 F0      [ 2]  495 	subw y,#row_erase_proc
      00A0B0 1D 00 02         [ 2]  496 	subw x,#CELLL 
      00A0B3 FF               [ 2]  497 	ldw (x),y 
      00A0B4 CD 8D B6         [ 4]  498 	call CMOVE 
      00A0B7                        499 block_erase:
      00A0B7 90 BE 35         [ 2]  500 	ldw y,FPTR+1
      00A0BA 90 A3 B0 80      [ 2]  501 	cpw y,#app_space 
      00A0BE 2A 19            [ 1]  502 	jrpl erase_flash 
                                    503 ; erase EEPROM block
      00A0C0 90 A3 40 00      [ 2]  504 	cpw y,#EEPROM_BASE 
      00A0C4 24 04            [ 1]  505 	jruge 1$
      00A0C6 CD 84 CE         [ 4]  506 	call FC_XON
      00A0C9 81               [ 4]  507 	ret ; bad address 
      00A0CA 90 A3 47 FF      [ 2]  508 1$: cpw y,#EEPROM_END 
      00A0CE 23 04            [ 2]  509 	jrule 2$ 
      00A0D0 CD 84 CE         [ 4]  510 	call FC_XON
      00A0D3 81               [ 4]  511 	ret ; bad address 
      00A0D4                        512 2$:	
      00A0D4 CD 9E E3         [ 4]  513 	call UNLKEE 
      00A0D7 20 03            [ 2]  514 	jra proceed_erase
                                    515 ; erase flash block:
      00A0D9                        516 erase_flash:
      00A0D9 CD 9F 02         [ 4]  517 	call UNLKFL 
      00A0DC                        518 proceed_erase:
      00A0DC CD 8D 7A         [ 4]  519 	call PAD 
      00A0DF 90 93            [ 1]  520 	ldw y,x
      00A0E1 90 FE            [ 2]  521 	ldw y,(y)
      00A0E3 1C 00 02         [ 2]  522 	addw x,#CELLL  
      00A0E6 90 FD            [ 4]  523 	call (y) 
      00A0E8 72 17 50 5F      [ 1]  524 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      00A0EC CD 84 CE         [ 4]  525 	call FC_XON
      00A0EF 81               [ 4]  526 	ret 
                                    527 
                                    528 ; this routine is to be copied to PAD 
      00A0F0                        529 row_erase_proc:
      00A0F0 35 20 50 5B      [ 1]  530 	mov FLASH_CR2,#(1<<FLASH_CR2_ERASE) 
      00A0F4 35 DF 50 5C      [ 1]  531 	mov FLASH_NCR2,#~(1<<FLASH_CR2_ERASE)
      00A0F8 4F               [ 1]  532 	clr a 
      00A0F9 90 5F            [ 1]  533 	clrw y 
      00A0FB 91 A7 00 34      [ 1]  534 	ldf ([FPTR],y),a
      00A0FF 90 5C            [ 1]  535     incw y
      00A101 91 A7 00 34      [ 1]  536 	ldf ([FPTR],y),a
      00A105 90 5C            [ 1]  537     incw y
      00A107 91 A7 00 34      [ 1]  538 	ldf ([FPTR],y),a
      00A10B 90 5C            [ 1]  539     incw y
      00A10D 91 A7 00 34      [ 1]  540 	ldf ([FPTR],y),a
      00A111 72 05 50 5F FB   [ 2]  541 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 120.
Hexadecimal [24-Bits]



      00A116 81               [ 4]  542 	ret
      00A117                        543 row_erase_proc_end:
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
      00A117                        556 copy_buffer:
      00A117 4B 80            [ 1]  557 	push #BLOCK_SIZE  
                                    558 ;enable block programming 
      00A119 72 10 50 5B      [ 1]  559 	bset FLASH_CR2,#FLASH_CR2_PRG 
      00A11D 72 11 50 5C      [ 1]  560 	bres FLASH_NCR2,#FLASH_CR2_PRG
      00A121 90 5F            [ 1]  561 	clrw y
      00A123 F6               [ 1]  562 1$:	ld a,(x)
      00A124 91 A7 00 34      [ 1]  563 	ldf ([FPTR],y),a
      00A128 5C               [ 1]  564 	incw x 
      00A129 90 5C            [ 1]  565 	incw y 
      00A12B 0A 01            [ 1]  566 	dec (BCNT,sp)
      00A12D 26 F4            [ 1]  567 	jrne 1$
                                    568 ; wait EOP bit 
      00A12F 72 05 50 5F FB   [ 2]  569 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. 
      00A134 84               [ 1]  570 	pop a ; remove BCNT from stack 
      00A135 81               [ 4]  571 	ret 
      00A136                        572 copy_buffer_end:
                                    573 
                                    574 ;-------------------------
                                    575 ; move program_row to RAM 
                                    576 ; in TIB 
                                    577 ;------------------------
      00A136                        578 copy_prog_to_ram:
      00A136 1D 00 06         [ 2]  579 	subw x,#6
      00A139 90 AE A1 17      [ 2]  580 	ldw y,#copy_buffer 
      00A13D EF 04            [ 2]  581 	ldw (4,x),y 
      00A13F 90 AE 17 00      [ 2]  582 	ldw y,#TIBBASE
      00A143 EF 02            [ 2]  583 	ldw (2,x),y 
      00A145 90 AE A1 36      [ 2]  584 	ldw y,#copy_buffer_end 
      00A149 72 A2 A1 17      [ 2]  585 	subw y,#copy_buffer  
      00A14D FF               [ 2]  586 	ldw (x),y 
      00A14E CD 8D B6         [ 4]  587 	call CMOVE 
      00A151 81               [ 4]  588 	ret 
                                    589 
                                    590 
                                    591 ;-----------------------------
                                    592 ; write a row in FLASH/EEPROM 
                                    593 ; WR-ROW ( a ud -- )
                                    594 ; a -> address 128 byte buffer to write 
                                    595 ; ud ->  row address in FLASH|EEPROM 
                                    596 ;-----------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 121.
Hexadecimal [24-Bits]



      00A152 A0 8D                  597 	.word LINK 
                           0020D4   598 	LINK=.
      00A154 06                     599 	.byte 6 
      00A155 57 52 2D 52 4F 57      600 	.ascii "WR-ROW"
      00A15B                        601 write_row:
      00A15B CD 84 E4         [ 4]  602 	call FC_XOFF
      00A15E CD 9D E3         [ 4]  603 	call FPSTOR
                                    604 ; align to FLASH block 
      00A161 A6 80            [ 1]  605 	ld a,#0x80 
      00A163 B4 36            [ 1]  606 	and a,PTR8 
      00A165 B7 36            [ 1]  607 	ld PTR8,a  
      00A167 CD A1 36         [ 4]  608 	call copy_prog_to_ram
      00A16A CD 9F 21         [ 4]  609 	call UNLOCK
      00A16D 90 93            [ 1]  610 	ldw y,x 
      00A16F 90 FE            [ 2]  611 	ldw y,(y)
      00A171 1C 00 02         [ 2]  612 	addw x,#CELLL 
      00A174 89               [ 2]  613 	pushw x 
      00A175 93               [ 1]  614 	ldw x,y ; buffer address in x 
      00A176 CD 17 00         [ 4]  615 	call TIBBASE
      00A179 CD 9F 49         [ 4]  616 	call LOCK
      00A17C 85               [ 2]  617 	popw x 
      00A17D CD 84 CE         [ 4]  618 	call FC_XON 
      00A180 81               [ 4]  619 	ret 
                                    620 
                                    621 ;-------------------------------------
                                    622 ; change value of OPTION register 
                                    623 ; SET-OPT (c n -- ) 
                                    624 ; c new value.
                                    625 ; n OPT  number {1..7}
                                    626 ;--------------------------------------
      00A181 A1 54                  627 		.word LINK 
                           002103   628 		LINK=.
      00A183 07                     629 		.byte 7 
      00A184 53 45 54 2D 4F 50 54   630 		.ascii "SET-OPT" 
      00A18B                        631 set_option: 
      00A18B 90 93            [ 1]  632 		ldw y,x 
      00A18D 90 FE            [ 2]  633 		ldw y,(y)
      00A18F 27 06            [ 1]  634 		jreq 1$
      00A191 90 A3 00 07      [ 2]  635 		cpw y,#7 
      00A195 23 04            [ 2]  636 		jrule 2$ 
                                    637 ; invalid OPTION number 		
      00A197 1C 00 04         [ 2]  638 1$:		addw x,#2*CELLL
      00A19A 81               [ 4]  639 		ret
      00A19B 90 58            [ 2]  640 2$:		sllw y 
      00A19D 72 A9 47 FF      [ 2]  641 		addw y,#OPTION_BASE-1
      00A1A1 FF               [ 2]  642 		ldw (x),y 
      00A1A2 1D 00 02         [ 2]  643 		subw x,#CELLL 
      00A1A5 90 5F            [ 1]  644 		clrw y 
      00A1A7 FF               [ 2]  645 		ldw (x),y 
      00A1A8 CD A0 21         [ 4]  646 		call EECSTORE
      00A1AB 81               [ 4]  647 		ret 
                                    648 
                                    649 
                                    650 
                                    651 ;--------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 122.
Hexadecimal [24-Bits]



                                    652 ; reset system to its original state 
                                    653 ; before any user modification
                                    654 ; PRISTINE ( -- )
                                    655 ;-------------------------------------
      00A1AC A1 83                  656 	.word LINK  
                           00212E   657 	LINK=.
      00A1AE 08                     658 	.byte 8 
      00A1AF 50 52 49 53 54 49 4E   659 	.ascii "PRISTINE"
             45
      00A1B7                        660 pristine:
                                    661 ;;; erase EEPROM
      00A1B7 CD 9E 02         [ 4]  662 	call EEPROM 
      00A1BA CD 88 A8         [ 4]  663 1$:	call DDUP 
      00A1BD CD A0 97         [ 4]  664 	call row_erase
      00A1C0 90 93            [ 1]  665 	ldw y,x 
      00A1C2 90 EE 02         [ 2]  666 	ldw y,(2,y)
      00A1C5 72 A9 00 80      [ 2]  667 	addw y,#BLOCK_SIZE
      00A1C9 EF 02            [ 2]  668 	ldw (2,x),y
      00A1CB 90 A3 48 00      [ 2]  669 	cpw y,#OPTION_BASE 
      00A1CF 25 E9            [ 1]  670 	jrult 1$
                                    671 ;;; reset OPTION to default values
      00A1D1 90 AE 00 01      [ 2]  672 	ldw y,#1 ; OPT1 
      00A1D5 FF               [ 2]  673 2$:	ldw (x),y   
      00A1D6 90 5F            [ 1]  674 	clrw y 
      00A1D8 EF 02            [ 2]  675 	ldw (2,x),y  ; ( 0 1 -- ) 
      00A1DA CD 88 A8         [ 4]  676 	call DDUP    ; ( 0 1 0 1 -- )  
      00A1DD CD A1 8B         [ 4]  677 	call set_option
      00A1E0 90 93            [ 1]  678 	ldw y,x 
      00A1E2 90 FE            [ 2]  679 	ldw y,(y)
      00A1E4 90 5C            [ 1]  680 	incw y  ; next OPTION 
      00A1E6 90 A3 00 08      [ 2]  681 	cpw y,#8 
      00A1EA 25 E9            [ 1]  682 	jrult 2$
                                    683 ;;; erase first row of app_space 	
      00A1EC 90 AE B0 80      [ 2]  684 	ldw y,#app_space
      00A1F0 EF 02            [ 2]  685 	ldw (2,x),y  
      00A1F2 90 5F            [ 1]  686 	clrw y 
      00A1F4 FF               [ 2]  687 	ldw (x),y ; ( app_space 0 -- )
      00A1F5 CD A0 97         [ 4]  688 	call row_erase 
                                    689 ; reset interrupt vectors 
      00A1F8 1D 00 02         [ 2]  690 	subw x,#CELLL 
      00A1FB 90 5F            [ 1]  691 	clrw y  
      00A1FD FF               [ 2]  692 4$:	ldw (x),y  ; ( n -- ) int# 
      00A1FE CD 86 9A         [ 4]  693 	call DUPP  
      00A201 CD A2 1E         [ 4]  694 	call reset_vector
      00A204 90 93            [ 1]  695 	ldw y,x 
      00A206 90 FE            [ 2]  696 	ldw y,(y)
      00A208 90 5C            [ 1]  697 	incw y   ; next vector 
      00A20A 90 A3 00 19      [ 2]  698 	cpw y,#25 
      00A20E 25 ED            [ 1]  699 	jrult 4$
      00A210 CC 80 80         [ 2]  700 	jp NonHandledInterrupt ; reset MCU
                                    701 
                                    702 ;------------------------------
                                    703 ; reset an interrupt vector 
                                    704 ; to its initial value 
                                    705 ; i.e. NonHandledInterrupt
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 123.
Hexadecimal [24-Bits]



                                    706 ; RST-IVEC ( n -- )
                                    707 ;-----------------------------
      00A213 A1 AE                  708 	.word LINK 
                           002195   709 	LINK=. 
      00A215 08                     710 	.byte 8 
      00A216 52 53 54 2D 49 56 45   711 	.ascii "RST-IVEC"
             43
      00A21E                        712 reset_vector:
      00A21E 90 93            [ 1]  713 	ldw y,x
      00A220 1C 00 02         [ 2]  714 	addw x,#CELLL 
      00A223 90 FE            [ 2]  715 	ldw y,(y)
      00A225 90 A3 00 17      [ 2]  716 	cpw y,#23 
      00A229 27 3A            [ 1]  717 	jreq 9$
      00A22B 90 A3 00 1D      [ 2]  718 	cpw y,#29 ; last vector
      00A22F 22 34            [ 1]  719 	jrugt 9$  
      00A231 90 58            [ 2]  720 	sllw y 
      00A233 90 58            [ 2]  721 	sllw y 
      00A235 72 A9 80 08      [ 2]  722 	addw y,#0x8008 ; irq0 address 
      00A239 90 BF 26         [ 2]  723 	ldw YTEMP,y
      00A23C 1D 00 06         [ 2]  724 	subw x,#3*CELLL 
      00A23F EF 02            [ 2]  725 	ldw (2,x),y 
      00A241 90 5F            [ 1]  726 	clrw y
      00A243 FF               [ 2]  727 	ldw (x),y 
      00A244 A6 82            [ 1]  728 	ld a,#0x82 
      00A246 90 95            [ 1]  729 	ld yh,a
      00A248 EF 04            [ 2]  730 	ldw (4,x),y
      00A24A CD A0 6D         [ 4]  731 	call EESTORE
      00A24D 1D 00 06         [ 2]  732 	subw x,#3*CELLL
      00A250 90 5F            [ 1]  733 	clrw y 
      00A252 FF               [ 2]  734 	ldw (x),y 
      00A253 90 AE 80 80      [ 2]  735 	ldw y,#NonHandledInterrupt
      00A257 EF 04            [ 2]  736 	ldw (4,x),y 
      00A259 90 BE 26         [ 2]  737 	ldw y,YTEMP  
      00A25C 72 A9 00 02      [ 2]  738 	addw y,#2
      00A260 EF 02            [ 2]  739 	ldw (2,x),y 
      00A262 CD A0 6D         [ 4]  740 	call EESTORE
      00A265 81               [ 4]  741 9$:	ret 
                                    742 
                                    743 
                                    744 ;------------------------------
                                    745 ; all interrupt vector with 
                                    746 ; an address >= a are resetted 
                                    747 ; to default
                                    748 ; CHKIVEC ( a -- )
                                    749 ;------------------------------
      00A266 A2 15                  750 	.word LINK 
                           0021E8   751 	LINK=.
      00A268 07                     752 	.byte 7
      00A269 43 48 4B 49 56 45 43   753 	.ascii "CHKIVEC"
                                    754 ;local variables 
                           000001   755 	SSP=1
                           000003   756 	CADR=3
                           000005   757 	OFS=5
                           000006   758 	VSIZE=6  
      00A270                        759 CHKIVEC:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 124.
Hexadecimal [24-Bits]



      00A270 52 06            [ 2]  760 	sub sp,#VSIZE ;alloc local variables 
      00A272 90 93            [ 1]  761 	ldw y,x 
      00A274 90 FE            [ 2]  762 	ldw y,(y)
      00A276 17 03            [ 2]  763 	ldw (CADR,sp),y ; ca 
      00A278 1F 01            [ 2]  764 	ldw (SSP,sp),x 
      00A27A AE 80 0A         [ 2]  765 	ldw x,#0x800a ; irq0 address 
      00A27D BF 35            [ 2]  766 	ldw PTR16,X
      00A27F AE FF FC         [ 2]  767 	ldw x,#-4 
      00A282 1C 00 04         [ 2]  768 1$:	addw x,#4
      00A285 A3 00 78         [ 2]  769 	cpw x,#30*4 ; irq0-29 
      00A288 27 22            [ 1]  770 	jreq 9$
      00A28A 90 93            [ 1]  771 	ldw y,x  
      00A28C 91 D6 35         [ 4]  772 	ld a,([PTR16],y)
      00A28F 11 03            [ 1]  773 	cp a,(CADR,sp)
      00A291 25 EF            [ 1]  774 	jrult 1$
      00A293 90 5C            [ 1]  775 	incw y 
      00A295 91 D6 35         [ 4]  776 	ld a,([PTR16],y)
      00A298 11 04            [ 1]  777 	cp a,(CADR+1,sp) 
      00A29A 25 E6            [ 1]  778 	jrult 1$ 
      00A29C 1F 05            [ 2]  779 	ldw (OFS,sp),x 
      00A29E 54               [ 2]  780 	srlw x
      00A29F 54               [ 2]  781 	srlw x 
      00A2A0 90 93            [ 1]  782 	ldw y,x 
      00A2A2 1E 01            [ 2]  783 	ldw x,(SSP,sp)
      00A2A4 FF               [ 2]  784 	ldw (x),y
      00A2A5 CD A2 1E         [ 4]  785 	call reset_vector
      00A2A8 1E 05            [ 2]  786 	ldw x,(OFS,sp) 
      00A2AA 20 D6            [ 2]  787 	jra 1$
      00A2AC 1E 01            [ 2]  788 9$:	ldw x,(SSP,sp) 
      00A2AE 1C 00 02         [ 2]  789 	addw x,#CELLL 
      00A2B1 5B 06            [ 2]  790 	addw sp,#VSIZE ; drop local variables  
      00A2B3 81               [ 4]  791 	ret 
                                    792 
                                    793 ;------------------------------
                                    794 ; set interrupt vector 
                                    795 ; SET-IVEC ( ud n -- )
                                    796 ;  ud Handler address
                                    797 ;  n  vector # 0 .. 29 
                                    798 ;-----------------------------
      00A2B4 A2 68                  799 	.word LINK
                           002236   800 	LINK=.
      00A2B6 08                     801 	.byte 8 
      00A2B7 53 45 54 2D 49 56 45   802 	.ascii "SET-IVEC" 
             43
      00A2BF                        803 set_vector:
      00A2BF 90 93            [ 1]  804     ldw y,x 
      00A2C1 1C 00 02         [ 2]  805 	addw x,#CELLL 
      00A2C4 90 FE            [ 2]  806 	ldw y,(y) ; vector #
      00A2C6 90 A3 00 1D      [ 2]  807 	cpw y,#29 ; last vector
      00A2CA 23 04            [ 2]  808 	jrule 2$
      00A2CC 1C 00 04         [ 2]  809 	addw x,#2*CELLL 
      00A2CF 81               [ 4]  810 	ret
      00A2D0 90 58            [ 2]  811 2$:	sllw y 
      00A2D2 90 58            [ 2]  812 	sllw y 
      00A2D4 72 A9 80 08      [ 2]  813 	addw y,#0X8008 ; IRQ0 vector address 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 125.
Hexadecimal [24-Bits]



      00A2D8 90 BF 26         [ 2]  814 	ldw YTEMP,y ; vector address 
      00A2DB A6 82            [ 1]  815 	ld a,#0x82 
      00A2DD 90 95            [ 1]  816 	ld yh,a 
      00A2DF E6 01            [ 1]  817 	ld a,(1,x) ; isr address bits 23..16 
      00A2E1 90 97            [ 1]  818 	ld yl,a 
                                    819 ;  write 0x82 + most significant byte of int address	
      00A2E3 1D 00 06         [ 2]  820 	subw x,#3*CELLL 
      00A2E6 EF 04            [ 2]  821 	ldw (4,x),y 
      00A2E8 90 BE 26         [ 2]  822 	ldw y,YTEMP
      00A2EB EF 02            [ 2]  823 	ldw (2,x),y ; vector address 
      00A2ED 90 5F            [ 1]  824 	clrw y 
      00A2EF FF               [ 2]  825 	ldw (x),y   ; as a double 
      00A2F0 CD A0 6D         [ 4]  826 	call EESTORE 
      00A2F3 90 93            [ 1]  827 	ldw y,x 
      00A2F5 90 EE 02         [ 2]  828 	ldw y,(2,y) ; bits 15..0 int vector 
      00A2F8 1D 00 06         [ 2]  829 	subw x,#3*CELLL 
      00A2FB EF 04            [ 2]  830 	ldw (4,x),y 
      00A2FD 90 BE 26         [ 2]  831 	ldw y,YTEMP 
      00A300 72 A9 00 02      [ 2]  832 	addw y,#2 
      00A304 EF 02            [ 2]  833 	ldw (2,x),y 
      00A306 90 5F            [ 1]  834 	clrw y 
      00A308 FF               [ 2]  835 	ldw (x),y 
      00A309 CD A0 6D         [ 4]  836 	call EESTORE
      00A30C 1C 00 04         [ 2]  837 	addw x,#2*CELLL  
      00A30F 81               [ 4]  838 9$: ret 
                                    839 
                                    840 
                                    841 ;------------------------
                                    842 ; Compile word to flash
                                    843 ; EE, (w -- )
                                    844 ;-----------------------
      00A310 A2 B6                  845 	.word LINK
                           002292   846 	LINK=.
      00A312 03                     847 	.byte 3
      00A313 45 45 2C               848 	.ascii "EE,"
      00A316                        849 EE_COMMA:
      00A316 1D 00 04         [ 2]  850 	subw x,#2*CELLL 
      00A319 90 BE 1A         [ 2]  851 	ldw y,UCP
      00A31C 90 89            [ 2]  852 	pushw y 
      00A31E EF 02            [ 2]  853 	ldw (2,x),y 
      00A320 90 5F            [ 1]  854 	clrw y 
      00A322 FF               [ 2]  855 	ldw (x),y
      00A323 CD A0 6D         [ 4]  856 	call EESTORE
      00A326 90 85            [ 2]  857 	popw y 
      00A328 72 A9 00 02      [ 2]  858 	addw y,#2
      00A32C 90 BF 1A         [ 2]  859 	ldw UCP,y
      00A32F 81               [ 4]  860 	ret 
                                    861 
                                    862 
                                    863 ;-------------------------
                                    864 ; Compile byte to flash 
                                    865 ; EEC, ( c -- )	
                                    866 ;-------------------------
      00A330 A3 12                  867 	.word LINK 
                           0022B2   868 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 126.
Hexadecimal [24-Bits]



      00A332 04                     869 	.byte 4 
      00A333 45 45 43 2C            870 	.ascii "EEC,"
      00A337                        871 EE_CCOMMA:
      00A337 1D 00 04         [ 2]  872 	subw x,#2*CELLL 
      00A33A 90 BE 1A         [ 2]  873 	ldw y,UCP
      00A33D 90 89            [ 2]  874 	pushw y 
      00A33F EF 02            [ 2]  875 	ldw (2,x),y 
      00A341 90 5F            [ 1]  876 	clrw y 
      00A343 FF               [ 2]  877 	ldw (x),y
      00A344 CD A0 21         [ 4]  878 	call EECSTORE
      00A347 90 85            [ 2]  879 	popw y 
      00A349 90 5C            [ 1]  880 	incw y 
      00A34B 90 BF 1A         [ 2]  881 	ldw UCP,y
      00A34E 81               [ 4]  882 	ret 
                                    883 
                                    884 
                                    885 ;--------------------------
                                    886 ; copy FLASH block to ROWBUF
                                    887 ; ROW>BUF ( ud -- )
                                    888 ;--------------------------
      00A34F A3 32                  889 	.word LINK 
                           0022D1   890 	LINK=.
      00A351 07                     891 	.byte 7 
      00A352 52 4F 57 3E 42 55 46   892 	.ascii "ROW>BUF"
      00A359                        893 ROW2BUF: 
      00A359 CD 9D E3         [ 4]  894 	call FPSTOR 
      00A35C A6 80            [ 1]  895 	ld a,#BLOCK_SIZE
      00A35E 88               [ 1]  896 	push a 
      00A35F B4 36            [ 1]  897 	and a,PTR8 ; block align 
      00A361 B7 36            [ 1]  898 	ld PTR8,a
      00A363 90 AE 16 80      [ 2]  899 	ldw y,#ROWBUFF 
      00A367 92 BC 00 34      [ 5]  900 1$: ldf a,[FPTR]
      00A36B 90 F7            [ 1]  901 	ld (y),a
      00A36D CD 9F 5D         [ 4]  902 	call INC_FPTR
      00A370 90 5C            [ 1]  903 	incw y 
      00A372 0A 01            [ 1]  904 	dec (1,sp)
      00A374 26 F1            [ 1]  905 	jrne 1$ 
      00A376 84               [ 1]  906 	pop a 
      00A377 81               [ 4]  907 	ret 
                                    908 
                                    909 
                                    910 ;---------------------------
                                    911 ; copy ROWBUFF to flash 
                                    912 ; BUF>ROW ( ud -- )
                                    913 ; ud is row address as double 
                                    914 ;---------------------------
      00A378 A3 51                  915 	.word LINK 
                           0022FA   916 	LINK=.
      00A37A 07                     917 	.byte 7 
      00A37B 42 55 46 3E 52 4F 57   918 	.ascii "BUF>ROW" 
      00A382                        919 BUF2ROW:
      00A382 CD 87 9E         [ 4]  920 	call TBUF ; ( ud rb -- )
      00A385 CD 88 5E         [ 4]  921 	call ROT 
      00A388 CD 88 5E         [ 4]  922 	call ROT  ; ( rb ud -- )
      00A38B CD A1 5B         [ 4]  923 	call write_row 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 127.
Hexadecimal [24-Bits]



      00A38E 81               [ 4]  924 	ret 
                                    925 
                                    926 ;---------------------------------
                                    927 ; how many byte free in that row 
                                    928 ; RFREE ( a -- n )
                                    929 ; a is least byte of target address
                                    930 ;----------------------------------
      00A38F A3 7A                  931 	.word LINK 
                           002311   932 	LINK=.
      00A391 05                     933 	.byte 5 
      00A392 52 46 52 45 45         934 	.ascii "RFREE"
      00A397                        935 RFREE:
      00A397 E6 01            [ 1]  936 	ld a,(1,x)
      00A399 A4 7F            [ 1]  937 	and a,#BLOCK_SIZE-1 
      00A39B B7 26            [ 1]  938 	ld YTEMP,a 
      00A39D A6 80            [ 1]  939 	ld a,#BLOCK_SIZE 
      00A39F B0 26            [ 1]  940 	sub a,YTEMP 
      00A3A1 90 5F            [ 1]  941 	clrw y 
      00A3A3 90 97            [ 1]  942 	ld yl,a
      00A3A5 FF               [ 2]  943 	ldw (x),y 
      00A3A6 81               [ 4]  944 	ret 
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
      00A3A7 A3 91                  955 	.word LINK 
                           002329   956 	LINK=. 
      00A3A9 06                     957 	.byte 6
      00A3AA 52 41 4D 3E 45 45      958 	.ascii "RAM>EE"
                                    959 	
      00A3B0                        960 RAM2EE:
                                    961 ; copy ud on top 
      00A3B0 90 93            [ 1]  962 	ldw y,x 
      00A3B2 90 EE 06         [ 2]  963 	ldw y,(6,y) ; LSW of ud  
      00A3B5 90 BF 26         [ 2]  964 	ldw YTEMP,y 
      00A3B8 90 93            [ 1]  965 	ldw y,x 
      00A3BA 90 EE 04         [ 2]  966 	ldw y,(4,y)  ; MSW of ud 
      00A3BD 1D 00 04         [ 2]  967 	subw x,#2*CELLL 
      00A3C0 FF               [ 2]  968 	ldw (x),y 
      00A3C1 90 BE 26         [ 2]  969 	ldw y,YTEMP 
      00A3C4 EF 02            [ 2]  970 	ldw (2,x),y 
      00A3C6 CD A3 59         [ 4]  971 	call ROW2BUF 
      00A3C9 90 93            [ 1]  972 	ldw y,x 
      00A3CB 90 EE 06         [ 2]  973 	ldw y,(6,y)
      00A3CE 90 89            [ 2]  974 	pushw y ; udl 
      00A3D0 90 9F            [ 1]  975 	ld a,yl
      00A3D2 A4 7F            [ 1]  976 	and a,#BLOCK_SIZE-1 
      00A3D4 90 5F            [ 1]  977 	clrw y 
      00A3D6 90 97            [ 1]  978 	ld yl,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 128.
Hexadecimal [24-Bits]



      00A3D8 72 A9 16 80      [ 2]  979 	addw y,#ROWBUFF 
      00A3DC 1D 00 02         [ 2]  980 	subw x,#CELLL 
      00A3DF FF               [ 2]  981 	ldw (x),y  
      00A3E0 CD 86 AA         [ 4]  982 	call SWAPP ;  ( ud a ra u -- )
      00A3E3 CD 85 B5         [ 4]  983 	call RFROM  
      00A3E6 CD A3 97         [ 4]  984 	call RFREE 
      00A3E9 CD 8A 00         [ 4]  985 	call MIN
      00A3EC CD 86 9A         [ 4]  986 	call DUPP 
      00A3EF CD 86 63         [ 4]  987 	call TOR  
      00A3F2 CD 8D B6         [ 4]  988 	call CMOVE
      00A3F5 CD A3 82         [ 4]  989 	call BUF2ROW 
      00A3F8 CD 85 B5         [ 4]  990 	call RFROM 
      00A3FB 81               [ 4]  991 	ret 
                                    992 
                                    993 
                                    994 ;--------------------------
                                    995 ; expand 16 bit address 
                                    996 ; to 32 bit address 
                                    997 ; FADDR ( a -- ud )
                                    998 ;--------------------------
      00A3FC A3 A9                  999 	.word LINK 
                           00237E  1000 	LINK=. 
      00A3FE 05                    1001 	.byte 5 
      00A3FF 46 41 44 44 52        1002 	.ascii "FADDR"
      00A404                       1003 FADDR:
      00A404 CC 8C 8F         [ 2] 1004 	jp ZERO 
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
      00A407 A3 FE                 1020 	.word LINK 
                           002389  1021 	LINK=.
      00A409 05                    1022 	.byte 5 
      00A40A 46 4D 4F 56 45        1023 	.ascii "FMOVE" 
      00A40F                       1024 FMOVE:
      00A40F CD 87 B0         [ 4] 1025 	call TFLASH 
      00A412 CD 85 64         [ 4] 1026 	CALL AT 
      00A415 CD 85 19         [ 4] 1027 	CALL QBRAN 
      00A418 A4 93                 1028 	.word no_move  
      00A41A CD 87 FF         [ 4] 1029 	call CPP
      00A41D CD 85 64         [ 4] 1030 	call AT  
      00A420 CD 86 9A         [ 4] 1031 	call DUPP ; ( udl udl -- )
      00A423 CD 87 E3         [ 4] 1032 	call CNTXT 
      00A426 CD 85 64         [ 4] 1033 	call AT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 129.
Hexadecimal [24-Bits]



      00A429 CD 84 F0         [ 4] 1034 	call DOLIT 
      00A42C 00 02                 1035 	.word 2 
      00A42E CD 89 53         [ 4] 1036 	call SUBB ; ( udl udl a -- )
      00A431 CD 86 AA         [ 4] 1037 	call SWAPP 
      00A434 CD A4 04         [ 4] 1038 	call FADDR 
      00A437 CD 88 5E         [ 4] 1039 	call ROT  ; ( udl ud a -- )
      00A43A CD 86 9A         [ 4] 1040 	call DUPP 
      00A43D CD 86 63         [ 4] 1041 	call TOR    ; R: a 
      00A440                       1042 FMOVE2: 
      00A440 CD 8D 69         [ 4] 1043 	call HERE 
      00A443 CD 85 C6         [ 4] 1044 	call RAT 
      00A446 CD 89 53         [ 4] 1045 	call SUBB ; (udl ud a wl -- )
      00A449                       1046 next_row:
      00A449 CD 86 9A         [ 4] 1047 	call DUPP 
      00A44C CD 86 63         [ 4] 1048 	call TOR  ; ( udl ud a wl -- ) R: a wl
      00A44F CD A3 B0         [ 4] 1049 	call RAM2EE ; ( udl a u -- udl u2 ) u2 is byte written to FLASH 
      00A452 CD 86 9A         [ 4] 1050 	call DUPP 
      00A455 CD 86 63         [ 4] 1051 	call TOR
      00A458 CD 88 BD         [ 4] 1052 	call PLUS  ; ( udl+ ) 
      00A45B CD 86 9A         [ 4] 1053 	call DUPP 
      00A45E CD 8C 8F         [ 4] 1054 	call ZERO   ; ( udl+ ud -- )
      00A461 CD 85 B5         [ 4] 1055 	call RFROM  ; ( udl+ ud u2  R: a wl ) 
      00A464 CD 85 B5         [ 4] 1056 	call RFROM  ; ( udl+ ud u2 wl R: a ) 
      00A467 CD 86 C2         [ 4] 1057 	call OVER   ; ( udl+ ud u2 wl u2 -- )
      00A46A CD 89 53         [ 4] 1058 	call SUBB  ; ( udl+ ud u2 wl- R: a )
      00A46D CD 86 9A         [ 4] 1059 	call DUPP 
      00A470 CD 85 19         [ 4] 1060 	call QBRAN
      00A473 A4 8C                 1061 	.word fmove_done 
      00A475 CD 86 AA         [ 4] 1062 	call SWAPP  ; ( udl+ ud wl- u2 R: a )
      00A478 CD 85 B5         [ 4] 1063 	call RFROM ; ( udl+ ud wl- u2 a -- ) 
      00A47B CD 88 BD         [ 4] 1064 	call PLUS  ; ( udl+2 ud wl- a+ )
      00A47E CD 86 9A         [ 4] 1065 	call DUPP 
      00A481 CD 86 63         [ 4] 1066 	call TOR   ; ( udl+2 ud wl- a+ ) R: a+
      00A484 CD 86 AA         [ 4] 1067 	call SWAPP 
      00A487 CD 85 35         [ 4] 1068 	call BRAN
      00A48A A4 49                 1069 	.word next_row  
      00A48C                       1070 fmove_done:	
      00A48C CD 85 B5         [ 4] 1071 	call RFROM  ; ( -- udl+ ud u2 wl- a  )
      00A48F 1C 00 0A         [ 2] 1072 	addw x,#5*CELLL ; (  -- cp+ ) new CP 
      00A492 81               [ 4] 1073  	ret  
      00A493                       1074 no_move:
      00A493 CD 8C 8F         [ 4] 1075 	call ZERO
      00A496 81               [ 4] 1076 	ret 
                                   1077 
                                   1078 ;------------------------------------------
                                   1079 ; adjust pointers after **FMOVE** operetion.
                                   1080 ; UPDAT-PTR ( cp+ -- )
                                   1081 ; cp+ is new CP position after FMOVE 
                                   1082 ;-------------------------------------------
      00A497 A4 09                 1083 	.word LINK 
                           002419  1084 	LINK=.
      00A499 09                    1085 	.byte 9
      00A49A 55 50 44 41 54 2D 50  1086 	.ascii "UPDAT-PTR" 
             54 52
      00A4A3                       1087 UPDATPTR:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 130.
Hexadecimal [24-Bits]



                                   1088 ;reset VP to previous position  
      00A4A3 CD 9E 5D         [ 4] 1089 	call EEPVP 
      002426                       1090 	_DROP 
      00A4A6 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00A4A9 CD 85 64         [ 4] 1091 	call AT
      00A4AC CD 87 F1         [ 4] 1092 	call VPP 
      00A4AF CD 85 52         [ 4] 1093 	call STORE
                                   1094 ;update CONTEXT and LAST 
      00A4B2 CD 9E 47         [ 4] 1095 	call EEPCP 
      002435                       1096 	_DROP
      00A4B5 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00A4B8 CD 85 64         [ 4] 1097 	call AT
      00A4BB CD 84 F0         [ 4] 1098 	call DOLIT 
      00A4BE 00 02                 1099 	.word 2 
      00A4C0 CD 88 BD         [ 4] 1100 	call PLUS 
      00A4C3 CD 86 9A         [ 4] 1101 	call DUPP 
      00A4C6 CD 87 E3         [ 4] 1102 	call CNTXT 
      00A4C9 CD 85 52         [ 4] 1103 	call STORE
      00A4CC CD 88 0F         [ 4] 1104 	call LAST
      00A4CF CD 85 52         [ 4] 1105 	call STORE 
      00A4D2 CD 9E 77         [ 4] 1106 	call UPDATLAST 
                                   1107 ;update CP 
      00A4D5 CD 87 FF         [ 4] 1108 	call CPP 
      00A4D8 CD 85 52         [ 4] 1109 	call STORE
      00A4DB CD 9E A0         [ 4] 1110 	call UPDATCP 
      00A4DE 81               [ 4] 1111 	ret 
                                   1112 
                                   1113 ;-----------------------------
                                   1114 ; move interrupt sub-routine
                                   1115 ; in flash memory
                                   1116 ;----------------------------- 
      00A4DF A4 99                 1117 	.word LINK 
                           002461  1118 	LINK=. 
      00A4E1 06                    1119 	.byte 6
      00A4E2 49 46 4D 4F 56 45     1120 	.ascii "IFMOVE" 
      00A4E8                       1121 IFMOVE:
      00A4E8 CD 87 B0         [ 4] 1122 	call TFLASH 
      00A4EB CD 85 64         [ 4] 1123 	CALL AT 
      00A4EE CD 85 19         [ 4] 1124 	CALL QBRAN 
      00A4F1 A4 93                 1125 	.word no_move 
      00A4F3 CD 87 FF         [ 4] 1126 	call CPP 
      00A4F6 CD 85 64         [ 4] 1127 	call AT 
      00A4F9 CD 86 9A         [ 4] 1128 	call DUPP ; ( udl udl -- )
      00A4FC CD 9E 5D         [ 4] 1129 	call EEPVP 
      00247F                       1130 	_DROP
      00A4FF 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00A502 CD 85 64         [ 4] 1131 	call AT  ; ( udl udl a )
      00A505 CD 86 63         [ 4] 1132 	call TOR 
      00A508 CD A4 04         [ 4] 1133 	call FADDR
      00A50B CD 85 C6         [ 4] 1134 	call RAT ; ( udl ud a -- ) R: a 
      00A50E CC A4 40         [ 2] 1135 	jp FMOVE2 
                                   1136 
                                   1137 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 131.
Hexadecimal [24-Bits]



                           000000  4695 .if WANT_SCALING_CONST 
                                   4696         .include "const_ratio.asm"
                                   4697 .endif
                           000001  4698 .if WANT_CONST_TABLE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 132.
Hexadecimal [24-Bits]



                                   4699         .include "ctable.asm"
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
      00A511 A4 E1                   34     .word LINK 
                           002493    35     LINK=.
      00A513 06                      36     .byte 6
      00A514 43 41 4C 4C 4F 54       37     .ascii "CALLOT"
      00A51A                         38 CALLOT:
      00A51A CD 87 FF         [ 4]   39     CALL CPP
      00A51D CD 86 9A         [ 4]   40     CALL DUPP 
      00A520 CD 85 64         [ 4]   41     CALL AT 
      00A523 CD 86 63         [ 4]   42     CALL TOR 
      00A526 CD 8C FF         [ 4]   43     CALL PSTOR 
      00A529 CD 9E A0         [ 4]   44     CALL UPDATCP 
      00A52C CD 85 B5         [ 4]   45     CALL RFROM
      00A52F CC 8C 8F         [ 2]   46     JP ZERO 
                                     47 
                                     48 ;------------------------------
                                     49 ; create constants bytes table 
                                     50 ; in persistant memory
                                     51 ;  CTABLE ( n+ -- ad ; <string> )
                                     52 ; n+ bytes reserved 
                                     53 ;-----------------------------
      00A532 A5 13                   54     .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 133.
Hexadecimal [24-Bits]



                           0024B4    55     LINK=.
      00A534 06                      56     .byte 6
      00A535 43 54 41 42 4C 45       57     .ascii "CTABLE"
      00A53B                         58 CTABLE:
      00A53B CD A5 1A         [ 4]   59     CALL CALLOT     
      00A53E CC 9B 34         [ 2]   60     JP DCONST 
                                     61      
                                     62 
                                     63 ;--------------------------------
                                     64 ; create constants words table 
                                     65 ; in persistant memory 
                                     66 ; WTABLE ( n+ -- ad ; <string> )
                                     67 ; n+  words reserved  
                                     68 ;--------------------------------
      00A541 A5 34                   69     .word LINK 
                           0024C3    70     LINK=.
      00A543 06                      71     .byte 6
      00A544 57 54 41 42 4C 45       72     .ascii "WTABLE"
      00A54A                         73 WTABLE:
      00A54A CD 8C 16         [ 4]   74     CALL CELLS  
      00A54D CD A5 1A         [ 4]   75     CALL CALLOT 
      00A550 CC 9B 34         [ 2]   76     JP DCONST 
                                     77 
                                     78 ;---------------------------------
                                     79 ; stack an element of CTABLE 
                                     80 ; CTABL@ ( u ad -- c )
                                     81 ; u element order {0..size-1}
                                     82 ; a|ad table address 
                                     83 ;--------------------------------
      00A553 A5 43                   84     .word LINK 
                           0024D5    85     LINK=.
      00A555 06                      86     .byte 6
      00A556 43 54 41 42 4C 40       87     .ascii "CTABL@" 
      00A55C                         88 CTAT:
      00A55C CD 9D E3         [ 4]   89     call FPSTOR 
      00A55F CD 9F 75         [ 4]   90     call PTRPLUS 
      00A562 CC 9F B2         [ 2]   91     jp EE_CREAD 
                                     92 
                                     93 ;---------------------------------
                                     94 ; stack an element of WTABLE 
                                     95 ; WTABL@ ( u ud -- w )
                                     96 ; u is element order {0..size-1}
                                     97 ; a|ud table address 
                                     98 ;----------------------------------
      00A565 A5 55                   99     .word LINK 
                           0024E7   100     LINK=.
      00A567 06                     101     .byte 6
      00A568 57 54 41 42 4C 40      102     .ascii "WTABL@" 
      00A56E                        103 WTAT:
      00A56E CD 9D E3         [ 4]  104     call FPSTOR 
      00A571 CD 8C 16         [ 4]  105     call CELLS 
      00A574 CD 9F 75         [ 4]  106     call PTRPLUS 
      00A577 CD 9F 90         [ 4]  107     call EE_READ 
      00A57A 81               [ 4]  108     ret 
                                    109 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 134.
Hexadecimal [24-Bits]



                                    110 ;--------------------------
                                    111 ; tool to initialize character table 
                                    112 ; CTINIT ( ad -- )
                                    113 ; ad is table address 
                                    114 ;--------------------------
      00A57B A5 67                  115     .word LINK 
                           0024FD   116     LINK=.
      00A57D 06                     117     .byte 6 
      00A57E 43 54 49 4E 49 54      118     .ascii "CTINIT"
      00A584                        119 CTINIT:
      00A584 CD 9D E3         [ 4]  120     CALL FPSTOR
      00A587 CD 9F 21         [ 4]  121     CALL UNLOCK
      00A58A CD 8C 8F         [ 4]  122     CALL ZERO 
      00A58D CD 8C 23         [ 4]  123 1$: CALL ONEP 
      00A590 CD 86 9A         [ 4]  124     CALL DUPP 
      00A593 CD A5 E0         [ 4]  125     CALL INTQ 
      00A596 CD 85 19         [ 4]  126     CALL QBRAN 
      00A599 A5 A3                  127     .word 2$
      00A59B CD 9F CC         [ 4]  128     call WR_BYTE 
      00A59E CD 85 35         [ 4]  129     CALL BRAN 
      00A5A1 A5 8D                  130     .word 1$ 
      002523                        131 2$: _DDROP 
      00A5A3 1C 00 04         [ 2]    1    ADDW X,#2*CELLL 
      00A5A6 CD 9F 49         [ 4]  132     CALL LOCK 
      00A5A9 81               [ 4]  133     ret 
                                    134 
                                    135 ;--------------------------
                                    136 ; tool to initialize word table 
                                    137 ; WTINIT ( ad -- )
                                    138 ; ad is table address 
                                    139 ;--------------------------
      00A5AA A5 7D                  140     .word LINK 
                           00252C   141     LINK=.
      00A5AC 06                     142     .byte 6 
      00A5AD 57 54 49 4E 49 54      143     .ascii "WTINIT"
      00A5B3                        144 WTINIT:
      00A5B3 CD 9D E3         [ 4]  145     CALL FPSTOR
      00A5B6 CD 9F 21         [ 4]  146     CALL UNLOCK
      00A5B9 CD 8C 8F         [ 4]  147     CALL ZERO 
      00A5BC CD 8C 23         [ 4]  148 1$: CALL ONEP 
      00A5BF CD 86 9A         [ 4]  149     CALL DUPP
      00A5C2 CD A5 E0         [ 4]  150     CALL INTQ
      00A5C5 CD 85 19         [ 4]  151     CALL QBRAN 
      00A5C8 A5 D2                  152     .word 2$
      00A5CA CD 9F F1         [ 4]  153     call WR_WORD 
      00A5CD CD 85 35         [ 4]  154     CALL BRAN 
      00A5D0 A5 BC                  155     .word 1$ 
      002552                        156 2$: _DDROP 
      00A5D2 1C 00 04         [ 2]    1    ADDW X,#2*CELLL 
      00A5D5 CD 9F 49         [ 4]  157     CALL LOCK 
      00A5D8 81               [ 4]  158     ret 
                                    159 
                                    160 ;------------------------
                                    161 ; Prompted input for integer 
                                    162 ; display n+ in bracket and
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 135.
Hexadecimal [24-Bits]



                                    163 ; '?' 
                                    164 ; [N]? ( n+ -- a )
                                    165 ;------------------------
      00A5D9 A5 AC                  166     .word LINK 
                           00255B   167     LINK=.
      00A5DB 04                     168     .byte 4
      00A5DC 5B 4E 5D 3F            169     .ascii "[N]?" 
      00A5E0                        170 INTQ:
      00A5E0 CD 90 FC         [ 4]  171     CALL CR 
      00A5E3 CD 84 F0         [ 4]  172     call DOLIT 
      00A5E6 00 5B                  173     .word '[
      00A5E8 CD 84 B7         [ 4]  174     CALL EMIT 
      00A5EB CD 91 A2         [ 4]  175     CALL DOT 
      00A5EE CD 91 29         [ 4]  176     CALL  DOTQP
      00A5F1 03                     177     .byte 3
      00A5F2 5D 3F 20               178     .ascii "]? " 
      00A5F5 CD 95 30         [ 4]  179     CALL QUERY 
      00A5F8 CD 93 5B         [ 4]  180     call TOKEN 
      00A5FB CC 8F E2         [ 2]  181     jp NUMBQ
                                    182 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 136.
Hexadecimal [24-Bits]



                                   4700 .endif
                           000000  4701 .if WANT_DOUBLE 
                                   4702         .include "double.asm"
                                   4703 .endif 
                           000000  4704 .if WANT_FLOAT 
                                   4705         .include "float.asm"
                                   4706 .endif 
                           000001  4707 .if WANT_FLOAT24 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 137.
Hexadecimal [24-Bits]



                                   4708         .include "float24.asm"
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
                                     20 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     21 ;  implement 24 float pointing point format  
                                     22 ;  the mantissa is 16 bits signed 
                                     23 ;  exponent is 8 bits signed  
                                     24 ;  format: seeeeee smmmmmmmmmmmmmmm 
                                     25 ;
                                     26 ;  This library is not dependant on double.asm 
                                     27 ;  The code is smaller and faster than float.asm at 
                                     28 ;  the cost of less precision on mantissa. 
                                     29 ;  Exponent range is the same. 
                                     30 ;
                                     31 ;  This format is store on the stack as a double, i.e. 32 bits 
                                     32 ;  but as 24 bits in memory. 
                                     33 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     34 
                                     35 
                           007FFF    36     MAX_MANTISSA = 0x7FFF ; absolute value maximum mantissa  
                                     37 
                           000001    38     F24_MAJOR=1 
                           000000    39     F24_MINOR=0 
                                     40 
                                     41 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     42 ;   FLOAT-VER ( -- )
                                     43 ;   print library version 
                                     44 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00257E                         45     _HEADER FVER,9,"FLOAT-VER"
      00A5FE A5 DB                    1         .word LINK 
                           002580     2         LINK=.
      00A600 09                       3         .byte 9  
      00A601 46 4C 4F 41 54 2D 56     4         .ascii "FLOAT-VER"
             45 52
      00A60A                          5         FVER:
      00A60A CD 90 FC         [ 4]   46     CALL CR 
      00A60D CD 91 29         [ 4]   47     CALL DOTQP 
      00A610 11                      48     .byte  17 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 138.
Hexadecimal [24-Bits]



      00A611 66 6C 6F 61 74 32 34    49     .ascii "float24 library, "
             20 6C 69 62 72 61 72
             79 2C 20
      00A622 CD 9C E3         [ 4]   50     CALL PRT_LICENCE 
      00A625 CD 9C BB         [ 4]   51     CALL COPYRIGHT 
      0025A8                         52     _DOLIT F24_MAJOR     
      00A628 CD 84 F0         [ 4]    1     CALL DOLIT 
      00A62B 00 01                    2     .word F24_MAJOR 
      0025AD                         53     _DOLIT F24_MINOR 
      00A62D CD 84 F0         [ 4]    1     CALL DOLIT 
      00A630 00 00                    2     .word F24_MINOR 
      00A632 CC 9C F7         [ 2]   54     JP PRINT_VERSION 
                                     55 
                                     56 
                                     57 ;-------------------------
                                     58 ;    FPSW ( -- a )
                                     59 ;    floating state variable
                                     60 ;    bit 0 zero flag 
                                     61 ;    bit 1 negative flag 
                                     62 ;    bit 2 overflow/error flag 
                                     63 ;---------------------------
      0025B5                         64     _HEADER FPSW,4,"FPSW"
      00A635 A6 00                    1         .word LINK 
                           0025B7     2         LINK=.
      00A637 04                       3         .byte 4  
      00A638 46 50 53 57              4         .ascii "FPSW"
      00A63C                          5         FPSW:
      00A63C 90 AE 00 08      [ 2]   65 	LDW Y,#UFPSW  
      00A640 1D 00 02         [ 2]   66 	SUBW X,#2
      00A643 FF               [ 2]   67     LDW (X),Y
      00A644 81               [ 4]   68     RET
                                     69 
                                     70 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     71 ;   FRESET ( -- )
                                     72 ;   reset FPSW variable 
                                     73 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
      0025C5                         74     _HEADER FRESET,6,"FRESET"
      00A645 A6 37                    1         .word LINK 
                           0025C7     2         LINK=.
      00A647 06                       3         .byte 6  
      00A648 46 52 45 53 45 54        4         .ascii "FRESET"
      00A64E                          5         FRESET:
      00A64E CD 8C 8F         [ 4]   75     CALL ZERO  
      00A651 CD A6 3C         [ 4]   76     CALL FPSW 
      00A654 CD 85 52         [ 4]   77     CALL STORE 
      00A657 81               [ 4]   78     RET 
                                     79 
                                     80 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     81 ;   FINIT ( -- )
                                     82 ;   initialize floating point 
                                     83 ;   library 
                                     84 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0025D8                         85     _HEADER FINIT,5,"FINIT"
      00A658 A6 47                    1         .word LINK 
                           0025DA     2         LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 139.
Hexadecimal [24-Bits]



      00A65A 05                       3         .byte 5  
      00A65B 46 49 4E 49 54           4         .ascii "FINIT"
      00A660                          5         FINIT:
      00A660 CD A6 4E         [ 4]   86     CALL FRESET 
      00A663 81               [ 4]   87     RET 
                                     88 
                                     89 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     90 ;    FER ( -- u )
                                     91 ;    return FPSW value 
                                     92 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0025E4                         93     _HEADER FER,3,"FER"
      00A664 A6 5A                    1         .word LINK 
                           0025E6     2         LINK=.
      00A666 03                       3         .byte 3  
      00A667 46 45 52                 4         .ascii "FER"
      00A66A                          5         FER:
      00A66A CD A6 3C         [ 4]   94     CALL FPSW 
      00A66D CD 85 64         [ 4]   95     CALL AT 
      00A670 81               [ 4]   96     RET 
                                     97 
                                     98 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     99 ;    FZE  ( -- 0|-1 )
                                    100 ;    return FPSW zero flag 
                                    101 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0025F1                        102     _HEADER FZE,3,"FZE"
      00A671 A6 66                    1         .word LINK 
                           0025F3     2         LINK=.
      00A673 03                       3         .byte 3  
      00A674 46 5A 45                 4         .ascii "FZE"
      00A677                          5         FZE:
      00A677 CD A6 3C         [ 4]  103     CALL FPSW
      00A67A CD 85 64         [ 4]  104     CALL AT  
      00A67D CD 8C 9A         [ 4]  105     CALL ONE 
      00A680 CD 86 F7         [ 4]  106     CALL ANDD
      00A683 CD 89 07         [ 4]  107     CALL NEGAT  
      00A686 81               [ 4]  108     RET 
                                    109 
                                    110 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    111 ;    FNE ( -- 0|-1 )
                                    112 ;    return FPSW negative flag 
                                    113 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002607                        114     _HEADER FNE,3,"FNE"
      00A687 A6 73                    1         .word LINK 
                           002609     2         LINK=.
      00A689 03                       3         .byte 3  
      00A68A 46 4E 45                 4         .ascii "FNE"
      00A68D                          5         FNE:
      00A68D CD A6 3C         [ 4]  115     CALL FPSW 
      00A690 CD 85 64         [ 4]  116     CALL AT 
      002613                        117     _DOLIT 2 
      00A693 CD 84 F0         [ 4]    1     CALL DOLIT 
      00A696 00 02                    2     .word 2 
      00A698 CD 86 F7         [ 4]  118     CALL ANDD
      00A69B CD 8C 75         [ 4]  119     CALL TWOSL
      00A69E CD 89 07         [ 4]  120     CALL NEGAT   
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 140.
Hexadecimal [24-Bits]



      00A6A1 81               [ 4]  121     RET 
                                    122 
                                    123 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    124 ;   FOV (  -- 0|-1 )
                                    125 ;   return FPSW overflow flag 
                                    126 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002622                        127     _HEADER FOV,3,"FOV"
      00A6A2 A6 89                    1         .word LINK 
                           002624     2         LINK=.
      00A6A4 03                       3         .byte 3  
      00A6A5 46 4F 56                 4         .ascii "FOV"
      00A6A8                          5         FOV:
      00A6A8 CD A6 3C         [ 4]  128     CALL FPSW
      00A6AB CD 85 64         [ 4]  129     CALL AT  
      00262E                        130     _DOLIT 4 
      00A6AE CD 84 F0         [ 4]    1     CALL DOLIT 
      00A6B1 00 04                    2     .word 4 
      00A6B3 CD 86 F7         [ 4]  131     CALL ANDD
      002636                        132     _DOLIT 2 
      00A6B6 CD 84 F0         [ 4]    1     CALL DOLIT 
      00A6B9 00 02                    2     .word 2 
      00A6BB CD 8C 5D         [ 4]  133     CALL RSHIFT 
      00A6BE CD 89 07         [ 4]  134     CALL NEGAT  
      00A6C1 81               [ 4]  135     RET 
                                    136 
                                    137 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    138 ;  SET-FPSW ( f24 -- f24 )
                                    139 ;  set float status word 
                                    140 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002642                        141     _HEADER SET_FPSW,8,"SET-FPSW"
      00A6C2 A6 A4                    1         .word LINK 
                           002644     2         LINK=.
      00A6C4 08                       3         .byte 8  
      00A6C5 53 45 54 2D 46 50 53     4         .ascii "SET-FPSW"
             57
      00A6CD                          5         SET_FPSW:
      00A6CD 3F 09            [ 1]  142     CLR UFPSW+1 
      00A6CF 90 93            [ 1]  143     LDW Y,X 
      00A6D1 90 EE 02         [ 2]  144     LDW Y,(2,Y) ; m 
      00A6D4 26 06            [ 1]  145     JRNE 1$
      00A6D6 72 10 00 09      [ 1]  146     BSET UFPSW+1,#0  ; null mantissa 
      00A6DA 20 1A            [ 2]  147     JRA 4$ 
      00A6DC 2A 04            [ 1]  148 1$: JRPL 2$    
      00A6DE 72 12 00 09      [ 1]  149     BSET UFPSW+1,#1  ; negative mantissa 
      00A6E2 90 93            [ 1]  150 2$: LDW Y,X 
      00A6E4 90 FE            [ 2]  151     LDW Y,(Y) ; e 
      00A6E6 90 A3 FF 81      [ 2]  152     CPW Y,#-127  
      00A6EA 2B 06            [ 1]  153     JRMI 3$
      00A6EC 90 A3 00 80      [ 2]  154     CPW Y,#128 
      00A6F0 2B 04            [ 1]  155     JRMI 4$ 
      00A6F2                        156 3$:
      00A6F2 72 14 00 09      [ 1]  157     BSET UFPSW+1,#2  ; overflow         
      00A6F6 81               [ 4]  158 4$: RET 
                                    159 
                                    160 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 141.
Hexadecimal [24-Bits]



                                    161 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    162 ;    SFZ ( f# -- f# )
                                    163 ;    set FPSW zero flag 
                                    164 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002677                        165     _HEADER SFZ,3,"SFZ"
      00A6F7 A6 C4                    1         .word LINK 
                           002679     2         LINK=.
      00A6F9 03                       3         .byte 3  
      00A6FA 53 46 5A                 4         .ascii "SFZ"
      00A6FD                          5         SFZ:
      00A6FD CD A6 6A         [ 4]  166     CALL FER 
      002680                        167     _DOLIT 0xfffe 
      00A700 CD 84 F0         [ 4]    1     CALL DOLIT 
      00A703 FF FE                    2     .word 0xfffe 
      00A705 CD 86 F7         [ 4]  168     CALL ANDD 
      00A708 CD 86 63         [ 4]  169     CALL TOR    
      00A70B CD 86 C2         [ 4]  170     CALL OVER  
      00A70E CD 86 E3         [ 4]  171     CALL ZEQUAL 
      002691                        172     _DOLIT 1 
      00A711 CD 84 F0         [ 4]    1     CALL DOLIT 
      00A714 00 01                    2     .word 1 
      00A716 CD 86 F7         [ 4]  173     CALL ANDD 
      00A719 CD 85 B5         [ 4]  174     CALL RFROM 
      00A71C CD 87 0B         [ 4]  175     CALL ORR 
      00A71F CD A6 3C         [ 4]  176     CALL FPSW 
      00A722 CD 85 52         [ 4]  177     CALL STORE 
      00A725 81               [ 4]  178     RET 
                                    179 
                                    180 
                                    181 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    182 ;   SFN ( f# -- f# )
                                    183 ;   set FPSW negative flag 
                                    184 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0026A6                        185     _HEADER SFN,3,"SFN"
      00A726 A6 F9                    1         .word LINK 
                           0026A8     2         LINK=.
      00A728 03                       3         .byte 3  
      00A729 53 46 4E                 4         .ascii "SFN"
      00A72C                          5         SFN:
      00A72C CD A6 6A         [ 4]  186     CALL FER 
      0026AF                        187     _DOLIT 0xFFFD 
      00A72F CD 84 F0         [ 4]    1     CALL DOLIT 
      00A732 FF FD                    2     .word 0xFFFD 
      00A734 CD 86 F7         [ 4]  188     CALL ANDD  
      00A737 CD 86 63         [ 4]  189     CALL TOR 
      00A73A CD 86 C2         [ 4]  190     CALL OVER 
      0026BD                        191     _DOLIT 15 
      00A73D CD 84 F0         [ 4]    1     CALL DOLIT 
      00A740 00 0F                    2     .word 15 
      00A742 CD 8C 5D         [ 4]  192     CALL RSHIFT 
      00A745 CD 85 B5         [ 4]  193     CALL RFROM 
      00A748 CD 87 0B         [ 4]  194     CALL ORR 
      00A74B CD A6 3C         [ 4]  195     CALL FPSW 
      00A74E CD 85 52         [ 4]  196     CALL STORE 
      00A751 81               [ 4]  197     RET 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 142.
Hexadecimal [24-Bits]



                                    198 
                                    199 
                                    200 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    201 ;   SFV ( -- )
                                    202 ;   set overflow flag 
                                    203 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0026D2                        204     _HEADER SFV,3,"SFV"
      00A752 A7 28                    1         .word LINK 
                           0026D4     2         LINK=.
      00A754 03                       3         .byte 3  
      00A755 53 46 56                 4         .ascii "SFV"
      00A758                          5         SFV:
      00A758 CD A6 6A         [ 4]  205     CALL FER 
      0026DB                        206     _DOLIT 4 
      00A75B CD 84 F0         [ 4]    1     CALL DOLIT 
      00A75E 00 04                    2     .word 4 
      00A760 CD 87 0B         [ 4]  207     CALL ORR 
      00A763 CD A6 3C         [ 4]  208     CALL FPSW 
      00A766 CD 85 52         [ 4]  209     CALL STORE 
      00A769 81               [ 4]  210     RET 
                                    211 
                                    212 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    213 ;   MSIGN  (m -- m -1|0 )
                                    214 ;   get mantissa sign 
                                    215 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0026EA                        216      _HEADER MSIGN,5,"MSIGN"
      00A76A A7 54                    1         .word LINK 
                           0026EC     2         LINK=.
      00A76C 05                       3         .byte 5  
      00A76D 4D 53 49 47 4E           4         .ascii "MSIGN"
      00A772                          5         MSIGN:
      00A772 90 5F            [ 1]  217     CLRW Y 
      00A774 F6               [ 1]  218     LD A,(X)
      00A775 2A 02            [ 1]  219     JRPL 1$
      00A777 90 53            [ 2]  220     CPLW Y 
      00A779 1D 00 02         [ 2]  221 1$: SUBW X,#CELLL 
      00A77C FF               [ 2]  222     LDW (X),Y 
      00A77D 81               [ 4]  223     RET 
                                    224 
                                    225 
                                    226 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    227 ;   E. ( f# -- )
                                    228 ;   print float24 in scientific 
                                    229 ;   format 
                                    230 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0026FE                        231     _HEADER EDOT,2,"E."
      00A77E A7 6C                    1         .word LINK 
                           002700     2         LINK=.
      00A780 02                       3         .byte 2  
      00A781 45 2E                    4         .ascii "E."
      00A783                          5         EDOT:
      00A783 CD 87 60         [ 4]  232     CALL BASE 
      00A786 CD 85 64         [ 4]  233     CALL AT 
      00A789 CD 86 63         [ 4]  234     CALL TOR 
      00A78C CD 8F 47         [ 4]  235     CALL DECIM 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 143.
Hexadecimal [24-Bits]



      00A78F CD A6 CD         [ 4]  236     CALL SET_FPSW
      00A792                        237 EDOT0: 
      00A792 CD 86 63         [ 4]  238     CALL TOR   ; R: e 
      00A795 CD 89 6D         [ 4]  239     CALL ABSS 
      00A798 CD 90 B9         [ 4]  240     CALL SPACE 
      00A79B CD 8E 97         [ 4]  241     CALL BDIGS     
      00A79E                        242 EDOT2: 
      00A79E CD 86 9A         [ 4]  243     CALL DUPP 
      002721                        244     _DOLIT 10 
      00A7A1 CD 84 F0         [ 4]    1     CALL DOLIT 
      00A7A4 00 0A                    2     .word 10 
      00A7A6 CD 89 A7         [ 4]  245     CALL LESS 
      002729                        246     _TBRAN EDOT3 
      00A7A9 CD 85 27         [ 4]    1     CALL TBRAN 
      00A7AC A7 BC                    2     .word EDOT3 
      00A7AE CD 8E C0         [ 4]  247     CALL DIG
      00A7B1 CD 85 B5         [ 4]  248     CALL RFROM 
      00A7B4 CD 8C 23         [ 4]  249     CALL ONEP 
      00A7B7 CD 86 63         [ 4]  250     CALL TOR 
      00273A                        251     _BRAN EDOT2 
      00A7BA 20 E2            [ 2]    1     JRA EDOT2  
      00A7BC                        252 EDOT3: 
      00273C                        253     _DOLIT '.'
      00A7BC CD 84 F0         [ 4]    1     CALL DOLIT 
      00A7BF 00 2E                    2     .word '.' 
      00A7C1 CD 8E A7         [ 4]  254     CALL HOLD  
      00A7C4 CD 8E C0         [ 4]  255     CALL DIG
      00A7C7 CD A6 8D         [ 4]  256     CALL FNE 
      00274A                        257     _QBRAN EDOT4 
      00A7CA CD 85 19         [ 4]    1     CALL QBRAN
      00A7CD A7 D7                    2     .word EDOT4
      00274F                        258     _DOLIT '-'
      00A7CF CD 84 F0         [ 4]    1     CALL DOLIT 
      00A7D2 00 2D                    2     .word '-' 
      00A7D4 CD 8E A7         [ 4]  259     CALL HOLD 
      00A7D7                        260 EDOT4:       
      00A7D7 CD 8E FC         [ 4]  261     CALL EDIGS 
      00A7DA CD 90 E3         [ 4]  262     CALL TYPES
      00A7DD CD 85 B5         [ 4]  263     CALL RFROM 
      00A7E0 CD 88 4D         [ 4]  264     CALL QDUP 
      002763                        265     _QBRAN EDOT5     
      00A7E3 CD 85 19         [ 4]    1     CALL QBRAN
      00A7E6 A7 F8                    2     .word EDOT5
      002768                        266     _DOLIT 'E'
      00A7E8 CD 84 F0         [ 4]    1     CALL DOLIT 
      00A7EB 00 45                    2     .word 'E' 
      00A7ED CD 84 B7         [ 4]  267     CALL EMIT
      002770                        268     _DOLIT 1  
      00A7F0 CD 84 F0         [ 4]    1     CALL DOLIT 
      00A7F3 00 01                    2     .word 1 
      00A7F5 CD 91 37         [ 4]  269     CALL DOTR
      00A7F8                        270 EDOT5: 
      00A7F8 CD 85 B5         [ 4]  271     CALL RFROM 
      00A7FB CD 87 60         [ 4]  272     CALL BASE 
      00A7FE CD 85 52         [ 4]  273     CALL STORE  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 144.
Hexadecimal [24-Bits]



      00A801 81               [ 4]  274     RET 
                                    275 
                                    276 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                    277 ;   F. (f# -- )
                                    278 ;   print float in fixed
                                    279 ;   point format. 
                                    280 ;;;;;;;;;;;;;;;;;;;;;;;;;
      002782                        281     _HEADER FDOT,2,"F."
      00A802 A7 80                    1         .word LINK 
                           002784     2         LINK=.
      00A804 02                       3         .byte 2  
      00A805 46 2E                    4         .ascii "F."
      00A807                          5         FDOT:
      00A807 CD 87 60         [ 4]  282     CALL BASE 
      00A80A CD 85 64         [ 4]  283     CALL AT 
      00A80D CD 86 63         [ 4]  284     CALL TOR 
      00A810 CD 8F 47         [ 4]  285     CALL DECIM 
      00A813 CD A6 CD         [ 4]  286     CALL    SET_FPSW 
      00A816 CD 86 9A         [ 4]  287     CALL    DUPP  
      00A819 CD 89 6D         [ 4]  288     CALL    ABSS 
      00279C                        289     _DOLIT  8
      00A81C CD 84 F0         [ 4]    1     CALL DOLIT 
      00A81F 00 08                    2     .word 8 
      00A821 CD 89 D4         [ 4]  290     CALL    GREAT 
      0027A4                        291     _QBRAN  FDOT1 
      00A824 CD 85 19         [ 4]    1     CALL QBRAN
      00A827 A8 2C                    2     .word FDOT1
      00A829 CC A7 92         [ 2]  292     JP      EDOT0 
      00A82C                        293 FDOT1:
      00A82C CD 90 B9         [ 4]  294     CALL    SPACE 
      00A82F CD 86 63         [ 4]  295     CALL    TOR 
      00A832 CD A6 8D         [ 4]  296     CALL    FNE 
      0027B5                        297     _QBRAN  FDOT0 
      00A835 CD 85 19         [ 4]    1     CALL QBRAN
      00A838 A8 3D                    2     .word FDOT0
      00A83A CD 89 07         [ 4]  298     CALL    NEGAT 
      00A83D                        299 FDOT0: 
      00A83D CD 8E 97         [ 4]  300     CALL    BDIGS
      00A840 CD 85 C6         [ 4]  301     CALL    RAT  
      00A843 CD 86 D1         [ 4]  302     CALL    ZLESS 
      0027C6                        303     _QBRAN  FDOT6 
      00A846 CD 85 19         [ 4]    1     CALL QBRAN
      00A849 A8 6E                    2     .word FDOT6
      00A84B                        304 FDOT2: ; e<0 
      00A84B CD 8E C0         [ 4]  305     CALL    DIG 
      00A84E CD 85 B5         [ 4]  306     CALL    RFROM
      00A851 CD 8C 23         [ 4]  307     CALL    ONEP 
      00A854 CD 88 4D         [ 4]  308     CALL    QDUP  
      0027D7                        309     _QBRAN  FDOT3 
      00A857 CD 85 19         [ 4]    1     CALL QBRAN
      00A85A A8 61                    2     .word FDOT3
      00A85C CD 86 63         [ 4]  310     CALL    TOR 
      00A85F 20 EA            [ 2]  311     JRA   FDOT2 
      00A861                        312 FDOT3:
      0027E1                        313     _DOLIT  '.' 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 145.
Hexadecimal [24-Bits]



      00A861 CD 84 F0         [ 4]    1     CALL DOLIT 
      00A864 00 2E                    2     .word '.' 
      00A866 CD 8E A7         [ 4]  314     CALL    HOLD 
      00A869 CD 8E D1         [ 4]  315     CALL    DIGS
      00A86C 20 1A            [ 2]  316     JRA   FDOT9  
      00A86E                        317 FDOT6: ; e>=0 
      0027EE                        318     _DOLIT '.' 
      00A86E CD 84 F0         [ 4]    1     CALL DOLIT 
      00A871 00 2E                    2     .word '.' 
      00A873 CD 8E A7         [ 4]  319     CALL HOLD  
      00A876 20 08            [ 2]  320     JRA   FDOT8
      00A878                        321 FDOT7:     
      0027F8                        322     _DOLIT  '0'
      00A878 CD 84 F0         [ 4]    1     CALL DOLIT 
      00A87B 00 30                    2     .word '0' 
      00A87D CD 8E A7         [ 4]  323     CALL    HOLD 
      00A880                        324 FDOT8:
      002800                        325     _DONXT FDOT7 
      00A880 CD 85 04         [ 4]    1     CALL DONXT 
      00A883 A8 78                    2     .word FDOT7 
      00A885 CD 8E D1         [ 4]  326     CALL    DIGS
      00A888                        327 FDOT9:
      00A888 CD A6 8D         [ 4]  328     CALL    FNE 
      00280B                        329     _QBRAN  FDOT10 
      00A88B CD 85 19         [ 4]    1     CALL QBRAN
      00A88E A8 98                    2     .word FDOT10
      002810                        330     _DOLIT '-' 
      00A890 CD 84 F0         [ 4]    1     CALL DOLIT 
      00A893 00 2D                    2     .word '-' 
      00A895 CD 8E A7         [ 4]  331     CALL   HOLD 
      00A898                        332 FDOT10:
      00A898 CD 8E FC         [ 4]  333     CALL    EDIGS 
      00A89B CD 90 E3         [ 4]  334     CALL    TYPES 
      00A89E CD 85 B5         [ 4]  335     CALL    RFROM 
      00A8A1 CD 87 60         [ 4]  336     CALL    BASE 
      00A8A4 CD 85 52         [ 4]  337     CALL    STORE 
      00A8A7 81               [ 4]  338     RET 
                                    339 
                                    340 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    341 ;    number parser 
                                    342 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    343 
                                    344 ; check for negative sign 
                                    345 ; ajust pointer and cntr 
      00A8A8                        346 nsign: ; ( addr cntr -- addr cntr f ) 
      00A8A8 1D 00 02         [ 2]  347     SUBW X,#CELLL ; a cntr f 
      00A8AB 90 93            [ 1]  348     LDW Y,X 
      00A8AD 90 EE 04         [ 2]  349     LDW Y,(4,Y) ; addr 
      00A8B0 90 F6            [ 1]  350     LD A,(Y) ; char=*addr  
      00A8B2 A1 2D            [ 1]  351     CP A,#'-' 
      00A8B4 27 03            [ 1]  352     JREQ NEG_SIGN 
      00A8B6 4F               [ 1]  353     CLR A  
      00A8B7 20 18            [ 2]  354     JRA STO_SIGN 
      00A8B9                        355 NEG_SIGN:
                                    356 ; increment addr 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 146.
Hexadecimal [24-Bits]



      00A8B9 90 93            [ 1]  357     LDW Y,X 
      00A8BB 90 EE 04         [ 2]  358     LDW Y,(4,Y)
      00A8BE 72 A9 00 01      [ 2]  359     ADDW Y,#1   ;addr+1 
      00A8C2 EF 04            [ 2]  360     LDW (4,X),Y 
                                    361 ; decrement cntr 
      00A8C4 90 93            [ 1]  362     LDW Y,X
      00A8C6 90 EE 02         [ 2]  363     LDW Y,(2,Y)
      00A8C9 72 A2 00 01      [ 2]  364     SUBW Y,#1   ;cntr-1 
      00A8CD EF 02            [ 2]  365     LDW (2,X),Y 
      00A8CF A6 FF            [ 1]  366     LD A,#0XFF
      00A8D1                        367 STO_SIGN:   
      00A8D1 F7               [ 1]  368     LD (X),A 
      00A8D2 E7 01            [ 1]  369     LD (1,X),A 
      00A8D4 81               [ 4]  370     RET 
                                    371 
                                    372 
                                    373 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    374 ; return parsed exponent or 
                                    375 ; 0 if failed
                                    376 ; at entry exprect *a=='E'    
                                    377 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00A8D5                        378 parse_exponent: ; a cntr -- e -1 | 0 
      00A8D5 CD 86 63         [ 4]  379     CALL TOR   ; R: cntr 
      00A8D8 CD 86 9A         [ 4]  380     CALL DUPP 
      00A8DB CD 85 82         [ 4]  381     CALL CAT 
      00285E                        382     _DOLIT 'E' 
      00A8DE CD 84 F0         [ 4]    1     CALL DOLIT 
      00A8E1 00 45                    2     .word 'E' 
      00A8E3 CD 89 7B         [ 4]  383     CALL EQUAL 
      002866                        384     _QBRAN 1$
      00A8E6 CD 85 19         [ 4]    1     CALL QBRAN
      00A8E9 A9 13                    2     .word 1$
      00A8EB CD 8C 23         [ 4]  385     CALL ONEP 
      00A8EE CD 85 B5         [ 4]  386     CALL RFROM  ; a cntr 
      00A8F1 CD 8C 30         [ 4]  387     CALL ONEM
      00A8F4 CD 86 9A         [ 4]  388     CALL DUPP 
      002877                        389     _QBRAN 2$ ; a cntr 
      00A8F7 CD 85 19         [ 4]    1     CALL QBRAN
      00A8FA A9 16                    2     .word 2$
      00A8FC CD 8C 8F         [ 4]  390     CALL ZERO
      00A8FF CD 88 7D         [ 4]  391     CALL NROT ;  0 a cntr  
      00A902 CD A8 A8         [ 4]  392     CALL nsign 
      00A905 CD 86 63         [ 4]  393     CALL TOR   ; R: esign  
      00A908 CD 8F 95         [ 4]  394     CALL parse_digits
      00288B                        395     _QBRAN PARSEXP_SUCCESS ; parsed to end of string 
      00A90B CD 85 19         [ 4]    1     CALL QBRAN
      00A90E A9 1D                    2     .word PARSEXP_SUCCESS
                                    396 ; failed invalid character
      002890                        397     _DDROP ; 0 a 
      00A910 1C 00 04         [ 2]    1    ADDW X,#2*CELLL 
      00A913                        398 1$: 
      00A913 CD 85 B5         [ 4]  399     CALL RFROM ; sign||cntr  
      00A916                        400 2$:
      002896                        401     _DDROP  ; a cntr || a sign || 0 cntr   
      00A916 1C 00 04         [ 2]    1    ADDW X,#2*CELLL 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 147.
Hexadecimal [24-Bits]



      00A919 CD 8C 8F         [ 4]  402     CALL ZERO   ; return only 0 
      00A91C 81               [ 4]  403     RET 
      00A91D                        404 PARSEXP_SUCCESS: ; n a  
      00289D                        405     _DROP ; n  
      00A91D 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00A920 CD 85 B5         [ 4]  406     CALL RFROM ; esign  
      0028A3                        407     _QBRAN 1$
      00A923 CD 85 19         [ 4]    1     CALL QBRAN
      00A926 A9 2B                    2     .word 1$
      00A928 CD 89 07         [ 4]  408     CALL NEGAT
      00A92B                        409 1$:
      0028AB                        410     _DOLIT -1 ; -- e -1 
      00A92B CD 84 F0         [ 4]    1     CALL DOLIT 
      00A92E FF FF                    2     .word -1 
      00A930 81               [ 4]  411     RET 
                                    412 
                                    413 
                                    414 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    415 ;   FLOAT?  ( a n a+ cnt sign  -- f24 -3 | a 0 )
                                    416 ;   called by NUMBER? 
                                    417 ;   convert string to float 
                                    418 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0028B1                        419     _HEADER FLOATQ,5,"FLOAT?"
      00A931 A8 04                    1         .word LINK 
                           0028B3     2         LINK=.
      00A933 05                       3         .byte 5  
      00A934 46 4C 4F 41 54 3F        4         .ascii "FLOAT?"
      00A93A                          5         FLOATQ:
                                    420 ; BASE must be 10 
      00A93A CD 87 60         [ 4]  421     CALL BASE 
      00A93D CD 85 64         [ 4]  422     CALL AT 
      0028C0                        423     _DOLIT 10 
      00A940 CD 84 F0         [ 4]    1     CALL DOLIT 
      00A943 00 0A                    2     .word 10 
      00A945 CD 89 7B         [ 4]  424     CALL EQUAL 
      0028C8                        425     _QBRAN FLOAT_ERROR 
      00A948 CD 85 19         [ 4]    1     CALL QBRAN
      00A94B AA 05                    2     .word FLOAT_ERROR
                                    426 ; if float next char is '.' or 'E' 
      00A94D CD 86 63         [ 4]  427     CALL TOR ; R: sign  
      00A950 CD 86 63         [ 4]  428     CALL TOR ; R: sign cntr 
      00A953 CD 86 9A         [ 4]  429     CALL DUPP
      00A956 CD 85 82         [ 4]  430     CALL CAT 
      0028D9                        431     _DOLIT '.' 
      00A959 CD 84 F0         [ 4]    1     CALL DOLIT 
      00A95C 00 2E                    2     .word '.' 
      00A95E CD 89 7B         [ 4]  432     CALL EQUAL 
      0028E1                        433     _QBRAN FLOATQ1 ; not a dot 
      00A961 CD 85 19         [ 4]    1     CALL QBRAN
      00A964 A9 99                    2     .word FLOATQ1
      00A966 CD 8C 23         [ 4]  434     CALL ONEP 
      00A969 CD 85 B5         [ 4]  435     CALL RFROM  ; a  n a+ cntr R: sign  
      00A96C CD 8C 30         [ 4]  436     CALL ONEM 
      00A96F CD 86 9A         [ 4]  437     CALL DUPP 
      00A972 CD 86 63         [ 4]  438     CALL TOR  ; R: sign cntr 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 148.
Hexadecimal [24-Bits]



                                    439 ; parse fractional part
      00A975 CD 8F 95         [ 4]  440     CALL parse_digits ; a n a+ cntr -- n a cntr 
      00A978 CD 86 9A         [ 4]  441     CALL DUPP 
      00A97B CD 85 B5         [ 4]  442     CALL RFROM 
      00A97E CD 86 AA         [ 4]  443     CALL SWAPP 
      00A981 CD 89 53         [ 4]  444     CALL SUBB ; fd -> fraction digits count 
      00A984 CD 86 63         [ 4]  445     CALL TOR  ; n a cntr R: sign fd 
      00A987 CD 86 9A         [ 4]  446     CALL DUPP ; cntr cntr  
      00290A                        447     _QBRAN 1$ ; end of string, no exponent
      00A98A CD 85 19         [ 4]    1     CALL QBRAN
      00A98D A9 91                    2     .word 1$
      00A98F 20 11            [ 2]  448     JRA FLOATQ2
      00A991 CD 86 AA         [ 4]  449 1$: CALL SWAPP 
      002914                        450     _DROP ; a
      00A994 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00A997 20 11            [ 2]  451     JRA FLOATQ3        
      00A999                        452 FLOATQ1: ; must push fd==0 on RSTACK 
      00A999 CD 85 B5         [ 4]  453     CALL RFROM ; cntr 
      00A99C CD 8C 8F         [ 4]  454     CALL ZERO  ; fd 
      00A99F CD 86 63         [ 4]  455     CALL TOR   ; m a cntr R: sign fd 
      00A9A2                        456 FLOATQ2: 
      00A9A2 CD A8 D5         [ 4]  457     CALL parse_exponent 
      002925                        458     _QBRAN FLOAT_ERROR0 ; exponent expected 
      00A9A5 CD 85 19         [ 4]    1     CALL QBRAN
      00A9A8 A9 FF                    2     .word FLOAT_ERROR0
      00A9AA                        459 FLOATQ3: ; m 0 || m e  
      00A9AA CD 85 B5         [ 4]  460     CALL RFROM ;  fd  
      00A9AD CD 89 53         [ 4]  461     CALL SUBB  ; exp=e-fd 
      00A9B0 CD 86 AA         [ 4]  462     CALL SWAPP  
                                    463 ; if m>MAX_MANTISSA then m/10 e++ 
      00A9B3 CD 86 9A         [ 4]  464     CALL  DUPP 
      00A9B6 CD 86 D1         [ 4]  465     CALL ZLESS 
      002939                        466     _QBRAN FLOATQ34
      00A9B9 CD 85 19         [ 4]    1     CALL QBRAN
      00A9BC A9 E2                    2     .word FLOATQ34
      00293E                        467     _DOLIT 10 
      00A9BE CD 84 F0         [ 4]    1     CALL DOLIT 
      00A9C1 00 0A                    2     .word 10 
      00A9C3 CD 8A 81         [ 4]  468     CALL USLMOD 
                                    469 ; round to nearest integer 
      00A9C6 CD 86 AA         [ 4]  470     CALL SWAPP 
      002949                        471     _DOLIT 5 
      00A9C9 CD 84 F0         [ 4]    1     CALL DOLIT 
      00A9CC 00 05                    2     .word 5 
      00A9CE CD 89 D4         [ 4]  472     CALL GREAT 
      002951                        473     _QBRAN FLOATQ31
      00A9D1 CD 85 19         [ 4]    1     CALL QBRAN
      00A9D4 A9 D9                    2     .word FLOATQ31
      00A9D6 CD 8C 23         [ 4]  474     CALL ONEP 
      00A9D9                        475 FLOATQ31: 
      00A9D9 CD 86 AA         [ 4]  476     CALL SWAPP
      00A9DC CD 8C 23         [ 4]  477     CALL ONEP 
      00A9DF CD 86 AA         [ 4]  478     CALL SWAPP      
      00A9E2                        479 FLOATQ34:     
      00A9E2 CD 85 B5         [ 4]  480     CALL RFROM  ; sign 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 149.
Hexadecimal [24-Bits]



      002965                        481     _QBRAN FLOATQ4 
      00A9E5 CD 85 19         [ 4]    1     CALL QBRAN
      00A9E8 A9 ED                    2     .word FLOATQ4
      00A9EA CD 89 07         [ 4]  482     CALL NEGAT 
      00A9ED                        483 FLOATQ4:
      00A9ED CD 88 5E         [ 4]  484     CALL ROT   ; e m a 
      002970                        485     _DROP      ; drop a 
      00A9F0 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00A9F3 CD 86 AA         [ 4]  486     CALL SWAPP ; m e 
      00A9F6 CD A6 CD         [ 4]  487     CALL SET_FPSW 
      002979                        488     _DOLIT -3 
      00A9F9 CD 84 F0         [ 4]    1     CALL DOLIT 
      00A9FC FF FD                    2     .word -3 
      00A9FE 81               [ 4]  489     RET       
      00A9FF                        490 FLOAT_ERROR0: 
      00A9FF CD 85 B5         [ 4]  491     CALL RFROM ; df 
      00AA02 CD 85 B5         [ 4]  492     CALL RFROM ; df sign 
      00AA05                        493 FLOAT_ERROR: 
      00AA05 CD 8C D1         [ 4]  494     CALL DEPTH 
      00AA08 CD 8C 16         [ 4]  495     CALL CELLS 
      00AA0B CD 86 7A         [ 4]  496     CALL SPAT 
      00AA0E CD 86 AA         [ 4]  497     CALL SWAPP 
      00AA11 CD 88 BD         [ 4]  498     CALL PLUS  
      00AA14 CD 86 87         [ 4]  499     CALL SPSTO 
      00AA17 CD 8C 8F         [ 4]  500     CALL ZERO 
      00AA1A 81               [ 4]  501     RET 
                                    502 
                                    503 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    504 ;  LSCALE ( f24 -- f24 )
                                    505 ;  m *=10 , e -= 1
                                    506 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00299B                        507     _HEADER LSCALE,6,"LSCALE"
      00AA1B A9 33                    1         .word LINK 
                           00299D     2         LINK=.
      00AA1D 06                       3         .byte 6  
      00AA1E 4C 53 43 41 4C 45        4         .ascii "LSCALE"
      00AA24                          5         LSCALE:
      00AA24 CD 8C 9A         [ 4]  508     CALL ONE 
      00AA27 CD 89 53         [ 4]  509     CALL SUBB 
      00AA2A CD 86 63         [ 4]  510     CALL TOR
      0029AD                        511     _DOLIT 10 
      00AA2D CD 84 F0         [ 4]    1     CALL DOLIT 
      00AA30 00 0A                    2     .word 10 
      00AA32 CD 8B A2         [ 4]  512     CALL STAR
      00AA35 CD 85 B5         [ 4]  513     CALL RFROM 
      00AA38 81               [ 4]  514     RET  
                                    515 
                                    516 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    517 ;  RSCALE ( f# -- f# )
                                    518 ;  m /=10 , e+=1 
                                    519 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0029B9                        520     _HEADER RSCALE,6,"RSCALE"
      00AA39 AA 1D                    1         .word LINK 
                           0029BB     2         LINK=.
      00AA3B 06                       3         .byte 6  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 150.
Hexadecimal [24-Bits]



      00AA3C 52 53 43 41 4C 45        4         .ascii "RSCALE"
      00AA42                          5         RSCALE:
      00AA42 CD 8C 9A         [ 4]  521     CALL ONE 
      00AA45 CD 88 BD         [ 4]  522     CALL PLUS 
      00AA48 CD 86 63         [ 4]  523     CALL TOR 
      0029CB                        524     _DOLIT 10 
      00AA4B CD 84 F0         [ 4]    1     CALL DOLIT 
      00AA4E 00 0A                    2     .word 10 
      00AA50 CD 8B 49         [ 4]  525     CALL SLASH  
      00AA53 CD 85 B5         [ 4]  526     CALL RFROM 
      00AA56 81               [ 4]  527     RET 
                                    528 
                                    529 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    530 ;  F24LITERAL ( f24 -- )
                                    531 ;  compile 24 bits literal 
                                    532 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0029D7                        533     _HEADER FLITER,COMPO+IMEDD+10,"F24LITERAL"
      00AA57 AA 3B                    1         .word LINK 
                           0029D9     2         LINK=.
      00AA59 CA                       3         .byte COMPO+IMEDD+10  
      00AA5A 46 32 34 4C 49 54 45     4         .ascii "F24LITERAL"
             52 41 4C
      00AA64                          5         FLITER:
      00AA64 CD 9C 10         [ 4]  534 CALL DOTS 
      00AA67 CD 96 E4         [ 4]  535     CALL COMPI 
      00AA6A AA 72                  536     .word dof24lit 
      00AA6C CD 96 B6         [ 4]  537     CALL CCOMMA 
      00AA6F CC 96 9F         [ 2]  538     JP   COMMA 
                                    539 
                                    540 
                                    541 ; runtime for F24LITERAL
                                    542 ; 24 bits literal 
      00AA72                        543 dof24lit:
      00AA72 1D 00 04         [ 2]  544     SUBW X,#4 
      00AA75 16 01            [ 2]  545     LDW Y,(1,SP)
      00AA77 90 F6            [ 1]  546     LD A,(Y)
      00AA79 90 5F            [ 1]  547     CLRW Y 
      00AA7B 90 97            [ 1]  548     LD YL,A 
      00AA7D 4D               [ 1]  549     TNZ A 
      00AA7E 2A 04            [ 1]  550     JRPL 1$
      00AA80 A6 FF            [ 1]  551     LD A,#255 
      00AA82 90 95            [ 1]  552     LD YH,A   
      00AA84 FF               [ 2]  553 1$: LDW (X),Y 
      00AA85 16 01            [ 2]  554     LDW Y,(1,SP)
      00AA87 90 EE 01         [ 2]  555     LDW Y,(1,Y)
      00AA8A EF 02            [ 2]  556     LDW (2,X),Y 
      00AA8C 90 85            [ 2]  557     POPW Y 
      00AA8E 90 EC 03         [ 2]  558     JP (3,Y)
                                    559 
                                    560 
                                    561 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    562 ;   F24CONST ( f24 -- )
                                    563 ;   create a float24 constant 
                                    564 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002A11                        565     _HEADER F24CONST,8,"F24CONST" 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 151.
Hexadecimal [24-Bits]



      00AA91 AA 59                    1         .word LINK 
                           002A13     2         LINK=.
      00AA93 08                       3         .byte 8  
      00AA94 46 32 34 43 4F 4E 53     4         .ascii "F24CONST"
             54
      00AA9C                          5         F24CONST:
      00AA9C CD 93 5B         [ 4]  566         CALL TOKEN
      00AA9F CD 98 9D         [ 4]  567         CALL SNAME 
      00AAA2 CD 99 34         [ 4]  568         CALL OVERT 
      00AAA5 CD 96 E4         [ 4]  569         CALL COMPI 
      00AAA8 AA BF                  570         .word DOF24CONST 
      00AAAA CD 96 B6         [ 4]  571         CALL CCOMMA
      00AAAD CD 96 9F         [ 4]  572         CALL COMMA  
      00AAB0 CD A4 0F         [ 4]  573         CALL FMOVE
      00AAB3 CD 88 4D         [ 4]  574         CALL QDUP 
      00AAB6 CD 85 19         [ 4]  575         CALL QBRAN 
      00AAB9 9A E8                  576         .word SET_RAMLAST  
      00AABB CD A4 A3         [ 4]  577         CALL UPDATPTR  
      00AABE 81               [ 4]  578         RET          
                                    579 
      00AABF                        580 DOF24CONST:
      00AABF 16 01            [ 2]  581     LDW Y,(1,SP) 
      00AAC1 1D 00 04         [ 2]  582     SUBW x,#2*CELLL 
      00AAC4 90 F6            [ 1]  583     LD A,(Y)
      00AAC6 90 5F            [ 1]  584     CLRW Y 
      00AAC8 90 97            [ 1]  585     LD YL,A
      00AACA 4D               [ 1]  586     TNZ A 
      00AACB 2A 04            [ 1]  587     JRPL 1$
      00AACD A6 FF            [ 1]  588     LD A,#255
      00AACF 90 95            [ 1]  589     LD YH,A 
      00AAD1                        590 1$:      
      00AAD1 FF               [ 2]  591     LDW (X),Y 
      00AAD2 90 85            [ 2]  592     POPW Y 
      00AAD4 90 EE 01         [ 2]  593     LDW Y,(1,Y)
      00AAD7 EF 02            [ 2]  594     LDW (2,X),Y 
      00AAD9 81               [ 4]  595     RET 
                                    596 
                                    597 
                                    598 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    599 ;   F24VAR "name" ( -- )
                                    600 ;   create a float24 variable 
                                    601 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002A5A                        602     _HEADER F24VAR,6,"F24VAR"
      00AADA AA 93                    1         .word LINK 
                           002A5C     2         LINK=.
      00AADC 06                       3         .byte 6  
      00AADD 46 32 34 56 41 52        4         .ascii "F24VAR"
      00AAE3                          5         F24VAR:
      00AAE3 CD 8D 69         [ 4]  603     CALL HERE
      00AAE6 CD 86 9A         [ 4]  604     CALL DUPP
      002A69                        605     _DOLIT 3  
      00AAE9 CD 84 F0         [ 4]    1     CALL DOLIT 
      00AAEC 00 03                    2     .word 3 
      00AAEE CD 88 BD         [ 4]  606     CALL PLUS 
      00AAF1 CD 87 F1         [ 4]  607     CALL VPP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 152.
Hexadecimal [24-Bits]



      00AAF4 CD 85 52         [ 4]  608     CALL STORE
      00AAF7 CD 9A 9B         [ 4]  609     CALL CREAT
      00AAFA CD 86 9A         [ 4]  610     CALL DUPP
      00AAFD CD 96 9F         [ 4]  611     CALL COMMA
      00AB00 CD 8C 8F         [ 4]  612     CALL ZERO
      00AB03 CD 86 C2         [ 4]  613     CALL OVER 
      00AB06 CD 85 71         [ 4]  614     CALL CSTOR 
      00AB09 CD 8C 8F         [ 4]  615     CALL ZERO 
      00AB0C CD 86 AA         [ 4]  616     CALL SWAPP 
      00AB0F CD 8C 23         [ 4]  617     CALL ONEP  
      00AB12 CD 85 52         [ 4]  618     CALL STORE 
      00AB15 CD A4 0F         [ 4]  619     CALL FMOVE ; move definition to FLASH
      00AB18 CD 88 4D         [ 4]  620     CALL QDUP 
      00AB1B CD 85 19         [ 4]  621     CALL QBRAN 
      00AB1E 9A E8                  622     .word SET_RAMLAST   
      00AB20 CD 9E B7         [ 4]  623     CALL UPDATVP  ; don't update if variable kept in RAM.
      00AB23 CC A4 A3         [ 2]  624     JP UPDATPTR
                                    625 
                                    626 
                                    627 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    628 ;   F24! ( f24 a -- )
                                    629 ;   store float24 
                                    630 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002AA6                        631     _HEADER F24STO,4,"F24!"
      00AB26 AA DC                    1         .word LINK 
                           002AA8     2         LINK=.
      00AB28 04                       3         .byte 4  
      00AB29 46 32 34 21              4         .ascii "F24!"
      00AB2D                          5         F24STO:
      00AB2D 90 93            [ 1]  632     LDW Y,X 
      00AB2F 90 FE            [ 2]  633     LDW Y,(Y) ; a 
      00AB31 E6 03            [ 1]  634     LD A,(3,X) ; e low  
      00AB33 90 F7            [ 1]  635     LD (Y),A
      00AB35 72 A9 00 01      [ 2]  636     ADDW Y,#1  
      00AB39 90 BF 26         [ 2]  637     LDW YTEMP,Y 
      00AB3C 90 93            [ 1]  638     LDW Y,X 
      00AB3E 90 EE 04         [ 2]  639     LDW Y,(4,Y) ; m 
      00AB41 91 CF 26         [ 5]  640     LDW [YTEMP],Y 
      00AB44 1C 00 06         [ 2]  641     ADDW X,#3*CELLL 
      00AB47 81               [ 4]  642     RET 
                                    643 
                                    644 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    645 ;   F24@ ( a -- f24 )
                                    646 ;   stack float24 variable 
                                    647 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002AC8                        648     _HEADER F24AT,4,"F24@"
      00AB48 AB 28                    1         .word LINK 
                           002ACA     2         LINK=.
      00AB4A 04                       3         .byte 4  
      00AB4B 46 32 34 40              4         .ascii "F24@"
      00AB4F                          5         F24AT:
      00AB4F 90 93            [ 1]  649     LDW Y,X 
      00AB51 90 FE            [ 2]  650     LDW Y,(Y) ; a 
      00AB53 90 89            [ 2]  651     PUSHW Y 
      00AB55 1D 00 02         [ 2]  652     SUBW X,#CELLL 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 153.
Hexadecimal [24-Bits]



      00AB58 90 EE 01         [ 2]  653     LDW Y,(1,Y) ; m 
      00AB5B EF 02            [ 2]  654     LDW (2,X),Y 
      00AB5D 90 85            [ 2]  655     POPW Y   ; a 
      00AB5F 90 F6            [ 1]  656     LD A,(Y) ; e 
      00AB61 90 5F            [ 1]  657     CLRW Y 
      00AB63 90 97            [ 1]  658     LD YL,A 
      00AB65 4D               [ 1]  659     TNZ A 
      00AB66 2A 04            [ 1]  660     JRPL 1$
      00AB68 A6 FF            [ 1]  661     LD A,#255 
      00AB6A 90 95            [ 1]  662     LD YH,A 
      00AB6C FF               [ 2]  663 1$: LDW (X),Y ; m e -- 
      00AB6D CC A6 CD         [ 2]  664     JP SET_FPSW 
                                    665 
                                    666 
                                    667 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    668 ;  SCALEUP ( um u1 u2 -- um* u1 u2* )
                                    669 ;  while (um<=0xccc && u1<u2 ){
                                    670 ;        um*10;
                                    671 ;        u2--;
                                    672 ;  }  
                                    673 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00AB70                        674 SCALEUP:
      00AB70 CD 88 A8         [ 4]  675     CALL DDUP
      00AB73 CD 89 A7         [ 4]  676     CALL LESS  
      002AF6                        677     _QBRAN SCALEUP3
      00AB76 CD 85 19         [ 4]    1     CALL QBRAN
      00AB79 AB A1                    2     .word SCALEUP3
      00AB7B CD 88 5E         [ 4]  678     CALL ROT 
      00AB7E CD 86 9A         [ 4]  679     CALL DUPP 
      002B01                        680     _DOLIT 0XCCC 
      00AB81 CD 84 F0         [ 4]    1     CALL DOLIT 
      00AB84 0C CC                    2     .word 0XCCC 
      00AB86 CD 89 D4         [ 4]  681     CALL GREAT  
      002B09                        682     _TBRAN SCALEUP2 
      00AB89 CD 85 27         [ 4]    1     CALL TBRAN 
      00AB8C AB 9E                    2     .word SCALEUP2 
      002B0E                        683     _DOLIT 10 
      00AB8E CD 84 F0         [ 4]    1     CALL DOLIT 
      00AB91 00 0A                    2     .word 10 
      00AB93 CD 8B A2         [ 4]  684     CALL STAR 
      00AB96 CD 88 7D         [ 4]  685     CALL NROT 
      00AB99 CD 8C 30         [ 4]  686     CALL ONEM
      00AB9C 20 D2            [ 2]  687     JRA SCALEUP
      00AB9E                        688 SCALEUP2:
      00AB9E CD 88 7D         [ 4]  689     CALL NROT 
      00ABA1                        690 SCALEUP3: 
      00ABA1 81               [ 4]  691     RET 
                                    692 
                                    693 
                                    694 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    695 ; SCALEDOWN ( um u1 u2 -- um* u1 u2* )
                                    696 ;  whhile (um && u1>u2 ){ 
                                    697 ;     um/10;
                                    698 ;     u2++;
                                    699 ;  } 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 154.
Hexadecimal [24-Bits]



                                    700 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00ABA2                        701 SCALEDOWN: 
      00ABA2 CD 88 A8         [ 4]  702     CALL DDUP 
      00ABA5 CD 89 D4         [ 4]  703     CALL GREAT 
      002B28                        704     _QBRAN SCALDN3 
      00ABA8 CD 85 19         [ 4]    1     CALL QBRAN
      00ABAB AB CE                    2     .word SCALDN3
      00ABAD CD 88 5E         [ 4]  705     CALL ROT  
      00ABB0 CD 86 9A         [ 4]  706     CALL DUPP 
      00ABB3 CD 86 E3         [ 4]  707     CALL ZEQUAL 
      002B36                        708     _TBRAN SCALDN2  
      00ABB6 CD 85 27         [ 4]    1     CALL TBRAN 
      00ABB9 AB CB                    2     .word SCALDN2 
      002B3B                        709     _DOLIT 10
      00ABBB CD 84 F0         [ 4]    1     CALL DOLIT 
      00ABBE 00 0A                    2     .word 10 
      00ABC0 CD 8B 49         [ 4]  710     CALL SLASH 
      00ABC3 CD 88 7D         [ 4]  711     CALL NROT  
      00ABC6 CD 8C 23         [ 4]  712     CALL ONEP  
      00ABC9 20 D7            [ 2]  713     JRA SCALEDOWN 
      00ABCB                        714 SCALDN2:
      00ABCB CD 88 7D         [ 4]  715     CALL NROT  
      00ABCE                        716 SCALDN3:
      00ABCE 81               [ 4]  717     RET 
                                    718 
                                    719 
                                    720 
                                    721 
                                    722 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    723 ;  F-ALIGN ( f#1 f#2 -- m1 m2 e )
                                    724 ;  align to same exponent 
                                    725 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002B4F                        726     _HEADER FALIGN,7,"F-ALIGN"
      00ABCF AB 4A                    1         .word LINK 
                           002B51     2         LINK=.
      00ABD1 07                       3         .byte 7  
      00ABD2 46 2D 41 4C 49 47 4E     4         .ascii "F-ALIGN"
      00ABD9                          5         FALIGN:
      00ABD9 CD 86 63         [ 4]  727     CALL TOR  
      00ABDC CD 86 AA         [ 4]  728     CALL SWAPP  ; m1 m2 e1 R: e2 
      00ABDF CD 85 B5         [ 4]  729     CALL RFROM ; m1 m2 e1 e2 
      00ABE2 CD 88 A8         [ 4]  730     CALL DDUP  
      00ABE5 CD 89 7B         [ 4]  731     CALL EQUAL 
      002B68                        732     _QBRAN FALGN1 
      00ABE8 CD 85 19         [ 4]    1     CALL QBRAN
      00ABEB AB F1                    2     .word FALGN1
      002B6D                        733     _DROP 
      00ABED 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00ABF0 81               [ 4]  734     RET 
      00ABF1                        735 FALGN1:     
                                    736 ; scale mantissa absolute values 
      00ABF1 CD 86 63         [ 4]  737     CALL TOR 
      00ABF4 CD 86 63         [ 4]  738     CALL TOR   ; m1 m2 R: e2 e1 
      00ABF7 CD A7 72         [ 4]  739     CALL MSIGN 
      00ABFA CD 88 7D         [ 4]  740     CALL NROT  ; m2s m1 m2  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 155.
Hexadecimal [24-Bits]



      00ABFD CD 89 6D         [ 4]  741     CALL ABSS  ; m2s m1 um2 
      00AC00 CD 86 AA         [ 4]  742     CALL SWAPP  ; m2s um2 m1 
      00AC03 CD A7 72         [ 4]  743     CALL MSIGN ; m2s um2 m1 m1s 
      00AC06 CD 88 7D         [ 4]  744     CALL NROT  ; m2s m1s um2 m1     
      00AC09 CD 89 6D         [ 4]  745     CALL ABSS  ; m2s m1s um2 um1 
      00AC0C CD 86 AA         [ 4]  746     CALL SWAPP ; m2s m1s um1 um2       
                                    747 ; scaleup the largest float 
                                    748 ; but limit mantissa <=0xCCC 
                                    749 ; to avoid mantissa overflow     
      00AC0F CD 85 B5         [ 4]  750     CALL RFROM 
      00AC12 CD 85 B5         [ 4]  751     CALL RFROM ; m2s m1s um1 um2 e1 e2 
      00AC15 CD 88 A8         [ 4]  752     CALL DDUP 
      00AC18 CD 89 A7         [ 4]  753     CALL LESS  
      002B9B                        754     _QBRAN FALGN4 ; e2<e1 
      00AC1B CD 85 19         [ 4]    1     CALL QBRAN
      00AC1E AC 25                    2     .word FALGN4
                                    755 ; e2>e1 then scale up m2   
      00AC20 CD AB 70         [ 4]  756     CALL SCALEUP  ; ... um1 um2* e1 e2* 
      00AC23 20 2A            [ 2]  757     JRA FALGN6
      00AC25                        758 FALGN4: ; e2<e1 then scaleup m1 
      00AC25 CD 86 63         [ 4]  759     CALL TOR   ; ... um1 um2 e1 R: e2
      00AC28 CD 86 63         [ 4]  760     CALL TOR   ; ... um1 um2 R: e2 e1 
      00AC2B CD 86 AA         [ 4]  761     CALL SWAPP 
      00AC2E CD 85 B5         [ 4]  762     CALL RFROM  
      00AC31 CD 85 B5         [ 4]  763     CALL RFROM 
      00AC34 CD 86 AA         [ 4]  764     CALL SWAPP ; .. um2 um1 e2 e1 
      00AC37 CD AB 70         [ 4]  765     CALL SCALEUP ; um2 um1* e2 e1* 
      00AC3A CD 86 AA         [ 4]  766     CALL SWAPP 
      00AC3D CD 86 63         [ 4]  767     CALL TOR
      00AC40 CD 86 63         [ 4]  768     CALL TOR     
      00AC43 CD 86 AA         [ 4]  769     CALL SWAPP  ; um1 um2 R: e2 e1
      00AC46 CD 85 B5         [ 4]  770     CALL RFROM 
      00AC49 CD 85 B5         [ 4]  771     CALL RFROM
      00AC4C CD 86 AA         [ 4]  772     CALL SWAPP  ; ... um1 um2 e1 e2  
                                    773 ; check again for e2==e1 
                                    774 ; if scaleup was not enough 
                                    775 ; to equalize exponent then
                                    776 ; scaledown smallest float     
      00AC4F                        777 FALGN6: 
      00AC4F CD 88 A8         [ 4]  778     CALL DDUP 
      00AC52 CD 89 7B         [ 4]  779     CALL EQUAL 
      002BD5                        780     _TBRAN FALGN8 
      00AC55 CD 85 27         [ 4]    1     CALL TBRAN 
      00AC58 AC AA                    2     .word FALGN8 
                                    781 ; e2!=e1 need to scale down smallest 
      00AC5A CD 88 A8         [ 4]  782     CALL DDUP
      00AC5D CD 89 A7         [ 4]  783     CALL LESS  
      002BE0                        784     _QBRAN FALGN7 ; e2<e1 
      00AC60 CD 85 19         [ 4]    1     CALL QBRAN
      00AC63 AC 8E                    2     .word FALGN7
                                    785 ; e2>e1 scaledown m1 
      00AC65 CD 86 63         [ 4]  786     CALL TOR 
      00AC68 CD 86 63         [ 4]  787     CALL TOR 
      00AC6B CD 86 AA         [ 4]  788     CALL SWAPP   ; ... um2 um1 
      00AC6E CD 85 B5         [ 4]  789     CALL RFROM  ; ... um2 um1 e1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 156.
Hexadecimal [24-Bits]



      00AC71 CD 85 B5         [ 4]  790     CALL RFROM  ; ... um2 um1 e1 e2 
      00AC74 CD 86 AA         [ 4]  791     CALL SWAPP  ; ... um2 um1 e2 e1 
      00AC77 CD AB A2         [ 4]  792     CALL SCALEDOWN
      00AC7A CD 86 AA         [ 4]  793     CALL SWAPP 
      00AC7D CD 86 63         [ 4]  794     CALL TOR
      00AC80 CD 86 63         [ 4]  795     CALL TOR 
      00AC83 CD 86 AA         [ 4]  796     CALL SWAPP   ; m1 m2 R: e2 e1  
      00AC86 CD 85 B5         [ 4]  797     CALL RFROM 
      00AC89 CD 85 B5         [ 4]  798     CALL RFROM   ; ... um1 um2 e1 e2 
      00AC8C 20 03            [ 2]  799     JRA FALGN71  
      00AC8E                        800 FALGN7: ; e2<e1 scaledown m2 
      00AC8E CD AB A2         [ 4]  801     CALL SCALEDOWN 
                                    802 ; after scaledown if e2!=e1 
                                    803 ; this imply that one of mantissa 
                                    804 ; as been nullified by scalling 
                                    805 ; hence keep largest exponent 
      00AC91                        806 FALGN71:
      00AC91 CD 88 A8         [ 4]  807     CALL DDUP 
      00AC94 CD 89 7B         [ 4]  808     CALL EQUAL
      002C17                        809     _TBRAN FALGN8 
      00AC97 CD 85 27         [ 4]    1     CALL TBRAN 
      00AC9A AC AA                    2     .word FALGN8 
      00AC9C CD 88 A8         [ 4]  810     CALL DDUP  
      00AC9F CD 89 D4         [ 4]  811     CALL GREAT ; e1>e2 ? 
      002C22                        812     _TBRAN FALGN8
      00ACA2 CD 85 27         [ 4]    1     CALL TBRAN 
      00ACA5 AC AA                    2     .word FALGN8 
      00ACA7 CD 86 AA         [ 4]  813     CALL SWAPP     
      00ACAA                        814 FALGN8: ; m2s m1s um1 um2 e2 e1  
      002C2A                        815     _DROP  ; m2s m1s um1 um2 e 
      00ACAA 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00ACAD CD 86 63         [ 4]  816     CALL TOR 
      00ACB0 CD 86 63         [ 4]  817     CALL TOR 
      00ACB3 CD 86 AA         [ 4]  818     CALL SWAPP ; m2s um1 m1s 
      002C36                        819     _QBRAN FALGN9 
      00ACB6 CD 85 19         [ 4]    1     CALL QBRAN
      00ACB9 AC BE                    2     .word FALGN9
      00ACBB CD 89 07         [ 4]  820     CALL NEGAT 
      00ACBE                        821 FALGN9:  
      00ACBE CD 86 AA         [ 4]  822     CALL SWAPP 
      00ACC1 CD 85 B5         [ 4]  823     CALL RFROM 
      00ACC4 CD 86 AA         [ 4]  824     CALL SWAPP 
      002C47                        825     _QBRAN FALGN10 
      00ACC7 CD 85 19         [ 4]    1     CALL QBRAN
      00ACCA AC CF                    2     .word FALGN10
      00ACCC CD 89 07         [ 4]  826     CALL NEGAT 
      00ACCF                        827 FALGN10: ; m1 m2 
      00ACCF CD 85 B5         [ 4]  828     CALL RFROM ; m1 m2 e 
      00ACD2 81               [ 4]  829     RET 
                                    830 
                                    831 
                                    832 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    833 ;  add 2 mantissa and ajust 
                                    834 ;  for overflow 
                                    835 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 157.
Hexadecimal [24-Bits]



      00ACD3                        836 MPLUS: ; m1 m2 e -- m* e* )  
      00ACD3 CD 86 63         [ 4]  837     CALL TOR 
      00ACD6 90 93            [ 1]  838     LDW Y,X 
      00ACD8 90 FE            [ 2]  839     LDW Y,(Y)
      00ACDA 90 89            [ 2]  840     PUSHW Y 
      00ACDC 90 93            [ 1]  841     LDW Y,X 
      00ACDE 90 EE 02         [ 2]  842     LDW Y,(2,Y)
      00ACE1 72 F9 01         [ 2]  843     ADDW Y,(1,SP)
      00ACE4 EF 02            [ 2]  844     LDW (2,X),Y ; sum 
      00ACE6 90 85            [ 2]  845     POPW Y ; drop local variable m2 
      00ACE8 28 40            [ 1]  846     JRNV 3$  ; no overflow, done 
                                    847 ; increment e 
      00ACEA 16 01            [ 2]  848     LDW Y,(1,SP) ; e
      00ACEC 72 A9 00 01      [ 2]  849     ADDW Y,#1    ; increment e 
      00ACF0 17 01            [ 2]  850     LDW (1,SP),Y
                                    851 ; divide mantissa by 10
      00ACF2 E6 02            [ 1]  852     LD A,(2,X) 
      00ACF4 88               [ 1]  853     PUSH A 
      00ACF5 2B 09            [ 1]  854     JRMI 0$ 
      00ACF7 90 93            [ 1]  855     LDW Y,X 
      00ACF9 90 EE 02         [ 2]  856     LDW Y,(2,Y)
      00ACFC 90 50            [ 2]  857     NEGW Y 
      00ACFE EF 02            [ 2]  858     LDW (2,X),Y 
      00AD00 90 AE 00 0A      [ 2]  859 0$: LDW Y,#10 
      00AD04 FF               [ 2]  860     LDW (X),Y 
      00AD05 CD 8A 81         [ 4]  861     CALL USLMOD ; remainder  sum/10 
      00AD08 CD 86 AA         [ 4]  862     CALL SWAPP
      002C8B                        863     _DOLIT 5 
      00AD0B CD 84 F0         [ 4]    1     CALL DOLIT 
      00AD0E 00 05                    2     .word 5 
      00AD10 CD 89 A7         [ 4]  864     CALL LESS
      00AD13 84               [ 1]  865     POP A 
      002C94                        866     _TBRAN 2$
      00AD14 CD 85 27         [ 4]    1     CALL TBRAN 
      00AD17 AD 27                    2     .word 2$ 
      00AD19 90 93            [ 1]  867     LDW Y,X
      00AD1B 90 FE            [ 2]  868     LDW Y,(Y) 
      00AD1D 72 A9 00 01      [ 2]  869     ADDW Y,#1
      00AD21 4D               [ 1]  870     TNZ A 
      00AD22 2B 02            [ 1]  871     JRMI 1$
      00AD24 90 50            [ 2]  872     NEGW Y 
      00AD26 FF               [ 2]  873 1$: LDW (X),Y  
      00AD27 1D 00 02         [ 2]  874 2$: SUBW X,#CELLL  
      00AD2A                        875 3$: 
      00AD2A 90 85            [ 2]  876     POPW Y  ; e 
      00AD2C FF               [ 2]  877     LDW (X),Y  ; e  
      00AD2D 81               [ 4]  878     RET 
                                    879 
                                    880 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    881 ;   F+ ( f#1 f#2 -- f#1+f#2 )
                                    882 ;   float addition 
                                    883 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002CAE                        884     _HEADER FPLUS,2,"F+"
      00AD2E AB D1                    1         .word LINK 
                           002CB0     2         LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 158.
Hexadecimal [24-Bits]



      00AD30 02                       3         .byte 2  
      00AD31 46 2B                    4         .ascii "F+"
      00AD33                          5         FPLUS:
      00AD33 CD AB D9         [ 4]  885     CALL FALIGN 
      00AD36 CD AC D3         [ 4]  886     CALL MPLUS
      00AD39 CD A6 CD         [ 4]  887     CALL SET_FPSW
      00AD3C 81               [ 4]  888     RET 
                                    889 
                                    890 
                                    891 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    892 ;  F- ( f#1 f#2 -- f#1-f#2 )
                                    893 ;  substraction 
                                    894 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002CBD                        895     _HEADER FSUB,2,"F-"
      00AD3D AD 30                    1         .word LINK 
                           002CBF     2         LINK=.
      00AD3F 02                       3         .byte 2  
      00AD40 46 2D                    4         .ascii "F-"
      00AD42                          5         FSUB:
      00AD42 90 93            [ 1]  896     LDW Y,x
      00AD44 90 EE 02         [ 2]  897     LDW Y,(2,Y)
      00AD47 90 50            [ 2]  898     NEGW Y 
      00AD49 EF 02            [ 2]  899     LDW (2,X),Y 
      00AD4B 20 E6            [ 2]  900     JRA FPLUS  
                                    901 
                                    902 
                                    903 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    904 ;   DS/MOD ( ud us - ur qud )
                                    905 ;   unsigned divide double by single 
                                    906 ;   return double quotient 
                                    907 ;   and single remainder 
                                    908 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002CCD                        909     _HEADER DSLMOD,6,"DS/MOD"
      00AD4D AD 3F                    1         .word LINK 
                           002CCF     2         LINK=.
      00AD4F 06                       3         .byte 6  
      00AD50 44 53 2F 4D 4F 44        4         .ascii "DS/MOD"
      00AD56                          5         DSLMOD:
      00AD56 90 93            [ 1]  910         LDW     Y,X             ; stack pointer to Y
      00AD58 FE               [ 2]  911         LDW     X,(X)           ; us
      00AD59 BF 26            [ 2]  912         LDW     YTEMP,X         ; save us
      00AD5B 93               [ 1]  913         LDW     X,Y
      00AD5C 89               [ 2]  914         PUSHW   X               ; save stack pointer
      00AD5D 90 89            [ 2]  915         PUSHW   Y 
      00AD5F EE 02            [ 2]  916         LDW     X,(2,X)           ; X=udh
      00AD61 90 BE 26         [ 2]  917         LDW     Y,YTEMP         ; divisor 
      00AD64 65               [ 2]  918         DIVW    X,Y 
      00AD65 BF 24            [ 2]  919         LDW     XTEMP,X         ; QUOTIENT hi 
      00AD67 93               [ 1]  920         LDW     X,Y             ; remainder in X 
      00AD68 90 85            [ 2]  921         POPW    Y 
      00AD6A 90 EE 04         [ 2]  922         LDW     Y,(4,Y)         ; Y=udl (offset before drop)
      00AD6D A6 10            [ 1]  923         LD      A,#16           ; loop count
      00AD6F 90 58            [ 2]  924         SLLW    Y               ; udl shift udl into udh
      00AD71                        925 DSLMOD3:
      00AD71 59               [ 2]  926         RLCW    X               ; rotate udl bit into uhdh (= remainder)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 159.
Hexadecimal [24-Bits]



      00AD72 25 04            [ 1]  927         JRC     DSLMODa         ; if carry out of rotate
      00AD74 B3 26            [ 2]  928         CPW     X,YTEMP         ; compare udh to un
      00AD76 25 05            [ 1]  929         JRULT   DSLMOD4         ; can't subtract
      00AD78                        930 DSLMODa:
      00AD78 72 B0 00 26      [ 2]  931         SUBW    X,YTEMP         ; can subtract
      00AD7C 98               [ 1]  932         RCF
      00AD7D                        933 DSLMOD4:
      00AD7D 8C               [ 1]  934         CCF                     ; quotient bit
      00AD7E 90 59            [ 2]  935         RLCW    Y               ; rotate into quotient, rotate out udl
      00AD80 4A               [ 1]  936         DEC     A               ; repeat
      00AD81 26 EE            [ 1]  937         JRNE    DSLMOD3           ; if A == 0
      00AD83                        938 DSLMODb:
      00AD83 BF 26            [ 2]  939         LDW     YTEMP,X         ; done, save remainder
      00AD85 85               [ 2]  940         POPW    X               ; restore stack pointer
      00AD86 EF 02            [ 2]  941         LDW     (2,X),Y           ; save quotient low 
      00AD88 90 BE 24         [ 2]  942         LDW     Y,XTEMP         ; quotient hi 
      00AD8B FF               [ 2]  943         LDW     (X),Y           ; save quotient hi 
      00AD8C 90 BE 26         [ 2]  944         LDW     Y,YTEMP         ; remainder onto stack
      00AD8F EF 04            [ 2]  945         LDW     (4,X),Y
      00AD91 81               [ 4]  946         RET 
                                    947 
                                    948 
                                    949 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    950 ;   SCALE>M ( ud1 -- e u )
                                    951 ;   scale down a double  
                                    952 ;   by repeated ud1/10
                                    953 ;   until ud<=MAX_MANTISSA   
                                    954 ;   e is log10 exponent of scaled down
                                    955 ;   u is scaled down ud1 
                                    956 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002D12                        957     _HEADER SCALETOM,7,"SCALE>M"
      00AD92 AD 4F                    1         .word LINK 
                           002D14     2         LINK=.
      00AD94 07                       3         .byte 7  
      00AD95 53 43 41 4C 45 3E 4D     4         .ascii "SCALE>M"
      00AD9C                          5         SCALETOM:
      00AD9C 90 5F            [ 1]  958     CLRW Y 
      00AD9E 90 89            [ 2]  959     PUSHW Y  ; local variable to save last remainder 
      00ADA0 CD 8C 8F         [ 4]  960     CALL ZERO 
      00ADA3 CD 88 7D         [ 4]  961     CALL NROT ;  e ud 
      00ADA6                        962 SCAL1:
      00ADA6 CD 86 9A         [ 4]  963     CALL DUPP 
      00ADA9 CD 86 E3         [ 4]  964     CALL ZEQUAL  
      002D2C                        965     _QBRAN SCAL2  
      00ADAC CD 85 19         [ 4]    1     CALL QBRAN
      00ADAF AD C1                    2     .word SCAL2
      00ADB1 CD 86 C2         [ 4]  966     CALL OVER 
      002D34                        967     _DOLIT MAX_MANTISSA
      00ADB4 CD 84 F0         [ 4]    1     CALL DOLIT 
      00ADB7 7F FF                    2     .word MAX_MANTISSA 
      00ADB9 CD 89 BE         [ 4]  968     CALL UGREAT 
      002D3C                        969     _QBRAN SCAL3
      00ADBC CD 85 19         [ 4]    1     CALL QBRAN
      00ADBF AD E0                    2     .word SCAL3
      00ADC1                        970 SCAL2:     
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 160.
Hexadecimal [24-Bits]



      002D41                        971     _DOLIT 10 
      00ADC1 CD 84 F0         [ 4]    1     CALL DOLIT 
      00ADC4 00 0A                    2     .word 10 
      00ADC6 CD AD 56         [ 4]  972     CALL DSLMOD
      00ADC9 CD 88 5E         [ 4]  973     CALL ROT  
                                    974 ; save remainder on rstack     
      00ADCC 90 93            [ 1]  975     LDW Y,X 
      00ADCE 90 FE            [ 2]  976     LDW Y,(Y)
      00ADD0 17 01            [ 2]  977     LDW (1,SP),Y 
      00ADD2 1C 00 02         [ 2]  978     ADDW X,#CELLL ; drop it from dstack 
      00ADD5 CD 88 5E         [ 4]  979     CALL ROT 
      00ADD8 CD 8C 23         [ 4]  980     CALL ONEP 
      00ADDB CD 88 7D         [ 4]  981     CALL NROT  
      00ADDE 20 C6            [ 2]  982     JRA SCAL1 
      00ADE0                        983 SCAL3: 
      002D60                        984     _DROP ; drop ud high
      00ADE0 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00ADE3 CD 85 B5         [ 4]  985     CALL RFROM ; last remainder  
      002D66                        986     _DOLIT 5 
      00ADE6 CD 84 F0         [ 4]    1     CALL DOLIT 
      00ADE9 00 05                    2     .word 5 
      00ADEB CD 89 A7         [ 4]  987     CALL LESS 
      002D6E                        988     _TBRAN SCAL4
      00ADEE CD 85 27         [ 4]    1     CALL TBRAN 
      00ADF1 AD F6                    2     .word SCAL4 
      00ADF3 CD 8C 23         [ 4]  989     CALL ONEP 
      00ADF6                        990 SCAL4:      
      00ADF6 81               [ 4]  991     RET 
                                    992 
                                    993 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    994 ;    F* ( f#1 f#2 -- f#3 )
                                    995 ;    float24 product 
                                    996 ;    f#3=f#1 * f#2 
                                    997 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002D77                        998     _HEADER FSTAR,2,"F*"
      00ADF7 AD 94                    1         .word LINK 
                           002D79     2         LINK=.
      00ADF9 02                       3         .byte 2  
      00ADFA 46 2A                    4         .ascii "F*"
      00ADFC                          5         FSTAR:
      00ADFC CD 86 63         [ 4]  999     CALL TOR   ; m1 e1 m2 R: e2 
      00ADFF CD 86 AA         [ 4] 1000     CALL SWAPP ; m1 m2 e1  R: e2 
      00AE02 CD 85 B5         [ 4] 1001     CALL RFROM 
      00AE05 CD 88 BD         [ 4] 1002     CALL PLUS  ; m1 m2 e 
      00AE08 CD 86 63         [ 4] 1003     CALL TOR   ; m1 m2 R: e  
      00AE0B CD A7 72         [ 4] 1004     CALL MSIGN
      00AE0E CD 86 63         [ 4] 1005     CALL TOR   ; m1 m2 R: e m2sign 
      00AE11 CD 89 6D         [ 4] 1006     CALL ABSS  
      00AE14 CD 86 AA         [ 4] 1007     CALL SWAPP ; um2 m1  R: e m2sign 
      00AE17 CD A7 72         [ 4] 1008     CALL MSIGN ; um2 m1 m1sign R: e m2sign 
      00AE1A CD 85 B5         [ 4] 1009     CALL RFROM   
      00AE1D CD 87 20         [ 4] 1010     CALL XORR 
      00AE20 CD 88 7D         [ 4] 1011     CALL NROT   ; *sign um2 m1 R: e 
      00AE23 CD 89 6D         [ 4] 1012     CALL ABSS  ; *sign um2 um1 R: e 
      00AE26 CD 8B 58         [ 4] 1013     CALL UMSTA 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 161.
Hexadecimal [24-Bits]



      00AE29 CD AD 9C         [ 4] 1014     CALL SCALETOM
      00AE2C CD 86 AA         [ 4] 1015     CALL SWAPP 
      00AE2F CD 85 B5         [ 4] 1016     CALL RFROM 
      00AE32 CD 88 BD         [ 4] 1017     CALL PLUS 
      00AE35 CD 86 63         [ 4] 1018     CALL TOR 
      00AE38 CD 86 AA         [ 4] 1019     CALL SWAPP 
      002DBB                       1020     _QBRAN 1$
      00AE3B CD 85 19         [ 4]    1     CALL QBRAN
      00AE3E AE 43                    2     .word 1$
      00AE40 CD 89 07         [ 4] 1021     CALL NEGAT 
      00AE43 CD 85 B5         [ 4] 1022 1$: CALL RFROM  
      00AE46 CC A6 CD         [ 2] 1023     JP SET_FPSW 
                                   1024 
                                   1025 
                                   1026 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1027 ;  F/ ( f#1 f#2 -- f#3 )
                                   1028 ;  float division
                                   1029 ;  f#3 = f#1/f#2
                                   1030 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002DC9                       1031     _HEADER FSLASH,2,"F/"
      00AE49 AD F9                    1         .word LINK 
                           002DCB     2         LINK=.
      00AE4B 02                       3         .byte 2  
      00AE4C 46 2F                    4         .ascii "F/"
      00AE4E                          5         FSLASH:
      00AE4E CD 86 63         [ 4] 1032     CALL TOR    ; m1 e1 m2   R: e2 
      00AE51 CD 86 AA         [ 4] 1033     CALL SWAPP
      00AE54 CD 85 B5         [ 4] 1034     CALL RFROM 
      00AE57 CD 89 53         [ 4] 1035     CALL SUBB 
      00AE5A CD 86 63         [ 4] 1036     CALL TOR   ; m1 m2 R: e   
      00AE5D CD A7 72         [ 4] 1037     CALL MSIGN 
      00AE60 CD 86 63         [ 4] 1038     CALL TOR   ; m1 m2 R: e m2s 
      00AE63 CD 89 6D         [ 4] 1039     CALL ABSS   ; m1 um2 R: e m2s 
      00AE66 CD 86 AA         [ 4] 1040     CALL SWAPP  ;um2 m1 R: e m2s 
      00AE69 CD A7 72         [ 4] 1041     CALL MSIGN  ; um2 m1 m1s R: e m2s 
      00AE6C CD 85 B5         [ 4] 1042     CALL RFROM  ; um2 m1 m1s m2s R: e
      00AE6F CD 87 20         [ 4] 1043     CALL XORR   
      00AE72 CD 88 7D         [ 4] 1044     CALL NROT  ; qsign um2 m1 
      00AE75 CD 89 6D         [ 4] 1045     CALL ABSS  ; qsign um2 um1 R: e 
      00AE78 CD 86 AA         [ 4] 1046     CALL SWAPP ; qsign um1 um2 R: e  
      00AE7B CD 86 9A         [ 4] 1047     CALL DUPP 
      00AE7E CD 86 63         [ 4] 1048     CALL TOR   ; qsign um1 um2 R: e um2 
      00AE81 CD 8A 81         [ 4] 1049     CALL USLMOD ; qsign ur uq R: e um2 
      00AE84                       1050 FSLASH1: ; fraction loop 
                                   1051 ; check for null remainder 
      00AE84 E6 02            [ 1] 1052     LD A,(2,X)
      00AE86 EA 03            [ 1] 1053     OR A,(3,X)
      00AE88 27 40            [ 1] 1054     JREQ FSLASH8 
                                   1055 ; get fractional digits from remainder until mantissa saturate
                                   1056 ; qsign remainder mantissa R: e divisor 
                                   1057 ; check for mantissa saturation 
      00AE8A CD 86 9A         [ 4] 1058     CALL DUPP 
      002E0D                       1059     _DOLIT 0xCCC 
      00AE8D CD 84 F0         [ 4]    1     CALL DOLIT 
      00AE90 0C CC                    2     .word 0xCCC 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 162.
Hexadecimal [24-Bits]



      00AE92 CD 89 BE         [ 4] 1060     CALL UGREAT
      002E15                       1061     _TBRAN FSLASH8 ; another loop would result in mantissa overflow 
      00AE95 CD 85 27         [ 4]    1     CALL TBRAN 
      00AE98 AE CA                    2     .word FSLASH8 
                                   1062 ; multiply mantissa by 10 
      002E1A                       1063     _DOLIT 10 
      00AE9A CD 84 F0         [ 4]    1     CALL DOLIT 
      00AE9D 00 0A                    2     .word 10 
      00AE9F CD 8B A2         [ 4] 1064     CALL STAR 
                                   1065 ; mutliply remainder by 10     
      00AEA2 CD 86 AA         [ 4] 1066     CALL SWAPP
      002E25                       1067     _DOLIT 10  
      00AEA5 CD 84 F0         [ 4]    1     CALL DOLIT 
      00AEA8 00 0A                    2     .word 10 
      00AEAA CD 8B A2         [ 4] 1068     CALL STAR 
                                   1069 ; divide remainder by um2     
      00AEAD CD 85 C6         [ 4] 1070     CALL RAT  ; mantissa remainder divisor R: e divisor 
      00AEB0 CD 8A 81         [ 4] 1071     CALL USLMOD ; mantissa dr dq R: e divisor 
      00AEB3 CD 86 AA         [ 4] 1072     CALL SWAPP ; mantissa frac_digit remainder R:  e divisor  
      00AEB6 CD 86 63         [ 4] 1073     CALL TOR  ; mantissa frac_digit R: e divisor remainder 
      00AEB9 CD 88 BD         [ 4] 1074     CALL PLUS ; mantissa+frac_digit 
      00AEBC CD 85 B5         [ 4] 1075     CALL RFROM ; mantissa remainder R: e divisor  
      00AEBF CD 86 AA         [ 4] 1076     CALL SWAPP  ; remainder mantissa  
                                   1077 ; decrement e 
      00AEC2 16 03            [ 2] 1078     LDW Y,(3,SP) ; e 
      00AEC4 90 5A            [ 2] 1079     DECW Y 
      00AEC6 17 03            [ 2] 1080     LDW (3,SP),Y 
      00AEC8 20 BA            [ 2] 1081     JRA FSLASH1
      00AECA                       1082 FSLASH8: ; qsign remainder mantissa R: qs e divisor 
                                   1083 ; round to nearest digit, i.e r>=divisor/2
      00AECA CD 86 AA         [ 4] 1084     CALL SWAPP  
      00AECD CD 85 B5         [ 4] 1085     CALL RFROM 
      00AED0 CD 8C 75         [ 4] 1086     CALL TWOSL 
      00AED3 CD 89 91         [ 4] 1087     CALL ULESS  
      002E56                       1088     _TBRAN FSLASH85 
      00AED6 CD 85 27         [ 4]    1     CALL TBRAN 
      00AED9 AE DE                    2     .word FSLASH85 
      00AEDB CD 8C 23         [ 4] 1089     CALL ONEP 
      00AEDE                       1090 FSLASH85: 
      00AEDE CD 86 AA         [ 4] 1091     CALL SWAPP ; quotient qsign
      002E61                       1092     _QBRAN FSLASH9 
      00AEE1 CD 85 19         [ 4]    1     CALL QBRAN
      00AEE4 AE E9                    2     .word FSLASH9
      00AEE6 CD 89 07         [ 4] 1093     CALL NEGAT  
      00AEE9                       1094 FSLASH9:
      00AEE9 CD 85 B5         [ 4] 1095     CALL RFROM  ; exponent 
      00AEEC CC A6 CD         [ 2] 1096     JP SET_FPSW
                                   1097     
                                   1098 
                                   1099 
                                   1100 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1101 ;   S>F  ( # -- f# )
                                   1102 ;   convert double to float 
                                   1103 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002E6F                       1104     _HEADER STOF,3,"S>F"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 163.
Hexadecimal [24-Bits]



      00AEEF AE 4B                    1         .word LINK 
                           002E71     2         LINK=.
      00AEF1 03                       3         .byte 3  
      00AEF2 53 3E 46                 4         .ascii "S>F"
      00AEF5                          5         STOF:
      00AEF5 CD 8C 8F         [ 4] 1105     CALL ZERO 
      00AEF8 CC A6 CD         [ 2] 1106     JP SET_FPSW
                                   1107 
                                   1108 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1109 ;   F>S  ( f# -- n )
                                   1110 ;  convert float24 to single  
                                   1111 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002E7B                       1112     _HEADER FTOS,3,"F>S"
      00AEFB AE F1                    1         .word LINK 
                           002E7D     2         LINK=.
      00AEFD 03                       3         .byte 3  
      00AEFE 46 3E 53                 4         .ascii "F>S"
      00AF01                          5         FTOS:
      00AF01 CD 88 4D         [ 4] 1113     CALL QDUP
      002E84                       1114     _QBRAN FTOD9
      00AF04 CD 85 19         [ 4]    1     CALL QBRAN
      00AF07 AF 86                    2     .word FTOD9
      00AF09 CD 86 63         [ 4] 1115     CALL TOR 
      00AF0C CD A7 72         [ 4] 1116     CALL MSIGN 
      00AF0F CD 86 AA         [ 4] 1117     CALL SWAPP 
      00AF12 CD 89 6D         [ 4] 1118     CALL ABSS
      00AF15 CD 85 B5         [ 4] 1119     CALL RFROM  
      00AF18 CD 86 9A         [ 4] 1120     CALL DUPP   
      00AF1B CD 86 D1         [ 4] 1121     CALL ZLESS 
      002E9E                       1122     _QBRAN FTOD4 
      00AF1E CD 85 19         [ 4]    1     CALL QBRAN
      00AF21 AF 60                    2     .word FTOD4
                                   1123 ; negative exponent 
      00AF23 CD 89 6D         [ 4] 1124     CALL ABSS 
      00AF26 CD 86 63         [ 4] 1125     CALL TOR
      00AF29 20 26            [ 2] 1126     JRA FTOD2  
      00AF2B                       1127 FTOD1:
      00AF2B CD 88 A8         [ 4] 1128     CALL DDUP 
      00AF2E CD 86 E3         [ 4] 1129     CALL ZEQUAL 
      002EB1                       1130     _TBRAN FTOD3 
      00AF31 CD 85 27         [ 4]    1     CALL TBRAN 
      00AF34 AF 58                    2     .word FTOD3 
      002EB6                       1131     _DOLIT 10 
      00AF36 CD 84 F0         [ 4]    1     CALL DOLIT 
      00AF39 00 0A                    2     .word 10 
      00AF3B CD 8A 81         [ 4] 1132     CALL USLMOD 
      00AF3E CD 86 AA         [ 4] 1133     CALL SWAPP  
      002EC1                       1134     _DOLIT 5 
      00AF41 CD 84 F0         [ 4]    1     CALL DOLIT 
      00AF44 00 05                    2     .word 5 
      00AF46 CD 89 A7         [ 4] 1135     CALL LESS 
      002EC9                       1136     _TBRAN FTOD2  
      00AF49 CD 85 27         [ 4]    1     CALL TBRAN 
      00AF4C AF 51                    2     .word FTOD2 
      00AF4E CD 8C 23         [ 4] 1137     CALL ONEP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 164.
Hexadecimal [24-Bits]



      00AF51                       1138 FTOD2:      
      002ED1                       1139     _DONXT FTOD1
      00AF51 CD 85 04         [ 4]    1     CALL DONXT 
      00AF54 AF 2B                    2     .word FTOD1 
      00AF56 20 23            [ 2] 1140     JRA FTOD8   
      00AF58                       1141 FTOD3: 
      00AF58 CD 85 B5         [ 4] 1142     CALL RFROM 
      002EDB                       1143     _DROP 
      00AF5B 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00AF5E 20 1B            [ 2] 1144     JRA FTOD8  
                                   1145 ; positive exponent 
      00AF60                       1146 FTOD4:
      00AF60 CD 86 63         [ 4] 1147     CALL TOR 
      00AF63 20 11            [ 2] 1148     JRA FTOD6
      00AF65                       1149 FTOD5:
      002EE5                       1150     _DOLIT 10 
      00AF65 CD 84 F0         [ 4]    1     CALL DOLIT 
      00AF68 00 0A                    2     .word 10 
      00AF6A CD 8B 58         [ 4] 1151     CALL UMSTA
      002EED                       1152     _QBRAN FTOD6 
      00AF6D CD 85 19         [ 4]    1     CALL QBRAN
      00AF70 AF 76                    2     .word FTOD6
      00AF72 5B 02            [ 2] 1153     ADDW SP,#CELLL 
      00AF74 20 05            [ 2] 1154     JRA FTOD8  
      00AF76                       1155 FTOD6: 
      002EF6                       1156     _DONXT FTOD5 
      00AF76 CD 85 04         [ 4]    1     CALL DONXT 
      00AF79 AF 65                    2     .word FTOD5 
      00AF7B                       1157 FTOD8:
      00AF7B CD 88 5E         [ 4] 1158     CALL ROT 
      002EFE                       1159     _QBRAN FTOD9 
      00AF7E CD 85 19         [ 4]    1     CALL QBRAN
      00AF81 AF 86                    2     .word FTOD9
      00AF83 CD 89 07         [ 4] 1160     CALL NEGAT
      00AF86                       1161 FTOD9:          
      00AF86 81               [ 4] 1162     RET 
                                   1163 
                                   1164 
                                   1165 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1166 ; DSWAP ( f#1 f#2 -- f#2 f#1 )
                                   1167 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002F07                       1168     _HEADER DSWAP,5,"DSWAP"
      00AF87 AE FD                    1         .word LINK 
                           002F09     2         LINK=.
      00AF89 05                       3         .byte 5  
      00AF8A 44 53 57 41 50           4         .ascii "DSWAP"
      00AF8F                          5         DSWAP:
      00AF8F 90 93            [ 1] 1169     LDW Y,X 
      00AF91 90 FE            [ 2] 1170     LDW Y,(Y)
      00AF93 90 89            [ 2] 1171     PUSHW Y 
      00AF95 90 93            [ 1] 1172     LDW Y,X 
      00AF97 90 EE 02         [ 2] 1173     LDW Y,(2,Y)
      00AF9A 90 89            [ 2] 1174     PUSHW Y 
      00AF9C 90 93            [ 1] 1175     LDW Y,X 
      00AF9E 90 EE 04         [ 2] 1176     LDW Y,(4,Y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 165.
Hexadecimal [24-Bits]



      00AFA1 FF               [ 2] 1177     LDW (X),Y 
      00AFA2 90 93            [ 1] 1178     LDW Y,X 
      00AFA4 90 EE 06         [ 2] 1179     LDW Y,(6,Y)
      00AFA7 EF 02            [ 2] 1180     LDW (2,X),Y 
      00AFA9 90 85            [ 2] 1181     POPW Y 
      00AFAB EF 06            [ 2] 1182     LDW (6,X),Y 
      00AFAD 90 85            [ 2] 1183     POPW Y 
      00AFAF EF 04            [ 2] 1184     LDW (4,X),Y 
      00AFB1 CC A6 CD         [ 2] 1185     JP SET_FPSW  ; reflect state of top float 
                                   1186 
                                   1187 
                                   1188 ;;;;;;;;;;;;;;;;;;;;;;;;
                                   1189 ;   F0< ( f# -- f )
                                   1190 ;   true if f#<0
                                   1191 ;;;;;;;;;;;;;;;;;;;;;;;;
      002F34                       1192     _HEADER FZLESS,3,"F0<"
      00AFB4 AF 89                    1         .word LINK 
                           002F36     2         LINK=.
      00AFB6 03                       3         .byte 3  
      00AFB7 46 30 3C                 4         .ascii "F0<"
      00AFBA                          5         FZLESS:
      002F3A                       1193     _DROP 
      00AFBA 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00AFBD CC 86 D1         [ 2] 1194     JP ZLESS 
                                   1195 
                                   1196 
                                   1197 ;;;;;;;;;;;;;;;;;;;;;;;;
                                   1198 ;   F< ( f#1 f#2 -- f )
                                   1199 ;;;;;;;;;;;;;;;;;;;;;;;
      002F40                       1200     _HEADER FLESS,2,"F<"
      00AFC0 AF B6                    1         .word LINK 
                           002F42     2         LINK=.
      00AFC2 02                       3         .byte 2  
      00AFC3 46 3C                    4         .ascii "F<"
      00AFC5                          5         FLESS:
      00AFC5 CD AD 42         [ 4] 1201     CALL FSUB 
      00AFC8 20 F0            [ 2] 1202     JRA FZLESS 
                                   1203 
                                   1204 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1205 ;   F> ( f#1 f#2 -- f )
                                   1206 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002F4A                       1207     _HEADER FGREAT,2,"F>"
      00AFCA AF C2                    1         .word LINK 
                           002F4C     2         LINK=.
      00AFCC 02                       3         .byte 2  
      00AFCD 46 3E                    4         .ascii "F>"
      00AFCF                          5         FGREAT:
      00AFCF CD AF 8F         [ 4] 1208     CALL DSWAP 
      00AFD2 20 F1            [ 2] 1209     JRA FLESS 
                                   1210 
                                   1211 
                                   1212 
                                   1213 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1214 ;   F= ( f#1 f#2 -- f ) 
                                   1215 ;   true if f#1==f#2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 166.
Hexadecimal [24-Bits]



                                   1216 ;;;;;;;;;;;;;;;;;;;;;;;;;
      002F54                       1217     _HEADER FEQUAL,2,"F="
      00AFD4 AF CC                    1         .word LINK 
                           002F56     2         LINK=.
      00AFD6 02                       3         .byte 2  
      00AFD7 46 3D                    4         .ascii "F="
      00AFD9                          5         FEQUAL:
      00AFD9 4F               [ 1] 1218     CLR A 
      00AFDA 90 93            [ 1] 1219     LDW Y,X 
      00AFDC 90 FE            [ 2] 1220     LDW Y,(Y)
      00AFDE 90 BF 26         [ 2] 1221     LDW YTEMP,Y  
      00AFE1 90 93            [ 1] 1222     LDW Y,X 
      00AFE3 90 EE 04         [ 2] 1223     LDW Y,(4,Y)
      00AFE6 90 B3 26         [ 2] 1224     CPW Y,YTEMP
      00AFE9 26 14            [ 1] 1225     JRNE 1$
      00AFEB 90 93            [ 1] 1226     LDW Y,X 
      00AFED 90 EE 02         [ 2] 1227     LDW Y,(2,Y)
      00AFF0 90 BF 26         [ 2] 1228     LDW YTEMP,Y 
      00AFF3 90 93            [ 1] 1229     LDW Y,X 
      00AFF5 90 EE 06         [ 2] 1230     LDW Y,(6,Y)
      00AFF8 90 B3 26         [ 2] 1231     CPW Y,YTEMP 
      00AFFB 26 02            [ 1] 1232     JRNE 1$ 
      00AFFD A6 FF            [ 1] 1233     LD A,#255
      00AFFF                       1234 1$: 
      00AFFF 1C 00 02         [ 2] 1235     ADDW X,#CELLL 
      00B002 F7               [ 1] 1236     LD (X),A 
      00B003 E7 01            [ 1] 1237     LD (1,X),A 
      00B005 81               [ 4] 1238     RET 
                                   1239 
                                   1240 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1241 ;   F0= ( f# -- f )
                                   1242 ;   true if f# is 0.0 
                                   1243 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      002F86                       1244     _HEADER FZEQUAL,3,"F0="
      00B006 AF D6                    1         .word LINK 
                           002F88     2         LINK=.
      00B008 03                       3         .byte 3  
      00B009 46 30 3D                 4         .ascii "F0="
      00B00C                          5         FZEQUAL:
      002F8C                       1245     _DROP  
      00B00C 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00B00F CC 86 E3         [ 2] 1246     JP ZEQUAL  
                                   1247 
                                   1248 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1249 ;  FNEGATE ( f#1 -- f#2 )
                                   1250 ;  f#2 is negation of f#1 
                                   1251 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      002F92                       1252     _HEADER FNEGA,7,"FNEGATE"
      00B012 B0 08                    1         .word LINK 
                           002F94     2         LINK=.
      00B014 07                       3         .byte 7  
      00B015 46 4E 45 47 41 54 45     4         .ascii "FNEGATE"
      00B01C                          5         FNEGA:
      00B01C CD 86 63         [ 4] 1253     CALL TOR 
      00B01F CD 89 07         [ 4] 1254     CALL NEGAT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 167.
Hexadecimal [24-Bits]



      00B022 CD 85 B5         [ 4] 1255     CALL RFROM 
      00B025 CC A6 CD         [ 2] 1256     JP SET_FPSW
                                   1257      
                                   1258 
                                   1259 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1260 ;  FABS ( f#1 -- abs(f#1) )
                                   1261 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002FA8                       1262     _HEADER FABS,4,"FABS"
      00B028 B0 14                    1         .word LINK 
                           002FAA     2         LINK=.
      00B02A 04                       3         .byte 4  
      00B02B 46 41 42 53              4         .ascii "FABS"
      00B02F                          5         FABS:
      00B02F CD 86 63         [ 4] 1263     CALL TOR 
      00B032 CD 89 6D         [ 4] 1264     CALL ABSS 
      00B035 CD 85 B5         [ 4] 1265     CALL RFROM 
      00B038 CC A6 CD         [ 2] 1266     JP SET_FPSW
                                   1267      
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 168.
Hexadecimal [24-Bits]



                                   4709 .endif 
                                   4710 
                                   4711 ;===============================================================
                                   4712 
                           002FAA  4713 LASTN =	LINK   ;last name defined
                                   4714 
                                   4715 ; application code begin here
      00B080                       4716 	.bndry 128 ; align on flash block  
      00B080                       4717 app_space: 
                                   4718 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 169.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   6 AB1        0008F6 R   |   6 ABOR1      0014EC R
  6 ABOR2      001503 R   |   6 ABORQ      0014E4 R   |   6 ABORT      0014D5 R
  6 ABRTQ      0017CF R   |   6 ABSS       0008ED R   |   6 ACCEP      00146B R
  6 ACCP1      001474 R   |   6 ACCP2      00149A R   |   6 ACCP3      00149D R
  6 ACCP4      00149F R   |     ADC_CR1 =  005401     |     ADC_CR1_=  000000 
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
    AFR7_BEE=  000007     |   6 AFT        0017BA R   |   6 AGAIN      001704 R
  6 AHEAD      001767 R   |   6 ALLOT      001611 R   |   6 ANDD       000677 R
    APP_CP  =  004004     |     APP_LAST=  004000     |     APP_RUN =  004002 
    APP_VP  =  004006     |   6 AT         0004E4 R   |   6 ATEXE      000D1F R
  6 AUTORUN    000129 R   |     AWU_APR =  0050F1     |     AWU_CSR =  0050F0 
    AWU_TBR =  0050F2     |     B0_MASK =  000001     |     B115200 =  000006 
  6 B115K2     0003E1 R   |     B19200  =  000003     |   6 B19K2      0003BE R
    B1_MASK =  000002     |     B230400 =  000007     |     B2400   =  000000 
  6 B2K4       00038F R   |     B2_MASK =  000004     |     B38400  =  000004 
    B3_MASK =  000008     |     B460800 =  000008     |     B4800   =  000001 
  6 B4K8       00039D R   |     B4_MASK =  000010     |     B57600  =  000005 
  6 B57K6      0003CF R   |     B5_MASK =  000020     |     B6_MASK =  000040 
    B7_MASK =  000080     |     B921600 =  000009     |     B9600   =  000002 
  6 B9K6       0003AD R   |   6 BACK1      001413 R   |   6 BASE       0006E0 R
    BASEE   =  00000A     |   6 BAUD       0003F1 R   |     BCNT    =  000001 
  6 BCOMP      001654 R   |   6 BDIGS      000E17 R   |     BEEP_BIT=  000004 
    BEEP_CSR=  0050F3     |     BEEP_MAS=  000010     |     BEEP_POR=  00000F 
  6 BEGIN      0016E6 R   |     BIT0    =  000000     |     BIT1    =  000001 
    BIT2    =  000002     |     BIT3    =  000003     |     BIT4    =  000004 
    BIT5    =  000005     |     BIT6    =  000006     |     BIT7    =  000007 
  6 BKSLA      001268 R   |   6 BKSP       0013E3 R   |     BKSPP   =  000008 
  6 BLANK      000C02 R   |     BLOCK_SI=  000080     |     BOOT_ROM=  006000 
    BOOT_ROM=  007FFF     |   6 BRAN       0004B5 R   |     BTW     =  000001 
  6 BUF2ROW    002302 R   |   6 BYE        0000B6 R   |     CADR    =  000003 
    CALLL   =  0000CD     |   6 CALLOT     00249A R   |     CAN_DGR =  005426 
    CAN_FPSR=  005427     |     CAN_IER =  005425     |     CAN_MCR =  005420 
    CAN_MSR =  005421     |     CAN_P0  =  005428     |     CAN_P1  =  005429 
    CAN_P2  =  00542A     |     CAN_P3  =  00542B     |     CAN_P4  =  00542C 
    CAN_P5  =  00542D     |     CAN_P6  =  00542E     |     CAN_P7  =  00542F 
    CAN_P8  =  005430     |     CAN_P9  =  005431     |     CAN_PA  =  005432 
    CAN_PB  =  005433     |     CAN_PC  =  005434     |     CAN_PD  =  005435 
    CAN_PE  =  005436     |     CAN_PF  =  005437     |     CAN_RFR =  005424 
    CAN_TPR =  005423     |     CAN_TSR =  005422     |     CARRY   =  00002A 
    CASE_SEN=  000000     |   6 CAT        000502 R   |   6 CCOMMA     001636 R
    CC_C    =  000000     |     CC_H    =  000004     |     CC_I0   =  000003 
    CC_I1   =  000005     |     CC_N    =  000002     |     CC_V    =  000007 
    CC_Z    =  000001     |     CELLL   =  000002     |   6 CELLM      000B87 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 170.
Hexadecimal [24-Bits]

Symbol Table

  6 CELLP      000B78 R   |   6 CELLS      000B96 R   |     CFG_GCR =  007F60 
    CFG_GCR_=  000001     |     CFG_GCR_=  000000     |   6 CHAR1      001053 R
  6 CHAR2      001056 R   |   6 CHKIVEC    0021F0 R   |     CLKOPT  =  004807 
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
    CNT     =  000001     |     CNTDWN  =  000032     |   6 CNTXT      000763 R
  6 COLD       001CF1 R   |   6 COLD1      001CF1 R   |   6 COLON      0019BE R
  6 COMMA      00161F R   |   6 COMPI      001664 R   |     COMPO   =  000040 
  6 COMPONLY   001A0A R   |   6 CONSTANT   001A7F R   |   6 COPYRIGH   001C3B R
  6 COUNT      000CD2 R   |   6 CPP        00077F R   |     CPU_A   =  007F00 
    CPU_CCR =  007F0A     |     CPU_PCE =  007F01     |     CPU_PCH =  007F02 
    CPU_PCL =  007F03     |     CPU_SPH =  007F08     |     CPU_SPL =  007F09 
    CPU_XH  =  007F04     |     CPU_XL  =  007F05     |     CPU_YH  =  007F06 
    CPU_YL  =  007F07     |   6 CR         00107C R   |   6 CREAT      001A1B R
    CRR     =  00000D     |   6 CSTOR      0004F1 R   |   6 CTABLE     0024BB R
  6 CTAT       0024DC R   |   6 CTINIT     002504 R   |   6 DAT        000CB6 R
    DATSTK  =  001680     |   6 DCONST     001AB4 R   |   6 DDROP      00081D R
  6 DDUP       000828 R   |     DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF 
  6 DECIM      000EC7 R   |   6 DEPTH      000C51 R   |     DEVID_BA=  0048CD 
    DEVID_EN=  0048D8     |     DEVID_LO=  0048D2     |     DEVID_LO=  0048D3 
    DEVID_LO=  0048D4     |     DEVID_LO=  0048D5     |     DEVID_LO=  0048D6 
    DEVID_LO=  0048D7     |     DEVID_LO=  0048D8     |     DEVID_WA=  0048D1 
    DEVID_XH=  0048CE     |     DEVID_XL=  0048CD     |     DEVID_YH=  0048D0 
    DEVID_YL=  0048CF     |   6 DGTQ1      000F0C R   |   6 DI         0000C4 R
  6 DIG        000E40 R   |   6 DIGIT      000DDB R   |   6 DIGS       000E51 R
  6 DIGS1      000E51 R   |   6 DIGS2      000E5E R   |   6 DIGTQ      000EDB R
    DISCOVER=  000000     |     DM_BK1RE=  007F90     |     DM_BK1RH=  007F91 
    DM_BK1RL=  007F92     |     DM_BK2RE=  007F93     |     DM_BK2RH=  007F94 
    DM_BK2RL=  007F95     |     DM_CR1  =  007F96     |     DM_CR2  =  007F97 
    DM_CSR1 =  007F98     |     DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A 
  6 DN1        0008B4 R   |   6 DNEGA      000899 R   |   6 DOCONST    001A9F R
  6 DOF24CON   002A3F R   |   6 DOLIT      000470 R   |   6 DONXT      000484 R
    DOORBELL=  000000     |   6 DOSTR      00108C R   |   6 DOT        001122 R
  6 DOT1       001137 R   |   6 DOTI1      001C04 R   |   6 DOTID      001BEE R
  6 DOTO1      001578 R   |   6 DOTOK      00155E R   |   6 DOTPR      001249 R
  6 DOTQ       0017E9 R   |   6 DOTQP      0010A9 R   |   6 DOTR       0010B7 R
  6 DOTS       001B90 R   |   6 DOTS1      001B9B R   |   6 DOTS2      001BA4 R
  6 DOVAR      0006D0 R   |   6 DO_DCONS   001AD7 R   |     DP      =  000005 
  6 DROP       000610 R   |   6 DSLMOD     002CD6 R   |   6 DSLMOD3    002CF1 R
  6 DSLMOD4    002CFD R   |   6 DSLMODa    002CF8 R   |   6 DSLMODb    002D03 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 171.
Hexadecimal [24-Bits]

Symbol Table

  6 DSTOR      000C9D R   |   6 DSWAP      002F0F R   |   6 DUMP       001B46 R
  6 DUMP1      001B5D R   |   6 DUMP3      001B7F R   |   6 DUMPP      001B15 R
  6 DUPP       00061A R   |   6 EDIGS      000E7C R   |   6 EDOT       002703 R
  6 EDOT0      002712 R   |   6 EDOT2      00271E R   |   6 EDOT3      00273C R
  6 EDOT4      002757 R   |   6 EDOT5      002778 R   |   6 EECSTORE   001FA1 R
  6 EEPCP      001DC7 R   |   6 EEPLAST    001D9A R   |   6 EEPROM     001D82 R
    EEPROM_B=  004000     |     EEPROM_E=  0047FF     |     EEPROM_R=  000010 
    EEPROM_S=  000800     |   6 EEPRUN     001DB1 R   |   6 EEPVP      001DDD R
  6 EESTORE    001FED R   |   6 EE_CCOMM   0022B7 R   |   6 EE_COMMA   002296 R
  6 EE_CREAD   001F32 R   |   6 EE_READ    001F10 R   |   6 EI         0000BD R
  6 ELSEE      00173F R   |   6 EMIT       000437 R   |     EOL_CR  =  000001 
    EOL_LF  =  000000     |   6 EQ1        000908 R   |   6 EQUAL      0008FB R
  6 ERASE      000DA9 R   |     ERR     =  00001B     |   6 EVAL       0015A1 R
  6 EVAL1      0015A1 R   |   6 EVAL2      0015BA R   |   6 EXE1       000D2D R
  6 EXECU      0004C5 R   |     EXT     =  000000     |     EXTI_CR1=  0050A0 
    EXTI_CR2=  0050A1     |   6 EXTRC      000E03 R   |   6 F24AT      002ACF R
  6 F24CONST   002A1C R   |   6 F24STO     002AAD R   |   6 F24VAR     002A63 R
    F24_MAJO=  000001     |     F24_MINO=  000000     |   6 FABS       002FAF R
  6 FADDR      002384 R   |   6 FALGN1     002B71 R   |   6 FALGN10    002C4F R
  6 FALGN4     002BA5 R   |   6 FALGN6     002BCF R   |   6 FALGN7     002C0E R
  6 FALGN71    002C11 R   |   6 FALGN8     002C2A R   |   6 FALGN9     002C3E R
  6 FALIGN     002B59 R   |   6 FALSE      000869 R   |   6 FARAT      001E48 R
  6 FARCAT     001E54 R   |   6 FC_XOFF    000464 R   |   6 FC_XON     00044E R
  6 FDOT       002787 R   |   6 FDOT0      0027BD R   |   6 FDOT1      0027AC R
  6 FDOT10     002818 R   |   6 FDOT2      0027CB R   |   6 FDOT3      0027E1 R
  6 FDOT6      0027EE R   |   6 FDOT7      0027F8 R   |   6 FDOT8      002800 R
  6 FDOT9      002808 R   |   6 FEQUAL     002F59 R   |   6 FER        0025EA R
  6 FGREAT     002F4F R   |     FHSE    =  7A1200     |     FHSI    =  F42400 
  6 FILL       000D89 R   |   6 FILL0      000D97 R   |   6 FILL1      000D9F R
  6 FIND       00133F R   |   6 FIND1      00135D R   |   6 FIND2      00138B R
  6 FIND3      001397 R   |   6 FIND4      0013AB R   |   6 FIND5      0013B8 R
  6 FIND6      00139C R   |   6 FINIT      0025E0 R   |     FLASH_BA=  008000 
    FLASH_CR=  00505A     |     FLASH_CR=  000002     |     FLASH_CR=  000000 
    FLASH_CR=  000003     |     FLASH_CR=  000001     |     FLASH_CR=  00505B 
    FLASH_CR=  000005     |     FLASH_CR=  000004     |     FLASH_CR=  000007 
    FLASH_CR=  000000     |     FLASH_CR=  000006     |     FLASH_DU=  005064 
    FLASH_DU=  0000AE     |     FLASH_DU=  000056     |     FLASH_EN=  027FFF 
    FLASH_FP=  00505D     |     FLASH_FP=  000000     |     FLASH_FP=  000001 
    FLASH_FP=  000002     |     FLASH_FP=  000003     |     FLASH_FP=  000004 
    FLASH_FP=  000005     |     FLASH_IA=  00505F     |     FLASH_IA=  000003 
    FLASH_IA=  000002     |     FLASH_IA=  000006     |     FLASH_IA=  000001 
    FLASH_IA=  000000     |     FLASH_NC=  00505C     |     FLASH_NF=  00505E 
    FLASH_NF=  000000     |     FLASH_NF=  000001     |     FLASH_NF=  000002 
    FLASH_NF=  000003     |     FLASH_NF=  000004     |     FLASH_NF=  000005 
    FLASH_PU=  005062     |     FLASH_PU=  000056     |     FLASH_PU=  0000AE 
    FLASH_SI=  020000     |     FLASH_WS=  00480D     |   6 FLESS      002F45 R
  6 FLITER     0029E4 R   |   6 FLOATQ     0028BA R   |   6 FLOATQ1    002919 R
  6 FLOATQ2    002922 R   |   6 FLOATQ3    00292A R   |   6 FLOATQ31   002959 R
  6 FLOATQ34   002962 R   |   6 FLOATQ4    00296D R   |   6 FLOAT_ER   002985 R
  6 FLOAT_ER   00297F R   |     FLSI    =  01F400     |   6 FMOVE      00238F R
  6 FMOVE2     0023C0 R   |   6 FNE        00260D R   |   6 FNEGA      002F9C R
  6 FOR        0016AE R   |   6 FORGET     00015A R   |   6 FORGET1    000189 R
  6 FORGET2    00020F R   |   6 FORGET4    000218 R   |   6 FORGET6    0001D1 R
  6 FOV        002628 R   |   6 FPLUS      002CB3 R   |   6 FPSTOR     001D63 R
  6 FPSW       0025BC R   |     FPTR    =  000034     |   6 FREEVAR    000225 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 172.
Hexadecimal [24-Bits]

Symbol Table

  6 FREEVAR4   00025B R   |   6 FRESET     0025CE R   |   6 FSLASH     002DCE R
  6 FSLASH1    002E04 R   |   6 FSLASH8    002E4A R   |   6 FSLASH85   002E5E R
  6 FSLASH9    002E69 R   |   6 FSTAR      002D7C R   |   6 FSUB       002CC2 R
  6 FTOD1      002EAB R   |   6 FTOD2      002ED1 R   |   6 FTOD3      002ED8 R
  6 FTOD4      002EE0 R   |   6 FTOD5      002EE5 R   |   6 FTOD6      002EF6 R
  6 FTOD8      002EFB R   |   6 FTOD9      002F06 R   |   6 FTOS       002E81 R
  6 FVER       00258A R   |   6 FZE        0025F7 R   |   6 FZEQUAL    002F8C R
  6 FZLESS     002F3A R   |     GPIO_BAS=  005000     |     GPIO_CR1=  000003 
    GPIO_CR2=  000004     |     GPIO_DDR=  000002     |     GPIO_IDR=  000001 
    GPIO_ODR=  000000     |     GPIO_SIZ=  000005     |   6 GREAT      000954 R
  6 GREAT1     00095F R   |   6 HDOT       001106 R   |   6 HERE       000CE9 R
  6 HEX        000EB2 R   |   6 HI         001CA6 R   |   6 HLD        000750 R
  6 HOLD       000E27 R   |     HSECNT  =  004809     |     I2C_CCRH=  00521C 
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
    I2C_TRIS=  000011     |     I2C_WRIT=  000000     |   6 ICOLON     0019CF R
  6 IFETCH     0016CC R   |   6 IFF        001717 R   |   6 IFMOVE     002468 R
    IMEDD   =  000080     |   6 IMM01      0019E6 R   |   6 IMMED      0019E1 R
  6 INCH       00042B R   |   6 INC_FPTR   001EDD R   |   6 INITOFS    001997 R
  6 INN        0006FE R   |     INPUT_DI=  000000     |     INPUT_EI=  000001 
    INPUT_FL=  000000     |     INPUT_PU=  000001     |   6 INTE1      001540 R
  6 INTER      001516 R   |   6 INTQ       002560 R   |     INT_ADC2=  000016 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 173.
Hexadecimal [24-Bits]

Symbol Table

    INT_VECT=  008034     |     INT_VECT=  008040     |     INT_VECT=  00803C 
    INT_VECT=  008048     |     INT_VECT=  008044     |     INT_VECT=  008064 
    INT_VECT=  008008     |     INT_VECT=  008004     |     INT_VECT=  008050 
    INT_VECT=  00804C     |     INT_VECT=  00805C     |     INT_VECT=  008058 
  6 INVER      000876 R   |     IPR0    =  000002     |     IPR1    =  000001 
    IPR2    =  000000     |     IPR3    =  000003     |     IPR_MASK=  000003 
    IRET_COD=  000080     |   6 ISEMI      0018E6 R   |     ITC_SPR1=  007F70 
    ITC_SPR2=  007F71     |     ITC_SPR3=  007F72     |     ITC_SPR4=  007F73 
    ITC_SPR5=  007F74     |     ITC_SPR6=  007F75     |     ITC_SPR7=  007F76 
    ITC_SPR8=  007F77     |     IWDG_KR =  0050E0     |     IWDG_PR =  0050E1 
    IWDG_RLR=  0050E2     |   6 JFETCH     0016D7 R   |     JPIMM   =  0000CC 
  6 JSRC       00193B R   |   6 JSRC1      00195E R   |   6 JSRC2      001981 R
  6 KEY        001001 R   |   6 KTAP       001430 R   |   6 KTAP1      001453 R
  6 KTAP2      001456 R   |   6 LAST       00078F R   |   6 LASTN   =  002FAA R
  6 LBRAC      00154D R   |     LED2_BIT=  000005     |     LED2_MAS=  000020 
    LED2_POR=  00500A     |   6 LESS       000927 R   |     LF      =  00000A 
  6 LINK    =  002FAA R   |   6 LITER      001686 R   |   6 LOCAL      000555 R
  6 LOCK       001EC9 R   |   6 LSCALE     0029A4 R   |   6 LSHIFT     000BC1 R
  6 LSHIFT1    000BCA R   |   6 LSHIFT4    000BD2 R   |   6 LT1        000932 R
    MASKK   =  001F7F     |   6 MAX        00096C R   |   6 MAX1       000976 R
    MAX_MANT=  007FFF     |   6 MIN        000980 R   |   6 MIN1       00098A R
  6 MMOD1      000A39 R   |   6 MMOD2      000A4D R   |   6 MMOD3      000A64 R
  6 MMSM0      0009C9 R   |   6 MMSM1      0009D9 R   |   6 MMSM3      0009DD R
  6 MMSM4      0009E9 R   |   6 MMSMa      0009E4 R   |   6 MMSMb      0009EF R
  6 MODD       000ABF R   |   6 MONE       000C28 R   |   6 MPLUS      002C53 R
    MS      =  000030     |   6 MSEC       0002D1 R   |   6 MSIGN      0026F2 R
  6 MSMOD      000A1C R   |   6 MSTA1      000B50 R   |   6 MSTAR      000B2D R
    NAFR    =  004804     |   6 NAMEQ      0013D8 R   |   6 NAMET      0012E9 R
    NCLKOPT =  004808     |   6 NEGAT      000887 R   |   6 NEG_SIGN   002839 R
  6 NEX1       000491 R   |   6 NEXT       0016BD R   |     NFLASH_W=  00480E 
    NHSECNT =  00480A     |     NOPT1   =  004802     |     NOPT2   =  004804 
    NOPT3   =  004806     |     NOPT4   =  004808     |     NOPT5   =  00480A 
    NOPT6   =  00480C     |     NOPT7   =  00480E     |     NOPTBL  =  00487F 
  6 NRAT       0005A0 R   |   6 NRDROP     00057C R   |   6 NROT       0007FD R
  6 NRSTO      0005BF R   |   6 NTIB       00070E R   |     NUBC    =  004802 
    NUCLEO  =  000001     |   6 NUFQ       001017 R   |   6 NUFQ1      001030 R
  6 NUMBQ      000F62 R   |   6 NUMQ1      000F96 R   |   6 NUMQ3      000FDA R
  6 NUMQ4      000FE4 R   |   6 NUMQ6      000FEC R   |   6 NUMQ9      000FF2 R
    NWDGOPT =  004806     |     NWDGOPT_=  FFFFFFFD     |     NWDGOPT_=  FFFFFFFC 
    NWDGOPT_=  FFFFFFFF     |     NWDGOPT_=  FFFFFFFE     |   6 NonHandl   000000 R
  6 OFFSET     0007B4 R   |     OFS     =  000005     |   6 ONE        000C1A R
  6 ONEM       000BB0 R   |   6 ONEP       000BA3 R   |     OPT     =  000002 
    OPT0    =  004800     |     OPT1    =  004801     |     OPT2    =  004803 
    OPT3    =  004805     |     OPT4    =  004807     |     OPT5    =  004809 
    OPT6    =  00480B     |     OPT7    =  00480D     |     OPTBL   =  00487E 
    OPTIMIZE=  000001     |     OPTION_B=  004800     |     OPTION_E=  00487F 
    OPTION_S=  000080     |   6 ORIG       000049 R   |   6 ORR        00068B R
  6 OUTPUT     00043C R   |     OUTPUT_F=  000001     |     OUTPUT_O=  000000 
    OUTPUT_P=  000001     |     OUTPUT_S=  000000     |   6 OVER       000642 R
  6 OVERT      0018B4 R   |     PA      =  000000     |   6 PACKS      000DBA R
  6 PAD        000CFA R   |   6 PAREN      001258 R   |   6 PARS       001151 R
  6 PARS1      00117C R   |   6 PARS2      0011A7 R   |   6 PARS3      0011AA R
  6 PARS4      0011B3 R   |   6 PARS5      0011D6 R   |   6 PARS6      0011EB R
  6 PARS7      0011FA R   |   6 PARS8      001209 R   |   6 PARSE      00121A R
  6 PARSEXP_   00289D R   |   6 PAUSE      0002E1 R   |     PA_BASE =  005000 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 174.
Hexadecimal [24-Bits]

Symbol Table

    PA_CR1  =  005003     |     PA_CR2  =  005004     |     PA_DDR  =  005002 
    PA_IDR  =  005001     |     PA_ODR  =  005000     |     PB      =  000005 
    PB_BASE =  005005     |     PB_CR1  =  005008     |     PB_CR2  =  005009 
    PB_DDR  =  005007     |     PB_IDR  =  005006     |     PB_ODR  =  005005 
    PC      =  00000A     |     PC_BASE =  00500A     |     PC_CR1  =  00500D 
    PC_CR2  =  00500E     |     PC_DDR  =  00500C     |     PC_IDR  =  00500B 
    PC_ODR  =  00500A     |     PD      =  00000F     |   6 PDUM1      001B28 R
  6 PDUM2      001B39 R   |     PD_BASE =  00500F     |     PD_CR1  =  005012 
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
  6 PICK       000C68 R   |     PI_BASE =  005028     |     PI_CR1  =  00502B 
    PI_CR2  =  00502C     |     PI_DDR  =  00502A     |     PI_IDR  =  005029 
    PI_ODR  =  005028     |   6 PLUS       00083D R   |   6 PNAM1      001853 R
  6 PRESE      0015C9 R   |   6 PRINT_VE   001C77 R   |     PROD1   =  000024 
    PROD2   =  000026     |     PROD3   =  000028     |   6 PROTECTE   000201 R
  6 PRT_LICE   001C63 R   |   6 PSTOR      000C7F R   |     PTR16   =  000035 
    PTR8    =  000036     |   6 PTRPLUS    001EF5 R   |   6 QBRAN      000499 R
  6 QDUP       0007CD R   |   6 QDUP1      0007D7 R   |   6 QKEY       000419 R
  6 QSTAC      001584 R   |   6 QUERY      0014B0 R   |   6 QUEST      001144 R
  6 QUIT       0015E6 R   |   6 QUIT1      0015EE R   |   6 QUIT2      0015F1 R
  6 RAM2EE     002330 R   |     RAMBASE =  000000     |   6 RAMLAST    0007A2 R
    RAM_BASE=  000000     |     RAM_END =  0017FF     |     RAM_SIZE=  001800 
  6 RANDOM     00027F R   |   6 RAT        000546 R   |   6 RBRAC      001928 R
  6 REPEA      00179A R   |   6 RFREE      002317 R   |   6 RFROM      000535 R
    ROP     =  004800     |   6 ROT        0007DE R   |   6 ROW2BUF    0022D9 R
    ROWBUFF =  001680     |     RP0     =  00002E     |   6 RPAT       000512 R
    RPP     =  0017FF     |   6 RPSTO      00051F R   |   6 RSCALE     0029C2 R
  6 RSHIFT     000BDD R   |   6 RSHIFT1    000BE6 R   |   6 RSHIFT4    000BEE R
    RST_SR  =  0050B3     |   6 SAME1      001307 R   |   6 SAME2      001330 R
  6 SAMEQ      0012FF R   |   6 SCAL1      002D26 R   |   6 SCAL2      002D41 R
  6 SCAL3      002D60 R   |   6 SCAL4      002D76 R   |   6 SCALDN2    002B4B R
  6 SCALDN3    002B4E R   |   6 SCALEDOW   002B22 R   |   6 SCALETOM   002D1C R
  6 SCALEUP    002AF0 R   |   6 SCALEUP2   002B1E R   |   6 SCALEUP3   002B21 R
  6 SCOM1      001888 R   |   6 SCOM2      00188B R   |   6 SCOMP      00186A R
  6 SEED       000266 R   |     SEEDX   =  000038     |     SEEDY   =  00003A 
  6 SEMIS      0018C4 R   |   6 SETISP     0000D0 R   |   6 SET_FPSW   00264D R
  6 SET_RAML   001A68 R   |   6 SFN        0026AC R   |     SFR_BASE=  005000 
    SFR_END =  0057FF     |   6 SFV        0026D8 R   |   6 SFZ        00267D R
  6 SIGN       000E66 R   |   6 SIGN1      000E76 R   |   6 SLASH      000AC9 R
  6 SLMOD      000A6C R   |   6 SLMOD1     000AA9 R   |   6 SLMOD8     000AB6 R
  6 SNAME      00181D R   |     SP0     =  00002C     |   6 SPACE      001039 R
  6 SPACS      001048 R   |   6 SPAT       0005FA R   |     SPI_CR1 =  005200 
    SPI_CR2 =  005201     |     SPI_CRCP=  005205     |     SPI_DR  =  005204 
    SPI_ICR =  005202     |     SPI_RXCR=  005206     |     SPI_SR  =  005203 
    SPI_TXCR=  005207     |     SPP     =  001680     |     SPSAVE  =  000001 
  6 SPSTO      000607 R   |   6 SSMOD      000B59 R   |     SSP     =  000001 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 175.
Hexadecimal [24-Bits]

Symbol Table

    STACK   =  0017FF     |   6 STAR       000B22 R   |   6 STASL      000B6A R
  6 STOD       0008BC R   |   6 STOF       002E75 R   |   6 STORE      0004D2 R
  6 STO_SIGN   002851 R   |   6 STR        000E94 R   |   6 STRCQ      00168E R
  6 STRQ       0017DC R   |   6 STRQP      0010A5 R   |   6 SUBB       0008D3 R
  6 SWAPP      00062A R   |     SWIM_CSR=  007F80     |   6 TAP        00141A R
  6 TBOOT      001CE5 R   |   6 TBRAN      0004A7 R   |   6 TBUF       00071E R
    TBUFFBAS=  001680     |   6 TCHAR      000C39 R   |   6 TEMP       0006EF R
  6 TEVAL      000741 R   |   6 TFLASH     000730 R   |   6 THENN      00172C R
  6 TIB        000D0B R   |     TIBB    =  001700     |     TIBBASE =  001700 
    TIC     =  000027     |   6 TICK       0015FD R   |     TIM1_ARR=  005262 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 176.
Hexadecimal [24-Bits]

Symbol Table

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
  6 TIMER      0002FB R   |     TIM_CR1_=  000007     |     TIM_CR1_=  000000 
    TIM_CR1_=  000006     |     TIM_CR1_=  000005     |     TIM_CR1_=  000004 
    TIM_CR1_=  000003     |     TIM_CR1_=  000001     |     TIM_CR1_=  000002 
  6 TNAM2      001BBE R   |   6 TNAM3      001BDC R   |   6 TNAM4      001BE2 R
  6 TNAME      001BBB R   |   6 TOFLASH    000336 R   |   6 TOKEN      0012DB R
  6 TOR        0005E3 R   |   6 TORAM      000376 R   |   6 TRUE       000858 R
    TRUEE   =  00FFFF     |   6 TWOSL      000BF5 R   |   6 TYPE1      001068 R
  6 TYPE2      00106E R   |   6 TYPES      001063 R   |   6 Timer4Ha   000005 R
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 177.
Hexadecimal [24-Bits]

Symbol Table

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
    UD4     =  000004     |   6 UDOT       0010F2 R   |   6 UDOTR      0010D2 R
  6 UEND       000047 R   |     UFPSW   =  000008     |   6 UGREAT     00093E R
  6 UGREAT1    000949 R   |     UHLD    =  000014     |     UINN    =  00000C 
    UINTER  =  000012     |     ULAST   =  00001C     |   6 ULES1      00091C R
  6 ULESS      000911 R   |   6 UMMOD      0009B2 R   |   6 UMSTA      000AD8 R
  6 UNIQ1      00181A R   |   6 UNIQU      0017FB R   |   6 UNLKEE     001E63 R
  6 UNLKFL     001E82 R   |   6 UNLOCK     001EA1 R   |   6 UNTIL      0016F1 R
    UOFFSET =  00001E     |   6 UPDATCP    001E20 R   |   6 UPDATLAS   001DF7 R
  6 UPDATPTR   002423 R   |   6 UPDATRUN   001E0F R   |   6 UPDATVP    001E37 R
  6 UPL1       0006CC R   |   6 UPLUS      0006B5 R   |     UPP     =  000006 
  6 UPPER      00129E R   |   6 UPPER1     0012C1 R   |   6 UPPER2     0012CA R
    URLAST  =  000022     |   6 USLMOD     000A01 R   |     USR_BTN_=  000004 
    USR_BTN_=  000010     |     USR_BTN_=  005015     |     UTFLASH =  000020 
    UTIB    =  000010     |     UTMP    =  00000A     |   6 UTYP1      001AF8 R
  6 UTYP2      001B07 R   |   6 UTYPE      001AF3 R   |     UVP     =  000018 
  6 UZERO      00002B R   |   6 VARIA      001A35 R   |     VAR_BASE=  000080 
    VAR_TOP =  0017BF     |     VER     =  000004     |   6 VPP        000771 R
    VSIZE   =  000006     |     WANT_CON=  000001     |     WANT_DEB=  000000 
    WANT_DOU=  000000     |     WANT_FLO=  000000     |     WANT_FLO=  000001 
    WANT_SCA=  000000     |     WANT_SEE=  000000     |     WDGOPT  =  004805 
    WDGOPT_I=  000002     |     WDGOPT_L=  000003     |     WDGOPT_W=  000000 
    WDGOPT_W=  000001     |   6 WHILE      001780 R   |   6 WITHI      000997 R
  6 WORDD      001284 R   |   6 WORDS      001C18 R   |   6 WORS1      001C1E R
  6 WORS2      001C3A R   |   6 WR_BYTE    001F4C R   |   6 WR_WORD    001F71 R
  6 WTABLE     0024CA R   |   6 WTAT       0024EE R   |   6 WTINIT     002533 R
    WWDG_CR =  0050D1     |     WWDG_WR =  0050D2     |     XMEM_SIZ=  017830 
    XOFF    =  000013     |     XON     =  000011     |   6 XORR       0006A0 R
    XTEMP   =  000024     |     YTEMP   =  000026     |     YTMP    =  000003 
  6 ZEQU1      00066D R   |   6 ZEQUAL     000663 R   |   6 ZERO       000C0F R
  6 ZL1        00065A R   |   6 ZLESS      000651 R   |   6 app_spac   003000 R
  6 baudrate   00037C R   |   6 block_er   002037 R   |   6 clear_ra   000019 R
  6 clock_in   000064 R   |   6 copy_buf   002097 R   |   6 copy_buf   0020B6 R
  6 copy_pro   0020B6 R   |     da      =  000002     |     db      =  000003 
    dc      =  000000     |     dd      =  000001     |   6 dof24lit   0029F2 R
  6 erase_fl   002059 R   |   6 fmove_do   00240C R   |   6 main       000016 R
  6 next_row   0023C9 R   |   6 no_move    002413 R   |   6 nsign      002828 R
  6 parse_di   000F15 R   |   6 parse_ex   002855 R   |   6 pristine   002137 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 178.
Hexadecimal [24-Bits]

Symbol Table

  6 proceed_   00205C R   |   6 reboot     000328 R   |   6 reset_ve   00219E R
  6 row_eras   002017 R   |   6 row_eras   002070 R   |   6 row_eras   002097 R
  6 set_opti   00210B R   |   6 set_vect   00223F R   |   6 uart_ini   000076 R
  6 write_ro   0020DB R

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 179.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 DATA       size      0   flags    8
   2 DATA0      size      0   flags    8
   3 SSEG       size      0   flags    8
   4 SSEG1      size    100   flags    8
   5 HOME       size     80   flags    0
   6 CODE       size   3000   flags    0

