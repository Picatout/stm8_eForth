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
      0080B7 95 82                  316         .word      INTER   ;'EVAL
      0080B9 00 00                  317         .word      0       ;HLD
      0080BB AA A9                  318         .word      LASTN  ;CNTXT pointer
      0080BD 00 80                  319         .word      VAR_BASE   ;variables free space pointer 
      0080BF AB 00                  320         .word      app_space ; FLASH free space pointer 
      0080C1 AA A9                  321         .word      LASTN   ;LAST
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
      00812D CC 9D 46         [ 2]  393         jp  COLD   ;default=MN1
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
      0081A9 CD 93 47         [ 4]  469         call TOKEN 
      0081AC CD 86 9A         [ 4]  470         call DUPP 
      0081AF CD 85 19         [ 4]  471         call QBRAN 
      0081B2 82 8F                  472         .word FORGET2
      0081B4 CD 94 44         [ 4]  473         call NAMEQ
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
      0081CE CC A0 42         [ 2]  483         jp EESTORE 
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
      0081DA CD 93 47         [ 4]  492         call TOKEN
      0081DD CD 86 9A         [ 4]  493         call DUPP 
      0081E0 CD 85 19         [ 4]  494         call QBRAN 
      0081E3 82 8F                  495         .word FORGET2
      0081E5 CD 94 44         [ 4]  496         call NAMEQ ; ( a -- ca na | a F )
      0081E8 CD 88 4D         [ 4]  497         call QDUP 
      0081EB CD 85 19         [ 4]  498         call QBRAN 
      0081EE 82 8F                  499         .word FORGET2
                                    500 ; only forget users words 
      0081F0 CD 86 9A         [ 4]  501         call DUPP ; ( ca na na )
      0081F3 CD 84 F0         [ 4]  502         call DOLIT 
      0081F6 AB 00                  503         .word app_space 
      0081F8 CD 86 AA         [ 4]  504         call SWAPP 
      0081FB CD 89 91         [ 4]  505         call  ULESS 
      0081FE CD 85 19         [ 4]  506         call QBRAN 
      008201 82 51                  507         .word FORGET6 
                                    508 ; ( ca na -- )        
                                    509 ;reset ivec with address >= ca
      008203 CD 86 AA         [ 4]  510         call SWAPP ; ( na ca -- ) 
      008206 CD A2 45         [ 4]  511         call CHKIVEC ; ( na -- ) 
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
      00824B CD 9E 75         [ 4]  539         call UPDATCP 
      00824E CC 9E 4C         [ 2]  540         jp UPDATLAST 
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
      008260 CD 95 50         [ 4]  549         call ABORQ 
      008263 1D                     550         .byte 29
      008264 20 46 6F 72 20 52 41   551         .ascii " For RAM definition do REBOOT"
             4D 20 64 65 66 69 6E
             69 74 69 6F 6E 20 64
             6F 20 52 45 42 4F 4F
             54
      008281                        552 PROTECTED:
      008281 CD 95 50         [ 4]  553         call ABORQ
      008284 0A                     554         .byte 10
      008285 20 50 72 6F 74 65 63   555         .ascii " Protected"
             74 65 64
      00828F                        556 FORGET2: ; no name or not found in dictionary 
      00828F CD 95 50         [ 4]  557         call ABORQ
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
      0082D8 CC 9E 8C         [ 2]  588         jp UPDATVP 
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
      0083C4 CD 95 50         [ 4]  739         call ABORQ 
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
                                   2686 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2687 ;       NUMBER? ( a -- n T | a F )
                                   2688 ;       Convert a number string to
                                   2689 ;       integer. Push a flag on tos.
                                   2690 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000F15                       2691         _HEADER NUMBQ,7,"NUMBER?"
      008F95 8F 54                    1         .word LINK 
                           000F17     2         LINK=.
      008F97 07                       3         .byte 7  
      008F98 4E 55 4D 42 45 52 3F     4         .ascii "NUMBER?"
      008F9F                          5         NUMBQ:
                                   2692 ; save BASE
      008F9F CD 87 60         [ 4] 2693         CALL     BASE
      008FA2 CD 85 64         [ 4] 2694         CALL     AT
      008FA5 CD 86 63         [ 4] 2695         CALL     TOR
      008FA8 CD 8C 8F         [ 4] 2696         CALL     ZERO
      008FAB CD 86 C2         [ 4] 2697         CALL     OVER
      008FAE CD 8D 52         [ 4] 2698         CALL     COUNT ; string length,  a 0 a+ cnt 
                                   2699 ;  check hexadecimal character        
      008FB1 CD 86 C2         [ 4] 2700         CALL     OVER
      008FB4 CD 85 82         [ 4] 2701         CALL     CAT
      000F37                       2702         _DOLIT   '$'  ; hex? 
      008FB7 CD 84 F0         [ 4]    1     CALL DOLIT 
      008FBA 00 24                    2     .word '$' 
      008FBC CD 89 7B         [ 4] 2703         CALL     EQUAL
      000F3F                       2704         _QBRAN   NUMQ1
      008FBF CD 85 19         [ 4]    1     CALL QBRAN
      008FC2 8F D3                    2     .word NUMQ1
      008FC4 CD 8F 32         [ 4] 2705         CALL     HEX
      008FC7 CD 86 AA         [ 4] 2706         CALL     SWAPP
      008FCA CD 8C 23         [ 4] 2707         CALL     ONEP
      008FCD CD 86 AA         [ 4] 2708         CALL     SWAPP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



      008FD0 CD 8C 30         [ 4] 2709         CALL     ONEM
                                   2710 ; check for negative sign         
      008FD3 CD 86 C2         [ 4] 2711 NUMQ1:  CALL     OVER
      008FD6 CD 85 82         [ 4] 2712         CALL     CAT
      000F59                       2713         _DOLIT   '-'
      008FD9 CD 84 F0         [ 4]    1     CALL DOLIT 
      008FDC 00 2D                    2     .word '-' 
      008FDE CD 89 7B         [ 4] 2714         CALL     EQUAL
      008FE1 CD 86 63         [ 4] 2715         CALL     TOR    ; a 0 a+ cnt R: base sign 
                                   2716 ; update address and count 
      008FE4 CD 86 AA         [ 4] 2717         CALL     SWAPP
      008FE7 CD 85 C6         [ 4] 2718         CALL     RAT
      008FEA CD 89 53         [ 4] 2719         CALL     SUBB
      008FED CD 86 AA         [ 4] 2720         CALL     SWAPP
      008FF0 CD 85 C6         [ 4] 2721         CALL     RAT
      008FF3 CD 88 BD         [ 4] 2722         CALL     PLUS
      008FF6 CD 88 4D         [ 4] 2723         CALL     QDUP
      000F79                       2724         _QBRAN   NUMQ4  ; end of string  a 0 a+ R: base sign 
      008FF9 CD 85 19         [ 4]    1     CALL QBRAN
      008FFC 90 44                    2     .word NUMQ4
      008FFE CD 8C 30         [ 4] 2725         CALL     ONEM
      009001 CD 86 63         [ 4] 2726         CALL     TOR   ; a 0 a+ -- R: base sign cnt 
      009004 CD 8D 52         [ 4] 2727 NUMQ2:  CALL     COUNT  ; a n a+ c  
      009007 CD 87 60         [ 4] 2728         CALL     BASE 
      00900A CD 85 64         [ 4] 2729         CALL     AT 
      00900D CD 8F 5B         [ 4] 2730         CALL     DIGTQ 
      000F90                       2731         _QBRAN   NUMQ6  ; not a digit 
      009010 CD 85 19         [ 4]    1     CALL QBRAN
      009013 90 4C                    2     .word NUMQ6
      009015 CD 88 5E         [ 4] 2732         CALL     ROT    ; a a+ c n 
      009018 CD 87 60         [ 4] 2733         CALL     BASE 
      00901B CD 85 64         [ 4] 2734         CALL     AT 
      00901E CD 8B A2         [ 4] 2735         CALL    STAR 
      009021 CD 88 BD         [ 4] 2736         CALL    PLUS 
      009024 CD 86 AA         [ 4] 2737         CALL    SWAPP  ; a n a+  R: base sign cnt 
      000FA7                       2738         _DONXT   NUMQ2
      009027 CD 85 04         [ 4]    1     CALL DONXT 
      00902A 90 04                    2     .word NUMQ2 
      00902C CD 86 90         [ 4] 2739         CALL    DROP   ; a n  R: base sign 
      00902F CD 85 B5         [ 4] 2740         CALL     RFROM   ; a n sign R: base 
      000FB2                       2741         _QBRAN   NUMQ3
      009032 CD 85 19         [ 4]    1     CALL QBRAN
      009035 90 3A                    2     .word NUMQ3
      009037 CD 89 07         [ 4] 2742         CALL     NEGAT ; a n R: base 
      00903A CD 86 AA         [ 4] 2743 NUMQ3:  CALL     SWAPP
      00903D 90 AE FF FF      [ 2] 2744         LDW  Y, #-1 
      009041 FF               [ 2] 2745         LDW (X),Y     ; n -1 R: base 
      009042 20 1A            [ 2] 2746         JRA      NUMQ9
      009044 CD 85 B5         [ 4] 2747 NUMQ4:  CALL     RFROM
      009047 CD 88 9D         [ 4] 2748         CALL     DDROP
      00904A 20 12            [ 2] 2749         JRA      NUMQ9 
      00904C                       2750 NUMQ6:  
                           000001  2751 .if WANT_FLOAT24 
                           000001  2752 .ift 
      00904C CD 86 90         [ 4] 2753         CALL     DROP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



      00904F CD 8C 30         [ 4] 2754         CALL     ONEM ; a n a+ 
      009052 CD 85 B5         [ 4] 2755         CALL     RFROM  ; a n a+ cnt
      009055 CD 8C 23         [ 4] 2756         CALL     ONEP    
      009058 CD 85 B5         [ 4] 2757         CALL     RFROM ; a n a+ cnt sign 
      00905B CD A9 04         [ 4] 2758         CALL     FLOATQ  
                           000000  2759 .iff
                                   2760         ADDW SP,#4 ; remove sign and cnt from rstack 
                                   2761         ADDW  X,#CELLL ; drop a+   S: a n  R: sign 
                                   2762         CLRW Y  
                                   2763         LDW (X),Y  ;  a 0 R: base 
                                   2764 .endif 
                                   2765 ; restore BASE 
      00905E                       2766 NUMQ9: 
      00905E CD 85 B5         [ 4] 2767         CALL     RFROM
      009061 CD 87 60         [ 4] 2768         CALL     BASE
      009064 CC 85 52         [ 2] 2769         JP       STORE
                                   2770 .endif ; WANT_DOUBLE   
                                   2771 
                                   2772 ;; Basic I/O
                                   2773 
                                   2774 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2775 ;       KEY     ( -- c )
                                   2776 ;       Wait for and return an
                                   2777 ;       input character.
                                   2778 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000FE7                       2779         _HEADER KEY,3,"KEY"
      009067 8F 97                    1         .word LINK 
                           000FE9     2         LINK=.
      009069 03                       3         .byte 3  
      00906A 4B 45 59                 4         .ascii "KEY"
      00906D                          5         KEY:
      00906D 72 0B 52 30 FB   [ 2] 2780         btjf UART_SR,#UART_SR_RXNE,. 
      009072 C6 52 31         [ 1] 2781         ld a,UART_DR 
      009075 1D 00 02         [ 2] 2782         subw x,#CELLL 
      009078 E7 01            [ 1] 2783         ld (1,x),a 
      00907A 7F               [ 1] 2784         clr (x)
      00907B 81               [ 4] 2785         ret 
                                   2786 
                                   2787 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2788 ;       NUF?    ( -- t )
                                   2789 ;       Return false if no input,
                                   2790 ;       else pause and if CR return true.
                                   2791 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000FFC                       2792         _HEADER NUFQ,4,"NUF?"
      00907C 90 69                    1         .word LINK 
                           000FFE     2         LINK=.
      00907E 04                       3         .byte 4  
      00907F 4E 55 46 3F              4         .ascii "NUF?"
      009083                          5         NUFQ:
      009083 CD 84 99         [ 4] 2793         CALL     QKEY
      009086 CD 86 9A         [ 4] 2794         CALL     DUPP
      009089 CD 85 19         [ 4] 2795         CALL     QBRAN
      00908C 90 9C                 2796         .word    NUFQ1
      00908E CD 88 9D         [ 4] 2797         CALL     DDROP
      009091 CD 90 6D         [ 4] 2798         CALL     KEY
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



      009094 CD 84 F0         [ 4] 2799         CALL     DOLIT
      009097 00 0D                 2800         .word      CRR
      009099 CC 89 7B         [ 2] 2801         JP     EQUAL
      00909C 81               [ 4] 2802 NUFQ1:  RET
                                   2803 
                                   2804 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2805 ;       SPACE   ( -- )
                                   2806 ;       Send  blank character to
                                   2807 ;       output device.
                                   2808 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00101D                       2809         _HEADER SPACE,5,"SPACE"
      00909D 90 7E                    1         .word LINK 
                           00101F     2         LINK=.
      00909F 05                       3         .byte 5  
      0090A0 53 50 41 43 45           4         .ascii "SPACE"
      0090A5                          5         SPACE:
      0090A5 CD 8C 82         [ 4] 2810         CALL     BLANK
      0090A8 CC 84 B7         [ 2] 2811         JP     EMIT
                                   2812 
                                   2813 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2814 ;       SPACES  ( +n -- )
                                   2815 ;       Send n spaces to output device.
                                   2816 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00102B                       2817         _HEADER SPACS,6,"SPACES"
      0090AB 90 9F                    1         .word LINK 
                           00102D     2         LINK=.
      0090AD 06                       3         .byte 6  
      0090AE 53 50 41 43 45 53        4         .ascii "SPACES"
      0090B4                          5         SPACS:
      0090B4 CD 8C 8F         [ 4] 2818         CALL     ZERO
      0090B7 CD 89 EC         [ 4] 2819         CALL     MAX
      0090BA CD 86 63         [ 4] 2820         CALL     TOR
      0090BD 20 03            [ 2] 2821         JRA      CHAR2
      0090BF CD 90 A5         [ 4] 2822 CHAR1:  CALL     SPACE
      0090C2 CD 85 04         [ 4] 2823 CHAR2:  CALL     DONXT
      0090C5 90 BF                 2824         .word    CHAR1
      0090C7 81               [ 4] 2825         RET
                                   2826 
                                   2827 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2828 ;       TYPE    ( b u -- )
                                   2829 ;       Output u characters from b.
                                   2830 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001048                       2831         _HEADER TYPES,4,"TYPE"
      0090C8 90 AD                    1         .word LINK 
                           00104A     2         LINK=.
      0090CA 04                       3         .byte 4  
      0090CB 54 59 50 45              4         .ascii "TYPE"
      0090CF                          5         TYPES:
      0090CF CD 86 63         [ 4] 2832         CALL     TOR
      0090D2 20 06            [ 2] 2833         JRA     TYPE2
      0090D4 CD 8D 52         [ 4] 2834 TYPE1:  CALL     COUNT 
      0090D7 CD 84 B7         [ 4] 2835         CALL     EMIT
      00105A                       2836 TYPE2:  _DONXT  TYPE1
      0090DA CD 85 04         [ 4]    1     CALL DONXT 
      0090DD 90 D4                    2     .word TYPE1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



      00105F                       2837         _DROP
      0090DF 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      0090E2 81               [ 4] 2838         RET 
                                   2839 
                                   2840 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2841 ;       CR      ( -- )
                                   2842 ;       Output a carriage return
                                   2843 ;       and a line feed.
                                   2844 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001063                       2845         _HEADER CR,2,"CR"
      0090E3 90 CA                    1         .word LINK 
                           001065     2         LINK=.
      0090E5 02                       3         .byte 2  
      0090E6 43 52                    4         .ascii "CR"
      0090E8                          5         CR:
      001068                       2846         _DOLIT  CRR 
      0090E8 CD 84 F0         [ 4]    1     CALL DOLIT 
      0090EB 00 0D                    2     .word CRR 
      0090ED CD 84 B7         [ 4] 2847         CALL    EMIT
      001070                       2848         _DOLIT  LF
      0090F0 CD 84 F0         [ 4]    1     CALL DOLIT 
      0090F3 00 0A                    2     .word LF 
      0090F5 CC 84 B7         [ 2] 2849         JP      EMIT
                                   2850 
                                   2851 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2852 ;       do$     ( -- a )
                                   2853 ;       Return  address of a compiled
                                   2854 ;       string.
                                   2855 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2856 ;       _HEADER DOSTR,COMPO+3,"DO$"
      0090F8                       2857 DOSTR:
      0090F8 CD 85 B5         [ 4] 2858         CALL     RFROM
      0090FB CD 85 C6         [ 4] 2859         CALL     RAT
      0090FE CD 85 B5         [ 4] 2860         CALL     RFROM
      009101 CD 8D 52         [ 4] 2861         CALL     COUNT
      009104 CD 88 BD         [ 4] 2862         CALL     PLUS
      009107 CD 86 63         [ 4] 2863         CALL     TOR
      00910A CD 86 AA         [ 4] 2864         CALL     SWAPP
      00910D CD 86 63         [ 4] 2865         CALL     TOR
      009110 81               [ 4] 2866         RET
                                   2867 
                                   2868 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2869 ;       $"|     ( -- a )
                                   2870 ;       Run time routine compiled by $".
                                   2871 ;       Return address of a compiled string.
                                   2872 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2873 ;       _HEADER STRQP,COMPO+3,"$\"|"
      009111                       2874 STRQP:
      009111 CD 90 F8         [ 4] 2875         CALL     DOSTR
      009114 81               [ 4] 2876         RET
                                   2877 
                                   2878 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2879 ;       ."|     ( -- )
                                   2880 ;       Run time routine of ." .
                                   2881 ;       Output a compiled string.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



                                   2882 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2883 ;       _HEADER DOTQP,COMPO+3,".\"|"
      009115                       2884 DOTQP:
      009115 CD 90 F8         [ 4] 2885         CALL     DOSTR
      009118 CD 8D 52         [ 4] 2886         CALL     COUNT
      00911B CC 90 CF         [ 2] 2887         JP     TYPES
                                   2888 
                                   2889 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2890 ;       .R      ( n +n -- )
                                   2891 ;       Display an integer in a field
                                   2892 ;       of n columns, right justified.
                                   2893 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00109E                       2894         _HEADER DOTR,2,".R"
      00911E 90 E5                    1         .word LINK 
                           0010A0     2         LINK=.
      009120 02                       3         .byte 2  
      009121 2E 52                    4         .ascii ".R"
      009123                          5         DOTR:
      009123 CD 86 63         [ 4] 2895         CALL     TOR
      009126 CD 8F 14         [ 4] 2896         CALL     STR
      009129 CD 85 B5         [ 4] 2897         CALL     RFROM
      00912C CD 86 C2         [ 4] 2898         CALL     OVER
      00912F CD 89 53         [ 4] 2899         CALL     SUBB
      009132 CD 90 B4         [ 4] 2900         CALL     SPACS
      009135 CC 90 CF         [ 2] 2901         JP     TYPES
                                   2902 
                                   2903 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2904 ;       U.R     ( u +n -- )
                                   2905 ;       Display an unsigned integer
                                   2906 ;       in n column, right justified.
                                   2907 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0010B8                       2908         _HEADER UDOTR,3,"U.R"
      009138 91 20                    1         .word LINK 
                           0010BA     2         LINK=.
      00913A 03                       3         .byte 3  
      00913B 55 2E 52                 4         .ascii "U.R"
      00913E                          5         UDOTR:
      00913E CD 86 63         [ 4] 2909         CALL     TOR
      009141 CD 8E 97         [ 4] 2910         CALL     BDIGS
      009144 CD 8E D1         [ 4] 2911         CALL     DIGS
      009147 CD 8E FC         [ 4] 2912         CALL     EDIGS
      00914A CD 85 B5         [ 4] 2913         CALL     RFROM
      00914D CD 86 C2         [ 4] 2914         CALL     OVER
      009150 CD 89 53         [ 4] 2915         CALL     SUBB
      009153 CD 90 B4         [ 4] 2916         CALL     SPACS
      009156 CC 90 CF         [ 2] 2917         JP     TYPES
                                   2918 
                                   2919 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2920 ;       U.      ( u -- )
                                   2921 ;       Display an unsigned integer
                                   2922 ;       in free format.
                                   2923 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0010D9                       2924         _HEADER UDOT,2,"U."
      009159 91 3A                    1         .word LINK 
                           0010DB     2         LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



      00915B 02                       3         .byte 2  
      00915C 55 2E                    4         .ascii "U."
      00915E                          5         UDOT:
      00915E CD 8E 97         [ 4] 2925         CALL     BDIGS
      009161 CD 8E D1         [ 4] 2926         CALL     DIGS
      009164 CD 8E FC         [ 4] 2927         CALL     EDIGS
      009167 CD 90 A5         [ 4] 2928         CALL     SPACE
      00916A CC 90 CF         [ 2] 2929         JP     TYPES
                                   2930 
                                   2931 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2932 ;   H. ( n -- )
                                   2933 ;   display n in hexadecimal 
                                   2934 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0010ED                       2935         _HEADER HDOT,2,"H."
      00916D 91 5B                    1         .word LINK 
                           0010EF     2         LINK=.
      00916F 02                       3         .byte 2  
      009170 48 2E                    4         .ascii "H."
      009172                          5         HDOT:
      009172 CD 87 60         [ 4] 2936         CALL BASE 
      009175 CD 85 64         [ 4] 2937         CALL AT 
      009178 CD 86 63         [ 4] 2938         CALL TOR 
      00917B CD 8F 32         [ 4] 2939         CALL HEX 
      00917E CD 91 5E         [ 4] 2940         CALL UDOT 
      009181 CD 85 B5         [ 4] 2941         CALL RFROM 
      009184 CD 87 60         [ 4] 2942         CALL BASE 
      009187 CC 85 52         [ 2] 2943         JP STORE 
                                   2944          
                                   2945 
                                   2946 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2947 ;       .       ( w -- )
                                   2948 ;       Display an integer in free
                                   2949 ;       format, preceeded by a space.
                                   2950 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00110A                       2951         _HEADER DOT,1,"."
      00918A 91 6F                    1         .word LINK 
                           00110C     2         LINK=.
      00918C 01                       3         .byte 1  
      00918D 2E                       4         .ascii "."
      00918E                          5         DOT:
      00918E CD 87 60         [ 4] 2952         CALL     BASE
      009191 CD 85 64         [ 4] 2953         CALL     AT
      009194 CD 84 F0         [ 4] 2954         CALL     DOLIT
      009197 00 0A                 2955         .word      10
      009199 CD 87 20         [ 4] 2956         CALL     XORR    ;?decimal
      00919C CD 85 19         [ 4] 2957         CALL     QBRAN
      00919F 91 A3                 2958         .word      DOT1
      0091A1 20 BB            [ 2] 2959         JRA     UDOT
      0091A3 CD 8F 14         [ 4] 2960 DOT1:   CALL     STR
      0091A6 CD 90 A5         [ 4] 2961         CALL     SPACE
      0091A9 CC 90 CF         [ 2] 2962         JP     TYPES
                                   2963 
                                   2964 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2965 ;       ?       ( a -- )
                                   2966 ;       Display contents in memory cell.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



                                   2967 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00112C                       2968         _HEADER QUEST,1,"?"
      0091AC 91 8C                    1         .word LINK 
                           00112E     2         LINK=.
      0091AE 01                       3         .byte 1  
      0091AF 3F                       4         .ascii "?"
      0091B0                          5         QUEST:
      0091B0 CD 85 64         [ 4] 2969         CALL     AT
      0091B3 20 D9            [ 2] 2970         JRA     DOT
                                   2971 
                                   2972 ;; Parsing
                                   2973 
                                   2974 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2975 ;       parse   ( b u c -- b u delta ; <string> )
                                   2976 ;       Scan string delimited by c.
                                   2977 ;       Return found string and its offset.
                                   2978 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001135                       2979         _HEADER PARS,5,"PARS$"
      0091B5 91 AE                    1         .word LINK 
                           001137     2         LINK=.
      0091B7 05                       3         .byte 5  
      0091B8 50 41 52 53 24           4         .ascii "PARS$"
      0091BD                          5         PARS:
      0091BD CD 87 6F         [ 4] 2980         CALL     TEMP
      0091C0 CD 85 52         [ 4] 2981         CALL     STORE
      0091C3 CD 86 C2         [ 4] 2982         CALL     OVER
      0091C6 CD 86 63         [ 4] 2983         CALL     TOR
      0091C9 CD 86 9A         [ 4] 2984         CALL     DUPP
      0091CC CD 85 19         [ 4] 2985         CALL     QBRAN
      0091CF 92 75                 2986         .word    PARS8
      0091D1 CD 8C 30         [ 4] 2987         CALL     ONEM
      0091D4 CD 87 6F         [ 4] 2988         CALL     TEMP
      0091D7 CD 85 64         [ 4] 2989         CALL     AT
      0091DA CD 8C 82         [ 4] 2990         CALL     BLANK
      0091DD CD 89 7B         [ 4] 2991         CALL     EQUAL
      0091E0 CD 85 19         [ 4] 2992         CALL     QBRAN
      0091E3 92 16                 2993         .word      PARS3
      0091E5 CD 86 63         [ 4] 2994         CALL     TOR
      0091E8 CD 8C 82         [ 4] 2995 PARS1:  CALL     BLANK
      0091EB CD 86 C2         [ 4] 2996         CALL     OVER
      0091EE CD 85 82         [ 4] 2997         CALL     CAT     ;skip leading blanks ONLY
      0091F1 CD 89 53         [ 4] 2998         CALL     SUBB
      0091F4 CD 86 D1         [ 4] 2999         CALL     ZLESS
      0091F7 CD 88 F6         [ 4] 3000         CALL     INVER
      0091FA CD 85 19         [ 4] 3001         CALL     QBRAN
      0091FD 92 13                 3002         .word      PARS2
      0091FF CD 8C 23         [ 4] 3003         CALL     ONEP
      009202 CD 85 04         [ 4] 3004         CALL     DONXT
      009205 91 E8                 3005         .word      PARS1
      009207 CD 85 B5         [ 4] 3006         CALL     RFROM
      00920A CD 86 90         [ 4] 3007         CALL     DROP
      00920D CD 8C 8F         [ 4] 3008         CALL     ZERO
      009210 CC 86 9A         [ 2] 3009         JP     DUPP
      009213 CD 85 B5         [ 4] 3010 PARS2:  CALL     RFROM
      009216 CD 86 C2         [ 4] 3011 PARS3:  CALL     OVER
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



      009219 CD 86 AA         [ 4] 3012         CALL     SWAPP
      00921C CD 86 63         [ 4] 3013         CALL     TOR
      00921F CD 87 6F         [ 4] 3014 PARS4:  CALL     TEMP
      009222 CD 85 64         [ 4] 3015         CALL     AT
      009225 CD 86 C2         [ 4] 3016         CALL     OVER
      009228 CD 85 82         [ 4] 3017         CALL     CAT
      00922B CD 89 53         [ 4] 3018         CALL     SUBB    ;scan for delimiter
      00922E CD 87 6F         [ 4] 3019         CALL     TEMP
      009231 CD 85 64         [ 4] 3020         CALL     AT
      009234 CD 8C 82         [ 4] 3021         CALL     BLANK
      009237 CD 89 7B         [ 4] 3022         CALL     EQUAL
      00923A CD 85 19         [ 4] 3023         CALL     QBRAN
      00923D 92 42                 3024         .word      PARS5
      00923F CD 86 D1         [ 4] 3025         CALL     ZLESS
      009242 CD 85 19         [ 4] 3026 PARS5:  CALL     QBRAN
      009245 92 57                 3027         .word      PARS6
      009247 CD 8C 23         [ 4] 3028         CALL     ONEP
      00924A CD 85 04         [ 4] 3029         CALL     DONXT
      00924D 92 1F                 3030         .word      PARS4
      00924F CD 86 9A         [ 4] 3031         CALL     DUPP
      009252 CD 86 63         [ 4] 3032         CALL     TOR
      009255 20 0F            [ 2] 3033         JRA     PARS7
      009257 CD 85 B5         [ 4] 3034 PARS6:  CALL     RFROM
      00925A CD 86 90         [ 4] 3035         CALL     DROP
      00925D CD 86 9A         [ 4] 3036         CALL     DUPP
      009260 CD 8C 23         [ 4] 3037         CALL     ONEP
      009263 CD 86 63         [ 4] 3038         CALL     TOR
      009266 CD 86 C2         [ 4] 3039 PARS7:  CALL     OVER
      009269 CD 89 53         [ 4] 3040         CALL     SUBB
      00926C CD 85 B5         [ 4] 3041         CALL     RFROM
      00926F CD 85 B5         [ 4] 3042         CALL     RFROM
      009272 CC 89 53         [ 2] 3043         JP     SUBB
      009275 CD 86 C2         [ 4] 3044 PARS8:  CALL     OVER
      009278 CD 85 B5         [ 4] 3045         CALL     RFROM
      00927B CC 89 53         [ 2] 3046         JP     SUBB
                                   3047 
                                   3048 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3049 ;       PARSE   ( c -- b u ; <string> )
                                   3050 ;       Scan input stream and return
                                   3051 ;       counted string delimited by c.
                                   3052 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0011FE                       3053         _HEADER PARSE,5,"PARSE"
      00927E 91 B7                    1         .word LINK 
                           001200     2         LINK=.
      009280 05                       3         .byte 5  
      009281 50 41 52 53 45           4         .ascii "PARSE"
      009286                          5         PARSE:
      009286 CD 86 63         [ 4] 3054         CALL     TOR
      009289 CD 8D 8B         [ 4] 3055         CALL     TIB
      00928C CD 87 7E         [ 4] 3056         CALL     INN
      00928F CD 85 64         [ 4] 3057         CALL     AT
      009292 CD 88 BD         [ 4] 3058         CALL     PLUS    ;current input buffer pointer
      009295 CD 87 8E         [ 4] 3059         CALL     NTIB
      009298 CD 85 64         [ 4] 3060         CALL     AT
      00929B CD 87 7E         [ 4] 3061         CALL     INN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



      00929E CD 85 64         [ 4] 3062         CALL     AT
      0092A1 CD 89 53         [ 4] 3063         CALL     SUBB    ;remaining count
      0092A4 CD 85 B5         [ 4] 3064         CALL     RFROM
      0092A7 CD 91 BD         [ 4] 3065         CALL     PARS
      0092AA CD 87 7E         [ 4] 3066         CALL     INN
      0092AD CC 8C FF         [ 2] 3067         JP     PSTOR
                                   3068 
                                   3069 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3070 ;       .(      ( -- )
                                   3071 ;       Output following string up to next ) .
                                   3072 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001230                       3073         _HEADER DOTPR,IMEDD+2,".("
      0092B0 92 80                    1         .word LINK 
                           001232     2         LINK=.
      0092B2 82                       3         .byte IMEDD+2  
      0092B3 2E 28                    4         .ascii ".("
      0092B5                          5         DOTPR:
      0092B5 CD 84 F0         [ 4] 3074         CALL     DOLIT
      0092B8 00 29                 3075         .word     41	; ")"
      0092BA CD 92 86         [ 4] 3076         CALL     PARSE
      0092BD CC 90 CF         [ 2] 3077         JP     TYPES
                                   3078 
                                   3079 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3080 ;       (       ( -- )
                                   3081 ;       Ignore following string up to next ).
                                   3082 ;       A comment.
                                   3083 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001240                       3084         _HEADER PAREN,IMEDD+1,"("
      0092C0 92 B2                    1         .word LINK 
                           001242     2         LINK=.
      0092C2 81                       3         .byte IMEDD+1  
      0092C3 28                       4         .ascii "("
      0092C4                          5         PAREN:
      0092C4 CD 84 F0         [ 4] 3085         CALL     DOLIT
      0092C7 00 29                 3086         .word     41	; ")"
      0092C9 CD 92 86         [ 4] 3087         CALL     PARSE
      0092CC CC 88 9D         [ 2] 3088         JP     DDROP
                                   3089 
                                   3090 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3091 ;       \       ( -- )
                                   3092 ;       Ignore following text till
                                   3093 ;       end of line.
                                   3094 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00124F                       3095         _HEADER BKSLA,IMEDD+1,"\\"
      0092CF 92 C2                    1         .word LINK 
                           001251     2         LINK=.
      0092D1 81                       3         .byte IMEDD+1  
      0092D2 5C 5C                    4         .ascii "\\"
      0092D4                          5         BKSLA:
      0092D4 90 AE 00 0E      [ 2] 3096         ldw y,#UCTIB ; #TIB  
      0092D8 90 FE            [ 2] 3097         ldw y,(y)
      0092DA 90 89            [ 2] 3098         pushw y ; count in TIB 
      0092DC 90 AE 00 0C      [ 2] 3099         ldw y,#UINN ; >IN 
      0092E0 90 BF 26         [ 2] 3100         ldw YTEMP,y
      0092E3 90 85            [ 2] 3101         popw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



      0092E5 91 CF 26         [ 5] 3102         ldw [YTEMP],y
      0092E8 81               [ 4] 3103         ret 
                                   3104 
                                   3105 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3106 ;       WORD    ( c -- a ; <string> )
                                   3107 ;       Parse a word from input stream
                                   3108 ;       and copy it to code dictionary.
                                   3109 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001269                       3110         _HEADER WORDD,4,"WORD"
      0092E9 92 D1                    1         .word LINK 
                           00126B     2         LINK=.
      0092EB 04                       3         .byte 4  
      0092EC 57 4F 52 44              4         .ascii "WORD"
      0092F0                          5         WORDD:
      0092F0 CD 92 86         [ 4] 3111         CALL     PARSE
      0092F3 CD 8D 69         [ 4] 3112         CALL     HERE
      0092F6 CD 8B F8         [ 4] 3113         CALL     CELLP
                           000000  3114 .IF CASE_SENSE 
                                   3115         JP      PACKS 
                           000001  3116 .ELSE                 
      0092F9 CD 8E 3A         [ 4] 3117         CALL     PACKS
                                   3118 ; uppercase TOKEN 
      0092FC CD 86 9A         [ 4] 3119         CALL    DUPP 
      0092FF CD 8D 52         [ 4] 3120         CALL    COUNT 
      009302 CD 86 63         [ 4] 3121         CALL    TOR 
      009305 CD 85 35         [ 4] 3122         CALL    BRAN 
      009308 93 36                 3123         .word   UPPER2  
      00930A                       3124 UPPER:
      00930A CD 86 9A         [ 4] 3125         CALL    DUPP 
      00930D CD 85 82         [ 4] 3126         CALL    CAT
      009310 CD 86 9A         [ 4] 3127         CALL    DUPP 
      009313 CD 84 F0         [ 4] 3128         CALL   DOLIT
      009316 00 61                 3129         .word   'a' 
      009318 CD 84 F0         [ 4] 3130         CALL    DOLIT
      00931B 00 7B                 3131         .word   'z'+1 
      00931D CD 8A 17         [ 4] 3132         CALL   WITHI 
      009320 CD 85 19         [ 4] 3133         CALL   QBRAN
      009323 93 2D                 3134         .word  UPPER1  
      009325 CD 84 F0         [ 4] 3135         CALL    DOLIT 
      009328 00 DF                 3136         .word   0xDF 
      00932A CD 86 F7         [ 4] 3137         CALL    ANDD 
      00932D                       3138 UPPER1:
      00932D CD 86 C2         [ 4] 3139         CALL    OVER 
      009330 CD 85 71         [ 4] 3140         CALL    CSTOR          
      009333 CD 8C 23         [ 4] 3141         CALL    ONEP 
      009336                       3142 UPPER2: 
      009336 CD 85 04         [ 4] 3143         CALL    DONXT
      009339 93 0A                 3144         .word   UPPER  
      00933B CD 86 90         [ 4] 3145         CALL    DROP  
      00933E 81               [ 4] 3146         RET 
                                   3147 .ENDIF 
                                   3148 
                                   3149 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3150 ;       TOKEN   ( -- a ; <string> )
                                   3151 ;       Parse a word from input stream
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



                                   3152 ;       and copy it to name dictionary.
                                   3153 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0012BF                       3154         _HEADER TOKEN,5,"TOKEN"
      00933F 92 EB                    1         .word LINK 
                           0012C1     2         LINK=.
      009341 05                       3         .byte 5  
      009342 54 4F 4B 45 4E           4         .ascii "TOKEN"
      009347                          5         TOKEN:
      009347 CD 8C 82         [ 4] 3155         CALL     BLANK
      00934A CC 92 F0         [ 2] 3156         JP     WORDD
                                   3157 
                                   3158 ;; Dictionary search
                                   3159 
                                   3160 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3161 ;       NAME>   ( na -- ca )
                                   3162 ;       Return a code address given
                                   3163 ;       a name address.
                                   3164 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0012CD                       3165         _HEADER NAMET,5,"NAME>"
      00934D 93 41                    1         .word LINK 
                           0012CF     2         LINK=.
      00934F 05                       3         .byte 5  
      009350 4E 41 4D 45 3E           4         .ascii "NAME>"
      009355                          5         NAMET:
      009355 CD 8D 52         [ 4] 3166         CALL     COUNT
      009358 CD 84 F0         [ 4] 3167         CALL     DOLIT
      00935B 00 1F                 3168         .word      31
      00935D CD 86 F7         [ 4] 3169         CALL     ANDD
      009360 CC 88 BD         [ 2] 3170         JP     PLUS
                                   3171 
                                   3172 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3173 ;       SAME?   ( a a u -- a a f \ -0+ )
                                   3174 ;       Compare u cells in two
                                   3175 ;       strings. Return 0 if identical.
                                   3176 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0012E3                       3177         _HEADER SAMEQ,5,"SAME?"
      009363 93 4F                    1         .word LINK 
                           0012E5     2         LINK=.
      009365 05                       3         .byte 5  
      009366 53 41 4D 45 3F           4         .ascii "SAME?"
      00936B                          5         SAMEQ:
      00936B CD 8C 30         [ 4] 3178         CALL     ONEM
      00936E CD 86 63         [ 4] 3179         CALL     TOR
      009371 20 29            [ 2] 3180         JRA     SAME2
      009373 CD 86 C2         [ 4] 3181 SAME1:  CALL     OVER
      009376 CD 85 C6         [ 4] 3182         CALL     RAT
      009379 CD 88 BD         [ 4] 3183         CALL     PLUS
      00937C CD 85 82         [ 4] 3184         CALL     CAT
      00937F CD 86 C2         [ 4] 3185         CALL     OVER
      009382 CD 85 C6         [ 4] 3186         CALL     RAT
      009385 CD 88 BD         [ 4] 3187         CALL     PLUS
      009388 CD 85 82         [ 4] 3188         CALL     CAT
      00938B CD 89 53         [ 4] 3189         CALL     SUBB
      00938E CD 88 4D         [ 4] 3190         CALL     QDUP
      009391 CD 85 19         [ 4] 3191         CALL     QBRAN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



      009394 93 9C                 3192         .word      SAME2
      009396 CD 85 B5         [ 4] 3193         CALL     RFROM
      009399 CC 86 90         [ 2] 3194         JP     DROP
      00939C CD 85 04         [ 4] 3195 SAME2:  CALL     DONXT
      00939F 93 73                 3196         .word      SAME1
      0093A1 CC 8C 8F         [ 2] 3197         JP     ZERO
                                   3198 
                                   3199 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3200 ;       find    ( a va -- ca na | a F )
                                   3201 ;       Search vocabulary for string.
                                   3202 ;       Return ca and na if succeeded.
                                   3203 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001324                       3204         _HEADER FIND,4,"FIND"
      0093A4 93 65                    1         .word LINK 
                           001326     2         LINK=.
      0093A6 04                       3         .byte 4  
      0093A7 46 49 4E 44              4         .ascii "FIND"
      0093AB                          5         FIND:
      0093AB CD 86 AA         [ 4] 3205         CALL     SWAPP
      0093AE CD 86 9A         [ 4] 3206         CALL     DUPP
      0093B1 CD 85 82         [ 4] 3207         CALL     CAT
      0093B4 CD 87 6F         [ 4] 3208         CALL     TEMP
      0093B7 CD 85 52         [ 4] 3209         CALL     STORE
      0093BA CD 86 9A         [ 4] 3210         CALL     DUPP
      0093BD CD 85 64         [ 4] 3211         CALL     AT
      0093C0 CD 86 63         [ 4] 3212         CALL     TOR
      0093C3 CD 8B F8         [ 4] 3213         CALL     CELLP
      0093C6 CD 86 AA         [ 4] 3214         CALL     SWAPP
      0093C9 CD 85 64         [ 4] 3215 FIND1:  CALL     AT
      0093CC CD 86 9A         [ 4] 3216         CALL     DUPP
      0093CF CD 85 19         [ 4] 3217         CALL     QBRAN
      0093D2 94 08                 3218         .word      FIND6
      0093D4 CD 86 9A         [ 4] 3219         CALL     DUPP
      0093D7 CD 85 64         [ 4] 3220         CALL     AT
      0093DA CD 84 F0         [ 4] 3221         CALL     DOLIT
      0093DD 1F 7F                 3222         .word      MASKK
      0093DF CD 86 F7         [ 4] 3223         CALL     ANDD
      0093E2 CD 85 C6         [ 4] 3224         CALL     RAT
      0093E5 CD 87 20         [ 4] 3225         CALL     XORR
      0093E8 CD 85 19         [ 4] 3226         CALL     QBRAN
      0093EB 93 F7                 3227         .word      FIND2
      0093ED CD 8B F8         [ 4] 3228         CALL     CELLP
      0093F0 CD 84 F0         [ 4] 3229         CALL     DOLIT
      0093F3 FF FF                 3230         .word     0xFFFF
      0093F5 20 0C            [ 2] 3231         JRA     FIND3
      0093F7 CD 8B F8         [ 4] 3232 FIND2:  CALL     CELLP
      0093FA CD 87 6F         [ 4] 3233         CALL     TEMP
      0093FD CD 85 64         [ 4] 3234         CALL     AT
      009400 CD 93 6B         [ 4] 3235         CALL     SAMEQ
      009403 CD 85 35         [ 4] 3236 FIND3:  CALL     BRAN
      009406 94 17                 3237         .word      FIND4
      009408 CD 85 B5         [ 4] 3238 FIND6:  CALL     RFROM
      00940B CD 86 90         [ 4] 3239         CALL     DROP
      00940E CD 86 AA         [ 4] 3240         CALL     SWAPP
      009411 CD 8C 07         [ 4] 3241         CALL     CELLM
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



      009414 CC 86 AA         [ 2] 3242         JP     SWAPP
      009417 CD 85 19         [ 4] 3243 FIND4:  CALL     QBRAN
      00941A 94 24                 3244         .word      FIND5
      00941C CD 8C 07         [ 4] 3245         CALL     CELLM
      00941F CD 8C 07         [ 4] 3246         CALL     CELLM
      009422 20 A5            [ 2] 3247         JRA     FIND1
      009424 CD 85 B5         [ 4] 3248 FIND5:  CALL     RFROM
      009427 CD 86 90         [ 4] 3249         CALL     DROP
      00942A CD 86 AA         [ 4] 3250         CALL     SWAPP
      00942D CD 86 90         [ 4] 3251         CALL     DROP
      009430 CD 8C 07         [ 4] 3252         CALL     CELLM
      009433 CD 86 9A         [ 4] 3253         CALL     DUPP
      009436 CD 93 55         [ 4] 3254         CALL     NAMET
      009439 CC 86 AA         [ 2] 3255         JP     SWAPP
                                   3256 
                                   3257 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3258 ;       NAME?   ( a -- ca na | a F )
                                   3259 ;       Search vocabularies for a string.
                                   3260 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0013BC                       3261         _HEADER NAMEQ,5,"NAME?"
      00943C 93 A6                    1         .word LINK 
                           0013BE     2         LINK=.
      00943E 05                       3         .byte 5  
      00943F 4E 41 4D 45 3F           4         .ascii "NAME?"
      009444                          5         NAMEQ:
      009444 CD 87 E3         [ 4] 3262         CALL   CNTXT
      009447 CC 93 AB         [ 2] 3263         JP     FIND
                                   3264 
                                   3265 ;; Terminal response
                                   3266 
                                   3267 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3268 ;       ^H      ( bot eot cur -- bot eot cur )
                                   3269 ;       Backup cursor by one character.
                                   3270 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0013CA                       3271         _HEADER BKSP,2,"^H"
      00944A 94 3E                    1         .word LINK 
                           0013CC     2         LINK=.
      00944C 02                       3         .byte 2  
      00944D 5E 48                    4         .ascii "^H"
      00944F                          5         BKSP:
      00944F CD 86 63         [ 4] 3272         CALL     TOR
      009452 CD 86 C2         [ 4] 3273         CALL     OVER
      009455 CD 85 B5         [ 4] 3274         CALL     RFROM
      009458 CD 86 AA         [ 4] 3275         CALL     SWAPP
      00945B CD 86 C2         [ 4] 3276         CALL     OVER
      00945E CD 87 20         [ 4] 3277         CALL     XORR
      009461 CD 85 19         [ 4] 3278         CALL     QBRAN
      009464 94 7F                 3279         .word      BACK1
      009466 CD 84 F0         [ 4] 3280         CALL     DOLIT
      009469 00 08                 3281         .word      BKSPP
      00946B CD 84 B7         [ 4] 3282         CALL     EMIT
      00946E CD 8C 30         [ 4] 3283         CALL     ONEM
      009471 CD 8C 82         [ 4] 3284         CALL     BLANK
      009474 CD 84 B7         [ 4] 3285         CALL     EMIT
      009477 CD 84 F0         [ 4] 3286         CALL     DOLIT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



      00947A 00 08                 3287         .word      BKSPP
      00947C CC 84 B7         [ 2] 3288         JP     EMIT
      00947F 81               [ 4] 3289 BACK1:  RET
                                   3290 
                                   3291 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3292 ;       TAP    ( bot eot cur c -- bot eot cur )
                                   3293 ;       Accept and echo key stroke
                                   3294 ;       and bump cursor.
                                   3295 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001400                       3296         _HEADER TAP,3,"TAP"
      009480 94 4C                    1         .word LINK 
                           001402     2         LINK=.
      009482 03                       3         .byte 3  
      009483 54 41 50                 4         .ascii "TAP"
      009486                          5         TAP:
      009486 CD 86 9A         [ 4] 3297         CALL     DUPP
      009489 CD 84 B7         [ 4] 3298         CALL     EMIT
      00948C CD 86 C2         [ 4] 3299         CALL     OVER
      00948F CD 85 71         [ 4] 3300         CALL     CSTOR
      009492 CC 8C 23         [ 2] 3301         JP     ONEP
                                   3302 
                                   3303 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3304 ;       kTAP    ( bot eot cur c -- bot eot cur )
                                   3305 ;       Process a key stroke,
                                   3306 ;       CR,LF or backspace.
                                   3307 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001415                       3308         _HEADER KTAP,4,"KTAP"
      009495 94 82                    1         .word LINK 
                           001417     2         LINK=.
      009497 04                       3         .byte 4  
      009498 4B 54 41 50              4         .ascii "KTAP"
      00949C                          5         KTAP:
      00949C CD 86 9A         [ 4] 3309         CALL     DUPP
      00949F CD 84 F0         [ 4] 3310         CALL     DOLIT
                           000001  3311 .if EOL_CR
      0094A2 00 0D                 3312         .word   CRR
                           000000  3313 .else ; EOL_LF 
                                   3314         .word   LF
                                   3315 .endif 
      0094A4 CD 87 20         [ 4] 3316         CALL     XORR
      0094A7 CD 85 19         [ 4] 3317         CALL     QBRAN
      0094AA 94 C2                 3318         .word      KTAP2
      0094AC CD 84 F0         [ 4] 3319         CALL     DOLIT
      0094AF 00 08                 3320         .word      BKSPP
      0094B1 CD 87 20         [ 4] 3321         CALL     XORR
      0094B4 CD 85 19         [ 4] 3322         CALL     QBRAN
      0094B7 94 BF                 3323         .word      KTAP1
      0094B9 CD 8C 82         [ 4] 3324         CALL     BLANK
      0094BC CC 94 86         [ 2] 3325         JP     TAP
      0094BF CC 94 4F         [ 2] 3326 KTAP1:  JP     BKSP
      0094C2 CD 86 90         [ 4] 3327 KTAP2:  CALL     DROP
      0094C5 CD 86 AA         [ 4] 3328         CALL     SWAPP
      0094C8 CD 86 90         [ 4] 3329         CALL     DROP
      0094CB CC 86 9A         [ 2] 3330         JP     DUPP
                                   3331 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



                                   3332 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3333 ;       accept  ( b u -- b u )
                                   3334 ;       Accept characters to input
                                   3335 ;       buffer. Return with actual count.
                                   3336 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00144E                       3337         _HEADER ACCEP,6,"ACCEPT"
      0094CE 94 97                    1         .word LINK 
                           001450     2         LINK=.
      0094D0 06                       3         .byte 6  
      0094D1 41 43 43 45 50 54        4         .ascii "ACCEPT"
      0094D7                          5         ACCEP:
      0094D7 CD 86 C2         [ 4] 3338         CALL     OVER
      0094DA CD 88 BD         [ 4] 3339         CALL     PLUS
      0094DD CD 86 C2         [ 4] 3340         CALL     OVER
      0094E0 CD 88 A8         [ 4] 3341 ACCP1:  CALL     DDUP
      0094E3 CD 87 20         [ 4] 3342         CALL     XORR
      0094E6 CD 85 19         [ 4] 3343         CALL     QBRAN
      0094E9 95 0B                 3344         .word      ACCP4
      0094EB CD 90 6D         [ 4] 3345         CALL     KEY
      0094EE CD 86 9A         [ 4] 3346         CALL     DUPP
      0094F1 CD 8C 82         [ 4] 3347         CALL     BLANK
      0094F4 CD 84 F0         [ 4] 3348         CALL     DOLIT
      0094F7 00 7F                 3349         .word      127
      0094F9 CD 8A 17         [ 4] 3350         CALL     WITHI
      0094FC CD 85 19         [ 4] 3351         CALL     QBRAN
      0094FF 95 06                 3352         .word      ACCP2
      009501 CD 94 86         [ 4] 3353         CALL     TAP
      009504 20 03            [ 2] 3354         JRA     ACCP3
      009506 CD 94 9C         [ 4] 3355 ACCP2:  CALL     KTAP
      009509 20 D5            [ 2] 3356 ACCP3:  JRA     ACCP1
      00950B CD 86 90         [ 4] 3357 ACCP4:  CALL     DROP
      00950E CD 86 C2         [ 4] 3358         CALL     OVER
      009511 CC 89 53         [ 2] 3359         JP     SUBB
                                   3360 
                                   3361 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3362 ;       QUERY   ( -- )
                                   3363 ;       Accept input stream to
                                   3364 ;       terminal input buffer.
                                   3365 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001494                       3366         _HEADER QUERY,5,"QUERY"
      009514 94 D0                    1         .word LINK 
                           001496     2         LINK=.
      009516 05                       3         .byte 5  
      009517 51 55 45 52 59           4         .ascii "QUERY"
      00951C                          5         QUERY:
      00951C CD 8D 8B         [ 4] 3367         CALL     TIB
      00951F CD 84 F0         [ 4] 3368         CALL     DOLIT
      009522 00 50                 3369         .word      80
      009524 CD 94 D7         [ 4] 3370         CALL     ACCEP
      009527 CD 87 8E         [ 4] 3371         CALL     NTIB
      00952A CD 85 52         [ 4] 3372         CALL     STORE
      00952D CD 86 90         [ 4] 3373         CALL     DROP
      009530 CD 8C 8F         [ 4] 3374         CALL     ZERO
      009533 CD 87 7E         [ 4] 3375         CALL     INN
      009536 CC 85 52         [ 2] 3376         JP     STORE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



                                   3377 
                                   3378 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3379 ;       ABORT   ( -- )
                                   3380 ;       Reset data stack and
                                   3381 ;       jump to QUIT.
                                   3382 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0014B9                       3383         _HEADER ABORT,5,"ABORT"
      009539 95 16                    1         .word LINK 
                           0014BB     2         LINK=.
      00953B 05                       3         .byte 5  
      00953C 41 42 4F 52 54           4         .ascii "ABORT"
      009541                          5         ABORT:
      009541 CD 96 35         [ 4] 3384         CALL     PRESE
      009544 CC 96 52         [ 2] 3385         JP     QUIT
                                   3386 
                                   3387 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3388 ;       abort"  ( f -- )
                                   3389 ;       Run time routine of ABORT".
                                   3390 ;       Abort with a message.
                                   3391 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0014C7                       3392         _HEADER ABORQ,COMPO+6,'ABORT"'
      009547 95 3B                    1         .word LINK 
                           0014C9     2         LINK=.
      009549 46                       3         .byte COMPO+6  
      00954A 41 42 4F 52 54 22        4         .ascii 'ABORT"'
      009550                          5         ABORQ:
      009550 CD 85 19         [ 4] 3393         CALL     QBRAN
      009553 95 6F                 3394         .word      ABOR2   ;text flag
      009555 CD 90 F8         [ 4] 3395         CALL     DOSTR
      009558 CD 90 A5         [ 4] 3396 ABOR1:  CALL     SPACE
      00955B CD 8D 52         [ 4] 3397         CALL     COUNT
      00955E CD 90 CF         [ 4] 3398         CALL     TYPES
      009561 CD 84 F0         [ 4] 3399         CALL     DOLIT
      009564 00 3F                 3400         .word     63 ; "?"
      009566 CD 84 B7         [ 4] 3401         CALL     EMIT
      009569 CD 90 E8         [ 4] 3402         CALL     CR
      00956C CC 95 41         [ 2] 3403         JP     ABORT   ;pass error string
      00956F CD 90 F8         [ 4] 3404 ABOR2:  CALL     DOSTR
      009572 CC 86 90         [ 2] 3405         JP     DROP
                                   3406 
                                   3407 ;; The text interpreter
                                   3408 
                                   3409 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3410 ;       $INTERPRET      ( a -- )
                                   3411 ;       Interpret a word. If failed,
                                   3412 ;       try to convert it to an integer.
                                   3413 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0014F5                       3414         _HEADER INTER,10,"$INTERPRET"
      009575 95 49                    1         .word LINK 
                           0014F7     2         LINK=.
      009577 0A                       3         .byte 10  
      009578 24 49 4E 54 45 52 50     4         .ascii "$INTERPRET"
             52 45 54
      009582                          5         INTER:
      009582 CD 94 44         [ 4] 3415         CALL     NAMEQ
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



      009585 CD 88 4D         [ 4] 3416         CALL     QDUP    ;?defined
      009588 CD 85 19         [ 4] 3417         CALL     QBRAN
      00958B 95 AC                 3418         .word      INTE1
      00958D CD 85 64         [ 4] 3419         CALL     AT
      009590 CD 84 F0         [ 4] 3420         CALL     DOLIT
      009593 40 00                 3421 	.word       0x4000	; COMPO*256
      009595 CD 86 F7         [ 4] 3422         CALL     ANDD    ;?compile only lexicon bits
      009598 CD 95 50         [ 4] 3423         CALL     ABORQ
      00959B 0D                    3424         .byte      13
      00959C 20 63 6F 6D 70 69 6C  3425         .ascii     " compile only"
             65 20 6F 6E 6C 79
      0095A9 CC 85 45         [ 2] 3426         JP      EXECU
      0095AC                       3427 INTE1:  
      0095AC CD 8F 9F         [ 4] 3428         CALL     NUMBQ   ;convert a number
      0095AF CD 85 19         [ 4] 3429         CALL     QBRAN
      0095B2 95 58                 3430         .word    ABOR1
      0095B4 81               [ 4] 3431         RET
                                   3432 
                                   3433 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3434 ;       [       ( -- )
                                   3435 ;       Start  text interpreter.
                                   3436 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001535                       3437         _HEADER LBRAC,IMEDD+1,"["
      0095B5 95 77                    1         .word LINK 
                           001537     2         LINK=.
      0095B7 81                       3         .byte IMEDD+1  
      0095B8 5B                       4         .ascii "["
      0095B9                          5         LBRAC:
      0095B9 CD 84 F0         [ 4] 3438         CALL   DOLIT
      0095BC 95 82                 3439         .word  INTER
      0095BE CD 87 C1         [ 4] 3440         CALL   TEVAL
      0095C1 CC 85 52         [ 2] 3441         JP     STORE
                                   3442 
                                   3443 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3444 ;       .OK     ( -- )
                                   3445 ;       Display 'ok' while interpreting.
                                   3446 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001544                       3447         _HEADER DOTOK,3,".OK"
      0095C4 95 B7                    1         .word LINK 
                           001546     2         LINK=.
      0095C6 03                       3         .byte 3  
      0095C7 2E 4F 4B                 4         .ascii ".OK"
      0095CA                          5         DOTOK:
      0095CA CD 84 F0         [ 4] 3448         CALL     DOLIT
      0095CD 95 82                 3449         .word      INTER
      0095CF CD 87 C1         [ 4] 3450         CALL     TEVAL
      0095D2 CD 85 64         [ 4] 3451         CALL     AT
      0095D5 CD 89 7B         [ 4] 3452         CALL     EQUAL
      0095D8 CD 85 19         [ 4] 3453         CALL     QBRAN
      0095DB 95 E4                 3454         .word      DOTO1
      0095DD CD 91 15         [ 4] 3455         CALL     DOTQP
      0095E0 03                    3456         .byte      3
      0095E1 20 6F 6B              3457         .ascii     " ok"
      0095E4 CC 90 E8         [ 2] 3458 DOTO1:  JP     CR
                                   3459 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



                                   3460 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3461 ;       ?STACK  ( -- )
                                   3462 ;       Abort if stack underflows.
                                   3463 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001567                       3464         _HEADER QSTAC,6,"?STACK"
      0095E7 95 C6                    1         .word LINK 
                           001569     2         LINK=.
      0095E9 06                       3         .byte 6  
      0095EA 3F 53 54 41 43 4B        4         .ascii "?STACK"
      0095F0                          5         QSTAC:
      0095F0 CD 8C D1         [ 4] 3465         CALL     DEPTH
      0095F3 CD 86 D1         [ 4] 3466         CALL     ZLESS   ;check only for underflow
      0095F6 CD 95 50         [ 4] 3467         CALL     ABORQ
      0095F9 0B                    3468         .byte      11
      0095FA 20 75 6E 64 65 72 66  3469         .ascii     " underflow "
             6C 6F 77 20
      009605 81               [ 4] 3470         RET
                                   3471 
                                   3472 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3473 ;       EVAL    ( -- )
                                   3474 ;       Interpret  input stream.
                                   3475 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001586                       3476         _HEADER EVAL,4,"EVAL"
      009606 95 E9                    1         .word LINK 
                           001588     2         LINK=.
      009608 04                       3         .byte 4  
      009609 45 56 41 4C              4         .ascii "EVAL"
      00960D                          5         EVAL:
      00960D CD 93 47         [ 4] 3477 EVAL1:  CALL     TOKEN
      009610 CD 86 9A         [ 4] 3478         CALL     DUPP
      009613 CD 85 82         [ 4] 3479         CALL     CAT     ;?input stream empty
      009616 CD 85 19         [ 4] 3480         CALL     QBRAN
      009619 96 26                 3481         .word    EVAL2
      00961B CD 87 C1         [ 4] 3482         CALL     TEVAL
      00961E CD 8D 9F         [ 4] 3483         CALL     ATEXE
      009621 CD 95 F0         [ 4] 3484         CALL     QSTAC   ;evaluate input, check stack
      009624 20 E7            [ 2] 3485         JRA     EVAL1 
      009626 CD 86 90         [ 4] 3486 EVAL2:  CALL     DROP
      009629 CC 95 CA         [ 2] 3487         JP       DOTOK
                                   3488 
                                   3489 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3490 ;       PRESET  ( -- )
                                   3491 ;       Reset data stack pointer and
                                   3492 ;       terminal input buffer.
                                   3493 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0015AC                       3494         _HEADER PRESE,6,"PRESET"
      00962C 96 08                    1         .word LINK 
                           0015AE     2         LINK=.
      00962E 06                       3         .byte 6  
      00962F 50 52 45 53 45 54        4         .ascii "PRESET"
      009635                          5         PRESE:
      009635 CD 84 F0         [ 4] 3495         CALL     DOLIT
      009638 16 80                 3496         .word      SPP
      00963A CD 86 87         [ 4] 3497         CALL     SPSTO
      00963D CD 84 F0         [ 4] 3498         CALL     DOLIT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



      009640 17 00                 3499         .word      TIBB
      009642 CD 87 8E         [ 4] 3500         CALL     NTIB
      009645 CD 8B F8         [ 4] 3501         CALL     CELLP
      009648 CC 85 52         [ 2] 3502         JP     STORE
                                   3503 
                                   3504 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3505 ;       QUIT    ( -- )
                                   3506 ;       Reset return stack pointer
                                   3507 ;       and start text interpreter.
                                   3508 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0015CB                       3509         _HEADER QUIT,4,"QUIT"
      00964B 96 2E                    1         .word LINK 
                           0015CD     2         LINK=.
      00964D 04                       3         .byte 4  
      00964E 51 55 49 54              4         .ascii "QUIT"
      009652                          5         QUIT:
      009652 CD 84 F0         [ 4] 3510         CALL     DOLIT
      009655 17 FF                 3511         .word      RPP
      009657 CD 85 9F         [ 4] 3512         CALL     RPSTO   ;reset return stack pointer
      00965A CD 95 B9         [ 4] 3513 QUIT1:  CALL     LBRAC   ;start interpretation
      00965D CD 95 1C         [ 4] 3514 QUIT2:  CALL     QUERY   ;get input
      009660 CD 96 0D         [ 4] 3515         CALL     EVAL
      009663 20 F8            [ 2] 3516         JRA     QUIT2   ;continue till error
                                   3517 
                                   3518 ;; The compiler
                                   3519 
                                   3520 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3521 ;       '       ( -- ca )
                                   3522 ;       Search vocabularies for
                                   3523 ;       next word in input stream.
                                   3524 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0015E5                       3525         _HEADER TICK,1,"'"
      009665 96 4D                    1         .word LINK 
                           0015E7     2         LINK=.
      009667 01                       3         .byte 1  
      009668 27                       4         .ascii "'"
      009669                          5         TICK:
      009669 CD 93 47         [ 4] 3526         CALL     TOKEN
      00966C CD 94 44         [ 4] 3527         CALL     NAMEQ   ;?defined
      00966F CD 85 19         [ 4] 3528         CALL     QBRAN
      009672 95 58                 3529         .word      ABOR1
      009674 81               [ 4] 3530         RET     ;yes, push code address
                                   3531 
                                   3532 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3533 ;       ALLOT   ( n -- )
                                   3534 ;       Allocate n bytes to RAM 
                                   3535 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0015F5                       3536         _HEADER ALLOT,5,"ALLOT"
      009675 96 67                    1         .word LINK 
                           0015F7     2         LINK=.
      009677 05                       3         .byte 5  
      009678 41 4C 4C 4F 54           4         .ascii "ALLOT"
      00967D                          5         ALLOT:
      00967D CD 87 F1         [ 4] 3537         CALL     VPP
                                   3538 ; must update APP_VP each time VP is modidied
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



      009680 CD 8C FF         [ 4] 3539         call PSTOR 
      009683 CC 9E 8C         [ 2] 3540         jp UPDATVP 
                                   3541 
                                   3542 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3543 ;       ,       ( w -- )
                                   3544 ;         Compile an integer into
                                   3545 ;         variable space.
                                   3546 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001606                       3547         _HEADER COMMA,1,^/"\,"/
      009686 96 77                    1         .word LINK 
                           001608     2         LINK=.
      009688 01                       3         .byte 1  
      009689 5C 2C                    4         .ascii "\,"
      00968B                          5         COMMA:
      00968B CD 8D 69         [ 4] 3548         CALL     HERE
      00968E CD 86 9A         [ 4] 3549         CALL     DUPP
      009691 CD 8B F8         [ 4] 3550         CALL     CELLP   ;cell boundary
      009694 CD 87 F1         [ 4] 3551         CALL     VPP
      009697 CD 85 52         [ 4] 3552         CALL     STORE
      00969A CC 85 52         [ 2] 3553         JP     STORE
                                   3554 
                                   3555 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3556 ;       C,      ( c -- )
                                   3557 ;       Compile a byte into
                                   3558 ;       variables space.
                                   3559 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00161D                       3560         _HEADER CCOMMA,2,^/"C,"/
      00969D 96 88                    1         .word LINK 
                           00161F     2         LINK=.
      00969F 02                       3         .byte 2  
      0096A0 43 2C                    4         .ascii "C,"
      0096A2                          5         CCOMMA:
      0096A2 CD 8D 69         [ 4] 3561         CALL     HERE
      0096A5 CD 86 9A         [ 4] 3562         CALL     DUPP
      0096A8 CD 8C 23         [ 4] 3563         CALL     ONEP
      0096AB CD 87 F1         [ 4] 3564         CALL     VPP
      0096AE CD 85 52         [ 4] 3565         CALL     STORE
      0096B1 CC 85 71         [ 2] 3566         JP     CSTOR
                                   3567 
                                   3568 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3569 ;       [COMPILE]       ( -- ; <string> )
                                   3570 ;       Compile next immediate
                                   3571 ;       word into code dictionary.
                                   3572 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001634                       3573         _HEADER BCOMP,IMEDD+9,"[COMPILE]"
      0096B4 96 9F                    1         .word LINK 
                           001636     2         LINK=.
      0096B6 89                       3         .byte IMEDD+9  
      0096B7 5B 43 4F 4D 50 49 4C     4         .ascii "[COMPILE]"
             45 5D
      0096C0                          5         BCOMP:
      0096C0 CD 96 69         [ 4] 3574         CALL     TICK
      0096C3 CC 99 A7         [ 2] 3575         JP     JSRC
                                   3576 
                                   3577 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



                                   3578 ;       COMPILE ( -- )
                                   3579 ;       Compile next jsr in
                                   3580 ;       colon list to code dictionary.
                                   3581 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001646                       3582         _HEADER COMPI,COMPO+7,"COMPILE"
      0096C6 96 B6                    1         .word LINK 
                           001648     2         LINK=.
      0096C8 47                       3         .byte COMPO+7  
      0096C9 43 4F 4D 50 49 4C 45     4         .ascii "COMPILE"
      0096D0                          5         COMPI:
      0096D0 CD 85 B5         [ 4] 3583         CALL     RFROM
      0096D3 CD 86 9A         [ 4] 3584         CALL     DUPP
      0096D6 CD 85 64         [ 4] 3585         CALL     AT
      0096D9 CD 99 A7         [ 4] 3586         CALL     JSRC    ;compile subroutine
      0096DC CD 8B F8         [ 4] 3587         CALL     CELLP
      0096DF 90 93            [ 1] 3588         ldw y,x 
      0096E1 90 FE            [ 2] 3589         ldw y,(y)
      0096E3 1C 00 02         [ 2] 3590         addw x,#CELLL 
      0096E6 90 FC            [ 2] 3591         jp (y)
                                   3592 
                                   3593 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3594 ;       LITERAL ( w -- )
                                   3595 ;       Compile tos to dictionary
                                   3596 ;       as an integer literal.
                                   3597 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001668                       3598         _HEADER LITER,COMPO+IMEDD+7,"LITERAL"
      0096E8 96 C8                    1         .word LINK 
                           00166A     2         LINK=.
      0096EA C7                       3         .byte COMPO+IMEDD+7  
      0096EB 4C 49 54 45 52 41 4C     4         .ascii "LITERAL"
      0096F2                          5         LITER:
      0096F2 CD 96 D0         [ 4] 3599         CALL     COMPI
      0096F5 84 F0                 3600         .word DOLIT 
      0096F7 CC 96 8B         [ 2] 3601         JP     COMMA
                                   3602 
                                   3603 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3604 ;       $,"     ( -- )
                                   3605 ;       Compile a literal string
                                   3606 ;       up to next " .
                                   3607 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3608 ;        _HEADER STRCQ,3,^/'$,"'/
      0096FA                       3609 STRCQ:
      0096FA CD 84 F0         [ 4] 3610         CALL     DOLIT
      0096FD 00 22                 3611         .word     34	; "
      0096FF CD 92 86         [ 4] 3612         CALL     PARSE
      009702 CD 8D 69         [ 4] 3613         CALL     HERE
      009705 CD 8E 3A         [ 4] 3614         CALL     PACKS   ;string to code dictionary
      009708 CD 8D 52         [ 4] 3615         CALL     COUNT
      00970B CD 88 BD         [ 4] 3616         CALL     PLUS    ;calculate aligned end of string
      00970E CD 87 F1         [ 4] 3617         CALL     VPP
      009711 CC 85 52         [ 2] 3618         JP     STORE
                                   3619 
                                   3620 ;; Structures
                                   3621 
                                   3622 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



                                   3623 ;       FOR     ( -- a )
                                   3624 ;       Start a FOR-NEXT loop
                                   3625 ;       structure in a colon definition.
                                   3626 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001694                       3627         _HEADER FOR,IMEDD+3,"FOR"
      009714 96 EA                    1         .word LINK 
                           001696     2         LINK=.
      009716 83                       3         .byte IMEDD+3  
      009717 46 4F 52                 4         .ascii "FOR"
      00971A                          5         FOR:
      00971A CD 96 D0         [ 4] 3628         CALL     COMPI
      00971D 86 63                 3629         .word TOR 
      00971F CC 8D 69         [ 2] 3630         JP     HERE
                                   3631 
                                   3632 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3633 ;       NEXT    ( a -- )
                                   3634 ;       Terminate a FOR-NEXT loop.
                                   3635 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0016A2                       3636         _HEADER NEXT,IMEDD+4,"NEXT"
      009722 97 16                    1         .word LINK 
                           0016A4     2         LINK=.
      009724 84                       3         .byte IMEDD+4  
      009725 4E 45 58 54              4         .ascii "NEXT"
      009729                          5         NEXT:
      009729 CD 96 D0         [ 4] 3637         CALL     COMPI
      00972C 85 04                 3638         .word DONXT 
      00972E CD 88 3D         [ 4] 3639         call ADRADJ
      009731 CC 96 8B         [ 2] 3640         JP     COMMA
                                   3641 
                                   3642 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3643 ;       I ( -- n )
                                   3644 ;       stack COUNTER
                                   3645 ;       of innermost FOR-NEXT  
                                   3646 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0016B4                       3647         _HEADER IFETCH,1,"I"
      009734 97 24                    1         .word LINK 
                           0016B6     2         LINK=.
      009736 01                       3         .byte 1  
      009737 49                       4         .ascii "I"
      009738                          5         IFETCH:
      009738 1D 00 02         [ 2] 3648         subw x,#CELLL 
      00973B 16 03            [ 2] 3649         ldw y,(3,sp)
      00973D FF               [ 2] 3650         ldw (x),y 
      00973E 81               [ 4] 3651         ret 
                                   3652 
                                   3653 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3654 ;       J ( -- n )
                                   3655 ;   stack COUNTER
                                   3656 ;   of outer FOR-NEXT  
                                   3657 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0016BF                       3658         _HEADER JFETCH,1,"J"
      00973F 97 36                    1         .word LINK 
                           0016C1     2         LINK=.
      009741 01                       3         .byte 1  
      009742 4A                       4         .ascii "J"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



      009743                          5         JFETCH:
      009743 1D 00 02         [ 2] 3659         SUBW X,#CELLL 
      009746 16 05            [ 2] 3660         LDW Y,(5,SP)
      009748 FF               [ 2] 3661         LDW (X),Y 
      009749 81               [ 4] 3662         RET 
                                   3663 
                                   3664 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3665 ;       BEGIN   ( -- a )
                                   3666 ;       Start an infinite or
                                   3667 ;       indefinite loop structure.
                                   3668 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0016CA                       3669         _HEADER BEGIN,IMEDD+5,"BEGIN"
      00974A 97 41                    1         .word LINK 
                           0016CC     2         LINK=.
      00974C 85                       3         .byte IMEDD+5  
      00974D 42 45 47 49 4E           4         .ascii "BEGIN"
      009752                          5         BEGIN:
      009752 CC 8D 69         [ 2] 3670         JP     HERE
                                   3671 
                                   3672 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3673 ;       UNTIL   ( a -- )
                                   3674 ;       Terminate a BEGIN-UNTIL
                                   3675 ;       indefinite loop structure.
                                   3676 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0016D5                       3677         _HEADER UNTIL,IMEDD+5,"UNTIL"
      009755 97 4C                    1         .word LINK 
                           0016D7     2         LINK=.
      009757 85                       3         .byte IMEDD+5  
      009758 55 4E 54 49 4C           4         .ascii "UNTIL"
      00975D                          5         UNTIL:
      00975D CD 96 D0         [ 4] 3678         CALL     COMPI
      009760 85 19                 3679         .word    QBRAN 
      009762 CD 88 3D         [ 4] 3680         call ADRADJ
      009765 CC 96 8B         [ 2] 3681         JP     COMMA
                                   3682 
                                   3683 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3684 ;       AGAIN   ( a -- )
                                   3685 ;       Terminate a BEGIN-AGAIN
                                   3686 ;       infinite loop structure.
                                   3687 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0016E8                       3688         _HEADER AGAIN,IMEDD+5,"AGAIN"
      009768 97 57                    1         .word LINK 
                           0016EA     2         LINK=.
      00976A 85                       3         .byte IMEDD+5  
      00976B 41 47 41 49 4E           4         .ascii "AGAIN"
      009770                          5         AGAIN:
                           000001  3689 .if OPTIMIZE 
      0016F0                       3690         _DOLIT JPIMM 
      009770 CD 84 F0         [ 4]    1     CALL DOLIT 
      009773 00 CC                    2     .word JPIMM 
      009775 CD 96 A2         [ 4] 3691         CALL  CCOMMA
                           000000  3692 .else 
                                   3693         CALL     COMPI
                                   3694         .word BRAN
                                   3695 .endif 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



      009778 CD 88 3D         [ 4] 3696         call ADRADJ 
      00977B CC 96 8B         [ 2] 3697         JP     COMMA
                                   3698 
                                   3699 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3700 ;       IF      ( -- A )
                                   3701 ;       Begin a conditional branch.
                                   3702 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0016FE                       3703         _HEADER IFF,IMEDD+2,"IF"
      00977E 97 6A                    1         .word LINK 
                           001700     2         LINK=.
      009780 82                       3         .byte IMEDD+2  
      009781 49 46                    4         .ascii "IF"
      009783                          5         IFF:
      009783 CD 96 D0         [ 4] 3704         CALL     COMPI
      009786 85 19                 3705         .word QBRAN
      009788 CD 8D 69         [ 4] 3706         CALL     HERE
      00978B CD 8C 8F         [ 4] 3707         CALL     ZERO
      00978E CC 96 8B         [ 2] 3708         JP     COMMA
                                   3709 
                                   3710 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3711 ;       THEN        ( A -- )
                                   3712 ;       Terminate a conditional 
                                   3713 ;       branch structure.
                                   3714 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001711                       3715         _HEADER THENN,IMEDD+4,"THEN"
      009791 97 80                    1         .word LINK 
                           001713     2         LINK=.
      009793 84                       3         .byte IMEDD+4  
      009794 54 48 45 4E              4         .ascii "THEN"
      009798                          5         THENN:
      009798 CD 8D 69         [ 4] 3716         CALL     HERE
      00979B CD 88 3D         [ 4] 3717         call ADRADJ 
      00979E CD 86 AA         [ 4] 3718         CALL     SWAPP
      0097A1 CC 85 52         [ 2] 3719         JP     STORE
                                   3720 
                                   3721 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3722 ;       ELSE        ( A -- A )
                                   3723 ;       Start the false clause in 
                                   3724 ;       an IF-ELSE-THEN structure.
                                   3725 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001724                       3726         _HEADER ELSEE,IMEDD+4,"ELSE"
      0097A4 97 93                    1         .word LINK 
                           001726     2         LINK=.
      0097A6 84                       3         .byte IMEDD+4  
      0097A7 45 4C 53 45              4         .ascii "ELSE"
      0097AB                          5         ELSEE:
                           000001  3727 .if OPTIMIZE 
      00172B                       3728         _DOLIT JPIMM 
      0097AB CD 84 F0         [ 4]    1     CALL DOLIT 
      0097AE 00 CC                    2     .word JPIMM 
      0097B0 CD 96 A2         [ 4] 3729         CALL CCOMMA 
                           000000  3730 .else 
                                   3731          CALL     COMPI
                                   3732         .word BRAN
                                   3733 .endif 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



      0097B3 CD 8D 69         [ 4] 3734         CALL     HERE
      0097B6 CD 8C 8F         [ 4] 3735         CALL     ZERO
      0097B9 CD 96 8B         [ 4] 3736         CALL     COMMA
      0097BC CD 86 AA         [ 4] 3737         CALL     SWAPP
      0097BF CD 8D 69         [ 4] 3738         CALL     HERE
      0097C2 CD 88 3D         [ 4] 3739         call ADRADJ 
      0097C5 CD 86 AA         [ 4] 3740         CALL     SWAPP
      0097C8 CC 85 52         [ 2] 3741         JP     STORE
                                   3742 
                                   3743 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3744 ;       AHEAD       ( -- A )
                                   3745 ;       Compile a forward branch
                                   3746 ;       instruction.
                                   3747 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00174B                       3748         _HEADER AHEAD,IMEDD+5,"AHEAD"
      0097CB 97 A6                    1         .word LINK 
                           00174D     2         LINK=.
      0097CD 85                       3         .byte IMEDD+5  
      0097CE 41 48 45 41 44           4         .ascii "AHEAD"
      0097D3                          5         AHEAD:
                           000001  3749 .if OPTIMIZE 
      001753                       3750         _DOLIT JPIMM 
      0097D3 CD 84 F0         [ 4]    1     CALL DOLIT 
      0097D6 00 CC                    2     .word JPIMM 
      0097D8 CD 96 A2         [ 4] 3751         CALL CCOMMA
                           000000  3752 .else 
                                   3753         CALL     COMPI
                                   3754         .word BRAN
                                   3755 .endif 
      0097DB CD 8D 69         [ 4] 3756         CALL     HERE
      0097DE CD 8C 8F         [ 4] 3757         CALL     ZERO
      0097E1 CC 96 8B         [ 2] 3758         JP     COMMA
                                   3759 
                                   3760 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3761 ;       WHILE       ( a -- A a )
                                   3762 ;       Conditional branch out of a 
                                   3763 ;       BEGIN-WHILE-REPEAT loop.
                                   3764 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001764                       3765         _HEADER WHILE,IMEDD+5,"WHILE"
      0097E4 97 CD                    1         .word LINK 
                           001766     2         LINK=.
      0097E6 85                       3         .byte IMEDD+5  
      0097E7 57 48 49 4C 45           4         .ascii "WHILE"
      0097EC                          5         WHILE:
      0097EC CD 96 D0         [ 4] 3766         CALL     COMPI
      0097EF 85 19                 3767         .word QBRAN
      0097F1 CD 8D 69         [ 4] 3768         CALL     HERE
      0097F4 CD 8C 8F         [ 4] 3769         CALL     ZERO
      0097F7 CD 96 8B         [ 4] 3770         CALL     COMMA
      0097FA CC 86 AA         [ 2] 3771         JP     SWAPP
                                   3772 
                                   3773 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3774 ;       REPEAT      ( A a -- )
                                   3775 ;       Terminate a BEGIN-WHILE-REPEAT 
                                   3776 ;       indefinite loop.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



                                   3777 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00177D                       3778         _HEADER REPEA,IMEDD+6,"REPEAT"
      0097FD 97 E6                    1         .word LINK 
                           00177F     2         LINK=.
      0097FF 86                       3         .byte IMEDD+6  
      009800 52 45 50 45 41 54        4         .ascii "REPEAT"
      009806                          5         REPEA:
                           000001  3779 .if OPTIMIZE 
      001786                       3780         _DOLIT JPIMM 
      009806 CD 84 F0         [ 4]    1     CALL DOLIT 
      009809 00 CC                    2     .word JPIMM 
      00980B CD 96 A2         [ 4] 3781         CALL  CCOMMA
                           000000  3782 .else 
                                   3783         CALL     COMPI
                                   3784         .word BRAN
                                   3785 .endif 
      00980E CD 88 3D         [ 4] 3786         call ADRADJ 
      009811 CD 96 8B         [ 4] 3787         CALL     COMMA
      009814 CD 8D 69         [ 4] 3788         CALL     HERE
      009817 CD 88 3D         [ 4] 3789         call ADRADJ 
      00981A CD 86 AA         [ 4] 3790         CALL     SWAPP
      00981D CC 85 52         [ 2] 3791         JP     STORE
                                   3792 
                                   3793 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3794 ;       AFT         ( a -- a A )
                                   3795 ;       Jump to THEN in a FOR-AFT-THEN-NEXT 
                                   3796 ;       loop the first time through.
                                   3797 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0017A0                       3798         _HEADER AFT,IMEDD+3,"AFT"
      009820 97 FF                    1         .word LINK 
                           0017A2     2         LINK=.
      009822 83                       3         .byte IMEDD+3  
      009823 41 46 54                 4         .ascii "AFT"
      009826                          5         AFT:
      009826 CD 86 90         [ 4] 3799         CALL     DROP
      009829 CD 97 D3         [ 4] 3800         CALL     AHEAD
      00982C CD 8D 69         [ 4] 3801         CALL     HERE
      00982F CC 86 AA         [ 2] 3802         JP     SWAPP
                                   3803 
                                   3804 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3805 ;       ABORT"      ( -- ; <string> )
                                   3806 ;       Conditional abort with an error message.
                                   3807 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0017B2                       3808         _HEADER ABRTQ,IMEDD+6,'ABORT"'
      009832 98 22                    1         .word LINK 
                           0017B4     2         LINK=.
      009834 86                       3         .byte IMEDD+6  
      009835 41 42 4F 52 54 22        4         .ascii 'ABORT"'
      00983B                          5         ABRTQ:
      00983B CD 96 D0         [ 4] 3809         CALL     COMPI
      00983E 95 50                 3810         .word ABORQ
      009840 CC 96 FA         [ 2] 3811         JP     STRCQ
                                   3812 
                                   3813 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3814 ;       $"     ( -- ; <string> )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



                                   3815 ;       Compile an inline string literal.
                                   3816 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0017C3                       3817         _HEADER STRQ,IMEDD+2,'$"'
      009843 98 34                    1         .word LINK 
                           0017C5     2         LINK=.
      009845 82                       3         .byte IMEDD+2  
      009846 24 22                    4         .ascii '$"'
      009848                          5         STRQ:
      009848 CD 96 D0         [ 4] 3818         CALL     COMPI
      00984B 91 11                 3819         .word STRQP 
      00984D CC 96 FA         [ 2] 3820         JP     STRCQ
                                   3821 
                                   3822 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3823 ;       ."          ( -- ; <string> )
                                   3824 ;       Compile an inline string literal 
                                   3825 ;       to be typed out at run time.
                                   3826 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0017D0                       3827         _HEADER DOTQ,IMEDD+2,'."'
      009850 98 45                    1         .word LINK 
                           0017D2     2         LINK=.
      009852 82                       3         .byte IMEDD+2  
      009853 2E 22                    4         .ascii '."'
      009855                          5         DOTQ:
      009855 CD 96 D0         [ 4] 3828         CALL     COMPI
      009858 91 15                 3829         .word DOTQP 
      00985A CC 96 FA         [ 2] 3830         JP     STRCQ
                                   3831 
                                   3832 ;; Name compiler
                                   3833 
                                   3834 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3835 ;       ?UNIQUE ( a -- a )
                                   3836 ;       Display a warning message
                                   3837 ;       if word already exists.
                                   3838 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0017DD                       3839         _HEADER UNIQU,7,"?UNIQUE"
      00985D 98 52                    1         .word LINK 
                           0017DF     2         LINK=.
      00985F 07                       3         .byte 7  
      009860 3F 55 4E 49 51 55 45     4         .ascii "?UNIQUE"
      009867                          5         UNIQU:
      009867 CD 86 9A         [ 4] 3840         CALL     DUPP
      00986A CD 94 44         [ 4] 3841         CALL     NAMEQ   ;?name exists
      00986D CD 85 19         [ 4] 3842         CALL     QBRAN
      009870 98 86                 3843         .word      UNIQ1
      009872 CD 91 15         [ 4] 3844         CALL     DOTQP   ;redef are OK
      009875 07                    3845         .byte       7
      009876 20 72 65 44 65 66 20  3846         .ascii     " reDef "       
      00987D CD 86 C2         [ 4] 3847         CALL     OVER
      009880 CD 8D 52         [ 4] 3848         CALL     COUNT
      009883 CD 90 CF         [ 4] 3849         CALL     TYPES   ;just in case
      009886 CC 86 90         [ 2] 3850 UNIQ1:  JP     DROP
                                   3851 
                                   3852 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3853 ;       $,n     ( na -- )
                                   3854 ;       Build a new dictionary name
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



                                   3855 ;       using string at na.
                                   3856 ; compile dans l'espace des variables 
                                   3857 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3858 ;        _HEADER SNAME,3,^/"$,n"/
      009889                       3859 SNAME: 
      009889 CD 86 9A         [ 4] 3860         CALL     DUPP
      00988C CD 85 82         [ 4] 3861         CALL     CAT     ;?null input
      00988F CD 85 19         [ 4] 3862         CALL     QBRAN
      009892 98 BF                 3863         .word      PNAM1
      009894 CD 98 67         [ 4] 3864         CALL     UNIQU   ;?redefinition
      009897 CD 86 9A         [ 4] 3865         CALL     DUPP
      00989A CD 8D 52         [ 4] 3866         CALL     COUNT
      00989D CD 88 BD         [ 4] 3867         CALL     PLUS
      0098A0 CD 87 F1         [ 4] 3868         CALL     VPP
      0098A3 CD 85 52         [ 4] 3869         CALL     STORE
      0098A6 CD 86 9A         [ 4] 3870         CALL     DUPP
      0098A9 CD 88 0F         [ 4] 3871         CALL     LAST
      0098AC CD 85 52         [ 4] 3872         CALL     STORE   ;save na for vocabulary link
      0098AF CD 8C 07         [ 4] 3873         CALL     CELLM   ;link address
      0098B2 CD 87 E3         [ 4] 3874         CALL     CNTXT
      0098B5 CD 85 64         [ 4] 3875         CALL     AT
      0098B8 CD 86 AA         [ 4] 3876         CALL     SWAPP
      0098BB CD 85 52         [ 4] 3877         CALL     STORE
      0098BE 81               [ 4] 3878         RET     ;save code pointer
      0098BF CD 91 11         [ 4] 3879 PNAM1:  CALL     STRQP
      0098C2 05                    3880         .byte      5
      0098C3 20 6E 61 6D 65        3881         .ascii     " name" ;null input
      0098C8 CC 95 58         [ 2] 3882         JP     ABOR1
                                   3883 
                                   3884 ;; FORTH compiler
                                   3885 
                                   3886 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3887 ;       $COMPILE        ( a -- )
                                   3888 ;       Compile next word to
                                   3889 ;       dictionary as a token or literal.
                                   3890 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00184B                       3891         _HEADER SCOMP,8,"$COMPILE"
      0098CB 98 5F                    1         .word LINK 
                           00184D     2         LINK=.
      0098CD 08                       3         .byte 8  
      0098CE 24 43 4F 4D 50 49 4C     4         .ascii "$COMPILE"
             45
      0098D6                          5         SCOMP:
      0098D6 CD 94 44         [ 4] 3892         CALL     NAMEQ
      0098D9 CD 88 4D         [ 4] 3893         CALL     QDUP    ;?defined
      0098DC CD 85 19         [ 4] 3894         CALL     QBRAN
      0098DF 98 F7                 3895         .word      SCOM2
      0098E1 CD 85 64         [ 4] 3896         CALL     AT
      0098E4 CD 84 F0         [ 4] 3897         CALL     DOLIT
      0098E7 80 00                 3898         .word     0x8000	;  IMEDD*256
      0098E9 CD 86 F7         [ 4] 3899         CALL     ANDD    ;?immediate
      0098EC CD 85 19         [ 4] 3900         CALL     QBRAN
      0098EF 98 F4                 3901         .word      SCOM1
      0098F1 CC 85 45         [ 2] 3902         JP     EXECU
      0098F4 CC 99 A7         [ 2] 3903 SCOM1:  JP     JSRC
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



      0098F7 CD 8F 9F         [ 4] 3904 SCOM2:  CALL     NUMBQ   ;try to convert to number 
      0098FA CD 88 4D         [ 4] 3905         CALL    QDUP  
      0098FD CD 85 19         [ 4] 3906         CALL     QBRAN
      009900 95 58                 3907         .word      ABOR1
                           000000  3908 .if WANT_DOUBLE 
                                   3909         _DOLIT  -1
                                   3910         CALL    EQUAL
                                   3911         _QBRAN DLITER
                                   3912         JP  LITER 
                                   3913 .endif 
                           000001  3914 .if WANT_FLOAT24 
      001882                       3915         _DOLIT -1 
      009902 CD 84 F0         [ 4]    1     CALL DOLIT 
      009905 FF FF                    2     .word -1 
      009907 CD 89 7B         [ 4] 3916         CALL EQUAL 
      00188A                       3917         _QBRAN FLITER
      00990A CD 85 19         [ 4]    1     CALL QBRAN
      00990D A9 C6                    2     .word FLITER
      00990F CC 96 F2         [ 2] 3918         JP  LITER  
                                   3919 .endif 
      001892                       3920         _DROP 
      009912 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      009915 CC 96 F2         [ 2] 3921         JP     LITER
                                   3922 
                                   3923 
                                   3924 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3925 ;       OVERT   ( -- )
                                   3926 ;       Link a new word into vocabulary.
                                   3927 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001898                       3928         _HEADER OVERT,5,"OVERT"
      009918 98 CD                    1         .word LINK 
                           00189A     2         LINK=.
      00991A 05                       3         .byte 5  
      00991B 4F 56 45 52 54           4         .ascii "OVERT"
      009920                          5         OVERT:
      009920 CD 88 0F         [ 4] 3929         CALL     LAST
      009923 CD 85 64         [ 4] 3930         CALL     AT
      009926 CD 87 E3         [ 4] 3931         CALL     CNTXT
      009929 CC 85 52         [ 2] 3932         JP     STORE
                                   3933 
                                   3934 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3935 ;       ;       ( -- )
                                   3936 ;       Terminate a colon definition.
                                   3937 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0018AC                       3938         _HEADER SEMIS,IMEDD+COMPO+1,^/";"/
      00992C 99 1A                    1         .word LINK 
                           0018AE     2         LINK=.
      00992E C1                       3         .byte IMEDD+COMPO+1  
      00992F 3B                       4         .ascii ";"
      009930                          5         SEMIS:
                           000001  3939 .if OPTIMIZE ; more compact and faster
      009930 CD 84 F0         [ 4] 3940         call DOLIT 
      009933 00 81                 3941         .word 0x81   ; opcode for RET 
      009935 CD 96 A2         [ 4] 3942         call CCOMMA 
                           000000  3943 .else
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



                                   3944         CALL     COMPI
                                   3945         .word EXIT 
                                   3946 .endif 
      009938 CD 95 B9         [ 4] 3947         CALL     LBRAC
      00993B CD 99 20         [ 4] 3948         call OVERT 
      00993E CD A3 E4         [ 4] 3949         CALL FMOVE
      009941 CD 88 4D         [ 4] 3950         call QDUP 
      009944 CD 85 19         [ 4] 3951         call QBRAN 
      009947 9A BD                 3952         .word SET_RAMLAST 
      009949 CD A4 78         [ 4] 3953         CALL UPDATPTR
      00994C 81               [ 4] 3954         RET 
                                   3955 
                                   3956 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3957 ;       Terminate an ISR definition 
                                   3958 ;       retourn ca of ISR as double
                                   3959 ;       I; ( -- ud )
                                   3960 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0018CD                       3961        _HEADER ISEMI,2+IMEDD+COMPO,^/"I;"/
      00994D 99 2E                    1         .word LINK 
                           0018CF     2         LINK=.
      00994F C2                       3         .byte 2+IMEDD+COMPO  
      009950 49 3B                    4         .ascii "I;"
      009952                          5         ISEMI:
      009952 1D 00 02         [ 2] 3962         subw x,#CELLL  
      009955 90 AE 00 80      [ 2] 3963         ldw y,#IRET_CODE 
      009959 FF               [ 2] 3964         ldw (x),y 
      00995A CD 96 A2         [ 4] 3965         call CCOMMA
      00995D CD 95 B9         [ 4] 3966         call LBRAC 
      009960 CD A4 BD         [ 4] 3967         call IFMOVE
      009963 CD 88 4D         [ 4] 3968         call QDUP 
      009966 CD 85 19         [ 4] 3969         CALL QBRAN 
      009969 9A BD                 3970         .word SET_RAMLAST
      00996B CD 87 FF         [ 4] 3971         CALL CPP
      00996E CD 85 64         [ 4] 3972         call AT 
      009971 CD 86 AA         [ 4] 3973         call SWAPP 
      009974 CD 87 FF         [ 4] 3974         CALL CPP 
      009977 CD 85 52         [ 4] 3975         call STORE 
      00997A CD 9E 75         [ 4] 3976         call UPDATCP 
      00997D CD 9E 32         [ 4] 3977         call EEPVP 
      001900                       3978         _DROP 
      009980 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      009983 CD 85 64         [ 4] 3979         call AT 
      009986 CD 87 F1         [ 4] 3980         call VPP 
      009989 CD 85 52         [ 4] 3981         call STORE 
      00998C CC 8C 8F         [ 2] 3982         jp ZERO
      00998F 81               [ 4] 3983         ret           
                                   3984         
                                   3985 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3986 ;       ]       ( -- )
                                   3987 ;       Start compiling words in
                                   3988 ;       input stream.
                                   3989 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001910                       3990         _HEADER RBRAC,1,"]"
      009990 99 4F                    1         .word LINK 
                           001912     2         LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



      009992 01                       3         .byte 1  
      009993 5D                       4         .ascii "]"
      009994                          5         RBRAC:
      009994 CD 84 F0         [ 4] 3991         CALL   DOLIT
      009997 98 D6                 3992         .word  SCOMP
      009999 CD 87 C1         [ 4] 3993         CALL   TEVAL
      00999C CC 85 52         [ 2] 3994         JP     STORE
                                   3995 
                                   3996 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3997 ;       CALL,    ( ca -- )
                                   3998 ;       Compile a subroutine call.
                                   3999 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00191F                       4000         _HEADER JSRC,5,^/"CALL,"/
      00999F 99 92                    1         .word LINK 
                           001921     2         LINK=.
      0099A1 05                       3         .byte 5  
      0099A2 43 41 4C 4C 2C           4         .ascii "CALL,"
      0099A7                          5         JSRC:
                           000001  4001 .if OPTIMIZE 
                                   4002 ;;;;; optimization code ;;;;;;;;;;;;;;;
      0099A7 90 AE 86 90      [ 2] 4003         LDW Y,#DROP 
      0099AB 90 BF 26         [ 2] 4004         LDW YTEMP,Y 
      0099AE 90 93            [ 1] 4005         LDW Y,X 
      0099B0 90 FE            [ 2] 4006         LDW Y,(Y)
      0099B2 90 B3 26         [ 2] 4007         CPW Y,YTEMP 
      0099B5 26 13            [ 1] 4008         JRNE JSRC1         
                                   4009 ; replace CALL DROP BY  ADDW X,#CELLL 
      0099B7 1C 00 02         [ 2] 4010         ADDW X,#CELLL 
      00193A                       4011         _DOLIT ADDWX ; opcode 
      0099BA CD 84 F0         [ 4]    1     CALL DOLIT 
      0099BD 00 1C                    2     .word ADDWX 
      0099BF CD 96 A2         [ 4] 4012         CALL   CCOMMA 
      001942                       4013         _DOLIT CELLL 
      0099C2 CD 84 F0         [ 4]    1     CALL DOLIT 
      0099C5 00 02                    2     .word CELLL 
      0099C7 CC 96 8B         [ 2] 4014         JP      COMMA 
      0099CA                       4015 JSRC1: ; check for DDROP 
      0099CA 90 AE 88 9D      [ 2] 4016         LDW Y,#DDROP 
      0099CE 90 BF 26         [ 2] 4017         LDW YTEMP,Y 
      0099D1 90 93            [ 1] 4018         LDW Y,X 
      0099D3 90 FE            [ 2] 4019         LDW Y,(Y)
      0099D5 90 B3 26         [ 2] 4020         CPW Y,YTEMP 
      0099D8 26 13            [ 1] 4021         JRNE JSRC2 
                                   4022 ; replace CALL DDROP BY ADDW X,#2*CELLL 
      0099DA 1C 00 02         [ 2] 4023         ADDW X,#CELLL 
      00195D                       4024         _DOLIT ADDWX 
      0099DD CD 84 F0         [ 4]    1     CALL DOLIT 
      0099E0 00 1C                    2     .word ADDWX 
      0099E2 CD 96 A2         [ 4] 4025         CALL  CCOMMA 
      001965                       4026         _DOLIT 2*CELLL 
      0099E5 CD 84 F0         [ 4]    1     CALL DOLIT 
      0099E8 00 04                    2     .word 2*CELLL 
      0099EA CC 96 8B         [ 2] 4027         JP  COMMA 
      0099ED                       4028 JSRC2: 
                                   4029 ;;;;;;;; end optimization code ;;;;;;;;;;        
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



                                   4030 .endif        
      0099ED CD 84 F0         [ 4] 4031         CALL     DOLIT
      0099F0 00 CD                 4032         .word     CALLL     ;CALL
      0099F2 CD 96 A2         [ 4] 4033         CALL     CCOMMA
      0099F5 CC 96 8B         [ 2] 4034         JP     COMMA
                                   4035 
                                   4036 ;       INIT-OFS ( -- )
                                   4037 ;       compute offset to adjust jump address 
                                   4038 ;       set variable OFFSET 
      0099F8 99 A1                 4039         .word LINK 
                           00197A  4040         LINK=.
      0099FA 08                    4041         .byte 8 
      0099FB 49 4E 49 54 2D 4F 46  4042         .ascii "INIT-OFS" 
             53
      009A03                       4043 INITOFS:
      009A03 CD 87 B0         [ 4] 4044         call TFLASH 
      009A06 CD 85 64         [ 4] 4045         CALL AT 
      009A09 CD 86 9A         [ 4] 4046         CALL DUPP 
      009A0C CD 85 19         [ 4] 4047         call QBRAN
      009A0F 9A 20                 4048         .word 1$
      001991                       4049         _DROP  
      009A11 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      009A14 CD 87 FF         [ 4] 4050         call CPP 
      009A17 CD 85 64         [ 4] 4051         call AT 
      009A1A CD 8D 69         [ 4] 4052         call HERE
      009A1D CD 89 53         [ 4] 4053         call SUBB 
      009A20 CD 88 34         [ 4] 4054 1$:     call OFFSET 
      009A23 CC 85 52         [ 2] 4055         jp STORE  
                                   4056 
                                   4057 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4058 ;       :       ( -- ; <string> )
                                   4059 ;       Start a new colon definition
                                   4060 ;       using next word as its name.
                                   4061 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0019A6                       4062         _HEADER COLON,1,":"
      009A26 99 FA                    1         .word LINK 
                           0019A8     2         LINK=.
      009A28 01                       3         .byte 1  
      009A29 3A                       4         .ascii ":"
      009A2A                          5         COLON:
      009A2A CD 9A 03         [ 4] 4063         call INITOFS       
      009A2D CD 93 47         [ 4] 4064         CALL   TOKEN
      009A30 CD 98 89         [ 4] 4065         CALL   SNAME
      009A33 CC 99 94         [ 2] 4066         JP     RBRAC
                                   4067 
                                   4068 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4069 ;       I:  ( -- )
                                   4070 ;       Start interrupt service 
                                   4071 ;       routine definition
                                   4072 ;       those definition have 
                                   4073 ;       no name.
                                   4074 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0019B6                       4075         _HEADER ICOLON,2,"I:"
      009A36 9A 28                    1         .word LINK 
                           0019B8     2         LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



      009A38 02                       3         .byte 2  
      009A39 49 3A                    4         .ascii "I:"
      009A3B                          5         ICOLON:
      009A3B CD 9A 03         [ 4] 4076         call INITOFS 
      009A3E CC 99 94         [ 2] 4077         jp RBRAC  
                                   4078 
                                   4079 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4080 ;       IMMEDIATE       ( -- )
                                   4081 ;       Make last compiled word
                                   4082 ;       an immediate word.
                                   4083 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0019C1                       4084         _HEADER IMMED,9,"IMMEDIATE"
      009A41 9A 38                    1         .word LINK 
                           0019C3     2         LINK=.
      009A43 09                       3         .byte 9  
      009A44 49 4D 4D 45 44 49 41     4         .ascii "IMMEDIATE"
             54 45
      009A4D                          5         IMMED:
      009A4D CD 84 F0         [ 4] 4085         CALL     DOLIT
      009A50 80 00                 4086         .word     0x8000	;  IMEDD*256
      009A52 CD 88 0F         [ 4] 4087         CALL     LAST
      009A55 CD 85 64         [ 4] 4088         CALL     AT
      009A58 CD 85 64         [ 4] 4089         CALL     AT
      009A5B CD 87 0B         [ 4] 4090         CALL     ORR
      009A5E CD 88 0F         [ 4] 4091         CALL     LAST
      009A61 CD 85 64         [ 4] 4092         CALL     AT
      009A64 CC 85 52         [ 2] 4093         JP     STORE
                                   4094 
                                   4095 ;; Defining words
                                   4096 
                                   4097 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4098 ;       CREATE  ( -- ; <string> )
                                   4099 ;       Compile a new array
                                   4100 ;       without allocating space.
                                   4101 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0019E7                       4102         _HEADER CREAT,6,"CREATE"
      009A67 9A 43                    1         .word LINK 
                           0019E9     2         LINK=.
      009A69 06                       3         .byte 6  
      009A6A 43 52 45 41 54 45        4         .ascii "CREATE"
      009A70                          5         CREAT:
      009A70 CD 93 47         [ 4] 4103         CALL     TOKEN
      009A73 CD 98 89         [ 4] 4104         CALL     SNAME
      009A76 CD 99 20         [ 4] 4105         CALL     OVERT        
      009A79 CD 96 D0         [ 4] 4106         CALL     COMPI 
      009A7C 87 50                 4107         .word DOVAR 
      009A7E 81               [ 4] 4108         RET
                                   4109 
                                   4110 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4111 ;       VARIABLE  ( -- ; <string> )
                                   4112 ;       Compile a new variable
                                   4113 ;       initialized to 0.
                                   4114 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0019FF                       4115         _HEADER VARIA,8,"VARIABLE"
      009A7F 9A 69                    1         .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



                           001A01     2         LINK=.
      009A81 08                       3         .byte 8  
      009A82 56 41 52 49 41 42 4C     4         .ascii "VARIABLE"
             45
      009A8A                          5         VARIA:
                                   4116 ; indirect variable so that VARIABLE definition can be compiled in FLASH 
      009A8A CD 8D 69         [ 4] 4117         CALL HERE
      009A8D CD 86 9A         [ 4] 4118         CALL DUPP 
      009A90 CD 8B F8         [ 4] 4119         CALL CELLP
      009A93 CD 87 F1         [ 4] 4120         CALL VPP 
      009A96 CD 85 52         [ 4] 4121         CALL STORE
      009A99 CD 9A 70         [ 4] 4122         CALL CREAT
      009A9C CD 86 9A         [ 4] 4123         CALL DUPP
      009A9F CD 96 8B         [ 4] 4124         CALL COMMA
      009AA2 CD 8C 8F         [ 4] 4125         CALL ZERO
      009AA5 CD 86 AA         [ 4] 4126         call SWAPP 
      009AA8 CD 85 52         [ 4] 4127         CALL STORE
      009AAB CD A3 E4         [ 4] 4128         CALL FMOVE ; move definition to FLASH
      009AAE CD 88 4D         [ 4] 4129         CALL QDUP 
      009AB1 CD 85 19         [ 4] 4130         CALL QBRAN 
      009AB4 9A BD                 4131         .word SET_RAMLAST   
      009AB6 CD 9E 8C         [ 4] 4132         call UPDATVP  ; don't update if variable kept in RAM.
      009AB9 CD A4 78         [ 4] 4133         CALL UPDATPTR
      009ABC 81               [ 4] 4134         RET         
      009ABD                       4135 SET_RAMLAST: 
      009ABD CD 88 0F         [ 4] 4136         CALL LAST 
      009AC0 CD 85 64         [ 4] 4137         CALL AT 
      009AC3 CD 88 22         [ 4] 4138         CALL RAMLAST 
      009AC6 CC 85 52         [ 2] 4139         JP STORE  
                                   4140 
                                   4141 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4142 ;       CONSTANT  ( n -- ; <string> )
                                   4143 ;       Compile a new constant 
                                   4144 ;       n CONSTANT name 
                                   4145 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001A49                       4146         _HEADER CONSTANT,8,"CONSTANT"
      009AC9 9A 81                    1         .word LINK 
                           001A4B     2         LINK=.
      009ACB 08                       3         .byte 8  
      009ACC 43 4F 4E 53 54 41 4E     4         .ascii "CONSTANT"
             54
      009AD4                          5         CONSTANT:
      009AD4 CD 93 47         [ 4] 4147         CALL TOKEN
      009AD7 CD 98 89         [ 4] 4148         CALL SNAME 
      009ADA CD 99 20         [ 4] 4149         CALL OVERT 
      009ADD CD 96 D0         [ 4] 4150         CALL COMPI 
      009AE0 9A F4                 4151         .word DOCONST
      009AE2 CD 96 8B         [ 4] 4152         CALL COMMA 
      009AE5 CD A3 E4         [ 4] 4153         CALL FMOVE
      009AE8 CD 88 4D         [ 4] 4154         CALL QDUP 
      009AEB CD 85 19         [ 4] 4155         CALL QBRAN 
      009AEE 9A BD                 4156         .word SET_RAMLAST  
      009AF0 CD A4 78         [ 4] 4157         CALL UPDATPTR  
      009AF3 81               [ 4] 4158 1$:     RET          
                                   4159 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



                                   4160 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4161 ; CONSTANT runtime semantic 
                                   4162 ; doCONST  ( -- n )
                                   4163 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4164 ;       _HEADER DOCONST,7,"DOCONST"
      009AF4                       4165 DOCONST:
      009AF4 1D 00 02         [ 2] 4166         subw x,#CELLL
      009AF7 90 85            [ 2] 4167         popw y 
      009AF9 90 FE            [ 2] 4168         ldw y,(y) 
      009AFB FF               [ 2] 4169         ldw (x),y 
      009AFC 81               [ 4] 4170         ret 
                                   4171 
                                   4172 ;----------------------------------
                                   4173 ; create double constant 
                                   4174 ; 2CONSTANT ( d -- ; <string> )
                                   4175 ;----------------------------------
      001A7D                       4176         _HEADER DCONST,9,"2CONSTANT"
      009AFD 9A CB                    1         .word LINK 
                           001A7F     2         LINK=.
      009AFF 09                       3         .byte 9  
      009B00 32 43 4F 4E 53 54 41     4         .ascii "2CONSTANT"
             4E 54
      009B09                          5         DCONST:
      009B09 CD 93 47         [ 4] 4177         CALL TOKEN
      009B0C CD 98 89         [ 4] 4178         CALL SNAME 
      009B0F CD 99 20         [ 4] 4179         CALL OVERT 
      009B12 CD 96 D0         [ 4] 4180         CALL COMPI 
      009B15 9B 2C                 4181         .word DO_DCONST
      009B17 CD 96 8B         [ 4] 4182         CALL COMMA
      009B1A CD 96 8B         [ 4] 4183         CALL COMMA  
      009B1D CD A3 E4         [ 4] 4184         CALL FMOVE
      009B20 CD 88 4D         [ 4] 4185         CALL QDUP 
      009B23 CD 85 19         [ 4] 4186         CALL QBRAN 
      009B26 9A BD                 4187         .word SET_RAMLAST  
      009B28 CD A4 78         [ 4] 4188         CALL UPDATPTR  
      009B2B 81               [ 4] 4189 1$:     RET          
                                   4190     
                                   4191 ;----------------------------------
                                   4192 ; runtime for DCONST 
                                   4193 ; stack double constant 
                                   4194 ; DO-DCONST ( -- d )
                                   4195 ;-----------------------------------
                                   4196 ;       _HEADER DO_DCONST,9,"DO-DCONST"
      009B2C                       4197 DO_DCONST:
      009B2C 90 85            [ 2] 4198     popw y 
      009B2E 90 BF 26         [ 2] 4199     ldw YTEMP,y 
      009B31 1D 00 04         [ 2] 4200     subw x,#2*CELLL 
      009B34 90 FE            [ 2] 4201     ldw y,(y)
      009B36 FF               [ 2] 4202     ldw (x),y 
      009B37 90 BE 26         [ 2] 4203     ldw y,YTEMP 
      009B3A 90 EE 02         [ 2] 4204     ldw y,(2,y)
      009B3D EF 02            [ 2] 4205     ldw (2,x),y 
      009B3F 81               [ 4] 4206     ret 
                                   4207 
                                   4208 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



                                   4209 ;;          TOOLS 
                                   4210 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4211 
                                   4212 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4213 ;       _TYPE   ( b u -- )
                                   4214 ;       Display a string. Filter
                                   4215 ;       non-printing characters.
                                   4216 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001AC0                       4217         _HEADER UTYPE,5,"_TYPE"
      009B40 9A FF                    1         .word LINK 
                           001AC2     2         LINK=.
      009B42 05                       3         .byte 5  
      009B43 5F 54 59 50 45           4         .ascii "_TYPE"
      009B48                          5         UTYPE:
      009B48 CD 86 63         [ 4] 4218         CALL     TOR     ;start count down loop
      009B4B 20 0F            [ 2] 4219         JRA     UTYP2   ;skip first pass
      009B4D CD 86 9A         [ 4] 4220 UTYP1:  CALL     DUPP
      009B50 CD 85 82         [ 4] 4221         CALL     CAT
      009B53 CD 8C B9         [ 4] 4222         CALL     TCHAR
      009B56 CD 84 B7         [ 4] 4223         CALL     EMIT    ;display only printable
      009B59 CD 8C 23         [ 4] 4224         CALL     ONEP    ;increment address
      009B5C CD 85 04         [ 4] 4225 UTYP2:  CALL     DONXT
      009B5F 9B 4D                 4226         .word      UTYP1   ;loop till done
      009B61 CC 86 90         [ 2] 4227         JP     DROP
                                   4228 
                                   4229 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4230 ;       dm+     ( a u -- a )
                                   4231 ;       Dump u bytes from ,
                                   4232 ;       leaving a+u on  stack.
                                   4233 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001AE4                       4234         _HEADER DUMPP,3,"DM+"
      009B64 9B 42                    1         .word LINK 
                           001AE6     2         LINK=.
      009B66 03                       3         .byte 3  
      009B67 44 4D 2B                 4         .ascii "DM+"
      009B6A                          5         DUMPP:
      009B6A CD 86 C2         [ 4] 4235         CALL     OVER
      009B6D CD 84 F0         [ 4] 4236         CALL     DOLIT
      009B70 00 04                 4237         .word      4
      009B72 CD 91 3E         [ 4] 4238         CALL     UDOTR   ;display address
      009B75 CD 90 A5         [ 4] 4239         CALL     SPACE
      009B78 CD 86 63         [ 4] 4240         CALL     TOR     ;start count down loop
      009B7B 20 11            [ 2] 4241         JRA     PDUM2   ;skip first pass
      009B7D CD 86 9A         [ 4] 4242 PDUM1:  CALL     DUPP
      009B80 CD 85 82         [ 4] 4243         CALL     CAT
      009B83 CD 84 F0         [ 4] 4244         CALL     DOLIT
      009B86 00 03                 4245         .word      3
      009B88 CD 91 3E         [ 4] 4246         CALL     UDOTR   ;display numeric data
      009B8B CD 8C 23         [ 4] 4247         CALL     ONEP    ;increment address
      009B8E CD 85 04         [ 4] 4248 PDUM2:  CALL     DONXT
      009B91 9B 7D                 4249         .word      PDUM1   ;loop till done
      009B93 81               [ 4] 4250         RET
                                   4251 
                                   4252 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4253 ;       DUMP    ( a u -- )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



                                   4254 ;       Dump u bytes from a,
                                   4255 ;       in a formatted manner.
                                   4256 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001B14                       4257         _HEADER DUMP,4,"DUMP"
      009B94 9B 66                    1         .word LINK 
                           001B16     2         LINK=.
      009B96 04                       3         .byte 4  
      009B97 44 55 4D 50              4         .ascii "DUMP"
      009B9B                          5         DUMP:
      009B9B CD 87 60         [ 4] 4258         CALL     BASE
      009B9E CD 85 64         [ 4] 4259         CALL     AT
      009BA1 CD 86 63         [ 4] 4260         CALL     TOR
      009BA4 CD 8F 32         [ 4] 4261         CALL     HEX     ;save radix, set hex
      009BA7 CD 84 F0         [ 4] 4262         CALL     DOLIT
      009BAA 00 10                 4263         .word      16
      009BAC CD 8B 49         [ 4] 4264         CALL     SLASH   ;change count to lines
      009BAF CD 86 63         [ 4] 4265         CALL     TOR     ;start count down loop
      009BB2 CD 90 E8         [ 4] 4266 DUMP1:  CALL     CR
      009BB5 CD 84 F0         [ 4] 4267         CALL     DOLIT
      009BB8 00 10                 4268         .word      16
      009BBA CD 88 A8         [ 4] 4269         CALL     DDUP
      009BBD CD 9B 6A         [ 4] 4270         CALL     DUMPP   ;display numeric
      009BC0 CD 88 5E         [ 4] 4271         CALL     ROT
      009BC3 CD 88 5E         [ 4] 4272         CALL     ROT
      009BC6 CD 90 A5         [ 4] 4273         CALL     SPACE
      009BC9 CD 90 A5         [ 4] 4274         CALL     SPACE
      009BCC CD 9B 48         [ 4] 4275         CALL     UTYPE   ;display printable characters
      009BCF CD 85 04         [ 4] 4276         CALL     DONXT
      009BD2 9B B2                 4277         .word      DUMP1   ;loop till done
      009BD4 CD 86 90         [ 4] 4278 DUMP3:  CALL     DROP
      009BD7 CD 85 B5         [ 4] 4279         CALL     RFROM
      009BDA CD 87 60         [ 4] 4280         CALL     BASE
      009BDD CC 85 52         [ 2] 4281         JP     STORE   ;restore radix
                                   4282 
                                   4283 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4284 ;       .S      ( ... -- ... )
                                   4285 ;        Display  contents of stack.
                                   4286 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001B60                       4287         _HEADER DOTS,2,".S"
      009BE0 9B 96                    1         .word LINK 
                           001B62     2         LINK=.
      009BE2 02                       3         .byte 2  
      009BE3 2E 53                    4         .ascii ".S"
      009BE5                          5         DOTS:
      009BE5 CD 90 E8         [ 4] 4288         CALL     CR
      009BE8 CD 8C D1         [ 4] 4289         CALL     DEPTH   ;stack depth
      009BEB CD 86 63         [ 4] 4290         CALL     TOR     ;start count down loop
      009BEE 20 09            [ 2] 4291         JRA     DOTS2   ;skip first pass
      009BF0 CD 85 C6         [ 4] 4292 DOTS1:  CALL     RAT
      009BF3 CD 8C E8         [ 4] 4293 	CALL     PICK
      009BF6 CD 91 8E         [ 4] 4294         CALL     DOT     ;index stack, display contents
      009BF9 CD 85 04         [ 4] 4295 DOTS2:  CALL     DONXT
      009BFC 9B F0                 4296         .word      DOTS1   ;loop till done
      009BFE CD 91 15         [ 4] 4297         CALL     DOTQP
      009C01 05                    4298         .byte      5
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



      009C02 20 3C 73 70 20        4299         .ascii     " <sp "
      009C07 81               [ 4] 4300         RET
                                   4301 
                                   4302 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4303 ;       >NAME   ( ca -- na | F )
                                   4304 ;       Convert code address
                                   4305 ;       to a name address.
                                   4306 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001B88                       4307         _HEADER TNAME,5,">NAME"
      009C08 9B E2                    1         .word LINK 
                           001B8A     2         LINK=.
      009C0A 05                       3         .byte 5  
      009C0B 3E 4E 41 4D 45           4         .ascii ">NAME"
      009C10                          5         TNAME:
      009C10 CD 87 E3         [ 4] 4308         CALL     CNTXT   ;vocabulary link
      009C13 CD 85 64         [ 4] 4309 TNAM2:  CALL     AT
      009C16 CD 86 9A         [ 4] 4310         CALL     DUPP    ;?last word in a vocabulary
      009C19 CD 85 19         [ 4] 4311         CALL     QBRAN
      009C1C 9C 37                 4312         .word      TNAM4
      009C1E CD 88 A8         [ 4] 4313         CALL     DDUP
      009C21 CD 93 55         [ 4] 4314         CALL     NAMET
      009C24 CD 87 20         [ 4] 4315         CALL     XORR    ;compare
      009C27 CD 85 19         [ 4] 4316         CALL     QBRAN
      009C2A 9C 31                 4317         .word      TNAM3
      009C2C CD 8C 07         [ 4] 4318         CALL     CELLM   ;continue with next word
      009C2F 20 E2            [ 2] 4319         JRA     TNAM2
      009C31 CD 86 AA         [ 4] 4320 TNAM3:  CALL     SWAPP
      009C34 CC 86 90         [ 2] 4321         JP     DROP
      009C37 CD 88 9D         [ 4] 4322 TNAM4:  CALL     DDROP
      009C3A CC 8C 8F         [ 2] 4323         JP     ZERO
                                   4324 
                                   4325 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4326 ;       .ID     ( na -- )
                                   4327 ;        Display  name at address.
                                   4328 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001BBD                       4329         _HEADER DOTID,3,".ID"
      009C3D 9C 0A                    1         .word LINK 
                           001BBF     2         LINK=.
      009C3F 03                       3         .byte 3  
      009C40 2E 49 44                 4         .ascii ".ID"
      009C43                          5         DOTID:
      009C43 CD 88 4D         [ 4] 4330         CALL     QDUP    ;if zero no name
      009C46 CD 85 19         [ 4] 4331         CALL     QBRAN
      009C49 9C 59                 4332         .word      DOTI1
      009C4B CD 8D 52         [ 4] 4333         CALL     COUNT
      009C4E CD 84 F0         [ 4] 4334         CALL     DOLIT
      009C51 00 1F                 4335         .word      0x1F
      009C53 CD 86 F7         [ 4] 4336         CALL     ANDD    ;mask lexicon bits
      009C56 CC 9B 48         [ 2] 4337         JP     UTYPE
      009C59 CD 91 15         [ 4] 4338 DOTI1:  CALL     DOTQP
      009C5C 09                    4339         .byte      9
      009C5D 20 6E 6F 4E 61 6D 65  4340         .ascii     " noName"
      009C64 81               [ 4] 4341         RET
                                   4342 
                           000000  4343 WANT_SEE=0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



                           000000  4344 .if WANT_SEE 
                                   4345 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4346 ;       SEE     ( -- ; <string> )
                                   4347 ;       A simple decompiler.
                                   4348 ;       Updated for byte machines.
                                   4349 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4350         _HEADER SEE,3,"SEE"
                                   4351         CALL     TICK    ;starting address
                                   4352         CALL     CR
                                   4353         CALL     ONEM
                                   4354 SEE1:   CALL     ONEP
                                   4355         CALL     DUPP
                                   4356         CALL     AT
                                   4357         CALL     DUPP
                                   4358         CALL     QBRAN
                                   4359         .word    SEE2
                                   4360         CALL     TNAME   ;?is it a name
                                   4361 SEE2:   CALL     QDUP    ;name address or zero
                                   4362         CALL     QBRAN
                                   4363         .word    SEE3
                                   4364         CALL     SPACE
                                   4365         CALL     DOTID   ;display name
                                   4366         CALL     ONEP
                                   4367         JRA      SEE4
                                   4368 SEE3:   CALL     DUPP
                                   4369         CALL     CAT
                                   4370         CALL     UDOT    ;display number
                                   4371 SEE4:   CALL     NUFQ    ;user control
                                   4372         CALL     QBRAN
                                   4373         .word    SEE1
                                   4374         JP     DROP
                                   4375 .endif ; WANT_SEE 
                                   4376 
                                   4377 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4378 ;       WORDS   ( -- )
                                   4379 ;       Display names in vocabulary.
                                   4380 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001BE5                       4381         _HEADER WORDS,5,"WORDS"
      009C65 9C 3F                    1         .word LINK 
                           001BE7     2         LINK=.
      009C67 05                       3         .byte 5  
      009C68 57 4F 52 44 53           4         .ascii "WORDS"
      009C6D                          5         WORDS:
      009C6D CD 90 E8         [ 4] 4382         CALL     CR
      009C70 CD 87 E3         [ 4] 4383         CALL     CNTXT   ;only in context
      009C73 CD 85 64         [ 4] 4384 WORS1:  CALL     AT
      009C76 CD 88 4D         [ 4] 4385         CALL     QDUP    ;?at end of list
      009C79 CD 85 19         [ 4] 4386         CALL     QBRAN
      009C7C 9C 8F                 4387         .word      WORS2
      009C7E CD 86 9A         [ 4] 4388         CALL     DUPP
      009C81 CD 90 A5         [ 4] 4389         CALL     SPACE
      009C84 CD 9C 43         [ 4] 4390         CALL     DOTID   ;display a name
      009C87 CD 8C 07         [ 4] 4391         CALL     CELLM
      009C8A CD 85 35         [ 4] 4392         CALL     BRAN
      009C8D 9C 73                 4393         .word      WORS1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



      009C8F 81               [ 4] 4394 WORS2:  RET
                                   4395 
                                   4396         
                                   4397 ;; Hardware reset
                                   4398 
                                   4399 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4400 ;  COPYRIGTH
                                   4401 ; print copyright notice 
                                   4402 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      009C90                       4403 COPYRIGHT:
      009C90 CD 91 15         [ 4] 4404     CALL DOTQP 
      009C93 21                    4405     .byte 33 
      009C94 4A 61 63 71 75 65 73  4406     .ascii "Jacques Deschenes, Copyright 2021"
             20 44 65 73 63 68 65
             6E 65 73 2C 20 43 6F
             70 79 72 69 67 68 74
             20 32 30 32 31
      009CB5 CC 90 E8         [ 2] 4407     JP CR 
                                   4408 
                                   4409 
                                   4410 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4411 ;  PRT_LICENCE 
                                   4412 ;  print GPLV2 licence 
                                   4413 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      009CB8                       4414 PRT_LICENCE:
      009CB8 CD 91 15         [ 4] 4415         CALL DOTQP 
      009CBB 0F                    4416         .byte  15 
      009CBC 4C 49 43 45 4E 43 45  4417         .ascii "LICENCE GPLV3\r\n"
             20 47 50 4C 56 33 0D
             0A
      009CCB 81               [ 4] 4418         RET 
                                   4419 
                                   4420 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4421 ;    PRINT_VERSION ( c1 c2 -- )
                                   4422 ;    c2 minor 
                                   4423 ;    c1 major 
                                   4424 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      009CCC                       4425 PRINT_VERSION:
      009CCC CD 91 15         [ 4] 4426      CALL DOTQP 
      009CCF 09                    4427      .byte 9
      009CD0 20 76 65 72 73 69 6F  4428      .ascii " version "
             6E 20
      009CD9 CD 8E 97         [ 4] 4429      CALL BDIGS 
      009CDC CD 8E D1         [ 4] 4430      CALL DIGS 
      009CDF CD 8E D1         [ 4] 4431      CALL DIGS 
      001C62                       4432      _DOLIT '.' 
      009CE2 CD 84 F0         [ 4]    1     CALL DOLIT 
      009CE5 00 2E                    2     .word '.' 
      009CE7 CD 8E A7         [ 4] 4433      CALL HOLD 
      001C6A                       4434      _DROP 
      009CEA 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      009CED CD 8E D1         [ 4] 4435      CALL DIGS 
      009CF0 CD 8E FC         [ 4] 4436      CALL EDIGS 
      009CF3 CC 90 CF         [ 2] 4437      JP TYPES 
                                   4438       
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



                                   4439 
                                   4440 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4441 ;       hi      ( -- )
                                   4442 ;       Display sign-on message.
                                   4443 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001C76                       4444         _HEADER HI,2,"HI"
      009CF6 9C 67                    1         .word LINK 
                           001C78     2         LINK=.
      009CF8 02                       3         .byte 2  
      009CF9 48 49                    4         .ascii "HI"
      009CFB                          5         HI:
      009CFB CD 90 E8         [ 4] 4445         CALL     CR
      009CFE CD 91 15         [ 4] 4446         CALL     DOTQP   
      009D01 0A                    4447         .byte      10
      009D02 73 74 6D 38 65 46 6F  4448         .ascii     "stm8eForth"
             72 74 68
      001C8C                       4449 	_DOLIT VER 
      009D0C CD 84 F0         [ 4]    1     CALL DOLIT 
      009D0F 00 04                    2     .word VER 
      001C91                       4450         _DOLIT EXT 
      009D11 CD 84 F0         [ 4]    1     CALL DOLIT 
      009D14 00 00                    2     .word EXT 
      009D16 CD 9C CC         [ 4] 4451         CALL PRINT_VERSION 
      009D19 CD 91 15         [ 4] 4452         CALL    DOTQP
                           000001  4453 .if NUCLEO          
      009D1C 12                    4454         .byte 18
      009D1D 20 6F 6E 20 4E 55 43  4455         .ascii  " on NUCLEO-8S208RB"
             4C 45 4F 2D 38 53 32
             30 38 52 42
                                   4456 .endif
                           000000  4457 .if DISCOVERY
                                   4458         .byte 19
                                   4459         .ascii  " on STM8S-DISCOVERY"
                                   4460 .endif
                           000000  4461 .if DOORBELL
                                   4462         .byte 16
                                   4463         .ascii " on stm8s105k6b6"
                                   4464 .endif
      009D2F CC 90 E8         [ 2] 4465         JP     CR
                                   4466 
                           000000  4467 WANT_DEBUG=0
                           000000  4468 .if WANT_DEBUG 
                                   4469 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4470 ;       DEBUG      ( -- )
                                   4471 ;       Display sign-on message.
                                   4472 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4473         _HEADER DEBUG,5,"DEBUG"
                                   4474 	CALL DOLIT
                                   4475 	.word 0x65
                                   4476 	CALL EMIT
                                   4477 	CALL ZERO
                                   4478  	CALL ZLESS 
                                   4479 	CALL DOLIT
                                   4480 	.word 0xFFFE
                                   4481 	CALL ZLESS 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



                                   4482 	CALL UPLUS 
                                   4483  	_DROP 
                                   4484 	CALL DOLIT
                                   4485 	.word 3
                                   4486 	CALL UPLUS 
                                   4487 	CALL UPLUS 
                                   4488  	_DROP
                                   4489 	CALL DOLIT
                                   4490 	.word 0x43
                                   4491 	CALL UPLUS 
                                   4492  	_DROP
                                   4493 	CALL EMIT
                                   4494 	CALL DOLIT
                                   4495 	.word 0x4F
                                   4496 	CALL DOLIT
                                   4497 	.word 0x6F
                                   4498  	CALL XORR
                                   4499 	CALL DOLIT
                                   4500 	.word 0xF0
                                   4501  	CALL ANDD
                                   4502 	CALL DOLIT
                                   4503 	.word 0x4F
                                   4504  	CALL ORR
                                   4505 	CALL EMIT
                                   4506 	CALL DOLIT
                                   4507 	.word 8
                                   4508 	CALL DOLIT
                                   4509 	.word 6
                                   4510  	CALL SWAPP
                                   4511 	CALL OVER
                                   4512 	CALL XORR
                                   4513 	CALL DOLIT
                                   4514 	.word 3
                                   4515 	CALL ANDD 
                                   4516 	CALL ANDD
                                   4517 	CALL DOLIT
                                   4518 	.word 0x70
                                   4519 	CALL UPLUS 
                                   4520 	_DROP
                                   4521 	CALL EMIT
                                   4522 	CALL ZERO
                                   4523 	CALL QBRAN
                                   4524 	.word DEBUG1
                                   4525 	CALL DOLIT
                                   4526 	.word 0x3F
                                   4527 DEBUG1:
                                   4528 	CALL DOLIT
                                   4529 	.word 0xFFFF
                                   4530 	CALL QBRAN
                                   4531 	.word DEBUG2
                                   4532 	CALL DOLIT
                                   4533 	.word 0x74
                                   4534 	CALL BRAN
                                   4535 	.word DEBUG3
                                   4536 DEBUG2:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



                                   4537 	CALL DOLIT
                                   4538 	.word 0x21
                                   4539 DEBUG3:
                                   4540 	CALL EMIT
                                   4541 	CALL DOLIT
                                   4542 	.word 0x68
                                   4543 	CALL DOLIT
                                   4544 	.word 0x80
                                   4545 	CALL STORE
                                   4546 	CALL DOLIT
                                   4547 	.word 0x80
                                   4548 	CALL AT
                                   4549 	CALL EMIT
                                   4550 	CALL DOLIT
                                   4551 	.word 0x4D
                                   4552 	CALL TOR
                                   4553 	CALL RAT
                                   4554 	CALL RFROM
                                   4555 	CALL ANDD
                                   4556 	CALL EMIT
                                   4557 	CALL DOLIT
                                   4558 	.word 0x61
                                   4559 	CALL DOLIT
                                   4560 	.word 0xA
                                   4561 	CALL TOR
                                   4562 DEBUG4:
                                   4563 	CALL ONE
                                   4564 	CALL UPLUS 
                                   4565 	_DROP
                                   4566 	CALL DONXT
                                   4567 	.word DEBUG4
                                   4568 	CALL EMIT
                                   4569 	CALL DOLIT
                                   4570 	.word 0x656D
                                   4571 	CALL DOLIT
                                   4572 	.word 0x100
                                   4573 	CALL UMSTA
                                   4574 	CALL SWAPP
                                   4575 	CALL DOLIT
                                   4576 	.word 0x100
                                   4577 	CALL UMSTA
                                   4578 	CALL SWAPP 
                                   4579 	_DROP
                                   4580 	CALL EMIT
                                   4581 	CALL EMIT
                                   4582 	CALL DOLIT
                                   4583 	.word 0x2043
                                   4584 	CALL ZERO
                                   4585 	CALL DOLIT
                                   4586 	.word 0x100
                                   4587 	CALL UMMOD
                                   4588 	CALL EMIT
                                   4589 	CALL EMIT
                                   4590 	;JP ORIG
                                   4591 	RET
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



                                   4592 .endif ; WANT_DEBUG 
                                   4593 
                                   4594 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4595 ;       'BOOT   ( -- a )
                                   4596 ;       The application startup vector.
                                   4597 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001CB2                       4598         _HEADER TBOOT,5,"'BOOT"
      009D32 9C F8                    1         .word LINK 
                           001CB4     2         LINK=.
      009D34 05                       3         .byte 5  
      009D35 27 42 4F 4F 54           4         .ascii "'BOOT"
      009D3A                          5         TBOOT:
      009D3A CD 87 50         [ 4] 4599         CALL     DOVAR
      009D3D 40 02                 4600         .word    APP_RUN      ;application to boot
                                   4601 
                                   4602 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4603 ;       COLD    ( -- )
                                   4604 ;       The hilevel cold start s=ence.
                                   4605 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001CBF                       4606         _HEADER COLD,4,"COLD"
      009D3F 9D 34                    1         .word LINK 
                           001CC1     2         LINK=.
      009D41 04                       3         .byte 4  
      009D42 43 4F 4C 44              4         .ascii "COLD"
      009D46                          5         COLD:
                           000000  4607 .if WANT_DEBUG
                                   4608         CALL DEBUG
                                   4609 .endif ; WANT_DEBUG
      009D46 CD 84 F0         [ 4] 4610 COLD1:  CALL     DOLIT
      009D49 80 AB                 4611         .word      UZERO
      009D4B CD 84 F0         [ 4] 4612 	CALL     DOLIT
      009D4E 00 06                 4613         .word      UPP
      009D50 CD 84 F0         [ 4] 4614         CALL     DOLIT
      009D53 00 1C                 4615 	.word      UEND-UZERO
      009D55 CD 8D B6         [ 4] 4616         CALL     CMOVE   ;initialize user area
                           000001  4617 .if WANT_FLOAT + WANT_FLOAT24 
      009D58 CD A6 35         [ 4] 4618         CALL    FINIT 
                                   4619 .endif 
                                   4620 ; if APP_RUN==0 initialize with ca de 'hi'  
      009D5B 90 CE 40 02      [ 2] 4621         ldw y,APP_RUN 
      009D5F 26 0B            [ 1] 4622         jrne 0$
      009D61 1D 00 02         [ 2] 4623         subw x,#CELLL 
      009D64 90 AE 9C FB      [ 2] 4624         ldw y,#HI  
      009D68 FF               [ 2] 4625         ldw (x),y
      009D69 CD 9E 64         [ 4] 4626         call UPDATRUN 
      009D6C                       4627 0$:        
                                   4628 ; update LAST with APP_LAST 
                                   4629 ; if APP_LAST > LAST else do the opposite
      009D6C 90 CE 40 00      [ 2] 4630         ldw y,APP_LAST 
      009D70 90 B3 1C         [ 2] 4631         cpw y,ULAST 
      009D73 22 05            [ 1] 4632         jrugt 1$ 
                                   4633 ; save LAST at APP_LAST  
      009D75 CD 9E 4C         [ 4] 4634         call UPDATLAST 
      009D78 20 06            [ 2] 4635         jra 2$
      009D7A                       4636 1$: ; update LAST with APP_LAST 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]



      009D7A 90 BF 1C         [ 2] 4637         ldw ULAST,y
      009D7D 90 BF 16         [ 2] 4638         ldw UCNTXT,y
      009D80                       4639 2$:  
                                   4640 ; update APP_CP if < app_space 
      009D80 90 CE 40 04      [ 2] 4641         ldw y,APP_CP  
      009D84 90 B3 1A         [ 2] 4642         cpw y,UCP   
      009D87 24 06            [ 1] 4643         jruge 3$ 
      009D89 CD 9E 75         [ 4] 4644         call UPDATCP
      009D8C 90 BE 1A         [ 2] 4645         ldw y,UCP   
      009D8F                       4646 3$:
      009D8F 90 BF 1A         [ 2] 4647         ldw UCP,y                 
                                   4648 ; update UVP with APP_VP  
                                   4649 ; if APP_VP>UVP else do the opposite 
      009D92 90 CE 40 06      [ 2] 4650         ldw y,APP_VP 
      009D96 90 B3 18         [ 2] 4651         cpw y,UVP 
      009D99 22 05            [ 1] 4652         jrugt 4$
      009D9B CD 9E 8C         [ 4] 4653         call UPDATVP 
      009D9E 20 03            [ 2] 4654         jra 6$
      009DA0                       4655 4$: ; update UVP with APP_VP 
      009DA0 90 BF 18         [ 2] 4656         ldw UVP,y 
      009DA3                       4657 6$:      
      009DA3 CD 96 35         [ 4] 4658         CALL     PRESE   ;initialize data stack and TIB
      009DA6 CD 9D 3A         [ 4] 4659         CALL     TBOOT
      009DA9 CD 8D 9F         [ 4] 4660         CALL     ATEXE   ;application boot
      009DAC CD 99 20         [ 4] 4661         CALL     OVERT
      009DAF CC 96 52         [ 2] 4662         JP     QUIT    ;start interpretation
                                   4663 
                                   4664 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]



                                   4665         .include "flash.asm"
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
      009DB2 9D 41                   31     .word LINK 
                           001D34    32     LINK=.
      009DB4 03                      33     .byte 3 
      009DB5 46 50 21                34     .ascii "FP!"
      009DB8                         35 FPSTOR:
      009DB8 90 93            [ 1]   36     ldw y,x
      009DBA 90 FE            [ 2]   37     ldw y,(y)
      009DBC 90 9F            [ 1]   38     ld a,yl 
      009DBE B7 34            [ 1]   39     ld FPTR,a 
      009DC0 1C 00 02         [ 2]   40     addw x,#CELLL 
      009DC3 90 93            [ 1]   41     ldw y,x 
      009DC5 90 FE            [ 2]   42     ldw y,(y)
      009DC7 90 BF 35         [ 2]   43     ldw PTR16,y
      009DCA 1C 00 02         [ 2]   44     addw x,#CELLL 
      009DCD 81               [ 4]   45     ret 
                                     46 
                                     47 ;-----------------------------------
                                     48 ; return EEPROM base address 
                                     49 ; as a double 
                                     50 ;  EEPROM  ( -- ud )
                                     51 ;-----------------------------------
      009DCE 9D B4                   52     .word LINK 
                           001D50    53 LINK=.
      009DD0 06                      54     .byte 6 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]



      009DD1 45 45 50 52 4F 4D       55     .ascii "EEPROM"
      009DD7                         56 EEPROM: 
      009DD7 90 AE 40 00      [ 2]   57     ldw y,#EEPROM_BASE
      009DDB 1D 00 04         [ 2]   58     subw x,#2*CELLL 
      009DDE EF 02            [ 2]   59     ldw (2,x),y 
      009DE0 90 5F            [ 1]   60     clrw y 
      009DE2 FF               [ 2]   61     ldw (x),y 
      009DE3 81               [ 4]   62     ret
                                     63 
                                     64 ;---------------------------------
                                     65 ; return APP_LAST pointer as double
                                     66 ; EEP-LAST ( -- ud )
                                     67 ;---------------------------------
      009DE4 9D D0                   68 	.word LINK 
                           001D66    69 	LINK=.
      009DE6 08                      70 	.byte 8 
      009DE7 45 45 50 2D 4C 41 53    71 	.ascii "EEP-LAST"
             54
      009DEF                         72 EEPLAST:
      009DEF 1D 00 04         [ 2]   73 	subw x,#2*CELLL 
      009DF2 90 AE 40 00      [ 2]   74 	ldw y,#APP_LAST 
      009DF6 EF 02            [ 2]   75 	ldw (2,x),y 
      009DF8 90 5F            [ 1]   76 	clrw y 
      009DFA FF               [ 2]   77 	ldw (x),y 
      009DFB 81               [ 4]   78 	ret 
                                     79 
                                     80 ;----------------------------------
                                     81 ; return APP_RUN pointer as double	
                                     82 ; EEP-RUN ( -- ud )
                                     83 ;-----------------------------------
      009DFC 9D E6                   84 	.word LINK 
                           001D7E    85 	LINK=.
      009DFE 07                      86 	.byte 7
      009DFF 45 45 50 2D 52 55 4E    87 	.ascii "EEP-RUN"
      009E06                         88 EEPRUN:
      009E06 1D 00 04         [ 2]   89 	subw x,#2*CELLL 
      009E09 90 AE 40 02      [ 2]   90 	ldw y,#APP_RUN 
      009E0D EF 02            [ 2]   91 	ldw (2,x),y 
      009E0F 90 5F            [ 1]   92 	clrw y 
      009E11 FF               [ 2]   93 	ldw (x),y 
      009E12 81               [ 4]   94 	ret 
                                     95 
                                     96 ;------------------------------------
                                     97 ; return APP_CP pointer as double 
                                     98 ; EEP-CP ( -- ud )
                                     99 ;------------------------------------
      009E13 9D FE                  100 	.word LINK
                           001D95   101 	LINK=.
      009E15 06                     102 	.byte 6 
      009E16 45 45 50 2D 43 50      103 	.ascii "EEP-CP"
      009E1C                        104 EEPCP:
      009E1C 1D 00 04         [ 2]  105 	subw x,#2*CELLL 
      009E1F 90 AE 40 04      [ 2]  106 	ldw y,#APP_CP  
      009E23 EF 02            [ 2]  107 	ldw (2,x),y 
      009E25 90 5F            [ 1]  108 	clrw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]



      009E27 FF               [ 2]  109 	ldw (x),y 
      009E28 81               [ 4]  110 	ret 
                                    111 
                                    112 ;------------------------------------
                                    113 ; return APP_VP pointer as double 
                                    114 ; EEP-VP ( -- ud )
                                    115 ;-------------------------------------
      009E29 9E 15                  116 	.word LINK
                           001DAB   117 	LINK=.
      009E2B 06                     118 	.byte 6
      009E2C 45 45 50 2D 56 50      119 	.ascii "EEP-VP"
      009E32                        120 EEPVP:
      009E32 1D 00 04         [ 2]  121 	subw x,#2*CELLL 
      009E35 90 AE 40 06      [ 2]  122 	ldw y,#APP_VP  
      009E39 EF 02            [ 2]  123 	ldw (2,x),y 
      009E3B 90 5F            [ 1]  124 	clrw y 
      009E3D FF               [ 2]  125 	ldw (x),y 
      009E3E 81               [ 4]  126 	ret 
                                    127 
                                    128 ;----------------------------------
                                    129 ; update APP_LAST with LAST 
                                    130 ; UPDAT-LAST ( -- )
                                    131 ;----------------------------------
      009E3F 9E 2B                  132 	.word LINK 
                           001DC1   133 	LINK=.
      009E41 0A                     134 	.byte 10
      009E42 55 50 44 41 54 2D 4C   135 	.ascii "UPDAT-LAST"
             41 53 54
      009E4C                        136 UPDATLAST:
      009E4C CD 88 0F         [ 4]  137 	call LAST
      009E4F CD 85 64         [ 4]  138 	call AT  
      009E52 CD 9D EF         [ 4]  139 	call EEPLAST
      009E55 CC A0 42         [ 2]  140 	jp EESTORE 
                                    141 
                                    142 ;---------------------------------
                                    143 ; update APP_RUN 
                                    144 ; UPDAT-RUN ( a -- )
                                    145 ;---------------------------------
      009E58 9E 41                  146 	.word LINK
                           001DDA   147 	LINK=.
      009E5A 09                     148 	.byte 9
      009E5B 55 50 44 41 54 2D 52   149 	.ascii "UPDAT-RUN"
             55 4E
      009E64                        150 UPDATRUN:
      009E64 CD 9E 06         [ 4]  151 	call EEPRUN
      009E67 CC A0 42         [ 2]  152 	jp EESTORE 
                                    153 	
                                    154 ;---------------------------------
                                    155 ; update APP_CP with CP 
                                    156 ; UPDAT-CP ( -- )
                                    157 ;---------------------------------
      009E6A 9E 5A                  158 	.word LINK 
                           001DEC   159 	LINK=.
      009E6C 08                     160 	.byte 8 
      009E6D 55 50 44 41 54 2D 43   161 	.ascii "UPDAT-CP"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal  50-Bits]



             50
      009E75                        162 UPDATCP:
      009E75 CD 87 FF         [ 4]  163 	call CPP 
      009E78 CD 85 64         [ 4]  164 	call AT 
      009E7B CD 9E 1C         [ 4]  165 	call EEPCP 
      009E7E CC A0 42         [ 2]  166 	jp EESTORE 
                                    167 
                                    168 ;----------------------------------
                                    169 ; update APP_VP with VP 
                                    170 ; UPDAT-VP ( -- )
                                    171 ;----------------------------------
      009E81 9E 6C                  172 	.word LINK
                           001E03   173 	LINK=.
      009E83 08                     174 	.byte 8 
      009E84 55 50 44 41 54 2D 56   175 	.ascii "UPDAT-VP" 
             50
      009E8C                        176 UPDATVP:
      009E8C CD 87 F1         [ 4]  177 	call VPP 
      009E8F CD 85 64         [ 4]  178 	call AT
      009E92 CD 9E 32         [ 4]  179 	call EEPVP 
      009E95 CC A0 42         [ 2]  180 	jp EESTORE
                                    181 	
                           000001   182 .if NUCLEO
                                    183 ;----------------------------------
                                    184 ; fetch integer at address over 65535
                                    185 ;  F@   ( ud -- n )
                                    186 ;----------------------------------
      009E98 9E 83                  187     .word LINK 
                           001E1A   188 LINK=.
      009E9A 02                     189     .byte 2
      009E9B 46 40                  190     .ascii "F@"
      009E9D                        191 FARAT:
      009E9D CD 9D B8         [ 4]  192     call FPSTOR
      009EA0 CC 9F 65         [ 2]  193 	jp EE_READ 
                                    194 
                                    195 
                                    196 ;-------------------------------------
                                    197 ; fetch C at address over 65535 
                                    198 ; FC@ ( ud -- c)
                                    199 ;-------------------------------------
      009EA3 9E 9A                  200     .word LINK
                           001E25   201     LINK=.
      009EA5 03                     202     .byte 3 
      009EA6 46 43 40               203     .ascii "FC@" 
      009EA9                        204 FARCAT:
      009EA9 CD 9D B8         [ 4]  205     call FPSTOR
      009EAC CC 9F 87         [ 2]  206 	jp EE_CREAD  
                                    207 .endif ; NUCLEO 
                                    208 
                                    209 ;----------------------------------
                                    210 ; UNLOCK EEPROM/OPT for writing/erasing
                                    211 ; wait endlessly for FLASH_IAPSR_DUL bit.
                                    212 ;  UNLKEE   ( -- )
                                    213 ;----------------------------------
      009EAF 9E A5                  214     .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
