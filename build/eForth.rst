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
      0080BB B5 E7                  316         .word      LASTN  ;CNTXT pointer
      0080BD 00 80                  317         .word      VAR_BASE   ;variables free space pointer 
      0080BF B6 80                  318         .word      app_space ; FLASH free space pointer 
      0080C1 B5 E7                  319         .word      LASTN   ;LAST
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
      00812D CC 9B BE         [ 2]  391         jp  COLD   ;default=MN1
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
      0081CE CC 9E BA         [ 2]  479         jp EESTORE 
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
      0081F6 B6 80                  499         .word app_space 
      0081F8 CD 86 B1         [ 4]  500         call SWAPP 
      0081FB CD 89 97         [ 4]  501         call  ULESS 
      0081FE CD 85 18         [ 4]  502         call QBRAN 
      008201 82 51                  503         .word FORGET6 
                                    504 ; ( ca na -- )        
                                    505 ;reset ivec with address >= ca
      008203 CD 86 B1         [ 4]  506         call SWAPP ; ( na ca -- ) 
      008206 CD A0 BD         [ 4]  507         call CHKIVEC ; ( na -- ) 
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
      00824B CD 9C ED         [ 4]  535         call UPDATCP 
      00824E CC 9C C4         [ 2]  536         jp UPDATLAST 
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
      0082D8 CC 9D 04         [ 2]  584         jp UPDATVP 
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
      0094A0 CD A5 E8         [ 4] 3341 INTE1:  CALL     NUMBQ   ;convert a number
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
      00957A CC 9D 04         [ 2] 3454         jp UPDATVP 
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
      0097E2 CD A5 E8         [ 4] 3798 SCOM2:  CALL     NUMBQ   ;try to convert to number
      0097E5 CD 88 54         [ 4] 3799         CALL    QDUP  
      0097E8 CD 85 18         [ 4] 3800         CALL     QBRAN
      0097EB 94 4C                 3801         .word      ABOR1
      00176D                       3802         _DOLIT  -1
      0097ED CD 84 EF         [ 4]    1     CALL DOLIT 
      0097F0 FF FF                    2     .word -1 
      0097F2 CD 89 78         [ 4] 3803         CALL    EQUAL
      001775                       3804         _QBRAN DLITER  
      0097F5 CD 85 18         [ 4]    1     CALL QBRAN
      0097F8 A9 BE                    2     .word DLITER
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
      009823 CD A2 5C         [ 4] 3832         CALL FMOVE
      009826 CD 88 54         [ 4] 3833         call QDUP 
      009829 CD 85 18         [ 4] 3834         call QBRAN 
      00982C 99 5C                 3835         .word SET_RAMLAST 
      00982E CD A2 F0         [ 4] 3836         CALL UPDATPTR
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
      009845 CD A3 35         [ 4] 3850         call IFMOVE
      009848 CD 88 54         [ 4] 3851         call QDUP 
      00984B CD 85 18         [ 4] 3852         CALL QBRAN 
      00984E 99 5C                 3853         .word SET_RAMLAST
      009850 CD 88 06         [ 4] 3854         CALL CPP
      009853 CD 85 63         [ 4] 3855         call AT 
      009856 CD 86 B1         [ 4] 3856         call SWAPP 
      009859 CD 88 06         [ 4] 3857         CALL CPP 
      00985C CD 85 51         [ 4] 3858         call STORE 
      00985F CD 9C ED         [ 4] 3859         call UPDATCP 
      009862 CD 9C AA         [ 4] 3860         call EEPVP 
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
      00994A CD A2 5C         [ 4] 3981         CALL FMOVE ; move definition to FLASH
      00994D CD 88 54         [ 4] 3982         CALL QDUP 
      009950 CD 85 18         [ 4] 3983         CALL QBRAN 
      009953 99 5C                 3984         .word SET_RAMLAST   
      009955 CD 9D 04         [ 4] 3985         call UPDATVP  ; don't update if variable kept in RAM.
      009958 CD A2 F0         [ 4] 3986         CALL UPDATPTR
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
      009984 CD A2 5C         [ 4] 4006         CALL FMOVE
      009987 CD 88 54         [ 4] 4007         CALL QDUP 
      00998A CD 85 18         [ 4] 4008         CALL QBRAN 
      00998D 99 5C                 4009         .word SET_RAMLAST  
      00998F CD A2 F0         [ 4] 4010         CALL UPDATPTR  
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
      0099BC CD A2 5C         [ 4] 4037         CALL FMOVE
      0099BF CD 88 54         [ 4] 4038         CALL QDUP 
      0099C2 CD 85 18         [ 4] 4039         CALL QBRAN 
      0099C5 99 5C                 4040         .word SET_RAMLAST  
      0099C7 CD A2 F0         [ 4] 4041         CALL UPDATPTR  
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
                                   4249 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4250 ;  PRT_LICENCE 
                                   4251 ;  print GPLV2 licence 
                                   4252 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      009B2F                       4253 PRT_LICENCE:
      009B2F CD 90 06         [ 4] 4254         CALL DOTQP 
      009B32 0F                    4255         .byte  15 
      009B33 4C 49 43 45 4E 43 45  4256         .ascii "LICENCE GPLV3\r\n"
             20 47 50 4C 56 33 0D
             0A
      009B42 81               [ 4] 4257         RET 
                                   4258         
                                   4259 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4260 ;    PRINT_VERSION ( c1 c2 -- )
                                   4261 ;    c2 minor 
                                   4262 ;    c1 major 
                                   4263 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      009B43                       4264 PRINT_VERSION:
      009B43 CD 90 06         [ 4] 4265      CALL DOTQP 
      009B46 09                    4266      .byte 9
      009B47 20 76 65 72 73 69 6F  4267      .ascii " version "
             6E 20
      009B50 CD 8E 5B         [ 4] 4268      CALL BDIGS 
      009B53 CD 8E 95         [ 4] 4269      CALL DIGS 
      009B56 CD 8E 95         [ 4] 4270      CALL DIGS 
      001AD9                       4271      _DOLIT '.' 
      009B59 CD 84 EF         [ 4]    1     CALL DOLIT 
      009B5C 00 2E                    2     .word '.' 
      009B5E CD 8E 6B         [ 4] 4272      CALL HOLD 
      009B61 CD 86 97         [ 4] 4273      CALL DROP 
      009B64 CD 8E 95         [ 4] 4274      CALL DIGS 
      009B67 CD 8E C0         [ 4] 4275      CALL EDIGS 
      009B6A CD 8F C1         [ 4] 4276      CALL TYPES 
      009B6D 81               [ 4] 4277      RET 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



                                   4278 
                                   4279 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4280 ;       hi      ( -- )
                                   4281 ;       Display sign-on message.
                                   4282 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001AEE                       4283         _HEADER HI,2,"HI"
      009B6E 9B 06                    1         .word LINK 
                           001AF0     2         LINK=.
      009B70 02                       3         .byte 2  
      009B71 48 49                    4         .ascii "HI"
      009B73                          5         HI:
      009B73 CD 8F D9         [ 4] 4284         CALL     CR
      009B76 CD 90 06         [ 4] 4285         CALL     DOTQP   
      009B79 0A                    4286         .byte      10
      009B7A 73 74 6D 38 65 46 6F  4287         .ascii     "stm8eForth"
             72 74 68
      001B04                       4288 	_DOLIT VER 
      009B84 CD 84 EF         [ 4]    1     CALL DOLIT 
      009B87 00 04                    2     .word VER 
      001B09                       4289         _DOLIT EXT 
      009B89 CD 84 EF         [ 4]    1     CALL DOLIT 
      009B8C 00 00                    2     .word EXT 
      009B8E CD 9B 43         [ 4] 4290         CALL PRINT_VERSION 
      009B91 CD 90 06         [ 4] 4291         CALL    DOTQP
                           000001  4292 .if NUCLEO          
      009B94 12                    4293         .byte 18
      009B95 20 6F 6E 20 4E 55 43  4294         .ascii  " on NUCLEO-8S208RB"
             4C 45 4F 2D 38 53 32
             30 38 52 42
                                   4295 .endif
                           000000  4296 .if DISCOVERY
                                   4297         .byte 19
                                   4298         .ascii  " on STM8S-DISCOVERY"
                                   4299 .endif
                           000000  4300 .if DOORBELL
                                   4301         .byte 16
                                   4302         .ascii " on stm8s105k6b6"
                                   4303 .endif
      009BA7 CC 8F D9         [ 2] 4304         JP     CR
                                   4305 
                           000000  4306 WANT_DEBUG=0
                           000000  4307 .if WANT_DEBUG 
                                   4308 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4309 ;       DEBUG      ( -- )
                                   4310 ;       Display sign-on message.
                                   4311 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4312         _HEADER DEBUG,5,"DEBUG"
                                   4313 	CALL DOLIT
                                   4314 	.word 0x65
                                   4315 	CALL EMIT
                                   4316 	CALL ZERO
                                   4317  	CALL ZLESS 
                                   4318 	CALL DOLIT
                                   4319 	.word 0xFFFE
                                   4320 	CALL ZLESS 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



                                   4321 	CALL UPLUS 
                                   4322  	CALL DROP 
                                   4323 	CALL DOLIT
                                   4324 	.word 3
                                   4325 	CALL UPLUS 
                                   4326 	CALL UPLUS 
                                   4327  	CALL DROP
                                   4328 	CALL DOLIT
                                   4329 	.word 0x43
                                   4330 	CALL UPLUS 
                                   4331  	CALL DROP
                                   4332 	CALL EMIT
                                   4333 	CALL DOLIT
                                   4334 	.word 0x4F
                                   4335 	CALL DOLIT
                                   4336 	.word 0x6F
                                   4337  	CALL XORR
                                   4338 	CALL DOLIT
                                   4339 	.word 0xF0
                                   4340  	CALL ANDD
                                   4341 	CALL DOLIT
                                   4342 	.word 0x4F
                                   4343  	CALL ORR
                                   4344 	CALL EMIT
                                   4345 	CALL DOLIT
                                   4346 	.word 8
                                   4347 	CALL DOLIT
                                   4348 	.word 6
                                   4349  	CALL SWAPP
                                   4350 	CALL OVER
                                   4351 	CALL XORR
                                   4352 	CALL DOLIT
                                   4353 	.word 3
                                   4354 	CALL ANDD 
                                   4355 	CALL ANDD
                                   4356 	CALL DOLIT
                                   4357 	.word 0x70
                                   4358 	CALL UPLUS 
                                   4359 	CALL DROP
                                   4360 	CALL EMIT
                                   4361 	CALL ZERO
                                   4362 	CALL QBRAN
                                   4363 	.word DEBUG1
                                   4364 	CALL DOLIT
                                   4365 	.word 0x3F
                                   4366 DEBUG1:
                                   4367 	CALL DOLIT
                                   4368 	.word 0xFFFF
                                   4369 	CALL QBRAN
                                   4370 	.word DEBUG2
                                   4371 	CALL DOLIT
                                   4372 	.word 0x74
                                   4373 	CALL BRAN
                                   4374 	.word DEBUG3
                                   4375 DEBUG2:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



                                   4376 	CALL DOLIT
                                   4377 	.word 0x21
                                   4378 DEBUG3:
                                   4379 	CALL EMIT
                                   4380 	CALL DOLIT
                                   4381 	.word 0x68
                                   4382 	CALL DOLIT
                                   4383 	.word 0x80
                                   4384 	CALL STORE
                                   4385 	CALL DOLIT
                                   4386 	.word 0x80
                                   4387 	CALL AT
                                   4388 	CALL EMIT
                                   4389 	CALL DOLIT
                                   4390 	.word 0x4D
                                   4391 	CALL TOR
                                   4392 	CALL RAT
                                   4393 	CALL RFROM
                                   4394 	CALL ANDD
                                   4395 	CALL EMIT
                                   4396 	CALL DOLIT
                                   4397 	.word 0x61
                                   4398 	CALL DOLIT
                                   4399 	.word 0xA
                                   4400 	CALL TOR
                                   4401 DEBUG4:
                                   4402 	CALL ONE
                                   4403 	CALL UPLUS 
                                   4404 	CALL DROP
                                   4405 	CALL DONXT
                                   4406 	.word DEBUG4
                                   4407 	CALL EMIT
                                   4408 	CALL DOLIT
                                   4409 	.word 0x656D
                                   4410 	CALL DOLIT
                                   4411 	.word 0x100
                                   4412 	CALL UMSTA
                                   4413 	CALL SWAPP
                                   4414 	CALL DOLIT
                                   4415 	.word 0x100
                                   4416 	CALL UMSTA
                                   4417 	CALL SWAPP 
                                   4418 	CALL DROP
                                   4419 	CALL EMIT
                                   4420 	CALL EMIT
                                   4421 	CALL DOLIT
                                   4422 	.word 0x2043
                                   4423 	CALL ZERO
                                   4424 	CALL DOLIT
                                   4425 	.word 0x100
                                   4426 	CALL UMMOD
                                   4427 	CALL EMIT
                                   4428 	CALL EMIT
                                   4429 	;JP ORIG
                                   4430 	RET
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



                                   4431 .endif ; WANT_DEBUG 
                                   4432 
                                   4433 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4434 ;       'BOOT   ( -- a )
                                   4435 ;       The application startup vector.
                                   4436 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001B2A                       4437         _HEADER TBOOT,5,"'BOOT"
      009BAA 9B 70                    1         .word LINK 
                           001B2C     2         LINK=.
      009BAC 05                       3         .byte 5  
      009BAD 27 42 4F 4F 54           4         .ascii "'BOOT"
      009BB2                          5         TBOOT:
      009BB2 CD 87 57         [ 4] 4438         CALL     DOVAR
      009BB5 40 02                 4439         .word    APP_RUN      ;application to boot
                                   4440 
                                   4441 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4442 ;       COLD    ( -- )
                                   4443 ;       The hilevel cold start s=ence.
                                   4444 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001B37                       4445         _HEADER COLD,4,"COLD"
      009BB7 9B AC                    1         .word LINK 
                           001B39     2         LINK=.
      009BB9 04                       3         .byte 4  
      009BBA 43 4F 4C 44              4         .ascii "COLD"
      009BBE                          5         COLD:
                           000000  4446 .if WANT_DEBUG
                                   4447         CALL DEBUG
                                   4448 .endif ; WANT_DEBUG
      009BBE CD 84 EF         [ 4] 4449 COLD1:  CALL     DOLIT
      009BC1 80 AB                 4450         .word      UZERO
      009BC3 CD 84 EF         [ 4] 4451 	CALL     DOLIT
      009BC6 00 06                 4452         .word      UPP
      009BC8 CD 84 EF         [ 4] 4453         CALL     DOLIT
      009BCB 00 1C                 4454 	.word      UEND-UZERO
      009BCD CD 8D 8B         [ 4] 4455         CALL     CMOVE   ;initialize user area
                           000001  4456 .if WANT_FLOAT 
      009BD0 CD AC C5         [ 4] 4457         CALL    FINIT 
                                   4458 .endif 
                                   4459 ; if APP_RUN==0 initialize with ca de 'hi'  
      009BD3 90 CE 40 02      [ 2] 4460         ldw y,APP_RUN 
      009BD7 26 0B            [ 1] 4461         jrne 0$
      009BD9 1D 00 02         [ 2] 4462         subw x,#CELLL 
      009BDC 90 AE 9B 73      [ 2] 4463         ldw y,#HI  
      009BE0 FF               [ 2] 4464         ldw (x),y
      009BE1 CD 9C DC         [ 4] 4465         call UPDATRUN 
      009BE4                       4466 0$:        
                                   4467 ; update LAST with APP_LAST 
                                   4468 ; if APP_LAST > LAST else do the opposite
      009BE4 90 CE 40 00      [ 2] 4469         ldw y,APP_LAST 
      009BE8 90 B3 1C         [ 2] 4470         cpw y,ULAST 
      009BEB 22 05            [ 1] 4471         jrugt 1$ 
                                   4472 ; save LAST at APP_LAST  
      009BED CD 9C C4         [ 4] 4473         call UPDATLAST 
      009BF0 20 06            [ 2] 4474         jra 2$
      009BF2                       4475 1$: ; update LAST with APP_LAST 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



      009BF2 90 BF 1C         [ 2] 4476         ldw ULAST,y
      009BF5 90 BF 16         [ 2] 4477         ldw UCNTXT,y
      009BF8                       4478 2$:  
                                   4479 ; update APP_CP if < app_space 
      009BF8 90 CE 40 04      [ 2] 4480         ldw y,APP_CP  
      009BFC 90 B3 1A         [ 2] 4481         cpw y,UCP   
      009BFF 24 06            [ 1] 4482         jruge 3$ 
      009C01 CD 9C ED         [ 4] 4483         call UPDATCP
      009C04 90 BE 1A         [ 2] 4484         ldw y,UCP   
      009C07                       4485 3$:
      009C07 90 BF 1A         [ 2] 4486         ldw UCP,y                 
                                   4487 ; update UVP with APP_VP  
                                   4488 ; if APP_VP>UVP else do the opposite 
      009C0A 90 CE 40 06      [ 2] 4489         ldw y,APP_VP 
      009C0E 90 B3 18         [ 2] 4490         cpw y,UVP 
      009C11 22 05            [ 1] 4491         jrugt 4$
      009C13 CD 9D 04         [ 4] 4492         call UPDATVP 
      009C16 20 03            [ 2] 4493         jra 6$
      009C18                       4494 4$: ; update UVP with APP_VP 
      009C18 90 BF 18         [ 2] 4495         ldw UVP,y 
      009C1B                       4496 6$:      
      009C1B CD 95 2C         [ 4] 4497         CALL     PRESE   ;initialize data stack and TIB
      009C1E CD 9B B2         [ 4] 4498         CALL     TBOOT
      009C21 CD 8D 74         [ 4] 4499         CALL     ATEXE   ;application boot
      009C24 CD 98 05         [ 4] 4500         CALL     OVERT
      009C27 CC 95 49         [ 2] 4501         JP     QUIT    ;start interpretation
                                   4502 
                                   4503 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



                                   4504         .include "flash.asm"
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
      009C2A 9B B9                   31     .word LINK 
                           001BAC    32     LINK=.
      009C2C 03                      33     .byte 3 
      009C2D 46 50 21                34     .ascii "FP!"
      009C30                         35 FPSTOR:
      009C30 90 93            [ 1]   36     ldw y,x
      009C32 90 FE            [ 2]   37     ldw y,(y)
      009C34 90 9F            [ 1]   38     ld a,yl 
      009C36 B7 34            [ 1]   39     ld FPTR,a 
      009C38 1C 00 02         [ 2]   40     addw x,#CELLL 
      009C3B 90 93            [ 1]   41     ldw y,x 
      009C3D 90 FE            [ 2]   42     ldw y,(y)
      009C3F 90 BF 35         [ 2]   43     ldw PTR16,y
      009C42 1C 00 02         [ 2]   44     addw x,#CELLL 
      009C45 81               [ 4]   45     ret 
                                     46 
                                     47 ;-----------------------------------
                                     48 ; return EEPROM base address 
                                     49 ; as a double 
                                     50 ;  EEPROM  ( -- ud )
                                     51 ;-----------------------------------
      009C46 9C 2C                   52     .word LINK 
                           001BC8    53 LINK=.
      009C48 06                      54     .byte 6 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



      009C49 45 45 50 52 4F 4D       55     .ascii "EEPROM"
      009C4F                         56 EEPROM: 
      009C4F 90 AE 40 00      [ 2]   57     ldw y,#EEPROM_BASE
      009C53 1D 00 04         [ 2]   58     subw x,#2*CELLL 
      009C56 EF 02            [ 2]   59     ldw (2,x),y 
      009C58 90 5F            [ 1]   60     clrw y 
      009C5A FF               [ 2]   61     ldw (x),y 
      009C5B 81               [ 4]   62     ret
                                     63 
                                     64 ;---------------------------------
                                     65 ; return APP_LAST pointer as double
                                     66 ; EEP-LAST ( -- ud )
                                     67 ;---------------------------------
      009C5C 9C 48                   68 	.word LINK 
                           001BDE    69 	LINK=.
      009C5E 08                      70 	.byte 8 
      009C5F 45 45 50 2D 4C 41 53    71 	.ascii "EEP-LAST"
             54
      009C67                         72 EEPLAST:
      009C67 1D 00 04         [ 2]   73 	subw x,#2*CELLL 
      009C6A 90 AE 40 00      [ 2]   74 	ldw y,#APP_LAST 
      009C6E EF 02            [ 2]   75 	ldw (2,x),y 
      009C70 90 5F            [ 1]   76 	clrw y 
      009C72 FF               [ 2]   77 	ldw (x),y 
      009C73 81               [ 4]   78 	ret 
                                     79 
                                     80 ;----------------------------------
                                     81 ; return APP_RUN pointer as double	
                                     82 ; EEP-RUN ( -- ud )
                                     83 ;-----------------------------------
      009C74 9C 5E                   84 	.word LINK 
                           001BF6    85 	LINK=.
      009C76 07                      86 	.byte 7
      009C77 45 45 50 2D 52 55 4E    87 	.ascii "EEP-RUN"
      009C7E                         88 EEPRUN:
      009C7E 1D 00 04         [ 2]   89 	subw x,#2*CELLL 
      009C81 90 AE 40 02      [ 2]   90 	ldw y,#APP_RUN 
      009C85 EF 02            [ 2]   91 	ldw (2,x),y 
      009C87 90 5F            [ 1]   92 	clrw y 
      009C89 FF               [ 2]   93 	ldw (x),y 
      009C8A 81               [ 4]   94 	ret 
                                     95 
                                     96 ;------------------------------------
                                     97 ; return APP_CP pointer as double 
                                     98 ; EEP-CP ( -- ud )
                                     99 ;------------------------------------
      009C8B 9C 76                  100 	.word LINK
                           001C0D   101 	LINK=.
      009C8D 06                     102 	.byte 6 
      009C8E 45 45 50 2D 43 50      103 	.ascii "EEP-CP"
      009C94                        104 EEPCP:
      009C94 1D 00 04         [ 2]  105 	subw x,#2*CELLL 
      009C97 90 AE 40 04      [ 2]  106 	ldw y,#APP_CP  
      009C9B EF 02            [ 2]  107 	ldw (2,x),y 
      009C9D 90 5F            [ 1]  108 	clrw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



      009C9F FF               [ 2]  109 	ldw (x),y 
      009CA0 81               [ 4]  110 	ret 
                                    111 
                                    112 ;------------------------------------
                                    113 ; return APP_VP pointer as double 
                                    114 ; EEP-VP ( -- ud )
                                    115 ;-------------------------------------
      009CA1 9C 8D                  116 	.word LINK
                           001C23   117 	LINK=.
      009CA3 06                     118 	.byte 6
      009CA4 45 45 50 2D 56 50      119 	.ascii "EEP-VP"
      009CAA                        120 EEPVP:
      009CAA 1D 00 04         [ 2]  121 	subw x,#2*CELLL 
      009CAD 90 AE 40 06      [ 2]  122 	ldw y,#APP_VP  
      009CB1 EF 02            [ 2]  123 	ldw (2,x),y 
      009CB3 90 5F            [ 1]  124 	clrw y 
      009CB5 FF               [ 2]  125 	ldw (x),y 
      009CB6 81               [ 4]  126 	ret 
                                    127 
                                    128 ;----------------------------------
                                    129 ; update APP_LAST with LAST 
                                    130 ; UPDAT-LAST ( -- )
                                    131 ;----------------------------------
      009CB7 9C A3                  132 	.word LINK 
                           001C39   133 	LINK=.
      009CB9 0A                     134 	.byte 10
      009CBA 55 50 44 41 54 2D 4C   135 	.ascii "UPDAT-LAST"
             41 53 54
      009CC4                        136 UPDATLAST:
      009CC4 CD 88 16         [ 4]  137 	call LAST
      009CC7 CD 85 63         [ 4]  138 	call AT  
      009CCA CD 9C 67         [ 4]  139 	call EEPLAST
      009CCD CC 9E BA         [ 2]  140 	jp EESTORE 
                                    141 
                                    142 ;---------------------------------
                                    143 ; update APP_RUN 
                                    144 ; UPDAT-RUN ( a -- )
                                    145 ;---------------------------------
      009CD0 9C B9                  146 	.word LINK
                           001C52   147 	LINK=.
      009CD2 09                     148 	.byte 9
      009CD3 55 50 44 41 54 2D 52   149 	.ascii "UPDAT-RUN"
             55 4E
      009CDC                        150 UPDATRUN:
      009CDC CD 9C 7E         [ 4]  151 	call EEPRUN
      009CDF CC 9E BA         [ 2]  152 	jp EESTORE 
                                    153 	
                                    154 ;---------------------------------
                                    155 ; update APP_CP with CP 
                                    156 ; UPDAT-CP ( -- )
                                    157 ;---------------------------------
      009CE2 9C D2                  158 	.word LINK 
                           001C64   159 	LINK=.
      009CE4 08                     160 	.byte 8 
      009CE5 55 50 44 41 54 2D 43   161 	.ascii "UPDAT-CP"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal  50-Bits]



             50
      009CED                        162 UPDATCP:
      009CED CD 88 06         [ 4]  163 	call CPP 
      009CF0 CD 85 63         [ 4]  164 	call AT 
      009CF3 CD 9C 94         [ 4]  165 	call EEPCP 
      009CF6 CC 9E BA         [ 2]  166 	jp EESTORE 
                                    167 
                                    168 ;----------------------------------
                                    169 ; update APP_VP with VP 
                                    170 ; UPDAT-VP ( -- )
                                    171 ;----------------------------------
      009CF9 9C E4                  172 	.word LINK
                           001C7B   173 	LINK=.
      009CFB 08                     174 	.byte 8 
      009CFC 55 50 44 41 54 2D 56   175 	.ascii "UPDAT-VP" 
             50
      009D04                        176 UPDATVP:
      009D04 CD 87 F8         [ 4]  177 	call VPP 
      009D07 CD 85 63         [ 4]  178 	call AT
      009D0A CD 9C AA         [ 4]  179 	call EEPVP 
      009D0D CC 9E BA         [ 2]  180 	jp EESTORE
                                    181 	
                           000001   182 .if NUCLEO
                                    183 ;----------------------------------
                                    184 ; fetch integer at address over 65535
                                    185 ;  F@   ( ud -- n )
                                    186 ;----------------------------------
      009D10 9C FB                  187     .word LINK 
                           001C92   188 LINK=.
      009D12 02                     189     .byte 2
      009D13 46 40                  190     .ascii "F@"
      009D15                        191 FARAT:
      009D15 CD 9C 30         [ 4]  192     call FPSTOR
      009D18 CC 9D DD         [ 2]  193 	jp EE_READ 
                                    194 
                                    195 
                                    196 ;-------------------------------------
                                    197 ; fetch C at address over 65535 
                                    198 ; FC@ ( ud -- c)
                                    199 ;-------------------------------------
      009D1B 9D 12                  200     .word LINK
                           001C9D   201     LINK=.
      009D1D 03                     202     .byte 3 
      009D1E 46 43 40               203     .ascii "FC@" 
      009D21                        204 FARCAT:
      009D21 CD 9C 30         [ 4]  205     call FPSTOR
      009D24 CC 9D FF         [ 2]  206 	jp EE_CREAD  
                                    207 .endif ; NUCLEO 
                                    208 
                                    209 ;----------------------------------
                                    210 ; UNLOCK EEPROM/OPT for writing/erasing
                                    211 ; wait endlessly for FLASH_IAPSR_DUL bit.
                                    212 ;  UNLKEE   ( -- )
                                    213 ;----------------------------------
      009D27 9D 1D                  214     .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]



                           001CA9   215 LINK=.
      009D29 06                     216     .byte 6 
      009D2A 55 4E 4C 4B 45 45      217     .ascii "UNLKEE"
      009D30                        218 UNLKEE:
      009D30 35 00 50 5B      [ 1]  219 	mov FLASH_CR2,#0 
      009D34 35 FF 50 5C      [ 1]  220 	mov FLASH_NCR2,#0xFF 
      009D38 35 AE 50 64      [ 1]  221 	mov FLASH_DUKR,#FLASH_DUKR_KEY1
      009D3C 35 56 50 64      [ 1]  222     mov FLASH_DUKR,#FLASH_DUKR_KEY2
      009D40 72 07 50 5F FB   [ 2]  223 	btjf FLASH_IAPSR,#FLASH_IAPSR_DUL,.
      009D45 81               [ 4]  224 	ret
                                    225 
                                    226 ;----------------------------------
                                    227 ; UNLOCK FLASH for writing/erasing
                                    228 ; wait endlessly for FLASH_IAPSR_PUL bit.
                                    229 ; UNLKFL  ( -- )
                                    230 ;----------------------------------
      009D46 9D 29                  231     .word LINK 
                           001CC8   232 LINK=. 
      009D48 06                     233     .byte 6 
      009D49 55 4E 4C 4B 46 4C      234     .ascii "UNLKFL"    
      009D4F                        235 UNLKFL:
      009D4F 35 00 50 5B      [ 1]  236 	mov FLASH_CR2,#0 
      009D53 35 FF 50 5C      [ 1]  237 	mov FLASH_NCR2,#0xFF 
      009D57 35 56 50 62      [ 1]  238 	mov FLASH_PUKR,#FLASH_PUKR_KEY1
      009D5B 35 AE 50 62      [ 1]  239 	mov FLASH_PUKR,#FLASH_PUKR_KEY2
      009D5F 72 03 50 5F FB   [ 2]  240 	btjf FLASH_IAPSR,#FLASH_IAPSR_PUL,.
      009D64 81               [ 4]  241 	ret
                                    242 
                                    243 ;-----------------------------
                                    244 ; UNLOCK FLASH or EEPROM 
                                    245 ; according to FPTR address 
                                    246 ;  UNLOCK ( -- )
                                    247 ;-----------------------------
      009D65 9D 48                  248 	.word LINK 
                           001CE7   249 	LINK=.
      009D67 06                     250 	.byte 6
      009D68 55 4E 4C 4F 43 4B      251 	.ascii "UNLOCK"
      009D6E                        252 UNLOCK:
                                    253 ; put addr[15:0] in Y, for bounds check.
      009D6E 90 BE 35         [ 2]  254 	ldw y,PTR16   ; Y=addr15:0
                                    255 ; check addr[23:16], if <> 0 then it is extened flash memory
      009D71 3D 34            [ 1]  256 	tnz FPTR 
      009D73 26 16            [ 1]  257 	jrne 4$
      009D75 90 A3 80 00      [ 2]  258     cpw y,#FLASH_BASE
      009D79 24 10            [ 1]  259     jruge 4$
      009D7B 90 A3 40 00      [ 2]  260 	cpw y,#EEPROM_BASE  
      009D7F 25 0D            [ 1]  261     jrult 9$
      009D81 90 A3 48 7F      [ 2]  262 	cpw y,#OPTION_END 
      009D85 22 07            [ 1]  263 	jrugt 9$
      009D87 CD 9D 30         [ 4]  264 	call UNLKEE
      009D8A 81               [ 4]  265 	ret 
      009D8B CD 9D 4F         [ 4]  266 4$: call UNLKFL
      009D8E 81               [ 4]  267 9$: ret 
                                    268 
                                    269 ;-------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]



                                    270 ; LOCK write access to 
                                    271 ; FLASH and EEPROM 
                                    272 ; LOCK ( -- )
                                    273 ;-------------------------
      009D8F 9D 67                  274 	.word LINK 
                           001D11   275 	LINK=.
      009D91 04                     276 	.byte 4 
      009D92 4C 4F 43 4B            277 	.ascii "LOCK" 
      009D96                        278 LOCK: 
      009D96 72 13 50 5F      [ 1]  279 	bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      009D9A 72 17 50 5F      [ 1]  280 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      009D9E 81               [ 4]  281 	ret 
                                    282 
                                    283 ;-------------------------
                                    284 ; increment FPTR 
                                    285 ; INC-FPTR ( -- )
                                    286 ;-------------------------
      009D9F 9D 91                  287 	.word LINK 
                           001D21   288 	LINK=. 
      009DA1 08                     289 	.byte 8 
      009DA2 49 4E 43 2D 46 50 54   290 	.ascii "INC-FPTR" 
             52
      009DAA                        291 INC_FPTR:
      009DAA 3C 36            [ 1]  292 	inc PTR8 
      009DAC 26 0C            [ 1]  293 	jrne 1$
      009DAE 90 89            [ 2]  294 	pushw y 
      009DB0 90 BE 34         [ 2]  295 	ldw y,FPTR 
      009DB3 90 5C            [ 1]  296 	incw y 
      009DB5 90 BF 34         [ 2]  297 	ldw FPTR,y
      009DB8 90 85            [ 2]  298 	popw y  
      009DBA 81               [ 4]  299 1$: ret 
                                    300 
                                    301 ;------------------------------
                                    302 ; add u to FPTR 
                                    303 ; PTR+ ( u -- )
                                    304 ;------------------------------
      009DBB 9D A1                  305 	.word LINK 
                           001D3D   306 	LINK=.
      009DBD 04                     307 	.byte 4 
      009DBE 50 54 52 2B            308 	.ascii "PTR+"
      009DC2                        309 PTRPLUS:
      009DC2 90 93            [ 1]  310 	ldw y,x 
      009DC4 1C 00 02         [ 2]  311 	addw x,#CELLL 
      009DC7 72 B9 00 35      [ 2]  312 	addw y,PTR16 
      009DCB 90 BF 35         [ 2]  313 	ldw PTR16,y  
      009DCE 24 02            [ 1]  314 	jrnc 1$
      009DD0 3C 34            [ 1]  315 	inc FPTR 
      009DD2 81               [ 4]  316 1$: ret 
                                    317 
                                    318 ;---------------------------------
                                    319 ; read word at address pointed FPTR
                                    320 ; increment FPTR 
                                    321 ; EE-READ ( -- w )
                                    322 ;------------------------------------
      009DD3 9D BD                  323 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]



                           001D55   324 	LINK=.
      009DD5 07                     325 	.byte 7 
      009DD6 45 45 2D 52 45 41 44   326 	.ascii "EE-READ"
      009DDD                        327 EE_READ:
      009DDD 1D 00 02         [ 2]  328 	subw x,#CELLL 
      009DE0 92 BC 00 34      [ 5]  329 	ldf a,[FPTR]
      009DE4 90 95            [ 1]  330 	ld yh,a 
      009DE6 CD 9D AA         [ 4]  331 	call INC_FPTR 
      009DE9 92 BC 00 34      [ 5]  332 	ldf a,[FPTR]
      009DED CD 9D AA         [ 4]  333 	call INC_FPTR 
      009DF0 90 97            [ 1]  334 	ld yl,a 
      009DF2 FF               [ 2]  335 	ldw (x),y 
      009DF3 81               [ 4]  336 	ret 
                                    337 
                                    338 ;---------------------------------------
                                    339 ; Read byte at address pointed by FPTR 
                                    340 ; EE-CREAD ( -- c )
                                    341 ;---------------------------------------
      009DF4 9D D5                  342 	.word LINK 
                           001D76   343 	LINK=.
      009DF6 08                     344 	.byte 8
      009DF7 45 45 2D 43 52 45 41   345 	.ascii "EE-CREAD" 
             44
      009DFF                        346 EE_CREAD:
      009DFF 1D 00 02         [ 2]  347 	subw x,#CELLL 
      009E02 92 BC 00 34      [ 5]  348 	ldf a,[FPTR]	
      009E06 CD 9D AA         [ 4]  349 	call INC_FPTR
      009E09 90 5F            [ 1]  350 	clrw y 
      009E0B 90 97            [ 1]  351 	ld yl,a 
      009E0D FF               [ 2]  352 	ldw (x),y 
      009E0E 81               [ 4]  353 	ret 
                                    354 
                                    355 ;----------------------------
                                    356 ; write a byte at address pointed 
                                    357 ; by FPTR and increment FPTR.
                                    358 ; Expect pointer already initialized 
                                    359 ; and memory unlocked 
                                    360 ; WR-BYTE ( c -- )
                                    361 ;----------------------------
      009E0F 9D F6                  362 	.word LINK 
                           001D91   363 	LINK=. 
      009E11 07                     364 	.byte 7 
      009E12 57 52 2D 42 59 54 45   365 	.ascii "WR-BYTE" 
                                    366 
      009E19                        367 WR_BYTE:
      009E19 CD 84 E3         [ 4]  368 	call FC_XOFF
      009E1C 90 93            [ 1]  369 	ldw y,x 
      009E1E 90 FE            [ 2]  370 	ldw y,(y)
      009E20 1C 00 02         [ 2]  371 	addw x,#CELLL 
      009E23 90 9F            [ 1]  372 	ld a,yl
      009E25 92 BD 00 34      [ 4]  373 	ldf [FPTR],a
      009E29 72 05 50 5F FB   [ 2]  374 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009E2E CD 84 CD         [ 4]  375 	call FC_XON
      009E31 CC 9D AA         [ 2]  376 	jp INC_FPTR 
                                    377 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]



                                    378 ;---------------------------------------
                                    379 ; write a word at address pointed 
                                    380 ; by FPTR and increment FPTR 
                                    381 ; Expect pointer already initialzed 
                                    382 ; and memory unlocked 
                                    383 ; WR-WORD ( w -- )
                                    384 ;---------------------------------------
      009E34 9E 11                  385 	.word LINK 
                           001DB6   386 	LINK=.
      009E36 07                     387 	.byte 7 
      009E37 57 52 2D 57 4F 52 44   388 	.ascii "WR-WORD" 
      009E3E                        389 WR_WORD:
      009E3E CD 84 E3         [ 4]  390 	call FC_XOFF
      009E41 90 93            [ 1]  391 	ldw y,x
      009E43 90 FE            [ 2]  392 	ldw y,(y)
      009E45 1C 00 02         [ 2]  393 	addw x,#CELLL 
      009E48 90 9E            [ 1]  394 	ld a,yh 
      009E4A 92 BD 00 34      [ 4]  395 	ldf [FPTR],a
      009E4E 72 05 50 5F FB   [ 2]  396 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009E53 CD 9D AA         [ 4]  397 	call INC_FPTR 
      009E56 90 9F            [ 1]  398 	ld a,yl 
      009E58 92 BD 00 34      [ 4]  399 	ldf [FPTR],a
      009E5C 72 05 50 5F FB   [ 2]  400 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009E61 CD 84 CD         [ 4]  401 	call FC_XON
      009E64 CC 9D AA         [ 2]  402 	jp INC_FPTR 
                                    403 
                                    404 
                                    405 ;---------------------------------------
                                    406 ; write a byte to FLASH or EEPROM/OPTION  
                                    407 ; EEC!  (c ud -- )
                                    408 ;---------------------------------------
      009E67 9E 36                  409     .word LINK 
                           001DE9   410 	LINK=.
      009E69 04                     411     .byte 4 
      009E6A 45 45 43 21            412     .ascii "EEC!"
                                    413 	; local variables 
                           000001   414 	BTW = 1   ; byte to write offset on stack
                           000002   415     OPT = 2 
                           000002   416 	VSIZE = 2
      009E6E                        417 EECSTORE:
      009E6E 52 02            [ 2]  418 	sub sp,#VSIZE
      009E70 CD 9C 30         [ 4]  419     call FPSTOR
      009E73 E6 01            [ 1]  420 	ld a,(1,x)
      009E75 43               [ 1]  421 	cpl a 
      009E76 6B 01            [ 1]  422 	ld (BTW,sp),a ; byte to write 
      009E78 0F 02            [ 1]  423 	clr (OPT,sp)  ; OPTION flag
      009E7A CD 9D 6E         [ 4]  424 	call UNLOCK 
                                    425 	; check if option
      009E7D 3D 34            [ 1]  426 	tnz FPTR 
      009E7F 26 19            [ 1]  427 	jrne 2$
      009E81 90 BE 35         [ 2]  428 	ldw y,PTR16 
      009E84 90 A3 48 00      [ 2]  429 	cpw y,#OPTION_BASE
      009E88 2B 10            [ 1]  430 	jrmi 2$
      009E8A 90 A3 48 80      [ 2]  431 	cpw y,#OPTION_END+1
      009E8E 2A 0A            [ 1]  432 	jrpl 2$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
