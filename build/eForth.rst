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
      0080B7 93 CC                  314         .word      INTER   ;'EVAL
      0080B9 00 00                  315         .word      0       ;HLD
      0080BB B2 4E                  316         .word      LASTN  ;CNTXT pointer
      0080BD 00 80                  317         .word      VAR_BASE   ;variables free space pointer 
      0080BF B3 00                  318         .word      app_space ; FLASH free space pointer 
      0080C1 B2 4E                  319         .word      LASTN   ;LAST
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
      00812D CC 9A D8         [ 2]  391         jp  COLD   ;default=MN1
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
      008173 CD 86 30         [ 4]  443         call OVER ; ( level reg lshift rval lshift -- )
      008176 CD 84 EF         [ 4]  444         call DOLIT 
      008179 00 03                  445         .word 3
      00817B CD 86 18         [ 4]  446         call SWAPP  ; ( level reg lshift rval 3 lshift )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 10.
Hexadecimal [24-Bits]



      00817E CD 8B 69         [ 4]  447         call LSHIFT ; creat slot mask 
      008181 CD 88 47         [ 4]  448         call INVER  ; ( level reg lshift rval mask )
      008184 CD 86 65         [ 4]  449         call ANDD ; ( level reg lshift slot_masked )
      008187 CD 85 D1         [ 4]  450         call TOR  ; ( level reg lshift -- R: slot_masked )
      00818A CD 87 CC         [ 4]  451         call ROT  ; ( reg lshift level )
      00818D CD 86 18         [ 4]  452         call SWAPP ; ( reg level lshift )
      008190 CD 8B 69         [ 4]  453         call LSHIFT  ; ( reg slot_level -- )
      008193 CD 85 B4         [ 4]  454         call RFROM ; ( reg slot_level masked_val )
      008196 CD 86 79         [ 4]  455         call ORR   ; ( reg updated_rval )
      008199 CD 86 18         [ 4]  456         call SWAPP 
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
      0081A9 CD 91 91         [ 4]  465         call TOKEN 
      0081AC CD 86 08         [ 4]  466         call DUPP 
      0081AF CD 85 18         [ 4]  467         call QBRAN 
      0081B2 82 8F                  468         .word FORGET2
      0081B4 CD 92 8E         [ 4]  469         call NAMEQ
      0081B7 CD 87 BB         [ 4]  470         call QDUP 
      0081BA CD 85 18         [ 4]  471         call QBRAN 
      0081BD 82 8F                  472         .word FORGET2
      0081BF CD 85 FE         [ 4]  473         call DROP 
      0081C2 1D 00 04         [ 2]  474         subw x,#2*CELLL 
      0081C5 90 5F            [ 1]  475         clrw y 
      0081C7 FF               [ 2]  476         ldw (x),y 
      0081C8 90 AE 40 02      [ 2]  477         ldw y,#APP_RUN 
      0081CC EF 02            [ 2]  478         ldw (2,x),y 
      0081CE CC 9D D4         [ 2]  479         jp EESTORE 
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
      0081DA CD 91 91         [ 4]  488         call TOKEN
      0081DD CD 86 08         [ 4]  489         call DUPP 
      0081E0 CD 85 18         [ 4]  490         call QBRAN 
      0081E3 82 8F                  491         .word FORGET2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 11.
Hexadecimal [24-Bits]



      0081E5 CD 92 8E         [ 4]  492         call NAMEQ ; ( a -- ca na | a F )
      0081E8 CD 87 BB         [ 4]  493         call QDUP 
      0081EB CD 85 18         [ 4]  494         call QBRAN 
      0081EE 82 8F                  495         .word FORGET2
                                    496 ; only forget users words 
      0081F0 CD 86 08         [ 4]  497         call DUPP ; ( ca na na )
      0081F3 CD 84 EF         [ 4]  498         call DOLIT 
      0081F6 B3 00                  499         .word app_space 
      0081F8 CD 86 18         [ 4]  500         call SWAPP 
      0081FB CD 88 ED         [ 4]  501         call  ULESS 
      0081FE CD 85 18         [ 4]  502         call QBRAN 
      008201 82 51                  503         .word FORGET6 
                                    504 ; ( ca na -- )        
                                    505 ;reset ivec with address >= ca
      008203 CD 86 18         [ 4]  506         call SWAPP ; ( na ca -- ) 
      008206 CD 9F D7         [ 4]  507         call CHKIVEC ; ( na -- ) 
                                    508 ; start at LAST and link back to na 
                                    509 ; if variable found reset VP at that point.
      008209                        510 FORGET1:
      008209 CD 87 7D         [ 4]  511         call LAST 
      00820C CD 85 63         [ 4]  512         call AT 
      00820F CD 86 08         [ 4]  513         call DUPP  ; ( -- na last last )
      008212 CD 82 A5         [ 4]  514         call FREEVAR ; ( -- na last )
      008215 CD 86 08         [ 4]  515         call DUPP 
      008218 CD 84 EF         [ 4]  516         call DOLIT 
      00821B 00 02                  517         .word 2 
      00821D CD 88 A6         [ 4]  518         call SUBB ; ( na last -- na last lfa ) link address 
      008220 CD 85 63         [ 4]  519         call AT 
      008223 CD 86 08         [ 4]  520         call DUPP ; ( -- na last a a )
      008226 CD 87 51         [ 4]  521         call CNTXT 
      008229 CD 85 51         [ 4]  522         call STORE
      00822C CD 87 7D         [ 4]  523         call LAST  
      00822F CD 85 51         [ 4]  524         call STORE ; ( --  na last )
      008232 CD 86 30         [ 4]  525         call OVER 
      008235 CD 88 CE         [ 4]  526         call EQUAL ; ( na last na -- na T|F ) 
      008238 CD 85 18         [ 4]  527         call QBRAN 
      00823B 82 09                  528         .word FORGET1 
                                    529 ; ( na -- )
      00823D CD 84 EF         [ 4]  530         call DOLIT 
      008240 00 02                  531         .word 2 
      008242 CD 88 A6         [ 4]  532         call SUBB 
      008245 CD 87 6D         [ 4]  533         call CPP 
      008248 CD 85 51         [ 4]  534         call STORE  
      00824B CD 9C 07         [ 4]  535         call UPDATCP 
      00824E CC 9B DE         [ 2]  536         jp UPDATLAST 
      008251                        537 FORGET6: ; tried to forget a RAM or system word 
                                    538 ; ( ca na -- )
      008251 1D 00 02         [ 2]  539         subw x,#CELLL 
      008254 90 BE 2C         [ 2]  540         ldw y,SP0 
      008257 FF               [ 2]  541         ldw (x),y  
      008258 CD 88 ED         [ 4]  542         call ULESS
      00825B CD 85 18         [ 4]  543         call QBRAN 
      00825E 82 81                  544         .word PROTECTED 
      008260 CD 93 9A         [ 4]  545         call ABORQ 
      008263 1D                     546         .byte 29
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 12.
Hexadecimal [24-Bits]



      008264 20 46 6F 72 20 52 41   547         .ascii " For RAM definition do REBOOT"
             4D 20 64 65 66 69 6E
             69 74 69 6F 6E 20 64
             6F 20 52 45 42 4F 4F
             54
      008281                        548 PROTECTED:
      008281 CD 93 9A         [ 4]  549         call ABORQ
      008284 0A                     550         .byte 10
      008285 20 50 72 6F 74 65 63   551         .ascii " Protected"
             74 65 64
      00828F                        552 FORGET2: ; no name or not found in dictionary 
      00828F CD 93 9A         [ 4]  553         call ABORQ
      008292 05                     554         .byte 5
      008293 20 77 68 61 74         555         .ascii " what"
      008298                        556 FORGET4:
      008298 CC 85 FE         [ 2]  557         jp DROP 
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
      0082A5 CD 86 08         [ 4]  566         call DUPP ; ( na na -- )
      0082A8 CD 85 81         [ 4]  567         CALL CAT  ; ( na c -- )
      0082AB CD 8B 4B         [ 4]  568         call ONEP ;
      0082AE CD 88 2D         [ 4]  569         CALL PLUS ; ( na c+1 -- ca ) 
      0082B1 CD 8B 4B         [ 4]  570         call ONEP ; ( ca+ -- ) to get routne address 
      0082B4 CD 86 08         [ 4]  571         call DUPP ; ( ca+ ca+ -- )
      0082B7 CD 85 63         [ 4]  572         CALL AT   ; ( ca+ fnaddr -- ) ; fnaddr is routine address 
      0082BA CD 84 EF         [ 4]  573         call DOLIT 
      0082BD 86 BE                  574         .word DOVAR ; if routine address is DOVAR then variable 
      0082BF CD 88 CE         [ 4]  575         call EQUAL  ; ( ca+ fnaddr DOVAR -- ca+ T|F ) 
      0082C2 CD 85 18         [ 4]  576         call QBRAN 
      0082C5 82 DB                  577         .word FREEVAR4 
      0082C7 CD 84 EF         [ 4]  578         call DOLIT 
      0082CA 00 02                  579         .word 2 
      0082CC CD 88 2D         [ 4]  580         call PLUS  ; ( ca+ 2 -- da ) da is data address 
      0082CF CD 85 63         [ 4]  581         call AT 
      0082D2 CD 87 5F         [ 4]  582         call VPP   
      0082D5 CD 85 51         [ 4]  583         call STORE 
      0082D8 CC 9C 1E         [ 2]  584         jp UPDATVP 
      0082DB                        585 FREEVAR4: ; not variable
      0082DB CC 85 FE         [ 2]  586         jp  DROP 
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
      0083B5 CD 87 90         [ 4]  727         call RAMLAST 
      0083B8 CD 85 63         [ 4]  728         call AT 
      0083BB CD 87 BB         [ 4]  729         call QDUP 
      0083BE CD 85 18         [ 4]  730         call QBRAN
      0083C1 83 E4                  731         .word 1$
      0083C3 CD 93 9A         [ 4]  732         call ABORQ 
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
      008478 CD 88 2D         [ 4]  820         call PLUS
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
                                    953 ;       EXECUTE ( ca -- )
                                    954 ;       Execute  word at ca.
      00853A 84 FE                  955         .word      LINK
                           0004BC   956 LINK	= 	.
      00853C 07                     957         .byte       7
      00853D 45 58 45 43 55 54 45   958         .ascii     "EXECUTE"
      008544                        959 EXECU:
      008544 90 93            [ 1]  960         LDW Y,X
      008546 1C 00 02         [ 2]  961 	ADDW X,#2
      008549 90 FE            [ 2]  962 	LDW  Y,(Y)
      00854B 90 FC            [ 2]  963         JP   (Y)
                                    964 
                           000001   965 OPTIMIZE = 1
                           000001   966 .if OPTIMIZE 
                                    967 ; remplacement de CALL EXIT par 
                                    968 ; le opcode de RET.
                                    969 ; Voir modification au code de ";"
                           000000   970 .else 
                                    971 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    972 ;       EXIT    ( -- )
                                    973 ;       Terminate a colon definition.
                                    974 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    975 ;       _HEADER EXIT,4,"EXIT"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 22.
Hexadecimal [24-Bits]



                                    976 EXIT:
                                    977         POPW Y
                                    978         RET
                                    979 .endif 
                                    980 
                                    981 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    982 ;       !       ( w a -- )
                                    983 ;       Pop  data stack to memory.
                                    984 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0004CD                        985         _HEADER STORE,1,"!"
      00854D 85 3C                    1         .word LINK 
                           0004CF     2         LINK=.
      00854F 01                       3         .byte 1  
      008550 21                       4         .ascii "!"
      008551                          5         STORE:
      008551 90 93            [ 1]  986         LDW Y,X
      008553 90 FE            [ 2]  987         LDW Y,(Y)    ;Y=a
      008555 89               [ 2]  988         PUSHW X
      008556 EE 02            [ 2]  989         LDW X,(2,X) ; x=w 
      008558 90 FF            [ 2]  990         LDW (Y),X 
      00855A 85               [ 2]  991         POPW X  
      00855B 1C 00 04         [ 2]  992         ADDW X,#4 ; DDROP 
      00855E 81               [ 4]  993         RET     
                                    994 
                                    995 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    996 ;       @       ( a -- w )
                                    997 ;       Push memory location to stack.
                                    998 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0004DF                        999         _HEADER AT,1,"@"
      00855F 85 4F                    1         .word LINK 
                           0004E1     2         LINK=.
      008561 01                       3         .byte 1  
      008562 40                       4         .ascii "@"
      008563                          5         AT:
      008563 90 93            [ 1] 1000         LDW Y,X     ;Y = a
      008565 90 FE            [ 2] 1001         LDW Y,(Y)   ; address 
      008567 90 FE            [ 2] 1002         LDW Y,(Y)   ; value 
      008569 FF               [ 2] 1003         LDW (X),Y ;w = @Y
      00856A 81               [ 4] 1004         RET     
                                   1005 
                                   1006 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1007 ;       C!      ( c b -- )
                                   1008 ;       Pop  data stack to byte memory.
                                   1009 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0004EB                       1010         _HEADER CSTOR,2,"C!"
      00856B 85 61                    1         .word LINK 
                           0004ED     2         LINK=.
      00856D 02                       3         .byte 2  
      00856E 43 21                    4         .ascii "C!"
      008570                          5         CSTOR:
      008570 90 93            [ 1] 1011         LDW Y,X
      008572 90 FE            [ 2] 1012 	LDW Y,(Y)    ;Y=b
      008574 E6 03            [ 1] 1013         LD A,(3,X)    ;D = c
      008576 90 F7            [ 1] 1014         LD  (Y),A     ;store c at b
      008578 1C 00 04         [ 2] 1015 	ADDW X,#4 ; DDROP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 23.
Hexadecimal [24-Bits]



      00857B 81               [ 4] 1016         RET     
                                   1017 
                                   1018 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1019 ;       C@      ( b -- c )
                                   1020 ;       Push byte in memory to  stack.
                                   1021 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0004FC                       1022         _HEADER CAT,2,"C@"
      00857C 85 6D                    1         .word LINK 
                           0004FE     2         LINK=.
      00857E 02                       3         .byte 2  
      00857F 43 40                    4         .ascii "C@"
      008581                          5         CAT:
      008581 90 93            [ 1] 1023         LDW Y,X     ;Y=b
      008583 90 FE            [ 2] 1024         LDW Y,(Y)
      008585 90 F6            [ 1] 1025         LD A,(Y)
      008587 E7 01            [ 1] 1026         LD (1,X),A
      008589 7F               [ 1] 1027         CLR (X)
      00858A 81               [ 4] 1028         RET     
                                   1029 
                                   1030 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1031 ;       RP@     ( -- a )
                                   1032 ;       Push current RP to data stack.
                                   1033 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00050B                       1034         _HEADER RPAT,3,"RP@"
      00858B 85 7E                    1         .word LINK 
                           00050D     2         LINK=.
      00858D 03                       3         .byte 3  
      00858E 52 50 40                 4         .ascii "RP@"
      008591                          5         RPAT:
      008591 90 96            [ 1] 1035         LDW Y,SP    ;save return addr
      008593 1D 00 02         [ 2] 1036         SUBW X,#2
      008596 FF               [ 2] 1037         LDW (X),Y
      008597 81               [ 4] 1038         RET     
                                   1039 
                                   1040 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1041 ;       RP!     ( a -- )
                                   1042 ;       Set  return stack pointer.
                                   1043 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000518                       1044         _HEADER RPSTO,COMPO+3,"RP!"
      008598 85 8D                    1         .word LINK 
                           00051A     2         LINK=.
      00859A 43                       3         .byte COMPO+3  
      00859B 52 50 21                 4         .ascii "RP!"
      00859E                          5         RPSTO:
      00859E 90 85            [ 2] 1045         POPW Y
      0085A0 90 BF 26         [ 2] 1046         LDW YTEMP,Y
      0085A3 90 93            [ 1] 1047         LDW Y,X
      0085A5 90 FE            [ 2] 1048         LDW Y,(Y)
      0085A7 90 94            [ 1] 1049         LDW SP,Y
      0085A9 1C 00 02         [ 2] 1050         ADDW X,#CELLL ; a was not dropped, Picatout 2020-05-24
      0085AC 92 CC 26         [ 5] 1051         JP [YTEMP]
                                   1052 
                                   1053 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1054 ;       R>      ( -- w )
                                   1055 ;       Pop return stack to data stack.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 24.
Hexadecimal [24-Bits]



                                   1056 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00052F                       1057         _HEADER RFROM,2,"R>"
      0085AF 85 9A                    1         .word LINK 
                           000531     2         LINK=.
      0085B1 02                       3         .byte 2  
      0085B2 52 3E                    4         .ascii "R>"
      0085B4                          5         RFROM:
      0085B4 1D 00 02         [ 2] 1058         SUBW X,#CELLL 
      0085B7 16 03            [ 2] 1059         LDW Y,(3,SP)
      0085B9 FF               [ 2] 1060         LDW (X),Y 
      0085BA 90 85            [ 2] 1061         POPW Y 
      0085BC 5B 02            [ 2] 1062         ADDW SP,#2 
      0085BE 90 FC            [ 2] 1063         JP (Y)
                                   1064 
                                   1065 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1066 ;       R@      ( -- w )
                                   1067 ;       Copy top of return stack to stack.
                                   1068 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000540                       1069         _HEADER RAT,2,"R@"
      0085C0 85 B1                    1         .word LINK 
                           000542     2         LINK=.
      0085C2 02                       3         .byte 2  
      0085C3 52 40                    4         .ascii "R@"
      0085C5                          5         RAT:
      0085C5 16 03            [ 2] 1070         ldw y,(3,sp)
      0085C7 1D 00 02         [ 2] 1071         subw x,#CELLL 
      0085CA FF               [ 2] 1072         ldw (x),y 
      0085CB 81               [ 4] 1073         ret 
                                   1074 
                                   1075 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1076 ;       >R      ( w -- )
                                   1077 ;       Push data stack to return stack.
                                   1078 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00054C                       1079         _HEADER TOR,COMPO+2,">R"
      0085CC 85 C2                    1         .word LINK 
                           00054E     2         LINK=.
      0085CE 42                       3         .byte COMPO+2  
      0085CF 3E 52                    4         .ascii ">R"
      0085D1                          5         TOR:
      0085D1 90 85            [ 2] 1080         POPW Y    ;save return addr
      0085D3 90 BF 26         [ 2] 1081         LDW YTEMP,Y
      0085D6 90 93            [ 1] 1082         LDW Y,X
      0085D8 90 FE            [ 2] 1083         LDW Y,(Y)  ; W
      0085DA 90 89            [ 2] 1084         PUSHW Y    ;W >R 
      0085DC 1C 00 02         [ 2] 1085         ADDW X,#2
      0085DF 92 CC 26         [ 5] 1086         JP [YTEMP]
                                   1087 
                                   1088 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1089 ;       SP@     ( -- a )
                                   1090 ;       Push current stack pointer.
                                   1091 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000562                       1092         _HEADER SPAT,3,"SP@"
      0085E2 85 CE                    1         .word LINK 
                           000564     2         LINK=.
      0085E4 03                       3         .byte 3  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 25.
Hexadecimal [24-Bits]



      0085E5 53 50 40                 4         .ascii "SP@"
      0085E8                          5         SPAT:
      0085E8 90 93            [ 1] 1093 	LDW Y,X
      0085EA 1D 00 02         [ 2] 1094         SUBW X,#2
      0085ED FF               [ 2] 1095 	LDW (X),Y
      0085EE 81               [ 4] 1096         RET     
                                   1097 
                                   1098 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1099 ;       SP!     ( a -- )
                                   1100 ;       Set  data stack pointer.
                                   1101 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00056F                       1102         _HEADER SPSTO,3,"SP!"
      0085EF 85 E4                    1         .word LINK 
                           000571     2         LINK=.
      0085F1 03                       3         .byte 3  
      0085F2 53 50 21                 4         .ascii "SP!"
      0085F5                          5         SPSTO:
      0085F5 FE               [ 2] 1103         LDW     X,(X)     ;X = a
      0085F6 81               [ 4] 1104         RET     
                                   1105 
                                   1106 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1107 ;       DROP    ( w -- )
                                   1108 ;       Discard top stack item.
                                   1109 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000577                       1110         _HEADER DROP,4,"DROP"
      0085F7 85 F1                    1         .word LINK 
                           000579     2         LINK=.
      0085F9 04                       3         .byte 4  
      0085FA 44 52 4F 50              4         .ascii "DROP"
      0085FE                          5         DROP:
      0085FE 1C 00 02         [ 2] 1111         ADDW X,#2     
      008601 81               [ 4] 1112         RET     
                                   1113 
                                   1114 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1115 ;       DUP     ( w -- w w )
                                   1116 ;       Duplicate  top stack item.
                                   1117 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000582                       1118         _HEADER DUPP,3,"DUP"
      008602 85 F9                    1         .word LINK 
                           000584     2         LINK=.
      008604 03                       3         .byte 3  
      008605 44 55 50                 4         .ascii "DUP"
      008608                          5         DUPP:
      008608 90 93            [ 1] 1119 	LDW Y,X
      00860A 1D 00 02         [ 2] 1120         SUBW X,#2
      00860D 90 FE            [ 2] 1121 	LDW Y,(Y)
      00860F FF               [ 2] 1122 	LDW (X),Y
      008610 81               [ 4] 1123         RET     
                                   1124 
                                   1125 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1126 ;       SWAP    ( w1 w2 -- w2 w1 )
                                   1127 ;       Exchange top two stack items.
                                   1128 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000591                       1129         _HEADER SWAPP,4,"SWAP"
      008611 86 04                    1         .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 26.
Hexadecimal [24-Bits]



                           000593     2         LINK=.
      008613 04                       3         .byte 4  
      008614 53 57 41 50              4         .ascii "SWAP"
      008618                          5         SWAPP:
      008618 90 93            [ 1] 1130         LDW Y,X
      00861A 90 FE            [ 2] 1131         LDW Y,(Y)
      00861C 90 89            [ 2] 1132         PUSHW Y  
      00861E 90 93            [ 1] 1133         LDW Y,X
      008620 90 EE 02         [ 2] 1134         LDW Y,(2,Y)
      008623 FF               [ 2] 1135         LDW (X),Y
      008624 90 85            [ 2] 1136         POPW Y 
      008626 EF 02            [ 2] 1137         LDW (2,X),Y
      008628 81               [ 4] 1138         RET     
                                   1139 
                                   1140 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1141 ;       OVER    ( w1 w2 -- w1 w2 w1 )
                                   1142 ;       Copy second stack item to top.
                                   1143 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0005A9                       1144         _HEADER OVER,4,"OVER"
      008629 86 13                    1         .word LINK 
                           0005AB     2         LINK=.
      00862B 04                       3         .byte 4  
      00862C 4F 56 45 52              4         .ascii "OVER"
      008630                          5         OVER:
      008630 1D 00 02         [ 2] 1145         SUBW X,#2
      008633 90 93            [ 1] 1146         LDW Y,X
      008635 90 EE 04         [ 2] 1147         LDW Y,(4,Y)
      008638 FF               [ 2] 1148         LDW (X),Y
      008639 81               [ 4] 1149         RET     
                                   1150 
                                   1151 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1152 ;       0<      ( n -- t )
                                   1153 ;       Return true if n is negative.
                                   1154 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0005BA                       1155         _HEADER ZLESS,2,"0<"
      00863A 86 2B                    1         .word LINK 
                           0005BC     2         LINK=.
      00863C 02                       3         .byte 2  
      00863D 30 3C                    4         .ascii "0<"
      00863F                          5         ZLESS:
      00863F A6 FF            [ 1] 1156         LD A,#0xFF
      008641 90 93            [ 1] 1157         LDW Y,X
      008643 90 FE            [ 2] 1158         LDW Y,(Y)
      008645 2B 01            [ 1] 1159         JRMI     ZL1
      008647 4F               [ 1] 1160         CLR A   ;false
      008648 F7               [ 1] 1161 ZL1:    LD     (X),A
      008649 E7 01            [ 1] 1162         LD (1,X),A
      00864B 81               [ 4] 1163 	RET     
                                   1164 
                                   1165 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1166 ;       0= ( n -- f )
                                   1167 ;   n==0?
                                   1168 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0005CC                       1169         _HEADER ZEQUAL,2,"0="
      00864C 86 3C                    1         .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 27.
Hexadecimal [24-Bits]



                           0005CE     2         LINK=.
      00864E 02                       3         .byte 2  
      00864F 30 3D                    4         .ascii "0="
      008651                          5         ZEQUAL:
      008651 A6 FF            [ 1] 1170         LD A,#0XFF 
      008653 90 93            [ 1] 1171         LDW Y,X 
      008655 90 FE            [ 2] 1172         LDW Y,(Y)
      008657 27 02            [ 1] 1173         JREQ ZEQU1 
      008659 A6 00            [ 1] 1174         LD A,#0 
      00865B                       1175 ZEQU1:  
      00865B F7               [ 1] 1176         LD (X),A 
      00865C E7 01            [ 1] 1177         LD (1,X),A         
      00865E 81               [ 4] 1178         RET 
                                   1179 
                                   1180 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1181 ;       AND     ( w w -- w )
                                   1182 ;       Bitwise AND.
                                   1183 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0005DF                       1184         _HEADER ANDD,3,"AND"
      00865F 86 4E                    1         .word LINK 
                           0005E1     2         LINK=.
      008661 03                       3         .byte 3  
      008662 41 4E 44                 4         .ascii "AND"
      008665                          5         ANDD:
      008665 F6               [ 1] 1185         LD  A,(X)    ;D=w
      008666 E4 02            [ 1] 1186         AND A,(2,X)
      008668 E7 02            [ 1] 1187         LD (2,X),A
      00866A E6 01            [ 1] 1188         LD A,(1,X)
      00866C E4 03            [ 1] 1189         AND A,(3,X)
      00866E E7 03            [ 1] 1190         LD (3,X),A
      008670 1C 00 02         [ 2] 1191         ADDW X,#2
      008673 81               [ 4] 1192         RET
                                   1193 
                                   1194 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1195 ;       OR      ( w w -- w )
                                   1196 ;       Bitwise inclusive OR.
                                   1197 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0005F4                       1198         _HEADER ORR,2,"OR"
      008674 86 61                    1         .word LINK 
                           0005F6     2         LINK=.
      008676 02                       3         .byte 2  
      008677 4F 52                    4         .ascii "OR"
      008679                          5         ORR:
      008679 F6               [ 1] 1199         LD A,(X)    ;D=w
      00867A EA 02            [ 1] 1200         OR A,(2,X)
      00867C E7 02            [ 1] 1201         LD (2,X),A
      00867E E6 01            [ 1] 1202         LD A,(1,X)
      008680 EA 03            [ 1] 1203         OR A,(3,X)
      008682 E7 03            [ 1] 1204         LD (3,X),A
      008684 1C 00 02         [ 2] 1205         ADDW X,#2
      008687 81               [ 4] 1206         RET
                                   1207 
                                   1208 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1209 ;       XOR     ( w w -- w )
                                   1210 ;       Bitwise exclusive OR.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 28.
Hexadecimal [24-Bits]



                                   1211 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000608                       1212         _HEADER XORR,3,"XOR"
      008688 86 76                    1         .word LINK 
                           00060A     2         LINK=.
      00868A 03                       3         .byte 3  
      00868B 58 4F 52                 4         .ascii "XOR"
      00868E                          5         XORR:
      00868E F6               [ 1] 1213         LD A,(X)    ;D=w
      00868F E8 02            [ 1] 1214         XOR A,(2,X)
      008691 E7 02            [ 1] 1215         LD (2,X),A
      008693 E6 01            [ 1] 1216         LD A,(1,X)
      008695 E8 03            [ 1] 1217         XOR A,(3,X)
      008697 E7 03            [ 1] 1218         LD (3,X),A
      008699 1C 00 02         [ 2] 1219         ADDW X,#2
      00869C 81               [ 4] 1220         RET
                                   1221 
                                   1222 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1223 ;       UM+     ( u u -- udsum )
                                   1224 ;       Add two unsigned single
                                   1225 ;       and return a double sum.
                                   1226 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00061D                       1227         _HEADER UPLUS,3,"UM+"
      00869D 86 8A                    1         .word LINK 
                           00061F     2         LINK=.
      00869F 03                       3         .byte 3  
      0086A0 55 4D 2B                 4         .ascii "UM+"
      0086A3                          5         UPLUS:
      0086A3 A6 01            [ 1] 1228         LD A,#1
      0086A5 90 93            [ 1] 1229         LDW Y,X
      0086A7 90 EE 02         [ 2] 1230         LDW Y,(2,Y)
      0086AA 90 BF 26         [ 2] 1231         LDW YTEMP,Y
      0086AD 90 93            [ 1] 1232         LDW Y,X
      0086AF 90 FE            [ 2] 1233         LDW Y,(Y)
      0086B1 72 B9 00 26      [ 2] 1234         ADDW Y,YTEMP
      0086B5 EF 02            [ 2] 1235         LDW (2,X),Y
      0086B7 25 01            [ 1] 1236         JRC     UPL1
      0086B9 4F               [ 1] 1237         CLR A
      0086BA E7 01            [ 1] 1238 UPL1:   LD     (1,X),A
      0086BC 7F               [ 1] 1239         CLR (X)
      0086BD 81               [ 4] 1240         RET
                                   1241 
                                   1242 ;; System and user variables
                                   1243 
                                   1244 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1245 ;       doVAR   ( -- a )
                                   1246 ;       run time code 
                                   1247 ;       for VARIABLE and CREATE.
                                   1248 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1249 ;       HEADER DOVAR,COMPO+5,"DOVAR"
      0086BE                       1250 DOVAR:
      0086BE 1D 00 02         [ 2] 1251 	SUBW X,#2
      0086C1 90 85            [ 2] 1252         POPW Y    ;get return addr (pfa)
      0086C3 90 FE            [ 2] 1253         LDW Y,(Y) ; indirect address 
      0086C5 FF               [ 2] 1254         LDW (X),Y    ;push on stack
      0086C6 81               [ 4] 1255         RET     ;go to RET of EXEC
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 29.
Hexadecimal [24-Bits]



                                   1256 
                                   1257 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1258 ;       BASE    ( -- a )
                                   1259 ;       Radix base for numeric I/O.
                                   1260 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000647                       1261         _HEADER BASE,4,"BASE"
      0086C7 86 9F                    1         .word LINK 
                           000649     2         LINK=.
      0086C9 04                       3         .byte 4  
      0086CA 42 41 53 45              4         .ascii "BASE"
      0086CE                          5         BASE:
      0086CE 90 AE 00 06      [ 2] 1262 	LDW Y,#UBASE 
      0086D2 1D 00 02         [ 2] 1263 	SUBW X,#2
      0086D5 FF               [ 2] 1264         LDW (X),Y
      0086D6 81               [ 4] 1265         RET
                                   1266 
                                   1267 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1268 ;       tmp     ( -- a )
                                   1269 ;       A temporary storage.
                                   1270 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000657                       1271         _HEADER TEMP,3,"TMP"
      0086D7 86 C9                    1         .word LINK 
                           000659     2         LINK=.
      0086D9 03                       3         .byte 3  
      0086DA 54 4D 50                 4         .ascii "TMP"
      0086DD                          5         TEMP:
      0086DD 90 AE 00 0A      [ 2] 1272 	LDW Y,#UTMP
      0086E1 1D 00 02         [ 2] 1273 	SUBW X,#2
      0086E4 FF               [ 2] 1274         LDW (X),Y
      0086E5 81               [ 4] 1275         RET
                                   1276 
                                   1277 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1278 ;       >IN     ( -- a )
                                   1279 ;        Hold parsing pointer.
                                   1280 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000666                       1281         _HEADER INN,3,">IN"
      0086E6 86 D9                    1         .word LINK 
                           000668     2         LINK=.
      0086E8 03                       3         .byte 3  
      0086E9 3E 49 4E                 4         .ascii ">IN"
      0086EC                          5         INN:
      0086EC 90 AE 00 0C      [ 2] 1282 	LDW Y,#UINN 
      0086F0 1D 00 02         [ 2] 1283 	SUBW X,#2
      0086F3 FF               [ 2] 1284         LDW (X),Y
      0086F4 81               [ 4] 1285         RET
                                   1286 
                                   1287 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1288 ;       #TIB    ( -- a )
                                   1289 ;       Count in terminal input 
                                   1290 ;       buffer.
                                   1291 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000675                       1292         _HEADER NTIB,4,"#TIB"
      0086F5 86 E8                    1         .word LINK 
                           000677     2         LINK=.
      0086F7 04                       3         .byte 4  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 30.
Hexadecimal [24-Bits]



      0086F8 23 54 49 42              4         .ascii "#TIB"
      0086FC                          5         NTIB:
      0086FC 90 AE 00 0E      [ 2] 1293 	LDW Y,#UCTIB 
      008700 1D 00 02         [ 2] 1294 	SUBW X,#2
      008703 FF               [ 2] 1295         LDW (X),Y
      008704 81               [ 4] 1296         RET
                                   1297 
                                   1298 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1299 ;       TBUF ( -- a )
                                   1300 ;       address of 128 bytes 
                                   1301 ;       transaction buffer
                                   1302 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000685                       1303         _HEADER TBUF,4,"TBUF"
      008705 86 F7                    1         .word LINK 
                           000687     2         LINK=.
      008707 04                       3         .byte 4  
      008708 54 42 55 46              4         .ascii "TBUF"
      00870C                          5         TBUF:
      00870C 90 AE 16 80      [ 2] 1304         ldw y,#ROWBUFF
      008710 1D 00 02         [ 2] 1305         subw x,#CELLL
      008713 FF               [ 2] 1306         ldw (x),y 
      008714 81               [ 4] 1307         ret 
                                   1308 
                                   1309 ; systeme variable 
                                   1310 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1311 ; compilation destination 
                                   1312 ; TFLASH ( -- A )
                                   1313 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000695                       1314         _HEADER TFLASH,6,"TFLASH"
      008715 87 07                    1         .word LINK 
                           000697     2         LINK=.
      008717 06                       3         .byte 6  
      008718 54 46 4C 41 53 48        4         .ascii "TFLASH"
      00871E                          5         TFLASH:
      00871E 1D 00 02         [ 2] 1315         subw x,#CELLL 
      008721 90 AE 00 20      [ 2] 1316         ldw y,#UTFLASH
      008725 FF               [ 2] 1317         ldw (x),y 
      008726 81               [ 4] 1318         ret 
                                   1319 
                                   1320 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1321 ;       "EVAL   ( -- a )
                                   1322 ;       Execution vector of EVAL.
                                   1323 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0006A7                       1324         _HEADER TEVAL,5,"'EVAL"
      008727 87 17                    1         .word LINK 
                           0006A9     2         LINK=.
      008729 05                       3         .byte 5  
      00872A 27 45 56 41 4C           4         .ascii "'EVAL"
      00872F                          5         TEVAL:
      00872F 90 AE 00 12      [ 2] 1325 	LDW Y,#UINTER 
      008733 1D 00 02         [ 2] 1326 	SUBW X,#2
      008736 FF               [ 2] 1327         LDW (X),Y
      008737 81               [ 4] 1328         RET
                                   1329 
                                   1330 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 31.
Hexadecimal [24-Bits]



                                   1331 ;       HLD     ( -- a )
                                   1332 ;       Hold a pointer of output
                                   1333 ;        string.
                                   1334 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0006B8                       1335         _HEADER HLD,3,"HLD"
      008738 87 29                    1         .word LINK 
                           0006BA     2         LINK=.
      00873A 03                       3         .byte 3  
      00873B 48 4C 44                 4         .ascii "HLD"
      00873E                          5         HLD:
      00873E 90 AE 00 14      [ 2] 1336 	LDW Y,#UHLD 
      008742 1D 00 02         [ 2] 1337 	SUBW X,#2
      008745 FF               [ 2] 1338         LDW (X),Y
      008746 81               [ 4] 1339         RET
                                   1340 
                                   1341 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1342 ;       CONTEXT ( -- a )
                                   1343 ;       Start vocabulary search.
                                   1344 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0006C7                       1345         _HEADER CNTXT,7,"CONTEXT"
      008747 87 3A                    1         .word LINK 
                           0006C9     2         LINK=.
      008749 07                       3         .byte 7  
      00874A 43 4F 4E 54 45 58 54     4         .ascii "CONTEXT"
      008751                          5         CNTXT:
      008751 90 AE 00 16      [ 2] 1346 	LDW Y,#UCNTXT
      008755 1D 00 02         [ 2] 1347 	SUBW X,#2
      008758 FF               [ 2] 1348         LDW (X),Y
      008759 81               [ 4] 1349         RET
                                   1350 
                                   1351 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1352 ;       VP      ( -- a )
                                   1353 ;       Point to top of variables
                                   1354 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0006DA                       1355         _HEADER VPP,2,"VP"
      00875A 87 49                    1         .word LINK 
                           0006DC     2         LINK=.
      00875C 02                       3         .byte 2  
      00875D 56 50                    4         .ascii "VP"
      00875F                          5         VPP:
      00875F 90 AE 00 18      [ 2] 1356 	LDW Y,#UVP 
      008763 1D 00 02         [ 2] 1357 	SUBW X,#2
      008766 FF               [ 2] 1358         LDW (X),Y
      008767 81               [ 4] 1359         RET
                                   1360 
                                   1361 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1362 ;       CP    ( -- a )
                                   1363 ;       Pointer to top of FLASH 
                                   1364 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0006E8                       1365         _HEADER CPP,2,"CP"
      008768 87 5C                    1         .word LINK 
                           0006EA     2         LINK=.
      00876A 02                       3         .byte 2  
      00876B 43 50                    4         .ascii "CP"
      00876D                          5         CPP:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 32.
Hexadecimal [24-Bits]



      00876D 90 AE 00 1A      [ 2] 1366         ldw y,#UCP 
      008771 1D 00 02         [ 2] 1367         subw x,#CELLL 
      008774 FF               [ 2] 1368         ldw (x),y 
      008775 81               [ 4] 1369         ret                
                                   1370 
                                   1371 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1372 ;       LAST    ( -- a )
                                   1373 ;       Point to last name in 
                                   1374 ;       dictionary.
                                   1375 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0006F6                       1376         _HEADER LAST,4,"LAST"
      008776 87 6A                    1         .word LINK 
                           0006F8     2         LINK=.
      008778 04                       3         .byte 4  
      008779 4C 41 53 54              4         .ascii "LAST"
      00877D                          5         LAST:
      00877D 90 AE 00 1C      [ 2] 1377 	LDW Y,#ULAST 
      008781 1D 00 02         [ 2] 1378 	SUBW X,#2
      008784 FF               [ 2] 1379         LDW (X),Y
      008785 81               [ 4] 1380         RET
                                   1381 
                                   1382 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1383 ; address of system variable URLAST 
                                   1384 ;       RAMLAST ( -- a )
                                   1385 ; RAM dictionary context 
                                   1386 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000706                       1387         _HEADER RAMLAST,7,"RAMLAST"
      008786 87 78                    1         .word LINK 
                           000708     2         LINK=.
      008788 07                       3         .byte 7  
      008789 52 41 4D 4C 41 53 54     4         .ascii "RAMLAST"
      008790                          5         RAMLAST:
      008790 90 AE 00 22      [ 2] 1388         ldw y,#URLAST 
      008794 1D 00 02         [ 2] 1389         subw x,#CELLL 
      008797 FF               [ 2] 1390         ldw (x),y 
      008798 81               [ 4] 1391         ret 
                                   1392 
                                   1393 ;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1394 ;       OFFSET ( -- a )
                                   1395 ;       address of system 
                                   1396 ;       variable OFFSET 
                                   1397 ;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000719                       1398         _HEADER OFFSET,6,"OFFSET"
      008799 87 88                    1         .word LINK 
                           00071B     2         LINK=.
      00879B 06                       3         .byte 6  
      00879C 4F 46 46 53 45 54        4         .ascii "OFFSET"
      0087A2                          5         OFFSET:
      0087A2 1D 00 02         [ 2] 1399         subw x,#CELLL
      0087A5 90 AE 00 1E      [ 2] 1400         ldw y,#UOFFSET 
      0087A9 FF               [ 2] 1401         ldw (x),y 
      0087AA 81               [ 4] 1402         ret 
                                   1403 
                                   1404 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1405 ; adjust jump address 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 33.
Hexadecimal [24-Bits]



                                   1406 ;  adding OFFSET
                                   1407 ; ADR-ADJ ( a -- a+offset )
                                   1408 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0087AB                       1409 ADRADJ: 
      0087AB CD 87 A2         [ 4] 1410         call OFFSET 
      0087AE CD 85 63         [ 4] 1411         call AT 
      0087B1 CC 88 2D         [ 2] 1412         jp PLUS 
                                   1413 
                                   1414 
                                   1415 ;; Common functions
                                   1416 
                                   1417 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1418 ;       ?DUP    ( w -- w w | 0 )
                                   1419 ;       Dup tos if its is not zero.
                                   1420 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000734                       1421         _HEADER QDUP,4,"?DUP"
      0087B4 87 9B                    1         .word LINK 
                           000736     2         LINK=.
      0087B6 04                       3         .byte 4  
      0087B7 3F 44 55 50              4         .ascii "?DUP"
      0087BB                          5         QDUP:
      0087BB 90 93            [ 1] 1422         LDW Y,X
      0087BD 90 FE            [ 2] 1423 	LDW Y,(Y)
      0087BF 27 04            [ 1] 1424         JREQ     QDUP1
      0087C1 1D 00 02         [ 2] 1425 	SUBW X,#2
      0087C4 FF               [ 2] 1426         LDW (X),Y
      0087C5 81               [ 4] 1427 QDUP1:  RET
                                   1428 
                                   1429 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1430 ;       ROT     ( w1 w2 w3 -- w2 w3 w1 )
                                   1431 ;       Rot 3rd item to top.
                                   1432 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000746                       1433         _HEADER ROT,3,"ROT"
      0087C6 87 B6                    1         .word LINK 
                           000748     2         LINK=.
      0087C8 03                       3         .byte 3  
      0087C9 52 4F 54                 4         .ascii "ROT"
      0087CC                          5         ROT:
      0087CC 90 93            [ 1] 1434         ldw y,x 
      0087CE 90 FE            [ 2] 1435         ldw y,(y)
      0087D0 90 89            [ 2] 1436         pushw y 
      0087D2 90 93            [ 1] 1437         ldw y,x 
      0087D4 90 EE 04         [ 2] 1438         ldw y,(4,y)
      0087D7 FF               [ 2] 1439         ldw (x),y 
      0087D8 90 93            [ 1] 1440         ldw y,x 
      0087DA 90 EE 02         [ 2] 1441         ldw y,(2,y)
      0087DD EF 04            [ 2] 1442         ldw (4,x),y 
      0087DF 90 85            [ 2] 1443         popw y 
      0087E1 EF 02            [ 2] 1444         ldw (2,x),y
      0087E3 81               [ 4] 1445         ret 
                                   1446 
                                   1447 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1448 ;    <ROT ( n1 n2 n3 -- n3 n1 n2 )
                                   1449 ;    rotate left 3 top elements 
                                   1450 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



      000764                       1451     _HEADER NROT,4,"<ROT"
      0087E4 87 C8                    1         .word LINK 
                           000766     2         LINK=.
      0087E6 04                       3         .byte 4  
      0087E7 3C 52 4F 54              4         .ascii "<ROT"
      0087EB                          5         NROT:
      0087EB 90 93            [ 1] 1452     LDW Y,X 
      0087ED 90 FE            [ 2] 1453     LDW Y,(Y)
      0087EF 90 BF 26         [ 2] 1454     LDW YTEMP,Y ; n3  
      0087F2 90 93            [ 1] 1455     LDW Y,X 
      0087F4 90 EE 02         [ 2] 1456     LDW Y,(2,Y) ; Y = n2 
      0087F7 FF               [ 2] 1457     LDW (X),Y   ; TOS = n2 
      0087F8 90 93            [ 1] 1458     LDW Y,X    
      0087FA 90 EE 04         [ 2] 1459     LDW Y,(4,Y) ; Y = n1 
      0087FD EF 02            [ 2] 1460     LDW (2,X),Y ;   = n1 
      0087FF 90 BE 26         [ 2] 1461     LDW Y,YTEMP 
      008802 EF 04            [ 2] 1462     LDW (4,X),Y ; = n3 
      008804 81               [ 4] 1463     RET 
                                   1464 
                                   1465 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1466 ;       2DROP   ( w w -- )
                                   1467 ;       Discard two items on stack.
                                   1468 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000785                       1469         _HEADER DDROP,5,"2DROP"
      008805 87 E6                    1         .word LINK 
                           000787     2         LINK=.
      008807 05                       3         .byte 5  
      008808 32 44 52 4F 50           4         .ascii "2DROP"
      00880D                          5         DDROP:
      00880D 1C 00 04         [ 2] 1470         ADDW X,#4
      008810 81               [ 4] 1471         RET
                                   1472 
                                   1473 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1474 ;       2DUP    ( w1 w2 -- w1 w2 w1 w2 )
                                   1475 ;       Duplicate top two items.
                                   1476 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000791                       1477         _HEADER DDUP,4,"2DUP"
      008811 88 07                    1         .word LINK 
                           000793     2         LINK=.
      008813 04                       3         .byte 4  
      008814 32 44 55 50              4         .ascii "2DUP"
      008818                          5         DDUP:
      008818 1D 00 04         [ 2] 1478         SUBW X,#4
      00881B 90 93            [ 1] 1479         LDW Y,X
      00881D 90 EE 06         [ 2] 1480         LDW Y,(6,Y)
      008820 EF 02            [ 2] 1481         LDW (2,X),Y
      008822 90 93            [ 1] 1482         LDW Y,X
      008824 90 EE 04         [ 2] 1483         LDW Y,(4,Y)
      008827 FF               [ 2] 1484         LDW (X),Y
      008828 81               [ 4] 1485         RET
                                   1486 
                                   1487 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1488 ;       +       ( w w -- sum )
                                   1489 ;       Add top two items.
                                   1490 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



      0007A9                       1491         _HEADER PLUS,1,"+"
      008829 88 13                    1         .word LINK 
                           0007AB     2         LINK=.
      00882B 01                       3         .byte 1  
      00882C 2B                       4         .ascii "+"
      00882D                          5         PLUS:
      00882D 90 93            [ 1] 1492         LDW Y,X
      00882F 90 FE            [ 2] 1493         LDW Y,(Y)
      008831 90 BF 26         [ 2] 1494         LDW YTEMP,Y
      008834 1C 00 02         [ 2] 1495         ADDW X,#2
      008837 90 93            [ 1] 1496         LDW Y,X
      008839 90 FE            [ 2] 1497         LDW Y,(Y)
      00883B 72 B9 00 26      [ 2] 1498         ADDW Y,YTEMP
      00883F FF               [ 2] 1499         LDW (X),Y
      008840 81               [ 4] 1500         RET
                                   1501 
                                   1502 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1503 ;       NOT     ( w -- w )
                                   1504 ;       One's complement of tos.
                                   1505 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0007C1                       1506         _HEADER INVER,3,"NOT"
      008841 88 2B                    1         .word LINK 
                           0007C3     2         LINK=.
      008843 03                       3         .byte 3  
      008844 4E 4F 54                 4         .ascii "NOT"
      008847                          5         INVER:
      008847 90 93            [ 1] 1507         LDW Y,X
      008849 90 FE            [ 2] 1508         LDW Y,(Y)
      00884B 90 53            [ 2] 1509         CPLW Y
      00884D FF               [ 2] 1510         LDW (X),Y
      00884E 81               [ 4] 1511         RET
                                   1512 
                                   1513 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1514 ;       NEGATE  ( n -- -n )
                                   1515 ;       Two's complement of tos.
                                   1516 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0007CF                       1517         _HEADER NEGAT,6,"NEGATE"
      00884F 88 43                    1         .word LINK 
                           0007D1     2         LINK=.
      008851 06                       3         .byte 6  
      008852 4E 45 47 41 54 45        4         .ascii "NEGATE"
      008858                          5         NEGAT:
      008858 90 93            [ 1] 1518         LDW Y,X
      00885A 90 FE            [ 2] 1519         LDW Y,(Y)
      00885C 90 50            [ 2] 1520         NEGW Y
      00885E FF               [ 2] 1521         LDW (X),Y
      00885F 81               [ 4] 1522         RET
                                   1523 
                                   1524 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1525 ;       DNEGATE ( d -- -d )
                                   1526 ;       Two's complement of top double.
                                   1527 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0007E0                       1528         _HEADER DNEGA,7,"DNEGATE"
      008860 88 51                    1         .word LINK 
                           0007E2     2         LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 36.
Hexadecimal [24-Bits]



      008862 07                       3         .byte 7  
      008863 44 4E 45 47 41 54 45     4         .ascii "DNEGATE"
      00886A                          5         DNEGA:
      00886A 90 93            [ 1] 1529         LDW Y,X
      00886C 90 FE            [ 2] 1530 	LDW Y,(Y)
      00886E 90 53            [ 2] 1531         CPLW Y     
      008870 90 BF 26         [ 2] 1532 	LDW YTEMP,Y
      008873 90 93            [ 1] 1533         LDW Y,X
      008875 90 EE 02         [ 2] 1534         LDW Y,(2,Y)
      008878 90 53            [ 2] 1535         CPLW Y
      00887A 72 A9 00 01      [ 2] 1536         addw y,#1
      00887E EF 02            [ 2] 1537         LDW (2,X),Y
      008880 90 BE 26         [ 2] 1538         LDW Y,YTEMP
      008883 24 02            [ 1] 1539         JRNC DN1 
      008885 90 5C            [ 1] 1540         INCW Y
      008887 FF               [ 2] 1541 DN1:    LDW (X),Y
      008888 81               [ 4] 1542         RET
                                   1543 
                                   1544 
                                   1545 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1546 ;       S>D ( n -- d )
                                   1547 ; convert single integer to double 
                                   1548 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000809                       1549         _HEADER STOD,3,"S>D"
      008889 88 62                    1         .word LINK 
                           00080B     2         LINK=.
      00888B 03                       3         .byte 3  
      00888C 53 3E 44                 4         .ascii "S>D"
      00888F                          5         STOD:
      00888F 1D 00 02         [ 2] 1550         subw x,#CELLL 
      008892 90 5F            [ 1] 1551         clrw y 
      008894 FF               [ 2] 1552         ldw (x),y 
      008895 90 93            [ 1] 1553         ldw y,x 
      008897 90 EE 02         [ 2] 1554         ldw y,(2,y)
      00889A 2A 05            [ 1] 1555         jrpl 1$ 
      00889C 90 AE FF FF      [ 2] 1556         ldw y,#-1
      0088A0 FF               [ 2] 1557         ldw (x),y 
      0088A1 81               [ 4] 1558 1$:     ret 
                                   1559 
                                   1560 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1561 ;       -       ( n1 n2 -- n1-n2 )
                                   1562 ;       Subtraction.
                                   1563 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000822                       1564         _HEADER SUBB,1,"-"
      0088A2 88 8B                    1         .word LINK 
                           000824     2         LINK=.
      0088A4 01                       3         .byte 1  
      0088A5 2D                       4         .ascii "-"
      0088A6                          5         SUBB:
      0088A6 90 93            [ 1] 1565         LDW Y,X
      0088A8 90 FE            [ 2] 1566         LDW Y,(Y)
      0088AA 90 BF 26         [ 2] 1567         LDW YTEMP,Y
      0088AD 1C 00 02         [ 2] 1568         ADDW X,#2
      0088B0 90 93            [ 1] 1569         LDW Y,X
      0088B2 90 FE            [ 2] 1570         LDW Y,(Y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 37.
Hexadecimal [24-Bits]



      0088B4 72 B2 00 26      [ 2] 1571         SUBW Y,YTEMP
      0088B8 FF               [ 2] 1572         LDW (X),Y
      0088B9 81               [ 4] 1573         RET
                                   1574 
                                   1575 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1576 ;       ABS     ( n -- n )
                                   1577 ;       Return  absolute value of n.
                                   1578 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00083A                       1579         _HEADER ABSS,3,"ABS"
      0088BA 88 A4                    1         .word LINK 
                           00083C     2         LINK=.
      0088BC 03                       3         .byte 3  
      0088BD 41 42 53                 4         .ascii "ABS"
      0088C0                          5         ABSS:
      0088C0 90 93            [ 1] 1580         LDW Y,X
      0088C2 90 FE            [ 2] 1581 	LDW Y,(Y)
      0088C4 2A 03            [ 1] 1582         JRPL     AB1     ;negate:
      0088C6 90 50            [ 2] 1583         NEGW     Y     ;else negate hi byte
      0088C8 FF               [ 2] 1584         LDW (X),Y
      0088C9 81               [ 4] 1585 AB1:    RET
                                   1586 
                                   1587 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1588 ;       =       ( w w -- t )
                                   1589 ;       Return true if top two are =al.
                                   1590 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00084A                       1591         _HEADER EQUAL,1,"="
      0088CA 88 BC                    1         .word LINK 
                           00084C     2         LINK=.
      0088CC 01                       3         .byte 1  
      0088CD 3D                       4         .ascii "="
      0088CE                          5         EQUAL:
      0088CE A6 FF            [ 1] 1592         LD A,#0xFF  ;true
      0088D0 90 93            [ 1] 1593         LDW Y,X    ;D = n2
      0088D2 90 FE            [ 2] 1594         LDW Y,(Y)
      0088D4 90 BF 26         [ 2] 1595         LDW YTEMP,Y
      0088D7 1C 00 02         [ 2] 1596         ADDW X,#2
      0088DA 90 93            [ 1] 1597         LDW Y,X
      0088DC 90 FE            [ 2] 1598         LDW Y,(Y)
      0088DE 90 B3 26         [ 2] 1599         CPW Y,YTEMP     ;if n2 <> n1
      0088E1 27 01            [ 1] 1600         JREQ     EQ1
      0088E3 4F               [ 1] 1601         CLR A
      0088E4 F7               [ 1] 1602 EQ1:    LD (X),A
      0088E5 E7 01            [ 1] 1603         LD (1,X),A
      0088E7 81               [ 4] 1604 	RET     
                                   1605 
                                   1606 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1607 ;       U<      ( u u -- t )
                                   1608 ;       Unsigned compare of top two items.
                                   1609 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000868                       1610         _HEADER ULESS,2,"U<"
      0088E8 88 CC                    1         .word LINK 
                           00086A     2         LINK=.
      0088EA 02                       3         .byte 2  
      0088EB 55 3C                    4         .ascii "U<"
      0088ED                          5         ULESS:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



      0088ED A6 FF            [ 1] 1611         LD A,#0xFF  ;true
      0088EF 90 93            [ 1] 1612         LDW Y,X    ;D = n2
      0088F1 90 FE            [ 2] 1613         LDW Y,(Y)
      0088F3 90 BF 26         [ 2] 1614         LDW YTEMP,Y
      0088F6 1C 00 02         [ 2] 1615         ADDW X,#2
      0088F9 90 93            [ 1] 1616         LDW Y,X
      0088FB 90 FE            [ 2] 1617         LDW Y,(Y)
      0088FD 90 B3 26         [ 2] 1618         CPW Y,YTEMP     ;if n2 <> n1
      008900 25 01            [ 1] 1619         JRULT     ULES1
      008902 4F               [ 1] 1620         CLR A
      008903 F7               [ 1] 1621 ULES1:  LD (X),A
      008904 E7 01            [ 1] 1622         LD (1,X),A
      008906 81               [ 4] 1623 	RET     
                                   1624 
                                   1625 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1626 ;       <       ( n1 n2 -- t )
                                   1627 ;       Signed compare of top two items.
                                   1628 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000887                       1629         _HEADER LESS,1,"<"
      008907 88 EA                    1         .word LINK 
                           000889     2         LINK=.
      008909 01                       3         .byte 1  
      00890A 3C                       4         .ascii "<"
      00890B                          5         LESS:
      00890B A6 FF            [ 1] 1630         LD A,#0xFF  ;true
      00890D 90 93            [ 1] 1631         LDW Y,X    ;D = n2
      00890F 90 FE            [ 2] 1632         LDW Y,(Y)
      008911 90 BF 26         [ 2] 1633         LDW YTEMP,Y
      008914 1C 00 02         [ 2] 1634         ADDW X,#2
      008917 90 93            [ 1] 1635         LDW Y,X
      008919 90 FE            [ 2] 1636         LDW Y,(Y)
      00891B 90 B3 26         [ 2] 1637         CPW Y,YTEMP     ;if n2 <> n1
      00891E 2F 01            [ 1] 1638         JRSLT     LT1
      008920 4F               [ 1] 1639         CLR A
      008921 F7               [ 1] 1640 LT1:    LD (X),A
      008922 E7 01            [ 1] 1641         LD (1,X),A
      008924 81               [ 4] 1642 	RET     
                                   1643 
                                   1644 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1645 ;   U> ( u1 u2 -- f )
                                   1646 ;   f = true if u1>u2 
                                   1647 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0008A5                       1648     _HEADER UGREAT,2,"U>"
      008925 89 09                    1         .word LINK 
                           0008A7     2         LINK=.
      008927 02                       3         .byte 2  
      008928 55 3E                    4         .ascii "U>"
      00892A                          5         UGREAT:
      00892A A6 00            [ 1] 1649     LD A,#0 
      00892C 90 93            [ 1] 1650     LDW Y,X 
      00892E 90 FE            [ 2] 1651     LDW Y,(Y)
      008930 90 BF 26         [ 2] 1652     LDW YTEMP,Y 
      008933 1C 00 02         [ 2] 1653     ADDW X,#2 
      008936 90 93            [ 1] 1654     LDW Y,X
      008938 90 FE            [ 2] 1655     LDW Y,(Y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 39.
Hexadecimal [24-Bits]



      00893A 90 B3 26         [ 2] 1656     CPW Y,YTEMP 
      00893D 23 02            [ 2] 1657     JRULE UGREAT1 
      00893F A6 FF            [ 1] 1658     LD A,#0xff  
      008941                       1659 UGREAT1:
      008941 F7               [ 1] 1660     LD (X),A 
      008942 E7 01            [ 1] 1661     LD (1,X),A 
      008944 81               [ 4] 1662     RET 
                                   1663 
                                   1664 
                                   1665 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1666 ;       >   (n1 n2 -- f )
                                   1667 ;  signed compare n1 n2 
                                   1668 ;  true if n1 > n2 
                                   1669 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0008C5                       1670         _HEADER GREAT,1,">"
      008945 89 27                    1         .word LINK 
                           0008C7     2         LINK=.
      008947 01                       3         .byte 1  
      008948 3E                       4         .ascii ">"
      008949                          5         GREAT:
      008949 A6 FF            [ 1] 1671         LD A,#0xFF ;
      00894B 90 93            [ 1] 1672         LDW Y,X 
      00894D 90 FE            [ 2] 1673         LDW Y,(Y)
      00894F 90 BF 26         [ 2] 1674         LDW YTEMP,Y 
      008952 1C 00 02         [ 2] 1675         ADDW X,#2 
      008955 90 93            [ 1] 1676         LDW Y,X 
      008957 90 FE            [ 2] 1677         LDW Y,(Y)
      008959 90 B3 26         [ 2] 1678         CPW  Y,YTEMP 
      00895C 2C 01            [ 1] 1679         JRSGT GREAT1 
      00895E 4F               [ 1] 1680         CLR  A
      00895F                       1681 GREAT1:
      00895F F7               [ 1] 1682         LD (X),A 
      008960 E7 01            [ 1] 1683         LD (1,X),A 
      008962 81               [ 4] 1684         RET 
                                   1685 
                                   1686 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1687 ;       MAX     ( n n -- n )
                                   1688 ;       Return greater of two top items.
                                   1689 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0008E3                       1690         _HEADER MAX,3,"MAX"
      008963 89 47                    1         .word LINK 
                           0008E5     2         LINK=.
      008965 03                       3         .byte 3  
      008966 4D 41 58                 4         .ascii "MAX"
      008969                          5         MAX:
      008969 90 93            [ 1] 1691         LDW Y,X    ;D = n2
      00896B 90 EE 02         [ 2] 1692         LDW Y,(2,Y)
      00896E 90 BF 26         [ 2] 1693         LDW YTEMP,Y
      008971 90 93            [ 1] 1694         LDW Y,X
      008973 90 FE            [ 2] 1695         LDW Y,(Y)
      008975 90 B3 26         [ 2] 1696         CPW Y,YTEMP     ;if n2 <> n1
      008978 2F 02            [ 1] 1697         JRSLT     MAX1
      00897A EF 02            [ 2] 1698         LDW (2,X),Y
      00897C 1C 00 02         [ 2] 1699 MAX1:   ADDW X,#2
      00897F 81               [ 4] 1700 	RET     
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 40.
Hexadecimal [24-Bits]



                                   1701 
                                   1702 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1703 ;       MIN     ( n n -- n )
                                   1704 ;       Return smaller of top two items.
                                   1705 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000900                       1706         _HEADER MIN,3,"MIN"
      008980 89 65                    1         .word LINK 
                           000902     2         LINK=.
      008982 03                       3         .byte 3  
      008983 4D 49 4E                 4         .ascii "MIN"
      008986                          5         MIN:
      008986 90 93            [ 1] 1707         LDW Y,X    ;D = n2
      008988 90 EE 02         [ 2] 1708         LDW Y,(2,Y)
      00898B 90 BF 26         [ 2] 1709         LDW YTEMP,Y
      00898E 90 93            [ 1] 1710         LDW Y,X
      008990 90 FE            [ 2] 1711         LDW Y,(Y)
      008992 90 B3 26         [ 2] 1712         CPW Y,YTEMP     ;if n2 <> n1
      008995 2C 02            [ 1] 1713         JRSGT     MIN1
      008997 EF 02            [ 2] 1714         LDW (2,X),Y
      008999 1C 00 02         [ 2] 1715 MIN1:	ADDW X,#2
      00899C 81               [ 4] 1716 	RET     
                                   1717 
                                   1718 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1719 ;       WITHIN  ( u ul uh -- t )
                                   1720 ;       Return true if u is within
                                   1721 ;       range of ul and uh. ( ul <= u < uh )
                                   1722 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00091D                       1723         _HEADER WITHI,6,"WITHIN"
      00899D 89 82                    1         .word LINK 
                           00091F     2         LINK=.
      00899F 06                       3         .byte 6  
      0089A0 57 49 54 48 49 4E        4         .ascii "WITHIN"
      0089A6                          5         WITHI:
      0089A6 CD 86 30         [ 4] 1724         CALL     OVER
      0089A9 CD 88 A6         [ 4] 1725         CALL     SUBB
      0089AC CD 85 D1         [ 4] 1726         CALL     TOR
      0089AF CD 88 A6         [ 4] 1727         CALL     SUBB
      0089B2 CD 85 B4         [ 4] 1728         CALL     RFROM
      0089B5 CC 88 ED         [ 2] 1729         JP     ULESS
                                   1730 
                                   1731 ;; Divide
                                   1732 
                                   1733 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1734 ;       UM/MOD  ( udl udh un -- ur uq )
                                   1735 ;       Unsigned divide of a double by a
                                   1736 ;       single. Return mod and quotient.
                                   1737 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000938                       1738         _HEADER UMMOD,6,"UM/MOD"
      0089B8 89 9F                    1         .word LINK 
                           00093A     2         LINK=.
      0089BA 06                       3         .byte 6  
      0089BB 55 4D 2F 4D 4F 44        4         .ascii "UM/MOD"
      0089C1                          5         UMMOD:
                                   1739 ; 2021-02-22
                                   1740 ; changed algortihm for Jeeek one 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



                                   1741 ; ref: https://github.com/TG9541/stm8ef/pull/406        
      0089C1 90 93            [ 1] 1742         LDW     Y,X             ; stack pointer to Y
      0089C3 FE               [ 2] 1743         LDW     X,(X)           ; un
      0089C4 BF 26            [ 2] 1744         LDW     YTEMP,X         ; save un
      0089C6 93               [ 1] 1745         LDW     X,Y
      0089C7 5C               [ 1] 1746         INCW    X               ; drop un
      0089C8 5C               [ 1] 1747         INCW    X
      0089C9 89               [ 2] 1748         PUSHW   X               ; save stack pointer
      0089CA FE               [ 2] 1749         LDW     X,(X)           ; X=udh
      0089CB 90 EE 04         [ 2] 1750         LDW     Y,(4,Y)         ; Y=udl (offset before drop)
      0089CE B3 26            [ 2] 1751         CPW     X,YTEMP
      0089D0 25 0B            [ 1] 1752         JRULT   MMSM1           ; X is still on the R-stack
      0089D2 85               [ 2] 1753         POPW    X               ; restore stack pointer
      0089D3 90 AE FF FF      [ 2] 1754         LDW     Y,#0xFFFF       ; overflow result:
      0089D7 FF               [ 2] 1755         LDW     (X),Y           ; quotient max. 16 bit value
      0089D8 90 5F            [ 1] 1756         CLRW    Y
      0089DA EF 02            [ 2] 1757         LDW     (2,X),Y         ; remainder 0
      0089DC 81               [ 4] 1758         RET
      0089DD                       1759 MMSM1:
      0089DD A6 10            [ 1] 1760         LD      A,#16           ; loop count
      0089DF 90 58            [ 2] 1761         SLLW    Y               ; udl shift udl into udh
      0089E1                       1762 MMSM3:
      0089E1 59               [ 2] 1763         RLCW    X               ; rotate udl bit into uhdh (= remainder)
      0089E2 25 04            [ 1] 1764         JRC     MMSMa           ; if carry out of rotate
      0089E4 B3 26            [ 2] 1765         CPW     X,YTEMP         ; compare udh to un
      0089E6 25 05            [ 1] 1766         JRULT   MMSM4           ; can't subtract
      0089E8                       1767 MMSMa:
      0089E8 72 B0 00 26      [ 2] 1768         SUBW    X,YTEMP         ; can subtract
      0089EC 98               [ 1] 1769         RCF
      0089ED                       1770 MMSM4:
      0089ED 8C               [ 1] 1771         CCF                     ; quotient bit
      0089EE 90 59            [ 2] 1772         RLCW    Y               ; rotate into quotient, rotate out udl
      0089F0 4A               [ 1] 1773         DEC     A               ; repeat
      0089F1 26 EE            [ 1] 1774         JRNE    MMSM3           ; if A == 0
      0089F3                       1775 MMSMb:
      0089F3 BF 26            [ 2] 1776         LDW     YTEMP,X         ; done, save remainder
      0089F5 85               [ 2] 1777         POPW    X               ; restore stack pointer
      0089F6 FF               [ 2] 1778         LDW     (X),Y           ; save quotient
      0089F7 90 BE 26         [ 2] 1779         LDW     Y,YTEMP         ; remainder onto stack
      0089FA EF 02            [ 2] 1780         LDW     (2,X),Y
      0089FC 81               [ 4] 1781         RET
                                   1782 
                                   1783 
                                   1784 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
                                   1785 ;       M/MOD   ( d n -- r q )
                                   1786 ;       Signed floored divide of double by
                                   1787 ;       single. Return mod and quotient.
                                   1788 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00097D                       1789         _HEADER MSMOD,5,"M/MOD"
      0089FD 89 BA                    1         .word LINK 
                           00097F     2         LINK=.
      0089FF 05                       3         .byte 5  
      008A00 4D 2F 4D 4F 44           4         .ascii "M/MOD"
      008A05                          5         MSMOD:
      008A05 CD 86 08         [ 4] 1790         CALL	DUPP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal [24-Bits]



      008A08 CD 86 3F         [ 4] 1791         CALL	ZLESS
      008A0B CD 86 08         [ 4] 1792         CALL	DUPP
      008A0E CD 85 D1         [ 4] 1793         CALL	TOR
      008A11 CD 85 18         [ 4] 1794         CALL	QBRAN
      008A14 8A 22                 1795         .word	MMOD1
      008A16 CD 88 58         [ 4] 1796         CALL	NEGAT
      008A19 CD 85 D1         [ 4] 1797         CALL	TOR
      008A1C CD 88 6A         [ 4] 1798         CALL	DNEGA
      008A1F CD 85 B4         [ 4] 1799         CALL	RFROM
      008A22 CD 85 D1         [ 4] 1800 MMOD1:	CALL	TOR
      008A25 CD 86 08         [ 4] 1801         CALL	DUPP
      008A28 CD 86 3F         [ 4] 1802         CALL	ZLESS
      008A2B CD 85 18         [ 4] 1803         CALL	QBRAN
      008A2E 8A 36                 1804         .word	MMOD2
      008A30 CD 85 C5         [ 4] 1805         CALL	RAT
      008A33 CD 88 2D         [ 4] 1806         CALL	PLUS
      008A36 CD 85 B4         [ 4] 1807 MMOD2:	CALL	RFROM
      008A39 CD 89 C1         [ 4] 1808         CALL	UMMOD
      008A3C CD 85 B4         [ 4] 1809         CALL	RFROM
      008A3F CD 85 18         [ 4] 1810         CALL	QBRAN
      008A42 8A 4D                 1811         .word	MMOD3
      008A44 CD 86 18         [ 4] 1812         CALL	SWAPP
      008A47 CD 88 58         [ 4] 1813         CALL	NEGAT
      008A4A CD 86 18         [ 4] 1814         CALL	SWAPP
      008A4D 81               [ 4] 1815 MMOD3:	RET
                                   1816 
                                   1817 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1818 ;       /MOD    ( n n -- r q )
                                   1819 ;       Signed divide. Return mod 
                                   1820 ;       and quotient.
                                   1821 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0009CE                       1822         _HEADER SLMOD,4,"/MOD"
      008A4E 89 FF                    1         .word LINK 
                           0009D0     2         LINK=.
      008A50 04                       3         .byte 4  
      008A51 2F 4D 4F 44              4         .ascii "/MOD"
      008A55                          5         SLMOD:
      008A55 CD 86 30         [ 4] 1823         CALL	OVER
      008A58 CD 86 3F         [ 4] 1824         CALL	ZLESS
      008A5B CD 86 18         [ 4] 1825         CALL	SWAPP
      008A5E CC 8A 05         [ 2] 1826         JP	MSMOD
                                   1827 
                                   1828 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1829 ;       MOD     ( n n -- r )
                                   1830 ;       Signed divide. Return mod only.
                                   1831 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0009E1                       1832         _HEADER MODD,3,"MOD"
      008A61 8A 50                    1         .word LINK 
                           0009E3     2         LINK=.
      008A63 03                       3         .byte 3  
      008A64 4D 4F 44                 4         .ascii "MOD"
      008A67                          5         MODD:
      008A67 CD 8A 55         [ 4] 1833 	CALL	SLMOD
      008A6A CC 85 FE         [ 2] 1834 	JP	DROP
                                   1835 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
Hexadecimal [24-Bits]



                                   1836 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1837 ;       /       ( n n -- q )
                                   1838 ;       Signed divide. Return quotient only.
                                   1839 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0009ED                       1840         _HEADER SLASH,1,"/"
      008A6D 8A 63                    1         .word LINK 
                           0009EF     2         LINK=.
      008A6F 01                       3         .byte 1  
      008A70 2F                       4         .ascii "/"
      008A71                          5         SLASH:
      008A71 CD 8A 55         [ 4] 1841         CALL	SLMOD
      008A74 CD 86 18         [ 4] 1842         CALL	SWAPP
      008A77 CC 85 FE         [ 2] 1843         JP	DROP
                                   1844 
                                   1845 ;; Multiply
                                   1846 
                                   1847 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1848 ;       UM*     ( u u -- ud )
                                   1849 ;       Unsigned multiply. Return 
                                   1850 ;       double product.
                                   1851 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0009FA                       1852         _HEADER UMSTA,3,"UM*"
      008A7A 8A 6F                    1         .word LINK 
                           0009FC     2         LINK=.
      008A7C 03                       3         .byte 3  
      008A7D 55 4D 2A                 4         .ascii "UM*"
      008A80                          5         UMSTA:
                                   1853 ; stack have 4 bytes u1=a,b u2=c,d
                                   1854 ; take advantage of SP addressing modes
                                   1855 ; these PRODx in RAM are not required
                                   1856 ; the product is kept on stack as local variable 
                                   1857         ;; bytes offset on data stack 
                           000002  1858         da=2 
                           000003  1859         db=3 
                           000000  1860         dc=0 
                           000001  1861         dd=1 
                                   1862         ;; product bytes offset on return stack 
                           000001  1863         UD1=1  ; ud bits 31..24
                           000002  1864         UD2=2  ; ud bits 23..16
                           000003  1865         UD3=3  ; ud bits 15..8 
                           000004  1866         UD4=4  ; ud bits 7..0 
                                   1867         ;; local variable for product set to zero   
      008A80 90 5F            [ 1] 1868         clrw y 
      008A82 90 89            [ 2] 1869         pushw y  ; bits 15..0
      008A84 90 89            [ 2] 1870         pushw y  ; bits 31..16 
      008A86 E6 03            [ 1] 1871         ld a,(db,x) ; b 
      008A88 90 97            [ 1] 1872         ld yl,a 
      008A8A E6 01            [ 1] 1873         ld a,(dd,x)   ; d
      008A8C 90 42            [ 4] 1874         mul y,a    ; b*d  
      008A8E 17 03            [ 2] 1875         ldw (UD3,sp),y ; lowest weight product 
      008A90 E6 03            [ 1] 1876         ld a,(db,x)
      008A92 90 97            [ 1] 1877         ld yl,a 
      008A94 E6 00            [ 1] 1878         ld a,(dc,x)
      008A96 90 42            [ 4] 1879         mul y,a  ; b*c 
                                   1880         ;;; do the partial sum 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



      008A98 72 F9 02         [ 2] 1881         addw y,(UD2,sp)
      008A9B 4F               [ 1] 1882         clr a 
      008A9C 49               [ 1] 1883         rlc a
      008A9D 6B 01            [ 1] 1884         ld (UD1,sp),a 
      008A9F 17 02            [ 2] 1885         ldw (UD2,sp),y 
      008AA1 E6 02            [ 1] 1886         ld a,(da,x)
      008AA3 90 97            [ 1] 1887         ld yl,a 
      008AA5 E6 01            [ 1] 1888         ld a,(dd,x)
      008AA7 90 42            [ 4] 1889         mul y,a   ; a*d 
                                   1890         ;; do partial sum 
      008AA9 72 F9 02         [ 2] 1891         addw y,(UD2,sp)
      008AAC 4F               [ 1] 1892         clr a 
      008AAD 19 01            [ 1] 1893         adc a,(UD1,sp)
      008AAF 6B 01            [ 1] 1894         ld (UD1,sp),a  
      008AB1 17 02            [ 2] 1895         ldw (UD2,sp),y 
      008AB3 E6 02            [ 1] 1896         ld a,(da,x)
      008AB5 90 97            [ 1] 1897         ld yl,a 
      008AB7 E6 00            [ 1] 1898         ld a,(dc,x)
      008AB9 90 42            [ 4] 1899         mul y,a  ;  a*c highest weight product 
                                   1900         ;;; do partial sum 
      008ABB 72 F9 01         [ 2] 1901         addw y,(UD1,sp)
      008ABE FF               [ 2] 1902         ldw (x),y  ; udh 
      008ABF 16 03            [ 2] 1903         ldw y,(UD3,sp)
      008AC1 EF 02            [ 2] 1904         ldw (2,x),y  ; udl  
      008AC3 5B 04            [ 2] 1905         addw sp,#4 ; drop local variable 
      008AC5 81               [ 4] 1906         ret  
                                   1907 
                                   1908 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1909 ;       *       ( n n -- n )
                                   1910 ;       Signed multiply. Return 
                                   1911 ;       single product.
                                   1912 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000A46                       1913         _HEADER STAR,1,"*"
      008AC6 8A 7C                    1         .word LINK 
                           000A48     2         LINK=.
      008AC8 01                       3         .byte 1  
      008AC9 2A                       4         .ascii "*"
      008ACA                          5         STAR:
      008ACA CD 8A 80         [ 4] 1914 	CALL	UMSTA
      008ACD CC 85 FE         [ 2] 1915 	JP	DROP
                                   1916 
                                   1917 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1918 ;       M*      ( n n -- d )
                                   1919 ;       Signed multiply. Return 
                                   1920 ;       double product.
                                   1921 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000A50                       1922         _HEADER MSTAR,2,"M*"
      008AD0 8A C8                    1         .word LINK 
                           000A52     2         LINK=.
      008AD2 02                       3         .byte 2  
      008AD3 4D 2A                    4         .ascii "M*"
      008AD5                          5         MSTAR:
      008AD5 CD 88 18         [ 4] 1923         CALL	DDUP
      008AD8 CD 86 8E         [ 4] 1924         CALL	XORR
      008ADB CD 86 3F         [ 4] 1925         CALL	ZLESS
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



      008ADE CD 85 D1         [ 4] 1926         CALL	TOR
      008AE1 CD 88 C0         [ 4] 1927         CALL	ABSS
      008AE4 CD 86 18         [ 4] 1928         CALL	SWAPP
      008AE7 CD 88 C0         [ 4] 1929         CALL	ABSS
      008AEA CD 8A 80         [ 4] 1930         CALL	UMSTA
      008AED CD 85 B4         [ 4] 1931         CALL	RFROM
      008AF0 CD 85 18         [ 4] 1932         CALL	QBRAN
      008AF3 8A F8                 1933         .word	MSTA1
      008AF5 CD 88 6A         [ 4] 1934         CALL	DNEGA
      008AF8 81               [ 4] 1935 MSTA1:	RET
                                   1936 
                                   1937 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1938 ;       */MOD   ( n1 n2 n3 -- r q )
                                   1939 ;       Multiply n1 and n2, then divide
                                   1940 ;       by n3. Return mod and quotient.
                                   1941 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000A79                       1942         _HEADER SSMOD,5,"*/MOD"
      008AF9 8A D2                    1         .word LINK 
                           000A7B     2         LINK=.
      008AFB 05                       3         .byte 5  
      008AFC 2A 2F 4D 4F 44           4         .ascii "*/MOD"
      008B01                          5         SSMOD:
      008B01 CD 85 D1         [ 4] 1943         CALL     TOR
      008B04 CD 8A D5         [ 4] 1944         CALL     MSTAR
      008B07 CD 85 B4         [ 4] 1945         CALL     RFROM
      008B0A CC 8A 05         [ 2] 1946         JP     MSMOD
                                   1947 
                                   1948 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1949 ;       */      ( n1 n2 n3 -- q )
                                   1950 ;       Multiply n1 by n2, then divide
                                   1951 ;       by n3. Return quotient only.
                                   1952 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000A8D                       1953         _HEADER STASL,2,"*/"
      008B0D 8A FB                    1         .word LINK 
                           000A8F     2         LINK=.
      008B0F 02                       3         .byte 2  
      008B10 2A 2F                    4         .ascii "*/"
      008B12                          5         STASL:
      008B12 CD 8B 01         [ 4] 1954         CALL	SSMOD
      008B15 CD 86 18         [ 4] 1955         CALL	SWAPP
      008B18 CC 85 FE         [ 2] 1956         JP	DROP
                                   1957 
                                   1958 ;; Miscellaneous
                                   1959 
                                   1960 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1961 ;       CELL+   ( a -- a )
                                   1962 ;       Add cell size in byte to address.
                                   1963 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000A9B                       1964         _HEADER CELLP,2,"2+"
      008B1B 8B 0F                    1         .word LINK 
                           000A9D     2         LINK=.
      008B1D 02                       3         .byte 2  
      008B1E 32 2B                    4         .ascii "2+"
      008B20                          5         CELLP:
      008B20 90 93            [ 1] 1965         LDW Y,X
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



      008B22 90 FE            [ 2] 1966 	LDW Y,(Y)
      008B24 72 A9 00 02      [ 2] 1967         ADDW Y,#CELLL 
      008B28 FF               [ 2] 1968         LDW (X),Y
      008B29 81               [ 4] 1969         RET
                                   1970 
                                   1971 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1972 ;       CELL-   ( a -- a )
                                   1973 ;       Subtract 2 from address.
                                   1974 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000AAA                       1975         _HEADER CELLM,2,"2-"
      008B2A 8B 1D                    1         .word LINK 
                           000AAC     2         LINK=.
      008B2C 02                       3         .byte 2  
      008B2D 32 2D                    4         .ascii "2-"
      008B2F                          5         CELLM:
      008B2F 90 93            [ 1] 1976         LDW Y,X
      008B31 90 FE            [ 2] 1977 	LDW Y,(Y)
      008B33 72 A2 00 02      [ 2] 1978         SUBW Y,#CELLL
      008B37 FF               [ 2] 1979         LDW (X),Y
      008B38 81               [ 4] 1980         RET
                                   1981 
                                   1982 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1983 ;       CELLS   ( n -- n )
                                   1984 ;       Multiply tos by 2.
                                   1985 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000AB9                       1986         _HEADER CELLS,2,"2*"
      008B39 8B 2C                    1         .word LINK 
                           000ABB     2         LINK=.
      008B3B 02                       3         .byte 2  
      008B3C 32 2A                    4         .ascii "2*"
      008B3E                          5         CELLS:
      008B3E 90 93            [ 1] 1987         LDW Y,X
      008B40 90 FE            [ 2] 1988 	LDW Y,(Y)
      008B42 90 58            [ 2] 1989         SLAW Y
      008B44 FF               [ 2] 1990         LDW (X),Y
      008B45 81               [ 4] 1991         RET
                                   1992 
                                   1993 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1994 ;       1+      ( a -- a )
                                   1995 ;       Add cell size in byte 
                                   1996 ;       to address.
                                   1997 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000AC6                       1998         _HEADER ONEP,2,"1+"
      008B46 8B 3B                    1         .word LINK 
                           000AC8     2         LINK=.
      008B48 02                       3         .byte 2  
      008B49 31 2B                    4         .ascii "1+"
      008B4B                          5         ONEP:
      008B4B 90 93            [ 1] 1999         LDW Y,X
      008B4D 90 FE            [ 2] 2000 	LDW Y,(Y)
      008B4F 90 5C            [ 1] 2001         INCW Y
      008B51 FF               [ 2] 2002         LDW (X),Y
      008B52 81               [ 4] 2003         RET
                                   2004 
                                   2005 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



                                   2006 ;       1-      ( a -- a )
                                   2007 ;       Subtract 2 from address.
                                   2008 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000AD3                       2009         _HEADER ONEM,2,"1-"
      008B53 8B 48                    1         .word LINK 
                           000AD5     2         LINK=.
      008B55 02                       3         .byte 2  
      008B56 31 2D                    4         .ascii "1-"
      008B58                          5         ONEM:
      008B58 90 93            [ 1] 2010         LDW Y,X
      008B5A 90 FE            [ 2] 2011 	LDW Y,(Y)
      008B5C 90 5A            [ 2] 2012         DECW Y
      008B5E FF               [ 2] 2013         LDW (X),Y
      008B5F 81               [ 4] 2014         RET
                                   2015 
                                   2016 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2017 ;  shift left n times 
                                   2018 ; LSHIFT ( n1 n2 -- n1<<n2 )
                                   2019 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000AE0                       2020         _HEADER LSHIFT,6,"LSHIFT"
      008B60 8B 55                    1         .word LINK 
                           000AE2     2         LINK=.
      008B62 06                       3         .byte 6  
      008B63 4C 53 48 49 46 54        4         .ascii "LSHIFT"
      008B69                          5         LSHIFT:
      008B69 E6 01            [ 1] 2021         ld a,(1,x)
      008B6B 1C 00 02         [ 2] 2022         addw x,#CELLL 
      008B6E 90 93            [ 1] 2023         ldw y,x 
      008B70 90 FE            [ 2] 2024         ldw y,(y)
      008B72                       2025 LSHIFT1:
      008B72 4D               [ 1] 2026         tnz a 
      008B73 27 05            [ 1] 2027         jreq LSHIFT4 
      008B75 90 58            [ 2] 2028         sllw y 
      008B77 4A               [ 1] 2029         dec a 
      008B78 20 F8            [ 2] 2030         jra LSHIFT1 
      008B7A                       2031 LSHIFT4:
      008B7A FF               [ 2] 2032         ldw (x),y 
      008B7B 81               [ 4] 2033         ret 
                                   2034 
                                   2035 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2036 ; shift right n times                 
                                   2037 ; RSHIFT (n1 n2 -- n1>>n2 )
                                   2038 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000AFC                       2039         _HEADER RSHIFT,6,"RSHIFT"
      008B7C 8B 62                    1         .word LINK 
                           000AFE     2         LINK=.
      008B7E 06                       3         .byte 6  
      008B7F 52 53 48 49 46 54        4         .ascii "RSHIFT"
      008B85                          5         RSHIFT:
      008B85 E6 01            [ 1] 2040         ld a,(1,x)
      008B87 1C 00 02         [ 2] 2041         addw x,#CELLL 
      008B8A 90 93            [ 1] 2042         ldw y,x 
      008B8C 90 FE            [ 2] 2043         ldw y,(y)
      008B8E                       2044 RSHIFT1:
      008B8E 4D               [ 1] 2045         tnz a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



      008B8F 27 05            [ 1] 2046         jreq RSHIFT4 
      008B91 90 54            [ 2] 2047         srlw y 
      008B93 4A               [ 1] 2048         dec a 
      008B94 20 F8            [ 2] 2049         jra RSHIFT1 
      008B96                       2050 RSHIFT4:
      008B96 FF               [ 2] 2051         ldw (x),y 
      008B97 81               [ 4] 2052         ret 
                                   2053 
                                   2054 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2055 ;       2/      ( n -- n )
                                   2056 ;       divide  tos by 2.
                                   2057 ;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000B18                       2058         _HEADER TWOSL,2,"2/"
      008B98 8B 7E                    1         .word LINK 
                           000B1A     2         LINK=.
      008B9A 02                       3         .byte 2  
      008B9B 32 2F                    4         .ascii "2/"
      008B9D                          5         TWOSL:
      008B9D 90 93            [ 1] 2059         LDW Y,X
      008B9F 90 FE            [ 2] 2060 	LDW Y,(Y)
      008BA1 90 57            [ 2] 2061         SRAW Y
      008BA3 FF               [ 2] 2062         LDW (X),Y
      008BA4 81               [ 4] 2063         RET
                                   2064 
                                   2065 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2066 ;       BL      ( -- 32 )
                                   2067 ;       Return 32,  blank character.
                                   2068 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000B25                       2069         _HEADER BLANK,2,"BL"
      008BA5 8B 9A                    1         .word LINK 
                           000B27     2         LINK=.
      008BA7 02                       3         .byte 2  
      008BA8 42 4C                    4         .ascii "BL"
      008BAA                          5         BLANK:
      008BAA 1D 00 02         [ 2] 2070         SUBW X,#2
      008BAD 90 AE 00 20      [ 2] 2071 	LDW Y,#32
      008BB1 FF               [ 2] 2072         LDW (X),Y
      008BB2 81               [ 4] 2073         RET
                                   2074 
                                   2075 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2076 ;         0     ( -- 0)
                                   2077 ;         Return 0.
                                   2078 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000B33                       2079         _HEADER ZERO,1,"0"
      008BB3 8B A7                    1         .word LINK 
                           000B35     2         LINK=.
      008BB5 01                       3         .byte 1  
      008BB6 30                       4         .ascii "0"
      008BB7                          5         ZERO:
      008BB7 1D 00 02         [ 2] 2080         SUBW X,#2
      008BBA 90 5F            [ 1] 2081 	CLRW Y
      008BBC FF               [ 2] 2082         LDW (X),Y
      008BBD 81               [ 4] 2083         RET
                                   2084 
                                   2085 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



                                   2086 ;         1     ( -- 1)
                                   2087 ;         Return 1.
                                   2088 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000B3E                       2089         _HEADER ONE,1,"1"
      008BBE 8B B5                    1         .word LINK 
                           000B40     2         LINK=.
      008BC0 01                       3         .byte 1  
      008BC1 31                       4         .ascii "1"
      008BC2                          5         ONE:
      008BC2 1D 00 02         [ 2] 2090         SUBW X,#2
      008BC5 90 AE 00 01      [ 2] 2091 	LDW Y,#1
      008BC9 FF               [ 2] 2092         LDW (X),Y
      008BCA 81               [ 4] 2093         RET
                                   2094 
                                   2095 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2096 ;         -1    ( -- -1)
                                   2097 ;   Return -1
                                   2098 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000B4B                       2099         _HEADER MONE,2,"-1"
      008BCB 8B C0                    1         .word LINK 
                           000B4D     2         LINK=.
      008BCD 02                       3         .byte 2  
      008BCE 2D 31                    4         .ascii "-1"
      008BD0                          5         MONE:
      008BD0 1D 00 02         [ 2] 2100         SUBW X,#2
      008BD3 90 AE FF FF      [ 2] 2101 	LDW Y,#0xFFFF
      008BD7 FF               [ 2] 2102         LDW (X),Y
      008BD8 81               [ 4] 2103         RET
                                   2104 
                                   2105 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2106 ;       >CHAR   ( c -- c )
                                   2107 ;       Filter non-printing characters.
                                   2108 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000B59                       2109         _HEADER TCHAR,5,">CHAR"
      008BD9 8B CD                    1         .word LINK 
                           000B5B     2         LINK=.
      008BDB 05                       3         .byte 5  
      008BDC 3E 43 48 41 52           4         .ascii ">CHAR"
      008BE1                          5         TCHAR:
      008BE1 E6 01            [ 1] 2110         ld a,(1,x)
      008BE3 A1 20            [ 1] 2111         cp a,#32  
      008BE5 2B 05            [ 1] 2112         jrmi 1$ 
      008BE7 A1 7F            [ 1] 2113         cp a,#127 
      008BE9 2A 01            [ 1] 2114         jrpl 1$ 
      008BEB 81               [ 4] 2115         ret 
      008BEC A6 5F            [ 1] 2116 1$:     ld a,#'_ 
      008BEE E7 01            [ 1] 2117         ld (1,x),a 
      008BF0 81               [ 4] 2118         ret 
                                   2119 
                                   2120 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2121 ;       DEPTH   ( -- n )
                                   2122 ;       Return  depth of  data stack.
                                   2123 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000B71                       2124         _HEADER DEPTH,5,"DEPTH"
      008BF1 8B DB                    1         .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



                           000B73     2         LINK=.
      008BF3 05                       3         .byte 5  
      008BF4 44 45 50 54 48           4         .ascii "DEPTH"
      008BF9                          5         DEPTH:
      008BF9 90 BE 2C         [ 2] 2125         LDW Y,SP0    ;save data stack ptr
      008BFC BF 24            [ 2] 2126 	LDW XTEMP,X
      008BFE 72 B2 00 24      [ 2] 2127         SUBW Y,XTEMP     ;#bytes = SP0 - X
      008C02 90 57            [ 2] 2128         SRAW Y    ;Y = #stack items
      008C04 1D 00 02         [ 2] 2129 	SUBW X,#2
      008C07 FF               [ 2] 2130         LDW (X),Y     ; if neg, underflow
      008C08 81               [ 4] 2131         RET
                                   2132 
                                   2133 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2134 ;       PICK    ( ... +n -- ... w )
                                   2135 ;       Copy  nth stack item to tos.
                                   2136 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000B89                       2137         _HEADER PICK,4,"PICK"
      008C09 8B F3                    1         .word LINK 
                           000B8B     2         LINK=.
      008C0B 04                       3         .byte 4  
      008C0C 50 49 43 4B              4         .ascii "PICK"
      008C10                          5         PICK:
      008C10 90 93            [ 1] 2138         LDW Y,X   ;D = n1
      008C12 90 FE            [ 2] 2139         LDW Y,(Y)
                                   2140 ; modified for standard compliance          
                                   2141 ; 0 PICK must be equivalent to DUP 
      008C14 90 5C            [ 1] 2142         INCW Y 
      008C16 90 58            [ 2] 2143         SLAW Y
      008C18 BF 24            [ 2] 2144         LDW XTEMP,X
      008C1A 72 B9 00 24      [ 2] 2145         ADDW Y,XTEMP
      008C1E 90 FE            [ 2] 2146         LDW Y,(Y)
      008C20 FF               [ 2] 2147         LDW (X),Y
      008C21 81               [ 4] 2148         RET
                                   2149 
                                   2150 ;; Memory access
                                   2151 
                                   2152 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2153 ;       +!      ( n a -- )
                                   2154 ;       Add n to  contents at 
                                   2155 ;       address a.
                                   2156 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000BA2                       2157         _HEADER PSTOR,2,"+!"
      008C22 8C 0B                    1         .word LINK 
                           000BA4     2         LINK=.
      008C24 02                       3         .byte 2  
      008C25 2B 21                    4         .ascii "+!"
      008C27                          5         PSTOR:
      008C27 90 93            [ 1] 2158         ldw y,x 
      008C29 90 FE            [ 2] 2159         ldw y,(y)
      008C2B 90 BF 26         [ 2] 2160         ldw YTEMP,y  ; address
      008C2E 90 FE            [ 2] 2161         ldw y,(y)  
      008C30 90 89            [ 2] 2162         pushw y  ; value at address 
      008C32 90 93            [ 1] 2163         ldw y,x 
      008C34 90 EE 02         [ 2] 2164         ldw y,(2,y) ; n 
      008C37 72 F9 01         [ 2] 2165         addw y,(1,sp) ; n+value
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



      008C3A 91 CF 26         [ 5] 2166         ldw [YTEMP],y ;  a!
      008C3D 90 85            [ 2] 2167         popw y    ;drop local var
      008C3F 1C 00 04         [ 2] 2168         addw x,#4 ; DDROP 
      008C42 81               [ 4] 2169         ret 
                                   2170 
                                   2171 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2172 ;       2!      ( d a -- )
                                   2173 ;       Store  double integer 
                                   2174 ;       to address a.
                                   2175 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000BC3                       2176         _HEADER DSTOR,2,"2!"
      008C43 8C 24                    1         .word LINK 
                           000BC5     2         LINK=.
      008C45 02                       3         .byte 2  
      008C46 32 21                    4         .ascii "2!"
      008C48                          5         DSTOR:
      008C48 90 93            [ 1] 2177         LDW Y,X 
      008C4A 89               [ 2] 2178         PUSHW X 
      008C4B FE               [ 2] 2179         LDW X,(X) ; a 
      008C4C 90 EE 02         [ 2] 2180         LDW Y,(2,Y) ; dhi 
      008C4F FF               [ 2] 2181         LDW (X),Y 
      008C50 16 01            [ 2] 2182         LDW Y,(1,SP)  
      008C52 90 EE 04         [ 2] 2183         LDW Y,(4,Y) ; dlo 
      008C55 EF 02            [ 2] 2184         LDW (2,X),Y  
      008C57 85               [ 2] 2185         POPW X 
      008C58 1C 00 06         [ 2] 2186         ADDW X,#3*CELLL 
      008C5B 81               [ 4] 2187         RET 
                                   2188 
                                   2189 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2190 ;       2@      ( a -- d )
                                   2191 ;       Fetch double integer 
                                   2192 ;       from address a.
                                   2193 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000BDC                       2194         _HEADER DAT,2,"2@"
      008C5C 8C 45                    1         .word LINK 
                           000BDE     2         LINK=.
      008C5E 02                       3         .byte 2  
      008C5F 32 40                    4         .ascii "2@"
      008C61                          5         DAT:
      008C61 90 93            [ 1] 2195         ldw y,x 
      008C63 1D 00 02         [ 2] 2196         subw x,#CELLL 
      008C66 90 FE            [ 2] 2197         ldw y,(y) ;address 
      008C68 90 89            [ 2] 2198         pushw y  
      008C6A 90 FE            [ 2] 2199         ldw y,(y) ; dhi 
      008C6C FF               [ 2] 2200         ldw (x),y 
      008C6D 90 85            [ 2] 2201         popw y 
      008C6F 90 EE 02         [ 2] 2202         ldw y,(2,y) ; dlo 
      008C72 EF 02            [ 2] 2203         ldw (2,x),y 
      008C74 81               [ 4] 2204         ret 
                                   2205 
                                   2206 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2207 ;       COUNT   ( b -- b +n )
                                   2208 ;       Return count byte of a string
                                   2209 ;       and add 1 to byte address.
                                   2210 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



      000BF5                       2211         _HEADER COUNT,5,"COUNT"
      008C75 8C 5E                    1         .word LINK 
                           000BF7     2         LINK=.
      008C77 05                       3         .byte 5  
      008C78 43 4F 55 4E 54           4         .ascii "COUNT"
      008C7D                          5         COUNT:
      008C7D 90 93            [ 1] 2212         ldw y,x 
      008C7F 90 FE            [ 2] 2213         ldw y,(y) ; address 
      008C81 90 F6            [ 1] 2214         ld a,(y)  ; count 
      008C83 90 5C            [ 1] 2215         incw y 
      008C85 FF               [ 2] 2216         ldw (x),y 
      008C86 1D 00 02         [ 2] 2217         subw x,#CELLL 
      008C89 E7 01            [ 1] 2218         ld (1,x),a 
      008C8B 7F               [ 1] 2219         clr (x)
      008C8C 81               [ 4] 2220         ret 
                                   2221 
                                   2222 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2223 ;       HERE    ( -- a )
                                   2224 ;       Return  top of  variables
                                   2225 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000C0D                       2226         _HEADER HERE,4,"HERE"
      008C8D 8C 77                    1         .word LINK 
                           000C0F     2         LINK=.
      008C8F 04                       3         .byte 4  
      008C90 48 45 52 45              4         .ascii "HERE"
      008C94                          5         HERE:
      008C94 90 AE 00 18      [ 2] 2227       	ldw y,#UVP 
      008C98 90 FE            [ 2] 2228         ldw y,(y)
      008C9A 1D 00 02         [ 2] 2229         subw x,#CELLL 
      008C9D FF               [ 2] 2230         ldw (x),y 
      008C9E 81               [ 4] 2231         ret 
                                   2232 
                                   2233 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2234 ;       PAD     ( -- a )
                                   2235 ;       Return address of text buffer
                                   2236 ;       above  code dictionary.
                                   2237 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000C1F                       2238         _HEADER PAD,3,"PAD"
      008C9F 8C 8F                    1         .word LINK 
                           000C21     2         LINK=.
      008CA1 03                       3         .byte 3  
      008CA2 50 41 44                 4         .ascii "PAD"
      008CA5                          5         PAD:
      008CA5 CD 8C 94         [ 4] 2239         CALL     HERE
      000C28                       2240         _DOLIT   80
      008CA8 CD 84 EF         [ 4]    1     CALL DOLIT 
      008CAB 00 50                    2     .word 80 
      008CAD CC 88 2D         [ 2] 2241         JP     PLUS
                                   2242 
                                   2243 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2244 ;       TIB     ( -- a )
                                   2245 ;       Return address of 
                                   2246 ;       terminal input buffer.
                                   2247 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000C30                       2248         _HEADER TIB,3,"TIB"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



      008CB0 8C A1                    1         .word LINK 
                           000C32     2         LINK=.
      008CB2 03                       3         .byte 3  
      008CB3 54 49 42                 4         .ascii "TIB"
      008CB6                          5         TIB:
      008CB6 CD 86 FC         [ 4] 2249         CALL     NTIB
      008CB9 CD 8B 20         [ 4] 2250         CALL     CELLP
      008CBC CC 85 63         [ 2] 2251         JP     AT
                                   2252 
                                   2253 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2254 ;       @EXECUTE        ( a -- )
                                   2255 ;       Execute vector stored in 
                                   2256 ;       address a.
                                   2257 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000C3F                       2258         _HEADER ATEXE,8,"@EXECUTE"
      008CBF 8C B2                    1         .word LINK 
                           000C41     2         LINK=.
      008CC1 08                       3         .byte 8  
      008CC2 40 45 58 45 43 55 54     4         .ascii "@EXECUTE"
             45
      008CCA                          5         ATEXE:
      008CCA CD 85 63         [ 4] 2259         CALL     AT
      008CCD CD 87 BB         [ 4] 2260         CALL     QDUP    ;?address or zero
      008CD0 CD 85 18         [ 4] 2261         CALL     QBRAN
      008CD3 8C D8                 2262         .word      EXE1
      008CD5 CD 85 44         [ 4] 2263         CALL     EXECU   ;execute if non-zero
      008CD8 81               [ 4] 2264 EXE1:   RET     ;do nothing if zero
                                   2265 
                                   2266 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2267 ;       CMOVE   ( b1 b2 u -- )
                                   2268 ;       Copy u bytes from b1 to b2.
                                   2269 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000C59                       2270         _HEADER CMOVE,5,"CMOVE"
      008CD9 8C C1                    1         .word LINK 
                           000C5B     2         LINK=.
      008CDB 05                       3         .byte 5  
      008CDC 43 4D 4F 56 45           4         .ascii "CMOVE"
      008CE1                          5         CMOVE:
      008CE1 CD 85 D1         [ 4] 2271         CALL	TOR
      008CE4 CD 85 34         [ 4] 2272         CALL	BRAN
      008CE7 8D 01                 2273         .word	CMOV2
      008CE9 CD 85 D1         [ 4] 2274 CMOV1:	CALL	TOR
      008CEC CD 86 08         [ 4] 2275         CALL	DUPP
      008CEF CD 85 81         [ 4] 2276         CALL	CAT
      008CF2 CD 85 C5         [ 4] 2277         CALL	RAT
      008CF5 CD 85 70         [ 4] 2278         CALL	CSTOR
      008CF8 CD 8B 4B         [ 4] 2279         CALL	ONEP
      008CFB CD 85 B4         [ 4] 2280         CALL	RFROM
      008CFE CD 8B 4B         [ 4] 2281         CALL	ONEP
      008D01 CD 85 03         [ 4] 2282 CMOV2:	CALL	DONXT
      008D04 8C E9                 2283         .word	CMOV1
      008D06 CC 88 0D         [ 2] 2284         JP	DDROP
                                   2285 
                                   2286 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2287 ;       FILL    ( b u c -- )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



                                   2288 ;       Fill u bytes of character c
                                   2289 ;       to area beginning at b.
                                   2290 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000C89                       2291         _HEADER FILL,4,"FILL"
      008D09 8C DB                    1         .word LINK 
                           000C8B     2         LINK=.
      008D0B 04                       3         .byte 4  
      008D0C 46 49 4C 4C              4         .ascii "FILL"
      008D10                          5         FILL:
      008D10 90 93            [ 1] 2292         ldw y,x 
      008D12 90 E6 01         [ 1] 2293         ld a,(1,y) ; c 
      008D15 1C 00 02         [ 2] 2294         addw x,#CELLL ; drop c 
      008D18 90 93            [ 1] 2295         ldw y,x 
      008D1A 90 FE            [ 2] 2296         ldw y,(y) ; count
      008D1C 90 89            [ 2] 2297         pushw y 
      008D1E 1C 00 02         [ 2] 2298         addw x,#CELLL ; drop u 
      008D21 90 93            [ 1] 2299         ldw y,x 
      008D23 1C 00 02         [ 2] 2300         addw x,#CELLL ; drop b 
      008D26 90 FE            [ 2] 2301         ldw y,(y) ; address
      008D28 90 BF 26         [ 2] 2302         ldw YTEMP,y
      008D2B 90 85            [ 2] 2303         popw y ; count 
      008D2D                       2304 FILL1:  
      008D2D 92 C7 26         [ 4] 2305         ld [YTEMP],a 
      008D30 3C 27            [ 1] 2306         inc YTEMP+1
      008D32 24 02            [ 1] 2307         jrnc FILL2 
      008D34 3C 26            [ 1] 2308         inc YTEMP
      008D36                       2309 FILL2: 
      008D36 90 5A            [ 2] 2310         decw y ; count 
      008D38 26 F3            [ 1] 2311         jrne FILL1  
      008D3A 81               [ 4] 2312         ret 
                                   2313 
                                   2314 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2315 ;       ERASE   ( b u -- )
                                   2316 ;       Erase u bytes beginning at b.
                                   2317 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000CBB                       2318         _HEADER ERASE,5,"ERASE"
      008D3B 8D 0B                    1         .word LINK 
                           000CBD     2         LINK=.
      008D3D 05                       3         .byte 5  
      008D3E 45 52 41 53 45           4         .ascii "ERASE"
      008D43                          5         ERASE:
      008D43 90 5F            [ 1] 2319         clrw y 
      008D45 1D 00 02         [ 2] 2320         subw x,#CELLL 
      008D48 FF               [ 2] 2321         ldw (x),y 
      008D49 CC 8D 10         [ 2] 2322         jp FILL 
                                   2323 
                                   2324 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2325 ;       PACK0   ( b u a -- a )
                                   2326 ;       Build a counted string with
                                   2327 ;       u characters from b. Null fill.
                                   2328 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000CCC                       2329         _HEADER PACKS,5,"PACK0"
      008D4C 8D 3D                    1         .word LINK 
                           000CCE     2         LINK=.
      008D4E 05                       3         .byte 5  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



      008D4F 50 41 43 4B 30           4         .ascii "PACK0"
      008D54                          5         PACKS:
      008D54 CD 86 08         [ 4] 2330         CALL     DUPP
      008D57 CD 85 D1         [ 4] 2331         CALL     TOR     ;strings only on cell boundary
      008D5A CD 88 18         [ 4] 2332         CALL     DDUP
      008D5D CD 85 70         [ 4] 2333         CALL     CSTOR
      008D60 CD 8B 4B         [ 4] 2334         CALL     ONEP ;save count
      008D63 CD 86 18         [ 4] 2335         CALL     SWAPP
      008D66 CD 8C E1         [ 4] 2336         CALL     CMOVE
      008D69 CD 85 B4         [ 4] 2337         CALL     RFROM
      008D6C 81               [ 4] 2338         RET
                                   2339 
                                   2340 ;; Numeric output, single precision
                                   2341 
                                   2342 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2343 ;       DIGIT   ( u -- c )
                                   2344 ;       Convert digit u to a character.
                                   2345 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000CED                       2346         _HEADER DIGIT,5,"DIGIT"
      008D6D 8D 4E                    1         .word LINK 
                           000CEF     2         LINK=.
      008D6F 05                       3         .byte 5  
      008D70 44 49 47 49 54           4         .ascii "DIGIT"
      008D75                          5         DIGIT:
      008D75 CD 84 EF         [ 4] 2347         CALL	DOLIT
      008D78 00 09                 2348         .word	9
      008D7A CD 86 30         [ 4] 2349         CALL	OVER
      008D7D CD 89 0B         [ 4] 2350         CALL	LESS
      008D80 CD 84 EF         [ 4] 2351         CALL	DOLIT
      008D83 00 07                 2352         .word	7
      008D85 CD 86 65         [ 4] 2353         CALL	ANDD
      008D88 CD 88 2D         [ 4] 2354         CALL	PLUS
      008D8B CD 84 EF         [ 4] 2355         CALL	DOLIT
      008D8E 00 30                 2356         .word	48	;'0'
      008D90 CC 88 2D         [ 2] 2357         JP	PLUS
                                   2358 
                                   2359 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2360 ;       EXTRACT ( n base -- n c )
                                   2361 ;       Extract least significant 
                                   2362 ;       digit from n.
                                   2363 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000D13                       2364         _HEADER EXTRC,7,"EXTRACT"
      008D93 8D 6F                    1         .word LINK 
                           000D15     2         LINK=.
      008D95 07                       3         .byte 7  
      008D96 45 58 54 52 41 43 54     4         .ascii "EXTRACT"
      008D9D                          5         EXTRC:
      008D9D CD 8B B7         [ 4] 2365         CALL     ZERO
      008DA0 CD 86 18         [ 4] 2366         CALL     SWAPP
      008DA3 CD 89 C1         [ 4] 2367         CALL     UMMOD
      008DA6 CD 86 18         [ 4] 2368         CALL     SWAPP
      008DA9 CC 8D 75         [ 2] 2369         JP     DIGIT
                                   2370 
                                   2371 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2372 ;       <#      ( -- )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



                                   2373 ;       Initiate  numeric 
                                   2374 ;       output process.
                                   2375 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000D2C                       2376         _HEADER BDIGS,2,"#<"
      008DAC 8D 95                    1         .word LINK 
                           000D2E     2         LINK=.
      008DAE 02                       3         .byte 2  
      008DAF 23 3C                    4         .ascii "#<"
      008DB1                          5         BDIGS:
      008DB1 CD 8C A5         [ 4] 2377         CALL     PAD
      008DB4 CD 87 3E         [ 4] 2378         CALL     HLD
      008DB7 CC 85 51         [ 2] 2379         JP     STORE
                                   2380 
                                   2381 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2382 ;       HOLD    ( c -- )
                                   2383 ;       Insert a character 
                                   2384 ;       into output string.
                                   2385 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000D3A                       2386         _HEADER HOLD,4,"HOLD"
      008DBA 8D AE                    1         .word LINK 
                           000D3C     2         LINK=.
      008DBC 04                       3         .byte 4  
      008DBD 48 4F 4C 44              4         .ascii "HOLD"
      008DC1                          5         HOLD:
      008DC1 CD 87 3E         [ 4] 2387         CALL     HLD
      008DC4 CD 85 63         [ 4] 2388         CALL     AT
      008DC7 CD 8B 58         [ 4] 2389         CALL     ONEM
      008DCA CD 86 08         [ 4] 2390         CALL     DUPP
      008DCD CD 87 3E         [ 4] 2391         CALL     HLD
      008DD0 CD 85 51         [ 4] 2392         CALL     STORE
      008DD3 CC 85 70         [ 2] 2393         JP     CSTOR
                                   2394 
                                   2395 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2396 ;       #       ( u -- u )
                                   2397 ;       Extract one digit from u and
                                   2398 ;       append digit to output string.
                                   2399 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000D56                       2400         _HEADER DIG,1,"#"
      008DD6 8D BC                    1         .word LINK 
                           000D58     2         LINK=.
      008DD8 01                       3         .byte 1  
      008DD9 23                       4         .ascii "#"
      008DDA                          5         DIG:
      008DDA CD 86 CE         [ 4] 2401         CALL     BASE
      008DDD CD 85 63         [ 4] 2402         CALL     AT
      008DE0 CD 8D 9D         [ 4] 2403         CALL     EXTRC
      008DE3 CC 8D C1         [ 2] 2404         JP     HOLD
                                   2405 
                                   2406 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2407 ;       #S      ( u -- 0 )
                                   2408 ;       Convert u until all digits
                                   2409 ;       are added to output string.
                                   2410 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000D66                       2411         _HEADER DIGS,2,"#S"
      008DE6 8D D8                    1         .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



                           000D68     2         LINK=.
      008DE8 02                       3         .byte 2  
      008DE9 23 53                    4         .ascii "#S"
      008DEB                          5         DIGS:
      008DEB CD 8D DA         [ 4] 2412 DIGS1:  CALL     DIG
      008DEE CD 86 08         [ 4] 2413         CALL     DUPP
      008DF1 CD 85 18         [ 4] 2414         CALL     QBRAN
      008DF4 8D F8                 2415         .word      DIGS2
      008DF6 20 F3            [ 2] 2416         JRA     DIGS1
      008DF8 81               [ 4] 2417 DIGS2:  RET
                                   2418 
                                   2419 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2420 ;       SIGN    ( n -- )
                                   2421 ;       Add a minus sign to
                                   2422 ;       numeric output string.
                                   2423 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000D79                       2424         _HEADER SIGN,4,"SIGN"
      008DF9 8D E8                    1         .word LINK 
                           000D7B     2         LINK=.
      008DFB 04                       3         .byte 4  
      008DFC 53 49 47 4E              4         .ascii "SIGN"
      008E00                          5         SIGN:
      008E00 CD 86 3F         [ 4] 2425         CALL     ZLESS
      008E03 CD 85 18         [ 4] 2426         CALL     QBRAN
      008E06 8E 10                 2427         .word      SIGN1
      008E08 CD 84 EF         [ 4] 2428         CALL     DOLIT
      008E0B 00 2D                 2429         .word      45	;"-"
      008E0D CC 8D C1         [ 2] 2430         JP     HOLD
      008E10 81               [ 4] 2431 SIGN1:  RET
                                   2432 
                                   2433 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2434 ;       #>      ( w -- b u )
                                   2435 ;       Prepare output string.
                                   2436 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000D91                       2437         _HEADER EDIGS,2,"#>"
      008E11 8D FB                    1         .word LINK 
                           000D93     2         LINK=.
      008E13 02                       3         .byte 2  
      008E14 23 3E                    4         .ascii "#>"
      008E16                          5         EDIGS:
      008E16 CD 85 FE         [ 4] 2438         CALL     DROP
      008E19 CD 87 3E         [ 4] 2439         CALL     HLD
      008E1C CD 85 63         [ 4] 2440         CALL     AT
      008E1F CD 8C A5         [ 4] 2441         CALL     PAD
      008E22 CD 86 30         [ 4] 2442         CALL     OVER
      008E25 CC 88 A6         [ 2] 2443         JP     SUBB
                                   2444 
                                   2445 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2446 ;       str     ( w -- b u )
                                   2447 ;       Convert a signed integer
                                   2448 ;       to a numeric string.
                                   2449 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000DA8                       2450         _HEADER STR,3,"STR"
      008E28 8E 13                    1         .word LINK 
                           000DAA     2         LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



      008E2A 03                       3         .byte 3  
      008E2B 53 54 52                 4         .ascii "STR"
      008E2E                          5         STR:
      008E2E CD 86 08         [ 4] 2451         CALL     DUPP
      008E31 CD 85 D1         [ 4] 2452         CALL     TOR
      008E34 CD 88 C0         [ 4] 2453         CALL     ABSS
      008E37 CD 8D B1         [ 4] 2454         CALL     BDIGS
      008E3A CD 8D EB         [ 4] 2455         CALL     DIGS
      008E3D CD 85 B4         [ 4] 2456         CALL     RFROM
      008E40 CD 8E 00         [ 4] 2457         CALL     SIGN
      008E43 CC 8E 16         [ 2] 2458         JP     EDIGS
                                   2459 
                                   2460 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2461 ;       HEX     ( -- )
                                   2462 ;       Use radix 16 as base for
                                   2463 ;       numeric conversions.
                                   2464 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000DC6                       2465         _HEADER HEX,3,"HEX"
      008E46 8E 2A                    1         .word LINK 
                           000DC8     2         LINK=.
      008E48 03                       3         .byte 3  
      008E49 48 45 58                 4         .ascii "HEX"
      008E4C                          5         HEX:
      008E4C CD 84 EF         [ 4] 2466         CALL     DOLIT
      008E4F 00 10                 2467         .word      16
      008E51 CD 86 CE         [ 4] 2468         CALL     BASE
      008E54 CC 85 51         [ 2] 2469         JP     STORE
                                   2470 
                                   2471 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2472 ;       DECIMAL ( -- )
                                   2473 ;       Use radix 10 as base
                                   2474 ;       for numeric conversions.
                                   2475 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000DD7                       2476         _HEADER DECIM,7,"DECIMAL"
      008E57 8E 48                    1         .word LINK 
                           000DD9     2         LINK=.
      008E59 07                       3         .byte 7  
      008E5A 44 45 43 49 4D 41 4C     4         .ascii "DECIMAL"
      008E61                          5         DECIM:
      008E61 CD 84 EF         [ 4] 2477         CALL     DOLIT
      008E64 00 0A                 2478         .word      10
      008E66 CD 86 CE         [ 4] 2479         CALL     BASE
      008E69 CC 85 51         [ 2] 2480         JP     STORE
                                   2481 
                                   2482 ;; Numeric input, single precision
                                   2483 
                                   2484 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2485 ;       DIGIT?  ( c base -- u t )
                                   2486 ;       Convert a character to its numeric
                                   2487 ;       value. A flag indicates success.
                                   2488 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000DEC                       2489         _HEADER DIGTQ,6,"DIGIT?"
      008E6C 8E 59                    1         .word LINK 
                           000DEE     2         LINK=.
      008E6E 06                       3         .byte 6  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



      008E6F 44 49 47 49 54 3F        4         .ascii "DIGIT?"
      008E75                          5         DIGTQ:
      008E75 CD 85 D1         [ 4] 2490         CALL     TOR
      008E78 CD 84 EF         [ 4] 2491         CALL     DOLIT
      008E7B 00 30                 2492         .word     48	; "0"
      008E7D CD 88 A6         [ 4] 2493         CALL     SUBB
      008E80 CD 84 EF         [ 4] 2494         CALL     DOLIT
      008E83 00 09                 2495         .word      9
      008E85 CD 86 30         [ 4] 2496         CALL     OVER
      008E88 CD 89 0B         [ 4] 2497         CALL     LESS
      008E8B CD 85 18         [ 4] 2498         CALL     QBRAN
      008E8E 8E A6                 2499         .word      DGTQ1
      008E90 CD 84 EF         [ 4] 2500         CALL     DOLIT
      008E93 00 07                 2501         .word      7
      008E95 CD 88 A6         [ 4] 2502         CALL     SUBB
      008E98 CD 86 08         [ 4] 2503         CALL     DUPP
      008E9B CD 84 EF         [ 4] 2504         CALL     DOLIT
      008E9E 00 0A                 2505         .word      10
      008EA0 CD 89 0B         [ 4] 2506         CALL     LESS
      008EA3 CD 86 79         [ 4] 2507         CALL     ORR
      008EA6 CD 86 08         [ 4] 2508 DGTQ1:  CALL     DUPP
      008EA9 CD 85 B4         [ 4] 2509         CALL     RFROM
      008EAC CC 88 ED         [ 2] 2510         JP     ULESS
                                   2511 
                           000001  2512 .if  WANT_DOUBLE
                           000000  2513 .else 
                                   2514 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2515 ;       NUMBER? ( a -- n T | a F )
                                   2516 ;       Convert a number string to
                                   2517 ;       integer. Push a flag on tos.
                                   2518 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2519         _HEADER NUMBQ,7,"NUMBER?"
                                   2520         CALL     BASE
                                   2521         CALL     AT
                                   2522         CALL     TOR
                                   2523         CALL     ZERO
                                   2524         CALL     OVER
                                   2525         CALL     COUNT
                                   2526         CALL     OVER
                                   2527         CALL     CAT
                                   2528         CALL     DOLIT
                                   2529         .word     36	; "0x"
                                   2530         CALL     EQUAL
                                   2531         CALL     QBRAN
                                   2532         .word      NUMQ1
                                   2533         CALL     HEX
                                   2534         CALL     SWAPP
                                   2535         CALL     ONEP
                                   2536         CALL     SWAPP
                                   2537         CALL     ONEM
                                   2538 NUMQ1:  CALL     OVER
                                   2539         CALL     CAT
                                   2540         CALL     DOLIT
                                   2541         .word     45	; "-"
                                   2542         CALL     EQUAL
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



                                   2543         CALL     TOR
                                   2544         CALL     SWAPP
                                   2545         CALL     RAT
                                   2546         CALL     SUBB
                                   2547         CALL     SWAPP
                                   2548         CALL     RAT
                                   2549         CALL     PLUS
                                   2550         CALL     QDUP
                                   2551         CALL     QBRAN
                                   2552         .word      NUMQ6
                                   2553         CALL     ONEM
                                   2554         CALL     TOR
                                   2555 NUMQ2:  CALL     DUPP
                                   2556         CALL     TOR
                                   2557         CALL     CAT
                                   2558         CALL     BASE
                                   2559         CALL     AT
                                   2560         CALL     DIGTQ
                                   2561         CALL     QBRAN
                                   2562         .word      NUMQ4
                                   2563         CALL     SWAPP
                                   2564         CALL     BASE
                                   2565         CALL     AT
                                   2566         CALL     STAR
                                   2567         CALL     PLUS
                                   2568         CALL     RFROM
                                   2569         CALL     ONEP
                                   2570         CALL     DONXT
                                   2571         .word      NUMQ2
                                   2572         CALL     RAT
                                   2573         CALL     SWAPP
                                   2574         CALL     DROP
                                   2575         CALL     QBRAN
                                   2576         .word      NUMQ3
                                   2577         CALL     NEGAT
                                   2578 NUMQ3:  CALL     SWAPP
                                   2579         JRA     NUMQ5
                                   2580 NUMQ4:  CALL     RFROM
                                   2581         CALL     RFROM
                                   2582         CALL     DDROP
                                   2583         CALL     DDROP
                                   2584         CALL     ZERO
                                   2585 NUMQ5:  CALL     DUPP
                                   2586 NUMQ6:  CALL     RFROM
                                   2587         CALL     DDROP
                                   2588         CALL     RFROM
                                   2589         CALL     BASE
                                   2590         JP     STORE
                                   2591 .endif ; WANT_DOUBLE  
                                   2592 
                                   2593 ;; Basic I/O
                                   2594 
                                   2595 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2596 ;       KEY     ( -- c )
                                   2597 ;       Wait for and return an
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



                                   2598 ;       input character.
                                   2599 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000E2F                       2600         _HEADER KEY,3,"KEY"
      008EAF 8E 6E                    1         .word LINK 
                           000E31     2         LINK=.
      008EB1 03                       3         .byte 3  
      008EB2 4B 45 59                 4         .ascii "KEY"
      008EB5                          5         KEY:
      008EB5 72 0B 52 30 FB   [ 2] 2601         btjf UART_SR,#UART_SR_RXNE,. 
      008EBA C6 52 31         [ 1] 2602         ld a,UART_DR 
      008EBD 1D 00 02         [ 2] 2603         subw x,#CELLL 
      008EC0 E7 01            [ 1] 2604         ld (1,x),a 
      008EC2 7F               [ 1] 2605         clr (x)
      008EC3 81               [ 4] 2606         ret 
                                   2607 
                                   2608 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2609 ;       NUF?    ( -- t )
                                   2610 ;       Return false if no input,
                                   2611 ;       else pause and if CR return true.
                                   2612 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000E44                       2613         _HEADER NUFQ,4,"NUF?"
      008EC4 8E B1                    1         .word LINK 
                           000E46     2         LINK=.
      008EC6 04                       3         .byte 4  
      008EC7 4E 55 46 3F              4         .ascii "NUF?"
      008ECB                          5         NUFQ:
      008ECB CD 84 98         [ 4] 2614         CALL     QKEY
      008ECE CD 86 08         [ 4] 2615         CALL     DUPP
      008ED1 CD 85 18         [ 4] 2616         CALL     QBRAN
      008ED4 8E E4                 2617         .word    NUFQ1
      008ED6 CD 88 0D         [ 4] 2618         CALL     DDROP
      008ED9 CD 8E B5         [ 4] 2619         CALL     KEY
      008EDC CD 84 EF         [ 4] 2620         CALL     DOLIT
      008EDF 00 0D                 2621         .word      CRR
      008EE1 CC 88 CE         [ 2] 2622         JP     EQUAL
      008EE4 81               [ 4] 2623 NUFQ1:  RET
                                   2624 
                                   2625 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2626 ;       SPACE   ( -- )
                                   2627 ;       Send  blank character to
                                   2628 ;       output device.
                                   2629 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000E65                       2630         _HEADER SPACE,5,"SPACE"
      008EE5 8E C6                    1         .word LINK 
                           000E67     2         LINK=.
      008EE7 05                       3         .byte 5  
      008EE8 53 50 41 43 45           4         .ascii "SPACE"
      008EED                          5         SPACE:
      008EED CD 8B AA         [ 4] 2631         CALL     BLANK
      008EF0 CC 84 B6         [ 2] 2632         JP     EMIT
                                   2633 
                                   2634 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2635 ;       SPACES  ( +n -- )
                                   2636 ;       Send n spaces to output device.
                                   2637 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



      000E73                       2638         _HEADER SPACS,6,"SPACES"
      008EF3 8E E7                    1         .word LINK 
                           000E75     2         LINK=.
      008EF5 06                       3         .byte 6  
      008EF6 53 50 41 43 45 53        4         .ascii "SPACES"
      008EFC                          5         SPACS:
      008EFC CD 8B B7         [ 4] 2639         CALL     ZERO
      008EFF CD 89 69         [ 4] 2640         CALL     MAX
      008F02 CD 85 D1         [ 4] 2641         CALL     TOR
      008F05 20 03            [ 2] 2642         JRA      CHAR2
      008F07 CD 8E ED         [ 4] 2643 CHAR1:  CALL     SPACE
      008F0A CD 85 03         [ 4] 2644 CHAR2:  CALL     DONXT
      008F0D 8F 07                 2645         .word    CHAR1
      008F0F 81               [ 4] 2646         RET
                                   2647 
                                   2648 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2649 ;       TYPE    ( b u -- )
                                   2650 ;       Output u characters from b.
                                   2651 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000E90                       2652         _HEADER TYPES,4,"TYPE"
      008F10 8E F5                    1         .word LINK 
                           000E92     2         LINK=.
      008F12 04                       3         .byte 4  
      008F13 54 59 50 45              4         .ascii "TYPE"
      008F17                          5         TYPES:
      008F17 CD 85 D1         [ 4] 2653         CALL     TOR
      008F1A 20 06            [ 2] 2654         JRA     TYPE2
      008F1C CD 8C 7D         [ 4] 2655 TYPE1:  CALL     COUNT 
      008F1F CD 84 B6         [ 4] 2656         CALL     EMIT
      000EA2                       2657 TYPE2:  _DONXT  TYPE1
      008F22 CD 85 03         [ 4]    1     CALL DONXT 
      008F25 8F 1C                    2     .word TYPE1 
      008F27 CC 85 FE         [ 2] 2658         JP     DROP
                                   2659 
                                   2660 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2661 ;       CR      ( -- )
                                   2662 ;       Output a carriage return
                                   2663 ;       and a line feed.
                                   2664 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000EAA                       2665         _HEADER CR,2,"CR"
      008F2A 8F 12                    1         .word LINK 
                           000EAC     2         LINK=.
      008F2C 02                       3         .byte 2  
      008F2D 43 52                    4         .ascii "CR"
      008F2F                          5         CR:
      000EAF                       2666         _DOLIT  CRR 
      008F2F CD 84 EF         [ 4]    1     CALL DOLIT 
      008F32 00 0D                    2     .word CRR 
      008F34 CD 84 B6         [ 4] 2667         CALL    EMIT
      000EB7                       2668         _DOLIT  LF
      008F37 CD 84 EF         [ 4]    1     CALL DOLIT 
      008F3A 00 0A                    2     .word LF 
      008F3C CC 84 B6         [ 2] 2669         JP      EMIT
                                   2670 
                                   2671 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



                                   2672 ;       do$     ( -- a )
                                   2673 ;       Return  address of a compiled
                                   2674 ;       string.
                                   2675 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2676 ;       _HEADER DOSTR,COMPO+3,"DO$"
      008F3F                       2677 DOSTR:
      008F3F CD 85 B4         [ 4] 2678         CALL     RFROM
      008F42 CD 85 C5         [ 4] 2679         CALL     RAT
      008F45 CD 85 B4         [ 4] 2680         CALL     RFROM
      008F48 CD 8C 7D         [ 4] 2681         CALL     COUNT
      008F4B CD 88 2D         [ 4] 2682         CALL     PLUS
      008F4E CD 85 D1         [ 4] 2683         CALL     TOR
      008F51 CD 86 18         [ 4] 2684         CALL     SWAPP
      008F54 CD 85 D1         [ 4] 2685         CALL     TOR
      008F57 81               [ 4] 2686         RET
                                   2687 
                                   2688 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2689 ;       $"|     ( -- a )
                                   2690 ;       Run time routine compiled by $".
                                   2691 ;       Return address of a compiled string.
                                   2692 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2693 ;       _HEADER STRQP,COMPO+3,"$\"|"
      008F58                       2694 STRQP:
      008F58 CD 8F 3F         [ 4] 2695         CALL     DOSTR
      008F5B 81               [ 4] 2696         RET
                                   2697 
                                   2698 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2699 ;       ."|     ( -- )
                                   2700 ;       Run time routine of ." .
                                   2701 ;       Output a compiled string.
                                   2702 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2703 ;       _HEADER DOTQP,COMPO+3,".\"|"
      008F5C                       2704 DOTQP:
      008F5C CD 8F 3F         [ 4] 2705         CALL     DOSTR
      008F5F CD 8C 7D         [ 4] 2706         CALL     COUNT
      008F62 CC 8F 17         [ 2] 2707         JP     TYPES
                                   2708 
                                   2709 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2710 ;       .R      ( n +n -- )
                                   2711 ;       Display an integer in a field
                                   2712 ;       of n columns, right justified.
                                   2713 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000EE5                       2714         _HEADER DOTR,2,".R"
      008F65 8F 2C                    1         .word LINK 
                           000EE7     2         LINK=.
      008F67 02                       3         .byte 2  
      008F68 2E 52                    4         .ascii ".R"
      008F6A                          5         DOTR:
      008F6A CD 85 D1         [ 4] 2715         CALL     TOR
      008F6D CD 8E 2E         [ 4] 2716         CALL     STR
      008F70 CD 85 B4         [ 4] 2717         CALL     RFROM
      008F73 CD 86 30         [ 4] 2718         CALL     OVER
      008F76 CD 88 A6         [ 4] 2719         CALL     SUBB
      008F79 CD 8E FC         [ 4] 2720         CALL     SPACS
      008F7C CC 8F 17         [ 2] 2721         JP     TYPES
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



                                   2722 
                                   2723 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2724 ;       U.R     ( u +n -- )
                                   2725 ;       Display an unsigned integer
                                   2726 ;       in n column, right justified.
                                   2727 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000EFF                       2728         _HEADER UDOTR,3,"U.R"
      008F7F 8F 67                    1         .word LINK 
                           000F01     2         LINK=.
      008F81 03                       3         .byte 3  
      008F82 55 2E 52                 4         .ascii "U.R"
      008F85                          5         UDOTR:
      008F85 CD 85 D1         [ 4] 2729         CALL     TOR
      008F88 CD 8D B1         [ 4] 2730         CALL     BDIGS
      008F8B CD 8D EB         [ 4] 2731         CALL     DIGS
      008F8E CD 8E 16         [ 4] 2732         CALL     EDIGS
      008F91 CD 85 B4         [ 4] 2733         CALL     RFROM
      008F94 CD 86 30         [ 4] 2734         CALL     OVER
      008F97 CD 88 A6         [ 4] 2735         CALL     SUBB
      008F9A CD 8E FC         [ 4] 2736         CALL     SPACS
      008F9D CC 8F 17         [ 2] 2737         JP     TYPES
                                   2738 
                                   2739 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2740 ;       U.      ( u -- )
                                   2741 ;       Display an unsigned integer
                                   2742 ;       in free format.
                                   2743 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000F20                       2744         _HEADER UDOT,2,"U."
      008FA0 8F 81                    1         .word LINK 
                           000F22     2         LINK=.
      008FA2 02                       3         .byte 2  
      008FA3 55 2E                    4         .ascii "U."
      008FA5                          5         UDOT:
      008FA5 CD 8D B1         [ 4] 2745         CALL     BDIGS
      008FA8 CD 8D EB         [ 4] 2746         CALL     DIGS
      008FAB CD 8E 16         [ 4] 2747         CALL     EDIGS
      008FAE CD 8E ED         [ 4] 2748         CALL     SPACE
      008FB1 CC 8F 17         [ 2] 2749         JP     TYPES
                                   2750 
                                   2751 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2752 ;   H. ( n -- )
                                   2753 ;   display n in hexadecimal 
                                   2754 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000F34                       2755         _HEADER HDOT,2,"H."
      008FB4 8F A2                    1         .word LINK 
                           000F36     2         LINK=.
      008FB6 02                       3         .byte 2  
      008FB7 48 2E                    4         .ascii "H."
      008FB9                          5         HDOT:
      008FB9 CD 86 CE         [ 4] 2756         CALL BASE 
      008FBC CD 85 63         [ 4] 2757         CALL AT 
      008FBF CD 85 D1         [ 4] 2758         CALL TOR 
      008FC2 CD 8E 4C         [ 4] 2759         CALL HEX 
      008FC5 CD 8F A5         [ 4] 2760         CALL UDOT 
      008FC8 CD 85 B4         [ 4] 2761         CALL RFROM 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



      008FCB CD 86 CE         [ 4] 2762         CALL BASE 
      008FCE CD 85 51         [ 4] 2763         CALL STORE 
      008FD1 81               [ 4] 2764         RET 
                                   2765 
                                   2766 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2767 ;       .       ( w -- )
                                   2768 ;       Display an integer in free
                                   2769 ;       format, preceeded by a space.
                                   2770 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000F52                       2771         _HEADER DOT,1,"."
      008FD2 8F B6                    1         .word LINK 
                           000F54     2         LINK=.
      008FD4 01                       3         .byte 1  
      008FD5 2E                       4         .ascii "."
      008FD6                          5         DOT:
      008FD6 CD 86 CE         [ 4] 2772         CALL     BASE
      008FD9 CD 85 63         [ 4] 2773         CALL     AT
      008FDC CD 84 EF         [ 4] 2774         CALL     DOLIT
      008FDF 00 0A                 2775         .word      10
      008FE1 CD 86 8E         [ 4] 2776         CALL     XORR    ;?decimal
      008FE4 CD 85 18         [ 4] 2777         CALL     QBRAN
      008FE7 8F EC                 2778         .word      DOT1
      008FE9 CC 8F A5         [ 2] 2779         JP     UDOT
      008FEC CD 8E 2E         [ 4] 2780 DOT1:   CALL     STR
      008FEF CD 8E ED         [ 4] 2781         CALL     SPACE
      008FF2 CC 8F 17         [ 2] 2782         JP     TYPES
                                   2783 
                                   2784 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2785 ;       ?       ( a -- )
                                   2786 ;       Display contents in memory cell.
                                   2787 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000F75                       2788         _HEADER QUEST,1,"?"
      008FF5 8F D4                    1         .word LINK 
                           000F77     2         LINK=.
      008FF7 01                       3         .byte 1  
      008FF8 3F                       4         .ascii "?"
      008FF9                          5         QUEST:
      008FF9 CD 85 63         [ 4] 2789         CALL     AT
      008FFC CC 8F D6         [ 2] 2790         JP     DOT
                                   2791 
                                   2792 ;; Parsing
                                   2793 
                                   2794 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2795 ;       parse   ( b u c -- b u delta ; <string> )
                                   2796 ;       Scan string delimited by c.
                                   2797 ;       Return found string and its offset.
                                   2798 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000F7F                       2799         _HEADER PARS,5,"PARS$"
      008FFF 8F F7                    1         .word LINK 
                           000F81     2         LINK=.
      009001 05                       3         .byte 5  
      009002 50 41 52 53 24           4         .ascii "PARS$"
      009007                          5         PARS:
      009007 CD 86 DD         [ 4] 2800         CALL     TEMP
      00900A CD 85 51         [ 4] 2801         CALL     STORE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



      00900D CD 86 30         [ 4] 2802         CALL     OVER
      009010 CD 85 D1         [ 4] 2803         CALL     TOR
      009013 CD 86 08         [ 4] 2804         CALL     DUPP
      009016 CD 85 18         [ 4] 2805         CALL     QBRAN
      009019 90 BF                 2806         .word    PARS8
      00901B CD 8B 58         [ 4] 2807         CALL     ONEM
      00901E CD 86 DD         [ 4] 2808         CALL     TEMP
      009021 CD 85 63         [ 4] 2809         CALL     AT
      009024 CD 8B AA         [ 4] 2810         CALL     BLANK
      009027 CD 88 CE         [ 4] 2811         CALL     EQUAL
      00902A CD 85 18         [ 4] 2812         CALL     QBRAN
      00902D 90 60                 2813         .word      PARS3
      00902F CD 85 D1         [ 4] 2814         CALL     TOR
      009032 CD 8B AA         [ 4] 2815 PARS1:  CALL     BLANK
      009035 CD 86 30         [ 4] 2816         CALL     OVER
      009038 CD 85 81         [ 4] 2817         CALL     CAT     ;skip leading blanks ONLY
      00903B CD 88 A6         [ 4] 2818         CALL     SUBB
      00903E CD 86 3F         [ 4] 2819         CALL     ZLESS
      009041 CD 88 47         [ 4] 2820         CALL     INVER
      009044 CD 85 18         [ 4] 2821         CALL     QBRAN
      009047 90 5D                 2822         .word      PARS2
      009049 CD 8B 4B         [ 4] 2823         CALL     ONEP
      00904C CD 85 03         [ 4] 2824         CALL     DONXT
      00904F 90 32                 2825         .word      PARS1
      009051 CD 85 B4         [ 4] 2826         CALL     RFROM
      009054 CD 85 FE         [ 4] 2827         CALL     DROP
      009057 CD 8B B7         [ 4] 2828         CALL     ZERO
      00905A CC 86 08         [ 2] 2829         JP     DUPP
      00905D CD 85 B4         [ 4] 2830 PARS2:  CALL     RFROM
      009060 CD 86 30         [ 4] 2831 PARS3:  CALL     OVER
      009063 CD 86 18         [ 4] 2832         CALL     SWAPP
      009066 CD 85 D1         [ 4] 2833         CALL     TOR
      009069 CD 86 DD         [ 4] 2834 PARS4:  CALL     TEMP
      00906C CD 85 63         [ 4] 2835         CALL     AT
      00906F CD 86 30         [ 4] 2836         CALL     OVER
      009072 CD 85 81         [ 4] 2837         CALL     CAT
      009075 CD 88 A6         [ 4] 2838         CALL     SUBB    ;scan for delimiter
      009078 CD 86 DD         [ 4] 2839         CALL     TEMP
      00907B CD 85 63         [ 4] 2840         CALL     AT
      00907E CD 8B AA         [ 4] 2841         CALL     BLANK
      009081 CD 88 CE         [ 4] 2842         CALL     EQUAL
      009084 CD 85 18         [ 4] 2843         CALL     QBRAN
      009087 90 8C                 2844         .word      PARS5
      009089 CD 86 3F         [ 4] 2845         CALL     ZLESS
      00908C CD 85 18         [ 4] 2846 PARS5:  CALL     QBRAN
      00908F 90 A1                 2847         .word      PARS6
      009091 CD 8B 4B         [ 4] 2848         CALL     ONEP
      009094 CD 85 03         [ 4] 2849         CALL     DONXT
      009097 90 69                 2850         .word      PARS4
      009099 CD 86 08         [ 4] 2851         CALL     DUPP
      00909C CD 85 D1         [ 4] 2852         CALL     TOR
      00909F 20 0F            [ 2] 2853         JRA     PARS7
      0090A1 CD 85 B4         [ 4] 2854 PARS6:  CALL     RFROM
      0090A4 CD 85 FE         [ 4] 2855         CALL     DROP
      0090A7 CD 86 08         [ 4] 2856         CALL     DUPP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



      0090AA CD 8B 4B         [ 4] 2857         CALL     ONEP
      0090AD CD 85 D1         [ 4] 2858         CALL     TOR
      0090B0 CD 86 30         [ 4] 2859 PARS7:  CALL     OVER
      0090B3 CD 88 A6         [ 4] 2860         CALL     SUBB
      0090B6 CD 85 B4         [ 4] 2861         CALL     RFROM
      0090B9 CD 85 B4         [ 4] 2862         CALL     RFROM
      0090BC CC 88 A6         [ 2] 2863         JP     SUBB
      0090BF CD 86 30         [ 4] 2864 PARS8:  CALL     OVER
      0090C2 CD 85 B4         [ 4] 2865         CALL     RFROM
      0090C5 CC 88 A6         [ 2] 2866         JP     SUBB
                                   2867 
                                   2868 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2869 ;       PARSE   ( c -- b u ; <string> )
                                   2870 ;       Scan input stream and return
                                   2871 ;       counted string delimited by c.
                                   2872 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001048                       2873         _HEADER PARSE,5,"PARSE"
      0090C8 90 01                    1         .word LINK 
                           00104A     2         LINK=.
      0090CA 05                       3         .byte 5  
      0090CB 50 41 52 53 45           4         .ascii "PARSE"
      0090D0                          5         PARSE:
      0090D0 CD 85 D1         [ 4] 2874         CALL     TOR
      0090D3 CD 8C B6         [ 4] 2875         CALL     TIB
      0090D6 CD 86 EC         [ 4] 2876         CALL     INN
      0090D9 CD 85 63         [ 4] 2877         CALL     AT
      0090DC CD 88 2D         [ 4] 2878         CALL     PLUS    ;current input buffer pointer
      0090DF CD 86 FC         [ 4] 2879         CALL     NTIB
      0090E2 CD 85 63         [ 4] 2880         CALL     AT
      0090E5 CD 86 EC         [ 4] 2881         CALL     INN
      0090E8 CD 85 63         [ 4] 2882         CALL     AT
      0090EB CD 88 A6         [ 4] 2883         CALL     SUBB    ;remaining count
      0090EE CD 85 B4         [ 4] 2884         CALL     RFROM
      0090F1 CD 90 07         [ 4] 2885         CALL     PARS
      0090F4 CD 86 EC         [ 4] 2886         CALL     INN
      0090F7 CC 8C 27         [ 2] 2887         JP     PSTOR
                                   2888 
                                   2889 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2890 ;       .(      ( -- )
                                   2891 ;       Output following string up to next ) .
                                   2892 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00107A                       2893         _HEADER DOTPR,IMEDD+2,".("
      0090FA 90 CA                    1         .word LINK 
                           00107C     2         LINK=.
      0090FC 82                       3         .byte IMEDD+2  
      0090FD 2E 28                    4         .ascii ".("
      0090FF                          5         DOTPR:
      0090FF CD 84 EF         [ 4] 2894         CALL     DOLIT
      009102 00 29                 2895         .word     41	; ")"
      009104 CD 90 D0         [ 4] 2896         CALL     PARSE
      009107 CC 8F 17         [ 2] 2897         JP     TYPES
                                   2898 
                                   2899 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2900 ;       (       ( -- )
                                   2901 ;       Ignore following string up to next ).
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



                                   2902 ;       A comment.
                                   2903 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00108A                       2904         _HEADER PAREN,IMEDD+1,"("
      00910A 90 FC                    1         .word LINK 
                           00108C     2         LINK=.
      00910C 81                       3         .byte IMEDD+1  
      00910D 28                       4         .ascii "("
      00910E                          5         PAREN:
      00910E CD 84 EF         [ 4] 2905         CALL     DOLIT
      009111 00 29                 2906         .word     41	; ")"
      009113 CD 90 D0         [ 4] 2907         CALL     PARSE
      009116 CC 88 0D         [ 2] 2908         JP     DDROP
                                   2909 
                                   2910 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2911 ;       \       ( -- )
                                   2912 ;       Ignore following text till
                                   2913 ;       end of line.
                                   2914 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001099                       2915         _HEADER BKSLA,IMEDD+1,"\\"
      009119 91 0C                    1         .word LINK 
                           00109B     2         LINK=.
      00911B 81                       3         .byte IMEDD+1  
      00911C 5C 5C                    4         .ascii "\\"
      00911E                          5         BKSLA:
      00911E 90 AE 00 0E      [ 2] 2916         ldw y,#UCTIB ; #TIB  
      009122 90 FE            [ 2] 2917         ldw y,(y)
      009124 90 89            [ 2] 2918         pushw y ; count in TIB 
      009126 90 AE 00 0C      [ 2] 2919         ldw y,#UINN ; >IN 
      00912A 90 BF 26         [ 2] 2920         ldw YTEMP,y
      00912D 90 85            [ 2] 2921         popw y 
      00912F 91 CF 26         [ 5] 2922         ldw [YTEMP],y
      009132 81               [ 4] 2923         ret 
                                   2924 
                                   2925 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2926 ;       WORD    ( c -- a ; <string> )
                                   2927 ;       Parse a word from input stream
                                   2928 ;       and copy it to code dictionary.
                                   2929 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0010B3                       2930         _HEADER WORDD,4,"WORD"
      009133 91 1B                    1         .word LINK 
                           0010B5     2         LINK=.
      009135 04                       3         .byte 4  
      009136 57 4F 52 44              4         .ascii "WORD"
      00913A                          5         WORDD:
      00913A CD 90 D0         [ 4] 2931         CALL     PARSE
      00913D CD 8C 94         [ 4] 2932         CALL     HERE
      009140 CD 8B 20         [ 4] 2933         CALL     CELLP
                           000000  2934 .IF CASE_SENSE 
                                   2935         JP      PACKS 
                           000001  2936 .ELSE                 
      009143 CD 8D 54         [ 4] 2937         CALL     PACKS
                                   2938 ; uppercase TOKEN 
      009146 CD 86 08         [ 4] 2939         CALL    DUPP 
      009149 CD 8C 7D         [ 4] 2940         CALL    COUNT 
      00914C CD 85 D1         [ 4] 2941         CALL    TOR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



      00914F CD 85 34         [ 4] 2942         CALL    BRAN 
      009152 91 80                 2943         .word   UPPER2  
      009154                       2944 UPPER:
      009154 CD 86 08         [ 4] 2945         CALL    DUPP 
      009157 CD 85 81         [ 4] 2946         CALL    CAT
      00915A CD 86 08         [ 4] 2947         CALL    DUPP 
      00915D CD 84 EF         [ 4] 2948         CALL   DOLIT
      009160 00 61                 2949         .word   'a' 
      009162 CD 84 EF         [ 4] 2950         CALL    DOLIT
      009165 00 7B                 2951         .word   'z'+1 
      009167 CD 89 A6         [ 4] 2952         CALL   WITHI 
      00916A CD 85 18         [ 4] 2953         CALL   QBRAN
      00916D 91 77                 2954         .word  UPPER1  
      00916F CD 84 EF         [ 4] 2955         CALL    DOLIT 
      009172 00 DF                 2956         .word   0xDF 
      009174 CD 86 65         [ 4] 2957         CALL    ANDD 
      009177                       2958 UPPER1:
      009177 CD 86 30         [ 4] 2959         CALL    OVER 
      00917A CD 85 70         [ 4] 2960         CALL    CSTOR          
      00917D CD 8B 4B         [ 4] 2961         CALL    ONEP 
      009180                       2962 UPPER2: 
      009180 CD 85 03         [ 4] 2963         CALL    DONXT
      009183 91 54                 2964         .word   UPPER  
      009185 CD 85 FE         [ 4] 2965         CALL    DROP  
      009188 81               [ 4] 2966         RET 
                                   2967 .ENDIF 
                                   2968 
                                   2969 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2970 ;       TOKEN   ( -- a ; <string> )
                                   2971 ;       Parse a word from input stream
                                   2972 ;       and copy it to name dictionary.
                                   2973 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001109                       2974         _HEADER TOKEN,5,"TOKEN"
      009189 91 35                    1         .word LINK 
                           00110B     2         LINK=.
      00918B 05                       3         .byte 5  
      00918C 54 4F 4B 45 4E           4         .ascii "TOKEN"
      009191                          5         TOKEN:
      009191 CD 8B AA         [ 4] 2975         CALL     BLANK
      009194 CC 91 3A         [ 2] 2976         JP     WORDD
                                   2977 
                                   2978 ;; Dictionary search
                                   2979 
                                   2980 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2981 ;       NAME>   ( na -- ca )
                                   2982 ;       Return a code address given
                                   2983 ;       a name address.
                                   2984 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001117                       2985         _HEADER NAMET,5,"NAME>"
      009197 91 8B                    1         .word LINK 
                           001119     2         LINK=.
      009199 05                       3         .byte 5  
      00919A 4E 41 4D 45 3E           4         .ascii "NAME>"
      00919F                          5         NAMET:
      00919F CD 8C 7D         [ 4] 2986         CALL     COUNT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



      0091A2 CD 84 EF         [ 4] 2987         CALL     DOLIT
      0091A5 00 1F                 2988         .word      31
      0091A7 CD 86 65         [ 4] 2989         CALL     ANDD
      0091AA CC 88 2D         [ 2] 2990         JP     PLUS
                                   2991 
                                   2992 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2993 ;       SAME?   ( a a u -- a a f \ -0+ )
                                   2994 ;       Compare u cells in two
                                   2995 ;       strings. Return 0 if identical.
                                   2996 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00112D                       2997         _HEADER SAMEQ,5,"SAME?"
      0091AD 91 99                    1         .word LINK 
                           00112F     2         LINK=.
      0091AF 05                       3         .byte 5  
      0091B0 53 41 4D 45 3F           4         .ascii "SAME?"
      0091B5                          5         SAMEQ:
      0091B5 CD 8B 58         [ 4] 2998         CALL     ONEM
      0091B8 CD 85 D1         [ 4] 2999         CALL     TOR
      0091BB 20 29            [ 2] 3000         JRA     SAME2
      0091BD CD 86 30         [ 4] 3001 SAME1:  CALL     OVER
      0091C0 CD 85 C5         [ 4] 3002         CALL     RAT
      0091C3 CD 88 2D         [ 4] 3003         CALL     PLUS
      0091C6 CD 85 81         [ 4] 3004         CALL     CAT
      0091C9 CD 86 30         [ 4] 3005         CALL     OVER
      0091CC CD 85 C5         [ 4] 3006         CALL     RAT
      0091CF CD 88 2D         [ 4] 3007         CALL     PLUS
      0091D2 CD 85 81         [ 4] 3008         CALL     CAT
      0091D5 CD 88 A6         [ 4] 3009         CALL     SUBB
      0091D8 CD 87 BB         [ 4] 3010         CALL     QDUP
      0091DB CD 85 18         [ 4] 3011         CALL     QBRAN
      0091DE 91 E6                 3012         .word      SAME2
      0091E0 CD 85 B4         [ 4] 3013         CALL     RFROM
      0091E3 CC 85 FE         [ 2] 3014         JP     DROP
      0091E6 CD 85 03         [ 4] 3015 SAME2:  CALL     DONXT
      0091E9 91 BD                 3016         .word      SAME1
      0091EB CC 8B B7         [ 2] 3017         JP     ZERO
                                   3018 
                                   3019 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3020 ;       find    ( a va -- ca na | a F )
                                   3021 ;       Search vocabulary for string.
                                   3022 ;       Return ca and na if succeeded.
                                   3023 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00116E                       3024         _HEADER FIND,4,"FIND"
      0091EE 91 AF                    1         .word LINK 
                           001170     2         LINK=.
      0091F0 04                       3         .byte 4  
      0091F1 46 49 4E 44              4         .ascii "FIND"
      0091F5                          5         FIND:
      0091F5 CD 86 18         [ 4] 3025         CALL     SWAPP
      0091F8 CD 86 08         [ 4] 3026         CALL     DUPP
      0091FB CD 85 81         [ 4] 3027         CALL     CAT
      0091FE CD 86 DD         [ 4] 3028         CALL     TEMP
      009201 CD 85 51         [ 4] 3029         CALL     STORE
      009204 CD 86 08         [ 4] 3030         CALL     DUPP
      009207 CD 85 63         [ 4] 3031         CALL     AT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



      00920A CD 85 D1         [ 4] 3032         CALL     TOR
      00920D CD 8B 20         [ 4] 3033         CALL     CELLP
      009210 CD 86 18         [ 4] 3034         CALL     SWAPP
      009213 CD 85 63         [ 4] 3035 FIND1:  CALL     AT
      009216 CD 86 08         [ 4] 3036         CALL     DUPP
      009219 CD 85 18         [ 4] 3037         CALL     QBRAN
      00921C 92 52                 3038         .word      FIND6
      00921E CD 86 08         [ 4] 3039         CALL     DUPP
      009221 CD 85 63         [ 4] 3040         CALL     AT
      009224 CD 84 EF         [ 4] 3041         CALL     DOLIT
      009227 1F 7F                 3042         .word      MASKK
      009229 CD 86 65         [ 4] 3043         CALL     ANDD
      00922C CD 85 C5         [ 4] 3044         CALL     RAT
      00922F CD 86 8E         [ 4] 3045         CALL     XORR
      009232 CD 85 18         [ 4] 3046         CALL     QBRAN
      009235 92 41                 3047         .word      FIND2
      009237 CD 8B 20         [ 4] 3048         CALL     CELLP
      00923A CD 84 EF         [ 4] 3049         CALL     DOLIT
      00923D FF FF                 3050         .word     0xFFFF
      00923F 20 0C            [ 2] 3051         JRA     FIND3
      009241 CD 8B 20         [ 4] 3052 FIND2:  CALL     CELLP
      009244 CD 86 DD         [ 4] 3053         CALL     TEMP
      009247 CD 85 63         [ 4] 3054         CALL     AT
      00924A CD 91 B5         [ 4] 3055         CALL     SAMEQ
      00924D CD 85 34         [ 4] 3056 FIND3:  CALL     BRAN
      009250 92 61                 3057         .word      FIND4
      009252 CD 85 B4         [ 4] 3058 FIND6:  CALL     RFROM
      009255 CD 85 FE         [ 4] 3059         CALL     DROP
      009258 CD 86 18         [ 4] 3060         CALL     SWAPP
      00925B CD 8B 2F         [ 4] 3061         CALL     CELLM
      00925E CC 86 18         [ 2] 3062         JP     SWAPP
      009261 CD 85 18         [ 4] 3063 FIND4:  CALL     QBRAN
      009264 92 6E                 3064         .word      FIND5
      009266 CD 8B 2F         [ 4] 3065         CALL     CELLM
      009269 CD 8B 2F         [ 4] 3066         CALL     CELLM
      00926C 20 A5            [ 2] 3067         JRA     FIND1
      00926E CD 85 B4         [ 4] 3068 FIND5:  CALL     RFROM
      009271 CD 85 FE         [ 4] 3069         CALL     DROP
      009274 CD 86 18         [ 4] 3070         CALL     SWAPP
      009277 CD 85 FE         [ 4] 3071         CALL     DROP
      00927A CD 8B 2F         [ 4] 3072         CALL     CELLM
      00927D CD 86 08         [ 4] 3073         CALL     DUPP
      009280 CD 91 9F         [ 4] 3074         CALL     NAMET
      009283 CC 86 18         [ 2] 3075         JP     SWAPP
                                   3076 
                                   3077 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3078 ;       NAME?   ( a -- ca na | a F )
                                   3079 ;       Search vocabularies for a string.
                                   3080 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001206                       3081         _HEADER NAMEQ,5,"NAME?"
      009286 91 F0                    1         .word LINK 
                           001208     2         LINK=.
      009288 05                       3         .byte 5  
      009289 4E 41 4D 45 3F           4         .ascii "NAME?"
      00928E                          5         NAMEQ:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



      00928E CD 87 51         [ 4] 3082         CALL   CNTXT
      009291 CC 91 F5         [ 2] 3083         JP     FIND
                                   3084 
                                   3085 ;; Terminal response
                                   3086 
                                   3087 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3088 ;       ^H      ( bot eot cur -- bot eot cur )
                                   3089 ;       Backup cursor by one character.
                                   3090 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001214                       3091         _HEADER BKSP,2,"^H"
      009294 92 88                    1         .word LINK 
                           001216     2         LINK=.
      009296 02                       3         .byte 2  
      009297 5E 48                    4         .ascii "^H"
      009299                          5         BKSP:
      009299 CD 85 D1         [ 4] 3092         CALL     TOR
      00929C CD 86 30         [ 4] 3093         CALL     OVER
      00929F CD 85 B4         [ 4] 3094         CALL     RFROM
      0092A2 CD 86 18         [ 4] 3095         CALL     SWAPP
      0092A5 CD 86 30         [ 4] 3096         CALL     OVER
      0092A8 CD 86 8E         [ 4] 3097         CALL     XORR
      0092AB CD 85 18         [ 4] 3098         CALL     QBRAN
      0092AE 92 C9                 3099         .word      BACK1
      0092B0 CD 84 EF         [ 4] 3100         CALL     DOLIT
      0092B3 00 08                 3101         .word      BKSPP
      0092B5 CD 84 B6         [ 4] 3102         CALL     EMIT
      0092B8 CD 8B 58         [ 4] 3103         CALL     ONEM
      0092BB CD 8B AA         [ 4] 3104         CALL     BLANK
      0092BE CD 84 B6         [ 4] 3105         CALL     EMIT
      0092C1 CD 84 EF         [ 4] 3106         CALL     DOLIT
      0092C4 00 08                 3107         .word      BKSPP
      0092C6 CC 84 B6         [ 2] 3108         JP     EMIT
      0092C9 81               [ 4] 3109 BACK1:  RET
                                   3110 
                                   3111 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3112 ;       TAP    ( bot eot cur c -- bot eot cur )
                                   3113 ;       Accept and echo key stroke
                                   3114 ;       and bump cursor.
                                   3115 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00124A                       3116         _HEADER TAP,3,"TAP"
      0092CA 92 96                    1         .word LINK 
                           00124C     2         LINK=.
      0092CC 03                       3         .byte 3  
      0092CD 54 41 50                 4         .ascii "TAP"
      0092D0                          5         TAP:
      0092D0 CD 86 08         [ 4] 3117         CALL     DUPP
      0092D3 CD 84 B6         [ 4] 3118         CALL     EMIT
      0092D6 CD 86 30         [ 4] 3119         CALL     OVER
      0092D9 CD 85 70         [ 4] 3120         CALL     CSTOR
      0092DC CC 8B 4B         [ 2] 3121         JP     ONEP
                                   3122 
                                   3123 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3124 ;       kTAP    ( bot eot cur c -- bot eot cur )
                                   3125 ;       Process a key stroke,
                                   3126 ;       CR,LF or backspace.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



                                   3127 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00125F                       3128         _HEADER KTAP,4,"KTAP"
      0092DF 92 CC                    1         .word LINK 
                           001261     2         LINK=.
      0092E1 04                       3         .byte 4  
      0092E2 4B 54 41 50              4         .ascii "KTAP"
      0092E6                          5         KTAP:
      0092E6 CD 86 08         [ 4] 3129         CALL     DUPP
      0092E9 CD 84 EF         [ 4] 3130         CALL     DOLIT
                           000001  3131 .if EOL_CR
      0092EC 00 0D                 3132         .word   CRR
                           000000  3133 .else ; EOL_LF 
                                   3134         .word   LF
                                   3135 .endif 
      0092EE CD 86 8E         [ 4] 3136         CALL     XORR
      0092F1 CD 85 18         [ 4] 3137         CALL     QBRAN
      0092F4 93 0C                 3138         .word      KTAP2
      0092F6 CD 84 EF         [ 4] 3139         CALL     DOLIT
      0092F9 00 08                 3140         .word      BKSPP
      0092FB CD 86 8E         [ 4] 3141         CALL     XORR
      0092FE CD 85 18         [ 4] 3142         CALL     QBRAN
      009301 93 09                 3143         .word      KTAP1
      009303 CD 8B AA         [ 4] 3144         CALL     BLANK
      009306 CC 92 D0         [ 2] 3145         JP     TAP
      009309 CC 92 99         [ 2] 3146 KTAP1:  JP     BKSP
      00930C CD 85 FE         [ 4] 3147 KTAP2:  CALL     DROP
      00930F CD 86 18         [ 4] 3148         CALL     SWAPP
      009312 CD 85 FE         [ 4] 3149         CALL     DROP
      009315 CC 86 08         [ 2] 3150         JP     DUPP
                                   3151 
                                   3152 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3153 ;       accept  ( b u -- b u )
                                   3154 ;       Accept characters to input
                                   3155 ;       buffer. Return with actual count.
                                   3156 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001298                       3157         _HEADER ACCEP,6,"ACCEPT"
      009318 92 E1                    1         .word LINK 
                           00129A     2         LINK=.
      00931A 06                       3         .byte 6  
      00931B 41 43 43 45 50 54        4         .ascii "ACCEPT"
      009321                          5         ACCEP:
      009321 CD 86 30         [ 4] 3158         CALL     OVER
      009324 CD 88 2D         [ 4] 3159         CALL     PLUS
      009327 CD 86 30         [ 4] 3160         CALL     OVER
      00932A CD 88 18         [ 4] 3161 ACCP1:  CALL     DDUP
      00932D CD 86 8E         [ 4] 3162         CALL     XORR
      009330 CD 85 18         [ 4] 3163         CALL     QBRAN
      009333 93 55                 3164         .word      ACCP4
      009335 CD 8E B5         [ 4] 3165         CALL     KEY
      009338 CD 86 08         [ 4] 3166         CALL     DUPP
      00933B CD 8B AA         [ 4] 3167         CALL     BLANK
      00933E CD 84 EF         [ 4] 3168         CALL     DOLIT
      009341 00 7F                 3169         .word      127
      009343 CD 89 A6         [ 4] 3170         CALL     WITHI
      009346 CD 85 18         [ 4] 3171         CALL     QBRAN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



      009349 93 50                 3172         .word      ACCP2
      00934B CD 92 D0         [ 4] 3173         CALL     TAP
      00934E 20 03            [ 2] 3174         JRA     ACCP3
      009350 CD 92 E6         [ 4] 3175 ACCP2:  CALL     KTAP
      009353 20 D5            [ 2] 3176 ACCP3:  JRA     ACCP1
      009355 CD 85 FE         [ 4] 3177 ACCP4:  CALL     DROP
      009358 CD 86 30         [ 4] 3178         CALL     OVER
      00935B CC 88 A6         [ 2] 3179         JP     SUBB
                                   3180 
                                   3181 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3182 ;       QUERY   ( -- )
                                   3183 ;       Accept input stream to
                                   3184 ;       terminal input buffer.
                                   3185 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0012DE                       3186         _HEADER QUERY,5,"QUERY"
      00935E 93 1A                    1         .word LINK 
                           0012E0     2         LINK=.
      009360 05                       3         .byte 5  
      009361 51 55 45 52 59           4         .ascii "QUERY"
      009366                          5         QUERY:
      009366 CD 8C B6         [ 4] 3187         CALL     TIB
      009369 CD 84 EF         [ 4] 3188         CALL     DOLIT
      00936C 00 50                 3189         .word      80
      00936E CD 93 21         [ 4] 3190         CALL     ACCEP
      009371 CD 86 FC         [ 4] 3191         CALL     NTIB
      009374 CD 85 51         [ 4] 3192         CALL     STORE
      009377 CD 85 FE         [ 4] 3193         CALL     DROP
      00937A CD 8B B7         [ 4] 3194         CALL     ZERO
      00937D CD 86 EC         [ 4] 3195         CALL     INN
      009380 CC 85 51         [ 2] 3196         JP     STORE
                                   3197 
                                   3198 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3199 ;       ABORT   ( -- )
                                   3200 ;       Reset data stack and
                                   3201 ;       jump to QUIT.
                                   3202 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001303                       3203         _HEADER ABORT,5,"ABORT"
      009383 93 60                    1         .word LINK 
                           001305     2         LINK=.
      009385 05                       3         .byte 5  
      009386 41 42 4F 52 54           4         .ascii "ABORT"
      00938B                          5         ABORT:
      00938B CD 94 82         [ 4] 3204         CALL     PRESE
      00938E CC 94 9F         [ 2] 3205         JP     QUIT
                                   3206 
                                   3207 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3208 ;       abort"  ( f -- )
                                   3209 ;       Run time routine of ABORT".
                                   3210 ;       Abort with a message.
                                   3211 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001311                       3212         _HEADER ABORQ,COMPO+6,'ABORT"'
      009391 93 85                    1         .word LINK 
                           001313     2         LINK=.
      009393 46                       3         .byte COMPO+6  
      009394 41 42 4F 52 54 22        4         .ascii 'ABORT"'
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



      00939A                          5         ABORQ:
      00939A CD 85 18         [ 4] 3213         CALL     QBRAN
      00939D 93 B9                 3214         .word      ABOR2   ;text flag
      00939F CD 8F 3F         [ 4] 3215         CALL     DOSTR
      0093A2 CD 8E ED         [ 4] 3216 ABOR1:  CALL     SPACE
      0093A5 CD 8C 7D         [ 4] 3217         CALL     COUNT
      0093A8 CD 8F 17         [ 4] 3218         CALL     TYPES
      0093AB CD 84 EF         [ 4] 3219         CALL     DOLIT
      0093AE 00 3F                 3220         .word     63 ; "?"
      0093B0 CD 84 B6         [ 4] 3221         CALL     EMIT
      0093B3 CD 8F 2F         [ 4] 3222         CALL     CR
      0093B6 CC 93 8B         [ 2] 3223         JP     ABORT   ;pass error string
      0093B9 CD 8F 3F         [ 4] 3224 ABOR2:  CALL     DOSTR
      0093BC CC 85 FE         [ 2] 3225         JP     DROP
                                   3226 
                                   3227 ;; The text interpreter
                                   3228 
                                   3229 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3230 ;       $INTERPRET      ( a -- )
                                   3231 ;       Interpret a word. If failed,
                                   3232 ;       try to convert it to an integer.
                                   3233 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00133F                       3234         _HEADER INTER,10,"$INTERPRET"
      0093BF 93 93                    1         .word LINK 
                           001341     2         LINK=.
      0093C1 0A                       3         .byte 10  
      0093C2 24 49 4E 54 45 52 50     4         .ascii "$INTERPRET"
             52 45 54
      0093CC                          5         INTER:
      0093CC CD 92 8E         [ 4] 3235         CALL     NAMEQ
      0093CF CD 87 BB         [ 4] 3236         CALL     QDUP    ;?defined
      0093D2 CD 85 18         [ 4] 3237         CALL     QBRAN
      0093D5 93 F6                 3238         .word      INTE1
      0093D7 CD 85 63         [ 4] 3239         CALL     AT
      0093DA CD 84 EF         [ 4] 3240         CALL     DOLIT
      0093DD 40 00                 3241 	.word       0x4000	; COMPO*256
      0093DF CD 86 65         [ 4] 3242         CALL     ANDD    ;?compile only lexicon bits
      0093E2 CD 93 9A         [ 4] 3243         CALL     ABORQ
      0093E5 0D                    3244         .byte      13
      0093E6 20 63 6F 6D 70 69 6C  3245         .ascii     " compile only"
             65 20 6F 6E 6C 79
      0093F3 CC 85 44         [ 2] 3246         JP     EXECU
      0093F6 CD A4 A1         [ 4] 3247 INTE1:  CALL     NUMBQ   ;convert a number
      0093F9 CD 85 18         [ 4] 3248         CALL     QBRAN
      0093FC 93 A2                 3249         .word    ABOR1
      0093FE 81               [ 4] 3250         RET
                                   3251 
                                   3252 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3253 ;       [       ( -- )
                                   3254 ;       Start  text interpreter.
                                   3255 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00137F                       3256         _HEADER LBRAC,IMEDD+1,"["
      0093FF 93 C1                    1         .word LINK 
                           001381     2         LINK=.
      009401 81                       3         .byte IMEDD+1  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



      009402 5B                       4         .ascii "["
      009403                          5         LBRAC:
      009403 CD 84 EF         [ 4] 3257         CALL   DOLIT
      009406 93 CC                 3258         .word  INTER
      009408 CD 87 2F         [ 4] 3259         CALL   TEVAL
      00940B CC 85 51         [ 2] 3260         JP     STORE
                                   3261 
                                   3262 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3263 ;       .OK     ( -- )
                                   3264 ;       Display 'ok' while interpreting.
                                   3265 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00138E                       3266         _HEADER DOTOK,3,".OK"
      00940E 94 01                    1         .word LINK 
                           001390     2         LINK=.
      009410 03                       3         .byte 3  
      009411 2E 4F 4B                 4         .ascii ".OK"
      009414                          5         DOTOK:
      009414 CD 84 EF         [ 4] 3267         CALL     DOLIT
      009417 93 CC                 3268         .word      INTER
      009419 CD 87 2F         [ 4] 3269         CALL     TEVAL
      00941C CD 85 63         [ 4] 3270         CALL     AT
      00941F CD 88 CE         [ 4] 3271         CALL     EQUAL
      009422 CD 85 18         [ 4] 3272         CALL     QBRAN
      009425 94 2E                 3273         .word      DOTO1
      009427 CD 8F 5C         [ 4] 3274         CALL     DOTQP
      00942A 03                    3275         .byte      3
      00942B 20 6F 6B              3276         .ascii     " ok"
      00942E CC 8F 2F         [ 2] 3277 DOTO1:  JP     CR
                                   3278 
                                   3279 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3280 ;       ?STACK  ( -- )
                                   3281 ;       Abort if stack underflows.
                                   3282 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0013B1                       3283         _HEADER QSTAC,6,"?STACK"
      009431 94 10                    1         .word LINK 
                           0013B3     2         LINK=.
      009433 06                       3         .byte 6  
      009434 3F 53 54 41 43 4B        4         .ascii "?STACK"
      00943A                          5         QSTAC:
      00943A CD 8B F9         [ 4] 3284         CALL     DEPTH
      00943D CD 86 3F         [ 4] 3285         CALL     ZLESS   ;check only for underflow
      009440 CD 93 9A         [ 4] 3286         CALL     ABORQ
      009443 0B                    3287         .byte      11
      009444 20 75 6E 64 65 72 66  3288         .ascii     " underflow "
             6C 6F 77 20
      00944F 81               [ 4] 3289         RET
                                   3290 
                                   3291 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3292 ;       EVAL    ( -- )
                                   3293 ;       Interpret  input stream.
                                   3294 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0013D0                       3295         _HEADER EVAL,4,"EVAL"
      009450 94 33                    1         .word LINK 
                           0013D2     2         LINK=.
      009452 04                       3         .byte 4  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



      009453 45 56 41 4C              4         .ascii "EVAL"
      009457                          5         EVAL:
      009457 CD 91 91         [ 4] 3296 EVAL1:  CALL     TOKEN
      00945A CD 86 08         [ 4] 3297         CALL     DUPP
      00945D CD 85 81         [ 4] 3298         CALL     CAT     ;?input stream empty
      009460 CD 85 18         [ 4] 3299         CALL     QBRAN
      009463 94 73                 3300         .word    EVAL2
      009465 CD 87 2F         [ 4] 3301         CALL     TEVAL
      009468 CD 8C CA         [ 4] 3302         CALL     ATEXE
      00946B CD 94 3A         [ 4] 3303         CALL     QSTAC   ;evaluate input, check stack
      00946E CD 85 34         [ 4] 3304         CALL     BRAN
      009471 94 57                 3305         .word    EVAL1
      009473 CD 85 FE         [ 4] 3306 EVAL2:  CALL     DROP
      009476 CC 94 14         [ 2] 3307         JP       DOTOK
                                   3308 
                                   3309 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3310 ;       PRESET  ( -- )
                                   3311 ;       Reset data stack pointer and
                                   3312 ;       terminal input buffer.
                                   3313 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0013F9                       3314         _HEADER PRESE,6,"PRESET"
      009479 94 52                    1         .word LINK 
                           0013FB     2         LINK=.
      00947B 06                       3         .byte 6  
      00947C 50 52 45 53 45 54        4         .ascii "PRESET"
      009482                          5         PRESE:
      009482 CD 84 EF         [ 4] 3315         CALL     DOLIT
      009485 16 80                 3316         .word      SPP
      009487 CD 85 F5         [ 4] 3317         CALL     SPSTO
      00948A CD 84 EF         [ 4] 3318         CALL     DOLIT
      00948D 17 00                 3319         .word      TIBB
      00948F CD 86 FC         [ 4] 3320         CALL     NTIB
      009492 CD 8B 20         [ 4] 3321         CALL     CELLP
      009495 CC 85 51         [ 2] 3322         JP     STORE
                                   3323 
                                   3324 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3325 ;       QUIT    ( -- )
                                   3326 ;       Reset return stack pointer
                                   3327 ;       and start text interpreter.
                                   3328 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001418                       3329         _HEADER QUIT,4,"QUIT"
      009498 94 7B                    1         .word LINK 
                           00141A     2         LINK=.
      00949A 04                       3         .byte 4  
      00949B 51 55 49 54              4         .ascii "QUIT"
      00949F                          5         QUIT:
      00949F CD 84 EF         [ 4] 3330         CALL     DOLIT
      0094A2 17 FF                 3331         .word      RPP
      0094A4 CD 85 9E         [ 4] 3332         CALL     RPSTO   ;reset return stack pointer
      0094A7 CD 94 03         [ 4] 3333 QUIT1:  CALL     LBRAC   ;start interpretation
      0094AA CD 93 66         [ 4] 3334 QUIT2:  CALL     QUERY   ;get input
      0094AD CD 94 57         [ 4] 3335         CALL     EVAL
      0094B0 20 F8            [ 2] 3336         JRA     QUIT2   ;continue till error
                                   3337 
                                   3338 ;; The compiler
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



                                   3339 
                                   3340 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3341 ;       '       ( -- ca )
                                   3342 ;       Search vocabularies for
                                   3343 ;       next word in input stream.
                                   3344 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001432                       3345         _HEADER TICK,1,"'"
      0094B2 94 9A                    1         .word LINK 
                           001434     2         LINK=.
      0094B4 01                       3         .byte 1  
      0094B5 27                       4         .ascii "'"
      0094B6                          5         TICK:
      0094B6 CD 91 91         [ 4] 3346         CALL     TOKEN
      0094B9 CD 92 8E         [ 4] 3347         CALL     NAMEQ   ;?defined
      0094BC CD 85 18         [ 4] 3348         CALL     QBRAN
      0094BF 93 A2                 3349         .word      ABOR1
      0094C1 81               [ 4] 3350         RET     ;yes, push code address
                                   3351 
                                   3352 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3353 ;       ALLOT   ( n -- )
                                   3354 ;       Allocate n bytes to RAM 
                                   3355 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001442                       3356         _HEADER ALLOT,5,"ALLOT"
      0094C2 94 B4                    1         .word LINK 
                           001444     2         LINK=.
      0094C4 05                       3         .byte 5  
      0094C5 41 4C 4C 4F 54           4         .ascii "ALLOT"
      0094CA                          5         ALLOT:
      0094CA CD 87 5F         [ 4] 3357         CALL     VPP
                                   3358 ; must update APP_VP each time VP is modidied
      0094CD CD 8C 27         [ 4] 3359         call PSTOR 
      0094D0 CC 9C 1E         [ 2] 3360         jp UPDATVP 
                                   3361 
                                   3362 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3363 ;       ,       ( w -- )
                                   3364 ;         Compile an integer into
                                   3365 ;         variable space.
                                   3366 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3367 ;        _HEADER COMMA,1,'\,'
      0094D3 94 C4                 3368         .word      LINK
                           001455  3369 LINK = . 
      0094D5 01                    3370         .byte      1
      0094D6 2C                    3371         .ascii     ","
      0094D7                       3372 COMMA:
      0094D7 CD 8C 94         [ 4] 3373         CALL     HERE
      0094DA CD 86 08         [ 4] 3374         CALL     DUPP
      0094DD CD 8B 20         [ 4] 3375         CALL     CELLP   ;cell boundary
      0094E0 CD 87 5F         [ 4] 3376         CALL     VPP
      0094E3 CD 85 51         [ 4] 3377         CALL     STORE
      0094E6 CC 85 51         [ 2] 3378         JP     STORE
                                   3379 
                                   3380 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3381 ;       C,      ( c -- )
                                   3382 ;       Compile a byte into
                                   3383 ;       variables space.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



                                   3384 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3385 ;        _HEADER CCOMMA,2,"C,"
      0094E9 94 D5                 3386       .word      LINK
                           00146B  3387 LINK = . 
      0094EB 02                    3388         .byte      2
      0094EC 43 2C                 3389         .ascii     "C,"
      0094EE                       3390 CCOMMA:
      0094EE CD 8C 94         [ 4] 3391         CALL     HERE
      0094F1 CD 86 08         [ 4] 3392         CALL     DUPP
      0094F4 CD 8B 4B         [ 4] 3393         CALL     ONEP
      0094F7 CD 87 5F         [ 4] 3394         CALL     VPP
      0094FA CD 85 51         [ 4] 3395         CALL     STORE
      0094FD CC 85 70         [ 2] 3396         JP     CSTOR
                                   3397 
                                   3398 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3399 ;       [COMPILE]       ( -- ; <string> )
                                   3400 ;       Compile next immediate
                                   3401 ;       word into code dictionary.
                                   3402 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001480                       3403         _HEADER BCOMP,IMEDD+9,"[COMPILE]"
      009500 94 EB                    1         .word LINK 
                           001482     2         LINK=.
      009502 89                       3         .byte IMEDD+9  
      009503 5B 43 4F 4D 50 49 4C     4         .ascii "[COMPILE]"
             45 5D
      00950C                          5         BCOMP:
      00950C CD 94 B6         [ 4] 3404         CALL     TICK
      00950F CC 97 ED         [ 2] 3405         JP     JSRC
                                   3406 
                                   3407 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3408 ;       COMPILE ( -- )
                                   3409 ;       Compile next jsr in
                                   3410 ;       colon list to code dictionary.
                                   3411 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001492                       3412         _HEADER COMPI,COMPO+7,"COMPILE"
      009512 95 02                    1         .word LINK 
                           001494     2         LINK=.
      009514 47                       3         .byte COMPO+7  
      009515 43 4F 4D 50 49 4C 45     4         .ascii "COMPILE"
      00951C                          5         COMPI:
      00951C CD 85 B4         [ 4] 3413         CALL     RFROM
      00951F CD 86 08         [ 4] 3414         CALL     DUPP
      009522 CD 85 63         [ 4] 3415         CALL     AT
      009525 CD 97 ED         [ 4] 3416         CALL     JSRC    ;compile subroutine
      009528 CD 8B 20         [ 4] 3417         CALL     CELLP
      00952B 90 93            [ 1] 3418         ldw y,x 
      00952D 90 FE            [ 2] 3419         ldw y,(y)
      00952F 1C 00 02         [ 2] 3420         addw x,#CELLL 
      009532 90 FC            [ 2] 3421         jp (y)
                                   3422 
                                   3423 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3424 ;       LITERAL ( w -- )
                                   3425 ;       Compile tos to dictionary
                                   3426 ;       as an integer literal.
                                   3427 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



      0014B4                       3428         _HEADER LITER,COMPO+IMEDD+7,"LITERAL"
      009534 95 14                    1         .word LINK 
                           0014B6     2         LINK=.
      009536 C7                       3         .byte COMPO+IMEDD+7  
      009537 4C 49 54 45 52 41 4C     4         .ascii "LITERAL"
      00953E                          5         LITER:
      00953E CD 95 1C         [ 4] 3429         CALL     COMPI
      009541 84 EF                 3430         .word DOLIT 
      009543 CC 94 D7         [ 2] 3431         JP     COMMA
                                   3432 
                                   3433 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3434 ;       $,"     ( -- )
                                   3435 ;       Compile a literal string
                                   3436 ;       up to next " .
                                   3437 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3438 ;        _HEADER STRCQ,3,'$,"'
      009546 95 36                 3439         .word      LINK
                           0014C8  3440 LINK = . 
      009548 03                    3441         .byte      3
      009549 24 2C 22              3442         .byte     '$',',','"'
      00954C                       3443 STRCQ:
      00954C CD 84 EF         [ 4] 3444         CALL     DOLIT
      00954F 00 22                 3445         .word     34	; "
      009551 CD 90 D0         [ 4] 3446         CALL     PARSE
      009554 CD 8C 94         [ 4] 3447         CALL     HERE
      009557 CD 8D 54         [ 4] 3448         CALL     PACKS   ;string to code dictionary
      00955A CD 8C 7D         [ 4] 3449         CALL     COUNT
      00955D CD 88 2D         [ 4] 3450         CALL     PLUS    ;calculate aligned end of string
      009560 CD 87 5F         [ 4] 3451         CALL     VPP
      009563 CC 85 51         [ 2] 3452         JP     STORE
                                   3453 
                                   3454 ;; Structures
                                   3455 
                                   3456 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3457 ;       FOR     ( -- a )
                                   3458 ;       Start a FOR-NEXT loop
                                   3459 ;       structure in a colon definition.
                                   3460 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0014E6                       3461         _HEADER FOR,IMEDD+3,"FOR"
      009566 95 48                    1         .word LINK 
                           0014E8     2         LINK=.
      009568 83                       3         .byte IMEDD+3  
      009569 46 4F 52                 4         .ascii "FOR"
      00956C                          5         FOR:
      00956C CD 95 1C         [ 4] 3462         CALL     COMPI
      00956F 85 D1                 3463         .word TOR 
      009571 CC 8C 94         [ 2] 3464         JP     HERE
                                   3465 
                                   3466 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3467 ;       NEXT    ( a -- )
                                   3468 ;       Terminate a FOR-NEXT loop.
                                   3469 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0014F4                       3470         _HEADER NEXT,IMEDD+4,"NEXT"
      009574 95 68                    1         .word LINK 
                           0014F6     2         LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



      009576 84                       3         .byte IMEDD+4  
      009577 4E 45 58 54              4         .ascii "NEXT"
      00957B                          5         NEXT:
      00957B CD 95 1C         [ 4] 3471         CALL     COMPI
      00957E 85 03                 3472         .word DONXT 
      009580 CD 87 AB         [ 4] 3473         call ADRADJ
      009583 CC 94 D7         [ 2] 3474         JP     COMMA
                                   3475 
                                   3476 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3477 ;       I ( -- n )
                                   3478 ;       stack COUNTER
                                   3479 ;       of innermost FOR-NEXT  
                                   3480 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001506                       3481         _HEADER IFETCH,1,"I"
      009586 95 76                    1         .word LINK 
                           001508     2         LINK=.
      009588 01                       3         .byte 1  
      009589 49                       4         .ascii "I"
      00958A                          5         IFETCH:
      00958A 1D 00 02         [ 2] 3482         subw x,#CELLL 
      00958D 16 03            [ 2] 3483         ldw y,(3,sp)
      00958F FF               [ 2] 3484         ldw (x),y 
      009590 81               [ 4] 3485         ret 
                                   3486 
                                   3487 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3488 ;       J ( -- n )
                                   3489 ;   stack COUNTER
                                   3490 ;   of second level FOR-NEXT  
                                   3491 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001511                       3492         _HEADER JFETCH,1,"J"
      009591 95 88                    1         .word LINK 
                           001513     2         LINK=.
      009593 01                       3         .byte 1  
      009594 4A                       4         .ascii "J"
      009595                          5         JFETCH:
      009595 1D 00 02         [ 2] 3493         SUBW X,#CELLL 
      009598 16 05            [ 2] 3494         LDW Y,(5,SP)
      00959A FF               [ 2] 3495         LDW (X),Y 
      00959B 81               [ 4] 3496         RET 
                                   3497 
                                   3498 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3499 ;       BEGIN   ( -- a )
                                   3500 ;       Start an infinite or
                                   3501 ;       indefinite loop structure.
                                   3502 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00151C                       3503         _HEADER BEGIN,IMEDD+5,"BEGIN"
      00959C 95 93                    1         .word LINK 
                           00151E     2         LINK=.
      00959E 85                       3         .byte IMEDD+5  
      00959F 42 45 47 49 4E           4         .ascii "BEGIN"
      0095A4                          5         BEGIN:
      0095A4 CC 8C 94         [ 2] 3504         JP     HERE
                                   3505 
                                   3506 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3507 ;       UNTIL   ( a -- )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



                                   3508 ;       Terminate a BEGIN-UNTIL
                                   3509 ;       indefinite loop structure.
                                   3510 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001527                       3511         _HEADER UNTIL,IMEDD+5,"UNTIL"
      0095A7 95 9E                    1         .word LINK 
                           001529     2         LINK=.
      0095A9 85                       3         .byte IMEDD+5  
      0095AA 55 4E 54 49 4C           4         .ascii "UNTIL"
      0095AF                          5         UNTIL:
      0095AF CD 95 1C         [ 4] 3512         CALL     COMPI
      0095B2 85 18                 3513         .word    QBRAN 
      0095B4 CD 87 AB         [ 4] 3514         call ADRADJ
      0095B7 CC 94 D7         [ 2] 3515         JP     COMMA
                                   3516 
                                   3517 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3518 ;       AGAIN   ( a -- )
                                   3519 ;       Terminate a BEGIN-AGAIN
                                   3520 ;       infinite loop structure.
                                   3521 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00153A                       3522         _HEADER AGAIN,IMEDD+5,"AGAIN"
      0095BA 95 A9                    1         .word LINK 
                           00153C     2         LINK=.
      0095BC 85                       3         .byte IMEDD+5  
      0095BD 41 47 41 49 4E           4         .ascii "AGAIN"
      0095C2                          5         AGAIN:
      0095C2 CD 95 1C         [ 4] 3523         CALL     COMPI
      0095C5 85 34                 3524         .word BRAN
      0095C7 CD 87 AB         [ 4] 3525         call ADRADJ 
      0095CA CC 94 D7         [ 2] 3526         JP     COMMA
                                   3527 
                                   3528 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3529 ;       IF      ( -- A )
                                   3530 ;       Begin a conditional branch.
                                   3531 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00154D                       3532         _HEADER IFF,IMEDD+2,"IF"
      0095CD 95 BC                    1         .word LINK 
                           00154F     2         LINK=.
      0095CF 82                       3         .byte IMEDD+2  
      0095D0 49 46                    4         .ascii "IF"
      0095D2                          5         IFF:
      0095D2 CD 95 1C         [ 4] 3533         CALL     COMPI
      0095D5 85 18                 3534         .word QBRAN
      0095D7 CD 8C 94         [ 4] 3535         CALL     HERE
      0095DA CD 8B B7         [ 4] 3536         CALL     ZERO
      0095DD CC 94 D7         [ 2] 3537         JP     COMMA
                                   3538 
                                   3539 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3540 ;       THEN        ( A -- )
                                   3541 ;       Terminate a conditional 
                                   3542 ;       branch structure.
                                   3543 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001560                       3544         _HEADER THENN,IMEDD+4,"THEN"
      0095E0 95 CF                    1         .word LINK 
                           001562     2         LINK=.
      0095E2 84                       3         .byte IMEDD+4  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



      0095E3 54 48 45 4E              4         .ascii "THEN"
      0095E7                          5         THENN:
      0095E7 CD 8C 94         [ 4] 3545         CALL     HERE
      0095EA CD 87 AB         [ 4] 3546         call ADRADJ 
      0095ED CD 86 18         [ 4] 3547         CALL     SWAPP
      0095F0 CC 85 51         [ 2] 3548         JP     STORE
                                   3549 
                                   3550 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3551 ;       ELSE        ( A -- A )
                                   3552 ;       Start the false clause in 
                                   3553 ;       an IF-ELSE-THEN structure.
                                   3554 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001573                       3555         _HEADER ELSEE,IMEDD+4,"ELSE"
      0095F3 95 E2                    1         .word LINK 
                           001575     2         LINK=.
      0095F5 84                       3         .byte IMEDD+4  
      0095F6 45 4C 53 45              4         .ascii "ELSE"
      0095FA                          5         ELSEE:
      0095FA CD 95 1C         [ 4] 3556         CALL     COMPI
      0095FD 85 34                 3557         .word BRAN
      0095FF CD 8C 94         [ 4] 3558         CALL     HERE
      009602 CD 8B B7         [ 4] 3559         CALL     ZERO
      009605 CD 94 D7         [ 4] 3560         CALL     COMMA
      009608 CD 86 18         [ 4] 3561         CALL     SWAPP
      00960B CD 8C 94         [ 4] 3562         CALL     HERE
      00960E CD 87 AB         [ 4] 3563         call ADRADJ 
      009611 CD 86 18         [ 4] 3564         CALL     SWAPP
      009614 CC 85 51         [ 2] 3565         JP     STORE
                                   3566 
                                   3567 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3568 ;       AHEAD       ( -- A )
                                   3569 ;       Compile a forward branch
                                   3570 ;       instruction.
                                   3571 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001597                       3572         _HEADER AHEAD,IMEDD+5,"AHEAD"
      009617 95 F5                    1         .word LINK 
                           001599     2         LINK=.
      009619 85                       3         .byte IMEDD+5  
      00961A 41 48 45 41 44           4         .ascii "AHEAD"
      00961F                          5         AHEAD:
      00961F CD 95 1C         [ 4] 3573         CALL     COMPI
      009622 85 34                 3574         .word BRAN
      009624 CD 8C 94         [ 4] 3575         CALL     HERE
      009627 CD 8B B7         [ 4] 3576         CALL     ZERO
      00962A CC 94 D7         [ 2] 3577         JP     COMMA
                                   3578 
                                   3579 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3580 ;       WHILE       ( a -- A a )
                                   3581 ;       Conditional branch out of a 
                                   3582 ;       BEGIN-WHILE-REPEAT loop.
                                   3583 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0015AD                       3584         _HEADER WHILE,IMEDD+5,"WHILE"
      00962D 96 19                    1         .word LINK 
                           0015AF     2         LINK=.
      00962F 85                       3         .byte IMEDD+5  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



      009630 57 48 49 4C 45           4         .ascii "WHILE"
      009635                          5         WHILE:
      009635 CD 95 1C         [ 4] 3585         CALL     COMPI
      009638 85 18                 3586         .word QBRAN
      00963A CD 8C 94         [ 4] 3587         CALL     HERE
      00963D CD 8B B7         [ 4] 3588         CALL     ZERO
      009640 CD 94 D7         [ 4] 3589         CALL     COMMA
      009643 CC 86 18         [ 2] 3590         JP     SWAPP
                                   3591 
                                   3592 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3593 ;       REPEAT      ( A a -- )
                                   3594 ;       Terminate a BEGIN-WHILE-REPEAT 
                                   3595 ;       indefinite loop.
                                   3596 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0015C6                       3597         _HEADER REPEA,IMEDD+6,"REPEAT"
      009646 96 2F                    1         .word LINK 
                           0015C8     2         LINK=.
      009648 86                       3         .byte IMEDD+6  
      009649 52 45 50 45 41 54        4         .ascii "REPEAT"
      00964F                          5         REPEA:
      00964F CD 95 1C         [ 4] 3598         CALL     COMPI
      009652 85 34                 3599         .word BRAN
      009654 CD 87 AB         [ 4] 3600         call ADRADJ 
      009657 CD 94 D7         [ 4] 3601         CALL     COMMA
      00965A CD 8C 94         [ 4] 3602         CALL     HERE
      00965D CD 87 AB         [ 4] 3603         call ADRADJ 
      009660 CD 86 18         [ 4] 3604         CALL     SWAPP
      009663 CC 85 51         [ 2] 3605         JP     STORE
                                   3606 
                                   3607 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3608 ;       AFT         ( a -- a A )
                                   3609 ;       Jump to THEN in a FOR-AFT-THEN-NEXT 
                                   3610 ;       loop the first time through.
                                   3611 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0015E6                       3612         _HEADER AFT,IMEDD+3,"AFT"
      009666 96 48                    1         .word LINK 
                           0015E8     2         LINK=.
      009668 83                       3         .byte IMEDD+3  
      009669 41 46 54                 4         .ascii "AFT"
      00966C                          5         AFT:
      00966C CD 85 FE         [ 4] 3613         CALL     DROP
      00966F CD 96 1F         [ 4] 3614         CALL     AHEAD
      009672 CD 8C 94         [ 4] 3615         CALL     HERE
      009675 CC 86 18         [ 2] 3616         JP     SWAPP
                                   3617 
                                   3618 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3619 ;       ABORT"      ( -- ; <string> )
                                   3620 ;       Conditional abort with an error message.
                                   3621 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0015F8                       3622         _HEADER ABRTQ,IMEDD+6,'ABORT"'
      009678 96 68                    1         .word LINK 
                           0015FA     2         LINK=.
      00967A 86                       3         .byte IMEDD+6  
      00967B 41 42 4F 52 54 22        4         .ascii 'ABORT"'
      009681                          5         ABRTQ:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



      009681 CD 95 1C         [ 4] 3623         CALL     COMPI
      009684 93 9A                 3624         .word ABORQ
      009686 CC 95 4C         [ 2] 3625         JP     STRCQ
                                   3626 
                                   3627 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3628 ;       $"     ( -- ; <string> )
                                   3629 ;       Compile an inline string literal.
                                   3630 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001609                       3631         _HEADER STRQ,IMEDD+2,'$"'
      009689 96 7A                    1         .word LINK 
                           00160B     2         LINK=.
      00968B 82                       3         .byte IMEDD+2  
      00968C 24 22                    4         .ascii '$"'
      00968E                          5         STRQ:
      00968E CD 95 1C         [ 4] 3632         CALL     COMPI
      009691 8F 58                 3633         .word STRQP 
      009693 CC 95 4C         [ 2] 3634         JP     STRCQ
                                   3635 
                                   3636 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3637 ;       ."          ( -- ; <string> )
                                   3638 ;       Compile an inline string literal 
                                   3639 ;       to be typed out at run time.
                                   3640 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001616                       3641         _HEADER DOTQ,IMEDD+2,'."'
      009696 96 8B                    1         .word LINK 
                           001618     2         LINK=.
      009698 82                       3         .byte IMEDD+2  
      009699 2E 22                    4         .ascii '."'
      00969B                          5         DOTQ:
      00969B CD 95 1C         [ 4] 3642         CALL     COMPI
      00969E 8F 5C                 3643         .word DOTQP 
      0096A0 CC 95 4C         [ 2] 3644         JP     STRCQ
                                   3645 
                                   3646 ;; Name compiler
                                   3647 
                                   3648 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3649 ;       ?UNIQUE ( a -- a )
                                   3650 ;       Display a warning message
                                   3651 ;       if word already exists.
                                   3652 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001623                       3653         _HEADER UNIQU,7,"?UNIQUE"
      0096A3 96 98                    1         .word LINK 
                           001625     2         LINK=.
      0096A5 07                       3         .byte 7  
      0096A6 3F 55 4E 49 51 55 45     4         .ascii "?UNIQUE"
      0096AD                          5         UNIQU:
      0096AD CD 86 08         [ 4] 3654         CALL     DUPP
      0096B0 CD 92 8E         [ 4] 3655         CALL     NAMEQ   ;?name exists
      0096B3 CD 85 18         [ 4] 3656         CALL     QBRAN
      0096B6 96 CC                 3657         .word      UNIQ1
      0096B8 CD 8F 5C         [ 4] 3658         CALL     DOTQP   ;redef are OK
      0096BB 07                    3659         .byte       7
      0096BC 20 72 65 44 65 66 20  3660         .ascii     " reDef "       
      0096C3 CD 86 30         [ 4] 3661         CALL     OVER
      0096C6 CD 8C 7D         [ 4] 3662         CALL     COUNT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



      0096C9 CD 8F 17         [ 4] 3663         CALL     TYPES   ;just in case
      0096CC CC 85 FE         [ 2] 3664 UNIQ1:  JP     DROP
                                   3665 
                                   3666 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3667 ;       $,n     ( na -- )
                                   3668 ;       Build a new dictionary name
                                   3669 ;       using string at na.
                                   3670 ; compile dans l'espace des variables 
                                   3671 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3672 ;        _HEADER SNAME,3,"$,n"
      0096CF 96 A5                 3673         .word      LINK
                           001651  3674 LINK = . 
      0096D1 03                    3675         .byte      3
      0096D2 24 2C 6E              3676         .ascii     "$,n"
      0096D5                       3677 SNAME:
      0096D5 CD 86 08         [ 4] 3678         CALL     DUPP
      0096D8 CD 85 81         [ 4] 3679         CALL     CAT     ;?null input
      0096DB CD 85 18         [ 4] 3680         CALL     QBRAN
      0096DE 97 0B                 3681         .word      PNAM1
      0096E0 CD 96 AD         [ 4] 3682         CALL     UNIQU   ;?redefinition
      0096E3 CD 86 08         [ 4] 3683         CALL     DUPP
      0096E6 CD 8C 7D         [ 4] 3684         CALL     COUNT
      0096E9 CD 88 2D         [ 4] 3685         CALL     PLUS
      0096EC CD 87 5F         [ 4] 3686         CALL     VPP
      0096EF CD 85 51         [ 4] 3687         CALL     STORE
      0096F2 CD 86 08         [ 4] 3688         CALL     DUPP
      0096F5 CD 87 7D         [ 4] 3689         CALL     LAST
      0096F8 CD 85 51         [ 4] 3690         CALL     STORE   ;save na for vocabulary link
      0096FB CD 8B 2F         [ 4] 3691         CALL     CELLM   ;link address
      0096FE CD 87 51         [ 4] 3692         CALL     CNTXT
      009701 CD 85 63         [ 4] 3693         CALL     AT
      009704 CD 86 18         [ 4] 3694         CALL     SWAPP
      009707 CD 85 51         [ 4] 3695         CALL     STORE
      00970A 81               [ 4] 3696         RET     ;save code pointer
      00970B CD 8F 58         [ 4] 3697 PNAM1:  CALL     STRQP
      00970E 05                    3698         .byte      5
      00970F 20 6E 61 6D 65        3699         .ascii     " name" ;null input
      009714 CC 93 A2         [ 2] 3700         JP     ABOR1
                                   3701 
                                   3702 ;; FORTH compiler
                                   3703 
                                   3704 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3705 ;       $COMPILE        ( a -- )
                                   3706 ;       Compile next word to
                                   3707 ;       dictionary as a token or literal.
                                   3708 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001697                       3709         _HEADER SCOMP,8,"$COMPILE"
      009717 96 D1                    1         .word LINK 
                           001699     2         LINK=.
      009719 08                       3         .byte 8  
      00971A 24 43 4F 4D 50 49 4C     4         .ascii "$COMPILE"
             45
      009722                          5         SCOMP:
      009722 CD 92 8E         [ 4] 3710         CALL     NAMEQ
      009725 CD 87 BB         [ 4] 3711         CALL     QDUP    ;?defined
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



      009728 CD 85 18         [ 4] 3712         CALL     QBRAN
      00972B 97 43                 3713         .word      SCOM2
      00972D CD 85 63         [ 4] 3714         CALL     AT
      009730 CD 84 EF         [ 4] 3715         CALL     DOLIT
      009733 80 00                 3716         .word     0x8000	;  IMEDD*256
      009735 CD 86 65         [ 4] 3717         CALL     ANDD    ;?immediate
      009738 CD 85 18         [ 4] 3718         CALL     QBRAN
      00973B 97 40                 3719         .word      SCOM1
      00973D CC 85 44         [ 2] 3720         JP     EXECU
      009740 CC 97 ED         [ 2] 3721 SCOM1:  JP     JSRC
      009743 CD A4 A1         [ 4] 3722 SCOM2:  CALL     NUMBQ   ;try to convert to number
      009746 CD 87 BB         [ 4] 3723         CALL    QDUP  
      009749 CD 85 18         [ 4] 3724         CALL     QBRAN
      00974C 93 A2                 3725         .word      ABOR1
      0016CE                       3726         _DOLIT  -1
      00974E CD 84 EF         [ 4]    1     CALL DOLIT 
      009751 FF FF                    2     .word -1 
      009753 CD 88 CE         [ 4] 3727         CALL    EQUAL
      0016D6                       3728         _QBRAN DLITER  
      009756 CD 85 18         [ 4]    1     CALL QBRAN
      009759 A8 EE                    2     .word DLITER
      00975B CC 95 3E         [ 2] 3729         JP     LITER
                                   3730 
                                   3731 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3732 ;       OVERT   ( -- )
                                   3733 ;       Link a new word into vocabulary.
                                   3734 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0016DE                       3735         _HEADER OVERT,5,"OVERT"
      00975E 97 19                    1         .word LINK 
                           0016E0     2         LINK=.
      009760 05                       3         .byte 5  
      009761 4F 56 45 52 54           4         .ascii "OVERT"
      009766                          5         OVERT:
      009766 CD 87 7D         [ 4] 3736         CALL     LAST
      009769 CD 85 63         [ 4] 3737         CALL     AT
      00976C CD 87 51         [ 4] 3738         CALL     CNTXT
      00976F CC 85 51         [ 2] 3739         JP     STORE
                                   3740 
                                   3741 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3742 ;       ;       ( -- )
                                   3743 ;       Terminate a colon definition.
                                   3744 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3745 ;        _HEADER SEMIS,IMEDD+COMPO+1,";"
      009772 97 60                 3746         .word      LINK
                           0016F4  3747 LINK = . 
      009774 C1                    3748 	.byte      IMEDD+COMPO+1
      009775 3B                    3749         .ascii     ";"
      009776                       3750 SEMIS:
                           000001  3751 .if OPTIMIZE ; more compact and faster
      009776 CD 84 EF         [ 4] 3752         call DOLIT 
      009779 00 81                 3753         .word 0x81   ; opcode for RET 
      00977B CD 94 EE         [ 4] 3754         call CCOMMA 
                           000000  3755 .else
                                   3756         CALL     COMPI
                                   3757         .word EXIT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



                                   3758 .endif 
      00977E CD 94 03         [ 4] 3759         CALL     LBRAC
      009781 CD 97 66         [ 4] 3760         call OVERT 
      009784 CD A1 76         [ 4] 3761         CALL FMOVE
      009787 CD 87 BB         [ 4] 3762         call QDUP 
      00978A CD 85 18         [ 4] 3763         call QBRAN 
      00978D 98 BD                 3764         .word SET_RAMLAST 
      00978F CD A2 0A         [ 4] 3765         CALL UPDATPTR
      009792 81               [ 4] 3766         RET 
                                   3767 
                                   3768 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3769 ;       Terminate an ISR definition 
                                   3770 ;       retourn ca of ISR as double
                                   3771 ;       I; ( -- ud )
                                   3772 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3773 ;       _HEADER ISEMI,2+IMEDD+COMPO,"I;"
      009793 97 74                 3774         .word LINK 
                           001715  3775         LINK=.
      009795 C2                    3776         .byte 2+IMEDD+COMPO 
      009796 49 3B                 3777         .ascii "I;" 
      009798                       3778 ISEMI:
      009798 1D 00 02         [ 2] 3779         subw x,#CELLL  
      00979B 90 AE 00 80      [ 2] 3780         ldw y,#IRET_CODE 
      00979F FF               [ 2] 3781         ldw (x),y 
      0097A0 CD 94 EE         [ 4] 3782         call CCOMMA
      0097A3 CD 94 03         [ 4] 3783         call LBRAC 
      0097A6 CD A2 4F         [ 4] 3784         call IFMOVE
      0097A9 CD 87 BB         [ 4] 3785         call QDUP 
      0097AC CD 85 18         [ 4] 3786         CALL QBRAN 
      0097AF 98 BD                 3787         .word SET_RAMLAST
      0097B1 CD 87 6D         [ 4] 3788         CALL CPP
      0097B4 CD 85 63         [ 4] 3789         call AT 
      0097B7 CD 86 18         [ 4] 3790         call SWAPP 
      0097BA CD 87 6D         [ 4] 3791         CALL CPP 
      0097BD CD 85 51         [ 4] 3792         call STORE 
      0097C0 CD 9C 07         [ 4] 3793         call UPDATCP 
      0097C3 CD 9B C4         [ 4] 3794         call EEPVP 
      0097C6 CD 85 FE         [ 4] 3795         call DROP 
      0097C9 CD 85 63         [ 4] 3796         call AT 
      0097CC CD 87 5F         [ 4] 3797         call VPP 
      0097CF CD 85 51         [ 4] 3798         call STORE 
      0097D2 CC 8B B7         [ 2] 3799         jp ZERO
      0097D5 81               [ 4] 3800         ret           
                                   3801         
                                   3802 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3803 ;       ]       ( -- )
                                   3804 ;       Start compiling words in
                                   3805 ;       input stream.
                                   3806 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001756                       3807         _HEADER RBRAC,1,"]"
      0097D6 97 95                    1         .word LINK 
                           001758     2         LINK=.
      0097D8 01                       3         .byte 1  
      0097D9 5D                       4         .ascii "]"
      0097DA                          5         RBRAC:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



      0097DA CD 84 EF         [ 4] 3808         CALL   DOLIT
      0097DD 97 22                 3809         .word  SCOMP
      0097DF CD 87 2F         [ 4] 3810         CALL   TEVAL
      0097E2 CC 85 51         [ 2] 3811         JP     STORE
                                   3812 
                                   3813 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3814 ;       CALL,    ( ca -- )
                                   3815 ;       Compile a subroutine call.
                                   3816 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3817 ;        _HEADER JSRC,5,"CALL,"
      0097E5 97 D8                 3818         .word      LINK
                           001767  3819 LINK = . 
      0097E7 05                    3820         .byte      5
      0097E8 43 41 4C 4C 2C        3821         .ascii     "CALL,"
      0097ED                       3822 JSRC:
      0097ED CD 84 EF         [ 4] 3823         CALL     DOLIT
      0097F0 00 CD                 3824         .word     CALLL     ;CALL
      0097F2 CD 94 EE         [ 4] 3825         CALL     CCOMMA
      0097F5 CC 94 D7         [ 2] 3826         JP     COMMA
                                   3827 
                                   3828 ;       INIT-OFS ( -- )
                                   3829 ;       compute offset to adjust jump address 
                                   3830 ;       set variable OFFSET 
      0097F8 97 E7                 3831         .word LINK 
                           00177A  3832         LINK=.
      0097FA 08                    3833         .byte 8 
      0097FB 49 4E 49 54 2D 4F 46  3834         .ascii "INIT-OFS" 
             53
      009803                       3835 INITOFS:
      009803 CD 87 1E         [ 4] 3836         call TFLASH 
      009806 CD 85 63         [ 4] 3837         CALL AT 
      009809 CD 86 08         [ 4] 3838         CALL DUPP 
      00980C CD 85 18         [ 4] 3839         call QBRAN
      00980F 98 20                 3840         .word 1$
      009811 CD 85 FE         [ 4] 3841         call DROP  
      009814 CD 87 6D         [ 4] 3842         call CPP 
      009817 CD 85 63         [ 4] 3843         call AT 
      00981A CD 8C 94         [ 4] 3844         call HERE
      00981D CD 88 A6         [ 4] 3845         call SUBB 
      009820 CD 87 A2         [ 4] 3846 1$:     call OFFSET 
      009823 CC 85 51         [ 2] 3847         jp STORE  
                                   3848 
                                   3849 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3850 ;       :       ( -- ; <string> )
                                   3851 ;       Start a new colon definition
                                   3852 ;       using next word as its name.
                                   3853 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0017A6                       3854         _HEADER COLON,1,":"
      009826 97 FA                    1         .word LINK 
                           0017A8     2         LINK=.
      009828 01                       3         .byte 1  
      009829 3A                       4         .ascii ":"
      00982A                          5         COLON:
      00982A CD 98 03         [ 4] 3855         call INITOFS       
      00982D CD 91 91         [ 4] 3856         CALL   TOKEN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



      009830 CD 96 D5         [ 4] 3857         CALL   SNAME
      009833 CC 97 DA         [ 2] 3858         JP     RBRAC
                                   3859 
                                   3860 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3861 ;       I:  ( -- )
                                   3862 ;       Start interrupt service 
                                   3863 ;       routine definition
                                   3864 ;       those definition have 
                                   3865 ;       no name.
                                   3866 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0017B6                       3867         _HEADER ICOLON,2,"I:"
      009836 98 28                    1         .word LINK 
                           0017B8     2         LINK=.
      009838 02                       3         .byte 2  
      009839 49 3A                    4         .ascii "I:"
      00983B                          5         ICOLON:
      00983B CD 98 03         [ 4] 3868         call INITOFS 
      00983E CC 97 DA         [ 2] 3869         jp RBRAC  
                                   3870 
                                   3871 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3872 ;       IMMEDIATE       ( -- )
                                   3873 ;       Make last compiled word
                                   3874 ;       an immediate word.
                                   3875 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0017C1                       3876         _HEADER IMMED,9,"IMMEDIATE"
      009841 98 38                    1         .word LINK 
                           0017C3     2         LINK=.
      009843 09                       3         .byte 9  
      009844 49 4D 4D 45 44 49 41     4         .ascii "IMMEDIATE"
             54 45
      00984D                          5         IMMED:
      00984D CD 84 EF         [ 4] 3877         CALL     DOLIT
      009850 80 00                 3878         .word     0x8000	;  IMEDD*256
      009852 CD 87 7D         [ 4] 3879         CALL     LAST
      009855 CD 85 63         [ 4] 3880         CALL     AT
      009858 CD 85 63         [ 4] 3881         CALL     AT
      00985B CD 86 79         [ 4] 3882         CALL     ORR
      00985E CD 87 7D         [ 4] 3883         CALL     LAST
      009861 CD 85 63         [ 4] 3884         CALL     AT
      009864 CC 85 51         [ 2] 3885         JP     STORE
                                   3886 
                                   3887 ;; Defining words
                                   3888 
                                   3889 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3890 ;       CREATE  ( -- ; <string> )
                                   3891 ;       Compile a new array
                                   3892 ;       without allocating space.
                                   3893 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0017E7                       3894         _HEADER CREAT,6,"CREATE"
      009867 98 43                    1         .word LINK 
                           0017E9     2         LINK=.
      009869 06                       3         .byte 6  
      00986A 43 52 45 41 54 45        4         .ascii "CREATE"
      009870                          5         CREAT:
      009870 CD 91 91         [ 4] 3895         CALL     TOKEN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



      009873 CD 96 D5         [ 4] 3896         CALL     SNAME
      009876 CD 97 66         [ 4] 3897         CALL     OVERT        
      009879 CD 95 1C         [ 4] 3898         CALL     COMPI 
      00987C 86 BE                 3899         .word DOVAR 
      00987E 81               [ 4] 3900         RET
                                   3901 
                                   3902 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3903 ;       VARIABLE  ( -- ; <string> )
                                   3904 ;       Compile a new variable
                                   3905 ;       initialized to 0.
                                   3906 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0017FF                       3907         _HEADER VARIA,8,"VARIABLE"
      00987F 98 69                    1         .word LINK 
                           001801     2         LINK=.
      009881 08                       3         .byte 8  
      009882 56 41 52 49 41 42 4C     4         .ascii "VARIABLE"
             45
      00988A                          5         VARIA:
                                   3908 ; indirect variable so that VARIABLE definition can be compiled in FLASH 
      00988A CD 8C 94         [ 4] 3909         CALL HERE
      00988D CD 86 08         [ 4] 3910         CALL DUPP 
      009890 CD 8B 20         [ 4] 3911         CALL CELLP
      009893 CD 87 5F         [ 4] 3912         CALL VPP 
      009896 CD 85 51         [ 4] 3913         CALL STORE
      009899 CD 98 70         [ 4] 3914         CALL CREAT
      00989C CD 86 08         [ 4] 3915         CALL DUPP
      00989F CD 94 D7         [ 4] 3916         CALL COMMA
      0098A2 CD 8B B7         [ 4] 3917         CALL ZERO
      0098A5 CD 86 18         [ 4] 3918         call SWAPP 
      0098A8 CD 85 51         [ 4] 3919         CALL STORE
      0098AB CD A1 76         [ 4] 3920         CALL FMOVE ; move definition to FLASH
      0098AE CD 87 BB         [ 4] 3921         CALL QDUP 
      0098B1 CD 85 18         [ 4] 3922         CALL QBRAN 
      0098B4 98 BD                 3923         .word SET_RAMLAST   
      0098B6 CD 9C 1E         [ 4] 3924         call UPDATVP  ; don't update if variable kept in RAM.
      0098B9 CD A2 0A         [ 4] 3925         CALL UPDATPTR
      0098BC 81               [ 4] 3926         RET         
      0098BD                       3927 SET_RAMLAST: 
      0098BD CD 87 7D         [ 4] 3928         CALL LAST 
      0098C0 CD 85 63         [ 4] 3929         CALL AT 
      0098C3 CD 87 90         [ 4] 3930         CALL RAMLAST 
      0098C6 CC 85 51         [ 2] 3931         jp STORE  
                                   3932 
                                   3933 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3934 ;       CONSTANT  ( n -- ; <string> )
                                   3935 ;       Compile a new constant 
                                   3936 ;       n CONSTANT name 
                                   3937 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001849                       3938         _HEADER CONSTANT,8,"CONSTANT"
      0098C9 98 81                    1         .word LINK 
                           00184B     2         LINK=.
      0098CB 08                       3         .byte 8  
      0098CC 43 4F 4E 53 54 41 4E     4         .ascii "CONSTANT"
             54
      0098D4                          5         CONSTANT:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



      0098D4 CD 91 91         [ 4] 3939         CALL TOKEN
      0098D7 CD 96 D5         [ 4] 3940         CALL SNAME 
      0098DA CD 97 66         [ 4] 3941         CALL OVERT 
      0098DD CD 95 1C         [ 4] 3942         CALL COMPI 
      0098E0 98 F4                 3943         .word DOCONST
      0098E2 CD 94 D7         [ 4] 3944         CALL COMMA 
      0098E5 CD A1 76         [ 4] 3945         CALL FMOVE
      0098E8 CD 87 BB         [ 4] 3946         CALL QDUP 
      0098EB CD 85 18         [ 4] 3947         CALL QBRAN 
      0098EE 98 BD                 3948         .word SET_RAMLAST  
      0098F0 CD A2 0A         [ 4] 3949         CALL UPDATPTR  
      0098F3 81               [ 4] 3950 1$:     RET          
                                   3951 
                                   3952 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3953 ; CONSTANT runtime semantic 
                                   3954 ; doCONST  ( -- n )
                                   3955 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3956 ;       _HEADER DOCONST,7,"DOCONST"
                                   3957 ;        .word LINK 
      0098F4                       3958 DOCONST:
      0098F4 1D 00 02         [ 2] 3959         subw x,#CELLL
      0098F7 90 85            [ 2] 3960         popw y 
      0098F9 90 FE            [ 2] 3961         ldw y,(y) 
      0098FB FF               [ 2] 3962         ldw (x),y 
      0098FC 81               [ 4] 3963         ret 
                                   3964 
                                   3965 ;----------------------------------
                                   3966 ; create double constant 
                                   3967 ; 2CONSTANT ( d -- ; <string> )
                                   3968 ;----------------------------------
      0098FD 98 CB                 3969     .word LINK 
                           00187F  3970     LINK=.
      0098FF 09                    3971     .byte 9 
      009900 32 43 4F 4E 53 54 41  3972     .ascii "2CONSTANT"
             4E 54
      009909                       3973 DCONST:
      009909 CD 91 91         [ 4] 3974         CALL TOKEN
      00990C CD 96 D5         [ 4] 3975         CALL SNAME 
      00990F CD 97 66         [ 4] 3976         CALL OVERT 
      009912 CD 95 1C         [ 4] 3977         CALL COMPI 
      009915 99 2C                 3978         .word DO_DCONST
      009917 CD 94 D7         [ 4] 3979         CALL COMMA
      00991A CD 94 D7         [ 4] 3980         CALL COMMA  
      00991D CD A1 76         [ 4] 3981         CALL FMOVE
      009920 CD 87 BB         [ 4] 3982         CALL QDUP 
      009923 CD 85 18         [ 4] 3983         CALL QBRAN 
      009926 98 BD                 3984         .word SET_RAMLAST  
      009928 CD A2 0A         [ 4] 3985         CALL UPDATPTR  
      00992B 81               [ 4] 3986 1$:     RET          
                                   3987     
                                   3988 ;----------------------------------
                                   3989 ; runtime for DCONST 
                                   3990 ; stack double constant 
                                   3991 ; DO-DCONST ( -- d )
                                   3992 ;-----------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



                                   3993 ;       _HEADER DO_DCONST,9,"DO-DCONST"
                                   3994 ;        .word LINK 
                                   3995 ;        LINK=.
                                   3996 ;        .byte 9 
                                   3997 ;        .ascii "DO-DCONST"
      00992C                       3998 DO_DCONST:
      00992C 90 85            [ 2] 3999     popw y 
      00992E 90 BF 26         [ 2] 4000     ldw YTEMP,y 
      009931 1D 00 04         [ 2] 4001     subw x,#2*CELLL 
      009934 90 FE            [ 2] 4002     ldw y,(y)
      009936 FF               [ 2] 4003     ldw (x),y 
      009937 90 BE 26         [ 2] 4004     ldw y,YTEMP 
      00993A 90 EE 02         [ 2] 4005     ldw y,(2,y)
      00993D EF 02            [ 2] 4006     ldw (2,x),y 
      00993F 81               [ 4] 4007     ret 
                                   4008 
                                   4009 ;; Tools
                                   4010 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4011 ;       _TYPE   ( b u -- )
                                   4012 ;       Display a string. Filter
                                   4013 ;       non-printing characters.
                                   4014 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0018C0                       4015         _HEADER UTYPE,5,"_TYPE"
      009940 98 FF                    1         .word LINK 
                           0018C2     2         LINK=.
      009942 05                       3         .byte 5  
      009943 5F 54 59 50 45           4         .ascii "_TYPE"
      009948                          5         UTYPE:
      009948 CD 85 D1         [ 4] 4016         CALL     TOR     ;start count down loop
      00994B 20 0F            [ 2] 4017         JRA     UTYP2   ;skip first pass
      00994D CD 86 08         [ 4] 4018 UTYP1:  CALL     DUPP
      009950 CD 85 81         [ 4] 4019         CALL     CAT
      009953 CD 8B E1         [ 4] 4020         CALL     TCHAR
      009956 CD 84 B6         [ 4] 4021         CALL     EMIT    ;display only printable
      009959 CD 8B 4B         [ 4] 4022         CALL     ONEP    ;increment address
      00995C CD 85 03         [ 4] 4023 UTYP2:  CALL     DONXT
      00995F 99 4D                 4024         .word      UTYP1   ;loop till done
      009961 CC 85 FE         [ 2] 4025         JP     DROP
                                   4026 
                                   4027 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4028 ;       dm+     ( a u -- a )
                                   4029 ;       Dump u bytes from ,
                                   4030 ;       leaving a+u on  stack.
                                   4031 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0018E4                       4032         _HEADER DUMPP,3,"DM+"
      009964 99 42                    1         .word LINK 
                           0018E6     2         LINK=.
      009966 03                       3         .byte 3  
      009967 44 4D 2B                 4         .ascii "DM+"
      00996A                          5         DUMPP:
      00996A CD 86 30         [ 4] 4033         CALL     OVER
      00996D CD 84 EF         [ 4] 4034         CALL     DOLIT
      009970 00 04                 4035         .word      4
      009972 CD 8F 85         [ 4] 4036         CALL     UDOTR   ;display address
      009975 CD 8E ED         [ 4] 4037         CALL     SPACE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



      009978 CD 85 D1         [ 4] 4038         CALL     TOR     ;start count down loop
      00997B 20 11            [ 2] 4039         JRA     PDUM2   ;skip first pass
      00997D CD 86 08         [ 4] 4040 PDUM1:  CALL     DUPP
      009980 CD 85 81         [ 4] 4041         CALL     CAT
      009983 CD 84 EF         [ 4] 4042         CALL     DOLIT
      009986 00 03                 4043         .word      3
      009988 CD 8F 85         [ 4] 4044         CALL     UDOTR   ;display numeric data
      00998B CD 8B 4B         [ 4] 4045         CALL     ONEP    ;increment address
      00998E CD 85 03         [ 4] 4046 PDUM2:  CALL     DONXT
      009991 99 7D                 4047         .word      PDUM1   ;loop till done
      009993 81               [ 4] 4048         RET
                                   4049 
                                   4050 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4051 ;       DUMP    ( a u -- )
                                   4052 ;       Dump u bytes from a,
                                   4053 ;       in a formatted manner.
                                   4054 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001914                       4055         _HEADER DUMP,4,"DUMP"
      009994 99 66                    1         .word LINK 
                           001916     2         LINK=.
      009996 04                       3         .byte 4  
      009997 44 55 4D 50              4         .ascii "DUMP"
      00999B                          5         DUMP:
      00999B CD 86 CE         [ 4] 4056         CALL     BASE
      00999E CD 85 63         [ 4] 4057         CALL     AT
      0099A1 CD 85 D1         [ 4] 4058         CALL     TOR
      0099A4 CD 8E 4C         [ 4] 4059         CALL     HEX     ;save radix, set hex
      0099A7 CD 84 EF         [ 4] 4060         CALL     DOLIT
      0099AA 00 10                 4061         .word      16
      0099AC CD 8A 71         [ 4] 4062         CALL     SLASH   ;change count to lines
      0099AF CD 85 D1         [ 4] 4063         CALL     TOR     ;start count down loop
      0099B2 CD 8F 2F         [ 4] 4064 DUMP1:  CALL     CR
      0099B5 CD 84 EF         [ 4] 4065         CALL     DOLIT
      0099B8 00 10                 4066         .word      16
      0099BA CD 88 18         [ 4] 4067         CALL     DDUP
      0099BD CD 99 6A         [ 4] 4068         CALL     DUMPP   ;display numeric
      0099C0 CD 87 CC         [ 4] 4069         CALL     ROT
      0099C3 CD 87 CC         [ 4] 4070         CALL     ROT
      0099C6 CD 8E ED         [ 4] 4071         CALL     SPACE
      0099C9 CD 8E ED         [ 4] 4072         CALL     SPACE
      0099CC CD 99 48         [ 4] 4073         CALL     UTYPE   ;display printable characters
      0099CF CD 85 03         [ 4] 4074         CALL     DONXT
      0099D2 99 B2                 4075         .word      DUMP1   ;loop till done
      0099D4 CD 85 FE         [ 4] 4076 DUMP3:  CALL     DROP
      0099D7 CD 85 B4         [ 4] 4077         CALL     RFROM
      0099DA CD 86 CE         [ 4] 4078         CALL     BASE
      0099DD CC 85 51         [ 2] 4079         JP     STORE   ;restore radix
                                   4080 
                                   4081 ;       .S      ( ... -- ... )
                                   4082 ;        Display  contents of stack.
      0099E0 99 96                 4083         .word      LINK
                           001962  4084 LINK = . 
      0099E2 02                    4085         .byte      2
      0099E3 2E 53                 4086         .ascii     ".S"
      0099E5                       4087 DOTS:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



      0099E5 CD 8F 2F         [ 4] 4088         CALL     CR
      0099E8 CD 8B F9         [ 4] 4089         CALL     DEPTH   ;stack depth
      0099EB CD 85 D1         [ 4] 4090         CALL     TOR     ;start count down loop
      0099EE 20 09            [ 2] 4091         JRA     DOTS2   ;skip first pass
      0099F0 CD 85 C5         [ 4] 4092 DOTS1:  CALL     RAT
      0099F3 CD 8C 10         [ 4] 4093 	CALL     PICK
      0099F6 CD 8F D6         [ 4] 4094         CALL     DOT     ;index stack, display contents
      0099F9 CD 85 03         [ 4] 4095 DOTS2:  CALL     DONXT
      0099FC 99 F0                 4096         .word      DOTS1   ;loop till done
      0099FE CD 8F 5C         [ 4] 4097         CALL     DOTQP
      009A01 05                    4098         .byte      5
      009A02 20 3C 73 70 20        4099         .ascii     " <sp "
      009A07 81               [ 4] 4100         RET
                                   4101 
                                   4102 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4103 ;       >NAME   ( ca -- na | F )
                                   4104 ;       Convert code address
                                   4105 ;       to a name address.
                                   4106 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001988                       4107         _HEADER TNAME,5,">NAME"
      009A08 99 E2                    1         .word LINK 
                           00198A     2         LINK=.
      009A0A 05                       3         .byte 5  
      009A0B 3E 4E 41 4D 45           4         .ascii ">NAME"
      009A10                          5         TNAME:
      009A10 CD 87 51         [ 4] 4108         CALL     CNTXT   ;vocabulary link
      009A13 CD 85 63         [ 4] 4109 TNAM2:  CALL     AT
      009A16 CD 86 08         [ 4] 4110         CALL     DUPP    ;?last word in a vocabulary
      009A19 CD 85 18         [ 4] 4111         CALL     QBRAN
      009A1C 9A 37                 4112         .word      TNAM4
      009A1E CD 88 18         [ 4] 4113         CALL     DDUP
      009A21 CD 91 9F         [ 4] 4114         CALL     NAMET
      009A24 CD 86 8E         [ 4] 4115         CALL     XORR    ;compare
      009A27 CD 85 18         [ 4] 4116         CALL     QBRAN
      009A2A 9A 31                 4117         .word      TNAM3
      009A2C CD 8B 2F         [ 4] 4118         CALL     CELLM   ;continue with next word
      009A2F 20 E2            [ 2] 4119         JRA     TNAM2
      009A31 CD 86 18         [ 4] 4120 TNAM3:  CALL     SWAPP
      009A34 CC 85 FE         [ 2] 4121         JP     DROP
      009A37 CD 88 0D         [ 4] 4122 TNAM4:  CALL     DDROP
      009A3A CC 8B B7         [ 2] 4123         JP     ZERO
                                   4124 
                                   4125 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4126 ;       .ID     ( na -- )
                                   4127 ;        Display  name at address.
                                   4128 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0019BD                       4129         _HEADER DOTID,3,".ID"
      009A3D 9A 0A                    1         .word LINK 
                           0019BF     2         LINK=.
      009A3F 03                       3         .byte 3  
      009A40 2E 49 44                 4         .ascii ".ID"
      009A43                          5         DOTID:
      009A43 CD 87 BB         [ 4] 4130         CALL     QDUP    ;if zero no name
      009A46 CD 85 18         [ 4] 4131         CALL     QBRAN
      009A49 9A 59                 4132         .word      DOTI1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



      009A4B CD 8C 7D         [ 4] 4133         CALL     COUNT
      009A4E CD 84 EF         [ 4] 4134         CALL     DOLIT
      009A51 00 1F                 4135         .word      0x1F
      009A53 CD 86 65         [ 4] 4136         CALL     ANDD    ;mask lexicon bits
      009A56 CC 99 48         [ 2] 4137         JP     UTYPE
      009A59 CD 8F 5C         [ 4] 4138 DOTI1:  CALL     DOTQP
      009A5C 09                    4139         .byte      9
      009A5D 20 6E 6F 4E 61 6D 65  4140         .ascii     " noName"
      009A64 81               [ 4] 4141         RET
                                   4142 
                           000000  4143 WANT_SEE=0
                           000000  4144 .if WANT_SEE 
                                   4145 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4146 ;       SEE     ( -- ; <string> )
                                   4147 ;       A simple decompiler.
                                   4148 ;       Updated for byte machines.
                                   4149 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4150         _HEADER SEE,3,"SEE"
                                   4151         CALL     TICK    ;starting address
                                   4152         CALL     CR
                                   4153         CALL     ONEM
                                   4154 SEE1:   CALL     ONEP
                                   4155         CALL     DUPP
                                   4156         CALL     AT
                                   4157         CALL     DUPP
                                   4158         CALL     QBRAN
                                   4159         .word    SEE2
                                   4160         CALL     TNAME   ;?is it a name
                                   4161 SEE2:   CALL     QDUP    ;name address or zero
                                   4162         CALL     QBRAN
                                   4163         .word    SEE3
                                   4164         CALL     SPACE
                                   4165         CALL     DOTID   ;display name
                                   4166         CALL     ONEP
                                   4167         JRA      SEE4
                                   4168 SEE3:   CALL     DUPP
                                   4169         CALL     CAT
                                   4170         CALL     UDOT    ;display number
                                   4171 SEE4:   CALL     NUFQ    ;user control
                                   4172         CALL     QBRAN
                                   4173         .word    SEE1
                                   4174         JP     DROP
                                   4175 .endif ; WANT_SEE 
                                   4176 
                                   4177 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4178 ;       WORDS   ( -- )
                                   4179 ;       Display names in vocabulary.
                                   4180 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0019E5                       4181         _HEADER WORDS,5,"WORDS"
      009A65 9A 3F                    1         .word LINK 
                           0019E7     2         LINK=.
      009A67 05                       3         .byte 5  
      009A68 57 4F 52 44 53           4         .ascii "WORDS"
      009A6D                          5         WORDS:
      009A6D CD 8F 2F         [ 4] 4182         CALL     CR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



      009A70 CD 87 51         [ 4] 4183         CALL     CNTXT   ;only in context
      009A73 CD 85 63         [ 4] 4184 WORS1:  CALL     AT
      009A76 CD 87 BB         [ 4] 4185         CALL     QDUP    ;?at end of list
      009A79 CD 85 18         [ 4] 4186         CALL     QBRAN
      009A7C 9A 8F                 4187         .word      WORS2
      009A7E CD 86 08         [ 4] 4188         CALL     DUPP
      009A81 CD 8E ED         [ 4] 4189         CALL     SPACE
      009A84 CD 9A 43         [ 4] 4190         CALL     DOTID   ;display a name
      009A87 CD 8B 2F         [ 4] 4191         CALL     CELLM
      009A8A CD 85 34         [ 4] 4192         CALL     BRAN
      009A8D 9A 73                 4193         .word      WORS1
      009A8F 81               [ 4] 4194 WORS2:  RET
                                   4195 
                                   4196         
                                   4197 ;; Hardware reset
                                   4198 
                                   4199 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4200 ;       hi      ( -- )
                                   4201 ;       Display sign-on message.
                                   4202 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001A10                       4203         _HEADER HI,2,"HI"
      009A90 9A 67                    1         .word LINK 
                           001A12     2         LINK=.
      009A92 02                       3         .byte 2  
      009A93 48 49                    4         .ascii "HI"
      009A95                          5         HI:
      009A95 CD 8F 2F         [ 4] 4204         CALL     CR
      009A98 CD 8F 5C         [ 4] 4205         CALL     DOTQP   ;initialize I/O
      009A9B 0F                    4206         .byte      15
      009A9C 73 74 6D 38 65 46 6F  4207         .ascii     "stm8eForth v"
             72 74 68 20 76
      009AA8 34                    4208 	.byte      VER+'0'
      009AA9 2E                    4209         .byte      '.' 
      009AAA 30                    4210 	.byte      EXT+'0' ;version
      009AAB CD 8F 5C         [ 4] 4211         CALL    DOTQP
                           000001  4212 .if NUCLEO          
      009AAE 12                    4213         .byte 18
      009AAF 20 6F 6E 20 4E 55 43  4214         .ascii  " on NUCLEO-8S208RB"
             4C 45 4F 2D 38 53 32
             30 38 52 42
                                   4215 .endif
                           000000  4216 .if DISCOVERY
                                   4217         .byte 19
                                   4218         .ascii  " on STM8S-DISCOVERY"
                                   4219 .endif
                           000000  4220 .if DOORBELL
                                   4221         .byte 16
                                   4222         .ascii " on stm8s105k6b6"
                                   4223 .endif
      009AC1 CC 8F 2F         [ 2] 4224         JP     CR
                                   4225 
                           000000  4226 WANT_DEBUG=0
                           000000  4227 .if WANT_DEBUG 
                                   4228 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4229 ;       DEBUG      ( -- )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



                                   4230 ;       Display sign-on message.
                                   4231 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4232         _HEADER DEBUG,5,"DEBUG"
                                   4233 	CALL DOLIT
                                   4234 	.word 0x65
                                   4235 	CALL EMIT
                                   4236 	CALL DOLIT
                                   4237 	.word 0
                                   4238  	CALL ZLESS 
                                   4239 	CALL DOLIT
                                   4240 	.word 0xFFFE
                                   4241 	CALL ZLESS 
                                   4242 	CALL UPLUS 
                                   4243  	CALL DROP 
                                   4244 	CALL DOLIT
                                   4245 	.word 3
                                   4246 	CALL UPLUS 
                                   4247 	CALL UPLUS 
                                   4248  	CALL DROP
                                   4249 	CALL DOLIT
                                   4250 	.word 0x43
                                   4251 	CALL UPLUS 
                                   4252  	CALL DROP
                                   4253 	CALL EMIT
                                   4254 	CALL DOLIT
                                   4255 	.word 0x4F
                                   4256 	CALL DOLIT
                                   4257 	.word 0x6F
                                   4258  	CALL XORR
                                   4259 	CALL DOLIT
                                   4260 	.word 0xF0
                                   4261  	CALL ANDD
                                   4262 	CALL DOLIT
                                   4263 	.word 0x4F
                                   4264  	CALL ORR
                                   4265 	CALL EMIT
                                   4266 	CALL DOLIT
                                   4267 	.word 8
                                   4268 	CALL DOLIT
                                   4269 	.word 6
                                   4270  	CALL SWAPP
                                   4271 	CALL OVER
                                   4272 	CALL XORR
                                   4273 	CALL DOLIT
                                   4274 	.word 3
                                   4275 	CALL ANDD 
                                   4276 	CALL ANDD
                                   4277 	CALL DOLIT
                                   4278 	.word 0x70
                                   4279 	CALL UPLUS 
                                   4280 	CALL DROP
                                   4281 	CALL EMIT
                                   4282 	CALL DOLIT
                                   4283 	.word 0
                                   4284 	CALL QBRAN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



                                   4285 	.word DEBUG1
                                   4286 	CALL DOLIT
                                   4287 	.word 0x3F
                                   4288 DEBUG1:
                                   4289 	CALL DOLIT
                                   4290 	.word 0xFFFF
                                   4291 	CALL QBRAN
                                   4292 	.word DEBUG2
                                   4293 	CALL DOLIT
                                   4294 	.word 0x74
                                   4295 	CALL BRAN
                                   4296 	.word DEBUG3
                                   4297 DEBUG2:
                                   4298 	CALL DOLIT
                                   4299 	.word 0x21
                                   4300 DEBUG3:
                                   4301 	CALL EMIT
                                   4302 	CALL DOLIT
                                   4303 	.word 0x68
                                   4304 	CALL DOLIT
                                   4305 	.word 0x80
                                   4306 	CALL STORE
                                   4307 	CALL DOLIT
                                   4308 	.word 0x80
                                   4309 	CALL AT
                                   4310 	CALL EMIT
                                   4311 	CALL DOLIT
                                   4312 	.word 0x4D
                                   4313 	CALL TOR
                                   4314 	CALL RAT
                                   4315 	CALL RFROM
                                   4316 	CALL ANDD
                                   4317 	CALL EMIT
                                   4318 	CALL DOLIT
                                   4319 	.word 0x61
                                   4320 	CALL DOLIT
                                   4321 	.word 0xA
                                   4322 	CALL TOR
                                   4323 DEBUG4:
                                   4324 	CALL DOLIT
                                   4325 	.word 1
                                   4326 	CALL UPLUS 
                                   4327 	CALL DROP
                                   4328 	CALL DONXT
                                   4329 	.word DEBUG4
                                   4330 	CALL EMIT
                                   4331 	CALL DOLIT
                                   4332 	.word 0x656D
                                   4333 	CALL DOLIT
                                   4334 	.word 0x100
                                   4335 	CALL UMSTA
                                   4336 	CALL SWAPP
                                   4337 	CALL DOLIT
                                   4338 	.word 0x100
                                   4339 	CALL UMSTA
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



                                   4340 	CALL SWAPP 
                                   4341 	CALL DROP
                                   4342 	CALL EMIT
                                   4343 	CALL EMIT
                                   4344 	CALL DOLIT
                                   4345 	.word 0x2043
                                   4346 	CALL DOLIT
                                   4347 	.word 0
                                   4348 	CALL DOLIT
                                   4349 	.word 0x100
                                   4350 	CALL UMMOD
                                   4351 	CALL EMIT
                                   4352 	CALL EMIT
                                   4353 	;JP ORIG
                                   4354 	RET
                                   4355 .endif ; WANT_DEBUG 
                                   4356 
                                   4357 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4358 ;       'BOOT   ( -- a )
                                   4359 ;       The application startup vector.
                                   4360 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001A44                       4361         _HEADER TBOOT,5,"'BOOT"
      009AC4 9A 92                    1         .word LINK 
                           001A46     2         LINK=.
      009AC6 05                       3         .byte 5  
      009AC7 27 42 4F 4F 54           4         .ascii "'BOOT"
      009ACC                          5         TBOOT:
      009ACC CD 86 BE         [ 4] 4362         CALL     DOVAR
      009ACF 40 02                 4363         .word    APP_RUN      ;application to boot
                                   4364 
                                   4365 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4366 ;       COLD    ( -- )
                                   4367 ;       The hilevel cold start s=ence.
                                   4368 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001A51                       4369         _HEADER COLD,4,"COLD"
      009AD1 9A C6                    1         .word LINK 
                           001A53     2         LINK=.
      009AD3 04                       3         .byte 4  
      009AD4 43 4F 4C 44              4         .ascii "COLD"
      009AD8                          5         COLD:
                           000000  4370 .if WANT_DEBUG
                                   4371         CALL DEBUG
                                   4372 .endif ; WANT_DEBUG
      009AD8 CD 84 EF         [ 4] 4373 COLD1:  CALL     DOLIT
      009ADB 80 AB                 4374         .word      UZERO
      009ADD CD 84 EF         [ 4] 4375 	CALL     DOLIT
      009AE0 00 06                 4376         .word      UPP
      009AE2 CD 84 EF         [ 4] 4377         CALL     DOLIT
      009AE5 00 1C                 4378 	.word      UEND-UZERO
      009AE7 CD 8C E1         [ 4] 4379         CALL     CMOVE   ;initialize user area
                           000001  4380 .if WANT_FLOAT 
      009AEA CD AB A1         [ 4] 4381         CALL    FINIT 
                                   4382 .endif 
                                   4383 ; if APP_RUN==0 initialize with ca de 'hi'  
      009AED 90 CE 40 02      [ 2] 4384         ldw y,APP_RUN 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



      009AF1 26 0B            [ 1] 4385         jrne 0$
      009AF3 1D 00 02         [ 2] 4386         subw x,#CELLL 
      009AF6 90 AE 9A 95      [ 2] 4387         ldw y,#HI  
      009AFA FF               [ 2] 4388         ldw (x),y
      009AFB CD 9B F6         [ 4] 4389         call UPDATRUN 
      009AFE                       4390 0$:        
                                   4391 ; update LAST with APP_LAST 
                                   4392 ; if APP_LAST > LAST else do the opposite
      009AFE 90 CE 40 00      [ 2] 4393         ldw y,APP_LAST 
      009B02 90 B3 1C         [ 2] 4394         cpw y,ULAST 
      009B05 22 05            [ 1] 4395         jrugt 1$ 
                                   4396 ; save LAST at APP_LAST  
      009B07 CD 9B DE         [ 4] 4397         call UPDATLAST 
      009B0A 20 06            [ 2] 4398         jra 2$
      009B0C                       4399 1$: ; update LAST with APP_LAST 
      009B0C 90 BF 1C         [ 2] 4400         ldw ULAST,y
      009B0F 90 BF 16         [ 2] 4401         ldw UCNTXT,y
      009B12                       4402 2$:  
                                   4403 ; update APP_CP if < app_space 
      009B12 90 CE 40 04      [ 2] 4404         ldw y,APP_CP  
      009B16 90 B3 1A         [ 2] 4405         cpw y,UCP   
      009B19 24 06            [ 1] 4406         jruge 3$ 
      009B1B CD 9C 07         [ 4] 4407         call UPDATCP
      009B1E 90 BE 1A         [ 2] 4408         ldw y,UCP   
      009B21                       4409 3$:
      009B21 90 BF 1A         [ 2] 4410         ldw UCP,y                 
                                   4411 ; update UVP with APP_VP  
                                   4412 ; if APP_VP>UVP else do the opposite 
      009B24 90 CE 40 06      [ 2] 4413         ldw y,APP_VP 
      009B28 90 B3 18         [ 2] 4414         cpw y,UVP 
      009B2B 22 05            [ 1] 4415         jrugt 4$
      009B2D CD 9C 1E         [ 4] 4416         call UPDATVP 
      009B30 20 03            [ 2] 4417         jra 6$
      009B32                       4418 4$: ; update UVP with APP_VP 
      009B32 90 BF 18         [ 2] 4419         ldw UVP,y 
      009B35                       4420 6$:      
      009B35 CD 94 82         [ 4] 4421         CALL     PRESE   ;initialize data stack and TIB
      009B38 CD 9A CC         [ 4] 4422         CALL     TBOOT
      009B3B CD 8C CA         [ 4] 4423         CALL     ATEXE   ;application boot
      009B3E CD 97 66         [ 4] 4424         CALL     OVERT
      009B41 CC 94 9F         [ 2] 4425         JP     QUIT    ;start interpretation
                                   4426 
                                   4427 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



                                   4428         .include "flash.asm"
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
      009B44 9A D3                   31     .word LINK 
                           001AC6    32     LINK=.
      009B46 03                      33     .byte 3 
      009B47 46 50 21                34     .ascii "FP!"
      009B4A                         35 FPSTOR:
      009B4A 90 93            [ 1]   36     ldw y,x
      009B4C 90 FE            [ 2]   37     ldw y,(y)
      009B4E 90 9F            [ 1]   38     ld a,yl 
      009B50 B7 34            [ 1]   39     ld FPTR,a 
      009B52 1C 00 02         [ 2]   40     addw x,#CELLL 
      009B55 90 93            [ 1]   41     ldw y,x 
      009B57 90 FE            [ 2]   42     ldw y,(y)
      009B59 90 BF 35         [ 2]   43     ldw PTR16,y
      009B5C 1C 00 02         [ 2]   44     addw x,#CELLL 
      009B5F 81               [ 4]   45     ret 
                                     46 
                                     47 ;-----------------------------------
                                     48 ; return EEPROM base address 
                                     49 ; as a double 
                                     50 ;  EEPROM  ( -- ud )
                                     51 ;-----------------------------------
      009B60 9B 46                   52     .word LINK 
                           001AE2    53 LINK=.
      009B62 06                      54     .byte 6 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



      009B63 45 45 50 52 4F 4D       55     .ascii "EEPROM"
      009B69                         56 EEPROM: 
      009B69 90 AE 40 00      [ 2]   57     ldw y,#EEPROM_BASE
      009B6D 1D 00 04         [ 2]   58     subw x,#2*CELLL 
      009B70 EF 02            [ 2]   59     ldw (2,x),y 
      009B72 90 5F            [ 1]   60     clrw y 
      009B74 FF               [ 2]   61     ldw (x),y 
      009B75 81               [ 4]   62     ret
                                     63 
                                     64 ;---------------------------------
                                     65 ; return APP_LAST pointer as double
                                     66 ; EEP-LAST ( -- ud )
                                     67 ;---------------------------------
      009B76 9B 62                   68 	.word LINK 
                           001AF8    69 	LINK=.
      009B78 08                      70 	.byte 8 
      009B79 45 45 50 2D 4C 41 53    71 	.ascii "EEP-LAST"
             54
      009B81                         72 EEPLAST:
      009B81 1D 00 04         [ 2]   73 	subw x,#2*CELLL 
      009B84 90 AE 40 00      [ 2]   74 	ldw y,#APP_LAST 
      009B88 EF 02            [ 2]   75 	ldw (2,x),y 
      009B8A 90 5F            [ 1]   76 	clrw y 
      009B8C FF               [ 2]   77 	ldw (x),y 
      009B8D 81               [ 4]   78 	ret 
                                     79 
                                     80 ;----------------------------------
                                     81 ; return APP_RUN pointer as double	
                                     82 ; EEP-RUN ( -- ud )
                                     83 ;-----------------------------------
      009B8E 9B 78                   84 	.word LINK 
                           001B10    85 	LINK=.
      009B90 07                      86 	.byte 7
      009B91 45 45 50 2D 52 55 4E    87 	.ascii "EEP-RUN"
      009B98                         88 EEPRUN:
      009B98 1D 00 04         [ 2]   89 	subw x,#2*CELLL 
      009B9B 90 AE 40 02      [ 2]   90 	ldw y,#APP_RUN 
      009B9F EF 02            [ 2]   91 	ldw (2,x),y 
      009BA1 90 5F            [ 1]   92 	clrw y 
      009BA3 FF               [ 2]   93 	ldw (x),y 
      009BA4 81               [ 4]   94 	ret 
                                     95 
                                     96 ;------------------------------------
                                     97 ; return APP_CP pointer as double 
                                     98 ; EEP-CP ( -- ud )
                                     99 ;------------------------------------
      009BA5 9B 90                  100 	.word LINK
                           001B27   101 	LINK=.
      009BA7 06                     102 	.byte 6 
      009BA8 45 45 50 2D 43 50      103 	.ascii "EEP-CP"
      009BAE                        104 EEPCP:
      009BAE 1D 00 04         [ 2]  105 	subw x,#2*CELLL 
      009BB1 90 AE 40 04      [ 2]  106 	ldw y,#APP_CP  
      009BB5 EF 02            [ 2]  107 	ldw (2,x),y 
      009BB7 90 5F            [ 1]  108 	clrw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



      009BB9 FF               [ 2]  109 	ldw (x),y 
      009BBA 81               [ 4]  110 	ret 
                                    111 
                                    112 ;------------------------------------
                                    113 ; return APP_VP pointer as double 
                                    114 ; EEP-VP ( -- ud )
                                    115 ;-------------------------------------
      009BBB 9B A7                  116 	.word LINK
                           001B3D   117 	LINK=.
      009BBD 06                     118 	.byte 6
      009BBE 45 45 50 2D 56 50      119 	.ascii "EEP-VP"
      009BC4                        120 EEPVP:
      009BC4 1D 00 04         [ 2]  121 	subw x,#2*CELLL 
      009BC7 90 AE 40 06      [ 2]  122 	ldw y,#APP_VP  
      009BCB EF 02            [ 2]  123 	ldw (2,x),y 
      009BCD 90 5F            [ 1]  124 	clrw y 
      009BCF FF               [ 2]  125 	ldw (x),y 
      009BD0 81               [ 4]  126 	ret 
                                    127 
                                    128 ;----------------------------------
                                    129 ; update APP_LAST with LAST 
                                    130 ; UPDAT-LAST ( -- )
                                    131 ;----------------------------------
      009BD1 9B BD                  132 	.word LINK 
                           001B53   133 	LINK=.
      009BD3 0A                     134 	.byte 10
      009BD4 55 50 44 41 54 2D 4C   135 	.ascii "UPDAT-LAST"
             41 53 54
      009BDE                        136 UPDATLAST:
      009BDE CD 87 7D         [ 4]  137 	call LAST
      009BE1 CD 85 63         [ 4]  138 	call AT  
      009BE4 CD 9B 81         [ 4]  139 	call EEPLAST
      009BE7 CC 9D D4         [ 2]  140 	jp EESTORE 
                                    141 
                                    142 ;---------------------------------
                                    143 ; update APP_RUN 
                                    144 ; UPDAT-RUN ( a -- )
                                    145 ;---------------------------------
      009BEA 9B D3                  146 	.word LINK
                           001B6C   147 	LINK=.
      009BEC 09                     148 	.byte 9
      009BED 55 50 44 41 54 2D 52   149 	.ascii "UPDAT-RUN"
             55 4E
      009BF6                        150 UPDATRUN:
      009BF6 CD 9B 98         [ 4]  151 	call EEPRUN
      009BF9 CC 9D D4         [ 2]  152 	jp EESTORE 
                                    153 	
                                    154 ;---------------------------------
                                    155 ; update APP_CP with CP 
                                    156 ; UPDAT-CP ( -- )
                                    157 ;---------------------------------
      009BFC 9B EC                  158 	.word LINK 
                           001B7E   159 	LINK=.
      009BFE 08                     160 	.byte 8 
      009BFF 55 50 44 41 54 2D 43   161 	.ascii "UPDAT-CP"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal  50-Bits]



             50
      009C07                        162 UPDATCP:
      009C07 CD 87 6D         [ 4]  163 	call CPP 
      009C0A CD 85 63         [ 4]  164 	call AT 
      009C0D CD 9B AE         [ 4]  165 	call EEPCP 
      009C10 CC 9D D4         [ 2]  166 	jp EESTORE 
                                    167 
                                    168 ;----------------------------------
                                    169 ; update APP_VP with VP 
                                    170 ; UPDAT-VP ( -- )
                                    171 ;----------------------------------
      009C13 9B FE                  172 	.word LINK
                           001B95   173 	LINK=.
      009C15 08                     174 	.byte 8 
      009C16 55 50 44 41 54 2D 56   175 	.ascii "UPDAT-VP" 
             50
      009C1E                        176 UPDATVP:
      009C1E CD 87 5F         [ 4]  177 	call VPP 
      009C21 CD 85 63         [ 4]  178 	call AT
      009C24 CD 9B C4         [ 4]  179 	call EEPVP 
      009C27 CC 9D D4         [ 2]  180 	jp EESTORE
                                    181 	
                           000001   182 .if NUCLEO
                                    183 ;----------------------------------
                                    184 ; fetch integer at address over 65535
                                    185 ;  F@   ( ud -- n )
                                    186 ;----------------------------------
      009C2A 9C 15                  187     .word LINK 
                           001BAC   188 LINK=.
      009C2C 02                     189     .byte 2
      009C2D 46 40                  190     .ascii "F@"
      009C2F                        191 FARAT:
      009C2F CD 9B 4A         [ 4]  192     call FPSTOR
      009C32 CC 9C F7         [ 2]  193 	jp EE_READ 
                                    194 
                                    195 
                                    196 ;-------------------------------------
                                    197 ; fetch C at address over 65535 
                                    198 ; FC@ ( ud -- c)
                                    199 ;-------------------------------------
      009C35 9C 2C                  200     .word LINK
                           001BB7   201     LINK=.
      009C37 03                     202     .byte 3 
      009C38 46 43 40               203     .ascii "FC@" 
      009C3B                        204 FARCAT:
      009C3B CD 9B 4A         [ 4]  205     call FPSTOR
      009C3E CC 9D 19         [ 2]  206 	jp EE_CREAD  
                                    207 .endif ; NUCLEO 
                                    208 
                                    209 ;----------------------------------
                                    210 ; UNLOCK EEPROM/OPT for writing/erasing
                                    211 ; wait endlessly for FLASH_IAPSR_DUL bit.
                                    212 ;  UNLKEE   ( -- )
                                    213 ;----------------------------------
      009C41 9C 37                  214     .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



                           001BC3   215 LINK=.
      009C43 06                     216     .byte 6 
      009C44 55 4E 4C 4B 45 45      217     .ascii "UNLKEE"
      009C4A                        218 UNLKEE:
      009C4A 35 00 50 5B      [ 1]  219 	mov FLASH_CR2,#0 
      009C4E 35 FF 50 5C      [ 1]  220 	mov FLASH_NCR2,#0xFF 
      009C52 35 AE 50 64      [ 1]  221 	mov FLASH_DUKR,#FLASH_DUKR_KEY1
      009C56 35 56 50 64      [ 1]  222     mov FLASH_DUKR,#FLASH_DUKR_KEY2
      009C5A 72 07 50 5F FB   [ 2]  223 	btjf FLASH_IAPSR,#FLASH_IAPSR_DUL,.
      009C5F 81               [ 4]  224 	ret
                                    225 
                                    226 ;----------------------------------
                                    227 ; UNLOCK FLASH for writing/erasing
                                    228 ; wait endlessly for FLASH_IAPSR_PUL bit.
                                    229 ; UNLKFL  ( -- )
                                    230 ;----------------------------------
      009C60 9C 43                  231     .word LINK 
                           001BE2   232 LINK=. 
      009C62 06                     233     .byte 6 
      009C63 55 4E 4C 4B 46 4C      234     .ascii "UNLKFL"    
      009C69                        235 UNLKFL:
      009C69 35 00 50 5B      [ 1]  236 	mov FLASH_CR2,#0 
      009C6D 35 FF 50 5C      [ 1]  237 	mov FLASH_NCR2,#0xFF 
      009C71 35 56 50 62      [ 1]  238 	mov FLASH_PUKR,#FLASH_PUKR_KEY1
      009C75 35 AE 50 62      [ 1]  239 	mov FLASH_PUKR,#FLASH_PUKR_KEY2
      009C79 72 03 50 5F FB   [ 2]  240 	btjf FLASH_IAPSR,#FLASH_IAPSR_PUL,.
      009C7E 81               [ 4]  241 	ret
                                    242 
                                    243 ;-----------------------------
                                    244 ; UNLOCK FLASH or EEPROM 
                                    245 ; according to FPTR address 
                                    246 ;  UNLOCK ( -- )
                                    247 ;-----------------------------
      009C7F 9C 62                  248 	.word LINK 
                           001C01   249 	LINK=.
      009C81 06                     250 	.byte 6
      009C82 55 4E 4C 4F 43 4B      251 	.ascii "UNLOCK"
      009C88                        252 UNLOCK:
                                    253 ; put addr[15:0] in Y, for bounds check.
      009C88 90 BE 35         [ 2]  254 	ldw y,PTR16   ; Y=addr15:0
                                    255 ; check addr[23:16], if <> 0 then it is extened flash memory
      009C8B 3D 34            [ 1]  256 	tnz FPTR 
      009C8D 26 16            [ 1]  257 	jrne 4$
      009C8F 90 A3 80 00      [ 2]  258     cpw y,#FLASH_BASE
      009C93 24 10            [ 1]  259     jruge 4$
      009C95 90 A3 40 00      [ 2]  260 	cpw y,#EEPROM_BASE  
      009C99 25 0D            [ 1]  261     jrult 9$
      009C9B 90 A3 48 7F      [ 2]  262 	cpw y,#OPTION_END 
      009C9F 22 07            [ 1]  263 	jrugt 9$
      009CA1 CD 9C 4A         [ 4]  264 	call UNLKEE
      009CA4 81               [ 4]  265 	ret 
      009CA5 CD 9C 69         [ 4]  266 4$: call UNLKFL
      009CA8 81               [ 4]  267 9$: ret 
                                    268 
                                    269 ;-------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



                                    270 ; LOCK write access to 
                                    271 ; FLASH and EEPROM 
                                    272 ; LOCK ( -- )
                                    273 ;-------------------------
      009CA9 9C 81                  274 	.word LINK 
                           001C2B   275 	LINK=.
      009CAB 04                     276 	.byte 4 
      009CAC 4C 4F 43 4B            277 	.ascii "LOCK" 
      009CB0                        278 LOCK: 
      009CB0 72 13 50 5F      [ 1]  279 	bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      009CB4 72 17 50 5F      [ 1]  280 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      009CB8 81               [ 4]  281 	ret 
                                    282 
                                    283 ;-------------------------
                                    284 ; increment FPTR 
                                    285 ; INC-FPTR ( -- )
                                    286 ;-------------------------
      009CB9 9C AB                  287 	.word LINK 
                           001C3B   288 	LINK=. 
      009CBB 08                     289 	.byte 8 
      009CBC 49 4E 43 2D 46 50 54   290 	.ascii "INC-FPTR" 
             52
      009CC4                        291 INC_FPTR:
      009CC4 3C 36            [ 1]  292 	inc PTR8 
      009CC6 26 0C            [ 1]  293 	jrne 1$
      009CC8 90 89            [ 2]  294 	pushw y 
      009CCA 90 BE 34         [ 2]  295 	ldw y,FPTR 
      009CCD 90 5C            [ 1]  296 	incw y 
      009CCF 90 BF 34         [ 2]  297 	ldw FPTR,y
      009CD2 90 85            [ 2]  298 	popw y  
      009CD4 81               [ 4]  299 1$: ret 
                                    300 
                                    301 ;------------------------------
                                    302 ; add u to FPTR 
                                    303 ; PTR+ ( u -- )
                                    304 ;------------------------------
      009CD5 9C BB                  305 	.word LINK 
                           001C57   306 	LINK=.
      009CD7 04                     307 	.byte 4 
      009CD8 50 54 52 2B            308 	.ascii "PTR+"
      009CDC                        309 PTRPLUS:
      009CDC 90 93            [ 1]  310 	ldw y,x 
      009CDE 1C 00 02         [ 2]  311 	addw x,#CELLL 
      009CE1 72 B9 00 35      [ 2]  312 	addw y,PTR16 
      009CE5 90 BF 35         [ 2]  313 	ldw PTR16,y  
      009CE8 24 02            [ 1]  314 	jrnc 1$
      009CEA 3C 34            [ 1]  315 	inc FPTR 
      009CEC 81               [ 4]  316 1$: ret 
                                    317 
                                    318 ;---------------------------------
                                    319 ; read word at address pointed FPTR
                                    320 ; increment FPTR 
                                    321 ; EE-READ ( -- w )
                                    322 ;------------------------------------
      009CED 9C D7                  323 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]



                           001C6F   324 	LINK=.
      009CEF 07                     325 	.byte 7 
      009CF0 45 45 2D 52 45 41 44   326 	.ascii "EE-READ"
      009CF7                        327 EE_READ:
      009CF7 1D 00 02         [ 2]  328 	subw x,#CELLL 
      009CFA 92 BC 00 34      [ 5]  329 	ldf a,[FPTR]
      009CFE 90 95            [ 1]  330 	ld yh,a 
      009D00 CD 9C C4         [ 4]  331 	call INC_FPTR 
      009D03 92 BC 00 34      [ 5]  332 	ldf a,[FPTR]
      009D07 CD 9C C4         [ 4]  333 	call INC_FPTR 
      009D0A 90 97            [ 1]  334 	ld yl,a 
      009D0C FF               [ 2]  335 	ldw (x),y 
      009D0D 81               [ 4]  336 	ret 
                                    337 
                                    338 ;---------------------------------------
                                    339 ; Read byte at address pointed by FPTR 
                                    340 ; EE-CREAD ( -- c )
                                    341 ;---------------------------------------
      009D0E 9C EF                  342 	.word LINK 
                           001C90   343 	LINK=.
      009D10 08                     344 	.byte 8
      009D11 45 45 2D 43 52 45 41   345 	.ascii "EE-CREAD" 
             44
      009D19                        346 EE_CREAD:
      009D19 1D 00 02         [ 2]  347 	subw x,#CELLL 
      009D1C 92 BC 00 34      [ 5]  348 	ldf a,[FPTR]	
      009D20 CD 9C C4         [ 4]  349 	call INC_FPTR
      009D23 90 5F            [ 1]  350 	clrw y 
      009D25 90 97            [ 1]  351 	ld yl,a 
      009D27 FF               [ 2]  352 	ldw (x),y 
      009D28 81               [ 4]  353 	ret 
                                    354 
                                    355 ;----------------------------
                                    356 ; write a byte at address pointed 
                                    357 ; by FPTR and increment FPTR.
                                    358 ; Expect pointer already initialized 
                                    359 ; and memory unlocked 
                                    360 ; WR-BYTE ( c -- )
                                    361 ;----------------------------
      009D29 9D 10                  362 	.word LINK 
                           001CAB   363 	LINK=. 
      009D2B 07                     364 	.byte 7 
      009D2C 57 52 2D 42 59 54 45   365 	.ascii "WR-BYTE" 
                                    366 
      009D33                        367 WR_BYTE:
      009D33 CD 84 E3         [ 4]  368 	call FC_XOFF
      009D36 90 93            [ 1]  369 	ldw y,x 
      009D38 90 FE            [ 2]  370 	ldw y,(y)
      009D3A 1C 00 02         [ 2]  371 	addw x,#CELLL 
      009D3D 90 9F            [ 1]  372 	ld a,yl
      009D3F 92 BD 00 34      [ 4]  373 	ldf [FPTR],a
      009D43 72 05 50 5F FB   [ 2]  374 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009D48 CD 84 CD         [ 4]  375 	call FC_XON
      009D4B CC 9C C4         [ 2]  376 	jp INC_FPTR 
                                    377 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]



                                    378 ;---------------------------------------
                                    379 ; write a word at address pointed 
                                    380 ; by FPTR and increment FPTR 
                                    381 ; Expect pointer already initialzed 
                                    382 ; and memory unlocked 
                                    383 ; WR-WORD ( w -- )
                                    384 ;---------------------------------------
      009D4E 9D 2B                  385 	.word LINK 
                           001CD0   386 	LINK=.
      009D50 07                     387 	.byte 7 
      009D51 57 52 2D 57 4F 52 44   388 	.ascii "WR-WORD" 
      009D58                        389 WR_WORD:
      009D58 CD 84 E3         [ 4]  390 	call FC_XOFF
      009D5B 90 93            [ 1]  391 	ldw y,x
      009D5D 90 FE            [ 2]  392 	ldw y,(y)
      009D5F 1C 00 02         [ 2]  393 	addw x,#CELLL 
      009D62 90 9E            [ 1]  394 	ld a,yh 
      009D64 92 BD 00 34      [ 4]  395 	ldf [FPTR],a
      009D68 72 05 50 5F FB   [ 2]  396 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009D6D CD 9C C4         [ 4]  397 	call INC_FPTR 
      009D70 90 9F            [ 1]  398 	ld a,yl 
      009D72 92 BD 00 34      [ 4]  399 	ldf [FPTR],a
      009D76 72 05 50 5F FB   [ 2]  400 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009D7B CD 84 CD         [ 4]  401 	call FC_XON
      009D7E CC 9C C4         [ 2]  402 	jp INC_FPTR 
                                    403 
                                    404 
                                    405 ;---------------------------------------
                                    406 ; write a byte to FLASH or EEPROM/OPTION  
                                    407 ; EEC!  (c ud -- )
                                    408 ;---------------------------------------
      009D81 9D 50                  409     .word LINK 
                           001D03   410 	LINK=.
      009D83 04                     411     .byte 4 
      009D84 45 45 43 21            412     .ascii "EEC!"
                                    413 	; local variables 
                           000001   414 	BTW = 1   ; byte to write offset on stack
                           000002   415     OPT = 2 
                           000002   416 	VSIZE = 2
      009D88                        417 EECSTORE:
      009D88 52 02            [ 2]  418 	sub sp,#VSIZE
      009D8A CD 9B 4A         [ 4]  419     call FPSTOR
      009D8D E6 01            [ 1]  420 	ld a,(1,x)
      009D8F 43               [ 1]  421 	cpl a 
      009D90 6B 01            [ 1]  422 	ld (BTW,sp),a ; byte to write 
      009D92 0F 02            [ 1]  423 	clr (OPT,sp)  ; OPTION flag
      009D94 CD 9C 88         [ 4]  424 	call UNLOCK 
                                    425 	; check if option
      009D97 3D 34            [ 1]  426 	tnz FPTR 
      009D99 26 19            [ 1]  427 	jrne 2$
      009D9B 90 BE 35         [ 2]  428 	ldw y,PTR16 
      009D9E 90 A3 48 00      [ 2]  429 	cpw y,#OPTION_BASE
      009DA2 2B 10            [ 1]  430 	jrmi 2$
      009DA4 90 A3 48 80      [ 2]  431 	cpw y,#OPTION_END+1
      009DA8 2A 0A            [ 1]  432 	jrpl 2$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]



      009DAA 03 02            [ 1]  433 	cpl (OPT,sp)
                                    434 	; OPTION WRITE require this UNLOCK 
      009DAC 72 1E 50 5B      [ 1]  435     bset FLASH_CR2,#FLASH_CR2_OPT
      009DB0 72 1F 50 5C      [ 1]  436     bres FLASH_NCR2,#FLASH_CR2_OPT 
      009DB4                        437 2$: 
      009DB4 CD 9D 33         [ 4]  438 	call WR_BYTE 	
      009DB7 0D 02            [ 1]  439 	tnz (OPT,sp)
      009DB9 27 0D            [ 1]  440 	jreq 3$ 
      009DBB 7B 01            [ 1]  441     ld a,(BTW,sp)
      009DBD 90 5F            [ 1]  442     clrw y
      009DBF 90 97            [ 1]  443 	ld yl,a 
      009DC1 1D 00 02         [ 2]  444 	subw x,#CELLL 
      009DC4 FF               [ 2]  445 	ldw (x),y 
      009DC5 CD 9D 33         [ 4]  446 	call WR_BYTE
      009DC8                        447 3$: 
      009DC8 CD 9C B0         [ 4]  448 	call LOCK 
      009DCB 5B 02            [ 2]  449 	addw sp,#VSIZE 
      009DCD 81               [ 4]  450     ret
                                    451 
                                    452 ;------------------------------
                                    453 ; write integer in FLASH|EEPROM
                                    454 ; EE! ( n ud -- )
                                    455 ;------------------------------
      009DCE 9D 83                  456 	.word LINK 
                           001D50   457 	LINK=.
      009DD0 03                     458 	.byte 3 
      009DD1 45 45 21               459 	.ascii "EE!"
      009DD4                        460 EESTORE:
      009DD4 CD 9B 4A         [ 4]  461 	call FPSTOR 
      009DD7 CD 9C 88         [ 4]  462 	call UNLOCK 
      009DDA 90 93            [ 1]  463 	ldw y,x 
      009DDC 90 FE            [ 2]  464 	ldw y,(y)
      009DDE 90 89            [ 2]  465 	pushw y 
      009DE0 90 5E            [ 1]  466 	swapw y 
      009DE2 FF               [ 2]  467 	ldw (x),y 
      009DE3 CD 9D 33         [ 4]  468 	call WR_BYTE 
      009DE6 90 85            [ 2]  469 	popw y 
      009DE8 1D 00 02         [ 2]  470 	subw x,#CELLL
      009DEB FF               [ 2]  471 	ldw (x),y 
      009DEC CD 9D 33         [ 4]  472 	call WR_BYTE
      009DEF CC 9C B0         [ 2]  473 	jp LOCK 
                                    474 
                                    475 
                                    476 ;----------------------------
                                    477 ; Erase flash memory row 
                                    478 ; stm8s208 as 128 bytes rows
                                    479 ; ROW-ERASE ( ud -- )
                                    480 ;----------------------------
      009DF2 9D D0                  481 	.word LINK 
                           001D74   482 	LINK=. 
      009DF4 09                     483 	.byte 9 
      009DF5 52 4F 57 2D 45 52 41   484 	.ascii "ROW-ERASE" 
             53 45
      009DFE                        485 row_erase:
      009DFE CD 84 E3         [ 4]  486 	call FC_XOFF
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]



      009E01 CD 9B 4A         [ 4]  487 	call FPSTOR
                                    488 ;code must be execute from RAM 
                                    489 ;copy routine to PAD 
      009E04 1D 00 02         [ 2]  490 	subw x,#CELLL 
      009E07 90 AE 9E 57      [ 2]  491 	ldw y,#row_erase_proc
      009E0B FF               [ 2]  492 	ldw (x),y 
      009E0C CD 8C A5         [ 4]  493 	call PAD 
      009E0F 90 AE 9E 7E      [ 2]  494 	ldw y,#row_erase_proc_end 
      009E13 72 A2 9E 57      [ 2]  495 	subw y,#row_erase_proc
      009E17 1D 00 02         [ 2]  496 	subw x,#CELLL 
      009E1A FF               [ 2]  497 	ldw (x),y 
      009E1B CD 8C E1         [ 4]  498 	call CMOVE 
      009E1E                        499 block_erase:
      009E1E 90 BE 35         [ 2]  500 	ldw y,FPTR+1
      009E21 90 A3 B3 00      [ 2]  501 	cpw y,#app_space 
      009E25 2A 19            [ 1]  502 	jrpl erase_flash 
                                    503 ; erase EEPROM block
      009E27 90 A3 40 00      [ 2]  504 	cpw y,#EEPROM_BASE 
      009E2B 24 04            [ 1]  505 	jruge 1$
      009E2D CD 84 CD         [ 4]  506 	call FC_XON
      009E30 81               [ 4]  507 	ret ; bad address 
      009E31 90 A3 47 FF      [ 2]  508 1$: cpw y,#EEPROM_END 
      009E35 23 04            [ 2]  509 	jrule 2$ 
      009E37 CD 84 CD         [ 4]  510 	call FC_XON
      009E3A 81               [ 4]  511 	ret ; bad address 
      009E3B                        512 2$:	
      009E3B CD 9C 4A         [ 4]  513 	call UNLKEE 
      009E3E 20 03            [ 2]  514 	jra proceed_erase
                                    515 ; erase flash block:
      009E40                        516 erase_flash:
      009E40 CD 9C 69         [ 4]  517 	call UNLKFL 
      009E43                        518 proceed_erase:
      009E43 CD 8C A5         [ 4]  519 	call PAD 
      009E46 90 93            [ 1]  520 	ldw y,x
      009E48 90 FE            [ 2]  521 	ldw y,(y)
      009E4A 1C 00 02         [ 2]  522 	addw x,#CELLL  
      009E4D 90 FD            [ 4]  523 	call (y) 
      009E4F 72 17 50 5F      [ 1]  524 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      009E53 CD 84 CD         [ 4]  525 	call FC_XON
      009E56 81               [ 4]  526 	ret 
                                    527 
                                    528 ; this routine is to be copied to PAD 
      009E57                        529 row_erase_proc:
      009E57 35 20 50 5B      [ 1]  530 	mov FLASH_CR2,#(1<<FLASH_CR2_ERASE) 
      009E5B 35 DF 50 5C      [ 1]  531 	mov FLASH_NCR2,#~(1<<FLASH_CR2_ERASE)
      009E5F 4F               [ 1]  532 	clr a 
      009E60 90 5F            [ 1]  533 	clrw y 
      009E62 91 A7 00 34      [ 1]  534 	ldf ([FPTR],y),a
      009E66 90 5C            [ 1]  535     incw y
      009E68 91 A7 00 34      [ 1]  536 	ldf ([FPTR],y),a
      009E6C 90 5C            [ 1]  537     incw y
      009E6E 91 A7 00 34      [ 1]  538 	ldf ([FPTR],y),a
      009E72 90 5C            [ 1]  539     incw y
      009E74 91 A7 00 34      [ 1]  540 	ldf ([FPTR],y),a
      009E78 72 05 50 5F FB   [ 2]  541 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]



      009E7D 81               [ 4]  542 	ret
      009E7E                        543 row_erase_proc_end:
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
      009E7E                        556 copy_buffer:
      009E7E 4B 80            [ 1]  557 	push #BLOCK_SIZE  
                                    558 ;enable block programming 
      009E80 72 10 50 5B      [ 1]  559 	bset FLASH_CR2,#FLASH_CR2_PRG 
      009E84 72 11 50 5C      [ 1]  560 	bres FLASH_NCR2,#FLASH_CR2_PRG
      009E88 90 5F            [ 1]  561 	clrw y
      009E8A F6               [ 1]  562 1$:	ld a,(x)
      009E8B 91 A7 00 34      [ 1]  563 	ldf ([FPTR],y),a
      009E8F 5C               [ 1]  564 	incw x 
      009E90 90 5C            [ 1]  565 	incw y 
      009E92 0A 01            [ 1]  566 	dec (BCNT,sp)
      009E94 26 F4            [ 1]  567 	jrne 1$
                                    568 ; wait EOP bit 
      009E96 72 05 50 5F FB   [ 2]  569 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. 
      009E9B 84               [ 1]  570 	pop a ; remove BCNT from stack 
      009E9C 81               [ 4]  571 	ret 
      009E9D                        572 copy_buffer_end:
                                    573 
                                    574 ;-------------------------
                                    575 ; move program_row to RAM 
                                    576 ; in TIB 
                                    577 ;------------------------
      009E9D                        578 copy_prog_to_ram:
      009E9D 1D 00 06         [ 2]  579 	subw x,#6
      009EA0 90 AE 9E 7E      [ 2]  580 	ldw y,#copy_buffer 
      009EA4 EF 04            [ 2]  581 	ldw (4,x),y 
      009EA6 90 AE 17 00      [ 2]  582 	ldw y,#TIBBASE
      009EAA EF 02            [ 2]  583 	ldw (2,x),y 
      009EAC 90 AE 9E 9D      [ 2]  584 	ldw y,#copy_buffer_end 
      009EB0 72 A2 9E 7E      [ 2]  585 	subw y,#copy_buffer  
      009EB4 FF               [ 2]  586 	ldw (x),y 
      009EB5 CD 8C E1         [ 4]  587 	call CMOVE 
      009EB8 81               [ 4]  588 	ret 
                                    589 
                                    590 
                                    591 ;-----------------------------
                                    592 ; write a row in FLASH/EEPROM 
                                    593 ; WR-ROW ( a ud -- )
                                    594 ; a -> address 128 byte buffer to write 
                                    595 ; ud ->  row address in FLASH|EEPROM 
                                    596 ;-----------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
Hexadecimal [24-Bits]



      009EB9 9D F4                  597 	.word LINK 
                           001E3B   598 	LINK=.
      009EBB 06                     599 	.byte 6 
      009EBC 57 52 2D 52 4F 57      600 	.ascii "WR-ROW"
      009EC2                        601 write_row:
      009EC2 CD 84 E3         [ 4]  602 	call FC_XOFF
      009EC5 CD 9B 4A         [ 4]  603 	call FPSTOR
                                    604 ; align to FLASH block 
      009EC8 A6 80            [ 1]  605 	ld a,#0x80 
      009ECA B4 36            [ 1]  606 	and a,PTR8 
      009ECC B7 36            [ 1]  607 	ld PTR8,a  
      009ECE CD 9E 9D         [ 4]  608 	call copy_prog_to_ram
      009ED1 CD 9C 88         [ 4]  609 	call UNLOCK
      009ED4 90 93            [ 1]  610 	ldw y,x 
      009ED6 90 FE            [ 2]  611 	ldw y,(y)
      009ED8 1C 00 02         [ 2]  612 	addw x,#CELLL 
      009EDB 89               [ 2]  613 	pushw x 
      009EDC 93               [ 1]  614 	ldw x,y ; buffer address in x 
      009EDD CD 17 00         [ 4]  615 	call TIBBASE
      009EE0 CD 9C B0         [ 4]  616 	call LOCK
      009EE3 85               [ 2]  617 	popw x 
      009EE4 CD 84 CD         [ 4]  618 	call FC_XON 
      009EE7 81               [ 4]  619 	ret 
                                    620 
                                    621 ;-------------------------------------
                                    622 ; change value of OPTION register 
                                    623 ; SET-OPT (c n -- ) 
                                    624 ; c new value.
                                    625 ; n OPT  number {1..7}
                                    626 ;--------------------------------------
      009EE8 9E BB                  627 		.word LINK 
                           001E6A   628 		LINK=.
      009EEA 07                     629 		.byte 7 
      009EEB 53 45 54 2D 4F 50 54   630 		.ascii "SET-OPT" 
      009EF2                        631 set_option: 
      009EF2 90 93            [ 1]  632 		ldw y,x 
      009EF4 90 FE            [ 2]  633 		ldw y,(y)
      009EF6 27 06            [ 1]  634 		jreq 1$
      009EF8 90 A3 00 07      [ 2]  635 		cpw y,#7 
      009EFC 23 04            [ 2]  636 		jrule 2$ 
                                    637 ; invalid OPTION number 		
      009EFE 1C 00 04         [ 2]  638 1$:		addw x,#2*CELLL
      009F01 81               [ 4]  639 		ret
      009F02 90 58            [ 2]  640 2$:		sllw y 
      009F04 72 A9 47 FF      [ 2]  641 		addw y,#OPTION_BASE-1
      009F08 FF               [ 2]  642 		ldw (x),y 
      009F09 1D 00 02         [ 2]  643 		subw x,#CELLL 
      009F0C 90 5F            [ 1]  644 		clrw y 
      009F0E FF               [ 2]  645 		ldw (x),y 
      009F0F CD 9D 88         [ 4]  646 		call EECSTORE
      009F12 81               [ 4]  647 		ret 
                                    648 
                                    649 
                                    650 
                                    651 ;--------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
Hexadecimal [24-Bits]



                                    652 ; reset system to its original state 
                                    653 ; before any user modification
                                    654 ; PRISTINE ( -- )
                                    655 ;-------------------------------------
      009F13 9E EA                  656 	.word LINK  
                           001E95   657 	LINK=.
      009F15 08                     658 	.byte 8 
      009F16 50 52 49 53 54 49 4E   659 	.ascii "PRISTINE"
             45
      009F1E                        660 pristine:
                                    661 ;;; erase EEPROM
      009F1E CD 9B 69         [ 4]  662 	call EEPROM 
      009F21 CD 88 18         [ 4]  663 1$:	call DDUP 
      009F24 CD 9D FE         [ 4]  664 	call row_erase
      009F27 90 93            [ 1]  665 	ldw y,x 
      009F29 90 EE 02         [ 2]  666 	ldw y,(2,y)
      009F2C 72 A9 00 80      [ 2]  667 	addw y,#BLOCK_SIZE
      009F30 EF 02            [ 2]  668 	ldw (2,x),y
      009F32 90 A3 48 00      [ 2]  669 	cpw y,#OPTION_BASE 
      009F36 25 E9            [ 1]  670 	jrult 1$
                                    671 ;;; reset OPTION to default values
      009F38 90 AE 00 01      [ 2]  672 	ldw y,#1 ; OPT1 
      009F3C FF               [ 2]  673 2$:	ldw (x),y   
      009F3D 90 5F            [ 1]  674 	clrw y 
      009F3F EF 02            [ 2]  675 	ldw (2,x),y  ; ( 0 1 -- ) 
      009F41 CD 88 18         [ 4]  676 	call DDUP    ; ( 0 1 0 1 -- )  
      009F44 CD 9E F2         [ 4]  677 	call set_option
      009F47 90 93            [ 1]  678 	ldw y,x 
      009F49 90 FE            [ 2]  679 	ldw y,(y)
      009F4B 90 5C            [ 1]  680 	incw y  ; next OPTION 
      009F4D 90 A3 00 08      [ 2]  681 	cpw y,#8 
      009F51 25 E9            [ 1]  682 	jrult 2$
                                    683 ;;; erase first row of app_space 	
      009F53 90 AE B3 00      [ 2]  684 	ldw y,#app_space
      009F57 EF 02            [ 2]  685 	ldw (2,x),y  
      009F59 90 5F            [ 1]  686 	clrw y 
      009F5B FF               [ 2]  687 	ldw (x),y ; ( app_space 0 -- )
      009F5C CD 9D FE         [ 4]  688 	call row_erase 
                                    689 ; reset interrupt vectors 
      009F5F 1D 00 02         [ 2]  690 	subw x,#CELLL 
      009F62 90 5F            [ 1]  691 	clrw y  
      009F64 FF               [ 2]  692 4$:	ldw (x),y  ; ( n -- ) int# 
      009F65 CD 86 08         [ 4]  693 	call DUPP  
      009F68 CD 9F 85         [ 4]  694 	call reset_vector
      009F6B 90 93            [ 1]  695 	ldw y,x 
      009F6D 90 FE            [ 2]  696 	ldw y,(y)
      009F6F 90 5C            [ 1]  697 	incw y   ; next vector 
      009F71 90 A3 00 19      [ 2]  698 	cpw y,#25 
      009F75 25 ED            [ 1]  699 	jrult 4$
      009F77 CC 80 80         [ 2]  700 	jp NonHandledInterrupt ; reset MCU
                                    701 
                                    702 ;------------------------------
                                    703 ; reset an interrupt vector 
                                    704 ; to its initial value 
                                    705 ; i.e. NonHandledInterrupt
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]



                                    706 ; RST-IVEC ( n -- )
                                    707 ;-----------------------------
      009F7A 9F 15                  708 	.word LINK 
                           001EFC   709 	LINK=. 
      009F7C 08                     710 	.byte 8 
      009F7D 52 53 54 2D 49 56 45   711 	.ascii "RST-IVEC"
             43
      009F85                        712 reset_vector:
      009F85 90 93            [ 1]  713 	ldw y,x
      009F87 1C 00 02         [ 2]  714 	addw x,#CELLL 
      009F8A 90 FE            [ 2]  715 	ldw y,(y)
      009F8C 90 A3 00 17      [ 2]  716 	cpw y,#23 
      009F90 27 3A            [ 1]  717 	jreq 9$
      009F92 90 A3 00 1D      [ 2]  718 	cpw y,#29 ; last vector
      009F96 22 34            [ 1]  719 	jrugt 9$  
      009F98 90 58            [ 2]  720 	sllw y 
      009F9A 90 58            [ 2]  721 	sllw y 
      009F9C 72 A9 80 08      [ 2]  722 	addw y,#0x8008 ; irq0 address 
      009FA0 90 BF 26         [ 2]  723 	ldw YTEMP,y
      009FA3 1D 00 06         [ 2]  724 	subw x,#3*CELLL 
      009FA6 EF 02            [ 2]  725 	ldw (2,x),y 
      009FA8 90 5F            [ 1]  726 	clrw y
      009FAA FF               [ 2]  727 	ldw (x),y 
      009FAB A6 82            [ 1]  728 	ld a,#0x82 
      009FAD 90 95            [ 1]  729 	ld yh,a
      009FAF EF 04            [ 2]  730 	ldw (4,x),y
      009FB1 CD 9D D4         [ 4]  731 	call EESTORE
      009FB4 1D 00 06         [ 2]  732 	subw x,#3*CELLL
      009FB7 90 5F            [ 1]  733 	clrw y 
      009FB9 FF               [ 2]  734 	ldw (x),y 
      009FBA 90 AE 80 80      [ 2]  735 	ldw y,#NonHandledInterrupt
      009FBE EF 04            [ 2]  736 	ldw (4,x),y 
      009FC0 90 BE 26         [ 2]  737 	ldw y,YTEMP  
      009FC3 72 A9 00 02      [ 2]  738 	addw y,#2
      009FC7 EF 02            [ 2]  739 	ldw (2,x),y 
      009FC9 CD 9D D4         [ 4]  740 	call EESTORE
      009FCC 81               [ 4]  741 9$:	ret 
                                    742 
                                    743 
                                    744 ;------------------------------
                                    745 ; all interrupt vector with 
                                    746 ; an address >= a are resetted 
                                    747 ; to default
                                    748 ; CHKIVEC ( a -- )
                                    749 ;------------------------------
      009FCD 9F 7C                  750 	.word LINK 
                           001F4F   751 	LINK=.
      009FCF 07                     752 	.byte 7
      009FD0 43 48 4B 49 56 45 43   753 	.ascii "CHKIVEC"
                                    754 ;local variables 
                           000001   755 	SSP=1
                           000003   756 	CADR=3
                           000005   757 	OFS=5
                           000006   758 	VSIZE=6  
      009FD7                        759 CHKIVEC:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]



      009FD7 52 06            [ 2]  760 	sub sp,#VSIZE ;alloc local variables 
      009FD9 90 93            [ 1]  761 	ldw y,x 
      009FDB 90 FE            [ 2]  762 	ldw y,(y)
      009FDD 17 03            [ 2]  763 	ldw (CADR,sp),y ; ca 
      009FDF 1F 01            [ 2]  764 	ldw (SSP,sp),x 
      009FE1 AE 80 0A         [ 2]  765 	ldw x,#0x800a ; irq0 address 
      009FE4 BF 35            [ 2]  766 	ldw PTR16,X
      009FE6 AE FF FC         [ 2]  767 	ldw x,#-4 
      009FE9 1C 00 04         [ 2]  768 1$:	addw x,#4
      009FEC A3 00 78         [ 2]  769 	cpw x,#30*4 ; irq0-29 
      009FEF 27 22            [ 1]  770 	jreq 9$
      009FF1 90 93            [ 1]  771 	ldw y,x  
      009FF3 91 D6 35         [ 4]  772 	ld a,([PTR16],y)
      009FF6 11 03            [ 1]  773 	cp a,(CADR,sp)
      009FF8 25 EF            [ 1]  774 	jrult 1$
      009FFA 90 5C            [ 1]  775 	incw y 
      009FFC 91 D6 35         [ 4]  776 	ld a,([PTR16],y)
      009FFF 11 04            [ 1]  777 	cp a,(CADR+1,sp) 
      00A001 25 E6            [ 1]  778 	jrult 1$ 
      00A003 1F 05            [ 2]  779 	ldw (OFS,sp),x 
      00A005 54               [ 2]  780 	srlw x
      00A006 54               [ 2]  781 	srlw x 
      00A007 90 93            [ 1]  782 	ldw y,x 
      00A009 1E 01            [ 2]  783 	ldw x,(SSP,sp)
      00A00B FF               [ 2]  784 	ldw (x),y
      00A00C CD 9F 85         [ 4]  785 	call reset_vector
      00A00F 1E 05            [ 2]  786 	ldw x,(OFS,sp) 
      00A011 20 D6            [ 2]  787 	jra 1$
      00A013 1E 01            [ 2]  788 9$:	ldw x,(SSP,sp) 
      00A015 1C 00 02         [ 2]  789 	addw x,#CELLL 
      00A018 5B 06            [ 2]  790 	addw sp,#VSIZE ; drop local variables  
      00A01A 81               [ 4]  791 	ret 
                                    792 
                                    793 ;------------------------------
                                    794 ; set interrupt vector 
                                    795 ; SET-IVEC ( ud n -- )
                                    796 ;  ud Handler address
                                    797 ;  n  vector # 0 .. 29 
                                    798 ;-----------------------------
      00A01B 9F CF                  799 	.word LINK
                           001F9D   800 	LINK=.
      00A01D 08                     801 	.byte 8 
      00A01E 53 45 54 2D 49 56 45   802 	.ascii "SET-IVEC" 
             43
      00A026                        803 set_vector:
      00A026 90 93            [ 1]  804     ldw y,x 
      00A028 1C 00 02         [ 2]  805 	addw x,#CELLL 
      00A02B 90 FE            [ 2]  806 	ldw y,(y) ; vector #
      00A02D 90 A3 00 1D      [ 2]  807 	cpw y,#29 ; last vector
      00A031 23 04            [ 2]  808 	jrule 2$
      00A033 1C 00 04         [ 2]  809 	addw x,#2*CELLL 
      00A036 81               [ 4]  810 	ret
      00A037 90 58            [ 2]  811 2$:	sllw y 
      00A039 90 58            [ 2]  812 	sllw y 
      00A03B 72 A9 80 08      [ 2]  813 	addw y,#0X8008 ; IRQ0 vector address 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]



      00A03F 90 BF 26         [ 2]  814 	ldw YTEMP,y ; vector address 
      00A042 A6 82            [ 1]  815 	ld a,#0x82 
      00A044 90 95            [ 1]  816 	ld yh,a 
      00A046 E6 01            [ 1]  817 	ld a,(1,x) ; isr address bits 23..16 
      00A048 90 97            [ 1]  818 	ld yl,a 
                                    819 ;  write 0x82 + most significant byte of int address	
      00A04A 1D 00 06         [ 2]  820 	subw x,#3*CELLL 
      00A04D EF 04            [ 2]  821 	ldw (4,x),y 
      00A04F 90 BE 26         [ 2]  822 	ldw y,YTEMP
      00A052 EF 02            [ 2]  823 	ldw (2,x),y ; vector address 
      00A054 90 5F            [ 1]  824 	clrw y 
      00A056 FF               [ 2]  825 	ldw (x),y   ; as a double 
      00A057 CD 9D D4         [ 4]  826 	call EESTORE 
      00A05A 90 93            [ 1]  827 	ldw y,x 
      00A05C 90 EE 02         [ 2]  828 	ldw y,(2,y) ; bits 15..0 int vector 
      00A05F 1D 00 06         [ 2]  829 	subw x,#3*CELLL 
      00A062 EF 04            [ 2]  830 	ldw (4,x),y 
      00A064 90 BE 26         [ 2]  831 	ldw y,YTEMP 
      00A067 72 A9 00 02      [ 2]  832 	addw y,#2 
      00A06B EF 02            [ 2]  833 	ldw (2,x),y 
      00A06D 90 5F            [ 1]  834 	clrw y 
      00A06F FF               [ 2]  835 	ldw (x),y 
      00A070 CD 9D D4         [ 4]  836 	call EESTORE
      00A073 1C 00 04         [ 2]  837 	addw x,#2*CELLL  
      00A076 81               [ 4]  838 9$: ret 
                                    839 
                                    840 
                                    841 ;------------------------
                                    842 ; Compile word to flash
                                    843 ; EE, (w -- )
                                    844 ;-----------------------
      00A077 A0 1D                  845 	.word LINK
                           001FF9   846 	LINK=.
      00A079 03                     847 	.byte 3
      00A07A 45 45 2C               848 	.ascii "EE,"
      00A07D                        849 EE_COMMA:
      00A07D 1D 00 04         [ 2]  850 	subw x,#2*CELLL 
      00A080 90 BE 1A         [ 2]  851 	ldw y,UCP
      00A083 90 89            [ 2]  852 	pushw y 
      00A085 EF 02            [ 2]  853 	ldw (2,x),y 
      00A087 90 5F            [ 1]  854 	clrw y 
      00A089 FF               [ 2]  855 	ldw (x),y
      00A08A CD 9D D4         [ 4]  856 	call EESTORE
      00A08D 90 85            [ 2]  857 	popw y 
      00A08F 72 A9 00 02      [ 2]  858 	addw y,#2
      00A093 90 BF 1A         [ 2]  859 	ldw UCP,y
      00A096 81               [ 4]  860 	ret 
                                    861 
                                    862 
                                    863 ;-------------------------
                                    864 ; Compile byte to flash 
                                    865 ; EEC, ( c -- )	
                                    866 ;-------------------------
      00A097 A0 79                  867 	.word LINK 
                           002019   868 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 118.
Hexadecimal [24-Bits]



      00A099 04                     869 	.byte 4 
      00A09A 45 45 43 2C            870 	.ascii "EEC,"
      00A09E                        871 EE_CCOMMA:
      00A09E 1D 00 04         [ 2]  872 	subw x,#2*CELLL 
      00A0A1 90 BE 1A         [ 2]  873 	ldw y,UCP
      00A0A4 90 89            [ 2]  874 	pushw y 
      00A0A6 EF 02            [ 2]  875 	ldw (2,x),y 
      00A0A8 90 5F            [ 1]  876 	clrw y 
      00A0AA FF               [ 2]  877 	ldw (x),y
      00A0AB CD 9D 88         [ 4]  878 	call EECSTORE
      00A0AE 90 85            [ 2]  879 	popw y 
      00A0B0 90 5C            [ 1]  880 	incw y 
      00A0B2 90 BF 1A         [ 2]  881 	ldw UCP,y
      00A0B5 81               [ 4]  882 	ret 
                                    883 
                                    884 
                                    885 ;--------------------------
                                    886 ; copy FLASH block to ROWBUF
                                    887 ; ROW>BUF ( ud -- )
                                    888 ;--------------------------
      00A0B6 A0 99                  889 	.word LINK 
                           002038   890 	LINK=.
      00A0B8 07                     891 	.byte 7 
      00A0B9 52 4F 57 3E 42 55 46   892 	.ascii "ROW>BUF"
      00A0C0                        893 ROW2BUF: 
      00A0C0 CD 9B 4A         [ 4]  894 	call FPSTOR 
      00A0C3 A6 80            [ 1]  895 	ld a,#BLOCK_SIZE
      00A0C5 88               [ 1]  896 	push a 
      00A0C6 B4 36            [ 1]  897 	and a,PTR8 ; block align 
      00A0C8 B7 36            [ 1]  898 	ld PTR8,a
      00A0CA 90 AE 16 80      [ 2]  899 	ldw y,#ROWBUFF 
      00A0CE 92 BC 00 34      [ 5]  900 1$: ldf a,[FPTR]
      00A0D2 90 F7            [ 1]  901 	ld (y),a
      00A0D4 CD 9C C4         [ 4]  902 	call INC_FPTR
      00A0D7 90 5C            [ 1]  903 	incw y 
      00A0D9 0A 01            [ 1]  904 	dec (1,sp)
      00A0DB 26 F1            [ 1]  905 	jrne 1$ 
      00A0DD 84               [ 1]  906 	pop a 
      00A0DE 81               [ 4]  907 	ret 
                                    908 
                                    909 
                                    910 ;---------------------------
                                    911 ; copy ROWBUFF to flash 
                                    912 ; BUF>ROW ( ud -- )
                                    913 ; ud is row address as double 
                                    914 ;---------------------------
      00A0DF A0 B8                  915 	.word LINK 
                           002061   916 	LINK=.
      00A0E1 07                     917 	.byte 7 
      00A0E2 42 55 46 3E 52 4F 57   918 	.ascii "BUF>ROW" 
      00A0E9                        919 BUF2ROW:
      00A0E9 CD 87 0C         [ 4]  920 	call TBUF ; ( ud rb -- )
      00A0EC CD 87 CC         [ 4]  921 	call ROT 
      00A0EF CD 87 CC         [ 4]  922 	call ROT  ; ( rb ud -- )
      00A0F2 CD 9E C2         [ 4]  923 	call write_row 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 119.
Hexadecimal [24-Bits]



      00A0F5 81               [ 4]  924 	ret 
                                    925 
                                    926 ;---------------------------------
                                    927 ; how many byte free in that row 
                                    928 ; RFREE ( a -- n )
                                    929 ; a is least byte of target address
                                    930 ;----------------------------------
      00A0F6 A0 E1                  931 	.word LINK 
                           002078   932 	LINK=.
      00A0F8 05                     933 	.byte 5 
      00A0F9 52 46 52 45 45         934 	.ascii "RFREE"
      00A0FE                        935 RFREE:
      00A0FE E6 01            [ 1]  936 	ld a,(1,x)
      00A100 A4 7F            [ 1]  937 	and a,#BLOCK_SIZE-1 
      00A102 B7 26            [ 1]  938 	ld YTEMP,a 
      00A104 A6 80            [ 1]  939 	ld a,#BLOCK_SIZE 
      00A106 B0 26            [ 1]  940 	sub a,YTEMP 
      00A108 90 5F            [ 1]  941 	clrw y 
      00A10A 90 97            [ 1]  942 	ld yl,a
      00A10C FF               [ 2]  943 	ldw (x),y 
      00A10D 81               [ 4]  944 	ret 
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
      00A10E A0 F8                  955 	.word LINK 
                           002090   956 	LINK=. 
      00A110 06                     957 	.byte 6
      00A111 52 41 4D 3E 45 45      958 	.ascii "RAM>EE"
                                    959 	
      00A117                        960 RAM2EE:
                                    961 ; copy ud on top 
      00A117 90 93            [ 1]  962 	ldw y,x 
      00A119 90 EE 06         [ 2]  963 	ldw y,(6,y) ; LSW of ud  
      00A11C 90 BF 26         [ 2]  964 	ldw YTEMP,y 
      00A11F 90 93            [ 1]  965 	ldw y,x 
      00A121 90 EE 04         [ 2]  966 	ldw y,(4,y)  ; MSW of ud 
      00A124 1D 00 04         [ 2]  967 	subw x,#2*CELLL 
      00A127 FF               [ 2]  968 	ldw (x),y 
      00A128 90 BE 26         [ 2]  969 	ldw y,YTEMP 
      00A12B EF 02            [ 2]  970 	ldw (2,x),y 
      00A12D CD A0 C0         [ 4]  971 	call ROW2BUF 
      00A130 90 93            [ 1]  972 	ldw y,x 
      00A132 90 EE 06         [ 2]  973 	ldw y,(6,y)
      00A135 90 89            [ 2]  974 	pushw y ; udl 
      00A137 90 9F            [ 1]  975 	ld a,yl
      00A139 A4 7F            [ 1]  976 	and a,#BLOCK_SIZE-1 
      00A13B 90 5F            [ 1]  977 	clrw y 
      00A13D 90 97            [ 1]  978 	ld yl,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 120.
Hexadecimal [24-Bits]



      00A13F 72 A9 16 80      [ 2]  979 	addw y,#ROWBUFF 
      00A143 1D 00 02         [ 2]  980 	subw x,#CELLL 
      00A146 FF               [ 2]  981 	ldw (x),y  
      00A147 CD 86 18         [ 4]  982 	call SWAPP ;  ( ud a ra u -- )
      00A14A CD 85 B4         [ 4]  983 	call RFROM  
      00A14D CD A0 FE         [ 4]  984 	call RFREE 
      00A150 CD 89 86         [ 4]  985 	call MIN
      00A153 CD 86 08         [ 4]  986 	call DUPP 
      00A156 CD 85 D1         [ 4]  987 	call TOR  
      00A159 CD 8C E1         [ 4]  988 	call CMOVE
      00A15C CD A0 E9         [ 4]  989 	call BUF2ROW 
      00A15F CD 85 B4         [ 4]  990 	call RFROM 
      00A162 81               [ 4]  991 	ret 
                                    992 
                                    993 
                                    994 ;--------------------------
                                    995 ; expand 16 bit address 
                                    996 ; to 32 bit address 
                                    997 ; FADDR ( a -- ud )
                                    998 ;--------------------------
      00A163 A1 10                  999 	.word LINK 
                           0020E5  1000 	LINK=. 
      00A165 05                    1001 	.byte 5 
      00A166 46 41 44 44 52        1002 	.ascii "FADDR"
      00A16B                       1003 FADDR:
      00A16B CC 8B B7         [ 2] 1004 	jp ZERO 
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
      00A16E A1 65                 1020 	.word LINK 
                           0020F0  1021 	LINK=.
      00A170 05                    1022 	.byte 5 
      00A171 46 4D 4F 56 45        1023 	.ascii "FMOVE" 
      00A176                       1024 FMOVE:
      00A176 CD 87 1E         [ 4] 1025 	call TFLASH 
      00A179 CD 85 63         [ 4] 1026 	CALL AT 
      00A17C CD 85 18         [ 4] 1027 	CALL QBRAN 
      00A17F A1 FA                 1028 	.word no_move  
      00A181 CD 87 6D         [ 4] 1029 	call CPP
      00A184 CD 85 63         [ 4] 1030 	call AT  
      00A187 CD 86 08         [ 4] 1031 	call DUPP ; ( udl udl -- )
      00A18A CD 87 51         [ 4] 1032 	call CNTXT 
      00A18D CD 85 63         [ 4] 1033 	call AT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 121.
Hexadecimal [24-Bits]



      00A190 CD 84 EF         [ 4] 1034 	call DOLIT 
      00A193 00 02                 1035 	.word 2 
      00A195 CD 88 A6         [ 4] 1036 	call SUBB ; ( udl udl a -- )
      00A198 CD 86 18         [ 4] 1037 	call SWAPP 
      00A19B CD A1 6B         [ 4] 1038 	call FADDR 
      00A19E CD 87 CC         [ 4] 1039 	call ROT  ; ( udl ud a -- )
      00A1A1 CD 86 08         [ 4] 1040 	call DUPP 
      00A1A4 CD 85 D1         [ 4] 1041 	call TOR    ; R: a 
      00A1A7                       1042 FMOVE2: 
      00A1A7 CD 8C 94         [ 4] 1043 	call HERE 
      00A1AA CD 85 C5         [ 4] 1044 	call RAT 
      00A1AD CD 88 A6         [ 4] 1045 	call SUBB ; (udl ud a wl -- )
      00A1B0                       1046 next_row:
      00A1B0 CD 86 08         [ 4] 1047 	call DUPP 
      00A1B3 CD 85 D1         [ 4] 1048 	call TOR  ; ( udl ud a wl -- ) R: a wl
      00A1B6 CD A1 17         [ 4] 1049 	call RAM2EE ; ( udl a u -- udl u2 ) u2 is byte written to FLASH 
      00A1B9 CD 86 08         [ 4] 1050 	call DUPP 
      00A1BC CD 85 D1         [ 4] 1051 	call TOR
      00A1BF CD 88 2D         [ 4] 1052 	call PLUS  ; ( udl+ ) 
      00A1C2 CD 86 08         [ 4] 1053 	call DUPP 
      00A1C5 CD 8B B7         [ 4] 1054 	call ZERO   ; ( udl+ ud -- )
      00A1C8 CD 85 B4         [ 4] 1055 	call RFROM  ; ( udl+ ud u2  R: a wl ) 
      00A1CB CD 85 B4         [ 4] 1056 	call RFROM  ; ( udl+ ud u2 wl R: a ) 
      00A1CE CD 86 30         [ 4] 1057 	call OVER   ; ( udl+ ud u2 wl u2 -- )
      00A1D1 CD 88 A6         [ 4] 1058 	call SUBB  ; ( udl+ ud u2 wl- R: a )
      00A1D4 CD 86 08         [ 4] 1059 	call DUPP 
      00A1D7 CD 85 18         [ 4] 1060 	call QBRAN
      00A1DA A1 F3                 1061 	.word fmove_done 
      00A1DC CD 86 18         [ 4] 1062 	call SWAPP  ; ( udl+ ud wl- u2 R: a )
      00A1DF CD 85 B4         [ 4] 1063 	call RFROM ; ( udl+ ud wl- u2 a -- ) 
      00A1E2 CD 88 2D         [ 4] 1064 	call PLUS  ; ( udl+2 ud wl- a+ )
      00A1E5 CD 86 08         [ 4] 1065 	call DUPP 
      00A1E8 CD 85 D1         [ 4] 1066 	call TOR   ; ( udl+2 ud wl- a+ ) R: a+
      00A1EB CD 86 18         [ 4] 1067 	call SWAPP 
      00A1EE CD 85 34         [ 4] 1068 	call BRAN
      00A1F1 A1 B0                 1069 	.word next_row  
      00A1F3                       1070 fmove_done:	
      00A1F3 CD 85 B4         [ 4] 1071 	call RFROM  ; ( -- udl+ ud u2 wl- a  )
      00A1F6 1C 00 0A         [ 2] 1072 	addw x,#5*CELLL ; (  -- cp+ ) new CP 
      00A1F9 81               [ 4] 1073  	ret  
      00A1FA                       1074 no_move:
      00A1FA CD 8B B7         [ 4] 1075 	call ZERO
      00A1FD 81               [ 4] 1076 	ret 
                                   1077 
                                   1078 ;------------------------------------------
                                   1079 ; adjust pointers after **FMOVE** operetion.
                                   1080 ; UPDAT-PTR ( cp+ -- )
                                   1081 ; cp+ is new CP position after FMOVE 
                                   1082 ;-------------------------------------------
      00A1FE A1 70                 1083 	.word LINK 
                           002180  1084 	LINK=.
      00A200 09                    1085 	.byte 9
      00A201 55 50 44 41 54 2D 50  1086 	.ascii "UPDAT-PTR" 
             54 52
      00A20A                       1087 UPDATPTR:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 122.
Hexadecimal [24-Bits]



                                   1088 ;reset VP to previous position  
      00A20A CD 9B C4         [ 4] 1089 	call EEPVP 
      00A20D CD 85 FE         [ 4] 1090 	call DROP 
      00A210 CD 85 63         [ 4] 1091 	call AT
      00A213 CD 87 5F         [ 4] 1092 	call VPP 
      00A216 CD 85 51         [ 4] 1093 	call STORE
                                   1094 ;update CONTEXT and LAST 
      00A219 CD 9B AE         [ 4] 1095 	call EEPCP 
      00A21C CD 85 FE         [ 4] 1096 	call DROP
      00A21F CD 85 63         [ 4] 1097 	call AT
      00A222 CD 84 EF         [ 4] 1098 	call DOLIT 
      00A225 00 02                 1099 	.word 2 
      00A227 CD 88 2D         [ 4] 1100 	call PLUS 
      00A22A CD 86 08         [ 4] 1101 	call DUPP 
      00A22D CD 87 51         [ 4] 1102 	call CNTXT 
      00A230 CD 85 51         [ 4] 1103 	call STORE
      00A233 CD 87 7D         [ 4] 1104 	call LAST
      00A236 CD 85 51         [ 4] 1105 	call STORE 
      00A239 CD 9B DE         [ 4] 1106 	call UPDATLAST 
                                   1107 ;update CP 
      00A23C CD 87 6D         [ 4] 1108 	call CPP 
      00A23F CD 85 51         [ 4] 1109 	call STORE
      00A242 CD 9C 07         [ 4] 1110 	call UPDATCP 
      00A245 81               [ 4] 1111 	ret 
                                   1112 
                                   1113 ;-----------------------------
                                   1114 ; move interrupt sub-routine
                                   1115 ; in flash memory
                                   1116 ;----------------------------- 
      00A246 A2 00                 1117 	.word LINK 
                           0021C8  1118 	LINK=. 
      00A248 06                    1119 	.byte 6
      00A249 49 46 4D 4F 56 45     1120 	.ascii "IFMOVE" 
      00A24F                       1121 IFMOVE:
      00A24F CD 87 1E         [ 4] 1122 	call TFLASH 
      00A252 CD 85 63         [ 4] 1123 	CALL AT 
      00A255 CD 85 18         [ 4] 1124 	CALL QBRAN 
      00A258 A1 FA                 1125 	.word no_move 
      00A25A CD 87 6D         [ 4] 1126 	call CPP 
      00A25D CD 85 63         [ 4] 1127 	call AT 
      00A260 CD 86 08         [ 4] 1128 	call DUPP ; ( udl udl -- )
      00A263 CD 9B C4         [ 4] 1129 	call EEPVP 
      00A266 CD 85 FE         [ 4] 1130 	call DROP
      00A269 CD 85 63         [ 4] 1131 	call AT  ; ( udl udl a )
      00A26C CD 85 D1         [ 4] 1132 	call TOR 
      00A26F CD A1 6B         [ 4] 1133 	call FADDR
      00A272 CD 85 C5         [ 4] 1134 	call RAT ; ( udl ud a -- ) R: a 
      00A275 CC A1 A7         [ 2] 1135 	jp FMOVE2 
                                   1136 
                                   1137 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 123.
Hexadecimal [24-Bits]



                           000001  4429 .if WANT_SCALING_CONST 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 124.
Hexadecimal [24-Bits]



                                   4430         .include "const_ratio.asm"
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
      00A278 A2 48                   34         .word LINK 
                           0021FA    35         LINK=.
      00A27A 02                      36         .byte 2
      00A27B 50 49                   37         .ascii "PI" 
      00A27D                         38 PII:
      00A27D 1D 00 04         [ 2]   39         subw x,#2*CELLL 
      00A280 90 AE 01 63      [ 2]   40         ldw y,#355 
      00A284 EF 02            [ 2]   41         ldw (2,x),y 
      00A286 90 AE 00 71      [ 2]   42         ldw y,#113 
      00A28A FF               [ 2]   43         ldw (x),y 
      00A28B 81               [ 4]   44         ret 
                                     45 
                                     46 ;      SQRT2 ( -- 19601  13860 )
                                     47 ; precision: 1.5e-9 
                                     48 ; usage example to compute Voltage peek to peek from Vrms 
                                     49 ; : VPP SQRT2 */ 2 * ;
                                     50 ;
      00A28C A2 7A                   51         .word LINK 
                           00220E    52         LINK=.
      00A28E 05                      53         .byte 5 
      00A28F 53 51 52 54 32          54         .ascii "SQRT2" 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 125.
Hexadecimal [24-Bits]



      00A294                         55 SQRT2:
      00A294 1D 00 04         [ 2]   56         subw x,#2*CELLL 
      00A297 90 AE 4C 91      [ 2]   57         ldw y,#19601 
      00A29B EF 02            [ 2]   58         ldw (2,x),y 
      00A29D 90 AE 36 24      [ 2]   59         ldw y,#13860 
      00A2A1 FF               [ 2]   60         ldw (x),y 
      00A2A2 81               [ 4]   61         ret 
                                     62 
                                     63 ;   SQRT3 ( -- 18817 10864 )
                                     64 ; precision: 1.1e-9
                                     65 ;
      00A2A3 A2 8E                   66         .word LINK 
                           002225    67         LINK=.
      00A2A5 05                      68         .byte 5
      00A2A6 53 51 52 54 33          69         .ascii "SQRT3" 
      00A2AB                         70 SQRT3: 
      00A2AB 1D 00 04         [ 2]   71     subw x,#2*CELLL 
      00A2AE 90 AE 49 81      [ 2]   72     ldw y,#18817 
      00A2B2 EF 02            [ 2]   73     ldw (2,x),y 
      00A2B4 90 AE 2A 70      [ 2]   74     ldw y,#10864 
      00A2B8 FF               [ 2]   75     ldw (x),y 
      00A2B9 81               [ 4]   76     ret 
                                     77 
                                     78 ;   E ( -- 28667 10546 )
                                     79 ; precision: 5.5e-9 
                                     80 ; natural log base 
      00A2BA A2 A5                   81         .word LINK 
                           00223C    82         LINK=.
      00A2BC 01                      83         .byte 1
      00A2BD 45                      84         .ascii "E" 
      00A2BE                         85 ENEPER:
      00A2BE 1D 00 04         [ 2]   86     subw x,#2*CELLL 
      00A2C1 90 AE 6F FB      [ 2]   87     ldw y,#28667 
      00A2C5 EF 02            [ 2]   88     ldw (2,x),y 
      00A2C7 90 AE 29 32      [ 2]   89     ldw y,#10546 
      00A2CB FF               [ 2]   90     ldw (x),y 
      00A2CC 81               [ 4]   91     ret 
                                     92 
                                     93 ;   SQRT10 ( -- 22936 7253 )
                                     94 ; precision: 5.7e-9 
      00A2CD A2 BC                   95         .word LINK 
                           00224F    96         LINK=.
      00A2CF 06                      97         .byte 6 
      00A2D0 53 51 52 54 31 30       98         .ascii "SQRT10" 
      00A2D6                         99 SQRT10:
      00A2D6 1D 00 04         [ 2]  100     subw x,#2*CELLL
      00A2D9 90 AE 59 98      [ 2]  101     ldw y,#22936 
      00A2DD EF 02            [ 2]  102     ldw (2,x),y 
      00A2DF 90 AE 1C 55      [ 2]  103     ldw y,#7253
      00A2E3 FF               [ 2]  104     ldw (x),y 
      00A2E4 81               [ 4]  105     ret 
                                    106 
                                    107 ;   12RT2 ( -- 26797 25293 )
                                    108 ; precision: 1.0e-9 
                                    109 ; used in music to compute well tempered scale
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 126.
Hexadecimal [24-Bits]



      00A2E5 A2 CF                  110         .word LINK 
                           002267   111         LINK=. 
      00A2E7 05                     112         .byte 5 
      00A2E8 31 32 52 54 32         113         .ascii "12RT2"
      00A2ED                        114 RT12_2:
      00A2ED 1D 00 04         [ 2]  115     subw x,#2*CELLL 
      00A2F0 90 AE 68 AD      [ 2]  116     ldw y,#26797
      00A2F4 EF 02            [ 2]  117     ldw (2,x),y 
      00A2F6 90 AE 62 CD      [ 2]  118     ldw y,#25293
      00A2FA FF               [ 2]  119     ldw (x),y 
      00A2FB 81               [ 4]  120     ret 
                                    121 
                                    122 ;   LOG2s ( -- 2040 11103 )
                                    123 ; log(2)/1.6384
                                    124 ; precision: 1.1e-8
      00A2FC A2 E7                  125         .word LINK 
                           00227E   126         LINK=.
      00A2FE 05                     127         .byte 5 
      00A2FF 4C 4F 47 32 53         128         .ascii "LOG2S" 
      00A304                        129 LOG2S:
      00A304 1D 00 04         [ 2]  130     subw x,#2*CELLL
      00A307 90 AE 07 F8      [ 2]  131     ldw y,#2040 
      00A30B EF 02            [ 2]  132     ldw (2,x),y 
      00A30D 90 AE 2B 5F      [ 2]  133     ldw y,#11103 
      00A311 FF               [ 2]  134     ldw (x),y 
      00A312 81               [ 4]  135     ret 
                                    136 
                                    137 ;   LN2 ( -- 485 11464 )
                                    138 ; ln(2)/16.384 
                                    139 ; precision: 1.0e-7 
      00A313 A2 FE                  140         .word LINK 
                           002295   141         LINK=.
      00A315 04                     142         .byte 4 
      00A316 4C 4E 32 53            143         .ascii "LN2S" 
      00A31A                        144 LN2S: 
      00A31A 1D 00 04         [ 2]  145     subw x,#2*CELLL
      00A31D 90 AE 01 E5      [ 2]  146     ldw y,#485
      00A321 EF 02            [ 2]  147     ldw (2,x),y 
      00A323 90 AE 2C C8      [ 2]  148     ldw y,#11464 
      00A327 FF               [ 2]  149     ldw (x),y 
      00A328 81               [ 4]  150     ret 
                                    151 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 127.
Hexadecimal [24-Bits]



                                   4431 .endif
                           000001  4432 .if WANT_CONST_TABLE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 128.
Hexadecimal [24-Bits]



                                   4433         .include "ctable.asm"
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
      00A329 A3 15                   34     .word LINK 
                           0022AB    35     LINK=.
      00A32B 06                      36     .byte 6
      00A32C 43 41 4C 4C 4F 54       37     .ascii "CALLOT"
      00A332                         38 CALLOT:
      00A332 CD 87 6D         [ 4]   39     CALL CPP
      00A335 CD 86 08         [ 4]   40     CALL DUPP 
      00A338 CD 85 63         [ 4]   41     CALL AT 
      00A33B CD 85 D1         [ 4]   42     CALL TOR 
      00A33E CD 8C 27         [ 4]   43     CALL PSTOR 
      00A341 CD 9C 07         [ 4]   44     CALL UPDATCP 
      00A344 CD 85 B4         [ 4]   45     CALL RFROM
      00A347 CC 8B B7         [ 2]   46     JP ZERO 
                                     47 
                                     48 ;------------------------------
                                     49 ; create constants bytes table 
                                     50 ; in persistant memory
                                     51 ;  CTABLE ( n+ -- ad ; <string> )
                                     52 ; n+ bytes reserved 
                                     53 ;-----------------------------
      00A34A A3 2B                   54     .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 129.
Hexadecimal [24-Bits]



                           0022CC    55     LINK=.
      00A34C 06                      56     .byte 6
      00A34D 43 54 41 42 4C 45       57     .ascii "CTABLE"
      00A353                         58 CTABLE:
      00A353 CD A3 32         [ 4]   59     CALL CALLOT     
      00A356 CC 99 09         [ 2]   60     JP DCONST 
                                     61      
                                     62 
                                     63 ;--------------------------------
                                     64 ; create constants words table 
                                     65 ; in persistant memory 
                                     66 ; WTABLE ( n+ -- ad ; <string> )
                                     67 ; n+  words reserved  
                                     68 ;--------------------------------
      00A359 A3 4C                   69     .word LINK 
                           0022DB    70     LINK=.
      00A35B 06                      71     .byte 6
      00A35C 57 54 41 42 4C 45       72     .ascii "WTABLE"
      00A362                         73 WTABLE:
      00A362 CD 8B 3E         [ 4]   74     CALL CELLS  
      00A365 CD A3 32         [ 4]   75     CALL CALLOT 
      00A368 CC 99 09         [ 2]   76     JP DCONST 
                                     77 
                                     78 ;---------------------------------
                                     79 ; stack an element of CTABLE 
                                     80 ; CTABL@ ( u ad -- c )
                                     81 ; u element order {0..size-1}
                                     82 ; a|ad table address 
                                     83 ;--------------------------------
      00A36B A3 5B                   84     .word LINK 
                           0022ED    85     LINK=.
      00A36D 06                      86     .byte 6
      00A36E 43 54 41 42 4C 40       87     .ascii "CTABL@" 
      00A374                         88 CTAT:
      00A374 CD 9B 4A         [ 4]   89     call FPSTOR 
      00A377 CD 9C DC         [ 4]   90     call PTRPLUS 
      00A37A CC 9D 19         [ 2]   91     jp EE_CREAD 
                                     92 
                                     93 ;---------------------------------
                                     94 ; stack an element of WTABLE 
                                     95 ; WTABL@ ( u ud -- w )
                                     96 ; u is element order {0..size-1}
                                     97 ; a|ud table address 
                                     98 ;----------------------------------
      00A37D A3 6D                   99     .word LINK 
                           0022FF   100     LINK=.
      00A37F 06                     101     .byte 6
      00A380 57 54 41 42 4C 40      102     .ascii "WTABL@" 
      00A386                        103 WTAT:
      00A386 CD 9B 4A         [ 4]  104     call FPSTOR 
      00A389 CD 8B 3E         [ 4]  105     call CELLS 
      00A38C CD 9C DC         [ 4]  106     call PTRPLUS 
      00A38F CD 9C F7         [ 4]  107     call EE_READ 
      00A392 81               [ 4]  108     ret 
                                    109 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 130.
Hexadecimal [24-Bits]



                                    110 ;--------------------------
                                    111 ; tool to initialize character table 
                                    112 ; CTINIT ( ad -- )
                                    113 ; ad is table address 
                                    114 ;--------------------------
      00A393 A3 7F                  115     .word LINK 
                           002315   116     LINK=.
      00A395 06                     117     .byte 6 
      00A396 43 54 49 4E 49 54      118     .ascii "CTINIT"
      00A39C                        119 CTINIT:
      00A39C CD 9B 4A         [ 4]  120     CALL FPSTOR
      00A39F CD 9C 88         [ 4]  121     CALL UNLOCK
      00A3A2 CD 8B B7         [ 4]  122     CALL ZERO 
      00A3A5 CD 8B 4B         [ 4]  123 1$: CALL ONEP 
      00A3A8 CD 86 08         [ 4]  124     CALL DUPP 
      00A3AB CD A3 F8         [ 4]  125     CALL INTQ 
      00A3AE CD 85 18         [ 4]  126     CALL QBRAN 
      00A3B1 A3 BB                  127     .word 2$
      00A3B3 CD 9D 33         [ 4]  128     call WR_BYTE 
      00A3B6 CD 85 34         [ 4]  129     CALL BRAN 
      00A3B9 A3 A5                  130     .word 1$ 
      00A3BB CD 88 0D         [ 4]  131 2$: CALL DDROP 
      00A3BE CD 9C B0         [ 4]  132     CALL LOCK 
      00A3C1 81               [ 4]  133     ret 
                                    134 
                                    135 ;--------------------------
                                    136 ; tool to initialize word table 
                                    137 ; WTINIT ( ad -- )
                                    138 ; ad is table address 
                                    139 ;--------------------------
      00A3C2 A3 95                  140     .word LINK 
                           002344   141     LINK=.
      00A3C4 06                     142     .byte 6 
      00A3C5 57 54 49 4E 49 54      143     .ascii "WTINIT"
      00A3CB                        144 WTINIT:
      00A3CB CD 9B 4A         [ 4]  145     CALL FPSTOR
      00A3CE CD 9C 88         [ 4]  146     CALL UNLOCK
      00A3D1 CD 8B B7         [ 4]  147     CALL ZERO 
      00A3D4 CD 8B 4B         [ 4]  148 1$: CALL ONEP 
      00A3D7 CD 86 08         [ 4]  149     CALL DUPP
      00A3DA CD A3 F8         [ 4]  150     CALL INTQ
      00A3DD CD 85 18         [ 4]  151     CALL QBRAN 
      00A3E0 A3 EA                  152     .word 2$
      00A3E2 CD 9D 58         [ 4]  153     call WR_WORD 
      00A3E5 CD 85 34         [ 4]  154     CALL BRAN 
      00A3E8 A3 D4                  155     .word 1$ 
      00A3EA CD 88 0D         [ 4]  156 2$: CALL DDROP 
      00A3ED CD 9C B0         [ 4]  157     CALL LOCK 
      00A3F0 81               [ 4]  158     ret 
                                    159 
                                    160 ;------------------------
                                    161 ; Prompted input for integer 
                                    162 ; display n+ in bracket and
                                    163 ; '?' 
                                    164 ; [N]? ( n+ -- a )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 131.
Hexadecimal [24-Bits]



                                    165 ;------------------------
      00A3F1 A3 C4                  166     .word LINK 
                           002373   167     LINK=.
      00A3F3 04                     168     .byte 4
      00A3F4 5B 4E 5D 3F            169     .ascii "[N]?" 
      00A3F8                        170 INTQ:
      00A3F8 CD 8F 2F         [ 4]  171     CALL CR 
      00A3FB CD 84 EF         [ 4]  172     call DOLIT 
      00A3FE 00 5B                  173     .word '[
      00A400 CD 84 B6         [ 4]  174     CALL EMIT 
      00A403 CD 8F D6         [ 4]  175     CALL DOT 
      00A406 CD 8F 5C         [ 4]  176     CALL  DOTQP
      00A409 03                     177     .byte 3
      00A40A 5D 3F 20               178     .ascii "]? " 
      00A40D CD 93 66         [ 4]  179     CALL QUERY 
      00A410 CD 91 91         [ 4]  180     call TOKEN 
      00A413 CC A4 A1         [ 2]  181     jp NUMBQ
                                    182 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 132.
Hexadecimal [24-Bits]



                                   4434 .endif
                           000001  4435 .if WANT_DOUBLE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 133.
Hexadecimal [24-Bits]



                                   4436         .include "double.asm"
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
      00A416                         30 nsign: ; a cntr -- a cntr f 
      00A416 CD 8B B7         [ 4]   31     CALL ZERO 
      00A419 CD 85 D1         [ 4]   32     CALL TOR  ; R: sign 
      00A41C CD 85 D1         [ 4]   33     CALL TOR  ; R: sign cntr 
      00A41F CD 86 08         [ 4]   34     CALL DUPP 
      00A422 CD 85 81         [ 4]   35     CALL CAT 
      0023A5                         36     _DOLIT '-'
      00A425 CD 84 EF         [ 4]    1     CALL DOLIT 
      00A428 00 2D                    2     .word '-' 
      00A42A CD 88 CE         [ 4]   37     CALL EQUAL 
      0023AD                         38     _QBRAN nsign1 
      00A42D CD 85 18         [ 4]    1     CALL QBRAN
      00A430 A4 47                    2     .word nsign1
      00A432 CD 8B 4B         [ 4]   39     CALL ONEP ; a+ 
      00A435 CD 85 B4         [ 4]   40     CALL RFROM 
      00A438 CD 8B 58         [ 4]   41     CALL ONEM ; cntr-
      00A43B CD 85 B4         [ 4]   42     CALL RFROM ; sign 
      00A43E CD 88 47         [ 4]   43     CALL INVER ; -1
      00A441 CD 85 D1         [ 4]   44     CALL TOR   ; R: sign 
      00A444 CD 85 D1         [ 4]   45     CALL TOR   ; R: cntr 
      00A447                         46 nsign1:
      00A447 CD 85 B4         [ 4]   47     CALL RFROM 
      00A44A CD 85 B4         [ 4]   48     CALL RFROM 
      00A44D 81               [ 4]   49     RET 
                                     50 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 134.
Hexadecimal [24-Bits]



                                     51 
                                     52 ; get all digits in row 
                                     53 ; stop at first non-digit or end of string 
                                     54 ; ( dlo dhi a cntr -- dlo dhi [ a+ cntr- | a+ 0 ] )
      00A44E                         55 parse_digits:
      00A44E                         56 1$:
      00A44E CD 86 08         [ 4]   57     CALL DUPP 
      0023D1                         58     _QBRAN 5$ 
      00A451 CD 85 18         [ 4]    1     CALL QBRAN
      00A454 A4 96                    2     .word 5$
      00A456 CD 85 D1         [ 4]   59     CALL TOR   ; dlo dhi a R: cntr 
      00A459 CD 8C 7D         [ 4]   60     CALL COUNT ; dlo dhi a+ char 
      00A45C CD 86 CE         [ 4]   61     CALL BASE 
      00A45F CD 85 63         [ 4]   62     CALL AT 
      00A462 CD 8E 75         [ 4]   63     CALL DIGTQ 
      0023E5                         64     _QBRAN 4$ ; not a digit
      00A465 CD 85 18         [ 4]    1     CALL QBRAN
      00A468 A4 8D                    2     .word 4$
      00A46A CD A8 4E         [ 4]   65     CALL DTOR  ; dlo dhi R: cntr a+ c  
      00A46D CD 86 CE         [ 4]   66     CALL BASE 
      00A470 CD 85 63         [ 4]   67     CALL AT 
      00A473 CD A6 88         [ 4]   68     CALL DSSTAR
      00A476 CD 85 B4         [ 4]   69     CALL RFROM 
      00A479 CD 8B B7         [ 4]   70     CALL ZERO 
      00A47C CD AB 15         [ 4]   71     CALL DPLUS 
      00A47F CD 85 B4         [ 4]   72     CALL RFROM  ; dlo dhi a+ 
      00A482 CD 85 B4         [ 4]   73     CALL RFROM ; dlo dhi a+ cntr 
      00A485 CD 8B 58         [ 4]   74     CALL ONEM 
      002408                         75     _BRAN 1$ ; dlo dhi a+ R: 
      00A488 CD 85 34         [ 4]    1     CALL BRAN 
      00A48B A4 4E                    2     .word 1$ 
      00A48D CD 85 FE         [ 4]   76 4$: CALL DROP  ; dlo dhi a+ 
      00A490 CD 8B 58         [ 4]   77     CALL ONEM  ; unget char 
      00A493 CD 85 B4         [ 4]   78     CALL RFROM ; dlo dhi a+ cntr-
      00A496                         79 5$:
      00A496 81               [ 4]   80     RET 
                                     81 
                                     82 
                                     83 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     84 ;   NUMBER? (a -- s -1 |d -2 | a F )
                                     85 ;   convert string to integer 
                                     86 ;   double begin with '#' 
                                     87 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002417                         88     _HEADER NUMBQ,7,"NUMBER?"
      00A497 A3 F3                    1         .word LINK 
                           002419     2         LINK=.
      00A499 07                       3         .byte 7  
      00A49A 4E 55 4D 42 45 52 3F     4         .ascii "NUMBER?"
      00A4A1                          5         NUMBQ:
                                     89 ; save current base value 
      00A4A1 CD 86 CE         [ 4]   90     CALL BASE 
      00A4A4 CD 85 63         [ 4]   91     CALL AT 
      00A4A7 CD 85 D1         [ 4]   92     CALL TOR 
                                     93 ; initialize integer to 0     
      00A4AA 1D 00 04         [ 2]   94     SUBW X,#4 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 135.
Hexadecimal [24-Bits]



      00A4AD 90 5F            [ 1]   95     CLRW Y 
      00A4AF FF               [ 2]   96     LDW (X),Y 
      00A4B0 EF 02            [ 2]   97     LDW (2,X),Y ; a 0 0 R: base  
      002432                         98     _DOLIT 2 
      00A4B2 CD 84 EF         [ 4]    1     CALL DOLIT 
      00A4B5 00 02                    2     .word 2 
      00A4B7 CD 8C 10         [ 4]   99     CALL PICK  ; a 0 0 a R: base    
      00A4BA CD 8C 7D         [ 4]  100     CALL COUNT ; a 0 0 a+ n 
                                    101 ; check for '#' double integer 
      00A4BD CD 86 30         [ 4]  102     CALL OVER  ; a 0 0 a+ n a+
      00A4C0 CD 85 81         [ 4]  103     CALL CAT   ; a 0 0 a+ n c 
      002443                        104     _DOLIT '#' ; a 0 0 a+ n c '#' 
      00A4C3 CD 84 EF         [ 4]    1     CALL DOLIT 
      00A4C6 00 23                    2     .word '#' 
      00A4C8 CD 88 CE         [ 4]  105     CALL EQUAL 
      00A4CB CD 85 D1         [ 4]  106     CALL TOR   ; a 0 0 a+ n R: base d? 
      00A4CE CD 85 C5         [ 4]  107     CALL RAT   ; a 0 0 a+ n d? R: base d?
      002451                        108     _QBRAN NUMQ0
      00A4D1 CD 85 18         [ 4]    1     CALL QBRAN
      00A4D4 A4 E2                    2     .word NUMQ0
                                    109 ; update a and count
      00A4D6 CD 86 18         [ 4]  110     CALL SWAPP 
      00A4D9 CD 8B 4B         [ 4]  111     CALL ONEP 
      00A4DC CD 86 18         [ 4]  112     CALL SWAPP 
      00A4DF CD 8B 58         [ 4]  113     CALL ONEM  ; a 0 0 a+ n- R: base d?
                                    114 ; check for '$' hexadecimal  
      00A4E2                        115 NUMQ0: 
      00A4E2 CD 86 30         [ 4]  116     CALL OVER   
      00A4E5 CD 85 81         [ 4]  117     CALL CAT   
      002468                        118     _DOLIT '$'
      00A4E8 CD 84 EF         [ 4]    1     CALL DOLIT 
      00A4EB 00 24                    2     .word '$' 
      00A4ED CD 88 CE         [ 4]  119     CALL EQUAL ; a 0 0 a+ n- f  
      002470                        120     _QBRAN NUMQ1 
      00A4F0 CD 85 18         [ 4]    1     CALL QBRAN
      00A4F3 A5 04                    2     .word NUMQ1
      00A4F5 CD 8E 4C         [ 4]  121     CALL HEX   ; switch to hexadecimal base 
                                    122 ; update a and count 
      00A4F8 CD 86 18         [ 4]  123     CALL SWAPP 
      00A4FB CD 8B 4B         [ 4]  124     CALL ONEP 
      00A4FE CD 86 18         [ 4]  125     CALL SWAPP
      00A501 CD 8B 58         [ 4]  126     CALL ONEM ; a 0 0 a+ n-  R: base d?
                                    127 ; check for minus sign 
      00A504                        128 NUMQ1: 
      00A504 CD A4 16         [ 4]  129     CALL nsign 
      00A507 CD 85 D1         [ 4]  130     CALL TOR ; R: base d? sign  
                                    131 ; check for end of string     
      00A50A CD 87 BB         [ 4]  132     CALL QDUP    ; a dlo dhi a+ cntr R: base d? sign 
      00248D                        133     _QBRAN NUMQ4 ; yes , not a number 
      00A50D CD 85 18         [ 4]    1     CALL QBRAN
      00A510 A5 4F                    2     .word NUMQ4
      00A512 CD A4 4E         [ 4]  134     CALL parse_digits
      00A515 CD 87 BB         [ 4]  135     CALL QDUP 
      00A518 CD 86 51         [ 4]  136     CALL ZEQUAL  
      00249B                        137     _QBRAN NUMQ4 ; error not end of string  ( a dlo dhi a+ R: base d? sign )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 136.
Hexadecimal [24-Bits]



      00A51B CD 85 18         [ 4]    1     CALL QBRAN
      00A51E A5 4F                    2     .word NUMQ4
      00A520 CD 85 FE         [ 4]  138     CALL DROP  ; a dlo dhi 
      00A523 CD 85 B4         [ 4]  139     CALL RFROM  ; a dlo dhi sign 
      0024A6                        140     _QBRAN NUMQ3
      00A526 CD 85 18         [ 4]    1     CALL QBRAN
      00A529 A5 2E                    2     .word NUMQ3
      00A52B CD 88 6A         [ 4]  141     CALL DNEGA
      00A52E                        142 NUMQ3: 
      00A52E CD 87 CC         [ 4]  143     CALL ROT ; dlo dhi a  R: base d?
      00A531 CD 85 FE         [ 4]  144     CALL DROP
      0024B4                        145     _DOLIT -2  ; double return -2 flag 
      00A534 CD 84 EF         [ 4]    1     CALL DOLIT 
      00A537 FF FE                    2     .word -2 
      00A539 CD 85 B4         [ 4]  146     CALL RFROM ; dlo dhi d? R: base 
      0024BC                        147     _TBRAN NUMQ8 
      00A53C CD 85 26         [ 4]    1     CALL TBRAN 
      00A53F A5 58                    2     .word NUMQ8 
      00A541 CD 86 18         [ 4]  148     CALL SWAPP 
      00A544 CD 85 FE         [ 4]  149     CALL DROP
      00A547 CD 8B 4B         [ 4]  150     CALL ONEP   ; single return -1 flag   
      0024CA                        151     _BRAN NUMQ8
      00A54A CD 85 34         [ 4]    1     CALL BRAN 
      00A54D A5 58                    2     .word NUMQ8 
      00A54F                        152 NUMQ4: ; not end of string error , ( a dlo dhi a+ cntr R: base d? sign )
                           000001   153 .if WANT_FLOAT
      00A54F CD 85 B4         [ 4]  154     CALL RFROM ; sign 
      00A552 CD 85 B4         [ 4]  155     CALL RFROM ; d? 
      00A555 CD AE F6         [ 4]  156     CALL FLOATQ ; ( a dlo dhi a+ cntr sign d? )    
                           000000   157 .else 
                                    158     ADDW X,#4 ; drop dhi a+  , ( a dlo R: base d? sign ) 
                                    159     ADDW SP,#4 ; drop d? sign  R: base 
                                    160     CLRW Y 
                                    161     LDW (X),Y ; dlo replaced by 0 ( -- a 0 R: base ) 
                                    162 .endif 
                                    163 ; restore original base value     
      00A558                        164 NUMQ8: 
      00A558 CD 85 B4         [ 4]  165     CALL RFROM 
      00A55B CD 86 CE         [ 4]  166     CALL BASE 
      00A55E CD 85 51         [ 4]  167     CALL STORE 
      00A561 81               [ 4]  168     RET 
                                    169 
                                    170 
                                    171 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    172 ;    D0= ( d -- 0|-1 )
                                    173 ;    check if double is 0 
                                    174 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0024E2                        175     _HEADER DZEQUAL,3,"D0="
      00A562 A4 99                    1         .word LINK 
                           0024E4     2         LINK=.
      00A564 03                       3         .byte 3  
      00A565 44 30 3D                 4         .ascii "D0="
      00A568                          5         DZEQUAL:
      00A568 CD 86 79         [ 4]  176     CALL ORR 
      00A56B A6 FF            [ 1]  177     LD A,#0xFF
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 137.
Hexadecimal [24-Bits]



      00A56D 90 93            [ 1]  178     LDW Y,X
      00A56F 90 FE            [ 2]  179     LDW Y,(Y)
      00A571 90 A3 00 00      [ 2]  180     CPW Y,#0 
      00A575 27 01            [ 1]  181     JREQ  ZEQ1
      00A577 4F               [ 1]  182     CLR A   ;false
      00A578                        183 ZEQ1:
      00A578 F7               [ 1]  184     LD     (X),A
      00A579 E7 01            [ 1]  185     LD (1,X),A
      00A57B 81               [ 4]  186 	RET     
                                    187     
                                    188 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    189 ;  2NEGATE ( d -- d )
                                    190 ;  negate double (2's complement)
                                    191 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0024FC                        192     _HEADER DNEGAT,7,"2NEGATE"
      00A57C A5 64                    1         .word LINK 
                           0024FE     2         LINK=.
      00A57E 07                       3         .byte 7  
      00A57F 32 4E 45 47 41 54 45     4         .ascii "2NEGATE"
      00A586                          5         DNEGAT:
      00A586 CD 88 47         [ 4]  193     CALL INVER
      00A589 CD 86 18         [ 4]  194     CALL SWAPP 
      00A58C CD 88 47         [ 4]  195     CALL INVER 
      00A58F 90 93            [ 1]  196     LDW  Y,X 
      00A591 90 FE            [ 2]  197     LDW Y,(Y)
      00A593 72 A9 00 01      [ 2]  198     ADDW Y,#1 
      00A597 FF               [ 2]  199     LDW (X),Y 
      00A598 24 0B            [ 1]  200     JRNC DNEG1 
      00A59A 90 93            [ 1]  201     LDW Y,X 
      00A59C 90 EE 02         [ 2]  202     LDW Y,(2,Y)
      00A59F 72 A9 00 01      [ 2]  203     ADDW Y,#1
      00A5A3 EF 02            [ 2]  204     LDW (2,X),Y 
      00A5A5                        205 DNEG1:
      00A5A5 CD 86 18         [ 4]  206     CALL SWAPP 
      00A5A8 81               [ 4]  207     RET      
                                    208 
                                    209 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    210 ;   DABS ( d -- d )
                                    211 ;   absolute value of double
                                    212 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002529                        213     _HEADER DABS,4,"DABS"
      00A5A9 A5 7E                    1         .word LINK 
                           00252B     2         LINK=.
      00A5AB 04                       3         .byte 4  
      00A5AC 44 41 42 53              4         .ascii "DABS"
      00A5B0                          5         DABS:
      00A5B0 CD 86 08         [ 4]  214     CALL DUPP 
      00A5B3 CD 86 3F         [ 4]  215     CALL ZLESS 
      002536                        216     _QBRAN DABS1 
      00A5B6 CD 85 18         [ 4]    1     CALL QBRAN
      00A5B9 A5 BE                    2     .word DABS1
      00A5BB CD 88 6A         [ 4]  217     CALL DNEGA 
      00A5BE                        218 DABS1:
      00A5BE 81               [ 4]  219     RET 
                                    220 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 138.
Hexadecimal [24-Bits]



                                    221 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    222 ;  DSIGN ( d -- d f )
                                    223 ;  sign of double 
                                    224 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00253F                        225     _HEADER DSIGN,5,"DSIGN"
      00A5BF A5 AB                    1         .word LINK 
                           002541     2         LINK=.
      00A5C1 05                       3         .byte 5  
      00A5C2 44 53 49 47 4E           4         .ascii "DSIGN"
      00A5C7                          5         DSIGN:
      00A5C7 A6 00            [ 1]  226     LD A,#0 
      00A5C9 90 93            [ 1]  227     LDW Y,X 
      00A5CB 90 FE            [ 2]  228     LDW Y,(Y)
      00A5CD 2A 02            [ 1]  229     JRPL DSIGN1
      00A5CF A6 FF            [ 1]  230     LD A,#0XFF 
      00A5D1                        231 DSIGN1:
      00A5D1 1D 00 02         [ 2]  232     SUBW X,#2 
      00A5D4 F7               [ 1]  233     LD (X),A 
      00A5D5 E7 01            [ 1]  234     LD (1,X),A 
      00A5D7 81               [ 4]  235     RET 
                                    236 
                                    237 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    238 ;   D/MOD ( d s - r qd )
                                    239 ;   unsigned divide double by single 
                                    240 ;   return double quotient 
                                    241 ;   and single remainder 
                                    242 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002558                        243     _HEADER DSLMOD,5,"D/MOD"
      00A5D8 A5 C1                    1         .word LINK 
                           00255A     2         LINK=.
      00A5DA 05                       3         .byte 5  
      00A5DB 44 2F 4D 4F 44           4         .ascii "D/MOD"
      00A5E0                          5         DSLMOD:
      00A5E0 90 93            [ 1]  244         LDW     Y,X             ; stack pointer to Y
      00A5E2 FE               [ 2]  245         LDW     X,(X)           ; un
      00A5E3 BF 26            [ 2]  246         LDW     YTEMP,X         ; save un
      00A5E5 93               [ 1]  247         LDW     X,Y
      00A5E6 89               [ 2]  248         PUSHW   X               ; save stack pointer
      00A5E7 90 89            [ 2]  249         PUSHW   Y 
      00A5E9 EE 02            [ 2]  250         LDW     X,(2,X)           ; X=udh
      00A5EB 90 BE 26         [ 2]  251         LDW     Y,YTEMP         ; divisor 
      00A5EE 65               [ 2]  252         DIVW    X,Y 
      00A5EF BF 24            [ 2]  253         LDW     XTEMP,X         ; QUOTIENT hi 
      00A5F1 93               [ 1]  254         LDW     X,Y             ; remainder in X 
      00A5F2 90 85            [ 2]  255         POPW    Y 
      00A5F4 90 EE 04         [ 2]  256         LDW     Y,(4,Y)         ; Y=udl (offset before drop)
      00A5F7 A6 10            [ 1]  257         LD      A,#16           ; loop count
      00A5F9 90 58            [ 2]  258         SLLW    Y               ; udl shift udl into udh
      00A5FB                        259 DSLMOD3:
      00A5FB 59               [ 2]  260         RLCW    X               ; rotate udl bit into uhdh (= remainder)
      00A5FC 25 04            [ 1]  261         JRC     DSLMODa         ; if carry out of rotate
      00A5FE B3 26            [ 2]  262         CPW     X,YTEMP         ; compare udh to un
      00A600 25 05            [ 1]  263         JRULT   DSLMOD4         ; can't subtract
      00A602                        264 DSLMODa:
      00A602 72 B0 00 26      [ 2]  265         SUBW    X,YTEMP         ; can subtract
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 139.
Hexadecimal [24-Bits]



      00A606 98               [ 1]  266         RCF
      00A607                        267 DSLMOD4:
      00A607 8C               [ 1]  268         CCF                     ; quotient bit
      00A608 90 59            [ 2]  269         RLCW    Y               ; rotate into quotient, rotate out udl
      00A60A 4A               [ 1]  270         DEC     A               ; repeat
      00A60B 26 EE            [ 1]  271         JRNE    DSLMOD3           ; if A == 0
      00A60D                        272 DSLMODb:
      00A60D BF 26            [ 2]  273         LDW     YTEMP,X         ; done, save remainder
      00A60F 85               [ 2]  274         POPW    X               ; restore stack pointer
      00A610 EF 02            [ 2]  275         LDW     (2,X),Y           ; save quotient low 
      00A612 90 BE 24         [ 2]  276         LDW     Y,XTEMP         ; quotient hi 
      00A615 FF               [ 2]  277         LDW     (X),Y           ; save quotient hi 
      00A616 90 BE 26         [ 2]  278         LDW     Y,YTEMP         ; remainder onto stack
      00A619 EF 04            [ 2]  279         LDW     (4,X),Y
      00A61B 81               [ 4]  280         RET 
                                    281 
                                    282 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    283 ;   D# ( d -- d )
                                    284 ;   extract least digit 
                                    285 ;   from double integer 
                                    286 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00259C                        287     _HEADER DDIG,2,"D#"
      00A61C A5 DA                    1         .word LINK 
                           00259E     2         LINK=.
      00A61E 02                       3         .byte 2  
      00A61F 44 23                    4         .ascii "D#"
      00A621                          5         DDIG:
      00A621 CD 86 CE         [ 4]  288     CALL BASE 
      00A624 CD 85 63         [ 4]  289     CALL AT 
      00A627 CD A5 E0         [ 4]  290     CALL DSLMOD
      00A62A CD 87 CC         [ 4]  291     CALL ROT   
      00A62D CD 8D 75         [ 4]  292     CALL DIGIT 
      00A630 CD 8D C1         [ 4]  293     CALL HOLD 
      00A633 81               [ 4]  294     RET 
                                    295 
                                    296 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    297 ;    D#S ( d -- s )
                                    298 ;   extract digit from double 
                                    299 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0025B4                        300     _HEADER DDIGS,3,"D#S"
      00A634 A6 1E                    1         .word LINK 
                           0025B6     2         LINK=.
      00A636 03                       3         .byte 3  
      00A637 44 23 53                 4         .ascii "D#S"
      00A63A                          5         DDIGS:
      00A63A CD A6 21         [ 4]  301     CALL    DDIG 
      00A63D CD 88 18         [ 4]  302     CALL    DDUP 
      00A640 CD A5 68         [ 4]  303     CALL    DZEQUAL
      0025C3                        304     _QBRAN  DDIGS 
      00A643 CD 85 18         [ 4]    1     CALL QBRAN
      00A646 A6 3A                    2     .word DDIGS
      00A648 CD 85 FE         [ 4]  305     CALL    DROP 
      00A64B 81               [ 4]  306     RET 
                                    307 
                                    308 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 140.
Hexadecimal [24-Bits]



                                    309 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    310 ;   D. ( d -- )
                                    311 ;   display double integer 
                                    312 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0025CC                        313     _HEADER DDOT,2,"D."
      00A64C A6 36                    1         .word LINK 
                           0025CE     2         LINK=.
      00A64E 02                       3         .byte 2  
      00A64F 44 2E                    4         .ascii "D."
      00A651                          5         DDOT:
      00A651 CD 8E ED         [ 4]  314     CALL SPACE 
      00A654 CD A5 C7         [ 4]  315     CALL DSIGN 
      00A657 CD 85 D1         [ 4]  316     CALL TOR
      00A65A CD 85 C5         [ 4]  317     CALL RAT 
      0025DD                        318     _QBRAN DDOT0
      00A65D CD 85 18         [ 4]    1     CALL QBRAN
      00A660 A6 65                    2     .word DDOT0
      00A662 CD 88 6A         [ 4]  319     CALL DNEGA 
      00A665                        320 DDOT0:     
      00A665 CD 8D B1         [ 4]  321     CALL BDIGS 
      00A668 CD A6 3A         [ 4]  322     CALL DDIGS 
      00A66B CD 85 B4         [ 4]  323     CALL RFROM 
      0025EE                        324     _QBRAN DDOT1 
      00A66E CD 85 18         [ 4]    1     CALL QBRAN
      00A671 A6 7B                    2     .word DDOT1
      0025F3                        325     _DOLIT '-' 
      00A673 CD 84 EF         [ 4]    1     CALL DOLIT 
      00A676 00 2D                    2     .word '-' 
      00A678 CD 8D C1         [ 4]  326     CALL HOLD 
      00A67B                        327 DDOT1: 
      00A67B CD 8E 16         [ 4]  328     CALL EDIGS 
      00A67E CD 8F 17         [ 4]  329     CALL TYPES     
      00A681 81               [ 4]  330     RET 
                                    331 
                                    332 
                                    333 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    334 ; multiply double by single 
                                    335 ; return double 
                                    336 ;  ( d s -- d )
                                    337 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002602                        338     _HEADER DSSTAR,3,"DS*"
      00A682 A6 4E                    1         .word LINK 
                           002604     2         LINK=.
      00A684 03                       3         .byte 3  
      00A685 44 53 2A                 4         .ascii "DS*"
      00A688                          5         DSSTAR:
                                    339 ;DSSTAR:
      00A688 CD 85 D1         [ 4]  340     CALL TOR
      00A68B CD 86 08         [ 4]  341     CALL DUPP 
      00A68E CD 86 3F         [ 4]  342     CALL ZLESS
      00A691 CD 86 08         [ 4]  343     CALL DUPP 
      00A694 CD 85 D1         [ 4]  344     CALL TOR 
      002617                        345     _QBRAN DSSTAR1 
      00A697 CD 85 18         [ 4]    1     CALL QBRAN
      00A69A A6 9F                    2     .word DSSTAR1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 141.
Hexadecimal [24-Bits]



      00A69C CD 88 6A         [ 4]  346     CALL DNEGA 
      00A69F                        347 DSSTAR1:
      00A69F CD 85 B4         [ 4]  348     CALL RFROM 
      00A6A2 CD 87 EB         [ 4]  349     CALL NROT       
      00A6A5 CD 86 18         [ 4]  350     CALL SWAPP 
      00A6A8 CD 85 C5         [ 4]  351     CALL RAT 
      00A6AB CD 8A 80         [ 4]  352     CALL UMSTA
      00A6AE CD 87 CC         [ 4]  353     CALL ROT 
      00A6B1 CD 85 B4         [ 4]  354     CALL RFROM 
      00A6B4 CD 8A 80         [ 4]  355     CALL UMSTA 
      00A6B7 CD 85 FE         [ 4]  356     CALL DROP ; DROP OVERFLOW 
      00A6BA CD 88 2D         [ 4]  357     CALL PLUS 
      00A6BD CD 87 CC         [ 4]  358     CALL ROT 
      002640                        359     _QBRAN DSSTAR3 
      00A6C0 CD 85 18         [ 4]    1     CALL QBRAN
      00A6C3 A6 C8                    2     .word DSSTAR3
      00A6C5 CD 88 6A         [ 4]  360     CALL DNEGA 
      00A6C8                        361 DSSTAR3:
      00A6C8 81               [ 4]  362     RET 
                                    363 
                                    364 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    365 ;  2SWAP ( d1 d2 -- d2 d1 )
                                    366 ;  swap double 
                                    367 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002649                        368     _HEADER DSWAP,5,"2SWAP"
      00A6C9 A6 84                    1         .word LINK 
                           00264B     2         LINK=.
      00A6CB 05                       3         .byte 5  
      00A6CC 32 53 57 41 50           4         .ascii "2SWAP"
      00A6D1                          5         DSWAP:
      00A6D1 90 93            [ 1]  369     LDW Y,X 
      00A6D3 90 FE            [ 2]  370     LDW Y,(Y)
      00A6D5 90 BF 26         [ 2]  371     LDW YTEMP,Y ; d2 hi 
      00A6D8 90 93            [ 1]  372     LDW Y,X 
      00A6DA 90 EE 02         [ 2]  373     LDW Y,(2,Y)
      00A6DD 90 BF 24         [ 2]  374     LDW XTEMP,Y  ; d2 lo 
      00A6E0 90 93            [ 1]  375     LDW Y,X 
      00A6E2 90 EE 04         [ 2]  376     LDW Y,(4,Y)  ; d1 hi 
      00A6E5 FF               [ 2]  377     LDW (X),Y 
      00A6E6 90 93            [ 1]  378     LDW Y,X
      00A6E8 90 EE 06         [ 2]  379     LDW Y,(6,Y)  ; d1 lo 
      00A6EB EF 02            [ 2]  380     LDW (2,X),Y
      00A6ED 90 BE 26         [ 2]  381     LDW Y,YTEMP  
      00A6F0 EF 04            [ 2]  382     LDW (4,X),Y 
      00A6F2 90 BE 24         [ 2]  383     LDW Y,XTEMP 
      00A6F5 EF 06            [ 2]  384     LDW (6,X),Y 
      00A6F7 81               [ 4]  385     RET 
                                    386 
                                    387 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    388 ;    DCLZ ( d -- u )
                                    389 ;    double count leading zeros
                                    390 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002678                        391     _HEADER DCLZ,4,"DCLZ"
      00A6F8 A6 CB                    1         .word LINK 
                           00267A     2         LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 142.
Hexadecimal [24-Bits]



      00A6FA 04                       3         .byte 4  
      00A6FB 44 43 4C 5A              4         .ascii "DCLZ"
      00A6FF                          5         DCLZ:
      00A6FF 4F               [ 1]  392     CLR A 
      00A700 90 93            [ 1]  393     LDW Y,X 
      00A702 90 FE            [ 2]  394     LDW Y,(Y)
      00A704 2B 18            [ 1]  395     JRMI DCLZ8 ; no leading zero 
      00A706 27 09            [ 1]  396     JREQ DCLZ4 ; >=16 
      00A708                        397 DCLZ1: ; <16
      00A708 90 58            [ 2]  398     SLLW Y
      00A70A 4C               [ 1]  399     INC A 
      00A70B 90 5D            [ 2]  400     TNZW Y 
      00A70D 2B 0F            [ 1]  401     JRMI DCLZ8
      00A70F 20 F7            [ 2]  402     JRA DCLZ1 
      00A711                        403 DCLZ4:
      00A711 A6 10            [ 1]  404     LD A,#16 
      00A713 90 93            [ 1]  405     LDW Y,X 
      00A715 90 EE 02         [ 2]  406     LDW Y,(2,Y)
      00A718 2B 04            [ 1]  407     JRMI DCLZ8 
      00A71A 26 EC            [ 1]  408     JRNE DCLZ1 
      00A71C AB 10            [ 1]  409     ADD A,#16
      00A71E                        410 DCLZ8: 
      00A71E 1C 00 02         [ 2]  411     ADDW X,#2 
      00A721 90 5F            [ 1]  412     CLRW Y 
      00A723 90 97            [ 1]  413     LD YL,A 
      00A725 FF               [ 2]  414     LDW (X),Y 
      00A726 81               [ 4]  415     RET 
                                    416 
                                    417 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    418 ;   2<ROT ( d1 d2 d3 -- d3 d1 d2 )
                                    419 ;   rotate left doubles 
                                    420 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0026A7                        421     _HEADER NDROT,5,"2<ROT"
      00A727 A6 FA                    1         .word LINK 
                           0026A9     2         LINK=.
      00A729 05                       3         .byte 5  
      00A72A 32 3C 52 4F 54           4         .ascii "2<ROT"
      00A72F                          5         NDROT:
                                    422 ; save d3 in temp 
      00A72F 90 93            [ 1]  423     LDW Y,X 
      00A731 90 FE            [ 2]  424     LDW Y,(Y)
      00A733 90 BF 26         [ 2]  425     LDW YTEMP,Y  ; d3 hi 
      00A736 90 93            [ 1]  426     LDW Y,X 
      00A738 90 EE 02         [ 2]  427     LDW Y,(2,Y)
      00A73B 90 BF 24         [ 2]  428     LDW XTEMP,Y  ; d3 lo 
                                    429 ; put d2 in d1 slot 
      00A73E 90 93            [ 1]  430     LDW Y,X 
      00A740 90 EE 04         [ 2]  431     LDW Y,(4,Y) 
      00A743 FF               [ 2]  432     LDW (X),Y   ; d2 hi 
      00A744 90 93            [ 1]  433     LDW Y,X 
      00A746 90 EE 06         [ 2]  434     LDW Y,(6,Y)
      00A749 EF 02            [ 2]  435     LDW (2,X),Y ; d2 lo
                                    436 ; put d1 in d2 slot 
      00A74B 90 93            [ 1]  437     LDW Y,X 
      00A74D 90 EE 08         [ 2]  438     LDW Y,(8,Y) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 143.
Hexadecimal [24-Bits]



      00A750 EF 04            [ 2]  439     LDW (4,X),Y ; d1 hi 
      00A752 90 93            [ 1]  440     LDW Y,X 
      00A754 90 EE 0A         [ 2]  441     LDW Y,(10,Y)
      00A757 EF 06            [ 2]  442     LDW (6,X),Y  ; d1 lo 
                                    443 ; put d3 in d1 slot 
      00A759 90 BE 26         [ 2]  444     LDW Y,YTEMP 
      00A75C EF 08            [ 2]  445     LDW (8,X),Y  ; d3 hi 
      00A75E 90 BE 24         [ 2]  446     LDW Y,XTEMP 
      00A761 EF 0A            [ 2]  447     LDW (10,X),Y  ; d3 lo 
      00A763 81               [ 4]  448     RET 
                                    449 
                                    450 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    451 ;   2ROT ( d1 d2 d3 -- d2 d3 d1 )
                                    452 ;   rotate right doubles 
                                    453 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0026E4                        454     _HEADER DROT,4,"2ROT"
      00A764 A7 29                    1         .word LINK 
                           0026E6     2         LINK=.
      00A766 04                       3         .byte 4  
      00A767 32 52 4F 54              4         .ascii "2ROT"
      00A76B                          5         DROT:
                                    455 ; save d3 in temp 
      00A76B 90 93            [ 1]  456     LDW Y,X 
      00A76D 90 FE            [ 2]  457     LDW Y,(Y)
      00A76F 90 BF 26         [ 2]  458     LDW YTEMP,Y ; d3 hi 
      00A772 90 93            [ 1]  459     LDW Y,X 
      00A774 90 EE 02         [ 2]  460     LDW Y,(2,Y)
      00A777 90 BF 24         [ 2]  461     LDW XTEMP,Y ; d3 lo 
                                    462 ; put d1 in d3 slot 
      00A77A 90 93            [ 1]  463     LDW Y,X 
      00A77C 90 EE 08         [ 2]  464     LDW Y,(8,Y)
      00A77F FF               [ 2]  465     LDW (X),Y  ; d1 hi 
      00A780 90 93            [ 1]  466     LDW Y,X 
      00A782 90 EE 0A         [ 2]  467     LDW Y,(10,Y) 
      00A785 EF 02            [ 2]  468     LDW (2,X),Y ; d1 lo 
                                    469 ; put d2 in d1 slot 
      00A787 90 93            [ 1]  470     LDW Y,X 
      00A789 90 EE 04         [ 2]  471     LDW Y,(4,Y) ; d2 hi 
      00A78C EF 08            [ 2]  472     LDW (8,X),Y 
      00A78E 90 93            [ 1]  473     LDW Y,X 
      00A790 90 EE 06         [ 2]  474     LDW Y,(6,Y) ; d2 lo 
      00A793 EF 0A            [ 2]  475     LDW (10,X),Y 
                                    476 ; put d3 in d2 slot 
      00A795 90 BE 26         [ 2]  477     LDW Y,YTEMP 
      00A798 EF 04            [ 2]  478     LDW (4,X),Y 
      00A79A 90 BE 24         [ 2]  479     LDW Y,XTEMP 
      00A79D EF 06            [ 2]  480     LDW (6,X),Y 
      00A79F 81               [ 4]  481     RET 
                                    482 
                                    483 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    484 ;   D= ( d1 d2 -- f )
                                    485 ;   d1==d2?
                                    486 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002720                        487     _HEADER DEQUAL,2,"D="
      00A7A0 A7 66                    1         .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 144.
Hexadecimal [24-Bits]



                           002722     2         LINK=.
      00A7A2 02                       3         .byte 2  
      00A7A3 44 3D                    4         .ascii "D="
      00A7A5                          5         DEQUAL:
      00A7A5 A6 00            [ 1]  488     LD A,#0 
      00A7A7 90 93            [ 1]  489     LDW Y,X 
      00A7A9 90 FE            [ 2]  490     LDW Y,(Y)
      00A7AB E3 04            [ 2]  491     CPW Y,(4,X)
      00A7AD 26 0B            [ 1]  492     JRNE DEQU4 
      00A7AF 90 93            [ 1]  493     LDW Y,X 
      00A7B1 90 EE 02         [ 2]  494     LDW Y,(2,Y)
      00A7B4 E3 06            [ 2]  495     CPW Y,(6,X)
      00A7B6 26 02            [ 1]  496     JRNE DEQU4 
      00A7B8 A6 FF            [ 1]  497     LD A,#0XFF
      00A7BA                        498 DEQU4:
      00A7BA 1C 00 06         [ 2]  499     ADDW X,#6
      00A7BD F7               [ 1]  500     LD (X),A 
      00A7BE E7 01            [ 1]  501     LD (1,X),A 
      00A7C0 81               [ 4]  502     RET 
                                    503 
                                    504 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    505 ;   D> ( d1 d2 -- f )
                                    506 ;   d1>d2?
                                    507 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002741                        508     _HEADER DGREAT,2,"D>"
      00A7C1 A7 A2                    1         .word LINK 
                           002743     2         LINK=.
      00A7C3 02                       3         .byte 2  
      00A7C4 44 3E                    4         .ascii "D>"
      00A7C6                          5         DGREAT:
      00A7C6 A6 FF            [ 1]  509     LD A,#0XFF 
      00A7C8 90 93            [ 1]  510     LDW Y,X 
      00A7CA 90 EE 04         [ 2]  511     LDW Y,(4,Y)  ; d1 hi 
      00A7CD F3               [ 2]  512     CPW Y,(X)    ; d2 hi 
      00A7CE 2C 0B            [ 1]  513     JRSGT DGREAT4 
      00A7D0 90 93            [ 1]  514     LDW Y,X 
      00A7D2 90 EE 06         [ 2]  515     LDW Y,(6,Y)
      00A7D5 E3 02            [ 2]  516     CPW Y,(2,X)
      00A7D7 22 02            [ 1]  517     JRUGT DGREAT4 
      00A7D9 A6 00            [ 1]  518     LD A,#0
      00A7DB                        519 DGREAT4:
      00A7DB 1C 00 06         [ 2]  520     ADDW X,#6
      00A7DE F7               [ 1]  521     LD (X),A 
      00A7DF E7 01            [ 1]  522     LD (1,X),A 
      00A7E1 81               [ 4]  523     RET
                                    524 
                                    525 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    526 ;   D< ( d1 d2 -- f )
                                    527 ;   d1<d2? 
                                    528 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002762                        529     _HEADER DLESS,2,"D<"
      00A7E2 A7 C3                    1         .word LINK 
                           002764     2         LINK=.
      00A7E4 02                       3         .byte 2  
      00A7E5 44 3C                    4         .ascii "D<"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 145.
Hexadecimal [24-Bits]



      00A7E7                          5         DLESS:
      00A7E7 CD AB 47         [ 4]  530     CALL DSUB
      00276A                        531     _DOLIT 0 
      00A7EA CD 84 EF         [ 4]    1     CALL DOLIT 
      00A7ED 00 00                    2     .word 0 
      00A7EF CD 87 EB         [ 4]  532     CALL NROT  
      00A7F2 CD A8 04         [ 4]  533     CALL DZLESS 
      002775                        534     _QBRAN DLESS4
      00A7F5 CD 85 18         [ 4]    1     CALL QBRAN
      00A7F8 A7 FD                    2     .word DLESS4
      00A7FA CD 88 47         [ 4]  535     CALL INVER  
      00A7FD                        536 DLESS4:
      00A7FD 81               [ 4]  537     RET
                                    538 
                                    539 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    540 ;  D0< ( d -- f )
                                    541 ;  d<0? 
                                    542 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00277E                        543     _HEADER DZLESS,3,"D0<"
      00A7FE A7 E4                    1         .word LINK 
                           002780     2         LINK=.
      00A800 03                       3         .byte 3  
      00A801 44 30 3C                 4         .ascii "D0<"
      00A804                          5         DZLESS:
      00A804 A6 00            [ 1]  544     LD A,#0 
      00A806 90 93            [ 1]  545     LDW Y,X 
      00A808 90 FE            [ 2]  546     LDW Y,(Y)
      00A80A 2A 02            [ 1]  547     JRPL DZLESS1 
      00A80C A6 FF            [ 1]  548     LD A,#0XFF 
      00A80E                        549 DZLESS1:
      00A80E 1C 00 02         [ 2]  550     ADDW X,#2 
      00A811 F7               [ 1]  551     LD (X),A 
      00A812 E7 01            [ 1]  552     LD (1,X),A    
      00A814 81               [ 4]  553     RET 
                                    554 
                                    555 
                                    556 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    557 ;  DCMP ( d1 d2 -- d1 d2 -1|0|1 )
                                    558 ; compare 2 doubles 
                                    559 ; keep the doubles 
                                    560 ; return flag: 
                                    561 ;    -1 if d1<d2 
                                    562 ;     0 if d1==d2
                                    563 ;     1 if d1>d2 
                                    564 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002795                        565     _HEADER DCMP,4,"DCMP"
      00A815 A8 00                    1         .word LINK 
                           002797     2         LINK=.
      00A817 04                       3         .byte 4  
      00A818 44 43 4D 50              4         .ascii "DCMP"
      00A81C                          5         DCMP:
      00A81C 90 93            [ 1]  566     LDW Y,X 
      00A81E 90 EE 04         [ 2]  567     LDW Y,(4,Y)
      00A821 F3               [ 2]  568     CPW Y,(X) 
      00A822 27 04            [ 1]  569     JREQ DCMP2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 146.
Hexadecimal [24-Bits]



      00A824 2F 13            [ 1]  570     JRSLT DCMP_SMALL 
      00A826 20 17            [ 2]  571     JRA  DCMP_GREAT 
      00A828                        572 DCMP2:    
      00A828 90 93            [ 1]  573     LDW Y,X 
      00A82A 90 EE 06         [ 2]  574     LDW Y,(6,Y)
      00A82D E3 02            [ 2]  575     CPW Y,(2,X)
      00A82F 27 04            [ 1]  576     JREQ DCMP_EQUAL  
      00A831 25 06            [ 1]  577     JRULT DCMP_SMALL 
      00A833 20 0A            [ 2]  578     JRA DCMP_GREAT
      00A835                        579 DCMP_EQUAL:
      00A835 90 5F            [ 1]  580     CLRW Y 
      00A837 20 0A            [ 2]  581     JRA DCMP4 
      00A839                        582 DCMP_SMALL:
      00A839 90 AE FF FF      [ 2]  583     LDW Y,#-1 
      00A83D 20 04            [ 2]  584     JRA DCMP4 
      00A83F                        585 DCMP_GREAT:
      00A83F 90 AE 00 01      [ 2]  586     LDW Y,#1
      00A843                        587 DCMP4:
      00A843 1D 00 02         [ 2]  588     SUBW X,#2 
      00A846 FF               [ 2]  589     LDW (X),Y 
      00A847 81               [ 4]  590     RET
                                    591 
                                    592 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    593 ;   2>R ( d -- R: d )
                                    594 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0027C8                        595     _HEADER DTOR,3,"2>R"
      00A848 A8 17                    1         .word LINK 
                           0027CA     2         LINK=.
      00A84A 03                       3         .byte 3  
      00A84B 32 3E 52                 4         .ascii "2>R"
      00A84E                          5         DTOR:
      00A84E 90 85            [ 2]  596     POPW Y 
      00A850 90 BF 26         [ 2]  597     LDW YTEMP,Y 
      00A853 90 93            [ 1]  598     LDW Y,X 
      00A855 90 EE 02         [ 2]  599     LDW Y,(2,Y)
      00A858 90 89            [ 2]  600     PUSHW Y   ; d low 
      00A85A 90 93            [ 1]  601     LDW Y,X 
      00A85C 90 FE            [ 2]  602     LDW Y,(Y)
      00A85E 90 89            [ 2]  603     PUSHW Y   ; d hi 
      00A860 1C 00 04         [ 2]  604     ADDW X,#4  
      00A863 92 CC 26         [ 5]  605     JP [YTEMP]
                                    606 
                                    607 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    608 ;  2R> ( -- d ) R: d --      
                                    609 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0027E6                        610     _HEADER DRFROM,3,"2R>"
      00A866 A8 4A                    1         .word LINK 
                           0027E8     2         LINK=.
      00A868 03                       3         .byte 3  
      00A869 32 52 3E                 4         .ascii "2R>"
      00A86C                          5         DRFROM:
      00A86C 90 85            [ 2]  611     POPW Y      ; d hi 
      00A86E 90 BF 26         [ 2]  612     LDW YTEMP,Y 
      00A871 1D 00 04         [ 2]  613     SUBW X,#4
      00A874 90 85            [ 2]  614     POPW Y       ; d hi 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 147.
Hexadecimal [24-Bits]



      00A876 FF               [ 2]  615     LDW (X),Y 
      00A877 90 85            [ 2]  616     POPW Y       ; d low  
      00A879 EF 02            [ 2]  617     LDW (2,X),Y 
      00A87B 92 CC 26         [ 5]  618     JP [YTEMP]
                                    619     
                                    620 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    621 ;   2R@ ( -- d )
                                    622 ;   fecth a double from RSTACK
                                    623 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0027FE                        624     _HEADER DRAT,3,"2R@"
      00A87E A8 68                    1         .word LINK 
                           002800     2         LINK=.
      00A880 03                       3         .byte 3  
      00A881 32 52 40                 4         .ascii "2R@"
      00A884                          5         DRAT:
      00A884 90 85            [ 2]  625     POPW Y 
      00A886 90 BF 26         [ 2]  626     LDW YTEMP,Y 
      00A889 1D 00 04         [ 2]  627     SUBW X,#4 
      00A88C 16 01            [ 2]  628     LDW Y,(1,SP)
      00A88E FF               [ 2]  629     LDW (X),Y 
      00A88F 16 03            [ 2]  630     LDW Y,(3,SP)
      00A891 EF 02            [ 2]  631     LDW (2,X),Y 
      00A893 92 CC 26         [ 5]  632     JP [YTEMP]
                                    633 
                                    634 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    635 ;  2VARIABLE <name> 
                                    636 ;  create a double variable 
                                    637 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002816                        638     _HEADER DVARIA,9,"2VARIABLE"
      00A896 A8 80                    1         .word LINK 
                           002818     2         LINK=.
      00A898 09                       3         .byte 9  
      00A899 32 56 41 52 49 41 42     4         .ascii "2VARIABLE"
             4C 45
      00A8A2                          5         DVARIA:
      00A8A2 CD 8C 94         [ 4]  639         CALL HERE
      00A8A5 CD 86 08         [ 4]  640         CALL DUPP
      002828                        641         _DOLIT 4  
      00A8A8 CD 84 EF         [ 4]    1     CALL DOLIT 
      00A8AB 00 04                    2     .word 4 
      00A8AD CD 88 2D         [ 4]  642         CALL PLUS 
      00A8B0 CD 87 5F         [ 4]  643         CALL VPP 
      00A8B3 CD 85 51         [ 4]  644         CALL STORE
      00A8B6 CD 98 70         [ 4]  645         CALL CREAT
      00A8B9 CD 86 08         [ 4]  646         CALL DUPP
      00A8BC CD 94 D7         [ 4]  647         CALL COMMA
      00A8BF CD 8B B7         [ 4]  648         CALL ZERO
      00A8C2 CD 86 30         [ 4]  649         CALL OVER 
      00A8C5 CD 85 51         [ 4]  650         CALL STORE 
      00A8C8 CD 8B B7         [ 4]  651         CALL ZERO 
      00A8CB CD 86 18         [ 4]  652         CALL SWAPP 
      00A8CE CD 85 51         [ 4]  653         CALL STORE
      00A8D1 CD A1 76         [ 4]  654         CALL FMOVE ; move definition to FLASH
      00A8D4 CD 87 BB         [ 4]  655         CALL QDUP 
      00A8D7 CD 85 18         [ 4]  656         CALL QBRAN 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 148.
Hexadecimal [24-Bits]



      00A8DA 98 BD                  657         .word SET_RAMLAST   
      00A8DC CD 9C 1E         [ 4]  658         call UPDATVP  ; don't update if variable kept in RAM.
      00A8DF CD A2 0A         [ 4]  659         CALL UPDATPTR
      00A8E2 81               [ 4]  660         RET         
                                    661 
                                    662 
                                    663 
                                    664 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    665 ;  2LITERAL ( d -- )
                                    666 ;  compile double literal 
                                    667 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002863                        668     _HEADER DLITER,IMEDD+8,"2LITERAL"
      00A8E3 A8 98                    1         .word LINK 
                           002865     2         LINK=.
      00A8E5 88                       3         .byte IMEDD+8  
      00A8E6 32 4C 49 54 45 52 41     4         .ascii "2LITERAL"
             4C
      00A8EE                          5         DLITER:
      00A8EE CD 95 1C         [ 4]  669     CALL COMPI 
      00A8F1 A8 F9                  670     .word do2lit 
      00A8F3 CD 94 D7         [ 4]  671     CALL COMMA 
      00A8F6 CC 94 D7         [ 2]  672     JP   COMMA 
                                    673 
                                    674 
                                    675 ; runtime for 2LITERAL 
      00A8F9                        676 do2lit:
      00A8F9 1D 00 04         [ 2]  677     SUBW X,#4 
      00A8FC 16 01            [ 2]  678     LDW Y,(1,SP)
      00A8FE 90 FE            [ 2]  679     LDW Y,(Y)
      00A900 FF               [ 2]  680     LDW (X),Y 
      00A901 16 01            [ 2]  681     LDW Y,(1,SP)
      00A903 90 EE 02         [ 2]  682     LDW Y,(2,Y)
      00A906 EF 02            [ 2]  683     LDW (2,X),Y 
      00A908 90 85            [ 2]  684     POPW Y 
      00A90A 90 EC 04         [ 2]  685     JP (4,Y)
                                    686 
                                    687 
                                    688 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    689 ;   2OVER ( d1 d2 -- d1 d2 d1 )
                                    690 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00288D                        691     _HEADER DOVER,5,"2OVER"
      00A90D A8 E5                    1         .word LINK 
                           00288F     2         LINK=.
      00A90F 05                       3         .byte 5  
      00A910 32 4F 56 45 52           4         .ascii "2OVER"
      00A915                          5         DOVER:
      00A915 90 93            [ 1]  692     LDW Y,X 
      00A917 1D 00 04         [ 2]  693     SUBW X,#4 
      00A91A 90 89            [ 2]  694     PUSHW Y 
      00A91C 90 EE 04         [ 2]  695     LDW Y,(4,Y)  ; d1 hi 
      00A91F FF               [ 2]  696     LDW (X),Y 
      00A920 90 85            [ 2]  697     POPW Y 
      00A922 90 EE 06         [ 2]  698     LDW Y,(6,Y)  ;d1 lo 
      00A925 EF 02            [ 2]  699     LDW (2,X),Y 
      00A927 81               [ 4]  700     RET 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 149.
Hexadecimal [24-Bits]



                                    701 
                                    702 
                                    703 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    704 ;   D2/ ( d -- d/2 )
                                    705 ;   divide double by 2 
                                    706 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0028A8                        707     _HEADER D2SLASH,3,"D2/"
      00A928 A9 0F                    1         .word LINK 
                           0028AA     2         LINK=.
      00A92A 03                       3         .byte 3  
      00A92B 44 32 2F                 4         .ascii "D2/"
      00A92E                          5         D2SLASH:
      00A92E 90 93            [ 1]  708     LDW Y,X 
      00A930 90 FE            [ 2]  709     LDW Y,(Y)
      00A932 90 57            [ 2]  710     SRAW Y 
      00A934 FF               [ 2]  711     LDW (X),Y 
      00A935 90 93            [ 1]  712     LDW Y,X 
      00A937 90 EE 02         [ 2]  713     LDW Y,(2,Y)
      00A93A 90 56            [ 2]  714     RRCW Y 
      00A93C EF 02            [ 2]  715     LDW (2,X),Y 
      00A93E 81               [ 4]  716     RET
                                    717 
                                    718 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    719 ;  D2* ( d -- d*2 )
                                    720 ;  multiply double by 2 
                                    721 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0028BF                        722     _HEADER D2STAR,3,"D2*"
      00A93F A9 2A                    1         .word LINK 
                           0028C1     2         LINK=.
      00A941 03                       3         .byte 3  
      00A942 44 32 2A                 4         .ascii "D2*"
      00A945                          5         D2STAR:
      00A945 90 93            [ 1]  723     LDW Y,X 
      00A947 90 EE 02         [ 2]  724     LDW Y,(2,Y)
      00A94A 98               [ 1]  725     RCF 
      00A94B 90 59            [ 2]  726     RLCW Y 
      00A94D EF 02            [ 2]  727     LDW (2,X),Y 
      00A94F 90 93            [ 1]  728     LDW Y,X 
      00A951 90 FE            [ 2]  729     LDW Y,(Y)
      00A953 90 59            [ 2]  730     RLCW Y 
      00A955 FF               [ 2]  731     LDW (X),Y 
      00A956 81               [ 4]  732     RET 
                                    733 
                                    734 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    735 ;   DLSHIFT ( d n -- d )
                                    736 ;   left shift double 
                                    737 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0028D7                        738     _HEADER DLSHIFT,7,"DLSHIFT"
      00A957 A9 41                    1         .word LINK 
                           0028D9     2         LINK=.
      00A959 07                       3         .byte 7  
      00A95A 44 4C 53 48 49 46 54     4         .ascii "DLSHIFT"
      00A961                          5         DLSHIFT:
      00A961 E6 01            [ 1]  739     LD A,(1,X) ; shift count 
      00A963 1C 00 02         [ 2]  740     ADDW X,#2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 150.
Hexadecimal [24-Bits]



      00A966 90 93            [ 1]  741     LDW Y,X 
      00A968 90 FE            [ 2]  742     LDW Y,(Y)
      00A96A 90 BF 26         [ 2]  743     LDW YTEMP,Y  ; d hi 
      00A96D 90 93            [ 1]  744     LDW Y,X 
      00A96F 90 EE 02         [ 2]  745     LDW Y,(2,Y)  ; d low 
      00A972                        746 DLSHIFT1:
      00A972 4D               [ 1]  747     TNZ A 
      00A973 27 12            [ 1]  748     JREQ DLSHIFT2 
      00A975 98               [ 1]  749     RCF 
      00A976 90 59            [ 2]  750     RLCW Y 
      00A978 90 89            [ 2]  751     PUSHW Y 
      00A97A 90 BE 26         [ 2]  752     LDW Y,YTEMP 
      00A97D 90 59            [ 2]  753     RLCW Y 
      00A97F 90 BF 26         [ 2]  754     LDW YTEMP,Y 
      00A982 90 85            [ 2]  755     POPW Y 
      00A984 4A               [ 1]  756     DEC A 
      00A985 20 EB            [ 2]  757     JRA DLSHIFT1 
      00A987                        758 DLSHIFT2:
      00A987 EF 02            [ 2]  759     LDW (2,X),Y 
      00A989 90 BE 26         [ 2]  760     LDW Y,YTEMP 
      00A98C FF               [ 2]  761     LDW (X),Y 
      00A98D 81               [ 4]  762     RET 
                                    763 
                                    764 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    765 ;  DRSHIFT ( d n -- d )
                                    766 ;  shift right n bits 
                                    767 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00290E                        768     _HEADER DRSHIFT,7,"DRSHIFT"
      00A98E A9 59                    1         .word LINK 
                           002910     2         LINK=.
      00A990 07                       3         .byte 7  
      00A991 44 52 53 48 49 46 54     4         .ascii "DRSHIFT"
      00A998                          5         DRSHIFT:
      00A998 E6 01            [ 1]  769     LD A,(1,X)
      00A99A A4 1F            [ 1]  770     AND A,#0X1F 
      00A99C 1C 00 02         [ 2]  771     ADDW X,#2 
      00A99F                        772 DRSHIFT1:
      00A99F 4D               [ 1]  773     TNZ A 
      00A9A0 27 13            [ 1]  774     JREQ DRSHIFT2 
      00A9A2 90 93            [ 1]  775     LDW Y,X 
      00A9A4 90 FE            [ 2]  776     LDW Y,(Y)
      00A9A6 90 57            [ 2]  777     SRAW Y 
      00A9A8 FF               [ 2]  778     LDW (X),Y 
      00A9A9 90 93            [ 1]  779     LDW Y,X 
      00A9AB 90 EE 02         [ 2]  780     LDW Y,(2,Y)
      00A9AE 90 56            [ 2]  781     RRCW Y 
      00A9B0 EF 02            [ 2]  782     LDW (2,X),Y 
      00A9B2 4A               [ 1]  783     DEC A
      00A9B3 20 EA            [ 2]  784     JRA DRSHIFT1  
      00A9B5                        785 DRSHIFT2:
      00A9B5 81               [ 4]  786     RET 
                                    787 
                                    788 
                                    789 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    790 ;   D* ( d1 d2 -- d3 )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 151.
Hexadecimal [24-Bits]



                                    791 ;   double product 
                                    792 ;   
                                    793 ;   d3 = d1 * d2
                                    794 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002936                        795     _HEADER DSTAR,2,"D*"
      00A9B6 A9 90                    1         .word LINK 
                           002938     2         LINK=.
      00A9B8 02                       3         .byte 2  
      00A9B9 44 2A                    4         .ascii "D*"
      00A9BB                          5         DSTAR:
      00A9BB CD 86 08         [ 4]  796     CALL DUPP 
      00A9BE CD 86 3F         [ 4]  797     CALL ZLESS  
      00A9C1 CD 85 D1         [ 4]  798     CALL TOR    ; R: d2sign 
      00A9C4 CD A5 B0         [ 4]  799     CALL DABS   
      00A9C7 CD 85 B4         [ 4]  800     CALL RFROM 
      00A9CA CD 87 EB         [ 4]  801     CALL NROT  ; d1 d2s ud2
      00A9CD CD A8 4E         [ 4]  802     CALL DTOR  ; d1 d2s R: ud2  
      00A9D0 CD 85 D1         [ 4]  803     CALL TOR   ; d1 R: ud2 d2s   
      00A9D3 CD 86 08         [ 4]  804     CALL DUPP 
      00A9D6 CD 86 3F         [ 4]  805     CALL ZLESS 
      00A9D9 CD 85 B4         [ 4]  806     CALL RFROM 
      00A9DC CD 86 8E         [ 4]  807     CALL XORR   
      00A9DF CD 85 D1         [ 4]  808     CALL TOR   ; d1 R: ud2 prod_sign  
      00A9E2 CD A5 B0         [ 4]  809     CALL DABS ; ud1 R: ud2 ps  
      00A9E5 CD 85 B4         [ 4]  810     CALL RFROM  
      00A9E8 CD 87 EB         [ 4]  811     CALL NROT   ; ps ud1 
      00A9EB CD 88 18         [ 4]  812     CALL DDUP   ; ps ud1 ud1  
      00A9EE CD 85 B4         [ 4]  813     CALL RFROM  ; ps ud1 ud1 ud2hi 
      00A9F1 CD A6 88         [ 4]  814     CALL DSSTAR ; ps ud1 dprodhi 
                                    815 ; shift partial product 16 bits left 
      00A9F4 CD 85 FE         [ 4]  816     CALL DROP   ; drop overflow 
      00A9F7 CD 8B B7         [ 4]  817     CALL ZERO   ; ps ud1 prodhi 
      00A9FA CD 86 18         [ 4]  818     CALL SWAPP  
      00A9FD CD A6 D1         [ 4]  819     CALL DSWAP  ; ps dprodhi ud1 
      00AA00 CD 85 B4         [ 4]  820     CALL RFROM  ; ps dprodhi ud1 ud2lo
      00AA03 CD A6 88         [ 4]  821     CALL DSSTAR ; ps  dprodhi dprodlo 
      00AA06 CD AB 15         [ 4]  822     CALL DPLUS
      00AA09 CD 87 CC         [ 4]  823     CALL ROT    ; dprod ps 
      00298C                        824     _QBRAN DDSTAR3 
      00AA0C CD 85 18         [ 4]    1     CALL QBRAN
      00AA0F AA 14                    2     .word DDSTAR3
      00AA11 CD 88 6A         [ 4]  825     CALL DNEGA 
      00AA14                        826 DDSTAR3:  
      00AA14 81               [ 4]  827     RET 
                                    828 
                                    829 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    830 ;   DD/MOD  ( d1 d2 -- dr dq )
                                    831 ;   double division dq=d1/d2
                                    832 ;   dr remainder double 
                                    833 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002995                        834     _HEADER DDSLMOD,6,"DD/MOD"  
      00AA15 A9 B8                    1         .word LINK 
                           002997     2         LINK=.
      00AA17 06                       3         .byte 6  
      00AA18 44 44 2F 4D 4F 44        4         .ascii "DD/MOD"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 152.
Hexadecimal [24-Bits]



      00AA1E                          5         DDSLMOD:
      00299E                        835     _DOLIT 0 
      00AA1E CD 84 EF         [ 4]    1     CALL DOLIT 
      00AA21 00 00                    2     .word 0 
      00AA23 CD 85 D1         [ 4]  836     CALL TOR   ; R: sign 
      00AA26 90 93            [ 1]  837     LDW Y,X     
      00AA28 90 FE            [ 2]  838     LDW Y,(Y)
      00AA2A 2A 0C            [ 1]  839     JRPL DSLA1
      00AA2C CD 88 6A         [ 4]  840     CALL DNEGA  ; ud2 
      00AA2F CD 85 B4         [ 4]  841     CALL RFROM 
      00AA32 CD 88 47         [ 4]  842     CALL INVER 
      00AA35 CD 85 D1         [ 4]  843     CALL TOR  ; sign inverted 
      00AA38                        844 DSLA1:
      0029B8                        845     _DOLIT 2 
      00AA38 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AA3B 00 02                    2     .word 2 
      00AA3D CD 8C 10         [ 4]  846     CALL PICK 
      00AA40 CD 86 3F         [ 4]  847     CALL ZLESS 
      0029C3                        848     _QBRAN DSLA2
      00AA43 CD 85 18         [ 4]    1     CALL QBRAN
      00AA46 AA 5A                    2     .word DSLA2
      00AA48 CD A6 D1         [ 4]  849     CALL DSWAP 
      00AA4B CD 88 6A         [ 4]  850     CALL DNEGA  ; ud1 
      00AA4E CD A6 D1         [ 4]  851     CALL DSWAP  ; ud1 ud2 ( divident divisor )     
      00AA51 CD 85 B4         [ 4]  852     CALL RFROM 
      00AA54 CD 88 47         [ 4]  853     CALL INVER 
      00AA57 CD 85 D1         [ 4]  854     CALL TOR   ;  sign inverted again 
      00AA5A                        855 DSLA2:
                                    856 ; unsigned double division 
      00AA5A CD 8B B7         [ 4]  857     CALL ZERO 
      00AA5D CD 8B B7         [ 4]  858     CALL ZERO
      00AA60 CD A8 4E         [ 4]  859     CALL DTOR ; quotient  R: sign qlo qhi 
      00AA63 CD A9 15         [ 4]  860     CALL DOVER 
      00AA66 CD A6 FF         [ 4]  861     CALL DCLZ ; n2, dividend leading zeros  
      00AA69 CD 85 D1         [ 4]  862     CALL TOR 
      00AA6C CD 88 18         [ 4]  863     CALL DDUP    
      00AA6F CD A6 FF         [ 4]  864     CALL DCLZ  ; n1, divisor leading zeros
      00AA72 CD 85 B4         [ 4]  865     CALL RFROM ; n1 n2 
      00AA75 CD 88 A6         [ 4]  866     CALL SUBB
      00AA78 CD 86 08         [ 4]  867     CALL DUPP   
      00AA7B CD 86 3F         [ 4]  868     CALL ZLESS 
      0029FE                        869     _TBRAN DSLA7 ; quotient is null 
      00AA7E CD 85 26         [ 4]    1     CALL TBRAN 
      00AA81 AA F1                    2     .word DSLA7 
      00AA83 CD 86 08         [ 4]  870     CALL DUPP 
      00AA86 CD 85 D1         [ 4]  871     CALL TOR    ; loop counter 
      00AA89 CD 86 08         [ 4]  872     CALL DUPP 
      00AA8C CD 85 D1         [ 4]  873     CALL TOR    ; need to copies 
      00AA8F CD 87 BB         [ 4]  874     CALL QDUP 
      002A12                        875     _QBRAN DSLA3
      00AA92 CD 85 18         [ 4]    1     CALL QBRAN
      00AA95 AA 9A                    2     .word DSLA3
      00AA97 CD A9 61         [ 4]  876     CALL DLSHIFT ; align divisor with dividend 
      00AA9A                        877 DSLA3: ; division loop -- dividend divisor  
      00AA9A 90 5F            [ 1]  878     CLRW Y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 153.
Hexadecimal [24-Bits]



      00AA9C 90 89            [ 2]  879     PUSHW Y  
      00AA9E CD A9 15         [ 4]  880     CALL DOVER 
      00AAA1 CD A9 15         [ 4]  881     CALL DOVER 
      00AAA4 CD A7 E7         [ 4]  882     CALL DLESS 
      002A27                        883     _TBRAN DSLA4 
      00AAA7 CD 85 26         [ 4]    1     CALL TBRAN 
      00AAAA AA C0                    2     .word DSLA4 
      00AAAC 90 85            [ 2]  884     POPW Y 
      00AAAE 72 A9 00 01      [ 2]  885     ADDW Y,#1 
      00AAB2 90 89            [ 2]  886     PUSHW Y    ; quotiend least bit 
      00AAB4 CD 88 18         [ 4]  887     CALL DDUP  ; dividend divisor divisor 
      00AAB7 CD A8 4E         [ 4]  888     CALL DTOR  
      00AABA CD AB 47         [ 4]  889     CALL DSUB  ; dividend-divisor 
      00AABD CD A8 6C         [ 4]  890     CALL DRFROM  ; dividend- divisor  
      00AAC0                        891 DSLA4: ; shift quotient and add 1 bit 
      00AAC0 90 85            [ 2]  892     POPW Y 
      00AAC2 90 BF 26         [ 2]  893     LDW YTEMP,Y 
      00AAC5 16 07            [ 2]  894     LDW Y,(7,SP) ; quotient low 
      00AAC7 98               [ 1]  895     RCF 
      00AAC8 90 59            [ 2]  896     RLCW Y
      00AACA 17 07            [ 2]  897     LDW (7,SP),Y 
      00AACC 16 05            [ 2]  898     LDW Y,(5,SP) ; quotient hi 
      00AACE 90 59            [ 2]  899     RLCW Y 
      00AAD0 17 05            [ 2]  900     LDW (5,SP),Y 
      00AAD2 16 07            [ 2]  901     LDW Y,(7,SP) 
      00AAD4 72 B9 00 26      [ 2]  902     ADDW Y,YTEMP
      00AAD8 17 07            [ 2]  903     LDW (7,SP),Y 
      00AADA 16 01            [ 2]  904     LDW Y,(1,SP) ; loop counter 
      00AADC 90 5D            [ 2]  905     TNZW Y 
      00AADE 27 14            [ 1]  906     JREQ DSLA8
      00AAE0 72 A2 00 01      [ 2]  907     SUBW Y,#1  
      00AAE4 17 01            [ 2]  908     LDW (1,SP),Y  
                                    909 ; shift dividend left 1 bit      
      00AAE6 CD A6 D1         [ 4]  910     CALL DSWAP 
      00AAE9 CD A9 45         [ 4]  911     CALL D2STAR 
      00AAEC CD A6 D1         [ 4]  912     CALL DSWAP 
      00AAEF 20 A9            [ 2]  913     JRA DSLA3 
      00AAF1                        914 DSLA7:
      00AAF1 1C 00 02         [ 2]  915     ADDW X,#2 ; drop shift count  
      00AAF4                        916 DSLA8:
      00AAF4 1C 00 04         [ 2]  917     ADDW X,#4 ; drop divisor
      00AAF7 CD 85 B4         [ 4]  918     CALL RFROM
      00AAFA CD 85 FE         [ 4]  919     CALL DROP   ; loop counter 
      00AAFD CD 85 B4         [ 4]  920     CALL RFROM   ; shift count
      00AB00 CD A9 98         [ 4]  921     CALL DRSHIFT 
                                    922     ; quotient replace dividend 
      00AB03 CD A8 6C         [ 4]  923     CALL DRFROM  ; quotient 
      00AB06 90 85            [ 2]  924     POPW Y ; sign 
      00AB08 90 5D            [ 2]  925     TNZW Y 
      00AB0A 27 03            [ 1]  926     JREQ DSLA9 
      00AB0C CD 88 6A         [ 4]  927     CALL DNEGA ; remainder quotient 
      00AB0F                        928 DSLA9: 
      00AB0F 81               [ 4]  929     RET 
                                    930 
                                    931 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 154.
Hexadecimal [24-Bits]



                                    932 ;   D+ ( d1 d2 -- d3 )
                                    933 ;   add 2 doubles 
                                    934 ;   d3=d1+d2 
                                    935 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002A90                        936     _HEADER DPLUS,2,"D+"
      00AB10 AA 17                    1         .word LINK 
                           002A92     2         LINK=.
      00AB12 02                       3         .byte 2  
      00AB13 44 2B                    4         .ascii "D+"
      00AB15                          5         DPLUS:
      00AB15 90 93            [ 1]  937     LDW Y,X 
      00AB17 90 FE            [ 2]  938     LDW Y,(Y)
      00AB19 90 BF 26         [ 2]  939     LDW YTEMP,Y ; d2 hi 
      00AB1C 90 93            [ 1]  940     LDW Y,X 
      00AB1E 90 EE 02         [ 2]  941     LDW Y,(2,Y)
      00AB21 90 BF 24         [ 2]  942     LDW XTEMP,Y ; d2 lo 
      00AB24 1C 00 04         [ 2]  943     ADDW X,#4 
      00AB27 90 93            [ 1]  944     LDW Y,X 
      00AB29 90 EE 02         [ 2]  945     LDW Y,(2,Y) ; d1 lo
      00AB2C 72 B9 00 24      [ 2]  946     ADDW Y,XTEMP
      00AB30 EF 02            [ 2]  947     LDW (2,X),Y 
      00AB32 90 93            [ 1]  948     LDW Y,X 
      00AB34 90 FE            [ 2]  949     LDW Y,(Y) ; d1 hi 
      00AB36 24 04            [ 1]  950     JRNC DPLUS1 
      00AB38 72 A9 00 01      [ 2]  951     ADDW Y,#1 
      00AB3C                        952 DPLUS1: 
      00AB3C 72 B9 00 26      [ 2]  953     ADDW Y,YTEMP 
      00AB40 FF               [ 2]  954     LDW (X),Y 
      00AB41 81               [ 4]  955     RET 
                                    956 
                                    957 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    958 ;   D- ( d1 d2 -- d3 )
                                    959 ;   d3=d1-d2 
                                    960 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002AC2                        961     _HEADER DSUB,2,"D-"
      00AB42 AB 12                    1         .word LINK 
                           002AC4     2         LINK=.
      00AB44 02                       3         .byte 2  
      00AB45 44 2D                    4         .ascii "D-"
      00AB47                          5         DSUB:
      00AB47 90 93            [ 1]  962     LDW Y,X 
      00AB49 90 FE            [ 2]  963     LDW Y,(Y)
      00AB4B 90 BF 26         [ 2]  964     LDW YTEMP,Y ; d2 hi 
      00AB4E 90 93            [ 1]  965     LDW Y,X 
      00AB50 90 EE 02         [ 2]  966     LDW Y,(2,Y)
      00AB53 90 BF 24         [ 2]  967     LDW XTEMP,Y ; d2 lo 
      00AB56 1C 00 04         [ 2]  968     ADDW X,#4 
      00AB59 90 93            [ 1]  969     LDW Y,X 
      00AB5B 90 EE 02         [ 2]  970     LDW Y,(2,Y) ; d1 lo
      00AB5E 72 B2 00 24      [ 2]  971     SUBW Y,XTEMP
      00AB62 EF 02            [ 2]  972     LDW (2,X),Y 
      00AB64 90 93            [ 1]  973     LDW Y,X 
      00AB66 90 FE            [ 2]  974     LDW Y,(Y) ; d1 hi 
      00AB68 24 04            [ 1]  975     JRNC DSUB1 
      00AB6A 72 A2 00 01      [ 2]  976     SUBW Y,#1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 155.
Hexadecimal [24-Bits]



      00AB6E                        977 DSUB1: 
      00AB6E 72 B2 00 26      [ 2]  978     SUBW Y,YTEMP 
      00AB72 FF               [ 2]  979     LDW (X),Y 
      00AB73 81               [ 4]  980     RET 
                                    981 
                                    982 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 156.
Hexadecimal [24-Bits]



                                   4437 .endif 
                           000001  4438 .if WANT_FLOAT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 157.
Hexadecimal [24-Bits]



                                   4439         .include "float.asm"
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
                                     28 ; NOTE: I used a different format 
                                     29 ;       for float number. This 
                                     30 ;       enable comparison of floats 
                                     31 ;       as they were integer hence 
                                     32 ;       there no need for F>,F<,etc 
                                     33 ;
                                     34 ;  This file is part of stm8_eforth 
                                     35 ;  project and same licence apply.
                                     36 ;************************************
                                     37 
                                     38 ;*************************************************
                                     39 ;  FLOAT format double for storage 
                                     40 ;  bits 22:0  mantissa absolute value 
                                     41 ;  bits  30:23  exponent with 127 offset added  
                                     42 ;  bit 31  mantissa sign 
                                     43 ;  float value: if bit 31 is 1 negate mantissa
                                     44 ;                else keep mantissas as bits 22:0
                                     45 ;                as is
                                     46 ;                eponent: 10^^(exp-127) 
                                     47 ;***********************************************  
                                     48 
                                     49     .module FLOAT 
                                     50 
                           000001    51 .if WANT_DOUBLE 
                                     52 ; already included 
                           000000    53 .else
                                     54 ;  must be included  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 158.
Hexadecimal [24-Bits]



                                     55     .include "double.asm"
                                     56 .endif  
                                     57 
                           7FFFFF    58     MAX_MANTISSA = 0x7FFFFF 
                                     59 
                                     60 ;-------------------------
                                     61 ;    FPSW ( -- a )
                                     62 ;    floating state variable
                                     63 ;    bit 0 zero flag 
                                     64 ;    bit 1 negative flag 
                                     65 ;    bit 2 overflow/error flag 
                                     66 ;---------------------------
      002AF4                         67     _HEADER FPSW,4,"FPSW"
      00AB74 AB 44                    1         .word LINK 
                           002AF6     2         LINK=.
      00AB76 04                       3         .byte 4  
      00AB77 46 50 53 57              4         .ascii "FPSW"
      00AB7B                          5         FPSW:
      00AB7B 90 AE 00 08      [ 2]   68 	LDW Y,#UFPSW  
      00AB7F 1D 00 02         [ 2]   69 	SUBW X,#2
      00AB82 FF               [ 2]   70     LDW (X),Y
      00AB83 81               [ 4]   71     RET
                                     72 
                                     73 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     74 ;   FRESET ( -- )
                                     75 ;   reset FPSW variable 
                                     76 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
      002B04                         77     _HEADER FRESET,6,"FRESET"
      00AB84 AB 76                    1         .word LINK 
                           002B06     2         LINK=.
      00AB86 06                       3         .byte 6  
      00AB87 46 52 45 53 45 54        4         .ascii "FRESET"
      00AB8D                          5         FRESET:
      002B0D                         78     _DOLIT 0 
      00AB8D CD 84 EF         [ 4]    1     CALL DOLIT 
      00AB90 00 00                    2     .word 0 
      00AB92 CD AB 7B         [ 4]   79     CALL FPSW 
      00AB95 CD 85 51         [ 4]   80     CALL STORE 
      00AB98 81               [ 4]   81     RET 
                                     82 
                                     83 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     84 ;   FINIT ( -- )
                                     85 ;   initialize floating point 
                                     86 ;   library 
                                     87 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002B19                         88     _HEADER FINIT,5,"FINIT"
      00AB99 AB 86                    1         .word LINK 
                           002B1B     2         LINK=.
      00AB9B 05                       3         .byte 5  
      00AB9C 46 49 4E 49 54           4         .ascii "FINIT"
      00ABA1                          5         FINIT:
      00ABA1 CD AB 8D         [ 4]   89     CALL FRESET 
      00ABA4 81               [ 4]   90     RET 
                                     91 
                                     92 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 159.
Hexadecimal [24-Bits]



                                     93 ;    FER ( -- u )
                                     94 ;    return FPSW value 
                                     95 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002B25                         96     _HEADER FER,3,"FER"
      00ABA5 AB 9B                    1         .word LINK 
                           002B27     2         LINK=.
      00ABA7 03                       3         .byte 3  
      00ABA8 46 45 52                 4         .ascii "FER"
      00ABAB                          5         FER:
      00ABAB CD AB 7B         [ 4]   97     CALL FPSW 
      00ABAE CD 85 63         [ 4]   98     CALL AT 
      00ABB1 81               [ 4]   99     RET 
                                    100 
                                    101 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    102 ;    FZE  ( -- z )
                                    103 ;    return FPSW zero flag 
                                    104 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002B32                        105     _HEADER FZE,3,"FZE"
      00ABB2 AB A7                    1         .word LINK 
                           002B34     2         LINK=.
      00ABB4 03                       3         .byte 3  
      00ABB5 46 5A 45                 4         .ascii "FZE"
      00ABB8                          5         FZE:
      00ABB8 CD AB 7B         [ 4]  106     CALL FPSW
      00ABBB CD 85 63         [ 4]  107     CALL AT  
      002B3E                        108     _DOLIT 1
      00ABBE CD 84 EF         [ 4]    1     CALL DOLIT 
      00ABC1 00 01                    2     .word 1 
      00ABC3 CD 86 65         [ 4]  109     CALL ANDD 
      00ABC6 81               [ 4]  110     RET 
                                    111 
                                    112 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    113 ;    FNE ( -- n )
                                    114 ;    return FPSW negative flag 
                                    115 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002B47                        116     _HEADER FNE,3,"FNE"
      00ABC7 AB B4                    1         .word LINK 
                           002B49     2         LINK=.
      00ABC9 03                       3         .byte 3  
      00ABCA 46 4E 45                 4         .ascii "FNE"
      00ABCD                          5         FNE:
      00ABCD CD AB 7B         [ 4]  117     CALL FPSW 
      00ABD0 CD 85 63         [ 4]  118     CALL AT 
      002B53                        119     _DOLIT 2 
      00ABD3 CD 84 EF         [ 4]    1     CALL DOLIT 
      00ABD6 00 02                    2     .word 2 
      00ABD8 CD 86 65         [ 4]  120     CALL ANDD 
      00ABDB 81               [ 4]  121     RET 
                                    122 
                                    123 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    124 ;   FOV (A -- v )
                                    125 ;   return FPSW overflow flag 
                                    126 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002B5C                        127     _HEADER FOV,3,"FOV"
      00ABDC AB C9                    1         .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 160.
Hexadecimal [24-Bits]



                           002B5E     2         LINK=.
      00ABDE 03                       3         .byte 3  
      00ABDF 46 4F 56                 4         .ascii "FOV"
      00ABE2                          5         FOV:
      00ABE2 CD AB 7B         [ 4]  128     CALL FPSW
      00ABE5 CD 85 63         [ 4]  129     CALL AT  
      002B68                        130     _DOLIT 4 
      00ABE8 CD 84 EF         [ 4]    1     CALL DOLIT 
      00ABEB 00 04                    2     .word 4 
      00ABED CD 86 65         [ 4]  131     CALL ANDD 
      00ABF0 81               [ 4]  132     RET 
                                    133 
                                    134 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    135 ;    SFZ ( f# -- f# )
                                    136 ;    set FPSW zero flag 
                                    137 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002B71                        138     _HEADER SFZ,3,"SFZ"
      00ABF1 AB DE                    1         .word LINK 
                           002B73     2         LINK=.
      00ABF3 03                       3         .byte 3  
      00ABF4 53 46 5A                 4         .ascii "SFZ"
      00ABF7                          5         SFZ:
      00ABF7 CD 88 18         [ 4]  139     CALL DDUP 
      00ABFA CD AB AB         [ 4]  140     CALL FER 
      002B7D                        141     _DOLIT 0xfffe 
      00ABFD CD 84 EF         [ 4]    1     CALL DOLIT 
      00AC00 FF FE                    2     .word 0xfffe 
      00AC02 CD 86 65         [ 4]  142     CALL ANDD 
      00AC05 CD 85 D1         [ 4]  143     CALL TOR    
      002B88                        144     _DOLIT 0x807F 
      00AC08 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AC0B 80 7F                    2     .word 0x807F 
      00AC0D CD 86 65         [ 4]  145     CALL ANDD 
      00AC10 CD A5 68         [ 4]  146     CALL DZEQUAL 
      002B93                        147     _DOLIT 1 
      00AC13 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AC16 00 01                    2     .word 1 
      00AC18 CD 86 65         [ 4]  148     CALL ANDD 
      00AC1B CD 85 B4         [ 4]  149     CALL RFROM 
      00AC1E CD 86 79         [ 4]  150     CALL ORR 
      00AC21 CD AB 7B         [ 4]  151     CALL FPSW 
      00AC24 CD 85 51         [ 4]  152     CALL STORE 
      00AC27 81               [ 4]  153     RET 
                                    154 
                                    155 
                                    156 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    157 ;   SFN ( f# -- f# )
                                    158 ;   set FPSW negative flag 
                                    159 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002BA8                        160     _HEADER SFN,3,"SFN"
      00AC28 AB F3                    1         .word LINK 
                           002BAA     2         LINK=.
      00AC2A 03                       3         .byte 3  
      00AC2B 53 46 4E                 4         .ascii "SFN"
      00AC2E                          5         SFN:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 161.
Hexadecimal [24-Bits]



      00AC2E CD 86 08         [ 4]  161     CALL DUPP  
      00AC31 CD AB AB         [ 4]  162     CALL FER 
      002BB4                        163     _DOLIT 0xFFFD 
      00AC34 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AC37 FF FD                    2     .word 0xFFFD 
      00AC39 CD 86 65         [ 4]  164     CALL ANDD  
      00AC3C CD 85 D1         [ 4]  165     CALL TOR 
      002BBF                        166     _DOLIT 0x8000
      00AC3F CD 84 EF         [ 4]    1     CALL DOLIT 
      00AC42 80 00                    2     .word 0x8000 
      00AC44 CD 86 65         [ 4]  167     CALL ANDD
      00AC47 90 93            [ 1]  168     LDW Y,X 
      00AC49 90 FE            [ 2]  169     LDW Y,(Y)
      00AC4B 98               [ 1]  170     RCF 
      00AC4C 90 59            [ 2]  171     RLCW Y 
      00AC4E 90 59            [ 2]  172     RLCW Y 
      00AC50 90 59            [ 2]  173     RLCW Y 
      00AC52 FF               [ 2]  174     LDW (X),Y 
      00AC53 CD 85 B4         [ 4]  175     CALL RFROM 
      00AC56 CD 86 79         [ 4]  176     CALL ORR 
      00AC59 CD AB 7B         [ 4]  177     CALL FPSW
      00AC5C CD 85 51         [ 4]  178     CALL STORE 
      00AC5F 81               [ 4]  179     RET 
                                    180 
                                    181 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    182 ;   SFV ( -- )
                                    183 ;   set overflow flag 
                                    184 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002BE0                        185     _HEADER SFV,3,"SFV"
      00AC60 AC 2A                    1         .word LINK 
                           002BE2     2         LINK=.
      00AC62 03                       3         .byte 3  
      00AC63 53 46 56                 4         .ascii "SFV"
      00AC66                          5         SFV:
      00AC66 CD AB 7B         [ 4]  186     CALL FPSW 
      00AC69 CD 85 63         [ 4]  187     CALL AT 
      002BEC                        188     _DOLIT 4 
      00AC6C CD 84 EF         [ 4]    1     CALL DOLIT 
      00AC6F 00 04                    2     .word 4 
      00AC71 CD 86 79         [ 4]  189     CALL ORR 
      00AC74 CD AB 7B         [ 4]  190     CALL FPSW 
      00AC77 CD 85 51         [ 4]  191     CALL STORE 
      00AC7A 81               [ 4]  192     RET 
                                    193 
                                    194 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    195 ;  F>ME ( f# -- m e )
                                    196 ;  split float in mantissa/exponent 
                                    197 ;  m mantissa as a double 
                                    198 ;  e exponent as a single 
                                    199 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002BFB                        200     _HEADER ATEXP,4,"F>ME"             
      00AC7B AC 62                    1         .word LINK 
                           002BFD     2         LINK=.
      00AC7D 04                       3         .byte 4  
      00AC7E 46 3E 4D 45              4         .ascii "F>ME"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 162.
Hexadecimal [24-Bits]



      00AC82                          5         ATEXP:
      00AC82 CD AB 8D         [ 4]  201     CALL FRESET
      00AC85 CD AC 2E         [ 4]  202     CALL SFN
      00AC88 CD AB F7         [ 4]  203     CALL SFZ 
      00AC8B CD 86 08         [ 4]  204     CALL DUPP
      002C0E                        205     _DOLIT 0X7F80 
      00AC8E CD 84 EF         [ 4]    1     CALL DOLIT 
      00AC91 7F 80                    2     .word 0X7F80 
      00AC93 CD 86 65         [ 4]  206     CALL ANDD 
      002C16                        207     _DOLIT 7 
      00AC96 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AC99 00 07                    2     .word 7 
      00AC9B CD 8B 85         [ 4]  208     CALL RSHIFT
      002C1E                        209     _DOLIT 127 
      00AC9E CD 84 EF         [ 4]    1     CALL DOLIT 
      00ACA1 00 7F                    2     .word 127 
      00ACA3 CD 88 A6         [ 4]  210     CALL SUBB
      00ACA6 CD 85 D1         [ 4]  211     CALL TOR 
      002C29                        212     _DOLIT 0x7F
      00ACA9 CD 84 EF         [ 4]    1     CALL DOLIT 
      00ACAC 00 7F                    2     .word 0x7F 
      00ACAE CD 86 65         [ 4]  213     CALL ANDD  ; mantissa as double  
      00ACB1 CD AB CD         [ 4]  214     CALL FNE 
      002C34                        215     _QBRAN POSMANT 
      00ACB4 CD 85 18         [ 4]    1     CALL QBRAN
      00ACB7 AC BC                    2     .word POSMANT
      00ACB9 CD A5 86         [ 4]  216     CALL DNEGAT 
      00ACBC                        217 POSMANT:
      00ACBC CD 85 B4         [ 4]  218     CALL RFROM 
      00ACBF 81               [ 4]  219     RET 
                                    220 
                                    221 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    222 ;    ME>F ( m e -- f# )
                                    223 ;    built float from mantissa/exponent 
                                    224 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002C40                        225     _HEADER STEXP,4,"ME>F"
      00ACC0 AC 7D                    1         .word LINK 
                           002C42     2         LINK=.
      00ACC2 04                       3         .byte 4  
      00ACC3 4D 45 3E 46              4         .ascii "ME>F"
      00ACC7                          5         STEXP:
      00ACC7 CD 86 08         [ 4]  226     CALL DUPP 
      00ACCA CD 88 C0         [ 4]  227     CALL ABSS 
      002C4D                        228     _DOLIT 127 
      00ACCD CD 84 EF         [ 4]    1     CALL DOLIT 
      00ACD0 00 7F                    2     .word 127 
      00ACD2 CD 89 2A         [ 4]  229     CALL UGREAT
      002C55                        230     _QBRAN STEXP1
      00ACD5 CD 85 18         [ 4]    1     CALL QBRAN
      00ACD8 AC DD                    2     .word STEXP1
      00ACDA CD AC 66         [ 4]  231     CALL SFV  
      00ACDD                        232 STEXP1:
      002C5D                        233     _DOLIT 127 
      00ACDD CD 84 EF         [ 4]    1     CALL DOLIT 
      00ACE0 00 7F                    2     .word 127 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 163.
Hexadecimal [24-Bits]



      00ACE2 CD 88 2D         [ 4]  234     CALL PLUS 
      002C65                        235     _DOLIT 0XFF 
      00ACE5 CD 84 EF         [ 4]    1     CALL DOLIT 
      00ACE8 00 FF                    2     .word 0XFF 
      00ACEA CD 86 65         [ 4]  236     CALL ANDD 
      002C6D                        237     _DOLIT 7 
      00ACED CD 84 EF         [ 4]    1     CALL DOLIT 
      00ACF0 00 07                    2     .word 7 
      00ACF2 CD 8B 69         [ 4]  238     CALL LSHIFT 
      00ACF5 CD 85 D1         [ 4]  239     CALL TOR   ; R: e 
      00ACF8 CD 86 08         [ 4]  240     CALL DUPP 
      002C7B                        241     _DOLIT 0X8000 
      00ACFB CD 84 EF         [ 4]    1     CALL DOLIT 
      00ACFE 80 00                    2     .word 0X8000 
      00AD00 CD 86 65         [ 4]  242     CALL ANDD 
      002C83                        243     _QBRAN STEXP2 
      00AD03 CD 85 18         [ 4]    1     CALL QBRAN
      00AD06 AD 19                    2     .word STEXP2
      002C88                        244     _DOLIT 0X8000 
      00AD08 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AD0B 80 00                    2     .word 0X8000 
      00AD0D CD 85 B4         [ 4]  245     CALL RFROM 
      00AD10 CD 86 79         [ 4]  246     CALL ORR
      00AD13 CD 85 D1         [ 4]  247     CALL TOR
      00AD16 CD A5 86         [ 4]  248     CALL DNEGAT  
      00AD19                        249 STEXP2:
      00AD19 CD 86 08         [ 4]  250     CALL DUPP 
      002C9C                        251     _DOLIT 0X7F
      00AD1C CD 84 EF         [ 4]    1     CALL DOLIT 
      00AD1F 00 7F                    2     .word 0X7F 
      00AD21 CD 89 2A         [ 4]  252     CALL UGREAT 
      002CA4                        253     _QBRAN STEXP3 
      00AD24 CD 85 18         [ 4]    1     CALL QBRAN
      00AD27 AD 2C                    2     .word STEXP3
      00AD29 CD AC 66         [ 4]  254     CALL SFV 
      00AD2C                        255 STEXP3:
      002CAC                        256     _DOLIT 0X7F 
      00AD2C CD 84 EF         [ 4]    1     CALL DOLIT 
      00AD2F 00 7F                    2     .word 0X7F 
      00AD31 CD 86 65         [ 4]  257     CALL ANDD 
      00AD34 CD 85 B4         [ 4]  258     CALL RFROM 
      00AD37 CD 86 79         [ 4]  259     CALL ORR 
      00AD3A CD AB F7         [ 4]  260     CALL SFZ 
      00AD3D CD AC 2E         [ 4]  261     CALL SFN 
      00AD40 81               [ 4]  262     RET 
                                    263 
                                    264 
                                    265 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    266 ;   E. ( f# -- )
                                    267 ;   print float in scientific 
                                    268 ;   format 
                                    269 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002CC1                        270     _HEADER EDOT,2,"E."
      00AD41 AC C2                    1         .word LINK 
                           002CC3     2         LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 164.
Hexadecimal [24-Bits]



      00AD43 02                       3         .byte 2  
      00AD44 45 2E                    4         .ascii "E."
      00AD46                          5         EDOT:
      00AD46 CD 86 CE         [ 4]  271     CALL BASE 
      00AD49 CD 85 63         [ 4]  272     CALL AT 
      00AD4C CD 85 D1         [ 4]  273     CALL TOR 
      002CCF                        274     _DOLIT 10 
      00AD4F CD 84 EF         [ 4]    1     CALL DOLIT 
      00AD52 00 0A                    2     .word 10 
      00AD54 CD 86 CE         [ 4]  275     CALL BASE 
      00AD57 CD 85 51         [ 4]  276     CALL STORE 
      00AD5A CD AC 82         [ 4]  277     CALL ATEXP ; m e 
      00AD5D                        278 EDOT0:
      00AD5D CD 85 D1         [ 4]  279     CALL TOR   
      00AD60 CD AB CD         [ 4]  280     CALL FNE 
      002CE3                        281     _QBRAN EDOT1
      00AD63 CD 85 18         [ 4]    1     CALL QBRAN
      00AD66 AD 6B                    2     .word EDOT1
      00AD68 CD A5 86         [ 4]  282     CALL DNEGAT
      00AD6B                        283 EDOT1:
      00AD6B CD 8E ED         [ 4]  284     CALL SPACE 
      00AD6E CD 8D B1         [ 4]  285     CALL BDIGS     
      00AD71                        286 EDOT2: 
      00AD71 CD A6 21         [ 4]  287     CALL DDIG
      00AD74 CD 85 B4         [ 4]  288     CALL RFROM 
      00AD77 CD 8B 4B         [ 4]  289     CALL ONEP 
      00AD7A CD 85 D1         [ 4]  290     CALL TOR 
      00AD7D CD 86 08         [ 4]  291     CALL DUPP
      002D00                        292     _QBRAN EDOT3 
      00AD80 CD 85 18         [ 4]    1     CALL QBRAN
      00AD83 AD 8A                    2     .word EDOT3
      002D05                        293     _BRAN EDOT2  
      00AD85 CD 85 34         [ 4]    1     CALL BRAN 
      00AD88 AD 71                    2     .word EDOT2 
      00AD8A                        294 EDOT3:
      00AD8A CD 86 30         [ 4]  295     CALL OVER 
      00AD8D CD 86 CE         [ 4]  296     CALL BASE 
      00AD90 CD 85 63         [ 4]  297     CALL AT 
      00AD93 CD 88 ED         [ 4]  298     CALL ULESS 
      002D16                        299     _QBRAN EDOT2 
      00AD96 CD 85 18         [ 4]    1     CALL QBRAN
      00AD99 AD 71                    2     .word EDOT2
      002D1B                        300     _DOLIT '.'
      00AD9B CD 84 EF         [ 4]    1     CALL DOLIT 
      00AD9E 00 2E                    2     .word '.' 
      00ADA0 CD 8D C1         [ 4]  301     CALL HOLD  
      00ADA3 CD A6 21         [ 4]  302     CALL DDIG
      00ADA6 CD AB CD         [ 4]  303     CALL FNE 
      002D29                        304     _QBRAN EDOT4 
      00ADA9 CD 85 18         [ 4]    1     CALL QBRAN
      00ADAC AD B9                    2     .word EDOT4
      002D2E                        305     _DOLIT '-'
      00ADAE CD 84 EF         [ 4]    1     CALL DOLIT 
      00ADB1 00 2D                    2     .word '-' 
      00ADB3 CD 8D C1         [ 4]  306     CALL HOLD 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 165.
Hexadecimal [24-Bits]



      00ADB6 CD 85 FE         [ 4]  307     CALL DROP 
      00ADB9                        308 EDOT4:       
      00ADB9 CD 8E 16         [ 4]  309     CALL EDIGS 
      00ADBC CD 8F 17         [ 4]  310     CALL TYPES
      00ADBF CD 85 B4         [ 4]  311     CALL RFROM 
      00ADC2 CD 87 BB         [ 4]  312     CALL QDUP 
      002D45                        313     _QBRAN EDOT5     
      00ADC5 CD 85 18         [ 4]    1     CALL QBRAN
      00ADC8 AD D5                    2     .word EDOT5
      002D4A                        314     _DOLIT 'E'
      00ADCA CD 84 EF         [ 4]    1     CALL DOLIT 
      00ADCD 00 45                    2     .word 'E' 
      00ADCF CD 84 B6         [ 4]  315     CALL EMIT 
      00ADD2 CD 8F D6         [ 4]  316     CALL DOT
      00ADD5                        317 EDOT5: 
      00ADD5 CD 85 B4         [ 4]  318     CALL RFROM 
      00ADD8 CD 86 CE         [ 4]  319     CALL BASE 
      00ADDB CD 85 51         [ 4]  320     CALL STORE  
      00ADDE 81               [ 4]  321     RET 
                                    322 
                                    323 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                    324 ;   F. (f# -- )
                                    325 ;   print float in fixed
                                    326 ;   point format. 
                                    327 ;;;;;;;;;;;;;;;;;;;;;;;;;
      002D5F                        328     _HEADER FDOT,2,"F."
      00ADDF AD 43                    1         .word LINK 
                           002D61     2         LINK=.
      00ADE1 02                       3         .byte 2  
      00ADE2 46 2E                    4         .ascii "F."
      00ADE4                          5         FDOT:
      00ADE4 CD 86 CE         [ 4]  329     CALL BASE 
      00ADE7 CD 85 63         [ 4]  330     CALL AT 
      00ADEA CD 85 D1         [ 4]  331     CALL TOR 
      002D6D                        332     _DOLIT 10 
      00ADED CD 84 EF         [ 4]    1     CALL DOLIT 
      00ADF0 00 0A                    2     .word 10 
      00ADF2 CD 86 CE         [ 4]  333     CALL BASE 
      00ADF5 CD 85 51         [ 4]  334     CALL STORE 
      00ADF8 CD AC 82         [ 4]  335     CALL    ATEXP
      00ADFB CD 86 08         [ 4]  336     CALL    DUPP  
      00ADFE CD 88 C0         [ 4]  337     CALL    ABSS 
      002D81                        338     _DOLIT  8
      00AE01 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AE04 00 08                    2     .word 8 
      00AE06 CD 89 49         [ 4]  339     CALL    GREAT 
      002D89                        340     _QBRAN  FDOT1 
      00AE09 CD 85 18         [ 4]    1     CALL QBRAN
      00AE0C AE 11                    2     .word FDOT1
      00AE0E CC AD 5D         [ 2]  341     JP      EDOT0 
      00AE11                        342 FDOT1:
      00AE11 CD 8E ED         [ 4]  343     CALL    SPACE 
      00AE14 CD 85 D1         [ 4]  344     CALL    TOR 
      00AE17 CD AB CD         [ 4]  345     CALL    FNE 
      002D9A                        346     _QBRAN  FDOT0 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 166.
Hexadecimal [24-Bits]



      00AE1A CD 85 18         [ 4]    1     CALL QBRAN
      00AE1D AE 22                    2     .word FDOT0
      00AE1F CD A5 86         [ 4]  347     CALL    DNEGAT 
      00AE22                        348 FDOT0: 
      00AE22 CD 8D B1         [ 4]  349     CALL    BDIGS
      00AE25 CD 85 C5         [ 4]  350     CALL    RAT  
      00AE28 CD 86 3F         [ 4]  351     CALL    ZLESS 
      002DAB                        352     _QBRAN  FDOT6 
      00AE2B CD 85 18         [ 4]    1     CALL QBRAN
      00AE2E AE 59                    2     .word FDOT6
      00AE30                        353 FDOT2: ; e<0 
      00AE30 CD A6 21         [ 4]  354     CALL    DDIG 
      00AE33 CD 85 B4         [ 4]  355     CALL    RFROM
      00AE36 CD 8B 4B         [ 4]  356     CALL    ONEP 
      00AE39 CD 87 BB         [ 4]  357     CALL    QDUP 
      002DBC                        358     _QBRAN  FDOT3 
      00AE3C CD 85 18         [ 4]    1     CALL QBRAN
      00AE3F AE 49                    2     .word FDOT3
      00AE41 CD 85 D1         [ 4]  359     CALL    TOR 
      002DC4                        360     _BRAN   FDOT2 
      00AE44 CD 85 34         [ 4]    1     CALL BRAN 
      00AE47 AE 30                    2     .word FDOT2 
      00AE49                        361 FDOT3:
      002DC9                        362     _DOLIT  '.' 
      00AE49 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AE4C 00 2E                    2     .word '.' 
      00AE4E CD 8D C1         [ 4]  363     CALL    HOLD 
      00AE51 CD A6 3A         [ 4]  364     CALL    DDIGS
      002DD4                        365     _BRAN   FDOT9  
      00AE54 CD 85 34         [ 4]    1     CALL BRAN 
      00AE57 AE 6E                    2     .word FDOT9 
      00AE59                        366 FDOT6: ; e>=0 
      002DD9                        367     _BRAN   FDOT8
      00AE59 CD 85 34         [ 4]    1     CALL BRAN 
      00AE5C AE 66                    2     .word FDOT8 
      00AE5E                        368 FDOT7:     
      002DDE                        369     _DOLIT  '0'
      00AE5E CD 84 EF         [ 4]    1     CALL DOLIT 
      00AE61 00 30                    2     .word '0' 
      00AE63 CD 8D C1         [ 4]  370     CALL    HOLD 
      00AE66                        371 FDOT8:
      00AE66 CD 85 03         [ 4]  372     CALL    DONXT 
      00AE69 AE 5E                  373     .word   FDOT7
      00AE6B CD A6 3A         [ 4]  374     CALL    DDIGS 
      00AE6E                        375 FDOT9:
      00AE6E CD AB CD         [ 4]  376     CALL    FNE 
      002DF1                        377     _QBRAN  FDOT10 
      00AE71 CD 85 18         [ 4]    1     CALL QBRAN
      00AE74 AE 7E                    2     .word FDOT10
      002DF6                        378     _DOLIT '-' 
      00AE76 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AE79 00 2D                    2     .word '-' 
      00AE7B CD 8D C1         [ 4]  379     CALL   HOLD 
      00AE7E                        380 FDOT10:
      00AE7E CD 8E 16         [ 4]  381     CALL    EDIGS 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 167.
Hexadecimal [24-Bits]



      00AE81 CD 8F 17         [ 4]  382     CALL    TYPES 
      00AE84 CD 85 B4         [ 4]  383     CALL    RFROM 
      00AE87 CD 86 CE         [ 4]  384     CALL    BASE 
      00AE8A CD 85 51         [ 4]  385     CALL    STORE 
      00AE8D 81               [ 4]  386     RET 
                                    387 
                                    388 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    389 ; return parsed exponent or 
                                    390 ; 0 if failed
                                    391 ; at entry exprect *a=='E'    
                                    392 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00AE8E                        393 parse_exponent: ; a cntr -- e -1 | 0 
      00AE8E CD 85 D1         [ 4]  394     CALL TOR   ; R: cntr 
      00AE91 CD 86 08         [ 4]  395     CALL DUPP 
      00AE94 CD 85 81         [ 4]  396     CALL CAT 
      002E17                        397     _DOLIT 'E' 
      00AE97 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AE9A 00 45                    2     .word 'E' 
      00AE9C CD 88 CE         [ 4]  398     CALL EQUAL 
      002E1F                        399     _QBRAN 1$
      00AE9F CD 85 18         [ 4]    1     CALL QBRAN
      00AEA2 AE CF                    2     .word 1$
      00AEA4 CD 8B 4B         [ 4]  400     CALL ONEP 
      00AEA7 CD 85 B4         [ 4]  401     CALL RFROM  ; a cntr 
      00AEAA CD 8B 58         [ 4]  402     CALL ONEM
      00AEAD CD 86 08         [ 4]  403     CALL DUPP 
      002E30                        404     _QBRAN 2$ ; a cntr 
      00AEB0 CD 85 18         [ 4]    1     CALL QBRAN
      00AEB3 AE D2                    2     .word 2$
      00AEB5 CD 8B B7         [ 4]  405     CALL ZERO
      00AEB8 CD 86 08         [ 4]  406     CALL DUPP 
      00AEBB CD A6 D1         [ 4]  407     CALL DSWAP ; 0 0 a cntr  
      00AEBE CD A4 16         [ 4]  408     CALL nsign 
      00AEC1 CD 85 D1         [ 4]  409     CALL TOR   ; R: esign  
      00AEC4 CD A4 4E         [ 4]  410     CALL parse_digits
      002E47                        411     _QBRAN PARSEXP_SUCCESS ; parsed to end of string 
      00AEC7 CD 85 18         [ 4]    1     CALL QBRAN
      00AECA AE D9                    2     .word PARSEXP_SUCCESS
                                    412 ; failed invalid character
      00AECC CD 88 0D         [ 4]  413     CALL DDROP ; 0 a 
      00AECF                        414 1$: 
      00AECF CD 85 B4         [ 4]  415     CALL RFROM ; sign||cntr  
      00AED2                        416 2$:
      00AED2 CD 88 0D         [ 4]  417     CALL DDROP  ; a cntr || a sign || 0 cntr   
      00AED5 CD 8B B7         [ 4]  418     CALL ZERO   ; return only 0 
      00AED8 81               [ 4]  419     RET 
      00AED9                        420 PARSEXP_SUCCESS: 
      00AED9 CD 88 0D         [ 4]  421     CALL DDROP ; drop dhi a 
      00AEDC CD 85 B4         [ 4]  422     CALL RFROM ; es 
      002E5F                        423     _QBRAN 1$
      00AEDF CD 85 18         [ 4]    1     CALL QBRAN
      00AEE2 AE E7                    2     .word 1$
      00AEE4 CD 88 58         [ 4]  424     CALL NEGAT
      00AEE7                        425 1$:
      002E67                        426     _DOLIT -1 ; -- e -1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 168.
Hexadecimal [24-Bits]



      00AEE7 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AEEA FF FF                    2     .word -1 
      00AEEC 81               [ 4]  427     RET 
                                    428 
                                    429 
                                    430 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    431 ;   FLOAT?  ( a dlo dhi a+ cntr sign d? -- f -3 | a 0 )
                                    432 ;   called by NUMBER? 
                                    433 ;   convert string to float 
                                    434 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002E6D                        435     _HEADER FLOATQ,5,"FLOAT?"
      00AEED AD E1                    1         .word LINK 
                           002E6F     2         LINK=.
      00AEEF 05                       3         .byte 5  
      00AEF0 46 4C 4F 41 54 3F        4         .ascii "FLOAT?"
      00AEF6                          5         FLOATQ:
      002E76                        436     _QBRAN FLOATQ0 
      00AEF6 CD 85 18         [ 4]    1     CALL QBRAN
      00AEF9 AF 00                    2     .word FLOATQ0
      002E7B                        437     _BRAN FLOAT_ERROR  ; not a float, string start with '#'
      00AEFB CD 85 34         [ 4]    1     CALL BRAN 
      00AEFE AF 9F                    2     .word FLOAT_ERROR 
      00AF00                        438 FLOATQ0:
                                    439 ; BASE must be 10 
      00AF00 CD 86 CE         [ 4]  440     CALL BASE 
      00AF03 CD 85 63         [ 4]  441     CALL AT 
      002E86                        442     _DOLIT 10 
      00AF06 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AF09 00 0A                    2     .word 10 
      00AF0B CD 88 CE         [ 4]  443     CALL EQUAL 
      002E8E                        444     _QBRAN FLOAT_ERROR 
      00AF0E CD 85 18         [ 4]    1     CALL QBRAN
      00AF11 AF 9F                    2     .word FLOAT_ERROR
                                    445 ; if float next char is '.' or 'E' 
      00AF13 CD 85 D1         [ 4]  446     CALL TOR ; R: sign  
      00AF16 CD 85 D1         [ 4]  447     CALL TOR ; R: sign cntr 
      00AF19 CD 86 08         [ 4]  448     CALL DUPP
      00AF1C CD 85 81         [ 4]  449     CALL CAT 
      002E9F                        450     _DOLIT '.' 
      00AF1F CD 84 EF         [ 4]    1     CALL DOLIT 
      00AF22 00 2E                    2     .word '.' 
      00AF24 CD 88 CE         [ 4]  451     CALL EQUAL 
      002EA7                        452     _QBRAN FLOATQ1 ; not a dot 
      00AF27 CD 85 18         [ 4]    1     CALL QBRAN
      00AF2A AF 65                    2     .word FLOATQ1
      00AF2C CD 8B 4B         [ 4]  453     CALL ONEP 
      00AF2F CD 85 B4         [ 4]  454     CALL RFROM  ; dlo dhi a cntr R: sign  
      00AF32 CD 8B 58         [ 4]  455     CALL ONEM 
      00AF35 CD 86 08         [ 4]  456     CALL DUPP 
      00AF38 CD 85 D1         [ 4]  457     CALL TOR  ; R: sign cntr 
                                    458 ; parse fractional part
      00AF3B CD A4 4E         [ 4]  459     CALL parse_digits ; dlo dhi a cntr -- dm a cntr 
      00AF3E CD 86 08         [ 4]  460     CALL DUPP 
      00AF41 CD 85 B4         [ 4]  461     CALL RFROM 
      00AF44 CD 86 18         [ 4]  462     CALL SWAPP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 169.
Hexadecimal [24-Bits]



      00AF47 CD 88 A6         [ 4]  463     CALL SUBB ; fd -> fraction digits count 
      00AF4A CD 85 D1         [ 4]  464     CALL TOR  ; dlo dhi a cntr R: sign fd 
      00AF4D CD 86 08         [ 4]  465     CALL DUPP ; cntr cntr  
      002ED0                        466     _QBRAN 1$ ; end of string, no exponent
      00AF50 CD 85 18         [ 4]    1     CALL QBRAN
      00AF53 AF 5A                    2     .word 1$
      002ED5                        467     _BRAN FLOATQ2
      00AF55 CD 85 34         [ 4]    1     CALL BRAN 
      00AF58 AF 6E                    2     .word FLOATQ2 
      00AF5A CD 86 18         [ 4]  468 1$: CALL SWAPP 
      00AF5D CD 85 FE         [ 4]  469     CALL DROP ; a
      002EE0                        470     _BRAN FLOATQ3        
      00AF60 CD 85 34         [ 4]    1     CALL BRAN 
      00AF63 AF 76                    2     .word FLOATQ3 
      00AF65                        471 FLOATQ1: ; must push fd==0 on RSTACK 
      00AF65 CD 85 B4         [ 4]  472     CALL RFROM ; cntr 
      00AF68 CD 8B B7         [ 4]  473     CALL ZERO  ; fd 
      00AF6B CD 85 D1         [ 4]  474     CALL TOR   ; dm a cntr R: sign fd 
      00AF6E                        475 FLOATQ2: 
      00AF6E CD AE 8E         [ 4]  476     CALL parse_exponent 
      002EF1                        477     _QBRAN FLOAT_ERROR0 ; exponent expected 
      00AF71 CD 85 18         [ 4]    1     CALL QBRAN
      00AF74 AF 9C                    2     .word FLOAT_ERROR0
      00AF76                        478 FLOATQ3: ; dm 0 || dm e  
      00AF76 CD 85 B4         [ 4]  479     CALL RFROM ;  fd  
      00AF79 CD 88 A6         [ 4]  480     CALL SUBB  ; exp=e-fd 
      00AF7C CD 87 EB         [ 4]  481     CALL NROT 
      00AF7F CD 85 B4         [ 4]  482     CALL RFROM  ; sign 
      002F02                        483     _QBRAN FLOATQ4 
      00AF82 CD 85 18         [ 4]    1     CALL QBRAN
      00AF85 AF 8A                    2     .word FLOATQ4
      00AF87 CD 88 6A         [ 4]  484     CALL DNEGA 
      00AF8A                        485 FLOATQ4:
      00AF8A CD 87 CC         [ 4]  486     CALL ROT 
      00AF8D CD AC C7         [ 4]  487     CALL STEXP 
      00AF90 CD 87 CC         [ 4]  488     CALL ROT 
      00AF93 CD 85 FE         [ 4]  489     CALL DROP 
      002F16                        490     _DOLIT -3 
      00AF96 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AF99 FF FD                    2     .word -3 
      00AF9B 81               [ 4]  491     RET       
      00AF9C                        492 FLOAT_ERROR0: 
      00AF9C CD A8 6C         [ 4]  493     CALL DRFROM ; sign df      
      00AF9F                        494 FLOAT_ERROR: 
      00AF9F CD 8B F9         [ 4]  495     CALL DEPTH 
      00AFA2 CD 8B 3E         [ 4]  496     CALL CELLS 
      00AFA5 CD 85 E8         [ 4]  497     CALL SPAT 
      00AFA8 CD 86 18         [ 4]  498     CALL SWAPP 
      00AFAB CD 88 2D         [ 4]  499     CALL PLUS  
      00AFAE CD 85 F5         [ 4]  500     CALL SPSTO 
      002F31                        501     _DOLIT 0 
      00AFB1 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AFB4 00 00                    2     .word 0 
      00AFB6 81               [ 4]  502     RET 
                                    503 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 170.
Hexadecimal [24-Bits]



                                    504 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    505 ;  LSCALE ( f# -- f# )
                                    506 ;  m *=fbase , e -= 1
                                    507 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002F37                        508     _HEADER LSCALE,6,"LSCALE"
      00AFB7 AE EF                    1         .word LINK 
                           002F39     2         LINK=.
      00AFB9 06                       3         .byte 6  
      00AFBA 4C 53 43 41 4C 45        4         .ascii "LSCALE"
      00AFC0                          5         LSCALE:
      00AFC0 CD AC 82         [ 4]  509     CALL ATEXP 
      002F43                        510     _DOLIT 1 
      00AFC3 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AFC6 00 01                    2     .word 1 
      00AFC8 CD 88 A6         [ 4]  511     CALL SUBB 
      00AFCB CD 85 D1         [ 4]  512     CALL TOR
      002F4E                        513     _DOLIT 10 
      00AFCE CD 84 EF         [ 4]    1     CALL DOLIT 
      00AFD1 00 0A                    2     .word 10 
      00AFD3 CD A6 88         [ 4]  514     CALL DSSTAR
      00AFD6 CD 85 B4         [ 4]  515     CALL RFROM 
      00AFD9 CD AC C7         [ 4]  516     CALL STEXP 
      00AFDC 81               [ 4]  517     RET  
                                    518 
                                    519 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    520 ;  RSCALE ( f# -- f# )
                                    521 ;  m /=fbase , e+=1 
                                    522 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002F5D                        523     _HEADER RSCALE,6,"RSCALE"
      00AFDD AF B9                    1         .word LINK 
                           002F5F     2         LINK=.
      00AFDF 06                       3         .byte 6  
      00AFE0 52 53 43 41 4C 45        4         .ascii "RSCALE"
      00AFE6                          5         RSCALE:
      00AFE6 CD AC 82         [ 4]  524     CALL ATEXP 
      002F69                        525     _DOLIT 1 
      00AFE9 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AFEC 00 01                    2     .word 1 
      00AFEE CD 88 2D         [ 4]  526     CALL PLUS 
      00AFF1 CD 85 D1         [ 4]  527     CALL TOR 
      002F74                        528     _DOLIT 10 
      00AFF4 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AFF7 00 0A                    2     .word 10 
      00AFF9 CD A5 E0         [ 4]  529     CALL DSLMOD 
      00AFFC CD 87 CC         [ 4]  530     CALL ROT 
      00AFFF CD 85 FE         [ 4]  531     CALL DROP 
      00B002 CD 85 B4         [ 4]  532     CALL RFROM 
      00B005 CD AC C7         [ 4]  533     CALL STEXP 
      00B008 81               [ 4]  534     RET 
                                    535 
                                    536 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    537 ;   SCALE>M ( ud1 -- e ud2 )
                                    538 ;   scale down a double  
                                    539 ;   by repeated d/10
                                    540 ;   until ud<=MAX_MANTISSA   
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 171.
Hexadecimal [24-Bits]



                                    541 ;   e is log10 exponent of scaled down
                                    542 ;   ud2 is scaled down ud1 
                                    543 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002F89                        544     _HEADER SCALETOM,7,"SCALE>M"
      00B009 AF DF                    1         .word LINK 
                           002F8B     2         LINK=.
      00B00B 07                       3         .byte 7  
      00B00C 53 43 41 4C 45 3E 4D     4         .ascii "SCALE>M"
      00B013                          5         SCALETOM:
      00B013 CD 8B B7         [ 4]  545     CALL ZERO 
      00B016 CD 87 EB         [ 4]  546     CALL NROT 
      00B019                        547 SCAL1:
      00B019 CD 86 08         [ 4]  548     CALL DUPP 
      002F9C                        549     _DOLIT 0X7F 
      00B01C CD 84 EF         [ 4]    1     CALL DOLIT 
      00B01F 00 7F                    2     .word 0X7F 
      00B021 CD 89 2A         [ 4]  550     CALL UGREAT 
      002FA4                        551     _QBRAN SCAL2  
      00B024 CD 85 18         [ 4]    1     CALL QBRAN
      00B027 B0 45                    2     .word SCAL2
      002FA9                        552     _DOLIT 10 
      00B029 CD 84 EF         [ 4]    1     CALL DOLIT 
      00B02C 00 0A                    2     .word 10 
      00B02E CD A5 E0         [ 4]  553     CALL DSLMOD 
      00B031 CD 87 CC         [ 4]  554     CALL ROT  
      00B034 CD 85 FE         [ 4]  555     CALL DROP
      00B037 CD 87 CC         [ 4]  556     CALL ROT 
      00B03A CD 8B 4B         [ 4]  557     CALL ONEP 
      00B03D CD 87 EB         [ 4]  558     CALL NROT  
      002FC0                        559     _BRAN SCAL1 
      00B040 CD 85 34         [ 4]    1     CALL BRAN 
      00B043 B0 19                    2     .word SCAL1 
      00B045                        560 SCAL2: 
      00B045 81               [ 4]  561     RET 
                                    562 
                                    563 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    564 ;  UDIV10 ( ut -- ut )
                                    565 ;  divide a 48 bits uint by 10 
                                    566 ;  used to scale down MM* 
                                    567 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00B046                        568 UDIV10:
      00B046 90 93            [ 1]  569     LDW Y,X 
      00B048 90 FE            [ 2]  570     LDW Y,(Y)
      00B04A A6 0A            [ 1]  571     LD A,#10 
      00B04C 90 62            [ 2]  572     DIV Y,A 
      00B04E FF               [ 2]  573     LDW (X),Y 
      00B04F 90 95            [ 1]  574     LD YH,A 
      00B051 E6 02            [ 1]  575     LD A,(2,X)
      00B053 90 97            [ 1]  576     LD YL,A 
      00B055 A6 0A            [ 1]  577     LD A,#10 
      00B057 90 62            [ 2]  578     DIV Y,A 
      00B059 90 95            [ 1]  579     LD YH,A 
      00B05B 90 9F            [ 1]  580     LD A,YL 
      00B05D E7 02            [ 1]  581     LD (2,X),A 
      00B05F E6 03            [ 1]  582     LD A,(3,X)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 172.
Hexadecimal [24-Bits]



      00B061 90 97            [ 1]  583     LD YL,A 
      00B063 A6 0A            [ 1]  584     LD A,#10 
      00B065 90 62            [ 2]  585     DIV Y,A 
      00B067 90 95            [ 1]  586     LD YH,A 
      00B069 90 9F            [ 1]  587     LD A,YL 
      00B06B E7 03            [ 1]  588     LD (3,X),A 
      00B06D E6 04            [ 1]  589     LD A,(4,X)
      00B06F 90 97            [ 1]  590     LD YL,A 
      00B071 A6 0A            [ 1]  591     LD A,#10 
      00B073 90 62            [ 2]  592     DIV Y,A 
      00B075 90 95            [ 1]  593     LD YH,A 
      00B077 90 9F            [ 1]  594     LD A,YL 
      00B079 E7 04            [ 1]  595     LD (4,X),A 
      00B07B E6 05            [ 1]  596     LD A,(5,X)
      00B07D 90 97            [ 1]  597     LD YL,A 
      00B07F A6 0A            [ 1]  598     LD A,#10 
      00B081 90 62            [ 2]  599     DIV Y,A 
      00B083 90 9F            [ 1]  600     LD A,YL 
      00B085 E7 05            [ 1]  601     LD (5,X),A 
      00B087 81               [ 4]  602     RET 
                                    603 
                                    604 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    605 ;   MM* ( m1 m2 -- m3 e )
                                    606 ;   mantissa product 
                                    607 ;  scale down to 23 bits 
                                    608 ;   e  is log10 scaling factor.
                                    609 ;   The maximum product size 
                                    610 ;   before scaling is 46 bits .
                                    611 ;   UDIV10 is used to scale down.  
                                    612 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      003008                        613     _HEADER MMSTAR,3,"MM*"
      00B088 B0 0B                    1         .word LINK 
                           00300A     2         LINK=.
      00B08A 03                       3         .byte 3  
      00B08B 4D 4D 2A                 4         .ascii "MM*"
      00B08E                          5         MMSTAR:
      00B08E CD 88 18         [ 4]  614     CALL DDUP
      00B091 CD A5 68         [ 4]  615     CALL DZEQUAL
      003014                        616     _TBRAN MMSTA2
      00B094 CD 85 26         [ 4]    1     CALL TBRAN 
      00B097 B0 A4                    2     .word MMSTA2 
      00B099                        617 MMSTA1:
      00B099 CD A9 15         [ 4]  618     CALL DOVER 
      00B09C CD A5 68         [ 4]  619     CALL DZEQUAL 
      00301F                        620     _QBRAN MMSTA3 
      00B09F CD 85 18         [ 4]    1     CALL QBRAN
      00B0A2 B0 AF                    2     .word MMSTA3
      00B0A4                        621 MMSTA2: ; ( -- 0 0 0 )
      00B0A4 1C 00 02         [ 2]  622     ADDW X,#2 
      00B0A7 90 5F            [ 1]  623     CLRW Y 
      00B0A9 FF               [ 2]  624     LDW (X),Y 
      00B0AA EF 02            [ 2]  625     LDW (2,X),Y
      00B0AC EF 04            [ 2]  626     LDW (4,X),Y 
      00B0AE 81               [ 4]  627     RET 
      00B0AF                        628 MMSTA3:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 173.
Hexadecimal [24-Bits]



      00B0AF CD A5 C7         [ 4]  629     CALL DSIGN 
      00B0B2 CD 85 D1         [ 4]  630     CALL TOR    ; R: m2sign 
      00B0B5 CD A5 B0         [ 4]  631     CALL DABS   ; m1 um2 
      00B0B8 CD A6 D1         [ 4]  632     CALL DSWAP  ; um2 m1 
      00B0BB CD A5 C7         [ 4]  633     CALL DSIGN  ; um2 m1 m1sign 
      00B0BE CD 85 B4         [ 4]  634     CALL RFROM 
      00B0C1 CD 86 8E         [ 4]  635     CALL XORR 
      00B0C4 CD 85 D1         [ 4]  636     CALL TOR   ; R: product_sign 
      00B0C7 CD A5 B0         [ 4]  637     CALL DABS  ; um2 um1  
      00B0CA CD A8 4E         [ 4]  638     CALL DTOR  ; um2 
      00B0CD CD 86 08         [ 4]  639     CALL DUPP  ; um2 um2hi 
      00B0D0 CD 85 C5         [ 4]  640     CALL RAT   ; um2 um2hi um1hi
                                    641 ; first partial product  
                                    642 ; pd1=um2hi*um1hi 
      00B0D3 CD 8A CA         [ 4]  643     CALL STAR 
      00B0D6 CD 8B B7         [ 4]  644     CALL ZERO 
      00B0D9 CD 86 18         [ 4]  645     CALL SWAPP ; pd1<<16  
      00B0DC CD A6 D1         [ 4]  646     CALL DSWAP ; pd1 um2 
      00B0DF CD 86 30         [ 4]  647     CALL OVER  ; pd1 um2 um2lo 
      00B0E2 CD 85 B4         [ 4]  648     CALL RFROM ; pd1 um2 um2lo um1hi 
                                    649 ; pd2=um2lo*um1hi 
      00B0E5 CD 8A 80         [ 4]  650     CALL UMSTA ; pd1 um2 pd2 
      00B0E8 CD A6 D1         [ 4]  651     CALL DSWAP ; pd1 pd2 um2 
      00B0EB CD 85 C5         [ 4]  652     CALL RAT   ; pd1 pd2 um2 um1lo 
                                    653 ; pd3= um2hi*um1lo 
      00B0EE CD 8A 80         [ 4]  654     CALL UMSTA ; pd1 pd2 um2lo pd3 
      00B0F1 CD 87 CC         [ 4]  655     CALL ROT ; pd1 pd2 pd3 um2lo 
      00B0F4 CD 85 D1         [ 4]  656     CALL TOR ; pd1 pd2 pd3 R: psign um1lo um2lo 
                                    657 ; pd1+pd2+pd3  pd1
      00B0F7 CD AB 15         [ 4]  658     CALL DPLUS 
      00B0FA CD AB 15         [ 4]  659     CALL DPLUS  
      00B0FD CD A8 6C         [ 4]  660     CALL DRFROM ; triple um2lo um1lo 
                                    661 ; last partial product um2lo*um1lo 
      00B100 CD 8A 80         [ 4]  662     CALL UMSTA ; prod pd4 
                                    663 ; mm*=prod<<16+pd4  
      00B103 CD A8 4E         [ 4]  664     CALL DTOR ;   R: psign pd4lo pd4hi  
                                    665  ; add pd4hi to prodlo and propagate carry 
      00B106 90 93            [ 1]  666     LDW Y,X 
      00B108 90 EE 02         [ 2]  667     LDW Y,(2,Y)  ; prodlo 
      00B10B 72 F9 01         [ 2]  668     ADDW Y,(1,SP)  ; prodlo+pd4hi 
      00B10E 17 01            [ 2]  669     LDW (1,SP),Y    ; plo phi  
      00B110 90 93            [ 1]  670     LDW Y,X
      00B112 90 FE            [ 2]  671     LDW Y,(Y) ; prodhi  
      00B114 24 04            [ 1]  672     JRNC MMSTA4
      00B116 72 A9 00 01      [ 2]  673     ADDW Y,#1 ; add carry 
      00B11A                        674 MMSTA4:     
      00B11A 1D 00 02         [ 2]  675     SUBW X,#2 
      00B11D FF               [ 2]  676     LDW (X),Y 
      00B11E 90 85            [ 2]  677     POPW Y 
      00B120 EF 02            [ 2]  678     LDW (2,X),Y 
      00B122 90 85            [ 2]  679     POPW Y 
      00B124 EF 04            [ 2]  680     LDW (4,X),Y
      00B126 CD 8B B7         [ 4]  681     CALL ZERO 
      00B129 CD 85 D1         [ 4]  682     CALL TOR 
      00B12C                        683 MMSTA5:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 174.
Hexadecimal [24-Bits]



      00B12C CD 87 BB         [ 4]  684     CALL QDUP 
      0030AF                        685     _QBRAN MMSTA6 
      00B12F CD 85 18         [ 4]    1     CALL QBRAN
      00B132 B1 45                    2     .word MMSTA6
      00B134 CD B0 46         [ 4]  686     CALL UDIV10 
      00B137 CD 85 B4         [ 4]  687     CALL RFROM 
      00B13A CD 8B 4B         [ 4]  688     CALL ONEP 
      00B13D CD 85 D1         [ 4]  689     CALL TOR 
      0030C0                        690     _BRAN MMSTA5 
      00B140 CD 85 34         [ 4]    1     CALL BRAN 
      00B143 B1 2C                    2     .word MMSTA5 
                                    691 ; now scale to double 
                                    692 ; scale further <= MAX_MANTISSA 
      00B145                        693 MMSTA6: 
      00B145 CD 85 B4         [ 4]  694     CALL RFROM 
      00B148 CD 87 EB         [ 4]  695     CALL NROT 
      00B14B CD B0 13         [ 4]  696     CALL SCALETOM
      00B14E CD A8 4E         [ 4]  697     CALL DTOR 
      00B151 CD 88 2D         [ 4]  698     CALL PLUS 
      00B154 CD A8 6C         [ 4]  699     CALL DRFROM 
      00B157 CD 85 B4         [ 4]  700     CALL RFROM
      0030DA                        701     _QBRAN MMSTA7
      00B15A CD 85 18         [ 4]    1     CALL QBRAN
      00B15D B1 62                    2     .word MMSTA7
      00B15F CD 88 6A         [ 4]  702     CALL DNEGA
      00B162                        703 MMSTA7:
      00B162 CD 87 CC         [ 4]  704     CALL ROT ; m e 
      00B165 81               [ 4]  705     RET 
                                    706 
                                    707 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    708 ;    F* ( f#1 f#2 -- f#3 )
                                    709 ;    float product 
                                    710 ;    f#3=f#1 * f#2 
                                    711 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0030E6                        712     _HEADER FSTAR,2,"F*"
      00B166 B0 8A                    1         .word LINK 
                           0030E8     2         LINK=.
      00B168 02                       3         .byte 2  
      00B169 46 2A                    4         .ascii "F*"
      00B16B                          5         FSTAR:
      00B16B CD AC 82         [ 4]  713     CALL ATEXP ; f#1 m2 e2 
      00B16E CD 85 D1         [ 4]  714     CALL TOR   
      00B171 CD A6 D1         [ 4]  715     CALL DSWAP ; m2 f#1
      00B174 CD AC 82         [ 4]  716     CALL ATEXP ; m2 m1 e1 
      00B177 CD 85 B4         [ 4]  717     CALL RFROM ; m2 m1 e1 e2 
      00B17A CD 88 2D         [ 4]  718     CALL PLUS  ; m2 m1 e 
      00B17D CD 85 D1         [ 4]  719     CALL TOR   ; m2 m1 R: e 
      00B180 CD B0 8E         [ 4]  720     CALL MMSTAR ; m2*m1 e   
      00B183 CD 85 B4         [ 4]  721     CALL RFROM 
      00B186 CD 88 2D         [ 4]  722     CALL PLUS 
      00B189 CD AC C7         [ 4]  723     CALL STEXP ; f#3 
      00B18C 81               [ 4]  724     RET 
                                    725 
                                    726 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    727 ;  F/ ( f#1 f#2 -- f#3 )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 175.
Hexadecimal [24-Bits]



                                    728 ;  float division
                                    729 ;  f#3 = f#1/f#2
                                    730 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00310D                        731     _HEADER FSLASH,2,"F/"
      00B18D B1 68                    1         .word LINK 
                           00310F     2         LINK=.
      00B18F 02                       3         .byte 2  
      00B190 46 2F                    4         .ascii "F/"
      00B192                          5         FSLASH:
      00B192 CD AC 82         [ 4]  732     CALL ATEXP  ; f#1 m2 e2  
      00B195 CD 85 D1         [ 4]  733     CALL TOR    ; f#1 m2   R: e2 
      00B198 CD A6 D1         [ 4]  734     CALL DSWAP  ; m2 f#1 
      00B19B CD AC 82         [ 4]  735     CALL ATEXP  ; m2 m1 e1 
      00B19E CD 85 B4         [ 4]  736     CALL RFROM  ; m2 m1 e1 e2
      00B1A1 CD 88 2D         [ 4]  737     CALL PLUS   ; m2 m1 e 
      00B1A4 CD 85 D1         [ 4]  738     CALL TOR    ; m2 m1 R: e 
      00B1A7 CD A6 D1         [ 4]  739     CALL DSWAP  ; m1 m2 R: e
      00B1AA CD 88 18         [ 4]  740     CALL DDUP  ; m1 m2 m2 R: e
      00B1AD CD A8 4E         [ 4]  741     CALL DTOR  ; m1 m2 R: e m2 ( keep divisor need later ) 
      00B1B0 CD AA 1E         [ 4]  742     CALL DDSLMOD ; remainder m1/m2 R: e m2 
      00B1B3 CD A9 15         [ 4]  743     CALL DOVER ; if remainder null done 
      00B1B6 CD A5 68         [ 4]  744     CALL DZEQUAL 
      003139                        745     _TBRAN FSLASH8 
      00B1B9 CD 85 26         [ 4]    1     CALL TBRAN 
      00B1BC B2 15                    2     .word FSLASH8 
                                    746 ; get fractional digits from remainder until mantissa saturate
      00B1BE                        747 FSLASH1: ; remainder mantissa R: e divisor 
                                    748 ; check for mantissa saturation 
      00B1BE CD 88 18         [ 4]  749     CALL DDUP 
      003141                        750     _DOLIT 0XCCCC 
      00B1C1 CD 84 EF         [ 4]    1     CALL DOLIT 
      00B1C4 CC CC                    2     .word 0XCCCC 
      003146                        751     _DOLIT 0xC
      00B1C6 CD 84 EF         [ 4]    1     CALL DOLIT 
      00B1C9 00 0C                    2     .word 0xC 
      00B1CB CD A7 C6         [ 4]  752     CALL DGREAT 
      00314E                        753     _TBRAN FSLASH8 ; another loop would result in mantissa overflow 
      00B1CE CD 85 26         [ 4]    1     CALL TBRAN 
      00B1D1 B2 15                    2     .word FSLASH8 
                                    754 ; multiply mantissa by 10 
      003153                        755     _DOLIT 10 
      00B1D3 CD 84 EF         [ 4]    1     CALL DOLIT 
      00B1D6 00 0A                    2     .word 10 
      00B1D8 CD 8B B7         [ 4]  756     CALL ZERO 
      00B1DB CD A9 BB         [ 4]  757     CALL DSTAR 
                                    758 ; mutliply remainder by 10     
      00B1DE CD A6 D1         [ 4]  759     CALL DSWAP 
      003161                        760     _DOLIT 10 
      00B1E1 CD 84 EF         [ 4]    1     CALL DOLIT 
      00B1E4 00 0A                    2     .word 10 
      00B1E6 CD 8B B7         [ 4]  761     CALL ZERO 
      00B1E9 CD A9 BB         [ 4]  762     CALL DSTAR 
                                    763 ; divide remainder by m2     
      00B1EC CD A8 84         [ 4]  764     CALL DRAT 
      00B1EF CD AA 1E         [ 4]  765     CALL DDSLMOD 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 176.
Hexadecimal [24-Bits]



      00B1F2 CD A6 D1         [ 4]  766     CALL DSWAP ; mantissa frac_digit remainder R: e divisor  
      00B1F5 CD A8 4E         [ 4]  767     CALL DTOR  ; mantissa frac_digit R: e divisor remainder 
      00B1F8 CD AB 15         [ 4]  768     CALL DPLUS ; mantissa+frac_digit 
      00B1FB CD A8 6C         [ 4]  769     CALL DRFROM ; mantissa remainder 
      00B1FE CD A8 6C         [ 4]  770     CALL DRFROM ; mantissa remainder divisor 
      00B201 CD 85 B4         [ 4]  771     CALL RFROM  ; mantissa remainder divisor e 
      00B204 CD 8B 58         [ 4]  772     CALL ONEM   ; decrement exponent 
      00B207 CD 85 D1         [ 4]  773     CALL TOR    ; mantissa remainder divisor R: e 
      00B20A CD A8 4E         [ 4]  774     CALL DTOR   ; mantissa remainder R: e divisor 
      00B20D CD A6 D1         [ 4]  775     CALL DSWAP  ; remainder mantissa  
      003190                        776     _BRAN FSLASH1
      00B210 CD 85 34         [ 4]    1     CALL BRAN 
      00B213 B1 BE                    2     .word FSLASH1 
      00B215                        777 FSLASH8: ; remainder mantissa R: e divisor 
      00B215 CD A6 D1         [ 4]  778     CALL DSWAP  
      00B218 CD 88 0D         [ 4]  779     CALL DDROP  ; drop remainder     
      00B21B CD A8 6C         [ 4]  780     CALL DRFROM
      00B21E CD 88 0D         [ 4]  781     CALL DDROP  ; drop divisor 
      00B221 CD 85 B4         [ 4]  782     CALL RFROM  ; exponent 
      00B224 CD AC C7         [ 4]  783     CALL STEXP 
      00B227 81               [ 4]  784     RET 
                                    785 
                                    786 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    787 ;   D>F  ( # -- f# )
                                    788 ;   convert double to float 
                                    789 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0031A8                        790     _HEADER DTOF,3,"D>F"
      00B228 B1 8F                    1         .word LINK 
                           0031AA     2         LINK=.
      00B22A 03                       3         .byte 3  
      00B22B 44 3E 46                 4         .ascii "D>F"
      00B22E                          5         DTOF:
      00B22E CD A5 C7         [ 4]  791     CALL DSIGN 
      00B231 CD 85 D1         [ 4]  792     CALL TOR
      00B234 CD A5 B0         [ 4]  793     CALL DABS  
      00B237                        794 DTOF1:      
      00B237 CD B0 13         [ 4]  795     CALL SCALETOM 
      00B23A CD 85 B4         [ 4]  796     CALL RFROM
      0031BD                        797     _QBRAN DTOF2 
      00B23D CD 85 18         [ 4]    1     CALL QBRAN
      00B240 B2 45                    2     .word DTOF2
      00B242 CD A5 86         [ 4]  798     CALL DNEGAT 
      00B245                        799 DTOF2: 
      00B245 CD 87 CC         [ 4]  800     CALL ROT 
      00B248 CD AC C7         [ 4]  801     CALL STEXP 
      00B24B 81               [ 4]  802     RET 
                                    803 
                                    804 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    805 ;   F>D  ( f# -- # )
                                    806 ;  convert float to double 
                                    807 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0031CC                        808     _HEADER FTOD,3,"F>D"
      00B24C B2 2A                    1         .word LINK 
                           0031CE     2         LINK=.
      00B24E 03                       3         .byte 3  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 177.
Hexadecimal [24-Bits]



      00B24F 46 3E 44                 4         .ascii "F>D"
      00B252                          5         FTOD:
      00B252 CD AC 82         [ 4]  809     CALL ATEXP ; m e 
      00B255 CD 87 BB         [ 4]  810     CALL QDUP
      0031D8                        811     _QBRAN FTOD9
      00B258 CD 85 18         [ 4]    1     CALL QBRAN
      00B25B B2 E8                    2     .word FTOD9
      00B25D CD 85 D1         [ 4]  812     CALL TOR 
      00B260 CD A5 C7         [ 4]  813     CALL DSIGN 
      00B263 CD 87 EB         [ 4]  814     CALL NROT 
      00B266 CD A5 B0         [ 4]  815     CALL DABS
      00B269 CD 85 B4         [ 4]  816     CALL RFROM  
      00B26C CD 86 08         [ 4]  817     CALL DUPP   
      00B26F CD 86 3F         [ 4]  818     CALL ZLESS 
      0031F2                        819     _QBRAN FTOD4 
      00B272 CD 85 18         [ 4]    1     CALL QBRAN
      00B275 B2 B0                    2     .word FTOD4
                                    820 ; negative exponent 
      00B277 CD 88 C0         [ 4]  821     CALL ABSS 
      00B27A CD 85 D1         [ 4]  822     CALL TOR
      0031FD                        823     _BRAN FTOD2  
      00B27D CD 85 34         [ 4]    1     CALL BRAN 
      00B280 B2 9B                    2     .word FTOD2 
      00B282                        824 FTOD1:
      00B282 CD 88 18         [ 4]  825     CALL DDUP 
      00B285 CD A5 68         [ 4]  826     CALL DZEQUAL 
      003208                        827     _TBRAN FTOD3 
      00B288 CD 85 26         [ 4]    1     CALL TBRAN 
      00B28B B2 A5                    2     .word FTOD3 
      00320D                        828     _DOLIT 10 
      00B28D CD 84 EF         [ 4]    1     CALL DOLIT 
      00B290 00 0A                    2     .word 10 
      00B292 CD A5 E0         [ 4]  829     CALL DSLMOD 
      00B295 CD 87 CC         [ 4]  830     CALL ROT 
      00B298 CD 85 FE         [ 4]  831     CALL DROP
      00B29B                        832 FTOD2:      
      00321B                        833     _DONXT FTOD1
      00B29B CD 85 03         [ 4]    1     CALL DONXT 
      00B29E B2 82                    2     .word FTOD1 
      003220                        834     _BRAN FTOD8   
      00B2A0 CD 85 34         [ 4]    1     CALL BRAN 
      00B2A3 B2 DD                    2     .word FTOD8 
      00B2A5                        835 FTOD3: 
      00B2A5 CD 85 B4         [ 4]  836     CALL RFROM 
      00B2A8 CD 85 FE         [ 4]  837     CALL DROP 
      00322B                        838     _BRAN FTOD8  
      00B2AB CD 85 34         [ 4]    1     CALL BRAN 
      00B2AE B2 DD                    2     .word FTOD8 
                                    839 ; positive exponent 
      00B2B0                        840 FTOD4:
      00B2B0 CD 85 D1         [ 4]  841     CALL TOR 
      003233                        842     _BRAN FTOD6
      00B2B3 CD 85 34         [ 4]    1     CALL BRAN 
      00B2B6 B2 D8                    2     .word FTOD6 
      00B2B8                        843 FTOD5:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 178.
Hexadecimal [24-Bits]



      00B2B8 CD 88 18         [ 4]  844     CALL DDUP 
      00323B                        845     _DOLIT 0XCCCC
      00B2BB CD 84 EF         [ 4]    1     CALL DOLIT 
      00B2BE CC CC                    2     .word 0XCCCC 
      003240                        846     _DOLIT 0XCCC  
      00B2C0 CD 84 EF         [ 4]    1     CALL DOLIT 
      00B2C3 0C CC                    2     .word 0XCCC 
      00B2C5 CD A7 C6         [ 4]  847     CALL DGREAT 
      003248                        848     _TBRAN FTOD3 
      00B2C8 CD 85 26         [ 4]    1     CALL TBRAN 
      00B2CB B2 A5                    2     .word FTOD3 
      00324D                        849     _DOLIT 10 
      00B2CD CD 84 EF         [ 4]    1     CALL DOLIT 
      00B2D0 00 0A                    2     .word 10 
      00B2D2 CD 8B B7         [ 4]  850     CALL ZERO 
      00B2D5 CD A9 BB         [ 4]  851     CALL DSTAR 
      00B2D8                        852 FTOD6: 
      003258                        853     _DONXT FTOD5 
      00B2D8 CD 85 03         [ 4]    1     CALL DONXT 
      00B2DB B2 B8                    2     .word FTOD5 
      00B2DD                        854 FTOD8:
      00B2DD CD 87 CC         [ 4]  855     CALL ROT 
      003260                        856     _QBRAN FTOD9 
      00B2E0 CD 85 18         [ 4]    1     CALL QBRAN
      00B2E3 B2 E8                    2     .word FTOD9
      00B2E5 CD 88 6A         [ 4]  857     CALL DNEGA
      00B2E8                        858 FTOD9:          
      00B2E8 81               [ 4]  859     RET 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 179.
Hexadecimal [24-Bits]



                                   4440 .endif 
                                   4441 
                                   4442 ;===============================================================
                                   4443 
                           0031CE  4444 LASTN =	LINK   ;last name defined
                                   4445 
                                   4446 ; application code begin here
      00B300                       4447 	.bndry 128 ; align on flash block  
      00B300                       4448 app_space: 
                                   4449 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 180.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   6 AB1        000849 R   |   6 ABOR1      001322 R
  6 ABOR2      001339 R   |   6 ABORQ      00131A R   |   6 ABORT      00130B R
  6 ABRTQ      001601 R   |   6 ABSS       000840 R   |   6 ACCEP      0012A1 R
  6 ACCP1      0012AA R   |   6 ACCP2      0012D0 R   |   6 ACCP3      0012D3 R
  6 ACCP4      0012D5 R   |     ADC_CR1 =  005401     |     ADC_CR1_=  000000 
    ADC_CR1_=  000001     |     ADC_CR1_=  000004     |     ADC_CR1_=  000005 
    ADC_CR1_=  000006     |     ADC_CR2 =  005402     |     ADC_CR2_=  000003 
    ADC_CR2_=  000004     |     ADC_CR2_=  000005     |     ADC_CR2_=  000006 
    ADC_CR2_=  000001     |     ADC_CR3 =  005403     |     ADC_CR3_=  000007 
    ADC_CR3_=  000006     |     ADC_CSR =  005400     |     ADC_CSR_=  000006 
    ADC_CSR_=  000004     |     ADC_CSR_=  000000     |     ADC_CSR_=  000001 
    ADC_CSR_=  000002     |     ADC_CSR_=  000003     |     ADC_CSR_=  000007 
    ADC_CSR_=  000005     |     ADC_DRH =  005404     |     ADC_DRL =  005405 
    ADC_TDRH=  005406     |     ADC_TDRL=  005407     |   6 ADRADJ     00072B R
    AFR     =  004803     |     AFR0_ADC=  000000     |     AFR1_TIM=  000001 
    AFR2_CCO=  000002     |     AFR3_TIM=  000003     |     AFR4_TIM=  000004 
    AFR5_TIM=  000005     |     AFR6_I2C=  000006     |     AFR7_BEE=  000007 
  6 AFT        0015EC R   |   6 AGAIN      001542 R   |   6 AHEAD      00159F R
  6 ALLOT      00144A R   |   6 ANDD       0005E5 R   |     APP_CP  =  004004 
    APP_LAST=  004000     |     APP_RUN =  004002     |     APP_VP  =  004006 
  6 AT         0004E3 R   |   6 ATEXE      000C4A R   |   6 ATEXP      002C02 R
  6 AUTORUN    000129 R   |     AWU_APR =  0050F1     |     AWU_CSR =  0050F0 
    AWU_TBR =  0050F2     |     B0_MASK =  000001     |     B115200 =  000006 
  6 B115K2     0003E0 R   |     B19200  =  000003     |   6 B19K2      0003BD R
    B1_MASK =  000002     |     B230400 =  000007     |     B2400   =  000000 
  6 B2K4       00038E R   |     B2_MASK =  000004     |     B38400  =  000004 
    B3_MASK =  000008     |     B460800 =  000008     |     B4800   =  000001 
  6 B4K8       00039C R   |     B4_MASK =  000010     |     B57600  =  000005 
  6 B57K6      0003CE R   |     B5_MASK =  000020     |     B6_MASK =  000040 
    B7_MASK =  000080     |     B921600 =  000009     |     B9600   =  000002 
  6 B9K6       0003AC R   |   6 BACK1      001249 R   |   6 BASE       00064E R
    BASEE   =  00000A     |   6 BAUD       0003F0 R   |     BCNT    =  000001 
  6 BCOMP      00148C R   |   6 BDIGS      000D31 R   |     BEEP_BIT=  000004 
    BEEP_CSR=  0050F3     |     BEEP_MAS=  000010     |     BEEP_POR=  00000F 
  6 BEGIN      001524 R   |     BIT0    =  000000     |     BIT1    =  000001 
    BIT2    =  000002     |     BIT3    =  000003     |     BIT4    =  000004 
    BIT5    =  000005     |     BIT6    =  000006     |     BIT7    =  000007 
  6 BKSLA      00109E R   |   6 BKSP       001219 R   |     BKSPP   =  000008 
  6 BLANK      000B2A R   |     BLOCK_SI=  000080     |     BOOT_ROM=  006000 
    BOOT_ROM=  007FFF     |   6 BRAN       0004B4 R   |     BTW     =  000001 
  6 BUF2ROW    002069 R   |   6 BYE        0000B6 R   |     CADR    =  000003 
    CALLL   =  0000CD     |   6 CALLOT     0022B2 R   |     CAN_DGR =  005426 
    CAN_FPSR=  005427     |     CAN_IER =  005425     |     CAN_MCR =  005420 
    CAN_MSR =  005421     |     CAN_P0  =  005428     |     CAN_P1  =  005429 
    CAN_P2  =  00542A     |     CAN_P3  =  00542B     |     CAN_P4  =  00542C 
    CAN_P5  =  00542D     |     CAN_P6  =  00542E     |     CAN_P7  =  00542F 
    CAN_P8  =  005430     |     CAN_P9  =  005431     |     CAN_PA  =  005432 
    CAN_PB  =  005433     |     CAN_PC  =  005434     |     CAN_PD  =  005435 
    CAN_PE  =  005436     |     CAN_PF  =  005437     |     CAN_RFR =  005424 
    CAN_TPR =  005423     |     CAN_TSR =  005422     |     CARRY   =  00002A 
    CASE_SEN=  000000     |   6 CAT        000501 R   |   6 CCOMMA     00146E R
    CC_C    =  000000     |     CC_H    =  000004     |     CC_I0   =  000003 
    CC_I1   =  000005     |     CC_N    =  000002     |     CC_V    =  000007 
    CC_Z    =  000001     |     CELLL   =  000002     |   6 CELLM      000AAF R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 181.
Hexadecimal [24-Bits]

Symbol Table

  6 CELLP      000AA0 R   |   6 CELLS      000ABE R   |     CFG_GCR =  007F60 
    CFG_GCR_=  000001     |     CFG_GCR_=  000000     |   6 CHAR1      000E87 R
  6 CHAR2      000E8A R   |   6 CHKIVEC    001F57 R   |     CLKOPT  =  004807 
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
    CLK_SWR_=  0000E1     |     CLK_SWR_=  0000D2     |   6 CMOV1      000C69 R
  6 CMOV2      000C81 R   |   6 CMOVE      000C61 R   |     CNTDWN  =  000032 
  6 CNTXT      0006D1 R   |   6 COLD       001A58 R   |   6 COLD1      001A58 R
  6 COLON      0017AA R   |   6 COMMA      001457 R   |   6 COMPI      00149C R
    COMPO   =  000040     |   6 CONSTANT   001854 R   |   6 COUNT      000BFD R
  6 CPP        0006ED R   |     CPU_A   =  007F00     |     CPU_CCR =  007F0A 
    CPU_PCE =  007F01     |     CPU_PCH =  007F02     |     CPU_PCL =  007F03 
    CPU_SPH =  007F08     |     CPU_SPL =  007F09     |     CPU_XH  =  007F04 
    CPU_XL  =  007F05     |     CPU_YH  =  007F06     |     CPU_YL  =  007F07 
  6 CR         000EAF R   |   6 CREAT      0017F0 R   |     CRR     =  00000D 
  6 CSTOR      0004F0 R   |   6 CTABLE     0022D3 R   |   6 CTAT       0022F4 R
  6 CTINIT     00231C R   |   6 D2SLASH    0028AE R   |   6 D2STAR     0028C5 R
  6 DABS       002530 R   |   6 DABS1      00253E R   |   6 DAT        000BE1 R
    DATSTK  =  001680     |   6 DCLZ       00267F R   |   6 DCLZ1      002688 R
  6 DCLZ4      002691 R   |   6 DCLZ8      00269E R   |   6 DCMP       00279C R
  6 DCMP2      0027A8 R   |   6 DCMP4      0027C3 R   |   6 DCMP_EQU   0027B5 R
  6 DCMP_GRE   0027BF R   |   6 DCMP_SMA   0027B9 R   |   6 DCONST     001889 R
  6 DDIG       0025A1 R   |   6 DDIGS      0025BA R   |   6 DDOT       0025D1 R
  6 DDOT0      0025E5 R   |   6 DDOT1      0025FB R   |   6 DDROP      00078D R
  6 DDSLMOD    00299E R   |   6 DDSTAR3    002994 R   |   6 DDUP       000798 R
    DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF     |   6 DECIM      000DE1 R
  6 DEPTH      000B79 R   |   6 DEQU4      00273A R   |   6 DEQUAL     002725 R
    DEVID_BA=  0048CD     |     DEVID_EN=  0048D8     |     DEVID_LO=  0048D2 
    DEVID_LO=  0048D3     |     DEVID_LO=  0048D4     |     DEVID_LO=  0048D5 
    DEVID_LO=  0048D6     |     DEVID_LO=  0048D7     |     DEVID_LO=  0048D8 
    DEVID_WA=  0048D1     |     DEVID_XH=  0048CE     |     DEVID_XL=  0048CD 
    DEVID_YH=  0048D0     |     DEVID_YL=  0048CF     |   6 DGREAT     002746 R
  6 DGREAT4    00275B R   |   6 DGTQ1      000E26 R   |   6 DI         0000C4 R
  6 DIG        000D5A R   |   6 DIGIT      000CF5 R   |   6 DIGS       000D6B R
  6 DIGS1      000D6B R   |   6 DIGS2      000D78 R   |   6 DIGTQ      000DF5 R
    DISCOVER=  000000     |   6 DLESS      002767 R   |   6 DLESS4     00277D R
  6 DLITER     00286E R   |   6 DLSHIFT    0028E1 R   |   6 DLSHIFT1   0028F2 R
  6 DLSHIFT2   002907 R   |     DM_BK1RE=  007F90     |     DM_BK1RH=  007F91 
    DM_BK1RL=  007F92     |     DM_BK2RE=  007F93     |     DM_BK2RH=  007F94 
    DM_BK2RL=  007F95     |     DM_CR1  =  007F96     |     DM_CR2  =  007F97 
    DM_CSR1 =  007F98     |     DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A 
  6 DN1        000807 R   |   6 DNEG1      002525 R   |   6 DNEGA      0007EA R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 182.
Hexadecimal [24-Bits]

Symbol Table

  6 DNEGAT     002506 R   |   6 DOCONST    001874 R   |   6 DOLIT      00046F R
  6 DONXT      000483 R   |     DOORBELL=  000000     |   6 DOSTR      000EBF R
  6 DOT        000F56 R   |   6 DOT1       000F6C R   |   6 DOTI1      0019D9 R
  6 DOTID      0019C3 R   |   6 DOTO1      0013AE R   |   6 DOTOK      001394 R
  6 DOTPR      00107F R   |   6 DOTQ       00161B R   |   6 DOTQP      000EDC R
  6 DOTR       000EEA R   |   6 DOTS       001965 R   |   6 DOTS1      001970 R
  6 DOTS2      001979 R   |   6 DOVAR      00063E R   |   6 DOVER      002895 R
  6 DO_DCONS   0018AC R   |   6 DPLUS      002A95 R   |   6 DPLUS1     002ABC R
  6 DRAT       002804 R   |   6 DRFROM     0027EC R   |   6 DROP       00057E R
  6 DROT       0026EB R   |   6 DRSHIFT    002918 R   |   6 DRSHIFT1   00291F R
  6 DRSHIFT2   002935 R   |   6 DSIGN      002547 R   |   6 DSIGN1     002551 R
  6 DSLA1      0029B8 R   |   6 DSLA2      0029DA R   |   6 DSLA3      002A1A R
  6 DSLA4      002A40 R   |   6 DSLA7      002A71 R   |   6 DSLA8      002A74 R
  6 DSLA9      002A8F R   |   6 DSLMOD     002560 R   |   6 DSLMOD3    00257B R
  6 DSLMOD4    002587 R   |   6 DSLMODa    002582 R   |   6 DSLMODb    00258D R
  6 DSSTAR     002608 R   |   6 DSSTAR1    00261F R   |   6 DSSTAR3    002648 R
  6 DSTAR      00293B R   |   6 DSTOR      000BC8 R   |   6 DSUB       002AC7 R
  6 DSUB1      002AEE R   |   6 DSWAP      002651 R   |   6 DTOF       0031AE R
  6 DTOF1      0031B7 R   |   6 DTOF2      0031C5 R   |   6 DTOR       0027CE R
  6 DUMP       00191B R   |   6 DUMP1      001932 R   |   6 DUMP3      001954 R
  6 DUMPP      0018EA R   |   6 DUPP       000588 R   |   6 DVARIA     002822 R
  6 DZEQUAL    0024E8 R   |   6 DZLESS     002784 R   |   6 DZLESS1    00278E R
  6 EDIGS      000D96 R   |   6 EDOT       002CC6 R   |   6 EDOT0      002CDD R
  6 EDOT1      002CEB R   |   6 EDOT2      002CF1 R   |   6 EDOT3      002D0A R
  6 EDOT4      002D39 R   |   6 EDOT5      002D55 R   |   6 EECSTORE   001D08 R
  6 EEPCP      001B2E R   |   6 EEPLAST    001B01 R   |   6 EEPROM     001AE9 R
    EEPROM_B=  004000     |     EEPROM_E=  0047FF     |     EEPROM_R=  000010 
    EEPROM_S=  000800     |   6 EEPRUN     001B18 R   |   6 EEPVP      001B44 R
  6 EESTORE    001D54 R   |   6 EE_CCOMM   00201E R   |   6 EE_COMMA   001FFD R
  6 EE_CREAD   001C99 R   |   6 EE_READ    001C77 R   |   6 EI         0000BD R
  6 ELSEE      00157A R   |   6 EMIT       000436 R   |   6 ENEPER     00223E R
    EOL_CR  =  000001     |     EOL_LF  =  000000     |   6 EQ1        000864 R
  6 EQUAL      00084E R   |   6 ERASE      000CC3 R   |     ERR     =  00001B 
  6 EVAL       0013D7 R   |   6 EVAL1      0013D7 R   |   6 EVAL2      0013F3 R
  6 EXE1       000C58 R   |   6 EXECU      0004C4 R   |     EXT     =  000000 
    EXTI_CR1=  0050A0     |     EXTI_CR2=  0050A1     |   6 EXTRC      000D1D R
  6 FADDR      0020EB R   |   6 FARAT      001BAF R   |   6 FARCAT     001BBB R
  6 FC_XOFF    000463 R   |   6 FC_XON     00044D R   |   6 FDOT       002D64 R
  6 FDOT0      002DA2 R   |   6 FDOT1      002D91 R   |   6 FDOT10     002DFE R
  6 FDOT2      002DB0 R   |   6 FDOT3      002DC9 R   |   6 FDOT6      002DD9 R
  6 FDOT7      002DDE R   |   6 FDOT8      002DE6 R   |   6 FDOT9      002DEE R
  6 FER        002B2B R   |     FHSE    =  7A1200     |     FHSI    =  F42400 
  6 FILL       000C90 R   |   6 FILL1      000CAD R   |   6 FILL2      000CB6 R
  6 FIND       001175 R   |   6 FIND1      001193 R   |   6 FIND2      0011C1 R
  6 FIND3      0011CD R   |   6 FIND4      0011E1 R   |   6 FIND5      0011EE R
  6 FIND6      0011D2 R   |   6 FINIT      002B21 R   |     FLASH_BA=  008000 
    FLASH_CR=  00505A     |     FLASH_CR=  000002     |     FLASH_CR=  000000 
    FLASH_CR=  000003     |     FLASH_CR=  000001     |     FLASH_CR=  00505B 
    FLASH_CR=  000005     |     FLASH_CR=  000004     |     FLASH_CR=  000007 
    FLASH_CR=  000000     |     FLASH_CR=  000006     |     FLASH_DU=  005064 
    FLASH_DU=  0000AE     |     FLASH_DU=  000056     |     FLASH_EN=  027FFF 
    FLASH_FP=  00505D     |     FLASH_FP=  000000     |     FLASH_FP=  000001 
    FLASH_FP=  000002     |     FLASH_FP=  000003     |     FLASH_FP=  000004 
    FLASH_FP=  000005     |     FLASH_IA=  00505F     |     FLASH_IA=  000003 
    FLASH_IA=  000002     |     FLASH_IA=  000006     |     FLASH_IA=  000001 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 183.
Hexadecimal [24-Bits]

Symbol Table

    FLASH_IA=  000000     |     FLASH_NC=  00505C     |     FLASH_NF=  00505E 
    FLASH_NF=  000000     |     FLASH_NF=  000001     |     FLASH_NF=  000002 
    FLASH_NF=  000003     |     FLASH_NF=  000004     |     FLASH_NF=  000005 
    FLASH_PU=  005062     |     FLASH_PU=  000056     |     FLASH_PU=  0000AE 
    FLASH_SI=  020000     |     FLASH_WS=  00480D     |   6 FLOATQ     002E76 R
  6 FLOATQ0    002E80 R   |   6 FLOATQ1    002EE5 R   |   6 FLOATQ2    002EEE R
  6 FLOATQ3    002EF6 R   |   6 FLOATQ4    002F0A R   |   6 FLOAT_ER   002F1F R
  6 FLOAT_ER   002F1C R   |     FLSI    =  01F400     |   6 FMOVE      0020F6 R
  6 FMOVE2     002127 R   |   6 FNE        002B4D R   |   6 FOR        0014EC R
  6 FORGET     00015A R   |   6 FORGET1    000189 R   |   6 FORGET2    00020F R
  6 FORGET4    000218 R   |   6 FORGET6    0001D1 R   |   6 FOV        002B62 R
  6 FPSTOR     001ACA R   |   6 FPSW       002AFB R   |     FPTR    =  000034 
  6 FREEVAR    000225 R   |   6 FREEVAR4   00025B R   |   6 FRESET     002B0D R
  6 FSLASH     003112 R   |   6 FSLASH1    00313E R   |   6 FSLASH8    003195 R
  6 FSTAR      0030EB R   |   6 FTOD       0031D2 R   |   6 FTOD1      003202 R
  6 FTOD2      00321B R   |   6 FTOD3      003225 R   |   6 FTOD4      003230 R
  6 FTOD5      003238 R   |   6 FTOD6      003258 R   |   6 FTOD8      00325D R
  6 FTOD9      003268 R   |   6 FZE        002B38 R   |     GPIO_BAS=  005000 
    GPIO_CR1=  000003     |     GPIO_CR2=  000004     |     GPIO_DDR=  000002 
    GPIO_IDR=  000001     |     GPIO_ODR=  000000     |     GPIO_SIZ=  000005 
  6 GREAT      0008C9 R   |   6 GREAT1     0008DF R   |   6 HDOT       000F39 R
  6 HERE       000C14 R   |   6 HEX        000DCC R   |   6 HI         001A15 R
  6 HLD        0006BE R   |   6 HOLD       000D41 R   |     HSECNT  =  004809 
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
  6 ICOLON     0017BB R   |   6 IFETCH     00150A R   |   6 IFF        001552 R
  6 IFMOVE     0021CF R   |     IMEDD   =  000080     |   6 IMMED      0017CD R
  6 INCH       00042A R   |   6 INC_FPTR   001C44 R   |   6 INITOFS    001783 R
  6 INN        00066C R   |     INPUT_DI=  000000     |     INPUT_EI=  000001 
    INPUT_FL=  000000     |     INPUT_PU=  000001     |   6 INTE1      001376 R
  6 INTER      00134C R   |   6 INTQ       002378 R   |     INT_ADC2=  000016 
    INT_AUAR=  000012     |     INT_AWU =  000001     |     INT_CAN_=  000008 
    INT_CAN_=  000009     |     INT_CLK =  000002     |     INT_EXTI=  000003 
    INT_EXTI=  000004     |     INT_EXTI=  000005     |     INT_EXTI=  000006 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 184.
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
  6 INVER      0007C7 R   |     IPR0    =  000002     |     IPR1    =  000001 
    IPR2    =  000000     |     IPR3    =  000003     |     IPR_MASK=  000003 
    IRET_COD=  000080     |   6 ISEMI      001718 R   |     ITC_SPR1=  007F70 
    ITC_SPR2=  007F71     |     ITC_SPR3=  007F72     |     ITC_SPR4=  007F73 
    ITC_SPR5=  007F74     |     ITC_SPR6=  007F75     |     ITC_SPR7=  007F76 
    ITC_SPR8=  007F77     |     IWDG_KR =  0050E0     |     IWDG_PR =  0050E1 
    IWDG_RLR=  0050E2     |   6 JFETCH     001515 R   |   6 JSRC       00176D R
  6 KEY        000E35 R   |   6 KTAP       001266 R   |   6 KTAP1      001289 R
  6 KTAP2      00128C R   |   6 LAST       0006FD R   |   6 LASTN   =  0031CE R
  6 LBRAC      001383 R   |     LED2_BIT=  000005     |     LED2_MAS=  000020 
    LED2_POR=  00500A     |   6 LESS       00088B R   |     LF      =  00000A 
  6 LINK    =  0031CE R   |   6 LITER      0014BE R   |   6 LN2S       00229A R
  6 LOCK       001C30 R   |   6 LOG2S      002284 R   |   6 LSCALE     002F40 R
  6 LSHIFT     000AE9 R   |   6 LSHIFT1    000AF2 R   |   6 LSHIFT4    000AFA R
  6 LT1        0008A1 R   |     MASKK   =  001F7F     |   6 MAX        0008E9 R
  6 MAX1       0008FC R   |     MAX_MANT=  7FFFFF     |   6 MIN        000906 R
  6 MIN1       000919 R   |   6 MMOD1      0009A2 R   |   6 MMOD2      0009B6 R
  6 MMOD3      0009CD R   |   6 MMSM1      00095D R   |   6 MMSM3      000961 R
  6 MMSM4      00096D R   |   6 MMSMa      000968 R   |   6 MMSMb      000973 R
  6 MMSTA1     003019 R   |   6 MMSTA2     003024 R   |   6 MMSTA3     00302F R
  6 MMSTA4     00309A R   |   6 MMSTA5     0030AC R   |   6 MMSTA6     0030C5 R
  6 MMSTA7     0030E2 R   |   6 MMSTAR     00300E R   |   6 MODD       0009E7 R
  6 MONE       000B50 R   |     MS      =  000030     |   6 MSEC       0002D0 R
  6 MSMOD      000985 R   |   6 MSTA1      000A78 R   |   6 MSTAR      000A55 R
    NAFR    =  004804     |   6 NAMEQ      00120E R   |   6 NAMET      00111F R
    NCLKOPT =  004808     |   6 NDROT      0026AF R   |   6 NEGAT      0007D8 R
  6 NEX1       000490 R   |   6 NEXT       0014FB R   |     NFLASH_W=  00480E 
    NHSECNT =  00480A     |     NOPT1   =  004802     |     NOPT2   =  004804 
    NOPT3   =  004806     |     NOPT4   =  004808     |     NOPT5   =  00480A 
    NOPT6   =  00480C     |     NOPT7   =  00480E     |     NOPTBL  =  00487F 
  6 NROT       00076B R   |   6 NTIB       00067C R   |     NUBC    =  004802 
    NUCLEO  =  000001     |   6 NUFQ       000E4B R   |   6 NUFQ1      000E64 R
  6 NUMBQ      002421 R   |   6 NUMQ0      002462 R   |   6 NUMQ1      002484 R
  6 NUMQ3      0024AE R   |   6 NUMQ4      0024CF R   |   6 NUMQ8      0024D8 R
    NWDGOPT =  004806     |     NWDGOPT_=  FFFFFFFD     |     NWDGOPT_=  FFFFFFFC 
    NWDGOPT_=  FFFFFFFF     |     NWDGOPT_=  FFFFFFFE     |   6 NonHandl   000000 R
  6 OFFSET     000722 R   |     OFS     =  000005     |   6 ONE        000B42 R
  6 ONEM       000AD8 R   |   6 ONEP       000ACB R   |     OPT     =  000002 
    OPT0    =  004800     |     OPT1    =  004801     |     OPT2    =  004803 
    OPT3    =  004805     |     OPT4    =  004807     |     OPT5    =  004809 
    OPT6    =  00480B     |     OPT7    =  00480D     |     OPTBL   =  00487E 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 185.
Hexadecimal [24-Bits]

Symbol Table

    OPTIMIZE=  000001     |     OPTION_B=  004800     |     OPTION_E=  00487F 
    OPTION_S=  000080     |   6 ORIG       000049 R   |   6 ORR        0005F9 R
  6 OUTPUT     00043B R   |     OUTPUT_F=  000001     |     OUTPUT_O=  000000 
    OUTPUT_P=  000001     |     OUTPUT_S=  000000     |   6 OVER       0005B0 R
  6 OVERT      0016E6 R   |     PA      =  000000     |   6 PACKS      000CD4 R
  6 PAD        000C25 R   |   6 PAREN      00108E R   |   6 PARS       000F87 R
  6 PARS1      000FB2 R   |   6 PARS2      000FDD R   |   6 PARS3      000FE0 R
  6 PARS4      000FE9 R   |   6 PARS5      00100C R   |   6 PARS6      001021 R
  6 PARS7      001030 R   |   6 PARS8      00103F R   |   6 PARSE      001050 R
  6 PARSEXP_   002E59 R   |   6 PAUSE      0002E0 R   |     PA_BASE =  005000 
    PA_CR1  =  005003     |     PA_CR2  =  005004     |     PA_DDR  =  005002 
    PA_IDR  =  005001     |     PA_ODR  =  005000     |     PB      =  000005 
    PB_BASE =  005005     |     PB_CR1  =  005008     |     PB_CR2  =  005009 
    PB_DDR  =  005007     |     PB_IDR  =  005006     |     PB_ODR  =  005005 
    PC      =  00000A     |     PC_BASE =  00500A     |     PC_CR1  =  00500D 
    PC_CR2  =  00500E     |     PC_DDR  =  00500C     |     PC_IDR  =  00500B 
    PC_ODR  =  00500A     |     PD      =  00000F     |   6 PDUM1      0018FD R
  6 PDUM2      00190E R   |     PD_BASE =  00500F     |     PD_CR1  =  005012 
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
  6 PICK       000B90 R   |   6 PII        0021FD R   |     PI_BASE =  005028 
    PI_CR1  =  00502B     |     PI_CR2  =  00502C     |     PI_DDR  =  00502A 
    PI_IDR  =  005029     |     PI_ODR  =  005028     |   6 PLUS       0007AD R
  6 PNAM1      00168B R   |   6 POSMANT    002C3C R   |   6 PRESE      001402 R
    PROD1   =  000024     |     PROD2   =  000026     |     PROD3   =  000028 
  6 PROTECTE   000201 R   |   6 PSTOR      000BA7 R   |     PTR16   =  000035 
    PTR8    =  000036     |   6 PTRPLUS    001C5C R   |   6 QBRAN      000498 R
  6 QDUP       00073B R   |   6 QDUP1      000745 R   |   6 QKEY       000418 R
  6 QSTAC      0013BA R   |   6 QUERY      0012E6 R   |   6 QUEST      000F79 R
  6 QUIT       00141F R   |   6 QUIT1      001427 R   |   6 QUIT2      00142A R
  6 RAM2EE     002097 R   |     RAMBASE =  000000     |   6 RAMLAST    000710 R
    RAM_BASE=  000000     |     RAM_END =  0017FF     |     RAM_SIZE=  001800 
  6 RANDOM     00027E R   |   6 RAT        000545 R   |   6 RBRAC      00175A R
  6 REPEA      0015CF R   |   6 RFREE      00207E R   |   6 RFROM      000534 R
    ROP     =  004800     |   6 ROT        00074C R   |   6 ROW2BUF    002040 R
    ROWBUFF =  001680     |     RP0     =  00002E     |   6 RPAT       000511 R
    RPP     =  0017FF     |   6 RPSTO      00051E R   |   6 RSCALE     002F66 R
  6 RSHIFT     000B05 R   |   6 RSHIFT1    000B0E R   |   6 RSHIFT4    000B16 R
    RST_SR  =  0050B3     |   6 RT12_2     00226D R   |   6 SAME1      00113D R
  6 SAME2      001166 R   |   6 SAMEQ      001135 R   |   6 SCAL1      002F99 R
  6 SCAL2      002FC5 R   |   6 SCALETOM   002F93 R   |   6 SCOM1      0016C0 R
  6 SCOM2      0016C3 R   |   6 SCOMP      0016A2 R   |   6 SEED       000265 R
    SEEDX   =  000038     |     SEEDY   =  00003A     |   6 SEMIS      0016F6 R
  6 SETISP     0000D0 R   |   6 SET_RAML   00183D R   |   6 SFN        002BAE R
    SFR_BASE=  005000     |     SFR_END =  0057FF     |   6 SFV        002BE6 R
  6 SFZ        002B77 R   |   6 SIGN       000D80 R   |   6 SIGN1      000D90 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 186.
Hexadecimal [24-Bits]

Symbol Table

  6 SLASH      0009F1 R   |   6 SLMOD      0009D5 R   |   6 SNAME      001655 R
    SP0     =  00002C     |   6 SPACE      000E6D R   |   6 SPACS      000E7C R
  6 SPAT       000568 R   |     SPI_CR1 =  005200     |     SPI_CR2 =  005201 
    SPI_CRCP=  005205     |     SPI_DR  =  005204     |     SPI_ICR =  005202 
    SPI_RXCR=  005206     |     SPI_SR  =  005203     |     SPI_TXCR=  005207 
    SPP     =  001680     |     SPSAVE  =  000001     |   6 SPSTO      000575 R
  6 SQRT10     002256 R   |   6 SQRT2      002214 R   |   6 SQRT3      00222B R
  6 SSMOD      000A81 R   |     SSP     =  000001     |     STACK   =  0017FF 
  6 STAR       000A4A R   |   6 STASL      000A92 R   |   6 STEXP      002C47 R
  6 STEXP1     002C5D R   |   6 STEXP2     002C99 R   |   6 STEXP3     002CAC R
  6 STOD       00080F R   |   6 STORE      0004D1 R   |   6 STR        000DAE R
  6 STRCQ      0014CC R   |   6 STRQ       00160E R   |   6 STRQP      000ED8 R
  6 SUBB       000826 R   |   6 SWAPP      000598 R   |     SWIM_CSR=  007F80 
  6 TAP        001250 R   |   6 TBOOT      001A4C R   |   6 TBRAN      0004A6 R
  6 TBUF       00068C R   |     TBUFFBAS=  001680     |   6 TCHAR      000B61 R
  6 TEMP       00065D R   |   6 TEVAL      0006AF R   |   6 TFLASH     00069E R
  6 THENN      001567 R   |   6 TIB        000C36 R   |     TIBB    =  001700 
    TIBBASE =  001700     |     TIC     =  000027     |   6 TICK       001436 R
    TIM1_ARR=  005262     |     TIM1_ARR=  005263     |     TIM1_BKR=  00526D 
    TIM1_CCE=  00525C     |     TIM1_CCE=  00525D     |     TIM1_CCM=  005258 
    TIM1_CCM=  000000     |     TIM1_CCM=  000001     |     TIM1_CCM=  000004 
    TIM1_CCM=  000005     |     TIM1_CCM=  000006     |     TIM1_CCM=  000007 
    TIM1_CCM=  000002     |     TIM1_CCM=  000003     |     TIM1_CCM=  000007 
    TIM1_CCM=  000002     |     TIM1_CCM=  000004     |     TIM1_CCM=  000005 
    TIM1_CCM=  000006     |     TIM1_CCM=  000003     |     TIM1_CCM=  005259 
    TIM1_CCM=  000000     |     TIM1_CCM=  000001     |     TIM1_CCM=  000004 
    TIM1_CCM=  000005     |     TIM1_CCM=  000006     |     TIM1_CCM=  000007 
    TIM1_CCM=  000002     |     TIM1_CCM=  000003     |     TIM1_CCM=  000007 
    TIM1_CCM=  000002     |     TIM1_CCM=  000004     |     TIM1_CCM=  000005 
    TIM1_CCM=  000006     |     TIM1_CCM=  000003     |     TIM1_CCM=  00525A 
    TIM1_CCM=  000000     |     TIM1_CCM=  000001     |     TIM1_CCM=  000004 
    TIM1_CCM=  000005     |     TIM1_CCM=  000006     |     TIM1_CCM=  000007 
    TIM1_CCM=  000002     |     TIM1_CCM=  000003     |     TIM1_CCM=  000007 
    TIM1_CCM=  000002     |     TIM1_CCM=  000004     |     TIM1_CCM=  000005 
    TIM1_CCM=  000006     |     TIM1_CCM=  000003     |     TIM1_CCM=  00525B 
    TIM1_CCM=  000000     |     TIM1_CCM=  000001     |     TIM1_CCM=  000004 
    TIM1_CCM=  000005     |     TIM1_CCM=  000006     |     TIM1_CCM=  000007 
    TIM1_CCM=  000002     |     TIM1_CCM=  000003     |     TIM1_CCM=  000007 
    TIM1_CCM=  000002     |     TIM1_CCM=  000004     |     TIM1_CCM=  000005 
    TIM1_CCM=  000006     |     TIM1_CCM=  000003     |     TIM1_CCR=  005265 
    TIM1_CCR=  005266     |     TIM1_CCR=  005267     |     TIM1_CCR=  005268 
    TIM1_CCR=  005269     |     TIM1_CCR=  00526A     |     TIM1_CCR=  00526B 
    TIM1_CCR=  00526C     |     TIM1_CNT=  00525E     |     TIM1_CNT=  00525F 
    TIM1_CR1=  005250     |     TIM1_CR2=  005251     |     TIM1_CR2=  000000 
    TIM1_CR2=  000002     |     TIM1_CR2=  000004     |     TIM1_CR2=  000005 
    TIM1_CR2=  000006     |     TIM1_DTR=  00526E     |     TIM1_EGR=  005257 
    TIM1_EGR=  000007     |     TIM1_EGR=  000001     |     TIM1_EGR=  000002 
    TIM1_EGR=  000003     |     TIM1_EGR=  000004     |     TIM1_EGR=  000005 
    TIM1_EGR=  000006     |     TIM1_EGR=  000000     |     TIM1_ETR=  005253 
    TIM1_ETR=  000006     |     TIM1_ETR=  000000     |     TIM1_ETR=  000001 
    TIM1_ETR=  000002     |     TIM1_ETR=  000003     |     TIM1_ETR=  000007 
    TIM1_ETR=  000004     |     TIM1_ETR=  000005     |     TIM1_IER=  005254 
    TIM1_IER=  000007     |     TIM1_IER=  000001     |     TIM1_IER=  000002 
    TIM1_IER=  000003     |     TIM1_IER=  000004     |     TIM1_IER=  000005 
    TIM1_IER=  000006     |     TIM1_IER=  000000     |     TIM1_OIS=  00526F 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 187.
Hexadecimal [24-Bits]

Symbol Table

    TIM1_PSC=  005260     |     TIM1_PSC=  005261     |     TIM1_RCR=  005264 
    TIM1_SMC=  005252     |     TIM1_SMC=  000007     |     TIM1_SMC=  000000 
    TIM1_SMC=  000001     |     TIM1_SMC=  000002     |     TIM1_SMC=  000004 
    TIM1_SMC=  000005     |     TIM1_SMC=  000006     |     TIM1_SR1=  005255 
    TIM1_SR1=  000007     |     TIM1_SR1=  000001     |     TIM1_SR1=  000002 
    TIM1_SR1=  000003     |     TIM1_SR1=  000004     |     TIM1_SR1=  000005 
    TIM1_SR1=  000006     |     TIM1_SR1=  000000     |     TIM1_SR2=  005256 
    TIM1_SR2=  000001     |     TIM1_SR2=  000002     |     TIM1_SR2=  000003 
    TIM1_SR2=  000004     |     TIM2_ARR=  00530D     |     TIM2_ARR=  00530E 
    TIM2_CCE=  005308     |     TIM2_CCE=  000000     |     TIM2_CCE=  000001 
    TIM2_CCE=  000004     |     TIM2_CCE=  000005     |     TIM2_CCE=  005309 
    TIM2_CCM=  005305     |     TIM2_CCM=  005306     |     TIM2_CCM=  005307 
    TIM2_CCM=  000000     |     TIM2_CCM=  000004     |     TIM2_CCM=  000003 
    TIM2_CCR=  00530F     |     TIM2_CCR=  005310     |     TIM2_CCR=  005311 
    TIM2_CCR=  005312     |     TIM2_CCR=  005313     |     TIM2_CCR=  005314 
    TIM2_CNT=  00530A     |     TIM2_CNT=  00530B     |     TIM2_CR1=  005300 
    TIM2_CR1=  000007     |     TIM2_CR1=  000000     |     TIM2_CR1=  000003 
    TIM2_CR1=  000001     |     TIM2_CR1=  000002     |     TIM2_EGR=  005304 
    TIM2_EGR=  000001     |     TIM2_EGR=  000002     |     TIM2_EGR=  000003 
    TIM2_EGR=  000006     |     TIM2_EGR=  000000     |     TIM2_IER=  005301 
    TIM2_PSC=  00530C     |     TIM2_SR1=  005302     |     TIM2_SR2=  005303 
    TIM3_ARR=  00532B     |     TIM3_ARR=  00532C     |     TIM3_CCE=  005327 
    TIM3_CCE=  000000     |     TIM3_CCE=  000001     |     TIM3_CCE=  000004 
    TIM3_CCE=  000005     |     TIM3_CCE=  000000     |     TIM3_CCE=  000001 
    TIM3_CCM=  005325     |     TIM3_CCM=  005326     |     TIM3_CCM=  000000 
    TIM3_CCM=  000004     |     TIM3_CCM=  000003     |     TIM3_CCR=  00532D 
    TIM3_CCR=  00532E     |     TIM3_CCR=  00532F     |     TIM3_CCR=  005330 
    TIM3_CNT=  005328     |     TIM3_CNT=  005329     |     TIM3_CR1=  005320 
    TIM3_CR1=  000007     |     TIM3_CR1=  000000     |     TIM3_CR1=  000003 
    TIM3_CR1=  000001     |     TIM3_CR1=  000002     |     TIM3_EGR=  005324 
    TIM3_IER=  005321     |     TIM3_PSC=  00532A     |     TIM3_SR1=  005322 
    TIM3_SR2=  005323     |     TIM4_ARR=  005346     |     TIM4_CNT=  005344 
    TIM4_CR1=  005340     |     TIM4_CR1=  000007     |     TIM4_CR1=  000000 
    TIM4_CR1=  000003     |     TIM4_CR1=  000001     |     TIM4_CR1=  000002 
    TIM4_EGR=  005343     |     TIM4_EGR=  000000     |     TIM4_IER=  005341 
    TIM4_IER=  000000     |     TIM4_PSC=  005345     |     TIM4_PSC=  000000 
    TIM4_PSC=  000007     |     TIM4_PSC=  000004     |     TIM4_PSC=  000001 
    TIM4_PSC=  000005     |     TIM4_PSC=  000002     |     TIM4_PSC=  000006 
    TIM4_PSC=  000003     |     TIM4_PSC=  000000     |     TIM4_PSC=  000001 
    TIM4_PSC=  000002     |     TIM4_SR =  005342     |     TIM4_SR_=  000000 
  6 TIMEOUTQ   000310 R   |   6 TIMER      0002FA R   |     TIM_CR1_=  000007 
    TIM_CR1_=  000000     |     TIM_CR1_=  000006     |     TIM_CR1_=  000005 
    TIM_CR1_=  000004     |     TIM_CR1_=  000003     |     TIM_CR1_=  000001 
    TIM_CR1_=  000002     |   6 TNAM2      001993 R   |   6 TNAM3      0019B1 R
  6 TNAM4      0019B7 R   |   6 TNAME      001990 R   |   6 TOFLASH    000335 R
  6 TOKEN      001111 R   |   6 TOR        000551 R   |   6 TORAM      000375 R
    TRUEE   =  00FFFF     |   6 TWOSL      000B1D R   |   6 TYPE1      000E9C R
  6 TYPE2      000EA2 R   |   6 TYPES      000E97 R   |   6 Timer4Ha   000005 R
    UART1   =  000000     |     UART1_BA=  005230     |     UART1_BR=  005232 
    UART1_BR=  005233     |     UART1_CR=  005234     |     UART1_CR=  005235 
    UART1_CR=  005236     |     UART1_CR=  005237     |     UART1_CR=  005238 
    UART1_DR=  005231     |     UART1_GT=  005239     |     UART1_PO=  000000 
    UART1_PS=  00523A     |     UART1_RX=  000004     |     UART1_SR=  005230 
    UART1_TX=  000005     |     UART3   =  000001     |     UART3_BA=  005240 
    UART3_BR=  005242     |     UART3_BR=  005243     |     UART3_CR=  005244 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 188.
Hexadecimal [24-Bits]

Symbol Table

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
    UD4     =  000004     |   6 UDIV10     002FC6 R   |   6 UDOT       000F25 R
  6 UDOTR      000F05 R   |   6 UEND       000047 R   |     UFPSW   =  000008 
  6 UGREAT     0008AA R   |   6 UGREAT1    0008C1 R   |     UHLD    =  000014 
    UINN    =  00000C     |     UINTER  =  000012     |     ULAST   =  00001C 
  6 ULES1      000883 R   |   6 ULESS      00086D R   |   6 UMMOD      000941 R
  6 UMSTA      000A00 R   |   6 UNIQ1      00164C R   |   6 UNIQU      00162D R
  6 UNLKEE     001BCA R   |   6 UNLKFL     001BE9 R   |   6 UNLOCK     001C08 R
  6 UNTIL      00152F R   |     UOFFSET =  00001E     |   6 UPDATCP    001B87 R
  6 UPDATLAS   001B5E R   |   6 UPDATPTR   00218A R   |   6 UPDATRUN   001B76 R
  6 UPDATVP    001B9E R   |   6 UPL1       00063A R   |   6 UPLUS      000623 R
    UPP     =  000006     |   6 UPPER      0010D4 R   |   6 UPPER1     0010F7 R
  6 UPPER2     001100 R   |     URLAST  =  000022     |     USR_BTN_=  000004 
    USR_BTN_=  000010     |     USR_BTN_=  005015     |     UTFLASH =  000020 
    UTIB    =  000010     |     UTMP    =  00000A     |   6 UTYP1      0018CD R
  6 UTYP2      0018DC R   |   6 UTYPE      0018C8 R   |     UVP     =  000018 
  6 UZERO      00002B R   |   6 VARIA      00180A R   |     VAR_BASE=  000080 
    VAR_TOP =  0017BF     |     VER     =  000004     |   6 VPP        0006DF R
    VSIZE   =  000006     |     WANT_CON=  000001     |     WANT_DEB=  000000 
    WANT_DOU=  000001     |     WANT_FLO=  000001     |     WANT_SCA=  000001 
    WANT_SEE=  000000     |     WDGOPT  =  004805     |     WDGOPT_I=  000002 
    WDGOPT_L=  000003     |     WDGOPT_W=  000000     |     WDGOPT_W=  000001 
  6 WHILE      0015B5 R   |   6 WITHI      000926 R   |   6 WORDD      0010BA R
  6 WORDS      0019ED R   |   6 WORS1      0019F3 R   |   6 WORS2      001A0F R
  6 WR_BYTE    001CB3 R   |   6 WR_WORD    001CD8 R   |   6 WTABLE     0022E2 R
  6 WTAT       002306 R   |   6 WTINIT     00234B R   |     WWDG_CR =  0050D1 
    WWDG_WR =  0050D2     |     XMEM_SIZ=  017830     |     XOFF    =  000013 
    XON     =  000011     |   6 XORR       00060E R   |     XTEMP   =  000024 
    YTEMP   =  000026     |   6 ZEQ1       0024F8 R   |   6 ZEQU1      0005DB R
  6 ZEQUAL     0005D1 R   |   6 ZERO       000B37 R   |   6 ZL1        0005C8 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 189.
Hexadecimal [24-Bits]

Symbol Table

  6 ZLESS      0005BF R   |   6 app_spac   003280 R   |   6 baudrate   00037B R
  6 block_er   001D9E R   |   6 clear_ra   000019 R   |   6 clock_in   000064 R
  6 copy_buf   001DFE R   |   6 copy_buf   001E1D R   |   6 copy_pro   001E1D R
    da      =  000002     |     db      =  000003     |     dc      =  000000 
    dd      =  000001     |   6 do2lit     002879 R   |   6 erase_fl   001DC0 R
  6 fmove_do   002173 R   |   6 main       000016 R   |   6 next_row   002130 R
  6 no_move    00217A R   |   6 nsign      002396 R   |   6 nsign1     0023C7 R
  6 parse_di   0023CE R   |   6 parse_ex   002E0E R   |   6 pristine   001E9E R
  6 proceed_   001DC3 R   |   6 reboot     000327 R   |   6 reset_ve   001F05 R
  6 row_eras   001D7E R   |   6 row_eras   001DD7 R   |   6 row_eras   001DFE R
  6 set_opti   001E72 R   |   6 set_vect   001FA6 R   |   6 uart_ini   000076 R
  6 write_ro   001E42 R

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 190.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 DATA       size      0   flags    8
   2 DATA0      size      0   flags    8
   3 SSEG       size      0   flags    8
   4 SSEG1      size    100   flags    8
   5 HOME       size     80   flags    0
   6 CODE       size   3280   flags    0