Hexadecimal [24-Bits]



                           001E31   215 LINK=.
      009EB1 06                     216     .byte 6 
      009EB2 55 4E 4C 4B 45 45      217     .ascii "UNLKEE"
      009EB8                        218 UNLKEE:
      009EB8 35 00 50 5B      [ 1]  219 	mov FLASH_CR2,#0 
      009EBC 35 FF 50 5C      [ 1]  220 	mov FLASH_NCR2,#0xFF 
      009EC0 35 AE 50 64      [ 1]  221 	mov FLASH_DUKR,#FLASH_DUKR_KEY1
      009EC4 35 56 50 64      [ 1]  222     mov FLASH_DUKR,#FLASH_DUKR_KEY2
      009EC8 72 07 50 5F FB   [ 2]  223 	btjf FLASH_IAPSR,#FLASH_IAPSR_DUL,.
      009ECD 81               [ 4]  224 	ret
                                    225 
                                    226 ;----------------------------------
                                    227 ; UNLOCK FLASH for writing/erasing
                                    228 ; wait endlessly for FLASH_IAPSR_PUL bit.
                                    229 ; UNLKFL  ( -- )
                                    230 ;----------------------------------
      009ECE 9E B1                  231     .word LINK 
                           001E50   232 LINK=. 
      009ED0 06                     233     .byte 6 
      009ED1 55 4E 4C 4B 46 4C      234     .ascii "UNLKFL"    
      009ED7                        235 UNLKFL:
      009ED7 35 00 50 5B      [ 1]  236 	mov FLASH_CR2,#0 
      009EDB 35 FF 50 5C      [ 1]  237 	mov FLASH_NCR2,#0xFF 
      009EDF 35 56 50 62      [ 1]  238 	mov FLASH_PUKR,#FLASH_PUKR_KEY1
      009EE3 35 AE 50 62      [ 1]  239 	mov FLASH_PUKR,#FLASH_PUKR_KEY2
      009EE7 72 03 50 5F FB   [ 2]  240 	btjf FLASH_IAPSR,#FLASH_IAPSR_PUL,.
      009EEC 81               [ 4]  241 	ret
                                    242 
                                    243 ;-----------------------------
                                    244 ; UNLOCK FLASH or EEPROM 
                                    245 ; according to FPTR address 
                                    246 ;  UNLOCK ( -- )
                                    247 ;-----------------------------
      009EED 9E D0                  248 	.word LINK 
                           001E6F   249 	LINK=.
      009EEF 06                     250 	.byte 6
      009EF0 55 4E 4C 4F 43 4B      251 	.ascii "UNLOCK"
      009EF6                        252 UNLOCK:
                                    253 ; put addr[15:0] in Y, for bounds check.
      009EF6 90 BE 35         [ 2]  254 	ldw y,PTR16   ; Y=addr15:0
                                    255 ; check addr[23:16], if <> 0 then it is extened flash memory
      009EF9 3D 34            [ 1]  256 	tnz FPTR 
      009EFB 26 16            [ 1]  257 	jrne 4$
      009EFD 90 A3 80 00      [ 2]  258     cpw y,#FLASH_BASE
      009F01 24 10            [ 1]  259     jruge 4$
      009F03 90 A3 40 00      [ 2]  260 	cpw y,#EEPROM_BASE  
      009F07 25 0D            [ 1]  261     jrult 9$
      009F09 90 A3 48 7F      [ 2]  262 	cpw y,#OPTION_END 
      009F0D 22 07            [ 1]  263 	jrugt 9$
      009F0F CD 9E B8         [ 4]  264 	call UNLKEE
      009F12 81               [ 4]  265 	ret 
      009F13 CD 9E D7         [ 4]  266 4$: call UNLKFL
      009F16 81               [ 4]  267 9$: ret 
                                    268 
                                    269 ;-------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