Hexadecimal [24-Bits]



      009E90 03 02            [ 1]  433 	cpl (OPT,sp)
                                    434 	; OPTION WRITE require this UNLOCK 
      009E92 72 1E 50 5B      [ 1]  435     bset FLASH_CR2,#FLASH_CR2_OPT
      009E96 72 1F 50 5C      [ 1]  436     bres FLASH_NCR2,#FLASH_CR2_OPT 
      009E9A                        437 2$: 
      009E9A CD 9E 19         [ 4]  438 	call WR_BYTE 	
      009E9D 0D 02            [ 1]  439 	tnz (OPT,sp)
      009E9F 27 0D            [ 1]  440 	jreq 3$ 
      009EA1 7B 01            [ 1]  441     ld a,(BTW,sp)
      009EA3 90 5F            [ 1]  442     clrw y
      009EA5 90 97            [ 1]  443 	ld yl,a 
      009EA7 1D 00 02         [ 2]  444 	subw x,#CELLL 
      009EAA FF               [ 2]  445 	ldw (x),y 
      009EAB CD 9E 19         [ 4]  446 	call WR_BYTE
      009EAE                        447 3$: 
      009EAE CD 9D 96         [ 4]  448 	call LOCK 
      009EB1 5B 02            [ 2]  449 	addw sp,#VSIZE 
      009EB3 81               [ 4]  450     ret
                                    451 
                                    452 ;------------------------------
                                    453 ; write integer in FLASH|EEPROM
                                    454 ; EE! ( n ud -- )
                                    455 ;------------------------------
      009EB4 9E 69                  456 	.word LINK 
                           001E36   457 	LINK=.
      009EB6 03                     458 	.byte 3 
      009EB7 45 45 21               459 	.ascii "EE!"
      009EBA                        460 EESTORE:
      009EBA CD 9C 30         [ 4]  461 	call FPSTOR 
      009EBD CD 9D 6E         [ 4]  462 	call UNLOCK 
      009EC0 90 93            [ 1]  463 	ldw y,x 
      009EC2 90 FE            [ 2]  464 	ldw y,(y)
      009EC4 90 89            [ 2]  465 	pushw y 
      009EC6 90 5E            [ 1]  466 	swapw y 
      009EC8 FF               [ 2]  467 	ldw (x),y 
      009EC9 CD 9E 19         [ 4]  468 	call WR_BYTE 
      009ECC 90 85            [ 2]  469 	popw y 
      009ECE 1D 00 02         [ 2]  470 	subw x,#CELLL
      009ED1 FF               [ 2]  471 	ldw (x),y 
      009ED2 CD 9E 19         [ 4]  472 	call WR_BYTE
      009ED5 CC 9D 96         [ 2]  473 	jp LOCK 
                                    474 
                                    475 
                                    476 ;----------------------------
                                    477 ; Erase flash memory row 
                                    478 ; stm8s208 as 128 bytes rows
                                    479 ; ROW-ERASE ( ud -- )
                                    480 ;----------------------------
      009ED8 9E B6                  481 	.word LINK 
                           001E5A   482 	LINK=. 
      009EDA 09                     483 	.byte 9 
      009EDB 52 4F 57 2D 45 52 41   484 	.ascii "ROW-ERASE" 
             53 45
      009EE4                        485 row_erase:
      009EE4 CD 84 E3         [ 4]  486 	call FC_XOFF
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
Hexadecimal [24-Bits]



      009EE7 CD 9C 30         [ 4]  487 	call FPSTOR
                                    488 ;code must be execute from RAM 
                                    489 ;copy routine to PAD 
      009EEA 1D 00 02         [ 2]  490 	subw x,#CELLL 
      009EED 90 AE 9F 3D      [ 2]  491 	ldw y,#row_erase_proc
      009EF1 FF               [ 2]  492 	ldw (x),y 
      009EF2 CD 8D 4F         [ 4]  493 	call PAD 
      009EF5 90 AE 9F 64      [ 2]  494 	ldw y,#row_erase_proc_end 
      009EF9 72 A2 9F 3D      [ 2]  495 	subw y,#row_erase_proc
      009EFD 1D 00 02         [ 2]  496 	subw x,#CELLL 
      009F00 FF               [ 2]  497 	ldw (x),y 
      009F01 CD 8D 8B         [ 4]  498 	call CMOVE 
      009F04                        499 block_erase:
      009F04 90 BE 35         [ 2]  500 	ldw y,FPTR+1
      009F07 90 A3 B6 80      [ 2]  501 	cpw y,#app_space 
      009F0B 2A 19            [ 1]  502 	jrpl erase_flash 
                                    503 ; erase EEPROM block
      009F0D 90 A3 40 00      [ 2]  504 	cpw y,#EEPROM_BASE 
      009F11 24 04            [ 1]  505 	jruge 1$
      009F13 CD 84 CD         [ 4]  506 	call FC_XON
      009F16 81               [ 4]  507 	ret ; bad address 
      009F17 90 A3 47 FF      [ 2]  508 1$: cpw y,#EEPROM_END 
      009F1B 23 04            [ 2]  509 	jrule 2$ 
      009F1D CD 84 CD         [ 4]  510 	call FC_XON
      009F20 81               [ 4]  511 	ret ; bad address 
      009F21                        512 2$:	
      009F21 CD 9D 30         [ 4]  513 	call UNLKEE 
      009F24 20 03            [ 2]  514 	jra proceed_erase
                                    515 ; erase flash block:
      009F26                        516 erase_flash:
      009F26 CD 9D 4F         [ 4]  517 	call UNLKFL 
      009F29                        518 proceed_erase:
      009F29 CD 8D 4F         [ 4]  519 	call PAD 
      009F2C 90 93            [ 1]  520 	ldw y,x
      009F2E 90 FE            [ 2]  521 	ldw y,(y)
      009F30 1C 00 02         [ 2]  522 	addw x,#CELLL  
      009F33 90 FD            [ 4]  523 	call (y) 
      009F35 72 17 50 5F      [ 1]  524 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      009F39 CD 84 CD         [ 4]  525 	call FC_XON
      009F3C 81               [ 4]  526 	ret 
                                    527 
                                    528 ; this routine is to be copied to PAD 
      009F3D                        529 row_erase_proc:
      009F3D 35 20 50 5B      [ 1]  530 	mov FLASH_CR2,#(1<<FLASH_CR2_ERASE) 
      009F41 35 DF 50 5C      [ 1]  531 	mov FLASH_NCR2,#~(1<<FLASH_CR2_ERASE)
      009F45 4F               [ 1]  532 	clr a 
      009F46 90 5F            [ 1]  533 	clrw y 
      009F48 91 A7 00 34      [ 1]  534 	ldf ([FPTR],y),a
      009F4C 90 5C            [ 1]  535     incw y
      009F4E 91 A7 00 34      [ 1]  536 	ldf ([FPTR],y),a
      009F52 90 5C            [ 1]  537     incw y
      009F54 91 A7 00 34      [ 1]  538 	ldf ([FPTR],y),a
      009F58 90 5C            [ 1]  539     incw y
      009F5A 91 A7 00 34      [ 1]  540 	ldf ([FPTR],y),a
      009F5E 72 05 50 5F FB   [ 2]  541 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]



      009F63 81               [ 4]  542 	ret
      009F64                        543 row_erase_proc_end:
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
      009F64                        556 copy_buffer:
      009F64 4B 80            [ 1]  557 	push #BLOCK_SIZE  
                                    558 ;enable block programming 
      009F66 72 10 50 5B      [ 1]  559 	bset FLASH_CR2,#FLASH_CR2_PRG 
      009F6A 72 11 50 5C      [ 1]  560 	bres FLASH_NCR2,#FLASH_CR2_PRG
      009F6E 90 5F            [ 1]  561 	clrw y
      009F70 F6               [ 1]  562 1$:	ld a,(x)
      009F71 91 A7 00 34      [ 1]  563 	ldf ([FPTR],y),a
      009F75 5C               [ 1]  564 	incw x 
      009F76 90 5C            [ 1]  565 	incw y 
      009F78 0A 01            [ 1]  566 	dec (BCNT,sp)
      009F7A 26 F4            [ 1]  567 	jrne 1$
                                    568 ; wait EOP bit 
      009F7C 72 05 50 5F FB   [ 2]  569 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. 
      009F81 84               [ 1]  570 	pop a ; remove BCNT from stack 
      009F82 81               [ 4]  571 	ret 
      009F83                        572 copy_buffer_end:
                                    573 
                                    574 ;-------------------------
                                    575 ; move program_row to RAM 
                                    576 ; in TIB 
                                    577 ;------------------------
      009F83                        578 copy_prog_to_ram:
      009F83 1D 00 06         [ 2]  579 	subw x,#6
      009F86 90 AE 9F 64      [ 2]  580 	ldw y,#copy_buffer 
      009F8A EF 04            [ 2]  581 	ldw (4,x),y 
      009F8C 90 AE 17 00      [ 2]  582 	ldw y,#TIBBASE
      009F90 EF 02            [ 2]  583 	ldw (2,x),y 
      009F92 90 AE 9F 83      [ 2]  584 	ldw y,#copy_buffer_end 
      009F96 72 A2 9F 64      [ 2]  585 	subw y,#copy_buffer  
      009F9A FF               [ 2]  586 	ldw (x),y 
      009F9B CD 8D 8B         [ 4]  587 	call CMOVE 
      009F9E 81               [ 4]  588 	ret 
                                    589 
                                    590 
                                    591 ;-----------------------------
                                    592 ; write a row in FLASH/EEPROM 
                                    593 ; WR-ROW ( a ud -- )
                                    594 ; a -> address 128 byte buffer to write 
                                    595 ; ud ->  row address in FLASH|EEPROM 
                                    596 ;-----------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]



      009F9F 9E DA                  597 	.word LINK 
                           001F21   598 	LINK=.
      009FA1 06                     599 	.byte 6 
      009FA2 57 52 2D 52 4F 57      600 	.ascii "WR-ROW"
      009FA8                        601 write_row:
      009FA8 CD 84 E3         [ 4]  602 	call FC_XOFF
      009FAB CD 9C 30         [ 4]  603 	call FPSTOR
                                    604 ; align to FLASH block 
      009FAE A6 80            [ 1]  605 	ld a,#0x80 
      009FB0 B4 36            [ 1]  606 	and a,PTR8 
      009FB2 B7 36            [ 1]  607 	ld PTR8,a  
      009FB4 CD 9F 83         [ 4]  608 	call copy_prog_to_ram
      009FB7 CD 9D 6E         [ 4]  609 	call UNLOCK
      009FBA 90 93            [ 1]  610 	ldw y,x 
      009FBC 90 FE            [ 2]  611 	ldw y,(y)
      009FBE 1C 00 02         [ 2]  612 	addw x,#CELLL 
      009FC1 89               [ 2]  613 	pushw x 
      009FC2 93               [ 1]  614 	ldw x,y ; buffer address in x 
      009FC3 CD 17 00         [ 4]  615 	call TIBBASE
      009FC6 CD 9D 96         [ 4]  616 	call LOCK
      009FC9 85               [ 2]  617 	popw x 
      009FCA CD 84 CD         [ 4]  618 	call FC_XON 
      009FCD 81               [ 4]  619 	ret 
                                    620 
                                    621 ;-------------------------------------
                                    622 ; change value of OPTION register 
                                    623 ; SET-OPT (c n -- ) 
                                    624 ; c new value.
                                    625 ; n OPT  number {1..7}
                                    626 ;--------------------------------------
      009FCE 9F A1                  627 		.word LINK 
                           001F50   628 		LINK=.
      009FD0 07                     629 		.byte 7 
      009FD1 53 45 54 2D 4F 50 54   630 		.ascii "SET-OPT" 
      009FD8                        631 set_option: 
      009FD8 90 93            [ 1]  632 		ldw y,x 
      009FDA 90 FE            [ 2]  633 		ldw y,(y)
      009FDC 27 06            [ 1]  634 		jreq 1$
      009FDE 90 A3 00 07      [ 2]  635 		cpw y,#7 
      009FE2 23 04            [ 2]  636 		jrule 2$ 
                                    637 ; invalid OPTION number 		
      009FE4 1C 00 04         [ 2]  638 1$:		addw x,#2*CELLL
      009FE7 81               [ 4]  639 		ret
      009FE8 90 58            [ 2]  640 2$:		sllw y 
      009FEA 72 A9 47 FF      [ 2]  641 		addw y,#OPTION_BASE-1
      009FEE FF               [ 2]  642 		ldw (x),y 
      009FEF 1D 00 02         [ 2]  643 		subw x,#CELLL 
      009FF2 90 5F            [ 1]  644 		clrw y 
      009FF4 FF               [ 2]  645 		ldw (x),y 
      009FF5 CD 9E 6E         [ 4]  646 		call EECSTORE
      009FF8 81               [ 4]  647 		ret 
                                    648 
                                    649 
                                    650 
                                    651 ;--------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]



                                    652 ; reset system to its original state 
                                    653 ; before any user modification
                                    654 ; PRISTINE ( -- )
                                    655 ;-------------------------------------
      009FF9 9F D0                  656 	.word LINK  
                           001F7B   657 	LINK=.
      009FFB 08                     658 	.byte 8 
      009FFC 50 52 49 53 54 49 4E   659 	.ascii "PRISTINE"
             45
      00A004                        660 pristine:
                                    661 ;;; erase EEPROM
      00A004 CD 9C 4F         [ 4]  662 	call EEPROM 
      00A007 CD 88 B1         [ 4]  663 1$:	call DDUP 
      00A00A CD 9E E4         [ 4]  664 	call row_erase
      00A00D 90 93            [ 1]  665 	ldw y,x 
      00A00F 90 EE 02         [ 2]  666 	ldw y,(2,y)
      00A012 72 A9 00 80      [ 2]  667 	addw y,#BLOCK_SIZE
      00A016 EF 02            [ 2]  668 	ldw (2,x),y
      00A018 90 A3 48 00      [ 2]  669 	cpw y,#OPTION_BASE 
      00A01C 25 E9            [ 1]  670 	jrult 1$
                                    671 ;;; reset OPTION to default values
      00A01E 90 AE 00 01      [ 2]  672 	ldw y,#1 ; OPT1 
      00A022 FF               [ 2]  673 2$:	ldw (x),y   
      00A023 90 5F            [ 1]  674 	clrw y 
      00A025 EF 02            [ 2]  675 	ldw (2,x),y  ; ( 0 1 -- ) 
      00A027 CD 88 B1         [ 4]  676 	call DDUP    ; ( 0 1 0 1 -- )  
      00A02A CD 9F D8         [ 4]  677 	call set_option
      00A02D 90 93            [ 1]  678 	ldw y,x 
      00A02F 90 FE            [ 2]  679 	ldw y,(y)
      00A031 90 5C            [ 1]  680 	incw y  ; next OPTION 
      00A033 90 A3 00 08      [ 2]  681 	cpw y,#8 
      00A037 25 E9            [ 1]  682 	jrult 2$
                                    683 ;;; erase first row of app_space 	
      00A039 90 AE B6 80      [ 2]  684 	ldw y,#app_space
      00A03D EF 02            [ 2]  685 	ldw (2,x),y  
      00A03F 90 5F            [ 1]  686 	clrw y 
      00A041 FF               [ 2]  687 	ldw (x),y ; ( app_space 0 -- )
      00A042 CD 9E E4         [ 4]  688 	call row_erase 
                                    689 ; reset interrupt vectors 
      00A045 1D 00 02         [ 2]  690 	subw x,#CELLL 
      00A048 90 5F            [ 1]  691 	clrw y  
      00A04A FF               [ 2]  692 4$:	ldw (x),y  ; ( n -- ) int# 
      00A04B CD 86 A1         [ 4]  693 	call DUPP  
      00A04E CD A0 6B         [ 4]  694 	call reset_vector
      00A051 90 93            [ 1]  695 	ldw y,x 
      00A053 90 FE            [ 2]  696 	ldw y,(y)
      00A055 90 5C            [ 1]  697 	incw y   ; next vector 
      00A057 90 A3 00 19      [ 2]  698 	cpw y,#25 
      00A05B 25 ED            [ 1]  699 	jrult 4$
      00A05D CC 80 80         [ 2]  700 	jp NonHandledInterrupt ; reset MCU
                                    701 
                                    702 ;------------------------------
                                    703 ; reset an interrupt vector 
                                    704 ; to its initial value 
                                    705 ; i.e. NonHandledInterrupt
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 118.
Hexadecimal [24-Bits]



                                    706 ; RST-IVEC ( n -- )
                                    707 ;-----------------------------
      00A060 9F FB                  708 	.word LINK 
                           001FE2   709 	LINK=. 
      00A062 08                     710 	.byte 8 
      00A063 52 53 54 2D 49 56 45   711 	.ascii "RST-IVEC"
             43
      00A06B                        712 reset_vector:
      00A06B 90 93            [ 1]  713 	ldw y,x
      00A06D 1C 00 02         [ 2]  714 	addw x,#CELLL 
      00A070 90 FE            [ 2]  715 	ldw y,(y)
      00A072 90 A3 00 17      [ 2]  716 	cpw y,#23 
      00A076 27 3A            [ 1]  717 	jreq 9$
      00A078 90 A3 00 1D      [ 2]  718 	cpw y,#29 ; last vector
      00A07C 22 34            [ 1]  719 	jrugt 9$  
      00A07E 90 58            [ 2]  720 	sllw y 
      00A080 90 58            [ 2]  721 	sllw y 
      00A082 72 A9 80 08      [ 2]  722 	addw y,#0x8008 ; irq0 address 
      00A086 90 BF 26         [ 2]  723 	ldw YTEMP,y
      00A089 1D 00 06         [ 2]  724 	subw x,#3*CELLL 
      00A08C EF 02            [ 2]  725 	ldw (2,x),y 
      00A08E 90 5F            [ 1]  726 	clrw y
      00A090 FF               [ 2]  727 	ldw (x),y 
      00A091 A6 82            [ 1]  728 	ld a,#0x82 
      00A093 90 95            [ 1]  729 	ld yh,a
      00A095 EF 04            [ 2]  730 	ldw (4,x),y
      00A097 CD 9E BA         [ 4]  731 	call EESTORE
      00A09A 1D 00 06         [ 2]  732 	subw x,#3*CELLL
      00A09D 90 5F            [ 1]  733 	clrw y 
      00A09F FF               [ 2]  734 	ldw (x),y 
      00A0A0 90 AE 80 80      [ 2]  735 	ldw y,#NonHandledInterrupt
      00A0A4 EF 04            [ 2]  736 	ldw (4,x),y 
      00A0A6 90 BE 26         [ 2]  737 	ldw y,YTEMP  
      00A0A9 72 A9 00 02      [ 2]  738 	addw y,#2
      00A0AD EF 02            [ 2]  739 	ldw (2,x),y 
      00A0AF CD 9E BA         [ 4]  740 	call EESTORE
      00A0B2 81               [ 4]  741 9$:	ret 
                                    742 
                                    743 
                                    744 ;------------------------------
                                    745 ; all interrupt vector with 
                                    746 ; an address >= a are resetted 
                                    747 ; to default
                                    748 ; CHKIVEC ( a -- )
                                    749 ;------------------------------
      00A0B3 A0 62                  750 	.word LINK 
                           002035   751 	LINK=.
      00A0B5 07                     752 	.byte 7
      00A0B6 43 48 4B 49 56 45 43   753 	.ascii "CHKIVEC"
                                    754 ;local variables 
                           000001   755 	SSP=1
                           000003   756 	CADR=3
                           000005   757 	OFS=5
                           000006   758 	VSIZE=6  
      00A0BD                        759 CHKIVEC:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 119.
Hexadecimal [24-Bits]



      00A0BD 52 06            [ 2]  760 	sub sp,#VSIZE ;alloc local variables 
      00A0BF 90 93            [ 1]  761 	ldw y,x 
      00A0C1 90 FE            [ 2]  762 	ldw y,(y)
      00A0C3 17 03            [ 2]  763 	ldw (CADR,sp),y ; ca 
      00A0C5 1F 01            [ 2]  764 	ldw (SSP,sp),x 
      00A0C7 AE 80 0A         [ 2]  765 	ldw x,#0x800a ; irq0 address 
      00A0CA BF 35            [ 2]  766 	ldw PTR16,X
      00A0CC AE FF FC         [ 2]  767 	ldw x,#-4 
      00A0CF 1C 00 04         [ 2]  768 1$:	addw x,#4
      00A0D2 A3 00 78         [ 2]  769 	cpw x,#30*4 ; irq0-29 
      00A0D5 27 22            [ 1]  770 	jreq 9$
      00A0D7 90 93            [ 1]  771 	ldw y,x  
      00A0D9 91 D6 35         [ 4]  772 	ld a,([PTR16],y)
      00A0DC 11 03            [ 1]  773 	cp a,(CADR,sp)
      00A0DE 25 EF            [ 1]  774 	jrult 1$
      00A0E0 90 5C            [ 1]  775 	incw y 
      00A0E2 91 D6 35         [ 4]  776 	ld a,([PTR16],y)
      00A0E5 11 04            [ 1]  777 	cp a,(CADR+1,sp) 
      00A0E7 25 E6            [ 1]  778 	jrult 1$ 
      00A0E9 1F 05            [ 2]  779 	ldw (OFS,sp),x 
      00A0EB 54               [ 2]  780 	srlw x
      00A0EC 54               [ 2]  781 	srlw x 
      00A0ED 90 93            [ 1]  782 	ldw y,x 
      00A0EF 1E 01            [ 2]  783 	ldw x,(SSP,sp)
      00A0F1 FF               [ 2]  784 	ldw (x),y
      00A0F2 CD A0 6B         [ 4]  785 	call reset_vector
      00A0F5 1E 05            [ 2]  786 	ldw x,(OFS,sp) 
      00A0F7 20 D6            [ 2]  787 	jra 1$
      00A0F9 1E 01            [ 2]  788 9$:	ldw x,(SSP,sp) 
      00A0FB 1C 00 02         [ 2]  789 	addw x,#CELLL 
      00A0FE 5B 06            [ 2]  790 	addw sp,#VSIZE ; drop local variables  
      00A100 81               [ 4]  791 	ret 
                                    792 
                                    793 ;------------------------------
                                    794 ; set interrupt vector 
                                    795 ; SET-IVEC ( ud n -- )
                                    796 ;  ud Handler address
                                    797 ;  n  vector # 0 .. 29 
                                    798 ;-----------------------------
      00A101 A0 B5                  799 	.word LINK
                           002083   800 	LINK=.
      00A103 08                     801 	.byte 8 
      00A104 53 45 54 2D 49 56 45   802 	.ascii "SET-IVEC" 
             43
      00A10C                        803 set_vector:
      00A10C 90 93            [ 1]  804     ldw y,x 
      00A10E 1C 00 02         [ 2]  805 	addw x,#CELLL 
      00A111 90 FE            [ 2]  806 	ldw y,(y) ; vector #
      00A113 90 A3 00 1D      [ 2]  807 	cpw y,#29 ; last vector
      00A117 23 04            [ 2]  808 	jrule 2$
      00A119 1C 00 04         [ 2]  809 	addw x,#2*CELLL 
      00A11C 81               [ 4]  810 	ret
      00A11D 90 58            [ 2]  811 2$:	sllw y 
      00A11F 90 58            [ 2]  812 	sllw y 
      00A121 72 A9 80 08      [ 2]  813 	addw y,#0X8008 ; IRQ0 vector address 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 120.
Hexadecimal [24-Bits]



      00A125 90 BF 26         [ 2]  814 	ldw YTEMP,y ; vector address 
      00A128 A6 82            [ 1]  815 	ld a,#0x82 
      00A12A 90 95            [ 1]  816 	ld yh,a 
      00A12C E6 01            [ 1]  817 	ld a,(1,x) ; isr address bits 23..16 
      00A12E 90 97            [ 1]  818 	ld yl,a 
                                    819 ;  write 0x82 + most significant byte of int address	
      00A130 1D 00 06         [ 2]  820 	subw x,#3*CELLL 
      00A133 EF 04            [ 2]  821 	ldw (4,x),y 
      00A135 90 BE 26         [ 2]  822 	ldw y,YTEMP
      00A138 EF 02            [ 2]  823 	ldw (2,x),y ; vector address 
      00A13A 90 5F            [ 1]  824 	clrw y 
      00A13C FF               [ 2]  825 	ldw (x),y   ; as a double 
      00A13D CD 9E BA         [ 4]  826 	call EESTORE 
      00A140 90 93            [ 1]  827 	ldw y,x 
      00A142 90 EE 02         [ 2]  828 	ldw y,(2,y) ; bits 15..0 int vector 
      00A145 1D 00 06         [ 2]  829 	subw x,#3*CELLL 
      00A148 EF 04            [ 2]  830 	ldw (4,x),y 
      00A14A 90 BE 26         [ 2]  831 	ldw y,YTEMP 
      00A14D 72 A9 00 02      [ 2]  832 	addw y,#2 
      00A151 EF 02            [ 2]  833 	ldw (2,x),y 
      00A153 90 5F            [ 1]  834 	clrw y 
      00A155 FF               [ 2]  835 	ldw (x),y 
      00A156 CD 9E BA         [ 4]  836 	call EESTORE
      00A159 1C 00 04         [ 2]  837 	addw x,#2*CELLL  
      00A15C 81               [ 4]  838 9$: ret 
                                    839 
                                    840 
                                    841 ;------------------------
                                    842 ; Compile word to flash
                                    843 ; EE, (w -- )
                                    844 ;-----------------------
      00A15D A1 03                  845 	.word LINK
                           0020DF   846 	LINK=.
      00A15F 03                     847 	.byte 3
      00A160 45 45 2C               848 	.ascii "EE,"
      00A163                        849 EE_COMMA:
      00A163 1D 00 04         [ 2]  850 	subw x,#2*CELLL 
      00A166 90 BE 1A         [ 2]  851 	ldw y,UCP
      00A169 90 89            [ 2]  852 	pushw y 
      00A16B EF 02            [ 2]  853 	ldw (2,x),y 
      00A16D 90 5F            [ 1]  854 	clrw y 
      00A16F FF               [ 2]  855 	ldw (x),y
      00A170 CD 9E BA         [ 4]  856 	call EESTORE
      00A173 90 85            [ 2]  857 	popw y 
      00A175 72 A9 00 02      [ 2]  858 	addw y,#2
      00A179 90 BF 1A         [ 2]  859 	ldw UCP,y
      00A17C 81               [ 4]  860 	ret 
                                    861 
                                    862 
                                    863 ;-------------------------
                                    864 ; Compile byte to flash 
                                    865 ; EEC, ( c -- )	
                                    866 ;-------------------------
      00A17D A1 5F                  867 	.word LINK 
                           0020FF   868 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 121.
Hexadecimal [24-Bits]



      00A17F 04                     869 	.byte 4 
      00A180 45 45 43 2C            870 	.ascii "EEC,"
      00A184                        871 EE_CCOMMA:
      00A184 1D 00 04         [ 2]  872 	subw x,#2*CELLL 
      00A187 90 BE 1A         [ 2]  873 	ldw y,UCP
      00A18A 90 89            [ 2]  874 	pushw y 
      00A18C EF 02            [ 2]  875 	ldw (2,x),y 
      00A18E 90 5F            [ 1]  876 	clrw y 
      00A190 FF               [ 2]  877 	ldw (x),y
      00A191 CD 9E 6E         [ 4]  878 	call EECSTORE
      00A194 90 85            [ 2]  879 	popw y 
      00A196 90 5C            [ 1]  880 	incw y 
      00A198 90 BF 1A         [ 2]  881 	ldw UCP,y
      00A19B 81               [ 4]  882 	ret 
                                    883 
                                    884 
                                    885 ;--------------------------
                                    886 ; copy FLASH block to ROWBUF
                                    887 ; ROW>BUF ( ud -- )
                                    888 ;--------------------------
      00A19C A1 7F                  889 	.word LINK 
                           00211E   890 	LINK=.
      00A19E 07                     891 	.byte 7 
      00A19F 52 4F 57 3E 42 55 46   892 	.ascii "ROW>BUF"
      00A1A6                        893 ROW2BUF: 
      00A1A6 CD 9C 30         [ 4]  894 	call FPSTOR 
      00A1A9 A6 80            [ 1]  895 	ld a,#BLOCK_SIZE
      00A1AB 88               [ 1]  896 	push a 
      00A1AC B4 36            [ 1]  897 	and a,PTR8 ; block align 
      00A1AE B7 36            [ 1]  898 	ld PTR8,a
      00A1B0 90 AE 16 80      [ 2]  899 	ldw y,#ROWBUFF 
      00A1B4 92 BC 00 34      [ 5]  900 1$: ldf a,[FPTR]
      00A1B8 90 F7            [ 1]  901 	ld (y),a
      00A1BA CD 9D AA         [ 4]  902 	call INC_FPTR
      00A1BD 90 5C            [ 1]  903 	incw y 
      00A1BF 0A 01            [ 1]  904 	dec (1,sp)
      00A1C1 26 F1            [ 1]  905 	jrne 1$ 
      00A1C3 84               [ 1]  906 	pop a 
      00A1C4 81               [ 4]  907 	ret 
                                    908 
                                    909 
                                    910 ;---------------------------
                                    911 ; copy ROWBUFF to flash 
                                    912 ; BUF>ROW ( ud -- )
                                    913 ; ud is row address as double 
                                    914 ;---------------------------
      00A1C5 A1 9E                  915 	.word LINK 
                           002147   916 	LINK=.
      00A1C7 07                     917 	.byte 7 
      00A1C8 42 55 46 3E 52 4F 57   918 	.ascii "BUF>ROW" 
      00A1CF                        919 BUF2ROW:
      00A1CF CD 87 A5         [ 4]  920 	call TBUF ; ( ud rb -- )
      00A1D2 CD 88 65         [ 4]  921 	call ROT 
      00A1D5 CD 88 65         [ 4]  922 	call ROT  ; ( rb ud -- )
      00A1D8 CD 9F A8         [ 4]  923 	call write_row 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 122.
Hexadecimal [24-Bits]



      00A1DB 81               [ 4]  924 	ret 
                                    925 
                                    926 ;---------------------------------
                                    927 ; how many byte free in that row 
                                    928 ; RFREE ( a -- n )
                                    929 ; a is least byte of target address
                                    930 ;----------------------------------
      00A1DC A1 C7                  931 	.word LINK 
                           00215E   932 	LINK=.
      00A1DE 05                     933 	.byte 5 
      00A1DF 52 46 52 45 45         934 	.ascii "RFREE"
      00A1E4                        935 RFREE:
      00A1E4 E6 01            [ 1]  936 	ld a,(1,x)
      00A1E6 A4 7F            [ 1]  937 	and a,#BLOCK_SIZE-1 
      00A1E8 B7 26            [ 1]  938 	ld YTEMP,a 
      00A1EA A6 80            [ 1]  939 	ld a,#BLOCK_SIZE 
      00A1EC B0 26            [ 1]  940 	sub a,YTEMP 
      00A1EE 90 5F            [ 1]  941 	clrw y 
      00A1F0 90 97            [ 1]  942 	ld yl,a
      00A1F2 FF               [ 2]  943 	ldw (x),y 
      00A1F3 81               [ 4]  944 	ret 
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
      00A1F4 A1 DE                  955 	.word LINK 
                           002176   956 	LINK=. 
      00A1F6 06                     957 	.byte 6
      00A1F7 52 41 4D 3E 45 45      958 	.ascii "RAM>EE"
                                    959 	
      00A1FD                        960 RAM2EE:
                                    961 ; copy ud on top 
      00A1FD 90 93            [ 1]  962 	ldw y,x 
      00A1FF 90 EE 06         [ 2]  963 	ldw y,(6,y) ; LSW of ud  
      00A202 90 BF 26         [ 2]  964 	ldw YTEMP,y 
      00A205 90 93            [ 1]  965 	ldw y,x 
      00A207 90 EE 04         [ 2]  966 	ldw y,(4,y)  ; MSW of ud 
      00A20A 1D 00 04         [ 2]  967 	subw x,#2*CELLL 
      00A20D FF               [ 2]  968 	ldw (x),y 
      00A20E 90 BE 26         [ 2]  969 	ldw y,YTEMP 
      00A211 EF 02            [ 2]  970 	ldw (2,x),y 
      00A213 CD A1 A6         [ 4]  971 	call ROW2BUF 
      00A216 90 93            [ 1]  972 	ldw y,x 
      00A218 90 EE 06         [ 2]  973 	ldw y,(6,y)
      00A21B 90 89            [ 2]  974 	pushw y ; udl 
      00A21D 90 9F            [ 1]  975 	ld a,yl
      00A21F A4 7F            [ 1]  976 	and a,#BLOCK_SIZE-1 
      00A221 90 5F            [ 1]  977 	clrw y 
      00A223 90 97            [ 1]  978 	ld yl,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 123.
