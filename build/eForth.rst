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
                                            
                                            ; free space on stack
                                            .macro _drop n 
                                        
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
      0080B7 94 76                  314         .word      INTER   ;'EVAL
      0080B9 00 00                  315         .word      0       ;HLD
      0080BB B4 E3                  316         .word      LASTN  ;CNTXT pointer
      0080BD 00 80                  317         .word      VAR_BASE   ;variables free space pointer 
      0080BF B5 80                  318         .word      app_space ; FLASH free space pointer 
      0080C1 B4 E3                  319         .word      LASTN   ;LAST
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
      00812D CC 9B 77         [ 2]  391         jp  COLD   ;default=MN1
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
      008173 CD 86 C9         [ 4]  443         call OVER ; ( level reg lshift rval lshift -- )
      008176 CD 84 EF         [ 4]  444         call DOLIT 
      008179 00 03                  445         .word 3
      00817B CD 86 B1         [ 4]  446         call SWAPP  ; ( level reg lshift rval 3 lshift )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 10.
Hexadecimal [24-Bits]



      00817E CD 8C 13         [ 4]  447         call LSHIFT ; creat slot mask 
      008181 CD 88 F3         [ 4]  448         call INVER  ; ( level reg lshift rval mask )
      008184 CD 86 FE         [ 4]  449         call ANDD ; ( level reg lshift slot_masked )
      008187 CD 86 6A         [ 4]  450         call TOR  ; ( level reg lshift -- R: slot_masked )
      00818A CD 88 65         [ 4]  451         call ROT  ; ( reg lshift level )
      00818D CD 86 B1         [ 4]  452         call SWAPP ; ( reg level lshift )
      008190 CD 8C 13         [ 4]  453         call LSHIFT  ; ( reg slot_level -- )
      008193 CD 85 B4         [ 4]  454         call RFROM ; ( reg slot_level masked_val )
      008196 CD 87 12         [ 4]  455         call ORR   ; ( reg updated_rval )
      008199 CD 86 B1         [ 4]  456         call SWAPP 
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
      0081A9 CD 92 3B         [ 4]  465         call TOKEN 
      0081AC CD 86 A1         [ 4]  466         call DUPP 
      0081AF CD 85 18         [ 4]  467         call QBRAN 
      0081B2 82 8F                  468         .word FORGET2
      0081B4 CD 93 38         [ 4]  469         call NAMEQ
      0081B7 CD 88 54         [ 4]  470         call QDUP 
      0081BA CD 85 18         [ 4]  471         call QBRAN 
      0081BD 82 8F                  472         .word FORGET2
      0081BF CD 86 97         [ 4]  473         call DROP 
      0081C2 1D 00 04         [ 2]  474         subw x,#2*CELLL 
      0081C5 90 5F            [ 1]  475         clrw y 
      0081C7 FF               [ 2]  476         ldw (x),y 
      0081C8 90 AE 40 02      [ 2]  477         ldw y,#APP_RUN 
      0081CC EF 02            [ 2]  478         ldw (2,x),y 
      0081CE CC 9E 73         [ 2]  479         jp EESTORE 
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
      0081DA CD 92 3B         [ 4]  488         call TOKEN
      0081DD CD 86 A1         [ 4]  489         call DUPP 
      0081E0 CD 85 18         [ 4]  490         call QBRAN 
      0081E3 82 8F                  491         .word FORGET2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 11.
Hexadecimal [24-Bits]



      0081E5 CD 93 38         [ 4]  492         call NAMEQ ; ( a -- ca na | a F )
      0081E8 CD 88 54         [ 4]  493         call QDUP 
      0081EB CD 85 18         [ 4]  494         call QBRAN 
      0081EE 82 8F                  495         .word FORGET2
                                    496 ; only forget users words 
      0081F0 CD 86 A1         [ 4]  497         call DUPP ; ( ca na na )
      0081F3 CD 84 EF         [ 4]  498         call DOLIT 
      0081F6 B5 80                  499         .word app_space 
      0081F8 CD 86 B1         [ 4]  500         call SWAPP 
      0081FB CD 89 97         [ 4]  501         call  ULESS 
      0081FE CD 85 18         [ 4]  502         call QBRAN 
      008201 82 51                  503         .word FORGET6 
                                    504 ; ( ca na -- )        
                                    505 ;reset ivec with address >= ca
      008203 CD 86 B1         [ 4]  506         call SWAPP ; ( na ca -- ) 
      008206 CD A0 76         [ 4]  507         call CHKIVEC ; ( na -- ) 
                                    508 ; start at LAST and link back to na 
                                    509 ; if variable found reset VP at that point.
      008209                        510 FORGET1:
      008209 CD 88 16         [ 4]  511         call LAST 
      00820C CD 85 63         [ 4]  512         call AT 
      00820F CD 86 A1         [ 4]  513         call DUPP  ; ( -- na last last )
      008212 CD 82 A5         [ 4]  514         call FREEVAR ; ( -- na last )
      008215 CD 86 A1         [ 4]  515         call DUPP 
      008218 CD 84 EF         [ 4]  516         call DOLIT 
      00821B 00 02                  517         .word 2 
      00821D CD 89 50         [ 4]  518         call SUBB ; ( na last -- na last lfa ) link address 
      008220 CD 85 63         [ 4]  519         call AT 
      008223 CD 86 A1         [ 4]  520         call DUPP ; ( -- na last a a )
      008226 CD 87 EA         [ 4]  521         call CNTXT 
      008229 CD 85 51         [ 4]  522         call STORE
      00822C CD 88 16         [ 4]  523         call LAST  
      00822F CD 85 51         [ 4]  524         call STORE ; ( --  na last )
      008232 CD 86 C9         [ 4]  525         call OVER 
      008235 CD 89 78         [ 4]  526         call EQUAL ; ( na last na -- na T|F ) 
      008238 CD 85 18         [ 4]  527         call QBRAN 
      00823B 82 09                  528         .word FORGET1 
                                    529 ; ( na -- )
      00823D CD 84 EF         [ 4]  530         call DOLIT 
      008240 00 02                  531         .word 2 
      008242 CD 89 50         [ 4]  532         call SUBB 
      008245 CD 88 06         [ 4]  533         call CPP 
      008248 CD 85 51         [ 4]  534         call STORE  
      00824B CD 9C A6         [ 4]  535         call UPDATCP 
      00824E CC 9C 7D         [ 2]  536         jp UPDATLAST 
      008251                        537 FORGET6: ; tried to forget a RAM or system word 
                                    538 ; ( ca na -- )
      008251 1D 00 02         [ 2]  539         subw x,#CELLL 
      008254 90 BE 2C         [ 2]  540         ldw y,SP0 
      008257 FF               [ 2]  541         ldw (x),y  
      008258 CD 89 97         [ 4]  542         call ULESS
      00825B CD 85 18         [ 4]  543         call QBRAN 
      00825E 82 81                  544         .word PROTECTED 
      008260 CD 94 44         [ 4]  545         call ABORQ 
      008263 1D                     546         .byte 29
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 12.
Hexadecimal [24-Bits]



      008264 20 46 6F 72 20 52 41   547         .ascii " For RAM definition do REBOOT"
             4D 20 64 65 66 69 6E
             69 74 69 6F 6E 20 64
             6F 20 52 45 42 4F 4F
             54
      008281                        548 PROTECTED:
      008281 CD 94 44         [ 4]  549         call ABORQ
      008284 0A                     550         .byte 10
      008285 20 50 72 6F 74 65 63   551         .ascii " Protected"
             74 65 64
      00828F                        552 FORGET2: ; no name or not found in dictionary 
      00828F CD 94 44         [ 4]  553         call ABORQ
      008292 05                     554         .byte 5
      008293 20 77 68 61 74         555         .ascii " what"
      008298                        556 FORGET4:
      008298 CC 86 97         [ 2]  557         jp DROP 
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
      0082A5 CD 86 A1         [ 4]  566         call DUPP ; ( na na -- )
      0082A8 CD 85 81         [ 4]  567         CALL CAT  ; ( na c -- )
      0082AB CD 8B F5         [ 4]  568         call ONEP ;
      0082AE CD 88 C6         [ 4]  569         CALL PLUS ; ( na c+1 -- ca ) 
      0082B1 CD 8B F5         [ 4]  570         call ONEP ; ( ca+ -- ) to get routne address 
      0082B4 CD 86 A1         [ 4]  571         call DUPP ; ( ca+ ca+ -- )
      0082B7 CD 85 63         [ 4]  572         CALL AT   ; ( ca+ fnaddr -- ) ; fnaddr is routine address 
      0082BA CD 84 EF         [ 4]  573         call DOLIT 
      0082BD 87 57                  574         .word DOVAR ; if routine address is DOVAR then variable 
      0082BF CD 89 78         [ 4]  575         call EQUAL  ; ( ca+ fnaddr DOVAR -- ca+ T|F ) 
      0082C2 CD 85 18         [ 4]  576         call QBRAN 
      0082C5 82 DB                  577         .word FREEVAR4 
      0082C7 CD 84 EF         [ 4]  578         call DOLIT 
      0082CA 00 02                  579         .word 2 
      0082CC CD 88 C6         [ 4]  580         call PLUS  ; ( ca+ 2 -- da ) da is data address 
      0082CF CD 85 63         [ 4]  581         call AT 
      0082D2 CD 87 F8         [ 4]  582         call VPP   
      0082D5 CD 85 51         [ 4]  583         call STORE 
      0082D8 CC 9C BD         [ 2]  584         jp UPDATVP 
      0082DB                        585 FREEVAR4: ; not variable
      0082DB CC 86 97         [ 2]  586         jp  DROP 
                                    587 
                                    588 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    589 ;    SEED ( n -- )
                                    590 ; Initialize PRNG seed with n 
                                    591 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 13.
Hexadecimal [24-Bits]



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
                                    604 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000275                        605         _HEADER RANDOM,6,"RANDOM"
      0082F5 82 E0                    1         .word LINK 
                           000277     2         LINK=.
      0082F7 06                       3         .byte 6  
      0082F8 52 41 4E 44 4F 4D        4         .ascii "RANDOM"
      0082FE                          5         RANDOM:
                                    606 ;local variable 
                           000001   607         SPSAVE=1
                           000002   608         VSIZE=2 
      0082FE 52 02            [ 2]  609         sub sp,#VSIZE
      008300 1F 01            [ 2]  610         ldw (SPSAVE,sp),x  
                                    611 ; XTEMP=(SEEDX<<5)^SEEDX 
      008302 90 93            [ 1]  612         ldw y,x 
      008304 90 FE            [ 2]  613         ldw y,(y)
      008306 90 BF 26         [ 2]  614         ldw YTEMP,y 
      008309 BE 38            [ 2]  615 	ldw x,SEEDX 
      00830B 58               [ 2]  616 	sllw x 
      00830C 58               [ 2]  617 	sllw x 
      00830D 58               [ 2]  618 	sllw x 
      00830E 58               [ 2]  619 	sllw x 
      00830F 58               [ 2]  620 	sllw x 
      008310 9E               [ 1]  621 	ld a,xh 
      008311 B8 38            [ 1]  622 	xor a,SEEDX 
      008313 B7 24            [ 1]  623 	ld XTEMP,a 
      008315 9F               [ 1]  624 	ld a,xl 
      008316 B8 39            [ 1]  625 	xor a,SEEDX+1 
      008318 B7 25            [ 1]  626 	ld XTEMP+1,a 
                                    627 ; SEEDX=SEEDY 
      00831A BE 3A            [ 2]  628 	ldw x,SEEDY 
      00831C BF 38            [ 2]  629 	ldw SEEDX,x  
                                    630 ; SEEDY=SEEDY^(SEEDY>>1)
      00831E 54               [ 2]  631 	srlw x 
      00831F 9E               [ 1]  632 	ld a,xh 
      008320 B8 3A            [ 1]  633 	xor a,SEEDY 
      008322 B7 3A            [ 1]  634 	ld SEEDY,a  
      008324 9F               [ 1]  635 	ld a,xl 
      008325 B8 3B            [ 1]  636 	xor a,SEEDY+1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 14.
Hexadecimal [24-Bits]



      008327 B7 3B            [ 1]  637 	ld SEEDY+1,a 
                                    638 ; XTEMP>>3 
      008329 BE 24            [ 2]  639 	ldw x,XTEMP 
      00832B 54               [ 2]  640 	srlw x 
      00832C 54               [ 2]  641 	srlw x 
      00832D 54               [ 2]  642 	srlw x 
                                    643 ; x=XTEMP^x 
      00832E 9E               [ 1]  644 	ld a,xh 
      00832F B8 24            [ 1]  645 	xor a,XTEMP 
      008331 95               [ 1]  646 	ld xh,a 
      008332 9F               [ 1]  647 	ld a,xl 
      008333 B8 25            [ 1]  648 	xor a,XTEMP+1  
      008335 97               [ 1]  649 	ld xl,a 
                                    650 ; SEEDY=x^SEEDY 
      008336 B8 3B            [ 1]  651 	xor a,SEEDY+1
      008338 97               [ 1]  652 	ld xl,a 
      008339 9E               [ 1]  653 	ld a,xh 
      00833A B8 3A            [ 1]  654 	xor a,SEEDY
      00833C 95               [ 1]  655 	ld xh,a 
      00833D BF 3A            [ 2]  656 	ldw SEEDY,x 
                                    657 ; return SEEDY modulo YTEMP  
      00833F 90 BE 26         [ 2]  658 	ldw y,YTEMP  
      008342 65               [ 2]  659 	divw x,y 
      008343 1E 01            [ 2]  660 	ldw x,(SPSAVE,sp)
      008345 FF               [ 2]  661         ldw (x),y 
      008346 5B 02            [ 2]  662         addw sp,#VSIZE 
      008348 81               [ 4]  663 	ret 
                                    664 
                                    665 
                                    666 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    667 ;; get millisecond counter 
                                    668 ;; msec ( -- u )
                                    669 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0002C9                        670         _HEADER MSEC,4,"MSEC"
      008349 82 F7                    1         .word LINK 
                           0002CB     2         LINK=.
      00834B 04                       3         .byte 4  
      00834C 4D 53 45 43              4         .ascii "MSEC"
      008350                          5         MSEC:
      008350 1D 00 02         [ 2]  671         subw x,#CELLL 
      008353 90 BE 30         [ 2]  672         ldw y,MS 
      008356 FF               [ 2]  673         ldw (x),y 
      008357 81               [ 4]  674         ret 
                                    675 
                                    676 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    677 ; suspend execution for u msec 
                                    678 ;  pause ( u -- )
                                    679 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0002D8                        680         _HEADER PAUSE,5,"PAUSE"
      008358 83 4B                    1         .word LINK 
                           0002DA     2         LINK=.
      00835A 05                       3         .byte 5  
      00835B 50 41 55 53 45           4         .ascii "PAUSE"
      008360                          5         PAUSE:
      008360 90 93            [ 1]  681         ldw y,x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 15.
Hexadecimal [24-Bits]



      008362 90 FE            [ 2]  682         ldw y,(y)
      008364 72 B9 00 30      [ 2]  683         addw y,MS 
      008368 8F               [10]  684 1$:     wfi  
      008369 90 B3 30         [ 2]  685         cpw y,MS  
      00836C 26 FA            [ 1]  686         jrne 1$        
      00836E 1C 00 02         [ 2]  687         addw x,#CELLL 
      008371 81               [ 4]  688         ret 
                                    689 
                                    690 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    691 ; initialize count down timer 
                                    692 ;  TIMER ( u -- )  milliseconds
                                    693 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0002F2                        694         _HEADER TIMER,5,"TIMER"
      008372 83 5A                    1         .word LINK 
                           0002F4     2         LINK=.
      008374 05                       3         .byte 5  
      008375 54 49 4D 45 52           4         .ascii "TIMER"
      00837A                          5         TIMER:
      00837A 90 93            [ 1]  695         ldw y,x
      00837C 90 FE            [ 2]  696         ldw y,(y) 
      00837E 90 BF 32         [ 2]  697         ldw CNTDWN,y
      008381 1C 00 02         [ 2]  698         addw x,#CELLL 
      008384 81               [ 4]  699         ret 
                                    700 
                                    701 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    702 ; check for TIMER exiparition 
                                    703 ;  TIMEOUT? ( -- 0|-1 )
                                    704 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000305                        705         _HEADER TIMEOUTQ,8,"TIMEOUT?"
      008385 83 74                    1         .word LINK 
                           000307     2         LINK=.
      008387 08                       3         .byte 8  
      008388 54 49 4D 45 4F 55 54     4         .ascii "TIMEOUT?"
             3F
      008390                          5         TIMEOUTQ:
      008390 4F               [ 1]  706         clr a
      008391 1D 00 02         [ 2]  707         subw x,#CELLL 
      008394 90 BE 32         [ 2]  708         ldw y,CNTDWN 
      008397 26 01            [ 1]  709         jrne 1$ 
      008399 43               [ 1]  710         cpl a 
      00839A E7 01            [ 1]  711 1$:     ld (1,x),a 
      00839C F7               [ 1]  712         ld (x),a 
      00839D 81               [ 4]  713         ret         
                                    714 
                                    715 ;;;;;;;;;;;;;;;;;;;;;
                                    716 ; reboot MCU 
                                    717 ; REBOOT ( -- )
                                    718 ;;;;;;;;;;;;;;;;;;;;;
      00031E                        719         _HEADER reboot,6,"REBOOT"
      00839E 83 87                    1         .word LINK 
                           000320     2         LINK=.
      0083A0 06                       3         .byte 6  
      0083A1 52 45 42 4F 4F 54        4         .ascii "REBOOT"
      0083A7                          5         reboot:
      0083A7 CC 80 80         [ 2]  720         jp NonHandledInterrupt
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 16.
Hexadecimal [24-Bits]



                                    721 
                                    722 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    723 ; compile to flash memory 
                                    724 ; TO-FLASH ( -- )
                                    725 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      00032A                        726         _HEADER TOFLASH,8,"TO-FLASH"
      0083AA 83 A0                    1         .word LINK 
                           00032C     2         LINK=.
      0083AC 08                       3         .byte 8  
      0083AD 54 4F 2D 46 4C 41 53     4         .ascii "TO-FLASH"
             48
      0083B5                          5         TOFLASH:
      0083B5 CD 88 29         [ 4]  727         call RAMLAST 
      0083B8 CD 85 63         [ 4]  728         call AT 
      0083BB CD 88 54         [ 4]  729         call QDUP 
      0083BE CD 85 18         [ 4]  730         call QBRAN
      0083C1 83 E4                  731         .word 1$
      0083C3 CD 94 44         [ 4]  732         call ABORQ 
      0083C6 1D                     733         .byte 29
      0083C7 20 4E 6F 74 20 77 68   734         .ascii " Not while definitions in RAM"   
             69 6C 65 20 64 65 66
             69 6E 69 74 69 6F 6E
             73 20 69 6E 20 52 41
             4D
      0083E4 90 AE FF FF      [ 2]  735 1$:     ldw y,#-1 
      0083E8 90 BF 20         [ 2]  736         ldw UTFLASH,y
      0083EB 81               [ 4]  737         ret 
                                    738 
                                    739 ;;;;;;;;;;;;;;;;;;;;;;
                                    740 ; compile to RAM 
                                    741 ; TO-RAM ( -- )
                                    742 ;;;;;;;;;;;;;;;;;;;;;;
      00036C                        743         _HEADER TORAM,6,"TO-RAM"
      0083EC 83 AC                    1         .word LINK 
                           00036E     2         LINK=.
      0083EE 06                       3         .byte 6  
      0083EF 54 4F 2D 52 41 4D        4         .ascii "TO-RAM"
      0083F5                          5         TORAM:
      0083F5 90 5F            [ 1]  744         clrw y 
      0083F7 90 BF 20         [ 2]  745         ldw UTFLASH,y 
      0083FA 81               [ 4]  746         ret 
                                    747 
                                    748 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    749 ;; BAUD RATE constants table
                                    750 ; values to put in BRR1 & BRR2 
                                    751 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0083FB                        752 baudrate: 
      0083FB A0 1B                  753 	.byte 0xa0,0x1b ; 2400
      0083FD D0 05                  754 	.byte 0xd0,0x5  ; 4800 
      0083FF 68 03                  755 	.byte 0x68,0x3  ; 9600
      008401 34 01                  756 	.byte 0x34,0x1  ; 19200
      008403 11 06                  757 	.byte 0x11,0x6  ; 57600
      008405 08 0B                  758 	.byte 0x8,0xb   ; 115200
                                    759 
                                    760 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 17.
Hexadecimal [24-Bits]



                                    761 ; BAUD RATE CONSTANTS names 
                                    762 ; 2400 baud  ( -- n )
                                    763 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000387                        764         _HEADER B2K4,4,"B2K4"
      008407 83 EE                    1         .word LINK 
                           000389     2         LINK=.
      008409 04                       3         .byte 4  
      00840A 42 32 4B 34              4         .ascii "B2K4"
      00840E                          5         B2K4:
      00840E 1D 00 02         [ 2]  765 	subw x,#CELLL 
      008411 90 5F            [ 1]  766         clrw y
      008413 FF               [ 2]  767         ldw (x),y
      008414 81               [ 4]  768 	ret
                                    769 
                                    770 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    771 ; 4800 baud	
                                    772 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000395                        773         _HEADER B4K8,4,"B4K8"
      008415 84 09                    1         .word LINK 
                           000397     2         LINK=.
      008417 04                       3         .byte 4  
      008418 42 34 4B 38              4         .ascii "B4K8"
      00841C                          5         B4K8:
      00841C 1D 00 02         [ 2]  774         subw x,#CELLL 
      00841F 90 AE 00 02      [ 2]  775         ldw y,#2 
      008423 FF               [ 2]  776         ldw (x),y
      008424 81               [ 4]  777         ret 
                                    778 
                                    779 ;;;;;;;;;;;;;;;;;;;;
                                    780 ; 9600 baud
                                    781 ;;;;;;;;;;;;;;;;;;;;
      0003A5                        782         _HEADER B9K6,4,"B9K6"
      008425 84 17                    1         .word LINK 
                           0003A7     2         LINK=.
      008427 04                       3         .byte 4  
      008428 42 39 4B 36              4         .ascii "B9K6"
      00842C                          5         B9K6:
      00842C 1D 00 02         [ 2]  783         subw x,#CELLL 
      00842F 90 AE 00 04      [ 2]  784         ldw y,#4 
      008433 FF               [ 2]  785         ldw (x),y 
      008434 81               [ 4]  786         ret 
                                    787 ;;;;;;;;;;;;;;
                                    788 ; 19200 baud
                                    789 ;;;;;;;;;;;;;;
      0003B5                        790         _HEADER B19K2,5,"B19K2"
      008435 84 27                    1         .word LINK 
                           0003B7     2         LINK=.
      008437 05                       3         .byte 5  
      008438 42 31 39 4B 32           4         .ascii "B19K2"
      00843D                          5         B19K2:
      00843D 1D 00 02         [ 2]  791         subw x,#CELLL
      008440 90 AE 00 06      [ 2]  792         ldw y,#6 
      008444 FF               [ 2]  793         ldw (x),y 
      008445 81               [ 4]  794         ret 
                                    795 ;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 18.
Hexadecimal [24-Bits]



                                    796 ; 57600 baud  
                                    797 ;;;;;;;;;;;;;;
      0003C6                        798         _HEADER B57K6,5,"B57K6"
      008446 84 37                    1         .word LINK 
                           0003C8     2         LINK=.
      008448 05                       3         .byte 5  
      008449 42 35 37 4B 36           4         .ascii "B57K6"
      00844E                          5         B57K6:
      00844E 1D 00 02         [ 2]  799         subw x,#CELLL 
      008451 90 AE 00 08      [ 2]  800         ldw y,#8 
      008455 FF               [ 2]  801         ldw (x),y 
      008456 81               [ 4]  802         ret 
                                    803 ;;;;;;;;;;;;;;
                                    804 ; 115200 baud 
                                    805 ;;;;;;;;;;;;;;
      0003D7                        806         _HEADER B115K2,6,"B115K2"
      008457 84 48                    1         .word LINK 
                           0003D9     2         LINK=.
      008459 06                       3         .byte 6  
      00845A 42 31 31 35 4B 32        4         .ascii "B115K2"
      008460                          5         B115K2:
      008460 1D 00 02         [ 2]  807 	subw x,#CELLL 
      008463 90 AE 00 0A      [ 2]  808         ldw y,#10 
      008467 FF               [ 2]  809         ldw (x),y 
      008468 81               [ 4]  810         ret 
                                    811 
                                    812 ;;;;;;;;;;;;;;;;;;;;;;;	
                                    813 ;; set UART2 BAUD rate
                                    814 ;	BAUD ( u -- )
                                    815 ;;;;;;;;;;;;;;;;;;;;;;;
      0003E9                        816         _HEADER BAUD,4,"BAUD"
      008469 84 59                    1         .word LINK 
                           0003EB     2         LINK=.
      00846B 04                       3         .byte 4  
      00846C 42 41 55 44              4         .ascii "BAUD"
      008470                          5         BAUD:
      008470 1D 00 02         [ 2]  817 	subw x,#CELLL
      008473 90 AE 83 FB      [ 2]  818         ldw y,#baudrate 
      008477 FF               [ 2]  819         ldw (x),y 
      008478 CD 88 C6         [ 4]  820         call PLUS
      00847B 90 93            [ 1]  821         ldw y,x  
      00847D 90 FE            [ 2]  822         ldw y,(y)
      00847F 90 F6            [ 1]  823         ld a,(y)
      008481 88               [ 1]  824         push a 
      008482 90 5C            [ 1]  825         incw y 
      008484 90 F6            [ 1]  826         ld a,(y)
      008486 C7 52 33         [ 1]  827         ld UART_BRR2,a 
      008489 84               [ 1]  828         pop a
      00848A C7 52 32         [ 1]  829         ld UART_BRR1,a 
      00848D 1C 00 02         [ 2]  830         addw x,#CELLL 
      008490 81               [ 4]  831         ret 
                                    832 
                                    833 ;; Device dependent I/O
                                    834 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    835 ;       ?RX     ( -- c T | F )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 19.
Hexadecimal [24-Bits]



                                    836 ;         Return input byte and true, or false.
                                    837 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000411                        838         _HEADER QKEY,4,"?KEY"
      008491 84 6B                    1         .word LINK 
                           000413     2         LINK=.
      008493 04                       3         .byte 4  
      008494 3F 4B 45 59              4         .ascii "?KEY"
      008498                          5         QKEY:
      008498 90 5F            [ 1]  839         CLRW Y 
      00849A 72 0B 52 30 0B   [ 2]  840         BTJF UART_SR,#UART_SR_RXNE,INCH   ;check status
      00849F C6 52 31         [ 1]  841         LD    A,UART_DR   ;get char in A
      0084A2 1D 00 02         [ 2]  842 	SUBW	X,#2
      0084A5 E7 01            [ 1]  843         LD     (1,X),A
      0084A7 7F               [ 1]  844 	CLR	(X)
      0084A8 90 53            [ 2]  845         CPLW     Y
      0084AA                        846 INCH:
      0084AA 1D 00 02         [ 2]  847 		SUBW	X,#2
      0084AD FF               [ 2]  848         LDW     (X),Y
      0084AE 81               [ 4]  849         RET
                                    850 
                                    851 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    852 ;       TX!     ( c -- )
                                    853 ;       Send character c to  output device.
                                    854 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00042F                        855         _HEADER EMIT,4,"EMIT"
      0084AF 84 93                    1         .word LINK 
                           000431     2         LINK=.
      0084B1 04                       3         .byte 4  
      0084B2 45 4D 49 54              4         .ascii "EMIT"
      0084B6                          5         EMIT:
      0084B6 E6 01            [ 1]  856         LD     A,(1,X)
      0084B8 1C 00 02         [ 2]  857 	ADDW	X,#2
      0084BB 72 0F 52 30 FB   [ 2]  858 OUTPUT: BTJF UART_SR,#UART_SR_TXE,OUTPUT  ;loop until tx empty 
      0084C0 C7 52 31         [ 1]  859         LD    UART_DR,A   ;send A
      0084C3 81               [ 4]  860         RET
                                    861 
                                    862 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    863 ;       FC-XON  ( -- )
                                    864 ;       send XON character 
                                    865 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000444                        866         _HEADER FC_XON,6,"FC-XON"
      0084C4 84 B1                    1         .word LINK 
                           000446     2         LINK=.
      0084C6 06                       3         .byte 6  
      0084C7 46 43 2D 58 4F 4E        4         .ascii "FC-XON"
      0084CD                          5         FC_XON:
      0084CD 1D 00 02         [ 2]  867         subw x,#CELLL 
      0084D0 7F               [ 1]  868         clr (x)
      0084D1 A6 11            [ 1]  869         ld a,#XON 
      0084D3 E7 01            [ 1]  870         ld (1,x),a 
      0084D5 CD 84 B6         [ 4]  871         call EMIT 
      0084D8 81               [ 4]  872         ret 
                                    873 
                                    874 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    875 ;       FC-XOFF ( -- )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 20.
Hexadecimal [24-Bits]



                                    876 ;       Send XOFF character 
                                    877 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000459                        878         _HEADER FC_XOFF,7,"FC-XOFF"
      0084D9 84 C6                    1         .word LINK 
                           00045B     2         LINK=.
      0084DB 07                       3         .byte 7  
      0084DC 46 43 2D 58 4F 46 46     4         .ascii "FC-XOFF"
      0084E3                          5         FC_XOFF:
      0084E3 1D 00 02         [ 2]  879         subw x,#CELLL 
      0084E6 7F               [ 1]  880         clr (x)
      0084E7 A6 13            [ 1]  881         ld a,#XOFF 
      0084E9 E7 01            [ 1]  882         ld (1,x),a 
      0084EB CD 84 B6         [ 4]  883         call EMIT 
      0084EE 81               [ 4]  884         ret
                                    885 
                                    886 ;; The kernel
                                    887 
                                    888 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    889 ;       doLIT   ( -- w )
                                    890 ;       Push an inline literal.
                                    891 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0084EF                        892 DOLIT:
      0084EF 1D 00 02         [ 2]  893 	SUBW X,#2
      0084F2 16 01            [ 2]  894         ldw y,(1,sp)
      0084F4 90 FE            [ 2]  895         ldw y,(y)
      0084F6 FF               [ 2]  896         ldw (x),y
      0084F7 90 85            [ 2]  897         popw y 
      0084F9 90 EC 02         [ 2]  898         jp (2,y)
                                    899 
                                    900 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    901 ;       NEXT    ( -- )
                                    902 ;       Code for  single index loop.
                                    903 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00047C                        904         _HEADER DONXT,COMPO+4,"NEXT"
      0084FC 84 DB                    1         .word LINK 
                           00047E     2         LINK=.
      0084FE 44                       3         .byte COMPO+4  
      0084FF 4E 45 58 54              4         .ascii "NEXT"
      008503                          5         DONXT:
      008503 16 03            [ 2]  905 	LDW Y,(3,SP)
      008505 90 5A            [ 2]  906 	DECW Y
      008507 2A 07            [ 1]  907 	JRPL NEX1 ; jump if N=0
      008509 90 85            [ 2]  908 	POPW Y
      00850B 5B 02            [ 2]  909         addw sp,#2
      00850D 90 EC 02         [ 2]  910         JP (2,Y)
      008510                        911 NEX1:
      008510 17 03            [ 2]  912         LDW (3,SP),Y
      008512 90 85            [ 2]  913         POPW Y
      008514 90 FE            [ 2]  914 	LDW Y,(Y)
      008516 90 FC            [ 2]  915 	JP (Y)
                                    916 
                                    917 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    918 ;       ?branch ( f -- )
                                    919 ;       Branch if flag is zero.
                                    920 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 21.
Hexadecimal [24-Bits]



                                    921 ;       _HEADER QBRAN,COMPO+7,"?BRANCH"        
      008518                        922 QBRAN:	
      008518 90 93            [ 1]  923         LDW Y,X
      00851A 1C 00 02         [ 2]  924 	ADDW X,#2
      00851D 90 FE            [ 2]  925 	LDW Y,(Y)
      00851F 27 13            [ 1]  926         JREQ     BRAN
      008521 90 85            [ 2]  927 	POPW Y
      008523 90 EC 02         [ 2]  928 	JP (2,Y)
                                    929 
                                    930 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    931 ;  TBRANCH ( f -- )
                                    932 ;  branch if f==TRUE 
                                    933 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    934 ;        _HEADER TBRAN,COMPO+7,"TBRANCH"
      008526                        935 TBRAN: 
      008526 90 93            [ 1]  936         LDW Y,X 
      008528 1C 00 02         [ 2]  937         ADDW X,#2 
      00852B 90 FE            [ 2]  938         LDW Y,(Y)
      00852D 26 05            [ 1]  939         JRNE BRAN 
      00852F 90 85            [ 2]  940         POPW Y 
      008531 90 EC 02         [ 2]  941         JP (2,Y)
                                    942 
                                    943 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    944 ;       branch  ( -- )
                                    945 ;       Branch to an inline address.
                                    946 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    947 ;       _HEADER BRAN,COMPO+6,"BRANCH"
      008534                        948 BRAN:
      008534 90 85            [ 2]  949         POPW Y
      008536 90 FE            [ 2]  950 	LDW Y,(Y)
      008538 90 FC            [ 2]  951         JP     (Y)
                                    952 
                                    953 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    954 ;       EXECUTE ( ca -- )
                                    955 ;       Execute  word at ca.
                                    956 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0004BA                        957         _HEADER EXECU,7,"EXECUTE"
      00853A 84 FE                    1         .word LINK 
                           0004BC     2         LINK=.
      00853C 07                       3         .byte 7  
      00853D 45 58 45 43 55 54 45     4         .ascii "EXECUTE"
      008544                          5         EXECU:
      008544 90 93            [ 1]  958         LDW Y,X
      008546 1C 00 02         [ 2]  959 	ADDW X,#2
      008549 90 FE            [ 2]  960 	LDW  Y,(Y)
      00854B 90 FC            [ 2]  961         JP   (Y)
                                    962 
                           000001   963 OPTIMIZE = 1
                           000001   964 .if OPTIMIZE 
                                    965 ; remplacement de CALL EXIT par 
                                    966 ; le opcode de RET.
                                    967 ; Voir modification au code de ";"
                           000000   968 .else 
                                    969 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    970 ;       EXIT    ( -- )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 22.
Hexadecimal [24-Bits]



                                    971 ;       Terminate a colon definition.
                                    972 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    973 ;       _HEADER EXIT,4,"EXIT"
                                    974 EXIT:
                                    975         POPW Y
                                    976         RET
                                    977 .endif 
                                    978 
                                    979 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    980 ;       !       ( w a -- )
                                    981 ;       Pop  data stack to memory.
                                    982 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0004CD                        983         _HEADER STORE,1,"!"
      00854D 85 3C                    1         .word LINK 
                           0004CF     2         LINK=.
      00854F 01                       3         .byte 1  
      008550 21                       4         .ascii "!"
      008551                          5         STORE:
      008551 90 93            [ 1]  984         LDW Y,X
      008553 90 FE            [ 2]  985         LDW Y,(Y)    ;Y=a
      008555 89               [ 2]  986         PUSHW X
      008556 EE 02            [ 2]  987         LDW X,(2,X) ; x=w 
      008558 90 FF            [ 2]  988         LDW (Y),X 
      00855A 85               [ 2]  989         POPW X  
      00855B 1C 00 04         [ 2]  990         ADDW X,#4 ; DDROP 
      00855E 81               [ 4]  991         RET     
                                    992 
                                    993 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    994 ;       @       ( a -- w )
                                    995 ;       Push memory location to stack.
                                    996 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0004DF                        997         _HEADER AT,1,"@"
      00855F 85 4F                    1         .word LINK 
                           0004E1     2         LINK=.
      008561 01                       3         .byte 1  
      008562 40                       4         .ascii "@"
      008563                          5         AT:
      008563 90 93            [ 1]  998         LDW Y,X     ;Y = a
      008565 90 FE            [ 2]  999         LDW Y,(Y)   ; address 
      008567 90 FE            [ 2] 1000         LDW Y,(Y)   ; value 
      008569 FF               [ 2] 1001         LDW (X),Y ;w = @Y
      00856A 81               [ 4] 1002         RET     
                                   1003 
                                   1004 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1005 ;       C!      ( c b -- )
                                   1006 ;       Pop  data stack to byte memory.
                                   1007 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0004EB                       1008         _HEADER CSTOR,2,"C!"
      00856B 85 61                    1         .word LINK 
                           0004ED     2         LINK=.
      00856D 02                       3         .byte 2  
      00856E 43 21                    4         .ascii "C!"
      008570                          5         CSTOR:
      008570 90 93            [ 1] 1009         LDW Y,X
      008572 90 FE            [ 2] 1010 	LDW Y,(Y)    ;Y=b
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 23.
Hexadecimal [24-Bits]



      008574 E6 03            [ 1] 1011         LD A,(3,X)    ;D = c
      008576 90 F7            [ 1] 1012         LD  (Y),A     ;store c at b
      008578 1C 00 04         [ 2] 1013 	ADDW X,#4 ; DDROP 
      00857B 81               [ 4] 1014         RET     
                                   1015 
                                   1016 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1017 ;       C@      ( b -- c )
                                   1018 ;       Push byte in memory to  stack.
                                   1019 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0004FC                       1020         _HEADER CAT,2,"C@"
      00857C 85 6D                    1         .word LINK 
                           0004FE     2         LINK=.
      00857E 02                       3         .byte 2  
      00857F 43 40                    4         .ascii "C@"
      008581                          5         CAT:
      008581 90 93            [ 1] 1021         LDW Y,X     ;Y=b
      008583 90 FE            [ 2] 1022         LDW Y,(Y)
      008585 90 F6            [ 1] 1023         LD A,(Y)
      008587 E7 01            [ 1] 1024         LD (1,X),A
      008589 7F               [ 1] 1025         CLR (X)
      00858A 81               [ 4] 1026         RET     
                                   1027 
                                   1028 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1029 ;       RP@     ( -- a )
                                   1030 ;       Push current RP to data stack.
                                   1031 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00050B                       1032         _HEADER RPAT,3,"RP@"
      00858B 85 7E                    1         .word LINK 
                           00050D     2         LINK=.
      00858D 03                       3         .byte 3  
      00858E 52 50 40                 4         .ascii "RP@"
      008591                          5         RPAT:
      008591 90 96            [ 1] 1033         LDW Y,SP    ;save return addr
      008593 1D 00 02         [ 2] 1034         SUBW X,#2
      008596 FF               [ 2] 1035         LDW (X),Y
      008597 81               [ 4] 1036         RET     
                                   1037 
                                   1038 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1039 ;       RP!     ( a -- )
                                   1040 ;       Set  return stack pointer.
                                   1041 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000518                       1042         _HEADER RPSTO,COMPO+3,"RP!"
      008598 85 8D                    1         .word LINK 
                           00051A     2         LINK=.
      00859A 43                       3         .byte COMPO+3  
      00859B 52 50 21                 4         .ascii "RP!"
      00859E                          5         RPSTO:
      00859E 90 85            [ 2] 1043         POPW Y
      0085A0 90 BF 26         [ 2] 1044         LDW YTEMP,Y
      0085A3 90 93            [ 1] 1045         LDW Y,X
      0085A5 90 FE            [ 2] 1046         LDW Y,(Y)
      0085A7 90 94            [ 1] 1047         LDW SP,Y
      0085A9 1C 00 02         [ 2] 1048         ADDW X,#CELLL ; a was not dropped, Picatout 2020-05-24
      0085AC 92 CC 26         [ 5] 1049         JP [YTEMP]
                                   1050 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 24.
Hexadecimal [24-Bits]



                                   1051 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1052 ;       R>      ( -- w )
                                   1053 ;       Pop return stack to data stack.
                                   1054 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00052F                       1055         _HEADER RFROM,2,"R>"
      0085AF 85 9A                    1         .word LINK 
                           000531     2         LINK=.
      0085B1 02                       3         .byte 2  
      0085B2 52 3E                    4         .ascii "R>"
      0085B4                          5         RFROM:
      0085B4 1D 00 02         [ 2] 1056         SUBW X,#CELLL 
      0085B7 16 03            [ 2] 1057         LDW Y,(3,SP)
      0085B9 FF               [ 2] 1058         LDW (X),Y 
      0085BA 90 85            [ 2] 1059         POPW Y 
      0085BC 5B 02            [ 2] 1060         ADDW SP,#2 
      0085BE 90 FC            [ 2] 1061         JP (Y)
                                   1062 
                                   1063 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1064 ;       R@      ( -- w )
                                   1065 ;       Copy top of return stack to stack.
                                   1066 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000540                       1067         _HEADER RAT,2,"R@"
      0085C0 85 B1                    1         .word LINK 
                           000542     2         LINK=.
      0085C2 02                       3         .byte 2  
      0085C3 52 40                    4         .ascii "R@"
      0085C5                          5         RAT:
      0085C5 16 03            [ 2] 1068         ldw y,(3,sp)
      0085C7 1D 00 02         [ 2] 1069         subw x,#CELLL 
      0085CA FF               [ 2] 1070         ldw (x),y 
      0085CB 81               [ 4] 1071         ret 
                                   1072 
                                   1073 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1074 ;       LOCAL ( n -- )
                                   1075 ;       reserve n slots on return stack
                                   1076 ;       for local variables 
                                   1077 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00054C                       1078         _HEADER LOCAL,5,"LOCAL"
      0085CC 85 C2                    1         .word LINK 
                           00054E     2         LINK=.
      0085CE 05                       3         .byte 5  
      0085CF 4C 4F 43 41 4C           4         .ascii "LOCAL"
      0085D4                          5         LOCAL:
      0085D4 90 85            [ 2] 1079         POPW Y  
      0085D6 90 BF 26         [ 2] 1080         LDW YTEMP,Y ; RETURN ADDRESS 
      0085D9 90 5F            [ 1] 1081         CLRW Y 
      0085DB E6 01            [ 1] 1082         LD A,(1,X)
      0085DD 90 97            [ 1] 1083         LD YL,A 
      0085DF A6 02            [ 1] 1084         LD A,#CELLL 
      0085E1 90 42            [ 4] 1085         MUL Y,A 
      0085E3 90 BF 24         [ 2] 1086         LDw XTEMP,Y
      0085E6 90 96            [ 1] 1087         LDW Y,SP 
      0085E8 72 B2 00 24      [ 2] 1088         SUBW Y,XTEMP
      0085EC 90 94            [ 1] 1089         LDW SP,Y 
      0085EE 1C 00 02         [ 2] 1090         ADDW X,#CELLL 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 25.
Hexadecimal [24-Bits]



      0085F1 92 CC 26         [ 5] 1091         JP [YTEMP]
                                   1092 
                                   1093 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1094 ;       NRDROP ( n -- )
                                   1095 ;       drop n elements from rstack
                                   1096 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000574                       1097         _HEADER NRDROP,6,"NRDROP" 
      0085F4 85 CE                    1         .word LINK 
                           000576     2         LINK=.
      0085F6 06                       3         .byte 6  
      0085F7 4E 52 44 52 4F 50        4         .ascii "NRDROP"
      0085FD                          5         NRDROP:
      0085FD 90 85            [ 2] 1098         POPW Y 
      0085FF 90 BF 26         [ 2] 1099         LDW YTEMP,Y ; RETOURN ADDRESS 
      008602 90 5F            [ 1] 1100         CLRW Y 
      008604 E6 01            [ 1] 1101         LD A,(1,X)
      008606 90 97            [ 1] 1102         LD YL,A  
      008608 A6 02            [ 1] 1103         LD A,#CELLL 
      00860A 90 42            [ 4] 1104         MUL Y,A 
      00860C 90 BF 24         [ 2] 1105         LDW XTEMP,Y 
      00860F 90 96            [ 1] 1106         LDW Y,SP 
      008611 72 B9 00 24      [ 2] 1107         ADDW Y,XTEMP 
      008615 90 94            [ 1] 1108         LDW SP,Y  
      008617 1C 00 02         [ 2] 1109         ADDW X,#CELLL 
      00861A 92 CC 26         [ 5] 1110         JP [YTEMP]
                                   1111 
                                   1112 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1113 ;      NR@ ( n -- w)
                                   1114 ;      fetch nth element ofr return stack 
                                   1115 ;      n==0 is same as R@ 
                                   1116 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00059D                       1117         _HEADER NRAT,3,"NR@"
      00861D 85 F6                    1         .word LINK 
                           00059F     2         LINK=.
      00861F 03                       3         .byte 3  
      008620 4E 52 40                 4         .ascii "NR@"
      008623                          5         NRAT:
      008623 90 5F            [ 1] 1118         CLRW Y 
      008625 E6 01            [ 1] 1119         LD A,(1,X)
      008627 90 97            [ 1] 1120         LD YL,A 
      008629 A6 02            [ 1] 1121         LD A,#CELLL 
      00862B 90 42            [ 4] 1122         MUL Y,A 
      00862D 90 BF 26         [ 2] 1123         LDW YTEMP,Y 
      008630 90 96            [ 1] 1124         LDW Y,SP 
      008632 72 A9 00 03      [ 2] 1125         ADDW Y,#3 
      008636 72 B9 00 26      [ 2] 1126         ADDW Y,YTEMP 
      00863A 90 FE            [ 2] 1127         LDW Y,(Y)
      00863C FF               [ 2] 1128         LDW (X),Y 
      00863D 81               [ 4] 1129         RET 
                                   1130 
                                   1131 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1132 ;       NR! ( w n --  )
                                   1133 ;       store w on nth position of 
                                   1134 ;       return stack 
                                   1135 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 26.
Hexadecimal [24-Bits]



      0005BE                       1136         _HEADER NRSTO,3,"NR!"
      00863E 86 1F                    1         .word LINK 
                           0005C0     2         LINK=.
      008640 03                       3         .byte 3  
      008641 4E 52 21                 4         .ascii "NR!"
      008644                          5         NRSTO:
      008644 90 96            [ 1] 1137         LDW Y,SP
      008646 72 A9 00 03      [ 2] 1138         ADDW Y,#3 
      00864A 90 BF 26         [ 2] 1139         LDW YTEMP,Y 
      00864D 90 5F            [ 1] 1140         CLRW Y 
      00864F E6 01            [ 1] 1141         LD A,(1,X)
      008651 90 97            [ 1] 1142         LD YL,A 
      008653 A6 02            [ 1] 1143         LD A,#CELLL 
      008655 90 42            [ 4] 1144         MUL Y,A 
      008657 72 B9 00 26      [ 2] 1145         ADDW Y,YTEMP
      00865B 89               [ 2] 1146         PUSHW X 
      00865C EE 02            [ 2] 1147         LDW X,(2,X)
      00865E 90 FF            [ 2] 1148         LDW (Y),X
      008660 85               [ 2] 1149         POPW X 
      008661 1C 00 04         [ 2] 1150         ADDW X,#2*CELLL 
      008664 81               [ 4] 1151         RET 
                                   1152 
                                   1153 
                                   1154 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1155 ;       >R      ( w -- )
                                   1156 ;       Push data stack to return stack.
                                   1157 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0005E5                       1158         _HEADER TOR,COMPO+2,">R"
      008665 86 40                    1         .word LINK 
                           0005E7     2         LINK=.
      008667 42                       3         .byte COMPO+2  
      008668 3E 52                    4         .ascii ">R"
      00866A                          5         TOR:
      00866A 90 85            [ 2] 1159         POPW Y    ;save return addr
      00866C 90 BF 26         [ 2] 1160         LDW YTEMP,Y
      00866F 90 93            [ 1] 1161         LDW Y,X
      008671 90 FE            [ 2] 1162         LDW Y,(Y)  ; W
      008673 90 89            [ 2] 1163         PUSHW Y    ;W >R 
      008675 1C 00 02         [ 2] 1164         ADDW X,#2
      008678 92 CC 26         [ 5] 1165         JP [YTEMP]
                                   1166 
                                   1167 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1168 ;       SP@     ( -- a )
                                   1169 ;       Push current stack pointer.
                                   1170 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0005FB                       1171         _HEADER SPAT,3,"SP@"
      00867B 86 67                    1         .word LINK 
                           0005FD     2         LINK=.
      00867D 03                       3         .byte 3  
      00867E 53 50 40                 4         .ascii "SP@"
      008681                          5         SPAT:
      008681 90 93            [ 1] 1172 	LDW Y,X
      008683 1D 00 02         [ 2] 1173         SUBW X,#2
      008686 FF               [ 2] 1174 	LDW (X),Y
      008687 81               [ 4] 1175         RET     
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 27.
Hexadecimal [24-Bits]



                                   1176 
                                   1177 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1178 ;       SP!     ( a -- )
                                   1179 ;       Set  data stack pointer.
                                   1180 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000608                       1181         _HEADER SPSTO,3,"SP!"
      008688 86 7D                    1         .word LINK 
                           00060A     2         LINK=.
      00868A 03                       3         .byte 3  
      00868B 53 50 21                 4         .ascii "SP!"
      00868E                          5         SPSTO:
      00868E FE               [ 2] 1182         LDW     X,(X)     ;X = a
      00868F 81               [ 4] 1183         RET     
                                   1184 
                                   1185 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1186 ;       DROP    ( w -- )
                                   1187 ;       Discard top stack item.
                                   1188 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000610                       1189         _HEADER DROP,4,"DROP"
      008690 86 8A                    1         .word LINK 
                           000612     2         LINK=.
      008692 04                       3         .byte 4  
      008693 44 52 4F 50              4         .ascii "DROP"
      008697                          5         DROP:
      008697 1C 00 02         [ 2] 1190         ADDW X,#2     
      00869A 81               [ 4] 1191         RET     
                                   1192 
                                   1193 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1194 ;       DUP     ( w -- w w )
                                   1195 ;       Duplicate  top stack item.
                                   1196 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00061B                       1197         _HEADER DUPP,3,"DUP"
      00869B 86 92                    1         .word LINK 
                           00061D     2         LINK=.
      00869D 03                       3         .byte 3  
      00869E 44 55 50                 4         .ascii "DUP"
      0086A1                          5         DUPP:
      0086A1 90 93            [ 1] 1198 	LDW Y,X
      0086A3 1D 00 02         [ 2] 1199         SUBW X,#2
      0086A6 90 FE            [ 2] 1200 	LDW Y,(Y)
      0086A8 FF               [ 2] 1201 	LDW (X),Y
      0086A9 81               [ 4] 1202         RET     
                                   1203 
                                   1204 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1205 ;       SWAP    ( w1 w2 -- w2 w1 )
                                   1206 ;       Exchange top two stack items.
                                   1207 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00062A                       1208         _HEADER SWAPP,4,"SWAP"
      0086AA 86 9D                    1         .word LINK 
                           00062C     2         LINK=.
      0086AC 04                       3         .byte 4  
      0086AD 53 57 41 50              4         .ascii "SWAP"
      0086B1                          5         SWAPP:
      0086B1 90 93            [ 1] 1209         LDW Y,X
      0086B3 90 FE            [ 2] 1210         LDW Y,(Y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 28.
Hexadecimal [24-Bits]



      0086B5 90 89            [ 2] 1211         PUSHW Y  
      0086B7 90 93            [ 1] 1212         LDW Y,X
      0086B9 90 EE 02         [ 2] 1213         LDW Y,(2,Y)
      0086BC FF               [ 2] 1214         LDW (X),Y
      0086BD 90 85            [ 2] 1215         POPW Y 
      0086BF EF 02            [ 2] 1216         LDW (2,X),Y
      0086C1 81               [ 4] 1217         RET     
                                   1218 
                                   1219 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1220 ;       OVER    ( w1 w2 -- w1 w2 w1 )
                                   1221 ;       Copy second stack item to top.
                                   1222 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000642                       1223         _HEADER OVER,4,"OVER"
      0086C2 86 AC                    1         .word LINK 
                           000644     2         LINK=.
      0086C4 04                       3         .byte 4  
      0086C5 4F 56 45 52              4         .ascii "OVER"
      0086C9                          5         OVER:
      0086C9 1D 00 02         [ 2] 1224         SUBW X,#2
      0086CC 90 93            [ 1] 1225         LDW Y,X
      0086CE 90 EE 04         [ 2] 1226         LDW Y,(4,Y)
      0086D1 FF               [ 2] 1227         LDW (X),Y
      0086D2 81               [ 4] 1228         RET     
                                   1229 
                                   1230 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1231 ;       0<      ( n -- t )
                                   1232 ;       Return true if n is negative.
                                   1233 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000653                       1234         _HEADER ZLESS,2,"0<"
      0086D3 86 C4                    1         .word LINK 
                           000655     2         LINK=.
      0086D5 02                       3         .byte 2  
      0086D6 30 3C                    4         .ascii "0<"
      0086D8                          5         ZLESS:
      0086D8 A6 FF            [ 1] 1235         LD A,#0xFF
      0086DA 90 93            [ 1] 1236         LDW Y,X
      0086DC 90 FE            [ 2] 1237         LDW Y,(Y)
      0086DE 2B 01            [ 1] 1238         JRMI     ZL1
      0086E0 4F               [ 1] 1239         CLR A   ;false
      0086E1 F7               [ 1] 1240 ZL1:    LD     (X),A
      0086E2 E7 01            [ 1] 1241         LD (1,X),A
      0086E4 81               [ 4] 1242 	RET     
                                   1243 
                                   1244 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1245 ;       0= ( n -- f )
                                   1246 ;   n==0?
                                   1247 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000665                       1248         _HEADER ZEQUAL,2,"0="
      0086E5 86 D5                    1         .word LINK 
                           000667     2         LINK=.
      0086E7 02                       3         .byte 2  
      0086E8 30 3D                    4         .ascii "0="
      0086EA                          5         ZEQUAL:
      0086EA A6 FF            [ 1] 1249         LD A,#0XFF 
      0086EC 90 93            [ 1] 1250         LDW Y,X 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 29.
Hexadecimal [24-Bits]



      0086EE 90 FE            [ 2] 1251         LDW Y,(Y)
      0086F0 27 02            [ 1] 1252         JREQ ZEQU1 
      0086F2 A6 00            [ 1] 1253         LD A,#0 
      0086F4                       1254 ZEQU1:  
      0086F4 F7               [ 1] 1255         LD (X),A 
      0086F5 E7 01            [ 1] 1256         LD (1,X),A         
      0086F7 81               [ 4] 1257         RET 
                                   1258 
                                   1259 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1260 ;       AND     ( w w -- w )
                                   1261 ;       Bitwise AND.
                                   1262 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000678                       1263         _HEADER ANDD,3,"AND"
      0086F8 86 E7                    1         .word LINK 
                           00067A     2         LINK=.
      0086FA 03                       3         .byte 3  
      0086FB 41 4E 44                 4         .ascii "AND"
      0086FE                          5         ANDD:
      0086FE F6               [ 1] 1264         LD  A,(X)    ;D=w
      0086FF E4 02            [ 1] 1265         AND A,(2,X)
      008701 E7 02            [ 1] 1266         LD (2,X),A
      008703 E6 01            [ 1] 1267         LD A,(1,X)
      008705 E4 03            [ 1] 1268         AND A,(3,X)
      008707 E7 03            [ 1] 1269         LD (3,X),A
      008709 1C 00 02         [ 2] 1270         ADDW X,#2
      00870C 81               [ 4] 1271         RET
                                   1272 
                                   1273 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1274 ;       OR      ( w w -- w )
                                   1275 ;       Bitwise inclusive OR.
                                   1276 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00068D                       1277         _HEADER ORR,2,"OR"
      00870D 86 FA                    1         .word LINK 
                           00068F     2         LINK=.
      00870F 02                       3         .byte 2  
      008710 4F 52                    4         .ascii "OR"
      008712                          5         ORR:
      008712 F6               [ 1] 1278         LD A,(X)    ;D=w
      008713 EA 02            [ 1] 1279         OR A,(2,X)
      008715 E7 02            [ 1] 1280         LD (2,X),A
      008717 E6 01            [ 1] 1281         LD A,(1,X)
      008719 EA 03            [ 1] 1282         OR A,(3,X)
      00871B E7 03            [ 1] 1283         LD (3,X),A
      00871D 1C 00 02         [ 2] 1284         ADDW X,#2
      008720 81               [ 4] 1285         RET
                                   1286 
                                   1287 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1288 ;       XOR     ( w w -- w )
                                   1289 ;       Bitwise exclusive OR.
                                   1290 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0006A1                       1291         _HEADER XORR,3,"XOR"
      008721 87 0F                    1         .word LINK 
                           0006A3     2         LINK=.
      008723 03                       3         .byte 3  
      008724 58 4F 52                 4         .ascii "XOR"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 30.
Hexadecimal [24-Bits]



      008727                          5         XORR:
      008727 F6               [ 1] 1292         LD A,(X)    ;D=w
      008728 E8 02            [ 1] 1293         XOR A,(2,X)
      00872A E7 02            [ 1] 1294         LD (2,X),A
      00872C E6 01            [ 1] 1295         LD A,(1,X)
      00872E E8 03            [ 1] 1296         XOR A,(3,X)
      008730 E7 03            [ 1] 1297         LD (3,X),A
      008732 1C 00 02         [ 2] 1298         ADDW X,#2
      008735 81               [ 4] 1299         RET
                                   1300 
                                   1301 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1302 ;       UM+     ( u u -- udsum )
                                   1303 ;       Add two unsigned single
                                   1304 ;       and return a double sum.
                                   1305 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0006B6                       1306         _HEADER UPLUS,3,"UM+"
      008736 87 23                    1         .word LINK 
                           0006B8     2         LINK=.
      008738 03                       3         .byte 3  
      008739 55 4D 2B                 4         .ascii "UM+"
      00873C                          5         UPLUS:
      00873C A6 01            [ 1] 1307         LD A,#1
      00873E 90 93            [ 1] 1308         LDW Y,X
      008740 90 EE 02         [ 2] 1309         LDW Y,(2,Y)
      008743 90 BF 26         [ 2] 1310         LDW YTEMP,Y
      008746 90 93            [ 1] 1311         LDW Y,X
      008748 90 FE            [ 2] 1312         LDW Y,(Y)
      00874A 72 B9 00 26      [ 2] 1313         ADDW Y,YTEMP
      00874E EF 02            [ 2] 1314         LDW (2,X),Y
      008750 25 01            [ 1] 1315         JRC     UPL1
      008752 4F               [ 1] 1316         CLR A
      008753 E7 01            [ 1] 1317 UPL1:   LD     (1,X),A
      008755 7F               [ 1] 1318         CLR (X)
      008756 81               [ 4] 1319         RET
                                   1320 
                                   1321 ;; System and user variables
                                   1322 
                                   1323 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1324 ;       doVAR   ( -- a )
                                   1325 ;       run time code 
                                   1326 ;       for VARIABLE and CREATE.
                                   1327 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1328 ;       HEADER DOVAR,COMPO+5,"DOVAR"
      008757                       1329 DOVAR:
      008757 1D 00 02         [ 2] 1330 	SUBW X,#2
      00875A 90 85            [ 2] 1331         POPW Y    ;get return addr (pfa)
      00875C 90 FE            [ 2] 1332         LDW Y,(Y) ; indirect address 
      00875E FF               [ 2] 1333         LDW (X),Y    ;push on stack
      00875F 81               [ 4] 1334         RET     ;go to RET of EXEC
                                   1335 
                                   1336 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1337 ;       BASE    ( -- a )
                                   1338 ;       Radix base for numeric I/O.
                                   1339 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0006E0                       1340         _HEADER BASE,4,"BASE"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 31.
Hexadecimal [24-Bits]



      008760 87 38                    1         .word LINK 
                           0006E2     2         LINK=.
      008762 04                       3         .byte 4  
      008763 42 41 53 45              4         .ascii "BASE"
      008767                          5         BASE:
      008767 90 AE 00 06      [ 2] 1341 	LDW Y,#UBASE 
      00876B 1D 00 02         [ 2] 1342 	SUBW X,#2
      00876E FF               [ 2] 1343         LDW (X),Y
      00876F 81               [ 4] 1344         RET
                                   1345 
                                   1346 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1347 ;       tmp     ( -- a )
                                   1348 ;       A temporary storage.
                                   1349 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0006F0                       1350         _HEADER TEMP,3,"TMP"
      008770 87 62                    1         .word LINK 
                           0006F2     2         LINK=.
      008772 03                       3         .byte 3  
      008773 54 4D 50                 4         .ascii "TMP"
      008776                          5         TEMP:
      008776 90 AE 00 0A      [ 2] 1351 	LDW Y,#UTMP
      00877A 1D 00 02         [ 2] 1352 	SUBW X,#2
      00877D FF               [ 2] 1353         LDW (X),Y
      00877E 81               [ 4] 1354         RET
                                   1355 
                                   1356 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1357 ;       >IN     ( -- a )
                                   1358 ;        Hold parsing pointer.
                                   1359 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0006FF                       1360         _HEADER INN,3,">IN"
      00877F 87 72                    1         .word LINK 
                           000701     2         LINK=.
      008781 03                       3         .byte 3  
      008782 3E 49 4E                 4         .ascii ">IN"
      008785                          5         INN:
      008785 90 AE 00 0C      [ 2] 1361 	LDW Y,#UINN 
      008789 1D 00 02         [ 2] 1362 	SUBW X,#2
      00878C FF               [ 2] 1363         LDW (X),Y
      00878D 81               [ 4] 1364         RET
                                   1365 
                                   1366 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1367 ;       #TIB    ( -- a )
                                   1368 ;       Count in terminal input 
                                   1369 ;       buffer.
                                   1370 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00070E                       1371         _HEADER NTIB,4,"#TIB"
      00878E 87 81                    1         .word LINK 
                           000710     2         LINK=.
      008790 04                       3         .byte 4  
      008791 23 54 49 42              4         .ascii "#TIB"
      008795                          5         NTIB:
      008795 90 AE 00 0E      [ 2] 1372 	LDW Y,#UCTIB 
      008799 1D 00 02         [ 2] 1373 	SUBW X,#2
      00879C FF               [ 2] 1374         LDW (X),Y
      00879D 81               [ 4] 1375         RET
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 32.
Hexadecimal [24-Bits]



                                   1376 
                                   1377 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1378 ;       TBUF ( -- a )
                                   1379 ;       address of 128 bytes 
                                   1380 ;       transaction buffer
                                   1381 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00071E                       1382         _HEADER TBUF,4,"TBUF"
      00879E 87 90                    1         .word LINK 
                           000720     2         LINK=.
      0087A0 04                       3         .byte 4  
      0087A1 54 42 55 46              4         .ascii "TBUF"
      0087A5                          5         TBUF:
      0087A5 90 AE 16 80      [ 2] 1383         ldw y,#ROWBUFF
      0087A9 1D 00 02         [ 2] 1384         subw x,#CELLL
      0087AC FF               [ 2] 1385         ldw (x),y 
      0087AD 81               [ 4] 1386         ret 
                                   1387 
                                   1388 ; systeme variable 
                                   1389 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1390 ; compilation destination 
                                   1391 ; TFLASH ( -- A )
                                   1392 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00072E                       1393         _HEADER TFLASH,6,"TFLASH"
      0087AE 87 A0                    1         .word LINK 
                           000730     2         LINK=.
      0087B0 06                       3         .byte 6  
      0087B1 54 46 4C 41 53 48        4         .ascii "TFLASH"
      0087B7                          5         TFLASH:
      0087B7 1D 00 02         [ 2] 1394         subw x,#CELLL 
      0087BA 90 AE 00 20      [ 2] 1395         ldw y,#UTFLASH
      0087BE FF               [ 2] 1396         ldw (x),y 
      0087BF 81               [ 4] 1397         ret 
                                   1398 
                                   1399 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1400 ;       "EVAL   ( -- a )
                                   1401 ;       Execution vector of EVAL.
                                   1402 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000740                       1403         _HEADER TEVAL,5,"'EVAL"
      0087C0 87 B0                    1         .word LINK 
                           000742     2         LINK=.
      0087C2 05                       3         .byte 5  
      0087C3 27 45 56 41 4C           4         .ascii "'EVAL"
      0087C8                          5         TEVAL:
      0087C8 90 AE 00 12      [ 2] 1404 	LDW Y,#UINTER 
      0087CC 1D 00 02         [ 2] 1405 	SUBW X,#2
      0087CF FF               [ 2] 1406         LDW (X),Y
      0087D0 81               [ 4] 1407         RET
                                   1408 
                                   1409 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1410 ;       HLD     ( -- a )
                                   1411 ;       Hold a pointer of output
                                   1412 ;        string.
                                   1413 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000751                       1414         _HEADER HLD,3,"HLD"
      0087D1 87 C2                    1         .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 33.
Hexadecimal [24-Bits]



                           000753     2         LINK=.
      0087D3 03                       3         .byte 3  
      0087D4 48 4C 44                 4         .ascii "HLD"
      0087D7                          5         HLD:
      0087D7 90 AE 00 14      [ 2] 1415 	LDW Y,#UHLD 
      0087DB 1D 00 02         [ 2] 1416 	SUBW X,#2
      0087DE FF               [ 2] 1417         LDW (X),Y
      0087DF 81               [ 4] 1418         RET
                                   1419 
                                   1420 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1421 ;       CONTEXT ( -- a )
                                   1422 ;       Start vocabulary search.
                                   1423 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000760                       1424         _HEADER CNTXT,7,"CONTEXT"
      0087E0 87 D3                    1         .word LINK 
                           000762     2         LINK=.
      0087E2 07                       3         .byte 7  
      0087E3 43 4F 4E 54 45 58 54     4         .ascii "CONTEXT"
      0087EA                          5         CNTXT:
      0087EA 90 AE 00 16      [ 2] 1425 	LDW Y,#UCNTXT
      0087EE 1D 00 02         [ 2] 1426 	SUBW X,#2
      0087F1 FF               [ 2] 1427         LDW (X),Y
      0087F2 81               [ 4] 1428         RET
                                   1429 
                                   1430 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1431 ;       VP      ( -- a )
                                   1432 ;       Point to top of variables
                                   1433 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000773                       1434         _HEADER VPP,2,"VP"
      0087F3 87 E2                    1         .word LINK 
                           000775     2         LINK=.
      0087F5 02                       3         .byte 2  
      0087F6 56 50                    4         .ascii "VP"
      0087F8                          5         VPP:
      0087F8 90 AE 00 18      [ 2] 1435 	LDW Y,#UVP 
      0087FC 1D 00 02         [ 2] 1436 	SUBW X,#2
      0087FF FF               [ 2] 1437         LDW (X),Y
      008800 81               [ 4] 1438         RET
                                   1439 
                                   1440 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1441 ;       CP    ( -- a )
                                   1442 ;       Pointer to top of FLASH 
                                   1443 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000781                       1444         _HEADER CPP,2,"CP"
      008801 87 F5                    1         .word LINK 
                           000783     2         LINK=.
      008803 02                       3         .byte 2  
      008804 43 50                    4         .ascii "CP"
      008806                          5         CPP:
      008806 90 AE 00 1A      [ 2] 1445         ldw y,#UCP 
      00880A 1D 00 02         [ 2] 1446         subw x,#CELLL 
      00880D FF               [ 2] 1447         ldw (x),y 
      00880E 81               [ 4] 1448         ret                
                                   1449 
                                   1450 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



                                   1451 ;       LAST    ( -- a )
                                   1452 ;       Point to last name in 
                                   1453 ;       dictionary.
                                   1454 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00078F                       1455         _HEADER LAST,4,"LAST"
      00880F 88 03                    1         .word LINK 
                           000791     2         LINK=.
      008811 04                       3         .byte 4  
      008812 4C 41 53 54              4         .ascii "LAST"
      008816                          5         LAST:
      008816 90 AE 00 1C      [ 2] 1456 	LDW Y,#ULAST 
      00881A 1D 00 02         [ 2] 1457 	SUBW X,#2
      00881D FF               [ 2] 1458         LDW (X),Y
      00881E 81               [ 4] 1459         RET
                                   1460 
                                   1461 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1462 ; address of system variable URLAST 
                                   1463 ;       RAMLAST ( -- a )
                                   1464 ; RAM dictionary context 
                                   1465 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00079F                       1466         _HEADER RAMLAST,7,"RAMLAST"
      00881F 88 11                    1         .word LINK 
                           0007A1     2         LINK=.
      008821 07                       3         .byte 7  
      008822 52 41 4D 4C 41 53 54     4         .ascii "RAMLAST"
      008829                          5         RAMLAST:
      008829 90 AE 00 22      [ 2] 1467         ldw y,#URLAST 
      00882D 1D 00 02         [ 2] 1468         subw x,#CELLL 
      008830 FF               [ 2] 1469         ldw (x),y 
      008831 81               [ 4] 1470         ret 
                                   1471 
                                   1472 ;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1473 ;       OFFSET ( -- a )
                                   1474 ;       address of system 
                                   1475 ;       variable OFFSET 
                                   1476 ;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0007B2                       1477         _HEADER OFFSET,6,"OFFSET"
      008832 88 21                    1         .word LINK 
                           0007B4     2         LINK=.
      008834 06                       3         .byte 6  
      008835 4F 46 46 53 45 54        4         .ascii "OFFSET"
      00883B                          5         OFFSET:
      00883B 1D 00 02         [ 2] 1478         subw x,#CELLL
      00883E 90 AE 00 1E      [ 2] 1479         ldw y,#UOFFSET 
      008842 FF               [ 2] 1480         ldw (x),y 
      008843 81               [ 4] 1481         ret 
                                   1482 
                                   1483 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1484 ; adjust jump address 
                                   1485 ;  adding OFFSET
                                   1486 ; ADR-ADJ ( a -- a+offset )
                                   1487 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      008844                       1488 ADRADJ: 
      008844 CD 88 3B         [ 4] 1489         call OFFSET 
      008847 CD 85 63         [ 4] 1490         call AT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



      00884A CC 88 C6         [ 2] 1491         jp PLUS 
                                   1492 
                                   1493 
                                   1494 ;; Common functions
                                   1495 
                                   1496 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1497 ;       ?DUP    ( w -- w w | 0 )
                                   1498 ;       Dup tos if its is not zero.
                                   1499 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0007CD                       1500         _HEADER QDUP,4,"?DUP"
      00884D 88 34                    1         .word LINK 
                           0007CF     2         LINK=.
      00884F 04                       3         .byte 4  
      008850 3F 44 55 50              4         .ascii "?DUP"
      008854                          5         QDUP:
      008854 90 93            [ 1] 1501         LDW Y,X
      008856 90 FE            [ 2] 1502 	LDW Y,(Y)
      008858 27 04            [ 1] 1503         JREQ     QDUP1
      00885A 1D 00 02         [ 2] 1504 	SUBW X,#2
      00885D FF               [ 2] 1505         LDW (X),Y
      00885E 81               [ 4] 1506 QDUP1:  RET
                                   1507 
                                   1508 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1509 ;       ROT     ( w1 w2 w3 -- w2 w3 w1 )
                                   1510 ;       Rot 3rd item to top.
                                   1511 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0007DF                       1512         _HEADER ROT,3,"ROT"
      00885F 88 4F                    1         .word LINK 
                           0007E1     2         LINK=.
      008861 03                       3         .byte 3  
      008862 52 4F 54                 4         .ascii "ROT"
      008865                          5         ROT:
      008865 90 93            [ 1] 1513         ldw y,x 
      008867 90 FE            [ 2] 1514         ldw y,(y)
      008869 90 89            [ 2] 1515         pushw y 
      00886B 90 93            [ 1] 1516         ldw y,x 
      00886D 90 EE 04         [ 2] 1517         ldw y,(4,y)
      008870 FF               [ 2] 1518         ldw (x),y 
      008871 90 93            [ 1] 1519         ldw y,x 
      008873 90 EE 02         [ 2] 1520         ldw y,(2,y)
      008876 EF 04            [ 2] 1521         ldw (4,x),y 
      008878 90 85            [ 2] 1522         popw y 
      00887A EF 02            [ 2] 1523         ldw (2,x),y
      00887C 81               [ 4] 1524         ret 
                                   1525 
                                   1526 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1527 ;    <ROT ( n1 n2 n3 -- n3 n1 n2 )
                                   1528 ;    rotate left 3 top elements 
                                   1529 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0007FD                       1530     _HEADER NROT,4,"<ROT"
      00887D 88 61                    1         .word LINK 
                           0007FF     2         LINK=.
      00887F 04                       3         .byte 4  
      008880 3C 52 4F 54              4         .ascii "<ROT"
      008884                          5         NROT:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 36.
Hexadecimal [24-Bits]



      008884 90 93            [ 1] 1531     LDW Y,X 
      008886 90 FE            [ 2] 1532     LDW Y,(Y)
      008888 90 BF 26         [ 2] 1533     LDW YTEMP,Y ; n3  
      00888B 90 93            [ 1] 1534     LDW Y,X 
      00888D 90 EE 02         [ 2] 1535     LDW Y,(2,Y) ; Y = n2 
      008890 FF               [ 2] 1536     LDW (X),Y   ; TOS = n2 
      008891 90 93            [ 1] 1537     LDW Y,X    
      008893 90 EE 04         [ 2] 1538     LDW Y,(4,Y) ; Y = n1 
      008896 EF 02            [ 2] 1539     LDW (2,X),Y ;   = n1 
      008898 90 BE 26         [ 2] 1540     LDW Y,YTEMP 
      00889B EF 04            [ 2] 1541     LDW (4,X),Y ; = n3 
      00889D 81               [ 4] 1542     RET 
                                   1543 
                                   1544 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1545 ;       2DROP   ( w w -- )
                                   1546 ;       Discard two items on stack.
                                   1547 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00081E                       1548         _HEADER DDROP,5,"2DROP"
      00889E 88 7F                    1         .word LINK 
                           000820     2         LINK=.
      0088A0 05                       3         .byte 5  
      0088A1 32 44 52 4F 50           4         .ascii "2DROP"
      0088A6                          5         DDROP:
      0088A6 1C 00 04         [ 2] 1549         ADDW X,#4
      0088A9 81               [ 4] 1550         RET
                                   1551 
                                   1552 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1553 ;       2DUP    ( w1 w2 -- w1 w2 w1 w2 )
                                   1554 ;       Duplicate top two items.
                                   1555 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00082A                       1556         _HEADER DDUP,4,"2DUP"
      0088AA 88 A0                    1         .word LINK 
                           00082C     2         LINK=.
      0088AC 04                       3         .byte 4  
      0088AD 32 44 55 50              4         .ascii "2DUP"
      0088B1                          5         DDUP:
      0088B1 1D 00 04         [ 2] 1557         SUBW X,#4
      0088B4 90 93            [ 1] 1558         LDW Y,X
      0088B6 90 EE 06         [ 2] 1559         LDW Y,(6,Y)
      0088B9 EF 02            [ 2] 1560         LDW (2,X),Y
      0088BB 90 93            [ 1] 1561         LDW Y,X
      0088BD 90 EE 04         [ 2] 1562         LDW Y,(4,Y)
      0088C0 FF               [ 2] 1563         LDW (X),Y
      0088C1 81               [ 4] 1564         RET
                                   1565 
                                   1566 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1567 ;       +       ( w w -- sum )
                                   1568 ;       Add top two items.
                                   1569 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000842                       1570         _HEADER PLUS,1,"+"
      0088C2 88 AC                    1         .word LINK 
                           000844     2         LINK=.
      0088C4 01                       3         .byte 1  
      0088C5 2B                       4         .ascii "+"
      0088C6                          5         PLUS:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 37.
Hexadecimal [24-Bits]



      0088C6 90 93            [ 1] 1571         LDW Y,X
      0088C8 90 FE            [ 2] 1572         LDW Y,(Y)
      0088CA 90 BF 26         [ 2] 1573         LDW YTEMP,Y
      0088CD 1C 00 02         [ 2] 1574         ADDW X,#2
      0088D0 90 93            [ 1] 1575         LDW Y,X
      0088D2 90 FE            [ 2] 1576         LDW Y,(Y)
      0088D4 72 B9 00 26      [ 2] 1577         ADDW Y,YTEMP
      0088D8 FF               [ 2] 1578         LDW (X),Y
      0088D9 81               [ 4] 1579         RET
                                   1580 
                                   1581 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1582 ;       TRUE ( -- -1 )
                                   1583 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00085A                       1584         _HEADER TRUE,4,"TRUE"
      0088DA 88 C4                    1         .word LINK 
                           00085C     2         LINK=.
      0088DC 04                       3         .byte 4  
      0088DD 54 52 55 45              4         .ascii "TRUE"
      0088E1                          5         TRUE:
      0088E1 A6 FF            [ 1] 1585         LD A,#255 
      0088E3 1D 00 02         [ 2] 1586         SUBW X,#CELLL
      0088E6 F7               [ 1] 1587         LD (X),A 
      0088E7 E7 01            [ 1] 1588         LD (1,X),A 
      0088E9 81               [ 4] 1589         RET 
                                   1590 
                                   1591 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1592 ;       FALSE ( -- 0 )
                                   1593 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0088EA CC 8C 61         [ 2] 1594         JP ZERO 
                                   1595 
                                   1596 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1597 ;       NOT     ( w -- w )
                                   1598 ;       One's complement of tos.
                                   1599 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00086D                       1600         _HEADER INVER,3,"NOT"
      0088ED 88 DC                    1         .word LINK 
                           00086F     2         LINK=.
      0088EF 03                       3         .byte 3  
      0088F0 4E 4F 54                 4         .ascii "NOT"
      0088F3                          5         INVER:
      0088F3 90 93            [ 1] 1601         LDW Y,X
      0088F5 90 FE            [ 2] 1602         LDW Y,(Y)
      0088F7 90 53            [ 2] 1603         CPLW Y
      0088F9 FF               [ 2] 1604         LDW (X),Y
      0088FA 81               [ 4] 1605         RET
                                   1606 
                                   1607 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1608 ;       NEGATE  ( n -- -n )
                                   1609 ;       Two's complement of tos.
                                   1610 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00087B                       1611         _HEADER NEGAT,6,"NEGATE"
      0088FB 88 EF                    1         .word LINK 
                           00087D     2         LINK=.
      0088FD 06                       3         .byte 6  
      0088FE 4E 45 47 41 54 45        4         .ascii "NEGATE"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



      008904                          5         NEGAT:
      008904 90 93            [ 1] 1612         LDW Y,X
      008906 90 FE            [ 2] 1613         LDW Y,(Y)
      008908 90 50            [ 2] 1614         NEGW Y
      00890A FF               [ 2] 1615         LDW (X),Y
      00890B 81               [ 4] 1616         RET
                                   1617 
                                   1618 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1619 ;       DNEGATE ( d -- -d )
                                   1620 ;       Two's complement of top double.
                                   1621 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00088C                       1622         _HEADER DNEGA,7,"DNEGATE"
      00890C 88 FD                    1         .word LINK 
                           00088E     2         LINK=.
      00890E 07                       3         .byte 7  
      00890F 44 4E 45 47 41 54 45     4         .ascii "DNEGATE"
      008916                          5         DNEGA:
      008916 90 93            [ 1] 1623         LDW Y,X
      008918 90 FE            [ 2] 1624 	LDW Y,(Y)
      00891A 90 53            [ 2] 1625         CPLW Y
      00891C 90 89            [ 2] 1626         PUSHW Y      ; Y >R 
      00891E 90 93            [ 1] 1627         LDW Y,X
      008920 90 EE 02         [ 2] 1628         LDW Y,(2,Y)
      008923 90 53            [ 2] 1629         CPLW Y
      008925 72 A9 00 01      [ 2] 1630         addw y,#1
      008929 EF 02            [ 2] 1631         LDW (2,X),Y
      00892B 90 85            [ 2] 1632         POPW Y       ; R> Y  
      00892D 24 02            [ 1] 1633         JRNC DN1 
      00892F 90 5C            [ 1] 1634         INCW Y
      008931 FF               [ 2] 1635 DN1:    LDW (X),Y
      008932 81               [ 4] 1636         RET
                                   1637 
                                   1638 
                                   1639 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1640 ;       S>D ( n -- d )
                                   1641 ; convert single integer to double 
                                   1642 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0008B3                       1643         _HEADER STOD,3,"S>D"
      008933 89 0E                    1         .word LINK 
                           0008B5     2         LINK=.
      008935 03                       3         .byte 3  
      008936 53 3E 44                 4         .ascii "S>D"
      008939                          5         STOD:
      008939 1D 00 02         [ 2] 1644         subw x,#CELLL 
      00893C 90 5F            [ 1] 1645         clrw y 
      00893E FF               [ 2] 1646         ldw (x),y 
      00893F 90 93            [ 1] 1647         ldw y,x 
      008941 90 EE 02         [ 2] 1648         ldw y,(2,y)
      008944 2A 05            [ 1] 1649         jrpl 1$ 
      008946 90 AE FF FF      [ 2] 1650         ldw y,#-1
      00894A FF               [ 2] 1651         ldw (x),y 
      00894B 81               [ 4] 1652 1$:     ret 
                                   1653 
                                   1654 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1655 ;       -       ( n1 n2 -- n1-n2 )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 39.
Hexadecimal [24-Bits]



                                   1656 ;       Subtraction.
                                   1657 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0008CC                       1658         _HEADER SUBB,1,"-"
      00894C 89 35                    1         .word LINK 
                           0008CE     2         LINK=.
      00894E 01                       3         .byte 1  
      00894F 2D                       4         .ascii "-"
      008950                          5         SUBB:
      008950 90 93            [ 1] 1659         LDW Y,X
      008952 90 FE            [ 2] 1660         LDW Y,(Y)
      008954 90 BF 26         [ 2] 1661         LDW YTEMP,Y
      008957 1C 00 02         [ 2] 1662         ADDW X,#2
      00895A 90 93            [ 1] 1663         LDW Y,X
      00895C 90 FE            [ 2] 1664         LDW Y,(Y)
      00895E 72 B2 00 26      [ 2] 1665         SUBW Y,YTEMP
      008962 FF               [ 2] 1666         LDW (X),Y
      008963 81               [ 4] 1667         RET
                                   1668 
                                   1669 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1670 ;       ABS     ( n -- n )
                                   1671 ;       Return  absolute value of n.
                                   1672 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0008E4                       1673         _HEADER ABSS,3,"ABS"
      008964 89 4E                    1         .word LINK 
                           0008E6     2         LINK=.
      008966 03                       3         .byte 3  
      008967 41 42 53                 4         .ascii "ABS"
      00896A                          5         ABSS:
      00896A 90 93            [ 1] 1674         LDW Y,X
      00896C 90 FE            [ 2] 1675 	LDW Y,(Y)
      00896E 2A 03            [ 1] 1676         JRPL     AB1     ;negate:
      008970 90 50            [ 2] 1677         NEGW     Y     ;else negate hi byte
      008972 FF               [ 2] 1678         LDW (X),Y
      008973 81               [ 4] 1679 AB1:    RET
                                   1680 
                                   1681 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1682 ;       =       ( w w -- t )
                                   1683 ;       Return true if top two are =al.
                                   1684 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0008F4                       1685         _HEADER EQUAL,1,"="
      008974 89 66                    1         .word LINK 
                           0008F6     2         LINK=.
      008976 01                       3         .byte 1  
      008977 3D                       4         .ascii "="
      008978                          5         EQUAL:
      008978 A6 FF            [ 1] 1686         LD A,#0xFF  ;true
      00897A 90 93            [ 1] 1687         LDW Y,X    ;D = n2
      00897C 90 FE            [ 2] 1688         LDW Y,(Y)
      00897E 90 BF 26         [ 2] 1689         LDW YTEMP,Y
      008981 1C 00 02         [ 2] 1690         ADDW X,#2
      008984 90 93            [ 1] 1691         LDW Y,X
      008986 90 FE            [ 2] 1692         LDW Y,(Y)
      008988 90 B3 26         [ 2] 1693         CPW Y,YTEMP     ;if n2 <> n1
      00898B 27 01            [ 1] 1694         JREQ     EQ1
      00898D 4F               [ 1] 1695         CLR A
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 40.
Hexadecimal [24-Bits]



      00898E F7               [ 1] 1696 EQ1:    LD (X),A
      00898F E7 01            [ 1] 1697         LD (1,X),A
      008991 81               [ 4] 1698 	RET     
                                   1699 
                                   1700 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1701 ;       U<      ( u u -- t )
                                   1702 ;       Unsigned compare of top two items.
                                   1703 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000912                       1704         _HEADER ULESS,2,"U<"
      008992 89 76                    1         .word LINK 
                           000914     2         LINK=.
      008994 02                       3         .byte 2  
      008995 55 3C                    4         .ascii "U<"
      008997                          5         ULESS:
      008997 A6 FF            [ 1] 1705         LD A,#0xFF  ;true
      008999 90 93            [ 1] 1706         LDW Y,X    ;D = n2
      00899B 90 FE            [ 2] 1707         LDW Y,(Y)
      00899D 90 BF 26         [ 2] 1708         LDW YTEMP,Y
      0089A0 1C 00 02         [ 2] 1709         ADDW X,#2
      0089A3 90 93            [ 1] 1710         LDW Y,X
      0089A5 90 FE            [ 2] 1711         LDW Y,(Y)
      0089A7 90 B3 26         [ 2] 1712         CPW Y,YTEMP     ;if n2 <> n1
      0089AA 25 01            [ 1] 1713         JRULT     ULES1
      0089AC 4F               [ 1] 1714         CLR A
      0089AD F7               [ 1] 1715 ULES1:  LD (X),A
      0089AE E7 01            [ 1] 1716         LD (1,X),A
      0089B0 81               [ 4] 1717 	RET     
                                   1718 
                                   1719 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1720 ;       <       ( n1 n2 -- t )
                                   1721 ;       Signed compare of top two items.
                                   1722 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000931                       1723         _HEADER LESS,1,"<"
      0089B1 89 94                    1         .word LINK 
                           000933     2         LINK=.
      0089B3 01                       3         .byte 1  
      0089B4 3C                       4         .ascii "<"
      0089B5                          5         LESS:
      0089B5 A6 FF            [ 1] 1724         LD A,#0xFF  ;true
      0089B7 90 93            [ 1] 1725         LDW Y,X    ;D = n2
      0089B9 90 FE            [ 2] 1726         LDW Y,(Y)
      0089BB 90 BF 26         [ 2] 1727         LDW YTEMP,Y
      0089BE 1C 00 02         [ 2] 1728         ADDW X,#2
      0089C1 90 93            [ 1] 1729         LDW Y,X
      0089C3 90 FE            [ 2] 1730         LDW Y,(Y)
      0089C5 90 B3 26         [ 2] 1731         CPW Y,YTEMP     ;if n2 <> n1
      0089C8 2F 01            [ 1] 1732         JRSLT     LT1
      0089CA 4F               [ 1] 1733         CLR A
      0089CB F7               [ 1] 1734 LT1:    LD (X),A
      0089CC E7 01            [ 1] 1735         LD (1,X),A
      0089CE 81               [ 4] 1736 	RET     
                                   1737 
                                   1738 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1739 ;   U> ( u1 u2 -- f )
                                   1740 ;   f = true if u1>u2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



                                   1741 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00094F                       1742     _HEADER UGREAT,2,"U>"
      0089CF 89 B3                    1         .word LINK 
                           000951     2         LINK=.
      0089D1 02                       3         .byte 2  
      0089D2 55 3E                    4         .ascii "U>"
      0089D4                          5         UGREAT:
      0089D4 A6 00            [ 1] 1743     LD A,#0 
      0089D6 90 93            [ 1] 1744     LDW Y,X 
      0089D8 90 FE            [ 2] 1745     LDW Y,(Y)
      0089DA 90 BF 26         [ 2] 1746     LDW YTEMP,Y 
      0089DD 1C 00 02         [ 2] 1747     ADDW X,#2 
      0089E0 90 93            [ 1] 1748     LDW Y,X
      0089E2 90 FE            [ 2] 1749     LDW Y,(Y)
      0089E4 90 B3 26         [ 2] 1750     CPW Y,YTEMP 
      0089E7 23 02            [ 2] 1751     JRULE UGREAT1 
      0089E9 A6 FF            [ 1] 1752     LD A,#0xff  
      0089EB                       1753 UGREAT1:
      0089EB F7               [ 1] 1754     LD (X),A 
      0089EC E7 01            [ 1] 1755     LD (1,X),A 
      0089EE 81               [ 4] 1756     RET 
                                   1757 
                                   1758 
                                   1759 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1760 ;       >   (n1 n2 -- f )
                                   1761 ;  signed compare n1 n2 
                                   1762 ;  true if n1 > n2 
                                   1763 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00096F                       1764         _HEADER GREAT,1,">"
      0089EF 89 D1                    1         .word LINK 
                           000971     2         LINK=.
      0089F1 01                       3         .byte 1  
      0089F2 3E                       4         .ascii ">"
      0089F3                          5         GREAT:
      0089F3 A6 FF            [ 1] 1765         LD A,#0xFF ;
      0089F5 90 93            [ 1] 1766         LDW Y,X 
      0089F7 90 FE            [ 2] 1767         LDW Y,(Y)
      0089F9 90 BF 26         [ 2] 1768         LDW YTEMP,Y 
      0089FC 1C 00 02         [ 2] 1769         ADDW X,#2 
      0089FF 90 93            [ 1] 1770         LDW Y,X 
      008A01 90 FE            [ 2] 1771         LDW Y,(Y)
      008A03 90 B3 26         [ 2] 1772         CPW  Y,YTEMP 
      008A06 2C 01            [ 1] 1773         JRSGT GREAT1 
      008A08 4F               [ 1] 1774         CLR  A
      008A09                       1775 GREAT1:
      008A09 F7               [ 1] 1776         LD (X),A 
      008A0A E7 01            [ 1] 1777         LD (1,X),A 
      008A0C 81               [ 4] 1778         RET 
                                   1779 
                                   1780 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1781 ;       MAX     ( n n -- n )
                                   1782 ;       Return greater of two top items.
                                   1783 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00098D                       1784         _HEADER MAX,3,"MAX"
      008A0D 89 F1                    1         .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal [24-Bits]



                           00098F     2         LINK=.
      008A0F 03                       3         .byte 3  
      008A10 4D 41 58                 4         .ascii "MAX"
      008A13                          5         MAX:
      008A13 90 93            [ 1] 1785         LDW Y,X    ;D = n2
      008A15 90 EE 02         [ 2] 1786         LDW Y,(2,Y)
      008A18 90 BF 26         [ 2] 1787         LDW YTEMP,Y
      008A1B 90 93            [ 1] 1788         LDW Y,X
      008A1D 90 FE            [ 2] 1789         LDW Y,(Y)
      008A1F 90 B3 26         [ 2] 1790         CPW Y,YTEMP     ;if n2 <> n1
      008A22 2F 02            [ 1] 1791         JRSLT     MAX1
      008A24 EF 02            [ 2] 1792         LDW (2,X),Y
      008A26 1C 00 02         [ 2] 1793 MAX1:   ADDW X,#2
      008A29 81               [ 4] 1794 	RET     
                                   1795 
                                   1796 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1797 ;       MIN     ( n n -- n )
                                   1798 ;       Return smaller of top two items.
                                   1799 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0009AA                       1800         _HEADER MIN,3,"MIN"
      008A2A 8A 0F                    1         .word LINK 
                           0009AC     2         LINK=.
      008A2C 03                       3         .byte 3  
      008A2D 4D 49 4E                 4         .ascii "MIN"
      008A30                          5         MIN:
      008A30 90 93            [ 1] 1801         LDW Y,X    ;D = n2
      008A32 90 EE 02         [ 2] 1802         LDW Y,(2,Y)
      008A35 90 BF 26         [ 2] 1803         LDW YTEMP,Y
      008A38 90 93            [ 1] 1804         LDW Y,X
      008A3A 90 FE            [ 2] 1805         LDW Y,(Y)
      008A3C 90 B3 26         [ 2] 1806         CPW Y,YTEMP     ;if n2 <> n1
      008A3F 2C 02            [ 1] 1807         JRSGT     MIN1
      008A41 EF 02            [ 2] 1808         LDW (2,X),Y
      008A43 1C 00 02         [ 2] 1809 MIN1:	ADDW X,#2
      008A46 81               [ 4] 1810 	RET     
                                   1811 
                                   1812 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1813 ;       WITHIN  ( u ul uh -- t )
                                   1814 ;       Return true if u is within
                                   1815 ;       range of ul and uh. ( ul <= u < uh )
                                   1816 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0009C7                       1817         _HEADER WITHI,6,"WITHIN"
      008A47 8A 2C                    1         .word LINK 
                           0009C9     2         LINK=.
      008A49 06                       3         .byte 6  
      008A4A 57 49 54 48 49 4E        4         .ascii "WITHIN"
      008A50                          5         WITHI:
      008A50 CD 86 C9         [ 4] 1818         CALL     OVER
      008A53 CD 89 50         [ 4] 1819         CALL     SUBB
      008A56 CD 86 6A         [ 4] 1820         CALL     TOR
      008A59 CD 89 50         [ 4] 1821         CALL     SUBB
      008A5C CD 85 B4         [ 4] 1822         CALL     RFROM
      008A5F CC 89 97         [ 2] 1823         JP     ULESS
                                   1824 
                                   1825 ;; Divide
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
Hexadecimal [24-Bits]



                                   1826 
                                   1827 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1828 ;       UM/MOD  ( udl udh un -- ur uq )
                                   1829 ;       Unsigned divide of a double by a
                                   1830 ;       single. Return mod and quotient.
                                   1831 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0009E2                       1832         _HEADER UMMOD,6,"UM/MOD"
      008A62 8A 49                    1         .word LINK 
                           0009E4     2         LINK=.
      008A64 06                       3         .byte 6  
      008A65 55 4D 2F 4D 4F 44        4         .ascii "UM/MOD"
      008A6B                          5         UMMOD:
                                   1833 ; 2021-02-22
                                   1834 ; changed algortihm for Jeeek one 
                                   1835 ; ref: https://github.com/TG9541/stm8ef/pull/406        
      008A6B 90 93            [ 1] 1836         LDW     Y,X             ; stack pointer to Y
      008A6D FE               [ 2] 1837         LDW     X,(X)           ; un
      008A6E BF 26            [ 2] 1838         LDW     YTEMP,X         ; save un
      008A70 93               [ 1] 1839         LDW     X,Y
      008A71 5C               [ 1] 1840         INCW    X               ; drop un
      008A72 5C               [ 1] 1841         INCW    X
      008A73 89               [ 2] 1842         PUSHW   X               ; save stack pointer
      008A74 FE               [ 2] 1843         LDW     X,(X)           ; X=udh
      008A75 90 EE 04         [ 2] 1844         LDW     Y,(4,Y)         ; Y=udl (offset before drop)
      008A78 B3 26            [ 2] 1845         CPW     X,YTEMP
      008A7A 25 0B            [ 1] 1846         JRULT   MMSM1           ; X is still on the R-stack
      008A7C 85               [ 2] 1847         POPW    X               ; restore stack pointer
      008A7D 90 AE FF FF      [ 2] 1848         LDW     Y,#0xFFFF       ; overflow result:
      008A81 FF               [ 2] 1849         LDW     (X),Y           ; quotient max. 16 bit value
      008A82 90 5F            [ 1] 1850         CLRW    Y
      008A84 EF 02            [ 2] 1851         LDW     (2,X),Y         ; remainder 0
      008A86 81               [ 4] 1852         RET
      008A87                       1853 MMSM1:
      008A87 A6 10            [ 1] 1854         LD      A,#16           ; loop count
      008A89 90 58            [ 2] 1855         SLLW    Y               ; udl shift udl into udh
      008A8B                       1856 MMSM3:
      008A8B 59               [ 2] 1857         RLCW    X               ; rotate udl bit into uhdh (= remainder)
      008A8C 25 04            [ 1] 1858         JRC     MMSMa           ; if carry out of rotate
      008A8E B3 26            [ 2] 1859         CPW     X,YTEMP         ; compare udh to un
      008A90 25 05            [ 1] 1860         JRULT   MMSM4           ; can't subtract
      008A92                       1861 MMSMa:
      008A92 72 B0 00 26      [ 2] 1862         SUBW    X,YTEMP         ; can subtract
      008A96 98               [ 1] 1863         RCF
      008A97                       1864 MMSM4:
      008A97 8C               [ 1] 1865         CCF                     ; quotient bit
      008A98 90 59            [ 2] 1866         RLCW    Y               ; rotate into quotient, rotate out udl
      008A9A 4A               [ 1] 1867         DEC     A               ; repeat
      008A9B 26 EE            [ 1] 1868         JRNE    MMSM3           ; if A == 0
      008A9D                       1869 MMSMb:
      008A9D BF 26            [ 2] 1870         LDW     YTEMP,X         ; done, save remainder
      008A9F 85               [ 2] 1871         POPW    X               ; restore stack pointer
      008AA0 FF               [ 2] 1872         LDW     (X),Y           ; save quotient
      008AA1 90 BE 26         [ 2] 1873         LDW     Y,YTEMP         ; remainder onto stack
      008AA4 EF 02            [ 2] 1874         LDW     (2,X),Y
      008AA6 81               [ 4] 1875         RET
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



                                   1876 
                                   1877 
                                   1878 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
                                   1879 ;       M/MOD   ( d n -- r q )
                                   1880 ;       Signed floored divide of double by
                                   1881 ;       single. Return mod and quotient.
                                   1882 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000A27                       1883         _HEADER MSMOD,5,"M/MOD"
      008AA7 8A 64                    1         .word LINK 
                           000A29     2         LINK=.
      008AA9 05                       3         .byte 5  
      008AAA 4D 2F 4D 4F 44           4         .ascii "M/MOD"
      008AAF                          5         MSMOD:
      008AAF CD 86 A1         [ 4] 1884         CALL	DUPP
      008AB2 CD 86 D8         [ 4] 1885         CALL	ZLESS
      008AB5 CD 86 A1         [ 4] 1886         CALL	DUPP
      008AB8 CD 86 6A         [ 4] 1887         CALL	TOR
      008ABB CD 85 18         [ 4] 1888         CALL	QBRAN
      008ABE 8A CC                 1889         .word	MMOD1
      008AC0 CD 89 04         [ 4] 1890         CALL	NEGAT
      008AC3 CD 86 6A         [ 4] 1891         CALL	TOR
      008AC6 CD 89 16         [ 4] 1892         CALL	DNEGA
      008AC9 CD 85 B4         [ 4] 1893         CALL	RFROM
      008ACC CD 86 6A         [ 4] 1894 MMOD1:	CALL	TOR
      008ACF CD 86 A1         [ 4] 1895         CALL	DUPP
      008AD2 CD 86 D8         [ 4] 1896         CALL	ZLESS
      008AD5 CD 85 18         [ 4] 1897         CALL	QBRAN
      008AD8 8A E0                 1898         .word	MMOD2
      008ADA CD 85 C5         [ 4] 1899         CALL	RAT
      008ADD CD 88 C6         [ 4] 1900         CALL	PLUS
      008AE0 CD 85 B4         [ 4] 1901 MMOD2:	CALL	RFROM
      008AE3 CD 8A 6B         [ 4] 1902         CALL	UMMOD
      008AE6 CD 85 B4         [ 4] 1903         CALL	RFROM
      008AE9 CD 85 18         [ 4] 1904         CALL	QBRAN
      008AEC 8A F7                 1905         .word	MMOD3
      008AEE CD 86 B1         [ 4] 1906         CALL	SWAPP
      008AF1 CD 89 04         [ 4] 1907         CALL	NEGAT
      008AF4 CD 86 B1         [ 4] 1908         CALL	SWAPP
      008AF7 81               [ 4] 1909 MMOD3:	RET
                                   1910 
                                   1911 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1912 ;       /MOD    ( n n -- r q )
                                   1913 ;       Signed divide. Return mod 
                                   1914 ;       and quotient.
                                   1915 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000A78                       1916         _HEADER SLMOD,4,"/MOD"
      008AF8 8A A9                    1         .word LINK 
                           000A7A     2         LINK=.
      008AFA 04                       3         .byte 4  
      008AFB 2F 4D 4F 44              4         .ascii "/MOD"
      008AFF                          5         SLMOD:
      008AFF CD 86 C9         [ 4] 1917         CALL	OVER
      008B02 CD 86 D8         [ 4] 1918         CALL	ZLESS
      008B05 CD 86 B1         [ 4] 1919         CALL	SWAPP
      008B08 CC 8A AF         [ 2] 1920         JP	MSMOD
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



                                   1921 
                                   1922 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1923 ;       MOD     ( n n -- r )
                                   1924 ;       Signed divide. Return mod only.
                                   1925 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000A8B                       1926         _HEADER MODD,3,"MOD"
      008B0B 8A FA                    1         .word LINK 
                           000A8D     2         LINK=.
      008B0D 03                       3         .byte 3  
      008B0E 4D 4F 44                 4         .ascii "MOD"
      008B11                          5         MODD:
      008B11 CD 8A FF         [ 4] 1927 	CALL	SLMOD
      008B14 CC 86 97         [ 2] 1928 	JP	DROP
                                   1929 
                                   1930 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1931 ;       /       ( n n -- q )
                                   1932 ;       Signed divide. Return quotient only.
                                   1933 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000A97                       1934         _HEADER SLASH,1,"/"
      008B17 8B 0D                    1         .word LINK 
                           000A99     2         LINK=.
      008B19 01                       3         .byte 1  
      008B1A 2F                       4         .ascii "/"
      008B1B                          5         SLASH:
      008B1B CD 8A FF         [ 4] 1935         CALL	SLMOD
      008B1E CD 86 B1         [ 4] 1936         CALL	SWAPP
      008B21 CC 86 97         [ 2] 1937         JP	DROP
                                   1938 
                                   1939 ;; Multiply
                                   1940 
                                   1941 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1942 ;       UM*     ( u u -- ud )
                                   1943 ;       Unsigned multiply. Return 
                                   1944 ;       double product.
                                   1945 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000AA4                       1946         _HEADER UMSTA,3,"UM*"
      008B24 8B 19                    1         .word LINK 
                           000AA6     2         LINK=.
      008B26 03                       3         .byte 3  
      008B27 55 4D 2A                 4         .ascii "UM*"
      008B2A                          5         UMSTA:
                                   1947 ; stack have 4 bytes u1=a,b u2=c,d
                                   1948 ; take advantage of SP addressing modes
                                   1949 ; these PRODx in RAM are not required
                                   1950 ; the product is kept on stack as local variable 
                                   1951         ;; bytes offset on data stack 
                           000002  1952         da=2 
                           000003  1953         db=3 
                           000000  1954         dc=0 
                           000001  1955         dd=1 
                                   1956         ;; product bytes offset on return stack 
                           000001  1957         UD1=1  ; ud bits 31..24
                           000002  1958         UD2=2  ; ud bits 23..16
                           000003  1959         UD3=3  ; ud bits 15..8 
                           000004  1960         UD4=4  ; ud bits 7..0 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



                                   1961         ;; local variable for product set to zero   
      008B2A 90 5F            [ 1] 1962         clrw y 
      008B2C 90 89            [ 2] 1963         pushw y  ; bits 15..0
      008B2E 90 89            [ 2] 1964         pushw y  ; bits 31..16 
      008B30 E6 03            [ 1] 1965         ld a,(db,x) ; b 
      008B32 90 97            [ 1] 1966         ld yl,a 
      008B34 E6 01            [ 1] 1967         ld a,(dd,x)   ; d
      008B36 90 42            [ 4] 1968         mul y,a    ; b*d  
      008B38 17 03            [ 2] 1969         ldw (UD3,sp),y ; lowest weight product 
      008B3A E6 03            [ 1] 1970         ld a,(db,x)
      008B3C 90 97            [ 1] 1971         ld yl,a 
      008B3E E6 00            [ 1] 1972         ld a,(dc,x)
      008B40 90 42            [ 4] 1973         mul y,a  ; b*c 
                                   1974         ;;; do the partial sum 
      008B42 72 F9 02         [ 2] 1975         addw y,(UD2,sp)
      008B45 4F               [ 1] 1976         clr a 
      008B46 49               [ 1] 1977         rlc a
      008B47 6B 01            [ 1] 1978         ld (UD1,sp),a 
      008B49 17 02            [ 2] 1979         ldw (UD2,sp),y 
      008B4B E6 02            [ 1] 1980         ld a,(da,x)
      008B4D 90 97            [ 1] 1981         ld yl,a 
      008B4F E6 01            [ 1] 1982         ld a,(dd,x)
      008B51 90 42            [ 4] 1983         mul y,a   ; a*d 
                                   1984         ;; do partial sum 
      008B53 72 F9 02         [ 2] 1985         addw y,(UD2,sp)
      008B56 4F               [ 1] 1986         clr a 
      008B57 19 01            [ 1] 1987         adc a,(UD1,sp)
      008B59 6B 01            [ 1] 1988         ld (UD1,sp),a  
      008B5B 17 02            [ 2] 1989         ldw (UD2,sp),y 
      008B5D E6 02            [ 1] 1990         ld a,(da,x)
      008B5F 90 97            [ 1] 1991         ld yl,a 
      008B61 E6 00            [ 1] 1992         ld a,(dc,x)
      008B63 90 42            [ 4] 1993         mul y,a  ;  a*c highest weight product 
                                   1994         ;;; do partial sum 
      008B65 72 F9 01         [ 2] 1995         addw y,(UD1,sp)
      008B68 FF               [ 2] 1996         ldw (x),y  ; udh 
      008B69 16 03            [ 2] 1997         ldw y,(UD3,sp)
      008B6B EF 02            [ 2] 1998         ldw (2,x),y  ; udl  
      008B6D 5B 04            [ 2] 1999         addw sp,#4 ; drop local variable 
      008B6F 81               [ 4] 2000         ret  
                                   2001 
                                   2002 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2003 ;       *       ( n n -- n )
                                   2004 ;       Signed multiply. Return 
                                   2005 ;       single product.
                                   2006 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000AF0                       2007         _HEADER STAR,1,"*"
      008B70 8B 26                    1         .word LINK 
                           000AF2     2         LINK=.
      008B72 01                       3         .byte 1  
      008B73 2A                       4         .ascii "*"
      008B74                          5         STAR:
      008B74 CD 8B 2A         [ 4] 2008 	CALL	UMSTA
      008B77 CC 86 97         [ 2] 2009 	JP	DROP
                                   2010 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



                                   2011 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2012 ;       M*      ( n n -- d )
                                   2013 ;       Signed multiply. Return 
                                   2014 ;       double product.
                                   2015 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000AFA                       2016         _HEADER MSTAR,2,"M*"
      008B7A 8B 72                    1         .word LINK 
                           000AFC     2         LINK=.
      008B7C 02                       3         .byte 2  
      008B7D 4D 2A                    4         .ascii "M*"
      008B7F                          5         MSTAR:
      008B7F CD 88 B1         [ 4] 2017         CALL	DDUP
      008B82 CD 87 27         [ 4] 2018         CALL	XORR
      008B85 CD 86 D8         [ 4] 2019         CALL	ZLESS
      008B88 CD 86 6A         [ 4] 2020         CALL	TOR
      008B8B CD 89 6A         [ 4] 2021         CALL	ABSS
      008B8E CD 86 B1         [ 4] 2022         CALL	SWAPP
      008B91 CD 89 6A         [ 4] 2023         CALL	ABSS
      008B94 CD 8B 2A         [ 4] 2024         CALL	UMSTA
      008B97 CD 85 B4         [ 4] 2025         CALL	RFROM
      008B9A CD 85 18         [ 4] 2026         CALL	QBRAN
      008B9D 8B A2                 2027         .word	MSTA1
      008B9F CD 89 16         [ 4] 2028         CALL	DNEGA
      008BA2 81               [ 4] 2029 MSTA1:	RET
                                   2030 
                                   2031 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2032 ;       */MOD   ( n1 n2 n3 -- r q )
                                   2033 ;       Multiply n1 and n2, then divide
                                   2034 ;       by n3. Return mod and quotient.
                                   2035 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000B23                       2036         _HEADER SSMOD,5,"*/MOD"
      008BA3 8B 7C                    1         .word LINK 
                           000B25     2         LINK=.
      008BA5 05                       3         .byte 5  
      008BA6 2A 2F 4D 4F 44           4         .ascii "*/MOD"
      008BAB                          5         SSMOD:
      008BAB CD 86 6A         [ 4] 2037         CALL     TOR
      008BAE CD 8B 7F         [ 4] 2038         CALL     MSTAR
      008BB1 CD 85 B4         [ 4] 2039         CALL     RFROM
      008BB4 CC 8A AF         [ 2] 2040         JP     MSMOD
                                   2041 
                                   2042 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2043 ;       */      ( n1 n2 n3 -- q )
                                   2044 ;       Multiply n1 by n2, then divide
                                   2045 ;       by n3. Return quotient only.
                                   2046 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000B37                       2047         _HEADER STASL,2,"*/"
      008BB7 8B A5                    1         .word LINK 
                           000B39     2         LINK=.
      008BB9 02                       3         .byte 2  
      008BBA 2A 2F                    4         .ascii "*/"
      008BBC                          5         STASL:
      008BBC CD 8B AB         [ 4] 2048         CALL	SSMOD
      008BBF CD 86 B1         [ 4] 2049         CALL	SWAPP
      008BC2 CC 86 97         [ 2] 2050         JP	DROP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



                                   2051 
                                   2052 ;; Miscellaneous
                                   2053 
                                   2054 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2055 ;       CELL+   ( a -- a )
                                   2056 ;       Add cell size in byte to address.
                                   2057 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000B45                       2058         _HEADER CELLP,2,"2+"
      008BC5 8B B9                    1         .word LINK 
                           000B47     2         LINK=.
      008BC7 02                       3         .byte 2  
      008BC8 32 2B                    4         .ascii "2+"
      008BCA                          5         CELLP:
      008BCA 90 93            [ 1] 2059         LDW Y,X
      008BCC 90 FE            [ 2] 2060 	LDW Y,(Y)
      008BCE 72 A9 00 02      [ 2] 2061         ADDW Y,#CELLL 
      008BD2 FF               [ 2] 2062         LDW (X),Y
      008BD3 81               [ 4] 2063         RET
                                   2064 
                                   2065 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2066 ;       CELL-   ( a -- a )
                                   2067 ;       Subtract 2 from address.
                                   2068 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000B54                       2069         _HEADER CELLM,2,"2-"
      008BD4 8B C7                    1         .word LINK 
                           000B56     2         LINK=.
      008BD6 02                       3         .byte 2  
      008BD7 32 2D                    4         .ascii "2-"
      008BD9                          5         CELLM:
      008BD9 90 93            [ 1] 2070         LDW Y,X
      008BDB 90 FE            [ 2] 2071 	LDW Y,(Y)
      008BDD 72 A2 00 02      [ 2] 2072         SUBW Y,#CELLL
      008BE1 FF               [ 2] 2073         LDW (X),Y
      008BE2 81               [ 4] 2074         RET
                                   2075 
                                   2076 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2077 ;       CELLS   ( n -- n )
                                   2078 ;       Multiply tos by 2.
                                   2079 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000B63                       2080         _HEADER CELLS,2,"2*"
      008BE3 8B D6                    1         .word LINK 
                           000B65     2         LINK=.
      008BE5 02                       3         .byte 2  
      008BE6 32 2A                    4         .ascii "2*"
      008BE8                          5         CELLS:
      008BE8 90 93            [ 1] 2081         LDW Y,X
      008BEA 90 FE            [ 2] 2082 	LDW Y,(Y)
      008BEC 90 58            [ 2] 2083         SLAW Y
      008BEE FF               [ 2] 2084         LDW (X),Y
      008BEF 81               [ 4] 2085         RET
                                   2086 
                                   2087 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2088 ;       1+      ( a -- a )
                                   2089 ;       Add cell size in byte 
                                   2090 ;       to address.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



                                   2091 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000B70                       2092         _HEADER ONEP,2,"1+"
      008BF0 8B E5                    1         .word LINK 
                           000B72     2         LINK=.
      008BF2 02                       3         .byte 2  
      008BF3 31 2B                    4         .ascii "1+"
      008BF5                          5         ONEP:
      008BF5 90 93            [ 1] 2093         LDW Y,X
      008BF7 90 FE            [ 2] 2094 	LDW Y,(Y)
      008BF9 90 5C            [ 1] 2095         INCW Y
      008BFB FF               [ 2] 2096         LDW (X),Y
      008BFC 81               [ 4] 2097         RET
                                   2098 
                                   2099 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2100 ;       1-      ( a -- a )
                                   2101 ;       Subtract 2 from address.
                                   2102 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000B7D                       2103         _HEADER ONEM,2,"1-"
      008BFD 8B F2                    1         .word LINK 
                           000B7F     2         LINK=.
      008BFF 02                       3         .byte 2  
      008C00 31 2D                    4         .ascii "1-"
      008C02                          5         ONEM:
      008C02 90 93            [ 1] 2104         LDW Y,X
      008C04 90 FE            [ 2] 2105 	LDW Y,(Y)
      008C06 90 5A            [ 2] 2106         DECW Y
      008C08 FF               [ 2] 2107         LDW (X),Y
      008C09 81               [ 4] 2108         RET
                                   2109 
                                   2110 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2111 ;  shift left n times 
                                   2112 ; LSHIFT ( n1 n2 -- n1<<n2 )
                                   2113 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000B8A                       2114         _HEADER LSHIFT,6,"LSHIFT"
      008C0A 8B FF                    1         .word LINK 
                           000B8C     2         LINK=.
      008C0C 06                       3         .byte 6  
      008C0D 4C 53 48 49 46 54        4         .ascii "LSHIFT"
      008C13                          5         LSHIFT:
      008C13 E6 01            [ 1] 2115         ld a,(1,x)
      008C15 1C 00 02         [ 2] 2116         addw x,#CELLL 
      008C18 90 93            [ 1] 2117         ldw y,x 
      008C1A 90 FE            [ 2] 2118         ldw y,(y)
      008C1C                       2119 LSHIFT1:
      008C1C 4D               [ 1] 2120         tnz a 
      008C1D 27 05            [ 1] 2121         jreq LSHIFT4 
      008C1F 90 58            [ 2] 2122         sllw y 
      008C21 4A               [ 1] 2123         dec a 
      008C22 20 F8            [ 2] 2124         jra LSHIFT1 
      008C24                       2125 LSHIFT4:
      008C24 FF               [ 2] 2126         ldw (x),y 
      008C25 81               [ 4] 2127         ret 
                                   2128 
                                   2129 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2130 ; shift right n times                 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



                                   2131 ; RSHIFT (n1 n2 -- n1>>n2 )
                                   2132 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000BA6                       2133         _HEADER RSHIFT,6,"RSHIFT"
      008C26 8C 0C                    1         .word LINK 
                           000BA8     2         LINK=.
      008C28 06                       3         .byte 6  
      008C29 52 53 48 49 46 54        4         .ascii "RSHIFT"
      008C2F                          5         RSHIFT:
      008C2F E6 01            [ 1] 2134         ld a,(1,x)
      008C31 1C 00 02         [ 2] 2135         addw x,#CELLL 
      008C34 90 93            [ 1] 2136         ldw y,x 
      008C36 90 FE            [ 2] 2137         ldw y,(y)
      008C38                       2138 RSHIFT1:
      008C38 4D               [ 1] 2139         tnz a 
      008C39 27 05            [ 1] 2140         jreq RSHIFT4 
      008C3B 90 54            [ 2] 2141         srlw y 
      008C3D 4A               [ 1] 2142         dec a 
      008C3E 20 F8            [ 2] 2143         jra RSHIFT1 
      008C40                       2144 RSHIFT4:
      008C40 FF               [ 2] 2145         ldw (x),y 
      008C41 81               [ 4] 2146         ret 
                                   2147 
                                   2148 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2149 ;       2/      ( n -- n )
                                   2150 ;       divide  tos by 2.
                                   2151 ;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000BC2                       2152         _HEADER TWOSL,2,"2/"
      008C42 8C 28                    1         .word LINK 
                           000BC4     2         LINK=.
      008C44 02                       3         .byte 2  
      008C45 32 2F                    4         .ascii "2/"
      008C47                          5         TWOSL:
      008C47 90 93            [ 1] 2153         LDW Y,X
      008C49 90 FE            [ 2] 2154 	LDW Y,(Y)
      008C4B 90 57            [ 2] 2155         SRAW Y
      008C4D FF               [ 2] 2156         LDW (X),Y
      008C4E 81               [ 4] 2157         RET
                                   2158 
                                   2159 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2160 ;       BL      ( -- 32 )
                                   2161 ;       Return 32,  blank character.
                                   2162 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000BCF                       2163         _HEADER BLANK,2,"BL"
      008C4F 8C 44                    1         .word LINK 
                           000BD1     2         LINK=.
      008C51 02                       3         .byte 2  
      008C52 42 4C                    4         .ascii "BL"
      008C54                          5         BLANK:
      008C54 1D 00 02         [ 2] 2164         SUBW X,#2
      008C57 90 AE 00 20      [ 2] 2165 	LDW Y,#32
      008C5B FF               [ 2] 2166         LDW (X),Y
      008C5C 81               [ 4] 2167         RET
                                   2168 
                                   2169 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2170 ;         0     ( -- 0)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



                                   2171 ;         Return 0.
                                   2172 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000BDD                       2173         _HEADER ZERO,1,"0"
      008C5D 8C 51                    1         .word LINK 
                           000BDF     2         LINK=.
      008C5F 01                       3         .byte 1  
      008C60 30                       4         .ascii "0"
      008C61                          5         ZERO:
      008C61 1D 00 02         [ 2] 2174         SUBW X,#2
      008C64 90 5F            [ 1] 2175 	CLRW Y
      008C66 FF               [ 2] 2176         LDW (X),Y
      008C67 81               [ 4] 2177         RET
                                   2178 
                                   2179 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2180 ;         1     ( -- 1)
                                   2181 ;         Return 1.
                                   2182 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000BE8                       2183         _HEADER ONE,1,"1"
      008C68 8C 5F                    1         .word LINK 
                           000BEA     2         LINK=.
      008C6A 01                       3         .byte 1  
      008C6B 31                       4         .ascii "1"
      008C6C                          5         ONE:
      008C6C 1D 00 02         [ 2] 2184         SUBW X,#2
      008C6F 90 AE 00 01      [ 2] 2185 	LDW Y,#1
      008C73 FF               [ 2] 2186         LDW (X),Y
      008C74 81               [ 4] 2187         RET
                                   2188 
                                   2189 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2190 ;         -1    ( -- -1)
                                   2191 ;   Return -1
                                   2192 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000BF5                       2193         _HEADER MONE,2,"-1"
      008C75 8C 6A                    1         .word LINK 
                           000BF7     2         LINK=.
      008C77 02                       3         .byte 2  
      008C78 2D 31                    4         .ascii "-1"
      008C7A                          5         MONE:
      008C7A 1D 00 02         [ 2] 2194         SUBW X,#2
      008C7D 90 AE FF FF      [ 2] 2195 	LDW Y,#0xFFFF
      008C81 FF               [ 2] 2196         LDW (X),Y
      008C82 81               [ 4] 2197         RET
                                   2198 
                                   2199 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2200 ;       >CHAR   ( c -- c )
                                   2201 ;       Filter non-printing characters.
                                   2202 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000C03                       2203         _HEADER TCHAR,5,">CHAR"
      008C83 8C 77                    1         .word LINK 
                           000C05     2         LINK=.
      008C85 05                       3         .byte 5  
      008C86 3E 43 48 41 52           4         .ascii ">CHAR"
      008C8B                          5         TCHAR:
      008C8B E6 01            [ 1] 2204         ld a,(1,x)
      008C8D A1 20            [ 1] 2205         cp a,#32  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



      008C8F 2B 05            [ 1] 2206         jrmi 1$ 
      008C91 A1 7F            [ 1] 2207         cp a,#127 
      008C93 2A 01            [ 1] 2208         jrpl 1$ 
      008C95 81               [ 4] 2209         ret 
      008C96 A6 5F            [ 1] 2210 1$:     ld a,#'_ 
      008C98 E7 01            [ 1] 2211         ld (1,x),a 
      008C9A 81               [ 4] 2212         ret 
                                   2213 
                                   2214 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2215 ;       DEPTH   ( -- n )
                                   2216 ;       Return  depth of  data stack.
                                   2217 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000C1B                       2218         _HEADER DEPTH,5,"DEPTH"
      008C9B 8C 85                    1         .word LINK 
                           000C1D     2         LINK=.
      008C9D 05                       3         .byte 5  
      008C9E 44 45 50 54 48           4         .ascii "DEPTH"
      008CA3                          5         DEPTH:
      008CA3 90 BE 2C         [ 2] 2219         LDW Y,SP0    ;save data stack ptr
      008CA6 BF 24            [ 2] 2220 	LDW XTEMP,X
      008CA8 72 B2 00 24      [ 2] 2221         SUBW Y,XTEMP     ;#bytes = SP0 - X
      008CAC 90 57            [ 2] 2222         SRAW Y    ;Y = #stack items
      008CAE 1D 00 02         [ 2] 2223 	SUBW X,#2
      008CB1 FF               [ 2] 2224         LDW (X),Y     ; if neg, underflow
      008CB2 81               [ 4] 2225         RET
                                   2226 
                                   2227 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2228 ;       PICK    ( ... +n -- ... w )
                                   2229 ;       Copy  nth stack item to tos.
                                   2230 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000C33                       2231         _HEADER PICK,4,"PICK"
      008CB3 8C 9D                    1         .word LINK 
                           000C35     2         LINK=.
      008CB5 04                       3         .byte 4  
      008CB6 50 49 43 4B              4         .ascii "PICK"
      008CBA                          5         PICK:
      008CBA 90 93            [ 1] 2232         LDW Y,X   ;D = n1
      008CBC 90 FE            [ 2] 2233         LDW Y,(Y)
                                   2234 ; modified for standard compliance          
                                   2235 ; 0 PICK must be equivalent to DUP 
      008CBE 90 5C            [ 1] 2236         INCW Y 
      008CC0 90 58            [ 2] 2237         SLAW Y
      008CC2 BF 24            [ 2] 2238         LDW XTEMP,X
      008CC4 72 B9 00 24      [ 2] 2239         ADDW Y,XTEMP
      008CC8 90 FE            [ 2] 2240         LDW Y,(Y)
      008CCA FF               [ 2] 2241         LDW (X),Y
      008CCB 81               [ 4] 2242         RET
                                   2243 
                                   2244 ;; Memory access
                                   2245 
                                   2246 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2247 ;       +!      ( n a -- )
                                   2248 ;       Add n to  contents at 
                                   2249 ;       address a.
                                   2250 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



      000C4C                       2251         _HEADER PSTOR,2,"+!"
      008CCC 8C B5                    1         .word LINK 
                           000C4E     2         LINK=.
      008CCE 02                       3         .byte 2  
      008CCF 2B 21                    4         .ascii "+!"
      008CD1                          5         PSTOR:
      008CD1 90 93            [ 1] 2252         ldw y,x 
      008CD3 90 FE            [ 2] 2253         ldw y,(y)
      008CD5 90 BF 26         [ 2] 2254         ldw YTEMP,y  ; address
      008CD8 90 FE            [ 2] 2255         ldw y,(y)  
      008CDA 90 89            [ 2] 2256         pushw y  ; value at address 
      008CDC 90 93            [ 1] 2257         ldw y,x 
      008CDE 90 EE 02         [ 2] 2258         ldw y,(2,y) ; n 
      008CE1 72 F9 01         [ 2] 2259         addw y,(1,sp) ; n+value
      008CE4 91 CF 26         [ 5] 2260         ldw [YTEMP],y ;  a!
      008CE7 90 85            [ 2] 2261         popw y    ;drop local var
      008CE9 1C 00 04         [ 2] 2262         addw x,#4 ; DDROP 
      008CEC 81               [ 4] 2263         ret 
                                   2264 
                                   2265 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2266 ;       2!      ( d a -- )
                                   2267 ;       Store  double integer 
                                   2268 ;       to address a.
                                   2269 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000C6D                       2270         _HEADER DSTOR,2,"2!"
      008CED 8C CE                    1         .word LINK 
                           000C6F     2         LINK=.
      008CEF 02                       3         .byte 2  
      008CF0 32 21                    4         .ascii "2!"
      008CF2                          5         DSTOR:
      008CF2 90 93            [ 1] 2271         LDW Y,X 
      008CF4 89               [ 2] 2272         PUSHW X 
      008CF5 FE               [ 2] 2273         LDW X,(X) ; a 
      008CF6 90 EE 02         [ 2] 2274         LDW Y,(2,Y) ; dhi 
      008CF9 FF               [ 2] 2275         LDW (X),Y 
      008CFA 16 01            [ 2] 2276         LDW Y,(1,SP)  
      008CFC 90 EE 04         [ 2] 2277         LDW Y,(4,Y) ; dlo 
      008CFF EF 02            [ 2] 2278         LDW (2,X),Y  
      008D01 85               [ 2] 2279         POPW X 
      008D02 1C 00 06         [ 2] 2280         ADDW X,#3*CELLL 
      008D05 81               [ 4] 2281         RET 
                                   2282 
                                   2283 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2284 ;       2@      ( a -- d )
                                   2285 ;       Fetch double integer 
                                   2286 ;       from address a.
                                   2287 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000C86                       2288         _HEADER DAT,2,"2@"
      008D06 8C EF                    1         .word LINK 
                           000C88     2         LINK=.
      008D08 02                       3         .byte 2  
      008D09 32 40                    4         .ascii "2@"
      008D0B                          5         DAT:
      008D0B 90 93            [ 1] 2289         ldw y,x 
      008D0D 1D 00 02         [ 2] 2290         subw x,#CELLL 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



      008D10 90 FE            [ 2] 2291         ldw y,(y) ;address 
      008D12 90 89            [ 2] 2292         pushw y  
      008D14 90 FE            [ 2] 2293         ldw y,(y) ; dhi 
      008D16 FF               [ 2] 2294         ldw (x),y 
      008D17 90 85            [ 2] 2295         popw y 
      008D19 90 EE 02         [ 2] 2296         ldw y,(2,y) ; dlo 
      008D1C EF 02            [ 2] 2297         ldw (2,x),y 
      008D1E 81               [ 4] 2298         ret 
                                   2299 
                                   2300 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2301 ;       COUNT   ( b -- b +n )
                                   2302 ;       Return count byte of a string
                                   2303 ;       and add 1 to byte address.
                                   2304 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000C9F                       2305         _HEADER COUNT,5,"COUNT"
      008D1F 8D 08                    1         .word LINK 
                           000CA1     2         LINK=.
      008D21 05                       3         .byte 5  
      008D22 43 4F 55 4E 54           4         .ascii "COUNT"
      008D27                          5         COUNT:
      008D27 90 93            [ 1] 2306         ldw y,x 
      008D29 90 FE            [ 2] 2307         ldw y,(y) ; address 
      008D2B 90 F6            [ 1] 2308         ld a,(y)  ; count 
      008D2D 90 5C            [ 1] 2309         incw y 
      008D2F FF               [ 2] 2310         ldw (x),y 
      008D30 1D 00 02         [ 2] 2311         subw x,#CELLL 
      008D33 E7 01            [ 1] 2312         ld (1,x),a 
      008D35 7F               [ 1] 2313         clr (x)
      008D36 81               [ 4] 2314         ret 
                                   2315 
                                   2316 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2317 ;       HERE    ( -- a )
                                   2318 ;       Return  top of  variables
                                   2319 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000CB7                       2320         _HEADER HERE,4,"HERE"
      008D37 8D 21                    1         .word LINK 
                           000CB9     2         LINK=.
      008D39 04                       3         .byte 4  
      008D3A 48 45 52 45              4         .ascii "HERE"
      008D3E                          5         HERE:
      008D3E 90 AE 00 18      [ 2] 2321       	ldw y,#UVP 
      008D42 90 FE            [ 2] 2322         ldw y,(y)
      008D44 1D 00 02         [ 2] 2323         subw x,#CELLL 
      008D47 FF               [ 2] 2324         ldw (x),y 
      008D48 81               [ 4] 2325         ret 
                                   2326 
                                   2327 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2328 ;       PAD     ( -- a )
                                   2329 ;       Return address of text buffer
                                   2330 ;       above  code dictionary.
                                   2331 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000CC9                       2332         _HEADER PAD,3,"PAD"
      008D49 8D 39                    1         .word LINK 
                           000CCB     2         LINK=.
      008D4B 03                       3         .byte 3  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



      008D4C 50 41 44                 4         .ascii "PAD"
      008D4F                          5         PAD:
      008D4F CD 8D 3E         [ 4] 2333         CALL     HERE
      000CD2                       2334         _DOLIT   80
      008D52 CD 84 EF         [ 4]    1     CALL DOLIT 
      008D55 00 50                    2     .word 80 
      008D57 CC 88 C6         [ 2] 2335         JP     PLUS
                                   2336 
                                   2337 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2338 ;       TIB     ( -- a )
                                   2339 ;       Return address of 
                                   2340 ;       terminal input buffer.
                                   2341 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000CDA                       2342         _HEADER TIB,3,"TIB"
      008D5A 8D 4B                    1         .word LINK 
                           000CDC     2         LINK=.
      008D5C 03                       3         .byte 3  
      008D5D 54 49 42                 4         .ascii "TIB"
      008D60                          5         TIB:
      008D60 CD 87 95         [ 4] 2343         CALL     NTIB
      008D63 CD 8B CA         [ 4] 2344         CALL     CELLP
      008D66 CC 85 63         [ 2] 2345         JP     AT
                                   2346 
                                   2347 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2348 ;       @EXECUTE        ( a -- )
                                   2349 ;       Execute vector stored in 
                                   2350 ;       address a.
                                   2351 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000CE9                       2352         _HEADER ATEXE,8,"@EXECUTE"
      008D69 8D 5C                    1         .word LINK 
                           000CEB     2         LINK=.
      008D6B 08                       3         .byte 8  
      008D6C 40 45 58 45 43 55 54     4         .ascii "@EXECUTE"
             45
      008D74                          5         ATEXE:
      008D74 CD 85 63         [ 4] 2353         CALL     AT
      008D77 CD 88 54         [ 4] 2354         CALL     QDUP    ;?address or zero
      008D7A CD 85 18         [ 4] 2355         CALL     QBRAN
      008D7D 8D 82                 2356         .word      EXE1
      008D7F CD 85 44         [ 4] 2357         CALL     EXECU   ;execute if non-zero
      008D82 81               [ 4] 2358 EXE1:   RET     ;do nothing if zero
                                   2359 
                                   2360 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2361 ;       CMOVE   ( b1 b2 u -- )
                                   2362 ;       Copy u bytes from b1 to b2.
                                   2363 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000D03                       2364         _HEADER CMOVE,5,"CMOVE"
      008D83 8D 6B                    1         .word LINK 
                           000D05     2         LINK=.
      008D85 05                       3         .byte 5  
      008D86 43 4D 4F 56 45           4         .ascii "CMOVE"
      008D8B                          5         CMOVE:
      008D8B CD 86 6A         [ 4] 2365         CALL	TOR
      008D8E CD 85 34         [ 4] 2366         CALL	BRAN
      008D91 8D AB                 2367         .word	CMOV2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



      008D93 CD 86 6A         [ 4] 2368 CMOV1:	CALL	TOR
      008D96 CD 86 A1         [ 4] 2369         CALL	DUPP
      008D99 CD 85 81         [ 4] 2370         CALL	CAT
      008D9C CD 85 C5         [ 4] 2371         CALL	RAT
      008D9F CD 85 70         [ 4] 2372         CALL	CSTOR
      008DA2 CD 8B F5         [ 4] 2373         CALL	ONEP
      008DA5 CD 85 B4         [ 4] 2374         CALL	RFROM
      008DA8 CD 8B F5         [ 4] 2375         CALL	ONEP
      008DAB CD 85 03         [ 4] 2376 CMOV2:	CALL	DONXT
      008DAE 8D 93                 2377         .word	CMOV1
      008DB0 CC 88 A6         [ 2] 2378         JP	DDROP
                                   2379 
                                   2380 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2381 ;       FILL    ( b u c -- )
                                   2382 ;       Fill u bytes of character c
                                   2383 ;       to area beginning at b.
                                   2384 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000D33                       2385         _HEADER FILL,4,"FILL"
      008DB3 8D 85                    1         .word LINK 
                           000D35     2         LINK=.
      008DB5 04                       3         .byte 4  
      008DB6 46 49 4C 4C              4         .ascii "FILL"
      008DBA                          5         FILL:
      008DBA 90 93            [ 1] 2386         ldw y,x 
      008DBC 90 E6 01         [ 1] 2387         ld a,(1,y) ; c 
      008DBF 1C 00 02         [ 2] 2388         addw x,#CELLL ; drop c 
      008DC2 90 93            [ 1] 2389         ldw y,x 
      008DC4 90 FE            [ 2] 2390         ldw y,(y) ; count
      008DC6 90 89            [ 2] 2391         pushw y 
      008DC8 1C 00 02         [ 2] 2392         addw x,#CELLL ; drop u 
      008DCB 90 93            [ 1] 2393         ldw y,x 
      008DCD 1C 00 02         [ 2] 2394         addw x,#CELLL ; drop b 
      008DD0 90 FE            [ 2] 2395         ldw y,(y) ; address
      008DD2 90 BF 26         [ 2] 2396         ldw YTEMP,y
      008DD5 90 85            [ 2] 2397         popw y ; count 
      008DD7                       2398 FILL1:  
      008DD7 92 C7 26         [ 4] 2399         ld [YTEMP],a 
      008DDA 3C 27            [ 1] 2400         inc YTEMP+1
      008DDC 24 02            [ 1] 2401         jrnc FILL2 
      008DDE 3C 26            [ 1] 2402         inc YTEMP
      008DE0                       2403 FILL2: 
      008DE0 90 5A            [ 2] 2404         decw y ; count 
      008DE2 26 F3            [ 1] 2405         jrne FILL1  
      008DE4 81               [ 4] 2406         ret 
                                   2407 
                                   2408 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2409 ;       ERASE   ( b u -- )
                                   2410 ;       Erase u bytes beginning at b.
                                   2411 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000D65                       2412         _HEADER ERASE,5,"ERASE"
      008DE5 8D B5                    1         .word LINK 
                           000D67     2         LINK=.
      008DE7 05                       3         .byte 5  
      008DE8 45 52 41 53 45           4         .ascii "ERASE"
      008DED                          5         ERASE:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



      008DED 90 5F            [ 1] 2413         clrw y 
      008DEF 1D 00 02         [ 2] 2414         subw x,#CELLL 
      008DF2 FF               [ 2] 2415         ldw (x),y 
      008DF3 CC 8D BA         [ 2] 2416         jp FILL 
                                   2417 
                                   2418 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2419 ;       PACK0   ( b u a -- a )
                                   2420 ;       Build a counted string with
                                   2421 ;       u characters from b. Null fill.
                                   2422 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000D76                       2423         _HEADER PACKS,5,"PACK0"
      008DF6 8D E7                    1         .word LINK 
                           000D78     2         LINK=.
      008DF8 05                       3         .byte 5  
      008DF9 50 41 43 4B 30           4         .ascii "PACK0"
      008DFE                          5         PACKS:
      008DFE CD 86 A1         [ 4] 2424         CALL     DUPP
      008E01 CD 86 6A         [ 4] 2425         CALL     TOR     ;strings only on cell boundary
      008E04 CD 88 B1         [ 4] 2426         CALL     DDUP
      008E07 CD 85 70         [ 4] 2427         CALL     CSTOR
      008E0A CD 8B F5         [ 4] 2428         CALL     ONEP ;save count
      008E0D CD 86 B1         [ 4] 2429         CALL     SWAPP
      008E10 CD 8D 8B         [ 4] 2430         CALL     CMOVE
      008E13 CD 85 B4         [ 4] 2431         CALL     RFROM
      008E16 81               [ 4] 2432         RET
                                   2433 
                                   2434 ;; Numeric output, single precision
                                   2435 
                                   2436 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2437 ;       DIGIT   ( u -- c )
                                   2438 ;       Convert digit u to a character.
                                   2439 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000D97                       2440         _HEADER DIGIT,5,"DIGIT"
      008E17 8D F8                    1         .word LINK 
                           000D99     2         LINK=.
      008E19 05                       3         .byte 5  
      008E1A 44 49 47 49 54           4         .ascii "DIGIT"
      008E1F                          5         DIGIT:
      008E1F CD 84 EF         [ 4] 2441         CALL	DOLIT
      008E22 00 09                 2442         .word	9
      008E24 CD 86 C9         [ 4] 2443         CALL	OVER
      008E27 CD 89 B5         [ 4] 2444         CALL	LESS
      008E2A CD 84 EF         [ 4] 2445         CALL	DOLIT
      008E2D 00 07                 2446         .word	7
      008E2F CD 86 FE         [ 4] 2447         CALL	ANDD
      008E32 CD 88 C6         [ 4] 2448         CALL	PLUS
      008E35 CD 84 EF         [ 4] 2449         CALL	DOLIT
      008E38 00 30                 2450         .word	48	;'0'
      008E3A CC 88 C6         [ 2] 2451         JP	PLUS
                                   2452 
                                   2453 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2454 ;       EXTRACT ( n base -- n c )
                                   2455 ;       Extract least significant 
                                   2456 ;       digit from n.
                                   2457 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



      000DBD                       2458         _HEADER EXTRC,7,"EXTRACT"
      008E3D 8E 19                    1         .word LINK 
                           000DBF     2         LINK=.
      008E3F 07                       3         .byte 7  
      008E40 45 58 54 52 41 43 54     4         .ascii "EXTRACT"
      008E47                          5         EXTRC:
      008E47 CD 8C 61         [ 4] 2459         CALL     ZERO
      008E4A CD 86 B1         [ 4] 2460         CALL     SWAPP
      008E4D CD 8A 6B         [ 4] 2461         CALL     UMMOD
      008E50 CD 86 B1         [ 4] 2462         CALL     SWAPP
      008E53 CC 8E 1F         [ 2] 2463         JP     DIGIT
                                   2464 
                                   2465 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2466 ;       <#      ( -- )
                                   2467 ;       Initiate  numeric 
                                   2468 ;       output process.
                                   2469 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000DD6                       2470         _HEADER BDIGS,2,"#<"
      008E56 8E 3F                    1         .word LINK 
                           000DD8     2         LINK=.
      008E58 02                       3         .byte 2  
      008E59 23 3C                    4         .ascii "#<"
      008E5B                          5         BDIGS:
      008E5B CD 8D 4F         [ 4] 2471         CALL     PAD
      008E5E CD 87 D7         [ 4] 2472         CALL     HLD
      008E61 CC 85 51         [ 2] 2473         JP     STORE
                                   2474 
                                   2475 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2476 ;       HOLD    ( c -- )
                                   2477 ;       Insert a character 
                                   2478 ;       into output string.
                                   2479 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000DE4                       2480         _HEADER HOLD,4,"HOLD"
      008E64 8E 58                    1         .word LINK 
                           000DE6     2         LINK=.
      008E66 04                       3         .byte 4  
      008E67 48 4F 4C 44              4         .ascii "HOLD"
      008E6B                          5         HOLD:
      008E6B CD 87 D7         [ 4] 2481         CALL     HLD
      008E6E CD 85 63         [ 4] 2482         CALL     AT
      008E71 CD 8C 02         [ 4] 2483         CALL     ONEM
      008E74 CD 86 A1         [ 4] 2484         CALL     DUPP
      008E77 CD 87 D7         [ 4] 2485         CALL     HLD
      008E7A CD 85 51         [ 4] 2486         CALL     STORE
      008E7D CC 85 70         [ 2] 2487         JP     CSTOR
                                   2488 
                                   2489 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2490 ;       #       ( u -- u )
                                   2491 ;       Extract one digit from u and
                                   2492 ;       append digit to output string.
                                   2493 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000E00                       2494         _HEADER DIG,1,"#"
      008E80 8E 66                    1         .word LINK 
                           000E02     2         LINK=.
      008E82 01                       3         .byte 1  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



      008E83 23                       4         .ascii "#"
      008E84                          5         DIG:
      008E84 CD 87 67         [ 4] 2495         CALL     BASE
      008E87 CD 85 63         [ 4] 2496         CALL     AT
      008E8A CD 8E 47         [ 4] 2497         CALL     EXTRC
      008E8D CC 8E 6B         [ 2] 2498         JP     HOLD
                                   2499 
                                   2500 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2501 ;       #S      ( u -- 0 )
                                   2502 ;       Convert u until all digits
                                   2503 ;       are added to output string.
                                   2504 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000E10                       2505         _HEADER DIGS,2,"#S"
      008E90 8E 82                    1         .word LINK 
                           000E12     2         LINK=.
      008E92 02                       3         .byte 2  
      008E93 23 53                    4         .ascii "#S"
      008E95                          5         DIGS:
      008E95 CD 8E 84         [ 4] 2506 DIGS1:  CALL     DIG
      008E98 CD 86 A1         [ 4] 2507         CALL     DUPP
      008E9B CD 85 18         [ 4] 2508         CALL     QBRAN
      008E9E 8E A2                 2509         .word      DIGS2
      008EA0 20 F3            [ 2] 2510         JRA     DIGS1
      008EA2 81               [ 4] 2511 DIGS2:  RET
                                   2512 
                                   2513 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2514 ;       SIGN    ( n -- )
                                   2515 ;       Add a minus sign to
                                   2516 ;       numeric output string.
                                   2517 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000E23                       2518         _HEADER SIGN,4,"SIGN"
      008EA3 8E 92                    1         .word LINK 
                           000E25     2         LINK=.
      008EA5 04                       3         .byte 4  
      008EA6 53 49 47 4E              4         .ascii "SIGN"
      008EAA                          5         SIGN:
      008EAA CD 86 D8         [ 4] 2519         CALL     ZLESS
      008EAD CD 85 18         [ 4] 2520         CALL     QBRAN
      008EB0 8E BA                 2521         .word      SIGN1
      008EB2 CD 84 EF         [ 4] 2522         CALL     DOLIT
      008EB5 00 2D                 2523         .word      45	;"-"
      008EB7 CC 8E 6B         [ 2] 2524         JP     HOLD
      008EBA 81               [ 4] 2525 SIGN1:  RET
                                   2526 
                                   2527 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2528 ;       #>      ( w -- b u )
                                   2529 ;       Prepare output string.
                                   2530 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000E3B                       2531         _HEADER EDIGS,2,"#>"
      008EBB 8E A5                    1         .word LINK 
                           000E3D     2         LINK=.
      008EBD 02                       3         .byte 2  
      008EBE 23 3E                    4         .ascii "#>"
      008EC0                          5         EDIGS:
      008EC0 CD 86 97         [ 4] 2532         CALL     DROP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



      008EC3 CD 87 D7         [ 4] 2533         CALL     HLD
      008EC6 CD 85 63         [ 4] 2534         CALL     AT
      008EC9 CD 8D 4F         [ 4] 2535         CALL     PAD
      008ECC CD 86 C9         [ 4] 2536         CALL     OVER
      008ECF CC 89 50         [ 2] 2537         JP     SUBB
                                   2538 
                                   2539 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2540 ;       str     ( w -- b u )
                                   2541 ;       Convert a signed integer
                                   2542 ;       to a numeric string.
                                   2543 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000E52                       2544         _HEADER STR,3,"STR"
      008ED2 8E BD                    1         .word LINK 
                           000E54     2         LINK=.
      008ED4 03                       3         .byte 3  
      008ED5 53 54 52                 4         .ascii "STR"
      008ED8                          5         STR:
      008ED8 CD 86 A1         [ 4] 2545         CALL     DUPP
      008EDB CD 86 6A         [ 4] 2546         CALL     TOR
      008EDE CD 89 6A         [ 4] 2547         CALL     ABSS
      008EE1 CD 8E 5B         [ 4] 2548         CALL     BDIGS
      008EE4 CD 8E 95         [ 4] 2549         CALL     DIGS
      008EE7 CD 85 B4         [ 4] 2550         CALL     RFROM
      008EEA CD 8E AA         [ 4] 2551         CALL     SIGN
      008EED CC 8E C0         [ 2] 2552         JP     EDIGS
                                   2553 
                                   2554 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2555 ;       HEX     ( -- )
                                   2556 ;       Use radix 16 as base for
                                   2557 ;       numeric conversions.
                                   2558 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000E70                       2559         _HEADER HEX,3,"HEX"
      008EF0 8E D4                    1         .word LINK 
                           000E72     2         LINK=.
      008EF2 03                       3         .byte 3  
      008EF3 48 45 58                 4         .ascii "HEX"
      008EF6                          5         HEX:
      008EF6 CD 84 EF         [ 4] 2560         CALL     DOLIT
      008EF9 00 10                 2561         .word      16
      008EFB CD 87 67         [ 4] 2562         CALL     BASE
      008EFE CC 85 51         [ 2] 2563         JP     STORE
                                   2564 
                                   2565 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2566 ;       DECIMAL ( -- )
                                   2567 ;       Use radix 10 as base
                                   2568 ;       for numeric conversions.
                                   2569 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000E81                       2570         _HEADER DECIM,7,"DECIMAL"
      008F01 8E F2                    1         .word LINK 
                           000E83     2         LINK=.
      008F03 07                       3         .byte 7  
      008F04 44 45 43 49 4D 41 4C     4         .ascii "DECIMAL"
      008F0B                          5         DECIM:
      008F0B CD 84 EF         [ 4] 2571         CALL     DOLIT
      008F0E 00 0A                 2572         .word      10
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



      008F10 CD 87 67         [ 4] 2573         CALL     BASE
      008F13 CC 85 51         [ 2] 2574         JP     STORE
                                   2575 
                                   2576 ;; Numeric input, single precision
                                   2577 
                                   2578 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2579 ;       DIGIT?  ( c base -- u t )
                                   2580 ;       Convert a character to its numeric
                                   2581 ;       value. A flag indicates success.
                                   2582 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000E96                       2583         _HEADER DIGTQ,6,"DIGIT?"
      008F16 8F 03                    1         .word LINK 
                           000E98     2         LINK=.
      008F18 06                       3         .byte 6  
      008F19 44 49 47 49 54 3F        4         .ascii "DIGIT?"
      008F1F                          5         DIGTQ:
      008F1F CD 86 6A         [ 4] 2584         CALL     TOR
      008F22 CD 84 EF         [ 4] 2585         CALL     DOLIT
      008F25 00 30                 2586         .word     48	; "0"
      008F27 CD 89 50         [ 4] 2587         CALL     SUBB
      008F2A CD 84 EF         [ 4] 2588         CALL     DOLIT
      008F2D 00 09                 2589         .word      9
      008F2F CD 86 C9         [ 4] 2590         CALL     OVER
      008F32 CD 89 B5         [ 4] 2591         CALL     LESS
      008F35 CD 85 18         [ 4] 2592         CALL     QBRAN
      008F38 8F 50                 2593         .word      DGTQ1
      008F3A CD 84 EF         [ 4] 2594         CALL     DOLIT
      008F3D 00 07                 2595         .word      7
      008F3F CD 89 50         [ 4] 2596         CALL     SUBB
      008F42 CD 86 A1         [ 4] 2597         CALL     DUPP
      008F45 CD 84 EF         [ 4] 2598         CALL     DOLIT
      008F48 00 0A                 2599         .word      10
      008F4A CD 89 B5         [ 4] 2600         CALL     LESS
      008F4D CD 87 12         [ 4] 2601         CALL     ORR
      008F50 CD 86 A1         [ 4] 2602 DGTQ1:  CALL     DUPP
      008F53 CD 85 B4         [ 4] 2603         CALL     RFROM
      008F56 CC 89 97         [ 2] 2604         JP     ULESS
                                   2605 
                           000001  2606 .if  WANT_DOUBLE
                           000000  2607 .else 
                                   2608 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2609 ;       NUMBER? ( a -- n T | a F )
                                   2610 ;       Convert a number string to
                                   2611 ;       integer. Push a flag on tos.
                                   2612 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2613         _HEADER NUMBQ,7,"NUMBER?"
                                   2614         CALL     BASE
                                   2615         CALL     AT
                                   2616         CALL     TOR
                                   2617         CALL     ZERO
                                   2618         CALL     OVER
                                   2619         CALL     COUNT
                                   2620         CALL     OVER
                                   2621         CALL     CAT
                                   2622         CALL     DOLIT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



                                   2623         .word     36	; "0x"
                                   2624         CALL     EQUAL
                                   2625         CALL     QBRAN
                                   2626         .word      NUMQ1
                                   2627         CALL     HEX
                                   2628         CALL     SWAPP
                                   2629         CALL     ONEP
                                   2630         CALL     SWAPP
                                   2631         CALL     ONEM
                                   2632 NUMQ1:  CALL     OVER
                                   2633         CALL     CAT
                                   2634         CALL     DOLIT
                                   2635         .word     45	; "-"
                                   2636         CALL     EQUAL
                                   2637         CALL     TOR
                                   2638         CALL     SWAPP
                                   2639         CALL     RAT
                                   2640         CALL     SUBB
                                   2641         CALL     SWAPP
                                   2642         CALL     RAT
                                   2643         CALL     PLUS
                                   2644         CALL     QDUP
                                   2645         CALL     QBRAN
                                   2646         .word      NUMQ6
                                   2647         CALL     ONEM
                                   2648         CALL     TOR
                                   2649 NUMQ2:  CALL     DUPP
                                   2650         CALL     TOR
                                   2651         CALL     CAT
                                   2652         CALL     BASE
                                   2653         CALL     AT
                                   2654         CALL     DIGTQ
                                   2655         CALL     QBRAN
                                   2656         .word      NUMQ4
                                   2657         CALL     SWAPP
                                   2658         CALL     BASE
                                   2659         CALL     AT
                                   2660         CALL     STAR
                                   2661         CALL     PLUS
                                   2662         CALL     RFROM
                                   2663         CALL     ONEP
                                   2664         CALL     DONXT
                                   2665         .word      NUMQ2
                                   2666         CALL     RAT
                                   2667         CALL     SWAPP
                                   2668         CALL     DROP
                                   2669         CALL     QBRAN
                                   2670         .word      NUMQ3
                                   2671         CALL     NEGAT
                                   2672 NUMQ3:  CALL     SWAPP
                                   2673         JRA     NUMQ5
                                   2674 NUMQ4:  CALL     RFROM
                                   2675         CALL     RFROM
                                   2676         CALL     DDROP
                                   2677         CALL     DDROP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



                                   2678         CALL     ZERO
                                   2679 NUMQ5:  CALL     DUPP
                                   2680 NUMQ6:  CALL     RFROM
                                   2681         CALL     DDROP
                                   2682         CALL     RFROM
                                   2683         CALL     BASE
                                   2684         JP     STORE
                                   2685 .endif ; WANT_DOUBLE  
                                   2686 
                                   2687 ;; Basic I/O
                                   2688 
                                   2689 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2690 ;       KEY     ( -- c )
                                   2691 ;       Wait for and return an
                                   2692 ;       input character.
                                   2693 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000ED9                       2694         _HEADER KEY,3,"KEY"
      008F59 8F 18                    1         .word LINK 
                           000EDB     2         LINK=.
      008F5B 03                       3         .byte 3  
      008F5C 4B 45 59                 4         .ascii "KEY"
      008F5F                          5         KEY:
      008F5F 72 0B 52 30 FB   [ 2] 2695         btjf UART_SR,#UART_SR_RXNE,. 
      008F64 C6 52 31         [ 1] 2696         ld a,UART_DR 
      008F67 1D 00 02         [ 2] 2697         subw x,#CELLL 
      008F6A E7 01            [ 1] 2698         ld (1,x),a 
      008F6C 7F               [ 1] 2699         clr (x)
      008F6D 81               [ 4] 2700         ret 
                                   2701 
                                   2702 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2703 ;       NUF?    ( -- t )
                                   2704 ;       Return false if no input,
                                   2705 ;       else pause and if CR return true.
                                   2706 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000EEE                       2707         _HEADER NUFQ,4,"NUF?"
      008F6E 8F 5B                    1         .word LINK 
                           000EF0     2         LINK=.
      008F70 04                       3         .byte 4  
      008F71 4E 55 46 3F              4         .ascii "NUF?"
      008F75                          5         NUFQ:
      008F75 CD 84 98         [ 4] 2708         CALL     QKEY
      008F78 CD 86 A1         [ 4] 2709         CALL     DUPP
      008F7B CD 85 18         [ 4] 2710         CALL     QBRAN
      008F7E 8F 8E                 2711         .word    NUFQ1
      008F80 CD 88 A6         [ 4] 2712         CALL     DDROP
      008F83 CD 8F 5F         [ 4] 2713         CALL     KEY
      008F86 CD 84 EF         [ 4] 2714         CALL     DOLIT
      008F89 00 0D                 2715         .word      CRR
      008F8B CC 89 78         [ 2] 2716         JP     EQUAL
      008F8E 81               [ 4] 2717 NUFQ1:  RET
                                   2718 
                                   2719 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2720 ;       SPACE   ( -- )
                                   2721 ;       Send  blank character to
                                   2722 ;       output device.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



                                   2723 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000F0F                       2724         _HEADER SPACE,5,"SPACE"
      008F8F 8F 70                    1         .word LINK 
                           000F11     2         LINK=.
      008F91 05                       3         .byte 5  
      008F92 53 50 41 43 45           4         .ascii "SPACE"
      008F97                          5         SPACE:
      008F97 CD 8C 54         [ 4] 2725         CALL     BLANK
      008F9A CC 84 B6         [ 2] 2726         JP     EMIT
                                   2727 
                                   2728 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2729 ;       SPACES  ( +n -- )
                                   2730 ;       Send n spaces to output device.
                                   2731 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000F1D                       2732         _HEADER SPACS,6,"SPACES"
      008F9D 8F 91                    1         .word LINK 
                           000F1F     2         LINK=.
      008F9F 06                       3         .byte 6  
      008FA0 53 50 41 43 45 53        4         .ascii "SPACES"
      008FA6                          5         SPACS:
      008FA6 CD 8C 61         [ 4] 2733         CALL     ZERO
      008FA9 CD 8A 13         [ 4] 2734         CALL     MAX
      008FAC CD 86 6A         [ 4] 2735         CALL     TOR
      008FAF 20 03            [ 2] 2736         JRA      CHAR2
      008FB1 CD 8F 97         [ 4] 2737 CHAR1:  CALL     SPACE
      008FB4 CD 85 03         [ 4] 2738 CHAR2:  CALL     DONXT
      008FB7 8F B1                 2739         .word    CHAR1
      008FB9 81               [ 4] 2740         RET
                                   2741 
                                   2742 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2743 ;       TYPE    ( b u -- )
                                   2744 ;       Output u characters from b.
                                   2745 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000F3A                       2746         _HEADER TYPES,4,"TYPE"
      008FBA 8F 9F                    1         .word LINK 
                           000F3C     2         LINK=.
      008FBC 04                       3         .byte 4  
      008FBD 54 59 50 45              4         .ascii "TYPE"
      008FC1                          5         TYPES:
      008FC1 CD 86 6A         [ 4] 2747         CALL     TOR
      008FC4 20 06            [ 2] 2748         JRA     TYPE2
      008FC6 CD 8D 27         [ 4] 2749 TYPE1:  CALL     COUNT 
      008FC9 CD 84 B6         [ 4] 2750         CALL     EMIT
      000F4C                       2751 TYPE2:  _DONXT  TYPE1
      008FCC CD 85 03         [ 4]    1     CALL DONXT 
      008FCF 8F C6                    2     .word TYPE1 
      008FD1 CC 86 97         [ 2] 2752         JP     DROP
                                   2753 
                                   2754 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2755 ;       CR      ( -- )
                                   2756 ;       Output a carriage return
                                   2757 ;       and a line feed.
                                   2758 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000F54                       2759         _HEADER CR,2,"CR"
      008FD4 8F BC                    1         .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



                           000F56     2         LINK=.
      008FD6 02                       3         .byte 2  
      008FD7 43 52                    4         .ascii "CR"
      008FD9                          5         CR:
      000F59                       2760         _DOLIT  CRR 
      008FD9 CD 84 EF         [ 4]    1     CALL DOLIT 
      008FDC 00 0D                    2     .word CRR 
      008FDE CD 84 B6         [ 4] 2761         CALL    EMIT
      000F61                       2762         _DOLIT  LF
      008FE1 CD 84 EF         [ 4]    1     CALL DOLIT 
      008FE4 00 0A                    2     .word LF 
      008FE6 CC 84 B6         [ 2] 2763         JP      EMIT
                                   2764 
                                   2765 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2766 ;       do$     ( -- a )
                                   2767 ;       Return  address of a compiled
                                   2768 ;       string.
                                   2769 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2770 ;       _HEADER DOSTR,COMPO+3,"DO$"
      008FE9                       2771 DOSTR:
      008FE9 CD 85 B4         [ 4] 2772         CALL     RFROM
      008FEC CD 85 C5         [ 4] 2773         CALL     RAT
      008FEF CD 85 B4         [ 4] 2774         CALL     RFROM
      008FF2 CD 8D 27         [ 4] 2775         CALL     COUNT
      008FF5 CD 88 C6         [ 4] 2776         CALL     PLUS
      008FF8 CD 86 6A         [ 4] 2777         CALL     TOR
      008FFB CD 86 B1         [ 4] 2778         CALL     SWAPP
      008FFE CD 86 6A         [ 4] 2779         CALL     TOR
      009001 81               [ 4] 2780         RET
                                   2781 
                                   2782 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2783 ;       $"|     ( -- a )
                                   2784 ;       Run time routine compiled by $".
                                   2785 ;       Return address of a compiled string.
                                   2786 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2787 ;       _HEADER STRQP,COMPO+3,"$\"|"
      009002                       2788 STRQP:
      009002 CD 8F E9         [ 4] 2789         CALL     DOSTR
      009005 81               [ 4] 2790         RET
                                   2791 
                                   2792 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2793 ;       ."|     ( -- )
                                   2794 ;       Run time routine of ." .
                                   2795 ;       Output a compiled string.
                                   2796 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2797 ;       _HEADER DOTQP,COMPO+3,".\"|"
      009006                       2798 DOTQP:
      009006 CD 8F E9         [ 4] 2799         CALL     DOSTR
      009009 CD 8D 27         [ 4] 2800         CALL     COUNT
      00900C CC 8F C1         [ 2] 2801         JP     TYPES
                                   2802 
                                   2803 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2804 ;       .R      ( n +n -- )
                                   2805 ;       Display an integer in a field
                                   2806 ;       of n columns, right justified.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



                                   2807 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000F8F                       2808         _HEADER DOTR,2,".R"
      00900F 8F D6                    1         .word LINK 
                           000F91     2         LINK=.
      009011 02                       3         .byte 2  
      009012 2E 52                    4         .ascii ".R"
      009014                          5         DOTR:
      009014 CD 86 6A         [ 4] 2809         CALL     TOR
      009017 CD 8E D8         [ 4] 2810         CALL     STR
      00901A CD 85 B4         [ 4] 2811         CALL     RFROM
      00901D CD 86 C9         [ 4] 2812         CALL     OVER
      009020 CD 89 50         [ 4] 2813         CALL     SUBB
      009023 CD 8F A6         [ 4] 2814         CALL     SPACS
      009026 CC 8F C1         [ 2] 2815         JP     TYPES
                                   2816 
                                   2817 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2818 ;       U.R     ( u +n -- )
                                   2819 ;       Display an unsigned integer
                                   2820 ;       in n column, right justified.
                                   2821 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000FA9                       2822         _HEADER UDOTR,3,"U.R"
      009029 90 11                    1         .word LINK 
                           000FAB     2         LINK=.
      00902B 03                       3         .byte 3  
      00902C 55 2E 52                 4         .ascii "U.R"
      00902F                          5         UDOTR:
      00902F CD 86 6A         [ 4] 2823         CALL     TOR
      009032 CD 8E 5B         [ 4] 2824         CALL     BDIGS
      009035 CD 8E 95         [ 4] 2825         CALL     DIGS
      009038 CD 8E C0         [ 4] 2826         CALL     EDIGS
      00903B CD 85 B4         [ 4] 2827         CALL     RFROM
      00903E CD 86 C9         [ 4] 2828         CALL     OVER
      009041 CD 89 50         [ 4] 2829         CALL     SUBB
      009044 CD 8F A6         [ 4] 2830         CALL     SPACS
      009047 CC 8F C1         [ 2] 2831         JP     TYPES
                                   2832 
                                   2833 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2834 ;       U.      ( u -- )
                                   2835 ;       Display an unsigned integer
                                   2836 ;       in free format.
                                   2837 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000FCA                       2838         _HEADER UDOT,2,"U."
      00904A 90 2B                    1         .word LINK 
                           000FCC     2         LINK=.
      00904C 02                       3         .byte 2  
      00904D 55 2E                    4         .ascii "U."
      00904F                          5         UDOT:
      00904F CD 8E 5B         [ 4] 2839         CALL     BDIGS
      009052 CD 8E 95         [ 4] 2840         CALL     DIGS
      009055 CD 8E C0         [ 4] 2841         CALL     EDIGS
      009058 CD 8F 97         [ 4] 2842         CALL     SPACE
      00905B CC 8F C1         [ 2] 2843         JP     TYPES
                                   2844 
                                   2845 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2846 ;   H. ( n -- )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



                                   2847 ;   display n in hexadecimal 
                                   2848 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000FDE                       2849         _HEADER HDOT,2,"H."
      00905E 90 4C                    1         .word LINK 
                           000FE0     2         LINK=.
      009060 02                       3         .byte 2  
      009061 48 2E                    4         .ascii "H."
      009063                          5         HDOT:
      009063 CD 87 67         [ 4] 2850         CALL BASE 
      009066 CD 85 63         [ 4] 2851         CALL AT 
      009069 CD 86 6A         [ 4] 2852         CALL TOR 
      00906C CD 8E F6         [ 4] 2853         CALL HEX 
      00906F CD 90 4F         [ 4] 2854         CALL UDOT 
      009072 CD 85 B4         [ 4] 2855         CALL RFROM 
      009075 CD 87 67         [ 4] 2856         CALL BASE 
      009078 CD 85 51         [ 4] 2857         CALL STORE 
      00907B 81               [ 4] 2858         RET 
                                   2859 
                                   2860 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2861 ;       .       ( w -- )
                                   2862 ;       Display an integer in free
                                   2863 ;       format, preceeded by a space.
                                   2864 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000FFC                       2865         _HEADER DOT,1,"."
      00907C 90 60                    1         .word LINK 
                           000FFE     2         LINK=.
      00907E 01                       3         .byte 1  
      00907F 2E                       4         .ascii "."
      009080                          5         DOT:
      009080 CD 87 67         [ 4] 2866         CALL     BASE
      009083 CD 85 63         [ 4] 2867         CALL     AT
      009086 CD 84 EF         [ 4] 2868         CALL     DOLIT
      009089 00 0A                 2869         .word      10
      00908B CD 87 27         [ 4] 2870         CALL     XORR    ;?decimal
      00908E CD 85 18         [ 4] 2871         CALL     QBRAN
      009091 90 96                 2872         .word      DOT1
      009093 CC 90 4F         [ 2] 2873         JP     UDOT
      009096 CD 8E D8         [ 4] 2874 DOT1:   CALL     STR
      009099 CD 8F 97         [ 4] 2875         CALL     SPACE
      00909C CC 8F C1         [ 2] 2876         JP     TYPES
                                   2877 
                                   2878 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2879 ;       ?       ( a -- )
                                   2880 ;       Display contents in memory cell.
                                   2881 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00101F                       2882         _HEADER QUEST,1,"?"
      00909F 90 7E                    1         .word LINK 
                           001021     2         LINK=.
      0090A1 01                       3         .byte 1  
      0090A2 3F                       4         .ascii "?"
      0090A3                          5         QUEST:
      0090A3 CD 85 63         [ 4] 2883         CALL     AT
      0090A6 CC 90 80         [ 2] 2884         JP     DOT
                                   2885 
                                   2886 ;; Parsing
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



                                   2887 
                                   2888 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2889 ;       parse   ( b u c -- b u delta ; <string> )
                                   2890 ;       Scan string delimited by c.
                                   2891 ;       Return found string and its offset.
                                   2892 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001029                       2893         _HEADER PARS,5,"PARS$"
      0090A9 90 A1                    1         .word LINK 
                           00102B     2         LINK=.
      0090AB 05                       3         .byte 5  
      0090AC 50 41 52 53 24           4         .ascii "PARS$"
      0090B1                          5         PARS:
      0090B1 CD 87 76         [ 4] 2894         CALL     TEMP
      0090B4 CD 85 51         [ 4] 2895         CALL     STORE
      0090B7 CD 86 C9         [ 4] 2896         CALL     OVER
      0090BA CD 86 6A         [ 4] 2897         CALL     TOR
      0090BD CD 86 A1         [ 4] 2898         CALL     DUPP
      0090C0 CD 85 18         [ 4] 2899         CALL     QBRAN
      0090C3 91 69                 2900         .word    PARS8
      0090C5 CD 8C 02         [ 4] 2901         CALL     ONEM
      0090C8 CD 87 76         [ 4] 2902         CALL     TEMP
      0090CB CD 85 63         [ 4] 2903         CALL     AT
      0090CE CD 8C 54         [ 4] 2904         CALL     BLANK
      0090D1 CD 89 78         [ 4] 2905         CALL     EQUAL
      0090D4 CD 85 18         [ 4] 2906         CALL     QBRAN
      0090D7 91 0A                 2907         .word      PARS3
      0090D9 CD 86 6A         [ 4] 2908         CALL     TOR
      0090DC CD 8C 54         [ 4] 2909 PARS1:  CALL     BLANK
      0090DF CD 86 C9         [ 4] 2910         CALL     OVER
      0090E2 CD 85 81         [ 4] 2911         CALL     CAT     ;skip leading blanks ONLY
      0090E5 CD 89 50         [ 4] 2912         CALL     SUBB
      0090E8 CD 86 D8         [ 4] 2913         CALL     ZLESS
      0090EB CD 88 F3         [ 4] 2914         CALL     INVER
      0090EE CD 85 18         [ 4] 2915         CALL     QBRAN
      0090F1 91 07                 2916         .word      PARS2
      0090F3 CD 8B F5         [ 4] 2917         CALL     ONEP
      0090F6 CD 85 03         [ 4] 2918         CALL     DONXT
      0090F9 90 DC                 2919         .word      PARS1
      0090FB CD 85 B4         [ 4] 2920         CALL     RFROM
      0090FE CD 86 97         [ 4] 2921         CALL     DROP
      009101 CD 8C 61         [ 4] 2922         CALL     ZERO
      009104 CC 86 A1         [ 2] 2923         JP     DUPP
      009107 CD 85 B4         [ 4] 2924 PARS2:  CALL     RFROM
      00910A CD 86 C9         [ 4] 2925 PARS3:  CALL     OVER
      00910D CD 86 B1         [ 4] 2926         CALL     SWAPP
      009110 CD 86 6A         [ 4] 2927         CALL     TOR
      009113 CD 87 76         [ 4] 2928 PARS4:  CALL     TEMP
      009116 CD 85 63         [ 4] 2929         CALL     AT
      009119 CD 86 C9         [ 4] 2930         CALL     OVER
      00911C CD 85 81         [ 4] 2931         CALL     CAT
      00911F CD 89 50         [ 4] 2932         CALL     SUBB    ;scan for delimiter
      009122 CD 87 76         [ 4] 2933         CALL     TEMP
      009125 CD 85 63         [ 4] 2934         CALL     AT
      009128 CD 8C 54         [ 4] 2935         CALL     BLANK
      00912B CD 89 78         [ 4] 2936         CALL     EQUAL
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



      00912E CD 85 18         [ 4] 2937         CALL     QBRAN
      009131 91 36                 2938         .word      PARS5
      009133 CD 86 D8         [ 4] 2939         CALL     ZLESS
      009136 CD 85 18         [ 4] 2940 PARS5:  CALL     QBRAN
      009139 91 4B                 2941         .word      PARS6
      00913B CD 8B F5         [ 4] 2942         CALL     ONEP
      00913E CD 85 03         [ 4] 2943         CALL     DONXT
      009141 91 13                 2944         .word      PARS4
      009143 CD 86 A1         [ 4] 2945         CALL     DUPP
      009146 CD 86 6A         [ 4] 2946         CALL     TOR
      009149 20 0F            [ 2] 2947         JRA     PARS7
      00914B CD 85 B4         [ 4] 2948 PARS6:  CALL     RFROM
      00914E CD 86 97         [ 4] 2949         CALL     DROP
      009151 CD 86 A1         [ 4] 2950         CALL     DUPP
      009154 CD 8B F5         [ 4] 2951         CALL     ONEP
      009157 CD 86 6A         [ 4] 2952         CALL     TOR
      00915A CD 86 C9         [ 4] 2953 PARS7:  CALL     OVER
      00915D CD 89 50         [ 4] 2954         CALL     SUBB
      009160 CD 85 B4         [ 4] 2955         CALL     RFROM
      009163 CD 85 B4         [ 4] 2956         CALL     RFROM
      009166 CC 89 50         [ 2] 2957         JP     SUBB
      009169 CD 86 C9         [ 4] 2958 PARS8:  CALL     OVER
      00916C CD 85 B4         [ 4] 2959         CALL     RFROM
      00916F CC 89 50         [ 2] 2960         JP     SUBB
                                   2961 
                                   2962 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2963 ;       PARSE   ( c -- b u ; <string> )
                                   2964 ;       Scan input stream and return
                                   2965 ;       counted string delimited by c.
                                   2966 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0010F2                       2967         _HEADER PARSE,5,"PARSE"
      009172 90 AB                    1         .word LINK 
                           0010F4     2         LINK=.
      009174 05                       3         .byte 5  
      009175 50 41 52 53 45           4         .ascii "PARSE"
      00917A                          5         PARSE:
      00917A CD 86 6A         [ 4] 2968         CALL     TOR
      00917D CD 8D 60         [ 4] 2969         CALL     TIB
      009180 CD 87 85         [ 4] 2970         CALL     INN
      009183 CD 85 63         [ 4] 2971         CALL     AT
      009186 CD 88 C6         [ 4] 2972         CALL     PLUS    ;current input buffer pointer
      009189 CD 87 95         [ 4] 2973         CALL     NTIB
      00918C CD 85 63         [ 4] 2974         CALL     AT
      00918F CD 87 85         [ 4] 2975         CALL     INN
      009192 CD 85 63         [ 4] 2976         CALL     AT
      009195 CD 89 50         [ 4] 2977         CALL     SUBB    ;remaining count
      009198 CD 85 B4         [ 4] 2978         CALL     RFROM
      00919B CD 90 B1         [ 4] 2979         CALL     PARS
      00919E CD 87 85         [ 4] 2980         CALL     INN
      0091A1 CC 8C D1         [ 2] 2981         JP     PSTOR
                                   2982 
                                   2983 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2984 ;       .(      ( -- )
                                   2985 ;       Output following string up to next ) .
                                   2986 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



      001124                       2987         _HEADER DOTPR,IMEDD+2,".("
      0091A4 91 74                    1         .word LINK 
                           001126     2         LINK=.
      0091A6 82                       3         .byte IMEDD+2  
      0091A7 2E 28                    4         .ascii ".("
      0091A9                          5         DOTPR:
      0091A9 CD 84 EF         [ 4] 2988         CALL     DOLIT
      0091AC 00 29                 2989         .word     41	; ")"
      0091AE CD 91 7A         [ 4] 2990         CALL     PARSE
      0091B1 CC 8F C1         [ 2] 2991         JP     TYPES
                                   2992 
                                   2993 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2994 ;       (       ( -- )
                                   2995 ;       Ignore following string up to next ).
                                   2996 ;       A comment.
                                   2997 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001134                       2998         _HEADER PAREN,IMEDD+1,"("
      0091B4 91 A6                    1         .word LINK 
                           001136     2         LINK=.
      0091B6 81                       3         .byte IMEDD+1  
      0091B7 28                       4         .ascii "("
      0091B8                          5         PAREN:
      0091B8 CD 84 EF         [ 4] 2999         CALL     DOLIT
      0091BB 00 29                 3000         .word     41	; ")"
      0091BD CD 91 7A         [ 4] 3001         CALL     PARSE
      0091C0 CC 88 A6         [ 2] 3002         JP     DDROP
                                   3003 
                                   3004 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3005 ;       \       ( -- )
                                   3006 ;       Ignore following text till
                                   3007 ;       end of line.
                                   3008 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001143                       3009         _HEADER BKSLA,IMEDD+1,"\\"
      0091C3 91 B6                    1         .word LINK 
                           001145     2         LINK=.
      0091C5 81                       3         .byte IMEDD+1  
      0091C6 5C 5C                    4         .ascii "\\"
      0091C8                          5         BKSLA:
      0091C8 90 AE 00 0E      [ 2] 3010         ldw y,#UCTIB ; #TIB  
      0091CC 90 FE            [ 2] 3011         ldw y,(y)
      0091CE 90 89            [ 2] 3012         pushw y ; count in TIB 
      0091D0 90 AE 00 0C      [ 2] 3013         ldw y,#UINN ; >IN 
      0091D4 90 BF 26         [ 2] 3014         ldw YTEMP,y
      0091D7 90 85            [ 2] 3015         popw y 
      0091D9 91 CF 26         [ 5] 3016         ldw [YTEMP],y
      0091DC 81               [ 4] 3017         ret 
                                   3018 
                                   3019 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3020 ;       WORD    ( c -- a ; <string> )
                                   3021 ;       Parse a word from input stream
                                   3022 ;       and copy it to code dictionary.
                                   3023 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00115D                       3024         _HEADER WORDD,4,"WORD"
      0091DD 91 C5                    1         .word LINK 
                           00115F     2         LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



      0091DF 04                       3         .byte 4  
      0091E0 57 4F 52 44              4         .ascii "WORD"
      0091E4                          5         WORDD:
      0091E4 CD 91 7A         [ 4] 3025         CALL     PARSE
      0091E7 CD 8D 3E         [ 4] 3026         CALL     HERE
      0091EA CD 8B CA         [ 4] 3027         CALL     CELLP
                           000000  3028 .IF CASE_SENSE 
                                   3029         JP      PACKS 
                           000001  3030 .ELSE                 
      0091ED CD 8D FE         [ 4] 3031         CALL     PACKS
                                   3032 ; uppercase TOKEN 
      0091F0 CD 86 A1         [ 4] 3033         CALL    DUPP 
      0091F3 CD 8D 27         [ 4] 3034         CALL    COUNT 
      0091F6 CD 86 6A         [ 4] 3035         CALL    TOR 
      0091F9 CD 85 34         [ 4] 3036         CALL    BRAN 
      0091FC 92 2A                 3037         .word   UPPER2  
      0091FE                       3038 UPPER:
      0091FE CD 86 A1         [ 4] 3039         CALL    DUPP 
      009201 CD 85 81         [ 4] 3040         CALL    CAT
      009204 CD 86 A1         [ 4] 3041         CALL    DUPP 
      009207 CD 84 EF         [ 4] 3042         CALL   DOLIT
      00920A 00 61                 3043         .word   'a' 
      00920C CD 84 EF         [ 4] 3044         CALL    DOLIT
      00920F 00 7B                 3045         .word   'z'+1 
      009211 CD 8A 50         [ 4] 3046         CALL   WITHI 
      009214 CD 85 18         [ 4] 3047         CALL   QBRAN
      009217 92 21                 3048         .word  UPPER1  
      009219 CD 84 EF         [ 4] 3049         CALL    DOLIT 
      00921C 00 DF                 3050         .word   0xDF 
      00921E CD 86 FE         [ 4] 3051         CALL    ANDD 
      009221                       3052 UPPER1:
      009221 CD 86 C9         [ 4] 3053         CALL    OVER 
      009224 CD 85 70         [ 4] 3054         CALL    CSTOR          
      009227 CD 8B F5         [ 4] 3055         CALL    ONEP 
      00922A                       3056 UPPER2: 
      00922A CD 85 03         [ 4] 3057         CALL    DONXT
      00922D 91 FE                 3058         .word   UPPER  
      00922F CD 86 97         [ 4] 3059         CALL    DROP  
      009232 81               [ 4] 3060         RET 
                                   3061 .ENDIF 
                                   3062 
                                   3063 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3064 ;       TOKEN   ( -- a ; <string> )
                                   3065 ;       Parse a word from input stream
                                   3066 ;       and copy it to name dictionary.
                                   3067 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0011B3                       3068         _HEADER TOKEN,5,"TOKEN"
      009233 91 DF                    1         .word LINK 
                           0011B5     2         LINK=.
      009235 05                       3         .byte 5  
      009236 54 4F 4B 45 4E           4         .ascii "TOKEN"
      00923B                          5         TOKEN:
      00923B CD 8C 54         [ 4] 3069         CALL     BLANK
      00923E CC 91 E4         [ 2] 3070         JP     WORDD
                                   3071 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



                                   3072 ;; Dictionary search
                                   3073 
                                   3074 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3075 ;       NAME>   ( na -- ca )
                                   3076 ;       Return a code address given
                                   3077 ;       a name address.
                                   3078 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0011C1                       3079         _HEADER NAMET,5,"NAME>"
      009241 92 35                    1         .word LINK 
                           0011C3     2         LINK=.
      009243 05                       3         .byte 5  
      009244 4E 41 4D 45 3E           4         .ascii "NAME>"
      009249                          5         NAMET:
      009249 CD 8D 27         [ 4] 3080         CALL     COUNT
      00924C CD 84 EF         [ 4] 3081         CALL     DOLIT
      00924F 00 1F                 3082         .word      31
      009251 CD 86 FE         [ 4] 3083         CALL     ANDD
      009254 CC 88 C6         [ 2] 3084         JP     PLUS
                                   3085 
                                   3086 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3087 ;       SAME?   ( a a u -- a a f \ -0+ )
                                   3088 ;       Compare u cells in two
                                   3089 ;       strings. Return 0 if identical.
                                   3090 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0011D7                       3091         _HEADER SAMEQ,5,"SAME?"
      009257 92 43                    1         .word LINK 
                           0011D9     2         LINK=.
      009259 05                       3         .byte 5  
      00925A 53 41 4D 45 3F           4         .ascii "SAME?"
      00925F                          5         SAMEQ:
      00925F CD 8C 02         [ 4] 3092         CALL     ONEM
      009262 CD 86 6A         [ 4] 3093         CALL     TOR
      009265 20 29            [ 2] 3094         JRA     SAME2
      009267 CD 86 C9         [ 4] 3095 SAME1:  CALL     OVER
      00926A CD 85 C5         [ 4] 3096         CALL     RAT
      00926D CD 88 C6         [ 4] 3097         CALL     PLUS
      009270 CD 85 81         [ 4] 3098         CALL     CAT
      009273 CD 86 C9         [ 4] 3099         CALL     OVER
      009276 CD 85 C5         [ 4] 3100         CALL     RAT
      009279 CD 88 C6         [ 4] 3101         CALL     PLUS
      00927C CD 85 81         [ 4] 3102         CALL     CAT
      00927F CD 89 50         [ 4] 3103         CALL     SUBB
      009282 CD 88 54         [ 4] 3104         CALL     QDUP
      009285 CD 85 18         [ 4] 3105         CALL     QBRAN
      009288 92 90                 3106         .word      SAME2
      00928A CD 85 B4         [ 4] 3107         CALL     RFROM
      00928D CC 86 97         [ 2] 3108         JP     DROP
      009290 CD 85 03         [ 4] 3109 SAME2:  CALL     DONXT
      009293 92 67                 3110         .word      SAME1
      009295 CC 8C 61         [ 2] 3111         JP     ZERO
                                   3112 
                                   3113 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3114 ;       find    ( a va -- ca na | a F )
                                   3115 ;       Search vocabulary for string.
                                   3116 ;       Return ca and na if succeeded.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



                                   3117 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001218                       3118         _HEADER FIND,4,"FIND"
      009298 92 59                    1         .word LINK 
                           00121A     2         LINK=.
      00929A 04                       3         .byte 4  
      00929B 46 49 4E 44              4         .ascii "FIND"
      00929F                          5         FIND:
      00929F CD 86 B1         [ 4] 3119         CALL     SWAPP
      0092A2 CD 86 A1         [ 4] 3120         CALL     DUPP
      0092A5 CD 85 81         [ 4] 3121         CALL     CAT
      0092A8 CD 87 76         [ 4] 3122         CALL     TEMP
      0092AB CD 85 51         [ 4] 3123         CALL     STORE
      0092AE CD 86 A1         [ 4] 3124         CALL     DUPP
      0092B1 CD 85 63         [ 4] 3125         CALL     AT
      0092B4 CD 86 6A         [ 4] 3126         CALL     TOR
      0092B7 CD 8B CA         [ 4] 3127         CALL     CELLP
      0092BA CD 86 B1         [ 4] 3128         CALL     SWAPP
      0092BD CD 85 63         [ 4] 3129 FIND1:  CALL     AT
      0092C0 CD 86 A1         [ 4] 3130         CALL     DUPP
      0092C3 CD 85 18         [ 4] 3131         CALL     QBRAN
      0092C6 92 FC                 3132         .word      FIND6
      0092C8 CD 86 A1         [ 4] 3133         CALL     DUPP
      0092CB CD 85 63         [ 4] 3134         CALL     AT
      0092CE CD 84 EF         [ 4] 3135         CALL     DOLIT
      0092D1 1F 7F                 3136         .word      MASKK
      0092D3 CD 86 FE         [ 4] 3137         CALL     ANDD
      0092D6 CD 85 C5         [ 4] 3138         CALL     RAT
      0092D9 CD 87 27         [ 4] 3139         CALL     XORR
      0092DC CD 85 18         [ 4] 3140         CALL     QBRAN
      0092DF 92 EB                 3141         .word      FIND2
      0092E1 CD 8B CA         [ 4] 3142         CALL     CELLP
      0092E4 CD 84 EF         [ 4] 3143         CALL     DOLIT
      0092E7 FF FF                 3144         .word     0xFFFF
      0092E9 20 0C            [ 2] 3145         JRA     FIND3
      0092EB CD 8B CA         [ 4] 3146 FIND2:  CALL     CELLP
      0092EE CD 87 76         [ 4] 3147         CALL     TEMP
      0092F1 CD 85 63         [ 4] 3148         CALL     AT
      0092F4 CD 92 5F         [ 4] 3149         CALL     SAMEQ
      0092F7 CD 85 34         [ 4] 3150 FIND3:  CALL     BRAN
      0092FA 93 0B                 3151         .word      FIND4
      0092FC CD 85 B4         [ 4] 3152 FIND6:  CALL     RFROM
      0092FF CD 86 97         [ 4] 3153         CALL     DROP
      009302 CD 86 B1         [ 4] 3154         CALL     SWAPP
      009305 CD 8B D9         [ 4] 3155         CALL     CELLM
      009308 CC 86 B1         [ 2] 3156         JP     SWAPP
      00930B CD 85 18         [ 4] 3157 FIND4:  CALL     QBRAN
      00930E 93 18                 3158         .word      FIND5
      009310 CD 8B D9         [ 4] 3159         CALL     CELLM
      009313 CD 8B D9         [ 4] 3160         CALL     CELLM
      009316 20 A5            [ 2] 3161         JRA     FIND1
      009318 CD 85 B4         [ 4] 3162 FIND5:  CALL     RFROM
      00931B CD 86 97         [ 4] 3163         CALL     DROP
      00931E CD 86 B1         [ 4] 3164         CALL     SWAPP
      009321 CD 86 97         [ 4] 3165         CALL     DROP
      009324 CD 8B D9         [ 4] 3166         CALL     CELLM
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



      009327 CD 86 A1         [ 4] 3167         CALL     DUPP
      00932A CD 92 49         [ 4] 3168         CALL     NAMET
      00932D CC 86 B1         [ 2] 3169         JP     SWAPP
                                   3170 
                                   3171 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3172 ;       NAME?   ( a -- ca na | a F )
                                   3173 ;       Search vocabularies for a string.
                                   3174 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0012B0                       3175         _HEADER NAMEQ,5,"NAME?"
      009330 92 9A                    1         .word LINK 
                           0012B2     2         LINK=.
      009332 05                       3         .byte 5  
      009333 4E 41 4D 45 3F           4         .ascii "NAME?"
      009338                          5         NAMEQ:
      009338 CD 87 EA         [ 4] 3176         CALL   CNTXT
      00933B CC 92 9F         [ 2] 3177         JP     FIND
                                   3178 
                                   3179 ;; Terminal response
                                   3180 
                                   3181 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3182 ;       ^H      ( bot eot cur -- bot eot cur )
                                   3183 ;       Backup cursor by one character.
                                   3184 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0012BE                       3185         _HEADER BKSP,2,"^H"
      00933E 93 32                    1         .word LINK 
                           0012C0     2         LINK=.
      009340 02                       3         .byte 2  
      009341 5E 48                    4         .ascii "^H"
      009343                          5         BKSP:
      009343 CD 86 6A         [ 4] 3186         CALL     TOR
      009346 CD 86 C9         [ 4] 3187         CALL     OVER
      009349 CD 85 B4         [ 4] 3188         CALL     RFROM
      00934C CD 86 B1         [ 4] 3189         CALL     SWAPP
      00934F CD 86 C9         [ 4] 3190         CALL     OVER
      009352 CD 87 27         [ 4] 3191         CALL     XORR
      009355 CD 85 18         [ 4] 3192         CALL     QBRAN
      009358 93 73                 3193         .word      BACK1
      00935A CD 84 EF         [ 4] 3194         CALL     DOLIT
      00935D 00 08                 3195         .word      BKSPP
      00935F CD 84 B6         [ 4] 3196         CALL     EMIT
      009362 CD 8C 02         [ 4] 3197         CALL     ONEM
      009365 CD 8C 54         [ 4] 3198         CALL     BLANK
      009368 CD 84 B6         [ 4] 3199         CALL     EMIT
      00936B CD 84 EF         [ 4] 3200         CALL     DOLIT
      00936E 00 08                 3201         .word      BKSPP
      009370 CC 84 B6         [ 2] 3202         JP     EMIT
      009373 81               [ 4] 3203 BACK1:  RET
                                   3204 
                                   3205 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3206 ;       TAP    ( bot eot cur c -- bot eot cur )
                                   3207 ;       Accept and echo key stroke
                                   3208 ;       and bump cursor.
                                   3209 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0012F4                       3210         _HEADER TAP,3,"TAP"
      009374 93 40                    1         .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



                           0012F6     2         LINK=.
      009376 03                       3         .byte 3  
      009377 54 41 50                 4         .ascii "TAP"
      00937A                          5         TAP:
      00937A CD 86 A1         [ 4] 3211         CALL     DUPP
      00937D CD 84 B6         [ 4] 3212         CALL     EMIT
      009380 CD 86 C9         [ 4] 3213         CALL     OVER
      009383 CD 85 70         [ 4] 3214         CALL     CSTOR
      009386 CC 8B F5         [ 2] 3215         JP     ONEP
                                   3216 
                                   3217 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3218 ;       kTAP    ( bot eot cur c -- bot eot cur )
                                   3219 ;       Process a key stroke,
                                   3220 ;       CR,LF or backspace.
                                   3221 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001309                       3222         _HEADER KTAP,4,"KTAP"
      009389 93 76                    1         .word LINK 
                           00130B     2         LINK=.
      00938B 04                       3         .byte 4  
      00938C 4B 54 41 50              4         .ascii "KTAP"
      009390                          5         KTAP:
      009390 CD 86 A1         [ 4] 3223         CALL     DUPP
      009393 CD 84 EF         [ 4] 3224         CALL     DOLIT
                           000001  3225 .if EOL_CR
      009396 00 0D                 3226         .word   CRR
                           000000  3227 .else ; EOL_LF 
                                   3228         .word   LF
                                   3229 .endif 
      009398 CD 87 27         [ 4] 3230         CALL     XORR
      00939B CD 85 18         [ 4] 3231         CALL     QBRAN
      00939E 93 B6                 3232         .word      KTAP2
      0093A0 CD 84 EF         [ 4] 3233         CALL     DOLIT
      0093A3 00 08                 3234         .word      BKSPP
      0093A5 CD 87 27         [ 4] 3235         CALL     XORR
      0093A8 CD 85 18         [ 4] 3236         CALL     QBRAN
      0093AB 93 B3                 3237         .word      KTAP1
      0093AD CD 8C 54         [ 4] 3238         CALL     BLANK
      0093B0 CC 93 7A         [ 2] 3239         JP     TAP
      0093B3 CC 93 43         [ 2] 3240 KTAP1:  JP     BKSP
      0093B6 CD 86 97         [ 4] 3241 KTAP2:  CALL     DROP
      0093B9 CD 86 B1         [ 4] 3242         CALL     SWAPP
      0093BC CD 86 97         [ 4] 3243         CALL     DROP
      0093BF CC 86 A1         [ 2] 3244         JP     DUPP
                                   3245 
                                   3246 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3247 ;       accept  ( b u -- b u )
                                   3248 ;       Accept characters to input
                                   3249 ;       buffer. Return with actual count.
                                   3250 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001342                       3251         _HEADER ACCEP,6,"ACCEPT"
      0093C2 93 8B                    1         .word LINK 
                           001344     2         LINK=.
      0093C4 06                       3         .byte 6  
      0093C5 41 43 43 45 50 54        4         .ascii "ACCEPT"
      0093CB                          5         ACCEP:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



      0093CB CD 86 C9         [ 4] 3252         CALL     OVER
      0093CE CD 88 C6         [ 4] 3253         CALL     PLUS
      0093D1 CD 86 C9         [ 4] 3254         CALL     OVER
      0093D4 CD 88 B1         [ 4] 3255 ACCP1:  CALL     DDUP
      0093D7 CD 87 27         [ 4] 3256         CALL     XORR
      0093DA CD 85 18         [ 4] 3257         CALL     QBRAN
      0093DD 93 FF                 3258         .word      ACCP4
      0093DF CD 8F 5F         [ 4] 3259         CALL     KEY
      0093E2 CD 86 A1         [ 4] 3260         CALL     DUPP
      0093E5 CD 8C 54         [ 4] 3261         CALL     BLANK
      0093E8 CD 84 EF         [ 4] 3262         CALL     DOLIT
      0093EB 00 7F                 3263         .word      127
      0093ED CD 8A 50         [ 4] 3264         CALL     WITHI
      0093F0 CD 85 18         [ 4] 3265         CALL     QBRAN
      0093F3 93 FA                 3266         .word      ACCP2
      0093F5 CD 93 7A         [ 4] 3267         CALL     TAP
      0093F8 20 03            [ 2] 3268         JRA     ACCP3
      0093FA CD 93 90         [ 4] 3269 ACCP2:  CALL     KTAP
      0093FD 20 D5            [ 2] 3270 ACCP3:  JRA     ACCP1
      0093FF CD 86 97         [ 4] 3271 ACCP4:  CALL     DROP
      009402 CD 86 C9         [ 4] 3272         CALL     OVER
      009405 CC 89 50         [ 2] 3273         JP     SUBB
                                   3274 
                                   3275 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3276 ;       QUERY   ( -- )
                                   3277 ;       Accept input stream to
                                   3278 ;       terminal input buffer.
                                   3279 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001388                       3280         _HEADER QUERY,5,"QUERY"
      009408 93 C4                    1         .word LINK 
                           00138A     2         LINK=.
      00940A 05                       3         .byte 5  
      00940B 51 55 45 52 59           4         .ascii "QUERY"
      009410                          5         QUERY:
      009410 CD 8D 60         [ 4] 3281         CALL     TIB
      009413 CD 84 EF         [ 4] 3282         CALL     DOLIT
      009416 00 50                 3283         .word      80
      009418 CD 93 CB         [ 4] 3284         CALL     ACCEP
      00941B CD 87 95         [ 4] 3285         CALL     NTIB
      00941E CD 85 51         [ 4] 3286         CALL     STORE
      009421 CD 86 97         [ 4] 3287         CALL     DROP
      009424 CD 8C 61         [ 4] 3288         CALL     ZERO
      009427 CD 87 85         [ 4] 3289         CALL     INN
      00942A CC 85 51         [ 2] 3290         JP     STORE
                                   3291 
                                   3292 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3293 ;       ABORT   ( -- )
                                   3294 ;       Reset data stack and
                                   3295 ;       jump to QUIT.
                                   3296 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0013AD                       3297         _HEADER ABORT,5,"ABORT"
      00942D 94 0A                    1         .word LINK 
                           0013AF     2         LINK=.
      00942F 05                       3         .byte 5  
      009430 41 42 4F 52 54           4         .ascii "ABORT"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



      009435                          5         ABORT:
      009435 CD 95 2C         [ 4] 3298         CALL     PRESE
      009438 CC 95 49         [ 2] 3299         JP     QUIT
                                   3300 
                                   3301 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3302 ;       abort"  ( f -- )
                                   3303 ;       Run time routine of ABORT".
                                   3304 ;       Abort with a message.
                                   3305 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0013BB                       3306         _HEADER ABORQ,COMPO+6,'ABORT"'
      00943B 94 2F                    1         .word LINK 
                           0013BD     2         LINK=.
      00943D 46                       3         .byte COMPO+6  
      00943E 41 42 4F 52 54 22        4         .ascii 'ABORT"'
      009444                          5         ABORQ:
      009444 CD 85 18         [ 4] 3307         CALL     QBRAN
      009447 94 63                 3308         .word      ABOR2   ;text flag
      009449 CD 8F E9         [ 4] 3309         CALL     DOSTR
      00944C CD 8F 97         [ 4] 3310 ABOR1:  CALL     SPACE
      00944F CD 8D 27         [ 4] 3311         CALL     COUNT
      009452 CD 8F C1         [ 4] 3312         CALL     TYPES
      009455 CD 84 EF         [ 4] 3313         CALL     DOLIT
      009458 00 3F                 3314         .word     63 ; "?"
      00945A CD 84 B6         [ 4] 3315         CALL     EMIT
      00945D CD 8F D9         [ 4] 3316         CALL     CR
      009460 CC 94 35         [ 2] 3317         JP     ABORT   ;pass error string
      009463 CD 8F E9         [ 4] 3318 ABOR2:  CALL     DOSTR
      009466 CC 86 97         [ 2] 3319         JP     DROP
                                   3320 
                                   3321 ;; The text interpreter
                                   3322 
                                   3323 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3324 ;       $INTERPRET      ( a -- )
                                   3325 ;       Interpret a word. If failed,
                                   3326 ;       try to convert it to an integer.
                                   3327 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0013E9                       3328         _HEADER INTER,10,"$INTERPRET"
      009469 94 3D                    1         .word LINK 
                           0013EB     2         LINK=.
      00946B 0A                       3         .byte 10  
      00946C 24 49 4E 54 45 52 50     4         .ascii "$INTERPRET"
             52 45 54
      009476                          5         INTER:
      009476 CD 93 38         [ 4] 3329         CALL     NAMEQ
      009479 CD 88 54         [ 4] 3330         CALL     QDUP    ;?defined
      00947C CD 85 18         [ 4] 3331         CALL     QBRAN
      00947F 94 A0                 3332         .word      INTE1
      009481 CD 85 63         [ 4] 3333         CALL     AT
      009484 CD 84 EF         [ 4] 3334         CALL     DOLIT
      009487 40 00                 3335 	.word       0x4000	; COMPO*256
      009489 CD 86 FE         [ 4] 3336         CALL     ANDD    ;?compile only lexicon bits
      00948C CD 94 44         [ 4] 3337         CALL     ABORQ
      00948F 0D                    3338         .byte      13
      009490 20 63 6F 6D 70 69 6C  3339         .ascii     " compile only"
             65 20 6F 6E 6C 79
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



      00949D CC 85 44         [ 2] 3340         JP     EXECU
      0094A0 CD A5 40         [ 4] 3341 INTE1:  CALL     NUMBQ   ;convert a number
      0094A3 CD 85 18         [ 4] 3342         CALL     QBRAN
      0094A6 94 4C                 3343         .word    ABOR1
      0094A8 81               [ 4] 3344         RET
                                   3345 
                                   3346 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3347 ;       [       ( -- )
                                   3348 ;       Start  text interpreter.
                                   3349 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001429                       3350         _HEADER LBRAC,IMEDD+1,"["
      0094A9 94 6B                    1         .word LINK 
                           00142B     2         LINK=.
      0094AB 81                       3         .byte IMEDD+1  
      0094AC 5B                       4         .ascii "["
      0094AD                          5         LBRAC:
      0094AD CD 84 EF         [ 4] 3351         CALL   DOLIT
      0094B0 94 76                 3352         .word  INTER
      0094B2 CD 87 C8         [ 4] 3353         CALL   TEVAL
      0094B5 CC 85 51         [ 2] 3354         JP     STORE
                                   3355 
                                   3356 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3357 ;       .OK     ( -- )
                                   3358 ;       Display 'ok' while interpreting.
                                   3359 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001438                       3360         _HEADER DOTOK,3,".OK"
      0094B8 94 AB                    1         .word LINK 
                           00143A     2         LINK=.
      0094BA 03                       3         .byte 3  
      0094BB 2E 4F 4B                 4         .ascii ".OK"
      0094BE                          5         DOTOK:
      0094BE CD 84 EF         [ 4] 3361         CALL     DOLIT
      0094C1 94 76                 3362         .word      INTER
      0094C3 CD 87 C8         [ 4] 3363         CALL     TEVAL
      0094C6 CD 85 63         [ 4] 3364         CALL     AT
      0094C9 CD 89 78         [ 4] 3365         CALL     EQUAL
      0094CC CD 85 18         [ 4] 3366         CALL     QBRAN
      0094CF 94 D8                 3367         .word      DOTO1
      0094D1 CD 90 06         [ 4] 3368         CALL     DOTQP
      0094D4 03                    3369         .byte      3
      0094D5 20 6F 6B              3370         .ascii     " ok"
      0094D8 CC 8F D9         [ 2] 3371 DOTO1:  JP     CR
                                   3372 
                                   3373 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3374 ;       ?STACK  ( -- )
                                   3375 ;       Abort if stack underflows.
                                   3376 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00145B                       3377         _HEADER QSTAC,6,"?STACK"
      0094DB 94 BA                    1         .word LINK 
                           00145D     2         LINK=.
      0094DD 06                       3         .byte 6  
      0094DE 3F 53 54 41 43 4B        4         .ascii "?STACK"
      0094E4                          5         QSTAC:
      0094E4 CD 8C A3         [ 4] 3378         CALL     DEPTH
      0094E7 CD 86 D8         [ 4] 3379         CALL     ZLESS   ;check only for underflow
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



      0094EA CD 94 44         [ 4] 3380         CALL     ABORQ
      0094ED 0B                    3381         .byte      11
      0094EE 20 75 6E 64 65 72 66  3382         .ascii     " underflow "
             6C 6F 77 20
      0094F9 81               [ 4] 3383         RET
                                   3384 
                                   3385 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3386 ;       EVAL    ( -- )
                                   3387 ;       Interpret  input stream.
                                   3388 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00147A                       3389         _HEADER EVAL,4,"EVAL"
      0094FA 94 DD                    1         .word LINK 
                           00147C     2         LINK=.
      0094FC 04                       3         .byte 4  
      0094FD 45 56 41 4C              4         .ascii "EVAL"
      009501                          5         EVAL:
      009501 CD 92 3B         [ 4] 3390 EVAL1:  CALL     TOKEN
      009504 CD 86 A1         [ 4] 3391         CALL     DUPP
      009507 CD 85 81         [ 4] 3392         CALL     CAT     ;?input stream empty
      00950A CD 85 18         [ 4] 3393         CALL     QBRAN
      00950D 95 1D                 3394         .word    EVAL2
      00950F CD 87 C8         [ 4] 3395         CALL     TEVAL
      009512 CD 8D 74         [ 4] 3396         CALL     ATEXE
      009515 CD 94 E4         [ 4] 3397         CALL     QSTAC   ;evaluate input, check stack
      009518 CD 85 34         [ 4] 3398         CALL     BRAN
      00951B 95 01                 3399         .word    EVAL1
      00951D CD 86 97         [ 4] 3400 EVAL2:  CALL     DROP
      009520 CC 94 BE         [ 2] 3401         JP       DOTOK
                                   3402 
                                   3403 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3404 ;       PRESET  ( -- )
                                   3405 ;       Reset data stack pointer and
                                   3406 ;       terminal input buffer.
                                   3407 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0014A3                       3408         _HEADER PRESE,6,"PRESET"
      009523 94 FC                    1         .word LINK 
                           0014A5     2         LINK=.
      009525 06                       3         .byte 6  
      009526 50 52 45 53 45 54        4         .ascii "PRESET"
      00952C                          5         PRESE:
      00952C CD 84 EF         [ 4] 3409         CALL     DOLIT
      00952F 16 80                 3410         .word      SPP
      009531 CD 86 8E         [ 4] 3411         CALL     SPSTO
      009534 CD 84 EF         [ 4] 3412         CALL     DOLIT
      009537 17 00                 3413         .word      TIBB
      009539 CD 87 95         [ 4] 3414         CALL     NTIB
      00953C CD 8B CA         [ 4] 3415         CALL     CELLP
      00953F CC 85 51         [ 2] 3416         JP     STORE
                                   3417 
                                   3418 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3419 ;       QUIT    ( -- )
                                   3420 ;       Reset return stack pointer
                                   3421 ;       and start text interpreter.
                                   3422 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0014C2                       3423         _HEADER QUIT,4,"QUIT"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



      009542 95 25                    1         .word LINK 
                           0014C4     2         LINK=.
      009544 04                       3         .byte 4  
      009545 51 55 49 54              4         .ascii "QUIT"
      009549                          5         QUIT:
      009549 CD 84 EF         [ 4] 3424         CALL     DOLIT
      00954C 17 FF                 3425         .word      RPP
      00954E CD 85 9E         [ 4] 3426         CALL     RPSTO   ;reset return stack pointer
      009551 CD 94 AD         [ 4] 3427 QUIT1:  CALL     LBRAC   ;start interpretation
      009554 CD 94 10         [ 4] 3428 QUIT2:  CALL     QUERY   ;get input
      009557 CD 95 01         [ 4] 3429         CALL     EVAL
      00955A 20 F8            [ 2] 3430         JRA     QUIT2   ;continue till error
                                   3431 
                                   3432 ;; The compiler
                                   3433 
                                   3434 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3435 ;       '       ( -- ca )
                                   3436 ;       Search vocabularies for
                                   3437 ;       next word in input stream.
                                   3438 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0014DC                       3439         _HEADER TICK,1,"'"
      00955C 95 44                    1         .word LINK 
                           0014DE     2         LINK=.
      00955E 01                       3         .byte 1  
      00955F 27                       4         .ascii "'"
      009560                          5         TICK:
      009560 CD 92 3B         [ 4] 3440         CALL     TOKEN
      009563 CD 93 38         [ 4] 3441         CALL     NAMEQ   ;?defined
      009566 CD 85 18         [ 4] 3442         CALL     QBRAN
      009569 94 4C                 3443         .word      ABOR1
      00956B 81               [ 4] 3444         RET     ;yes, push code address
                                   3445 
                                   3446 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3447 ;       ALLOT   ( n -- )
                                   3448 ;       Allocate n bytes to RAM 
                                   3449 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0014EC                       3450         _HEADER ALLOT,5,"ALLOT"
      00956C 95 5E                    1         .word LINK 
                           0014EE     2         LINK=.
      00956E 05                       3         .byte 5  
      00956F 41 4C 4C 4F 54           4         .ascii "ALLOT"
      009574                          5         ALLOT:
      009574 CD 87 F8         [ 4] 3451         CALL     VPP
                                   3452 ; must update APP_VP each time VP is modidied
      009577 CD 8C D1         [ 4] 3453         call PSTOR 
      00957A CC 9C BD         [ 2] 3454         jp UPDATVP 
                                   3455 
                                   3456 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3457 ;       ,       ( w -- )
                                   3458 ;         Compile an integer into
                                   3459 ;         variable space.
                                   3460 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0014FD                       3461         _HEADER COMMA,1,^/"\,"/
      00957D 95 6E                    1         .word LINK 
                           0014FF     2         LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



      00957F 01                       3         .byte 1  
      009580 5C 2C                    4         .ascii "\,"
      009582                          5         COMMA:
      009582 CD 8D 3E         [ 4] 3462         CALL     HERE
      009585 CD 86 A1         [ 4] 3463         CALL     DUPP
      009588 CD 8B CA         [ 4] 3464         CALL     CELLP   ;cell boundary
      00958B CD 87 F8         [ 4] 3465         CALL     VPP
      00958E CD 85 51         [ 4] 3466         CALL     STORE
      009591 CC 85 51         [ 2] 3467         JP     STORE
                                   3468 
                                   3469 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3470 ;       C,      ( c -- )
                                   3471 ;       Compile a byte into
                                   3472 ;       variables space.
                                   3473 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001514                       3474         _HEADER CCOMMA,2,^/"C,"/
      009594 95 7F                    1         .word LINK 
                           001516     2         LINK=.
      009596 02                       3         .byte 2  
      009597 43 2C                    4         .ascii "C,"
      009599                          5         CCOMMA:
      009599 CD 8D 3E         [ 4] 3475         CALL     HERE
      00959C CD 86 A1         [ 4] 3476         CALL     DUPP
      00959F CD 8B F5         [ 4] 3477         CALL     ONEP
      0095A2 CD 87 F8         [ 4] 3478         CALL     VPP
      0095A5 CD 85 51         [ 4] 3479         CALL     STORE
      0095A8 CC 85 70         [ 2] 3480         JP     CSTOR
                                   3481 
                                   3482 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3483 ;       [COMPILE]       ( -- ; <string> )
                                   3484 ;       Compile next immediate
                                   3485 ;       word into code dictionary.
                                   3486 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00152B                       3487         _HEADER BCOMP,IMEDD+9,"[COMPILE]"
      0095AB 95 96                    1         .word LINK 
                           00152D     2         LINK=.
      0095AD 89                       3         .byte IMEDD+9  
      0095AE 5B 43 4F 4D 50 49 4C     4         .ascii "[COMPILE]"
             45 5D
      0095B7                          5         BCOMP:
      0095B7 CD 95 60         [ 4] 3488         CALL     TICK
      0095BA CC 98 8C         [ 2] 3489         JP     JSRC
                                   3490 
                                   3491 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3492 ;       COMPILE ( -- )
                                   3493 ;       Compile next jsr in
                                   3494 ;       colon list to code dictionary.
                                   3495 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00153D                       3496         _HEADER COMPI,COMPO+7,"COMPILE"
      0095BD 95 AD                    1         .word LINK 
                           00153F     2         LINK=.
      0095BF 47                       3         .byte COMPO+7  
      0095C0 43 4F 4D 50 49 4C 45     4         .ascii "COMPILE"
      0095C7                          5         COMPI:
      0095C7 CD 85 B4         [ 4] 3497         CALL     RFROM
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



      0095CA CD 86 A1         [ 4] 3498         CALL     DUPP
      0095CD CD 85 63         [ 4] 3499         CALL     AT
      0095D0 CD 98 8C         [ 4] 3500         CALL     JSRC    ;compile subroutine
      0095D3 CD 8B CA         [ 4] 3501         CALL     CELLP
      0095D6 90 93            [ 1] 3502         ldw y,x 
      0095D8 90 FE            [ 2] 3503         ldw y,(y)
      0095DA 1C 00 02         [ 2] 3504         addw x,#CELLL 
      0095DD 90 FC            [ 2] 3505         jp (y)
                                   3506 
                                   3507 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3508 ;       LITERAL ( w -- )
                                   3509 ;       Compile tos to dictionary
                                   3510 ;       as an integer literal.
                                   3511 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00155F                       3512         _HEADER LITER,COMPO+IMEDD+7,"LITERAL"
      0095DF 95 BF                    1         .word LINK 
                           001561     2         LINK=.
      0095E1 C7                       3         .byte COMPO+IMEDD+7  
      0095E2 4C 49 54 45 52 41 4C     4         .ascii "LITERAL"
      0095E9                          5         LITER:
      0095E9 CD 95 C7         [ 4] 3513         CALL     COMPI
      0095EC 84 EF                 3514         .word DOLIT 
      0095EE CC 95 82         [ 2] 3515         JP     COMMA
                                   3516 
                                   3517 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3518 ;       $,"     ( -- )
                                   3519 ;       Compile a literal string
                                   3520 ;       up to next " .
                                   3521 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3522 ;        _HEADER STRCQ,3,^/'$,"'/
      0095F1                       3523 STRCQ:
      0095F1 CD 84 EF         [ 4] 3524         CALL     DOLIT
      0095F4 00 22                 3525         .word     34	; "
      0095F6 CD 91 7A         [ 4] 3526         CALL     PARSE
      0095F9 CD 8D 3E         [ 4] 3527         CALL     HERE
      0095FC CD 8D FE         [ 4] 3528         CALL     PACKS   ;string to code dictionary
      0095FF CD 8D 27         [ 4] 3529         CALL     COUNT
      009602 CD 88 C6         [ 4] 3530         CALL     PLUS    ;calculate aligned end of string
      009605 CD 87 F8         [ 4] 3531         CALL     VPP
      009608 CC 85 51         [ 2] 3532         JP     STORE
                                   3533 
                                   3534 ;; Structures
                                   3535 
                                   3536 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3537 ;       FOR     ( -- a )
                                   3538 ;       Start a FOR-NEXT loop
                                   3539 ;       structure in a colon definition.
                                   3540 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00158B                       3541         _HEADER FOR,IMEDD+3,"FOR"
      00960B 95 E1                    1         .word LINK 
                           00158D     2         LINK=.
      00960D 83                       3         .byte IMEDD+3  
      00960E 46 4F 52                 4         .ascii "FOR"
      009611                          5         FOR:
      009611 CD 95 C7         [ 4] 3542         CALL     COMPI
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



      009614 86 6A                 3543         .word TOR 
      009616 CC 8D 3E         [ 2] 3544         JP     HERE
                                   3545 
                                   3546 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3547 ;       NEXT    ( a -- )
                                   3548 ;       Terminate a FOR-NEXT loop.
                                   3549 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001599                       3550         _HEADER NEXT,IMEDD+4,"NEXT"
      009619 96 0D                    1         .word LINK 
                           00159B     2         LINK=.
      00961B 84                       3         .byte IMEDD+4  
      00961C 4E 45 58 54              4         .ascii "NEXT"
      009620                          5         NEXT:
      009620 CD 95 C7         [ 4] 3551         CALL     COMPI
      009623 85 03                 3552         .word DONXT 
      009625 CD 88 44         [ 4] 3553         call ADRADJ
      009628 CC 95 82         [ 2] 3554         JP     COMMA
                                   3555 
                                   3556 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3557 ;       I ( -- n )
                                   3558 ;       stack COUNTER
                                   3559 ;       of innermost FOR-NEXT  
                                   3560 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0015AB                       3561         _HEADER IFETCH,1,"I"
      00962B 96 1B                    1         .word LINK 
                           0015AD     2         LINK=.
      00962D 01                       3         .byte 1  
      00962E 49                       4         .ascii "I"
      00962F                          5         IFETCH:
      00962F 1D 00 02         [ 2] 3562         subw x,#CELLL 
      009632 16 03            [ 2] 3563         ldw y,(3,sp)
      009634 FF               [ 2] 3564         ldw (x),y 
      009635 81               [ 4] 3565         ret 
                                   3566 
                                   3567 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3568 ;       J ( -- n )
                                   3569 ;   stack COUNTER
                                   3570 ;   of outer FOR-NEXT  
                                   3571 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0015B6                       3572         _HEADER JFETCH,1,"J"
      009636 96 2D                    1         .word LINK 
                           0015B8     2         LINK=.
      009638 01                       3         .byte 1  
      009639 4A                       4         .ascii "J"
      00963A                          5         JFETCH:
      00963A 1D 00 02         [ 2] 3573         SUBW X,#CELLL 
      00963D 16 05            [ 2] 3574         LDW Y,(5,SP)
      00963F FF               [ 2] 3575         LDW (X),Y 
      009640 81               [ 4] 3576         RET 
                                   3577 
                                   3578 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3579 ;       BEGIN   ( -- a )
                                   3580 ;       Start an infinite or
                                   3581 ;       indefinite loop structure.
                                   3582 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



      0015C1                       3583         _HEADER BEGIN,IMEDD+5,"BEGIN"
      009641 96 38                    1         .word LINK 
                           0015C3     2         LINK=.
      009643 85                       3         .byte IMEDD+5  
      009644 42 45 47 49 4E           4         .ascii "BEGIN"
      009649                          5         BEGIN:
      009649 CC 8D 3E         [ 2] 3584         JP     HERE
                                   3585 
                                   3586 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3587 ;       UNTIL   ( a -- )
                                   3588 ;       Terminate a BEGIN-UNTIL
                                   3589 ;       indefinite loop structure.
                                   3590 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0015CC                       3591         _HEADER UNTIL,IMEDD+5,"UNTIL"
      00964C 96 43                    1         .word LINK 
                           0015CE     2         LINK=.
      00964E 85                       3         .byte IMEDD+5  
      00964F 55 4E 54 49 4C           4         .ascii "UNTIL"
      009654                          5         UNTIL:
      009654 CD 95 C7         [ 4] 3592         CALL     COMPI
      009657 85 18                 3593         .word    QBRAN 
      009659 CD 88 44         [ 4] 3594         call ADRADJ
      00965C CC 95 82         [ 2] 3595         JP     COMMA
                                   3596 
                                   3597 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3598 ;       AGAIN   ( a -- )
                                   3599 ;       Terminate a BEGIN-AGAIN
                                   3600 ;       infinite loop structure.
                                   3601 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0015DF                       3602         _HEADER AGAIN,IMEDD+5,"AGAIN"
      00965F 96 4E                    1         .word LINK 
                           0015E1     2         LINK=.
      009661 85                       3         .byte IMEDD+5  
      009662 41 47 41 49 4E           4         .ascii "AGAIN"
      009667                          5         AGAIN:
      009667 CD 95 C7         [ 4] 3603         CALL     COMPI
      00966A 85 34                 3604         .word BRAN
      00966C CD 88 44         [ 4] 3605         call ADRADJ 
      00966F CC 95 82         [ 2] 3606         JP     COMMA
                                   3607 
                                   3608 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3609 ;       IF      ( -- A )
                                   3610 ;       Begin a conditional branch.
                                   3611 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0015F2                       3612         _HEADER IFF,IMEDD+2,"IF"
      009672 96 61                    1         .word LINK 
                           0015F4     2         LINK=.
      009674 82                       3         .byte IMEDD+2  
      009675 49 46                    4         .ascii "IF"
      009677                          5         IFF:
      009677 CD 95 C7         [ 4] 3613         CALL     COMPI
      00967A 85 18                 3614         .word QBRAN
      00967C CD 8D 3E         [ 4] 3615         CALL     HERE
      00967F CD 8C 61         [ 4] 3616         CALL     ZERO
      009682 CC 95 82         [ 2] 3617         JP     COMMA
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



                                   3618 
                                   3619 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3620 ;       THEN        ( A -- )
                                   3621 ;       Terminate a conditional 
                                   3622 ;       branch structure.
                                   3623 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001605                       3624         _HEADER THENN,IMEDD+4,"THEN"
      009685 96 74                    1         .word LINK 
                           001607     2         LINK=.
      009687 84                       3         .byte IMEDD+4  
      009688 54 48 45 4E              4         .ascii "THEN"
      00968C                          5         THENN:
      00968C CD 8D 3E         [ 4] 3625         CALL     HERE
      00968F CD 88 44         [ 4] 3626         call ADRADJ 
      009692 CD 86 B1         [ 4] 3627         CALL     SWAPP
      009695 CC 85 51         [ 2] 3628         JP     STORE
                                   3629 
                                   3630 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3631 ;       ELSE        ( A -- A )
                                   3632 ;       Start the false clause in 
                                   3633 ;       an IF-ELSE-THEN structure.
                                   3634 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001618                       3635         _HEADER ELSEE,IMEDD+4,"ELSE"
      009698 96 87                    1         .word LINK 
                           00161A     2         LINK=.
      00969A 84                       3         .byte IMEDD+4  
      00969B 45 4C 53 45              4         .ascii "ELSE"
      00969F                          5         ELSEE:
      00969F CD 95 C7         [ 4] 3636         CALL     COMPI
      0096A2 85 34                 3637         .word BRAN
      0096A4 CD 8D 3E         [ 4] 3638         CALL     HERE
      0096A7 CD 8C 61         [ 4] 3639         CALL     ZERO
      0096AA CD 95 82         [ 4] 3640         CALL     COMMA
      0096AD CD 86 B1         [ 4] 3641         CALL     SWAPP
      0096B0 CD 8D 3E         [ 4] 3642         CALL     HERE
      0096B3 CD 88 44         [ 4] 3643         call ADRADJ 
      0096B6 CD 86 B1         [ 4] 3644         CALL     SWAPP
      0096B9 CC 85 51         [ 2] 3645         JP     STORE
                                   3646 
                                   3647 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3648 ;       AHEAD       ( -- A )
                                   3649 ;       Compile a forward branch
                                   3650 ;       instruction.
                                   3651 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00163C                       3652         _HEADER AHEAD,IMEDD+5,"AHEAD"
      0096BC 96 9A                    1         .word LINK 
                           00163E     2         LINK=.
      0096BE 85                       3         .byte IMEDD+5  
      0096BF 41 48 45 41 44           4         .ascii "AHEAD"
      0096C4                          5         AHEAD:
      0096C4 CD 95 C7         [ 4] 3653         CALL     COMPI
      0096C7 85 34                 3654         .word BRAN
      0096C9 CD 8D 3E         [ 4] 3655         CALL     HERE
      0096CC CD 8C 61         [ 4] 3656         CALL     ZERO
      0096CF CC 95 82         [ 2] 3657         JP     COMMA
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



                                   3658 
                                   3659 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3660 ;       WHILE       ( a -- A a )
                                   3661 ;       Conditional branch out of a 
                                   3662 ;       BEGIN-WHILE-REPEAT loop.
                                   3663 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001652                       3664         _HEADER WHILE,IMEDD+5,"WHILE"
      0096D2 96 BE                    1         .word LINK 
                           001654     2         LINK=.
      0096D4 85                       3         .byte IMEDD+5  
      0096D5 57 48 49 4C 45           4         .ascii "WHILE"
      0096DA                          5         WHILE:
      0096DA CD 95 C7         [ 4] 3665         CALL     COMPI
      0096DD 85 18                 3666         .word QBRAN
      0096DF CD 8D 3E         [ 4] 3667         CALL     HERE
      0096E2 CD 8C 61         [ 4] 3668         CALL     ZERO
      0096E5 CD 95 82         [ 4] 3669         CALL     COMMA
      0096E8 CC 86 B1         [ 2] 3670         JP     SWAPP
                                   3671 
                                   3672 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3673 ;       REPEAT      ( A a -- )
                                   3674 ;       Terminate a BEGIN-WHILE-REPEAT 
                                   3675 ;       indefinite loop.
                                   3676 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00166B                       3677         _HEADER REPEA,IMEDD+6,"REPEAT"
      0096EB 96 D4                    1         .word LINK 
                           00166D     2         LINK=.
      0096ED 86                       3         .byte IMEDD+6  
      0096EE 52 45 50 45 41 54        4         .ascii "REPEAT"
      0096F4                          5         REPEA:
      0096F4 CD 95 C7         [ 4] 3678         CALL     COMPI
      0096F7 85 34                 3679         .word BRAN
      0096F9 CD 88 44         [ 4] 3680         call ADRADJ 
      0096FC CD 95 82         [ 4] 3681         CALL     COMMA
      0096FF CD 8D 3E         [ 4] 3682         CALL     HERE
      009702 CD 88 44         [ 4] 3683         call ADRADJ 
      009705 CD 86 B1         [ 4] 3684         CALL     SWAPP
      009708 CC 85 51         [ 2] 3685         JP     STORE
                                   3686 
                                   3687 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3688 ;       AFT         ( a -- a A )
                                   3689 ;       Jump to THEN in a FOR-AFT-THEN-NEXT 
                                   3690 ;       loop the first time through.
                                   3691 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00168B                       3692         _HEADER AFT,IMEDD+3,"AFT"
      00970B 96 ED                    1         .word LINK 
                           00168D     2         LINK=.
      00970D 83                       3         .byte IMEDD+3  
      00970E 41 46 54                 4         .ascii "AFT"
      009711                          5         AFT:
      009711 CD 86 97         [ 4] 3693         CALL     DROP
      009714 CD 96 C4         [ 4] 3694         CALL     AHEAD
      009717 CD 8D 3E         [ 4] 3695         CALL     HERE
      00971A CC 86 B1         [ 2] 3696         JP     SWAPP
                                   3697 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



                                   3698 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3699 ;       ABORT"      ( -- ; <string> )
                                   3700 ;       Conditional abort with an error message.
                                   3701 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00169D                       3702         _HEADER ABRTQ,IMEDD+6,'ABORT"'
      00971D 97 0D                    1         .word LINK 
                           00169F     2         LINK=.
      00971F 86                       3         .byte IMEDD+6  
      009720 41 42 4F 52 54 22        4         .ascii 'ABORT"'
      009726                          5         ABRTQ:
      009726 CD 95 C7         [ 4] 3703         CALL     COMPI
      009729 94 44                 3704         .word ABORQ
      00972B CC 95 F1         [ 2] 3705         JP     STRCQ
                                   3706 
                                   3707 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3708 ;       $"     ( -- ; <string> )
                                   3709 ;       Compile an inline string literal.
                                   3710 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0016AE                       3711         _HEADER STRQ,IMEDD+2,'$"'
      00972E 97 1F                    1         .word LINK 
                           0016B0     2         LINK=.
      009730 82                       3         .byte IMEDD+2  
      009731 24 22                    4         .ascii '$"'
      009733                          5         STRQ:
      009733 CD 95 C7         [ 4] 3712         CALL     COMPI
      009736 90 02                 3713         .word STRQP 
      009738 CC 95 F1         [ 2] 3714         JP     STRCQ
                                   3715 
                                   3716 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3717 ;       ."          ( -- ; <string> )
                                   3718 ;       Compile an inline string literal 
                                   3719 ;       to be typed out at run time.
                                   3720 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0016BB                       3721         _HEADER DOTQ,IMEDD+2,'."'
      00973B 97 30                    1         .word LINK 
                           0016BD     2         LINK=.
      00973D 82                       3         .byte IMEDD+2  
      00973E 2E 22                    4         .ascii '."'
      009740                          5         DOTQ:
      009740 CD 95 C7         [ 4] 3722         CALL     COMPI
      009743 90 06                 3723         .word DOTQP 
      009745 CC 95 F1         [ 2] 3724         JP     STRCQ
                                   3725 
                                   3726 ;; Name compiler
                                   3727 
                                   3728 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3729 ;       ?UNIQUE ( a -- a )
                                   3730 ;       Display a warning message
                                   3731 ;       if word already exists.
                                   3732 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0016C8                       3733         _HEADER UNIQU,7,"?UNIQUE"
      009748 97 3D                    1         .word LINK 
                           0016CA     2         LINK=.
      00974A 07                       3         .byte 7  
      00974B 3F 55 4E 49 51 55 45     4         .ascii "?UNIQUE"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



      009752                          5         UNIQU:
      009752 CD 86 A1         [ 4] 3734         CALL     DUPP
      009755 CD 93 38         [ 4] 3735         CALL     NAMEQ   ;?name exists
      009758 CD 85 18         [ 4] 3736         CALL     QBRAN
      00975B 97 71                 3737         .word      UNIQ1
      00975D CD 90 06         [ 4] 3738         CALL     DOTQP   ;redef are OK
      009760 07                    3739         .byte       7
      009761 20 72 65 44 65 66 20  3740         .ascii     " reDef "       
      009768 CD 86 C9         [ 4] 3741         CALL     OVER
      00976B CD 8D 27         [ 4] 3742         CALL     COUNT
      00976E CD 8F C1         [ 4] 3743         CALL     TYPES   ;just in case
      009771 CC 86 97         [ 2] 3744 UNIQ1:  JP     DROP
                                   3745 
                                   3746 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3747 ;       $,n     ( na -- )
                                   3748 ;       Build a new dictionary name
                                   3749 ;       using string at na.
                                   3750 ; compile dans l'espace des variables 
                                   3751 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3752 ;        _HEADER SNAME,3,^/"$,n"/
      009774                       3753 SNAME: 
      009774 CD 86 A1         [ 4] 3754         CALL     DUPP
      009777 CD 85 81         [ 4] 3755         CALL     CAT     ;?null input
      00977A CD 85 18         [ 4] 3756         CALL     QBRAN
      00977D 97 AA                 3757         .word      PNAM1
      00977F CD 97 52         [ 4] 3758         CALL     UNIQU   ;?redefinition
      009782 CD 86 A1         [ 4] 3759         CALL     DUPP
      009785 CD 8D 27         [ 4] 3760         CALL     COUNT
      009788 CD 88 C6         [ 4] 3761         CALL     PLUS
      00978B CD 87 F8         [ 4] 3762         CALL     VPP
      00978E CD 85 51         [ 4] 3763         CALL     STORE
      009791 CD 86 A1         [ 4] 3764         CALL     DUPP
      009794 CD 88 16         [ 4] 3765         CALL     LAST
      009797 CD 85 51         [ 4] 3766         CALL     STORE   ;save na for vocabulary link
      00979A CD 8B D9         [ 4] 3767         CALL     CELLM   ;link address
      00979D CD 87 EA         [ 4] 3768         CALL     CNTXT
      0097A0 CD 85 63         [ 4] 3769         CALL     AT
      0097A3 CD 86 B1         [ 4] 3770         CALL     SWAPP
      0097A6 CD 85 51         [ 4] 3771         CALL     STORE
      0097A9 81               [ 4] 3772         RET     ;save code pointer
      0097AA CD 90 02         [ 4] 3773 PNAM1:  CALL     STRQP
      0097AD 05                    3774         .byte      5
      0097AE 20 6E 61 6D 65        3775         .ascii     " name" ;null input
      0097B3 CC 94 4C         [ 2] 3776         JP     ABOR1
                                   3777 
                                   3778 ;; FORTH compiler
                                   3779 
                                   3780 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3781 ;       $COMPILE        ( a -- )
                                   3782 ;       Compile next word to
                                   3783 ;       dictionary as a token or literal.
                                   3784 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001736                       3785         _HEADER SCOMP,8,"$COMPILE"
      0097B6 97 4A                    1         .word LINK 
                           001738     2         LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



      0097B8 08                       3         .byte 8  
      0097B9 24 43 4F 4D 50 49 4C     4         .ascii "$COMPILE"
             45
      0097C1                          5         SCOMP:
      0097C1 CD 93 38         [ 4] 3786         CALL     NAMEQ
      0097C4 CD 88 54         [ 4] 3787         CALL     QDUP    ;?defined
      0097C7 CD 85 18         [ 4] 3788         CALL     QBRAN
      0097CA 97 E2                 3789         .word      SCOM2
      0097CC CD 85 63         [ 4] 3790         CALL     AT
      0097CF CD 84 EF         [ 4] 3791         CALL     DOLIT
      0097D2 80 00                 3792         .word     0x8000	;  IMEDD*256
      0097D4 CD 86 FE         [ 4] 3793         CALL     ANDD    ;?immediate
      0097D7 CD 85 18         [ 4] 3794         CALL     QBRAN
      0097DA 97 DF                 3795         .word      SCOM1
      0097DC CC 85 44         [ 2] 3796         JP     EXECU
      0097DF CC 98 8C         [ 2] 3797 SCOM1:  JP     JSRC
      0097E2 CD A5 40         [ 4] 3798 SCOM2:  CALL     NUMBQ   ;try to convert to number
      0097E5 CD 88 54         [ 4] 3799         CALL    QDUP  
      0097E8 CD 85 18         [ 4] 3800         CALL     QBRAN
      0097EB 94 4C                 3801         .word      ABOR1
      00176D                       3802         _DOLIT  -1
      0097ED CD 84 EF         [ 4]    1     CALL DOLIT 
      0097F0 FF FF                    2     .word -1 
      0097F2 CD 89 78         [ 4] 3803         CALL    EQUAL
      001775                       3804         _QBRAN DLITER  
      0097F5 CD 85 18         [ 4]    1     CALL QBRAN
      0097F8 A9 16                    2     .word DLITER
      0097FA CC 95 E9         [ 2] 3805         JP     LITER
                                   3806 
                                   3807 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3808 ;       OVERT   ( -- )
                                   3809 ;       Link a new word into vocabulary.
                                   3810 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00177D                       3811         _HEADER OVERT,5,"OVERT"
      0097FD 97 B8                    1         .word LINK 
                           00177F     2         LINK=.
      0097FF 05                       3         .byte 5  
      009800 4F 56 45 52 54           4         .ascii "OVERT"
      009805                          5         OVERT:
      009805 CD 88 16         [ 4] 3812         CALL     LAST
      009808 CD 85 63         [ 4] 3813         CALL     AT
      00980B CD 87 EA         [ 4] 3814         CALL     CNTXT
      00980E CC 85 51         [ 2] 3815         JP     STORE
                                   3816 
                                   3817 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3818 ;       ;       ( -- )
                                   3819 ;       Terminate a colon definition.
                                   3820 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001791                       3821         _HEADER SEMIS,IMEDD+COMPO+1,^/";"/
      009811 97 FF                    1         .word LINK 
                           001793     2         LINK=.
      009813 C1                       3         .byte IMEDD+COMPO+1  
      009814 3B                       4         .ascii ";"
      009815                          5         SEMIS:
                           000001  3822 .if OPTIMIZE ; more compact and faster
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



      009815 CD 84 EF         [ 4] 3823         call DOLIT 
      009818 00 81                 3824         .word 0x81   ; opcode for RET 
      00981A CD 95 99         [ 4] 3825         call CCOMMA 
                           000000  3826 .else
                                   3827         CALL     COMPI
                                   3828         .word EXIT 
                                   3829 .endif 
      00981D CD 94 AD         [ 4] 3830         CALL     LBRAC
      009820 CD 98 05         [ 4] 3831         call OVERT 
      009823 CD A2 15         [ 4] 3832         CALL FMOVE
      009826 CD 88 54         [ 4] 3833         call QDUP 
      009829 CD 85 18         [ 4] 3834         call QBRAN 
      00982C 99 5C                 3835         .word SET_RAMLAST 
      00982E CD A2 A9         [ 4] 3836         CALL UPDATPTR
      009831 81               [ 4] 3837         RET 
                                   3838 
                                   3839 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3840 ;       Terminate an ISR definition 
                                   3841 ;       retourn ca of ISR as double
                                   3842 ;       I; ( -- ud )
                                   3843 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0017B2                       3844        _HEADER ISEMI,2+IMEDD+COMPO,^/"I;"/
      009832 98 13                    1         .word LINK 
                           0017B4     2         LINK=.
      009834 C2                       3         .byte 2+IMEDD+COMPO  
      009835 49 3B                    4         .ascii "I;"
      009837                          5         ISEMI:
      009837 1D 00 02         [ 2] 3845         subw x,#CELLL  
      00983A 90 AE 00 80      [ 2] 3846         ldw y,#IRET_CODE 
      00983E FF               [ 2] 3847         ldw (x),y 
      00983F CD 95 99         [ 4] 3848         call CCOMMA
      009842 CD 94 AD         [ 4] 3849         call LBRAC 
      009845 CD A2 EE         [ 4] 3850         call IFMOVE
      009848 CD 88 54         [ 4] 3851         call QDUP 
      00984B CD 85 18         [ 4] 3852         CALL QBRAN 
      00984E 99 5C                 3853         .word SET_RAMLAST
      009850 CD 88 06         [ 4] 3854         CALL CPP
      009853 CD 85 63         [ 4] 3855         call AT 
      009856 CD 86 B1         [ 4] 3856         call SWAPP 
      009859 CD 88 06         [ 4] 3857         CALL CPP 
      00985C CD 85 51         [ 4] 3858         call STORE 
      00985F CD 9C A6         [ 4] 3859         call UPDATCP 
      009862 CD 9C 63         [ 4] 3860         call EEPVP 
      009865 CD 86 97         [ 4] 3861         call DROP 
      009868 CD 85 63         [ 4] 3862         call AT 
      00986B CD 87 F8         [ 4] 3863         call VPP 
      00986E CD 85 51         [ 4] 3864         call STORE 
      009871 CC 8C 61         [ 2] 3865         jp ZERO
      009874 81               [ 4] 3866         ret           
                                   3867         
                                   3868 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3869 ;       ]       ( -- )
                                   3870 ;       Start compiling words in
                                   3871 ;       input stream.
                                   3872 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



      0017F5                       3873         _HEADER RBRAC,1,"]"
      009875 98 34                    1         .word LINK 
                           0017F7     2         LINK=.
      009877 01                       3         .byte 1  
      009878 5D                       4         .ascii "]"
      009879                          5         RBRAC:
      009879 CD 84 EF         [ 4] 3874         CALL   DOLIT
      00987C 97 C1                 3875         .word  SCOMP
      00987E CD 87 C8         [ 4] 3876         CALL   TEVAL
      009881 CC 85 51         [ 2] 3877         JP     STORE
                                   3878 
                                   3879 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3880 ;       CALL,    ( ca -- )
                                   3881 ;       Compile a subroutine call.
                                   3882 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001804                       3883         _HEADER JSRC,5,^/"CALL,"/
      009884 98 77                    1         .word LINK 
                           001806     2         LINK=.
      009886 05                       3         .byte 5  
      009887 43 41 4C 4C 2C           4         .ascii "CALL,"
      00988C                          5         JSRC:
      00988C CD 84 EF         [ 4] 3884         CALL     DOLIT
      00988F 00 CD                 3885         .word     CALLL     ;CALL
      009891 CD 95 99         [ 4] 3886         CALL     CCOMMA
      009894 CC 95 82         [ 2] 3887         JP     COMMA
                                   3888 
                                   3889 ;       INIT-OFS ( -- )
                                   3890 ;       compute offset to adjust jump address 
                                   3891 ;       set variable OFFSET 
      009897 98 86                 3892         .word LINK 
                           001819  3893         LINK=.
      009899 08                    3894         .byte 8 
      00989A 49 4E 49 54 2D 4F 46  3895         .ascii "INIT-OFS" 
             53
      0098A2                       3896 INITOFS:
      0098A2 CD 87 B7         [ 4] 3897         call TFLASH 
      0098A5 CD 85 63         [ 4] 3898         CALL AT 
      0098A8 CD 86 A1         [ 4] 3899         CALL DUPP 
      0098AB CD 85 18         [ 4] 3900         call QBRAN
      0098AE 98 BF                 3901         .word 1$
      0098B0 CD 86 97         [ 4] 3902         call DROP  
      0098B3 CD 88 06         [ 4] 3903         call CPP 
      0098B6 CD 85 63         [ 4] 3904         call AT 
      0098B9 CD 8D 3E         [ 4] 3905         call HERE
      0098BC CD 89 50         [ 4] 3906         call SUBB 
      0098BF CD 88 3B         [ 4] 3907 1$:     call OFFSET 
      0098C2 CC 85 51         [ 2] 3908         jp STORE  
                                   3909 
                                   3910 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3911 ;       :       ( -- ; <string> )
                                   3912 ;       Start a new colon definition
                                   3913 ;       using next word as its name.
                                   3914 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001845                       3915         _HEADER COLON,1,":"
      0098C5 98 99                    1         .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



                           001847     2         LINK=.
      0098C7 01                       3         .byte 1  
      0098C8 3A                       4         .ascii ":"
      0098C9                          5         COLON:
      0098C9 CD 98 A2         [ 4] 3916         call INITOFS       
      0098CC CD 92 3B         [ 4] 3917         CALL   TOKEN
      0098CF CD 97 74         [ 4] 3918         CALL   SNAME
      0098D2 CC 98 79         [ 2] 3919         JP     RBRAC
                                   3920 
                                   3921 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3922 ;       I:  ( -- )
                                   3923 ;       Start interrupt service 
                                   3924 ;       routine definition
                                   3925 ;       those definition have 
                                   3926 ;       no name.
                                   3927 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001855                       3928         _HEADER ICOLON,2,"I:"
      0098D5 98 C7                    1         .word LINK 
                           001857     2         LINK=.
      0098D7 02                       3         .byte 2  
      0098D8 49 3A                    4         .ascii "I:"
      0098DA                          5         ICOLON:
      0098DA CD 98 A2         [ 4] 3929         call INITOFS 
      0098DD CC 98 79         [ 2] 3930         jp RBRAC  
                                   3931 
                                   3932 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3933 ;       IMMEDIATE       ( -- )
                                   3934 ;       Make last compiled word
                                   3935 ;       an immediate word.
                                   3936 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001860                       3937         _HEADER IMMED,9,"IMMEDIATE"
      0098E0 98 D7                    1         .word LINK 
                           001862     2         LINK=.
      0098E2 09                       3         .byte 9  
      0098E3 49 4D 4D 45 44 49 41     4         .ascii "IMMEDIATE"
             54 45
      0098EC                          5         IMMED:
      0098EC CD 84 EF         [ 4] 3938         CALL     DOLIT
      0098EF 80 00                 3939         .word     0x8000	;  IMEDD*256
      0098F1 CD 88 16         [ 4] 3940         CALL     LAST
      0098F4 CD 85 63         [ 4] 3941         CALL     AT
      0098F7 CD 85 63         [ 4] 3942         CALL     AT
      0098FA CD 87 12         [ 4] 3943         CALL     ORR
      0098FD CD 88 16         [ 4] 3944         CALL     LAST
      009900 CD 85 63         [ 4] 3945         CALL     AT
      009903 CC 85 51         [ 2] 3946         JP     STORE
                                   3947 
                                   3948 ;; Defining words
                                   3949 
                                   3950 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3951 ;       CREATE  ( -- ; <string> )
                                   3952 ;       Compile a new array
                                   3953 ;       without allocating space.
                                   3954 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001886                       3955         _HEADER CREAT,6,"CREATE"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



      009906 98 E2                    1         .word LINK 
                           001888     2         LINK=.
      009908 06                       3         .byte 6  
      009909 43 52 45 41 54 45        4         .ascii "CREATE"
      00990F                          5         CREAT:
      00990F CD 92 3B         [ 4] 3956         CALL     TOKEN
      009912 CD 97 74         [ 4] 3957         CALL     SNAME
      009915 CD 98 05         [ 4] 3958         CALL     OVERT        
      009918 CD 95 C7         [ 4] 3959         CALL     COMPI 
      00991B 87 57                 3960         .word DOVAR 
      00991D 81               [ 4] 3961         RET
                                   3962 
                                   3963 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3964 ;       VARIABLE  ( -- ; <string> )
                                   3965 ;       Compile a new variable
                                   3966 ;       initialized to 0.
                                   3967 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00189E                       3968         _HEADER VARIA,8,"VARIABLE"
      00991E 99 08                    1         .word LINK 
                           0018A0     2         LINK=.
      009920 08                       3         .byte 8  
      009921 56 41 52 49 41 42 4C     4         .ascii "VARIABLE"
             45
      009929                          5         VARIA:
                                   3969 ; indirect variable so that VARIABLE definition can be compiled in FLASH 
      009929 CD 8D 3E         [ 4] 3970         CALL HERE
      00992C CD 86 A1         [ 4] 3971         CALL DUPP 
      00992F CD 8B CA         [ 4] 3972         CALL CELLP
      009932 CD 87 F8         [ 4] 3973         CALL VPP 
      009935 CD 85 51         [ 4] 3974         CALL STORE
      009938 CD 99 0F         [ 4] 3975         CALL CREAT
      00993B CD 86 A1         [ 4] 3976         CALL DUPP
      00993E CD 95 82         [ 4] 3977         CALL COMMA
      009941 CD 8C 61         [ 4] 3978         CALL ZERO
      009944 CD 86 B1         [ 4] 3979         call SWAPP 
      009947 CD 85 51         [ 4] 3980         CALL STORE
      00994A CD A2 15         [ 4] 3981         CALL FMOVE ; move definition to FLASH
      00994D CD 88 54         [ 4] 3982         CALL QDUP 
      009950 CD 85 18         [ 4] 3983         CALL QBRAN 
      009953 99 5C                 3984         .word SET_RAMLAST   
      009955 CD 9C BD         [ 4] 3985         call UPDATVP  ; don't update if variable kept in RAM.
      009958 CD A2 A9         [ 4] 3986         CALL UPDATPTR
      00995B 81               [ 4] 3987         RET         
      00995C                       3988 SET_RAMLAST: 
      00995C CD 88 16         [ 4] 3989         CALL LAST 
      00995F CD 85 63         [ 4] 3990         CALL AT 
      009962 CD 88 29         [ 4] 3991         CALL RAMLAST 
      009965 CC 85 51         [ 2] 3992         jp STORE  
                                   3993 
                                   3994 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3995 ;       CONSTANT  ( n -- ; <string> )
                                   3996 ;       Compile a new constant 
                                   3997 ;       n CONSTANT name 
                                   3998 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0018E8                       3999         _HEADER CONSTANT,8,"CONSTANT"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



      009968 99 20                    1         .word LINK 
                           0018EA     2         LINK=.
      00996A 08                       3         .byte 8  
      00996B 43 4F 4E 53 54 41 4E     4         .ascii "CONSTANT"
             54
      009973                          5         CONSTANT:
      009973 CD 92 3B         [ 4] 4000         CALL TOKEN
      009976 CD 97 74         [ 4] 4001         CALL SNAME 
      009979 CD 98 05         [ 4] 4002         CALL OVERT 
      00997C CD 95 C7         [ 4] 4003         CALL COMPI 
      00997F 99 93                 4004         .word DOCONST
      009981 CD 95 82         [ 4] 4005         CALL COMMA 
      009984 CD A2 15         [ 4] 4006         CALL FMOVE
      009987 CD 88 54         [ 4] 4007         CALL QDUP 
      00998A CD 85 18         [ 4] 4008         CALL QBRAN 
      00998D 99 5C                 4009         .word SET_RAMLAST  
      00998F CD A2 A9         [ 4] 4010         CALL UPDATPTR  
      009992 81               [ 4] 4011 1$:     RET          
                                   4012 
                                   4013 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4014 ; CONSTANT runtime semantic 
                                   4015 ; doCONST  ( -- n )
                                   4016 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4017 ;       _HEADER DOCONST,7,"DOCONST"
      009993                       4018 DOCONST:
      009993 1D 00 02         [ 2] 4019         subw x,#CELLL
      009996 90 85            [ 2] 4020         popw y 
      009998 90 FE            [ 2] 4021         ldw y,(y) 
      00999A FF               [ 2] 4022         ldw (x),y 
      00999B 81               [ 4] 4023         ret 
                                   4024 
                                   4025 ;----------------------------------
                                   4026 ; create double constant 
                                   4027 ; 2CONSTANT ( d -- ; <string> )
                                   4028 ;----------------------------------
      00191C                       4029         _HEADER DCONST,9,"2CONSTANT"
      00999C 99 6A                    1         .word LINK 
                           00191E     2         LINK=.
      00999E 09                       3         .byte 9  
      00999F 32 43 4F 4E 53 54 41     4         .ascii "2CONSTANT"
             4E 54
      0099A8                          5         DCONST:
      0099A8 CD 92 3B         [ 4] 4030         CALL TOKEN
      0099AB CD 97 74         [ 4] 4031         CALL SNAME 
      0099AE CD 98 05         [ 4] 4032         CALL OVERT 
      0099B1 CD 95 C7         [ 4] 4033         CALL COMPI 
      0099B4 99 CB                 4034         .word DO_DCONST
      0099B6 CD 95 82         [ 4] 4035         CALL COMMA
      0099B9 CD 95 82         [ 4] 4036         CALL COMMA  
      0099BC CD A2 15         [ 4] 4037         CALL FMOVE
      0099BF CD 88 54         [ 4] 4038         CALL QDUP 
      0099C2 CD 85 18         [ 4] 4039         CALL QBRAN 
      0099C5 99 5C                 4040         .word SET_RAMLAST  
      0099C7 CD A2 A9         [ 4] 4041         CALL UPDATPTR  
      0099CA 81               [ 4] 4042 1$:     RET          
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



                                   4043     
                                   4044 ;----------------------------------
                                   4045 ; runtime for DCONST 
                                   4046 ; stack double constant 
                                   4047 ; DO-DCONST ( -- d )
                                   4048 ;-----------------------------------
                                   4049 ;       _HEADER DO_DCONST,9,"DO-DCONST"
      0099CB                       4050 DO_DCONST:
      0099CB 90 85            [ 2] 4051     popw y 
      0099CD 90 BF 26         [ 2] 4052     ldw YTEMP,y 
      0099D0 1D 00 04         [ 2] 4053     subw x,#2*CELLL 
      0099D3 90 FE            [ 2] 4054     ldw y,(y)
      0099D5 FF               [ 2] 4055     ldw (x),y 
      0099D6 90 BE 26         [ 2] 4056     ldw y,YTEMP 
      0099D9 90 EE 02         [ 2] 4057     ldw y,(2,y)
      0099DC EF 02            [ 2] 4058     ldw (2,x),y 
      0099DE 81               [ 4] 4059     ret 
                                   4060 
                                   4061 ;; Tools
                                   4062 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4063 ;       _TYPE   ( b u -- )
                                   4064 ;       Display a string. Filter
                                   4065 ;       non-printing characters.
                                   4066 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00195F                       4067         _HEADER UTYPE,5,"_TYPE"
      0099DF 99 9E                    1         .word LINK 
                           001961     2         LINK=.
      0099E1 05                       3         .byte 5  
      0099E2 5F 54 59 50 45           4         .ascii "_TYPE"
      0099E7                          5         UTYPE:
      0099E7 CD 86 6A         [ 4] 4068         CALL     TOR     ;start count down loop
      0099EA 20 0F            [ 2] 4069         JRA     UTYP2   ;skip first pass
      0099EC CD 86 A1         [ 4] 4070 UTYP1:  CALL     DUPP
      0099EF CD 85 81         [ 4] 4071         CALL     CAT
      0099F2 CD 8C 8B         [ 4] 4072         CALL     TCHAR
      0099F5 CD 84 B6         [ 4] 4073         CALL     EMIT    ;display only printable
      0099F8 CD 8B F5         [ 4] 4074         CALL     ONEP    ;increment address
      0099FB CD 85 03         [ 4] 4075 UTYP2:  CALL     DONXT
      0099FE 99 EC                 4076         .word      UTYP1   ;loop till done
      009A00 CC 86 97         [ 2] 4077         JP     DROP
                                   4078 
                                   4079 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4080 ;       dm+     ( a u -- a )
                                   4081 ;       Dump u bytes from ,
                                   4082 ;       leaving a+u on  stack.
                                   4083 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001983                       4084         _HEADER DUMPP,3,"DM+"
      009A03 99 E1                    1         .word LINK 
                           001985     2         LINK=.
      009A05 03                       3         .byte 3  
      009A06 44 4D 2B                 4         .ascii "DM+"
      009A09                          5         DUMPP:
      009A09 CD 86 C9         [ 4] 4085         CALL     OVER
      009A0C CD 84 EF         [ 4] 4086         CALL     DOLIT
      009A0F 00 04                 4087         .word      4
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



      009A11 CD 90 2F         [ 4] 4088         CALL     UDOTR   ;display address
      009A14 CD 8F 97         [ 4] 4089         CALL     SPACE
      009A17 CD 86 6A         [ 4] 4090         CALL     TOR     ;start count down loop
      009A1A 20 11            [ 2] 4091         JRA     PDUM2   ;skip first pass
      009A1C CD 86 A1         [ 4] 4092 PDUM1:  CALL     DUPP
      009A1F CD 85 81         [ 4] 4093         CALL     CAT
      009A22 CD 84 EF         [ 4] 4094         CALL     DOLIT
      009A25 00 03                 4095         .word      3
      009A27 CD 90 2F         [ 4] 4096         CALL     UDOTR   ;display numeric data
      009A2A CD 8B F5         [ 4] 4097         CALL     ONEP    ;increment address
      009A2D CD 85 03         [ 4] 4098 PDUM2:  CALL     DONXT
      009A30 9A 1C                 4099         .word      PDUM1   ;loop till done
      009A32 81               [ 4] 4100         RET
                                   4101 
                                   4102 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4103 ;       DUMP    ( a u -- )
                                   4104 ;       Dump u bytes from a,
                                   4105 ;       in a formatted manner.
                                   4106 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0019B3                       4107         _HEADER DUMP,4,"DUMP"
      009A33 9A 05                    1         .word LINK 
                           0019B5     2         LINK=.
      009A35 04                       3         .byte 4  
      009A36 44 55 4D 50              4         .ascii "DUMP"
      009A3A                          5         DUMP:
      009A3A CD 87 67         [ 4] 4108         CALL     BASE
      009A3D CD 85 63         [ 4] 4109         CALL     AT
      009A40 CD 86 6A         [ 4] 4110         CALL     TOR
      009A43 CD 8E F6         [ 4] 4111         CALL     HEX     ;save radix, set hex
      009A46 CD 84 EF         [ 4] 4112         CALL     DOLIT
      009A49 00 10                 4113         .word      16
      009A4B CD 8B 1B         [ 4] 4114         CALL     SLASH   ;change count to lines
      009A4E CD 86 6A         [ 4] 4115         CALL     TOR     ;start count down loop
      009A51 CD 8F D9         [ 4] 4116 DUMP1:  CALL     CR
      009A54 CD 84 EF         [ 4] 4117         CALL     DOLIT
      009A57 00 10                 4118         .word      16
      009A59 CD 88 B1         [ 4] 4119         CALL     DDUP
      009A5C CD 9A 09         [ 4] 4120         CALL     DUMPP   ;display numeric
      009A5F CD 88 65         [ 4] 4121         CALL     ROT
      009A62 CD 88 65         [ 4] 4122         CALL     ROT
      009A65 CD 8F 97         [ 4] 4123         CALL     SPACE
      009A68 CD 8F 97         [ 4] 4124         CALL     SPACE
      009A6B CD 99 E7         [ 4] 4125         CALL     UTYPE   ;display printable characters
      009A6E CD 85 03         [ 4] 4126         CALL     DONXT
      009A71 9A 51                 4127         .word      DUMP1   ;loop till done
      009A73 CD 86 97         [ 4] 4128 DUMP3:  CALL     DROP
      009A76 CD 85 B4         [ 4] 4129         CALL     RFROM
      009A79 CD 87 67         [ 4] 4130         CALL     BASE
      009A7C CC 85 51         [ 2] 4131         JP     STORE   ;restore radix
                                   4132 
                                   4133 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4134 ;       .S      ( ... -- ... )
                                   4135 ;        Display  contents of stack.
                                   4136 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0019FF                       4137         _HEADER DOTS,2,".S"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



      009A7F 9A 35                    1         .word LINK 
                           001A01     2         LINK=.
      009A81 02                       3         .byte 2  
      009A82 2E 53                    4         .ascii ".S"
      009A84                          5         DOTS:
      009A84 CD 8F D9         [ 4] 4138         CALL     CR
      009A87 CD 8C A3         [ 4] 4139         CALL     DEPTH   ;stack depth
      009A8A CD 86 6A         [ 4] 4140         CALL     TOR     ;start count down loop
      009A8D 20 09            [ 2] 4141         JRA     DOTS2   ;skip first pass
      009A8F CD 85 C5         [ 4] 4142 DOTS1:  CALL     RAT
      009A92 CD 8C BA         [ 4] 4143 	CALL     PICK
      009A95 CD 90 80         [ 4] 4144         CALL     DOT     ;index stack, display contents
      009A98 CD 85 03         [ 4] 4145 DOTS2:  CALL     DONXT
      009A9B 9A 8F                 4146         .word      DOTS1   ;loop till done
      009A9D CD 90 06         [ 4] 4147         CALL     DOTQP
      009AA0 05                    4148         .byte      5
      009AA1 20 3C 73 70 20        4149         .ascii     " <sp "
      009AA6 81               [ 4] 4150         RET
                                   4151 
                                   4152 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4153 ;       >NAME   ( ca -- na | F )
                                   4154 ;       Convert code address
                                   4155 ;       to a name address.
                                   4156 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001A27                       4157         _HEADER TNAME,5,">NAME"
      009AA7 9A 81                    1         .word LINK 
                           001A29     2         LINK=.
      009AA9 05                       3         .byte 5  
      009AAA 3E 4E 41 4D 45           4         .ascii ">NAME"
      009AAF                          5         TNAME:
      009AAF CD 87 EA         [ 4] 4158         CALL     CNTXT   ;vocabulary link
      009AB2 CD 85 63         [ 4] 4159 TNAM2:  CALL     AT
      009AB5 CD 86 A1         [ 4] 4160         CALL     DUPP    ;?last word in a vocabulary
      009AB8 CD 85 18         [ 4] 4161         CALL     QBRAN
      009ABB 9A D6                 4162         .word      TNAM4
      009ABD CD 88 B1         [ 4] 4163         CALL     DDUP
      009AC0 CD 92 49         [ 4] 4164         CALL     NAMET
      009AC3 CD 87 27         [ 4] 4165         CALL     XORR    ;compare
      009AC6 CD 85 18         [ 4] 4166         CALL     QBRAN
      009AC9 9A D0                 4167         .word      TNAM3
      009ACB CD 8B D9         [ 4] 4168         CALL     CELLM   ;continue with next word
      009ACE 20 E2            [ 2] 4169         JRA     TNAM2
      009AD0 CD 86 B1         [ 4] 4170 TNAM3:  CALL     SWAPP
      009AD3 CC 86 97         [ 2] 4171         JP     DROP
      009AD6 CD 88 A6         [ 4] 4172 TNAM4:  CALL     DDROP
      009AD9 CC 8C 61         [ 2] 4173         JP     ZERO
                                   4174 
                                   4175 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4176 ;       .ID     ( na -- )
                                   4177 ;        Display  name at address.
                                   4178 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001A5C                       4179         _HEADER DOTID,3,".ID"
      009ADC 9A A9                    1         .word LINK 
                           001A5E     2         LINK=.
      009ADE 03                       3         .byte 3  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



      009ADF 2E 49 44                 4         .ascii ".ID"
      009AE2                          5         DOTID:
      009AE2 CD 88 54         [ 4] 4180         CALL     QDUP    ;if zero no name
      009AE5 CD 85 18         [ 4] 4181         CALL     QBRAN
      009AE8 9A F8                 4182         .word      DOTI1
      009AEA CD 8D 27         [ 4] 4183         CALL     COUNT
      009AED CD 84 EF         [ 4] 4184         CALL     DOLIT
      009AF0 00 1F                 4185         .word      0x1F
      009AF2 CD 86 FE         [ 4] 4186         CALL     ANDD    ;mask lexicon bits
      009AF5 CC 99 E7         [ 2] 4187         JP     UTYPE
      009AF8 CD 90 06         [ 4] 4188 DOTI1:  CALL     DOTQP
      009AFB 09                    4189         .byte      9
      009AFC 20 6E 6F 4E 61 6D 65  4190         .ascii     " noName"
      009B03 81               [ 4] 4191         RET
                                   4192 
                           000000  4193 WANT_SEE=0
                           000000  4194 .if WANT_SEE 
                                   4195 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4196 ;       SEE     ( -- ; <string> )
                                   4197 ;       A simple decompiler.
                                   4198 ;       Updated for byte machines.
                                   4199 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4200         _HEADER SEE,3,"SEE"
                                   4201         CALL     TICK    ;starting address
                                   4202         CALL     CR
                                   4203         CALL     ONEM
                                   4204 SEE1:   CALL     ONEP
                                   4205         CALL     DUPP
                                   4206         CALL     AT
                                   4207         CALL     DUPP
                                   4208         CALL     QBRAN
                                   4209         .word    SEE2
                                   4210         CALL     TNAME   ;?is it a name
                                   4211 SEE2:   CALL     QDUP    ;name address or zero
                                   4212         CALL     QBRAN
                                   4213         .word    SEE3
                                   4214         CALL     SPACE
                                   4215         CALL     DOTID   ;display name
                                   4216         CALL     ONEP
                                   4217         JRA      SEE4
                                   4218 SEE3:   CALL     DUPP
                                   4219         CALL     CAT
                                   4220         CALL     UDOT    ;display number
                                   4221 SEE4:   CALL     NUFQ    ;user control
                                   4222         CALL     QBRAN
                                   4223         .word    SEE1
                                   4224         JP     DROP
                                   4225 .endif ; WANT_SEE 
                                   4226 
                                   4227 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4228 ;       WORDS   ( -- )
                                   4229 ;       Display names in vocabulary.
                                   4230 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001A84                       4231         _HEADER WORDS,5,"WORDS"
      009B04 9A DE                    1         .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



                           001A86     2         LINK=.
      009B06 05                       3         .byte 5  
      009B07 57 4F 52 44 53           4         .ascii "WORDS"
      009B0C                          5         WORDS:
      009B0C CD 8F D9         [ 4] 4232         CALL     CR
      009B0F CD 87 EA         [ 4] 4233         CALL     CNTXT   ;only in context
      009B12 CD 85 63         [ 4] 4234 WORS1:  CALL     AT
      009B15 CD 88 54         [ 4] 4235         CALL     QDUP    ;?at end of list
      009B18 CD 85 18         [ 4] 4236         CALL     QBRAN
      009B1B 9B 2E                 4237         .word      WORS2
      009B1D CD 86 A1         [ 4] 4238         CALL     DUPP
      009B20 CD 8F 97         [ 4] 4239         CALL     SPACE
      009B23 CD 9A E2         [ 4] 4240         CALL     DOTID   ;display a name
      009B26 CD 8B D9         [ 4] 4241         CALL     CELLM
      009B29 CD 85 34         [ 4] 4242         CALL     BRAN
      009B2C 9B 12                 4243         .word      WORS1
      009B2E 81               [ 4] 4244 WORS2:  RET
                                   4245 
                                   4246         
                                   4247 ;; Hardware reset
                                   4248 
                                   4249 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4250 ;       hi      ( -- )
                                   4251 ;       Display sign-on message.
                                   4252 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001AAF                       4253         _HEADER HI,2,"HI"
      009B2F 9B 06                    1         .word LINK 
                           001AB1     2         LINK=.
      009B31 02                       3         .byte 2  
      009B32 48 49                    4         .ascii "HI"
      009B34                          5         HI:
      009B34 CD 8F D9         [ 4] 4254         CALL     CR
      009B37 CD 90 06         [ 4] 4255         CALL     DOTQP   ;initialize I/O
      009B3A 0F                    4256         .byte      15
      009B3B 73 74 6D 38 65 46 6F  4257         .ascii     "stm8eForth v"
             72 74 68 20 76
      009B47 34                    4258 	.byte      VER+'0'
      009B48 2E                    4259         .byte      '.' 
      009B49 30                    4260 	.byte      EXT+'0' ;version
      009B4A CD 90 06         [ 4] 4261         CALL    DOTQP
                           000001  4262 .if NUCLEO          
      009B4D 12                    4263         .byte 18
      009B4E 20 6F 6E 20 4E 55 43  4264         .ascii  " on NUCLEO-8S208RB"
             4C 45 4F 2D 38 53 32
             30 38 52 42
                                   4265 .endif
                           000000  4266 .if DISCOVERY
                                   4267         .byte 19
                                   4268         .ascii  " on STM8S-DISCOVERY"
                                   4269 .endif
                           000000  4270 .if DOORBELL
                                   4271         .byte 16
                                   4272         .ascii " on stm8s105k6b6"
                                   4273 .endif
      009B60 CC 8F D9         [ 2] 4274         JP     CR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



                                   4275 
                           000000  4276 WANT_DEBUG=0
                           000000  4277 .if WANT_DEBUG 
                                   4278 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4279 ;       DEBUG      ( -- )
                                   4280 ;       Display sign-on message.
                                   4281 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4282         _HEADER DEBUG,5,"DEBUG"
                                   4283 	CALL DOLIT
                                   4284 	.word 0x65
                                   4285 	CALL EMIT
                                   4286 	CALL ZERO
                                   4287  	CALL ZLESS 
                                   4288 	CALL DOLIT
                                   4289 	.word 0xFFFE
                                   4290 	CALL ZLESS 
                                   4291 	CALL UPLUS 
                                   4292  	CALL DROP 
                                   4293 	CALL DOLIT
                                   4294 	.word 3
                                   4295 	CALL UPLUS 
                                   4296 	CALL UPLUS 
                                   4297  	CALL DROP
                                   4298 	CALL DOLIT
                                   4299 	.word 0x43
                                   4300 	CALL UPLUS 
                                   4301  	CALL DROP
                                   4302 	CALL EMIT
                                   4303 	CALL DOLIT
                                   4304 	.word 0x4F
                                   4305 	CALL DOLIT
                                   4306 	.word 0x6F
                                   4307  	CALL XORR
                                   4308 	CALL DOLIT
                                   4309 	.word 0xF0
                                   4310  	CALL ANDD
                                   4311 	CALL DOLIT
                                   4312 	.word 0x4F
                                   4313  	CALL ORR
                                   4314 	CALL EMIT
                                   4315 	CALL DOLIT
                                   4316 	.word 8
                                   4317 	CALL DOLIT
                                   4318 	.word 6
                                   4319  	CALL SWAPP
                                   4320 	CALL OVER
                                   4321 	CALL XORR
                                   4322 	CALL DOLIT
                                   4323 	.word 3
                                   4324 	CALL ANDD 
                                   4325 	CALL ANDD
                                   4326 	CALL DOLIT
                                   4327 	.word 0x70
                                   4328 	CALL UPLUS 
                                   4329 	CALL DROP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



                                   4330 	CALL EMIT
                                   4331 	CALL ZERO
                                   4332 	CALL QBRAN
                                   4333 	.word DEBUG1
                                   4334 	CALL DOLIT
                                   4335 	.word 0x3F
                                   4336 DEBUG1:
                                   4337 	CALL DOLIT
                                   4338 	.word 0xFFFF
                                   4339 	CALL QBRAN
                                   4340 	.word DEBUG2
                                   4341 	CALL DOLIT
                                   4342 	.word 0x74
                                   4343 	CALL BRAN
                                   4344 	.word DEBUG3
                                   4345 DEBUG2:
                                   4346 	CALL DOLIT
                                   4347 	.word 0x21
                                   4348 DEBUG3:
                                   4349 	CALL EMIT
                                   4350 	CALL DOLIT
                                   4351 	.word 0x68
                                   4352 	CALL DOLIT
                                   4353 	.word 0x80
                                   4354 	CALL STORE
                                   4355 	CALL DOLIT
                                   4356 	.word 0x80
                                   4357 	CALL AT
                                   4358 	CALL EMIT
                                   4359 	CALL DOLIT
                                   4360 	.word 0x4D
                                   4361 	CALL TOR
                                   4362 	CALL RAT
                                   4363 	CALL RFROM
                                   4364 	CALL ANDD
                                   4365 	CALL EMIT
                                   4366 	CALL DOLIT
                                   4367 	.word 0x61
                                   4368 	CALL DOLIT
                                   4369 	.word 0xA
                                   4370 	CALL TOR
                                   4371 DEBUG4:
                                   4372 	CALL ONE
                                   4373 	CALL UPLUS 
                                   4374 	CALL DROP
                                   4375 	CALL DONXT
                                   4376 	.word DEBUG4
                                   4377 	CALL EMIT
                                   4378 	CALL DOLIT
                                   4379 	.word 0x656D
                                   4380 	CALL DOLIT
                                   4381 	.word 0x100
                                   4382 	CALL UMSTA
                                   4383 	CALL SWAPP
                                   4384 	CALL DOLIT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



                                   4385 	.word 0x100
                                   4386 	CALL UMSTA
                                   4387 	CALL SWAPP 
                                   4388 	CALL DROP
                                   4389 	CALL EMIT
                                   4390 	CALL EMIT
                                   4391 	CALL DOLIT
                                   4392 	.word 0x2043
                                   4393 	CALL ZERO
                                   4394 	CALL DOLIT
                                   4395 	.word 0x100
                                   4396 	CALL UMMOD
                                   4397 	CALL EMIT
                                   4398 	CALL EMIT
                                   4399 	;JP ORIG
                                   4400 	RET
                                   4401 .endif ; WANT_DEBUG 
                                   4402 
                                   4403 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4404 ;       'BOOT   ( -- a )
                                   4405 ;       The application startup vector.
                                   4406 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001AE3                       4407         _HEADER TBOOT,5,"'BOOT"
      009B63 9B 31                    1         .word LINK 
                           001AE5     2         LINK=.
      009B65 05                       3         .byte 5  
      009B66 27 42 4F 4F 54           4         .ascii "'BOOT"
      009B6B                          5         TBOOT:
      009B6B CD 87 57         [ 4] 4408         CALL     DOVAR
      009B6E 40 02                 4409         .word    APP_RUN      ;application to boot
                                   4410 
                                   4411 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4412 ;       COLD    ( -- )
                                   4413 ;       The hilevel cold start s=ence.
                                   4414 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001AF0                       4415         _HEADER COLD,4,"COLD"
      009B70 9B 65                    1         .word LINK 
                           001AF2     2         LINK=.
      009B72 04                       3         .byte 4  
      009B73 43 4F 4C 44              4         .ascii "COLD"
      009B77                          5         COLD:
                           000000  4416 .if WANT_DEBUG
                                   4417         CALL DEBUG
                                   4418 .endif ; WANT_DEBUG
      009B77 CD 84 EF         [ 4] 4419 COLD1:  CALL     DOLIT
      009B7A 80 AB                 4420         .word      UZERO
      009B7C CD 84 EF         [ 4] 4421 	CALL     DOLIT
      009B7F 00 06                 4422         .word      UPP
      009B81 CD 84 EF         [ 4] 4423         CALL     DOLIT
      009B84 00 1C                 4424 	.word      UEND-UZERO
      009B86 CD 8D 8B         [ 4] 4425         CALL     CMOVE   ;initialize user area
                           000001  4426 .if WANT_FLOAT 
      009B89 CD AB C1         [ 4] 4427         CALL    FINIT 
                                   4428 .endif 
                                   4429 ; if APP_RUN==0 initialize with ca de 'hi'  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



      009B8C 90 CE 40 02      [ 2] 4430         ldw y,APP_RUN 
      009B90 26 0B            [ 1] 4431         jrne 0$
      009B92 1D 00 02         [ 2] 4432         subw x,#CELLL 
      009B95 90 AE 9B 34      [ 2] 4433         ldw y,#HI  
      009B99 FF               [ 2] 4434         ldw (x),y
      009B9A CD 9C 95         [ 4] 4435         call UPDATRUN 
      009B9D                       4436 0$:        
                                   4437 ; update LAST with APP_LAST 
                                   4438 ; if APP_LAST > LAST else do the opposite
      009B9D 90 CE 40 00      [ 2] 4439         ldw y,APP_LAST 
      009BA1 90 B3 1C         [ 2] 4440         cpw y,ULAST 
      009BA4 22 05            [ 1] 4441         jrugt 1$ 
                                   4442 ; save LAST at APP_LAST  
      009BA6 CD 9C 7D         [ 4] 4443         call UPDATLAST 
      009BA9 20 06            [ 2] 4444         jra 2$
      009BAB                       4445 1$: ; update LAST with APP_LAST 
      009BAB 90 BF 1C         [ 2] 4446         ldw ULAST,y
      009BAE 90 BF 16         [ 2] 4447         ldw UCNTXT,y
      009BB1                       4448 2$:  
                                   4449 ; update APP_CP if < app_space 
      009BB1 90 CE 40 04      [ 2] 4450         ldw y,APP_CP  
      009BB5 90 B3 1A         [ 2] 4451         cpw y,UCP   
      009BB8 24 06            [ 1] 4452         jruge 3$ 
      009BBA CD 9C A6         [ 4] 4453         call UPDATCP
      009BBD 90 BE 1A         [ 2] 4454         ldw y,UCP   
      009BC0                       4455 3$:
      009BC0 90 BF 1A         [ 2] 4456         ldw UCP,y                 
                                   4457 ; update UVP with APP_VP  
                                   4458 ; if APP_VP>UVP else do the opposite 
      009BC3 90 CE 40 06      [ 2] 4459         ldw y,APP_VP 
      009BC7 90 B3 18         [ 2] 4460         cpw y,UVP 
      009BCA 22 05            [ 1] 4461         jrugt 4$
      009BCC CD 9C BD         [ 4] 4462         call UPDATVP 
      009BCF 20 03            [ 2] 4463         jra 6$
      009BD1                       4464 4$: ; update UVP with APP_VP 
      009BD1 90 BF 18         [ 2] 4465         ldw UVP,y 
      009BD4                       4466 6$:      
      009BD4 CD 95 2C         [ 4] 4467         CALL     PRESE   ;initialize data stack and TIB
      009BD7 CD 9B 6B         [ 4] 4468         CALL     TBOOT
      009BDA CD 8D 74         [ 4] 4469         CALL     ATEXE   ;application boot
      009BDD CD 98 05         [ 4] 4470         CALL     OVERT
      009BE0 CC 95 49         [ 2] 4471         JP     QUIT    ;start interpretation
                                   4472 
                                   4473 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



                                   4474         .include "flash.asm"
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
      009BE3 9B 72                   31     .word LINK 
                           001B65    32     LINK=.
      009BE5 03                      33     .byte 3 
      009BE6 46 50 21                34     .ascii "FP!"
      009BE9                         35 FPSTOR:
      009BE9 90 93            [ 1]   36     ldw y,x
      009BEB 90 FE            [ 2]   37     ldw y,(y)
      009BED 90 9F            [ 1]   38     ld a,yl 
      009BEF B7 34            [ 1]   39     ld FPTR,a 
      009BF1 1C 00 02         [ 2]   40     addw x,#CELLL 
      009BF4 90 93            [ 1]   41     ldw y,x 
      009BF6 90 FE            [ 2]   42     ldw y,(y)
      009BF8 90 BF 35         [ 2]   43     ldw PTR16,y
      009BFB 1C 00 02         [ 2]   44     addw x,#CELLL 
      009BFE 81               [ 4]   45     ret 
                                     46 
                                     47 ;-----------------------------------
                                     48 ; return EEPROM base address 
                                     49 ; as a double 
                                     50 ;  EEPROM  ( -- ud )
                                     51 ;-----------------------------------
      009BFF 9B E5                   52     .word LINK 
                           001B81    53 LINK=.
      009C01 06                      54     .byte 6 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



      009C02 45 45 50 52 4F 4D       55     .ascii "EEPROM"
      009C08                         56 EEPROM: 
      009C08 90 AE 40 00      [ 2]   57     ldw y,#EEPROM_BASE
      009C0C 1D 00 04         [ 2]   58     subw x,#2*CELLL 
      009C0F EF 02            [ 2]   59     ldw (2,x),y 
      009C11 90 5F            [ 1]   60     clrw y 
      009C13 FF               [ 2]   61     ldw (x),y 
      009C14 81               [ 4]   62     ret
                                     63 
                                     64 ;---------------------------------
                                     65 ; return APP_LAST pointer as double
                                     66 ; EEP-LAST ( -- ud )
                                     67 ;---------------------------------
      009C15 9C 01                   68 	.word LINK 
                           001B97    69 	LINK=.
      009C17 08                      70 	.byte 8 
      009C18 45 45 50 2D 4C 41 53    71 	.ascii "EEP-LAST"
             54
      009C20                         72 EEPLAST:
      009C20 1D 00 04         [ 2]   73 	subw x,#2*CELLL 
      009C23 90 AE 40 00      [ 2]   74 	ldw y,#APP_LAST 
      009C27 EF 02            [ 2]   75 	ldw (2,x),y 
      009C29 90 5F            [ 1]   76 	clrw y 
      009C2B FF               [ 2]   77 	ldw (x),y 
      009C2C 81               [ 4]   78 	ret 
                                     79 
                                     80 ;----------------------------------
                                     81 ; return APP_RUN pointer as double	
                                     82 ; EEP-RUN ( -- ud )
                                     83 ;-----------------------------------
      009C2D 9C 17                   84 	.word LINK 
                           001BAF    85 	LINK=.
      009C2F 07                      86 	.byte 7
      009C30 45 45 50 2D 52 55 4E    87 	.ascii "EEP-RUN"
      009C37                         88 EEPRUN:
      009C37 1D 00 04         [ 2]   89 	subw x,#2*CELLL 
      009C3A 90 AE 40 02      [ 2]   90 	ldw y,#APP_RUN 
      009C3E EF 02            [ 2]   91 	ldw (2,x),y 
      009C40 90 5F            [ 1]   92 	clrw y 
      009C42 FF               [ 2]   93 	ldw (x),y 
      009C43 81               [ 4]   94 	ret 
                                     95 
                                     96 ;------------------------------------
                                     97 ; return APP_CP pointer as double 
                                     98 ; EEP-CP ( -- ud )
                                     99 ;------------------------------------
      009C44 9C 2F                  100 	.word LINK
                           001BC6   101 	LINK=.
      009C46 06                     102 	.byte 6 
      009C47 45 45 50 2D 43 50      103 	.ascii "EEP-CP"
      009C4D                        104 EEPCP:
      009C4D 1D 00 04         [ 2]  105 	subw x,#2*CELLL 
      009C50 90 AE 40 04      [ 2]  106 	ldw y,#APP_CP  
      009C54 EF 02            [ 2]  107 	ldw (2,x),y 
      009C56 90 5F            [ 1]  108 	clrw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



      009C58 FF               [ 2]  109 	ldw (x),y 
      009C59 81               [ 4]  110 	ret 
                                    111 
                                    112 ;------------------------------------
                                    113 ; return APP_VP pointer as double 
                                    114 ; EEP-VP ( -- ud )
                                    115 ;-------------------------------------
      009C5A 9C 46                  116 	.word LINK
                           001BDC   117 	LINK=.
      009C5C 06                     118 	.byte 6
      009C5D 45 45 50 2D 56 50      119 	.ascii "EEP-VP"
      009C63                        120 EEPVP:
      009C63 1D 00 04         [ 2]  121 	subw x,#2*CELLL 
      009C66 90 AE 40 06      [ 2]  122 	ldw y,#APP_VP  
      009C6A EF 02            [ 2]  123 	ldw (2,x),y 
      009C6C 90 5F            [ 1]  124 	clrw y 
      009C6E FF               [ 2]  125 	ldw (x),y 
      009C6F 81               [ 4]  126 	ret 
                                    127 
                                    128 ;----------------------------------
                                    129 ; update APP_LAST with LAST 
                                    130 ; UPDAT-LAST ( -- )
                                    131 ;----------------------------------
      009C70 9C 5C                  132 	.word LINK 
                           001BF2   133 	LINK=.
      009C72 0A                     134 	.byte 10
      009C73 55 50 44 41 54 2D 4C   135 	.ascii "UPDAT-LAST"
             41 53 54
      009C7D                        136 UPDATLAST:
      009C7D CD 88 16         [ 4]  137 	call LAST
      009C80 CD 85 63         [ 4]  138 	call AT  
      009C83 CD 9C 20         [ 4]  139 	call EEPLAST
      009C86 CC 9E 73         [ 2]  140 	jp EESTORE 
                                    141 
                                    142 ;---------------------------------
                                    143 ; update APP_RUN 
                                    144 ; UPDAT-RUN ( a -- )
                                    145 ;---------------------------------
      009C89 9C 72                  146 	.word LINK
                           001C0B   147 	LINK=.
      009C8B 09                     148 	.byte 9
      009C8C 55 50 44 41 54 2D 52   149 	.ascii "UPDAT-RUN"
             55 4E
      009C95                        150 UPDATRUN:
      009C95 CD 9C 37         [ 4]  151 	call EEPRUN
      009C98 CC 9E 73         [ 2]  152 	jp EESTORE 
                                    153 	
                                    154 ;---------------------------------
                                    155 ; update APP_CP with CP 
                                    156 ; UPDAT-CP ( -- )
                                    157 ;---------------------------------
      009C9B 9C 8B                  158 	.word LINK 
                           001C1D   159 	LINK=.
      009C9D 08                     160 	.byte 8 
      009C9E 55 50 44 41 54 2D 43   161 	.ascii "UPDAT-CP"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal  50-Bits]



             50
      009CA6                        162 UPDATCP:
      009CA6 CD 88 06         [ 4]  163 	call CPP 
      009CA9 CD 85 63         [ 4]  164 	call AT 
      009CAC CD 9C 4D         [ 4]  165 	call EEPCP 
      009CAF CC 9E 73         [ 2]  166 	jp EESTORE 
                                    167 
                                    168 ;----------------------------------
                                    169 ; update APP_VP with VP 
                                    170 ; UPDAT-VP ( -- )
                                    171 ;----------------------------------
      009CB2 9C 9D                  172 	.word LINK
                           001C34   173 	LINK=.
      009CB4 08                     174 	.byte 8 
      009CB5 55 50 44 41 54 2D 56   175 	.ascii "UPDAT-VP" 
             50
      009CBD                        176 UPDATVP:
      009CBD CD 87 F8         [ 4]  177 	call VPP 
      009CC0 CD 85 63         [ 4]  178 	call AT
      009CC3 CD 9C 63         [ 4]  179 	call EEPVP 
      009CC6 CC 9E 73         [ 2]  180 	jp EESTORE
                                    181 	
                           000001   182 .if NUCLEO
                                    183 ;----------------------------------
                                    184 ; fetch integer at address over 65535
                                    185 ;  F@   ( ud -- n )
                                    186 ;----------------------------------
      009CC9 9C B4                  187     .word LINK 
                           001C4B   188 LINK=.
      009CCB 02                     189     .byte 2
      009CCC 46 40                  190     .ascii "F@"
      009CCE                        191 FARAT:
      009CCE CD 9B E9         [ 4]  192     call FPSTOR
      009CD1 CC 9D 96         [ 2]  193 	jp EE_READ 
                                    194 
                                    195 
                                    196 ;-------------------------------------
                                    197 ; fetch C at address over 65535 
                                    198 ; FC@ ( ud -- c)
                                    199 ;-------------------------------------
      009CD4 9C CB                  200     .word LINK
                           001C56   201     LINK=.
      009CD6 03                     202     .byte 3 
      009CD7 46 43 40               203     .ascii "FC@" 
      009CDA                        204 FARCAT:
      009CDA CD 9B E9         [ 4]  205     call FPSTOR
      009CDD CC 9D B8         [ 2]  206 	jp EE_CREAD  
                                    207 .endif ; NUCLEO 
                                    208 
                                    209 ;----------------------------------
                                    210 ; UNLOCK EEPROM/OPT for writing/erasing
                                    211 ; wait endlessly for FLASH_IAPSR_DUL bit.
                                    212 ;  UNLKEE   ( -- )
                                    213 ;----------------------------------
      009CE0 9C D6                  214     .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]



                           001C62   215 LINK=.
      009CE2 06                     216     .byte 6 
      009CE3 55 4E 4C 4B 45 45      217     .ascii "UNLKEE"
      009CE9                        218 UNLKEE:
      009CE9 35 00 50 5B      [ 1]  219 	mov FLASH_CR2,#0 
      009CED 35 FF 50 5C      [ 1]  220 	mov FLASH_NCR2,#0xFF 
      009CF1 35 AE 50 64      [ 1]  221 	mov FLASH_DUKR,#FLASH_DUKR_KEY1
      009CF5 35 56 50 64      [ 1]  222     mov FLASH_DUKR,#FLASH_DUKR_KEY2
      009CF9 72 07 50 5F FB   [ 2]  223 	btjf FLASH_IAPSR,#FLASH_IAPSR_DUL,.
      009CFE 81               [ 4]  224 	ret
                                    225 
                                    226 ;----------------------------------
                                    227 ; UNLOCK FLASH for writing/erasing
                                    228 ; wait endlessly for FLASH_IAPSR_PUL bit.
                                    229 ; UNLKFL  ( -- )
                                    230 ;----------------------------------
      009CFF 9C E2                  231     .word LINK 
                           001C81   232 LINK=. 
      009D01 06                     233     .byte 6 
      009D02 55 4E 4C 4B 46 4C      234     .ascii "UNLKFL"    
      009D08                        235 UNLKFL:
      009D08 35 00 50 5B      [ 1]  236 	mov FLASH_CR2,#0 
      009D0C 35 FF 50 5C      [ 1]  237 	mov FLASH_NCR2,#0xFF 
      009D10 35 56 50 62      [ 1]  238 	mov FLASH_PUKR,#FLASH_PUKR_KEY1
      009D14 35 AE 50 62      [ 1]  239 	mov FLASH_PUKR,#FLASH_PUKR_KEY2
      009D18 72 03 50 5F FB   [ 2]  240 	btjf FLASH_IAPSR,#FLASH_IAPSR_PUL,.
      009D1D 81               [ 4]  241 	ret
                                    242 
                                    243 ;-----------------------------
                                    244 ; UNLOCK FLASH or EEPROM 
                                    245 ; according to FPTR address 
                                    246 ;  UNLOCK ( -- )
                                    247 ;-----------------------------
      009D1E 9D 01                  248 	.word LINK 
                           001CA0   249 	LINK=.
      009D20 06                     250 	.byte 6
      009D21 55 4E 4C 4F 43 4B      251 	.ascii "UNLOCK"
      009D27                        252 UNLOCK:
                                    253 ; put addr[15:0] in Y, for bounds check.
      009D27 90 BE 35         [ 2]  254 	ldw y,PTR16   ; Y=addr15:0
                                    255 ; check addr[23:16], if <> 0 then it is extened flash memory
      009D2A 3D 34            [ 1]  256 	tnz FPTR 
      009D2C 26 16            [ 1]  257 	jrne 4$
      009D2E 90 A3 80 00      [ 2]  258     cpw y,#FLASH_BASE
      009D32 24 10            [ 1]  259     jruge 4$
      009D34 90 A3 40 00      [ 2]  260 	cpw y,#EEPROM_BASE  
      009D38 25 0D            [ 1]  261     jrult 9$
      009D3A 90 A3 48 7F      [ 2]  262 	cpw y,#OPTION_END 
      009D3E 22 07            [ 1]  263 	jrugt 9$
      009D40 CD 9C E9         [ 4]  264 	call UNLKEE
      009D43 81               [ 4]  265 	ret 
      009D44 CD 9D 08         [ 4]  266 4$: call UNLKFL
      009D47 81               [ 4]  267 9$: ret 
                                    268 
                                    269 ;-------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]



                                    270 ; LOCK write access to 
                                    271 ; FLASH and EEPROM 
                                    272 ; LOCK ( -- )
                                    273 ;-------------------------
      009D48 9D 20                  274 	.word LINK 
                           001CCA   275 	LINK=.
      009D4A 04                     276 	.byte 4 
      009D4B 4C 4F 43 4B            277 	.ascii "LOCK" 
      009D4F                        278 LOCK: 
      009D4F 72 13 50 5F      [ 1]  279 	bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      009D53 72 17 50 5F      [ 1]  280 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      009D57 81               [ 4]  281 	ret 
                                    282 
                                    283 ;-------------------------
                                    284 ; increment FPTR 
                                    285 ; INC-FPTR ( -- )
                                    286 ;-------------------------
      009D58 9D 4A                  287 	.word LINK 
                           001CDA   288 	LINK=. 
      009D5A 08                     289 	.byte 8 
      009D5B 49 4E 43 2D 46 50 54   290 	.ascii "INC-FPTR" 
             52
      009D63                        291 INC_FPTR:
      009D63 3C 36            [ 1]  292 	inc PTR8 
      009D65 26 0C            [ 1]  293 	jrne 1$
      009D67 90 89            [ 2]  294 	pushw y 
      009D69 90 BE 34         [ 2]  295 	ldw y,FPTR 
      009D6C 90 5C            [ 1]  296 	incw y 
      009D6E 90 BF 34         [ 2]  297 	ldw FPTR,y
      009D71 90 85            [ 2]  298 	popw y  
      009D73 81               [ 4]  299 1$: ret 
                                    300 
                                    301 ;------------------------------
                                    302 ; add u to FPTR 
                                    303 ; PTR+ ( u -- )
                                    304 ;------------------------------
      009D74 9D 5A                  305 	.word LINK 
                           001CF6   306 	LINK=.
      009D76 04                     307 	.byte 4 
      009D77 50 54 52 2B            308 	.ascii "PTR+"
      009D7B                        309 PTRPLUS:
      009D7B 90 93            [ 1]  310 	ldw y,x 
      009D7D 1C 00 02         [ 2]  311 	addw x,#CELLL 
      009D80 72 B9 00 35      [ 2]  312 	addw y,PTR16 
      009D84 90 BF 35         [ 2]  313 	ldw PTR16,y  
      009D87 24 02            [ 1]  314 	jrnc 1$
      009D89 3C 34            [ 1]  315 	inc FPTR 
      009D8B 81               [ 4]  316 1$: ret 
                                    317 
                                    318 ;---------------------------------
                                    319 ; read word at address pointed FPTR
                                    320 ; increment FPTR 
                                    321 ; EE-READ ( -- w )
                                    322 ;------------------------------------
      009D8C 9D 76                  323 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]



                           001D0E   324 	LINK=.
      009D8E 07                     325 	.byte 7 
      009D8F 45 45 2D 52 45 41 44   326 	.ascii "EE-READ"
      009D96                        327 EE_READ:
      009D96 1D 00 02         [ 2]  328 	subw x,#CELLL 
      009D99 92 BC 00 34      [ 5]  329 	ldf a,[FPTR]
      009D9D 90 95            [ 1]  330 	ld yh,a 
      009D9F CD 9D 63         [ 4]  331 	call INC_FPTR 
      009DA2 92 BC 00 34      [ 5]  332 	ldf a,[FPTR]
      009DA6 CD 9D 63         [ 4]  333 	call INC_FPTR 
      009DA9 90 97            [ 1]  334 	ld yl,a 
      009DAB FF               [ 2]  335 	ldw (x),y 
      009DAC 81               [ 4]  336 	ret 
                                    337 
                                    338 ;---------------------------------------
                                    339 ; Read byte at address pointed by FPTR 
                                    340 ; EE-CREAD ( -- c )
                                    341 ;---------------------------------------
      009DAD 9D 8E                  342 	.word LINK 
                           001D2F   343 	LINK=.
      009DAF 08                     344 	.byte 8
      009DB0 45 45 2D 43 52 45 41   345 	.ascii "EE-CREAD" 
             44
      009DB8                        346 EE_CREAD:
      009DB8 1D 00 02         [ 2]  347 	subw x,#CELLL 
      009DBB 92 BC 00 34      [ 5]  348 	ldf a,[FPTR]	
      009DBF CD 9D 63         [ 4]  349 	call INC_FPTR
      009DC2 90 5F            [ 1]  350 	clrw y 
      009DC4 90 97            [ 1]  351 	ld yl,a 
      009DC6 FF               [ 2]  352 	ldw (x),y 
      009DC7 81               [ 4]  353 	ret 
                                    354 
                                    355 ;----------------------------
                                    356 ; write a byte at address pointed 
                                    357 ; by FPTR and increment FPTR.
                                    358 ; Expect pointer already initialized 
                                    359 ; and memory unlocked 
                                    360 ; WR-BYTE ( c -- )
                                    361 ;----------------------------
      009DC8 9D AF                  362 	.word LINK 
                           001D4A   363 	LINK=. 
      009DCA 07                     364 	.byte 7 
      009DCB 57 52 2D 42 59 54 45   365 	.ascii "WR-BYTE" 
                                    366 
      009DD2                        367 WR_BYTE:
      009DD2 CD 84 E3         [ 4]  368 	call FC_XOFF
      009DD5 90 93            [ 1]  369 	ldw y,x 
      009DD7 90 FE            [ 2]  370 	ldw y,(y)
      009DD9 1C 00 02         [ 2]  371 	addw x,#CELLL 
      009DDC 90 9F            [ 1]  372 	ld a,yl
      009DDE 92 BD 00 34      [ 4]  373 	ldf [FPTR],a
      009DE2 72 05 50 5F FB   [ 2]  374 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009DE7 CD 84 CD         [ 4]  375 	call FC_XON
      009DEA CC 9D 63         [ 2]  376 	jp INC_FPTR 
                                    377 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]



                                    378 ;---------------------------------------
                                    379 ; write a word at address pointed 
                                    380 ; by FPTR and increment FPTR 
                                    381 ; Expect pointer already initialzed 
                                    382 ; and memory unlocked 
                                    383 ; WR-WORD ( w -- )
                                    384 ;---------------------------------------
      009DED 9D CA                  385 	.word LINK 
                           001D6F   386 	LINK=.
      009DEF 07                     387 	.byte 7 
      009DF0 57 52 2D 57 4F 52 44   388 	.ascii "WR-WORD" 
      009DF7                        389 WR_WORD:
      009DF7 CD 84 E3         [ 4]  390 	call FC_XOFF
      009DFA 90 93            [ 1]  391 	ldw y,x
      009DFC 90 FE            [ 2]  392 	ldw y,(y)
      009DFE 1C 00 02         [ 2]  393 	addw x,#CELLL 
      009E01 90 9E            [ 1]  394 	ld a,yh 
      009E03 92 BD 00 34      [ 4]  395 	ldf [FPTR],a
      009E07 72 05 50 5F FB   [ 2]  396 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009E0C CD 9D 63         [ 4]  397 	call INC_FPTR 
      009E0F 90 9F            [ 1]  398 	ld a,yl 
      009E11 92 BD 00 34      [ 4]  399 	ldf [FPTR],a
      009E15 72 05 50 5F FB   [ 2]  400 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009E1A CD 84 CD         [ 4]  401 	call FC_XON
      009E1D CC 9D 63         [ 2]  402 	jp INC_FPTR 
                                    403 
                                    404 
                                    405 ;---------------------------------------
                                    406 ; write a byte to FLASH or EEPROM/OPTION  
                                    407 ; EEC!  (c ud -- )
                                    408 ;---------------------------------------
      009E20 9D EF                  409     .word LINK 
                           001DA2   410 	LINK=.
      009E22 04                     411     .byte 4 
      009E23 45 45 43 21            412     .ascii "EEC!"
                                    413 	; local variables 
                           000001   414 	BTW = 1   ; byte to write offset on stack
                           000002   415     OPT = 2 
                           000002   416 	VSIZE = 2
      009E27                        417 EECSTORE:
      009E27 52 02            [ 2]  418 	sub sp,#VSIZE
      009E29 CD 9B E9         [ 4]  419     call FPSTOR
      009E2C E6 01            [ 1]  420 	ld a,(1,x)
      009E2E 43               [ 1]  421 	cpl a 
      009E2F 6B 01            [ 1]  422 	ld (BTW,sp),a ; byte to write 
      009E31 0F 02            [ 1]  423 	clr (OPT,sp)  ; OPTION flag
      009E33 CD 9D 27         [ 4]  424 	call UNLOCK 
                                    425 	; check if option
      009E36 3D 34            [ 1]  426 	tnz FPTR 
      009E38 26 19            [ 1]  427 	jrne 2$
      009E3A 90 BE 35         [ 2]  428 	ldw y,PTR16 
      009E3D 90 A3 48 00      [ 2]  429 	cpw y,#OPTION_BASE
      009E41 2B 10            [ 1]  430 	jrmi 2$
      009E43 90 A3 48 80      [ 2]  431 	cpw y,#OPTION_END+1
      009E47 2A 0A            [ 1]  432 	jrpl 2$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]



      009E49 03 02            [ 1]  433 	cpl (OPT,sp)
                                    434 	; OPTION WRITE require this UNLOCK 
      009E4B 72 1E 50 5B      [ 1]  435     bset FLASH_CR2,#FLASH_CR2_OPT
      009E4F 72 1F 50 5C      [ 1]  436     bres FLASH_NCR2,#FLASH_CR2_OPT 
      009E53                        437 2$: 
      009E53 CD 9D D2         [ 4]  438 	call WR_BYTE 	
      009E56 0D 02            [ 1]  439 	tnz (OPT,sp)
      009E58 27 0D            [ 1]  440 	jreq 3$ 
      009E5A 7B 01            [ 1]  441     ld a,(BTW,sp)
      009E5C 90 5F            [ 1]  442     clrw y
      009E5E 90 97            [ 1]  443 	ld yl,a 
      009E60 1D 00 02         [ 2]  444 	subw x,#CELLL 
      009E63 FF               [ 2]  445 	ldw (x),y 
      009E64 CD 9D D2         [ 4]  446 	call WR_BYTE
      009E67                        447 3$: 
      009E67 CD 9D 4F         [ 4]  448 	call LOCK 
      009E6A 5B 02            [ 2]  449 	addw sp,#VSIZE 
      009E6C 81               [ 4]  450     ret
                                    451 
                                    452 ;------------------------------
                                    453 ; write integer in FLASH|EEPROM
                                    454 ; EE! ( n ud -- )
                                    455 ;------------------------------
      009E6D 9E 22                  456 	.word LINK 
                           001DEF   457 	LINK=.
      009E6F 03                     458 	.byte 3 
      009E70 45 45 21               459 	.ascii "EE!"
      009E73                        460 EESTORE:
      009E73 CD 9B E9         [ 4]  461 	call FPSTOR 
      009E76 CD 9D 27         [ 4]  462 	call UNLOCK 
      009E79 90 93            [ 1]  463 	ldw y,x 
      009E7B 90 FE            [ 2]  464 	ldw y,(y)
      009E7D 90 89            [ 2]  465 	pushw y 
      009E7F 90 5E            [ 1]  466 	swapw y 
      009E81 FF               [ 2]  467 	ldw (x),y 
      009E82 CD 9D D2         [ 4]  468 	call WR_BYTE 
      009E85 90 85            [ 2]  469 	popw y 
      009E87 1D 00 02         [ 2]  470 	subw x,#CELLL
      009E8A FF               [ 2]  471 	ldw (x),y 
      009E8B CD 9D D2         [ 4]  472 	call WR_BYTE
      009E8E CC 9D 4F         [ 2]  473 	jp LOCK 
                                    474 
                                    475 
                                    476 ;----------------------------
                                    477 ; Erase flash memory row 
                                    478 ; stm8s208 as 128 bytes rows
                                    479 ; ROW-ERASE ( ud -- )
                                    480 ;----------------------------
      009E91 9E 6F                  481 	.word LINK 
                           001E13   482 	LINK=. 
      009E93 09                     483 	.byte 9 
      009E94 52 4F 57 2D 45 52 41   484 	.ascii "ROW-ERASE" 
             53 45
      009E9D                        485 row_erase:
      009E9D CD 84 E3         [ 4]  486 	call FC_XOFF
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
Hexadecimal [24-Bits]



      009EA0 CD 9B E9         [ 4]  487 	call FPSTOR
                                    488 ;code must be execute from RAM 
                                    489 ;copy routine to PAD 
      009EA3 1D 00 02         [ 2]  490 	subw x,#CELLL 
      009EA6 90 AE 9E F6      [ 2]  491 	ldw y,#row_erase_proc
      009EAA FF               [ 2]  492 	ldw (x),y 
      009EAB CD 8D 4F         [ 4]  493 	call PAD 
      009EAE 90 AE 9F 1D      [ 2]  494 	ldw y,#row_erase_proc_end 
      009EB2 72 A2 9E F6      [ 2]  495 	subw y,#row_erase_proc
      009EB6 1D 00 02         [ 2]  496 	subw x,#CELLL 
      009EB9 FF               [ 2]  497 	ldw (x),y 
      009EBA CD 8D 8B         [ 4]  498 	call CMOVE 
      009EBD                        499 block_erase:
      009EBD 90 BE 35         [ 2]  500 	ldw y,FPTR+1
      009EC0 90 A3 B5 80      [ 2]  501 	cpw y,#app_space 
      009EC4 2A 19            [ 1]  502 	jrpl erase_flash 
                                    503 ; erase EEPROM block
      009EC6 90 A3 40 00      [ 2]  504 	cpw y,#EEPROM_BASE 
      009ECA 24 04            [ 1]  505 	jruge 1$
      009ECC CD 84 CD         [ 4]  506 	call FC_XON
      009ECF 81               [ 4]  507 	ret ; bad address 
      009ED0 90 A3 47 FF      [ 2]  508 1$: cpw y,#EEPROM_END 
      009ED4 23 04            [ 2]  509 	jrule 2$ 
      009ED6 CD 84 CD         [ 4]  510 	call FC_XON
      009ED9 81               [ 4]  511 	ret ; bad address 
      009EDA                        512 2$:	
      009EDA CD 9C E9         [ 4]  513 	call UNLKEE 
      009EDD 20 03            [ 2]  514 	jra proceed_erase
                                    515 ; erase flash block:
      009EDF                        516 erase_flash:
      009EDF CD 9D 08         [ 4]  517 	call UNLKFL 
      009EE2                        518 proceed_erase:
      009EE2 CD 8D 4F         [ 4]  519 	call PAD 
      009EE5 90 93            [ 1]  520 	ldw y,x
      009EE7 90 FE            [ 2]  521 	ldw y,(y)
      009EE9 1C 00 02         [ 2]  522 	addw x,#CELLL  
      009EEC 90 FD            [ 4]  523 	call (y) 
      009EEE 72 17 50 5F      [ 1]  524 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      009EF2 CD 84 CD         [ 4]  525 	call FC_XON
      009EF5 81               [ 4]  526 	ret 
                                    527 
                                    528 ; this routine is to be copied to PAD 
      009EF6                        529 row_erase_proc:
      009EF6 35 20 50 5B      [ 1]  530 	mov FLASH_CR2,#(1<<FLASH_CR2_ERASE) 
      009EFA 35 DF 50 5C      [ 1]  531 	mov FLASH_NCR2,#~(1<<FLASH_CR2_ERASE)
      009EFE 4F               [ 1]  532 	clr a 
      009EFF 90 5F            [ 1]  533 	clrw y 
      009F01 91 A7 00 34      [ 1]  534 	ldf ([FPTR],y),a
      009F05 90 5C            [ 1]  535     incw y
      009F07 91 A7 00 34      [ 1]  536 	ldf ([FPTR],y),a
      009F0B 90 5C            [ 1]  537     incw y
      009F0D 91 A7 00 34      [ 1]  538 	ldf ([FPTR],y),a
      009F11 90 5C            [ 1]  539     incw y
      009F13 91 A7 00 34      [ 1]  540 	ldf ([FPTR],y),a
      009F17 72 05 50 5F FB   [ 2]  541 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
Hexadecimal [24-Bits]



      009F1C 81               [ 4]  542 	ret
      009F1D                        543 row_erase_proc_end:
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
      009F1D                        556 copy_buffer:
      009F1D 4B 80            [ 1]  557 	push #BLOCK_SIZE  
                                    558 ;enable block programming 
      009F1F 72 10 50 5B      [ 1]  559 	bset FLASH_CR2,#FLASH_CR2_PRG 
      009F23 72 11 50 5C      [ 1]  560 	bres FLASH_NCR2,#FLASH_CR2_PRG
      009F27 90 5F            [ 1]  561 	clrw y
      009F29 F6               [ 1]  562 1$:	ld a,(x)
      009F2A 91 A7 00 34      [ 1]  563 	ldf ([FPTR],y),a
      009F2E 5C               [ 1]  564 	incw x 
      009F2F 90 5C            [ 1]  565 	incw y 
      009F31 0A 01            [ 1]  566 	dec (BCNT,sp)
      009F33 26 F4            [ 1]  567 	jrne 1$
                                    568 ; wait EOP bit 
      009F35 72 05 50 5F FB   [ 2]  569 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. 
      009F3A 84               [ 1]  570 	pop a ; remove BCNT from stack 
      009F3B 81               [ 4]  571 	ret 
      009F3C                        572 copy_buffer_end:
                                    573 
                                    574 ;-------------------------
                                    575 ; move program_row to RAM 
                                    576 ; in TIB 
                                    577 ;------------------------
      009F3C                        578 copy_prog_to_ram:
      009F3C 1D 00 06         [ 2]  579 	subw x,#6
      009F3F 90 AE 9F 1D      [ 2]  580 	ldw y,#copy_buffer 
      009F43 EF 04            [ 2]  581 	ldw (4,x),y 
      009F45 90 AE 17 00      [ 2]  582 	ldw y,#TIBBASE
      009F49 EF 02            [ 2]  583 	ldw (2,x),y 
      009F4B 90 AE 9F 3C      [ 2]  584 	ldw y,#copy_buffer_end 
      009F4F 72 A2 9F 1D      [ 2]  585 	subw y,#copy_buffer  
      009F53 FF               [ 2]  586 	ldw (x),y 
      009F54 CD 8D 8B         [ 4]  587 	call CMOVE 
      009F57 81               [ 4]  588 	ret 
                                    589 
                                    590 
                                    591 ;-----------------------------
                                    592 ; write a row in FLASH/EEPROM 
                                    593 ; WR-ROW ( a ud -- )
                                    594 ; a -> address 128 byte buffer to write 
                                    595 ; ud ->  row address in FLASH|EEPROM 
                                    596 ;-----------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]



      009F58 9E 93                  597 	.word LINK 
                           001EDA   598 	LINK=.
      009F5A 06                     599 	.byte 6 
      009F5B 57 52 2D 52 4F 57      600 	.ascii "WR-ROW"
      009F61                        601 write_row:
      009F61 CD 84 E3         [ 4]  602 	call FC_XOFF
      009F64 CD 9B E9         [ 4]  603 	call FPSTOR
                                    604 ; align to FLASH block 
      009F67 A6 80            [ 1]  605 	ld a,#0x80 
      009F69 B4 36            [ 1]  606 	and a,PTR8 
      009F6B B7 36            [ 1]  607 	ld PTR8,a  
      009F6D CD 9F 3C         [ 4]  608 	call copy_prog_to_ram
      009F70 CD 9D 27         [ 4]  609 	call UNLOCK
      009F73 90 93            [ 1]  610 	ldw y,x 
      009F75 90 FE            [ 2]  611 	ldw y,(y)
      009F77 1C 00 02         [ 2]  612 	addw x,#CELLL 
      009F7A 89               [ 2]  613 	pushw x 
      009F7B 93               [ 1]  614 	ldw x,y ; buffer address in x 
      009F7C CD 17 00         [ 4]  615 	call TIBBASE
      009F7F CD 9D 4F         [ 4]  616 	call LOCK
      009F82 85               [ 2]  617 	popw x 
      009F83 CD 84 CD         [ 4]  618 	call FC_XON 
      009F86 81               [ 4]  619 	ret 
                                    620 
                                    621 ;-------------------------------------
                                    622 ; change value of OPTION register 
                                    623 ; SET-OPT (c n -- ) 
                                    624 ; c new value.
                                    625 ; n OPT  number {1..7}
                                    626 ;--------------------------------------
      009F87 9F 5A                  627 		.word LINK 
                           001F09   628 		LINK=.
      009F89 07                     629 		.byte 7 
      009F8A 53 45 54 2D 4F 50 54   630 		.ascii "SET-OPT" 
      009F91                        631 set_option: 
      009F91 90 93            [ 1]  632 		ldw y,x 
      009F93 90 FE            [ 2]  633 		ldw y,(y)
      009F95 27 06            [ 1]  634 		jreq 1$
      009F97 90 A3 00 07      [ 2]  635 		cpw y,#7 
      009F9B 23 04            [ 2]  636 		jrule 2$ 
                                    637 ; invalid OPTION number 		
      009F9D 1C 00 04         [ 2]  638 1$:		addw x,#2*CELLL
      009FA0 81               [ 4]  639 		ret
      009FA1 90 58            [ 2]  640 2$:		sllw y 
      009FA3 72 A9 47 FF      [ 2]  641 		addw y,#OPTION_BASE-1
      009FA7 FF               [ 2]  642 		ldw (x),y 
      009FA8 1D 00 02         [ 2]  643 		subw x,#CELLL 
      009FAB 90 5F            [ 1]  644 		clrw y 
      009FAD FF               [ 2]  645 		ldw (x),y 
      009FAE CD 9E 27         [ 4]  646 		call EECSTORE
      009FB1 81               [ 4]  647 		ret 
                                    648 
                                    649 
                                    650 
                                    651 ;--------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]



                                    652 ; reset system to its original state 
                                    653 ; before any user modification
                                    654 ; PRISTINE ( -- )
                                    655 ;-------------------------------------
      009FB2 9F 89                  656 	.word LINK  
                           001F34   657 	LINK=.
      009FB4 08                     658 	.byte 8 
      009FB5 50 52 49 53 54 49 4E   659 	.ascii "PRISTINE"
             45
      009FBD                        660 pristine:
                                    661 ;;; erase EEPROM
      009FBD CD 9C 08         [ 4]  662 	call EEPROM 
      009FC0 CD 88 B1         [ 4]  663 1$:	call DDUP 
      009FC3 CD 9E 9D         [ 4]  664 	call row_erase
      009FC6 90 93            [ 1]  665 	ldw y,x 
      009FC8 90 EE 02         [ 2]  666 	ldw y,(2,y)
      009FCB 72 A9 00 80      [ 2]  667 	addw y,#BLOCK_SIZE
      009FCF EF 02            [ 2]  668 	ldw (2,x),y
      009FD1 90 A3 48 00      [ 2]  669 	cpw y,#OPTION_BASE 
      009FD5 25 E9            [ 1]  670 	jrult 1$
                                    671 ;;; reset OPTION to default values
      009FD7 90 AE 00 01      [ 2]  672 	ldw y,#1 ; OPT1 
      009FDB FF               [ 2]  673 2$:	ldw (x),y   
      009FDC 90 5F            [ 1]  674 	clrw y 
      009FDE EF 02            [ 2]  675 	ldw (2,x),y  ; ( 0 1 -- ) 
      009FE0 CD 88 B1         [ 4]  676 	call DDUP    ; ( 0 1 0 1 -- )  
      009FE3 CD 9F 91         [ 4]  677 	call set_option
      009FE6 90 93            [ 1]  678 	ldw y,x 
      009FE8 90 FE            [ 2]  679 	ldw y,(y)
      009FEA 90 5C            [ 1]  680 	incw y  ; next OPTION 
      009FEC 90 A3 00 08      [ 2]  681 	cpw y,#8 
      009FF0 25 E9            [ 1]  682 	jrult 2$
                                    683 ;;; erase first row of app_space 	
      009FF2 90 AE B5 80      [ 2]  684 	ldw y,#app_space
      009FF6 EF 02            [ 2]  685 	ldw (2,x),y  
      009FF8 90 5F            [ 1]  686 	clrw y 
      009FFA FF               [ 2]  687 	ldw (x),y ; ( app_space 0 -- )
      009FFB CD 9E 9D         [ 4]  688 	call row_erase 
                                    689 ; reset interrupt vectors 
      009FFE 1D 00 02         [ 2]  690 	subw x,#CELLL 
      00A001 90 5F            [ 1]  691 	clrw y  
      00A003 FF               [ 2]  692 4$:	ldw (x),y  ; ( n -- ) int# 
      00A004 CD 86 A1         [ 4]  693 	call DUPP  
      00A007 CD A0 24         [ 4]  694 	call reset_vector
      00A00A 90 93            [ 1]  695 	ldw y,x 
      00A00C 90 FE            [ 2]  696 	ldw y,(y)
      00A00E 90 5C            [ 1]  697 	incw y   ; next vector 
      00A010 90 A3 00 19      [ 2]  698 	cpw y,#25 
      00A014 25 ED            [ 1]  699 	jrult 4$
      00A016 CC 80 80         [ 2]  700 	jp NonHandledInterrupt ; reset MCU
                                    701 
                                    702 ;------------------------------
                                    703 ; reset an interrupt vector 
                                    704 ; to its initial value 
                                    705 ; i.e. NonHandledInterrupt
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]



                                    706 ; RST-IVEC ( n -- )
                                    707 ;-----------------------------
      00A019 9F B4                  708 	.word LINK 
                           001F9B   709 	LINK=. 
      00A01B 08                     710 	.byte 8 
      00A01C 52 53 54 2D 49 56 45   711 	.ascii "RST-IVEC"
             43
      00A024                        712 reset_vector:
      00A024 90 93            [ 1]  713 	ldw y,x
      00A026 1C 00 02         [ 2]  714 	addw x,#CELLL 
      00A029 90 FE            [ 2]  715 	ldw y,(y)
      00A02B 90 A3 00 17      [ 2]  716 	cpw y,#23 
      00A02F 27 3A            [ 1]  717 	jreq 9$
      00A031 90 A3 00 1D      [ 2]  718 	cpw y,#29 ; last vector
      00A035 22 34            [ 1]  719 	jrugt 9$  
      00A037 90 58            [ 2]  720 	sllw y 
      00A039 90 58            [ 2]  721 	sllw y 
      00A03B 72 A9 80 08      [ 2]  722 	addw y,#0x8008 ; irq0 address 
      00A03F 90 BF 26         [ 2]  723 	ldw YTEMP,y
      00A042 1D 00 06         [ 2]  724 	subw x,#3*CELLL 
      00A045 EF 02            [ 2]  725 	ldw (2,x),y 
      00A047 90 5F            [ 1]  726 	clrw y
      00A049 FF               [ 2]  727 	ldw (x),y 
      00A04A A6 82            [ 1]  728 	ld a,#0x82 
      00A04C 90 95            [ 1]  729 	ld yh,a
      00A04E EF 04            [ 2]  730 	ldw (4,x),y
      00A050 CD 9E 73         [ 4]  731 	call EESTORE
      00A053 1D 00 06         [ 2]  732 	subw x,#3*CELLL
      00A056 90 5F            [ 1]  733 	clrw y 
      00A058 FF               [ 2]  734 	ldw (x),y 
      00A059 90 AE 80 80      [ 2]  735 	ldw y,#NonHandledInterrupt
      00A05D EF 04            [ 2]  736 	ldw (4,x),y 
      00A05F 90 BE 26         [ 2]  737 	ldw y,YTEMP  
      00A062 72 A9 00 02      [ 2]  738 	addw y,#2
      00A066 EF 02            [ 2]  739 	ldw (2,x),y 
      00A068 CD 9E 73         [ 4]  740 	call EESTORE
      00A06B 81               [ 4]  741 9$:	ret 
                                    742 
                                    743 
                                    744 ;------------------------------
                                    745 ; all interrupt vector with 
                                    746 ; an address >= a are resetted 
                                    747 ; to default
                                    748 ; CHKIVEC ( a -- )
                                    749 ;------------------------------
      00A06C A0 1B                  750 	.word LINK 
                           001FEE   751 	LINK=.
      00A06E 07                     752 	.byte 7
      00A06F 43 48 4B 49 56 45 43   753 	.ascii "CHKIVEC"
                                    754 ;local variables 
                           000001   755 	SSP=1
                           000003   756 	CADR=3
                           000005   757 	OFS=5
                           000006   758 	VSIZE=6  
      00A076                        759 CHKIVEC:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 118.
Hexadecimal [24-Bits]



      00A076 52 06            [ 2]  760 	sub sp,#VSIZE ;alloc local variables 
      00A078 90 93            [ 1]  761 	ldw y,x 
      00A07A 90 FE            [ 2]  762 	ldw y,(y)
      00A07C 17 03            [ 2]  763 	ldw (CADR,sp),y ; ca 
      00A07E 1F 01            [ 2]  764 	ldw (SSP,sp),x 
      00A080 AE 80 0A         [ 2]  765 	ldw x,#0x800a ; irq0 address 
      00A083 BF 35            [ 2]  766 	ldw PTR16,X
      00A085 AE FF FC         [ 2]  767 	ldw x,#-4 
      00A088 1C 00 04         [ 2]  768 1$:	addw x,#4
      00A08B A3 00 78         [ 2]  769 	cpw x,#30*4 ; irq0-29 
      00A08E 27 22            [ 1]  770 	jreq 9$
      00A090 90 93            [ 1]  771 	ldw y,x  
      00A092 91 D6 35         [ 4]  772 	ld a,([PTR16],y)
      00A095 11 03            [ 1]  773 	cp a,(CADR,sp)
      00A097 25 EF            [ 1]  774 	jrult 1$
      00A099 90 5C            [ 1]  775 	incw y 
      00A09B 91 D6 35         [ 4]  776 	ld a,([PTR16],y)
      00A09E 11 04            [ 1]  777 	cp a,(CADR+1,sp) 
      00A0A0 25 E6            [ 1]  778 	jrult 1$ 
      00A0A2 1F 05            [ 2]  779 	ldw (OFS,sp),x 
      00A0A4 54               [ 2]  780 	srlw x
      00A0A5 54               [ 2]  781 	srlw x 
      00A0A6 90 93            [ 1]  782 	ldw y,x 
      00A0A8 1E 01            [ 2]  783 	ldw x,(SSP,sp)
      00A0AA FF               [ 2]  784 	ldw (x),y
      00A0AB CD A0 24         [ 4]  785 	call reset_vector
      00A0AE 1E 05            [ 2]  786 	ldw x,(OFS,sp) 
      00A0B0 20 D6            [ 2]  787 	jra 1$
      00A0B2 1E 01            [ 2]  788 9$:	ldw x,(SSP,sp) 
      00A0B4 1C 00 02         [ 2]  789 	addw x,#CELLL 
      00A0B7 5B 06            [ 2]  790 	addw sp,#VSIZE ; drop local variables  
      00A0B9 81               [ 4]  791 	ret 
                                    792 
                                    793 ;------------------------------
                                    794 ; set interrupt vector 
                                    795 ; SET-IVEC ( ud n -- )
                                    796 ;  ud Handler address
                                    797 ;  n  vector # 0 .. 29 
                                    798 ;-----------------------------
      00A0BA A0 6E                  799 	.word LINK
                           00203C   800 	LINK=.
      00A0BC 08                     801 	.byte 8 
      00A0BD 53 45 54 2D 49 56 45   802 	.ascii "SET-IVEC" 
             43
      00A0C5                        803 set_vector:
      00A0C5 90 93            [ 1]  804     ldw y,x 
      00A0C7 1C 00 02         [ 2]  805 	addw x,#CELLL 
      00A0CA 90 FE            [ 2]  806 	ldw y,(y) ; vector #
      00A0CC 90 A3 00 1D      [ 2]  807 	cpw y,#29 ; last vector
      00A0D0 23 04            [ 2]  808 	jrule 2$
      00A0D2 1C 00 04         [ 2]  809 	addw x,#2*CELLL 
      00A0D5 81               [ 4]  810 	ret
      00A0D6 90 58            [ 2]  811 2$:	sllw y 
      00A0D8 90 58            [ 2]  812 	sllw y 
      00A0DA 72 A9 80 08      [ 2]  813 	addw y,#0X8008 ; IRQ0 vector address 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 119.
Hexadecimal [24-Bits]



      00A0DE 90 BF 26         [ 2]  814 	ldw YTEMP,y ; vector address 
      00A0E1 A6 82            [ 1]  815 	ld a,#0x82 
      00A0E3 90 95            [ 1]  816 	ld yh,a 
      00A0E5 E6 01            [ 1]  817 	ld a,(1,x) ; isr address bits 23..16 
      00A0E7 90 97            [ 1]  818 	ld yl,a 
                                    819 ;  write 0x82 + most significant byte of int address	
      00A0E9 1D 00 06         [ 2]  820 	subw x,#3*CELLL 
      00A0EC EF 04            [ 2]  821 	ldw (4,x),y 
      00A0EE 90 BE 26         [ 2]  822 	ldw y,YTEMP
      00A0F1 EF 02            [ 2]  823 	ldw (2,x),y ; vector address 
      00A0F3 90 5F            [ 1]  824 	clrw y 
      00A0F5 FF               [ 2]  825 	ldw (x),y   ; as a double 
      00A0F6 CD 9E 73         [ 4]  826 	call EESTORE 
      00A0F9 90 93            [ 1]  827 	ldw y,x 
      00A0FB 90 EE 02         [ 2]  828 	ldw y,(2,y) ; bits 15..0 int vector 
      00A0FE 1D 00 06         [ 2]  829 	subw x,#3*CELLL 
      00A101 EF 04            [ 2]  830 	ldw (4,x),y 
      00A103 90 BE 26         [ 2]  831 	ldw y,YTEMP 
      00A106 72 A9 00 02      [ 2]  832 	addw y,#2 
      00A10A EF 02            [ 2]  833 	ldw (2,x),y 
      00A10C 90 5F            [ 1]  834 	clrw y 
      00A10E FF               [ 2]  835 	ldw (x),y 
      00A10F CD 9E 73         [ 4]  836 	call EESTORE
      00A112 1C 00 04         [ 2]  837 	addw x,#2*CELLL  
      00A115 81               [ 4]  838 9$: ret 
                                    839 
                                    840 
                                    841 ;------------------------
                                    842 ; Compile word to flash
                                    843 ; EE, (w -- )
                                    844 ;-----------------------
      00A116 A0 BC                  845 	.word LINK
                           002098   846 	LINK=.
      00A118 03                     847 	.byte 3
      00A119 45 45 2C               848 	.ascii "EE,"
      00A11C                        849 EE_COMMA:
      00A11C 1D 00 04         [ 2]  850 	subw x,#2*CELLL 
      00A11F 90 BE 1A         [ 2]  851 	ldw y,UCP
      00A122 90 89            [ 2]  852 	pushw y 
      00A124 EF 02            [ 2]  853 	ldw (2,x),y 
      00A126 90 5F            [ 1]  854 	clrw y 
      00A128 FF               [ 2]  855 	ldw (x),y
      00A129 CD 9E 73         [ 4]  856 	call EESTORE
      00A12C 90 85            [ 2]  857 	popw y 
      00A12E 72 A9 00 02      [ 2]  858 	addw y,#2
      00A132 90 BF 1A         [ 2]  859 	ldw UCP,y
      00A135 81               [ 4]  860 	ret 
                                    861 
                                    862 
                                    863 ;-------------------------
                                    864 ; Compile byte to flash 
                                    865 ; EEC, ( c -- )	
                                    866 ;-------------------------
      00A136 A1 18                  867 	.word LINK 
                           0020B8   868 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 120.
Hexadecimal [24-Bits]



      00A138 04                     869 	.byte 4 
      00A139 45 45 43 2C            870 	.ascii "EEC,"
      00A13D                        871 EE_CCOMMA:
      00A13D 1D 00 04         [ 2]  872 	subw x,#2*CELLL 
      00A140 90 BE 1A         [ 2]  873 	ldw y,UCP
      00A143 90 89            [ 2]  874 	pushw y 
      00A145 EF 02            [ 2]  875 	ldw (2,x),y 
      00A147 90 5F            [ 1]  876 	clrw y 
      00A149 FF               [ 2]  877 	ldw (x),y
      00A14A CD 9E 27         [ 4]  878 	call EECSTORE
      00A14D 90 85            [ 2]  879 	popw y 
      00A14F 90 5C            [ 1]  880 	incw y 
      00A151 90 BF 1A         [ 2]  881 	ldw UCP,y
      00A154 81               [ 4]  882 	ret 
                                    883 
                                    884 
                                    885 ;--------------------------
                                    886 ; copy FLASH block to ROWBUF
                                    887 ; ROW>BUF ( ud -- )
                                    888 ;--------------------------
      00A155 A1 38                  889 	.word LINK 
                           0020D7   890 	LINK=.
      00A157 07                     891 	.byte 7 
      00A158 52 4F 57 3E 42 55 46   892 	.ascii "ROW>BUF"
      00A15F                        893 ROW2BUF: 
      00A15F CD 9B E9         [ 4]  894 	call FPSTOR 
      00A162 A6 80            [ 1]  895 	ld a,#BLOCK_SIZE
      00A164 88               [ 1]  896 	push a 
      00A165 B4 36            [ 1]  897 	and a,PTR8 ; block align 
      00A167 B7 36            [ 1]  898 	ld PTR8,a
      00A169 90 AE 16 80      [ 2]  899 	ldw y,#ROWBUFF 
      00A16D 92 BC 00 34      [ 5]  900 1$: ldf a,[FPTR]
      00A171 90 F7            [ 1]  901 	ld (y),a
      00A173 CD 9D 63         [ 4]  902 	call INC_FPTR
      00A176 90 5C            [ 1]  903 	incw y 
      00A178 0A 01            [ 1]  904 	dec (1,sp)
      00A17A 26 F1            [ 1]  905 	jrne 1$ 
      00A17C 84               [ 1]  906 	pop a 
      00A17D 81               [ 4]  907 	ret 
                                    908 
                                    909 
                                    910 ;---------------------------
                                    911 ; copy ROWBUFF to flash 
                                    912 ; BUF>ROW ( ud -- )
                                    913 ; ud is row address as double 
                                    914 ;---------------------------
      00A17E A1 57                  915 	.word LINK 
                           002100   916 	LINK=.
      00A180 07                     917 	.byte 7 
      00A181 42 55 46 3E 52 4F 57   918 	.ascii "BUF>ROW" 
      00A188                        919 BUF2ROW:
      00A188 CD 87 A5         [ 4]  920 	call TBUF ; ( ud rb -- )
      00A18B CD 88 65         [ 4]  921 	call ROT 
      00A18E CD 88 65         [ 4]  922 	call ROT  ; ( rb ud -- )
      00A191 CD 9F 61         [ 4]  923 	call write_row 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 121.
Hexadecimal [24-Bits]



      00A194 81               [ 4]  924 	ret 
                                    925 
                                    926 ;---------------------------------
                                    927 ; how many byte free in that row 
                                    928 ; RFREE ( a -- n )
                                    929 ; a is least byte of target address
                                    930 ;----------------------------------
      00A195 A1 80                  931 	.word LINK 
                           002117   932 	LINK=.
      00A197 05                     933 	.byte 5 
      00A198 52 46 52 45 45         934 	.ascii "RFREE"
      00A19D                        935 RFREE:
      00A19D E6 01            [ 1]  936 	ld a,(1,x)
      00A19F A4 7F            [ 1]  937 	and a,#BLOCK_SIZE-1 
      00A1A1 B7 26            [ 1]  938 	ld YTEMP,a 
      00A1A3 A6 80            [ 1]  939 	ld a,#BLOCK_SIZE 
      00A1A5 B0 26            [ 1]  940 	sub a,YTEMP 
      00A1A7 90 5F            [ 1]  941 	clrw y 
      00A1A9 90 97            [ 1]  942 	ld yl,a
      00A1AB FF               [ 2]  943 	ldw (x),y 
      00A1AC 81               [ 4]  944 	ret 
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
      00A1AD A1 97                  955 	.word LINK 
                           00212F   956 	LINK=. 
      00A1AF 06                     957 	.byte 6
      00A1B0 52 41 4D 3E 45 45      958 	.ascii "RAM>EE"
                                    959 	
      00A1B6                        960 RAM2EE:
                                    961 ; copy ud on top 
      00A1B6 90 93            [ 1]  962 	ldw y,x 
      00A1B8 90 EE 06         [ 2]  963 	ldw y,(6,y) ; LSW of ud  
      00A1BB 90 BF 26         [ 2]  964 	ldw YTEMP,y 
      00A1BE 90 93            [ 1]  965 	ldw y,x 
      00A1C0 90 EE 04         [ 2]  966 	ldw y,(4,y)  ; MSW of ud 
      00A1C3 1D 00 04         [ 2]  967 	subw x,#2*CELLL 
      00A1C6 FF               [ 2]  968 	ldw (x),y 
      00A1C7 90 BE 26         [ 2]  969 	ldw y,YTEMP 
      00A1CA EF 02            [ 2]  970 	ldw (2,x),y 
      00A1CC CD A1 5F         [ 4]  971 	call ROW2BUF 
      00A1CF 90 93            [ 1]  972 	ldw y,x 
      00A1D1 90 EE 06         [ 2]  973 	ldw y,(6,y)
      00A1D4 90 89            [ 2]  974 	pushw y ; udl 
      00A1D6 90 9F            [ 1]  975 	ld a,yl
      00A1D8 A4 7F            [ 1]  976 	and a,#BLOCK_SIZE-1 
      00A1DA 90 5F            [ 1]  977 	clrw y 
      00A1DC 90 97            [ 1]  978 	ld yl,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 122.
Hexadecimal [24-Bits]



      00A1DE 72 A9 16 80      [ 2]  979 	addw y,#ROWBUFF 
      00A1E2 1D 00 02         [ 2]  980 	subw x,#CELLL 
      00A1E5 FF               [ 2]  981 	ldw (x),y  
      00A1E6 CD 86 B1         [ 4]  982 	call SWAPP ;  ( ud a ra u -- )
      00A1E9 CD 85 B4         [ 4]  983 	call RFROM  
      00A1EC CD A1 9D         [ 4]  984 	call RFREE 
      00A1EF CD 8A 30         [ 4]  985 	call MIN
      00A1F2 CD 86 A1         [ 4]  986 	call DUPP 
      00A1F5 CD 86 6A         [ 4]  987 	call TOR  
      00A1F8 CD 8D 8B         [ 4]  988 	call CMOVE
      00A1FB CD A1 88         [ 4]  989 	call BUF2ROW 
      00A1FE CD 85 B4         [ 4]  990 	call RFROM 
      00A201 81               [ 4]  991 	ret 
                                    992 
                                    993 
                                    994 ;--------------------------
                                    995 ; expand 16 bit address 
                                    996 ; to 32 bit address 
                                    997 ; FADDR ( a -- ud )
                                    998 ;--------------------------
      00A202 A1 AF                  999 	.word LINK 
                           002184  1000 	LINK=. 
      00A204 05                    1001 	.byte 5 
      00A205 46 41 44 44 52        1002 	.ascii "FADDR"
      00A20A                       1003 FADDR:
      00A20A CC 8C 61         [ 2] 1004 	jp ZERO 
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
      00A20D A2 04                 1020 	.word LINK 
                           00218F  1021 	LINK=.
      00A20F 05                    1022 	.byte 5 
      00A210 46 4D 4F 56 45        1023 	.ascii "FMOVE" 
      00A215                       1024 FMOVE:
      00A215 CD 87 B7         [ 4] 1025 	call TFLASH 
      00A218 CD 85 63         [ 4] 1026 	CALL AT 
      00A21B CD 85 18         [ 4] 1027 	CALL QBRAN 
      00A21E A2 99                 1028 	.word no_move  
      00A220 CD 88 06         [ 4] 1029 	call CPP
      00A223 CD 85 63         [ 4] 1030 	call AT  
      00A226 CD 86 A1         [ 4] 1031 	call DUPP ; ( udl udl -- )
      00A229 CD 87 EA         [ 4] 1032 	call CNTXT 
      00A22C CD 85 63         [ 4] 1033 	call AT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 123.
Hexadecimal [24-Bits]



      00A22F CD 84 EF         [ 4] 1034 	call DOLIT 
      00A232 00 02                 1035 	.word 2 
      00A234 CD 89 50         [ 4] 1036 	call SUBB ; ( udl udl a -- )
      00A237 CD 86 B1         [ 4] 1037 	call SWAPP 
      00A23A CD A2 0A         [ 4] 1038 	call FADDR 
      00A23D CD 88 65         [ 4] 1039 	call ROT  ; ( udl ud a -- )
      00A240 CD 86 A1         [ 4] 1040 	call DUPP 
      00A243 CD 86 6A         [ 4] 1041 	call TOR    ; R: a 
      00A246                       1042 FMOVE2: 
      00A246 CD 8D 3E         [ 4] 1043 	call HERE 
      00A249 CD 85 C5         [ 4] 1044 	call RAT 
      00A24C CD 89 50         [ 4] 1045 	call SUBB ; (udl ud a wl -- )
      00A24F                       1046 next_row:
      00A24F CD 86 A1         [ 4] 1047 	call DUPP 
      00A252 CD 86 6A         [ 4] 1048 	call TOR  ; ( udl ud a wl -- ) R: a wl
      00A255 CD A1 B6         [ 4] 1049 	call RAM2EE ; ( udl a u -- udl u2 ) u2 is byte written to FLASH 
      00A258 CD 86 A1         [ 4] 1050 	call DUPP 
      00A25B CD 86 6A         [ 4] 1051 	call TOR
      00A25E CD 88 C6         [ 4] 1052 	call PLUS  ; ( udl+ ) 
      00A261 CD 86 A1         [ 4] 1053 	call DUPP 
      00A264 CD 8C 61         [ 4] 1054 	call ZERO   ; ( udl+ ud -- )
      00A267 CD 85 B4         [ 4] 1055 	call RFROM  ; ( udl+ ud u2  R: a wl ) 
      00A26A CD 85 B4         [ 4] 1056 	call RFROM  ; ( udl+ ud u2 wl R: a ) 
      00A26D CD 86 C9         [ 4] 1057 	call OVER   ; ( udl+ ud u2 wl u2 -- )
      00A270 CD 89 50         [ 4] 1058 	call SUBB  ; ( udl+ ud u2 wl- R: a )
      00A273 CD 86 A1         [ 4] 1059 	call DUPP 
      00A276 CD 85 18         [ 4] 1060 	call QBRAN
      00A279 A2 92                 1061 	.word fmove_done 
      00A27B CD 86 B1         [ 4] 1062 	call SWAPP  ; ( udl+ ud wl- u2 R: a )
      00A27E CD 85 B4         [ 4] 1063 	call RFROM ; ( udl+ ud wl- u2 a -- ) 
      00A281 CD 88 C6         [ 4] 1064 	call PLUS  ; ( udl+2 ud wl- a+ )
      00A284 CD 86 A1         [ 4] 1065 	call DUPP 
      00A287 CD 86 6A         [ 4] 1066 	call TOR   ; ( udl+2 ud wl- a+ ) R: a+
      00A28A CD 86 B1         [ 4] 1067 	call SWAPP 
      00A28D CD 85 34         [ 4] 1068 	call BRAN
      00A290 A2 4F                 1069 	.word next_row  
      00A292                       1070 fmove_done:	
      00A292 CD 85 B4         [ 4] 1071 	call RFROM  ; ( -- udl+ ud u2 wl- a  )
      00A295 1C 00 0A         [ 2] 1072 	addw x,#5*CELLL ; (  -- cp+ ) new CP 
      00A298 81               [ 4] 1073  	ret  
      00A299                       1074 no_move:
      00A299 CD 8C 61         [ 4] 1075 	call ZERO
      00A29C 81               [ 4] 1076 	ret 
                                   1077 
                                   1078 ;------------------------------------------
                                   1079 ; adjust pointers after **FMOVE** operetion.
                                   1080 ; UPDAT-PTR ( cp+ -- )
                                   1081 ; cp+ is new CP position after FMOVE 
                                   1082 ;-------------------------------------------
      00A29D A2 0F                 1083 	.word LINK 
                           00221F  1084 	LINK=.
      00A29F 09                    1085 	.byte 9
      00A2A0 55 50 44 41 54 2D 50  1086 	.ascii "UPDAT-PTR" 
             54 52
      00A2A9                       1087 UPDATPTR:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 124.
Hexadecimal [24-Bits]



                                   1088 ;reset VP to previous position  
      00A2A9 CD 9C 63         [ 4] 1089 	call EEPVP 
      00A2AC CD 86 97         [ 4] 1090 	call DROP 
      00A2AF CD 85 63         [ 4] 1091 	call AT
      00A2B2 CD 87 F8         [ 4] 1092 	call VPP 
      00A2B5 CD 85 51         [ 4] 1093 	call STORE
                                   1094 ;update CONTEXT and LAST 
      00A2B8 CD 9C 4D         [ 4] 1095 	call EEPCP 
      00A2BB CD 86 97         [ 4] 1096 	call DROP
      00A2BE CD 85 63         [ 4] 1097 	call AT
      00A2C1 CD 84 EF         [ 4] 1098 	call DOLIT 
      00A2C4 00 02                 1099 	.word 2 
      00A2C6 CD 88 C6         [ 4] 1100 	call PLUS 
      00A2C9 CD 86 A1         [ 4] 1101 	call DUPP 
      00A2CC CD 87 EA         [ 4] 1102 	call CNTXT 
      00A2CF CD 85 51         [ 4] 1103 	call STORE
      00A2D2 CD 88 16         [ 4] 1104 	call LAST
      00A2D5 CD 85 51         [ 4] 1105 	call STORE 
      00A2D8 CD 9C 7D         [ 4] 1106 	call UPDATLAST 
                                   1107 ;update CP 
      00A2DB CD 88 06         [ 4] 1108 	call CPP 
      00A2DE CD 85 51         [ 4] 1109 	call STORE
      00A2E1 CD 9C A6         [ 4] 1110 	call UPDATCP 
      00A2E4 81               [ 4] 1111 	ret 
                                   1112 
                                   1113 ;-----------------------------
                                   1114 ; move interrupt sub-routine
                                   1115 ; in flash memory
                                   1116 ;----------------------------- 
      00A2E5 A2 9F                 1117 	.word LINK 
                           002267  1118 	LINK=. 
      00A2E7 06                    1119 	.byte 6
      00A2E8 49 46 4D 4F 56 45     1120 	.ascii "IFMOVE" 
      00A2EE                       1121 IFMOVE:
      00A2EE CD 87 B7         [ 4] 1122 	call TFLASH 
      00A2F1 CD 85 63         [ 4] 1123 	CALL AT 
      00A2F4 CD 85 18         [ 4] 1124 	CALL QBRAN 
      00A2F7 A2 99                 1125 	.word no_move 
      00A2F9 CD 88 06         [ 4] 1126 	call CPP 
      00A2FC CD 85 63         [ 4] 1127 	call AT 
      00A2FF CD 86 A1         [ 4] 1128 	call DUPP ; ( udl udl -- )
      00A302 CD 9C 63         [ 4] 1129 	call EEPVP 
      00A305 CD 86 97         [ 4] 1130 	call DROP
      00A308 CD 85 63         [ 4] 1131 	call AT  ; ( udl udl a )
      00A30B CD 86 6A         [ 4] 1132 	call TOR 
      00A30E CD A2 0A         [ 4] 1133 	call FADDR
      00A311 CD 85 C5         [ 4] 1134 	call RAT ; ( udl ud a -- ) R: a 
      00A314 CC A2 46         [ 2] 1135 	jp FMOVE2 
                                   1136 
                                   1137 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 125.
Hexadecimal [24-Bits]



                           000001  4475 .if WANT_SCALING_CONST 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 126.
Hexadecimal [24-Bits]



                                   4476         .include "const_ratio.asm"
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
      00A317 A2 E7                   34         .word LINK 
                           002299    35         LINK=.
      00A319 02                      36         .byte 2
      00A31A 50 49                   37         .ascii "PI" 
      00A31C                         38 PII:
      00A31C 1D 00 04         [ 2]   39         subw x,#2*CELLL 
      00A31F 90 AE 01 63      [ 2]   40         ldw y,#355 
      00A323 EF 02            [ 2]   41         ldw (2,x),y 
      00A325 90 AE 00 71      [ 2]   42         ldw y,#113 
      00A329 FF               [ 2]   43         ldw (x),y 
      00A32A 81               [ 4]   44         ret 
                                     45 
                                     46 ;      SQRT2 ( -- 19601  13860 )
                                     47 ; precision: 1.5e-9 
                                     48 ; usage example to compute Voltage peek to peek from Vrms 
                                     49 ; : VPP SQRT2 */ 2 * ;
                                     50 ;
      00A32B A3 19                   51         .word LINK 
                           0022AD    52         LINK=.
      00A32D 05                      53         .byte 5 
      00A32E 53 51 52 54 32          54         .ascii "SQRT2" 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 127.
Hexadecimal [24-Bits]



      00A333                         55 SQRT2:
      00A333 1D 00 04         [ 2]   56         subw x,#2*CELLL 
      00A336 90 AE 4C 91      [ 2]   57         ldw y,#19601 
      00A33A EF 02            [ 2]   58         ldw (2,x),y 
      00A33C 90 AE 36 24      [ 2]   59         ldw y,#13860 
      00A340 FF               [ 2]   60         ldw (x),y 
      00A341 81               [ 4]   61         ret 
                                     62 
                                     63 ;   SQRT3 ( -- 18817 10864 )
                                     64 ; precision: 1.1e-9
                                     65 ;
      00A342 A3 2D                   66         .word LINK 
                           0022C4    67         LINK=.
      00A344 05                      68         .byte 5
      00A345 53 51 52 54 33          69         .ascii "SQRT3" 
      00A34A                         70 SQRT3: 
      00A34A 1D 00 04         [ 2]   71     subw x,#2*CELLL 
      00A34D 90 AE 49 81      [ 2]   72     ldw y,#18817 
      00A351 EF 02            [ 2]   73     ldw (2,x),y 
      00A353 90 AE 2A 70      [ 2]   74     ldw y,#10864 
      00A357 FF               [ 2]   75     ldw (x),y 
      00A358 81               [ 4]   76     ret 
                                     77 
                                     78 ;   E ( -- 28667 10546 )
                                     79 ; precision: 5.5e-9 
                                     80 ; natural log base 
      00A359 A3 44                   81         .word LINK 
                           0022DB    82         LINK=.
      00A35B 01                      83         .byte 1
      00A35C 45                      84         .ascii "E" 
      00A35D                         85 ENEPER:
      00A35D 1D 00 04         [ 2]   86     subw x,#2*CELLL 
      00A360 90 AE 6F FB      [ 2]   87     ldw y,#28667 
      00A364 EF 02            [ 2]   88     ldw (2,x),y 
      00A366 90 AE 29 32      [ 2]   89     ldw y,#10546 
      00A36A FF               [ 2]   90     ldw (x),y 
      00A36B 81               [ 4]   91     ret 
                                     92 
                                     93 ;   SQRT10 ( -- 22936 7253 )
                                     94 ; precision: 5.7e-9 
      00A36C A3 5B                   95         .word LINK 
                           0022EE    96         LINK=.
      00A36E 06                      97         .byte 6 
      00A36F 53 51 52 54 31 30       98         .ascii "SQRT10" 
      00A375                         99 SQRT10:
      00A375 1D 00 04         [ 2]  100     subw x,#2*CELLL
      00A378 90 AE 59 98      [ 2]  101     ldw y,#22936 
      00A37C EF 02            [ 2]  102     ldw (2,x),y 
      00A37E 90 AE 1C 55      [ 2]  103     ldw y,#7253
      00A382 FF               [ 2]  104     ldw (x),y 
      00A383 81               [ 4]  105     ret 
                                    106 
                                    107 ;   12RT2 ( -- 26797 25293 )
                                    108 ; precision: 1.0e-9 
                                    109 ; used in music to compute well tempered scale
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 128.
Hexadecimal [24-Bits]



      00A384 A3 6E                  110         .word LINK 
                           002306   111         LINK=. 
      00A386 05                     112         .byte 5 
      00A387 31 32 52 54 32         113         .ascii "12RT2"
      00A38C                        114 RT12_2:
      00A38C 1D 00 04         [ 2]  115     subw x,#2*CELLL 
      00A38F 90 AE 68 AD      [ 2]  116     ldw y,#26797
      00A393 EF 02            [ 2]  117     ldw (2,x),y 
      00A395 90 AE 62 CD      [ 2]  118     ldw y,#25293
      00A399 FF               [ 2]  119     ldw (x),y 
      00A39A 81               [ 4]  120     ret 
                                    121 
                                    122 ;   LOG2s ( -- 2040 11103 )
                                    123 ; log(2)/1.6384
                                    124 ; precision: 1.1e-8
      00A39B A3 86                  125         .word LINK 
                           00231D   126         LINK=.
      00A39D 05                     127         .byte 5 
      00A39E 4C 4F 47 32 53         128         .ascii "LOG2S" 
      00A3A3                        129 LOG2S:
      00A3A3 1D 00 04         [ 2]  130     subw x,#2*CELLL
      00A3A6 90 AE 07 F8      [ 2]  131     ldw y,#2040 
      00A3AA EF 02            [ 2]  132     ldw (2,x),y 
      00A3AC 90 AE 2B 5F      [ 2]  133     ldw y,#11103 
      00A3B0 FF               [ 2]  134     ldw (x),y 
      00A3B1 81               [ 4]  135     ret 
                                    136 
                                    137 ;   LN2 ( -- 485 11464 )
                                    138 ; ln(2)/16.384 
                                    139 ; precision: 1.0e-7 
      00A3B2 A3 9D                  140         .word LINK 
                           002334   141         LINK=.
      00A3B4 04                     142         .byte 4 
      00A3B5 4C 4E 32 53            143         .ascii "LN2S" 
      00A3B9                        144 LN2S: 
      00A3B9 1D 00 04         [ 2]  145     subw x,#2*CELLL
      00A3BC 90 AE 01 E5      [ 2]  146     ldw y,#485
      00A3C0 EF 02            [ 2]  147     ldw (2,x),y 
      00A3C2 90 AE 2C C8      [ 2]  148     ldw y,#11464 
      00A3C6 FF               [ 2]  149     ldw (x),y 
      00A3C7 81               [ 4]  150     ret 
                                    151 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 129.
Hexadecimal [24-Bits]



                                   4477 .endif
                           000001  4478 .if WANT_CONST_TABLE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 130.
Hexadecimal [24-Bits]



                                   4479         .include "ctable.asm"
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
      00A3C8 A3 B4                   34     .word LINK 
                           00234A    35     LINK=.
      00A3CA 06                      36     .byte 6
      00A3CB 43 41 4C 4C 4F 54       37     .ascii "CALLOT"
      00A3D1                         38 CALLOT:
      00A3D1 CD 88 06         [ 4]   39     CALL CPP
      00A3D4 CD 86 A1         [ 4]   40     CALL DUPP 
      00A3D7 CD 85 63         [ 4]   41     CALL AT 
      00A3DA CD 86 6A         [ 4]   42     CALL TOR 
      00A3DD CD 8C D1         [ 4]   43     CALL PSTOR 
      00A3E0 CD 9C A6         [ 4]   44     CALL UPDATCP 
      00A3E3 CD 85 B4         [ 4]   45     CALL RFROM
      00A3E6 CC 8C 61         [ 2]   46     JP ZERO 
                                     47 
                                     48 ;------------------------------
                                     49 ; create constants bytes table 
                                     50 ; in persistant memory
                                     51 ;  CTABLE ( n+ -- ad ; <string> )
                                     52 ; n+ bytes reserved 
                                     53 ;-----------------------------
      00A3E9 A3 CA                   54     .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 131.
Hexadecimal [24-Bits]



                           00236B    55     LINK=.
      00A3EB 06                      56     .byte 6
      00A3EC 43 54 41 42 4C 45       57     .ascii "CTABLE"
      00A3F2                         58 CTABLE:
      00A3F2 CD A3 D1         [ 4]   59     CALL CALLOT     
      00A3F5 CC 99 A8         [ 2]   60     JP DCONST 
                                     61      
                                     62 
                                     63 ;--------------------------------
                                     64 ; create constants words table 
                                     65 ; in persistant memory 
                                     66 ; WTABLE ( n+ -- ad ; <string> )
                                     67 ; n+  words reserved  
                                     68 ;--------------------------------
      00A3F8 A3 EB                   69     .word LINK 
                           00237A    70     LINK=.
      00A3FA 06                      71     .byte 6
      00A3FB 57 54 41 42 4C 45       72     .ascii "WTABLE"
      00A401                         73 WTABLE:
      00A401 CD 8B E8         [ 4]   74     CALL CELLS  
      00A404 CD A3 D1         [ 4]   75     CALL CALLOT 
      00A407 CC 99 A8         [ 2]   76     JP DCONST 
                                     77 
                                     78 ;---------------------------------
                                     79 ; stack an element of CTABLE 
                                     80 ; CTABL@ ( u ad -- c )
                                     81 ; u element order {0..size-1}
                                     82 ; a|ad table address 
                                     83 ;--------------------------------
      00A40A A3 FA                   84     .word LINK 
                           00238C    85     LINK=.
      00A40C 06                      86     .byte 6
      00A40D 43 54 41 42 4C 40       87     .ascii "CTABL@" 
      00A413                         88 CTAT:
      00A413 CD 9B E9         [ 4]   89     call FPSTOR 
      00A416 CD 9D 7B         [ 4]   90     call PTRPLUS 
      00A419 CC 9D B8         [ 2]   91     jp EE_CREAD 
                                     92 
                                     93 ;---------------------------------
                                     94 ; stack an element of WTABLE 
                                     95 ; WTABL@ ( u ud -- w )
                                     96 ; u is element order {0..size-1}
                                     97 ; a|ud table address 
                                     98 ;----------------------------------
      00A41C A4 0C                   99     .word LINK 
                           00239E   100     LINK=.
      00A41E 06                     101     .byte 6
      00A41F 57 54 41 42 4C 40      102     .ascii "WTABL@" 
      00A425                        103 WTAT:
      00A425 CD 9B E9         [ 4]  104     call FPSTOR 
      00A428 CD 8B E8         [ 4]  105     call CELLS 
      00A42B CD 9D 7B         [ 4]  106     call PTRPLUS 
      00A42E CD 9D 96         [ 4]  107     call EE_READ 
      00A431 81               [ 4]  108     ret 
                                    109 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 132.
Hexadecimal [24-Bits]



                                    110 ;--------------------------
                                    111 ; tool to initialize character table 
                                    112 ; CTINIT ( ad -- )
                                    113 ; ad is table address 
                                    114 ;--------------------------
      00A432 A4 1E                  115     .word LINK 
                           0023B4   116     LINK=.
      00A434 06                     117     .byte 6 
      00A435 43 54 49 4E 49 54      118     .ascii "CTINIT"
      00A43B                        119 CTINIT:
      00A43B CD 9B E9         [ 4]  120     CALL FPSTOR
      00A43E CD 9D 27         [ 4]  121     CALL UNLOCK
      00A441 CD 8C 61         [ 4]  122     CALL ZERO 
      00A444 CD 8B F5         [ 4]  123 1$: CALL ONEP 
      00A447 CD 86 A1         [ 4]  124     CALL DUPP 
      00A44A CD A4 97         [ 4]  125     CALL INTQ 
      00A44D CD 85 18         [ 4]  126     CALL QBRAN 
      00A450 A4 5A                  127     .word 2$
      00A452 CD 9D D2         [ 4]  128     call WR_BYTE 
      00A455 CD 85 34         [ 4]  129     CALL BRAN 
      00A458 A4 44                  130     .word 1$ 
      00A45A CD 88 A6         [ 4]  131 2$: CALL DDROP 
      00A45D CD 9D 4F         [ 4]  132     CALL LOCK 
      00A460 81               [ 4]  133     ret 
                                    134 
                                    135 ;--------------------------
                                    136 ; tool to initialize word table 
                                    137 ; WTINIT ( ad -- )
                                    138 ; ad is table address 
                                    139 ;--------------------------
      00A461 A4 34                  140     .word LINK 
                           0023E3   141     LINK=.
      00A463 06                     142     .byte 6 
      00A464 57 54 49 4E 49 54      143     .ascii "WTINIT"
      00A46A                        144 WTINIT:
      00A46A CD 9B E9         [ 4]  145     CALL FPSTOR
      00A46D CD 9D 27         [ 4]  146     CALL UNLOCK
      00A470 CD 8C 61         [ 4]  147     CALL ZERO 
      00A473 CD 8B F5         [ 4]  148 1$: CALL ONEP 
      00A476 CD 86 A1         [ 4]  149     CALL DUPP
      00A479 CD A4 97         [ 4]  150     CALL INTQ
      00A47C CD 85 18         [ 4]  151     CALL QBRAN 
      00A47F A4 89                  152     .word 2$
      00A481 CD 9D F7         [ 4]  153     call WR_WORD 
      00A484 CD 85 34         [ 4]  154     CALL BRAN 
      00A487 A4 73                  155     .word 1$ 
      00A489 CD 88 A6         [ 4]  156 2$: CALL DDROP 
      00A48C CD 9D 4F         [ 4]  157     CALL LOCK 
      00A48F 81               [ 4]  158     ret 
                                    159 
                                    160 ;------------------------
                                    161 ; Prompted input for integer 
                                    162 ; display n+ in bracket and
                                    163 ; '?' 
                                    164 ; [N]? ( n+ -- a )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 133.
Hexadecimal [24-Bits]



                                    165 ;------------------------
      00A490 A4 63                  166     .word LINK 
                           002412   167     LINK=.
      00A492 04                     168     .byte 4
      00A493 5B 4E 5D 3F            169     .ascii "[N]?" 
      00A497                        170 INTQ:
      00A497 CD 8F D9         [ 4]  171     CALL CR 
      00A49A CD 84 EF         [ 4]  172     call DOLIT 
      00A49D 00 5B                  173     .word '[
      00A49F CD 84 B6         [ 4]  174     CALL EMIT 
      00A4A2 CD 90 80         [ 4]  175     CALL DOT 
      00A4A5 CD 90 06         [ 4]  176     CALL  DOTQP
      00A4A8 03                     177     .byte 3
      00A4A9 5D 3F 20               178     .ascii "]? " 
      00A4AC CD 94 10         [ 4]  179     CALL QUERY 
      00A4AF CD 92 3B         [ 4]  180     call TOKEN 
      00A4B2 CC A5 40         [ 2]  181     jp NUMBQ
                                    182 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 134.
Hexadecimal [24-Bits]



                                   4480 .endif
                           000001  4481 .if WANT_DOUBLE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 135.
Hexadecimal [24-Bits]



                                   4482         .include "double.asm"
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
                                     28 ; check for negative sign 
                                     29 ; ajust pointer and cntr 
      00A4B5                         30 nsign: ; a cntr -- a cntr f 
      00A4B5 CD 8C 61         [ 4]   31     CALL ZERO 
      00A4B8 CD 86 6A         [ 4]   32     CALL TOR  ; R: sign 
      00A4BB CD 86 6A         [ 4]   33     CALL TOR  ; R: sign cntr 
      00A4BE CD 86 A1         [ 4]   34     CALL DUPP 
      00A4C1 CD 85 81         [ 4]   35     CALL CAT 
      002444                         36     _DOLIT '-'
      00A4C4 CD 84 EF         [ 4]    1     CALL DOLIT 
      00A4C7 00 2D                    2     .word '-' 
      00A4C9 CD 89 78         [ 4]   37     CALL EQUAL 
      00244C                         38     _QBRAN nsign1 
      00A4CC CD 85 18         [ 4]    1     CALL QBRAN
      00A4CF A4 E6                    2     .word nsign1
      00A4D1 CD 8B F5         [ 4]   39     CALL ONEP ; a+ 
      00A4D4 CD 85 B4         [ 4]   40     CALL RFROM 
      00A4D7 CD 8C 02         [ 4]   41     CALL ONEM ; cntr-
      00A4DA CD 85 B4         [ 4]   42     CALL RFROM ; sign 
      00A4DD CD 88 F3         [ 4]   43     CALL INVER ; -1
      00A4E0 CD 86 6A         [ 4]   44     CALL TOR   ; R: sign 
      00A4E3 CD 86 6A         [ 4]   45     CALL TOR   ; R: cntr 
      00A4E6                         46 nsign1:
      00A4E6 CD 85 B4         [ 4]   47     CALL RFROM 
      00A4E9 CD 85 B4         [ 4]   48     CALL RFROM 
      00A4EC 81               [ 4]   49     RET 
                                     50 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 136.
Hexadecimal [24-Bits]



                                     51 
                                     52 ; get all digits in row 
                                     53 ; stop at first non-digit or end of string 
                                     54 ; ( dlo dhi a cntr -- dlo dhi [ a+ cntr- | a+ 0 ] )
      00A4ED                         55 parse_digits:
      00A4ED                         56 1$:
      00A4ED CD 86 A1         [ 4]   57     CALL DUPP 
      002470                         58     _QBRAN 5$ 
      00A4F0 CD 85 18         [ 4]    1     CALL QBRAN
      00A4F3 A5 35                    2     .word 5$
      00A4F5 CD 86 6A         [ 4]   59     CALL TOR   ; dlo dhi a R: cntr 
      00A4F8 CD 8D 27         [ 4]   60     CALL COUNT ; dlo dhi a+ char 
      00A4FB CD 87 67         [ 4]   61     CALL BASE 
      00A4FE CD 85 63         [ 4]   62     CALL AT 
      00A501 CD 8F 1F         [ 4]   63     CALL DIGTQ 
      002484                         64     _QBRAN 4$ ; not a digit
      00A504 CD 85 18         [ 4]    1     CALL QBRAN
      00A507 A5 2C                    2     .word 4$
      00A509 CD A8 76         [ 4]   65     CALL DTOR  ; dlo dhi R: cntr a+ c  
      00A50C CD 87 67         [ 4]   66     CALL BASE 
      00A50F CD 85 63         [ 4]   67     CALL AT 
      00A512 CD A7 04         [ 4]   68     CALL DSSTAR
      00A515 CD 85 B4         [ 4]   69     CALL RFROM 
      00A518 CD 8C 61         [ 4]   70     CALL ZERO 
      00A51B CD AB 37         [ 4]   71     CALL DPLUS 
      00A51E CD 85 B4         [ 4]   72     CALL RFROM  ; dlo dhi a+ 
      00A521 CD 85 B4         [ 4]   73     CALL RFROM ; dlo dhi a+ cntr 
      00A524 CD 8C 02         [ 4]   74     CALL ONEM 
      0024A7                         75     _BRAN 1$ ; dlo dhi a+ R: 
      00A527 CD 85 34         [ 4]    1     CALL BRAN 
      00A52A A4 ED                    2     .word 1$ 
      00A52C CD 86 97         [ 4]   76 4$: CALL DROP  ; dlo dhi a+ 
      00A52F CD 8C 02         [ 4]   77     CALL ONEM  ; unget char 
      00A532 CD 85 B4         [ 4]   78     CALL RFROM ; dlo dhi a+ cntr-
      00A535                         79 5$:
      00A535 81               [ 4]   80     RET 
                                     81 
                                     82 
                                     83 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     84 ;   NUMBER? (a -- s -1 |d -2 | a F )
                                     85 ;   convert string to integer 
                                     86 ;   double begin with '#' 
                                     87 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0024B6                         88     _HEADER NUMBQ,7,"NUMBER?"
      00A536 A4 92                    1         .word LINK 
                           0024B8     2         LINK=.
      00A538 07                       3         .byte 7  
      00A539 4E 55 4D 42 45 52 3F     4         .ascii "NUMBER?"
      00A540                          5         NUMBQ:
                                     89 ; save current base value 
      00A540 CD 87 67         [ 4]   90     CALL BASE 
      00A543 CD 85 63         [ 4]   91     CALL AT 
      00A546 CD 86 6A         [ 4]   92     CALL TOR 
                                     93 ; initialize integer to 0     
      00A549 1D 00 04         [ 2]   94     SUBW X,#4 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 137.
Hexadecimal [24-Bits]



      00A54C 90 5F            [ 1]   95     CLRW Y 
      00A54E FF               [ 2]   96     LDW (X),Y 
      00A54F EF 02            [ 2]   97     LDW (2,X),Y ; a 0 0 R: base  
      0024D1                         98     _DOLIT 2 
      00A551 CD 84 EF         [ 4]    1     CALL DOLIT 
      00A554 00 02                    2     .word 2 
      00A556 CD 8C BA         [ 4]   99     CALL PICK  ; a 0 0 a R: base    
      00A559 CD 8D 27         [ 4]  100     CALL COUNT ; a 0 0 a+ n 
                                    101 ; check for '#' double integer 
      00A55C CD 86 C9         [ 4]  102     CALL OVER  ; a 0 0 a+ n a+
      00A55F CD 85 81         [ 4]  103     CALL CAT   ; a 0 0 a+ n c 
      0024E2                        104     _DOLIT '#' ; a 0 0 a+ n c '#' 
      00A562 CD 84 EF         [ 4]    1     CALL DOLIT 
      00A565 00 23                    2     .word '#' 
      00A567 CD 89 78         [ 4]  105     CALL EQUAL 
      00A56A CD 86 6A         [ 4]  106     CALL TOR   ; a 0 0 a+ n R: base d? 
      00A56D CD 85 C5         [ 4]  107     CALL RAT   ; a 0 0 a+ n d? R: base d?
      0024F0                        108     _QBRAN NUMQ0
      00A570 CD 85 18         [ 4]    1     CALL QBRAN
      00A573 A5 81                    2     .word NUMQ0
                                    109 ; update a and count
      00A575 CD 86 B1         [ 4]  110     CALL SWAPP 
      00A578 CD 8B F5         [ 4]  111     CALL ONEP 
      00A57B CD 86 B1         [ 4]  112     CALL SWAPP 
      00A57E CD 8C 02         [ 4]  113     CALL ONEM  ; a 0 0 a+ n- R: base d?
                                    114 ; check for '$' hexadecimal  
      00A581                        115 NUMQ0: 
      00A581 CD 86 C9         [ 4]  116     CALL OVER   
      00A584 CD 85 81         [ 4]  117     CALL CAT   
      002507                        118     _DOLIT '$'
      00A587 CD 84 EF         [ 4]    1     CALL DOLIT 
      00A58A 00 24                    2     .word '$' 
      00A58C CD 89 78         [ 4]  119     CALL EQUAL ; a 0 0 a+ n- f  
      00250F                        120     _QBRAN NUMQ1 
      00A58F CD 85 18         [ 4]    1     CALL QBRAN
      00A592 A5 A3                    2     .word NUMQ1
      00A594 CD 8E F6         [ 4]  121     CALL HEX   ; switch to hexadecimal base 
                                    122 ; update a and count 
      00A597 CD 86 B1         [ 4]  123     CALL SWAPP 
      00A59A CD 8B F5         [ 4]  124     CALL ONEP 
      00A59D CD 86 B1         [ 4]  125     CALL SWAPP
      00A5A0 CD 8C 02         [ 4]  126     CALL ONEM ; a 0 0 a+ n-  R: base d?
                                    127 ; check for minus sign 
      00A5A3                        128 NUMQ1: 
      00A5A3 CD A4 B5         [ 4]  129     CALL nsign 
      00A5A6 CD 86 6A         [ 4]  130     CALL TOR ; R: base d? sign  
                                    131 ; check for end of string     
      00A5A9 CD 88 54         [ 4]  132     CALL QDUP    ; a dlo dhi a+ cntr R: base d? sign 
      00252C                        133     _QBRAN NUMQ4 ; yes , not a number 
      00A5AC CD 85 18         [ 4]    1     CALL QBRAN
      00A5AF A5 EE                    2     .word NUMQ4
      00A5B1 CD A4 ED         [ 4]  134     CALL parse_digits
      00A5B4 CD 88 54         [ 4]  135     CALL QDUP 
      00A5B7 CD 86 EA         [ 4]  136     CALL ZEQUAL  
      00253A                        137     _QBRAN NUMQ4 ; error not end of string  ( a dlo dhi a+ R: base d? sign )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 138.
Hexadecimal [24-Bits]



      00A5BA CD 85 18         [ 4]    1     CALL QBRAN
      00A5BD A5 EE                    2     .word NUMQ4
      00A5BF CD 86 97         [ 4]  138     CALL DROP  ; a dlo dhi 
      00A5C2 CD 85 B4         [ 4]  139     CALL RFROM  ; a dlo dhi sign 
      002545                        140     _QBRAN NUMQ3
      00A5C5 CD 85 18         [ 4]    1     CALL QBRAN
      00A5C8 A5 CD                    2     .word NUMQ3
      00A5CA CD 89 16         [ 4]  141     CALL DNEGA
      00A5CD                        142 NUMQ3: 
      00A5CD CD 88 65         [ 4]  143     CALL ROT ; dlo dhi a  R: base d?
      00A5D0 CD 86 97         [ 4]  144     CALL DROP
      002553                        145     _DOLIT -2  ; double return -2 flag 
      00A5D3 CD 84 EF         [ 4]    1     CALL DOLIT 
      00A5D6 FF FE                    2     .word -2 
      00A5D8 CD 85 B4         [ 4]  146     CALL RFROM ; dlo dhi d? R: base 
      00255B                        147     _TBRAN NUMQ8 
      00A5DB CD 85 26         [ 4]    1     CALL TBRAN 
      00A5DE A5 F7                    2     .word NUMQ8 
      00A5E0 CD 86 B1         [ 4]  148     CALL SWAPP 
      00A5E3 CD 86 97         [ 4]  149     CALL DROP
      00A5E6 CD 8B F5         [ 4]  150     CALL ONEP   ; single return -1 flag   
      002569                        151     _BRAN NUMQ8
      00A5E9 CD 85 34         [ 4]    1     CALL BRAN 
      00A5EC A5 F7                    2     .word NUMQ8 
      00A5EE                        152 NUMQ4: ; not end of string error , ( a dlo dhi a+ cntr R: base d? sign )
                           000001   153 .if WANT_FLOAT
      00A5EE CD 85 B4         [ 4]  154     CALL RFROM ; sign 
      00A5F1 CD 85 B4         [ 4]  155     CALL RFROM ; d? 
      00A5F4 CD AE DB         [ 4]  156     CALL FLOATQ ; ( a dlo dhi a+ cntr sign d? )    
                           000000   157 .else 
                                    158     ADDW X,#4 ; drop dhi a+  , ( a dlo R: base d? sign ) 
                                    159     ADDW SP,#4 ; drop d? sign  R: base 
                                    160     CLRW Y 
                                    161     LDW (X),Y ; dlo replaced by 0 ( -- a 0 R: base ) 
                                    162 .endif 
                                    163 ; restore original base value     
      00A5F7                        164 NUMQ8: 
      00A5F7 CD 85 B4         [ 4]  165     CALL RFROM 
      00A5FA CD 87 67         [ 4]  166     CALL BASE 
      00A5FD CD 85 51         [ 4]  167     CALL STORE 
      00A600 81               [ 4]  168     RET 
                                    169 
                                    170 
                                    171 
                                    172 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    173 ;   DABS ( d -- d )
                                    174 ;   absolute value of double
                                    175 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002581                        176     _HEADER DABS,4,"DABS"
      00A601 A5 38                    1         .word LINK 
                           002583     2         LINK=.
      00A603 04                       3         .byte 4  
      00A604 44 41 42 53              4         .ascii "DABS"
      00A608                          5         DABS:
      00A608 CD 86 A1         [ 4]  177     CALL DUPP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 139.
Hexadecimal [24-Bits]



      00A60B CD 86 D8         [ 4]  178     CALL ZLESS 
      00258E                        179     _QBRAN DABS1 
      00A60E CD 85 18         [ 4]    1     CALL QBRAN
      00A611 A6 16                    2     .word DABS1
      00A613 CD 89 16         [ 4]  180     CALL DNEGA 
      00A616                        181 DABS1:
      00A616 81               [ 4]  182     RET 
                                    183 
                                    184 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    185 ;  DSIGN ( d -- d f )
                                    186 ;  sign of double 
                                    187 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002597                        188     _HEADER DSIGN,5,"DSIGN"
      00A617 A6 03                    1         .word LINK 
                           002599     2         LINK=.
      00A619 05                       3         .byte 5  
      00A61A 44 53 49 47 4E           4         .ascii "DSIGN"
      00A61F                          5         DSIGN:
      00A61F A6 00            [ 1]  189     LD A,#0 
      00A621 90 93            [ 1]  190     LDW Y,X 
      00A623 90 FE            [ 2]  191     LDW Y,(Y)
      00A625 2A 02            [ 1]  192     JRPL DSIGN1
      00A627 A6 FF            [ 1]  193     LD A,#0XFF 
      00A629                        194 DSIGN1:
      00A629 1D 00 02         [ 2]  195     SUBW X,#2 
      00A62C F7               [ 1]  196     LD (X),A 
      00A62D E7 01            [ 1]  197     LD (1,X),A 
      00A62F 81               [ 4]  198     RET 
                                    199 
                                    200 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    201 ;   DS/MOD ( ud us - ur qud )
                                    202 ;   unsigned divide double by single 
                                    203 ;   return double quotient 
                                    204 ;   and single remainder 
                                    205 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0025B0                        206     _HEADER DSLMOD,6,"DS/MOD"
      00A630 A6 19                    1         .word LINK 
                           0025B2     2         LINK=.
      00A632 06                       3         .byte 6  
      00A633 44 53 2F 4D 4F 44        4         .ascii "DS/MOD"
      00A639                          5         DSLMOD:
      00A639 90 93            [ 1]  207         LDW     Y,X             ; stack pointer to Y
      00A63B FE               [ 2]  208         LDW     X,(X)           ; un
      00A63C BF 26            [ 2]  209         LDW     YTEMP,X         ; save un
      00A63E 93               [ 1]  210         LDW     X,Y
      00A63F 89               [ 2]  211         PUSHW   X               ; save stack pointer
      00A640 90 89            [ 2]  212         PUSHW   Y 
      00A642 EE 02            [ 2]  213         LDW     X,(2,X)           ; X=udh
      00A644 90 BE 26         [ 2]  214         LDW     Y,YTEMP         ; divisor 
      00A647 65               [ 2]  215         DIVW    X,Y 
      00A648 BF 24            [ 2]  216         LDW     XTEMP,X         ; QUOTIENT hi 
      00A64A 93               [ 1]  217         LDW     X,Y             ; remainder in X 
      00A64B 90 85            [ 2]  218         POPW    Y 
      00A64D 90 EE 04         [ 2]  219         LDW     Y,(4,Y)         ; Y=udl (offset before drop)
      00A650 A6 10            [ 1]  220         LD      A,#16           ; loop count
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 140.
Hexadecimal [24-Bits]



      00A652 90 58            [ 2]  221         SLLW    Y               ; udl shift udl into udh
      00A654                        222 DSLMOD3:
      00A654 59               [ 2]  223         RLCW    X               ; rotate udl bit into uhdh (= remainder)
      00A655 25 04            [ 1]  224         JRC     DSLMODa         ; if carry out of rotate
      00A657 B3 26            [ 2]  225         CPW     X,YTEMP         ; compare udh to un
      00A659 25 05            [ 1]  226         JRULT   DSLMOD4         ; can't subtract
      00A65B                        227 DSLMODa:
      00A65B 72 B0 00 26      [ 2]  228         SUBW    X,YTEMP         ; can subtract
      00A65F 98               [ 1]  229         RCF
      00A660                        230 DSLMOD4:
      00A660 8C               [ 1]  231         CCF                     ; quotient bit
      00A661 90 59            [ 2]  232         RLCW    Y               ; rotate into quotient, rotate out udl
      00A663 4A               [ 1]  233         DEC     A               ; repeat
      00A664 26 EE            [ 1]  234         JRNE    DSLMOD3           ; if A == 0
      00A666                        235 DSLMODb:
      00A666 BF 26            [ 2]  236         LDW     YTEMP,X         ; done, save remainder
      00A668 85               [ 2]  237         POPW    X               ; restore stack pointer
      00A669 EF 02            [ 2]  238         LDW     (2,X),Y           ; save quotient low 
      00A66B 90 BE 24         [ 2]  239         LDW     Y,XTEMP         ; quotient hi 
      00A66E FF               [ 2]  240         LDW     (X),Y           ; save quotient hi 
      00A66F 90 BE 26         [ 2]  241         LDW     Y,YTEMP         ; remainder onto stack
      00A672 EF 04            [ 2]  242         LDW     (4,X),Y
      00A674 81               [ 4]  243         RET 
                                    244 
                                    245 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    246 ;   D# ( d -- d )
                                    247 ;   extract least digit 
                                    248 ;   from double integer 
                                    249 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0025F5                        250     _HEADER DDIG,2,"D#"
      00A675 A6 32                    1         .word LINK 
                           0025F7     2         LINK=.
      00A677 02                       3         .byte 2  
      00A678 44 23                    4         .ascii "D#"
      00A67A                          5         DDIG:
      00A67A CD 87 67         [ 4]  251     CALL BASE 
      00A67D CD 85 63         [ 4]  252     CALL AT 
      00A680 CD A6 39         [ 4]  253     CALL DSLMOD
      00A683 CD 88 65         [ 4]  254     CALL ROT   
      00A686 CD 8E 1F         [ 4]  255     CALL DIGIT 
      00A689 CD 8E 6B         [ 4]  256     CALL HOLD 
      00A68C 81               [ 4]  257     RET 
                                    258 
                                    259 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    260 ;    D#S ( d -- s )
                                    261 ;   extract digit from double 
                                    262 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00260D                        263     _HEADER DDIGS,3,"D#S"
      00A68D A6 77                    1         .word LINK 
                           00260F     2         LINK=.
      00A68F 03                       3         .byte 3  
      00A690 44 23 53                 4         .ascii "D#S"
      00A693                          5         DDIGS:
      00A693 CD A6 7A         [ 4]  264     CALL    DDIG 
      00A696 CD 88 B1         [ 4]  265     CALL    DDUP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 141.
Hexadecimal [24-Bits]



      00A699 CD A7 FF         [ 4]  266     CALL    DZEQUAL
      00261C                        267     _QBRAN  DDIGS 
      00A69C CD 85 18         [ 4]    1     CALL QBRAN
      00A69F A6 93                    2     .word DDIGS
      00A6A1 CD 86 97         [ 4]  268     CALL    DROP 
      00A6A4 81               [ 4]  269     RET 
                                    270 
                                    271 
                                    272 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    273 ;   D. ( d -- )
                                    274 ;   display double integer 
                                    275 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002625                        276     _HEADER DDOT,2,"D."
      00A6A5 A6 8F                    1         .word LINK 
                           002627     2         LINK=.
      00A6A7 02                       3         .byte 2  
      00A6A8 44 2E                    4         .ascii "D."
      00A6AA                          5         DDOT:
      00A6AA CD 8F 97         [ 4]  277     CALL SPACE 
      00A6AD CD A6 1F         [ 4]  278     CALL DSIGN 
      00A6B0 CD 86 6A         [ 4]  279     CALL TOR
      00A6B3 CD 85 C5         [ 4]  280     CALL RAT 
      002636                        281     _QBRAN DDOT0
      00A6B6 CD 85 18         [ 4]    1     CALL QBRAN
      00A6B9 A6 BE                    2     .word DDOT0
      00A6BB CD 89 16         [ 4]  282     CALL DNEGA 
      00A6BE                        283 DDOT0:     
      00A6BE CD 8E 5B         [ 4]  284     CALL BDIGS 
      00A6C1 CD A6 93         [ 4]  285     CALL DDIGS 
      00A6C4 CD 85 B4         [ 4]  286     CALL RFROM 
      002647                        287     _QBRAN DDOT1 
      00A6C7 CD 85 18         [ 4]    1     CALL QBRAN
      00A6CA A6 D4                    2     .word DDOT1
      00264C                        288     _DOLIT '-' 
      00A6CC CD 84 EF         [ 4]    1     CALL DOLIT 
      00A6CF 00 2D                    2     .word '-' 
      00A6D1 CD 8E 6B         [ 4]  289     CALL HOLD 
      00A6D4                        290 DDOT1: 
      00A6D4 CD 8E C0         [ 4]  291     CALL EDIGS 
      00A6D7 CD 8F C1         [ 4]  292     CALL TYPES     
      00A6DA 81               [ 4]  293     RET 
                                    294 
                                    295 
                                    296 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    297 ;  UDS* ( ud u -- ud*u )
                                    298 ;  uint32*uint16 
                                    299 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00265B                        300     _HEADER UDSSTAR,4,"UDS*"
      00A6DB A6 A7                    1         .word LINK 
                           00265D     2         LINK=.
      00A6DD 04                       3         .byte 4  
      00A6DE 55 44 53 2A              4         .ascii "UDS*"
      00A6E2                          5         UDSSTAR:
      00A6E2 CD 86 6A         [ 4]  301     CALL TOR 
      00A6E5 CD 86 B1         [ 4]  302     CALL SWAPP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 142.
Hexadecimal [24-Bits]



      00A6E8 CD 85 C5         [ 4]  303     CALL RAT 
      00A6EB CD 8B 2A         [ 4]  304     CALL UMSTA ; udlo*u 
      00A6EE CD 88 65         [ 4]  305     CALL ROT 
      00A6F1 CD 85 B4         [ 4]  306     CALL RFROM 
      00A6F4 CD 8B 2A         [ 4]  307     CALL UMSTA ; udhi*u 
      00A6F7 CD 86 97         [ 4]  308     CALL DROP  ; drop overflow 
      00A6FA CD 88 C6         [ 4]  309     CALL PLUS  ; udlo*u+(uhi*u<<16)
      00A6FD 81               [ 4]  310     RET 
                                    311 
                                    312 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    313 ; multiply double by single 
                                    314 ; return double 
                                    315 ;  ( d u -- d )
                                    316 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00267E                        317     _HEADER DSSTAR,3,"DS*"
      00A6FE A6 DD                    1         .word LINK 
                           002680     2         LINK=.
      00A700 03                       3         .byte 3  
      00A701 44 53 2A                 4         .ascii "DS*"
      00A704                          5         DSSTAR:
                                    318 ;DSSTAR:
      00A704 CD 86 6A         [ 4]  319     CALL TOR
      00A707 CD A6 1F         [ 4]  320     CALL DSIGN 
      00A70A CD 88 84         [ 4]  321     CALL NROT 
      00A70D CD A6 08         [ 4]  322     CALL DABS
      00A710 CD 85 B4         [ 4]  323     CALL RFROM 
      00A713 CD A6 E2         [ 4]  324     CALL UDSSTAR  
      00A716 CD 88 65         [ 4]  325     CALL ROT 
      002699                        326     _QBRAN DSSTAR3 
      00A719 CD 85 18         [ 4]    1     CALL QBRAN
      00A71C A7 21                    2     .word DSSTAR3
      00A71E CD 89 16         [ 4]  327     CALL DNEGA 
      00A721                        328 DSSTAR3:
      00A721 81               [ 4]  329     RET 
                                    330 
                                    331 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    332 ;  2SWAP ( d1 d2 -- d2 d1 )
                                    333 ;  swap double 
                                    334 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0026A2                        335     _HEADER DSWAP,5,"2SWAP"
      00A722 A7 00                    1         .word LINK 
                           0026A4     2         LINK=.
      00A724 05                       3         .byte 5  
      00A725 32 53 57 41 50           4         .ascii "2SWAP"
      00A72A                          5         DSWAP:
      00A72A 90 93            [ 1]  336     LDW Y,X 
      00A72C 90 FE            [ 2]  337     LDW Y,(Y)
      00A72E 90 BF 26         [ 2]  338     LDW YTEMP,Y ; d2 hi 
      00A731 90 93            [ 1]  339     LDW Y,X 
      00A733 90 EE 02         [ 2]  340     LDW Y,(2,Y)
      00A736 90 BF 24         [ 2]  341     LDW XTEMP,Y  ; d2 lo 
      00A739 90 93            [ 1]  342     LDW Y,X 
      00A73B 90 EE 04         [ 2]  343     LDW Y,(4,Y)  ; d1 hi 
      00A73E FF               [ 2]  344     LDW (X),Y 
      00A73F 90 93            [ 1]  345     LDW Y,X
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 143.
Hexadecimal [24-Bits]



      00A741 90 EE 06         [ 2]  346     LDW Y,(6,Y)  ; d1 lo 
      00A744 EF 02            [ 2]  347     LDW (2,X),Y
      00A746 90 BE 26         [ 2]  348     LDW Y,YTEMP  
      00A749 EF 04            [ 2]  349     LDW (4,X),Y 
      00A74B 90 BE 24         [ 2]  350     LDW Y,XTEMP 
      00A74E EF 06            [ 2]  351     LDW (6,X),Y 
      00A750 81               [ 4]  352     RET 
                                    353 
                                    354 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    355 ;    DCLZ ( d -- u )
                                    356 ;    double count leading zeros
                                    357 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0026D1                        358     _HEADER DCLZ,4,"DCLZ"
      00A751 A7 24                    1         .word LINK 
                           0026D3     2         LINK=.
      00A753 04                       3         .byte 4  
      00A754 44 43 4C 5A              4         .ascii "DCLZ"
      00A758                          5         DCLZ:
      00A758 4F               [ 1]  359     CLR A 
      00A759 90 93            [ 1]  360     LDW Y,X 
      00A75B 90 FE            [ 2]  361     LDW Y,(Y)
      00A75D 2B 18            [ 1]  362     JRMI DCLZ8 ; no leading zero 
      00A75F 27 09            [ 1]  363     JREQ DCLZ4 ; >=16 
      00A761                        364 DCLZ1: ; <16
      00A761 90 58            [ 2]  365     SLLW Y
      00A763 4C               [ 1]  366     INC A 
      00A764 90 5D            [ 2]  367     TNZW Y 
      00A766 2B 0F            [ 1]  368     JRMI DCLZ8
      00A768 20 F7            [ 2]  369     JRA DCLZ1 
      00A76A                        370 DCLZ4:
      00A76A A6 10            [ 1]  371     LD A,#16 
      00A76C 90 93            [ 1]  372     LDW Y,X 
      00A76E 90 EE 02         [ 2]  373     LDW Y,(2,Y)
      00A771 2B 04            [ 1]  374     JRMI DCLZ8 
      00A773 26 EC            [ 1]  375     JRNE DCLZ1 
      00A775 AB 10            [ 1]  376     ADD A,#16
      00A777                        377 DCLZ8: 
      00A777 1C 00 02         [ 2]  378     ADDW X,#2 
      00A77A 90 5F            [ 1]  379     CLRW Y 
      00A77C 90 97            [ 1]  380     LD YL,A 
      00A77E FF               [ 2]  381     LDW (X),Y 
      00A77F 81               [ 4]  382     RET 
                                    383 
                                    384 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    385 ;   <2ROT ( d1 d2 d3 -- d3 d1 d2 )
                                    386 ;   rotate left doubles 
                                    387 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002700                        388     _HEADER NDROT,5,"<2ROT"
      00A780 A7 53                    1         .word LINK 
                           002702     2         LINK=.
      00A782 05                       3         .byte 5  
      00A783 3C 32 52 4F 54           4         .ascii "<2ROT"
      00A788                          5         NDROT:
                                    389 ; save d3 in temp 
      00A788 90 93            [ 1]  390     LDW Y,X 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 144.
Hexadecimal [24-Bits]



      00A78A 90 FE            [ 2]  391     LDW Y,(Y)
      00A78C 90 BF 26         [ 2]  392     LDW YTEMP,Y  ; d3 hi 
      00A78F 90 93            [ 1]  393     LDW Y,X 
      00A791 90 EE 02         [ 2]  394     LDW Y,(2,Y)
      00A794 90 BF 24         [ 2]  395     LDW XTEMP,Y  ; d3 lo 
                                    396 ; put d2 in d1 slot 
      00A797 90 93            [ 1]  397     LDW Y,X 
      00A799 90 EE 04         [ 2]  398     LDW Y,(4,Y) 
      00A79C FF               [ 2]  399     LDW (X),Y   ; d2 hi 
      00A79D 90 93            [ 1]  400     LDW Y,X 
      00A79F 90 EE 06         [ 2]  401     LDW Y,(6,Y)
      00A7A2 EF 02            [ 2]  402     LDW (2,X),Y ; d2 lo
                                    403 ; put d1 in d2 slot 
      00A7A4 90 93            [ 1]  404     LDW Y,X 
      00A7A6 90 EE 08         [ 2]  405     LDW Y,(8,Y) 
      00A7A9 EF 04            [ 2]  406     LDW (4,X),Y ; d1 hi 
      00A7AB 90 93            [ 1]  407     LDW Y,X 
      00A7AD 90 EE 0A         [ 2]  408     LDW Y,(10,Y)
      00A7B0 EF 06            [ 2]  409     LDW (6,X),Y  ; d1 lo 
                                    410 ; put d3 in d1 slot 
      00A7B2 90 BE 26         [ 2]  411     LDW Y,YTEMP 
      00A7B5 EF 08            [ 2]  412     LDW (8,X),Y  ; d3 hi 
      00A7B7 90 BE 24         [ 2]  413     LDW Y,XTEMP 
      00A7BA EF 0A            [ 2]  414     LDW (10,X),Y  ; d3 lo 
      00A7BC 81               [ 4]  415     RET 
                                    416 
                                    417 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    418 ;   2ROT ( d1 d2 d3 -- d2 d3 d1 )
                                    419 ;   rotate right doubles 
                                    420 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00273D                        421     _HEADER DROT,4,"2ROT"
      00A7BD A7 82                    1         .word LINK 
                           00273F     2         LINK=.
      00A7BF 04                       3         .byte 4  
      00A7C0 32 52 4F 54              4         .ascii "2ROT"
      00A7C4                          5         DROT:
                                    422 ; save d3 in temp 
      00A7C4 90 93            [ 1]  423     LDW Y,X 
      00A7C6 90 FE            [ 2]  424     LDW Y,(Y)
      00A7C8 90 BF 26         [ 2]  425     LDW YTEMP,Y ; d3 hi 
      00A7CB 90 93            [ 1]  426     LDW Y,X 
      00A7CD 90 EE 02         [ 2]  427     LDW Y,(2,Y)
      00A7D0 90 BF 24         [ 2]  428     LDW XTEMP,Y ; d3 lo 
                                    429 ; put d1 in d3 slot 
      00A7D3 90 93            [ 1]  430     LDW Y,X 
      00A7D5 90 EE 08         [ 2]  431     LDW Y,(8,Y)
      00A7D8 FF               [ 2]  432     LDW (X),Y  ; d1 hi 
      00A7D9 90 93            [ 1]  433     LDW Y,X 
      00A7DB 90 EE 0A         [ 2]  434     LDW Y,(10,Y) 
      00A7DE EF 02            [ 2]  435     LDW (2,X),Y ; d1 lo 
                                    436 ; put d2 in d1 slot 
      00A7E0 90 93            [ 1]  437     LDW Y,X 
      00A7E2 90 EE 04         [ 2]  438     LDW Y,(4,Y) ; d2 hi 
      00A7E5 EF 08            [ 2]  439     LDW (8,X),Y 
      00A7E7 90 93            [ 1]  440     LDW Y,X 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 145.
Hexadecimal [24-Bits]



      00A7E9 90 EE 06         [ 2]  441     LDW Y,(6,Y) ; d2 lo 
      00A7EC EF 0A            [ 2]  442     LDW (10,X),Y 
                                    443 ; put d3 in d2 slot 
      00A7EE 90 BE 26         [ 2]  444     LDW Y,YTEMP 
      00A7F1 EF 04            [ 2]  445     LDW (4,X),Y 
      00A7F3 90 BE 24         [ 2]  446     LDW Y,XTEMP 
      00A7F6 EF 06            [ 2]  447     LDW (6,X),Y 
      00A7F8 81               [ 4]  448     RET 
                                    449 
                                    450 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    451 ;    D0= ( d -- 0|-1 )
                                    452 ;    check if double is 0 
                                    453 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002779                        454     _HEADER DZEQUAL,3,"D0="
      00A7F9 A7 BF                    1         .word LINK 
                           00277B     2         LINK=.
      00A7FB 03                       3         .byte 3  
      00A7FC 44 30 3D                 4         .ascii "D0="
      00A7FF                          5         DZEQUAL:
      00A7FF CD 87 12         [ 4]  455     CALL ORR 
      00A802 A6 FF            [ 1]  456     LD A,#0xFF
      00A804 90 93            [ 1]  457     LDW Y,X
      00A806 90 FE            [ 2]  458     LDW Y,(Y)
      00A808 90 A3 00 00      [ 2]  459     CPW Y,#0 
      00A80C 27 01            [ 1]  460     JREQ  ZEQ1
      00A80E 4F               [ 1]  461     CLR A   ;false
      00A80F                        462 ZEQ1:
      00A80F F7               [ 1]  463     LD     (X),A
      00A810 E7 01            [ 1]  464     LD (1,X),A
      00A812 81               [ 4]  465 	RET     
                                    466     
                                    467 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    468 ;   D= ( d1 d2 -- f )
                                    469 ;   d1==d2?
                                    470 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002793                        471     _HEADER DEQUAL,2,"D="
      00A813 A7 FB                    1         .word LINK 
                           002795     2         LINK=.
      00A815 02                       3         .byte 2  
      00A816 44 3D                    4         .ascii "D="
      00A818                          5         DEQUAL:
      00A818 A6 00            [ 1]  472     LD A,#0 
      00A81A 90 93            [ 1]  473     LDW Y,X 
      00A81C 90 FE            [ 2]  474     LDW Y,(Y)
      00A81E E3 04            [ 2]  475     CPW Y,(4,X)
      00A820 26 0B            [ 1]  476     JRNE DEQU4 
      00A822 90 93            [ 1]  477     LDW Y,X 
      00A824 90 EE 02         [ 2]  478     LDW Y,(2,Y)
      00A827 E3 06            [ 2]  479     CPW Y,(6,X)
      00A829 26 02            [ 1]  480     JRNE DEQU4 
      00A82B A6 FF            [ 1]  481     LD A,#0XFF
      00A82D                        482 DEQU4:
      00A82D 1C 00 06         [ 2]  483     ADDW X,#6
      00A830 F7               [ 1]  484     LD (X),A 
      00A831 E7 01            [ 1]  485     LD (1,X),A 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 146.
Hexadecimal [24-Bits]



      00A833 81               [ 4]  486     RET 
                                    487 
                                    488 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    489 ;   D> ( d1 d2 -- f )
                                    490 ;   d1>d2?
                                    491 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0027B4                        492     _HEADER DGREAT,2,"D>"
      00A834 A8 15                    1         .word LINK 
                           0027B6     2         LINK=.
      00A836 02                       3         .byte 2  
      00A837 44 3E                    4         .ascii "D>"
      00A839                          5         DGREAT:
      00A839 CD A7 2A         [ 4]  493     CALL DSWAP 
      00A83C CC A8 44         [ 2]  494     JP DLESS 
                                    495 
                                    496 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    497 ;   D< ( d1 d2 -- f )
                                    498 ;   d1<d2? 
                                    499 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0027BF                        500     _HEADER DLESS,2,"D<"
      00A83F A8 36                    1         .word LINK 
                           0027C1     2         LINK=.
      00A841 02                       3         .byte 2  
      00A842 44 3C                    4         .ascii "D<"
      00A844                          5         DLESS:
      00A844 CD AB 69         [ 4]  501     CALL DSUB
      00A847 CD 8C 61         [ 4]  502     CALL ZERO
      00A84A CD 88 84         [ 4]  503     CALL NROT  
      00A84D CD A8 5F         [ 4]  504     CALL DZLESS 
      0027D0                        505     _QBRAN DLESS4
      00A850 CD 85 18         [ 4]    1     CALL QBRAN
      00A853 A8 58                    2     .word DLESS4
      00A855 CD 88 F3         [ 4]  506     CALL INVER  
      00A858                        507 DLESS4:
      00A858 81               [ 4]  508     RET
                                    509 
                                    510 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    511 ;  D0< ( d -- f )
                                    512 ;  d<0? 
                                    513 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0027D9                        514     _HEADER DZLESS,3,"D0<"
      00A859 A8 41                    1         .word LINK 
                           0027DB     2         LINK=.
      00A85B 03                       3         .byte 3  
      00A85C 44 30 3C                 4         .ascii "D0<"
      00A85F                          5         DZLESS:
      00A85F A6 00            [ 1]  515     LD A,#0 
      00A861 90 93            [ 1]  516     LDW Y,X 
      00A863 90 FE            [ 2]  517     LDW Y,(Y)
      00A865 2A 02            [ 1]  518     JRPL DZLESS1 
      00A867 A6 FF            [ 1]  519     LD A,#0XFF 
      00A869                        520 DZLESS1:
      00A869 1C 00 02         [ 2]  521     ADDW X,#2 
      00A86C F7               [ 1]  522     LD (X),A 
      00A86D E7 01            [ 1]  523     LD (1,X),A    
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 147.
Hexadecimal [24-Bits]



      00A86F 81               [ 4]  524     RET 
                                    525 
                                    526 
                                    527 
                                    528 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    529 ;   2>R ( d -- R: d )
                                    530 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0027F0                        531     _HEADER DTOR,3,"2>R"
      00A870 A8 5B                    1         .word LINK 
                           0027F2     2         LINK=.
      00A872 03                       3         .byte 3  
      00A873 32 3E 52                 4         .ascii "2>R"
      00A876                          5         DTOR:
      00A876 90 85            [ 2]  532     POPW Y 
      00A878 90 BF 26         [ 2]  533     LDW YTEMP,Y 
      00A87B 90 93            [ 1]  534     LDW Y,X 
      00A87D 90 EE 02         [ 2]  535     LDW Y,(2,Y)
      00A880 90 89            [ 2]  536     PUSHW Y   ; d low 
      00A882 90 93            [ 1]  537     LDW Y,X 
      00A884 90 FE            [ 2]  538     LDW Y,(Y)
      00A886 90 89            [ 2]  539     PUSHW Y   ; d hi 
      00A888 1C 00 04         [ 2]  540     ADDW X,#4  
      00A88B 92 CC 26         [ 5]  541     JP [YTEMP]
                                    542 
                                    543 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    544 ;  2R> ( -- d ) R: d --      
                                    545 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00280E                        546     _HEADER DRFROM,3,"2R>"
      00A88E A8 72                    1         .word LINK 
                           002810     2         LINK=.
      00A890 03                       3         .byte 3  
      00A891 32 52 3E                 4         .ascii "2R>"
      00A894                          5         DRFROM:
      00A894 90 85            [ 2]  547     POPW Y      ; d hi 
      00A896 90 BF 26         [ 2]  548     LDW YTEMP,Y 
      00A899 1D 00 04         [ 2]  549     SUBW X,#4
      00A89C 90 85            [ 2]  550     POPW Y       ; d hi 
      00A89E FF               [ 2]  551     LDW (X),Y 
      00A89F 90 85            [ 2]  552     POPW Y       ; d low  
      00A8A1 EF 02            [ 2]  553     LDW (2,X),Y 
      00A8A3 92 CC 26         [ 5]  554     JP [YTEMP]
                                    555     
                                    556 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    557 ;   2R@ ( -- d )
                                    558 ;   fecth a double from RSTACK
                                    559 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002826                        560     _HEADER DRAT,3,"2R@"
      00A8A6 A8 90                    1         .word LINK 
                           002828     2         LINK=.
      00A8A8 03                       3         .byte 3  
      00A8A9 32 52 40                 4         .ascii "2R@"
      00A8AC                          5         DRAT:
      00A8AC 90 85            [ 2]  561     POPW Y 
      00A8AE 90 BF 26         [ 2]  562     LDW YTEMP,Y 
      00A8B1 1D 00 04         [ 2]  563     SUBW X,#4 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 148.
Hexadecimal [24-Bits]



      00A8B4 16 01            [ 2]  564     LDW Y,(1,SP)
      00A8B6 FF               [ 2]  565     LDW (X),Y 
      00A8B7 16 03            [ 2]  566     LDW Y,(3,SP)
      00A8B9 EF 02            [ 2]  567     LDW (2,X),Y 
      00A8BB 92 CC 26         [ 5]  568     JP [YTEMP]
                                    569 
                                    570 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    571 ;  2VARIABLE <name> 
                                    572 ;  create a double variable 
                                    573 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00283E                        574     _HEADER DVARIA,9,"2VARIABLE"
      00A8BE A8 A8                    1         .word LINK 
                           002840     2         LINK=.
      00A8C0 09                       3         .byte 9  
      00A8C1 32 56 41 52 49 41 42     4         .ascii "2VARIABLE"
             4C 45
      00A8CA                          5         DVARIA:
      00A8CA CD 8D 3E         [ 4]  575         CALL HERE
      00A8CD CD 86 A1         [ 4]  576         CALL DUPP
      002850                        577         _DOLIT 4  
      00A8D0 CD 84 EF         [ 4]    1     CALL DOLIT 
      00A8D3 00 04                    2     .word 4 
      00A8D5 CD 88 C6         [ 4]  578         CALL PLUS 
      00A8D8 CD 87 F8         [ 4]  579         CALL VPP 
      00A8DB CD 85 51         [ 4]  580         CALL STORE
      00A8DE CD 99 0F         [ 4]  581         CALL CREAT
      00A8E1 CD 86 A1         [ 4]  582         CALL DUPP
      00A8E4 CD 95 82         [ 4]  583         CALL COMMA
      00A8E7 CD 8C 61         [ 4]  584         CALL ZERO
      00A8EA CD 86 C9         [ 4]  585         CALL OVER 
      00A8ED CD 85 51         [ 4]  586         CALL STORE 
      00A8F0 CD 8C 61         [ 4]  587         CALL ZERO 
      00A8F3 CD 86 B1         [ 4]  588         CALL SWAPP 
      00A8F6 CD 85 51         [ 4]  589         CALL STORE
      00A8F9 CD A2 15         [ 4]  590         CALL FMOVE ; move definition to FLASH
      00A8FC CD 88 54         [ 4]  591         CALL QDUP 
      00A8FF CD 85 18         [ 4]  592         CALL QBRAN 
      00A902 99 5C                  593         .word SET_RAMLAST   
      00A904 CD 9C BD         [ 4]  594         call UPDATVP  ; don't update if variable kept in RAM.
      00A907 CD A2 A9         [ 4]  595         CALL UPDATPTR
      00A90A 81               [ 4]  596         RET         
                                    597 
                                    598 
                                    599 
                                    600 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    601 ;  2LITERAL ( d -- )
                                    602 ;  compile double literal 
                                    603 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00288B                        604     _HEADER DLITER,IMEDD+8,"2LITERAL"
      00A90B A8 C0                    1         .word LINK 
                           00288D     2         LINK=.
      00A90D 88                       3         .byte IMEDD+8  
      00A90E 32 4C 49 54 45 52 41     4         .ascii "2LITERAL"
             4C
      00A916                          5         DLITER:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 149.
Hexadecimal [24-Bits]



      00A916 CD 95 C7         [ 4]  605     CALL COMPI 
      00A919 A9 21                  606     .word do2lit 
      00A91B CD 95 82         [ 4]  607     CALL COMMA 
      00A91E CC 95 82         [ 2]  608     JP   COMMA 
                                    609 
                                    610 
                                    611 ; runtime for 2LITERAL 
      00A921                        612 do2lit:
      00A921 1D 00 04         [ 2]  613     SUBW X,#4 
      00A924 16 01            [ 2]  614     LDW Y,(1,SP)
      00A926 90 FE            [ 2]  615     LDW Y,(Y)
      00A928 FF               [ 2]  616     LDW (X),Y 
      00A929 16 01            [ 2]  617     LDW Y,(1,SP)
      00A92B 90 EE 02         [ 2]  618     LDW Y,(2,Y)
      00A92E EF 02            [ 2]  619     LDW (2,X),Y 
      00A930 90 85            [ 2]  620     POPW Y 
      00A932 90 EC 04         [ 2]  621     JP (4,Y)
                                    622 
                                    623 
                                    624 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    625 ;   2OVER ( d1 d2 -- d1 d2 d1 )
                                    626 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0028B5                        627     _HEADER DOVER,5,"2OVER"
      00A935 A9 0D                    1         .word LINK 
                           0028B7     2         LINK=.
      00A937 05                       3         .byte 5  
      00A938 32 4F 56 45 52           4         .ascii "2OVER"
      00A93D                          5         DOVER:
      00A93D 90 93            [ 1]  628     LDW Y,X 
      00A93F 1D 00 04         [ 2]  629     SUBW X,#4 
      00A942 90 89            [ 2]  630     PUSHW Y 
      00A944 90 EE 04         [ 2]  631     LDW Y,(4,Y)  ; d1 hi 
      00A947 FF               [ 2]  632     LDW (X),Y 
      00A948 90 85            [ 2]  633     POPW Y 
      00A94A 90 EE 06         [ 2]  634     LDW Y,(6,Y)  ;d1 lo 
      00A94D EF 02            [ 2]  635     LDW (2,X),Y 
      00A94F 81               [ 4]  636     RET 
                                    637 
                                    638 
                                    639 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    640 ;   D2/ ( d -- d/2 )
                                    641 ;   divide double by 2 
                                    642 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0028D0                        643     _HEADER D2SLASH,3,"D2/"
      00A950 A9 37                    1         .word LINK 
                           0028D2     2         LINK=.
      00A952 03                       3         .byte 3  
      00A953 44 32 2F                 4         .ascii "D2/"
      00A956                          5         D2SLASH:
      00A956 90 93            [ 1]  644     LDW Y,X 
      00A958 90 FE            [ 2]  645     LDW Y,(Y)
      00A95A 90 57            [ 2]  646     SRAW Y 
      00A95C FF               [ 2]  647     LDW (X),Y 
      00A95D 90 93            [ 1]  648     LDW Y,X 
      00A95F 90 EE 02         [ 2]  649     LDW Y,(2,Y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 150.
Hexadecimal [24-Bits]



      00A962 90 56            [ 2]  650     RRCW Y 
      00A964 EF 02            [ 2]  651     LDW (2,X),Y 
      00A966 81               [ 4]  652     RET
                                    653 
                                    654 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    655 ;  D2* ( d -- d*2 )
                                    656 ;  multiply double by 2 
                                    657 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0028E7                        658     _HEADER D2STAR,3,"D2*"
      00A967 A9 52                    1         .word LINK 
                           0028E9     2         LINK=.
      00A969 03                       3         .byte 3  
      00A96A 44 32 2A                 4         .ascii "D2*"
      00A96D                          5         D2STAR:
      00A96D 90 93            [ 1]  659     LDW Y,X 
      00A96F 90 EE 02         [ 2]  660     LDW Y,(2,Y)
      00A972 98               [ 1]  661     RCF 
      00A973 90 59            [ 2]  662     RLCW Y 
      00A975 EF 02            [ 2]  663     LDW (2,X),Y 
      00A977 90 93            [ 1]  664     LDW Y,X 
      00A979 90 FE            [ 2]  665     LDW Y,(Y)
      00A97B 90 59            [ 2]  666     RLCW Y 
      00A97D FF               [ 2]  667     LDW (X),Y 
      00A97E 81               [ 4]  668     RET 
                                    669 
                                    670 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    671 ;   DLSHIFT ( d n -- d )
                                    672 ;   left shift double 
                                    673 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0028FF                        674     _HEADER DLSHIFT,7,"DLSHIFT"
      00A97F A9 69                    1         .word LINK 
                           002901     2         LINK=.
      00A981 07                       3         .byte 7  
      00A982 44 4C 53 48 49 46 54     4         .ascii "DLSHIFT"
      00A989                          5         DLSHIFT:
      00A989 E6 01            [ 1]  675     LD A,(1,X) ; shift count 
      00A98B 1C 00 02         [ 2]  676     ADDW X,#2 
      00A98E 90 93            [ 1]  677     LDW Y,X 
      00A990 90 FE            [ 2]  678     LDW Y,(Y)
      00A992 90 BF 26         [ 2]  679     LDW YTEMP,Y  ; d hi 
      00A995 90 93            [ 1]  680     LDW Y,X 
      00A997 90 EE 02         [ 2]  681     LDW Y,(2,Y)  ; d low 
      00A99A                        682 DLSHIFT1:
      00A99A 4D               [ 1]  683     TNZ A 
      00A99B 27 12            [ 1]  684     JREQ DLSHIFT2 
      00A99D 98               [ 1]  685     RCF 
      00A99E 90 59            [ 2]  686     RLCW Y 
      00A9A0 90 89            [ 2]  687     PUSHW Y 
      00A9A2 90 BE 26         [ 2]  688     LDW Y,YTEMP 
      00A9A5 90 59            [ 2]  689     RLCW Y 
      00A9A7 90 BF 26         [ 2]  690     LDW YTEMP,Y 
      00A9AA 90 85            [ 2]  691     POPW Y 
      00A9AC 4A               [ 1]  692     DEC A 
      00A9AD 20 EB            [ 2]  693     JRA DLSHIFT1 
      00A9AF                        694 DLSHIFT2:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 151.
Hexadecimal [24-Bits]



      00A9AF EF 02            [ 2]  695     LDW (2,X),Y 
      00A9B1 90 BE 26         [ 2]  696     LDW Y,YTEMP 
      00A9B4 FF               [ 2]  697     LDW (X),Y 
      00A9B5 81               [ 4]  698     RET 
                                    699 
                                    700 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    701 ;  DRSHIFT ( d n -- d )
                                    702 ;  shift right n bits 
                                    703 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002936                        704     _HEADER DRSHIFT,7,"DRSHIFT"
      00A9B6 A9 81                    1         .word LINK 
                           002938     2         LINK=.
      00A9B8 07                       3         .byte 7  
      00A9B9 44 52 53 48 49 46 54     4         .ascii "DRSHIFT"
      00A9C0                          5         DRSHIFT:
      00A9C0 E6 01            [ 1]  705     LD A,(1,X)
      00A9C2 A4 1F            [ 1]  706     AND A,#0X1F 
      00A9C4 1C 00 02         [ 2]  707     ADDW X,#2 
      00A9C7                        708 DRSHIFT1:
      00A9C7 4D               [ 1]  709     TNZ A 
      00A9C8 27 13            [ 1]  710     JREQ DRSHIFT2 
      00A9CA 90 93            [ 1]  711     LDW Y,X 
      00A9CC 90 FE            [ 2]  712     LDW Y,(Y)
      00A9CE 90 57            [ 2]  713     SRAW Y 
      00A9D0 FF               [ 2]  714     LDW (X),Y 
      00A9D1 90 93            [ 1]  715     LDW Y,X 
      00A9D3 90 EE 02         [ 2]  716     LDW Y,(2,Y)
      00A9D6 90 56            [ 2]  717     RRCW Y 
      00A9D8 EF 02            [ 2]  718     LDW (2,X),Y 
      00A9DA 4A               [ 1]  719     DEC A
      00A9DB 20 EA            [ 2]  720     JRA DRSHIFT1  
      00A9DD                        721 DRSHIFT2:
      00A9DD 81               [ 4]  722     RET 
                                    723 
                                    724 
                                    725 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    726 ;   D* ( d1 d2 -- d3 )
                                    727 ;   double product 
                                    728 ;   
                                    729 ;   d3 = d1 * d2
                                    730 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00295E                        731     _HEADER DSTAR,2,"D*"
      00A9DE A9 B8                    1         .word LINK 
                           002960     2         LINK=.
      00A9E0 02                       3         .byte 2  
      00A9E1 44 2A                    4         .ascii "D*"
      00A9E3                          5         DSTAR:
      00A9E3 CD 86 A1         [ 4]  732     CALL DUPP 
      00A9E6 CD 86 D8         [ 4]  733     CALL ZLESS  
      00A9E9 CD 86 6A         [ 4]  734     CALL TOR    ; R: d2sign 
      00A9EC CD A6 08         [ 4]  735     CALL DABS   
      00A9EF CD 85 B4         [ 4]  736     CALL RFROM 
      00A9F2 CD 88 84         [ 4]  737     CALL NROT  ; d1 d2s ud2
      00A9F5 CD A8 76         [ 4]  738     CALL DTOR  ; d1 d2s R: ud2  
      00A9F8 CD 86 6A         [ 4]  739     CALL TOR   ; d1 R: ud2 d2s   
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 152.
Hexadecimal [24-Bits]



      00A9FB CD 86 A1         [ 4]  740     CALL DUPP 
      00A9FE CD 86 D8         [ 4]  741     CALL ZLESS 
      00AA01 CD 85 B4         [ 4]  742     CALL RFROM 
      00AA04 CD 87 27         [ 4]  743     CALL XORR   
      00AA07 CD 86 6A         [ 4]  744     CALL TOR   ; d1 R: ud2 prod_sign  
      00AA0A CD A6 08         [ 4]  745     CALL DABS ; ud1 R: ud2 ps  
      00AA0D CD 85 B4         [ 4]  746     CALL RFROM  
      00AA10 CD 88 84         [ 4]  747     CALL NROT   ; ps ud1 
      00AA13 CD 88 B1         [ 4]  748     CALL DDUP   ; ps ud1 ud1  
      00AA16 CD 85 B4         [ 4]  749     CALL RFROM  ; ps ud1 ud1 ud2hi 
      00AA19 CD A7 04         [ 4]  750     CALL DSSTAR ; ps ud1 dprodhi 
                                    751 ; shift partial product 16 bits left 
      00AA1C CD 86 97         [ 4]  752     CALL DROP   ; drop overflow 
      00AA1F CD 8C 61         [ 4]  753     CALL ZERO   ; ps ud1 prodhi 
      00AA22 CD 86 B1         [ 4]  754     CALL SWAPP  
      00AA25 CD A7 2A         [ 4]  755     CALL DSWAP  ; ps dprodhi ud1 
      00AA28 CD 85 B4         [ 4]  756     CALL RFROM  ; ps dprodhi ud1 ud2lo
      00AA2B CD A7 04         [ 4]  757     CALL DSSTAR ; ps  dprodhi dprodlo 
      00AA2E CD AB 37         [ 4]  758     CALL DPLUS
      00AA31 CD 88 65         [ 4]  759     CALL ROT    ; dprod ps 
      0029B4                        760     _QBRAN DDSTAR3 
      00AA34 CD 85 18         [ 4]    1     CALL QBRAN
      00AA37 AA 3C                    2     .word DDSTAR3
      00AA39 CD 89 16         [ 4]  761     CALL DNEGA 
      00AA3C                        762 DDSTAR3:  
      00AA3C 81               [ 4]  763     RET 
                                    764 
                                    765 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    766 ;  UD/MOD ( ud1 ud2 -- dr udq )
                                    767 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0029BD                        768     _HEADER UDSLMOD,6,"UD/MOD"
      00AA3D A9 E0                    1         .word LINK 
                           0029BF     2         LINK=.
      00AA3F 06                       3         .byte 6  
      00AA40 55 44 2F 4D 4F 44        4         .ascii "UD/MOD"
      00AA46                          5         UDSLMOD:
                                    769 ; unsigned double division 
      00AA46 CD 8C 61         [ 4]  770     CALL ZERO 
      00AA49 CD 8C 61         [ 4]  771     CALL ZERO
      00AA4C CD A8 76         [ 4]  772     CALL DTOR ; quotient  R: qlo qhi 
      00AA4F CD A9 3D         [ 4]  773     CALL DOVER 
      00AA52 CD A7 58         [ 4]  774     CALL DCLZ ; n2, dividend leading zeros  
      00AA55 CD 86 6A         [ 4]  775     CALL TOR 
      00AA58 CD 88 B1         [ 4]  776     CALL DDUP    
      00AA5B CD A7 58         [ 4]  777     CALL DCLZ  ; n1, divisor leading zeros
      00AA5E CD 85 B4         [ 4]  778     CALL RFROM ; n1 n2 
      00AA61 CD 89 50         [ 4]  779     CALL SUBB  ; loop count 
      00AA64 CD 86 A1         [ 4]  780     CALL DUPP
      00AA67 CD A8 76         [ 4]  781     CALL DTOR  ; ud1 ud2 R: qlo qhi cntr cntr 
      00AA6A CD 85 C5         [ 4]  782     CALL RAT    
      00AA6D CD 86 D8         [ 4]  783     CALL ZLESS 
      0029F0                        784     _TBRAN UDSLA7 ; quotient is null 
      00AA70 CD 85 26         [ 4]    1     CALL TBRAN 
      00AA73 AA D2                    2     .word UDSLA7 
      00AA75 CD 85 C5         [ 4]  785     CALL RAT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 153.
Hexadecimal [24-Bits]



      00AA78 CD A9 89         [ 4]  786     CALL DLSHIFT ; align divisor with dividend 
      00AA7B                        787 UDSLA3: ; division loop -- dividend divisor  
      00AA7B 90 5F            [ 1]  788     CLRW Y 
      00AA7D 90 89            [ 2]  789     PUSHW Y  
      00AA7F CD A9 3D         [ 4]  790     CALL DOVER 
      00AA82 CD A9 3D         [ 4]  791     CALL DOVER 
      00AA85 CD A8 44         [ 4]  792     CALL DLESS 
      002A08                        793     _TBRAN UDSLA4 
      00AA88 CD 85 26         [ 4]    1     CALL TBRAN 
      00AA8B AA A1                    2     .word UDSLA4 
      00AA8D 90 85            [ 2]  794     POPW Y 
      00AA8F 72 A9 00 01      [ 2]  795     ADDW Y,#1 
      00AA93 90 89            [ 2]  796     PUSHW Y    ; quotiend least bit 
      00AA95 CD 88 B1         [ 4]  797     CALL DDUP  ; dividend divisor divisor 
      00AA98 CD A8 76         [ 4]  798     CALL DTOR  
      00AA9B CD AB 69         [ 4]  799     CALL DSUB  ; dividend-divisor 
      00AA9E CD A8 94         [ 4]  800     CALL DRFROM  ; dividend- divisor  
      00AAA1                        801 UDSLA4: ; shift quotient and add 1 bit 
      00AAA1 90 85            [ 2]  802     POPW Y 
      00AAA3 90 BF 26         [ 2]  803     LDW YTEMP,Y 
      00AAA6 16 07            [ 2]  804     LDW Y,(7,SP) ; quotient low 
      00AAA8 98               [ 1]  805     RCF 
      00AAA9 90 59            [ 2]  806     RLCW Y
      00AAAB 17 07            [ 2]  807     LDW (7,SP),Y 
      00AAAD 16 05            [ 2]  808     LDW Y,(5,SP) ; quotient hi 
      00AAAF 90 59            [ 2]  809     RLCW Y 
      00AAB1 17 05            [ 2]  810     LDW (5,SP),Y 
      00AAB3 16 07            [ 2]  811     LDW Y,(7,SP) 
      00AAB5 72 B9 00 26      [ 2]  812     ADDW Y,YTEMP
      00AAB9 17 07            [ 2]  813     LDW (7,SP),Y 
      00AABB 16 01            [ 2]  814     LDW Y,(1,SP) ; loop counter 
      00AABD 90 5D            [ 2]  815     TNZW Y 
      00AABF 27 1C            [ 1]  816     JREQ UDSLA8
      00AAC1 72 A2 00 01      [ 2]  817     SUBW Y,#1  
      00AAC5 17 01            [ 2]  818     LDW (1,SP),Y  
                                    819 ; shift dividend left 1 bit      
      00AAC7 CD A7 2A         [ 4]  820     CALL DSWAP 
      00AACA CD A9 6D         [ 4]  821     CALL D2STAR 
      00AACD CD A7 2A         [ 4]  822     CALL DSWAP 
      00AAD0 20 A9            [ 2]  823     JRA UDSLA3 
      00AAD2                        824 UDSLA7:
      00AAD2 CD 8C 61         [ 4]  825     CALL ZERO 
      002A55                        826     _DOLIT 1 
      00AAD5 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AAD8 00 01                    2     .word 1 
      00AADA CD 86 44         [ 4]  827     CALL NRSTO ; R: 0 0 0 cntr    
      00AADD                        828 UDSLA8:
      00AADD 1C 00 04         [ 2]  829     ADDW X,#4 ; drop divisor
      00AAE0 CD 85 B4         [ 4]  830     CALL RFROM  
      00AAE3 CD 86 97         [ 4]  831     CALL DROP ; drop cntr 
      00AAE6 CD 85 B4         [ 4]  832     CALL RFROM   ; shift count
      00AAE9 CD A9 C0         [ 4]  833     CALL DRSHIFT 
                                    834     ; quotient replace dividend 
      00AAEC CD A8 94         [ 4]  835     CALL DRFROM  ; quotient 
      00AAEF 81               [ 4]  836     RET 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 154.
Hexadecimal [24-Bits]



                                    837 
                                    838 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    839 ;   D/MOD  ( d1 d2 -- dr dq )
                                    840 ;   double division dq=d1/d2
                                    841 ;   dr remainder double 
                                    842 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002A70                        843     _HEADER DDSLMOD,5,"D/MOD"  
      00AAF0 AA 3F                    1         .word LINK 
                           002A72     2         LINK=.
      00AAF2 05                       3         .byte 5  
      00AAF3 44 2F 4D 4F 44           4         .ascii "D/MOD"
      00AAF8                          5         DDSLMOD:
      00AAF8 CD A6 1F         [ 4]  844     CALL DSIGN 
      00AAFB CD 86 6A         [ 4]  845     CALL TOR   ; R: divisor sign 
      00AAFE CD A6 08         [ 4]  846     CALL DABS 
      00AB01 CD A7 2A         [ 4]  847     CALL DSWAP 
      00AB04 CD A6 1F         [ 4]  848     CALL DSIGN ; dividend sign 
      00AB07 CD 85 B4         [ 4]  849     CALL RFROM 
      00AB0A CD 87 27         [ 4]  850     CALL XORR  ; quotient sign
      00AB0D CD 86 6A         [ 4]  851     CALL TOR   ; 
      00AB10 CD A6 08         [ 4]  852     CALL DABS  ; d2 ud1 R: sign 
      00AB13 CD A7 2A         [ 4]  853     CALL DSWAP  ; ud1 ud2 
      00AB16 CD AA 46         [ 4]  854     CALL UDSLMOD ; ud1/ud2 -- dr dq  
      00AB19 90 85            [ 2]  855     POPW Y ; sign 
      00AB1B 90 5D            [ 2]  856     TNZW Y 
      00AB1D 2A 03            [ 1]  857     JRPL DSLA9 
      00AB1F CD 89 16         [ 4]  858     CALL DNEGA ; remainder quotient 
      00AB22                        859 DSLA9: 
      00AB22 81               [ 4]  860     RET 
                                    861 
                                    862 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    863 ;   D/  ( d1 d2 -- dq )
                                    864 ;   division double by double 
                                    865 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002AA3                        866     _HEADER DSLASH,2,"D/"
      00AB23 AA F2                    1         .word LINK 
                           002AA5     2         LINK=.
      00AB25 02                       3         .byte 2  
      00AB26 44 2F                    4         .ascii "D/"
      00AB28                          5         DSLASH:
      00AB28 CD AA F8         [ 4]  867     CALL DDSLMOD
      00AB2B CD A7 2A         [ 4]  868     CALL DSWAP
      00AB2E CD 88 A6         [ 4]  869     CALL DDROP 
      00AB31 81               [ 4]  870     RET 
                                    871 
                                    872 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    873 ;   D+ ( d1 d2 -- d3 )
                                    874 ;   add 2 doubles 
                                    875 ;   d3=d1+d2 
                                    876 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002AB2                        877     _HEADER DPLUS,2,"D+"
      00AB32 AB 25                    1         .word LINK 
                           002AB4     2         LINK=.
      00AB34 02                       3         .byte 2  
      00AB35 44 2B                    4         .ascii "D+"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 155.
Hexadecimal [24-Bits]



      00AB37                          5         DPLUS:
      00AB37 90 93            [ 1]  878     LDW Y,X 
      00AB39 90 FE            [ 2]  879     LDW Y,(Y)
      00AB3B 90 BF 26         [ 2]  880     LDW YTEMP,Y ; d2 hi 
      00AB3E 90 93            [ 1]  881     LDW Y,X 
      00AB40 90 EE 02         [ 2]  882     LDW Y,(2,Y)
      00AB43 90 BF 24         [ 2]  883     LDW XTEMP,Y ; d2 lo 
      00AB46 1C 00 04         [ 2]  884     ADDW X,#4 
      00AB49 90 93            [ 1]  885     LDW Y,X 
      00AB4B 90 EE 02         [ 2]  886     LDW Y,(2,Y) ; d1 lo
      00AB4E 72 B9 00 24      [ 2]  887     ADDW Y,XTEMP
      00AB52 EF 02            [ 2]  888     LDW (2,X),Y 
      00AB54 90 93            [ 1]  889     LDW Y,X 
      00AB56 90 FE            [ 2]  890     LDW Y,(Y) ; d1 hi 
      00AB58 24 04            [ 1]  891     JRNC DPLUS1 
      00AB5A 72 A9 00 01      [ 2]  892     ADDW Y,#1 
      00AB5E                        893 DPLUS1: 
      00AB5E 72 B9 00 26      [ 2]  894     ADDW Y,YTEMP 
      00AB62 FF               [ 2]  895     LDW (X),Y 
      00AB63 81               [ 4]  896     RET 
                                    897 
                                    898 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    899 ;   D- ( d1 d2 -- d3 )
                                    900 ;   d3=d1-d2 
                                    901 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002AE4                        902     _HEADER DSUB,2,"D-"
      00AB64 AB 34                    1         .word LINK 
                           002AE6     2         LINK=.
      00AB66 02                       3         .byte 2  
      00AB67 44 2D                    4         .ascii "D-"
      00AB69                          5         DSUB:
      00AB69 90 93            [ 1]  903     LDW Y,X 
      00AB6B 90 FE            [ 2]  904     LDW Y,(Y)
      00AB6D 90 BF 26         [ 2]  905     LDW YTEMP,Y ; d2 hi 
      00AB70 90 93            [ 1]  906     LDW Y,X 
      00AB72 90 EE 02         [ 2]  907     LDW Y,(2,Y)
      00AB75 90 BF 24         [ 2]  908     LDW XTEMP,Y ; d2 lo 
      00AB78 1C 00 04         [ 2]  909     ADDW X,#4 
      00AB7B 90 93            [ 1]  910     LDW Y,X 
      00AB7D 90 EE 02         [ 2]  911     LDW Y,(2,Y) ; d1 lo
      00AB80 72 B2 00 24      [ 2]  912     SUBW Y,XTEMP
      00AB84 EF 02            [ 2]  913     LDW (2,X),Y 
      00AB86 90 93            [ 1]  914     LDW Y,X 
      00AB88 90 FE            [ 2]  915     LDW Y,(Y) ; d1 hi 
      00AB8A 24 04            [ 1]  916     JRNC DSUB1 
      00AB8C 72 A2 00 01      [ 2]  917     SUBW Y,#1 
      00AB90                        918 DSUB1: 
      00AB90 72 B2 00 26      [ 2]  919     SUBW Y,YTEMP 
      00AB94 FF               [ 2]  920     LDW (X),Y 
      00AB95 81               [ 4]  921     RET 
                                    922 
                                    923 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 156.
Hexadecimal [24-Bits]



                                   4483 .endif 
                           000001  4484 .if WANT_FLOAT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 157.
Hexadecimal [24-Bits]



                                   4485         .include "float.asm"
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
                                     49 ;-------------------------
                                     50 ;    FPSW ( -- a )
                                     51 ;    floating state variable
                                     52 ;    bit 0 zero flag 
                                     53 ;    bit 1 negative flag 
                                     54 ;    bit 2 overflow/error flag 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 158.
Hexadecimal [24-Bits]



                                     55 ;---------------------------
      002B16                         56     _HEADER FPSW,4,"FPSW"
      00AB96 AB 66                    1         .word LINK 
                           002B18     2         LINK=.
      00AB98 04                       3         .byte 4  
      00AB99 46 50 53 57              4         .ascii "FPSW"
      00AB9D                          5         FPSW:
      00AB9D 90 AE 00 08      [ 2]   57 	LDW Y,#UFPSW  
      00ABA1 1D 00 02         [ 2]   58 	SUBW X,#2
      00ABA4 FF               [ 2]   59     LDW (X),Y
      00ABA5 81               [ 4]   60     RET
                                     61 
                                     62 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     63 ;   FRESET ( -- )
                                     64 ;   reset FPSW variable 
                                     65 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
      002B26                         66     _HEADER FRESET,6,"FRESET"
      00ABA6 AB 98                    1         .word LINK 
                           002B28     2         LINK=.
      00ABA8 06                       3         .byte 6  
      00ABA9 46 52 45 53 45 54        4         .ascii "FRESET"
      00ABAF                          5         FRESET:
      00ABAF CD 8C 61         [ 4]   67     CALL ZERO  
      00ABB2 CD AB 9D         [ 4]   68     CALL FPSW 
      00ABB5 CD 85 51         [ 4]   69     CALL STORE 
      00ABB8 81               [ 4]   70     RET 
                                     71 
                                     72 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     73 ;   FINIT ( -- )
                                     74 ;   initialize floating point 
                                     75 ;   library 
                                     76 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002B39                         77     _HEADER FINIT,5,"FINIT"
      00ABB9 AB A8                    1         .word LINK 
                           002B3B     2         LINK=.
      00ABBB 05                       3         .byte 5  
      00ABBC 46 49 4E 49 54           4         .ascii "FINIT"
      00ABC1                          5         FINIT:
      00ABC1 CD AB AF         [ 4]   78     CALL FRESET 
      00ABC4 81               [ 4]   79     RET 
                                     80 
                                     81 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     82 ;    FER ( -- u )
                                     83 ;    return FPSW value 
                                     84 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002B45                         85     _HEADER FER,3,"FER"
      00ABC5 AB BB                    1         .word LINK 
                           002B47     2         LINK=.
      00ABC7 03                       3         .byte 3  
      00ABC8 46 45 52                 4         .ascii "FER"
      00ABCB                          5         FER:
      00ABCB CD AB 9D         [ 4]   86     CALL FPSW 
      00ABCE CD 85 63         [ 4]   87     CALL AT 
      00ABD1 81               [ 4]   88     RET 
                                     89 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 159.
Hexadecimal [24-Bits]



                                     90 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     91 ;    FZE  ( -- 0|-1 )
                                     92 ;    return FPSW zero flag 
                                     93 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002B52                         94     _HEADER FZE,3,"FZE"
      00ABD2 AB C7                    1         .word LINK 
                           002B54     2         LINK=.
      00ABD4 03                       3         .byte 3  
      00ABD5 46 5A 45                 4         .ascii "FZE"
      00ABD8                          5         FZE:
      00ABD8 CD AB 9D         [ 4]   95     CALL FPSW
      00ABDB CD 85 63         [ 4]   96     CALL AT  
      00ABDE CD 8C 6C         [ 4]   97     CALL ONE 
      00ABE1 CD 86 FE         [ 4]   98     CALL ANDD
      00ABE4 CD 89 04         [ 4]   99     CALL NEGAT  
      00ABE7 81               [ 4]  100     RET 
                                    101 
                                    102 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    103 ;    FNE ( -- 0|-1 )
                                    104 ;    return FPSW negative flag 
                                    105 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002B68                        106     _HEADER FNE,3,"FNE"
      00ABE8 AB D4                    1         .word LINK 
                           002B6A     2         LINK=.
      00ABEA 03                       3         .byte 3  
      00ABEB 46 4E 45                 4         .ascii "FNE"
      00ABEE                          5         FNE:
      00ABEE CD AB 9D         [ 4]  107     CALL FPSW 
      00ABF1 CD 85 63         [ 4]  108     CALL AT 
      002B74                        109     _DOLIT 2 
      00ABF4 CD 84 EF         [ 4]    1     CALL DOLIT 
      00ABF7 00 02                    2     .word 2 
      00ABF9 CD 86 FE         [ 4]  110     CALL ANDD
      00ABFC CD 8C 47         [ 4]  111     CALL TWOSL
      00ABFF CD 89 04         [ 4]  112     CALL NEGAT   
      00AC02 81               [ 4]  113     RET 
                                    114 
                                    115 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    116 ;   FOV (  -- 0|-1 )
                                    117 ;   return FPSW overflow flag 
                                    118 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002B83                        119     _HEADER FOV,3,"FOV"
      00AC03 AB EA                    1         .word LINK 
                           002B85     2         LINK=.
      00AC05 03                       3         .byte 3  
      00AC06 46 4F 56                 4         .ascii "FOV"
      00AC09                          5         FOV:
      00AC09 CD AB 9D         [ 4]  120     CALL FPSW
      00AC0C CD 85 63         [ 4]  121     CALL AT  
      002B8F                        122     _DOLIT 4 
      00AC0F CD 84 EF         [ 4]    1     CALL DOLIT 
      00AC12 00 04                    2     .word 4 
      00AC14 CD 86 FE         [ 4]  123     CALL ANDD
      002B97                        124     _DOLIT 2 
      00AC17 CD 84 EF         [ 4]    1     CALL DOLIT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 160.
Hexadecimal [24-Bits]



      00AC1A 00 02                    2     .word 2 
      00AC1C CD 8C 2F         [ 4]  125     CALL RSHIFT 
      00AC1F CD 89 04         [ 4]  126     CALL NEGAT  
      00AC22 81               [ 4]  127     RET 
                                    128 
                                    129 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    130 ;    SFZ ( f# -- f# )
                                    131 ;    set FPSW zero flag 
                                    132 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002BA3                        133     _HEADER SFZ,3,"SFZ"
      00AC23 AC 05                    1         .word LINK 
                           002BA5     2         LINK=.
      00AC25 03                       3         .byte 3  
      00AC26 53 46 5A                 4         .ascii "SFZ"
      00AC29                          5         SFZ:
      00AC29 CD AB CB         [ 4]  134     CALL FER 
      002BAC                        135     _DOLIT 0xfffe 
      00AC2C CD 84 EF         [ 4]    1     CALL DOLIT 
      00AC2F FF FE                    2     .word 0xfffe 
      00AC31 CD 86 FE         [ 4]  136     CALL ANDD 
      00AC34 CD 86 6A         [ 4]  137     CALL TOR    
      00AC37 CD 88 B1         [ 4]  138     CALL DDUP 
      002BBA                        139     _DOLIT 0xFF  
      00AC3A CD 84 EF         [ 4]    1     CALL DOLIT 
      00AC3D 00 FF                    2     .word 0xFF 
      00AC3F CD 86 FE         [ 4]  140     CALL ANDD
      00AC42 CD A7 FF         [ 4]  141     CALL DZEQUAL 
      002BC5                        142     _DOLIT 1 
      00AC45 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AC48 00 01                    2     .word 1 
      00AC4A CD 86 FE         [ 4]  143     CALL ANDD 
      00AC4D CD 85 B4         [ 4]  144     CALL RFROM 
      00AC50 CD 87 12         [ 4]  145     CALL ORR 
      00AC53 CD AB 9D         [ 4]  146     CALL FPSW 
      00AC56 CD 85 51         [ 4]  147     CALL STORE 
      00AC59 81               [ 4]  148     RET 
                                    149 
                                    150 
                                    151 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    152 ;   SFN ( f# -- f# )
                                    153 ;   set FPSW negative flag 
                                    154 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002BDA                        155     _HEADER SFN,3,"SFN"
      00AC5A AC 25                    1         .word LINK 
                           002BDC     2         LINK=.
      00AC5C 03                       3         .byte 3  
      00AC5D 53 46 4E                 4         .ascii "SFN"
      00AC60                          5         SFN:
      00AC60 CD AB CB         [ 4]  156     CALL FER 
      002BE3                        157     _DOLIT 0xFFFD 
      00AC63 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AC66 FF FD                    2     .word 0xFFFD 
      00AC68 CD 86 FE         [ 4]  158     CALL ANDD  
      00AC6B CD 86 6A         [ 4]  159     CALL TOR 
      00AC6E CD 86 A1         [ 4]  160     CALL DUPP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 161.
Hexadecimal [24-Bits]



      002BF1                        161     _DOLIT 0X80 
      00AC71 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AC74 00 80                    2     .word 0X80 
      00AC76 CD 86 FE         [ 4]  162     CALL ANDD 
      002BF9                        163     _DOLIT 6 
      00AC79 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AC7C 00 06                    2     .word 6 
      00AC7E CD 8C 2F         [ 4]  164     CALL RSHIFT 
      00AC81 CD 85 B4         [ 4]  165     CALL RFROM 
      00AC84 CD 87 12         [ 4]  166     CALL ORR 
      00AC87 CD AB 9D         [ 4]  167     CALL FPSW 
      00AC8A CD 85 51         [ 4]  168     CALL STORE 
      00AC8D 81               [ 4]  169     RET 
                                    170 
                                    171 
                                    172 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    173 ;   SFV ( -- )
                                    174 ;   set overflow flag 
                                    175 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002C0E                        176     _HEADER SFV,3,"SFV"
      00AC8E AC 5C                    1         .word LINK 
                           002C10     2         LINK=.
      00AC90 03                       3         .byte 3  
      00AC91 53 46 56                 4         .ascii "SFV"
      00AC94                          5         SFV:
      00AC94 CD AB CB         [ 4]  177     CALL FER 
      002C17                        178     _DOLIT 4 
      00AC97 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AC9A 00 04                    2     .word 4 
      00AC9C CD 87 12         [ 4]  179     CALL ORR 
      00AC9F CD AB 9D         [ 4]  180     CALL FPSW 
      00ACA2 CD 85 51         [ 4]  181     CALL STORE 
      00ACA5 81               [ 4]  182     RET 
                                    183 
                                    184 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    185 ;  F>ME ( f# -- m e )
                                    186 ;  split float in mantissa/exponent 
                                    187 ;  m mantissa as a double 
                                    188 ;  e exponent as a single 
                                    189 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002C26                        190     _HEADER ATEXP,4,"F>ME"             
      00ACA6 AC 90                    1         .word LINK 
                           002C28     2         LINK=.
      00ACA8 04                       3         .byte 4  
      00ACA9 46 3E 4D 45              4         .ascii "F>ME"
      00ACAD                          5         ATEXP:
      00ACAD CD AB AF         [ 4]  191     CALL FRESET
      00ACB0 CD AC 60         [ 4]  192     CALL SFN
      00ACB3 CD AC 29         [ 4]  193     CALL SFZ 
      00ACB6 90 93            [ 1]  194     LDW Y,X 
      00ACB8 90 FE            [ 2]  195     LDW Y,(Y)
      00ACBA 90 89            [ 2]  196     PUSHW Y 
      00ACBC 4F               [ 1]  197     CLR A  
      00ACBD 90 5E            [ 1]  198     SWAPW Y 
      00ACBF 2A 01            [ 1]  199     JRPL ATEXP1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 162.
Hexadecimal [24-Bits]



      00ACC1 43               [ 1]  200     CPL A 
      00ACC2                        201 ATEXP1: ; sign extend mantissa 
      00ACC2 90 5E            [ 1]  202     SWAPW Y 
      00ACC4 90 95            [ 1]  203     LD YH,A 
      00ACC6 FF               [ 2]  204     LDW (X),Y 
      00ACC7 1D 00 02         [ 2]  205     SUBW X,#CELLL 
      00ACCA 90 85            [ 2]  206     POPW Y 
      00ACCC 4F               [ 1]  207     CLR A 
      00ACCD 90 5D            [ 2]  208     TNZW Y 
      00ACCF 2A 01            [ 1]  209     JRPL ATEXP2 
      00ACD1 43               [ 1]  210     CPL A 
      00ACD2                        211 ATEXP2:
      00ACD2 90 5E            [ 1]  212     SWAPW Y 
      00ACD4 90 95            [ 1]  213     LD YH,A 
      00ACD6 FF               [ 2]  214     LDW (X),Y 
      00ACD7 81               [ 4]  215     RET 
                                    216 
                                    217 
                                    218 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    219 ;    ME>F ( m e -- f# )
                                    220 ;    built float from mantissa/exponent 
                                    221 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002C58                        222     _HEADER STEXP,4,"ME>F"
      00ACD8 AC A8                    1         .word LINK 
                           002C5A     2         LINK=.
      00ACDA 04                       3         .byte 4  
      00ACDB 4D 45 3E 46              4         .ascii "ME>F"
      00ACDF                          5         STEXP:
      00ACDF CD 86 A1         [ 4]  223     CALL DUPP 
      00ACE2 CD 89 6A         [ 4]  224     CALL ABSS 
      002C65                        225     _DOLIT 127 
      00ACE5 CD 84 EF         [ 4]    1     CALL DOLIT 
      00ACE8 00 7F                    2     .word 127 
      00ACEA CD 89 F3         [ 4]  226     CALL GREAT
      002C6D                        227     _QBRAN STEXP1
      00ACED CD 85 18         [ 4]    1     CALL QBRAN
      00ACF0 AC F5                    2     .word STEXP1
      00ACF2 CD AC 94         [ 4]  228     CALL SFV
      00ACF5                        229 STEXP1:
      00ACF5 90 93            [ 1]  230     LDW Y,X 
      00ACF7 90 FE            [ 2]  231     LDW Y,(Y)
      00ACF9 4F               [ 1]  232     CLR A 
      00ACFA 90 95            [ 1]  233     LD YH,A
      00ACFC 90 5E            [ 1]  234     SWAPW Y 
      00ACFE 90 89            [ 2]  235     PUSHW Y  ; e >r 
      00AD00 1C 00 02         [ 2]  236     ADDW X,#CELLL 
      00AD03 CD 88 B1         [ 4]  237     CALL DDUP 
      00AD06 CD A6 08         [ 4]  238     CALL DABS
      00AD09 CD 86 B1         [ 4]  239     CALL SWAPP 
      00AD0C CD 86 97         [ 4]  240     CALL DROP  
      002C8F                        241     _DOLIT 127 
      00AD0F CD 84 EF         [ 4]    1     CALL DOLIT 
      00AD12 00 7F                    2     .word 127 
      00AD14 CD 89 F3         [ 4]  242     CALL GREAT 
      002C97                        243     _QBRAN STEXP2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 163.
Hexadecimal [24-Bits]



      00AD17 CD 85 18         [ 4]    1     CALL QBRAN
      00AD1A AD 1F                    2     .word STEXP2
      00AD1C CD AC 94         [ 4]  244     CALL SFV 
      00AD1F                        245 STEXP2: 
      00AD1F 4F               [ 1]  246     CLR A 
      00AD20 F7               [ 1]  247     LD (X),A     
      00AD21 CD 85 B4         [ 4]  248     CALL RFROM 
      00AD24 CD 87 12         [ 4]  249     CALL ORR
      00AD27 CD AC 29         [ 4]  250     CALL SFZ 
      00AD2A CD AC 60         [ 4]  251     CALL SFN 
      00AD2D 81               [ 4]  252     RET 
                                    253 
                                    254 
                                    255 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    256 ;   E. ( f# -- )
                                    257 ;   print float in scientific 
                                    258 ;   format 
                                    259 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002CAE                        260     _HEADER EDOT,2,"E."
      00AD2E AC DA                    1         .word LINK 
                           002CB0     2         LINK=.
      00AD30 02                       3         .byte 2  
      00AD31 45 2E                    4         .ascii "E."
      00AD33                          5         EDOT:
      00AD33 CD 87 67         [ 4]  261     CALL BASE 
      00AD36 CD 85 63         [ 4]  262     CALL AT 
      00AD39 CD 86 6A         [ 4]  263     CALL TOR 
      002CBC                        264     _DOLIT 10 
      00AD3C CD 84 EF         [ 4]    1     CALL DOLIT 
      00AD3F 00 0A                    2     .word 10 
      00AD41 CD 87 67         [ 4]  265     CALL BASE 
      00AD44 CD 85 51         [ 4]  266     CALL STORE 
      00AD47 CD AC AD         [ 4]  267     CALL ATEXP ; m e 
      00AD4A                        268 EDOT0:
      00AD4A CD 86 6A         [ 4]  269     CALL TOR   
      00AD4D CD A6 08         [ 4]  270     CALL DABS 
      00AD50 CD 8F 97         [ 4]  271     CALL SPACE 
      00AD53 CD 8E 5B         [ 4]  272     CALL BDIGS     
      00AD56                        273 EDOT2: 
      00AD56 CD A6 7A         [ 4]  274     CALL DDIG
      00AD59 CD 85 B4         [ 4]  275     CALL RFROM 
      00AD5C CD 8B F5         [ 4]  276     CALL ONEP 
      00AD5F CD 86 6A         [ 4]  277     CALL TOR 
      00AD62 CD 86 A1         [ 4]  278     CALL DUPP
      002CE5                        279     _QBRAN EDOT3 
      00AD65 CD 85 18         [ 4]    1     CALL QBRAN
      00AD68 AD 6F                    2     .word EDOT3
      002CEA                        280     _BRAN EDOT2  
      00AD6A CD 85 34         [ 4]    1     CALL BRAN 
      00AD6D AD 56                    2     .word EDOT2 
      00AD6F                        281 EDOT3:
      00AD6F CD 86 C9         [ 4]  282     CALL OVER 
      00AD72 CD 87 67         [ 4]  283     CALL BASE 
      00AD75 CD 85 63         [ 4]  284     CALL AT 
      00AD78 CD 89 97         [ 4]  285     CALL ULESS 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 164.
Hexadecimal [24-Bits]



      002CFB                        286     _QBRAN EDOT2 
      00AD7B CD 85 18         [ 4]    1     CALL QBRAN
      00AD7E AD 56                    2     .word EDOT2
      002D00                        287     _DOLIT '.'
      00AD80 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AD83 00 2E                    2     .word '.' 
      00AD85 CD 8E 6B         [ 4]  288     CALL HOLD  
      00AD88 CD A6 7A         [ 4]  289     CALL DDIG
      00AD8B CD AB EE         [ 4]  290     CALL FNE 
      002D0E                        291     _QBRAN EDOT4 
      00AD8E CD 85 18         [ 4]    1     CALL QBRAN
      00AD91 AD 9B                    2     .word EDOT4
      002D13                        292     _DOLIT '-'
      00AD93 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AD96 00 2D                    2     .word '-' 
      00AD98 CD 8E 6B         [ 4]  293     CALL HOLD 
      00AD9B                        294 EDOT4:       
      00AD9B CD 86 97         [ 4]  295     CALL DROP 
      00AD9E CD 8E C0         [ 4]  296     CALL EDIGS 
      00ADA1 CD 8F C1         [ 4]  297     CALL TYPES
      00ADA4 CD 85 B4         [ 4]  298     CALL RFROM 
      00ADA7 CD 88 54         [ 4]  299     CALL QDUP 
      002D2A                        300     _QBRAN EDOT5     
      00ADAA CD 85 18         [ 4]    1     CALL QBRAN
      00ADAD AD BA                    2     .word EDOT5
      002D2F                        301     _DOLIT 'E'
      00ADAF CD 84 EF         [ 4]    1     CALL DOLIT 
      00ADB2 00 45                    2     .word 'E' 
      00ADB4 CD 84 B6         [ 4]  302     CALL EMIT 
      00ADB7 CD 90 80         [ 4]  303     CALL DOT
      00ADBA                        304 EDOT5: 
      00ADBA CD 85 B4         [ 4]  305     CALL RFROM 
      00ADBD CD 87 67         [ 4]  306     CALL BASE 
      00ADC0 CD 85 51         [ 4]  307     CALL STORE  
      00ADC3 81               [ 4]  308     RET 
                                    309 
                                    310 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                    311 ;   F. (f# -- )
                                    312 ;   print float in fixed
                                    313 ;   point format. 
                                    314 ;;;;;;;;;;;;;;;;;;;;;;;;;
      002D44                        315     _HEADER FDOT,2,"F."
      00ADC4 AD 30                    1         .word LINK 
                           002D46     2         LINK=.
      00ADC6 02                       3         .byte 2  
      00ADC7 46 2E                    4         .ascii "F."
      00ADC9                          5         FDOT:
      00ADC9 CD 87 67         [ 4]  316     CALL BASE 
      00ADCC CD 85 63         [ 4]  317     CALL AT 
      00ADCF CD 86 6A         [ 4]  318     CALL TOR 
      002D52                        319     _DOLIT 10 
      00ADD2 CD 84 EF         [ 4]    1     CALL DOLIT 
      00ADD5 00 0A                    2     .word 10 
      00ADD7 CD 87 67         [ 4]  320     CALL BASE 
      00ADDA CD 85 51         [ 4]  321     CALL STORE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 165.
Hexadecimal [24-Bits]



      00ADDD CD AC AD         [ 4]  322     CALL    ATEXP
      00ADE0 CD 86 A1         [ 4]  323     CALL    DUPP  
      00ADE3 CD 89 6A         [ 4]  324     CALL    ABSS 
      002D66                        325     _DOLIT  8
      00ADE6 CD 84 EF         [ 4]    1     CALL DOLIT 
      00ADE9 00 08                    2     .word 8 
      00ADEB CD 89 F3         [ 4]  326     CALL    GREAT 
      002D6E                        327     _QBRAN  FDOT1 
      00ADEE CD 85 18         [ 4]    1     CALL QBRAN
      00ADF1 AD F6                    2     .word FDOT1
      00ADF3 CC AD 4A         [ 2]  328     JP      EDOT0 
      00ADF6                        329 FDOT1:
      00ADF6 CD 8F 97         [ 4]  330     CALL    SPACE 
      00ADF9 CD 86 6A         [ 4]  331     CALL    TOR 
      00ADFC CD AB EE         [ 4]  332     CALL    FNE 
      002D7F                        333     _QBRAN  FDOT0 
      00ADFF CD 85 18         [ 4]    1     CALL QBRAN
      00AE02 AE 07                    2     .word FDOT0
      00AE04 CD 89 16         [ 4]  334     CALL    DNEGA 
      00AE07                        335 FDOT0: 
      00AE07 CD 8E 5B         [ 4]  336     CALL    BDIGS
      00AE0A CD 85 C5         [ 4]  337     CALL    RAT  
      00AE0D CD 86 D8         [ 4]  338     CALL    ZLESS 
      002D90                        339     _QBRAN  FDOT6 
      00AE10 CD 85 18         [ 4]    1     CALL QBRAN
      00AE13 AE 3E                    2     .word FDOT6
      00AE15                        340 FDOT2: ; e<0 
      00AE15 CD A6 7A         [ 4]  341     CALL    DDIG 
      00AE18 CD 85 B4         [ 4]  342     CALL    RFROM
      00AE1B CD 8B F5         [ 4]  343     CALL    ONEP 
      00AE1E CD 88 54         [ 4]  344     CALL    QDUP 
      002DA1                        345     _QBRAN  FDOT3 
      00AE21 CD 85 18         [ 4]    1     CALL QBRAN
      00AE24 AE 2E                    2     .word FDOT3
      00AE26 CD 86 6A         [ 4]  346     CALL    TOR 
      002DA9                        347     _BRAN   FDOT2 
      00AE29 CD 85 34         [ 4]    1     CALL BRAN 
      00AE2C AE 15                    2     .word FDOT2 
      00AE2E                        348 FDOT3:
      002DAE                        349     _DOLIT  '.' 
      00AE2E CD 84 EF         [ 4]    1     CALL DOLIT 
      00AE31 00 2E                    2     .word '.' 
      00AE33 CD 8E 6B         [ 4]  350     CALL    HOLD 
      00AE36 CD A6 93         [ 4]  351     CALL    DDIGS
      002DB9                        352     _BRAN   FDOT9  
      00AE39 CD 85 34         [ 4]    1     CALL BRAN 
      00AE3C AE 53                    2     .word FDOT9 
      00AE3E                        353 FDOT6: ; e>=0 
      002DBE                        354     _BRAN   FDOT8
      00AE3E CD 85 34         [ 4]    1     CALL BRAN 
      00AE41 AE 4B                    2     .word FDOT8 
      00AE43                        355 FDOT7:     
      002DC3                        356     _DOLIT  '0'
      00AE43 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AE46 00 30                    2     .word '0' 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 166.
Hexadecimal [24-Bits]



      00AE48 CD 8E 6B         [ 4]  357     CALL    HOLD 
      00AE4B                        358 FDOT8:
      00AE4B CD 85 03         [ 4]  359     CALL    DONXT 
      00AE4E AE 43                  360     .word   FDOT7
      00AE50 CD A6 93         [ 4]  361     CALL    DDIGS 
      00AE53                        362 FDOT9:
      00AE53 CD AB EE         [ 4]  363     CALL    FNE 
      002DD6                        364     _QBRAN  FDOT10 
      00AE56 CD 85 18         [ 4]    1     CALL QBRAN
      00AE59 AE 63                    2     .word FDOT10
      002DDB                        365     _DOLIT '-' 
      00AE5B CD 84 EF         [ 4]    1     CALL DOLIT 
      00AE5E 00 2D                    2     .word '-' 
      00AE60 CD 8E 6B         [ 4]  366     CALL   HOLD 
      00AE63                        367 FDOT10:
      00AE63 CD 8E C0         [ 4]  368     CALL    EDIGS 
      00AE66 CD 8F C1         [ 4]  369     CALL    TYPES 
      00AE69 CD 85 B4         [ 4]  370     CALL    RFROM 
      00AE6C CD 87 67         [ 4]  371     CALL    BASE 
      00AE6F CD 85 51         [ 4]  372     CALL    STORE 
      00AE72 81               [ 4]  373     RET 
                                    374 
                                    375 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    376 ; return parsed exponent or 
                                    377 ; 0 if failed
                                    378 ; at entry exprect *a=='E'    
                                    379 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00AE73                        380 parse_exponent: ; a cntr -- e -1 | 0 
      00AE73 CD 86 6A         [ 4]  381     CALL TOR   ; R: cntr 
      00AE76 CD 86 A1         [ 4]  382     CALL DUPP 
      00AE79 CD 85 81         [ 4]  383     CALL CAT 
      002DFC                        384     _DOLIT 'E' 
      00AE7C CD 84 EF         [ 4]    1     CALL DOLIT 
      00AE7F 00 45                    2     .word 'E' 
      00AE81 CD 89 78         [ 4]  385     CALL EQUAL 
      002E04                        386     _QBRAN 1$
      00AE84 CD 85 18         [ 4]    1     CALL QBRAN
      00AE87 AE B4                    2     .word 1$
      00AE89 CD 8B F5         [ 4]  387     CALL ONEP 
      00AE8C CD 85 B4         [ 4]  388     CALL RFROM  ; a cntr 
      00AE8F CD 8C 02         [ 4]  389     CALL ONEM
      00AE92 CD 86 A1         [ 4]  390     CALL DUPP 
      002E15                        391     _QBRAN 2$ ; a cntr 
      00AE95 CD 85 18         [ 4]    1     CALL QBRAN
      00AE98 AE B7                    2     .word 2$
      00AE9A CD 8C 61         [ 4]  392     CALL ZERO
      00AE9D CD 86 A1         [ 4]  393     CALL DUPP 
      00AEA0 CD A7 2A         [ 4]  394     CALL DSWAP ; 0 0 a cntr  
      00AEA3 CD A4 B5         [ 4]  395     CALL nsign 
      00AEA6 CD 86 6A         [ 4]  396     CALL TOR   ; R: esign  
      00AEA9 CD A4 ED         [ 4]  397     CALL parse_digits
      002E2C                        398     _QBRAN PARSEXP_SUCCESS ; parsed to end of string 
      00AEAC CD 85 18         [ 4]    1     CALL QBRAN
      00AEAF AE BE                    2     .word PARSEXP_SUCCESS
                                    399 ; failed invalid character
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 167.
Hexadecimal [24-Bits]



      00AEB1 CD 88 A6         [ 4]  400     CALL DDROP ; 0 a 
      00AEB4                        401 1$: 
      00AEB4 CD 85 B4         [ 4]  402     CALL RFROM ; sign||cntr  
      00AEB7                        403 2$:
      00AEB7 CD 88 A6         [ 4]  404     CALL DDROP  ; a cntr || a sign || 0 cntr   
      00AEBA CD 8C 61         [ 4]  405     CALL ZERO   ; return only 0 
      00AEBD 81               [ 4]  406     RET 
      00AEBE                        407 PARSEXP_SUCCESS: 
      00AEBE CD 88 A6         [ 4]  408     CALL DDROP ; drop dhi a 
      00AEC1 CD 85 B4         [ 4]  409     CALL RFROM ; es 
      002E44                        410     _QBRAN 1$
      00AEC4 CD 85 18         [ 4]    1     CALL QBRAN
      00AEC7 AE CC                    2     .word 1$
      00AEC9 CD 89 04         [ 4]  411     CALL NEGAT
      00AECC                        412 1$:
      002E4C                        413     _DOLIT -1 ; -- e -1 
      00AECC CD 84 EF         [ 4]    1     CALL DOLIT 
      00AECF FF FF                    2     .word -1 
      00AED1 81               [ 4]  414     RET 
                                    415 
                                    416 
                                    417 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    418 ;   FLOAT?  ( a dlo dhi a+ cntr sign d? -- f -3 | a 0 )
                                    419 ;   called by NUMBER? 
                                    420 ;   convert string to float 
                                    421 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002E52                        422     _HEADER FLOATQ,5,"FLOAT?"
      00AED2 AD C6                    1         .word LINK 
                           002E54     2         LINK=.
      00AED4 05                       3         .byte 5  
      00AED5 46 4C 4F 41 54 3F        4         .ascii "FLOAT?"
      00AEDB                          5         FLOATQ:
      002E5B                        423     _QBRAN FLOATQ0 
      00AEDB CD 85 18         [ 4]    1     CALL QBRAN
      00AEDE AE E5                    2     .word FLOATQ0
      002E60                        424     _BRAN FLOAT_ERROR  ; not a float, string start with '#'
      00AEE0 CD 85 34         [ 4]    1     CALL BRAN 
      00AEE3 AF 8A                    2     .word FLOAT_ERROR 
      00AEE5                        425 FLOATQ0:
                                    426 ; BASE must be 10 
      00AEE5 CD 87 67         [ 4]  427     CALL BASE 
      00AEE8 CD 85 63         [ 4]  428     CALL AT 
      002E6B                        429     _DOLIT 10 
      00AEEB CD 84 EF         [ 4]    1     CALL DOLIT 
      00AEEE 00 0A                    2     .word 10 
      00AEF0 CD 89 78         [ 4]  430     CALL EQUAL 
      002E73                        431     _QBRAN FLOAT_ERROR 
      00AEF3 CD 85 18         [ 4]    1     CALL QBRAN
      00AEF6 AF 8A                    2     .word FLOAT_ERROR
                                    432 ; if float next char is '.' or 'E' 
      00AEF8 CD 86 6A         [ 4]  433     CALL TOR ; R: sign  
      00AEFB CD 86 6A         [ 4]  434     CALL TOR ; R: sign cntr 
      00AEFE CD 86 A1         [ 4]  435     CALL DUPP
      00AF01 CD 85 81         [ 4]  436     CALL CAT 
      002E84                        437     _DOLIT '.' 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 168.
Hexadecimal [24-Bits]



      00AF04 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AF07 00 2E                    2     .word '.' 
      00AF09 CD 89 78         [ 4]  438     CALL EQUAL 
      002E8C                        439     _QBRAN FLOATQ1 ; not a dot 
      00AF0C CD 85 18         [ 4]    1     CALL QBRAN
      00AF0F AF 4A                    2     .word FLOATQ1
      00AF11 CD 8B F5         [ 4]  440     CALL ONEP 
      00AF14 CD 85 B4         [ 4]  441     CALL RFROM  ; dlo dhi a cntr R: sign  
      00AF17 CD 8C 02         [ 4]  442     CALL ONEM 
      00AF1A CD 86 A1         [ 4]  443     CALL DUPP 
      00AF1D CD 86 6A         [ 4]  444     CALL TOR  ; R: sign cntr 
                                    445 ; parse fractional part
      00AF20 CD A4 ED         [ 4]  446     CALL parse_digits ; dlo dhi a cntr -- dm a cntr 
      00AF23 CD 86 A1         [ 4]  447     CALL DUPP 
      00AF26 CD 85 B4         [ 4]  448     CALL RFROM 
      00AF29 CD 86 B1         [ 4]  449     CALL SWAPP 
      00AF2C CD 89 50         [ 4]  450     CALL SUBB ; fd -> fraction digits count 
      00AF2F CD 86 6A         [ 4]  451     CALL TOR  ; dlo dhi a cntr R: sign fd 
      00AF32 CD 86 A1         [ 4]  452     CALL DUPP ; cntr cntr  
      002EB5                        453     _QBRAN 1$ ; end of string, no exponent
      00AF35 CD 85 18         [ 4]    1     CALL QBRAN
      00AF38 AF 3F                    2     .word 1$
      002EBA                        454     _BRAN FLOATQ2
      00AF3A CD 85 34         [ 4]    1     CALL BRAN 
      00AF3D AF 53                    2     .word FLOATQ2 
      00AF3F CD 86 B1         [ 4]  455 1$: CALL SWAPP 
      00AF42 CD 86 97         [ 4]  456     CALL DROP ; a
      002EC5                        457     _BRAN FLOATQ3        
      00AF45 CD 85 34         [ 4]    1     CALL BRAN 
      00AF48 AF 5B                    2     .word FLOATQ3 
      00AF4A                        458 FLOATQ1: ; must push fd==0 on RSTACK 
      00AF4A CD 85 B4         [ 4]  459     CALL RFROM ; cntr 
      00AF4D CD 8C 61         [ 4]  460     CALL ZERO  ; fd 
      00AF50 CD 86 6A         [ 4]  461     CALL TOR   ; dm a cntr R: sign fd 
      00AF53                        462 FLOATQ2: 
      00AF53 CD AE 73         [ 4]  463     CALL parse_exponent 
      002ED6                        464     _QBRAN FLOAT_ERROR0 ; exponent expected 
      00AF56 CD 85 18         [ 4]    1     CALL QBRAN
      00AF59 AF 87                    2     .word FLOAT_ERROR0
      00AF5B                        465 FLOATQ3: ; dm 0 || dm e  
      00AF5B CD 85 B4         [ 4]  466     CALL RFROM ;  fd  
      00AF5E CD 89 50         [ 4]  467     CALL SUBB  ; exp=e-fd 
      00AF61 CD 88 84         [ 4]  468     CALL NROT 
      00AF64 CD 85 B4         [ 4]  469     CALL RFROM  ; sign 
      002EE7                        470     _QBRAN FLOATQ4 
      00AF67 CD 85 18         [ 4]    1     CALL QBRAN
      00AF6A AF 6F                    2     .word FLOATQ4
      00AF6C CD 89 16         [ 4]  471     CALL DNEGA 
      00AF6F                        472 FLOATQ4:
      00AF6F CD 88 65         [ 4]  473     CALL ROT 
      00AF72 CD AC DF         [ 4]  474     CALL STEXP 
      00AF75 CD 88 65         [ 4]  475     CALL ROT 
      00AF78 CD 86 97         [ 4]  476     CALL DROP 
      00AF7B CD AC 60         [ 4]  477     CALL SFN 
      00AF7E CD AC 29         [ 4]  478     CALL SFZ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 169.
Hexadecimal [24-Bits]



      002F01                        479     _DOLIT -3 
      00AF81 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AF84 FF FD                    2     .word -3 
      00AF86 81               [ 4]  480     RET       
      00AF87                        481 FLOAT_ERROR0: 
      00AF87 CD A8 94         [ 4]  482     CALL DRFROM ; sign df      
      00AF8A                        483 FLOAT_ERROR: 
      00AF8A CD 8C A3         [ 4]  484     CALL DEPTH 
      00AF8D CD 8B E8         [ 4]  485     CALL CELLS 
      00AF90 CD 86 81         [ 4]  486     CALL SPAT 
      00AF93 CD 86 B1         [ 4]  487     CALL SWAPP 
      00AF96 CD 88 C6         [ 4]  488     CALL PLUS  
      00AF99 CD 86 8E         [ 4]  489     CALL SPSTO 
      00AF9C CD 8C 61         [ 4]  490     CALL ZERO 
      00AF9F 81               [ 4]  491     RET 
                                    492 
                                    493 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    494 ;  LSCALE ( f# -- f# )
                                    495 ;  m *=10 , e -= 1
                                    496 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002F20                        497     _HEADER LSCALE,6,"LSCALE"
      00AFA0 AE D4                    1         .word LINK 
                           002F22     2         LINK=.
      00AFA2 06                       3         .byte 6  
      00AFA3 4C 53 43 41 4C 45        4         .ascii "LSCALE"
      00AFA9                          5         LSCALE:
      00AFA9 CD AC AD         [ 4]  498     CALL ATEXP 
      00AFAC CD 8C 6C         [ 4]  499     CALL ONE 
      00AFAF CD 89 50         [ 4]  500     CALL SUBB 
      00AFB2 CD 86 6A         [ 4]  501     CALL TOR
      002F35                        502     _DOLIT 10 
      00AFB5 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AFB8 00 0A                    2     .word 10 
      00AFBA CD A7 04         [ 4]  503     CALL DSSTAR
      00AFBD CD 85 B4         [ 4]  504     CALL RFROM 
      00AFC0 CD AC DF         [ 4]  505     CALL STEXP 
      00AFC3 81               [ 4]  506     RET  
                                    507 
                                    508 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    509 ;  RSCALE ( f# -- f# )
                                    510 ;  m /=10 , e+=1 
                                    511 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002F44                        512     _HEADER RSCALE,6,"RSCALE"
      00AFC4 AF A2                    1         .word LINK 
                           002F46     2         LINK=.
      00AFC6 06                       3         .byte 6  
      00AFC7 52 53 43 41 4C 45        4         .ascii "RSCALE"
      00AFCD                          5         RSCALE:
      00AFCD CD AC AD         [ 4]  513     CALL ATEXP 
      00AFD0 CD 8C 6C         [ 4]  514     CALL ONE 
      00AFD3 CD 88 C6         [ 4]  515     CALL PLUS 
      00AFD6 CD 86 6A         [ 4]  516     CALL TOR 
      002F59                        517     _DOLIT 10 
      00AFD9 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AFDC 00 0A                    2     .word 10 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 170.
Hexadecimal [24-Bits]



      00AFDE CD A6 39         [ 4]  518     CALL DSLMOD 
      00AFE1 CD 88 65         [ 4]  519     CALL ROT 
      00AFE4 CD 86 97         [ 4]  520     CALL DROP 
      00AFE7 CD 85 B4         [ 4]  521     CALL RFROM 
      00AFEA CD AC DF         [ 4]  522     CALL STEXP 
      00AFED 81               [ 4]  523     RET 
                                    524 
                                    525 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    526 ;  SCALEUP ( ud u1 u2 -- ud*10 u1 u2 )
                                    527 ;  while (ud<=0xcccccccc && u1<u2 ){
                                    528 ;        ud*10;
                                    529 ;        u2--;
                                    530 ;  }  
                                    531 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00AFEE                        532 SCALEUP:
      00AFEE CD 88 B1         [ 4]  533     CALL DDUP
      00AFF1 CD 89 B5         [ 4]  534     CALL LESS  
      002F74                        535     _QBRAN SCALEUP3
      00AFF4 CD 85 18         [ 4]    1     CALL QBRAN
      00AFF7 B0 24                    2     .word SCALEUP3
      00AFF9 CD A8 76         [ 4]  536     CALL DTOR   ; R: u1 u2  
      00AFFC CD 88 B1         [ 4]  537     CALL DDUP 
      002F7F                        538     _DOLIT 0XCCCC 
      00AFFF CD 84 EF         [ 4]    1     CALL DOLIT 
      00B002 CC CC                    2     .word 0XCCCC 
      002F84                        539     _DOLIT 0XCCC 
      00B004 CD 84 EF         [ 4]    1     CALL DOLIT 
      00B007 0C CC                    2     .word 0XCCC 
      00B009 CD A8 39         [ 4]  540     CALL DGREAT  
      002F8C                        541     _TBRAN SCALEUP2 
      00B00C CD 85 26         [ 4]    1     CALL TBRAN 
      00B00F B0 21                    2     .word SCALEUP2 
      002F91                        542     _DOLIT 10 
      00B011 CD 84 EF         [ 4]    1     CALL DOLIT 
      00B014 00 0A                    2     .word 10 
      00B016 CD A6 E2         [ 4]  543     CALL UDSSTAR 
      00B019 CD A8 94         [ 4]  544     CALL DRFROM 
      00B01C CD 8C 02         [ 4]  545     CALL ONEM
      00B01F 20 CD            [ 2]  546     JRA SCALEUP
      00B021                        547 SCALEUP2:
      00B021 CD A8 94         [ 4]  548     CALL DRFROM
      00B024                        549 SCALEUP3: 
      00B024 81               [ 4]  550     RET 
                                    551 
                                    552 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    553 ; SCALEDOWN ( ud u1 u2 -- ud u1 u2 )
                                    554 ;  whhile (ud && u1>u2 ){ 
                                    555 ;     ud/10;
                                    556 ;     u2++;
                                    557 ;  } 
                                    558 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00B025                        559 SCALEDOWN: 
      00B025 CD 88 B1         [ 4]  560     CALL DDUP 
      00B028 CD 89 F3         [ 4]  561     CALL GREAT 
      002FAB                        562     _QBRAN SCALDN3 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 171.
Hexadecimal [24-Bits]



      00B02B CD 85 18         [ 4]    1     CALL QBRAN
      00B02E B0 54                    2     .word SCALDN3
      00B030 CD A8 76         [ 4]  563     CALL DTOR 
      00B033 CD 88 B1         [ 4]  564     CALL DDUP 
      00B036 CD A7 FF         [ 4]  565     CALL DZEQUAL 
      002FB9                        566     _TBRAN SCALDN2  
      00B039 CD 85 26         [ 4]    1     CALL TBRAN 
      00B03C B0 51                    2     .word SCALDN2 
      002FBE                        567     _DOLIT 10
      00B03E CD 84 EF         [ 4]    1     CALL DOLIT 
      00B041 00 0A                    2     .word 10 
      00B043 CD 8C 61         [ 4]  568     CALL ZERO  
      00B046 CD AB 28         [ 4]  569     CALL DSLASH 
      00B049 CD A8 94         [ 4]  570     CALL DRFROM 
      00B04C CD 8B F5         [ 4]  571     CALL ONEP  
      00B04F 20 D4            [ 2]  572     JRA SCALEDOWN 
      00B051                        573 SCALDN2:
      00B051 CD A8 94         [ 4]  574     CALL DRFROM 
      00B054                        575 SCALDN3:
      00B054 81               [ 4]  576     RET 
                                    577 
                                    578 
                                    579 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    580 ;  F-ALIGN ( f#1 f#2 -- m1 m2 e )
                                    581 ;  align to same exponent 
                                    582 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002FD5                        583     _HEADER FALIGN,7,"F-ALIGN"
      00B055 AF C6                    1         .word LINK 
                           002FD7     2         LINK=.
      00B057 07                       3         .byte 7  
      00B058 46 2D 41 4C 49 47 4E     4         .ascii "F-ALIGN"
      00B05F                          5         FALIGN:
      00B05F CD AC AD         [ 4]  584     CALL ATEXP 
      00B062 CD 86 6A         [ 4]  585     CALL TOR 
      00B065 CD A7 2A         [ 4]  586     CALL DSWAP 
      00B068 CD AC AD         [ 4]  587     CALL ATEXP 
      00B06B CD 86 6A         [ 4]  588     CALL TOR    ; m2 m1 R: e2 e1 
      00B06E CD A7 2A         [ 4]  589     CALL DSWAP 
      00B071 CD A8 AC         [ 4]  590     CALL DRAT 
      00B074 CD 89 78         [ 4]  591     CALL EQUAL 
      002FF7                        592     _TBRAN FALGN8
      00B077 CD 85 26         [ 4]    1     CALL TBRAN 
      00B07A B0 FC                    2     .word FALGN8 
                                    593 ; scaleup the largest float 
                                    594 ; but limit mantissa <=0xccccccc
                                    595 ; to avoid mantissa overflow     
      00B07C CD A8 AC         [ 4]  596     CALL DRAT ; m1 m2 e2 e1 
      00B07F CD 89 F3         [ 4]  597     CALL GREAT 
      003002                        598     _QBRAN FALGN4 ; e2<e1 
      00B082 CD 85 18         [ 4]    1     CALL QBRAN
      00B085 B0 98                    2     .word FALGN4
                                    599 ; e2>e1 then scale up m2   
      00B087 CD A8 94         [ 4]  600     CALL DRFROM 
      00B08A CD 86 B1         [ 4]  601     CALL SWAPP 
      00B08D CD AF EE         [ 4]  602     CALL SCALEUP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 172.
Hexadecimal [24-Bits]



      00B090 CD 86 B1         [ 4]  603     CALL SWAPP 
      00B093 CD A8 76         [ 4]  604     CALL DTOR 
      00B096 20 0F            [ 2]  605     JRA FALGN6
      00B098                        606 FALGN4: ; e2<e1 then scaleup m1 
      00B098 CD A7 2A         [ 4]  607     CALL DSWAP 
      00B09B CD A8 94         [ 4]  608     CALL DRFROM 
      00B09E CD AF EE         [ 4]  609     CALL SCALEUP 
      00B0A1 CD A8 76         [ 4]  610     CALL DTOR
      00B0A4 CD A7 2A         [ 4]  611     CALL DSWAP 
                                    612 ; check again for e2==e1 
                                    613 ; if scaleup was not enough 
                                    614 ; to equalize exponent then
                                    615 ; scaledown smallest float     
      00B0A7                        616 FALGN6: 
      00B0A7 CD A8 AC         [ 4]  617     CALL DRAT 
      00B0AA CD 89 78         [ 4]  618     CALL EQUAL 
      00302D                        619     _TBRAN FALGN8 
      00B0AD CD 85 26         [ 4]    1     CALL TBRAN 
      00B0B0 B0 FC                    2     .word FALGN8 
                                    620 ; e2!=e1 need to scale down smallest 
      00B0B2 CD A8 AC         [ 4]  621     CALL DRAT 
      00B0B5 CD 89 F3         [ 4]  622     CALL GREAT 
      003038                        623     _QBRAN FALGN7 ; e2<e1 
      00B0B8 CD 85 18         [ 4]    1     CALL QBRAN
      00B0BB B0 CE                    2     .word FALGN7
                                    624 ; e2>e1 scaledown m1 
      00B0BD CD A7 2A         [ 4]  625     CALL DSWAP 
      00B0C0 CD A8 94         [ 4]  626     CALL DRFROM 
      00B0C3 CD B0 25         [ 4]  627     CALL SCALEDOWN
      00B0C6 CD 86 B1         [ 4]  628     CALL SWAPP 
      00B0C9 CD A8 76         [ 4]  629     CALL DTOR 
      00B0CC 20 0F            [ 2]  630     JRA FALGN71  
      00B0CE                        631 FALGN7: ; e2<e1 scaledown m2 
      00B0CE CD A8 94         [ 4]  632     CALL DRFROM 
      00B0D1 CD 86 B1         [ 4]  633     CALL SWAPP 
      00B0D4 CD B0 25         [ 4]  634     CALL SCALEDOWN 
      00B0D7 CD 86 B1         [ 4]  635     CALL SWAPP 
      00B0DA CD A8 76         [ 4]  636     CALL DTOR 
                                    637 ; after scaledown if e2!=e1 
                                    638 ; this imply that one of mantissa 
                                    639 ; as been nullified by scalling 
                                    640 ; hence keep largest exponent 
      00B0DD                        641 FALGN71:
      00B0DD CD A8 AC         [ 4]  642     CALL DRAT 
      00B0E0 CD 89 78         [ 4]  643     CALL EQUAL
      003063                        644     _TBRAN FALGN8 
      00B0E3 CD 85 26         [ 4]    1     CALL TBRAN 
      00B0E6 B0 FC                    2     .word FALGN8 
      00B0E8 CD A8 94         [ 4]  645     CALL DRFROM 
      00B0EB CD 88 B1         [ 4]  646     CALL DDUP 
      00B0EE CD 89 F3         [ 4]  647     CALL GREAT 
      003071                        648     _TBRAN FALGN72
      00B0F1 CD 85 26         [ 4]    1     CALL TBRAN 
      00B0F4 B0 F9                    2     .word FALGN72 
      00B0F6 CD 86 B1         [ 4]  649     CALL SWAPP     
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 173.
Hexadecimal [24-Bits]



      00B0F9                        650 FALGN72:
      00B0F9 CD A8 76         [ 4]  651     CALL DTOR  ; now smallest e is at rtop.
      00B0FC                        652 FALGN8:
      00B0FC CD A8 94         [ 4]  653     CALL DRFROM 
      00B0FF CD 86 97         [ 4]  654     CALL DROP 
      00B102 81               [ 4]  655     RET 
                                    656 
                                    657 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    658 ;   F+ ( f#1 f#2 -- f#1+f#2 )
                                    659 ;   float addition 
                                    660 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      003083                        661     _HEADER FPLUS,2,"F+"
      00B103 B0 57                    1         .word LINK 
                           003085     2         LINK=.
      00B105 02                       3         .byte 2  
      00B106 46 2B                    4         .ascii "F+"
      00B108                          5         FPLUS:
      00B108 CD B0 5F         [ 4]  662     CALL FALIGN 
      00B10B CD 86 6A         [ 4]  663     CALL TOR 
      00B10E CD AB 37         [ 4]  664     CALL DPLUS
      00B111 CD A6 1F         [ 4]  665     CALL DSIGN 
      00B114 CD 86 6A         [ 4]  666     CALL TOR 
      00B117 CD A6 08         [ 4]  667     CALL DABS 
      00B11A CD B1 7D         [ 4]  668     CALL SCALETOM
      00B11D CD 85 B4         [ 4]  669     CALL RFROM 
      0030A0                        670     _QBRAN FPLUS1 
      00B120 CD 85 18         [ 4]    1     CALL QBRAN
      00B123 B1 28                    2     .word FPLUS1
      00B125 CD 89 16         [ 4]  671     CALL DNEGA  
      00B128                        672 FPLUS1: 
      00B128 CD 88 65         [ 4]  673     CALL ROT   
      00B12B CD 85 B4         [ 4]  674     CALL RFROM
      00B12E CD 88 C6         [ 4]  675     CALL PLUS  
      00B131 CD AC DF         [ 4]  676     CALL STEXP 
      00B134 81               [ 4]  677     RET 
                                    678 
                                    679 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    680 ;  F- ( f#1 f#2 -- f#1-f#2 )
                                    681 ;  substraction 
                                    682 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0030B5                        683     _HEADER FSUB,2,"F-"
      00B135 B1 05                    1         .word LINK 
                           0030B7     2         LINK=.
      00B137 02                       3         .byte 2  
      00B138 46 2D                    4         .ascii "F-"
      00B13A                          5         FSUB:
      00B13A CD B0 5F         [ 4]  684     CALL FALIGN 
      00B13D CD 86 6A         [ 4]  685     CALL TOR 
      00B140 CD AB 69         [ 4]  686     CALL DSUB
      00B143 CD A6 1F         [ 4]  687     CALL DSIGN 
      00B146 CD 86 6A         [ 4]  688     CALL TOR 
      00B149 CD A6 08         [ 4]  689     CALL DABS 
      00B14C CD B1 7D         [ 4]  690     CALL SCALETOM 
      00B14F CD 85 B4         [ 4]  691     CALL RFROM 
      0030D2                        692     _QBRAN FSUB1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 174.
Hexadecimal [24-Bits]



      00B152 CD 85 18         [ 4]    1     CALL QBRAN
      00B155 B1 5A                    2     .word FSUB1
      00B157 CD 89 16         [ 4]  693     CALL DNEGA 
      00B15A                        694 FSUB1:
      00B15A CD 88 65         [ 4]  695     CALL ROT 
      00B15D CD 85 B4         [ 4]  696     CALL RFROM
      00B160 CD 88 C6         [ 4]  697     CALL PLUS  
      00B163 CD AC DF         [ 4]  698     CALL STEXP 
      00B166 81               [ 4]  699     RET 
                                    700 
                                    701 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    702 ; /mod10  ( m -- m/10 r )
                                    703 ; divide mantissa by 10 
                                    704 ; return quotient and remainder 
                                    705 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00B167                        706 UMOD10:
      0030E7                        707     _DOLIT 10 
      00B167 CD 84 EF         [ 4]    1     CALL DOLIT 
      00B16A 00 0A                    2     .word 10 
      00B16C CD A6 39         [ 4]  708     CALL DSLMOD
      00B16F CD 88 65         [ 4]  709     CALL ROT  
      00B172 81               [ 4]  710     RET 
                                    711 
                                    712 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    713 ;   SCALE>M ( ud1 -- e ud2 )
                                    714 ;   scale down a double  
                                    715 ;   by repeated d/10
                                    716 ;   until ud<=MAX_MANTISSA   
                                    717 ;   e is log10 exponent of scaled down
                                    718 ;   ud2 is scaled down ud1 
                                    719 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0030F3                        720     _HEADER SCALETOM,7,"SCALE>M"
      00B173 B1 37                    1         .word LINK 
                           0030F5     2         LINK=.
      00B175 07                       3         .byte 7  
      00B176 53 43 41 4C 45 3E 4D     4         .ascii "SCALE>M"
      00B17D                          5         SCALETOM:
      00B17D CD 8C 61         [ 4]  721     CALL ZERO 
      00B180 CD 88 84         [ 4]  722     CALL NROT 
      00B183                        723 SCAL1:
      00B183 CD 86 A1         [ 4]  724     CALL DUPP 
      003106                        725     _DOLIT 0X7F 
      00B186 CD 84 EF         [ 4]    1     CALL DOLIT 
      00B189 00 7F                    2     .word 0X7F 
      00B18B CD 89 D4         [ 4]  726     CALL UGREAT 
      00310E                        727     _QBRAN SCAL2  
      00B18E CD 85 18         [ 4]    1     CALL QBRAN
      00B191 B1 A7                    2     .word SCAL2
      00B193 CD B1 67         [ 4]  728     CALL UMOD10 
      00B196 CD 86 97         [ 4]  729     CALL DROP 
      00B199 CD 88 65         [ 4]  730     CALL ROT 
      00B19C CD 8B F5         [ 4]  731     CALL ONEP 
      00B19F CD 88 84         [ 4]  732     CALL NROT  
      003122                        733     _BRAN SCAL1 
      00B1A2 CD 85 34         [ 4]    1     CALL BRAN 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 175.
Hexadecimal [24-Bits]



      00B1A5 B1 83                    2     .word SCAL1 
      00B1A7                        734 SCAL2: 
      00B1A7 81               [ 4]  735     RET 
                                    736 
                                    737 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    738 ;  UDIV10 ( ut -- ut )
                                    739 ;  divide a 48 bits uint by 10 
                                    740 ;  used to scale down MM* 
                                    741 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00B1A8                        742 UDIV10:
      00B1A8 90 93            [ 1]  743     LDW Y,X 
      00B1AA 90 FE            [ 2]  744     LDW Y,(Y)
      00B1AC A6 0A            [ 1]  745     LD A,#10 
      00B1AE 90 62            [ 2]  746     DIV Y,A 
      00B1B0 FF               [ 2]  747     LDW (X),Y 
      00B1B1 90 95            [ 1]  748     LD YH,A 
      00B1B3 E6 02            [ 1]  749     LD A,(2,X)
      00B1B5 90 97            [ 1]  750     LD YL,A 
      00B1B7 A6 0A            [ 1]  751     LD A,#10 
      00B1B9 90 62            [ 2]  752     DIV Y,A 
      00B1BB 90 95            [ 1]  753     LD YH,A 
      00B1BD 90 9F            [ 1]  754     LD A,YL 
      00B1BF E7 02            [ 1]  755     LD (2,X),A 
      00B1C1 E6 03            [ 1]  756     LD A,(3,X)
      00B1C3 90 97            [ 1]  757     LD YL,A 
      00B1C5 A6 0A            [ 1]  758     LD A,#10 
      00B1C7 90 62            [ 2]  759     DIV Y,A 
      00B1C9 90 95            [ 1]  760     LD YH,A 
      00B1CB 90 9F            [ 1]  761     LD A,YL 
      00B1CD E7 03            [ 1]  762     LD (3,X),A 
      00B1CF E6 04            [ 1]  763     LD A,(4,X)
      00B1D1 90 97            [ 1]  764     LD YL,A 
      00B1D3 A6 0A            [ 1]  765     LD A,#10 
      00B1D5 90 62            [ 2]  766     DIV Y,A 
      00B1D7 90 95            [ 1]  767     LD YH,A 
      00B1D9 90 9F            [ 1]  768     LD A,YL 
      00B1DB E7 04            [ 1]  769     LD (4,X),A 
      00B1DD E6 05            [ 1]  770     LD A,(5,X)
      00B1DF 90 97            [ 1]  771     LD YL,A 
      00B1E1 A6 0A            [ 1]  772     LD A,#10 
      00B1E3 90 62            [ 2]  773     DIV Y,A 
      00B1E5 90 9F            [ 1]  774     LD A,YL 
      00B1E7 E7 05            [ 1]  775     LD (5,X),A 
      00B1E9 81               [ 4]  776     RET 
                                    777 
                                    778 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    779 ;   MM* ( m1 m2 -- m3 e )
                                    780 ;   mantissa product 
                                    781 ;  scale down to 23 bits 
                                    782 ;   e  is log10 scaling factor.
                                    783 ;   The maximum product size 
                                    784 ;   before scaling is 46 bits .
                                    785 ;   UDIV10 is used to scale down.  
                                    786 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00316A                        787     _HEADER MMSTAR,3,"MM*"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 176.
Hexadecimal [24-Bits]



      00B1EA B1 75                    1         .word LINK 
                           00316C     2         LINK=.
      00B1EC 03                       3         .byte 3  
      00B1ED 4D 4D 2A                 4         .ascii "MM*"
      00B1F0                          5         MMSTAR:
      00B1F0 CD 88 B1         [ 4]  788     CALL DDUP
      00B1F3 CD A7 FF         [ 4]  789     CALL DZEQUAL
      003176                        790     _TBRAN MMSTA2
      00B1F6 CD 85 26         [ 4]    1     CALL TBRAN 
      00B1F9 B2 06                    2     .word MMSTA2 
      00B1FB                        791 MMSTA1:
      00B1FB CD A9 3D         [ 4]  792     CALL DOVER 
      00B1FE CD A7 FF         [ 4]  793     CALL DZEQUAL 
      003181                        794     _QBRAN MMSTA3 
      00B201 CD 85 18         [ 4]    1     CALL QBRAN
      00B204 B2 11                    2     .word MMSTA3
      00B206                        795 MMSTA2: ; ( -- 0 0 0 )
      00B206 1C 00 02         [ 2]  796     ADDW X,#2 
      00B209 90 5F            [ 1]  797     CLRW Y 
      00B20B FF               [ 2]  798     LDW (X),Y 
      00B20C EF 02            [ 2]  799     LDW (2,X),Y
      00B20E EF 04            [ 2]  800     LDW (4,X),Y 
      00B210 81               [ 4]  801     RET 
      00B211                        802 MMSTA3:
      00B211 CD A6 1F         [ 4]  803     CALL DSIGN 
      00B214 CD 86 6A         [ 4]  804     CALL TOR    ; R: m2sign 
      00B217 CD A6 08         [ 4]  805     CALL DABS   ; m1 um2 
      00B21A CD A7 2A         [ 4]  806     CALL DSWAP  ; um2 m1 
      00B21D CD A6 1F         [ 4]  807     CALL DSIGN  ; um2 m1 m1sign 
      00B220 CD 85 B4         [ 4]  808     CALL RFROM 
      00B223 CD 87 27         [ 4]  809     CALL XORR 
      00B226 CD 86 6A         [ 4]  810     CALL TOR   ; R: product_sign 
      00B229 CD A6 08         [ 4]  811     CALL DABS  ; um2 um1  
      00B22C CD A8 76         [ 4]  812     CALL DTOR  ; um2 
      00B22F CD 86 A1         [ 4]  813     CALL DUPP  ; um2 um2hi 
      00B232 CD 85 C5         [ 4]  814     CALL RAT   ; um2 um2hi um1hi
                                    815 ; first partial product  
                                    816 ; pd1=um2hi*um1hi 
      00B235 CD 8B 74         [ 4]  817     CALL STAR 
      00B238 CD 8C 61         [ 4]  818     CALL ZERO 
      00B23B CD 86 B1         [ 4]  819     CALL SWAPP ; pd1<<16  
      00B23E CD A7 2A         [ 4]  820     CALL DSWAP ; pd1 um2 
      00B241 CD 86 C9         [ 4]  821     CALL OVER  ; pd1 um2 um2lo 
      00B244 CD 85 B4         [ 4]  822     CALL RFROM ; pd1 um2 um2lo um1hi 
                                    823 ; pd2=um2lo*um1hi 
      00B247 CD 8B 2A         [ 4]  824     CALL UMSTA ; pd1 um2 pd2 
      00B24A CD A7 2A         [ 4]  825     CALL DSWAP ; pd1 pd2 um2 
      00B24D CD 85 C5         [ 4]  826     CALL RAT   ; pd1 pd2 um2 um1lo 
                                    827 ; pd3= um2hi*um1lo 
      00B250 CD 8B 2A         [ 4]  828     CALL UMSTA ; pd1 pd2 um2lo pd3 
      00B253 CD 88 65         [ 4]  829     CALL ROT ; pd1 pd2 pd3 um2lo 
      00B256 CD 86 6A         [ 4]  830     CALL TOR ; pd1 pd2 pd3 R: psign um1lo um2lo 
                                    831 ; pd1+pd2+pd3  pd1
      00B259 CD AB 37         [ 4]  832     CALL DPLUS 
      00B25C CD AB 37         [ 4]  833     CALL DPLUS  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 177.
Hexadecimal [24-Bits]



      00B25F CD A8 94         [ 4]  834     CALL DRFROM ; triple um2lo um1lo 
                                    835 ; last partial product um2lo*um1lo 
      00B262 CD 8B 2A         [ 4]  836     CALL UMSTA ; prod pd4 
                                    837 ; mm*=prod<<16+pd4  
      00B265 CD A8 76         [ 4]  838     CALL DTOR ;   R: psign pd4lo pd4hi  
                                    839  ; add pd4hi to prodlo and propagate carry 
      00B268 90 93            [ 1]  840     LDW Y,X 
      00B26A 90 EE 02         [ 2]  841     LDW Y,(2,Y)  ; prodlo 
      00B26D 72 F9 01         [ 2]  842     ADDW Y,(1,SP)  ; prodlo+pd4hi 
      00B270 17 01            [ 2]  843     LDW (1,SP),Y    ; plo phi  
      00B272 90 93            [ 1]  844     LDW Y,X
      00B274 90 FE            [ 2]  845     LDW Y,(Y) ; prodhi  
      00B276 24 04            [ 1]  846     JRNC MMSTA4
      00B278 72 A9 00 01      [ 2]  847     ADDW Y,#1 ; add carry 
      00B27C                        848 MMSTA4:     
      00B27C 1D 00 02         [ 2]  849     SUBW X,#2 
      00B27F FF               [ 2]  850     LDW (X),Y 
      00B280 90 85            [ 2]  851     POPW Y 
      00B282 EF 02            [ 2]  852     LDW (2,X),Y 
      00B284 90 85            [ 2]  853     POPW Y 
      00B286 EF 04            [ 2]  854     LDW (4,X),Y
      00B288 CD 8C 61         [ 4]  855     CALL ZERO 
      00B28B CD 86 6A         [ 4]  856     CALL TOR 
      00B28E                        857 MMSTA5:
      00B28E CD 88 54         [ 4]  858     CALL QDUP 
      003211                        859     _QBRAN MMSTA6 
      00B291 CD 85 18         [ 4]    1     CALL QBRAN
      00B294 B2 A7                    2     .word MMSTA6
      00B296 CD B1 A8         [ 4]  860     CALL UDIV10 
      00B299 CD 85 B4         [ 4]  861     CALL RFROM 
      00B29C CD 8B F5         [ 4]  862     CALL ONEP 
      00B29F CD 86 6A         [ 4]  863     CALL TOR 
      003222                        864     _BRAN MMSTA5 
      00B2A2 CD 85 34         [ 4]    1     CALL BRAN 
      00B2A5 B2 8E                    2     .word MMSTA5 
                                    865 ; now scale to double 
                                    866 ; scale further <= MAX_MANTISSA 
      00B2A7                        867 MMSTA6: 
      00B2A7 CD 85 B4         [ 4]  868     CALL RFROM 
      00B2AA CD 88 84         [ 4]  869     CALL NROT 
      00B2AD CD B1 7D         [ 4]  870     CALL SCALETOM
      00B2B0 CD A8 76         [ 4]  871     CALL DTOR 
      00B2B3 CD 88 C6         [ 4]  872     CALL PLUS 
      00B2B6 CD A8 94         [ 4]  873     CALL DRFROM 
      00B2B9 CD 85 B4         [ 4]  874     CALL RFROM
      00323C                        875     _QBRAN MMSTA7
      00B2BC CD 85 18         [ 4]    1     CALL QBRAN
      00B2BF B2 C4                    2     .word MMSTA7
      00B2C1 CD 89 16         [ 4]  876     CALL DNEGA
      00B2C4                        877 MMSTA7:
      00B2C4 CD 88 65         [ 4]  878     CALL ROT ; m e 
      00B2C7 81               [ 4]  879     RET 
                                    880 
                                    881 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    882 ;    F* ( f#1 f#2 -- f#3 )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 178.
Hexadecimal [24-Bits]



                                    883 ;    float product 
                                    884 ;    f#3=f#1 * f#2 
                                    885 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      003248                        886     _HEADER FSTAR,2,"F*"
      00B2C8 B1 EC                    1         .word LINK 
                           00324A     2         LINK=.
      00B2CA 02                       3         .byte 2  
      00B2CB 46 2A                    4         .ascii "F*"
      00B2CD                          5         FSTAR:
      00B2CD CD AC AD         [ 4]  887     CALL ATEXP ; f#1 m2 e2 
      00B2D0 CD 86 6A         [ 4]  888     CALL TOR   
      00B2D3 CD A7 2A         [ 4]  889     CALL DSWAP ; m2 f#1
      00B2D6 CD AC AD         [ 4]  890     CALL ATEXP ; m2 m1 e1 
      00B2D9 CD 85 B4         [ 4]  891     CALL RFROM ; m2 m1 e1 e2 
      00B2DC CD 88 C6         [ 4]  892     CALL PLUS  ; m2 m1 e 
      00B2DF CD 86 6A         [ 4]  893     CALL TOR   ; m2 m1 R: e 
      00B2E2 CD B1 F0         [ 4]  894     CALL MMSTAR ; m2*m1 e   
      00B2E5 CD 85 B4         [ 4]  895     CALL RFROM 
      00B2E8 CD 88 C6         [ 4]  896     CALL PLUS 
      00B2EB CD AC DF         [ 4]  897     CALL STEXP ; f#3 
      00B2EE 81               [ 4]  898     RET 
                                    899 
                                    900 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    901 ;  F/ ( f#1 f#2 -- f#3 )
                                    902 ;  float division
                                    903 ;  f#3 = f#1/f#2
                                    904 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00326F                        905     _HEADER FSLASH,2,"F/"
      00B2EF B2 CA                    1         .word LINK 
                           003271     2         LINK=.
      00B2F1 02                       3         .byte 2  
      00B2F2 46 2F                    4         .ascii "F/"
      00B2F4                          5         FSLASH:
      00B2F4 CD AC AD         [ 4]  906     CALL ATEXP  ; f#1 m2 e2 
      00B2F7 CD 86 6A         [ 4]  907     CALL TOR    ; f#1 m2   R: e2 
      00B2FA CD A6 1F         [ 4]  908     CALL DSIGN  ; f#1 m2 m2sign 
      00B2FD CD 86 6A         [ 4]  909     CALL TOR    ; F#1 m2 R: e2 m2s 
      00B300 CD A6 08         [ 4]  910     CALL DABS   ; F#1 um2 
      00B303 CD A7 2A         [ 4]  911     CALL DSWAP  ; m2 f#1 
      00B306 CD AC AD         [ 4]  912     CALL ATEXP  ; m2 m1 e1 
      00B309 CD 8C 6C         [ 4]  913     CALL ONE    ; e2 slot on rstack  
      00B30C CD 86 23         [ 4]  914     CALL NRAT   ; m2 m1 e1 e2 
      00B30F CD 89 50         [ 4]  915     CALL SUBB   ; m2 m1 e 
      00B312 CD 8C 6C         [ 4]  916     CALL ONE    ; e slot on rstack 
      00B315 CD 86 44         [ 4]  917     CALL NRSTO  ; m2 m1 R: e m2s 
      00B318 CD A6 1F         [ 4]  918     CALL DSIGN  ; m2 m1 m1sign 
      00B31B CD 85 B4         [ 4]  919     CALL RFROM  ; m2 m1 m1s m2s  
      00B31E CD 87 27         [ 4]  920     CALL XORR   ; m2 m1 quot_sign R: e 
      00B321 CD 85 B4         [ 4]  921     CALL RFROM   
      00B324 CD A8 76         [ 4]  922     CALL DTOR   ; m2 m1 R: qs e  
      00B327 CD A6 08         [ 4]  923     CALL DABS   ; um2 um1 R: qs e  
      00B32A CD A7 2A         [ 4]  924     CALL DSWAP  ; m1 m2 R: qs e
      00B32D CD 88 B1         [ 4]  925     CALL DDUP  ; m1 m2 m2 R: qs e
      00B330 CD A8 76         [ 4]  926     CALL DTOR  ; m1 m2 R: qs e m2 ( keep divisor need later ) 
      00B333 CD AA 46         [ 4]  927     CALL UDSLMOD ; remainder m1/m2 R: e m2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 179.
Hexadecimal [24-Bits]



      00B336                        928 FSLASH1: 
      00B336 CD A9 3D         [ 4]  929     CALL DOVER ; if remainder null done 
      00B339 CD A7 FF         [ 4]  930     CALL DZEQUAL 
      0032BC                        931     _TBRAN FSLASH8 
      00B33C CD 85 26         [ 4]    1     CALL TBRAN 
      00B33F B3 9C                    2     .word FSLASH8 
                                    932 ; get fractional digits from remainder until mantissa saturate
                                    933 ; remainder mantissa R: e divisor 
                                    934 ; check for mantissa saturation 
      00B341 CD 88 B1         [ 4]  935     CALL DDUP 
      0032C4                        936     _DOLIT 0XCCCC 
      00B344 CD 84 EF         [ 4]    1     CALL DOLIT 
      00B347 CC CC                    2     .word 0XCCCC 
      0032C9                        937     _DOLIT 0xC
      00B349 CD 84 EF         [ 4]    1     CALL DOLIT 
      00B34C 00 0C                    2     .word 0xC 
      00B34E CD A8 39         [ 4]  938     CALL DGREAT 
      0032D1                        939     _TBRAN FSLASH8 ; another loop would result in mantissa overflow 
      00B351 CD 85 26         [ 4]    1     CALL TBRAN 
      00B354 B3 9C                    2     .word FSLASH8 
                                    940 ; multiply mantissa by 10 
      0032D6                        941     _DOLIT 10 
      00B356 CD 84 EF         [ 4]    1     CALL DOLIT 
      00B359 00 0A                    2     .word 10 
      00B35B CD 8C 61         [ 4]  942     CALL ZERO 
      00B35E CD A9 E3         [ 4]  943     CALL DSTAR 
                                    944 ; mutliply remainder by 10     
      00B361 CD A7 2A         [ 4]  945     CALL DSWAP 
      0032E4                        946     _DOLIT 10 
      00B364 CD 84 EF         [ 4]    1     CALL DOLIT 
      00B367 00 0A                    2     .word 10 
      00B369 CD 8C 61         [ 4]  947     CALL ZERO 
      00B36C CD A9 E3         [ 4]  948     CALL DSTAR 
                                    949 ; divide remainder by m2     
      00B36F CD A8 AC         [ 4]  950     CALL DRAT  ; mantissa remainder divisor R: e divisor 
      00B372 CD AA 46         [ 4]  951     CALL UDSLMOD ; mantissa dr dq R: qs e divisor 
      00B375 CD A7 2A         [ 4]  952     CALL DSWAP ; mantissa frac_digit remainder R: qs e divisor  
      00B378 CD A8 76         [ 4]  953     CALL DTOR  ; mantissa frac_digit R: qs e divisor remainder 
      00B37B CD AB 37         [ 4]  954     CALL DPLUS ; mantissa+frac_digit 
      00B37E CD A8 94         [ 4]  955     CALL DRFROM ; mantissa remainder R: qs e divisor  
      00B381 CD A7 2A         [ 4]  956     CALL DSWAP  ; remainder mantissa  
                                    957 ; increment e 
      003304                        958     _DOLIT 2    ; e slot on rstack 
      00B384 CD 84 EF         [ 4]    1     CALL DOLIT 
      00B387 00 02                    2     .word 2 
      00B389 CD 86 23         [ 4]  959     CALL NRAT   ;  2 NR@ -- e 
      00B38C CD 8B F5         [ 4]  960     CALL ONEP   ; increment exponent 
      00330F                        961     _DOLIT 2 
      00B38F CD 84 EF         [ 4]    1     CALL DOLIT 
      00B392 00 02                    2     .word 2 
      00B394 CD 86 44         [ 4]  962     CALL NRSTO  ; e 2 NR! , update e on rstack     
      003317                        963     _BRAN FSLASH1
      00B397 CD 85 34         [ 4]    1     CALL BRAN 
      00B39A B3 36                    2     .word FSLASH1 
      00B39C                        964 FSLASH8: ; remainder mantissa R: qs e divisor 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 180.
Hexadecimal [24-Bits]



      00B39C CD A7 2A         [ 4]  965     CALL DSWAP  
      00B39F CD 88 A6         [ 4]  966     CALL DDROP  ; drop remainder     
      00B3A2 CD A8 94         [ 4]  967     CALL DRFROM
      00B3A5 CD 88 A6         [ 4]  968     CALL DDROP  ; drop divisor 
      00B3A8 CD 96 3A         [ 4]  969     CALL JFETCH    ; quotient sign 
      00332B                        970     _QBRAN FSLASH9 
      00B3AB CD 85 18         [ 4]    1     CALL QBRAN
      00B3AE B3 B3                    2     .word FSLASH9
      00B3B0 CD 89 16         [ 4]  971     CALL DNEGA  
      00B3B3                        972 FSLASH9:
      00B3B3 CD 85 B4         [ 4]  973     CALL RFROM  ; exponent 
      00B3B6 CD AC DF         [ 4]  974     CALL STEXP 
      00B3B9 CD 85 B4         [ 4]  975     CALL RFROM 
      00B3BC CD 86 97         [ 4]  976     CALL DROP ; drop qs 
      00B3BF 81               [ 4]  977     RET 
                                    978 
                                    979 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    980 ;   D>F  ( # -- f# )
                                    981 ;   convert double to float 
                                    982 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      003340                        983     _HEADER DTOF,3,"D>F"
      00B3C0 B2 F1                    1         .word LINK 
                           003342     2         LINK=.
      00B3C2 03                       3         .byte 3  
      00B3C3 44 3E 46                 4         .ascii "D>F"
      00B3C6                          5         DTOF:
      00B3C6 CD A6 1F         [ 4]  984     CALL DSIGN 
      00B3C9 CD 86 6A         [ 4]  985     CALL TOR
      00B3CC CD A6 08         [ 4]  986     CALL DABS  
      00B3CF                        987 DTOF1:      
      00B3CF CD B1 7D         [ 4]  988     CALL SCALETOM 
      00B3D2 CD 85 B4         [ 4]  989     CALL RFROM
      003355                        990     _QBRAN DTOF2 
      00B3D5 CD 85 18         [ 4]    1     CALL QBRAN
      00B3D8 B3 DD                    2     .word DTOF2
      00B3DA CD 89 16         [ 4]  991     CALL DNEGA 
      00B3DD                        992 DTOF2: 
      00B3DD CD 88 65         [ 4]  993     CALL ROT 
      00B3E0 CD AC DF         [ 4]  994     CALL STEXP 
      00B3E3 81               [ 4]  995     RET 
                                    996 
                                    997 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    998 ;   F>D  ( f# -- # )
                                    999 ;  convert float to double 
                                   1000 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      003364                       1001     _HEADER FTOD,3,"F>D"
      00B3E4 B3 C2                    1         .word LINK 
                           003366     2         LINK=.
      00B3E6 03                       3         .byte 3  
      00B3E7 46 3E 44                 4         .ascii "F>D"
      00B3EA                          5         FTOD:
      00B3EA CD AC AD         [ 4] 1002     CALL ATEXP ; m e 
      00B3ED CD 88 54         [ 4] 1003     CALL QDUP
      003370                       1004     _QBRAN FTOD9
      00B3F0 CD 85 18         [ 4]    1     CALL QBRAN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 181.
Hexadecimal [24-Bits]



      00B3F3 B4 80                    2     .word FTOD9
      00B3F5 CD 86 6A         [ 4] 1005     CALL TOR 
      00B3F8 CD A6 1F         [ 4] 1006     CALL DSIGN 
      00B3FB CD 88 84         [ 4] 1007     CALL NROT 
      00B3FE CD A6 08         [ 4] 1008     CALL DABS
      00B401 CD 85 B4         [ 4] 1009     CALL RFROM  
      00B404 CD 86 A1         [ 4] 1010     CALL DUPP   
      00B407 CD 86 D8         [ 4] 1011     CALL ZLESS 
      00338A                       1012     _QBRAN FTOD4 
      00B40A CD 85 18         [ 4]    1     CALL QBRAN
      00B40D B4 48                    2     .word FTOD4
                                   1013 ; negative exponent 
      00B40F CD 89 6A         [ 4] 1014     CALL ABSS 
      00B412 CD 86 6A         [ 4] 1015     CALL TOR
      003395                       1016     _BRAN FTOD2  
      00B415 CD 85 34         [ 4]    1     CALL BRAN 
      00B418 B4 33                    2     .word FTOD2 
      00B41A                       1017 FTOD1:
      00B41A CD 88 B1         [ 4] 1018     CALL DDUP 
      00B41D CD A7 FF         [ 4] 1019     CALL DZEQUAL 
      0033A0                       1020     _TBRAN FTOD3 
      00B420 CD 85 26         [ 4]    1     CALL TBRAN 
      00B423 B4 3D                    2     .word FTOD3 
      0033A5                       1021     _DOLIT 10 
      00B425 CD 84 EF         [ 4]    1     CALL DOLIT 
      00B428 00 0A                    2     .word 10 
      00B42A CD A6 39         [ 4] 1022     CALL DSLMOD 
      00B42D CD 88 65         [ 4] 1023     CALL ROT 
      00B430 CD 86 97         [ 4] 1024     CALL DROP
      00B433                       1025 FTOD2:      
      0033B3                       1026     _DONXT FTOD1
      00B433 CD 85 03         [ 4]    1     CALL DONXT 
      00B436 B4 1A                    2     .word FTOD1 
      0033B8                       1027     _BRAN FTOD8   
      00B438 CD 85 34         [ 4]    1     CALL BRAN 
      00B43B B4 75                    2     .word FTOD8 
      00B43D                       1028 FTOD3: 
      00B43D CD 85 B4         [ 4] 1029     CALL RFROM 
      00B440 CD 86 97         [ 4] 1030     CALL DROP 
      0033C3                       1031     _BRAN FTOD8  
      00B443 CD 85 34         [ 4]    1     CALL BRAN 
      00B446 B4 75                    2     .word FTOD8 
                                   1032 ; positive exponent 
      00B448                       1033 FTOD4:
      00B448 CD 86 6A         [ 4] 1034     CALL TOR 
      0033CB                       1035     _BRAN FTOD6
      00B44B CD 85 34         [ 4]    1     CALL BRAN 
      00B44E B4 70                    2     .word FTOD6 
      00B450                       1036 FTOD5:
      00B450 CD 88 B1         [ 4] 1037     CALL DDUP 
      0033D3                       1038     _DOLIT 0XCCCC
      00B453 CD 84 EF         [ 4]    1     CALL DOLIT 
      00B456 CC CC                    2     .word 0XCCCC 
      0033D8                       1039     _DOLIT 0XCCC  
      00B458 CD 84 EF         [ 4]    1     CALL DOLIT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 182.
Hexadecimal [24-Bits]



      00B45B 0C CC                    2     .word 0XCCC 
      00B45D CD A8 39         [ 4] 1040     CALL DGREAT 
      0033E0                       1041     _TBRAN FTOD3 
      00B460 CD 85 26         [ 4]    1     CALL TBRAN 
      00B463 B4 3D                    2     .word FTOD3 
      0033E5                       1042     _DOLIT 10 
      00B465 CD 84 EF         [ 4]    1     CALL DOLIT 
      00B468 00 0A                    2     .word 10 
      00B46A CD 8C 61         [ 4] 1043     CALL ZERO 
      00B46D CD A9 E3         [ 4] 1044     CALL DSTAR 
      00B470                       1045 FTOD6: 
      0033F0                       1046     _DONXT FTOD5 
      00B470 CD 85 03         [ 4]    1     CALL DONXT 
      00B473 B4 50                    2     .word FTOD5 
      00B475                       1047 FTOD8:
      00B475 CD 88 65         [ 4] 1048     CALL ROT 
      0033F8                       1049     _QBRAN FTOD9 
      00B478 CD 85 18         [ 4]    1     CALL QBRAN
      00B47B B4 80                    2     .word FTOD9
      00B47D CD 89 16         [ 4] 1050     CALL DNEGA
      00B480                       1051 FTOD9:          
      00B480 81               [ 4] 1052     RET 
                                   1053 
                                   1054 
                                   1055 ;;;;;;;;;;;;;;;;;;;;;;;;
                                   1056 ;   F0< ( f# -- f )
                                   1057 ;   true if f#<0
                                   1058 ;;;;;;;;;;;;;;;;;;;;;;;;
      003401                       1059     _HEADER FZLESS,3,"F0<"
      00B481 B3 E6                    1         .word LINK 
                           003403     2         LINK=.
      00B483 03                       3         .byte 3  
      00B484 46 30 3C                 4         .ascii "F0<"
      00B487                          5         FZLESS:
      00B487 CD AC AD         [ 4] 1060     CALL ATEXP 
      00B48A CD 86 97         [ 4] 1061     CALL DROP 
      00B48D CD 86 B1         [ 4] 1062     CALL SWAPP 
      00B490 CD 86 97         [ 4] 1063     CALL DROP 
      00B493 CD 86 D8         [ 4] 1064     CALL ZLESS 
      00B496 81               [ 4] 1065     RET
                                   1066 
                                   1067 ;;;;;;;;;;;;;;;;;;;;;;;;
                                   1068 ;   F< ( f#1 f#2 -- f )
                                   1069 ; true if f#1 < f#1 
                                   1070 ;;;;;;;;;;;;;;;;;;;;;;;
      003417                       1071     _HEADER FLESS,2,"F<"
      00B497 B4 83                    1         .word LINK 
                           003419     2         LINK=.
      00B499 02                       3         .byte 2  
      00B49A 46 3C                    4         .ascii "F<"
      00B49C                          5         FLESS:
      00B49C CD B1 3A         [ 4] 1072     CALL FSUB  
      00B49F CC B4 87         [ 2] 1073     JP FZLESS
                                   1074 
                                   1075 ;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 183.
Hexadecimal [24-Bits]



                                   1076 ;   F> ( f#1 f#2 -- f )
                                   1077 ;   true fi f#1>f#2
                                   1078 ;;;;;;;;;;;;;;;;;;;;;;;;;
      003422                       1079     _HEADER FGREAT,2,"F>"
      00B4A2 B4 99                    1         .word LINK 
                           003424     2         LINK=.
      00B4A4 02                       3         .byte 2  
      00B4A5 46 3E                    4         .ascii "F>"
      00B4A7                          5         FGREAT:
      00B4A7 CD A7 2A         [ 4] 1080     CALL DSWAP 
      00B4AA CC B4 9C         [ 2] 1081     JP FLESS 
                                   1082 
                                   1083 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1084 ;   F= ( f#1 f#2 -- f ) 
                                   1085 ;   true fi f#1==f#2 
                                   1086 ;;;;;;;;;;;;;;;;;;;;;;;;;
      00342D                       1087     _HEADER FEQUAL,2,"F="
      00B4AD B4 A4                    1         .word LINK 
                           00342F     2         LINK=.
      00B4AF 02                       3         .byte 2  
      00B4B0 46 3D                    4         .ascii "F="
      00B4B2                          5         FEQUAL:
      00B4B2 CC A8 18         [ 2] 1088     JP DEQUAL 
                                   1089 
                                   1090 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1091 ;   F0= ( f# -- f )
                                   1092 ;   true if f# is 0.0 
                                   1093 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      003435                       1094     _HEADER FZEQUAL,3,"F0="
      00B4B5 B4 AF                    1         .word LINK 
                           003437     2         LINK=.
      00B4B7 03                       3         .byte 3  
      00B4B8 46 30 3D                 4         .ascii "F0="
      00B4BB                          5         FZEQUAL:
      00B4BB CD AC AD         [ 4] 1095     CALL ATEXP 
      00B4BE CD 86 97         [ 4] 1096     CALL DROP 
      00B4C1 CC A7 FF         [ 2] 1097     JP DZEQUAL  
                                   1098 
                                   1099 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1100 ;  FNEGATE ( f#1 -- f#2 )
                                   1101 ;  f#2 is negation of f#1 
                                   1102 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      003444                       1103     _HEADER FNEGA,7,"FNEGATE"
      00B4C4 B4 B7                    1         .word LINK 
                           003446     2         LINK=.
      00B4C6 07                       3         .byte 7  
      00B4C7 46 4E 45 47 41 54 45     4         .ascii "FNEGATE"
      00B4CE                          5         FNEGA:
      00B4CE CD AC AD         [ 4] 1104     CALL ATEXP 
      00B4D1 CD 86 6A         [ 4] 1105     CALL TOR 
      00B4D4 CD 89 16         [ 4] 1106     CALL DNEGA
      00B4D7 CD 85 B4         [ 4] 1107     CALL RFROM 
      00B4DA CD AC DF         [ 4] 1108     CALL STEXP 
      00B4DD CD AC 60         [ 4] 1109     CALL SFN 
      00B4E0 81               [ 4] 1110     RET 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 184.
Hexadecimal [24-Bits]



                                   1111 
                                   1112 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1113 ;  FABS ( f#1 -- abs(f#1) )
                                   1114 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      003461                       1115     _HEADER FABS,4,"FABS"
      00B4E1 B4 C6                    1         .word LINK 
                           003463     2         LINK=.
      00B4E3 04                       3         .byte 4  
      00B4E4 46 41 42 53              4         .ascii "FABS"
      00B4E8                          5         FABS:
      00B4E8 CD AC AD         [ 4] 1116     CALL ATEXP 
      00B4EB CD 86 6A         [ 4] 1117     CALL TOR 
      00B4EE CD 86 A1         [ 4] 1118     CALL DUPP 
      003471                       1119     _DOLIT 0X80 
      00B4F1 CD 84 EF         [ 4]    1     CALL DOLIT 
      00B4F4 00 80                    2     .word 0X80 
      00B4F6 CD 86 FE         [ 4] 1120     CALL ANDD 
      003479                       1121     _QBRAN FABS1
      00B4F9 CD 85 18         [ 4]    1     CALL QBRAN
      00B4FC B5 01                    2     .word FABS1
      00B4FE CD 89 16         [ 4] 1122     CALL DNEGA 
      00B501                       1123 FABS1: 
      00B501 CD 85 B4         [ 4] 1124     CALL RFROM 
      00B504 CD AC DF         [ 4] 1125     CALL STEXP 
      00B507 CD AC 60         [ 4] 1126     CALL SFN 
      00B50A 81               [ 4] 1127     RET 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 185.
Hexadecimal [24-Bits]



                                   4486 .endif 
                                   4487 
                                   4488 ;===============================================================
                                   4489 
                           003463  4490 LASTN =	LINK   ;last name defined
                                   4491 
                                   4492 ; application code begin here
      00B580                       4493 	.bndry 128 ; align on flash block  
      00B580                       4494 app_space: 
                                   4495 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 186.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   6 AB1        0008F3 R   |   6 ABOR1      0013CC R
  6 ABOR2      0013E3 R   |   6 ABORQ      0013C4 R   |   6 ABORT      0013B5 R
  6 ABRTQ      0016A6 R   |   6 ABSS       0008EA R   |   6 ACCEP      00134B R
  6 ACCP1      001354 R   |   6 ACCP2      00137A R   |   6 ACCP3      00137D R
  6 ACCP4      00137F R   |     ADC_CR1 =  005401     |     ADC_CR1_=  000000 
    ADC_CR1_=  000001     |     ADC_CR1_=  000004     |     ADC_CR1_=  000005 
    ADC_CR1_=  000006     |     ADC_CR2 =  005402     |     ADC_CR2_=  000003 
    ADC_CR2_=  000004     |     ADC_CR2_=  000005     |     ADC_CR2_=  000006 
    ADC_CR2_=  000001     |     ADC_CR3 =  005403     |     ADC_CR3_=  000007 
    ADC_CR3_=  000006     |     ADC_CSR =  005400     |     ADC_CSR_=  000006 
    ADC_CSR_=  000004     |     ADC_CSR_=  000000     |     ADC_CSR_=  000001 
    ADC_CSR_=  000002     |     ADC_CSR_=  000003     |     ADC_CSR_=  000007 
    ADC_CSR_=  000005     |     ADC_DRH =  005404     |     ADC_DRL =  005405 
    ADC_TDRH=  005406     |     ADC_TDRL=  005407     |   6 ADRADJ     0007C4 R
    AFR     =  004803     |     AFR0_ADC=  000000     |     AFR1_TIM=  000001 
    AFR2_CCO=  000002     |     AFR3_TIM=  000003     |     AFR4_TIM=  000004 
    AFR5_TIM=  000005     |     AFR6_I2C=  000006     |     AFR7_BEE=  000007 
  6 AFT        001691 R   |   6 AGAIN      0015E7 R   |   6 AHEAD      001644 R
  6 ALLOT      0014F4 R   |   6 ANDD       00067E R   |     APP_CP  =  004004 
    APP_LAST=  004000     |     APP_RUN =  004002     |     APP_VP  =  004006 
  6 AT         0004E3 R   |   6 ATEXE      000CF4 R   |   6 ATEXP      002C2D R
  6 ATEXP1     002C42 R   |   6 ATEXP2     002C52 R   |   6 AUTORUN    000129 R
    AWU_APR =  0050F1     |     AWU_CSR =  0050F0     |     AWU_TBR =  0050F2 
    B0_MASK =  000001     |     B115200 =  000006     |   6 B115K2     0003E0 R
    B19200  =  000003     |   6 B19K2      0003BD R   |     B1_MASK =  000002 
    B230400 =  000007     |     B2400   =  000000     |   6 B2K4       00038E R
    B2_MASK =  000004     |     B38400  =  000004     |     B3_MASK =  000008 
    B460800 =  000008     |     B4800   =  000001     |   6 B4K8       00039C R
    B4_MASK =  000010     |     B57600  =  000005     |   6 B57K6      0003CE R
    B5_MASK =  000020     |     B6_MASK =  000040     |     B7_MASK =  000080 
    B921600 =  000009     |     B9600   =  000002     |   6 B9K6       0003AC R
  6 BACK1      0012F3 R   |   6 BASE       0006E7 R   |     BASEE   =  00000A 
  6 BAUD       0003F0 R   |     BCNT    =  000001     |   6 BCOMP      001537 R
  6 BDIGS      000DDB R   |     BEEP_BIT=  000004     |     BEEP_CSR=  0050F3 
    BEEP_MAS=  000010     |     BEEP_POR=  00000F     |   6 BEGIN      0015C9 R
    BIT0    =  000000     |     BIT1    =  000001     |     BIT2    =  000002 
    BIT3    =  000003     |     BIT4    =  000004     |     BIT5    =  000005 
    BIT6    =  000006     |     BIT7    =  000007     |   6 BKSLA      001148 R
  6 BKSP       0012C3 R   |     BKSPP   =  000008     |   6 BLANK      000BD4 R
    BLOCK_SI=  000080     |     BOOT_ROM=  006000     |     BOOT_ROM=  007FFF 
  6 BRAN       0004B4 R   |     BTW     =  000001     |   6 BUF2ROW    002108 R
  6 BYE        0000B6 R   |     CADR    =  000003     |     CALLL   =  0000CD 
  6 CALLOT     002351 R   |     CAN_DGR =  005426     |     CAN_FPSR=  005427 
    CAN_IER =  005425     |     CAN_MCR =  005420     |     CAN_MSR =  005421 
    CAN_P0  =  005428     |     CAN_P1  =  005429     |     CAN_P2  =  00542A 
    CAN_P3  =  00542B     |     CAN_P4  =  00542C     |     CAN_P5  =  00542D 
    CAN_P6  =  00542E     |     CAN_P7  =  00542F     |     CAN_P8  =  005430 
    CAN_P9  =  005431     |     CAN_PA  =  005432     |     CAN_PB  =  005433 
    CAN_PC  =  005434     |     CAN_PD  =  005435     |     CAN_PE  =  005436 
    CAN_PF  =  005437     |     CAN_RFR =  005424     |     CAN_TPR =  005423 
    CAN_TSR =  005422     |     CARRY   =  00002A     |     CASE_SEN=  000000 
  6 CAT        000501 R   |   6 CCOMMA     001519 R   |     CC_C    =  000000 
    CC_H    =  000004     |     CC_I0   =  000003     |     CC_I1   =  000005 
    CC_N    =  000002     |     CC_V    =  000007     |     CC_Z    =  000001 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 187.
Hexadecimal [24-Bits]

Symbol Table

    CELLL   =  000002     |   6 CELLM      000B59 R   |   6 CELLP      000B4A R
  6 CELLS      000B68 R   |     CFG_GCR =  007F60     |     CFG_GCR_=  000001 
    CFG_GCR_=  000000     |   6 CHAR1      000F31 R   |   6 CHAR2      000F34 R
  6 CHKIVEC    001FF6 R   |     CLKOPT  =  004807     |     CLKOPT_C=  000002 
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
    CLK_SWR_=  0000D2     |   6 CMOV1      000D13 R   |   6 CMOV2      000D2B R
  6 CMOVE      000D0B R   |     CNTDWN  =  000032     |   6 CNTXT      00076A R
  6 COLD       001AF7 R   |   6 COLD1      001AF7 R   |   6 COLON      001849 R
  6 COMMA      001502 R   |   6 COMPI      001547 R   |     COMPO   =  000040 
  6 CONSTANT   0018F3 R   |   6 COUNT      000CA7 R   |   6 CPP        000786 R
    CPU_A   =  007F00     |     CPU_CCR =  007F0A     |     CPU_PCE =  007F01 
    CPU_PCH =  007F02     |     CPU_PCL =  007F03     |     CPU_SPH =  007F08 
    CPU_SPL =  007F09     |     CPU_XH  =  007F04     |     CPU_XL  =  007F05 
    CPU_YH  =  007F06     |     CPU_YL  =  007F07     |   6 CR         000F59 R
  6 CREAT      00188F R   |     CRR     =  00000D     |   6 CSTOR      0004F0 R
  6 CTABLE     002372 R   |   6 CTAT       002393 R   |   6 CTINIT     0023BB R
  6 D2SLASH    0028D6 R   |   6 D2STAR     0028ED R   |   6 DABS       002588 R
  6 DABS1      002596 R   |   6 DAT        000C8B R   |     DATSTK  =  001680 
  6 DCLZ       0026D8 R   |   6 DCLZ1      0026E1 R   |   6 DCLZ4      0026EA R
  6 DCLZ8      0026F7 R   |   6 DCONST     001928 R   |   6 DDIG       0025FA R
  6 DDIGS      002613 R   |   6 DDOT       00262A R   |   6 DDOT0      00263E R
  6 DDOT1      002654 R   |   6 DDROP      000826 R   |   6 DDSLMOD    002A78 R
  6 DDSTAR3    0029BC R   |   6 DDUP       000831 R   |     DEBUG_BA=  007F00 
    DEBUG_EN=  007FFF     |   6 DECIM      000E8B R   |   6 DEPTH      000C23 R
  6 DEQU4      0027AD R   |   6 DEQUAL     002798 R   |     DEVID_BA=  0048CD 
    DEVID_EN=  0048D8     |     DEVID_LO=  0048D2     |     DEVID_LO=  0048D3 
    DEVID_LO=  0048D4     |     DEVID_LO=  0048D5     |     DEVID_LO=  0048D6 
    DEVID_LO=  0048D7     |     DEVID_LO=  0048D8     |     DEVID_WA=  0048D1 
    DEVID_XH=  0048CE     |     DEVID_XL=  0048CD     |     DEVID_YH=  0048D0 
    DEVID_YL=  0048CF     |   6 DGREAT     0027B9 R   |   6 DGTQ1      000ED0 R
  6 DI         0000C4 R   |   6 DIG        000E04 R   |   6 DIGIT      000D9F R
  6 DIGS       000E15 R   |   6 DIGS1      000E15 R   |   6 DIGS2      000E22 R
  6 DIGTQ      000E9F R   |     DISCOVER=  000000     |   6 DLESS      0027C4 R
  6 DLESS4     0027D8 R   |   6 DLITER     002896 R   |   6 DLSHIFT    002909 R
  6 DLSHIFT1   00291A R   |   6 DLSHIFT2   00292F R   |     DM_BK1RE=  007F90 
    DM_BK1RH=  007F91     |     DM_BK1RL=  007F92     |     DM_BK2RE=  007F93 
    DM_BK2RH=  007F94     |     DM_BK2RL=  007F95     |     DM_CR1  =  007F96 
    DM_CR2  =  007F97     |     DM_CSR1 =  007F98     |     DM_CSR2 =  007F99 
    DM_ENFCT=  007F9A     |   6 DN1        0008B1 R   |   6 DNEGA      000896 R
  6 DOCONST    001913 R   |   6 DOLIT      00046F R   |   6 DONXT      000483 R
    DOORBELL=  000000     |   6 DOSTR      000F69 R   |   6 DOT        001000 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 188.
Hexadecimal [24-Bits]

Symbol Table

  6 DOT1       001016 R   |   6 DOTI1      001A78 R   |   6 DOTID      001A62 R
  6 DOTO1      001458 R   |   6 DOTOK      00143E R   |   6 DOTPR      001129 R
  6 DOTQ       0016C0 R   |   6 DOTQP      000F86 R   |   6 DOTR       000F94 R
  6 DOTS       001A04 R   |   6 DOTS1      001A0F R   |   6 DOTS2      001A18 R
  6 DOVAR      0006D7 R   |   6 DOVER      0028BD R   |   6 DO_DCONS   00194B R
  6 DPLUS      002AB7 R   |   6 DPLUS1     002ADE R   |   6 DRAT       00282C R
  6 DRFROM     002814 R   |   6 DROP       000617 R   |   6 DROT       002744 R
  6 DRSHIFT    002940 R   |   6 DRSHIFT1   002947 R   |   6 DRSHIFT2   00295D R
  6 DSIGN      00259F R   |   6 DSIGN1     0025A9 R   |   6 DSLA9      002AA2 R
  6 DSLASH     002AA8 R   |   6 DSLMOD     0025B9 R   |   6 DSLMOD3    0025D4 R
  6 DSLMOD4    0025E0 R   |   6 DSLMODa    0025DB R   |   6 DSLMODb    0025E6 R
  6 DSSTAR     002684 R   |   6 DSSTAR3    0026A1 R   |   6 DSTAR      002963 R
  6 DSTOR      000C72 R   |   6 DSUB       002AE9 R   |   6 DSUB1      002B10 R
  6 DSWAP      0026AA R   |   6 DTOF       003346 R   |   6 DTOF1      00334F R
  6 DTOF2      00335D R   |   6 DTOR       0027F6 R   |   6 DUMP       0019BA R
  6 DUMP1      0019D1 R   |   6 DUMP3      0019F3 R   |   6 DUMPP      001989 R
  6 DUPP       000621 R   |   6 DVARIA     00284A R   |   6 DZEQUAL    00277F R
  6 DZLESS     0027DF R   |   6 DZLESS1    0027E9 R   |   6 EDIGS      000E40 R
  6 EDOT       002CB3 R   |   6 EDOT0      002CCA R   |   6 EDOT2      002CD6 R
  6 EDOT3      002CEF R   |   6 EDOT4      002D1B R   |   6 EDOT5      002D3A R
  6 EECSTORE   001DA7 R   |   6 EEPCP      001BCD R   |   6 EEPLAST    001BA0 R
  6 EEPROM     001B88 R   |     EEPROM_B=  004000     |     EEPROM_E=  0047FF 
    EEPROM_R=  000010     |     EEPROM_S=  000800     |   6 EEPRUN     001BB7 R
  6 EEPVP      001BE3 R   |   6 EESTORE    001DF3 R   |   6 EE_CCOMM   0020BD R
  6 EE_COMMA   00209C R   |   6 EE_CREAD   001D38 R   |   6 EE_READ    001D16 R
  6 EI         0000BD R   |   6 ELSEE      00161F R   |   6 EMIT       000436 R
  6 ENEPER     0022DD R   |     EOL_CR  =  000001     |     EOL_LF  =  000000 
  6 EQ1        00090E R   |   6 EQUAL      0008F8 R   |   6 ERASE      000D6D R
    ERR     =  00001B     |   6 EVAL       001481 R   |   6 EVAL1      001481 R
  6 EVAL2      00149D R   |   6 EXE1       000D02 R   |   6 EXECU      0004C4 R
    EXT     =  000000     |     EXTI_CR1=  0050A0     |     EXTI_CR2=  0050A1 
  6 EXTRC      000DC7 R   |   6 FABS       003468 R   |   6 FABS1      003481 R
  6 FADDR      00218A R   |   6 FALGN4     003018 R   |   6 FALGN6     003027 R
  6 FALGN7     00304E R   |   6 FALGN71    00305D R   |   6 FALGN72    003079 R
  6 FALGN8     00307C R   |   6 FALIGN     002FDF R   |   6 FARAT      001C4E R
  6 FARCAT     001C5A R   |   6 FC_XOFF    000463 R   |   6 FC_XON     00044D R
  6 FDOT       002D49 R   |   6 FDOT0      002D87 R   |   6 FDOT1      002D76 R
  6 FDOT10     002DE3 R   |   6 FDOT2      002D95 R   |   6 FDOT3      002DAE R
  6 FDOT6      002DBE R   |   6 FDOT7      002DC3 R   |   6 FDOT8      002DCB R
  6 FDOT9      002DD3 R   |   6 FEQUAL     003432 R   |   6 FER        002B4B R
  6 FGREAT     003427 R   |     FHSE    =  7A1200     |     FHSI    =  F42400 
  6 FILL       000D3A R   |   6 FILL1      000D57 R   |   6 FILL2      000D60 R
  6 FIND       00121F R   |   6 FIND1      00123D R   |   6 FIND2      00126B R
  6 FIND3      001277 R   |   6 FIND4      00128B R   |   6 FIND5      001298 R
  6 FIND6      00127C R   |   6 FINIT      002B41 R   |     FLASH_BA=  008000 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 189.
Hexadecimal [24-Bits]

Symbol Table

    FLASH_NF=  000000     |     FLASH_NF=  000001     |     FLASH_NF=  000002 
    FLASH_NF=  000003     |     FLASH_NF=  000004     |     FLASH_NF=  000005 
    FLASH_PU=  005062     |     FLASH_PU=  000056     |     FLASH_PU=  0000AE 
    FLASH_SI=  020000     |     FLASH_WS=  00480D     |   6 FLESS      00341C R
  6 FLOATQ     002E5B R   |   6 FLOATQ0    002E65 R   |   6 FLOATQ1    002ECA R
  6 FLOATQ2    002ED3 R   |   6 FLOATQ3    002EDB R   |   6 FLOATQ4    002EEF R
  6 FLOAT_ER   002F0A R   |   6 FLOAT_ER   002F07 R   |     FLSI    =  01F400 
  6 FMOVE      002195 R   |   6 FMOVE2     0021C6 R   |   6 FNE        002B6E R
  6 FNEGA      00344E R   |   6 FOR        001591 R   |   6 FORGET     00015A R
  6 FORGET1    000189 R   |   6 FORGET2    00020F R   |   6 FORGET4    000218 R
  6 FORGET6    0001D1 R   |   6 FOV        002B89 R   |   6 FPLUS      003088 R
  6 FPLUS1     0030A8 R   |   6 FPSTOR     001B69 R   |   6 FPSW       002B1D R
    FPTR    =  000034     |   6 FREEVAR    000225 R   |   6 FREEVAR4   00025B R
  6 FRESET     002B2F R   |   6 FSLASH     003274 R   |   6 FSLASH1    0032B6 R
  6 FSLASH8    00331C R   |   6 FSLASH9    003333 R   |   6 FSTAR      00324D R
  6 FSUB       0030BA R   |   6 FSUB1      0030DA R   |   6 FTOD       00336A R
  6 FTOD1      00339A R   |   6 FTOD2      0033B3 R   |   6 FTOD3      0033BD R
  6 FTOD4      0033C8 R   |   6 FTOD5      0033D0 R   |   6 FTOD6      0033F0 R
  6 FTOD8      0033F5 R   |   6 FTOD9      003400 R   |   6 FZE        002B58 R
  6 FZEQUAL    00343B R   |   6 FZLESS     003407 R   |     GPIO_BAS=  005000 
    GPIO_CR1=  000003     |     GPIO_CR2=  000004     |     GPIO_DDR=  000002 
    GPIO_IDR=  000001     |     GPIO_ODR=  000000     |     GPIO_SIZ=  000005 
  6 GREAT      000973 R   |   6 GREAT1     000989 R   |   6 HDOT       000FE3 R
  6 HERE       000CBE R   |   6 HEX        000E76 R   |   6 HI         001AB4 R
  6 HLD        000757 R   |   6 HOLD       000DEB R   |     HSECNT  =  004809 
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
  6 ICOLON     00185A R   |   6 IFETCH     0015AF R   |   6 IFF        0015F7 R
  6 IFMOVE     00226E R   |     IMEDD   =  000080     |   6 IMMED      00186C R
  6 INCH       00042A R   |   6 INC_FPTR   001CE3 R   |   6 INITOFS    001822 R
  6 INN        000705 R   |     INPUT_DI=  000000     |     INPUT_EI=  000001 
    INPUT_FL=  000000     |     INPUT_PU=  000001     |   6 INTE1      001420 R
  6 INTER      0013F6 R   |   6 INTQ       002417 R   |     INT_ADC2=  000016 
    INT_AUAR=  000012     |     INT_AWU =  000001     |     INT_CAN_=  000008 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 190.
Hexadecimal [24-Bits]

Symbol Table

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
  6 INVER      000873 R   |     IPR0    =  000002     |     IPR1    =  000001 
    IPR2    =  000000     |     IPR3    =  000003     |     IPR_MASK=  000003 
    IRET_COD=  000080     |   6 ISEMI      0017B7 R   |     ITC_SPR1=  007F70 
    ITC_SPR2=  007F71     |     ITC_SPR3=  007F72     |     ITC_SPR4=  007F73 
    ITC_SPR5=  007F74     |     ITC_SPR6=  007F75     |     ITC_SPR7=  007F76 
    ITC_SPR8=  007F77     |     IWDG_KR =  0050E0     |     IWDG_PR =  0050E1 
    IWDG_RLR=  0050E2     |   6 JFETCH     0015BA R   |   6 JSRC       00180C R
  6 KEY        000EDF R   |   6 KTAP       001310 R   |   6 KTAP1      001333 R
  6 KTAP2      001336 R   |   6 LAST       000796 R   |   6 LASTN   =  003463 R
  6 LBRAC      00142D R   |     LED2_BIT=  000005     |     LED2_MAS=  000020 
    LED2_POR=  00500A     |   6 LESS       000935 R   |     LF      =  00000A 
  6 LINK    =  003463 R   |   6 LITER      001569 R   |   6 LN2S       002339 R
  6 LOCAL      000554 R   |   6 LOCK       001CCF R   |   6 LOG2S      002323 R
  6 LSCALE     002F29 R   |   6 LSHIFT     000B93 R   |   6 LSHIFT1    000B9C R
  6 LSHIFT4    000BA4 R   |   6 LT1        00094B R   |     MASKK   =  001F7F 
  6 MAX        000993 R   |   6 MAX1       0009A6 R   |     MAX_MANT=  7FFFFF 
  6 MIN        0009B0 R   |   6 MIN1       0009C3 R   |   6 MMOD1      000A4C R
  6 MMOD2      000A60 R   |   6 MMOD3      000A77 R   |   6 MMSM1      000A07 R
  6 MMSM3      000A0B R   |   6 MMSM4      000A17 R   |   6 MMSMa      000A12 R
  6 MMSMb      000A1D R   |   6 MMSTA1     00317B R   |   6 MMSTA2     003186 R
  6 MMSTA3     003191 R   |   6 MMSTA4     0031FC R   |   6 MMSTA5     00320E R
  6 MMSTA6     003227 R   |   6 MMSTA7     003244 R   |   6 MMSTAR     003170 R
  6 MODD       000A91 R   |   6 MONE       000BFA R   |     MS      =  000030 
  6 MSEC       0002D0 R   |   6 MSMOD      000A2F R   |   6 MSTA1      000B22 R
  6 MSTAR      000AFF R   |     NAFR    =  004804     |   6 NAMEQ      0012B8 R
  6 NAMET      0011C9 R   |     NCLKOPT =  004808     |   6 NDROT      002708 R
  6 NEGAT      000884 R   |   6 NEX1       000490 R   |   6 NEXT       0015A0 R
    NFLASH_W=  00480E     |     NHSECNT =  00480A     |     NOPT1   =  004802 
    NOPT2   =  004804     |     NOPT3   =  004806     |     NOPT4   =  004808 
    NOPT5   =  00480A     |     NOPT6   =  00480C     |     NOPT7   =  00480E 
    NOPTBL  =  00487F     |   6 NRAT       0005A3 R   |   6 NRDROP     00057D R
  6 NROT       000804 R   |   6 NRSTO      0005C4 R   |   6 NTIB       000715 R
    NUBC    =  004802     |     NUCLEO  =  000001     |   6 NUFQ       000EF5 R
  6 NUFQ1      000F0E R   |   6 NUMBQ      0024C0 R   |   6 NUMQ0      002501 R
  6 NUMQ1      002523 R   |   6 NUMQ3      00254D R   |   6 NUMQ4      00256E R
  6 NUMQ8      002577 R   |     NWDGOPT =  004806     |     NWDGOPT_=  FFFFFFFD 
    NWDGOPT_=  FFFFFFFC     |     NWDGOPT_=  FFFFFFFF     |     NWDGOPT_=  FFFFFFFE 
  6 NonHandl   000000 R   |   6 OFFSET     0007BB R   |     OFS     =  000005 
  6 ONE        000BEC R   |   6 ONEM       000B82 R   |   6 ONEP       000B75 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 191.
Hexadecimal [24-Bits]

Symbol Table

    OPT     =  000002     |     OPT0    =  004800     |     OPT1    =  004801 
    OPT2    =  004803     |     OPT3    =  004805     |     OPT4    =  004807 
    OPT5    =  004809     |     OPT6    =  00480B     |     OPT7    =  00480D 
    OPTBL   =  00487E     |     OPTIMIZE=  000001     |     OPTION_B=  004800 
    OPTION_E=  00487F     |     OPTION_S=  000080     |   6 ORIG       000049 R
  6 ORR        000692 R   |   6 OUTPUT     00043B R   |     OUTPUT_F=  000001 
    OUTPUT_O=  000000     |     OUTPUT_P=  000001     |     OUTPUT_S=  000000 
  6 OVER       000649 R   |   6 OVERT      001785 R   |     PA      =  000000 
  6 PACKS      000D7E R   |   6 PAD        000CCF R   |   6 PAREN      001138 R
  6 PARS       001031 R   |   6 PARS1      00105C R   |   6 PARS2      001087 R
  6 PARS3      00108A R   |   6 PARS4      001093 R   |   6 PARS5      0010B6 R
  6 PARS6      0010CB R   |   6 PARS7      0010DA R   |   6 PARS8      0010E9 R
  6 PARSE      0010FA R   |   6 PARSEXP_   002E3E R   |   6 PAUSE      0002E0 R
    PA_BASE =  005000     |     PA_CR1  =  005003     |     PA_CR2  =  005004 
    PA_DDR  =  005002     |     PA_IDR  =  005001     |     PA_ODR  =  005000 
    PB      =  000005     |     PB_BASE =  005005     |     PB_CR1  =  005008 
    PB_CR2  =  005009     |     PB_DDR  =  005007     |     PB_IDR  =  005006 
    PB_ODR  =  005005     |     PC      =  00000A     |     PC_BASE =  00500A 
    PC_CR1  =  00500D     |     PC_CR2  =  00500E     |     PC_DDR  =  00500C 
    PC_IDR  =  00500B     |     PC_ODR  =  00500A     |     PD      =  00000F 
  6 PDUM1      00199C R   |   6 PDUM2      0019AD R   |     PD_BASE =  00500F 
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
    PI      =  000028     |   6 PICK       000C3A R   |   6 PII        00229C R
    PI_BASE =  005028     |     PI_CR1  =  00502B     |     PI_CR2  =  00502C 
    PI_DDR  =  00502A     |     PI_IDR  =  005029     |     PI_ODR  =  005028 
  6 PLUS       000846 R   |   6 PNAM1      00172A R   |   6 PRESE      0014AC R
    PROD1   =  000024     |     PROD2   =  000026     |     PROD3   =  000028 
  6 PROTECTE   000201 R   |   6 PSTOR      000C51 R   |     PTR16   =  000035 
    PTR8    =  000036     |   6 PTRPLUS    001CFB R   |   6 QBRAN      000498 R
  6 QDUP       0007D4 R   |   6 QDUP1      0007DE R   |   6 QKEY       000418 R
  6 QSTAC      001464 R   |   6 QUERY      001390 R   |   6 QUEST      001023 R
  6 QUIT       0014C9 R   |   6 QUIT1      0014D1 R   |   6 QUIT2      0014D4 R
  6 RAM2EE     002136 R   |     RAMBASE =  000000     |   6 RAMLAST    0007A9 R
    RAM_BASE=  000000     |     RAM_END =  0017FF     |     RAM_SIZE=  001800 
  6 RANDOM     00027E R   |   6 RAT        000545 R   |   6 RBRAC      0017F9 R
  6 REPEA      001674 R   |   6 RFREE      00211D R   |   6 RFROM      000534 R
    ROP     =  004800     |   6 ROT        0007E5 R   |   6 ROW2BUF    0020DF R
    ROWBUFF =  001680     |     RP0     =  00002E     |   6 RPAT       000511 R
    RPP     =  0017FF     |   6 RPSTO      00051E R   |   6 RSCALE     002F4D R
  6 RSHIFT     000BAF R   |   6 RSHIFT1    000BB8 R   |   6 RSHIFT4    000BC0 R
    RST_SR  =  0050B3     |   6 RT12_2     00230C R   |   6 SAME1      0011E7 R
  6 SAME2      001210 R   |   6 SAMEQ      0011DF R   |   6 SCAL1      003103 R
  6 SCAL2      003127 R   |   6 SCALDN2    002FD1 R   |   6 SCALDN3    002FD4 R
  6 SCALEDOW   002FA5 R   |   6 SCALETOM   0030FD R   |   6 SCALEUP    002F6E R
  6 SCALEUP2   002FA1 R   |   6 SCALEUP3   002FA4 R   |   6 SCOM1      00175F R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 192.
Hexadecimal [24-Bits]

Symbol Table

  6 SCOM2      001762 R   |   6 SCOMP      001741 R   |   6 SEED       000265 R
    SEEDX   =  000038     |     SEEDY   =  00003A     |   6 SEMIS      001795 R
  6 SETISP     0000D0 R   |   6 SET_RAML   0018DC R   |   6 SFN        002BE0 R
    SFR_BASE=  005000     |     SFR_END =  0057FF     |   6 SFV        002C14 R
  6 SFZ        002BA9 R   |   6 SIGN       000E2A R   |   6 SIGN1      000E3A R
  6 SLASH      000A9B R   |   6 SLMOD      000A7F R   |   6 SNAME      0016F4 R
    SP0     =  00002C     |   6 SPACE      000F17 R   |   6 SPACS      000F26 R
  6 SPAT       000601 R   |     SPI_CR1 =  005200     |     SPI_CR2 =  005201 
    SPI_CRCP=  005205     |     SPI_DR  =  005204     |     SPI_ICR =  005202 
    SPI_RXCR=  005206     |     SPI_SR  =  005203     |     SPI_TXCR=  005207 
    SPP     =  001680     |     SPSAVE  =  000001     |   6 SPSTO      00060E R
  6 SQRT10     0022F5 R   |   6 SQRT2      0022B3 R   |   6 SQRT3      0022CA R
  6 SSMOD      000B2B R   |     SSP     =  000001     |     STACK   =  0017FF 
  6 STAR       000AF4 R   |   6 STASL      000B3C R   |   6 STEXP      002C5F R
  6 STEXP1     002C75 R   |   6 STEXP2     002C9F R   |   6 STOD       0008B9 R
  6 STORE      0004D1 R   |   6 STR        000E58 R   |   6 STRCQ      001571 R
  6 STRQ       0016B3 R   |   6 STRQP      000F82 R   |   6 SUBB       0008D0 R
  6 SWAPP      000631 R   |     SWIM_CSR=  007F80     |   6 TAP        0012FA R
  6 TBOOT      001AEB R   |   6 TBRAN      0004A6 R   |   6 TBUF       000725 R
    TBUFFBAS=  001680     |   6 TCHAR      000C0B R   |   6 TEMP       0006F6 R
  6 TEVAL      000748 R   |   6 TFLASH     000737 R   |   6 THENN      00160C R
  6 TIB        000CE0 R   |     TIBB    =  001700     |     TIBBASE =  001700 
    TIC     =  000027     |   6 TICK       0014E0 R   |     TIM1_ARR=  005262 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 193.
Hexadecimal [24-Bits]

Symbol Table

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
  6 TNAM2      001A32 R   |   6 TNAM3      001A50 R   |   6 TNAM4      001A56 R
  6 TNAME      001A2F R   |   6 TOFLASH    000335 R   |   6 TOKEN      0011BB R
  6 TOR        0005EA R   |   6 TORAM      000375 R   |   6 TRUE       000861 R
    TRUEE   =  00FFFF     |   6 TWOSL      000BC7 R   |   6 TYPE1      000F46 R
  6 TYPE2      000F4C R   |   6 TYPES      000F41 R   |   6 Timer4Ha   000005 R
    UART1   =  000000     |     UART1_BA=  005230     |     UART1_BR=  005232 
    UART1_BR=  005233     |     UART1_CR=  005234     |     UART1_CR=  005235 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 194.
Hexadecimal [24-Bits]

Symbol Table

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
    UD4     =  000004     |   6 UDIV10     003128 R   |   6 UDOT       000FCF R
  6 UDOTR      000FAF R   |   6 UDSLA3     0029FB R   |   6 UDSLA4     002A21 R
  6 UDSLA7     002A52 R   |   6 UDSLA8     002A5D R   |   6 UDSLMOD    0029C6 R
  6 UDSSTAR    002662 R   |   6 UEND       000047 R   |     UFPSW   =  000008 
  6 UGREAT     000954 R   |   6 UGREAT1    00096B R   |     UHLD    =  000014 
    UINN    =  00000C     |     UINTER  =  000012     |     ULAST   =  00001C 
  6 ULES1      00092D R   |   6 ULESS      000917 R   |   6 UMMOD      0009EB R
  6 UMOD10     0030E7 R   |   6 UMSTA      000AAA R   |   6 UNIQ1      0016F1 R
  6 UNIQU      0016D2 R   |   6 UNLKEE     001C69 R   |   6 UNLKFL     001C88 R
  6 UNLOCK     001CA7 R   |   6 UNTIL      0015D4 R   |     UOFFSET =  00001E 
  6 UPDATCP    001C26 R   |   6 UPDATLAS   001BFD R   |   6 UPDATPTR   002229 R
  6 UPDATRUN   001C15 R   |   6 UPDATVP    001C3D R   |   6 UPL1       0006D3 R
  6 UPLUS      0006BC R   |     UPP     =  000006     |   6 UPPER      00117E R
  6 UPPER1     0011A1 R   |   6 UPPER2     0011AA R   |     URLAST  =  000022 
    USR_BTN_=  000004     |     USR_BTN_=  000010     |     USR_BTN_=  005015 
    UTFLASH =  000020     |     UTIB    =  000010     |     UTMP    =  00000A 
  6 UTYP1      00196C R   |   6 UTYP2      00197B R   |   6 UTYPE      001967 R
    UVP     =  000018     |   6 UZERO      00002B R   |   6 VARIA      0018A9 R
    VAR_BASE=  000080     |     VAR_TOP =  0017BF     |     VER     =  000004 
  6 VPP        000778 R   |     VSIZE   =  000006     |     WANT_CON=  000001 
    WANT_DEB=  000000     |     WANT_DOU=  000001     |     WANT_FLO=  000001 
    WANT_SCA=  000001     |     WANT_SEE=  000000     |     WDGOPT  =  004805 
    WDGOPT_I=  000002     |     WDGOPT_L=  000003     |     WDGOPT_W=  000000 
    WDGOPT_W=  000001     |   6 WHILE      00165A R   |   6 WITHI      0009D0 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 195.
Hexadecimal [24-Bits]

Symbol Table

  6 WORDD      001164 R   |   6 WORDS      001A8C R   |   6 WORS1      001A92 R
  6 WORS2      001AAE R   |   6 WR_BYTE    001D52 R   |   6 WR_WORD    001D77 R
  6 WTABLE     002381 R   |   6 WTAT       0023A5 R   |   6 WTINIT     0023EA R
    WWDG_CR =  0050D1     |     WWDG_WR =  0050D2     |     XMEM_SIZ=  017830 
    XOFF    =  000013     |     XON     =  000011     |   6 XORR       0006A7 R
    XTEMP   =  000024     |     YTEMP   =  000026     |   6 ZEQ1       00278F R
  6 ZEQU1      000674 R   |   6 ZEQUAL     00066A R   |   6 ZERO       000BE1 R
  6 ZL1        000661 R   |   6 ZLESS      000658 R   |   6 app_spac   003500 R
  6 baudrate   00037B R   |   6 block_er   001E3D R   |   6 clear_ra   000019 R
  6 clock_in   000064 R   |   6 copy_buf   001E9D R   |   6 copy_buf   001EBC R
  6 copy_pro   001EBC R   |     da      =  000002     |     db      =  000003 
    dc      =  000000     |     dd      =  000001     |   6 do2lit     0028A1 R
  6 erase_fl   001E5F R   |   6 fmove_do   002212 R   |   6 main       000016 R
  6 next_row   0021CF R   |   6 no_move    002219 R   |   6 nsign      002435 R
  6 nsign1     002466 R   |   6 parse_di   00246D R   |   6 parse_ex   002DF3 R
  6 pristine   001F3D R   |   6 proceed_   001E62 R   |   6 reboot     000327 R
  6 reset_ve   001FA4 R   |   6 row_eras   001E1D R   |   6 row_eras   001E76 R
  6 row_eras   001E9D R   |   6 set_opti   001F11 R   |   6 set_vect   002045 R
  6 uart_ini   000076 R   |   6 write_ro   001EE1 R

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 196.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 DATA       size      0   flags    8
   2 DATA0      size      0   flags    8
   3 SSEG       size      0   flags    8
   4 SSEG1      size    100   flags    8
   5 HOME       size     80   flags    0
   6 CODE       size   3500   flags    0