Hexadecimal [24-Bits]



                                    270 ; LOCK write access to 
                                    271 ; FLASH and EEPROM 
                                    272 ; LOCK ( -- )
                                    273 ;-------------------------
      009F17 9E EF                  274 	.word LINK 
                           001E99   275 	LINK=.
      009F19 04                     276 	.byte 4 
      009F1A 4C 4F 43 4B            277 	.ascii "LOCK" 
      009F1E                        278 LOCK: 
      009F1E 72 13 50 5F      [ 1]  279 	bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      009F22 72 17 50 5F      [ 1]  280 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      009F26 81               [ 4]  281 	ret 
                                    282 
                                    283 ;-------------------------
                                    284 ; increment FPTR 
                                    285 ; INC-FPTR ( -- )
                                    286 ;-------------------------
      009F27 9F 19                  287 	.word LINK 
                           001EA9   288 	LINK=. 
      009F29 08                     289 	.byte 8 
      009F2A 49 4E 43 2D 46 50 54   290 	.ascii "INC-FPTR" 
             52
      009F32                        291 INC_FPTR:
      009F32 3C 36            [ 1]  292 	inc PTR8 
      009F34 26 0C            [ 1]  293 	jrne 1$
      009F36 90 89            [ 2]  294 	pushw y 
      009F38 90 BE 34         [ 2]  295 	ldw y,FPTR 
      009F3B 90 5C            [ 1]  296 	incw y 
      009F3D 90 BF 34         [ 2]  297 	ldw FPTR,y
      009F40 90 85            [ 2]  298 	popw y  
      009F42 81               [ 4]  299 1$: ret 
                                    300 
                                    301 ;------------------------------
                                    302 ; add u to FPTR 
                                    303 ; PTR+ ( u -- )
                                    304 ;------------------------------
      009F43 9F 29                  305 	.word LINK 
                           001EC5   306 	LINK=.
      009F45 04                     307 	.byte 4 
      009F46 50 54 52 2B            308 	.ascii "PTR+"
      009F4A                        309 PTRPLUS:
      009F4A 90 93            [ 1]  310 	ldw y,x 
      009F4C 1C 00 02         [ 2]  311 	addw x,#CELLL 
      009F4F 72 B9 00 35      [ 2]  312 	addw y,PTR16 
      009F53 90 BF 35         [ 2]  313 	ldw PTR16,y  
      009F56 24 02            [ 1]  314 	jrnc 1$
      009F58 3C 34            [ 1]  315 	inc FPTR 
      009F5A 81               [ 4]  316 1$: ret 
                                    317 
                                    318 ;---------------------------------
                                    319 ; read word at address pointed FPTR
                                    320 ; increment FPTR 
                                    321 ; EE-READ ( -- w )
                                    322 ;------------------------------------
      009F5B 9F 45                  323 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]



                           001EDD   324 	LINK=.
      009F5D 07                     325 	.byte 7 
      009F5E 45 45 2D 52 45 41 44   326 	.ascii "EE-READ"
      009F65                        327 EE_READ:
      009F65 1D 00 02         [ 2]  328 	subw x,#CELLL 
      009F68 92 BC 00 34      [ 5]  329 	ldf a,[FPTR]
      009F6C 90 95            [ 1]  330 	ld yh,a 
      009F6E CD 9F 32         [ 4]  331 	call INC_FPTR 
      009F71 92 BC 00 34      [ 5]  332 	ldf a,[FPTR]
      009F75 CD 9F 32         [ 4]  333 	call INC_FPTR 
      009F78 90 97            [ 1]  334 	ld yl,a 
      009F7A FF               [ 2]  335 	ldw (x),y 
      009F7B 81               [ 4]  336 	ret 
                                    337 
                                    338 ;---------------------------------------
                                    339 ; Read byte at address pointed by FPTR 
                                    340 ; EE-CREAD ( -- c )
                                    341 ;---------------------------------------
      009F7C 9F 5D                  342 	.word LINK 
                           001EFE   343 	LINK=.
      009F7E 08                     344 	.byte 8
      009F7F 45 45 2D 43 52 45 41   345 	.ascii "EE-CREAD" 
             44
      009F87                        346 EE_CREAD:
      009F87 1D 00 02         [ 2]  347 	subw x,#CELLL 
      009F8A 92 BC 00 34      [ 5]  348 	ldf a,[FPTR]	
      009F8E CD 9F 32         [ 4]  349 	call INC_FPTR
      009F91 90 5F            [ 1]  350 	clrw y 
      009F93 90 97            [ 1]  351 	ld yl,a 
      009F95 FF               [ 2]  352 	ldw (x),y 
      009F96 81               [ 4]  353 	ret 
                                    354 
                                    355 ;----------------------------
                                    356 ; write a byte at address pointed 
                                    357 ; by FPTR and increment FPTR.
                                    358 ; Expect pointer already initialized 
                                    359 ; and memory unlocked 
                                    360 ; WR-BYTE ( c -- )
                                    361 ;----------------------------
      009F97 9F 7E                  362 	.word LINK 
                           001F19   363 	LINK=. 
      009F99 07                     364 	.byte 7 
      009F9A 57 52 2D 42 59 54 45   365 	.ascii "WR-BYTE" 
                                    366 
      009FA1                        367 WR_BYTE:
      009FA1 CD 84 E4         [ 4]  368 	call FC_XOFF
      009FA4 90 93            [ 1]  369 	ldw y,x 
      009FA6 90 FE            [ 2]  370 	ldw y,(y)
      009FA8 1C 00 02         [ 2]  371 	addw x,#CELLL 
      009FAB 90 9F            [ 1]  372 	ld a,yl
      009FAD 92 BD 00 34      [ 4]  373 	ldf [FPTR],a
      009FB1 72 05 50 5F FB   [ 2]  374 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009FB6 CD 84 CE         [ 4]  375 	call FC_XON
      009FB9 CC 9F 32         [ 2]  376 	jp INC_FPTR 
                                    377 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]



                                    378 ;---------------------------------------
                                    379 ; write a word at address pointed 
                                    380 ; by FPTR and increment FPTR 
                                    381 ; Expect pointer already initialzed 
                                    382 ; and memory unlocked 
                                    383 ; WR-WORD ( w -- )
                                    384 ;---------------------------------------
      009FBC 9F 99                  385 	.word LINK 
                           001F3E   386 	LINK=.
      009FBE 07                     387 	.byte 7 
      009FBF 57 52 2D 57 4F 52 44   388 	.ascii "WR-WORD" 
      009FC6                        389 WR_WORD:
      009FC6 CD 84 E4         [ 4]  390 	call FC_XOFF
      009FC9 90 93            [ 1]  391 	ldw y,x
      009FCB 90 FE            [ 2]  392 	ldw y,(y)
      009FCD 1C 00 02         [ 2]  393 	addw x,#CELLL 
      009FD0 90 9E            [ 1]  394 	ld a,yh 
      009FD2 92 BD 00 34      [ 4]  395 	ldf [FPTR],a
      009FD6 72 05 50 5F FB   [ 2]  396 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009FDB CD 9F 32         [ 4]  397 	call INC_FPTR 
      009FDE 90 9F            [ 1]  398 	ld a,yl 
      009FE0 92 BD 00 34      [ 4]  399 	ldf [FPTR],a
      009FE4 72 05 50 5F FB   [ 2]  400 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009FE9 CD 84 CE         [ 4]  401 	call FC_XON
      009FEC CC 9F 32         [ 2]  402 	jp INC_FPTR 
                                    403 
                                    404 
                                    405 ;---------------------------------------
                                    406 ; write a byte to FLASH or EEPROM/OPTION  
                                    407 ; EEC!  (c ud -- )
                                    408 ;---------------------------------------
      009FEF 9F BE                  409     .word LINK 
                           001F71   410 	LINK=.
      009FF1 04                     411     .byte 4 
      009FF2 45 45 43 21            412     .ascii "EEC!"
                                    413 	; local variables 
                           000001   414 	BTW = 1   ; byte to write offset on stack
                           000002   415     OPT = 2 
                           000002   416 	VSIZE = 2
      009FF6                        417 EECSTORE:
      009FF6 52 02            [ 2]  418 	sub sp,#VSIZE
      009FF8 CD 9D B8         [ 4]  419     call FPSTOR
      009FFB E6 01            [ 1]  420 	ld a,(1,x)
      009FFD 43               [ 1]  421 	cpl a 
      009FFE 6B 01            [ 1]  422 	ld (BTW,sp),a ; byte to write 
      00A000 0F 02            [ 1]  423 	clr (OPT,sp)  ; OPTION flag
      00A002 CD 9E F6         [ 4]  424 	call UNLOCK 
                                    425 	; check if option
      00A005 3D 34            [ 1]  426 	tnz FPTR 
      00A007 26 19            [ 1]  427 	jrne 2$
      00A009 90 BE 35         [ 2]  428 	ldw y,PTR16 
      00A00C 90 A3 48 00      [ 2]  429 	cpw y,#OPTION_BASE
      00A010 2B 10            [ 1]  430 	jrmi 2$
      00A012 90 A3 48 80      [ 2]  431 	cpw y,#OPTION_END+1
      00A016 2A 0A            [ 1]  432 	jrpl 2$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]



      00A018 03 02            [ 1]  433 	cpl (OPT,sp)
                                    434 	; OPTION WRITE require this UNLOCK 
      00A01A 72 1E 50 5B      [ 1]  435     bset FLASH_CR2,#FLASH_CR2_OPT
      00A01E 72 1F 50 5C      [ 1]  436     bres FLASH_NCR2,#FLASH_CR2_OPT 
      00A022                        437 2$: 
      00A022 CD 9F A1         [ 4]  438 	call WR_BYTE 	
      00A025 0D 02            [ 1]  439 	tnz (OPT,sp)
      00A027 27 0D            [ 1]  440 	jreq 3$ 
      00A029 7B 01            [ 1]  441     ld a,(BTW,sp)
      00A02B 90 5F            [ 1]  442     clrw y
      00A02D 90 97            [ 1]  443 	ld yl,a 
      00A02F 1D 00 02         [ 2]  444 	subw x,#CELLL 
      00A032 FF               [ 2]  445 	ldw (x),y 
      00A033 CD 9F A1         [ 4]  446 	call WR_BYTE
      00A036                        447 3$: 
      00A036 CD 9F 1E         [ 4]  448 	call LOCK 
      00A039 5B 02            [ 2]  449 	addw sp,#VSIZE 
      00A03B 81               [ 4]  450     ret
                                    451 
                                    452 ;------------------------------
                                    453 ; write integer in FLASH|EEPROM
                                    454 ; EE! ( n ud -- )
                                    455 ;------------------------------
      00A03C 9F F1                  456 	.word LINK 
                           001FBE   457 	LINK=.
      00A03E 03                     458 	.byte 3 
      00A03F 45 45 21               459 	.ascii "EE!"
      00A042                        460 EESTORE:
      00A042 CD 9D B8         [ 4]  461 	call FPSTOR 
      00A045 CD 9E F6         [ 4]  462 	call UNLOCK 
      00A048 90 93            [ 1]  463 	ldw y,x 
      00A04A 90 FE            [ 2]  464 	ldw y,(y)
      00A04C 90 89            [ 2]  465 	pushw y 
      00A04E 90 5E            [ 1]  466 	swapw y 
      00A050 FF               [ 2]  467 	ldw (x),y 
      00A051 CD 9F A1         [ 4]  468 	call WR_BYTE 
      00A054 90 85            [ 2]  469 	popw y 
      00A056 1D 00 02         [ 2]  470 	subw x,#CELLL
      00A059 FF               [ 2]  471 	ldw (x),y 
      00A05A CD 9F A1         [ 4]  472 	call WR_BYTE
      00A05D CC 9F 1E         [ 2]  473 	jp LOCK 
                                    474 
                                    475 
                                    476 ;----------------------------
                                    477 ; Erase flash memory row 
                                    478 ; stm8s208 as 128 bytes rows
                                    479 ; ROW-ERASE ( ud -- )
                                    480 ;----------------------------
      00A060 A0 3E                  481 	.word LINK 
                           001FE2   482 	LINK=. 
      00A062 09                     483 	.byte 9 
      00A063 52 4F 57 2D 45 52 41   484 	.ascii "ROW-ERASE" 
             53 45
      00A06C                        485 row_erase:
      00A06C CD 84 E4         [ 4]  486 	call FC_XOFF
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 118.
Hexadecimal [24-Bits]



      00A06F CD 9D B8         [ 4]  487 	call FPSTOR
                                    488 ;code must be execute from RAM 
                                    489 ;copy routine to PAD 
      00A072 1D 00 02         [ 2]  490 	subw x,#CELLL 
      00A075 90 AE A0 C5      [ 2]  491 	ldw y,#row_erase_proc
      00A079 FF               [ 2]  492 	ldw (x),y 
      00A07A CD 8D 7A         [ 4]  493 	call PAD 
      00A07D 90 AE A0 EC      [ 2]  494 	ldw y,#row_erase_proc_end 
      00A081 72 A2 A0 C5      [ 2]  495 	subw y,#row_erase_proc
      00A085 1D 00 02         [ 2]  496 	subw x,#CELLL 
      00A088 FF               [ 2]  497 	ldw (x),y 
      00A089 CD 8D B6         [ 4]  498 	call CMOVE 
      00A08C                        499 block_erase:
      00A08C 90 BE 35         [ 2]  500 	ldw y,FPTR+1
      00A08F 90 A3 AB 00      [ 2]  501 	cpw y,#app_space 
      00A093 2A 19            [ 1]  502 	jrpl erase_flash 
                                    503 ; erase EEPROM block
      00A095 90 A3 40 00      [ 2]  504 	cpw y,#EEPROM_BASE 
      00A099 24 04            [ 1]  505 	jruge 1$
      00A09B CD 84 CE         [ 4]  506 	call FC_XON
      00A09E 81               [ 4]  507 	ret ; bad address 
      00A09F 90 A3 47 FF      [ 2]  508 1$: cpw y,#EEPROM_END 
      00A0A3 23 04            [ 2]  509 	jrule 2$ 
      00A0A5 CD 84 CE         [ 4]  510 	call FC_XON
      00A0A8 81               [ 4]  511 	ret ; bad address 
      00A0A9                        512 2$:	
      00A0A9 CD 9E B8         [ 4]  513 	call UNLKEE 
      00A0AC 20 03            [ 2]  514 	jra proceed_erase
                                    515 ; erase flash block:
      00A0AE                        516 erase_flash:
      00A0AE CD 9E D7         [ 4]  517 	call UNLKFL 
      00A0B1                        518 proceed_erase:
      00A0B1 CD 8D 7A         [ 4]  519 	call PAD 
      00A0B4 90 93            [ 1]  520 	ldw y,x
      00A0B6 90 FE            [ 2]  521 	ldw y,(y)
      00A0B8 1C 00 02         [ 2]  522 	addw x,#CELLL  
      00A0BB 90 FD            [ 4]  523 	call (y) 
      00A0BD 72 17 50 5F      [ 1]  524 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      00A0C1 CD 84 CE         [ 4]  525 	call FC_XON
      00A0C4 81               [ 4]  526 	ret 
                                    527 
                                    528 ; this routine is to be copied to PAD 
      00A0C5                        529 row_erase_proc:
      00A0C5 35 20 50 5B      [ 1]  530 	mov FLASH_CR2,#(1<<FLASH_CR2_ERASE) 
      00A0C9 35 DF 50 5C      [ 1]  531 	mov FLASH_NCR2,#~(1<<FLASH_CR2_ERASE)
      00A0CD 4F               [ 1]  532 	clr a 
      00A0CE 90 5F            [ 1]  533 	clrw y 
      00A0D0 91 A7 00 34      [ 1]  534 	ldf ([FPTR],y),a
      00A0D4 90 5C            [ 1]  535     incw y
      00A0D6 91 A7 00 34      [ 1]  536 	ldf ([FPTR],y),a
      00A0DA 90 5C            [ 1]  537     incw y
      00A0DC 91 A7 00 34      [ 1]  538 	ldf ([FPTR],y),a
      00A0E0 90 5C            [ 1]  539     incw y
      00A0E2 91 A7 00 34      [ 1]  540 	ldf ([FPTR],y),a
      00A0E6 72 05 50 5F FB   [ 2]  541 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 119.