Hexadecimal [24-Bits]



      00A225 72 A9 16 80      [ 2]  979 	addw y,#ROWBUFF 
      00A229 1D 00 02         [ 2]  980 	subw x,#CELLL 
      00A22C FF               [ 2]  981 	ldw (x),y  
      00A22D CD 86 B1         [ 4]  982 	call SWAPP ;  ( ud a ra u -- )
      00A230 CD 85 B4         [ 4]  983 	call RFROM  
      00A233 CD A1 E4         [ 4]  984 	call RFREE 
      00A236 CD 8A 30         [ 4]  985 	call MIN
      00A239 CD 86 A1         [ 4]  986 	call DUPP 
      00A23C CD 86 6A         [ 4]  987 	call TOR  
      00A23F CD 8D 8B         [ 4]  988 	call CMOVE
      00A242 CD A1 CF         [ 4]  989 	call BUF2ROW 
      00A245 CD 85 B4         [ 4]  990 	call RFROM 
      00A248 81               [ 4]  991 	ret 
                                    992 
                                    993 
                                    994 ;--------------------------
                                    995 ; expand 16 bit address 
                                    996 ; to 32 bit address 
                                    997 ; FADDR ( a -- ud )
                                    998 ;--------------------------
      00A249 A1 F6                  999 	.word LINK 
                           0021CB  1000 	LINK=. 
      00A24B 05                    1001 	.byte 5 
      00A24C 46 41 44 44 52        1002 	.ascii "FADDR"
      00A251                       1003 FADDR:
      00A251 CC 8C 61         [ 2] 1004 	jp ZERO 
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
      00A254 A2 4B                 1020 	.word LINK 
                           0021D6  1021 	LINK=.
      00A256 05                    1022 	.byte 5 
      00A257 46 4D 4F 56 45        1023 	.ascii "FMOVE" 
      00A25C                       1024 FMOVE:
      00A25C CD 87 B7         [ 4] 1025 	call TFLASH 
      00A25F CD 85 63         [ 4] 1026 	CALL AT 
      00A262 CD 85 18         [ 4] 1027 	CALL QBRAN 
      00A265 A2 E0                 1028 	.word no_move  
      00A267 CD 88 06         [ 4] 1029 	call CPP
      00A26A CD 85 63         [ 4] 1030 	call AT  
      00A26D CD 86 A1         [ 4] 1031 	call DUPP ; ( udl udl -- )
      00A270 CD 87 EA         [ 4] 1032 	call CNTXT 
      00A273 CD 85 63         [ 4] 1033 	call AT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 124.
Hexadecimal [24-Bits]



      00A276 CD 84 EF         [ 4] 1034 	call DOLIT 
      00A279 00 02                 1035 	.word 2 
      00A27B CD 89 50         [ 4] 1036 	call SUBB ; ( udl udl a -- )
      00A27E CD 86 B1         [ 4] 1037 	call SWAPP 
      00A281 CD A2 51         [ 4] 1038 	call FADDR 
      00A284 CD 88 65         [ 4] 1039 	call ROT  ; ( udl ud a -- )
      00A287 CD 86 A1         [ 4] 1040 	call DUPP 
      00A28A CD 86 6A         [ 4] 1041 	call TOR    ; R: a 
      00A28D                       1042 FMOVE2: 
      00A28D CD 8D 3E         [ 4] 1043 	call HERE 
      00A290 CD 85 C5         [ 4] 1044 	call RAT 
      00A293 CD 89 50         [ 4] 1045 	call SUBB ; (udl ud a wl -- )
      00A296                       1046 next_row:
      00A296 CD 86 A1         [ 4] 1047 	call DUPP 
      00A299 CD 86 6A         [ 4] 1048 	call TOR  ; ( udl ud a wl -- ) R: a wl
      00A29C CD A1 FD         [ 4] 1049 	call RAM2EE ; ( udl a u -- udl u2 ) u2 is byte written to FLASH 
      00A29F CD 86 A1         [ 4] 1050 	call DUPP 
      00A2A2 CD 86 6A         [ 4] 1051 	call TOR
      00A2A5 CD 88 C6         [ 4] 1052 	call PLUS  ; ( udl+ ) 
      00A2A8 CD 86 A1         [ 4] 1053 	call DUPP 
      00A2AB CD 8C 61         [ 4] 1054 	call ZERO   ; ( udl+ ud -- )
      00A2AE CD 85 B4         [ 4] 1055 	call RFROM  ; ( udl+ ud u2  R: a wl ) 
      00A2B1 CD 85 B4         [ 4] 1056 	call RFROM  ; ( udl+ ud u2 wl R: a ) 
      00A2B4 CD 86 C9         [ 4] 1057 	call OVER   ; ( udl+ ud u2 wl u2 -- )
      00A2B7 CD 89 50         [ 4] 1058 	call SUBB  ; ( udl+ ud u2 wl- R: a )
      00A2BA CD 86 A1         [ 4] 1059 	call DUPP 
      00A2BD CD 85 18         [ 4] 1060 	call QBRAN
      00A2C0 A2 D9                 1061 	.word fmove_done 
      00A2C2 CD 86 B1         [ 4] 1062 	call SWAPP  ; ( udl+ ud wl- u2 R: a )
      00A2C5 CD 85 B4         [ 4] 1063 	call RFROM ; ( udl+ ud wl- u2 a -- ) 
      00A2C8 CD 88 C6         [ 4] 1064 	call PLUS  ; ( udl+2 ud wl- a+ )
      00A2CB CD 86 A1         [ 4] 1065 	call DUPP 
      00A2CE CD 86 6A         [ 4] 1066 	call TOR   ; ( udl+2 ud wl- a+ ) R: a+
      00A2D1 CD 86 B1         [ 4] 1067 	call SWAPP 
      00A2D4 CD 85 34         [ 4] 1068 	call BRAN
      00A2D7 A2 96                 1069 	.word next_row  
      00A2D9                       1070 fmove_done:	
      00A2D9 CD 85 B4         [ 4] 1071 	call RFROM  ; ( -- udl+ ud u2 wl- a  )
      00A2DC 1C 00 0A         [ 2] 1072 	addw x,#5*CELLL ; (  -- cp+ ) new CP 
      00A2DF 81               [ 4] 1073  	ret  
      00A2E0                       1074 no_move:
      00A2E0 CD 8C 61         [ 4] 1075 	call ZERO
      00A2E3 81               [ 4] 1076 	ret 
                                   1077 
                                   1078 ;------------------------------------------
                                   1079 ; adjust pointers after **FMOVE** operetion.
                                   1080 ; UPDAT-PTR ( cp+ -- )
                                   1081 ; cp+ is new CP position after FMOVE 
                                   1082 ;-------------------------------------------
      00A2E4 A2 56                 1083 	.word LINK 
                           002266  1084 	LINK=.
      00A2E6 09                    1085 	.byte 9
      00A2E7 55 50 44 41 54 2D 50  1086 	.ascii "UPDAT-PTR" 
             54 52
      00A2F0                       1087 UPDATPTR:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 125.
Hexadecimal [24-Bits]



                                   1088 ;reset VP to previous position  
      00A2F0 CD 9C AA         [ 4] 1089 	call EEPVP 
      00A2F3 CD 86 97         [ 4] 1090 	call DROP 
      00A2F6 CD 85 63         [ 4] 1091 	call AT
      00A2F9 CD 87 F8         [ 4] 1092 	call VPP 
      00A2FC CD 85 51         [ 4] 1093 	call STORE
                                   1094 ;update CONTEXT and LAST 
      00A2FF CD 9C 94         [ 4] 1095 	call EEPCP 
      00A302 CD 86 97         [ 4] 1096 	call DROP
      00A305 CD 85 63         [ 4] 1097 	call AT
      00A308 CD 84 EF         [ 4] 1098 	call DOLIT 
      00A30B 00 02                 1099 	.word 2 
      00A30D CD 88 C6         [ 4] 1100 	call PLUS 
      00A310 CD 86 A1         [ 4] 1101 	call DUPP 
      00A313 CD 87 EA         [ 4] 1102 	call CNTXT 
      00A316 CD 85 51         [ 4] 1103 	call STORE
      00A319 CD 88 16         [ 4] 1104 	call LAST
      00A31C CD 85 51         [ 4] 1105 	call STORE 
      00A31F CD 9C C4         [ 4] 1106 	call UPDATLAST 
                                   1107 ;update CP 
      00A322 CD 88 06         [ 4] 1108 	call CPP 
      00A325 CD 85 51         [ 4] 1109 	call STORE
      00A328 CD 9C ED         [ 4] 1110 	call UPDATCP 
      00A32B 81               [ 4] 1111 	ret 
                                   1112 
                                   1113 ;-----------------------------
                                   1114 ; move interrupt sub-routine
                                   1115 ; in flash memory
                                   1116 ;----------------------------- 
      00A32C A2 E6                 1117 	.word LINK 
                           0022AE  1118 	LINK=. 
      00A32E 06                    1119 	.byte 6
      00A32F 49 46 4D 4F 56 45     1120 	.ascii "IFMOVE" 
      00A335                       1121 IFMOVE:
      00A335 CD 87 B7         [ 4] 1122 	call TFLASH 
      00A338 CD 85 63         [ 4] 1123 	CALL AT 
      00A33B CD 85 18         [ 4] 1124 	CALL QBRAN 
      00A33E A2 E0                 1125 	.word no_move 
      00A340 CD 88 06         [ 4] 1126 	call CPP 
      00A343 CD 85 63         [ 4] 1127 	call AT 
      00A346 CD 86 A1         [ 4] 1128 	call DUPP ; ( udl udl -- )
      00A349 CD 9C AA         [ 4] 1129 	call EEPVP 
      00A34C CD 86 97         [ 4] 1130 	call DROP
      00A34F CD 85 63         [ 4] 1131 	call AT  ; ( udl udl a )
      00A352 CD 86 6A         [ 4] 1132 	call TOR 
      00A355 CD A2 51         [ 4] 1133 	call FADDR
      00A358 CD 85 C5         [ 4] 1134 	call RAT ; ( udl ud a -- ) R: a 
      00A35B CC A2 8D         [ 2] 1135 	jp FMOVE2 
                                   1136 
                                   1137 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 126.
Hexadecimal [24-Bits]



                           000001  4505 .if WANT_SCALING_CONST 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 127.
Hexadecimal [24-Bits]



                                   4506         .include "const_ratio.asm"
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
      00A35E A3 2E                   34         .word LINK 
                           0022E0    35         LINK=.
      00A360 02                      36         .byte 2
      00A361 50 49                   37         .ascii "PI" 
      00A363                         38 PII:
      00A363 1D 00 04         [ 2]   39         subw x,#2*CELLL 
      00A366 90 AE 01 63      [ 2]   40         ldw y,#355 
      00A36A EF 02            [ 2]   41         ldw (2,x),y 
      00A36C 90 AE 00 71      [ 2]   42         ldw y,#113 
      00A370 FF               [ 2]   43         ldw (x),y 
      00A371 81               [ 4]   44         ret 
                                     45 
                                     46 ;      SQRT2 ( -- 19601  13860 )
                                     47 ; precision: 1.5e-9 
                                     48 ; usage example to compute Voltage peek to peek from Vrms 
                                     49 ; : VPP SQRT2 */ 2 * ;
                                     50 ;
      00A372 A3 60                   51         .word LINK 
                           0022F4    52         LINK=.
      00A374 05                      53         .byte 5 
      00A375 53 51 52 54 32          54         .ascii "SQRT2" 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 128.
Hexadecimal [24-Bits]



      00A37A                         55 SQRT2:
      00A37A 1D 00 04         [ 2]   56         subw x,#2*CELLL 
      00A37D 90 AE 4C 91      [ 2]   57         ldw y,#19601 
      00A381 EF 02            [ 2]   58         ldw (2,x),y 
      00A383 90 AE 36 24      [ 2]   59         ldw y,#13860 
      00A387 FF               [ 2]   60         ldw (x),y 
      00A388 81               [ 4]   61         ret 
                                     62 
                                     63 ;   SQRT3 ( -- 18817 10864 )
                                     64 ; precision: 1.1e-9
                                     65 ;
      00A389 A3 74                   66         .word LINK 
                           00230B    67         LINK=.
      00A38B 05                      68         .byte 5
      00A38C 53 51 52 54 33          69         .ascii "SQRT3" 
      00A391                         70 SQRT3: 
      00A391 1D 00 04         [ 2]   71     subw x,#2*CELLL 
      00A394 90 AE 49 81      [ 2]   72     ldw y,#18817 
      00A398 EF 02            [ 2]   73     ldw (2,x),y 
      00A39A 90 AE 2A 70      [ 2]   74     ldw y,#10864 
      00A39E FF               [ 2]   75     ldw (x),y 
      00A39F 81               [ 4]   76     ret 
                                     77 
                                     78 ;   E ( -- 28667 10546 )
                                     79 ; precision: 5.5e-9 
                                     80 ; natural log base 
      00A3A0 A3 8B                   81         .word LINK 
                           002322    82         LINK=.
      00A3A2 01                      83         .byte 1
      00A3A3 45                      84         .ascii "E" 
      00A3A4                         85 ENEPER:
      00A3A4 1D 00 04         [ 2]   86     subw x,#2*CELLL 
      00A3A7 90 AE 6F FB      [ 2]   87     ldw y,#28667 
      00A3AB EF 02            [ 2]   88     ldw (2,x),y 
      00A3AD 90 AE 29 32      [ 2]   89     ldw y,#10546 
      00A3B1 FF               [ 2]   90     ldw (x),y 
      00A3B2 81               [ 4]   91     ret 
                                     92 
                                     93 ;   SQRT10 ( -- 22936 7253 )
                                     94 ; precision: 5.7e-9 
      00A3B3 A3 A2                   95         .word LINK 
                           002335    96         LINK=.
      00A3B5 06                      97         .byte 6 
      00A3B6 53 51 52 54 31 30       98         .ascii "SQRT10" 
      00A3BC                         99 SQRT10:
      00A3BC 1D 00 04         [ 2]  100     subw x,#2*CELLL
      00A3BF 90 AE 59 98      [ 2]  101     ldw y,#22936 
      00A3C3 EF 02            [ 2]  102     ldw (2,x),y 
      00A3C5 90 AE 1C 55      [ 2]  103     ldw y,#7253
      00A3C9 FF               [ 2]  104     ldw (x),y 
      00A3CA 81               [ 4]  105     ret 
                                    106 
                                    107 ;   12RT2 ( -- 26797 25293 )
                                    108 ; precision: 1.0e-9 
                                    109 ; used in music to compute well tempered scale
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 129.
Hexadecimal [24-Bits]



      00A3CB A3 B5                  110         .word LINK 
                           00234D   111         LINK=. 
      00A3CD 05                     112         .byte 5 
      00A3CE 31 32 52 54 32         113         .ascii "12RT2"
      00A3D3                        114 RT12_2:
      00A3D3 1D 00 04         [ 2]  115     subw x,#2*CELLL 
      00A3D6 90 AE 68 AD      [ 2]  116     ldw y,#26797
      00A3DA EF 02            [ 2]  117     ldw (2,x),y 
      00A3DC 90 AE 62 CD      [ 2]  118     ldw y,#25293
      00A3E0 FF               [ 2]  119     ldw (x),y 
      00A3E1 81               [ 4]  120     ret 
                                    121 
                                    122 ;   LOG2s ( -- 2040 11103 )
                                    123 ; log(2)/1.6384
                                    124 ; precision: 1.1e-8
      00A3E2 A3 CD                  125         .word LINK 
                           002364   126         LINK=.
      00A3E4 05                     127         .byte 5 
      00A3E5 4C 4F 47 32 53         128         .ascii "LOG2S" 
      00A3EA                        129 LOG2S:
      00A3EA 1D 00 04         [ 2]  130     subw x,#2*CELLL
      00A3ED 90 AE 07 F8      [ 2]  131     ldw y,#2040 
      00A3F1 EF 02            [ 2]  132     ldw (2,x),y 
      00A3F3 90 AE 2B 5F      [ 2]  133     ldw y,#11103 
      00A3F7 FF               [ 2]  134     ldw (x),y 
      00A3F8 81               [ 4]  135     ret 
                                    136 
                                    137 ;   LN2 ( -- 485 11464 )
                                    138 ; ln(2)/16.384 
                                    139 ; precision: 1.0e-7 
      00A3F9 A3 E4                  140         .word LINK 
                           00237B   141         LINK=.
      00A3FB 04                     142         .byte 4 
      00A3FC 4C 4E 32 53            143         .ascii "LN2S" 
      00A400                        144 LN2S: 
      00A400 1D 00 04         [ 2]  145     subw x,#2*CELLL
      00A403 90 AE 01 E5      [ 2]  146     ldw y,#485
      00A407 EF 02            [ 2]  147     ldw (2,x),y 
      00A409 90 AE 2C C8      [ 2]  148     ldw y,#11464 
      00A40D FF               [ 2]  149     ldw (x),y 
      00A40E 81               [ 4]  150     ret 
                                    151 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 130.
Hexadecimal [24-Bits]



                                   4507 .endif
                           000001  4508 .if WANT_CONST_TABLE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 131.
Hexadecimal [24-Bits]



                                   4509         .include "ctable.asm"
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
      00A40F A3 FB                   34     .word LINK 
                           002391    35     LINK=.
      00A411 06                      36     .byte 6
      00A412 43 41 4C 4C 4F 54       37     .ascii "CALLOT"
      00A418                         38 CALLOT:
      00A418 CD 88 06         [ 4]   39     CALL CPP
      00A41B CD 86 A1         [ 4]   40     CALL DUPP 
      00A41E CD 85 63         [ 4]   41     CALL AT 
      00A421 CD 86 6A         [ 4]   42     CALL TOR 
      00A424 CD 8C D1         [ 4]   43     CALL PSTOR 
      00A427 CD 9C ED         [ 4]   44     CALL UPDATCP 
      00A42A CD 85 B4         [ 4]   45     CALL RFROM
      00A42D CC 8C 61         [ 2]   46     JP ZERO 
                                     47 
                                     48 ;------------------------------
                                     49 ; create constants bytes table 
                                     50 ; in persistant memory
                                     51 ;  CTABLE ( n+ -- ad ; <string> )
                                     52 ; n+ bytes reserved 
                                     53 ;-----------------------------
      00A430 A4 11                   54     .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 132.
Hexadecimal [24-Bits]



                           0023B2    55     LINK=.
      00A432 06                      56     .byte 6
      00A433 43 54 41 42 4C 45       57     .ascii "CTABLE"
      00A439                         58 CTABLE:
      00A439 CD A4 18         [ 4]   59     CALL CALLOT     
      00A43C CC 99 A8         [ 2]   60     JP DCONST 
                                     61      
                                     62 
                                     63 ;--------------------------------
                                     64 ; create constants words table 
                                     65 ; in persistant memory 
                                     66 ; WTABLE ( n+ -- ad ; <string> )
                                     67 ; n+  words reserved  
                                     68 ;--------------------------------
      00A43F A4 32                   69     .word LINK 
                           0023C1    70     LINK=.
      00A441 06                      71     .byte 6
      00A442 57 54 41 42 4C 45       72     .ascii "WTABLE"
      00A448                         73 WTABLE:
      00A448 CD 8B E8         [ 4]   74     CALL CELLS  
      00A44B CD A4 18         [ 4]   75     CALL CALLOT 
      00A44E CC 99 A8         [ 2]   76     JP DCONST 
                                     77 
                                     78 ;---------------------------------
                                     79 ; stack an element of CTABLE 
                                     80 ; CTABL@ ( u ad -- c )
                                     81 ; u element order {0..size-1}
                                     82 ; a|ad table address 
                                     83 ;--------------------------------
      00A451 A4 41                   84     .word LINK 
                           0023D3    85     LINK=.
      00A453 06                      86     .byte 6
      00A454 43 54 41 42 4C 40       87     .ascii "CTABL@" 
      00A45A                         88 CTAT:
      00A45A CD 9C 30         [ 4]   89     call FPSTOR 
      00A45D CD 9D C2         [ 4]   90     call PTRPLUS 
      00A460 CC 9D FF         [ 2]   91     jp EE_CREAD 
                                     92 
                                     93 ;---------------------------------
                                     94 ; stack an element of WTABLE 
                                     95 ; WTABL@ ( u ud -- w )
                                     96 ; u is element order {0..size-1}
                                     97 ; a|ud table address 
                                     98 ;----------------------------------
      00A463 A4 53                   99     .word LINK 
                           0023E5   100     LINK=.
      00A465 06                     101     .byte 6
      00A466 57 54 41 42 4C 40      102     .ascii "WTABL@" 
      00A46C                        103 WTAT:
      00A46C CD 9C 30         [ 4]  104     call FPSTOR 
      00A46F CD 8B E8         [ 4]  105     call CELLS 
      00A472 CD 9D C2         [ 4]  106     call PTRPLUS 
      00A475 CD 9D DD         [ 4]  107     call EE_READ 
      00A478 81               [ 4]  108     ret 
                                    109 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 133.
Hexadecimal [24-Bits]



                                    110 ;--------------------------
                                    111 ; tool to initialize character table 
                                    112 ; CTINIT ( ad -- )
                                    113 ; ad is table address 
                                    114 ;--------------------------
      00A479 A4 65                  115     .word LINK 
                           0023FB   116     LINK=.
      00A47B 06                     117     .byte 6 
      00A47C 43 54 49 4E 49 54      118     .ascii "CTINIT"
      00A482                        119 CTINIT:
      00A482 CD 9C 30         [ 4]  120     CALL FPSTOR
      00A485 CD 9D 6E         [ 4]  121     CALL UNLOCK
      00A488 CD 8C 61         [ 4]  122     CALL ZERO 
      00A48B CD 8B F5         [ 4]  123 1$: CALL ONEP 
      00A48E CD 86 A1         [ 4]  124     CALL DUPP 
      00A491 CD A4 DE         [ 4]  125     CALL INTQ 
      00A494 CD 85 18         [ 4]  126     CALL QBRAN 
      00A497 A4 A1                  127     .word 2$
      00A499 CD 9E 19         [ 4]  128     call WR_BYTE 
      00A49C CD 85 34         [ 4]  129     CALL BRAN 
      00A49F A4 8B                  130     .word 1$ 
      00A4A1 CD 88 A6         [ 4]  131 2$: CALL DDROP 
      00A4A4 CD 9D 96         [ 4]  132     CALL LOCK 
      00A4A7 81               [ 4]  133     ret 
                                    134 
                                    135 ;--------------------------
                                    136 ; tool to initialize word table 
                                    137 ; WTINIT ( ad -- )
                                    138 ; ad is table address 
                                    139 ;--------------------------
      00A4A8 A4 7B                  140     .word LINK 
                           00242A   141     LINK=.
      00A4AA 06                     142     .byte 6 
      00A4AB 57 54 49 4E 49 54      143     .ascii "WTINIT"
      00A4B1                        144 WTINIT:
      00A4B1 CD 9C 30         [ 4]  145     CALL FPSTOR
      00A4B4 CD 9D 6E         [ 4]  146     CALL UNLOCK
      00A4B7 CD 8C 61         [ 4]  147     CALL ZERO 
      00A4BA CD 8B F5         [ 4]  148 1$: CALL ONEP 
      00A4BD CD 86 A1         [ 4]  149     CALL DUPP
      00A4C0 CD A4 DE         [ 4]  150     CALL INTQ
      00A4C3 CD 85 18         [ 4]  151     CALL QBRAN 
      00A4C6 A4 D0                  152     .word 2$
      00A4C8 CD 9E 3E         [ 4]  153     call WR_WORD 
      00A4CB CD 85 34         [ 4]  154     CALL BRAN 
      00A4CE A4 BA                  155     .word 1$ 
      00A4D0 CD 88 A6         [ 4]  156 2$: CALL DDROP 
      00A4D3 CD 9D 96         [ 4]  157     CALL LOCK 
      00A4D6 81               [ 4]  158     ret 
                                    159 
                                    160 ;------------------------
                                    161 ; Prompted input for integer 
                                    162 ; display n+ in bracket and
                                    163 ; '?' 
                                    164 ; [N]? ( n+ -- a )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 134.
Hexadecimal [24-Bits]



                                    165 ;------------------------
      00A4D7 A4 AA                  166     .word LINK 
                           002459   167     LINK=.
      00A4D9 04                     168     .byte 4
      00A4DA 5B 4E 5D 3F            169     .ascii "[N]?" 
      00A4DE                        170 INTQ:
      00A4DE CD 8F D9         [ 4]  171     CALL CR 
      00A4E1 CD 84 EF         [ 4]  172     call DOLIT 
      00A4E4 00 5B                  173     .word '[
      00A4E6 CD 84 B6         [ 4]  174     CALL EMIT 
      00A4E9 CD 90 80         [ 4]  175     CALL DOT 
      00A4EC CD 90 06         [ 4]  176     CALL  DOTQP
      00A4EF 03                     177     .byte 3
      00A4F0 5D 3F 20               178     .ascii "]? " 
      00A4F3 CD 94 10         [ 4]  179     CALL QUERY 
      00A4F6 CD 92 3B         [ 4]  180     call TOKEN 
      00A4F9 CC A5 E8         [ 2]  181     jp NUMBQ
                                    182 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 135.
Hexadecimal [24-Bits]



                                   4510 .endif
                           000001  4511 .if WANT_DOUBLE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 136.
Hexadecimal [24-Bits]



                                   4512         .include "double.asm"
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
      00247C                         35     _HEADER DBLVER,7,"DBL-VER"
      00A4FC A4 D9                    1         .word LINK 
                           00247E     2         LINK=.
      00A4FE 07                       3         .byte 7  
      00A4FF 44 42 4C 2D 56 45 52     4         .ascii "DBL-VER"
      00A506                          5         DBLVER:
      00A506 CD 8F D9         [ 4]   36     CALL CR 
      00A509 CD 90 06         [ 4]   37     CALL DOTQP 
      00A50C 18                      38     .byte  24 
      00A50D 64 6F 75 62 6C 65 20    39     .ascii "double integer library, "
             69 6E 74 65 67 65 72
             20 6C 69 62 72 61 72
             79 2C 20
      00A525 CD 9B 2F         [ 4]   40     CALL PRT_LICENCE
      00A528 CD 90 06         [ 4]   41     CALL DOTQP 
      00A52B 21                      42     .byte 33 
      00A52C 4A 61 63 71 75 65 73    43     .ascii "Jacques Deschenes, Copyright 2021"
             20 44 65 73 63 68 65
             6E 65 73 2C 20 43 6F
             70 79 72 69 67 68 74
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 137.
Hexadecimal  20-Bits]



             20 32 30 32 31
      00A549 32 30 32         [ 4]   44     CALL CR 
      0024D0                         45     _DOLIT DVER_MAJOR 
      00A54C 31 CD 8F         [ 4]    1     CALL DOLIT 
      00A54F D9 CD                    2     .word DVER_MAJOR 
      0024D5                         46     _DOLIT DVER_MINOR  
      00A551 84 EF 00         [ 4]    1     CALL DOLIT 
      00A554 01 CD                    2     .word DVER_MINOR 
      00A556 84 EF 00         [ 2]   47     JP PRINT_VERSION  
                                     48 
                                     49 
                                     50 ; check for negative sign 
                                     51 ; ajust pointer and cntr 
      0024DD                         52 nsign: ; a cntr -- a cntr f 
      00A559 00 CC 9B         [ 4]   53     CALL ZERO 
      00A55C 43 05 EA         [ 4]   54     CALL TOR  ; R: sign 
      00A55D CD 05 EA         [ 4]   55     CALL TOR  ; R: sign cntr 
      00A55D CD 8C 61         [ 4]   56     CALL DUPP 
      00A560 CD 86 6A         [ 4]   57     CALL CAT 
      0024EC                         58     _DOLIT '-'
      00A563 CD 86 6A         [ 4]    1     CALL DOLIT 
      00A566 CD 86                    2     .word '-' 
      00A568 A1 CD 85         [ 4]   59     CALL EQUAL 
      0024F4                         60     _QBRAN nsign1 
      00A56B 81 CD 84         [ 4]    1     CALL QBRAN
      00A56E EF 00                    2     .word nsign1
      00A570 2D CD 89         [ 4]   61     CALL ONEP ; a+ 
      00A573 78 CD 85         [ 4]   62     CALL RFROM 
      00A576 18 A5 8E         [ 4]   63     CALL ONEM ; cntr-
      00A579 CD 8B F5         [ 4]   64     CALL RFROM ; sign 
      00A57C CD 85 B4         [ 4]   65     CALL INVER ; -1
      00A57F CD 8C 02         [ 4]   66     CALL TOR   ; R: sign 
      00A582 CD 85 B4         [ 4]   67     CALL TOR   ; R: cntr 
      00250E                         68 nsign1:
      00A585 CD 88 F3         [ 4]   69     CALL RFROM 
      00A588 CD 86 6A         [ 4]   70     CALL RFROM 
      00A58B CD               [ 4]   71     RET 
                                     72 
                                     73 
                                     74 ; get all digits in row 
                                     75 ; stop at first non-digit or end of string 
                                     76 ; ( dlo dhi a cntr -- dlo dhi [ a+ cntr- | a+ 0 ] )
      002515                         77 parse_digits:
      002515                         78 1$:
      00A58C 86 6A 21         [ 4]   79     CALL DUPP 
      00A58E                         80     _QBRAN 5$ 
      00A58E CD 85 B4         [ 4]    1     CALL QBRAN
      00A591 CD 85                    2     .word 5$
      00A593 B4 81 EA         [ 4]   81     CALL TOR   ; dlo dhi a R: cntr 
      00A595 CD 0C A7         [ 4]   82     CALL COUNT ; dlo dhi a+ char 
      00A595 CD 06 E7         [ 4]   83     CALL BASE 
      00A595 CD 86 A1         [ 4]   84     CALL AT 
      00A598 CD 85 18         [ 4]   85     CALL DIGTQ 
      00252C                         86     _QBRAN 4$ ; not a digit
      00A59B A5 DD CD         [ 4]    1     CALL QBRAN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 138.
Hexadecimal [24-Bits]



      00A59E 86 6A                    2     .word 4$
      00A5A0 CD 8D 27         [ 4]   87     CALL DTOR  ; dlo dhi R: cntr a+ c  
      00A5A3 CD 87 67         [ 4]   88     CALL BASE 
      00A5A6 CD 85 63         [ 4]   89     CALL AT 
      00A5A9 CD 8F 1F         [ 4]   90     CALL DSSTAR
      00A5AC CD 85 18         [ 4]   91     CALL RFROM 
      00A5AF A5 D4 CD         [ 4]   92     CALL ZERO 
      00A5B2 A9 1E CD         [ 4]   93     CALL DPLUS 
      00A5B5 87 67 CD         [ 4]   94     CALL RFROM  ; dlo dhi a+ 
      00A5B8 85 63 CD         [ 4]   95     CALL RFROM ; dlo dhi a+ cntr 
      00A5BB A7 AC CD         [ 4]   96     CALL ONEM 
      00254F                         97     _BRAN 1$ ; dlo dhi a+ R: 
      00A5BE 85 B4 CD         [ 4]    1     CALL BRAN 
      00A5C1 8C 61                    2     .word 1$ 
      00A5C3 CD AB DF         [ 4]   98 4$: CALL DROP  ; dlo dhi a+ 
      00A5C6 CD 85 B4         [ 4]   99     CALL ONEM  ; unget char 
      00A5C9 CD 85 B4         [ 4]  100     CALL RFROM ; dlo dhi a+ cntr-
      00255D                        101 5$:
      00A5CC CD               [ 4]  102     RET 
                                    103 
                                    104 
                                    105 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    106 ;   NUMBER? (a -- s -1 |d -2 | a F )
                                    107 ;   convert string to integer 
                                    108 ;   double begin with '#' 
                                    109 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00255E                        110     _HEADER NUMBQ,7,"NUMBER?"
      00A5CD 8C 02                    1         .word LINK 
                           002560     2         LINK=.
      00A5CF CD                       3         .byte 7  
      00A5D0 85 34 A5 95 CD 86 97     4         .ascii "NUMBER?"
      002568                          5         NUMBQ:
                                    111 ; save current base value 
      00A5D7 CD 8C 02         [ 4]  112     CALL BASE 
      00A5DA CD 85 B4         [ 4]  113     CALL AT 
      00A5DD CD 05 EA         [ 4]  114     CALL TOR 
                                    115 ; initialize integer to 0     
      00A5DD 81 A4 FE         [ 2]  116     SUBW X,#4 
      00A5E0 07 4E            [ 1]  117     CLRW Y 
      00A5E2 55               [ 2]  118     LDW (X),Y 
      00A5E3 4D 42            [ 2]  119     LDW (2,X),Y ; a 0 0 R: base  
      002579                        120     _DOLIT 2 
      00A5E5 45 52 3F         [ 4]    1     CALL DOLIT 
      00A5E8 00 02                    2     .word 2 
      00A5E8 CD 87 67         [ 4]  121     CALL PICK  ; a 0 0 a R: base    
      00A5EB CD 85 63         [ 4]  122     CALL COUNT ; a 0 0 a+ n 
                                    123 ; check for '#' double integer 
      00A5EE CD 86 6A         [ 4]  124     CALL OVER  ; a 0 0 a+ n a+
      00A5F1 1D 00 04         [ 4]  125     CALL CAT   ; a 0 0 a+ n c 
      00258A                        126     _DOLIT '#' ; a 0 0 a+ n c '#' 
      00A5F4 90 5F FF         [ 4]    1     CALL DOLIT 
      00A5F7 EF 02                    2     .word '#' 
      00A5F9 CD 84 EF         [ 4]  127     CALL EQUAL 
      00A5FC 00 02 CD         [ 4]  128     CALL TOR   ; a 0 0 a+ n R: base d? 
      00A5FF 8C BA CD         [ 4]  129     CALL RAT   ; a 0 0 a+ n d? R: base d?
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 139.
Hexadecimal [24-Bits]



      002598                        130     _QBRAN NUMQ0
      00A602 8D 27 CD         [ 4]    1     CALL QBRAN
      00A605 86 C9                    2     .word NUMQ0
                                    131 ; update a and count
      00A607 CD 85 81         [ 4]  132     CALL SWAPP 
      00A60A CD 84 EF         [ 4]  133     CALL ONEP 
      00A60D 00 23 CD         [ 4]  134     CALL SWAPP 
      00A610 89 78 CD         [ 4]  135     CALL ONEM  ; a 0 0 a+ n- R: base d?
                                    136 ; check for '$' hexadecimal  
      0025A9                        137 NUMQ0: 
      00A613 86 6A CD         [ 4]  138     CALL OVER   
      00A616 85 C5 CD         [ 4]  139     CALL CAT   
      0025AF                        140     _DOLIT '$'
      00A619 85 18 A6         [ 4]    1     CALL DOLIT 
      00A61C 29 CD                    2     .word '$' 
      00A61E 86 B1 CD         [ 4]  141     CALL EQUAL ; a 0 0 a+ n- f  
      0025B7                        142     _QBRAN NUMQ1 
      00A621 8B F5 CD         [ 4]    1     CALL QBRAN
      00A624 86 B1                    2     .word NUMQ1
      00A626 CD 8C 02         [ 4]  143     CALL HEX   ; switch to hexadecimal base 
                                    144 ; update a and count 
      00A629 CD 06 31         [ 4]  145     CALL SWAPP 
      00A629 CD 86 C9         [ 4]  146     CALL ONEP 
      00A62C CD 85 81         [ 4]  147     CALL SWAPP
      00A62F CD 84 EF         [ 4]  148     CALL ONEM ; a 0 0 a+ n-  R: base d?
                                    149 ; check for minus sign 
      0025CB                        150 NUMQ1: 
      00A632 00 24 CD         [ 4]  151     CALL nsign 
      00A635 89 78 CD         [ 4]  152     CALL TOR ; R: base d? sign  
                                    153 ; check for end of string     
      00A638 85 18 A6         [ 4]  154     CALL QDUP    ; a dlo dhi a+ cntr R: base d? sign 
      0025D4                        155     _QBRAN NUMQ4 ; yes , not a number 
      00A63B 4B CD 8E         [ 4]    1     CALL QBRAN
      00A63E F6 CD                    2     .word NUMQ4
      00A640 86 B1 CD         [ 4]  156     CALL parse_digits
      00A643 8B F5 CD         [ 4]  157     CALL QDUP 
      00A646 86 B1 CD         [ 4]  158     CALL ZEQUAL  
      0025E2                        159     _QBRAN NUMQ4 ; error not end of string  ( a dlo dhi a+ R: base d? sign )
      00A649 8C 02 98         [ 4]    1     CALL QBRAN
      00A64B 26 16                    2     .word NUMQ4
      00A64B CD A5 5D         [ 4]  160     CALL DROP  ; a dlo dhi 
      00A64E CD 86 6A         [ 4]  161     CALL RFROM  ; a dlo dhi sign 
      0025ED                        162     _QBRAN NUMQ3
      00A651 CD 88 54         [ 4]    1     CALL QBRAN
      00A654 CD 85                    2     .word NUMQ3
      00A656 18 A6 96         [ 4]  163     CALL DNEGA
      0025F5                        164 NUMQ3: 
      00A659 CD A5 95         [ 4]  165     CALL ROT ; dlo dhi a  R: base d?
      00A65C CD 88 54         [ 4]  166     CALL DROP
      0025FB                        167     _DOLIT -2  ; double return -2 flag 
      00A65F CD 86 EA         [ 4]    1     CALL DOLIT 
      00A662 CD 85                    2     .word -2 
      00A664 18 A6 96         [ 4]  168     CALL RFROM ; dlo dhi d? R: base 
      002603                        169     _TBRAN NUMQ8 
      00A667 CD 86 97         [ 4]    1     CALL TBRAN 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 140.
