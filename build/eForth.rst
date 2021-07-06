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
      0080B7 94 63                  314         .word      INTER   ;'EVAL
      0080B9 00 00                  315         .word      0       ;HLD
      0080BB B3 A9                  316         .word      LASTN  ;CNTXT pointer
      0080BD 00 80                  317         .word      VAR_BASE   ;variables free space pointer 
      0080BF B4 00                  318         .word      app_space ; FLASH free space pointer 
      0080C1 B3 A9                  319         .word      LASTN   ;LAST
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
      00812D CC 9B 64         [ 2]  391         jp  COLD   ;default=MN1
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



      00817E CD 8C 00         [ 4]  447         call LSHIFT ; creat slot mask 
      008181 CD 88 E0         [ 4]  448         call INVER  ; ( level reg lshift rval mask )
      008184 CD 86 FE         [ 4]  449         call ANDD ; ( level reg lshift slot_masked )
      008187 CD 86 6A         [ 4]  450         call TOR  ; ( level reg lshift -- R: slot_masked )
      00818A CD 88 65         [ 4]  451         call ROT  ; ( reg lshift level )
      00818D CD 86 B1         [ 4]  452         call SWAPP ; ( reg level lshift )
      008190 CD 8C 00         [ 4]  453         call LSHIFT  ; ( reg slot_level -- )
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
      0081A9 CD 92 28         [ 4]  465         call TOKEN 
      0081AC CD 86 A1         [ 4]  466         call DUPP 
      0081AF CD 85 18         [ 4]  467         call QBRAN 
      0081B2 82 8F                  468         .word FORGET2
      0081B4 CD 93 25         [ 4]  469         call NAMEQ
      0081B7 CD 88 54         [ 4]  470         call QDUP 
      0081BA CD 85 18         [ 4]  471         call QBRAN 
      0081BD 82 8F                  472         .word FORGET2
      0081BF CD 86 97         [ 4]  473         call DROP 
      0081C2 1D 00 04         [ 2]  474         subw x,#2*CELLL 
      0081C5 90 5F            [ 1]  475         clrw y 
      0081C7 FF               [ 2]  476         ldw (x),y 
      0081C8 90 AE 40 02      [ 2]  477         ldw y,#APP_RUN 
      0081CC EF 02            [ 2]  478         ldw (2,x),y 
      0081CE CC 9E 60         [ 2]  479         jp EESTORE 
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
      0081DA CD 92 28         [ 4]  488         call TOKEN
      0081DD CD 86 A1         [ 4]  489         call DUPP 
      0081E0 CD 85 18         [ 4]  490         call QBRAN 
      0081E3 82 8F                  491         .word FORGET2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 11.
Hexadecimal [24-Bits]



      0081E5 CD 93 25         [ 4]  492         call NAMEQ ; ( a -- ca na | a F )
      0081E8 CD 88 54         [ 4]  493         call QDUP 
      0081EB CD 85 18         [ 4]  494         call QBRAN 
      0081EE 82 8F                  495         .word FORGET2
                                    496 ; only forget users words 
      0081F0 CD 86 A1         [ 4]  497         call DUPP ; ( ca na na )
      0081F3 CD 84 EF         [ 4]  498         call DOLIT 
      0081F6 B4 00                  499         .word app_space 
      0081F8 CD 86 B1         [ 4]  500         call SWAPP 
      0081FB CD 89 84         [ 4]  501         call  ULESS 
      0081FE CD 85 18         [ 4]  502         call QBRAN 
      008201 82 51                  503         .word FORGET6 
                                    504 ; ( ca na -- )        
                                    505 ;reset ivec with address >= ca
      008203 CD 86 B1         [ 4]  506         call SWAPP ; ( na ca -- ) 
      008206 CD A0 63         [ 4]  507         call CHKIVEC ; ( na -- ) 
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
      00821D CD 89 3D         [ 4]  518         call SUBB ; ( na last -- na last lfa ) link address 
      008220 CD 85 63         [ 4]  519         call AT 
      008223 CD 86 A1         [ 4]  520         call DUPP ; ( -- na last a a )
      008226 CD 87 EA         [ 4]  521         call CNTXT 
      008229 CD 85 51         [ 4]  522         call STORE
      00822C CD 88 16         [ 4]  523         call LAST  
      00822F CD 85 51         [ 4]  524         call STORE ; ( --  na last )
      008232 CD 86 C9         [ 4]  525         call OVER 
      008235 CD 89 65         [ 4]  526         call EQUAL ; ( na last na -- na T|F ) 
      008238 CD 85 18         [ 4]  527         call QBRAN 
      00823B 82 09                  528         .word FORGET1 
                                    529 ; ( na -- )
      00823D CD 84 EF         [ 4]  530         call DOLIT 
      008240 00 02                  531         .word 2 
      008242 CD 89 3D         [ 4]  532         call SUBB 
      008245 CD 88 06         [ 4]  533         call CPP 
      008248 CD 85 51         [ 4]  534         call STORE  
      00824B CD 9C 93         [ 4]  535         call UPDATCP 
      00824E CC 9C 6A         [ 2]  536         jp UPDATLAST 
      008251                        537 FORGET6: ; tried to forget a RAM or system word 
                                    538 ; ( ca na -- )
      008251 1D 00 02         [ 2]  539         subw x,#CELLL 
      008254 90 BE 2C         [ 2]  540         ldw y,SP0 
      008257 FF               [ 2]  541         ldw (x),y  
      008258 CD 89 84         [ 4]  542         call ULESS
      00825B CD 85 18         [ 4]  543         call QBRAN 
      00825E 82 81                  544         .word PROTECTED 
      008260 CD 94 31         [ 4]  545         call ABORQ 
      008263 1D                     546         .byte 29
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 12.
Hexadecimal [24-Bits]



      008264 20 46 6F 72 20 52 41   547         .ascii " For RAM definition do REBOOT"
             4D 20 64 65 66 69 6E
             69 74 69 6F 6E 20 64
             6F 20 52 45 42 4F 4F
             54
      008281                        548 PROTECTED:
      008281 CD 94 31         [ 4]  549         call ABORQ
      008284 0A                     550         .byte 10
      008285 20 50 72 6F 74 65 63   551         .ascii " Protected"
             74 65 64
      00828F                        552 FORGET2: ; no name or not found in dictionary 
      00828F CD 94 31         [ 4]  553         call ABORQ
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
      0082AB CD 8B E2         [ 4]  568         call ONEP ;
      0082AE CD 88 C6         [ 4]  569         CALL PLUS ; ( na c+1 -- ca ) 
      0082B1 CD 8B E2         [ 4]  570         call ONEP ; ( ca+ -- ) to get routne address 
      0082B4 CD 86 A1         [ 4]  571         call DUPP ; ( ca+ ca+ -- )
      0082B7 CD 85 63         [ 4]  572         CALL AT   ; ( ca+ fnaddr -- ) ; fnaddr is routine address 
      0082BA CD 84 EF         [ 4]  573         call DOLIT 
      0082BD 87 57                  574         .word DOVAR ; if routine address is DOVAR then variable 
      0082BF CD 89 65         [ 4]  575         call EQUAL  ; ( ca+ fnaddr DOVAR -- ca+ T|F ) 
      0082C2 CD 85 18         [ 4]  576         call QBRAN 
      0082C5 82 DB                  577         .word FREEVAR4 
      0082C7 CD 84 EF         [ 4]  578         call DOLIT 
      0082CA 00 02                  579         .word 2 
      0082CC CD 88 C6         [ 4]  580         call PLUS  ; ( ca+ 2 -- da ) da is data address 
      0082CF CD 85 63         [ 4]  581         call AT 
      0082D2 CD 87 F8         [ 4]  582         call VPP   
      0082D5 CD 85 51         [ 4]  583         call STORE 
      0082D8 CC 9C AA         [ 2]  584         jp UPDATVP 
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
      0083C3 CD 94 31         [ 4]  732         call ABORQ 
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
                                   1582 ;       NOT     ( w -- w )
                                   1583 ;       One's complement of tos.
                                   1584 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00085A                       1585         _HEADER INVER,3,"NOT"
      0088DA 88 C4                    1         .word LINK 
                           00085C     2         LINK=.
      0088DC 03                       3         .byte 3  
      0088DD 4E 4F 54                 4         .ascii "NOT"
      0088E0                          5         INVER:
      0088E0 90 93            [ 1] 1586         LDW Y,X
      0088E2 90 FE            [ 2] 1587         LDW Y,(Y)
      0088E4 90 53            [ 2] 1588         CPLW Y
      0088E6 FF               [ 2] 1589         LDW (X),Y
      0088E7 81               [ 4] 1590         RET
                                   1591 
                                   1592 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1593 ;       NEGATE  ( n -- -n )
                                   1594 ;       Two's complement of tos.
                                   1595 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000868                       1596         _HEADER NEGAT,6,"NEGATE"
      0088E8 88 DC                    1         .word LINK 
                           00086A     2         LINK=.
      0088EA 06                       3         .byte 6  
      0088EB 4E 45 47 41 54 45        4         .ascii "NEGATE"
      0088F1                          5         NEGAT:
      0088F1 90 93            [ 1] 1597         LDW Y,X
      0088F3 90 FE            [ 2] 1598         LDW Y,(Y)
      0088F5 90 50            [ 2] 1599         NEGW Y
      0088F7 FF               [ 2] 1600         LDW (X),Y
      0088F8 81               [ 4] 1601         RET
                                   1602 
                                   1603 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1604 ;       DNEGATE ( d -- -d )
                                   1605 ;       Two's complement of top double.
                                   1606 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000879                       1607         _HEADER DNEGA,7,"DNEGATE"
      0088F9 88 EA                    1         .word LINK 
                           00087B     2         LINK=.
      0088FB 07                       3         .byte 7  
      0088FC 44 4E 45 47 41 54 45     4         .ascii "DNEGATE"
      008903                          5         DNEGA:
      008903 90 93            [ 1] 1608         LDW Y,X
      008905 90 FE            [ 2] 1609 	LDW Y,(Y)
      008907 90 53            [ 2] 1610         CPLW Y
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



      008909 90 89            [ 2] 1611         PUSHW Y      ; Y >R 
      00890B 90 93            [ 1] 1612         LDW Y,X
      00890D 90 EE 02         [ 2] 1613         LDW Y,(2,Y)
      008910 90 53            [ 2] 1614         CPLW Y
      008912 72 A9 00 01      [ 2] 1615         addw y,#1
      008916 EF 02            [ 2] 1616         LDW (2,X),Y
      008918 90 85            [ 2] 1617         POPW Y       ; R> Y  
      00891A 24 02            [ 1] 1618         JRNC DN1 
      00891C 90 5C            [ 1] 1619         INCW Y
      00891E FF               [ 2] 1620 DN1:    LDW (X),Y
      00891F 81               [ 4] 1621         RET
                                   1622 
                                   1623 
                                   1624 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1625 ;       S>D ( n -- d )
                                   1626 ; convert single integer to double 
                                   1627 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0008A0                       1628         _HEADER STOD,3,"S>D"
      008920 88 FB                    1         .word LINK 
                           0008A2     2         LINK=.
      008922 03                       3         .byte 3  
      008923 53 3E 44                 4         .ascii "S>D"
      008926                          5         STOD:
      008926 1D 00 02         [ 2] 1629         subw x,#CELLL 
      008929 90 5F            [ 1] 1630         clrw y 
      00892B FF               [ 2] 1631         ldw (x),y 
      00892C 90 93            [ 1] 1632         ldw y,x 
      00892E 90 EE 02         [ 2] 1633         ldw y,(2,y)
      008931 2A 05            [ 1] 1634         jrpl 1$ 
      008933 90 AE FF FF      [ 2] 1635         ldw y,#-1
      008937 FF               [ 2] 1636         ldw (x),y 
      008938 81               [ 4] 1637 1$:     ret 
                                   1638 
                                   1639 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1640 ;       -       ( n1 n2 -- n1-n2 )
                                   1641 ;       Subtraction.
                                   1642 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0008B9                       1643         _HEADER SUBB,1,"-"
      008939 89 22                    1         .word LINK 
                           0008BB     2         LINK=.
      00893B 01                       3         .byte 1  
      00893C 2D                       4         .ascii "-"
      00893D                          5         SUBB:
      00893D 90 93            [ 1] 1644         LDW Y,X
      00893F 90 FE            [ 2] 1645         LDW Y,(Y)
      008941 90 BF 26         [ 2] 1646         LDW YTEMP,Y
      008944 1C 00 02         [ 2] 1647         ADDW X,#2
      008947 90 93            [ 1] 1648         LDW Y,X
      008949 90 FE            [ 2] 1649         LDW Y,(Y)
      00894B 72 B2 00 26      [ 2] 1650         SUBW Y,YTEMP
      00894F FF               [ 2] 1651         LDW (X),Y
      008950 81               [ 4] 1652         RET
                                   1653 
                                   1654 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1655 ;       ABS     ( n -- n )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 39.
Hexadecimal [24-Bits]



                                   1656 ;       Return  absolute value of n.
                                   1657 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0008D1                       1658         _HEADER ABSS,3,"ABS"
      008951 89 3B                    1         .word LINK 
                           0008D3     2         LINK=.
      008953 03                       3         .byte 3  
      008954 41 42 53                 4         .ascii "ABS"
      008957                          5         ABSS:
      008957 90 93            [ 1] 1659         LDW Y,X
      008959 90 FE            [ 2] 1660 	LDW Y,(Y)
      00895B 2A 03            [ 1] 1661         JRPL     AB1     ;negate:
      00895D 90 50            [ 2] 1662         NEGW     Y     ;else negate hi byte
      00895F FF               [ 2] 1663         LDW (X),Y
      008960 81               [ 4] 1664 AB1:    RET
                                   1665 
                                   1666 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1667 ;       =       ( w w -- t )
                                   1668 ;       Return true if top two are =al.
                                   1669 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0008E1                       1670         _HEADER EQUAL,1,"="
      008961 89 53                    1         .word LINK 
                           0008E3     2         LINK=.
      008963 01                       3         .byte 1  
      008964 3D                       4         .ascii "="
      008965                          5         EQUAL:
      008965 A6 FF            [ 1] 1671         LD A,#0xFF  ;true
      008967 90 93            [ 1] 1672         LDW Y,X    ;D = n2
      008969 90 FE            [ 2] 1673         LDW Y,(Y)
      00896B 90 BF 26         [ 2] 1674         LDW YTEMP,Y
      00896E 1C 00 02         [ 2] 1675         ADDW X,#2
      008971 90 93            [ 1] 1676         LDW Y,X
      008973 90 FE            [ 2] 1677         LDW Y,(Y)
      008975 90 B3 26         [ 2] 1678         CPW Y,YTEMP     ;if n2 <> n1
      008978 27 01            [ 1] 1679         JREQ     EQ1
      00897A 4F               [ 1] 1680         CLR A
      00897B F7               [ 1] 1681 EQ1:    LD (X),A
      00897C E7 01            [ 1] 1682         LD (1,X),A
      00897E 81               [ 4] 1683 	RET     
                                   1684 
                                   1685 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1686 ;       U<      ( u u -- t )
                                   1687 ;       Unsigned compare of top two items.
                                   1688 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0008FF                       1689         _HEADER ULESS,2,"U<"
      00897F 89 63                    1         .word LINK 
                           000901     2         LINK=.
      008981 02                       3         .byte 2  
      008982 55 3C                    4         .ascii "U<"
      008984                          5         ULESS:
      008984 A6 FF            [ 1] 1690         LD A,#0xFF  ;true
      008986 90 93            [ 1] 1691         LDW Y,X    ;D = n2
      008988 90 FE            [ 2] 1692         LDW Y,(Y)
      00898A 90 BF 26         [ 2] 1693         LDW YTEMP,Y
      00898D 1C 00 02         [ 2] 1694         ADDW X,#2
      008990 90 93            [ 1] 1695         LDW Y,X
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 40.
Hexadecimal [24-Bits]



      008992 90 FE            [ 2] 1696         LDW Y,(Y)
      008994 90 B3 26         [ 2] 1697         CPW Y,YTEMP     ;if n2 <> n1
      008997 25 01            [ 1] 1698         JRULT     ULES1
      008999 4F               [ 1] 1699         CLR A
      00899A F7               [ 1] 1700 ULES1:  LD (X),A
      00899B E7 01            [ 1] 1701         LD (1,X),A
      00899D 81               [ 4] 1702 	RET     
                                   1703 
                                   1704 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1705 ;       <       ( n1 n2 -- t )
                                   1706 ;       Signed compare of top two items.
                                   1707 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00091E                       1708         _HEADER LESS,1,"<"
      00899E 89 81                    1         .word LINK 
                           000920     2         LINK=.
      0089A0 01                       3         .byte 1  
      0089A1 3C                       4         .ascii "<"
      0089A2                          5         LESS:
      0089A2 A6 FF            [ 1] 1709         LD A,#0xFF  ;true
      0089A4 90 93            [ 1] 1710         LDW Y,X    ;D = n2
      0089A6 90 FE            [ 2] 1711         LDW Y,(Y)
      0089A8 90 BF 26         [ 2] 1712         LDW YTEMP,Y
      0089AB 1C 00 02         [ 2] 1713         ADDW X,#2
      0089AE 90 93            [ 1] 1714         LDW Y,X
      0089B0 90 FE            [ 2] 1715         LDW Y,(Y)
      0089B2 90 B3 26         [ 2] 1716         CPW Y,YTEMP     ;if n2 <> n1
      0089B5 2F 01            [ 1] 1717         JRSLT     LT1
      0089B7 4F               [ 1] 1718         CLR A
      0089B8 F7               [ 1] 1719 LT1:    LD (X),A
      0089B9 E7 01            [ 1] 1720         LD (1,X),A
      0089BB 81               [ 4] 1721 	RET     
                                   1722 
                                   1723 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1724 ;   U> ( u1 u2 -- f )
                                   1725 ;   f = true if u1>u2 
                                   1726 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00093C                       1727     _HEADER UGREAT,2,"U>"
      0089BC 89 A0                    1         .word LINK 
                           00093E     2         LINK=.
      0089BE 02                       3         .byte 2  
      0089BF 55 3E                    4         .ascii "U>"
      0089C1                          5         UGREAT:
      0089C1 A6 00            [ 1] 1728     LD A,#0 
      0089C3 90 93            [ 1] 1729     LDW Y,X 
      0089C5 90 FE            [ 2] 1730     LDW Y,(Y)
      0089C7 90 BF 26         [ 2] 1731     LDW YTEMP,Y 
      0089CA 1C 00 02         [ 2] 1732     ADDW X,#2 
      0089CD 90 93            [ 1] 1733     LDW Y,X
      0089CF 90 FE            [ 2] 1734     LDW Y,(Y)
      0089D1 90 B3 26         [ 2] 1735     CPW Y,YTEMP 
      0089D4 23 02            [ 2] 1736     JRULE UGREAT1 
      0089D6 A6 FF            [ 1] 1737     LD A,#0xff  
      0089D8                       1738 UGREAT1:
      0089D8 F7               [ 1] 1739     LD (X),A 
      0089D9 E7 01            [ 1] 1740     LD (1,X),A 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



      0089DB 81               [ 4] 1741     RET 
                                   1742 
                                   1743 
                                   1744 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1745 ;       >   (n1 n2 -- f )
                                   1746 ;  signed compare n1 n2 
                                   1747 ;  true if n1 > n2 
                                   1748 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00095C                       1749         _HEADER GREAT,1,">"
      0089DC 89 BE                    1         .word LINK 
                           00095E     2         LINK=.
      0089DE 01                       3         .byte 1  
      0089DF 3E                       4         .ascii ">"
      0089E0                          5         GREAT:
      0089E0 A6 FF            [ 1] 1750         LD A,#0xFF ;
      0089E2 90 93            [ 1] 1751         LDW Y,X 
      0089E4 90 FE            [ 2] 1752         LDW Y,(Y)
      0089E6 90 BF 26         [ 2] 1753         LDW YTEMP,Y 
      0089E9 1C 00 02         [ 2] 1754         ADDW X,#2 
      0089EC 90 93            [ 1] 1755         LDW Y,X 
      0089EE 90 FE            [ 2] 1756         LDW Y,(Y)
      0089F0 90 B3 26         [ 2] 1757         CPW  Y,YTEMP 
      0089F3 2C 01            [ 1] 1758         JRSGT GREAT1 
      0089F5 4F               [ 1] 1759         CLR  A
      0089F6                       1760 GREAT1:
      0089F6 F7               [ 1] 1761         LD (X),A 
      0089F7 E7 01            [ 1] 1762         LD (1,X),A 
      0089F9 81               [ 4] 1763         RET 
                                   1764 
                                   1765 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1766 ;       MAX     ( n n -- n )
                                   1767 ;       Return greater of two top items.
                                   1768 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00097A                       1769         _HEADER MAX,3,"MAX"
      0089FA 89 DE                    1         .word LINK 
                           00097C     2         LINK=.
      0089FC 03                       3         .byte 3  
      0089FD 4D 41 58                 4         .ascii "MAX"
      008A00                          5         MAX:
      008A00 90 93            [ 1] 1770         LDW Y,X    ;D = n2
      008A02 90 EE 02         [ 2] 1771         LDW Y,(2,Y)
      008A05 90 BF 26         [ 2] 1772         LDW YTEMP,Y
      008A08 90 93            [ 1] 1773         LDW Y,X
      008A0A 90 FE            [ 2] 1774         LDW Y,(Y)
      008A0C 90 B3 26         [ 2] 1775         CPW Y,YTEMP     ;if n2 <> n1
      008A0F 2F 02            [ 1] 1776         JRSLT     MAX1
      008A11 EF 02            [ 2] 1777         LDW (2,X),Y
      008A13 1C 00 02         [ 2] 1778 MAX1:   ADDW X,#2
      008A16 81               [ 4] 1779 	RET     
                                   1780 
                                   1781 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1782 ;       MIN     ( n n -- n )
                                   1783 ;       Return smaller of top two items.
                                   1784 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000997                       1785         _HEADER MIN,3,"MIN"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal [24-Bits]



      008A17 89 FC                    1         .word LINK 
                           000999     2         LINK=.
      008A19 03                       3         .byte 3  
      008A1A 4D 49 4E                 4         .ascii "MIN"
      008A1D                          5         MIN:
      008A1D 90 93            [ 1] 1786         LDW Y,X    ;D = n2
      008A1F 90 EE 02         [ 2] 1787         LDW Y,(2,Y)
      008A22 90 BF 26         [ 2] 1788         LDW YTEMP,Y
      008A25 90 93            [ 1] 1789         LDW Y,X
      008A27 90 FE            [ 2] 1790         LDW Y,(Y)
      008A29 90 B3 26         [ 2] 1791         CPW Y,YTEMP     ;if n2 <> n1
      008A2C 2C 02            [ 1] 1792         JRSGT     MIN1
      008A2E EF 02            [ 2] 1793         LDW (2,X),Y
      008A30 1C 00 02         [ 2] 1794 MIN1:	ADDW X,#2
      008A33 81               [ 4] 1795 	RET     
                                   1796 
                                   1797 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1798 ;       WITHIN  ( u ul uh -- t )
                                   1799 ;       Return true if u is within
                                   1800 ;       range of ul and uh. ( ul <= u < uh )
                                   1801 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0009B4                       1802         _HEADER WITHI,6,"WITHIN"
      008A34 8A 19                    1         .word LINK 
                           0009B6     2         LINK=.
      008A36 06                       3         .byte 6  
      008A37 57 49 54 48 49 4E        4         .ascii "WITHIN"
      008A3D                          5         WITHI:
      008A3D CD 86 C9         [ 4] 1803         CALL     OVER
      008A40 CD 89 3D         [ 4] 1804         CALL     SUBB
      008A43 CD 86 6A         [ 4] 1805         CALL     TOR
      008A46 CD 89 3D         [ 4] 1806         CALL     SUBB
      008A49 CD 85 B4         [ 4] 1807         CALL     RFROM
      008A4C CC 89 84         [ 2] 1808         JP     ULESS
                                   1809 
                                   1810 ;; Divide
                                   1811 
                                   1812 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1813 ;       UM/MOD  ( udl udh un -- ur uq )
                                   1814 ;       Unsigned divide of a double by a
                                   1815 ;       single. Return mod and quotient.
                                   1816 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0009CF                       1817         _HEADER UMMOD,6,"UM/MOD"
      008A4F 8A 36                    1         .word LINK 
                           0009D1     2         LINK=.
      008A51 06                       3         .byte 6  
      008A52 55 4D 2F 4D 4F 44        4         .ascii "UM/MOD"
      008A58                          5         UMMOD:
                                   1818 ; 2021-02-22
                                   1819 ; changed algortihm for Jeeek one 
                                   1820 ; ref: https://github.com/TG9541/stm8ef/pull/406        
      008A58 90 93            [ 1] 1821         LDW     Y,X             ; stack pointer to Y
      008A5A FE               [ 2] 1822         LDW     X,(X)           ; un
      008A5B BF 26            [ 2] 1823         LDW     YTEMP,X         ; save un
      008A5D 93               [ 1] 1824         LDW     X,Y
      008A5E 5C               [ 1] 1825         INCW    X               ; drop un
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
Hexadecimal [24-Bits]



      008A5F 5C               [ 1] 1826         INCW    X
      008A60 89               [ 2] 1827         PUSHW   X               ; save stack pointer
      008A61 FE               [ 2] 1828         LDW     X,(X)           ; X=udh
      008A62 90 EE 04         [ 2] 1829         LDW     Y,(4,Y)         ; Y=udl (offset before drop)
      008A65 B3 26            [ 2] 1830         CPW     X,YTEMP
      008A67 25 0B            [ 1] 1831         JRULT   MMSM1           ; X is still on the R-stack
      008A69 85               [ 2] 1832         POPW    X               ; restore stack pointer
      008A6A 90 AE FF FF      [ 2] 1833         LDW     Y,#0xFFFF       ; overflow result:
      008A6E FF               [ 2] 1834         LDW     (X),Y           ; quotient max. 16 bit value
      008A6F 90 5F            [ 1] 1835         CLRW    Y
      008A71 EF 02            [ 2] 1836         LDW     (2,X),Y         ; remainder 0
      008A73 81               [ 4] 1837         RET
      008A74                       1838 MMSM1:
      008A74 A6 10            [ 1] 1839         LD      A,#16           ; loop count
      008A76 90 58            [ 2] 1840         SLLW    Y               ; udl shift udl into udh
      008A78                       1841 MMSM3:
      008A78 59               [ 2] 1842         RLCW    X               ; rotate udl bit into uhdh (= remainder)
      008A79 25 04            [ 1] 1843         JRC     MMSMa           ; if carry out of rotate
      008A7B B3 26            [ 2] 1844         CPW     X,YTEMP         ; compare udh to un
      008A7D 25 05            [ 1] 1845         JRULT   MMSM4           ; can't subtract
      008A7F                       1846 MMSMa:
      008A7F 72 B0 00 26      [ 2] 1847         SUBW    X,YTEMP         ; can subtract
      008A83 98               [ 1] 1848         RCF
      008A84                       1849 MMSM4:
      008A84 8C               [ 1] 1850         CCF                     ; quotient bit
      008A85 90 59            [ 2] 1851         RLCW    Y               ; rotate into quotient, rotate out udl
      008A87 4A               [ 1] 1852         DEC     A               ; repeat
      008A88 26 EE            [ 1] 1853         JRNE    MMSM3           ; if A == 0
      008A8A                       1854 MMSMb:
      008A8A BF 26            [ 2] 1855         LDW     YTEMP,X         ; done, save remainder
      008A8C 85               [ 2] 1856         POPW    X               ; restore stack pointer
      008A8D FF               [ 2] 1857         LDW     (X),Y           ; save quotient
      008A8E 90 BE 26         [ 2] 1858         LDW     Y,YTEMP         ; remainder onto stack
      008A91 EF 02            [ 2] 1859         LDW     (2,X),Y
      008A93 81               [ 4] 1860         RET
                                   1861 
                                   1862 
                                   1863 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
                                   1864 ;       M/MOD   ( d n -- r q )
                                   1865 ;       Signed floored divide of double by
                                   1866 ;       single. Return mod and quotient.
                                   1867 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000A14                       1868         _HEADER MSMOD,5,"M/MOD"
      008A94 8A 51                    1         .word LINK 
                           000A16     2         LINK=.
      008A96 05                       3         .byte 5  
      008A97 4D 2F 4D 4F 44           4         .ascii "M/MOD"
      008A9C                          5         MSMOD:
      008A9C CD 86 A1         [ 4] 1869         CALL	DUPP
      008A9F CD 86 D8         [ 4] 1870         CALL	ZLESS
      008AA2 CD 86 A1         [ 4] 1871         CALL	DUPP
      008AA5 CD 86 6A         [ 4] 1872         CALL	TOR
      008AA8 CD 85 18         [ 4] 1873         CALL	QBRAN
      008AAB 8A B9                 1874         .word	MMOD1
      008AAD CD 88 F1         [ 4] 1875         CALL	NEGAT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



      008AB0 CD 86 6A         [ 4] 1876         CALL	TOR
      008AB3 CD 89 03         [ 4] 1877         CALL	DNEGA
      008AB6 CD 85 B4         [ 4] 1878         CALL	RFROM
      008AB9 CD 86 6A         [ 4] 1879 MMOD1:	CALL	TOR
      008ABC CD 86 A1         [ 4] 1880         CALL	DUPP
      008ABF CD 86 D8         [ 4] 1881         CALL	ZLESS
      008AC2 CD 85 18         [ 4] 1882         CALL	QBRAN
      008AC5 8A CD                 1883         .word	MMOD2
      008AC7 CD 85 C5         [ 4] 1884         CALL	RAT
      008ACA CD 88 C6         [ 4] 1885         CALL	PLUS
      008ACD CD 85 B4         [ 4] 1886 MMOD2:	CALL	RFROM
      008AD0 CD 8A 58         [ 4] 1887         CALL	UMMOD
      008AD3 CD 85 B4         [ 4] 1888         CALL	RFROM
      008AD6 CD 85 18         [ 4] 1889         CALL	QBRAN
      008AD9 8A E4                 1890         .word	MMOD3
      008ADB CD 86 B1         [ 4] 1891         CALL	SWAPP
      008ADE CD 88 F1         [ 4] 1892         CALL	NEGAT
      008AE1 CD 86 B1         [ 4] 1893         CALL	SWAPP
      008AE4 81               [ 4] 1894 MMOD3:	RET
                                   1895 
                                   1896 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1897 ;       /MOD    ( n n -- r q )
                                   1898 ;       Signed divide. Return mod 
                                   1899 ;       and quotient.
                                   1900 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000A65                       1901         _HEADER SLMOD,4,"/MOD"
      008AE5 8A 96                    1         .word LINK 
                           000A67     2         LINK=.
      008AE7 04                       3         .byte 4  
      008AE8 2F 4D 4F 44              4         .ascii "/MOD"
      008AEC                          5         SLMOD:
      008AEC CD 86 C9         [ 4] 1902         CALL	OVER
      008AEF CD 86 D8         [ 4] 1903         CALL	ZLESS
      008AF2 CD 86 B1         [ 4] 1904         CALL	SWAPP
      008AF5 CC 8A 9C         [ 2] 1905         JP	MSMOD
                                   1906 
                                   1907 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1908 ;       MOD     ( n n -- r )
                                   1909 ;       Signed divide. Return mod only.
                                   1910 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000A78                       1911         _HEADER MODD,3,"MOD"
      008AF8 8A E7                    1         .word LINK 
                           000A7A     2         LINK=.
      008AFA 03                       3         .byte 3  
      008AFB 4D 4F 44                 4         .ascii "MOD"
      008AFE                          5         MODD:
      008AFE CD 8A EC         [ 4] 1912 	CALL	SLMOD
      008B01 CC 86 97         [ 2] 1913 	JP	DROP
                                   1914 
                                   1915 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1916 ;       /       ( n n -- q )
                                   1917 ;       Signed divide. Return quotient only.
                                   1918 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000A84                       1919         _HEADER SLASH,1,"/"
      008B04 8A FA                    1         .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



                           000A86     2         LINK=.
      008B06 01                       3         .byte 1  
      008B07 2F                       4         .ascii "/"
      008B08                          5         SLASH:
      008B08 CD 8A EC         [ 4] 1920         CALL	SLMOD
      008B0B CD 86 B1         [ 4] 1921         CALL	SWAPP
      008B0E CC 86 97         [ 2] 1922         JP	DROP
                                   1923 
                                   1924 ;; Multiply
                                   1925 
                                   1926 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1927 ;       UM*     ( u u -- ud )
                                   1928 ;       Unsigned multiply. Return 
                                   1929 ;       double product.
                                   1930 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000A91                       1931         _HEADER UMSTA,3,"UM*"
      008B11 8B 06                    1         .word LINK 
                           000A93     2         LINK=.
      008B13 03                       3         .byte 3  
      008B14 55 4D 2A                 4         .ascii "UM*"
      008B17                          5         UMSTA:
                                   1932 ; stack have 4 bytes u1=a,b u2=c,d
                                   1933 ; take advantage of SP addressing modes
                                   1934 ; these PRODx in RAM are not required
                                   1935 ; the product is kept on stack as local variable 
                                   1936         ;; bytes offset on data stack 
                           000002  1937         da=2 
                           000003  1938         db=3 
                           000000  1939         dc=0 
                           000001  1940         dd=1 
                                   1941         ;; product bytes offset on return stack 
                           000001  1942         UD1=1  ; ud bits 31..24
                           000002  1943         UD2=2  ; ud bits 23..16
                           000003  1944         UD3=3  ; ud bits 15..8 
                           000004  1945         UD4=4  ; ud bits 7..0 
                                   1946         ;; local variable for product set to zero   
      008B17 90 5F            [ 1] 1947         clrw y 
      008B19 90 89            [ 2] 1948         pushw y  ; bits 15..0
      008B1B 90 89            [ 2] 1949         pushw y  ; bits 31..16 
      008B1D E6 03            [ 1] 1950         ld a,(db,x) ; b 
      008B1F 90 97            [ 1] 1951         ld yl,a 
      008B21 E6 01            [ 1] 1952         ld a,(dd,x)   ; d
      008B23 90 42            [ 4] 1953         mul y,a    ; b*d  
      008B25 17 03            [ 2] 1954         ldw (UD3,sp),y ; lowest weight product 
      008B27 E6 03            [ 1] 1955         ld a,(db,x)
      008B29 90 97            [ 1] 1956         ld yl,a 
      008B2B E6 00            [ 1] 1957         ld a,(dc,x)
      008B2D 90 42            [ 4] 1958         mul y,a  ; b*c 
                                   1959         ;;; do the partial sum 
      008B2F 72 F9 02         [ 2] 1960         addw y,(UD2,sp)
      008B32 4F               [ 1] 1961         clr a 
      008B33 49               [ 1] 1962         rlc a
      008B34 6B 01            [ 1] 1963         ld (UD1,sp),a 
      008B36 17 02            [ 2] 1964         ldw (UD2,sp),y 
      008B38 E6 02            [ 1] 1965         ld a,(da,x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



      008B3A 90 97            [ 1] 1966         ld yl,a 
      008B3C E6 01            [ 1] 1967         ld a,(dd,x)
      008B3E 90 42            [ 4] 1968         mul y,a   ; a*d 
                                   1969         ;; do partial sum 
      008B40 72 F9 02         [ 2] 1970         addw y,(UD2,sp)
      008B43 4F               [ 1] 1971         clr a 
      008B44 19 01            [ 1] 1972         adc a,(UD1,sp)
      008B46 6B 01            [ 1] 1973         ld (UD1,sp),a  
      008B48 17 02            [ 2] 1974         ldw (UD2,sp),y 
      008B4A E6 02            [ 1] 1975         ld a,(da,x)
      008B4C 90 97            [ 1] 1976         ld yl,a 
      008B4E E6 00            [ 1] 1977         ld a,(dc,x)
      008B50 90 42            [ 4] 1978         mul y,a  ;  a*c highest weight product 
                                   1979         ;;; do partial sum 
      008B52 72 F9 01         [ 2] 1980         addw y,(UD1,sp)
      008B55 FF               [ 2] 1981         ldw (x),y  ; udh 
      008B56 16 03            [ 2] 1982         ldw y,(UD3,sp)
      008B58 EF 02            [ 2] 1983         ldw (2,x),y  ; udl  
      008B5A 5B 04            [ 2] 1984         addw sp,#4 ; drop local variable 
      008B5C 81               [ 4] 1985         ret  
                                   1986 
                                   1987 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1988 ;       *       ( n n -- n )
                                   1989 ;       Signed multiply. Return 
                                   1990 ;       single product.
                                   1991 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000ADD                       1992         _HEADER STAR,1,"*"
      008B5D 8B 13                    1         .word LINK 
                           000ADF     2         LINK=.
      008B5F 01                       3         .byte 1  
      008B60 2A                       4         .ascii "*"
      008B61                          5         STAR:
      008B61 CD 8B 17         [ 4] 1993 	CALL	UMSTA
      008B64 CC 86 97         [ 2] 1994 	JP	DROP
                                   1995 
                                   1996 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1997 ;       M*      ( n n -- d )
                                   1998 ;       Signed multiply. Return 
                                   1999 ;       double product.
                                   2000 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000AE7                       2001         _HEADER MSTAR,2,"M*"
      008B67 8B 5F                    1         .word LINK 
                           000AE9     2         LINK=.
      008B69 02                       3         .byte 2  
      008B6A 4D 2A                    4         .ascii "M*"
      008B6C                          5         MSTAR:
      008B6C CD 88 B1         [ 4] 2002         CALL	DDUP
      008B6F CD 87 27         [ 4] 2003         CALL	XORR
      008B72 CD 86 D8         [ 4] 2004         CALL	ZLESS
      008B75 CD 86 6A         [ 4] 2005         CALL	TOR
      008B78 CD 89 57         [ 4] 2006         CALL	ABSS
      008B7B CD 86 B1         [ 4] 2007         CALL	SWAPP
      008B7E CD 89 57         [ 4] 2008         CALL	ABSS
      008B81 CD 8B 17         [ 4] 2009         CALL	UMSTA
      008B84 CD 85 B4         [ 4] 2010         CALL	RFROM
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



      008B87 CD 85 18         [ 4] 2011         CALL	QBRAN
      008B8A 8B 8F                 2012         .word	MSTA1
      008B8C CD 89 03         [ 4] 2013         CALL	DNEGA
      008B8F 81               [ 4] 2014 MSTA1:	RET
                                   2015 
                                   2016 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2017 ;       */MOD   ( n1 n2 n3 -- r q )
                                   2018 ;       Multiply n1 and n2, then divide
                                   2019 ;       by n3. Return mod and quotient.
                                   2020 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000B10                       2021         _HEADER SSMOD,5,"*/MOD"
      008B90 8B 69                    1         .word LINK 
                           000B12     2         LINK=.
      008B92 05                       3         .byte 5  
      008B93 2A 2F 4D 4F 44           4         .ascii "*/MOD"
      008B98                          5         SSMOD:
      008B98 CD 86 6A         [ 4] 2022         CALL     TOR
      008B9B CD 8B 6C         [ 4] 2023         CALL     MSTAR
      008B9E CD 85 B4         [ 4] 2024         CALL     RFROM
      008BA1 CC 8A 9C         [ 2] 2025         JP     MSMOD
                                   2026 
                                   2027 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2028 ;       */      ( n1 n2 n3 -- q )
                                   2029 ;       Multiply n1 by n2, then divide
                                   2030 ;       by n3. Return quotient only.
                                   2031 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000B24                       2032         _HEADER STASL,2,"*/"
      008BA4 8B 92                    1         .word LINK 
                           000B26     2         LINK=.
      008BA6 02                       3         .byte 2  
      008BA7 2A 2F                    4         .ascii "*/"
      008BA9                          5         STASL:
      008BA9 CD 8B 98         [ 4] 2033         CALL	SSMOD
      008BAC CD 86 B1         [ 4] 2034         CALL	SWAPP
      008BAF CC 86 97         [ 2] 2035         JP	DROP
                                   2036 
                                   2037 ;; Miscellaneous
                                   2038 
                                   2039 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2040 ;       CELL+   ( a -- a )
                                   2041 ;       Add cell size in byte to address.
                                   2042 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000B32                       2043         _HEADER CELLP,2,"2+"
      008BB2 8B A6                    1         .word LINK 
                           000B34     2         LINK=.
      008BB4 02                       3         .byte 2  
      008BB5 32 2B                    4         .ascii "2+"
      008BB7                          5         CELLP:
      008BB7 90 93            [ 1] 2044         LDW Y,X
      008BB9 90 FE            [ 2] 2045 	LDW Y,(Y)
      008BBB 72 A9 00 02      [ 2] 2046         ADDW Y,#CELLL 
      008BBF FF               [ 2] 2047         LDW (X),Y
      008BC0 81               [ 4] 2048         RET
                                   2049 
                                   2050 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



                                   2051 ;       CELL-   ( a -- a )
                                   2052 ;       Subtract 2 from address.
                                   2053 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000B41                       2054         _HEADER CELLM,2,"2-"
      008BC1 8B B4                    1         .word LINK 
                           000B43     2         LINK=.
      008BC3 02                       3         .byte 2  
      008BC4 32 2D                    4         .ascii "2-"
      008BC6                          5         CELLM:
      008BC6 90 93            [ 1] 2055         LDW Y,X
      008BC8 90 FE            [ 2] 2056 	LDW Y,(Y)
      008BCA 72 A2 00 02      [ 2] 2057         SUBW Y,#CELLL
      008BCE FF               [ 2] 2058         LDW (X),Y
      008BCF 81               [ 4] 2059         RET
                                   2060 
                                   2061 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2062 ;       CELLS   ( n -- n )
                                   2063 ;       Multiply tos by 2.
                                   2064 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000B50                       2065         _HEADER CELLS,2,"2*"
      008BD0 8B C3                    1         .word LINK 
                           000B52     2         LINK=.
      008BD2 02                       3         .byte 2  
      008BD3 32 2A                    4         .ascii "2*"
      008BD5                          5         CELLS:
      008BD5 90 93            [ 1] 2066         LDW Y,X
      008BD7 90 FE            [ 2] 2067 	LDW Y,(Y)
      008BD9 90 58            [ 2] 2068         SLAW Y
      008BDB FF               [ 2] 2069         LDW (X),Y
      008BDC 81               [ 4] 2070         RET
                                   2071 
                                   2072 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2073 ;       1+      ( a -- a )
                                   2074 ;       Add cell size in byte 
                                   2075 ;       to address.
                                   2076 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000B5D                       2077         _HEADER ONEP,2,"1+"
      008BDD 8B D2                    1         .word LINK 
                           000B5F     2         LINK=.
      008BDF 02                       3         .byte 2  
      008BE0 31 2B                    4         .ascii "1+"
      008BE2                          5         ONEP:
      008BE2 90 93            [ 1] 2078         LDW Y,X
      008BE4 90 FE            [ 2] 2079 	LDW Y,(Y)
      008BE6 90 5C            [ 1] 2080         INCW Y
      008BE8 FF               [ 2] 2081         LDW (X),Y
      008BE9 81               [ 4] 2082         RET
                                   2083 
                                   2084 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2085 ;       1-      ( a -- a )
                                   2086 ;       Subtract 2 from address.
                                   2087 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000B6A                       2088         _HEADER ONEM,2,"1-"
      008BEA 8B DF                    1         .word LINK 
                           000B6C     2         LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



      008BEC 02                       3         .byte 2  
      008BED 31 2D                    4         .ascii "1-"
      008BEF                          5         ONEM:
      008BEF 90 93            [ 1] 2089         LDW Y,X
      008BF1 90 FE            [ 2] 2090 	LDW Y,(Y)
      008BF3 90 5A            [ 2] 2091         DECW Y
      008BF5 FF               [ 2] 2092         LDW (X),Y
      008BF6 81               [ 4] 2093         RET
                                   2094 
                                   2095 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2096 ;  shift left n times 
                                   2097 ; LSHIFT ( n1 n2 -- n1<<n2 )
                                   2098 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000B77                       2099         _HEADER LSHIFT,6,"LSHIFT"
      008BF7 8B EC                    1         .word LINK 
                           000B79     2         LINK=.
      008BF9 06                       3         .byte 6  
      008BFA 4C 53 48 49 46 54        4         .ascii "LSHIFT"
      008C00                          5         LSHIFT:
      008C00 E6 01            [ 1] 2100         ld a,(1,x)
      008C02 1C 00 02         [ 2] 2101         addw x,#CELLL 
      008C05 90 93            [ 1] 2102         ldw y,x 
      008C07 90 FE            [ 2] 2103         ldw y,(y)
      008C09                       2104 LSHIFT1:
      008C09 4D               [ 1] 2105         tnz a 
      008C0A 27 05            [ 1] 2106         jreq LSHIFT4 
      008C0C 90 58            [ 2] 2107         sllw y 
      008C0E 4A               [ 1] 2108         dec a 
      008C0F 20 F8            [ 2] 2109         jra LSHIFT1 
      008C11                       2110 LSHIFT4:
      008C11 FF               [ 2] 2111         ldw (x),y 
      008C12 81               [ 4] 2112         ret 
                                   2113 
                                   2114 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2115 ; shift right n times                 
                                   2116 ; RSHIFT (n1 n2 -- n1>>n2 )
                                   2117 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000B93                       2118         _HEADER RSHIFT,6,"RSHIFT"
      008C13 8B F9                    1         .word LINK 
                           000B95     2         LINK=.
      008C15 06                       3         .byte 6  
      008C16 52 53 48 49 46 54        4         .ascii "RSHIFT"
      008C1C                          5         RSHIFT:
      008C1C E6 01            [ 1] 2119         ld a,(1,x)
      008C1E 1C 00 02         [ 2] 2120         addw x,#CELLL 
      008C21 90 93            [ 1] 2121         ldw y,x 
      008C23 90 FE            [ 2] 2122         ldw y,(y)
      008C25                       2123 RSHIFT1:
      008C25 4D               [ 1] 2124         tnz a 
      008C26 27 05            [ 1] 2125         jreq RSHIFT4 
      008C28 90 54            [ 2] 2126         srlw y 
      008C2A 4A               [ 1] 2127         dec a 
      008C2B 20 F8            [ 2] 2128         jra RSHIFT1 
      008C2D                       2129 RSHIFT4:
      008C2D FF               [ 2] 2130         ldw (x),y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



      008C2E 81               [ 4] 2131         ret 
                                   2132 
                                   2133 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2134 ;       2/      ( n -- n )
                                   2135 ;       divide  tos by 2.
                                   2136 ;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000BAF                       2137         _HEADER TWOSL,2,"2/"
      008C2F 8C 15                    1         .word LINK 
                           000BB1     2         LINK=.
      008C31 02                       3         .byte 2  
      008C32 32 2F                    4         .ascii "2/"
      008C34                          5         TWOSL:
      008C34 90 93            [ 1] 2138         LDW Y,X
      008C36 90 FE            [ 2] 2139 	LDW Y,(Y)
      008C38 90 57            [ 2] 2140         SRAW Y
      008C3A FF               [ 2] 2141         LDW (X),Y
      008C3B 81               [ 4] 2142         RET
                                   2143 
                                   2144 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2145 ;       BL      ( -- 32 )
                                   2146 ;       Return 32,  blank character.
                                   2147 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000BBC                       2148         _HEADER BLANK,2,"BL"
      008C3C 8C 31                    1         .word LINK 
                           000BBE     2         LINK=.
      008C3E 02                       3         .byte 2  
      008C3F 42 4C                    4         .ascii "BL"
      008C41                          5         BLANK:
      008C41 1D 00 02         [ 2] 2149         SUBW X,#2
      008C44 90 AE 00 20      [ 2] 2150 	LDW Y,#32
      008C48 FF               [ 2] 2151         LDW (X),Y
      008C49 81               [ 4] 2152         RET
                                   2153 
                                   2154 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2155 ;         0     ( -- 0)
                                   2156 ;         Return 0.
                                   2157 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000BCA                       2158         _HEADER ZERO,1,"0"
      008C4A 8C 3E                    1         .word LINK 
                           000BCC     2         LINK=.
      008C4C 01                       3         .byte 1  
      008C4D 30                       4         .ascii "0"
      008C4E                          5         ZERO:
      008C4E 1D 00 02         [ 2] 2159         SUBW X,#2
      008C51 90 5F            [ 1] 2160 	CLRW Y
      008C53 FF               [ 2] 2161         LDW (X),Y
      008C54 81               [ 4] 2162         RET
                                   2163 
                                   2164 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2165 ;         1     ( -- 1)
                                   2166 ;         Return 1.
                                   2167 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000BD5                       2168         _HEADER ONE,1,"1"
      008C55 8C 4C                    1         .word LINK 
                           000BD7     2         LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



      008C57 01                       3         .byte 1  
      008C58 31                       4         .ascii "1"
      008C59                          5         ONE:
      008C59 1D 00 02         [ 2] 2169         SUBW X,#2
      008C5C 90 AE 00 01      [ 2] 2170 	LDW Y,#1
      008C60 FF               [ 2] 2171         LDW (X),Y
      008C61 81               [ 4] 2172         RET
                                   2173 
                                   2174 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2175 ;         -1    ( -- -1)
                                   2176 ;   Return -1
                                   2177 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000BE2                       2178         _HEADER MONE,2,"-1"
      008C62 8C 57                    1         .word LINK 
                           000BE4     2         LINK=.
      008C64 02                       3         .byte 2  
      008C65 2D 31                    4         .ascii "-1"
      008C67                          5         MONE:
      008C67 1D 00 02         [ 2] 2179         SUBW X,#2
      008C6A 90 AE FF FF      [ 2] 2180 	LDW Y,#0xFFFF
      008C6E FF               [ 2] 2181         LDW (X),Y
      008C6F 81               [ 4] 2182         RET
                                   2183 
                                   2184 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2185 ;       >CHAR   ( c -- c )
                                   2186 ;       Filter non-printing characters.
                                   2187 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000BF0                       2188         _HEADER TCHAR,5,">CHAR"
      008C70 8C 64                    1         .word LINK 
                           000BF2     2         LINK=.
      008C72 05                       3         .byte 5  
      008C73 3E 43 48 41 52           4         .ascii ">CHAR"
      008C78                          5         TCHAR:
      008C78 E6 01            [ 1] 2189         ld a,(1,x)
      008C7A A1 20            [ 1] 2190         cp a,#32  
      008C7C 2B 05            [ 1] 2191         jrmi 1$ 
      008C7E A1 7F            [ 1] 2192         cp a,#127 
      008C80 2A 01            [ 1] 2193         jrpl 1$ 
      008C82 81               [ 4] 2194         ret 
      008C83 A6 5F            [ 1] 2195 1$:     ld a,#'_ 
      008C85 E7 01            [ 1] 2196         ld (1,x),a 
      008C87 81               [ 4] 2197         ret 
                                   2198 
                                   2199 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2200 ;       DEPTH   ( -- n )
                                   2201 ;       Return  depth of  data stack.
                                   2202 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000C08                       2203         _HEADER DEPTH,5,"DEPTH"
      008C88 8C 72                    1         .word LINK 
                           000C0A     2         LINK=.
      008C8A 05                       3         .byte 5  
      008C8B 44 45 50 54 48           4         .ascii "DEPTH"
      008C90                          5         DEPTH:
      008C90 90 BE 2C         [ 2] 2204         LDW Y,SP0    ;save data stack ptr
      008C93 BF 24            [ 2] 2205 	LDW XTEMP,X
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



      008C95 72 B2 00 24      [ 2] 2206         SUBW Y,XTEMP     ;#bytes = SP0 - X
      008C99 90 57            [ 2] 2207         SRAW Y    ;Y = #stack items
      008C9B 1D 00 02         [ 2] 2208 	SUBW X,#2
      008C9E FF               [ 2] 2209         LDW (X),Y     ; if neg, underflow
      008C9F 81               [ 4] 2210         RET
                                   2211 
                                   2212 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2213 ;       PICK    ( ... +n -- ... w )
                                   2214 ;       Copy  nth stack item to tos.
                                   2215 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000C20                       2216         _HEADER PICK,4,"PICK"
      008CA0 8C 8A                    1         .word LINK 
                           000C22     2         LINK=.
      008CA2 04                       3         .byte 4  
      008CA3 50 49 43 4B              4         .ascii "PICK"
      008CA7                          5         PICK:
      008CA7 90 93            [ 1] 2217         LDW Y,X   ;D = n1
      008CA9 90 FE            [ 2] 2218         LDW Y,(Y)
                                   2219 ; modified for standard compliance          
                                   2220 ; 0 PICK must be equivalent to DUP 
      008CAB 90 5C            [ 1] 2221         INCW Y 
      008CAD 90 58            [ 2] 2222         SLAW Y
      008CAF BF 24            [ 2] 2223         LDW XTEMP,X
      008CB1 72 B9 00 24      [ 2] 2224         ADDW Y,XTEMP
      008CB5 90 FE            [ 2] 2225         LDW Y,(Y)
      008CB7 FF               [ 2] 2226         LDW (X),Y
      008CB8 81               [ 4] 2227         RET
                                   2228 
                                   2229 ;; Memory access
                                   2230 
                                   2231 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2232 ;       +!      ( n a -- )
                                   2233 ;       Add n to  contents at 
                                   2234 ;       address a.
                                   2235 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000C39                       2236         _HEADER PSTOR,2,"+!"
      008CB9 8C A2                    1         .word LINK 
                           000C3B     2         LINK=.
      008CBB 02                       3         .byte 2  
      008CBC 2B 21                    4         .ascii "+!"
      008CBE                          5         PSTOR:
      008CBE 90 93            [ 1] 2237         ldw y,x 
      008CC0 90 FE            [ 2] 2238         ldw y,(y)
      008CC2 90 BF 26         [ 2] 2239         ldw YTEMP,y  ; address
      008CC5 90 FE            [ 2] 2240         ldw y,(y)  
      008CC7 90 89            [ 2] 2241         pushw y  ; value at address 
      008CC9 90 93            [ 1] 2242         ldw y,x 
      008CCB 90 EE 02         [ 2] 2243         ldw y,(2,y) ; n 
      008CCE 72 F9 01         [ 2] 2244         addw y,(1,sp) ; n+value
      008CD1 91 CF 26         [ 5] 2245         ldw [YTEMP],y ;  a!
      008CD4 90 85            [ 2] 2246         popw y    ;drop local var
      008CD6 1C 00 04         [ 2] 2247         addw x,#4 ; DDROP 
      008CD9 81               [ 4] 2248         ret 
                                   2249 
                                   2250 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



                                   2251 ;       2!      ( d a -- )
                                   2252 ;       Store  double integer 
                                   2253 ;       to address a.
                                   2254 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000C5A                       2255         _HEADER DSTOR,2,"2!"
      008CDA 8C BB                    1         .word LINK 
                           000C5C     2         LINK=.
      008CDC 02                       3         .byte 2  
      008CDD 32 21                    4         .ascii "2!"
      008CDF                          5         DSTOR:
      008CDF 90 93            [ 1] 2256         LDW Y,X 
      008CE1 89               [ 2] 2257         PUSHW X 
      008CE2 FE               [ 2] 2258         LDW X,(X) ; a 
      008CE3 90 EE 02         [ 2] 2259         LDW Y,(2,Y) ; dhi 
      008CE6 FF               [ 2] 2260         LDW (X),Y 
      008CE7 16 01            [ 2] 2261         LDW Y,(1,SP)  
      008CE9 90 EE 04         [ 2] 2262         LDW Y,(4,Y) ; dlo 
      008CEC EF 02            [ 2] 2263         LDW (2,X),Y  
      008CEE 85               [ 2] 2264         POPW X 
      008CEF 1C 00 06         [ 2] 2265         ADDW X,#3*CELLL 
      008CF2 81               [ 4] 2266         RET 
                                   2267 
                                   2268 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2269 ;       2@      ( a -- d )
                                   2270 ;       Fetch double integer 
                                   2271 ;       from address a.
                                   2272 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000C73                       2273         _HEADER DAT,2,"2@"
      008CF3 8C DC                    1         .word LINK 
                           000C75     2         LINK=.
      008CF5 02                       3         .byte 2  
      008CF6 32 40                    4         .ascii "2@"
      008CF8                          5         DAT:
      008CF8 90 93            [ 1] 2274         ldw y,x 
      008CFA 1D 00 02         [ 2] 2275         subw x,#CELLL 
      008CFD 90 FE            [ 2] 2276         ldw y,(y) ;address 
      008CFF 90 89            [ 2] 2277         pushw y  
      008D01 90 FE            [ 2] 2278         ldw y,(y) ; dhi 
      008D03 FF               [ 2] 2279         ldw (x),y 
      008D04 90 85            [ 2] 2280         popw y 
      008D06 90 EE 02         [ 2] 2281         ldw y,(2,y) ; dlo 
      008D09 EF 02            [ 2] 2282         ldw (2,x),y 
      008D0B 81               [ 4] 2283         ret 
                                   2284 
                                   2285 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2286 ;       COUNT   ( b -- b +n )
                                   2287 ;       Return count byte of a string
                                   2288 ;       and add 1 to byte address.
                                   2289 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000C8C                       2290         _HEADER COUNT,5,"COUNT"
      008D0C 8C F5                    1         .word LINK 
                           000C8E     2         LINK=.
      008D0E 05                       3         .byte 5  
      008D0F 43 4F 55 4E 54           4         .ascii "COUNT"
      008D14                          5         COUNT:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



      008D14 90 93            [ 1] 2291         ldw y,x 
      008D16 90 FE            [ 2] 2292         ldw y,(y) ; address 
      008D18 90 F6            [ 1] 2293         ld a,(y)  ; count 
      008D1A 90 5C            [ 1] 2294         incw y 
      008D1C FF               [ 2] 2295         ldw (x),y 
      008D1D 1D 00 02         [ 2] 2296         subw x,#CELLL 
      008D20 E7 01            [ 1] 2297         ld (1,x),a 
      008D22 7F               [ 1] 2298         clr (x)
      008D23 81               [ 4] 2299         ret 
                                   2300 
                                   2301 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2302 ;       HERE    ( -- a )
                                   2303 ;       Return  top of  variables
                                   2304 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000CA4                       2305         _HEADER HERE,4,"HERE"
      008D24 8D 0E                    1         .word LINK 
                           000CA6     2         LINK=.
      008D26 04                       3         .byte 4  
      008D27 48 45 52 45              4         .ascii "HERE"
      008D2B                          5         HERE:
      008D2B 90 AE 00 18      [ 2] 2306       	ldw y,#UVP 
      008D2F 90 FE            [ 2] 2307         ldw y,(y)
      008D31 1D 00 02         [ 2] 2308         subw x,#CELLL 
      008D34 FF               [ 2] 2309         ldw (x),y 
      008D35 81               [ 4] 2310         ret 
                                   2311 
                                   2312 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2313 ;       PAD     ( -- a )
                                   2314 ;       Return address of text buffer
                                   2315 ;       above  code dictionary.
                                   2316 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000CB6                       2317         _HEADER PAD,3,"PAD"
      008D36 8D 26                    1         .word LINK 
                           000CB8     2         LINK=.
      008D38 03                       3         .byte 3  
      008D39 50 41 44                 4         .ascii "PAD"
      008D3C                          5         PAD:
      008D3C CD 8D 2B         [ 4] 2318         CALL     HERE
      000CBF                       2319         _DOLIT   80
      008D3F CD 84 EF         [ 4]    1     CALL DOLIT 
      008D42 00 50                    2     .word 80 
      008D44 CC 88 C6         [ 2] 2320         JP     PLUS
                                   2321 
                                   2322 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2323 ;       TIB     ( -- a )
                                   2324 ;       Return address of 
                                   2325 ;       terminal input buffer.
                                   2326 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000CC7                       2327         _HEADER TIB,3,"TIB"
      008D47 8D 38                    1         .word LINK 
                           000CC9     2         LINK=.
      008D49 03                       3         .byte 3  
      008D4A 54 49 42                 4         .ascii "TIB"
      008D4D                          5         TIB:
      008D4D CD 87 95         [ 4] 2328         CALL     NTIB
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



      008D50 CD 8B B7         [ 4] 2329         CALL     CELLP
      008D53 CC 85 63         [ 2] 2330         JP     AT
                                   2331 
                                   2332 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2333 ;       @EXECUTE        ( a -- )
                                   2334 ;       Execute vector stored in 
                                   2335 ;       address a.
                                   2336 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000CD6                       2337         _HEADER ATEXE,8,"@EXECUTE"
      008D56 8D 49                    1         .word LINK 
                           000CD8     2         LINK=.
      008D58 08                       3         .byte 8  
      008D59 40 45 58 45 43 55 54     4         .ascii "@EXECUTE"
             45
      008D61                          5         ATEXE:
      008D61 CD 85 63         [ 4] 2338         CALL     AT
      008D64 CD 88 54         [ 4] 2339         CALL     QDUP    ;?address or zero
      008D67 CD 85 18         [ 4] 2340         CALL     QBRAN
      008D6A 8D 6F                 2341         .word      EXE1
      008D6C CD 85 44         [ 4] 2342         CALL     EXECU   ;execute if non-zero
      008D6F 81               [ 4] 2343 EXE1:   RET     ;do nothing if zero
                                   2344 
                                   2345 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2346 ;       CMOVE   ( b1 b2 u -- )
                                   2347 ;       Copy u bytes from b1 to b2.
                                   2348 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000CF0                       2349         _HEADER CMOVE,5,"CMOVE"
      008D70 8D 58                    1         .word LINK 
                           000CF2     2         LINK=.
      008D72 05                       3         .byte 5  
      008D73 43 4D 4F 56 45           4         .ascii "CMOVE"
      008D78                          5         CMOVE:
      008D78 CD 86 6A         [ 4] 2350         CALL	TOR
      008D7B CD 85 34         [ 4] 2351         CALL	BRAN
      008D7E 8D 98                 2352         .word	CMOV2
      008D80 CD 86 6A         [ 4] 2353 CMOV1:	CALL	TOR
      008D83 CD 86 A1         [ 4] 2354         CALL	DUPP
      008D86 CD 85 81         [ 4] 2355         CALL	CAT
      008D89 CD 85 C5         [ 4] 2356         CALL	RAT
      008D8C CD 85 70         [ 4] 2357         CALL	CSTOR
      008D8F CD 8B E2         [ 4] 2358         CALL	ONEP
      008D92 CD 85 B4         [ 4] 2359         CALL	RFROM
      008D95 CD 8B E2         [ 4] 2360         CALL	ONEP
      008D98 CD 85 03         [ 4] 2361 CMOV2:	CALL	DONXT
      008D9B 8D 80                 2362         .word	CMOV1
      008D9D CC 88 A6         [ 2] 2363         JP	DDROP
                                   2364 
                                   2365 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2366 ;       FILL    ( b u c -- )
                                   2367 ;       Fill u bytes of character c
                                   2368 ;       to area beginning at b.
                                   2369 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000D20                       2370         _HEADER FILL,4,"FILL"
      008DA0 8D 72                    1         .word LINK 
                           000D22     2         LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



      008DA2 04                       3         .byte 4  
      008DA3 46 49 4C 4C              4         .ascii "FILL"
      008DA7                          5         FILL:
      008DA7 90 93            [ 1] 2371         ldw y,x 
      008DA9 90 E6 01         [ 1] 2372         ld a,(1,y) ; c 
      008DAC 1C 00 02         [ 2] 2373         addw x,#CELLL ; drop c 
      008DAF 90 93            [ 1] 2374         ldw y,x 
      008DB1 90 FE            [ 2] 2375         ldw y,(y) ; count
      008DB3 90 89            [ 2] 2376         pushw y 
      008DB5 1C 00 02         [ 2] 2377         addw x,#CELLL ; drop u 
      008DB8 90 93            [ 1] 2378         ldw y,x 
      008DBA 1C 00 02         [ 2] 2379         addw x,#CELLL ; drop b 
      008DBD 90 FE            [ 2] 2380         ldw y,(y) ; address
      008DBF 90 BF 26         [ 2] 2381         ldw YTEMP,y
      008DC2 90 85            [ 2] 2382         popw y ; count 
      008DC4                       2383 FILL1:  
      008DC4 92 C7 26         [ 4] 2384         ld [YTEMP],a 
      008DC7 3C 27            [ 1] 2385         inc YTEMP+1
      008DC9 24 02            [ 1] 2386         jrnc FILL2 
      008DCB 3C 26            [ 1] 2387         inc YTEMP
      008DCD                       2388 FILL2: 
      008DCD 90 5A            [ 2] 2389         decw y ; count 
      008DCF 26 F3            [ 1] 2390         jrne FILL1  
      008DD1 81               [ 4] 2391         ret 
                                   2392 
                                   2393 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2394 ;       ERASE   ( b u -- )
                                   2395 ;       Erase u bytes beginning at b.
                                   2396 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000D52                       2397         _HEADER ERASE,5,"ERASE"
      008DD2 8D A2                    1         .word LINK 
                           000D54     2         LINK=.
      008DD4 05                       3         .byte 5  
      008DD5 45 52 41 53 45           4         .ascii "ERASE"
      008DDA                          5         ERASE:
      008DDA 90 5F            [ 1] 2398         clrw y 
      008DDC 1D 00 02         [ 2] 2399         subw x,#CELLL 
      008DDF FF               [ 2] 2400         ldw (x),y 
      008DE0 CC 8D A7         [ 2] 2401         jp FILL 
                                   2402 
                                   2403 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2404 ;       PACK0   ( b u a -- a )
                                   2405 ;       Build a counted string with
                                   2406 ;       u characters from b. Null fill.
                                   2407 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000D63                       2408         _HEADER PACKS,5,"PACK0"
      008DE3 8D D4                    1         .word LINK 
                           000D65     2         LINK=.
      008DE5 05                       3         .byte 5  
      008DE6 50 41 43 4B 30           4         .ascii "PACK0"
      008DEB                          5         PACKS:
      008DEB CD 86 A1         [ 4] 2409         CALL     DUPP
      008DEE CD 86 6A         [ 4] 2410         CALL     TOR     ;strings only on cell boundary
      008DF1 CD 88 B1         [ 4] 2411         CALL     DDUP
      008DF4 CD 85 70         [ 4] 2412         CALL     CSTOR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



      008DF7 CD 8B E2         [ 4] 2413         CALL     ONEP ;save count
      008DFA CD 86 B1         [ 4] 2414         CALL     SWAPP
      008DFD CD 8D 78         [ 4] 2415         CALL     CMOVE
      008E00 CD 85 B4         [ 4] 2416         CALL     RFROM
      008E03 81               [ 4] 2417         RET
                                   2418 
                                   2419 ;; Numeric output, single precision
                                   2420 
                                   2421 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2422 ;       DIGIT   ( u -- c )
                                   2423 ;       Convert digit u to a character.
                                   2424 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000D84                       2425         _HEADER DIGIT,5,"DIGIT"
      008E04 8D E5                    1         .word LINK 
                           000D86     2         LINK=.
      008E06 05                       3         .byte 5  
      008E07 44 49 47 49 54           4         .ascii "DIGIT"
      008E0C                          5         DIGIT:
      008E0C CD 84 EF         [ 4] 2426         CALL	DOLIT
      008E0F 00 09                 2427         .word	9
      008E11 CD 86 C9         [ 4] 2428         CALL	OVER
      008E14 CD 89 A2         [ 4] 2429         CALL	LESS
      008E17 CD 84 EF         [ 4] 2430         CALL	DOLIT
      008E1A 00 07                 2431         .word	7
      008E1C CD 86 FE         [ 4] 2432         CALL	ANDD
      008E1F CD 88 C6         [ 4] 2433         CALL	PLUS
      008E22 CD 84 EF         [ 4] 2434         CALL	DOLIT
      008E25 00 30                 2435         .word	48	;'0'
      008E27 CC 88 C6         [ 2] 2436         JP	PLUS
                                   2437 
                                   2438 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2439 ;       EXTRACT ( n base -- n c )
                                   2440 ;       Extract least significant 
                                   2441 ;       digit from n.
                                   2442 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000DAA                       2443         _HEADER EXTRC,7,"EXTRACT"
      008E2A 8E 06                    1         .word LINK 
                           000DAC     2         LINK=.
      008E2C 07                       3         .byte 7  
      008E2D 45 58 54 52 41 43 54     4         .ascii "EXTRACT"
      008E34                          5         EXTRC:
      008E34 CD 8C 4E         [ 4] 2444         CALL     ZERO
      008E37 CD 86 B1         [ 4] 2445         CALL     SWAPP
      008E3A CD 8A 58         [ 4] 2446         CALL     UMMOD
      008E3D CD 86 B1         [ 4] 2447         CALL     SWAPP
      008E40 CC 8E 0C         [ 2] 2448         JP     DIGIT
                                   2449 
                                   2450 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2451 ;       <#      ( -- )
                                   2452 ;       Initiate  numeric 
                                   2453 ;       output process.
                                   2454 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000DC3                       2455         _HEADER BDIGS,2,"#<"
      008E43 8E 2C                    1         .word LINK 
                           000DC5     2         LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



      008E45 02                       3         .byte 2  
      008E46 23 3C                    4         .ascii "#<"
      008E48                          5         BDIGS:
      008E48 CD 8D 3C         [ 4] 2456         CALL     PAD
      008E4B CD 87 D7         [ 4] 2457         CALL     HLD
      008E4E CC 85 51         [ 2] 2458         JP     STORE
                                   2459 
                                   2460 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2461 ;       HOLD    ( c -- )
                                   2462 ;       Insert a character 
                                   2463 ;       into output string.
                                   2464 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000DD1                       2465         _HEADER HOLD,4,"HOLD"
      008E51 8E 45                    1         .word LINK 
                           000DD3     2         LINK=.
      008E53 04                       3         .byte 4  
      008E54 48 4F 4C 44              4         .ascii "HOLD"
      008E58                          5         HOLD:
      008E58 CD 87 D7         [ 4] 2466         CALL     HLD
      008E5B CD 85 63         [ 4] 2467         CALL     AT
      008E5E CD 8B EF         [ 4] 2468         CALL     ONEM
      008E61 CD 86 A1         [ 4] 2469         CALL     DUPP
      008E64 CD 87 D7         [ 4] 2470         CALL     HLD
      008E67 CD 85 51         [ 4] 2471         CALL     STORE
      008E6A CC 85 70         [ 2] 2472         JP     CSTOR
                                   2473 
                                   2474 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2475 ;       #       ( u -- u )
                                   2476 ;       Extract one digit from u and
                                   2477 ;       append digit to output string.
                                   2478 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000DED                       2479         _HEADER DIG,1,"#"
      008E6D 8E 53                    1         .word LINK 
                           000DEF     2         LINK=.
      008E6F 01                       3         .byte 1  
      008E70 23                       4         .ascii "#"
      008E71                          5         DIG:
      008E71 CD 87 67         [ 4] 2480         CALL     BASE
      008E74 CD 85 63         [ 4] 2481         CALL     AT
      008E77 CD 8E 34         [ 4] 2482         CALL     EXTRC
      008E7A CC 8E 58         [ 2] 2483         JP     HOLD
                                   2484 
                                   2485 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2486 ;       #S      ( u -- 0 )
                                   2487 ;       Convert u until all digits
                                   2488 ;       are added to output string.
                                   2489 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000DFD                       2490         _HEADER DIGS,2,"#S"
      008E7D 8E 6F                    1         .word LINK 
                           000DFF     2         LINK=.
      008E7F 02                       3         .byte 2  
      008E80 23 53                    4         .ascii "#S"
      008E82                          5         DIGS:
      008E82 CD 8E 71         [ 4] 2491 DIGS1:  CALL     DIG
      008E85 CD 86 A1         [ 4] 2492         CALL     DUPP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



      008E88 CD 85 18         [ 4] 2493         CALL     QBRAN
      008E8B 8E 8F                 2494         .word      DIGS2
      008E8D 20 F3            [ 2] 2495         JRA     DIGS1
      008E8F 81               [ 4] 2496 DIGS2:  RET
                                   2497 
                                   2498 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2499 ;       SIGN    ( n -- )
                                   2500 ;       Add a minus sign to
                                   2501 ;       numeric output string.
                                   2502 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000E10                       2503         _HEADER SIGN,4,"SIGN"
      008E90 8E 7F                    1         .word LINK 
                           000E12     2         LINK=.
      008E92 04                       3         .byte 4  
      008E93 53 49 47 4E              4         .ascii "SIGN"
      008E97                          5         SIGN:
      008E97 CD 86 D8         [ 4] 2504         CALL     ZLESS
      008E9A CD 85 18         [ 4] 2505         CALL     QBRAN
      008E9D 8E A7                 2506         .word      SIGN1
      008E9F CD 84 EF         [ 4] 2507         CALL     DOLIT
      008EA2 00 2D                 2508         .word      45	;"-"
      008EA4 CC 8E 58         [ 2] 2509         JP     HOLD
      008EA7 81               [ 4] 2510 SIGN1:  RET
                                   2511 
                                   2512 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2513 ;       #>      ( w -- b u )
                                   2514 ;       Prepare output string.
                                   2515 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000E28                       2516         _HEADER EDIGS,2,"#>"
      008EA8 8E 92                    1         .word LINK 
                           000E2A     2         LINK=.
      008EAA 02                       3         .byte 2  
      008EAB 23 3E                    4         .ascii "#>"
      008EAD                          5         EDIGS:
      008EAD CD 86 97         [ 4] 2517         CALL     DROP
      008EB0 CD 87 D7         [ 4] 2518         CALL     HLD
      008EB3 CD 85 63         [ 4] 2519         CALL     AT
      008EB6 CD 8D 3C         [ 4] 2520         CALL     PAD
      008EB9 CD 86 C9         [ 4] 2521         CALL     OVER
      008EBC CC 89 3D         [ 2] 2522         JP     SUBB
                                   2523 
                                   2524 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2525 ;       str     ( w -- b u )
                                   2526 ;       Convert a signed integer
                                   2527 ;       to a numeric string.
                                   2528 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000E3F                       2529         _HEADER STR,3,"STR"
      008EBF 8E AA                    1         .word LINK 
                           000E41     2         LINK=.
      008EC1 03                       3         .byte 3  
      008EC2 53 54 52                 4         .ascii "STR"
      008EC5                          5         STR:
      008EC5 CD 86 A1         [ 4] 2530         CALL     DUPP
      008EC8 CD 86 6A         [ 4] 2531         CALL     TOR
      008ECB CD 89 57         [ 4] 2532         CALL     ABSS
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



      008ECE CD 8E 48         [ 4] 2533         CALL     BDIGS
      008ED1 CD 8E 82         [ 4] 2534         CALL     DIGS
      008ED4 CD 85 B4         [ 4] 2535         CALL     RFROM
      008ED7 CD 8E 97         [ 4] 2536         CALL     SIGN
      008EDA CC 8E AD         [ 2] 2537         JP     EDIGS
                                   2538 
                                   2539 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2540 ;       HEX     ( -- )
                                   2541 ;       Use radix 16 as base for
                                   2542 ;       numeric conversions.
                                   2543 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000E5D                       2544         _HEADER HEX,3,"HEX"
      008EDD 8E C1                    1         .word LINK 
                           000E5F     2         LINK=.
      008EDF 03                       3         .byte 3  
      008EE0 48 45 58                 4         .ascii "HEX"
      008EE3                          5         HEX:
      008EE3 CD 84 EF         [ 4] 2545         CALL     DOLIT
      008EE6 00 10                 2546         .word      16
      008EE8 CD 87 67         [ 4] 2547         CALL     BASE
      008EEB CC 85 51         [ 2] 2548         JP     STORE
                                   2549 
                                   2550 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2551 ;       DECIMAL ( -- )
                                   2552 ;       Use radix 10 as base
                                   2553 ;       for numeric conversions.
                                   2554 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000E6E                       2555         _HEADER DECIM,7,"DECIMAL"
      008EEE 8E DF                    1         .word LINK 
                           000E70     2         LINK=.
      008EF0 07                       3         .byte 7  
      008EF1 44 45 43 49 4D 41 4C     4         .ascii "DECIMAL"
      008EF8                          5         DECIM:
      008EF8 CD 84 EF         [ 4] 2556         CALL     DOLIT
      008EFB 00 0A                 2557         .word      10
      008EFD CD 87 67         [ 4] 2558         CALL     BASE
      008F00 CC 85 51         [ 2] 2559         JP     STORE
                                   2560 
                                   2561 ;; Numeric input, single precision
                                   2562 
                                   2563 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2564 ;       DIGIT?  ( c base -- u t )
                                   2565 ;       Convert a character to its numeric
                                   2566 ;       value. A flag indicates success.
                                   2567 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000E83                       2568         _HEADER DIGTQ,6,"DIGIT?"
      008F03 8E F0                    1         .word LINK 
                           000E85     2         LINK=.
      008F05 06                       3         .byte 6  
      008F06 44 49 47 49 54 3F        4         .ascii "DIGIT?"
      008F0C                          5         DIGTQ:
      008F0C CD 86 6A         [ 4] 2569         CALL     TOR
      008F0F CD 84 EF         [ 4] 2570         CALL     DOLIT
      008F12 00 30                 2571         .word     48	; "0"
      008F14 CD 89 3D         [ 4] 2572         CALL     SUBB
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



      008F17 CD 84 EF         [ 4] 2573         CALL     DOLIT
      008F1A 00 09                 2574         .word      9
      008F1C CD 86 C9         [ 4] 2575         CALL     OVER
      008F1F CD 89 A2         [ 4] 2576         CALL     LESS
      008F22 CD 85 18         [ 4] 2577         CALL     QBRAN
      008F25 8F 3D                 2578         .word      DGTQ1
      008F27 CD 84 EF         [ 4] 2579         CALL     DOLIT
      008F2A 00 07                 2580         .word      7
      008F2C CD 89 3D         [ 4] 2581         CALL     SUBB
      008F2F CD 86 A1         [ 4] 2582         CALL     DUPP
      008F32 CD 84 EF         [ 4] 2583         CALL     DOLIT
      008F35 00 0A                 2584         .word      10
      008F37 CD 89 A2         [ 4] 2585         CALL     LESS
      008F3A CD 87 12         [ 4] 2586         CALL     ORR
      008F3D CD 86 A1         [ 4] 2587 DGTQ1:  CALL     DUPP
      008F40 CD 85 B4         [ 4] 2588         CALL     RFROM
      008F43 CC 89 84         [ 2] 2589         JP     ULESS
                                   2590 
                           000001  2591 .if  WANT_DOUBLE
                           000000  2592 .else 
                                   2593 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2594 ;       NUMBER? ( a -- n T | a F )
                                   2595 ;       Convert a number string to
                                   2596 ;       integer. Push a flag on tos.
                                   2597 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2598         _HEADER NUMBQ,7,"NUMBER?"
                                   2599         CALL     BASE
                                   2600         CALL     AT
                                   2601         CALL     TOR
                                   2602         CALL     ZERO
                                   2603         CALL     OVER
                                   2604         CALL     COUNT
                                   2605         CALL     OVER
                                   2606         CALL     CAT
                                   2607         CALL     DOLIT
                                   2608         .word     36	; "0x"
                                   2609         CALL     EQUAL
                                   2610         CALL     QBRAN
                                   2611         .word      NUMQ1
                                   2612         CALL     HEX
                                   2613         CALL     SWAPP
                                   2614         CALL     ONEP
                                   2615         CALL     SWAPP
                                   2616         CALL     ONEM
                                   2617 NUMQ1:  CALL     OVER
                                   2618         CALL     CAT
                                   2619         CALL     DOLIT
                                   2620         .word     45	; "-"
                                   2621         CALL     EQUAL
                                   2622         CALL     TOR
                                   2623         CALL     SWAPP
                                   2624         CALL     RAT
                                   2625         CALL     SUBB
                                   2626         CALL     SWAPP
                                   2627         CALL     RAT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



                                   2628         CALL     PLUS
                                   2629         CALL     QDUP
                                   2630         CALL     QBRAN
                                   2631         .word      NUMQ6
                                   2632         CALL     ONEM
                                   2633         CALL     TOR
                                   2634 NUMQ2:  CALL     DUPP
                                   2635         CALL     TOR
                                   2636         CALL     CAT
                                   2637         CALL     BASE
                                   2638         CALL     AT
                                   2639         CALL     DIGTQ
                                   2640         CALL     QBRAN
                                   2641         .word      NUMQ4
                                   2642         CALL     SWAPP
                                   2643         CALL     BASE
                                   2644         CALL     AT
                                   2645         CALL     STAR
                                   2646         CALL     PLUS
                                   2647         CALL     RFROM
                                   2648         CALL     ONEP
                                   2649         CALL     DONXT
                                   2650         .word      NUMQ2
                                   2651         CALL     RAT
                                   2652         CALL     SWAPP
                                   2653         CALL     DROP
                                   2654         CALL     QBRAN
                                   2655         .word      NUMQ3
                                   2656         CALL     NEGAT
                                   2657 NUMQ3:  CALL     SWAPP
                                   2658         JRA     NUMQ5
                                   2659 NUMQ4:  CALL     RFROM
                                   2660         CALL     RFROM
                                   2661         CALL     DDROP
                                   2662         CALL     DDROP
                                   2663         CALL     ZERO
                                   2664 NUMQ5:  CALL     DUPP
                                   2665 NUMQ6:  CALL     RFROM
                                   2666         CALL     DDROP
                                   2667         CALL     RFROM
                                   2668         CALL     BASE
                                   2669         JP     STORE
                                   2670 .endif ; WANT_DOUBLE  
                                   2671 
                                   2672 ;; Basic I/O
                                   2673 
                                   2674 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2675 ;       KEY     ( -- c )
                                   2676 ;       Wait for and return an
                                   2677 ;       input character.
                                   2678 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000EC6                       2679         _HEADER KEY,3,"KEY"
      008F46 8F 05                    1         .word LINK 
                           000EC8     2         LINK=.
      008F48 03                       3         .byte 3  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



      008F49 4B 45 59                 4         .ascii "KEY"
      008F4C                          5         KEY:
      008F4C 72 0B 52 30 FB   [ 2] 2680         btjf UART_SR,#UART_SR_RXNE,. 
      008F51 C6 52 31         [ 1] 2681         ld a,UART_DR 
      008F54 1D 00 02         [ 2] 2682         subw x,#CELLL 
      008F57 E7 01            [ 1] 2683         ld (1,x),a 
      008F59 7F               [ 1] 2684         clr (x)
      008F5A 81               [ 4] 2685         ret 
                                   2686 
                                   2687 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2688 ;       NUF?    ( -- t )
                                   2689 ;       Return false if no input,
                                   2690 ;       else pause and if CR return true.
                                   2691 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000EDB                       2692         _HEADER NUFQ,4,"NUF?"
      008F5B 8F 48                    1         .word LINK 
                           000EDD     2         LINK=.
      008F5D 04                       3         .byte 4  
      008F5E 4E 55 46 3F              4         .ascii "NUF?"
      008F62                          5         NUFQ:
      008F62 CD 84 98         [ 4] 2693         CALL     QKEY
      008F65 CD 86 A1         [ 4] 2694         CALL     DUPP
      008F68 CD 85 18         [ 4] 2695         CALL     QBRAN
      008F6B 8F 7B                 2696         .word    NUFQ1
      008F6D CD 88 A6         [ 4] 2697         CALL     DDROP
      008F70 CD 8F 4C         [ 4] 2698         CALL     KEY
      008F73 CD 84 EF         [ 4] 2699         CALL     DOLIT
      008F76 00 0D                 2700         .word      CRR
      008F78 CC 89 65         [ 2] 2701         JP     EQUAL
      008F7B 81               [ 4] 2702 NUFQ1:  RET
                                   2703 
                                   2704 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2705 ;       SPACE   ( -- )
                                   2706 ;       Send  blank character to
                                   2707 ;       output device.
                                   2708 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000EFC                       2709         _HEADER SPACE,5,"SPACE"
      008F7C 8F 5D                    1         .word LINK 
                           000EFE     2         LINK=.
      008F7E 05                       3         .byte 5  
      008F7F 53 50 41 43 45           4         .ascii "SPACE"
      008F84                          5         SPACE:
      008F84 CD 8C 41         [ 4] 2710         CALL     BLANK
      008F87 CC 84 B6         [ 2] 2711         JP     EMIT
                                   2712 
                                   2713 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2714 ;       SPACES  ( +n -- )
                                   2715 ;       Send n spaces to output device.
                                   2716 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000F0A                       2717         _HEADER SPACS,6,"SPACES"
      008F8A 8F 7E                    1         .word LINK 
                           000F0C     2         LINK=.
      008F8C 06                       3         .byte 6  
      008F8D 53 50 41 43 45 53        4         .ascii "SPACES"
      008F93                          5         SPACS:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



      008F93 CD 8C 4E         [ 4] 2718         CALL     ZERO
      008F96 CD 8A 00         [ 4] 2719         CALL     MAX
      008F99 CD 86 6A         [ 4] 2720         CALL     TOR
      008F9C 20 03            [ 2] 2721         JRA      CHAR2
      008F9E CD 8F 84         [ 4] 2722 CHAR1:  CALL     SPACE
      008FA1 CD 85 03         [ 4] 2723 CHAR2:  CALL     DONXT
      008FA4 8F 9E                 2724         .word    CHAR1
      008FA6 81               [ 4] 2725         RET
                                   2726 
                                   2727 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2728 ;       TYPE    ( b u -- )
                                   2729 ;       Output u characters from b.
                                   2730 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000F27                       2731         _HEADER TYPES,4,"TYPE"
      008FA7 8F 8C                    1         .word LINK 
                           000F29     2         LINK=.
      008FA9 04                       3         .byte 4  
      008FAA 54 59 50 45              4         .ascii "TYPE"
      008FAE                          5         TYPES:
      008FAE CD 86 6A         [ 4] 2732         CALL     TOR
      008FB1 20 06            [ 2] 2733         JRA     TYPE2
      008FB3 CD 8D 14         [ 4] 2734 TYPE1:  CALL     COUNT 
      008FB6 CD 84 B6         [ 4] 2735         CALL     EMIT
      000F39                       2736 TYPE2:  _DONXT  TYPE1
      008FB9 CD 85 03         [ 4]    1     CALL DONXT 
      008FBC 8F B3                    2     .word TYPE1 
      008FBE CC 86 97         [ 2] 2737         JP     DROP
                                   2738 
                                   2739 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2740 ;       CR      ( -- )
                                   2741 ;       Output a carriage return
                                   2742 ;       and a line feed.
                                   2743 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000F41                       2744         _HEADER CR,2,"CR"
      008FC1 8F A9                    1         .word LINK 
                           000F43     2         LINK=.
      008FC3 02                       3         .byte 2  
      008FC4 43 52                    4         .ascii "CR"
      008FC6                          5         CR:
      000F46                       2745         _DOLIT  CRR 
      008FC6 CD 84 EF         [ 4]    1     CALL DOLIT 
      008FC9 00 0D                    2     .word CRR 
      008FCB CD 84 B6         [ 4] 2746         CALL    EMIT
      000F4E                       2747         _DOLIT  LF
      008FCE CD 84 EF         [ 4]    1     CALL DOLIT 
      008FD1 00 0A                    2     .word LF 
      008FD3 CC 84 B6         [ 2] 2748         JP      EMIT
                                   2749 
                                   2750 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2751 ;       do$     ( -- a )
                                   2752 ;       Return  address of a compiled
                                   2753 ;       string.
                                   2754 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2755 ;       _HEADER DOSTR,COMPO+3,"DO$"
      008FD6                       2756 DOSTR:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



      008FD6 CD 85 B4         [ 4] 2757         CALL     RFROM
      008FD9 CD 85 C5         [ 4] 2758         CALL     RAT
      008FDC CD 85 B4         [ 4] 2759         CALL     RFROM
      008FDF CD 8D 14         [ 4] 2760         CALL     COUNT
      008FE2 CD 88 C6         [ 4] 2761         CALL     PLUS
      008FE5 CD 86 6A         [ 4] 2762         CALL     TOR
      008FE8 CD 86 B1         [ 4] 2763         CALL     SWAPP
      008FEB CD 86 6A         [ 4] 2764         CALL     TOR
      008FEE 81               [ 4] 2765         RET
                                   2766 
                                   2767 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2768 ;       $"|     ( -- a )
                                   2769 ;       Run time routine compiled by $".
                                   2770 ;       Return address of a compiled string.
                                   2771 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2772 ;       _HEADER STRQP,COMPO+3,"$\"|"
      008FEF                       2773 STRQP:
      008FEF CD 8F D6         [ 4] 2774         CALL     DOSTR
      008FF2 81               [ 4] 2775         RET
                                   2776 
                                   2777 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2778 ;       ."|     ( -- )
                                   2779 ;       Run time routine of ." .
                                   2780 ;       Output a compiled string.
                                   2781 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2782 ;       _HEADER DOTQP,COMPO+3,".\"|"
      008FF3                       2783 DOTQP:
      008FF3 CD 8F D6         [ 4] 2784         CALL     DOSTR
      008FF6 CD 8D 14         [ 4] 2785         CALL     COUNT
      008FF9 CC 8F AE         [ 2] 2786         JP     TYPES
                                   2787 
                                   2788 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2789 ;       .R      ( n +n -- )
                                   2790 ;       Display an integer in a field
                                   2791 ;       of n columns, right justified.
                                   2792 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000F7C                       2793         _HEADER DOTR,2,".R"
      008FFC 8F C3                    1         .word LINK 
                           000F7E     2         LINK=.
      008FFE 02                       3         .byte 2  
      008FFF 2E 52                    4         .ascii ".R"
      009001                          5         DOTR:
      009001 CD 86 6A         [ 4] 2794         CALL     TOR
      009004 CD 8E C5         [ 4] 2795         CALL     STR
      009007 CD 85 B4         [ 4] 2796         CALL     RFROM
      00900A CD 86 C9         [ 4] 2797         CALL     OVER
      00900D CD 89 3D         [ 4] 2798         CALL     SUBB
      009010 CD 8F 93         [ 4] 2799         CALL     SPACS
      009013 CC 8F AE         [ 2] 2800         JP     TYPES
                                   2801 
                                   2802 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2803 ;       U.R     ( u +n -- )
                                   2804 ;       Display an unsigned integer
                                   2805 ;       in n column, right justified.
                                   2806 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



      000F96                       2807         _HEADER UDOTR,3,"U.R"
      009016 8F FE                    1         .word LINK 
                           000F98     2         LINK=.
      009018 03                       3         .byte 3  
      009019 55 2E 52                 4         .ascii "U.R"
      00901C                          5         UDOTR:
      00901C CD 86 6A         [ 4] 2808         CALL     TOR
      00901F CD 8E 48         [ 4] 2809         CALL     BDIGS
      009022 CD 8E 82         [ 4] 2810         CALL     DIGS
      009025 CD 8E AD         [ 4] 2811         CALL     EDIGS
      009028 CD 85 B4         [ 4] 2812         CALL     RFROM
      00902B CD 86 C9         [ 4] 2813         CALL     OVER
      00902E CD 89 3D         [ 4] 2814         CALL     SUBB
      009031 CD 8F 93         [ 4] 2815         CALL     SPACS
      009034 CC 8F AE         [ 2] 2816         JP     TYPES
                                   2817 
                                   2818 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2819 ;       U.      ( u -- )
                                   2820 ;       Display an unsigned integer
                                   2821 ;       in free format.
                                   2822 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000FB7                       2823         _HEADER UDOT,2,"U."
      009037 90 18                    1         .word LINK 
                           000FB9     2         LINK=.
      009039 02                       3         .byte 2  
      00903A 55 2E                    4         .ascii "U."
      00903C                          5         UDOT:
      00903C CD 8E 48         [ 4] 2824         CALL     BDIGS
      00903F CD 8E 82         [ 4] 2825         CALL     DIGS
      009042 CD 8E AD         [ 4] 2826         CALL     EDIGS
      009045 CD 8F 84         [ 4] 2827         CALL     SPACE
      009048 CC 8F AE         [ 2] 2828         JP     TYPES
                                   2829 
                                   2830 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2831 ;   H. ( n -- )
                                   2832 ;   display n in hexadecimal 
                                   2833 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000FCB                       2834         _HEADER HDOT,2,"H."
      00904B 90 39                    1         .word LINK 
                           000FCD     2         LINK=.
      00904D 02                       3         .byte 2  
      00904E 48 2E                    4         .ascii "H."
      009050                          5         HDOT:
      009050 CD 87 67         [ 4] 2835         CALL BASE 
      009053 CD 85 63         [ 4] 2836         CALL AT 
      009056 CD 86 6A         [ 4] 2837         CALL TOR 
      009059 CD 8E E3         [ 4] 2838         CALL HEX 
      00905C CD 90 3C         [ 4] 2839         CALL UDOT 
      00905F CD 85 B4         [ 4] 2840         CALL RFROM 
      009062 CD 87 67         [ 4] 2841         CALL BASE 
      009065 CD 85 51         [ 4] 2842         CALL STORE 
      009068 81               [ 4] 2843         RET 
                                   2844 
                                   2845 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2846 ;       .       ( w -- )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



                                   2847 ;       Display an integer in free
                                   2848 ;       format, preceeded by a space.
                                   2849 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000FE9                       2850         _HEADER DOT,1,"."
      009069 90 4D                    1         .word LINK 
                           000FEB     2         LINK=.
      00906B 01                       3         .byte 1  
      00906C 2E                       4         .ascii "."
      00906D                          5         DOT:
      00906D CD 87 67         [ 4] 2851         CALL     BASE
      009070 CD 85 63         [ 4] 2852         CALL     AT
      009073 CD 84 EF         [ 4] 2853         CALL     DOLIT
      009076 00 0A                 2854         .word      10
      009078 CD 87 27         [ 4] 2855         CALL     XORR    ;?decimal
      00907B CD 85 18         [ 4] 2856         CALL     QBRAN
      00907E 90 83                 2857         .word      DOT1
      009080 CC 90 3C         [ 2] 2858         JP     UDOT
      009083 CD 8E C5         [ 4] 2859 DOT1:   CALL     STR
      009086 CD 8F 84         [ 4] 2860         CALL     SPACE
      009089 CC 8F AE         [ 2] 2861         JP     TYPES
                                   2862 
                                   2863 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2864 ;       ?       ( a -- )
                                   2865 ;       Display contents in memory cell.
                                   2866 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00100C                       2867         _HEADER QUEST,1,"?"
      00908C 90 6B                    1         .word LINK 
                           00100E     2         LINK=.
      00908E 01                       3         .byte 1  
      00908F 3F                       4         .ascii "?"
      009090                          5         QUEST:
      009090 CD 85 63         [ 4] 2868         CALL     AT
      009093 CC 90 6D         [ 2] 2869         JP     DOT
                                   2870 
                                   2871 ;; Parsing
                                   2872 
                                   2873 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2874 ;       parse   ( b u c -- b u delta ; <string> )
                                   2875 ;       Scan string delimited by c.
                                   2876 ;       Return found string and its offset.
                                   2877 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001016                       2878         _HEADER PARS,5,"PARS$"
      009096 90 8E                    1         .word LINK 
                           001018     2         LINK=.
      009098 05                       3         .byte 5  
      009099 50 41 52 53 24           4         .ascii "PARS$"
      00909E                          5         PARS:
      00909E CD 87 76         [ 4] 2879         CALL     TEMP
      0090A1 CD 85 51         [ 4] 2880         CALL     STORE
      0090A4 CD 86 C9         [ 4] 2881         CALL     OVER
      0090A7 CD 86 6A         [ 4] 2882         CALL     TOR
      0090AA CD 86 A1         [ 4] 2883         CALL     DUPP
      0090AD CD 85 18         [ 4] 2884         CALL     QBRAN
      0090B0 91 56                 2885         .word    PARS8
      0090B2 CD 8B EF         [ 4] 2886         CALL     ONEM
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



      0090B5 CD 87 76         [ 4] 2887         CALL     TEMP
      0090B8 CD 85 63         [ 4] 2888         CALL     AT
      0090BB CD 8C 41         [ 4] 2889         CALL     BLANK
      0090BE CD 89 65         [ 4] 2890         CALL     EQUAL
      0090C1 CD 85 18         [ 4] 2891         CALL     QBRAN
      0090C4 90 F7                 2892         .word      PARS3
      0090C6 CD 86 6A         [ 4] 2893         CALL     TOR
      0090C9 CD 8C 41         [ 4] 2894 PARS1:  CALL     BLANK
      0090CC CD 86 C9         [ 4] 2895         CALL     OVER
      0090CF CD 85 81         [ 4] 2896         CALL     CAT     ;skip leading blanks ONLY
      0090D2 CD 89 3D         [ 4] 2897         CALL     SUBB
      0090D5 CD 86 D8         [ 4] 2898         CALL     ZLESS
      0090D8 CD 88 E0         [ 4] 2899         CALL     INVER
      0090DB CD 85 18         [ 4] 2900         CALL     QBRAN
      0090DE 90 F4                 2901         .word      PARS2
      0090E0 CD 8B E2         [ 4] 2902         CALL     ONEP
      0090E3 CD 85 03         [ 4] 2903         CALL     DONXT
      0090E6 90 C9                 2904         .word      PARS1
      0090E8 CD 85 B4         [ 4] 2905         CALL     RFROM
      0090EB CD 86 97         [ 4] 2906         CALL     DROP
      0090EE CD 8C 4E         [ 4] 2907         CALL     ZERO
      0090F1 CC 86 A1         [ 2] 2908         JP     DUPP
      0090F4 CD 85 B4         [ 4] 2909 PARS2:  CALL     RFROM
      0090F7 CD 86 C9         [ 4] 2910 PARS3:  CALL     OVER
      0090FA CD 86 B1         [ 4] 2911         CALL     SWAPP
      0090FD CD 86 6A         [ 4] 2912         CALL     TOR
      009100 CD 87 76         [ 4] 2913 PARS4:  CALL     TEMP
      009103 CD 85 63         [ 4] 2914         CALL     AT
      009106 CD 86 C9         [ 4] 2915         CALL     OVER
      009109 CD 85 81         [ 4] 2916         CALL     CAT
      00910C CD 89 3D         [ 4] 2917         CALL     SUBB    ;scan for delimiter
      00910F CD 87 76         [ 4] 2918         CALL     TEMP
      009112 CD 85 63         [ 4] 2919         CALL     AT
      009115 CD 8C 41         [ 4] 2920         CALL     BLANK
      009118 CD 89 65         [ 4] 2921         CALL     EQUAL
      00911B CD 85 18         [ 4] 2922         CALL     QBRAN
      00911E 91 23                 2923         .word      PARS5
      009120 CD 86 D8         [ 4] 2924         CALL     ZLESS
      009123 CD 85 18         [ 4] 2925 PARS5:  CALL     QBRAN
      009126 91 38                 2926         .word      PARS6
      009128 CD 8B E2         [ 4] 2927         CALL     ONEP
      00912B CD 85 03         [ 4] 2928         CALL     DONXT
      00912E 91 00                 2929         .word      PARS4
      009130 CD 86 A1         [ 4] 2930         CALL     DUPP
      009133 CD 86 6A         [ 4] 2931         CALL     TOR
      009136 20 0F            [ 2] 2932         JRA     PARS7
      009138 CD 85 B4         [ 4] 2933 PARS6:  CALL     RFROM
      00913B CD 86 97         [ 4] 2934         CALL     DROP
      00913E CD 86 A1         [ 4] 2935         CALL     DUPP
      009141 CD 8B E2         [ 4] 2936         CALL     ONEP
      009144 CD 86 6A         [ 4] 2937         CALL     TOR
      009147 CD 86 C9         [ 4] 2938 PARS7:  CALL     OVER
      00914A CD 89 3D         [ 4] 2939         CALL     SUBB
      00914D CD 85 B4         [ 4] 2940         CALL     RFROM
      009150 CD 85 B4         [ 4] 2941         CALL     RFROM
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



      009153 CC 89 3D         [ 2] 2942         JP     SUBB
      009156 CD 86 C9         [ 4] 2943 PARS8:  CALL     OVER
      009159 CD 85 B4         [ 4] 2944         CALL     RFROM
      00915C CC 89 3D         [ 2] 2945         JP     SUBB
                                   2946 
                                   2947 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2948 ;       PARSE   ( c -- b u ; <string> )
                                   2949 ;       Scan input stream and return
                                   2950 ;       counted string delimited by c.
                                   2951 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0010DF                       2952         _HEADER PARSE,5,"PARSE"
      00915F 90 98                    1         .word LINK 
                           0010E1     2         LINK=.
      009161 05                       3         .byte 5  
      009162 50 41 52 53 45           4         .ascii "PARSE"
      009167                          5         PARSE:
      009167 CD 86 6A         [ 4] 2953         CALL     TOR
      00916A CD 8D 4D         [ 4] 2954         CALL     TIB
      00916D CD 87 85         [ 4] 2955         CALL     INN
      009170 CD 85 63         [ 4] 2956         CALL     AT
      009173 CD 88 C6         [ 4] 2957         CALL     PLUS    ;current input buffer pointer
      009176 CD 87 95         [ 4] 2958         CALL     NTIB
      009179 CD 85 63         [ 4] 2959         CALL     AT
      00917C CD 87 85         [ 4] 2960         CALL     INN
      00917F CD 85 63         [ 4] 2961         CALL     AT
      009182 CD 89 3D         [ 4] 2962         CALL     SUBB    ;remaining count
      009185 CD 85 B4         [ 4] 2963         CALL     RFROM
      009188 CD 90 9E         [ 4] 2964         CALL     PARS
      00918B CD 87 85         [ 4] 2965         CALL     INN
      00918E CC 8C BE         [ 2] 2966         JP     PSTOR
                                   2967 
                                   2968 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2969 ;       .(      ( -- )
                                   2970 ;       Output following string up to next ) .
                                   2971 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001111                       2972         _HEADER DOTPR,IMEDD+2,".("
      009191 91 61                    1         .word LINK 
                           001113     2         LINK=.
      009193 82                       3         .byte IMEDD+2  
      009194 2E 28                    4         .ascii ".("
      009196                          5         DOTPR:
      009196 CD 84 EF         [ 4] 2973         CALL     DOLIT
      009199 00 29                 2974         .word     41	; ")"
      00919B CD 91 67         [ 4] 2975         CALL     PARSE
      00919E CC 8F AE         [ 2] 2976         JP     TYPES
                                   2977 
                                   2978 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2979 ;       (       ( -- )
                                   2980 ;       Ignore following string up to next ).
                                   2981 ;       A comment.
                                   2982 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001121                       2983         _HEADER PAREN,IMEDD+1,"("
      0091A1 91 93                    1         .word LINK 
                           001123     2         LINK=.
      0091A3 81                       3         .byte IMEDD+1  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



      0091A4 28                       4         .ascii "("
      0091A5                          5         PAREN:
      0091A5 CD 84 EF         [ 4] 2984         CALL     DOLIT
      0091A8 00 29                 2985         .word     41	; ")"
      0091AA CD 91 67         [ 4] 2986         CALL     PARSE
      0091AD CC 88 A6         [ 2] 2987         JP     DDROP
                                   2988 
                                   2989 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2990 ;       \       ( -- )
                                   2991 ;       Ignore following text till
                                   2992 ;       end of line.
                                   2993 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001130                       2994         _HEADER BKSLA,IMEDD+1,"\\"
      0091B0 91 A3                    1         .word LINK 
                           001132     2         LINK=.
      0091B2 81                       3         .byte IMEDD+1  
      0091B3 5C 5C                    4         .ascii "\\"
      0091B5                          5         BKSLA:
      0091B5 90 AE 00 0E      [ 2] 2995         ldw y,#UCTIB ; #TIB  
      0091B9 90 FE            [ 2] 2996         ldw y,(y)
      0091BB 90 89            [ 2] 2997         pushw y ; count in TIB 
      0091BD 90 AE 00 0C      [ 2] 2998         ldw y,#UINN ; >IN 
      0091C1 90 BF 26         [ 2] 2999         ldw YTEMP,y
      0091C4 90 85            [ 2] 3000         popw y 
      0091C6 91 CF 26         [ 5] 3001         ldw [YTEMP],y
      0091C9 81               [ 4] 3002         ret 
                                   3003 
                                   3004 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3005 ;       WORD    ( c -- a ; <string> )
                                   3006 ;       Parse a word from input stream
                                   3007 ;       and copy it to code dictionary.
                                   3008 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00114A                       3009         _HEADER WORDD,4,"WORD"
      0091CA 91 B2                    1         .word LINK 
                           00114C     2         LINK=.
      0091CC 04                       3         .byte 4  
      0091CD 57 4F 52 44              4         .ascii "WORD"
      0091D1                          5         WORDD:
      0091D1 CD 91 67         [ 4] 3010         CALL     PARSE
      0091D4 CD 8D 2B         [ 4] 3011         CALL     HERE
      0091D7 CD 8B B7         [ 4] 3012         CALL     CELLP
                           000000  3013 .IF CASE_SENSE 
                                   3014         JP      PACKS 
                           000001  3015 .ELSE                 
      0091DA CD 8D EB         [ 4] 3016         CALL     PACKS
                                   3017 ; uppercase TOKEN 
      0091DD CD 86 A1         [ 4] 3018         CALL    DUPP 
      0091E0 CD 8D 14         [ 4] 3019         CALL    COUNT 
      0091E3 CD 86 6A         [ 4] 3020         CALL    TOR 
      0091E6 CD 85 34         [ 4] 3021         CALL    BRAN 
      0091E9 92 17                 3022         .word   UPPER2  
      0091EB                       3023 UPPER:
      0091EB CD 86 A1         [ 4] 3024         CALL    DUPP 
      0091EE CD 85 81         [ 4] 3025         CALL    CAT
      0091F1 CD 86 A1         [ 4] 3026         CALL    DUPP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



      0091F4 CD 84 EF         [ 4] 3027         CALL   DOLIT
      0091F7 00 61                 3028         .word   'a' 
      0091F9 CD 84 EF         [ 4] 3029         CALL    DOLIT
      0091FC 00 7B                 3030         .word   'z'+1 
      0091FE CD 8A 3D         [ 4] 3031         CALL   WITHI 
      009201 CD 85 18         [ 4] 3032         CALL   QBRAN
      009204 92 0E                 3033         .word  UPPER1  
      009206 CD 84 EF         [ 4] 3034         CALL    DOLIT 
      009209 00 DF                 3035         .word   0xDF 
      00920B CD 86 FE         [ 4] 3036         CALL    ANDD 
      00920E                       3037 UPPER1:
      00920E CD 86 C9         [ 4] 3038         CALL    OVER 
      009211 CD 85 70         [ 4] 3039         CALL    CSTOR          
      009214 CD 8B E2         [ 4] 3040         CALL    ONEP 
      009217                       3041 UPPER2: 
      009217 CD 85 03         [ 4] 3042         CALL    DONXT
      00921A 91 EB                 3043         .word   UPPER  
      00921C CD 86 97         [ 4] 3044         CALL    DROP  
      00921F 81               [ 4] 3045         RET 
                                   3046 .ENDIF 
                                   3047 
                                   3048 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3049 ;       TOKEN   ( -- a ; <string> )
                                   3050 ;       Parse a word from input stream
                                   3051 ;       and copy it to name dictionary.
                                   3052 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0011A0                       3053         _HEADER TOKEN,5,"TOKEN"
      009220 91 CC                    1         .word LINK 
                           0011A2     2         LINK=.
      009222 05                       3         .byte 5  
      009223 54 4F 4B 45 4E           4         .ascii "TOKEN"
      009228                          5         TOKEN:
      009228 CD 8C 41         [ 4] 3054         CALL     BLANK
      00922B CC 91 D1         [ 2] 3055         JP     WORDD
                                   3056 
                                   3057 ;; Dictionary search
                                   3058 
                                   3059 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3060 ;       NAME>   ( na -- ca )
                                   3061 ;       Return a code address given
                                   3062 ;       a name address.
                                   3063 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0011AE                       3064         _HEADER NAMET,5,"NAME>"
      00922E 92 22                    1         .word LINK 
                           0011B0     2         LINK=.
      009230 05                       3         .byte 5  
      009231 4E 41 4D 45 3E           4         .ascii "NAME>"
      009236                          5         NAMET:
      009236 CD 8D 14         [ 4] 3065         CALL     COUNT
      009239 CD 84 EF         [ 4] 3066         CALL     DOLIT
      00923C 00 1F                 3067         .word      31
      00923E CD 86 FE         [ 4] 3068         CALL     ANDD
      009241 CC 88 C6         [ 2] 3069         JP     PLUS
                                   3070 
                                   3071 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



                                   3072 ;       SAME?   ( a a u -- a a f \ -0+ )
                                   3073 ;       Compare u cells in two
                                   3074 ;       strings. Return 0 if identical.
                                   3075 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0011C4                       3076         _HEADER SAMEQ,5,"SAME?"
      009244 92 30                    1         .word LINK 
                           0011C6     2         LINK=.
      009246 05                       3         .byte 5  
      009247 53 41 4D 45 3F           4         .ascii "SAME?"
      00924C                          5         SAMEQ:
      00924C CD 8B EF         [ 4] 3077         CALL     ONEM
      00924F CD 86 6A         [ 4] 3078         CALL     TOR
      009252 20 29            [ 2] 3079         JRA     SAME2
      009254 CD 86 C9         [ 4] 3080 SAME1:  CALL     OVER
      009257 CD 85 C5         [ 4] 3081         CALL     RAT
      00925A CD 88 C6         [ 4] 3082         CALL     PLUS
      00925D CD 85 81         [ 4] 3083         CALL     CAT
      009260 CD 86 C9         [ 4] 3084         CALL     OVER
      009263 CD 85 C5         [ 4] 3085         CALL     RAT
      009266 CD 88 C6         [ 4] 3086         CALL     PLUS
      009269 CD 85 81         [ 4] 3087         CALL     CAT
      00926C CD 89 3D         [ 4] 3088         CALL     SUBB
      00926F CD 88 54         [ 4] 3089         CALL     QDUP
      009272 CD 85 18         [ 4] 3090         CALL     QBRAN
      009275 92 7D                 3091         .word      SAME2
      009277 CD 85 B4         [ 4] 3092         CALL     RFROM
      00927A CC 86 97         [ 2] 3093         JP     DROP
      00927D CD 85 03         [ 4] 3094 SAME2:  CALL     DONXT
      009280 92 54                 3095         .word      SAME1
      009282 CC 8C 4E         [ 2] 3096         JP     ZERO
                                   3097 
                                   3098 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3099 ;       find    ( a va -- ca na | a F )
                                   3100 ;       Search vocabulary for string.
                                   3101 ;       Return ca and na if succeeded.
                                   3102 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001205                       3103         _HEADER FIND,4,"FIND"
      009285 92 46                    1         .word LINK 
                           001207     2         LINK=.
      009287 04                       3         .byte 4  
      009288 46 49 4E 44              4         .ascii "FIND"
      00928C                          5         FIND:
      00928C CD 86 B1         [ 4] 3104         CALL     SWAPP
      00928F CD 86 A1         [ 4] 3105         CALL     DUPP
      009292 CD 85 81         [ 4] 3106         CALL     CAT
      009295 CD 87 76         [ 4] 3107         CALL     TEMP
      009298 CD 85 51         [ 4] 3108         CALL     STORE
      00929B CD 86 A1         [ 4] 3109         CALL     DUPP
      00929E CD 85 63         [ 4] 3110         CALL     AT
      0092A1 CD 86 6A         [ 4] 3111         CALL     TOR
      0092A4 CD 8B B7         [ 4] 3112         CALL     CELLP
      0092A7 CD 86 B1         [ 4] 3113         CALL     SWAPP
      0092AA CD 85 63         [ 4] 3114 FIND1:  CALL     AT
      0092AD CD 86 A1         [ 4] 3115         CALL     DUPP
      0092B0 CD 85 18         [ 4] 3116         CALL     QBRAN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



      0092B3 92 E9                 3117         .word      FIND6
      0092B5 CD 86 A1         [ 4] 3118         CALL     DUPP
      0092B8 CD 85 63         [ 4] 3119         CALL     AT
      0092BB CD 84 EF         [ 4] 3120         CALL     DOLIT
      0092BE 1F 7F                 3121         .word      MASKK
      0092C0 CD 86 FE         [ 4] 3122         CALL     ANDD
      0092C3 CD 85 C5         [ 4] 3123         CALL     RAT
      0092C6 CD 87 27         [ 4] 3124         CALL     XORR
      0092C9 CD 85 18         [ 4] 3125         CALL     QBRAN
      0092CC 92 D8                 3126         .word      FIND2
      0092CE CD 8B B7         [ 4] 3127         CALL     CELLP
      0092D1 CD 84 EF         [ 4] 3128         CALL     DOLIT
      0092D4 FF FF                 3129         .word     0xFFFF
      0092D6 20 0C            [ 2] 3130         JRA     FIND3
      0092D8 CD 8B B7         [ 4] 3131 FIND2:  CALL     CELLP
      0092DB CD 87 76         [ 4] 3132         CALL     TEMP
      0092DE CD 85 63         [ 4] 3133         CALL     AT
      0092E1 CD 92 4C         [ 4] 3134         CALL     SAMEQ
      0092E4 CD 85 34         [ 4] 3135 FIND3:  CALL     BRAN
      0092E7 92 F8                 3136         .word      FIND4
      0092E9 CD 85 B4         [ 4] 3137 FIND6:  CALL     RFROM
      0092EC CD 86 97         [ 4] 3138         CALL     DROP
      0092EF CD 86 B1         [ 4] 3139         CALL     SWAPP
      0092F2 CD 8B C6         [ 4] 3140         CALL     CELLM
      0092F5 CC 86 B1         [ 2] 3141         JP     SWAPP
      0092F8 CD 85 18         [ 4] 3142 FIND4:  CALL     QBRAN
      0092FB 93 05                 3143         .word      FIND5
      0092FD CD 8B C6         [ 4] 3144         CALL     CELLM
      009300 CD 8B C6         [ 4] 3145         CALL     CELLM
      009303 20 A5            [ 2] 3146         JRA     FIND1
      009305 CD 85 B4         [ 4] 3147 FIND5:  CALL     RFROM
      009308 CD 86 97         [ 4] 3148         CALL     DROP
      00930B CD 86 B1         [ 4] 3149         CALL     SWAPP
      00930E CD 86 97         [ 4] 3150         CALL     DROP
      009311 CD 8B C6         [ 4] 3151         CALL     CELLM
      009314 CD 86 A1         [ 4] 3152         CALL     DUPP
      009317 CD 92 36         [ 4] 3153         CALL     NAMET
      00931A CC 86 B1         [ 2] 3154         JP     SWAPP
                                   3155 
                                   3156 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3157 ;       NAME?   ( a -- ca na | a F )
                                   3158 ;       Search vocabularies for a string.
                                   3159 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00129D                       3160         _HEADER NAMEQ,5,"NAME?"
      00931D 92 87                    1         .word LINK 
                           00129F     2         LINK=.
      00931F 05                       3         .byte 5  
      009320 4E 41 4D 45 3F           4         .ascii "NAME?"
      009325                          5         NAMEQ:
      009325 CD 87 EA         [ 4] 3161         CALL   CNTXT
      009328 CC 92 8C         [ 2] 3162         JP     FIND
                                   3163 
                                   3164 ;; Terminal response
                                   3165 
                                   3166 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



                                   3167 ;       ^H      ( bot eot cur -- bot eot cur )
                                   3168 ;       Backup cursor by one character.
                                   3169 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0012AB                       3170         _HEADER BKSP,2,"^H"
      00932B 93 1F                    1         .word LINK 
                           0012AD     2         LINK=.
      00932D 02                       3         .byte 2  
      00932E 5E 48                    4         .ascii "^H"
      009330                          5         BKSP:
      009330 CD 86 6A         [ 4] 3171         CALL     TOR
      009333 CD 86 C9         [ 4] 3172         CALL     OVER
      009336 CD 85 B4         [ 4] 3173         CALL     RFROM
      009339 CD 86 B1         [ 4] 3174         CALL     SWAPP
      00933C CD 86 C9         [ 4] 3175         CALL     OVER
      00933F CD 87 27         [ 4] 3176         CALL     XORR
      009342 CD 85 18         [ 4] 3177         CALL     QBRAN
      009345 93 60                 3178         .word      BACK1
      009347 CD 84 EF         [ 4] 3179         CALL     DOLIT
      00934A 00 08                 3180         .word      BKSPP
      00934C CD 84 B6         [ 4] 3181         CALL     EMIT
      00934F CD 8B EF         [ 4] 3182         CALL     ONEM
      009352 CD 8C 41         [ 4] 3183         CALL     BLANK
      009355 CD 84 B6         [ 4] 3184         CALL     EMIT
      009358 CD 84 EF         [ 4] 3185         CALL     DOLIT
      00935B 00 08                 3186         .word      BKSPP
      00935D CC 84 B6         [ 2] 3187         JP     EMIT
      009360 81               [ 4] 3188 BACK1:  RET
                                   3189 
                                   3190 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3191 ;       TAP    ( bot eot cur c -- bot eot cur )
                                   3192 ;       Accept and echo key stroke
                                   3193 ;       and bump cursor.
                                   3194 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0012E1                       3195         _HEADER TAP,3,"TAP"
      009361 93 2D                    1         .word LINK 
                           0012E3     2         LINK=.
      009363 03                       3         .byte 3  
      009364 54 41 50                 4         .ascii "TAP"
      009367                          5         TAP:
      009367 CD 86 A1         [ 4] 3196         CALL     DUPP
      00936A CD 84 B6         [ 4] 3197         CALL     EMIT
      00936D CD 86 C9         [ 4] 3198         CALL     OVER
      009370 CD 85 70         [ 4] 3199         CALL     CSTOR
      009373 CC 8B E2         [ 2] 3200         JP     ONEP
                                   3201 
                                   3202 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3203 ;       kTAP    ( bot eot cur c -- bot eot cur )
                                   3204 ;       Process a key stroke,
                                   3205 ;       CR,LF or backspace.
                                   3206 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0012F6                       3207         _HEADER KTAP,4,"KTAP"
      009376 93 63                    1         .word LINK 
                           0012F8     2         LINK=.
      009378 04                       3         .byte 4  
      009379 4B 54 41 50              4         .ascii "KTAP"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



      00937D                          5         KTAP:
      00937D CD 86 A1         [ 4] 3208         CALL     DUPP
      009380 CD 84 EF         [ 4] 3209         CALL     DOLIT
                           000001  3210 .if EOL_CR
      009383 00 0D                 3211         .word   CRR
                           000000  3212 .else ; EOL_LF 
                                   3213         .word   LF
                                   3214 .endif 
      009385 CD 87 27         [ 4] 3215         CALL     XORR
      009388 CD 85 18         [ 4] 3216         CALL     QBRAN
      00938B 93 A3                 3217         .word      KTAP2
      00938D CD 84 EF         [ 4] 3218         CALL     DOLIT
      009390 00 08                 3219         .word      BKSPP
      009392 CD 87 27         [ 4] 3220         CALL     XORR
      009395 CD 85 18         [ 4] 3221         CALL     QBRAN
      009398 93 A0                 3222         .word      KTAP1
      00939A CD 8C 41         [ 4] 3223         CALL     BLANK
      00939D CC 93 67         [ 2] 3224         JP     TAP
      0093A0 CC 93 30         [ 2] 3225 KTAP1:  JP     BKSP
      0093A3 CD 86 97         [ 4] 3226 KTAP2:  CALL     DROP
      0093A6 CD 86 B1         [ 4] 3227         CALL     SWAPP
      0093A9 CD 86 97         [ 4] 3228         CALL     DROP
      0093AC CC 86 A1         [ 2] 3229         JP     DUPP
                                   3230 
                                   3231 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3232 ;       accept  ( b u -- b u )
                                   3233 ;       Accept characters to input
                                   3234 ;       buffer. Return with actual count.
                                   3235 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00132F                       3236         _HEADER ACCEP,6,"ACCEPT"
      0093AF 93 78                    1         .word LINK 
                           001331     2         LINK=.
      0093B1 06                       3         .byte 6  
      0093B2 41 43 43 45 50 54        4         .ascii "ACCEPT"
      0093B8                          5         ACCEP:
      0093B8 CD 86 C9         [ 4] 3237         CALL     OVER
      0093BB CD 88 C6         [ 4] 3238         CALL     PLUS
      0093BE CD 86 C9         [ 4] 3239         CALL     OVER
      0093C1 CD 88 B1         [ 4] 3240 ACCP1:  CALL     DDUP
      0093C4 CD 87 27         [ 4] 3241         CALL     XORR
      0093C7 CD 85 18         [ 4] 3242         CALL     QBRAN
      0093CA 93 EC                 3243         .word      ACCP4
      0093CC CD 8F 4C         [ 4] 3244         CALL     KEY
      0093CF CD 86 A1         [ 4] 3245         CALL     DUPP
      0093D2 CD 8C 41         [ 4] 3246         CALL     BLANK
      0093D5 CD 84 EF         [ 4] 3247         CALL     DOLIT
      0093D8 00 7F                 3248         .word      127
      0093DA CD 8A 3D         [ 4] 3249         CALL     WITHI
      0093DD CD 85 18         [ 4] 3250         CALL     QBRAN
      0093E0 93 E7                 3251         .word      ACCP2
      0093E2 CD 93 67         [ 4] 3252         CALL     TAP
      0093E5 20 03            [ 2] 3253         JRA     ACCP3
      0093E7 CD 93 7D         [ 4] 3254 ACCP2:  CALL     KTAP
      0093EA 20 D5            [ 2] 3255 ACCP3:  JRA     ACCP1
      0093EC CD 86 97         [ 4] 3256 ACCP4:  CALL     DROP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



      0093EF CD 86 C9         [ 4] 3257         CALL     OVER
      0093F2 CC 89 3D         [ 2] 3258         JP     SUBB
                                   3259 
                                   3260 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3261 ;       QUERY   ( -- )
                                   3262 ;       Accept input stream to
                                   3263 ;       terminal input buffer.
                                   3264 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001375                       3265         _HEADER QUERY,5,"QUERY"
      0093F5 93 B1                    1         .word LINK 
                           001377     2         LINK=.
      0093F7 05                       3         .byte 5  
      0093F8 51 55 45 52 59           4         .ascii "QUERY"
      0093FD                          5         QUERY:
      0093FD CD 8D 4D         [ 4] 3266         CALL     TIB
      009400 CD 84 EF         [ 4] 3267         CALL     DOLIT
      009403 00 50                 3268         .word      80
      009405 CD 93 B8         [ 4] 3269         CALL     ACCEP
      009408 CD 87 95         [ 4] 3270         CALL     NTIB
      00940B CD 85 51         [ 4] 3271         CALL     STORE
      00940E CD 86 97         [ 4] 3272         CALL     DROP
      009411 CD 8C 4E         [ 4] 3273         CALL     ZERO
      009414 CD 87 85         [ 4] 3274         CALL     INN
      009417 CC 85 51         [ 2] 3275         JP     STORE
                                   3276 
                                   3277 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3278 ;       ABORT   ( -- )
                                   3279 ;       Reset data stack and
                                   3280 ;       jump to QUIT.
                                   3281 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00139A                       3282         _HEADER ABORT,5,"ABORT"
      00941A 93 F7                    1         .word LINK 
                           00139C     2         LINK=.
      00941C 05                       3         .byte 5  
      00941D 41 42 4F 52 54           4         .ascii "ABORT"
      009422                          5         ABORT:
      009422 CD 95 19         [ 4] 3283         CALL     PRESE
      009425 CC 95 36         [ 2] 3284         JP     QUIT
                                   3285 
                                   3286 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3287 ;       abort"  ( f -- )
                                   3288 ;       Run time routine of ABORT".
                                   3289 ;       Abort with a message.
                                   3290 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0013A8                       3291         _HEADER ABORQ,COMPO+6,'ABORT"'
      009428 94 1C                    1         .word LINK 
                           0013AA     2         LINK=.
      00942A 46                       3         .byte COMPO+6  
      00942B 41 42 4F 52 54 22        4         .ascii 'ABORT"'
      009431                          5         ABORQ:
      009431 CD 85 18         [ 4] 3292         CALL     QBRAN
      009434 94 50                 3293         .word      ABOR2   ;text flag
      009436 CD 8F D6         [ 4] 3294         CALL     DOSTR
      009439 CD 8F 84         [ 4] 3295 ABOR1:  CALL     SPACE
      00943C CD 8D 14         [ 4] 3296         CALL     COUNT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



      00943F CD 8F AE         [ 4] 3297         CALL     TYPES
      009442 CD 84 EF         [ 4] 3298         CALL     DOLIT
      009445 00 3F                 3299         .word     63 ; "?"
      009447 CD 84 B6         [ 4] 3300         CALL     EMIT
      00944A CD 8F C6         [ 4] 3301         CALL     CR
      00944D CC 94 22         [ 2] 3302         JP     ABORT   ;pass error string
      009450 CD 8F D6         [ 4] 3303 ABOR2:  CALL     DOSTR
      009453 CC 86 97         [ 2] 3304         JP     DROP
                                   3305 
                                   3306 ;; The text interpreter
                                   3307 
                                   3308 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3309 ;       $INTERPRET      ( a -- )
                                   3310 ;       Interpret a word. If failed,
                                   3311 ;       try to convert it to an integer.
                                   3312 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0013D6                       3313         _HEADER INTER,10,"$INTERPRET"
      009456 94 2A                    1         .word LINK 
                           0013D8     2         LINK=.
      009458 0A                       3         .byte 10  
      009459 24 49 4E 54 45 52 50     4         .ascii "$INTERPRET"
             52 45 54
      009463                          5         INTER:
      009463 CD 93 25         [ 4] 3314         CALL     NAMEQ
      009466 CD 88 54         [ 4] 3315         CALL     QDUP    ;?defined
      009469 CD 85 18         [ 4] 3316         CALL     QBRAN
      00946C 94 8D                 3317         .word      INTE1
      00946E CD 85 63         [ 4] 3318         CALL     AT
      009471 CD 84 EF         [ 4] 3319         CALL     DOLIT
      009474 40 00                 3320 	.word       0x4000	; COMPO*256
      009476 CD 86 FE         [ 4] 3321         CALL     ANDD    ;?compile only lexicon bits
      009479 CD 94 31         [ 4] 3322         CALL     ABORQ
      00947C 0D                    3323         .byte      13
      00947D 20 63 6F 6D 70 69 6C  3324         .ascii     " compile only"
             65 20 6F 6E 6C 79
      00948A CC 85 44         [ 2] 3325         JP     EXECU
      00948D CD A5 2D         [ 4] 3326 INTE1:  CALL     NUMBQ   ;convert a number
      009490 CD 85 18         [ 4] 3327         CALL     QBRAN
      009493 94 39                 3328         .word    ABOR1
      009495 81               [ 4] 3329         RET
                                   3330 
                                   3331 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3332 ;       [       ( -- )
                                   3333 ;       Start  text interpreter.
                                   3334 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001416                       3335         _HEADER LBRAC,IMEDD+1,"["
      009496 94 58                    1         .word LINK 
                           001418     2         LINK=.
      009498 81                       3         .byte IMEDD+1  
      009499 5B                       4         .ascii "["
      00949A                          5         LBRAC:
      00949A CD 84 EF         [ 4] 3336         CALL   DOLIT
      00949D 94 63                 3337         .word  INTER
      00949F CD 87 C8         [ 4] 3338         CALL   TEVAL
      0094A2 CC 85 51         [ 2] 3339         JP     STORE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



                                   3340 
                                   3341 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3342 ;       .OK     ( -- )
                                   3343 ;       Display 'ok' while interpreting.
                                   3344 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001425                       3345         _HEADER DOTOK,3,".OK"
      0094A5 94 98                    1         .word LINK 
                           001427     2         LINK=.
      0094A7 03                       3         .byte 3  
      0094A8 2E 4F 4B                 4         .ascii ".OK"
      0094AB                          5         DOTOK:
      0094AB CD 84 EF         [ 4] 3346         CALL     DOLIT
      0094AE 94 63                 3347         .word      INTER
      0094B0 CD 87 C8         [ 4] 3348         CALL     TEVAL
      0094B3 CD 85 63         [ 4] 3349         CALL     AT
      0094B6 CD 89 65         [ 4] 3350         CALL     EQUAL
      0094B9 CD 85 18         [ 4] 3351         CALL     QBRAN
      0094BC 94 C5                 3352         .word      DOTO1
      0094BE CD 8F F3         [ 4] 3353         CALL     DOTQP
      0094C1 03                    3354         .byte      3
      0094C2 20 6F 6B              3355         .ascii     " ok"
      0094C5 CC 8F C6         [ 2] 3356 DOTO1:  JP     CR
                                   3357 
                                   3358 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3359 ;       ?STACK  ( -- )
                                   3360 ;       Abort if stack underflows.
                                   3361 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001448                       3362         _HEADER QSTAC,6,"?STACK"
      0094C8 94 A7                    1         .word LINK 
                           00144A     2         LINK=.
      0094CA 06                       3         .byte 6  
      0094CB 3F 53 54 41 43 4B        4         .ascii "?STACK"
      0094D1                          5         QSTAC:
      0094D1 CD 8C 90         [ 4] 3363         CALL     DEPTH
      0094D4 CD 86 D8         [ 4] 3364         CALL     ZLESS   ;check only for underflow
      0094D7 CD 94 31         [ 4] 3365         CALL     ABORQ
      0094DA 0B                    3366         .byte      11
      0094DB 20 75 6E 64 65 72 66  3367         .ascii     " underflow "
             6C 6F 77 20
      0094E6 81               [ 4] 3368         RET
                                   3369 
                                   3370 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3371 ;       EVAL    ( -- )
                                   3372 ;       Interpret  input stream.
                                   3373 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001467                       3374         _HEADER EVAL,4,"EVAL"
      0094E7 94 CA                    1         .word LINK 
                           001469     2         LINK=.
      0094E9 04                       3         .byte 4  
      0094EA 45 56 41 4C              4         .ascii "EVAL"
      0094EE                          5         EVAL:
      0094EE CD 92 28         [ 4] 3375 EVAL1:  CALL     TOKEN
      0094F1 CD 86 A1         [ 4] 3376         CALL     DUPP
      0094F4 CD 85 81         [ 4] 3377         CALL     CAT     ;?input stream empty
      0094F7 CD 85 18         [ 4] 3378         CALL     QBRAN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



      0094FA 95 0A                 3379         .word    EVAL2
      0094FC CD 87 C8         [ 4] 3380         CALL     TEVAL
      0094FF CD 8D 61         [ 4] 3381         CALL     ATEXE
      009502 CD 94 D1         [ 4] 3382         CALL     QSTAC   ;evaluate input, check stack
      009505 CD 85 34         [ 4] 3383         CALL     BRAN
      009508 94 EE                 3384         .word    EVAL1
      00950A CD 86 97         [ 4] 3385 EVAL2:  CALL     DROP
      00950D CC 94 AB         [ 2] 3386         JP       DOTOK
                                   3387 
                                   3388 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3389 ;       PRESET  ( -- )
                                   3390 ;       Reset data stack pointer and
                                   3391 ;       terminal input buffer.
                                   3392 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001490                       3393         _HEADER PRESE,6,"PRESET"
      009510 94 E9                    1         .word LINK 
                           001492     2         LINK=.
      009512 06                       3         .byte 6  
      009513 50 52 45 53 45 54        4         .ascii "PRESET"
      009519                          5         PRESE:
      009519 CD 84 EF         [ 4] 3394         CALL     DOLIT
      00951C 16 80                 3395         .word      SPP
      00951E CD 86 8E         [ 4] 3396         CALL     SPSTO
      009521 CD 84 EF         [ 4] 3397         CALL     DOLIT
      009524 17 00                 3398         .word      TIBB
      009526 CD 87 95         [ 4] 3399         CALL     NTIB
      009529 CD 8B B7         [ 4] 3400         CALL     CELLP
      00952C CC 85 51         [ 2] 3401         JP     STORE
                                   3402 
                                   3403 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3404 ;       QUIT    ( -- )
                                   3405 ;       Reset return stack pointer
                                   3406 ;       and start text interpreter.
                                   3407 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0014AF                       3408         _HEADER QUIT,4,"QUIT"
      00952F 95 12                    1         .word LINK 
                           0014B1     2         LINK=.
      009531 04                       3         .byte 4  
      009532 51 55 49 54              4         .ascii "QUIT"
      009536                          5         QUIT:
      009536 CD 84 EF         [ 4] 3409         CALL     DOLIT
      009539 17 FF                 3410         .word      RPP
      00953B CD 85 9E         [ 4] 3411         CALL     RPSTO   ;reset return stack pointer
      00953E CD 94 9A         [ 4] 3412 QUIT1:  CALL     LBRAC   ;start interpretation
      009541 CD 93 FD         [ 4] 3413 QUIT2:  CALL     QUERY   ;get input
      009544 CD 94 EE         [ 4] 3414         CALL     EVAL
      009547 20 F8            [ 2] 3415         JRA     QUIT2   ;continue till error
                                   3416 
                                   3417 ;; The compiler
                                   3418 
                                   3419 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3420 ;       '       ( -- ca )
                                   3421 ;       Search vocabularies for
                                   3422 ;       next word in input stream.
                                   3423 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



      0014C9                       3424         _HEADER TICK,1,"'"
      009549 95 31                    1         .word LINK 
                           0014CB     2         LINK=.
      00954B 01                       3         .byte 1  
      00954C 27                       4         .ascii "'"
      00954D                          5         TICK:
      00954D CD 92 28         [ 4] 3425         CALL     TOKEN
      009550 CD 93 25         [ 4] 3426         CALL     NAMEQ   ;?defined
      009553 CD 85 18         [ 4] 3427         CALL     QBRAN
      009556 94 39                 3428         .word      ABOR1
      009558 81               [ 4] 3429         RET     ;yes, push code address
                                   3430 
                                   3431 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3432 ;       ALLOT   ( n -- )
                                   3433 ;       Allocate n bytes to RAM 
                                   3434 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0014D9                       3435         _HEADER ALLOT,5,"ALLOT"
      009559 95 4B                    1         .word LINK 
                           0014DB     2         LINK=.
      00955B 05                       3         .byte 5  
      00955C 41 4C 4C 4F 54           4         .ascii "ALLOT"
      009561                          5         ALLOT:
      009561 CD 87 F8         [ 4] 3436         CALL     VPP
                                   3437 ; must update APP_VP each time VP is modidied
      009564 CD 8C BE         [ 4] 3438         call PSTOR 
      009567 CC 9C AA         [ 2] 3439         jp UPDATVP 
                                   3440 
                                   3441 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3442 ;       ,       ( w -- )
                                   3443 ;         Compile an integer into
                                   3444 ;         variable space.
                                   3445 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0014EA                       3446         _HEADER COMMA,1,^/"\,"/
      00956A 95 5B                    1         .word LINK 
                           0014EC     2         LINK=.
      00956C 01                       3         .byte 1  
      00956D 5C 2C                    4         .ascii "\,"
      00956F                          5         COMMA:
      00956F CD 8D 2B         [ 4] 3447         CALL     HERE
      009572 CD 86 A1         [ 4] 3448         CALL     DUPP
      009575 CD 8B B7         [ 4] 3449         CALL     CELLP   ;cell boundary
      009578 CD 87 F8         [ 4] 3450         CALL     VPP
      00957B CD 85 51         [ 4] 3451         CALL     STORE
      00957E CC 85 51         [ 2] 3452         JP     STORE
                                   3453 
                                   3454 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3455 ;       C,      ( c -- )
                                   3456 ;       Compile a byte into
                                   3457 ;       variables space.
                                   3458 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001501                       3459         _HEADER CCOMMA,2,^/"C,"/
      009581 95 6C                    1         .word LINK 
                           001503     2         LINK=.
      009583 02                       3         .byte 2  
      009584 43 2C                    4         .ascii "C,"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



      009586                          5         CCOMMA:
      009586 CD 8D 2B         [ 4] 3460         CALL     HERE
      009589 CD 86 A1         [ 4] 3461         CALL     DUPP
      00958C CD 8B E2         [ 4] 3462         CALL     ONEP
      00958F CD 87 F8         [ 4] 3463         CALL     VPP
      009592 CD 85 51         [ 4] 3464         CALL     STORE
      009595 CC 85 70         [ 2] 3465         JP     CSTOR
                                   3466 
                                   3467 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3468 ;       [COMPILE]       ( -- ; <string> )
                                   3469 ;       Compile next immediate
                                   3470 ;       word into code dictionary.
                                   3471 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001518                       3472         _HEADER BCOMP,IMEDD+9,"[COMPILE]"
      009598 95 83                    1         .word LINK 
                           00151A     2         LINK=.
      00959A 89                       3         .byte IMEDD+9  
      00959B 5B 43 4F 4D 50 49 4C     4         .ascii "[COMPILE]"
             45 5D
      0095A4                          5         BCOMP:
      0095A4 CD 95 4D         [ 4] 3473         CALL     TICK
      0095A7 CC 98 79         [ 2] 3474         JP     JSRC
                                   3475 
                                   3476 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3477 ;       COMPILE ( -- )
                                   3478 ;       Compile next jsr in
                                   3479 ;       colon list to code dictionary.
                                   3480 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00152A                       3481         _HEADER COMPI,COMPO+7,"COMPILE"
      0095AA 95 9A                    1         .word LINK 
                           00152C     2         LINK=.
      0095AC 47                       3         .byte COMPO+7  
      0095AD 43 4F 4D 50 49 4C 45     4         .ascii "COMPILE"
      0095B4                          5         COMPI:
      0095B4 CD 85 B4         [ 4] 3482         CALL     RFROM
      0095B7 CD 86 A1         [ 4] 3483         CALL     DUPP
      0095BA CD 85 63         [ 4] 3484         CALL     AT
      0095BD CD 98 79         [ 4] 3485         CALL     JSRC    ;compile subroutine
      0095C0 CD 8B B7         [ 4] 3486         CALL     CELLP
      0095C3 90 93            [ 1] 3487         ldw y,x 
      0095C5 90 FE            [ 2] 3488         ldw y,(y)
      0095C7 1C 00 02         [ 2] 3489         addw x,#CELLL 
      0095CA 90 FC            [ 2] 3490         jp (y)
                                   3491 
                                   3492 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3493 ;       LITERAL ( w -- )
                                   3494 ;       Compile tos to dictionary
                                   3495 ;       as an integer literal.
                                   3496 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00154C                       3497         _HEADER LITER,COMPO+IMEDD+7,"LITERAL"
      0095CC 95 AC                    1         .word LINK 
                           00154E     2         LINK=.
      0095CE C7                       3         .byte COMPO+IMEDD+7  
      0095CF 4C 49 54 45 52 41 4C     4         .ascii "LITERAL"
      0095D6                          5         LITER:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



      0095D6 CD 95 B4         [ 4] 3498         CALL     COMPI
      0095D9 84 EF                 3499         .word DOLIT 
      0095DB CC 95 6F         [ 2] 3500         JP     COMMA
                                   3501 
                                   3502 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3503 ;       $,"     ( -- )
                                   3504 ;       Compile a literal string
                                   3505 ;       up to next " .
                                   3506 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3507 ;        _HEADER STRCQ,3,^/'$,"'/
      0095DE                       3508 STRCQ:
      0095DE CD 84 EF         [ 4] 3509         CALL     DOLIT
      0095E1 00 22                 3510         .word     34	; "
      0095E3 CD 91 67         [ 4] 3511         CALL     PARSE
      0095E6 CD 8D 2B         [ 4] 3512         CALL     HERE
      0095E9 CD 8D EB         [ 4] 3513         CALL     PACKS   ;string to code dictionary
      0095EC CD 8D 14         [ 4] 3514         CALL     COUNT
      0095EF CD 88 C6         [ 4] 3515         CALL     PLUS    ;calculate aligned end of string
      0095F2 CD 87 F8         [ 4] 3516         CALL     VPP
      0095F5 CC 85 51         [ 2] 3517         JP     STORE
                                   3518 
                                   3519 ;; Structures
                                   3520 
                                   3521 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3522 ;       FOR     ( -- a )
                                   3523 ;       Start a FOR-NEXT loop
                                   3524 ;       structure in a colon definition.
                                   3525 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001578                       3526         _HEADER FOR,IMEDD+3,"FOR"
      0095F8 95 CE                    1         .word LINK 
                           00157A     2         LINK=.
      0095FA 83                       3         .byte IMEDD+3  
      0095FB 46 4F 52                 4         .ascii "FOR"
      0095FE                          5         FOR:
      0095FE CD 95 B4         [ 4] 3527         CALL     COMPI
      009601 86 6A                 3528         .word TOR 
      009603 CC 8D 2B         [ 2] 3529         JP     HERE
                                   3530 
                                   3531 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3532 ;       NEXT    ( a -- )
                                   3533 ;       Terminate a FOR-NEXT loop.
                                   3534 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001586                       3535         _HEADER NEXT,IMEDD+4,"NEXT"
      009606 95 FA                    1         .word LINK 
                           001588     2         LINK=.
      009608 84                       3         .byte IMEDD+4  
      009609 4E 45 58 54              4         .ascii "NEXT"
      00960D                          5         NEXT:
      00960D CD 95 B4         [ 4] 3536         CALL     COMPI
      009610 85 03                 3537         .word DONXT 
      009612 CD 88 44         [ 4] 3538         call ADRADJ
      009615 CC 95 6F         [ 2] 3539         JP     COMMA
                                   3540 
                                   3541 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3542 ;       I ( -- n )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



                                   3543 ;       stack COUNTER
                                   3544 ;       of innermost FOR-NEXT  
                                   3545 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001598                       3546         _HEADER IFETCH,1,"I"
      009618 96 08                    1         .word LINK 
                           00159A     2         LINK=.
      00961A 01                       3         .byte 1  
      00961B 49                       4         .ascii "I"
      00961C                          5         IFETCH:
      00961C 1D 00 02         [ 2] 3547         subw x,#CELLL 
      00961F 16 03            [ 2] 3548         ldw y,(3,sp)
      009621 FF               [ 2] 3549         ldw (x),y 
      009622 81               [ 4] 3550         ret 
                                   3551 
                                   3552 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3553 ;       J ( -- n )
                                   3554 ;   stack COUNTER
                                   3555 ;   of outer FOR-NEXT  
                                   3556 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0015A3                       3557         _HEADER JFETCH,1,"J"
      009623 96 1A                    1         .word LINK 
                           0015A5     2         LINK=.
      009625 01                       3         .byte 1  
      009626 4A                       4         .ascii "J"
      009627                          5         JFETCH:
      009627 1D 00 02         [ 2] 3558         SUBW X,#CELLL 
      00962A 16 05            [ 2] 3559         LDW Y,(5,SP)
      00962C FF               [ 2] 3560         LDW (X),Y 
      00962D 81               [ 4] 3561         RET 
                                   3562 
                                   3563 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3564 ;       BEGIN   ( -- a )
                                   3565 ;       Start an infinite or
                                   3566 ;       indefinite loop structure.
                                   3567 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0015AE                       3568         _HEADER BEGIN,IMEDD+5,"BEGIN"
      00962E 96 25                    1         .word LINK 
                           0015B0     2         LINK=.
      009630 85                       3         .byte IMEDD+5  
      009631 42 45 47 49 4E           4         .ascii "BEGIN"
      009636                          5         BEGIN:
      009636 CC 8D 2B         [ 2] 3569         JP     HERE
                                   3570 
                                   3571 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3572 ;       UNTIL   ( a -- )
                                   3573 ;       Terminate a BEGIN-UNTIL
                                   3574 ;       indefinite loop structure.
                                   3575 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0015B9                       3576         _HEADER UNTIL,IMEDD+5,"UNTIL"
      009639 96 30                    1         .word LINK 
                           0015BB     2         LINK=.
      00963B 85                       3         .byte IMEDD+5  
      00963C 55 4E 54 49 4C           4         .ascii "UNTIL"
      009641                          5         UNTIL:
      009641 CD 95 B4         [ 4] 3577         CALL     COMPI
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



      009644 85 18                 3578         .word    QBRAN 
      009646 CD 88 44         [ 4] 3579         call ADRADJ
      009649 CC 95 6F         [ 2] 3580         JP     COMMA
                                   3581 
                                   3582 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3583 ;       AGAIN   ( a -- )
                                   3584 ;       Terminate a BEGIN-AGAIN
                                   3585 ;       infinite loop structure.
                                   3586 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0015CC                       3587         _HEADER AGAIN,IMEDD+5,"AGAIN"
      00964C 96 3B                    1         .word LINK 
                           0015CE     2         LINK=.
      00964E 85                       3         .byte IMEDD+5  
      00964F 41 47 41 49 4E           4         .ascii "AGAIN"
      009654                          5         AGAIN:
      009654 CD 95 B4         [ 4] 3588         CALL     COMPI
      009657 85 34                 3589         .word BRAN
      009659 CD 88 44         [ 4] 3590         call ADRADJ 
      00965C CC 95 6F         [ 2] 3591         JP     COMMA
                                   3592 
                                   3593 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3594 ;       IF      ( -- A )
                                   3595 ;       Begin a conditional branch.
                                   3596 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0015DF                       3597         _HEADER IFF,IMEDD+2,"IF"
      00965F 96 4E                    1         .word LINK 
                           0015E1     2         LINK=.
      009661 82                       3         .byte IMEDD+2  
      009662 49 46                    4         .ascii "IF"
      009664                          5         IFF:
      009664 CD 95 B4         [ 4] 3598         CALL     COMPI
      009667 85 18                 3599         .word QBRAN
      009669 CD 8D 2B         [ 4] 3600         CALL     HERE
      00966C CD 8C 4E         [ 4] 3601         CALL     ZERO
      00966F CC 95 6F         [ 2] 3602         JP     COMMA
                                   3603 
                                   3604 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3605 ;       THEN        ( A -- )
                                   3606 ;       Terminate a conditional 
                                   3607 ;       branch structure.
                                   3608 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0015F2                       3609         _HEADER THENN,IMEDD+4,"THEN"
      009672 96 61                    1         .word LINK 
                           0015F4     2         LINK=.
      009674 84                       3         .byte IMEDD+4  
      009675 54 48 45 4E              4         .ascii "THEN"
      009679                          5         THENN:
      009679 CD 8D 2B         [ 4] 3610         CALL     HERE
      00967C CD 88 44         [ 4] 3611         call ADRADJ 
      00967F CD 86 B1         [ 4] 3612         CALL     SWAPP
      009682 CC 85 51         [ 2] 3613         JP     STORE
                                   3614 
                                   3615 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3616 ;       ELSE        ( A -- A )
                                   3617 ;       Start the false clause in 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



                                   3618 ;       an IF-ELSE-THEN structure.
                                   3619 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001605                       3620         _HEADER ELSEE,IMEDD+4,"ELSE"
      009685 96 74                    1         .word LINK 
                           001607     2         LINK=.
      009687 84                       3         .byte IMEDD+4  
      009688 45 4C 53 45              4         .ascii "ELSE"
      00968C                          5         ELSEE:
      00968C CD 95 B4         [ 4] 3621         CALL     COMPI
      00968F 85 34                 3622         .word BRAN
      009691 CD 8D 2B         [ 4] 3623         CALL     HERE
      009694 CD 8C 4E         [ 4] 3624         CALL     ZERO
      009697 CD 95 6F         [ 4] 3625         CALL     COMMA
      00969A CD 86 B1         [ 4] 3626         CALL     SWAPP
      00969D CD 8D 2B         [ 4] 3627         CALL     HERE
      0096A0 CD 88 44         [ 4] 3628         call ADRADJ 
      0096A3 CD 86 B1         [ 4] 3629         CALL     SWAPP
      0096A6 CC 85 51         [ 2] 3630         JP     STORE
                                   3631 
                                   3632 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3633 ;       AHEAD       ( -- A )
                                   3634 ;       Compile a forward branch
                                   3635 ;       instruction.
                                   3636 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001629                       3637         _HEADER AHEAD,IMEDD+5,"AHEAD"
      0096A9 96 87                    1         .word LINK 
                           00162B     2         LINK=.
      0096AB 85                       3         .byte IMEDD+5  
      0096AC 41 48 45 41 44           4         .ascii "AHEAD"
      0096B1                          5         AHEAD:
      0096B1 CD 95 B4         [ 4] 3638         CALL     COMPI
      0096B4 85 34                 3639         .word BRAN
      0096B6 CD 8D 2B         [ 4] 3640         CALL     HERE
      0096B9 CD 8C 4E         [ 4] 3641         CALL     ZERO
      0096BC CC 95 6F         [ 2] 3642         JP     COMMA
                                   3643 
                                   3644 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3645 ;       WHILE       ( a -- A a )
                                   3646 ;       Conditional branch out of a 
                                   3647 ;       BEGIN-WHILE-REPEAT loop.
                                   3648 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00163F                       3649         _HEADER WHILE,IMEDD+5,"WHILE"
      0096BF 96 AB                    1         .word LINK 
                           001641     2         LINK=.
      0096C1 85                       3         .byte IMEDD+5  
      0096C2 57 48 49 4C 45           4         .ascii "WHILE"
      0096C7                          5         WHILE:
      0096C7 CD 95 B4         [ 4] 3650         CALL     COMPI
      0096CA 85 18                 3651         .word QBRAN
      0096CC CD 8D 2B         [ 4] 3652         CALL     HERE
      0096CF CD 8C 4E         [ 4] 3653         CALL     ZERO
      0096D2 CD 95 6F         [ 4] 3654         CALL     COMMA
      0096D5 CC 86 B1         [ 2] 3655         JP     SWAPP
                                   3656 
                                   3657 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



                                   3658 ;       REPEAT      ( A a -- )
                                   3659 ;       Terminate a BEGIN-WHILE-REPEAT 
                                   3660 ;       indefinite loop.
                                   3661 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001658                       3662         _HEADER REPEA,IMEDD+6,"REPEAT"
      0096D8 96 C1                    1         .word LINK 
                           00165A     2         LINK=.
      0096DA 86                       3         .byte IMEDD+6  
      0096DB 52 45 50 45 41 54        4         .ascii "REPEAT"
      0096E1                          5         REPEA:
      0096E1 CD 95 B4         [ 4] 3663         CALL     COMPI
      0096E4 85 34                 3664         .word BRAN
      0096E6 CD 88 44         [ 4] 3665         call ADRADJ 
      0096E9 CD 95 6F         [ 4] 3666         CALL     COMMA
      0096EC CD 8D 2B         [ 4] 3667         CALL     HERE
      0096EF CD 88 44         [ 4] 3668         call ADRADJ 
      0096F2 CD 86 B1         [ 4] 3669         CALL     SWAPP
      0096F5 CC 85 51         [ 2] 3670         JP     STORE
                                   3671 
                                   3672 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3673 ;       AFT         ( a -- a A )
                                   3674 ;       Jump to THEN in a FOR-AFT-THEN-NEXT 
                                   3675 ;       loop the first time through.
                                   3676 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001678                       3677         _HEADER AFT,IMEDD+3,"AFT"
      0096F8 96 DA                    1         .word LINK 
                           00167A     2         LINK=.
      0096FA 83                       3         .byte IMEDD+3  
      0096FB 41 46 54                 4         .ascii "AFT"
      0096FE                          5         AFT:
      0096FE CD 86 97         [ 4] 3678         CALL     DROP
      009701 CD 96 B1         [ 4] 3679         CALL     AHEAD
      009704 CD 8D 2B         [ 4] 3680         CALL     HERE
      009707 CC 86 B1         [ 2] 3681         JP     SWAPP
                                   3682 
                                   3683 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3684 ;       ABORT"      ( -- ; <string> )
                                   3685 ;       Conditional abort with an error message.
                                   3686 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00168A                       3687         _HEADER ABRTQ,IMEDD+6,'ABORT"'
      00970A 96 FA                    1         .word LINK 
                           00168C     2         LINK=.
      00970C 86                       3         .byte IMEDD+6  
      00970D 41 42 4F 52 54 22        4         .ascii 'ABORT"'
      009713                          5         ABRTQ:
      009713 CD 95 B4         [ 4] 3688         CALL     COMPI
      009716 94 31                 3689         .word ABORQ
      009718 CC 95 DE         [ 2] 3690         JP     STRCQ
                                   3691 
                                   3692 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3693 ;       $"     ( -- ; <string> )
                                   3694 ;       Compile an inline string literal.
                                   3695 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00169B                       3696         _HEADER STRQ,IMEDD+2,'$"'
      00971B 97 0C                    1         .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



                           00169D     2         LINK=.
      00971D 82                       3         .byte IMEDD+2  
      00971E 24 22                    4         .ascii '$"'
      009720                          5         STRQ:
      009720 CD 95 B4         [ 4] 3697         CALL     COMPI
      009723 8F EF                 3698         .word STRQP 
      009725 CC 95 DE         [ 2] 3699         JP     STRCQ
                                   3700 
                                   3701 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3702 ;       ."          ( -- ; <string> )
                                   3703 ;       Compile an inline string literal 
                                   3704 ;       to be typed out at run time.
                                   3705 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0016A8                       3706         _HEADER DOTQ,IMEDD+2,'."'
      009728 97 1D                    1         .word LINK 
                           0016AA     2         LINK=.
      00972A 82                       3         .byte IMEDD+2  
      00972B 2E 22                    4         .ascii '."'
      00972D                          5         DOTQ:
      00972D CD 95 B4         [ 4] 3707         CALL     COMPI
      009730 8F F3                 3708         .word DOTQP 
      009732 CC 95 DE         [ 2] 3709         JP     STRCQ
                                   3710 
                                   3711 ;; Name compiler
                                   3712 
                                   3713 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3714 ;       ?UNIQUE ( a -- a )
                                   3715 ;       Display a warning message
                                   3716 ;       if word already exists.
                                   3717 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0016B5                       3718         _HEADER UNIQU,7,"?UNIQUE"
      009735 97 2A                    1         .word LINK 
                           0016B7     2         LINK=.
      009737 07                       3         .byte 7  
      009738 3F 55 4E 49 51 55 45     4         .ascii "?UNIQUE"
      00973F                          5         UNIQU:
      00973F CD 86 A1         [ 4] 3719         CALL     DUPP
      009742 CD 93 25         [ 4] 3720         CALL     NAMEQ   ;?name exists
      009745 CD 85 18         [ 4] 3721         CALL     QBRAN
      009748 97 5E                 3722         .word      UNIQ1
      00974A CD 8F F3         [ 4] 3723         CALL     DOTQP   ;redef are OK
      00974D 07                    3724         .byte       7
      00974E 20 72 65 44 65 66 20  3725         .ascii     " reDef "       
      009755 CD 86 C9         [ 4] 3726         CALL     OVER
      009758 CD 8D 14         [ 4] 3727         CALL     COUNT
      00975B CD 8F AE         [ 4] 3728         CALL     TYPES   ;just in case
      00975E CC 86 97         [ 2] 3729 UNIQ1:  JP     DROP
                                   3730 
                                   3731 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3732 ;       $,n     ( na -- )
                                   3733 ;       Build a new dictionary name
                                   3734 ;       using string at na.
                                   3735 ; compile dans l'espace des variables 
                                   3736 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3737 ;        _HEADER SNAME,3,^/"$,n"/
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



      009761                       3738 SNAME: 
      009761 CD 86 A1         [ 4] 3739         CALL     DUPP
      009764 CD 85 81         [ 4] 3740         CALL     CAT     ;?null input
      009767 CD 85 18         [ 4] 3741         CALL     QBRAN
      00976A 97 97                 3742         .word      PNAM1
      00976C CD 97 3F         [ 4] 3743         CALL     UNIQU   ;?redefinition
      00976F CD 86 A1         [ 4] 3744         CALL     DUPP
      009772 CD 8D 14         [ 4] 3745         CALL     COUNT
      009775 CD 88 C6         [ 4] 3746         CALL     PLUS
      009778 CD 87 F8         [ 4] 3747         CALL     VPP
      00977B CD 85 51         [ 4] 3748         CALL     STORE
      00977E CD 86 A1         [ 4] 3749         CALL     DUPP
      009781 CD 88 16         [ 4] 3750         CALL     LAST
      009784 CD 85 51         [ 4] 3751         CALL     STORE   ;save na for vocabulary link
      009787 CD 8B C6         [ 4] 3752         CALL     CELLM   ;link address
      00978A CD 87 EA         [ 4] 3753         CALL     CNTXT
      00978D CD 85 63         [ 4] 3754         CALL     AT
      009790 CD 86 B1         [ 4] 3755         CALL     SWAPP
      009793 CD 85 51         [ 4] 3756         CALL     STORE
      009796 81               [ 4] 3757         RET     ;save code pointer
      009797 CD 8F EF         [ 4] 3758 PNAM1:  CALL     STRQP
      00979A 05                    3759         .byte      5
      00979B 20 6E 61 6D 65        3760         .ascii     " name" ;null input
      0097A0 CC 94 39         [ 2] 3761         JP     ABOR1
                                   3762 
                                   3763 ;; FORTH compiler
                                   3764 
                                   3765 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3766 ;       $COMPILE        ( a -- )
                                   3767 ;       Compile next word to
                                   3768 ;       dictionary as a token or literal.
                                   3769 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001723                       3770         _HEADER SCOMP,8,"$COMPILE"
      0097A3 97 37                    1         .word LINK 
                           001725     2         LINK=.
      0097A5 08                       3         .byte 8  
      0097A6 24 43 4F 4D 50 49 4C     4         .ascii "$COMPILE"
             45
      0097AE                          5         SCOMP:
      0097AE CD 93 25         [ 4] 3771         CALL     NAMEQ
      0097B1 CD 88 54         [ 4] 3772         CALL     QDUP    ;?defined
      0097B4 CD 85 18         [ 4] 3773         CALL     QBRAN
      0097B7 97 CF                 3774         .word      SCOM2
      0097B9 CD 85 63         [ 4] 3775         CALL     AT
      0097BC CD 84 EF         [ 4] 3776         CALL     DOLIT
      0097BF 80 00                 3777         .word     0x8000	;  IMEDD*256
      0097C1 CD 86 FE         [ 4] 3778         CALL     ANDD    ;?immediate
      0097C4 CD 85 18         [ 4] 3779         CALL     QBRAN
      0097C7 97 CC                 3780         .word      SCOM1
      0097C9 CC 85 44         [ 2] 3781         JP     EXECU
      0097CC CC 98 79         [ 2] 3782 SCOM1:  JP     JSRC
      0097CF CD A5 2D         [ 4] 3783 SCOM2:  CALL     NUMBQ   ;try to convert to number
      0097D2 CD 88 54         [ 4] 3784         CALL    QDUP  
      0097D5 CD 85 18         [ 4] 3785         CALL     QBRAN
      0097D8 94 39                 3786         .word      ABOR1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



      00175A                       3787         _DOLIT  -1
      0097DA CD 84 EF         [ 4]    1     CALL DOLIT 
      0097DD FF FF                    2     .word -1 
      0097DF CD 89 65         [ 4] 3788         CALL    EQUAL
      001762                       3789         _QBRAN DLITER  
      0097E2 CD 85 18         [ 4]    1     CALL QBRAN
      0097E5 A9 03                    2     .word DLITER
      0097E7 CC 95 D6         [ 2] 3790         JP     LITER
                                   3791 
                                   3792 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3793 ;       OVERT   ( -- )
                                   3794 ;       Link a new word into vocabulary.
                                   3795 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00176A                       3796         _HEADER OVERT,5,"OVERT"
      0097EA 97 A5                    1         .word LINK 
                           00176C     2         LINK=.
      0097EC 05                       3         .byte 5  
      0097ED 4F 56 45 52 54           4         .ascii "OVERT"
      0097F2                          5         OVERT:
      0097F2 CD 88 16         [ 4] 3797         CALL     LAST
      0097F5 CD 85 63         [ 4] 3798         CALL     AT
      0097F8 CD 87 EA         [ 4] 3799         CALL     CNTXT
      0097FB CC 85 51         [ 2] 3800         JP     STORE
                                   3801 
                                   3802 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3803 ;       ;       ( -- )
                                   3804 ;       Terminate a colon definition.
                                   3805 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00177E                       3806         _HEADER SEMIS,IMEDD+COMPO+1,^/";"/
      0097FE 97 EC                    1         .word LINK 
                           001780     2         LINK=.
      009800 C1                       3         .byte IMEDD+COMPO+1  
      009801 3B                       4         .ascii ";"
      009802                          5         SEMIS:
                           000001  3807 .if OPTIMIZE ; more compact and faster
      009802 CD 84 EF         [ 4] 3808         call DOLIT 
      009805 00 81                 3809         .word 0x81   ; opcode for RET 
      009807 CD 95 86         [ 4] 3810         call CCOMMA 
                           000000  3811 .else
                                   3812         CALL     COMPI
                                   3813         .word EXIT 
                                   3814 .endif 
      00980A CD 94 9A         [ 4] 3815         CALL     LBRAC
      00980D CD 97 F2         [ 4] 3816         call OVERT 
      009810 CD A2 02         [ 4] 3817         CALL FMOVE
      009813 CD 88 54         [ 4] 3818         call QDUP 
      009816 CD 85 18         [ 4] 3819         call QBRAN 
      009819 99 49                 3820         .word SET_RAMLAST 
      00981B CD A2 96         [ 4] 3821         CALL UPDATPTR
      00981E 81               [ 4] 3822         RET 
                                   3823 
                                   3824 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3825 ;       Terminate an ISR definition 
                                   3826 ;       retourn ca of ISR as double
                                   3827 ;       I; ( -- ud )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



                                   3828 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00179F                       3829        _HEADER ISEMI,2+IMEDD+COMPO,^/"I;"/
      00981F 98 00                    1         .word LINK 
                           0017A1     2         LINK=.
      009821 C2                       3         .byte 2+IMEDD+COMPO  
      009822 49 3B                    4         .ascii "I;"
      009824                          5         ISEMI:
      009824 1D 00 02         [ 2] 3830         subw x,#CELLL  
      009827 90 AE 00 80      [ 2] 3831         ldw y,#IRET_CODE 
      00982B FF               [ 2] 3832         ldw (x),y 
      00982C CD 95 86         [ 4] 3833         call CCOMMA
      00982F CD 94 9A         [ 4] 3834         call LBRAC 
      009832 CD A2 DB         [ 4] 3835         call IFMOVE
      009835 CD 88 54         [ 4] 3836         call QDUP 
      009838 CD 85 18         [ 4] 3837         CALL QBRAN 
      00983B 99 49                 3838         .word SET_RAMLAST
      00983D CD 88 06         [ 4] 3839         CALL CPP
      009840 CD 85 63         [ 4] 3840         call AT 
      009843 CD 86 B1         [ 4] 3841         call SWAPP 
      009846 CD 88 06         [ 4] 3842         CALL CPP 
      009849 CD 85 51         [ 4] 3843         call STORE 
      00984C CD 9C 93         [ 4] 3844         call UPDATCP 
      00984F CD 9C 50         [ 4] 3845         call EEPVP 
      009852 CD 86 97         [ 4] 3846         call DROP 
      009855 CD 85 63         [ 4] 3847         call AT 
      009858 CD 87 F8         [ 4] 3848         call VPP 
      00985B CD 85 51         [ 4] 3849         call STORE 
      00985E CC 8C 4E         [ 2] 3850         jp ZERO
      009861 81               [ 4] 3851         ret           
                                   3852         
                                   3853 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3854 ;       ]       ( -- )
                                   3855 ;       Start compiling words in
                                   3856 ;       input stream.
                                   3857 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0017E2                       3858         _HEADER RBRAC,1,"]"
      009862 98 21                    1         .word LINK 
                           0017E4     2         LINK=.
      009864 01                       3         .byte 1  
      009865 5D                       4         .ascii "]"
      009866                          5         RBRAC:
      009866 CD 84 EF         [ 4] 3859         CALL   DOLIT
      009869 97 AE                 3860         .word  SCOMP
      00986B CD 87 C8         [ 4] 3861         CALL   TEVAL
      00986E CC 85 51         [ 2] 3862         JP     STORE
                                   3863 
                                   3864 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3865 ;       CALL,    ( ca -- )
                                   3866 ;       Compile a subroutine call.
                                   3867 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0017F1                       3868         _HEADER JSRC,5,^/"CALL,"/
      009871 98 64                    1         .word LINK 
                           0017F3     2         LINK=.
      009873 05                       3         .byte 5  
      009874 43 41 4C 4C 2C           4         .ascii "CALL,"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



      009879                          5         JSRC:
      009879 CD 84 EF         [ 4] 3869         CALL     DOLIT
      00987C 00 CD                 3870         .word     CALLL     ;CALL
      00987E CD 95 86         [ 4] 3871         CALL     CCOMMA
      009881 CC 95 6F         [ 2] 3872         JP     COMMA
                                   3873 
                                   3874 ;       INIT-OFS ( -- )
                                   3875 ;       compute offset to adjust jump address 
                                   3876 ;       set variable OFFSET 
      009884 98 73                 3877         .word LINK 
                           001806  3878         LINK=.
      009886 08                    3879         .byte 8 
      009887 49 4E 49 54 2D 4F 46  3880         .ascii "INIT-OFS" 
             53
      00988F                       3881 INITOFS:
      00988F CD 87 B7         [ 4] 3882         call TFLASH 
      009892 CD 85 63         [ 4] 3883         CALL AT 
      009895 CD 86 A1         [ 4] 3884         CALL DUPP 
      009898 CD 85 18         [ 4] 3885         call QBRAN
      00989B 98 AC                 3886         .word 1$
      00989D CD 86 97         [ 4] 3887         call DROP  
      0098A0 CD 88 06         [ 4] 3888         call CPP 
      0098A3 CD 85 63         [ 4] 3889         call AT 
      0098A6 CD 8D 2B         [ 4] 3890         call HERE
      0098A9 CD 89 3D         [ 4] 3891         call SUBB 
      0098AC CD 88 3B         [ 4] 3892 1$:     call OFFSET 
      0098AF CC 85 51         [ 2] 3893         jp STORE  
                                   3894 
                                   3895 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3896 ;       :       ( -- ; <string> )
                                   3897 ;       Start a new colon definition
                                   3898 ;       using next word as its name.
                                   3899 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001832                       3900         _HEADER COLON,1,":"
      0098B2 98 86                    1         .word LINK 
                           001834     2         LINK=.
      0098B4 01                       3         .byte 1  
      0098B5 3A                       4         .ascii ":"
      0098B6                          5         COLON:
      0098B6 CD 98 8F         [ 4] 3901         call INITOFS       
      0098B9 CD 92 28         [ 4] 3902         CALL   TOKEN
      0098BC CD 97 61         [ 4] 3903         CALL   SNAME
      0098BF CC 98 66         [ 2] 3904         JP     RBRAC
                                   3905 
                                   3906 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3907 ;       I:  ( -- )
                                   3908 ;       Start interrupt service 
                                   3909 ;       routine definition
                                   3910 ;       those definition have 
                                   3911 ;       no name.
                                   3912 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001842                       3913         _HEADER ICOLON,2,"I:"
      0098C2 98 B4                    1         .word LINK 
                           001844     2         LINK=.
      0098C4 02                       3         .byte 2  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



      0098C5 49 3A                    4         .ascii "I:"
      0098C7                          5         ICOLON:
      0098C7 CD 98 8F         [ 4] 3914         call INITOFS 
      0098CA CC 98 66         [ 2] 3915         jp RBRAC  
                                   3916 
                                   3917 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3918 ;       IMMEDIATE       ( -- )
                                   3919 ;       Make last compiled word
                                   3920 ;       an immediate word.
                                   3921 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00184D                       3922         _HEADER IMMED,9,"IMMEDIATE"
      0098CD 98 C4                    1         .word LINK 
                           00184F     2         LINK=.
      0098CF 09                       3         .byte 9  
      0098D0 49 4D 4D 45 44 49 41     4         .ascii "IMMEDIATE"
             54 45
      0098D9                          5         IMMED:
      0098D9 CD 84 EF         [ 4] 3923         CALL     DOLIT
      0098DC 80 00                 3924         .word     0x8000	;  IMEDD*256
      0098DE CD 88 16         [ 4] 3925         CALL     LAST
      0098E1 CD 85 63         [ 4] 3926         CALL     AT
      0098E4 CD 85 63         [ 4] 3927         CALL     AT
      0098E7 CD 87 12         [ 4] 3928         CALL     ORR
      0098EA CD 88 16         [ 4] 3929         CALL     LAST
      0098ED CD 85 63         [ 4] 3930         CALL     AT
      0098F0 CC 85 51         [ 2] 3931         JP     STORE
                                   3932 
                                   3933 ;; Defining words
                                   3934 
                                   3935 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3936 ;       CREATE  ( -- ; <string> )
                                   3937 ;       Compile a new array
                                   3938 ;       without allocating space.
                                   3939 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001873                       3940         _HEADER CREAT,6,"CREATE"
      0098F3 98 CF                    1         .word LINK 
                           001875     2         LINK=.
      0098F5 06                       3         .byte 6  
      0098F6 43 52 45 41 54 45        4         .ascii "CREATE"
      0098FC                          5         CREAT:
      0098FC CD 92 28         [ 4] 3941         CALL     TOKEN
      0098FF CD 97 61         [ 4] 3942         CALL     SNAME
      009902 CD 97 F2         [ 4] 3943         CALL     OVERT        
      009905 CD 95 B4         [ 4] 3944         CALL     COMPI 
      009908 87 57                 3945         .word DOVAR 
      00990A 81               [ 4] 3946         RET
                                   3947 
                                   3948 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3949 ;       VARIABLE  ( -- ; <string> )
                                   3950 ;       Compile a new variable
                                   3951 ;       initialized to 0.
                                   3952 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00188B                       3953         _HEADER VARIA,8,"VARIABLE"
      00990B 98 F5                    1         .word LINK 
                           00188D     2         LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



      00990D 08                       3         .byte 8  
      00990E 56 41 52 49 41 42 4C     4         .ascii "VARIABLE"
             45
      009916                          5         VARIA:
                                   3954 ; indirect variable so that VARIABLE definition can be compiled in FLASH 
      009916 CD 8D 2B         [ 4] 3955         CALL HERE
      009919 CD 86 A1         [ 4] 3956         CALL DUPP 
      00991C CD 8B B7         [ 4] 3957         CALL CELLP
      00991F CD 87 F8         [ 4] 3958         CALL VPP 
      009922 CD 85 51         [ 4] 3959         CALL STORE
      009925 CD 98 FC         [ 4] 3960         CALL CREAT
      009928 CD 86 A1         [ 4] 3961         CALL DUPP
      00992B CD 95 6F         [ 4] 3962         CALL COMMA
      00992E CD 8C 4E         [ 4] 3963         CALL ZERO
      009931 CD 86 B1         [ 4] 3964         call SWAPP 
      009934 CD 85 51         [ 4] 3965         CALL STORE
      009937 CD A2 02         [ 4] 3966         CALL FMOVE ; move definition to FLASH
      00993A CD 88 54         [ 4] 3967         CALL QDUP 
      00993D CD 85 18         [ 4] 3968         CALL QBRAN 
      009940 99 49                 3969         .word SET_RAMLAST   
      009942 CD 9C AA         [ 4] 3970         call UPDATVP  ; don't update if variable kept in RAM.
      009945 CD A2 96         [ 4] 3971         CALL UPDATPTR
      009948 81               [ 4] 3972         RET         
      009949                       3973 SET_RAMLAST: 
      009949 CD 88 16         [ 4] 3974         CALL LAST 
      00994C CD 85 63         [ 4] 3975         CALL AT 
      00994F CD 88 29         [ 4] 3976         CALL RAMLAST 
      009952 CC 85 51         [ 2] 3977         jp STORE  
                                   3978 
                                   3979 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3980 ;       CONSTANT  ( n -- ; <string> )
                                   3981 ;       Compile a new constant 
                                   3982 ;       n CONSTANT name 
                                   3983 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0018D5                       3984         _HEADER CONSTANT,8,"CONSTANT"
      009955 99 0D                    1         .word LINK 
                           0018D7     2         LINK=.
      009957 08                       3         .byte 8  
      009958 43 4F 4E 53 54 41 4E     4         .ascii "CONSTANT"
             54
      009960                          5         CONSTANT:
      009960 CD 92 28         [ 4] 3985         CALL TOKEN
      009963 CD 97 61         [ 4] 3986         CALL SNAME 
      009966 CD 97 F2         [ 4] 3987         CALL OVERT 
      009969 CD 95 B4         [ 4] 3988         CALL COMPI 
      00996C 99 80                 3989         .word DOCONST
      00996E CD 95 6F         [ 4] 3990         CALL COMMA 
      009971 CD A2 02         [ 4] 3991         CALL FMOVE
      009974 CD 88 54         [ 4] 3992         CALL QDUP 
      009977 CD 85 18         [ 4] 3993         CALL QBRAN 
      00997A 99 49                 3994         .word SET_RAMLAST  
      00997C CD A2 96         [ 4] 3995         CALL UPDATPTR  
      00997F 81               [ 4] 3996 1$:     RET          
                                   3997 
                                   3998 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



                                   3999 ; CONSTANT runtime semantic 
                                   4000 ; doCONST  ( -- n )
                                   4001 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4002 ;       _HEADER DOCONST,7,"DOCONST"
      009980                       4003 DOCONST:
      009980 1D 00 02         [ 2] 4004         subw x,#CELLL
      009983 90 85            [ 2] 4005         popw y 
      009985 90 FE            [ 2] 4006         ldw y,(y) 
      009987 FF               [ 2] 4007         ldw (x),y 
      009988 81               [ 4] 4008         ret 
                                   4009 
                                   4010 ;----------------------------------
                                   4011 ; create double constant 
                                   4012 ; 2CONSTANT ( d -- ; <string> )
                                   4013 ;----------------------------------
      001909                       4014         _HEADER DCONST,9,"2CONSTANT"
      009989 99 57                    1         .word LINK 
                           00190B     2         LINK=.
      00998B 09                       3         .byte 9  
      00998C 32 43 4F 4E 53 54 41     4         .ascii "2CONSTANT"
             4E 54
      009995                          5         DCONST:
      009995 CD 92 28         [ 4] 4015         CALL TOKEN
      009998 CD 97 61         [ 4] 4016         CALL SNAME 
      00999B CD 97 F2         [ 4] 4017         CALL OVERT 
      00999E CD 95 B4         [ 4] 4018         CALL COMPI 
      0099A1 99 B8                 4019         .word DO_DCONST
      0099A3 CD 95 6F         [ 4] 4020         CALL COMMA
      0099A6 CD 95 6F         [ 4] 4021         CALL COMMA  
      0099A9 CD A2 02         [ 4] 4022         CALL FMOVE
      0099AC CD 88 54         [ 4] 4023         CALL QDUP 
      0099AF CD 85 18         [ 4] 4024         CALL QBRAN 
      0099B2 99 49                 4025         .word SET_RAMLAST  
      0099B4 CD A2 96         [ 4] 4026         CALL UPDATPTR  
      0099B7 81               [ 4] 4027 1$:     RET          
                                   4028     
                                   4029 ;----------------------------------
                                   4030 ; runtime for DCONST 
                                   4031 ; stack double constant 
                                   4032 ; DO-DCONST ( -- d )
                                   4033 ;-----------------------------------
                                   4034 ;       _HEADER DO_DCONST,9,"DO-DCONST"
      0099B8                       4035 DO_DCONST:
      0099B8 90 85            [ 2] 4036     popw y 
      0099BA 90 BF 26         [ 2] 4037     ldw YTEMP,y 
      0099BD 1D 00 04         [ 2] 4038     subw x,#2*CELLL 
      0099C0 90 FE            [ 2] 4039     ldw y,(y)
      0099C2 FF               [ 2] 4040     ldw (x),y 
      0099C3 90 BE 26         [ 2] 4041     ldw y,YTEMP 
      0099C6 90 EE 02         [ 2] 4042     ldw y,(2,y)
      0099C9 EF 02            [ 2] 4043     ldw (2,x),y 
      0099CB 81               [ 4] 4044     ret 
                                   4045 
                                   4046 ;; Tools
                                   4047 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



                                   4048 ;       _TYPE   ( b u -- )
                                   4049 ;       Display a string. Filter
                                   4050 ;       non-printing characters.
                                   4051 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00194C                       4052         _HEADER UTYPE,5,"_TYPE"
      0099CC 99 8B                    1         .word LINK 
                           00194E     2         LINK=.
      0099CE 05                       3         .byte 5  
      0099CF 5F 54 59 50 45           4         .ascii "_TYPE"
      0099D4                          5         UTYPE:
      0099D4 CD 86 6A         [ 4] 4053         CALL     TOR     ;start count down loop
      0099D7 20 0F            [ 2] 4054         JRA     UTYP2   ;skip first pass
      0099D9 CD 86 A1         [ 4] 4055 UTYP1:  CALL     DUPP
      0099DC CD 85 81         [ 4] 4056         CALL     CAT
      0099DF CD 8C 78         [ 4] 4057         CALL     TCHAR
      0099E2 CD 84 B6         [ 4] 4058         CALL     EMIT    ;display only printable
      0099E5 CD 8B E2         [ 4] 4059         CALL     ONEP    ;increment address
      0099E8 CD 85 03         [ 4] 4060 UTYP2:  CALL     DONXT
      0099EB 99 D9                 4061         .word      UTYP1   ;loop till done
      0099ED CC 86 97         [ 2] 4062         JP     DROP
                                   4063 
                                   4064 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4065 ;       dm+     ( a u -- a )
                                   4066 ;       Dump u bytes from ,
                                   4067 ;       leaving a+u on  stack.
                                   4068 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001970                       4069         _HEADER DUMPP,3,"DM+"
      0099F0 99 CE                    1         .word LINK 
                           001972     2         LINK=.
      0099F2 03                       3         .byte 3  
      0099F3 44 4D 2B                 4         .ascii "DM+"
      0099F6                          5         DUMPP:
      0099F6 CD 86 C9         [ 4] 4070         CALL     OVER
      0099F9 CD 84 EF         [ 4] 4071         CALL     DOLIT
      0099FC 00 04                 4072         .word      4
      0099FE CD 90 1C         [ 4] 4073         CALL     UDOTR   ;display address
      009A01 CD 8F 84         [ 4] 4074         CALL     SPACE
      009A04 CD 86 6A         [ 4] 4075         CALL     TOR     ;start count down loop
      009A07 20 11            [ 2] 4076         JRA     PDUM2   ;skip first pass
      009A09 CD 86 A1         [ 4] 4077 PDUM1:  CALL     DUPP
      009A0C CD 85 81         [ 4] 4078         CALL     CAT
      009A0F CD 84 EF         [ 4] 4079         CALL     DOLIT
      009A12 00 03                 4080         .word      3
      009A14 CD 90 1C         [ 4] 4081         CALL     UDOTR   ;display numeric data
      009A17 CD 8B E2         [ 4] 4082         CALL     ONEP    ;increment address
      009A1A CD 85 03         [ 4] 4083 PDUM2:  CALL     DONXT
      009A1D 9A 09                 4084         .word      PDUM1   ;loop till done
      009A1F 81               [ 4] 4085         RET
                                   4086 
                                   4087 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4088 ;       DUMP    ( a u -- )
                                   4089 ;       Dump u bytes from a,
                                   4090 ;       in a formatted manner.
                                   4091 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0019A0                       4092         _HEADER DUMP,4,"DUMP"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



      009A20 99 F2                    1         .word LINK 
                           0019A2     2         LINK=.
      009A22 04                       3         .byte 4  
      009A23 44 55 4D 50              4         .ascii "DUMP"
      009A27                          5         DUMP:
      009A27 CD 87 67         [ 4] 4093         CALL     BASE
      009A2A CD 85 63         [ 4] 4094         CALL     AT
      009A2D CD 86 6A         [ 4] 4095         CALL     TOR
      009A30 CD 8E E3         [ 4] 4096         CALL     HEX     ;save radix, set hex
      009A33 CD 84 EF         [ 4] 4097         CALL     DOLIT
      009A36 00 10                 4098         .word      16
      009A38 CD 8B 08         [ 4] 4099         CALL     SLASH   ;change count to lines
      009A3B CD 86 6A         [ 4] 4100         CALL     TOR     ;start count down loop
      009A3E CD 8F C6         [ 4] 4101 DUMP1:  CALL     CR
      009A41 CD 84 EF         [ 4] 4102         CALL     DOLIT
      009A44 00 10                 4103         .word      16
      009A46 CD 88 B1         [ 4] 4104         CALL     DDUP
      009A49 CD 99 F6         [ 4] 4105         CALL     DUMPP   ;display numeric
      009A4C CD 88 65         [ 4] 4106         CALL     ROT
      009A4F CD 88 65         [ 4] 4107         CALL     ROT
      009A52 CD 8F 84         [ 4] 4108         CALL     SPACE
      009A55 CD 8F 84         [ 4] 4109         CALL     SPACE
      009A58 CD 99 D4         [ 4] 4110         CALL     UTYPE   ;display printable characters
      009A5B CD 85 03         [ 4] 4111         CALL     DONXT
      009A5E 9A 3E                 4112         .word      DUMP1   ;loop till done
      009A60 CD 86 97         [ 4] 4113 DUMP3:  CALL     DROP
      009A63 CD 85 B4         [ 4] 4114         CALL     RFROM
      009A66 CD 87 67         [ 4] 4115         CALL     BASE
      009A69 CC 85 51         [ 2] 4116         JP     STORE   ;restore radix
                                   4117 
                                   4118 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4119 ;       .S      ( ... -- ... )
                                   4120 ;        Display  contents of stack.
                                   4121 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0019EC                       4122         _HEADER DOTS,2,".S"
      009A6C 9A 22                    1         .word LINK 
                           0019EE     2         LINK=.
      009A6E 02                       3         .byte 2  
      009A6F 2E 53                    4         .ascii ".S"
      009A71                          5         DOTS:
      009A71 CD 8F C6         [ 4] 4123         CALL     CR
      009A74 CD 8C 90         [ 4] 4124         CALL     DEPTH   ;stack depth
      009A77 CD 86 6A         [ 4] 4125         CALL     TOR     ;start count down loop
      009A7A 20 09            [ 2] 4126         JRA     DOTS2   ;skip first pass
      009A7C CD 85 C5         [ 4] 4127 DOTS1:  CALL     RAT
      009A7F CD 8C A7         [ 4] 4128 	CALL     PICK
      009A82 CD 90 6D         [ 4] 4129         CALL     DOT     ;index stack, display contents
      009A85 CD 85 03         [ 4] 4130 DOTS2:  CALL     DONXT
      009A88 9A 7C                 4131         .word      DOTS1   ;loop till done
      009A8A CD 8F F3         [ 4] 4132         CALL     DOTQP
      009A8D 05                    4133         .byte      5
      009A8E 20 3C 73 70 20        4134         .ascii     " <sp "
      009A93 81               [ 4] 4135         RET
                                   4136 
                                   4137 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



                                   4138 ;       >NAME   ( ca -- na | F )
                                   4139 ;       Convert code address
                                   4140 ;       to a name address.
                                   4141 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001A14                       4142         _HEADER TNAME,5,">NAME"
      009A94 9A 6E                    1         .word LINK 
                           001A16     2         LINK=.
      009A96 05                       3         .byte 5  
      009A97 3E 4E 41 4D 45           4         .ascii ">NAME"
      009A9C                          5         TNAME:
      009A9C CD 87 EA         [ 4] 4143         CALL     CNTXT   ;vocabulary link
      009A9F CD 85 63         [ 4] 4144 TNAM2:  CALL     AT
      009AA2 CD 86 A1         [ 4] 4145         CALL     DUPP    ;?last word in a vocabulary
      009AA5 CD 85 18         [ 4] 4146         CALL     QBRAN
      009AA8 9A C3                 4147         .word      TNAM4
      009AAA CD 88 B1         [ 4] 4148         CALL     DDUP
      009AAD CD 92 36         [ 4] 4149         CALL     NAMET
      009AB0 CD 87 27         [ 4] 4150         CALL     XORR    ;compare
      009AB3 CD 85 18         [ 4] 4151         CALL     QBRAN
      009AB6 9A BD                 4152         .word      TNAM3
      009AB8 CD 8B C6         [ 4] 4153         CALL     CELLM   ;continue with next word
      009ABB 20 E2            [ 2] 4154         JRA     TNAM2
      009ABD CD 86 B1         [ 4] 4155 TNAM3:  CALL     SWAPP
      009AC0 CC 86 97         [ 2] 4156         JP     DROP
      009AC3 CD 88 A6         [ 4] 4157 TNAM4:  CALL     DDROP
      009AC6 CC 8C 4E         [ 2] 4158         JP     ZERO
                                   4159 
                                   4160 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4161 ;       .ID     ( na -- )
                                   4162 ;        Display  name at address.
                                   4163 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001A49                       4164         _HEADER DOTID,3,".ID"
      009AC9 9A 96                    1         .word LINK 
                           001A4B     2         LINK=.
      009ACB 03                       3         .byte 3  
      009ACC 2E 49 44                 4         .ascii ".ID"
      009ACF                          5         DOTID:
      009ACF CD 88 54         [ 4] 4165         CALL     QDUP    ;if zero no name
      009AD2 CD 85 18         [ 4] 4166         CALL     QBRAN
      009AD5 9A E5                 4167         .word      DOTI1
      009AD7 CD 8D 14         [ 4] 4168         CALL     COUNT
      009ADA CD 84 EF         [ 4] 4169         CALL     DOLIT
      009ADD 00 1F                 4170         .word      0x1F
      009ADF CD 86 FE         [ 4] 4171         CALL     ANDD    ;mask lexicon bits
      009AE2 CC 99 D4         [ 2] 4172         JP     UTYPE
      009AE5 CD 8F F3         [ 4] 4173 DOTI1:  CALL     DOTQP
      009AE8 09                    4174         .byte      9
      009AE9 20 6E 6F 4E 61 6D 65  4175         .ascii     " noName"
      009AF0 81               [ 4] 4176         RET
                                   4177 
                           000000  4178 WANT_SEE=0
                           000000  4179 .if WANT_SEE 
                                   4180 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4181 ;       SEE     ( -- ; <string> )
                                   4182 ;       A simple decompiler.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



                                   4183 ;       Updated for byte machines.
                                   4184 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4185         _HEADER SEE,3,"SEE"
                                   4186         CALL     TICK    ;starting address
                                   4187         CALL     CR
                                   4188         CALL     ONEM
                                   4189 SEE1:   CALL     ONEP
                                   4190         CALL     DUPP
                                   4191         CALL     AT
                                   4192         CALL     DUPP
                                   4193         CALL     QBRAN
                                   4194         .word    SEE2
                                   4195         CALL     TNAME   ;?is it a name
                                   4196 SEE2:   CALL     QDUP    ;name address or zero
                                   4197         CALL     QBRAN
                                   4198         .word    SEE3
                                   4199         CALL     SPACE
                                   4200         CALL     DOTID   ;display name
                                   4201         CALL     ONEP
                                   4202         JRA      SEE4
                                   4203 SEE3:   CALL     DUPP
                                   4204         CALL     CAT
                                   4205         CALL     UDOT    ;display number
                                   4206 SEE4:   CALL     NUFQ    ;user control
                                   4207         CALL     QBRAN
                                   4208         .word    SEE1
                                   4209         JP     DROP
                                   4210 .endif ; WANT_SEE 
                                   4211 
                                   4212 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4213 ;       WORDS   ( -- )
                                   4214 ;       Display names in vocabulary.
                                   4215 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001A71                       4216         _HEADER WORDS,5,"WORDS"
      009AF1 9A CB                    1         .word LINK 
                           001A73     2         LINK=.
      009AF3 05                       3         .byte 5  
      009AF4 57 4F 52 44 53           4         .ascii "WORDS"
      009AF9                          5         WORDS:
      009AF9 CD 8F C6         [ 4] 4217         CALL     CR
      009AFC CD 87 EA         [ 4] 4218         CALL     CNTXT   ;only in context
      009AFF CD 85 63         [ 4] 4219 WORS1:  CALL     AT
      009B02 CD 88 54         [ 4] 4220         CALL     QDUP    ;?at end of list
      009B05 CD 85 18         [ 4] 4221         CALL     QBRAN
      009B08 9B 1B                 4222         .word      WORS2
      009B0A CD 86 A1         [ 4] 4223         CALL     DUPP
      009B0D CD 8F 84         [ 4] 4224         CALL     SPACE
      009B10 CD 9A CF         [ 4] 4225         CALL     DOTID   ;display a name
      009B13 CD 8B C6         [ 4] 4226         CALL     CELLM
      009B16 CD 85 34         [ 4] 4227         CALL     BRAN
      009B19 9A FF                 4228         .word      WORS1
      009B1B 81               [ 4] 4229 WORS2:  RET
                                   4230 
                                   4231         
                                   4232 ;; Hardware reset
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



                                   4233 
                                   4234 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4235 ;       hi      ( -- )
                                   4236 ;       Display sign-on message.
                                   4237 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001A9C                       4238         _HEADER HI,2,"HI"
      009B1C 9A F3                    1         .word LINK 
                           001A9E     2         LINK=.
      009B1E 02                       3         .byte 2  
      009B1F 48 49                    4         .ascii "HI"
      009B21                          5         HI:
      009B21 CD 8F C6         [ 4] 4239         CALL     CR
      009B24 CD 8F F3         [ 4] 4240         CALL     DOTQP   ;initialize I/O
      009B27 0F                    4241         .byte      15
      009B28 73 74 6D 38 65 46 6F  4242         .ascii     "stm8eForth v"
             72 74 68 20 76
      009B34 34                    4243 	.byte      VER+'0'
      009B35 2E                    4244         .byte      '.' 
      009B36 30                    4245 	.byte      EXT+'0' ;version
      009B37 CD 8F F3         [ 4] 4246         CALL    DOTQP
                           000001  4247 .if NUCLEO          
      009B3A 12                    4248         .byte 18
      009B3B 20 6F 6E 20 4E 55 43  4249         .ascii  " on NUCLEO-8S208RB"
             4C 45 4F 2D 38 53 32
             30 38 52 42
                                   4250 .endif
                           000000  4251 .if DISCOVERY
                                   4252         .byte 19
                                   4253         .ascii  " on STM8S-DISCOVERY"
                                   4254 .endif
                           000000  4255 .if DOORBELL
                                   4256         .byte 16
                                   4257         .ascii " on stm8s105k6b6"
                                   4258 .endif
      009B4D CC 8F C6         [ 2] 4259         JP     CR
                                   4260 
                           000000  4261 WANT_DEBUG=0
                           000000  4262 .if WANT_DEBUG 
                                   4263 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4264 ;       DEBUG      ( -- )
                                   4265 ;       Display sign-on message.
                                   4266 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4267         _HEADER DEBUG,5,"DEBUG"
                                   4268 	CALL DOLIT
                                   4269 	.word 0x65
                                   4270 	CALL EMIT
                                   4271 	CALL ZERO
                                   4272  	CALL ZLESS 
                                   4273 	CALL DOLIT
                                   4274 	.word 0xFFFE
                                   4275 	CALL ZLESS 
                                   4276 	CALL UPLUS 
                                   4277  	CALL DROP 
                                   4278 	CALL DOLIT
                                   4279 	.word 3
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



                                   4280 	CALL UPLUS 
                                   4281 	CALL UPLUS 
                                   4282  	CALL DROP
                                   4283 	CALL DOLIT
                                   4284 	.word 0x43
                                   4285 	CALL UPLUS 
                                   4286  	CALL DROP
                                   4287 	CALL EMIT
                                   4288 	CALL DOLIT
                                   4289 	.word 0x4F
                                   4290 	CALL DOLIT
                                   4291 	.word 0x6F
                                   4292  	CALL XORR
                                   4293 	CALL DOLIT
                                   4294 	.word 0xF0
                                   4295  	CALL ANDD
                                   4296 	CALL DOLIT
                                   4297 	.word 0x4F
                                   4298  	CALL ORR
                                   4299 	CALL EMIT
                                   4300 	CALL DOLIT
                                   4301 	.word 8
                                   4302 	CALL DOLIT
                                   4303 	.word 6
                                   4304  	CALL SWAPP
                                   4305 	CALL OVER
                                   4306 	CALL XORR
                                   4307 	CALL DOLIT
                                   4308 	.word 3
                                   4309 	CALL ANDD 
                                   4310 	CALL ANDD
                                   4311 	CALL DOLIT
                                   4312 	.word 0x70
                                   4313 	CALL UPLUS 
                                   4314 	CALL DROP
                                   4315 	CALL EMIT
                                   4316 	CALL ZERO
                                   4317 	CALL QBRAN
                                   4318 	.word DEBUG1
                                   4319 	CALL DOLIT
                                   4320 	.word 0x3F
                                   4321 DEBUG1:
                                   4322 	CALL DOLIT
                                   4323 	.word 0xFFFF
                                   4324 	CALL QBRAN
                                   4325 	.word DEBUG2
                                   4326 	CALL DOLIT
                                   4327 	.word 0x74
                                   4328 	CALL BRAN
                                   4329 	.word DEBUG3
                                   4330 DEBUG2:
                                   4331 	CALL DOLIT
                                   4332 	.word 0x21
                                   4333 DEBUG3:
                                   4334 	CALL EMIT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



                                   4335 	CALL DOLIT
                                   4336 	.word 0x68
                                   4337 	CALL DOLIT
                                   4338 	.word 0x80
                                   4339 	CALL STORE
                                   4340 	CALL DOLIT
                                   4341 	.word 0x80
                                   4342 	CALL AT
                                   4343 	CALL EMIT
                                   4344 	CALL DOLIT
                                   4345 	.word 0x4D
                                   4346 	CALL TOR
                                   4347 	CALL RAT
                                   4348 	CALL RFROM
                                   4349 	CALL ANDD
                                   4350 	CALL EMIT
                                   4351 	CALL DOLIT
                                   4352 	.word 0x61
                                   4353 	CALL DOLIT
                                   4354 	.word 0xA
                                   4355 	CALL TOR
                                   4356 DEBUG4:
                                   4357 	CALL ONE
                                   4358 	CALL UPLUS 
                                   4359 	CALL DROP
                                   4360 	CALL DONXT
                                   4361 	.word DEBUG4
                                   4362 	CALL EMIT
                                   4363 	CALL DOLIT
                                   4364 	.word 0x656D
                                   4365 	CALL DOLIT
                                   4366 	.word 0x100
                                   4367 	CALL UMSTA
                                   4368 	CALL SWAPP
                                   4369 	CALL DOLIT
                                   4370 	.word 0x100
                                   4371 	CALL UMSTA
                                   4372 	CALL SWAPP 
                                   4373 	CALL DROP
                                   4374 	CALL EMIT
                                   4375 	CALL EMIT
                                   4376 	CALL DOLIT
                                   4377 	.word 0x2043
                                   4378 	CALL ZERO
                                   4379 	CALL DOLIT
                                   4380 	.word 0x100
                                   4381 	CALL UMMOD
                                   4382 	CALL EMIT
                                   4383 	CALL EMIT
                                   4384 	;JP ORIG
                                   4385 	RET
                                   4386 .endif ; WANT_DEBUG 
                                   4387 
                                   4388 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4389 ;       'BOOT   ( -- a )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



                                   4390 ;       The application startup vector.
                                   4391 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001AD0                       4392         _HEADER TBOOT,5,"'BOOT"
      009B50 9B 1E                    1         .word LINK 
                           001AD2     2         LINK=.
      009B52 05                       3         .byte 5  
      009B53 27 42 4F 4F 54           4         .ascii "'BOOT"
      009B58                          5         TBOOT:
      009B58 CD 87 57         [ 4] 4393         CALL     DOVAR
      009B5B 40 02                 4394         .word    APP_RUN      ;application to boot
                                   4395 
                                   4396 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4397 ;       COLD    ( -- )
                                   4398 ;       The hilevel cold start s=ence.
                                   4399 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001ADD                       4400         _HEADER COLD,4,"COLD"
      009B5D 9B 52                    1         .word LINK 
                           001ADF     2         LINK=.
      009B5F 04                       3         .byte 4  
      009B60 43 4F 4C 44              4         .ascii "COLD"
      009B64                          5         COLD:
                           000000  4401 .if WANT_DEBUG
                                   4402         CALL DEBUG
                                   4403 .endif ; WANT_DEBUG
      009B64 CD 84 EF         [ 4] 4404 COLD1:  CALL     DOLIT
      009B67 80 AB                 4405         .word      UZERO
      009B69 CD 84 EF         [ 4] 4406 	CALL     DOLIT
      009B6C 00 06                 4407         .word      UPP
      009B6E CD 84 EF         [ 4] 4408         CALL     DOLIT
      009B71 00 1C                 4409 	.word      UEND-UZERO
      009B73 CD 8D 78         [ 4] 4410         CALL     CMOVE   ;initialize user area
                           000001  4411 .if WANT_FLOAT 
      009B76 CD AB B1         [ 4] 4412         CALL    FINIT 
                                   4413 .endif 
                                   4414 ; if APP_RUN==0 initialize with ca de 'hi'  
      009B79 90 CE 40 02      [ 2] 4415         ldw y,APP_RUN 
      009B7D 26 0B            [ 1] 4416         jrne 0$
      009B7F 1D 00 02         [ 2] 4417         subw x,#CELLL 
      009B82 90 AE 9B 21      [ 2] 4418         ldw y,#HI  
      009B86 FF               [ 2] 4419         ldw (x),y
      009B87 CD 9C 82         [ 4] 4420         call UPDATRUN 
      009B8A                       4421 0$:        
                                   4422 ; update LAST with APP_LAST 
                                   4423 ; if APP_LAST > LAST else do the opposite
      009B8A 90 CE 40 00      [ 2] 4424         ldw y,APP_LAST 
      009B8E 90 B3 1C         [ 2] 4425         cpw y,ULAST 
      009B91 22 05            [ 1] 4426         jrugt 1$ 
                                   4427 ; save LAST at APP_LAST  
      009B93 CD 9C 6A         [ 4] 4428         call UPDATLAST 
      009B96 20 06            [ 2] 4429         jra 2$
      009B98                       4430 1$: ; update LAST with APP_LAST 
      009B98 90 BF 1C         [ 2] 4431         ldw ULAST,y
      009B9B 90 BF 16         [ 2] 4432         ldw UCNTXT,y
      009B9E                       4433 2$:  
                                   4434 ; update APP_CP if < app_space 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



      009B9E 90 CE 40 04      [ 2] 4435         ldw y,APP_CP  
      009BA2 90 B3 1A         [ 2] 4436         cpw y,UCP   
      009BA5 24 06            [ 1] 4437         jruge 3$ 
      009BA7 CD 9C 93         [ 4] 4438         call UPDATCP
      009BAA 90 BE 1A         [ 2] 4439         ldw y,UCP   
      009BAD                       4440 3$:
      009BAD 90 BF 1A         [ 2] 4441         ldw UCP,y                 
                                   4442 ; update UVP with APP_VP  
                                   4443 ; if APP_VP>UVP else do the opposite 
      009BB0 90 CE 40 06      [ 2] 4444         ldw y,APP_VP 
      009BB4 90 B3 18         [ 2] 4445         cpw y,UVP 
      009BB7 22 05            [ 1] 4446         jrugt 4$
      009BB9 CD 9C AA         [ 4] 4447         call UPDATVP 
      009BBC 20 03            [ 2] 4448         jra 6$
      009BBE                       4449 4$: ; update UVP with APP_VP 
      009BBE 90 BF 18         [ 2] 4450         ldw UVP,y 
      009BC1                       4451 6$:      
      009BC1 CD 95 19         [ 4] 4452         CALL     PRESE   ;initialize data stack and TIB
      009BC4 CD 9B 58         [ 4] 4453         CALL     TBOOT
      009BC7 CD 8D 61         [ 4] 4454         CALL     ATEXE   ;application boot
      009BCA CD 97 F2         [ 4] 4455         CALL     OVERT
      009BCD CC 95 36         [ 2] 4456         JP     QUIT    ;start interpretation
                                   4457 
                                   4458 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



                                   4459         .include "flash.asm"
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
      009BD0 9B 5F                   31     .word LINK 
                           001B52    32     LINK=.
      009BD2 03                      33     .byte 3 
      009BD3 46 50 21                34     .ascii "FP!"
      009BD6                         35 FPSTOR:
      009BD6 90 93            [ 1]   36     ldw y,x
      009BD8 90 FE            [ 2]   37     ldw y,(y)
      009BDA 90 9F            [ 1]   38     ld a,yl 
      009BDC B7 34            [ 1]   39     ld FPTR,a 
      009BDE 1C 00 02         [ 2]   40     addw x,#CELLL 
      009BE1 90 93            [ 1]   41     ldw y,x 
      009BE3 90 FE            [ 2]   42     ldw y,(y)
      009BE5 90 BF 35         [ 2]   43     ldw PTR16,y
      009BE8 1C 00 02         [ 2]   44     addw x,#CELLL 
      009BEB 81               [ 4]   45     ret 
                                     46 
                                     47 ;-----------------------------------
                                     48 ; return EEPROM base address 
                                     49 ; as a double 
                                     50 ;  EEPROM  ( -- ud )
                                     51 ;-----------------------------------
      009BEC 9B D2                   52     .word LINK 
                           001B6E    53 LINK=.
      009BEE 06                      54     .byte 6 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



      009BEF 45 45 50 52 4F 4D       55     .ascii "EEPROM"
      009BF5                         56 EEPROM: 
      009BF5 90 AE 40 00      [ 2]   57     ldw y,#EEPROM_BASE
      009BF9 1D 00 04         [ 2]   58     subw x,#2*CELLL 
      009BFC EF 02            [ 2]   59     ldw (2,x),y 
      009BFE 90 5F            [ 1]   60     clrw y 
      009C00 FF               [ 2]   61     ldw (x),y 
      009C01 81               [ 4]   62     ret
                                     63 
                                     64 ;---------------------------------
                                     65 ; return APP_LAST pointer as double
                                     66 ; EEP-LAST ( -- ud )
                                     67 ;---------------------------------
      009C02 9B EE                   68 	.word LINK 
                           001B84    69 	LINK=.
      009C04 08                      70 	.byte 8 
      009C05 45 45 50 2D 4C 41 53    71 	.ascii "EEP-LAST"
             54
      009C0D                         72 EEPLAST:
      009C0D 1D 00 04         [ 2]   73 	subw x,#2*CELLL 
      009C10 90 AE 40 00      [ 2]   74 	ldw y,#APP_LAST 
      009C14 EF 02            [ 2]   75 	ldw (2,x),y 
      009C16 90 5F            [ 1]   76 	clrw y 
      009C18 FF               [ 2]   77 	ldw (x),y 
      009C19 81               [ 4]   78 	ret 
                                     79 
                                     80 ;----------------------------------
                                     81 ; return APP_RUN pointer as double	
                                     82 ; EEP-RUN ( -- ud )
                                     83 ;-----------------------------------
      009C1A 9C 04                   84 	.word LINK 
                           001B9C    85 	LINK=.
      009C1C 07                      86 	.byte 7
      009C1D 45 45 50 2D 52 55 4E    87 	.ascii "EEP-RUN"
      009C24                         88 EEPRUN:
      009C24 1D 00 04         [ 2]   89 	subw x,#2*CELLL 
      009C27 90 AE 40 02      [ 2]   90 	ldw y,#APP_RUN 
      009C2B EF 02            [ 2]   91 	ldw (2,x),y 
      009C2D 90 5F            [ 1]   92 	clrw y 
      009C2F FF               [ 2]   93 	ldw (x),y 
      009C30 81               [ 4]   94 	ret 
                                     95 
                                     96 ;------------------------------------
                                     97 ; return APP_CP pointer as double 
                                     98 ; EEP-CP ( -- ud )
                                     99 ;------------------------------------
      009C31 9C 1C                  100 	.word LINK
                           001BB3   101 	LINK=.
      009C33 06                     102 	.byte 6 
      009C34 45 45 50 2D 43 50      103 	.ascii "EEP-CP"
      009C3A                        104 EEPCP:
      009C3A 1D 00 04         [ 2]  105 	subw x,#2*CELLL 
      009C3D 90 AE 40 04      [ 2]  106 	ldw y,#APP_CP  
      009C41 EF 02            [ 2]  107 	ldw (2,x),y 
      009C43 90 5F            [ 1]  108 	clrw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



      009C45 FF               [ 2]  109 	ldw (x),y 
      009C46 81               [ 4]  110 	ret 
                                    111 
                                    112 ;------------------------------------
                                    113 ; return APP_VP pointer as double 
                                    114 ; EEP-VP ( -- ud )
                                    115 ;-------------------------------------
      009C47 9C 33                  116 	.word LINK
                           001BC9   117 	LINK=.
      009C49 06                     118 	.byte 6
      009C4A 45 45 50 2D 56 50      119 	.ascii "EEP-VP"
      009C50                        120 EEPVP:
      009C50 1D 00 04         [ 2]  121 	subw x,#2*CELLL 
      009C53 90 AE 40 06      [ 2]  122 	ldw y,#APP_VP  
      009C57 EF 02            [ 2]  123 	ldw (2,x),y 
      009C59 90 5F            [ 1]  124 	clrw y 
      009C5B FF               [ 2]  125 	ldw (x),y 
      009C5C 81               [ 4]  126 	ret 
                                    127 
                                    128 ;----------------------------------
                                    129 ; update APP_LAST with LAST 
                                    130 ; UPDAT-LAST ( -- )
                                    131 ;----------------------------------
      009C5D 9C 49                  132 	.word LINK 
                           001BDF   133 	LINK=.
      009C5F 0A                     134 	.byte 10
      009C60 55 50 44 41 54 2D 4C   135 	.ascii "UPDAT-LAST"
             41 53 54
      009C6A                        136 UPDATLAST:
      009C6A CD 88 16         [ 4]  137 	call LAST
      009C6D CD 85 63         [ 4]  138 	call AT  
      009C70 CD 9C 0D         [ 4]  139 	call EEPLAST
      009C73 CC 9E 60         [ 2]  140 	jp EESTORE 
                                    141 
                                    142 ;---------------------------------
                                    143 ; update APP_RUN 
                                    144 ; UPDAT-RUN ( a -- )
                                    145 ;---------------------------------
      009C76 9C 5F                  146 	.word LINK
                           001BF8   147 	LINK=.
      009C78 09                     148 	.byte 9
      009C79 55 50 44 41 54 2D 52   149 	.ascii "UPDAT-RUN"
             55 4E
      009C82                        150 UPDATRUN:
      009C82 CD 9C 24         [ 4]  151 	call EEPRUN
      009C85 CC 9E 60         [ 2]  152 	jp EESTORE 
                                    153 	
                                    154 ;---------------------------------
                                    155 ; update APP_CP with CP 
                                    156 ; UPDAT-CP ( -- )
                                    157 ;---------------------------------
      009C88 9C 78                  158 	.word LINK 
                           001C0A   159 	LINK=.
      009C8A 08                     160 	.byte 8 
      009C8B 55 50 44 41 54 2D 43   161 	.ascii "UPDAT-CP"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal  50-Bits]



             50
      009C93                        162 UPDATCP:
      009C93 CD 88 06         [ 4]  163 	call CPP 
      009C96 CD 85 63         [ 4]  164 	call AT 
      009C99 CD 9C 3A         [ 4]  165 	call EEPCP 
      009C9C CC 9E 60         [ 2]  166 	jp EESTORE 
                                    167 
                                    168 ;----------------------------------
                                    169 ; update APP_VP with VP 
                                    170 ; UPDAT-VP ( -- )
                                    171 ;----------------------------------
      009C9F 9C 8A                  172 	.word LINK
                           001C21   173 	LINK=.
      009CA1 08                     174 	.byte 8 
      009CA2 55 50 44 41 54 2D 56   175 	.ascii "UPDAT-VP" 
             50
      009CAA                        176 UPDATVP:
      009CAA CD 87 F8         [ 4]  177 	call VPP 
      009CAD CD 85 63         [ 4]  178 	call AT
      009CB0 CD 9C 50         [ 4]  179 	call EEPVP 
      009CB3 CC 9E 60         [ 2]  180 	jp EESTORE
                                    181 	
                           000001   182 .if NUCLEO
                                    183 ;----------------------------------
                                    184 ; fetch integer at address over 65535
                                    185 ;  F@   ( ud -- n )
                                    186 ;----------------------------------
      009CB6 9C A1                  187     .word LINK 
                           001C38   188 LINK=.
      009CB8 02                     189     .byte 2
      009CB9 46 40                  190     .ascii "F@"
      009CBB                        191 FARAT:
      009CBB CD 9B D6         [ 4]  192     call FPSTOR
      009CBE CC 9D 83         [ 2]  193 	jp EE_READ 
                                    194 
                                    195 
                                    196 ;-------------------------------------
                                    197 ; fetch C at address over 65535 
                                    198 ; FC@ ( ud -- c)
                                    199 ;-------------------------------------
      009CC1 9C B8                  200     .word LINK
                           001C43   201     LINK=.
      009CC3 03                     202     .byte 3 
      009CC4 46 43 40               203     .ascii "FC@" 
      009CC7                        204 FARCAT:
      009CC7 CD 9B D6         [ 4]  205     call FPSTOR
      009CCA CC 9D A5         [ 2]  206 	jp EE_CREAD  
                                    207 .endif ; NUCLEO 
                                    208 
                                    209 ;----------------------------------
                                    210 ; UNLOCK EEPROM/OPT for writing/erasing
                                    211 ; wait endlessly for FLASH_IAPSR_DUL bit.
                                    212 ;  UNLKEE   ( -- )
                                    213 ;----------------------------------
      009CCD 9C C3                  214     .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]



                           001C4F   215 LINK=.
      009CCF 06                     216     .byte 6 
      009CD0 55 4E 4C 4B 45 45      217     .ascii "UNLKEE"
      009CD6                        218 UNLKEE:
      009CD6 35 00 50 5B      [ 1]  219 	mov FLASH_CR2,#0 
      009CDA 35 FF 50 5C      [ 1]  220 	mov FLASH_NCR2,#0xFF 
      009CDE 35 AE 50 64      [ 1]  221 	mov FLASH_DUKR,#FLASH_DUKR_KEY1
      009CE2 35 56 50 64      [ 1]  222     mov FLASH_DUKR,#FLASH_DUKR_KEY2
      009CE6 72 07 50 5F FB   [ 2]  223 	btjf FLASH_IAPSR,#FLASH_IAPSR_DUL,.
      009CEB 81               [ 4]  224 	ret
                                    225 
                                    226 ;----------------------------------
                                    227 ; UNLOCK FLASH for writing/erasing
                                    228 ; wait endlessly for FLASH_IAPSR_PUL bit.
                                    229 ; UNLKFL  ( -- )
                                    230 ;----------------------------------
      009CEC 9C CF                  231     .word LINK 
                           001C6E   232 LINK=. 
      009CEE 06                     233     .byte 6 
      009CEF 55 4E 4C 4B 46 4C      234     .ascii "UNLKFL"    
      009CF5                        235 UNLKFL:
      009CF5 35 00 50 5B      [ 1]  236 	mov FLASH_CR2,#0 
      009CF9 35 FF 50 5C      [ 1]  237 	mov FLASH_NCR2,#0xFF 
      009CFD 35 56 50 62      [ 1]  238 	mov FLASH_PUKR,#FLASH_PUKR_KEY1
      009D01 35 AE 50 62      [ 1]  239 	mov FLASH_PUKR,#FLASH_PUKR_KEY2
      009D05 72 03 50 5F FB   [ 2]  240 	btjf FLASH_IAPSR,#FLASH_IAPSR_PUL,.
      009D0A 81               [ 4]  241 	ret
                                    242 
                                    243 ;-----------------------------
                                    244 ; UNLOCK FLASH or EEPROM 
                                    245 ; according to FPTR address 
                                    246 ;  UNLOCK ( -- )
                                    247 ;-----------------------------
      009D0B 9C EE                  248 	.word LINK 
                           001C8D   249 	LINK=.
      009D0D 06                     250 	.byte 6
      009D0E 55 4E 4C 4F 43 4B      251 	.ascii "UNLOCK"
      009D14                        252 UNLOCK:
                                    253 ; put addr[15:0] in Y, for bounds check.
      009D14 90 BE 35         [ 2]  254 	ldw y,PTR16   ; Y=addr15:0
                                    255 ; check addr[23:16], if <> 0 then it is extened flash memory
      009D17 3D 34            [ 1]  256 	tnz FPTR 
      009D19 26 16            [ 1]  257 	jrne 4$
      009D1B 90 A3 80 00      [ 2]  258     cpw y,#FLASH_BASE
      009D1F 24 10            [ 1]  259     jruge 4$
      009D21 90 A3 40 00      [ 2]  260 	cpw y,#EEPROM_BASE  
      009D25 25 0D            [ 1]  261     jrult 9$
      009D27 90 A3 48 7F      [ 2]  262 	cpw y,#OPTION_END 
      009D2B 22 07            [ 1]  263 	jrugt 9$
      009D2D CD 9C D6         [ 4]  264 	call UNLKEE
      009D30 81               [ 4]  265 	ret 
      009D31 CD 9C F5         [ 4]  266 4$: call UNLKFL
      009D34 81               [ 4]  267 9$: ret 
                                    268 
                                    269 ;-------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]



                                    270 ; LOCK write access to 
                                    271 ; FLASH and EEPROM 
                                    272 ; LOCK ( -- )
                                    273 ;-------------------------
      009D35 9D 0D                  274 	.word LINK 
                           001CB7   275 	LINK=.
      009D37 04                     276 	.byte 4 
      009D38 4C 4F 43 4B            277 	.ascii "LOCK" 
      009D3C                        278 LOCK: 
      009D3C 72 13 50 5F      [ 1]  279 	bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      009D40 72 17 50 5F      [ 1]  280 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      009D44 81               [ 4]  281 	ret 
                                    282 
                                    283 ;-------------------------
                                    284 ; increment FPTR 
                                    285 ; INC-FPTR ( -- )
                                    286 ;-------------------------
      009D45 9D 37                  287 	.word LINK 
                           001CC7   288 	LINK=. 
      009D47 08                     289 	.byte 8 
      009D48 49 4E 43 2D 46 50 54   290 	.ascii "INC-FPTR" 
             52
      009D50                        291 INC_FPTR:
      009D50 3C 36            [ 1]  292 	inc PTR8 
      009D52 26 0C            [ 1]  293 	jrne 1$
      009D54 90 89            [ 2]  294 	pushw y 
      009D56 90 BE 34         [ 2]  295 	ldw y,FPTR 
      009D59 90 5C            [ 1]  296 	incw y 
      009D5B 90 BF 34         [ 2]  297 	ldw FPTR,y
      009D5E 90 85            [ 2]  298 	popw y  
      009D60 81               [ 4]  299 1$: ret 
                                    300 
                                    301 ;------------------------------
                                    302 ; add u to FPTR 
                                    303 ; PTR+ ( u -- )
                                    304 ;------------------------------
      009D61 9D 47                  305 	.word LINK 
                           001CE3   306 	LINK=.
      009D63 04                     307 	.byte 4 
      009D64 50 54 52 2B            308 	.ascii "PTR+"
      009D68                        309 PTRPLUS:
      009D68 90 93            [ 1]  310 	ldw y,x 
      009D6A 1C 00 02         [ 2]  311 	addw x,#CELLL 
      009D6D 72 B9 00 35      [ 2]  312 	addw y,PTR16 
      009D71 90 BF 35         [ 2]  313 	ldw PTR16,y  
      009D74 24 02            [ 1]  314 	jrnc 1$
      009D76 3C 34            [ 1]  315 	inc FPTR 
      009D78 81               [ 4]  316 1$: ret 
                                    317 
                                    318 ;---------------------------------
                                    319 ; read word at address pointed FPTR
                                    320 ; increment FPTR 
                                    321 ; EE-READ ( -- w )
                                    322 ;------------------------------------
      009D79 9D 63                  323 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]



                           001CFB   324 	LINK=.
      009D7B 07                     325 	.byte 7 
      009D7C 45 45 2D 52 45 41 44   326 	.ascii "EE-READ"
      009D83                        327 EE_READ:
      009D83 1D 00 02         [ 2]  328 	subw x,#CELLL 
      009D86 92 BC 00 34      [ 5]  329 	ldf a,[FPTR]
      009D8A 90 95            [ 1]  330 	ld yh,a 
      009D8C CD 9D 50         [ 4]  331 	call INC_FPTR 
      009D8F 92 BC 00 34      [ 5]  332 	ldf a,[FPTR]
      009D93 CD 9D 50         [ 4]  333 	call INC_FPTR 
      009D96 90 97            [ 1]  334 	ld yl,a 
      009D98 FF               [ 2]  335 	ldw (x),y 
      009D99 81               [ 4]  336 	ret 
                                    337 
                                    338 ;---------------------------------------
                                    339 ; Read byte at address pointed by FPTR 
                                    340 ; EE-CREAD ( -- c )
                                    341 ;---------------------------------------
      009D9A 9D 7B                  342 	.word LINK 
                           001D1C   343 	LINK=.
      009D9C 08                     344 	.byte 8
      009D9D 45 45 2D 43 52 45 41   345 	.ascii "EE-CREAD" 
             44
      009DA5                        346 EE_CREAD:
      009DA5 1D 00 02         [ 2]  347 	subw x,#CELLL 
      009DA8 92 BC 00 34      [ 5]  348 	ldf a,[FPTR]	
      009DAC CD 9D 50         [ 4]  349 	call INC_FPTR
      009DAF 90 5F            [ 1]  350 	clrw y 
      009DB1 90 97            [ 1]  351 	ld yl,a 
      009DB3 FF               [ 2]  352 	ldw (x),y 
      009DB4 81               [ 4]  353 	ret 
                                    354 
                                    355 ;----------------------------
                                    356 ; write a byte at address pointed 
                                    357 ; by FPTR and increment FPTR.
                                    358 ; Expect pointer already initialized 
                                    359 ; and memory unlocked 
                                    360 ; WR-BYTE ( c -- )
                                    361 ;----------------------------
      009DB5 9D 9C                  362 	.word LINK 
                           001D37   363 	LINK=. 
      009DB7 07                     364 	.byte 7 
      009DB8 57 52 2D 42 59 54 45   365 	.ascii "WR-BYTE" 
                                    366 
      009DBF                        367 WR_BYTE:
      009DBF CD 84 E3         [ 4]  368 	call FC_XOFF
      009DC2 90 93            [ 1]  369 	ldw y,x 
      009DC4 90 FE            [ 2]  370 	ldw y,(y)
      009DC6 1C 00 02         [ 2]  371 	addw x,#CELLL 
      009DC9 90 9F            [ 1]  372 	ld a,yl
      009DCB 92 BD 00 34      [ 4]  373 	ldf [FPTR],a
      009DCF 72 05 50 5F FB   [ 2]  374 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009DD4 CD 84 CD         [ 4]  375 	call FC_XON
      009DD7 CC 9D 50         [ 2]  376 	jp INC_FPTR 
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
      009DDA 9D B7                  385 	.word LINK 
                           001D5C   386 	LINK=.
      009DDC 07                     387 	.byte 7 
      009DDD 57 52 2D 57 4F 52 44   388 	.ascii "WR-WORD" 
      009DE4                        389 WR_WORD:
      009DE4 CD 84 E3         [ 4]  390 	call FC_XOFF
      009DE7 90 93            [ 1]  391 	ldw y,x
      009DE9 90 FE            [ 2]  392 	ldw y,(y)
      009DEB 1C 00 02         [ 2]  393 	addw x,#CELLL 
      009DEE 90 9E            [ 1]  394 	ld a,yh 
      009DF0 92 BD 00 34      [ 4]  395 	ldf [FPTR],a
      009DF4 72 05 50 5F FB   [ 2]  396 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009DF9 CD 9D 50         [ 4]  397 	call INC_FPTR 
      009DFC 90 9F            [ 1]  398 	ld a,yl 
      009DFE 92 BD 00 34      [ 4]  399 	ldf [FPTR],a
      009E02 72 05 50 5F FB   [ 2]  400 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009E07 CD 84 CD         [ 4]  401 	call FC_XON
      009E0A CC 9D 50         [ 2]  402 	jp INC_FPTR 
                                    403 
                                    404 
                                    405 ;---------------------------------------
                                    406 ; write a byte to FLASH or EEPROM/OPTION  
                                    407 ; EEC!  (c ud -- )
                                    408 ;---------------------------------------
      009E0D 9D DC                  409     .word LINK 
                           001D8F   410 	LINK=.
      009E0F 04                     411     .byte 4 
      009E10 45 45 43 21            412     .ascii "EEC!"
                                    413 	; local variables 
                           000001   414 	BTW = 1   ; byte to write offset on stack
                           000002   415     OPT = 2 
                           000002   416 	VSIZE = 2
      009E14                        417 EECSTORE:
      009E14 52 02            [ 2]  418 	sub sp,#VSIZE
      009E16 CD 9B D6         [ 4]  419     call FPSTOR
      009E19 E6 01            [ 1]  420 	ld a,(1,x)
      009E1B 43               [ 1]  421 	cpl a 
      009E1C 6B 01            [ 1]  422 	ld (BTW,sp),a ; byte to write 
      009E1E 0F 02            [ 1]  423 	clr (OPT,sp)  ; OPTION flag
      009E20 CD 9D 14         [ 4]  424 	call UNLOCK 
                                    425 	; check if option
      009E23 3D 34            [ 1]  426 	tnz FPTR 
      009E25 26 19            [ 1]  427 	jrne 2$
      009E27 90 BE 35         [ 2]  428 	ldw y,PTR16 
      009E2A 90 A3 48 00      [ 2]  429 	cpw y,#OPTION_BASE
      009E2E 2B 10            [ 1]  430 	jrmi 2$
      009E30 90 A3 48 80      [ 2]  431 	cpw y,#OPTION_END+1
      009E34 2A 0A            [ 1]  432 	jrpl 2$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]



      009E36 03 02            [ 1]  433 	cpl (OPT,sp)
                                    434 	; OPTION WRITE require this UNLOCK 
      009E38 72 1E 50 5B      [ 1]  435     bset FLASH_CR2,#FLASH_CR2_OPT
      009E3C 72 1F 50 5C      [ 1]  436     bres FLASH_NCR2,#FLASH_CR2_OPT 
      009E40                        437 2$: 
      009E40 CD 9D BF         [ 4]  438 	call WR_BYTE 	
      009E43 0D 02            [ 1]  439 	tnz (OPT,sp)
      009E45 27 0D            [ 1]  440 	jreq 3$ 
      009E47 7B 01            [ 1]  441     ld a,(BTW,sp)
      009E49 90 5F            [ 1]  442     clrw y
      009E4B 90 97            [ 1]  443 	ld yl,a 
      009E4D 1D 00 02         [ 2]  444 	subw x,#CELLL 
      009E50 FF               [ 2]  445 	ldw (x),y 
      009E51 CD 9D BF         [ 4]  446 	call WR_BYTE
      009E54                        447 3$: 
      009E54 CD 9D 3C         [ 4]  448 	call LOCK 
      009E57 5B 02            [ 2]  449 	addw sp,#VSIZE 
      009E59 81               [ 4]  450     ret
                                    451 
                                    452 ;------------------------------
                                    453 ; write integer in FLASH|EEPROM
                                    454 ; EE! ( n ud -- )
                                    455 ;------------------------------
      009E5A 9E 0F                  456 	.word LINK 
                           001DDC   457 	LINK=.
      009E5C 03                     458 	.byte 3 
      009E5D 45 45 21               459 	.ascii "EE!"
      009E60                        460 EESTORE:
      009E60 CD 9B D6         [ 4]  461 	call FPSTOR 
      009E63 CD 9D 14         [ 4]  462 	call UNLOCK 
      009E66 90 93            [ 1]  463 	ldw y,x 
      009E68 90 FE            [ 2]  464 	ldw y,(y)
      009E6A 90 89            [ 2]  465 	pushw y 
      009E6C 90 5E            [ 1]  466 	swapw y 
      009E6E FF               [ 2]  467 	ldw (x),y 
      009E6F CD 9D BF         [ 4]  468 	call WR_BYTE 
      009E72 90 85            [ 2]  469 	popw y 
      009E74 1D 00 02         [ 2]  470 	subw x,#CELLL
      009E77 FF               [ 2]  471 	ldw (x),y 
      009E78 CD 9D BF         [ 4]  472 	call WR_BYTE
      009E7B CC 9D 3C         [ 2]  473 	jp LOCK 
                                    474 
                                    475 
                                    476 ;----------------------------
                                    477 ; Erase flash memory row 
                                    478 ; stm8s208 as 128 bytes rows
                                    479 ; ROW-ERASE ( ud -- )
                                    480 ;----------------------------
      009E7E 9E 5C                  481 	.word LINK 
                           001E00   482 	LINK=. 
      009E80 09                     483 	.byte 9 
      009E81 52 4F 57 2D 45 52 41   484 	.ascii "ROW-ERASE" 
             53 45
      009E8A                        485 row_erase:
      009E8A CD 84 E3         [ 4]  486 	call FC_XOFF
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
Hexadecimal [24-Bits]



      009E8D CD 9B D6         [ 4]  487 	call FPSTOR
                                    488 ;code must be execute from RAM 
                                    489 ;copy routine to PAD 
      009E90 1D 00 02         [ 2]  490 	subw x,#CELLL 
      009E93 90 AE 9E E3      [ 2]  491 	ldw y,#row_erase_proc
      009E97 FF               [ 2]  492 	ldw (x),y 
      009E98 CD 8D 3C         [ 4]  493 	call PAD 
      009E9B 90 AE 9F 0A      [ 2]  494 	ldw y,#row_erase_proc_end 
      009E9F 72 A2 9E E3      [ 2]  495 	subw y,#row_erase_proc
      009EA3 1D 00 02         [ 2]  496 	subw x,#CELLL 
      009EA6 FF               [ 2]  497 	ldw (x),y 
      009EA7 CD 8D 78         [ 4]  498 	call CMOVE 
      009EAA                        499 block_erase:
      009EAA 90 BE 35         [ 2]  500 	ldw y,FPTR+1
      009EAD 90 A3 B4 00      [ 2]  501 	cpw y,#app_space 
      009EB1 2A 19            [ 1]  502 	jrpl erase_flash 
                                    503 ; erase EEPROM block
      009EB3 90 A3 40 00      [ 2]  504 	cpw y,#EEPROM_BASE 
      009EB7 24 04            [ 1]  505 	jruge 1$
      009EB9 CD 84 CD         [ 4]  506 	call FC_XON
      009EBC 81               [ 4]  507 	ret ; bad address 
      009EBD 90 A3 47 FF      [ 2]  508 1$: cpw y,#EEPROM_END 
      009EC1 23 04            [ 2]  509 	jrule 2$ 
      009EC3 CD 84 CD         [ 4]  510 	call FC_XON
      009EC6 81               [ 4]  511 	ret ; bad address 
      009EC7                        512 2$:	
      009EC7 CD 9C D6         [ 4]  513 	call UNLKEE 
      009ECA 20 03            [ 2]  514 	jra proceed_erase
                                    515 ; erase flash block:
      009ECC                        516 erase_flash:
      009ECC CD 9C F5         [ 4]  517 	call UNLKFL 
      009ECF                        518 proceed_erase:
      009ECF CD 8D 3C         [ 4]  519 	call PAD 
      009ED2 90 93            [ 1]  520 	ldw y,x
      009ED4 90 FE            [ 2]  521 	ldw y,(y)
      009ED6 1C 00 02         [ 2]  522 	addw x,#CELLL  
      009ED9 90 FD            [ 4]  523 	call (y) 
      009EDB 72 17 50 5F      [ 1]  524 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      009EDF CD 84 CD         [ 4]  525 	call FC_XON
      009EE2 81               [ 4]  526 	ret 
                                    527 
                                    528 ; this routine is to be copied to PAD 
      009EE3                        529 row_erase_proc:
      009EE3 35 20 50 5B      [ 1]  530 	mov FLASH_CR2,#(1<<FLASH_CR2_ERASE) 
      009EE7 35 DF 50 5C      [ 1]  531 	mov FLASH_NCR2,#~(1<<FLASH_CR2_ERASE)
      009EEB 4F               [ 1]  532 	clr a 
      009EEC 90 5F            [ 1]  533 	clrw y 
      009EEE 91 A7 00 34      [ 1]  534 	ldf ([FPTR],y),a
      009EF2 90 5C            [ 1]  535     incw y
      009EF4 91 A7 00 34      [ 1]  536 	ldf ([FPTR],y),a
      009EF8 90 5C            [ 1]  537     incw y
      009EFA 91 A7 00 34      [ 1]  538 	ldf ([FPTR],y),a
      009EFE 90 5C            [ 1]  539     incw y
      009F00 91 A7 00 34      [ 1]  540 	ldf ([FPTR],y),a
      009F04 72 05 50 5F FB   [ 2]  541 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
Hexadecimal [24-Bits]



      009F09 81               [ 4]  542 	ret
      009F0A                        543 row_erase_proc_end:
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
      009F0A                        556 copy_buffer:
      009F0A 4B 80            [ 1]  557 	push #BLOCK_SIZE  
                                    558 ;enable block programming 
      009F0C 72 10 50 5B      [ 1]  559 	bset FLASH_CR2,#FLASH_CR2_PRG 
      009F10 72 11 50 5C      [ 1]  560 	bres FLASH_NCR2,#FLASH_CR2_PRG
      009F14 90 5F            [ 1]  561 	clrw y
      009F16 F6               [ 1]  562 1$:	ld a,(x)
      009F17 91 A7 00 34      [ 1]  563 	ldf ([FPTR],y),a
      009F1B 5C               [ 1]  564 	incw x 
      009F1C 90 5C            [ 1]  565 	incw y 
      009F1E 0A 01            [ 1]  566 	dec (BCNT,sp)
      009F20 26 F4            [ 1]  567 	jrne 1$
                                    568 ; wait EOP bit 
      009F22 72 05 50 5F FB   [ 2]  569 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. 
      009F27 84               [ 1]  570 	pop a ; remove BCNT from stack 
      009F28 81               [ 4]  571 	ret 
      009F29                        572 copy_buffer_end:
                                    573 
                                    574 ;-------------------------
                                    575 ; move program_row to RAM 
                                    576 ; in TIB 
                                    577 ;------------------------
      009F29                        578 copy_prog_to_ram:
      009F29 1D 00 06         [ 2]  579 	subw x,#6
      009F2C 90 AE 9F 0A      [ 2]  580 	ldw y,#copy_buffer 
      009F30 EF 04            [ 2]  581 	ldw (4,x),y 
      009F32 90 AE 17 00      [ 2]  582 	ldw y,#TIBBASE
      009F36 EF 02            [ 2]  583 	ldw (2,x),y 
      009F38 90 AE 9F 29      [ 2]  584 	ldw y,#copy_buffer_end 
      009F3C 72 A2 9F 0A      [ 2]  585 	subw y,#copy_buffer  
      009F40 FF               [ 2]  586 	ldw (x),y 
      009F41 CD 8D 78         [ 4]  587 	call CMOVE 
      009F44 81               [ 4]  588 	ret 
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



      009F45 9E 80                  597 	.word LINK 
                           001EC7   598 	LINK=.
      009F47 06                     599 	.byte 6 
      009F48 57 52 2D 52 4F 57      600 	.ascii "WR-ROW"
      009F4E                        601 write_row:
      009F4E CD 84 E3         [ 4]  602 	call FC_XOFF
      009F51 CD 9B D6         [ 4]  603 	call FPSTOR
                                    604 ; align to FLASH block 
      009F54 A6 80            [ 1]  605 	ld a,#0x80 
      009F56 B4 36            [ 1]  606 	and a,PTR8 
      009F58 B7 36            [ 1]  607 	ld PTR8,a  
      009F5A CD 9F 29         [ 4]  608 	call copy_prog_to_ram
      009F5D CD 9D 14         [ 4]  609 	call UNLOCK
      009F60 90 93            [ 1]  610 	ldw y,x 
      009F62 90 FE            [ 2]  611 	ldw y,(y)
      009F64 1C 00 02         [ 2]  612 	addw x,#CELLL 
      009F67 89               [ 2]  613 	pushw x 
      009F68 93               [ 1]  614 	ldw x,y ; buffer address in x 
      009F69 CD 17 00         [ 4]  615 	call TIBBASE
      009F6C CD 9D 3C         [ 4]  616 	call LOCK
      009F6F 85               [ 2]  617 	popw x 
      009F70 CD 84 CD         [ 4]  618 	call FC_XON 
      009F73 81               [ 4]  619 	ret 
                                    620 
                                    621 ;-------------------------------------
                                    622 ; change value of OPTION register 
                                    623 ; SET-OPT (c n -- ) 
                                    624 ; c new value.
                                    625 ; n OPT  number {1..7}
                                    626 ;--------------------------------------
      009F74 9F 47                  627 		.word LINK 
                           001EF6   628 		LINK=.
      009F76 07                     629 		.byte 7 
      009F77 53 45 54 2D 4F 50 54   630 		.ascii "SET-OPT" 
      009F7E                        631 set_option: 
      009F7E 90 93            [ 1]  632 		ldw y,x 
      009F80 90 FE            [ 2]  633 		ldw y,(y)
      009F82 27 06            [ 1]  634 		jreq 1$
      009F84 90 A3 00 07      [ 2]  635 		cpw y,#7 
      009F88 23 04            [ 2]  636 		jrule 2$ 
                                    637 ; invalid OPTION number 		
      009F8A 1C 00 04         [ 2]  638 1$:		addw x,#2*CELLL
      009F8D 81               [ 4]  639 		ret
      009F8E 90 58            [ 2]  640 2$:		sllw y 
      009F90 72 A9 47 FF      [ 2]  641 		addw y,#OPTION_BASE-1
      009F94 FF               [ 2]  642 		ldw (x),y 
      009F95 1D 00 02         [ 2]  643 		subw x,#CELLL 
      009F98 90 5F            [ 1]  644 		clrw y 
      009F9A FF               [ 2]  645 		ldw (x),y 
      009F9B CD 9E 14         [ 4]  646 		call EECSTORE
      009F9E 81               [ 4]  647 		ret 
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
      009F9F 9F 76                  656 	.word LINK  
                           001F21   657 	LINK=.
      009FA1 08                     658 	.byte 8 
      009FA2 50 52 49 53 54 49 4E   659 	.ascii "PRISTINE"
             45
      009FAA                        660 pristine:
                                    661 ;;; erase EEPROM
      009FAA CD 9B F5         [ 4]  662 	call EEPROM 
      009FAD CD 88 B1         [ 4]  663 1$:	call DDUP 
      009FB0 CD 9E 8A         [ 4]  664 	call row_erase
      009FB3 90 93            [ 1]  665 	ldw y,x 
      009FB5 90 EE 02         [ 2]  666 	ldw y,(2,y)
      009FB8 72 A9 00 80      [ 2]  667 	addw y,#BLOCK_SIZE
      009FBC EF 02            [ 2]  668 	ldw (2,x),y
      009FBE 90 A3 48 00      [ 2]  669 	cpw y,#OPTION_BASE 
      009FC2 25 E9            [ 1]  670 	jrult 1$
                                    671 ;;; reset OPTION to default values
      009FC4 90 AE 00 01      [ 2]  672 	ldw y,#1 ; OPT1 
      009FC8 FF               [ 2]  673 2$:	ldw (x),y   
      009FC9 90 5F            [ 1]  674 	clrw y 
      009FCB EF 02            [ 2]  675 	ldw (2,x),y  ; ( 0 1 -- ) 
      009FCD CD 88 B1         [ 4]  676 	call DDUP    ; ( 0 1 0 1 -- )  
      009FD0 CD 9F 7E         [ 4]  677 	call set_option
      009FD3 90 93            [ 1]  678 	ldw y,x 
      009FD5 90 FE            [ 2]  679 	ldw y,(y)
      009FD7 90 5C            [ 1]  680 	incw y  ; next OPTION 
      009FD9 90 A3 00 08      [ 2]  681 	cpw y,#8 
      009FDD 25 E9            [ 1]  682 	jrult 2$
                                    683 ;;; erase first row of app_space 	
      009FDF 90 AE B4 00      [ 2]  684 	ldw y,#app_space
      009FE3 EF 02            [ 2]  685 	ldw (2,x),y  
      009FE5 90 5F            [ 1]  686 	clrw y 
      009FE7 FF               [ 2]  687 	ldw (x),y ; ( app_space 0 -- )
      009FE8 CD 9E 8A         [ 4]  688 	call row_erase 
                                    689 ; reset interrupt vectors 
      009FEB 1D 00 02         [ 2]  690 	subw x,#CELLL 
      009FEE 90 5F            [ 1]  691 	clrw y  
      009FF0 FF               [ 2]  692 4$:	ldw (x),y  ; ( n -- ) int# 
      009FF1 CD 86 A1         [ 4]  693 	call DUPP  
      009FF4 CD A0 11         [ 4]  694 	call reset_vector
      009FF7 90 93            [ 1]  695 	ldw y,x 
      009FF9 90 FE            [ 2]  696 	ldw y,(y)
      009FFB 90 5C            [ 1]  697 	incw y   ; next vector 
      009FFD 90 A3 00 19      [ 2]  698 	cpw y,#25 
      00A001 25 ED            [ 1]  699 	jrult 4$
      00A003 CC 80 80         [ 2]  700 	jp NonHandledInterrupt ; reset MCU
                                    701 
                                    702 ;------------------------------
                                    703 ; reset an interrupt vector 
                                    704 ; to its initial value 
                                    705 ; i.e. NonHandledInterrupt
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]



                                    706 ; RST-IVEC ( n -- )
                                    707 ;-----------------------------
      00A006 9F A1                  708 	.word LINK 
                           001F88   709 	LINK=. 
      00A008 08                     710 	.byte 8 
      00A009 52 53 54 2D 49 56 45   711 	.ascii "RST-IVEC"
             43
      00A011                        712 reset_vector:
      00A011 90 93            [ 1]  713 	ldw y,x
      00A013 1C 00 02         [ 2]  714 	addw x,#CELLL 
      00A016 90 FE            [ 2]  715 	ldw y,(y)
      00A018 90 A3 00 17      [ 2]  716 	cpw y,#23 
      00A01C 27 3A            [ 1]  717 	jreq 9$
      00A01E 90 A3 00 1D      [ 2]  718 	cpw y,#29 ; last vector
      00A022 22 34            [ 1]  719 	jrugt 9$  
      00A024 90 58            [ 2]  720 	sllw y 
      00A026 90 58            [ 2]  721 	sllw y 
      00A028 72 A9 80 08      [ 2]  722 	addw y,#0x8008 ; irq0 address 
      00A02C 90 BF 26         [ 2]  723 	ldw YTEMP,y
      00A02F 1D 00 06         [ 2]  724 	subw x,#3*CELLL 
      00A032 EF 02            [ 2]  725 	ldw (2,x),y 
      00A034 90 5F            [ 1]  726 	clrw y
      00A036 FF               [ 2]  727 	ldw (x),y 
      00A037 A6 82            [ 1]  728 	ld a,#0x82 
      00A039 90 95            [ 1]  729 	ld yh,a
      00A03B EF 04            [ 2]  730 	ldw (4,x),y
      00A03D CD 9E 60         [ 4]  731 	call EESTORE
      00A040 1D 00 06         [ 2]  732 	subw x,#3*CELLL
      00A043 90 5F            [ 1]  733 	clrw y 
      00A045 FF               [ 2]  734 	ldw (x),y 
      00A046 90 AE 80 80      [ 2]  735 	ldw y,#NonHandledInterrupt
      00A04A EF 04            [ 2]  736 	ldw (4,x),y 
      00A04C 90 BE 26         [ 2]  737 	ldw y,YTEMP  
      00A04F 72 A9 00 02      [ 2]  738 	addw y,#2
      00A053 EF 02            [ 2]  739 	ldw (2,x),y 
      00A055 CD 9E 60         [ 4]  740 	call EESTORE
      00A058 81               [ 4]  741 9$:	ret 
                                    742 
                                    743 
                                    744 ;------------------------------
                                    745 ; all interrupt vector with 
                                    746 ; an address >= a are resetted 
                                    747 ; to default
                                    748 ; CHKIVEC ( a -- )
                                    749 ;------------------------------
      00A059 A0 08                  750 	.word LINK 
                           001FDB   751 	LINK=.
      00A05B 07                     752 	.byte 7
      00A05C 43 48 4B 49 56 45 43   753 	.ascii "CHKIVEC"
                                    754 ;local variables 
                           000001   755 	SSP=1
                           000003   756 	CADR=3
                           000005   757 	OFS=5
                           000006   758 	VSIZE=6  
      00A063                        759 CHKIVEC:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 118.
Hexadecimal [24-Bits]



      00A063 52 06            [ 2]  760 	sub sp,#VSIZE ;alloc local variables 
      00A065 90 93            [ 1]  761 	ldw y,x 
      00A067 90 FE            [ 2]  762 	ldw y,(y)
      00A069 17 03            [ 2]  763 	ldw (CADR,sp),y ; ca 
      00A06B 1F 01            [ 2]  764 	ldw (SSP,sp),x 
      00A06D AE 80 0A         [ 2]  765 	ldw x,#0x800a ; irq0 address 
      00A070 BF 35            [ 2]  766 	ldw PTR16,X
      00A072 AE FF FC         [ 2]  767 	ldw x,#-4 
      00A075 1C 00 04         [ 2]  768 1$:	addw x,#4
      00A078 A3 00 78         [ 2]  769 	cpw x,#30*4 ; irq0-29 
      00A07B 27 22            [ 1]  770 	jreq 9$
      00A07D 90 93            [ 1]  771 	ldw y,x  
      00A07F 91 D6 35         [ 4]  772 	ld a,([PTR16],y)
      00A082 11 03            [ 1]  773 	cp a,(CADR,sp)
      00A084 25 EF            [ 1]  774 	jrult 1$
      00A086 90 5C            [ 1]  775 	incw y 
      00A088 91 D6 35         [ 4]  776 	ld a,([PTR16],y)
      00A08B 11 04            [ 1]  777 	cp a,(CADR+1,sp) 
      00A08D 25 E6            [ 1]  778 	jrult 1$ 
      00A08F 1F 05            [ 2]  779 	ldw (OFS,sp),x 
      00A091 54               [ 2]  780 	srlw x
      00A092 54               [ 2]  781 	srlw x 
      00A093 90 93            [ 1]  782 	ldw y,x 
      00A095 1E 01            [ 2]  783 	ldw x,(SSP,sp)
      00A097 FF               [ 2]  784 	ldw (x),y
      00A098 CD A0 11         [ 4]  785 	call reset_vector
      00A09B 1E 05            [ 2]  786 	ldw x,(OFS,sp) 
      00A09D 20 D6            [ 2]  787 	jra 1$
      00A09F 1E 01            [ 2]  788 9$:	ldw x,(SSP,sp) 
      00A0A1 1C 00 02         [ 2]  789 	addw x,#CELLL 
      00A0A4 5B 06            [ 2]  790 	addw sp,#VSIZE ; drop local variables  
      00A0A6 81               [ 4]  791 	ret 
                                    792 
                                    793 ;------------------------------
                                    794 ; set interrupt vector 
                                    795 ; SET-IVEC ( ud n -- )
                                    796 ;  ud Handler address
                                    797 ;  n  vector # 0 .. 29 
                                    798 ;-----------------------------
      00A0A7 A0 5B                  799 	.word LINK
                           002029   800 	LINK=.
      00A0A9 08                     801 	.byte 8 
      00A0AA 53 45 54 2D 49 56 45   802 	.ascii "SET-IVEC" 
             43
      00A0B2                        803 set_vector:
      00A0B2 90 93            [ 1]  804     ldw y,x 
      00A0B4 1C 00 02         [ 2]  805 	addw x,#CELLL 
      00A0B7 90 FE            [ 2]  806 	ldw y,(y) ; vector #
      00A0B9 90 A3 00 1D      [ 2]  807 	cpw y,#29 ; last vector
      00A0BD 23 04            [ 2]  808 	jrule 2$
      00A0BF 1C 00 04         [ 2]  809 	addw x,#2*CELLL 
      00A0C2 81               [ 4]  810 	ret
      00A0C3 90 58            [ 2]  811 2$:	sllw y 
      00A0C5 90 58            [ 2]  812 	sllw y 
      00A0C7 72 A9 80 08      [ 2]  813 	addw y,#0X8008 ; IRQ0 vector address 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 119.
Hexadecimal [24-Bits]



      00A0CB 90 BF 26         [ 2]  814 	ldw YTEMP,y ; vector address 
      00A0CE A6 82            [ 1]  815 	ld a,#0x82 
      00A0D0 90 95            [ 1]  816 	ld yh,a 
      00A0D2 E6 01            [ 1]  817 	ld a,(1,x) ; isr address bits 23..16 
      00A0D4 90 97            [ 1]  818 	ld yl,a 
                                    819 ;  write 0x82 + most significant byte of int address	
      00A0D6 1D 00 06         [ 2]  820 	subw x,#3*CELLL 
      00A0D9 EF 04            [ 2]  821 	ldw (4,x),y 
      00A0DB 90 BE 26         [ 2]  822 	ldw y,YTEMP
      00A0DE EF 02            [ 2]  823 	ldw (2,x),y ; vector address 
      00A0E0 90 5F            [ 1]  824 	clrw y 
      00A0E2 FF               [ 2]  825 	ldw (x),y   ; as a double 
      00A0E3 CD 9E 60         [ 4]  826 	call EESTORE 
      00A0E6 90 93            [ 1]  827 	ldw y,x 
      00A0E8 90 EE 02         [ 2]  828 	ldw y,(2,y) ; bits 15..0 int vector 
      00A0EB 1D 00 06         [ 2]  829 	subw x,#3*CELLL 
      00A0EE EF 04            [ 2]  830 	ldw (4,x),y 
      00A0F0 90 BE 26         [ 2]  831 	ldw y,YTEMP 
      00A0F3 72 A9 00 02      [ 2]  832 	addw y,#2 
      00A0F7 EF 02            [ 2]  833 	ldw (2,x),y 
      00A0F9 90 5F            [ 1]  834 	clrw y 
      00A0FB FF               [ 2]  835 	ldw (x),y 
      00A0FC CD 9E 60         [ 4]  836 	call EESTORE
      00A0FF 1C 00 04         [ 2]  837 	addw x,#2*CELLL  
      00A102 81               [ 4]  838 9$: ret 
                                    839 
                                    840 
                                    841 ;------------------------
                                    842 ; Compile word to flash
                                    843 ; EE, (w -- )
                                    844 ;-----------------------
      00A103 A0 A9                  845 	.word LINK
                           002085   846 	LINK=.
      00A105 03                     847 	.byte 3
      00A106 45 45 2C               848 	.ascii "EE,"
      00A109                        849 EE_COMMA:
      00A109 1D 00 04         [ 2]  850 	subw x,#2*CELLL 
      00A10C 90 BE 1A         [ 2]  851 	ldw y,UCP
      00A10F 90 89            [ 2]  852 	pushw y 
      00A111 EF 02            [ 2]  853 	ldw (2,x),y 
      00A113 90 5F            [ 1]  854 	clrw y 
      00A115 FF               [ 2]  855 	ldw (x),y
      00A116 CD 9E 60         [ 4]  856 	call EESTORE
      00A119 90 85            [ 2]  857 	popw y 
      00A11B 72 A9 00 02      [ 2]  858 	addw y,#2
      00A11F 90 BF 1A         [ 2]  859 	ldw UCP,y
      00A122 81               [ 4]  860 	ret 
                                    861 
                                    862 
                                    863 ;-------------------------
                                    864 ; Compile byte to flash 
                                    865 ; EEC, ( c -- )	
                                    866 ;-------------------------
      00A123 A1 05                  867 	.word LINK 
                           0020A5   868 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 120.
Hexadecimal [24-Bits]



      00A125 04                     869 	.byte 4 
      00A126 45 45 43 2C            870 	.ascii "EEC,"
      00A12A                        871 EE_CCOMMA:
      00A12A 1D 00 04         [ 2]  872 	subw x,#2*CELLL 
      00A12D 90 BE 1A         [ 2]  873 	ldw y,UCP
      00A130 90 89            [ 2]  874 	pushw y 
      00A132 EF 02            [ 2]  875 	ldw (2,x),y 
      00A134 90 5F            [ 1]  876 	clrw y 
      00A136 FF               [ 2]  877 	ldw (x),y
      00A137 CD 9E 14         [ 4]  878 	call EECSTORE
      00A13A 90 85            [ 2]  879 	popw y 
      00A13C 90 5C            [ 1]  880 	incw y 
      00A13E 90 BF 1A         [ 2]  881 	ldw UCP,y
      00A141 81               [ 4]  882 	ret 
                                    883 
                                    884 
                                    885 ;--------------------------
                                    886 ; copy FLASH block to ROWBUF
                                    887 ; ROW>BUF ( ud -- )
                                    888 ;--------------------------
      00A142 A1 25                  889 	.word LINK 
                           0020C4   890 	LINK=.
      00A144 07                     891 	.byte 7 
      00A145 52 4F 57 3E 42 55 46   892 	.ascii "ROW>BUF"
      00A14C                        893 ROW2BUF: 
      00A14C CD 9B D6         [ 4]  894 	call FPSTOR 
      00A14F A6 80            [ 1]  895 	ld a,#BLOCK_SIZE
      00A151 88               [ 1]  896 	push a 
      00A152 B4 36            [ 1]  897 	and a,PTR8 ; block align 
      00A154 B7 36            [ 1]  898 	ld PTR8,a
      00A156 90 AE 16 80      [ 2]  899 	ldw y,#ROWBUFF 
      00A15A 92 BC 00 34      [ 5]  900 1$: ldf a,[FPTR]
      00A15E 90 F7            [ 1]  901 	ld (y),a
      00A160 CD 9D 50         [ 4]  902 	call INC_FPTR
      00A163 90 5C            [ 1]  903 	incw y 
      00A165 0A 01            [ 1]  904 	dec (1,sp)
      00A167 26 F1            [ 1]  905 	jrne 1$ 
      00A169 84               [ 1]  906 	pop a 
      00A16A 81               [ 4]  907 	ret 
                                    908 
                                    909 
                                    910 ;---------------------------
                                    911 ; copy ROWBUFF to flash 
                                    912 ; BUF>ROW ( ud -- )
                                    913 ; ud is row address as double 
                                    914 ;---------------------------
      00A16B A1 44                  915 	.word LINK 
                           0020ED   916 	LINK=.
      00A16D 07                     917 	.byte 7 
      00A16E 42 55 46 3E 52 4F 57   918 	.ascii "BUF>ROW" 
      00A175                        919 BUF2ROW:
      00A175 CD 87 A5         [ 4]  920 	call TBUF ; ( ud rb -- )
      00A178 CD 88 65         [ 4]  921 	call ROT 
      00A17B CD 88 65         [ 4]  922 	call ROT  ; ( rb ud -- )
      00A17E CD 9F 4E         [ 4]  923 	call write_row 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 121.
Hexadecimal [24-Bits]



      00A181 81               [ 4]  924 	ret 
                                    925 
                                    926 ;---------------------------------
                                    927 ; how many byte free in that row 
                                    928 ; RFREE ( a -- n )
                                    929 ; a is least byte of target address
                                    930 ;----------------------------------
      00A182 A1 6D                  931 	.word LINK 
                           002104   932 	LINK=.
      00A184 05                     933 	.byte 5 
      00A185 52 46 52 45 45         934 	.ascii "RFREE"
      00A18A                        935 RFREE:
      00A18A E6 01            [ 1]  936 	ld a,(1,x)
      00A18C A4 7F            [ 1]  937 	and a,#BLOCK_SIZE-1 
      00A18E B7 26            [ 1]  938 	ld YTEMP,a 
      00A190 A6 80            [ 1]  939 	ld a,#BLOCK_SIZE 
      00A192 B0 26            [ 1]  940 	sub a,YTEMP 
      00A194 90 5F            [ 1]  941 	clrw y 
      00A196 90 97            [ 1]  942 	ld yl,a
      00A198 FF               [ 2]  943 	ldw (x),y 
      00A199 81               [ 4]  944 	ret 
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
      00A19A A1 84                  955 	.word LINK 
                           00211C   956 	LINK=. 
      00A19C 06                     957 	.byte 6
      00A19D 52 41 4D 3E 45 45      958 	.ascii "RAM>EE"
                                    959 	
      00A1A3                        960 RAM2EE:
                                    961 ; copy ud on top 
      00A1A3 90 93            [ 1]  962 	ldw y,x 
      00A1A5 90 EE 06         [ 2]  963 	ldw y,(6,y) ; LSW of ud  
      00A1A8 90 BF 26         [ 2]  964 	ldw YTEMP,y 
      00A1AB 90 93            [ 1]  965 	ldw y,x 
      00A1AD 90 EE 04         [ 2]  966 	ldw y,(4,y)  ; MSW of ud 
      00A1B0 1D 00 04         [ 2]  967 	subw x,#2*CELLL 
      00A1B3 FF               [ 2]  968 	ldw (x),y 
      00A1B4 90 BE 26         [ 2]  969 	ldw y,YTEMP 
      00A1B7 EF 02            [ 2]  970 	ldw (2,x),y 
      00A1B9 CD A1 4C         [ 4]  971 	call ROW2BUF 
      00A1BC 90 93            [ 1]  972 	ldw y,x 
      00A1BE 90 EE 06         [ 2]  973 	ldw y,(6,y)
      00A1C1 90 89            [ 2]  974 	pushw y ; udl 
      00A1C3 90 9F            [ 1]  975 	ld a,yl
      00A1C5 A4 7F            [ 1]  976 	and a,#BLOCK_SIZE-1 
      00A1C7 90 5F            [ 1]  977 	clrw y 
      00A1C9 90 97            [ 1]  978 	ld yl,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 122.
Hexadecimal [24-Bits]



      00A1CB 72 A9 16 80      [ 2]  979 	addw y,#ROWBUFF 
      00A1CF 1D 00 02         [ 2]  980 	subw x,#CELLL 
      00A1D2 FF               [ 2]  981 	ldw (x),y  
      00A1D3 CD 86 B1         [ 4]  982 	call SWAPP ;  ( ud a ra u -- )
      00A1D6 CD 85 B4         [ 4]  983 	call RFROM  
      00A1D9 CD A1 8A         [ 4]  984 	call RFREE 
      00A1DC CD 8A 1D         [ 4]  985 	call MIN
      00A1DF CD 86 A1         [ 4]  986 	call DUPP 
      00A1E2 CD 86 6A         [ 4]  987 	call TOR  
      00A1E5 CD 8D 78         [ 4]  988 	call CMOVE
      00A1E8 CD A1 75         [ 4]  989 	call BUF2ROW 
      00A1EB CD 85 B4         [ 4]  990 	call RFROM 
      00A1EE 81               [ 4]  991 	ret 
                                    992 
                                    993 
                                    994 ;--------------------------
                                    995 ; expand 16 bit address 
                                    996 ; to 32 bit address 
                                    997 ; FADDR ( a -- ud )
                                    998 ;--------------------------
      00A1EF A1 9C                  999 	.word LINK 
                           002171  1000 	LINK=. 
      00A1F1 05                    1001 	.byte 5 
      00A1F2 46 41 44 44 52        1002 	.ascii "FADDR"
      00A1F7                       1003 FADDR:
      00A1F7 CC 8C 4E         [ 2] 1004 	jp ZERO 
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
      00A1FA A1 F1                 1020 	.word LINK 
                           00217C  1021 	LINK=.
      00A1FC 05                    1022 	.byte 5 
      00A1FD 46 4D 4F 56 45        1023 	.ascii "FMOVE" 
      00A202                       1024 FMOVE:
      00A202 CD 87 B7         [ 4] 1025 	call TFLASH 
      00A205 CD 85 63         [ 4] 1026 	CALL AT 
      00A208 CD 85 18         [ 4] 1027 	CALL QBRAN 
      00A20B A2 86                 1028 	.word no_move  
      00A20D CD 88 06         [ 4] 1029 	call CPP
      00A210 CD 85 63         [ 4] 1030 	call AT  
      00A213 CD 86 A1         [ 4] 1031 	call DUPP ; ( udl udl -- )
      00A216 CD 87 EA         [ 4] 1032 	call CNTXT 
      00A219 CD 85 63         [ 4] 1033 	call AT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 123.
Hexadecimal [24-Bits]



      00A21C CD 84 EF         [ 4] 1034 	call DOLIT 
      00A21F 00 02                 1035 	.word 2 
      00A221 CD 89 3D         [ 4] 1036 	call SUBB ; ( udl udl a -- )
      00A224 CD 86 B1         [ 4] 1037 	call SWAPP 
      00A227 CD A1 F7         [ 4] 1038 	call FADDR 
      00A22A CD 88 65         [ 4] 1039 	call ROT  ; ( udl ud a -- )
      00A22D CD 86 A1         [ 4] 1040 	call DUPP 
      00A230 CD 86 6A         [ 4] 1041 	call TOR    ; R: a 
      00A233                       1042 FMOVE2: 
      00A233 CD 8D 2B         [ 4] 1043 	call HERE 
      00A236 CD 85 C5         [ 4] 1044 	call RAT 
      00A239 CD 89 3D         [ 4] 1045 	call SUBB ; (udl ud a wl -- )
      00A23C                       1046 next_row:
      00A23C CD 86 A1         [ 4] 1047 	call DUPP 
      00A23F CD 86 6A         [ 4] 1048 	call TOR  ; ( udl ud a wl -- ) R: a wl
      00A242 CD A1 A3         [ 4] 1049 	call RAM2EE ; ( udl a u -- udl u2 ) u2 is byte written to FLASH 
      00A245 CD 86 A1         [ 4] 1050 	call DUPP 
      00A248 CD 86 6A         [ 4] 1051 	call TOR
      00A24B CD 88 C6         [ 4] 1052 	call PLUS  ; ( udl+ ) 
      00A24E CD 86 A1         [ 4] 1053 	call DUPP 
      00A251 CD 8C 4E         [ 4] 1054 	call ZERO   ; ( udl+ ud -- )
      00A254 CD 85 B4         [ 4] 1055 	call RFROM  ; ( udl+ ud u2  R: a wl ) 
      00A257 CD 85 B4         [ 4] 1056 	call RFROM  ; ( udl+ ud u2 wl R: a ) 
      00A25A CD 86 C9         [ 4] 1057 	call OVER   ; ( udl+ ud u2 wl u2 -- )
      00A25D CD 89 3D         [ 4] 1058 	call SUBB  ; ( udl+ ud u2 wl- R: a )
      00A260 CD 86 A1         [ 4] 1059 	call DUPP 
      00A263 CD 85 18         [ 4] 1060 	call QBRAN
      00A266 A2 7F                 1061 	.word fmove_done 
      00A268 CD 86 B1         [ 4] 1062 	call SWAPP  ; ( udl+ ud wl- u2 R: a )
      00A26B CD 85 B4         [ 4] 1063 	call RFROM ; ( udl+ ud wl- u2 a -- ) 
      00A26E CD 88 C6         [ 4] 1064 	call PLUS  ; ( udl+2 ud wl- a+ )
      00A271 CD 86 A1         [ 4] 1065 	call DUPP 
      00A274 CD 86 6A         [ 4] 1066 	call TOR   ; ( udl+2 ud wl- a+ ) R: a+
      00A277 CD 86 B1         [ 4] 1067 	call SWAPP 
      00A27A CD 85 34         [ 4] 1068 	call BRAN
      00A27D A2 3C                 1069 	.word next_row  
      00A27F                       1070 fmove_done:	
      00A27F CD 85 B4         [ 4] 1071 	call RFROM  ; ( -- udl+ ud u2 wl- a  )
      00A282 1C 00 0A         [ 2] 1072 	addw x,#5*CELLL ; (  -- cp+ ) new CP 
      00A285 81               [ 4] 1073  	ret  
      00A286                       1074 no_move:
      00A286 CD 8C 4E         [ 4] 1075 	call ZERO
      00A289 81               [ 4] 1076 	ret 
                                   1077 
                                   1078 ;------------------------------------------
                                   1079 ; adjust pointers after **FMOVE** operetion.
                                   1080 ; UPDAT-PTR ( cp+ -- )
                                   1081 ; cp+ is new CP position after FMOVE 
                                   1082 ;-------------------------------------------
      00A28A A1 FC                 1083 	.word LINK 
                           00220C  1084 	LINK=.
      00A28C 09                    1085 	.byte 9
      00A28D 55 50 44 41 54 2D 50  1086 	.ascii "UPDAT-PTR" 
             54 52
      00A296                       1087 UPDATPTR:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 124.
Hexadecimal [24-Bits]



                                   1088 ;reset VP to previous position  
      00A296 CD 9C 50         [ 4] 1089 	call EEPVP 
      00A299 CD 86 97         [ 4] 1090 	call DROP 
      00A29C CD 85 63         [ 4] 1091 	call AT
      00A29F CD 87 F8         [ 4] 1092 	call VPP 
      00A2A2 CD 85 51         [ 4] 1093 	call STORE
                                   1094 ;update CONTEXT and LAST 
      00A2A5 CD 9C 3A         [ 4] 1095 	call EEPCP 
      00A2A8 CD 86 97         [ 4] 1096 	call DROP
      00A2AB CD 85 63         [ 4] 1097 	call AT
      00A2AE CD 84 EF         [ 4] 1098 	call DOLIT 
      00A2B1 00 02                 1099 	.word 2 
      00A2B3 CD 88 C6         [ 4] 1100 	call PLUS 
      00A2B6 CD 86 A1         [ 4] 1101 	call DUPP 
      00A2B9 CD 87 EA         [ 4] 1102 	call CNTXT 
      00A2BC CD 85 51         [ 4] 1103 	call STORE
      00A2BF CD 88 16         [ 4] 1104 	call LAST
      00A2C2 CD 85 51         [ 4] 1105 	call STORE 
      00A2C5 CD 9C 6A         [ 4] 1106 	call UPDATLAST 
                                   1107 ;update CP 
      00A2C8 CD 88 06         [ 4] 1108 	call CPP 
      00A2CB CD 85 51         [ 4] 1109 	call STORE
      00A2CE CD 9C 93         [ 4] 1110 	call UPDATCP 
      00A2D1 81               [ 4] 1111 	ret 
                                   1112 
                                   1113 ;-----------------------------
                                   1114 ; move interrupt sub-routine
                                   1115 ; in flash memory
                                   1116 ;----------------------------- 
      00A2D2 A2 8C                 1117 	.word LINK 
                           002254  1118 	LINK=. 
      00A2D4 06                    1119 	.byte 6
      00A2D5 49 46 4D 4F 56 45     1120 	.ascii "IFMOVE" 
      00A2DB                       1121 IFMOVE:
      00A2DB CD 87 B7         [ 4] 1122 	call TFLASH 
      00A2DE CD 85 63         [ 4] 1123 	CALL AT 
      00A2E1 CD 85 18         [ 4] 1124 	CALL QBRAN 
      00A2E4 A2 86                 1125 	.word no_move 
      00A2E6 CD 88 06         [ 4] 1126 	call CPP 
      00A2E9 CD 85 63         [ 4] 1127 	call AT 
      00A2EC CD 86 A1         [ 4] 1128 	call DUPP ; ( udl udl -- )
      00A2EF CD 9C 50         [ 4] 1129 	call EEPVP 
      00A2F2 CD 86 97         [ 4] 1130 	call DROP
      00A2F5 CD 85 63         [ 4] 1131 	call AT  ; ( udl udl a )
      00A2F8 CD 86 6A         [ 4] 1132 	call TOR 
      00A2FB CD A1 F7         [ 4] 1133 	call FADDR
      00A2FE CD 85 C5         [ 4] 1134 	call RAT ; ( udl ud a -- ) R: a 
      00A301 CC A2 33         [ 2] 1135 	jp FMOVE2 
                                   1136 
                                   1137 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 125.
Hexadecimal [24-Bits]



                           000001  4460 .if WANT_SCALING_CONST 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 126.
Hexadecimal [24-Bits]



                                   4461         .include "const_ratio.asm"
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
      00A304 A2 D4                   34         .word LINK 
                           002286    35         LINK=.
      00A306 02                      36         .byte 2
      00A307 50 49                   37         .ascii "PI" 
      00A309                         38 PII:
      00A309 1D 00 04         [ 2]   39         subw x,#2*CELLL 
      00A30C 90 AE 01 63      [ 2]   40         ldw y,#355 
      00A310 EF 02            [ 2]   41         ldw (2,x),y 
      00A312 90 AE 00 71      [ 2]   42         ldw y,#113 
      00A316 FF               [ 2]   43         ldw (x),y 
      00A317 81               [ 4]   44         ret 
                                     45 
                                     46 ;      SQRT2 ( -- 19601  13860 )
                                     47 ; precision: 1.5e-9 
                                     48 ; usage example to compute Voltage peek to peek from Vrms 
                                     49 ; : VPP SQRT2 */ 2 * ;
                                     50 ;
      00A318 A3 06                   51         .word LINK 
                           00229A    52         LINK=.
      00A31A 05                      53         .byte 5 
      00A31B 53 51 52 54 32          54         .ascii "SQRT2" 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 127.
Hexadecimal [24-Bits]



      00A320                         55 SQRT2:
      00A320 1D 00 04         [ 2]   56         subw x,#2*CELLL 
      00A323 90 AE 4C 91      [ 2]   57         ldw y,#19601 
      00A327 EF 02            [ 2]   58         ldw (2,x),y 
      00A329 90 AE 36 24      [ 2]   59         ldw y,#13860 
      00A32D FF               [ 2]   60         ldw (x),y 
      00A32E 81               [ 4]   61         ret 
                                     62 
                                     63 ;   SQRT3 ( -- 18817 10864 )
                                     64 ; precision: 1.1e-9
                                     65 ;
      00A32F A3 1A                   66         .word LINK 
                           0022B1    67         LINK=.
      00A331 05                      68         .byte 5
      00A332 53 51 52 54 33          69         .ascii "SQRT3" 
      00A337                         70 SQRT3: 
      00A337 1D 00 04         [ 2]   71     subw x,#2*CELLL 
      00A33A 90 AE 49 81      [ 2]   72     ldw y,#18817 
      00A33E EF 02            [ 2]   73     ldw (2,x),y 
      00A340 90 AE 2A 70      [ 2]   74     ldw y,#10864 
      00A344 FF               [ 2]   75     ldw (x),y 
      00A345 81               [ 4]   76     ret 
                                     77 
                                     78 ;   E ( -- 28667 10546 )
                                     79 ; precision: 5.5e-9 
                                     80 ; natural log base 
      00A346 A3 31                   81         .word LINK 
                           0022C8    82         LINK=.
      00A348 01                      83         .byte 1
      00A349 45                      84         .ascii "E" 
      00A34A                         85 ENEPER:
      00A34A 1D 00 04         [ 2]   86     subw x,#2*CELLL 
      00A34D 90 AE 6F FB      [ 2]   87     ldw y,#28667 
      00A351 EF 02            [ 2]   88     ldw (2,x),y 
      00A353 90 AE 29 32      [ 2]   89     ldw y,#10546 
      00A357 FF               [ 2]   90     ldw (x),y 
      00A358 81               [ 4]   91     ret 
                                     92 
                                     93 ;   SQRT10 ( -- 22936 7253 )
                                     94 ; precision: 5.7e-9 
      00A359 A3 48                   95         .word LINK 
                           0022DB    96         LINK=.
      00A35B 06                      97         .byte 6 
      00A35C 53 51 52 54 31 30       98         .ascii "SQRT10" 
      00A362                         99 SQRT10:
      00A362 1D 00 04         [ 2]  100     subw x,#2*CELLL
      00A365 90 AE 59 98      [ 2]  101     ldw y,#22936 
      00A369 EF 02            [ 2]  102     ldw (2,x),y 
      00A36B 90 AE 1C 55      [ 2]  103     ldw y,#7253
      00A36F FF               [ 2]  104     ldw (x),y 
      00A370 81               [ 4]  105     ret 
                                    106 
                                    107 ;   12RT2 ( -- 26797 25293 )
                                    108 ; precision: 1.0e-9 
                                    109 ; used in music to compute well tempered scale
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 128.
Hexadecimal [24-Bits]



      00A371 A3 5B                  110         .word LINK 
                           0022F3   111         LINK=. 
      00A373 05                     112         .byte 5 
      00A374 31 32 52 54 32         113         .ascii "12RT2"
      00A379                        114 RT12_2:
      00A379 1D 00 04         [ 2]  115     subw x,#2*CELLL 
      00A37C 90 AE 68 AD      [ 2]  116     ldw y,#26797
      00A380 EF 02            [ 2]  117     ldw (2,x),y 
      00A382 90 AE 62 CD      [ 2]  118     ldw y,#25293
      00A386 FF               [ 2]  119     ldw (x),y 
      00A387 81               [ 4]  120     ret 
                                    121 
                                    122 ;   LOG2s ( -- 2040 11103 )
                                    123 ; log(2)/1.6384
                                    124 ; precision: 1.1e-8
      00A388 A3 73                  125         .word LINK 
                           00230A   126         LINK=.
      00A38A 05                     127         .byte 5 
      00A38B 4C 4F 47 32 53         128         .ascii "LOG2S" 
      00A390                        129 LOG2S:
      00A390 1D 00 04         [ 2]  130     subw x,#2*CELLL
      00A393 90 AE 07 F8      [ 2]  131     ldw y,#2040 
      00A397 EF 02            [ 2]  132     ldw (2,x),y 
      00A399 90 AE 2B 5F      [ 2]  133     ldw y,#11103 
      00A39D FF               [ 2]  134     ldw (x),y 
      00A39E 81               [ 4]  135     ret 
                                    136 
                                    137 ;   LN2 ( -- 485 11464 )
                                    138 ; ln(2)/16.384 
                                    139 ; precision: 1.0e-7 
      00A39F A3 8A                  140         .word LINK 
                           002321   141         LINK=.
      00A3A1 04                     142         .byte 4 
      00A3A2 4C 4E 32 53            143         .ascii "LN2S" 
      00A3A6                        144 LN2S: 
      00A3A6 1D 00 04         [ 2]  145     subw x,#2*CELLL
      00A3A9 90 AE 01 E5      [ 2]  146     ldw y,#485
      00A3AD EF 02            [ 2]  147     ldw (2,x),y 
      00A3AF 90 AE 2C C8      [ 2]  148     ldw y,#11464 
      00A3B3 FF               [ 2]  149     ldw (x),y 
      00A3B4 81               [ 4]  150     ret 
                                    151 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 129.
Hexadecimal [24-Bits]



                                   4462 .endif
                           000001  4463 .if WANT_CONST_TABLE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 130.
Hexadecimal [24-Bits]



                                   4464         .include "ctable.asm"
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
      00A3B5 A3 A1                   34     .word LINK 
                           002337    35     LINK=.
      00A3B7 06                      36     .byte 6
      00A3B8 43 41 4C 4C 4F 54       37     .ascii "CALLOT"
      00A3BE                         38 CALLOT:
      00A3BE CD 88 06         [ 4]   39     CALL CPP
      00A3C1 CD 86 A1         [ 4]   40     CALL DUPP 
      00A3C4 CD 85 63         [ 4]   41     CALL AT 
      00A3C7 CD 86 6A         [ 4]   42     CALL TOR 
      00A3CA CD 8C BE         [ 4]   43     CALL PSTOR 
      00A3CD CD 9C 93         [ 4]   44     CALL UPDATCP 
      00A3D0 CD 85 B4         [ 4]   45     CALL RFROM
      00A3D3 CC 8C 4E         [ 2]   46     JP ZERO 
                                     47 
                                     48 ;------------------------------
                                     49 ; create constants bytes table 
                                     50 ; in persistant memory
                                     51 ;  CTABLE ( n+ -- ad ; <string> )
                                     52 ; n+ bytes reserved 
                                     53 ;-----------------------------
      00A3D6 A3 B7                   54     .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 131.
Hexadecimal [24-Bits]



                           002358    55     LINK=.
      00A3D8 06                      56     .byte 6
      00A3D9 43 54 41 42 4C 45       57     .ascii "CTABLE"
      00A3DF                         58 CTABLE:
      00A3DF CD A3 BE         [ 4]   59     CALL CALLOT     
      00A3E2 CC 99 95         [ 2]   60     JP DCONST 
                                     61      
                                     62 
                                     63 ;--------------------------------
                                     64 ; create constants words table 
                                     65 ; in persistant memory 
                                     66 ; WTABLE ( n+ -- ad ; <string> )
                                     67 ; n+  words reserved  
                                     68 ;--------------------------------
      00A3E5 A3 D8                   69     .word LINK 
                           002367    70     LINK=.
      00A3E7 06                      71     .byte 6
      00A3E8 57 54 41 42 4C 45       72     .ascii "WTABLE"
      00A3EE                         73 WTABLE:
      00A3EE CD 8B D5         [ 4]   74     CALL CELLS  
      00A3F1 CD A3 BE         [ 4]   75     CALL CALLOT 
      00A3F4 CC 99 95         [ 2]   76     JP DCONST 
                                     77 
                                     78 ;---------------------------------
                                     79 ; stack an element of CTABLE 
                                     80 ; CTABL@ ( u ad -- c )
                                     81 ; u element order {0..size-1}
                                     82 ; a|ad table address 
                                     83 ;--------------------------------
      00A3F7 A3 E7                   84     .word LINK 
                           002379    85     LINK=.
      00A3F9 06                      86     .byte 6
      00A3FA 43 54 41 42 4C 40       87     .ascii "CTABL@" 
      00A400                         88 CTAT:
      00A400 CD 9B D6         [ 4]   89     call FPSTOR 
      00A403 CD 9D 68         [ 4]   90     call PTRPLUS 
      00A406 CC 9D A5         [ 2]   91     jp EE_CREAD 
                                     92 
                                     93 ;---------------------------------
                                     94 ; stack an element of WTABLE 
                                     95 ; WTABL@ ( u ud -- w )
                                     96 ; u is element order {0..size-1}
                                     97 ; a|ud table address 
                                     98 ;----------------------------------
      00A409 A3 F9                   99     .word LINK 
                           00238B   100     LINK=.
      00A40B 06                     101     .byte 6
      00A40C 57 54 41 42 4C 40      102     .ascii "WTABL@" 
      00A412                        103 WTAT:
      00A412 CD 9B D6         [ 4]  104     call FPSTOR 
      00A415 CD 8B D5         [ 4]  105     call CELLS 
      00A418 CD 9D 68         [ 4]  106     call PTRPLUS 
      00A41B CD 9D 83         [ 4]  107     call EE_READ 
      00A41E 81               [ 4]  108     ret 
                                    109 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 132.
Hexadecimal [24-Bits]



                                    110 ;--------------------------
                                    111 ; tool to initialize character table 
                                    112 ; CTINIT ( ad -- )
                                    113 ; ad is table address 
                                    114 ;--------------------------
      00A41F A4 0B                  115     .word LINK 
                           0023A1   116     LINK=.
      00A421 06                     117     .byte 6 
      00A422 43 54 49 4E 49 54      118     .ascii "CTINIT"
      00A428                        119 CTINIT:
      00A428 CD 9B D6         [ 4]  120     CALL FPSTOR
      00A42B CD 9D 14         [ 4]  121     CALL UNLOCK
      00A42E CD 8C 4E         [ 4]  122     CALL ZERO 
      00A431 CD 8B E2         [ 4]  123 1$: CALL ONEP 
      00A434 CD 86 A1         [ 4]  124     CALL DUPP 
      00A437 CD A4 84         [ 4]  125     CALL INTQ 
      00A43A CD 85 18         [ 4]  126     CALL QBRAN 
      00A43D A4 47                  127     .word 2$
      00A43F CD 9D BF         [ 4]  128     call WR_BYTE 
      00A442 CD 85 34         [ 4]  129     CALL BRAN 
      00A445 A4 31                  130     .word 1$ 
      00A447 CD 88 A6         [ 4]  131 2$: CALL DDROP 
      00A44A CD 9D 3C         [ 4]  132     CALL LOCK 
      00A44D 81               [ 4]  133     ret 
                                    134 
                                    135 ;--------------------------
                                    136 ; tool to initialize word table 
                                    137 ; WTINIT ( ad -- )
                                    138 ; ad is table address 
                                    139 ;--------------------------
      00A44E A4 21                  140     .word LINK 
                           0023D0   141     LINK=.
      00A450 06                     142     .byte 6 
      00A451 57 54 49 4E 49 54      143     .ascii "WTINIT"
      00A457                        144 WTINIT:
      00A457 CD 9B D6         [ 4]  145     CALL FPSTOR
      00A45A CD 9D 14         [ 4]  146     CALL UNLOCK
      00A45D CD 8C 4E         [ 4]  147     CALL ZERO 
      00A460 CD 8B E2         [ 4]  148 1$: CALL ONEP 
      00A463 CD 86 A1         [ 4]  149     CALL DUPP
      00A466 CD A4 84         [ 4]  150     CALL INTQ
      00A469 CD 85 18         [ 4]  151     CALL QBRAN 
      00A46C A4 76                  152     .word 2$
      00A46E CD 9D E4         [ 4]  153     call WR_WORD 
      00A471 CD 85 34         [ 4]  154     CALL BRAN 
      00A474 A4 60                  155     .word 1$ 
      00A476 CD 88 A6         [ 4]  156 2$: CALL DDROP 
      00A479 CD 9D 3C         [ 4]  157     CALL LOCK 
      00A47C 81               [ 4]  158     ret 
                                    159 
                                    160 ;------------------------
                                    161 ; Prompted input for integer 
                                    162 ; display n+ in bracket and
                                    163 ; '?' 
                                    164 ; [N]? ( n+ -- a )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 133.
Hexadecimal [24-Bits]



                                    165 ;------------------------
      00A47D A4 50                  166     .word LINK 
                           0023FF   167     LINK=.
      00A47F 04                     168     .byte 4
      00A480 5B 4E 5D 3F            169     .ascii "[N]?" 
      00A484                        170 INTQ:
      00A484 CD 8F C6         [ 4]  171     CALL CR 
      00A487 CD 84 EF         [ 4]  172     call DOLIT 
      00A48A 00 5B                  173     .word '[
      00A48C CD 84 B6         [ 4]  174     CALL EMIT 
      00A48F CD 90 6D         [ 4]  175     CALL DOT 
      00A492 CD 8F F3         [ 4]  176     CALL  DOTQP
      00A495 03                     177     .byte 3
      00A496 5D 3F 20               178     .ascii "]? " 
      00A499 CD 93 FD         [ 4]  179     CALL QUERY 
      00A49C CD 92 28         [ 4]  180     call TOKEN 
      00A49F CC A5 2D         [ 2]  181     jp NUMBQ
                                    182 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 134.
Hexadecimal [24-Bits]



                                   4465 .endif
                           000001  4466 .if WANT_DOUBLE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 135.
Hexadecimal [24-Bits]



                                   4467         .include "double.asm"
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
      00A4A2                         30 nsign: ; a cntr -- a cntr f 
      00A4A2 CD 8C 4E         [ 4]   31     CALL ZERO 
      00A4A5 CD 86 6A         [ 4]   32     CALL TOR  ; R: sign 
      00A4A8 CD 86 6A         [ 4]   33     CALL TOR  ; R: sign cntr 
      00A4AB CD 86 A1         [ 4]   34     CALL DUPP 
      00A4AE CD 85 81         [ 4]   35     CALL CAT 
      002431                         36     _DOLIT '-'
      00A4B1 CD 84 EF         [ 4]    1     CALL DOLIT 
      00A4B4 00 2D                    2     .word '-' 
      00A4B6 CD 89 65         [ 4]   37     CALL EQUAL 
      002439                         38     _QBRAN nsign1 
      00A4B9 CD 85 18         [ 4]    1     CALL QBRAN
      00A4BC A4 D3                    2     .word nsign1
      00A4BE CD 8B E2         [ 4]   39     CALL ONEP ; a+ 
      00A4C1 CD 85 B4         [ 4]   40     CALL RFROM 
      00A4C4 CD 8B EF         [ 4]   41     CALL ONEM ; cntr-
      00A4C7 CD 85 B4         [ 4]   42     CALL RFROM ; sign 
      00A4CA CD 88 E0         [ 4]   43     CALL INVER ; -1
      00A4CD CD 86 6A         [ 4]   44     CALL TOR   ; R: sign 
      00A4D0 CD 86 6A         [ 4]   45     CALL TOR   ; R: cntr 
      00A4D3                         46 nsign1:
      00A4D3 CD 85 B4         [ 4]   47     CALL RFROM 
      00A4D6 CD 85 B4         [ 4]   48     CALL RFROM 
      00A4D9 81               [ 4]   49     RET 
                                     50 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 136.
Hexadecimal [24-Bits]



                                     51 
                                     52 ; get all digits in row 
                                     53 ; stop at first non-digit or end of string 
                                     54 ; ( dlo dhi a cntr -- dlo dhi [ a+ cntr- | a+ 0 ] )
      00A4DA                         55 parse_digits:
      00A4DA                         56 1$:
      00A4DA CD 86 A1         [ 4]   57     CALL DUPP 
      00245D                         58     _QBRAN 5$ 
      00A4DD CD 85 18         [ 4]    1     CALL QBRAN
      00A4E0 A5 22                    2     .word 5$
      00A4E2 CD 86 6A         [ 4]   59     CALL TOR   ; dlo dhi a R: cntr 
      00A4E5 CD 8D 14         [ 4]   60     CALL COUNT ; dlo dhi a+ char 
      00A4E8 CD 87 67         [ 4]   61     CALL BASE 
      00A4EB CD 85 63         [ 4]   62     CALL AT 
      00A4EE CD 8F 0C         [ 4]   63     CALL DIGTQ 
      002471                         64     _QBRAN 4$ ; not a digit
      00A4F1 CD 85 18         [ 4]    1     CALL QBRAN
      00A4F4 A5 19                    2     .word 4$
      00A4F6 CD A8 63         [ 4]   65     CALL DTOR  ; dlo dhi R: cntr a+ c  
      00A4F9 CD 87 67         [ 4]   66     CALL BASE 
      00A4FC CD 85 63         [ 4]   67     CALL AT 
      00A4FF CD A6 CE         [ 4]   68     CALL DSSTAR
      00A502 CD 85 B4         [ 4]   69     CALL RFROM 
      00A505 CD 8C 4E         [ 4]   70     CALL ZERO 
      00A508 CD AB 27         [ 4]   71     CALL DPLUS 
      00A50B CD 85 B4         [ 4]   72     CALL RFROM  ; dlo dhi a+ 
      00A50E CD 85 B4         [ 4]   73     CALL RFROM ; dlo dhi a+ cntr 
      00A511 CD 8B EF         [ 4]   74     CALL ONEM 
      002494                         75     _BRAN 1$ ; dlo dhi a+ R: 
      00A514 CD 85 34         [ 4]    1     CALL BRAN 
      00A517 A4 DA                    2     .word 1$ 
      00A519 CD 86 97         [ 4]   76 4$: CALL DROP  ; dlo dhi a+ 
      00A51C CD 8B EF         [ 4]   77     CALL ONEM  ; unget char 
      00A51F CD 85 B4         [ 4]   78     CALL RFROM ; dlo dhi a+ cntr-
      00A522                         79 5$:
      00A522 81               [ 4]   80     RET 
                                     81 
                                     82 
                                     83 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     84 ;   NUMBER? (a -- s -1 |d -2 | a F )
                                     85 ;   convert string to integer 
                                     86 ;   double begin with '#' 
                                     87 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0024A3                         88     _HEADER NUMBQ,7,"NUMBER?"
      00A523 A4 7F                    1         .word LINK 
                           0024A5     2         LINK=.
      00A525 07                       3         .byte 7  
      00A526 4E 55 4D 42 45 52 3F     4         .ascii "NUMBER?"
      00A52D                          5         NUMBQ:
                                     89 ; save current base value 
      00A52D CD 87 67         [ 4]   90     CALL BASE 
      00A530 CD 85 63         [ 4]   91     CALL AT 
      00A533 CD 86 6A         [ 4]   92     CALL TOR 
                                     93 ; initialize integer to 0     
      00A536 1D 00 04         [ 2]   94     SUBW X,#4 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 137.
Hexadecimal [24-Bits]



      00A539 90 5F            [ 1]   95     CLRW Y 
      00A53B FF               [ 2]   96     LDW (X),Y 
      00A53C EF 02            [ 2]   97     LDW (2,X),Y ; a 0 0 R: base  
      0024BE                         98     _DOLIT 2 
      00A53E CD 84 EF         [ 4]    1     CALL DOLIT 
      00A541 00 02                    2     .word 2 
      00A543 CD 8C A7         [ 4]   99     CALL PICK  ; a 0 0 a R: base    
      00A546 CD 8D 14         [ 4]  100     CALL COUNT ; a 0 0 a+ n 
                                    101 ; check for '#' double integer 
      00A549 CD 86 C9         [ 4]  102     CALL OVER  ; a 0 0 a+ n a+
      00A54C CD 85 81         [ 4]  103     CALL CAT   ; a 0 0 a+ n c 
      0024CF                        104     _DOLIT '#' ; a 0 0 a+ n c '#' 
      00A54F CD 84 EF         [ 4]    1     CALL DOLIT 
      00A552 00 23                    2     .word '#' 
      00A554 CD 89 65         [ 4]  105     CALL EQUAL 
      00A557 CD 86 6A         [ 4]  106     CALL TOR   ; a 0 0 a+ n R: base d? 
      00A55A CD 85 C5         [ 4]  107     CALL RAT   ; a 0 0 a+ n d? R: base d?
      0024DD                        108     _QBRAN NUMQ0
      00A55D CD 85 18         [ 4]    1     CALL QBRAN
      00A560 A5 6E                    2     .word NUMQ0
                                    109 ; update a and count
      00A562 CD 86 B1         [ 4]  110     CALL SWAPP 
      00A565 CD 8B E2         [ 4]  111     CALL ONEP 
      00A568 CD 86 B1         [ 4]  112     CALL SWAPP 
      00A56B CD 8B EF         [ 4]  113     CALL ONEM  ; a 0 0 a+ n- R: base d?
                                    114 ; check for '$' hexadecimal  
      00A56E                        115 NUMQ0: 
      00A56E CD 86 C9         [ 4]  116     CALL OVER   
      00A571 CD 85 81         [ 4]  117     CALL CAT   
      0024F4                        118     _DOLIT '$'
      00A574 CD 84 EF         [ 4]    1     CALL DOLIT 
      00A577 00 24                    2     .word '$' 
      00A579 CD 89 65         [ 4]  119     CALL EQUAL ; a 0 0 a+ n- f  
      0024FC                        120     _QBRAN NUMQ1 
      00A57C CD 85 18         [ 4]    1     CALL QBRAN
      00A57F A5 90                    2     .word NUMQ1
      00A581 CD 8E E3         [ 4]  121     CALL HEX   ; switch to hexadecimal base 
                                    122 ; update a and count 
      00A584 CD 86 B1         [ 4]  123     CALL SWAPP 
      00A587 CD 8B E2         [ 4]  124     CALL ONEP 
      00A58A CD 86 B1         [ 4]  125     CALL SWAPP
      00A58D CD 8B EF         [ 4]  126     CALL ONEM ; a 0 0 a+ n-  R: base d?
                                    127 ; check for minus sign 
      00A590                        128 NUMQ1: 
      00A590 CD A4 A2         [ 4]  129     CALL nsign 
      00A593 CD 86 6A         [ 4]  130     CALL TOR ; R: base d? sign  
                                    131 ; check for end of string     
      00A596 CD 88 54         [ 4]  132     CALL QDUP    ; a dlo dhi a+ cntr R: base d? sign 
      002519                        133     _QBRAN NUMQ4 ; yes , not a number 
      00A599 CD 85 18         [ 4]    1     CALL QBRAN
      00A59C A5 DB                    2     .word NUMQ4
      00A59E CD A4 DA         [ 4]  134     CALL parse_digits
      00A5A1 CD 88 54         [ 4]  135     CALL QDUP 
      00A5A4 CD 86 EA         [ 4]  136     CALL ZEQUAL  
      002527                        137     _QBRAN NUMQ4 ; error not end of string  ( a dlo dhi a+ R: base d? sign )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 138.
Hexadecimal [24-Bits]



      00A5A7 CD 85 18         [ 4]    1     CALL QBRAN
      00A5AA A5 DB                    2     .word NUMQ4
      00A5AC CD 86 97         [ 4]  138     CALL DROP  ; a dlo dhi 
      00A5AF CD 85 B4         [ 4]  139     CALL RFROM  ; a dlo dhi sign 
      002532                        140     _QBRAN NUMQ3
      00A5B2 CD 85 18         [ 4]    1     CALL QBRAN
      00A5B5 A5 BA                    2     .word NUMQ3
      00A5B7 CD 89 03         [ 4]  141     CALL DNEGA
      00A5BA                        142 NUMQ3: 
      00A5BA CD 88 65         [ 4]  143     CALL ROT ; dlo dhi a  R: base d?
      00A5BD CD 86 97         [ 4]  144     CALL DROP
      002540                        145     _DOLIT -2  ; double return -2 flag 
      00A5C0 CD 84 EF         [ 4]    1     CALL DOLIT 
      00A5C3 FF FE                    2     .word -2 
      00A5C5 CD 85 B4         [ 4]  146     CALL RFROM ; dlo dhi d? R: base 
      002548                        147     _TBRAN NUMQ8 
      00A5C8 CD 85 26         [ 4]    1     CALL TBRAN 
      00A5CB A5 E4                    2     .word NUMQ8 
      00A5CD CD 86 B1         [ 4]  148     CALL SWAPP 
      00A5D0 CD 86 97         [ 4]  149     CALL DROP
      00A5D3 CD 8B E2         [ 4]  150     CALL ONEP   ; single return -1 flag   
      002556                        151     _BRAN NUMQ8
      00A5D6 CD 85 34         [ 4]    1     CALL BRAN 
      00A5D9 A5 E4                    2     .word NUMQ8 
      00A5DB                        152 NUMQ4: ; not end of string error , ( a dlo dhi a+ cntr R: base d? sign )
                           000001   153 .if WANT_FLOAT
      00A5DB CD 85 B4         [ 4]  154     CALL RFROM ; sign 
      00A5DE CD 85 B4         [ 4]  155     CALL RFROM ; d? 
      00A5E1 CD AE AB         [ 4]  156     CALL FLOATQ ; ( a dlo dhi a+ cntr sign d? )    
                           000000   157 .else 
                                    158     ADDW X,#4 ; drop dhi a+  , ( a dlo R: base d? sign ) 
                                    159     ADDW SP,#4 ; drop d? sign  R: base 
                                    160     CLRW Y 
                                    161     LDW (X),Y ; dlo replaced by 0 ( -- a 0 R: base ) 
                                    162 .endif 
                                    163 ; restore original base value     
      00A5E4                        164 NUMQ8: 
      00A5E4 CD 85 B4         [ 4]  165     CALL RFROM 
      00A5E7 CD 87 67         [ 4]  166     CALL BASE 
      00A5EA CD 85 51         [ 4]  167     CALL STORE 
      00A5ED 81               [ 4]  168     RET 
                                    169 
                                    170 
                                    171 
                                    172 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    173 ;   DABS ( d -- d )
                                    174 ;   absolute value of double
                                    175 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00256E                        176     _HEADER DABS,4,"DABS"
      00A5EE A5 25                    1         .word LINK 
                           002570     2         LINK=.
      00A5F0 04                       3         .byte 4  
      00A5F1 44 41 42 53              4         .ascii "DABS"
      00A5F5                          5         DABS:
      00A5F5 CD 86 A1         [ 4]  177     CALL DUPP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 139.
Hexadecimal [24-Bits]



      00A5F8 CD 86 D8         [ 4]  178     CALL ZLESS 
      00257B                        179     _QBRAN DABS1 
      00A5FB CD 85 18         [ 4]    1     CALL QBRAN
      00A5FE A6 03                    2     .word DABS1
      00A600 CD 89 03         [ 4]  180     CALL DNEGA 
      00A603                        181 DABS1:
      00A603 81               [ 4]  182     RET 
                                    183 
                                    184 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    185 ;  DSIGN ( d -- d f )
                                    186 ;  sign of double 
                                    187 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002584                        188     _HEADER DSIGN,5,"DSIGN"
      00A604 A5 F0                    1         .word LINK 
                           002586     2         LINK=.
      00A606 05                       3         .byte 5  
      00A607 44 53 49 47 4E           4         .ascii "DSIGN"
      00A60C                          5         DSIGN:
      00A60C A6 00            [ 1]  189     LD A,#0 
      00A60E 90 93            [ 1]  190     LDW Y,X 
      00A610 90 FE            [ 2]  191     LDW Y,(Y)
      00A612 2A 02            [ 1]  192     JRPL DSIGN1
      00A614 A6 FF            [ 1]  193     LD A,#0XFF 
      00A616                        194 DSIGN1:
      00A616 1D 00 02         [ 2]  195     SUBW X,#2 
      00A619 F7               [ 1]  196     LD (X),A 
      00A61A E7 01            [ 1]  197     LD (1,X),A 
      00A61C 81               [ 4]  198     RET 
                                    199 
                                    200 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    201 ;   DS/MOD ( ud us - ur qud )
                                    202 ;   unsigned divide double by single 
                                    203 ;   return double quotient 
                                    204 ;   and single remainder 
                                    205 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00259D                        206     _HEADER DSLMOD,6,"DS/MOD"
      00A61D A6 06                    1         .word LINK 
                           00259F     2         LINK=.
      00A61F 06                       3         .byte 6  
      00A620 44 53 2F 4D 4F 44        4         .ascii "DS/MOD"
      00A626                          5         DSLMOD:
      00A626 90 93            [ 1]  207         LDW     Y,X             ; stack pointer to Y
      00A628 FE               [ 2]  208         LDW     X,(X)           ; un
      00A629 BF 26            [ 2]  209         LDW     YTEMP,X         ; save un
      00A62B 93               [ 1]  210         LDW     X,Y
      00A62C 89               [ 2]  211         PUSHW   X               ; save stack pointer
      00A62D 90 89            [ 2]  212         PUSHW   Y 
      00A62F EE 02            [ 2]  213         LDW     X,(2,X)           ; X=udh
      00A631 90 BE 26         [ 2]  214         LDW     Y,YTEMP         ; divisor 
      00A634 65               [ 2]  215         DIVW    X,Y 
      00A635 BF 24            [ 2]  216         LDW     XTEMP,X         ; QUOTIENT hi 
      00A637 93               [ 1]  217         LDW     X,Y             ; remainder in X 
      00A638 90 85            [ 2]  218         POPW    Y 
      00A63A 90 EE 04         [ 2]  219         LDW     Y,(4,Y)         ; Y=udl (offset before drop)
      00A63D A6 10            [ 1]  220         LD      A,#16           ; loop count
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 140.
Hexadecimal [24-Bits]



      00A63F 90 58            [ 2]  221         SLLW    Y               ; udl shift udl into udh
      00A641                        222 DSLMOD3:
      00A641 59               [ 2]  223         RLCW    X               ; rotate udl bit into uhdh (= remainder)
      00A642 25 04            [ 1]  224         JRC     DSLMODa         ; if carry out of rotate
      00A644 B3 26            [ 2]  225         CPW     X,YTEMP         ; compare udh to un
      00A646 25 05            [ 1]  226         JRULT   DSLMOD4         ; can't subtract
      00A648                        227 DSLMODa:
      00A648 72 B0 00 26      [ 2]  228         SUBW    X,YTEMP         ; can subtract
      00A64C 98               [ 1]  229         RCF
      00A64D                        230 DSLMOD4:
      00A64D 8C               [ 1]  231         CCF                     ; quotient bit
      00A64E 90 59            [ 2]  232         RLCW    Y               ; rotate into quotient, rotate out udl
      00A650 4A               [ 1]  233         DEC     A               ; repeat
      00A651 26 EE            [ 1]  234         JRNE    DSLMOD3           ; if A == 0
      00A653                        235 DSLMODb:
      00A653 BF 26            [ 2]  236         LDW     YTEMP,X         ; done, save remainder
      00A655 85               [ 2]  237         POPW    X               ; restore stack pointer
      00A656 EF 02            [ 2]  238         LDW     (2,X),Y           ; save quotient low 
      00A658 90 BE 24         [ 2]  239         LDW     Y,XTEMP         ; quotient hi 
      00A65B FF               [ 2]  240         LDW     (X),Y           ; save quotient hi 
      00A65C 90 BE 26         [ 2]  241         LDW     Y,YTEMP         ; remainder onto stack
      00A65F EF 04            [ 2]  242         LDW     (4,X),Y
      00A661 81               [ 4]  243         RET 
                                    244 
                                    245 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    246 ;   D# ( d -- d )
                                    247 ;   extract least digit 
                                    248 ;   from double integer 
                                    249 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0025E2                        250     _HEADER DDIG,2,"D#"
      00A662 A6 1F                    1         .word LINK 
                           0025E4     2         LINK=.
      00A664 02                       3         .byte 2  
      00A665 44 23                    4         .ascii "D#"
      00A667                          5         DDIG:
      00A667 CD 87 67         [ 4]  251     CALL BASE 
      00A66A CD 85 63         [ 4]  252     CALL AT 
      00A66D CD A6 26         [ 4]  253     CALL DSLMOD
      00A670 CD 88 65         [ 4]  254     CALL ROT   
      00A673 CD 8E 0C         [ 4]  255     CALL DIGIT 
      00A676 CD 8E 58         [ 4]  256     CALL HOLD 
      00A679 81               [ 4]  257     RET 
                                    258 
                                    259 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    260 ;    D#S ( d -- s )
                                    261 ;   extract digit from double 
                                    262 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0025FA                        263     _HEADER DDIGS,3,"D#S"
      00A67A A6 64                    1         .word LINK 
                           0025FC     2         LINK=.
      00A67C 03                       3         .byte 3  
      00A67D 44 23 53                 4         .ascii "D#S"
      00A680                          5         DDIGS:
      00A680 CD A6 67         [ 4]  264     CALL    DDIG 
      00A683 CD 88 B1         [ 4]  265     CALL    DDUP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 141.
Hexadecimal [24-Bits]



      00A686 CD A7 EC         [ 4]  266     CALL    DZEQUAL
      002609                        267     _QBRAN  DDIGS 
      00A689 CD 85 18         [ 4]    1     CALL QBRAN
      00A68C A6 80                    2     .word DDIGS
      00A68E CD 86 97         [ 4]  268     CALL    DROP 
      00A691 81               [ 4]  269     RET 
                                    270 
                                    271 
                                    272 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    273 ;   D. ( d -- )
                                    274 ;   display double integer 
                                    275 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002612                        276     _HEADER DDOT,2,"D."
      00A692 A6 7C                    1         .word LINK 
                           002614     2         LINK=.
      00A694 02                       3         .byte 2  
      00A695 44 2E                    4         .ascii "D."
      00A697                          5         DDOT:
      00A697 CD 8F 84         [ 4]  277     CALL SPACE 
      00A69A CD A6 0C         [ 4]  278     CALL DSIGN 
      00A69D CD 86 6A         [ 4]  279     CALL TOR
      00A6A0 CD 85 C5         [ 4]  280     CALL RAT 
      002623                        281     _QBRAN DDOT0
      00A6A3 CD 85 18         [ 4]    1     CALL QBRAN
      00A6A6 A6 AB                    2     .word DDOT0
      00A6A8 CD 89 03         [ 4]  282     CALL DNEGA 
      00A6AB                        283 DDOT0:     
      00A6AB CD 8E 48         [ 4]  284     CALL BDIGS 
      00A6AE CD A6 80         [ 4]  285     CALL DDIGS 
      00A6B1 CD 85 B4         [ 4]  286     CALL RFROM 
      002634                        287     _QBRAN DDOT1 
      00A6B4 CD 85 18         [ 4]    1     CALL QBRAN
      00A6B7 A6 C1                    2     .word DDOT1
      002639                        288     _DOLIT '-' 
      00A6B9 CD 84 EF         [ 4]    1     CALL DOLIT 
      00A6BC 00 2D                    2     .word '-' 
      00A6BE CD 8E 58         [ 4]  289     CALL HOLD 
      00A6C1                        290 DDOT1: 
      00A6C1 CD 8E AD         [ 4]  291     CALL EDIGS 
      00A6C4 CD 8F AE         [ 4]  292     CALL TYPES     
      00A6C7 81               [ 4]  293     RET 
                                    294 
                                    295 
                                    296 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    297 ; multiply double by single 
                                    298 ; return double 
                                    299 ;  ( d s -- d )
                                    300 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002648                        301     _HEADER DSSTAR,3,"DS*"
      00A6C8 A6 94                    1         .word LINK 
                           00264A     2         LINK=.
      00A6CA 03                       3         .byte 3  
      00A6CB 44 53 2A                 4         .ascii "DS*"
      00A6CE                          5         DSSTAR:
                                    302 ;DSSTAR:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 142.
Hexadecimal [24-Bits]



      00A6CE CD 86 6A         [ 4]  303     CALL TOR
      00A6D1 CD 86 A1         [ 4]  304     CALL DUPP 
      00A6D4 CD 86 D8         [ 4]  305     CALL ZLESS
      00A6D7 CD 86 A1         [ 4]  306     CALL DUPP 
      00A6DA CD 86 6A         [ 4]  307     CALL TOR 
      00265D                        308     _QBRAN DSSTAR1 
      00A6DD CD 85 18         [ 4]    1     CALL QBRAN
      00A6E0 A6 E5                    2     .word DSSTAR1
      00A6E2 CD 89 03         [ 4]  309     CALL DNEGA 
      00A6E5                        310 DSSTAR1:
      00A6E5 CD 85 B4         [ 4]  311     CALL RFROM 
      00A6E8 CD 88 84         [ 4]  312     CALL NROT       
      00A6EB CD 86 B1         [ 4]  313     CALL SWAPP 
      00A6EE CD 85 C5         [ 4]  314     CALL RAT 
      00A6F1 CD 8B 17         [ 4]  315     CALL UMSTA
      00A6F4 CD 88 65         [ 4]  316     CALL ROT 
      00A6F7 CD 85 B4         [ 4]  317     CALL RFROM 
      00A6FA CD 8B 17         [ 4]  318     CALL UMSTA 
      00A6FD CD 86 97         [ 4]  319     CALL DROP ; DROP OVERFLOW 
      00A700 CD 88 C6         [ 4]  320     CALL PLUS 
      00A703 CD 88 65         [ 4]  321     CALL ROT 
      002686                        322     _QBRAN DSSTAR3 
      00A706 CD 85 18         [ 4]    1     CALL QBRAN
      00A709 A7 0E                    2     .word DSSTAR3
      00A70B CD 89 03         [ 4]  323     CALL DNEGA 
      00A70E                        324 DSSTAR3:
      00A70E 81               [ 4]  325     RET 
                                    326 
                                    327 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    328 ;  2SWAP ( d1 d2 -- d2 d1 )
                                    329 ;  swap double 
                                    330 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00268F                        331     _HEADER DSWAP,5,"2SWAP"
      00A70F A6 CA                    1         .word LINK 
                           002691     2         LINK=.
      00A711 05                       3         .byte 5  
      00A712 32 53 57 41 50           4         .ascii "2SWAP"
      00A717                          5         DSWAP:
      00A717 90 93            [ 1]  332     LDW Y,X 
      00A719 90 FE            [ 2]  333     LDW Y,(Y)
      00A71B 90 BF 26         [ 2]  334     LDW YTEMP,Y ; d2 hi 
      00A71E 90 93            [ 1]  335     LDW Y,X 
      00A720 90 EE 02         [ 2]  336     LDW Y,(2,Y)
      00A723 90 BF 24         [ 2]  337     LDW XTEMP,Y  ; d2 lo 
      00A726 90 93            [ 1]  338     LDW Y,X 
      00A728 90 EE 04         [ 2]  339     LDW Y,(4,Y)  ; d1 hi 
      00A72B FF               [ 2]  340     LDW (X),Y 
      00A72C 90 93            [ 1]  341     LDW Y,X
      00A72E 90 EE 06         [ 2]  342     LDW Y,(6,Y)  ; d1 lo 
      00A731 EF 02            [ 2]  343     LDW (2,X),Y
      00A733 90 BE 26         [ 2]  344     LDW Y,YTEMP  
      00A736 EF 04            [ 2]  345     LDW (4,X),Y 
      00A738 90 BE 24         [ 2]  346     LDW Y,XTEMP 
      00A73B EF 06            [ 2]  347     LDW (6,X),Y 
      00A73D 81               [ 4]  348     RET 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 143.
Hexadecimal [24-Bits]



                                    349 
                                    350 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    351 ;    DCLZ ( d -- u )
                                    352 ;    double count leading zeros
                                    353 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0026BE                        354     _HEADER DCLZ,4,"DCLZ"
      00A73E A7 11                    1         .word LINK 
                           0026C0     2         LINK=.
      00A740 04                       3         .byte 4  
      00A741 44 43 4C 5A              4         .ascii "DCLZ"
      00A745                          5         DCLZ:
      00A745 4F               [ 1]  355     CLR A 
      00A746 90 93            [ 1]  356     LDW Y,X 
      00A748 90 FE            [ 2]  357     LDW Y,(Y)
      00A74A 2B 18            [ 1]  358     JRMI DCLZ8 ; no leading zero 
      00A74C 27 09            [ 1]  359     JREQ DCLZ4 ; >=16 
      00A74E                        360 DCLZ1: ; <16
      00A74E 90 58            [ 2]  361     SLLW Y
      00A750 4C               [ 1]  362     INC A 
      00A751 90 5D            [ 2]  363     TNZW Y 
      00A753 2B 0F            [ 1]  364     JRMI DCLZ8
      00A755 20 F7            [ 2]  365     JRA DCLZ1 
      00A757                        366 DCLZ4:
      00A757 A6 10            [ 1]  367     LD A,#16 
      00A759 90 93            [ 1]  368     LDW Y,X 
      00A75B 90 EE 02         [ 2]  369     LDW Y,(2,Y)
      00A75E 2B 04            [ 1]  370     JRMI DCLZ8 
      00A760 26 EC            [ 1]  371     JRNE DCLZ1 
      00A762 AB 10            [ 1]  372     ADD A,#16
      00A764                        373 DCLZ8: 
      00A764 1C 00 02         [ 2]  374     ADDW X,#2 
      00A767 90 5F            [ 1]  375     CLRW Y 
      00A769 90 97            [ 1]  376     LD YL,A 
      00A76B FF               [ 2]  377     LDW (X),Y 
      00A76C 81               [ 4]  378     RET 
                                    379 
                                    380 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    381 ;   <2ROT ( d1 d2 d3 -- d3 d1 d2 )
                                    382 ;   rotate left doubles 
                                    383 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0026ED                        384     _HEADER NDROT,5,"<2ROT"
      00A76D A7 40                    1         .word LINK 
                           0026EF     2         LINK=.
      00A76F 05                       3         .byte 5  
      00A770 3C 32 52 4F 54           4         .ascii "<2ROT"
      00A775                          5         NDROT:
                                    385 ; save d3 in temp 
      00A775 90 93            [ 1]  386     LDW Y,X 
      00A777 90 FE            [ 2]  387     LDW Y,(Y)
      00A779 90 BF 26         [ 2]  388     LDW YTEMP,Y  ; d3 hi 
      00A77C 90 93            [ 1]  389     LDW Y,X 
      00A77E 90 EE 02         [ 2]  390     LDW Y,(2,Y)
      00A781 90 BF 24         [ 2]  391     LDW XTEMP,Y  ; d3 lo 
                                    392 ; put d2 in d1 slot 
      00A784 90 93            [ 1]  393     LDW Y,X 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 144.
Hexadecimal [24-Bits]



      00A786 90 EE 04         [ 2]  394     LDW Y,(4,Y) 
      00A789 FF               [ 2]  395     LDW (X),Y   ; d2 hi 
      00A78A 90 93            [ 1]  396     LDW Y,X 
      00A78C 90 EE 06         [ 2]  397     LDW Y,(6,Y)
      00A78F EF 02            [ 2]  398     LDW (2,X),Y ; d2 lo
                                    399 ; put d1 in d2 slot 
      00A791 90 93            [ 1]  400     LDW Y,X 
      00A793 90 EE 08         [ 2]  401     LDW Y,(8,Y) 
      00A796 EF 04            [ 2]  402     LDW (4,X),Y ; d1 hi 
      00A798 90 93            [ 1]  403     LDW Y,X 
      00A79A 90 EE 0A         [ 2]  404     LDW Y,(10,Y)
      00A79D EF 06            [ 2]  405     LDW (6,X),Y  ; d1 lo 
                                    406 ; put d3 in d1 slot 
      00A79F 90 BE 26         [ 2]  407     LDW Y,YTEMP 
      00A7A2 EF 08            [ 2]  408     LDW (8,X),Y  ; d3 hi 
      00A7A4 90 BE 24         [ 2]  409     LDW Y,XTEMP 
      00A7A7 EF 0A            [ 2]  410     LDW (10,X),Y  ; d3 lo 
      00A7A9 81               [ 4]  411     RET 
                                    412 
                                    413 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    414 ;   2ROT ( d1 d2 d3 -- d2 d3 d1 )
                                    415 ;   rotate right doubles 
                                    416 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00272A                        417     _HEADER DROT,4,"2ROT"
      00A7AA A7 6F                    1         .word LINK 
                           00272C     2         LINK=.
      00A7AC 04                       3         .byte 4  
      00A7AD 32 52 4F 54              4         .ascii "2ROT"
      00A7B1                          5         DROT:
                                    418 ; save d3 in temp 
      00A7B1 90 93            [ 1]  419     LDW Y,X 
      00A7B3 90 FE            [ 2]  420     LDW Y,(Y)
      00A7B5 90 BF 26         [ 2]  421     LDW YTEMP,Y ; d3 hi 
      00A7B8 90 93            [ 1]  422     LDW Y,X 
      00A7BA 90 EE 02         [ 2]  423     LDW Y,(2,Y)
      00A7BD 90 BF 24         [ 2]  424     LDW XTEMP,Y ; d3 lo 
                                    425 ; put d1 in d3 slot 
      00A7C0 90 93            [ 1]  426     LDW Y,X 
      00A7C2 90 EE 08         [ 2]  427     LDW Y,(8,Y)
      00A7C5 FF               [ 2]  428     LDW (X),Y  ; d1 hi 
      00A7C6 90 93            [ 1]  429     LDW Y,X 
      00A7C8 90 EE 0A         [ 2]  430     LDW Y,(10,Y) 
      00A7CB EF 02            [ 2]  431     LDW (2,X),Y ; d1 lo 
                                    432 ; put d2 in d1 slot 
      00A7CD 90 93            [ 1]  433     LDW Y,X 
      00A7CF 90 EE 04         [ 2]  434     LDW Y,(4,Y) ; d2 hi 
      00A7D2 EF 08            [ 2]  435     LDW (8,X),Y 
      00A7D4 90 93            [ 1]  436     LDW Y,X 
      00A7D6 90 EE 06         [ 2]  437     LDW Y,(6,Y) ; d2 lo 
      00A7D9 EF 0A            [ 2]  438     LDW (10,X),Y 
                                    439 ; put d3 in d2 slot 
      00A7DB 90 BE 26         [ 2]  440     LDW Y,YTEMP 
      00A7DE EF 04            [ 2]  441     LDW (4,X),Y 
      00A7E0 90 BE 24         [ 2]  442     LDW Y,XTEMP 
      00A7E3 EF 06            [ 2]  443     LDW (6,X),Y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 145.
Hexadecimal [24-Bits]



      00A7E5 81               [ 4]  444     RET 
                                    445 
                                    446 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    447 ;    D0= ( d -- 0|-1 )
                                    448 ;    check if double is 0 
                                    449 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002766                        450     _HEADER DZEQUAL,3,"D0="
      00A7E6 A7 AC                    1         .word LINK 
                           002768     2         LINK=.
      00A7E8 03                       3         .byte 3  
      00A7E9 44 30 3D                 4         .ascii "D0="
      00A7EC                          5         DZEQUAL:
      00A7EC CD 87 12         [ 4]  451     CALL ORR 
      00A7EF A6 FF            [ 1]  452     LD A,#0xFF
      00A7F1 90 93            [ 1]  453     LDW Y,X
      00A7F3 90 FE            [ 2]  454     LDW Y,(Y)
      00A7F5 90 A3 00 00      [ 2]  455     CPW Y,#0 
      00A7F9 27 01            [ 1]  456     JREQ  ZEQ1
      00A7FB 4F               [ 1]  457     CLR A   ;false
      00A7FC                        458 ZEQ1:
      00A7FC F7               [ 1]  459     LD     (X),A
      00A7FD E7 01            [ 1]  460     LD (1,X),A
      00A7FF 81               [ 4]  461 	RET     
                                    462     
                                    463 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    464 ;   D= ( d1 d2 -- f )
                                    465 ;   d1==d2?
                                    466 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002780                        467     _HEADER DEQUAL,2,"D="
      00A800 A7 E8                    1         .word LINK 
                           002782     2         LINK=.
      00A802 02                       3         .byte 2  
      00A803 44 3D                    4         .ascii "D="
      00A805                          5         DEQUAL:
      00A805 A6 00            [ 1]  468     LD A,#0 
      00A807 90 93            [ 1]  469     LDW Y,X 
      00A809 90 FE            [ 2]  470     LDW Y,(Y)
      00A80B E3 04            [ 2]  471     CPW Y,(4,X)
      00A80D 26 0B            [ 1]  472     JRNE DEQU4 
      00A80F 90 93            [ 1]  473     LDW Y,X 
      00A811 90 EE 02         [ 2]  474     LDW Y,(2,Y)
      00A814 E3 06            [ 2]  475     CPW Y,(6,X)
      00A816 26 02            [ 1]  476     JRNE DEQU4 
      00A818 A6 FF            [ 1]  477     LD A,#0XFF
      00A81A                        478 DEQU4:
      00A81A 1C 00 06         [ 2]  479     ADDW X,#6
      00A81D F7               [ 1]  480     LD (X),A 
      00A81E E7 01            [ 1]  481     LD (1,X),A 
      00A820 81               [ 4]  482     RET 
                                    483 
                                    484 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    485 ;   D> ( d1 d2 -- f )
                                    486 ;   d1>d2?
                                    487 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0027A1                        488     _HEADER DGREAT,2,"D>"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 146.
Hexadecimal [24-Bits]



      00A821 A8 02                    1         .word LINK 
                           0027A3     2         LINK=.
      00A823 02                       3         .byte 2  
      00A824 44 3E                    4         .ascii "D>"
      00A826                          5         DGREAT:
      00A826 CD A7 17         [ 4]  489     CALL DSWAP 
      00A829 CC A8 31         [ 2]  490     JP DLESS 
                                    491 
                                    492 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    493 ;   D< ( d1 d2 -- f )
                                    494 ;   d1<d2? 
                                    495 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0027AC                        496     _HEADER DLESS,2,"D<"
      00A82C A8 23                    1         .word LINK 
                           0027AE     2         LINK=.
      00A82E 02                       3         .byte 2  
      00A82F 44 3C                    4         .ascii "D<"
      00A831                          5         DLESS:
      00A831 CD AB 59         [ 4]  497     CALL DSUB
      00A834 CD 8C 4E         [ 4]  498     CALL ZERO
      00A837 CD 88 84         [ 4]  499     CALL NROT  
      00A83A CD A8 4C         [ 4]  500     CALL DZLESS 
      0027BD                        501     _QBRAN DLESS4
      00A83D CD 85 18         [ 4]    1     CALL QBRAN
      00A840 A8 45                    2     .word DLESS4
      00A842 CD 88 E0         [ 4]  502     CALL INVER  
      00A845                        503 DLESS4:
      00A845 81               [ 4]  504     RET
                                    505 
                                    506 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    507 ;  D0< ( d -- f )
                                    508 ;  d<0? 
                                    509 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0027C6                        510     _HEADER DZLESS,3,"D0<"
      00A846 A8 2E                    1         .word LINK 
                           0027C8     2         LINK=.
      00A848 03                       3         .byte 3  
      00A849 44 30 3C                 4         .ascii "D0<"
      00A84C                          5         DZLESS:
      00A84C A6 00            [ 1]  511     LD A,#0 
      00A84E 90 93            [ 1]  512     LDW Y,X 
      00A850 90 FE            [ 2]  513     LDW Y,(Y)
      00A852 2A 02            [ 1]  514     JRPL DZLESS1 
      00A854 A6 FF            [ 1]  515     LD A,#0XFF 
      00A856                        516 DZLESS1:
      00A856 1C 00 02         [ 2]  517     ADDW X,#2 
      00A859 F7               [ 1]  518     LD (X),A 
      00A85A E7 01            [ 1]  519     LD (1,X),A    
      00A85C 81               [ 4]  520     RET 
                                    521 
                                    522 
                                    523 
                                    524 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    525 ;   2>R ( d -- R: d )
                                    526 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 147.
Hexadecimal [24-Bits]



      0027DD                        527     _HEADER DTOR,3,"2>R"
      00A85D A8 48                    1         .word LINK 
                           0027DF     2         LINK=.
      00A85F 03                       3         .byte 3  
      00A860 32 3E 52                 4         .ascii "2>R"
      00A863                          5         DTOR:
      00A863 90 85            [ 2]  528     POPW Y 
      00A865 90 BF 26         [ 2]  529     LDW YTEMP,Y 
      00A868 90 93            [ 1]  530     LDW Y,X 
      00A86A 90 EE 02         [ 2]  531     LDW Y,(2,Y)
      00A86D 90 89            [ 2]  532     PUSHW Y   ; d low 
      00A86F 90 93            [ 1]  533     LDW Y,X 
      00A871 90 FE            [ 2]  534     LDW Y,(Y)
      00A873 90 89            [ 2]  535     PUSHW Y   ; d hi 
      00A875 1C 00 04         [ 2]  536     ADDW X,#4  
      00A878 92 CC 26         [ 5]  537     JP [YTEMP]
                                    538 
                                    539 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    540 ;  2R> ( -- d ) R: d --      
                                    541 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0027FB                        542     _HEADER DRFROM,3,"2R>"
      00A87B A8 5F                    1         .word LINK 
                           0027FD     2         LINK=.
      00A87D 03                       3         .byte 3  
      00A87E 32 52 3E                 4         .ascii "2R>"
      00A881                          5         DRFROM:
      00A881 90 85            [ 2]  543     POPW Y      ; d hi 
      00A883 90 BF 26         [ 2]  544     LDW YTEMP,Y 
      00A886 1D 00 04         [ 2]  545     SUBW X,#4
      00A889 90 85            [ 2]  546     POPW Y       ; d hi 
      00A88B FF               [ 2]  547     LDW (X),Y 
      00A88C 90 85            [ 2]  548     POPW Y       ; d low  
      00A88E EF 02            [ 2]  549     LDW (2,X),Y 
      00A890 92 CC 26         [ 5]  550     JP [YTEMP]
                                    551     
                                    552 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    553 ;   2R@ ( -- d )
                                    554 ;   fecth a double from RSTACK
                                    555 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002813                        556     _HEADER DRAT,3,"2R@"
      00A893 A8 7D                    1         .word LINK 
                           002815     2         LINK=.
      00A895 03                       3         .byte 3  
      00A896 32 52 40                 4         .ascii "2R@"
      00A899                          5         DRAT:
      00A899 90 85            [ 2]  557     POPW Y 
      00A89B 90 BF 26         [ 2]  558     LDW YTEMP,Y 
      00A89E 1D 00 04         [ 2]  559     SUBW X,#4 
      00A8A1 16 01            [ 2]  560     LDW Y,(1,SP)
      00A8A3 FF               [ 2]  561     LDW (X),Y 
      00A8A4 16 03            [ 2]  562     LDW Y,(3,SP)
      00A8A6 EF 02            [ 2]  563     LDW (2,X),Y 
      00A8A8 92 CC 26         [ 5]  564     JP [YTEMP]
                                    565 
                                    566 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 148.
Hexadecimal [24-Bits]



                                    567 ;  2VARIABLE <name> 
                                    568 ;  create a double variable 
                                    569 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00282B                        570     _HEADER DVARIA,9,"2VARIABLE"
      00A8AB A8 95                    1         .word LINK 
                           00282D     2         LINK=.
      00A8AD 09                       3         .byte 9  
      00A8AE 32 56 41 52 49 41 42     4         .ascii "2VARIABLE"
             4C 45
      00A8B7                          5         DVARIA:
      00A8B7 CD 8D 2B         [ 4]  571         CALL HERE
      00A8BA CD 86 A1         [ 4]  572         CALL DUPP
      00283D                        573         _DOLIT 4  
      00A8BD CD 84 EF         [ 4]    1     CALL DOLIT 
      00A8C0 00 04                    2     .word 4 
      00A8C2 CD 88 C6         [ 4]  574         CALL PLUS 
      00A8C5 CD 87 F8         [ 4]  575         CALL VPP 
      00A8C8 CD 85 51         [ 4]  576         CALL STORE
      00A8CB CD 98 FC         [ 4]  577         CALL CREAT
      00A8CE CD 86 A1         [ 4]  578         CALL DUPP
      00A8D1 CD 95 6F         [ 4]  579         CALL COMMA
      00A8D4 CD 8C 4E         [ 4]  580         CALL ZERO
      00A8D7 CD 86 C9         [ 4]  581         CALL OVER 
      00A8DA CD 85 51         [ 4]  582         CALL STORE 
      00A8DD CD 8C 4E         [ 4]  583         CALL ZERO 
      00A8E0 CD 86 B1         [ 4]  584         CALL SWAPP 
      00A8E3 CD 85 51         [ 4]  585         CALL STORE
      00A8E6 CD A2 02         [ 4]  586         CALL FMOVE ; move definition to FLASH
      00A8E9 CD 88 54         [ 4]  587         CALL QDUP 
      00A8EC CD 85 18         [ 4]  588         CALL QBRAN 
      00A8EF 99 49                  589         .word SET_RAMLAST   
      00A8F1 CD 9C AA         [ 4]  590         call UPDATVP  ; don't update if variable kept in RAM.
      00A8F4 CD A2 96         [ 4]  591         CALL UPDATPTR
      00A8F7 81               [ 4]  592         RET         
                                    593 
                                    594 
                                    595 
                                    596 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    597 ;  2LITERAL ( d -- )
                                    598 ;  compile double literal 
                                    599 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002878                        600     _HEADER DLITER,IMEDD+8,"2LITERAL"
      00A8F8 A8 AD                    1         .word LINK 
                           00287A     2         LINK=.
      00A8FA 88                       3         .byte IMEDD+8  
      00A8FB 32 4C 49 54 45 52 41     4         .ascii "2LITERAL"
             4C
      00A903                          5         DLITER:
      00A903 CD 95 B4         [ 4]  601     CALL COMPI 
      00A906 A9 0E                  602     .word do2lit 
      00A908 CD 95 6F         [ 4]  603     CALL COMMA 
      00A90B CC 95 6F         [ 2]  604     JP   COMMA 
                                    605 
                                    606 
                                    607 ; runtime for 2LITERAL 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 149.
Hexadecimal [24-Bits]



      00A90E                        608 do2lit:
      00A90E 1D 00 04         [ 2]  609     SUBW X,#4 
      00A911 16 01            [ 2]  610     LDW Y,(1,SP)
      00A913 90 FE            [ 2]  611     LDW Y,(Y)
      00A915 FF               [ 2]  612     LDW (X),Y 
      00A916 16 01            [ 2]  613     LDW Y,(1,SP)
      00A918 90 EE 02         [ 2]  614     LDW Y,(2,Y)
      00A91B EF 02            [ 2]  615     LDW (2,X),Y 
      00A91D 90 85            [ 2]  616     POPW Y 
      00A91F 90 EC 04         [ 2]  617     JP (4,Y)
                                    618 
                                    619 
                                    620 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    621 ;   2OVER ( d1 d2 -- d1 d2 d1 )
                                    622 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0028A2                        623     _HEADER DOVER,5,"2OVER"
      00A922 A8 FA                    1         .word LINK 
                           0028A4     2         LINK=.
      00A924 05                       3         .byte 5  
      00A925 32 4F 56 45 52           4         .ascii "2OVER"
      00A92A                          5         DOVER:
      00A92A 90 93            [ 1]  624     LDW Y,X 
      00A92C 1D 00 04         [ 2]  625     SUBW X,#4 
      00A92F 90 89            [ 2]  626     PUSHW Y 
      00A931 90 EE 04         [ 2]  627     LDW Y,(4,Y)  ; d1 hi 
      00A934 FF               [ 2]  628     LDW (X),Y 
      00A935 90 85            [ 2]  629     POPW Y 
      00A937 90 EE 06         [ 2]  630     LDW Y,(6,Y)  ;d1 lo 
      00A93A EF 02            [ 2]  631     LDW (2,X),Y 
      00A93C 81               [ 4]  632     RET 
                                    633 
                                    634 
                                    635 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    636 ;   D2/ ( d -- d/2 )
                                    637 ;   divide double by 2 
                                    638 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0028BD                        639     _HEADER D2SLASH,3,"D2/"
      00A93D A9 24                    1         .word LINK 
                           0028BF     2         LINK=.
      00A93F 03                       3         .byte 3  
      00A940 44 32 2F                 4         .ascii "D2/"
      00A943                          5         D2SLASH:
      00A943 90 93            [ 1]  640     LDW Y,X 
      00A945 90 FE            [ 2]  641     LDW Y,(Y)
      00A947 90 57            [ 2]  642     SRAW Y 
      00A949 FF               [ 2]  643     LDW (X),Y 
      00A94A 90 93            [ 1]  644     LDW Y,X 
      00A94C 90 EE 02         [ 2]  645     LDW Y,(2,Y)
      00A94F 90 56            [ 2]  646     RRCW Y 
      00A951 EF 02            [ 2]  647     LDW (2,X),Y 
      00A953 81               [ 4]  648     RET
                                    649 
                                    650 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    651 ;  D2* ( d -- d*2 )
                                    652 ;  multiply double by 2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 150.
Hexadecimal [24-Bits]



                                    653 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0028D4                        654     _HEADER D2STAR,3,"D2*"
      00A954 A9 3F                    1         .word LINK 
                           0028D6     2         LINK=.
      00A956 03                       3         .byte 3  
      00A957 44 32 2A                 4         .ascii "D2*"
      00A95A                          5         D2STAR:
      00A95A 90 93            [ 1]  655     LDW Y,X 
      00A95C 90 EE 02         [ 2]  656     LDW Y,(2,Y)
      00A95F 98               [ 1]  657     RCF 
      00A960 90 59            [ 2]  658     RLCW Y 
      00A962 EF 02            [ 2]  659     LDW (2,X),Y 
      00A964 90 93            [ 1]  660     LDW Y,X 
      00A966 90 FE            [ 2]  661     LDW Y,(Y)
      00A968 90 59            [ 2]  662     RLCW Y 
      00A96A FF               [ 2]  663     LDW (X),Y 
      00A96B 81               [ 4]  664     RET 
                                    665 
                                    666 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    667 ;   DLSHIFT ( d n -- d )
                                    668 ;   left shift double 
                                    669 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0028EC                        670     _HEADER DLSHIFT,7,"DLSHIFT"
      00A96C A9 56                    1         .word LINK 
                           0028EE     2         LINK=.
      00A96E 07                       3         .byte 7  
      00A96F 44 4C 53 48 49 46 54     4         .ascii "DLSHIFT"
      00A976                          5         DLSHIFT:
      00A976 E6 01            [ 1]  671     LD A,(1,X) ; shift count 
      00A978 1C 00 02         [ 2]  672     ADDW X,#2 
      00A97B 90 93            [ 1]  673     LDW Y,X 
      00A97D 90 FE            [ 2]  674     LDW Y,(Y)
      00A97F 90 BF 26         [ 2]  675     LDW YTEMP,Y  ; d hi 
      00A982 90 93            [ 1]  676     LDW Y,X 
      00A984 90 EE 02         [ 2]  677     LDW Y,(2,Y)  ; d low 
      00A987                        678 DLSHIFT1:
      00A987 4D               [ 1]  679     TNZ A 
      00A988 27 12            [ 1]  680     JREQ DLSHIFT2 
      00A98A 98               [ 1]  681     RCF 
      00A98B 90 59            [ 2]  682     RLCW Y 
      00A98D 90 89            [ 2]  683     PUSHW Y 
      00A98F 90 BE 26         [ 2]  684     LDW Y,YTEMP 
      00A992 90 59            [ 2]  685     RLCW Y 
      00A994 90 BF 26         [ 2]  686     LDW YTEMP,Y 
      00A997 90 85            [ 2]  687     POPW Y 
      00A999 4A               [ 1]  688     DEC A 
      00A99A 20 EB            [ 2]  689     JRA DLSHIFT1 
      00A99C                        690 DLSHIFT2:
      00A99C EF 02            [ 2]  691     LDW (2,X),Y 
      00A99E 90 BE 26         [ 2]  692     LDW Y,YTEMP 
      00A9A1 FF               [ 2]  693     LDW (X),Y 
      00A9A2 81               [ 4]  694     RET 
                                    695 
                                    696 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    697 ;  DRSHIFT ( d n -- d )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 151.
Hexadecimal [24-Bits]



                                    698 ;  shift right n bits 
                                    699 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002923                        700     _HEADER DRSHIFT,7,"DRSHIFT"
      00A9A3 A9 6E                    1         .word LINK 
                           002925     2         LINK=.
      00A9A5 07                       3         .byte 7  
      00A9A6 44 52 53 48 49 46 54     4         .ascii "DRSHIFT"
      00A9AD                          5         DRSHIFT:
      00A9AD E6 01            [ 1]  701     LD A,(1,X)
      00A9AF A4 1F            [ 1]  702     AND A,#0X1F 
      00A9B1 1C 00 02         [ 2]  703     ADDW X,#2 
      00A9B4                        704 DRSHIFT1:
      00A9B4 4D               [ 1]  705     TNZ A 
      00A9B5 27 13            [ 1]  706     JREQ DRSHIFT2 
      00A9B7 90 93            [ 1]  707     LDW Y,X 
      00A9B9 90 FE            [ 2]  708     LDW Y,(Y)
      00A9BB 90 57            [ 2]  709     SRAW Y 
      00A9BD FF               [ 2]  710     LDW (X),Y 
      00A9BE 90 93            [ 1]  711     LDW Y,X 
      00A9C0 90 EE 02         [ 2]  712     LDW Y,(2,Y)
      00A9C3 90 56            [ 2]  713     RRCW Y 
      00A9C5 EF 02            [ 2]  714     LDW (2,X),Y 
      00A9C7 4A               [ 1]  715     DEC A
      00A9C8 20 EA            [ 2]  716     JRA DRSHIFT1  
      00A9CA                        717 DRSHIFT2:
      00A9CA 81               [ 4]  718     RET 
                                    719 
                                    720 
                                    721 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    722 ;   D* ( d1 d2 -- d3 )
                                    723 ;   double product 
                                    724 ;   
                                    725 ;   d3 = d1 * d2
                                    726 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00294B                        727     _HEADER DSTAR,2,"D*"
      00A9CB A9 A5                    1         .word LINK 
                           00294D     2         LINK=.
      00A9CD 02                       3         .byte 2  
      00A9CE 44 2A                    4         .ascii "D*"
      00A9D0                          5         DSTAR:
      00A9D0 CD 86 A1         [ 4]  728     CALL DUPP 
      00A9D3 CD 86 D8         [ 4]  729     CALL ZLESS  
      00A9D6 CD 86 6A         [ 4]  730     CALL TOR    ; R: d2sign 
      00A9D9 CD A5 F5         [ 4]  731     CALL DABS   
      00A9DC CD 85 B4         [ 4]  732     CALL RFROM 
      00A9DF CD 88 84         [ 4]  733     CALL NROT  ; d1 d2s ud2
      00A9E2 CD A8 63         [ 4]  734     CALL DTOR  ; d1 d2s R: ud2  
      00A9E5 CD 86 6A         [ 4]  735     CALL TOR   ; d1 R: ud2 d2s   
      00A9E8 CD 86 A1         [ 4]  736     CALL DUPP 
      00A9EB CD 86 D8         [ 4]  737     CALL ZLESS 
      00A9EE CD 85 B4         [ 4]  738     CALL RFROM 
      00A9F1 CD 87 27         [ 4]  739     CALL XORR   
      00A9F4 CD 86 6A         [ 4]  740     CALL TOR   ; d1 R: ud2 prod_sign  
      00A9F7 CD A5 F5         [ 4]  741     CALL DABS ; ud1 R: ud2 ps  
      00A9FA CD 85 B4         [ 4]  742     CALL RFROM  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 152.
Hexadecimal [24-Bits]



      00A9FD CD 88 84         [ 4]  743     CALL NROT   ; ps ud1 
      00AA00 CD 88 B1         [ 4]  744     CALL DDUP   ; ps ud1 ud1  
      00AA03 CD 85 B4         [ 4]  745     CALL RFROM  ; ps ud1 ud1 ud2hi 
      00AA06 CD A6 CE         [ 4]  746     CALL DSSTAR ; ps ud1 dprodhi 
                                    747 ; shift partial product 16 bits left 
      00AA09 CD 86 97         [ 4]  748     CALL DROP   ; drop overflow 
      00AA0C CD 8C 4E         [ 4]  749     CALL ZERO   ; ps ud1 prodhi 
      00AA0F CD 86 B1         [ 4]  750     CALL SWAPP  
      00AA12 CD A7 17         [ 4]  751     CALL DSWAP  ; ps dprodhi ud1 
      00AA15 CD 85 B4         [ 4]  752     CALL RFROM  ; ps dprodhi ud1 ud2lo
      00AA18 CD A6 CE         [ 4]  753     CALL DSSTAR ; ps  dprodhi dprodlo 
      00AA1B CD AB 27         [ 4]  754     CALL DPLUS
      00AA1E CD 88 65         [ 4]  755     CALL ROT    ; dprod ps 
      0029A1                        756     _QBRAN DDSTAR3 
      00AA21 CD 85 18         [ 4]    1     CALL QBRAN
      00AA24 AA 29                    2     .word DDSTAR3
      00AA26 CD 89 03         [ 4]  757     CALL DNEGA 
      00AA29                        758 DDSTAR3:  
      00AA29 81               [ 4]  759     RET 
                                    760 
                                    761 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    762 ;  UD/MOD ( ud1 ud2 -- dr udq )
                                    763 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0029AA                        764     _HEADER UDSLMOD,6,"UD/MOD"
      00AA2A A9 CD                    1         .word LINK 
                           0029AC     2         LINK=.
      00AA2C 06                       3         .byte 6  
      00AA2D 55 44 2F 4D 4F 44        4         .ascii "UD/MOD"
      00AA33                          5         UDSLMOD:
                                    765 ; unsigned double division 
      00AA33 CD 8C 4E         [ 4]  766     CALL ZERO 
      00AA36 CD 8C 4E         [ 4]  767     CALL ZERO
      00AA39 CD A8 63         [ 4]  768     CALL DTOR ; quotient  R: sign qlo qhi 
      00AA3C CD A9 2A         [ 4]  769     CALL DOVER 
      00AA3F CD A7 45         [ 4]  770     CALL DCLZ ; n2, dividend leading zeros  
      00AA42 CD 86 6A         [ 4]  771     CALL TOR 
      00AA45 CD 88 B1         [ 4]  772     CALL DDUP    
      00AA48 CD A7 45         [ 4]  773     CALL DCLZ  ; n1, divisor leading zeros
      00AA4B CD 85 B4         [ 4]  774     CALL RFROM ; n1 n2 
      00AA4E CD 89 3D         [ 4]  775     CALL SUBB
      00AA51 CD 86 A1         [ 4]  776     CALL DUPP   
      00AA54 CD 86 D8         [ 4]  777     CALL ZLESS 
      0029D7                        778     _TBRAN UDSLA7 ; quotient is null 
      00AA57 CD 85 26         [ 4]    1     CALL TBRAN 
      00AA5A AA CA                    2     .word UDSLA7 
      00AA5C CD 86 A1         [ 4]  779     CALL DUPP 
      00AA5F CD 86 6A         [ 4]  780     CALL TOR    ; loop counter 
      00AA62 CD 86 A1         [ 4]  781     CALL DUPP 
      00AA65 CD 86 6A         [ 4]  782     CALL TOR    ; need to copies 
      00AA68 CD 88 54         [ 4]  783     CALL QDUP 
      0029EB                        784     _QBRAN UDSLA3
      00AA6B CD 85 18         [ 4]    1     CALL QBRAN
      00AA6E AA 73                    2     .word UDSLA3
      00AA70 CD A9 76         [ 4]  785     CALL DLSHIFT ; align divisor with dividend 
      00AA73                        786 UDSLA3: ; division loop -- dividend divisor  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 153.
Hexadecimal [24-Bits]



      00AA73 90 5F            [ 1]  787     CLRW Y 
      00AA75 90 89            [ 2]  788     PUSHW Y  
      00AA77 CD A9 2A         [ 4]  789     CALL DOVER 
      00AA7A CD A9 2A         [ 4]  790     CALL DOVER 
      00AA7D CD A8 31         [ 4]  791     CALL DLESS 
      002A00                        792     _TBRAN UDSLA4 
      00AA80 CD 85 26         [ 4]    1     CALL TBRAN 
      00AA83 AA 99                    2     .word UDSLA4 
      00AA85 90 85            [ 2]  793     POPW Y 
      00AA87 72 A9 00 01      [ 2]  794     ADDW Y,#1 
      00AA8B 90 89            [ 2]  795     PUSHW Y    ; quotiend least bit 
      00AA8D CD 88 B1         [ 4]  796     CALL DDUP  ; dividend divisor divisor 
      00AA90 CD A8 63         [ 4]  797     CALL DTOR  
      00AA93 CD AB 59         [ 4]  798     CALL DSUB  ; dividend-divisor 
      00AA96 CD A8 81         [ 4]  799     CALL DRFROM  ; dividend- divisor  
      00AA99                        800 UDSLA4: ; shift quotient and add 1 bit 
      00AA99 90 85            [ 2]  801     POPW Y 
      00AA9B 90 BF 26         [ 2]  802     LDW YTEMP,Y 
      00AA9E 16 07            [ 2]  803     LDW Y,(7,SP) ; quotient low 
      00AAA0 98               [ 1]  804     RCF 
      00AAA1 90 59            [ 2]  805     RLCW Y
      00AAA3 17 07            [ 2]  806     LDW (7,SP),Y 
      00AAA5 16 05            [ 2]  807     LDW Y,(5,SP) ; quotient hi 
      00AAA7 90 59            [ 2]  808     RLCW Y 
      00AAA9 17 05            [ 2]  809     LDW (5,SP),Y 
      00AAAB 16 07            [ 2]  810     LDW Y,(7,SP) 
      00AAAD 72 B9 00 26      [ 2]  811     ADDW Y,YTEMP
      00AAB1 17 07            [ 2]  812     LDW (7,SP),Y 
      00AAB3 16 01            [ 2]  813     LDW Y,(1,SP) ; loop counter 
      00AAB5 90 5D            [ 2]  814     TNZW Y 
      00AAB7 27 14            [ 1]  815     JREQ UDSLA8
      00AAB9 72 A2 00 01      [ 2]  816     SUBW Y,#1  
      00AABD 17 01            [ 2]  817     LDW (1,SP),Y  
                                    818 ; shift dividend left 1 bit      
      00AABF CD A7 17         [ 4]  819     CALL DSWAP 
      00AAC2 CD A9 5A         [ 4]  820     CALL D2STAR 
      00AAC5 CD A7 17         [ 4]  821     CALL DSWAP 
      00AAC8 20 A9            [ 2]  822     JRA UDSLA3 
      00AACA                        823 UDSLA7:
      00AACA 1C 00 02         [ 2]  824     ADDW X,#2 ; drop shift count  
      00AACD                        825 UDSLA8:
      00AACD 1C 00 04         [ 2]  826     ADDW X,#4 ; drop divisor
      00AAD0 CD 8C 59         [ 4]  827     CALL ONE 
      00AAD3 CD 85 FD         [ 4]  828     CALL NRDROP ; drop loop counter
      00AAD6 CD 85 B4         [ 4]  829     CALL RFROM   ; shift count
      00AAD9 CD A9 AD         [ 4]  830     CALL DRSHIFT 
                                    831     ; quotient replace dividend 
      00AADC CD A8 81         [ 4]  832     CALL DRFROM  ; quotient 
      00AADF 81               [ 4]  833     RET 
                                    834 
                                    835 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    836 ;   D/MOD  ( d1 d2 -- dr dq )
                                    837 ;   double division dq=d1/d2
                                    838 ;   dr remainder double 
                                    839 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 154.
Hexadecimal [24-Bits]



      002A60                        840     _HEADER DDSLMOD,5,"D/MOD"  
      00AAE0 AA 2C                    1         .word LINK 
                           002A62     2         LINK=.
      00AAE2 05                       3         .byte 5  
      00AAE3 44 2F 4D 4F 44           4         .ascii "D/MOD"
      00AAE8                          5         DDSLMOD:
      00AAE8 CD A6 0C         [ 4]  841     CALL DSIGN 
      00AAEB CD 86 6A         [ 4]  842     CALL TOR   ; R: divisor sign 
      00AAEE CD A7 17         [ 4]  843     CALL DSWAP 
      00AAF1 CD A6 0C         [ 4]  844     CALL DSIGN ; dividend sign 
      00AAF4 CD 85 B4         [ 4]  845     CALL RFROM 
      00AAF7 CD 87 27         [ 4]  846     CALL XORR  ; quotient sign
      00AAFA CD 86 6A         [ 4]  847     CALL TOR   ; 
      00AAFD CD A5 F5         [ 4]  848     CALL DABS  ; d2 ud1 R: sign 
      00AB00 CD A7 17         [ 4]  849     CALL DSWAP  ; ud1 d2 
      00AB03 CD A5 F5         [ 4]  850     CALL DABS  ; ud1 ud2 
      00AB06 CD AA 33         [ 4]  851     CALL UDSLMOD ; ud1/ud2 -- dr dq  
      00AB09 90 85            [ 2]  852     POPW Y ; sign 
      00AB0B 90 5D            [ 2]  853     TNZW Y 
      00AB0D 2A 03            [ 1]  854     JRPL DSLA9 
      00AB0F CD 89 03         [ 4]  855     CALL DNEGA ; remainder quotient 
      00AB12                        856 DSLA9: 
      00AB12 81               [ 4]  857     RET 
                                    858 
                                    859 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    860 ;   D/  ( d1 d2 -- dq )
                                    861 ;   division double by double 
                                    862 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002A93                        863     _HEADER DSLASH,2,"D/"
      00AB13 AA E2                    1         .word LINK 
                           002A95     2         LINK=.
      00AB15 02                       3         .byte 2  
      00AB16 44 2F                    4         .ascii "D/"
      00AB18                          5         DSLASH:
      00AB18 CD AA E8         [ 4]  864     CALL DDSLMOD
      00AB1B CD A7 17         [ 4]  865     CALL DSWAP
      00AB1E CD 88 A6         [ 4]  866     CALL DDROP 
      00AB21 81               [ 4]  867     RET 
                                    868 
                                    869 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    870 ;   D+ ( d1 d2 -- d3 )
                                    871 ;   add 2 doubles 
                                    872 ;   d3=d1+d2 
                                    873 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002AA2                        874     _HEADER DPLUS,2,"D+"
      00AB22 AB 15                    1         .word LINK 
                           002AA4     2         LINK=.
      00AB24 02                       3         .byte 2  
      00AB25 44 2B                    4         .ascii "D+"
      00AB27                          5         DPLUS:
      00AB27 90 93            [ 1]  875     LDW Y,X 
      00AB29 90 FE            [ 2]  876     LDW Y,(Y)
      00AB2B 90 BF 26         [ 2]  877     LDW YTEMP,Y ; d2 hi 
      00AB2E 90 93            [ 1]  878     LDW Y,X 
      00AB30 90 EE 02         [ 2]  879     LDW Y,(2,Y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 155.
Hexadecimal [24-Bits]



      00AB33 90 BF 24         [ 2]  880     LDW XTEMP,Y ; d2 lo 
      00AB36 1C 00 04         [ 2]  881     ADDW X,#4 
      00AB39 90 93            [ 1]  882     LDW Y,X 
      00AB3B 90 EE 02         [ 2]  883     LDW Y,(2,Y) ; d1 lo
      00AB3E 72 B9 00 24      [ 2]  884     ADDW Y,XTEMP
      00AB42 EF 02            [ 2]  885     LDW (2,X),Y 
      00AB44 90 93            [ 1]  886     LDW Y,X 
      00AB46 90 FE            [ 2]  887     LDW Y,(Y) ; d1 hi 
      00AB48 24 04            [ 1]  888     JRNC DPLUS1 
      00AB4A 72 A9 00 01      [ 2]  889     ADDW Y,#1 
      00AB4E                        890 DPLUS1: 
      00AB4E 72 B9 00 26      [ 2]  891     ADDW Y,YTEMP 
      00AB52 FF               [ 2]  892     LDW (X),Y 
      00AB53 81               [ 4]  893     RET 
                                    894 
                                    895 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    896 ;   D- ( d1 d2 -- d3 )
                                    897 ;   d3=d1-d2 
                                    898 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002AD4                        899     _HEADER DSUB,2,"D-"
      00AB54 AB 24                    1         .word LINK 
                           002AD6     2         LINK=.
      00AB56 02                       3         .byte 2  
      00AB57 44 2D                    4         .ascii "D-"
      00AB59                          5         DSUB:
      00AB59 90 93            [ 1]  900     LDW Y,X 
      00AB5B 90 FE            [ 2]  901     LDW Y,(Y)
      00AB5D 90 BF 26         [ 2]  902     LDW YTEMP,Y ; d2 hi 
      00AB60 90 93            [ 1]  903     LDW Y,X 
      00AB62 90 EE 02         [ 2]  904     LDW Y,(2,Y)
      00AB65 90 BF 24         [ 2]  905     LDW XTEMP,Y ; d2 lo 
      00AB68 1C 00 04         [ 2]  906     ADDW X,#4 
      00AB6B 90 93            [ 1]  907     LDW Y,X 
      00AB6D 90 EE 02         [ 2]  908     LDW Y,(2,Y) ; d1 lo
      00AB70 72 B2 00 24      [ 2]  909     SUBW Y,XTEMP
      00AB74 EF 02            [ 2]  910     LDW (2,X),Y 
      00AB76 90 93            [ 1]  911     LDW Y,X 
      00AB78 90 FE            [ 2]  912     LDW Y,(Y) ; d1 hi 
      00AB7A 24 04            [ 1]  913     JRNC DSUB1 
      00AB7C 72 A2 00 01      [ 2]  914     SUBW Y,#1 
      00AB80                        915 DSUB1: 
      00AB80 72 B2 00 26      [ 2]  916     SUBW Y,YTEMP 
      00AB84 FF               [ 2]  917     LDW (X),Y 
      00AB85 81               [ 4]  918     RET 
                                    919 
                                    920 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 156.
Hexadecimal [24-Bits]



                                   4468 .endif 
                           000001  4469 .if WANT_FLOAT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 157.
Hexadecimal [24-Bits]



                                   4470         .include "float.asm"
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
      002B06                         56     _HEADER FPSW,4,"FPSW"
      00AB86 AB 56                    1         .word LINK 
                           002B08     2         LINK=.
      00AB88 04                       3         .byte 4  
      00AB89 46 50 53 57              4         .ascii "FPSW"
      00AB8D                          5         FPSW:
      00AB8D 90 AE 00 08      [ 2]   57 	LDW Y,#UFPSW  
      00AB91 1D 00 02         [ 2]   58 	SUBW X,#2
      00AB94 FF               [ 2]   59     LDW (X),Y
      00AB95 81               [ 4]   60     RET
                                     61 
                                     62 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     63 ;   FRESET ( -- )
                                     64 ;   reset FPSW variable 
                                     65 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
      002B16                         66     _HEADER FRESET,6,"FRESET"
      00AB96 AB 88                    1         .word LINK 
                           002B18     2         LINK=.
      00AB98 06                       3         .byte 6  
      00AB99 46 52 45 53 45 54        4         .ascii "FRESET"
      00AB9F                          5         FRESET:
      00AB9F CD 8C 4E         [ 4]   67     CALL ZERO  
      00ABA2 CD AB 8D         [ 4]   68     CALL FPSW 
      00ABA5 CD 85 51         [ 4]   69     CALL STORE 
      00ABA8 81               [ 4]   70     RET 
                                     71 
                                     72 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     73 ;   FINIT ( -- )
                                     74 ;   initialize floating point 
                                     75 ;   library 
                                     76 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002B29                         77     _HEADER FINIT,5,"FINIT"
      00ABA9 AB 98                    1         .word LINK 
                           002B2B     2         LINK=.
      00ABAB 05                       3         .byte 5  
      00ABAC 46 49 4E 49 54           4         .ascii "FINIT"
      00ABB1                          5         FINIT:
      00ABB1 CD AB 9F         [ 4]   78     CALL FRESET 
      00ABB4 81               [ 4]   79     RET 
                                     80 
                                     81 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     82 ;    FER ( -- u )
                                     83 ;    return FPSW value 
                                     84 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002B35                         85     _HEADER FER,3,"FER"
      00ABB5 AB AB                    1         .word LINK 
                           002B37     2         LINK=.
      00ABB7 03                       3         .byte 3  
      00ABB8 46 45 52                 4         .ascii "FER"
      00ABBB                          5         FER:
      00ABBB CD AB 8D         [ 4]   86     CALL FPSW 
      00ABBE CD 85 63         [ 4]   87     CALL AT 
      00ABC1 81               [ 4]   88     RET 
                                     89 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 159.
Hexadecimal [24-Bits]



                                     90 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     91 ;    FZE  ( -- z )
                                     92 ;    return FPSW zero flag 
                                     93 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002B42                         94     _HEADER FZE,3,"FZE"
      00ABC2 AB B7                    1         .word LINK 
                           002B44     2         LINK=.
      00ABC4 03                       3         .byte 3  
      00ABC5 46 5A 45                 4         .ascii "FZE"
      00ABC8                          5         FZE:
      00ABC8 CD AB 8D         [ 4]   95     CALL FPSW
      00ABCB CD 85 63         [ 4]   96     CALL AT  
      00ABCE CD 8C 59         [ 4]   97     CALL ONE 
      00ABD1 CD 86 FE         [ 4]   98     CALL ANDD 
      00ABD4 81               [ 4]   99     RET 
                                    100 
                                    101 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    102 ;    FNE ( -- n )
                                    103 ;    return FPSW negative flag 
                                    104 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002B55                        105     _HEADER FNE,3,"FNE"
      00ABD5 AB C4                    1         .word LINK 
                           002B57     2         LINK=.
      00ABD7 03                       3         .byte 3  
      00ABD8 46 4E 45                 4         .ascii "FNE"
      00ABDB                          5         FNE:
      00ABDB CD AB 8D         [ 4]  106     CALL FPSW 
      00ABDE CD 85 63         [ 4]  107     CALL AT 
      002B61                        108     _DOLIT 2 
      00ABE1 CD 84 EF         [ 4]    1     CALL DOLIT 
      00ABE4 00 02                    2     .word 2 
      00ABE6 CD 86 FE         [ 4]  109     CALL ANDD 
      00ABE9 81               [ 4]  110     RET 
                                    111 
                                    112 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    113 ;   FOV (A -- v )
                                    114 ;   return FPSW overflow flag 
                                    115 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002B6A                        116     _HEADER FOV,3,"FOV"
      00ABEA AB D7                    1         .word LINK 
                           002B6C     2         LINK=.
      00ABEC 03                       3         .byte 3  
      00ABED 46 4F 56                 4         .ascii "FOV"
      00ABF0                          5         FOV:
      00ABF0 CD AB 8D         [ 4]  117     CALL FPSW
      00ABF3 CD 85 63         [ 4]  118     CALL AT  
      002B76                        119     _DOLIT 4 
      00ABF6 CD 84 EF         [ 4]    1     CALL DOLIT 
      00ABF9 00 04                    2     .word 4 
      00ABFB CD 86 FE         [ 4]  120     CALL ANDD 
      00ABFE 81               [ 4]  121     RET 
                                    122 
                                    123 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    124 ;    SFZ ( f# -- f# )
                                    125 ;    set FPSW zero flag 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 160.
Hexadecimal [24-Bits]



                                    126 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002B7F                        127     _HEADER SFZ,3,"SFZ"
      00ABFF AB EC                    1         .word LINK 
                           002B81     2         LINK=.
      00AC01 03                       3         .byte 3  
      00AC02 53 46 5A                 4         .ascii "SFZ"
      00AC05                          5         SFZ:
      00AC05 CD AB BB         [ 4]  128     CALL FER 
      002B88                        129     _DOLIT 0xfffe 
      00AC08 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AC0B FF FE                    2     .word 0xfffe 
      00AC0D CD 86 FE         [ 4]  130     CALL ANDD 
      00AC10 CD 86 6A         [ 4]  131     CALL TOR    
      00AC13 90 93            [ 1]  132     LDW Y,X 
      00AC15 90 FE            [ 2]  133     LDW Y,(Y)
      00AC17 26 0F            [ 1]  134     JRNE SFZ1  
      00AC19 90 93            [ 1]  135     LDW Y,X 
      00AC1B 90 EE 02         [ 2]  136     LDW Y,(2,Y)
      00AC1E 26 08            [ 1]  137     JRNE SFZ1
      00AC20 16 01            [ 2]  138     LDW Y,(1,SP)
      00AC22 72 A9 00 01      [ 2]  139     ADDW Y,#1
      00AC26 17 01            [ 2]  140     LDW (1,SP),Y 
      00AC28                        141 SFZ1:
      00AC28 CD 85 B4         [ 4]  142     CALL RFROM 
      00AC2B CD AB 8D         [ 4]  143     CALL FPSW 
      00AC2E CD 85 51         [ 4]  144     CALL STORE 
      00AC31 81               [ 4]  145     RET 
                                    146 
                                    147 
                                    148 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    149 ;   SFN ( f# -- f# )
                                    150 ;   set FPSW negative flag 
                                    151 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002BB2                        152     _HEADER SFN,3,"SFN"
      00AC32 AC 01                    1         .word LINK 
                           002BB4     2         LINK=.
      00AC34 03                       3         .byte 3  
      00AC35 53 46 4E                 4         .ascii "SFN"
      00AC38                          5         SFN:
      00AC38 CD AB BB         [ 4]  153     CALL FER 
      002BBB                        154     _DOLIT 0xFFFD 
      00AC3B CD 84 EF         [ 4]    1     CALL DOLIT 
      00AC3E FF FD                    2     .word 0xFFFD 
      00AC40 CD 86 FE         [ 4]  155     CALL ANDD  
      00AC43 CD 86 6A         [ 4]  156     CALL TOR 
      00AC46 E6 01            [ 1]  157     LD A,(1,X) 
      00AC48 2A 08            [ 1]  158     JRPL SFN1 
      00AC4A 16 01            [ 2]  159     LDW Y,(1,SP)  ; R@ -> Y 
      00AC4C 72 A9 00 02      [ 2]  160     ADDW Y,#2     ; set negative flag 
      00AC50 17 01            [ 2]  161     LDW (1,SP),Y  ; Y -> R! 
      00AC52                        162 SFN1:
      00AC52 CD 85 B4         [ 4]  163     CALL RFROM 
      00AC55 CD AB 8D         [ 4]  164     CALL FPSW 
      00AC58 CD 85 51         [ 4]  165     CALL STORE 
      00AC5B 81               [ 4]  166     RET 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 161.
Hexadecimal [24-Bits]



                                    167 
                                    168 
                                    169 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    170 ;   SFV ( -- )
                                    171 ;   set overflow flag 
                                    172 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002BDC                        173     _HEADER SFV,3,"SFV"
      00AC5C AC 34                    1         .word LINK 
                           002BDE     2         LINK=.
      00AC5E 03                       3         .byte 3  
      00AC5F 53 46 56                 4         .ascii "SFV"
      00AC62                          5         SFV:
      00AC62 CD AB BB         [ 4]  174     CALL FER 
      002BE5                        175     _DOLIT 4 
      00AC65 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AC68 00 04                    2     .word 4 
      00AC6A CD 87 12         [ 4]  176     CALL ORR 
      00AC6D CD AB 8D         [ 4]  177     CALL FPSW 
      00AC70 CD 85 51         [ 4]  178     CALL STORE 
      00AC73 81               [ 4]  179     RET 
                                    180 
                                    181 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    182 ;  F>ME ( f# -- m e )
                                    183 ;  split float in mantissa/exponent 
                                    184 ;  m mantissa as a double 
                                    185 ;  e exponent as a single 
                                    186 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002BF4                        187     _HEADER ATEXP,4,"F>ME"             
      00AC74 AC 5E                    1         .word LINK 
                           002BF6     2         LINK=.
      00AC76 04                       3         .byte 4  
      00AC77 46 3E 4D 45              4         .ascii "F>ME"
      00AC7B                          5         ATEXP:
      00AC7B CD AB 9F         [ 4]  188     CALL FRESET
      00AC7E CD AC 38         [ 4]  189     CALL SFN
      00AC81 CD AC 05         [ 4]  190     CALL SFZ 
      00AC84 90 93            [ 1]  191     LDW Y,X 
      00AC86 90 FE            [ 2]  192     LDW Y,(Y)
      00AC88 90 89            [ 2]  193     PUSHW Y 
      00AC8A 4F               [ 1]  194     CLR A  
      00AC8B 90 5E            [ 1]  195     SWAPW Y 
      00AC8D 2A 01            [ 1]  196     JRPL ATEXP1 
      00AC8F 43               [ 1]  197     CPL A 
      00AC90                        198 ATEXP1: ; sign extend mantissa 
      00AC90 90 5E            [ 1]  199     SWAPW Y 
      00AC92 90 95            [ 1]  200     LD YH,A 
      00AC94 FF               [ 2]  201     LDW (X),Y 
      00AC95 1D 00 02         [ 2]  202     SUBW X,#CELLL 
      00AC98 90 85            [ 2]  203     POPW Y 
      00AC9A 4F               [ 1]  204     CLR A 
      00AC9B 90 5D            [ 2]  205     TNZW Y 
      00AC9D 2A 01            [ 1]  206     JRPL ATEXP2 
      00AC9F 43               [ 1]  207     CPL A 
      00ACA0                        208 ATEXP2:
      00ACA0 90 5E            [ 1]  209     SWAPW Y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 162.
Hexadecimal [24-Bits]



      00ACA2 90 95            [ 1]  210     LD YH,A 
      00ACA4 FF               [ 2]  211     LDW (X),Y 
      00ACA5 81               [ 4]  212     RET 
                                    213 
                                    214 
                                    215 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    216 ;    ME>F ( m e -- f# )
                                    217 ;    built float from mantissa/exponent 
                                    218 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002C26                        219     _HEADER STEXP,4,"ME>F"
      00ACA6 AC 76                    1         .word LINK 
                           002C28     2         LINK=.
      00ACA8 04                       3         .byte 4  
      00ACA9 4D 45 3E 46              4         .ascii "ME>F"
      00ACAD                          5         STEXP:
      00ACAD CD 86 A1         [ 4]  220     CALL DUPP 
      00ACB0 CD 89 57         [ 4]  221     CALL ABSS 
      002C33                        222     _DOLIT 127 
      00ACB3 CD 84 EF         [ 4]    1     CALL DOLIT 
      00ACB6 00 7F                    2     .word 127 
      00ACB8 CD 89 E0         [ 4]  223     CALL GREAT
      002C3B                        224     _QBRAN STEXP1
      00ACBB CD 85 18         [ 4]    1     CALL QBRAN
      00ACBE AC C3                    2     .word STEXP1
      00ACC0 CD AC 62         [ 4]  225     CALL SFV
      00ACC3                        226 STEXP1:
      00ACC3 90 93            [ 1]  227     LDW Y,X 
      00ACC5 90 FE            [ 2]  228     LDW Y,(Y)
      00ACC7 4F               [ 1]  229     CLR A 
      00ACC8 90 95            [ 1]  230     LD YH,A
      00ACCA 90 5E            [ 1]  231     SWAPW Y 
      00ACCC 90 89            [ 2]  232     PUSHW Y  
      00ACCE 1C 00 02         [ 2]  233     ADDW X,#CELLL ; e >R 
      00ACD1 CD 86 A1         [ 4]  234     CALL DUPP
      00ACD4 CD 89 57         [ 4]  235     CALL ABSS 
      002C57                        236     _DOLIT 127  
      00ACD7 CD 84 EF         [ 4]    1     CALL DOLIT 
      00ACDA 00 7F                    2     .word 127 
      00ACDC CD 89 E0         [ 4]  237     CALL GREAT 
      002C5F                        238     _QBRAN STEXP2 
      00ACDF CD 85 18         [ 4]    1     CALL QBRAN
      00ACE2 AC E7                    2     .word STEXP2
      00ACE4 CD AC 62         [ 4]  239     CALL SFV
      00ACE7                        240 STEXP2: 
      00ACE7 4F               [ 1]  241     CLR A 
      00ACE8 F7               [ 1]  242     LD (X),A 
      00ACE9 CD 85 B4         [ 4]  243     CALL RFROM 
      00ACEC CD 87 12         [ 4]  244     CALL ORR
      00ACEF CD AC 05         [ 4]  245     CALL SFZ 
      00ACF2 CD AC 38         [ 4]  246     CALL SFN 
      00ACF5 81               [ 4]  247     RET 
                                    248 
                                    249 
                                    250 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    251 ;   E. ( f# -- )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 163.
Hexadecimal [24-Bits]



                                    252 ;   print float in scientific 
                                    253 ;   format 
                                    254 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002C76                        255     _HEADER EDOT,2,"E."
      00ACF6 AC A8                    1         .word LINK 
                           002C78     2         LINK=.
      00ACF8 02                       3         .byte 2  
      00ACF9 45 2E                    4         .ascii "E."
      00ACFB                          5         EDOT:
      00ACFB CD 87 67         [ 4]  256     CALL BASE 
      00ACFE CD 85 63         [ 4]  257     CALL AT 
      00AD01 CD 86 6A         [ 4]  258     CALL TOR 
      002C84                        259     _DOLIT 10 
      00AD04 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AD07 00 0A                    2     .word 10 
      00AD09 CD 87 67         [ 4]  260     CALL BASE 
      00AD0C CD 85 51         [ 4]  261     CALL STORE 
      00AD0F CD AC 7B         [ 4]  262     CALL ATEXP ; m e 
      00AD12                        263 EDOT0:
      00AD12 CD 86 6A         [ 4]  264     CALL TOR   
      00AD15 CD AB DB         [ 4]  265     CALL FNE 
      002C98                        266     _QBRAN EDOT1
      00AD18 CD 85 18         [ 4]    1     CALL QBRAN
      00AD1B AD 20                    2     .word EDOT1
      00AD1D CD 89 03         [ 4]  267     CALL DNEGA
      00AD20                        268 EDOT1:
      00AD20 CD 8F 84         [ 4]  269     CALL SPACE 
      00AD23 CD 8E 48         [ 4]  270     CALL BDIGS     
      00AD26                        271 EDOT2: 
      00AD26 CD A6 67         [ 4]  272     CALL DDIG
      00AD29 CD 85 B4         [ 4]  273     CALL RFROM 
      00AD2C CD 8B E2         [ 4]  274     CALL ONEP 
      00AD2F CD 86 6A         [ 4]  275     CALL TOR 
      00AD32 CD 86 A1         [ 4]  276     CALL DUPP
      002CB5                        277     _QBRAN EDOT3 
      00AD35 CD 85 18         [ 4]    1     CALL QBRAN
      00AD38 AD 3F                    2     .word EDOT3
      002CBA                        278     _BRAN EDOT2  
      00AD3A CD 85 34         [ 4]    1     CALL BRAN 
      00AD3D AD 26                    2     .word EDOT2 
      00AD3F                        279 EDOT3:
      00AD3F CD 86 C9         [ 4]  280     CALL OVER 
      00AD42 CD 87 67         [ 4]  281     CALL BASE 
      00AD45 CD 85 63         [ 4]  282     CALL AT 
      00AD48 CD 89 84         [ 4]  283     CALL ULESS 
      002CCB                        284     _QBRAN EDOT2 
      00AD4B CD 85 18         [ 4]    1     CALL QBRAN
      00AD4E AD 26                    2     .word EDOT2
      002CD0                        285     _DOLIT '.'
      00AD50 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AD53 00 2E                    2     .word '.' 
      00AD55 CD 8E 58         [ 4]  286     CALL HOLD  
      00AD58 CD A6 67         [ 4]  287     CALL DDIG
      00AD5B CD AB DB         [ 4]  288     CALL FNE 
      002CDE                        289     _QBRAN EDOT4 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 164.
Hexadecimal [24-Bits]



      00AD5E CD 85 18         [ 4]    1     CALL QBRAN
      00AD61 AD 6E                    2     .word EDOT4
      002CE3                        290     _DOLIT '-'
      00AD63 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AD66 00 2D                    2     .word '-' 
      00AD68 CD 8E 58         [ 4]  291     CALL HOLD 
      00AD6B CD 86 97         [ 4]  292     CALL DROP 
      00AD6E                        293 EDOT4:       
      00AD6E CD 8E AD         [ 4]  294     CALL EDIGS 
      00AD71 CD 8F AE         [ 4]  295     CALL TYPES
      00AD74 CD 85 B4         [ 4]  296     CALL RFROM 
      00AD77 CD 88 54         [ 4]  297     CALL QDUP 
      002CFA                        298     _QBRAN EDOT5     
      00AD7A CD 85 18         [ 4]    1     CALL QBRAN
      00AD7D AD 8A                    2     .word EDOT5
      002CFF                        299     _DOLIT 'E'
      00AD7F CD 84 EF         [ 4]    1     CALL DOLIT 
      00AD82 00 45                    2     .word 'E' 
      00AD84 CD 84 B6         [ 4]  300     CALL EMIT 
      00AD87 CD 90 6D         [ 4]  301     CALL DOT
      00AD8A                        302 EDOT5: 
      00AD8A CD 85 B4         [ 4]  303     CALL RFROM 
      00AD8D CD 87 67         [ 4]  304     CALL BASE 
      00AD90 CD 85 51         [ 4]  305     CALL STORE  
      00AD93 81               [ 4]  306     RET 
                                    307 
                                    308 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                    309 ;   F. (f# -- )
                                    310 ;   print float in fixed
                                    311 ;   point format. 
                                    312 ;;;;;;;;;;;;;;;;;;;;;;;;;
      002D14                        313     _HEADER FDOT,2,"F."
      00AD94 AC F8                    1         .word LINK 
                           002D16     2         LINK=.
      00AD96 02                       3         .byte 2  
      00AD97 46 2E                    4         .ascii "F."
      00AD99                          5         FDOT:
      00AD99 CD 87 67         [ 4]  314     CALL BASE 
      00AD9C CD 85 63         [ 4]  315     CALL AT 
      00AD9F CD 86 6A         [ 4]  316     CALL TOR 
      002D22                        317     _DOLIT 10 
      00ADA2 CD 84 EF         [ 4]    1     CALL DOLIT 
      00ADA5 00 0A                    2     .word 10 
      00ADA7 CD 87 67         [ 4]  318     CALL BASE 
      00ADAA CD 85 51         [ 4]  319     CALL STORE 
      00ADAD CD AC 7B         [ 4]  320     CALL    ATEXP
      00ADB0 CD 86 A1         [ 4]  321     CALL    DUPP  
      00ADB3 CD 89 57         [ 4]  322     CALL    ABSS 
      002D36                        323     _DOLIT  8
      00ADB6 CD 84 EF         [ 4]    1     CALL DOLIT 
      00ADB9 00 08                    2     .word 8 
      00ADBB CD 89 E0         [ 4]  324     CALL    GREAT 
      002D3E                        325     _QBRAN  FDOT1 
      00ADBE CD 85 18         [ 4]    1     CALL QBRAN
      00ADC1 AD C6                    2     .word FDOT1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 165.
Hexadecimal [24-Bits]



      00ADC3 CC AD 12         [ 2]  326     JP      EDOT0 
      00ADC6                        327 FDOT1:
      00ADC6 CD 8F 84         [ 4]  328     CALL    SPACE 
      00ADC9 CD 86 6A         [ 4]  329     CALL    TOR 
      00ADCC CD AB DB         [ 4]  330     CALL    FNE 
      002D4F                        331     _QBRAN  FDOT0 
      00ADCF CD 85 18         [ 4]    1     CALL QBRAN
      00ADD2 AD D7                    2     .word FDOT0
      00ADD4 CD 89 03         [ 4]  332     CALL    DNEGA 
      00ADD7                        333 FDOT0: 
      00ADD7 CD 8E 48         [ 4]  334     CALL    BDIGS
      00ADDA CD 85 C5         [ 4]  335     CALL    RAT  
      00ADDD CD 86 D8         [ 4]  336     CALL    ZLESS 
      002D60                        337     _QBRAN  FDOT6 
      00ADE0 CD 85 18         [ 4]    1     CALL QBRAN
      00ADE3 AE 0E                    2     .word FDOT6
      00ADE5                        338 FDOT2: ; e<0 
      00ADE5 CD A6 67         [ 4]  339     CALL    DDIG 
      00ADE8 CD 85 B4         [ 4]  340     CALL    RFROM
      00ADEB CD 8B E2         [ 4]  341     CALL    ONEP 
      00ADEE CD 88 54         [ 4]  342     CALL    QDUP 
      002D71                        343     _QBRAN  FDOT3 
      00ADF1 CD 85 18         [ 4]    1     CALL QBRAN
      00ADF4 AD FE                    2     .word FDOT3
      00ADF6 CD 86 6A         [ 4]  344     CALL    TOR 
      002D79                        345     _BRAN   FDOT2 
      00ADF9 CD 85 34         [ 4]    1     CALL BRAN 
      00ADFC AD E5                    2     .word FDOT2 
      00ADFE                        346 FDOT3:
      002D7E                        347     _DOLIT  '.' 
      00ADFE CD 84 EF         [ 4]    1     CALL DOLIT 
      00AE01 00 2E                    2     .word '.' 
      00AE03 CD 8E 58         [ 4]  348     CALL    HOLD 
      00AE06 CD A6 80         [ 4]  349     CALL    DDIGS
      002D89                        350     _BRAN   FDOT9  
      00AE09 CD 85 34         [ 4]    1     CALL BRAN 
      00AE0C AE 23                    2     .word FDOT9 
      00AE0E                        351 FDOT6: ; e>=0 
      002D8E                        352     _BRAN   FDOT8
      00AE0E CD 85 34         [ 4]    1     CALL BRAN 
      00AE11 AE 1B                    2     .word FDOT8 
      00AE13                        353 FDOT7:     
      002D93                        354     _DOLIT  '0'
      00AE13 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AE16 00 30                    2     .word '0' 
      00AE18 CD 8E 58         [ 4]  355     CALL    HOLD 
      00AE1B                        356 FDOT8:
      00AE1B CD 85 03         [ 4]  357     CALL    DONXT 
      00AE1E AE 13                  358     .word   FDOT7
      00AE20 CD A6 80         [ 4]  359     CALL    DDIGS 
      00AE23                        360 FDOT9:
      00AE23 CD AB DB         [ 4]  361     CALL    FNE 
      002DA6                        362     _QBRAN  FDOT10 
      00AE26 CD 85 18         [ 4]    1     CALL QBRAN
      00AE29 AE 33                    2     .word FDOT10
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 166.
Hexadecimal [24-Bits]



      002DAB                        363     _DOLIT '-' 
      00AE2B CD 84 EF         [ 4]    1     CALL DOLIT 
      00AE2E 00 2D                    2     .word '-' 
      00AE30 CD 8E 58         [ 4]  364     CALL   HOLD 
      00AE33                        365 FDOT10:
      00AE33 CD 8E AD         [ 4]  366     CALL    EDIGS 
      00AE36 CD 8F AE         [ 4]  367     CALL    TYPES 
      00AE39 CD 85 B4         [ 4]  368     CALL    RFROM 
      00AE3C CD 87 67         [ 4]  369     CALL    BASE 
      00AE3F CD 85 51         [ 4]  370     CALL    STORE 
      00AE42 81               [ 4]  371     RET 
                                    372 
                                    373 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    374 ; return parsed exponent or 
                                    375 ; 0 if failed
                                    376 ; at entry exprect *a=='E'    
                                    377 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00AE43                        378 parse_exponent: ; a cntr -- e -1 | 0 
      00AE43 CD 86 6A         [ 4]  379     CALL TOR   ; R: cntr 
      00AE46 CD 86 A1         [ 4]  380     CALL DUPP 
      00AE49 CD 85 81         [ 4]  381     CALL CAT 
      002DCC                        382     _DOLIT 'E' 
      00AE4C CD 84 EF         [ 4]    1     CALL DOLIT 
      00AE4F 00 45                    2     .word 'E' 
      00AE51 CD 89 65         [ 4]  383     CALL EQUAL 
      002DD4                        384     _QBRAN 1$
      00AE54 CD 85 18         [ 4]    1     CALL QBRAN
      00AE57 AE 84                    2     .word 1$
      00AE59 CD 8B E2         [ 4]  385     CALL ONEP 
      00AE5C CD 85 B4         [ 4]  386     CALL RFROM  ; a cntr 
      00AE5F CD 8B EF         [ 4]  387     CALL ONEM
      00AE62 CD 86 A1         [ 4]  388     CALL DUPP 
      002DE5                        389     _QBRAN 2$ ; a cntr 
      00AE65 CD 85 18         [ 4]    1     CALL QBRAN
      00AE68 AE 87                    2     .word 2$
      00AE6A CD 8C 4E         [ 4]  390     CALL ZERO
      00AE6D CD 86 A1         [ 4]  391     CALL DUPP 
      00AE70 CD A7 17         [ 4]  392     CALL DSWAP ; 0 0 a cntr  
      00AE73 CD A4 A2         [ 4]  393     CALL nsign 
      00AE76 CD 86 6A         [ 4]  394     CALL TOR   ; R: esign  
      00AE79 CD A4 DA         [ 4]  395     CALL parse_digits
      002DFC                        396     _QBRAN PARSEXP_SUCCESS ; parsed to end of string 
      00AE7C CD 85 18         [ 4]    1     CALL QBRAN
      00AE7F AE 8E                    2     .word PARSEXP_SUCCESS
                                    397 ; failed invalid character
      00AE81 CD 88 A6         [ 4]  398     CALL DDROP ; 0 a 
      00AE84                        399 1$: 
      00AE84 CD 85 B4         [ 4]  400     CALL RFROM ; sign||cntr  
      00AE87                        401 2$:
      00AE87 CD 88 A6         [ 4]  402     CALL DDROP  ; a cntr || a sign || 0 cntr   
      00AE8A CD 8C 4E         [ 4]  403     CALL ZERO   ; return only 0 
      00AE8D 81               [ 4]  404     RET 
      00AE8E                        405 PARSEXP_SUCCESS: 
      00AE8E CD 88 A6         [ 4]  406     CALL DDROP ; drop dhi a 
      00AE91 CD 85 B4         [ 4]  407     CALL RFROM ; es 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 167.
Hexadecimal [24-Bits]



      002E14                        408     _QBRAN 1$
      00AE94 CD 85 18         [ 4]    1     CALL QBRAN
      00AE97 AE 9C                    2     .word 1$
      00AE99 CD 88 F1         [ 4]  409     CALL NEGAT
      00AE9C                        410 1$:
      002E1C                        411     _DOLIT -1 ; -- e -1 
      00AE9C CD 84 EF         [ 4]    1     CALL DOLIT 
      00AE9F FF FF                    2     .word -1 
      00AEA1 81               [ 4]  412     RET 
                                    413 
                                    414 
                                    415 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    416 ;   FLOAT?  ( a dlo dhi a+ cntr sign d? -- f -3 | a 0 )
                                    417 ;   called by NUMBER? 
                                    418 ;   convert string to float 
                                    419 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002E22                        420     _HEADER FLOATQ,5,"FLOAT?"
      00AEA2 AD 96                    1         .word LINK 
                           002E24     2         LINK=.
      00AEA4 05                       3         .byte 5  
      00AEA5 46 4C 4F 41 54 3F        4         .ascii "FLOAT?"
      00AEAB                          5         FLOATQ:
      002E2B                        421     _QBRAN FLOATQ0 
      00AEAB CD 85 18         [ 4]    1     CALL QBRAN
      00AEAE AE B5                    2     .word FLOATQ0
      002E30                        422     _BRAN FLOAT_ERROR  ; not a float, string start with '#'
      00AEB0 CD 85 34         [ 4]    1     CALL BRAN 
      00AEB3 AF 54                    2     .word FLOAT_ERROR 
      00AEB5                        423 FLOATQ0:
                                    424 ; BASE must be 10 
      00AEB5 CD 87 67         [ 4]  425     CALL BASE 
      00AEB8 CD 85 63         [ 4]  426     CALL AT 
      002E3B                        427     _DOLIT 10 
      00AEBB CD 84 EF         [ 4]    1     CALL DOLIT 
      00AEBE 00 0A                    2     .word 10 
      00AEC0 CD 89 65         [ 4]  428     CALL EQUAL 
      002E43                        429     _QBRAN FLOAT_ERROR 
      00AEC3 CD 85 18         [ 4]    1     CALL QBRAN
      00AEC6 AF 54                    2     .word FLOAT_ERROR
                                    430 ; if float next char is '.' or 'E' 
      00AEC8 CD 86 6A         [ 4]  431     CALL TOR ; R: sign  
      00AECB CD 86 6A         [ 4]  432     CALL TOR ; R: sign cntr 
      00AECE CD 86 A1         [ 4]  433     CALL DUPP
      00AED1 CD 85 81         [ 4]  434     CALL CAT 
      002E54                        435     _DOLIT '.' 
      00AED4 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AED7 00 2E                    2     .word '.' 
      00AED9 CD 89 65         [ 4]  436     CALL EQUAL 
      002E5C                        437     _QBRAN FLOATQ1 ; not a dot 
      00AEDC CD 85 18         [ 4]    1     CALL QBRAN
      00AEDF AF 1A                    2     .word FLOATQ1
      00AEE1 CD 8B E2         [ 4]  438     CALL ONEP 
      00AEE4 CD 85 B4         [ 4]  439     CALL RFROM  ; dlo dhi a cntr R: sign  
      00AEE7 CD 8B EF         [ 4]  440     CALL ONEM 
      00AEEA CD 86 A1         [ 4]  441     CALL DUPP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 168.
Hexadecimal [24-Bits]



      00AEED CD 86 6A         [ 4]  442     CALL TOR  ; R: sign cntr 
                                    443 ; parse fractional part
      00AEF0 CD A4 DA         [ 4]  444     CALL parse_digits ; dlo dhi a cntr -- dm a cntr 
      00AEF3 CD 86 A1         [ 4]  445     CALL DUPP 
      00AEF6 CD 85 B4         [ 4]  446     CALL RFROM 
      00AEF9 CD 86 B1         [ 4]  447     CALL SWAPP 
      00AEFC CD 89 3D         [ 4]  448     CALL SUBB ; fd -> fraction digits count 
      00AEFF CD 86 6A         [ 4]  449     CALL TOR  ; dlo dhi a cntr R: sign fd 
      00AF02 CD 86 A1         [ 4]  450     CALL DUPP ; cntr cntr  
      002E85                        451     _QBRAN 1$ ; end of string, no exponent
      00AF05 CD 85 18         [ 4]    1     CALL QBRAN
      00AF08 AF 0F                    2     .word 1$
      002E8A                        452     _BRAN FLOATQ2
      00AF0A CD 85 34         [ 4]    1     CALL BRAN 
      00AF0D AF 23                    2     .word FLOATQ2 
      00AF0F CD 86 B1         [ 4]  453 1$: CALL SWAPP 
      00AF12 CD 86 97         [ 4]  454     CALL DROP ; a
      002E95                        455     _BRAN FLOATQ3        
      00AF15 CD 85 34         [ 4]    1     CALL BRAN 
      00AF18 AF 2B                    2     .word FLOATQ3 
      00AF1A                        456 FLOATQ1: ; must push fd==0 on RSTACK 
      00AF1A CD 85 B4         [ 4]  457     CALL RFROM ; cntr 
      00AF1D CD 8C 4E         [ 4]  458     CALL ZERO  ; fd 
      00AF20 CD 86 6A         [ 4]  459     CALL TOR   ; dm a cntr R: sign fd 
      00AF23                        460 FLOATQ2: 
      00AF23 CD AE 43         [ 4]  461     CALL parse_exponent 
      002EA6                        462     _QBRAN FLOAT_ERROR0 ; exponent expected 
      00AF26 CD 85 18         [ 4]    1     CALL QBRAN
      00AF29 AF 51                    2     .word FLOAT_ERROR0
      00AF2B                        463 FLOATQ3: ; dm 0 || dm e  
      00AF2B CD 85 B4         [ 4]  464     CALL RFROM ;  fd  
      00AF2E CD 89 3D         [ 4]  465     CALL SUBB  ; exp=e-fd 
      00AF31 CD 88 84         [ 4]  466     CALL NROT 
      00AF34 CD 85 B4         [ 4]  467     CALL RFROM  ; sign 
      002EB7                        468     _QBRAN FLOATQ4 
      00AF37 CD 85 18         [ 4]    1     CALL QBRAN
      00AF3A AF 3F                    2     .word FLOATQ4
      00AF3C CD 89 03         [ 4]  469     CALL DNEGA 
      00AF3F                        470 FLOATQ4:
      00AF3F CD 88 65         [ 4]  471     CALL ROT 
      00AF42 CD AC AD         [ 4]  472     CALL STEXP 
      00AF45 CD 88 65         [ 4]  473     CALL ROT 
      00AF48 CD 86 97         [ 4]  474     CALL DROP 
      002ECB                        475     _DOLIT -3 
      00AF4B CD 84 EF         [ 4]    1     CALL DOLIT 
      00AF4E FF FD                    2     .word -3 
      00AF50 81               [ 4]  476     RET       
      00AF51                        477 FLOAT_ERROR0: 
      00AF51 CD A8 81         [ 4]  478     CALL DRFROM ; sign df      
      00AF54                        479 FLOAT_ERROR: 
      00AF54 CD 8C 90         [ 4]  480     CALL DEPTH 
      00AF57 CD 8B D5         [ 4]  481     CALL CELLS 
      00AF5A CD 86 81         [ 4]  482     CALL SPAT 
      00AF5D CD 86 B1         [ 4]  483     CALL SWAPP 
      00AF60 CD 88 C6         [ 4]  484     CALL PLUS  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 169.
Hexadecimal [24-Bits]



      00AF63 CD 86 8E         [ 4]  485     CALL SPSTO 
      00AF66 CD 8C 4E         [ 4]  486     CALL ZERO 
      00AF69 81               [ 4]  487     RET 
                                    488 
                                    489 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    490 ;  LSCALE ( f# -- f# )
                                    491 ;  m *=10 , e -= 1
                                    492 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002EEA                        493     _HEADER LSCALE,6,"LSCALE"
      00AF6A AE A4                    1         .word LINK 
                           002EEC     2         LINK=.
      00AF6C 06                       3         .byte 6  
      00AF6D 4C 53 43 41 4C 45        4         .ascii "LSCALE"
      00AF73                          5         LSCALE:
      00AF73 CD AC 7B         [ 4]  494     CALL ATEXP 
      00AF76 CD 8C 59         [ 4]  495     CALL ONE 
      00AF79 CD 89 3D         [ 4]  496     CALL SUBB 
      00AF7C CD 86 6A         [ 4]  497     CALL TOR
      002EFF                        498     _DOLIT 10 
      00AF7F CD 84 EF         [ 4]    1     CALL DOLIT 
      00AF82 00 0A                    2     .word 10 
      00AF84 CD A6 CE         [ 4]  499     CALL DSSTAR
      00AF87 CD 85 B4         [ 4]  500     CALL RFROM 
      00AF8A CD AC AD         [ 4]  501     CALL STEXP 
      00AF8D 81               [ 4]  502     RET  
                                    503 
                                    504 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    505 ;  RSCALE ( f# -- f# )
                                    506 ;  m /=10 , e+=1 
                                    507 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002F0E                        508     _HEADER RSCALE,6,"RSCALE"
      00AF8E AF 6C                    1         .word LINK 
                           002F10     2         LINK=.
      00AF90 06                       3         .byte 6  
      00AF91 52 53 43 41 4C 45        4         .ascii "RSCALE"
      00AF97                          5         RSCALE:
      00AF97 CD AC 7B         [ 4]  509     CALL ATEXP 
      00AF9A CD 8C 59         [ 4]  510     CALL ONE 
      00AF9D CD 88 C6         [ 4]  511     CALL PLUS 
      00AFA0 CD 86 6A         [ 4]  512     CALL TOR 
      002F23                        513     _DOLIT 10 
      00AFA3 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AFA6 00 0A                    2     .word 10 
      00AFA8 CD A6 26         [ 4]  514     CALL DSLMOD 
      00AFAB CD 88 65         [ 4]  515     CALL ROT 
      00AFAE CD 86 97         [ 4]  516     CALL DROP 
      00AFB1 CD 85 B4         [ 4]  517     CALL RFROM 
      00AFB4 CD AC AD         [ 4]  518     CALL STEXP 
      00AFB7 81               [ 4]  519     RET 
                                    520 
                                    521 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    522 ;  F-ALIGN ( f#1 f#2 -- m1 m2 e )
                                    523 ;  align to same exponent 
                                    524 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002F38                        525     _HEADER FALIGN,7,"F-ALIGN"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 170.
Hexadecimal [24-Bits]



      00AFB8 AF 90                    1         .word LINK 
                           002F3A     2         LINK=.
      00AFBA 07                       3         .byte 7  
      00AFBB 46 2D 41 4C 49 47 4E     4         .ascii "F-ALIGN"
      00AFC2                          5         FALIGN:
      00AFC2 CD AC 7B         [ 4]  526     CALL ATEXP 
      00AFC5 CD 86 6A         [ 4]  527     CALL TOR    ; e2 >R
      00AFC8 CD A7 17         [ 4]  528     CALL DSWAP 
      00AFCB CD AC 7B         [ 4]  529     CALL ATEXP  
      00AFCE CD 86 6A         [ 4]  530     CALL TOR 
      00AFD1 CD A7 17         [ 4]  531     CALL DSWAP  ; m1 m2  R: e2 e1    
      00AFD4                        532 FALGN1:
      00AFD4 CD 96 27         [ 4]  533     CALL JFETCH   ; E2 
      00AFD7 CD 96 1C         [ 4]  534     CALL IFETCH   ; E1 
      00AFDA CD 89 65         [ 4]  535     CALL EQUAL 
      002F5D                        536     _TBRAN FALGN8 
      00AFDD CD 85 26         [ 4]    1     CALL TBRAN 
      00AFE0 B0 28                    2     .word FALGN8 
      00AFE2 CD 96 27         [ 4]  537     CALL JFETCH 
      00AFE5 CD 96 1C         [ 4]  538     CALL IFETCH  
      00AFE8 CD 89 A2         [ 4]  539     CALL LESS ; E2<E1 
      002F6B                        540     _TBRAN FALGN4 
      00AFEB CD 85 26         [ 4]    1     CALL TBRAN 
      00AFEE B0 09                    2     .word FALGN4 
                                    541 ; E2>E1 
      002F70                        542     _DOLIT 10 
      00AFF0 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AFF3 00 0A                    2     .word 10 
      00AFF5 CD A6 CE         [ 4]  543     CALL DSSTAR ; m2*10  
      00AFF8 CD 96 27         [ 4]  544     CALL JFETCH 
      00AFFB CD 8B EF         [ 4]  545     CALL ONEM  ; e2-1 
      00AFFE CD 8C 59         [ 4]  546     CALL ONE 
      00B001 CD 86 44         [ 4]  547     CALL NRSTO  ; update J 
      002F84                        548     _BRAN FALGN1
      00B004 CD 85 34         [ 4]    1     CALL BRAN 
      00B007 AF D4                    2     .word FALGN1 
      00B009                        549 FALGN4: ; E2<E1 
      00B009 CD A7 17         [ 4]  550     CALL DSWAP 
      002F8C                        551     _DOLIT 10 
      00B00C CD 84 EF         [ 4]    1     CALL DOLIT 
      00B00F 00 0A                    2     .word 10 
      00B011 CD A6 CE         [ 4]  552     CALL DSSTAR ; m1*10 
      00B014 CD A7 17         [ 4]  553     CALL DSWAP
      00B017 CD 96 1C         [ 4]  554     CALL IFETCH 
      00B01A CD 8B EF         [ 4]  555     CALL ONEM   ; e1-1 
      00B01D CD 8C 4E         [ 4]  556     CALL ZERO 
      00B020 CD 86 44         [ 4]  557     CALL NRSTO  ; update I   
      002FA3                        558     _BRAN FALGN1     
      00B023 CD 85 34         [ 4]    1     CALL BRAN 
      00B026 AF D4                    2     .word FALGN1 
      00B028                        559 FALGN8:
      00B028 CD A8 81         [ 4]  560     CALL DRFROM 
      00B02B CD 86 97         [ 4]  561     CALL DROP 
      00B02E 81               [ 4]  562     RET 
                                    563 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 171.
Hexadecimal [24-Bits]



                                    564 
                                    565 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    566 ;   F+ ( f#1 f#2 -- f#1+f#2 )
                                    567 ;   float addition 
                                    568 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002FAF                        569     _HEADER FPLUS,2,"F+"
      00B02F AF BA                    1         .word LINK 
                           002FB1     2         LINK=.
      00B031 02                       3         .byte 2  
      00B032 46 2B                    4         .ascii "F+"
      00B034                          5         FPLUS:
      00B034 CD AF C2         [ 4]  570     CALL FALIGN 
      00B037 CD 86 6A         [ 4]  571     CALL TOR 
      00B03A CD AB 27         [ 4]  572     CALL DPLUS  
      00B03D CD 85 B4         [ 4]  573     CALL RFROM 
      00B040 CD AC AD         [ 4]  574     CALL STEXP 
      00B043 81               [ 4]  575     RET 
                                    576 
                                    577 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    578 ;  F- ( f#1 f#2 -- f#1-f#2 )
                                    579 ;  substraction 
                                    580 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002FC4                        581     _HEADER FSUB,2,"F-"
      00B044 B0 31                    1         .word LINK 
                           002FC6     2         LINK=.
      00B046 02                       3         .byte 2  
      00B047 46 2D                    4         .ascii "F-"
      00B049                          5         FSUB:
      00B049 CD AF C2         [ 4]  582     CALL FALIGN 
      00B04C CD 86 6A         [ 4]  583     CALL TOR 
      00B04F CD AB 59         [ 4]  584     CALL DSUB 
      00B052 CD 85 B4         [ 4]  585     CALL RFROM 
      00B055 CD AC AD         [ 4]  586     CALL STEXP 
      00B058 81               [ 4]  587     RET 
                                    588 
                                    589 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    590 ; /mod10  ( m -- m/10 r )
                                    591 ; divide mantissa by 10 
                                    592 ; return quotient and remainder 
                                    593 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00B059                        594 UMOD10:
      002FD9                        595     _DOLIT 10 
      00B059 CD 84 EF         [ 4]    1     CALL DOLIT 
      00B05C 00 0A                    2     .word 10 
      00B05E CD A6 26         [ 4]  596     CALL DSLMOD
      00B061 CD 88 65         [ 4]  597     CALL ROT  
      00B064 81               [ 4]  598     RET 
                                    599 
                                    600 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    601 ;   SCALE>M ( ud1 -- e ud2 )
                                    602 ;   scale down a double  
                                    603 ;   by repeated d/10
                                    604 ;   until ud<=MAX_MANTISSA   
                                    605 ;   e is log10 exponent of scaled down
                                    606 ;   ud2 is scaled down ud1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 172.
Hexadecimal [24-Bits]



                                    607 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002FE5                        608     _HEADER SCALETOM,7,"SCALE>M"
      00B065 B0 46                    1         .word LINK 
                           002FE7     2         LINK=.
      00B067 07                       3         .byte 7  
      00B068 53 43 41 4C 45 3E 4D     4         .ascii "SCALE>M"
      00B06F                          5         SCALETOM:
      00B06F CD 8C 4E         [ 4]  609     CALL ZERO 
      00B072 CD 88 84         [ 4]  610     CALL NROT 
      00B075                        611 SCAL1:
      00B075 CD 86 A1         [ 4]  612     CALL DUPP 
      002FF8                        613     _DOLIT 0X7F 
      00B078 CD 84 EF         [ 4]    1     CALL DOLIT 
      00B07B 00 7F                    2     .word 0X7F 
      00B07D CD 89 C1         [ 4]  614     CALL UGREAT 
      003000                        615     _QBRAN SCAL2  
      00B080 CD 85 18         [ 4]    1     CALL QBRAN
      00B083 B0 99                    2     .word SCAL2
      00B085 CD B0 59         [ 4]  616     CALL UMOD10 
      00B088 CD 86 97         [ 4]  617     CALL DROP 
      00B08B CD 88 65         [ 4]  618     CALL ROT 
      00B08E CD 8B E2         [ 4]  619     CALL ONEP 
      00B091 CD 88 84         [ 4]  620     CALL NROT  
      003014                        621     _BRAN SCAL1 
      00B094 CD 85 34         [ 4]    1     CALL BRAN 
      00B097 B0 75                    2     .word SCAL1 
      00B099                        622 SCAL2: 
      00B099 81               [ 4]  623     RET 
                                    624 
                                    625 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    626 ;  UDIV10 ( ut -- ut )
                                    627 ;  divide a 48 bits uint by 10 
                                    628 ;  used to scale down MM* 
                                    629 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00B09A                        630 UDIV10:
      00B09A 90 93            [ 1]  631     LDW Y,X 
      00B09C 90 FE            [ 2]  632     LDW Y,(Y)
      00B09E A6 0A            [ 1]  633     LD A,#10 
      00B0A0 90 62            [ 2]  634     DIV Y,A 
      00B0A2 FF               [ 2]  635     LDW (X),Y 
      00B0A3 90 95            [ 1]  636     LD YH,A 
      00B0A5 E6 02            [ 1]  637     LD A,(2,X)
      00B0A7 90 97            [ 1]  638     LD YL,A 
      00B0A9 A6 0A            [ 1]  639     LD A,#10 
      00B0AB 90 62            [ 2]  640     DIV Y,A 
      00B0AD 90 95            [ 1]  641     LD YH,A 
      00B0AF 90 9F            [ 1]  642     LD A,YL 
      00B0B1 E7 02            [ 1]  643     LD (2,X),A 
      00B0B3 E6 03            [ 1]  644     LD A,(3,X)
      00B0B5 90 97            [ 1]  645     LD YL,A 
      00B0B7 A6 0A            [ 1]  646     LD A,#10 
      00B0B9 90 62            [ 2]  647     DIV Y,A 
      00B0BB 90 95            [ 1]  648     LD YH,A 
      00B0BD 90 9F            [ 1]  649     LD A,YL 
      00B0BF E7 03            [ 1]  650     LD (3,X),A 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 173.
Hexadecimal [24-Bits]



      00B0C1 E6 04            [ 1]  651     LD A,(4,X)
      00B0C3 90 97            [ 1]  652     LD YL,A 
      00B0C5 A6 0A            [ 1]  653     LD A,#10 
      00B0C7 90 62            [ 2]  654     DIV Y,A 
      00B0C9 90 95            [ 1]  655     LD YH,A 
      00B0CB 90 9F            [ 1]  656     LD A,YL 
      00B0CD E7 04            [ 1]  657     LD (4,X),A 
      00B0CF E6 05            [ 1]  658     LD A,(5,X)
      00B0D1 90 97            [ 1]  659     LD YL,A 
      00B0D3 A6 0A            [ 1]  660     LD A,#10 
      00B0D5 90 62            [ 2]  661     DIV Y,A 
      00B0D7 90 9F            [ 1]  662     LD A,YL 
      00B0D9 E7 05            [ 1]  663     LD (5,X),A 
      00B0DB 81               [ 4]  664     RET 
                                    665 
                                    666 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    667 ;   MM* ( m1 m2 -- m3 e )
                                    668 ;   mantissa product 
                                    669 ;  scale down to 23 bits 
                                    670 ;   e  is log10 scaling factor.
                                    671 ;   The maximum product size 
                                    672 ;   before scaling is 46 bits .
                                    673 ;   UDIV10 is used to scale down.  
                                    674 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00305C                        675     _HEADER MMSTAR,3,"MM*"
      00B0DC B0 67                    1         .word LINK 
                           00305E     2         LINK=.
      00B0DE 03                       3         .byte 3  
      00B0DF 4D 4D 2A                 4         .ascii "MM*"
      00B0E2                          5         MMSTAR:
      00B0E2 CD 88 B1         [ 4]  676     CALL DDUP
      00B0E5 CD A7 EC         [ 4]  677     CALL DZEQUAL
      003068                        678     _TBRAN MMSTA2
      00B0E8 CD 85 26         [ 4]    1     CALL TBRAN 
      00B0EB B0 F8                    2     .word MMSTA2 
      00B0ED                        679 MMSTA1:
      00B0ED CD A9 2A         [ 4]  680     CALL DOVER 
      00B0F0 CD A7 EC         [ 4]  681     CALL DZEQUAL 
      003073                        682     _QBRAN MMSTA3 
      00B0F3 CD 85 18         [ 4]    1     CALL QBRAN
      00B0F6 B1 03                    2     .word MMSTA3
      00B0F8                        683 MMSTA2: ; ( -- 0 0 0 )
      00B0F8 1C 00 02         [ 2]  684     ADDW X,#2 
      00B0FB 90 5F            [ 1]  685     CLRW Y 
      00B0FD FF               [ 2]  686     LDW (X),Y 
      00B0FE EF 02            [ 2]  687     LDW (2,X),Y
      00B100 EF 04            [ 2]  688     LDW (4,X),Y 
      00B102 81               [ 4]  689     RET 
      00B103                        690 MMSTA3:
      00B103 CD A6 0C         [ 4]  691     CALL DSIGN 
      00B106 CD 86 6A         [ 4]  692     CALL TOR    ; R: m2sign 
      00B109 CD A5 F5         [ 4]  693     CALL DABS   ; m1 um2 
      00B10C CD A7 17         [ 4]  694     CALL DSWAP  ; um2 m1 
      00B10F CD A6 0C         [ 4]  695     CALL DSIGN  ; um2 m1 m1sign 
      00B112 CD 85 B4         [ 4]  696     CALL RFROM 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 174.
Hexadecimal [24-Bits]



      00B115 CD 87 27         [ 4]  697     CALL XORR 
      00B118 CD 86 6A         [ 4]  698     CALL TOR   ; R: product_sign 
      00B11B CD A5 F5         [ 4]  699     CALL DABS  ; um2 um1  
      00B11E CD A8 63         [ 4]  700     CALL DTOR  ; um2 
      00B121 CD 86 A1         [ 4]  701     CALL DUPP  ; um2 um2hi 
      00B124 CD 85 C5         [ 4]  702     CALL RAT   ; um2 um2hi um1hi
                                    703 ; first partial product  
                                    704 ; pd1=um2hi*um1hi 
      00B127 CD 8B 61         [ 4]  705     CALL STAR 
      00B12A CD 8C 4E         [ 4]  706     CALL ZERO 
      00B12D CD 86 B1         [ 4]  707     CALL SWAPP ; pd1<<16  
      00B130 CD A7 17         [ 4]  708     CALL DSWAP ; pd1 um2 
      00B133 CD 86 C9         [ 4]  709     CALL OVER  ; pd1 um2 um2lo 
      00B136 CD 85 B4         [ 4]  710     CALL RFROM ; pd1 um2 um2lo um1hi 
                                    711 ; pd2=um2lo*um1hi 
      00B139 CD 8B 17         [ 4]  712     CALL UMSTA ; pd1 um2 pd2 
      00B13C CD A7 17         [ 4]  713     CALL DSWAP ; pd1 pd2 um2 
      00B13F CD 85 C5         [ 4]  714     CALL RAT   ; pd1 pd2 um2 um1lo 
                                    715 ; pd3= um2hi*um1lo 
      00B142 CD 8B 17         [ 4]  716     CALL UMSTA ; pd1 pd2 um2lo pd3 
      00B145 CD 88 65         [ 4]  717     CALL ROT ; pd1 pd2 pd3 um2lo 
      00B148 CD 86 6A         [ 4]  718     CALL TOR ; pd1 pd2 pd3 R: psign um1lo um2lo 
                                    719 ; pd1+pd2+pd3  pd1
      00B14B CD AB 27         [ 4]  720     CALL DPLUS 
      00B14E CD AB 27         [ 4]  721     CALL DPLUS  
      00B151 CD A8 81         [ 4]  722     CALL DRFROM ; triple um2lo um1lo 
                                    723 ; last partial product um2lo*um1lo 
      00B154 CD 8B 17         [ 4]  724     CALL UMSTA ; prod pd4 
                                    725 ; mm*=prod<<16+pd4  
      00B157 CD A8 63         [ 4]  726     CALL DTOR ;   R: psign pd4lo pd4hi  
                                    727  ; add pd4hi to prodlo and propagate carry 
      00B15A 90 93            [ 1]  728     LDW Y,X 
      00B15C 90 EE 02         [ 2]  729     LDW Y,(2,Y)  ; prodlo 
      00B15F 72 F9 01         [ 2]  730     ADDW Y,(1,SP)  ; prodlo+pd4hi 
      00B162 17 01            [ 2]  731     LDW (1,SP),Y    ; plo phi  
      00B164 90 93            [ 1]  732     LDW Y,X
      00B166 90 FE            [ 2]  733     LDW Y,(Y) ; prodhi  
      00B168 24 04            [ 1]  734     JRNC MMSTA4
      00B16A 72 A9 00 01      [ 2]  735     ADDW Y,#1 ; add carry 
      00B16E                        736 MMSTA4:     
      00B16E 1D 00 02         [ 2]  737     SUBW X,#2 
      00B171 FF               [ 2]  738     LDW (X),Y 
      00B172 90 85            [ 2]  739     POPW Y 
      00B174 EF 02            [ 2]  740     LDW (2,X),Y 
      00B176 90 85            [ 2]  741     POPW Y 
      00B178 EF 04            [ 2]  742     LDW (4,X),Y
      00B17A CD 8C 4E         [ 4]  743     CALL ZERO 
      00B17D CD 86 6A         [ 4]  744     CALL TOR 
      00B180                        745 MMSTA5:
      00B180 CD 88 54         [ 4]  746     CALL QDUP 
      003103                        747     _QBRAN MMSTA6 
      00B183 CD 85 18         [ 4]    1     CALL QBRAN
      00B186 B1 99                    2     .word MMSTA6
      00B188 CD B0 9A         [ 4]  748     CALL UDIV10 
      00B18B CD 85 B4         [ 4]  749     CALL RFROM 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 175.
Hexadecimal [24-Bits]



      00B18E CD 8B E2         [ 4]  750     CALL ONEP 
      00B191 CD 86 6A         [ 4]  751     CALL TOR 
      003114                        752     _BRAN MMSTA5 
      00B194 CD 85 34         [ 4]    1     CALL BRAN 
      00B197 B1 80                    2     .word MMSTA5 
                                    753 ; now scale to double 
                                    754 ; scale further <= MAX_MANTISSA 
      00B199                        755 MMSTA6: 
      00B199 CD 85 B4         [ 4]  756     CALL RFROM 
      00B19C CD 88 84         [ 4]  757     CALL NROT 
      00B19F CD B0 6F         [ 4]  758     CALL SCALETOM
      00B1A2 CD A8 63         [ 4]  759     CALL DTOR 
      00B1A5 CD 88 C6         [ 4]  760     CALL PLUS 
      00B1A8 CD A8 81         [ 4]  761     CALL DRFROM 
      00B1AB CD 85 B4         [ 4]  762     CALL RFROM
      00312E                        763     _QBRAN MMSTA7
      00B1AE CD 85 18         [ 4]    1     CALL QBRAN
      00B1B1 B1 B6                    2     .word MMSTA7
      00B1B3 CD 89 03         [ 4]  764     CALL DNEGA
      00B1B6                        765 MMSTA7:
      00B1B6 CD 88 65         [ 4]  766     CALL ROT ; m e 
      00B1B9 81               [ 4]  767     RET 
                                    768 
                                    769 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    770 ;    F* ( f#1 f#2 -- f#3 )
                                    771 ;    float product 
                                    772 ;    f#3=f#1 * f#2 
                                    773 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00313A                        774     _HEADER FSTAR,2,"F*"
      00B1BA B0 DE                    1         .word LINK 
                           00313C     2         LINK=.
      00B1BC 02                       3         .byte 2  
      00B1BD 46 2A                    4         .ascii "F*"
      00B1BF                          5         FSTAR:
      00B1BF CD AC 7B         [ 4]  775     CALL ATEXP ; f#1 m2 e2 
      00B1C2 CD 86 6A         [ 4]  776     CALL TOR   
      00B1C5 CD A7 17         [ 4]  777     CALL DSWAP ; m2 f#1
      00B1C8 CD AC 7B         [ 4]  778     CALL ATEXP ; m2 m1 e1 
      00B1CB CD 85 B4         [ 4]  779     CALL RFROM ; m2 m1 e1 e2 
      00B1CE CD 88 C6         [ 4]  780     CALL PLUS  ; m2 m1 e 
      00B1D1 CD 86 6A         [ 4]  781     CALL TOR   ; m2 m1 R: e 
      00B1D4 CD B0 E2         [ 4]  782     CALL MMSTAR ; m2*m1 e   
      00B1D7 CD 85 B4         [ 4]  783     CALL RFROM 
      00B1DA CD 88 C6         [ 4]  784     CALL PLUS 
      00B1DD CD AC AD         [ 4]  785     CALL STEXP ; f#3 
      00B1E0 81               [ 4]  786     RET 
                                    787 
                                    788 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    789 ;  F/ ( f#1 f#2 -- f#3 )
                                    790 ;  float division
                                    791 ;  f#3 = f#1/f#2
                                    792 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      003161                        793     _HEADER FSLASH,2,"F/"
      00B1E1 B1 BC                    1         .word LINK 
                           003163     2         LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 176.
Hexadecimal [24-Bits]



      00B1E3 02                       3         .byte 2  
      00B1E4 46 2F                    4         .ascii "F/"
      00B1E6                          5         FSLASH:
      00B1E6 CD AC 7B         [ 4]  794     CALL ATEXP  ; f#1 m2 e2 
      00B1E9 CD 86 6A         [ 4]  795     CALL TOR    ; f#1 m2   R: e2 
      00B1EC CD A6 0C         [ 4]  796     CALL DSIGN  ; f#1 m2 m2sign 
      00B1EF CD 86 6A         [ 4]  797     CALL TOR    ; F#1 m2 R: e2 m2s 
      00B1F2 CD A5 F5         [ 4]  798     CALL DABS   ; F#1 um2 
      00B1F5 CD A7 17         [ 4]  799     CALL DSWAP  ; m2 f#1 
      00B1F8 CD AC 7B         [ 4]  800     CALL ATEXP  ; m2 m1 e1 
      00B1FB CD 8C 59         [ 4]  801     CALL ONE    ; e2 slot on rstack  
      00B1FE CD 86 23         [ 4]  802     CALL NRAT   ; m2 m1 e1 e2 
      00B201 CD 88 C6         [ 4]  803     CALL PLUS   ; m2 m1 e 
      00B204 CD 8C 59         [ 4]  804     CALL ONE    ; e slot on rstack 
      00B207 CD 86 44         [ 4]  805     CALL NRSTO  ; m2 m1 R: e m2s 
      00B20A CD A6 0C         [ 4]  806     CALL DSIGN  ; m2 m1 m1sign 
      00B20D CD 85 B4         [ 4]  807     CALL RFROM  ; m2 m1 m1s m2s  
      00B210 CD 87 27         [ 4]  808     CALL XORR   ; m2 m1 quot_sign R: e 
      00B213 CD 85 B4         [ 4]  809     CALL RFROM   
      00B216 CD A8 63         [ 4]  810     CALL DTOR   ; m2 m1 R: qs e  
      00B219 CD A5 F5         [ 4]  811     CALL DABS   ; um2 um1 R: qs e  
      00B21C CD A7 17         [ 4]  812     CALL DSWAP  ; m1 m2 R: qs e
      00B21F CD 88 B1         [ 4]  813     CALL DDUP  ; m1 m2 m2 R: qs e
      00B222 CD A8 63         [ 4]  814     CALL DTOR  ; m1 m2 R: qs e m2 ( keep divisor need later ) 
      00B225 CD AA 33         [ 4]  815     CALL UDSLMOD ; remainder m1/m2 R: e m2 
      00B228                        816 FSLASH1: 
      00B228 CD A9 2A         [ 4]  817     CALL DOVER ; if remainder null done 
      00B22B CD A7 EC         [ 4]  818     CALL DZEQUAL 
      0031AE                        819     _TBRAN FSLASH8 
      00B22E CD 85 26         [ 4]    1     CALL TBRAN 
      00B231 B2 8E                    2     .word FSLASH8 
                                    820 ; get fractional digits from remainder until mantissa saturate
                                    821 ; remainder mantissa R: e divisor 
                                    822 ; check for mantissa saturation 
      00B233 CD 88 B1         [ 4]  823     CALL DDUP 
      0031B6                        824     _DOLIT 0XCCCC 
      00B236 CD 84 EF         [ 4]    1     CALL DOLIT 
      00B239 CC CC                    2     .word 0XCCCC 
      0031BB                        825     _DOLIT 0xC
      00B23B CD 84 EF         [ 4]    1     CALL DOLIT 
      00B23E 00 0C                    2     .word 0xC 
      00B240 CD A8 26         [ 4]  826     CALL DGREAT 
      0031C3                        827     _TBRAN FSLASH8 ; another loop would result in mantissa overflow 
      00B243 CD 85 26         [ 4]    1     CALL TBRAN 
      00B246 B2 8E                    2     .word FSLASH8 
                                    828 ; multiply mantissa by 10 
      0031C8                        829     _DOLIT 10 
      00B248 CD 84 EF         [ 4]    1     CALL DOLIT 
      00B24B 00 0A                    2     .word 10 
      00B24D CD 8C 4E         [ 4]  830     CALL ZERO 
      00B250 CD A9 D0         [ 4]  831     CALL DSTAR 
                                    832 ; mutliply remainder by 10     
      00B253 CD A7 17         [ 4]  833     CALL DSWAP 
      0031D6                        834     _DOLIT 10 
      00B256 CD 84 EF         [ 4]    1     CALL DOLIT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 177.
Hexadecimal [24-Bits]



      00B259 00 0A                    2     .word 10 
      00B25B CD 8C 4E         [ 4]  835     CALL ZERO 
      00B25E CD A9 D0         [ 4]  836     CALL DSTAR 
                                    837 ; divide remainder by m2     
      00B261 CD A8 99         [ 4]  838     CALL DRAT  ; mantissa remainder divisor R: e divisor 
      00B264 CD AA 33         [ 4]  839     CALL UDSLMOD ; mantissa dr dq R: qs e divisor 
      00B267 CD A7 17         [ 4]  840     CALL DSWAP ; mantissa frac_digit remainder R: qs e divisor  
      00B26A CD A8 63         [ 4]  841     CALL DTOR  ; mantissa frac_digit R: qs e divisor remainder 
      00B26D CD AB 27         [ 4]  842     CALL DPLUS ; mantissa+frac_digit 
      00B270 CD A8 81         [ 4]  843     CALL DRFROM ; mantissa remainder R: qs e divisor  
      00B273 CD A7 17         [ 4]  844     CALL DSWAP  ; remainder mantissa  
                                    845 ; increment e 
      0031F6                        846     _DOLIT 2    ; e slot on rstack 
      00B276 CD 84 EF         [ 4]    1     CALL DOLIT 
      00B279 00 02                    2     .word 2 
      00B27B CD 86 23         [ 4]  847     CALL NRAT   ;  2 NR@ -- e 
      00B27E CD 8B E2         [ 4]  848     CALL ONEP   ; increment exponent 
      003201                        849     _DOLIT 2 
      00B281 CD 84 EF         [ 4]    1     CALL DOLIT 
      00B284 00 02                    2     .word 2 
      00B286 CD 86 44         [ 4]  850     CALL NRSTO  ; e 2 NR! , update e on rstack     
      003209                        851     _BRAN FSLASH1
      00B289 CD 85 34         [ 4]    1     CALL BRAN 
      00B28C B2 28                    2     .word FSLASH1 
      00B28E                        852 FSLASH8: ; remainder mantissa R: qs e divisor 
      00B28E CD A7 17         [ 4]  853     CALL DSWAP  
      00B291 CD 88 A6         [ 4]  854     CALL DDROP  ; drop remainder     
      00B294 CD A8 81         [ 4]  855     CALL DRFROM
      00B297 CD 88 A6         [ 4]  856     CALL DDROP  ; drop divisor 
      00B29A CD 96 27         [ 4]  857     CALL JFETCH    ; quotient sign 
      00321D                        858     _QBRAN FSLASH9 
      00B29D CD 85 18         [ 4]    1     CALL QBRAN
      00B2A0 B2 A5                    2     .word FSLASH9
      00B2A2 CD 89 03         [ 4]  859     CALL DNEGA  
      00B2A5                        860 FSLASH9:
      00B2A5 CD 85 B4         [ 4]  861     CALL RFROM  ; exponent 
      00B2A8 CD AC AD         [ 4]  862     CALL STEXP 
      00B2AB CD 85 B4         [ 4]  863     CALL RFROM 
      00B2AE CD 86 97         [ 4]  864     CALL DROP ; drop qs 
      00B2B1 81               [ 4]  865     RET 
                                    866 
                                    867 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    868 ;   D>F  ( # -- f# )
                                    869 ;   convert double to float 
                                    870 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      003232                        871     _HEADER DTOF,3,"D>F"
      00B2B2 B1 E3                    1         .word LINK 
                           003234     2         LINK=.
      00B2B4 03                       3         .byte 3  
      00B2B5 44 3E 46                 4         .ascii "D>F"
      00B2B8                          5         DTOF:
      00B2B8 CD A6 0C         [ 4]  872     CALL DSIGN 
      00B2BB CD 86 6A         [ 4]  873     CALL TOR
      00B2BE CD A5 F5         [ 4]  874     CALL DABS  
      00B2C1                        875 DTOF1:      
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 178.
Hexadecimal [24-Bits]



      00B2C1 CD B0 6F         [ 4]  876     CALL SCALETOM 
      00B2C4 CD 85 B4         [ 4]  877     CALL RFROM
      003247                        878     _QBRAN DTOF2 
      00B2C7 CD 85 18         [ 4]    1     CALL QBRAN
      00B2CA B2 CF                    2     .word DTOF2
      00B2CC CD 89 03         [ 4]  879     CALL DNEGA 
      00B2CF                        880 DTOF2: 
      00B2CF CD 88 65         [ 4]  881     CALL ROT 
      00B2D2 CD AC AD         [ 4]  882     CALL STEXP 
      00B2D5 81               [ 4]  883     RET 
                                    884 
                                    885 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    886 ;   F>D  ( f# -- # )
                                    887 ;  convert float to double 
                                    888 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      003256                        889     _HEADER FTOD,3,"F>D"
      00B2D6 B2 B4                    1         .word LINK 
                           003258     2         LINK=.
      00B2D8 03                       3         .byte 3  
      00B2D9 46 3E 44                 4         .ascii "F>D"
      00B2DC                          5         FTOD:
      00B2DC CD AC 7B         [ 4]  890     CALL ATEXP ; m e 
      00B2DF CD 88 54         [ 4]  891     CALL QDUP
      003262                        892     _QBRAN FTOD9
      00B2E2 CD 85 18         [ 4]    1     CALL QBRAN
      00B2E5 B3 72                    2     .word FTOD9
      00B2E7 CD 86 6A         [ 4]  893     CALL TOR 
      00B2EA CD A6 0C         [ 4]  894     CALL DSIGN 
      00B2ED CD 88 84         [ 4]  895     CALL NROT 
      00B2F0 CD A5 F5         [ 4]  896     CALL DABS
      00B2F3 CD 85 B4         [ 4]  897     CALL RFROM  
      00B2F6 CD 86 A1         [ 4]  898     CALL DUPP   
      00B2F9 CD 86 D8         [ 4]  899     CALL ZLESS 
      00327C                        900     _QBRAN FTOD4 
      00B2FC CD 85 18         [ 4]    1     CALL QBRAN
      00B2FF B3 3A                    2     .word FTOD4
                                    901 ; negative exponent 
      00B301 CD 89 57         [ 4]  902     CALL ABSS 
      00B304 CD 86 6A         [ 4]  903     CALL TOR
      003287                        904     _BRAN FTOD2  
      00B307 CD 85 34         [ 4]    1     CALL BRAN 
      00B30A B3 25                    2     .word FTOD2 
      00B30C                        905 FTOD1:
      00B30C CD 88 B1         [ 4]  906     CALL DDUP 
      00B30F CD A7 EC         [ 4]  907     CALL DZEQUAL 
      003292                        908     _TBRAN FTOD3 
      00B312 CD 85 26         [ 4]    1     CALL TBRAN 
      00B315 B3 2F                    2     .word FTOD3 
      003297                        909     _DOLIT 10 
      00B317 CD 84 EF         [ 4]    1     CALL DOLIT 
      00B31A 00 0A                    2     .word 10 
      00B31C CD A6 26         [ 4]  910     CALL DSLMOD 
      00B31F CD 88 65         [ 4]  911     CALL ROT 
      00B322 CD 86 97         [ 4]  912     CALL DROP
      00B325                        913 FTOD2:      
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 179.
Hexadecimal [24-Bits]



      0032A5                        914     _DONXT FTOD1
      00B325 CD 85 03         [ 4]    1     CALL DONXT 
      00B328 B3 0C                    2     .word FTOD1 
      0032AA                        915     _BRAN FTOD8   
      00B32A CD 85 34         [ 4]    1     CALL BRAN 
      00B32D B3 67                    2     .word FTOD8 
      00B32F                        916 FTOD3: 
      00B32F CD 85 B4         [ 4]  917     CALL RFROM 
      00B332 CD 86 97         [ 4]  918     CALL DROP 
      0032B5                        919     _BRAN FTOD8  
      00B335 CD 85 34         [ 4]    1     CALL BRAN 
      00B338 B3 67                    2     .word FTOD8 
                                    920 ; positive exponent 
      00B33A                        921 FTOD4:
      00B33A CD 86 6A         [ 4]  922     CALL TOR 
      0032BD                        923     _BRAN FTOD6
      00B33D CD 85 34         [ 4]    1     CALL BRAN 
      00B340 B3 62                    2     .word FTOD6 
      00B342                        924 FTOD5:
      00B342 CD 88 B1         [ 4]  925     CALL DDUP 
      0032C5                        926     _DOLIT 0XCCCC
      00B345 CD 84 EF         [ 4]    1     CALL DOLIT 
      00B348 CC CC                    2     .word 0XCCCC 
      0032CA                        927     _DOLIT 0XCCC  
      00B34A CD 84 EF         [ 4]    1     CALL DOLIT 
      00B34D 0C CC                    2     .word 0XCCC 
      00B34F CD A8 26         [ 4]  928     CALL DGREAT 
      0032D2                        929     _TBRAN FTOD3 
      00B352 CD 85 26         [ 4]    1     CALL TBRAN 
      00B355 B3 2F                    2     .word FTOD3 
      0032D7                        930     _DOLIT 10 
      00B357 CD 84 EF         [ 4]    1     CALL DOLIT 
      00B35A 00 0A                    2     .word 10 
      00B35C CD 8C 4E         [ 4]  931     CALL ZERO 
      00B35F CD A9 D0         [ 4]  932     CALL DSTAR 
      00B362                        933 FTOD6: 
      0032E2                        934     _DONXT FTOD5 
      00B362 CD 85 03         [ 4]    1     CALL DONXT 
      00B365 B3 42                    2     .word FTOD5 
      00B367                        935 FTOD8:
      00B367 CD 88 65         [ 4]  936     CALL ROT 
      0032EA                        937     _QBRAN FTOD9 
      00B36A CD 85 18         [ 4]    1     CALL QBRAN
      00B36D B3 72                    2     .word FTOD9
      00B36F CD 89 03         [ 4]  938     CALL DNEGA
      00B372                        939 FTOD9:          
      00B372 81               [ 4]  940     RET 
                                    941 
                                    942 
                                    943 ;;;;;;;;;;;;;;;;;;;;;;;;
                                    944 ;   F0< ( f# -- f )
                                    945 ;   true if f#<0
                                    946 ;;;;;;;;;;;;;;;;;;;;;;;;
      0032F3                        947     _HEADER FZLESS,3,"F0<"
      00B373 B2 D8                    1         .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 180.
Hexadecimal [24-Bits]



                           0032F5     2         LINK=.
      00B375 03                       3         .byte 3  
      00B376 46 30 3C                 4         .ascii "F0<"
      00B379                          5         FZLESS:
      00B379 CD AC 7B         [ 4]  948     CALL ATEXP 
      00B37C CD 86 97         [ 4]  949     CALL DROP 
      00B37F CD 86 B1         [ 4]  950     CALL SWAPP 
      00B382 CD 86 97         [ 4]  951     CALL DROP 
      00B385 CD 86 D8         [ 4]  952     CALL ZLESS 
      00B388 81               [ 4]  953     RET
                                    954 
                                    955 ;;;;;;;;;;;;;;;;;;;;;;;;
                                    956 ;   F< ( f#1 f#2 -- f )
                                    957 ; true if f#1 < f#1 
                                    958 ;;;;;;;;;;;;;;;;;;;;;;;
      003309                        959     _HEADER FLESS,2,"F<"
      00B389 B3 75                    1         .word LINK 
                           00330B     2         LINK=.
      00B38B 02                       3         .byte 2  
      00B38C 46 3C                    4         .ascii "F<"
      00B38E                          5         FLESS:
      00B38E CD B0 49         [ 4]  960     CALL FSUB  
      00B391 CC B3 79         [ 2]  961     JP FZLESS
                                    962 
                                    963 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                    964 ;   F> ( f#1 f#2 -- f )
                                    965 ;   true fi f#1>f#2
                                    966 ;;;;;;;;;;;;;;;;;;;;;;;;;
      003314                        967     _HEADER FGREAT,2,"F>"
      00B394 B3 8B                    1         .word LINK 
                           003316     2         LINK=.
      00B396 02                       3         .byte 2  
      00B397 46 3E                    4         .ascii "F>"
      00B399                          5         FGREAT:
      00B399 CD A7 17         [ 4]  968     CALL DSWAP 
      00B39C CC B3 8E         [ 2]  969     JP FLESS 
                                    970 
                                    971 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                    972 ;   F= ( f#1 f#2 -- f ) 
                                    973 ;   true fi f#1==f#2 
                                    974 ;;;;;;;;;;;;;;;;;;;;;;;;;
      00331F                        975     _HEADER FEQUAL,2,"F="
      00B39F B3 96                    1         .word LINK 
                           003321     2         LINK=.
      00B3A1 02                       3         .byte 2  
      00B3A2 46 3D                    4         .ascii "F="
      00B3A4                          5         FEQUAL:
      00B3A4 CC A8 05         [ 2]  976     JP DEQUAL 
                                    977 
                                    978 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    979 ;   F0= ( f# -- f )
                                    980 ;   true fi f# is 0.0 
                                    981 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      003327                        982     _HEADER FZEQUAL,3,"F0="
      00B3A7 B3 A1                    1         .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 181.
Hexadecimal [24-Bits]



                           003329     2         LINK=.
      00B3A9 03                       3         .byte 3  
      00B3AA 46 30 3D                 4         .ascii "F0="
      00B3AD                          5         FZEQUAL:
      00B3AD CD AC 7B         [ 4]  983     CALL ATEXP 
      00B3B0 CD 86 97         [ 4]  984     CALL DROP 
      00B3B3 CC A7 EC         [ 2]  985     JP DZEQUAL  
                                    986 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 182.
Hexadecimal [24-Bits]



                                   4471 .endif 
                                   4472 
                                   4473 ;===============================================================
                                   4474 
                           003329  4475 LASTN =	LINK   ;last name defined
                                   4476 
                                   4477 ; application code begin here
      00B400                       4478 	.bndry 128 ; align on flash block  
      00B400                       4479 app_space: 
                                   4480 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 183.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   6 AB1        0008E0 R   |   6 ABOR1      0013B9 R
  6 ABOR2      0013D0 R   |   6 ABORQ      0013B1 R   |   6 ABORT      0013A2 R
  6 ABRTQ      001693 R   |   6 ABSS       0008D7 R   |   6 ACCEP      001338 R
  6 ACCP1      001341 R   |   6 ACCP2      001367 R   |   6 ACCP3      00136A R
  6 ACCP4      00136C R   |     ADC_CR1 =  005401     |     ADC_CR1_=  000000 
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
  6 AFT        00167E R   |   6 AGAIN      0015D4 R   |   6 AHEAD      001631 R
  6 ALLOT      0014E1 R   |   6 ANDD       00067E R   |     APP_CP  =  004004 
    APP_LAST=  004000     |     APP_RUN =  004002     |     APP_VP  =  004006 
  6 AT         0004E3 R   |   6 ATEXE      000CE1 R   |   6 ATEXP      002BFB R
  6 ATEXP1     002C10 R   |   6 ATEXP2     002C20 R   |   6 AUTORUN    000129 R
    AWU_APR =  0050F1     |     AWU_CSR =  0050F0     |     AWU_TBR =  0050F2 
    B0_MASK =  000001     |     B115200 =  000006     |   6 B115K2     0003E0 R
    B19200  =  000003     |   6 B19K2      0003BD R   |     B1_MASK =  000002 
    B230400 =  000007     |     B2400   =  000000     |   6 B2K4       00038E R
    B2_MASK =  000004     |     B38400  =  000004     |     B3_MASK =  000008 
    B460800 =  000008     |     B4800   =  000001     |   6 B4K8       00039C R
    B4_MASK =  000010     |     B57600  =  000005     |   6 B57K6      0003CE R
    B5_MASK =  000020     |     B6_MASK =  000040     |     B7_MASK =  000080 
    B921600 =  000009     |     B9600   =  000002     |   6 B9K6       0003AC R
  6 BACK1      0012E0 R   |   6 BASE       0006E7 R   |     BASEE   =  00000A 
  6 BAUD       0003F0 R   |     BCNT    =  000001     |   6 BCOMP      001524 R
  6 BDIGS      000DC8 R   |     BEEP_BIT=  000004     |     BEEP_CSR=  0050F3 
    BEEP_MAS=  000010     |     BEEP_POR=  00000F     |   6 BEGIN      0015B6 R
    BIT0    =  000000     |     BIT1    =  000001     |     BIT2    =  000002 
    BIT3    =  000003     |     BIT4    =  000004     |     BIT5    =  000005 
    BIT6    =  000006     |     BIT7    =  000007     |   6 BKSLA      001135 R
  6 BKSP       0012B0 R   |     BKSPP   =  000008     |   6 BLANK      000BC1 R
    BLOCK_SI=  000080     |     BOOT_ROM=  006000     |     BOOT_ROM=  007FFF 
  6 BRAN       0004B4 R   |     BTW     =  000001     |   6 BUF2ROW    0020F5 R
  6 BYE        0000B6 R   |     CADR    =  000003     |     CALLL   =  0000CD 
  6 CALLOT     00233E R   |     CAN_DGR =  005426     |     CAN_FPSR=  005427 
    CAN_IER =  005425     |     CAN_MCR =  005420     |     CAN_MSR =  005421 
    CAN_P0  =  005428     |     CAN_P1  =  005429     |     CAN_P2  =  00542A 
    CAN_P3  =  00542B     |     CAN_P4  =  00542C     |     CAN_P5  =  00542D 
    CAN_P6  =  00542E     |     CAN_P7  =  00542F     |     CAN_P8  =  005430 
    CAN_P9  =  005431     |     CAN_PA  =  005432     |     CAN_PB  =  005433 
    CAN_PC  =  005434     |     CAN_PD  =  005435     |     CAN_PE  =  005436 
    CAN_PF  =  005437     |     CAN_RFR =  005424     |     CAN_TPR =  005423 
    CAN_TSR =  005422     |     CARRY   =  00002A     |     CASE_SEN=  000000 
  6 CAT        000501 R   |   6 CCOMMA     001506 R   |     CC_C    =  000000 
    CC_H    =  000004     |     CC_I0   =  000003     |     CC_I1   =  000005 
    CC_N    =  000002     |     CC_V    =  000007     |     CC_Z    =  000001 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 184.
Hexadecimal [24-Bits]

Symbol Table

    CELLL   =  000002     |   6 CELLM      000B46 R   |   6 CELLP      000B37 R
  6 CELLS      000B55 R   |     CFG_GCR =  007F60     |     CFG_GCR_=  000001 
    CFG_GCR_=  000000     |   6 CHAR1      000F1E R   |   6 CHAR2      000F21 R
  6 CHKIVEC    001FE3 R   |     CLKOPT  =  004807     |     CLKOPT_C=  000002 
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
    CLK_SWR_=  0000D2     |   6 CMOV1      000D00 R   |   6 CMOV2      000D18 R
  6 CMOVE      000CF8 R   |     CNTDWN  =  000032     |   6 CNTXT      00076A R
  6 COLD       001AE4 R   |   6 COLD1      001AE4 R   |   6 COLON      001836 R
  6 COMMA      0014EF R   |   6 COMPI      001534 R   |     COMPO   =  000040 
  6 CONSTANT   0018E0 R   |   6 COUNT      000C94 R   |   6 CPP        000786 R
    CPU_A   =  007F00     |     CPU_CCR =  007F0A     |     CPU_PCE =  007F01 
    CPU_PCH =  007F02     |     CPU_PCL =  007F03     |     CPU_SPH =  007F08 
    CPU_SPL =  007F09     |     CPU_XH  =  007F04     |     CPU_XL  =  007F05 
    CPU_YH  =  007F06     |     CPU_YL  =  007F07     |   6 CR         000F46 R
  6 CREAT      00187C R   |     CRR     =  00000D     |   6 CSTOR      0004F0 R
  6 CTABLE     00235F R   |   6 CTAT       002380 R   |   6 CTINIT     0023A8 R
  6 D2SLASH    0028C3 R   |   6 D2STAR     0028DA R   |   6 DABS       002575 R
  6 DABS1      002583 R   |   6 DAT        000C78 R   |     DATSTK  =  001680 
  6 DCLZ       0026C5 R   |   6 DCLZ1      0026CE R   |   6 DCLZ4      0026D7 R
  6 DCLZ8      0026E4 R   |   6 DCONST     001915 R   |   6 DDIG       0025E7 R
  6 DDIGS      002600 R   |   6 DDOT       002617 R   |   6 DDOT0      00262B R
  6 DDOT1      002641 R   |   6 DDROP      000826 R   |   6 DDSLMOD    002A68 R
  6 DDSTAR3    0029A9 R   |   6 DDUP       000831 R   |     DEBUG_BA=  007F00 
    DEBUG_EN=  007FFF     |   6 DECIM      000E78 R   |   6 DEPTH      000C10 R
  6 DEQU4      00279A R   |   6 DEQUAL     002785 R   |     DEVID_BA=  0048CD 
    DEVID_EN=  0048D8     |     DEVID_LO=  0048D2     |     DEVID_LO=  0048D3 
    DEVID_LO=  0048D4     |     DEVID_LO=  0048D5     |     DEVID_LO=  0048D6 
    DEVID_LO=  0048D7     |     DEVID_LO=  0048D8     |     DEVID_WA=  0048D1 
    DEVID_XH=  0048CE     |     DEVID_XL=  0048CD     |     DEVID_YH=  0048D0 
    DEVID_YL=  0048CF     |   6 DGREAT     0027A6 R   |   6 DGTQ1      000EBD R
  6 DI         0000C4 R   |   6 DIG        000DF1 R   |   6 DIGIT      000D8C R
  6 DIGS       000E02 R   |   6 DIGS1      000E02 R   |   6 DIGS2      000E0F R
  6 DIGTQ      000E8C R   |     DISCOVER=  000000     |   6 DLESS      0027B1 R
  6 DLESS4     0027C5 R   |   6 DLITER     002883 R   |   6 DLSHIFT    0028F6 R
  6 DLSHIFT1   002907 R   |   6 DLSHIFT2   00291C R   |     DM_BK1RE=  007F90 
    DM_BK1RH=  007F91     |     DM_BK1RL=  007F92     |     DM_BK2RE=  007F93 
    DM_BK2RH=  007F94     |     DM_BK2RL=  007F95     |     DM_CR1  =  007F96 
    DM_CR2  =  007F97     |     DM_CSR1 =  007F98     |     DM_CSR2 =  007F99 
    DM_ENFCT=  007F9A     |   6 DN1        00089E R   |   6 DNEGA      000883 R
  6 DOCONST    001900 R   |   6 DOLIT      00046F R   |   6 DONXT      000483 R
    DOORBELL=  000000     |   6 DOSTR      000F56 R   |   6 DOT        000FED R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 185.
Hexadecimal [24-Bits]

Symbol Table

  6 DOT1       001003 R   |   6 DOTI1      001A65 R   |   6 DOTID      001A4F R
  6 DOTO1      001445 R   |   6 DOTOK      00142B R   |   6 DOTPR      001116 R
  6 DOTQ       0016AD R   |   6 DOTQP      000F73 R   |   6 DOTR       000F81 R
  6 DOTS       0019F1 R   |   6 DOTS1      0019FC R   |   6 DOTS2      001A05 R
  6 DOVAR      0006D7 R   |   6 DOVER      0028AA R   |   6 DO_DCONS   001938 R
  6 DPLUS      002AA7 R   |   6 DPLUS1     002ACE R   |   6 DRAT       002819 R
  6 DRFROM     002801 R   |   6 DROP       000617 R   |   6 DROT       002731 R
  6 DRSHIFT    00292D R   |   6 DRSHIFT1   002934 R   |   6 DRSHIFT2   00294A R
  6 DSIGN      00258C R   |   6 DSIGN1     002596 R   |   6 DSLA9      002A92 R
  6 DSLASH     002A98 R   |   6 DSLMOD     0025A6 R   |   6 DSLMOD3    0025C1 R
  6 DSLMOD4    0025CD R   |   6 DSLMODa    0025C8 R   |   6 DSLMODb    0025D3 R
  6 DSSTAR     00264E R   |   6 DSSTAR1    002665 R   |   6 DSSTAR3    00268E R
  6 DSTAR      002950 R   |   6 DSTOR      000C5F R   |   6 DSUB       002AD9 R
  6 DSUB1      002B00 R   |   6 DSWAP      002697 R   |   6 DTOF       003238 R
  6 DTOF1      003241 R   |   6 DTOF2      00324F R   |   6 DTOR       0027E3 R
  6 DUMP       0019A7 R   |   6 DUMP1      0019BE R   |   6 DUMP3      0019E0 R
  6 DUMPP      001976 R   |   6 DUPP       000621 R   |   6 DVARIA     002837 R
  6 DZEQUAL    00276C R   |   6 DZLESS     0027CC R   |   6 DZLESS1    0027D6 R
  6 EDIGS      000E2D R   |   6 EDOT       002C7B R   |   6 EDOT0      002C92 R
  6 EDOT1      002CA0 R   |   6 EDOT2      002CA6 R   |   6 EDOT3      002CBF R
  6 EDOT4      002CEE R   |   6 EDOT5      002D0A R   |   6 EECSTORE   001D94 R
  6 EEPCP      001BBA R   |   6 EEPLAST    001B8D R   |   6 EEPROM     001B75 R
    EEPROM_B=  004000     |     EEPROM_E=  0047FF     |     EEPROM_R=  000010 
    EEPROM_S=  000800     |   6 EEPRUN     001BA4 R   |   6 EEPVP      001BD0 R
  6 EESTORE    001DE0 R   |   6 EE_CCOMM   0020AA R   |   6 EE_COMMA   002089 R
  6 EE_CREAD   001D25 R   |   6 EE_READ    001D03 R   |   6 EI         0000BD R
  6 ELSEE      00160C R   |   6 EMIT       000436 R   |   6 ENEPER     0022CA R
    EOL_CR  =  000001     |     EOL_LF  =  000000     |   6 EQ1        0008FB R
  6 EQUAL      0008E5 R   |   6 ERASE      000D5A R   |     ERR     =  00001B 
  6 EVAL       00146E R   |   6 EVAL1      00146E R   |   6 EVAL2      00148A R
  6 EXE1       000CEF R   |   6 EXECU      0004C4 R   |     EXT     =  000000 
    EXTI_CR1=  0050A0     |     EXTI_CR2=  0050A1     |   6 EXTRC      000DB4 R
  6 FADDR      002177 R   |   6 FALGN1     002F54 R   |   6 FALGN4     002F89 R
  6 FALGN8     002FA8 R   |   6 FALIGN     002F42 R   |   6 FARAT      001C3B R
  6 FARCAT     001C47 R   |   6 FC_XOFF    000463 R   |   6 FC_XON     00044D R
  6 FDOT       002D19 R   |   6 FDOT0      002D57 R   |   6 FDOT1      002D46 R
  6 FDOT10     002DB3 R   |   6 FDOT2      002D65 R   |   6 FDOT3      002D7E R
  6 FDOT6      002D8E R   |   6 FDOT7      002D93 R   |   6 FDOT8      002D9B R
  6 FDOT9      002DA3 R   |   6 FEQUAL     003324 R   |   6 FER        002B3B R
  6 FGREAT     003319 R   |     FHSE    =  7A1200     |     FHSI    =  F42400 
  6 FILL       000D27 R   |   6 FILL1      000D44 R   |   6 FILL2      000D4D R
  6 FIND       00120C R   |   6 FIND1      00122A R   |   6 FIND2      001258 R
  6 FIND3      001264 R   |   6 FIND4      001278 R   |   6 FIND5      001285 R
  6 FIND6      001269 R   |   6 FINIT      002B31 R   |     FLASH_BA=  008000 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 186.
Hexadecimal [24-Bits]

Symbol Table

    FLASH_NF=  000003     |     FLASH_NF=  000004     |     FLASH_NF=  000005 
    FLASH_PU=  005062     |     FLASH_PU=  000056     |     FLASH_PU=  0000AE 
    FLASH_SI=  020000     |     FLASH_WS=  00480D     |   6 FLESS      00330E R
  6 FLOATQ     002E2B R   |   6 FLOATQ0    002E35 R   |   6 FLOATQ1    002E9A R
  6 FLOATQ2    002EA3 R   |   6 FLOATQ3    002EAB R   |   6 FLOATQ4    002EBF R
  6 FLOAT_ER   002ED4 R   |   6 FLOAT_ER   002ED1 R   |     FLSI    =  01F400 
  6 FMOVE      002182 R   |   6 FMOVE2     0021B3 R   |   6 FNE        002B5B R
  6 FOR        00157E R   |   6 FORGET     00015A R   |   6 FORGET1    000189 R
  6 FORGET2    00020F R   |   6 FORGET4    000218 R   |   6 FORGET6    0001D1 R
  6 FOV        002B70 R   |   6 FPLUS      002FB4 R   |   6 FPSTOR     001B56 R
  6 FPSW       002B0D R   |     FPTR    =  000034     |   6 FREEVAR    000225 R
  6 FREEVAR4   00025B R   |   6 FRESET     002B1F R   |   6 FSLASH     003166 R
  6 FSLASH1    0031A8 R   |   6 FSLASH8    00320E R   |   6 FSLASH9    003225 R
  6 FSTAR      00313F R   |   6 FSUB       002FC9 R   |   6 FTOD       00325C R
  6 FTOD1      00328C R   |   6 FTOD2      0032A5 R   |   6 FTOD3      0032AF R
  6 FTOD4      0032BA R   |   6 FTOD5      0032C2 R   |   6 FTOD6      0032E2 R
  6 FTOD8      0032E7 R   |   6 FTOD9      0032F2 R   |   6 FZE        002B48 R
  6 FZEQUAL    00332D R   |   6 FZLESS     0032F9 R   |     GPIO_BAS=  005000 
    GPIO_CR1=  000003     |     GPIO_CR2=  000004     |     GPIO_DDR=  000002 
    GPIO_IDR=  000001     |     GPIO_ODR=  000000     |     GPIO_SIZ=  000005 
  6 GREAT      000960 R   |   6 GREAT1     000976 R   |   6 HDOT       000FD0 R
  6 HERE       000CAB R   |   6 HEX        000E63 R   |   6 HI         001AA1 R
  6 HLD        000757 R   |   6 HOLD       000DD8 R   |     HSECNT  =  004809 
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
  6 ICOLON     001847 R   |   6 IFETCH     00159C R   |   6 IFF        0015E4 R
  6 IFMOVE     00225B R   |     IMEDD   =  000080     |   6 IMMED      001859 R
  6 INCH       00042A R   |   6 INC_FPTR   001CD0 R   |   6 INITOFS    00180F R
  6 INN        000705 R   |     INPUT_DI=  000000     |     INPUT_EI=  000001 
    INPUT_FL=  000000     |     INPUT_PU=  000001     |   6 INTE1      00140D R
  6 INTER      0013E3 R   |   6 INTQ       002404 R   |     INT_ADC2=  000016 
    INT_AUAR=  000012     |     INT_AWU =  000001     |     INT_CAN_=  000008 
    INT_CAN_=  000009     |     INT_CLK =  000002     |     INT_EXTI=  000003 
    INT_EXTI=  000004     |     INT_EXTI=  000005     |     INT_EXTI=  000006 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 187.
Hexadecimal [24-Bits]

Symbol Table

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
  6 INVER      000860 R   |     IPR0    =  000002     |     IPR1    =  000001 
    IPR2    =  000000     |     IPR3    =  000003     |     IPR_MASK=  000003 
    IRET_COD=  000080     |   6 ISEMI      0017A4 R   |     ITC_SPR1=  007F70 
    ITC_SPR2=  007F71     |     ITC_SPR3=  007F72     |     ITC_SPR4=  007F73 
    ITC_SPR5=  007F74     |     ITC_SPR6=  007F75     |     ITC_SPR7=  007F76 
    ITC_SPR8=  007F77     |     IWDG_KR =  0050E0     |     IWDG_PR =  0050E1 
    IWDG_RLR=  0050E2     |   6 JFETCH     0015A7 R   |   6 JSRC       0017F9 R
  6 KEY        000ECC R   |   6 KTAP       0012FD R   |   6 KTAP1      001320 R
  6 KTAP2      001323 R   |   6 LAST       000796 R   |   6 LASTN   =  003329 R
  6 LBRAC      00141A R   |     LED2_BIT=  000005     |     LED2_MAS=  000020 
    LED2_POR=  00500A     |   6 LESS       000922 R   |     LF      =  00000A 
  6 LINK    =  003329 R   |   6 LITER      001556 R   |   6 LN2S       002326 R
  6 LOCAL      000554 R   |   6 LOCK       001CBC R   |   6 LOG2S      002310 R
  6 LSCALE     002EF3 R   |   6 LSHIFT     000B80 R   |   6 LSHIFT1    000B89 R
  6 LSHIFT4    000B91 R   |   6 LT1        000938 R   |     MASKK   =  001F7F 
  6 MAX        000980 R   |   6 MAX1       000993 R   |     MAX_MANT=  7FFFFF 
  6 MIN        00099D R   |   6 MIN1       0009B0 R   |   6 MMOD1      000A39 R
  6 MMOD2      000A4D R   |   6 MMOD3      000A64 R   |   6 MMSM1      0009F4 R
  6 MMSM3      0009F8 R   |   6 MMSM4      000A04 R   |   6 MMSMa      0009FF R
  6 MMSMb      000A0A R   |   6 MMSTA1     00306D R   |   6 MMSTA2     003078 R
  6 MMSTA3     003083 R   |   6 MMSTA4     0030EE R   |   6 MMSTA5     003100 R
  6 MMSTA6     003119 R   |   6 MMSTA7     003136 R   |   6 MMSTAR     003062 R
  6 MODD       000A7E R   |   6 MONE       000BE7 R   |     MS      =  000030 
  6 MSEC       0002D0 R   |   6 MSMOD      000A1C R   |   6 MSTA1      000B0F R
  6 MSTAR      000AEC R   |     NAFR    =  004804     |   6 NAMEQ      0012A5 R
  6 NAMET      0011B6 R   |     NCLKOPT =  004808     |   6 NDROT      0026F5 R
  6 NEGAT      000871 R   |   6 NEX1       000490 R   |   6 NEXT       00158D R
    NFLASH_W=  00480E     |     NHSECNT =  00480A     |     NOPT1   =  004802 
    NOPT2   =  004804     |     NOPT3   =  004806     |     NOPT4   =  004808 
    NOPT5   =  00480A     |     NOPT6   =  00480C     |     NOPT7   =  00480E 
    NOPTBL  =  00487F     |   6 NRAT       0005A3 R   |   6 NRDROP     00057D R
  6 NROT       000804 R   |   6 NRSTO      0005C4 R   |   6 NTIB       000715 R
    NUBC    =  004802     |     NUCLEO  =  000001     |   6 NUFQ       000EE2 R
  6 NUFQ1      000EFB R   |   6 NUMBQ      0024AD R   |   6 NUMQ0      0024EE R
  6 NUMQ1      002510 R   |   6 NUMQ3      00253A R   |   6 NUMQ4      00255B R
  6 NUMQ8      002564 R   |     NWDGOPT =  004806     |     NWDGOPT_=  FFFFFFFD 
    NWDGOPT_=  FFFFFFFC     |     NWDGOPT_=  FFFFFFFF     |     NWDGOPT_=  FFFFFFFE 
  6 NonHandl   000000 R   |   6 OFFSET     0007BB R   |     OFS     =  000005 
  6 ONE        000BD9 R   |   6 ONEM       000B6F R   |   6 ONEP       000B62 R
    OPT     =  000002     |     OPT0    =  004800     |     OPT1    =  004801 
    OPT2    =  004803     |     OPT3    =  004805     |     OPT4    =  004807 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 188.
Hexadecimal [24-Bits]

Symbol Table

    OPT5    =  004809     |     OPT6    =  00480B     |     OPT7    =  00480D 
    OPTBL   =  00487E     |     OPTIMIZE=  000001     |     OPTION_B=  004800 
    OPTION_E=  00487F     |     OPTION_S=  000080     |   6 ORIG       000049 R
  6 ORR        000692 R   |   6 OUTPUT     00043B R   |     OUTPUT_F=  000001 
    OUTPUT_O=  000000     |     OUTPUT_P=  000001     |     OUTPUT_S=  000000 
  6 OVER       000649 R   |   6 OVERT      001772 R   |     PA      =  000000 
  6 PACKS      000D6B R   |   6 PAD        000CBC R   |   6 PAREN      001125 R
  6 PARS       00101E R   |   6 PARS1      001049 R   |   6 PARS2      001074 R
  6 PARS3      001077 R   |   6 PARS4      001080 R   |   6 PARS5      0010A3 R
  6 PARS6      0010B8 R   |   6 PARS7      0010C7 R   |   6 PARS8      0010D6 R
  6 PARSE      0010E7 R   |   6 PARSEXP_   002E0E R   |   6 PAUSE      0002E0 R
    PA_BASE =  005000     |     PA_CR1  =  005003     |     PA_CR2  =  005004 
    PA_DDR  =  005002     |     PA_IDR  =  005001     |     PA_ODR  =  005000 
    PB      =  000005     |     PB_BASE =  005005     |     PB_CR1  =  005008 
    PB_CR2  =  005009     |     PB_DDR  =  005007     |     PB_IDR  =  005006 
    PB_ODR  =  005005     |     PC      =  00000A     |     PC_BASE =  00500A 
    PC_CR1  =  00500D     |     PC_CR2  =  00500E     |     PC_DDR  =  00500C 
    PC_IDR  =  00500B     |     PC_ODR  =  00500A     |     PD      =  00000F 
  6 PDUM1      001989 R   |   6 PDUM2      00199A R   |     PD_BASE =  00500F 
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
    PI      =  000028     |   6 PICK       000C27 R   |   6 PII        002289 R
    PI_BASE =  005028     |     PI_CR1  =  00502B     |     PI_CR2  =  00502C 
    PI_DDR  =  00502A     |     PI_IDR  =  005029     |     PI_ODR  =  005028 
  6 PLUS       000846 R   |   6 PNAM1      001717 R   |   6 PRESE      001499 R
    PROD1   =  000024     |     PROD2   =  000026     |     PROD3   =  000028 
  6 PROTECTE   000201 R   |   6 PSTOR      000C3E R   |     PTR16   =  000035 
    PTR8    =  000036     |   6 PTRPLUS    001CE8 R   |   6 QBRAN      000498 R
  6 QDUP       0007D4 R   |   6 QDUP1      0007DE R   |   6 QKEY       000418 R
  6 QSTAC      001451 R   |   6 QUERY      00137D R   |   6 QUEST      001010 R
  6 QUIT       0014B6 R   |   6 QUIT1      0014BE R   |   6 QUIT2      0014C1 R
  6 RAM2EE     002123 R   |     RAMBASE =  000000     |   6 RAMLAST    0007A9 R
    RAM_BASE=  000000     |     RAM_END =  0017FF     |     RAM_SIZE=  001800 
  6 RANDOM     00027E R   |   6 RAT        000545 R   |   6 RBRAC      0017E6 R
  6 REPEA      001661 R   |   6 RFREE      00210A R   |   6 RFROM      000534 R
    ROP     =  004800     |   6 ROT        0007E5 R   |   6 ROW2BUF    0020CC R
    ROWBUFF =  001680     |     RP0     =  00002E     |   6 RPAT       000511 R
    RPP     =  0017FF     |   6 RPSTO      00051E R   |   6 RSCALE     002F17 R
  6 RSHIFT     000B9C R   |   6 RSHIFT1    000BA5 R   |   6 RSHIFT4    000BAD R
    RST_SR  =  0050B3     |   6 RT12_2     0022F9 R   |   6 SAME1      0011D4 R
  6 SAME2      0011FD R   |   6 SAMEQ      0011CC R   |   6 SCAL1      002FF5 R
  6 SCAL2      003019 R   |   6 SCALETOM   002FEF R   |   6 SCOM1      00174C R
  6 SCOM2      00174F R   |   6 SCOMP      00172E R   |   6 SEED       000265 R
    SEEDX   =  000038     |     SEEDY   =  00003A     |   6 SEMIS      001782 R
  6 SETISP     0000D0 R   |   6 SET_RAML   0018C9 R   |   6 SFN        002BB8 R
  6 SFN1       002BD2 R   |     SFR_BASE=  005000     |     SFR_END =  0057FF 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 189.
Hexadecimal [24-Bits]

Symbol Table

  6 SFV        002BE2 R   |   6 SFZ        002B85 R   |   6 SFZ1       002BA8 R
  6 SIGN       000E17 R   |   6 SIGN1      000E27 R   |   6 SLASH      000A88 R
  6 SLMOD      000A6C R   |   6 SNAME      0016E1 R   |     SP0     =  00002C 
  6 SPACE      000F04 R   |   6 SPACS      000F13 R   |   6 SPAT       000601 R
    SPI_CR1 =  005200     |     SPI_CR2 =  005201     |     SPI_CRCP=  005205 
    SPI_DR  =  005204     |     SPI_ICR =  005202     |     SPI_RXCR=  005206 
    SPI_SR  =  005203     |     SPI_TXCR=  005207     |     SPP     =  001680 
    SPSAVE  =  000001     |   6 SPSTO      00060E R   |   6 SQRT10     0022E2 R
  6 SQRT2      0022A0 R   |   6 SQRT3      0022B7 R   |   6 SSMOD      000B18 R
    SSP     =  000001     |     STACK   =  0017FF     |   6 STAR       000AE1 R
  6 STASL      000B29 R   |   6 STEXP      002C2D R   |   6 STEXP1     002C43 R
  6 STEXP2     002C67 R   |   6 STOD       0008A6 R   |   6 STORE      0004D1 R
  6 STR        000E45 R   |   6 STRCQ      00155E R   |   6 STRQ       0016A0 R
  6 STRQP      000F6F R   |   6 SUBB       0008BD R   |   6 SWAPP      000631 R
    SWIM_CSR=  007F80     |   6 TAP        0012E7 R   |   6 TBOOT      001AD8 R
  6 TBRAN      0004A6 R   |   6 TBUF       000725 R   |     TBUFFBAS=  001680 
  6 TCHAR      000BF8 R   |   6 TEMP       0006F6 R   |   6 TEVAL      000748 R
  6 TFLASH     000737 R   |   6 THENN      0015F9 R   |   6 TIB        000CCD R
    TIBB    =  001700     |     TIBBASE =  001700     |     TIC     =  000027 
  6 TICK       0014CD R   |     TIM1_ARR=  005262     |     TIM1_ARR=  005263 
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
    TIM1_EGR=  000002     |     TIM1_EGR=  000003     |     TIM1_EGR=  000004 
    TIM1_EGR=  000005     |     TIM1_EGR=  000006     |     TIM1_EGR=  000000 
    TIM1_ETR=  005253     |     TIM1_ETR=  000006     |     TIM1_ETR=  000000 
    TIM1_ETR=  000001     |     TIM1_ETR=  000002     |     TIM1_ETR=  000003 
    TIM1_ETR=  000007     |     TIM1_ETR=  000004     |     TIM1_ETR=  000005 
    TIM1_IER=  005254     |     TIM1_IER=  000007     |     TIM1_IER=  000001 
    TIM1_IER=  000002     |     TIM1_IER=  000003     |     TIM1_IER=  000004 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 190.
Hexadecimal [24-Bits]

Symbol Table

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
    TIM_CR1_=  000001     |     TIM_CR1_=  000002     |   6 TNAM2      001A1F R
  6 TNAM3      001A3D R   |   6 TNAM4      001A43 R   |   6 TNAME      001A1C R
  6 TOFLASH    000335 R   |   6 TOKEN      0011A8 R   |   6 TOR        0005EA R
  6 TORAM      000375 R   |     TRUEE   =  00FFFF     |   6 TWOSL      000BB4 R
  6 TYPE1      000F33 R   |   6 TYPE2      000F39 R   |   6 TYPES      000F2E R
  6 Timer4Ha   000005 R   |     UART1   =  000000     |     UART1_BA=  005230 
    UART1_BR=  005232     |     UART1_BR=  005233     |     UART1_CR=  005234 
    UART1_CR=  005235     |     UART1_CR=  005236     |     UART1_CR=  005237 
    UART1_CR=  005238     |     UART1_DR=  005231     |     UART1_GT=  005239 
    UART1_PO=  000000     |     UART1_PS=  00523A     |     UART1_RX=  000004 
    UART1_SR=  005230     |     UART1_TX=  000005     |     UART3   =  000001 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 191.
Hexadecimal [24-Bits]

Symbol Table

    UART3_BA=  005240     |     UART3_BR=  005242     |     UART3_BR=  005243 
    UART3_CR=  005244     |     UART3_CR=  005245     |     UART3_CR=  005246 
    UART3_CR=  005247     |     UART3_CR=  004249     |     UART3_DR=  005241 
    UART3_PO=  00000F     |     UART3_RX=  000006     |     UART3_SR=  005240 
    UART3_TX=  000005     |     UART_BRR=  005232     |     UART_BRR=  005233 
    UART_CR1=  005234     |     UART_CR1=  000004     |     UART_CR1=  000002 
    UART_CR1=  000000     |     UART_CR1=  000001     |     UART_CR1=  000007 
    UART_CR1=  000006     |     UART_CR1=  000005     |     UART_CR1=  000003 
    UART_CR2=  005235     |     UART_CR2=  000004     |     UART_CR2=  000002 
    UART_CR2=  000005     |     UART_CR2=  000001     |     UART_CR2=  000000 
    UART_CR2=  000006     |     UART_CR2=  000003     |     UART_CR2=  000007 
    UART_CR3=  000006     |     UART_CR3=  000003     |     UART_CR3=  000001 
    UART_CR3=  000002     |     UART_CR3=  000000     |     UART_CR3=  000006 
    UART_CR3=  000004     |     UART_CR3=  000005     |     UART_CR4=  000007 
    UART_CR4=  000000     |     UART_CR4=  000001     |     UART_CR4=  000002 
    UART_CR4=  000003     |     UART_CR4=  000004     |     UART_CR4=  000006 
    UART_CR4=  000005     |     UART_CR5=  000008     |     UART_CR5=  000003 
    UART_CR5=  000001     |     UART_CR5=  000002     |     UART_CR5=  000004 
    UART_CR5=  000005     |     UART_CR6=  000009     |     UART_CR6=  000004 
    UART_CR6=  000007     |     UART_CR6=  000001     |     UART_CR6=  000002 
    UART_CR6=  000000     |     UART_CR6=  000005     |     UART_DR =  005231 
    UART_GTR=  000009     |     UART_PSC=  00000A     |     UART_SR =  005230 
    UART_SR_=  000001     |     UART_SR_=  000004     |     UART_SR_=  000002 
    UART_SR_=  000003     |     UART_SR_=  000000     |     UART_SR_=  000005 
    UART_SR_=  000006     |     UART_SR_=  000007     |     UBASE   =  000006 
    UBC     =  004801     |     UCNTXT  =  000016     |     UCP     =  00001A 
    UCTIB   =  00000E     |     UD1     =  000001     |     UD2     =  000002 
    UD3     =  000003     |     UD4     =  000004     |   6 UDIV10     00301A R
  6 UDOT       000FBC R   |   6 UDOTR      000F9C R   |   6 UDSLA3     0029F3 R
  6 UDSLA4     002A19 R   |   6 UDSLA7     002A4A R   |   6 UDSLA8     002A4D R
  6 UDSLMOD    0029B3 R   |   6 UEND       000047 R   |     UFPSW   =  000008 
  6 UGREAT     000941 R   |   6 UGREAT1    000958 R   |     UHLD    =  000014 
    UINN    =  00000C     |     UINTER  =  000012     |     ULAST   =  00001C 
  6 ULES1      00091A R   |   6 ULESS      000904 R   |   6 UMMOD      0009D8 R
  6 UMOD10     002FD9 R   |   6 UMSTA      000A97 R   |   6 UNIQ1      0016DE R
  6 UNIQU      0016BF R   |   6 UNLKEE     001C56 R   |   6 UNLKFL     001C75 R
  6 UNLOCK     001C94 R   |   6 UNTIL      0015C1 R   |     UOFFSET =  00001E 
  6 UPDATCP    001C13 R   |   6 UPDATLAS   001BEA R   |   6 UPDATPTR   002216 R
  6 UPDATRUN   001C02 R   |   6 UPDATVP    001C2A R   |   6 UPL1       0006D3 R
  6 UPLUS      0006BC R   |     UPP     =  000006     |   6 UPPER      00116B R
  6 UPPER1     00118E R   |   6 UPPER2     001197 R   |     URLAST  =  000022 
    USR_BTN_=  000004     |     USR_BTN_=  000010     |     USR_BTN_=  005015 
    UTFLASH =  000020     |     UTIB    =  000010     |     UTMP    =  00000A 
  6 UTYP1      001959 R   |   6 UTYP2      001968 R   |   6 UTYPE      001954 R
    UVP     =  000018     |   6 UZERO      00002B R   |   6 VARIA      001896 R
    VAR_BASE=  000080     |     VAR_TOP =  0017BF     |     VER     =  000004 
  6 VPP        000778 R   |     VSIZE   =  000006     |     WANT_CON=  000001 
    WANT_DEB=  000000     |     WANT_DOU=  000001     |     WANT_FLO=  000001 
    WANT_SCA=  000001     |     WANT_SEE=  000000     |     WDGOPT  =  004805 
    WDGOPT_I=  000002     |     WDGOPT_L=  000003     |     WDGOPT_W=  000000 
    WDGOPT_W=  000001     |   6 WHILE      001647 R   |   6 WITHI      0009BD R
  6 WORDD      001151 R   |   6 WORDS      001A79 R   |   6 WORS1      001A7F R
  6 WORS2      001A9B R   |   6 WR_BYTE    001D3F R   |   6 WR_WORD    001D64 R
  6 WTABLE     00236E R   |   6 WTAT       002392 R   |   6 WTINIT     0023D7 R
    WWDG_CR =  0050D1     |     WWDG_WR =  0050D2     |     XMEM_SIZ=  017830 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 192.
Hexadecimal [24-Bits]

Symbol Table

    XOFF    =  000013     |     XON     =  000011     |   6 XORR       0006A7 R
    XTEMP   =  000024     |     YTEMP   =  000026     |   6 ZEQ1       00277C R
  6 ZEQU1      000674 R   |   6 ZEQUAL     00066A R   |   6 ZERO       000BCE R
  6 ZL1        000661 R   |   6 ZLESS      000658 R   |   6 app_spac   003380 R
  6 baudrate   00037B R   |   6 block_er   001E2A R   |   6 clear_ra   000019 R
  6 clock_in   000064 R   |   6 copy_buf   001E8A R   |   6 copy_buf   001EA9 R
  6 copy_pro   001EA9 R   |     da      =  000002     |     db      =  000003 
    dc      =  000000     |     dd      =  000001     |   6 do2lit     00288E R
  6 erase_fl   001E4C R   |   6 fmove_do   0021FF R   |   6 main       000016 R
  6 next_row   0021BC R   |   6 no_move    002206 R   |   6 nsign      002422 R
  6 nsign1     002453 R   |   6 parse_di   00245A R   |   6 parse_ex   002DC3 R
  6 pristine   001F2A R   |   6 proceed_   001E4F R   |   6 reboot     000327 R
  6 reset_ve   001F91 R   |   6 row_eras   001E0A R   |   6 row_eras   001E63 R
  6 row_eras   001E8A R   |   6 set_opti   001EFE R   |   6 set_vect   002032 R
  6 uart_ini   000076 R   |   6 write_ro   001ECE R

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 193.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 DATA       size      0   flags    8
   2 DATA0      size      0   flags    8
   3 SSEG       size      0   flags    8
   4 SSEG1      size    100   flags    8
   5 HOME       size     80   flags    0
   6 CODE       size   3380   flags    0