Hexadecimal [24-Bits]



      00A0EB 81               [ 4]  542 	ret
      00A0EC                        543 row_erase_proc_end:
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
      00A0EC                        556 copy_buffer:
      00A0EC 4B 80            [ 1]  557 	push #BLOCK_SIZE  
                                    558 ;enable block programming 
      00A0EE 72 10 50 5B      [ 1]  559 	bset FLASH_CR2,#FLASH_CR2_PRG 
      00A0F2 72 11 50 5C      [ 1]  560 	bres FLASH_NCR2,#FLASH_CR2_PRG
      00A0F6 90 5F            [ 1]  561 	clrw y
      00A0F8 F6               [ 1]  562 1$:	ld a,(x)
      00A0F9 91 A7 00 34      [ 1]  563 	ldf ([FPTR],y),a
      00A0FD 5C               [ 1]  564 	incw x 
      00A0FE 90 5C            [ 1]  565 	incw y 
      00A100 0A 01            [ 1]  566 	dec (BCNT,sp)
      00A102 26 F4            [ 1]  567 	jrne 1$
                                    568 ; wait EOP bit 
      00A104 72 05 50 5F FB   [ 2]  569 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. 
      00A109 84               [ 1]  570 	pop a ; remove BCNT from stack 
      00A10A 81               [ 4]  571 	ret 
      00A10B                        572 copy_buffer_end:
                                    573 
                                    574 ;-------------------------
                                    575 ; move program_row to RAM 
                                    576 ; in TIB 
                                    577 ;------------------------
      00A10B                        578 copy_prog_to_ram:
      00A10B 1D 00 06         [ 2]  579 	subw x,#6
      00A10E 90 AE A0 EC      [ 2]  580 	ldw y,#copy_buffer 
      00A112 EF 04            [ 2]  581 	ldw (4,x),y 
      00A114 90 AE 17 00      [ 2]  582 	ldw y,#TIBBASE
      00A118 EF 02            [ 2]  583 	ldw (2,x),y 
      00A11A 90 AE A1 0B      [ 2]  584 	ldw y,#copy_buffer_end 
      00A11E 72 A2 A0 EC      [ 2]  585 	subw y,#copy_buffer  
      00A122 FF               [ 2]  586 	ldw (x),y 
      00A123 CD 8D B6         [ 4]  587 	call CMOVE 
      00A126 81               [ 4]  588 	ret 
                                    589 
                                    590 
                                    591 ;-----------------------------
                                    592 ; write a row in FLASH/EEPROM 
                                    593 ; WR-ROW ( a ud -- )
                                    594 ; a -> address 128 byte buffer to write 
                                    595 ; ud ->  row address in FLASH|EEPROM 
                                    596 ;-----------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 120.