Hexadecimal [24-Bits]



      00A66A CD 85                    2     .word NUMQ8 
      00A66C B4 CD 85         [ 4]  170     CALL SWAPP 
      00A66F 18 A6 75         [ 4]  171     CALL DROP
      00A672 CD 89 16         [ 4]  172     CALL ONEP   ; single return -1 flag   
      00A675                        173     _BRAN NUMQ8
      00A675 CD 88 65         [ 4]    1     CALL BRAN 
      00A678 CD 86                    2     .word NUMQ8 
      002616                        174 NUMQ4: ; not end of string error , ( a dlo dhi a+ cntr R: base d? sign )
                           000001   175 .if WANT_FLOAT
      00A67A 97 CD 84         [ 4]  176     CALL RFROM ; sign 
      00A67D EF FF FE         [ 4]  177     CALL RFROM ; d? 
      00A680 CD 85 B4         [ 4]  178     CALL FLOATQ ; ( a dlo dhi a+ cntr sign d? )    
                           000000   179 .else 
                                    180     ADDW X,#4 ; drop dhi a+  , ( a dlo R: base d? sign ) 
                                    181     ADDW SP,#4 ; drop d? sign  R: base 
                                    182     CLRW Y 
                                    183     LDW (X),Y ; dlo replaced by 0 ( -- a 0 R: base ) 
                                    184 .endif 
                                    185 ; restore original base value     
      00261F                        186 NUMQ8: 
      00A683 CD 85 26         [ 4]  187     CALL RFROM 
      00A686 A6 9F CD         [ 4]  188     CALL BASE 
      00A689 86 B1 CD         [ 4]  189     CALL STORE 
      00A68C 86               [ 4]  190     RET 
                                    191 
                                    192 
                                    193 
                                    194 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    195 ;   DABS ( d -- d )
                                    196 ;   absolute value of double
                                    197 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002629                        198     _HEADER DABS,4,"DABS"
      00A68D 97 CD                    1         .word LINK 
                           00262B     2         LINK=.
      00A68F 8B                       3         .byte 4  
      00A690 F5 CD 85 34              4         .ascii "DABS"
      002630                          5         DABS:
      00A694 A6 9F 21         [ 4]  199     CALL DUPP 
      00A696 CD 06 58         [ 4]  200     CALL ZLESS 
      002636                        201     _QBRAN DABS1 
      00A696 CD 85 B4         [ 4]    1     CALL QBRAN
      00A699 CD 85                    2     .word DABS1
      00A69B B4 CD AF         [ 4]  202     CALL DNEGA 
      00263E                        203 DABS1:
      00A69E DF               [ 4]  204     RET 
                                    205 
                                    206 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    207 ;  DSIGN ( d -- d f )
                                    208 ;  sign of double 
                                    209 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00A69F                        210     _HEADER DSIGN,5,"DSIGN"
      00A69F CD 85                    1         .word LINK 
                           002641     2         LINK=.
      00A6A1 B4                       3         .byte 5  
      00A6A2 CD 87 67 CD 85           4         .ascii "DSIGN"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 141.
Hexadecimal [24-Bits]



      002647                          5         DSIGN:
      00A6A7 51 81            [ 1]  211     LD A,#0 
      00A6A9 A5 E0            [ 1]  212     LDW Y,X 
      00A6AB 04 44            [ 2]  213     LDW Y,(Y)
      00A6AD 41 42            [ 1]  214     JRPL DSIGN1
      00A6AF 53 FF            [ 1]  215     LD A,#0XFF 
      00A6B0                        216 DSIGN1:
      00A6B0 CD 86 A1         [ 2]  217     SUBW X,#2 
      00A6B3 CD               [ 1]  218     LD (X),A 
      00A6B4 86 D8            [ 1]  219     LD (1,X),A 
      00A6B6 CD               [ 4]  220     RET 
                                    221 
                                    222 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    223 ;   DS/MOD ( ud us - ur qud )
                                    224 ;   unsigned divide double by single 
                                    225 ;   return double quotient 
                                    226 ;   and single remainder 
                                    227 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002658                        228     _HEADER DSLMOD,6,"DS/MOD"
      00A6B7 85 18                    1         .word LINK 
                           00265A     2         LINK=.
      00A6B9 A6                       3         .byte 6  
      00A6BA BE CD 89 16 4F 44        4         .ascii "DS/MOD"
      00A6BE                          5         DSLMOD:
      00A6BE 81 A6            [ 1]  229         LDW     Y,X             ; stack pointer to Y
      00A6C0 AB               [ 2]  230         LDW     X,(X)           ; un
      00A6C1 05 44            [ 2]  231         LDW     YTEMP,X         ; save un
      00A6C3 53               [ 1]  232         LDW     X,Y
      00A6C4 49               [ 2]  233         PUSHW   X               ; save stack pointer
      00A6C5 47 4E            [ 2]  234         PUSHW   Y 
      00A6C7 EE 02            [ 2]  235         LDW     X,(2,X)           ; X=udh
      00A6C7 A6 00 90         [ 2]  236         LDW     Y,YTEMP         ; divisor 
      00A6CA 93               [ 2]  237         DIVW    X,Y 
      00A6CB 90 FE            [ 2]  238         LDW     XTEMP,X         ; QUOTIENT hi 
      00A6CD 2A               [ 1]  239         LDW     X,Y             ; remainder in X 
      00A6CE 02 A6            [ 2]  240         POPW    Y 
      00A6D0 FF EE 04         [ 2]  241         LDW     Y,(4,Y)         ; Y=udl (offset before drop)
      00A6D1 A6 10            [ 1]  242         LD      A,#16           ; loop count
      00A6D1 1D 00            [ 2]  243         SLLW    Y               ; udl shift udl into udh
      00267C                        244 DSLMOD3:
      00A6D3 02               [ 2]  245         RLCW    X               ; rotate udl bit into uhdh (= remainder)
      00A6D4 F7 E7            [ 1]  246         JRC     DSLMODa         ; if carry out of rotate
      00A6D6 01 81            [ 2]  247         CPW     X,YTEMP         ; compare udh to un
      00A6D8 A6 C1            [ 1]  248         JRULT   DSLMOD4         ; can't subtract
      002683                        249 DSLMODa:
      00A6DA 06 44 53 2F      [ 2]  250         SUBW    X,YTEMP         ; can subtract
      00A6DE 4D               [ 1]  251         RCF
      002688                        252 DSLMOD4:
      00A6DF 4F               [ 1]  253         CCF                     ; quotient bit
      00A6E0 44 59            [ 2]  254         RLCW    Y               ; rotate into quotient, rotate out udl
      00A6E1 4A               [ 1]  255         DEC     A               ; repeat
      00A6E1 90 93            [ 1]  256         JRNE    DSLMOD3           ; if A == 0
      00268E                        257 DSLMODb:
      00A6E3 FE BF            [ 2]  258         LDW     YTEMP,X         ; done, save remainder
      00A6E5 26               [ 2]  259         POPW    X               ; restore stack pointer
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 142.
Hexadecimal [24-Bits]



      00A6E6 93 89            [ 2]  260         LDW     (2,X),Y           ; save quotient low 
      00A6E8 90 89 EE         [ 2]  261         LDW     Y,XTEMP         ; quotient hi 
      00A6EB 02               [ 2]  262         LDW     (X),Y           ; save quotient hi 
      00A6EC 90 BE 26         [ 2]  263         LDW     Y,YTEMP         ; remainder onto stack
      00A6EF 65 BF            [ 2]  264         LDW     (4,X),Y
      00A6F1 24               [ 4]  265         RET 
                                    266 
                                    267 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    268 ;   D# ( d -- d )
                                    269 ;   extract least digit 
                                    270 ;   from double integer 
                                    271 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00269D                        272     _HEADER DDIG,2,"D#"
      00A6F2 93 90                    1         .word LINK 
                           00269F     2         LINK=.
      00A6F4 85                       3         .byte 2  
      00A6F5 90 EE                    4         .ascii "D#"
      0026A2                          5         DDIG:
      00A6F7 04 A6 10         [ 4]  273     CALL BASE 
      00A6FA 90 58 E3         [ 4]  274     CALL AT 
      00A6FC CD 26 61         [ 4]  275     CALL DSLMOD
      00A6FC 59 25 04         [ 4]  276     CALL ROT   
      00A6FF B3 26 25         [ 4]  277     CALL DIGIT 
      00A702 05 0D EB         [ 4]  278     CALL HOLD 
      00A703 81               [ 4]  279     RET 
                                    280 
                                    281 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    282 ;    D#S ( d -- s )
                                    283 ;   extract digit from double 
                                    284 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0026B5                        285     _HEADER DDIGS,3,"D#S"
      00A703 72 B0                    1         .word LINK 
                           0026B7     2         LINK=.
      00A705 00                       3         .byte 3  
      00A706 26 98 53                 4         .ascii "D#S"
      00A708                          5         DDIGS:
      00A708 8C 90 59         [ 4]  286     CALL    DDIG 
      00A70B 4A 26 EE         [ 4]  287     CALL    DDUP 
      00A70E CD 28 27         [ 4]  288     CALL    DZEQUAL
      0026C4                        289     _QBRAN  DDIGS 
      00A70E BF 26 85         [ 4]    1     CALL QBRAN
      00A711 EF 02                    2     .word DDIGS
      00A713 90 BE 24         [ 4]  290     CALL    DROP 
      00A716 FF               [ 4]  291     RET 
                                    292 
                                    293 
                                    294 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    295 ;   D. ( d -- )
                                    296 ;   display double integer 
                                    297 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0026CD                        298     _HEADER DDOT,2,"D."
      00A717 90 BE                    1         .word LINK 
                           0026CF     2         LINK=.
      00A719 26                       3         .byte 2  
      00A71A EF 04                    4         .ascii "D."
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 143.
Hexadecimal [24-Bits]



      0026D2                          5         DDOT:
      00A71C 81 A6 DA         [ 4]  299     CALL SPACE 
      00A71F 02 44 23         [ 4]  300     CALL DSIGN 
      00A722 CD 05 EA         [ 4]  301     CALL TOR
      00A722 CD 87 67         [ 4]  302     CALL RAT 
      0026DE                        303     _QBRAN DDOT0
      00A725 CD 85 63         [ 4]    1     CALL QBRAN
      00A728 CD A6                    2     .word DDOT0
      00A72A E1 CD 88         [ 4]  304     CALL DNEGA 
      0026E6                        305 DDOT0:     
      00A72D 65 CD 8E         [ 4]  306     CALL BDIGS 
      00A730 1F CD 8E         [ 4]  307     CALL DDIGS 
      00A733 6B 81 A7         [ 4]  308     CALL RFROM 
      0026EF                        309     _QBRAN DDOT1 
      00A736 1F 03 44         [ 4]    1     CALL QBRAN
      00A739 23 53                    2     .word DDOT1
      00A73B                        310     _DOLIT '-' 
      00A73B CD A7 22         [ 4]    1     CALL DOLIT 
      00A73E CD 88                    2     .word '-' 
      00A740 B1 CD A8         [ 4]  311     CALL HOLD 
      0026FC                        312 DDOT1: 
      00A743 A7 CD 85         [ 4]  313     CALL EDIGS 
      00A746 18 A7 3B         [ 4]  314     CALL TYPES     
      00A749 CD               [ 4]  315     RET 
                                    316 
                                    317 
                                    318 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    319 ;  UDS* ( ud u -- ud*u )
                                    320 ;  uint32*uint16 
                                    321 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002703                        322     _HEADER UDSSTAR,4,"UDS*"
      00A74A 86 97                    1         .word LINK 
                           002705     2         LINK=.
      00A74C 81                       3         .byte 4  
      00A74D A7 37 02 44              4         .ascii "UDS*"
      00270A                          5         UDSSTAR:
      00A751 2E 05 EA         [ 4]  323     CALL TOR 
      00A752 CD 06 31         [ 4]  324     CALL SWAPP 
      00A752 CD 8F 97         [ 4]  325     CALL RAT 
      00A755 CD A6 C7         [ 4]  326     CALL UMSTA ; udlo*u 
      00A758 CD 86 6A         [ 4]  327     CALL ROT 
      00A75B CD 85 C5         [ 4]  328     CALL RFROM 
      00A75E CD 85 18         [ 4]  329     CALL UMSTA ; udhi*u 
      00A761 A7 66 CD         [ 4]  330     CALL DROP  ; drop overflow 
      00A764 89 16 46         [ 4]  331     CALL PLUS  ; udlo*u+(uhi*u<<16)
      00A766 81               [ 4]  332     RET 
                                    333 
                                    334 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    335 ; multiply double by single 
                                    336 ; return double 
                                    337 ;  ( d u -- d )
                                    338 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002726                        339     _HEADER DSSTAR,3,"DS*"
      00A766 CD 8E                    1         .word LINK 
                           002728     2         LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 144.
Hexadecimal [24-Bits]



      00A768 5B                       3         .byte 3  
      00A769 CD A7 3B                 4         .ascii "DS*"
      00272C                          5         DSSTAR:
                                    340 ;DSSTAR:
      00A76C CD 85 B4         [ 4]  341     CALL TOR
      00A76F CD 85 18         [ 4]  342     CALL DSIGN 
      00A772 A7 7C CD         [ 4]  343     CALL NROT 
      00A775 84 EF 00         [ 4]  344     CALL DABS
      00A778 2D CD 8E         [ 4]  345     CALL RFROM 
      00A77B 6B 27 0A         [ 4]  346     CALL UDSSTAR  
      00A77C CD 07 E5         [ 4]  347     CALL ROT 
      002741                        348     _QBRAN DSSTAR3 
      00A77C CD 8E C0         [ 4]    1     CALL QBRAN
      00A77F CD 8F                    2     .word DSSTAR3
      00A781 C1 81 A7         [ 4]  349     CALL DNEGA 
      002749                        350 DSSTAR3:
      00A784 4F               [ 4]  351     RET 
                                    352 
                                    353 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    354 ;  2SWAP ( d1 d2 -- d2 d1 )
                                    355 ;  swap double 
                                    356 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00274A                        357     _HEADER DSWAP,5,"2SWAP"
      00A785 04 55                    1         .word LINK 
                           00274C     2         LINK=.
      00A787 44                       3         .byte 5  
      00A788 53 2A 57 41 50           4         .ascii "2SWAP"
      00A78A                          5         DSWAP:
      00A78A CD 86            [ 1]  358     LDW Y,X 
      00A78C 6A CD            [ 2]  359     LDW Y,(Y)
      00A78E 86 B1 CD         [ 2]  360     LDW YTEMP,Y ; d2 hi 
      00A791 85 C5            [ 1]  361     LDW Y,X 
      00A793 CD 8B 2A         [ 2]  362     LDW Y,(2,Y)
      00A796 CD 88 65         [ 2]  363     LDW XTEMP,Y  ; d2 lo 
      00A799 CD 85            [ 1]  364     LDW Y,X 
      00A79B B4 CD 8B         [ 2]  365     LDW Y,(4,Y)  ; d1 hi 
      00A79E 2A               [ 2]  366     LDW (X),Y 
      00A79F CD 86            [ 1]  367     LDW Y,X
      00A7A1 97 CD 88         [ 2]  368     LDW Y,(6,Y)  ; d1 lo 
      00A7A4 C6 81            [ 2]  369     LDW (2,X),Y
      00A7A6 A7 85 03         [ 2]  370     LDW Y,YTEMP  
      00A7A9 44 53            [ 2]  371     LDW (4,X),Y 
      00A7AB 2A BE 24         [ 2]  372     LDW Y,XTEMP 
      00A7AC EF 06            [ 2]  373     LDW (6,X),Y 
      00A7AC CD               [ 4]  374     RET 
                                    375 
                                    376 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    377 ;    DCLZ ( d -- u )
                                    378 ;    double count leading zeros
                                    379 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002779                        380     _HEADER DCLZ,4,"DCLZ"
      00A7AD 86 6A                    1         .word LINK 
                           00277B     2         LINK=.
      00A7AF CD                       3         .byte 4  
      00A7B0 A6 C7 CD 88              4         .ascii "DCLZ"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 145.
Hexadecimal [24-Bits]



      002780                          5         DCLZ:
      00A7B4 84               [ 1]  381     CLR A 
      00A7B5 CD A6            [ 1]  382     LDW Y,X 
      00A7B7 B0 CD            [ 2]  383     LDW Y,(Y)
      00A7B9 85 B4            [ 1]  384     JRMI DCLZ8 ; no leading zero 
      00A7BB CD A7            [ 1]  385     JREQ DCLZ4 ; >=16 
      002789                        386 DCLZ1: ; <16
      00A7BD 8A CD            [ 2]  387     SLLW Y
      00A7BF 88               [ 1]  388     INC A 
      00A7C0 65 CD            [ 2]  389     TNZW Y 
      00A7C2 85 18            [ 1]  390     JRMI DCLZ8
      00A7C4 A7 C9            [ 2]  391     JRA DCLZ1 
      002792                        392 DCLZ4:
      00A7C6 CD 89            [ 1]  393     LD A,#16 
      00A7C8 16 93            [ 1]  394     LDW Y,X 
      00A7C9 90 EE 02         [ 2]  395     LDW Y,(2,Y)
      00A7C9 81 A7            [ 1]  396     JRMI DCLZ8 
      00A7CB A8 05            [ 1]  397     JRNE DCLZ1 
      00A7CD 32 53            [ 1]  398     ADD A,#16
      00279F                        399 DCLZ8: 
      00A7CF 57 41 50         [ 2]  400     ADDW X,#2 
      00A7D2 90 5F            [ 1]  401     CLRW Y 
      00A7D2 90 93            [ 1]  402     LD YL,A 
      00A7D4 90               [ 2]  403     LDW (X),Y 
      00A7D5 FE               [ 4]  404     RET 
                                    405 
                                    406 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    407 ;   <2ROT ( d1 d2 d3 -- d3 d1 d2 )
                                    408 ;   rotate left doubles 
                                    409 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0027A8                        410     _HEADER NDROT,5,"<2ROT"
      00A7D6 90 BF                    1         .word LINK 
                           0027AA     2         LINK=.
      00A7D8 26                       3         .byte 5  
      00A7D9 90 93 90 EE 02           4         .ascii "<2ROT"
      0027B0                          5         NDROT:
                                    411 ; save d3 in temp 
      00A7DE 90 BF            [ 1]  412     LDW Y,X 
      00A7E0 24 90            [ 2]  413     LDW Y,(Y)
      00A7E2 93 90 EE         [ 2]  414     LDW YTEMP,Y  ; d3 hi 
      00A7E5 04 FF            [ 1]  415     LDW Y,X 
      00A7E7 90 93 90         [ 2]  416     LDW Y,(2,Y)
      00A7EA EE 06 EF         [ 2]  417     LDW XTEMP,Y  ; d3 lo 
                                    418 ; put d2 in d1 slot 
      00A7ED 02 90            [ 1]  419     LDW Y,X 
      00A7EF BE 26 EF         [ 2]  420     LDW Y,(4,Y) 
      00A7F2 04               [ 2]  421     LDW (X),Y   ; d2 hi 
      00A7F3 90 BE            [ 1]  422     LDW Y,X 
      00A7F5 24 EF 06         [ 2]  423     LDW Y,(6,Y)
      00A7F8 81 A7            [ 2]  424     LDW (2,X),Y ; d2 lo
                                    425 ; put d1 in d2 slot 
      00A7FA CC 04            [ 1]  426     LDW Y,X 
      00A7FC 44 43 4C         [ 2]  427     LDW Y,(8,Y) 
      00A7FF 5A 04            [ 2]  428     LDW (4,X),Y ; d1 hi 
      00A800 90 93            [ 1]  429     LDW Y,X 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 146.
Hexadecimal [24-Bits]



      00A800 4F 90 93         [ 2]  430     LDW Y,(10,Y)
      00A803 90 FE            [ 2]  431     LDW (6,X),Y  ; d1 lo 
                                    432 ; put d3 in d1 slot 
      00A805 2B 18 27         [ 2]  433     LDW Y,YTEMP 
      00A808 09 08            [ 2]  434     LDW (8,X),Y  ; d3 hi 
      00A809 90 BE 24         [ 2]  435     LDW Y,XTEMP 
      00A809 90 58            [ 2]  436     LDW (10,X),Y  ; d3 lo 
      00A80B 4C               [ 4]  437     RET 
                                    438 
                                    439 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    440 ;   2ROT ( d1 d2 d3 -- d2 d3 d1 )
                                    441 ;   rotate right doubles 
                                    442 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0027E5                        443     _HEADER DROT,4,"2ROT"
      00A80C 90 5D                    1         .word LINK 
                           0027E7     2         LINK=.
      00A80E 2B                       3         .byte 4  
      00A80F 0F 20 F7 54              4         .ascii "2ROT"
      00A812                          5         DROT:
                                    444 ; save d3 in temp 
      00A812 A6 10            [ 1]  445     LDW Y,X 
      00A814 90 93            [ 2]  446     LDW Y,(Y)
      00A816 90 EE 02         [ 2]  447     LDW YTEMP,Y ; d3 hi 
      00A819 2B 04            [ 1]  448     LDW Y,X 
      00A81B 26 EC AB         [ 2]  449     LDW Y,(2,Y)
      00A81E 10 BF 24         [ 2]  450     LDW XTEMP,Y ; d3 lo 
                                    451 ; put d1 in d3 slot 
      00A81F 90 93            [ 1]  452     LDW Y,X 
      00A81F 1C 00 02         [ 2]  453     LDW Y,(8,Y)
      00A822 90               [ 2]  454     LDW (X),Y  ; d1 hi 
      00A823 5F 90            [ 1]  455     LDW Y,X 
      00A825 97 FF 81         [ 2]  456     LDW Y,(10,Y) 
      00A828 A7 FB            [ 2]  457     LDW (2,X),Y ; d1 lo 
                                    458 ; put d2 in d1 slot 
      00A82A 05 3C            [ 1]  459     LDW Y,X 
      00A82C 32 52 4F         [ 2]  460     LDW Y,(4,Y) ; d2 hi 
      00A82F 54 08            [ 2]  461     LDW (8,X),Y 
      00A830 90 93            [ 1]  462     LDW Y,X 
      00A830 90 93 90         [ 2]  463     LDW Y,(6,Y) ; d2 lo 
      00A833 FE 90            [ 2]  464     LDW (10,X),Y 
                                    465 ; put d3 in d2 slot 
      00A835 BF 26 90         [ 2]  466     LDW Y,YTEMP 
      00A838 93 90            [ 2]  467     LDW (4,X),Y 
      00A83A EE 02 90         [ 2]  468     LDW Y,XTEMP 
      00A83D BF 24            [ 2]  469     LDW (6,X),Y 
      00A83F 90               [ 4]  470     RET 
                                    471 
                                    472 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    473 ;    D0= ( d -- 0|-1 )
                                    474 ;    check if double is 0 
                                    475 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002821                        476     _HEADER DZEQUAL,3,"D0="
      00A840 93 90                    1         .word LINK 
                           002823     2         LINK=.
      00A842 EE                       3         .byte 3  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 147.
Hexadecimal [24-Bits]



      00A843 04 FF 90                 4         .ascii "D0="
      002827                          5         DZEQUAL:
      00A846 93 90 EE         [ 4]  477     CALL ORR 
      00A849 06 EF            [ 1]  478     LD A,#0xFF
      00A84B 02 90            [ 1]  479     LDW Y,X
      00A84D 93 90            [ 2]  480     LDW Y,(Y)
      00A84F EE 08 EF 04      [ 2]  481     CPW Y,#0 
      00A853 90 93            [ 1]  482     JREQ  ZEQ1
      00A855 90               [ 1]  483     CLR A   ;false
      002837                        484 ZEQ1:
      00A856 EE               [ 1]  485     LD     (X),A
      00A857 0A EF            [ 1]  486     LD (1,X),A
      00A859 06               [ 4]  487 	RET     
                                    488     
                                    489 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    490 ;   D= ( d1 d2 -- f )
                                    491 ;   d1==d2?
                                    492 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00283B                        493     _HEADER DEQUAL,2,"D="
      00A85A 90 BE                    1         .word LINK 
                           00283D     2         LINK=.
      00A85C 26                       3         .byte 2  
      00A85D EF 08                    4         .ascii "D="
      002840                          5         DEQUAL:
      00A85F 90 BE            [ 1]  494     LD A,#0 
      00A861 24 EF            [ 1]  495     LDW Y,X 
      00A863 0A 81            [ 2]  496     LDW Y,(Y)
      00A865 A8 2A            [ 2]  497     CPW Y,(4,X)
      00A867 04 32            [ 1]  498     JRNE DEQU4 
      00A869 52 4F            [ 1]  499     LDW Y,X 
      00A86B 54 EE 02         [ 2]  500     LDW Y,(2,Y)
      00A86C E3 06            [ 2]  501     CPW Y,(6,X)
      00A86C 90 93            [ 1]  502     JRNE DEQU4 
      00A86E 90 FE            [ 1]  503     LD A,#0XFF
      002855                        504 DEQU4:
      00A870 90 BF 26         [ 2]  505     ADDW X,#6
      00A873 90               [ 1]  506     LD (X),A 
      00A874 93 90            [ 1]  507     LD (1,X),A 
      00A876 EE               [ 4]  508     RET 
                                    509 
                                    510 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    511 ;   D> ( d1 d2 -- f )
                                    512 ;   d1>d2?
                                    513 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00285C                        514     _HEADER DGREAT,2,"D>"
      00A877 02 90                    1         .word LINK 
                           00285E     2         LINK=.
      00A879 BF                       3         .byte 2  
      00A87A 24 90                    4         .ascii "D>"
      002861                          5         DGREAT:
      00A87C 93 90 EE         [ 4]  515     CALL DSWAP 
      00A87F 08 FF 90         [ 2]  516     JP DLESS 
                                    517 
                                    518 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    519 ;   D< ( d1 d2 -- f )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 148.