Hexadecimal [24-Bits]



      00A127 A0 62                  597 	.word LINK 
                           0020A9   598 	LINK=.
      00A129 06                     599 	.byte 6 
      00A12A 57 52 2D 52 4F 57      600 	.ascii "WR-ROW"
      00A130                        601 write_row:
      00A130 CD 84 E4         [ 4]  602 	call FC_XOFF
      00A133 CD 9D B8         [ 4]  603 	call FPSTOR
                                    604 ; align to FLASH block 
      00A136 A6 80            [ 1]  605 	ld a,#0x80 
      00A138 B4 36            [ 1]  606 	and a,PTR8 
      00A13A B7 36            [ 1]  607 	ld PTR8,a  
      00A13C CD A1 0B         [ 4]  608 	call copy_prog_to_ram
      00A13F CD 9E F6         [ 4]  609 	call UNLOCK
      00A142 90 93            [ 1]  610 	ldw y,x 
      00A144 90 FE            [ 2]  611 	ldw y,(y)
      00A146 1C 00 02         [ 2]  612 	addw x,#CELLL 
      00A149 89               [ 2]  613 	pushw x 
      00A14A 93               [ 1]  614 	ldw x,y ; buffer address in x 
      00A14B CD 17 00         [ 4]  615 	call TIBBASE
      00A14E CD 9F 1E         [ 4]  616 	call LOCK
      00A151 85               [ 2]  617 	popw x 
      00A152 CD 84 CE         [ 4]  618 	call FC_XON 
      00A155 81               [ 4]  619 	ret 
                                    620 
                                    621 ;-------------------------------------
                                    622 ; change value of OPTION register 
                                    623 ; SET-OPT (c n -- ) 
                                    624 ; c new value.
                                    625 ; n OPT  number {1..7}
                                    626 ;--------------------------------------
      00A156 A1 29                  627 		.word LINK 
                           0020D8   628 		LINK=.
      00A158 07                     629 		.byte 7 
      00A159 53 45 54 2D 4F 50 54   630 		.ascii "SET-OPT" 
      00A160                        631 set_option: 
      00A160 90 93            [ 1]  632 		ldw y,x 
      00A162 90 FE            [ 2]  633 		ldw y,(y)
      00A164 27 06            [ 1]  634 		jreq 1$
      00A166 90 A3 00 07      [ 2]  635 		cpw y,#7 
      00A16A 23 04            [ 2]  636 		jrule 2$ 
                                    637 ; invalid OPTION number 		
      00A16C 1C 00 04         [ 2]  638 1$:		addw x,#2*CELLL
      00A16F 81               [ 4]  639 		ret
      00A170 90 58            [ 2]  640 2$:		sllw y 
      00A172 72 A9 47 FF      [ 2]  641 		addw y,#OPTION_BASE-1
      00A176 FF               [ 2]  642 		ldw (x),y 
      00A177 1D 00 02         [ 2]  643 		subw x,#CELLL 
      00A17A 90 5F            [ 1]  644 		clrw y 
      00A17C FF               [ 2]  645 		ldw (x),y 
      00A17D CD 9F F6         [ 4]  646 		call EECSTORE
      00A180 81               [ 4]  647 		ret 
                                    648 
                                    649 
                                    650 
                                    651 ;--------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 121.
Hexadecimal [24-Bits]



                                    652 ; reset system to its original state 
                                    653 ; before any user modification
                                    654 ; PRISTINE ( -- )
                                    655 ;-------------------------------------
      00A181 A1 58                  656 	.word LINK  
                           002103   657 	LINK=.
      00A183 08                     658 	.byte 8 
      00A184 50 52 49 53 54 49 4E   659 	.ascii "PRISTINE"
             45
      00A18C                        660 pristine:
                                    661 ;;; erase EEPROM
      00A18C CD 9D D7         [ 4]  662 	call EEPROM 
      00A18F CD 88 A8         [ 4]  663 1$:	call DDUP 
      00A192 CD A0 6C         [ 4]  664 	call row_erase
      00A195 90 93            [ 1]  665 	ldw y,x 
      00A197 90 EE 02         [ 2]  666 	ldw y,(2,y)
      00A19A 72 A9 00 80      [ 2]  667 	addw y,#BLOCK_SIZE
      00A19E EF 02            [ 2]  668 	ldw (2,x),y
      00A1A0 90 A3 48 00      [ 2]  669 	cpw y,#OPTION_BASE 
      00A1A4 25 E9            [ 1]  670 	jrult 1$
                                    671 ;;; reset OPTION to default values
      00A1A6 90 AE 00 01      [ 2]  672 	ldw y,#1 ; OPT1 
      00A1AA FF               [ 2]  673 2$:	ldw (x),y   
      00A1AB 90 5F            [ 1]  674 	clrw y 
      00A1AD EF 02            [ 2]  675 	ldw (2,x),y  ; ( 0 1 -- ) 
      00A1AF CD 88 A8         [ 4]  676 	call DDUP    ; ( 0 1 0 1 -- )  
      00A1B2 CD A1 60         [ 4]  677 	call set_option
      00A1B5 90 93            [ 1]  678 	ldw y,x 
      00A1B7 90 FE            [ 2]  679 	ldw y,(y)
      00A1B9 90 5C            [ 1]  680 	incw y  ; next OPTION 
      00A1BB 90 A3 00 08      [ 2]  681 	cpw y,#8 
      00A1BF 25 E9            [ 1]  682 	jrult 2$
                                    683 ;;; erase first row of app_space 	
      00A1C1 90 AE AB 00      [ 2]  684 	ldw y,#app_space
      00A1C5 EF 02            [ 2]  685 	ldw (2,x),y  
      00A1C7 90 5F            [ 1]  686 	clrw y 
      00A1C9 FF               [ 2]  687 	ldw (x),y ; ( app_space 0 -- )
      00A1CA CD A0 6C         [ 4]  688 	call row_erase 
                                    689 ; reset interrupt vectors 
      00A1CD 1D 00 02         [ 2]  690 	subw x,#CELLL 
      00A1D0 90 5F            [ 1]  691 	clrw y  
      00A1D2 FF               [ 2]  692 4$:	ldw (x),y  ; ( n -- ) int# 
      00A1D3 CD 86 9A         [ 4]  693 	call DUPP  
      00A1D6 CD A1 F3         [ 4]  694 	call reset_vector
      00A1D9 90 93            [ 1]  695 	ldw y,x 
      00A1DB 90 FE            [ 2]  696 	ldw y,(y)
      00A1DD 90 5C            [ 1]  697 	incw y   ; next vector 
      00A1DF 90 A3 00 19      [ 2]  698 	cpw y,#25 
      00A1E3 25 ED            [ 1]  699 	jrult 4$
      00A1E5 CC 80 80         [ 2]  700 	jp NonHandledInterrupt ; reset MCU
                                    701 
                                    702 ;------------------------------
                                    703 ; reset an interrupt vector 
                                    704 ; to its initial value 
                                    705 ; i.e. NonHandledInterrupt
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 122.
Hexadecimal [24-Bits]



                                    706 ; RST-IVEC ( n -- )
                                    707 ;-----------------------------
      00A1E8 A1 83                  708 	.word LINK 
                           00216A   709 	LINK=. 
      00A1EA 08                     710 	.byte 8 
      00A1EB 52 53 54 2D 49 56 45   711 	.ascii "RST-IVEC"
             43
      00A1F3                        712 reset_vector:
      00A1F3 90 93            [ 1]  713 	ldw y,x
      00A1F5 1C 00 02         [ 2]  714 	addw x,#CELLL 
      00A1F8 90 FE            [ 2]  715 	ldw y,(y)
      00A1FA 90 A3 00 17      [ 2]  716 	cpw y,#23 
      00A1FE 27 3A            [ 1]  717 	jreq 9$
      00A200 90 A3 00 1D      [ 2]  718 	cpw y,#29 ; last vector
      00A204 22 34            [ 1]  719 	jrugt 9$  
      00A206 90 58            [ 2]  720 	sllw y 
      00A208 90 58            [ 2]  721 	sllw y 
      00A20A 72 A9 80 08      [ 2]  722 	addw y,#0x8008 ; irq0 address 
      00A20E 90 BF 26         [ 2]  723 	ldw YTEMP,y
      00A211 1D 00 06         [ 2]  724 	subw x,#3*CELLL 
      00A214 EF 02            [ 2]  725 	ldw (2,x),y 
      00A216 90 5F            [ 1]  726 	clrw y
      00A218 FF               [ 2]  727 	ldw (x),y 
      00A219 A6 82            [ 1]  728 	ld a,#0x82 
      00A21B 90 95            [ 1]  729 	ld yh,a
      00A21D EF 04            [ 2]  730 	ldw (4,x),y
      00A21F CD A0 42         [ 4]  731 	call EESTORE
      00A222 1D 00 06         [ 2]  732 	subw x,#3*CELLL
      00A225 90 5F            [ 1]  733 	clrw y 
      00A227 FF               [ 2]  734 	ldw (x),y 
      00A228 90 AE 80 80      [ 2]  735 	ldw y,#NonHandledInterrupt
      00A22C EF 04            [ 2]  736 	ldw (4,x),y 
      00A22E 90 BE 26         [ 2]  737 	ldw y,YTEMP  
      00A231 72 A9 00 02      [ 2]  738 	addw y,#2
      00A235 EF 02            [ 2]  739 	ldw (2,x),y 
      00A237 CD A0 42         [ 4]  740 	call EESTORE
      00A23A 81               [ 4]  741 9$:	ret 
                                    742 
                                    743 
                                    744 ;------------------------------
                                    745 ; all interrupt vector with 
                                    746 ; an address >= a are resetted 
                                    747 ; to default
                                    748 ; CHKIVEC ( a -- )
                                    749 ;------------------------------
      00A23B A1 EA                  750 	.word LINK 
                           0021BD   751 	LINK=.
      00A23D 07                     752 	.byte 7
      00A23E 43 48 4B 49 56 45 43   753 	.ascii "CHKIVEC"
                                    754 ;local variables 
                           000001   755 	SSP=1
                           000003   756 	CADR=3
                           000005   757 	OFS=5
                           000006   758 	VSIZE=6  
      00A245                        759 CHKIVEC:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 123.