Hexadecimal [24-Bits]



                                    520 ;   d1<d2? 
                                    521 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002867                        522     _HEADER DLESS,2,"D<"
      00A882 93 90                    1         .word LINK 
                           002869     2         LINK=.
      00A884 EE                       3         .byte 2  
      00A885 0A EF                    4         .ascii "D<"
      00286C                          5         DLESS:
      00A887 02 90 93         [ 4]  523     CALL DSUB
      00A88A 90 EE 04         [ 4]  524     CALL ZERO
      00A88D EF 08 90         [ 4]  525     CALL NROT  
      00A890 93 90 EE         [ 4]  526     CALL DZLESS 
      002878                        527     _QBRAN DLESS4
      00A893 06 EF 0A         [ 4]    1     CALL QBRAN
      00A896 90 BE                    2     .word DLESS4
      00A898 26 EF 04         [ 4]  528     CALL INVER  
      002880                        529 DLESS4:
      00A89B 90               [ 4]  530     RET
                                    531 
                                    532 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    533 ;  D0< ( d -- f )
                                    534 ;  d<0? 
                                    535 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002881                        536     _HEADER DZLESS,3,"D0<"
      00A89C BE 24                    1         .word LINK 
                           002883     2         LINK=.
      00A89E EF                       3         .byte 3  
      00A89F 06 81 A8                 4         .ascii "D0<"
      002887                          5         DZLESS:
      00A8A2 67 03            [ 1]  537     LD A,#0 
      00A8A4 44 30            [ 1]  538     LDW Y,X 
      00A8A6 3D FE            [ 2]  539     LDW Y,(Y)
      00A8A7 2A 02            [ 1]  540     JRPL DZLESS1 
      00A8A7 CD 87            [ 1]  541     LD A,#0XFF 
      002891                        542 DZLESS1:
      00A8A9 12 A6 FF         [ 2]  543     ADDW X,#2 
      00A8AC 90               [ 1]  544     LD (X),A 
      00A8AD 93 90            [ 1]  545     LD (1,X),A    
      00A8AF FE               [ 4]  546     RET 
                                    547 
                                    548 
                                    549 
                                    550 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    551 ;   2>R ( d -- R: d )
                                    552 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002898                        553     _HEADER DTOR,3,"2>R"
      00A8B0 90 A3                    1         .word LINK 
                           00289A     2         LINK=.
      00A8B2 00                       3         .byte 3  
      00A8B3 00 27 01                 4         .ascii "2>R"
      00289E                          5         DTOR:
      00A8B6 4F 85            [ 2]  554     POPW Y 
      00A8B7 90 BF 26         [ 2]  555     LDW YTEMP,Y 
      00A8B7 F7 E7            [ 1]  556     LDW Y,X 
      00A8B9 01 81 A8         [ 2]  557     LDW Y,(2,Y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 149.
Hexadecimal [24-Bits]



      00A8BC A3 02            [ 2]  558     PUSHW Y   ; d low 
      00A8BE 44 3D            [ 1]  559     LDW Y,X 
      00A8C0 90 FE            [ 2]  560     LDW Y,(Y)
      00A8C0 A6 00            [ 2]  561     PUSHW Y   ; d hi 
      00A8C2 90 93 90         [ 2]  562     ADDW X,#4  
      00A8C5 FE E3 04         [ 5]  563     JP [YTEMP]
                                    564 
                                    565 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    566 ;  2R> ( -- d ) R: d --      
                                    567 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0028B6                        568     _HEADER DRFROM,3,"2R>"
      00A8C8 26 0B                    1         .word LINK 
                           0028B8     2         LINK=.
      00A8CA 90                       3         .byte 3  
      00A8CB 93 90 EE                 4         .ascii "2R>"
      0028BC                          5         DRFROM:
      00A8CE 02 E3            [ 2]  569     POPW Y      ; d hi 
      00A8D0 06 26 02         [ 2]  570     LDW YTEMP,Y 
      00A8D3 A6 FF 04         [ 2]  571     SUBW X,#4
      00A8D5 90 85            [ 2]  572     POPW Y       ; d hi 
      00A8D5 1C               [ 2]  573     LDW (X),Y 
      00A8D6 00 06            [ 2]  574     POPW Y       ; d low  
      00A8D8 F7 E7            [ 2]  575     LDW (2,X),Y 
      00A8DA 01 81 A8         [ 5]  576     JP [YTEMP]
                                    577     
                                    578 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    579 ;   2R@ ( -- d )
                                    580 ;   fecth a double from RSTACK
                                    581 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0028CE                        582     _HEADER DRAT,3,"2R@"
      00A8DD BD 02                    1         .word LINK 
                           0028D0     2         LINK=.
      00A8DF 44                       3         .byte 3  
      00A8E0 3E 52 40                 4         .ascii "2R@"
      00A8E1                          5         DRAT:
      00A8E1 CD A7            [ 2]  583     POPW Y 
      00A8E3 D2 CC A8         [ 2]  584     LDW YTEMP,Y 
      00A8E6 EC A8 DE         [ 2]  585     SUBW X,#4 
      00A8E9 02 44            [ 2]  586     LDW Y,(1,SP)
      00A8EB 3C               [ 2]  587     LDW (X),Y 
      00A8EC 16 03            [ 2]  588     LDW Y,(3,SP)
      00A8EC CD AC            [ 2]  589     LDW (2,X),Y 
      00A8EE 11 CD 8C         [ 5]  590     JP [YTEMP]
                                    591 
                                    592 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    593 ;  2VARIABLE <name> 
                                    594 ;  create a double variable 
                                    595 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0028E6                        596     _HEADER DVARIA,9,"2VARIABLE"
      00A8F1 61 CD                    1         .word LINK 
                           0028E8     2         LINK=.
      00A8F3 88                       3         .byte 9  
      00A8F4 84 CD A9 07 CD 85 18     4         .ascii "2VARIABLE"
             A9 00
      0028F2                          5         DVARIA:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 150.
Hexadecimal [24-Bits]



      00A8FD CD 88 F3         [ 4]  597         CALL HERE
      00A900 CD 06 21         [ 4]  598         CALL DUPP
      0028F8                        599         _DOLIT 4  
      00A900 81 A8 E9         [ 4]    1     CALL DOLIT 
      00A903 03 44                    2     .word 4 
      00A905 30 3C 46         [ 4]  600         CALL PLUS 
      00A907 CD 07 78         [ 4]  601         CALL VPP 
      00A907 A6 00 90         [ 4]  602         CALL STORE
      00A90A 93 90 FE         [ 4]  603         CALL CREAT
      00A90D 2A 02 A6         [ 4]  604         CALL DUPP
      00A910 FF 15 02         [ 4]  605         CALL COMMA
      00A911 CD 0B E1         [ 4]  606         CALL ZERO
      00A911 1C 00 02         [ 4]  607         CALL OVER 
      00A914 F7 E7 01         [ 4]  608         CALL STORE 
      00A917 81 A9 03         [ 4]  609         CALL ZERO 
      00A91A 03 32 3E         [ 4]  610         CALL SWAPP 
      00A91D 52 04 D1         [ 4]  611         CALL STORE
      00A91E CD 21 DC         [ 4]  612         CALL FMOVE ; move definition to FLASH
      00A91E 90 85 90         [ 4]  613         CALL QDUP 
      00A921 BF 26 90         [ 4]  614         CALL QBRAN 
      00A924 93 90                  615         .word SET_RAMLAST   
      00A926 EE 02 90         [ 4]  616         call UPDATVP  ; don't update if variable kept in RAM.
      00A929 89 90 93         [ 4]  617         CALL UPDATPTR
      00A92C 90               [ 4]  618         RET         
                                    619 
                                    620 
                                    621 
                                    622 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    623 ;  2LITERAL ( d -- )
                                    624 ;  compile double literal 
                                    625 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002933                        626     _HEADER DLITER,IMEDD+8,"2LITERAL"
      00A92D FE 90                    1         .word LINK 
                           002935     2         LINK=.
      00A92F 89                       3         .byte IMEDD+8  
      00A930 1C 00 04 92 CC 26 A9     4         .ascii "2LITERAL"
             1A
      00293E                          5         DLITER:
      00A938 03 32 52         [ 4]  627     CALL COMPI 
      00A93B 3E 49                  628     .word do2lit 
      00A93C CD 15 02         [ 4]  629     CALL COMMA 
      00A93C 90 85 90         [ 2]  630     JP   COMMA 
                                    631 
                                    632 
                                    633 ; runtime for 2LITERAL 
      002949                        634 do2lit:
      00A93F BF 26 1D         [ 2]  635     SUBW X,#4 
      00A942 00 04            [ 2]  636     LDW Y,(1,SP)
      00A944 90 85            [ 2]  637     LDW Y,(Y)
      00A946 FF               [ 2]  638     LDW (X),Y 
      00A947 90 85            [ 2]  639     LDW Y,(1,SP)
      00A949 EF 02 92         [ 2]  640     LDW Y,(2,Y)
      00A94C CC 26            [ 2]  641     LDW (2,X),Y 
      00A94E A9 38            [ 2]  642     POPW Y 
      00A950 03 32 52         [ 2]  643     JP (4,Y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 151.
Hexadecimal [24-Bits]



                                    644 
                                    645 
                                    646 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    647 ;   2OVER ( d1 d2 -- d1 d2 d1 )
                                    648 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00295D                        649     _HEADER DOVER,5,"2OVER"
      00A953 40 35                    1         .word LINK 
                           00295F     2         LINK=.
      00A954 05                       3         .byte 5  
      00A954 90 85 90 BF 26           4         .ascii "2OVER"
      002965                          5         DOVER:
      00A959 1D 00            [ 1]  650     LDW Y,X 
      00A95B 04 16 01         [ 2]  651     SUBW X,#4 
      00A95E FF 16            [ 2]  652     PUSHW Y 
      00A960 03 EF 02         [ 2]  653     LDW Y,(4,Y)  ; d1 hi 
      00A963 92               [ 2]  654     LDW (X),Y 
      00A964 CC 26            [ 2]  655     POPW Y 
      00A966 A9 50 09         [ 2]  656     LDW Y,(6,Y)  ;d1 lo 
      00A969 32 56            [ 2]  657     LDW (2,X),Y 
      00A96B 41               [ 4]  658     RET 
                                    659 
                                    660 
                                    661 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    662 ;   D2/ ( d -- d/2 )
                                    663 ;   divide double by 2 
                                    664 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002978                        665     _HEADER D2SLASH,3,"D2/"
      00A96C 52 49                    1         .word LINK 
                           00297A     2         LINK=.
      00A96E 41                       3         .byte 3  
      00A96F 42 4C 45                 4         .ascii "D2/"
      00A972                          5         D2SLASH:
      00A972 CD 8D            [ 1]  666     LDW Y,X 
      00A974 3E CD            [ 2]  667     LDW Y,(Y)
      00A976 86 A1            [ 2]  668     SRAW Y 
      00A978 CD               [ 2]  669     LDW (X),Y 
      00A979 84 EF            [ 1]  670     LDW Y,X 
      00A97B 00 04 CD         [ 2]  671     LDW Y,(2,Y)
      00A97E 88 C6            [ 2]  672     RRCW Y 
      00A980 CD 87            [ 2]  673     LDW (2,X),Y 
      00A982 F8               [ 4]  674     RET
                                    675 
                                    676 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    677 ;  D2* ( d -- d*2 )
                                    678 ;  multiply double by 2 
                                    679 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00298F                        680     _HEADER D2STAR,3,"D2*"
      00A983 CD 85                    1         .word LINK 
                           002991     2         LINK=.
      00A985 51                       3         .byte 3  
      00A986 CD 99 0F                 4         .ascii "D2*"
      002995                          5         D2STAR:
      00A989 CD 86            [ 1]  681     LDW Y,X 
      00A98B A1 CD 95         [ 2]  682     LDW Y,(2,Y)
      00A98E 82               [ 1]  683     RCF 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 152.
Hexadecimal [24-Bits]



      00A98F CD 8C            [ 2]  684     RLCW Y 
      00A991 61 CD            [ 2]  685     LDW (2,X),Y 
      00A993 86 C9            [ 1]  686     LDW Y,X 
      00A995 CD 85            [ 2]  687     LDW Y,(Y)
      00A997 51 CD            [ 2]  688     RLCW Y 
      00A999 8C               [ 2]  689     LDW (X),Y 
      00A99A 61               [ 4]  690     RET 
                                    691 
                                    692 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    693 ;   DLSHIFT ( d n -- d )
                                    694 ;   left shift double 
                                    695 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0029A7                        696     _HEADER DLSHIFT,7,"DLSHIFT"
      00A99B CD 86                    1         .word LINK 
                           0029A9     2         LINK=.
      00A99D B1                       3         .byte 7  
      00A99E CD 85 51 CD A2 5C CD     4         .ascii "DLSHIFT"
      0029B1                          5         DLSHIFT:
      00A9A5 88 54            [ 1]  697     LD A,(1,X) ; shift count 
      00A9A7 CD 85 18         [ 2]  698     ADDW X,#2 
      00A9AA 99 5C            [ 1]  699     LDW Y,X 
      00A9AC CD 9D            [ 2]  700     LDW Y,(Y)
      00A9AE 04 CD A2         [ 2]  701     LDW YTEMP,Y  ; d hi 
      00A9B1 F0 81            [ 1]  702     LDW Y,X 
      00A9B3 A9 68 88         [ 2]  703     LDW Y,(2,Y)  ; d low 
      0029C2                        704 DLSHIFT1:
      00A9B6 32               [ 1]  705     TNZ A 
      00A9B7 4C 49            [ 1]  706     JREQ DLSHIFT2 
      00A9B9 54               [ 1]  707     RCF 
      00A9BA 45 52            [ 2]  708     RLCW Y 
      00A9BC 41 4C            [ 2]  709     PUSHW Y 
      00A9BE 90 BE 26         [ 2]  710     LDW Y,YTEMP 
      00A9BE CD 95            [ 2]  711     RLCW Y 
      00A9C0 C7 A9 C9         [ 2]  712     LDW YTEMP,Y 
      00A9C3 CD 95            [ 2]  713     POPW Y 
      00A9C5 82               [ 1]  714     DEC A 
      00A9C6 CC 95            [ 2]  715     JRA DLSHIFT1 
      0029D7                        716 DLSHIFT2:
      00A9C8 82 02            [ 2]  717     LDW (2,X),Y 
      00A9C9 90 BE 26         [ 2]  718     LDW Y,YTEMP 
      00A9C9 1D               [ 2]  719     LDW (X),Y 
      00A9CA 00               [ 4]  720     RET 
                                    721 
                                    722 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    723 ;  DRSHIFT ( d n -- d )
                                    724 ;  shift right n bits 
                                    725 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0029DE                        726     _HEADER DRSHIFT,7,"DRSHIFT"
      00A9CB 04 16                    1         .word LINK 
                           0029E0     2         LINK=.
      00A9CD 01                       3         .byte 7  
      00A9CE 90 FE FF 16 01 90 EE     4         .ascii "DRSHIFT"
      0029E8                          5         DRSHIFT:
      00A9D5 02 EF            [ 1]  727     LD A,(1,X)
      00A9D7 02 90            [ 1]  728     AND A,#0X1F 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 153.
Hexadecimal [24-Bits]



      00A9D9 85 90 EC         [ 2]  729     ADDW X,#2 
      0029EF                        730 DRSHIFT1:
      00A9DC 04               [ 1]  731     TNZ A 
      00A9DD A9 B5            [ 1]  732     JREQ DRSHIFT2 
      00A9DF 05 32            [ 1]  733     LDW Y,X 
      00A9E1 4F 56            [ 2]  734     LDW Y,(Y)
      00A9E3 45 52            [ 2]  735     SRAW Y 
      00A9E5 FF               [ 2]  736     LDW (X),Y 
      00A9E5 90 93            [ 1]  737     LDW Y,X 
      00A9E7 1D 00 04         [ 2]  738     LDW Y,(2,Y)
      00A9EA 90 89            [ 2]  739     RRCW Y 
      00A9EC 90 EE            [ 2]  740     LDW (2,X),Y 
      00A9EE 04               [ 1]  741     DEC A
      00A9EF FF 90            [ 2]  742     JRA DRSHIFT1  
      002A05                        743 DRSHIFT2:
      00A9F1 85               [ 4]  744     RET 
                                    745 
                                    746 
                                    747 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    748 ;   D* ( d1 d2 -- d3 )
                                    749 ;   double product 
                                    750 ;   
                                    751 ;   d3 = d1 * d2
                                    752 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002A06                        753     _HEADER DSTAR,2,"D*"
      00A9F2 90 EE                    1         .word LINK 
                           002A08     2         LINK=.
      00A9F4 06                       3         .byte 2  
      00A9F5 EF 02                    4         .ascii "D*"
      002A0B                          5         DSTAR:
      00A9F7 81 A9 DF         [ 4]  754     CALL DUPP 
      00A9FA 03 44 32         [ 4]  755     CALL ZLESS  
      00A9FD 2F 05 EA         [ 4]  756     CALL TOR    ; R: d2sign 
      00A9FE CD 26 30         [ 4]  757     CALL DABS   
      00A9FE 90 93 90         [ 4]  758     CALL RFROM 
      00AA01 FE 90 57         [ 4]  759     CALL NROT  ; d1 d2s ud2
      00AA04 FF 90 93         [ 4]  760     CALL DTOR  ; d1 d2s R: ud2  
      00AA07 90 EE 02         [ 4]  761     CALL TOR   ; d1 R: ud2 d2s   
      00AA0A 90 56 EF         [ 4]  762     CALL DUPP 
      00AA0D 02 81 A9         [ 4]  763     CALL ZLESS 
      00AA10 FA 03 44         [ 4]  764     CALL RFROM 
      00AA13 32 2A A7         [ 4]  765     CALL XORR   
      00AA15 CD 05 EA         [ 4]  766     CALL TOR   ; d1 R: ud2 prod_sign  
      00AA15 90 93 90         [ 4]  767     CALL DABS ; ud1 R: ud2 ps  
      00AA18 EE 02 98         [ 4]  768     CALL RFROM  
      00AA1B 90 59 EF         [ 4]  769     CALL NROT   ; ps ud1 
      00AA1E 02 90 93         [ 4]  770     CALL DDUP   ; ps ud1 ud1  
      00AA21 90 FE 90         [ 4]  771     CALL RFROM  ; ps ud1 ud1 ud2hi 
      00AA24 59 FF 81         [ 4]  772     CALL DSSTAR ; ps ud1 dprodhi 
                                    773 ; shift partial product 16 bits left 
      00AA27 AA 11 07         [ 4]  774     CALL DROP   ; drop overflow 
      00AA2A 44 4C 53         [ 4]  775     CALL ZERO   ; ps ud1 prodhi 
      00AA2D 48 49 46         [ 4]  776     CALL SWAPP  
      00AA30 54 27 52         [ 4]  777     CALL DSWAP  ; ps dprodhi ud1 
      00AA31 CD 05 34         [ 4]  778     CALL RFROM  ; ps dprodhi ud1 ud2lo
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 154.
Hexadecimal [24-Bits]



      00AA31 E6 01 1C         [ 4]  779     CALL DSSTAR ; ps  dprodhi dprodlo 
      00AA34 00 02 90         [ 4]  780     CALL DPLUS
      00AA37 93 90 FE         [ 4]  781     CALL ROT    ; dprod ps 
      002A5C                        782     _QBRAN DDSTAR3 
      00AA3A 90 BF 26         [ 4]    1     CALL QBRAN
      00AA3D 90 93                    2     .word DDSTAR3
      00AA3F 90 EE 02         [ 4]  783     CALL DNEGA 
      00AA42                        784 DDSTAR3:  
      00AA42 4D               [ 4]  785     RET 
                                    786 
                                    787 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    788 ;  UD/MOD ( ud1 ud2 -- dr udq )
                                    789 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002A65                        790     _HEADER UDSLMOD,6,"UD/MOD"
      00AA43 27 12                    1         .word LINK 
                           002A67     2         LINK=.
      00AA45 98                       3         .byte 6  
      00AA46 90 59 90 89 90 BE        4         .ascii "UD/MOD"
      002A6E                          5         UDSLMOD:
                                    791 ; unsigned double division 
      00AA4C 26 90 59         [ 4]  792     CALL ZERO 
      00AA4F 90 BF 26         [ 4]  793     CALL ZERO
      00AA52 90 85 4A         [ 4]  794     CALL DTOR ; quotient  R: qlo qhi 
      00AA55 20 EB 65         [ 4]  795     CALL DOVER 
      00AA57 CD 27 80         [ 4]  796     CALL DCLZ ; n2, dividend leading zeros  
      00AA57 EF 02 90         [ 4]  797     CALL TOR 
      00AA5A BE 26 FF         [ 4]  798     CALL DDUP    
      00AA5D 81 AA 29         [ 4]  799     CALL DCLZ  ; n1, divisor leading zeros
      00AA60 07 44 52         [ 4]  800     CALL RFROM ; n1 n2 
      00AA63 53 48 49         [ 4]  801     CALL SUBB  ; loop count 
      00AA66 46 54 21         [ 4]  802     CALL DUPP
      00AA68 CD 28 9E         [ 4]  803     CALL DTOR  ; ud1 ud2 R: qlo qhi cntr cntr 
      00AA68 E6 01 A4         [ 4]  804     CALL RAT    
      00AA6B 1F 1C 00         [ 4]  805     CALL ZLESS 
      002A98                        806     _TBRAN UDSLA7 ; quotient is null 
      00AA6E 02 04 A6         [ 4]    1     CALL TBRAN 
      00AA6F 2A FA                    2     .word UDSLA7 
      00AA6F 4D 27 13         [ 4]  807     CALL RAT 
      00AA72 90 93 90         [ 4]  808     CALL DLSHIFT ; align divisor with dividend 
      002AA3                        809 UDSLA3: ; division loop -- dividend divisor  
      00AA75 FE 90            [ 1]  810     CLRW Y 
      00AA77 57 FF            [ 2]  811     PUSHW Y  
      00AA79 90 93 90         [ 4]  812     CALL DOVER 
      00AA7C EE 02 90         [ 4]  813     CALL DOVER 
      00AA7F 56 EF 02         [ 4]  814     CALL DLESS 
      002AB0                        815     _TBRAN UDSLA4 
      00AA82 4A 20 EA         [ 4]    1     CALL TBRAN 
      00AA85 2A C9                    2     .word UDSLA4 
      00AA85 81 AA            [ 2]  816     POPW Y 
      00AA87 60 02 44 2A      [ 2]  817     ADDW Y,#1 
      00AA8B 90 89            [ 2]  818     PUSHW Y    ; quotiend least bit 
      00AA8B CD 86 A1         [ 4]  819     CALL DDUP  ; dividend divisor divisor 
      00AA8E CD 86 D8         [ 4]  820     CALL DTOR  
      00AA91 CD 86 6A         [ 4]  821     CALL DSUB  ; dividend-divisor 
      00AA94 CD A6 B0         [ 4]  822     CALL DRFROM  ; dividend- divisor  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 155.
Hexadecimal [24-Bits]



      002AC9                        823 UDSLA4: ; shift quotient and add 1 bit 
      00AA97 CD 85            [ 2]  824     POPW Y 
      00AA99 B4 CD 88         [ 2]  825     LDW YTEMP,Y 
      00AA9C 84 CD            [ 2]  826     LDW Y,(7,SP) ; quotient low 
      00AA9E A9               [ 1]  827     RCF 
      00AA9F 1E CD            [ 2]  828     RLCW Y
      00AAA1 86 6A            [ 2]  829     LDW (7,SP),Y 
      00AAA3 CD 86            [ 2]  830     LDW Y,(5,SP) ; quotient hi 
      00AAA5 A1 CD            [ 2]  831     RLCW Y 
      00AAA7 86 D8            [ 2]  832     LDW (5,SP),Y 
      00AAA9 CD 85            [ 2]  833     LDW Y,(7,SP) 
      00AAAB B4 CD 87 27      [ 2]  834     ADDW Y,YTEMP
      00AAAF CD 86            [ 2]  835     LDW (7,SP),Y 
      00AAB1 6A CD            [ 2]  836     LDW Y,(1,SP) ; loop counter 
      00AAB3 A6 B0            [ 2]  837     TNZW Y 
      00AAB5 CD 85            [ 1]  838     JREQ UDSLA8
      00AAB7 B4 CD 88 84      [ 2]  839     SUBW Y,#1  
      00AABB CD 88            [ 2]  840     LDW (1,SP),Y  
                                    841 ; shift dividend left 1 bit      
      00AABD B1 CD 85         [ 4]  842     CALL DSWAP 
      00AAC0 B4 CD A7         [ 4]  843     CALL D2STAR 
      00AAC3 AC CD 86         [ 4]  844     CALL DSWAP 
      00AAC6 97 CD            [ 2]  845     JRA UDSLA3 
      002AFA                        846 UDSLA7:
      00AAC8 8C 61 CD         [ 4]  847     CALL ZERO 
      002AFD                        848     _DOLIT 1 
      00AACB 86 B1 CD         [ 4]    1     CALL DOLIT 
      00AACE A7 D2                    2     .word 1 
      00AAD0 CD 85 B4         [ 4]  849     CALL NRSTO ; R: 0 0 0 cntr    
      002B05                        850 UDSLA8:
      00AAD3 CD A7 AC         [ 2]  851     ADDW X,#4 ; drop divisor
      00AAD6 CD AB DF         [ 4]  852     CALL RFROM  
      00AAD9 CD 88 65         [ 4]  853     CALL DROP ; drop cntr 
      00AADC CD 85 18         [ 4]  854     CALL RFROM   ; shift count
      00AADF AA E4 CD         [ 4]  855     CALL DRSHIFT 
                                    856     ; quotient replace dividend 
      00AAE2 89 16 BC         [ 4]  857     CALL DRFROM  ; quotient 
      00AAE4 81               [ 4]  858     RET 
                                    859 
                                    860 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    861 ;   D/MOD  ( d1 d2 -- dr dq )
                                    862 ;   double division dq=d1/d2
                                    863 ;   dr remainder double 
                                    864 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002B18                        865     _HEADER DDSLMOD,5,"D/MOD"  
      00AAE4 81 AA                    1         .word LINK 
                           002B1A     2         LINK=.
      00AAE6 88                       3         .byte 5  
      00AAE7 06 55 44 2F 4D           4         .ascii "D/MOD"
      002B20                          5         DDSLMOD:
      00AAEC 4F 44 47         [ 4]  866     CALL DSIGN 
      00AAEE CD 05 EA         [ 4]  867     CALL TOR   ; R: divisor sign 
      00AAEE CD 8C 61         [ 4]  868     CALL DABS 
      00AAF1 CD 8C 61         [ 4]  869     CALL DSWAP 
      00AAF4 CD A9 1E         [ 4]  870     CALL DSIGN ; dividend sign 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 156.
Hexadecimal [24-Bits]



      00AAF7 CD A9 E5         [ 4]  871     CALL RFROM 
      00AAFA CD A8 00         [ 4]  872     CALL XORR  ; quotient sign
      00AAFD CD 86 6A         [ 4]  873     CALL TOR   ; 
      00AB00 CD 88 B1         [ 4]  874     CALL DABS  ; d2 ud1 R: sign 
      00AB03 CD A8 00         [ 4]  875     CALL DSWAP  ; ud1 ud2 
      00AB06 CD 85 B4         [ 4]  876     CALL UDSLMOD ; ud1/ud2 -- dr dq  
      00AB09 CD 89            [ 2]  877     POPW Y ; sign 
      00AB0B 50 CD            [ 2]  878     TNZW Y 
      00AB0D 86 A1            [ 1]  879     JRPL DSLA9 
      00AB0F CD A9 1E         [ 4]  880     CALL DNEGA ; remainder quotient 
      002B4A                        881 DSLA9: 
      00AB12 CD               [ 4]  882     RET 
                                    883 
                                    884 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    885 ;   D/  ( d1 d2 -- dq )
                                    886 ;   division double by double 
                                    887 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002B4B                        888     _HEADER DSLASH,2,"D/"
      00AB13 85 C5                    1         .word LINK 
                           002B4D     2         LINK=.
      00AB15 CD                       3         .byte 2  
      00AB16 86 D8                    4         .ascii "D/"
      002B50                          5         DSLASH:
      00AB18 CD 85 26         [ 4]  889     CALL DDSLMOD
      00AB1B AB 7A CD         [ 4]  890     CALL DSWAP
      00AB1E 85 C5 CD         [ 4]  891     CALL DDROP 
      00AB21 AA               [ 4]  892     RET 
                                    893 
                                    894 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    895 ;   D+ ( d1 d2 -- d3 )
                                    896 ;   add 2 doubles 
                                    897 ;   d3=d1+d2 
                                    898 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002B5A                        899     _HEADER DPLUS,2,"D+"
      00AB22 31 4D                    1         .word LINK 
                           002B5C     2         LINK=.
      00AB23 02                       3         .byte 2  
      00AB23 90 5F                    4         .ascii "D+"
      002B5F                          5         DPLUS:
      00AB25 90 89            [ 1]  900     LDW Y,X 
      00AB27 CD A9            [ 2]  901     LDW Y,(Y)
      00AB29 E5 CD A9         [ 2]  902     LDW YTEMP,Y ; d2 hi 
      00AB2C E5 CD            [ 1]  903     LDW Y,X 
      00AB2E A8 EC CD         [ 2]  904     LDW Y,(2,Y)
      00AB31 85 26 AB         [ 2]  905     LDW XTEMP,Y ; d2 lo 
      00AB34 49 90 85         [ 2]  906     ADDW X,#4 
      00AB37 72 A9            [ 1]  907     LDW Y,X 
      00AB39 00 01 90         [ 2]  908     LDW Y,(2,Y) ; d1 lo
      00AB3C 89 CD 88 B1      [ 2]  909     ADDW Y,XTEMP
      00AB40 CD A9            [ 2]  910     LDW (2,X),Y 
      00AB42 1E CD            [ 1]  911     LDW Y,X 
      00AB44 AC 11            [ 2]  912     LDW Y,(Y) ; d1 hi 
      00AB46 CD A9            [ 1]  913     JRNC DPLUS1 
      00AB48 3C A9 00 01      [ 2]  914     ADDW Y,#1 
      00AB49                        915 DPLUS1: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 157.
Hexadecimal [24-Bits]



      00AB49 90 85 90 BF      [ 2]  916     ADDW Y,YTEMP 
      00AB4D 26               [ 2]  917     LDW (X),Y 
      00AB4E 16               [ 4]  918     RET 
                                    919 
                                    920 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    921 ;   D- ( d1 d2 -- d3 )
                                    922 ;   d3=d1-d2 
                                    923 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002B8C                        924     _HEADER DSUB,2,"D-"
      00AB4F 07 98                    1         .word LINK 
                           002B8E     2         LINK=.
      00AB51 90                       3         .byte 2  
      00AB52 59 17                    4         .ascii "D-"
      002B91                          5         DSUB:
      00AB54 07 16            [ 1]  925     LDW Y,X 
      00AB56 05 90            [ 2]  926     LDW Y,(Y)
      00AB58 59 17 05         [ 2]  927     LDW YTEMP,Y ; d2 hi 
      00AB5B 16 07            [ 1]  928     LDW Y,X 
      00AB5D 72 B9 00         [ 2]  929     LDW Y,(2,Y)
      00AB60 26 17 07         [ 2]  930     LDW XTEMP,Y ; d2 lo 
      00AB63 16 01 90         [ 2]  931     ADDW X,#4 
      00AB66 5D 27            [ 1]  932     LDW Y,X 
      00AB68 1C 72 A2         [ 2]  933     LDW Y,(2,Y) ; d1 lo
      00AB6B 00 01 17 01      [ 2]  934     SUBW Y,XTEMP
      00AB6F CD A7            [ 2]  935     LDW (2,X),Y 
      00AB71 D2 CD            [ 1]  936     LDW Y,X 
      00AB73 AA 15            [ 2]  937     LDW Y,(Y) ; d1 hi 
      00AB75 CD A7            [ 1]  938     JRNC DSUB1 
      00AB77 D2 20 A9 01      [ 2]  939     SUBW Y,#1 
      00AB7A                        940 DSUB1: 
      00AB7A CD 8C 61 CD      [ 2]  941     SUBW Y,YTEMP 
      00AB7E 84               [ 2]  942     LDW (X),Y 
      00AB7F EF               [ 4]  943     RET 
                                    944 
                                    945 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 158.
Hexadecimal [24-Bits]



                                   4513 .endif 
                           000001  4514 .if WANT_FLOAT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 159.
Hexadecimal [24-Bits]



                                   4515         .include "float.asm"
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 160.
Hexadecimal [24-Bits]



                                     55 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002BBE                         56     _HEADER FVER,9,"FLOAT-VER"
      00AB80 00 01                    1         .word LINK 
                           002BC0     2         LINK=.
      00AB82 CD                       3         .byte 9  
      00AB83 86 44 4F 41 54 2D 56     4         .ascii "FLOAT-VER"
             45 52
      00AB85                          5         FVER:
      00AB85 1C 00 04         [ 4]   57     CALL CR 
      00AB88 CD 85 B4         [ 4]   58     CALL DOTQP 
      00AB8B CD                      59     .byte  17 
      00AB8C 86 97 CD 85 B4 CD AA    60     .ascii "float32 library, "
             68 CD A9 3C 81 AA E7
             05 44 2F
      00AB9D 4D 4F 44         [ 4]   61     CALL PRT_LICENCE 
      00ABA0 CD 0F 86         [ 4]   62     CALL DOTQP 
      00ABA0 CD                      63     .byte 33 
      00ABA1 A6 C7 CD 86 6A CD A6    64     .ascii "Jacques Deschenes, Copyright 2021"
             B0 CD A7 D2 CD A6 C7
             CD 85 B4 CD 87 27 CD
             86 6A CD A6 B0 CD A7
             D2 CD AA EE 90
      00ABC2 85 90 5D         [ 4]   65     CALL CR 
      002C0D                         66     _DOLIT FLOAT_MAJOR     
      00ABC5 2A 03 CD         [ 4]    1     CALL DOLIT 
      00ABC8 89 16                    2     .word FLOAT_MAJOR 
      00ABCA                         67     _DOLIT FLOAT_MINOR 
      00ABCA 81 AB 9A         [ 4]    1     CALL DOLIT 
      00ABCD 02 44                    2     .word FLOAT_MINOR 
      00ABCF 2F 1A C3         [ 2]   68     JP PRINT_VERSION 
                                     69 
                                     70 
                                     71 ;-------------------------
                                     72 ;    FPSW ( -- a )
                                     73 ;    floating state variable
                                     74 ;    bit 0 zero flag 
                                     75 ;    bit 1 negative flag 
                                     76 ;    bit 2 overflow/error flag 
                                     77 ;---------------------------
      00ABD0                         78     _HEADER FPSW,4,"FPSW"
      00ABD0 CD AB                    1         .word LINK 
                           002C1C     2         LINK=.
      00ABD2 A0                       3         .byte 4  
      00ABD3 CD A7 D2 CD              4         .ascii "FPSW"
      002C21                          5         FPSW:
      00ABD7 88 A6 81 AB      [ 2]   79 	LDW Y,#UFPSW  
      00ABDB CD 02 44         [ 2]   80 	SUBW X,#2
      00ABDE 2B               [ 2]   81     LDW (X),Y
      00ABDF 81               [ 4]   82     RET
                                     83 
                                     84 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     85 ;   FRESET ( -- )
                                     86 ;   reset FPSW variable 
                                     87 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
      002C2A                         88     _HEADER FRESET,6,"FRESET"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 161.
Hexadecimal [24-Bits]



      00ABDF 90 93                    1         .word LINK 
                           002C2C     2         LINK=.
      00ABE1 90                       3         .byte 6  
      00ABE2 FE 90 BF 26 90 93        4         .ascii "FRESET"
      002C33                          5         FRESET:
      00ABE8 90 EE 02         [ 4]   89     CALL ZERO  
      00ABEB 90 BF 24         [ 4]   90     CALL FPSW 
      00ABEE 1C 00 04         [ 4]   91     CALL STORE 
      00ABF1 90               [ 4]   92     RET 
                                     93 
                                     94 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     95 ;   FINIT ( -- )
                                     96 ;   initialize floating point 
                                     97 ;   library 
                                     98 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002C3D                         99     _HEADER FINIT,5,"FINIT"
      00ABF2 93 90                    1         .word LINK 
                           002C3F     2         LINK=.
      00ABF4 EE                       3         .byte 5  
      00ABF5 02 72 B9 00 24           4         .ascii "FINIT"
      002C45                          5         FINIT:
      00ABFA EF 02 90         [ 4]  100     CALL FRESET 
      00ABFD 93               [ 4]  101     RET 
                                    102 
                                    103 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    104 ;    FER ( -- u )
                                    105 ;    return FPSW value 
                                    106 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002C49                        107     _HEADER FER,3,"FER"
      00ABFE 90 FE                    1         .word LINK 
                           002C4B     2         LINK=.
      00AC00 24                       3         .byte 3  
      00AC01 04 72 A9                 4         .ascii "FER"
      002C4F                          5         FER:
      00AC04 00 01 21         [ 4]  108     CALL FPSW 
      00AC06 CD 04 E3         [ 4]  109     CALL AT 
      00AC06 72               [ 4]  110     RET 
                                    111 
                                    112 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    113 ;    FZE  ( -- 0|-1 )
                                    114 ;    return FPSW zero flag 
                                    115 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002C56                        116     _HEADER FZE,3,"FZE"
      00AC07 B9 00                    1         .word LINK 
                           002C58     2         LINK=.
      00AC09 26                       3         .byte 3  
      00AC0A FF 81 AB                 4         .ascii "FZE"
      002C5C                          5         FZE:
      00AC0D DC 02 44         [ 4]  117     CALL FPSW
      00AC10 2D 04 E3         [ 4]  118     CALL AT  
      00AC11 CD 0B EC         [ 4]  119     CALL ONE 
      00AC11 90 93 90         [ 4]  120     CALL ANDD
      00AC14 FE 90 BF         [ 4]  121     CALL NEGAT  
      00AC17 26               [ 4]  122     RET 
                                    123 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 162.
Hexadecimal [24-Bits]



                                    124 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    125 ;    FNE ( -- 0|-1 )
                                    126 ;    return FPSW negative flag 
                                    127 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002C6C                        128     _HEADER FNE,3,"FNE"
      00AC18 90 93                    1         .word LINK 
                           002C6E     2         LINK=.
      00AC1A 90                       3         .byte 3  
      00AC1B EE 02 90                 4         .ascii "FNE"
      002C72                          5         FNE:
      00AC1E BF 24 1C         [ 4]  129     CALL FPSW 
      00AC21 00 04 90         [ 4]  130     CALL AT 
      002C78                        131     _DOLIT 2 
      00AC24 93 90 EE         [ 4]    1     CALL DOLIT 
      00AC27 02 72                    2     .word 2 
      00AC29 B2 00 24         [ 4]  132     CALL ANDD
      00AC2C EF 02 90         [ 4]  133     CALL TWOSL
      00AC2F 93 90 FE         [ 4]  134     CALL NEGAT   
      00AC32 24               [ 4]  135     RET 
                                    136 
                                    137 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    138 ;   FOV (  -- 0|-1 )
                                    139 ;   return FPSW overflow flag 
                                    140 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002C87                        141     _HEADER FOV,3,"FOV"
      00AC33 04 72                    1         .word LINK 
                           002C89     2         LINK=.
      00AC35 A2                       3         .byte 3  
      00AC36 00 01 56                 4         .ascii "FOV"
      00AC38                          5         FOV:
      00AC38 72 B2 00         [ 4]  142     CALL FPSW
      00AC3B 26 FF 81         [ 4]  143     CALL AT  
      002C93                        144     _DOLIT 4 
      00AC3E AC 0E 09         [ 4]    1     CALL DOLIT 
      00AC41 46 4C                    2     .word 4 
      00AC43 4F 41 54         [ 4]  145     CALL ANDD
      002C9B                        146     _DOLIT 2 
      00AC46 2D 56 45         [ 4]    1     CALL DOLIT 
      00AC49 52 02                    2     .word 2 
      00AC4A CD 0B AF         [ 4]  147     CALL RSHIFT 
      00AC4A CD 8F D9         [ 4]  148     CALL NEGAT  
      00AC4D CD               [ 4]  149     RET 
                                    150 
                                    151 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    152 ;    SFZ ( f# -- f# )
                                    153 ;    set FPSW zero flag 
                                    154 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002CA7                        155     _HEADER SFZ,3,"SFZ"
      00AC4E 90 06                    1         .word LINK 
                           002CA9     2         LINK=.
      00AC50 11                       3         .byte 3  
      00AC51 66 6C 6F                 4         .ascii "SFZ"
      002CAD                          5         SFZ:
      00AC54 61 74 33         [ 4]  156     CALL FER 
      002CB0                        157     _DOLIT 0xfffe 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 163.
Hexadecimal [24-Bits]



      00AC57 32 20 6C         [ 4]    1     CALL DOLIT 
      00AC5A 69 62                    2     .word 0xfffe 
      00AC5C 72 61 72         [ 4]  158     CALL ANDD 
      00AC5F 79 2C 20         [ 4]  159     CALL TOR    
      00AC62 CD 9B 2F         [ 4]  160     CALL DDUP 
      002CBE                        161     _DOLIT 0xFF  
      00AC65 CD 90 06         [ 4]    1     CALL DOLIT 
      00AC68 21 4A                    2     .word 0xFF 
      00AC6A 61 63 71         [ 4]  162     CALL ANDD
      00AC6D 75 65 73         [ 4]  163     CALL DZEQUAL 
      002CC9                        164     _DOLIT 1 
      00AC70 20 44 65         [ 4]    1     CALL DOLIT 
      00AC73 73 63                    2     .word 1 
      00AC75 68 65 6E         [ 4]  165     CALL ANDD 
      00AC78 65 73 2C         [ 4]  166     CALL RFROM 
      00AC7B 20 43 6F         [ 4]  167     CALL ORR 
      00AC7E 70 79 72         [ 4]  168     CALL FPSW 
      00AC81 69 67 68         [ 4]  169     CALL STORE 
      00AC84 74               [ 4]  170     RET 
                                    171 
                                    172 
                                    173 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    174 ;   SFN ( f# -- f# )
                                    175 ;   set FPSW negative flag 
                                    176 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002CDE                        177     _HEADER SFN,3,"SFN"
      00AC85 20 32                    1         .word LINK 
                           002CE0     2         LINK=.
      00AC87 30                       3         .byte 3  
      00AC88 32 31 CD                 4         .ascii "SFN"
      002CE4                          5         SFN:
      00AC8B 8F D9 CD         [ 4]  178     CALL FER 
      002CE7                        179     _DOLIT 0xFFFD 
      00AC8E 84 EF 00         [ 4]    1     CALL DOLIT 
      00AC91 01 CD                    2     .word 0xFFFD 
      00AC93 84 EF 00         [ 4]  180     CALL ANDD  
      00AC96 00 CC 9B         [ 4]  181     CALL TOR 
      00AC99 43 AC 40         [ 4]  182     CALL DUPP 
      002CF5                        183     _DOLIT 0X80 
      00AC9C 04 46 50         [ 4]    1     CALL DOLIT 
      00AC9F 53 57                    2     .word 0X80 
      00ACA1 CD 06 7E         [ 4]  184     CALL ANDD 
      002CFD                        185     _DOLIT 6 
      00ACA1 90 AE 00         [ 4]    1     CALL DOLIT 
      00ACA4 08 1D                    2     .word 6 
      00ACA6 00 02 FF         [ 4]  186     CALL RSHIFT 
      00ACA9 81 AC 9C         [ 4]  187     CALL RFROM 
      00ACAC 06 46 52         [ 4]  188     CALL ORR 
      00ACAF 45 53 45         [ 4]  189     CALL FPSW 
      00ACB2 54 04 D1         [ 4]  190     CALL STORE 
      00ACB3 81               [ 4]  191     RET 
                                    192 
                                    193 
                                    194 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    195 ;   SFV ( -- )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 164.
Hexadecimal [24-Bits]



                                    196 ;   set overflow flag 
                                    197 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002D12                        198     _HEADER SFV,3,"SFV"
      00ACB3 CD 8C                    1         .word LINK 
                           002D14     2         LINK=.
      00ACB5 61                       3         .byte 3  
      00ACB6 CD AC A1                 4         .ascii "SFV"
      002D18                          5         SFV:
      00ACB9 CD 85 51         [ 4]  199     CALL FER 
      002D1B                        200     _DOLIT 4 
      00ACBC 81 AC AC         [ 4]    1     CALL DOLIT 
      00ACBF 05 46                    2     .word 4 
      00ACC1 49 4E 49         [ 4]  201     CALL ORR 
      00ACC4 54 2C 21         [ 4]  202     CALL FPSW 
      00ACC5 CD 04 D1         [ 4]  203     CALL STORE 
      00ACC5 CD               [ 4]  204     RET 
                                    205 
                                    206 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    207 ;  F>ME ( f# -- m e )
                                    208 ;  split float in mantissa/exponent 
                                    209 ;  m mantissa as a double 
                                    210 ;  e exponent as a single 
                                    211 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002D2A                        212     _HEADER ATEXP,4,"F>ME"             
      00ACC6 AC B3                    1         .word LINK 
                           002D2C     2         LINK=.
      00ACC8 81                       3         .byte 4  
      00ACC9 AC BF 03 46              4         .ascii "F>ME"
      002D31                          5         ATEXP:
      00ACCD 45 52 33         [ 4]  213     CALL FRESET
      00ACCF CD 2C E4         [ 4]  214     CALL SFN
      00ACCF CD AC A1         [ 4]  215     CALL SFZ 
      00ACD2 CD 85            [ 1]  216     LDW Y,X 
      00ACD4 63 81            [ 2]  217     LDW Y,(Y)
      00ACD6 AC CB            [ 2]  218     PUSHW Y 
      00ACD8 03               [ 1]  219     CLR A  
      00ACD9 46 5A            [ 1]  220     SWAPW Y 
      00ACDB 45 01            [ 1]  221     JRPL ATEXP1 
      00ACDC 43               [ 1]  222     CPL A 
      002D46                        223 ATEXP1: ; sign extend mantissa 
      00ACDC CD AC            [ 1]  224     SWAPW Y 
      00ACDE A1 CD            [ 1]  225     LD YH,A 
      00ACE0 85               [ 2]  226     LDW (X),Y 
      00ACE1 63 CD 8C         [ 2]  227     SUBW X,#CELLL 
      00ACE4 6C CD            [ 2]  228     POPW Y 
      00ACE6 86               [ 1]  229     CLR A 
      00ACE7 FE CD            [ 2]  230     TNZW Y 
      00ACE9 89 04            [ 1]  231     JRPL ATEXP2 
      00ACEB 81               [ 1]  232     CPL A 
      002D56                        233 ATEXP2:
      00ACEC AC D8            [ 1]  234     SWAPW Y 
      00ACEE 03 46            [ 1]  235     LD YH,A 
      00ACF0 4E               [ 2]  236     LDW (X),Y 
      00ACF1 45               [ 4]  237     RET 
                                    238 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 165.
Hexadecimal [24-Bits]



                                    239 
                                    240 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    241 ;    ME>F ( m e -- f# )
                                    242 ;    built float from mantissa/exponent 
                                    243 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00ACF2                        244     _HEADER STEXP,4,"ME>F"
      00ACF2 CD AC                    1         .word LINK 
                           002D5E     2         LINK=.
      00ACF4 A1                       3         .byte 4  
      00ACF5 CD 85 63 CD              4         .ascii "ME>F"
      002D63                          5         STEXP:
      00ACF9 84 EF 00         [ 4]  245     CALL DUPP 
      00ACFC 02 CD 86         [ 4]  246     CALL ABSS 
      002D69                        247     _DOLIT 127 
      00ACFF FE CD 8C         [ 4]    1     CALL DOLIT 
      00AD02 47 CD                    2     .word 127 
      00AD04 89 04 81         [ 4]  248     CALL GREAT
      002D71                        249     _QBRAN STEXP1
      00AD07 AC EE 03         [ 4]    1     CALL QBRAN
      00AD0A 46 4F                    2     .word STEXP1
      00AD0C 56 2D 18         [ 4]  250     CALL SFV
      00AD0D                        251 STEXP1:
      00AD0D CD AC            [ 1]  252     LDW Y,X 
      00AD0F A1 CD            [ 2]  253     LDW Y,(Y)
      00AD11 85               [ 1]  254     CLR A 
      00AD12 63 CD            [ 1]  255     LD YH,A
      00AD14 84 EF            [ 1]  256     SWAPW Y 
      00AD16 00 04            [ 2]  257     PUSHW Y  ; e >r 
      00AD18 CD 86 FE         [ 2]  258     ADDW X,#CELLL 
      00AD1B CD 84 EF         [ 4]  259     CALL DDUP 
      00AD1E 00 02 CD         [ 4]  260     CALL DABS
      00AD21 8C 2F CD         [ 4]  261     CALL SWAPP 
      00AD24 89 04 81         [ 4]  262     CALL DROP  
      002D93                        263     _DOLIT 127 
      00AD27 AD 09 03         [ 4]    1     CALL DOLIT 
      00AD2A 53 46                    2     .word 127 
      00AD2C 5A 09 73         [ 4]  264     CALL GREAT 
      00AD2D                        265     _QBRAN STEXP2 
      00AD2D CD AC CF         [ 4]    1     CALL QBRAN
      00AD30 CD 84                    2     .word STEXP2
      00AD32 EF FF FE         [ 4]  266     CALL SFV 
      002DA3                        267 STEXP2: 
      00AD35 CD               [ 1]  268     CLR A 
      00AD36 86               [ 1]  269     LD (X),A     
      00AD37 FE CD 86         [ 4]  270     CALL RFROM 
      00AD3A 6A CD 88         [ 4]  271     CALL ORR
      00AD3D B1 CD 84         [ 4]  272     CALL SFZ 
      00AD40 EF 00 FF         [ 4]  273     CALL SFN 
      00AD43 CD               [ 4]  274     RET 
                                    275 
                                    276 
                                    277 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    278 ;   E. ( f# -- )
                                    279 ;   print float in scientific 
                                    280 ;   format 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 166.
Hexadecimal [24-Bits]



                                    281 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002DB2                        282     _HEADER EDOT,2,"E."
      00AD44 86 FE                    1         .word LINK 
                           002DB4     2         LINK=.
      00AD46 CD                       3         .byte 2  
      00AD47 A8 A7                    4         .ascii "E."
      002DB7                          5         EDOT:
      00AD49 CD 84 EF         [ 4]  283     CALL BASE 
      00AD4C 00 01 CD         [ 4]  284     CALL AT 
      00AD4F 86 FE CD         [ 4]  285     CALL TOR 
      002DC0                        286     _DOLIT 10 
      00AD52 85 B4 CD         [ 4]    1     CALL DOLIT 
      00AD55 87 12                    2     .word 10 
      00AD57 CD AC A1         [ 4]  287     CALL BASE 
      00AD5A CD 85 51         [ 4]  288     CALL STORE 
      00AD5D 81 AD 29         [ 4]  289     CALL ATEXP ; m e 
      002DCE                        290 EDOT0:
      00AD60 03 53 46         [ 4]  291     CALL TOR   
      00AD63 4E 26 30         [ 4]  292     CALL DABS 
      00AD64 CD 0F 17         [ 4]  293     CALL SPACE 
      00AD64 CD AC CF         [ 4]  294     CALL BDIGS     
      002DDA                        295 EDOT2: 
      00AD67 CD 84 EF         [ 4]  296     CALL DDIG
      00AD6A FF FD CD         [ 4]  297     CALL RFROM 
      00AD6D 86 FE CD         [ 4]  298     CALL ONEP 
      00AD70 86 6A CD         [ 4]  299     CALL TOR 
      00AD73 86 A1 CD         [ 4]  300     CALL DUPP
      002DE9                        301     _QBRAN EDOT3 
      00AD76 84 EF 00         [ 4]    1     CALL QBRAN
      00AD79 80 CD                    2     .word EDOT3
      002DEE                        302     _BRAN EDOT2  
      00AD7B 86 FE CD         [ 4]    1     CALL BRAN 
      00AD7E 84 EF                    2     .word EDOT2 
      002DF3                        303 EDOT3:
      00AD80 00 06 CD         [ 4]  304     CALL OVER 
      00AD83 8C 2F CD         [ 4]  305     CALL BASE 
      00AD86 85 B4 CD         [ 4]  306     CALL AT 
      00AD89 87 12 CD         [ 4]  307     CALL ULESS 
      002DFF                        308     _QBRAN EDOT2 
      00AD8C AC A1 CD         [ 4]    1     CALL QBRAN
      00AD8F 85 51                    2     .word EDOT2
      002E04                        309     _DOLIT '.'
      00AD91 81 AD 60         [ 4]    1     CALL DOLIT 
      00AD94 03 53                    2     .word '.' 
      00AD96 46 56 EB         [ 4]  310     CALL HOLD  
      00AD98 CD 26 A2         [ 4]  311     CALL DDIG
      00AD98 CD AC CF         [ 4]  312     CALL FNE 
      002E12                        313     _QBRAN EDOT4 
      00AD9B CD 84 EF         [ 4]    1     CALL QBRAN
      00AD9E 00 04                    2     .word EDOT4
      002E17                        314     _DOLIT '-'
      00ADA0 CD 87 12         [ 4]    1     CALL DOLIT 
      00ADA3 CD AC                    2     .word '-' 
      00ADA5 A1 CD 85         [ 4]  315     CALL HOLD 
      002E1F                        316 EDOT4:       
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 167.
Hexadecimal [24-Bits]



      00ADA8 51 81 AD         [ 4]  317     CALL DROP 
      00ADAB 94 04 46         [ 4]  318     CALL EDIGS 
      00ADAE 3E 4D 45         [ 4]  319     CALL TYPES
      00ADB1 CD 05 34         [ 4]  320     CALL RFROM 
      00ADB1 CD AC B3         [ 4]  321     CALL QDUP 
      002E2E                        322     _QBRAN EDOT5     
      00ADB4 CD AD 64         [ 4]    1     CALL QBRAN
      00ADB7 CD AD                    2     .word EDOT5
      002E33                        323     _DOLIT 'E'
      00ADB9 2D 90 93         [ 4]    1     CALL DOLIT 
      00ADBC 90 FE                    2     .word 'E' 
      00ADBE 90 89 4F         [ 4]  324     CALL EMIT 
      00ADC1 90 5E 2A         [ 4]  325     CALL DOT
      002E3E                        326 EDOT5: 
      00ADC4 01 43 34         [ 4]  327     CALL RFROM 
      00ADC6 CD 06 E7         [ 4]  328     CALL BASE 
      00ADC6 90 5E 90         [ 4]  329     CALL STORE  
      00ADC9 95               [ 4]  330     RET 
                                    331 
                                    332 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                    333 ;   F. (f# -- )
                                    334 ;   print float in fixed
                                    335 ;   point format. 
                                    336 ;;;;;;;;;;;;;;;;;;;;;;;;;
      002E48                        337     _HEADER FDOT,2,"F."
      00ADCA FF 1D                    1         .word LINK 
                           002E4A     2         LINK=.
      00ADCC 00                       3         .byte 2  
      00ADCD 02 90                    4         .ascii "F."
      002E4D                          5         FDOT:
      00ADCF 85 4F 90         [ 4]  338     CALL BASE 
      00ADD2 5D 2A 01         [ 4]  339     CALL AT 
      00ADD5 43 05 EA         [ 4]  340     CALL TOR 
      00ADD6                        341     _DOLIT 10 
      00ADD6 90 5E 90         [ 4]    1     CALL DOLIT 
      00ADD9 95 FF                    2     .word 10 
      00ADDB 81 AD AC         [ 4]  342     CALL BASE 
      00ADDE 04 4D 45         [ 4]  343     CALL STORE 
      00ADE1 3E 46 31         [ 4]  344     CALL    ATEXP
      00ADE3 CD 06 21         [ 4]  345     CALL    DUPP  
      00ADE3 CD 86 A1         [ 4]  346     CALL    ABSS 
      002E6A                        347     _DOLIT  8
      00ADE6 CD 89 6A         [ 4]    1     CALL DOLIT 
      00ADE9 CD 84                    2     .word 8 
      00ADEB EF 00 7F         [ 4]  348     CALL    GREAT 
      002E72                        349     _QBRAN  FDOT1 
      00ADEE CD 89 F3         [ 4]    1     CALL QBRAN
      00ADF1 CD 85                    2     .word FDOT1
      00ADF3 18 AD F9         [ 2]  350     JP      EDOT0 
      002E7A                        351 FDOT1:
      00ADF6 CD AD 98         [ 4]  352     CALL    SPACE 
      00ADF9 CD 05 EA         [ 4]  353     CALL    TOR 
      00ADF9 90 93 90         [ 4]  354     CALL    FNE 
      002E83                        355     _QBRAN  FDOT0 
      00ADFC FE 4F 90         [ 4]    1     CALL QBRAN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 168.
Hexadecimal [24-Bits]



      00ADFF 95 90                    2     .word FDOT0
      00AE01 5E 90 89         [ 4]  356     CALL    DNEGA 
      002E8B                        357 FDOT0: 
      00AE04 1C 00 02         [ 4]  358     CALL    BDIGS
      00AE07 CD 88 B1         [ 4]  359     CALL    RAT  
      00AE0A CD A6 B0         [ 4]  360     CALL    ZLESS 
      002E94                        361     _QBRAN  FDOT6 
      00AE0D CD 86 B1         [ 4]    1     CALL QBRAN
      00AE10 CD 86                    2     .word FDOT6
      002E99                        362 FDOT2: ; e<0 
      00AE12 97 CD 84         [ 4]  363     CALL    DDIG 
      00AE15 EF 00 7F         [ 4]  364     CALL    RFROM
      00AE18 CD 89 F3         [ 4]  365     CALL    ONEP 
      00AE1B CD 85 18         [ 4]  366     CALL    QDUP 
      002EA5                        367     _QBRAN  FDOT3 
      00AE1E AE 23 CD         [ 4]    1     CALL QBRAN
      00AE21 AD 98                    2     .word FDOT3
      00AE23 CD 05 EA         [ 4]  368     CALL    TOR 
      002EAD                        369     _BRAN   FDOT2 
      00AE23 4F F7 CD         [ 4]    1     CALL BRAN 
      00AE26 85 B4                    2     .word FDOT2 
      002EB2                        370 FDOT3:
      002EB2                        371     _DOLIT  '.' 
      00AE28 CD 87 12         [ 4]    1     CALL DOLIT 
      00AE2B CD AD                    2     .word '.' 
      00AE2D 2D CD AD         [ 4]  372     CALL    HOLD 
      00AE30 64 81 AD         [ 4]  373     CALL    DDIGS
      002EBD                        374     _BRAN   FDOT9  
      00AE33 DE 02 45         [ 4]    1     CALL BRAN 
      00AE36 2E D7                    2     .word FDOT9 
      00AE37                        375 FDOT6: ; e>=0 
      002EC2                        376     _BRAN   FDOT8
      00AE37 CD 87 67         [ 4]    1     CALL BRAN 
      00AE3A CD 85                    2     .word FDOT8 
      002EC7                        377 FDOT7:     
      002EC7                        378     _DOLIT  '0'
      00AE3C 63 CD 86         [ 4]    1     CALL DOLIT 
      00AE3F 6A CD                    2     .word '0' 
      00AE41 84 EF 00         [ 4]  379     CALL    HOLD 
      002ECF                        380 FDOT8:
      00AE44 0A CD 87         [ 4]  381     CALL    DONXT 
      00AE47 67 CD                  382     .word   FDOT7
      00AE49 85 51 CD         [ 4]  383     CALL    DDIGS 
      002ED7                        384 FDOT9:
      00AE4C AD B1 72         [ 4]  385     CALL    FNE 
      00AE4E                        386     _QBRAN  FDOT10 
      00AE4E CD 86 6A         [ 4]    1     CALL QBRAN
      00AE51 CD A6                    2     .word FDOT10
      002EDF                        387     _DOLIT '-' 
      00AE53 B0 CD 8F         [ 4]    1     CALL DOLIT 
      00AE56 97 CD                    2     .word '-' 
      00AE58 8E 5B EB         [ 4]  388     CALL   HOLD 
      00AE5A                        389 FDOT10:
      00AE5A CD A7 22         [ 4]  390     CALL    EDIGS 
      00AE5D CD 85 B4         [ 4]  391     CALL    TYPES 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 169.
Hexadecimal [24-Bits]



      00AE60 CD 8B F5         [ 4]  392     CALL    RFROM 
      00AE63 CD 86 6A         [ 4]  393     CALL    BASE 
      00AE66 CD 86 A1         [ 4]  394     CALL    STORE 
      00AE69 CD               [ 4]  395     RET 
                                    396 
                                    397 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    398 ; return parsed exponent or 
                                    399 ; 0 if failed
                                    400 ; at entry exprect *a=='E'    
                                    401 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002EF7                        402 parse_exponent: ; a cntr -- e -1 | 0 
      00AE6A 85 18 AE         [ 4]  403     CALL TOR   ; R: cntr 
      00AE6D 73 CD 85         [ 4]  404     CALL DUPP 
      00AE70 34 AE 5A         [ 4]  405     CALL CAT 
      00AE73                        406     _DOLIT 'E' 
      00AE73 CD 86 C9         [ 4]    1     CALL DOLIT 
      00AE76 CD 87                    2     .word 'E' 
      00AE78 67 CD 85         [ 4]  407     CALL EQUAL 
      002F08                        408     _QBRAN 1$
      00AE7B 63 CD 89         [ 4]    1     CALL QBRAN
      00AE7E 97 CD                    2     .word 1$
      00AE80 85 18 AE         [ 4]  409     CALL ONEP 
      00AE83 5A CD 84         [ 4]  410     CALL RFROM  ; a cntr 
      00AE86 EF 00 2E         [ 4]  411     CALL ONEM
      00AE89 CD 8E 6B         [ 4]  412     CALL DUPP 
      002F19                        413     _QBRAN 2$ ; a cntr 
      00AE8C CD A7 22         [ 4]    1     CALL QBRAN
      00AE8F CD AC                    2     .word 2$
      00AE91 F2 CD 85         [ 4]  414     CALL ZERO
      00AE94 18 AE 9F         [ 4]  415     CALL DUPP 
      00AE97 CD 84 EF         [ 4]  416     CALL DSWAP ; 0 0 a cntr  
      00AE9A 00 2D CD         [ 4]  417     CALL nsign 
      00AE9D 8E 6B EA         [ 4]  418     CALL TOR   ; R: esign  
      00AE9F CD 25 15         [ 4]  419     CALL parse_digits
      002F30                        420     _QBRAN PARSEXP_SUCCESS ; parsed to end of string 
      00AE9F CD 86 97         [ 4]    1     CALL QBRAN
      00AEA2 CD 8E                    2     .word PARSEXP_SUCCESS
                                    421 ; failed invalid character
      00AEA4 C0 CD 8F         [ 4]  422     CALL DDROP ; 0 a 
      002F38                        423 1$: 
      00AEA7 C1 CD 85         [ 4]  424     CALL RFROM ; sign||cntr  
      002F3B                        425 2$:
      00AEAA B4 CD 88         [ 4]  426     CALL DDROP  ; a cntr || a sign || 0 cntr   
      00AEAD 54 CD 85         [ 4]  427     CALL ZERO   ; return only 0 
      00AEB0 18               [ 4]  428     RET 
      002F42                        429 PARSEXP_SUCCESS: 
      00AEB1 AE BE CD         [ 4]  430     CALL DDROP ; drop dhi a 
      00AEB4 84 EF 00         [ 4]  431     CALL RFROM ; es 
      002F48                        432     _QBRAN 1$
      00AEB7 45 CD 84         [ 4]    1     CALL QBRAN
      00AEBA B6 CD                    2     .word 1$
      00AEBC 90 80 84         [ 4]  433     CALL NEGAT
      00AEBE                        434 1$:
      002F50                        435     _DOLIT -1 ; -- e -1 
      00AEBE CD 85 B4         [ 4]    1     CALL DOLIT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 170.
Hexadecimal [24-Bits]



      00AEC1 CD 87                    2     .word -1 
      00AEC3 67               [ 4]  436     RET 
                                    437 
                                    438 
                                    439 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    440 ;   FLOAT?  ( a dlo dhi a+ cntr sign d? -- f -3 | a 0 )
                                    441 ;   called by NUMBER? 
                                    442 ;   convert string to float 
                                    443 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002F56                        444     _HEADER FLOATQ,5,"FLOAT?"
      00AEC4 CD 85                    1         .word LINK 
                           002F58     2         LINK=.
      00AEC6 51                       3         .byte 5  
      00AEC7 81 AE 34 02 46 2E        4         .ascii "FLOAT?"
      00AECD                          5         FLOATQ:
      002F5F                        445     _QBRAN FLOATQ0 
      00AECD CD 87 67         [ 4]    1     CALL QBRAN
      00AED0 CD 85                    2     .word FLOATQ0
      002F64                        446     _BRAN FLOAT_ERROR  ; not a float, string start with '#'
      00AED2 63 CD 86         [ 4]    1     CALL BRAN 
      00AED5 6A CD                    2     .word FLOAT_ERROR 
      002F69                        447 FLOATQ0:
                                    448 ; BASE must be 10 
      00AED7 84 EF 00         [ 4]  449     CALL BASE 
      00AEDA 0A CD 87         [ 4]  450     CALL AT 
      002F6F                        451     _DOLIT 10 
      00AEDD 67 CD 85         [ 4]    1     CALL DOLIT 
      00AEE0 51 CD                    2     .word 10 
      00AEE2 AD B1 CD         [ 4]  452     CALL EQUAL 
      002F77                        453     _QBRAN FLOAT_ERROR 
      00AEE5 86 A1 CD         [ 4]    1     CALL QBRAN
      00AEE8 89 6A                    2     .word FLOAT_ERROR
                                    454 ; if float next char is '.' or 'E' 
      00AEEA CD 84 EF         [ 4]  455     CALL TOR ; R: sign  
      00AEED 00 08 CD         [ 4]  456     CALL TOR ; R: sign cntr 
      00AEF0 89 F3 CD         [ 4]  457     CALL DUPP
      00AEF3 85 18 AE         [ 4]  458     CALL CAT 
      002F88                        459     _DOLIT '.' 
      00AEF6 FA CC AE         [ 4]    1     CALL DOLIT 
      00AEF9 4E 2E                    2     .word '.' 
      00AEFA CD 08 F8         [ 4]  460     CALL EQUAL 
      002F90                        461     _QBRAN FLOATQ1 ; not a dot 
      00AEFA CD 8F 97         [ 4]    1     CALL QBRAN
      00AEFD CD 86                    2     .word FLOATQ1
      00AEFF 6A CD AC         [ 4]  462     CALL ONEP 
      00AF02 F2 CD 85         [ 4]  463     CALL RFROM  ; dlo dhi a cntr R: sign  
      00AF05 18 AF 0B         [ 4]  464     CALL ONEM 
      00AF08 CD 89 16         [ 4]  465     CALL DUPP 
      00AF0B CD 05 EA         [ 4]  466     CALL TOR  ; R: sign cntr 
                                    467 ; parse fractional part
      00AF0B CD 8E 5B         [ 4]  468     CALL parse_digits ; dlo dhi a cntr -- dm a cntr 
      00AF0E CD 85 C5         [ 4]  469     CALL DUPP 
      00AF11 CD 86 D8         [ 4]  470     CALL RFROM 
      00AF14 CD 85 18         [ 4]  471     CALL SWAPP 
      00AF17 AF 42 D0         [ 4]  472     CALL SUBB ; fd -> fraction digits count 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 171.
Hexadecimal [24-Bits]



      00AF19 CD 05 EA         [ 4]  473     CALL TOR  ; dlo dhi a cntr R: sign fd 
      00AF19 CD A7 22         [ 4]  474     CALL DUPP ; cntr cntr  
      002FB9                        475     _QBRAN 1$ ; end of string, no exponent
      00AF1C CD 85 B4         [ 4]    1     CALL QBRAN
      00AF1F CD 8B                    2     .word 1$
      002FBE                        476     _BRAN FLOATQ2
      00AF21 F5 CD 88         [ 4]    1     CALL BRAN 
      00AF24 54 CD                    2     .word FLOATQ2 
      00AF26 85 18 AF         [ 4]  477 1$: CALL SWAPP 
      00AF29 32 CD 86         [ 4]  478     CALL DROP ; a
      002FC9                        479     _BRAN FLOATQ3        
      00AF2C 6A CD 85         [ 4]    1     CALL BRAN 
      00AF2F 34 AF                    2     .word FLOATQ3 
      002FCE                        480 FLOATQ1: ; must push fd==0 on RSTACK 
      00AF31 19 05 34         [ 4]  481     CALL RFROM ; cntr 
      00AF32 CD 0B E1         [ 4]  482     CALL ZERO  ; fd 
      00AF32 CD 84 EF         [ 4]  483     CALL TOR   ; dm a cntr R: sign fd 
      002FD7                        484 FLOATQ2: 
      00AF35 00 2E CD         [ 4]  485     CALL parse_exponent 
      002FDA                        486     _QBRAN FLOAT_ERROR0 ; exponent expected 
      00AF38 8E 6B CD         [ 4]    1     CALL QBRAN
      00AF3B A7 3B                    2     .word FLOAT_ERROR0
      002FDF                        487 FLOATQ3: ; dm 0 || dm e  
      00AF3D CD 85 34         [ 4]  488     CALL RFROM ;  fd  
      00AF40 AF 57 D0         [ 4]  489     CALL SUBB  ; exp=e-fd 
      00AF42 CD 08 04         [ 4]  490     CALL NROT 
      00AF42 CD 85 34         [ 4]  491     CALL RFROM  ; sign 
      002FEB                        492     _QBRAN FLOATQ4 
      00AF45 AF 4F 98         [ 4]    1     CALL QBRAN
      00AF47 2F F3                    2     .word FLOATQ4
      00AF47 CD 84 EF         [ 4]  493     CALL DNEGA 
      002FF3                        494 FLOATQ4:
      00AF4A 00 30 CD         [ 4]  495     CALL ROT 
      00AF4D 8E 6B 63         [ 4]  496     CALL STEXP 
      00AF4F CD 07 E5         [ 4]  497     CALL ROT 
      00AF4F CD 85 03         [ 4]  498     CALL DROP 
      00AF52 AF 47 CD         [ 4]  499     CALL SFN 
      00AF55 A7 3B AD         [ 4]  500     CALL SFZ 
      00AF57                        501     _DOLIT -3 
      00AF57 CD AC F2         [ 4]    1     CALL DOLIT 
      00AF5A CD 85                    2     .word -3 
      00AF5C 18               [ 4]  502     RET       
      00300B                        503 FLOAT_ERROR0: 
      00AF5D AF 67 CD         [ 4]  504     CALL DRFROM ; sign df      
      00300E                        505 FLOAT_ERROR: 
      00AF60 84 EF 00         [ 4]  506     CALL DEPTH 
      00AF63 2D CD 8E         [ 4]  507     CALL CELLS 
      00AF66 6B 06 01         [ 4]  508     CALL SPAT 
      00AF67 CD 06 31         [ 4]  509     CALL SWAPP 
      00AF67 CD 8E C0         [ 4]  510     CALL PLUS  
      00AF6A CD 8F C1         [ 4]  511     CALL SPSTO 
      00AF6D CD 85 B4         [ 4]  512     CALL ZERO 
      00AF70 CD               [ 4]  513     RET 
                                    514 
                                    515 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 172.
Hexadecimal [24-Bits]



                                    516 ;  LSCALE ( f# -- f# )
                                    517 ;  m *=10 , e -= 1
                                    518 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      003024                        519     _HEADER LSCALE,6,"LSCALE"
      00AF71 87 67                    1         .word LINK 
                           003026     2         LINK=.
      00AF73 CD                       3         .byte 6  
      00AF74 85 51 81 41 4C 45        4         .ascii "LSCALE"
      00AF77                          5         LSCALE:
      00AF77 CD 86 6A         [ 4]  520     CALL ATEXP 
      00AF7A CD 86 A1         [ 4]  521     CALL ONE 
      00AF7D CD 85 81         [ 4]  522     CALL SUBB 
      00AF80 CD 84 EF         [ 4]  523     CALL TOR
      003039                        524     _DOLIT 10 
      00AF83 00 45 CD         [ 4]    1     CALL DOLIT 
      00AF86 89 78                    2     .word 10 
      00AF88 CD 85 18         [ 4]  525     CALL DSSTAR
      00AF8B AF B8 CD         [ 4]  526     CALL RFROM 
      00AF8E 8B F5 CD         [ 4]  527     CALL STEXP 
      00AF91 85               [ 4]  528     RET  
                                    529 
                                    530 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    531 ;  RSCALE ( f# -- f# )
                                    532 ;  m /=10 , e+=1 
                                    533 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      003048                        534     _HEADER RSCALE,6,"RSCALE"
      00AF92 B4 CD                    1         .word LINK 
                           00304A     2         LINK=.
      00AF94 8C                       3         .byte 6  
      00AF95 02 CD 86 A1 CD 85        4         .ascii "RSCALE"
      003051                          5         RSCALE:
      00AF9B 18 AF BB         [ 4]  535     CALL ATEXP 
      00AF9E CD 8C 61         [ 4]  536     CALL ONE 
      00AFA1 CD 86 A1         [ 4]  537     CALL PLUS 
      00AFA4 CD A7 D2         [ 4]  538     CALL TOR 
      00305D                        539     _DOLIT 10 
      00AFA7 CD A5 5D         [ 4]    1     CALL DOLIT 
      00AFAA CD 86                    2     .word 10 
      00AFAC 6A CD A5         [ 4]  540     CALL DSLMOD 
      00AFAF 95 CD 85         [ 4]  541     CALL ROT 
      00AFB2 18 AF C2         [ 4]  542     CALL DROP 
      00AFB5 CD 88 A6         [ 4]  543     CALL RFROM 
      00AFB8 CD 2D 63         [ 4]  544     CALL STEXP 
      00AFB8 CD               [ 4]  545     RET 
                                    546 
                                    547 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    548 ;  SCALEUP ( ud u1 u2 -- ud*10 u1 u2 )
                                    549 ;  while (ud<=0xcccccccc && u1<u2 ){
                                    550 ;        ud*10;
                                    551 ;        u2--;
                                    552 ;  }  
                                    553 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      003072                        554 SCALEUP:
      00AFB9 85 B4 31         [ 4]  555     CALL DDUP
      00AFBB CD 09 35         [ 4]  556     CALL LESS  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 173.
Hexadecimal [24-Bits]



      003078                        557     _QBRAN SCALEUP3
      00AFBB CD 88 A6         [ 4]    1     CALL QBRAN
      00AFBE CD 8C                    2     .word SCALEUP3
      00AFC0 61 81 9E         [ 4]  558     CALL DTOR   ; R: u1 u2  
      00AFC2 CD 08 31         [ 4]  559     CALL DDUP 
      003083                        560     _DOLIT 0XCCCC 
      00AFC2 CD 88 A6         [ 4]    1     CALL DOLIT 
      00AFC5 CD 85                    2     .word 0XCCCC 
      003088                        561     _DOLIT 0XCCC 
      00AFC7 B4 CD 85         [ 4]    1     CALL DOLIT 
      00AFCA 18 AF                    2     .word 0XCCC 
      00AFCC D0 CD 89         [ 4]  562     CALL DGREAT  
      003090                        563     _TBRAN SCALEUP2 
      00AFCF 04 04 A6         [ 4]    1     CALL TBRAN 
      00AFD0 30 A5                    2     .word SCALEUP2 
      003095                        564     _DOLIT 10 
      00AFD0 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AFD3 FF FF                    2     .word 10 
      00AFD5 81 AE CA         [ 4]  565     CALL UDSSTAR 
      00AFD8 05 46 4C         [ 4]  566     CALL DRFROM 
      00AFDB 4F 41 54         [ 4]  567     CALL ONEM
      00AFDE 3F CD            [ 2]  568     JRA SCALEUP
      00AFDF                        569 SCALEUP2:
      00AFDF CD 85 18         [ 4]  570     CALL DRFROM
      0030A8                        571 SCALEUP3: 
      00AFE2 AF               [ 4]  572     RET 
                                    573 
                                    574 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    575 ; SCALEDOWN ( ud u1 u2 -- ud u1 u2 )
                                    576 ;  whhile (ud && u1>u2 ){ 
                                    577 ;     ud/10;
                                    578 ;     u2++;
                                    579 ;  } 
                                    580 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0030A9                        581 SCALEDOWN: 
      00AFE3 E9 CD 85         [ 4]  582     CALL DDUP 
      00AFE6 34 B0 8E         [ 4]  583     CALL GREAT 
      00AFE9                        584     _QBRAN SCALDN3 
      00AFE9 CD 87 67         [ 4]    1     CALL QBRAN
      00AFEC CD 85                    2     .word SCALDN3
      00AFEE 63 CD 84         [ 4]  585     CALL DTOR 
      00AFF1 EF 00 0A         [ 4]  586     CALL DDUP 
      00AFF4 CD 89 78         [ 4]  587     CALL DZEQUAL 
      0030BD                        588     _TBRAN SCALDN2  
      00AFF7 CD 85 18         [ 4]    1     CALL TBRAN 
      00AFFA B0 8E                    2     .word SCALDN2 
      0030C2                        589     _DOLIT 10
      00AFFC CD 86 6A         [ 4]    1     CALL DOLIT 
      00AFFF CD 86                    2     .word 10 
      00B001 6A CD 86         [ 4]  590     CALL ZERO  
      00B004 A1 CD 85         [ 4]  591     CALL DSLASH 
      00B007 81 CD 84         [ 4]  592     CALL DRFROM 
      00B00A EF 00 2E         [ 4]  593     CALL ONEP  
      00B00D CD 89            [ 2]  594     JRA SCALEDOWN 
      0030D5                        595 SCALDN2:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 174.
Hexadecimal [24-Bits]



      00B00F 78 CD 85         [ 4]  596     CALL DRFROM 
      0030D8                        597 SCALDN3:
      00B012 18               [ 4]  598     RET 
                                    599 
                                    600 
                                    601 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    602 ;  F-ALIGN ( f#1 f#2 -- m1 m2 e )
                                    603 ;  align to same exponent 
                                    604 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0030D9                        605     _HEADER FALIGN,7,"F-ALIGN"
      00B013 B0 4E                    1         .word LINK 
                           0030DB     2         LINK=.
      00B015 CD                       3         .byte 7  
      00B016 8B F5 CD 85 B4 CD 8C     4         .ascii "F-ALIGN"
      0030E3                          5         FALIGN:
      00B01D 02 CD 86         [ 4]  606     CALL ATEXP 
      00B020 A1 CD 86         [ 4]  607     CALL TOR 
      00B023 6A CD A5         [ 4]  608     CALL DSWAP 
      00B026 95 CD 86         [ 4]  609     CALL ATEXP 
      00B029 A1 CD 85         [ 4]  610     CALL TOR    ; m2 m1 R: e2 e1 
      00B02C B4 CD 86         [ 4]  611     CALL DSWAP 
      00B02F B1 CD 89         [ 4]  612     CALL DRAT 
      00B032 50 CD 86         [ 4]  613     CALL EQUAL 
      0030FB                        614     _TBRAN FALGN8
      00B035 6A CD 86         [ 4]    1     CALL TBRAN 
      00B038 A1 CD                    2     .word FALGN8 
                                    615 ; scaleup the largest float 
                                    616 ; but limit mantissa <=0xccccccc
                                    617 ; to avoid mantissa overflow     
      00B03A 85 18 B0         [ 4]  618     CALL DRAT ; m1 m2 e2 e1 
      00B03D 43 CD 85         [ 4]  619     CALL GREAT 
      003106                        620     _QBRAN FALGN4 ; e2<e1 
      00B040 34 B0 57         [ 4]    1     CALL QBRAN
      00B043 CD 86                    2     .word FALGN4
                                    621 ; e2>e1 then scale up m2   
      00B045 B1 CD 86         [ 4]  622     CALL DRFROM 
      00B048 97 CD 85         [ 4]  623     CALL SWAPP 
      00B04B 34 B0 5F         [ 4]  624     CALL SCALEUP 
      00B04E CD 06 31         [ 4]  625     CALL SWAPP 
      00B04E CD 85 B4         [ 4]  626     CALL DTOR 
      00B051 CD 8C            [ 2]  627     JRA FALGN6
      00311C                        628 FALGN4: ; e2<e1 then scaleup m1 
      00B053 61 CD 86         [ 4]  629     CALL DSWAP 
      00B056 6A 28 BC         [ 4]  630     CALL DRFROM 
      00B057 CD 30 72         [ 4]  631     CALL SCALEUP 
      00B057 CD AF 77         [ 4]  632     CALL DTOR
      00B05A CD 85 18         [ 4]  633     CALL DSWAP 
                                    634 ; check again for e2==e1 
                                    635 ; if scaleup was not enough 
                                    636 ; to equalize exponent then
                                    637 ; scaledown smallest float     
      00312B                        638 FALGN6: 
      00B05D B0 8B D4         [ 4]  639     CALL DRAT 
      00B05F CD 08 F8         [ 4]  640     CALL EQUAL 
      003131                        641     _TBRAN FALGN8 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 175.
Hexadecimal [24-Bits]



      00B05F CD 85 B4         [ 4]    1     CALL TBRAN 
      00B062 CD 89                    2     .word FALGN8 
                                    642 ; e2!=e1 need to scale down smallest 
      00B064 50 CD 88         [ 4]  643     CALL DRAT 
      00B067 84 CD 85         [ 4]  644     CALL GREAT 
      00313C                        645     _QBRAN FALGN7 ; e2<e1 
      00B06A B4 CD 85         [ 4]    1     CALL QBRAN
      00B06D 18 B0                    2     .word FALGN7
                                    646 ; e2>e1 scaledown m1 
      00B06F 73 CD 89         [ 4]  647     CALL DSWAP 
      00B072 16 28 BC         [ 4]  648     CALL DRFROM 
      00B073 CD 30 A9         [ 4]  649     CALL SCALEDOWN
      00B073 CD 88 65         [ 4]  650     CALL SWAPP 
      00B076 CD AD E3         [ 4]  651     CALL DTOR 
      00B079 CD 88            [ 2]  652     JRA FALGN71  
      003152                        653 FALGN7: ; e2<e1 scaledown m2 
      00B07B 65 CD 86         [ 4]  654     CALL DRFROM 
      00B07E 97 CD AD         [ 4]  655     CALL SWAPP 
      00B081 64 CD AD         [ 4]  656     CALL SCALEDOWN 
      00B084 2D CD 84         [ 4]  657     CALL SWAPP 
      00B087 EF FF FD         [ 4]  658     CALL DTOR 
                                    659 ; after scaledown if e2!=e1 
                                    660 ; this imply that one of mantissa 
                                    661 ; as been nullified by scalling 
                                    662 ; hence keep largest exponent 
      003161                        663 FALGN71:
      00B08A 81 28 D4         [ 4]  664     CALL DRAT 
      00B08B CD 08 F8         [ 4]  665     CALL EQUAL
      003167                        666     _TBRAN FALGN8 
      00B08B CD A9 3C         [ 4]    1     CALL TBRAN 
      00B08E 31 80                    2     .word FALGN8 
      00B08E CD 8C A3         [ 4]  667     CALL DRFROM 
      00B091 CD 8B E8         [ 4]  668     CALL DDUP 
      00B094 CD 86 81         [ 4]  669     CALL GREAT 
      003175                        670     _TBRAN FALGN72
      00B097 CD 86 B1         [ 4]    1     CALL TBRAN 
      00B09A CD 88                    2     .word FALGN72 
      00B09C C6 CD 86         [ 4]  671     CALL SWAPP     
      00317D                        672 FALGN72:
      00B09F 8E CD 8C         [ 4]  673     CALL DTOR  ; now smallest e is at rtop.
      003180                        674 FALGN8:
      00B0A2 61 81 AF         [ 4]  675     CALL DRFROM 
      00B0A5 D8 06 4C         [ 4]  676     CALL DROP 
      00B0A8 53               [ 4]  677     RET 
                                    678 
                                    679 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    680 ;   F+ ( f#1 f#2 -- f#1+f#2 )
                                    681 ;   float addition 
                                    682 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      003187                        683     _HEADER FPLUS,2,"F+"
      00B0A9 43 41                    1         .word LINK 
                           003189     2         LINK=.
      00B0AB 4C                       3         .byte 2  
      00B0AC 45 2B                    4         .ascii "F+"
      00B0AD                          5         FPLUS:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 176.
Hexadecimal [24-Bits]



      00B0AD CD AD B1         [ 4]  684     CALL FALIGN 
      00B0B0 CD 8C 6C         [ 4]  685     CALL TOR 
      00B0B3 CD 89 50         [ 4]  686     CALL DPLUS
      00B0B6 CD 86 6A         [ 4]  687     CALL DSIGN 
      00B0B9 CD 84 EF         [ 4]  688     CALL TOR 
      00B0BC 00 0A CD         [ 4]  689     CALL DABS 
      00B0BF A7 AC CD         [ 4]  690     CALL SCALETOM
      00B0C2 85 B4 CD         [ 4]  691     CALL RFROM 
      0031A4                        692     _QBRAN FPLUS1 
      00B0C5 AD E3 81         [ 4]    1     CALL QBRAN
      00B0C8 B0 A6                    2     .word FPLUS1
      00B0CA 06 52 53         [ 4]  693     CALL DNEGA  
      0031AC                        694 FPLUS1: 
      00B0CD 43 41 4C         [ 4]  695     CALL ROT   
      00B0D0 45 05 34         [ 4]  696     CALL RFROM
      00B0D1 CD 08 46         [ 4]  697     CALL PLUS  
      00B0D1 CD AD B1         [ 4]  698     CALL STEXP 
      00B0D4 CD               [ 4]  699     RET 
                                    700 
                                    701 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    702 ;  F- ( f#1 f#2 -- f#1-f#2 )
                                    703 ;  substraction 
                                    704 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0031B9                        705     _HEADER FSUB,2,"F-"
      00B0D5 8C 6C                    1         .word LINK 
                           0031BB     2         LINK=.
      00B0D7 CD                       3         .byte 2  
      00B0D8 88 C6                    4         .ascii "F-"
      0031BE                          5         FSUB:
      00B0DA CD 86 6A         [ 4]  706     CALL FALIGN 
      00B0DD CD 84 EF         [ 4]  707     CALL TOR 
      00B0E0 00 0A CD         [ 4]  708     CALL DSUB
      00B0E3 A6 E1 CD         [ 4]  709     CALL DSIGN 
      00B0E6 88 65 CD         [ 4]  710     CALL TOR 
      00B0E9 86 97 CD         [ 4]  711     CALL DABS 
      00B0EC 85 B4 CD         [ 4]  712     CALL SCALETOM 
      00B0EF AD E3 81         [ 4]  713     CALL RFROM 
      00B0F2                        714     _QBRAN FSUB1 
      00B0F2 CD 88 B1         [ 4]    1     CALL QBRAN
      00B0F5 CD 89                    2     .word FSUB1
      00B0F7 B5 CD 85         [ 4]  715     CALL DNEGA 
      0031DE                        716 FSUB1:
      00B0FA 18 B1 28         [ 4]  717     CALL ROT 
      00B0FD CD A9 1E         [ 4]  718     CALL RFROM
      00B100 CD 88 B1         [ 4]  719     CALL PLUS  
      00B103 CD 84 EF         [ 4]  720     CALL STEXP 
      00B106 CC               [ 4]  721     RET 
                                    722 
                                    723 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    724 ; /mod10  ( m -- m/10 r )
                                    725 ; divide mantissa by 10 
                                    726 ; return quotient and remainder 
                                    727 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0031EB                        728 UMOD10:
      0031EB                        729     _DOLIT 10 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 177.
Hexadecimal [24-Bits]



      00B107 CC CD 84         [ 4]    1     CALL DOLIT 
      00B10A EF 0C                    2     .word 10 
      00B10C CC CD A8         [ 4]  730     CALL DSLMOD
      00B10F E1 CD 85         [ 4]  731     CALL ROT  
      00B112 26               [ 4]  732     RET 
                                    733 
                                    734 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    735 ;   SCALE>M ( ud1 -- e ud2 )
                                    736 ;   scale down a double  
                                    737 ;   by repeated d/10
                                    738 ;   until ud<=MAX_MANTISSA   
                                    739 ;   e is log10 exponent of scaled down
                                    740 ;   ud2 is scaled down ud1 
                                    741 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0031F7                        742     _HEADER SCALETOM,7,"SCALE>M"
      00B113 B1 25                    1         .word LINK 
                           0031F9     2         LINK=.
      00B115 CD                       3         .byte 7  
      00B116 84 EF 00 0A CD A7 8A     4         .ascii "SCALE>M"
      003201                          5         SCALETOM:
      00B11D CD A9 3C         [ 4]  743     CALL ZERO 
      00B120 CD 8C 02         [ 4]  744     CALL NROT 
      003207                        745 SCAL1:
      00B123 20 CD 21         [ 4]  746     CALL DUPP 
      00B125                        747     _DOLIT 0X7F 
      00B125 CD A9 3C         [ 4]    1     CALL DOLIT 
      00B128 00 7F                    2     .word 0X7F 
      00B128 81 09 54         [ 4]  748     CALL UGREAT 
      00B129                        749     _QBRAN SCAL2  
      00B129 CD 88 B1         [ 4]    1     CALL QBRAN
      00B12C CD 89                    2     .word SCAL2
      00B12E F3 CD 85         [ 4]  750     CALL UMOD10 
      00B131 18 B1 58         [ 4]  751     CALL DROP 
      00B134 CD A9 1E         [ 4]  752     CALL ROT 
      00B137 CD 88 B1         [ 4]  753     CALL ONEP 
      00B13A CD A8 A7         [ 4]  754     CALL NROT  
      003226                        755     _BRAN SCAL1 
      00B13D CD 85 26         [ 4]    1     CALL BRAN 
      00B140 B1 55                    2     .word SCAL1 
      00322B                        756 SCAL2: 
      00B142 CD               [ 4]  757     RET 
                                    758 
                                    759 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    760 ;  UDIV10 ( ut -- ut )
                                    761 ;  divide a 48 bits uint by 10 
                                    762 ;  used to scale down MM* 
                                    763 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00322C                        764 UDIV10:
      00B143 84 EF            [ 1]  765     LDW Y,X 
      00B145 00 0A            [ 2]  766     LDW Y,(Y)
      00B147 CD 8C            [ 1]  767     LD A,#10 
      00B149 61 CD            [ 2]  768     DIV Y,A 
      00B14B AB               [ 2]  769     LDW (X),Y 
      00B14C D0 CD            [ 1]  770     LD YH,A 
      00B14E A9 3C            [ 1]  771     LD A,(2,X)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 178.
Hexadecimal [24-Bits]



      00B150 CD 8B            [ 1]  772     LD YL,A 
      00B152 F5 20            [ 1]  773     LD A,#10 
      00B154 D4 62            [ 2]  774     DIV Y,A 
      00B155 90 95            [ 1]  775     LD YH,A 
      00B155 CD A9            [ 1]  776     LD A,YL 
      00B157 3C 02            [ 1]  777     LD (2,X),A 
      00B158 E6 03            [ 1]  778     LD A,(3,X)
      00B158 81 B0            [ 1]  779     LD YL,A 
      00B15A CA 07            [ 1]  780     LD A,#10 
      00B15C 46 2D            [ 2]  781     DIV Y,A 
      00B15E 41 4C            [ 1]  782     LD YH,A 
      00B160 49 47            [ 1]  783     LD A,YL 
      00B162 4E 03            [ 1]  784     LD (3,X),A 
      00B163 E6 04            [ 1]  785     LD A,(4,X)
      00B163 CD AD            [ 1]  786     LD YL,A 
      00B165 B1 CD            [ 1]  787     LD A,#10 
      00B167 86 6A            [ 2]  788     DIV Y,A 
      00B169 CD A7            [ 1]  789     LD YH,A 
      00B16B D2 CD            [ 1]  790     LD A,YL 
      00B16D AD B1            [ 1]  791     LD (4,X),A 
      00B16F CD 86            [ 1]  792     LD A,(5,X)
      00B171 6A CD            [ 1]  793     LD YL,A 
      00B173 A7 D2            [ 1]  794     LD A,#10 
      00B175 CD A9            [ 2]  795     DIV Y,A 
      00B177 54 CD            [ 1]  796     LD A,YL 
      00B179 89 78            [ 1]  797     LD (5,X),A 
      00B17B CD               [ 4]  798     RET 
                                    799 
                                    800 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    801 ;   MM* ( m1 m2 -- m3 e )
                                    802 ;   mantissa product 
                                    803 ;  scale down to 23 bits 
                                    804 ;   e  is log10 scaling factor.
                                    805 ;   The maximum product size 
                                    806 ;   before scaling is 46 bits .
                                    807 ;   UDIV10 is used to scale down.  
                                    808 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00326E                        809     _HEADER MMSTAR,3,"MM*"
      00B17C 85 26                    1         .word LINK 
                           003270     2         LINK=.
      00B17E B2                       3         .byte 3  
      00B17F 00 CD A9                 4         .ascii "MM*"
      003274                          5         MMSTAR:
      00B182 54 CD 89         [ 4]  810     CALL DDUP
      00B185 F3 CD 85         [ 4]  811     CALL DZEQUAL
      00327A                        812     _TBRAN MMSTA2
      00B188 18 B1 9C         [ 4]    1     CALL TBRAN 
      00B18B CD A9                    2     .word MMSTA2 
      00327F                        813 MMSTA1:
      00B18D 3C CD 86         [ 4]  814     CALL DOVER 
      00B190 B1 CD B0         [ 4]  815     CALL DZEQUAL 
      003285                        816     _QBRAN MMSTA3 
      00B193 F2 CD 86         [ 4]    1     CALL QBRAN
      00B196 B1 CD                    2     .word MMSTA3
      00328A                        817 MMSTA2: ; ( -- 0 0 0 )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 179.
Hexadecimal [24-Bits]



      00B198 A9 1E 20         [ 2]  818     ADDW X,#2 
      00B19B 0F 5F            [ 1]  819     CLRW Y 
      00B19C FF               [ 2]  820     LDW (X),Y 
      00B19C CD A7            [ 2]  821     LDW (2,X),Y
      00B19E D2 CD            [ 2]  822     LDW (4,X),Y 
      00B1A0 A9               [ 4]  823     RET 
      003295                        824 MMSTA3:
      00B1A1 3C CD B0         [ 4]  825     CALL DSIGN 
      00B1A4 F2 CD A9         [ 4]  826     CALL TOR    ; R: m2sign 
      00B1A7 1E CD A7         [ 4]  827     CALL DABS   ; m1 um2 
      00B1AA D2 27 52         [ 4]  828     CALL DSWAP  ; um2 m1 
      00B1AB CD 26 47         [ 4]  829     CALL DSIGN  ; um2 m1 m1sign 
      00B1AB CD A9 54         [ 4]  830     CALL RFROM 
      00B1AE CD 89 78         [ 4]  831     CALL XORR 
      00B1B1 CD 85 26         [ 4]  832     CALL TOR   ; R: product_sign 
      00B1B4 B2 00 CD         [ 4]  833     CALL DABS  ; um2 um1  
      00B1B7 A9 54 CD         [ 4]  834     CALL DTOR  ; um2 
      00B1BA 89 F3 CD         [ 4]  835     CALL DUPP  ; um2 um2hi 
      00B1BD 85 18 B1         [ 4]  836     CALL RAT   ; um2 um2hi um1hi
                                    837 ; first partial product  
                                    838 ; pd1=um2hi*um1hi 
      00B1C0 D2 CD A7         [ 4]  839     CALL STAR 
      00B1C3 D2 CD A9         [ 4]  840     CALL ZERO 
      00B1C6 3C CD B1         [ 4]  841     CALL SWAPP ; pd1<<16  
      00B1C9 29 CD 86         [ 4]  842     CALL DSWAP ; pd1 um2 
      00B1CC B1 CD A9         [ 4]  843     CALL OVER  ; pd1 um2 um2lo 
      00B1CF 1E 20 0F         [ 4]  844     CALL RFROM ; pd1 um2 um2lo um1hi 
                                    845 ; pd2=um2lo*um1hi 
      00B1D2 CD 0A AA         [ 4]  846     CALL UMSTA ; pd1 um2 pd2 
      00B1D2 CD A9 3C         [ 4]  847     CALL DSWAP ; pd1 pd2 um2 
      00B1D5 CD 86 B1         [ 4]  848     CALL RAT   ; pd1 pd2 um2 um1lo 
                                    849 ; pd3= um2hi*um1lo 
      00B1D8 CD B1 29         [ 4]  850     CALL UMSTA ; pd1 pd2 um2lo pd3 
      00B1DB CD 86 B1         [ 4]  851     CALL ROT ; pd1 pd2 pd3 um2lo 
      00B1DE CD A9 1E         [ 4]  852     CALL TOR ; pd1 pd2 pd3 R: psign um1lo um2lo 
                                    853 ; pd1+pd2+pd3  pd1
      00B1E1 CD 2B 5F         [ 4]  854     CALL DPLUS 
      00B1E1 CD A9 54         [ 4]  855     CALL DPLUS  
      00B1E4 CD 89 78         [ 4]  856     CALL DRFROM ; triple um2lo um1lo 
                                    857 ; last partial product um2lo*um1lo 
      00B1E7 CD 85 26         [ 4]  858     CALL UMSTA ; prod pd4 
                                    859 ; mm*=prod<<16+pd4  
      00B1EA B2 00 CD         [ 4]  860     CALL DTOR ;   R: psign pd4lo pd4hi  
                                    861  ; add pd4hi to prodlo and propagate carry 
      00B1ED A9 3C            [ 1]  862     LDW Y,X 
      00B1EF CD 88 B1         [ 2]  863     LDW Y,(2,Y)  ; prodlo 
      00B1F2 CD 89 F3         [ 2]  864     ADDW Y,(1,SP)  ; prodlo+pd4hi 
      00B1F5 CD 85            [ 2]  865     LDW (1,SP),Y    ; plo phi  
      00B1F7 26 B1            [ 1]  866     LDW Y,X
      00B1F9 FD CD            [ 2]  867     LDW Y,(Y) ; prodhi  
      00B1FB 86 B1            [ 1]  868     JRNC MMSTA4
      00B1FD 72 A9 00 01      [ 2]  869     ADDW Y,#1 ; add carry 
      003300                        870 MMSTA4:     
      00B1FD CD A9 1E         [ 2]  871     SUBW X,#2 
      00B200 FF               [ 2]  872     LDW (X),Y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 180.
Hexadecimal [24-Bits]



      00B200 CD A9            [ 2]  873     POPW Y 
      00B202 3C CD            [ 2]  874     LDW (2,X),Y 
      00B204 86 97            [ 2]  875     POPW Y 
      00B206 81 B1            [ 2]  876     LDW (4,X),Y
      00B208 5B 02 46         [ 4]  877     CALL ZERO 
      00B20B 2B 05 EA         [ 4]  878     CALL TOR 
      00B20C                        879 MMSTA5:
      00B20C CD B1 63         [ 4]  880     CALL QDUP 
      003315                        881     _QBRAN MMSTA6 
      00B20F CD 86 6A         [ 4]    1     CALL QBRAN
      00B212 CD AB                    2     .word MMSTA6
      00B214 DF CD A6         [ 4]  882     CALL UDIV10 
      00B217 C7 CD 86         [ 4]  883     CALL RFROM 
      00B21A 6A CD A6         [ 4]  884     CALL ONEP 
      00B21D B0 CD B2         [ 4]  885     CALL TOR 
      003326                        886     _BRAN MMSTA5 
      00B220 81 CD 85         [ 4]    1     CALL BRAN 
      00B223 B4 CD                    2     .word MMSTA5 
                                    887 ; now scale to double 
                                    888 ; scale further <= MAX_MANTISSA 
      00332B                        889 MMSTA6: 
      00B225 85 18 B2         [ 4]  890     CALL RFROM 
      00B228 2C CD 89         [ 4]  891     CALL NROT 
      00B22B 16 32 01         [ 4]  892     CALL SCALETOM
      00B22C CD 28 9E         [ 4]  893     CALL DTOR 
      00B22C CD 88 65         [ 4]  894     CALL PLUS 
      00B22F CD 85 B4         [ 4]  895     CALL DRFROM 
      00B232 CD 88 C6         [ 4]  896     CALL RFROM
      003340                        897     _QBRAN MMSTA7
      00B235 CD AD E3         [ 4]    1     CALL QBRAN
      00B238 81 B2                    2     .word MMSTA7
      00B23A 09 02 46         [ 4]  898     CALL DNEGA
      003348                        899 MMSTA7:
      00B23D 2D 07 E5         [ 4]  900     CALL ROT ; m e 
      00B23E 81               [ 4]  901     RET 
                                    902 
                                    903 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    904 ;    F* ( f#1 f#2 -- f#3 )
                                    905 ;    float product 
                                    906 ;    f#3=f#1 * f#2 
                                    907 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00334C                        908     _HEADER FSTAR,2,"F*"
      00B23E CD B1                    1         .word LINK 
                           00334E     2         LINK=.
      00B240 63                       3         .byte 2  
      00B241 CD 86                    4         .ascii "F*"
      003351                          5         FSTAR:
      00B243 6A CD AC         [ 4]  909     CALL ATEXP ; f#1 m2 e2 
      00B246 11 CD A6         [ 4]  910     CALL TOR   
      00B249 C7 CD 86         [ 4]  911     CALL DSWAP ; m2 f#1
      00B24C 6A CD A6         [ 4]  912     CALL ATEXP ; m2 m1 e1 
      00B24F B0 CD B2         [ 4]  913     CALL RFROM ; m2 m1 e1 e2 
      00B252 81 CD 85         [ 4]  914     CALL PLUS  ; m2 m1 e 
      00B255 B4 CD 85         [ 4]  915     CALL TOR   ; m2 m1 R: e 
      00B258 18 B2 5E         [ 4]  916     CALL MMSTAR ; m2*m1 e   
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 181.
Hexadecimal [24-Bits]



      00B25B CD 89 16         [ 4]  917     CALL RFROM 
      00B25E CD 08 46         [ 4]  918     CALL PLUS 
      00B25E CD 88 65         [ 4]  919     CALL STEXP ; f#3 
      00B261 CD               [ 4]  920     RET 
                                    921 
                                    922 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    923 ;  F/ ( f#1 f#2 -- f#3 )
                                    924 ;  float division
                                    925 ;  f#3 = f#1/f#2
                                    926 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      003373                        927     _HEADER FSLASH,2,"F/"
      00B262 85 B4                    1         .word LINK 
                           003375     2         LINK=.
      00B264 CD                       3         .byte 2  
      00B265 88 C6                    4         .ascii "F/"
      003378                          5         FSLASH:
      00B267 CD AD E3         [ 4]  928     CALL ATEXP  ; f#1 m2 e2 
      00B26A 81 05 EA         [ 4]  929     CALL TOR    ; f#1 m2   R: e2 
      00B26B CD 26 47         [ 4]  930     CALL DSIGN  ; f#1 m2 m2sign 
      00B26B CD 84 EF         [ 4]  931     CALL TOR    ; F#1 m2 R: e2 m2s 
      00B26E 00 0A CD         [ 4]  932     CALL DABS   ; F#1 um2 
      00B271 A6 E1 CD         [ 4]  933     CALL DSWAP  ; m2 f#1 
      00B274 88 65 81         [ 4]  934     CALL ATEXP  ; m2 m1 e1 
      00B277 B2 3B 07         [ 4]  935     CALL ONE    ; e2 slot on rstack  
      00B27A 53 43 41         [ 4]  936     CALL NRAT   ; m2 m1 e1 e2 
      00B27D 4C 45 3E         [ 4]  937     CALL SUBB   ; m2 m1 e 
      00B280 4D 0B EC         [ 4]  938     CALL ONE    ; e slot on rstack 
      00B281 CD 05 C4         [ 4]  939     CALL NRSTO  ; m2 m1 R: e m2s 
      00B281 CD 8C 61         [ 4]  940     CALL DSIGN  ; m2 m1 m1sign 
      00B284 CD 88 84         [ 4]  941     CALL RFROM  ; m2 m1 m1s m2s  
      00B287 CD 06 A7         [ 4]  942     CALL XORR   ; m2 m1 quot_sign R: e 
      00B287 CD 86 A1         [ 4]  943     CALL RFROM   
      00B28A CD 84 EF         [ 4]  944     CALL DTOR   ; m2 m1 R: qs e  
      00B28D 00 7F CD         [ 4]  945     CALL DABS   ; um2 um1 R: qs e  
      00B290 89 D4 CD         [ 4]  946     CALL DSWAP  ; m1 m2 R: qs e
      00B293 85 18 B2         [ 4]  947     CALL DDUP  ; m1 m2 m2 R: qs e
      00B296 AB CD B2         [ 4]  948     CALL DTOR  ; m1 m2 R: qs e m2 ( keep divisor need later ) 
      00B299 6B CD 86         [ 4]  949     CALL UDSLMOD ; remainder m1/m2 R: e m2 
      0033BA                        950 FSLASH1: 
      00B29C 97 CD 88         [ 4]  951     CALL DOVER ; if remainder null done 
      00B29F 65 CD 8B         [ 4]  952     CALL DZEQUAL 
      0033C0                        953     _TBRAN FSLASH8 
      00B2A2 F5 CD 88         [ 4]    1     CALL TBRAN 
      00B2A5 84 CD                    2     .word FSLASH8 
                                    954 ; get fractional digits from remainder until mantissa saturate
                                    955 ; remainder mantissa R: e divisor 
                                    956 ; check for mantissa saturation 
      00B2A7 85 34 B2         [ 4]  957     CALL DDUP 
      0033C8                        958     _DOLIT 0XCCCC 
      00B2AA 87 04 6F         [ 4]    1     CALL DOLIT 
      00B2AB CC CC                    2     .word 0XCCCC 
      0033CD                        959     _DOLIT 0xC
      00B2AB 81 04 6F         [ 4]    1     CALL DOLIT 
      00B2AC 00 0C                    2     .word 0xC 
      00B2AC 90 93 90         [ 4]  960     CALL DGREAT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 182.
Hexadecimal [24-Bits]



      0033D5                        961     _TBRAN FSLASH8 ; another loop would result in mantissa overflow 
      00B2AF FE A6 0A         [ 4]    1     CALL TBRAN 
      00B2B2 90 62                    2     .word FSLASH8 
                                    962 ; multiply mantissa by 10 
      0033DA                        963     _DOLIT 10 
      00B2B4 FF 90 95         [ 4]    1     CALL DOLIT 
      00B2B7 E6 02                    2     .word 10 
      00B2B9 90 97 A6         [ 4]  964     CALL ZERO 
      00B2BC 0A 90 62         [ 4]  965     CALL DSTAR 
                                    966 ; mutliply remainder by 10     
      00B2BF 90 95 90         [ 4]  967     CALL DSWAP 
      0033E8                        968     _DOLIT 10 
      00B2C2 9F E7 02         [ 4]    1     CALL DOLIT 
      00B2C5 E6 03                    2     .word 10 
      00B2C7 90 97 A6         [ 4]  969     CALL ZERO 
      00B2CA 0A 90 62         [ 4]  970     CALL DSTAR 
                                    971 ; divide remainder by m2     
      00B2CD 90 95 90         [ 4]  972     CALL DRAT  ; mantissa remainder divisor R: e divisor 
      00B2D0 9F E7 03         [ 4]  973     CALL UDSLMOD ; mantissa dr dq R: qs e divisor 
      00B2D3 E6 04 90         [ 4]  974     CALL DSWAP ; mantissa frac_digit remainder R: qs e divisor  
      00B2D6 97 A6 0A         [ 4]  975     CALL DTOR  ; mantissa frac_digit R: qs e divisor remainder 
      00B2D9 90 62 90         [ 4]  976     CALL DPLUS ; mantissa+frac_digit 
      00B2DC 95 90 9F         [ 4]  977     CALL DRFROM ; mantissa remainder R: qs e divisor  
      00B2DF E7 04 E6         [ 4]  978     CALL DSWAP  ; remainder mantissa  
                                    979 ; increment e 
      003408                        980     _DOLIT 2    ; e slot on rstack 
      00B2E2 05 90 97         [ 4]    1     CALL DOLIT 
      00B2E5 A6 0A                    2     .word 2 
      00B2E7 90 62 90         [ 4]  981     CALL NRAT   ;  2 NR@ -- e 
      00B2EA 9F E7 05         [ 4]  982     CALL ONEP   ; increment exponent 
      003413                        983     _DOLIT 2 
      00B2ED 81 B2 79         [ 4]    1     CALL DOLIT 
      00B2F0 03 4D                    2     .word 2 
      00B2F2 4D 2A C4         [ 4]  984     CALL NRSTO  ; e 2 NR! , update e on rstack     
      00B2F4                        985     _BRAN FSLASH1
      00B2F4 CD 88 B1         [ 4]    1     CALL BRAN 
      00B2F7 CD A8                    2     .word FSLASH1 
      003420                        986 FSLASH8: ; remainder mantissa R: qs e divisor 
      00B2F9 A7 CD 85         [ 4]  987     CALL DSWAP  
      00B2FC 26 B3 0A         [ 4]  988     CALL DDROP  ; drop remainder     
      00B2FF CD 28 BC         [ 4]  989     CALL DRFROM
      00B2FF CD A9 E5         [ 4]  990     CALL DDROP  ; drop divisor 
      00B302 CD A8 A7         [ 4]  991     CALL JFETCH    ; quotient sign 
      00342F                        992     _QBRAN FSLASH9 
      00B305 CD 85 18         [ 4]    1     CALL QBRAN
      00B308 B3 15                    2     .word FSLASH9
      00B30A CD 08 96         [ 4]  993     CALL DNEGA  
      003437                        994 FSLASH9:
      00B30A 1C 00 02         [ 4]  995     CALL RFROM  ; exponent 
      00B30D 90 5F FF         [ 4]  996     CALL STEXP 
      00B310 EF 02 EF         [ 4]  997     CALL RFROM 
      00B313 04 81 17         [ 4]  998     CALL DROP ; drop qs 
      00B315 81               [ 4]  999     RET 
                                   1000 
                                   1001 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 183.
Hexadecimal [24-Bits]



                                   1002 ;   D>F  ( # -- f# )
                                   1003 ;   convert double to float 
                                   1004 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      003444                       1005     _HEADER DTOF,3,"D>F"
      00B315 CD A6                    1         .word LINK 
                           003446     2         LINK=.
      00B317 C7                       3         .byte 3  
      00B318 CD 86 6A                 4         .ascii "D>F"
      00344A                          5         DTOF:
      00B31B CD A6 B0         [ 4] 1006     CALL DSIGN 
      00B31E CD A7 D2         [ 4] 1007     CALL TOR
      00B321 CD A6 C7         [ 4] 1008     CALL DABS  
      003453                       1009 DTOF1:      
      00B324 CD 85 B4         [ 4] 1010     CALL SCALETOM 
      00B327 CD 87 27         [ 4] 1011     CALL RFROM
      003459                       1012     _QBRAN DTOF2 
      00B32A CD 86 6A         [ 4]    1     CALL QBRAN
      00B32D CD A6                    2     .word DTOF2
      00B32F B0 CD A9         [ 4] 1013     CALL DNEGA 
      003461                       1014 DTOF2: 
      00B332 1E CD 86         [ 4] 1015     CALL ROT 
      00B335 A1 CD 85         [ 4] 1016     CALL STEXP 
      00B338 C5               [ 4] 1017     RET 
                                   1018 
                                   1019 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1020 ;   F>D  ( f# -- # )
                                   1021 ;  convert float to double 
                                   1022 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      003468                       1023     _HEADER FTOD,3,"F>D"
      00B339 CD 8B                    1         .word LINK 
                           00346A     2         LINK=.
      00B33B 74                       3         .byte 3  
      00B33C CD 8C 61                 4         .ascii "F>D"
      00346E                          5         FTOD:
      00B33F CD 86 B1         [ 4] 1024     CALL ATEXP ; m e 
      00B342 CD A7 D2         [ 4] 1025     CALL QDUP
      003474                       1026     _QBRAN FTOD9
      00B345 CD 86 C9         [ 4]    1     CALL QBRAN
      00B348 CD 85                    2     .word FTOD9
      00B34A B4 CD 8B         [ 4] 1027     CALL TOR 
      00B34D 2A CD A7         [ 4] 1028     CALL DSIGN 
      00B350 D2 CD 85         [ 4] 1029     CALL NROT 
      00B353 C5 CD 8B         [ 4] 1030     CALL DABS
      00B356 2A CD 88         [ 4] 1031     CALL RFROM  
      00B359 65 CD 86         [ 4] 1032     CALL DUPP   
      00B35C 6A CD AB         [ 4] 1033     CALL ZLESS 
      00348E                       1034     _QBRAN FTOD4 
      00B35F DF CD AB         [ 4]    1     CALL QBRAN
      00B362 DF CD                    2     .word FTOD4
                                   1035 ; negative exponent 
      00B364 A9 3C CD         [ 4] 1036     CALL ABSS 
      00B367 8B 2A CD         [ 4] 1037     CALL TOR
      003499                       1038     _BRAN FTOD2  
      00B36A A9 1E 90         [ 4]    1     CALL BRAN 
      00B36D 93 90                    2     .word FTOD2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 184.
Hexadecimal [24-Bits]



      00349E                       1039 FTOD1:
      00B36F EE 02 72         [ 4] 1040     CALL DDUP 
      00B372 F9 01 17         [ 4] 1041     CALL DZEQUAL 
      0034A4                       1042     _TBRAN FTOD3 
      00B375 01 90 93         [ 4]    1     CALL TBRAN 
      00B378 90 FE                    2     .word FTOD3 
      0034A9                       1043     _DOLIT 10 
      00B37A 24 04 72         [ 4]    1     CALL DOLIT 
      00B37D A9 00                    2     .word 10 
      00B37F 01 26 61         [ 4] 1044     CALL DSLMOD 
      00B380 CD 07 E5         [ 4] 1045     CALL ROT 
      00B380 1D 00 02         [ 4] 1046     CALL DROP
      0034B7                       1047 FTOD2:      
      0034B7                       1048     _DONXT FTOD1
      00B383 FF 90 85         [ 4]    1     CALL DONXT 
      00B386 EF 02                    2     .word FTOD1 
      0034BC                       1049     _BRAN FTOD8   
      00B388 90 85 EF         [ 4]    1     CALL BRAN 
      00B38B 04 CD                    2     .word FTOD8 
      0034C1                       1050 FTOD3: 
      00B38D 8C 61 CD         [ 4] 1051     CALL RFROM 
      00B390 86 6A 17         [ 4] 1052     CALL DROP 
      00B392                       1053     _BRAN FTOD8  
      00B392 CD 88 54         [ 4]    1     CALL BRAN 
      00B395 CD 85                    2     .word FTOD8 
                                   1054 ; positive exponent 
      0034CC                       1055 FTOD4:
      00B397 18 B3 AB         [ 4] 1056     CALL TOR 
      0034CF                       1057     _BRAN FTOD6
      00B39A CD B2 AC         [ 4]    1     CALL BRAN 
      00B39D CD 85                    2     .word FTOD6 
      0034D4                       1058 FTOD5:
      00B39F B4 CD 8B         [ 4] 1059     CALL DDUP 
      0034D7                       1060     _DOLIT 0XCCCC
      00B3A2 F5 CD 86         [ 4]    1     CALL DOLIT 
      00B3A5 6A CD                    2     .word 0XCCCC 
      0034DC                       1061     _DOLIT 0XCCC  
      00B3A7 85 34 B3         [ 4]    1     CALL DOLIT 
      00B3AA 92 CC                    2     .word 0XCCC 
      00B3AB CD 28 61         [ 4] 1062     CALL DGREAT 
      0034E4                       1063     _TBRAN FTOD3 
      00B3AB CD 85 B4         [ 4]    1     CALL TBRAN 
      00B3AE CD 88                    2     .word FTOD3 
      0034E9                       1064     _DOLIT 10 
      00B3B0 84 CD B2         [ 4]    1     CALL DOLIT 
      00B3B3 81 CD                    2     .word 10 
      00B3B5 A9 1E CD         [ 4] 1065     CALL ZERO 
      00B3B8 88 C6 CD         [ 4] 1066     CALL DSTAR 
      0034F4                       1067 FTOD6: 
      0034F4                       1068     _DONXT FTOD5 
      00B3BB A9 3C CD         [ 4]    1     CALL DONXT 
      00B3BE 85 B4                    2     .word FTOD5 
      0034F9                       1069 FTOD8:
      00B3C0 CD 85 18         [ 4] 1070     CALL ROT 
      0034FC                       1071     _QBRAN FTOD9 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 185.
Hexadecimal [24-Bits]



      00B3C3 B3 C8 CD         [ 4]    1     CALL QBRAN
      00B3C6 89 16                    2     .word FTOD9
      00B3C8 CD 08 96         [ 4] 1072     CALL DNEGA
      003504                       1073 FTOD9:          
      00B3C8 CD               [ 4] 1074     RET 
                                   1075 
                                   1076 
                                   1077 ;;;;;;;;;;;;;;;;;;;;;;;;
                                   1078 ;   F0< ( f# -- f )
                                   1079 ;   true if f#<0
                                   1080 ;;;;;;;;;;;;;;;;;;;;;;;;
      003505                       1081     _HEADER FZLESS,3,"F0<"
      00B3C9 88 65                    1         .word LINK 
                           003507     2         LINK=.
      00B3CB 81                       3         .byte 3  
      00B3CC B2 F0 02                 4         .ascii "F0<"
      00350B                          5         FZLESS:
      00B3CF 46 2A 31         [ 4] 1082     CALL ATEXP 
      00B3D1 CD 06 17         [ 4] 1083     CALL DROP 
      00B3D1 CD AD B1         [ 4] 1084     CALL SWAPP 
      00B3D4 CD 86 6A         [ 4] 1085     CALL DROP 
      00B3D7 CD A7 D2         [ 4] 1086     CALL ZLESS 
      00B3DA CD               [ 4] 1087     RET
                                   1088 
                                   1089 ;;;;;;;;;;;;;;;;;;;;;;;;
                                   1090 ;   F< ( f#1 f#2 -- f )
                                   1091 ; true if f#1 < f#1 
                                   1092 ;;;;;;;;;;;;;;;;;;;;;;;
      00351B                       1093     _HEADER FLESS,2,"F<"
      00B3DB AD B1                    1         .word LINK 
                           00351D     2         LINK=.
      00B3DD CD                       3         .byte 2  
      00B3DE 85 B4                    4         .ascii "F<"
      003520                          5         FLESS:
      00B3E0 CD 88 C6         [ 4] 1094     CALL FSUB  
      00B3E3 CD 86 6A         [ 2] 1095     JP FZLESS
                                   1096 
                                   1097 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1098 ;   F> ( f#1 f#2 -- f )
                                   1099 ;   true fi f#1>f#2
                                   1100 ;;;;;;;;;;;;;;;;;;;;;;;;;
      003526                       1101     _HEADER FGREAT,2,"F>"
      00B3E6 CD B2                    1         .word LINK 
                           003528     2         LINK=.
      00B3E8 F4                       3         .byte 2  
      00B3E9 CD 85                    4         .ascii "F>"
      00352B                          5         FGREAT:
      00B3EB B4 CD 88         [ 4] 1102     CALL DSWAP 
      00B3EE C6 CD AD         [ 2] 1103     JP FLESS 
                                   1104 
                                   1105 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1106 ;   F= ( f#1 f#2 -- f ) 
                                   1107 ;   true fi f#1==f#2 
                                   1108 ;;;;;;;;;;;;;;;;;;;;;;;;;
      003531                       1109     _HEADER FEQUAL,2,"F="
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 186.
Hexadecimal [24-Bits]



      00B3F1 E3 81                    1         .word LINK 
                           003533     2         LINK=.
      00B3F3 B3                       3         .byte 2  
      00B3F4 CE 02                    4         .ascii "F="
      003536                          5         FEQUAL:
      00B3F6 46 2F 40         [ 2] 1110     JP DEQUAL 
                                   1111 
                                   1112 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1113 ;   F0= ( f# -- f )
                                   1114 ;   true if f# is 0.0 
                                   1115 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      00B3F8                       1116     _HEADER FZEQUAL,3,"F0="
      00B3F8 CD AD                    1         .word LINK 
                           00353B     2         LINK=.
      00B3FA B1                       3         .byte 3  
      00B3FB CD 86 6A                 4         .ascii "F0="
      00353F                          5         FZEQUAL:
      00B3FE CD A6 C7         [ 4] 1117     CALL ATEXP 
      00B401 CD 86 6A         [ 4] 1118     CALL DROP 
      00B404 CD A6 B0         [ 2] 1119     JP DZEQUAL  
                                   1120 
                                   1121 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1122 ;  FNEGATE ( f#1 -- f#2 )
                                   1123 ;  f#2 is negation of f#1 
                                   1124 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      003548                       1125     _HEADER FNEGA,7,"FNEGATE"
      00B407 CD A7                    1         .word LINK 
                           00354A     2         LINK=.
      00B409 D2                       3         .byte 7  
      00B40A CD AD B1 CD 8C 6C CD     4         .ascii "FNEGATE"
      003552                          5         FNEGA:
      00B411 86 23 CD         [ 4] 1126     CALL ATEXP 
      00B414 89 50 CD         [ 4] 1127     CALL TOR 
      00B417 8C 6C CD         [ 4] 1128     CALL DNEGA
      00B41A 86 44 CD         [ 4] 1129     CALL RFROM 
      00B41D A6 C7 CD         [ 4] 1130     CALL STEXP 
      00B420 85 B4 CD         [ 4] 1131     CALL SFN 
      00B423 87               [ 4] 1132     RET 
                                   1133 
                                   1134 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1135 ;  FABS ( f#1 -- abs(f#1) )
                                   1136 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      003565                       1137     _HEADER FABS,4,"FABS"
      00B424 27 CD                    1         .word LINK 
                           003567     2         LINK=.
      00B426 85                       3         .byte 4  
      00B427 B4 CD A9 1E              4         .ascii "FABS"
      00356C                          5         FABS:
      00B42B CD A6 B0         [ 4] 1138     CALL ATEXP 
      00B42E CD A7 D2         [ 4] 1139     CALL TOR 
      00B431 CD 88 B1         [ 4] 1140     CALL DUPP 
      003575                       1141     _DOLIT 0X80 
      00B434 CD A9 1E         [ 4]    1     CALL DOLIT 
      00B437 CD AA                    2     .word 0X80 
      00B439 EE 06 7E         [ 4] 1142     CALL ANDD 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 187.
Hexadecimal [24-Bits]



      00B43A                       1143     _QBRAN FABS1
      00B43A CD A9 E5         [ 4]    1     CALL QBRAN
      00B43D CD A8                    2     .word FABS1
      00B43F A7 CD 85         [ 4] 1144     CALL DNEGA 
      003585                       1145 FABS1: 
      00B442 26 B4 A0         [ 4] 1146     CALL RFROM 
      00B445 CD 88 B1         [ 4] 1147     CALL STEXP 
      00B448 CD 84 EF         [ 4] 1148     CALL SFN 
      00B44B CC               [ 4] 1149     RET 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 188.
Hexadecimal [24-Bits]



                                   4516 .endif 
                                   4517 
                                   4518 ;===============================================================
                                   4519 
                           003567  4520 LASTN =	LINK   ;last name defined
                                   4521 
                                   4522 ; application code begin here
      003600                       4523 	.bndry 128 ; align on flash block  
      003600                       4524 app_space: 
                                   4525 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 189.
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
  6 AT         0004E3 R   |   6 ATEXE      000CF4 R   |   6 ATEXP      002D31 R
  6 ATEXP1     002D46 R   |   6 ATEXP2     002D56 R   |   6 AUTORUN    000129 R
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
  6 BRAN       0004B4 R   |     BTW     =  000001     |   6 BUF2ROW    00214F R
  6 BYE        0000B6 R   |     CADR    =  000003     |     CALLL   =  0000CD 
  6 CALLOT     002398 R   |     CAN_DGR =  005426     |     CAN_FPSR=  005427 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 190.
Hexadecimal [24-Bits]

Symbol Table

    CELLL   =  000002     |   6 CELLM      000B59 R   |   6 CELLP      000B4A R
  6 CELLS      000B68 R   |     CFG_GCR =  007F60     |     CFG_GCR_=  000001 
    CFG_GCR_=  000000     |   6 CHAR1      000F31 R   |   6 CHAR2      000F34 R
  6 CHKIVEC    00203D R   |     CLKOPT  =  004807     |     CLKOPT_C=  000002 
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
  6 COLD       001B3E R   |   6 COLD1      001B3E R   |   6 COLON      001849 R
  6 COMMA      001502 R   |   6 COMPI      001547 R   |     COMPO   =  000040 
  6 CONSTANT   0018F3 R   |   6 COUNT      000CA7 R   |   6 CPP        000786 R
    CPU_A   =  007F00     |     CPU_CCR =  007F0A     |     CPU_PCE =  007F01 
    CPU_PCH =  007F02     |     CPU_PCL =  007F03     |     CPU_SPH =  007F08 
    CPU_SPL =  007F09     |     CPU_XH  =  007F04     |     CPU_XL  =  007F05 
    CPU_YH  =  007F06     |     CPU_YL  =  007F07     |   6 CR         000F59 R
  6 CREAT      00188F R   |     CRR     =  00000D     |   6 CSTOR      0004F0 R
  6 CTABLE     0023B9 R   |   6 CTAT       0023DA R   |   6 CTINIT     002402 R
  6 D2SLASH    00297E R   |   6 D2STAR     002995 R   |   6 DABS       002630 R
  6 DABS1      00263E R   |   6 DAT        000C8B R   |     DATSTK  =  001680 
  6 DBLVER     002486 R   |   6 DCLZ       002780 R   |   6 DCLZ1      002789 R
  6 DCLZ4      002792 R   |   6 DCLZ8      00279F R   |   6 DCONST     001928 R
  6 DDIG       0026A2 R   |   6 DDIGS      0026BB R   |   6 DDOT       0026D2 R
  6 DDOT0      0026E6 R   |   6 DDOT1      0026FC R   |   6 DDROP      000826 R
  6 DDSLMOD    002B20 R   |   6 DDSTAR3    002A64 R   |   6 DDUP       000831 R
    DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF     |   6 DECIM      000E8B R
  6 DEPTH      000C23 R   |   6 DEQU4      002855 R   |   6 DEQUAL     002840 R
    DEVID_BA=  0048CD     |     DEVID_EN=  0048D8     |     DEVID_LO=  0048D2 
    DEVID_LO=  0048D3     |     DEVID_LO=  0048D4     |     DEVID_LO=  0048D5 
    DEVID_LO=  0048D6     |     DEVID_LO=  0048D7     |     DEVID_LO=  0048D8 
    DEVID_WA=  0048D1     |     DEVID_XH=  0048CE     |     DEVID_XL=  0048CD 
    DEVID_YH=  0048D0     |     DEVID_YL=  0048CF     |   6 DGREAT     002861 R
  6 DGTQ1      000ED0 R   |   6 DI         0000C4 R   |   6 DIG        000E04 R
  6 DIGIT      000D9F R   |   6 DIGS       000E15 R   |   6 DIGS1      000E15 R
  6 DIGS2      000E22 R   |   6 DIGTQ      000E9F R   |     DISCOVER=  000000 
  6 DLESS      00286C R   |   6 DLESS4     002880 R   |   6 DLITER     00293E R
  6 DLSHIFT    0029B1 R   |   6 DLSHIFT1   0029C2 R   |   6 DLSHIFT2   0029D7 R
    DM_BK1RE=  007F90     |     DM_BK1RH=  007F91     |     DM_BK1RL=  007F92 
    DM_BK2RE=  007F93     |     DM_BK2RH=  007F94     |     DM_BK2RL=  007F95 
    DM_CR1  =  007F96     |     DM_CR2  =  007F97     |     DM_CSR1 =  007F98 
    DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A     |   6 DN1        0008B1 R
  6 DNEGA      000896 R   |   6 DOCONST    001913 R   |   6 DOLIT      00046F R
  6 DONXT      000483 R   |     DOORBELL=  000000     |   6 DOSTR      000F69 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 191.
Hexadecimal [24-Bits]

Symbol Table

  6 DOT        001000 R   |   6 DOT1       001016 R   |   6 DOTI1      001A78 R
  6 DOTID      001A62 R   |   6 DOTO1      001458 R   |   6 DOTOK      00143E R
  6 DOTPR      001129 R   |   6 DOTQ       0016C0 R   |   6 DOTQP      000F86 R
  6 DOTR       000F94 R   |   6 DOTS       001A04 R   |   6 DOTS1      001A0F R
  6 DOTS2      001A18 R   |   6 DOVAR      0006D7 R   |   6 DOVER      002965 R
  6 DO_DCONS   00194B R   |   6 DPLUS      002B5F R   |   6 DPLUS1     002B86 R
  6 DRAT       0028D4 R   |   6 DRFROM     0028BC R   |   6 DROP       000617 R
  6 DROT       0027EC R   |   6 DRSHIFT    0029E8 R   |   6 DRSHIFT1   0029EF R
  6 DRSHIFT2   002A05 R   |   6 DSIGN      002647 R   |   6 DSIGN1     002651 R
  6 DSLA9      002B4A R   |   6 DSLASH     002B50 R   |   6 DSLMOD     002661 R
  6 DSLMOD3    00267C R   |   6 DSLMOD4    002688 R   |   6 DSLMODa    002683 R
  6 DSLMODb    00268E R   |   6 DSSTAR     00272C R   |   6 DSSTAR3    002749 R
  6 DSTAR      002A0B R   |   6 DSTOR      000C72 R   |   6 DSUB       002B91 R
  6 DSUB1      002BB8 R   |   6 DSWAP      002752 R   |   6 DTOF       00344A R
  6 DTOF1      003453 R   |   6 DTOF2      003461 R   |   6 DTOR       00289E R
  6 DUMP       0019BA R   |   6 DUMP1      0019D1 R   |   6 DUMP3      0019F3 R
  6 DUMPP      001989 R   |   6 DUPP       000621 R   |   6 DVARIA     0028F2 R
    DVER_MAJ=  000001     |     DVER_MIN=  000000     |   6 DZEQUAL    002827 R
  6 DZLESS     002887 R   |   6 DZLESS1    002891 R   |   6 EDIGS      000E40 R
  6 EDOT       002DB7 R   |   6 EDOT0      002DCE R   |   6 EDOT2      002DDA R
  6 EDOT3      002DF3 R   |   6 EDOT4      002E1F R   |   6 EDOT5      002E3E R
  6 EECSTORE   001DEE R   |   6 EEPCP      001C14 R   |   6 EEPLAST    001BE7 R
  6 EEPROM     001BCF R   |     EEPROM_B=  004000     |     EEPROM_E=  0047FF 
    EEPROM_R=  000010     |     EEPROM_S=  000800     |   6 EEPRUN     001BFE R
  6 EEPVP      001C2A R   |   6 EESTORE    001E3A R   |   6 EE_CCOMM   002104 R
  6 EE_COMMA   0020E3 R   |   6 EE_CREAD   001D7F R   |   6 EE_READ    001D5D R
  6 EI         0000BD R   |   6 ELSEE      00161F R   |   6 EMIT       000436 R
  6 ENEPER     002324 R   |     EOL_CR  =  000001     |     EOL_LF  =  000000 
  6 EQ1        00090E R   |   6 EQUAL      0008F8 R   |   6 ERASE      000D6D R
    ERR     =  00001B     |   6 EVAL       001481 R   |   6 EVAL1      001481 R
  6 EVAL2      00149D R   |   6 EXE1       000D02 R   |   6 EXECU      0004C4 R
    EXT     =  000000     |     EXTI_CR1=  0050A0     |     EXTI_CR2=  0050A1 
  6 EXTRC      000DC7 R   |   6 FABS       00356C R   |   6 FABS1      003585 R
  6 FADDR      0021D1 R   |   6 FALGN4     00311C R   |   6 FALGN6     00312B R
  6 FALGN7     003152 R   |   6 FALGN71    003161 R   |   6 FALGN72    00317D R
  6 FALGN8     003180 R   |   6 FALIGN     0030E3 R   |   6 FARAT      001C95 R
  6 FARCAT     001CA1 R   |   6 FC_XOFF    000463 R   |   6 FC_XON     00044D R
  6 FDOT       002E4D R   |   6 FDOT0      002E8B R   |   6 FDOT1      002E7A R
  6 FDOT10     002EE7 R   |   6 FDOT2      002E99 R   |   6 FDOT3      002EB2 R
  6 FDOT6      002EC2 R   |   6 FDOT7      002EC7 R   |   6 FDOT8      002ECF R
  6 FDOT9      002ED7 R   |   6 FEQUAL     003536 R   |   6 FER        002C4F R
  6 FGREAT     00352B R   |     FHSE    =  7A1200     |     FHSI    =  F42400 
  6 FILL       000D3A R   |   6 FILL1      000D57 R   |   6 FILL2      000D60 R
  6 FIND       00121F R   |   6 FIND1      00123D R   |   6 FIND2      00126B R
  6 FIND3      001277 R   |   6 FIND4      00128B R   |   6 FIND5      001298 R
  6 FIND6      00127C R   |   6 FINIT      002C45 R   |     FLASH_BA=  008000 
    FLASH_CR=  00505A     |     FLASH_CR=  000002     |     FLASH_CR=  000000 
    FLASH_CR=  000003     |     FLASH_CR=  000001     |     FLASH_CR=  00505B 
    FLASH_CR=  000005     |     FLASH_CR=  000004     |     FLASH_CR=  000007 
    FLASH_CR=  000000     |     FLASH_CR=  000006     |     FLASH_DU=  005064 
    FLASH_DU=  0000AE     |     FLASH_DU=  000056     |     FLASH_EN=  027FFF 
    FLASH_FP=  00505D     |     FLASH_FP=  000000     |     FLASH_FP=  000001 
    FLASH_FP=  000002     |     FLASH_FP=  000003     |     FLASH_FP=  000004 
    FLASH_FP=  000005     |     FLASH_IA=  00505F     |     FLASH_IA=  000003 
    FLASH_IA=  000002     |     FLASH_IA=  000006     |     FLASH_IA=  000001 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 192.
Hexadecimal [24-Bits]

Symbol Table

    FLASH_IA=  000000     |     FLASH_NC=  00505C     |     FLASH_NF=  00505E 
    FLASH_NF=  000000     |     FLASH_NF=  000001     |     FLASH_NF=  000002 
    FLASH_NF=  000003     |     FLASH_NF=  000004     |     FLASH_NF=  000005 
    FLASH_PU=  005062     |     FLASH_PU=  000056     |     FLASH_PU=  0000AE 
    FLASH_SI=  020000     |     FLASH_WS=  00480D     |   6 FLESS      003520 R
  6 FLOATQ     002F5F R   |   6 FLOATQ0    002F69 R   |   6 FLOATQ1    002FCE R
  6 FLOATQ2    002FD7 R   |   6 FLOATQ3    002FDF R   |   6 FLOATQ4    002FF3 R
  6 FLOAT_ER   00300E R   |   6 FLOAT_ER   00300B R   |     FLOAT_MA=  000001 
    FLOAT_MI=  000000     |     FLSI    =  01F400     |   6 FMOVE      0021DC R
  6 FMOVE2     00220D R   |   6 FNE        002C72 R   |   6 FNEGA      003552 R
  6 FOR        001591 R   |   6 FORGET     00015A R   |   6 FORGET1    000189 R
  6 FORGET2    00020F R   |   6 FORGET4    000218 R   |   6 FORGET6    0001D1 R
  6 FOV        002C8D R   |   6 FPLUS      00318C R   |   6 FPLUS1     0031AC R
  6 FPSTOR     001BB0 R   |   6 FPSW       002C21 R   |     FPTR    =  000034 
  6 FREEVAR    000225 R   |   6 FREEVAR4   00025B R   |   6 FRESET     002C33 R
  6 FSLASH     003378 R   |   6 FSLASH1    0033BA R   |   6 FSLASH8    003420 R
  6 FSLASH9    003437 R   |   6 FSTAR      003351 R   |   6 FSUB       0031BE R
  6 FSUB1      0031DE R   |   6 FTOD       00346E R   |   6 FTOD1      00349E R
  6 FTOD2      0034B7 R   |   6 FTOD3      0034C1 R   |   6 FTOD4      0034CC R
  6 FTOD5      0034D4 R   |   6 FTOD6      0034F4 R   |   6 FTOD8      0034F9 R
  6 FTOD9      003504 R   |   6 FVER       002BCA R   |   6 FZE        002C5C R
  6 FZEQUAL    00353F R   |   6 FZLESS     00350B R   |     GPIO_BAS=  005000 
    GPIO_CR1=  000003     |     GPIO_CR2=  000004     |     GPIO_DDR=  000002 
    GPIO_IDR=  000001     |     GPIO_ODR=  000000     |     GPIO_SIZ=  000005 
  6 GREAT      000973 R   |   6 GREAT1     000989 R   |   6 HDOT       000FE3 R
  6 HERE       000CBE R   |   6 HEX        000E76 R   |   6 HI         001AF3 R
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
  6 IFMOVE     0022B5 R   |     IMEDD   =  000080     |   6 IMMED      00186C R
  6 INCH       00042A R   |   6 INC_FPTR   001D2A R   |   6 INITOFS    001822 R
  6 INN        000705 R   |     INPUT_DI=  000000     |     INPUT_EI=  000001 
    INPUT_FL=  000000     |     INPUT_PU=  000001     |   6 INTE1      001420 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 193.
Hexadecimal [24-Bits]

Symbol Table

  6 INTER      0013F6 R   |   6 INTQ       00245E R   |     INT_ADC2=  000016 
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
  6 INVER      000873 R   |     IPR0    =  000002     |     IPR1    =  000001 
    IPR2    =  000000     |     IPR3    =  000003     |     IPR_MASK=  000003 
    IRET_COD=  000080     |   6 ISEMI      0017B7 R   |     ITC_SPR1=  007F70 
    ITC_SPR2=  007F71     |     ITC_SPR3=  007F72     |     ITC_SPR4=  007F73 
    ITC_SPR5=  007F74     |     ITC_SPR6=  007F75     |     ITC_SPR7=  007F76 
    ITC_SPR8=  007F77     |     IWDG_KR =  0050E0     |     IWDG_PR =  0050E1 
    IWDG_RLR=  0050E2     |   6 JFETCH     0015BA R   |   6 JSRC       00180C R
  6 KEY        000EDF R   |   6 KTAP       001310 R   |   6 KTAP1      001333 R
  6 KTAP2      001336 R   |   6 LAST       000796 R   |   6 LASTN   =  003567 R
  6 LBRAC      00142D R   |     LED2_BIT=  000005     |     LED2_MAS=  000020 
    LED2_POR=  00500A     |   6 LESS       000935 R   |     LF      =  00000A 
  6 LINK    =  003567 R   |   6 LITER      001569 R   |   6 LN2S       002380 R
  6 LOCAL      000554 R   |   6 LOCK       001D16 R   |   6 LOG2S      00236A R
  6 LSCALE     00302D R   |   6 LSHIFT     000B93 R   |   6 LSHIFT1    000B9C R
  6 LSHIFT4    000BA4 R   |   6 LT1        00094B R   |     MASKK   =  001F7F 
  6 MAX        000993 R   |   6 MAX1       0009A6 R   |     MAX_MANT=  7FFFFF 
  6 MIN        0009B0 R   |   6 MIN1       0009C3 R   |   6 MMOD1      000A4C R
  6 MMOD2      000A60 R   |   6 MMOD3      000A77 R   |   6 MMSM1      000A07 R
  6 MMSM3      000A0B R   |   6 MMSM4      000A17 R   |   6 MMSMa      000A12 R
  6 MMSMb      000A1D R   |   6 MMSTA1     00327F R   |   6 MMSTA2     00328A R
  6 MMSTA3     003295 R   |   6 MMSTA4     003300 R   |   6 MMSTA5     003312 R
  6 MMSTA6     00332B R   |   6 MMSTA7     003348 R   |   6 MMSTAR     003274 R
  6 MODD       000A91 R   |   6 MONE       000BFA R   |     MS      =  000030 
  6 MSEC       0002D0 R   |   6 MSMOD      000A2F R   |   6 MSTA1      000B22 R
  6 MSTAR      000AFF R   |     NAFR    =  004804     |   6 NAMEQ      0012B8 R
  6 NAMET      0011C9 R   |     NCLKOPT =  004808     |   6 NDROT      0027B0 R
  6 NEGAT      000884 R   |   6 NEX1       000490 R   |   6 NEXT       0015A0 R
    NFLASH_W=  00480E     |     NHSECNT =  00480A     |     NOPT1   =  004802 
    NOPT2   =  004804     |     NOPT3   =  004806     |     NOPT4   =  004808 
    NOPT5   =  00480A     |     NOPT6   =  00480C     |     NOPT7   =  00480E 
    NOPTBL  =  00487F     |   6 NRAT       0005A3 R   |   6 NRDROP     00057D R
  6 NROT       000804 R   |   6 NRSTO      0005C4 R   |   6 NTIB       000715 R
    NUBC    =  004802     |     NUCLEO  =  000001     |   6 NUFQ       000EF5 R
  6 NUFQ1      000F0E R   |   6 NUMBQ      002568 R   |   6 NUMQ0      0025A9 R
  6 NUMQ1      0025CB R   |   6 NUMQ3      0025F5 R   |   6 NUMQ4      002616 R
  6 NUMQ8      00261F R   |     NWDGOPT =  004806     |     NWDGOPT_=  FFFFFFFD 
    NWDGOPT_=  FFFFFFFC     |     NWDGOPT_=  FFFFFFFF     |     NWDGOPT_=  FFFFFFFE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 194.
Hexadecimal [24-Bits]

Symbol Table

  6 NonHandl   000000 R   |   6 OFFSET     0007BB R   |     OFS     =  000005 
  6 ONE        000BEC R   |   6 ONEM       000B82 R   |   6 ONEP       000B75 R
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
  6 PARSE      0010FA R   |   6 PARSEXP_   002F42 R   |   6 PAUSE      0002E0 R
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
    PI      =  000028     |   6 PICK       000C3A R   |   6 PII        0022E3 R
    PI_BASE =  005028     |     PI_CR1  =  00502B     |     PI_CR2  =  00502C 
    PI_DDR  =  00502A     |     PI_IDR  =  005029     |     PI_ODR  =  005028 
  6 PLUS       000846 R   |   6 PNAM1      00172A R   |   6 PRESE      0014AC R
  6 PRINT_VE   001AC3 R   |     PROD1   =  000024     |     PROD2   =  000026 
    PROD3   =  000028     |   6 PROTECTE   000201 R   |   6 PRT_LICE   001AAF R
  6 PSTOR      000C51 R   |     PTR16   =  000035     |     PTR8    =  000036 
  6 PTRPLUS    001D42 R   |   6 QBRAN      000498 R   |   6 QDUP       0007D4 R
  6 QDUP1      0007DE R   |   6 QKEY       000418 R   |   6 QSTAC      001464 R
  6 QUERY      001390 R   |   6 QUEST      001023 R   |   6 QUIT       0014C9 R
  6 QUIT1      0014D1 R   |   6 QUIT2      0014D4 R   |   6 RAM2EE     00217D R
    RAMBASE =  000000     |   6 RAMLAST    0007A9 R   |     RAM_BASE=  000000 
    RAM_END =  0017FF     |     RAM_SIZE=  001800     |   6 RANDOM     00027E R
  6 RAT        000545 R   |   6 RBRAC      0017F9 R   |   6 REPEA      001674 R
  6 RFREE      002164 R   |   6 RFROM      000534 R   |     ROP     =  004800 
  6 ROT        0007E5 R   |   6 ROW2BUF    002126 R   |     ROWBUFF =  001680 
    RP0     =  00002E     |   6 RPAT       000511 R   |     RPP     =  0017FF 
  6 RPSTO      00051E R   |   6 RSCALE     003051 R   |   6 RSHIFT     000BAF R
  6 RSHIFT1    000BB8 R   |   6 RSHIFT4    000BC0 R   |     RST_SR  =  0050B3 
  6 RT12_2     002353 R   |   6 SAME1      0011E7 R   |   6 SAME2      001210 R
  6 SAMEQ      0011DF R   |   6 SCAL1      003207 R   |   6 SCAL2      00322B R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 195.
Hexadecimal [24-Bits]

Symbol Table

  6 SCALDN2    0030D5 R   |   6 SCALDN3    0030D8 R   |   6 SCALEDOW   0030A9 R
  6 SCALETOM   003201 R   |   6 SCALEUP    003072 R   |   6 SCALEUP2   0030A5 R
  6 SCALEUP3   0030A8 R   |   6 SCOM1      00175F R   |   6 SCOM2      001762 R
  6 SCOMP      001741 R   |   6 SEED       000265 R   |     SEEDX   =  000038 
    SEEDY   =  00003A     |   6 SEMIS      001795 R   |   6 SETISP     0000D0 R
  6 SET_RAML   0018DC R   |   6 SFN        002CE4 R   |     SFR_BASE=  005000 
    SFR_END =  0057FF     |   6 SFV        002D18 R   |   6 SFZ        002CAD R
  6 SIGN       000E2A R   |   6 SIGN1      000E3A R   |   6 SLASH      000A9B R
  6 SLMOD      000A7F R   |   6 SNAME      0016F4 R   |     SP0     =  00002C 
  6 SPACE      000F17 R   |   6 SPACS      000F26 R   |   6 SPAT       000601 R
    SPI_CR1 =  005200     |     SPI_CR2 =  005201     |     SPI_CRCP=  005205 
    SPI_DR  =  005204     |     SPI_ICR =  005202     |     SPI_RXCR=  005206 
    SPI_SR  =  005203     |     SPI_TXCR=  005207     |     SPP     =  001680 
    SPSAVE  =  000001     |   6 SPSTO      00060E R   |   6 SQRT10     00233C R
  6 SQRT2      0022FA R   |   6 SQRT3      002311 R   |   6 SSMOD      000B2B R
    SSP     =  000001     |     STACK   =  0017FF     |   6 STAR       000AF4 R
  6 STASL      000B3C R   |   6 STEXP      002D63 R   |   6 STEXP1     002D79 R
  6 STEXP2     002DA3 R   |   6 STOD       0008B9 R   |   6 STORE      0004D1 R
  6 STR        000E58 R   |   6 STRCQ      001571 R   |   6 STRQ       0016B3 R
  6 STRQP      000F82 R   |   6 SUBB       0008D0 R   |   6 SWAPP      000631 R
    SWIM_CSR=  007F80     |   6 TAP        0012FA R   |   6 TBOOT      001B32 R
  6 TBRAN      0004A6 R   |   6 TBUF       000725 R   |     TBUFFBAS=  001680 
  6 TCHAR      000C0B R   |   6 TEMP       0006F6 R   |   6 TEVAL      000748 R
  6 TFLASH     000737 R   |   6 THENN      00160C R   |   6 TIB        000CE0 R
    TIBB    =  001700     |     TIBBASE =  001700     |     TIC     =  000027 
  6 TICK       0014E0 R   |     TIM1_ARR=  005262     |     TIM1_ARR=  005263 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 196.
Hexadecimal [24-Bits]

Symbol Table

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
    TIM_CR1_=  000001     |     TIM_CR1_=  000002     |   6 TNAM2      001A32 R
  6 TNAM3      001A50 R   |   6 TNAM4      001A56 R   |   6 TNAME      001A2F R
  6 TOFLASH    000335 R   |   6 TOKEN      0011BB R   |   6 TOR        0005EA R
  6 TORAM      000375 R   |   6 TRUE       000861 R   |     TRUEE   =  00FFFF 
  6 TWOSL      000BC7 R   |   6 TYPE1      000F46 R   |   6 TYPE2      000F4C R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 197.
Hexadecimal [24-Bits]

Symbol Table

  6 TYPES      000F41 R   |   6 Timer4Ha   000005 R   |     UART1   =  000000 
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
  6 UDIV10     00322C R   |   6 UDOT       000FCF R   |   6 UDOTR      000FAF R
  6 UDSLA3     002AA3 R   |   6 UDSLA4     002AC9 R   |   6 UDSLA7     002AFA R
  6 UDSLA8     002B05 R   |   6 UDSLMOD    002A6E R   |   6 UDSSTAR    00270A R
  6 UEND       000047 R   |     UFPSW   =  000008     |   6 UGREAT     000954 R
  6 UGREAT1    00096B R   |     UHLD    =  000014     |     UINN    =  00000C 
    UINTER  =  000012     |     ULAST   =  00001C     |   6 ULES1      00092D R
  6 ULESS      000917 R   |   6 UMMOD      0009EB R   |   6 UMOD10     0031EB R
  6 UMSTA      000AAA R   |   6 UNIQ1      0016F1 R   |   6 UNIQU      0016D2 R
  6 UNLKEE     001CB0 R   |   6 UNLKFL     001CCF R   |   6 UNLOCK     001CEE R
  6 UNTIL      0015D4 R   |     UOFFSET =  00001E     |   6 UPDATCP    001C6D R
  6 UPDATLAS   001C44 R   |   6 UPDATPTR   002270 R   |   6 UPDATRUN   001C5C R
  6 UPDATVP    001C84 R   |   6 UPL1       0006D3 R   |   6 UPLUS      0006BC R
    UPP     =  000006     |   6 UPPER      00117E R   |   6 UPPER1     0011A1 R
  6 UPPER2     0011AA R   |     URLAST  =  000022     |     USR_BTN_=  000004 
    USR_BTN_=  000010     |     USR_BTN_=  005015     |     UTFLASH =  000020 
    UTIB    =  000010     |     UTMP    =  00000A     |   6 UTYP1      00196C R
  6 UTYP2      00197B R   |   6 UTYPE      001967 R   |     UVP     =  000018 
  6 UZERO      00002B R   |   6 VARIA      0018A9 R   |     VAR_BASE=  000080 
    VAR_TOP =  0017BF     |     VER     =  000004     |   6 VPP        000778 R
    VSIZE   =  000006     |     WANT_CON=  000001     |     WANT_DEB=  000000 
    WANT_DOU=  000001     |     WANT_FLO=  000001     |     WANT_SCA=  000001 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 198.
Hexadecimal [24-Bits]

Symbol Table

    WANT_SEE=  000000     |     WDGOPT  =  004805     |     WDGOPT_I=  000002 
    WDGOPT_L=  000003     |     WDGOPT_W=  000000     |     WDGOPT_W=  000001 
  6 WHILE      00165A R   |   6 WITHI      0009D0 R   |   6 WORDD      001164 R
  6 WORDS      001A8C R   |   6 WORS1      001A92 R   |   6 WORS2      001AAE R
  6 WR_BYTE    001D99 R   |   6 WR_WORD    001DBE R   |   6 WTABLE     0023C8 R
  6 WTAT       0023EC R   |   6 WTINIT     002431 R   |     WWDG_CR =  0050D1 
    WWDG_WR =  0050D2     |     XMEM_SIZ=  017830     |     XOFF    =  000013 
    XON     =  000011     |   6 XORR       0006A7 R   |     XTEMP   =  000024 
    YTEMP   =  000026     |   6 ZEQ1       002837 R   |   6 ZEQU1      000674 R
  6 ZEQUAL     00066A R   |   6 ZERO       000BE1 R   |   6 ZL1        000661 R
  6 ZLESS      000658 R   |   6 app_spac   003600 R   |   6 baudrate   00037B R
  6 block_er   001E84 R   |   6 clear_ra   000019 R   |   6 clock_in   000064 R
  6 copy_buf   001EE4 R   |   6 copy_buf   001F03 R   |   6 copy_pro   001F03 R
    da      =  000002     |     db      =  000003     |     dc      =  000000 
    dd      =  000001     |   6 do2lit     002949 R   |   6 erase_fl   001EA6 R
  6 fmove_do   002259 R   |   6 main       000016 R   |   6 next_row   002216 R
  6 no_move    002260 R   |   6 nsign      0024DD R   |   6 nsign1     00250E R
  6 parse_di   002515 R   |   6 parse_ex   002EF7 R   |   6 pristine   001F84 R
  6 proceed_   001EA9 R   |   6 reboot     000327 R   |   6 reset_ve   001FEB R
  6 row_eras   001E64 R   |   6 row_eras   001EBD R   |   6 row_eras   001EE4 R
  6 set_opti   001F58 R   |   6 set_vect   00208C R   |   6 uart_ini   000076 R
  6 write_ro   001F28 R

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 199.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 DATA       size      0   flags    8
   2 DATA0      size      0   flags    8
   3 SSEG       size      0   flags    8
   4 SSEG1      size    100   flags    8
   5 HOME       size     80   flags    0
   6 CODE       size   3600   flags    0