Hexadecimal [24-Bits]



      00A245 52 06            [ 2]  760 	sub sp,#VSIZE ;alloc local variables 
      00A247 90 93            [ 1]  761 	ldw y,x 
      00A249 90 FE            [ 2]  762 	ldw y,(y)
      00A24B 17 03            [ 2]  763 	ldw (CADR,sp),y ; ca 
      00A24D 1F 01            [ 2]  764 	ldw (SSP,sp),x 
      00A24F AE 80 0A         [ 2]  765 	ldw x,#0x800a ; irq0 address 
      00A252 BF 35            [ 2]  766 	ldw PTR16,X
      00A254 AE FF FC         [ 2]  767 	ldw x,#-4 
      00A257 1C 00 04         [ 2]  768 1$:	addw x,#4
      00A25A A3 00 78         [ 2]  769 	cpw x,#30*4 ; irq0-29 
      00A25D 27 22            [ 1]  770 	jreq 9$
      00A25F 90 93            [ 1]  771 	ldw y,x  
      00A261 91 D6 35         [ 4]  772 	ld a,([PTR16],y)
      00A264 11 03            [ 1]  773 	cp a,(CADR,sp)
      00A266 25 EF            [ 1]  774 	jrult 1$
      00A268 90 5C            [ 1]  775 	incw y 
      00A26A 91 D6 35         [ 4]  776 	ld a,([PTR16],y)
      00A26D 11 04            [ 1]  777 	cp a,(CADR+1,sp) 
      00A26F 25 E6            [ 1]  778 	jrult 1$ 
      00A271 1F 05            [ 2]  779 	ldw (OFS,sp),x 
      00A273 54               [ 2]  780 	srlw x
      00A274 54               [ 2]  781 	srlw x 
      00A275 90 93            [ 1]  782 	ldw y,x 
      00A277 1E 01            [ 2]  783 	ldw x,(SSP,sp)
      00A279 FF               [ 2]  784 	ldw (x),y
      00A27A CD A1 F3         [ 4]  785 	call reset_vector
      00A27D 1E 05            [ 2]  786 	ldw x,(OFS,sp) 
      00A27F 20 D6            [ 2]  787 	jra 1$
      00A281 1E 01            [ 2]  788 9$:	ldw x,(SSP,sp) 
      00A283 1C 00 02         [ 2]  789 	addw x,#CELLL 
      00A286 5B 06            [ 2]  790 	addw sp,#VSIZE ; drop local variables  
      00A288 81               [ 4]  791 	ret 
                                    792 
                                    793 ;------------------------------
                                    794 ; set interrupt vector 
                                    795 ; SET-IVEC ( ud n -- )
                                    796 ;  ud Handler address
                                    797 ;  n  vector # 0 .. 29 
                                    798 ;-----------------------------
      00A289 A2 3D                  799 	.word LINK
                           00220B   800 	LINK=.
      00A28B 08                     801 	.byte 8 
      00A28C 53 45 54 2D 49 56 45   802 	.ascii "SET-IVEC" 
             43
      00A294                        803 set_vector:
      00A294 90 93            [ 1]  804     ldw y,x 
      00A296 1C 00 02         [ 2]  805 	addw x,#CELLL 
      00A299 90 FE            [ 2]  806 	ldw y,(y) ; vector #
      00A29B 90 A3 00 1D      [ 2]  807 	cpw y,#29 ; last vector
      00A29F 23 04            [ 2]  808 	jrule 2$
      00A2A1 1C 00 04         [ 2]  809 	addw x,#2*CELLL 
      00A2A4 81               [ 4]  810 	ret
      00A2A5 90 58            [ 2]  811 2$:	sllw y 
      00A2A7 90 58            [ 2]  812 	sllw y 
      00A2A9 72 A9 80 08      [ 2]  813 	addw y,#0X8008 ; IRQ0 vector address 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 124.
Hexadecimal [24-Bits]



      00A2AD 90 BF 26         [ 2]  814 	ldw YTEMP,y ; vector address 
      00A2B0 A6 82            [ 1]  815 	ld a,#0x82 
      00A2B2 90 95            [ 1]  816 	ld yh,a 
      00A2B4 E6 01            [ 1]  817 	ld a,(1,x) ; isr address bits 23..16 
      00A2B6 90 97            [ 1]  818 	ld yl,a 
                                    819 ;  write 0x82 + most significant byte of int address	
      00A2B8 1D 00 06         [ 2]  820 	subw x,#3*CELLL 
      00A2BB EF 04            [ 2]  821 	ldw (4,x),y 
      00A2BD 90 BE 26         [ 2]  822 	ldw y,YTEMP
      00A2C0 EF 02            [ 2]  823 	ldw (2,x),y ; vector address 
      00A2C2 90 5F            [ 1]  824 	clrw y 
      00A2C4 FF               [ 2]  825 	ldw (x),y   ; as a double 
      00A2C5 CD A0 42         [ 4]  826 	call EESTORE 
      00A2C8 90 93            [ 1]  827 	ldw y,x 
      00A2CA 90 EE 02         [ 2]  828 	ldw y,(2,y) ; bits 15..0 int vector 
      00A2CD 1D 00 06         [ 2]  829 	subw x,#3*CELLL 
      00A2D0 EF 04            [ 2]  830 	ldw (4,x),y 
      00A2D2 90 BE 26         [ 2]  831 	ldw y,YTEMP 
      00A2D5 72 A9 00 02      [ 2]  832 	addw y,#2 
      00A2D9 EF 02            [ 2]  833 	ldw (2,x),y 
      00A2DB 90 5F            [ 1]  834 	clrw y 
      00A2DD FF               [ 2]  835 	ldw (x),y 
      00A2DE CD A0 42         [ 4]  836 	call EESTORE
      00A2E1 1C 00 04         [ 2]  837 	addw x,#2*CELLL  
      00A2E4 81               [ 4]  838 9$: ret 
                                    839 
                                    840 
                                    841 ;------------------------
                                    842 ; Compile word to flash
                                    843 ; EE, (w -- )
                                    844 ;-----------------------
      00A2E5 A2 8B                  845 	.word LINK
                           002267   846 	LINK=.
      00A2E7 03                     847 	.byte 3
      00A2E8 45 45 2C               848 	.ascii "EE,"
      00A2EB                        849 EE_COMMA:
      00A2EB 1D 00 04         [ 2]  850 	subw x,#2*CELLL 
      00A2EE 90 BE 1A         [ 2]  851 	ldw y,UCP
      00A2F1 90 89            [ 2]  852 	pushw y 
      00A2F3 EF 02            [ 2]  853 	ldw (2,x),y 
      00A2F5 90 5F            [ 1]  854 	clrw y 
      00A2F7 FF               [ 2]  855 	ldw (x),y
      00A2F8 CD A0 42         [ 4]  856 	call EESTORE
      00A2FB 90 85            [ 2]  857 	popw y 
      00A2FD 72 A9 00 02      [ 2]  858 	addw y,#2
      00A301 90 BF 1A         [ 2]  859 	ldw UCP,y
      00A304 81               [ 4]  860 	ret 
                                    861 
                                    862 
                                    863 ;-------------------------
                                    864 ; Compile byte to flash 
                                    865 ; EEC, ( c -- )	
                                    866 ;-------------------------
      00A305 A2 E7                  867 	.word LINK 
                           002287   868 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 125.
Hexadecimal [24-Bits]



      00A307 04                     869 	.byte 4 
      00A308 45 45 43 2C            870 	.ascii "EEC,"
      00A30C                        871 EE_CCOMMA:
      00A30C 1D 00 04         [ 2]  872 	subw x,#2*CELLL 
      00A30F 90 BE 1A         [ 2]  873 	ldw y,UCP
      00A312 90 89            [ 2]  874 	pushw y 
      00A314 EF 02            [ 2]  875 	ldw (2,x),y 
      00A316 90 5F            [ 1]  876 	clrw y 
      00A318 FF               [ 2]  877 	ldw (x),y
      00A319 CD 9F F6         [ 4]  878 	call EECSTORE
      00A31C 90 85            [ 2]  879 	popw y 
      00A31E 90 5C            [ 1]  880 	incw y 
      00A320 90 BF 1A         [ 2]  881 	ldw UCP,y
      00A323 81               [ 4]  882 	ret 
                                    883 
                                    884 
                                    885 ;--------------------------
                                    886 ; copy FLASH block to ROWBUF
                                    887 ; ROW>BUF ( ud -- )
                                    888 ;--------------------------
      00A324 A3 07                  889 	.word LINK 
                           0022A6   890 	LINK=.
      00A326 07                     891 	.byte 7 
      00A327 52 4F 57 3E 42 55 46   892 	.ascii "ROW>BUF"
      00A32E                        893 ROW2BUF: 
      00A32E CD 9D B8         [ 4]  894 	call FPSTOR 
      00A331 A6 80            [ 1]  895 	ld a,#BLOCK_SIZE
      00A333 88               [ 1]  896 	push a 
      00A334 B4 36            [ 1]  897 	and a,PTR8 ; block align 
      00A336 B7 36            [ 1]  898 	ld PTR8,a
      00A338 90 AE 16 80      [ 2]  899 	ldw y,#ROWBUFF 
      00A33C 92 BC 00 34      [ 5]  900 1$: ldf a,[FPTR]
      00A340 90 F7            [ 1]  901 	ld (y),a
      00A342 CD 9F 32         [ 4]  902 	call INC_FPTR
      00A345 90 5C            [ 1]  903 	incw y 
      00A347 0A 01            [ 1]  904 	dec (1,sp)
      00A349 26 F1            [ 1]  905 	jrne 1$ 
      00A34B 84               [ 1]  906 	pop a 
      00A34C 81               [ 4]  907 	ret 
                                    908 
                                    909 
                                    910 ;---------------------------
                                    911 ; copy ROWBUFF to flash 
                                    912 ; BUF>ROW ( ud -- )
                                    913 ; ud is row address as double 
                                    914 ;---------------------------
      00A34D A3 26                  915 	.word LINK 
                           0022CF   916 	LINK=.
      00A34F 07                     917 	.byte 7 
      00A350 42 55 46 3E 52 4F 57   918 	.ascii "BUF>ROW" 
      00A357                        919 BUF2ROW:
      00A357 CD 87 9E         [ 4]  920 	call TBUF ; ( ud rb -- )
      00A35A CD 88 5E         [ 4]  921 	call ROT 
      00A35D CD 88 5E         [ 4]  922 	call ROT  ; ( rb ud -- )
      00A360 CD A1 30         [ 4]  923 	call write_row 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 126.
Hexadecimal [24-Bits]



      00A363 81               [ 4]  924 	ret 
                                    925 
                                    926 ;---------------------------------
                                    927 ; how many byte free in that row 
                                    928 ; RFREE ( a -- n )
                                    929 ; a is least byte of target address
                                    930 ;----------------------------------
      00A364 A3 4F                  931 	.word LINK 
                           0022E6   932 	LINK=.
      00A366 05                     933 	.byte 5 
      00A367 52 46 52 45 45         934 	.ascii "RFREE"
      00A36C                        935 RFREE:
      00A36C E6 01            [ 1]  936 	ld a,(1,x)
      00A36E A4 7F            [ 1]  937 	and a,#BLOCK_SIZE-1 
      00A370 B7 26            [ 1]  938 	ld YTEMP,a 
      00A372 A6 80            [ 1]  939 	ld a,#BLOCK_SIZE 
      00A374 B0 26            [ 1]  940 	sub a,YTEMP 
      00A376 90 5F            [ 1]  941 	clrw y 
      00A378 90 97            [ 1]  942 	ld yl,a
      00A37A FF               [ 2]  943 	ldw (x),y 
      00A37B 81               [ 4]  944 	ret 
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
      00A37C A3 66                  955 	.word LINK 
                           0022FE   956 	LINK=. 
      00A37E 06                     957 	.byte 6
      00A37F 52 41 4D 3E 45 45      958 	.ascii "RAM>EE"
                                    959 	
      00A385                        960 RAM2EE:
                                    961 ; copy ud on top 
      00A385 90 93            [ 1]  962 	ldw y,x 
      00A387 90 EE 06         [ 2]  963 	ldw y,(6,y) ; LSW of ud  
      00A38A 90 BF 26         [ 2]  964 	ldw YTEMP,y 
      00A38D 90 93            [ 1]  965 	ldw y,x 
      00A38F 90 EE 04         [ 2]  966 	ldw y,(4,y)  ; MSW of ud 
      00A392 1D 00 04         [ 2]  967 	subw x,#2*CELLL 
      00A395 FF               [ 2]  968 	ldw (x),y 
      00A396 90 BE 26         [ 2]  969 	ldw y,YTEMP 
      00A399 EF 02            [ 2]  970 	ldw (2,x),y 
      00A39B CD A3 2E         [ 4]  971 	call ROW2BUF 
      00A39E 90 93            [ 1]  972 	ldw y,x 
      00A3A0 90 EE 06         [ 2]  973 	ldw y,(6,y)
      00A3A3 90 89            [ 2]  974 	pushw y ; udl 
      00A3A5 90 9F            [ 1]  975 	ld a,yl
      00A3A7 A4 7F            [ 1]  976 	and a,#BLOCK_SIZE-1 
      00A3A9 90 5F            [ 1]  977 	clrw y 
      00A3AB 90 97            [ 1]  978 	ld yl,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 127.
Hexadecimal [24-Bits]



      00A3AD 72 A9 16 80      [ 2]  979 	addw y,#ROWBUFF 
      00A3B1 1D 00 02         [ 2]  980 	subw x,#CELLL 
      00A3B4 FF               [ 2]  981 	ldw (x),y  
      00A3B5 CD 86 AA         [ 4]  982 	call SWAPP ;  ( ud a ra u -- )
      00A3B8 CD 85 B5         [ 4]  983 	call RFROM  
      00A3BB CD A3 6C         [ 4]  984 	call RFREE 
      00A3BE CD 8A 00         [ 4]  985 	call MIN
      00A3C1 CD 86 9A         [ 4]  986 	call DUPP 
      00A3C4 CD 86 63         [ 4]  987 	call TOR  
      00A3C7 CD 8D B6         [ 4]  988 	call CMOVE
      00A3CA CD A3 57         [ 4]  989 	call BUF2ROW 
      00A3CD CD 85 B5         [ 4]  990 	call RFROM 
      00A3D0 81               [ 4]  991 	ret 
                                    992 
                                    993 
                                    994 ;--------------------------
                                    995 ; expand 16 bit address 
                                    996 ; to 32 bit address 
                                    997 ; FADDR ( a -- ud )
                                    998 ;--------------------------
      00A3D1 A3 7E                  999 	.word LINK 
                           002353  1000 	LINK=. 
      00A3D3 05                    1001 	.byte 5 
      00A3D4 46 41 44 44 52        1002 	.ascii "FADDR"
      00A3D9                       1003 FADDR:
      00A3D9 CC 8C 8F         [ 2] 1004 	jp ZERO 
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
      00A3DC A3 D3                 1020 	.word LINK 
                           00235E  1021 	LINK=.
      00A3DE 05                    1022 	.byte 5 
      00A3DF 46 4D 4F 56 45        1023 	.ascii "FMOVE" 
      00A3E4                       1024 FMOVE:
      00A3E4 CD 87 B0         [ 4] 1025 	call TFLASH 
      00A3E7 CD 85 64         [ 4] 1026 	CALL AT 
      00A3EA CD 85 19         [ 4] 1027 	CALL QBRAN 
      00A3ED A4 68                 1028 	.word no_move  
      00A3EF CD 87 FF         [ 4] 1029 	call CPP
      00A3F2 CD 85 64         [ 4] 1030 	call AT  
      00A3F5 CD 86 9A         [ 4] 1031 	call DUPP ; ( udl udl -- )
      00A3F8 CD 87 E3         [ 4] 1032 	call CNTXT 
      00A3FB CD 85 64         [ 4] 1033 	call AT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 128.
Hexadecimal [24-Bits]



      00A3FE CD 84 F0         [ 4] 1034 	call DOLIT 
      00A401 00 02                 1035 	.word 2 
      00A403 CD 89 53         [ 4] 1036 	call SUBB ; ( udl udl a -- )
      00A406 CD 86 AA         [ 4] 1037 	call SWAPP 
      00A409 CD A3 D9         [ 4] 1038 	call FADDR 
      00A40C CD 88 5E         [ 4] 1039 	call ROT  ; ( udl ud a -- )
      00A40F CD 86 9A         [ 4] 1040 	call DUPP 
      00A412 CD 86 63         [ 4] 1041 	call TOR    ; R: a 
      00A415                       1042 FMOVE2: 
      00A415 CD 8D 69         [ 4] 1043 	call HERE 
      00A418 CD 85 C6         [ 4] 1044 	call RAT 
      00A41B CD 89 53         [ 4] 1045 	call SUBB ; (udl ud a wl -- )
      00A41E                       1046 next_row:
      00A41E CD 86 9A         [ 4] 1047 	call DUPP 
      00A421 CD 86 63         [ 4] 1048 	call TOR  ; ( udl ud a wl -- ) R: a wl
      00A424 CD A3 85         [ 4] 1049 	call RAM2EE ; ( udl a u -- udl u2 ) u2 is byte written to FLASH 
      00A427 CD 86 9A         [ 4] 1050 	call DUPP 
      00A42A CD 86 63         [ 4] 1051 	call TOR
      00A42D CD 88 BD         [ 4] 1052 	call PLUS  ; ( udl+ ) 
      00A430 CD 86 9A         [ 4] 1053 	call DUPP 
      00A433 CD 8C 8F         [ 4] 1054 	call ZERO   ; ( udl+ ud -- )
      00A436 CD 85 B5         [ 4] 1055 	call RFROM  ; ( udl+ ud u2  R: a wl ) 
      00A439 CD 85 B5         [ 4] 1056 	call RFROM  ; ( udl+ ud u2 wl R: a ) 
      00A43C CD 86 C2         [ 4] 1057 	call OVER   ; ( udl+ ud u2 wl u2 -- )
      00A43F CD 89 53         [ 4] 1058 	call SUBB  ; ( udl+ ud u2 wl- R: a )
      00A442 CD 86 9A         [ 4] 1059 	call DUPP 
      00A445 CD 85 19         [ 4] 1060 	call QBRAN
      00A448 A4 61                 1061 	.word fmove_done 
      00A44A CD 86 AA         [ 4] 1062 	call SWAPP  ; ( udl+ ud wl- u2 R: a )
      00A44D CD 85 B5         [ 4] 1063 	call RFROM ; ( udl+ ud wl- u2 a -- ) 
      00A450 CD 88 BD         [ 4] 1064 	call PLUS  ; ( udl+2 ud wl- a+ )
      00A453 CD 86 9A         [ 4] 1065 	call DUPP 
      00A456 CD 86 63         [ 4] 1066 	call TOR   ; ( udl+2 ud wl- a+ ) R: a+
      00A459 CD 86 AA         [ 4] 1067 	call SWAPP 
      00A45C CD 85 35         [ 4] 1068 	call BRAN
      00A45F A4 1E                 1069 	.word next_row  
      00A461                       1070 fmove_done:	
      00A461 CD 85 B5         [ 4] 1071 	call RFROM  ; ( -- udl+ ud u2 wl- a  )
      00A464 1C 00 0A         [ 2] 1072 	addw x,#5*CELLL ; (  -- cp+ ) new CP 
      00A467 81               [ 4] 1073  	ret  
      00A468                       1074 no_move:
      00A468 CD 8C 8F         [ 4] 1075 	call ZERO
      00A46B 81               [ 4] 1076 	ret 
                                   1077 
                                   1078 ;------------------------------------------
                                   1079 ; adjust pointers after **FMOVE** operetion.
                                   1080 ; UPDAT-PTR ( cp+ -- )
                                   1081 ; cp+ is new CP position after FMOVE 
                                   1082 ;-------------------------------------------
      00A46C A3 DE                 1083 	.word LINK 
                           0023EE  1084 	LINK=.
      00A46E 09                    1085 	.byte 9
      00A46F 55 50 44 41 54 2D 50  1086 	.ascii "UPDAT-PTR" 
             54 52
      00A478                       1087 UPDATPTR:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 129.
Hexadecimal [24-Bits]



                                   1088 ;reset VP to previous position  
      00A478 CD 9E 32         [ 4] 1089 	call EEPVP 
      0023FB                       1090 	_DROP 
      00A47B 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00A47E CD 85 64         [ 4] 1091 	call AT
      00A481 CD 87 F1         [ 4] 1092 	call VPP 
      00A484 CD 85 52         [ 4] 1093 	call STORE
                                   1094 ;update CONTEXT and LAST 
      00A487 CD 9E 1C         [ 4] 1095 	call EEPCP 
      00240A                       1096 	_DROP
      00A48A 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00A48D CD 85 64         [ 4] 1097 	call AT
      00A490 CD 84 F0         [ 4] 1098 	call DOLIT 
      00A493 00 02                 1099 	.word 2 
      00A495 CD 88 BD         [ 4] 1100 	call PLUS 
      00A498 CD 86 9A         [ 4] 1101 	call DUPP 
      00A49B CD 87 E3         [ 4] 1102 	call CNTXT 
      00A49E CD 85 52         [ 4] 1103 	call STORE
      00A4A1 CD 88 0F         [ 4] 1104 	call LAST
      00A4A4 CD 85 52         [ 4] 1105 	call STORE 
      00A4A7 CD 9E 4C         [ 4] 1106 	call UPDATLAST 
                                   1107 ;update CP 
      00A4AA CD 87 FF         [ 4] 1108 	call CPP 
      00A4AD CD 85 52         [ 4] 1109 	call STORE
      00A4B0 CD 9E 75         [ 4] 1110 	call UPDATCP 
      00A4B3 81               [ 4] 1111 	ret 
                                   1112 
                                   1113 ;-----------------------------
                                   1114 ; move interrupt sub-routine
                                   1115 ; in flash memory
                                   1116 ;----------------------------- 
      00A4B4 A4 6E                 1117 	.word LINK 
                           002436  1118 	LINK=. 
      00A4B6 06                    1119 	.byte 6
      00A4B7 49 46 4D 4F 56 45     1120 	.ascii "IFMOVE" 
      00A4BD                       1121 IFMOVE:
      00A4BD CD 87 B0         [ 4] 1122 	call TFLASH 
      00A4C0 CD 85 64         [ 4] 1123 	CALL AT 
      00A4C3 CD 85 19         [ 4] 1124 	CALL QBRAN 
      00A4C6 A4 68                 1125 	.word no_move 
      00A4C8 CD 87 FF         [ 4] 1126 	call CPP 
      00A4CB CD 85 64         [ 4] 1127 	call AT 
      00A4CE CD 86 9A         [ 4] 1128 	call DUPP ; ( udl udl -- )
      00A4D1 CD 9E 32         [ 4] 1129 	call EEPVP 
      002454                       1130 	_DROP
      00A4D4 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00A4D7 CD 85 64         [ 4] 1131 	call AT  ; ( udl udl a )
      00A4DA CD 86 63         [ 4] 1132 	call TOR 
      00A4DD CD A3 D9         [ 4] 1133 	call FADDR
      00A4E0 CD 85 C6         [ 4] 1134 	call RAT ; ( udl ud a -- ) R: a 
      00A4E3 CC A4 15         [ 2] 1135 	jp FMOVE2 
                                   1136 
                                   1137 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 130.
Hexadecimal [24-Bits]



                           000000  4666 .if WANT_SCALING_CONST 
                                   4667         .include "const_ratio.asm"
                                   4668 .endif
                           000001  4669 .if WANT_CONST_TABLE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 131.
Hexadecimal [24-Bits]



                                   4670         .include "ctable.asm"
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
      00A4E6 A4 B6                   34     .word LINK 
                           002468    35     LINK=.
      00A4E8 06                      36     .byte 6
      00A4E9 43 41 4C 4C 4F 54       37     .ascii "CALLOT"
      00A4EF                         38 CALLOT:
      00A4EF CD 87 FF         [ 4]   39     CALL CPP
      00A4F2 CD 86 9A         [ 4]   40     CALL DUPP 
      00A4F5 CD 85 64         [ 4]   41     CALL AT 
      00A4F8 CD 86 63         [ 4]   42     CALL TOR 
      00A4FB CD 8C FF         [ 4]   43     CALL PSTOR 
      00A4FE CD 9E 75         [ 4]   44     CALL UPDATCP 
      00A501 CD 85 B5         [ 4]   45     CALL RFROM
      00A504 CC 8C 8F         [ 2]   46     JP ZERO 
                                     47 
                                     48 ;------------------------------
                                     49 ; create constants bytes table 
                                     50 ; in persistant memory
                                     51 ;  CTABLE ( n+ -- ad ; <string> )
                                     52 ; n+ bytes reserved 
                                     53 ;-----------------------------
      00A507 A4 E8                   54     .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 132.
Hexadecimal [24-Bits]



                           002489    55     LINK=.
      00A509 06                      56     .byte 6
      00A50A 43 54 41 42 4C 45       57     .ascii "CTABLE"
      00A510                         58 CTABLE:
      00A510 CD A4 EF         [ 4]   59     CALL CALLOT     
      00A513 CC 9B 09         [ 2]   60     JP DCONST 
                                     61      
                                     62 
                                     63 ;--------------------------------
                                     64 ; create constants words table 
                                     65 ; in persistant memory 
                                     66 ; WTABLE ( n+ -- ad ; <string> )
                                     67 ; n+  words reserved  
                                     68 ;--------------------------------
      00A516 A5 09                   69     .word LINK 
                           002498    70     LINK=.
      00A518 06                      71     .byte 6
      00A519 57 54 41 42 4C 45       72     .ascii "WTABLE"
      00A51F                         73 WTABLE:
      00A51F CD 8C 16         [ 4]   74     CALL CELLS  
      00A522 CD A4 EF         [ 4]   75     CALL CALLOT 
      00A525 CC 9B 09         [ 2]   76     JP DCONST 
                                     77 
                                     78 ;---------------------------------
                                     79 ; stack an element of CTABLE 
                                     80 ; CTABL@ ( u ad -- c )
                                     81 ; u element order {0..size-1}
                                     82 ; a|ad table address 
                                     83 ;--------------------------------
      00A528 A5 18                   84     .word LINK 
                           0024AA    85     LINK=.
      00A52A 06                      86     .byte 6
      00A52B 43 54 41 42 4C 40       87     .ascii "CTABL@" 
      00A531                         88 CTAT:
      00A531 CD 9D B8         [ 4]   89     call FPSTOR 
      00A534 CD 9F 4A         [ 4]   90     call PTRPLUS 
      00A537 CC 9F 87         [ 2]   91     jp EE_CREAD 
                                     92 
                                     93 ;---------------------------------
                                     94 ; stack an element of WTABLE 
                                     95 ; WTABL@ ( u ud -- w )
                                     96 ; u is element order {0..size-1}
                                     97 ; a|ud table address 
                                     98 ;----------------------------------
      00A53A A5 2A                   99     .word LINK 
                           0024BC   100     LINK=.
      00A53C 06                     101     .byte 6
      00A53D 57 54 41 42 4C 40      102     .ascii "WTABL@" 
      00A543                        103 WTAT:
      00A543 CD 9D B8         [ 4]  104     call FPSTOR 
      00A546 CD 8C 16         [ 4]  105     call CELLS 
      00A549 CD 9F 4A         [ 4]  106     call PTRPLUS 
      00A54C CD 9F 65         [ 4]  107     call EE_READ 
      00A54F 81               [ 4]  108     ret 
                                    109 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 133.
Hexadecimal [24-Bits]



                                    110 ;--------------------------
                                    111 ; tool to initialize character table 
                                    112 ; CTINIT ( ad -- )
                                    113 ; ad is table address 
                                    114 ;--------------------------
      00A550 A5 3C                  115     .word LINK 
                           0024D2   116     LINK=.
      00A552 06                     117     .byte 6 
      00A553 43 54 49 4E 49 54      118     .ascii "CTINIT"
      00A559                        119 CTINIT:
      00A559 CD 9D B8         [ 4]  120     CALL FPSTOR
      00A55C CD 9E F6         [ 4]  121     CALL UNLOCK
      00A55F CD 8C 8F         [ 4]  122     CALL ZERO 
      00A562 CD 8C 23         [ 4]  123 1$: CALL ONEP 
      00A565 CD 86 9A         [ 4]  124     CALL DUPP 
      00A568 CD A5 B5         [ 4]  125     CALL INTQ 
      00A56B CD 85 19         [ 4]  126     CALL QBRAN 
      00A56E A5 78                  127     .word 2$
      00A570 CD 9F A1         [ 4]  128     call WR_BYTE 
      00A573 CD 85 35         [ 4]  129     CALL BRAN 
      00A576 A5 62                  130     .word 1$ 
      0024F8                        131 2$: _DDROP 
      00A578 1C 00 04         [ 2]    1    ADDW X,#2*CELLL 
      00A57B CD 9F 1E         [ 4]  132     CALL LOCK 
      00A57E 81               [ 4]  133     ret 
                                    134 
                                    135 ;--------------------------
                                    136 ; tool to initialize word table 
                                    137 ; WTINIT ( ad -- )
                                    138 ; ad is table address 
                                    139 ;--------------------------
      00A57F A5 52                  140     .word LINK 
                           002501   141     LINK=.
      00A581 06                     142     .byte 6 
      00A582 57 54 49 4E 49 54      143     .ascii "WTINIT"
      00A588                        144 WTINIT:
      00A588 CD 9D B8         [ 4]  145     CALL FPSTOR
      00A58B CD 9E F6         [ 4]  146     CALL UNLOCK
      00A58E CD 8C 8F         [ 4]  147     CALL ZERO 
      00A591 CD 8C 23         [ 4]  148 1$: CALL ONEP 
      00A594 CD 86 9A         [ 4]  149     CALL DUPP
      00A597 CD A5 B5         [ 4]  150     CALL INTQ
      00A59A CD 85 19         [ 4]  151     CALL QBRAN 
      00A59D A5 A7                  152     .word 2$
      00A59F CD 9F C6         [ 4]  153     call WR_WORD 
      00A5A2 CD 85 35         [ 4]  154     CALL BRAN 
      00A5A5 A5 91                  155     .word 1$ 
      002527                        156 2$: _DDROP 
      00A5A7 1C 00 04         [ 2]    1    ADDW X,#2*CELLL 
      00A5AA CD 9F 1E         [ 4]  157     CALL LOCK 
      00A5AD 81               [ 4]  158     ret 
                                    159 
                                    160 ;------------------------
                                    161 ; Prompted input for integer 
                                    162 ; display n+ in bracket and
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 134.
Hexadecimal [24-Bits]



                                    163 ; '?' 
                                    164 ; [N]? ( n+ -- a )
                                    165 ;------------------------
      00A5AE A5 81                  166     .word LINK 
                           002530   167     LINK=.
      00A5B0 04                     168     .byte 4
      00A5B1 5B 4E 5D 3F            169     .ascii "[N]?" 
      00A5B5                        170 INTQ:
      00A5B5 CD 90 E8         [ 4]  171     CALL CR 
      00A5B8 CD 84 F0         [ 4]  172     call DOLIT 
      00A5BB 00 5B                  173     .word '[
      00A5BD CD 84 B7         [ 4]  174     CALL EMIT 
      00A5C0 CD 91 8E         [ 4]  175     CALL DOT 
      00A5C3 CD 91 15         [ 4]  176     CALL  DOTQP
      00A5C6 03                     177     .byte 3
      00A5C7 5D 3F 20               178     .ascii "]? " 
      00A5CA CD 95 1C         [ 4]  179     CALL QUERY 
      00A5CD CD 93 47         [ 4]  180     call TOKEN 
      00A5D0 CC 8F 9F         [ 2]  181     jp NUMBQ
                                    182 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 135.
Hexadecimal [24-Bits]



                                   4671 .endif
                           000000  4672 .if WANT_DOUBLE 
                                   4673         .include "double.asm"
                                   4674 .endif 
                           000000  4675 .if WANT_FLOAT 
                                   4676         .include "float.asm"
                                   4677 .endif 
                           000001  4678 .if WANT_FLOAT24 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 136.
Hexadecimal [24-Bits]



                                   4679         .include "float24.asm"
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
      002553                         45     _HEADER FVER,9,"FLOAT-VER"
      00A5D3 A5 B0                    1         .word LINK 
                           002555     2         LINK=.
      00A5D5 09                       3         .byte 9  
      00A5D6 46 4C 4F 41 54 2D 56     4         .ascii "FLOAT-VER"
             45 52
      00A5DF                          5         FVER:
      00A5DF CD 90 E8         [ 4]   46     CALL CR 
      00A5E2 CD 91 15         [ 4]   47     CALL DOTQP 
      00A5E5 11                      48     .byte  17 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 137.
Hexadecimal [24-Bits]



      00A5E6 66 6C 6F 61 74 32 34    49     .ascii "float24 library, "
             20 6C 69 62 72 61 72
             79 2C 20
      00A5F7 CD 9C B8         [ 4]   50     CALL PRT_LICENCE 
      00A5FA CD 9C 90         [ 4]   51     CALL COPYRIGHT 
      00257D                         52     _DOLIT F24_MAJOR     
      00A5FD CD 84 F0         [ 4]    1     CALL DOLIT 
      00A600 00 01                    2     .word F24_MAJOR 
      002582                         53     _DOLIT F24_MINOR 
      00A602 CD 84 F0         [ 4]    1     CALL DOLIT 
      00A605 00 00                    2     .word F24_MINOR 
      00A607 CC 9C CC         [ 2]   54     JP PRINT_VERSION 
                                     55 
                                     56 
                                     57 ;-------------------------
                                     58 ;    FPSW ( -- a )
                                     59 ;    floating state variable
                                     60 ;    bit 0 zero flag 
                                     61 ;    bit 1 negative flag 
                                     62 ;    bit 2 overflow/error flag 
                                     63 ;---------------------------
      00258A                         64     _HEADER FPSW,4,"FPSW"
      00A60A A5 D5                    1         .word LINK 
                           00258C     2         LINK=.
      00A60C 04                       3         .byte 4  
      00A60D 46 50 53 57              4         .ascii "FPSW"
      00A611                          5         FPSW:
      00A611 90 AE 00 08      [ 2]   65 	LDW Y,#UFPSW  
      00A615 1D 00 02         [ 2]   66 	SUBW X,#2
      00A618 FF               [ 2]   67     LDW (X),Y
      00A619 81               [ 4]   68     RET
                                     69 
                                     70 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     71 ;   FRESET ( -- )
                                     72 ;   reset FPSW variable 
                                     73 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
      00259A                         74     _HEADER FRESET,6,"FRESET"
      00A61A A6 0C                    1         .word LINK 
                           00259C     2         LINK=.
      00A61C 06                       3         .byte 6  
      00A61D 46 52 45 53 45 54        4         .ascii "FRESET"
      00A623                          5         FRESET:
      00A623 CD 8C 8F         [ 4]   75     CALL ZERO  
      00A626 CD A6 11         [ 4]   76     CALL FPSW 
      00A629 CD 85 52         [ 4]   77     CALL STORE 
      00A62C 81               [ 4]   78     RET 
                                     79 
                                     80 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     81 ;   FINIT ( -- )
                                     82 ;   initialize floating point 
                                     83 ;   library 
                                     84 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0025AD                         85     _HEADER FINIT,5,"FINIT"
      00A62D A6 1C                    1         .word LINK 
                           0025AF     2         LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 138.
Hexadecimal [24-Bits]



      00A62F 05                       3         .byte 5  
      00A630 46 49 4E 49 54           4         .ascii "FINIT"
      00A635                          5         FINIT:
      00A635 CD A6 23         [ 4]   86     CALL FRESET 
      00A638 81               [ 4]   87     RET 
                                     88 
                                     89 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     90 ;    FER ( -- u )
                                     91 ;    return FPSW value 
                                     92 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0025B9                         93     _HEADER FER,3,"FER"
      00A639 A6 2F                    1         .word LINK 
                           0025BB     2         LINK=.
      00A63B 03                       3         .byte 3  
      00A63C 46 45 52                 4         .ascii "FER"
      00A63F                          5         FER:
      00A63F CD A6 11         [ 4]   94     CALL FPSW 
      00A642 CD 85 64         [ 4]   95     CALL AT 
      00A645 81               [ 4]   96     RET 
                                     97 
                                     98 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     99 ;    FZE  ( -- 0|-1 )
                                    100 ;    return FPSW zero flag 
                                    101 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0025C6                        102     _HEADER FZE,3,"FZE"
      00A646 A6 3B                    1         .word LINK 
                           0025C8     2         LINK=.
      00A648 03                       3         .byte 3  
      00A649 46 5A 45                 4         .ascii "FZE"
      00A64C                          5         FZE:
      00A64C CD A6 11         [ 4]  103     CALL FPSW
      00A64F CD 85 64         [ 4]  104     CALL AT  
      00A652 CD 8C 9A         [ 4]  105     CALL ONE 
      00A655 CD 86 F7         [ 4]  106     CALL ANDD
      00A658 CD 89 07         [ 4]  107     CALL NEGAT  
      00A65B 81               [ 4]  108     RET 
                                    109 
                                    110 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    111 ;    FNE ( -- 0|-1 )
                                    112 ;    return FPSW negative flag 
                                    113 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0025DC                        114     _HEADER FNE,3,"FNE"
      00A65C A6 48                    1         .word LINK 
                           0025DE     2         LINK=.
      00A65E 03                       3         .byte 3  
      00A65F 46 4E 45                 4         .ascii "FNE"
      00A662                          5         FNE:
      00A662 CD A6 11         [ 4]  115     CALL FPSW 
      00A665 CD 85 64         [ 4]  116     CALL AT 
      0025E8                        117     _DOLIT 2 
      00A668 CD 84 F0         [ 4]    1     CALL DOLIT 
      00A66B 00 02                    2     .word 2 
      00A66D CD 86 F7         [ 4]  118     CALL ANDD
      00A670 CD 8C 75         [ 4]  119     CALL TWOSL
      00A673 CD 89 07         [ 4]  120     CALL NEGAT   
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 139.
Hexadecimal [24-Bits]



      00A676 81               [ 4]  121     RET 
                                    122 
                                    123 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    124 ;   FOV (  -- 0|-1 )
                                    125 ;   return FPSW overflow flag 
                                    126 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0025F7                        127     _HEADER FOV,3,"FOV"
      00A677 A6 5E                    1         .word LINK 
                           0025F9     2         LINK=.
      00A679 03                       3         .byte 3  
      00A67A 46 4F 56                 4         .ascii "FOV"
      00A67D                          5         FOV:
      00A67D CD A6 11         [ 4]  128     CALL FPSW
      00A680 CD 85 64         [ 4]  129     CALL AT  
      002603                        130     _DOLIT 4 
      00A683 CD 84 F0         [ 4]    1     CALL DOLIT 
      00A686 00 04                    2     .word 4 
      00A688 CD 86 F7         [ 4]  131     CALL ANDD
      00260B                        132     _DOLIT 2 
      00A68B CD 84 F0         [ 4]    1     CALL DOLIT 
      00A68E 00 02                    2     .word 2 
      00A690 CD 8C 5D         [ 4]  133     CALL RSHIFT 
      00A693 CD 89 07         [ 4]  134     CALL NEGAT  
      00A696 81               [ 4]  135     RET 
                                    136 
                                    137 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    138 ;    SFZ ( f# -- f# )
                                    139 ;    set FPSW zero flag 
                                    140 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002617                        141     _HEADER SFZ,3,"SFZ"
      00A697 A6 79                    1         .word LINK 
                           002619     2         LINK=.
      00A699 03                       3         .byte 3  
      00A69A 53 46 5A                 4         .ascii "SFZ"
      00A69D                          5         SFZ:
      00A69D CD A6 3F         [ 4]  142     CALL FER 
      002620                        143     _DOLIT 0xfffe 
      00A6A0 CD 84 F0         [ 4]    1     CALL DOLIT 
      00A6A3 FF FE                    2     .word 0xfffe 
      00A6A5 CD 86 F7         [ 4]  144     CALL ANDD 
      00A6A8 CD 86 63         [ 4]  145     CALL TOR    
      00A6AB CD 86 C2         [ 4]  146     CALL OVER  
      00A6AE CD 86 E3         [ 4]  147     CALL ZEQUAL 
      002631                        148     _DOLIT 1 
      00A6B1 CD 84 F0         [ 4]    1     CALL DOLIT 
      00A6B4 00 01                    2     .word 1 
      00A6B6 CD 86 F7         [ 4]  149     CALL ANDD 
      00A6B9 CD 85 B5         [ 4]  150     CALL RFROM 
      00A6BC CD 87 0B         [ 4]  151     CALL ORR 
      00A6BF CD A6 11         [ 4]  152     CALL FPSW 
      00A6C2 CD 85 52         [ 4]  153     CALL STORE 
      00A6C5 81               [ 4]  154     RET 
                                    155 
                                    156 
                                    157 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 140.
Hexadecimal [24-Bits]



                                    158 ;   SFN ( f# -- f# )
                                    159 ;   set FPSW negative flag 
                                    160 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002646                        161     _HEADER SFN,3,"SFN"
      00A6C6 A6 99                    1         .word LINK 
                           002648     2         LINK=.
      00A6C8 03                       3         .byte 3  
      00A6C9 53 46 4E                 4         .ascii "SFN"
      00A6CC                          5         SFN:
      00A6CC CD A6 3F         [ 4]  162     CALL FER 
      00264F                        163     _DOLIT 0xFFFD 
      00A6CF CD 84 F0         [ 4]    1     CALL DOLIT 
      00A6D2 FF FD                    2     .word 0xFFFD 
      00A6D4 CD 86 F7         [ 4]  164     CALL ANDD  
      00A6D7 CD 86 63         [ 4]  165     CALL TOR 
      00A6DA CD 86 C2         [ 4]  166     CALL OVER 
      00265D                        167     _DOLIT 15 
      00A6DD CD 84 F0         [ 4]    1     CALL DOLIT 
      00A6E0 00 0F                    2     .word 15 
      00A6E2 CD 8C 5D         [ 4]  168     CALL RSHIFT 
      00A6E5 CD 85 B5         [ 4]  169     CALL RFROM 
      00A6E8 CD 87 0B         [ 4]  170     CALL ORR 
      00A6EB CD A6 11         [ 4]  171     CALL FPSW 
      00A6EE CD 85 52         [ 4]  172     CALL STORE 
      00A6F1 81               [ 4]  173     RET 
                                    174 
                                    175 
                                    176 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    177 ;   SFV ( -- )
                                    178 ;   set overflow flag 
                                    179 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002672                        180     _HEADER SFV,3,"SFV"
      00A6F2 A6 C8                    1         .word LINK 
                           002674     2         LINK=.
      00A6F4 03                       3         .byte 3  
      00A6F5 53 46 56                 4         .ascii "SFV"
      00A6F8                          5         SFV:
      00A6F8 CD A6 3F         [ 4]  181     CALL FER 
      00267B                        182     _DOLIT 4 
      00A6FB CD 84 F0         [ 4]    1     CALL DOLIT 
      00A6FE 00 04                    2     .word 4 
      00A700 CD 87 0B         [ 4]  183     CALL ORR 
      00A703 CD A6 11         [ 4]  184     CALL FPSW 
      00A706 CD 85 52         [ 4]  185     CALL STORE 
      00A709 81               [ 4]  186     RET 
                                    187 
                                    188 
                                    189 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    190 ;   E. ( f# -- )
                                    191 ;   print float24 in scientific 
                                    192 ;   format 
                                    193 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00268A                        194     _HEADER EDOT,2,"E."
      00A70A A6 F4                    1         .word LINK 
                           00268C     2         LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 141.
Hexadecimal [24-Bits]



      00A70C 02                       3         .byte 2  
      00A70D 45 2E                    4         .ascii "E."
      00A70F                          5         EDOT:
      00A70F CD 87 60         [ 4]  195     CALL BASE 
      00A712 CD 85 64         [ 4]  196     CALL AT 
      00A715 CD 86 63         [ 4]  197     CALL TOR 
      002698                        198     _DOLIT 10 
      00A718 CD 84 F0         [ 4]    1     CALL DOLIT 
      00A71B 00 0A                    2     .word 10 
      00A71D CD 87 60         [ 4]  199     CALL BASE 
      00A720 CD 85 52         [ 4]  200     CALL STORE 
      00A723                        201 EDOT0:
      00A723 CD 86 63         [ 4]  202     CALL TOR   ; R: e 
      00A726 CD 89 6D         [ 4]  203     CALL ABSS 
      00A729 CD 90 A5         [ 4]  204     CALL SPACE 
      00A72C CD 8E 97         [ 4]  205     CALL BDIGS     
      00A72F                        206 EDOT2: 
      00A72F CD 8E C0         [ 4]  207     CALL DIG
      00A732 CD 85 B5         [ 4]  208     CALL RFROM 
      00A735 CD 8C 23         [ 4]  209     CALL ONEP 
      00A738 CD 86 63         [ 4]  210     CALL TOR 
      00A73B CD 86 9A         [ 4]  211     CALL DUPP
      0026BE                        212     _DOLIT 10 
      00A73E CD 84 F0         [ 4]    1     CALL DOLIT 
      00A741 00 0A                    2     .word 10 
      00A743 CD 89 A7         [ 4]  213     CALL LESS 
      0026C6                        214     _QBRAN EDOT2 
      00A746 CD 85 19         [ 4]    1     CALL QBRAN
      00A749 A7 2F                    2     .word EDOT2
      0026CB                        215     _DOLIT '.'
      00A74B CD 84 F0         [ 4]    1     CALL DOLIT 
      00A74E 00 2E                    2     .word '.' 
      00A750 CD 8E A7         [ 4]  216     CALL HOLD  
      00A753 CD 8E C0         [ 4]  217     CALL DIG
      00A756 CD A6 62         [ 4]  218     CALL FNE 
      0026D9                        219     _QBRAN EDOT4 
      00A759 CD 85 19         [ 4]    1     CALL QBRAN
      00A75C A7 66                    2     .word EDOT4
      0026DE                        220     _DOLIT '-'
      00A75E CD 84 F0         [ 4]    1     CALL DOLIT 
      00A761 00 2D                    2     .word '-' 
      00A763 CD 8E A7         [ 4]  221     CALL HOLD 
      00A766                        222 EDOT4:       
      00A766 CD 8E FC         [ 4]  223     CALL EDIGS 
      00A769 CD 90 CF         [ 4]  224     CALL TYPES
      00A76C CD 85 B5         [ 4]  225     CALL RFROM 
      00A76F CD 88 4D         [ 4]  226     CALL QDUP 
      0026F2                        227     _QBRAN EDOT5     
      00A772 CD 85 19         [ 4]    1     CALL QBRAN
      00A775 A7 82                    2     .word EDOT5
      0026F7                        228     _DOLIT 'E'
      00A777 CD 84 F0         [ 4]    1     CALL DOLIT 
      00A77A 00 45                    2     .word 'E' 
      00A77C CD 84 B7         [ 4]  229     CALL EMIT 
      00A77F CD 91 8E         [ 4]  230     CALL DOT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 142.
Hexadecimal [24-Bits]



      00A782                        231 EDOT5: 
      00A782 CD 85 B5         [ 4]  232     CALL RFROM 
      00A785 CD 87 60         [ 4]  233     CALL BASE 
      00A788 CD 85 52         [ 4]  234     CALL STORE  
      00A78B 81               [ 4]  235     RET 
                                    236 
                                    237 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                    238 ;   F. (f# -- )
                                    239 ;   print float in fixed
                                    240 ;   point format. 
                                    241 ;;;;;;;;;;;;;;;;;;;;;;;;;
      00270C                        242     _HEADER FDOT,2,"F."
      00A78C A7 0C                    1         .word LINK 
                           00270E     2         LINK=.
      00A78E 02                       3         .byte 2  
      00A78F 46 2E                    4         .ascii "F."
      00A791                          5         FDOT:
      00A791 CD 87 60         [ 4]  243     CALL BASE 
      00A794 CD 85 64         [ 4]  244     CALL AT 
      00A797 CD 86 63         [ 4]  245     CALL TOR 
      00271A                        246     _DOLIT 10 
      00A79A CD 84 F0         [ 4]    1     CALL DOLIT 
      00A79D 00 0A                    2     .word 10 
      00A79F CD 87 60         [ 4]  247     CALL BASE 
      00A7A2 CD 85 52         [ 4]  248     CALL STORE 
      00A7A5 CD 86 9A         [ 4]  249     CALL    DUPP  
      00A7A8 CD 89 6D         [ 4]  250     CALL    ABSS 
      00272B                        251     _DOLIT  8
      00A7AB CD 84 F0         [ 4]    1     CALL DOLIT 
      00A7AE 00 08                    2     .word 8 
      00A7B0 CD 89 D4         [ 4]  252     CALL    GREAT 
      002733                        253     _QBRAN  FDOT1 
      00A7B3 CD 85 19         [ 4]    1     CALL QBRAN
      00A7B6 A7 BB                    2     .word FDOT1
      00A7B8 CC A7 23         [ 2]  254     JP      EDOT0 
      00A7BB                        255 FDOT1:
      00A7BB CD 90 A5         [ 4]  256     CALL    SPACE 
      00A7BE CD 86 63         [ 4]  257     CALL    TOR 
      00A7C1 CD A6 62         [ 4]  258     CALL    FNE 
      002744                        259     _QBRAN  FDOT0 
      00A7C4 CD 85 19         [ 4]    1     CALL QBRAN
      00A7C7 A7 CC                    2     .word FDOT0
      00A7C9 CD 89 07         [ 4]  260     CALL    NEGAT 
      00A7CC                        261 FDOT0: 
      00A7CC CD 8E 97         [ 4]  262     CALL    BDIGS
      00A7CF CD 85 C6         [ 4]  263     CALL    RAT  
      00A7D2 CD 86 D1         [ 4]  264     CALL    ZLESS 
      002755                        265     _QBRAN  FDOT6 
      00A7D5 CD 85 19         [ 4]    1     CALL QBRAN
      00A7D8 A7 FD                    2     .word FDOT6
      00A7DA                        266 FDOT2: ; e<0 
      00A7DA CD 8E C0         [ 4]  267     CALL    DIG 
      00A7DD CD 85 B5         [ 4]  268     CALL    RFROM
      00A7E0 CD 8C 23         [ 4]  269     CALL    ONEP 
      00A7E3 CD 88 4D         [ 4]  270     CALL    QDUP  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 143.
Hexadecimal [24-Bits]



      002766                        271     _QBRAN  FDOT3 
      00A7E6 CD 85 19         [ 4]    1     CALL QBRAN
      00A7E9 A7 F0                    2     .word FDOT3
      00A7EB CD 86 63         [ 4]  272     CALL    TOR 
      00A7EE 20 EA            [ 2]  273     JRA   FDOT2 
      00A7F0                        274 FDOT3:
      002770                        275     _DOLIT  '.' 
      00A7F0 CD 84 F0         [ 4]    1     CALL DOLIT 
      00A7F3 00 2E                    2     .word '.' 
      00A7F5 CD 8E A7         [ 4]  276     CALL    HOLD 
      00A7F8 CD 8E D1         [ 4]  277     CALL    DIGS
      00A7FB 20 12            [ 2]  278     JRA   FDOT9  
      00A7FD                        279 FDOT6: ; e>=0 
      00A7FD 20 08            [ 2]  280     JRA   FDOT8
      00A7FF                        281 FDOT7:     
      00277F                        282     _DOLIT  '0'
      00A7FF CD 84 F0         [ 4]    1     CALL DOLIT 
      00A802 00 30                    2     .word '0' 
      00A804 CD 8E A7         [ 4]  283     CALL    HOLD 
      00A807                        284 FDOT8:
      002787                        285     _DONXT FDOT7 
      00A807 CD 85 04         [ 4]    1     CALL DONXT 
      00A80A A7 FF                    2     .word FDOT7 
      00A80C CD 8E D1         [ 4]  286     CALL    DIGS 
      00A80F                        287 FDOT9:
      00A80F CD A6 62         [ 4]  288     CALL    FNE 
      002792                        289     _QBRAN  FDOT10 
      00A812 CD 85 19         [ 4]    1     CALL QBRAN
      00A815 A8 1F                    2     .word FDOT10
      002797                        290     _DOLIT '-' 
      00A817 CD 84 F0         [ 4]    1     CALL DOLIT 
      00A81A 00 2D                    2     .word '-' 
      00A81C CD 8E A7         [ 4]  291     CALL   HOLD 
      00A81F                        292 FDOT10:
      00A81F CD 8E FC         [ 4]  293     CALL    EDIGS 
      00A822 CD 90 CF         [ 4]  294     CALL    TYPES 
      00A825 CD 85 B5         [ 4]  295     CALL    RFROM 
      00A828 CD 87 60         [ 4]  296     CALL    BASE 
      00A82B CD 85 52         [ 4]  297     CALL    STORE 
      00A82E 81               [ 4]  298     RET 
                                    299 
                                    300 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    301 ;    number parser 
                                    302 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    303 
                                    304 ; check for negative sign 
                                    305 ; ajust pointer and cntr 
      00A82F                        306 nsign: ; ( addr cntr -- addr cntr f ) 
      00A82F 1D 00 02         [ 2]  307     SUBW X,#CELLL ; a cntr f 
      00A832 90 93            [ 1]  308     LDW Y,X 
      00A834 90 EE 04         [ 2]  309     LDW Y,(4,Y) ; addr 
      00A837 90 F6            [ 1]  310     LD A,(Y) ; char=*addr  
      00A839 A1 2D            [ 1]  311     CP A,#'-' 
      00A83B 27 03            [ 1]  312     JREQ NEG_SIGN 
      00A83D 4F               [ 1]  313     CLR A  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 144.
Hexadecimal [24-Bits]



      00A83E 20 18            [ 2]  314     JRA STO_SIGN 
      00A840                        315 NEG_SIGN:
                                    316 ; increment addr 
      00A840 90 93            [ 1]  317     LDW Y,X 
      00A842 90 EE 04         [ 2]  318     LDW Y,(4,Y)
      00A845 72 A9 00 01      [ 2]  319     ADDW Y,#1   ;addr+1 
      00A849 EF 04            [ 2]  320     LDW (4,X),Y 
                                    321 ; decrement cntr 
      00A84B 90 93            [ 1]  322     LDW Y,X
      00A84D 90 EE 02         [ 2]  323     LDW Y,(2,Y)
      00A850 72 A2 00 01      [ 2]  324     SUBW Y,#1   ;cntr-1 
      00A854 EF 02            [ 2]  325     LDW (2,X),Y 
      00A856 A6 FF            [ 1]  326     LD A,#0XFF
      00A858                        327 STO_SIGN:   
      00A858 F7               [ 1]  328     LD (X),A 
      00A859 E7 01            [ 1]  329     LD (1,X),A 
      00A85B 81               [ 4]  330     RET 
                                    331 
                                    332 
                                    333 ; get all digits in row 
                                    334 ; stop at first non-digit or end of string 
                                    335 ; ( n a cntr -- n  a+ cntr-  )
      00A85C                        336 parse_digits:
      00A85C CD 86 9A         [ 4]  337     CALL DUPP 
      0027DF                        338     _QBRAN parse_d5  
      00A85F CD 85 19         [ 4]    1     CALL QBRAN
      00A862 A8 9E                    2     .word parse_d5
      00A864 CD 86 63         [ 4]  339     CALL TOR   ; n a R: cntr 
      00A867 CD 8D 52         [ 4]  340     CALL COUNT ; n a+ char 
      00A86A CD 87 60         [ 4]  341     CALL BASE 
      00A86D CD 85 64         [ 4]  342     CALL AT 
      00A870 CD 8F 5B         [ 4]  343     CALL DIGTQ 
      0027F3                        344     _QBRAN parse_d4 ; not a digit
      00A873 CD 85 19         [ 4]    1     CALL QBRAN
      00A876 A8 92                    2     .word parse_d4
      00A878 CD 88 5E         [ 4]  345     CALL ROT 
      00A87B CD 87 60         [ 4]  346     CALL BASE 
      00A87E CD 85 64         [ 4]  347     CALL AT 
      00A881 CD 8B A2         [ 4]  348     CALL STAR
      00A884 CD 88 BD         [ 4]  349     CALL PLUS
      00A887 CD 86 AA         [ 4]  350     CALL SWAPP  
      00A88A CD 85 B5         [ 4]  351     CALL RFROM  ; n a+ cntr 
      00A88D CD 8C 30         [ 4]  352     CALL ONEM 
      00A890 20 CA            [ 2]  353     JRA parse_digits ; n a+ cntr  
      00A892                        354 parse_d4: ; n a+ char R: cntr 
      00A892 90 93            [ 1]  355     LDW Y,X 
      00A894 90 EE 02         [ 2]  356     LDW Y,(2,Y)
      00A897 90 5A            [ 2]  357     DECW Y  ; dec(a)
      00A899 EF 02            [ 2]  358     LDW (2,X),Y 
      00A89B 90 85            [ 2]  359     POPW Y 
      00A89D FF               [ 2]  360     LDW (X),Y ; n a cntr  
      00A89E                        361 parse_d5:
      00A89E 81               [ 4]  362     RET 
                                    363 
                                    364 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 145.
Hexadecimal [24-Bits]



                                    365      
                                    366 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    367 ; return parsed exponent or 
                                    368 ; 0 if failed
                                    369 ; at entry exprect *a=='E'    
                                    370 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00A89F                        371 parse_exponent: ; a cntr -- e -1 | 0 
      00A89F CD 86 63         [ 4]  372     CALL TOR   ; R: cntr 
      00A8A2 CD 86 9A         [ 4]  373     CALL DUPP 
      00A8A5 CD 85 82         [ 4]  374     CALL CAT 
      002828                        375     _DOLIT 'E' 
      00A8A8 CD 84 F0         [ 4]    1     CALL DOLIT 
      00A8AB 00 45                    2     .word 'E' 
      00A8AD CD 89 7B         [ 4]  376     CALL EQUAL 
      002830                        377     _QBRAN 1$
      00A8B0 CD 85 19         [ 4]    1     CALL QBRAN
      00A8B3 A8 DD                    2     .word 1$
      00A8B5 CD 8C 23         [ 4]  378     CALL ONEP 
      00A8B8 CD 85 B5         [ 4]  379     CALL RFROM  ; a cntr 
      00A8BB CD 8C 30         [ 4]  380     CALL ONEM
      00A8BE CD 86 9A         [ 4]  381     CALL DUPP 
      002841                        382     _QBRAN 2$ ; a cntr 
      00A8C1 CD 85 19         [ 4]    1     CALL QBRAN
      00A8C4 A8 E0                    2     .word 2$
      00A8C6 CD 8C 8F         [ 4]  383     CALL ZERO
      00A8C9 CD 88 7D         [ 4]  384     CALL NROT ;  0 a cntr  
      00A8CC CD A8 2F         [ 4]  385     CALL nsign 
      00A8CF CD 86 63         [ 4]  386     CALL TOR   ; R: esign  
      00A8D2 CD A8 5C         [ 4]  387     CALL parse_digits
      002855                        388     _QBRAN PARSEXP_SUCCESS ; parsed to end of string 
      00A8D5 CD 85 19         [ 4]    1     CALL QBRAN
      00A8D8 A8 E7                    2     .word PARSEXP_SUCCESS
                                    389 ; failed invalid character
      00285A                        390     _DDROP ; 0 a 
      00A8DA 1C 00 04         [ 2]    1    ADDW X,#2*CELLL 
      00A8DD                        391 1$: 
      00A8DD CD 85 B5         [ 4]  392     CALL RFROM ; sign||cntr  
      00A8E0                        393 2$:
      002860                        394     _DDROP  ; a cntr || a sign || 0 cntr   
      00A8E0 1C 00 04         [ 2]    1    ADDW X,#2*CELLL 
      00A8E3 CD 8C 8F         [ 4]  395     CALL ZERO   ; return only 0 
      00A8E6 81               [ 4]  396     RET 
      00A8E7                        397 PARSEXP_SUCCESS: ; n a  
      002867                        398     _DROP ; n  
      00A8E7 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00A8EA CD 85 B5         [ 4]  399     CALL RFROM ; esign  
      00286D                        400     _QBRAN 1$
      00A8ED CD 85 19         [ 4]    1     CALL QBRAN
      00A8F0 A8 F5                    2     .word 1$
      00A8F2 CD 89 07         [ 4]  401     CALL NEGAT
      00A8F5                        402 1$:
      002875                        403     _DOLIT -1 ; -- e -1 
      00A8F5 CD 84 F0         [ 4]    1     CALL DOLIT 
      00A8F8 FF FF                    2     .word -1 
      00A8FA 81               [ 4]  404     RET 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 146.
Hexadecimal [24-Bits]



                                    405 
                                    406 
                                    407 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    408 ;   FLOAT?  ( a n a+ cnt sign  -- f24 -3 | a 0 )
                                    409 ;   called by NUMBER? 
                                    410 ;   convert string to float 
                                    411 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00287B                        412     _HEADER FLOATQ,5,"FLOAT?"
      00A8FB A7 8E                    1         .word LINK 
                           00287D     2         LINK=.
      00A8FD 05                       3         .byte 5  
      00A8FE 46 4C 4F 41 54 3F        4         .ascii "FLOAT?"
      00A904                          5         FLOATQ:
                                    413 ; BASE must be 10 
      00A904 CD 87 60         [ 4]  414     CALL BASE 
      00A907 CD 85 64         [ 4]  415     CALL AT 
      00288A                        416     _DOLIT 10 
      00A90A CD 84 F0         [ 4]    1     CALL DOLIT 
      00A90D 00 0A                    2     .word 10 
      00A90F CD 89 7B         [ 4]  417     CALL EQUAL 
      002892                        418     _QBRAN FLOAT_ERROR 
      00A912 CD 85 19         [ 4]    1     CALL QBRAN
      00A915 A9 A3                    2     .word FLOAT_ERROR
                                    419 ; if float next char is '.' or 'E' 
      00A917 CD 86 63         [ 4]  420     CALL TOR ; R: sign  
      00A91A CD 86 63         [ 4]  421     CALL TOR ; R: sign cntr 
      00A91D CD 86 9A         [ 4]  422     CALL DUPP
      00A920 CD 85 82         [ 4]  423     CALL CAT 
      0028A3                        424     _DOLIT '.' 
      00A923 CD 84 F0         [ 4]    1     CALL DOLIT 
      00A926 00 2E                    2     .word '.' 
      00A928 CD 89 7B         [ 4]  425     CALL EQUAL 
      0028AB                        426     _QBRAN FLOATQ1 ; not a dot 
      00A92B CD 85 19         [ 4]    1     CALL QBRAN
      00A92E A9 63                    2     .word FLOATQ1
      00A930 CD 8C 23         [ 4]  427     CALL ONEP 
      00A933 CD 85 B5         [ 4]  428     CALL RFROM  ; a  n a+ cntr R: sign  
      00A936 CD 8C 30         [ 4]  429     CALL ONEM 
      00A939 CD 86 9A         [ 4]  430     CALL DUPP 
      00A93C CD 86 63         [ 4]  431     CALL TOR  ; R: sign cntr 
                                    432 ; parse fractional part
      00A93F CD A8 5C         [ 4]  433     CALL parse_digits ; a n a+ cntr -- n a cntr 
      00A942 CD 86 9A         [ 4]  434     CALL DUPP 
      00A945 CD 85 B5         [ 4]  435     CALL RFROM 
      00A948 CD 86 AA         [ 4]  436     CALL SWAPP 
      00A94B CD 89 53         [ 4]  437     CALL SUBB ; fd -> fraction digits count 
      00A94E CD 86 63         [ 4]  438     CALL TOR  ; n a cntr R: sign fd 
      00A951 CD 86 9A         [ 4]  439     CALL DUPP ; cntr cntr  
      0028D4                        440     _QBRAN 1$ ; end of string, no exponent
      00A954 CD 85 19         [ 4]    1     CALL QBRAN
      00A957 A9 5B                    2     .word 1$
      00A959 20 11            [ 2]  441     JRA FLOATQ2
      00A95B CD 86 AA         [ 4]  442 1$: CALL SWAPP 
      0028DE                        443     _DROP ; a
      00A95E 1C 00 02         [ 2]    1     ADDW X,#CELLL  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 147.
Hexadecimal [24-Bits]



      00A961 20 11            [ 2]  444     JRA FLOATQ3        
      00A963                        445 FLOATQ1: ; must push fd==0 on RSTACK 
      00A963 CD 85 B5         [ 4]  446     CALL RFROM ; cntr 
      00A966 CD 8C 8F         [ 4]  447     CALL ZERO  ; fd 
      00A969 CD 86 63         [ 4]  448     CALL TOR   ; m a cntr R: sign fd 
      00A96C                        449 FLOATQ2: 
      00A96C CD A8 9F         [ 4]  450     CALL parse_exponent 
      0028EF                        451     _QBRAN FLOAT_ERROR0 ; exponent expected 
      00A96F CD 85 19         [ 4]    1     CALL QBRAN
      00A972 A9 9D                    2     .word FLOAT_ERROR0
      00A974                        452 FLOATQ3: ; m 0 || m e  
      00A974 CD 85 B5         [ 4]  453     CALL RFROM ;  fd  
      00A977 CD 89 53         [ 4]  454     CALL SUBB  ; exp=e-fd 
      00A97A CD 86 AA         [ 4]  455     CALL SWAPP  
      00A97D CD 85 B5         [ 4]  456     CALL RFROM  ; sign 
      002900                        457     _QBRAN FLOATQ4 
      00A980 CD 85 19         [ 4]    1     CALL QBRAN
      00A983 A9 88                    2     .word FLOATQ4
      00A985 CD 89 07         [ 4]  458     CALL NEGAT 
      00A988                        459 FLOATQ4:
      00A988 CD 88 5E         [ 4]  460     CALL ROT  
      00290B                        461     _DROP 
      00A98B 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00A98E CD 86 AA         [ 4]  462     CALL SWAPP ; m e 
      00A991 CD A6 CC         [ 4]  463     CALL SFN 
      00A994 CD A6 9D         [ 4]  464     CALL SFZ 
      002917                        465     _DOLIT -3 
      00A997 CD 84 F0         [ 4]    1     CALL DOLIT 
      00A99A FF FD                    2     .word -3 
      00A99C 81               [ 4]  466     RET       
      00A99D                        467 FLOAT_ERROR0: 
      00A99D CD 85 B5         [ 4]  468     CALL RFROM ; df 
      00A9A0 CD 85 B5         [ 4]  469     CALL RFROM ; df sign 
      00A9A3                        470 FLOAT_ERROR: 
      00A9A3 CD 8C D1         [ 4]  471     CALL DEPTH 
      00A9A6 CD 8C 16         [ 4]  472     CALL CELLS 
      00A9A9 CD 86 7A         [ 4]  473     CALL SPAT 
      00A9AC CD 86 AA         [ 4]  474     CALL SWAPP 
      00A9AF CD 88 BD         [ 4]  475     CALL PLUS  
      00A9B2 CD 86 87         [ 4]  476     CALL SPSTO 
      00A9B5 CD 8C 8F         [ 4]  477     CALL ZERO 
      00A9B8 81               [ 4]  478     RET 
                                    479 
                                    480 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    481 ;  F24LITERAL ( f24 -- )
                                    482 ;  compile 24 bits literal 
                                    483 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002939                        484     _HEADER FLITER,COMPO+IMEDD+10,"F24LITERAL"
      00A9B9 A8 FD                    1         .word LINK 
                           00293B     2         LINK=.
      00A9BB CA                       3         .byte COMPO+IMEDD+10  
      00A9BC 46 32 34 4C 49 54 45     4         .ascii "F24LITERAL"
             52 41 4C
      00A9C6                          5         FLITER:
      00A9C6 CD 96 D0         [ 4]  485     CALL COMPI 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 148.
Hexadecimal [24-Bits]



      00A9C9 A9 D1                  486     .word dof24lit 
      00A9CB CD 96 A2         [ 4]  487     CALL CCOMMA 
      00A9CE CC 96 8B         [ 2]  488     JP   COMMA 
                                    489 
                                    490 
                                    491 ; runtime for F24LITERAL
                                    492 ; 24 bits literal 
      00A9D1                        493 dof24lit:
      00A9D1 1D 00 04         [ 2]  494     SUBW X,#4 
      00A9D4 16 01            [ 2]  495     LDW Y,(1,SP)
      00A9D6 90 F6            [ 1]  496     LD A,(Y)
      00A9D8 90 5F            [ 1]  497     CLRW Y 
      00A9DA 90 97            [ 1]  498     LD YL,A 
      00A9DC 4D               [ 1]  499     TNZ A 
      00A9DD 2A 04            [ 1]  500     JRPL 1$
      00A9DF A6 FF            [ 1]  501     LD A,#255 
      00A9E1 90 95            [ 1]  502     LD YH,A   
      00A9E3 FF               [ 2]  503 1$: LDW (X),Y 
      00A9E4 16 01            [ 2]  504     LDW Y,(1,SP)
      00A9E6 90 EE 02         [ 2]  505     LDW Y,(2,Y)
      00A9E9 EF 02            [ 2]  506     LDW (2,X),Y 
      00A9EB 90 85            [ 2]  507     POPW Y 
      00A9ED 90 EC 03         [ 2]  508     JP (3,Y)
                                    509 
                                    510 
                                    511 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    512 ;   F24CONST ( f24 -- )
                                    513 ;   create a float24 constant 
                                    514 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002970                        515     _HEADER F24CONST,8,"F24CONST" 
      00A9F0 A9 BB                    1         .word LINK 
                           002972     2         LINK=.
      00A9F2 08                       3         .byte 8  
      00A9F3 46 32 34 43 4F 4E 53     4         .ascii "F24CONST"
             54
      00A9FB                          5         F24CONST:
      00A9FB CD 93 47         [ 4]  516         CALL TOKEN
      00A9FE CD 98 89         [ 4]  517         CALL SNAME 
      00AA01 CD 99 20         [ 4]  518         CALL OVERT 
      00AA04 CD 96 D0         [ 4]  519         CALL COMPI 
      00AA07 AA 1E                  520         .word DOF24CONST
      00AA09 CD 96 A2         [ 4]  521         CALL CCOMMA
      00AA0C CD 96 8B         [ 4]  522         CALL COMMA  
      00AA0F CD A3 E4         [ 4]  523         CALL FMOVE
      00AA12 CD 88 4D         [ 4]  524         CALL QDUP 
      00AA15 CD 85 19         [ 4]  525         CALL QBRAN 
      00AA18 9A BD                  526         .word SET_RAMLAST  
      00AA1A CD A4 78         [ 4]  527         CALL UPDATPTR  
      00AA1D 81               [ 4]  528         RET          
                                    529 
      00AA1E                        530 DOF24CONST:
      00AA1E 16 01            [ 2]  531     LDW Y,(1,SP) 
      00AA20 1D 00 04         [ 2]  532     SUBW x,#2*CELLL 
      00AA23 90 F6            [ 1]  533     LD A,(Y)
      00AA25 90 5F            [ 1]  534     CLRW Y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 149.
Hexadecimal [24-Bits]



      00AA27 90 97            [ 1]  535     LD YL,A
      00AA29 4D               [ 1]  536     TNZ A 
      00AA2A 2A 04            [ 1]  537     JRPL 1$
      00AA2C A6 FF            [ 1]  538     LD A,#255
      00AA2E 90 95            [ 1]  539     LD YH,A 
      00AA30                        540 1$:      
      00AA30 FF               [ 2]  541     LDW (X),Y 
      00AA31 90 85            [ 2]  542     POPW Y 
      00AA33 90 EE 01         [ 2]  543     LDW Y,(1,Y)
      00AA36 EF 02            [ 2]  544     LDW (2,X),Y 
      00AA38 81               [ 4]  545     RET 
                                    546 
                                    547 
                                    548 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    549 ;   F24VAR "name" ( -- )
                                    550 ;   create a float24 variable 
                                    551 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0029B9                        552     _HEADER F24VAR,6,"F24VAR"
      00AA39 A9 F2                    1         .word LINK 
                           0029BB     2         LINK=.
      00AA3B 06                       3         .byte 6  
      00AA3C 46 32 34 56 41 52        4         .ascii "F24VAR"
      00AA42                          5         F24VAR:
      00AA42 CD 8D 69         [ 4]  553     CALL HERE
      00AA45 CD 86 9A         [ 4]  554     CALL DUPP
      0029C8                        555     _DOLIT 3  
      00AA48 CD 84 F0         [ 4]    1     CALL DOLIT 
      00AA4B 00 03                    2     .word 3 
      00AA4D CD 88 BD         [ 4]  556     CALL PLUS 
      00AA50 CD 87 F1         [ 4]  557     CALL VPP 
      00AA53 CD 85 52         [ 4]  558     CALL STORE
      00AA56 CD 9A 70         [ 4]  559     CALL CREAT
      00AA59 CD 86 9A         [ 4]  560     CALL DUPP
      00AA5C CD 96 8B         [ 4]  561     CALL COMMA
      00AA5F CD 8C 8F         [ 4]  562     CALL ZERO
      00AA62 CD 86 C2         [ 4]  563     CALL OVER 
      00AA65 CD 85 71         [ 4]  564     CALL CSTOR 
      00AA68 CD 8C 8F         [ 4]  565     CALL ZERO 
      00AA6B CD 86 AA         [ 4]  566     CALL SWAPP 
      00AA6E CD 8C 23         [ 4]  567     CALL ONEP  
      00AA71 CD 85 52         [ 4]  568     CALL STORE 
      00AA74 CD A3 E4         [ 4]  569     CALL FMOVE ; move definition to FLASH
      00AA77 CD 88 4D         [ 4]  570     CALL QDUP 
      00AA7A CD 85 19         [ 4]  571     CALL QBRAN 
      00AA7D 9A BD                  572     .word SET_RAMLAST   
      00AA7F CD 9E 8C         [ 4]  573     CALL UPDATVP  ; don't update if variable kept in RAM.
      00AA82 CC A4 78         [ 2]  574     JP UPDATPTR
                                    575 
                                    576 
                                    577 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    578 ;   F24! ( f24 a -- )
                                    579 ;   store float24 
                                    580 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002A05                        581     _HEADER F24STO,4,"F24!"
      00AA85 AA 3B                    1         .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 150.
Hexadecimal [24-Bits]



                           002A07     2         LINK=.
      00AA87 04                       3         .byte 4  
      00AA88 46 32 34 21              4         .ascii "F24!"
      00AA8C                          5         F24STO:
      00AA8C 90 93            [ 1]  582     LDW Y,X 
      00AA8E 90 FE            [ 2]  583     LDW Y,(Y) ; a 
      00AA90 E6 03            [ 1]  584     LD A,(3,X) ; e low  
      00AA92 90 F7            [ 1]  585     LD (Y),A
      00AA94 72 A9 00 01      [ 2]  586     ADDW Y,#1  
      00AA98 90 BF 26         [ 2]  587     LDW YTEMP,Y 
      00AA9B 90 93            [ 1]  588     LDW Y,X 
      00AA9D 90 EE 04         [ 2]  589     LDW Y,(4,Y) ; m 
      00AAA0 91 CF 26         [ 5]  590     LDW [YTEMP],Y 
      00AAA3 1C 00 06         [ 2]  591     ADDW X,#3*CELLL 
      00AAA6 81               [ 4]  592     RET 
                                    593 
                                    594 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    595 ;   F24@ ( a -- f24 )
                                    596 ;   stack float24 variable 
                                    597 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002A27                        598     _HEADER F24AT,4,"F24@"
      00AAA7 AA 87                    1         .word LINK 
                           002A29     2         LINK=.
      00AAA9 04                       3         .byte 4  
      00AAAA 46 32 34 40              4         .ascii "F24@"
      00AAAE                          5         F24AT:
      00AAAE 90 93            [ 1]  599     LDW Y,X 
      00AAB0 90 FE            [ 2]  600     LDW Y,(Y) ; a 
      00AAB2 90 89            [ 2]  601     PUSHW Y 
      00AAB4 1D 00 02         [ 2]  602     SUBW X,#CELLL 
      00AAB7 90 EE 01         [ 2]  603     LDW Y,(1,Y) ; m 
      00AABA EF 02            [ 2]  604     LDW (2,X),Y 
      00AABC 90 85            [ 2]  605     POPW Y   ; a 
      00AABE 90 F6            [ 1]  606     LD A,(Y) ; e 
      00AAC0 90 5F            [ 1]  607     CLRW Y 
      00AAC2 90 97            [ 1]  608     LD YL,A 
      00AAC4 4D               [ 1]  609     TNZ A 
      00AAC5 2A 04            [ 1]  610     JRPL 1$
      00AAC7 A6 FF            [ 1]  611     LD A,#255 
      00AAC9 90 95            [ 1]  612     LD YH,A 
      00AACB FF               [ 2]  613 1$: LDW (X),Y ; m e -- 
      00AACC 81               [ 4]  614     RET 
                                    615 
                                    616 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 151.
Hexadecimal [24-Bits]



                                   4680 .endif 
                                   4681 
                                   4682 ;===============================================================
                                   4683 
                           002A29  4684 LASTN =	LINK   ;last name defined
                                   4685 
                                   4686 ; application code begin here
      00AB00                       4687 	.bndry 128 ; align on flash block  
      00AB00                       4688 app_space: 
                                   4689 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 152.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   6 AB1        0008F6 R   |   6 ABOR1      0014D8 R
  6 ABOR2      0014EF R   |   6 ABORQ      0014D0 R   |   6 ABORT      0014C1 R
  6 ABRTQ      0017BB R   |   6 ABSS       0008ED R   |   6 ACCEP      001457 R
  6 ACCP1      001460 R   |   6 ACCP2      001486 R   |   6 ACCP3      001489 R
  6 ACCP4      00148B R   |     ADC_CR1 =  005401     |     ADC_CR1_=  000000 
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
    AFR7_BEE=  000007     |   6 AFT        0017A6 R   |   6 AGAIN      0016F0 R
  6 AHEAD      001753 R   |   6 ALLOT      0015FD R   |   6 ANDD       000677 R
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
  6 B9K6       0003AD R   |   6 BACK1      0013FF R   |   6 BASE       0006E0 R
    BASEE   =  00000A     |   6 BAUD       0003F1 R   |     BCNT    =  000001 
  6 BCOMP      001640 R   |   6 BDIGS      000E17 R   |     BEEP_BIT=  000004 
    BEEP_CSR=  0050F3     |     BEEP_MAS=  000010     |     BEEP_POR=  00000F 
  6 BEGIN      0016D2 R   |     BIT0    =  000000     |     BIT1    =  000001 
    BIT2    =  000002     |     BIT3    =  000003     |     BIT4    =  000004 
    BIT5    =  000005     |     BIT6    =  000006     |     BIT7    =  000007 
  6 BKSLA      001254 R   |   6 BKSP       0013CF R   |     BKSPP   =  000008 
  6 BLANK      000C02 R   |     BLOCK_SI=  000080     |     BOOT_ROM=  006000 
    BOOT_ROM=  007FFF     |   6 BRAN       0004B5 R   |     BTW     =  000001 
  6 BUF2ROW    0022D7 R   |   6 BYE        0000B6 R   |     CADR    =  000003 
    CALLL   =  0000CD     |   6 CALLOT     00246F R   |     CAN_DGR =  005426 
    CAN_FPSR=  005427     |     CAN_IER =  005425     |     CAN_MCR =  005420 
    CAN_MSR =  005421     |     CAN_P0  =  005428     |     CAN_P1  =  005429 
    CAN_P2  =  00542A     |     CAN_P3  =  00542B     |     CAN_P4  =  00542C 
    CAN_P5  =  00542D     |     CAN_P6  =  00542E     |     CAN_P7  =  00542F 
    CAN_P8  =  005430     |     CAN_P9  =  005431     |     CAN_PA  =  005432 
    CAN_PB  =  005433     |     CAN_PC  =  005434     |     CAN_PD  =  005435 
    CAN_PE  =  005436     |     CAN_PF  =  005437     |     CAN_RFR =  005424 
    CAN_TPR =  005423     |     CAN_TSR =  005422     |     CARRY   =  00002A 
    CASE_SEN=  000000     |   6 CAT        000502 R   |   6 CCOMMA     001622 R
    CC_C    =  000000     |     CC_H    =  000004     |     CC_I0   =  000003 
    CC_I1   =  000005     |     CC_N    =  000002     |     CC_V    =  000007 
    CC_Z    =  000001     |     CELLL   =  000002     |   6 CELLM      000B87 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 153.
Hexadecimal [24-Bits]

Symbol Table

  6 CELLP      000B78 R   |   6 CELLS      000B96 R   |     CFG_GCR =  007F60 
    CFG_GCR_=  000001     |     CFG_GCR_=  000000     |   6 CHAR1      00103F R
  6 CHAR2      001042 R   |   6 CHKIVEC    0021C5 R   |     CLKOPT  =  004807 
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
  6 COLD       001CC6 R   |   6 COLD1      001CC6 R   |   6 COLON      0019AA R
  6 COMMA      00160B R   |   6 COMPI      001650 R   |     COMPO   =  000040 
  6 CONSTANT   001A54 R   |   6 COPYRIGH   001C10 R   |   6 COUNT      000CD2 R
  6 CPP        00077F R   |     CPU_A   =  007F00     |     CPU_CCR =  007F0A 
    CPU_PCE =  007F01     |     CPU_PCH =  007F02     |     CPU_PCL =  007F03 
    CPU_SPH =  007F08     |     CPU_SPL =  007F09     |     CPU_XH  =  007F04 
    CPU_XL  =  007F05     |     CPU_YH  =  007F06     |     CPU_YL  =  007F07 
  6 CR         001068 R   |   6 CREAT      0019F0 R   |     CRR     =  00000D 
  6 CSTOR      0004F1 R   |   6 CTABLE     002490 R   |   6 CTAT       0024B1 R
  6 CTINIT     0024D9 R   |   6 DAT        000CB6 R   |     DATSTK  =  001680 
  6 DCONST     001A89 R   |   6 DDROP      00081D R   |   6 DDUP       000828 R
    DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF     |   6 DECIM      000EC7 R
  6 DEPTH      000C51 R   |     DEVID_BA=  0048CD     |     DEVID_EN=  0048D8 
    DEVID_LO=  0048D2     |     DEVID_LO=  0048D3     |     DEVID_LO=  0048D4 
    DEVID_LO=  0048D5     |     DEVID_LO=  0048D6     |     DEVID_LO=  0048D7 
    DEVID_LO=  0048D8     |     DEVID_WA=  0048D1     |     DEVID_XH=  0048CE 
    DEVID_XL=  0048CD     |     DEVID_YH=  0048D0     |     DEVID_YL=  0048CF 
  6 DGTQ1      000F0C R   |   6 DI         0000C4 R   |   6 DIG        000E40 R
  6 DIGIT      000DDB R   |   6 DIGS       000E51 R   |   6 DIGS1      000E51 R
  6 DIGS2      000E5E R   |   6 DIGTQ      000EDB R   |     DISCOVER=  000000 
    DM_BK1RE=  007F90     |     DM_BK1RH=  007F91     |     DM_BK1RL=  007F92 
    DM_BK2RE=  007F93     |     DM_BK2RH=  007F94     |     DM_BK2RL=  007F95 
    DM_CR1  =  007F96     |     DM_CR2  =  007F97     |     DM_CSR1 =  007F98 
    DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A     |   6 DN1        0008B4 R
  6 DNEGA      000899 R   |   6 DOCONST    001A74 R   |   6 DOF24CON   00299E R
  6 DOLIT      000470 R   |   6 DONXT      000484 R   |     DOORBELL=  000000 
  6 DOSTR      001078 R   |   6 DOT        00110E R   |   6 DOT1       001123 R
  6 DOTI1      001BD9 R   |   6 DOTID      001BC3 R   |   6 DOTO1      001564 R
  6 DOTOK      00154A R   |   6 DOTPR      001235 R   |   6 DOTQ       0017D5 R
  6 DOTQP      001095 R   |   6 DOTR       0010A3 R   |   6 DOTS       001B65 R
  6 DOTS1      001B70 R   |   6 DOTS2      001B79 R   |   6 DOVAR      0006D0 R
  6 DO_DCONS   001AAC R   |     DP      =  000005     |   6 DROP       000610 R
  6 DSTOR      000C9D R   |   6 DUMP       001B1B R   |   6 DUMP1      001B32 R
  6 DUMP3      001B54 R   |   6 DUMPP      001AEA R   |   6 DUPP       00061A R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 154.
Hexadecimal [24-Bits]

Symbol Table

  6 EDIGS      000E7C R   |   6 EDOT       00268F R   |   6 EDOT0      0026A3 R
  6 EDOT2      0026AF R   |   6 EDOT4      0026E6 R   |   6 EDOT5      002702 R
  6 EECSTORE   001F76 R   |   6 EEPCP      001D9C R   |   6 EEPLAST    001D6F R
  6 EEPROM     001D57 R   |     EEPROM_B=  004000     |     EEPROM_E=  0047FF 
    EEPROM_R=  000010     |     EEPROM_S=  000800     |   6 EEPRUN     001D86 R
  6 EEPVP      001DB2 R   |   6 EESTORE    001FC2 R   |   6 EE_CCOMM   00228C R
  6 EE_COMMA   00226B R   |   6 EE_CREAD   001F07 R   |   6 EE_READ    001EE5 R
  6 EI         0000BD R   |   6 ELSEE      00172B R   |   6 EMIT       000437 R
    EOL_CR  =  000001     |     EOL_LF  =  000000     |   6 EQ1        000908 R
  6 EQUAL      0008FB R   |   6 ERASE      000DA9 R   |     ERR     =  00001B 
  6 EVAL       00158D R   |   6 EVAL1      00158D R   |   6 EVAL2      0015A6 R
  6 EXE1       000D2D R   |   6 EXECU      0004C5 R   |     EXT     =  000000 
    EXTI_CR1=  0050A0     |     EXTI_CR2=  0050A1     |   6 EXTRC      000E03 R
  6 F24AT      002A2E R   |   6 F24CONST   00297B R   |   6 F24STO     002A0C R
  6 F24VAR     0029C2 R   |     F24_MAJO=  000001     |     F24_MINO=  000000 
  6 FADDR      002359 R   |   6 FALSE      000869 R   |   6 FARAT      001E1D R
  6 FARCAT     001E29 R   |   6 FC_XOFF    000464 R   |   6 FC_XON     00044E R
  6 FDOT       002711 R   |   6 FDOT0      00274C R   |   6 FDOT1      00273B R
  6 FDOT10     00279F R   |   6 FDOT2      00275A R   |   6 FDOT3      002770 R
  6 FDOT6      00277D R   |   6 FDOT7      00277F R   |   6 FDOT8      002787 R
  6 FDOT9      00278F R   |   6 FER        0025BF R   |     FHSE    =  7A1200 
    FHSI    =  F42400     |   6 FILL       000D89 R   |   6 FILL0      000D97 R
  6 FILL1      000D9F R   |   6 FIND       00132B R   |   6 FIND1      001349 R
  6 FIND2      001377 R   |   6 FIND3      001383 R   |   6 FIND4      001397 R
  6 FIND5      0013A4 R   |   6 FIND6      001388 R   |   6 FINIT      0025B5 R
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
  6 FLITER     002946 R   |   6 FLOATQ     002884 R   |   6 FLOATQ1    0028E3 R
  6 FLOATQ2    0028EC R   |   6 FLOATQ3    0028F4 R   |   6 FLOATQ4    002908 R
  6 FLOAT_ER   002923 R   |   6 FLOAT_ER   00291D R   |     FLSI    =  01F400 
  6 FMOVE      002364 R   |   6 FMOVE2     002395 R   |   6 FNE        0025E2 R
  6 FOR        00169A R   |   6 FORGET     00015A R   |   6 FORGET1    000189 R
  6 FORGET2    00020F R   |   6 FORGET4    000218 R   |   6 FORGET6    0001D1 R
  6 FOV        0025FD R   |   6 FPSTOR     001D38 R   |   6 FPSW       002591 R
    FPTR    =  000034     |   6 FREEVAR    000225 R   |   6 FREEVAR4   00025B R
  6 FRESET     0025A3 R   |   6 FVER       00255F R   |   6 FZE        0025CC R
    GPIO_BAS=  005000     |     GPIO_CR1=  000003     |     GPIO_CR2=  000004 
    GPIO_DDR=  000002     |     GPIO_IDR=  000001     |     GPIO_ODR=  000000 
    GPIO_SIZ=  000005     |   6 GREAT      000954 R   |   6 GREAT1     00095F R
  6 HDOT       0010F2 R   |   6 HERE       000CE9 R   |   6 HEX        000EB2 R
  6 HI         001C7B R   |   6 HLD        000750 R   |   6 HOLD       000E27 R
    HSECNT  =  004809     |     I2C_CCRH=  00521C     |     I2C_CCRH=  000080 
    I2C_CCRH=  0000C0     |     I2C_CCRH=  000080     |     I2C_CCRH=  000000 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 155.
Hexadecimal [24-Bits]

Symbol Table

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
    I2C_WRIT=  000000     |   6 ICOLON     0019BB R   |   6 IFETCH     0016B8 R
  6 IFF        001703 R   |   6 IFMOVE     00243D R   |     IMEDD   =  000080 
  6 IMMED      0019CD R   |   6 INCH       00042B R   |   6 INC_FPTR   001EB2 R
  6 INITOFS    001983 R   |   6 INN        0006FE R   |     INPUT_DI=  000000 
    INPUT_EI=  000001     |     INPUT_FL=  000000     |     INPUT_PU=  000001 
  6 INTE1      00152C R   |   6 INTER      001502 R   |   6 INTQ       002535 R
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
    INT_VECT=  008058     |   6 INVER      000876 R   |     IPR0    =  000002 
    IPR1    =  000001     |     IPR2    =  000000     |     IPR3    =  000003 
    IPR_MASK=  000003     |     IRET_COD=  000080     |   6 ISEMI      0018D2 R
    ITC_SPR1=  007F70     |     ITC_SPR2=  007F71     |     ITC_SPR3=  007F72 
    ITC_SPR4=  007F73     |     ITC_SPR5=  007F74     |     ITC_SPR6=  007F75 
    ITC_SPR7=  007F76     |     ITC_SPR8=  007F77     |     IWDG_KR =  0050E0 
    IWDG_PR =  0050E1     |     IWDG_RLR=  0050E2     |   6 JFETCH     0016C3 R
    JPIMM   =  0000CC     |   6 JSRC       001927 R   |   6 JSRC1      00194A R
  6 JSRC2      00196D R   |   6 KEY        000FED R   |   6 KTAP       00141C R
  6 KTAP1      00143F R   |   6 KTAP2      001442 R   |   6 LAST       00078F R
  6 LASTN   =  002A29 R   |   6 LBRAC      001539 R   |     LED2_BIT=  000005 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 156.
Hexadecimal [24-Bits]

Symbol Table

    LED2_MAS=  000020     |     LED2_POR=  00500A     |   6 LESS       000927 R
    LF      =  00000A     |   6 LINK    =  002A29 R   |   6 LITER      001672 R
  6 LOCAL      000555 R   |   6 LOCK       001E9E R   |   6 LSHIFT     000BC1 R
  6 LSHIFT1    000BCA R   |   6 LSHIFT4    000BD2 R   |   6 LT1        000932 R
    MASKK   =  001F7F     |   6 MAX        00096C R   |   6 MAX1       000976 R
    MAX_MANT=  007FFF     |   6 MIN        000980 R   |   6 MIN1       00098A R
  6 MMOD1      000A39 R   |   6 MMOD2      000A4D R   |   6 MMOD3      000A64 R
  6 MMSM0      0009C9 R   |   6 MMSM1      0009D9 R   |   6 MMSM3      0009DD R
  6 MMSM4      0009E9 R   |   6 MMSMa      0009E4 R   |   6 MMSMb      0009EF R
  6 MODD       000ABF R   |   6 MONE       000C28 R   |     MS      =  000030 
  6 MSEC       0002D1 R   |   6 MSMOD      000A1C R   |   6 MSTA1      000B50 R
  6 MSTAR      000B2D R   |     NAFR    =  004804     |   6 NAMEQ      0013C4 R
  6 NAMET      0012D5 R   |     NCLKOPT =  004808     |   6 NEGAT      000887 R
  6 NEG_SIGN   0027C0 R   |   6 NEX1       000491 R   |   6 NEXT       0016A9 R
    NFLASH_W=  00480E     |     NHSECNT =  00480A     |     NOPT1   =  004802 
    NOPT2   =  004804     |     NOPT3   =  004806     |     NOPT4   =  004808 
    NOPT5   =  00480A     |     NOPT6   =  00480C     |     NOPT7   =  00480E 
    NOPTBL  =  00487F     |   6 NRAT       0005A0 R   |   6 NRDROP     00057C R
  6 NROT       0007FD R   |   6 NRSTO      0005BF R   |   6 NTIB       00070E R
    NUBC    =  004802     |     NUCLEO  =  000001     |   6 NUFQ       001003 R
  6 NUFQ1      00101C R   |   6 NUMBQ      000F1F R   |   6 NUMQ1      000F53 R
  6 NUMQ2      000F84 R   |   6 NUMQ3      000FBA R   |   6 NUMQ4      000FC4 R
  6 NUMQ6      000FCC R   |   6 NUMQ9      000FDE R   |     NWDGOPT =  004806 
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
    OUTPUT_S=  000000     |   6 OVER       000642 R   |   6 OVERT      0018A0 R
    PA      =  000000     |   6 PACKS      000DBA R   |   6 PAD        000CFA R
  6 PAREN      001244 R   |   6 PARS       00113D R   |   6 PARS1      001168 R
  6 PARS2      001193 R   |   6 PARS3      001196 R   |   6 PARS4      00119F R
  6 PARS5      0011C2 R   |   6 PARS6      0011D7 R   |   6 PARS7      0011E6 R
  6 PARS8      0011F5 R   |   6 PARSE      001206 R   |   6 PARSEXP_   002867 R
  6 PAUSE      0002E1 R   |     PA_BASE =  005000     |     PA_CR1  =  005003 
    PA_CR2  =  005004     |     PA_DDR  =  005002     |     PA_IDR  =  005001 
    PA_ODR  =  005000     |     PB      =  000005     |     PB_BASE =  005005 
    PB_CR1  =  005008     |     PB_CR2  =  005009     |     PB_DDR  =  005007 
    PB_IDR  =  005006     |     PB_ODR  =  005005     |     PC      =  00000A 
    PC_BASE =  00500A     |     PC_CR1  =  00500D     |     PC_CR2  =  00500E 
    PC_DDR  =  00500C     |     PC_IDR  =  00500B     |     PC_ODR  =  00500A 
    PD      =  00000F     |   6 PDUM1      001AFD R   |   6 PDUM2      001B0E R
    PD_BASE =  00500F     |     PD_CR1  =  005012     |     PD_CR2  =  005013 
    PD_DDR  =  005011     |     PD_IDR  =  005010     |     PD_ODR  =  00500F 
    PE      =  000014     |     PE_BASE =  005014     |     PE_CR1  =  005017 
    PE_CR2  =  005018     |     PE_DDR  =  005016     |     PE_IDR  =  005015 
    PE_ODR  =  005014     |     PF      =  000019     |     PF_BASE =  005019 
    PF_CR1  =  00501C     |     PF_CR2  =  00501D     |     PF_DDR  =  00501B 
    PF_IDR  =  00501A     |     PF_ODR  =  005019     |     PG      =  00001E 
    PG_BASE =  00501E     |     PG_CR1  =  005021     |     PG_CR2  =  005022 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 157.
Hexadecimal [24-Bits]

Symbol Table

    PG_DDR  =  005020     |     PG_IDR  =  00501F     |     PG_ODR  =  00501E 
    PH      =  000023     |     PH_BASE =  005023     |     PH_CR1  =  005026 
    PH_CR2  =  005027     |     PH_DDR  =  005025     |     PH_IDR  =  005024 
    PH_ODR  =  005023     |     PI      =  000028     |   6 PICK       000C68 R
    PI_BASE =  005028     |     PI_CR1  =  00502B     |     PI_CR2  =  00502C 
    PI_DDR  =  00502A     |     PI_IDR  =  005029     |     PI_ODR  =  005028 
  6 PLUS       00083D R   |   6 PNAM1      00183F R   |   6 PRESE      0015B5 R
  6 PRINT_VE   001C4C R   |     PROD1   =  000024     |     PROD2   =  000026 
    PROD3   =  000028     |   6 PROTECTE   000201 R   |   6 PRT_LICE   001C38 R
  6 PSTOR      000C7F R   |     PTR16   =  000035     |     PTR8    =  000036 
  6 PTRPLUS    001ECA R   |   6 QBRAN      000499 R   |   6 QDUP       0007CD R
  6 QDUP1      0007D7 R   |   6 QKEY       000419 R   |   6 QSTAC      001570 R
  6 QUERY      00149C R   |   6 QUEST      001130 R   |   6 QUIT       0015D2 R
  6 QUIT1      0015DA R   |   6 QUIT2      0015DD R   |   6 RAM2EE     002305 R
    RAMBASE =  000000     |   6 RAMLAST    0007A2 R   |     RAM_BASE=  000000 
    RAM_END =  0017FF     |     RAM_SIZE=  001800     |   6 RANDOM     00027F R
  6 RAT        000546 R   |   6 RBRAC      001914 R   |   6 REPEA      001786 R
  6 RFREE      0022EC R   |   6 RFROM      000535 R   |     ROP     =  004800 
  6 ROT        0007DE R   |   6 ROW2BUF    0022AE R   |     ROWBUFF =  001680 
    RP0     =  00002E     |   6 RPAT       000512 R   |     RPP     =  0017FF 
  6 RPSTO      00051F R   |   6 RSHIFT     000BDD R   |   6 RSHIFT1    000BE6 R
  6 RSHIFT4    000BEE R   |     RST_SR  =  0050B3     |   6 SAME1      0012F3 R
  6 SAME2      00131C R   |   6 SAMEQ      0012EB R   |   6 SCOM1      001874 R
  6 SCOM2      001877 R   |   6 SCOMP      001856 R   |   6 SEED       000266 R
    SEEDX   =  000038     |     SEEDY   =  00003A     |   6 SEMIS      0018B0 R
  6 SETISP     0000D0 R   |   6 SET_RAML   001A3D R   |   6 SFN        00264C R
    SFR_BASE=  005000     |     SFR_END =  0057FF     |   6 SFV        002678 R
  6 SFZ        00261D R   |   6 SIGN       000E66 R   |   6 SIGN1      000E76 R
  6 SLASH      000AC9 R   |   6 SLMOD      000A6C R   |   6 SLMOD1     000AA9 R
  6 SLMOD8     000AB6 R   |   6 SNAME      001809 R   |     SP0     =  00002C 
  6 SPACE      001025 R   |   6 SPACS      001034 R   |   6 SPAT       0005FA R
    SPI_CR1 =  005200     |     SPI_CR2 =  005201     |     SPI_CRCP=  005205 
    SPI_DR  =  005204     |     SPI_ICR =  005202     |     SPI_RXCR=  005206 
    SPI_SR  =  005203     |     SPI_TXCR=  005207     |     SPP     =  001680 
    SPSAVE  =  000001     |   6 SPSTO      000607 R   |   6 SSMOD      000B59 R
    SSP     =  000001     |     STACK   =  0017FF     |   6 STAR       000B22 R
  6 STASL      000B6A R   |   6 STOD       0008BC R   |   6 STORE      0004D2 R
  6 STO_SIGN   0027D8 R   |   6 STR        000E94 R   |   6 STRCQ      00167A R
  6 STRQ       0017C8 R   |   6 STRQP      001091 R   |   6 SUBB       0008D3 R
  6 SWAPP      00062A R   |     SWIM_CSR=  007F80     |   6 TAP        001406 R
  6 TBOOT      001CBA R   |   6 TBRAN      0004A7 R   |   6 TBUF       00071E R
    TBUFFBAS=  001680     |   6 TCHAR      000C39 R   |   6 TEMP       0006EF R
  6 TEVAL      000741 R   |   6 TFLASH     000730 R   |   6 THENN      001718 R
  6 TIB        000D0B R   |     TIBB    =  001700     |     TIBBASE =  001700 
    TIC     =  000027     |   6 TICK       0015E9 R   |     TIM1_ARR=  005262 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 158.
Hexadecimal [24-Bits]

Symbol Table

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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 159.
Hexadecimal [24-Bits]

Symbol Table

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
  6 TNAM2      001B93 R   |   6 TNAM3      001BB1 R   |   6 TNAM4      001BB7 R
  6 TNAME      001B90 R   |   6 TOFLASH    000336 R   |   6 TOKEN      0012C7 R
  6 TOR        0005E3 R   |   6 TORAM      000376 R   |   6 TRUE       000858 R
    TRUEE   =  00FFFF     |   6 TWOSL      000BF5 R   |   6 TYPE1      001054 R
  6 TYPE2      00105A R   |   6 TYPES      00104F R   |   6 Timer4Ha   000005 R
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
    UD4     =  000004     |   6 UDOT       0010DE R   |   6 UDOTR      0010BE R
  6 UEND       000047 R   |     UFPSW   =  000008     |   6 UGREAT     00093E R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 160.
Hexadecimal [24-Bits]

Symbol Table

  6 UGREAT1    000949 R   |     UHLD    =  000014     |     UINN    =  00000C 
    UINTER  =  000012     |     ULAST   =  00001C     |   6 ULES1      00091C R
  6 ULESS      000911 R   |   6 UMMOD      0009B2 R   |   6 UMSTA      000AD8 R
  6 UNIQ1      001806 R   |   6 UNIQU      0017E7 R   |   6 UNLKEE     001E38 R
  6 UNLKFL     001E57 R   |   6 UNLOCK     001E76 R   |   6 UNTIL      0016DD R
    UOFFSET =  00001E     |   6 UPDATCP    001DF5 R   |   6 UPDATLAS   001DCC R
  6 UPDATPTR   0023F8 R   |   6 UPDATRUN   001DE4 R   |   6 UPDATVP    001E0C R
  6 UPL1       0006CC R   |   6 UPLUS      0006B5 R   |     UPP     =  000006 
  6 UPPER      00128A R   |   6 UPPER1     0012AD R   |   6 UPPER2     0012B6 R
    URLAST  =  000022     |   6 USLMOD     000A01 R   |     USR_BTN_=  000004 
    USR_BTN_=  000010     |     USR_BTN_=  005015     |     UTFLASH =  000020 
    UTIB    =  000010     |     UTMP    =  00000A     |   6 UTYP1      001ACD R
  6 UTYP2      001ADC R   |   6 UTYPE      001AC8 R   |     UVP     =  000018 
  6 UZERO      00002B R   |   6 VARIA      001A0A R   |     VAR_BASE=  000080 
    VAR_TOP =  0017BF     |     VER     =  000004     |   6 VPP        000771 R
    VSIZE   =  000006     |     WANT_CON=  000001     |     WANT_DEB=  000000 
    WANT_DOU=  000000     |     WANT_FLO=  000000     |     WANT_FLO=  000001 
    WANT_SCA=  000000     |     WANT_SEE=  000000     |     WDGOPT  =  004805 
    WDGOPT_I=  000002     |     WDGOPT_L=  000003     |     WDGOPT_W=  000000 
    WDGOPT_W=  000001     |   6 WHILE      00176C R   |   6 WITHI      000997 R
  6 WORDD      001270 R   |   6 WORDS      001BED R   |   6 WORS1      001BF3 R
  6 WORS2      001C0F R   |   6 WR_BYTE    001F21 R   |   6 WR_WORD    001F46 R
  6 WTABLE     00249F R   |   6 WTAT       0024C3 R   |   6 WTINIT     002508 R
    WWDG_CR =  0050D1     |     WWDG_WR =  0050D2     |     XMEM_SIZ=  017830 
    XOFF    =  000013     |     XON     =  000011     |   6 XORR       0006A0 R
    XTEMP   =  000024     |     YTEMP   =  000026     |     YTMP    =  000003 
  6 ZEQU1      00066D R   |   6 ZEQUAL     000663 R   |   6 ZERO       000C0F R
  6 ZL1        00065A R   |   6 ZLESS      000651 R   |   6 app_spac   002A80 R
  6 baudrate   00037C R   |   6 block_er   00200C R   |   6 clear_ra   000019 R
  6 clock_in   000064 R   |   6 copy_buf   00206C R   |   6 copy_buf   00208B R
  6 copy_pro   00208B R   |     da      =  000002     |     db      =  000003 
    dc      =  000000     |     dd      =  000001     |   6 dof24lit   002951 R
  6 erase_fl   00202E R   |   6 fmove_do   0023E1 R   |   6 main       000016 R
  6 next_row   00239E R   |   6 no_move    0023E8 R   |   6 nsign      0027AF R
  6 parse_d4   002812 R   |   6 parse_d5   00281E R   |   6 parse_di   0027DC R
  6 parse_ex   00281F R   |   6 pristine   00210C R   |   6 proceed_   002031 R
  6 reboot     000328 R   |   6 reset_ve   002173 R   |   6 row_eras   001FEC R
  6 row_eras   002045 R   |   6 row_eras   00206C R   |   6 set_opti   0020E0 R
  6 set_vect   002214 R   |   6 uart_ini   000076 R   |   6 write_ro   0020B0 R

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 161.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 DATA       size      0   flags    8
   2 DATA0      size      0   flags    8
   3 SSEG       size      0   flags    8
   4 SSEG1      size    100   flags    8
   5 HOME       size     80   flags    0
   6 CODE       size   2A80   flags    0

